# 测试结果归档目录

**文档版本：** v1.0  
**文档状态：** 生效中  
**关联文档：**
- `../../docs/testing/README.md`
- `../../docs/testing/templates/stage_test_record_template.md`

---

## 1. 目录用途

`artifacts/testing/` 用于保存项目各阶段测试执行后产生的正式证据，包括：

- 截图与图像
- MATLAB 控制台输出与导出结果
- 终端、UHD、仪器日志
- `.mat`、IQ、抓取样本等原始数据
- 每一轮测试对应的 `record.md`

本目录与 `docs/testing/` 的分工如下：

- `docs/testing/` 负责清单、步骤、验收标准和模板
- `artifacts/testing/` 负责单次测试执行后的实际产物归档

---

## 2. 目录结构

```text
artifacts/testing/
  README.md
  tx/
    P0/
    P1/
    P2/
    P3/
    P4/
    P5/
    P6/
  rx/
    P7/
    PR0/
    PR1/
    PR2/
    PR3/
    PR4/
    PR5/
    PR6/
    PR7/
```

说明：

- 当前只建立阶段骨架目录，不预先生成假的测试批次目录
- 真正开始某一轮测试时，再在对应阶段目录下新增本轮 `run` 目录

---

## 3. 单次测试批次命名规则

每个阶段目录下的单次测试批次统一命名为：

```text
YYYY-MM-DD_runNN_short-label
```

示例：

- `2026-04-14_run01_p0a_check_params`
- `2026-04-16_run02_p0b_usrp_link`
- `2026-04-18_run01_p1_subcarrier_baseline`

命名约束：

- `YYYY-MM-DD` 使用实际执行日期
- `runNN` 为两位轮次编号，按该阶段内部递增
- `short-label` 使用简短英文或拼音短语，避免空格

---

## 4. 单次测试批次内部结构

每个 `run` 目录内部固定采用以下结构：

```text
YYYY-MM-DD_runNN_short-label/
  record.md
  images/
  matlab/
  logs/
  raw/
```

使用约定：

- `record.md`：由 `docs/testing/templates/stage_test_record_template.md` 复制生成
- `images/`：频谱截图、时域图、FFT 图、仪器界面截图
- `matlab/`：MATLAB 控制台输出、导出文本、辅助图表
- `logs/`：UHD、终端、串口、仪器文本日志
- `raw/`：`.mat`、IQ 文件、抓取样本、频谱原始导出

---

## 5. 当前阶段使用建议

结合当前推进状态，推荐按以下顺序实际使用本目录：

1. 先使用 `tx/P0/`
2. 当开始 `P0-A` 时，创建 `tx/P0/YYYY-MM-DD_run01_p0a_check_params/`
3. USRP 到位后，再在 `tx/P0/` 下创建 `YYYY-MM-DD_run02_p0b_usrp_link/`
4. 紧接着最可能启用的是 `tx/P1/`，用于保存子载波时域图、FFT 图和自相关图

`P2-P6`、`P7`、`PR0-PR7` 当前只保留阶段骨架目录，待真实测试开始后再创建对应 `run` 目录。

---

## 6. 使用边界

- `DataSheet/analysis/` 不属于正式测试结果目录
- 不将实际截图、日志和原始数据继续放回 `docs/testing/`
- 默认将测试结果作为正式工程资产纳入 Git 管理，不额外通过 `.gitignore` 排除

---

## 7. 版本记录

| 版本 | 日期 | 变更说明 |
|---|---|---|
| v1.0 | 2026-04-14 | 首次建立 `artifacts/testing/` 目录说明，定义阶段骨架、批次命名规则与单次测试目录结构。 |
