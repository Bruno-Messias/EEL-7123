--Compressor(2,2;1,1,1)
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_22 is
  port(
    A:in std_logic_vector(1 downto 0);
	 B:in std_logic_vector(1 downto 0);
    S:out std_logic_vector(2 downto 0));
end entity;
 
architecture rtl of comp_22 is
--Signals
signal cp0_cout: std_logic;

--Components
component fulladder is
	port(	
		A: 	in std_logic;
		B: 	in std_logic;
		Cin: 	in std_logic;
		S: 	out std_logic;
		Cout: out std_logic);
end component;

component halfadder is
  port(
    A: 		in std_logic;
    B: 		in std_logic;
    S: 		out std_logic;
    Cout: 	out std_logic);
end component;

--Logic
begin
	Comp0: halfadder port map(A(1), A(0), S(0), cp0_cout); 
	Comp1: fulladder port map(B(1), B(0), cp0_cout, S(1), S(2));

	
end architecture;