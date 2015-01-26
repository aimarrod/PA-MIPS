module exec(
	input[31:0] rs,
	input[31:0] rt,
	input[31:0] imm,

	output[31:0] result,

	input[11:0] aluop,
	input alu_src,
	input branch,
	output jump
);

alu ALU(.op_1(rs), .op_2((alu_src)?imm:rt), .aluop(aluop), .branch(branch), .result(result));
assign jump = (branch&result);

endmodule

module alu(
	input[31:0] op_1,
	input[31:0] op_2,
	input[11:0] aluop,
	input branch,
	output[31:0] result
);

assign result = (branch)?(op_1!=0):(op_1 + op_2);

endmodule