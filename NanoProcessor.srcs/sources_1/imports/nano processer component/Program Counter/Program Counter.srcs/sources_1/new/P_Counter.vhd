----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:06:19 PM
-- Design Name: 
-- Module Name: P_Counter - Behavioral
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

entity P_Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0):="000");
end P_Counter;

architecture Behavioral of P_Counter is

begin
    
    process (Clk) begin
        if (rising_edge(Clk)) then -- respond when clock rises
        
            if Reset = '1' then   -- If register is reset PC valuse is 0
                Q <= "000" ;
--                Reset <= '0';
            else
                Q <= D;
            end if;
            
        end if;
    end process;


end Behavioral;
