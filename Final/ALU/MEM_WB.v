// 設定時間尺度
`timescale 1ns/1ns
// 定義 module MEM_WB 可連接的 ports
module MEM_WB( clk, reset, WB_MEM, WB_WB, ALUOut_MEM, ALUOut_WB, DataMEM_RD_MEM, DataMEM_RD_WB, WN_MEM, WN_WB);
// 定義哪些 ports 為 input，哪些為 output
input clk, reset;
// input MenRW_MEM[1:0]; // MemRead、MemWrite
input [1:0] WB_MEM; // MemtoReg、RegWrite
input [31:0] ALUOut_MEM;
input [31:0] DataMEM_RD_MEM;
input [4:0] WN_MEM;

// wire MemRead = MenRW_MEM[1];
// wire MemWrite = MenRW_MEM[0];

output reg [1:0] WB_WB; // MemtoReg、RegWrite
output reg [31:0] ALUOut_WB;
output reg [31:0] DataMEM_RD_WB;
output reg [4:0] WN_WB;

always@(posedge clk)
begin
    if(reset)
    begin
        WB_WB <= 2'b0;
        ALUOut_WB <= 32'b0;
        DataMEM_RD_WB <= 32'b0;
        WN_WB <= 5'b0;
    end
    else
    begin
    WB_WB = WB_MEM;
    ALUOut_WB = ALUOut_MEM;
    DataMEM_RD_WB = DataMEM_RD_MEM;
    WN_WB = WN_MEM;
    end
end




endmodule