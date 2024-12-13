----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2024 11:26:32 PM
-- Design Name: 
-- Module Name: Mux_2_to_1_4bit - Behavioral
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

entity Mux_2_to_1_4bit is
    Port ( Load_Select : in STD_LOGIC; --Load_Select=0 (D0/Instruction_immediate_value) ---Load_Select=1 (D1/Sum_Value)
           Mux_2_to_1_4bit_in_0 : in STD_LOGIC_VECTOR (3 downto 0);
           Mux_2_to_1_4bit_in_1 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_to_1_4bit;

architecture Behavioral of Mux_2_to_1_4bit is

begin
Y(0) <= (Mux_2_to_1_4bit_in_0(0) AND NOT(Load_Select)) OR (Mux_2_to_1_4bit_in_1(0) AND Load_Select);
Y(1) <= (Mux_2_to_1_4bit_in_0(1) AND NOT(Load_Select)) OR (Mux_2_to_1_4bit_in_1(1) AND Load_Select);
Y(2) <= (Mux_2_to_1_4bit_in_0(2) AND NOT(Load_Select)) OR (Mux_2_to_1_4bit_in_1(2) AND Load_Select);
Y(3) <= (Mux_2_to_1_4bit_in_0(3) AND NOT(Load_Select)) OR (Mux_2_to_1_4bit_in_1(3) AND Load_Select);

end Behavioral;
