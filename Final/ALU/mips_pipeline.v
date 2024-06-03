//	Title: MIPS 5-Stage Pipeline Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
`timescale 1ns/1ns
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;

    wire [63:0] MultOut; // 乘法運算結果
    wire [31:0] HiOut, LoOut; // HiLo 輸出
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr;

    wire [1:0] SelHilo; // 選擇 Hi 或 Lo

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump;
    wire [1:0] ALUOp; // 控制 ALU
    wire [2:0] Operation; // 控制 ALUControl
    wire [5:0] SignaltoMULTU; // 乘法運算
    wire [1:0] WB_ID, WB_EX, WB_MEM, WB_WB; // WB = {RegWrite, MemtoReg};
    wire [2:0] MEM_ID, MEM_EX, MEM_MEM; // MEM = {MemRead, MemWrite, MemtoReg};
    wire [3:0] EX_ID, EX_EX; // {RegDst, ALUOp, ALUSrc};

    // assign WB_ID = {RegWrite, MemtoReg};
    // assign MEM_ID = {MemRead, MemWrite, MemtoReg};
    // assign EX_ID = {RegDst, ALUOp, ALUSrc};
    
	
    assign opcode = instr[31:26];
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign funct = instr[5:0];
    assign immed = instr[15:0];
    assign jumpoffset = instr[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset <<2 };

	// module instantiations
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
    // unsign-extender
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );

    add32 BRADD( .a(pc_incr), .b(b_offset), .result(b_tgt) );

    // alu ALU( .ctl(Operation), .a(rfile_rd1), .b(alu_b), .result(alu_out), .zero(Zero) );
    ALU ALU(.dataA(), .dataB(alu_b), .control(Operation), .dataOut(alu_out), .shamt(shamt) );

    and BR_AND(PCSrc, Branch, Zero);

    // beq

    mux2 #(5) RFMUX( .sel(), .a(), .b(), .y(rfile_wn) );

    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt), .y(branch_addr) );
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	
    mux2 #(32) ALUMUX( .sel(), .a(), .b(), .y(alu_b) );

    mux2 #(32) WRMUX( .sel(), .a(), .b(dmem_rdata), .y(rfile_wd) );

    // mux HiLo

    // mux Jump Register

    /*control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp));*/

    ControlUnit CTL(.clk(clk), .OpCode(opcode), .Funct(funct), .EX(EX_ID), .MEM(MEM_ID), .WB(WB_ID), .Jump(Jump), .JR());

    alu_ctl ALUCTL( .clk(clk), .ALUOp(ALUOp), .Funct(funct), .ALUOperation(Operation), .SignaltoMULTU(SignaltoMULTU), .SelHilo(SelHilo) );
	
    Multiplier MULTU( .clk(clk), .reset(rst), .dataA(), .dataB(), .Signal(SignaltoMULTU), .dataOut(MultOut) );

    HiLo HiLo( .clk(clk), .reset(rst), .MulAns(MultOut), .HiOut(HiOut), .LoOut(LoOut) );

	reg_file RegFile( .clk(clk), .RegWrite(WB_WB[1]), .RN1(rs), .RN2(rt), .WN(), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );

	memory DatMem( .clk(clk), .MemRead(MEM_MEM[2]), .MemWrite(MEM_MEM[1]), .wd(), 
				   .addr(), .rd(dmem_rdata) );	   

    // IFID, IDEX, EXMEM, MEMWB
				   
endmodule
