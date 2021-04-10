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
signal cp6: std_logic_vector(2 downto 0);
signal cp7, cp8: std_logic_vector(3 downto 0);
signal cp9, cp10, cp11: std_logic_vector(1 downto 0);
signal cp12: std_logic_vector(2 downto 0);
signal cp13: std_logic_vector(1 downto 0);
signal cp14, cp15, cp16: std_logic_vector(2 downto 0);
signal cp17: std_logic_vector(1 downto 0);
---------------------------------------------------------------------
signal v1: std_logic_vector(2 downto 0);
signal v2,v3,v4,v5,v6,v7: std_logic_vector(2 downto 0);
signal v8: std_logic_vector(3 downto 0);
signal v9: std_logic_vector(6 downto 0);
signal v10: std_logic_vector(1 downto 0);
signal v11: std_logic_vector(4 downto 0);
signal v12, v13: std_logic_vector(1 downto 0);
signal v14: std_logic_vector(2 downto 0);
signal v15, v16: std_logic_vector(1 downto 0);
signal v17, v18: std_logic_vector(4 downto 0);
signal v19, v20: std_logic_vector(1 downto 0);
signal v21, v22, v23, v24: std_logic_vector(2 downto 0);
signal v25,v26: std_logic_vector(1 downto 0);
signal v27: std_logic_vector(2 downto 0);
signal v28, v29, v30, v31, v32, v33: std_logic_vector( 1 downto 0);
signal v34: std_logic_vector(2 downto 0);
---------------------------------------------------------------------
signal A_sum, B_sum: std_logic_vector(6 downto 0);
signal S_sum: std_logic_vector(7 downto 0);

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

---- 1° Nível ----------------------------------------------------

v1 <= D(3) & D(3) & '1';

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

----- 2° Nível ----------------------------------------------------

v15 <= Cp0(1) & A(0);
v16 <= Cp0(0) & '1';
  
Comp6: comp_22 port map(v16,v15,Cp6);

v17 <= A(1) & Cp1(1) & Cp1(2) & Cp2(1) & Cp2(2);
v18 <= A(2) & Cp1(3) & Cp1(4) & Cp2(3) & Cp2(4);

Comp7: comp_55 port map(v17,v18,Cp7);

v19 <= Cp3(2) & Cp4(0);
v20 <= Cp3(1) & D(1);
v21 <= Cp1(5) & Cp2(5) & Cp3(0);

Comp8: comp_223 port map(v19,v20,v21,Cp8);

v22 <= Cp3(3) & Cp4(1) & Cp4(2);

Comp9: comp_3 port map(v22,Cp9);

----- 3° Nível ----------------------------------------------------

v23 <= Cp6(1) & Cp2(0) & Cp1(0);

Comp10: comp_3 port map(v23,Cp10);


v24 <= Cp8(1) & Cp7(3) & C(0);

Comp11: comp_3 port map(v24,Cp11);

v25 <= Cp9(1) & Cp4(3);
v26 <= Cp9(0) & Cp5(0);
  
Comp12: comp_22 port map(v26,v25,Cp12);

----- 4° Nível ----------------------------------------------------

v27 <= Cp10(1) & Cp6(2) & Cp7(0);

Comp13: comp_3 port map(v27,Cp13);

----- 5° Nível ----------------------------------------------------

v28 <= Cp7(2) & Cp8(0);
v29 <= Cp13(1) & Cp7(1);
  
Comp14: comp_22 port map(v29,v28,Cp14); --Corrigido(entrada v29 -> v28)

v30 <= Cp11(1) & Cp8(2);
v31 <= Cp12(0) & Cp5(0);
  
Comp15: comp_22 port map(v30,v31,Cp15);

v32 <= Cp12(1) & Cp5(1);
v33 <= Cp12(2) & Cp5(2);
  
Comp16: comp_22 port map(v32,v33,Cp16);

----- 6° Nível ----------------------------------------------------

v34 <= Cp16(2) & Cp5(3) & D(2);

Comp17: comp_3 port map(v34,Cp17);

---- Somador ------------------------------------------------------

A_sum <= Cp17(1) & Cp17(0) & Cp16(1) & Cp16(0) & Cp15(1) & Cp15(0) & Cp14(2);
B_sum <= D(3) & "00" & Cp15(2) & "00" & Cp11(0);

Sum0: adder_7bits port map(A_sum, B_sum,'0', S_sum);

---- Output -------------------------------------------------------

S <= S_sum & Cp14(1) & Cp14(0) & Cp13(0) & Cp10(0) & Cp6(0) & '0';

end architecture;