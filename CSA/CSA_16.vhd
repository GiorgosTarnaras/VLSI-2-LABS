library ieee;
use ieee.std_logic_1164.all;


entity CSA_16 is
	PORT(
		A, B : in  std_logic_vector( 15 downto 0 );
		cin: in std_logic;
		Outp : out std_logic_vector( 15 downto 0 );
		Cout : out std_logic
	);
end CSA_16;


architecture myarch of CSA_16 is

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
signal carry, carry_0, carry_1: std_logic_vector(3 downto 0);

begin 
	Res1(3 downto 0) <= "0000";
	Res0(3 downto 0) <= "0000";	
	carry_0(0) <= '0';
	carry_1(0) <= '0';
	
	ADDER1: Adder_n generic map(4) port map(A(3 downto 0), B(3 downto 0), cin, Outp(3 downto 0), carry(0));

	generate_label:
	for i in 1 to 3 generate 
		 ADDER_i_0: Adder_n generic map(4) port map(A(i*4+3 downto i*4), B(i*4+3 downto i*4), '0', Res0(i*4+3 downto i*4), carry_0(i));
		 ADDER_i_1: Adder_n generic map(4) port map(A(i*4+3 downto i*4), B(i*4+3 downto i*4), '1', Res1(i*4+3 downto i*4), carry_1(i));
		 carry(i) <= (carry(i-1) and carry_1(i)) or carry_0(i);
		 mux_i: mux2nx1 generic map(4) port map(Res0(i*4+3 downto i*4), Res1(i*4+3 downto i*4), carry(i-1), Outp(i*4+3 downto i*4));
	end generate;
	Cout <= carry(3);
end myarch;
