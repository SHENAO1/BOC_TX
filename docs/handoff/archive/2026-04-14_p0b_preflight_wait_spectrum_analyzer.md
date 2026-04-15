# P0-B 预检快照

**文档版本：** v1.0  
**快照日期：** 2026-04-14  
**里程碑类型：** 路线切换  
**快照主题：** 从 `P1` 文档推进切回 `P0-B` 硬件路线，完成无频谱仪预检并等待频谱仪接入

---

## 1. 里程碑结论

- 已完成 `P0-B` 的无频谱仪预检
- 主路径设备锁定为 B210 `serial=193982`
- 已确认 `USB 3`、`36 MSPS`、`915 MHz` 预配置、`10 dB` 预配置、`1 MHz` 复单音 `sc16` IQ 导出
- 当前未连接频谱仪，因此 `P0-B` 仍未正式通过

---

## 2. 关键证据

- 执行记录：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/record.md`
- 设备发现日志：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/logs/uhd_find_devices.txt`
- 36 MSPS 预检日志：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/logs/b210_serial_193982_36msps_preflight.txt`
- CW 生成摘要：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/matlab/p0_gen_cw_python_fallback_summary.txt`
- 原始 IQ：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/raw/p0_cw_tone_1MHz_sc16.bin`

---

## 3. 下一步建议

- 先接好频谱仪、SMA 电缆和必要衰减器
- 新开会话后直接从 `P0_Test_Checklist.md` 的 `B-06` 继续
- 第二台 B210 暂不纳入主路径

---

## 4. 当时的工作树说明

- 最近已完成提交：`3fecb37` `收口 P0-A 交接并细化 P1 软件路线`
- 快照生成时工作树状态：包含 `P0-B` 预检脚本、执行记录、交接单更新等未提交改动

---

## 5. 版本记录

| 版本 | 日期 | 变更说明 |
|---|---|---|
| v1.0 | 2026-04-14 | 基于 `P0-B` 无频谱仪预检结果建立路线切换快照，记录主路径 B210 已可用但频谱仪仍待接入。 |
