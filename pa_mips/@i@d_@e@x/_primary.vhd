library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        reset           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        mem_write_in    : in     vl_logic;
        alu_src_in      : in     vl_logic;
        alu_reg_write_in: in     vl_logic;
        mem_reg_write_in: in     vl_logic;
        long_write_in   : in     vl_logic;
        branch_in       : in     vl_logic;
        mem_write_out   : out    vl_logic;
        alu_src_out     : out    vl_logic;
        alu_reg_write_out: out    vl_logic;
        mem_reg_write_out: out    vl_logic;
        long_write_out  : out    vl_logic;
        branch_out      : out    vl_logic;
        rs_data_in      : in     vl_logic_vector(31 downto 0);
        rs_data_out     : out    vl_logic_vector(31 downto 0);
        rt_data_in      : in     vl_logic_vector(31 downto 0);
        rt_data_out     : out    vl_logic_vector(31 downto 0);
        rd_in           : in     vl_logic_vector(4 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0);
        imm_in          : in     vl_logic_vector(31 downto 0);
        imm_out         : out    vl_logic_vector(31 downto 0);
        aluop_in        : in     vl_logic_vector(11 downto 0);
        aluop_out       : out    vl_logic_vector(11 downto 0)
    );
end ID_EX;
