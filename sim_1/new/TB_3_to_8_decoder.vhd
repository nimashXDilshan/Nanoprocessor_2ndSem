----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 09:15:46 PM
-- Design Name: 
-- Module Name: TB_3_to_8_decoder - Behavioral
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

entity TB_3_to_8_decoder is
--  Port ( );
end TB_3_to_8_decoder;

architecture Behavioral of TB_3_to_8_decoder is
COMPONENT Decoder_3_to_8
Port (
    I : IN std_logic_vector(2 downto 0);
    EN : in STD_LOGIC;
    Y : OUT std_logic_vector(7 downto 0)
    );
    
END COMPONENT;

SIGNAL I : std_logic_vector(2 downto 0);
SIGNAL EN : std_logic;
SIGNAL Y : std_logic_vector(7 downto 0);

begin

uut: Decoder_3_to_8 PORT MAP (
    I => I,
    EN => '1',
    Y => Y
    );
process
-----  index to binary (220382---  110 101 110 011  011 110)
    begin
    I <= "110";
    
    wait for 100 ns;
    I <= "011";
    
    wait for 100 ns;
    I <= "101";
    
    wait for 100 ns;
    I <= "110";
    
    wait for 100 ns;
    I <= "011";
    
    wait for 100 ns;
    I <= "101";
    
    wait;
    end process;
end Behavioral;
