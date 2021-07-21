--
-- Experimento para transformar um numero inteiro em um numero float
-- Desenvolvido por Ismael Soller Vianna, em 2021-07-20
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_path is
  Port (
    clk         : in  std_logic;
    rst         : in  std_logic; 
    entrada_a   : in  std_logic_vector (31 downto 0);
    ula_out     : out std_logic_vector (31 downto 0)  
  );
end data_path;

architecture Behavioral of data_path is
    constant BIAS      : std_logic_vector (7 downto 0)  := "01111111"; -- Bias = int(127)
    constant ZERO32    : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";

    signal notacao_exc : std_logic_vector (7 downto 0)  := "00000000";
    signal not_exc_fim : std_logic                      := '0';
    signal expoente    : std_logic_vector (7 downto 0)  := "00000000";    
    signal expo_achou  : std_logic                      := '0';
    signal mantissa    : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
    signal sinal       : std_logic                      := '0';
    signal valor_float : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
begin

IDENTIFICA_SINAL:process(clk, rst, entrada_a)
begin
    if (rising_edge(clk) and rst='0') then
        if (entrada_a(30 downto 0) /= ZERO32(30 downto 0)) then            
            sinal <= entrada_a(31);
        end if;        
    end if;
end process;

IDENTIFICA_EXPOENTE_MANTISSA:process(clk, rst, entrada_a)
begin
    if (rising_edge(clk) and rst='0') then
        if (entrada_a(30) = '1') then
            expoente <= "00011110";
            expo_achou <= '1';
            mantissa(31 downto 2) <= std_logic_vector(unsigned(entrada_a(29 downto 0)));
        else
            if (entrada_a(29) = '1') then
                expoente <= "00011101";
                expo_achou <= '1';
                mantissa(31 downto 3) <= std_logic_vector(unsigned(entrada_a(28 downto 0)));
            else
                if (entrada_a(28) = '1') then
                    expoente <= "00011100";
                    expo_achou <= '1';
                    mantissa(31 downto 4) <= std_logic_vector(unsigned(entrada_a(27 downto 0)));
                else
                    if (entrada_a(27) = '1') then
                        expoente <= "00011011";
                        expo_achou <= '1';
                        mantissa(31 downto 5) <= std_logic_vector(unsigned(entrada_a(26 downto 0)));
                    else
                        if (entrada_a(26) = '1') then
                            expoente <= "00011010";
                            expo_achou <= '1';
                            mantissa(31 downto 6) <= std_logic_vector(unsigned(entrada_a(25 downto 0)));
                        else
                            if (entrada_a(25) = '1') then
                                expoente <= "00011001";
                                expo_achou <= '1';
                                mantissa(31 downto 7) <= std_logic_vector(unsigned(entrada_a(24 downto 0)));
                            else
                                if (entrada_a(24) = '1') then
                                    expoente <= "00011000";
                                    expo_achou <= '1';
                                    mantissa(31 downto 8) <= std_logic_vector(unsigned(entrada_a(23 downto 0)));
                                else
                                    if (entrada_a(23) = '1') then
                                        expoente <= "00010111";
                                        expo_achou <= '1';
                                        mantissa(31 downto 9) <= std_logic_vector(unsigned(entrada_a(22 downto 0)));
                                    else
                                        if (entrada_a(22) = '1') then
                                            expoente <= "00010110";
                                            expo_achou <= '1';
                                            mantissa(31 downto 10) <= std_logic_vector(unsigned(entrada_a(21 downto 0)));
                                        else
                                            if (entrada_a(21) = '1') then
                                                expoente <= "00010101";
                                                expo_achou <= '1';
                                                mantissa(31 downto 11) <= std_logic_vector(unsigned(entrada_a(20 downto 0)));
                                            else
                                                if (entrada_a(20) = '1') then
                                                    expoente <= "00010100";
                                                    expo_achou <= '1';
                                                    mantissa(31 downto 12) <= std_logic_vector(unsigned(entrada_a(19 downto 0)));
                                                else
                                                    if (entrada_a(19) = '1') then
                                                        expoente <= "00010011";
                                                        expo_achou <= '1';
                                                        mantissa(31 downto 13) <= std_logic_vector(unsigned(entrada_a(18 downto 0)));
                                                    else
                                                        if (entrada_a(18) = '1') then
                                                            expoente <= "00010010";
                                                            expo_achou <= '1';
                                                            mantissa(31 downto 14) <= std_logic_vector(unsigned(entrada_a(17 downto 0)));
                                                        else
                                                            if (entrada_a(17) = '1') then
                                                                expoente <= "00010001";
                                                                expo_achou <= '1';
                                                                mantissa(31 downto 15) <= std_logic_vector(unsigned(entrada_a(16 downto 0)));
                                                            else
                                                                if (entrada_a(16) = '1') then
                                                                    expoente <= "00010000";
                                                                    expo_achou <= '1';
                                                                    mantissa(31 downto 16) <= std_logic_vector(unsigned(entrada_a(15 downto 0)));
                                                                else
                                                                    if (entrada_a(15) = '1') then
                                                                        expoente <= "00001111";
                                                                        expo_achou <= '1';
                                                                        mantissa(31 downto 17) <= std_logic_vector(unsigned(entrada_a(14 downto 0)));
                                                                    else
                                                                        if (entrada_a(14) = '1') then
                                                                            expoente <= "00001110";
                                                                            expo_achou <= '1';
                                                                            mantissa(31 downto 18) <= std_logic_vector(unsigned(entrada_a(13 downto 0)));
                                                                        else
                                                                            if (entrada_a(13) = '1') then
                                                                                expoente <= "00001101";
                                                                                expo_achou <= '1';
                                                                                mantissa(31 downto 19) <= std_logic_vector(unsigned(entrada_a(12 downto 0)));
                                                                            else
                                                                                if (entrada_a(12) = '1') then
                                                                                    expoente <= "00001100";
                                                                                    expo_achou <= '1';
                                                                                    mantissa(31 downto 20) <= std_logic_vector(unsigned(entrada_a(11 downto 0)));
                                                                                else
                                                                                    if (entrada_a(11) = '1') then
                                                                                        expoente <= "00001011";
                                                                                        expo_achou <= '1';
                                                                                        mantissa(31 downto 21) <= std_logic_vector(unsigned(entrada_a(10 downto 0)));
                                                                                    else
                                                                                        if (entrada_a(10) = '1') then
                                                                                            expoente <= "00001010";
                                                                                            expo_achou <= '1';
                                                                                            mantissa(31 downto 22) <= std_logic_vector(unsigned(entrada_a(9 downto 0)));
                                                                                        else
                                                                                            if (entrada_a(9) = '1') then
                                                                                                expoente <= "00001001";
                                                                                                expo_achou <= '1';
                                                                                                mantissa(31 downto 23) <= std_logic_vector(unsigned(entrada_a(8 downto 0)));
                                                                                            else
                                                                                                if (entrada_a(8) = '1') then
                                                                                                    expoente <= "00001000";
                                                                                                    expo_achou <= '1';
                                                                                                    mantissa(31 downto 24) <= std_logic_vector(unsigned(entrada_a(7 downto 0)));
                                                                                                else
                                                                                                    if (entrada_a(7) = '1') then
                                                                                                        expoente <= "00000111";
                                                                                                        expo_achou <= '1';
                                                                                                        mantissa(31 downto 25) <= std_logic_vector(unsigned(entrada_a(6 downto 0)));
                                                                                                    else
                                                                                                        if (entrada_a(6) = '1') then
                                                                                                            expoente <= "00000110";
                                                                                                            expo_achou <= '1';
                                                                                                            mantissa(31 downto 26) <= std_logic_vector(unsigned(entrada_a(5 downto 0)));
                                                                                                        else
                                                                                                            if (entrada_a(5) = '1') then
                                                                                                                expoente <= "00000101";
                                                                                                                expo_achou <= '1';
                                                                                                                mantissa(31 downto 27) <= std_logic_vector(unsigned(entrada_a(4 downto 0)));
                                                                                                            else
                                                                                                                if (entrada_a(4) = '1') then
                                                                                                                    expoente <= "00000100";
                                                                                                                    expo_achou <= '1';
                                                                                                                    mantissa(31 downto 28) <= std_logic_vector(unsigned(entrada_a(3 downto 0)));
                                                                                                                else
                                                                                                                    if (entrada_a(3) = '1') then
                                                                                                                        expoente <= "00000011";
                                                                                                                        expo_achou <= '1';
                                                                                                                        mantissa(31 downto 29) <= std_logic_vector(unsigned(entrada_a(2 downto 0)));
                                                                                                                    else
                                                                                                                        if (entrada_a(2) = '1') then
                                                                                                                            expoente <= "00000010";
                                                                                                                            expo_achou <= '1';
                                                                                                                            mantissa(31 downto 30) <= std_logic_vector(unsigned(entrada_a(1 downto 0)));
                                                                                                                        else
                                                                                                                            if (entrada_a(1) = '1') then
                                                                                                                                expoente <= "00000001";
                                                                                                                                expo_achou <= '1';
                                                                                                                                mantissa(31) <= std_logic(entrada_a(0));
                                                                                                                            else
                                                                                                                                expo_achou <= '1';
                                                                                                                            end if;
                                                                                                                        end if;
                                                                                                                    end if;
                                                                                                                end if;
                                                                                                            end if;
                                                                                                        end if;
                                                                                                    end if;
                                                                                                end if;
                                                                                            end if;
                                                                                        end if;
                                                                                    end if;
                                                                                end if;
                                                                            end if;
                                                                        end if;
                                                                    end if;
                                                                end if;
                                                            end if;
                                                        end if;
                                                    end if;
                                                end if;
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

MONTA_NOTACAO_DE_EXCESSO:process(clk, rst, expo_achou)
begin
    if (rising_edge(clk) and rst='0')then
        if (expo_achou='1' and notacao_exc="00000000")then
            notacao_exc <= std_logic_vector (unsigned(BIAS) + unsigned(expoente));
            not_exc_fim <= '1';
        end if;    
    end if;
end process;

MONTA_FLOAT:process(clk, rst, expo_achou, not_exc_fim)
begin
    if (rising_edge(clk) and rst='0')then
        if (expo_achou='1' and not_exc_fim='1')then
            valor_float <= std_logic_vector(sinal & unsigned(notacao_exc) & unsigned(mantissa(31 downto 9)));
        else
            valor_float <= valor_float;
        end if;            
    end if;
end process;

-- ULA_OUT RECEBE O VALOR FLOAT
ula_out <= std_logic_vector(unsigned(valor_float));

end Behavioral;
