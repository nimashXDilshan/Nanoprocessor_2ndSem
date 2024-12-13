----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 12:03:52 AM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_3bit - Behavioral
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

entity TB_Mux_2_to_1_3bit is
--  Port ( );
end TB_Mux_2_to_1_3bit;

architecture Behavioral of TB_Mux_2_to_1_3bit is

COMPONENT Mux_2_to_1_3bit

PORT(  S,EN : IN std_logic;
D0,D1 : IN std_logic_vector(2 downto 0);
Y: OUT std_logic_vector(2 downto 0));

END COMPONENT;


SIGNAL S,EN : std_logic;
SIGNAL D0,D1,Y : std_logic_vector(2 downto 0);

begin
UUT: Mux_2_to_1_3bit PORT MAP(
S =>S,
EN =>'1',
D0 => D0,
D1 => D1,
Y => Y
);

process
begin
D0 <= "011";
D1 <= "010";

S <= '0';
wait for 100 ns;
S <= '1';
wait for 100 ns;

D0 <= "101";
D1 <= "111";

S <= '0';
wait for 100 ns;
S <='1';
wait for 100 ns;

wait;
end process;
end Behavioral;
