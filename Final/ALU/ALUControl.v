/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
*/
// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ALUControl 可連接的 ports
module ALUControl( clk, ALUOp, Funct, ALUOperation, SignaltoMULTU, SelHilo );
// 定義哪些 ports 為 input，哪些為 output
input clk ;
input [1:0] ALUOp ;
input [5:0] Funct ;

output reg [2:0] ALUOperation ;
output reg [5:0] SignaltoMULTU ;
output reg [1:0] SelHilo ;

// 宣告 7 位元的暫存器
reg [6:0] counter ;

// 定義參數常數(可提升可讀性)
// Check 4-1 P.61
parameter ALU_AND = 3'b000;
parameter ALU_OR  = 3'b001; 
parameter ALU_ADD = 3'b010;
parameter ALU_SUB = 3'b110; 
parameter ALU_SLT = 3'b111; 
parameter ALU_SLL = 3'b100;
parameter ALU_OpenHiLo = 6'b111111; // HiLo : 63


// Funct
parameter Funct_SLL = 6'b000000; //   SLL  : 0
parameter Funct_ADD = 6'b100000; //   ADD  : 32
parameter Funct_SUB = 6'b100010; //   SUB  : 34
parameter Funct_AND = 6'b100100; //   AND  : 36
parameter Funct_OR  = 6'b100101; //   OR   : 37
parameter Funct_SLT = 6'b101010; //   SLT  : 42
parameter Funct_MULTU = 6'b011001; //   MULTU: 25
parameter Funct_MFHI = 6'b010000; //   HiLo : 16
parameter Funct_MFLO = 6'b010010; //   HiLo : 18


// 每當 Funct 有變化時，驅動以下電路
always@( Funct )
begin
  if ( Funct == Funct_MULTU )
  begin
	// 若當前訊號為乘法運算，初始化 counter 為 0
    counter = 0 ;
  end
end

// 定義電路以 clk 正緣觸發
always@( posedge clk )
begin
	if ( Funct == Funct_MULTU )
	begin
		// 若當前訊號為乘法運算，將 counter + 1
        SignaltoMULTU = Funct_MULTU ; // MULTU
		counter = counter + 1 ;
		if ( counter == 32 )
		begin
			// 若 counter 為 32，將 temp 設為 0b111111 以開啟 HiLo 的輸出
			SignaltoMULTU = ALU_OpenHiLo ; // Open HiLo reg for Mul
			counter = 0 ; // 將 counter 重置為 0
		end
	end
end

always@( ALUOp or Funct )
begin
    SelHilo = 2'b00;
    case(ALUOp)
        2'b00: ALUOperation = ALU_ADD;
        2'b01: ALUOperation = ALU_SUB;
        2'b10: 
            case(Funct)
                Funct_ADD: ALUOperation = ALU_ADD;
                Funct_SUB: ALUOperation = ALU_SUB;
                Funct_AND: ALUOperation = ALU_AND;
                Funct_OR: ALUOperation = ALU_OR;
                Funct_SLT: ALUOperation = ALU_SLT;
                Funct_SLL: ALUOperation = ALU_SLL;
                Funct_MFHI: SelHilo = 2'b01;
                Funct_MFLO: SelHilo = 2'b10;
                default: ALUOperation = 3'bxxx;
            endcase
        default: ALUOperation = 3'bxxx;

    endcase
end




endmodule