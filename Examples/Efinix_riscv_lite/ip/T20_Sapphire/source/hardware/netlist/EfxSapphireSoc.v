// Generator : SpinalHDL dev    git head : 81793df2c4f55a20f7eff1130c4bb74a4b11319f
// Component : EfxSapphireSoc
// Git hash  : 55017160b846ea9170b0c51c1dd66bbc35a33b1a

`timescale 1ns/1ps

module EfxSapphireSoc (
  input  wire          io_systemClk,
  input  wire          io_asyncReset,
  input  wire          io_jtag_tms,
  input  wire          io_jtag_tdi,
  output wire          io_jtag_tdo,
  input  wire          io_jtag_tck,
  output reg           io_systemReset,
  output wire          system_uart_0_io_txd,
  input  wire          system_uart_0_io_rxd,
  input  wire [3:0]    system_gpio_0_io_read,
  output wire [3:0]    system_gpio_0_io_write,
  output wire [3:0]    system_gpio_0_io_writeEnable
);
  localparam JtagState_RESET = 4'd0;
  localparam JtagState_IDLE = 4'd1;
  localparam JtagState_IR_SELECT = 4'd2;
  localparam JtagState_IR_CAPTURE = 4'd3;
  localparam JtagState_IR_SHIFT = 4'd4;
  localparam JtagState_IR_EXIT1 = 4'd5;
  localparam JtagState_IR_PAUSE = 4'd6;
  localparam JtagState_IR_EXIT2 = 4'd7;
  localparam JtagState_IR_UPDATE = 4'd8;
  localparam JtagState_DR_SELECT = 4'd9;
  localparam JtagState_DR_CAPTURE = 4'd10;
  localparam JtagState_DR_SHIFT = 4'd11;
  localparam JtagState_DR_EXIT1 = 4'd12;
  localparam JtagState_DR_PAUSE = 4'd13;
  localparam JtagState_DR_EXIT2 = 4'd14;
  localparam JtagState_DR_UPDATE = 4'd15;

  wire                system_cores_0_logic_cpu_iBus_rsp_payload_error;
  wire                system_cores_0_logic_cpu_debug_bus_cmd_payload_wr;
  wire                system_cores_0_logic_cpu_dBus_rsp_ready;
  wire                system_cores_0_logic_cpu_dBus_rsp_error;
  wire                system_softJtag_debug_logic_jtagBridge_io_ctrl_enable;
  wire                system_softJtag_debug_logic_jtagBridge_io_ctrl_capture;
  wire                system_softJtag_debug_logic_jtagBridge_io_ctrl_shift;
  wire                system_softJtag_debug_logic_jtagBridge_io_ctrl_update;
  wire                system_softJtag_debug_logic_jtagBridge_io_ctrl_reset;
  wire                io_asyncReset_asyncAssertSyncDeassert_buffercc_io_dataOut;
  wire                debugCd_logic_outputReset_asyncAssertSyncDeassert_buffercc_io_dataOut;
  wire                system_cores_0_logic_cpu_iBus_cmd_valid;
  wire       [31:0]   system_cores_0_logic_cpu_iBus_cmd_payload_pc;
  wire                system_cores_0_logic_cpu_debug_bus_cmd_ready;
  wire       [31:0]   system_cores_0_logic_cpu_debug_bus_rsp_data;
  wire                system_cores_0_logic_cpu_debug_resetOut;
  wire                system_cores_0_logic_cpu_dBus_cmd_valid;
  wire                system_cores_0_logic_cpu_dBus_cmd_payload_wr;
  wire       [31:0]   system_cores_0_logic_cpu_dBus_cmd_payload_address;
  wire       [31:0]   system_cores_0_logic_cpu_dBus_cmd_payload_data;
  wire       [1:0]    system_cores_0_logic_cpu_dBus_cmd_payload_size;
  wire                system_cores_0_logic_cpu_stopTime;
  wire                system_coreStopTime_buffercc_io_dataOut;
  wire                system_cores_0_debugReset_asyncAssertSyncDeassert_buffercc_io_dataOut;
  wire                system_softJtag_debug_logic_jtagBridge_io_ctrl_tdo;
  wire                system_softJtag_debug_logic_jtagBridge_io_remote_cmd_valid;
  wire                system_softJtag_debug_logic_jtagBridge_io_remote_cmd_payload_last;
  wire       [0:0]    system_softJtag_debug_logic_jtagBridge_io_remote_cmd_payload_fragment;
  wire                system_softJtag_debug_logic_jtagBridge_io_remote_rsp_ready;
  wire                system_softJtag_debug_logic_debugger_io_remote_cmd_ready;
  wire                system_softJtag_debug_logic_debugger_io_remote_rsp_valid;
  wire                system_softJtag_debug_logic_debugger_io_remote_rsp_payload_error;
  wire       [31:0]   system_softJtag_debug_logic_debugger_io_remote_rsp_payload_data;
  wire                system_softJtag_debug_logic_debugger_io_mem_cmd_valid;
  wire       [31:0]   system_softJtag_debug_logic_debugger_io_mem_cmd_payload_address;
  wire       [31:0]   system_softJtag_debug_logic_debugger_io_mem_cmd_payload_data;
  wire                system_softJtag_debug_logic_debugger_io_mem_cmd_payload_wr;
  wire       [1:0]    system_softJtag_debug_logic_debugger_io_mem_cmd_payload_size;
  wire                system_bridge_bmb_arbiter_io_inputs_0_cmd_ready;
  wire                system_bridge_bmb_arbiter_io_inputs_0_rsp_valid;
  wire                system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_last;
  wire       [0:0]    system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data;
  wire       [0:0]    system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context;
  wire                system_bridge_bmb_arbiter_io_inputs_1_cmd_ready;
  wire                system_bridge_bmb_arbiter_io_inputs_1_rsp_valid;
  wire                system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_last;
  wire       [0:0]    system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data;
  wire                system_bridge_bmb_arbiter_io_output_cmd_valid;
  wire                system_bridge_bmb_arbiter_io_output_cmd_payload_last;
  wire       [0:0]    system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_source;
  wire       [0:0]    system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_address;
  wire       [1:0]    system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_length;
  wire       [31:0]   system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_data;
  wire       [3:0]    system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_mask;
  wire       [0:0]    system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_context;
  wire                system_bridge_bmb_arbiter_io_output_rsp_ready;
  wire                system_cores_0_iBus_decoder_io_input_cmd_ready;
  wire                system_cores_0_iBus_decoder_io_input_rsp_valid;
  wire                system_cores_0_iBus_decoder_io_input_rsp_payload_last;
  wire       [0:0]    system_cores_0_iBus_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_iBus_decoder_io_input_rsp_payload_fragment_data;
  wire                system_cores_0_iBus_decoder_io_outputs_0_cmd_valid;
  wire                system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire                system_cores_0_iBus_decoder_io_outputs_0_rsp_ready;
  wire                system_bridge_bmb_decoder_io_input_cmd_ready;
  wire                system_bridge_bmb_decoder_io_input_rsp_valid;
  wire                system_bridge_bmb_decoder_io_input_rsp_payload_last;
  wire       [0:0]    system_bridge_bmb_decoder_io_input_rsp_payload_fragment_source;
  wire       [0:0]    system_bridge_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_decoder_io_input_rsp_payload_fragment_data;
  wire       [0:0]    system_bridge_bmb_decoder_io_input_rsp_payload_fragment_context;
  wire                system_bridge_bmb_decoder_io_outputs_0_cmd_valid;
  wire                system_bridge_bmb_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_source;
  wire       [0:0]    system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire       [31:0]   system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_data;
  wire       [3:0]    system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask;
  wire       [0:0]    system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_context;
  wire                system_bridge_bmb_decoder_io_outputs_0_rsp_ready;
  wire                system_bridge_bmb_decoder_io_outputs_1_cmd_valid;
  wire                system_bridge_bmb_decoder_io_outputs_1_cmd_payload_last;
  wire       [0:0]    system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_source;
  wire       [0:0]    system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_address;
  wire       [1:0]    system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_length;
  wire       [31:0]   system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_data;
  wire       [3:0]    system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_mask;
  wire       [0:0]    system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_context;
  wire                system_bridge_bmb_decoder_io_outputs_1_rsp_ready;
  wire                bmbDecoder_4_io_input_cmd_ready;
  wire                bmbDecoder_4_io_input_rsp_valid;
  wire                bmbDecoder_4_io_input_rsp_payload_last;
  wire       [0:0]    bmbDecoder_4_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   bmbDecoder_4_io_input_rsp_payload_fragment_data;
  wire                bmbDecoder_4_io_outputs_0_cmd_valid;
  wire                bmbDecoder_4_io_outputs_0_cmd_payload_last;
  wire       [0:0]    bmbDecoder_4_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   bmbDecoder_4_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    bmbDecoder_4_io_outputs_0_cmd_payload_fragment_length;
  wire       [31:0]   bmbDecoder_4_io_outputs_0_cmd_payload_fragment_data;
  wire       [3:0]    bmbDecoder_4_io_outputs_0_cmd_payload_fragment_mask;
  wire                bmbDecoder_4_io_outputs_0_rsp_ready;
  wire                system_ramA_logic_io_bus_cmd_ready;
  wire                system_ramA_logic_io_bus_rsp_valid;
  wire                system_ramA_logic_io_bus_rsp_payload_last;
  wire       [0:0]    system_ramA_logic_io_bus_rsp_payload_fragment_source;
  wire       [0:0]    system_ramA_logic_io_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_ramA_logic_io_bus_rsp_payload_fragment_data;
  wire       [0:0]    system_ramA_logic_io_bus_rsp_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_decoder_io_input_cmd_ready;
  wire                system_bmbPeripheral_bmb_decoder_io_input_rsp_valid;
  wire                system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_data;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_valid;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_data;
  wire       [3:0]    system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_0_rsp_ready;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_valid;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_data;
  wire       [3:0]    system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_mask;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_1_rsp_ready;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_valid;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_data;
  wire       [3:0]    system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_mask;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_2_rsp_ready;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_valid;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_data;
  wire       [3:0]    system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_mask;
  wire       [0:0]    system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_decoder_io_outputs_3_rsp_ready;
  wire                system_clint_logic_io_bus_cmd_ready;
  wire                system_clint_logic_io_bus_rsp_valid;
  wire                system_clint_logic_io_bus_rsp_payload_last;
  wire       [0:0]    system_clint_logic_io_bus_rsp_payload_fragment_source;
  wire       [0:0]    system_clint_logic_io_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_clint_logic_io_bus_rsp_payload_fragment_data;
  wire       [0:0]    system_clint_logic_io_bus_rsp_payload_fragment_context;
  wire       [0:0]    system_clint_logic_io_timerInterrupt;
  wire       [0:0]    system_clint_logic_io_softwareInterrupt;
  wire       [63:0]   system_clint_logic_io_time;
  wire                system_uart_0_io_logic_io_bus_cmd_ready;
  wire                system_uart_0_io_logic_io_bus_rsp_valid;
  wire                system_uart_0_io_logic_io_bus_rsp_payload_last;
  wire       [0:0]    system_uart_0_io_logic_io_bus_rsp_payload_fragment_source;
  wire       [0:0]    system_uart_0_io_logic_io_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_uart_0_io_logic_io_bus_rsp_payload_fragment_data;
  wire       [0:0]    system_uart_0_io_logic_io_bus_rsp_payload_fragment_context;
  wire                system_uart_0_io_logic_io_uart_txd;
  wire                system_uart_0_io_logic_io_interrupt;
  wire       [3:0]    system_gpio_0_io_logic_io_gpio_write;
  wire       [3:0]    system_gpio_0_io_logic_io_gpio_writeEnable;
  wire                system_gpio_0_io_logic_io_bus_cmd_ready;
  wire                system_gpio_0_io_logic_io_bus_rsp_valid;
  wire                system_gpio_0_io_logic_io_bus_rsp_payload_last;
  wire       [0:0]    system_gpio_0_io_logic_io_bus_rsp_payload_fragment_source;
  wire       [0:0]    system_gpio_0_io_logic_io_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_gpio_0_io_logic_io_bus_rsp_payload_fragment_data;
  wire       [0:0]    system_gpio_0_io_logic_io_bus_rsp_payload_fragment_context;
  wire       [3:0]    system_gpio_0_io_logic_io_interrupt;
  wire       [29:0]   _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_address;
  wire       [6:0]    _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask_1;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_isBypass;
  wire       [1:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_instructionShift;
  reg                 system_coreStopTime;
  reg                 debugCd_logic_inputResetTrigger;
  reg                 debugCd_logic_outputResetUnbuffered;
  reg        [11:0]   debugCd_logic_holdingLogic_resetCounter;
  wire                when_ClockDomainGenerator_l222;
  reg                 debugCd_logic_outputReset;
  wire                io_asyncReset_asyncAssertSyncDeassert;
  wire                debugCd_logic_inputResetAdapter_stuff_syncTrigger;
  reg                 systemCd_logic_inputResetTrigger;
  reg                 systemCd_logic_outputResetUnbuffered;
  reg        [5:0]    systemCd_logic_holdingLogic_resetCounter;
  wire                when_ClockDomainGenerator_l222_1;
  reg                 systemCd_logic_outputReset;
  wire                debugCd_logic_outputReset_asyncAssertSyncDeassert;
  wire                system_cores_0_iBus_cmd_valid;
  wire                system_cores_0_iBus_cmd_ready;
  wire                system_cores_0_iBus_cmd_payload_last;
  wire       [0:0]    system_cores_0_iBus_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_iBus_cmd_payload_fragment_address;
  wire       [1:0]    system_cores_0_iBus_cmd_payload_fragment_length;
  wire                system_cores_0_iBus_rsp_valid;
  wire                system_cores_0_iBus_rsp_ready;
  wire                system_cores_0_iBus_rsp_payload_last;
  wire       [0:0]    system_cores_0_iBus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_iBus_rsp_payload_fragment_data;
  wire                system_cores_0_dBus_cmd_valid;
  wire                system_cores_0_dBus_cmd_ready;
  wire                system_cores_0_dBus_cmd_payload_last;
  wire       [0:0]    system_cores_0_dBus_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_dBus_cmd_payload_fragment_address;
  wire       [1:0]    system_cores_0_dBus_cmd_payload_fragment_length;
  wire       [31:0]   system_cores_0_dBus_cmd_payload_fragment_data;
  wire       [3:0]    system_cores_0_dBus_cmd_payload_fragment_mask;
  wire       [0:0]    system_cores_0_dBus_cmd_payload_fragment_context;
  wire                system_cores_0_dBus_rsp_valid;
  wire                system_cores_0_dBus_rsp_ready;
  wire                system_cores_0_dBus_rsp_payload_last;
  wire       [0:0]    system_cores_0_dBus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_dBus_rsp_payload_fragment_data;
  wire       [0:0]    system_cores_0_dBus_rsp_payload_fragment_context;
  reg        [1:0]    _zz_system_cores_0_dBus_cmd_payload_fragment_length;
  reg        [3:0]    _zz_system_cores_0_dBus_cmd_payload_fragment_mask;
  reg                 system_cores_0_debugReset;
  wire                system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_valid;
  wire                system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_ready;
  wire                system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_last;
  wire       [0:0]    system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_address;
  wire       [1:0]    system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_length;
  wire       [31:0]   system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_data;
  wire       [3:0]    system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_mask;
  wire       [0:0]    system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_context;
  wire                system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_valid;
  wire                system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready;
  wire                system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_last;
  wire       [0:0]    system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_data;
  wire       [0:0]    system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_context;
  wire                system_cores_0_dBus_cmd_s2mPipe_valid;
  reg                 system_cores_0_dBus_cmd_s2mPipe_ready;
  wire                system_cores_0_dBus_cmd_s2mPipe_payload_last;
  wire       [0:0]    system_cores_0_dBus_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_dBus_cmd_s2mPipe_payload_fragment_address;
  wire       [1:0]    system_cores_0_dBus_cmd_s2mPipe_payload_fragment_length;
  wire       [31:0]   system_cores_0_dBus_cmd_s2mPipe_payload_fragment_data;
  wire       [3:0]    system_cores_0_dBus_cmd_s2mPipe_payload_fragment_mask;
  wire       [0:0]    system_cores_0_dBus_cmd_s2mPipe_payload_fragment_context;
  reg                 system_cores_0_dBus_cmd_rValidN;
  reg                 system_cores_0_dBus_cmd_rData_last;
  reg        [0:0]    system_cores_0_dBus_cmd_rData_fragment_opcode;
  reg        [31:0]   system_cores_0_dBus_cmd_rData_fragment_address;
  reg        [1:0]    system_cores_0_dBus_cmd_rData_fragment_length;
  reg        [31:0]   system_cores_0_dBus_cmd_rData_fragment_data;
  reg        [3:0]    system_cores_0_dBus_cmd_rData_fragment_mask;
  reg        [0:0]    system_cores_0_dBus_cmd_rData_fragment_context;
  wire                system_cores_0_dBus_cmd_s2mPipe_m2sPipe_valid;
  wire                system_cores_0_dBus_cmd_s2mPipe_m2sPipe_ready;
  wire                system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [1:0]    system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [31:0]   system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [3:0]    system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [0:0]    system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 system_cores_0_dBus_cmd_s2mPipe_rValid;
  reg                 system_cores_0_dBus_cmd_s2mPipe_rData_last;
  reg        [0:0]    system_cores_0_dBus_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   system_cores_0_dBus_cmd_s2mPipe_rData_fragment_address;
  reg        [1:0]    system_cores_0_dBus_cmd_s2mPipe_rData_fragment_length;
  reg        [31:0]   system_cores_0_dBus_cmd_s2mPipe_rData_fragment_data;
  reg        [3:0]    system_cores_0_dBus_cmd_s2mPipe_rData_fragment_mask;
  reg        [0:0]    system_cores_0_dBus_cmd_s2mPipe_rData_fragment_context;
  wire                when_Stream_l375;
  wire                system_peripheralStopTime;
  wire                system_cores_0_debugReset_asyncAssertSyncDeassert;
  wire                system_softJtag_debug_logic_mmMaster_cmd_valid;
  wire                system_softJtag_debug_logic_mmMaster_cmd_ready;
  wire                system_softJtag_debug_logic_mmMaster_cmd_payload_last;
  wire       [0:0]    system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_opcode;
  wire       [31:0]   system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_address;
  wire       [1:0]    system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_length;
  wire       [31:0]   system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_data;
  wire       [3:0]    system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask;
  wire                system_softJtag_debug_logic_mmMaster_rsp_valid;
  wire                system_softJtag_debug_logic_mmMaster_rsp_ready;
  wire                system_softJtag_debug_logic_mmMaster_rsp_payload_last;
  wire       [0:0]    system_softJtag_debug_logic_mmMaster_rsp_payload_fragment_opcode;
  wire       [31:0]   system_softJtag_debug_logic_mmMaster_rsp_payload_fragment_data;
  reg        [3:0]    _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask;
  wire                system_bridge_bmb_cmd_valid;
  wire                system_bridge_bmb_cmd_ready;
  wire                system_bridge_bmb_cmd_payload_last;
  wire       [0:0]    system_bridge_bmb_cmd_payload_fragment_source;
  wire       [0:0]    system_bridge_bmb_cmd_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_cmd_payload_fragment_address;
  wire       [1:0]    system_bridge_bmb_cmd_payload_fragment_length;
  wire       [31:0]   system_bridge_bmb_cmd_payload_fragment_data;
  wire       [3:0]    system_bridge_bmb_cmd_payload_fragment_mask;
  wire       [0:0]    system_bridge_bmb_cmd_payload_fragment_context;
  wire                system_bridge_bmb_rsp_valid;
  wire                system_bridge_bmb_rsp_ready;
  wire                system_bridge_bmb_rsp_payload_last;
  wire       [0:0]    system_bridge_bmb_rsp_payload_fragment_source;
  wire       [0:0]    system_bridge_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bridge_bmb_rsp_payload_fragment_data;
  wire       [0:0]    system_bridge_bmb_rsp_payload_fragment_context;
  wire                system_softJtag_debug_bmb_connector_decoder_cmd_valid;
  wire                system_softJtag_debug_bmb_connector_decoder_cmd_ready;
  wire                system_softJtag_debug_bmb_connector_decoder_cmd_payload_last;
  wire       [0:0]    system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_opcode;
  wire       [31:0]   system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_address;
  wire       [1:0]    system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_length;
  wire       [31:0]   system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_data;
  wire       [3:0]    system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_mask;
  wire                system_softJtag_debug_bmb_connector_decoder_rsp_valid;
  wire                system_softJtag_debug_bmb_connector_decoder_rsp_ready;
  wire                system_softJtag_debug_bmb_connector_decoder_rsp_payload_last;
  wire       [0:0]    system_softJtag_debug_bmb_connector_decoder_rsp_payload_fragment_opcode;
  wire       [31:0]   system_softJtag_debug_bmb_connector_decoder_rsp_payload_fragment_data;
  reg        [3:0]    system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext;
  reg        [3:0]    system_softJtag_jtagTap_logic_tap_tap_fsm_state;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14;
  wire       [3:0]    _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15;
  reg        [3:0]    system_softJtag_jtagTap_logic_tap_tap_instruction;
  reg        [3:0]    system_softJtag_jtagTap_logic_tap_tap_instructionShift;
  reg                 system_softJtag_jtagTap_logic_tap_tap_bypass;
  reg                 system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd;
  reg                 system_softJtag_jtagTap_logic_tap_tap_tdoDr;
  wire                system_softJtag_jtagTap_logic_tap_tap_tdoIr;
  wire                system_softJtag_jtagTap_logic_tap_tap_isBypass;
  reg                 system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd_regNext;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_tdi;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_enable;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_capture;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_shift;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_update;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_reset;
  wire                system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_tdo;
  reg        [31:0]   system_softJtag_jtagTap_logic_tap_idcodeArea_shifter;
  wire                when_JtagTap_l121;
  wire                system_cores_0_iBus_cmd_s2mPipe_valid;
  reg                 system_cores_0_iBus_cmd_s2mPipe_ready;
  wire                system_cores_0_iBus_cmd_s2mPipe_payload_last;
  wire       [0:0]    system_cores_0_iBus_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_iBus_cmd_s2mPipe_payload_fragment_address;
  wire       [1:0]    system_cores_0_iBus_cmd_s2mPipe_payload_fragment_length;
  reg                 system_cores_0_iBus_cmd_rValidN;
  reg                 system_cores_0_iBus_cmd_rData_last;
  reg        [0:0]    system_cores_0_iBus_cmd_rData_fragment_opcode;
  reg        [31:0]   system_cores_0_iBus_cmd_rData_fragment_address;
  reg        [1:0]    system_cores_0_iBus_cmd_rData_fragment_length;
  wire                system_cores_0_iBus_cmd_s2mPipe_m2sPipe_valid;
  wire                system_cores_0_iBus_cmd_s2mPipe_m2sPipe_ready;
  wire                system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [1:0]    system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  reg                 system_cores_0_iBus_cmd_s2mPipe_rValid;
  reg                 system_cores_0_iBus_cmd_s2mPipe_rData_last;
  reg        [0:0]    system_cores_0_iBus_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   system_cores_0_iBus_cmd_s2mPipe_rData_fragment_address;
  reg        [1:0]    system_cores_0_iBus_cmd_s2mPipe_rData_fragment_length;
  wire                when_Stream_l375_1;
  wire                system_bmbPeripheral_bmb_cmd_valid;
  wire                system_bmbPeripheral_bmb_cmd_ready;
  wire                system_bmbPeripheral_bmb_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_cmd_payload_fragment_data;
  wire       [3:0]    system_bmbPeripheral_bmb_cmd_payload_fragment_mask;
  wire       [0:0]    system_bmbPeripheral_bmb_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_rsp_valid;
  wire                system_bmbPeripheral_bmb_rsp_ready;
  wire                system_bmbPeripheral_bmb_rsp_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_rsp_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bmbPeripheral_bmb_rsp_payload_fragment_data;
  wire       [0:0]    system_bmbPeripheral_bmb_rsp_payload_fragment_context;
  wire                system_cores_0_debugBmb_cmd_valid;
  wire                system_cores_0_debugBmb_cmd_ready;
  wire                system_cores_0_debugBmb_cmd_payload_last;
  wire       [0:0]    system_cores_0_debugBmb_cmd_payload_fragment_opcode;
  wire       [7:0]    system_cores_0_debugBmb_cmd_payload_fragment_address;
  wire       [1:0]    system_cores_0_debugBmb_cmd_payload_fragment_length;
  wire       [31:0]   system_cores_0_debugBmb_cmd_payload_fragment_data;
  wire       [3:0]    system_cores_0_debugBmb_cmd_payload_fragment_mask;
  wire                system_cores_0_debugBmb_rsp_valid;
  wire                system_cores_0_debugBmb_rsp_ready;
  wire                system_cores_0_debugBmb_rsp_payload_last;
  wire       [0:0]    system_cores_0_debugBmb_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_debugBmb_rsp_payload_fragment_data;
  wire                system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [3:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire       [0:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire                system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [7:0]    system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [3:0]    system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire                system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire                debug_bus_cmd_fire;
  reg                 debug_bus_cmd_fire_regNext;
  wire                system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [15:0]   system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [3:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire       [0:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  reg                 _zz_1;
  wire                system_gpio_0_io_interrupts_0;
  wire                system_gpio_0_io_interrupts_1;
  wire                system_gpio_0_io_interrupts_2;
  wire                system_gpio_0_io_interrupts_3;
  wire                system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [15:0]   system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [0:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  reg                 _zz_timerInterrupt;
  reg                 _zz_softwareInterrupt;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [5:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire                _zz_io_bus_rsp_ready;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_valid;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_ready;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_last;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_source;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_opcode;
  wire       [5:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_address;
  wire       [1:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_length;
  wire       [31:0]   system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_data;
  wire       [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_context;
  reg                 system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rValid;
  wire                system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_fire;
  reg                 system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_last;
  reg        [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_source;
  reg        [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_opcode;
  reg        [5:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_address;
  reg        [1:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_length;
  reg        [31:0]   system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_data;
  reg        [0:0]    system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_context;
  wire                _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  reg                 _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid_1;
  reg                 _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  reg        [0:0]    _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  reg        [0:0]    _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  reg        [0:0]    _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire       [1:0]    system_uart_0_io_interrupt_plic_gateway_priority;
  reg                 system_uart_0_io_interrupt_plic_gateway_ip;
  reg                 system_uart_0_io_interrupt_plic_gateway_waitCompletion;
  wire                when_PlicGateway_l21;
  wire                system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [7:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [0:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire       [1:0]    system_gpio_0_io_interrupts_0_plic_gateway_priority;
  reg                 system_gpio_0_io_interrupts_0_plic_gateway_ip;
  reg                 system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion;
  wire                when_PlicGateway_l21_1;
  wire       [1:0]    system_gpio_0_io_interrupts_1_plic_gateway_priority;
  reg                 system_gpio_0_io_interrupts_1_plic_gateway_ip;
  reg                 system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion;
  wire                when_PlicGateway_l21_2;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_valid;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_ready;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode;
  wire       [23:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address;
  wire       [1:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_valid;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_ready;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_payload_last;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_valid_1;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_ready_1;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_1;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_1;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_1;
  wire       [23:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_1;
  wire       [1:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_1;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_1;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_1;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_valid_1;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_ready_1;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_1;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_1;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_1;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_1;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_1;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_valid_2;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_ready_2;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_2;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_2;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_2;
  wire       [23:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_2;
  wire       [1:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_2;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_2;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_2;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_valid_2;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_ready_2;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_2;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_2;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_2;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_2;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_2;
  wire                system_plic_logic_bmb_cmd_valid;
  wire                system_plic_logic_bmb_cmd_ready;
  wire                system_plic_logic_bmb_cmd_payload_last;
  wire       [0:0]    system_plic_logic_bmb_cmd_payload_fragment_source;
  wire       [0:0]    system_plic_logic_bmb_cmd_payload_fragment_opcode;
  wire       [21:0]   system_plic_logic_bmb_cmd_payload_fragment_address;
  wire       [1:0]    system_plic_logic_bmb_cmd_payload_fragment_length;
  wire       [31:0]   system_plic_logic_bmb_cmd_payload_fragment_data;
  wire       [0:0]    system_plic_logic_bmb_cmd_payload_fragment_context;
  wire                system_plic_logic_bmb_rsp_valid;
  wire                system_plic_logic_bmb_rsp_ready;
  wire                system_plic_logic_bmb_rsp_payload_last;
  wire       [0:0]    system_plic_logic_bmb_rsp_payload_fragment_source;
  wire       [0:0]    system_plic_logic_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   system_plic_logic_bmb_rsp_payload_fragment_data;
  wire       [0:0]    system_plic_logic_bmb_rsp_payload_fragment_context;
  wire                system_plic_logic_bus_readErrorFlag;
  wire                system_plic_logic_bus_writeErrorFlag;
  reg                 system_plic_logic_bus_readHaltTrigger;
  wire                system_plic_logic_bus_writeHaltTrigger;
  wire                system_plic_logic_bus_rsp_valid;
  wire                system_plic_logic_bus_rsp_ready;
  wire                system_plic_logic_bus_rsp_payload_last;
  wire       [0:0]    system_plic_logic_bus_rsp_payload_fragment_source;
  reg        [0:0]    system_plic_logic_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   system_plic_logic_bus_rsp_payload_fragment_data;
  wire       [0:0]    system_plic_logic_bus_rsp_payload_fragment_context;
  wire                _zz_system_plic_logic_bus_rsp_ready;
  reg                 _zz_system_plic_logic_bus_rsp_ready_1;
  wire                _zz_system_plic_logic_bmb_rsp_valid;
  reg                 _zz_system_plic_logic_bmb_rsp_valid_1;
  reg                 _zz_system_plic_logic_bmb_rsp_payload_last;
  reg        [0:0]    _zz_system_plic_logic_bmb_rsp_payload_fragment_source;
  reg        [0:0]    _zz_system_plic_logic_bmb_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_system_plic_logic_bmb_rsp_payload_fragment_data;
  reg        [0:0]    _zz_system_plic_logic_bmb_rsp_payload_fragment_context;
  wire                when_Stream_l375_2;
  wire                system_plic_logic_bus_askWrite;
  wire                system_plic_logic_bus_askRead;
  wire                system_plic_logic_bmb_cmd_fire;
  wire                system_plic_logic_bus_doWrite;
  wire                system_plic_logic_bus_doRead;
  wire                when_BmbSlaveFactory_l33;
  wire                when_BmbSlaveFactory_l35;
  wire                system_cores_0_externalInterrupt_plic_target_ie_0;
  wire                system_cores_0_externalInterrupt_plic_target_ie_1;
  wire                system_cores_0_externalInterrupt_plic_target_ie_2;
  wire       [1:0]    system_cores_0_externalInterrupt_plic_target_threshold;
  wire       [1:0]    system_cores_0_externalInterrupt_plic_target_requests_0_priority;
  wire       [3:0]    system_cores_0_externalInterrupt_plic_target_requests_0_id;
  wire                system_cores_0_externalInterrupt_plic_target_requests_0_valid;
  wire       [1:0]    system_cores_0_externalInterrupt_plic_target_requests_1_priority;
  wire       [3:0]    system_cores_0_externalInterrupt_plic_target_requests_1_id;
  wire                system_cores_0_externalInterrupt_plic_target_requests_1_valid;
  wire       [1:0]    system_cores_0_externalInterrupt_plic_target_requests_2_priority;
  wire       [3:0]    system_cores_0_externalInterrupt_plic_target_requests_2_id;
  wire                system_cores_0_externalInterrupt_plic_target_requests_2_valid;
  wire       [1:0]    system_cores_0_externalInterrupt_plic_target_requests_3_priority;
  wire       [3:0]    system_cores_0_externalInterrupt_plic_target_requests_3_id;
  wire                system_cores_0_externalInterrupt_plic_target_requests_3_valid;
  wire                _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id;
  wire       [1:0]    _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority;
  wire                _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid;
  wire                _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id_1;
  wire       [1:0]    _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_1;
  wire                _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid_1;
  wire                _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_2;
  reg        [1:0]    system_cores_0_externalInterrupt_plic_target_bestRequest_priority;
  reg        [3:0]    system_cores_0_externalInterrupt_plic_target_bestRequest_id;
  reg                 system_cores_0_externalInterrupt_plic_target_bestRequest_valid;
  wire                system_cores_0_externalInterrupt_plic_target_iep;
  wire       [3:0]    system_cores_0_externalInterrupt_plic_target_claim;
  reg        [1:0]    _zz_system_uart_0_io_interrupt_plic_gateway_priority;
  reg        [1:0]    _zz_system_gpio_0_io_interrupts_0_plic_gateway_priority;
  reg        [1:0]    _zz_system_gpio_0_io_interrupts_1_plic_gateway_priority;
  reg                 system_plic_logic_bridge_claim_valid;
  reg        [3:0]    system_plic_logic_bridge_claim_payload;
  reg                 system_plic_logic_bridge_completion_valid;
  reg        [3:0]    system_plic_logic_bridge_completion_payload;
  reg                 system_plic_logic_bridge_coherencyStall_willIncrement;
  wire                system_plic_logic_bridge_coherencyStall_willClear;
  reg        [0:0]    system_plic_logic_bridge_coherencyStall_valueNext;
  reg        [0:0]    system_plic_logic_bridge_coherencyStall_value;
  wire                system_plic_logic_bridge_coherencyStall_willOverflowIfInc;
  wire                system_plic_logic_bridge_coherencyStall_willOverflow;
  wire                when_PlicMapper_l122;
  reg        [1:0]    _zz_system_cores_0_externalInterrupt_plic_target_threshold;
  reg                 system_plic_logic_bridge_targetMapping_0_targetCompletion_valid;
  wire       [3:0]    system_plic_logic_bridge_targetMapping_0_targetCompletion_payload;
  reg                 _zz_system_cores_0_externalInterrupt_plic_target_ie_0;
  reg                 _zz_system_cores_0_externalInterrupt_plic_target_ie_1;
  reg                 _zz_system_cores_0_externalInterrupt_plic_target_ie_2;
  reg                 system_cores_0_externalInterrupt_plic_target_iep_regNext;
  wire                system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [21:0]   system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [0:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_valid_3;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_ready_3;
  wire                system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_3;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_3;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_3;
  wire       [23:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_3;
  wire       [1:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_3;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_3;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_3;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_valid_3;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_ready_3;
  wire                system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_3;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_3;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_3;
  wire       [31:0]   system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_3;
  wire       [0:0]    system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_3;
  wire                when_BmbSlaveFactory_l77;
  `ifndef SYNTHESIS
  reg [79:0] system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string;
  reg [79:0] system_softJtag_jtagTap_logic_tap_tap_fsm_state_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string;
  reg [79:0] _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string;
  `endif


  assign _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_address = (system_softJtag_debug_logic_debugger_io_mem_cmd_payload_address >>> 2'd2);
  assign _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask_1 = ({3'd0,_zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask} <<< system_softJtag_debug_logic_debugger_io_mem_cmd_payload_address[1 : 0]);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_isBypass = system_softJtag_jtagTap_logic_tap_tap_instruction;
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_instructionShift = 2'b01;
  (* keep_hierarchy = "TRUE" *) BufferCC_2 io_asyncReset_asyncAssertSyncDeassert_buffercc (
    .io_dataIn     (io_asyncReset_asyncAssertSyncDeassert                    ), //i
    .io_dataOut    (io_asyncReset_asyncAssertSyncDeassert_buffercc_io_dataOut), //o
    .io_systemClk  (io_systemClk                                             ), //i
    .io_asyncReset (io_asyncReset                                            )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_3 debugCd_logic_outputReset_asyncAssertSyncDeassert_buffercc (
    .io_dataIn                 (debugCd_logic_outputReset_asyncAssertSyncDeassert                    ), //i
    .io_dataOut                (debugCd_logic_outputReset_asyncAssertSyncDeassert_buffercc_io_dataOut), //o
    .io_systemClk              (io_systemClk                                                         ), //i
    .debugCd_logic_outputReset (debugCd_logic_outputReset                                            )  //i
  );
  VexRiscv system_cores_0_logic_cpu (
    .iBus_cmd_valid                (system_cores_0_logic_cpu_iBus_cmd_valid                  ), //o
    .iBus_cmd_ready                (system_cores_0_iBus_cmd_ready                            ), //i
    .iBus_cmd_payload_pc           (system_cores_0_logic_cpu_iBus_cmd_payload_pc[31:0]       ), //o
    .iBus_rsp_valid                (system_cores_0_iBus_rsp_valid                            ), //i
    .iBus_rsp_payload_error        (system_cores_0_logic_cpu_iBus_rsp_payload_error          ), //i
    .iBus_rsp_payload_inst         (system_cores_0_iBus_rsp_payload_fragment_data[31:0]      ), //i
    .timerInterrupt                (_zz_timerInterrupt                                       ), //i
    .externalInterrupt             (system_cores_0_externalInterrupt_plic_target_iep_regNext ), //i
    .softwareInterrupt             (_zz_softwareInterrupt                                    ), //i
    .debug_bus_cmd_valid           (system_cores_0_debugBmb_cmd_valid                        ), //i
    .debug_bus_cmd_ready           (system_cores_0_logic_cpu_debug_bus_cmd_ready             ), //o
    .debug_bus_cmd_payload_wr      (system_cores_0_logic_cpu_debug_bus_cmd_payload_wr        ), //i
    .debug_bus_cmd_payload_address (system_cores_0_debugBmb_cmd_payload_fragment_address[7:0]), //i
    .debug_bus_cmd_payload_data    (system_cores_0_debugBmb_cmd_payload_fragment_data[31:0]  ), //i
    .debug_bus_rsp_data            (system_cores_0_logic_cpu_debug_bus_rsp_data[31:0]        ), //o
    .debug_resetOut                (system_cores_0_logic_cpu_debug_resetOut                  ), //o
    .dBus_cmd_valid                (system_cores_0_logic_cpu_dBus_cmd_valid                  ), //o
    .dBus_cmd_ready                (system_cores_0_dBus_cmd_ready                            ), //i
    .dBus_cmd_payload_wr           (system_cores_0_logic_cpu_dBus_cmd_payload_wr             ), //o
    .dBus_cmd_payload_address      (system_cores_0_logic_cpu_dBus_cmd_payload_address[31:0]  ), //o
    .dBus_cmd_payload_data         (system_cores_0_logic_cpu_dBus_cmd_payload_data[31:0]     ), //o
    .dBus_cmd_payload_size         (system_cores_0_logic_cpu_dBus_cmd_payload_size[1:0]      ), //o
    .dBus_rsp_ready                (system_cores_0_logic_cpu_dBus_rsp_ready                  ), //i
    .dBus_rsp_error                (system_cores_0_logic_cpu_dBus_rsp_error                  ), //i
    .dBus_rsp_data                 (system_cores_0_dBus_rsp_payload_fragment_data[31:0]      ), //i
    .stopTime                      (system_cores_0_logic_cpu_stopTime                        ), //o
    .io_systemClk                  (io_systemClk                                             ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                               ), //i
    .debugCd_logic_outputReset     (debugCd_logic_outputReset                                )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_4 system_coreStopTime_buffercc (
    .io_dataIn                  (system_coreStopTime                    ), //i
    .io_dataOut                 (system_coreStopTime_buffercc_io_dataOut), //o
    .io_systemClk               (io_systemClk                           ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset             )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_5 system_cores_0_debugReset_asyncAssertSyncDeassert_buffercc (
    .io_dataIn                 (system_cores_0_debugReset_asyncAssertSyncDeassert                    ), //i
    .io_dataOut                (system_cores_0_debugReset_asyncAssertSyncDeassert_buffercc_io_dataOut), //o
    .io_systemClk              (io_systemClk                                                         ), //i
    .system_cores_0_debugReset (system_cores_0_debugReset                                            )  //i
  );
  JtagBridgeNoTap system_softJtag_debug_logic_jtagBridge (
    .io_ctrl_tdi                    (io_jtag_tdi                                                          ), //i
    .io_ctrl_enable                 (system_softJtag_debug_logic_jtagBridge_io_ctrl_enable                ), //i
    .io_ctrl_capture                (system_softJtag_debug_logic_jtagBridge_io_ctrl_capture               ), //i
    .io_ctrl_shift                  (system_softJtag_debug_logic_jtagBridge_io_ctrl_shift                 ), //i
    .io_ctrl_update                 (system_softJtag_debug_logic_jtagBridge_io_ctrl_update                ), //i
    .io_ctrl_reset                  (system_softJtag_debug_logic_jtagBridge_io_ctrl_reset                 ), //i
    .io_ctrl_tdo                    (system_softJtag_debug_logic_jtagBridge_io_ctrl_tdo                   ), //o
    .io_remote_cmd_valid            (system_softJtag_debug_logic_jtagBridge_io_remote_cmd_valid           ), //o
    .io_remote_cmd_ready            (system_softJtag_debug_logic_debugger_io_remote_cmd_ready             ), //i
    .io_remote_cmd_payload_last     (system_softJtag_debug_logic_jtagBridge_io_remote_cmd_payload_last    ), //o
    .io_remote_cmd_payload_fragment (system_softJtag_debug_logic_jtagBridge_io_remote_cmd_payload_fragment), //o
    .io_remote_rsp_valid            (system_softJtag_debug_logic_debugger_io_remote_rsp_valid             ), //i
    .io_remote_rsp_ready            (system_softJtag_debug_logic_jtagBridge_io_remote_rsp_ready           ), //o
    .io_remote_rsp_payload_error    (system_softJtag_debug_logic_debugger_io_remote_rsp_payload_error     ), //i
    .io_remote_rsp_payload_data     (system_softJtag_debug_logic_debugger_io_remote_rsp_payload_data[31:0]), //i
    .io_systemClk                   (io_systemClk                                                         ), //i
    .debugCd_logic_outputReset      (debugCd_logic_outputReset                                            ), //i
    .io_jtag_tck                    (io_jtag_tck                                                          )  //i
  );
  SystemDebugger system_softJtag_debug_logic_debugger (
    .io_remote_cmd_valid            (system_softJtag_debug_logic_jtagBridge_io_remote_cmd_valid           ), //i
    .io_remote_cmd_ready            (system_softJtag_debug_logic_debugger_io_remote_cmd_ready             ), //o
    .io_remote_cmd_payload_last     (system_softJtag_debug_logic_jtagBridge_io_remote_cmd_payload_last    ), //i
    .io_remote_cmd_payload_fragment (system_softJtag_debug_logic_jtagBridge_io_remote_cmd_payload_fragment), //i
    .io_remote_rsp_valid            (system_softJtag_debug_logic_debugger_io_remote_rsp_valid             ), //o
    .io_remote_rsp_ready            (system_softJtag_debug_logic_jtagBridge_io_remote_rsp_ready           ), //i
    .io_remote_rsp_payload_error    (system_softJtag_debug_logic_debugger_io_remote_rsp_payload_error     ), //o
    .io_remote_rsp_payload_data     (system_softJtag_debug_logic_debugger_io_remote_rsp_payload_data[31:0]), //o
    .io_mem_cmd_valid               (system_softJtag_debug_logic_debugger_io_mem_cmd_valid                ), //o
    .io_mem_cmd_ready               (system_softJtag_debug_logic_mmMaster_cmd_ready                       ), //i
    .io_mem_cmd_payload_address     (system_softJtag_debug_logic_debugger_io_mem_cmd_payload_address[31:0]), //o
    .io_mem_cmd_payload_data        (system_softJtag_debug_logic_debugger_io_mem_cmd_payload_data[31:0]   ), //o
    .io_mem_cmd_payload_wr          (system_softJtag_debug_logic_debugger_io_mem_cmd_payload_wr           ), //o
    .io_mem_cmd_payload_size        (system_softJtag_debug_logic_debugger_io_mem_cmd_payload_size[1:0]    ), //o
    .io_mem_rsp_valid               (system_softJtag_debug_logic_mmMaster_rsp_valid                       ), //i
    .io_mem_rsp_payload             (system_softJtag_debug_logic_mmMaster_rsp_payload_fragment_data[31:0] ), //i
    .io_systemClk                   (io_systemClk                                                         ), //i
    .debugCd_logic_outputReset      (debugCd_logic_outputReset                                            )  //i
  );
  BmbArbiter system_bridge_bmb_arbiter (
    .io_inputs_0_cmd_valid                    (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_valid                         ), //i
    .io_inputs_0_cmd_ready                    (system_bridge_bmb_arbiter_io_inputs_0_cmd_ready                                                  ), //o
    .io_inputs_0_cmd_payload_last             (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_last                  ), //i
    .io_inputs_0_cmd_payload_fragment_opcode  (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_opcode       ), //i
    .io_inputs_0_cmd_payload_fragment_address (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_address[31:0]), //i
    .io_inputs_0_cmd_payload_fragment_length  (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_length[1:0]  ), //i
    .io_inputs_0_cmd_payload_fragment_data    (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_data[31:0]   ), //i
    .io_inputs_0_cmd_payload_fragment_mask    (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_mask[3:0]    ), //i
    .io_inputs_0_cmd_payload_fragment_context (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_context      ), //i
    .io_inputs_0_rsp_valid                    (system_bridge_bmb_arbiter_io_inputs_0_rsp_valid                                                  ), //o
    .io_inputs_0_rsp_ready                    (system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready                         ), //i
    .io_inputs_0_rsp_payload_last             (system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_last                                           ), //o
    .io_inputs_0_rsp_payload_fragment_opcode  (system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode                                ), //o
    .io_inputs_0_rsp_payload_fragment_data    (system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data[31:0]                            ), //o
    .io_inputs_0_rsp_payload_fragment_context (system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context                               ), //o
    .io_inputs_1_cmd_valid                    (system_cores_0_iBus_decoder_io_outputs_0_cmd_valid                                               ), //i
    .io_inputs_1_cmd_ready                    (system_bridge_bmb_arbiter_io_inputs_1_cmd_ready                                                  ), //o
    .io_inputs_1_cmd_payload_last             (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_last                                        ), //i
    .io_inputs_1_cmd_payload_fragment_opcode  (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_opcode                             ), //i
    .io_inputs_1_cmd_payload_fragment_address (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]                      ), //i
    .io_inputs_1_cmd_payload_fragment_length  (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]                        ), //i
    .io_inputs_1_cmd_payload_fragment_data    (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                                                             ), //i
    .io_inputs_1_cmd_payload_fragment_mask    (4'bxxxx                                                                                          ), //i
    .io_inputs_1_rsp_valid                    (system_bridge_bmb_arbiter_io_inputs_1_rsp_valid                                                  ), //o
    .io_inputs_1_rsp_ready                    (system_cores_0_iBus_decoder_io_outputs_0_rsp_ready                                               ), //i
    .io_inputs_1_rsp_payload_last             (system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_last                                           ), //o
    .io_inputs_1_rsp_payload_fragment_opcode  (system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode                                ), //o
    .io_inputs_1_rsp_payload_fragment_data    (system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data[31:0]                            ), //o
    .io_output_cmd_valid                      (system_bridge_bmb_arbiter_io_output_cmd_valid                                                    ), //o
    .io_output_cmd_ready                      (system_bridge_bmb_cmd_ready                                                                      ), //i
    .io_output_cmd_payload_last               (system_bridge_bmb_arbiter_io_output_cmd_payload_last                                             ), //o
    .io_output_cmd_payload_fragment_source    (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_source                                  ), //o
    .io_output_cmd_payload_fragment_opcode    (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode                                  ), //o
    .io_output_cmd_payload_fragment_address   (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_address[31:0]                           ), //o
    .io_output_cmd_payload_fragment_length    (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_length[1:0]                             ), //o
    .io_output_cmd_payload_fragment_data      (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_data[31:0]                              ), //o
    .io_output_cmd_payload_fragment_mask      (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_mask[3:0]                               ), //o
    .io_output_cmd_payload_fragment_context   (system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_context                                 ), //o
    .io_output_rsp_valid                      (system_bridge_bmb_rsp_valid                                                                      ), //i
    .io_output_rsp_ready                      (system_bridge_bmb_arbiter_io_output_rsp_ready                                                    ), //o
    .io_output_rsp_payload_last               (system_bridge_bmb_rsp_payload_last                                                               ), //i
    .io_output_rsp_payload_fragment_source    (system_bridge_bmb_rsp_payload_fragment_source                                                    ), //i
    .io_output_rsp_payload_fragment_opcode    (system_bridge_bmb_rsp_payload_fragment_opcode                                                    ), //i
    .io_output_rsp_payload_fragment_data      (system_bridge_bmb_rsp_payload_fragment_data[31:0]                                                ), //i
    .io_output_rsp_payload_fragment_context   (system_bridge_bmb_rsp_payload_fragment_context                                                   ), //i
    .io_systemClk                             (io_systemClk                                                                                     ), //i
    .systemCd_logic_outputReset               (systemCd_logic_outputReset                                                                       )  //i
  );
  BmbDecoder system_cores_0_iBus_decoder (
    .io_input_cmd_valid                        (system_cores_0_iBus_cmd_s2mPipe_m2sPipe_valid                              ), //i
    .io_input_cmd_ready                        (system_cores_0_iBus_decoder_io_input_cmd_ready                             ), //o
    .io_input_cmd_payload_last                 (system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_last                       ), //i
    .io_input_cmd_payload_fragment_opcode      (system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode            ), //i
    .io_input_cmd_payload_fragment_address     (system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_address[31:0]     ), //i
    .io_input_cmd_payload_fragment_length      (system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_length[1:0]       ), //i
    .io_input_rsp_valid                        (system_cores_0_iBus_decoder_io_input_rsp_valid                             ), //o
    .io_input_rsp_ready                        (system_cores_0_iBus_rsp_ready                                              ), //i
    .io_input_rsp_payload_last                 (system_cores_0_iBus_decoder_io_input_rsp_payload_last                      ), //o
    .io_input_rsp_payload_fragment_opcode      (system_cores_0_iBus_decoder_io_input_rsp_payload_fragment_opcode           ), //o
    .io_input_rsp_payload_fragment_data        (system_cores_0_iBus_decoder_io_input_rsp_payload_fragment_data[31:0]       ), //o
    .io_outputs_0_cmd_valid                    (system_cores_0_iBus_decoder_io_outputs_0_cmd_valid                         ), //o
    .io_outputs_0_cmd_ready                    (system_bridge_bmb_arbiter_io_inputs_1_cmd_ready                            ), //i
    .io_outputs_0_cmd_payload_last             (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_last                  ), //o
    .io_outputs_0_cmd_payload_fragment_opcode  (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_opcode       ), //o
    .io_outputs_0_cmd_payload_fragment_address (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]), //o
    .io_outputs_0_cmd_payload_fragment_length  (system_cores_0_iBus_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]  ), //o
    .io_outputs_0_rsp_valid                    (system_bridge_bmb_arbiter_io_inputs_1_rsp_valid                            ), //i
    .io_outputs_0_rsp_ready                    (system_cores_0_iBus_decoder_io_outputs_0_rsp_ready                         ), //o
    .io_outputs_0_rsp_payload_last             (system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_last                     ), //i
    .io_outputs_0_rsp_payload_fragment_opcode  (system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode          ), //i
    .io_outputs_0_rsp_payload_fragment_data    (system_bridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data[31:0]      )  //i
  );
  BmbDecoder_1 system_bridge_bmb_decoder (
    .io_input_cmd_valid                        (system_bridge_bmb_cmd_valid                                                                    ), //i
    .io_input_cmd_ready                        (system_bridge_bmb_decoder_io_input_cmd_ready                                                   ), //o
    .io_input_cmd_payload_last                 (system_bridge_bmb_cmd_payload_last                                                             ), //i
    .io_input_cmd_payload_fragment_source      (system_bridge_bmb_cmd_payload_fragment_source                                                  ), //i
    .io_input_cmd_payload_fragment_opcode      (system_bridge_bmb_cmd_payload_fragment_opcode                                                  ), //i
    .io_input_cmd_payload_fragment_address     (system_bridge_bmb_cmd_payload_fragment_address[31:0]                                           ), //i
    .io_input_cmd_payload_fragment_length      (system_bridge_bmb_cmd_payload_fragment_length[1:0]                                             ), //i
    .io_input_cmd_payload_fragment_data        (system_bridge_bmb_cmd_payload_fragment_data[31:0]                                              ), //i
    .io_input_cmd_payload_fragment_mask        (system_bridge_bmb_cmd_payload_fragment_mask[3:0]                                               ), //i
    .io_input_cmd_payload_fragment_context     (system_bridge_bmb_cmd_payload_fragment_context                                                 ), //i
    .io_input_rsp_valid                        (system_bridge_bmb_decoder_io_input_rsp_valid                                                   ), //o
    .io_input_rsp_ready                        (system_bridge_bmb_rsp_ready                                                                    ), //i
    .io_input_rsp_payload_last                 (system_bridge_bmb_decoder_io_input_rsp_payload_last                                            ), //o
    .io_input_rsp_payload_fragment_source      (system_bridge_bmb_decoder_io_input_rsp_payload_fragment_source                                 ), //o
    .io_input_rsp_payload_fragment_opcode      (system_bridge_bmb_decoder_io_input_rsp_payload_fragment_opcode                                 ), //o
    .io_input_rsp_payload_fragment_data        (system_bridge_bmb_decoder_io_input_rsp_payload_fragment_data[31:0]                             ), //o
    .io_input_rsp_payload_fragment_context     (system_bridge_bmb_decoder_io_input_rsp_payload_fragment_context                                ), //o
    .io_outputs_0_cmd_valid                    (system_bridge_bmb_decoder_io_outputs_0_cmd_valid                                               ), //o
    .io_outputs_0_cmd_ready                    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready                              ), //i
    .io_outputs_0_cmd_payload_last             (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_last                                        ), //o
    .io_outputs_0_cmd_payload_fragment_source  (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_source                             ), //o
    .io_outputs_0_cmd_payload_fragment_opcode  (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode                             ), //o
    .io_outputs_0_cmd_payload_fragment_address (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]                      ), //o
    .io_outputs_0_cmd_payload_fragment_length  (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]                        ), //o
    .io_outputs_0_cmd_payload_fragment_data    (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_data[31:0]                         ), //o
    .io_outputs_0_cmd_payload_fragment_mask    (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask[3:0]                          ), //o
    .io_outputs_0_cmd_payload_fragment_context (system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_context                            ), //o
    .io_outputs_0_rsp_valid                    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid                              ), //i
    .io_outputs_0_rsp_ready                    (system_bridge_bmb_decoder_io_outputs_0_rsp_ready                                               ), //o
    .io_outputs_0_rsp_payload_last             (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last                       ), //i
    .io_outputs_0_rsp_payload_fragment_source  (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source            ), //i
    .io_outputs_0_rsp_payload_fragment_opcode  (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode            ), //i
    .io_outputs_0_rsp_payload_fragment_data    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data[31:0]        ), //i
    .io_outputs_0_rsp_payload_fragment_context (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context           ), //i
    .io_outputs_1_cmd_valid                    (system_bridge_bmb_decoder_io_outputs_1_cmd_valid                                               ), //o
    .io_outputs_1_cmd_ready                    (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready                      ), //i
    .io_outputs_1_cmd_payload_last             (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_last                                        ), //o
    .io_outputs_1_cmd_payload_fragment_source  (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_source                             ), //o
    .io_outputs_1_cmd_payload_fragment_opcode  (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_opcode                             ), //o
    .io_outputs_1_cmd_payload_fragment_address (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_address[31:0]                      ), //o
    .io_outputs_1_cmd_payload_fragment_length  (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_length[1:0]                        ), //o
    .io_outputs_1_cmd_payload_fragment_data    (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_data[31:0]                         ), //o
    .io_outputs_1_cmd_payload_fragment_mask    (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_mask[3:0]                          ), //o
    .io_outputs_1_cmd_payload_fragment_context (system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_context                            ), //o
    .io_outputs_1_rsp_valid                    (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid                      ), //i
    .io_outputs_1_rsp_ready                    (system_bridge_bmb_decoder_io_outputs_1_rsp_ready                                               ), //o
    .io_outputs_1_rsp_payload_last             (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last               ), //i
    .io_outputs_1_rsp_payload_fragment_source  (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source    ), //i
    .io_outputs_1_rsp_payload_fragment_opcode  (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode    ), //i
    .io_outputs_1_rsp_payload_fragment_data    (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data[31:0]), //i
    .io_outputs_1_rsp_payload_fragment_context (system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context   ), //i
    .io_systemClk                              (io_systemClk                                                                                   ), //i
    .systemCd_logic_outputReset                (systemCd_logic_outputReset                                                                     )  //i
  );
  BmbDecoder_2 bmbDecoder_4 (
    .io_input_cmd_valid                        (system_softJtag_debug_bmb_connector_decoder_cmd_valid                                         ), //i
    .io_input_cmd_ready                        (bmbDecoder_4_io_input_cmd_ready                                                               ), //o
    .io_input_cmd_payload_last                 (system_softJtag_debug_bmb_connector_decoder_cmd_payload_last                                  ), //i
    .io_input_cmd_payload_fragment_opcode      (system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_opcode                       ), //i
    .io_input_cmd_payload_fragment_address     (system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_address[31:0]                ), //i
    .io_input_cmd_payload_fragment_length      (system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_length[1:0]                  ), //i
    .io_input_cmd_payload_fragment_data        (system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_data[31:0]                   ), //i
    .io_input_cmd_payload_fragment_mask        (system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_mask[3:0]                    ), //i
    .io_input_rsp_valid                        (bmbDecoder_4_io_input_rsp_valid                                                               ), //o
    .io_input_rsp_ready                        (system_softJtag_debug_bmb_connector_decoder_rsp_ready                                         ), //i
    .io_input_rsp_payload_last                 (bmbDecoder_4_io_input_rsp_payload_last                                                        ), //o
    .io_input_rsp_payload_fragment_opcode      (bmbDecoder_4_io_input_rsp_payload_fragment_opcode                                             ), //o
    .io_input_rsp_payload_fragment_data        (bmbDecoder_4_io_input_rsp_payload_fragment_data[31:0]                                         ), //o
    .io_outputs_0_cmd_valid                    (bmbDecoder_4_io_outputs_0_cmd_valid                                                           ), //o
    .io_outputs_0_cmd_ready                    (system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready                      ), //i
    .io_outputs_0_cmd_payload_last             (bmbDecoder_4_io_outputs_0_cmd_payload_last                                                    ), //o
    .io_outputs_0_cmd_payload_fragment_opcode  (bmbDecoder_4_io_outputs_0_cmd_payload_fragment_opcode                                         ), //o
    .io_outputs_0_cmd_payload_fragment_address (bmbDecoder_4_io_outputs_0_cmd_payload_fragment_address[31:0]                                  ), //o
    .io_outputs_0_cmd_payload_fragment_length  (bmbDecoder_4_io_outputs_0_cmd_payload_fragment_length[1:0]                                    ), //o
    .io_outputs_0_cmd_payload_fragment_data    (bmbDecoder_4_io_outputs_0_cmd_payload_fragment_data[31:0]                                     ), //o
    .io_outputs_0_cmd_payload_fragment_mask    (bmbDecoder_4_io_outputs_0_cmd_payload_fragment_mask[3:0]                                      ), //o
    .io_outputs_0_rsp_valid                    (system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid                      ), //i
    .io_outputs_0_rsp_ready                    (bmbDecoder_4_io_outputs_0_rsp_ready                                                           ), //o
    .io_outputs_0_rsp_payload_last             (system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last               ), //i
    .io_outputs_0_rsp_payload_fragment_opcode  (system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode    ), //i
    .io_outputs_0_rsp_payload_fragment_data    (system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data[31:0]), //i
    .io_systemClk                              (io_systemClk                                                                                  ), //i
    .debugCd_logic_outputReset                 (debugCd_logic_outputReset                                                                     )  //i
  );
  BmbOnChipRam system_ramA_logic (
    .io_bus_cmd_valid                    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid                         ), //i
    .io_bus_cmd_ready                    (system_ramA_logic_io_bus_cmd_ready                                                        ), //o
    .io_bus_cmd_payload_last             (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last                  ), //i
    .io_bus_cmd_payload_fragment_source  (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source       ), //i
    .io_bus_cmd_payload_fragment_opcode  (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode       ), //i
    .io_bus_cmd_payload_fragment_address (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address[15:0]), //i
    .io_bus_cmd_payload_fragment_length  (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length[1:0]  ), //i
    .io_bus_cmd_payload_fragment_data    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data[31:0]   ), //i
    .io_bus_cmd_payload_fragment_mask    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask[3:0]    ), //i
    .io_bus_cmd_payload_fragment_context (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context      ), //i
    .io_bus_rsp_valid                    (system_ramA_logic_io_bus_rsp_valid                                                        ), //o
    .io_bus_rsp_ready                    (system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready                         ), //i
    .io_bus_rsp_payload_last             (system_ramA_logic_io_bus_rsp_payload_last                                                 ), //o
    .io_bus_rsp_payload_fragment_source  (system_ramA_logic_io_bus_rsp_payload_fragment_source                                      ), //o
    .io_bus_rsp_payload_fragment_opcode  (system_ramA_logic_io_bus_rsp_payload_fragment_opcode                                      ), //o
    .io_bus_rsp_payload_fragment_data    (system_ramA_logic_io_bus_rsp_payload_fragment_data[31:0]                                  ), //o
    .io_bus_rsp_payload_fragment_context (system_ramA_logic_io_bus_rsp_payload_fragment_context                                     ), //o
    .io_systemClk                        (io_systemClk                                                                              ), //i
    .systemCd_logic_outputReset          (systemCd_logic_outputReset                                                                )  //i
  );
  BmbDecoder_3 system_bmbPeripheral_bmb_decoder (
    .io_input_cmd_valid                        (system_bmbPeripheral_bmb_cmd_valid                                              ), //i
    .io_input_cmd_ready                        (system_bmbPeripheral_bmb_decoder_io_input_cmd_ready                             ), //o
    .io_input_cmd_payload_last                 (system_bmbPeripheral_bmb_cmd_payload_last                                       ), //i
    .io_input_cmd_payload_fragment_source      (system_bmbPeripheral_bmb_cmd_payload_fragment_source                            ), //i
    .io_input_cmd_payload_fragment_opcode      (system_bmbPeripheral_bmb_cmd_payload_fragment_opcode                            ), //i
    .io_input_cmd_payload_fragment_address     (system_bmbPeripheral_bmb_cmd_payload_fragment_address[23:0]                     ), //i
    .io_input_cmd_payload_fragment_length      (system_bmbPeripheral_bmb_cmd_payload_fragment_length[1:0]                       ), //i
    .io_input_cmd_payload_fragment_data        (system_bmbPeripheral_bmb_cmd_payload_fragment_data[31:0]                        ), //i
    .io_input_cmd_payload_fragment_mask        (system_bmbPeripheral_bmb_cmd_payload_fragment_mask[3:0]                         ), //i
    .io_input_cmd_payload_fragment_context     (system_bmbPeripheral_bmb_cmd_payload_fragment_context                           ), //i
    .io_input_rsp_valid                        (system_bmbPeripheral_bmb_decoder_io_input_rsp_valid                             ), //o
    .io_input_rsp_ready                        (system_bmbPeripheral_bmb_rsp_ready                                              ), //i
    .io_input_rsp_payload_last                 (system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_last                      ), //o
    .io_input_rsp_payload_fragment_source      (system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_source           ), //o
    .io_input_rsp_payload_fragment_opcode      (system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_opcode           ), //o
    .io_input_rsp_payload_fragment_data        (system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_data[31:0]       ), //o
    .io_input_rsp_payload_fragment_context     (system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_context          ), //o
    .io_outputs_0_cmd_valid                    (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_valid                         ), //o
    .io_outputs_0_cmd_ready                    (system_bmbPeripheral_bmb_withoutMask_cmd_ready_3                                ), //i
    .io_outputs_0_cmd_payload_last             (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_last                  ), //o
    .io_outputs_0_cmd_payload_fragment_source  (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_source       ), //o
    .io_outputs_0_cmd_payload_fragment_opcode  (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode       ), //o
    .io_outputs_0_cmd_payload_fragment_address (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[23:0]), //o
    .io_outputs_0_cmd_payload_fragment_length  (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]  ), //o
    .io_outputs_0_cmd_payload_fragment_data    (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_data[31:0]   ), //o
    .io_outputs_0_cmd_payload_fragment_mask    (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask[3:0]    ), //o
    .io_outputs_0_cmd_payload_fragment_context (system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_context      ), //o
    .io_outputs_0_rsp_valid                    (system_bmbPeripheral_bmb_withoutMask_rsp_valid_3                                ), //i
    .io_outputs_0_rsp_ready                    (system_bmbPeripheral_bmb_decoder_io_outputs_0_rsp_ready                         ), //o
    .io_outputs_0_rsp_payload_last             (system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_3                         ), //i
    .io_outputs_0_rsp_payload_fragment_source  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_3              ), //i
    .io_outputs_0_rsp_payload_fragment_opcode  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_3              ), //i
    .io_outputs_0_rsp_payload_fragment_data    (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_3[31:0]          ), //i
    .io_outputs_0_rsp_payload_fragment_context (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_3             ), //i
    .io_outputs_1_cmd_valid                    (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_valid                         ), //o
    .io_outputs_1_cmd_ready                    (system_bmbPeripheral_bmb_withoutMask_cmd_ready                                  ), //i
    .io_outputs_1_cmd_payload_last             (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_last                  ), //o
    .io_outputs_1_cmd_payload_fragment_source  (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_source       ), //o
    .io_outputs_1_cmd_payload_fragment_opcode  (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_opcode       ), //o
    .io_outputs_1_cmd_payload_fragment_address (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_address[23:0]), //o
    .io_outputs_1_cmd_payload_fragment_length  (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_length[1:0]  ), //o
    .io_outputs_1_cmd_payload_fragment_data    (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_data[31:0]   ), //o
    .io_outputs_1_cmd_payload_fragment_mask    (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_mask[3:0]    ), //o
    .io_outputs_1_cmd_payload_fragment_context (system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_context      ), //o
    .io_outputs_1_rsp_valid                    (system_bmbPeripheral_bmb_withoutMask_rsp_valid                                  ), //i
    .io_outputs_1_rsp_ready                    (system_bmbPeripheral_bmb_decoder_io_outputs_1_rsp_ready                         ), //o
    .io_outputs_1_rsp_payload_last             (system_bmbPeripheral_bmb_withoutMask_rsp_payload_last                           ), //i
    .io_outputs_1_rsp_payload_fragment_source  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source                ), //i
    .io_outputs_1_rsp_payload_fragment_opcode  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode                ), //i
    .io_outputs_1_rsp_payload_fragment_data    (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data[31:0]            ), //i
    .io_outputs_1_rsp_payload_fragment_context (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context               ), //i
    .io_outputs_2_cmd_valid                    (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_valid                         ), //o
    .io_outputs_2_cmd_ready                    (system_bmbPeripheral_bmb_withoutMask_cmd_ready_1                                ), //i
    .io_outputs_2_cmd_payload_last             (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_last                  ), //o
    .io_outputs_2_cmd_payload_fragment_source  (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_source       ), //o
    .io_outputs_2_cmd_payload_fragment_opcode  (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_opcode       ), //o
    .io_outputs_2_cmd_payload_fragment_address (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_address[23:0]), //o
    .io_outputs_2_cmd_payload_fragment_length  (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_length[1:0]  ), //o
    .io_outputs_2_cmd_payload_fragment_data    (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_data[31:0]   ), //o
    .io_outputs_2_cmd_payload_fragment_mask    (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_mask[3:0]    ), //o
    .io_outputs_2_cmd_payload_fragment_context (system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_context      ), //o
    .io_outputs_2_rsp_valid                    (system_bmbPeripheral_bmb_withoutMask_rsp_valid_1                                ), //i
    .io_outputs_2_rsp_ready                    (system_bmbPeripheral_bmb_decoder_io_outputs_2_rsp_ready                         ), //o
    .io_outputs_2_rsp_payload_last             (system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_1                         ), //i
    .io_outputs_2_rsp_payload_fragment_source  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_1              ), //i
    .io_outputs_2_rsp_payload_fragment_opcode  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_1              ), //i
    .io_outputs_2_rsp_payload_fragment_data    (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_1[31:0]          ), //i
    .io_outputs_2_rsp_payload_fragment_context (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_1             ), //i
    .io_outputs_3_cmd_valid                    (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_valid                         ), //o
    .io_outputs_3_cmd_ready                    (system_bmbPeripheral_bmb_withoutMask_cmd_ready_2                                ), //i
    .io_outputs_3_cmd_payload_last             (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_last                  ), //o
    .io_outputs_3_cmd_payload_fragment_source  (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_source       ), //o
    .io_outputs_3_cmd_payload_fragment_opcode  (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_opcode       ), //o
    .io_outputs_3_cmd_payload_fragment_address (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_address[23:0]), //o
    .io_outputs_3_cmd_payload_fragment_length  (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_length[1:0]  ), //o
    .io_outputs_3_cmd_payload_fragment_data    (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_data[31:0]   ), //o
    .io_outputs_3_cmd_payload_fragment_mask    (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_mask[3:0]    ), //o
    .io_outputs_3_cmd_payload_fragment_context (system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_context      ), //o
    .io_outputs_3_rsp_valid                    (system_bmbPeripheral_bmb_withoutMask_rsp_valid_2                                ), //i
    .io_outputs_3_rsp_ready                    (system_bmbPeripheral_bmb_decoder_io_outputs_3_rsp_ready                         ), //o
    .io_outputs_3_rsp_payload_last             (system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_2                         ), //i
    .io_outputs_3_rsp_payload_fragment_source  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_2              ), //i
    .io_outputs_3_rsp_payload_fragment_opcode  (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_2              ), //i
    .io_outputs_3_rsp_payload_fragment_data    (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_2[31:0]          ), //i
    .io_outputs_3_rsp_payload_fragment_context (system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_2             ), //i
    .io_systemClk                              (io_systemClk                                                                    ), //i
    .systemCd_logic_outputReset                (systemCd_logic_outputReset                                                      )  //i
  );
  BmbClint system_clint_logic (
    .io_bus_cmd_valid                    (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid                         ), //i
    .io_bus_cmd_ready                    (system_clint_logic_io_bus_cmd_ready                                                        ), //o
    .io_bus_cmd_payload_last             (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last                  ), //i
    .io_bus_cmd_payload_fragment_source  (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source       ), //i
    .io_bus_cmd_payload_fragment_opcode  (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode       ), //i
    .io_bus_cmd_payload_fragment_address (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address[15:0]), //i
    .io_bus_cmd_payload_fragment_length  (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length[1:0]  ), //i
    .io_bus_cmd_payload_fragment_data    (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data[31:0]   ), //i
    .io_bus_cmd_payload_fragment_context (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context      ), //i
    .io_bus_rsp_valid                    (system_clint_logic_io_bus_rsp_valid                                                        ), //o
    .io_bus_rsp_ready                    (system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready                         ), //i
    .io_bus_rsp_payload_last             (system_clint_logic_io_bus_rsp_payload_last                                                 ), //o
    .io_bus_rsp_payload_fragment_source  (system_clint_logic_io_bus_rsp_payload_fragment_source                                      ), //o
    .io_bus_rsp_payload_fragment_opcode  (system_clint_logic_io_bus_rsp_payload_fragment_opcode                                      ), //o
    .io_bus_rsp_payload_fragment_data    (system_clint_logic_io_bus_rsp_payload_fragment_data[31:0]                                  ), //o
    .io_bus_rsp_payload_fragment_context (system_clint_logic_io_bus_rsp_payload_fragment_context                                     ), //o
    .io_timerInterrupt                   (system_clint_logic_io_timerInterrupt                                                       ), //o
    .io_softwareInterrupt                (system_clint_logic_io_softwareInterrupt                                                    ), //o
    .io_time                             (system_clint_logic_io_time[63:0]                                                           ), //o
    .io_stop                             (1'b0                                                                                       ), //i
    .io_systemClk                        (io_systemClk                                                                               ), //i
    .systemCd_logic_outputReset          (systemCd_logic_outputReset                                                                 )  //i
  );
  BmbUartCtrl system_uart_0_io_logic (
    .io_bus_cmd_valid                    (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_valid                        ), //i
    .io_bus_cmd_ready                    (system_uart_0_io_logic_io_bus_cmd_ready                                                                ), //o
    .io_bus_cmd_payload_last             (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_last                 ), //i
    .io_bus_cmd_payload_fragment_source  (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_source      ), //i
    .io_bus_cmd_payload_fragment_opcode  (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_opcode      ), //i
    .io_bus_cmd_payload_fragment_address (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_address[5:0]), //i
    .io_bus_cmd_payload_fragment_length  (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_length[1:0] ), //i
    .io_bus_cmd_payload_fragment_data    (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_data[31:0]  ), //i
    .io_bus_cmd_payload_fragment_context (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_context     ), //i
    .io_bus_rsp_valid                    (system_uart_0_io_logic_io_bus_rsp_valid                                                                ), //o
    .io_bus_rsp_ready                    (_zz_io_bus_rsp_ready                                                                                   ), //i
    .io_bus_rsp_payload_last             (system_uart_0_io_logic_io_bus_rsp_payload_last                                                         ), //o
    .io_bus_rsp_payload_fragment_source  (system_uart_0_io_logic_io_bus_rsp_payload_fragment_source                                              ), //o
    .io_bus_rsp_payload_fragment_opcode  (system_uart_0_io_logic_io_bus_rsp_payload_fragment_opcode                                              ), //o
    .io_bus_rsp_payload_fragment_data    (system_uart_0_io_logic_io_bus_rsp_payload_fragment_data[31:0]                                          ), //o
    .io_bus_rsp_payload_fragment_context (system_uart_0_io_logic_io_bus_rsp_payload_fragment_context                                             ), //o
    .io_uart_txd                         (system_uart_0_io_logic_io_uart_txd                                                                     ), //o
    .io_uart_rxd                         (system_uart_0_io_rxd                                                                                   ), //i
    .io_interrupt                        (system_uart_0_io_logic_io_interrupt                                                                    ), //o
    .io_systemClk                        (io_systemClk                                                                                           ), //i
    .systemCd_logic_outputReset          (systemCd_logic_outputReset                                                                             )  //i
  );
  BmbGpio2 system_gpio_0_io_logic (
    .io_gpio_read                        (system_gpio_0_io_read[3:0]                                                                    ), //i
    .io_gpio_write                       (system_gpio_0_io_logic_io_gpio_write[3:0]                                                     ), //o
    .io_gpio_writeEnable                 (system_gpio_0_io_logic_io_gpio_writeEnable[3:0]                                               ), //o
    .io_bus_cmd_valid                    (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid                        ), //i
    .io_bus_cmd_ready                    (system_gpio_0_io_logic_io_bus_cmd_ready                                                       ), //o
    .io_bus_cmd_payload_last             (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last                 ), //i
    .io_bus_cmd_payload_fragment_source  (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source      ), //i
    .io_bus_cmd_payload_fragment_opcode  (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode      ), //i
    .io_bus_cmd_payload_fragment_address (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address[7:0]), //i
    .io_bus_cmd_payload_fragment_length  (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length[1:0] ), //i
    .io_bus_cmd_payload_fragment_data    (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data[31:0]  ), //i
    .io_bus_cmd_payload_fragment_context (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context     ), //i
    .io_bus_rsp_valid                    (system_gpio_0_io_logic_io_bus_rsp_valid                                                       ), //o
    .io_bus_rsp_ready                    (system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready                        ), //i
    .io_bus_rsp_payload_last             (system_gpio_0_io_logic_io_bus_rsp_payload_last                                                ), //o
    .io_bus_rsp_payload_fragment_source  (system_gpio_0_io_logic_io_bus_rsp_payload_fragment_source                                     ), //o
    .io_bus_rsp_payload_fragment_opcode  (system_gpio_0_io_logic_io_bus_rsp_payload_fragment_opcode                                     ), //o
    .io_bus_rsp_payload_fragment_data    (system_gpio_0_io_logic_io_bus_rsp_payload_fragment_data[31:0]                                 ), //o
    .io_bus_rsp_payload_fragment_context (system_gpio_0_io_logic_io_bus_rsp_payload_fragment_context                                    ), //o
    .io_interrupt                        (system_gpio_0_io_logic_io_interrupt[3:0]                                                      ), //o
    .io_systemClk                        (io_systemClk                                                                                  ), //i
    .systemCd_logic_outputReset          (systemCd_logic_outputReset                                                                    )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    system_softJtag_jtagTap_logic_tap_tap_fsm_state = {$urandom};
  `endif
    debugCd_logic_holdingLogic_resetCounter = 12'h0;
    debugCd_logic_outputReset = 1'b1;
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext)
      JtagState_RESET : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(system_softJtag_jtagTap_logic_tap_tap_fsm_state)
      JtagState_RESET : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "RESET     ";
      JtagState_IDLE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IDLE      ";
      JtagState_IR_SELECT : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "IR_UPDATE ";
      JtagState_DR_SELECT : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "DR_UPDATE ";
      default : system_softJtag_jtagTap_logic_tap_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15)
      JtagState_RESET : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "RESET     ";
      JtagState_IDLE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "DR_UPDATE ";
      default : _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    debugCd_logic_inputResetTrigger = 1'b0;
    if(debugCd_logic_inputResetAdapter_stuff_syncTrigger) begin
      debugCd_logic_inputResetTrigger = 1'b1;
    end
  end

  always @(*) begin
    debugCd_logic_outputResetUnbuffered = 1'b0;
    if(when_ClockDomainGenerator_l222) begin
      debugCd_logic_outputResetUnbuffered = 1'b1;
    end
  end

  assign when_ClockDomainGenerator_l222 = (debugCd_logic_holdingLogic_resetCounter != 12'hfff);
  assign io_asyncReset_asyncAssertSyncDeassert = (1'b0 ^ 1'b0);
  assign debugCd_logic_inputResetAdapter_stuff_syncTrigger = io_asyncReset_asyncAssertSyncDeassert_buffercc_io_dataOut;
  always @(*) begin
    systemCd_logic_inputResetTrigger = 1'b0;
    if(debugCd_logic_outputReset_asyncAssertSyncDeassert_buffercc_io_dataOut) begin
      systemCd_logic_inputResetTrigger = 1'b1;
    end
    if(system_cores_0_debugReset_asyncAssertSyncDeassert_buffercc_io_dataOut) begin
      systemCd_logic_inputResetTrigger = 1'b1;
    end
  end

  always @(*) begin
    systemCd_logic_outputResetUnbuffered = 1'b0;
    if(when_ClockDomainGenerator_l222_1) begin
      systemCd_logic_outputResetUnbuffered = 1'b1;
    end
  end

  assign when_ClockDomainGenerator_l222_1 = (systemCd_logic_holdingLogic_resetCounter != 6'h3f);
  assign debugCd_logic_outputReset_asyncAssertSyncDeassert = (1'b0 ^ 1'b0);
  always @(*) begin
    system_coreStopTime = 1'b0;
    if(_zz_1) begin
      system_coreStopTime = 1'b1;
    end
  end

  assign system_cores_0_iBus_cmd_valid = system_cores_0_logic_cpu_iBus_cmd_valid;
  assign system_cores_0_iBus_cmd_payload_fragment_opcode = 1'b0;
  assign system_cores_0_iBus_cmd_payload_fragment_address = system_cores_0_logic_cpu_iBus_cmd_payload_pc;
  assign system_cores_0_iBus_cmd_payload_fragment_length = 2'b11;
  assign system_cores_0_iBus_cmd_payload_last = 1'b1;
  assign system_cores_0_logic_cpu_iBus_rsp_payload_error = (system_cores_0_iBus_rsp_payload_fragment_opcode == 1'b1);
  assign system_cores_0_iBus_rsp_ready = 1'b1;
  assign system_cores_0_dBus_cmd_valid = system_cores_0_logic_cpu_dBus_cmd_valid;
  assign system_cores_0_dBus_cmd_payload_last = 1'b1;
  assign system_cores_0_dBus_cmd_payload_fragment_context[0] = system_cores_0_logic_cpu_dBus_cmd_payload_wr;
  assign system_cores_0_dBus_cmd_payload_fragment_opcode = (system_cores_0_logic_cpu_dBus_cmd_payload_wr ? 1'b1 : 1'b0);
  assign system_cores_0_dBus_cmd_payload_fragment_address = system_cores_0_logic_cpu_dBus_cmd_payload_address;
  assign system_cores_0_dBus_cmd_payload_fragment_data = system_cores_0_logic_cpu_dBus_cmd_payload_data;
  always @(*) begin
    case(system_cores_0_logic_cpu_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_system_cores_0_dBus_cmd_payload_fragment_length = 2'b00;
      end
      2'b01 : begin
        _zz_system_cores_0_dBus_cmd_payload_fragment_length = 2'b01;
      end
      default : begin
        _zz_system_cores_0_dBus_cmd_payload_fragment_length = 2'b11;
      end
    endcase
  end

  assign system_cores_0_dBus_cmd_payload_fragment_length = _zz_system_cores_0_dBus_cmd_payload_fragment_length;
  always @(*) begin
    case(system_cores_0_logic_cpu_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_system_cores_0_dBus_cmd_payload_fragment_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_system_cores_0_dBus_cmd_payload_fragment_mask = 4'b0011;
      end
      default : begin
        _zz_system_cores_0_dBus_cmd_payload_fragment_mask = 4'b1111;
      end
    endcase
  end

  assign system_cores_0_dBus_cmd_payload_fragment_mask = (_zz_system_cores_0_dBus_cmd_payload_fragment_mask <<< system_cores_0_logic_cpu_dBus_cmd_payload_address[1 : 0]);
  assign system_cores_0_logic_cpu_dBus_rsp_ready = (system_cores_0_dBus_rsp_valid && (! system_cores_0_dBus_rsp_payload_fragment_context[0]));
  assign system_cores_0_logic_cpu_dBus_rsp_error = (system_cores_0_dBus_rsp_payload_fragment_opcode == 1'b1);
  assign system_cores_0_dBus_rsp_ready = 1'b1;
  assign system_cores_0_dBus_cmd_ready = system_cores_0_dBus_cmd_rValidN;
  assign system_cores_0_dBus_cmd_s2mPipe_valid = (system_cores_0_dBus_cmd_valid || (! system_cores_0_dBus_cmd_rValidN));
  assign system_cores_0_dBus_cmd_s2mPipe_payload_last = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_last : system_cores_0_dBus_cmd_rData_last);
  assign system_cores_0_dBus_cmd_s2mPipe_payload_fragment_opcode = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_fragment_opcode : system_cores_0_dBus_cmd_rData_fragment_opcode);
  assign system_cores_0_dBus_cmd_s2mPipe_payload_fragment_address = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_fragment_address : system_cores_0_dBus_cmd_rData_fragment_address);
  assign system_cores_0_dBus_cmd_s2mPipe_payload_fragment_length = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_fragment_length : system_cores_0_dBus_cmd_rData_fragment_length);
  assign system_cores_0_dBus_cmd_s2mPipe_payload_fragment_data = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_fragment_data : system_cores_0_dBus_cmd_rData_fragment_data);
  assign system_cores_0_dBus_cmd_s2mPipe_payload_fragment_mask = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_fragment_mask : system_cores_0_dBus_cmd_rData_fragment_mask);
  assign system_cores_0_dBus_cmd_s2mPipe_payload_fragment_context = (system_cores_0_dBus_cmd_rValidN ? system_cores_0_dBus_cmd_payload_fragment_context : system_cores_0_dBus_cmd_rData_fragment_context);
  always @(*) begin
    system_cores_0_dBus_cmd_s2mPipe_ready = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l375) begin
      system_cores_0_dBus_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375 = (! system_cores_0_dBus_cmd_s2mPipe_m2sPipe_valid);
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_valid = system_cores_0_dBus_cmd_s2mPipe_rValid;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_last = system_cores_0_dBus_cmd_s2mPipe_rData_last;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = system_cores_0_dBus_cmd_s2mPipe_rData_fragment_opcode;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_address = system_cores_0_dBus_cmd_s2mPipe_rData_fragment_address;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_length = system_cores_0_dBus_cmd_s2mPipe_rData_fragment_length;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_data = system_cores_0_dBus_cmd_s2mPipe_rData_fragment_data;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_mask = system_cores_0_dBus_cmd_s2mPipe_rData_fragment_mask;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_context = system_cores_0_dBus_cmd_s2mPipe_rData_fragment_context;
  assign system_cores_0_dBus_cmd_s2mPipe_m2sPipe_ready = system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_ready;
  assign system_cores_0_dBus_rsp_valid = system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_valid;
  assign system_cores_0_dBus_rsp_payload_last = system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_last;
  assign system_cores_0_dBus_rsp_payload_fragment_opcode = system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_opcode;
  assign system_cores_0_dBus_rsp_payload_fragment_data = system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_data;
  assign system_cores_0_dBus_rsp_payload_fragment_context = system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_context;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_valid = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_valid;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready = system_cores_0_dBus_rsp_ready;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_last = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_last;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_opcode = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_address = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_length = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_data = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_mask = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_context = system_cores_0_dBus_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  assign system_peripheralStopTime = system_coreStopTime_buffercc_io_dataOut;
  assign system_cores_0_debugReset_asyncAssertSyncDeassert = (1'b0 ^ 1'b0);
  assign system_softJtag_debug_logic_mmMaster_cmd_valid = system_softJtag_debug_logic_debugger_io_mem_cmd_valid;
  assign system_softJtag_debug_logic_mmMaster_cmd_payload_last = 1'b1;
  assign system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_length = 2'b11;
  assign system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_opcode = (system_softJtag_debug_logic_debugger_io_mem_cmd_payload_wr ? 1'b1 : 1'b0);
  assign system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_address = {_zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_address,2'b00};
  assign system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_data = system_softJtag_debug_logic_debugger_io_mem_cmd_payload_data;
  always @(*) begin
    case(system_softJtag_debug_logic_debugger_io_mem_cmd_payload_size)
      2'b00 : begin
        _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask = 4'b0011;
      end
      default : begin
        _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask = 4'b1111;
      end
    endcase
  end

  assign system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask = _zz_system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask_1[3:0];
  assign system_softJtag_debug_logic_mmMaster_rsp_ready = 1'b1;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_valid = system_softJtag_debug_logic_mmMaster_cmd_valid;
  assign system_softJtag_debug_logic_mmMaster_cmd_ready = system_softJtag_debug_bmb_connector_decoder_cmd_ready;
  assign system_softJtag_debug_logic_mmMaster_rsp_valid = system_softJtag_debug_bmb_connector_decoder_rsp_valid;
  assign system_softJtag_debug_bmb_connector_decoder_rsp_ready = system_softJtag_debug_logic_mmMaster_rsp_ready;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_payload_last = system_softJtag_debug_logic_mmMaster_cmd_payload_last;
  assign system_softJtag_debug_logic_mmMaster_rsp_payload_last = system_softJtag_debug_bmb_connector_decoder_rsp_payload_last;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_opcode = system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_opcode;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_address = system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_address;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_length = system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_length;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_data = system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_data;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_payload_fragment_mask = system_softJtag_debug_logic_mmMaster_cmd_payload_fragment_mask;
  assign system_softJtag_debug_logic_mmMaster_rsp_payload_fragment_opcode = system_softJtag_debug_bmb_connector_decoder_rsp_payload_fragment_opcode;
  assign system_softJtag_debug_logic_mmMaster_rsp_payload_fragment_data = system_softJtag_debug_bmb_connector_decoder_rsp_payload_fragment_data;
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IDLE);
  always @(*) begin
    case(system_softJtag_jtagTap_logic_tap_tap_fsm_state)
      JtagState_RESET : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext;
      end
      JtagState_IDLE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1;
      end
      JtagState_IR_SELECT : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2;
      end
      JtagState_IR_CAPTURE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3;
      end
      JtagState_IR_SHIFT : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4;
      end
      JtagState_IR_EXIT1 : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5;
      end
      JtagState_IR_PAUSE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6;
      end
      JtagState_IR_EXIT2 : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7;
      end
      JtagState_IR_UPDATE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8;
      end
      JtagState_DR_SELECT : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9;
      end
      JtagState_DR_CAPTURE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10;
      end
      JtagState_DR_SHIFT : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11;
      end
      JtagState_DR_EXIT1 : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12;
      end
      JtagState_DR_PAUSE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13;
      end
      JtagState_DR_EXIT2 : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14;
      end
      JtagState_DR_UPDATE : begin
        system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext = _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15;
      end
      default : begin
      end
    endcase
  end

  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_1 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_2 = (io_jtag_tms ? JtagState_RESET : JtagState_IR_CAPTURE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_3 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_4 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_5 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_PAUSE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_6 = (io_jtag_tms ? JtagState_IR_EXIT2 : JtagState_IR_PAUSE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_7 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_SHIFT);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_8 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_9 = (io_jtag_tms ? JtagState_IR_SELECT : JtagState_DR_CAPTURE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_10 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_11 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_12 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_PAUSE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_13 = (io_jtag_tms ? JtagState_DR_EXIT2 : JtagState_DR_PAUSE);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_14 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_SHIFT);
  assign _zz_system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext_15 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  always @(*) begin
    system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd = system_softJtag_jtagTap_logic_tap_tap_bypass;
    case(system_softJtag_jtagTap_logic_tap_tap_fsm_state)
      JtagState_IR_SHIFT : begin
        system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd = system_softJtag_jtagTap_logic_tap_tap_tdoIr;
      end
      JtagState_DR_SHIFT : begin
        if(system_softJtag_jtagTap_logic_tap_tap_isBypass) begin
          system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd = system_softJtag_jtagTap_logic_tap_tap_bypass;
        end else begin
          system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd = system_softJtag_jtagTap_logic_tap_tap_tdoDr;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_softJtag_jtagTap_logic_tap_tap_tdoDr = 1'b0;
    if(system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_enable) begin
      system_softJtag_jtagTap_logic_tap_tap_tdoDr = system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_tdo;
    end
    if(system_softJtag_debug_logic_jtagBridge_io_ctrl_enable) begin
      system_softJtag_jtagTap_logic_tap_tap_tdoDr = system_softJtag_debug_logic_jtagBridge_io_ctrl_tdo;
    end
  end

  assign system_softJtag_jtagTap_logic_tap_tap_tdoIr = system_softJtag_jtagTap_logic_tap_tap_instructionShift[0];
  assign system_softJtag_jtagTap_logic_tap_tap_isBypass = ($signed(_zz_system_softJtag_jtagTap_logic_tap_tap_isBypass) == $signed(4'b1111));
  assign io_jtag_tdo = system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd_regNext;
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_tdo = system_softJtag_jtagTap_logic_tap_idcodeArea_shifter[0];
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_tdi = io_jtag_tdi;
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_enable = (system_softJtag_jtagTap_logic_tap_tap_instruction == 4'b0101);
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_capture = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_DR_CAPTURE);
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_shift = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_DR_SHIFT);
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_update = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_DR_UPDATE);
  assign system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_reset = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_RESET);
  assign when_JtagTap_l121 = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_RESET);
  assign system_softJtag_debug_logic_jtagBridge_io_ctrl_enable = (system_softJtag_jtagTap_logic_tap_tap_instruction == 4'b1000);
  assign system_softJtag_debug_logic_jtagBridge_io_ctrl_capture = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_DR_CAPTURE);
  assign system_softJtag_debug_logic_jtagBridge_io_ctrl_shift = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_DR_SHIFT);
  assign system_softJtag_debug_logic_jtagBridge_io_ctrl_update = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_DR_UPDATE);
  assign system_softJtag_debug_logic_jtagBridge_io_ctrl_reset = (system_softJtag_jtagTap_logic_tap_tap_fsm_state == JtagState_RESET);
  assign system_bridge_bmb_cmd_valid = system_bridge_bmb_arbiter_io_output_cmd_valid;
  assign system_bridge_bmb_rsp_ready = system_bridge_bmb_arbiter_io_output_rsp_ready;
  assign system_bridge_bmb_cmd_payload_last = system_bridge_bmb_arbiter_io_output_cmd_payload_last;
  assign system_bridge_bmb_cmd_payload_fragment_source = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_source;
  assign system_bridge_bmb_cmd_payload_fragment_opcode = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode;
  assign system_bridge_bmb_cmd_payload_fragment_address = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_address;
  assign system_bridge_bmb_cmd_payload_fragment_length = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_length;
  assign system_bridge_bmb_cmd_payload_fragment_data = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_data;
  assign system_bridge_bmb_cmd_payload_fragment_mask = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_mask;
  assign system_bridge_bmb_cmd_payload_fragment_context = system_bridge_bmb_arbiter_io_output_cmd_payload_fragment_context;
  assign system_softJtag_debug_bmb_connector_decoder_cmd_ready = bmbDecoder_4_io_input_cmd_ready;
  assign system_softJtag_debug_bmb_connector_decoder_rsp_valid = bmbDecoder_4_io_input_rsp_valid;
  assign system_softJtag_debug_bmb_connector_decoder_rsp_payload_last = bmbDecoder_4_io_input_rsp_payload_last;
  assign system_softJtag_debug_bmb_connector_decoder_rsp_payload_fragment_opcode = bmbDecoder_4_io_input_rsp_payload_fragment_opcode;
  assign system_softJtag_debug_bmb_connector_decoder_rsp_payload_fragment_data = bmbDecoder_4_io_input_rsp_payload_fragment_data;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_ready = system_bridge_bmb_arbiter_io_inputs_0_cmd_ready;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_valid = system_bridge_bmb_arbiter_io_inputs_0_rsp_valid;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_last = system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_last;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_opcode = system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_data = system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data;
  assign system_bridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_context = system_bridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context;
  assign system_cores_0_iBus_cmd_ready = system_cores_0_iBus_cmd_rValidN;
  assign system_cores_0_iBus_cmd_s2mPipe_valid = (system_cores_0_iBus_cmd_valid || (! system_cores_0_iBus_cmd_rValidN));
  assign system_cores_0_iBus_cmd_s2mPipe_payload_last = (system_cores_0_iBus_cmd_rValidN ? system_cores_0_iBus_cmd_payload_last : system_cores_0_iBus_cmd_rData_last);
  assign system_cores_0_iBus_cmd_s2mPipe_payload_fragment_opcode = (system_cores_0_iBus_cmd_rValidN ? system_cores_0_iBus_cmd_payload_fragment_opcode : system_cores_0_iBus_cmd_rData_fragment_opcode);
  assign system_cores_0_iBus_cmd_s2mPipe_payload_fragment_address = (system_cores_0_iBus_cmd_rValidN ? system_cores_0_iBus_cmd_payload_fragment_address : system_cores_0_iBus_cmd_rData_fragment_address);
  assign system_cores_0_iBus_cmd_s2mPipe_payload_fragment_length = (system_cores_0_iBus_cmd_rValidN ? system_cores_0_iBus_cmd_payload_fragment_length : system_cores_0_iBus_cmd_rData_fragment_length);
  always @(*) begin
    system_cores_0_iBus_cmd_s2mPipe_ready = system_cores_0_iBus_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l375_1) begin
      system_cores_0_iBus_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_1 = (! system_cores_0_iBus_cmd_s2mPipe_m2sPipe_valid);
  assign system_cores_0_iBus_cmd_s2mPipe_m2sPipe_valid = system_cores_0_iBus_cmd_s2mPipe_rValid;
  assign system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_last = system_cores_0_iBus_cmd_s2mPipe_rData_last;
  assign system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = system_cores_0_iBus_cmd_s2mPipe_rData_fragment_opcode;
  assign system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_address = system_cores_0_iBus_cmd_s2mPipe_rData_fragment_address;
  assign system_cores_0_iBus_cmd_s2mPipe_m2sPipe_payload_fragment_length = system_cores_0_iBus_cmd_s2mPipe_rData_fragment_length;
  assign system_cores_0_iBus_cmd_s2mPipe_m2sPipe_ready = system_cores_0_iBus_decoder_io_input_cmd_ready;
  assign system_cores_0_iBus_rsp_valid = system_cores_0_iBus_decoder_io_input_rsp_valid;
  assign system_cores_0_iBus_rsp_payload_last = system_cores_0_iBus_decoder_io_input_rsp_payload_last;
  assign system_cores_0_iBus_rsp_payload_fragment_opcode = system_cores_0_iBus_decoder_io_input_rsp_payload_fragment_opcode;
  assign system_cores_0_iBus_rsp_payload_fragment_data = system_cores_0_iBus_decoder_io_input_rsp_payload_fragment_data;
  assign system_bridge_bmb_cmd_ready = system_bridge_bmb_decoder_io_input_cmd_ready;
  assign system_bridge_bmb_rsp_valid = system_bridge_bmb_decoder_io_input_rsp_valid;
  assign system_bridge_bmb_rsp_payload_last = system_bridge_bmb_decoder_io_input_rsp_payload_last;
  assign system_bridge_bmb_rsp_payload_fragment_source = system_bridge_bmb_decoder_io_input_rsp_payload_fragment_source;
  assign system_bridge_bmb_rsp_payload_fragment_opcode = system_bridge_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  assign system_bridge_bmb_rsp_payload_fragment_data = system_bridge_bmb_decoder_io_input_rsp_payload_fragment_data;
  assign system_bridge_bmb_rsp_payload_fragment_context = system_bridge_bmb_decoder_io_input_rsp_payload_fragment_context;
  assign system_bmbPeripheral_bmb_cmd_valid = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = system_bmbPeripheral_bmb_cmd_ready;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = system_bmbPeripheral_bmb_rsp_valid;
  assign system_bmbPeripheral_bmb_rsp_ready = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign system_bmbPeripheral_bmb_cmd_payload_last = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = system_bmbPeripheral_bmb_rsp_payload_last;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_source = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_opcode = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_address = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_length = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_data = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_mask = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  assign system_bmbPeripheral_bmb_cmd_payload_fragment_context = system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = system_bmbPeripheral_bmb_rsp_payload_fragment_source;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = system_bmbPeripheral_bmb_rsp_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = system_bmbPeripheral_bmb_rsp_payload_fragment_data;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = system_bmbPeripheral_bmb_rsp_payload_fragment_context;
  assign system_cores_0_debugBmb_cmd_valid = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = system_cores_0_debugBmb_cmd_ready;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = system_cores_0_debugBmb_rsp_valid;
  assign system_cores_0_debugBmb_rsp_ready = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign system_cores_0_debugBmb_cmd_payload_last = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = system_cores_0_debugBmb_rsp_payload_last;
  assign system_cores_0_debugBmb_cmd_payload_fragment_opcode = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign system_cores_0_debugBmb_cmd_payload_fragment_address = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign system_cores_0_debugBmb_cmd_payload_fragment_length = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign system_cores_0_debugBmb_cmd_payload_fragment_data = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign system_cores_0_debugBmb_cmd_payload_fragment_mask = system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = system_cores_0_debugBmb_rsp_payload_fragment_opcode;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = system_cores_0_debugBmb_rsp_payload_fragment_data;
  assign system_cores_0_logic_cpu_debug_bus_cmd_payload_wr = (system_cores_0_debugBmb_cmd_payload_fragment_opcode == 1'b1);
  assign debug_bus_cmd_fire = (system_cores_0_debugBmb_cmd_valid && system_cores_0_logic_cpu_debug_bus_cmd_ready);
  assign system_cores_0_debugBmb_cmd_ready = system_cores_0_logic_cpu_debug_bus_cmd_ready;
  assign system_cores_0_debugBmb_rsp_valid = debug_bus_cmd_fire_regNext;
  assign system_cores_0_debugBmb_rsp_payload_last = 1'b1;
  assign system_cores_0_debugBmb_rsp_payload_fragment_opcode = 1'b0;
  assign system_cores_0_debugBmb_rsp_payload_fragment_data = system_cores_0_logic_cpu_debug_bus_rsp_data;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = system_bridge_bmb_decoder_io_outputs_1_cmd_valid;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = system_bridge_bmb_decoder_io_outputs_1_rsp_ready;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_last;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_source;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_address[23:0];
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_length;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_data;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_mask;
  assign system_bmbPeripheral_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = system_bridge_bmb_decoder_io_outputs_1_cmd_payload_fragment_context;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = system_ramA_logic_io_bus_cmd_ready;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = system_ramA_logic_io_bus_rsp_valid;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = system_ramA_logic_io_bus_rsp_payload_last;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = system_ramA_logic_io_bus_rsp_payload_fragment_source;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = system_ramA_logic_io_bus_rsp_payload_fragment_opcode;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = system_ramA_logic_io_bus_rsp_payload_fragment_data;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = system_ramA_logic_io_bus_rsp_payload_fragment_context;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = bmbDecoder_4_io_outputs_0_cmd_valid;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = bmbDecoder_4_io_outputs_0_rsp_ready;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = bmbDecoder_4_io_outputs_0_cmd_payload_last;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = bmbDecoder_4_io_outputs_0_cmd_payload_fragment_opcode;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = bmbDecoder_4_io_outputs_0_cmd_payload_fragment_address[7:0];
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = bmbDecoder_4_io_outputs_0_cmd_payload_fragment_length;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = bmbDecoder_4_io_outputs_0_cmd_payload_fragment_data;
  assign system_cores_0_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = bmbDecoder_4_io_outputs_0_cmd_payload_fragment_mask;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = system_bridge_bmb_decoder_io_outputs_0_cmd_valid;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = system_bridge_bmb_decoder_io_outputs_0_rsp_ready;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_last;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_source;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[15:0];
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_data;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask;
  assign system_ramA_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = system_bridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_context;
  assign system_bmbPeripheral_bmb_cmd_ready = system_bmbPeripheral_bmb_decoder_io_input_cmd_ready;
  assign system_bmbPeripheral_bmb_rsp_valid = system_bmbPeripheral_bmb_decoder_io_input_rsp_valid;
  assign system_bmbPeripheral_bmb_rsp_payload_last = system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_last;
  assign system_bmbPeripheral_bmb_rsp_payload_fragment_source = system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_source;
  assign system_bmbPeripheral_bmb_rsp_payload_fragment_opcode = system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_rsp_payload_fragment_data = system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_data;
  assign system_bmbPeripheral_bmb_rsp_payload_fragment_context = system_bmbPeripheral_bmb_decoder_io_input_rsp_payload_fragment_context;
  assign system_uart_0_io_txd = system_uart_0_io_logic_io_uart_txd;
  assign system_gpio_0_io_write = system_gpio_0_io_logic_io_gpio_write;
  assign system_gpio_0_io_writeEnable = system_gpio_0_io_logic_io_gpio_writeEnable;
  assign system_gpio_0_io_interrupts_0 = system_gpio_0_io_logic_io_interrupt[0];
  assign system_gpio_0_io_interrupts_1 = system_gpio_0_io_logic_io_interrupt[1];
  assign system_gpio_0_io_interrupts_2 = system_gpio_0_io_logic_io_interrupt[2];
  assign system_gpio_0_io_interrupts_3 = system_gpio_0_io_logic_io_interrupt[3];
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = system_clint_logic_io_bus_cmd_ready;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = system_clint_logic_io_bus_rsp_valid;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = system_clint_logic_io_bus_rsp_payload_last;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = system_clint_logic_io_bus_rsp_payload_fragment_source;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = system_clint_logic_io_bus_rsp_payload_fragment_opcode;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = system_clint_logic_io_bus_rsp_payload_fragment_data;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = system_clint_logic_io_bus_rsp_payload_fragment_context;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_fire = (system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_valid && system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_ready);
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = (! system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rValid);
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_valid = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rValid;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_last = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_last;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_source = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_source;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_opcode = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_opcode;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_address = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_address;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_length = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_length;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_data = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_data;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_payload_fragment_context = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_context;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_ready = system_uart_0_io_logic_io_bus_cmd_ready;
  assign _zz_io_bus_rsp_ready = (! _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid_1);
  assign _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid_1;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign when_PlicGateway_l21 = (! system_uart_0_io_interrupt_plic_gateway_waitCompletion);
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = system_gpio_0_io_logic_io_bus_cmd_ready;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = system_gpio_0_io_logic_io_bus_rsp_valid;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = system_gpio_0_io_logic_io_bus_rsp_payload_last;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = system_gpio_0_io_logic_io_bus_rsp_payload_fragment_source;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = system_gpio_0_io_logic_io_bus_rsp_payload_fragment_opcode;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = system_gpio_0_io_logic_io_bus_rsp_payload_fragment_data;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = system_gpio_0_io_logic_io_bus_rsp_payload_fragment_context;
  assign when_PlicGateway_l21_1 = (! system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion);
  assign when_PlicGateway_l21_2 = (! system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion);
  assign system_bmbPeripheral_bmb_withoutMask_cmd_valid = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_valid;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_ready = system_bmbPeripheral_bmb_decoder_io_outputs_1_rsp_ready;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_last = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_last;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_address;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_length;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context = system_bmbPeripheral_bmb_decoder_io_outputs_1_cmd_payload_fragment_context;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = system_bmbPeripheral_bmb_withoutMask_cmd_valid;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_ready = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_valid = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = system_bmbPeripheral_bmb_withoutMask_rsp_ready;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = system_bmbPeripheral_bmb_withoutMask_cmd_payload_last;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_last = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address[15:0];
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data;
  assign system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context = system_clint_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_valid_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_valid;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_ready_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_rsp_ready;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_last;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_address;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_length;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_1 = system_bmbPeripheral_bmb_decoder_io_outputs_2_cmd_payload_fragment_context;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = system_bmbPeripheral_bmb_withoutMask_cmd_valid_1;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_ready_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_valid_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = system_bmbPeripheral_bmb_withoutMask_rsp_ready_1;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_1;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_1;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_1;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_1[5:0];
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_1;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_1;
  assign system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_1;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_1 = system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_valid_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_valid;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_ready_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_rsp_ready;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_last;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_address;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_length;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_2 = system_bmbPeripheral_bmb_decoder_io_outputs_3_cmd_payload_fragment_context;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = system_bmbPeripheral_bmb_withoutMask_cmd_valid_2;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_ready_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_valid_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = system_bmbPeripheral_bmb_withoutMask_rsp_ready_2;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_2;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_2;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_2;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_2[7:0];
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_2;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_2;
  assign system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_2;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_2 = system_gpio_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign system_plic_logic_bus_readErrorFlag = 1'b0;
  assign system_plic_logic_bus_writeErrorFlag = 1'b0;
  always @(*) begin
    system_plic_logic_bus_readHaltTrigger = 1'b0;
    if(when_PlicMapper_l122) begin
      system_plic_logic_bus_readHaltTrigger = 1'b1;
    end
  end

  assign system_plic_logic_bus_writeHaltTrigger = 1'b0;
  assign _zz_system_plic_logic_bus_rsp_ready = (! (system_plic_logic_bus_readHaltTrigger || system_plic_logic_bus_writeHaltTrigger));
  assign system_plic_logic_bus_rsp_ready = (_zz_system_plic_logic_bus_rsp_ready_1 && _zz_system_plic_logic_bus_rsp_ready);
  always @(*) begin
    _zz_system_plic_logic_bus_rsp_ready_1 = system_plic_logic_bmb_rsp_ready;
    if(when_Stream_l375_2) begin
      _zz_system_plic_logic_bus_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l375_2 = (! _zz_system_plic_logic_bmb_rsp_valid);
  assign _zz_system_plic_logic_bmb_rsp_valid = _zz_system_plic_logic_bmb_rsp_valid_1;
  assign system_plic_logic_bmb_rsp_valid = _zz_system_plic_logic_bmb_rsp_valid;
  assign system_plic_logic_bmb_rsp_payload_last = _zz_system_plic_logic_bmb_rsp_payload_last;
  assign system_plic_logic_bmb_rsp_payload_fragment_source = _zz_system_plic_logic_bmb_rsp_payload_fragment_source;
  assign system_plic_logic_bmb_rsp_payload_fragment_opcode = _zz_system_plic_logic_bmb_rsp_payload_fragment_opcode;
  assign system_plic_logic_bmb_rsp_payload_fragment_data = _zz_system_plic_logic_bmb_rsp_payload_fragment_data;
  assign system_plic_logic_bmb_rsp_payload_fragment_context = _zz_system_plic_logic_bmb_rsp_payload_fragment_context;
  assign system_plic_logic_bus_askWrite = (system_plic_logic_bmb_cmd_valid && (system_plic_logic_bmb_cmd_payload_fragment_opcode == 1'b1));
  assign system_plic_logic_bus_askRead = (system_plic_logic_bmb_cmd_valid && (system_plic_logic_bmb_cmd_payload_fragment_opcode == 1'b0));
  assign system_plic_logic_bmb_cmd_fire = (system_plic_logic_bmb_cmd_valid && system_plic_logic_bmb_cmd_ready);
  assign system_plic_logic_bus_doWrite = (system_plic_logic_bmb_cmd_fire && (system_plic_logic_bmb_cmd_payload_fragment_opcode == 1'b1));
  assign system_plic_logic_bus_doRead = (system_plic_logic_bmb_cmd_fire && (system_plic_logic_bmb_cmd_payload_fragment_opcode == 1'b0));
  assign system_plic_logic_bus_rsp_valid = system_plic_logic_bmb_cmd_valid;
  assign system_plic_logic_bmb_cmd_ready = system_plic_logic_bus_rsp_ready;
  assign system_plic_logic_bus_rsp_payload_last = 1'b1;
  assign when_BmbSlaveFactory_l33 = (system_plic_logic_bus_doWrite && system_plic_logic_bus_writeErrorFlag);
  always @(*) begin
    if(when_BmbSlaveFactory_l33) begin
      system_plic_logic_bus_rsp_payload_fragment_opcode = 1'b1;
    end else begin
      if(when_BmbSlaveFactory_l35) begin
        system_plic_logic_bus_rsp_payload_fragment_opcode = 1'b1;
      end else begin
        system_plic_logic_bus_rsp_payload_fragment_opcode = 1'b0;
      end
    end
  end

  assign when_BmbSlaveFactory_l35 = (system_plic_logic_bus_doRead && system_plic_logic_bus_readErrorFlag);
  always @(*) begin
    system_plic_logic_bus_rsp_payload_fragment_data = 32'h0;
    case(system_plic_logic_bmb_cmd_payload_fragment_address)
      22'h000004 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[1 : 0] = system_uart_0_io_interrupt_plic_gateway_priority;
      end
      22'h001000 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[1 : 1] = system_uart_0_io_interrupt_plic_gateway_ip;
        system_plic_logic_bus_rsp_payload_fragment_data[12 : 12] = system_gpio_0_io_interrupts_0_plic_gateway_ip;
        system_plic_logic_bus_rsp_payload_fragment_data[13 : 13] = system_gpio_0_io_interrupts_1_plic_gateway_ip;
      end
      22'h000030 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[1 : 0] = system_gpio_0_io_interrupts_0_plic_gateway_priority;
      end
      22'h000034 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[1 : 0] = system_gpio_0_io_interrupts_1_plic_gateway_priority;
      end
      22'h200000 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[1 : 0] = system_cores_0_externalInterrupt_plic_target_threshold;
      end
      22'h200004 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[3 : 0] = system_cores_0_externalInterrupt_plic_target_claim;
      end
      22'h002000 : begin
        system_plic_logic_bus_rsp_payload_fragment_data[1 : 1] = system_cores_0_externalInterrupt_plic_target_ie_0;
        system_plic_logic_bus_rsp_payload_fragment_data[12 : 12] = system_cores_0_externalInterrupt_plic_target_ie_1;
        system_plic_logic_bus_rsp_payload_fragment_data[13 : 13] = system_cores_0_externalInterrupt_plic_target_ie_2;
      end
      default : begin
      end
    endcase
  end

  assign system_plic_logic_bus_rsp_payload_fragment_context = system_plic_logic_bmb_cmd_payload_fragment_context;
  assign system_plic_logic_bus_rsp_payload_fragment_source = system_plic_logic_bmb_cmd_payload_fragment_source;
  assign system_cores_0_externalInterrupt_plic_target_requests_0_priority = 2'b00;
  assign system_cores_0_externalInterrupt_plic_target_requests_0_id = 4'b0000;
  assign system_cores_0_externalInterrupt_plic_target_requests_0_valid = 1'b1;
  assign system_cores_0_externalInterrupt_plic_target_requests_1_priority = system_uart_0_io_interrupt_plic_gateway_priority;
  assign system_cores_0_externalInterrupt_plic_target_requests_1_id = 4'b0001;
  assign system_cores_0_externalInterrupt_plic_target_requests_1_valid = (system_uart_0_io_interrupt_plic_gateway_ip && system_cores_0_externalInterrupt_plic_target_ie_0);
  assign system_cores_0_externalInterrupt_plic_target_requests_2_priority = system_gpio_0_io_interrupts_0_plic_gateway_priority;
  assign system_cores_0_externalInterrupt_plic_target_requests_2_id = 4'b1100;
  assign system_cores_0_externalInterrupt_plic_target_requests_2_valid = (system_gpio_0_io_interrupts_0_plic_gateway_ip && system_cores_0_externalInterrupt_plic_target_ie_1);
  assign system_cores_0_externalInterrupt_plic_target_requests_3_priority = system_gpio_0_io_interrupts_1_plic_gateway_priority;
  assign system_cores_0_externalInterrupt_plic_target_requests_3_id = 4'b1101;
  assign system_cores_0_externalInterrupt_plic_target_requests_3_valid = (system_gpio_0_io_interrupts_1_plic_gateway_ip && system_cores_0_externalInterrupt_plic_target_ie_2);
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id = ((! system_cores_0_externalInterrupt_plic_target_requests_1_valid) || (system_cores_0_externalInterrupt_plic_target_requests_0_valid && (system_cores_0_externalInterrupt_plic_target_requests_1_priority <= system_cores_0_externalInterrupt_plic_target_requests_0_priority)));
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority = (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id ? system_cores_0_externalInterrupt_plic_target_requests_0_priority : system_cores_0_externalInterrupt_plic_target_requests_1_priority);
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid = (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id ? system_cores_0_externalInterrupt_plic_target_requests_0_valid : system_cores_0_externalInterrupt_plic_target_requests_1_valid);
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id_1 = ((! system_cores_0_externalInterrupt_plic_target_requests_3_valid) || (system_cores_0_externalInterrupt_plic_target_requests_2_valid && (system_cores_0_externalInterrupt_plic_target_requests_3_priority <= system_cores_0_externalInterrupt_plic_target_requests_2_priority)));
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_1 = (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id_1 ? system_cores_0_externalInterrupt_plic_target_requests_2_priority : system_cores_0_externalInterrupt_plic_target_requests_3_priority);
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid_1 = (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id_1 ? system_cores_0_externalInterrupt_plic_target_requests_2_valid : system_cores_0_externalInterrupt_plic_target_requests_3_valid);
  assign _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_2 = ((! _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid_1) || (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid && (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_1 <= _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority)));
  assign system_cores_0_externalInterrupt_plic_target_iep = (system_cores_0_externalInterrupt_plic_target_threshold < system_cores_0_externalInterrupt_plic_target_bestRequest_priority);
  assign system_cores_0_externalInterrupt_plic_target_claim = (system_cores_0_externalInterrupt_plic_target_iep ? system_cores_0_externalInterrupt_plic_target_bestRequest_id : 4'b0000);
  assign system_uart_0_io_interrupt_plic_gateway_priority = _zz_system_uart_0_io_interrupt_plic_gateway_priority;
  assign system_gpio_0_io_interrupts_0_plic_gateway_priority = _zz_system_gpio_0_io_interrupts_0_plic_gateway_priority;
  assign system_gpio_0_io_interrupts_1_plic_gateway_priority = _zz_system_gpio_0_io_interrupts_1_plic_gateway_priority;
  always @(*) begin
    system_plic_logic_bridge_claim_valid = 1'b0;
    case(system_plic_logic_bmb_cmd_payload_fragment_address)
      22'h200004 : begin
        if(system_plic_logic_bus_doRead) begin
          system_plic_logic_bridge_claim_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_plic_logic_bridge_claim_payload = 4'bxxxx;
    case(system_plic_logic_bmb_cmd_payload_fragment_address)
      22'h200004 : begin
        if(system_plic_logic_bus_doRead) begin
          system_plic_logic_bridge_claim_payload = system_cores_0_externalInterrupt_plic_target_claim;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_plic_logic_bridge_completion_valid = 1'b0;
    if(system_plic_logic_bridge_targetMapping_0_targetCompletion_valid) begin
      system_plic_logic_bridge_completion_valid = 1'b1;
    end
  end

  always @(*) begin
    system_plic_logic_bridge_completion_payload = 4'bxxxx;
    if(system_plic_logic_bridge_targetMapping_0_targetCompletion_valid) begin
      system_plic_logic_bridge_completion_payload = system_plic_logic_bridge_targetMapping_0_targetCompletion_payload;
    end
  end

  always @(*) begin
    system_plic_logic_bridge_coherencyStall_willIncrement = 1'b0;
    if(when_PlicMapper_l122) begin
      system_plic_logic_bridge_coherencyStall_willIncrement = 1'b1;
    end
    if(when_BmbSlaveFactory_l77) begin
      if(system_plic_logic_bus_askWrite) begin
        system_plic_logic_bridge_coherencyStall_willIncrement = 1'b1;
      end
      if(system_plic_logic_bus_askRead) begin
        system_plic_logic_bridge_coherencyStall_willIncrement = 1'b1;
      end
    end
  end

  assign system_plic_logic_bridge_coherencyStall_willClear = 1'b0;
  assign system_plic_logic_bridge_coherencyStall_willOverflowIfInc = (system_plic_logic_bridge_coherencyStall_value == 1'b1);
  assign system_plic_logic_bridge_coherencyStall_willOverflow = (system_plic_logic_bridge_coherencyStall_willOverflowIfInc && system_plic_logic_bridge_coherencyStall_willIncrement);
  always @(*) begin
    system_plic_logic_bridge_coherencyStall_valueNext = (system_plic_logic_bridge_coherencyStall_value + system_plic_logic_bridge_coherencyStall_willIncrement);
    if(system_plic_logic_bridge_coherencyStall_willClear) begin
      system_plic_logic_bridge_coherencyStall_valueNext = 1'b0;
    end
  end

  assign when_PlicMapper_l122 = (system_plic_logic_bridge_coherencyStall_value != 1'b0);
  assign system_cores_0_externalInterrupt_plic_target_threshold = _zz_system_cores_0_externalInterrupt_plic_target_threshold;
  always @(*) begin
    system_plic_logic_bridge_targetMapping_0_targetCompletion_valid = 1'b0;
    case(system_plic_logic_bmb_cmd_payload_fragment_address)
      22'h200004 : begin
        if(system_plic_logic_bus_doWrite) begin
          system_plic_logic_bridge_targetMapping_0_targetCompletion_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign system_cores_0_externalInterrupt_plic_target_ie_0 = _zz_system_cores_0_externalInterrupt_plic_target_ie_0;
  assign system_cores_0_externalInterrupt_plic_target_ie_1 = _zz_system_cores_0_externalInterrupt_plic_target_ie_1;
  assign system_cores_0_externalInterrupt_plic_target_ie_2 = _zz_system_cores_0_externalInterrupt_plic_target_ie_2;
  assign system_plic_logic_bmb_cmd_valid = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = system_plic_logic_bmb_cmd_ready;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = system_plic_logic_bmb_rsp_valid;
  assign system_plic_logic_bmb_rsp_ready = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign system_plic_logic_bmb_cmd_payload_last = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = system_plic_logic_bmb_rsp_payload_last;
  assign system_plic_logic_bmb_cmd_payload_fragment_source = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  assign system_plic_logic_bmb_cmd_payload_fragment_opcode = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign system_plic_logic_bmb_cmd_payload_fragment_address = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign system_plic_logic_bmb_cmd_payload_fragment_length = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign system_plic_logic_bmb_cmd_payload_fragment_data = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign system_plic_logic_bmb_cmd_payload_fragment_context = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = system_plic_logic_bmb_rsp_payload_fragment_source;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = system_plic_logic_bmb_rsp_payload_fragment_opcode;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = system_plic_logic_bmb_rsp_payload_fragment_data;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = system_plic_logic_bmb_rsp_payload_fragment_context;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_valid_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_valid;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_ready_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_rsp_ready;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_last;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_address;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_3 = system_bmbPeripheral_bmb_decoder_io_outputs_0_cmd_payload_fragment_context;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = system_bmbPeripheral_bmb_withoutMask_cmd_valid_3;
  assign system_bmbPeripheral_bmb_withoutMask_cmd_ready_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_valid_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = system_bmbPeripheral_bmb_withoutMask_rsp_ready_3;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = system_bmbPeripheral_bmb_withoutMask_cmd_payload_last_3;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_last_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_source_3;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_opcode_3;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_address_3[21:0];
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_length_3;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_data_3;
  assign system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = system_bmbPeripheral_bmb_withoutMask_cmd_payload_fragment_context_3;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_source_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_opcode_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_data_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign system_bmbPeripheral_bmb_withoutMask_rsp_payload_fragment_context_3 = system_plic_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign system_plic_logic_bridge_targetMapping_0_targetCompletion_payload = system_plic_logic_bmb_cmd_payload_fragment_data[3 : 0];
  assign when_BmbSlaveFactory_l77 = 1'b1;
  always @(posedge io_systemClk) begin
    if(when_ClockDomainGenerator_l222) begin
      debugCd_logic_holdingLogic_resetCounter <= (debugCd_logic_holdingLogic_resetCounter + 12'h001);
    end
    if(debugCd_logic_inputResetTrigger) begin
      debugCd_logic_holdingLogic_resetCounter <= 12'h0;
    end
    debugCd_logic_outputReset <= debugCd_logic_outputResetUnbuffered;
  end

  always @(posedge io_systemClk) begin
    if(when_ClockDomainGenerator_l222_1) begin
      systemCd_logic_holdingLogic_resetCounter <= (systemCd_logic_holdingLogic_resetCounter + 6'h01);
    end
    if(systemCd_logic_inputResetTrigger) begin
      systemCd_logic_holdingLogic_resetCounter <= 6'h0;
    end
    systemCd_logic_outputReset <= systemCd_logic_outputResetUnbuffered;
  end

  always @(posedge io_systemClk) begin
    io_systemReset <= systemCd_logic_outputReset;
    if(system_cores_0_dBus_cmd_ready) begin
      system_cores_0_dBus_cmd_rData_last <= system_cores_0_dBus_cmd_payload_last;
      system_cores_0_dBus_cmd_rData_fragment_opcode <= system_cores_0_dBus_cmd_payload_fragment_opcode;
      system_cores_0_dBus_cmd_rData_fragment_address <= system_cores_0_dBus_cmd_payload_fragment_address;
      system_cores_0_dBus_cmd_rData_fragment_length <= system_cores_0_dBus_cmd_payload_fragment_length;
      system_cores_0_dBus_cmd_rData_fragment_data <= system_cores_0_dBus_cmd_payload_fragment_data;
      system_cores_0_dBus_cmd_rData_fragment_mask <= system_cores_0_dBus_cmd_payload_fragment_mask;
      system_cores_0_dBus_cmd_rData_fragment_context <= system_cores_0_dBus_cmd_payload_fragment_context;
    end
    if(system_cores_0_dBus_cmd_s2mPipe_ready) begin
      system_cores_0_dBus_cmd_s2mPipe_rData_last <= system_cores_0_dBus_cmd_s2mPipe_payload_last;
      system_cores_0_dBus_cmd_s2mPipe_rData_fragment_opcode <= system_cores_0_dBus_cmd_s2mPipe_payload_fragment_opcode;
      system_cores_0_dBus_cmd_s2mPipe_rData_fragment_address <= system_cores_0_dBus_cmd_s2mPipe_payload_fragment_address;
      system_cores_0_dBus_cmd_s2mPipe_rData_fragment_length <= system_cores_0_dBus_cmd_s2mPipe_payload_fragment_length;
      system_cores_0_dBus_cmd_s2mPipe_rData_fragment_data <= system_cores_0_dBus_cmd_s2mPipe_payload_fragment_data;
      system_cores_0_dBus_cmd_s2mPipe_rData_fragment_mask <= system_cores_0_dBus_cmd_s2mPipe_payload_fragment_mask;
      system_cores_0_dBus_cmd_s2mPipe_rData_fragment_context <= system_cores_0_dBus_cmd_s2mPipe_payload_fragment_context;
    end
    if(system_cores_0_iBus_cmd_ready) begin
      system_cores_0_iBus_cmd_rData_last <= system_cores_0_iBus_cmd_payload_last;
      system_cores_0_iBus_cmd_rData_fragment_opcode <= system_cores_0_iBus_cmd_payload_fragment_opcode;
      system_cores_0_iBus_cmd_rData_fragment_address <= system_cores_0_iBus_cmd_payload_fragment_address;
      system_cores_0_iBus_cmd_rData_fragment_length <= system_cores_0_iBus_cmd_payload_fragment_length;
    end
    if(system_cores_0_iBus_cmd_s2mPipe_ready) begin
      system_cores_0_iBus_cmd_s2mPipe_rData_last <= system_cores_0_iBus_cmd_s2mPipe_payload_last;
      system_cores_0_iBus_cmd_s2mPipe_rData_fragment_opcode <= system_cores_0_iBus_cmd_s2mPipe_payload_fragment_opcode;
      system_cores_0_iBus_cmd_s2mPipe_rData_fragment_address <= system_cores_0_iBus_cmd_s2mPipe_payload_fragment_address;
      system_cores_0_iBus_cmd_s2mPipe_rData_fragment_length <= system_cores_0_iBus_cmd_s2mPipe_payload_fragment_length;
    end
    _zz_timerInterrupt <= system_clint_logic_io_timerInterrupt[0];
    _zz_softwareInterrupt <= system_clint_logic_io_softwareInterrupt[0];
    if(system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready) begin
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_last <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_source <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_opcode <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_address <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_length <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_data <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rData_fragment_context <= system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
    end
    if(_zz_io_bus_rsp_ready) begin
      _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last <= system_uart_0_io_logic_io_bus_rsp_payload_last;
      _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source <= system_uart_0_io_logic_io_bus_rsp_payload_fragment_source;
      _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode <= system_uart_0_io_logic_io_bus_rsp_payload_fragment_opcode;
      _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data <= system_uart_0_io_logic_io_bus_rsp_payload_fragment_data;
      _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context <= system_uart_0_io_logic_io_bus_rsp_payload_fragment_context;
    end
    if(_zz_system_plic_logic_bus_rsp_ready_1) begin
      _zz_system_plic_logic_bmb_rsp_payload_last <= system_plic_logic_bus_rsp_payload_last;
      _zz_system_plic_logic_bmb_rsp_payload_fragment_source <= system_plic_logic_bus_rsp_payload_fragment_source;
      _zz_system_plic_logic_bmb_rsp_payload_fragment_opcode <= system_plic_logic_bus_rsp_payload_fragment_opcode;
      _zz_system_plic_logic_bmb_rsp_payload_fragment_data <= system_plic_logic_bus_rsp_payload_fragment_data;
      _zz_system_plic_logic_bmb_rsp_payload_fragment_context <= system_plic_logic_bus_rsp_payload_fragment_context;
    end
    system_cores_0_externalInterrupt_plic_target_bestRequest_priority <= (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_2 ? _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority : _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_1);
    system_cores_0_externalInterrupt_plic_target_bestRequest_id <= (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_2 ? (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id ? system_cores_0_externalInterrupt_plic_target_requests_0_id : system_cores_0_externalInterrupt_plic_target_requests_1_id) : (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_id_1 ? system_cores_0_externalInterrupt_plic_target_requests_2_id : system_cores_0_externalInterrupt_plic_target_requests_3_id));
    system_cores_0_externalInterrupt_plic_target_bestRequest_valid <= (_zz_system_cores_0_externalInterrupt_plic_target_bestRequest_priority_2 ? _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid : _zz_system_cores_0_externalInterrupt_plic_target_bestRequest_valid_1);
    system_cores_0_externalInterrupt_plic_target_iep_regNext <= system_cores_0_externalInterrupt_plic_target_iep;
  end

  always @(posedge io_systemClk) begin
    system_cores_0_debugReset <= system_cores_0_logic_cpu_debug_resetOut;
  end

  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      system_cores_0_dBus_cmd_rValidN <= 1'b1;
      system_cores_0_dBus_cmd_s2mPipe_rValid <= 1'b0;
      system_cores_0_iBus_cmd_rValidN <= 1'b1;
      system_cores_0_iBus_cmd_s2mPipe_rValid <= 1'b0;
      _zz_1 <= 1'b0;
      system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rValid <= 1'b0;
      _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid_1 <= 1'b0;
      system_uart_0_io_interrupt_plic_gateway_ip <= 1'b0;
      system_uart_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
      system_gpio_0_io_interrupts_0_plic_gateway_ip <= 1'b0;
      system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion <= 1'b0;
      system_gpio_0_io_interrupts_1_plic_gateway_ip <= 1'b0;
      system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion <= 1'b0;
      _zz_system_plic_logic_bmb_rsp_valid_1 <= 1'b0;
      _zz_system_uart_0_io_interrupt_plic_gateway_priority <= 2'b00;
      _zz_system_gpio_0_io_interrupts_0_plic_gateway_priority <= 2'b00;
      _zz_system_gpio_0_io_interrupts_1_plic_gateway_priority <= 2'b00;
      system_plic_logic_bridge_coherencyStall_value <= 1'b0;
      _zz_system_cores_0_externalInterrupt_plic_target_threshold <= 2'b00;
      _zz_system_cores_0_externalInterrupt_plic_target_ie_0 <= 1'b0;
      _zz_system_cores_0_externalInterrupt_plic_target_ie_1 <= 1'b0;
      _zz_system_cores_0_externalInterrupt_plic_target_ie_2 <= 1'b0;
    end else begin
      if(system_cores_0_dBus_cmd_valid) begin
        system_cores_0_dBus_cmd_rValidN <= 1'b0;
      end
      if(system_cores_0_dBus_cmd_s2mPipe_ready) begin
        system_cores_0_dBus_cmd_rValidN <= 1'b1;
      end
      if(system_cores_0_dBus_cmd_s2mPipe_ready) begin
        system_cores_0_dBus_cmd_s2mPipe_rValid <= system_cores_0_dBus_cmd_s2mPipe_valid;
      end
      if(system_cores_0_iBus_cmd_valid) begin
        system_cores_0_iBus_cmd_rValidN <= 1'b0;
      end
      if(system_cores_0_iBus_cmd_s2mPipe_ready) begin
        system_cores_0_iBus_cmd_rValidN <= 1'b1;
      end
      if(system_cores_0_iBus_cmd_s2mPipe_ready) begin
        system_cores_0_iBus_cmd_s2mPipe_rValid <= system_cores_0_iBus_cmd_s2mPipe_valid;
      end
      _zz_1 <= (&system_cores_0_logic_cpu_stopTime);
      if(system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid) begin
        system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rValid <= 1'b1;
      end
      if(system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_halfPipe_fire) begin
        system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_cmd_rValid <= 1'b0;
      end
      if(system_uart_0_io_logic_io_bus_rsp_valid) begin
        _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid_1 <= 1'b1;
      end
      if((_zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid && system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready)) begin
        _zz_system_uart_0_io_ctrl_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid_1 <= 1'b0;
      end
      if(when_PlicGateway_l21) begin
        system_uart_0_io_interrupt_plic_gateway_ip <= system_uart_0_io_logic_io_interrupt;
        system_uart_0_io_interrupt_plic_gateway_waitCompletion <= system_uart_0_io_logic_io_interrupt;
      end
      if(when_PlicGateway_l21_1) begin
        system_gpio_0_io_interrupts_0_plic_gateway_ip <= system_gpio_0_io_interrupts_0;
        system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion <= system_gpio_0_io_interrupts_0;
      end
      if(when_PlicGateway_l21_2) begin
        system_gpio_0_io_interrupts_1_plic_gateway_ip <= system_gpio_0_io_interrupts_1;
        system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion <= system_gpio_0_io_interrupts_1;
      end
      if(_zz_system_plic_logic_bus_rsp_ready_1) begin
        _zz_system_plic_logic_bmb_rsp_valid_1 <= (system_plic_logic_bus_rsp_valid && _zz_system_plic_logic_bus_rsp_ready);
      end
      if(system_plic_logic_bridge_claim_valid) begin
        case(system_plic_logic_bridge_claim_payload)
          4'b0001 : begin
            system_uart_0_io_interrupt_plic_gateway_ip <= 1'b0;
          end
          4'b1100 : begin
            system_gpio_0_io_interrupts_0_plic_gateway_ip <= 1'b0;
          end
          4'b1101 : begin
            system_gpio_0_io_interrupts_1_plic_gateway_ip <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      if(system_plic_logic_bridge_completion_valid) begin
        case(system_plic_logic_bridge_completion_payload)
          4'b0001 : begin
            system_uart_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          4'b1100 : begin
            system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion <= 1'b0;
          end
          4'b1101 : begin
            system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      system_plic_logic_bridge_coherencyStall_value <= system_plic_logic_bridge_coherencyStall_valueNext;
      case(system_plic_logic_bmb_cmd_payload_fragment_address)
        22'h000004 : begin
          if(system_plic_logic_bus_doWrite) begin
            _zz_system_uart_0_io_interrupt_plic_gateway_priority <= system_plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
          end
        end
        22'h000030 : begin
          if(system_plic_logic_bus_doWrite) begin
            _zz_system_gpio_0_io_interrupts_0_plic_gateway_priority <= system_plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
          end
        end
        22'h000034 : begin
          if(system_plic_logic_bus_doWrite) begin
            _zz_system_gpio_0_io_interrupts_1_plic_gateway_priority <= system_plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
          end
        end
        22'h200000 : begin
          if(system_plic_logic_bus_doWrite) begin
            _zz_system_cores_0_externalInterrupt_plic_target_threshold <= system_plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
          end
        end
        22'h002000 : begin
          if(system_plic_logic_bus_doWrite) begin
            _zz_system_cores_0_externalInterrupt_plic_target_ie_0 <= system_plic_logic_bmb_cmd_payload_fragment_data[1];
            _zz_system_cores_0_externalInterrupt_plic_target_ie_1 <= system_plic_logic_bmb_cmd_payload_fragment_data[12];
            _zz_system_cores_0_externalInterrupt_plic_target_ie_2 <= system_plic_logic_bmb_cmd_payload_fragment_data[13];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_jtag_tck) begin
    system_softJtag_jtagTap_logic_tap_tap_fsm_state <= system_softJtag_jtagTap_logic_tap_tap_fsm_stateNext;
    system_softJtag_jtagTap_logic_tap_tap_bypass <= io_jtag_tdi;
    case(system_softJtag_jtagTap_logic_tap_tap_fsm_state)
      JtagState_IR_CAPTURE : begin
        system_softJtag_jtagTap_logic_tap_tap_instructionShift <= {2'd0, _zz_system_softJtag_jtagTap_logic_tap_tap_instructionShift};
      end
      JtagState_IR_SHIFT : begin
        system_softJtag_jtagTap_logic_tap_tap_instructionShift <= ({io_jtag_tdi,system_softJtag_jtagTap_logic_tap_tap_instructionShift} >>> 1'd1);
      end
      JtagState_IR_UPDATE : begin
        system_softJtag_jtagTap_logic_tap_tap_instruction <= system_softJtag_jtagTap_logic_tap_tap_instructionShift;
      end
      JtagState_DR_SHIFT : begin
        system_softJtag_jtagTap_logic_tap_tap_instructionShift <= ({io_jtag_tdi,system_softJtag_jtagTap_logic_tap_tap_instructionShift} >>> 1'd1);
      end
      default : begin
      end
    endcase
    if(system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_enable) begin
      if(system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_shift) begin
        system_softJtag_jtagTap_logic_tap_idcodeArea_shifter <= ({system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_tdi,system_softJtag_jtagTap_logic_tap_idcodeArea_shifter} >>> 1'd1);
      end
    end
    if(system_softJtag_jtagTap_logic_tap_idcodeArea_ctrl_capture) begin
      system_softJtag_jtagTap_logic_tap_idcodeArea_shifter <= 32'h00220a79;
    end
    if(when_JtagTap_l121) begin
      system_softJtag_jtagTap_logic_tap_tap_instruction <= 4'b0101;
    end
  end

  always @(negedge io_jtag_tck) begin
    system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd_regNext <= system_softJtag_jtagTap_logic_tap_tap_tdoUnbufferd;
  end

  always @(posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      debug_bus_cmd_fire_regNext <= debug_bus_cmd_fire;
    end
  end


endmodule

module BmbGpio2 (
  input  wire [3:0]    io_gpio_read,
  output reg  [3:0]    io_gpio_write,
  output reg  [3:0]    io_gpio_writeEnable,
  input  wire          io_bus_cmd_valid,
  output wire          io_bus_cmd_ready,
  input  wire          io_bus_cmd_payload_last,
  input  wire [0:0]    io_bus_cmd_payload_fragment_source,
  input  wire [0:0]    io_bus_cmd_payload_fragment_opcode,
  input  wire [7:0]    io_bus_cmd_payload_fragment_address,
  input  wire [1:0]    io_bus_cmd_payload_fragment_length,
  input  wire [31:0]   io_bus_cmd_payload_fragment_data,
  input  wire [0:0]    io_bus_cmd_payload_fragment_context,
  output wire          io_bus_rsp_valid,
  input  wire          io_bus_rsp_ready,
  output wire          io_bus_rsp_payload_last,
  output wire [0:0]    io_bus_rsp_payload_fragment_source,
  output wire [0:0]    io_bus_rsp_payload_fragment_opcode,
  output wire [31:0]   io_bus_rsp_payload_fragment_data,
  output wire [0:0]    io_bus_rsp_payload_fragment_context,
  output reg  [3:0]    io_interrupt,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire                mapper_readErrorFlag;
  wire                mapper_writeErrorFlag;
  wire                mapper_readHaltTrigger;
  wire                mapper_writeHaltTrigger;
  wire                mapper_rsp_valid;
  wire                mapper_rsp_ready;
  wire                mapper_rsp_payload_last;
  wire       [0:0]    mapper_rsp_payload_fragment_source;
  reg        [0:0]    mapper_rsp_payload_fragment_opcode;
  reg        [31:0]   mapper_rsp_payload_fragment_data;
  wire       [0:0]    mapper_rsp_payload_fragment_context;
  wire                _zz_mapper_rsp_ready;
  reg                 _zz_mapper_rsp_ready_1;
  wire                _zz_io_bus_rsp_valid;
  reg                 _zz_io_bus_rsp_valid_1;
  reg                 _zz_io_bus_rsp_payload_last;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_source;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_bus_rsp_payload_fragment_data;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_context;
  wire                when_Stream_l375;
  wire                mapper_askWrite;
  wire                mapper_askRead;
  wire                io_bus_cmd_fire;
  wire                mapper_doWrite;
  wire                mapper_doRead;
  wire                when_BmbSlaveFactory_l33;
  wire                when_BmbSlaveFactory_l35;
  reg        [3:0]    io_gpio_read_delay_1;
  reg        [3:0]    syncronized;
  reg        [3:0]    last;
  reg                 _zz_io_gpio_write;
  reg                 _zz_io_gpio_writeEnable;
  reg                 _zz_io_gpio_write_1;
  reg                 _zz_io_gpio_writeEnable_1;
  reg                 _zz_io_gpio_write_2;
  reg                 _zz_io_gpio_writeEnable_2;
  reg                 _zz_io_gpio_write_3;
  reg                 _zz_io_gpio_writeEnable_3;
  reg        [3:0]    interrupt_enable_high;
  reg        [3:0]    interrupt_enable_low;
  reg        [3:0]    interrupt_enable_rise;
  reg        [3:0]    interrupt_enable_fall;
  wire       [3:0]    interrupt_valid;
  reg                 _zz_mapper_rsp_payload_fragment_data;
  reg                 _zz_mapper_rsp_payload_fragment_data_1;
  reg                 _zz_mapper_rsp_payload_fragment_data_2;
  reg                 _zz_mapper_rsp_payload_fragment_data_3;
  reg                 _zz_mapper_rsp_payload_fragment_data_4;
  reg                 _zz_mapper_rsp_payload_fragment_data_5;
  reg                 _zz_mapper_rsp_payload_fragment_data_6;
  reg                 _zz_mapper_rsp_payload_fragment_data_7;

  assign mapper_readErrorFlag = 1'b0;
  assign mapper_writeErrorFlag = 1'b0;
  assign mapper_readHaltTrigger = 1'b0;
  assign mapper_writeHaltTrigger = 1'b0;
  assign _zz_mapper_rsp_ready = (! (mapper_readHaltTrigger || mapper_writeHaltTrigger));
  assign mapper_rsp_ready = (_zz_mapper_rsp_ready_1 && _zz_mapper_rsp_ready);
  always @(*) begin
    _zz_mapper_rsp_ready_1 = io_bus_rsp_ready;
    if(when_Stream_l375) begin
      _zz_mapper_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l375 = (! _zz_io_bus_rsp_valid);
  assign _zz_io_bus_rsp_valid = _zz_io_bus_rsp_valid_1;
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid;
  assign io_bus_rsp_payload_last = _zz_io_bus_rsp_payload_last;
  assign io_bus_rsp_payload_fragment_source = _zz_io_bus_rsp_payload_fragment_source;
  assign io_bus_rsp_payload_fragment_opcode = _zz_io_bus_rsp_payload_fragment_opcode;
  assign io_bus_rsp_payload_fragment_data = _zz_io_bus_rsp_payload_fragment_data;
  assign io_bus_rsp_payload_fragment_context = _zz_io_bus_rsp_payload_fragment_context;
  assign mapper_askWrite = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign mapper_askRead = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign mapper_doWrite = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign mapper_doRead = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign mapper_rsp_valid = io_bus_cmd_valid;
  assign io_bus_cmd_ready = mapper_rsp_ready;
  assign mapper_rsp_payload_last = 1'b1;
  assign when_BmbSlaveFactory_l33 = (mapper_doWrite && mapper_writeErrorFlag);
  always @(*) begin
    if(when_BmbSlaveFactory_l33) begin
      mapper_rsp_payload_fragment_opcode = 1'b1;
    end else begin
      if(when_BmbSlaveFactory_l35) begin
        mapper_rsp_payload_fragment_opcode = 1'b1;
      end else begin
        mapper_rsp_payload_fragment_opcode = 1'b0;
      end
    end
  end

  assign when_BmbSlaveFactory_l35 = (mapper_doRead && mapper_readErrorFlag);
  always @(*) begin
    mapper_rsp_payload_fragment_data = 32'h0;
    case(io_bus_cmd_payload_fragment_address)
      8'h0 : begin
        mapper_rsp_payload_fragment_data[0 : 0] = syncronized[0];
        mapper_rsp_payload_fragment_data[1 : 1] = syncronized[1];
        mapper_rsp_payload_fragment_data[2 : 2] = syncronized[2];
        mapper_rsp_payload_fragment_data[3 : 3] = syncronized[3];
      end
      8'h04 : begin
        mapper_rsp_payload_fragment_data[0 : 0] = _zz_io_gpio_write;
        mapper_rsp_payload_fragment_data[1 : 1] = _zz_io_gpio_write_1;
        mapper_rsp_payload_fragment_data[2 : 2] = _zz_io_gpio_write_2;
        mapper_rsp_payload_fragment_data[3 : 3] = _zz_io_gpio_write_3;
      end
      8'h08 : begin
        mapper_rsp_payload_fragment_data[0 : 0] = _zz_io_gpio_writeEnable;
        mapper_rsp_payload_fragment_data[1 : 1] = _zz_io_gpio_writeEnable_1;
        mapper_rsp_payload_fragment_data[2 : 2] = _zz_io_gpio_writeEnable_2;
        mapper_rsp_payload_fragment_data[3 : 3] = _zz_io_gpio_writeEnable_3;
      end
      8'h20 : begin
        mapper_rsp_payload_fragment_data[0 : 0] = _zz_mapper_rsp_payload_fragment_data;
        mapper_rsp_payload_fragment_data[1 : 1] = _zz_mapper_rsp_payload_fragment_data_4;
      end
      8'h24 : begin
        mapper_rsp_payload_fragment_data[0 : 0] = _zz_mapper_rsp_payload_fragment_data_1;
        mapper_rsp_payload_fragment_data[1 : 1] = _zz_mapper_rsp_payload_fragment_data_5;
      end
      8'h28 : begin
        mapper_rsp_payload_fragment_data[0 : 0] = _zz_mapper_rsp_payload_fragment_data_2;
        mapper_rsp_payload_fragment_data[1 : 1] = _zz_mapper_rsp_payload_fragment_data_6;
      end
      8'h2c : begin
        mapper_rsp_payload_fragment_data[0 : 0] = _zz_mapper_rsp_payload_fragment_data_3;
        mapper_rsp_payload_fragment_data[1 : 1] = _zz_mapper_rsp_payload_fragment_data_7;
      end
      default : begin
      end
    endcase
  end

  assign mapper_rsp_payload_fragment_context = io_bus_cmd_payload_fragment_context;
  assign mapper_rsp_payload_fragment_source = io_bus_cmd_payload_fragment_source;
  always @(*) begin
    io_gpio_write[0] = _zz_io_gpio_write;
    io_gpio_write[1] = _zz_io_gpio_write_1;
    io_gpio_write[2] = _zz_io_gpio_write_2;
    io_gpio_write[3] = _zz_io_gpio_write_3;
  end

  always @(*) begin
    io_gpio_writeEnable[0] = _zz_io_gpio_writeEnable;
    io_gpio_writeEnable[1] = _zz_io_gpio_writeEnable_1;
    io_gpio_writeEnable[2] = _zz_io_gpio_writeEnable_2;
    io_gpio_writeEnable[3] = _zz_io_gpio_writeEnable_3;
  end

  assign interrupt_valid = ((((interrupt_enable_high & syncronized) | (interrupt_enable_low & (~ syncronized))) | (interrupt_enable_rise & (syncronized & (~ last)))) | (interrupt_enable_fall & ((~ syncronized) & last)));
  always @(*) begin
    io_interrupt[0] = interrupt_valid[0];
    io_interrupt[1] = interrupt_valid[1];
    io_interrupt[2] = 1'b0;
    io_interrupt[3] = 1'b0;
  end

  always @(*) begin
    interrupt_enable_rise[0] = _zz_mapper_rsp_payload_fragment_data;
    interrupt_enable_rise[1] = _zz_mapper_rsp_payload_fragment_data_4;
    interrupt_enable_rise[2] = 1'b0;
    interrupt_enable_rise[3] = 1'b0;
  end

  always @(*) begin
    interrupt_enable_fall[0] = _zz_mapper_rsp_payload_fragment_data_1;
    interrupt_enable_fall[1] = _zz_mapper_rsp_payload_fragment_data_5;
    interrupt_enable_fall[2] = 1'b0;
    interrupt_enable_fall[3] = 1'b0;
  end

  always @(*) begin
    interrupt_enable_high[0] = _zz_mapper_rsp_payload_fragment_data_2;
    interrupt_enable_high[1] = _zz_mapper_rsp_payload_fragment_data_6;
    interrupt_enable_high[2] = 1'b0;
    interrupt_enable_high[3] = 1'b0;
  end

  always @(*) begin
    interrupt_enable_low[0] = _zz_mapper_rsp_payload_fragment_data_3;
    interrupt_enable_low[1] = _zz_mapper_rsp_payload_fragment_data_7;
    interrupt_enable_low[2] = 1'b0;
    interrupt_enable_low[3] = 1'b0;
  end

  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_bus_rsp_valid_1 <= 1'b0;
      _zz_io_gpio_writeEnable <= 1'b0;
      _zz_io_gpio_writeEnable_1 <= 1'b0;
      _zz_io_gpio_writeEnable_2 <= 1'b0;
      _zz_io_gpio_writeEnable_3 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_1 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_2 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_3 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_4 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_5 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_6 <= 1'b0;
      _zz_mapper_rsp_payload_fragment_data_7 <= 1'b0;
    end else begin
      if(_zz_mapper_rsp_ready_1) begin
        _zz_io_bus_rsp_valid_1 <= (mapper_rsp_valid && _zz_mapper_rsp_ready);
      end
      case(io_bus_cmd_payload_fragment_address)
        8'h08 : begin
          if(mapper_doWrite) begin
            _zz_io_gpio_writeEnable <= io_bus_cmd_payload_fragment_data[0];
            _zz_io_gpio_writeEnable_1 <= io_bus_cmd_payload_fragment_data[1];
            _zz_io_gpio_writeEnable_2 <= io_bus_cmd_payload_fragment_data[2];
            _zz_io_gpio_writeEnable_3 <= io_bus_cmd_payload_fragment_data[3];
          end
        end
        8'h20 : begin
          if(mapper_doWrite) begin
            _zz_mapper_rsp_payload_fragment_data <= io_bus_cmd_payload_fragment_data[0];
            _zz_mapper_rsp_payload_fragment_data_4 <= io_bus_cmd_payload_fragment_data[1];
          end
        end
        8'h24 : begin
          if(mapper_doWrite) begin
            _zz_mapper_rsp_payload_fragment_data_1 <= io_bus_cmd_payload_fragment_data[0];
            _zz_mapper_rsp_payload_fragment_data_5 <= io_bus_cmd_payload_fragment_data[1];
          end
        end
        8'h28 : begin
          if(mapper_doWrite) begin
            _zz_mapper_rsp_payload_fragment_data_2 <= io_bus_cmd_payload_fragment_data[0];
            _zz_mapper_rsp_payload_fragment_data_6 <= io_bus_cmd_payload_fragment_data[1];
          end
        end
        8'h2c : begin
          if(mapper_doWrite) begin
            _zz_mapper_rsp_payload_fragment_data_3 <= io_bus_cmd_payload_fragment_data[0];
            _zz_mapper_rsp_payload_fragment_data_7 <= io_bus_cmd_payload_fragment_data[1];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_systemClk) begin
    if(_zz_mapper_rsp_ready_1) begin
      _zz_io_bus_rsp_payload_last <= mapper_rsp_payload_last;
      _zz_io_bus_rsp_payload_fragment_source <= mapper_rsp_payload_fragment_source;
      _zz_io_bus_rsp_payload_fragment_opcode <= mapper_rsp_payload_fragment_opcode;
      _zz_io_bus_rsp_payload_fragment_data <= mapper_rsp_payload_fragment_data;
      _zz_io_bus_rsp_payload_fragment_context <= mapper_rsp_payload_fragment_context;
    end
    io_gpio_read_delay_1 <= io_gpio_read;
    syncronized <= io_gpio_read_delay_1;
    last <= syncronized;
    case(io_bus_cmd_payload_fragment_address)
      8'h04 : begin
        if(mapper_doWrite) begin
          _zz_io_gpio_write <= io_bus_cmd_payload_fragment_data[0];
          _zz_io_gpio_write_1 <= io_bus_cmd_payload_fragment_data[1];
          _zz_io_gpio_write_2 <= io_bus_cmd_payload_fragment_data[2];
          _zz_io_gpio_write_3 <= io_bus_cmd_payload_fragment_data[3];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BmbUartCtrl (
  input  wire          io_bus_cmd_valid,
  output wire          io_bus_cmd_ready,
  input  wire          io_bus_cmd_payload_last,
  input  wire [0:0]    io_bus_cmd_payload_fragment_source,
  input  wire [0:0]    io_bus_cmd_payload_fragment_opcode,
  input  wire [5:0]    io_bus_cmd_payload_fragment_address,
  input  wire [1:0]    io_bus_cmd_payload_fragment_length,
  input  wire [31:0]   io_bus_cmd_payload_fragment_data,
  input  wire [0:0]    io_bus_cmd_payload_fragment_context,
  output wire          io_bus_rsp_valid,
  input  wire          io_bus_rsp_ready,
  output wire          io_bus_rsp_payload_last,
  output wire [0:0]    io_bus_rsp_payload_fragment_source,
  output wire [0:0]    io_bus_rsp_payload_fragment_opcode,
  output wire [31:0]   io_bus_rsp_payload_fragment_data,
  output wire [0:0]    io_bus_rsp_payload_fragment_context,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_interrupt,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  reg                 uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [6:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [6:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  wire       [6:0]    uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
  wire       [6:0]    uartCtrl_1_io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_misc_readError;
  wire       [0:0]    _zz_bridge_misc_readOverflowError;
  wire       [0:0]    _zz_bridge_misc_breakDetected;
  wire       [0:0]    _zz_bridge_misc_doBreak;
  wire       [0:0]    _zz_bridge_misc_doBreak_1;
  wire       [6:0]    _zz_busCtrl_rsp_payload_fragment_data;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_readHaltTrigger;
  wire                busCtrl_writeHaltTrigger;
  wire                busCtrl_rsp_valid;
  wire                busCtrl_rsp_ready;
  wire                busCtrl_rsp_payload_last;
  wire       [0:0]    busCtrl_rsp_payload_fragment_source;
  reg        [0:0]    busCtrl_rsp_payload_fragment_opcode;
  reg        [31:0]   busCtrl_rsp_payload_fragment_data;
  wire       [0:0]    busCtrl_rsp_payload_fragment_context;
  wire                _zz_busCtrl_rsp_ready;
  reg                 _zz_busCtrl_rsp_ready_1;
  wire                _zz_io_bus_rsp_valid;
  reg                 _zz_io_bus_rsp_valid_1;
  reg                 _zz_io_bus_rsp_payload_last;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_source;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_bus_rsp_payload_fragment_data;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_context;
  wire                when_Stream_l375;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                io_bus_cmd_fire;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire                when_BmbSlaveFactory_l33;
  wire                when_BmbSlaveFactory_l35;
  wire                bridge_busCtrlWrapped_readErrorFlag;
  wire                bridge_busCtrlWrapped_writeErrorFlag;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        [0:0]    bridge_uartConfigReg_frame_stop;
  reg        [1:0]    bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 when_BusSlaveFactory_l341;
  wire                when_BusSlaveFactory_l347;
  reg                 bridge_misc_readOverflowError;
  reg                 when_BusSlaveFactory_l341_1;
  wire                when_BusSlaveFactory_l347_1;
  wire                uartCtrl_1_io_read_isStall;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1_io_readBreak_regNext;
  wire                when_UartCtrl_l155;
  reg                 when_BusSlaveFactory_l341_2;
  wire                when_BusSlaveFactory_l347_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l377;
  wire                when_BusSlaveFactory_l379;
  reg                 when_BusSlaveFactory_l341_3;
  wire                when_BusSlaveFactory_l347_3;
  wire       [1:0]    _zz_bridge_uartConfigReg_frame_parity;
  wire       [0:0]    _zz_bridge_uartConfigReg_frame_stop;
  wire                when_BmbSlaveFactory_l77;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_bridge_uartConfigReg_frame_parity_string;
  reg [23:0] _zz_bridge_uartConfigReg_frame_stop_string;
  `endif


  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_busCtrl_rsp_payload_fragment_data = (7'h40 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength (bridge_uartConfigReg_frame_dataLength[2:0]                          ), //i
    .io_config_frame_stop       (bridge_uartConfigReg_frame_stop                                     ), //i
    .io_config_frame_parity     (bridge_uartConfigReg_frame_parity[1:0]                              ), //i
    .io_config_clockDivider     (bridge_uartConfigReg_clockDivider[19:0]                             ), //i
    .io_write_valid             (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid       ), //i
    .io_write_ready             (uartCtrl_1_io_write_ready                                           ), //o
    .io_write_payload           (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]), //i
    .io_read_valid              (uartCtrl_1_io_read_valid                                            ), //o
    .io_read_ready              (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready                 ), //i
    .io_read_payload            (uartCtrl_1_io_read_payload[7:0]                                     ), //o
    .io_uart_txd                (uartCtrl_1_io_uart_txd                                              ), //o
    .io_uart_rxd                (io_uart_rxd                                                         ), //i
    .io_readError               (uartCtrl_1_io_readError                                             ), //o
    .io_writeBreak              (bridge_misc_doBreak                                                 ), //i
    .io_readBreak               (uartCtrl_1_io_readBreak                                             ), //o
    .io_systemClk               (io_systemClk                                                        ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset                                          )  //i
  );
  StreamFifo_1 bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid              (bridge_write_streamUnbuffered_valid                                  ), //i
    .io_push_ready              (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload            (bridge_write_streamUnbuffered_payload[7:0]                           ), //i
    .io_pop_valid               (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready               (uartCtrl_1_io_write_ready                                            ), //i
    .io_pop_payload             (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0] ), //o
    .io_flush                   (1'b0                                                                 ), //i
    .io_occupancy               (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[6:0]   ), //o
    .io_availability            (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[6:0]), //o
    .io_systemClk               (io_systemClk                                                         ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset                                           )  //i
  );
  StreamFifo_1 uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid              (uartCtrl_1_io_read_valid                                  ), //i
    .io_push_ready              (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload            (uartCtrl_1_io_read_payload[7:0]                           ), //i
    .io_pop_valid               (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready               (uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload             (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload[7:0] ), //o
    .io_flush                   (1'b0                                                      ), //i
    .io_occupancy               (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy[6:0]   ), //o
    .io_availability            (uartCtrl_1_io_read_queueWithOccupancy_io_availability[6:0]), //o
    .io_systemClk               (io_systemClk                                              ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : _zz_bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : _zz_bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : _zz_bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : _zz_bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : _zz_bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : _zz_bridge_uartConfigReg_frame_stop_string = "TWO";
      default : _zz_bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign busCtrl_readHaltTrigger = 1'b0;
  assign busCtrl_writeHaltTrigger = 1'b0;
  assign _zz_busCtrl_rsp_ready = (! (busCtrl_readHaltTrigger || busCtrl_writeHaltTrigger));
  assign busCtrl_rsp_ready = (_zz_busCtrl_rsp_ready_1 && _zz_busCtrl_rsp_ready);
  always @(*) begin
    _zz_busCtrl_rsp_ready_1 = io_bus_rsp_ready;
    if(when_Stream_l375) begin
      _zz_busCtrl_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l375 = (! _zz_io_bus_rsp_valid);
  assign _zz_io_bus_rsp_valid = _zz_io_bus_rsp_valid_1;
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid;
  assign io_bus_rsp_payload_last = _zz_io_bus_rsp_payload_last;
  assign io_bus_rsp_payload_fragment_source = _zz_io_bus_rsp_payload_fragment_source;
  assign io_bus_rsp_payload_fragment_opcode = _zz_io_bus_rsp_payload_fragment_opcode;
  assign io_bus_rsp_payload_fragment_data = _zz_io_bus_rsp_payload_fragment_data;
  assign io_bus_rsp_payload_fragment_context = _zz_io_bus_rsp_payload_fragment_context;
  assign busCtrl_askWrite = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign busCtrl_askRead = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign busCtrl_doWrite = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign busCtrl_doRead = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign busCtrl_rsp_valid = io_bus_cmd_valid;
  assign io_bus_cmd_ready = busCtrl_rsp_ready;
  assign busCtrl_rsp_payload_last = 1'b1;
  assign when_BmbSlaveFactory_l33 = (busCtrl_doWrite && busCtrl_writeErrorFlag);
  always @(*) begin
    if(when_BmbSlaveFactory_l33) begin
      busCtrl_rsp_payload_fragment_opcode = 1'b1;
    end else begin
      if(when_BmbSlaveFactory_l35) begin
        busCtrl_rsp_payload_fragment_opcode = 1'b1;
      end else begin
        busCtrl_rsp_payload_fragment_opcode = 1'b0;
      end
    end
  end

  assign when_BmbSlaveFactory_l35 = (busCtrl_doRead && busCtrl_readErrorFlag);
  always @(*) begin
    busCtrl_rsp_payload_fragment_data = 32'h0;
    case(io_bus_cmd_payload_fragment_address)
      6'h0 : begin
        busCtrl_rsp_payload_fragment_data[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        busCtrl_rsp_payload_fragment_data[7 : 0] = bridge_read_streamBreaked_payload;
      end
      6'h04 : begin
        busCtrl_rsp_payload_fragment_data[22 : 16] = _zz_busCtrl_rsp_payload_fragment_data;
        busCtrl_rsp_payload_fragment_data[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        busCtrl_rsp_payload_fragment_data[30 : 24] = uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        busCtrl_rsp_payload_fragment_data[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        busCtrl_rsp_payload_fragment_data[1 : 1] = bridge_interruptCtrl_readIntEnable;
        busCtrl_rsp_payload_fragment_data[8 : 8] = bridge_interruptCtrl_writeInt;
        busCtrl_rsp_payload_fragment_data[9 : 9] = bridge_interruptCtrl_readInt;
      end
      6'h10 : begin
        busCtrl_rsp_payload_fragment_data[0 : 0] = bridge_misc_readError;
        busCtrl_rsp_payload_fragment_data[1 : 1] = bridge_misc_readOverflowError;
        busCtrl_rsp_payload_fragment_data[8 : 8] = uartCtrl_1_io_readBreak;
        busCtrl_rsp_payload_fragment_data[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_rsp_payload_fragment_context = io_bus_cmd_payload_fragment_context;
  assign busCtrl_rsp_payload_fragment_source = io_bus_cmd_payload_fragment_source;
  assign bridge_busCtrlWrapped_readErrorFlag = 1'b0;
  assign bridge_busCtrlWrapped_writeErrorFlag = 1'b0;
  always @(*) begin
    _zz_bridge_write_streamUnbuffered_valid = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_write_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_bridge_write_streamUnbuffered_valid;
  assign bridge_write_streamUnbuffered_payload = io_bus_cmd_payload_fragment_data[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @(*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak) begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @(*) begin
    uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak) begin
      uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @(*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h0 : begin
        if(busCtrl_doRead) begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @(*) begin
    when_BusSlaveFactory_l341 = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347 = io_bus_cmd_payload_fragment_data[0];
  always @(*) begin
    when_BusSlaveFactory_l341_1 = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_1 = io_bus_cmd_payload_fragment_data[1];
  assign uartCtrl_1_io_read_isStall = (uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_queueWithOccupancy_io_push_ready));
  assign when_UartCtrl_l155 = (uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext));
  always @(*) begin
    when_BusSlaveFactory_l341_2 = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_2 = io_bus_cmd_payload_fragment_data[9];
  always @(*) begin
    when_BusSlaveFactory_l377 = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l377 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l379 = io_bus_cmd_payload_fragment_data[10];
  always @(*) begin
    when_BusSlaveFactory_l341_3 = 1'b0;
    case(io_bus_cmd_payload_fragment_address)
      6'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_3 = io_bus_cmd_payload_fragment_data[11];
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_bridge_uartConfigReg_frame_parity = io_bus_cmd_payload_fragment_data[9 : 8];
  assign _zz_bridge_uartConfigReg_frame_stop = io_bus_cmd_payload_fragment_data[16 : 16];
  assign when_BmbSlaveFactory_l77 = ((io_bus_cmd_payload_fragment_address & (~ 6'h03)) == 6'h08);
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_bus_rsp_valid_1 <= 1'b0;
      bridge_uartConfigReg_clockDivider <= 20'h0;
      bridge_uartConfigReg_clockDivider <= 20'h0006b;
      bridge_uartConfigReg_frame_dataLength <= 3'b111;
      bridge_uartConfigReg_frame_parity <= UartParityType_NONE;
      bridge_uartConfigReg_frame_stop <= UartStopType_ONE;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(_zz_busCtrl_rsp_ready_1) begin
        _zz_io_bus_rsp_valid_1 <= (busCtrl_rsp_valid && _zz_busCtrl_rsp_ready);
      end
      if(when_BusSlaveFactory_l341) begin
        if(when_BusSlaveFactory_l347) begin
          bridge_misc_readError <= _zz_bridge_misc_readError[0];
        end
      end
      if(uartCtrl_1_io_readError) begin
        bridge_misc_readError <= 1'b1;
      end
      if(when_BusSlaveFactory_l341_1) begin
        if(when_BusSlaveFactory_l347_1) begin
          bridge_misc_readOverflowError <= _zz_bridge_misc_readOverflowError[0];
        end
      end
      if(uartCtrl_1_io_read_isStall) begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if(when_UartCtrl_l155) begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(when_BusSlaveFactory_l341_2) begin
        if(when_BusSlaveFactory_l347_2) begin
          bridge_misc_breakDetected <= _zz_bridge_misc_breakDetected[0];
        end
      end
      if(when_BusSlaveFactory_l377) begin
        if(when_BusSlaveFactory_l379) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak[0];
        end
      end
      if(when_BusSlaveFactory_l341_3) begin
        if(when_BusSlaveFactory_l347_3) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak_1[0];
        end
      end
      case(io_bus_cmd_payload_fragment_address)
        6'h0c : begin
          if(busCtrl_doWrite) begin
            bridge_uartConfigReg_frame_dataLength <= io_bus_cmd_payload_fragment_data[2 : 0];
            bridge_uartConfigReg_frame_parity <= _zz_bridge_uartConfigReg_frame_parity;
            bridge_uartConfigReg_frame_stop <= _zz_bridge_uartConfigReg_frame_stop;
          end
        end
        6'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_bus_cmd_payload_fragment_data[0];
            bridge_interruptCtrl_readIntEnable <= io_bus_cmd_payload_fragment_data[1];
          end
        end
        default : begin
        end
      endcase
      if(when_BmbSlaveFactory_l77) begin
        if(busCtrl_doWrite) begin
          bridge_uartConfigReg_clockDivider[19 : 0] <= io_bus_cmd_payload_fragment_data[19 : 0];
        end
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(_zz_busCtrl_rsp_ready_1) begin
      _zz_io_bus_rsp_payload_last <= busCtrl_rsp_payload_last;
      _zz_io_bus_rsp_payload_fragment_source <= busCtrl_rsp_payload_fragment_source;
      _zz_io_bus_rsp_payload_fragment_opcode <= busCtrl_rsp_payload_fragment_opcode;
      _zz_io_bus_rsp_payload_fragment_data <= busCtrl_rsp_payload_fragment_data;
      _zz_io_bus_rsp_payload_fragment_context <= busCtrl_rsp_payload_fragment_context;
    end
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
  end


endmodule

module BmbClint (
  input  wire          io_bus_cmd_valid,
  output wire          io_bus_cmd_ready,
  input  wire          io_bus_cmd_payload_last,
  input  wire [0:0]    io_bus_cmd_payload_fragment_source,
  input  wire [0:0]    io_bus_cmd_payload_fragment_opcode,
  input  wire [15:0]   io_bus_cmd_payload_fragment_address,
  input  wire [1:0]    io_bus_cmd_payload_fragment_length,
  input  wire [31:0]   io_bus_cmd_payload_fragment_data,
  input  wire [0:0]    io_bus_cmd_payload_fragment_context,
  output wire          io_bus_rsp_valid,
  input  wire          io_bus_rsp_ready,
  output wire          io_bus_rsp_payload_last,
  output wire [0:0]    io_bus_rsp_payload_fragment_source,
  output wire [0:0]    io_bus_rsp_payload_fragment_opcode,
  output wire [31:0]   io_bus_rsp_payload_fragment_data,
  output wire [0:0]    io_bus_rsp_payload_fragment_context,
  output wire [0:0]    io_timerInterrupt,
  output wire [0:0]    io_softwareInterrupt,
  output wire [63:0]   io_time,
  input  wire          io_stop,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire                factory_readErrorFlag;
  wire                factory_writeErrorFlag;
  wire                factory_readHaltTrigger;
  wire                factory_writeHaltTrigger;
  wire                factory_rsp_valid;
  wire                factory_rsp_ready;
  wire                factory_rsp_payload_last;
  wire       [0:0]    factory_rsp_payload_fragment_source;
  reg        [0:0]    factory_rsp_payload_fragment_opcode;
  reg        [31:0]   factory_rsp_payload_fragment_data;
  wire       [0:0]    factory_rsp_payload_fragment_context;
  wire                _zz_factory_rsp_ready;
  reg                 _zz_factory_rsp_ready_1;
  wire                _zz_io_bus_rsp_valid;
  reg                 _zz_io_bus_rsp_valid_1;
  reg                 _zz_io_bus_rsp_payload_last;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_source;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_bus_rsp_payload_fragment_data;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_context;
  wire                when_Stream_l375;
  wire                factory_askWrite;
  wire                factory_askRead;
  wire                io_bus_cmd_fire;
  wire                factory_doWrite;
  wire                factory_doRead;
  wire                when_BmbSlaveFactory_l33;
  wire                when_BmbSlaveFactory_l35;
  reg                 logic_stop;
  reg        [63:0]   logic_time;
  wire                when_Clint_l39;
  reg        [63:0]   logic_harts_0_cmp;
  reg                 logic_harts_0_timerInterrupt;
  reg                 logic_harts_0_softwareInterrupt;
  wire       [63:0]   _zz_factory_rsp_payload_fragment_data;
  wire                when_BmbSlaveFactory_l77;
  wire                when_BmbSlaveFactory_l77_1;
  wire                when_BmbSlaveFactory_l77_2;
  wire                when_BmbSlaveFactory_l77_3;

  assign factory_readErrorFlag = 1'b0;
  assign factory_writeErrorFlag = 1'b0;
  assign factory_readHaltTrigger = 1'b0;
  assign factory_writeHaltTrigger = 1'b0;
  assign _zz_factory_rsp_ready = (! (factory_readHaltTrigger || factory_writeHaltTrigger));
  assign factory_rsp_ready = (_zz_factory_rsp_ready_1 && _zz_factory_rsp_ready);
  always @(*) begin
    _zz_factory_rsp_ready_1 = io_bus_rsp_ready;
    if(when_Stream_l375) begin
      _zz_factory_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l375 = (! _zz_io_bus_rsp_valid);
  assign _zz_io_bus_rsp_valid = _zz_io_bus_rsp_valid_1;
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid;
  assign io_bus_rsp_payload_last = _zz_io_bus_rsp_payload_last;
  assign io_bus_rsp_payload_fragment_source = _zz_io_bus_rsp_payload_fragment_source;
  assign io_bus_rsp_payload_fragment_opcode = _zz_io_bus_rsp_payload_fragment_opcode;
  assign io_bus_rsp_payload_fragment_data = _zz_io_bus_rsp_payload_fragment_data;
  assign io_bus_rsp_payload_fragment_context = _zz_io_bus_rsp_payload_fragment_context;
  assign factory_askWrite = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign factory_askRead = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign factory_doWrite = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign factory_doRead = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign factory_rsp_valid = io_bus_cmd_valid;
  assign io_bus_cmd_ready = factory_rsp_ready;
  assign factory_rsp_payload_last = 1'b1;
  assign when_BmbSlaveFactory_l33 = (factory_doWrite && factory_writeErrorFlag);
  always @(*) begin
    if(when_BmbSlaveFactory_l33) begin
      factory_rsp_payload_fragment_opcode = 1'b1;
    end else begin
      if(when_BmbSlaveFactory_l35) begin
        factory_rsp_payload_fragment_opcode = 1'b1;
      end else begin
        factory_rsp_payload_fragment_opcode = 1'b0;
      end
    end
  end

  assign when_BmbSlaveFactory_l35 = (factory_doRead && factory_readErrorFlag);
  always @(*) begin
    factory_rsp_payload_fragment_data = 32'h0;
    case(io_bus_cmd_payload_fragment_address)
      16'h0 : begin
        factory_rsp_payload_fragment_data[0 : 0] = logic_harts_0_softwareInterrupt;
      end
      default : begin
      end
    endcase
    if(when_BmbSlaveFactory_l77) begin
      factory_rsp_payload_fragment_data[31 : 0] = _zz_factory_rsp_payload_fragment_data[31 : 0];
    end
    if(when_BmbSlaveFactory_l77_1) begin
      factory_rsp_payload_fragment_data[31 : 0] = _zz_factory_rsp_payload_fragment_data[63 : 32];
    end
  end

  assign factory_rsp_payload_fragment_context = io_bus_cmd_payload_fragment_context;
  assign factory_rsp_payload_fragment_source = io_bus_cmd_payload_fragment_source;
  always @(*) begin
    logic_stop = 1'b0;
    if(io_stop) begin
      logic_stop = 1'b1;
    end
  end

  assign when_Clint_l39 = (! logic_stop);
  assign _zz_factory_rsp_payload_fragment_data = logic_time;
  assign io_timerInterrupt[0] = logic_harts_0_timerInterrupt;
  assign io_softwareInterrupt[0] = logic_harts_0_softwareInterrupt;
  assign io_time = logic_time;
  assign when_BmbSlaveFactory_l77 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'hbff8);
  assign when_BmbSlaveFactory_l77_1 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'hbffc);
  assign when_BmbSlaveFactory_l77_2 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'h4000);
  assign when_BmbSlaveFactory_l77_3 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'h4004);
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_bus_rsp_valid_1 <= 1'b0;
      logic_time <= 64'h0;
      logic_harts_0_softwareInterrupt <= 1'b0;
    end else begin
      if(_zz_factory_rsp_ready_1) begin
        _zz_io_bus_rsp_valid_1 <= (factory_rsp_valid && _zz_factory_rsp_ready);
      end
      if(when_Clint_l39) begin
        logic_time <= (logic_time + 64'h0000000000000001);
      end
      case(io_bus_cmd_payload_fragment_address)
        16'h0 : begin
          if(factory_doWrite) begin
            logic_harts_0_softwareInterrupt <= io_bus_cmd_payload_fragment_data[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_systemClk) begin
    if(_zz_factory_rsp_ready_1) begin
      _zz_io_bus_rsp_payload_last <= factory_rsp_payload_last;
      _zz_io_bus_rsp_payload_fragment_source <= factory_rsp_payload_fragment_source;
      _zz_io_bus_rsp_payload_fragment_opcode <= factory_rsp_payload_fragment_opcode;
      _zz_io_bus_rsp_payload_fragment_data <= factory_rsp_payload_fragment_data;
      _zz_io_bus_rsp_payload_fragment_context <= factory_rsp_payload_fragment_context;
    end
    logic_harts_0_timerInterrupt <= (logic_harts_0_cmp <= logic_time);
    if(when_BmbSlaveFactory_l77_2) begin
      if(factory_doWrite) begin
        logic_harts_0_cmp[31 : 0] <= io_bus_cmd_payload_fragment_data[31 : 0];
      end
    end
    if(when_BmbSlaveFactory_l77_3) begin
      if(factory_doWrite) begin
        logic_harts_0_cmp[63 : 32] <= io_bus_cmd_payload_fragment_data[31 : 0];
      end
    end
  end


endmodule

module BmbDecoder_3 (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_source,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [23:0]   io_input_cmd_payload_fragment_address,
  input  wire [1:0]    io_input_cmd_payload_fragment_length,
  input  wire [31:0]   io_input_cmd_payload_fragment_data,
  input  wire [3:0]    io_input_cmd_payload_fragment_mask,
  input  wire [0:0]    io_input_cmd_payload_fragment_context,
  output reg           io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output reg           io_input_rsp_payload_last,
  output reg  [0:0]    io_input_rsp_payload_fragment_source,
  output reg  [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output reg  [0:0]    io_input_rsp_payload_fragment_context,
  output reg           io_outputs_0_cmd_valid,
  input  wire          io_outputs_0_cmd_ready,
  output wire          io_outputs_0_cmd_payload_last,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_source,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output wire [23:0]   io_outputs_0_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_0_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_0_cmd_payload_fragment_mask,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_context,
  input  wire          io_outputs_0_rsp_valid,
  output wire          io_outputs_0_rsp_ready,
  input  wire          io_outputs_0_rsp_payload_last,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_source,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_0_rsp_payload_fragment_data,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_context,
  output reg           io_outputs_1_cmd_valid,
  input  wire          io_outputs_1_cmd_ready,
  output wire          io_outputs_1_cmd_payload_last,
  output wire [0:0]    io_outputs_1_cmd_payload_fragment_source,
  output wire [0:0]    io_outputs_1_cmd_payload_fragment_opcode,
  output wire [23:0]   io_outputs_1_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_1_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_1_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_1_cmd_payload_fragment_mask,
  output wire [0:0]    io_outputs_1_cmd_payload_fragment_context,
  input  wire          io_outputs_1_rsp_valid,
  output wire          io_outputs_1_rsp_ready,
  input  wire          io_outputs_1_rsp_payload_last,
  input  wire [0:0]    io_outputs_1_rsp_payload_fragment_source,
  input  wire [0:0]    io_outputs_1_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_1_rsp_payload_fragment_data,
  input  wire [0:0]    io_outputs_1_rsp_payload_fragment_context,
  output reg           io_outputs_2_cmd_valid,
  input  wire          io_outputs_2_cmd_ready,
  output wire          io_outputs_2_cmd_payload_last,
  output wire [0:0]    io_outputs_2_cmd_payload_fragment_source,
  output wire [0:0]    io_outputs_2_cmd_payload_fragment_opcode,
  output wire [23:0]   io_outputs_2_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_2_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_2_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_2_cmd_payload_fragment_mask,
  output wire [0:0]    io_outputs_2_cmd_payload_fragment_context,
  input  wire          io_outputs_2_rsp_valid,
  output wire          io_outputs_2_rsp_ready,
  input  wire          io_outputs_2_rsp_payload_last,
  input  wire [0:0]    io_outputs_2_rsp_payload_fragment_source,
  input  wire [0:0]    io_outputs_2_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_2_rsp_payload_fragment_data,
  input  wire [0:0]    io_outputs_2_rsp_payload_fragment_context,
  output reg           io_outputs_3_cmd_valid,
  input  wire          io_outputs_3_cmd_ready,
  output wire          io_outputs_3_cmd_payload_last,
  output wire [0:0]    io_outputs_3_cmd_payload_fragment_source,
  output wire [0:0]    io_outputs_3_cmd_payload_fragment_opcode,
  output wire [23:0]   io_outputs_3_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_3_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_3_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_3_cmd_payload_fragment_mask,
  output wire [0:0]    io_outputs_3_cmd_payload_fragment_context,
  input  wire          io_outputs_3_rsp_valid,
  output wire          io_outputs_3_rsp_ready,
  input  wire          io_outputs_3_rsp_payload_last,
  input  wire [0:0]    io_outputs_3_rsp_payload_fragment_source,
  input  wire [0:0]    io_outputs_3_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_3_rsp_payload_fragment_data,
  input  wire [0:0]    io_outputs_3_rsp_payload_fragment_context,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire       [3:0]    _zz_logic_rspPendingCounter;
  wire       [3:0]    _zz_logic_rspPendingCounter_1;
  wire       [0:0]    _zz_logic_rspPendingCounter_2;
  wire       [3:0]    _zz_logic_rspPendingCounter_3;
  wire       [0:0]    _zz_logic_rspPendingCounter_4;
  reg                 _zz_io_input_rsp_payload_last_3;
  reg        [0:0]    _zz_io_input_rsp_payload_fragment_source;
  reg        [0:0]    _zz_io_input_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_input_rsp_payload_fragment_data;
  reg        [0:0]    _zz_io_input_rsp_payload_fragment_context;
  wire                logic_input_valid;
  reg                 logic_input_ready;
  wire                logic_input_payload_last;
  wire       [0:0]    logic_input_payload_fragment_source;
  wire       [0:0]    logic_input_payload_fragment_opcode;
  wire       [23:0]   logic_input_payload_fragment_address;
  wire       [1:0]    logic_input_payload_fragment_length;
  wire       [31:0]   logic_input_payload_fragment_data;
  wire       [3:0]    logic_input_payload_fragment_mask;
  wire       [0:0]    logic_input_payload_fragment_context;
  reg                 io_input_cmd_rValid;
  wire                logic_input_fire;
  reg                 io_input_cmd_rData_last;
  reg        [0:0]    io_input_cmd_rData_fragment_source;
  reg        [0:0]    io_input_cmd_rData_fragment_opcode;
  reg        [23:0]   io_input_cmd_rData_fragment_address;
  reg        [1:0]    io_input_cmd_rData_fragment_length;
  reg        [31:0]   io_input_cmd_rData_fragment_data;
  reg        [3:0]    io_input_cmd_rData_fragment_mask;
  reg        [0:0]    io_input_cmd_rData_fragment_context;
  wire                logic_hitsS0_0;
  wire                logic_hitsS0_1;
  wire                logic_hitsS0_2;
  wire                logic_hitsS0_3;
  wire                logic_noHitS0;
  wire                io_input_cmd_fire;
  reg                 logic_hitsS1_0;
  reg                 logic_hitsS1_1;
  reg                 logic_hitsS1_2;
  reg                 logic_hitsS1_3;
  reg                 logic_noHitS1;
  wire                _zz_io_outputs_0_cmd_payload_last;
  wire                _zz_io_outputs_1_cmd_payload_last;
  wire                _zz_io_outputs_2_cmd_payload_last;
  wire                _zz_io_outputs_3_cmd_payload_last;
  reg        [3:0]    logic_rspPendingCounter;
  wire                io_input_rsp_fire;
  wire                logic_cmdWait;
  wire                when_BmbDecoder_l56;
  reg                 logic_rspHits_0;
  reg                 logic_rspHits_1;
  reg                 logic_rspHits_2;
  reg                 logic_rspHits_3;
  wire                logic_rspPending;
  wire                logic_rspNoHitValid;
  reg                 logic_rspNoHit_doIt;
  wire                when_BmbDecoder_l60;
  wire                when_BmbDecoder_l60_1;
  reg                 logic_rspNoHit_singleBeatRsp;
  reg        [0:0]    logic_rspNoHit_source;
  reg        [0:0]    logic_rspNoHit_context;
  wire                _zz_io_input_rsp_payload_last;
  wire                _zz_io_input_rsp_payload_last_1;
  wire       [1:0]    _zz_io_input_rsp_payload_last_2;

  assign _zz_logic_rspPendingCounter = (logic_rspPendingCounter + _zz_logic_rspPendingCounter_1);
  assign _zz_logic_rspPendingCounter_2 = (logic_input_fire && logic_input_payload_last);
  assign _zz_logic_rspPendingCounter_1 = {3'd0, _zz_logic_rspPendingCounter_2};
  assign _zz_logic_rspPendingCounter_4 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign _zz_logic_rspPendingCounter_3 = {3'd0, _zz_logic_rspPendingCounter_4};
  always @(*) begin
    case(_zz_io_input_rsp_payload_last_2)
      2'b00 : begin
        _zz_io_input_rsp_payload_last_3 = io_outputs_0_rsp_payload_last;
        _zz_io_input_rsp_payload_fragment_source = io_outputs_0_rsp_payload_fragment_source;
        _zz_io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
        _zz_io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;
        _zz_io_input_rsp_payload_fragment_context = io_outputs_0_rsp_payload_fragment_context;
      end
      2'b01 : begin
        _zz_io_input_rsp_payload_last_3 = io_outputs_1_rsp_payload_last;
        _zz_io_input_rsp_payload_fragment_source = io_outputs_1_rsp_payload_fragment_source;
        _zz_io_input_rsp_payload_fragment_opcode = io_outputs_1_rsp_payload_fragment_opcode;
        _zz_io_input_rsp_payload_fragment_data = io_outputs_1_rsp_payload_fragment_data;
        _zz_io_input_rsp_payload_fragment_context = io_outputs_1_rsp_payload_fragment_context;
      end
      2'b10 : begin
        _zz_io_input_rsp_payload_last_3 = io_outputs_2_rsp_payload_last;
        _zz_io_input_rsp_payload_fragment_source = io_outputs_2_rsp_payload_fragment_source;
        _zz_io_input_rsp_payload_fragment_opcode = io_outputs_2_rsp_payload_fragment_opcode;
        _zz_io_input_rsp_payload_fragment_data = io_outputs_2_rsp_payload_fragment_data;
        _zz_io_input_rsp_payload_fragment_context = io_outputs_2_rsp_payload_fragment_context;
      end
      default : begin
        _zz_io_input_rsp_payload_last_3 = io_outputs_3_rsp_payload_last;
        _zz_io_input_rsp_payload_fragment_source = io_outputs_3_rsp_payload_fragment_source;
        _zz_io_input_rsp_payload_fragment_opcode = io_outputs_3_rsp_payload_fragment_opcode;
        _zz_io_input_rsp_payload_fragment_data = io_outputs_3_rsp_payload_fragment_data;
        _zz_io_input_rsp_payload_fragment_context = io_outputs_3_rsp_payload_fragment_context;
      end
    endcase
  end

  assign logic_input_fire = (logic_input_valid && logic_input_ready);
  assign io_input_cmd_ready = (! io_input_cmd_rValid);
  assign logic_input_valid = io_input_cmd_rValid;
  assign logic_input_payload_last = io_input_cmd_rData_last;
  assign logic_input_payload_fragment_source = io_input_cmd_rData_fragment_source;
  assign logic_input_payload_fragment_opcode = io_input_cmd_rData_fragment_opcode;
  assign logic_input_payload_fragment_address = io_input_cmd_rData_fragment_address;
  assign logic_input_payload_fragment_length = io_input_cmd_rData_fragment_length;
  assign logic_input_payload_fragment_data = io_input_cmd_rData_fragment_data;
  assign logic_input_payload_fragment_mask = io_input_cmd_rData_fragment_mask;
  assign logic_input_payload_fragment_context = io_input_cmd_rData_fragment_context;
  assign logic_noHitS0 = (! (|{logic_hitsS0_3,{logic_hitsS0_2,{logic_hitsS0_1,logic_hitsS0_0}}}));
  assign io_input_cmd_fire = (io_input_cmd_valid && io_input_cmd_ready);
  assign logic_hitsS0_0 = ((io_input_cmd_payload_fragment_address & (~ 24'h3fffff)) == 24'hc00000);
  always @(*) begin
    io_outputs_0_cmd_valid = (logic_input_valid && logic_hitsS1_0);
    if(logic_cmdWait) begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_0_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_0_cmd_payload_last = _zz_io_outputs_0_cmd_payload_last;
  assign io_outputs_0_cmd_payload_fragment_source = logic_input_payload_fragment_source;
  assign io_outputs_0_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_0_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_0_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  assign io_outputs_0_cmd_payload_fragment_context = logic_input_payload_fragment_context;
  assign logic_hitsS0_1 = ((io_input_cmd_payload_fragment_address & (~ 24'h00ffff)) == 24'hb00000);
  always @(*) begin
    io_outputs_1_cmd_valid = (logic_input_valid && logic_hitsS1_1);
    if(logic_cmdWait) begin
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_1_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_1_cmd_payload_last = _zz_io_outputs_1_cmd_payload_last;
  assign io_outputs_1_cmd_payload_fragment_source = logic_input_payload_fragment_source;
  assign io_outputs_1_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_1_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_1_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_1_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_1_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  assign io_outputs_1_cmd_payload_fragment_context = logic_input_payload_fragment_context;
  assign logic_hitsS0_2 = ((io_input_cmd_payload_fragment_address & (~ 24'h00003f)) == 24'h010000);
  always @(*) begin
    io_outputs_2_cmd_valid = (logic_input_valid && logic_hitsS1_2);
    if(logic_cmdWait) begin
      io_outputs_2_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_2_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_2_cmd_payload_last = _zz_io_outputs_2_cmd_payload_last;
  assign io_outputs_2_cmd_payload_fragment_source = logic_input_payload_fragment_source;
  assign io_outputs_2_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_2_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_2_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_2_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_2_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  assign io_outputs_2_cmd_payload_fragment_context = logic_input_payload_fragment_context;
  assign logic_hitsS0_3 = ((io_input_cmd_payload_fragment_address & (~ 24'h0000ff)) == 24'h015000);
  always @(*) begin
    io_outputs_3_cmd_valid = (logic_input_valid && logic_hitsS1_3);
    if(logic_cmdWait) begin
      io_outputs_3_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_3_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_3_cmd_payload_last = _zz_io_outputs_3_cmd_payload_last;
  assign io_outputs_3_cmd_payload_fragment_source = logic_input_payload_fragment_source;
  assign io_outputs_3_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_3_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_3_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_3_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_3_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  assign io_outputs_3_cmd_payload_fragment_context = logic_input_payload_fragment_context;
  always @(*) begin
    logic_input_ready = ((|{(logic_hitsS1_3 && io_outputs_3_cmd_ready),{(logic_hitsS1_2 && io_outputs_2_cmd_ready),{(logic_hitsS1_1 && io_outputs_1_cmd_ready),(logic_hitsS1_0 && io_outputs_0_cmd_ready)}}}) || logic_noHitS1);
    if(logic_cmdWait) begin
      logic_input_ready = 1'b0;
    end
  end

  assign io_input_rsp_fire = (io_input_rsp_valid && io_input_rsp_ready);
  assign when_BmbDecoder_l56 = (logic_input_valid && (! logic_cmdWait));
  assign logic_rspPending = (logic_rspPendingCounter != 4'b0000);
  assign logic_rspNoHitValid = (! (|{logic_rspHits_3,{logic_rspHits_2,{logic_rspHits_1,logic_rspHits_0}}}));
  assign when_BmbDecoder_l60 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign when_BmbDecoder_l60_1 = ((logic_input_fire && logic_noHitS1) && logic_input_payload_last);
  always @(*) begin
    io_input_rsp_valid = ((|{io_outputs_3_rsp_valid,{io_outputs_2_rsp_valid,{io_outputs_1_rsp_valid,io_outputs_0_rsp_valid}}}) || (logic_rspPending && logic_rspNoHitValid));
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_valid = 1'b1;
    end
  end

  assign _zz_io_input_rsp_payload_last = (logic_rspHits_1 || logic_rspHits_3);
  assign _zz_io_input_rsp_payload_last_1 = (logic_rspHits_2 || logic_rspHits_3);
  assign _zz_io_input_rsp_payload_last_2 = {_zz_io_input_rsp_payload_last_1,_zz_io_input_rsp_payload_last};
  always @(*) begin
    io_input_rsp_payload_last = _zz_io_input_rsp_payload_last_3;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_last = 1'b1;
    end
  end

  always @(*) begin
    io_input_rsp_payload_fragment_source = _zz_io_input_rsp_payload_fragment_source;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_source = logic_rspNoHit_source;
    end
  end

  always @(*) begin
    io_input_rsp_payload_fragment_opcode = _zz_io_input_rsp_payload_fragment_opcode;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_opcode = 1'b1;
    end
  end

  assign io_input_rsp_payload_fragment_data = _zz_io_input_rsp_payload_fragment_data;
  always @(*) begin
    io_input_rsp_payload_fragment_context = _zz_io_input_rsp_payload_fragment_context;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_context = logic_rspNoHit_context;
    end
  end

  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign io_outputs_1_rsp_ready = io_input_rsp_ready;
  assign io_outputs_2_rsp_ready = io_input_rsp_ready;
  assign io_outputs_3_rsp_ready = io_input_rsp_ready;
  assign logic_cmdWait = ((logic_rspPending && (((((logic_hitsS1_0 != logic_rspHits_0) || (logic_hitsS1_1 != logic_rspHits_1)) || (logic_hitsS1_2 != logic_rspHits_2)) || (logic_hitsS1_3 != logic_rspHits_3)) || logic_rspNoHitValid)) || (logic_rspPendingCounter == 4'b1000));
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      io_input_cmd_rValid <= 1'b0;
      logic_rspPendingCounter <= 4'b0000;
      logic_rspNoHit_doIt <= 1'b0;
    end else begin
      if(io_input_cmd_valid) begin
        io_input_cmd_rValid <= 1'b1;
      end
      if(logic_input_fire) begin
        io_input_cmd_rValid <= 1'b0;
      end
      logic_rspPendingCounter <= (_zz_logic_rspPendingCounter - _zz_logic_rspPendingCounter_3);
      if(when_BmbDecoder_l60) begin
        logic_rspNoHit_doIt <= 1'b0;
      end
      if(when_BmbDecoder_l60_1) begin
        logic_rspNoHit_doIt <= 1'b1;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(io_input_cmd_ready) begin
      io_input_cmd_rData_last <= io_input_cmd_payload_last;
      io_input_cmd_rData_fragment_source <= io_input_cmd_payload_fragment_source;
      io_input_cmd_rData_fragment_opcode <= io_input_cmd_payload_fragment_opcode;
      io_input_cmd_rData_fragment_address <= io_input_cmd_payload_fragment_address;
      io_input_cmd_rData_fragment_length <= io_input_cmd_payload_fragment_length;
      io_input_cmd_rData_fragment_data <= io_input_cmd_payload_fragment_data;
      io_input_cmd_rData_fragment_mask <= io_input_cmd_payload_fragment_mask;
      io_input_cmd_rData_fragment_context <= io_input_cmd_payload_fragment_context;
    end
    if(io_input_cmd_fire) begin
      logic_hitsS1_0 <= logic_hitsS0_0;
      logic_hitsS1_1 <= logic_hitsS0_1;
      logic_hitsS1_2 <= logic_hitsS0_2;
      logic_hitsS1_3 <= logic_hitsS0_3;
    end
    if(io_input_cmd_fire) begin
      logic_noHitS1 <= logic_noHitS0;
    end
    if(when_BmbDecoder_l56) begin
      logic_rspHits_0 <= logic_hitsS1_0;
      logic_rspHits_1 <= logic_hitsS1_1;
      logic_rspHits_2 <= logic_hitsS1_2;
      logic_rspHits_3 <= logic_hitsS1_3;
    end
    if(logic_input_fire) begin
      logic_rspNoHit_singleBeatRsp <= (logic_input_payload_fragment_opcode == 1'b1);
    end
    if(logic_input_fire) begin
      logic_rspNoHit_source <= logic_input_payload_fragment_source;
    end
    if(logic_input_fire) begin
      logic_rspNoHit_context <= logic_input_payload_fragment_context;
    end
  end


endmodule

module BmbOnChipRam (
  input  wire          io_bus_cmd_valid,
  output wire          io_bus_cmd_ready,
  input  wire          io_bus_cmd_payload_last,
  input  wire [0:0]    io_bus_cmd_payload_fragment_source,
  input  wire [0:0]    io_bus_cmd_payload_fragment_opcode,
  input  wire [15:0]   io_bus_cmd_payload_fragment_address,
  input  wire [1:0]    io_bus_cmd_payload_fragment_length,
  input  wire [31:0]   io_bus_cmd_payload_fragment_data,
  input  wire [3:0]    io_bus_cmd_payload_fragment_mask,
  input  wire [0:0]    io_bus_cmd_payload_fragment_context,
  output wire          io_bus_rsp_valid,
  input  wire          io_bus_rsp_ready,
  output wire          io_bus_rsp_payload_last,
  output wire [0:0]    io_bus_rsp_payload_fragment_source,
  output wire [0:0]    io_bus_rsp_payload_fragment_opcode,
  output wire [31:0]   io_bus_rsp_payload_fragment_data,
  output wire [0:0]    io_bus_rsp_payload_fragment_context,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  reg        [31:0]   ram_spinal_port0;
  wire                enabled;
  wire                io_bus_rsp_isStall;
  reg                 io_bus_cmd_valid_regNextWhen;
  reg        [0:0]    io_bus_cmd_payload_fragment_source_regNextWhen;
  reg        [0:0]    io_bus_cmd_payload_fragment_context_regNextWhen;
  wire       [13:0]   address;
  wire       [31:0]   data;
  wire                io_bus_cmd_fire;
  wire                enable;
  wire                write;
  wire       [3:0]    mask;
  wire       [31:0]   _zz_io_bus_rsp_payload_fragment_data;
  reg [7:0] ram_symbol0 [0:16383];
  reg [7:0] ram_symbol1 [0:16383];
  reg [7:0] ram_symbol2 [0:16383];
  reg [7:0] ram_symbol3 [0:16383];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;

  initial begin
    $readmemb("EfxSapphireSoc.v_toplevel_system_ramA_logic_ram_symbol0.bin",ram_symbol0);
    $readmemb("EfxSapphireSoc.v_toplevel_system_ramA_logic_ram_symbol1.bin",ram_symbol1);
    $readmemb("EfxSapphireSoc.v_toplevel_system_ramA_logic_ram_symbol2.bin",ram_symbol2);
    $readmemb("EfxSapphireSoc.v_toplevel_system_ramA_logic_ram_symbol3.bin",ram_symbol3);
  end
  always @(*) begin
    ram_spinal_port0 = {_zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge io_systemClk) begin
    if(enable) begin
      _zz_ramsymbol_read <= ram_symbol0[address];
      _zz_ramsymbol_read_1 <= ram_symbol1[address];
      _zz_ramsymbol_read_2 <= ram_symbol2[address];
      _zz_ramsymbol_read_3 <= ram_symbol3[address];
    end
  end

  always @(posedge io_systemClk) begin
    if(mask[0] && enable && write ) begin
      ram_symbol0[address] <= _zz_io_bus_rsp_payload_fragment_data[7 : 0];
    end
    if(mask[1] && enable && write ) begin
      ram_symbol1[address] <= _zz_io_bus_rsp_payload_fragment_data[15 : 8];
    end
    if(mask[2] && enable && write ) begin
      ram_symbol2[address] <= _zz_io_bus_rsp_payload_fragment_data[23 : 16];
    end
    if(mask[3] && enable && write ) begin
      ram_symbol3[address] <= _zz_io_bus_rsp_payload_fragment_data[31 : 24];
    end
  end

  assign enabled = 1'b1;
  assign io_bus_rsp_isStall = (io_bus_rsp_valid && (! io_bus_rsp_ready));
  assign io_bus_cmd_ready = (! io_bus_rsp_isStall);
  assign io_bus_rsp_valid = io_bus_cmd_valid_regNextWhen;
  assign io_bus_rsp_payload_fragment_source = io_bus_cmd_payload_fragment_source_regNextWhen;
  assign io_bus_rsp_payload_fragment_context = io_bus_cmd_payload_fragment_context_regNextWhen;
  assign address = (io_bus_cmd_payload_fragment_address >>> 2'd2);
  assign data = io_bus_cmd_payload_fragment_data;
  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign enable = (io_bus_cmd_fire && enabled);
  assign write = (io_bus_cmd_payload_fragment_opcode == 1'b1);
  assign mask = io_bus_cmd_payload_fragment_mask;
  assign _zz_io_bus_rsp_payload_fragment_data = data;
  assign io_bus_rsp_payload_fragment_data = ram_spinal_port0;
  assign io_bus_rsp_payload_fragment_opcode = 1'b0;
  assign io_bus_rsp_payload_last = 1'b1;
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      io_bus_cmd_valid_regNextWhen <= 1'b0;
    end else begin
      if(io_bus_cmd_ready) begin
        io_bus_cmd_valid_regNextWhen <= io_bus_cmd_valid;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(io_bus_cmd_ready) begin
      io_bus_cmd_payload_fragment_source_regNextWhen <= io_bus_cmd_payload_fragment_source;
    end
    if(io_bus_cmd_ready) begin
      io_bus_cmd_payload_fragment_context_regNextWhen <= io_bus_cmd_payload_fragment_context;
    end
  end


endmodule

module BmbDecoder_2 (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_input_cmd_payload_fragment_address,
  input  wire [1:0]    io_input_cmd_payload_fragment_length,
  input  wire [31:0]   io_input_cmd_payload_fragment_data,
  input  wire [3:0]    io_input_cmd_payload_fragment_mask,
  output reg           io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output reg           io_input_rsp_payload_last,
  output reg  [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output reg           io_outputs_0_cmd_valid,
  input  wire          io_outputs_0_cmd_ready,
  output wire          io_outputs_0_cmd_payload_last,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_0_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_0_cmd_payload_fragment_mask,
  input  wire          io_outputs_0_rsp_valid,
  output wire          io_outputs_0_rsp_ready,
  input  wire          io_outputs_0_rsp_payload_last,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_0_rsp_payload_fragment_data,
  input  wire          io_systemClk,
  input  wire          debugCd_logic_outputReset
);

  wire       [6:0]    _zz_logic_rspPendingCounter;
  wire       [6:0]    _zz_logic_rspPendingCounter_1;
  wire       [0:0]    _zz_logic_rspPendingCounter_2;
  wire       [6:0]    _zz_logic_rspPendingCounter_3;
  wire       [0:0]    _zz_logic_rspPendingCounter_4;
  wire                logic_input_valid;
  reg                 logic_input_ready;
  wire                logic_input_payload_last;
  wire       [0:0]    logic_input_payload_fragment_opcode;
  wire       [31:0]   logic_input_payload_fragment_address;
  wire       [1:0]    logic_input_payload_fragment_length;
  wire       [31:0]   logic_input_payload_fragment_data;
  wire       [3:0]    logic_input_payload_fragment_mask;
  wire                logic_hitsS0_0;
  wire                logic_noHitS0;
  wire                _zz_io_outputs_0_cmd_payload_last;
  reg        [6:0]    logic_rspPendingCounter;
  wire                logic_input_fire;
  wire                io_input_rsp_fire;
  wire                logic_cmdWait;
  wire                when_BmbDecoder_l56;
  reg                 logic_rspHits_0;
  wire                logic_rspPending;
  wire                logic_rspNoHitValid;
  reg                 logic_rspNoHit_doIt;
  wire                when_BmbDecoder_l60;
  wire                when_BmbDecoder_l60_1;
  reg                 logic_rspNoHit_singleBeatRsp;

  assign _zz_logic_rspPendingCounter = (logic_rspPendingCounter + _zz_logic_rspPendingCounter_1);
  assign _zz_logic_rspPendingCounter_2 = (logic_input_fire && logic_input_payload_last);
  assign _zz_logic_rspPendingCounter_1 = {6'd0, _zz_logic_rspPendingCounter_2};
  assign _zz_logic_rspPendingCounter_4 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign _zz_logic_rspPendingCounter_3 = {6'd0, _zz_logic_rspPendingCounter_4};
  assign logic_input_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = logic_input_ready;
  assign logic_input_payload_last = io_input_cmd_payload_last;
  assign logic_input_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign logic_input_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign logic_input_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign logic_input_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign logic_input_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign logic_noHitS0 = (! (|logic_hitsS0_0));
  assign logic_hitsS0_0 = ((io_input_cmd_payload_fragment_address & (~ 32'h00000fff)) == 32'h10b80000);
  always @(*) begin
    io_outputs_0_cmd_valid = (logic_input_valid && logic_hitsS0_0);
    if(logic_cmdWait) begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_0_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_0_cmd_payload_last = _zz_io_outputs_0_cmd_payload_last;
  assign io_outputs_0_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_0_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_0_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  always @(*) begin
    logic_input_ready = ((|(logic_hitsS0_0 && io_outputs_0_cmd_ready)) || logic_noHitS0);
    if(logic_cmdWait) begin
      logic_input_ready = 1'b0;
    end
  end

  assign logic_input_fire = (logic_input_valid && logic_input_ready);
  assign io_input_rsp_fire = (io_input_rsp_valid && io_input_rsp_ready);
  assign when_BmbDecoder_l56 = (logic_input_valid && (! logic_cmdWait));
  assign logic_rspPending = (logic_rspPendingCounter != 7'h0);
  assign logic_rspNoHitValid = (! (|logic_rspHits_0));
  assign when_BmbDecoder_l60 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign when_BmbDecoder_l60_1 = ((logic_input_fire && logic_noHitS0) && logic_input_payload_last);
  always @(*) begin
    io_input_rsp_valid = ((|io_outputs_0_rsp_valid) || (logic_rspPending && logic_rspNoHitValid));
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_valid = 1'b1;
    end
  end

  always @(*) begin
    io_input_rsp_payload_last = io_outputs_0_rsp_payload_last;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_last = 1'b1;
    end
  end

  always @(*) begin
    io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_opcode = 1'b1;
    end
  end

  assign io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;
  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign logic_cmdWait = ((logic_rspPending && ((logic_hitsS0_0 != logic_rspHits_0) || logic_rspNoHitValid)) || (logic_rspPendingCounter == 7'h40));
  always @(posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      logic_rspPendingCounter <= 7'h0;
      logic_rspNoHit_doIt <= 1'b0;
    end else begin
      logic_rspPendingCounter <= (_zz_logic_rspPendingCounter - _zz_logic_rspPendingCounter_3);
      if(when_BmbDecoder_l60) begin
        logic_rspNoHit_doIt <= 1'b0;
      end
      if(when_BmbDecoder_l60_1) begin
        logic_rspNoHit_doIt <= 1'b1;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(when_BmbDecoder_l56) begin
      logic_rspHits_0 <= logic_hitsS0_0;
    end
    if(logic_input_fire) begin
      logic_rspNoHit_singleBeatRsp <= (logic_input_payload_fragment_opcode == 1'b1);
    end
  end


endmodule

module BmbDecoder_1 (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_source,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_input_cmd_payload_fragment_address,
  input  wire [1:0]    io_input_cmd_payload_fragment_length,
  input  wire [31:0]   io_input_cmd_payload_fragment_data,
  input  wire [3:0]    io_input_cmd_payload_fragment_mask,
  input  wire [0:0]    io_input_cmd_payload_fragment_context,
  output reg           io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output reg           io_input_rsp_payload_last,
  output reg  [0:0]    io_input_rsp_payload_fragment_source,
  output reg  [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output reg  [0:0]    io_input_rsp_payload_fragment_context,
  output reg           io_outputs_0_cmd_valid,
  input  wire          io_outputs_0_cmd_ready,
  output wire          io_outputs_0_cmd_payload_last,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_source,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_0_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_0_cmd_payload_fragment_mask,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_context,
  input  wire          io_outputs_0_rsp_valid,
  output wire          io_outputs_0_rsp_ready,
  input  wire          io_outputs_0_rsp_payload_last,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_source,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_0_rsp_payload_fragment_data,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_context,
  output reg           io_outputs_1_cmd_valid,
  input  wire          io_outputs_1_cmd_ready,
  output wire          io_outputs_1_cmd_payload_last,
  output wire [0:0]    io_outputs_1_cmd_payload_fragment_source,
  output wire [0:0]    io_outputs_1_cmd_payload_fragment_opcode,
  output wire [31:0]   io_outputs_1_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_1_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_1_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_1_cmd_payload_fragment_mask,
  output wire [0:0]    io_outputs_1_cmd_payload_fragment_context,
  input  wire          io_outputs_1_rsp_valid,
  output wire          io_outputs_1_rsp_ready,
  input  wire          io_outputs_1_rsp_payload_last,
  input  wire [0:0]    io_outputs_1_rsp_payload_fragment_source,
  input  wire [0:0]    io_outputs_1_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_1_rsp_payload_fragment_data,
  input  wire [0:0]    io_outputs_1_rsp_payload_fragment_context,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire       [6:0]    _zz_logic_rspPendingCounter;
  wire       [6:0]    _zz_logic_rspPendingCounter_1;
  wire       [0:0]    _zz_logic_rspPendingCounter_2;
  wire       [6:0]    _zz_logic_rspPendingCounter_3;
  wire       [0:0]    _zz_logic_rspPendingCounter_4;
  reg                 _zz_io_input_rsp_payload_last_1;
  reg        [0:0]    _zz_io_input_rsp_payload_fragment_source;
  reg        [0:0]    _zz_io_input_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_input_rsp_payload_fragment_data;
  reg        [0:0]    _zz_io_input_rsp_payload_fragment_context;
  wire                logic_input_valid;
  reg                 logic_input_ready;
  wire                logic_input_payload_last;
  wire       [0:0]    logic_input_payload_fragment_source;
  wire       [0:0]    logic_input_payload_fragment_opcode;
  wire       [31:0]   logic_input_payload_fragment_address;
  wire       [1:0]    logic_input_payload_fragment_length;
  wire       [31:0]   logic_input_payload_fragment_data;
  wire       [3:0]    logic_input_payload_fragment_mask;
  wire       [0:0]    logic_input_payload_fragment_context;
  wire                logic_hitsS0_0;
  wire                logic_hitsS0_1;
  wire                logic_noHitS0;
  wire                _zz_io_outputs_0_cmd_payload_last;
  wire                _zz_io_outputs_1_cmd_payload_last;
  reg        [6:0]    logic_rspPendingCounter;
  wire                logic_input_fire;
  wire                io_input_rsp_fire;
  wire                logic_cmdWait;
  wire                when_BmbDecoder_l56;
  reg                 logic_rspHits_0;
  reg                 logic_rspHits_1;
  wire                logic_rspPending;
  wire                logic_rspNoHitValid;
  reg                 logic_rspNoHit_doIt;
  wire                when_BmbDecoder_l60;
  wire                when_BmbDecoder_l60_1;
  reg                 logic_rspNoHit_singleBeatRsp;
  reg        [0:0]    logic_rspNoHit_source;
  reg        [0:0]    logic_rspNoHit_context;
  wire       [0:0]    _zz_io_input_rsp_payload_last;

  assign _zz_logic_rspPendingCounter = (logic_rspPendingCounter + _zz_logic_rspPendingCounter_1);
  assign _zz_logic_rspPendingCounter_2 = (logic_input_fire && logic_input_payload_last);
  assign _zz_logic_rspPendingCounter_1 = {6'd0, _zz_logic_rspPendingCounter_2};
  assign _zz_logic_rspPendingCounter_4 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign _zz_logic_rspPendingCounter_3 = {6'd0, _zz_logic_rspPendingCounter_4};
  always @(*) begin
    case(_zz_io_input_rsp_payload_last)
      1'b0 : begin
        _zz_io_input_rsp_payload_last_1 = io_outputs_0_rsp_payload_last;
        _zz_io_input_rsp_payload_fragment_source = io_outputs_0_rsp_payload_fragment_source;
        _zz_io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
        _zz_io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;
        _zz_io_input_rsp_payload_fragment_context = io_outputs_0_rsp_payload_fragment_context;
      end
      default : begin
        _zz_io_input_rsp_payload_last_1 = io_outputs_1_rsp_payload_last;
        _zz_io_input_rsp_payload_fragment_source = io_outputs_1_rsp_payload_fragment_source;
        _zz_io_input_rsp_payload_fragment_opcode = io_outputs_1_rsp_payload_fragment_opcode;
        _zz_io_input_rsp_payload_fragment_data = io_outputs_1_rsp_payload_fragment_data;
        _zz_io_input_rsp_payload_fragment_context = io_outputs_1_rsp_payload_fragment_context;
      end
    endcase
  end

  assign logic_input_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = logic_input_ready;
  assign logic_input_payload_last = io_input_cmd_payload_last;
  assign logic_input_payload_fragment_source = io_input_cmd_payload_fragment_source;
  assign logic_input_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign logic_input_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign logic_input_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign logic_input_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign logic_input_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign logic_input_payload_fragment_context = io_input_cmd_payload_fragment_context;
  assign logic_noHitS0 = (! (|{logic_hitsS0_1,logic_hitsS0_0}));
  assign logic_hitsS0_0 = ((io_input_cmd_payload_fragment_address & (~ 32'h0000ffff)) == 32'hf9000000);
  always @(*) begin
    io_outputs_0_cmd_valid = (logic_input_valid && logic_hitsS0_0);
    if(logic_cmdWait) begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_0_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_0_cmd_payload_last = _zz_io_outputs_0_cmd_payload_last;
  assign io_outputs_0_cmd_payload_fragment_source = logic_input_payload_fragment_source;
  assign io_outputs_0_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_0_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_0_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  assign io_outputs_0_cmd_payload_fragment_context = logic_input_payload_fragment_context;
  assign logic_hitsS0_1 = ((io_input_cmd_payload_fragment_address & (~ 32'h00ffffff)) == 32'hf8000000);
  always @(*) begin
    io_outputs_1_cmd_valid = (logic_input_valid && logic_hitsS0_1);
    if(logic_cmdWait) begin
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_1_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_1_cmd_payload_last = _zz_io_outputs_1_cmd_payload_last;
  assign io_outputs_1_cmd_payload_fragment_source = logic_input_payload_fragment_source;
  assign io_outputs_1_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_1_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_1_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_1_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_1_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  assign io_outputs_1_cmd_payload_fragment_context = logic_input_payload_fragment_context;
  always @(*) begin
    logic_input_ready = ((|{(logic_hitsS0_1 && io_outputs_1_cmd_ready),(logic_hitsS0_0 && io_outputs_0_cmd_ready)}) || logic_noHitS0);
    if(logic_cmdWait) begin
      logic_input_ready = 1'b0;
    end
  end

  assign logic_input_fire = (logic_input_valid && logic_input_ready);
  assign io_input_rsp_fire = (io_input_rsp_valid && io_input_rsp_ready);
  assign when_BmbDecoder_l56 = (logic_input_valid && (! logic_cmdWait));
  assign logic_rspPending = (logic_rspPendingCounter != 7'h0);
  assign logic_rspNoHitValid = (! (|{logic_rspHits_1,logic_rspHits_0}));
  assign when_BmbDecoder_l60 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign when_BmbDecoder_l60_1 = ((logic_input_fire && logic_noHitS0) && logic_input_payload_last);
  always @(*) begin
    io_input_rsp_valid = ((|{io_outputs_1_rsp_valid,io_outputs_0_rsp_valid}) || (logic_rspPending && logic_rspNoHitValid));
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_valid = 1'b1;
    end
  end

  assign _zz_io_input_rsp_payload_last = logic_rspHits_1;
  always @(*) begin
    io_input_rsp_payload_last = _zz_io_input_rsp_payload_last_1;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_last = 1'b1;
    end
  end

  always @(*) begin
    io_input_rsp_payload_fragment_source = _zz_io_input_rsp_payload_fragment_source;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_source = logic_rspNoHit_source;
    end
  end

  always @(*) begin
    io_input_rsp_payload_fragment_opcode = _zz_io_input_rsp_payload_fragment_opcode;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_opcode = 1'b1;
    end
  end

  assign io_input_rsp_payload_fragment_data = _zz_io_input_rsp_payload_fragment_data;
  always @(*) begin
    io_input_rsp_payload_fragment_context = _zz_io_input_rsp_payload_fragment_context;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_context = logic_rspNoHit_context;
    end
  end

  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign io_outputs_1_rsp_ready = io_input_rsp_ready;
  assign logic_cmdWait = ((logic_rspPending && (((logic_hitsS0_0 != logic_rspHits_0) || (logic_hitsS0_1 != logic_rspHits_1)) || logic_rspNoHitValid)) || (logic_rspPendingCounter == 7'h40));
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_rspPendingCounter <= 7'h0;
      logic_rspNoHit_doIt <= 1'b0;
    end else begin
      logic_rspPendingCounter <= (_zz_logic_rspPendingCounter - _zz_logic_rspPendingCounter_3);
      if(when_BmbDecoder_l60) begin
        logic_rspNoHit_doIt <= 1'b0;
      end
      if(when_BmbDecoder_l60_1) begin
        logic_rspNoHit_doIt <= 1'b1;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(when_BmbDecoder_l56) begin
      logic_rspHits_0 <= logic_hitsS0_0;
      logic_rspHits_1 <= logic_hitsS0_1;
    end
    if(logic_input_fire) begin
      logic_rspNoHit_singleBeatRsp <= (logic_input_payload_fragment_opcode == 1'b1);
    end
    if(logic_input_fire) begin
      logic_rspNoHit_source <= logic_input_payload_fragment_source;
    end
    if(logic_input_fire) begin
      logic_rspNoHit_context <= logic_input_payload_fragment_context;
    end
  end


endmodule

module BmbDecoder (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_input_cmd_payload_fragment_address,
  input  wire [1:0]    io_input_cmd_payload_fragment_length,
  output wire          io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output wire          io_input_rsp_payload_last,
  output wire [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output wire          io_outputs_0_cmd_valid,
  input  wire          io_outputs_0_cmd_ready,
  output wire          io_outputs_0_cmd_payload_last,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_0_cmd_payload_fragment_length,
  input  wire          io_outputs_0_rsp_valid,
  output wire          io_outputs_0_rsp_ready,
  input  wire          io_outputs_0_rsp_payload_last,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_0_rsp_payload_fragment_data
);


  assign io_outputs_0_cmd_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = io_outputs_0_cmd_ready;
  assign io_input_rsp_valid = io_outputs_0_rsp_valid;
  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign io_outputs_0_cmd_payload_last = io_input_cmd_payload_last;
  assign io_input_rsp_payload_last = io_outputs_0_rsp_payload_last;
  assign io_outputs_0_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;

endmodule

module BmbArbiter (
  input  wire          io_inputs_0_cmd_valid,
  output wire          io_inputs_0_cmd_ready,
  input  wire          io_inputs_0_cmd_payload_last,
  input  wire [0:0]    io_inputs_0_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_0_cmd_payload_fragment_address,
  input  wire [1:0]    io_inputs_0_cmd_payload_fragment_length,
  input  wire [31:0]   io_inputs_0_cmd_payload_fragment_data,
  input  wire [3:0]    io_inputs_0_cmd_payload_fragment_mask,
  input  wire [0:0]    io_inputs_0_cmd_payload_fragment_context,
  output wire          io_inputs_0_rsp_valid,
  input  wire          io_inputs_0_rsp_ready,
  output wire          io_inputs_0_rsp_payload_last,
  output wire [0:0]    io_inputs_0_rsp_payload_fragment_opcode,
  output wire [31:0]   io_inputs_0_rsp_payload_fragment_data,
  output wire [0:0]    io_inputs_0_rsp_payload_fragment_context,
  input  wire          io_inputs_1_cmd_valid,
  output wire          io_inputs_1_cmd_ready,
  input  wire          io_inputs_1_cmd_payload_last,
  input  wire [0:0]    io_inputs_1_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_1_cmd_payload_fragment_address,
  input  wire [1:0]    io_inputs_1_cmd_payload_fragment_length,
  input  wire [31:0]   io_inputs_1_cmd_payload_fragment_data,
  input  wire [3:0]    io_inputs_1_cmd_payload_fragment_mask,
  output wire          io_inputs_1_rsp_valid,
  input  wire          io_inputs_1_rsp_ready,
  output wire          io_inputs_1_rsp_payload_last,
  output wire [0:0]    io_inputs_1_rsp_payload_fragment_opcode,
  output wire [31:0]   io_inputs_1_rsp_payload_fragment_data,
  output wire          io_output_cmd_valid,
  input  wire          io_output_cmd_ready,
  output wire          io_output_cmd_payload_last,
  output wire [0:0]    io_output_cmd_payload_fragment_source,
  output wire [0:0]    io_output_cmd_payload_fragment_opcode,
  output wire [31:0]   io_output_cmd_payload_fragment_address,
  output wire [1:0]    io_output_cmd_payload_fragment_length,
  output wire [31:0]   io_output_cmd_payload_fragment_data,
  output wire [3:0]    io_output_cmd_payload_fragment_mask,
  output wire [0:0]    io_output_cmd_payload_fragment_context,
  input  wire          io_output_rsp_valid,
  output wire          io_output_rsp_ready,
  input  wire          io_output_rsp_payload_last,
  input  wire [0:0]    io_output_rsp_payload_fragment_source,
  input  wire [0:0]    io_output_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_output_rsp_payload_fragment_data,
  input  wire [0:0]    io_output_rsp_payload_fragment_context,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire                memory_arbiter_io_inputs_0_ready;
  wire                memory_arbiter_io_inputs_1_ready;
  wire                memory_arbiter_io_output_valid;
  wire                memory_arbiter_io_output_payload_last;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_opcode;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_address;
  wire       [1:0]    memory_arbiter_io_output_payload_fragment_length;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_data;
  wire       [3:0]    memory_arbiter_io_output_payload_fragment_mask;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_context;
  wire       [0:0]    memory_arbiter_io_chosen;
  wire       [1:0]    memory_arbiter_io_chosenOH;
  wire       [1:0]    _zz_io_output_cmd_payload_fragment_source;
  reg                 _zz_io_output_rsp_ready;
  wire       [0:0]    memory_rspSel;

  assign _zz_io_output_cmd_payload_fragment_source = {memory_arbiter_io_output_payload_fragment_source,memory_arbiter_io_chosen};
  StreamArbiter memory_arbiter (
    .io_inputs_0_valid                    (io_inputs_0_cmd_valid                                  ), //i
    .io_inputs_0_ready                    (memory_arbiter_io_inputs_0_ready                       ), //o
    .io_inputs_0_payload_last             (io_inputs_0_cmd_payload_last                           ), //i
    .io_inputs_0_payload_fragment_source  (1'b0                                                   ), //i
    .io_inputs_0_payload_fragment_opcode  (io_inputs_0_cmd_payload_fragment_opcode                ), //i
    .io_inputs_0_payload_fragment_address (io_inputs_0_cmd_payload_fragment_address[31:0]         ), //i
    .io_inputs_0_payload_fragment_length  (io_inputs_0_cmd_payload_fragment_length[1:0]           ), //i
    .io_inputs_0_payload_fragment_data    (io_inputs_0_cmd_payload_fragment_data[31:0]            ), //i
    .io_inputs_0_payload_fragment_mask    (io_inputs_0_cmd_payload_fragment_mask[3:0]             ), //i
    .io_inputs_0_payload_fragment_context (io_inputs_0_cmd_payload_fragment_context               ), //i
    .io_inputs_1_valid                    (io_inputs_1_cmd_valid                                  ), //i
    .io_inputs_1_ready                    (memory_arbiter_io_inputs_1_ready                       ), //o
    .io_inputs_1_payload_last             (io_inputs_1_cmd_payload_last                           ), //i
    .io_inputs_1_payload_fragment_source  (1'b0                                                   ), //i
    .io_inputs_1_payload_fragment_opcode  (io_inputs_1_cmd_payload_fragment_opcode                ), //i
    .io_inputs_1_payload_fragment_address (io_inputs_1_cmd_payload_fragment_address[31:0]         ), //i
    .io_inputs_1_payload_fragment_length  (io_inputs_1_cmd_payload_fragment_length[1:0]           ), //i
    .io_inputs_1_payload_fragment_data    (io_inputs_1_cmd_payload_fragment_data[31:0]            ), //i
    .io_inputs_1_payload_fragment_mask    (io_inputs_1_cmd_payload_fragment_mask[3:0]             ), //i
    .io_inputs_1_payload_fragment_context (1'b0                                                   ), //i
    .io_output_valid                      (memory_arbiter_io_output_valid                         ), //o
    .io_output_ready                      (io_output_cmd_ready                                    ), //i
    .io_output_payload_last               (memory_arbiter_io_output_payload_last                  ), //o
    .io_output_payload_fragment_source    (memory_arbiter_io_output_payload_fragment_source       ), //o
    .io_output_payload_fragment_opcode    (memory_arbiter_io_output_payload_fragment_opcode       ), //o
    .io_output_payload_fragment_address   (memory_arbiter_io_output_payload_fragment_address[31:0]), //o
    .io_output_payload_fragment_length    (memory_arbiter_io_output_payload_fragment_length[1:0]  ), //o
    .io_output_payload_fragment_data      (memory_arbiter_io_output_payload_fragment_data[31:0]   ), //o
    .io_output_payload_fragment_mask      (memory_arbiter_io_output_payload_fragment_mask[3:0]    ), //o
    .io_output_payload_fragment_context   (memory_arbiter_io_output_payload_fragment_context      ), //o
    .io_chosen                            (memory_arbiter_io_chosen                               ), //o
    .io_chosenOH                          (memory_arbiter_io_chosenOH[1:0]                        ), //o
    .io_systemClk                         (io_systemClk                                           ), //i
    .systemCd_logic_outputReset           (systemCd_logic_outputReset                             )  //i
  );
  always @(*) begin
    case(memory_rspSel)
      1'b0 : _zz_io_output_rsp_ready = io_inputs_0_rsp_ready;
      default : _zz_io_output_rsp_ready = io_inputs_1_rsp_ready;
    endcase
  end

  assign io_inputs_0_cmd_ready = memory_arbiter_io_inputs_0_ready;
  assign io_inputs_1_cmd_ready = memory_arbiter_io_inputs_1_ready;
  assign io_output_cmd_valid = memory_arbiter_io_output_valid;
  assign io_output_cmd_payload_last = memory_arbiter_io_output_payload_last;
  assign io_output_cmd_payload_fragment_opcode = memory_arbiter_io_output_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = memory_arbiter_io_output_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = memory_arbiter_io_output_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = memory_arbiter_io_output_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = memory_arbiter_io_output_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = memory_arbiter_io_output_payload_fragment_context;
  assign io_output_cmd_payload_fragment_source = _zz_io_output_cmd_payload_fragment_source[0:0];
  assign memory_rspSel = io_output_rsp_payload_fragment_source[0 : 0];
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b0));
  assign io_inputs_0_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_0_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_0_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_0_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b1));
  assign io_inputs_1_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_1_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_1_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_output_rsp_ready = _zz_io_output_rsp_ready;

endmodule

module SystemDebugger (
  input  wire          io_remote_cmd_valid,
  output wire          io_remote_cmd_ready,
  input  wire          io_remote_cmd_payload_last,
  input  wire [0:0]    io_remote_cmd_payload_fragment,
  output wire          io_remote_rsp_valid,
  input  wire          io_remote_rsp_ready,
  output wire          io_remote_rsp_payload_error,
  output wire [31:0]   io_remote_rsp_payload_data,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire          io_mem_cmd_payload_wr,
  output wire [1:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload,
  input  wire          io_systemClk,
  input  wire          debugCd_logic_outputReset
);

  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l356;
  wire                when_Fragment_l359;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l382;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l356 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l359 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l382 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l356) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l359) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l382) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l356) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1'd1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1'd1);
      end
    end
  end


endmodule

module JtagBridgeNoTap (
  input  wire          io_ctrl_tdi,
  input  wire          io_ctrl_enable,
  input  wire          io_ctrl_capture,
  input  wire          io_ctrl_shift,
  input  wire          io_ctrl_update,
  input  wire          io_ctrl_reset,
  output wire          io_ctrl_tdo,
  output wire          io_remote_cmd_valid,
  input  wire          io_remote_cmd_ready,
  output wire          io_remote_cmd_payload_last,
  output wire [0:0]    io_remote_cmd_payload_fragment,
  input  wire          io_remote_rsp_valid,
  output wire          io_remote_rsp_ready,
  input  wire          io_remote_rsp_payload_error,
  input  wire [31:0]   io_remote_rsp_payload_data,
  input  wire          io_systemClk,
  input  wire          debugCd_logic_outputReset,
  input  wire          io_jtag_tck
);

  wire                flowCCUnsafeByToggle_1_io_output_valid;
  wire                flowCCUnsafeByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCUnsafeByToggle_1_io_output_payload_fragment;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  wire                system_cmd_toStream_valid;
  wire                system_cmd_toStream_ready;
  wire                system_cmd_toStream_payload_last;
  wire       [0:0]    system_cmd_toStream_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire                jtag_wrapper_ctrl_tdi;
  wire                jtag_wrapper_ctrl_enable;
  wire                jtag_wrapper_ctrl_capture;
  wire                jtag_wrapper_ctrl_shift;
  wire                jtag_wrapper_ctrl_update;
  wire                jtag_wrapper_ctrl_reset;
  reg                 jtag_wrapper_ctrl_tdo;
  reg        [1:0]    jtag_wrapper_header;
  wire       [1:0]    jtag_wrapper_headerNext;
  reg        [0:0]    jtag_wrapper_counter;
  reg                 jtag_wrapper_done;
  reg                 jtag_wrapper_sendCapture;
  reg                 jtag_wrapper_sendShift;
  reg                 jtag_wrapper_sendUpdate;
  wire                when_JtagTapInstructions_l183;
  wire                when_JtagTapInstructions_l186;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                when_JtagTapInstructions_l209;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  wire                when_JtagTapInstructions_l209_1;

  FlowCCUnsafeByToggle flowCCUnsafeByToggle_1 (
    .io_input_valid             (jtag_writeArea_source_valid                      ), //i
    .io_input_payload_last      (jtag_writeArea_source_payload_last               ), //i
    .io_input_payload_fragment  (jtag_writeArea_source_payload_fragment           ), //i
    .io_output_valid            (flowCCUnsafeByToggle_1_io_output_valid           ), //o
    .io_output_payload_last     (flowCCUnsafeByToggle_1_io_output_payload_last    ), //o
    .io_output_payload_fragment (flowCCUnsafeByToggle_1_io_output_payload_fragment), //o
    .io_jtag_tck                (io_jtag_tck                                      ), //i
    .io_systemClk               (io_systemClk                                     ), //i
    .debugCd_logic_outputReset  (debugCd_logic_outputReset                        )  //i
  );
  assign system_cmd_toStream_valid = system_cmd_valid;
  assign system_cmd_toStream_payload_last = system_cmd_payload_last;
  assign system_cmd_toStream_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_cmd_valid = system_cmd_toStream_valid;
  assign system_cmd_toStream_ready = io_remote_cmd_ready;
  assign io_remote_cmd_payload_last = system_cmd_toStream_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_toStream_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  assign jtag_wrapper_headerNext = ({jtag_wrapper_ctrl_tdi,jtag_wrapper_header} >>> 1'd1);
  always @(*) begin
    jtag_wrapper_sendCapture = 1'b0;
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_shift) begin
        if(when_JtagTapInstructions_l183) begin
          if(when_JtagTapInstructions_l186) begin
            jtag_wrapper_sendCapture = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    jtag_wrapper_sendShift = 1'b0;
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_shift) begin
        if(!when_JtagTapInstructions_l183) begin
          jtag_wrapper_sendShift = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    jtag_wrapper_sendUpdate = 1'b0;
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_update) begin
        jtag_wrapper_sendUpdate = 1'b1;
      end
    end
  end

  assign when_JtagTapInstructions_l183 = (! jtag_wrapper_done);
  assign when_JtagTapInstructions_l186 = (jtag_wrapper_counter == 1'b1);
  always @(*) begin
    jtag_wrapper_ctrl_tdo = 1'b0;
    if(when_JtagTapInstructions_l209) begin
      jtag_wrapper_ctrl_tdo = jtag_writeArea_ctrl_tdo;
    end
    if(when_JtagTapInstructions_l209_1) begin
      jtag_wrapper_ctrl_tdo = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_wrapper_ctrl_tdi = io_ctrl_tdi;
  assign jtag_wrapper_ctrl_enable = io_ctrl_enable;
  assign jtag_wrapper_ctrl_capture = io_ctrl_capture;
  assign jtag_wrapper_ctrl_shift = io_ctrl_shift;
  assign jtag_wrapper_ctrl_update = io_ctrl_update;
  assign jtag_wrapper_ctrl_reset = io_ctrl_reset;
  assign io_ctrl_tdo = jtag_wrapper_ctrl_tdo;
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCUnsafeByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCUnsafeByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCUnsafeByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign when_JtagTapInstructions_l209 = (jtag_wrapper_header == 2'b00);
  assign jtag_writeArea_ctrl_tdi = jtag_wrapper_ctrl_tdi;
  assign jtag_writeArea_ctrl_enable = 1'b1;
  assign jtag_writeArea_ctrl_capture = ((jtag_wrapper_headerNext == 2'b00) && jtag_wrapper_sendCapture);
  assign jtag_writeArea_ctrl_shift = (when_JtagTapInstructions_l209 && jtag_wrapper_sendShift);
  assign jtag_writeArea_ctrl_update = (when_JtagTapInstructions_l209 && jtag_wrapper_sendUpdate);
  assign jtag_writeArea_ctrl_reset = jtag_wrapper_ctrl_reset;
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign when_JtagTapInstructions_l209_1 = (jtag_wrapper_header == 2'b01);
  assign jtag_readArea_ctrl_tdi = jtag_wrapper_ctrl_tdi;
  assign jtag_readArea_ctrl_enable = 1'b1;
  assign jtag_readArea_ctrl_capture = ((jtag_wrapper_headerNext == 2'b01) && jtag_wrapper_sendCapture);
  assign jtag_readArea_ctrl_shift = (when_JtagTapInstructions_l209_1 && jtag_wrapper_sendShift);
  assign jtag_readArea_ctrl_update = (when_JtagTapInstructions_l209_1 && jtag_wrapper_sendUpdate);
  assign jtag_readArea_ctrl_reset = jtag_wrapper_ctrl_reset;
  always @(posedge io_systemClk) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_capture) begin
        jtag_wrapper_done <= 1'b0;
        jtag_wrapper_counter <= 1'b0;
      end
      if(jtag_wrapper_ctrl_shift) begin
        if(when_JtagTapInstructions_l183) begin
          jtag_wrapper_counter <= (jtag_wrapper_counter + 1'b1);
          jtag_wrapper_header <= jtag_wrapper_headerNext;
          if(when_JtagTapInstructions_l186) begin
            jtag_wrapper_done <= 1'b1;
          end
        end
      end
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1'd1);
      end
    end
  end


endmodule

module BufferCC_5 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_systemClk,
  input  wire          system_cores_0_debugReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_systemClk or posedge system_cores_0_debugReset) begin
    if(system_cores_0_debugReset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_4 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_systemClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module VexRiscv (
  output wire          iBus_cmd_valid,
  input  wire          iBus_cmd_ready,
  output wire [31:0]   iBus_cmd_payload_pc,
  input  wire          iBus_rsp_valid,
  input  wire          iBus_rsp_payload_error,
  input  wire [31:0]   iBus_rsp_payload_inst,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  input  wire          debug_bus_cmd_valid,
  output reg           debug_bus_cmd_ready,
  input  wire          debug_bus_cmd_payload_wr,
  input  wire [7:0]    debug_bus_cmd_payload_address,
  input  wire [31:0]   debug_bus_cmd_payload_data,
  output reg  [31:0]   debug_bus_rsp_data,
  output wire          debug_resetOut,
  output wire          dBus_cmd_valid,
  input  wire          dBus_cmd_ready,
  output wire          dBus_cmd_payload_wr,
  output wire [31:0]   dBus_cmd_payload_address,
  output wire [31:0]   dBus_cmd_payload_data,
  output wire [1:0]    dBus_cmd_payload_size,
  input  wire          dBus_rsp_ready,
  input  wire          dBus_rsp_error,
  input  wire [31:0]   dBus_rsp_data,
  output wire          stopTime,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset,
  input  wire          debugCd_logic_outputReset
);
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam EnvCtrlEnum_NONE = 2'd0;
  localparam EnvCtrlEnum_XRET = 2'd1;
  localparam EnvCtrlEnum_ECALL = 2'd2;
  localparam EnvCtrlEnum_EBREAK = 2'd3;
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port0;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port1;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [1:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire       [1:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_availability;
  wire       [31:0]   EfxCPUSp1_inst_result;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [12:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [6:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_2;
  wire       [31:0]   _zz_IBusSimplePlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusSimplePlugin_fetchPc_pc_1;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_1;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_2;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_3;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_4;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_2;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_3;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_1;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_2;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_3;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_4;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_5;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_6;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_7;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_8;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_9;
  wire       [19:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_10;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_11;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_12;
  wire       [1:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_13;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_14;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_15;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_16;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_17;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_18;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_19;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_20;
  wire       [15:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_21;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_22;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_23;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_24;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_25;
  wire       [1:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_26;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_27;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_28;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_29;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_30;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_31;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_32;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_33;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_34;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_35;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_36;
  wire       [11:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_37;
  wire       [4:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_38;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_39;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_40;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_41;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_42;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_43;
  wire       [1:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_44;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_45;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_46;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_47;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_48;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_49;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_50;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_51;
  wire       [8:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_52;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_53;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_54;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_55;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_56;
  wire       [3:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_57;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_58;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_59;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_60;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_61;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_62;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_63;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_64;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_65;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_66;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_67;
  wire       [5:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_68;
  wire       [1:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_69;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_70;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_71;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_72;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_73;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_74;
  wire       [1:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_75;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_76;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_77;
  wire       [0:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_78;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_79;
  wire       [2:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_80;
  wire       [2:0]    _zz__zz_decode_SRC_LESS_UNSIGNED_81;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_82;
  wire       [31:0]   _zz__zz_decode_SRC_LESS_UNSIGNED_83;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_84;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_85;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_86;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_87;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_88;
  wire                _zz__zz_decode_SRC_LESS_UNSIGNED_89;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [2:0]    _zz__zz_decode_SRC1;
  wire       [4:0]    _zz__zz_decode_SRC1_1;
  wire       [11:0]   _zz__zz_decode_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [31:0]   _zz__zz_decode_RS2_3;
  wire       [32:0]   _zz__zz_decode_RS2_3_1;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire       [1:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [1:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [1:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [1:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [1:0]    decode_ENV_CTRL;
  wire       [1:0]    _zz_decode_ENV_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_ENABLE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                execute_SRC_LESS;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [1:0]    memory_ENV_CTRL;
  wire       [1:0]    _zz_memory_ENV_CTRL;
  wire       [1:0]    execute_ENV_CTRL;
  wire       [1:0]    _zz_execute_ENV_CTRL;
  wire       [1:0]    writeBack_ENV_CTRL;
  wire       [1:0]    _zz_writeBack_ENV_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire       [31:0]   _zz_decode_RS2;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire       [31:0]   execute_SRC2;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   execute_SRC1;
  wire       [31:0]   _zz_decode_to_execute_PC;
  wire       [31:0]   _zz_decode_to_execute_RS2;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [31:0]   _zz_decode_to_execute_RS1;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  wire       [1:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  wire                IBusSimplePlugin_forceNoDecodeCond;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_csrMapping_doForceFailCsr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                CsrPlugin_xretAwayFromMachine;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  reg                 BranchPlugin_inDebugNoFetchFlag;
  reg                 DebugPlugin_injectionPort_valid;
  reg                 DebugPlugin_injectionPort_ready;
  wire       [31:0]   DebugPlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_output_fire;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  wire                when_Fetcher_l322;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l331_4;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_5;
  wire                when_Fetcher_l331_5;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                when_IBusSimplePlugin_l305;
  wire                IBusSimplePlugin_cmd_fire;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                iBus_rsp_toStream_valid;
  wire                iBus_rsp_toStream_ready;
  wire                iBus_rsp_toStream_payload_error;
  wire       [31:0]   iBus_rsp_toStream_payload_inst;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                when_IBusSimplePlugin_l376;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                IBusSimplePlugin_rspJoin_join_fire;
  wire                _zz_IBusSimplePlugin_iBusRsp_output_valid;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l436;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l490;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l241;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_1;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l566;
  wire       [26:0]   _zz_decode_SRC_LESS_UNSIGNED;
  wire                _zz_decode_SRC_LESS_UNSIGNED_1;
  wire                _zz_decode_SRC_LESS_UNSIGNED_2;
  wire                _zz_decode_SRC_LESS_UNSIGNED_3;
  wire                _zz_decode_SRC_LESS_UNSIGNED_4;
  wire                _zz_decode_SRC_LESS_UNSIGNED_5;
  wire                _zz_decode_SRC_LESS_UNSIGNED_6;
  wire                _zz_decode_SRC_LESS_UNSIGNED_7;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_ENV_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_5;
  reg        [31:0]   _zz_decode_SRC1;
  wire                _zz_decode_SRC2;
  reg        [19:0]   _zz_decode_SRC2_1;
  wire                _zz_decode_SRC2_2;
  reg        [19:0]   _zz_decode_SRC2_3;
  reg        [31:0]   _zz_decode_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  wire                when_ShiftPlugins_l169;
  reg        [31:0]   _zz_decode_RS2_3;
  wire                when_ShiftPlugins_l175;
  wire                when_ShiftPlugins_l184;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_counters_mcycle;
  reg        [63:0]   CsrPlugin_counters_minstret;
  wire                _zz_when_CsrPlugin_l1446;
  wire                _zz_when_CsrPlugin_l1446_1;
  wire                _zz_when_CsrPlugin_l1446_2;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire                when_CsrPlugin_l1403;
  wire                when_CsrPlugin_l1403_1;
  wire                when_CsrPlugin_l1403_2;
  wire                when_CsrPlugin_l1403_3;
  wire                when_CsrPlugin_l1416;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1440;
  wire                when_CsrPlugin_l1446;
  wire                when_CsrPlugin_l1446_1;
  wire                when_CsrPlugin_l1446_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1479;
  wire                when_CsrPlugin_l1479_1;
  wire                when_CsrPlugin_l1479_2;
  wire                when_CsrPlugin_l1484;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l1490;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1534;
  wire                when_CsrPlugin_l1542;
  wire                when_CsrPlugin_l1600;
  wire       [1:0]    switch_CsrPlugin_l1604;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1671;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1684;
  wire                when_CsrPlugin_l1691;
  wire                when_CsrPlugin_l1692;
  wire                when_CsrPlugin_l1699;
  wire                when_CsrPlugin_l1709;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l241_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1731;
  wire                when_CsrPlugin_l1735;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l241_2;
  reg                 _zz_execute_BRANCH_DO;
  reg                 _zz_execute_BRANCH_DO_1;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  reg        [31:0]   _zz_execute_BranchPlugin_branch_src2_6;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l240;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l259;
  wire                when_DebugPlugin_l259;
  wire       [5:0]    switch_DebugPlugin_l282;
  wire                when_DebugPlugin_l286;
  wire                when_DebugPlugin_l286_1;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l287_1;
  wire                when_DebugPlugin_l288;
  wire                when_DebugPlugin_l289;
  wire                when_DebugPlugin_l290;
  wire                when_DebugPlugin_l290_1;
  wire                when_DebugPlugin_l310;
  wire                when_DebugPlugin_l313;
  wire                when_DebugPlugin_l326;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l346;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_11;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_12;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_14;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_15;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_16;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_17;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_18;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_20;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_21;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_22;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_23;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_24;
  reg        [1:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_25;
  reg        [1:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_26;
  reg        [1:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_27;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_28;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_29;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_30;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_31;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_32;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_33;
  reg        [31:0]   decode_to_execute_SRC1;
  wire                when_Pipeline_l124_34;
  reg        [31:0]   decode_to_execute_SRC2;
  wire                when_Pipeline_l124_35;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_38;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_39;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_40;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_41;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_42;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_43;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_44;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    IBusSimplePlugin_injector_port_state;
  wire                when_Fetcher_l391;
  wire                when_Fetcher_l411;
  wire                when_CsrPlugin_l1813;
  reg                 execute_CsrPlugin_csr_3857;
  wire                when_CsrPlugin_l1813_1;
  reg                 execute_CsrPlugin_csr_3858;
  wire                when_CsrPlugin_l1813_2;
  reg                 execute_CsrPlugin_csr_3859;
  wire                when_CsrPlugin_l1813_3;
  reg                 execute_CsrPlugin_csr_3860;
  wire                when_CsrPlugin_l1813_4;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1813_5;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1813_6;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1813_7;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1813_8;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1813_9;
  reg                 execute_CsrPlugin_csr_834;
  wire       [1:0]    switch_CsrPlugin_l1167;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  wire                when_CsrPlugin_l1846;
  wire       [11:0]   _zz_when_CsrPlugin_l1853;
  wire                when_CsrPlugin_l1853;
  reg                 when_CsrPlugin_l1863;
  wire                when_CsrPlugin_l1861;
  wire                when_CsrPlugin_l1869;
  `ifndef SYNTHESIS
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_memory_ENV_CTRL_string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_execute_ENV_CTRL_string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_writeBack_ENV_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [47:0] _zz_decode_ENV_CTRL_1_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [47:0] _zz_decode_ENV_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload & (~ _zz_IBusSimplePlugin_jump_pcLoad_payload_2));
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_2 = (_zz_IBusSimplePlugin_jump_pcLoad_payload - 2'b01);
  assign _zz_IBusSimplePlugin_fetchPc_pc_1 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_IBusSimplePlugin_fetchPc_pc = {29'd0, _zz_IBusSimplePlugin_fetchPc_pc_1};
  assign _zz_IBusSimplePlugin_pending_next = (IBusSimplePlugin_pending_value + _zz_IBusSimplePlugin_pending_next_1);
  assign _zz_IBusSimplePlugin_pending_next_2 = IBusSimplePlugin_pending_inc;
  assign _zz_IBusSimplePlugin_pending_next_1 = {2'd0, _zz_IBusSimplePlugin_pending_next_2};
  assign _zz_IBusSimplePlugin_pending_next_4 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_pending_next_3 = {2'd0, _zz_IBusSimplePlugin_pending_next_4};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_3 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_2 = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_3};
  assign _zz__zz_decode_SRC1 = 3'b100;
  assign _zz__zz_decode_SRC1_1 = decode_INSTRUCTION[19 : 15];
  assign _zz__zz_decode_SRC2_2 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h0);
  assign _zz__zz_decode_RS2_3 = (_zz__zz_decode_RS2_3_1 >>> 1'd1);
  assign _zz__zz_decode_RS2_3_1 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz__zz_execute_BranchPlugin_branch_src2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000107f) == 32'h00000013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000207f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000003;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfe00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'hbe00705f) == 32'h00005013),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00001013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hfe00305f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00000033;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED = 32'h00003000;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_1 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_2 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_3 = _zz_decode_SRC_LESS_UNSIGNED_6;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_4 = ((decode_INSTRUCTION & 32'h0000001c) == 32'h00000004);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_5 = ((decode_INSTRUCTION & 32'h00000058) == 32'h00000040);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_6 = (|_zz_decode_SRC_LESS_UNSIGNED_7);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_7 = (|(_zz__zz_decode_SRC_LESS_UNSIGNED_8 == _zz__zz_decode_SRC_LESS_UNSIGNED_9));
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_10 = {(|{_zz__zz_decode_SRC_LESS_UNSIGNED_11,_zz__zz_decode_SRC_LESS_UNSIGNED_12}),{(|_zz__zz_decode_SRC_LESS_UNSIGNED_13),{_zz__zz_decode_SRC_LESS_UNSIGNED_16,{_zz__zz_decode_SRC_LESS_UNSIGNED_18,_zz__zz_decode_SRC_LESS_UNSIGNED_21}}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_8 = (decode_INSTRUCTION & 32'h10003050);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_9 = 32'h00000050;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_11 = _zz_decode_SRC_LESS_UNSIGNED_7;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_12 = ((decode_INSTRUCTION & 32'h10403050) == 32'h10000050);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_13 = {((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_14) == 32'h00001050),((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_15) == 32'h00002050)};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_16 = (|((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_17) == 32'h00005010));
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_18 = (|{_zz__zz_decode_SRC_LESS_UNSIGNED_19,_zz__zz_decode_SRC_LESS_UNSIGNED_20});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_21 = {(|{_zz__zz_decode_SRC_LESS_UNSIGNED_22,_zz__zz_decode_SRC_LESS_UNSIGNED_24}),{(|_zz__zz_decode_SRC_LESS_UNSIGNED_26),{_zz__zz_decode_SRC_LESS_UNSIGNED_31,{_zz__zz_decode_SRC_LESS_UNSIGNED_32,_zz__zz_decode_SRC_LESS_UNSIGNED_37}}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_14 = 32'h00001050;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_15 = 32'h00002050;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_17 = 32'h00007054;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_19 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_20 = ((decode_INSTRUCTION & 32'h00007054) == 32'h00001010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_22 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_23) == 32'h00000024);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_24 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_25) == 32'h00001010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_26 = {(_zz__zz_decode_SRC_LESS_UNSIGNED_27 == _zz__zz_decode_SRC_LESS_UNSIGNED_28),(_zz__zz_decode_SRC_LESS_UNSIGNED_29 == _zz__zz_decode_SRC_LESS_UNSIGNED_30)};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_31 = (|_zz_decode_SRC_LESS_UNSIGNED_2);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_32 = (|{_zz__zz_decode_SRC_LESS_UNSIGNED_33,_zz__zz_decode_SRC_LESS_UNSIGNED_35});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_37 = {(|_zz__zz_decode_SRC_LESS_UNSIGNED_38),{_zz__zz_decode_SRC_LESS_UNSIGNED_47,{_zz__zz_decode_SRC_LESS_UNSIGNED_50,_zz__zz_decode_SRC_LESS_UNSIGNED_52}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_23 = 32'h00000064;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_25 = 32'h00003054;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_27 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_28 = 32'h00006000;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_29 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_30 = 32'h00004000;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_33 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_34) == 32'h00000020);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_35 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_36) == 32'h00000020);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_38 = {(_zz__zz_decode_SRC_LESS_UNSIGNED_39 == _zz__zz_decode_SRC_LESS_UNSIGNED_40),{_zz__zz_decode_SRC_LESS_UNSIGNED_41,{_zz__zz_decode_SRC_LESS_UNSIGNED_42,_zz__zz_decode_SRC_LESS_UNSIGNED_44}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_47 = (|(_zz__zz_decode_SRC_LESS_UNSIGNED_48 == _zz__zz_decode_SRC_LESS_UNSIGNED_49));
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_50 = (|_zz__zz_decode_SRC_LESS_UNSIGNED_51);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_52 = {(|_zz__zz_decode_SRC_LESS_UNSIGNED_53),{_zz__zz_decode_SRC_LESS_UNSIGNED_54,{_zz__zz_decode_SRC_LESS_UNSIGNED_64,_zz__zz_decode_SRC_LESS_UNSIGNED_68}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_34 = 32'h00000034;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_36 = 32'h00000064;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_39 = (decode_INSTRUCTION & 32'h00002040);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_40 = 32'h00002040;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_41 = ((decode_INSTRUCTION & 32'h00001040) == 32'h00001040);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_42 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_43) == 32'h00000040);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_44 = {(_zz__zz_decode_SRC_LESS_UNSIGNED_45 == _zz__zz_decode_SRC_LESS_UNSIGNED_46),_zz_decode_SRC_LESS_UNSIGNED_3};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_48 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_49 = 32'h00000020;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_51 = ((decode_INSTRUCTION & 32'h00000010) == 32'h00000010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_53 = _zz_decode_SRC_LESS_UNSIGNED_5;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_54 = (|{_zz_decode_SRC_LESS_UNSIGNED_6,{_zz__zz_decode_SRC_LESS_UNSIGNED_55,_zz__zz_decode_SRC_LESS_UNSIGNED_57}});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_64 = (|{_zz__zz_decode_SRC_LESS_UNSIGNED_65,_zz__zz_decode_SRC_LESS_UNSIGNED_66});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_68 = {(|_zz__zz_decode_SRC_LESS_UNSIGNED_69),{_zz__zz_decode_SRC_LESS_UNSIGNED_72,{_zz__zz_decode_SRC_LESS_UNSIGNED_78,_zz__zz_decode_SRC_LESS_UNSIGNED_80}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_43 = 32'h00000050;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_45 = (decode_INSTRUCTION & 32'h00400040);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_46 = 32'h00000040;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_55 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_56) == 32'h00001010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_57 = {(_zz__zz_decode_SRC_LESS_UNSIGNED_58 == _zz__zz_decode_SRC_LESS_UNSIGNED_59),{_zz_decode_SRC_LESS_UNSIGNED_5,{_zz__zz_decode_SRC_LESS_UNSIGNED_60,_zz__zz_decode_SRC_LESS_UNSIGNED_62}}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_65 = _zz_decode_SRC_LESS_UNSIGNED_4;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_66 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_67) == 32'h00000020);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_69 = {_zz_decode_SRC_LESS_UNSIGNED_4,(_zz__zz_decode_SRC_LESS_UNSIGNED_70 == _zz__zz_decode_SRC_LESS_UNSIGNED_71)};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_72 = (|{_zz__zz_decode_SRC_LESS_UNSIGNED_73,{_zz__zz_decode_SRC_LESS_UNSIGNED_74,_zz__zz_decode_SRC_LESS_UNSIGNED_75}});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_78 = (|_zz__zz_decode_SRC_LESS_UNSIGNED_79);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_80 = {(|_zz__zz_decode_SRC_LESS_UNSIGNED_81),{_zz__zz_decode_SRC_LESS_UNSIGNED_86,_zz__zz_decode_SRC_LESS_UNSIGNED_88}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_56 = 32'h00001010;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_58 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_59 = 32'h00002010;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_60 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_61) == 32'h00000004);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_62 = ((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED_63) == 32'h0);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_67 = 32'h00000070;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_70 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_71 = 32'h0;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_73 = ((decode_INSTRUCTION & 32'h00000044) == 32'h0);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_74 = _zz_decode_SRC_LESS_UNSIGNED_3;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_75 = {_zz_decode_SRC_LESS_UNSIGNED_2,(_zz__zz_decode_SRC_LESS_UNSIGNED_76 == _zz__zz_decode_SRC_LESS_UNSIGNED_77)};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_79 = ((decode_INSTRUCTION & 32'h00000058) == 32'h0);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_81 = {(_zz__zz_decode_SRC_LESS_UNSIGNED_82 == _zz__zz_decode_SRC_LESS_UNSIGNED_83),{_zz__zz_decode_SRC_LESS_UNSIGNED_84,_zz__zz_decode_SRC_LESS_UNSIGNED_85}};
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_86 = (|{_zz__zz_decode_SRC_LESS_UNSIGNED_87,_zz_decode_SRC_LESS_UNSIGNED_1});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_88 = (|{_zz__zz_decode_SRC_LESS_UNSIGNED_89,_zz_decode_SRC_LESS_UNSIGNED_1});
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_61 = 32'h0000000c;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_63 = 32'h00000028;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_76 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_77 = 32'h00001000;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_82 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_83 = 32'h00000040;
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_84 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_85 = ((decode_INSTRUCTION & 32'h40004034) == 32'h40000030);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_87 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz__zz_decode_SRC_LESS_UNSIGNED_89 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  always @(posedge io_systemClk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      RegFilePlugin_regFile_spinal_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge io_systemClk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      RegFilePlugin_regFile_spinal_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge io_systemClk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid              (iBus_rsp_toStream_valid                                       ), //i
    .io_push_ready              (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready            ), //o
    .io_push_payload_error      (iBus_rsp_toStream_payload_error                               ), //i
    .io_push_payload_inst       (iBus_rsp_toStream_payload_inst[31:0]                          ), //i
    .io_pop_valid               (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid             ), //o
    .io_pop_ready               (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready             ), //i
    .io_pop_payload_error       (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error     ), //o
    .io_pop_payload_inst        (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]), //o
    .io_flush                   (1'b0                                                          ), //i
    .io_occupancy               (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy[1:0]        ), //o
    .io_availability            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_availability[1:0]     ), //o
    .io_systemClk               (io_systemClk                                                  ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset                                    )  //i
  );
  EfxCPUSp1 EfxCPUSp1_inst (
    .src1    (execute_SRC1[31:0]           ), //i
    .src2    (execute_SRC2[31:0]           ), //i
    .bitCtrl (execute_ALU_BITWISE_CTRL[1:0]), //i
    .ctrl    (execute_ALU_CTRL[1:0]        ), //i
    .less    (execute_SRC_LESS             ), //i
    .addSub  (execute_SRC_ADD_SUB[31:0]    ), //i
    .result  (EfxCPUSp1_inst_result[31:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_1_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_1_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_2_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_2_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_2_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  `endif

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = EfxCPUSp1_inst_result;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_execute_BRANCH_DO_1;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2 = _zz_decode_SRC2_4;
  assign decode_SRC1 = _zz_decode_SRC1;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_SRC_LESS_UNSIGNED[24];
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_SRC_LESS_UNSIGNED[18];
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_MEMORY_STORE = _zz_decode_SRC_LESS_UNSIGNED[10];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_SRC_LESS_UNSIGNED[9];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_SRC_LESS_UNSIGNED[8];
  assign decode_MEMORY_ENABLE = _zz_decode_SRC_LESS_UNSIGNED[3];
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_SRC_LESS_UNSIGNED[21];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign decode_RS2_USE = _zz_decode_SRC_LESS_UNSIGNED[12];
  assign decode_RS1_USE = _zz_decode_SRC_LESS_UNSIGNED[4];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign _zz_decode_RS2 = memory_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(when_ShiftPlugins_l169) begin
      _zz_decode_RS2_1 = _zz_decode_RS2_3;
    end
    if(when_CsrPlugin_l1731) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign _zz_decode_to_execute_PC = decode_PC;
  assign _zz_decode_to_execute_RS2 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_RS1 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_SRC_LESS_UNSIGNED[2];
  assign decode_SRC_ADD_ZERO = _zz_decode_SRC_LESS_UNSIGNED[15];
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_SRC_LESS_UNSIGNED[7];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}});
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l566) begin
      _zz_decode_RS2_2 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    case(IBusSimplePlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1671) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(decodeExceptionPort_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l436) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_ShiftPlugins_l169) begin
      if(when_ShiftPlugins_l184) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(when_CsrPlugin_l1735) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DebugPlugin_l310) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l310) begin
      if(when_DebugPlugin_l313) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(when_DebugPlugin_l310) begin
      if(when_DebugPlugin_l313) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l490) begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1534) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1600) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1416) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1534) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1600) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l310) begin
      if(when_DebugPlugin_l313) begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l326) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  assign IBusSimplePlugin_forceNoDecodeCond = 1'b0;
  always @(*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1846) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
    if(when_CsrPlugin_l1853) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1534) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1600) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1534) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1600) begin
      case(switch_CsrPlugin_l1604)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l346) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign CsrPlugin_xretAwayFromMachine = 1'b0;
  always @(*) begin
    BranchPlugin_inDebugNoFetchFlag = 1'b0;
    if(DebugPlugin_godmode) begin
      BranchPlugin_inDebugNoFetchFlag = 1'b1;
    end
  end

  assign IBusSimplePlugin_externalFlush = (|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}});
  assign IBusSimplePlugin_jump_pcLoad_valid = (|{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid});
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_IBusSimplePlugin_jump_pcLoad_payload_1[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @(*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_fire = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready) begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l133 = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_IBusSimplePlugin_fetchPc_pc);
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate));
  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if(when_IBusSimplePlugin_l305) begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if(when_Fetcher_l322) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_iBusRsp_stages_2_input_valid);
  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_IBusSimplePlugin_injector_decodeInput_valid;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l322 = (! IBusSimplePlugin_pcValids_0);
  assign when_Fetcher_l331 = (! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l331_1 = (! (! IBusSimplePlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l331_2 = (! (! IBusSimplePlugin_injector_decodeInput_ready));
  assign when_Fetcher_l331_3 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_4 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_5 = (! writeBack_arbitration_isStuck);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_5;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(IBusSimplePlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
    if(IBusSimplePlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_IBusSimplePlugin_pending_next - _zz_IBusSimplePlugin_pending_next_3);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign when_IBusSimplePlugin_l305 = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_cmd_fire = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_pending_inc = IBusSimplePlugin_cmd_fire;
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign iBus_rsp_toStream_valid = iBus_rsp_valid;
  assign iBus_rsp_toStream_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_toStream_payload_inst = iBus_rsp_payload_inst;
  assign iBus_rsp_toStream_ready = IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready);
  assign IBusSimplePlugin_pending_dec = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @(*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if(when_IBusSimplePlugin_l376) begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign when_IBusSimplePlugin_l376 = (! IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_rspJoin_join_fire = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? IBusSimplePlugin_rspJoin_join_fire : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = IBusSimplePlugin_rspJoin_join_fire;
  assign _zz_IBusSimplePlugin_iBusRsp_output_valid = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l436 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l490 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l241 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusSimplePlugin_rspFormated = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[31] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[30] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[29] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[28] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[27] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[26] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[25] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[24] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[23] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[22] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[21] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[20] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[19] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[18] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[17] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[16] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[15] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[14] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[13] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[12] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[11] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[10] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[9] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[8] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_writeBack_DBusSimplePlugin_rspFormated_2 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[31] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[30] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[29] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[28] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[27] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[26] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[25] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[24] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[23] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[22] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[21] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[20] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[19] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[18] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[17] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[16] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l241)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l566 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_decode_SRC_LESS_UNSIGNED_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_SRC_LESS_UNSIGNED_2 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_decode_SRC_LESS_UNSIGNED_3 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_SRC_LESS_UNSIGNED_4 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_SRC_LESS_UNSIGNED_5 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz_decode_SRC_LESS_UNSIGNED_6 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_SRC_LESS_UNSIGNED_7 = ((decode_INSTRUCTION & 32'h10103050) == 32'h00100050);
  assign _zz_decode_SRC_LESS_UNSIGNED = {(|((decode_INSTRUCTION & 32'h00001000) == 32'h00001000)),{(|((decode_INSTRUCTION & _zz__zz_decode_SRC_LESS_UNSIGNED) == 32'h00002000)),{(|{_zz__zz_decode_SRC_LESS_UNSIGNED_1,_zz__zz_decode_SRC_LESS_UNSIGNED_2}),{(|{_zz__zz_decode_SRC_LESS_UNSIGNED_3,_zz__zz_decode_SRC_LESS_UNSIGNED_4}),{(|_zz__zz_decode_SRC_LESS_UNSIGNED_5),{_zz__zz_decode_SRC_LESS_UNSIGNED_6,{_zz__zz_decode_SRC_LESS_UNSIGNED_7,_zz__zz_decode_SRC_LESS_UNSIGNED_10}}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[1 : 0];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[6 : 5];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[14 : 13];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[17 : 16];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[20 : 19];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[23 : 22];
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_SRC_LESS_UNSIGNED[26 : 25];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = RegFilePlugin_regFile_spinal_port0;
  assign decode_RegFilePlugin_rs2Data = RegFilePlugin_regFile_spinal_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_5) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_5) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_5) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_decode_SRC1 = _zz_decode_to_execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_decode_SRC1 = {29'd0, _zz__zz_decode_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_decode_SRC1 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_decode_SRC1 = {27'd0, _zz__zz_decode_SRC1_1};
      end
    endcase
  end

  assign _zz_decode_SRC2 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_SRC2_1[19] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[18] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[17] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[16] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[15] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[14] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[13] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[12] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[11] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[10] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[9] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[8] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[7] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[6] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[5] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[4] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[3] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[2] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[1] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[0] = _zz_decode_SRC2;
  end

  assign _zz_decode_SRC2_2 = _zz__zz_decode_SRC2_2[11];
  always @(*) begin
    _zz_decode_SRC2_3[19] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[18] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[17] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[16] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[15] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[14] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[13] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[12] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[11] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[10] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[9] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[8] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[7] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[6] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[5] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[4] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[3] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[2] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[1] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[0] = _zz_decode_SRC2_2;
  end

  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_decode_SRC2_4 = _zz_decode_to_execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_decode_SRC2_4 = {_zz_decode_SRC2_1,decode_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_decode_SRC2_4 = {_zz_decode_SRC2_3,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_decode_SRC2_4 = _zz_decode_to_execute_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != ShiftCtrlEnum_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == 4'b0000);
  assign when_ShiftPlugins_l169 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_SLL_1 : begin
        _zz_decode_RS2_3 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_decode_RS2_3 = _zz__zz_decode_RS2_3;
      end
    endcase
  end

  assign when_ShiftPlugins_l175 = (! execute_arbitration_isStuckByOthers);
  assign when_ShiftPlugins_l184 = (! execute_LightShifterPlugin_done);
  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0001101;
  assign _zz_when_CsrPlugin_l1446 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1446_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1446_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l1403 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1403_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1403_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1403_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1416 = (|{CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}});
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l1440 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1446 = ((_zz_when_CsrPlugin_l1446 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1446_1 = ((_zz_when_CsrPlugin_l1446_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1446_2 = ((_zz_when_CsrPlugin_l1446_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1479 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1479_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1479_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1484 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l1490) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l1490 = (|{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}});
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1534 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1542 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1600 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1604 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1671 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_3857) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3858) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3859) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3860) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CSR_WRITE_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1863) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1869) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1691) begin
      if(when_CsrPlugin_l1692) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(when_CsrPlugin_l1684) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1699) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(when_CsrPlugin_l1684) begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(when_CsrPlugin_l1699) begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_selfException_payload_code = 4'b0011;
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign when_CsrPlugin_l1684 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign when_CsrPlugin_l1691 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1692 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  assign when_CsrPlugin_l1699 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_ECALL));
  assign when_CsrPlugin_l1709 = ((execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_EBREAK)) && CsrPlugin_allowEbreakException);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1863) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1863) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l241_1 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l241_1)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1731 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1735 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l241_2 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l241_2)
      3'b000 : begin
        _zz_execute_BRANCH_DO = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_DO = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_DO = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_DO_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_DO_1 = _zz_execute_BRANCH_DO;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JALR) ? execute_RS1 : execute_PC);
  assign _zz_execute_BranchPlugin_branch_src2 = _zz__zz_execute_BranchPlugin_branch_src2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[19] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[18] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[17] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[16] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[15] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[14] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[13] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[12] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[11] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_1,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {_zz_execute_BranchPlugin_branch_src2_3,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_execute_BranchPlugin_branch_src2_6;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && BranchPlugin_jumpInterface_payload[1]);
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = BranchPlugin_jumpInterface_payload;
  assign stopTime = DebugPlugin_haltIt;
  assign when_DebugPlugin_l240 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l282)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = DebugPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l259) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l259 = (! _zz_when_DebugPlugin_l259);
  always @(*) begin
    DebugPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l282)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign DebugPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l282 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l286 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l286_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l287 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l287_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l288 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l289 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l290 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l290_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l310 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l313 = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) == 1'b0);
  assign when_DebugPlugin_l326 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l346 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_11 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_13 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_15 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! memory_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_22 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_23 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_25 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_26 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_32 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_39 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_40 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_41 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_42 = ((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers));
  assign when_Pipeline_l124_43 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}}));
  assign execute_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,memory_arbitration_flushNext}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}}));
  assign memory_arbitration_isFlushed = ((|writeBack_arbitration_flushNext) || (|{writeBack_arbitration_flushIt,memory_arbitration_flushIt}));
  assign writeBack_arbitration_isFlushed = (1'b0 || (|writeBack_arbitration_flushIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    DebugPlugin_injectionPort_ready = 1'b0;
    case(IBusSimplePlugin_injector_port_state)
      3'b100 : begin
        DebugPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l391 = (! decode_arbitration_isStuck);
  assign when_Fetcher_l411 = (IBusSimplePlugin_injector_port_state != 3'b000);
  assign when_CsrPlugin_l1813 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_9 = (! execute_arbitration_isStuck);
  assign switch_CsrPlugin_l1167 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_4[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = ((((32'h0 | 32'h0) | (32'h0 | 32'h0)) | ((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3))) | _zz_CsrPlugin_csrMapping_readDataInit_4);
  assign when_CsrPlugin_l1846 = ((execute_arbitration_isValid && execute_IS_CSR) && (({execute_CsrPlugin_csrAddress[11 : 2],2'b00} == 12'h3a0) || ({execute_CsrPlugin_csrAddress[11 : 4],4'b0000} == 12'h3b0)));
  assign _zz_when_CsrPlugin_l1853 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1853 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1853 == 12'hb00) || (((_zz_when_CsrPlugin_l1853 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1863 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1861) begin
      when_CsrPlugin_l1863 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1861 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1869 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'hf9000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1 <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      _zz_5 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_counters_mcycle <= 64'h0;
      CsrPlugin_counters_minstret <= 64'h0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      IBusSimplePlugin_injector_port_state <= 3'b000;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1 <= 1'b0;
      end
      if(_zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusSimplePlugin_iBusRsp_stages_1_output_valid && (! IBusSimplePlugin_iBusRsp_flush));
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l331_4) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if(when_Fetcher_l331_5) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_5 <= IBusSimplePlugin_injector_nextPcCalc_valids_4;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter);
      if(IBusSimplePlugin_iBusRsp_flush) begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_2);
      end
      _zz_5 <= 1'b0;
      if(when_ShiftPlugins_l169) begin
        if(when_ShiftPlugins_l175) begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done) begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt) begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      CsrPlugin_counters_mcycle <= (CsrPlugin_counters_mcycle + 64'h0000000000000001);
      if(writeBack_arbitration_isFiring) begin
        CsrPlugin_counters_minstret <= (CsrPlugin_counters_minstret + 64'h0000000000000001);
      end
      if(when_CsrPlugin_l1403) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l1403_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l1403_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l1403_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1440) begin
        if(when_CsrPlugin_l1446) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1479) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1479_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1479_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1484) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1534) begin
        if(when_CsrPlugin_l1542) begin
          case(CsrPlugin_targetPrivilege)
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1600) begin
        case(switch_CsrPlugin_l1604)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ((|{_zz_when_CsrPlugin_l1446_2,{_zz_when_CsrPlugin_l1446_1,_zz_when_CsrPlugin_l1446}}) || CsrPlugin_thirdPartyWake);
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(IBusSimplePlugin_injector_port_state)
        3'b000 : begin
          if(DebugPlugin_injectionPort_valid) begin
            IBusSimplePlugin_injector_port_state <= 3'b001;
          end
        end
        3'b001 : begin
          IBusSimplePlugin_injector_port_state <= 3'b010;
        end
        3'b010 : begin
          IBusSimplePlugin_injector_port_state <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l391) begin
            IBusSimplePlugin_injector_port_state <= 3'b100;
          end
        end
        3'b100 : begin
          IBusSimplePlugin_injector_port_state <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1167)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            default : begin
            end
          endcase
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusSimplePlugin_iBusRsp_output_ready) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_pc <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready) begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    if(when_ShiftPlugins_l169) begin
      if(when_ShiftPlugins_l175) begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    if(decodeExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(when_CsrPlugin_l1440) begin
      if(when_CsrPlugin_l1446) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1534) begin
      if(when_CsrPlugin_l1542) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          default : begin
          end
        endcase
      end
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= _zz_decode_to_execute_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= execute_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_11) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_12) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_14) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_15) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_17) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_18) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_20) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_22) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_23) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_25) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_26) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_RS1 <= _zz_decode_to_execute_RS1;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_RS2 <= _zz_decode_to_execute_RS2;
    end
    if(when_Pipeline_l124_32) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_33) begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(when_Pipeline_l124_35) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_38) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_39) begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_40) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_41) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_42) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_43) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_44) begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if(when_Fetcher_l411) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= DebugPlugin_injectionPort_payload;
    end
    if(when_CsrPlugin_l1813) begin
      execute_CsrPlugin_csr_3857 <= (decode_INSTRUCTION[31 : 20] == 12'hf11);
    end
    if(when_CsrPlugin_l1813_1) begin
      execute_CsrPlugin_csr_3858 <= (decode_INSTRUCTION[31 : 20] == 12'hf12);
    end
    if(when_CsrPlugin_l1813_2) begin
      execute_CsrPlugin_csr_3859 <= (decode_INSTRUCTION[31 : 20] == 12'hf13);
    end
    if(when_CsrPlugin_l1813_3) begin
      execute_CsrPlugin_csr_3860 <= (decode_INSTRUCTION[31 : 20] == 12'hf14);
    end
    if(when_CsrPlugin_l1813_4) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1813_5) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1813_6) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1813_7) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1813_8) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1813_9) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  always @(posedge io_systemClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= ((|{writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}}) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l259 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l310) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
    end else begin
      if(when_DebugPlugin_l240) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l282)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l286) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l286_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l287) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l287_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l288) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l289) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l290) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l290_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l310) begin
        if(when_DebugPlugin_l313) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l326) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module BufferCC_3 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_systemClk,
  input  wire          debugCd_logic_outputReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_systemClk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_2 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_systemClk,
  input  wire          io_asyncReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_systemClk or posedge io_asyncReset) begin
    if(io_asyncReset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//StreamFifo_2 replaced by StreamFifo_1

module StreamFifo_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [6:0]    io_occupancy,
  output wire [6:0]    io_availability,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  reg        [7:0]    logic_ram_spinal_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [6:0]    logic_ptr_push;
  reg        [6:0]    logic_ptr_pop;
  wire       [6:0]    logic_ptr_occupancy;
  wire       [6:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [5:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [5:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [5:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [5:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l375;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [5:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [6:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:63];

  always @(posedge io_systemClk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge io_systemClk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 7'h40) == 7'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[5:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[5:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l375) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l375 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = logic_ram_spinal_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (7'h40 - logic_ptr_occupancy);
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_ptr_push <= 7'h0;
      logic_ptr_pop <= 7'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 7'h0;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 7'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 7'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 7'h0;
        logic_ptr_pop <= 7'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 7'h0;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module UartCtrl (
  input  wire [2:0]    io_config_frame_dataLength,
  input  wire [0:0]    io_config_frame_stop,
  input  wire [1:0]    io_config_frame_parity,
  input  wire [19:0]   io_config_clockDivider,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_readError,
  input  wire          io_writeBreak,
  output wire          io_readBreak,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength  (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop        (io_config_frame_stop           ), //i
    .io_configFrame_parity      (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick            (clockDivider_tickReg           ), //i
    .io_write_valid             (io_write_thrown_valid          ), //i
    .io_write_ready             (tx_io_write_ready              ), //o
    .io_write_payload           (io_write_thrown_payload[7:0]   ), //i
    .io_cts                     (1'b0                           ), //i
    .io_txd                     (tx_io_txd                      ), //o
    .io_break                   (io_writeBreak                  ), //i
    .io_systemClk               (io_systemClk                   ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset     )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength  (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop        (io_config_frame_stop           ), //i
    .io_configFrame_parity      (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick            (clockDivider_tickReg           ), //i
    .io_read_valid              (rx_io_read_valid               ), //o
    .io_read_ready              (io_read_ready                  ), //i
    .io_read_payload            (rx_io_read_payload[7:0]        ), //o
    .io_rxd                     (io_uart_rxd                    ), //i
    .io_rts                     (rx_io_rts                      ), //o
    .io_error                   (rx_io_error                    ), //o
    .io_break                   (rx_io_break                    ), //o
    .io_systemClk               (io_systemClk                   ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      UartStopType_ONE : io_config_frame_stop_string = "ONE";
      UartStopType_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      UartParityType_NONE : io_config_frame_parity_string = "NONE";
      UartParityType_EVEN : io_config_frame_parity_string = "EVEN";
      UartParityType_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      clockDivider_counter <= 20'h0;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire          io_inputs_0_payload_last,
  input  wire [0:0]    io_inputs_0_payload_fragment_source,
  input  wire [0:0]    io_inputs_0_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_0_payload_fragment_address,
  input  wire [1:0]    io_inputs_0_payload_fragment_length,
  input  wire [31:0]   io_inputs_0_payload_fragment_data,
  input  wire [3:0]    io_inputs_0_payload_fragment_mask,
  input  wire [0:0]    io_inputs_0_payload_fragment_context,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire          io_inputs_1_payload_last,
  input  wire [0:0]    io_inputs_1_payload_fragment_source,
  input  wire [0:0]    io_inputs_1_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_1_payload_fragment_address,
  input  wire [1:0]    io_inputs_1_payload_fragment_length,
  input  wire [31:0]   io_inputs_1_payload_fragment_data,
  input  wire [3:0]    io_inputs_1_payload_fragment_mask,
  input  wire [0:0]    io_inputs_1_payload_fragment_context,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment_source,
  output wire [0:0]    io_output_payload_fragment_opcode,
  output wire [31:0]   io_output_payload_fragment_address,
  output wire [1:0]    io_output_payload_fragment_length,
  output wire [31:0]   io_output_payload_fragment_data,
  output wire [3:0]    io_output_payload_fragment_mask,
  output wire [0:0]    io_output_payload_fragment_context,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire       [1:0]    _zz_maskProposal_1_1;
  wire       [1:0]    _zz_maskProposal_1_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_1;
  wire                io_output_fire;
  wire                when_Stream_l683;
  wire                _zz_io_chosen;

  assign _zz_maskProposal_1_1 = (_zz_maskProposal_1 & (~ _zz_maskProposal_1_2));
  assign _zz_maskProposal_1_2 = (_zz_maskProposal_1 - 2'b01);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_maskProposal_1_1[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign when_Stream_l683 = (io_output_fire && io_output_payload_last);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_last = (maskRouted_0 ? io_inputs_0_payload_last : io_inputs_1_payload_last);
  assign io_output_payload_fragment_source = (maskRouted_0 ? io_inputs_0_payload_fragment_source : io_inputs_1_payload_fragment_source);
  assign io_output_payload_fragment_opcode = (maskRouted_0 ? io_inputs_0_payload_fragment_opcode : io_inputs_1_payload_fragment_opcode);
  assign io_output_payload_fragment_address = (maskRouted_0 ? io_inputs_0_payload_fragment_address : io_inputs_1_payload_fragment_address);
  assign io_output_payload_fragment_length = (maskRouted_0 ? io_inputs_0_payload_fragment_length : io_inputs_1_payload_fragment_length);
  assign io_output_payload_fragment_data = (maskRouted_0 ? io_inputs_0_payload_fragment_data : io_inputs_1_payload_fragment_data);
  assign io_output_payload_fragment_mask = (maskRouted_0 ? io_inputs_0_payload_fragment_mask : io_inputs_1_payload_fragment_mask);
  assign io_output_payload_fragment_context = (maskRouted_0 ? io_inputs_0_payload_fragment_context : io_inputs_1_payload_fragment_context);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(when_Stream_l683) begin
        locked <= 1'b0;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(io_output_valid) begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end


endmodule

module FlowCCUnsafeByToggle (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [0:0]    io_input_payload_fragment,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment,
  input  wire          io_jtag_tck,
  input  wire          io_systemClk,
  input  wire          debugCd_logic_outputReset
);

  wire                inputArea_target_buffercc_io_dataOut;
  reg                 inputArea_target;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_m2sPipe_valid;
  (* async_reg = "true" *) reg                 outputArea_flow_m2sPipe_payload_last;
  (* async_reg = "true" *) reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  (* keep_hierarchy = "TRUE" *) BufferCC inputArea_target_buffercc (
    .io_dataIn                 (inputArea_target                    ), //i
    .io_dataOut                (inputArea_target_buffercc_io_dataOut), //o
    .io_systemClk              (io_systemClk                        ), //i
    .debugCd_logic_outputReset (debugCd_logic_outputReset           )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    inputArea_target = $urandom;
    outputArea_hit = $urandom;
  `endif
  end

  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge io_systemClk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoLowLatency (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_error,
  input  wire [31:0]   io_push_payload_inst,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_error,
  output wire [31:0]   io_pop_payload_inst,
  input  wire          io_flush,
  output wire [1:0]    io_occupancy,
  output wire [1:0]    io_availability,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire                fifo_io_pop_payload_error;
  wire       [31:0]   fifo_io_pop_payload_inst;
  wire       [1:0]    fifo_io_occupancy;
  wire       [1:0]    fifo_io_availability;

  StreamFifo fifo (
    .io_push_valid              (io_push_valid                 ), //i
    .io_push_ready              (fifo_io_push_ready            ), //o
    .io_push_payload_error      (io_push_payload_error         ), //i
    .io_push_payload_inst       (io_push_payload_inst[31:0]    ), //i
    .io_pop_valid               (fifo_io_pop_valid             ), //o
    .io_pop_ready               (io_pop_ready                  ), //i
    .io_pop_payload_error       (fifo_io_pop_payload_error     ), //o
    .io_pop_payload_inst        (fifo_io_pop_payload_inst[31:0]), //o
    .io_flush                   (io_flush                      ), //i
    .io_occupancy               (fifo_io_occupancy[1:0]        ), //o
    .io_availability            (fifo_io_availability[1:0]     ), //o
    .io_systemClk               (io_systemClk                  ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset    )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload_error = fifo_io_pop_payload_error;
  assign io_pop_payload_inst = fifo_io_pop_payload_inst;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module UartCtrlRx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  input  wire          io_rxd,
  output wire          io_rts,
  output reg           io_error,
  output wire          io_break,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlRxState_IDLE = 3'd0;
  localparam UartCtrlRxState_START = 3'd1;
  localparam UartCtrlRxState_DATA = 3'd2;
  localparam UartCtrlRxState_PARITY = 3'd3;
  localparam UartCtrlRxState_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  (* keep_hierarchy = "TRUE" *) BufferCC_1 io_rxd_buffercc (
    .io_dataIn                  (io_rxd                    ), //i
    .io_dataOut                 (io_rxd_buffercc_io_dataOut), //o
    .io_systemClk               (io_systemClk              ), //i
    .systemCd_logic_outputReset (systemCd_logic_outputReset)  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlRxState_START : stateMachine_state_string = "START ";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlRxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= UartCtrlRxState_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        UartCtrlRxState_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= UartCtrlRxState_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= UartCtrlRxState_PARITY;
              end
            end
          end
        end
        UartCtrlRxState_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= UartCtrlRxState_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= UartCtrlRxState_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge io_systemClk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
        end
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  input  wire          io_cts,
  output wire          io_txd,
  input  wire          io_break,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlTxState_IDLE = 3'd0;
  localparam UartCtrlTxState_START = 3'd1;
  localparam UartCtrlTxState_DATA = 3'd2;
  localparam UartCtrlTxState_PARITY = 3'd3;
  localparam UartCtrlTxState_STOP = 3'd4;

  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  wire       [2:0]    _zz_stateMachine_state;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  reg [47:0] _zz_stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlTxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_stateMachine_state)
      UartCtrlTxState_IDLE : _zz_stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : _zz_stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : _zz_stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : _zz_stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : _zz_stateMachine_state_string = "STOP  ";
      default : _zz_stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        stateMachine_txd = 1'b0;
      end
      UartCtrlTxState_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      UartCtrlTxState_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign _zz_stateMachine_state = (io_write_valid ? UartCtrlTxState_START : UartCtrlTxState_IDLE);
  assign io_txd = _zz_io_txd;
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= UartCtrlTxState_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        UartCtrlTxState_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= UartCtrlTxState_START;
          end
        end
        UartCtrlTxState_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_DATA;
          end
        end
        UartCtrlTxState_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= UartCtrlTxState_STOP;
              end else begin
                stateMachine_state <= UartCtrlTxState_PARITY;
              end
            end
          end
        end
        UartCtrlTxState_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= _zz_stateMachine_state;
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge io_systemClk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_systemClk,
  input  wire          debugCd_logic_outputReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  initial begin
  `ifndef SYNTHESIS
    buffers_0 = $urandom;
    buffers_1 = $urandom;
  `endif
  end

  assign io_dataOut = buffers_1;
  always @(posedge io_systemClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_error,
  input  wire [31:0]   io_push_payload_inst,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  output reg           io_pop_payload_error,
  output reg  [31:0]   io_pop_payload_inst,
  input  wire          io_flush,
  output wire [1:0]    io_occupancy,
  output wire [1:0]    io_availability,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  wire       [0:0]    _zz__zz_1;
  reg                 _zz_logic_pop_async_readed_error;
  reg        [31:0]   _zz_logic_pop_async_readed_inst;
  reg                 logic_vec_0_error;
  reg        [31:0]   logic_vec_0_inst;
  reg                 logic_vec_1_error;
  reg        [31:0]   logic_vec_1_inst;
  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [1:0]    logic_ptr_push;
  reg        [1:0]    logic_ptr_pop;
  wire       [1:0]    logic_ptr_occupancy;
  wire       [1:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire       [1:0]    _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [0:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_async_readed_error;
  wire       [31:0]   logic_pop_async_readed_inst;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire                logic_pop_addressGen_translated_payload_error;
  wire       [31:0]   logic_pop_addressGen_translated_payload_inst;

  assign _zz__zz_1 = logic_ptr_push[0:0];
  always @(*) begin
    case(logic_pop_addressGen_payload)
      1'b0 : begin
        _zz_logic_pop_async_readed_error = logic_vec_0_error;
        _zz_logic_pop_async_readed_inst = logic_vec_0_inst;
      end
      default : begin
        _zz_logic_pop_async_readed_error = logic_vec_1_error;
        _zz_logic_pop_async_readed_inst = logic_vec_1_inst;
      end
    endcase
  end

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 2'b10) == 2'b00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign _zz_1 = ({1'd0,1'b1} <<< _zz__zz_1);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[0:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_async_readed_error = _zz_logic_pop_async_readed_error;
  assign logic_pop_async_readed_inst = _zz_logic_pop_async_readed_inst;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload_error = logic_pop_async_readed_error;
  assign logic_pop_addressGen_translated_payload_inst = logic_pop_async_readed_inst;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  always @(*) begin
    io_pop_payload_error = logic_pop_addressGen_translated_payload_error;
    if(logic_ptr_empty) begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @(*) begin
    io_pop_payload_inst = logic_pop_addressGen_translated_payload_inst;
    if(logic_ptr_empty) begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (2'b10 - logic_ptr_occupancy);
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_ptr_push <= 2'b00;
      logic_ptr_pop <= 2'b00;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 2'b01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 2'b01);
      end
      if(io_flush) begin
        logic_ptr_push <= 2'b00;
        logic_ptr_pop <= 2'b00;
      end
    end
  end

  always @(posedge io_systemClk) begin
    if(io_push_fire) begin
      if(_zz_2) begin
        logic_vec_0_error <= io_push_payload_error;
      end
      if(_zz_3) begin
        logic_vec_1_error <= io_push_payload_error;
      end
      if(_zz_2) begin
        logic_vec_0_inst <= io_push_payload_inst;
      end
      if(_zz_3) begin
        logic_vec_1_inst <= io_push_payload_inst;
      end
    end
  end


endmodule

module BufferCC_1 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_systemClk,
  input  wire          systemCd_logic_outputReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxCPUSp1 (
  input      [31:0]   src1,
  input      [31:0]   src2,
  input      [1:0]    bitCtrl,
  input      [1:0]    ctrl,
  input               less,
  input      [31:0]   addSub,
  output     [31:0]   result
);
//pragma protect
//pragma protect begin

/* Encryption Envelope */

`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "QuestaSim" , encrypt_agent_info = "2021.1"
`pragma protect key_keyowner = "Efinix Inc." , key_keyname = "EFX_K01"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 256 )
`pragma protect key_block
Ecw9jhURr5b+Vd7LgZMR1v9ijVGnhp9TflfZD889ZWS6Cv3oyLzOyVPXGVVqaMou
B2CEp6ax93EUikKmu7nN3qOrbuT7Z+oRxPJ6sM4eV/s2xWYQzM6kxSTm7U1ntdnc
YPJcAC46TlBp9gMopmbLF0O3aXrlUVNybbA604yHiNJuvQeBvbqXAL9NLKM/rwPV
V21NGQpYqsKR/tk7xGY61CRNT5O9nXGE3E1L249zPjdBKNRZMwMgUETxhk/ZAGyM
Xneve/TADy9UBOBrqNIk6VDuJL/btphia/3jgTaxXDjn0kkFbhfmJAVG2ykZT5aB
25gesTHXmpALLZj4EX0w7g==
`pragma protect data_method = "aes256-cbc"
`pragma protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 1744 )
`pragma protect data_block
rFzsBaxombQqUBt5qKtjRfLXePceboc4W5BB8bWOuFshVLPNU74AhYGWdzKo/ecK
pPw9eDdmd2KUCajxnuqAqTWFw+GwvqqbyIT8TKE9t7RkATQmgGm7HeHWsGsculc/
jgIP+jFnudZdNSn35aT0PL004vUoKkVPQnFMM+EhNCXcAwth8wowsCDhaQx8Q4nz
mPvBDu0it6nfFcuxMc5p+6T3vZgg2el5nkBAJytJ0moz6+sPOKmcbtfPEKnwt3jz
24mZJvIXJ1g+8IYEjDZk6ZxTlKi7Y6RrEpud3dzi9R8U/sKx5xDaegtGk+MMkYBx
ByFYe5W/DnFTocqdEpgmfERUUaicEQgxBWwK7Ii2K2G+dOhf/89ySlQj/1Tq/UWx
q1DLRemdE3yPHgXahsjK1GMwPcVWA4l/zparoRDUuiXFvs+psZCxOWoDvxYYIPRA
hC/paakd0fOnFjt/1iWPKfTKiUUMX22PZdqODdnMuKmwd+8HiEuOU0DZRSFDMjxS
oEkXhls27bKxdzpkG0PhiiiyynIgPyswaW9tUATYjTLxurO9nf0/LshuJyBmEjAK
xhvMnHfOshbDHeakjM9pebzRCbZEZh8/SCdYp5N/Jdr8Xxo9h8dCcpYphMB9VNbq
8sFSM30s6CzhjRLAYCDd3SstcMsr3unqZohVi0nv5bJXKoF2wLgS0KV68sMpHadR
NbCIHJs7GgXyR01TliQSthuupbv3nLb4ACxfJHp94BNxPxOcY6EVFhSOmSrQuDga
4KjsB5pQ+F/MOpRYq7fT7CS/jYolb5PRPhtj5LsZLLW2PW+7IAM+KKUfmZwhSEvH
+tgivQ4oxdwVYUIZqFH7yOVA4YXz2MQxw/I4hlnOJeVn4z38rhptPbojx3vKLze8
g2vfUikvvFU9kVn3nTTa4Gjc8n/RPdpexlNziNq96Mp2MeiEWf5ukBM4gZ18BO9+
rEfWcBDS6HhdK29NHCy99AQKQ7RuqbhI24jimd0Vhl8m/RBacK1zJHRf7OlXJK/G
eeMvGnj6hrT9/SyNtUGBjP3ekRNE38q9/Mcm6ihRd4qm63de885B/K/3GSAN42CX
Wt0UI176E/1jfBrNV/pVeOwlnnaUI/eYIRbtH671Rm40oTkcJILRYMm17EWrtq+U
UvcNSlz9O4TfF8+irWaMoUXUUfb0Wktw7yvvYuradlHCBfUywwZh8+/2wE0N1Y/G
Fi7TJqIyy+yd/5ovnev81OPp0zRmqahIbHA+ss4A7H3u9wfIHD7+IDtMGCQkvW8P
Q5kFDHHt4ztSMgvIB+4mxYgPZPoZ1e4j5P6GaABNiDYPiCoO/zCqO4mL+eL4HFK0
LVEbcOMNqjpUZLs0xtp1ZGcbsnGZceNdSLHot2gmorSKoy0Oxqb3UwTjyFoxn1V7
V9p8QivDJUZSxQiKnKt8mKLOPxP0h9Hq7fgonwUQu6BG9ddCgux06Esbzdflf/Db
+mL/IhfhVfb6hNxrEPM9dqwKQOnUs1ZzyQfA3b79vNRrtH0Fl1QCPuIcxjE6LSSE
cVzOwFyt9fec2PQbfSqLdAJ1ObTlRoOhVowCSwc349+gE2djXOhhJgIsAqznbInD
IYt4r9gARLtJrWzLgY6maNN/vIkjcoci5CctZA25n57b9mIvq3EbyGk6buphkjA9
F/Ebu/SCnWiQQmZPOG9N4vtMItNYFCseeVntDP9kJY2nl4kaXUi69NX6ts0+CeCD
NRAT7UBek496UyyG/gcakB8hT44wAcobP3WSDngA8BctYKIPyfSCkcHyUvde4Bv/
m/PxGga3SJeJc4O2RUph/x95FUpJHE0N76fDPHWC3/1C/mY5lGhl1ToVKuYxP/2r
HhgNMmaZli3tthCA+hy5lLIMvJ6PJ+h5M6Drp69D+5h/qZwnikotmuoB6xHlk+dN
MVMRFUUXSfq1VaCwtCwk+fa5reLZQnYpWfxRBZCufwVEa/Sp31ev1Beeb+e87zUZ
girkMpAadhe4iQmbjAhsTBuyyDl2WQtbqav1OvhSwgqSewwYi2y66SXwQAcN3taS
aHz57i7y7N+68sjkoAfjqvxnnE5GC4taMvMtJpvQjAUtOpwPSz3leGSJu/u7YQbv
KZ/zqV15JYlo3uNOKdM/2wIgISLyJ8xVDM+/0IYHnNUkVYJRPQif//wWPJ4Zf7A8
Cgk+rIb5dMmlUNO7XnzBkQ+wACn/hE5x9ctM1Cgj25ag5MshxTbv2k+/3mXYF0nu
PgSYwolywiDPdc95trsxyDnVyqyOkJIiMBQS7Pmf///zW3s3W5J+481R4bhwlRtX
wj5Z+1pfyeE98GN28kBwNw==
`pragma protect end_protected

//pragma protect end

module EfxCPUSp2 (
  input      [1:0]    ctrl,
  input      [31:0]   src1,
  input      [31:0]   src2,
  output     [31:0]   result
);
//pragma protect
//pragma protect begin

/* Encryption Envelope */

`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "QuestaSim" , encrypt_agent_info = "2021.1"
`pragma protect key_keyowner = "Efinix Inc." , key_keyname = "EFX_K01"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 256 )
`pragma protect key_block
CPY2dRNy2lEt588Jxc7U3CW7a3xTLbxLPymbMASG8ZCBsC8IUC4j2MF7t76ZJwA4
gThR/rUP2kSSkCfqYJUTsZIgih80C+2r/PPQ5XBv9pfS4Agm+ty52s/Z+fUYWTW/
usCEYajK1/tlTl7YkkYKy3XVOAABYNZmar8DTnO+WyH3FrF2gvtSICnCU1z8SZ7M
pnw/jtFCfka778aC4Xbk38fZ2yKT8qGUn06T1tLKmKHkXkzkXwN8oISViW6sreuW
0nX4iuc2GHwx8WsuqtvKoybIp7aLsf/w/gUsbqa9yko60MjwDRWy0oy3L9lqTSMD
2o63R9G1+i5/z5N1StPjaw==
`pragma protect data_method = "aes256-cbc"
`pragma protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 2288 )
`pragma protect data_block
MphD3yZg+3pt6F+ieH4dJqi6evVncOsrP4f63w3/hGJdpdMBvytuj27F4dt6fJDc
QjQ0kjrgZ9o3KJKuOwdadfkXy2sSgBZF2ZpXQ/DItoM914HmBrdOcFE1xBI8rD0e
Aff1OfVNGzxX/K3guGH7sOKD7rF5DP7D+5i/cP2kCeT//tqyUVfEt3SW6NBElPkx
+jMunGNqiPpetVkIaGMZM7ocg4pUf8gYvUD08nrom/+Oqw6fqZODh5rCgjYf9KWb
Sl6pE2p+ZFvCqqBXTFAh7fLueI4XBToFLK+PgCeuF3Gh/1J/4s9JY9xy8lcoSf+a
jE12sfiqbiKGcJkhRVLNmfpxrEDUuof14uNPh3rGEDGjuIWB3O8cKWOLnY+0pPfS
ug7qNlVh/kICZSzTXvqM3akdXas8O1NCVkhacspI0Nl7aU7BOuIgtXWVVniTKekL
ZF4OvjgvZ5pRBJIjAowl0zp0nieVFpc8hUioWk1+71TG1S3HY7aDNJS4Z11yowft
y5mG3J4KMOvF5rWQVdTpwvauPGuqVBcAtJjz11FvSLXHzz2jfI5EPX3F3wGBuAHb
5z4iiqTPsZmKfR27X19Jkfskga1W0LPYsu9d2tbxV13IvkcNmBv6cfBcUla7Knl6
xhMGs4a9M0UbGvuI2hIWTiwfok5eRMupGDp1OMW065DOKDHbncbJ/KzrD+SXlPMh
WeFAXVDENRuOpgNCjN8eihGKia0Tl/R2kbToSBUMXyRQIx6Z8uKr9HZtwFv7RFCH
OMLdFPC3G0pCrOmAp+LA/7MsH5g0jDOb/zFBuGzSr5JMH8wf1d6N9M76+JZiDMft
kOXl7V5/zAJMA4/YK782yCNshIStQAuVcT5qXN6L+RsIQWG0iyP94JZ2t38NcIxu
MKvmrUVlO6hi4Cw+3pCV5F5bRj9SuRF+PfbmpeNNPT698WwqhErd/nxj5X0Umjwo
avES4SuCSmcMPXsftAKGWuR6DgpQ3esUAwXb9Xu6eTOlR1a0nKqSlJaBDXP2e8Kt
Q0m9TGv5mQOceKJZwAzZpsbdAYXV3JUr2tPMVa47a4paq01Yh6Z7pn9SkarVIeKH
YflNkqr2kSI4fJrMn4ukM/qN6PahzCSxJccUV+Elzg2tEKNIVyciKV/nEDjYV6XV
enRXSeLXhBJF8fl0VVRRlg1pgIRFkhu+QTvzKxTnmh7Lw+/94RBq8zFcgsql+alP
uYt9IPuHq4/3QhxFc+iGw/sOBH/fN71CEIsbI0tHBuvRyp90R7wcR8R8utpHypBU
Qx/U+UwbkuUfJapO6hUSuqZEswWcO4zBq9UlpPqsNJ7mnrEU7YKZk6NtxrdzvY3M
NP0ywWu7f9xrRc2ivPiZpCwyPl3S345D7Vf60t2ooJ9QMcrF4t/t8djMYIXgbI93
vS3GYjjbYxH5mguusN1T8HpyWhkMvrzvQZkWVWmNByNz+uJSfiF4f1qb3mQy+0cC
ICbAn8cSlwyMNsP4cja5F2KypfiTsajOc2FzLUe0aqd6a+8QagoPJdToBRsNsdg5
+/xXgJmTN5b+yc09B1kDWrIPOYnwyyHVcRO2uURMbifRMhi6fVGXxzYcfpcXE2vf
6maoUbqogUqU6wYJ53QGBpwy7cdDPzi1PXkrscrkAv9zjWUDY0qKbEtv1AdctWNK
mWIPueoqwVVpNWT95TxZ8qIdkhMFhoXevHcUFBTdl+3RG+Yt9jTlDAOsgA0bI6Gp
uClBIP21Wh763Vk7QD0hQZ6Q1mvILNrm/I4p7B3EP/LT2gQPARpZD3AQ1gAgO0GF
E8L+hnk1JVwoWdPMCHt++npJhOo7PJ38Fi88E+ZamfyLQr1aKgoujoK6RC3VQT2S
4aqIIL/uGOhagUpav/Bb6wxQ3ZOl8pzHUVX2NVOXz9mcUKT+NfUFp5A4fs67F1Ui
9Ppf4Teycr8ja+rmmAU9rDioW+zCTyyDAWD0EE7j7Ll6qy106No5tMtzNC2xm4WS
L0WKG2mf64SyznaUiSXxH0MLBY/ALY8dsnyJjbV2+ehtayieBzpcnc3rl4XH1x7A
1yA2N7Ggo29wM0S5CG9Dx71H0BXRgMdA2EZjnAD016E26O97WchuVN0ODUdQjZ6x
7VTx/O/f0Fwx1BIvdoUCz+xKdL+Ra7wr6Mj638UxAx2OcbJ2aWOB9smexg6HfSZw
vg3MMpgyFMA92zUsG8V03JxG1v+MVOH4ZWME45e1QUYbo624U4Ub9CtaCsj7z4RA
hFx/1+Q+aPPbikm6Exb46FimN/v75B5Gn8RJ271pBQbwp8YE9UbrtdZP6Kpw5Xnd
uYTI1amvlWr2MtcXJzqgsrkdzs8wal05ahLX3sstXhr9TYaEV8J4arNFalNJy4+W
sTMCsv4MZMNN7YDqYc0Y7e1a5NXYrNGO7sLbSmDquw6WsTUjhARgqjoPgXwiL+ef
NNCBvmB9Mmjulv3a8LQ15NeJydPsIEBwqcZ0IRnFLvUPCM53PCFfzjb5WMYrxVa/
JbSQJiX0hnyRdh5A7jxk/iwr3cmyHe5MYbSD2gi2wHVuciTOYDg2z2GTxzfg8rFp
YLjqbDpwzi7Au1VtOAsydstgdeMyMsSMPUzaj8qxJBjGd/YNHNykav5jT7C71I/z
esVz/G+76QLer7+C3cuGoBMaAByFwGJ5lBhYDo+Mon1JKWotRvCXsxYrHnie3zc0
mvMvJZaFwxbJCL5pkcsRKcukSiv7ag3BnfpEOyO1vNUyZZU67uuo6VczN0G7Nxi3
r/t9Y4HMtFzAcegZzl88GBTJ4hIwgWnvHMORv/CmZaUU3sAmdyA9Dk/svkQC2S6D
fbqdOEqcQvS8eGLErOZ/k+vllvNg45N8wNtM73Dbt4k0ZHlmwYMrkf3r3pQo30x1
IMqvaNXz5aGjlhdMUKufqsoLXqp/iPZL1Sva01MMSsOKJs27z6C8W2Sbybdlofyx
3+53YGpOX0UnSMuUbO2TjlTABFM2yXm4JsxNYN+Jy8S5B+f43eLVjjrPM+4Is0gc
LbCvgbsZliRhoeP+NzVymuuvNdm9zTFp2JVCimpZ6mY=
`pragma protect end_protected

//pragma protect end

