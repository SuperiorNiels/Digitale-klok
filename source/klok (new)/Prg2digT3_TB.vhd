--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
--
-- Create Date:   09:00:37 10/27/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/OneDrive/Documenten/Electronica/klok/klok/Prg2digT3_TB.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Prg2digT3
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
 
ENTITY Prg2digT3_TB IS
END Prg2digT3_TB;
 
ARCHITECTURE behavior OF Prg2digT3_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Prg2digT3
    Port ( min1,min2,min3 : in std_logic_vector(7 downto 0);
			  max1,max2,max3 : in std_logic_vector(7 downto 0);
			  sysclk : in  STD_LOGIC;
           cnten1 : in  STD_LOGIC;
			  cnten2 : in  STD_LOGIC;
			  cnten3 : in  STD_LOGIC;
           updwn1 : in  STD_LOGIC;
			  updwn2 : in  STD_LOGIC;
			  updwn3 : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (23 downto 0);
           tc1 : out  STD_LOGIC;
			  tc2 : out  STD_LOGIC;
			  tc3 : out  STD_LOGIC);
    END COMPONENT;
    

   --Inputs
	signal min1,min2,min3 : std_logic_vector(7 downto 0) := x"00";
   signal max1,max2,max3 : std_logic_vector(7 downto 0) := x"05";
   signal sysclk : std_logic := '0';
   signal cnten1 : std_logic := '0';
	signal cnten2 : std_logic := '0';
	signal cnten3 : std_logic := '0';
   signal updwn1 : std_logic := '0';
	signal updwn2 : std_logic := '0';
	signal updwn3 : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(23 downto 0);
   signal tc1 : std_logic;
	signal tc2 : std_logic;
	signal tc3 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Prg2digT3 PORT MAP (
          sysclk => sysclk,
          cnten1 => cnten1,
			 cnten2 => cnten2,
			 cnten3 => cnten3,
          updwn1 => updwn1,
			 updwn2 => updwn2,
			 updwn3 => updwn3,
          count => count,
			 min1 => min1,
			 min2 => min2,
			 min3 => min3,
			 max1 => max1,
			 max2 => max2,
			 max3 => max3,
          tc1 => tc1,
			 tc2 => tc2,
			 tc3 => tc3
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
      wait for 100 ns;	--start optellen
		cnten1 <= '1'; cnten2 <= '1'; cnten3 <= '1'; updwn1 <= '1'; updwn2 <= '1'; updwn3 <= '1';
		wait for 1000 ns; --start aftellen
		cnten1 <= '1'; cnten2 <= '1'; cnten3 <= '1'; updwn1 <= '0'; updwn2 <= '0'; updwn3 <= '0';
		wait for 1000 ns; -- reset 
		cnten1 <= '1'; cnten2 <= '1'; cnten3 <= '1'; updwn1 <= '1'; updwn2 <= '0'; updwn3 <= '0';
		wait for 1000 ns; -- terug optellen vanaf begin
		cnten1 <= '1'; cnten2 <= '1'; cnten3 <= '1'; updwn1 <= '1'; updwn2 <= '1'; updwn3 <= '1';
		wait for 1000 ns;
      wait;
   end process;

END;
