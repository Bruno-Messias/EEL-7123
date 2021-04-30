library IEEE;
use IEEE.std_logic_1164.all;

entity usertop is port(
	CLOCK_50:in std_logic;
	CLK_500Hz:in std_logic;
	RKEY:in std_logic_vector(3 downto 0);
	KEY:in std_logic_vector(3 downto 0);
	RSW:in std_logic_vector(17 downto 0);
	SW:in std_logic_vector(17 downto 0);
	LEDR:out std_logic_vector(17 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0));
end entity;

architecture compile of usertop is

component AMM is
port (A: in std_logic_vector(2 downto 0);
		B: in std_logic_vector(1 downto 0);
		C: in std_logic_vector(2 downto 0);
		D: in std_logic_vector(1 downto 0);
		E: in std_logic_vector(2 downto 0);
		F: in std_logic_vector(1 downto 0);
		G: in std_logic;
		S: out std_logic_vector(5 downto 0)
		);
end component;

begin

	TOP: AMM port map(SW(2 downto 0), SW(4 downto 3), SW(7 downto 5), SW(9 downto 8), SW(12 downto 10), SW(14 downto 13), SW(15), LEDR(5 downto 0));

end architecture;