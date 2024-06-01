// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ControlUnit 可連接的 ports
module ControlUnit( clk, Signal, ALUOp, RegDst, ALUSrc, Branch, MemRead, MemWrite, RegWrite, MemtoReg, Jump);
// 定義哪些 ports 為 input，哪些為 output
input clk;
input [5:0] Signal;
output [1:0] ALUOp;

output RegDst;
output ALUSrc;
output Branch;
output MemRead;
output MemWrite;
output RegWrite;
output MemtoReg;
output Jump;

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


always@( Signal )
begin
    if ( Signal == NOP ) // 若當前訊號為空指令
    begin
      ALUOp = 2'b00 ; // 00 -> add
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b0 ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'b0 ;
    end
    else if ( Signal == LW ) // 若當前訊號為讀取
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
    else if ( Signal == SW ) // 若當前訊號為儲存
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

    else if ( Signal == BEQ ) // 若當前訊號為條件跳躍
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

    else if ( Signal == J ) // 若當前訊號為跳躍
    begin
      ALUOp = 2'b00 ;
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b0 ;
      Branch = 1'b1 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b0 ;
      MemtoReg = 1'bx ; // don't care
      Jump = 1'b1 ;

    end

    else if ( Signal == JR ) // Unconditionally jump to the instruction whose address is in register rs
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

    else if ( Signal == ANDI ) // 若當前訊號為讀取 andi rt, rs, immediate
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'bx ; // don't care
      ALUSrc = 1'b1 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
      Jump = 1'b0 ;

    end

    // R-type instructions
    else if ( Signal == ADD ) // 若當前訊號為加法
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
    end
    else if ( Signal == SUB ) // 若當前訊號為減法
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
    end
    else if ( Signal == AND ) // 若當前訊號為 AND
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
    end
    else if ( Signal == OR ) // 若當前訊號為 OR
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
    end
    else if ( Signal == SLT ) // 若當前訊號為 SLT
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
    end
    else if ( Signal == SLL ) // 若當前訊號為 SLL
    begin
      ALUOp = 2'b10 ;
      RegDst = 1'b1 ;
      ALUSrc = 1'b0 ;
      Branch = 1'b0 ;
      MemRead = 1'b0 ;
      MemWrite = 1'b0 ;
      RegWrite = 1'b1 ;
      MemtoReg = 1'b0 ;
    end
    // else if ( Signal == MULTU ) // 若當前訊號為 MULTU
    // begin
    //   ALUOp = 2'b14 ; // 14 -> multu
    //   RegDst = 1'b0 ;
    //   ALUSrc = 1'b0 ;
    //   Branch = 1'b0 ;
    //   MemRead = 1'b0 ;
    //   MemWrite = 1'b0 ;
    //   RegWrite = 1'b0 ;
    //   MemtoReg = 1'b0 ;
    // end
    // else if ( Signal == MFHI ) // 若當前訊號為 MFHI
    // begin
    //   ALUOp = 2'b15 ; // 15 -> mfhi
    //   RegDst = 1'b1 ;
    //   ALUSrc = 1'b0 ;
    //   Branch = 1'b0 ;
    //   MemRead = 1'b0 ;
    //   MemWrite = 1'b0 ;
    //   RegWrite = 1'b1 ;
    //   MemtoReg = 1'b0 ;
    // end
    // else if ( Signal == MFLO ) // 若當前訊號為 MFLO
    // begin
    //   ALUOp = 2'b16 ; // 16 -> mflo
    //   RegDst = 1'b1 ;
    //   ALUSrc = 1'b0 ;
    //   Branch = 1'b0 ;
    //   MemRead = 1'b0 ;
    //   MemWrite = 1'b0 ;
    //   RegWrite = 1'b1 ;
    //   MemtoReg = 1'b0 ;
    // end
    else



end




endmodule