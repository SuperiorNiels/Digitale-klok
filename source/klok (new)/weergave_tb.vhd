--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:17:34 11/23/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/Desktop/Test/tellertest/weergave_tb.vhd
-- Project Name:  tellertest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: weergave4dig7segm
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
 
ENTITY weergave_tb IS
END weergave_tb;
 
ARCHITECTURE behavior OF weergave_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT weergave4dig7segm
    PORT(
         dig0 : IN  std_logic_vector(3 downto 0);
         dig1 : IN  std_logic_vector(3 downto 0);
         dig2 : IN  std_logic_vector(3 downto 0);
         dig3 : IN  std_logic_vector(3 downto 0);
         sysclk : IN  std_logic;
         en : IN  std_logic;
         cath : OUT  std_logic_vector(6 downto 0);
         an : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dig0 : std_logic_vector(3 downto 0) := (others => '0');
   signal dig1 : std_logic_vector(3 downto 0) := (others => '0');
   signal dig2 : std_logic_vector(3 downto 0) := (others => '0');
   signal dig3 : std_logic_vector(3 downto 0) := (others => '0');
   signal sysclk : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal cath : std_logic_vector(6 downto 0);
   signal an : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: weergave4dig7segm PORT MAP (
          dig0 => dig0,
          dig1 => dig1,
          dig2 => dig2,
          dig3 => dig3,
          sysclk => sysclk,
          en => en,
          cath => cath,
          an => an
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
		en <= '1';
		dig0 <= "0010";
		dig1 <= "1010";
		dig2 <= "0101";
		dig3 <= "0011";
		wait for 150 ns;
		dig3 <= "1010";
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
