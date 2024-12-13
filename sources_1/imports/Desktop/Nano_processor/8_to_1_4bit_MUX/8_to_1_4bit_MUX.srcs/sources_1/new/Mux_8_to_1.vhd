----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2024 15:36:34
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
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
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

COMPONENT Decoder_3_to_8
    PORT(
    I : IN STD_LOGIC_VECTOR (2 downto 0);
    EN : IN STD_LOGIC;
    Y : OUT STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL Y_Y : STD_LOGIC_VECTOR (7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => S,
        EN => '1',
        Y => Y_Y);

    --Y <= ((D(0) AND Y0(0)) OR (D(1) AND Y0(1)) OR (D(2) AND Y0(2)) OR (D(3) AND Y0(3)) OR (D(4) AND Y0(4)) OR (D(5) AND Y0(5)) OR (D(6) AND Y0(6)) OR (D(7) AND Y0(7)));
    Y(0) <= ( D0(0) AND Y_Y(0)) OR ( D1(0) AND Y_Y(1)) OR ( D2(0) AND Y_Y(2)) OR (D3(0) AND Y_Y(3)) OR (D4(0) AND Y_Y(4)) OR (D5(0) AND Y_Y(5)) OR (D6(0) AND Y_Y(6)) OR (D7(0) AND Y_Y(7));
    Y(1) <= ( D0(1) AND Y_Y(0)) OR ( D1(1) AND Y_Y(1)) OR ( D2(1) AND Y_Y(2)) OR (D3(1) AND Y_Y(3)) OR (D4(1) AND Y_Y(4)) OR (D5(1) AND Y_Y(5)) OR (D6(1) AND Y_Y(6)) OR (D7(1) AND Y_Y(7));
    Y(2) <= ( D0(2) AND Y_Y(0)) OR ( D1(2) AND Y_Y(1)) OR ( D2(2) AND Y_Y(2)) OR (D3(2) AND Y_Y(3)) OR (D4(2) AND Y_Y(4)) OR (D5(2) AND Y_Y(5)) OR (D6(2) AND Y_Y(6)) OR (D7(2) AND Y_Y(7));
    Y(3) <= ( D0(3) AND Y_Y(0)) OR ( D1(3) AND Y_Y(1)) OR ( D2(3) AND Y_Y(2)) OR (D3(3) AND Y_Y(3)) OR (D4(3) AND Y_Y(4)) OR (D5(3) AND Y_Y(5)) OR (D6(3) AND Y_Y(6)) OR (D7(3) AND Y_Y(7));
  
end Behavioral;