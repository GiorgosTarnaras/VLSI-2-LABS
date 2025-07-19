library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(
		Op   	   : in  std_logic_vector ( 2 downto 0 );
		A, B 	   : in  std_logic_vector ( 7 downto 0 );
		Outp 	   : out std_logic_vector ( 7 downto 0 );
		Zero, Cout : out std_logic
	);
end ALU;

architecture AU_LU of ALU is
	component AU is
		generic( m: integer := 8 );
		port(
			A, B : in  std_logic_vector( m-1 downto 0 );
			Op   : in  std_logic_vector( 1 downto 0) ;
			Outp : out std_logic_vector( m-1 downto 0 );
			Zero, Cout : out std_logic
		);
	end component;
	
	component LU is
		generic( m: integer := 8 );
		PORT(A, B: in std_logic_vector(m-1 downto 0);
			Op: in std_logic_vector(1 downto 0);
			Outp: out std_logic_vector(m-1 downto 0);
			Zero: out std_logic);  
	end component;
	
	signal AU_outp, LU_outp : std_logic_vector( 7 downto 0 );
	signal AU_zero, LU_zero : std_logic;
	
	begin
		arithmetic : AU generic map (8) port map( A, B, Op(1 downto 0), AU_outp, AU_zero, Cout );
		logic : LU generic map (8) port map( A, B, Op(1 downto 0), LU_outp, LU_zero);
		
		Outp <= AU_outp when Op(2) = '0' else
				LU_outp;
		Zero <= AU_zero when Op(2) = '0' else
				LU_zero;

end AU_LU;