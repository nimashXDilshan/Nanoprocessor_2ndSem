----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 03:45:48 PM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity TB_D_FF is
--  Port ( );
end TB_D_FF;

architecture Behavioral of TB_D_FF is
component  D_FF
Port (     D : in STD_LOGIC;  
           Res_D_FF : in STD_LOGIC;  
           EN_D_FF:in STD_LOGIC;    
           Clk : in STD_LOGIC;   
           Q : out STD_LOGIC:='0';  
           Qbar : out STD_LOGIC);
end component;

SIGNAL D: std_logic;
SIGNAL Res_D_FF : std_logic:='0';
SIGNAL EN_D_FF : std_logic:='1';
SIGNAL Clk_slow : std_logic;
SIGNAL Q : std_logic;
SIGNAL Qbar : std_logic;

begin
UUT: D_FF PORT MAP(
D => D, 
Res_D_FF => Res_D_FF, 
Clk => Clk_slow,
Q => Q,
EN_D_FF => EN_D_FF
);
process
begin
    D <='1';
    Clk_slow <= '0';
    wait for 50 ns;
    Clk_slow <= '1';
    wait for 50 ns;
    Clk_slow <= '0';
    wait for 50 ns;
    D <='0';
    wait for 50 ns;
    Clk_slow <= '1';
    wait for 50 ns;
    Clk_slow <= '0';
    wait for 50 ns;
    D <='1';
    Clk_slow <= '0';
    wait for 50 ns;
    Clk_slow <= '1';
    wait for 50 ns;
    Clk_slow <= '0';
    wait for 50 ns;
    D <='0';
    Clk_slow <= '1';
    wait for 50 ns;
    Clk_slow <= '0';
    wait for 50 ns;
  
    wait;    
    
    
end process;


end Behavioral;
