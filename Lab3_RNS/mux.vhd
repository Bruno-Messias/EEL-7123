-- Generic Mux

library IEEE;
use IEEE.Std_Logic_1164.all;

-- Entity
entity mux is
generic (n : natural);
port (A: in std_logic_vector ((n-1) downto 0);
		B: in std_logic_vector ((n-1) downto 0);
		C: in std_logic_vector ((n-1) downto 0);
		D: in std_logic_vector ((n-1) downto 0);
		Sel: in std_logic_vector (1 downto 0);
		S: out std_logic_vector((n-1) downto 0));
end entity;
	  
-- ARQUITETURA ESTRUTURAL 
architecture mux_estr of mux is
begin


S <= 	A when Sel = "00" else
		B when Sel = "01" else
		C when Sel = "10" else
		D;
		
end architecture;