`timescale 1ns/1ns

module ALUbit( a, b, bitInvert, cin, less, operation, dataOut, set, cout );
// 1 bit ALU
input a, b, bitInvert, cin, less ;
input [5:0] operation ;
output dataOut, set, cout;

wire cin;
wire andOut, orOut, xorOut;

and(andOut, a, b);
or(orOut, a, b);
xor(xorOut, bitInvert, b);

FullAdder U_FA( .a(a), .b(xorOut), .cin(cin), .sum(set), .cout(cout) );

MUX4_1 U_Mux4_1( .out(dataOut), .in0(andOut), .in1(orOut), .in2(set), .in3(less), .sel(operation) );

endmodule
