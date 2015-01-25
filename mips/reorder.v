module reorder_buffer(
	input clk,
	input stall,
	input[2:0] alu, //Alu index

	input alu_we,
	input[4:0] alu_rd,
	input[31:0] alu_pc,
	input alu_ex,
	input[31:0] alu_val,
	input alu_store,
	input[31:0] alu_addr,

	input[2:0] load, //Load index
	input[31:0] load_pc,
	input load_we,
	input[4:0] load_rd,
	input load_ex,
	input[31:0] load_val,

	input[2:0] slow, //Slow index
	input slow_we,
	input[31:0] slow_pc,
	input[4:0] slow_rd,
	input slow_ex,
	input[31:0] slow_val,

	output[31:0] val_out,
	output[4:0] rd_out,
	output we,

	output store_out,
	output[31:0] addr_out,

	output[2:0] tail_out,
	input next_head
);

reg[2:0] head, tail;
reg valid[2:0];
reg[31:0] value[2:0], epc[2:0];
reg exception[2:0];

//Load values
reg[4:0] rd[2:0];

//Store values
reg store[2:0];
reg[31:0] address[2:0];

assign val_out = value[head];
assign rd_out = store[head];
assign we = valid[head];

assign store_out = store[head];
assign address_out = address[head];
assign tail_out = tail;

always @(posedge clk) begin
	if(!stall) begin
		if(alu_we) begin
			valid[alu] <= 1;
			value[alu] <= alu_val;
			epc[alu] <= alu_pc;
			exception[alu] <= alu_ex;
			rd[alu] <= alu_rd;
			store[alu] <= alu_store;
			address[alu] <= alu_addr;
		end
		if(load_we) begin
			valid[load] <= 1;
			value[load] <= load_val;
			epc[load] <= load_pc;
			exception[load] <= load_ex;
			rd[load] <= load_rd;
			store[load] <= 0;
		end
		if(slow_we) begin
			valid[slow] <= 1;
			value[slow] <= slow_val;
			epc[slow] <= slow_pc;
			exception[slow] <= slow_ex;
			rd[slow] <= slow_rd;
			store[slow] <= 0;
		end
		if(valid[head]) begin
			valid[head] = 0;
			head = head+1;
		end
		if(next_head) begin
			valid[tail] = 0;
			tail = tail+1;
		end
	end
end

initial begin
	tail <= 0;
	head <= 0;
end

endmodule