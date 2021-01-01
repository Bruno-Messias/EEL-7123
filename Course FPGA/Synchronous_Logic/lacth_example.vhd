-- Lacth Example
-- Date: 01/01/2021
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

--Entity
entity Dlatch is port (
	d, gate, clr	: in std_logic;
	q					: out std_logic );
end entity;

-- Architecture
architecture logic of Dlatch is
begin
	latch_proc : process(gate, d, clr)
	begin
		if (clr='1') then q <= '0'; -- adding clear port
		elsif (gate ='1') then q <= d; -- No rising_edge()
		end if;
			-- No gate = 0 value, so latch inferred
	end process;
end architecture;
		