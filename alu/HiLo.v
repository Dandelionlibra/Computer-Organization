// 設定時間尺度
`timescale 1ns/1ns
// 定義 module HiLo 可連接的 ports
module HiLo( clk, MulAns, HiOut, LoOut, reset );
// 定義哪些 ports 為 input，哪些為 output
input clk ;
input reset ;
input [63:0] MulAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

// 定義一個 64 位元暫存器
reg [63:0] HiLo ;

// 定義電路以 clk 或 reset 正緣觸發
always@( posedge clk or reset )
begin
	// 若 reset 為 1，則 HiLo 設為 0
	if ( reset )
	begin
		HiLo = 64'b0 ;
	end

	else
	begin
		// 否則設為乘法運算結果
		HiLo = MulAns ;
	end
end

// 因 32 位元乘法運算後結果為 64 位元，將結果拆成兩半輸出
assign HiOut = HiLo[63:32] ;
assign LoOut = HiLo[31:0] ;

endmodule