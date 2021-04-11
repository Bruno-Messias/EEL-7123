library ieee;
use ieee.std_logic_1164.all;

entity registrador_en is port (
CLK, RST, EN: in std_logic;		
D: in std_logic_vector(15 downto 0);
Q: out std_logic_vector(15 downto 0)
);
end registrador_en;

architecture behv of registrador_en is 
begin

P1:process (CLK, RST, EN, D)
	begin
		if RST = '0' then
			 Q <= (others => '0' );
		elsif rising_edge(CLk) then
			if EN = '1' then
				 Q <= D;
			end if;
		end if;
	end process;
	
end behv;