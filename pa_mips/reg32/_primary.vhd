library verilog;
use verilog.vl_types.all;
entity reg32 is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic_vector(31 downto 0);
        rst             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end reg32;
