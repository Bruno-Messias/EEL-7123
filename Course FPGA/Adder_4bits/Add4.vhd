-- 4 Bit Adder for testing the ModelSim simulation
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


-- Entity
entity Add4 is port(
	Data1,Data2		: in std_logic_vector(3 downto 0);
	Cin				: in std_logic;
	Cout			  : out std_logic;
	Sum			  : out std_logic_vector(3 downto 0));
end entity;

-- Architecture
architecture rtl of Add4 is

	signal Out5Bit : std_logic_vector(4 downto 0);

begin

	Out5Bit <= ('0' & Data1) + ('0' & Data2) + Cin;
	Sum 	  <= Out5Bit(3 downto 0); --4 bits
	Cout	  <= Out5Bit(4); 		     --5th bit
	
end architecture;