-- Some synchronos examples
-- Date: 01/01/2021
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity Synchronos_logic is port (
	clk, reset, load 	: in std_logic;
	d					   : in  std_logic_vector(3 downto 0);
	q			   	   : out std_logic_vector(3 downto 0) );
end entity;

-- Arhitecture
architecture REG_arch of Synchronos_logic is
	begin dreg_proc : process(clk, reset, load)
		begin	
			if (reset = '0') then q <= "0000";
			elsif (rising_edge(clk)) then	
				if (load = '1') then q <= d;
				end if;
			end if;
	end process;
end architecture;