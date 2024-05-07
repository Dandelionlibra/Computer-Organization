`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;


reg [31:0] temp ;

parameter SRL = 6'b000010;

MUX2_1 mux_1( .ALUOut(dataOut[0]), .Shifter(), .Signal(Signal), .dataOut(dataOut) );
MUX2_1 mux_2( .ALUOut(dataOut[0]), .Shifter(), .Signal(Signal), .dataOut(dataOut) )
MUX2_1 mux_3( .ALUOut(dataOut[0]), .Shifter(), .Signal(Signal), .dataOut(dataOut) )
MUX2_1 mux_4( .ALUOut(dataOut[0]), .Shifter(), .Signal(Signal), .dataOut(dataOut) )

/*
=====================================================
�U���������d�ҡA�{�����g�п��ӦѮv�W�һ�������k�Ӽg
=====================================================
*/
always@( Signal or dataA or dataB or reset )
begin
	if ( reset )
	begin
		temp = 32'b0 ;
	end
/*
reset�T�� �p�G�Oreset�N���k0
*/
	else
	begin
		case ( Signal )
		SRL:
		begin
			temp = dataA >> dataB ;
		end
		default: temp = 32'b0 ;	
	
		endcase
	end
/*
���쾹�B��
*/
end
assign dataOut = temp ;
/*
=====================================================
�W���������d�ҡA�{�����g�п��ӦѮv�W�һ�������k�Ӽg
=====================================================
*/

endmodule