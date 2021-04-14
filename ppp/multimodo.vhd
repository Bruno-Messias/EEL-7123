--Multimodo.vhd
--Author: bruno C. Messias
--Date: 16/02/21


library IEEE;
use IEEE.Std_Logic_1164.all;

entity multimodo is
port (
	SW: in std_logic_vector(15 downto 0);
	Sel: in std_logic_vector(1 downto 0);
	rst,en: in std_logic;
	LEDR: out std_logic_vector(15 downto 0)
	);
end entity;

architecture rtl of multimodo is
-- Signals
signal s,s_out_sum,shift_l_out,shift_r_out, mux_out: std_logic_vector(15 downto 0);
signal sum_out: std_logic_vector(16 downto 0);

-- Components
component mux41 is
port (A: in std_logic_vector (15 downto 0);
		B: in std_logic_vector (15 downto 0);
		C: in std_logic_vector (15 downto 0);
		D: in std_logic_vector (15 downto 0);
		s: in std_logic_vector(1 downto 0);
		F: out std_logic_vector (15 downto 0));
end component;

component adder_16bits is
port (A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(16 downto 0));
end component;

component shift_r is 
port (
	A: in std_logic_vector(15 downto 0);
	S: out std_logic_vector(15 downto 0)
);
end component;

component shift_l is 
port (
	A: in std_logic_vector(15 downto 0);
	S: out std_logic_vector(15 downto 0)
);
end component;

component registrador_en is 
port (
	CLK, RST, EN: in std_logic;
	D: in std_logic_vector(15 downto 0);
	Q: out std_logic_vector(15 downto 0));
end component;

-- Logic 
begin

Soma: adder_16bits port map(SW, S, '0', sum_out);

s_out_sum <= sum_out(15 downto 0);

SHR: shift_r port map (S,shift_r_out);
SHL: shift_l port map (S,shift_l_out);

MUX: mux41 port map (s_out_sum, SW, shift_r_out, shift_l_out, sel, mux_out);

REG: registrador_en port map(en,rst,'1',mux_out,s);

LEDR <= s;

end architecture;