
library IEEE;
use IEEE.Std_Logic_1164.all;

--Entity
entity AMM is
port (A: in std_logic_vector(2 downto 0);
		B: in std_logic_vector(1 downto 0);
		C: in std_logic_vector(2 downto 0);
		D: in std_logic_vector(1 downto 0);
		E: in std_logic_vector(2 downto 0);
		F: in std_logic_vector(1 downto 0);
		G: in std_logic;
		S: out std_logic_vector(5 downto 0)
		);
end entity;

architecture VHDL of AMM is
--Signals

signal AB, CD : std_logic_vector(5 downto 0);
signal cp0, cp1, cp2, cp3, cp4, cp5, cp6, cp7, cp8 : std_logic_vector(1 downto 0); 
signal A_cpa, B_cpa, C_cpa: std_logic_vector(2 downto 0);
signal cpa_out : std_logic_vector(3 downto 0);


--Componets
component fulladder is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic
		);
end component;

component adder_3bits is
port (A: in std_logic_vector(2 downto 0);
		B: in std_logic_vector(2 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(3 downto 0));
end component;

begin

AB <= (A(2) and B(1)) & (A(1) and B(1)) & (A(0) and B(1)) & (A(2) and B(0)) & (A(1) and B(0)) & (A(0) and B(0));
CD <= (C(2) and D(1)) & (C(1) and D(1)) & (C(0) and D(1)) & (C(2) and D(0)) & (C(1) and D(0)) & (C(0) and D(0));

-- Primiero Nível

FA0: fulladder port map(G, AB(0), CD(0), cp0(0),cp0(1));
FA1: fulladder port map(AB(1), AB(3), CD(1), cp1(0),cp1(1));
FA2: fulladder port map(E(0), F(0), CD(3), cp2(0),cp2(1));
FA3: fulladder port map(AB(2), AB(4), CD(2), cp3(0),cp3(1));
FA4: fulladder port map(E(1), F(1), CD(4), cp4(0),cp4(1));
FA5: fulladder port map(E(2), AB(5), CD(5), cp5(0),cp5(1));

-- Segundo Nível

FA6: fulladder port map(cp0(1), cp1(0), cp2(0), cp6(0),cp6(1));
FA7: fulladder port map(cp1(1), cp2(1), cp3(0), cp7(0),cp7(1));
FA8: fulladder port map(cp5(0), cp4(1), cp3(1), cp8(0),cp8(1));

-- CPA 3 bits

A_cpa <= cp5(1) & cp8(0) & cp7(0);
B_cpa <= cp8(1) & cp7(1) & cp6(1);

CPA: adder_3bits port map(A_cpa, B_cpa, cp4(0), cpa_out);

-- Output

S <= cpa_out & cp6(0) & cp0(0);

end architecture;