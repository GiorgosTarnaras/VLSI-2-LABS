library ieee;
use ieee.std_logic_1164.all;

entity PropBlock is
	generic( n: integer := 4 );
	port(
		A, B : in  std_logic_vector( n-1 downto 0 );
		P: out std_logic
	);
end PropBlock;


architecture myarch of PropBlock is 

signal Pij: std_logic_vector(n-1 downto 0);

begin 
	Pij(0) <=  A(0) xor B(0);
	gen_label:
	for k in 1 to n-1 generate 
		Pij(k) <= Pij(k-1) and (A(k) xor B(k));
	end generate;

	P <= Pij(n-1);
end myarch;