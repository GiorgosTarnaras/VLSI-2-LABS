library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity absolute_value is
	port(
		In1, In2 : in  std_logic_vector (7 downto 0);
		Out1    : out std_logic_vector (8 downto 0)
	);
end absolute_value;

architecture subtraction of absolute_value is
	signal a, b : unsigned(7 downto 0);
	signal c    : unsigned(8 downto 0);  -- 9-bit to match Out1
begin
	a <= unsigned(In1);
	b <= unsigned(In2);
	
	process(a, b)
	begin
		if a >= b then
			c <= resize(a - b, 9);  -- Resize to 9 bits
		else
			c <= resize(b - a, 9);
		end if;
	end process;

	Out1 <= std_logic_vector(c);
end subtraction;
