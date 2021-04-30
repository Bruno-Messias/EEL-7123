-- Multiplicador AxB

library IEEE;
use IEEE.Std_Logic_1164.all;
entity mult is
port (A: in std_logic_vector (2 downto 0);
		B: in std_logic_vector (1 downto 0);
		S: out std_logic_vector(5 downto 0)
		);
end entity;
  
 -- ARQUITETURA ESTRUTURAL 
architecture mux_estr of mult is
--Signal
signal out1,out2,out3,out4 : std_logic_vector(5 downto 0);

begin

out1 <= "000000";
out2 <= "000" & A;
out3 <= A & "000";
out4 <= A & A;

S <= 	out1 when B = "00" else
		out2 when B = "01" else
		out3 when B = "10" else
		out4;
	
end architecture;