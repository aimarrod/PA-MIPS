module tags(
  input clk,
  input [23:0] tag, //Tag
  input [4:0] idx,
  input fill,
	output miss //Miss cable
);
	
reg[23:0] tagList[31:0]; //Tag list (32 tags)
assign miss = (tagList[idx] != tag);

always @(posedge clk) begin
  if(fill) begin
    tagList[idx] <= tag;
  end
end

initial begin
  tagList[0] <= 23'b11111111111111111111111;
  tagList[1] <= 23'b11111111111111111111111;
  tagList[2] <= 23'b11111111111111111111111;
  tagList[3] <= 23'b11111111111111111111111;
  tagList[4] <= 23'b11111111111111111111111;
  tagList[5] <= 23'b11111111111111111111111;
  tagList[6] <= 23'b11111111111111111111111;
  tagList[7] <= 23'b11111111111111111111111;
  tagList[8] <= 23'b11111111111111111111111;
  tagList[9] <= 23'b11111111111111111111111;
  tagList[10] <= 23'b11111111111111111111111;
  tagList[11] <= 23'b11111111111111111111111;
  tagList[12] <= 23'b11111111111111111111111;
  tagList[13] <= 23'b11111111111111111111111;
  tagList[14] <= 23'b11111111111111111111111;
  tagList[15] <= 23'b11111111111111111111111;
  tagList[16] <= 23'b11111111111111111111111;
  tagList[17] <= 23'b11111111111111111111111;
  tagList[18] <= 23'b11111111111111111111111;
  tagList[19] <= 23'b11111111111111111111111;
  tagList[20] <= 23'b11111111111111111111111;
  tagList[21] <= 23'b11111111111111111111111;
  tagList[22] <= 23'b11111111111111111111111;
  tagList[23] <= 23'b11111111111111111111111;
  tagList[24] <= 23'b11111111111111111111111;
  tagList[25] <= 23'b11111111111111111111111;
  tagList[26] <= 23'b11111111111111111111111;
  tagList[27] <= 23'b11111111111111111111111;
  tagList[28] <= 23'b11111111111111111111111;
  tagList[29] <= 23'b11111111111111111111111;
  tagList[30] <= 23'b11111111111111111111111;
  tagList[31] <= 23'b11111111111111111111111;

end

endmodule
  
module dcache(
  input clk,
  input [31:0] data_in, //Input data to write 
  input [63:0] data_mem, //Full line (from memory)
  input [4:0] idx, //Line on the cache
  input [2:0] idb, //Byte on the line
  input we, //Write enabled (miss and store)
  input fill, //Fill from memory
  input word, //Read byte
  output[31:0] data_out //Output data for reads
);

 reg[7:0] data[31:0][7:0]; 
 
 assign data_out[7:0] = data[idx][idb];
 assign data_out[15:8] = (word)?data[idx][idb+1]:{8{data[idx][idb][7]}};
 assign data_out[23:16] = (word)?data[idx][idb+2]:{8{data[idx][idb][7]}};
 assign data_out[31:24] = (word)?data[idx][idb+3]:{8{data[idx][idb][7]}};

 always @(posedge clk)
 begin
  if(we) begin
  	if(word) begin
	    data[idx][idb] <= data_in[7:0];
    	data[idx][idb+1] <= data_in[15:8];
      data[idx][idb+2] <= data_in[23:16];
      data[idx][idb+3] <= data_in[31:24];
    end
    else begin
    	data[idx][idb] <= data_in[7:0];
    end
  end 
  if(fill) begin
      data[idx][0] <= data_mem[7:0];
      data[idx][1] <= data_mem[15:8];
      data[idx][2] <= data_mem[23:16];
      data[idx][3] <= data_mem[31:24];
      data[idx][4] <= data_mem[39:32];
      data[idx][5] <= data_mem[47:40];
      data[idx][6] <= data_mem[55:48];
      data[idx][7] <= data_mem[63:56];
    end
 end

endmodule

module icache(
  input clk,
  input [63:0] data_mem, //Full line (from memory)
  input [4:0] idx, //Line on the cache
  input [2:0] idb, //Byte on the line
  input fill, //Fill from memory
  output[31:0] data_out //Output data for reads
);

 reg[7:0] data[31:0][7:0]; 
 
 assign data_out[7:0] = data[idx][idb];
 assign data_out[15:8] = data[idx][idb+1];
 assign data_out[23:16] = data[idx][idb+2];
 assign data_out[31:24] = data[idx][idb+3];
 
 always @(posedge clk)
 begin
  if(fill)
    begin
      data[idx][0] <= data_mem[7:0];
      data[idx][1] <= data_mem[15:8];
      data[idx][2] <= data_mem[23:16];
      data[idx][3] <= data_mem[31:24];
      data[idx][4] <= data_mem[39:32];
      data[idx][5] <= data_mem[47:40];
      data[idx][6] <= data_mem[55:48];
      data[idx][7] <= data_mem[63:56];
    end
 end

endmodule
