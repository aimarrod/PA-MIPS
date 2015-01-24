module IF_ID(
	input clk, 
	input we, 
	input[15:0] inst_in, 
	output [15:0] inst_out
)

reg[15:0] inst;

assign inst_out = inst; 

always @(posedge clk)
begin
	if(we)
		begin
			inst <= inst_in;
		end
	
end

endmodule

module ID_EX(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module EX_WBTL(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module WBTL_C(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module C_WB(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module D_F1(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module F1_F2(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module F2_F3(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module F3_F4(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module F4_F5(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule

module F5_WB(input clk, input we)

always @(posedge clk)
begin
	if(we)
		begin
			
		end
	
end

endmodule