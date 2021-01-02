-- Some synchronos examples
-- Date: 01/01/2021
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- Entity
entity Synchronos_logic is port (
	clk, reset, load, en	: in std_logic;
	d							: in  std_logic_vector(3 downto 0);
	q							: out std_logic_vector(3 downto 0) );
end entity;

-- Architecture
architecture logic of Synchronos_logic is

	signal temp: std_logic_vector(3 downto 0);

begin
	cont_proc: process (clk, reset, load, en)
	begin
		if (reset = '1') then temp <= "0000";
		elsif (rising_edge(clk)) then
			if (load = '1') then temp <= d;
			elsif (en = '1') then temp <= temp + 1;
			end if;
		end if;
	end process;
	q <= temp;
end architecture;