# 文档版本台账

最后更新：2026-04-14

| # | 文档 | 当前版本 | 备注 |
|---|---|---|---|
| 1 | docs/planning/BOC_TDMA_System_Planning.md | v1.2 | §6 阶段 A 扩写为 P0-A 可执行清单；`check_params.m` 输出项与 `matlab/` 目录对齐 |
| 2 | docs/planning/BOC_TDMA_Phased_Implementation_Plan.md | v1.1 | P0 细化为“P0-A 参数自检 + P0-B 硬件链路”；新增版本记录 |
| 3 | docs/phases/tx/P0_USRP_Link_Verification.md | v1.1 | 新增 P0-A 热身关卡定位；头部路径接口更新；新增版本记录 |
| 4 | docs/phases/tx/P1_BOC_Subcarrier_Analysis.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| 5 | docs/phases/tx/P2_Gold_Code_Spreading_Verification.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| 6 | docs/phases/tx/P3_Single_Slot_BOC_Baseband.md | v1.1 | 内容未改，本轮仅迁移到 `docs/phases/tx/` |
| 7 | docs/phases/tx/P4_TDMA_Frame_Generation.md | v1.0 | 内容未改，本轮仅迁移到 `docs/phases/tx/` |
| 8 | docs/phases/tx/P5_USRP_Continuous_Loop_Transmission.md | v1.1 | 头部路径接口迁移到 `docs/` 结构；新增版本记录 |
| 9 | docs/phases/tx/P6_Parameter_Scan_Optimization.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| 10 | docs/phases/rx/P7_RX_Design_Input_and_Phased_Plan.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| — | docs/planning/BOC_TDMA_Doc_System_Review_Report.md | — | 审查报告（参考基准，不计版本） |

## 2026-04-14 本轮整理要点
- 正式文档与图资源迁移到 `docs/` 体系，仓库根目录仅保留入口与治理文件
- 新增 `README.md` 作为项目入口
- 新增 `matlab/check_params.m`，将系统规划 §6 阶段 A 正式落为 `P0-A：参数级自洽检查`
- 所有关键头部路径接口、提示词模板路径接口、版本台账路径接口同步更新
