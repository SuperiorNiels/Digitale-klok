--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:15:56 12/01/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/source/chrono/Functie_Select_tb.vhd
-- Project Name:  chrono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Functie_Select
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
 
ENTITY Functie_Select_tb IS
END Functie_Select_tb;
 
ARCHITECTURE behavior OF Functie_Select_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Functie_Select
    PORT(
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         in3 : IN  std_logic;
         in4 : IN  std_logic;
         in5 : IN  std_logic;
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         sysclk : IN  std_logic;
         klok_1 : OUT  std_logic;
         klok_2 : OUT  std_logic;
         klok_3 : OUT  std_logic;
         klok_4 : OUT  std_logic;
         klok_5 : OUT  std_logic;
         chrono_1 : OUT  std_logic;
         chrono_2 : OUT  std_logic;
         chrono_3 : OUT  std_logic;
         chrono_4 : OUT  std_logic;
         chrono_5 : OUT  std_logic;
         os2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal in3 : std_logic := '0';
   signal in4 : std_logic := '0';
   signal in5 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal s2 : std_logic := '0';
   signal sysclk : std_logic := '0';

 	--Outputs
   signal klok_1 : std_logic;
   signal klok_2 : std_logic;
   signal klok_3 : std_logic;
   signal klok_4 : std_logic;
   signal klok_5 : std_logic;
   signal chrono_1 : std_logic;
   signal chrono_2 : std_logic;
   signal chrono_3 : std_logic;
   signal chrono_4 : std_logic;
   signal chrono_5 : std_logic;
   signal os2 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Functie_Select PORT MAP (
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          s1 => s1,
          s2 => s2,
          sysclk => sysclk,
          klok_1 => klok_1,
          klok_2 => klok_2,
          klok_3 => klok_3,
          klok_4 => klok_4,
          klok_5 => klok_5,
          chrono_1 => chrono_1,
          chrono_2 => chrono_2,
          chrono_3 => chrono_3,
          chrono_4 => chrono_4,
          chrono_5 => chrono_5,
          os2 => os2
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
		in1 <= '1';
		in2 <= '1';
		in3 <= '1';
		in4 <= '1';
		in5 <= '1';
		s2 <= '1';
		wait for 500 ns;
		s1 <= '1';
		wait for 500 ns;
		s1 <= '0';
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
