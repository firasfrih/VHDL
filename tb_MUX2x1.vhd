Entity tb_MUX2x1 IS
END tb_MUX2x1;

ARCHITECTURE testbench OF tb_MUX2x1 IS

    COMPONENT MUX2x1
    PORT(    IA    , IB :IN bit;
            S                :IN bit;
            E                :IN bit;
            Y1,Y2,Y3        :OUT bit
            );
    END COMPONENT;


    SIGNAL IA    :    bit :='0';            --- Input Stimuli-Signale
    SIGNAL IB    :    bit :='0';
    SIGNAL S     :    bit :='0';
    SIGNAL E     :    bit :='0';
    SIGNAL Y1    :    bit;                    --- Output Signale
    SIGNAL Y2    :    bit;
    SIGNAL Y3    :    bit;

Begin

    dut: Mux2x1                                 --- Instantiieren des Device Under Test
    PORT MAP ( IA => IA,
                  IB => IB,
                  S  => S,
                  E  => E,
                  Y1 => Y1,
                  Y2 => Y2,
                  Y3 => Y3 );



IA <= '0' AFTER 0 ns, '1' AFTER 40 ns, '0' AFTER 80 ns, '1' AFTER 160 ns, '0' AFTER 200 ns, '1' AFTER 240 ns ,'0' AFTER 280 ns,'1' AFTER 320 ns,'0' AFTER 360 ns,'1' AFTER 400 ns,'0' AFTER 440 ns, '1' AFTER 480 ns , '0' AFTER 520 ns ,'1' AFTER 560 ns;
IB <= not IB after 5ns;
E  <= '0' AFTER 0 ns,'1' AFTER 320 ns;
S  <= '0' AFTER 0 ns, '1' AFTER 160 ns, '0' AFTER 320 ns, '1' AFTER 480 ns;

END testbench;
