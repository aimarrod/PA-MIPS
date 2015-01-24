module pipeline(
	input clk, 
	input reset
);

wire IFID_we, IFID_reset;
wire IDEX_we, IDEX_reset;

wire IRB_we;

wire [31:0] inst_F, inst_D; //Instruction propagation wires
wire [31:0] pc_F, pc_D, pc_EX; //PC propagation wires

wire [31:0] alu_out;

wire pc_we;

//Control wires
wire mem_write_D, mem_write_EX;
wire alu_src_D, alu_src_EX;
wire alu_reg_write_D, alu_reg_write_EX;
wire mem_reg_write_D, mem_reg_write_EX;
wire long_write_D, long_write_EX;
wire branch_D, branch_EX;

//Register selectors
wire[4:0] rs_D;
wire[4:0] rt_D;
wire[4:0] rd_D, rd_EX;
wire[31:0] imm_D, imm_EX;
wire[11:0] aluop_D, aluop_EX;

wire[31:0] rs_data_D, rs_data_EX;
wire[31:0] rt_data_D, rt_data_EX;
wire[31:0] reg_write_data;

wire imiss, ifill, dmiss, dfill; //cache wires
wire [4:0] fill_idx;
wire [63:0] mem_stream;

fetch F(
	.clk(clk), 

	.branch_result(alu_out),
	.branch(branch_EX),
	.pc_write(pc_we),

	.fill(ifull),
	.fill_idx(fill_idx),
	.stream(mem_stream),

	.inst(inst_F), 
	.miss(imiss),
	.pc_out(pc_F)
); 

IF_ID IFID(
	.clk(clk), 
	.we(IFID_we),	
	.reset(IFID_reset),
	.inst_in(inst_F), 
	.inst_out(inst_D),
	.pc_in(pc_F),
	.pc_out(pc_D)
);

decode D(
	.inst(inst_D),
	
	.mem_write(mem_write_D),
	.alu_src(alu_src_D),
	.alu_reg_write(alu_reg_write_D),
	.mem_reg_write(mem_reg_write_D),
	.long_write(long_write_D),
	.branch(branch_D),

	.rs(rs_D),
	.rt(rt_D),
	.rd(rd_D),
	.imm(imm_D),
	.aluop(aluop_D)
);

register_bank IRB(
  .clk(clk), 
  .we(IRB_we), 
  
  .rs(rs_D),
  .rt(rt_D),
  .rd(rd_D),

  .rd_data(reg_write_data), //A complex one, heh, THIS IS AN INPUT AND NOT AN EASY ONE
  .rs_data(rs_data_D),
  .rt_data(rt_data_D)
);

ID_EX IDEX(
	.clk(clk),
	.we(IDEX_we),
	.reset(IDEX_reset),

	.pc_in(pc_D),
	.pc_out(pc_EX),

	.mem_write_in(mem_write_D),
	.mem_write_out(mem_write_EX),
	.alu_src_in(alu_src_D),
	.alu_src_out(alu_src_EX),
	.alu_reg_write_in(alu_reg_write_D),
	.alu_reg_write_out(alu_reg_write_EX),
	.mem_reg_write_in(mem_reg_write_D),
	.mem_reg_write_out(mem_reg_write_EX),
	.long_write_in(long_write_D),
	.long_write_out(long_write_EX),
	.branch_in(branch_D),
	.branch_out(branch_EX),
	.aluop_in(aluop_D),
	.aluop_out(aluop_EX),

	.rs_data_in(rs_data_D),
	.rs_data_out(rs_data_EX),
	.rt_data_in(rt_data_D),
	.rt_data_out(rt_data_EX),
	.rd_in(rd_D),
	.rd_out(rd_EX),
	.imm_in(imm_D),
	.imm_out(imm_EX)
);


always @(reset)
begin
	if(reset)
		F.pc = 32'd0;
		IRB.regs[0] <= 0;
		IRB.regs[1] <= 0;
		IRB.regs[2] <= 0;
		IRB.regs[3] <= 0;
		IRB.regs[4] <= 0;
		IRB.regs[5] <= 0;
		IRB.regs[6] <= 0;
		IRB.regs[7] <= 0;
		IRB.regs[8] <= 0;
		IRB.regs[9] <= 0;
		IRB.regs[10] <= 0;
		IRB.regs[11] <= 0;
		IRB.regs[12] <= 0;
		IRB.regs[13] <= 0;
		IRB.regs[14] <= 0;
		IRB.regs[15] <= 0;
		IRB.regs[16] <= 0;
		IRB.regs[17] <= 0;
		IRB.regs[18] <= 0;
		IRB.regs[19] <= 0;
		IRB.regs[20] <= 0;
		IRB.regs[21] <= 0;
		IRB.regs[22] <= 0;
		IRB.regs[23] <= 0;
		IRB.regs[24] <= 0;
		IRB.regs[25] <= 0;
		IRB.regs[26] <= 0;
		IRB.regs[27] <= 0;
		IRB.regs[28] <= 0;
		IRB.regs[29] <= 0;
		IRB.regs[30] <= 0;
		IRB.regs[31] <= 0;
		
end

endmodule

