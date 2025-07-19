library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aiken_operators is
    port(
        In1  : in  std_logic_vector (3 downto 0);
        Out1 : out std_logic_vector (3 downto 0)
    );
end aiken_operators;

architecture operators of aiken_operators is
	signal b0, b1, b2, b3 : std_logic;
begin
    b0 <= In1(0);
    b1 <= In1(1);
    b2 <= In1(2);
    b3 <= In1(3);
    Out1(0) <= b0;
    Out1(1) <= ((not b3) and (not b2) and b1) or ((not b3) and b2 and (not b1) and b0) or (b3 and (not b2) and (not b1));
    Out1(2) <= ((not b3) and b2 and (not b0)) or (b3 and (not b2) and (not b1)) or ((not b3) and b2 and b1);
    Out1(3) <= (b3 and (not b2) and (not b1)) or ((not b3) and b2 and b0) or ((not b3) and b2 and b1);
end operators;
