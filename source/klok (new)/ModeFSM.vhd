----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:09 10/28/2016 
-- Design Name: 
-- Module Name:    ModeFSM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity ModeFSM is
    Port ( sysclk : in  STD_LOGIC;
			  en : out STD_LOGIC;
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
			  count : out  STD_LOGIC_VECTOR (23 downto 0);
			  ostate : out  STD_LOGIC_VECTOR (1 downto 0));
end ModeFSM;

architecture Behavioral of ModeFSM is
	--State Machine States:
	type state is(Tijdweergave,InstellenUU,InstellenMM,InstellenSS);
	signal present_state ,next_state : state;
begin
	STATE_REG : process (sysclk)
	begin
		if rising_edge(sysclk) then present_state <= next_state;
		end if;
	end process;
	
	NXT_STATE : process (present_state, mode)
	begin
		case present_state is
			when Tijdweergave => if mode = '1' then next_state <= InstellenUU; else next_state <= Tijdweergave; end if;
			when InstellenUU => if mode = '1' then next_state <= InstellenMM; else next_state <= InstellenUU; end if;	
			when InstellenMM => if mode = '1' then next_state <= InstellenSS; else next_state <= InstellenMM; end if;
			when InstellenSS => if mode = '1' then next_state <= Tijdweergave; else next_state <= InstellenSS; end if;
		end case;
	end process;
	
	OUTPUTS : process(sysclk,present_state)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when Tijdweergave => en <= '1'; ostate <= "00";
				when InstellenUU => en <= '0'; ostate <= "01";
					if incr = '1' then
						
					elsif decr = '1' then
						
					end if;
				when InstellenMM => en <= '0'; ostate <= "10";
					if incr = '1' then
						
					elsif decr = '1' then
						
					end if;
				when InstellenSS => en <= '0'; ostate <= "11";
					if incr = '1' then
					
					elsif decr = '1' then
						
					end if;
			end case;
		end if;
	end process;
end Behavioral;

