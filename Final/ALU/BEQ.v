

module BEQ(opcode, zero, a, b);

parameter BEQ = 6'b000100; //   beq  : 04

input [5:0] opcode;
input [31:0] a, b;
output zero;

assign zero = (opcode == BEQ && a == b) ? 1 : 0;

endmodule