module exceptions(
	input clk,
	input dmiss,
	input imiss,
	input dfill,
	input ifill,
	input jump,

	output IFID_we,
	output IDEX_we,
	output EX_WBTL_we,
	output TLC_we,
	output CWB_we,
	output EXS1_we,
	output S12_we,
	output S23_we,
	output S34_we,

	output IFID_reset,
	output IDEX_reset,
	output EX_WBTL_reset,
	output TLC_reset,
	output CWB_reset,
	output EXS1_reset,
	output S12_reset,
	output S23_reset,
	output S34_reset,
	output pc_we
);

reg pc_write, IFID_write, IDEX_write, EX_WBTL_write, TLC_write, CWB_write, EXS1_write, S12_write, S23_write, S34_write, IFID_res, IDEX_res, EX_WBTL_res, TLC_res, CWB_res, EXS1_res, S12_res, S23_res, S34_res;

assign IFID_we = IFID_write;
assign IDEX_we = IDEX_write;
assign EX_WBTL_we = EX_WBTL_write;
assign TLC_we = TLC_write;
assign CWB_we = CWB_write;
assign EXS1_we = EXS1_write;
assign S12_we = S12_write;
assign S23_we = S23_write;
assign S34_we = S34_write;

assign IFID_reset = IFID_res;
assign IDEX_reset = IDEX_res;
assign EX_WBTL_reset = EX_WBTL_res;
assign TLC_reset = TLC_res;
assign CWB_reset = CWB_res;
assign EXS1_reset = EXS1_res;
assign S12_reset = S12_res;
assign S23_reset = S23_res;
assign S34_reset = S34_res;

assign pc_we = pc_write;
reg ifill_tmp, dfill_tmp;

always@(posedge clk) begin
	ifill_tmp <= ifill;
	dfill_tmp <= dfill;
end


always @(dmiss, imiss, dfill_tmp, ifill_tmp, jump)
begin
	if(imiss) begin
		IFID_write <= 0;
		pc_write <= 0;
	end
	if(dmiss) begin
		IFID_write <= 0;
		IDEX_write <= 0;
		EX_WBTL_write <= 0;
		TLC_write <= 0;
		pc_write <= 0;
	end
	if(ifill_tmp && !dmiss) begin
		IFID_write <= 1;
		pc_write <= 1;
	end
	if(dfill_tmp) begin
		IFID_write <= !imiss;
		IDEX_write <= 1;
		EX_WBTL_write <= 1;
		TLC_write <= 1;
		pc_write <= !imiss;
	end
	if(jump) begin
		IFID_res <= 1;
		IDEX_res <= 1;
	end
	else begin
		IFID_res <= 0;
		IDEX_res <= 0;
	end
end

initial begin
	IFID_write <= 1; 
	IDEX_write <= 1; 
	EX_WBTL_write <= 1; 
	TLC_write <= 1; 
	CWB_write <= 1;
	EXS1_write <= 1; 
	S12_write <= 1; 
	S23_write <= 1; 
	S34_write <= 1; 
	IFID_res <= 0; 
	IDEX_res <= 0; 
	EX_WBTL_res <= 0; 
	TLC_res <= 0; 
	CWB_res <= 0; 
	EXS1_res <= 0; 
	S12_res <= 0; 
	S23_res <= 0; 
	S34_res <= 0;
	pc_write <= 1;
end

endmodule