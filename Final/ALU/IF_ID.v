// 設定時間尺度
`timescale 1ns/1ns
// 定義 module IF_ID 可連接的 ports
module IF_ID( clk, reset, nextPC_IF, RD_IF, nextPC_ID, RD_ID);
// 定義哪些 ports 為 input，哪些為 output
input clk, reset;
input [31:0] nextPC_IF;
input [31:0] RD_IF;
output reg [31:0] nextPC_ID;
output reg [31:0] RD_ID;

always@(posedge clk)
begin
    if(reset)
    begin
        RD_ID <= 32'b0;
        nextPC_ID <= 32'b0;
    end
    else
    begin
        RD_ID <= RD_IF;
        nextPC_ID <= nextPC_IF;
    end

end


endmodule