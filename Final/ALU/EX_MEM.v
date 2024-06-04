// 設定時間尺度
`timescale 1ns/1ns
// 定義 module EX_MEM 可連接的 ports
module EX_MEM( clk, reset, WB_EX, MEM_EX, 
WB_MEM, MEM_MEM, WN_EX, WN_MEM, 
RD2_WD_EX, RD2_WD_MEM, ALUOut_EX, ALUOut_MEM);
// 定義哪些 ports 為 input，哪些為 output
input clk, reset;
input [1:0] WB_EX; // WB = {RegWrite, MemtoReg};
input [2:0] MEM_EX; // MEM = {MemRead, MemWrite, MemtoReg};
input [4:0] WN_EX;
input [31:0] RD2_WD_EX, ALUOut_EX;

output reg [1:0] WB_MEM; // WB = {RegWrite, MemtoReg};
output reg [2:0] MEM_MEM; // MEM = {MemRead, MemWrite, MemtoReg};
output reg [4:0] WN_MEM;
output reg [31:0] RD2_WD_MEM, ALUOut_MEM;

always@(posedge clk)
begin
    if(reset)
    begin
        WB_MEM <= 2'b0;
        MEM_MEM <= 3'b0;
        WN_MEM <= 5'b0;
        RD2_WD_MEM <= 32'b0;
        ALUOut_MEM <= 32'b0;

    end
    else
    begin
        WB_MEM <= WB_EX;
        MEM_MEM <= MEM_EX;
        WN_MEM <= WN_EX;
        RD2_WD_MEM <= RD2_WD_EX;
        ALUOut_MEM <= ALUOut_EX;

    end

end



endmodule