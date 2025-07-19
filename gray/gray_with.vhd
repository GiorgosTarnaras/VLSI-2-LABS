library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity gray_with is
    port(
        In1  : in  std_logic_vector (3 downto 0);
        Out1 : out std_logic_vector (3 downto 0)
    );
end gray_with;
architecture with_arc of gray_with is
begin
with In1 select
		Out1 <= "0000" when "0000",
				"0001" when "0001",
				"0011" when "0010",
				"0010" when "0011",
				"0110" when "0100",
				"0111" when "0101",
				"0101" when "0110",
				"0100" when "0111",
				"1100" when "1000",
				"1101" when "1001",
				"1111" when "1010",
				"1110" when "1011",
				"1010" when "1100",
				"1011" when "1101",
				"1001" when "1110",
				"1000" when "1111",
				"0000" when others;
end with_arc;