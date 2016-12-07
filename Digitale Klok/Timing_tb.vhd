--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:49:58 10/19/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/Digitale-klok/DigitaleKlok/Timing_TB.vhd
-- Project Name:  DigitaleKlok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Timing
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
 
ENTITY Timing_TB IS
END Timing_TB;
 
ARCHITECTURE behavior OF Timing_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Timing
    PORT(
         sysclk : in  std_logic;
         pulse1 : out  std_logic;
         pulse2 : out  std_logic;
         pulse3 : out  std_logic;
         pulse4 : out  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal pulse1 : std_logic := '0';
   signal pulse2 : std_logic := '0';
   signal pulse3 : std_logic := '0';
   signal pulse4 : std_logic := '0';

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Timing PORT MAP (
          sysclk => sysclk,
          pulse1 => pulse1,
          pulse2 => pulse2,
          pulse3 => pulse3,
          pulse4 => pulse4
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
      wait for 100 ns;	

      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
