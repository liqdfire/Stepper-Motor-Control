-- StepperMotorControl_SRAM_CVGX.vhd

-- This file was auto-generated from altera_generic_tristate_controller_hw.tcl.  If you edit it your changes
-- will probably be lost.
-- 
-- Generated using ACDS version 14.0 200 at 2014.10.27.19:43:28

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity StepperMotorControl_SRAM_CVGX is
	generic (
		TCM_ADDRESS_W                  : integer := 19;
		TCM_DATA_W                     : integer := 16;
		TCM_BYTEENABLE_W               : integer := 2;
		TCM_READ_WAIT                  : integer := 10;
		TCM_WRITE_WAIT                 : integer := 10;
		TCM_SETUP_WAIT                 : integer := 10;
		TCM_DATA_HOLD                  : integer := 10;
		TCM_TURNAROUND_TIME            : integer := 2;
		TCM_TIMING_UNITS               : integer := 0;
		TCM_READLATENCY                : integer := 2;
		TCM_SYMBOLS_PER_WORD           : integer := 2;
		USE_READDATA                   : integer := 1;
		USE_WRITEDATA                  : integer := 1;
		USE_READ                       : integer := 0;
		USE_WRITE                      : integer := 1;
		USE_BYTEENABLE                 : integer := 1;
		USE_CHIPSELECT                 : integer := 1;
		USE_LOCK                       : integer := 0;
		USE_ADDRESS                    : integer := 1;
		USE_WAITREQUEST                : integer := 0;
		USE_WRITEBYTEENABLE            : integer := 0;
		USE_OUTPUTENABLE               : integer := 1;
		USE_RESETREQUEST               : integer := 0;
		USE_IRQ                        : integer := 0;
		USE_RESET_OUTPUT               : integer := 0;
		ACTIVE_LOW_READ                : integer := 0;
		ACTIVE_LOW_LOCK                : integer := 0;
		ACTIVE_LOW_WRITE               : integer := 1;
		ACTIVE_LOW_CHIPSELECT          : integer := 1;
		ACTIVE_LOW_BYTEENABLE          : integer := 1;
		ACTIVE_LOW_OUTPUTENABLE        : integer := 1;
		ACTIVE_LOW_WRITEBYTEENABLE     : integer := 0;
		ACTIVE_LOW_WAITREQUEST         : integer := 0;
		ACTIVE_LOW_BEGINTRANSFER       : integer := 0;
		CHIPSELECT_THROUGH_READLATENCY : integer := 0
	);
	port (
		clk_clk                : in  std_logic                     := '0';             --   clk.clk
		reset_reset            : in  std_logic                     := '0';             -- reset.reset
		uas_address            : in  std_logic_vector(18 downto 0) := (others => '0'); --   uas.address
		uas_burstcount         : in  std_logic_vector(1 downto 0)  := (others => '0'); --      .burstcount
		uas_read               : in  std_logic                     := '0';             --      .read
		uas_write              : in  std_logic                     := '0';             --      .write
		uas_waitrequest        : out std_logic;                                        --      .waitrequest
		uas_readdatavalid      : out std_logic;                                        --      .readdatavalid
		uas_byteenable         : in  std_logic_vector(1 downto 0)  := (others => '0'); --      .byteenable
		uas_readdata           : out std_logic_vector(15 downto 0);                    --      .readdata
		uas_writedata          : in  std_logic_vector(15 downto 0) := (others => '0'); --      .writedata
		uas_lock               : in  std_logic                     := '0';             --      .lock
		uas_debugaccess        : in  std_logic                     := '0';             --      .debugaccess
		tcm_write_n_out        : out std_logic;                                        --   tcm.write_n_out
		tcm_chipselect_n_out   : out std_logic;                                        --      .chipselect_n_out
		tcm_outputenable_n_out : out std_logic;                                        --      .outputenable_n_out
		tcm_request            : out std_logic;                                        --      .request
		tcm_grant              : in  std_logic                     := '0';             --      .grant
		tcm_address_out        : out std_logic_vector(18 downto 0);                    --      .address_out
		tcm_byteenable_n_out   : out std_logic_vector(1 downto 0);                     --      .byteenable_n_out
		tcm_data_out           : out std_logic_vector(15 downto 0);                    --      .data_out
		tcm_data_outen         : out std_logic;                                        --      .data_outen
		tcm_data_in            : in  std_logic_vector(15 downto 0) := (others => '0')  --      .data_in
	);
