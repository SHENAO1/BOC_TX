# P0-B 执行记录

**文档版本：** v1.0  
**文档状态：** 已执行（正式验收，待补测稳定性）
**模板来源：** `docs/testing/templates/stage_test_record_template.md`

---

## 1. 基本信息

| 字段 | 内容 |
|---|---|
| 测试名称 | P0-B 硬件链路正式验收（接入频谱仪） |
| 对应阶段 | P0-B |
| 对应清单 | `docs/testing/tx/P0_Test_Checklist.md` §4 |
| 测试日期 | 2026-04-15 |
| 测试人员 | 用户手动执行，AI 协助记录 |
| 软件版本 / 提交号 | `a84654d`（执行时工作树含 run03 未提交证据） |
| 硬件环境 | USRP B210 `serial=193982`（主路径，USB 3，TX/RX 端口） + SIGLENT 频谱仪（型号待补充） + SMA 线缆 / 衰减器；第二台 B210 `serial=8003272` 本轮未纳入主路径 |
| 证据目录路径 | `artifacts/testing/tx/P0/2026-04-14_run03_p0b_sa_validation/` |

---

## 2. 输入与配置

| 项目 | 内容 |
|---|---|
| 输入文件 | `uhd_siggen` 直接生成 `--const` 与 `--sine`；P0-B 前置预检参考 `../2026-04-14_run02_p0b_preflight_no_sa/` |
| 输入参数 | `serial=193982`、`tx_antenna=TX/RX`、`clock_source=internal`、`fs=36e6`、`fc=915e6`、`tx_gain=10 dB`、`amplitude=0.30`、`f_tone=1e6` |
| 采样率 | 36 MSPS |
| 中心频率 | 915 MHz |
| 发射 / 接收增益 | TX = 10 dB |
| 其他关键配置 | `uhd_siggen --otw-format sc16`；`B-06` / `B-07` 关键频谱仪设置分别为 `Span=20 MHz / 4 MHz`、`RBW=10 kHz`、`VBW=10 kHz`、`Ref=-60 dBm`、`Att=0 dB`；`B-08` 最终通过批次为 `retry03` |

---

## 3. 执行过程记录

| 编号 | 执行项 | 结果 | 备注 |
|---|---|---|---|
| B-01 ~ B-05 | 设备识别、36 MSPS 配置、CW IQ 预检 | 已通过 | 详见 `../2026-04-14_run02_p0b_preflight_no_sa/record.md` |
| B-06-01 | 使用 `uhd_siggen --const` 做链路定位 | 通过 | `915 MHz` 可见单峰，证明 `TX/RX -> 衰减器 -> 频谱仪` 链路连通；见 `images/p0_diag_f01_const_center915_span50_rbw10k.png` |
| B-06-02 | 使用 `uhd_siggen --sine --waveform-freq 1e6` 搜索主峰 | 通过 | 搜索态在 `916 MHz` 可见主峰；见 `images/p0_diag_f02_sine_search_center915_span50_rbw10k.png` |
| B-06 | 正式主峰验收 | 通过 | `Span=20 MHz`、`RBW/VBW=10 kHz` 下确认主峰位于 `916 MHz` 附近；见 `images/p0_f02_b06_cw_peak_center915_span20_rbw10k.png` |
| B-07 | 检查 DC 峰与镜像 | 通过 | `Span=4 MHz`、`RBW/VBW=10 kHz` 下主峰读数约 `916.002667 MHz / -69.38 dBm`；`915 MHz` 未见异常高 DC 尖峰，`914 MHz` 未见明显镜像峰；见 `images/p0_f03_b07_dc_image_check_center915_span4_rbw10k.png` 与 `images/p0_f04_b07_marker_readback_center915_span4_rbw10k.png` |
| B-08-01 | 首次 2 分钟稳定性尝试 | 失败 | 出现多次 `underflow`，不计入正式通过；相关日志保留在 `logs/uhd_siggen_sine_formal_serial193982_fc915e6_fs36e6_gain10_amp030.txt` |
| B-08-02 | `retry02` 以 `timeout` 托管运行 | 无效 | 进程在约 9 秒后退出；日志停在 `Press Enter to quit:`，说明 `uhd_siggen` 交互式运行不适合该托管方式 |
| B-08-03 | `retry03` 交互式持续发射计划 2 分钟 | 失败 | 用户在 2 分钟计时结束后未立即停止发射，`uhd_siggen` 与 `tee` 继续运行并向同一日志追加了后续 `underflow`；当前日志已不能作为“2 分钟无 underflow”的干净证据 |
| B-09 | 保存截图、日志和参数记录 | 通过 | `images/`、`logs/` 已形成完整证据链 |
| B-10 | 写出是否允许进入 P1 / P2 的结论 | 失败 | 当前不允许以“P0-B 已通过”的结论收口；若不继续硬件，可独立进入 `P1-A` 软件路线 |

