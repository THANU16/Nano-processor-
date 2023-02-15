----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 08:35:33 PM
-- Design Name: 
-- Module Name: 2_way_4_bit_MUX - Behavioral
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

entity MUX2Way4Bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC_VECTOR (1 downto 0));
end MUX2Way4Bit;

architecture Behavioral of MUX2Way4Bit is
begin 

F <= A when (EN = "10") else B;
--process(EN)
--    begin
----    case EN is
----    when "10" => F <= A;   -- select A when move signal
----    when "00" => F <= B;   -- select B  when add signal
----    when "01" => F <= B;   -- select B when neg signal
----    when others => NULL;
----    end case;
    
--        if EN ="10" then
--            F <= A;
--        end if;
--        if EN = "00" then
--            F <= B;
--        end if;
--        if EN = "01" then
--            F <= B;
--        end if;
----        if EN = "11" then
----            F <= B;
----        end if;
--    end process;
    
end Behavioral;
