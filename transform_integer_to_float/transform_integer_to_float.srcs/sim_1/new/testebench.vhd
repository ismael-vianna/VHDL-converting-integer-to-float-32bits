--
-- Experimento para transformar um numero inteiro em um numero float
-- Desenvolvido por Ismael Soller Vianna, em 2021-07-20
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testebench is

end testebench;

architecture Behavioral of testebench is

  component data_path is 
    port (
        clk         : in  std_logic;
        rst         : in  std_logic; 
        entrada_a   : in  std_logic_vector (31 downto 0);
        ula_out     : out std_logic_vector (31 downto 0)  
      );
  end component;

 -- control signals
    signal clk_s            : std_logic :='0';
    signal reset_s          : std_logic;
    signal entrada_a_s      : std_logic_vector (31 downto 0) := "00000000000000000000000000000111";
    signal ula_out_s        : std_logic_vector (31 downto 0);
       
begin
    data_path_i : data_path
        port map (
            clk         => clk_s,
            rst         => reset_s, 
            entrada_a   => entrada_a_s,
            ula_out     => ula_out_s  
      );

    --clock generator - 100MHZ
   clk_s 	<= not clk_s after 5 ns;
    
    --reset signal
    reset_s		<= '1' after 2 ns,
		           '0' after 8 ns;	

end Behavioral;
