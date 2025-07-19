library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder is
    Port (
        inp   : in  std_logic_vector(7 downto 1);
        outp  : out std_logic_vector(2 downto 0)
    );
end priority_encoder;

architecture myenc of priority_encoder is
begin
    outp <= "111" when inp(7) = '1' else
        "110" when inp(6) = '1' else
        "101" when inp(5) = '1' else
        "100" when inp(4) = '1' else
        "011" when inp(3) = '1' else
        "010" when inp(2) = '1' else
        "001" when inp(1) = '1' else
        "000";
end myenc;