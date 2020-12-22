-- 4Bits Mux using Select Assigments 
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity mux4_s is port(
	a, b, c, d		: in std_logic_vector(3 downto 0);
	s					: in std_logic_vector(1 downto 0);
	x				  : out std_logic_vector(3 downto 0));
end entity;


-- Architecture
-- Select S Assigments
architecture sel_arch of mux4_s is
begin
	with s select
		x <=  a when "00",
				b when "01",
				c when "10",
				d when others;
			
end architecture;