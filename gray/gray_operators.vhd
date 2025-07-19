library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity gray_operators is
    port(
        In1  : in  std_logic_vector (3 downto 0);
        Out1 : out std_logic_vector (3 downto 0)
    );
end gray_operators;
architecture operators of gray_operators is
begin
	Out1(3) <= In1(3);
	Out1(2) <= In1(3) xor In1(2);
	Out1(1) <= In1(2) xor In1(1); 
	Out1(0) <= In1(1) xor In1(0); 

end operators;