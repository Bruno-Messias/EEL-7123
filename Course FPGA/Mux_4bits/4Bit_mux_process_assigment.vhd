-- 4Bits Mux using Process Assigments 
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity mux4_p is port(
	a, b, c, d		: in std_logic_vector(3 downto 0);
	s					: in std_logic_vector(1 downto 0);
	x				  : out std_logic_vector(3 downto 0));
end entity;


-- Architecture
-- Process Assigments
architecture sel_arch of mux4_p is
begin
	
	mux_proc : process(a, b, c, d, s)
	
	begin
		
		if s = "00" then x <= a;
		elsif s = "01" then x <= b;
		elsif s = "10" then x <= c;
		else x <= d;
		end if;
		
	end process mux_proc;
	
end architecture;