VERILATOR ?= verilator
BUILD_DIR := obj_dir
SIMULATOR := $(BUILD_DIR)/Vtb_addition
WAVEFORM := addition.vcd
SOURCES := addition.sv tb_addition.sv

.PHONY: all build run wave clean

all: run

build:
	$(VERILATOR) --binary --timing --trace --top-module tb_addition \
		--Mdir $(BUILD_DIR) $(SOURCES)

run: build
	./$(SIMULATOR)

wave: run
	@if command -v gtkwave >/dev/null 2>&1; then \
		gtkwave $(WAVEFORM); \
	else \
		echo "Waveform saved to $(WAVEFORM). Install GTKWave with: sudo apt install gtkwave"; \
	fi

clean:
	rm -rf $(BUILD_DIR) $(WAVEFORM)
