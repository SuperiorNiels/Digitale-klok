----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
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
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
			  oweergave : out STD_LOGIC;
			  cnten1 : out STD_LOGIC;
			  updwn1 : out STD_LOGIC;
			  cnten2 : out STD_LOGIC;
			  updwn2 : out STD_LOGIC;
			  cnten3 : out STD_LOGIC;
			  updwn3 : out STD_LOGIC;
			  ostate : out  STD_LOGIC_VECTOR (3 downto 0));
end ModeFSM;

architecture Behavioral of ModeFSM is
	--State Machine States:
	type state is(weergave,InstellenUU,InstellenMM,InstellenSS);
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
			when weergave => if mode = '1' then next_state <= InstellenUU; else next_state <= weergave; end if;
			when InstellenUU => if mode = '1' then next_state <= InstellenMM; else next_state <= InstellenUU; end if;	
			when InstellenMM => if mode = '1' then next_state <= InstellenSS; else next_state <= InstellenMM; end if;
			when InstellenSS => if mode = '1' then next_state <= weergave; else next_state <= InstellenSS; end if;
		end case;
	end process;
	
	OUTPUTS : process(sysclk,present_state)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when weergave => oweergave <= '1'; cnten1 <= '0'; updwn1 <= '1'; updwn2 <= '1'; updwn3 <= '1'; ostate <= "0001";
				when InstellenUU => ostate <= "0010";
					cnten1 <= '0'; cnten2 <= '0'; oweergave <= '0';
					if incr = '1' then
						updwn3 <= '1'; cnten3 <= '1';
					elsif decr = '1' then
						updwn3 <= '0'; cnten3 <= '1';
					else cnten3 <= '0';
					end if;
				when InstellenMM => ostate <= "0100";
					cnten1 <= '0'; cnten3 <= '0'; oweergave <= '0';
					if incr = '1' then
						updwn2 <= '1'; cnten2 <= '1';
					elsif decr = '1' then
						updwn2 <= '0'; cnten2 <= '1';
					else cnten2 <= '0';
					end if;
				when InstellenSS => ostate <= "1000";
					cnten2 <= '0'; cnten3 <= '0'; oweergave <= '0';
					if incr = '1' then
						updwn1 <= '1'; cnten1 <= '1';
					elsif decr = '1' then
						updwn1 <= '0'; cnten1 <= '1';
					else cnten1 <= '0';
					end if;
			end case;
		end if;
	end process;
end Behavioral;

