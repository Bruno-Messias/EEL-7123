--Mult3
--Author: bruno C. Messias
--Date: 16/02/21


library IEEE;
use IEEE.std_logic_1164.all;

entity mult3 is port(
	D: in std_logic_vector(7 downto 0);
	F: out std_logic_vector(8 downto 0));
end entity;

architecture mult3_logic of mult3 is
	signal E: std_logic_vector(7 downto 0);
	signal G1, G2:std_logic;
	
component adder_8bits is port(
	A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);
	Cin : std_logic;
	S: out std_logic_vector(8 downto 0));
end component;

begin 

	Sum1: adder_8bits port map(D,D,'0', S(7 downto 0) => E, S(8) => G1);
	SUM2: adder_8bits port map(E,D,'0',S(7 downto 0) => F(7 downto 0), S(8) => G2);
	
	F(8) <= G1 xor G2;

end architecture;


