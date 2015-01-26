library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        clk             : in     vl_logic;
        iaddr           : in     vl_logic_vector(31 downto 0);
        daddr           : in     vl_logic_vector(31 downto 0);
        imiss           : in     vl_logic;
        dmiss           : in     vl_logic;
        data            : out    vl_logic_vector(63 downto 0);
        ifill           : out    vl_logic;
        dfill           : out    vl_logic;
        data_in         : in     vl_logic_vector(63 downto 0);
        we              : in     vl_logic;
        addr_in         : in     vl_logic_vector(31 downto 0)
    );
end memory;
