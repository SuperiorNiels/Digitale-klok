----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:56:03 10/20/2016 
-- Design Name: 
-- Module Name:    one_pulse - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_pulse is
    Port ( sysclk : in  STD_LOGIC;
           inp : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end one_pulse;


ARCHITECTURE behavioral of one_pulse is
	type state is (wait1,outp1,wait0);								-- wait1 : wacht op 1 op inp, wait0 : wacht op 0 op inp, outp1 : outp staat op 1
	signal present_state, next_state : state;
begin
	STATE_REG: process (sysclk)
	begin
		if rising_edge(sysclk) then present_state <= next_state; end if;
	end process;
	NXT_STATE: process (present_state, inp)		
	begin
		case present_state is
			when wait1 =>	if inp = '1' then 	next_state <= outp1;	else next_state <= wait1;	end if;
			when outp1 =>	next_state <= wait0;
			when wait0 =>	if inp = '0' then 	next_state <= wait1;	else next_state <= wait0;	end if;		
		end case;
	end process;
	OUTPUTS : process (sysclk,present_state) 		
	begin	
		if rising_edge(sysclk) then 								
			case present_state is
				when wait1 	=> outp <= '0';
				when outp1  =>	outp <= '1';
				when wait0  =>	outp <= '0';
			end case;
		end if;	
	end process;	
end Behavioral;	

