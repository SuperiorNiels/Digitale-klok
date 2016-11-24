--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:33:22 11/24/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/Documents/GitHub/Digitale-klok/source/klok (new)/WekkerModule_tb.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WekkerModule
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
 
ENTITY WekkerModule_tb IS
END WekkerModule_tb;
 
ARCHITECTURE behavior OF WekkerModule_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WekkerModule
    PORT(
         sysclk : IN  std_logic;
         mode : IN  std_logic;
         incr : IN  std_logic;
         decr : IN  std_logic;
         count : OUT  std_logic_vector(23 downto 0);
         ostate : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal mode : std_logic := '0';
   signal incr : std_logic := '0';
   signal decr : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(23 downto 0);
   signal ostate : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WekkerModule PORT MAP (
          sysclk => sysclk,
          mode => mode,
          incr => incr,
          decr => decr,
          count => count,
          ostate => ostate
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
		-- Instellen state 1
		mode <= '1'; wait for 10 ns;
		mode <= '0'; wait for 100 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 50 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		wait for 100 ns;
		-- Instellen state 2
		mode <= '1'; wait for 10 ns;
		mode <= '0'; wait for 100 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 50 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		wait for 100 ns;
		-- Instellen state 3
		mode <= '1'; wait for 10 ns;
		mode <= '0'; wait for 100 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 100 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		wait for 100 ns;
		-- Instellen state 4
		mode <= '1'; wait for 10 ns;
		mode <= '0'; wait for 100 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 100 ns;
		incr <= '1'; wait for 10 ns; incr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		decr <= '1'; wait for 10 ns; decr <= '0'; wait for 100 ns;
		wait for 100 ns;
		wait;
   end process;

END;
