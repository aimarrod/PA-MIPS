module Registers(input clk, writeFlag, [31:0]inData, [31:0]regWrt, [31:0]read1, [31:0]read2, output reg [31:0]data1, reg [31:0]data2);
  // Data is stored here.
  // 32 Regs -> 4b
  reg [31:0]regfile [31:0];

  
  always @(posedge clk, inData, regWrt, writeFlag)
  // Write register.
  begin
    if(writeFlag)
    begin
      regfile[regWrt] <= inData; //write to register
      //$display("Does WrReg: %d Data: %d",WrReg,InData);
    end
  end
  
  // Read register.
  always @(posedge clk, read1, read2)
  begin
    data1 = regfile[read1];//read values from registers
    data2 = regfile[read2];
    //$monitor ("R3: %d R4: %d R5 %d R6: %d R7: %d R8 %d R9: %d R10: %d R11 %d R12: %d R13: %d R14%d",regfile[3],regfile[4],regfile[5],regfile[6],regfile[7],regfile[8],regfile[9],regfile[10],regfile[11],regfile[12],regfile[13],regfile[14]);
  end
endmodule
