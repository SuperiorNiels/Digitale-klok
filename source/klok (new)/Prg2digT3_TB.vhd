--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
--
-- Create Date:   09:00:37 10/27/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/OneDrive/Documenten/Electronica/klok/klok/Prg2digT3_TB.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Prg2digT3
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
 
ENTITY Prg2digT3_TB IS
END Prg2digT3_TB;
 
ARCHITECTURE behavior OF Prg2digT3_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Prg2digT3
    PORT(
         sysclk : IN  std_logic;
         cnten : IN  std_logic;
         reset : IN  std_logic;
         updwn : IN  std_logic;
         count : OUT  std_logic_vector(23 downto 0);
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal cnten : std_logic := '0';
   signal reset : std_logic := '1';
   signal updwn : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(23 downto 0);
   signal tc : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Prg2digT3 PORT MAP (
          sysclk => sysclk,
          cnten => cnten,
          reset => reset,
          updwn => updwn,
          count => count,
          tc => tc
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	--start optellen
		reset <= '0'; cnten <= '1'; updwn <= '1';
		wait for 1000 ns; --start aftellen
		reset <= '0'; cnten <= '1'; updwn <= '0';
		wait for 1000 ns; -- reset 
		reset <= '1'; cnten <= '1'; updwn <= '1';
		wait for 1000 ns; -- terug optellen vanaf begin
		reset <= '0'; cnten <= '1'; updwn <= '1';
		wait for 1000 ns;
      wait;
   end process;

END;
