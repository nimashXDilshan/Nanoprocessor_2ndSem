----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 07:48:04 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction_input : in STD_LOGIC_VECTOR (11 downto 0);
           Register_check_for_jump : in STD_LOGIC_VECTOR (3 downto 0);
           Register_enable_output : out STD_LOGIC_VECTOR (2 downto 0);
           Load_select_output : out STD_LOGIC; -- load select is  0 choose store way else choose load immediate value  way
           Immediate_value_output : out STD_LOGIC_VECTOR (3 downto 0);
           Register_select_output_0 : out STD_LOGIC_VECTOR (2 downto 0);
           Register_select_output_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_select_output : out STD_LOGIC;
           Jump_flag : out STD_LOGIC; ---if jump flag is =0 : select normal sequence, else want  to jump
           Address_to_jump : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
begin

process (Instruction_input,Register_check_for_jump)begin

   if (Instruction_input(11 downto 10) = "00") then ---- ADD instruction
       Register_select_output_0 <=  Instruction_input(9 downto 7);
       Register_select_output_1 <=  Instruction_input(6 downto 4);
       Load_select_output <='0';--Instruction_input(11);
       Add_Sub_select_output <= '0';
       Jump_flag <='0';
       Register_enable_output <= Instruction_input(9 downto 7);
       Immediate_value_output <="ZZZZ";
       Address_to_jump <="ZZZ";
        
   elsif(Instruction_input(11 downto 10) = "01")  then ------ NEG instruction
       Register_enable_output <= Instruction_input(9 downto 7);
       Register_select_output_0 <=  Instruction_input(6 downto 4);
       Register_select_output_1 <=  Instruction_input(9 downto 7);
       Jump_flag <='0';
       Load_select_output <='0';
       Add_Sub_select_output <='1';
   Immediate_value_output <="ZZZZ";
   Address_to_jump <="ZZZ";
   
   elsif(Instruction_input(11 downto 10) = "10")  then ------ MOV instruction
       Register_enable_output <= Instruction_input(9 downto 7);
       Jump_flag <='0';
       Load_select_output <='1';--Instruction_input(11);
       Immediate_value_output <=Instruction_input(3 downto 0);
       Address_to_jump <="ZZZ";
       Add_Sub_select_output <='Z';
       Register_select_output_0 <="ZZZ";
       Register_select_output_1 <="ZZZ";
        
   elsif(Instruction_input(11 downto 10) = "11")  then ------ JZR instruction
       Register_select_output_0 <=  Instruction_input(9 downto 7);
       Register_select_output_1 <="ZZZ";
       Add_Sub_select_output <='Z';
       Load_select_output <='Z';
       Register_enable_output <="ZZZ";
       if (Register_check_for_jump="0000")then 
           Jump_flag <='1';
           Address_to_jump <= Instruction_input(2 downto 0);
       end if;    
   elsif (Instruction_input(11 downto 0) = "ZZZZZZZZ") then 
       Register_enable_output  <="ZZZ";
       Address_to_jump<="ZZZ"  ;
       Jump_flag<='Z';
        Register_select_output_1 <="ZZZ";
             Add_Sub_select_output <='Z';
             Load_select_output <='Z';
             Register_select_output_0<="ZZZ";
             Immediate_value_output <="ZZZZ";

   end if;
   
end process;

end Behavioral;

