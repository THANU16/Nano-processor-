----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2022 02:04:22 AM
-- Design Name: 
-- Module Name: RCA - Behavioral
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

entity RCA is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
       Y : in STD_LOGIC_VECTOR (3 downto 0);
       C_in : in STD_LOGIC:='0';
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_out : out STD_LOGIC);
end RCA;

architecture Behavioral of RCA is
component FA
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;
SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;
begin
    FA_0 : FA 
        port map ( 
             A => X(0), 
             B => Y(0), 
             C_in => C_in,
             S => S(0), 
             C_Out => FA0_C); 
    FA_1 : FA 
        port map ( 
             A => X(1), 
             B => Y(1), 
             C_in => FA0_C, 
             S => S(1), 
             C_Out => FA1_C); 
    FA_2 : FA 
        port map ( 
             A => X(2), 
             B => Y(2), 
             C_in => FA1_C, 
             S => S(2), 
             C_Out => FA2_C); 
    FA_3 : FA 
        port map ( 
             A => X(3), 
             B => Y(3), 
             C_in => FA2_C, 
             S => S(3), 
             C_Out => C_out);

   
end Behavioral;
