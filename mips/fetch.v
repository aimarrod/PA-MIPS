module fetch(
	input clk,
	
	input[20:0] branch_address, 
	input branch,
	input pc_write,

	input fill,
	input[63:0] stream,

	output [31:0] inst,
	output miss,
	output [31:0] pc_out
);

reg[31:0] pc;
tags t(.tag(pc[31:8]), .idx(pc[9:5]), .miss(miss));
icache c(.clk(clk), .idx(pc[7:3]), .idb(pc[2:0]), .data_out(inst), .fill(fill), .data_mem(stream));

assign pc_out = pc;

always @(posedge clk)
begin
	if(pc_write)
		if(branch) begin
			pc = {{11{pc[31:21]}},branch_address};
		end
		else begin
			pc = pc + 4;
		end
end

endmodule