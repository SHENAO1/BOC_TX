# BOC-TDMA 发端工程项目 — AI 工具上下文

## 项目一句话
基于 USRP + MATLAB 的 TDMA + DSSS + BOC(15,3) 无线发端信号源开发，
按 P0–P7 分阶段推进，当前处于 **P0-A 参数级自洽检查已落盘、P0-B 硬件联调待启动** 阶段。

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
- docs/planning/BOC_TDMA_Doc_System_Review_Report.md     审查报告（参考基准）

## 工作原则
1. 不修改 P0–P7 已锁定参数，如需修改必须先走审查报告列出的回溯流程
2. 每阶段以对应 PX 文档 §13（完成判据）为准
3. 文档变更必须在文档末尾"版本记录"小节登记，并更新 VERSION_LOG.md
4. 技术术语统一以 docs/phases/tx/P1_BOC_Subcarrier_Analysis.md §17 为权威参考
5. 命名规范：MATLAB 正式脚本 `pX_功能名.m`，数据文件 `pX_描述.mat`，图像 `pX_fNN_描述.png`；系统规划 §6 阶段 A 指定的预热脚本 `matlab/check_params.m` 为保留例外
6. Git 提交消息统一使用中文；若提交中包含验证或测试信息，应在提交说明正文中显式写明“已执行验证”和“未执行/无法执行的验证”

## 当前推进状态
- 已完成：文档体系已重组到 `docs/` 目录；`README.md` 项目入口已建立；`matlab/check_params.m` 已作为 `P0-A` 热身脚本落盘
- 进行中：P0-A 参数级自洽检查待运行确认；P0-B 硬件链路联调待 USRP 到位
- 阻塞项：USRP 型号尚未到位（P0 §16.2 OPEN-01；P6 §4.1 当前以 B210 为假设）
- 待决策：多载荷 Gold 码分配方案（POST-P6-01 / P2 OPEN-P2-03）

## 重要遗留项（来自 P7 §10.2 等）
- Q1 多载荷 Gold 码分配方案
- Q3 频偏搜索范围
- Q4 接收/发端是否共参考时钟
- 完整 slot_config 32 时隙分类映射
