library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment is
	port(
		inputNO 		 				 : in  std_logic_vector (4 downto 0);
		inputNO_DECIMAL  				 : in  std_logic_vector (3 downto 0);
		dp 				 				 : out std_logic;
		sseg_MON, sseg_DEK, sseg_DECIMAL : out std_logic_vector (6 downto 0)
	);
end seven_segment;

architecture my_arch of seven_segment is

	component DEK_MON_decoder is
		port(
			integ    : in  std_logic_vector (4 downto 0);
			dek, mon : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component sev_seg_digit is
		port(
			In1     : in  std_logic_vector (3 downto 0);
			sev_seg : out std_logic_vector (6 downto 0)
		);
	end component;
		
	signal dec_dig, mon_dig : std_logic_vector(3 downto 0);
	signal temp_DECIMAL, temp_DEK     : std_logic_vector(6 downto 0);

	
	begin
		DEK_MON_DEC: DEK_MON_decoder port map (inputNO, dec_dig, mon_dig);
		
		dp <= NOT( inputNO(4) AND inputNO(3) AND ( inputNO(2) OR inputNO(1) ) );
		sev_seg_digit2 : sev_seg_digit port map (dec_dig, temp_DEK);
		sev_seg_digit1 : sev_seg_digit port map (mon_dig, sseg_MON);
		sev_seg_digit0 : sev_seg_digit port map (inputNO_DECIMAL, temp_DECIMAL);
		
		sseg_DEK <= temp_DEK;
		
		sseg_DECIMAL <= "1111001" when temp_DEK = "1111001" else
						temp_DECIMAL;		

end my_arch;
