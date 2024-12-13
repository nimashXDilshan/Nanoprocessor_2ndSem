----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 04:22:28 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( Reset_button : in STD_LOGIC;
           EN:in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    component D_FF 
        port( 
            D : in std_logic;
            Res_D_FF : in std_logic;
            EN_D_FF :in std_logic;
            Clk : in std_logic;
            Q   : out std_logic;
            Qbar : out std_logic);
    end component;         
      
begin
    D_FF0 : D_FF
        port map(
            D => D(0),
            EN_D_FF =>EN,
            Res_D_FF => Reset_button,
            Clk => Clk,
            Q => Q(0));
            
    D_FF1 : D_FF
        port map(
            D => D(1),
            EN_D_FF =>EN,
            Res_D_FF => Reset_button,
            Clk => Clk,
            Q => Q(1));
            
    D_FF2 : D_FF
        port map(
            D => D(2),
            EN_D_FF =>EN,
            Res_D_FF => Reset_button,
            Clk => Clk,
            Q => Q(2));
            


end Behavioral;
