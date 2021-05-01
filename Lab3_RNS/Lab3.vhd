---------------------------------------------------------------------------------------------------
--
-- Title       : Contant Calculations using RNS
-- Author      : Bruno Cayres Messias
-- Company     : UFSC EEL
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entity
entity Lab3 is 
port( SW	: in STD_LOGIC_VECTOR(15 downto 0);
		C	: in std_LOGIC_VECTOR(1 downto 0); 
		LEDR : out STD_LOGIC_VECTOR(15 downto 0));
end entity;

--Architecture
architecture logic of Lab3 is

-- Signals
signal Bin_to_RNS : std_LOGIC_VECTOR(16 downto 0);
signal C1_mod_256, C2_mod_256, C3_mod_256, C4_mod_256 : std_LOGIC_VECTOR(7 downto 0);
signal C1_mod_15, C2_mod_15, C3_mod_15, C4_mod_15 : std_LOGIC_VECTOR(3 downto 0);
signal C1_mod_17, C2_mod_17, C3_mod_17, C4_mod_17 : std_LOGIC_VECTOR(4 downto 0);

----------- C2 Mod 15 ----------------------------------
signal cpa3_a, cpa3_b : std_LOGIC_VECTOR(2 downto 0);
signal cpa3_out : std_LOGIC_VECTOR(3 downto 0);
signal sum0_a, sum0_b : std_LOGIC_VECTOR(4 downto 0);
signal sum0_out : std_LOGIC_VECTOR(5 downto 0);

--------- C3 Mod 15 ------------------------------------
signal cpa2_a, cpa2_b : std_LOGIC_VECTOR(1 downto 0);
signal cpa2_out : std_LOGIC_VECTOR(2 downto 0);
signal sum1_a, sum1_b : std_LOGIC_VECTOR(5 downto 0);
signal sum1_out : std_LOGIC_VECTOR(6 downto 0);

--------- C4 mod 15 ------------------------------------
signal cpa1_a, cpa1_b : std_LOGIC_VECTOR(1 downto 0);
signal cpa1_out : std_LOGIC_VECTOR(2 downto 0);
signal fa_s, fa_cout : std_LOGIC;
signal sum2_a, sum2_b : std_LOGIC_VECTOR(4 downto 0);
signal sum2_out : std_LOGIC_VECTOR(5 downto 0);

--------- MUXs -----------------------------------------
signal mux_256_out : std_LOGIC_VECTOR(7 downto 0);
signal mux_15_out : std_LOGIC_VECTOR(3 downto 0);
signal mux_17_out : std_LOGIC_VECTOR(4 downto 0);

-------- OUTPUT ---------------------------------------
signal RNS_to_Bin : std_LOGIC_VECTOR(16 downto 0);


-- Components
component traditionalSystem_BinToRNS is
	generic (n : natural := 4);
	port(SW    : in STD_LOGIC_VECTOR(15 downto 0);
		  LEDR : out STD_LOGIC_VECTOR(16 downto 0));
end component;

