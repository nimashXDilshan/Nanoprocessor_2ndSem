----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 10:29:12 PM
-- Design Name: 
-- Module Name: TB_ProgramROM - Behavioral
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

entity TB_ProgramROM is
--  Port ( );
end TB_ProgramROM;

architecture Behavioral of TB_ProgramROM is
component  ProgramRom
Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;       

signal Address : STD_LOGIC_VECTOR(2 downto 0);
signal Instruction : STD_LOGIC_VECTOR(11 downto 0);


begin
UUT: ProgramRom port map(
Address=>Address,
Instruction =>Instruction);
process
begin
    Address <= "000";
    wait for 100 ns;
    Address <= "101";
    wait for 100 ns;
    Address <= "100";
    wait for 100 ns;
    Address <= "110";
   
    wait;    
    
end process;

end Behavioral;
