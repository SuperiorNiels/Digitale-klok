--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:25:03 11/24/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/source/klok (new)/sel_cijfer_tb.vhd
-- Project Name:  tellertest
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
 
ENTITY sel_cijfer_tb IS
END sel_cijfer_tb;
 
ARCHITECTURE behavior OF sel_cijfer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SelectieCijfers
    PORT(
         sysclk : IN  std_logic;
         idig : IN  std_logic_vector(23 downto 0);
         istate : IN  std_logic_vector(7 downto 0);
         odig1 : OUT  std_logic_vector(3 downto 0);
         odig2 : OUT  std_logic_vector(3 downto 0);
         odig3 : OUT  std_logic_vector(3 downto 0);
         odig4 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal idig : std_logic_vector(23 downto 0) := (others => '0');
   signal istate : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal odig1 : std_logic_vector(3 downto 0);
   signal odig2 : std_logic_vector(3 downto 0);
   signal odig3 : std_logic_vector(3 downto 0);
   signal odig4 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SelectieCijfers PORT MAP (
          sysclk => sysclk,
          idig => idig,
          istate => istate,
          odig1 => odig1,
          odig2 => odig2,
          odig3 => odig3,
          odig4 => odig4
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
		idig <= "001000011000010000100100";
		wait for 50 ns;
		istate <= "00000001";
		wait for 50 ns;
		istate <= "00000010";
		wait for 50 ns;
		istate <= "00000100";
		wait for 50 ns;
		istate <= "00001000";
		wait for 50 ns;
		idig <= "011100011001011010000110";
		istate <= "00010000";
		wait for 50 ns;
		istate <= "00100000";
		wait for 50 ns;
		istate <= "01000000";
		wait for 50 ns;
		istate <= "10000000";
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
