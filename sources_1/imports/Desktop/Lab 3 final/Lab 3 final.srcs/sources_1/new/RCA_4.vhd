----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 02:21:35 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port (
       A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_In : in STD_LOGIC; ---Add =0 Sub =1
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       C_out : out STD_LOGIC;
       overflow : out STD_LOGIC;
       zero:out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
component FA
    port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_Out: out std_logic);
end component;

SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C, FA0_B, FA1_B, FA2_B, FA3_B : std_logic; 
signal S_S: STD_LOGIC_VECTOR (3 downto 0);

begin
    FA_0 : FA
        port map (
             A => A0,
             B => FA0_B,
             C_in =>C_In,---set add/sub
             S => S_S(0),
             C_Out => FA0_C);
    FA_1 : FA
        port map (
             A => A1,
             B => FA1_B,
             C_in => FA0_C,
             S => S_S(1),
             C_Out => FA1_C); 
     FA_2 : FA
        port map (
             A => A2,
             B => FA2_B,
             C_in => FA1_C,
             S => S_S(2),
             C_Out => FA2_C);
     FA_3 : FA
        port map (
             A => A3,
             B => FA3_B,
             C_in => FA2_C,
             S => S_S(3),
             C_Out => FA3_C); 
             
             
     FA0_B <= (B0 AND NOT(C_In)) OR (NOT(B0) AND C_In);    
     FA1_B <= (B1 AND NOT(C_In)) OR (NOT(B1) AND C_In);        
     FA2_B <= (B2 AND NOT(C_In)) OR (NOT(B2) AND C_In);        
     FA3_B <= (B3 AND NOT(C_In)) OR (NOT(B3) AND C_In);    
         
S0 <= S_S(0);
S1 <= S_S(1);
S2 <= S_S(2);
S3 <= S_S(3);
C_out <=FA3_C;
overflow <= (FA3_C AND NOT(FA2_C)) OR (FA2_C AND NOT(FA3_C)); 
zero <= NOT(S_S(0)) AND NOT S_S(1) AND NOT (S_S(2)) AND NOT (S_S(3)) AND NOT(FA3_C);
  
end Behavioral;