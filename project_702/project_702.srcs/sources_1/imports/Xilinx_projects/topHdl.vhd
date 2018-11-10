-- comment
-- header

library ieee, xil_defaultlib;
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
          GPIO_SW_N         : in    STD_LOGIC;
          GPIO_SW_S         : in    STD_LOGIC;
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
--  component ps_wrapper
--  port (
--    DDR_addr          : inout STD_LOGIC_VECTOR ( 14 downto 0 );
--    DDR_ba            : inout STD_LOGIC_VECTOR ( 2 downto 0 );
--    DDR_cas_n         : inout STD_LOGIC;
--    DDR_ck_n          : inout STD_LOGIC;
--    DDR_ck_p          : inout STD_LOGIC;
--    DDR_cke           : inout STD_LOGIC;
--    DDR_cs_n          : inout STD_LOGIC;
--    DDR_dm            : inout STD_LOGIC_VECTOR ( 3 downto 0 );
--    DDR_dq            : inout STD_LOGIC_VECTOR ( 31 downto 0 );
--    DDR_dqs_n         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
--    DDR_dqs_p         : inout STD_LOGIC_VECTOR ( 3 downto 0 );
--    DDR_odt           : inout STD_LOGIC;
--    DDR_ras_n         : inout STD_LOGIC;
--    DDR_reset_n       : inout STD_LOGIC;
--    DDR_we_n          : inout STD_LOGIC;
--    FIXED_IO_ddr_vrn  : inout STD_LOGIC;
--    FIXED_IO_ddr_vrp  : inout STD_LOGIC;
--    FIXED_IO_mio      : inout STD_LOGIC_VECTOR ( 53 downto 0 );
--    FIXED_IO_ps_clk   : inout STD_LOGIC;
--    FIXED_IO_ps_porb  : inout STD_LOGIC;
--    FIXED_IO_ps_srstb : inout STD_LOGIC;
--    leds_4bits_tri_o  : out   STD_LOGIC_VECTOR ( 3 downto 0 )
--    );
--  end component;
  
  -- types
  
  -- signals
  signal S01_AXI_0_araddr   : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_arburst  : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_0_arcache  : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_0_arid     : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_arlen    : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S01_AXI_0_arlock   : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_arprot   : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_0_arqos    : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_0_arready  : STD_LOGIC;
  signal S01_AXI_0_arsize   : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_0_arvalid  : STD_LOGIC;
  signal S01_AXI_0_awaddr   : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_awburst  : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_0_awcache  : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_0_awid     : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_awlen    : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S01_AXI_0_awlock   : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_awprot   : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_0_awqos    : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_0_awready  : STD_LOGIC;
  signal S01_AXI_0_awsize   : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_0_awvalid  : STD_LOGIC;
  signal S01_AXI_0_bid      : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_bready   : STD_LOGIC;
  signal S01_AXI_0_bresp    : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_0_bvalid   : STD_LOGIC;
  signal S01_AXI_0_rdata    : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_rid      : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_AXI_0_rlast    : STD_LOGIC;
  signal S01_AXI_0_rready   : STD_LOGIC;
  signal S01_AXI_0_rresp    : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_0_rvalid   : STD_LOGIC;
  signal S01_AXI_0_wdata    : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_0_wlast    : STD_LOGIC;
  signal S01_AXI_0_wready   : STD_LOGIC;
  signal S01_AXI_0_wstrb    : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_0_wvalid   : STD_LOGIC;
  
  
  signal sysclk   : std_logic;
  signal clk200   : std_logic;
  signal cnt      : integer := 0;
  signal ledCnt   : unsigned(7 downto 0) := (others => '0');
  signal areset_n : std_logic;
  signal clk50    : std_logic;
  signal led_out  : std_logic_vector(3 downto 0);
  
---------------------------------------------------------------------------------------------------
begin -- architecture
---------------------------------------------------------------------------------------------------

PMOD1_0_LS  <= led_out(0);
PMOD1_1_LS  <= led_out(1);
PMOD1_2_LS  <= led_out(2);
PMOD1_3_LS  <= led_out(3);
PMOD2_0_LS  <= ledCnt(4);
PMOD2_1_LS  <= ledCnt(5);
PMOD2_2_LS  <= ledCnt(6);
PMOD2_3_LS  <= ledCnt(7);
--pbsw        <= GPIO_SW_N & GPIO_SW_S;


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
      if cnt = 10000000 then
        ledCnt  <= ledCnt + 1;
        cnt     <= 0;
      end if;
    end if;
  end process;

  
  ps : entity xil_defaultlib.ps_wrapper
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
    FIXED_IO_ps_srstb   => FIXED_IO_ps_srstb ,-- inout STD_LOGIC
