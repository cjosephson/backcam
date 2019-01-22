//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Mar 21 13:49:12 2018
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// top
module top(
    // Inputs
    clock,
    hsync,
    input_data,
    pclk,
    reset,
    trigger_signal,
    vsync,
    // Outputs
    cam_write_en,
    camera_mclk,
    camera_res,
    camera_res_dup,
    signal_into_switch
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        clock;
input        hsync;
input  [3:0] input_data;
input        pclk;
input        reset;
input        trigger_signal;
input        vsync;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       cam_write_en;
output       camera_mclk;
output       camera_res;
output       camera_res_dup;
output       signal_into_switch;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         cam_write_en_net_0;
wire         cam_write_en_1;
wire         cam_write_en_2;
wire         cam_write_en_3;
wire   [7:0] camera_adapter_0_output_data_3;
wire         camera_mclk_net_0;
wire         camera_res_net_0;
wire         camera_res_2;
wire         camera_res_3;
wire         clock;
wire         clock_control_0_clock_out;
wire         dbpsk_modulator_0_output_dbpsk;
wire         debug_detected;
wire         hsync;
wire   [7:0] input_buffer_0_Q;
wire   [3:0] input_data;
wire         packet_encoder_0_output_data;
wire         pclk;
wire         pll_core_0_GLA;
wire         reset;
wire         signal_into_switch_net_0;
wire         trigger_signal;
wire         vsync;
wire         whitening_0_output_whitening;
wire         signal_into_switch_net_1;
wire         camera_mclk_net_1;
wire         camera_res_net_1;
wire         camera_res_net_2;
wire         cam_write_en_1_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [2:0] compress_command_const_net_0;
wire         VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign compress_command_const_net_0 = 3'h0;
assign VCC_net                      = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign signal_into_switch_net_1 = signal_into_switch_net_0;
assign signal_into_switch       = signal_into_switch_net_1;
assign camera_mclk_net_1        = camera_mclk_net_0;
assign camera_mclk              = camera_mclk_net_1;
assign camera_res_net_1         = camera_res_net_0;
assign camera_res               = camera_res_net_1;
assign camera_res_net_2         = camera_res_net_0;
assign camera_res_dup           = camera_res_net_2;
assign cam_write_en_1_net_0     = cam_write_en_1;
assign cam_write_en             = cam_write_en_1_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------camera_adapter
camera_adapter camera_adapter_0(
        // Inputs
        .pclk             ( pclk ),
        .cam_vsync        ( vsync ),
        .cam_hsync        ( hsync ),
        .reset            ( reset ),
        .cam_data         ( input_data ),
        .compress_command ( compress_command_const_net_0 ),
        // Outputs
        .write_en         ( cam_write_en_net_0 ),
        .output_data      ( camera_adapter_0_output_data_3 ) 
        );

//--------camera_clock
camera_clock camera_clock_0(
        // Inputs
        .clock     ( pll_core_0_GLA ),
        .reset     ( reset ),
        // Outputs
        .clock_out ( camera_mclk_net_0 ) 
        );

//--------clock_control
clock_control clock_control_0(
        // Inputs
        .clock     ( pll_core_0_GLA ),
        .reset     ( reset ),
        .trigger   ( trigger_signal ),
        // Outputs
        .clock_out ( clock_control_0_clock_out ),
        .switch    ( cam_write_en_2 ) 
        );

//--------dbpsk_modulator
dbpsk_modulator dbpsk_modulator_0(
        // Inputs
        .clock        ( clock_control_0_clock_out ),
        .reset        ( reset ),
        .input_data   ( whitening_0_output_whitening ),
        .trigger      ( cam_write_en_2 ),
        // Outputs
        .output_dbpsk ( dbpsk_modulator_0_output_dbpsk ) 
        );

//--------downlink_clock_divider
downlink_clock_divider downlink_clock_divider_0(
        // Inputs
        .clock     ( pll_core_0_GLA ),
        .reset     ( reset ),
        // Outputs
        .clock_out ( camera_res_3 ) 
        );

//--------downlink_decoder
downlink_decoder downlink_decoder_0(
        // Inputs
        .clock        ( camera_res_3 ),
        .reset        ( reset ),
        .trigger      ( trigger_signal ),
        // Outputs
        .detected     ( debug_detected ),
        .downlink_bit ( camera_res_2 ) 
        );

//--------downlink_parser
downlink_parser downlink_parser_0(
        // Inputs
        .clock        ( camera_res_3 ),
        .reset        ( reset ),
        .write_en     ( debug_detected ),
        .downlink_bit ( camera_res_2 ),
        // Outputs
        .resolution   ( camera_res_net_0 ),
        .compression  (  ),
        .repetition   (  ) 
        );

//--------input_buffer
input_buffer input_buffer_0(
        // Inputs
        .DATA   ( camera_adapter_0_output_data_3 ),
        .WE     ( cam_write_en_net_0 ),
        .RE     ( cam_write_en_3 ),
        .WCLOCK ( pclk ),
        .RCLOCK ( clock_control_0_clock_out ),
        .RESET  ( reset ),
        // Outputs
        .Q      ( input_buffer_0_Q ),
        .FULL   (  ),
        .EMPTY  ( cam_write_en_1 ) 
        );

//--------packet_encoder
packet_encoder packet_encoder_0(
        // Inputs
        .clock       ( clock_control_0_clock_out ),
        .reset       ( reset ),
        .trigger     ( cam_write_en_2 ),
        .fifo_empty  ( cam_write_en_1 ),
        .input_data  ( input_buffer_0_Q ),
        // Outputs
        .output_data ( packet_encoder_0_output_data ),
        .fifo_re     ( cam_write_en_3 ) 
        );

//--------pll_core
pll_core pll_core_0(
        // Inputs
        .POWERDOWN ( VCC_net ),
        .CLKA      ( clock ),
        // Outputs
        .LOCK      (  ),
        .GLA       ( pll_core_0_GLA ) 
        );

//--------switch_encoder
switch_encoder switch_encoder_0(
        // Inputs
        .clock            ( pll_core_0_GLA ),
        .trigger          ( cam_write_en_2 ),
        .data             ( dbpsk_modulator_0_output_dbpsk ),
        // Outputs
        .signal_to_switch ( signal_into_switch_net_0 ) 
        );

//--------whitening
whitening whitening_0(
        // Inputs
        .clock            ( clock_control_0_clock_out ),
        .reset            ( reset ),
        .input_data       ( packet_encoder_0_output_data ),
        .trigger          ( cam_write_en_2 ),
        // Outputs
        .output_whitening ( whitening_0_output_whitening ) 
        );


endmodule
