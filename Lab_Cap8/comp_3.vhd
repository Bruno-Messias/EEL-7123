--Compressor(3;1,1)
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_3 is
  port(
    A:in std_logic_vector(2 downto 0);
    S:out std_logic_vector(1 downto 0));
end entity;
 
architecture rtl of comp_3 is

--Components
component fulladder is
	port(	
		A: 	in std_logic;
		B: 	in std_logic;
		Cin: 	in std_logic;
		S: 	out std_logic;
		Cout: out std_logic);
end component;

--Logic
begin
	Comp0: fulladder port map(A(2), A(1), A(0), S(0), S(1)); 
end architecture;