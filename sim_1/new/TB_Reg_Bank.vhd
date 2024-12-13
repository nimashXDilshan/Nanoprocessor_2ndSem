----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 05:35:07 PM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is
component Reg_Bank
Port (     Reg_enable : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_2_1_4bit_result : in STD_LOGIC_VECTOR (3 downto 0);
           Reset_button:in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reg_out0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out7 : out STD_LOGIC_VECTOR (3 downto 0));
           
end component;

component Slow_Clk
        port (
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC
            
        );
end component;

  signal Reg_enable : STD_LOGIC_VECTOR(2 downto 0);
  signal Mux_2_1_4bit_result :  STD_LOGIC_VECTOR (3 downto 0);
  signal Reset_button: STD_LOGIC:='0';
  signal Clk: STD_LOGIC:='0';
  signal Reg_out0,Reg_out1,Reg_out2,Reg_out3,Reg_out4,Reg_out5,Reg_out6,Reg_out7 : STD_LOGIC_VECTOR (3 downto 0);
  signal EN :  STD_LOGIC;

begin
UUT: Reg_Bank port map(

Reg_enable => Reg_enable, 
Mux_2_1_4bit_result =>Mux_2_1_4bit_result,
Reset_button => Reset_button,
Clk => Clk,
Reg_out0 => Reg_out0,
Reg_out1 => Reg_out1,
Reg_out2 => Reg_out2,
Reg_out3 => Reg_out3,
Reg_out4 => Reg_out4,
Reg_out5 => Reg_out5,
Reg_out6 => Reg_out6,
Reg_out7 => Reg_out7

);

process begin
    Clk <= NOT(Clk);
    wait for 3ns;
end process;


process
begin
    Mux_2_1_4bit_result <="1111";
    
    Reg_enable <="011";
    
    wait for 100 ns;
    Mux_2_1_4bit_result <="1101";

    Reg_enable <="101";
    
    wait for 100 ns;
    Mux_2_1_4bit_result <="1111";

    Reg_enable <="110";
    
    wait for 100 ns;
    Mux_2_1_4bit_result <="1011";

    Reg_enable <="000";
    
    
    wait for 100 ns;
    Mux_2_1_4bit_result <="1001";
    
    Reg_enable <="110";
    wait for 100 ns;
    Mux_2_1_4bit_result <="1111";
        
    Reg_enable <="001";
    wait;
   
    
    
    
end process;

end Behavioral;
