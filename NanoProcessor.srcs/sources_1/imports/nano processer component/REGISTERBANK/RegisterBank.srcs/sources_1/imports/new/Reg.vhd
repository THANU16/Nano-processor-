----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2022 01:49:13 AM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is
SIGNAL S:STD_LOGIC_VECTOR (3 downto 0):="0000";


begin
process(Clk,Reset)
begin

    if (Reset = '1') then
--        if(falling_edge(Clk)) then  --respond when clock rises
            Q <= "0000";
            S <= "0000";
--        end if;
    else
        if(falling_edge(Clk)) then  --respond when clock rises
            if En ='1' then      --enable should be set
                Q<=D;
                S<=D;
             ELSE 
                Q<=S;
             end if;
         end if;
    end if;
end process;


end Behavioral;
