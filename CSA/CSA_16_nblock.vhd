library ieee;
use ieee.std_logic_1164.all;
entity CSA_16_nblock is
generic(n : integer := 4);
	PORT(
		A, B : in  std_logic_vector(15 downto 0 );
		cin: in std_logic;
		Outp : out std_logic_vector(15 downto 0 );
		Cout : out std_logic
	);
end CSA_16_nblock;
architecture myarch of CSA_16_nblock is 
component Adder_n
generic(n : integer := 8);
	PORT(
		A, B : in  std_logic_vector( n-1 downto 0 );
		cin: in std_logic;
		Outp : out std_logic_vector( n-1 downto 0 );
		Cout : out std_logic
	);
	end component;
component mux2nx1 
    generic(n : integer := 4);
    Port (
        A   : in  std_logic_vector(n-1 downto 0);
        B  : in std_logic_vector(n-1 downto 0);
		s: in std_logic;
		C: out std_logic_vector(n-1 downto 0)
    );
end component;
signal Res0, Res1: std_logic_vector(15 downto 0);
signal carry, carry_0, carry_1: std_logic_vector((16/n) - 1 downto 0);
begin 
	ADDER1: Adder_n generic map(n) port map(A(n-1 downto 0), B(n-1 downto 0), cin, Outp(n-1 downto 0), carry(0));
	generate_label:
	for i in 1 to (16/n) - 1 generate 
		 ADDER_i_0: Adder_n generic map(n) 
		 port map(A((i + 1) * n - 1 downto i*n), B((i + 1) * n - 1 downto i*n), 
		 	'0', 
		 	Res0((i + 1) * n - 1 downto i*n), 
		 	carry_0(i));

		 ADDER_i_1: Adder_n generic map(n) 
		 port map(A((i + 1) * n - 1 downto i*n), B((i + 1) * n - 1 downto i*n), 
		 	'1', 
		 	Res1((i + 1) * n - 1 downto i*n), 
		 	carry_1(i));
		 carry(i) <= (carry(i-1) and carry_1(i)) or carry_0(i);
		 mux_i: mux2nx1 generic map(n) 
		 port map(Res0((i + 1) * n - 1 downto i*n), Res1((i + 1) * n - 1 downto i*n), 
		 	carry(i-1), 
		 	Outp((i + 1) * n - 1 downto i*n));
	end generate;
	Cout <= carry((16/n) - 1);
end myarch;
