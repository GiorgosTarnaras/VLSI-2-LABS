library ieee;
use ieee.std_logic_1164.all;

entity testbench_CSA is
end entity;

architecture behavior of testbench_CSA is

    component reg_CSA is 
		port(
			A, B : in  std_logic_vector(15 downto 0 );
			cin  : in  std_logic;
			Outp : out std_logic_vector(15 downto 0 );
			Cout : out std_logic;
			clk,rst	   : in std_logic
		);
	end component;

    signal clk, rst       : std_logic := '0';
    signal A, B           : std_logic_vector(15 downto 0) := "0000000000000000";
    signal cin            : std_logic := '0';
    signal Outp           : std_logic_vector(15 downto 0);
    signal Cout     	: std_logic;

    constant ClockPeriod  : time := 50 ps;

begin
    UUT: reg_CSA port map (
        clk => clk,
        rst => rst,
        A => A,
        B => B,
        cin => cin,
        Outp => Outp,
        Cout => Cout
    );

    process begin -- clock process
		clk <= not clk;
		wait for (ClockPeriod / 2);		
	end process;

    process begin
        rst <= '1';
        wait for ClockPeriod;
        rst <= '0';

		--overflow
        A <= "1111111111111111";
        B <= "0000000000000011";
		cin <= '0';
        wait for 4 * ClockPeriod;

		-- no overflow
        A <= "0000000000000010";
        B <= "0000000000000011";
		cin <= '0';
        wait for 4 * ClockPeriod;
		
        wait;
    end process;

end behavior;
