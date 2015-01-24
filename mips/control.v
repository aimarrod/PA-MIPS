module control(input [3:0] op, output pc_src, output st_data);

 wire regdst,alusrc,memtoreg,regwrite,memread,memwrite,branch;

 //determines type of instruction
 wire ldb = ~op[3]&~op[2]&~op[1]&~op[0]; //0000
 wire ldh = ~op[3]&~op[2]&~op[1]&op[0]; //0001
 wire addb = ~op[3]&op[2]&~op[1]&~op[0]; //0100
 wire addh = ~op[3]&op[2]&~op[1]&op[0]; //0101
 wire stb = ~op[3]&~op[2]&op[1]&~op[0]; //0010
 wire sth = ~op[3]&~op[2]&op[1]&op[0]; //0011
 wire addslw = ~op[3]&op[2]&op[1]&~op[0]; //0110
 wire bnz = ~op[3]&op[2]&op[1]&op[0]; //0111

 assign st_data = stb | sth; //Store data in data cache
 assign pc_src = bnz;
endmodule
 