// 設定時間尺度
`timescale 1ns/1ns
// 定義 module HazardUnit 可連接的 ports
module HazardUnit( clk, RS, RT_ID, RT_EX, MemRead, stall);
// 定義哪些 ports 為 input，哪些為 output
input clk;
input [4:0] RS;
input [4:0] RT_ID;
input [4:0] RT_EX;
input MemRead;
output stall;

reg stall;

always@( posedge clk)
begin
    if(MemRead and ((RS == RT_ID) or (RS == RT_EX)))
        stall = 1;
    else
        stall = 0;
end


endmodule