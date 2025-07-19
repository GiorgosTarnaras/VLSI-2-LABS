library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned;

entity comparator is
	Port(A, B: in std_logic_vector(3 downto 0);
		EQUAL, GREATER, LESS: out std_logic);
	end comparator;


architecture mycomp of comparator is 

begin
EQUAL <= '1' when (A=B) else
	'0';
GREATER <= '1' when (A>B) else
	'0';
LESS <= '0' when A>B else
		'0' when A=B else
 	'1';
end mycomp;