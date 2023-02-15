----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 01:07:36 AM
-- Design Name: 
-- Module Name: TB_Disply_R7 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Disply_R7 is
--  Port ( );
end TB_Disply_R7;

architecture Behavioral of TB_Disply_R7 is

component Disply_R7 
    Port ( Clk : in STD_LOGIC;
--           Clk_1 : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR (3 downto 0):= "0111";
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end component;

signal Clk, Reset: STD_LOGIC;
signal Anode :  STD_LOGIC_VECTOR (3 downto 0):= "0111";
signal R7_out :  STD_LOGIC_VECTOR (3 downto 0);
signal R7_7Seg :  STD_LOGIC_VECTOR (6 downto 0);
signal Zero :  STD_LOGIC;
signal Overflow :  STD_LOGIC;



begin

UUT : Disply_R7 
    Port map( Clk => Clk,
--           Clk_1 => Clk_1,
           Reset => Reset,
           Anode => Anode,
           R7_out => R7_out,
           R7_7Seg => R7_7Seg,
           Zero => Zero,
           Overflow => Overflow);
           
           
           
--process
--begin
--   Clk <= '0';
--   wait for 20ns;
--   Clk <= '1';
--   wait for 20ns;
   
--end process;

--process
--begin
--   Clk_1 <= '0';
--   wait for 5ns;
--   Clk_1 <= '1';
--   wait for 5ns;
   
--end process;

process
begin
   Clk <= '0';
   wait for 2ns;
   Clk <= '1';
   wait for 2ns;
end process;

process
begin
  Reset <= '1';
    wait for 20ns;
    Reset <= '0';
   wait for 600ns;
    Reset <= '1';
    wait for 20ns;
    Reset <= '0';
--    wait for 600ns;   
end process;


end Behavioral;
