--Lab Intro 1
--Author: Bruno C. Messias
--Date: 16/02/21  

library IEEE;
use IEEE.std_logic_1164.all;

entity majority is port (	
	A: in std_logic;
	B: in std_logic;
	C: in std_logic;
	Y: out std_logic);
	
end entity;

architecture logic of majority is
	signal D,E,F: std_logic;
begin
	
	Y <= D or E or F;
	D <= A and B;
	E <= A and C;
	F <= B and C;

end architecture;
