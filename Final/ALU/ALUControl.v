// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ALUControl 可連接的 ports
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX );
// 定義哪些 ports 為 input，哪些為 output
input clk ;
input [5:0] Signal ;
output [5:0] SignaltoALU ;
output [5:0] SignaltoSHT ;
output [5:0] SignaltoMULTU ;
output [5:0] SignaltoMUX ;

// 宣告 6 位元與 7 位元的暫存器
reg [5:0] temp ;
reg [6:0] counter ;

// 定義參數常數(可提升可讀性)
// Signal (6-bits)
parameter AND = 6'b100100; //   AND  : 36
parameter OR  = 6'b100101; //   OR   : 37
parameter ADD = 6'b100000; //   ADD  : 32
parameter SUB = 6'b100010; //   SUB  : 34
parameter SLT = 6'b101010; //   SLT  : 42
parameter SLL = 6'b000000; //   SLL  : 00
parameter MULTU= 6'b011001; //   MULTU: 25

// final signal
parameter NOP = 6'b000000; //   NOP  : 00
parameter ANDI= 6'b001100; //   ANDI : 12
parameter LW  = 6'b100011; //   lw   : 23
parameter SW  = 6'b101011; //   sw   : 2B
parameter BEQ = 6'b000100; //   beq  : 04
parameter J   = 6'b000010; //   j    : 02
parameter JR  = 6'b001000; //   jr   : 08
// parameter MULTU= 6'b011001; //   MULTU: 25
parameter MFHI = 6'b010000; //   mfhi : 10
parameter MFLO = 6'b010010; //   mflo : 12


// 每當 Signal 有變化時，驅動以下電路
always@( Signal )
begin
  if ( Signal == MULTU )
  begin
	// 若當前訊號為乘法運算，初始化 counter 為 0
    counter = 0 ;
  end
end

// 定義電路以 clk 正緣觸發
always@( posedge clk )
begin
	// 將 temp 設為 Signal 的值
	temp = Signal ;
	if ( Signal == MULTU )
	begin
		// 若當前訊號為乘法運算，將 counter + 1
		counter = counter + 1 ;
		if ( counter == 32 )
		begin
			// 若 counter 為 32，將 temp 設為 0b111111 以開啟 HiLo 的輸出
			temp = 6'b111111 ; // Open HiLo reg for Mul
			counter = 0 ; // 將 counter 重置為 0
		end
	end
end




// 將要給每個 module 的訊號設為 temp
assign SignaltoALU = temp ;
assign SignaltoSHT = temp ;
assign SignaltoMULTU = temp ;
assign SignaltoMUX = temp ;

endmodule