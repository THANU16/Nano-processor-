----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:15:03 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use ieee.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( PC : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
type rom_type is array (0 to 7)of std_logic_vector (11 downto 0);
signal P_ROM : rom_type := (
    
    "100100000011", -- MOV R2,3
    "100110000001", -- MOV R3,1
    "010110000000", --NEG R3
    "110100000111", --JZR R2,7
    "001110100000", --ADD R7,R2  => 3,5,6
    "000100110000", --ADD R2,R3
    "110000000011", --JZR R0,3
    "110000000111" --JZR R0,7 
    );
begin
    Instruction <= P_ROM(to_integer(unsigned(PC)));
    

end Behavioral;
