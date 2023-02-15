----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:31:22 PM
-- Design Name: 
-- Module Name: TB_RegisteBank - Behavioral
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

entity TB_RegisteBank is
--  Port ( );
end TB_RegisteBank;

architecture Behavioral of TB_RegisteBank is
component RegisterBank
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

Signal Selector : STD_LOGIC_VECTOR (2 downto 0);
Signal Clk :  STD_LOGIC:='0';
Signal Reset :  STD_LOGIC;
Signal R0_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R1_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R2_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R3_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R4_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R5_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R6_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R7_in :  STD_LOGIC_VECTOR (3 downto 0);
Signal R0_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R1_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R2_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R3_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R4_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R5_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R6_out :  STD_LOGIC_VECTOR (3 downto 0);
Signal R7_out :  STD_LOGIC_VECTOR (3 downto 0);

begin
UUT:RegisterBank
    port map(
       Selector=>Selector,
       Clk => Clk,
       Reset => Reset,
       R0_in=>R0_in, 
       R1_in=>R1_in, 
       R2_in=>R2_in, 
       R3_in=>R3_in, 
       R4_in=>R4_in, 
       R5_in=>R5_in,
       R6_in=>R6_in, 
       R7_in=>R7_in, 
       R0_out=>R0_out, 
       R1_out=>R1_out, 
       R2_out=>R2_out,
       R3_out=>R3_out, 
       R4_out=>R4_out,
       R5_out=>R5_out, 
       R6_out=>R6_out, 
       R7_out=>R7_out
    );
process
  begin
      Clk<=NOT(Clk);
      Wait for 20ns;
end process;
      
process
    begin
--        R0_in<="1101";
       
        
       
        
--        R5_in<="1011";
--        R6_in<="1001";
--        R7_IN<="0001";
        
        Selector<="001";
         R1_in<="1111";
        wait for 100ns;
        
        Selector<="010";
        R2_IN<="0011";
        wait for 100ns;
        
        Selector<="011";
         R3_IN<="0010";
        wait for 100ns;
        
        Reset <='1';
        wait for 20ns;
        
        Reset <= '0';
        Selector<="100";
        R4_IN<="1000";
        wait for 100ns;
        
        Selector<="100";
        R4_IN<="1101";
        wait ;

end process;      

end Behavioral;
