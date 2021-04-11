--Compressor(2,5;1,2,1)
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_25 is
  port(
    A:in std_logic_vector(1 downto 0); 
	 B:in std_logic_vector(4 downto 0); 
    S:out std_logic_vector(3 downto 0));
end entity;
 
architecture rtl of comp_25 is
--Signals
signal cp0_S, cp0_cout: std_logic;

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
	Comp0: fulladder port map(B(4), B(3), B(2), cp0_s, cp0_cout); 
	Comp1: fulladder port map(B(1), B(0), cp0_s, S(0), S(1));
	Comp2: fulladder port map(A(1), A(0), cp0_cout, S(2), S(3));
end architecture;