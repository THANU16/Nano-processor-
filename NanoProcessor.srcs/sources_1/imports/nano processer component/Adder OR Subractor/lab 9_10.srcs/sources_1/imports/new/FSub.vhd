----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 03:54:17 PM
-- Design Name: 
-- Module Name: FSub - Behavioral
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

entity FSub is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           B_in : in STD_LOGIC;
           D : out STD_LOGIC;
           B_out : out STD_LOGIC);
end FSub;

architecture Behavioral of FSub is

component HSub
    Port ( X : in STD_LOGIC;
       Y : in STD_LOGIC;
       D : out STD_LOGIC;
       B_out : out STD_LOGIC);
end component;

signal HSub0_D, HSub0_B, HSub1_D ,HSub1_B :STD_LOGIC;
begin

    HSub_0 : HSub
        PORT MAP(
            X => X,
            Y => Y,
            B_out => HSub0_B,   -- not x  and   y
            D => HSub0_D
        ); 
    
HSub_1 : HSub
    PORT MAP(
        X => HSub0_D,
        Y => B_in,
        B_out => HSub1_B,   --  not (x xor y)  and b_in
        D => HSub1_D
    ); 

B_out <= (Y AND B_in) OR (NOT(X) AND B_in)  OR  (NOT(X) and Y) ;    -- not x  and   y   or  not (x xor y)  and b_in
D <= HSub1_D;

end Behavioral;
