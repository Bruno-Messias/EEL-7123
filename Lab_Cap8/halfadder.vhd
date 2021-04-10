--Fulladder.vhd
--Author: Bruno C. Messias
--Date: 10/04/21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity halfadder is
  port(
    A: 		in std_logic;
    B: 		in std_logic;
    S: 		out std_logic;
    Cout: 	out std_logic
    );
end halfadder;
 
architecture rtl of halfadder is
begin
  S   <= A xor B;
  Cout <= A and B;
end architecture;