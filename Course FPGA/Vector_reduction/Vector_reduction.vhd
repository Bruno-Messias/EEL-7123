-- Vector Reduction in VHDL
-- Date: 01/01/2021
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;
USE iEEE.std_logic_misc.all;

--Entity
entity Vector_reduction is port (
	vA, vB, vC, vD : in std_logic_vector(3 downto 0);
	W,U,X,Y,Z		: out std_logic );
end entity;

--Architecture
architecture RTL of Vector_reduction is
begin	
	W <= AND_REDUCE(vA);
	U <= NOR_REDuce(vB);
	X <= XOR_REDUCE(vD);
	Y <= OR_REDUCE(va) and vB(0);
	Z <= OR_REDUCE(vA and vB);
end architecture;
	