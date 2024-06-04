// 設定時間尺度
`timescale 1ns/1ns
// 定義 module Shifter 可連接的 ports
module Shifter( dataA, dataB, dataOut );
// 定義哪些 ports 為 input，哪些為 output
input [31:0] dataA ;
input [4:0] dataB ;
output [31:0] dataOut ;

// orginal reg, reg only can used in always block and initial block, combinational block can't use reg
// 宣告 Barrel Shifter 五層的輸出為 wire
wire [31:0] temp, temp1, temp2, temp3, temp4 ;

// 定義參數常數
parameter SLL = 6'b000000;
// 第一層，1 位元左移
MUX2_1 mux1_0( .in0(dataA[31]), .in1(dataA[30]), .sel(dataB[0]), .out(temp[31]) );
MUX2_1 mux1_1( .in0(dataA[30]), .in1(dataA[29]), .sel(dataB[0]), .out(temp[30]) );
MUX2_1 mux1_2( .in0(dataA[29]), .in1(dataA[28]), .sel(dataB[0]), .out(temp[29]) );
MUX2_1 mux1_3( .in0(dataA[28]), .in1(dataA[27]), .sel(dataB[0]), .out(temp[28]) );
MUX2_1 mux1_4( .in0(dataA[27]), .in1(dataA[26]), .sel(dataB[0]), .out(temp[27]) );
MUX2_1 mux1_5( .in0(dataA[26]), .in1(dataA[25]), .sel(dataB[0]), .out(temp[26]) );
MUX2_1 mux1_6( .in0(dataA[25]), .in1(dataA[24]), .sel(dataB[0]), .out(temp[25]) );
MUX2_1 mux1_7( .in0(dataA[24]), .in1(dataA[23]), .sel(dataB[0]), .out(temp[24]) );
MUX2_1 mux1_8( .in0(dataA[23]), .in1(dataA[22]), .sel(dataB[0]), .out(temp[23]) );
MUX2_1 mux1_9( .in0(dataA[22]), .in1(dataA[21]), .sel(dataB[0]), .out(temp[22]) );
MUX2_1 mux1_10( .in0(dataA[21]), .in1(dataA[20]), .sel(dataB[0]), .out(temp[21]) );
MUX2_1 mux1_11( .in0(dataA[20]), .in1(dataA[19]), .sel(dataB[0]), .out(temp[20]) );
MUX2_1 mux1_12( .in0(dataA[19]), .in1(dataA[18]), .sel(dataB[0]), .out(temp[19]) );
MUX2_1 mux1_13( .in0(dataA[18]), .in1(dataA[17]), .sel(dataB[0]), .out(temp[18]) );
MUX2_1 mux1_14( .in0(dataA[17]), .in1(dataA[16]), .sel(dataB[0]), .out(temp[17]) );
MUX2_1 mux1_15( .in0(dataA[16]), .in1(dataA[15]), .sel(dataB[0]), .out(temp[16]) );
MUX2_1 mux1_16( .in0(dataA[15]), .in1(dataA[14]), .sel(dataB[0]), .out(temp[15]) );
MUX2_1 mux1_17( .in0(dataA[14]), .in1(dataA[13]), .sel(dataB[0]), .out(temp[14]) );
MUX2_1 mux1_18( .in0(dataA[13]), .in1(dataA[12]), .sel(dataB[0]), .out(temp[13]) );
MUX2_1 mux1_19( .in0(dataA[12]), .in1(dataA[11]), .sel(dataB[0]), .out(temp[12]) );
MUX2_1 mux1_20( .in0(dataA[11]), .in1(dataA[10]), .sel(dataB[0]), .out(temp[11]) );
MUX2_1 mux1_21( .in0(dataA[10]), .in1(dataA[9]), .sel(dataB[0]), .out(temp[10]) );
MUX2_1 mux1_22( .in0(dataA[9]), .in1(dataA[8]), .sel(dataB[0]), .out(temp[9]) );
MUX2_1 mux1_23( .in0(dataA[8]), .in1(dataA[7]), .sel(dataB[0]), .out(temp[8]) );
MUX2_1 mux1_24( .in0(dataA[7]), .in1(dataA[6]), .sel(dataB[0]), .out(temp[7]) );
MUX2_1 mux1_25( .in0(dataA[6]), .in1(dataA[5]), .sel(dataB[0]), .out(temp[6]) );
MUX2_1 mux1_26( .in0(dataA[5]), .in1(dataA[4]), .sel(dataB[0]), .out(temp[5]) );
MUX2_1 mux1_27( .in0(dataA[4]), .in1(dataA[3]), .sel(dataB[0]), .out(temp[4]) );
MUX2_1 mux1_28( .in0(dataA[3]), .in1(dataA[2]), .sel(dataB[0]), .out(temp[3]) );
MUX2_1 mux1_29( .in0(dataA[2]), .in1(dataA[1]), .sel(dataB[0]), .out(temp[2]) );
MUX2_1 mux1_30( .in0(dataA[1]), .in1(dataA[0]), .sel(dataB[0]), .out(temp[1]) );
MUX2_1 mux1_31( .in0(dataA[0]), .in1(1'b0), .sel(dataB[0]), .out(temp[0]) );

// 第二層，2 位元左移
MUX2_1 mux2_0( .in0(temp[31]), .in1(temp[29]), .sel(dataB[1]), .out(temp1[31]) );
MUX2_1 mux2_1( .in0(temp[30]), .in1(temp[28]), .sel(dataB[1]), .out(temp1[30]) );
MUX2_1 mux2_2( .in0(temp[29]), .in1(temp[27]), .sel(dataB[1]), .out(temp1[29]) );
MUX2_1 mux2_3( .in0(temp[28]), .in1(temp[26]), .sel(dataB[1]), .out(temp1[28]) );
MUX2_1 mux2_4( .in0(temp[27]), .in1(temp[25]), .sel(dataB[1]), .out(temp1[27]) );
MUX2_1 mux2_5( .in0(temp[26]), .in1(temp[24]), .sel(dataB[1]), .out(temp1[26]) );
MUX2_1 mux2_6( .in0(temp[25]), .in1(temp[23]), .sel(dataB[1]), .out(temp1[25]) );
MUX2_1 mux2_7( .in0(temp[24]), .in1(temp[22]), .sel(dataB[1]), .out(temp1[24]) );
MUX2_1 mux2_8( .in0(temp[23]), .in1(temp[21]), .sel(dataB[1]), .out(temp1[23]) );
MUX2_1 mux2_9( .in0(temp[22]), .in1(temp[20]), .sel(dataB[1]), .out(temp1[22]) );
MUX2_1 mux2_10( .in0(temp[21]), .in1(temp[19]), .sel(dataB[1]), .out(temp1[21]) );
MUX2_1 mux2_11( .in0(temp[20]), .in1(temp[18]), .sel(dataB[1]), .out(temp1[20]) );
MUX2_1 mux2_12( .in0(temp[19]), .in1(temp[17]), .sel(dataB[1]), .out(temp1[19]) );
MUX2_1 mux2_13( .in0(temp[18]), .in1(temp[16]), .sel(dataB[1]), .out(temp1[18]) );
MUX2_1 mux2_14( .in0(temp[17]), .in1(temp[15]), .sel(dataB[1]), .out(temp1[17]) );
MUX2_1 mux2_15( .in0(temp[16]), .in1(temp[14]), .sel(dataB[1]), .out(temp1[16]) );
MUX2_1 mux2_16( .in0(temp[15]), .in1(temp[13]), .sel(dataB[1]), .out(temp1[15]) );
MUX2_1 mux2_17( .in0(temp[14]), .in1(temp[12]), .sel(dataB[1]), .out(temp1[14]) );
MUX2_1 mux2_18( .in0(temp[13]), .in1(temp[11]), .sel(dataB[1]), .out(temp1[13]) );
MUX2_1 mux2_19( .in0(temp[12]), .in1(temp[10]), .sel(dataB[1]), .out(temp1[12]) );
MUX2_1 mux2_20( .in0(temp[11]), .in1(temp[9]), .sel(dataB[1]), .out(temp1[11]) );
MUX2_1 mux2_21( .in0(temp[10]), .in1(temp[8]), .sel(dataB[1]), .out(temp1[10]) );
MUX2_1 mux2_22( .in0(temp[9]), .in1(temp[7]), .sel(dataB[1]), .out(temp1[9]) );
MUX2_1 mux2_23( .in0(temp[8]), .in1(temp[6]), .sel(dataB[1]), .out(temp1[8]) );
MUX2_1 mux2_24( .in0(temp[7]), .in1(temp[5]), .sel(dataB[1]), .out(temp1[7]) );
MUX2_1 mux2_25( .in0(temp[6]), .in1(temp[4]), .sel(dataB[1]), .out(temp1[6]) );
MUX2_1 mux2_26( .in0(temp[5]), .in1(temp[3]), .sel(dataB[1]), .out(temp1[5]) );
MUX2_1 mux2_27( .in0(temp[4]), .in1(temp[2]), .sel(dataB[1]), .out(temp1[4]) );
MUX2_1 mux2_28( .in0(temp[3]), .in1(temp[1]), .sel(dataB[1]), .out(temp1[3]) );
MUX2_1 mux2_29( .in0(temp[2]), .in1(temp[0]), .sel(dataB[1]), .out(temp1[2]) );
MUX2_1 mux2_30( .in0(temp[1]), .in1(1'b0), .sel(dataB[1]), .out(temp1[1]) );
MUX2_1 mux2_31( .in0(temp[0]), .in1(1'b0), .sel(dataB[1]), .out(temp1[0]) );

// 第三層，4 位元左移
MUX2_1 mux3_0( .in0(temp1[31]), .in1(temp1[27]), .sel(dataB[2]), .out(temp2[31]) );
MUX2_1 mux3_1( .in0(temp1[30]), .in1(temp1[26]), .sel(dataB[2]), .out(temp2[30]) );
MUX2_1 mux3_2( .in0(temp1[29]), .in1(temp1[25]), .sel(dataB[2]), .out(temp2[29]) );
MUX2_1 mux3_3( .in0(temp1[28]), .in1(temp1[24]), .sel(dataB[2]), .out(temp2[28]) );
MUX2_1 mux3_4( .in0(temp1[27]), .in1(temp1[23]), .sel(dataB[2]), .out(temp2[27]) );
MUX2_1 mux3_5( .in0(temp1[26]), .in1(temp1[22]), .sel(dataB[2]), .out(temp2[26]) );
MUX2_1 mux3_6( .in0(temp1[25]), .in1(temp1[21]), .sel(dataB[2]), .out(temp2[25]) );
MUX2_1 mux3_7( .in0(temp1[24]), .in1(temp1[20]), .sel(dataB[2]), .out(temp2[24]) );
MUX2_1 mux3_8( .in0(temp1[23]), .in1(temp1[19]), .sel(dataB[2]), .out(temp2[23]) );
MUX2_1 mux3_9( .in0(temp1[22]), .in1(temp1[18]), .sel(dataB[2]), .out(temp2[22]) );
MUX2_1 mux3_10( .in0(temp1[21]), .in1(temp1[17]), .sel(dataB[2]), .out(temp2[21]) );
MUX2_1 mux3_11( .in0(temp1[20]), .in1(temp1[16]), .sel(dataB[2]), .out(temp2[20]) );
MUX2_1 mux3_12( .in0(temp1[19]), .in1(temp1[15]), .sel(dataB[2]), .out(temp2[19]) );
MUX2_1 mux3_13( .in0(temp1[18]), .in1(temp1[14]), .sel(dataB[2]), .out(temp2[18]) );
MUX2_1 mux3_14( .in0(temp1[17]), .in1(temp1[13]), .sel(dataB[2]), .out(temp2[17]) );
MUX2_1 mux3_15( .in0(temp1[16]), .in1(temp1[12]), .sel(dataB[2]), .out(temp2[16]) );
MUX2_1 mux3_16( .in0(temp1[15]), .in1(temp1[11]), .sel(dataB[2]), .out(temp2[15]) );
MUX2_1 mux3_17( .in0(temp1[14]), .in1(temp1[10]), .sel(dataB[2]), .out(temp2[14]) );
MUX2_1 mux3_18( .in0(temp1[13]), .in1(temp1[9]), .sel(dataB[2]), .out(temp2[13]) );
MUX2_1 mux3_19( .in0(temp1[12]), .in1(temp1[8]), .sel(dataB[2]), .out(temp2[12]) );
MUX2_1 mux3_20( .in0(temp1[11]), .in1(temp1[7]), .sel(dataB[2]), .out(temp2[11]) );
MUX2_1 mux3_21( .in0(temp1[10]), .in1(temp1[6]), .sel(dataB[2]), .out(temp2[10]) );
MUX2_1 mux3_22( .in0(temp1[9]), .in1(temp1[5]), .sel(dataB[2]), .out(temp2[9]) );
MUX2_1 mux3_23( .in0(temp1[8]), .in1(temp1[4]), .sel(dataB[2]), .out(temp2[8]) );
MUX2_1 mux3_24( .in0(temp1[7]), .in1(temp1[3]), .sel(dataB[2]), .out(temp2[7]) );
MUX2_1 mux3_25( .in0(temp1[6]), .in1(temp1[2]), .sel(dataB[2]), .out(temp2[6]) );
MUX2_1 mux3_26( .in0(temp1[5]), .in1(temp1[1]), .sel(dataB[2]), .out(temp2[5]) );
MUX2_1 mux3_27( .in0(temp1[4]), .in1(temp1[0]), .sel(dataB[2]), .out(temp2[4]) );
MUX2_1 mux3_28( .in0(temp1[3]), .in1(1'b0), .sel(dataB[2]), .out(temp2[3]) );
MUX2_1 mux3_29( .in0(temp1[2]), .in1(1'b0), .sel(dataB[2]), .out(temp2[2]) );
MUX2_1 mux3_30( .in0(temp1[1]), .in1(1'b0), .sel(dataB[2]), .out(temp2[1]) );
MUX2_1 mux3_31( .in0(temp1[0]), .in1(1'b0), .sel(dataB[2]), .out(temp2[0]) );

// 第四層，8 位元左移
MUX2_1 mux4_0( .in0(temp2[31]), .in1(temp2[23]), .sel(dataB[3]), .out(temp3[31]) );
MUX2_1 mux4_1( .in0(temp2[30]), .in1(temp2[22]), .sel(dataB[3]), .out(temp3[30]) );
MUX2_1 mux4_2( .in0(temp2[29]), .in1(temp2[21]), .sel(dataB[3]), .out(temp3[29]) );
MUX2_1 mux4_3( .in0(temp2[28]), .in1(temp2[20]), .sel(dataB[3]), .out(temp3[28]) );
MUX2_1 mux4_4( .in0(temp2[27]), .in1(temp2[19]), .sel(dataB[3]), .out(temp3[27]) );
MUX2_1 mux4_5( .in0(temp2[26]), .in1(temp2[18]), .sel(dataB[3]), .out(temp3[26]) );
MUX2_1 mux4_6( .in0(temp2[25]), .in1(temp2[17]), .sel(dataB[3]), .out(temp3[25]) );
MUX2_1 mux4_7( .in0(temp2[24]), .in1(temp2[16]), .sel(dataB[3]), .out(temp3[24]) );
MUX2_1 mux4_8( .in0(temp2[23]), .in1(temp2[15]), .sel(dataB[3]), .out(temp3[23]) );
MUX2_1 mux4_9( .in0(temp2[22]), .in1(temp2[14]), .sel(dataB[3]), .out(temp3[22]) );
MUX2_1 mux4_10( .in0(temp2[21]), .in1(temp2[13]), .sel(dataB[3]), .out(temp3[21]) );
MUX2_1 mux4_11( .in0(temp2[20]), .in1(temp2[12]), .sel(dataB[3]), .out(temp3[20]) );
MUX2_1 mux4_12( .in0(temp2[19]), .in1(temp2[11]), .sel(dataB[3]), .out(temp3[19]) );
MUX2_1 mux4_13( .in0(temp2[18]), .in1(temp2[10]), .sel(dataB[3]), .out(temp3[18]) );
MUX2_1 mux4_14( .in0(temp2[17]), .in1(temp2[9]), .sel(dataB[3]), .out(temp3[17]) );
MUX2_1 mux4_15( .in0(temp2[16]), .in1(temp2[8]), .sel(dataB[3]), .out(temp3[16]) );
MUX2_1 mux4_16( .in0(temp2[15]), .in1(temp2[7]), .sel(dataB[3]), .out(temp3[15]) );
MUX2_1 mux4_17( .in0(temp2[14]), .in1(temp2[6]), .sel(dataB[3]), .out(temp3[14]) );
MUX2_1 mux4_18( .in0(temp2[13]), .in1(temp2[5]), .sel(dataB[3]), .out(temp3[13]) );
MUX2_1 mux4_19( .in0(temp2[12]), .in1(temp2[4]), .sel(dataB[3]), .out(temp3[12]) );
MUX2_1 mux4_20( .in0(temp2[11]), .in1(temp2[3]), .sel(dataB[3]), .out(temp3[11]) );
MUX2_1 mux4_21( .in0(temp2[10]), .in1(temp2[2]), .sel(dataB[3]), .out(temp3[10]) );
MUX2_1 mux4_22( .in0(temp2[9]), .in1(temp2[1]), .sel(dataB[3]), .out(temp3[9]) );
MUX2_1 mux4_23( .in0(temp2[8]), .in1(temp2[0]), .sel(dataB[3]), .out(temp3[8]) );
MUX2_1 mux4_24( .in0(temp2[7]), .in1(1'b0), .sel(dataB[3]), .out(temp3[7]) );
MUX2_1 mux4_25( .in0(temp2[6]), .in1(1'b0), .sel(dataB[3]), .out(temp3[6]) );
MUX2_1 mux4_26( .in0(temp2[5]), .in1(1'b0), .sel(dataB[3]), .out(temp3[5]) );
MUX2_1 mux4_27( .in0(temp2[4]), .in1(1'b0), .sel(dataB[3]), .out(temp3[4]) );
MUX2_1 mux4_28( .in0(temp2[3]), .in1(1'b0), .sel(dataB[3]), .out(temp3[3]) );
MUX2_1 mux4_29( .in0(temp2[2]), .in1(1'b0), .sel(dataB[3]), .out(temp3[2]) );
MUX2_1 mux4_30( .in0(temp2[1]), .in1(1'b0), .sel(dataB[3]), .out(temp3[1]) );
MUX2_1 mux4_31( .in0(temp2[0]), .in1(1'b0), .sel(dataB[3]), .out(temp3[0]) );

// 第五層，16 位元左移
MUX2_1 mux5_0( .in0(temp3[31]), .in1(temp3[15]), .sel(dataB[4]), .out(temp4[31]) );
MUX2_1 mux5_1( .in0(temp3[30]), .in1(temp3[14]), .sel(dataB[4]), .out(temp4[30]) );
MUX2_1 mux5_2( .in0(temp3[29]), .in1(temp3[13]), .sel(dataB[4]), .out(temp4[29]) );
MUX2_1 mux5_3( .in0(temp3[28]), .in1(temp3[12]), .sel(dataB[4]), .out(temp4[28]) );
MUX2_1 mux5_4( .in0(temp3[27]), .in1(temp3[11]), .sel(dataB[4]), .out(temp4[27]) );
MUX2_1 mux5_5( .in0(temp3[26]), .in1(temp3[10]), .sel(dataB[4]), .out(temp4[26]) );
MUX2_1 mux5_6( .in0(temp3[25]), .in1(temp3[9]), .sel(dataB[4]), .out(temp4[25]) );
MUX2_1 mux5_7( .in0(temp3[24]), .in1(temp3[8]), .sel(dataB[4]), .out(temp4[24]) );
MUX2_1 mux5_8( .in0(temp3[23]), .in1(temp3[7]), .sel(dataB[4]), .out(temp4[23]) );
MUX2_1 mux5_9( .in0(temp3[22]), .in1(temp3[6]), .sel(dataB[4]), .out(temp4[22]) );
MUX2_1 mux5_10( .in0(temp3[21]), .in1(temp3[5]), .sel(dataB[4]), .out(temp4[21]) );
MUX2_1 mux5_11( .in0(temp3[20]), .in1(temp3[4]), .sel(dataB[4]), .out(temp4[20]) );
MUX2_1 mux5_12( .in0(temp3[19]), .in1(temp3[3]), .sel(dataB[4]), .out(temp4[19]) );
MUX2_1 mux5_13( .in0(temp3[18]), .in1(temp3[2]), .sel(dataB[4]), .out(temp4[18]) );
MUX2_1 mux5_14( .in0(temp3[17]), .in1(temp3[1]), .sel(dataB[4]), .out(temp4[17]) );
MUX2_1 mux5_15( .in0(temp3[16]), .in1(temp3[0]), .sel(dataB[4]), .out(temp4[16]) );
MUX2_1 mux5_16( .in0(temp3[15]), .in1(1'b0), .sel(dataB[4]), .out(temp4[15]) );
MUX2_1 mux5_17( .in0(temp3[14]), .in1(1'b0), .sel(dataB[4]), .out(temp4[14]) );
MUX2_1 mux5_18( .in0(temp3[13]), .in1(1'b0), .sel(dataB[4]), .out(temp4[13]) );
MUX2_1 mux5_19( .in0(temp3[12]), .in1(1'b0), .sel(dataB[4]), .out(temp4[12]) );
MUX2_1 mux5_20( .in0(temp3[11]), .in1(1'b0), .sel(dataB[4]), .out(temp4[11]) );
MUX2_1 mux5_21( .in0(temp3[10]), .in1(1'b0), .sel(dataB[4]), .out(temp4[10]) );
MUX2_1 mux5_22( .in0(temp3[9]), .in1(1'b0), .sel(dataB[4]), .out(temp4[9]) );
MUX2_1 mux5_23( .in0(temp3[8]), .in1(1'b0), .sel(dataB[4]), .out(temp4[8]) );
MUX2_1 mux5_24( .in0(temp3[7]), .in1(1'b0), .sel(dataB[4]), .out(temp4[7]) );
MUX2_1 mux5_25( .in0(temp3[6]), .in1(1'b0), .sel(dataB[4]), .out(temp4[6]) );
MUX2_1 mux5_26( .in0(temp3[5]), .in1(1'b0), .sel(dataB[4]), .out(temp4[5]) );
MUX2_1 mux5_27( .in0(temp3[4]), .in1(1'b0), .sel(dataB[4]), .out(temp4[4]) );
MUX2_1 mux5_28( .in0(temp3[3]), .in1(1'b0), .sel(dataB[4]), .out(temp4[3]) );
MUX2_1 mux5_29( .in0(temp3[2]), .in1(1'b0), .sel(dataB[4]), .out(temp4[2]) );
MUX2_1 mux5_30( .in0(temp3[1]), .in1(1'b0), .sel(dataB[4]), .out(temp4[1]) );
MUX2_1 mux5_31( .in0(temp3[0]), .in1(1'b0), .sel(dataB[4]), .out(temp4[0]) );

// 若訊號為左移，將 dataOut 設為第五層的輸出
assign dataOut = temp4 ;

endmodule