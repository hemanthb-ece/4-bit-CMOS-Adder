SIM=adder_sim
all:
	iverilog -g2012 -o $(SIM) full_adder.v four_bit_adder.v tb_four_bit_adder.v
	vvp $(SIM)
wave: all
	gtkwave adder.vcd
clean:
	rm -f $(SIM) adder.vcd
