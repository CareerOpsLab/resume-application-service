# 简历质量评分表

用于简历初稿完成后的强制评分。评分对象是“当前简历对目标 JD 的可用程度”，不是对顾客个人能力的评价。

## 评分维度

| 维度 | 分值 | 评分依据 |
|---|---:|---|
| JD 对齐 | 30 | 核心职责、硬性条件和关键词是否被真实经历支撑 |
| 经历证据 | 25 | 是否写清动作、对象、方法、规模和结果 |
| 事实可靠 | 20 | 时间、公司、岗位、数字和工具是否可追溯、无冲突 |
| 表达质量 | 15 | 是否具体、简洁、自然，是否完成去 AI 味审校 |
| 结构与可读性 | 10 | 信息层级、版式、长度和 ATS 可读性 |
| **合计** | **100** | |

## 自动改写规则

```text
draft = 初稿
for round in 0..2:
    score = score_resume(draft)
    record(round, score, weakest_dimensions, evidence_gaps)
    if score >= 80:
        stop and send for customer review
    draft = revise_only_from_verified_facts(draft, weakest_dimensions)
    run avoid-ai-writing in professional voice
    verify facts, dates, numbers, tools, and layout
```

自动改写优先顺序：先修事实和 JD 对齐，再补经历证据，最后调整表达和结构。不得通过删除关键经历、堆砌关键词或虚构成果来提高分数。

## 固定输出格式

```text
简历版本：V__
本轮评分：__/100
评分明细：JD 对齐 __/30，经历证据 __/25，事实可靠 __/20，表达质量 __/15，结构与可读性 __/10

主要问题：
- [问题和对应证据]

本轮修改：
- [修改动作和事实依据]

下一步：达到 80 分，进入顾客审核 / 低于 80 分，继续自动改写 / 已达到两轮上限，等待补充信息
```

评分低于 80 分不代表简历不能投递；如果两轮后仍低于 80 分，必须把缺口交给顾客确认，不得继续无限改写。
