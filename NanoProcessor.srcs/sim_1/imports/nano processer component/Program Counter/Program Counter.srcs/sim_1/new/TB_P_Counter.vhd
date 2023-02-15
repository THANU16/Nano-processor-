----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:08:25 PM
-- Design Name: 
-- Module Name: TB_P_Counter - Behavioral
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

entity TB_P_Counter is
--  Port ( );
end TB_P_Counter;

architecture Behavioral of TB_P_Counter is

component P_Counter
    Port ( 
        D : in STD_LOGIC_VECTOR (2 downto 0);
        Reset : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal d,q : STD_LOGIC_VECTOR (2 downto 0);
signal reset,clk : STD_LOGIC := '0' ;

begin

UUT : P_Counter
    port map(
        D =>d,
        Reset => reset,
        Clk => clk,
        Q => q);
        
    process
    begin 
        Clk <= NOT(Clk);
        wait for 10ns;
    end process;
    
    process
    begin 
        D <= "000";
        wait for 100ns;  
        
        D <= "001";
        wait for 100ns;
        
        D <= "010";
        wait for 100ns;
        
        D <= "011";
        wait for 100ns;    
        
        D <= "100";
        Reset <= '1';
        wait for 100ns;
        
        D <= "101";
        Reset <= '0';
        wait for 100ns;  
        
        D <= "110";
        wait for 100ns;
        
        D <= "111";
        Reset <= '1';
        wait for 100ns;
        
        D <= "011";
        Reset <= '1';
        wait for 100ns;    
        
        D <= "100";
        Reset <= '0';
        wait for 100ns;
    end process;

end Behavioral;