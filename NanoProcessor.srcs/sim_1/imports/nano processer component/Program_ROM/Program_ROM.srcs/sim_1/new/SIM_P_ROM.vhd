----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 04:10:19 PM
-- Design Name: 
-- Module Name: SIM_P_ROM - Behavioral
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

entity SIM_P_ROM is
--  Port ( );
end SIM_P_ROM;

architecture Behavioral of SIM_P_ROM is
component Program_ROM
 Port ( PC : in STD_LOGIC_VECTOR (2 downto 0);
 Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;
signal address:STD_LOGIC_VECTOR (2 downto 0);
signal data: STD_LOGIC_VECTOR (11 downto 0);
begin
UUT : Program_ROM
port map(
PC => address,
Instruction => data
);
process
begin
address <= "001";
wait for 100ns;
address <= "010";
wait for 100ns;
address <= "111";
wait for 100ns;
address <= "010";
wait for 100ns;
address <= "100";
wait;
end process;


end Behavioral;
