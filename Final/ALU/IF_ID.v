// 設定時間尺度
`timescale 1ns/1ns
// 定義 module IF_ID 可連接的 ports
module IF_ID( clk, stall, reset, next_PC_IF, RD_IF, next_PC_ID, RD_ID);
// 定義哪些 ports 為 input，哪些為 output
input clk;
input stall;
input reset;
input [31:0] next_PC_IF;
input [31:0] RD_IF;
output [31:0] next_PC_ID;
output [31:0] RD_ID;

// IF stage
wire [31:0] RD_IF; // input只能wire
wire [31:0] next_PC_IF;
// ID stage
reg [31:0] RD_ID;
reg [31:0] next_PC_ID;

always@(posedge clk)
begin
    if(reset)
    begin
        RD_ID <= 32'b0;
        next_PC_ID <= 32'b0;
    end
    else
        if(stall)
        begin
            RD_ID <= RD_ID;
            next_PC_ID <= next_PC_ID;
        end
        else
        begin
            RD_ID <= RD_IF;
            next_PC_ID <= next_PC_IF;
        end

end


endmodule