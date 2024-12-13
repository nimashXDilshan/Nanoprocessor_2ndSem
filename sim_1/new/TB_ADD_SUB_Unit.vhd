----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 05:59:32 PM
-- Design Name: 
-- Module Name: TB_ADD_SUB_Unit - Behavioral
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

entity TB_ADD_SUB_Unit is
--  Port ( );
end TB_ADD_SUB_Unit;

architecture Behavioral of TB_ADD_SUB_Unit is

component ADD_SUB_Unit port (
           INPUT_0: in STD_LOGIC_VECTOR (3 downto 0);
           INPUT_1: in STD_LOGIC_VECTOR (3 downto 0);
           AddSub_Select : in STD_LOGIC;
           OUTPUT:out STD_LOGIC_VECTOR(3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end component;

SIGNAL INPUT_0,INPUT_1: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL OUTPUT: STD_LOGIC_VECTOR ( 3 downto 0);
SIGNAL Zero, Overflow: STD_LOGIC:='0';
SIGNAL AddSub_Select: STD_LOGIC :='0';

begin

UUT:ADD_SUB_Unit
    PORT MAP(
    INPUT_0 =>INPUT_0,
    INPUT_1 => INPUT_1,
    AddSub_Select => AddSub_Select,
    OUTPUT =>OUTPUT,
    Zero => Zero,
    Overflow => Overflow);

process begin 
    wait for 100 ns;
    
    INPUT_0 <="1010";
    INPUT_1 <="0001";
    AddSub_Select <='1';
    wait for 50 ns;
    INPUT_0 <="1001";
    INPUT_1 <="0001";
    AddSub_Select <='1';
    wait for 50ns;
    INPUT_0 <="1000";
    INPUT_1 <="0001";
    AddSub_Select <='1';    
    wait for 50ns;
    INPUT_0 <="0111";
    INPUT_1 <="0001";
    AddSub_Select <='1'; 
    wait for 50ns;
    INPUT_0 <="0110";
    INPUT_1 <="0001";
    AddSub_Select <='1';  
    wait for 50ns;
    INPUT_0 <="0101";
    INPUT_1 <="0001";
    AddSub_Select <='1'; 
    
    
    wait for 50ns;
        INPUT_0 <="0100";
        INPUT_1 <="0001";
        AddSub_Select <='1'; 
        
   wait for 50ns;
            INPUT_0 <="0011";
            INPUT_1 <="0001";
            AddSub_Select <='1';
            
    wait for 50ns;
                INPUT_0 <="0010";
                INPUT_1 <="0001";
                AddSub_Select <='0';  
   wait for 50ns;
                    INPUT_0 <="0001";
                    INPUT_1 <="0001";
                    AddSub_Select <='1';  
wait for 50ns;
                        INPUT_0 <="0000";
                        INPUT_1 <="0000";
                        AddSub_Select <='0';                                                           
    wait;
    
end process;
end Behavioral;
