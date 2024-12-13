----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 09:49:25 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is
component Nano_Processor 
  Port ( 
       Reset_Push_Button:in STD_LOGIC;
       Clk:in STD_LOGIC;
       LED_out : out STD_LOGIC_VECTOR (3 downto 0);
       LUT_out:out STD_LOGIC_VECTOR(6 downto 0);
       Zero_Flag : out STD_LOGIC:='0';
       Overflow_Flag : out STD_LOGIC:='0';
       --pc:out STD_LOGIC_VECTOR(2 downto 0);
       --Reg_1_out: out STD_LOGIC_VECTOR (3 downto 0);
       --Reg_2_out: out STD_LOGIC_VECTOR (3 downto 0);
       Anode:out STD_LOGIC_VECTOR(3 downto 0));
       
end component;

component Slow_Clk
        port (
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC
            
        );
end component;

signal Clk,Reset_Push_Button:STD_LOGIC:='0';
signal Zero_Flag,Overflow_Flag:STD_LOGIC:='0';
signal LED_out,Anode:STD_LOGIC_VECTOR( 3 downto 0);
--signal pc:STD_LOGIC_VECTOR( 2 downto 0);
signal LUT_out:STD_LOGIC_VECTOR(6 downto 0);

begin
UUT: Nano_Processor port map(
Reset_Push_Button=>Reset_Push_Button,
Clk =>Clk,
Anode =>Anode,
LED_out=>LED_out,
zero_Flag=>Zero_Flag,
Overflow_Flag =>Overflow_Flag,
--pc =>pc,
--Reg_1_out=>Reg_1_out,
--Reg_2_out=>Reg_2_out,
LUT_out=>LUT_out
);

process begin
    Clk <= NOT(Clk);
    wait for 2ns;
end process;

process begin
    Reset_Push_Button <='1';
    wait for 10ns;
    Reset_Push_Button <='0';
    wait;
    
end process;

end Behavioral;
