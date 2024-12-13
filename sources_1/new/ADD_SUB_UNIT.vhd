----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 12:29:06 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity ADD_SUB_unit is
    Port ( INPUT_0: in STD_LOGIC_VECTOR (3 downto 0);
           INPUT_1: in STD_LOGIC_VECTOR (3 downto 0);
           AddSub_Select : in STD_LOGIC;
           OUTPUT:out STD_LOGIC_VECTOR(3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end ADD_SUB_unit;

architecture Behavioral of ADD_SUB_unit is

---RCA component
component RCA_4 Port ( 
       A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_In : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       C_out : out STD_LOGIC;
       overflow:out STD_LOGIC;
       zero: out STD_LOGIC);
end component;

signal overflow_bit,C_out : STD_LOGIC;

begin

RCA_4_0 : RCA_4
port map (
    A0 => INPUT_0(0),
    A1 => INPUT_0(1),
    A2 => INPUT_0(2),
    A3 => INPUT_0(3),
    B0 => INPUT_1(0),
    B1 => INPUT_1(1),
    B2 => INPUT_1(2),
    B3 => INPUT_1(3),
    C_In => AddSub_Select,
    S0=> OUTPUT(0),
    S1=> OUTPUT(1),
    S2=> OUTPUT(2),
    S3=> OUTPUT(3),
    C_out=> C_out,
    overflow =>OverFlow,
    zero => Zero
);

end Behavioral;
