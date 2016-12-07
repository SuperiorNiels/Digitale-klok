--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:30:54 03/22/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/OneDrive/Documenten/UA/Basis Elektronica/Digitale/Opdrachten/weergave7segm/control_tb.vhd
-- Project Name:  weergave7segm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control
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
 
ENTITY control_tb IS
END control_tb;
 
ARCHITECTURE behavior OF control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         dig0 : IN  std_logic_vector(3 downto 0);
         dig1 : IN  std_logic_vector(3 downto 0);
         dig2 : IN  std_logic_vector(3 downto 0);
         dig3 : IN  std_logic_vector(3 downto 0);
         en : IN  std_logic;
         sysclk : IN  std_logic;
         bcdout : OUT  std_logic_vector(3 downto 0);
         dignrout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dig0 : std_logic_vector(3 downto 0) := (others => '0');
   signal dig1 : std_logic_vector(3 downto 0) := (others => '0');
   signal dig2 : std_logic_vector(3 downto 0) := (others => '0');
   signal dig3 : std_logic_vector(3 downto 0) := (others => '0');
   signal en : std_logic := '0';
   signal sysclk : std_logic := '0';

 	--Outputs
   signal bcdout : std_logic_vector(3 downto 0);
   signal dignrout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          dig0 => dig0,
          dig1 => dig1,
          dig2 => dig2,
          dig3 => dig3,
          en => en,
          sysclk => sysclk,
          bcdout => bcdout,
          dignrout => dignrout
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
		dig0 <= "0011"; dig1 <= "1011"; dig2 <= "0111"; dig3<= "0001";
		en <= '1';
		wait for 5000 ns;
		en <= '0';
      wait;
   end process;

END;
