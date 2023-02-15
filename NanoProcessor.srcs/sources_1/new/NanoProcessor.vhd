----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 07:26:47 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
--           Clk_1 : in STD_LOGIC;
           Reset : in STD_LOGIC;
           R7_Data : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end NanoProcessor;

architecture Behavioral of NanoProcessor is

--component Slow_Clk 
--    Port ( Clk_in : in STD_LOGIC;
--           Clk_out : out STD_LOGIC);
--end component;

component Clk_P_Reg 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;



component Clk_Ins 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;



----P_Counter-------------------------------------------------------------------------
component P_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

----RCA_3-------------------------------------------------------------------------
component RCA_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       C_in : in STD_LOGIC;
       C_out : out STD_LOGIC;
       S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX2Way3Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       F : out STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC);
end component;

component Program_ROM 
    Port ( PC : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component INS_DECODER 
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
end component;

component MUX2Way4Bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC_VECTOR (1 downto 0));
end component;

component RegisterBank is
    Port ( Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           R0_in : in STD_LOGIC_VECTOR (3 downto 0);
           R1_in : in STD_LOGIC_VECTOR (3 downto 0);
           R2_in : in STD_LOGIC_VECTOR (3 downto 0);
           R3_in : in STD_LOGIC_VECTOR (3 downto 0);
           R4_in : in STD_LOGIC_VECTOR (3 downto 0);
           R5_in : in STD_LOGIC_VECTOR (3 downto 0);
           R6_in : in STD_LOGIC_VECTOR (3 downto 0);
           R7_in : in STD_LOGIC_VECTOR (3 downto 0);
           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;



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
           F : out STD_LOGIC_VECTOR (3 downto 0));
end component;



component ADD_SUB
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       ADD : in STD_LOGIC;
       C_B_in : in STD_LOGIC;
       S_D : out STD_LOGIC_VECTOR (3 downto 0);
       Zero : out STD_LOGIC;
       Overflow : out STD_LOGIC);    
end component;






signal Q,Address_Jump,Reg_Enable,Reg_Select1,Reg_Select2 : STD_LOGIC_VECTOR (2 downto 0);
signal S: STD_LOGIC_VECTOR (2 downto 0);
signal F : STD_LOGIC_VECTOR (2 downto 0);
signal C_out,JUMP,Add_Enable : STD_LOGIC;
signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Imm_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Load_Select : STD_LOGIC_VECTOR (1 downto 0);
signal S_D :  STD_LOGIC_VECTOR (3 downto 0);
signal Reg_in : STD_LOGIC_VECTOR (3 downto 0);
signal R0_out,R1_out,R2_out,R3_out,R4_out,R5_out,R6_out,R7_out,Mux_1_out,Mux_2_out : STD_LOGIC_VECTOR (3 downto 0);
signal Carry, Clk_PC_Reg,Clk_Ins_decoder : STD_LOGIC;





begin

--Slow_Clk_0 : Slow_Clk 
--    Port map( 
--        Clk_in => Clk,
--        Clk_out => Sub_Clk);

Clk_P_Reg_0 : Clk_P_Reg
port map(
    Clk_in => Clk,
--    Clk_in => Clk,
    Clk_out => Clk_PC_Reg);
    
    
Clk_Ins_0 : Clk_Ins
    port map(
        Clk_in => Clk,
--        Clk_in => Clk,
        Clk_out => Clk_Ins_decoder);


P_Counter_0 : P_Counter
port map (
    Reset => Reset,
    D =>F,
   Clk => Clk_PC_Reg,
--    Clk => Clk,
    Q => Q
);
RCA_3_0: RCA_3
port map (
    A => Q,
    B => "001",
    C_in => '0',
    C_out => C_out,
    S => S
);

MUX2Way3Bit_0 : MUX2Way3Bit
port map (
    A =>Address_Jump ,
    B => S,
    EN => JUMP,
    F => F 
);

Program_ROM_0 :Program_ROM
port map(
    PC => Q,
    Instruction => Instruction
);

INS_DECODER_0 : INS_DECODER
port map(
--    Clk => Clk_1,
    Clk => Clk_Ins_decoder,
--    Clk => Clk,
    Instruction  => Instruction,
    Reg_Check_Jump => Mux_1_out,
    Reg_Enable => Reg_Enable,
    Load_Select => Load_Select,
    Imm_Value => Imm_Value,
    Reg_Select1 => Reg_Select1,
    Reg_Select2 =>Reg_Select2,
    Add_Enable => Add_Enable,
    Jump => JUMP,
    Address_Jump => Address_Jump
    );
    
MUX2Way4Bit_0 : MUX2Way4Bit
port map(
    A => Imm_Value,
    B => S_D,
    F => Reg_in,
    EN => Load_Select
    );
    

RegisterBank_0 : RegisterBank
port map(
    Selector => Reg_Enable,
--    Clk => Clk,
    Clk => Clk_PC_Reg,
    Reset => Reset,
    R0_in => Reg_in,
    R1_in => Reg_in,
    R2_in => Reg_in,
    R3_in => Reg_in,
    R4_in => Reg_in,
    R5_in => Reg_in,
    R6_in => Reg_in,
    R7_in => Reg_in,
    R0_out=> R0_out,
    R1_out=> R1_out,
    R2_out=> R2_out,
    R3_out=> R3_out,
    R4_out=> R4_out,
    R5_out=> R5_out,
    R6_out=> R6_out,
    R7_out=> R7_out
    );
    


MUX8Way4Bit_A :MUX8Way4Bit
port map (
    R0 => R0_out,
    R1 => R1_out,
    R2 => R2_out,
    R3 => R3_out,
    R4 => R4_out,
    R5 => R5_out,
    R6 => R6_out,
    R7 => R7_out,
    REG => Reg_Select1,
    F => Mux_1_out
    );


MUX8Way4Bit_B :MUX8Way4Bit
port map (
    R0 => R0_out,
    R1 => R1_out,
    R2 => R2_out,
    R3 => R3_out,
    R4 => R4_out,
    R5 => R5_out,
    R6 => R6_out,
    R7 => R7_out,
    REG => Reg_Select2,
    F => Mux_2_out
    );
    
    

ADD_SUB_0 : ADD_SUB
port map (
    A => Mux_1_out, 
    B => Mux_2_out,
    ADD => Add_Enable,
    C_B_in  => '0',
    S_D => S_D,
    Overflow => Overflow,
    Zero => Zero
    );  
    
 R7_Data <=  R7_out;
    









end Behavioral;
