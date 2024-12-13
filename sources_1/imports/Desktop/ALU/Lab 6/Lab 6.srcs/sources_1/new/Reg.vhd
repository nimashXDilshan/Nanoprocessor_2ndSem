----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 12:23:41 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Res_Reg : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

component D_FF
port (
D : in STD_LOGIC;
Res_D_FF: in STD_LOGIC;
EN_D_FF:in STD_LOGIC;
Clk : in STD_LOGIC;
Q : out STD_LOGIC;
Qbar : out STD_LOGIC);
end component;


begin

D_FF0 : D_FF
port map (
D => D(0),
Res_D_FF => Res_Reg,
EN_D_FF => EN,
Clk => Clk,
Q => Q(0));

D_FF1 : D_FF
port map (
D => D(1),
Res_D_FF => Res_Reg,
EN_D_FF => EN,
Clk => Clk,
Q => Q(1));

D_FF2 : D_FF
port map (
D => D(2),
Res_D_FF => Res_reg,
EN_D_FF => EN,
Clk => Clk,
Q => Q(2));

D_FF3 : D_FF
port map (
D => D(3),
Res_D_FF => Res_Reg,
EN_D_FF =>EN,
Clk => Clk,
Q => Q(3));


end Behavioral;
