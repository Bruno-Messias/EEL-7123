-- 4 Bit Comparator using Dataflow Description
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity Comparator_d is port(
	A,B		: in std_logic_vector(3 downto 0);
	Result	: out std_logic);
end entity;

-- Architecture
-- Dataflow logic Description
architecture dataflow of Comparator_d is
begin
	Result <= '1' when (A=B) else '0';
	
end architecture;