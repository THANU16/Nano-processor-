----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:11:37 AM
-- Design Name: 
-- Module Name: TB_ADD_SUB - Behavioral
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

entity TB_ADD_SUB is
--  Port ( );
end TB_ADD_SUB;

architecture Behavioral of TB_ADD_SUB is

component ADD_SUB
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       ADD : in STD_LOGIC;
       C_B_in : in STD_LOGIC;
       S_D : out STD_LOGIC_VECTOR (3 downto 0);
       Zero : out STD_LOGIC;
       C_B_out : out STD_LOGIC);

end component;

signal A,B,S_D : STD_LOGIC_VECTOR (3 downto 0);
signal C_B_in,C_B_out, Zero: STD_LOGIC ;
signal ADD : STD_LOGIC ;

begin
    UUT : ADD_SUB
    PORT MAP(
        A => A,
        B => B,
        ADD => ADD,
        C_B_in => C_B_in,
        S_D => S_D,
        Zero => Zero,
        C_B_out => C_B_out);
        
        process 
        begin
        
        ADD <= '1';
        A <= "0000";
        B <= "0000";
        C_B_in <='0';
        wait for 80ns;
        
        ADD <= '0';
        A <= "0001";
        B <= "0001";
        C_B_in <='0';
        wait for 80ns;
        
        
            ADD <= '0';
           A <= "0000";
           B <= "0101";
           C_B_in <='0';
           wait for 80ns;
           
           
            ADD <= '1';
            A <= "0001";
            B <= "0000";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '0';            
            A <= "0011";
            B <= "1101";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '1';
            A <= "1101";
            B <= "0101";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '0';
            A <= "1101";
            B <= "0101";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '0';
            A <= "0101";
            B <= "1101";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '1';
            A <= "1001";
            B <= "0001";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '0';
            A <= "1001";
            B <= "0001";
            C_B_in <='0';
            wait for 80ns;
            
            ADD <= '1';          
            A <= "0000";
            B <= "0100";
            C_B_in <='0';
            ADD <= '1';
            wait ;
            
            
           
        end process;        


end Behavioral;
