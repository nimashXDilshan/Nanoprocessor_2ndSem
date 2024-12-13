----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 04:43:07 PM
-- Design Name: 
-- Module Name: TB_MUX_8_to_1 - Behavioral
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

entity TB_MUX_8_to_1 is
--  Port ( );
end TB_MUX_8_to_1;

architecture Behavioral of TB_MUX_8_to_1 is
COMPONENT Mux_8_to_1
    Port ( S  : IN STD_LOGIC_VECTOR (2 downto 0);
           D0 : IN STD_LOGIC_VECTOR (3 downto 0);
           D1 : IN STD_LOGIC_VECTOR (3 downto 0);
           D2 : IN STD_LOGIC_VECTOR (3 downto 0);
           D3 : IN STD_LOGIC_VECTOR (3 downto 0);
           D4 : IN STD_LOGIC_VECTOR (3 downto 0);
           D5 : IN STD_LOGIC_VECTOR (3 downto 0);
           D6 : IN STD_LOGIC_VECTOR (3 downto 0);
           D7 : IN STD_LOGIC_VECTOR (3 downto 0);
           EN : IN STD_LOGIC;
           Y  : OUT STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;  

SIGNAL S : std_logic_vector(2 downto 0);
SIGNAL EN : std_logic;
SIGNAL D0,D1,D2,D3,D4,D5,D6,D7,Y : std_logic_vector(3 downto 0);
 --Outputs
 
begin
uut: Mux_8_to_1  PORT MAP (
S=>S,
D0=>D0,
D1=>D1,
D2=>D2,
D3=>D3,
D4=>D4,
D5=>D5,
D6=>D6,
D7=>D7,
EN=>EN,
Y=>Y 
 );
process
 begin
 
D0<= "1110";
D1<= "1100";
D2<= "0110";
D3<= "1000";
D4<= "1111";
D5<= "1011";
D6<= "0110";
D7<= "1110";

S<="110";

  
 wait for 100 ns;
 S<="011";

  
 wait for 100 ns;
 S<="101";

 
 wait for 100 ns;
 
 
S<="110";
 
  
 wait for 100 ns;
   
S<="011";
 
  
 wait for 100 ns;
   
S<="101";
 
  
 wait for 100 ns;
D0<= "1100";
 D1<= "0100";
 D2<= "0100";
 D3<= "1010";
 D4<= "1011";
 D5<= "1011";
 D6<= "0100";
 D7<= "0000";
S<="110";
 
   
  wait for 100 ns;
  S<="011";
 
   
  wait for 100 ns;
  S<="101";
 
  
  wait for 100 ns;
  
  
 S<="110";
  
   
  wait for 100 ns;
    
 S<="011";
  
   
  wait for 100 ns;
    
 S<="101";
  
   
 wait;
 
end process;
end Behavioral;