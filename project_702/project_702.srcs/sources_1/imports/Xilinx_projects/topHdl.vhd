-- comment
-- header

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity topHdl is
  port  (
          DDR_addr          : inout STD_LOGIC_VECTOR ( 14 downto 0 );
          DDR_ba            : inout STD_LOGIC_VECTOR ( 2 downto 0 );
          DDR_cas_n         : inout STD_LOGIC;
          DDR_ck_n          : inout STD_LOGIC;
          DDR_ck_p          : inout STD_LOGIC;
          DDR_cke           : inout STD_LOGIC;
          DDR_cs_n          : inout STD_LOGIC;
          DDR_dm            : inout STD_LOGIC_VECTOR ( 3 downto 0 );
          DDR_dq            : inout STD_LOGIC_VECTOR ( 31 downto 0 );
          DDR_dqs_n         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
          DDR_dqs_p         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
          DDR_odt           : inout STD_LOGIC;
          DDR_ras_n         : inout STD_LOGIC;
          DDR_reset_n       : inout STD_LOGIC;
          DDR_we_n          : inout STD_LOGIC;
          FIXED_IO_ddr_vrn  : inout STD_LOGIC;
          FIXED_IO_ddr_vrp  : inout STD_LOGIC;
          FIXED_IO_mio      : inout STD_LOGIC_VECTOR ( 53 downto 0 );
          FIXED_IO_ps_clk   : inout STD_LOGIC;
          FIXED_IO_ps_porb  : inout STD_LOGIC;
          FIXED_IO_ps_srstb : inout STD_LOGIC;
          --
          SYSCLK_P          : in    STD_LOGIC;
          SYSCLK_N          : in    STD_LOGIC;
          PMOD1_0_LS        : out   STD_LOGIC;
          PMOD1_1_LS        : out   STD_LOGIC;
          PMOD1_2_LS        : out   STD_LOGIC;
          PMOD1_3_LS        : out   STD_LOGIC;
          PMOD2_0_LS        : out   STD_LOGIC;
          PMOD2_1_LS        : out   STD_LOGIC;
          PMOD2_2_LS        : out   STD_LOGIC;
          PMOD2_3_LS        : out   STD_LOGIC
          --sw  : in  std_logic_vector(3 downto 0);
          --led : out std_logic_vector(7 downto 0)
        );
end topHdl;

architecture rtl of topHdl is
  -- components
  component ps_wrapper
  port (
    DDR_addr          : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba            : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n         : inout STD_LOGIC;
    DDR_ck_n          : inout STD_LOGIC;
    DDR_ck_p          : inout STD_LOGIC;
    DDR_cke           : inout STD_LOGIC;
    DDR_cs_n          : inout STD_LOGIC;
    DDR_dm            : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq            : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt           : inout STD_LOGIC;
    DDR_ras_n         : inout STD_LOGIC;
    DDR_reset_n       : inout STD_LOGIC;
    DDR_we_n          : inout STD_LOGIC;
    FIXED_IO_ddr_vrn  : inout STD_LOGIC;
    FIXED_IO_ddr_vrp  : inout STD_LOGIC;
    FIXED_IO_mio      : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk   : inout STD_LOGIC;
    FIXED_IO_ps_porb  : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC);
  end component;
  
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

  
  ps : ps_wrapper
  port map (
    DDR_addr            => DDR_addr          ,-- inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba              => DDR_ba            ,-- inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n           => DDR_cas_n         ,-- inout STD_LOGIC;
    DDR_ck_n            => DDR_ck_n          ,-- inout STD_LOGIC;
    DDR_ck_p            => DDR_ck_p          ,-- inout STD_LOGIC;
    DDR_cke             => DDR_cke           ,-- inout STD_LOGIC;
    DDR_cs_n            => DDR_cs_n          ,-- inout STD_LOGIC;
    DDR_dm              => DDR_dm            ,-- inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq              => DDR_dq            ,-- inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n           => DDR_dqs_n         ,-- inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p           => DDR_dqs_p         ,-- inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt             => DDR_odt           ,-- inout STD_LOGIC;
    DDR_ras_n           => DDR_ras_n         ,-- inout STD_LOGIC;
    DDR_reset_n         => DDR_reset_n       ,-- inout STD_LOGIC;
    DDR_we_n            => DDR_we_n          ,-- inout STD_LOGIC;
    FIXED_IO_ddr_vrn    => FIXED_IO_ddr_vrn  ,-- inout STD_LOGIC;
    FIXED_IO_ddr_vrp    => FIXED_IO_ddr_vrp  ,-- inout STD_LOGIC;
    FIXED_IO_mio        => FIXED_IO_mio      ,-- inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk     => FIXED_IO_ps_clk   ,-- inout STD_LOGIC;
    FIXED_IO_ps_porb    => FIXED_IO_ps_porb  ,-- inout STD_LOGIC;
    FIXED_IO_ps_srstb   => FIXED_IO_ps_srstb  -- inout STD_LOGIC);
  );  
  
  
end rtl;














