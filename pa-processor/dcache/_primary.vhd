library verilog;
use verilog.vl_types.all;
entity dcache is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        data_mem        : in     vl_logic_vector(63 downto 0);
        idx             : in     vl_logic_vector(4 downto 0);
        fidx            : in     vl_logic_vector(4 downto 0);
        idb             : in     vl_logic_vector(2 downto 0);
        we              : in     vl_logic;
        fill            : in     vl_logic;
        word            : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0);
        data_mem_in     : out    vl_logic_vector(63 downto 0)
    );
end dcache;
