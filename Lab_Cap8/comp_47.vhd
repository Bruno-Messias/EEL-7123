--Compressor(4,7;1,1,1,1)
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_47 is
  port(
    A:in std_logic_vector(6 downto 0); 
	 B:in std_logic_vector(3 downto 0); 
    S:out std_logic_vector(3 downto 0)); 
end entity;
 
architecture rtl of comp_47 is
--Signals
signal cp0_S, cp0_cout: 	std_logic;
signal cp1_S, cp1_cout: 	std_logic;
signal cp2_cout, cp5_cout: std_logic;
signal cp3_S, cp3_cout: 	std_logic;
signal cp4_S, cp4_cout: 	std_logic;

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
	Comp0: fulladder port map(A(6), A(5), A(4), cp0_s, cp0_cout); --0 0
	Comp1: fulladder port map(A(3), A(2), A(1), cp1_s, cp1_cout); --1 0
	Comp2: fulladder port map(cp0_s, cp1_s, A(0), S(0), cp2_cout);--1 0
	Comp3: fulladder port map(B(0), cp0_cout, cp1_cout, cp3_s, cp3_cout); --0 0
	Comp4: fulladder port map(B(3), B(2), B(1), cp4_s, cp4_cout); --0 0
	Comp5: fulladder port map(cp2_cout, cp3_s, cp4_s, S(1), cp5_cout);-- 0 0
	Comp6: fulladder port map(cp4_cout, cp3_cout, cp5_cout, S(2), S(3)); -- 0 
end architecture;