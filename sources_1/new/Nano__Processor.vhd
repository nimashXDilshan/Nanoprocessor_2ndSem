----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 07:27:14 PM
-- Design Name: 
-- Module Name: Nano__Processor - Behavioral
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

entity Nano_Processor is
    Port ( Reset_Push_Button:in STD_LOGIC;
           Clk:in STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           LUT_out:out STD_LOGIC_VECTOR(6 downto 0);
           Zero_Flag : out STD_LOGIC;
           Anode:out STD_LOGIC_VECTOR(3 downto 0);
           --pc:out STD_LOGIC_VECTOR(2 downto 0);
          -- Reg_1_out: out STD_LOGIC_VECTOR (3 downto 0);
          -- Reg_2_out: out STD_LOGIC_VECTOR (3 downto 0);
           Overflow_Flag : out STD_LOGIC);
                  
           
          
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Reg_Bank 
    Port ( 
       Reg_enable : in STD_LOGIC_VECTOR (2 downto 0);
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

component Mux_8_to_1
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
end component;

component ADD_SUB_unit
    Port ( 
       INPUT_0: in STD_LOGIC_VECTOR (3 downto 0);
       INPUT_1: in STD_LOGIC_VECTOR (3 downto 0);
       AddSub_Select : in STD_LOGIC;
       OUTPUT:out STD_LOGIC_VECTOR(3 downto 0);
       Zero : out STD_LOGIC;
       OverFlow : out STD_LOGIC);
end component;

component Slow_Clk
port (
Clk_in : in STD_LOGIC;
Clk_out: out STD_LOGIC);
end component;

component Mux_2_to_1_4bit
Port ( Load_Select : in STD_LOGIC; --Load_Select=0 (D0/stored_value(unit_result)) ---Load_Select=1 (D1/immediate_value)
       Mux_2_to_1_4bit_in_0 : in STD_LOGIC_VECTOR (3 downto 0);
       Mux_2_to_1_4bit_in_1 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;



component Instruction_Decoder
Port ( Instruction_input : in STD_LOGIC_VECTOR (11 downto 0);
       Register_check_for_jump : in STD_LOGIC_VECTOR (3 downto 0);
       Register_enable_output : out STD_LOGIC_VECTOR(2 downto  0); -- load select is  0 choose store way else choose load immediate value  way
       Immediate_value_output : out STD_LOGIC_VECTOR (3 downto 0);
       Load_select_output : out STD_LOGIC;
       Register_select_output_0 : out STD_LOGIC_VECTOR (2 downto 0);
       Register_select_output_1 : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub_select_output : out STD_LOGIC;
       Jump_flag : out STD_LOGIC; ---if jump flag is =0 : select normal sequence, else want  to jump
       Address_to_jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ProgramRom 
 Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
        Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;


component ProgramCounter
Port ( Reset_button : in STD_LOGIC;
       EN:in STD_LOGIC;
       D : in STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component  Mux_2_to_1_3bit
Port ( S : in STD_LOGIC;
       D0 : in STD_LOGIC_VECTOR (2 downto 0);
       D1 : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (2 downto 0));
 end component;  
 
 
component RCA_3_bit_Adder
Port ( 
   A0 : in STD_LOGIC;
   A1 : in STD_LOGIC;
   A2 : in STD_LOGIC;
   B0 : in STD_LOGIC;
   B1 : in STD_LOGIC;
   B2 : in STD_LOGIC;
   C_in : in STD_LOGIC;
   S0 : out STD_LOGIC;
   S1 : out STD_LOGIC;
   S2 : out STD_LOGIC;
   C_out : out STD_LOGIC);
end component;    



signal Clk_slow,select_operation,load_select,jump_or_not:STD_LOGIC;
signal Instruction_Bus_Input:STD_LOGIC_VECTOR(11 downto 0);
signal reg_select_0,reg_select_1,reg_enb,Mux_2_to_1_3bit_output,RCA_3_bit_Adder_output,Jump_Address,ProgramCounter_output:STD_LOGIC_VECTOR(2 downto 0);
signal reg_0_output,reg_1_output,reg_2_output,reg_3_output,reg_4_output,reg_5_output,reg_6_output,reg_7_output:STD_LOGIC_VECTOR (3 downto 0);
signal ALU_MUX_output_0,ALU_MUX_output_1,AU_out,Choose_Register_Store_value,Immediate_value:STD_LOGIC_VECTOR (3 downto 0);
signal lut_output:std_LOGIC_VECTOR(6 downto 0);

begin

LUT_16_7_0:LUT_16_7
port map(
address  =>reg_7_output,
data =>lut_output
);

LUT_out <=lut_output;

Mux_2_to_1_3bit_0:Mux_2_to_1_3bit
port map(
S =>jump_or_not,
D0 =>RCA_3_bit_Adder_output,
D1 =>Jump_Address,
EN =>'1',
Y =>Mux_2_to_1_3bit_output
);

RCA_3_bit_Adder_0:RCA_3_bit_Adder
port map(
A0 =>ProgramCounter_output(0),
A1 =>ProgramCounter_output(1),
A2 =>ProgramCounter_output(2),
B0 =>'1',
B1 =>'0',
B2 =>'0',
C_in =>'0',
S0 =>RCA_3_bit_Adder_output(0),
S1 =>RCA_3_bit_Adder_output(1),
S2 =>RCA_3_bit_Adder_output(2)
);


Slow_Clk0 : Slow_Clk
port map (
Clk_in => Clk,
Clk_out => Clk_slow);


ProgramRom_0:ProgramRom
port map(
Address =>ProgramCounter_output,
Instruction =>Instruction_Bus_Input
);


ProgramCounter_0:ProgramCounter
port map(
Reset_button=>Reset_Push_Button,
EN =>'1',
D=>Mux_2_to_1_3bit_output,
Clk=>Clk_slow,
Q =>ProgramCounter_output
);

--pc <=ProgramCounter_output;
Instruction_Decoder_0:Instruction_Decoder
port map(
Instruction_input =>Instruction_Bus_Input,
Register_check_for_jump =>ALU_MUX_output_0,
Register_enable_output=>reg_enb,
Load_select_output =>load_select,
Immediate_value_output =>Immediate_value,
Register_select_output_0 =>reg_select_0,
Register_select_output_1 =>reg_select_1,
Add_Sub_select_output =>select_operation,
Jump_flag =>jump_or_not,
Address_to_jump =>Jump_Address
);


Reg_Bank_0:Reg_Bank
port map(
Reg_enable=>reg_enb,
Mux_2_1_4bit_result => Choose_Register_Store_value,
Reset_button =>Reset_Push_Button,
Clk => Clk_slow,
Reg_out0=>reg_0_output,
Reg_out1=>reg_1_output,
Reg_out2=>reg_2_output,
Reg_out3=>reg_3_output,
Reg_out4=>reg_4_output,
Reg_out5=>reg_5_output,
Reg_out6=>reg_6_output,
Reg_out7=>reg_7_output
);

LED_out <=reg_7_output;
--Reg_1_out <=reg_1_output;
--Reg_2_out <=reg_2_output;

Anode <="1110";

Mux_8_to_1_0:Mux_8_to_1
port map(
S =>reg_select_0,
D0 => reg_0_output,
D1 => reg_1_output,
D2 => reg_2_output,
D3 => reg_3_output,
D4 => reg_4_output,
D5 => reg_5_output,
D6 => reg_6_output,
D7 => reg_7_output,
EN => '1',
y =>ALU_MUX_output_0
);

Mux_8_to_1_1:Mux_8_to_1
port map(
S =>reg_select_1,
D0 => reg_0_output,
D1 => reg_1_output,
D2 => reg_2_output,
D3 => reg_3_output,
D4 => reg_4_output,
D5 => reg_5_output,
D6 => reg_6_output,
D7 => reg_7_output,
EN => '1',
y =>ALU_MUX_output_1
);

ADD_SUB_unit_0:ADD_SUB_unit
Port map(
INPUT_0 =>ALU_MUX_output_0,
INPUT_1 =>ALU_MUX_output_1,
AddSub_Select =>select_operation,
OUTPUT =>AU_out,
Zero =>Zero_flag,
OverFlow =>Overflow_Flag
);

Mux_2_to_1_4bit_0:Mux_2_to_1_4bit
port map(
Load_Select =>load_select,
Mux_2_to_1_4bit_in_0=>AU_out,
Mux_2_to_1_4bit_in_1 =>Immediate_value,
EN =>'1',
Y =>Choose_Register_Store_value
);



end Behavioral;
