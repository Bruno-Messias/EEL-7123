-- example of using a generate block
-- Date: 02/01/2021
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity Generate_block is port (
	Ain, Bin : in  std_logic_vector(7 downto 0);
	Xout		: out std_logic_vector(7 downto 0) );
end entity;

-- Architecture
architecture logic of Generate_block is
begin
	Gen_proc : for i in 0 to 7 generate
		Xout(i) <= Ain(i) xor Bin(i);
	end generate;
end architecture;
