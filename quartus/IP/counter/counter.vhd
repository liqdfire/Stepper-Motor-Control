-------------------------------------------------------------------------------
--! @file         counter.vhd
--! @author       Marc Kossmann
--! @author       Michael Riedel
--! @version      v0.1.0
--! @date         23.11.2014
--!
--! @brief        Counter which divides the clock according to the divider
--! @details      Provide 5 ms time base when divider = 125000.
--! @par History:
--! @details      v0.1.0 23.11.2014 Kossmann
--!               - first draft
--! @details      v0.1.1 25.11.2014 Riedel
--!               - corrected formatting
--!               - renamed component to counter
--!               - re-implemented according to 5th-trimester counter
-------------------------------------------------------------------------------

--! Use Standard Library
LIBRARY ieee; 
--! Use Logic Elements
USE ieee.std_logic_1164.all;

ENTITY counter is
  GENERIC ( divider : INTEGER := 125000 );
  PORT
  (
    clock     : IN  STD_LOGIC;
    reset_n   : IN  STD_LOGIC;
    enable    : IN  STD_LOGIC;
    clk_out   : OUT STD_LOGIC
  );
END counter;

architecture counter_arch of counter is
  SIGNAL counter : INTEGER := 0;
begin
  count: PROCESS(reset_n, clock, enable)
  BEGIN
    IF(reset_n = '0') THEN
      counter <= 0;
    ELSIF(rising_edge(clock) AND enable = '1') THEN
      IF(counter = divider - 1) THEN
        counter <= 0;
      ELSE counter <= counter + 1;
      END IF;
    END IF; 
  END PROCESS;
  
  output: PROCESS(counter)
  BEGIN
    IF(counter = 0) THEN
      clk_out <= '1';
    ELSE
      clk_out <= '0';
    END IF;
  END PROCESS;
END counter_arch;