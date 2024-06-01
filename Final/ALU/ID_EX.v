// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ID_EX 可連接的 ports
module ID_EX( clk, reset, RS_ID, RS_EX, RT_ID, RT_EX, RD_ID, RD_EX, RD1_ID, RD1_EX, RD2_ID, RD2_EX, imm_ID, imm_EX, WB_ID, WB_EX
              RegDst_ID, RegDst_EX, ALUSrc_ID, ALUSrc_EX, ALUOp_ID, ALUOp_EX, MenRW_ID, MenRW_EX, Branch_ID, Branch_EX, func_ID, func_EX);
              
// 定義哪些 ports 為 input，哪些為 output
input clk;
input reset;
// input [31:0] nextPC_ID;
input [4:0] RS_ID;
input [4:0] RD_ID;
input [4:0] RT_ID;
input [5:0] func_ID;
input [31:0] RD1_ID;
input [31:0] RD2_ID;
input RegDst_ID;
input ALUSrc_ID;
input [1:0] ALUOp_ID;
input [31:0] imm_ID;

input MenRW_ID[1:0]; // MemRead、MemWrite
input Branch_ID;
input WB_ID[1:0]; // MemtoReg、RegWrite
//-----------------------------------------
// output [31:0] nextPC_EX;
output reg [4:0] RS_EX;
output reg [4:0] RD_EX;
output reg [4:0] RT_EX;
output reg [5:0] func_EX;
output reg [31:0] RD1_EX;
output reg [31:0] RD2_EX;
output reg RegDst_EX;
output reg ALUSrc_EX;
output reg [1:0] ALUOp_EX;
output reg [31:0] imm_EX;

output reg MenRW_EX[1:0]; // MemRead、MemWrite
output reg Branch_EX;
output reg WB_EX[1:0]; // MemtoReg、RegWrite




always@(posedge clk)
begin
    if(reset)
    begin
        RS_EX <= 5'b0;
        RD_EX <= 5'b0;
        RT_EX <= 5'b0;
        RD1_EX <= 32'b0;
        RD2_EX <= 32'b0;
        RegDst_EX <= 1'b0;
        ALUSrc_EX <= 1'b0;
        ALUOp_EX <= 2'b00;
        MenRW_EX <= 2'b00;
        Branch_EX <= 1'b0;
        WB_EX <= 2'b00;
        imm_EX <= 32'b0;
    end
    else
    begin
        RS_EX <= RS_ID;
        RD_EX <= RD_ID;
        RT_EX <= RT_ID;
        RD1_EX <= RD1_ID;
        RD2_EX <= RD2_ID;
        RegDst_EX <= RegDst_ID;
        ALUSrc_EX <= ALUSrc_ID;
        ALUOp_EX <= ALUOp_ID;
        MenRW_EX <= MenRW_ID;
        Branch_EX <= Branch_ID;
        WB_EX <= WB_ID;
        imm_EX <= imm_ID;
    end
end



endmodule