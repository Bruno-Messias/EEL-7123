--vhdl_cap8.vhd
--Author: bruno C. Messias
--Date: 16/02/21


library IEEE;
use IEEE.Std_Logic_1164.all;

entity vhdl_cap8 is
port (A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		C: in std_logic_vector(3 downto 0);
		D:	in std_logic_vector(3 downto 0);
		S: out std_logic_vector(13 downto 0)
		);
end entity;

architecture rtl of vhdl_cap8 is
--Signals
signal cp0: std_logic_vector(1 downto 0);
signal cp1, cp2: std_logic_vector(5 downto 0);
signal cp3, cp4, cp5: std_logic_vector(3 downto 0);
-----------------------------------------------------------
signal v1: std_logic_vector(2 downto 0);
signal v2,v3,v4,v5,v6,v7: std_logic_vector(2 downto 0);
signal v8: std_logic_vector(3 downto 0);
signal v9: std_logic_vector(6 downto 0);
signal v10: std_logic_vector(1 downto 0);
signal v11: std_logic_vector(4 downto 0);
signal v12, v13: std_logic_vector(1 downto 0);
signal v14: std_logic_vector(2 downto 0);

--Components
component comp_223 is
  port(
    A:	in std_logic_vector(1 downto 0);
    B:	in std_logic_vector(1 downto 0);
	 C:	in std_logic_vector(2 downto 0);
    S:	out std_logic_vector(3 downto 0));
end component;

component comp_3 is
  port(
    A:in std_logic_vector(2 downto 0);
    S:out std_logic_vector(1 downto 0));
end component;

component comp_55 is
  port(
    A:in std_logic_vector(4 downto 0);
	 B:in std_logic_vector(4 downto 0);
    S:out std_logic_vector(3 downto 0));
end component;

component comp_22 is
  port(
    A:in std_logic_vector(1 downto 0);
	 B:in std_logic_vector(1 downto 0);
    S:out std_logic_vector(2 downto 0));
end component;

component comp_333 is
  port(
    A:in std_logic_vector(2 downto 0);
	 B:in std_logic_vector(2 downto 0);
	 C:in std_logic_vector(2 downto 0);
    S:out std_logic_vector(5 downto 0));
end component;

component comp_47 is
  port(
    A:in std_logic_vector(6 downto 0);
	 B:in std_logic_vector(3 downto 0);
    S:out std_logic_vector(3 downto 0));
end component;

component comp_25 is
  port(
    A:in std_logic_vector(1 downto 0);
	 B:in std_logic_vector(4 downto 0);
    S:out std_logic_vector(3 downto 0));
end component;

component adder_7bits is
port (A: in std_logic_vector(6 downto 0);
		B: in std_logic_vector(6 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(7 downto 0));
end component;

--Logic
begin 

-- 1° Nível

v1 <= '1' & D(3) & D(3);

Comp0: comp_3 port map (v1, Cp0); 

v2 <= B(2) & B(1) & C(2);
v3 <= B(1) & B(0) & C(1);
V4 <= B(0) & C(0) & D(0);

Comp1: comp_333 port map(v4,v3,v2,Cp1);

v5 <= D(2) & D(0) & D(0);
v6 <= D(1) & D(3) & D(3);
v7 <= D(3) & D(3) & D(3);

Comp2: comp_333 port map(v7,v6,v5,Cp2);

v8 <= A(1) & B(3) & B(1) & C(1);
v9 <= A(3) & A(0) & B(3) & B(2) & B(0) & C(3) & not(C(0));

Comp3: comp_47 port map(v9,v8,Cp3);

v10 <= C(1) & D(3);
v11 <= A(2) & B(2) & C(2) & C(0) & D(2);

Comp4: comp_25 port map(v10,v11,Cp4);

v12 <= C(3) & D(1);
v13 <= C(2) & D(0);
V14 <= A(3) & B(3) & C(3);

Comp5: comp_223 port map(v12,v13,v14,Cp5);

end architecture;