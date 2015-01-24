library verilog;
use verilog.vl_types.all;
entity tags is
    port(
        tag             : in     vl_logic_vector(23 downto 0);
        idx             : in     vl_logic_vector(4 downto 0);
        miss            : out    vl_logic
    );
end tags;
