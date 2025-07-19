library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aiken_with is
    port(
        In1  : in  std_logic_vector (3 downto 0);
        Out1 : out std_logic_vector (3 downto 0)
    );
end aiken_with;

architecture with_arc of aiken_with is
begin
	with In1 select
		Out1 <= "0000" when "0000",
				"0001" when "0001",
				"0010" when "0010",
				"0011" when "0011",
				"0100" when "0100",
				"1011" when "0101",
				"1100" when "0110",
				"1101" when "0111",
				"1110" when "1000",
				"1111" when "1001",
				"0000" when others;
end with_arc;