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
定義各種訊號
*/
/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
always@( posedge clk or reset )
begin
    
        if ( reset )
        begin
                product <= 64'b0 ;
                multiply <= dataB;
                
        end
        
/*
reset訊號 如果是reset就做歸0
*/
        else
        begin
		case ( Signal )
        MULTU :
        begin
                $display("multiply = %d", multiply);
                if (multiply[0] == 1'b1) begin
                    product[63:32] <= product[63:32] + dataA;
                    $display("product1 = %d", product);
                end
               product <= product >> 1;
               $display("product = %d", product);
               multiply <= multiply >> 1;
        end
        OUT :
        begin 


        end
		endcase
        end
/*
除法運算
OUT的部分是要等control給你指令你才能夠把答案輸出到HILO暫存器
*/

end
assign dataOut = product ;

/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
endmodule