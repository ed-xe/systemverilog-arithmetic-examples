# special-train-rtl

## Sample addition RTL

`addition.sv` defines a synthesizable, parameterized unsigned adder. `sum` contains the low `WIDTH` result bits, and `carry_out` contains the carry bit. The default width is 8 bits. `tb_addition.sv` checks all 256 pairs of 4-bit inputs and writes signal activity to `addition.vcd`.

## Run with Verilator and view the waveform

In Ubuntu or Ubuntu on WSL, install Verilator, its C++ build tools, and GTKWave:

```sh
sudo apt update
sudo apt install verilator build-essential gtkwave
```

From this directory, run these Make targets as needed:

```sh
make build  # Compile the testbench with Verilator
make run    # Compile and run the self-checking testbench
make wave   # Compile, run, then open addition.vcd in GTKWave
make clean  # Remove obj_dir and addition.vcd
```

Running plain `make` is equivalent to `make run`. The testbench reports `PASS` after all 256 input pairs match; a mismatch stops the simulation with `$fatal`.

`make wave` builds with timing and waveform tracing enabled. If GTKWave is not installed, it leaves `addition.vcd` in this directory and prints the GTKWave installation command. To view a previously generated waveform, run `gtkwave addition.vcd`.

## Run with Icarus Verilog

```sh
iverilog -g2012 -s tb_addition -o addition_test addition.sv tb_addition.sv
vvp addition_test
```
