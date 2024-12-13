----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2024 04:04:12 PM
-- Design Name: 
-- Module Name: D_FF - Behavioral
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

entity D_FF is
    Port ( D : in STD_LOGIC;  
           Res_D_FF : in STD_LOGIC;  
           EN_D_FF:in STD_LOGIC;    
           Clk : in STD_LOGIC;   
           Q : out STD_LOGIC:='0';  
           Qbar : out STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is
begin
process (Clk) begin
   if (Res_D_FF ='1') then
    Q <='0';
     
   elsif (rising_edge(Clk)) then
        if(EN_D_FF = '1') then
           Q <= D;
       end if;
   end if;
end process;
 end Behavioral;
