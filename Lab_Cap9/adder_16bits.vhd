--Adder_7bits
--Author: bruno C. Messias
--Date: 16/02/21


library IEEE;
use IEEE.Std_Logic_1164.all;

entity adder_16bits is
port (A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(16 downto 0));
end entity;

architecture circuito_logico of adder_16bits is

	signal Cout: std_logic_vector(16 downto 0);

component fulladder is
port (A: in std_logic;
 B: in std_logic;
 Cin: in std_logic;
 S: out std_logic;
 Cout: out std_logic);
end component;

begin
Cout(0) <= Cin;

cpa_1 : for j in 0 to 15 generate

	cpa_j: fulladder port map( A => A(j), B => B(j), Cin => Cout(j),
	 S =>S(j) , Cout =>Cout(j+1));
 
end generate cpa_1;
S(16) <= Cout(16);

end architecture;