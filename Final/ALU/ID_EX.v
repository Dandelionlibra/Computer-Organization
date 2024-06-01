// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ID_EX 可連接的 ports
module ID_EX( clk, reset, RT_ID, RT_EX, 
RD_ID, RD_EX, RD1_ID, RD1_EX, 
RD2_ID, RD2_EX, imm_ID, imm_EX, 
WB_ID, WB_EX, EX_ID, EX_EX, 
MEM_ID, MEM_EX, func_ID, func_EX);
              
// 定義哪些 ports 為 input，哪些為 output
input clk, reset;
// input [31:0] nextPC_ID;

input [2:0] MEM_ID; // MEM = {MemRead, MemWrite, MemtoReg};
input [1:0] WB_ID; // WB = {RegWrite, MemtoReg};
input [3:0] EX_ID; // {RegDst, ALUOp, ALUSrc};
input [4:0] RD_ID, RT_ID;
input [5:0] func_ID;
input [31:0] RD1_ID, RD2_ID, imm_ID;


//-----------------------------------------
// output [31:0] nextPC_EX;

output reg [2:0] MEM_EX; // MemRead、MemWrite
output reg [1:0] WB_EX; // MemtoReg、RegWrite
output reg [3:0] EX_EX;
output reg [4:0] RD_EX, RT_EX;
output reg [5:0] func_EX;
output reg [31:0] RD1_EX, RD2_EX, imm_EX;


always@(posedge clk)
begin
    if(reset)
    begin
        RD_EX <= 5'b0;
        RT_EX <= 5'b0;
        func_EX <= 6'b0;
        RD1_EX <= 32'b0;
        RD2_EX <= 32'b0;
        imm_EX <= 32'b0;
        EX_EX <= 4'b0;
        MEM_EX <= 2'b00;
        WB_EX <= 2'b00;
       
    end
    else
    begin
        RD_EX <= RD_ID;
        RT_EX <= RT_ID;
        func_EX <= func_ID;
        RD1_EX <= RD1_ID;
        RD2_EX <= RD2_ID;
        imm_EX <= imm_ID;
        EX_EX <= EX_ID;
        MEM_EX <= MEM_ID;
        WB_EX <= WB_ID;
        
    end
end



endmodule