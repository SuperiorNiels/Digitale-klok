--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:02:11 03/31/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/OneDrive/Documenten/UA/Basis Elektronica/Digitale/Opdrachten/chronometer/lap_tb.vhd
-- Project Name:  chronometer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lap
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lap_tb IS
END lap_tb;
 
ARCHITECTURE behavior OF lap_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lap
    PORT(
         sysclk : IN  std_logic;
         d : IN  std_logic_vector(23 downto 0);
         lap_btn : IN  std_logic;
         cont_btn : IN  std_logic;
         q : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal d : std_logic_vector(23 downto 0) := (others => '0');
   signal lap_btn : std_logic := '0';
   signal cont_btn : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lap PORT MAP (
          sysclk => sysclk,
          d => d,
          lap_btn => lap_btn,
          cont_btn => cont_btn,
          q => q
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      lap_btn <= '0'; cont_btn <= '0'; d <= "000110000011100000000000";
		wait for 150 ns;
		lap_btn <= '1'; cont_btn <= '0';
		wait for 150 ns;
		lap_btn <= '0'; cont_btn <= '0';
		wait for 150 ns;
		lap_btn <= '0'; cont_btn <= '1';
      wait;
   end process;

END;
