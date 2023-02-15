----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:46:27 PM
-- Design Name: 
-- Module Name: TB_Nano - Behavioral
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

entity TB_Nano is
--  Port ( );
end TB_Nano;

architecture Behavioral of TB_Nano is
component NanoProcessor
    Port ( Clk : in STD_LOGIC;
--        Clk_1 : in STD_LOGIC;
       Reset : in STD_LOGIC;
       R7_Data : out STD_LOGIC_VECTOR (3 downto 0);
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;

signal Clk, Overflow, Zero :  STD_LOGIC := '0';
signal Reset : STD_LOGIC := '0';
signal R7_Data : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : NanoProcessor
port map(
    Clk => Clk,
--    Clk_1 =>  Clk_1,
    Reset => Reset,
    R7_Data =>R7_Data,
    Overflow => Overflow,
    Zero => Zero);
    
--process
--begin
--    Clk <= '0';
--    wait for 2ns;
--    Clk <= '1';
--    wait for 20ns;
    
--end process;

--process
--begin
--    Clk_1 <= '0';
--    wait for 4ns;
--    Clk_1 <= '1';
--    wait for 4ns;
    
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
--    Reset <= '1';
--    wait for 80ns;
----    Reset <= '0';
----    wait for 380ns  ; 
----    Reset <= '1';
----    wait for 80ns;
--    Reset <= '0';
--    wait;

    
    Reset <= '1';
    wait for 80ns;
    Reset <= '0';
    wait;   
end process;





end Behavioral;
