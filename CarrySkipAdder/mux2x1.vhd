library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is

    Port (
        A   : in  std_logic;
        B  : in std_logic;
		s: in std_logic;
		C: out std_logic
    );
end mux2x1;

architecture myarch of mux2x1 is 

begin  
	with s select
		C <= A when '0', 
		B when OTHERS;
end myarch;