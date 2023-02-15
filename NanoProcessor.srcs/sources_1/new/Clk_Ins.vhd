----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 12:10:37 PM
-- Design Name: 
-- Module Name: Clk_Ins - Behavioral
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

entity Clk_Ins is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Clk_Ins;

architecture Behavioral of Clk_Ins is
signal count : integer := 1;
signal Clk_status : STD_LOGIC := '1';

begin
    process (Clk_in) begin
        if (rising_edge (Clk_in)) then
            count <= count + 1;
--            if (count = 2) then
            if (count = 20000000) then
                Clk_status <= not Clk_status;
                Clk_out <= Clk_status;
                count <= 1;
            end if;
        end if;
    end process;
end Behavioral;