end entity StepperMotorControl_SRAM_CVGX;

architecture rtl of StepperMotorControl_SRAM_CVGX is
	component StepperMotorControl_SRAM_CVGX_tdt is
		port (
			clk                  : in  std_logic                     := 'X';             -- clk
			reset                : in  std_logic                     := 'X';             -- reset
			s0_uav_address       : in  std_logic_vector(18 downto 0) := (others => 'X'); -- address
			s0_uav_burstcount    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- burstcount
			s0_uav_read          : in  std_logic                     := 'X';             -- read
			s0_uav_write         : in  std_logic                     := 'X';             -- write
			s0_uav_waitrequest   : out std_logic;                                        -- waitrequest
			s0_uav_readdatavalid : out std_logic;                                        -- readdatavalid
			s0_uav_byteenable    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			s0_uav_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			s0_uav_writedata     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			s0_uav_lock          : in  std_logic                     := 'X';             -- lock
			s0_uav_debugaccess   : in  std_logic                     := 'X';             -- debugaccess
			m0_uav_address       : out std_logic_vector(18 downto 0);                    -- address
			m0_uav_burstcount    : out std_logic_vector(1 downto 0);                     -- burstcount
			m0_uav_read          : out std_logic;                                        -- read
			m0_uav_write         : out std_logic;                                        -- write
			m0_uav_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			m0_uav_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			m0_uav_byteenable    : out std_logic_vector(1 downto 0);                     -- byteenable
			m0_uav_readdata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- readdata
			m0_uav_writedata     : out std_logic_vector(15 downto 0);                    -- writedata
			m0_uav_lock          : out std_logic;                                        -- lock
			m0_uav_debugaccess   : out std_logic;                                        -- debugaccess
			c0_request           : out std_logic;                                        -- request
			c0_grant             : in  std_logic                     := 'X';             -- grant
			c0_uav_write         : out std_logic                                         -- uav_write
		);
	end component StepperMotorControl_SRAM_CVGX_tdt;

	component altera_merlin_slave_translator is
		generic (
			AV_ADDRESS_W                   : integer := 30;
			AV_DATA_W                      : integer := 32;
			UAV_DATA_W                     : integer := 32;
			AV_BURSTCOUNT_W                : integer := 4;
			AV_BYTEENABLE_W                : integer := 4;
			UAV_BYTEENABLE_W               : integer := 4;
			UAV_ADDRESS_W                  : integer := 32;
			UAV_BURSTCOUNT_W               : integer := 4;
			AV_READLATENCY                 : integer := 0;
			USE_READDATAVALID              : integer := 1;
			USE_WAITREQUEST                : integer := 1;
			USE_UAV_CLKEN                  : integer := 0;
			USE_READRESPONSE               : integer := 0;
			USE_WRITERESPONSE              : integer := 0;
			AV_SYMBOLS_PER_WORD            : integer := 4;
			AV_ADDRESS_SYMBOLS             : integer := 0;
			AV_BURSTCOUNT_SYMBOLS          : integer := 0;
			AV_CONSTANT_BURST_BEHAVIOR     : integer := 0;
			UAV_CONSTANT_BURST_BEHAVIOR    : integer := 0;
			AV_REQUIRE_UNALIGNED_ADDRESSES : integer := 0;
			CHIPSELECT_THROUGH_READLATENCY : integer := 0;
			AV_READ_WAIT_CYCLES            : integer := 0;
			AV_WRITE_WAIT_CYCLES           : integer := 0;
			AV_SETUP_WAIT_CYCLES           : integer := 0;
			AV_DATA_HOLD_CYCLES            : integer := 0
		);
		port (
			clk                      : in  std_logic                     := 'X';             -- clk
			reset                    : in  std_logic                     := 'X';             -- reset
			uav_address              : in  std_logic_vector(18 downto 0) := (others => 'X'); -- address
			uav_burstcount           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- burstcount
			uav_read                 : in  std_logic                     := 'X';             -- read
			uav_write                : in  std_logic                     := 'X';             -- write
			uav_waitrequest          : out std_logic;                                        -- waitrequest
			uav_readdatavalid        : out std_logic;                                        -- readdatavalid
			uav_byteenable           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			uav_readdata             : out std_logic_vector(15 downto 0);                    -- readdata
			uav_writedata            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			uav_lock                 : in  std_logic                     := 'X';             -- lock
			uav_debugaccess          : in  std_logic                     := 'X';             -- debugaccess
			av_address               : out std_logic_vector(18 downto 0);                    -- address
			av_write                 : out std_logic;                                        -- write
			av_readdata              : in  std_logic_vector(15 downto 0) := (others => 'X'); -- readdata
			av_writedata             : out std_logic_vector(15 downto 0);                    -- writedata
			av_byteenable            : out std_logic_vector(1 downto 0);                     -- byteenable
			av_chipselect            : out std_logic;                                        -- chipselect
			av_outputenable          : out std_logic;                                        -- outputenable
			av_read                  : out std_logic;                                        -- read
			av_begintransfer         : out std_logic;                                        -- begintransfer
			av_beginbursttransfer    : out std_logic;                                        -- beginbursttransfer
			av_burstcount            : out std_logic_vector(1 downto 0);                     -- burstcount
			av_readdatavalid         : in  std_logic                     := 'X';             -- readdatavalid
			av_waitrequest           : in  std_logic                     := 'X';             -- waitrequest
			av_writebyteenable       : out std_logic_vector(1 downto 0);                     -- writebyteenable
			av_lock                  : out std_logic;                                        -- lock
			av_clken                 : out std_logic;                                        -- clken
			uav_clken                : in  std_logic                     := 'X';             -- clken
			av_debugaccess           : out std_logic;                                        -- debugaccess
			uav_response             : out std_logic_vector(1 downto 0);                     -- response
			av_response              : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- response
			uav_writeresponserequest : in  std_logic                     := 'X';             -- writeresponserequest
			uav_writeresponsevalid   : out std_logic;                                        -- writeresponsevalid
			av_writeresponserequest  : out std_logic;                                        -- writeresponserequest
			av_writeresponsevalid    : in  std_logic                     := 'X'              -- writeresponsevalid
		);
	end component altera_merlin_slave_translator;

	component StepperMotorControl_SRAM_CVGX_tda is
		port (
			clk                 : in  std_logic                     := 'X';             -- clk
			reset               : in  std_logic                     := 'X';             -- reset
			tcm0_write_n        : out std_logic;                                        -- write_n_out
			tcm0_chipselect_n   : out std_logic;                                        -- chipselect_n_out
			tcm0_outputenable_n : out std_logic;                                        -- outputenable_n_out
			tcm0_request        : out std_logic;                                        -- request
			tcm0_grant          : in  std_logic                     := 'X';             -- grant
			tcm0_address        : out std_logic_vector(18 downto 0);                    -- address_out
			tcm0_byteenable_n   : out std_logic_vector(1 downto 0);                     -- byteenable_n_out
			tcm0_writedata      : out std_logic_vector(15 downto 0);                    -- data_out
			tcm0_data_outen     : out std_logic;                                        -- data_outen
			tcm0_readdata       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_in
			av_write            : in  std_logic                     := 'X';             -- write
			av_chipselect       : in  std_logic                     := 'X';             -- chipselect
			av_outputenable     : in  std_logic                     := 'X';             -- outputenable
			av_address          : in  std_logic_vector(18 downto 0) := (others => 'X'); -- address
			av_byteenable       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			av_writedata        : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			av_readdata         : out std_logic_vector(15 downto 0);                    -- readdata
			c0_request          : in  std_logic                     := 'X';             -- request
			c0_grant            : out std_logic;                                        -- grant
			c0_uav_write        : in  std_logic                     := 'X'              -- uav_write
		);
	end component StepperMotorControl_SRAM_CVGX_tda;

	signal tda_conduit_end_grant                             : std_logic;                     -- tda:c0_grant -> tdt:c0_grant
	signal tdt_conduit_start_uav_write                       : std_logic;                     -- tdt:c0_uav_write -> tda:c0_uav_write
	signal tdt_conduit_start_request                         : std_logic;                     -- tdt:c0_request -> tda:c0_request
	signal tdt_avalon_universal_master_0_waitrequest         : std_logic;                     -- slave_translator:uav_waitrequest -> tdt:m0_uav_waitrequest
	signal tdt_avalon_universal_master_0_burstcount          : std_logic_vector(1 downto 0);  -- tdt:m0_uav_burstcount -> slave_translator:uav_burstcount
	signal tdt_avalon_universal_master_0_writedata           : std_logic_vector(15 downto 0); -- tdt:m0_uav_writedata -> slave_translator:uav_writedata
	signal tdt_avalon_universal_master_0_address             : std_logic_vector(18 downto 0); -- tdt:m0_uav_address -> slave_translator:uav_address
	signal tdt_avalon_universal_master_0_lock                : std_logic;                     -- tdt:m0_uav_lock -> slave_translator:uav_lock
	signal tdt_avalon_universal_master_0_write               : std_logic;                     -- tdt:m0_uav_write -> slave_translator:uav_write
	signal tdt_avalon_universal_master_0_read                : std_logic;                     -- tdt:m0_uav_read -> slave_translator:uav_read
	signal tdt_avalon_universal_master_0_readdata            : std_logic_vector(15 downto 0); -- slave_translator:uav_readdata -> tdt:m0_uav_readdata
	signal tdt_avalon_universal_master_0_debugaccess         : std_logic;                     -- tdt:m0_uav_debugaccess -> slave_translator:uav_debugaccess
	signal tdt_avalon_universal_master_0_byteenable          : std_logic_vector(1 downto 0);  -- tdt:m0_uav_byteenable -> slave_translator:uav_byteenable
	signal tdt_avalon_universal_master_0_readdatavalid       : std_logic;                     -- slave_translator:uav_readdatavalid -> tdt:m0_uav_readdatavalid
	signal slave_translator_avalon_anti_slave_0_writedata    : std_logic_vector(15 downto 0); -- slave_translator:av_writedata -> tda:av_writedata
	signal slave_translator_avalon_anti_slave_0_address      : std_logic_vector(18 downto 0); -- slave_translator:av_address -> tda:av_address
	signal slave_translator_avalon_anti_slave_0_chipselect   : std_logic;                     -- slave_translator:av_chipselect -> tda:av_chipselect
	signal slave_translator_avalon_anti_slave_0_write        : std_logic;                     -- slave_translator:av_write -> tda:av_write
	signal slave_translator_avalon_anti_slave_0_outputenable : std_logic;                     -- slave_translator:av_outputenable -> tda:av_outputenable
	signal slave_translator_avalon_anti_slave_0_readdata     : std_logic_vector(15 downto 0); -- tda:av_readdata -> slave_translator:av_readdata
	signal slave_translator_avalon_anti_slave_0_byteenable   : std_logic_vector(1 downto 0);  -- slave_translator:av_byteenable -> tda:av_byteenable

