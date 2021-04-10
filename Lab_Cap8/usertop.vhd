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

component vhdl_cap8 is
port (A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		C: in std_logic_vector(3 downto 0);
		D:	in std_logic_vector(3 downto 0);
		S: out std_logic_vector(13 downto 0)
		);
end component;

begin
	TOP: vhdl_cap8 port map(SW(3 downto 0), SW(7 downto 4), SW(11 downto 8), SW(15 downto 12), LEDR(13 downto 0));

end architecture;	