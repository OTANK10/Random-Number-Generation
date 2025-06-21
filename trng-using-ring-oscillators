
entity TRNG is
    Port ( 
        trn : buffer std_logic_vector(20 downto 0);
        reset : in STD_LOGIC;
        sample: in STD_LOGIC;
        clk : in std_logic
    );
end entity TRNG;

architecture Behavioral of TRNG is
    signal ring  : std_logic_vector(20 downto 0) := "100101101101101101010";
    signal ring2 : std_logic_vector(20 downto 0) := "001100001010110100010";
    signal clk_int : std_logic;
    
    -- Ring oscillator component
    component iclk is
        port (
            iclk_clk => clk_int,
            iclk_en_oscena => '1'
        );
    end component iclk;

begin
    -- Sample random values on clock edge
    process (clk_int, ring, ring2, KEY) begin
        if KEY(2)='0' then
            ring <= "100101101101101101010";
            ring2 <= "001100001010110100010";
        else
            if rising_edge(clk_int) then
                -- Ring oscillator 1
                for i in ring'range loop
                    ring(i) <= not ring(0) after 1ns;
                end loop;
                
                -- Ring oscillator 2  
                for i in ring2'range loop
                    ring2(i) <= not ring2(i+1) after 1ns;
                end loop;
            end if;
        end if;
    end process;
end Behavioral;
