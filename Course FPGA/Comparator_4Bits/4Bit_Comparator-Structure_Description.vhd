-- 4 Bit Comparator using Structure Description --> Do not work, need gates pkg
-- Date: 13/12/2020
-- Author: Bruno C. Messias

-- Use standart IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity Comparator is port(
	A,B		: in std_logic_vector(3 downto 0);
	Result	: out std_logic);
end Comparator;

use work.gates.all;

-- Architecture
-- Structure gate description
architecture struct of Comparator is
	signal x	: std_logic_vector(3 downto 0);
begin
	u3: xnor2 port map (A(3), B(3), X(3));
	u2: xnor2 port map (A(2), B(2), X(2));
	u1: xnor2 port map (A(1), B(1), X(1));
	u0: xnor2 port map (A(0), B(0), X(0));
	
	U4: and4 port map (X(3),X(2),X(1),X(0), Result);
	
end struct;