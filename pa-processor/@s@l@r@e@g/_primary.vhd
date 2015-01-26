library verilog;
use verilog.vl_types.all;
entity SLREG is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        reset           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        value_in        : in     vl_logic_vector(31 downto 0);
        rd_in           : in     vl_logic_vector(4 downto 0);
        rob_index_in    : in     vl_logic_vector(2 downto 0);
        write_in        : in     vl_logic;
        pc_out          : out    vl_logic_vector(31 downto 0);
        value_out       : out    vl_logic_vector(31 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0);
        rob_index_out   : out    vl_logic_vector(2 downto 0);
        write_out       : out    vl_logic
    );
end SLREG;
