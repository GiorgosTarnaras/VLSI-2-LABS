library ieee;
use ieee.std_logic_1164.all;

entity reg_ALU is 
port(
		Op   	   : in  std_logic_vector ( 2 downto 0 );
		A, B 	   : in  std_logic_vector ( 7 downto 0 );
		clk,rst	   : in std_logic;
		Outp 	   : out std_logic_vector ( 7 downto 0 );
		Zero, Cout : out std_logic
	);
end reg_ALU;

architecture myarch of reg_ALU is 
	
	component ALU 
	port(
		Op   	   : in  std_logic_vector ( 2 downto 0 );
		A, B 	   : in  std_logic_vector ( 7 downto 0 );
		Outp 	   : out std_logic_vector ( 7 downto 0 );
		Zero, Cout : out std_logic
	);
	end component;


	component QD
	generic (n:integer:=4);
	PORT(q:in std_logic_vector(n-1 downto 0);
	     clk,rst:std_logic;
	     d:out std_logic_vector(n-1 downto 0));
	end component;

	signal A_Q, B_Q, Outp_Q : std_logic_vector(7 downto 0);
	signal Op_Q: std_logic_vector(2 downto 0);
	signal Zero_Q, Cout_Q, Zero_Temp, Cout_Temp: std_logic_vector(1 downto 0);

	begin
		Zero_Q(0) <= '0';
		Cout_Q(0) <= '0';
		Reg1: QD generic map(8) port map(A, clk, rst, A_Q);
		Reg2: QD generic map(8) port map(B, clk, rst, B_Q);
		Reg3: QD generic map(3) port map(Op, clk, rst, Op_Q);
		my_ALU: ALU port map(Op_Q, A_Q, B_Q, Outp_Q, Zero_Q(1), Cout_Q(1));
		Reg4: QD generic map(8) port map(Outp_Q, clk, rst, Outp);
		Reg5: QD generic map(2) port map(Zero_Q, clk, rst, Zero_Temp);
		Reg6: QD generic map(2) port map(Cout_Q, clk, rst, Cout_Temp);

		Zero <= Zero_Temp(1);
		Cout <= Cout_Temp(1);

end myarch;
	