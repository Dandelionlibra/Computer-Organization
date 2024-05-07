`timescale 1ns/1ns

module ALU(dataA, dataB, Signal, dataOut, reset);

input [31:0] dataA;
input [31:0] dataB;
input [5:0] Signal;
output [31:0] dataOut;
input reset;

wire [31:0] cout;

//  Signal ( 6-bits)?
//  AND  : 36
//  OR   : 37
//  ADD  : 32
//  SUB  : 34
//  SLT  : 42


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

assign cin = (Signal == 6'd34)? 1'b1 : 1'b0;
assign bitInvert = (Signal == 6'd34)? 1'b1 : 1'b0;
ALUbit alu0( .a(dataA[0]), .b(dataB[0]), .bitInvert(bitInvert), .cin(cin), .less(reset), .operation(Signal), .dataOut(dataOut[0]), .set(), .cout(cout[0]) );
ALUnit alu1( .a(dataA[1]), .b(dataB[1]), .bitInvert(bitInvert), .cin(cout[0]), .less(0), .operation(Signal), .dataOut(dataOut[1]), .set(), .cout(cout[1]) );
ALUnit alu2( .a(dataA[2]), .b(dataB[2]), .bitInvert(bitInvert), .cin(cout[1]), .less(0), .operation(Signal), .dataOut(dataOut[2]), .set(), .cout(cout[2]) );
ALUnit alu3( .a(dataA[3]), .b(dataB[3]), .bitInvert(bitInvert), .cin(cout[2]), .less(0), .operation(Signal), .dataOut(dataOut[3]), .set(), .cout(cout[3]) );
ALUnit alu4( .a(dataA[4]), .b(dataB[4]), .bitInvert(bitInvert), .cin(cout[3]), .less(0), .operation(Signal), .dataOut(dataOut[4]), .set(), .cout(cout[4]) );
ALUnit alu5( .a(dataA[5]), .b(dataB[5]), .bitInvert(bitInvert), .cin(cout[4]), .less(0), .operation(Signal), .dataOut(dataOut[5]), .set(), .cout(cout[5]) );
ALUnit alu6( .a(dataA[6]), .b(dataB[6]), .bitInvert(bitInvert), .cin(cout[5]), .less(0), .operation(Signal), .dataOut(dataOut[6]), .set(), .cout(cout[6]) );
ALUnit alu7( .a(dataA[7]), .b(dataB[7]), .bitInvert(bitInvert), .cin(cout[6]), .less(0), .operation(Signal), .dataOut(dataOut[7]), .set(), .cout(cout[7]) );
ALUnit alu8( .a(dataA[8]), .b(dataB[8]), .bitInvert(bitInvert), .cin(cout[7]), .less(0), .operation(Signal), .dataOut(dataOut[8]), .set(), .cout(cout[8]) );
ALUnit alu9( .a(dataA[9]), .b(dataB[9]), .bitInvert(bitInvert), .cin(cout[8]), .less(0), .operation(Signal), .dataOut(dataOut[9]), .set(), .cout(cout[9]) );
ALUnit alu10( .a(dataA[10]), .b(dataB[10]), .bitInvert(bitInvert), .cin(cout[9]), .less(0), .operation(Signal), .dataOut(dataOut[10]), .set(), .cout(cout[10]) );
ALUnit alu11( .a(dataA[11]), .b(dataB[11]), .bitInvert(bitInvert), .cin(cout[10]), .less(0), .operation(Signal), .dataOut(dataOut[11]), .set(), .cout(cout[11]) );
ALUnit alu12( .a(dataA[12]), .b(dataB[12]), .bitInvert(bitInvert), .cin(cout[11]), .less(0), .operation(Signal), .dataOut(dataOut[12]), .set(), .cout(cout[12]) );
ALUnit alu13( .a(dataA[13]), .b(dataB[13]), .bitInvert(bitInvert), .cin(cout[12]), .less(0), .operation(Signal), .dataOut(dataOut[13]), .set(), .cout(cout[13]) );
ALUnit alu14( .a(dataA[14]), .b(dataB[14]), .bitInvert(bitInvert), .cin(cout[13]), .less(0), .operation(Signal), .dataOut(dataOut[14]), .set(), .cout(cout[14]) );
ALUnit alu15( .a(dataA[15]), .b(dataB[15]), .bitInvert(bitInvert), .cin(cout[14]), .less(0), .operation(Signal), .dataOut(dataOut[15]), .set(), .cout(cout[15]) );
ALUnit alu16( .a(dataA[16]), .b(dataB[16]), .bitInvert(bitInvert), .cin(cout[15]), .less(0), .operation(Signal), .dataOut(dataOut[16]), .set(), .cout(cout[16]) );
ALUnit alu17( .a(dataA[17]), .b(dataB[17]), .bitInvert(bitInvert), .cin(cout[16]), .less(0), .operation(Signal), .dataOut(dataOut[17]), .set(), .cout(cout[17]) );
ALUnit alu18( .a(dataA[18]), .b(dataB[18]), .bitInvert(bitInvert), .cin(cout[17]), .less(0), .operation(Signal), .dataOut(dataOut[18]), .set(), .cout(cout[18]) );
ALUnit alu19( .a(dataA[19]), .b(dataB[19]), .bitInvert(bitInvert), .cin(cout[18]), .less(0), .operation(Signal), .dataOut(dataOut[19]), .set(), .cout(cout[19]) );
ALUnit alu20( .a(dataA[20]), .b(dataB[20]), .bitInvert(bitInvert), .cin(cout[19]), .less(0), .operation(Signal), .dataOut(dataOut[20]), .set(), .cout(cout[20]) );
ALUnit alu21( .a(dataA[21]), .b(dataB[21]), .bitInvert(bitInvert), .cin(cout[20]), .less(0), .operation(Signal), .dataOut(dataOut[21]), .set(), .cout(cout[21]) );
ALUnit alu22( .a(dataA[22]), .b(dataB[22]), .bitInvert(bitInvert), .cin(cout[21]), .less(0), .operation(Signal), .dataOut(dataOut[22]), .set(), .cout(cout[22]) );
ALUnit alu23( .a(dataA[23]), .b(dataB[23]), .bitInvert(bitInvert), .cin(cout[22]), .less(0), .operation(Signal), .dataOut(dataOut[23]), .set(), .cout(cout[23]) );
ALUnit alu24( .a(dataA[24]), .b(dataB[24]), .bitInvert(bitInvert), .cin(cout[23]), .less(0), .operation(Signal), .dataOut(dataOut[24]), .set(), .cout(cout[24]) );
ALUnit alu25( .a(dataA[25]), .b(dataB[25]), .bitInvert(bitInvert), .cin(cout[24]), .less(0), .operation(Signal), .dataOut(dataOut[25]), .set(), .cout(cout[25]) );
ALUnit alu26( .a(dataA[26]), .b(dataB[26]), .bitInvert(bitInvert), .cin(cout[25]), .less(0), .operation(Signal), .dataOut(dataOut[26]), .set(), .cout(cout[26]) );
ALUnit alu27( .a(dataA[27]), .b(dataB[27]), .bitInvert(bitInvert), .cin(cout[26]), .less(0), .operation(Signal), .dataOut(dataOut[27]), .set(), .cout(cout[27]) );
ALUnit alu28( .a(dataA[28]), .b(dataB[28]), .bitInvert(bitInvert), .cin(cout[27]), .less(0), .operation(Signal), .dataOut(dataOut[28]), .set(), .cout(cout[28]) );
ALUnit alu29( .a(dataA[29]), .b(dataB[29]), .bitInvert(bitInvert), .cin(cout[28]), .less(0), .operation(Signal), .dataOut(dataOut[29]), .set(), .cout(cout[29]) );
ALUnit alu30( .a(dataA[30]), .b(dataB[30]), .bitInvert(bitInvert), .cin(cout[29]), .less(0), .operation(Signal), .dataOut(dataOut[30]), .set(), .cout(cout[30]) );
ALUnit alu31( .a(dataA[31]), .b(dataB[31]), .bitInvert(bitInvert), .cin(cout[30]), .less(0), .operation(Signal), .dataOut(dataOut[31]), .set(reset), .cout(cout[31]) );

endmodule