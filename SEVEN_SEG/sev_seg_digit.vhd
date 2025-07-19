library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity sev_seg_digit is
	port(
		In1     : in  std_logic_vector (3 downto 0);
		sev_seg : out std_logic_vector (6 downto 0)
	);
end sev_seg_digit;

architecture bool_logic of sev_seg_digit is

	signal In_n : std_logic_vector (3 downto 0);

	begin
		In_n(0) <= NOT In1(0);
		In_n(1) <= NOT In1(1);
		In_n(2) <= NOT In1(2);
		In_n(3) <= NOT In1(3);

		sev_seg(0) <= NOT(
					  (In_n(3) AND In_n(2) AND In_n(1) AND In1(0)) 
					  OR (In_n(3) AND In1(2) AND In_n(1) AND In_n(0))
					  );
		sev_seg(1) <= (In_n(3) AND In_n(2)) 
					  OR (In_n(3) AND In_n(1) AND In_n(0)) 
					  OR (In_n(3) AND In1(1) AND In1(0)) 
					  OR (In1(3) AND In_n(2) AND In_n(1));
		sev_seg(2) <= (In_n(3) AND In1(2)) 
					  OR (In_n(3) AND In1(0)) 
					  OR (In_n(2) AND In_n(1));
		sev_seg(3) <= (In1(3)) 
					  OR (In1(1) AND In_n(0)) 
					  OR (In_n(2) AND In1(1)) 
					  OR (In_n(2) AND In_n(0)) 
					  OR (In1(2) AND In_n(1) AND In1(0));
		sev_seg(4) <= (In1(1) AND In_n(0)) 
					  OR (In1(3) AND In1(2)) 
					  OR (In_n(2) AND In_n(1) AND In_n(0));
		sev_seg(5) <= (In1(3))
					  OR (In1(2) AND In_n(1)) 
					  OR (In_n(1) AND In_n(0)) 
					  OR (In1(2) AND In_n(0));
		sev_seg(6) <= (In1(3)) 
					  OR (In1(1) AND In_n(0)) 
					  OR (In1(2) AND In_n(1)) 
					  OR (In_n(2) AND In1(1));
	
end bool_logic;