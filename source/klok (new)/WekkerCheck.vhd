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
			  btnr : in STD_LOGIC;
			  pulse4 : in STD_LOGIC;
           digTijd : in  STD_LOGIC_VECTOR (23 downto 0);
           digWekker : in  STD_LOGIC_VECTOR (23 downto 0);
			  dis_1 : out STD_LOGIC;
			  dis_2: out STD_LOGIC;
			  led5 : out  STD_LOGIC;
           led6 : out  STD_LOGIC;
           led7 : out  STD_LOGIC);
end WekkerCheck;

architecture Behavioral of WekkerCheck is
type state is (wekker_off,wekker_on,ringing,snooze);
signal present_state : state;
signal next_state : state;

component deler
	Generic (div : integer := 10);
    Port ( sysclk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           en : in  STD_LOGIC;
           pulse : out  STD_LOGIC);
end component;

--Signalen

constant divDeler : integer := 10;
signal enDeler  : std_logic := '0';
signal snooze_pulse : std_logic := '0';
signal snooze_stop : std_logic := '0';
signal reset_deler : std_logic := '0';

begin
STATE_REG: process(sysclk)
	begin
		if rising_edge(sysclk) then
			present_state <= next_state;
		end if;
	end process;

NXT_STATE : process(present_state,btns,digTijd,digWekker)
	begin
		case present_state is
			when wekker_off => if btns = '1' then next_state <= wekker_on; 
									 else next_state <= wekker_off; 
									 end if;
			when wekker_on => if btns = '1' then next_state <= wekker_off; 
									elsif digTijd = digWekker then next_state <= ringing; 
									else next_state <= wekker_on; 
									end if;			
			when ringing => if btns = '1' then next_state <= wekker_on;
								 elsif btnr = '1' then next_state <= snooze; 
								 else next_state <= ringing; 
								 end if;
			when snooze => if btns = '1' then next_state <= wekker_on;
								elsif snooze_pulse = '1' then next_state <= ringing;
								else next_state <= snooze;
								end if;
		end case;
	end process;
	
OUTPUTS : process(sysclk)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when wekker_off => led6 <= '0'; led7 <= '0'; dis_1 <= '0'; enDeler <= '0'; dis_2 <= '0'; led5 <= '0'; reset_deler <= '1';
				when wekker_on => led6 <= '1'; led7 <= '0'; dis_1 <= '0'; enDeler <= '0'; dis_2 <= '0'; led5 <= '0'; reset_deler <= '1';
				when ringing => led6 <= '1'; led7 <= '1'; dis_1 <= '1'; enDeler <= '0'; dis_2 <= '0'; led5 <= '0'; reset_deler <= '0';
				when snooze => enDeler <= '1'; led6 <= '1'; led7 <= '0'; dis_1 <= '0'; dis_2 <= '1'; led5 <= '1'; reset_deler <= '0';
			end case;
		end if;
	end process;
	snooze_stop <= pulse4 and enDeler;
	SCLK : deler
	Generic map(div => divDeler)
	Port map(sysclk => sysclk,
				reset => reset_deler,
				en => snooze_stop,
				pulse => snooze_pulse);
end Behavioral;