---

## 4. 验收结果

| 项目 | 结果 |
|---|---|
| 通过项 | 8 |
| 告警项 | 0 |
| 失败项 | 2 |
| 阻塞项 | 0 |
| 是否允许进入下一阶段 | 不允许以 `P0-B 已通过` 的硬件结论进入下一阶段；若暂停硬件，可独立进入 `P1-A` 软件路线 |

---

## 5. 证据归档

- 记录文件：`record.md`
- 图像 / 截图：
  - `images/p0_diag_f01_const_center915_span50_rbw10k.png`
  - `images/p0_diag_f02_sine_search_center915_span50_rbw10k.png`
  - `images/p0_f02_b06_cw_peak_center915_span20_rbw10k.png`
  - `images/p0_f03_b07_dc_image_check_center915_span4_rbw10k.png`
  - `images/p0_f04_b07_marker_readback_center915_span4_rbw10k.png`
  - `images/p0_f05_b08_stability_t0_center915_span20_rbw10k.png`
  - `images/p0_f06_b08_stability_t120s_center915_span20_rbw10k.png`
- MATLAB 输出：当前无新增；前置 CW 生成摘要见 `../2026-04-14_run02_p0b_preflight_no_sa/matlab/p0_gen_cw_python_fallback_summary.txt`
- 日志：
  - `logs/git_head.txt`
  - `logs/uhd_siggen_const_search_serial193982_fc915e6_fs36e6_gain10_amp030.txt`
  - `logs/uhd_siggen_sine_search_serial193982_fc915e6_fs36e6_gain10_amp030.txt`
  - `logs/uhd_siggen_sine_formal_serial193982_fc915e6_fs36e6_gain10_amp030.txt`
  - `logs/uhd_siggen_sine_retry02_serial193982_fc915e6_fs36e6_gain10_amp030.txt`
  - `logs/uhd_siggen_sine_retry03_serial193982_fc915e6_fs36e6_gain10_amp030.txt`
  - `logs/p0_b08_retry02_timepoints.txt`
  - `logs/p0_b08_retry03_timepoints.txt`
- 原始数据：当前无新增；前置 CW 原始 IQ 见 `../2026-04-14_run02_p0b_preflight_no_sa/raw/p0_cw_tone_1MHz_sc16.bin`

---

## 6. 问题与后续动作

- 发现的问题：
  - `uhd_siggen` 首次稳定性尝试出现 `underflow`
  - 使用 `timeout` 托管 `uhd_siggen` 会导致程序提前退出，不适合作为正式稳定性验证方式
  - `retry03` 虽完成了人工 2 分钟计时，但发射未在计时点立即停止，后续同一日志追加了 `underflow`
- 根因判断：
  - 射频链路本身已由 `--const` 与 `--sine` 搜索态验证为可用；问题集中在 host 侧持续送数与 `uhd_siggen` 的交互式运行方式
  - 当前最大问题不是主峰或频谱仪设置，而是 `B-08` 的证据边界没有被严格收住，导致日志无法证明“仅在目标 2 分钟窗口内无 underflow”
- 后续动作：
  - 若继续硬件路线，需在新会话中重跑 `B-08`，并确保在 120 秒窗口结束时立即停止发射或使用更稳的非交互式发射脚本
  - 若当前不继续硬件，可直接转入 `P1-A`，先做 BOC 子载波软件分析与 MATLAB 侧验证
  - 后续若继续做长期连续发射，应优先考虑更稳的非交互式发射脚本，而不是依赖 `uhd_siggen` 的交互退出机制

---

## 7. 版本记录

| 版本 | 日期 | 变更说明 |
|---|---|---|
| v1.0 | 2026-04-15 | 首次记录 P0-B 正式频谱仪验收：`916 MHz` 主峰、DC / 镜像检查通过，但 `B-08 retry03` 因日志在计时窗口后追加 `underflow` 而失去通过判据，结论改为“稳定性待补测”。 |
