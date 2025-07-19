library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEK_MON_decoder is
	port(
		integ    : in  std_logic_vector (4 downto 0);
		dek, mon : out std_logic_vector (3 downto 0)
	);
end DEK_MON_decoder;

architecture assignment of DEK_MON_decoder is
begin
	with integ select
		mon <= "0000" when "00000",
			   "0001" when "00001",
			   "0010" when "00010",
			   "0011" when "00011",
			   "0100" when "00100",
			   "0101" when "00101",
			   "0110" when "00110",
			   "0111" when "00111",
			   "1000" when "01000",
			   "1001" when "01001",
			   "0000" when "01010",
			   "0001" when "01011",
			   "0010" when "01100",
			   "0011" when "01101",
			   "0100" when "01110",
			   "0101" when "01111",
			   "0110" when "10000",
			   "0111" when "10001",
			   "1000" when "10010",
			   "1001" when "10011",
			   "0000" when "10100",
			   "0001" when "10101",
			   "0010" when "10110",
			   "0011" when "10111",
			   "0100" when "11000",
			   "0101" when "11001",
			   "1111" when "11010",
			   "1111" when "11011",
			   "1111" when "11100",
			   "1111" when "11101",
			   "1111" when "11110",
			   "1111" when "11111",
			   "XXXX" when others;
			   
	with integ select
		dek <= "0000" when "00000",
			   "0000" when "00001",
			   "0000" when "00010",
			   "0000" when "00011",
			   "0000" when "00100",
			   "0000" when "00101",
			   "0000" when "00110",
			   "0000" when "00111",
			   "0000" when "01000",
			   "0000" when "01001",
			   "0001" when "01010",
			   "0001" when "01011",
			   "0001" when "01100",
			   "0001" when "01101",
			   "0001" when "01110",
			   "0001" when "01111",
			   "0001" when "10000",
			   "0001" when "10001",
			   "0001" when "10010",
			   "0001" when "10011",
			   "0010" when "10100",
			   "0010" when "10101",
			   "0010" when "10110",
			   "0010" when "10111",
			   "0010" when "11000",
			   "0010" when "11001",
			   "1111" when "11010",
			   "1111" when "11011",
			   "1111" when "11100",
			   "1111" when "11101",
			   "1111" when "11110",
			   "1111" when "11111",
			   "XXXX" when others;

end assignment;