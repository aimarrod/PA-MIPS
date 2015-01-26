library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        reset           : in     vl_logic;
        inst_in         : in     vl_logic_vector(31 downto 0);
        inst_out        : out    vl_logic_vector(31 downto 0);
        pc_in           : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
