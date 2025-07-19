library ieee;
use ieee.std_logic_1164.all;

entity mux2nx1 is
generic(n : integer := 4);
    Port (
        A   : in  std_logic_vector(n-1 downto 0);
        B  : in std_logic_vector(n-1 downto 0);
		s: in std_logic;
		C: out std_logic_vector(n-1 downto 0)
    );
end mux2nx1;

architecture myarch of mux2nx1 is  
begin 
    with s select
        C <= A when '0', 
        B when OTHERS;
end myarch;