library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        op_1            : in     vl_logic_vector(31 downto 0);
        op_2            : in     vl_logic_vector(31 downto 0);
        aluop           : in     vl_logic_vector(11 downto 0);
        branch          : in     vl_logic;
        result          : out    vl_logic_vector(31 downto 0);
        overflow        : out    vl_logic
    );
end alu;
