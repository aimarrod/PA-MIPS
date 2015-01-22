module tags(
  input [21:0] tag, //Tag
  input [4:0] idx,
	output miss //Miss cable
);
	reg[21:0] tagList[31:0]; //Tag list (32 tags)
 	assign miss = (tagList[idx] == tag);

endmodule

module tags_test;
  
  reg [31:0] data;
	wire [31:0] addr;
	wire miss;
	
	assign addr = data;

	tags t(addr[31:10], addr[9:5], miss);

	initial begin
		t.tagList[0] = 22'b1111111111111111111111;
		t.tagList[1] = 22'b1111111111111111111110;
	end

	always begin
		data = #20 32'b1111111111111111111111_00000_00000;
		data = #40 32'b1111111111111111111111_00001_00000;
		data = #60 32'b1111111111111111111110_00000_00000;
		data = #80 32'b1111111111111111111110_00001_00000;
	end
endmodule