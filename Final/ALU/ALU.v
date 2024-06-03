// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ALU 可連接的 ports
module ALU(dataA, dataB, control, dataOut, shamt);

// 定義哪些 ports 為 input，哪些為 output
input [31:0] dataA;
input [31:0] dataB;
input [2:0] control;
output [31:0] dataOut;
input shamt;

// 宣告兩 wire，cout 為 32 位元，set 為一位元
wire [31:0] cout, shifter_out, alu_out;
wire set, bitInvert;

// 定義參數常數(可提升可讀性)
// Check 4-1 P.61
parameter ALU_AND = 3'b000;
parameter ALU_OR  = 3'b001; 
parameter ALU_ADD = 3'b010;
parameter ALU_SUB = 3'b110; 
parameter ALU_SLT = 3'b111; 
parameter ALU_SLL = 3'b100;
parameter ALU_OpenHiLo = 6'b111111; // HiLo : 63

// 若訊號為減法或小於，則 cin[0] 應傳入 1、bitInvert 打開來將減數進行 bitInvert，進行減法運算
assign cin = ( control == 3'b110 || control == 3'b111 )? 1'b1 : 1'b0;
assign bitInvert = (control == 3'b110 || control == 3'b111 )? 1'b1 : 1'b0;

// 因為是 32-bit 運算，將 32 個 ALU 單元串起來
ALUbit alu0( .a(dataA[0]), .b(dataB[0]), .bitInvert(bitInvert), .cin(cin), .less(set), .operation(Signal), .dataOut(alu_out[0]), .set(), .cout(cout[0]) );
ALUbit alu1( .a(dataA[1]), .b(dataB[1]), .bitInvert(bitInvert), .cin(cout[0]), .less(1'b0), .operation(Signal), .dataOut(alu_out[1]), .set(), .cout(cout[1]) );
ALUbit alu2( .a(dataA[2]), .b(dataB[2]), .bitInvert(bitInvert), .cin(cout[1]), .less(1'b0), .operation(Signal), .dataOut(alu_out[2]), .set(), .cout(cout[2]) );
ALUbit alu3( .a(dataA[3]), .b(dataB[3]), .bitInvert(bitInvert), .cin(cout[2]), .less(1'b0), .operation(Signal), .dataOut(alu_out[3]), .set(), .cout(cout[3]) );
ALUbit alu4( .a(dataA[4]), .b(dataB[4]), .bitInvert(bitInvert), .cin(cout[3]), .less(1'b0), .operation(Signal), .dataOut(alu_out[4]), .set(), .cout(cout[4]) );
ALUbit alu5( .a(dataA[5]), .b(dataB[5]), .bitInvert(bitInvert), .cin(cout[4]), .less(1'b0), .operation(Signal), .dataOut(alu_out[5]), .set(), .cout(cout[5]) );
ALUbit alu6( .a(dataA[6]), .b(dataB[6]), .bitInvert(bitInvert), .cin(cout[5]), .less(1'b0), .operation(Signal), .dataOut(alu_out[6]), .set(), .cout(cout[6]) );
ALUbit alu7( .a(dataA[7]), .b(dataB[7]), .bitInvert(bitInvert), .cin(cout[6]), .less(1'b0), .operation(Signal), .dataOut(alu_out[7]), .set(), .cout(cout[7]) );
ALUbit alu8( .a(dataA[8]), .b(dataB[8]), .bitInvert(bitInvert), .cin(cout[7]), .less(1'b0), .operation(Signal), .dataOut(alu_out[8]), .set(), .cout(cout[8]) );
ALUbit alu9( .a(dataA[9]), .b(dataB[9]), .bitInvert(bitInvert), .cin(cout[8]), .less(1'b0), .operation(Signal), .dataOut(alu_out[9]), .set(), .cout(cout[9]) );
ALUbit alu10( .a(dataA[10]), .b(dataB[10]), .bitInvert(bitInvert), .cin(cout[9]), .less(1'b0), .operation(Signal), .dataOut(alu_out[10]), .set(), .cout(cout[10]) );
ALUbit alu11( .a(dataA[11]), .b(dataB[11]), .bitInvert(bitInvert), .cin(cout[10]), .less(1'b0), .operation(Signal), .dataOut(alu_out[11]), .set(), .cout(cout[11]) );
ALUbit alu12( .a(dataA[12]), .b(dataB[12]), .bitInvert(bitInvert), .cin(cout[11]), .less(1'b0), .operation(Signal), .dataOut(alu_out[12]), .set(), .cout(cout[12]) );
ALUbit alu13( .a(dataA[13]), .b(dataB[13]), .bitInvert(bitInvert), .cin(cout[12]), .less(1'b0), .operation(Signal), .dataOut(alu_out[13]), .set(), .cout(cout[13]) );
ALUbit alu14( .a(dataA[14]), .b(dataB[14]), .bitInvert(bitInvert), .cin(cout[13]), .less(1'b0), .operation(Signal), .dataOut(alu_out[14]), .set(), .cout(cout[14]) );
ALUbit alu15( .a(dataA[15]), .b(dataB[15]), .bitInvert(bitInvert), .cin(cout[14]), .less(1'b0), .operation(Signal), .dataOut(alu_out[15]), .set(), .cout(cout[15]) );
ALUbit alu16( .a(dataA[16]), .b(dataB[16]), .bitInvert(bitInvert), .cin(cout[15]), .less(1'b0), .operation(Signal), .dataOut(alu_out[16]), .set(), .cout(cout[16]) );
ALUbit alu17( .a(dataA[17]), .b(dataB[17]), .bitInvert(bitInvert), .cin(cout[16]), .less(1'b0), .operation(Signal), .dataOut(alu_out[17]), .set(), .cout(cout[17]) );
ALUbit alu18( .a(dataA[18]), .b(dataB[18]), .bitInvert(bitInvert), .cin(cout[17]), .less(1'b0), .operation(Signal), .dataOut(alu_out[18]), .set(), .cout(cout[18]) );
ALUbit alu19( .a(dataA[19]), .b(dataB[19]), .bitInvert(bitInvert), .cin(cout[18]), .less(1'b0), .operation(Signal), .dataOut(alu_out[19]), .set(), .cout(cout[19]) );
ALUbit alu20( .a(dataA[20]), .b(dataB[20]), .bitInvert(bitInvert), .cin(cout[19]), .less(1'b0), .operation(Signal), .dataOut(alu_out[20]), .set(), .cout(cout[20]) );
ALUbit alu21( .a(dataA[21]), .b(dataB[21]), .bitInvert(bitInvert), .cin(cout[20]), .less(1'b0), .operation(Signal), .dataOut(alu_out[21]), .set(), .cout(cout[21]) );
ALUbit alu22( .a(dataA[22]), .b(dataB[22]), .bitInvert(bitInvert), .cin(cout[21]), .less(1'b0), .operation(Signal), .dataOut(alu_out[22]), .set(), .cout(cout[22]) );
ALUbit alu23( .a(dataA[23]), .b(dataB[23]), .bitInvert(bitInvert), .cin(cout[22]), .less(1'b0), .operation(Signal), .dataOut(alu_out[23]), .set(), .cout(cout[23]) );
ALUbit alu24( .a(dataA[24]), .b(dataB[24]), .bitInvert(bitInvert), .cin(cout[23]), .less(1'b0), .operation(Signal), .dataOut(alu_out[24]), .set(), .cout(cout[24]) );
ALUbit alu25( .a(dataA[25]), .b(dataB[25]), .bitInvert(bitInvert), .cin(cout[24]), .less(1'b0), .operation(Signal), .dataOut(alu_out[25]), .set(), .cout(cout[25]) );
ALUbit alu26( .a(dataA[26]), .b(dataB[26]), .bitInvert(bitInvert), .cin(cout[25]), .less(1'b0), .operation(Signal), .dataOut(alu_out[26]), .set(), .cout(cout[26]) );
ALUbit alu27( .a(dataA[27]), .b(dataB[27]), .bitInvert(bitInvert), .cin(cout[26]), .less(1'b0), .operation(Signal), .dataOut(alu_out[27]), .set(), .cout(cout[27]) );
ALUbit alu28( .a(dataA[28]), .b(dataB[28]), .bitInvert(bitInvert), .cin(cout[27]), .less(1'b0), .operation(Signal), .dataOut(alu_out[28]), .set(), .cout(cout[28]) );
ALUbit alu29( .a(dataA[29]), .b(dataB[29]), .bitInvert(bitInvert), .cin(cout[28]), .less(1'b0), .operation(Signal), .dataOut(alu_out[29]), .set(), .cout(cout[29]) );
ALUbit alu30( .a(dataA[30]), .b(dataB[30]), .bitInvert(bitInvert), .cin(cout[29]), .less(1'b0), .operation(Signal), .dataOut(alu_out[30]), .set(), .cout(cout[30]) );
ALUbit alu31( .a(dataA[31]), .b(dataB[31]), .bitInvert(bitInvert), .cin(cout[30]), .less(1'b0), .operation(Signal), .dataOut(alu_out[31]), .set(set), .cout(cout[31]) );

Shifter shifter( .dataA(dataB), .dataB(shamt), .dataOut(shifter_out) );

assign dataOut = (control == ALU_SLL)? shifter_out : alu_out;

endmodule