--    S01_ACLK_0          => clk50             ,-- in  STD_LOGIC;
--    S01_ARESETN_0       => areset_n          ,-- in  STD_LOGIC;
--    S01_AXI_0_araddr    => S01_AXI_0_araddr  ,-- in  STD_LOGIC_VECTOR ( 31 downto 0 );
--    S01_AXI_0_arburst   => S01_AXI_0_arburst ,-- in  STD_LOGIC_VECTOR ( 1 downto 0 );
--    S01_AXI_0_arcache   => S01_AXI_0_arcache ,-- in  STD_LOGIC_VECTOR ( 3 downto 0 );
--    S01_AXI_0_arid      => S01_AXI_0_arid    ,-- in  STD_LOGIC_VECTOR ( 0 to 0 );
--    S01_AXI_0_arlen     => S01_AXI_0_arlen   ,-- in  STD_LOGIC_VECTOR ( 7 downto 0 );
--    S01_AXI_0_arlock    => S01_AXI_0_arlock  ,-- in  STD_LOGIC_VECTOR ( 0 to 0 );
--    S01_AXI_0_arprot    => S01_AXI_0_arprot  ,-- in  STD_LOGIC_VECTOR ( 2 downto 0 );
--    S01_AXI_0_arqos     => S01_AXI_0_arqos   ,-- in  STD_LOGIC_VECTOR ( 3 downto 0 );
--    S01_AXI_0_arready   => S01_AXI_0_arready ,-- out STD_LOGIC;
--    S01_AXI_0_arsize    => S01_AXI_0_arsize  ,-- in  STD_LOGIC_VECTOR ( 2 downto 0 );
--    S01_AXI_0_arvalid   => S01_AXI_0_arvalid ,-- in  STD_LOGIC;
--    S01_AXI_0_awaddr    => S01_AXI_0_awaddr  ,-- in  STD_LOGIC_VECTOR ( 31 downto 0 );
--    S01_AXI_0_awburst   => S01_AXI_0_awburst ,-- in  STD_LOGIC_VECTOR ( 1 downto 0 );
--    S01_AXI_0_awcache   => S01_AXI_0_awcache ,-- in  STD_LOGIC_VECTOR ( 3 downto 0 );
--    S01_AXI_0_awid      => S01_AXI_0_awid    ,-- in  STD_LOGIC_VECTOR ( 0 to 0 );
--    S01_AXI_0_awlen     => S01_AXI_0_awlen   ,-- in  STD_LOGIC_VECTOR ( 7 downto 0 );
--    S01_AXI_0_awlock    => S01_AXI_0_awlock  ,-- in  STD_LOGIC_VECTOR ( 0 to 0 );
--    S01_AXI_0_awprot    => S01_AXI_0_awprot  ,-- in  STD_LOGIC_VECTOR ( 2 downto 0 );
--    S01_AXI_0_awqos     => S01_AXI_0_awqos   ,-- in  STD_LOGIC_VECTOR ( 3 downto 0 );
--    S01_AXI_0_awready   => S01_AXI_0_awready ,-- out STD_LOGIC;
--    S01_AXI_0_awsize    => S01_AXI_0_awsize  ,-- in  STD_LOGIC_VECTOR ( 2 downto 0 );
--    S01_AXI_0_awvalid   => S01_AXI_0_awvalid ,-- in  STD_LOGIC;
--    S01_AXI_0_bid       => S01_AXI_0_bid     ,-- out STD_LOGIC_VECTOR ( 0 to 0 );
--    S01_AXI_0_bready    => S01_AXI_0_bready  ,-- in  STD_LOGIC;
--    S01_AXI_0_bresp     => S01_AXI_0_bresp   ,-- out STD_LOGIC_VECTOR ( 1 downto 0 );
--    S01_AXI_0_bvalid    => S01_AXI_0_bvalid  ,-- out STD_LOGIC;
--    S01_AXI_0_rdata     => S01_AXI_0_rdata   ,-- out STD_LOGIC_VECTOR ( 31 downto 0 );
--    S01_AXI_0_rid       => S01_AXI_0_rid     ,-- out STD_LOGIC_VECTOR ( 0 to 0 );
--    S01_AXI_0_rlast     => S01_AXI_0_rlast   ,-- out STD_LOGIC;
--    S01_AXI_0_rready    => S01_AXI_0_rready  ,-- in  STD_LOGIC;
--    S01_AXI_0_rresp     => S01_AXI_0_rresp   ,-- out STD_LOGIC_VECTOR ( 1 downto 0 );
--    S01_AXI_0_rvalid    => S01_AXI_0_rvalid  ,-- out STD_LOGIC;
--    S01_AXI_0_wdata     => S01_AXI_0_wdata   ,-- in  STD_LOGIC_VECTOR ( 31 downto 0 );
--    S01_AXI_0_wlast     => S01_AXI_0_wlast   ,-- in  STD_LOGIC;
--    S01_AXI_0_wready    => S01_AXI_0_wready  ,-- out STD_LOGIC;
--    S01_AXI_0_wstrb     => S01_AXI_0_wstrb   ,-- in  STD_LOGIC_VECTOR ( 3 downto 0 );
--    S01_AXI_0_wvalid    => S01_AXI_0_wvalid  ,-- in  STD_LOGIC;
--    areset_n            => areset_n          ,-- out STD_LOGIC_VECTOR ( 0 to 0 );
--    clk50               => clk50             ,-- out STD_LOGIC;
    gpio_rtl_tri_o    => led_out               -- in  STD_LOGIC_VECTOR ( 3 downto 0 )
  );  
  
  
end rtl;














