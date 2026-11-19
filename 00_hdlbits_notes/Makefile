# HDLBits 本地复现
#   make new  T=01_combinational/vector5   从模板新建一题
#   make sim  T=01_combinational/vector5   编译 + 仿真（自检 PASS/FAIL）
#   make wave T=01_combinational/vector5   用 GTKWave 打开波形
#   make lint T=01_combinational/vector5   Verilator 静态检查（查 latch、位宽不匹配）
#   make clean

T     ?=
BUILD := build
SRCS   = $(wildcard $(T)/*.v)

.PHONY: check new sim wave lint clean

check:
	@test -n "$(T)" || { echo "用法: make sim T=<目录>，例如 T=01_combinational/vector5"; exit 1; }

new: check
	@test ! -e "$(T)" || { echo "$(T) 已存在"; exit 1; }
	@mkdir -p "$(T)" && cp _template/* "$(T)/"
	@echo "已创建 $(T)：先写 top_module.v，再在 tb.v 里补测试向量"

sim: check
	@mkdir -p $(BUILD)/$(T)
	iverilog -g2012 -Wall -o $(BUILD)/$(T)/sim.vvp $(SRCS)
	cd $(BUILD)/$(T) && vvp -n sim.vvp

wave: check
	gtkwave $(BUILD)/$(T)/wave.vcd &

lint: check
	verilator --lint-only -Wall --top-module top_module $(T)/top_module.v

clean:
	rm -rf $(BUILD)
