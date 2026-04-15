# 文档版本台账

最后更新：2026-04-15

| # | 文档 | 当前版本 | 备注 |
|---|---|---|---|
| 1 | docs/planning/BOC_TDMA_System_Planning.md | v1.2 | §6 阶段 A 扩写为 P0-A 可执行清单；`check_params.m` 输出项与 `matlab/` 目录对齐 |
| 2 | docs/planning/BOC_TDMA_Phased_Implementation_Plan.md | v1.1 | P0 细化为“P0-A 参数自检 + P0-B 硬件链路”；新增版本记录 |
| 3 | docs/phases/tx/P0_USRP_Link_Verification.md | v1.1 | 新增 P0-A 热身关卡定位；头部路径接口更新；新增版本记录 |
| 4 | docs/phases/tx/P1_BOC_Subcarrier_Analysis.md | v1.3 | 明确 `P0-A` 通过即可启动 P1 软件路线，`P0-B` 仅约束 §10 可选硬件验证；补全 §17 / §18 目录入口 |
| 5 | docs/phases/tx/P2_Gold_Code_Spreading_Verification.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| 6 | docs/phases/tx/P3_Single_Slot_BOC_Baseband.md | v1.1 | 内容未改，本轮仅迁移到 `docs/phases/tx/` |
| 7 | docs/phases/tx/P4_TDMA_Frame_Generation.md | v1.0 | 内容未改，本轮仅迁移到 `docs/phases/tx/` |
| 8 | docs/phases/tx/P5_USRP_Continuous_Loop_Transmission.md | v1.1 | 头部路径接口迁移到 `docs/` 结构；新增版本记录 |
| 9 | docs/phases/tx/P6_Parameter_Scan_Optimization.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| 10 | docs/phases/rx/P7_RX_Design_Input_and_Phased_Plan.md | v1.2 | 头部路径接口迁移到 `docs/` 结构 |
| 11 | docs/testing/README.md | v1.2 | 增加与 `artifacts/testing/` 的分工说明，并将 `P1` 索引升级为详版测试清单入口 |
| 12 | docs/testing/templates/ | v1.1 | 阶段测试清单模板与单次执行记录模板；记录模板增加“证据目录路径”字段 |
| 13 | docs/testing/tx/P0_Test_Checklist.md | v1.0 | P0-A/P0-B 详版测试清单 |
| 14 | docs/testing/tx/P1-P6 | P1 v1.1 / P2-P6 v1.0 | `P1` 升级为软件优先详版测试清单，`P2-P6` 仍为骨架 |
| 15 | docs/testing/rx/P7_Input_Readiness_Checklist.md | v1.0 | 接收端输入就绪清单 |
| 16 | docs/testing/rx/PR0-PR7 | v1.0 | 接收端阶段测试清单骨架 |
| 17 | artifacts/testing/README.md | v1.0 | 测试结果归档目录说明、批次命名规则与产物目录结构 |
| 18 | artifacts/testing/tx+rx | v1.0 | 各阶段测试结果骨架目录 |
| 19 | DataSheet/analysis/README.md | v1.1 | 新增 X300/X310 手册分析文档索引 |
| 20 | DataSheet/analysis/usrp_x300_x310_summary_zh.md | v1.0 | X300/X310 手册摘要与当前项目 B210 -> X310 迁移分析 |
| 21 | docs/handoff/HANDOFF_CURRENT.md | v1.5 | 修正当前会话交接单：`retry03` 日志在计时窗口后追加 `underflow`，当前状态改回“P0-B 的 B-08 待补测” |
| 22 | docs/handoff/archive/ | v1.0 | 阶段/子阶段里程碑交接快照归档 |
| 23 | docs/handoff/templates/ | v1.0 | 当前交接单与里程碑快照模板 |
| 24 | matlab/p0_gen_cw.m | v1.0 | P0-B 1 MHz 复单音 CW 生成与 sc16 导出脚本 |
| 25 | artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa | v1.0 | P0-B 无频谱仪预检记录：B210 主路径锁定、36 MSPS 配置成功、CW IQ 已导出 |
| 26 | AI_CONTEXT.md | v1.3 | 修正当前阶段为“P0-A 已通过、P0-B 已完成主峰 / DC / 镜像验证但 B-08 稳定性待重跑”，并保留“命令指导必须附带具体命令”的长期交互约束 |
| 27 | artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation | v1.1 | 修正 P0-B 正式验收记录：保留主峰与 DC / 镜像通过结论，但将 `retry03` 改记为“日志后续追加 underflow，稳定性待补测” |
| — | docs/planning/BOC_TDMA_Doc_System_Review_Report.md | — | 审查报告（参考基准，不计版本） |

## 2026-04-14 本轮整理要点
- 正式文档与图资源迁移到 `docs/` 体系，仓库根目录仅保留入口与治理文件
- 新增 `README.md` 作为项目入口
- 新增 `matlab/check_params.m`，将系统规划 §6 阶段 A 正式落为 `P0-A：参数级自洽检查`
- 所有关键头部路径接口、提示词模板路径接口、版本台账路径接口同步更新
- 新增 `docs/testing/` 目录，建立 TX/RX 阶段测试清单体系与执行记录模板
- 新增 `artifacts/testing/` 目录，建立正式测试结果归档骨架、批次命名规则与证据目录约定
- 新增 `DataSheet/analysis/usrp_x300_x310_summary_zh.md`，结合 X300/X310 规格页与当前项目阶段，分析“先用 B210，再迁移到 X310”的可行性与迁移边界
- 新增 `docs/handoff/` 目录与会话边界交接机制：以 `HANDOFF_CURRENT.md` 承接最新状态，以 `archive/` 归档里程碑，以模板和提示词支持“阶段完成后默认收口并建议新开会话”
- 将 `docs/testing/tx/P1_Test_Checklist.md` 从骨架升级为详版测试清单，并把 `docs/phases/tx/P1_BOC_Subcarrier_Analysis.md` 调整为“`P0-A` 通过即可先走 P1 软件路线”的当前执行口径
- 新增 `matlab/p0_gen_cw.m`，并完成 `P0-B` 的无频谱仪预检：主路径 B210 `serial=193982` 已完成 `36 MSPS` 配置和 `1 MHz` 复单音 IQ 导出，但频谱仪必需验收项仍待继续
- 将“凡是指导用户执行终端 / 命令行操作时，必须同步给出具体命令”写入 `AI_CONTEXT.md` 与 `docs/handoff/HANDOFF_CURRENT.md`，作为后续会话的固定执行约束
- 修正 `P0-B` 正式频谱仪验收结论：`run03` 下主峰、DC / 镜像证据仍然有效，但 `retry03` 在计时窗口后继续运行并向同一日志追加 `underflow`，因此当前状态改回“B-08 待补测”
