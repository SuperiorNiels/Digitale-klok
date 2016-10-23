--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:09:22 10/23/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/OneDrive/Documenten/Electronica/klok/klok/PrgT6_TB.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PrgT6
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
 
ENTITY PrgT6_TB IS
END PrgT6_TB;
 
ARCHITECTURE behavior OF PrgT6_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PrgT6
    
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
	--Parameters
   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PrgT6 
	PORT MAP (
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
      wait for 100 ns;	
		reset <= '0'; cnten <= '1'; updwn <= '1';
      wait for 1000 ns;
		updwn <= '0';
		wait;

      -- insert stimulus here 

      wait;
   end process;

END;
