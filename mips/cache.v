module tags(
  input [21:0] tag, //Tag
  input [4:0] idx,
	output miss //Miss cable
);
	
	reg[23:0] tagList[31:0]; //Tag list (32 tags)
 	assign miss = (tagList[idx] == tag);

endmodule

module cache(
  input clk,
  input [31:0] data_in, //Input data to �write 
  input [255:0] data_mem, //Full line (from memory)
  input [4:0] idx_mem, //Line to write from memory
  input [4:0] idx, //Line on the cache
  input [2:0] idb, //Byte on the line
  input we, //Write enabled (miss and store)
  input fill, //Fill from memory
  output[31:0] data_out //Output data for reads
);

 reg[31:0] data[31:0][7:0];
 
 assign data_out = data[idx][idb];
 
 always @(posedge clk)
 begin
  if(we)
    begin
      data[idx][idb] <= data_in;
    end 
  if(fill)
    begin
      data[idx_mem][0] <= data_mem[31:0];
      data[idx_mem][1] <= data_mem[63:32];
      data[idx_mem][2] <= data_mem[95:64];
      data[idx_mem][3] <= data_mem[127:96];
      data[idx_mem][4] <= data_mem[159:128];
      data[idx_mem][5] <= data_mem[191:160];
      data[idx_mem][6] <= data_mem[223:192];
      data[idx_mem][7] <= data_mem[255:224];
    end
 end
   

endmodule

/*
module tags_test;
  
  reg clk;
  
  reg [31:0] data_t;
	wire [31:0] addr;
	
	reg [31:0] data_c;
	wire [31:0] wire_c;
	
	wire miss;
	wire[31:0] data;
	
	assign addr = data_t;
  assign wire_c = data_c;
  
	tags t(.tag(addr[31:10]), .idx(addr[9:5]), .miss(miss));
	cache c(.clk(clk), .idx(addr[9:5]), .idb(addr[4:0]), .we(miss), .data_in(wire_c), .data_out(data));

	initial begin
		t.tagList[0] = 22'b1111111111111111111111;
		t.tagList[1] = 22'b1111111111111111111110;
		
		c.data[0][0] = 32'd1;
		c.data[0][1] = 32'd2;
		c.data[0][2] = 32'd3;
		c.data[1][0] = 32'd4;
		c.data[1][1] = 32'd5;
		c.data[1][2] = 32'd6;
		
	  data_c = 32'd99;
	end

	always begin
	  clk <= #20 0;
		data_t = #20 32'b1111111111111111111111_00000_00000; //Idx 0 idb 0
		clk <= #40 1;
		clk <= #60 0;
		data_t = #80 32'b1111111111111111111111_00001_00010; //Idx 1 idb 2
		clk <= #80 1;
	end
endmodule
*/