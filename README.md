# BOC-TDMA 项目入口

本仓库用于推进基于 USRP + MATLAB 的 TDMA + DSSS + BOC(15,3) 发端工程，并为后续接收端设计提供输入。

## 快速导航

- 项目约束与锁定参数：[AI_CONTEXT.md](AI_CONTEXT.md)
- 提示词模板库：[PROMPT_TEMPLATES.md](PROMPT_TEMPLATES.md)
- 文档版本台账：[VERSION_LOG.md](VERSION_LOG.md)
- 顶层系统规划：[docs/planning/BOC_TDMA_System_Planning.md](docs/planning/BOC_TDMA_System_Planning.md)
- 分阶段总规划：[docs/planning/BOC_TDMA_Phased_Implementation_Plan.md](docs/planning/BOC_TDMA_Phased_Implementation_Plan.md)
- 审查报告基线：[docs/planning/BOC_TDMA_Doc_System_Review_Report.md](docs/planning/BOC_TDMA_Doc_System_Review_Report.md)

## 当前建议开工顺序

1. 先读 [AI_CONTEXT.md](AI_CONTEXT.md) 与 [docs/planning/BOC_TDMA_System_Planning.md](docs/planning/BOC_TDMA_System_Planning.md)。
2. 运行 [matlab/check_params.m](matlab/check_params.m) 完成 `P0-A：参数级自洽检查`。
3. 再进入 [docs/phases/tx/P0_USRP_Link_Verification.md](docs/phases/tx/P0_USRP_Link_Verification.md) 的硬件链路验证。

## 目录结构

- `docs/planning/`：顶层规划、总规划、审查报告
- `docs/phases/tx/`：P0–P6 发端阶段文档
- `docs/phases/rx/`：P7 接收端母文档
- `docs/assets/`：图资源
- `matlab/`：MATLAB 脚本入口

## 阶段入口

- 发端阶段入口：[docs/phases/tx/P0_USRP_Link_Verification.md](docs/phases/tx/P0_USRP_Link_Verification.md)
- 接收端阶段入口：[docs/phases/rx/P7_RX_Design_Input_and_Phased_Plan.md](docs/phases/rx/P7_RX_Design_Input_and_Phased_Plan.md)
