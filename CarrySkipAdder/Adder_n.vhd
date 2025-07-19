library ieee;
use ieee.std_logic_1164.all;

entity Adder_n is
	generic( n: integer := 8 );
	port(
		A, B : in  std_logic_vector( n-1 downto 0 );
		Cin  : in  std_logic;
		Outp : out std_logic_vector( n-1 downto 0 );
		Cout : out std_logic
	);
end Adder_n;

architecture ripple of Adder_n is

	component FA is
		PORT(
			a,b	: in  std_logic;
			cin		: in  std_logic;
			s, cout : out std_logic
		);  
	end component;

	signal temp : std_logic_vector( n downto 0 );
	
	begin
		temp(0) <= cin;
		generate_label:
		for i in 0 to n-1 generate
			adder_i : FA port map ( A(i), B(i), temp(i), Outp(i), temp(i+1) );
			
		end generate;
			
		Cout <= temp(n);
	
end ripple;