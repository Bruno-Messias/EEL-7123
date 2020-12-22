-- 4Bits Mux using Conditional Assigments 
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity mux4_c is port(
	a, b, c, d		: in std_logic_vector(3 downto 0);
	s					: in std_logic_vector(1 downto 0);
	x				  : out std_logic_vector(3 downto 0));
end entity;


-- Architecture
-- Conditional Assigments
architecture sel_arch of mux4_c is
begin

	x <=  a when (s = "00") else
			b when (s = "01") else
			c when (s = "10") else
			d;
			
end architecture;