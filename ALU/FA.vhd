library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FA is
	PORT(a,b: in std_logic;
	     cin: in std_logic;
	     s, cout:out std_logic);  
end FA;


architecture myarch of FA is 
begin 
	s <= (a xor b xor cin);
	cout <= (a and b) or (cin and (a xor b));
end myarch;