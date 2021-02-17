library IEEE;
use IEEE.std_logic_1164.all;
	
entity usertop is
port(
	CLOCK_50:in std_logic;
	CLK_500Hz:in std_logic;
	RKEY:in std_logic_vector(3 downto 0);
	KEY:in std_logic_vector(3 downto 0);
	RSW:in std_logic_vector(17 downto 0);
	SW:in std_logic_vector(17 downto 0);
	LEDR:out std_logic_vector(17 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0));
end entity;

architecture logic of usertop is
	signal D,E,F: std_logic;
begin
	
	LEDR(0) <= D or E or F;
	D <= SW(0) and SW(2);
	E <= SW(0) and SW(2);
	F <= SW(1) and SW(3);

end architecture;
