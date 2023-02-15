----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 04:21:45 PM
-- Design Name: 
-- Module Name: INS_DECODER - Behavioral
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

entity INS_DECODER is
    Port ( Clk : in STD_LOGIC;
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
end INS_DECODER;

architecture Behavioral of INS_DECODER is
component BUSES
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
       Data : out STD_LOGIC_VECTOR (3 downto 0);
       Fun : out STD_LOGIC_VECTOR (1 downto 0);
       Reg_1 : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_2 : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL Reg_EN_S1, Reg_S2 : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL DATA : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Load_Select_temp : STD_LOGIC_VECTOR (1 downto 0);
signal count : integer := 1;
signal Clk_status : STD_LOGIC := '0';


begin

BUSES_0 : BUSES
port map(
    I =>Instruction,
    DATA =>DATA,
    FUN => Load_Select_temp,
    Reg_1 => Reg_EN_S1,
    --Reg_1 => Reg_Enable,
    Reg_2 => Reg_S2 
    );
    
    
    
--    Load_Select <= Load_Select_temp;
Process (Load_Select_temp,Clk)
Begin
    if (rising_edge(Clk)) then
        if Load_Select_temp ="10" then  -- Load select is move
            Reg_Enable<= Reg_EN_S1;
            Imm_Value <= DATA;
            Reg_Select1 <= Reg_EN_S1;
            Reg_Select2 <= Reg_S2;
            JUMP <= '0';
            Load_Select <= Load_Select_temp;
         end if;
         
         if Load_Select_temp ="00" then   -- Load select is ADD
         ------------------
           -- Imm_Value <= "0011";
            Add_Enable <= '1';
            Reg_Select1 <= Reg_EN_S1;
            Reg_Enable <= Reg_EN_S1;
            Reg_Select2 <= Reg_S2;
            JUMP <= '0';
            Load_Select <= Load_Select_temp;
        end if;
        
        
        if Load_Select_temp ="01" then    --Load select is NEG
            Add_Enable <= '0'; 
            Reg_Select2 <= Reg_EN_S1 ;
            Reg_Select1 <= "000";
            --Reg_Select2 <= Reg_EN_S1 ;
            Reg_Enable <= Reg_EN_S1 ;
            JUMP <= '0';
            Load_Select <= Load_Select_temp;
            
        end if;
        
        if Load_Select_temp ="11" then    --Load select is JUMP
            Reg_Select1 <= Reg_EN_S1; 
--            Reg_Select2 <= Reg_S2;
            if  Reg_Check_Jump = "0000" then
                JUMP <= '1';   
                Address_Jump(0) <= DATA(0);
                Address_Jump(1) <= DATA(1);
                Address_Jump(2) <= DATA(2);
            else
                JUMP <= '0';
                Address_Jump(0) <= DATA(0);
                Address_Jump(1) <= DATA(1);
                Address_Jump(2) <= DATA(2);
            
            end if;
            Reg_Enable <= "101" ;
        end if;
    end if;
end process; 

end Behavioral;