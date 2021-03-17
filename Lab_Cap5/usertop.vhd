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
	
end usertop;

architecture compile of usertop is

component logic_aritmetic is
port (A: in std_logic_vector(3 downto 0);
		c: in std_logic;
		R: out std_logic_vector(10 downto 0));
end component;

begin

	TOP: logic_aritmetic port map(SW(3 downto 0), SW(17), LEDR(10 downto 0));

end architecture;	