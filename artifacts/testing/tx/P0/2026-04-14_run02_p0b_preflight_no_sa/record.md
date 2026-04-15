# P0-B 执行记录

**文档版本：** v1.0  
**文档状态：** 已执行（预检）  
**模板来源：** `docs/testing/templates/stage_test_record_template.md`

---

## 1. 基本信息

| 字段 | 内容 |
|---|---|
| 测试名称 | P0-B 硬件链路预检（未接频谱仪） |
| 对应阶段 | P0-B |
| 对应清单 | `docs/testing/tx/P0_Test_Checklist.md` §4 |
| 测试日期 | 2026-04-14 |
| 测试人员 | 待补充 |
| 软件版本 / 提交号 | `3fecb37`（执行时工作树含未提交变更） |
| 硬件环境 | USRP B210 `serial=193982`（主路径，USB 3）；另一台 B210 `serial=8003272` 本轮未纳入主路径；频谱仪未连接 |
| 证据目录路径 | `artifacts/testing/tx/P0/2026-04-14_run02_p0b_preflight_no_sa/` |

---

## 2. 输入与配置

| 项目 | 内容 |
|---|---|
| 输入文件 | `matlab/p0_gen_cw.m`；Python UHD / Python fallback 命令输出 |
| 输入参数 | `fs=36e6`、`f_tone=1e6`、`amplitude=0.30`、`fc=915e6`（预检配置）、`tx_gain=10 dB`、`tx_antenna=TX/RX` |
| 采样率 | 36 MSPS |
| 中心频率 | 915 MHz（仅完成设备侧配置，未做频谱仪观测） |
| 发射 / 接收增益 | TX = 10 dB（预检配置） |
| 其他关键配置 | `clock_source=internal`；本轮不启动盲发射，不做频谱仪截图 |

---

## 3. 执行过程记录

| 编号 | 执行项 | 结果 | 备注 |
|---|---|---|---|
| B-01 | 运行 `uhd_find_devices` | 通过 | 识别到两台 B210：`serial=193982`（`MyB210`）与 `serial=8003272`（`Zhixun-wireless`） |
| B-02 | 运行 `uhd_usrp_probe --args serial=193982` | 通过 | 主路径设备成功打开；确认 `USB 3`、TX/RX 频段、增益范围与 `lo_locked` 相关能力 |
| B-03 | 对 `serial=193982` 执行 36 MSPS 配置预检 | 通过 | `actual_tx_rate = 36000000.0`，`master_clock_rate = 36000000.0`，`clock_source=internal`，`lo_locked=True` |
| B-04 | 生成 1 MHz 复单音 CW IQ 数据 | 通过 | 因当前主机无 MATLAB 命令，使用 Python fallback 生成与 `matlab/p0_gen_cw.m` 等价的 `sc16` 文件 |
| B-05 | 核对 IQ 样本长度、格式与基本统计 | 通过 | `N=36000`，文件大小 `144000 bytes`，`max_i=max_q=9830`，均值约为 0，理论主峰位于 `1 MHz` |
| B-06 | 发射 CW 并连接频谱仪观测 | 阻塞 | 当前 USRP 未连接频谱仪，本轮不进行盲发射 |
| B-07 | 检查 DC 峰与镜像 | 阻塞 | 依赖频谱仪观测 |
| B-08 | 进行 2 分钟稳定性测试 | 阻塞 | 未建立频谱仪 / 衰减器 / 观测链路前，不做正式 RF 发射稳定性验证 |
| B-09 | 保存日志、原始 IQ 与摘要 | 通过 | 已保存设备发现日志、probe 日志、36 MSPS 配置日志、CW 原始 IQ 与生成摘要 |
| B-10 | 写出是否允许进入 P1 / P2 的结论 | 阻塞 | `P0-B` 尚未完成，不放行 |

---

## 4. 验收结果

| 项目 | 结果 |
|---|---|
| 通过项 | 6 |
| 告警项 | 0 |
| 失败项 | 0 |
| 阻塞项 | 4 |
| 是否允许进入下一阶段 | 不允许（`P0-B` 正式验证未完成） |

---

## 5. 证据归档

- 记录文件：`record.md`
- 图像 / 截图：当前无；`images/` 目录预留
- MATLAB 输出：`matlab/p0_gen_cw_python_fallback_summary.txt`
- 日志：
  - `logs/uhd_find_devices.txt`
  - `logs/uhd_usrp_probe_serial_193982.txt`
  - `logs/b210_serial_193982_36msps_preflight.txt`
- 原始数据：`raw/p0_cw_tone_1MHz_sc16.bin`

本轮已保存证据：

- UHD 设备探测日志 1 份
- B210 详细 probe 日志 1 份
- 36 MSPS / 915 MHz / 10 dB 设备侧配置预检日志 1 份
- 1 MHz 复单音 `sc16` 原始 IQ 文件 1 份
- CW 生成摘要 1 份

---

## 6. 问题与后续动作

- 发现的问题：
  - 当前 USRP 未连接频谱仪，无法完成 `B-06 ~ B-08` 的正式验收项
  - 第二台 B210（`serial=8003272`）本轮未纳入主路径，不影响当前单机 TX 基线建立
- 根因判断：
  - 当前阻塞属于测量链路未接入，而不是 B210 主路径设备不可用
  - 主路径 B210（`serial=193982`）已经完成设备识别、USB 3、36 MSPS、1 MHz CW IQ 生成等预检
- 后续动作：
  - 先将频谱仪、SMA 电缆与必要衰减器接入主路径 B210
  - 新开会话后直接从 `P0_Test_Checklist.md` 的 `B-06` 继续
  - 正式频谱仪验证通过后，再决定是否进入 `P1/P2`

---

## 7. 版本记录

| 版本 | 日期 | 变更说明 |
|---|---|---|
| v1.0 | 2026-04-14 | 首次记录 `P0-B` 无频谱仪条件下的硬件预检：B210 主路径锁定、36 MSPS 配置成功、1 MHz CW IQ 已导出，但正式频谱仪验收尚未完成。 |
