---
name: resume-application-service
description: Use when a customer needs a targeted resume rewrite, job matching, and assisted or semi-automated application submission based on a target role or JD.
---

# 岗位定向简历与求职申请服务

## Overview

按“资料采集 → 目标确认 → JD 分析 → 匹配评分 → 定向改简历 → 简历评分 → 自动改写循环 → 顾客确认 → 筛选岗位 → 顾客确认投递范围 → 代投递 → 投递总表交付”的顺序服务顾客。默认采用完整内容型简历，参考 `assets/templates/resume-template.docx` 的版式，正式投递版优先做 1.5 到 2 页，不为了压成一页而删掉关键事实。

本 Skill 采用隐私优先原则：公开仓库只保留虚构或脱敏资料，顾客真实资料只在顾客授权的工作环境中处理，不写入仓库、示例、截图或公开日志。

## Required companion skills

**REQUIRED SUB-SKILL:** Use `avoid-ai-writing` for all resume and customer-facing copy before delivery.

Use `documents` when creating or editing DOCX resumes or service documents. Use `spreadsheets` when creating the application tracker.

Read the supporting rules before detailed work:

- `references/resume-writing-rules.md`
- `references/jd-analysis-rules.md`
- `references/application-workflow.md`
- `references/customer-intake-guide.md`
- `references/matching-scorecard.md`
- `references/resume-scorecard.md`
- `references/evidence-discovery.md`
- `references/multi-job-workflow.md`
- `references/document-rendering-qa.md`
- `references/quality-gates.md`
- `references/exception-handling.md`

## Workflow

### 1. 咨询与需求确认

确认目标岗位、工作城市、行业、薪资、岗位级别、入职时间、投递平台、版面密度偏好、服务内容和顾客需要提供的材料。先输出资料完整度和待补充信息；若目标不清，先让顾客选择一个主投方向，不同时承诺多个互不相关的方向。真实姓名、联系方式和照片只用于最终简历，不得进入公开仓库或示例。

### 2. 报价、收款与边界

在开始改写前确认价格、服务周期、修改次数、岗位筛选数量、代投递数量、顾客配合义务、改岗位是否重新报价、取消和售后规则。没有价格或周期信息时标记“待确认”，不要自行编造。

### 3. 信息采集

收集原简历、工作经历、项目经历、教育背景、证书、作品或链接、目标 JD 和个人限制条件。按 `references/evidence-discovery.md` 追问每条经历的时间、动作、对象、工具、个人贡献、结果和可验证数据。缺信息就列问题清单，不补写事实。

### 4. 简历诊断与定向改写

先提取 JD 的职责、硬性条件、关键词和筛选逻辑，再按照 `references/matching-scorecard.md` 计算岗位匹配度，最后将真实经历按相关性重排。使用 `assets/templates/resume-template.docx` 作为默认排版参考：所有正式简历的正文、标题、表格和项目符号统一使用思源黑体（Source Han Sans SC），顶部包含姓名、求职方向、联系方式、邮箱、政治面貌和照片；正文使用蓝色分区标题和横线分隔；结构包含教育经历、工作／实习经历、校园经历、专业技能与证书、荣誉奖项和个人优势。所有标题统一加粗，正文保持正常字重，不对正文内容随意加粗。用具体动作和结果表达，保留原有时间、公司、岗位、数字和事实；不虚构经历，不为了 ATS 堆砌关键词。生成 DOCX/PDF 后按 `references/document-rendering-qa.md` 渲染并逐页检查，再进入评分循环。

### 4.2 多岗位模式

顾客一次提供多个 JD、多个岗位链接或明确提出批量投递时，按 `references/multi-job-workflow.md` 启用多岗位模式。先建立共享经历库和共性缺口，再为每个岗位单独匹配、评分和生成版本；不同方向不得平均拼在同一份简历中。

### 4.1 简历评分与自动改写

简历初稿完成后，必须立即按照 `references/resume-scorecard.md` 评分，不得跳过或只凭主观判断交付。

