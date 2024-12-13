----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 04:31:09 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( Reg_enable : in STD_LOGIC_VECTOR (2 downto 0);
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
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg
Port (     D : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Res_Reg : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;    

component Decoder_3_to_8 port(
       I : in STD_LOGIC_VECTOR(2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;



signal decorder_out: STD_LOGIC_VECTOR (7 downto 0);
begin

Decoder_3_to_8_0: Decoder_3_to_8
port map (
     I => Reg_enable,
     EN =>'1',
     Y =>decorder_out 
);

Reg_0:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN => '0',
Clk => Clk,
Q => Reg_out0);

Reg_1:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN => decorder_out(1),
Clk => Clk,
Q => Reg_out1);

Reg_2:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN => decorder_out(2),
Clk => Clk,
Q => Reg_out2);

Reg_3:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN => decorder_out(3),
Clk => Clk,
Q => Reg_out3);

Reg_4:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN =>decorder_out(4),
Clk => Clk,
Q => Reg_out4);

Reg_5:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN =>decorder_out(5),
Clk => Clk,
Q => Reg_out5);

Reg_6:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN =>decorder_out(6),
Clk => Clk,
Q => Reg_out6);

Reg_7:Reg 
port map (
D => Mux_2_1_4bit_result,
Res_Reg => Reset_button,
EN => decorder_out(7),
Clk => Clk,
Q => Reg_out7);




end Behavioral;
