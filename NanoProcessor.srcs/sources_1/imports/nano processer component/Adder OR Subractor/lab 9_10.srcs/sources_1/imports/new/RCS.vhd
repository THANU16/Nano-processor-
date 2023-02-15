----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 05:08:12 PM
-- Design Name: 
-- Module Name: RCS - Behavioral
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

entity RCS is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0);
           B_out : out STD_LOGIC);
end RCS;

architecture Behavioral of RCS is

component FSub
    Port ( X : in STD_LOGIC;
       Y : in STD_LOGIC;
       B_in : in STD_LOGIC;
       D : out STD_LOGIC;
       B_out : out STD_LOGIC);
end component;

SIGNAL FSub0_B, FSub1_B, FSub2_B : std_logic;


begin

FSub_0 : FSub 
    port map ( 
        X => X(0), 
        Y => Y(0), 
        B_in => B_in,
        D => D(0), 
        B_out => FSub0_B);

FSub_1 : FSub 
    port map ( 
        X => X(1), 
        Y => Y(1), 
        B_in => FSub0_B,
        D => D(1), 
        B_out => FSub1_B);

FSub_2 : FSub 
    port map ( 
        X => X(2), 
        Y => Y(2), 
        B_in => FSub1_B,
        D => D(2), 
        B_out => FSub2_B);

FSub_3 : FSub 
    port map ( 
        X => X(3), 
        Y => Y(3), 
        B_in => FSub2_B,
        D => D(3), 
        B_out => B_out);              
              
    


end Behavioral;
