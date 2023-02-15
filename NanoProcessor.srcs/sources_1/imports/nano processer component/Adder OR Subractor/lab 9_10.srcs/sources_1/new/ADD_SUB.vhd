----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 10:41:03 AM
-- Design Name: 
-- Module Name: ADD_SUB - Behavioral
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

entity ADD_SUB is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           ADD : in STD_LOGIC;
           C_B_in : in STD_LOGIC :='0';
           S_D : out STD_LOGIC_VECTOR (3 downto 0);
 --          C_B_out : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end ADD_SUB;

architecture Behavioral of ADD_SUB is
component RCA
    Port ( 
        X : in STD_LOGIC_VECTOR (3 downto 0);
        Y : in STD_LOGIC_VECTOR (3 downto 0);
        C_in : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0);
        C_out : out STD_LOGIC);
end component;

component RCS
    Port ( 
        X : in STD_LOGIC_VECTOR (3 downto 0);
        Y : in STD_LOGIC_VECTOR (3 downto 0);
        B_in : in STD_LOGIC;
        D : out STD_LOGIC_VECTOR (3 downto 0);
        B_out : out STD_LOGIC);
end component;

SIGNAL  c_in, b_in, c_out, b_out: STD_LOGIC;
SIGNAL x_a, y_a, x_s, y_s,s, d, output: STD_LOGIC_VECTOR (3 downto 0);
 
begin



    RCA_0 : RCA 
    port map ( 
         X => A, 
         Y => B, 
         C_in => C_B_in,
         S => s, 
         C_out => c_out);
         
         
    RCS_0 : RCS 
    port map ( 
        X => A, 
        Y => B, 
        B_in => C_B_in,
        D => d, 
        B_out => b_out);
        
    output <= s when ADD = '1'  else d ;    
    S_D <= output ;
 --   C_B_out <= c_out when ADD = '1'  else b_out;
    Zero <= NOT(output(0)) AND NOT(output(1)) AND NOT(output(2)) AND NOT(output(3));
    Overflow <= (A(3) XNOR (NOT(ADD) XOR B(3))) AND (A(3) XOR output(3));

              
end Behavioral;
