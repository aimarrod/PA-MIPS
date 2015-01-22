module tags(tag, idx, miss);
	input [21:0] tag; //Tag
	input [4:0] idx; //Line and Byte index
	output miss; //Miss cable

	reg[21:0] tagList[31:0]; //Tag list (32 tags)

	initial begin
		miss <= 0; // Initial value
	end

	always@(tag, idx)
	begin
		if(tagList[idx] == tag)
			begin
				miss <= 0;
			end
		else
			begin
				miss <= 1;
			end
	end
endmodule

module tags_test;

	wire [31:0] addr;
	wire miss;

	tags t(addr[31:10], addr[9:5], miss);

	initial begin
		tags.tagList[0] = 22'b1111111111111111111111;
		tags.tagList[1] = 22'b1111111111111111111110;
	end

	always begin
		addr = #20 32'b1111111111111111111111_00000_00000;
		addr = #40 32'b1111111111111111111111_00001_00000;
		addr = #60 32'b1111111111111111111110_00000_00000;
		addr = #80 32'b1111111111111111111110_00001_00000;
	end