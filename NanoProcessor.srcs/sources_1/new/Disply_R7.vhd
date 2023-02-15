----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 12:49:24 AM
-- Design Name: 
-- Module Name: Disply_R7 - Behavioral
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

entity Disply_R7 is
    Port ( Clk : in STD_LOGIC;
--           Clk_1 : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR (3 downto 0):= "1110";
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Disply_R7;

architecture Behavioral of Disply_R7 is

component NanoProcessor 
    Port ( Clk : in STD_LOGIC;
--           Clk_1 : in STD_LOGIC;
           Reset : in STD_LOGIC;
           R7_Data : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;


component LUT_16_7 
    Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
           disply_data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal R7_Data1 : STD_LOGIC_VECTOR (3 downto 0);

begin

NanoProcessor_0 :NanoProcessor
    Port map( Clk => Clk,
--            Clk_1 => Clk_1,
           Reset => Reset,
           R7_Data => R7_Data1,
           Zero => Zero,
           Overflow => Overflow
           );
           
           
LUT_16_7_0 : LUT_16_7
    port map(
        Data => R7_Data1,
        disply_data => R7_7Seg
        );
        
R7_out <= R7_Data1;


end Behavioral;
