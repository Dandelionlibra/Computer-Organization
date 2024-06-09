/*
	Title: MIPS Pipeline CPU Testbench
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU) 
*/
module tb_Pipeline();
	reg clk, rst;
    reg [31:0] cnt;
	
	// 產生時脈，週期：10ns
	initial begin
        cnt = 0;
		clk = 1;
		forever #5 clk = ~clk;
		
	end

	initial begin
		rst = 1'b1;
		/*
			指令資料記憶體，檔名"instr_mem.txt, data_mem.txt"可自行修改
			每一行為1 Byte資料，以兩個十六進位數字表示
			且為Little Endian編碼
		*/
		$readmemh("instr_mem.txt", CPU.InstrMem.mem_array );
		$readmemh("data_mem.txt", CPU.DatMem.mem_array );
		// 設定暫存器初始值，每一行為一筆暫存器資料
		$readmemh("reg.txt", CPU.RegFile.file_array );
		#10;
		rst = 1'b0;
	end
	
	always @( posedge clk ) begin
		$display( "%d, PC:", $time/10-1, CPU.pc );
		if ( CPU.opcode == 6'd0 ) begin
			$display( "%d, wd: %d", $time/10-1, CPU.rfile_wd );
			if ( CPU.funct == 6'd32 ) $display( "%d, ADD\n", $time/10-1 );
			else if ( CPU.funct == 6'd34 ) $display( "%d, SUB\n", $time/10-1 );
			else if ( CPU.funct == 6'd36 ) $display( "%d, AND\n", $time/10-1 );
			else if ( CPU.funct == 6'd37 ) $display( "%d, OR\n", $time/10-1 );
			
			else if ( CPU.funct == 6'd0  )
				if(CPU.rs == 0 && CPU.rt == 0 && CPU.rd == 0)
					$display( "%d, Nop\n", $time/10-1 );
				else
					$display( "%d, sll\n", $time/10-1 );
			else if ( CPU.funct == 6'd25 )
			begin
				$display( "%d, Multu\n", $time/10-1 );
			end
			else if ( CPU.funct == 6'd10 ) $display( "%d, Hi\n", $time/10-1 );
			else if ( CPU.funct == 6'd12 ) $display( "%d, Lo\n", $time/10-1 );
		end
		else if ( CPU.opcode == 6'd35 ) $display( "%d, LW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd43 ) $display( "%d, SW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd4 ) $display( "%d, BEQ\n", $time/10-1 );
		else if ( CPU.opcode == 6'd2 ) $display( "%d, J\n", $time/10-1 );
		
		else if ( CPU.opcode == 6'd8 ) $display( "%d, Jr\n", $time/10-1 );
		else if ( CPU.opcode == 6'd12 ) $display( "%d, Andi\n", $time/10-1 );

	end



    always @(posedge clk) begin
        cnt = cnt + 1;
        if (cnt == 2000) $stop;
    end
	
	mips_pipeline CPU( clk, rst );
	
endmodule
