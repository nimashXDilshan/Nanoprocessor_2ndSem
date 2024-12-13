----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 04:39:50 PM
-- Design Name: 
-- Module Name: ProgramRom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramRom is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramRom;

architecture Behavioral of ProgramRom is

    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        signal Program_ROM : rom_type := (
                   -- 1  st instruction set-----------
--                            "100010001010", --
--                            "100100000001",
--                            "010100000000",
--                            "000010100000",
--                            "110010000111",
--                            "110000000011",
--                            "000000000000",
--                            "ZZZZZZZZZZZZ"

--                    ------------Main's Instruction Set----------------
                                    "101110000011",   --Mov R7,3
                                    "101100000001",   --Mov R6,1
                                    "011100000000",   --Neg R6
                                    "101010000011",   --Mov R5,3
                                    "001011100000",   --Add R5,R6
                                    "001111010000",   --Add R7,R5
                                    "111010000110",   --JZR If R5=0 to adrs 6
                                    "110000000100"    --JZR If R0=0 to adrs 4
                                    


                   -----------Baysis_3 check_instructions-----------
--                                                "100010000001", --MOV R1,1 ; R1 <-- 1 ;
--                                                "100100000010", --MOV R2,2 ; R2 <-- 2 ;
--                                                "100110000011", --MOV R3,3 ; R3 <-- 3 ;
--                                                "000010100000", --ADD R1,R2;  R1 <---R1+R2;
--                                                "000010110000", --ADD R1,R3;  R1 <---R1+R3;
--                                                "000000000000",
--                                                "000000000000",
--                                                "ZZZZZZZZZZZZ"
                                                
                                                                            

                                                                            

                                      
                                      
                                      
                                      
                                    
          );
          
begin

Instruction <= Program_ROM(to_integer(unsigned(Address)));


end Behavioral;
