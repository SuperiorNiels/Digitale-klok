--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:51:27 03/31/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/OneDrive/Documenten/UA/Basis Elektronica/Digitale/Opdrachten/chronometer/T6_tb.vhd
-- Project Name:  chronometer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: T6
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
 
ENTITY T6_tb IS
END T6_tb;
 
ARCHITECTURE behavior OF T6_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT T6
    PORT(
         sysclk : IN  std_logic;
         cnten : IN  std_logic;
         reset : IN  std_logic;
         count : OUT  std_logic_vector(23 downto 0);
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal cnten : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(23 downto 0);
   signal tc : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: T6 PORT MAP (
          sysclk => sysclk,
          cnten => cnten,
          reset => reset,
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
      cnten <= '0';
		wait for 100 ns;
		cnten <= '1';
      wait;
   end process;

END;
