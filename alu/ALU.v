`timescale 1ns/1ns
module ALU( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42

reg [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
/*
�w�q�U�ذT��
*/

/*
=====================================================
�U���������d�ҡA�{�����g�п��ӦѮv�W�һ�������k�Ӽg
=====================================================
*/
always@( dataA or dataB or Signal or reset )
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
		AND:
		begin
			temp = dataA & dataB ;
		end
		OR:
		begin
			temp = dataA | dataB ;
		end
		ADD:
		begin
			temp = dataA + dataB ;
		end
		SUB:
		begin
			temp = dataA - dataB ;
		end
		SLT:
		begin
			if ( dataA < dataB )
				temp = 1 ;
			else
				temp = 0 ;
		end
		default: temp = 32'b0 ;	
	
		endcase
	end
/*
�W���o��case�O�b���T���B�z
���O�ھڶǶi�Ӫ�signal�Ӱ����P���B��
�M���i�Ȧs��
*/
end
assign dataOut = temp ;
/*
=====================================================
�W���������d�ҡA�{�����g�п��ӦѮv�W�һ�������k�Ӽg
=====================================================
*/

endmodule