library ieee;
use ieee.std_logic_1164.all;
entity CarrySkip is
	generic( n: integer := 4 ; m: integer := 4);
	port(
		A, B : in  std_logic_vector( n*m -1 downto 0 );
		Cin  : in  std_logic;
		Outp : out std_logic_vector( n*m -1 downto 0 );
		Cout : out std_logic
	);
end CarrySkip;

architecture myarch of CarrySkip is  
component Adder_n 
	generic( n: integer := 8 );
	port(
		A, B : in  std_logic_vector( n-1 downto 0 );
		Cin  : in  std_logic;
		Outp : out std_logic_vector( n-1 downto 0 );
		Cout : out std_logic
	); 
	end component;
	
component PropBlock 
	generic( n: integer := 4 );
	port(
		A, B : in  std_logic_vector( n-1 downto 0 );
		P: out std_logic
	);
	end component;	

component mux2x1 
    Port (
        A   : in  std_logic;
        B  : in std_logic;
		s: in std_logic;
		C: out std_logic
    );
end component;

signal car: std_logic_vector(m downto 0);
signal car0, prop: std_logic_vector(m-1 downto 0);

begin
	car(0)<= Cin; 
    gen_lbl:
	for i in 0 to m-1 generate
		Adder: Adder_n generic map(n) port map(A(i*n + (n-1) downto i*(n)), B(i*n + (n-1) downto i*(n)), car(i), Outp(i*n + (n-1) downto i*(n)), car0(i));
		pbl: PropBlock generic map(n) port map(A(i*n + (n-1) downto i*(n)), B(i*n + (n-1) downto i*(n)), prop(i));
		mx: mux2x1 port map(car0(i), car(i), prop(i), car(i+1));
		end generate;
		
	Cout <= car(m);
end myarch;


