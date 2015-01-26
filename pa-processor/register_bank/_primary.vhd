library verilog;
use verilog.vl_types.all;
entity register_bank is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        rd_data         : in     vl_logic_vector(31 downto 0);
        rs_data         : out    vl_logic_vector(31 downto 0);
        rt_data         : out    vl_logic_vector(31 downto 0)
    );
end register_bank;
