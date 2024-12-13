----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 08:20:33 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
COMPONENT Instruction_Decoder
    Port(
       Instruction_input : in STD_LOGIC_VECTOR (11 downto 0);
       Register_check_for_jump : in STD_LOGIC_VECTOR (3 downto 0);
       Register_enable_output : out STD_LOGIC_VECTOR (2 downto 0);
       Load_select_output : out STD_LOGIC; -- load select is =0 choose store way else choose load immediate value  way
       Immediate_value_output : out STD_LOGIC_VECTOR (3 downto 0);
       Register_select_output_0 : out STD_LOGIC_VECTOR (2 downto 0);
       Register_select_output_1 : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub_select_output : out STD_LOGIC;
       Jump_flag : out STD_LOGIC; ---if jump flag is =0 : select normal sequence, else want  to jump
       Address_to_jump : out STD_LOGIC_VECTOR (2 downto 0));
    
END COMPONENT;
SIGNAL Register_enable_output,Register_select_output_0,Register_select_output_1,Address_to_jump : std_logic_vector(2 downto 0);
SIGNAL Jump_flag,Load_select_output,Add_Sub_select_output: std_logic;
SIGNAL Register_check_for_jump,Immediate_value_output: std_logic_vector( 3 downto 0);
SIGNAL Instruction_input : std_logic_vector(11 downto 0);

begin

uut: Instruction_Decoder PORT MAP (
Instruction_input =>Instruction_input,
Register_check_for_jump => Register_check_for_jump,
Register_enable_output => Register_enable_output,
Load_select_output => Load_select_output,
Immediate_value_output => Immediate_value_output,
Register_select_output_0 =>Register_select_output_0,
Register_select_output_1 => Register_select_output_1,
Add_Sub_select_output => Add_Sub_select_output,
Jump_flag  => Jump_flag,
Address_to_jump => Address_to_jump );
process
-----  index to binary (220382---  110 101 110 011  011 110)
    begin
    Instruction_input <=  "100010001010";
    Register_check_for_jump <= "0000";
    wait for 100 ns;
    Instruction_input <=  "100100000001";
    Register_check_for_jump <= "0000";

    
    wait for 100 ns;
    Instruction_input <=  "010100000000";
    Register_check_for_jump <= "0000";

    
    wait for 100 ns;
    Instruction_input <=  "000010100000";
    Register_check_for_jump <= "0000";
    
    wait for 100 ns;
    Instruction_input <=  "110010000111";
    Register_check_for_jump <= "0000";
    
    wait for 100 ns;
    Instruction_input <=  "110000000011";
    Register_check_for_jump <= "0001";
    
    wait for 100 ns;
    Instruction_input <=  "000000000000";
    Register_check_for_jump <= "0000";

    
    wait;
    end process;

end Behavioral;
