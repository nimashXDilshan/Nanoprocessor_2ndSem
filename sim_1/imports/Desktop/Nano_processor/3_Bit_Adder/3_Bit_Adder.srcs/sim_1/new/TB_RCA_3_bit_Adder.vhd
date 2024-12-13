----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2024 01:31:17 PM
-- Design Name: 
-- Module Name: TB_RCA_3_bit_Adder - Behavioral
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

entity TB_RCA_3_bit_Adder is
--  Port ( );
end TB_RCA_3_bit_Adder;

architecture Behavioral of TB_RCA_3_bit_Adder is
component RCA_3_bit_Adder is
    Port ( 
       A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       B0 : in STD_LOGIC:='1';
       B1 : in STD_LOGIC:='0';
       B2 : in STD_LOGIC:='0';
       C_in : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;
SIGNAL A0,A1,A2,C_in :std_logic;
SIGNAL S0,S1,S2,C_out:std_logic;
SIGNAL B0,B1,B2 : STD_LOGIC;
begin
UUT: RCA_3_bit_Adder PORT MAP(
    A0=>A0,
    A1=>A1,
    A2=>A2,
    B0=>B0,
    B1=>B1,
    B2=>B2,
    C_in=>C_in,
    S0 => S0,
    S1=>S1,
    S2=>S2,
    C_out => C_out
);
process
begin
A0 <= '0'; -- set initial values
A1 <= '0';
A2 <= '0';

WAIT FOR 100 ns; -- after 100 ns change inputs
A2 <= '1';

WAIT FOR 100 ns; --change again
A1 <= '1';

WAIT FOR 100 ns; --change again
A0 <= '1';
A1 <= '0';
A2 <= '1';

WAIT FOR 100 ns; --change again
A1 <= '1';

WAIT; -- will wait forever
end process;

end Behavioral;
