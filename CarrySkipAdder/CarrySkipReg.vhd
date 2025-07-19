library ieee;
use ieee.std_logic_1164.all;

entity CarrySkipReg is
	port(
		A, B : in  std_logic_vector( 15 downto 0 );
		Cin  : in  std_logic;
		clk, rst    : in std_logic;
		Outp : out std_logic_vector( 15 downto 0 );
		Cout : out std_logic
	);
end CarrySkipReg;


architecture myarch of CarrySkipReg is 


component QD
    generic (n:integer:=4);
    PORT(q:in std_logic_vector(n-1 downto 0);
         clk,rst:std_logic;
         d:out std_logic_vector(n-1 downto 0));
    end component;
component CarrySkip
	generic( n: integer := 4 ; m: integer := 4);
	port(
		A, B : in  std_logic_vector( n*m -1 downto 0 );
		Cin  : in  std_logic;
		Outp : out std_logic_vector( n*m -1 downto 0 );
		Cout : out std_logic
	);
end component;

signal A_Q, B_Q, Outp_Q: std_logic_vector(15 downto 0);
signal Cin_Q, Cout_Q, CoutVec, CinVec: std_logic_vector(1 downto 0);

begin 
	CinVec(1) <= Cin;
	CinVec(0) <= '0';
	Reg1: QD generic map(16) port map(A, clk, rst, A_Q);
    Reg2: QD generic map(16) port map(B, clk, rst, B_Q);
    Reg3: QD generic map(2) port map(CinVec, clk, rst, Cin_Q);
    CSkip: CarrySkip generic map(4, 4) port map(A_Q, B_Q, Cin_Q(1), Outp_Q, Cout_Q(1));
    Cout_Q(0) <= '0';
    Reg4: QD generic map(16) port map(Outp_Q, clk, rst, Outp);
	Reg5: QD generic map(2) port map(Cout_Q, clk, rst, CoutVec);
	Cout <= CoutVec(1);
end myarch;