module IF_ID(
	input clk, 
	input we, 
	input reset,

	input[31:0] inst_in, 
	output [31:0] inst_out,
	input[31:0] pc_in,
	output[31:0] pc_out
);

reg[31:0] inst;
reg[31:0] pc;

assign inst_out = inst;
assign pc_out = pc; 

always @(posedge clk)
begin
	if(we) begin
			inst <= inst_in;
			pc <= pc_in;
	end
	if(reset) begin
		inst <= 0;
		pc <= 0;
	end
	
end

endmodule

module ID_EX(
	input clk, 
	input we, 
	input reset,

	input[31:0] pc_in,
	output[31:0] pc_out,

	input mem_write_in,
	input alu_src_in,
	input alu_reg_write_in,
	input mem_reg_write_in,
	input long_write_in,
	input branch_in,
	output mem_write_out,
	output alu_src_out,
	output alu_reg_write_out,
	output mem_reg_write_out,
	output long_write_out,
	output branch_out,
	//Step data	
	input[31:0] rs_data_in,
	output[31:0] rs_data_out, 
	input[31:0] rt_data_in, 
	output[31:0] rt_data_out,
	input[4:0] rd_in,
	output[4:0] rd_out,
	input[4:0] rs_in,
	output[4:0] rs_out,
	input[31:0] imm_in,
	output[31:0] imm_out,
	input[11:0] aluop_in,
	output[11:0] aluop_out,
	input[20:0] baddr_in,
	output[20:0] baddr_out
);

reg[4:0] rd, rs;
reg[31:0] imm, rs_data, rt_data;
reg mem_write, alu_src, alu_reg_write, mem_reg_write, long_write, branch;
reg [31:0] pc;
reg [11:0] aluop;
reg [20:0] baddr;

assign rs_data_out = rs_data;
assign rt_data_out = rt_data;
assign rd_out = rd;
assign rs_out = rs;
assign imm_out = imm;
assign aluop_out = aluop;
assign baddr_out = baddr;

assign mem_write_out = mem_write;
assign alu_src_out = alu_src;
assign alu_reg_write_out = alu_reg_write;
assign mem_reg_write_out = mem_reg_write;
assign long_write_out = long_write;
assign branch_out = branch;

assign pc_out = pc;

always @(posedge clk)
begin
	if(we) begin
		rs_data <= rs_data_in;
		rt_data <= rt_data_in;
		rd <= rd_in;
		rs <= rs_in;
		imm <= imm_in;		
		baddr <= baddr_in;

		mem_write <= mem_write_in;
		alu_src <= alu_src_in;
		alu_reg_write <= alu_reg_write_in;
		mem_reg_write <= mem_reg_write_in;
		long_write <= long_write_in;
		branch <= branch_in;

		aluop <= aluop_in;
		
		pc <= pc_in;
	end
	if(reset) begin
		rs_data <= 0;
		rt_data <= 0;
		rd <= 0;
		imm <= 0;
		rs <= 0;
		
		mem_write <= 0;
		alu_src <= 0;
		alu_reg_write <= 0;
		mem_reg_write <= 0;
		long_write <= 0;
		branch <= 0;

		aluop <= 0;
		pc <= 0;
	end
	
end

endmodule

module EX_WBTL(
	input clk, 
	input we, 
	input reset,

	input[31:0] pc_in,
	output[31:0] pc_out,

	input[31:0] alu_result_in,
	output[31:0] alu_result_out,
	input[4:0] rd_in,
	output[4:0] rd_out,
	input[4:0] rs_in,
	output[4:0] rs_out,
	input[31:0] rs_data_in,
	output[31:0] rs_data_out,

	input mem_write_in;
	input alu_reg_write_in,
	input mem_reg_write_in,
	input long_write_in,
	output mem_write_out,
	output alu_reg_write_out,
	output mem_reg_write_out,
	output long_write_out,
)

reg[4:0] rd, rs;
reg mem_write, alu_src, alu_reg_write, mem_reg_write, long_write, branch;
reg [31:0] pc, alu_result, rs_data;

assign rs_data_out = rs_data;
assign alu_result_out = alu_result;
assign rd_out = rd;
assign rs_out = rs;

assign mem_write_out = mem_write;
assign alu_reg_write_out = alu_reg_write;
assign mem_reg_write_out = mem_reg_write;
assign long_write_out = long_write;

assign pc_out = pc;

always @(posedge clk)
begin
	if(we) begin
		rs <= rs_in;
		rd <= rd_in;
		rs_data <= rs_data_in;
		alu_result <= alu_result_in;

		mem_write <= mem_write_in;
		alu_reg_write <= alu_reg_write_in;
		mem_reg_write <= mem_reg_write_in;
		long_write <= long_write_in;

		pc <= pc_in;
	end
	if(reset) begin
		rs <= 0;
		rd <= 0;
		rs_data <= 0;
		alu_result <= 0;

		mem_write <= 0;
		alu_reg_write <= 0;
		mem_reg_write <= 0;
		long_write <= 0;

		pc <= 0;
	end

endmodule
