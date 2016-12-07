--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:08:35 11/10/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/Documents/GitHub/Digitale-klok/source/klok (new)/SelectieCijfers_tb.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SelectieCijfers
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
 
ENTITY SelectieCijfers_tb IS
END SelectieCijfers_tb;
 
ARCHITECTURE behavior OF SelectieCijfers_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SelectieCijfers
    PORT(
         idig : IN  std_logic_vector(23 downto 0);
         istate : IN  std_logic_vector(3 downto 0);
         odig1 : OUT  std_logic_vector(3 downto 0);
         odig2 : OUT  std_logic_vector(7 downto 4);
         odig3 : OUT  std_logic_vector(11 downto 8);
         odig4 : OUT  std_logic_vector(15 downto 12)
        );
    END COMPONENT;
    

   --Inputs
   signal idig : std_logic_vector(23 downto 0) := (others => '0');
   signal istate : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal odig1 : std_logic_vector(3 downto 0);
   signal odig2 : std_logic_vector(7 downto 4);
   signal odig3 : std_logic_vector(11 downto 8);
   signal odig4 : std_logic_vector(15 downto 12);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SelectieCijfers PORT MAP (
			 idig => idig,
          istate => istate,
          odig1 => odig1,
          odig2 => odig2,
          odig3 => odig3,
          odig4 => odig4
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		idig <= "000100100101010100010111";
		istate <= "0001"; wait for 150 ns;
		istate <= "0010"; wait for 150 ns;
		istate <= "0100"; wait for 150 ns;
		istate <= "1000"; wait for 150 ns;

      wait;
   end process;

END;
