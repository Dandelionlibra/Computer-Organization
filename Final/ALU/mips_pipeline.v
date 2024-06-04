//	Title: MIPS 5-Stage Pipeline Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
`timescale 1ns/1ns
module mips_pipeline( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
    wire[31:0] instr_id;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct, funct_EX;
    wire [4:0] rs, rt, rd, shamt, shamt_EX;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;

    wire [4:0] rt_ex;
    wire [4:0] rd_ex;

    wire [63:0] MultOut; // 乘法運算結果
    wire [31:0] HiOut, LoOut; // HiLo 輸出

    wire [31:0] unsign_immed; // 無符號擴展
    wire [31:0] extended_immed_id, extended_immed_ex; // 擴展結果
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt_ex, pc_next, pc_jump,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr;

    wire [31:0] alu_or_hilo_out, alu_out_mem, alu_out_wb;

    wire [31:0] dmem_rdata_wb;

    wire [31:0] rfile_rd1_ex, rfile_rd2_ex, rfile_rd2_mem;
    wire [4:0] rfile_wn_mem, rfile_wn_wb;

    wire [1:0] SelHilo; // 選擇 Hi 或 Lo
    wire [31:0] pc_id;

	// control signals
    wire Zero, Jump, JumpRegister;
    wire SignExtendSel;
    wire [2:0] Operation; // 控制 ALUControl
    wire [5:0] SignaltoMULTU; // 乘法運算
    wire [1:0] WB_ID, WB_EX, WB_MEM, WB_WB; // WB = {RegWrite, MemtoReg};
    wire [2:0] MEM_ID, MEM_EX, MEM_MEM; // MEM = {MemRead, MemWrite, MemtoReg};
    wire [3:0] EX_ID, EX_EX; // {RegDst, ALUOp, ALUSrc};

    // assign WB_ID = {RegWrite, MemtoReg};
    // assign MEM_ID = {MemRead, MemWrite, Branch};
    // assign EX_ID = {RegDst, ALUOp, ALUSrc};
    
	
    assign opcode = instr_id[31:26];
    assign rs = instr_id[25:21];
    assign rt = instr_id[20:16];
    assign rd = instr_id[15:11];
    assign shamt = instr_id[10:6];
    assign funct = instr_id[5:0];
    assign immed = instr_id[15:0];
    assign jumpoffset = instr_id[25:0];

	// module instantiations


    // IF stage
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );

	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );

    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt_ex), .y(branch_addr) );

	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_jump) );

    // mux Jump Register
    mux2 #(32) JR_MUX( .sel(JumpRegister), .a(pc_jump), .b(rfile_rd1), .y(pc_next) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );

    IF_ID IFID( .clk(clk), .reset(rst), .nextPC_IF(pc_incr), .RD_IF(instr), .nextPC_ID(pc_id), .RD_ID(instr_id) );
    // ID stage

    ControlUnit CTL(.clk(clk), .OpCode(opcode), .Funct(funct), .EX(EX_ID), 
    .MEM(MEM_ID), .WB(WB_ID), .ExtendSel(SignExtendSel), .Jump(Jump), .JR(JumpRegister));

	// -*-*-*-*-Extender-*-*-*-*-
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
    unsign_extend UnsignExt( .immed_in(immed), .ext_immed_out(unsign_immed) );
    mux2 #(32) Extender(.sel(SignExtendSel), .a(extend_immed), .b(unsign_immed), .y(extended_immed_id) );
    // -*-*-*-*-Extender-*-*-*-*-

	
	reg_file RegFile( .clk(clk), .RegWrite(WB_WB[1]), .RN1(rs), .RN2(rt), .WN(rfile_wn_wb), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );


    ID_EX IDEX(.clk(clk), .reset(rst), .RT_ID(rt), .RT_EX(rt_ex), 
    .RD_ID(rd), .RD_EX(rd_ex), .RD1_ID(rfile_rd1), .RD1_EX(rfile_rd1_ex), 
    .RD2_ID(rfile_rd2), .RD2_EX(rfile_rd2_ex), .imm_ID(extended_immed_id), .imm_EX(extended_immed_ex), 
    .WB_ID(WB_ID), .WB_EX(WB_EX), .EX_ID(EX_ID), .EX_EX(EX_EX), 
    .MEM_ID(MEM_ID), .MEM_EX(MEM_EX), .func_ID(funct), .func_EX(funct_EX),
    .shamt_ID(shamt), .shamt_EX(shamt_EX) );

    // branch offset shifter
    assign b_offset = extend_immed << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_id[31:28], jumpoffset <<2 };


    add32 BRADD( .a(pc_id), .b(b_offset), .result(b_tgt_ex) );

    // beq

    BEQ beq( .opcode(opcode), .zero(Zero), .a(rfile_rd1), .b(rfile_rd2) );

    and BR_AND(PCSrc, MEM_ID[0], Zero );

    // EX stage

    // alu ALU( .ctl(Operation), .a(rfile_rd1), .b(alu_b), .result(alu_out), .zero(Zero) );
    ALU ALU(.dataA(rfile_rd1_ex), .dataB(alu_b), .control(Operation), .dataOut(alu_out), .shamt(shamt_EX) );

    mux2 #(5) RFMUX( .sel(EX_EX[3]), .a(rt_ex), .b(rd_ex), .y(rfile_wn) );
	
    mux2 #(32) ALUMUX( .sel(EX_EX[0]), .a(rfile_rd2_ex), .b(extended_immed_ex), .y(alu_b) );

    // mux HiLo
    MUX3_1 #(32) MUX_HiLo( .sel(SelHilo), .a(alu_out), .b(HiOut), .c(LoOut), .y(alu_or_hilo_out) );

    ALUControl ALUCTL( .clk(clk), .ALUOp(EX_EX[2:1]), .Funct(funct_EX), .ALUOperation(Operation), .SignaltoMULTU(SignaltoMULTU), .SelHilo(SelHilo) );
	
    Multiplier MULTU( .clk(clk), .reset(rst), .dataA(rfile_rd1_ex), .dataB(rfile_rd2_ex), .Signal(SignaltoMULTU), .dataOut(MultOut) );

    HiLo HiLo( .clk(clk), .reset(rst), .MulAns(MultOut), .HiOut(HiOut), .LoOut(LoOut) );


    EX_MEM EXMEM(.clk(clk), .reset(rst), .WB_EX(WB_EX), .MEM_EX(MEM_EX), 
    .WB_MEM(WB_MEM), .MEM_MEM(MEM_MEM), .WN_EX(rfile_wn), .WN_MEM(rfile_wn_mem), 
    .RD2_WD_EX(rfile_rd2_ex), .RD2_WD_MEM(rfile_rd2_mem), .ALUOut_EX(alu_or_hilo_out), .ALUOut_MEM(alu_out_mem));
    // MEM stage

	memory DatMem( .clk(clk), .MemRead(MEM_MEM[2]), .MemWrite(MEM_MEM[1]), .wd(rfile_rd2_mem), 
				   .addr(alu_out_mem), .rd(dmem_rdata) );	   


    MEM_WB MEMWB(.clk(clk), .reset(rst), .WB_MEM(WB_MEM), .WB_WB(WB_WB), 
    .ALUOut_MEM(alu_out_mem), .ALUOut_WB(alu_out_wb), .DataMEM_RD_MEM(dmem_rdata), .DataMEM_RD_WB(dmem_rdata_wb), 
    .WN_MEM(rfile_wn_mem), .WN_WB(rfile_wn_wb) );


    // WB stage


    mux2 #(32) WRMUX( .sel(WB_WB[0]), .a(alu_out_wb), .b(dmem_rdata_wb), .y(rfile_wd) );

				   
endmodule
