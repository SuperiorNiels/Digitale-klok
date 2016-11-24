--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:33:36 11/24/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/source/klok (new)/toon_functie_tb.vhd
-- Project Name:  tellertest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: toon_functie
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
 
ENTITY toon_functie_tb IS
END toon_functie_tb;
 
ARCHITECTURE behavior OF toon_functie_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT toon_functie
    PORT(
         sel : IN  std_logic;
         sysclk : IN  std_logic;
         idig1 : IN  std_logic_vector(23 downto 0);
         idig2 : IN  std_logic_vector(23 downto 0);
         idig3 : IN  std_logic_vector(23 downto 0);
         istate1 : IN  std_logic_vector(3 downto 0);
         istate2 : IN  std_logic_vector(3 downto 0);
         istate3 : IN  std_logic_vector(3 downto 0);
         odig : OUT  std_logic_vector(23 downto 0);
         ostate : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic := '0';
   signal sysclk : std_logic := '0';
   signal idig1 : std_logic_vector(23 downto 0) := (others => '0');
   signal idig2 : std_logic_vector(23 downto 0) := (others => '0');
   signal idig3 : std_logic_vector(23 downto 0) := (others => '0');
   signal istate1 : std_logic_vector(3 downto 0) := (others => '0');
   signal istate2 : std_logic_vector(3 downto 0) := (others => '0');
   signal istate3 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal odig : std_logic_vector(23 downto 0);
   signal ostate : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: toon_functie PORT MAP (
          sel => sel,
          sysclk => sysclk,
          idig1 => idig1,
          idig2 => idig2,
          idig3 => idig3,
          istate1 => istate1,
          istate2 => istate2,
          istate3 => istate3,
          odig => odig,
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
		idig1 <= "001101001000010110011000";
		idig2 <= "010001001110101011000110";
		idig3 <= "011101011110000010000011";
		istate1 <= "0001";
		wait for 50 ns;
		istate1 <= "0010";
		wait for 50 ns;
		istate1 <= "0100";
		wait for 50 ns;
		istate1 <= "1000";
		
		wait for 100 ns;
		sel <= '1';
		wait for 10 ns;
		sel <= '0';
		istate2 <= "0001";
		wait for 50 ns;
		istate2 <= "0010";
		wait for 50 ns;
		istate2 <= "0100";
		wait for 50 ns;
		istate2 <= "1000";
		
		
		wait for 100 ns;
		sel <= '1';
		wait for 10 ns;
		sel <= '0';
		istate3 <= "0001";
		wait for 50 ns;
		istate3 <= "0010";
		wait for 50 ns;
		istate3 <= "0100";
		wait for 50 ns;
		istate3 <= "1000";
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
