----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 10:37:03 PM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
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

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is
component ProgramCounter
    port (
        D : in STD_LOGIC_VECTOR(2 downto 0);
        EN : in STD_LOGIC;
        Reset_button : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(2 downto 0)
    );
end component;

component Slow_Clk
    port (
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end component;

signal D : STD_LOGIC_VECTOR(2 downto 0);
signal EN : STD_LOGIC:='1';
signal Reset_button : STD_LOGIC := '0'; -- Ensure initial value is set
signal Clk : STD_LOGIC:='0';
signal Q : STD_LOGIC_VECTOR(2 downto 0);

begin
UUT:ProgramCounter  PORT MAP(
D => D, 
Reset_button => Reset_button, 
Clk => Clk,
Q => Q,
EN => EN
);

process begin
Clk <= NOT(Clk);
wait for 2ns;
end process;
process

begin
D <= "011";
wait for 100 ns;
D <= "111";
wait for 100 ns;
D <= "010";
wait for 100 ns;
D <= "001";




end process;

end Behavioral;