begin

	tcm_address_w_check : if TCM_ADDRESS_W /= 19 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_data_w_check : if TCM_DATA_W /= 16 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_byteenable_w_check : if TCM_BYTEENABLE_W /= 2 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_read_wait_check : if TCM_READ_WAIT /= 10 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_write_wait_check : if TCM_WRITE_WAIT /= 10 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_setup_wait_check : if TCM_SETUP_WAIT /= 10 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_data_hold_check : if TCM_DATA_HOLD /= 10 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_turnaround_time_check : if TCM_TURNAROUND_TIME /= 2 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_timing_units_check : if TCM_TIMING_UNITS /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_readlatency_check : if TCM_READLATENCY /= 2 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tcm_symbols_per_word_check : if TCM_SYMBOLS_PER_WORD /= 2 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_readdata_check : if USE_READDATA /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_writedata_check : if USE_WRITEDATA /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_read_check : if USE_READ /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_write_check : if USE_WRITE /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_byteenable_check : if USE_BYTEENABLE /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_chipselect_check : if USE_CHIPSELECT /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_lock_check : if USE_LOCK /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_address_check : if USE_ADDRESS /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_waitrequest_check : if USE_WAITREQUEST /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_writebyteenable_check : if USE_WRITEBYTEENABLE /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_outputenable_check : if USE_OUTPUTENABLE /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_resetrequest_check : if USE_RESETREQUEST /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_irq_check : if USE_IRQ /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	use_reset_output_check : if USE_RESET_OUTPUT /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_read_check : if ACTIVE_LOW_READ /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_lock_check : if ACTIVE_LOW_LOCK /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_write_check : if ACTIVE_LOW_WRITE /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_chipselect_check : if ACTIVE_LOW_CHIPSELECT /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_byteenable_check : if ACTIVE_LOW_BYTEENABLE /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_outputenable_check : if ACTIVE_LOW_OUTPUTENABLE /= 1 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_writebyteenable_check : if ACTIVE_LOW_WRITEBYTEENABLE /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_waitrequest_check : if ACTIVE_LOW_WAITREQUEST /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	active_low_begintransfer_check : if ACTIVE_LOW_BEGINTRANSFER /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	chipselect_through_readlatency_check : if CHIPSELECT_THROUGH_READLATENCY /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	tdt : component StepperMotorControl_SRAM_CVGX_tdt
		port map (
			clk                  => clk_clk,                                     --                       clk.clk
			reset                => reset_reset,                                 --                     reset.reset
			s0_uav_address       => uas_address,                                 --  avalon_universal_slave_0.address
			s0_uav_burstcount    => uas_burstcount,                              --                          .burstcount
			s0_uav_read          => uas_read,                                    --                          .read
			s0_uav_write         => uas_write,                                   --                          .write
			s0_uav_waitrequest   => uas_waitrequest,                             --                          .waitrequest
			s0_uav_readdatavalid => uas_readdatavalid,                           --                          .readdatavalid
			s0_uav_byteenable    => uas_byteenable,                              --                          .byteenable
			s0_uav_readdata      => uas_readdata,                                --                          .readdata
			s0_uav_writedata     => uas_writedata,                               --                          .writedata
			s0_uav_lock          => uas_lock,                                    --                          .lock
			s0_uav_debugaccess   => uas_debugaccess,                             --                          .debugaccess
			m0_uav_address       => tdt_avalon_universal_master_0_address,       -- avalon_universal_master_0.address
			m0_uav_burstcount    => tdt_avalon_universal_master_0_burstcount,    --                          .burstcount
			m0_uav_read          => tdt_avalon_universal_master_0_read,          --                          .read
			m0_uav_write         => tdt_avalon_universal_master_0_write,         --                          .write
			m0_uav_waitrequest   => tdt_avalon_universal_master_0_waitrequest,   --                          .waitrequest
			m0_uav_readdatavalid => tdt_avalon_universal_master_0_readdatavalid, --                          .readdatavalid
			m0_uav_byteenable    => tdt_avalon_universal_master_0_byteenable,    --                          .byteenable
			m0_uav_readdata      => tdt_avalon_universal_master_0_readdata,      --                          .readdata
			m0_uav_writedata     => tdt_avalon_universal_master_0_writedata,     --                          .writedata
			m0_uav_lock          => tdt_avalon_universal_master_0_lock,          --                          .lock
			m0_uav_debugaccess   => tdt_avalon_universal_master_0_debugaccess,   --                          .debugaccess
			c0_request           => tdt_conduit_start_request,                   --             conduit_start.request
			c0_grant             => tda_conduit_end_grant,                       --                          .grant
			c0_uav_write         => tdt_conduit_start_uav_write                  --                          .uav_write
		);

	slave_translator : component altera_merlin_slave_translator
		generic map (
			AV_ADDRESS_W                   => 19,
			AV_DATA_W                      => 16,
			UAV_DATA_W                     => 16,
			AV_BURSTCOUNT_W                => 2,
			AV_BYTEENABLE_W                => 2,
			UAV_BYTEENABLE_W               => 2,
			UAV_ADDRESS_W                  => 19,
			UAV_BURSTCOUNT_W               => 2,
			AV_READLATENCY                 => 2,
			USE_READDATAVALID              => 0,
			USE_WAITREQUEST                => 0,
			USE_UAV_CLKEN                  => 0,
			USE_READRESPONSE               => 0,
			USE_WRITERESPONSE              => 0,
			AV_SYMBOLS_PER_WORD            => 2,
			AV_ADDRESS_SYMBOLS             => 1,
			AV_BURSTCOUNT_SYMBOLS          => 1,
			AV_CONSTANT_BURST_BEHAVIOR     => 0,
			UAV_CONSTANT_BURST_BEHAVIOR    => 0,
			AV_REQUIRE_UNALIGNED_ADDRESSES => 0,
			CHIPSELECT_THROUGH_READLATENCY => 0,
			AV_READ_WAIT_CYCLES            => 1,
			AV_WRITE_WAIT_CYCLES           => 1,
			AV_SETUP_WAIT_CYCLES           => 1,
			AV_DATA_HOLD_CYCLES            => 1
		)
		port map (
			clk                      => clk_clk,                                           --                      clk.clk
			reset                    => reset_reset,                                       --                    reset.reset
			uav_address              => tdt_avalon_universal_master_0_address,             -- avalon_universal_slave_0.address
			uav_burstcount           => tdt_avalon_universal_master_0_burstcount,          --                         .burstcount
			uav_read                 => tdt_avalon_universal_master_0_read,                --                         .read
			uav_write                => tdt_avalon_universal_master_0_write,               --                         .write
			uav_waitrequest          => tdt_avalon_universal_master_0_waitrequest,         --                         .waitrequest
			uav_readdatavalid        => tdt_avalon_universal_master_0_readdatavalid,       --                         .readdatavalid
			uav_byteenable           => tdt_avalon_universal_master_0_byteenable,          --                         .byteenable
			uav_readdata             => tdt_avalon_universal_master_0_readdata,            --                         .readdata
			uav_writedata            => tdt_avalon_universal_master_0_writedata,           --                         .writedata
			uav_lock                 => tdt_avalon_universal_master_0_lock,                --                         .lock
			uav_debugaccess          => tdt_avalon_universal_master_0_debugaccess,         --                         .debugaccess
			av_address               => slave_translator_avalon_anti_slave_0_address,      --      avalon_anti_slave_0.address
			av_write                 => slave_translator_avalon_anti_slave_0_write,        --                         .write
			av_readdata              => slave_translator_avalon_anti_slave_0_readdata,     --                         .readdata
			av_writedata             => slave_translator_avalon_anti_slave_0_writedata,    --                         .writedata
			av_byteenable            => slave_translator_avalon_anti_slave_0_byteenable,   --                         .byteenable
			av_chipselect            => slave_translator_avalon_anti_slave_0_chipselect,   --                         .chipselect
			av_outputenable          => slave_translator_avalon_anti_slave_0_outputenable, --                         .outputenable
			av_read                  => open,                                              --              (terminated)
			av_begintransfer         => open,                                              --              (terminated)
			av_beginbursttransfer    => open,                                              --              (terminated)
			av_burstcount            => open,                                              --              (terminated)
			av_readdatavalid         => '0',                                               --              (terminated)
			av_waitrequest           => '0',                                               --              (terminated)
			av_writebyteenable       => open,                                              --              (terminated)
			av_lock                  => open,                                              --              (terminated)
			av_clken                 => open,                                              --              (terminated)
			uav_clken                => '0',                                               --              (terminated)
			av_debugaccess           => open,                                              --              (terminated)
			uav_response             => open,                                              --              (terminated)
			av_response              => "00",                                              --              (terminated)
			uav_writeresponserequest => '0',                                               --              (terminated)
			uav_writeresponsevalid   => open,                                              --              (terminated)
			av_writeresponserequest  => open,                                              --              (terminated)
			av_writeresponsevalid    => '0'                                                --              (terminated)
		);

	tda : component StepperMotorControl_SRAM_CVGX_tda
		port map (
			clk                 => clk_clk,                                           --                       clk.clk
			reset               => reset_reset,                                       --                     reset.reset
			tcm0_write_n        => tcm_write_n_out,                                   -- tristate_conduit_master_0.write_n_out
			tcm0_chipselect_n   => tcm_chipselect_n_out,                              --                          .chipselect_n_out
			tcm0_outputenable_n => tcm_outputenable_n_out,                            --                          .outputenable_n_out
			tcm0_request        => tcm_request,                                       --                          .request
			tcm0_grant          => tcm_grant,                                         --                          .grant
			tcm0_address        => tcm_address_out,                                   --                          .address_out
			tcm0_byteenable_n   => tcm_byteenable_n_out,                              --                          .byteenable_n_out
			tcm0_writedata      => tcm_data_out,                                      --                          .data_out
			tcm0_data_outen     => tcm_data_outen,                                    --                          .data_outen
			tcm0_readdata       => tcm_data_in,                                       --                          .data_in
			av_write            => slave_translator_avalon_anti_slave_0_write,        --            avalon_slave_0.write
			av_chipselect       => slave_translator_avalon_anti_slave_0_chipselect,   --                          .chipselect
			av_outputenable     => slave_translator_avalon_anti_slave_0_outputenable, --                          .outputenable
			av_address          => slave_translator_avalon_anti_slave_0_address,      --                          .address
			av_byteenable       => slave_translator_avalon_anti_slave_0_byteenable,   --                          .byteenable
			av_writedata        => slave_translator_avalon_anti_slave_0_writedata,    --                          .writedata
			av_readdata         => slave_translator_avalon_anti_slave_0_readdata,     --                          .readdata
			c0_request          => tdt_conduit_start_request,                         --               conduit_end.request
			c0_grant            => tda_conduit_end_grant,                             --                          .grant
			c0_uav_write        => tdt_conduit_start_uav_write                        --                          .uav_write
		);

end architecture rtl; -- of StepperMotorControl_SRAM_CVGX
