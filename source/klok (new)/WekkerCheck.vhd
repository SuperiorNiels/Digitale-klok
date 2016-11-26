----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:02 11/26/2016 
-- Design Name: 
-- Module Name:    WekkerCheck - Behavioral 
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

entity WekkerCheck is
    Port ( sysclk : in STD_LOGIC;
			  btns : in  STD_LOGIC;
           digTijd : in  STD_LOGIC_VECTOR (23 downto 0);
           digWekker : in  STD_LOGIC_VECTOR (23 downto 0);
           led6 : out  STD_LOGIC;
           led7 : out  STD_LOGIC);
end WekkerCheck;

architecture Behavioral of WekkerCheck is
type state is (wekker_on,wekker_off,ringing);
signal present_state : state;
signal next_state : state;
begin
STATE_REG: process(sysclk)
	begin
		if rising_edge(sysclk) then
			present_state <= next_state;
		end if;
	end process;

NXT_STATE : process(present_state,btns)
	begin
	 case present_state is
			when wekker_on => if btns <= '1' then next_state <= wekker_off; else next_state <= wekker_on; end if;
			when wekker_off => if btns <= '1' then next_state <= wekker_on; else next_state <= wekker_off; end if;
			when ringing => if btns <= '1' then next_state <= wekker_on; else next_state <= ringing; end if;
	 end case;
	end process;
	
OUTPUTS : process(sysclk)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when wekker_on => led6 <= '1'; led7 <= '0';
				when wekker_off => led6 <= '0'; led7 <= '0';
				when ringing => led6 <= '1'; led7 <= '1';
			end case;
		end if;
	end process;
end Behavioral;

