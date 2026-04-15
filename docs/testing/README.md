# 阶段测试清单目录

**文档版本：** v1.2
**文档状态：** 生效中  
**关联文档：**
- `../planning/BOC_TDMA_Phased_Implementation_Plan.md`
- `../phases/tx/P0_USRP_Link_Verification.md`
- `../phases/rx/P7_RX_Design_Input_and_Phased_Plan.md`
- `../../artifacts/testing/README.md`

---

## 1. 目录用途

`docs/testing/` 用于存放项目各阶段的**执行层测试清单**与**单次执行记录模板**。

本目录的定位是：

- 不重复解释系统原理；
- 将各阶段文档中的“关键检查点 / 完成判据 / 记录模板”提炼成可执行、可打勾、可留痕的测试清单；
- 为后续 P0–P6、P7、PR0–PR7 的测试与验收提供统一入口。

> 注意：`DataSheet/analysis/` 用于器件手册分析，不承载正式工程测试清单。
> 正式测试产物目录见 [../../artifacts/testing/README.md](../../artifacts/testing/README.md)。

---

## 2. 状态值约定

每条测试项建议使用以下统一状态值：

- `未开始`
- `通过`
- `告警`
- `失败`
- `阻塞`

其中：

- `告警` 表示存在已知风险或偏差，但不一定阻断进入下一步；
- `阻塞` 表示前置条件未满足，测试尚不能开始。

---

## 3. 每份清单必须包含的字段

每份阶段测试清单至少应包含以下字段：

1. 目标
2. 前置条件
3. 执行步骤
4. 验收标准
5. 证据归档
6. 执行记录

执行记录建议通过单独的记录文件维护，不直接污染阶段清单原文。

---

## 4. 测试文档与测试产物分工

- `docs/testing/`：定义“测什么、怎么测、如何判定通过”
- `artifacts/testing/`：保存“这次实际测了什么、产出了什么、证据放在哪里”
- 单次测试开始后，应在对应阶段的 `artifacts/testing/` 目录下新建 `YYYY-MM-DD_runNN_short-label/`
- `record.md` 由 [单次执行记录模板](./templates/stage_test_record_template.md) 复制生成，并与该轮测试的 `images/`、`matlab/`、`logs/`、`raw/` 目录绑定

---

## 5. 模板文件

- [阶段测试清单模板](./templates/stage_test_checklist_template.md)
- [单次执行记录模板](./templates/stage_test_record_template.md)

---

## 6. TX 清单索引

- [P0 详版测试清单](./tx/P0_Test_Checklist.md)
- [P1 详版测试清单](./tx/P1_Test_Checklist.md)
- [P2 测试清单骨架](./tx/P2_Test_Checklist.md)
- [P3 测试清单骨架](./tx/P3_Test_Checklist.md)
- [P4 测试清单骨架](./tx/P4_Test_Checklist.md)
- [P5 测试清单骨架](./tx/P5_Test_Checklist.md)
- [P6 测试清单骨架](./tx/P6_Test_Checklist.md)

---

## 7. RX 清单索引

- [P7 输入就绪清单](./rx/P7_Input_Readiness_Checklist.md)
- [PR0 测试清单骨架](./rx/PR0_Test_Checklist.md)
- [PR1 测试清单骨架](./rx/PR1_Test_Checklist.md)
- [PR2 测试清单骨架](./rx/PR2_Test_Checklist.md)
- [PR3 测试清单骨架](./rx/PR3_Test_Checklist.md)
- [PR4 测试清单骨架](./rx/PR4_Test_Checklist.md)
- [PR5 测试清单骨架](./rx/PR5_Test_Checklist.md)
- [PR6 测试清单骨架](./rx/PR6_Test_Checklist.md)
- [PR7 测试清单骨架](./rx/PR7_Test_Checklist.md)

---

## 8. 使用建议

推荐的使用方式如下：

1. 先阅读对应阶段的正式技术文档；
2. 再打开本目录下对应阶段测试清单；
3. 在 `artifacts/testing/<tx|rx>/<stage>/YYYY-MM-DD_runNN_short-label/` 下建立本轮测试目录；
4. 执行测试时复制一份[单次执行记录模板](./templates/stage_test_record_template.md)为该目录下的 `record.md`；
5. 将截图、MATLAB 输出、日志和原始数据分别放入 `images/`、`matlab/`、`logs/`、`raw/`；
6. 阶段通过后，在对应阶段文档、测试记录和 Git 提交说明中同步留痕。

---

## 9. 版本记录

| 版本 | 日期 | 变更说明 |
|---|---|---|
| v1.2 | 2026-04-14 | 将 `P1` 索引从骨架升级为详版测试清单入口，明确其已可作为当前执行入口使用。 |
| v1.1 | 2026-04-14 | 增加与 `artifacts/testing/` 的分工说明、测试产物目录链接和单次执行归档流程。 |
| v1.0 | 2026-04-14 | 首次建立 `docs/testing/` 目录总索引，统一状态值、字段约定、模板入口与 TX/RX 清单导航。 |
