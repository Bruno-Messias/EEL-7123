-- Flip Flop sync/reset examples
-- Date: 01/01/2021
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity DFF is port (
	d, clk, set, reset	: in std_logic;
	q					: out std_logic );
end entity;

-- Architecture
architecture DFF_arch of DFF is
begin 
	dff_proc: process (clk)
		begin
			if (reset = '1') then q <= '0';
			elsif(rising_edge(clk)) then
				if (set = '0') then q <= '1';
				else	q <= d;
				end if;
			end if;
	end process;
end architecture;