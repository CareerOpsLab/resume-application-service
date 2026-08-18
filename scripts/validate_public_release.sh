#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

required_files=(
  "SKILL.md"
  "README.md"
  "references/matching-scorecard.md"
  "references/resume-scorecard.md"
  "references/evidence-discovery.md"
  "references/multi-job-workflow.md"
  "references/document-rendering-qa.md"
  "references/quality-gates.md"
  "references/exception-handling.md"
  "agents/openai.yaml"
)

for path in "${required_files[@]}"; do
  test -f "$path" || { echo "FAIL: missing $path" >&2; exit 1; }
done

git diff --check

# Public examples may use this fixed placeholder address, but no other email.
if git grep -n -I -E '[[:alnum:]._%+-]+@[[:alnum:].-]+\.[A-Za-z]{2,}' -- . ':!*.docx' ':!*.xlsx' \
  | grep -v 'candidate@example.com' \
  | grep -q .; then
  echo "FAIL: possible email address found in public text" >&2
  exit 1
fi

if git grep -n -I -E '(^|[^0-9])1[3-9][0-9]{9}([^0-9]|$)' -- . ':!*.docx' ':!*.xlsx' | grep -q .; then
  echo "FAIL: possible Chinese mobile number found in public text" >&2
  exit 1
fi

if git grep -n -I -E 'ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|sk-[A-Za-z0-9]{20,}' -- . | grep -q .; then
  echo "FAIL: possible access token found" >&2
  exit 1
fi

while IFS= read -r docx; do
  doc_text=$(unzip -p "$docx" word/document.xml 2>/dev/null \
    | sed 's/<[^>]*>/ /g' \
    || true)
  if printf '%s\n' "$doc_text" \
    | grep -E -i '[[:alnum:]._%+-]+@[[:alnum:].-]+\.[A-Za-z]{2,}|(^|[^0-9])1[3-9][0-9]{9}([^0-9]|$)' \
    | grep -v 'candidate@example.com' \
    | grep -q .; then
    echo "FAIL: possible contact information found in $docx" >&2
    exit 1
  fi
done < <(find assets templates -type f -name '*.docx' -print)

if git log --all --format='%an <%ae> | %cn <%ce>' \
  | grep -E '@' \
  | grep -v 'users.noreply.github.com' \
  | grep -q .; then
  echo "FAIL: commit history contains a non-GitHub-noreply email" >&2
  exit 1
fi

echo "PASS: public release checks completed"
