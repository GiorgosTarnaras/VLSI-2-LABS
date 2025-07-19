library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LU is
generic( m: integer := 8 );
	PORT(A, B: in std_logic_vector(m-1 downto 0);
	     Op: in std_logic_vector(1 downto 0);
	     Outp: out std_logic_vector(m-1 downto 0);
	     Zero: out std_logic);  
end LU;


architecture myarch of LU is 
signal Res, Zero_res: std_logic_vector ( m-1 downto 0 );
begin
	Zero_res(0) <= Res(0);

	generate_label:
	for i in 0 to m-1 generate 
		Res(i) <= (A(i) and B(i)) when Op = "00" else 
					(not A(i)) when Op = "01" else
					(A(i) or B(i)) when Op = "10" else 
					(A(i) xor B(i)); 
	end generate;
	generate_label2:
	for j in 1 to m-1 generate
		Zero_res(j) <= Zero_res(j-1) or Res(j);
	end generate;


	Outp <= Res;
	Zero <= not Zero_res(m-1); 
end myarch;


