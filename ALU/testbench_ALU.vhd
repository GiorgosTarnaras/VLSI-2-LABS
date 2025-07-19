library ieee;
use ieee.std_logic_1164.all;

entity testbench_ALU is
end entity;

architecture behavior of testbench_ALU is

    component reg_ALU is
        port(
            Op   	   : in  std_logic_vector (2 downto 0);
            A, B 	   : in  std_logic_vector (7 downto 0);
            clk, rst   : in  std_logic;
            Outp 	   : out std_logic_vector (7 downto 0);
            Zero, Cout : out std_logic
        );
    end component;

    signal clk, rst       : std_logic := '0';
    signal A, B           : std_logic_vector(7 downto 0) := "00000000";
    signal Op             : std_logic_vector(2 downto 0) := "000";
    signal Outp           : std_logic_vector(7 downto 0);
    signal Zero, Cout     : std_logic;

    constant ClockPeriod  : time := 20 ns;

begin
    UUT: reg_ALU port map (
        clk => clk,
        rst => rst,
        A => A,
        B => B,
        Op => Op,
        Outp => Outp,
        Zero => Zero,
        Cout => Cout
    );

    process begin -- clock process
		clk <= not clk;
		wait for (ClockPeriod / 2);		
	end process;

    process begin
        rst <= '1';
        wait for 2 * ClockPeriod;
        rst <= '0';

		-- overflow in addition
        A <= "11111111";
        B <= "00000011";
        Op <= "000";
        wait for 4 * ClockPeriod;

		-- subtraction of equal numbers
        A <= "00000011";
        B <= "00000011";
        Op <= "001";
        wait for 4 * ClockPeriod;
		
		-- negative output
        A <= "00000011";
        B <= "00000111";
        Op <= "001";
        wait for 4 * ClockPeriod;

		-- XOR equal;
        A <= "00010100";
        B <= "00010100";
        Op <= "111";
        wait for 4 * ClockPeriod;

        
        wait;
    end process;

end behavior;
