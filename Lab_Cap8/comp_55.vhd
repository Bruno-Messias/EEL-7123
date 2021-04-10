--Compressor(5,5;1,1,1,1)
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_55 is
  port(
    A:in std_logic_vector(4 downto 0);
	 B:in std_logic_vector(4 downto 0);
    S:out std_logic_vector(3 downto 0));
end entity;
 
architecture rtl of comp_55 is
--Signals
signal cp0_s, cp0_cout: std_logic;
signal cp1_s, cp1_cout: std_logic;
signal cp2_s, cp2_cout: std_logic;
signal cp3_cout, cp4_cout: std_logic;

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
	Comp0: fulladder port map(A(4), A(3), A(2), cp0_s, cp0_cout); 
	Comp1: fulladder port map(B(2), A(1), A(0), cp1_s, cp1_cout);
	Comp2: fulladder port map(B(3), cp1_s, cp0_cout, cp2_s, cp2_cout);	--Corrigir!
	Comp3: fulladder port map(A(1), A(0), cp0_cout, S(0), cp3_cout);
	Comp4: fulladder port map(B(4), cp2_s, cp3_cout, S(1), cp4_cout);
	Comp5: fulladder port map(cp1_cout, cp2_cout, cp4_cout, S(2), S(3));
	
end architecture;