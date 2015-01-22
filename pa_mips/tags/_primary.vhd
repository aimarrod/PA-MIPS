library verilog;
use verilog.vl_types.all;
entity tags is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        miss            : out    vl_logic
    );
end tags;
