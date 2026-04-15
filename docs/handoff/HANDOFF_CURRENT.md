# 当前会话交接单

**文档版本：** v1.4
**文档状态：** 最新有效
**最近更新：** 2026-04-15
**适用规则：** `AI_CONTEXT.md` §会话边界与交接规则

---

## 1. 当前阶段 / 子阶段

- 当前大阶段：`P0 已完成`
- 当前子阶段状态：`P0-A / P0-B 均已通过；主路径硬件基线已建立`
- 当前建议进入：`新开会话后进入 P1-A（软件路线）`

---

## 2. 本轮已完成

- 已建立 `docs/testing/` 阶段测试清单体系
- 已建立 `artifacts/testing/` 测试结果归档体系
- 已运行 `matlab/check_params.m`
- 已完成 `P0-A` 首轮执行记录与证据归档
- 已建立 `docs/handoff/` 会话交接机制与模板
- 已判断当前未提交改动已形成独立收口边界，继续做实际阶段执行前应先提交
- 已将 `docs/testing/tx/P1_Test_Checklist.md` 从骨架升级为详版执行清单
- 已将 `docs/phases/tx/P1_BOC_Subcarrier_Analysis.md` 调整为“`P0-A` 通过即可软件先行，`P0-B` 只约束可选硬件验证”
- 已同步更新 `docs/testing/README.md` 与 `VERSION_LOG.md`
- 已完成上一轮文档收口提交：`3fecb37` `收口 P0-A 交接并细化 P1 软件路线`
- 已完成 `P0-B` 无频谱仪预检提交：`a84654d` `记录 P0-B 无频谱仪预检结果`
- 已识别两台 B210，其中主路径设备锁定为 `serial=193982`
- 已完成主路径 B210 的 `36 MSPS` / `915 MHz` / `10 dB` 非发射预检
- 已导出 `1 MHz` 复单音 `sc16` IQ 文件，并新增 `matlab/p0_gen_cw.m`
- 已形成 `P0-B` 无频谱仪预检执行记录与路线切换快照
- 已完成 `P0-B` 正式验收目录初始化：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/`
- 已确认 `uhd_siggen --const` 在 `915 MHz` 可见峰，说明主路径 `TX/RX -> 衰减器 -> 频谱仪` 已连通
- 已确认 `uhd_siggen --sine --waveform-freq 1e6` 在 `916 MHz` 可见主峰，并已保存正式 `B-06 / B-07` 截图
- 已完成 `B-08 retry03`：交互式连续发射 2 分钟，日志中未检测到 `underflow`
- 已完成 `run03/record.md`，结论为允许进入 `P1 / P2`
- 已记录新的交互偏好：凡指导终端操作时，必须同步给出可直接运行的命令

---

## 3. 关键证据与路径

- `P0-A` 测试清单：`docs/testing/tx/P0_Test_Checklist.md`
- `P0-A` 执行记录：`artifacts/testing/tx/P0/2026-04-14_run01_p0a_check_params/record.md`
- MATLAB 控制台文本：`artifacts/testing/tx/P0/2026-04-14_run01_p0a_check_params/matlab/check_params_console.txt`
- MATLAB 控制台截图：`artifacts/testing/tx/P0/2026-04-14_run01_p0a_check_params/images/p0_f01_check_params_console_full.png`
- 当前硬件执行清单：`docs/testing/tx/P0_Test_Checklist.md`
- 当前硬件阶段文档：`docs/phases/tx/P0_USRP_Link_Verification.md`
- P0-B 预检记录：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/record.md`
- P0-B 正式验收记录：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/record.md`
- P0-B 正式验收目录：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/`
- P0-B 2 分钟稳定性通过日志：`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/logs/uhd_siggen_sine_retry03_serial193982_fc915e6_fs36e6_gain10_amp030.txt`
- B210 36 MSPS 预检日志：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/logs/b210_serial_193982_36msps_preflight.txt`
- CW IQ 生成摘要：`artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/matlab/p0_gen_cw_python_fallback_summary.txt`

---

## 4. 已执行验证

- `P0-A` 参数级自洽检查已通过
- 实际结果：
  - `PASS = 10`
  - `WARN = 1`
  - `FAIL = 0`
- 唯一告警项：`fs/fsc = 2.4`
- 结论：允许进入下一阶段
- `P0-B` 无频谱仪预检已完成
- 实际结果：
  - `通过 = 6`
  - `告警 = 0`
  - `失败 = 0`
  - `阻塞 = 4`
- 关键结论：
  - 主路径 B210 `serial=193982` 可用，`USB 3` 正常
  - `36 MSPS` 配置成功，主时钟自动切到 `36 MHz`
  - `1 MHz` 复单音 `sc16` IQ 已导出
  - 因频谱仪未连接，`P0-B` 尚未通过
- `P0-B` 正式验收已通过
- 实际结果：
  - `通过 = 10`
  - `告警 = 1`
  - `失败 = 0`
  - `阻塞 = 0`
- 当前附加结论：
  - `uhd_siggen --const` 在 `915 MHz` 可见单峰，射频链路连通
  - `uhd_siggen --sine --waveform-freq 1e6` 在 `916 MHz` 可见主峰
  - `915 MHz` 未见异常高 DC 尖峰，`914 MHz` 未见明显镜像峰
  - `retry03` 的 2 分钟持续发射未检测到 `underflow`
  - 结论：允许进入 `P1 / P2`

---

## 5. 未执行 / 阻塞验证

- `P1-A` 的实际 MATLAB 执行尚未开始
- `P1-B` 的可选硬件补充验证尚未执行
- `P2-A` 的实际 MATLAB 执行尚未开始
- `P2-P6`、`PR0-PR7` 的阶段测试尚未执行
- 第二台 B210（`serial=8003272`）本轮未纳入主路径，不构成当前阻塞

---

## 6. 当前工作树状态

- 工作树当前**非干净**
- 当前至少存在以下待提交内容：
  - `AI_CONTEXT.md`
  - `VERSION_LOG.md`
  - `docs/handoff/HANDOFF_CURRENT.md`
  - `docs/handoff/archive/2026-04-15_p0b_pass_ready_for_p1.md`
  - `artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/`
  - 原始未跟踪 `DataSheet/AD9361/`
  - 原始未跟踪 `DataSheet/B200_B210/`
  - 原始未跟踪 `DataSheet/X300_X310/`
- 最近一次已完成提交：`a84654d` `记录 P0-B 无频谱仪预检结果`
- 判断：`P0-B` 已形成新的独立提交边界；建议本轮结束前收口并提交

---

## 7. 下一步唯一推荐动作

- **先提交当前 `P0-B` 通过结果，然后结束当前会话并新开会话进入 `P1-A`**
- 新会话默认先读 `AI_CONTEXT.md`、`docs/handoff/HANDOFF_CURRENT.md`、`artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/record.md`

默认推荐路线：**先收口提交，再开新会话进入 `P1-A`**

---

## 8. 当前会话中的执行偏好

- 当 AI 指导用户执行终端 / 命令行相关操作时，必须同时给出可直接运行的命令
- 若某一步是频谱仪面板设置、截图导出或物理接线操作，也应明确写明“本步无命令，仅做仪器 / 接线动作”

---

## 9. 新会话启动提示词

```text
请先读 AI_CONTEXT.md 和 docs/handoff/HANDOFF_CURRENT.md。
当前状态：P0-A 已通过，P0-B 已通过；正式记录在 artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/record.md。
请先确认当前工作树是否已提交。
然后进入 P1-A：阅读 docs/testing/tx/P1_Test_Checklist.md 与 docs/phases/tx/P1_BOC_Subcarrier_Analysis.md，优先执行软件路线的 BOC 子载波 MATLAB 验证。
凡是需要我手动执行终端 / 命令行操作时，请同步给出可直接运行的命令；若某一步没有对应命令，也请明确说明那是仪器面板或接线动作。
本轮结束前请按 AI_CONTEXT.md 的会话边界与交接规则先做收口，并建议我结束当前会话后再开新会话。
```

---

## 10. 版本记录

| 版本 | 日期 | 变更说明 |
|---|---|---|
| v1.4 | 2026-04-15 | 更新为“P0-B 已通过、允许进入 P1 / P2”的当前状态，补记 run03 正式记录、2 分钟稳定性通过证据，并将下一步唯一推荐动作切换为 `P1-A`。 |
| v1.3 | 2026-04-14 | 更新为“P0-B 正式频谱仪验收进行中”的当前状态，补记 run03 目录、`const` / `sine` 实测进展，并写入“凡指导终端操作必须同步给出命令”的交互偏好。 |
| v1.2 | 2026-04-14 | 更新为“P0-B 无频谱仪预检已完成、待频谱仪接入继续正式验证”的当前状态，并补记主路径 B210、36 MSPS 配置和 CW IQ 导出证据。 |
| v1.1 | 2026-04-14 | 更新为“P1 软件路线文档已细化、建议先提交再开新会话执行 P1-A”的当前状态，并补记本轮未新增实测、仅完成文档推进。 |
| v1.0 | 2026-04-14 | 基于 `P0-A` 已通过的真实状态，首次建立当前会话交接单。 |
