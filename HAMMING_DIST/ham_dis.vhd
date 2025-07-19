library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ham_dis is
	Port (A: in std_logic_vector(7 downto 0);
		  B: in std_logic_vector(7 downto 0);
		  Dis: out std_logic_vector(3 downto 0));
	end ham_dis;

architecture conc of ham_dis is 
signal C: std_logic_vector(7 downto 0); 
signal cnt: unsigned(3 downto 0);
begin
    C <= A xor B;
    cnt <= ("000" & C(0)) +
            ("000" & C(1)) +
            ("000" & C(2)) +
            ("000" & C(3)) +
            ("000" & C(4)) +
            ("000" & C(5)) +
            ("000" & C(6)) +
            ("000" & C(7));
    Dis <= std_logic_vector(cnt);
end conc;