----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2024 11:38:29 PM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_4bit - Behavioral
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

entity TB_Mux_2_to_1_4bit is
--  Port ( );
end TB_Mux_2_to_1_4bit;

architecture Behavioral of TB_Mux_2_to_1_4bit is

COMPONENT Mux_2_to_1_4bit

PORT(  Load_Select,EN : IN std_logic;
Mux_2_to_1_4bit_in_0,Mux_2_to_1_4bit_in_1: IN std_logic_vector(3 downto 0);
Y: OUT std_logic_vector(3 downto 0));

END COMPONENT;


SIGNAL Load_Select,EN : std_logic;
SIGNAL Mux_2_to_1_4bit_in_0,Mux_2_to_1_4bit_in_1,Y : std_logic_vector(3 downto 0);

begin
UUT: Mux_2_to_1_4bit PORT MAP(
Load_Select =>Load_Select,
EN =>'1',
Mux_2_to_1_4bit_in_0 => Mux_2_to_1_4bit_in_0,
Mux_2_to_1_4bit_in_1 => Mux_2_to_1_4bit_in_1,
Y => Y
);

process
begin
Mux_2_to_1_4bit_in_0 <= "0111";
Mux_2_to_1_4bit_in_1 <= "0010";

Load_Select <= '0';
wait for 100 ns;
Load_Select <= '1';
wait for 100 ns;

Mux_2_to_1_4bit_in_0 <= "0101";
Mux_2_to_1_4bit_in_1 <= "1011";

Load_Select <= '0';
wait for 100 ns;
Load_Select <='1';
wait for 100 ns;

wait;
end process;
end Behavioral;
