// Table Lookaside Buffer, used for both data and instructions.
module TLB(input clk, [15:0]virtIn, [15:0]wrtPhys, wrtFlag,
            output reg [15:0]pysOut, missFlag);
  // Page size: 2^16.
  reg [31:0] physAddr[15:0];
  reg [31:0] virtAddr[15:0];
  reg [31:0] valid;
  // Flag that indicates if the cached @ has been found.
  reg found = 1'b0;
  reg i = 1'b0;
  
  // Read
  always @(posedge clk, virtIn)
  begin
    if (!wrtFlag) begin
      // Look for the addr, if valid, return it.
      for (i = 0; i < 31; i= i + 1) begin
        if (virtAddr[i] == virtIn) begin
          found <= 1;
          pysOut <= physAddr[i];
        end
      end
      // Otherwise, set miss.
      if (!found) begin
        assign missFlag = 1;
      end else begin
        found <= 0;
      end
    end
  end
  
  // Write
  always @(posedge clk, wrtFlag, wrtPhys)
  begin
    // Store new value.
    // Look for the first empty place.
    // Write.
  end
endmodule

module testTLB();
endmodule
