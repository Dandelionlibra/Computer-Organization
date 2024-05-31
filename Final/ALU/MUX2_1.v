// 定義 module MUX2_1 可連接的 ports
module MUX2_1(in0, in1, sel, out);
	// 定義哪些 ports 為 input，哪些為 output
	input	in0, in1;
	input	sel;
	output	out;
	
	// 根據 sel 選擇要輸出 in1 還是 in0
	assign	out = sel ? in1 : in0;
endmodule