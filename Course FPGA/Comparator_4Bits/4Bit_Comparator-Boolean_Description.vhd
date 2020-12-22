-- 4 Bit Comparator using Boolean Description
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity Comparator_b is port(
	A,B		: in std_logic_vector(3 downto 0);
	Result	: out std_logic);
end entity;

-- Architecture
-- Boolean logic Description
architecture bool of Comparator_b is
begin
	Result <= 	not(A(3) xor B(3)) and
					not(A(2) xor B(2)) and
					not(A(1) xor B(1)) and
					not(A(0) xor B(0));
end architecture;