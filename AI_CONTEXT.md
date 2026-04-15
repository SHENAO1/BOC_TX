# BOC-TDMA 发端工程项目 — AI 工具上下文

## 项目一句话
基于 USRP + MATLAB 的 TDMA + DSSS + BOC(15,3) 无线发端信号源开发，
按 P0–P7 分阶段推进，当前处于 **P0-A 参数级自洽检查已通过、P0-B 已完成主峰 / DC / 镜像验证但 2 分钟稳定性待重跑、P1 可软件先行** 阶段。

## 关键参数（已锁定，不得修改）
- 采样率 fs = 36 MSPS
- 码速率 fc = 3 MHz
- BOC 子载波 fsc = 15 MHz，BOC(15,3)
- 单时隙 750 chips × 12 点 = 9000 点 = 250 μs
- 单周期 32 时隙 = 288000 点 = 8 ms
- Gold 码：10 级，完整 1023，截短前 750，g1=x^10+x^3+1，g2=x^10+x^9+x^8+x^6+x^3+x^2+1，初相全 1
- sign(0) 处理：方案 B，ε=1e-10
- slot_config：SLOT-1/3/5/7 发送，其余静默（工程假设）

## 文档体系
- README.md                                              项目入口与导航
- docs/planning/BOC_TDMA_System_Planning.md (v1.2)       系统规划（顶层）
- docs/planning/BOC_TDMA_Phased_Implementation_Plan.md   分阶段总规划
- docs/phases/tx/P0 ~ P6                                 发端阶段技术实施文档
- docs/phases/rx/P7_RX_Design_Input_and_Phased_Plan.md   接收端母文档
- docs/testing/README.md                                 阶段测试清单入口
- artifacts/testing/README.md                            阶段测试结果归档入口
- docs/handoff/HANDOFF_CURRENT.md                        当前会话交接入口
- docs/planning/BOC_TDMA_Doc_System_Review_Report.md     审查报告（参考基准）

## 工作原则
1. 不修改 P0–P7 已锁定参数，如需修改必须先走审查报告列出的回溯流程
2. 每阶段以对应 PX 文档 §13（完成判据）为准
3. 文档变更必须在文档末尾"版本记录"小节登记，并更新 VERSION_LOG.md
4. 技术术语统一以 docs/phases/tx/P1_BOC_Subcarrier_Analysis.md §17 为权威参考
5. 命名规范：MATLAB 正式脚本 `pX_功能名.m`，数据文件 `pX_描述.mat`，图像 `pX_fNN_描述.png`；系统规划 §6 阶段 A 指定的预热脚本 `matlab/check_params.m` 为保留例外
6. Git 提交消息统一使用中文；若提交中包含验证或测试信息，应在提交说明正文中显式写明“已执行验证”和“未执行/无法执行的验证”
7. 当 AI 指导用户执行终端 / 命令行相关操作时，必须同时给出可直接运行的命令；若某一步没有对应命令，也应明确写明该步为仪器面板或物理接线操作

## 交互偏好
- 用户偏好：凡是需要其手动执行终端 / 命令行操作时，AI 必须同步给出具体命令，不能只给口头步骤

## 会话边界与交接规则
1. 当用户明确表示“当前阶段任务完成”“这一阶段结束了”或“先收口”时，默认触发会话收口流程
2. 当 AI 从测试清单、执行记录或结果文档中读到“允许进入下一阶段”“阶段完成”“PASS / 通过”等明确信号时，也默认触发会话收口流程
3. 当 AI 自己完成了当前请求，并判断下一步已切换到新的阶段、子阶段或任务簇时，默认先给出收口建议，再继续等待用户决定是否在当前会话内往下做
4. 会话收口流程固定包含：本轮完成汇报、关键证据路径、未完成/阻塞项、下一步唯一推荐动作、建议结束当前会话并新开会话
5. 每次会话结束前，AI 应更新 `docs/handoff/HANDOFF_CURRENT.md`；若属于阶段/子阶段里程碑、重大硬件决策或路线切换，还应在 `docs/handoff/archive/` 追加快照
6. 新会话默认先读 `AI_CONTEXT.md` 与 `docs/handoff/HANDOFF_CURRENT.md`；若交接单列出了关联文档、测试记录或结果目录，也应一并读取
7. `AI_CONTEXT.md` 只保留长期稳定约束，不承载逐轮会话的细碎进展；逐轮状态以 `docs/handoff/HANDOFF_CURRENT.md` 为准

## 当前推进状态
- 已完成：文档体系已重组到 `docs/` 目录；`README.md` 项目入口已建立；`matlab/check_params.m` 已作为 `P0-A` 热身脚本落盘
- 已完成：`docs/testing/` 测试清单目录已正式建立，后续各阶段测试与验收将统一在该目录维护
- 已完成：`artifacts/testing/` 测试结果归档目录已建立，后续截图、日志、MATLAB 输出和原始数据统一按阶段归档
- 已完成：`P0-A` 参数级自洽检查已通过；执行记录与证据已存入 `artifacts/testing/tx/P0/2026-04-14_run01_p0a_check_params/`
- 已完成：`P0-B` 无频谱仪预检已执行；主路径 B210 锁定为 `serial=193982`，`36 MSPS` 配置与 `1 MHz` 复单音 IQ 导出已留痕于 `artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/`
- 已完成：`P0-B` 正式频谱仪验收中的主峰、DC / 镜像检查已通过；主路径 B210 `serial=193982` 在 `915 MHz / 36 MSPS / 10 dB / 1 MHz` 复单音配置下确认 `916 MHz` 主峰正常，`915 MHz` 未见异常高 DC，`914 MHz` 未见明显镜像；正式记录见 `artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/`
- 进行中：`P0-B` 的 2 分钟稳定性验证需重跑；`retry03` 在操作者计划的 2 分钟窗口后继续运行，后续日志追加了 `underflow`，因此当前证据不足以判定 `P0-B` 通过
- 阻塞项：当前硬件路线阻塞在 `P0-B / B-08`；若暂不继续硬件，`P1-A` 仍可作为软件路线独立启动
- 待决策：多载荷 Gold 码分配方案（POST-P6-01 / P2 OPEN-P2-03）

## 重要遗留项（来自 P7 §10.2 等）
- Q1 多载荷 Gold 码分配方案
- Q3 频偏搜索范围
- Q4 接收/发端是否共参考时钟
- 完整 slot_config 32 时隙分类映射