- 评分达到 80 分：进入顾客审核。
- 评分低于 80 分：针对最低分的两个维度自动改写，然后重新评分。
- 最多自动改写 2 轮，共 3 次评分。每轮都必须保留评分、问题、修改动作和新分数。
- 自动改写只能使用顾客已提供的事实；缺少证据时列为待补充问题，不得为了达到 80 分虚构数字、职责或工具。
- 每轮改写后都使用 `avoid-ai-writing` 做 professional voice 审校，并重新检查事实一致性。
- 两轮后仍低于 80 分时，交付当前最高分版本，同时说明分数、未解决问题和需要顾客补充的证据。

### 5. 顾客审核与定稿

先发初稿让顾客核对事实、时间、数字、岗位名称和联系方式，再按约定修改。需要顾客补充的信息单独列出。顾客确认最终版本后，才进入筛选和代投递。

### 6. 筛选岗位

按已确认的目标岗位、城市、薪资、行业、级别、平台和顾客限制条件筛选。每个岗位记录公司、岗位、城市、薪资、平台、岗位链接、岗位要求摘要和匹配备注。排除已关闭、明显不符或信息不足的岗位。

### 7. 投递授权与代投递

把待投递岗位清单发给顾客确认。没有明确授权，不代投。默认使用半自动模式：可以协助打开岗位、填写重复信息和整理材料，但每个岗位提交前都要保留顾客确认。无法提交、链接失效、验证码或平台要求顾客本人操作时，在表格备注中记录原因，不假报已投递。

### 8. 投递总表交付

代投递完成后，把所有已完成投递的记录写入同一张“投递记录总表”，并发送表格链接。表格字段至少包括：序号、公司、岗位、城市、薪资、投递平台、岗位链接、投递时间、使用简历版本、投递结果或备注。顾客通过一个表格查看全部投递信息，不另行承诺状态跟进。

## Customer-facing boundary language

本服务包含目标岗位分析、简历定向优化、岗位筛选和确认范围内的代投递。代投递完成后提供投递记录总表链接，顾客可自行查看。服务不包含 HR 沟通、进度追踪、面试安排、测评填写或 Offer 跟进。涉及换岗位方向、增加未经提供的经历、超出约定修改次数或增加投递范围时，先暂停并重新确认费用与周期。

## Output checklist

- 最终简历：DOCX，必要时另附 PDF。
- 顾客确认记录：确认最终简历和投递范围。
- 岗位清单：仅保留顾客确认或已明确授权的岗位。
- 岗位匹配评分：每个推荐岗位给出总分、分项分数、匹配证据和风险提示。
- 简历评分记录：初稿分数、每轮自动改写原因、复评分数和最终版本分数。
- 文档渲染检查：DOCX/PDF 页数、字体、分页、表格、照片和链接检查结果。
- 改写对照：至少列出关键改写的原文、改写后内容、修改原因和事实依据。
- 投递记录总表：一张表汇总所有投递信息，岗位链接可点击。
- 服务结束说明：发送表格链接，说明服务边界和资料保存方式。

## Shareable resources

- `assets/templates/resume-template.docx`: 脱敏后的完整排版模板，不含真实姓名、联系方式或照片。
- `assets/examples/anonymized-resume.docx`: 脱敏示例，展示内容密度和版式效果。
- `templates/customer-intake.docx`: 顾客填写的信息采集表。
- `templates/application-tracker.xlsx`: 顾客查看全部投递信息的总表模板。

公开分享前不得把真实顾客简历、电话号码、邮箱、照片、账号、密码、验证码或招聘平台登录信息放进仓库。

## Quality gates

- 不得把顾客未提供的事实写进简历。
- 不得把“岗位链接已记录”写成“已成功投递”，除非确实完成提交。
- 不得把顾客自主查看的岗位状态描述为服务方已跟进的结果。
- 任何换方向、删经历、补经历、超范围修改或超数量投递，都先确认再执行。
- 交付前必须完成 `references/quality-gates.md` 的事实、匹配、隐私、文件和授权检查。
- 简历低于 80 分时必须完成自动改写和复评；达到两轮上限仍低于 80 分时，必须标明分数和证据缺口。
- DOCX/PDF 未完成渲染检查前不得交付；发现截断、溢出、错位、缺字或字体替换时必须先修复。
- 公开分享前扫描文本、文档、表格、图片元数据和 Git 提交信息，不得包含姓名、电话、邮箱、照片、账号、真实岗位记录或可反推身份的组合信息。
- 发布前运行 `scripts/validate_public_release.sh`；检查失败时不得发布。
