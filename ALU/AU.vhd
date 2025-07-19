library ieee;
use ieee.std_logic_1164.all;

entity AU is
	generic( m: integer := 8 );
	port(
		A, B : in  std_logic_vector( m-1 downto 0 );
		Op: in std_logic_vector(1 downto 0);
		Outp : out std_logic_vector( m-1 downto 0 );
		Zero, Cout : out std_logic
	);
end AU;



architecture my_arch of AU is

component Adder_n is
	generic( n: integer := 8 );
	port(
		A, B : in  std_logic_vector( n-1 downto 0 );
		Cin  : in  std_logic;
		Outp : out std_logic_vector( n-1 downto 0 );
		Cout : out std_logic
	);
end component;
		
	signal sum, diff, Res, Zero_res,  B_comp : std_logic_vector ( m-1 downto 0 );
	signal cout_sum, cout_diff, Cout_res : std_logic;
	
begin
	
	Addition : Adder_n generic map(m) port map( A, B, '0', sum, cout_sum );
	
	B_comp <= not B;
	Subtraction : Adder_n generic map(m) port map( A, B_comp, '1', diff, cout_diff);
	
	Res <= sum when Op(0) = '0' else diff;

	Zero_res(0) <= Res(0);

	generate_label:
	for i in 1 to m-1 generate
		Zero_res(i) <= Zero_res(i-1) or Res(i);
	end generate;

	Zero <= (not Zero_res(m-1)) and (not Cout_res); 
	
	Cout_res <= cout_sum when Op(0) = '0' else not cout_diff;
	Cout <= Cout_res;
	Outp <= Res;

end my_arch;
