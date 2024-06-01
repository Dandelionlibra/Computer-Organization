// 設定時間尺度
`timescale 1ns/1ns
// 定義 module MEM_WB 可連接的 ports
module MEM_WB( clk, WB_MEM, WB_WB, ALUOut_MEM, ALUOut_WB, DataMEM_RD_MEM, DataMEM_RD_WB, WN_MEM, WN_WB);
// 定義哪些 ports 為 input，哪些為 output
input clk;
// input MenRW_MEM[1:0]; // MemRead、MemWrite
input WB_MEM[1:0]; // MemtoReg、RegWrite
input [31:0] ALUOut_MEM;
input [31:0] DataMEM_RD_MEM;
input WN_MEM[4:0];

// wire MemRead = MenRW_MEM[1];
// wire MemWrite = MenRW_MEM[0];

output reg WB_WB[1:0]; // MemtoReg、RegWrite
output reg [31:0] ALUOut_WB;
output reg [31:0] DataMEM_RD_WB;
output reg WN_WB[4:0];

initial
begin
    WB_WB = 2'b00;
    ALUOut_WB = 32'b0;
    DataMEM_RD_WB = 32'b0;
    WN_WB = 5'b0;    
end

always@(posedge clk)
begin
    WB_WB = WB_MEM;
    ALUOut_WB = ALUOut_MEM;
    DataMEM_RD_WB = DataMEM_RD_MEM;
    WN_WB = WN_MEM;
end




endmodule