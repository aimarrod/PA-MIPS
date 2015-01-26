library verilog;
use verilog.vl_types.all;
entity exec is
    port(
        rs              : in     vl_logic_vector(31 downto 0);
        rt              : in     vl_logic_vector(31 downto 0);
        imm             : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        aluop           : in     vl_logic_vector(11 downto 0);
        alu_src         : in     vl_logic;
        branch          : in     vl_logic;
        jump            : out    vl_logic;
        overflow        : out    vl_logic
    );
end exec;
