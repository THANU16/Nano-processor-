----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:53:43 PM
-- Design Name: 
-- Module Name: TB_MUX_8W_3B - Behavioral
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

entity TB_MUX_8W_3B is
--  Port ( );
end TB_MUX_8W_3B;

architecture Behavioral of TB_MUX_8W_3B is
component MUX8Way4Bit
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           REG : in STD_LOGIC_VECTOR (2 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0)
       );
end component;
signal R0,R1,R2,R3,R4,R5,R6,R7,F: std_logic_vector (3 downto 0);
signal REG : std_logic_vector (2 downto 0 );
begin
UUT : MUX8Way4Bit
port map(
R0=>R0,
R1=>R1,
R2=>R2,
R3=>R3,
R4=>R4,
R5=>R5,
R6=>R6,
R7=>R7,
REG=>REG,
F=>F
);

process
begin
R0<="0000";
R1<="0001";
R2<="0010";
R3<="0111";
R4<="1111";
R5<="1110";
R6<="1100";
R7<="0011";
wait;
end process;

process
begin
REG <= "000";
wait for 100ns;
REG <= "001";
wait for 100ns;
REG <= "010";
wait for 100ns;
REG <= "111";
wait ;

end process;
end Behavioral;
