module test();

reg clk;
reg reset;

reg enabler;

assign p.pc_we = enabler;
assign p.IFID_we = enabler;
assign p.IDEX_we = enabler;

pipeline p(clk, reset);

initial begin
	p.F.t.tagList[0] = 22'd0;
	p.F.t.tagList[1] = 22'd0;
	
	p.F.c.data[0][0] = 8'b00001111;
	p.F.c.data[0][1] = 8'b11110000;
	p.F.c.data[0][2] = 8'b00111100;
	p.F.c.data[0][3] = 8'b00000011;

	p.F.c.data[0][4] = 8'b00010100;
	p.F.c.data[0][5] = 8'b00000000;
	p.F.c.data[0][6] = 8'b11111100;
	p.F.c.data[0][7] = 8'b00010111;

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