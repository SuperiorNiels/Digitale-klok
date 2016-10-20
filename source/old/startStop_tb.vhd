--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:19:45 03/31/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/OneDrive/Documenten/UA/Basis Elektronica/Digitale/Opdrachten/chronometer/startStop_tb.vhd
-- Project Name:  chronometer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: startStop
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
 
ENTITY startStop_tb IS
END startStop_tb;
 
ARCHITECTURE behavior OF startStop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT startStop
    PORT(
         start : IN  std_logic;
         stop : IN  std_logic;
         sigl : IN  std_logic;
         sysclk : IN  std_logic;
         sigO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal stop : std_logic := '0';
   signal sigl : std_logic := '0';
   signal sysclk : std_logic := '0';

 	--Outputs
   signal sigO : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: startStop PORT MAP (
          start => start,
          stop => stop,
          sigl => sigl,
          sysclk => sysclk,
          sigO => sigO
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
		start <= '0'; stop <= '0'; sigl <= '1';
		wait for 50 ns;
		start <= '1'; stop <= '0';
		wait for 50 ns;
		start <= '0'; stop <= '0';
		wait for 50 ns;
		start <= '0'; stop <= '1';
      wait;
   end process;

END;
