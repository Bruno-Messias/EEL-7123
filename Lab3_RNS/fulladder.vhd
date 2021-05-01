-- Fulladder

library IEEE;
use IEEE.Std_Logic_1164.all;

--Entity
entity fulladder is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic);
end entity;


-- Architecture
architecture circuito_logico of fulladder is
--Signal
signal F1, F2, F3: std_logic;

begin

F1 <= A xor B;
F2 <= A and B;
S <= F1 xor Cin;
F3 <= F1 and Cin;
Cout <= F3 or F2;

end architecture;
