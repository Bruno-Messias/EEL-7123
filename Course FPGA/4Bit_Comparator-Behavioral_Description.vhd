-- 4 Bit Comparator using Behavioral Description
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity Comparator_be is port(
	A,B		: in std_logic_vector(3 downto 0);
	Result	: out std_logic);
end entity;

-- Architecture
-- Behavioral logic Description
architecture behavioral of Comparator_be is
begin
	CompareProcess : process(A, B)
	begin
	
		if (A=B) then
			Result <= '1';
		else 
			Result <= '0';
		end if;
		
	end process;
	
end architecture;