----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 11:13:31 PM
-- Design Name: 
-- Module Name: TB_Reg - Behavioral
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

entity TB_Reg is
--  Port ( );
end TB_Reg;

architecture Behavioral of TB_Reg is
    component Reg
        port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            EN : in STD_LOGIC;
            Res_Reg : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component Slow_Clk
        port (
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC
        );
    end component;

    signal D : STD_LOGIC_VECTOR(3 downto 0);
    signal EN : STD_LOGIC:='1';
    signal Res_Reg : STD_LOGIC := '0'; -- Ensure initial value is set
    signal Clk : STD_LOGIC:='0';
    signal Q : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT: Reg PORT MAP(
D => D, 
Res_Reg => Res_Reg, 
Clk => Clk,
Q => Q,
EN => EN
);

process begin
    Clk <= NOT(Clk);
    wait for 2ns;
end process;
process
begin
    D <= "0101";
    wait for 100 ns;
    D <= "1111";
    wait for 100 ns;
    EN <='0';
    D <= "0111";
    wait for 100 ns;
    D <= "0110";
   
    
    
    
end process;

end Behavioral;

