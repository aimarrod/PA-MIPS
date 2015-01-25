module test();

reg clk;
reg reset;

reg enabler;

assign p.pc_we = enabler;
assign p.IFID_we = enabler;
assign p.IDEX_we = enabler;
assign p.EXWBTL_we = enabler;
assign p.TLC_we = enabler;
assign p.CWB_we = enabler;
assign p.EXS1_we = enabler;
assign p.S12_we = enabler;
assign p.S23_we = enabler;
assign p.S34_we = enabler;
assign p.dmiss = !enabler;
assign p.ROB_stall = !enabler;

pipeline p(clk, reset);

initial begin
	p.MEM.bytes[0] <= 8'b11110000;
	p.MEM.bytes[1] <= 8'b01111000;
	p.MEM.bytes[2] <= 8'b00111100;
	p.MEM.bytes[3] <= 8'b00011110;
	p.MEM.bytes[4] <= 8'b00001111;
	p.MEM.bytes[5] <= 8'b00000111;
	p.MEM.bytes[6] <= 8'b00000011;
	p.MEM.bytes[7] <= 8'b00000000;
	p.MEM.bytes[8] <= 8'b00000000;

	p.F.t.tagList[0] <= 32'd1;

	enabler = 1;

	reset = 1;
	#100;
	clk=0;
	reset = 0;
	p.F.pc = 0;
end

always begin
	clk = ~clk;
	#25;
end

endmodule