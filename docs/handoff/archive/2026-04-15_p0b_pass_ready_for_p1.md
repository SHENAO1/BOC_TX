# 里程碑交接快照

**里程碑：** `P0-B 正式验收通过，可进入 P1 / P2`  
**日期：** 2026-04-15  
**关联规则：** `AI_CONTEXT.md` §会话边界与交接规则

---

## 1. 里程碑结论

- `P0-A` 已通过
- `P0-B` 已通过
- 当前允许进入 `P1 / P2`
- 默认建议下一步进入 `P1-A`，优先完成 BOC 子载波软件分析与 MATLAB 验证

---

## 2. 关键证据

- `P0-A` 记录：`artifacts/testing/tx/P0/2026-04-14_run01_p0a_check_params/record.md`
- `P0-B` 预检记录：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/record.md`
- `P0-B` 正式验收记录：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/record.md`
- `P0-B` 主峰截图：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/images/p0_f02_b06_cw_peak_center915_span20_rbw10k.png`
- `P0-B` DC / 镜像截图：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/images/p0_f03_b07_dc_image_check_center915_span4_rbw10k.png`
- `P0-B` 2 分钟稳定性截图：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/images/p0_f05_b08_stability_t0_center915_span20_rbw10k.png`
- `P0-B` 稳定性日志：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/logs/uhd_siggen_sine_retry03_serial193982_fc915e6_fs36e6_gain10_amp030.txt`

---

## 3. 重要说明

- 本轮正式硬件基线建立在 B210 `serial=193982` 上
- `uhd_siggen` 可用于 `P0-B` 基线验收，但其交互式退出方式不适合作为后续更长期连续发射的最终工具形态
- 第二台 B210 `serial=8003272` 本轮未纳入主路径

---

## 4. 新会话唯一推荐动作

- 请先读 `AI_CONTEXT.md` 与 `docs/handoff/HANDOFF_CURRENT.md`
- 当前状态：`P0` 已完成；请从 `P1-A` 开始，优先执行 `docs/testing/tx/P1_Test_Checklist.md` 与 `docs/phases/tx/P1_BOC_Subcarrier_Analysis.md`
- 若需要我手动执行终端 / 命令行操作，请同步给出具体命令；若某一步没有对应命令，也请明确说明那是仪器面板或接线动作
