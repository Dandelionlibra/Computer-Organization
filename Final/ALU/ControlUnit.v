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
module ControlUnit( clk, OpCode, Funct, EX, MEM, WB, Jump, JR);
// 定義哪些 ports 為 input，哪些為 output
input clk;
input [5:0] OpCode;
input [5:0] Funct;
output reg [3:0] EX;
output reg [2:0] MEM;
output reg [1:0] WB;
output reg Jump, JR;

reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
reg [1:0] ALUOp;

// 定義參數常數(可提升可讀性)

// final signal
parameter R_TYPE = 6'b000000; //   R_TYPE  : 00
parameter NOP = 6'b000000; //   NOP  : 00
parameter ANDI= 6'b001100; //   ANDI : 12
parameter LW  = 6'b100011; //   lw   : 35
parameter SW  = 6'b101011; //   sw   : 43
parameter BEQ = 6'b000100; //   beq  : 04
parameter J   = 6'b000010; //   j    : 02
parameter Funct_JR  = 6'b001000; //   jr   : 08


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
      JR = 1'b0 ;
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
      JR = 1'b0 ;
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
      JR = 1'b0 ;
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
      JR = 1'b0 ;
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
      JR = 1'b0 ;
    end

    // R-type instructions
    else if ( OpCode == R_TYPE ) // 若當前訊號為 R-type
    begin
        if ( Funct == Funct_JR ) begin 
            ALUOp = 2'b01 ;
            RegDst = 1'bx ;
            ALUSrc = 1'b0 ;
            Branch = 1'b1 ;
            MemRead = 1'b0 ;
            MemWrite = 1'b0 ;
            RegWrite = 1'b0 ;
            MemtoReg = 1'bx ;
            Jump = 1'b1 ;
            JR = 1'b1 ;
        end
        else begin
            ALUOp = 2'b10 ;
            RegDst = 1'b1 ;
            ALUSrc = 1'b0 ;
            Branch = 1'b0 ;
            MemRead = 1'b0 ;
            MemWrite = 1'b0 ;
            RegWrite = 1'b1 ;
            MemtoReg = 1'b0 ;
            Jump = 1'b0 ;
            JR = 1'b0 ;
        end
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
      JR = 1'bx ;
    end

    // EX
    EX = {RegDst, ALUOp, ALUSrc};

    // MEM
    MEM = {MemRead, MemWrite, MemtoReg};

    // WB
    WB = {RegWrite, MemtoReg};

end




endmodule