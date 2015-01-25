module memory(
  input clk, 
  
  input [31:0] iaddr,
  input [31:0] daddr,
  input imiss,
  input dmiss,

  output [63:0] data, 
  output ifill, 
  output dfill   
);

  reg tmpdf0, tmpdf1, tmpdf2;
  reg tmpif0, tmpif1, tmpif2;
  reg[63:0] tmpd1, tmpd2;
  reg[31:0] arq;
  
  reg [7:0]bytes [2048:0];

  assign data = tmpd2;
  assign ifill = tmpif2;
  assign dmiss = tmpdf2;

  always @(posedge clk)
  // Write register.
  begin
    if(dmiss & !tmpdf1 & !tmpdf0 & !tmpdf2) begin
      arq[31:2] <= daddr[31:2];
      tmpdf0 <= 1;
    end
    else if(imiss & !tmpif1 & !tmpif0 & !tmpif2) begin
      arq[31:2] <= iaddr[31:2];
      tmpif0 <= 1;
    end
    
    tmpd1 <= { {8{bytes[arq+7]}}, {8{bytes[arq+6]}}, {8{bytes[arq+5]}}, {8{bytes[arq+4]}}, {8{bytes[arq+3]}}, {8{bytes[arq+2]}}, {8{bytes[arq+1]}}, {8{bytes[arq]}}};
    tmpd2 <= tmpd1;

    if(tmpif0) begin
      tmpif1 <= tmpif0;
      tmpif0 <= 0;
    end
    if(tmpif1) begin
      tmpif2 <= tmpif1;
      tmpif1 <= 0;
    end
    if(tmpdf0) begin
      tmpdf1 <= tmpdf0;
      tmpdf0 <= 0;
    end
    if(tmpdf1) begin
      tmpdf2 <= tmpif1;
      tmpdf1 <= 0;
    end

  end

  initial begin
    arq <= 0;
    tmpd1 <= 0;
    tmpd2 <= 0;
    tmpdf0 <= 0;
    tmpdf1 <= 0; 
    tmpdf2 <= 0;
    tmpif1 <= 0; 
    tmpif2 <= 0;
    tmpif0 <= 0;
    arq <= 32'd0;
  end
endmodule