-- Register File example
-- Date: 02/01/2021
-- Author: Bruno C. Messias

-- Not Working..

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity
entity regFile is
	generic ( 	Dwidth	: integer := 8;
					Awidth	: integer := 2	
	);
	
	port (
		clk, wren		: in  std_logic;
		wdata				: in  std_logic_vector(Dwidth-1 downto 0);
		waddr, raddr	: in  std_logic_vector(Awidth-1 downto 0);
		rdata				: out std_logic_vector(Dwidth-1 downto 0)
	);
	
end entity;
	
-- Architecture
architecture logic of regFile is
	type array_type(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
	signal array_reg : array_type;
begin
	rf_proc : process(clk, wren, wdata, waddr, raddr)
	begin
		if (rising_edge(clk)) then
			if (wren = '1') then 
				array_reg(to_integer(unsigned(waddr))) <= wdata;
			end if;
			rdata <= array_reg(to_integer(unsigned(raddr)));
		end if;
	end process;
end architecture;
	