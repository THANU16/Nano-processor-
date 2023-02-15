----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:06:56 PM
-- Design Name: 
-- Module Name: TB_MUX_2W_3B - Behavioral
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

entity TB_MUX_2W_3B is
--  Port ( );
end TB_MUX_2W_3B;

architecture Behavioral of TB_MUX_2W_3B is
component MUX2Way3Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       F : out STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC);
end component;

signal A,B,F: std_logic_vector (2 downto 0);
signal EN : std_logic;
begin
    UUT: MUX2Way3Bit
    port map(
    A=> A,
    B=> B,
    F=> F,
    EN=> EN
    ); 
    
    process
    begin
    
        EN <= '0';
        wait for 40ns;
        EN <= '1';
        wait for 40ns;
    
    end process;
    
    process
    begin
        A<="001";
        B<="010";
        wait for 50ns;
        A<="100";
        B<="101";

        wait for 50ns;
    
    end process;

end Behavioral;