----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 02:46:56 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity TB_RCA_4 is
--  Port ( );
end TB_RCA_4;

architecture Behavioral of TB_RCA_4 is
COMPONENT RCA_4
    PORT(A0,A1,A2,A3,B0,B1,B2,B3,C_In:IN STD_LOGIC;
         S0,S1,S2,S3,C_out,overflow,zero:OUT STD_LOGIC);
END COMPONENT;
SIGNAL A0,A1,A2,A3,B0,B1,B2,B3,C_in :std_logic;
SIGNAL S0,S1,S2,S3,C_out,overflow,zero:std_logic;

begin
UUT: RCA_4 PORT MAP(
    A0 => A0,
    A1=>A1,
    A2=>A2,
    A3=>A3,
    B0=>B0,
    B1=>B1,
    B2=>B2,
    B3=>B3,
    C_In=>C_in,
    S0 => S0,
    S1=>S1,
    S2=>S2,
    S3=>S3,
    C_out => C_out,
    overflow =>overflow,
    zero =>zero
);
process
begin
C_in <='1';
A0 <= '0'; -- set initial values
A1 <= '1';
A2 <= '0';
A3 <= '1';
B0 <= '1';
B1 <= '0';
B2 <= '0';
B3 <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
A0 <= '1'; -- set initial values
A1 <= '0';
A2 <= '0';
A3 <= '1';
B0 <= '1';
B1 <= '0';
B2 <= '0';
B3 <= '0';
WAIT FOR 100 ns; --change again
A0 <= '0'; -- set initial values
A1 <= '0';
A2 <= '0';
A3 <= '1';
B0 <= '1';
B1 <= '0';
B2 <= '0';
B3 <= '0';
WAIT FOR 100 ns; --change again
A0 <= '1'; -- set initial values
A1 <= '1';
A2 <= '1';
A3 <= '0';
B0 <= '1';
B1 <= '0';
B2 <= '0';
B3 <= '0';
WAIT FOR 100 ns; --change again
A0 <= '0'; -- set initial values
A1 <= '1';
A2 <= '1';
A3 <= '0';
B0 <= '1';
B1 <= '0';
B2 <= '0';
B3 <= '0';
WAIT; -- will wait forever
end process;

end Behavioral;
