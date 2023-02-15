----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:20:59 PM
-- Design Name: 
-- Module Name: BUSES - Behavioral
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

entity BUSES is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           Data : out STD_LOGIC_VECTOR (3 downto 0);
           Fun : out STD_LOGIC_VECTOR (1 downto 0);
           Reg_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_2 : out STD_LOGIC_VECTOR (2 downto 0));
end BUSES;

architecture Behavioral of BUSES is

begin

    Fun(1) <= I(11);
    Fun(0) <= I(10);
    
    Reg_1(2) <= I(9);
    Reg_1(1) <= I(8);
    Reg_1(0) <= I(7);
    
    Reg_2(2) <= I(6);
    Reg_2(1) <= I(5);
    Reg_2(0) <= I(4);
    
    Data(3) <= I(3);
    Data(2) <= I(2);
    Data(1) <= I(1);
    Data(0) <= I(0);
    
end Behavioral;
