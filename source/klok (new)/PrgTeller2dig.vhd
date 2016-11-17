----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:07:52 10/20/2016 
-- Design Name: 
-- Module Name:    PrgTeller2dig - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PrgTeller2dig is	
    port ( 	cnten			:	in  std_logic;
				updwn			:	in  std_logic := '1';
				sysclk 		: 	in  std_logic;
				bcd_min		:	in std_logic_vector(7 downto 0);
				bcd_max		:	in std_logic_vector(7 downto 0);
				bcd_cnt		:	out std_logic_vector(7 downto 0);
				tc 			:	out std_logic);
end PrgTeller2dig;

architecture Behavioral of PrgTeller2dig is
-- declaratie interne signalen
	signal Ucnt 		: 	integer range 0 to 9;
	signal Tcnt 		: 	integer range 0 to 9;
	signal Umin			:	integer range 0 to 9;
	signal Tmin			:	integer range 0 to 9;
	signal Umax			:	integer range 0 to 9;
	signal Tmax			:	integer range 0 to 9;
BEGIN
-- omvormen ingegeven grenswaarde naar integer voor intern gebruik
		Umin <= to_integer(unsigned(bcd_min(3 downto 0))) ;	
		Tmin <= to_integer(unsigned(bcd_min(7 downto 4))) ;	
		Umax <= to_integer(unsigned(bcd_max(3 downto 0))) ;	
		Tmax <= to_integer(unsigned(bcd_max(7 downto 4))) ;
	CNT : process (sysclk)  
		begin		
			if rising_edge(sysclk) then
				if (Ucnt < Umin) then Ucnt <= Umin; -- Initiele waarde
				elsif (Tcnt < Tmin) then Tcnt <= Tmin; 
				end if;
				if	updwn = '1' and cnten = '1' then												-- OPTELLEN					
						if Tcnt = Tmax and  Ucnt = Umax then Tcnt <= Tmin;	  Ucnt <= Umin; 	
						elsif	Ucnt	= 9 then	Tcnt <= Tcnt + 1;Ucnt <= 0;
						else  Ucnt	<= Ucnt + 1;														
					end if;
				elsif updwn ='0' and cnten='1' then												-- AFTELLEN
						if (Tcnt = Tmin and  Ucnt = Umin) then Tcnt <= Tmax; Ucnt <= Umax;
						elsif Ucnt = 0 then Tcnt <= Tcnt - 1;Ucnt <= 9 ;	
						else 	Ucnt <= Ucnt - 1;					
					end if;
				end if;			
			end if;	
		end process;
	MCNT :process (Ucnt,Tcnt,updwn,cnten,Umax,Umin,Tmax,Tmin)
		begin
			if    (Ucnt = Umax and Tcnt = Tmax) and updwn = '1' and cnten = '1' then tc <= '1';
			elsif (Ucnt = Umin and Tcnt = Tmin) and updwn = '0' and cnten = '1' then tc <= '1';
			else 	tc <='0';
			end if;
	end process;
		bcd_cnt(3 downto 0) <= std_logic_vector(to_unsigned (Ucnt,4));
		bcd_cnt(7 downto 4) <= std_logic_vector(to_unsigned (Tcnt,4));
END Behavioral;