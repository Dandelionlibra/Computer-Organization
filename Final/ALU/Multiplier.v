// 設定時間尺度
`timescale 1ns/1ns
// 定義哪些 ports 為 input，哪些為 output
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset ); // 2nd Multiplier

// 定義哪些 ports 為 input，哪些為 output
input clk ;
input reset ;
input [31:0] dataA ; // Multiplicand
input [31:0] dataB ;
input [5:0] Signal ;
output reg [63:0] dataOut ;

// 宣告兩暫存器，product 為 64 位元，乘數與被乘數 為 32 位元
reg out;
reg [6:0] counter;
reg [63:0] product;
reg [31:0] multiply, multiplicand ;
parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;

/*
// 每當 dataA 有變化時，將被乘數設為 dataA 的值
always@(dataA)
begin
    multiplicand = dataA;
end

// 每當 dataB 有變化時，將乘數設為 dataB 的值
always@(dataB)
begin
    multiply = dataB;
end
*/

/*always@(Signal)
begin
    product = 64'd0;
end*/

// 定義電路以 clk 或 reset 正緣觸發
always@( posedge clk or reset )
begin
	// 當 reset 為 1 時，將 product 設為 0
    if ( reset )
    begin
        product = 64'd0 ;
    end

    else
    begin
		if( Signal == MULTU )
		begin
			 // 若未到達 32 次，判斷乘數第 0 位是否為 1，如果是則將被乘數加到 product 左半部
            /*if (multiply[0] == 1'b1)
			begin
                product[63:32] = product[63:32] + multiplicand;
            end
			// 將乘積與乘數右移 1 位元
            product = product >> 1;
            multiply = multiply >> 1;*/
            multiplicand = dataA;
            multiply = dataB;
            out = 0;
            counter = 0;
            product = 64'd0;
		end


        if ( out == 0 )
        begin
            if ( counter == 32 )
            begin
                out = 1;
                dataOut = product;
            end
            else if (counter < 32)
            begin
                if (multiply[0] == 1'b1)
                begin
                    product[63:32] = product[63:32] + multiplicand;
                end
                product = product >> 1;
                multiply = multiply >> 1;  
            end
            counter = counter + 1;
        end


    end

end
endmodule