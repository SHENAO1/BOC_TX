# 文档版本台账

最后更新：2026-04-13

| # | 文档 | 当前版本 | 备注 |
|---|---|---|---|
| 1 | BOC_TDMA_System_Planning.md | v1.1 | 顶层系统规划；§6 D-6 M 形副峰间距已订正 |
| 2 | BOC_TDMA_Phased_Implementation_Plan.md | v1.0 | 分阶段总规划；本轮未修改 |
| 3 | P0_USRP_Link_Verification.md | v1.0 | 本轮未修改；USRP 型号仍为 OPEN-01 |
| 4 | P1_BOC_Subcarrier_Analysis.md | v1.1 | 新增 §17 BOC 术语与 M 形权威参考 |
| 5 | P2_Gold_Code_Spreading_Verification.md | v1.1 | §6.5 默认工程选型锁定（Gold 多项式/初相/截短）|
| 6 | P3_Single_Slot_BOC_Baseband.md | v1.1 | §7.2 "10 个完整周期" 订正为"5 个完整周期 / 10 个半周期" |
| 7 | P4_TDMA_Frame_Generation.md | v1.0 | 本轮未修改 |
| 8 | P5_USRP_Continuous_Loop_Transmission.md | v1.0 | 本轮未修改 |
| 9 | P6_Parameter_Scan_Optimization.md | v1.1 | §7.2 C-05 副峰极性订正；§6.1 新增 B-04/C-04；§15.1 新增 P6-L-09/L-10 |
| 10 | P7_RX_Design_Input_and_Phased_Plan.md | v1.1 | §3.3 Gold 参数填入；§3.7 IQ 归一化独立列出 |
| — | BOC_TDMA_Doc_System_Review_Report.md | — | 审查报告（参考基准，不计版本） |

## v1.1 基线固化要点
- 审查报告最优先修复项 #1（M 形副峰间距 T_sc/2 = 33.3 ns）
- 最优先修复项 #2（Gold 码默认工程选型锁定）
- 最优先修复项 #3（IQ 归一化策略 P6-L-09）
- 次优先项 #4（USRP B210 措辞）
- 次优先项 #5（P6 C-04 多载荷互相关评估框架预留位）
