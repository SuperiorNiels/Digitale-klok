--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:37:44 10/20/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/Digitale-klok/DigitaleKlok/PrgTeller2dig_TB.vhd
-- Project Name:  DigitaleKlok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PrgTeller2dig
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
 
ENTITY PrgTeller2dig_TB IS
END PrgTeller2dig_TB;
 
ARCHITECTURE behavior OF PrgTeller2dig_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PrgTeller2dig
    PORT(
         cnten : IN  std_logic;
         updwn : IN  std_logic;
         reset : IN  std_logic;
         sysclk : IN  std_logic;
         bcd_min : IN  std_logic_vector(7 downto 0);
         bcd_max : IN  std_logic_vector(7 downto 0);
         bcd_cnt : OUT  std_logic_vector(7 downto 0);
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal cnten : std_logic := '0';
   signal updwn : std_logic := '0';
   signal reset : std_logic := '0';
   signal sysclk : std_logic := '0';
   signal bcd_min : std_logic_vector(7 downto 0) := (others => '0');
   signal bcd_max : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal bcd_cnt : std_logic_vector(7 downto 0);
   signal tc : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PrgTeller2dig PORT MAP (
          cnten => cnten,
          updwn => updwn,
          reset => reset,
          sysclk => sysclk,
          bcd_min => bcd_min,
          bcd_max => bcd_max,
          bcd_cnt => bcd_cnt,
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
		cnten <= '0'; reset <= '1'; updwn <= '1'; wait for 10 ns;
		
		bcd_min <= x"01"; bcd_max <= x"23"; wait for 10 ns;
		cnten <= '1'; reset <= '0'; updwn <= '1'; wait for 200 ns;
		
		bcd_min <= x"01"; bcd_max <= x"72"; wait for 10 ns;
		cnten <= '1'; reset <= '0'; updwn <= '0'; wait for 200 ns;
		
		bcd_min <= x"01"; bcd_max <= x"99"; wait for 10 ns;
		cnten <= '1'; reset <= '0'; updwn <= '1'; wait for 200 ns;
      wait;
   end process;

END;
