// 定義 module MUX4_1 可連接的 ports
module ALU_MUX4_1(out, in3, in2, in1, in0, sel);
// 定義哪些 ports 為 input，哪些為 output
output	out;
input	in3, in2, in1, in0;
input	[2:0] sel;

// Continuous assigment
// 根據 sel 選擇要輸出 in0 還是 in1 還是 in2 還是 in3
assign	out = (sel==3'b000) ? in0 : (sel==2'b001) ? in1 : (sel==3'b010) ? in2 : (sel==3'b111) ? in3 : 1'b0;

endmodule