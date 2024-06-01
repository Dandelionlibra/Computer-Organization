/*
	Title: MIPS Single-Cycle Control Unit
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. opcode: 輸入的指令代號，據此產生對應的控制訊號
	Input Port
		1. RegDst: 控制RFMUX
		2. ALUSrc: 控制ALUMUX
		3. MemtoReg: 控制WRMUX
		4. RegWrite: 控制暫存器是否可寫入
		5. MemRead:  控制記憶體是否可讀出
		6. MemWrite: 控制記憶體是否可寫入
		7. Branch: 與ALU輸出的zero訊號做AND運算控制PCMUX
		8. ALUOp: 輸出至ALU Control
*/

// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ControlUnit 可連接的 ports
module ControlUnit( clk, OpCode, EX, MEM, WB, Jump);
// 定義哪些 ports 為 input，哪些為 output
input clk;
input [5:0] OpCode;
output reg [3:0] EX;
output reg [2:0] MEM;
output reg [1:0] WB;
output reg Jump;

reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
reg [1:0] ALUOp;

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
parameter R_TYPE = 6'b000000; //   R_TYPE  : 00
parameter NOP = 6'b000000; //   NOP  : 00
parameter ANDI= 6'b001100; //   ANDI : 12
parameter LW  = 6'b100011; //   lw   : 35
parameter SW  = 6'b101011; //   sw   : 43
parameter BEQ = 6'b000100; //   beq  : 04
parameter J   = 6'b000010; //   j    : 02
parameter JR  = 6'b001000; //   jr   : 08
// parameter MULTU= 6'b011001; //   MULTU: 25
parameter MFHI = 6'b010000; //   mfhi : 16
parameter MFLO = 6'b010010; //   mflo : 12


always@( OpCode )
begin

    if ( OpCode == LW ) // 若當前訊號為讀取
    begin
      ALUOp = 2'b00 ; // 00 -> add
      RegDst = 1'b0 ;
      ALUSrc = 1'b1 ;
      Branch = 1'b0 ;
      MemRead = 1'b1 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b1 ;
      Jump = 1'b0 ;
    end
    else if ( OpCode == SW ) // 若當前訊號為儲存
    begin
      ALUOp = 2'b00 ; // 00 -> add
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b1 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b1 ;
      RegWrite = 1'b0 ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'b0 ;
    end

    else if ( OpCode == BEQ ) // 若當前訊號為條件跳躍
    begin
      ALUOp = 2'b01 ; // 01 -> sub
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b0 ;
      Branch = 1'b1 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b0 ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'b0 ;
    end

    else if ( OpCode == J ) // 若當前訊號為跳躍
    begin
      ALUOp = 2'b01 ;
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b0 ;
      Branch = 1'b1 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b0 ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'b1 ;

    end

    else if ( OpCode == JR ) // Unconditionally jump to the instruction whose address is in register rs
    begin
      ALUOp = 2'b00 ; // 00 -> add
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b0 ;
      Branch = 1'b1 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b0 ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'b1 ;

    end

    else if ( OpCode == ANDI ) // 若當前訊號為讀取 andi rt, rs, immediate
    begin
      ALUOp = 2'b00 ;
      RegDst = 1'b0 ; // don't care
      ALUSrc = 1'b1 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
      Jump = 1'b0 ;

    end

    // R-type instructions
    else if ( OpCode == R_TYPE ) // 若當前訊號為 R-type
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
      Jump = 1'b0 ;
    end
    else
    begin
        $display("control_single unimplemented opcode %d", OpCode);
      ALUOp = 2'bxx ;
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'bx ;
      Branch = 1'bx ;
      MemRead = 1'bx ;
      MemWrite = 1'bx ;
      RegWrite = 1'bx ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'bx ;
    end

    // EX
    EX = {RegDst, ALUOp, ALUSrc};

    // MEM
    MEM = {MemRead, MemWrite, MemtoReg};

    // WB
    WB = {RegWrite, MemtoReg};

end




endmodule