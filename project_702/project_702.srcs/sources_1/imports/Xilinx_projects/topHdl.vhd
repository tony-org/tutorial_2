-- comment
-- header

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity topHdl is
  port  (
          SYSCLK_P    : in  std_logic;
          SYSCLK_N    : in  std_logic;
          PMOD1_0_LS  : out std_logic;
          PMOD1_1_LS  : out std_logic;
          PMOD1_2_LS  : out std_logic;
          PMOD1_3_LS  : out std_logic;
          PMOD2_0_LS  : out std_logic;
          PMOD2_1_LS  : out std_logic;
          PMOD2_2_LS  : out std_logic;
          PMOD2_3_LS  : out std_logic
          --sw  : in  std_logic_vector(3 downto 0);
          --led : out std_logic_vector(7 downto 0)
        );
end topHdl;

architecture rtl of topHdl is
  -- components
  
  -- types
  
  -- signals
  signal sysclk   : std_logic;
  signal clk200   : std_logic;
  signal cnt      : integer := 0;
  
---------------------------------------------------------------------------------------------------
begin -- architecture
---------------------------------------------------------------------------------------------------

--PMOD1_0_LS  <= '1';
--PMOD1_1_LS  <= '0';
PMOD1_2_LS  <= '1';
PMOD1_3_LS  <= '0';
PMOD2_0_LS  <= '1';
PMOD2_1_LS  <= '0';
PMOD2_2_LS  <= '1';
PMOD2_3_LS  <= '0';


IBUFGDS_inst : IBUFGDS
--generic map (
--  DIFF_TERM     => FALSE, -- Differential Termination
--  IBUF_LOW_PWR  => TRUE,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
--  IOSTANDARD    => "LVDS")
port map (
  I   => SYSCLK_P,  -- Diff_p clock buffer input (connect directly to top-level port)
  IB  => SYSCLK_N,  -- Diff_n clock buffer input (connect directly to top-level port)
  O   => sysclk     -- Clock buffer output
);

BUFG_inst : BUFG
port map (
  I => sysclk, -- 1-bit input: Clock input
  O => clk200  -- 1-bit output: Clock output
);


  led_proc : process(all)
  begin
    if rising_edge(clk200) then
      cnt <= cnt + 1;
      if cnt = 100000000 then
        PMOD1_0_LS <= '1';
        cnt <= 0;
      elsif cnt = 50000000 then
        PMOD1_0_LS <= '0';
      end if;
      
      if cnt = 100000000 then
        PMOD1_1_LS <= '1';
      elsif cnt = 50000000 then
        PMOD1_1_LS <= '0';
      elsif cnt = 25000000 then
        PMOD1_1_LS <= '1';
      elsif cnt = 12500000 then
        PMOD1_1_LS <= '0';
      end if;
    end if;
  end process;

end rtl;














