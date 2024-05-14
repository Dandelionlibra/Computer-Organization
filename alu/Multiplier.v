`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
// 2nd Multiplier
input clk ;
input reset ;
input [31:0] dataA ; // Multiplicand
input [31:0] dataB ;
input [5:0] Signal ;
output reg [63:0] dataOut ;

reg [63:0] product;
reg [31:0] multiply, multiplicand ;
parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;


always@(dataA)
begin
    multiplicand = dataA;
end

always@(dataB)
begin
    multiply = dataB;
end
always@( posedge clk or reset )
begin
        if ( reset )
        begin
                product <= 64'd0 ;
        end
        
        else
        begin
		case ( Signal )
        MULTU :
        begin
                if (multiply[0] == 1'b1)
				begin
                    product[63:32] = product[63:32] + multiplicand;
                end
               product = product >> 1;
               multiply = multiply >> 1;
        end
        OUT :
        begin 

            dataOut = product ;
        end
		endcase
        end

end
endmodule