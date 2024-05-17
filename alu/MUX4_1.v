// 定義 module MUX4_1 可連接的 ports
module MUX4_1(out, in3, in2, in1, in0, sel);
// 定義哪些 ports 為 input，哪些為 output
output	out;
input	in3, in2, in1, in0;
input	[5:0]sel;

wire	out;

// Continuous assigment
// 根據 sel 選擇要輸出 in0 還是 in1 還是 in2 還是 in3
assign	out = (sel==6'b100100) ? in0 : (sel==6'b100101) ? in1 : (sel==6'b100000 || sel==6'b100010) ? in2 : in3;

endmodule