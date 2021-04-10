--Compressor(2,2,3;1,1,1,1)
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_223 is
  port(
    A:	in std_logic_vector(1 downto 0);
    B:	in std_logic_vector(1 downto 0);
	 C:	in std_logic_vector(2 downto 0);
    S:	out std_logic_vector(3 downto 0));
end entity;
 
architecture rtl of comp_223 is
--Signals
signal cp1_cout, cp0_cout: std_logic;

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
	Comp0: fulladder port map(C(2), C(1), C(0), S(0), cp0_cout); 
	Comp1: fulladder port map(B(1), B(0), cp0_cout, S(1), cp1_cout);
	Comp2: fulladder port map(A(1), A(0), cp1_cout, S(2), S(3));
end architecture;