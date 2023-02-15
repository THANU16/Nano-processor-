----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 05:29:26 PM
-- Design Name: 
-- Module Name: TTB_Ins_Decoder - Behavioral
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

entity TTB_Ins_Decoder is
--  Port ( );
end TTB_Ins_Decoder;

architecture Behavioral of TTB_Ins_Decoder is
component INS_DECODER
    Port (Clk : in STD_LOGIC; 
       Instruction : in STD_LOGIC_VECTOR (11 downto 0);
       Reg_Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
       Load_Select : out STD_LOGIC_VECTOR (1 downto 0);
       Imm_Value : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_Select1 : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_Select2 : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Enable : out STD_LOGIC;
       Jump : out STD_LOGIC;
       Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_Check_Jump : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Enable : STD_LOGIC_VECTOR (2 downto 0);
signal Load_Select : STD_LOGIC_VECTOR (1 downto 0);
signal Imm_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Select1 : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Select2 : STD_LOGIC_VECTOR (2 downto 0);
signal Add_Enable : STD_LOGIC;
signal Jump,Clk : STD_LOGIC;
signal Address_Jump : STD_LOGIC_VECTOR (2 downto 0);


begin
UUT : INS_DECODER
port map(
    Clk => Clk,
    Instruction =>Instruction,
    Reg_Check_Jump =>Reg_Check_Jump,
    Reg_Enable =>Reg_Enable,
    Load_Select =>Load_Select,
    Imm_Value =>Imm_Value,
    Reg_Select1 =>Reg_Select1,
    Reg_Select2 =>Reg_Select2,
    Add_Enable =>Add_Enable,
    Jump =>Jump,
    Address_Jump =>Address_Jump
    );
process
begin
    Clk <= '0';
    wait for 40ns;
    Clk <= '1';
    wait for 40ns;
end process;
    
process 
begin
    Instruction <= "100010000001";
    Reg_Check_Jump <="1111" ;
    wait for 80ns;
    
    Instruction <= "100100000010";
    Reg_Check_Jump <="0001" ;
    wait for 80ns;
    
    Instruction <= "101110000011";
    Reg_Check_Jump <="1111" ;
    wait for 80ns;
    
    Instruction <= "110110000111";
    Reg_Check_Jump <="0000" ;
    wait for 80ns;
    
    Instruction <= "011010000000";
    Reg_Check_Jump <="0000" ;
    wait;

end process;


end Behavioral;