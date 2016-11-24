--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:29:59 11/24/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/source/klok (new)/blank_module_tb.vhd
-- Project Name:  tellertest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: blank_module
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
 
ENTITY blank_module_tb IS
END blank_module_tb;
 
ARCHITECTURE behavior OF blank_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT blank_module
    PORT(
         istate : IN  std_logic_vector(7 downto 0);
         sysclk : IN  std_logic;
         blank0 : OUT  std_logic;
         blank1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal istate : std_logic_vector(7 downto 0) := (others => '0');
   signal sysclk : std_logic := '0';

 	--Outputs
   signal blank0 : std_logic;
   signal blank1 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: blank_module PORT MAP (
          istate => istate,
          sysclk => sysclk,
          blank0 => blank0,
          blank1 => blank1
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
		istate <= "00000001";
		wait for 50 ns;
		istate <= "00000010";
		wait for 50 ns;
		istate <= "00000100";
		wait for 50 ns;
		istate <= "00001000";
		wait for 50 ns;
		istate <= "00010000";
		wait for 50 ns;
		istate <= "00100000";
		wait for 50 ns;
		istate <= "01000000";
		wait for 50 ns;
		istate <= "10000000";
		wait for 50 ns;
		
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
