library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity xs3_with is
    port(
        In1  : in  std_logic_vector(3 downto 0);
        Out1 : out std_logic_vector(3 downto 0)
    );
end xs3_with;
architecture with_arc of xs3_with is
begin
	with In1 select
		Out1 <= "0011" when "0000",
				"0100" when "0001",
				"0101" when "0010",
				"0110" when "0011",
				"0111" when "0100",
				"1000" when "0101",
				"1001" when "0110",
				"1010" when "0111",
				"1011" when "1000",
				"1100" when "1001",
				"1111" when others;
end with_arc;