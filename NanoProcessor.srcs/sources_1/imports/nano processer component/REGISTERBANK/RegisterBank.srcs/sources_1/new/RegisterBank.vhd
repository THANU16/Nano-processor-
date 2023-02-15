----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:09:19 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
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
end RegisterBank;

architecture Behavioral of RegisterBank is
component Reg
    port(
        D : in STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component Decoder_3_to_8
    port(
        I : in STD_LOGIC_VECTOR (2 downto 0);
        Y : OUT STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
SIGNAL P : STD_LOGIC_VECTOR (7 downto 0);
begin
Decoder_3_to_8_0: Decoder_3_to_8
    port map(
        I=>Selector,
        y =>P
    );


Reg_0: Reg
    port map(
        D=>R0_in,
        En=>P(0),
        Reset => Reset,
        Clk=>Clk,
        Q=>R0_out
    );

Reg_1: Reg
    port map(
        D=>R1_in,
        En=>P(1),
        Reset => Reset,
        Clk=>Clk,
        Q=>R1_out
    );
    
Reg_2: Reg
    port map(
        D=>R2_in,
        En=>P(2),
        Reset => Reset,
        Clk=>Clk,
        Q=>R2_out
        );
  
Reg_3: Reg
    port map(
        D=>R3_in,
        En=>P(3),
        Reset => Reset,
        Clk=>Clk,
        Q=>R3_out
    );
            
Reg_4: Reg
    port map(
        D=>R4_in,
        En=>P(4),
        Reset => Reset,
        Clk=>Clk,
        Q=>R4_out
    );

Reg_5: Reg
    port map(
        D=>R5_in,
        En=>P(5),
        Reset => Reset,
        Clk=>Clk,
        Q=>R5_out
        );
  
Reg_6: Reg
    port map(
        D=>R6_in,
        En=>P(6),
        Reset => Reset,
        Clk=>Clk,
        Q=>R6_out
    );
            
Reg_7: Reg
    port map(
        D=>R7_in,
        En=>P(7),
        Reset => Reset,
        Clk=>Clk,
        Q=>R7_out
    );   
    

end Behavioral;
