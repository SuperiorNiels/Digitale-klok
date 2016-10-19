--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:39:33 03/31/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/OneDrive/Documenten/UA/Basis Elektronica/Digitale/Opdrachten/chronometer/selWeergave_tb.vhd
-- Project Name:  chronometer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: selWeergave
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
 
ENTITY selWeergave_tb IS
END selWeergave_tb;
 
ARCHITECTURE behavior OF selWeergave_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT selWeergave
    PORT(
         sel : IN  std_logic;
         digl : IN  std_logic_vector(23 downto 0);
         digO : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic := '0';
   signal digl : std_logic_vector(23 downto 0) := (others => '0');

 	--Outputs
   signal digO : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: selWeergave PORT MAP (
          sel => sel,
          digl => digl,
          digO => digO
        );
   -- Stimulus process
   stim_proc: process
   begin		
      digl <= "001101100000000000110000";
		sel <= '0';
		wait for 500 ns;	
		sel <= '1';
		wait;
   end process;

END;