component traditionalSystem_RNStoBin is
	generic (n : natural := 4);
	port(SW    : in STD_LOGIC_VECTOR(16 downto 0);
		  LEDR : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component mux is
generic (n : natural);
port (A: in std_logic_vector ((n-1) downto 0);
		B: in std_logic_vector ((n-1) downto 0);
		C: in std_logic_vector ((n-1) downto 0);
		D: in std_logic_vector ((n-1) downto 0);
		Sel: in std_logic_vector (1 downto 0);
		S: out std_logic_vector((n-1) downto 0));
end component;

component adder is
generic (n : natural);
port (A: in std_logic_vector((n-1) downto 0);
		B: in std_logic_vector((n-1) downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(n downto 0));
end component;

component fulladder is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic);
end component;

-- Logic 
begin

-------------- Bin To RNS ---------------------------------------
BinToRNS: traditionalSystem_BinToRNS port map(SW,Bin_to_RNS);
-----------------------------------------------------------------

--------------- Logic -------------------------------------------

-- C1 = 34817, C2 = 26113, C3 = 21761 e C4 = 13057

-- C1 mod 256 = 1; C1 mod 15 = 2;  C1 mod 17 = 1
-- C2 mod 256 = 1; C2 mod 15 = 13; C2 mod 17 = 1
-- C3 mod 256 = 1; C3 mod 15 = 11; C3 mod 17 = 1
-- C4 mod 256 = 1; C4 mod 15 = 7;  C4 mod 17 = 1

-- Mod 256
C1_mod_256 <= Bin_to_RNS(7 downto 0);
C2_mod_256 <= Bin_to_RNS(7 downto 0);
C3_mod_256 <= Bin_to_RNS(7 downto 0);
C4_mod_256 <= Bin_to_RNS(7 downto 0);

-- Mod 17
C1_mod_17 <= Bin_to_RNS(16 downto 12);
C2_mod_17 <= Bin_to_RNS(16 downto 12);
C3_mod_17 <= Bin_to_RNS(16 downto 12);
C4_mod_17 <= Bin_to_RNS(16 downto 12);

-- Mod 15
C1_mod_15 <= Bin_to_RNS(10 downto 8) & '0';

-------------------- C2_mod_15 ----------------------------------------------------------

-- 1° Nível:
cpa3_a <= Bin_to_RNS(11) & Bin_to_RNS(10) & Bin_to_RNS(11);
cpa3_b <= Bin_to_RNS(10) & Bin_to_RNS(9) & Bin_to_RNS(9);

CPA3: adder
generic map(n => 3)  
port map(cpa3_a, cpa3_b, Bin_to_RNS(8), cpa3_out);

-- 2° Nível:
sum0_a <= cpa3_out & Bin_to_RNS(10);
sum0_b <= Bin_to_RNS(11) & "000" & Bin_to_RNS(8);

Sum0: adder
generic map(n => 5)
port map(sum0_a, sum0_b, '0', sum0_out);

C2_mod_15 <= sum0_out(1 downto 0) & Bin_to_RNS(9 downto 8);

--------------------- C3_mod_15 ---------------------------------------------------------

-- 1° Nível 
cpa2_a <= Bin_to_RNS(11) & Bin_to_RNS(11);
cpa2_b <= Bin_to_RNS(9) & Bin_to_RNS(10);

CPA2: adder
generic map(n => 2)
port map(cpa2_a, cpa2_b, Bin_to_RNS(8), cpa2_out);

-- 2° Nível
sum1_a <= Bin_to_RNS(11) & cpa2_out & Bin_to_RNS(10 downto 9);
sum1_b <= '0' & Bin_to_RNS(10) & "00" & Bin_to_RNS(9 downto 8);

SUM1: adder
generic map(n => 6)
port map(sum1_a, sum1_b, '0', sum1_out);


C3_mod_15 <= sum1_out(2 downto 0) & Bin_to_RNS(8);

------------------- C4_mod_15 -----------------------------------------------------------

-- 1° Nível
cpa1_a <= Bin_to_RNS(11 downto 10);
cpa1_b <= Bin_to_RNS(10 downto 9);

CPA1: adder
generic map(n => 2)
port map(cpa1_a, cpa1_b, Bin_to_RNS(8), cpa1_out); 

-- 2° Nível
FA: fulladder port map(cpa1_out(2), Bin_to_RNS(11) , Bin_to_RNS(10), fa_s, fa_cout);

-- 3° Nível

Sum2_a <= fa_cout & fa_s & cpa1_out(1 downto 0) & Bin_to_RNS(9);
Sum2_b <= Bin_to_RNS(11) & '0' & Bin_to_RNS(9) & '0' & Bin_to_RNS(8);

SUM2: adder
generic map(n => 5)
port map(sum2_a, sum2_b, '0', sum2_out);

C4_mod_15 <= sum2_out(2 downto 0) & Bin_to_RNS(8);

---------------------- MUX --------------------------------------------------------------

MUX_256: mux
generic map(n => 8)
port map(C1_mod_256, C2_mod_256, C3_mod_256, C4_mod_256, C, mux_256_out);

MUX_15: mux
generic map(n => 4)
port map(C1_mod_15, C2_mod_15, C3_mod_15, C4_mod_15, C, mux_15_out);

MUX_17: mux
generic map(n => 5)
port map(C1_mod_17, C2_mod_17, C3_mod_17, C4_mod_17, C, mux_17_out);

-------------------- OUTPUT ------------------------------------------------------------

RNS_to_Bin <= mux_17_out & mux_15_out & mux_256_out;

------------- RNS To Bin ----------------------------------------
RNSToBin: traditionalSystem_RNStoBin port map(RNS_to_Bin, LEDR);
-----------------------------------------------------------------
end architecture;