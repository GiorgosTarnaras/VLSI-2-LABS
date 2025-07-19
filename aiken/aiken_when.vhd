library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aiken_when is
    port(
        In1  : in  std_logic_vector (3 downto 0);
        Out1 : out std_logic_vector (3 downto 0)
    );
end aiken_when;

architecture when_arc of aiken_when is
begin
	Out1 <= "0000" when In1 = "0000" else
			"0001" when In1 = "0001" else
			"0010" when In1 = "0010" else
			"0011" when In1 = "0011" else
			"0100" when In1 = "0100" else
			"1011" when In1 = "0101" else
			"1100" when In1 = "0110" else
			"1101" when In1 = "0111" else
			"1110" when In1 = "1000" else
			"1111" when In1 = "1001" else
			"0000";
end when_arc;