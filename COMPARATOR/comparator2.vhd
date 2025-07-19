library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned;

entity comparator2 is
	Port(A, B: in std_logic_vector(3 downto 0);
		EQUAL, GREATER, LESS: out std_logic);
	end comparator2;


architecture mycomp2 of comparator2 is 
signal Auns, Buns: unsigned(3 downto 0);
signal Diff: unsigned(4 downto 0);
begin

Auns <= unsigned(A);
Buns <= unsigned(B);

Diff <= ('0' & Auns) - ('0' & Buns); -- extend sign

EQUAL   <= '1' when Auns = Buns else '0';
GREATER <= '1' when Diff(4) = '0' and Auns /= Buns else '0';
LESS    <= '1' when Diff(4) = '1' else '0';

end mycomp2;