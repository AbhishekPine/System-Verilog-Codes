#MAKEFILE

SV_FILES = fifo.sv fifo_tb.sv
TOP = fifo_tb

all:
	irun -sv $(SV_FILES) -top $(TOP) -access +rwc

clean:
	rm -rf INCA_libs *.log *.txt *.vcd
