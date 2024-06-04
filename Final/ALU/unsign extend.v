// 設定時間尺度
`timescale 1ns/1ns
// 定義 module MEM_WB 可連接的 ports
module unsign_extend( immed_in, ext_immed_out );
	input[15:0] immed_in;
	output[31:0] ext_immed_out;
	assign ext_immed_out = { 16'b0, immed_in };
endmodule
