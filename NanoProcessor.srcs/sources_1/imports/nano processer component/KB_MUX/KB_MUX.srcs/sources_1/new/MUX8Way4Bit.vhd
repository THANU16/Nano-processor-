----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:17:57 PM
-- Design Name: 
-- Module Name: MUX8Way4Bit - Behavioral
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

entity MUX8Way4Bit is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           REG : in STD_LOGIC_VECTOR (2 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0));
end MUX8Way4Bit;

architecture Behavioral of MUX8Way4Bit is

begin

process (REG)
begin

    if (REG = "000") then
        F <= R0;
    end if;  
    if (REG = "001") then
        F <= R1;
    end if;
    if (REG = "010") then
        F <= R2;
    end if;
    if (REG = "011") then
        F <= R3;
    end if;
    if (REG = "100") then
        F <= R4;
    end if;
    if (REG = "101") then
        F <= R5;
    end if;
    if (REG = "110") then
        F <= R6;
    end if;
    if (REG = "111") then
        F <= R7;
    end if;
    
end process;
            
end Behavioral;
