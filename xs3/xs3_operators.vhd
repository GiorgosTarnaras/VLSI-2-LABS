library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xs3_operators is
    port(
        In1  : in  std_logic_vector(3 downto 0);
        Out1 : out std_logic_vector(3 downto 0)
    );
end xs3_operators;

architecture operators of xs3_operators is
begin
    Out1 <= std_logic_vector(unsigned(In1) + 3);
end operators;