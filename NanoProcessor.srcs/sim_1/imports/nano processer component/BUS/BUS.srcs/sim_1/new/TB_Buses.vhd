----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:26:18 PM
-- Design Name: 
-- Module Name: TB_Buses - Behavioral
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

entity TB_Buses is
--  Port ( );
end TB_Buses;

architecture Behavioral of TB_Buses is
component BUSES
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
       Data : out STD_LOGIC_VECTOR (3 downto 0);
       Fun : out STD_LOGIC_VECTOR (1 downto 0);
       Reg_1 : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_2 : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I : STD_LOGIC_VECTOR (11 downto 0);
Signal Data : STD_LOGIC_VECTOR (3 downto 0);
Signal Fun : STD_LOGIC_VECTOR (1 downto 0);
Signal Reg_1 : STD_LOGIC_VECTOR (2 downto 0);
Signal Reg_2 : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : BUSES
    port map(
        I => I,
        Data => Data,
        Fun => Fun,
        Reg_1 => Reg_1,
        Reg_2 => Reg_2
    );
    
Process 
begin
    I <= "100010000001";
    wait for 100ns;
    
    I <= "100100000010";
    wait for 100ns;
        
    I <= "101110000011";
    wait for 100ns;
            
    I <= "001110010000";
    wait for 100ns;
    
    I <= "001110100000";
    wait for 100ns;
    
    I <= "010100000000";
    wait for 100ns;
    
    I <= "111000000111";
    wait for 100ns;
    
    I <= "111000000000";
    wait for 100ns;

            
    
end process;


end Behavioral;
