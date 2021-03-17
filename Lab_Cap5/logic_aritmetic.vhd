
library IEEE;
use IEEE.Std_Logic_1164.all;

entity logic_aritmetic is
port (A: in std_logic_vector(3 downto 0);
		c: in std_logic;
		R: out std_logic_vector(10 downto 0));
		
end entity;

architecture logic of logic_aritmetic is

signal mux_out0, mux_out1, mux_out2: std_logic;
signal X, Y: std_logic_vector(7 downto 0);
signal S: std_logic_vector(8 downto 0);
signal notA2: std_logic;

component adder_8bits is port(
	A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);
	Cin : std_logic;
	S: out std_logic_vector(8 downto 0));
end component;

component mux21 is
port (A: in std_logic;
		B: in std_logic;
		s: in std_logic;
		F: out std_logic);
end component;

begin

notA2 <= not(A(2));

MUX0: mux21 port map(A(3), A(0), c, mux_out0);
MUX1: mux21 port map(A(0), A(1), c, mux_out1);
MUX2: mux21 port map(A(1), notA2, c, mux_out2);

X <= ((c or A(3)) & (c and A(3)) & (mux_out2) & (mux_out1) & (mux_out0) & (not(c) and A(2)) & (A(1) or c) & (A(0) or c));

Y <= ((c) & (A(2)) & (A(3)) & (A(2)) & (A(1)) & (A(0)) & (A(3)) & (A(2)));

SUM: adder_8bits port map (X, Y, '0', S);

R <= (S & A(1) & A(0));

end architecture;