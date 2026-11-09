`timescale 1ns/1ps
module tb_four_bit_adder;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    integer i, j, k;
    reg [4:0] expected;

    four_bit_adder dut(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, tb_four_bit_adder);
        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 16; j = j + 1)
                for (k = 0; k < 2; k = k + 1) begin
                    A = i; B = j; Cin = k;
                    expected = i + j + k;
                    #1;
                    if ({Cout, Sum} !== expected)
                        $display("FAIL A=%d B=%d Cin=%d got=%b_%b expected=%b",
                                 A, B, Cin, Cout, Sum, expected);
                end
        $display("Adder test completed: all 512 input combinations checked.");
        $finish;
    end
endmodule
