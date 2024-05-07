`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

reg [31:0] temp ;

parameter SLL = 6'b000010;

MUX2_1 mux1_0( 0, .in1(dataA[31]), .Signal(dataB[0]), .dataOut(temp[0]) )
MUX2_1 mux1_1( .in0(dataA[31]), .in1(dataA[30]), .Signal(dataB[0]), .dataOut(temp[1]) )
MUX2_1 mux1_2( .in0(dataA[30]), .in1(dataA[29]), .Signal(dataB[0]), .dataOut(temp[2]) )
MUX2_1 mux1_3( .in0(dataA[29]), .in1(dataA[28]), .Signal(dataB[0]), .dataOut(temp[3]) )
MUX2_1 mux1_4( .in0(dataA[28]), .in1(dataA[27]), .Signal(dataB[0]), .dataOut(temp[4]) )
MUX2_1 mux1_5( .in0(dataA[27]), .in1(dataA[26]), .Signal(dataB[0]), .dataOut(temp[5]) )
MUX2_1 mux1_6( .in0(dataA[26]), .in1(dataA[25]), .Signal(dataB[0]), .dataOut(temp[6]) )
MUX2_1 mux1_7( .in0(dataA[25]), .in1(dataA[24]), .Signal(dataB[0]), .dataOut(temp[7]) )
MUX2_1 mux1_8( .in0(dataA[24]), .in1(dataA[23]), .Signal(dataB[0]), .dataOut(temp[8]) )
MUX2_1 mux1_9( .in0(dataA[23]), .in1(dataA[22]), .Signal(dataB[0]), .dataOut(temp[9]) )
MUX2_1 mux1_10( .in0(dataA[22]), .in1(dataA[21]), .Signal(dataB[0]), .dataOut(temp[10]) )
MUX2_1 mux1_11( .in0(dataA[21]), .in1(dataA[20]), .Signal(dataB[0]), .dataOut(temp[11]) )
MUX2_1 mux1_12( .in0(dataA[20]), .in1(dataA[19]), .Signal(dataB[0]), .dataOut(temp[12]) )
MUX2_1 mux1_13( .in0(dataA[19]), .in1(dataA[18]), .Signal(dataB[0]), .dataOut(temp[13]) )
MUX2_1 mux1_14( .in0(dataA[18]), .in1(dataA[17]), .Signal(dataB[0]), .dataOut(temp[14]) )
MUX2_1 mux1_15( .in0(dataA[17]), .in1(dataA[16]), .Signal(dataB[0]), .dataOut(temp[15]) )
MUX2_1 mux1_16( .in0(dataA[16]), .in1(dataA[15]), .Signal(dataB[0]), .dataOut(temp[16]) )
MUX2_1 mux1_17( .in0(dataA[15]), .in1(dataA[14]), .Signal(dataB[0]), .dataOut(temp[17]) )
MUX2_1 mux1_18( .in0(dataA[14]), .in1(dataA[13]), .Signal(dataB[0]), .dataOut(temp[18]) )
MUX2_1 mux1_19( .in0(dataA[13]), .in1(dataA[12]), .Signal(dataB[0]), .dataOut(temp[19]) )
MUX2_1 mux1_20( .in0(dataA[12]), .in1(dataA[11]), .Signal(dataB[0]), .dataOut(temp[20]) )
MUX2_1 mux1_21( .in0(dataA[11]), .in1(dataA[10]), .Signal(dataB[0]), .dataOut(temp[21]) )
MUX2_1 mux1_22( .in0(dataA[10]), .in1(dataA[9]), .Signal(dataB[0]), .dataOut(temp[22]) )
MUX2_1 mux1_23( .in0(dataA[9]), .in1(dataA[8]), .Signal(dataB[0]), .dataOut(temp[23]) )
MUX2_1 mux1_24( .in0(dataA[8]), .in1(dataA[7]), .Signal(dataB[0]), .dataOut(temp[24]) )
MUX2_1 mux1_25( .in0(dataA[7]), .in1(dataA[6]), .Signal(dataB[0]), .dataOut(temp[25]) )
MUX2_1 mux1_26( .in0(dataA[6]), .in1(dataA[5]), .Signal(dataB[0]), .dataOut(temp[26]) )
MUX2_1 mux1_27( .in0(dataA[5]), .in1(dataA[4]), .Signal(dataB[0]), .dataOut(temp[27]) )
MUX2_1 mux1_28( .in0(dataA[4]), .in1(dataA[3]), .Signal(dataB[0]), .dataOut(temp[28]) )
MUX2_1 mux1_29( .in0(dataA[3]), .in1(dataA[2]), .Signal(dataB[0]), .dataOut(temp[29]) )
MUX2_1 mux1_30( .in0(dataA[2]), .in1(dataA[1]), .Signal(dataB[0]), .dataOut(temp[30]) )
MUX2_1 mux1_31( .in0(dataA[1]), .in1(dataA[0]), .Signal(dataB[0]), .dataOut(temp[31]) )

MUX2_1 mux2_0( 0, .in1(dataA[31]), .Signal(dataB[1]), .dataOut(temp[0]) )
MUX2_1 mux2_1( .in0(dataA[31]), .in1(dataA[30]), .Signal(dataB[1]), .dataOut(temp[1]) )
MUX2_1 mux2_2( .in0(dataA[30]), .in1(dataA[29]), .Signal(dataB[1]), .dataOut(temp[2]) )
MUX2_1 mux2_3( .in0(dataA[29]), .in1(dataA[28]), .Signal(dataB[1]), .dataOut(temp[3]) )
MUX2_1 mux2_4( .in0(dataA[28]), .in1(dataA[27]), .Signal(dataB[1]), .dataOut(temp[4]) )
MUX2_1 mux2_5( .in0(dataA[27]), .in1(dataA[26]), .Signal(dataB[1]), .dataOut(temp[5]) )
MUX2_1 mux2_6( .in0(dataA[26]), .in1(dataA[25]), .Signal(dataB[1]), .dataOut(temp[6]) )
MUX2_1 mux2_7( .in0(dataA[25]), .in1(dataA[24]), .Signal(dataB[1]), .dataOut(temp[7]) )
MUX2_1 mux2_8( .in0(dataA[24]), .in1(dataA[23]), .Signal(dataB[1]), .dataOut(temp[8]) )
MUX2_1 mux2_9( .in0(dataA[23]), .in1(dataA[22]), .Signal(dataB[1]), .dataOut(temp[9]) )
MUX2_1 mux2_10( .in0(dataA[22]), .in1(dataA[21]), .Signal(dataB[1]), .dataOut(temp[10]) )
MUX2_1 mux2_11( .in0(dataA[21]), .in1(dataA[20]), .Signal(dataB[1]), .dataOut(temp[11]) )
MUX2_1 mux2_12( .in0(dataA[20]), .in1(dataA[19]), .Signal(dataB[1]), .dataOut(temp[12]) )
MUX2_1 mux2_13( .in0(dataA[19]), .in1(dataA[18]), .Signal(dataB[1]), .dataOut(temp[13]) )
MUX2_1 mux2_14( .in0(dataA[18]), .in1(dataA[17]), .Signal(dataB[1]), .dataOut(temp[14]) )
MUX2_1 mux2_15( .in0(dataA[17]), .in1(dataA[16]), .Signal(dataB[1]), .dataOut(temp[15]) )
MUX2_1 mux2_16( .in0(dataA[16]), .in1(dataA[15]), .Signal(dataB[1]), .dataOut(temp[16]) )
MUX2_1 mux2_17( .in0(dataA[15]), .in1(dataA[14]), .Signal(dataB[1]), .dataOut(temp[17]) )
MUX2_1 mux2_18( .in0(dataA[14]), .in1(dataA[13]), .Signal(dataB[1]), .dataOut(temp[18]) )
MUX2_1 mux2_19( .in0(dataA[13]), .in1(dataA[12]), .Signal(dataB[1]), .dataOut(temp[19]) )
MUX2_1 mux2_20( .in0(dataA[12]), .in1(dataA[11]), .Signal(dataB[1]), .dataOut(temp[20]) )
MUX2_1 mux2_21( .in0(dataA[11]), .in1(dataA[10]), .Signal(dataB[1]), .dataOut(temp[21]) )
MUX2_1 mux2_22( .in0(dataA[10]), .in1(dataA[9]), .Signal(dataB[1]), .dataOut(temp[22]) )
MUX2_1 mux2_23( .in0(dataA[9]), .in1(dataA[8]), .Signal(dataB[1]), .dataOut(temp[23]) )
MUX2_1 mux2_24( .in0(dataA[8]), .in1(dataA[7]), .Signal(dataB[1]), .dataOut(temp[24]) )
MUX2_1 mux2_25( .in0(dataA[7]), .in1(dataA[6]), .Signal(dataB[1]), .dataOut(temp[25]) )
MUX2_1 mux2_26( .in0(dataA[6]), .in1(dataA[5]), .Signal(dataB[1]), .dataOut(temp[26]) )
MUX2_1 mux2_27( .in0(dataA[5]), .in1(dataA[4]), .Signal(dataB[1]), .dataOut(temp[27]) )
MUX2_1 mux2_28( .in0(dataA[4]), .in1(dataA[3]), .Signal(dataB[1]), .dataOut(temp[28]) )
MUX2_1 mux2_29( .in0(dataA[3]), .in1(dataA[2]), .Signal(dataB[1]), .dataOut(temp[29]) )
MUX2_1 mux2_30( .in0(dataA[2]), .in1(dataA[1]), .Signal(dataB[1]), .dataOut(temp[30]) )
MUX2_1 mux2_31( .in0(dataA[1]), .in1(dataA[0]), .Signal(dataB[1]), .dataOut(temp[31]) )

MUX2_1 mux3_0( 0, .in1(dataA[31]), .Signal(dataB[2]), .dataOut(temp[0]) )
MUX2_1 mux3_1( .in0(dataA[31]), .in1(dataA[30]), .Signal(dataB[2]), .dataOut(temp[1]) )
MUX2_1 mux3_2( .in0(dataA[30]), .in1(dataA[29]), .Signal(dataB[2]), .dataOut(temp[2]) )
MUX2_1 mux3_3( .in0(dataA[29]), .in1(dataA[28]), .Signal(dataB[2]), .dataOut(temp[3]) )
MUX2_1 mux3_4( .in0(dataA[28]), .in1(dataA[27]), .Signal(dataB[2]), .dataOut(temp[4]) )
MUX2_1 mux3_5( .in0(dataA[27]), .in1(dataA[26]), .Signal(dataB[2]), .dataOut(temp[5]) )
MUX2_1 mux3_6( .in0(dataA[26]), .in1(dataA[25]), .Signal(dataB[2]), .dataOut(temp[6]) )
MUX2_1 mux3_7( .in0(dataA[25]), .in1(dataA[24]), .Signal(dataB[2]), .dataOut(temp[7]) )
MUX2_1 mux3_8( .in0(dataA[24]), .in1(dataA[23]), .Signal(dataB[2]), .dataOut(temp[8]) )
MUX2_1 mux3_9( .in0(dataA[23]), .in1(dataA[22]), .Signal(dataB[2]), .dataOut(temp[9]) )
MUX2_1 mux3_10( .in0(dataA[22]), .in1(dataA[21]), .Signal(dataB[2]), .dataOut(temp[10]) )
MUX2_1 mux3_11( .in0(dataA[21]), .in1(dataA[20]), .Signal(dataB[2]), .dataOut(temp[11]) )
MUX2_1 mux3_12( .in0(dataA[20]), .in1(dataA[19]), .Signal(dataB[2]), .dataOut(temp[12]) )
MUX2_1 mux3_13( .in0(dataA[19]), .in1(dataA[18]), .Signal(dataB[2]), .dataOut(temp[13]) )
MUX2_1 mux3_14( .in0(dataA[18]), .in1(dataA[17]), .Signal(dataB[2]), .dataOut(temp[14]) )
MUX2_1 mux3_15( .in0(dataA[17]), .in1(dataA[16]), .Signal(dataB[2]), .dataOut(temp[15]) )
MUX2_1 mux3_16( .in0(dataA[16]), .in1(dataA[15]), .Signal(dataB[2]), .dataOut(temp[16]) )
MUX2_1 mux3_17( .in0(dataA[15]), .in1(dataA[14]), .Signal(dataB[2]), .dataOut(temp[17]) )
MUX2_1 mux3_18( .in0(dataA[14]), .in1(dataA[13]), .Signal(dataB[2]), .dataOut(temp[18]) )
MUX2_1 mux3_19( .in0(dataA[13]), .in1(dataA[12]), .Signal(dataB[2]), .dataOut(temp[19]) )
MUX2_1 mux3_20( .in0(dataA[12]), .in1(dataA[11]), .Signal(dataB[2]), .dataOut(temp[20]) )
MUX2_1 mux3_21( .in0(dataA[11]), .in1(dataA[10]), .Signal(dataB[2]), .dataOut(temp[21]) )
MUX2_1 mux3_22( .in0(dataA[10]), .in1(dataA[9]), .Signal(dataB[2]), .dataOut(temp[22]) )
MUX2_1 mux3_23( .in0(dataA[9]), .in1(dataA[8]), .Signal(dataB[2]), .dataOut(temp[23]) )
MUX2_1 mux3_24( .in0(dataA[8]), .in1(dataA[7]), .Signal(dataB[2]), .dataOut(temp[24]) )
MUX2_1 mux3_25( .in0(dataA[7]), .in1(dataA[6]), .Signal(dataB[2]), .dataOut(temp[25]) )
MUX2_1 mux3_26( .in0(dataA[6]), .in1(dataA[5]), .Signal(dataB[2]), .dataOut(temp[26]) )
MUX2_1 mux3_27( .in0(dataA[5]), .in1(dataA[4]), .Signal(dataB[2]), .dataOut(temp[27]) )
MUX2_1 mux3_28( .in0(dataA[4]), .in1(dataA[3]), .Signal(dataB[2]), .dataOut(temp[28]) )
MUX2_1 mux3_29( .in0(dataA[3]), .in1(dataA[2]), .Signal(dataB[2]), .dataOut(temp[29]) )
MUX2_1 mux3_30( .in0(dataA[2]), .in1(dataA[1]), .Signal(dataB[2]), .dataOut(temp[30]) )
MUX2_1 mux3_31( .in0(dataA[1]), .in1(dataA[0]), .Signal(dataB[2]), .dataOut(temp[31]) )

MUX2_1 mux4_0( 0, .in1(dataA[31]), .Signal(dataB[3]), .dataOut(temp[0]) )
MUX2_1 mux4_1( .in0(dataA[31]), .in1(dataA[30]), .Signal(dataB[3]), .dataOut(temp[1]) )
MUX2_1 mux4_2( .in0(dataA[30]), .in1(dataA[29]), .Signal(dataB[3]), .dataOut(temp[2]) )
MUX2_1 mux4_3( .in0(dataA[29]), .in1(dataA[28]), .Signal(dataB[3]), .dataOut(temp[3]) )
MUX2_1 mux4_4( .in0(dataA[28]), .in1(dataA[27]), .Signal(dataB[3]), .dataOut(temp[4]) )
MUX2_1 mux4_5( .in0(dataA[27]), .in1(dataA[26]), .Signal(dataB[3]), .dataOut(temp[5]) )
MUX2_1 mux4_6( .in0(dataA[26]), .in1(dataA[25]), .Signal(dataB[3]), .dataOut(temp[6]) )
MUX2_1 mux4_7( .in0(dataA[25]), .in1(dataA[24]), .Signal(dataB[3]), .dataOut(temp[7]) )
MUX2_1 mux4_8( .in0(dataA[24]), .in1(dataA[23]), .Signal(dataB[3]), .dataOut(temp[8]) )
MUX2_1 mux4_9( .in0(dataA[23]), .in1(dataA[22]), .Signal(dataB[3]), .dataOut(temp[9]) )
MUX2_1 mux4_10( .in0(dataA[22]), .in1(dataA[21]), .Signal(dataB[3]), .dataOut(temp[10]) )
MUX2_1 mux4_11( .in0(dataA[21]), .in1(dataA[20]), .Signal(dataB[3]), .dataOut(temp[11]) )
MUX2_1 mux4_12( .in0(dataA[20]), .in1(dataA[19]), .Signal(dataB[3]), .dataOut(temp[12]) )
MUX2_1 mux4_13( .in0(dataA[19]), .in1(dataA[18]), .Signal(dataB[3]), .dataOut(temp[13]) )
MUX2_1 mux4_14( .in0(dataA[18]), .in1(dataA[17]), .Signal(dataB[3]), .dataOut(temp[14]) )
MUX2_1 mux4_15( .in0(dataA[17]), .in1(dataA[16]), .Signal(dataB[3]), .dataOut(temp[15]) )
MUX2_1 mux4_16( .in0(dataA[16]), .in1(dataA[15]), .Signal(dataB[3]), .dataOut(temp[16]) )
MUX2_1 mux4_17( .in0(dataA[15]), .in1(dataA[14]), .Signal(dataB[3]), .dataOut(temp[17]) )
MUX2_1 mux4_18( .in0(dataA[14]), .in1(dataA[13]), .Signal(dataB[3]), .dataOut(temp[18]) )
MUX2_1 mux4_19( .in0(dataA[13]), .in1(dataA[12]), .Signal(dataB[3]), .dataOut(temp[19]) )
MUX2_1 mux4_20( .in0(dataA[12]), .in1(dataA[11]), .Signal(dataB[3]), .dataOut(temp[20]) )
MUX2_1 mux4_21( .in0(dataA[11]), .in1(dataA[10]), .Signal(dataB[3]), .dataOut(temp[21]) )
MUX2_1 mux4_22( .in0(dataA[10]), .in1(dataA[9]), .Signal(dataB[3]), .dataOut(temp[22]) )
MUX2_1 mux4_23( .in0(dataA[9]), .in1(dataA[8]), .Signal(dataB[3]), .dataOut(temp[23]) )
MUX2_1 mux4_24( .in0(dataA[8]), .in1(dataA[7]), .Signal(dataB[3]), .dataOut(temp[24]) )
MUX2_1 mux4_25( .in0(dataA[7]), .in1(dataA[6]), .Signal(dataB[3]), .dataOut(temp[25]) )
MUX2_1 mux4_26( .in0(dataA[6]), .in1(dataA[5]), .Signal(dataB[3]), .dataOut(temp[26]) )
MUX2_1 mux4_27( .in0(dataA[5]), .in1(dataA[4]), .Signal(dataB[3]), .dataOut(temp[27]) )
MUX2_1 mux4_28( .in0(dataA[4]), .in1(dataA[3]), .Signal(dataB[3]), .dataOut(temp[28]) )
MUX2_1 mux4_29( .in0(dataA[3]), .in1(dataA[2]), .Signal(dataB[3]), .dataOut(temp[29]) )
MUX2_1 mux4_30( .in0(dataA[2]), .in1(dataA[1]), .Signal(dataB[3]), .dataOut(temp[30]) )
MUX2_1 mux4_31( .in0(dataA[1]), .in1(dataA[0]), .Signal(dataB[3]), .dataOut(temp[31]) )

MUX2_1 mux5_0( 0, .in1(dataA[31]), .Signal(dataB[4]), .dataOut(temp[0]) )
MUX2_1 mux5_1( .in0(dataA[31]), .in1(dataA[30]), .Signal(dataB[4]), .dataOut(temp[1]) )
MUX2_1 mux5_2( .in0(dataA[30]), .in1(dataA[29]), .Signal(dataB[4]), .dataOut(temp[2]) )
MUX2_1 mux5_3( .in0(dataA[29]), .in1(dataA[28]), .Signal(dataB[4]), .dataOut(temp[3]) )
MUX2_1 mux5_4( .in0(dataA[28]), .in1(dataA[27]), .Signal(dataB[4]), .dataOut(temp[4]) )
MUX2_1 mux5_5( .in0(dataA[27]), .in1(dataA[26]), .Signal(dataB[4]), .dataOut(temp[5]) )
MUX2_1 mux5_6( .in0(dataA[26]), .in1(dataA[25]), .Signal(dataB[4]), .dataOut(temp[6]) )
MUX2_1 mux5_7( .in0(dataA[25]), .in1(dataA[24]), .Signal(dataB[4]), .dataOut(temp[7]) )
MUX2_1 mux5_8( .in0(dataA[24]), .in1(dataA[23]), .Signal(dataB[4]), .dataOut(temp[8]) )
MUX2_1 mux5_9( .in0(dataA[23]), .in1(dataA[22]), .Signal(dataB[4]), .dataOut(temp[9]) )
MUX2_1 mux5_10( .in0(dataA[22]), .in1(dataA[21]), .Signal(dataB[4]), .dataOut(temp[10]) )
MUX2_1 mux5_11( .in0(dataA[21]), .in1(dataA[20]), .Signal(dataB[4]), .dataOut(temp[11]) )
MUX2_1 mux5_12( .in0(dataA[20]), .in1(dataA[19]), .Signal(dataB[4]), .dataOut(temp[12]) )
MUX2_1 mux5_13( .in0(dataA[19]), .in1(dataA[18]), .Signal(dataB[4]), .dataOut(temp[13]) )
MUX2_1 mux5_14( .in0(dataA[18]), .in1(dataA[17]), .Signal(dataB[4]), .dataOut(temp[14]) )
MUX2_1 mux5_15( .in0(dataA[17]), .in1(dataA[16]), .Signal(dataB[4]), .dataOut(temp[15]) )
MUX2_1 mux5_16( .in0(dataA[16]), .in1(dataA[15]), .Signal(dataB[4]), .dataOut(temp[16]) )
MUX2_1 mux5_17( .in0(dataA[15]), .in1(dataA[14]), .Signal(dataB[4]), .dataOut(temp[17]) )
MUX2_1 mux5_18( .in0(dataA[14]), .in1(dataA[13]), .Signal(dataB[4]), .dataOut(temp[18]) )
MUX2_1 mux5_19( .in0(dataA[13]), .in1(dataA[12]), .Signal(dataB[4]), .dataOut(temp[19]) )
MUX2_1 mux5_20( .in0(dataA[12]), .in1(dataA[11]), .Signal(dataB[4]), .dataOut(temp[20]) )
MUX2_1 mux5_21( .in0(dataA[11]), .in1(dataA[10]), .Signal(dataB[4]), .dataOut(temp[21]) )
MUX2_1 mux5_22( .in0(dataA[10]), .in1(dataA[9]), .Signal(dataB[4]), .dataOut(temp[22]) )
MUX2_1 mux5_23( .in0(dataA[9]), .in1(dataA[8]), .Signal(dataB[4]), .dataOut(temp[23]) )
MUX2_1 mux5_24( .in0(dataA[8]), .in1(dataA[7]), .Signal(dataB[4]), .dataOut(temp[24]) )
MUX2_1 mux5_25( .in0(dataA[7]), .in1(dataA[6]), .Signal(dataB[4]), .dataOut(temp[25]) )
MUX2_1 mux5_26( .in0(dataA[6]), .in1(dataA[5]), .Signal(dataB[4]), .dataOut(temp[26]) )
MUX2_1 mux5_27( .in0(dataA[5]), .in1(dataA[4]), .Signal(dataB[4]), .dataOut(temp[27]) )
MUX2_1 mux5_28( .in0(dataA[4]), .in1(dataA[3]), .Signal(dataB[4]), .dataOut(temp[28]) )
MUX2_1 mux5_29( .in0(dataA[3]), .in1(dataA[2]), .Signal(dataB[4]), .dataOut(temp[29]) )
MUX2_1 mux5_30( .in0(dataA[2]), .in1(dataA[1]), .Signal(dataB[4]), .dataOut(temp[30]) )
MUX2_1 mux5_31( .in0(dataA[1]), .in1(dataA[0]), .Signal(dataB[4]), .dataOut(temp[31]) )

assign dataOut = (Signal == SLL) ? temp : 32'b0 ;



/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
always@( Signal or dataA or dataB or reset )
begin
	if ( reset )
		temp = 32'b0 ;
	
/*
reset訊號 如果是reset就做歸0
*/
	else
	begin
		case ( Signal )
		SRL:
			temp = dataA << dataB ;
		
		default: temp = 32'b0 ;	
	
		endcase
	end
/*
移位器運算
*/
end
assign dataOut = temp ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule