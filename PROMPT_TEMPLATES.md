# 提示词模板库（按工具分）


### 模板 A：给 Claude Code（省着用，仅用于跨文档/架构决策）

```
[上下文]
请先读 AI_CONTEXT.md 和 VERSION_LOG.md。
当前阶段:[P0/P1/.../P6]
当前推进状态:[简述,如"P0 步骤 6.3 已完成,准备进入 6.4"]

[任务类型]
- [ ] 跨文档一致性检查
- [ ] 阶段验收评审
- [ ] 重大方案变更
- [ ] 根因分析

[具体任务]
[详细描述]

[输出要求]
- 先给方案/分析,等我确认后再落盘
- 涉及文档修改时,先出 diff 摘要
- 完成后更新 VERSION_LOG.md 和对应文档的版本记录
```

**Claude Code 触发关键词**：跨多份文件、需要架构判断、出现矛盾。其他情况都不用它。

### 模板 B：给 CodeX（主力，写 MATLAB 脚本和单文件任务）

```
[上下文]
参考 AI_CONTEXT.md 中的"关键参数"和"工作原则"。
关联文档:[如 docs/phases/tx/P0_USRP_Link_Verification.md §6.3]

[任务]
生成/修改:[文件路径]
功能:[具体功能描述]

[实现要求]
- 参数取值严格来自 AI_CONTEXT.md 或关联文档,不自行假设
- 文件顶部注释标明:关联文档 + 章节 + 文档版本
- 中文注释,与项目文档风格一致
- [其他特定要求,如"不调用 Communication Toolbox"]

[验证方式]
- [如"运行后应打印 N_slot=9000 ✓"]
```

**实战例子**——P0-A 的 `check_params.m`：

```
参考 AI_CONTEXT.md 中的"关键参数"和"工作原则"。
关联文档:docs/planning/BOC_TDMA_System_Planning.md v1.2 §6 阶段 A

任务:P0-A 生成 matlab/check_params.m

功能:
1. 定义所有系统参数(fs, fc, fsc, Nchip_slot, N_s)
2. 计算所有派生参数(Tc, Nc, Nslot, Tslot, Nframe, Tframe, 处理增益)
3. 逐项与 §6 阶段 A 表中的预期值比对
4. 对子载波非整数采样 fs/fsc=2.4 给出 ⚠️ 标注(预期行为,非错误)
5. 末尾打印一份"参数自洽性检查报告"

实现要求:
- 文件顶部注释:关联 docs/planning/BOC_TDMA_System_Planning.md v1.2 §6 阶段 A
- 中文注释
- 不调用任何 Toolbox 函数
- 输出格式参考文档中的 ✓/⚠️/✗ 风格
```

### 模板 C：给 Copilot（行内补全 + Chat 问答）

**行内补全**：在 .m 文件顶部写一段中文注释说明意图，让 Copilot 自动补全。例：

```matlab
% 关联文档:docs/phases/tx/P1_BOC_Subcarrier_Analysis.md v1.2 §9.2 V1
% 任务:生成方案 B 离散 BOC 子载波 sc_B,长度 9000 点
% 参数:fs=36e6, fsc=15e6, epsilon=1e-10
% 验证点:零值个数=0,平均功率=1.0

fs = 36e6;
fsc = 15e6;
% Copilot 应自动补全后续代码
```

**Copilot Chat 问答**（VSCode 里用 `@workspace` 或 `#file:`）：

```
#file:AI_CONTEXT.md #file:docs/phases/tx/P1_BOC_Subcarrier_Analysis.md

[问题]
[简述现象]
[期望行为 vs 实际行为]
[已尝试的排查]
```

---

## 三、日常工作的"决策树"

每次开工前问自己 3 个问题：

```
Q1: 这件事会改动多份文档吗?
  Yes → 用 Claude Code(省着用)
  No  → 看 Q2

Q2: 这是写代码 / 填表 / 按已知模板执行吗?
  Yes → 用 CodeX 或 Copilot
  No  → 看 Q3

Q3: 这是技术问答或代码调试吗?
  Yes → 用 Copilot Chat(配合 #file: 引用)
  No  → 大概率不需要 AI,自己动手
```

**再加一条经验法则**：如果你能用一句话清楚描述要做什么、参考哪份文档、产出什么文件——这件事 CodeX/Copilot 完全够用。如果你需要花 10 分钟解释背景才能让 AI 理解——这才该用 Claude Code。
