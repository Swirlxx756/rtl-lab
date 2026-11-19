# 00 · HDLBits 刷题记录

第 1–2 周（2026-11-18 起）。HDLBits 上的题都自己手写；**踩过坑的题**才拉到本地，用 iverilog 复现波形并记录。

## 用法（在本目录下）

```bash
make new  T=01_combinational/vector5   # 从模板新建
make sim  T=01_combinational/vector5   # 仿真，输出 PASS / FAIL
make wave T=01_combinational/vector5   # GTKWave 看波形
make lint T=01_combinational/vector5   # Verilator 检查 latch / 位宽
```

每题一个目录：`top_module.v`（你的解）+ `tb.v`（自检）+ `notes.md`（坑 → 改法 → 面试点）。

## 进度

| 章节 | 目录 | HDLBits 完成 | 本地复现的坑题 |
|---|---|---|---|
| Combinational Logic | `01_combinational/` | 0 / ? | 0 |
| Sequential Logic | `02_sequential/` | 0 / ? | 0 |
| Finite State Machines | `03_fsm/` | 0 / ? | 0 |
| Writing Testbenches | `04_testbench/` | 0 / ? | 0 |

## 高频坑速查（随刷随补）

| 坑 | 出现在哪题 | 一句话结论 |
|---|---|---|
| | | |
