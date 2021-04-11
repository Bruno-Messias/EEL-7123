--Shift_L
--Author: bruno C. Messias
--Date: 17/02/21

library IEEE;
use IEEE.Std_Logic_1164.all;

entity shift_l is 
port (
	A: in std_logic_vector(15 downto 0);
	S: out std_logic_vector(15 downto 0)
);
end entity;


architecture shift of shift_l is
begin

S <= A(14 downto 0) &'0';


end architecture;