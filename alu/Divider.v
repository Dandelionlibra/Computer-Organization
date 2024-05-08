`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
// 2nd Multiplier
input clk ;
input reset ;
input [31:0] dataA ; // Multiplicand
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;

//   Signal ( 6-bits)?
//   DIVU  : 27

reg [63:0] product;
reg [31:0] multiply ;
parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;
/*
�w�q�U�ذT��
*/
/*
=====================================================
�U���������d�ҡA�{�����g�п�ӦѮv�W�һ�������k�Ӽg
=====================================================
*/
always@( posedge clk or reset )
begin
        if ( reset )
        begin
                product = 32'b0 ;
                multiply <= dataB;
                product <= {dataA, 32'b0};
        end
/*
reset�T�� �p�G�Oreset�N���k0
*/
        else
        begin
		case ( Signal )
        MULTU :
        begin
                if (multiply[0] == 1'b1) begin
                        product <= product + {dataA, 32'b0};
                end
               product <= product >> 1;
               multiply <= multiply >> 1;
        end
		endcase
        end
/*
���k�B��
OUT�������O�n��control���A���O�A�~����⵪�׿�X��HILO�Ȧs��
*/

end
assign dataOut = product ;

/*
=====================================================
�W���������d�ҡA�{�����g�п�ӦѮv�W�һ�������k�Ӽg
=====================================================
*/
endmodule