`timescale 1 ns/100 ps
// Version: v11.8 11.8.0.26


module clock_control(
       clock_control_0_switch,
       trigger_signal_c_0,
       trigger_signal_c,
       clock_control_0_clock_out,
       reset_c,
       GLA,
       clock_control_0_switch_0
    );
output clock_control_0_switch;
input  trigger_signal_c_0;
input  trigger_signal_c;
output clock_control_0_clock_out;
input  reset_c;
input  GLA;
output clock_control_0_switch_0;

    wire switch_0_sqmuxa, delay_countere, clock_out_i, 
        delay_counter_21_0, \delay_counter[8]_net_1 , 
        switch_0_sqmuxa_1, \delay_counter[9]_net_1 , delay_counter12_3, 
        delay_counter12_1, \counter[0]_net_1 , \counter[5]_net_1 , 
        delay_counter12_2, \counter[4]_net_1 , \counter[3]_net_1 , 
        \counter[1]_net_1 , \counter[2]_net_1 , counter20_2, 
        counter20_1, switch8lto7, switch8lt7, \delay_counter[6]_net_1 , 
        \delay_counter[5]_net_1 , switch8lto4, N_67, delay_counter_c6, 
        delay_counter_n8, delay_counter_n8_tz, delay_counter_n7, 
        delay_counter_n6, delay_counter_c5, delay_counter_n5, 
        delay_counter_c4, delay_counter_n4, delay_counter_c3, 
        delay_counter_n3, \delay_counter[3]_net_1 , delay_counter_c2, 
        delay_counter_n2, \delay_counter[2]_net_1 , delay_counter_c1, 
        counter_n2, counter_c1, counter_1_sqmuxa, counter_n3, 
        counter_c2, counter_n4, counter_c3, counter_n5, counter_33_0, 
        clock_out_4_0_0, delay_counter_n9, delay_counter_n1, 
        \delay_counter[1]_net_1 , \delay_counter[0]_net_1 , N_95, 
        counter_n0, counter_n1, GND, VCC;
    
    NOR2A \delay_counter_RNO[0]  (.A(trigger_signal_c), .B(
        \delay_counter[0]_net_1 ), .Y(N_95));
    DFN1E1C0 switch_0 (.D(switch_0_sqmuxa), .CLK(GLA), .CLR(reset_c), 
        .E(delay_countere), .Q(clock_control_0_switch_0));
    DFN1E1C0 \delay_counter[6]  (.D(delay_counter_n6), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[6]_net_1 ));
    AX1C \delay_counter_RNO_0[8]  (.A(switch8lto7), .B(
        delay_counter_c6), .C(\delay_counter[8]_net_1 ), .Y(
        delay_counter_n8_tz));
    NOR2B \delay_counter_RNIE8HD3[6]  (.A(delay_counter_c5), .B(
        \delay_counter[6]_net_1 ), .Y(delay_counter_c6));
    DFN1C0 \counter[2]  (.D(counter_n2), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[2]_net_1 ));
    NOR2B \delay_counter_RNI02UE1[2]  (.A(delay_counter_c1), .B(
        \delay_counter[2]_net_1 ), .Y(delay_counter_c2));
    DFN1E1C0 \delay_counter[3]  (.D(delay_counter_n3), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[3]_net_1 ));
    XA1 \delay_counter_RNO[5]  (.A(\delay_counter[5]_net_1 ), .B(
        delay_counter_c4), .C(trigger_signal_c), .Y(delay_counter_n5));
    NOR2B \delay_counter_RNI2QIU1[3]  (.A(delay_counter_c2), .B(
        \delay_counter[3]_net_1 ), .Y(delay_counter_c3));
    NOR3 \counter_RNIRHFM[5]  (.A(\counter[2]_net_1 ), .B(
        \counter[5]_net_1 ), .C(\counter[1]_net_1 ), .Y(counter20_2));
    NOR2A \counter_RNO[0]  (.A(counter_1_sqmuxa), .B(
        \counter[0]_net_1 ), .Y(counter_n0));
    XA1 \counter_RNO[4]  (.A(\counter[4]_net_1 ), .B(counter_c3), .C(
        counter_1_sqmuxa), .Y(counter_n4));
    VCC VCC_i (.Y(VCC));
    CLKINT clock_out_RNICHN5 (.A(clock_out_i), .Y(
        clock_control_0_clock_out));
    AO1B \counter_RNIQO6O1[3]  (.A(delay_counter12_3), .B(
        delay_counter12_2), .C(trigger_signal_c_0), .Y(delay_countere));
    DFN1E1C0 \delay_counter[2]  (.D(delay_counter_n2), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[2]_net_1 ));
    XA1 \counter_RNO[1]  (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .C(counter_1_sqmuxa), .Y(counter_n1));
    DFN1E1C0 \delay_counter[0]  (.D(N_95), .CLK(GLA), .CLR(reset_c), 
        .E(delay_countere), .Q(\delay_counter[0]_net_1 ));
    XA1 \delay_counter_RNO[6]  (.A(\delay_counter[6]_net_1 ), .B(
        delay_counter_c5), .C(trigger_signal_c), .Y(delay_counter_n6));
    AOI1B \counter_RNI90NG1[3]  (.A(counter20_2), .B(counter20_1), .C(
        trigger_signal_c_0), .Y(counter_1_sqmuxa));
    DFN1E1C0 \delay_counter[4]  (.D(delay_counter_n4), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(switch8lto4));
    NOR2B \counter_RNI3IVE[0]  (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .Y(counter_c1));
    NOR3C \delay_counter_RNICEUE1[4]  (.A(\delay_counter[6]_net_1 ), 
        .B(\delay_counter[5]_net_1 ), .C(switch8lto4), .Y(switch8lt7));
    AX1C \delay_counter_RNO[9]  (.A(trigger_signal_c), .B(
        \delay_counter[9]_net_1 ), .C(N_67), .Y(delay_counter_n9));
    XA1 \delay_counter_RNO[4]  (.A(switch8lto4), .B(delay_counter_c3), 
        .C(trigger_signal_c), .Y(delay_counter_n4));
    DFN1E1C0 \delay_counter[9]  (.D(delay_counter_n9), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[9]_net_1 ));
    DFN1C0 \counter[4]  (.D(counter_n4), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[4]_net_1 ));
    DFN1C0 \counter[5]  (.D(counter_n5), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[5]_net_1 ));
    DFN1E1C0 \delay_counter[1]  (.D(delay_counter_n1), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[1]_net_1 ));
    NOR2 \counter_RNI5KVE[1]  (.A(\counter[1]_net_1 ), .B(
        \counter[2]_net_1 ), .Y(delay_counter12_1));
    NOR2B \counter_RNIA8VT[3]  (.A(counter_c2), .B(\counter[3]_net_1 ), 
        .Y(counter_c3));
    XA1 \counter_RNO[2]  (.A(\counter[2]_net_1 ), .B(counter_c1), .C(
        counter_1_sqmuxa), .Y(counter_n2));
    NOR2A clock_out_RNO (.A(trigger_signal_c), .B(clock_out_i), .Y(
        clock_out_4_0_0));
    GND GND_i (.Y(GND));
    XA1 \counter_RNO[5]  (.A(\counter[5]_net_1 ), .B(counter_33_0), .C(
        counter_1_sqmuxa), .Y(counter_n5));
    XA1 \counter_RNO[3]  (.A(\counter[3]_net_1 ), .B(counter_c2), .C(
        counter_1_sqmuxa), .Y(counter_n3));
    DFN1C0 \counter[1]  (.D(counter_n1), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[1]_net_1 ));
    DFN1E1C0 \delay_counter[5]  (.D(delay_counter_n5), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[5]_net_1 ));
    NOR2B \counter_RNO_0[5]  (.A(\counter[4]_net_1 ), .B(counter_c3), 
        .Y(counter_33_0));
    DFN1C0 \counter[3]  (.D(counter_n3), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[3]_net_1 ));
    DFN1E1C0 \delay_counter[8]  (.D(delay_counter_n8), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(\delay_counter[8]_net_1 ));
    DFN1E1C0 \delay_counter[7]  (.D(delay_counter_n7), .CLK(GLA), .CLR(
        reset_c), .E(delay_countere), .Q(switch8lto7));
    XA1 \delay_counter_RNO[7]  (.A(delay_counter_c6), .B(switch8lto7), 
        .C(trigger_signal_c), .Y(delay_counter_n7));
    NOR2B \delay_counter_RNIVA9V[1]  (.A(\delay_counter[1]_net_1 ), .B(
        \delay_counter[0]_net_1 ), .Y(delay_counter_c1));
    NOR2 \counter_RNI9OVE_0[3]  (.A(\counter[4]_net_1 ), .B(
        \counter[3]_net_1 ), .Y(delay_counter12_2));
    NOR2B \delay_counter_RNI5J7E2[4]  (.A(delay_counter_c3), .B(
        switch8lto4), .Y(delay_counter_c4));
    NOR2B \delay_counter_RNO_1[9]  (.A(trigger_signal_c), .B(
        \delay_counter[8]_net_1 ), .Y(delay_counter_21_0));
    XA1 \delay_counter_RNO[2]  (.A(\delay_counter[2]_net_1 ), .B(
        delay_counter_c1), .C(trigger_signal_c), .Y(delay_counter_n2));
    XA1 \delay_counter_RNO[1]  (.A(\delay_counter[1]_net_1 ), .B(
        \delay_counter[0]_net_1 ), .C(trigger_signal_c_0), .Y(
        delay_counter_n1));
    NOR3C \delay_counter_RNIKHHA1[9]  (.A(trigger_signal_c_0), .B(
        \delay_counter[9]_net_1 ), .C(\delay_counter[8]_net_1 ), .Y(
        switch_0_sqmuxa_1));
    NOR3C \delay_counter_RNO_0[9]  (.A(switch8lto7), .B(
        delay_counter_c6), .C(delay_counter_21_0), .Y(N_67));
    XA1 \delay_counter_RNO[3]  (.A(\delay_counter[3]_net_1 ), .B(
        delay_counter_c2), .C(trigger_signal_c), .Y(delay_counter_n3));
    DFN1E1C0 clock_out (.D(clock_out_4_0_0), .CLK(GLA), .CLR(reset_c), 
        .E(delay_countere), .Q(clock_out_i));
    OA1 \delay_counter_RNI6S493[7]  (.A(switch8lto7), .B(switch8lt7), 
        .C(switch_0_sqmuxa_1), .Y(switch_0_sqmuxa));
    NOR2B \delay_counter_RNI9DST2[5]  (.A(delay_counter_c4), .B(
        \delay_counter[5]_net_1 ), .Y(delay_counter_c5));
    NOR2B \delay_counter_RNO[8]  (.A(trigger_signal_c), .B(
        delay_counter_n8_tz), .Y(delay_counter_n8));
    DFN1E1C0 switch (.D(switch_0_sqmuxa), .CLK(GLA), .CLR(reset_c), .E(
        delay_countere), .Q(clock_control_0_switch));
    NOR3A \counter_RNICAVT[5]  (.A(delay_counter12_1), .B(
        \counter[0]_net_1 ), .C(\counter[5]_net_1 ), .Y(
        delay_counter12_3));
    DFN1C0 \counter[0]  (.D(counter_n0), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[0]_net_1 ));
    NOR2B \counter_RNIMCFM[2]  (.A(counter_c1), .B(\counter[2]_net_1 ), 
        .Y(counter_c2));
    NOR2B \counter_RNI9OVE[3]  (.A(\counter[4]_net_1 ), .B(
        \counter[3]_net_1 ), .Y(counter20_1));
    
endmodule


module dbpsk_modulator(
       reset_c,
       clock_control_0_clock_out,
       output_dbpsk_4,
       whitening_0_output_whitening,
       clock_control_0_switch
    );
input  reset_c;
input  clock_control_0_clock_out;
output output_dbpsk_4;
input  whitening_0_output_whitening;
input  clock_control_0_switch;

    wire output_dbpsk_0_sqmuxa, dbpsk_modulator_0_output_dbpsk, GND, 
        VCC;
    
    VCC VCC_i (.Y(VCC));
    NOR2A output_dbpsk_RNI6SQ4 (.A(clock_control_0_switch), .B(
        dbpsk_modulator_0_output_dbpsk), .Y(output_dbpsk_4));
    NOR2A output_dbpsk_RNO (.A(clock_control_0_switch), .B(
        whitening_0_output_whitening), .Y(output_dbpsk_0_sqmuxa));
    DFN1E0C0 output_dbpsk (.D(output_dbpsk_4), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(
        output_dbpsk_0_sqmuxa), .Q(dbpsk_modulator_0_output_dbpsk));
    GND GND_i (.Y(GND));
    
endmodule


module downlink_parser(
       camera_res_net_0,
       downlink_decoder_0_downlink_bit,
       reset_c,
       GLB,
       camera_res_c
    );
input  camera_res_net_0;
input  downlink_decoder_0_downlink_bit;
input  reset_c;
input  GLB;
output camera_res_c;

    wire resolution5_4, \downlink_buffer[10]_net_1 , 
        \downlink_buffer[14]_net_1 , resolution5_1, resolution5_3, 
        \downlink_buffer[13]_net_1 , \downlink_buffer[11]_net_1 , 
        resolution5_2, \downlink_buffer[12]_net_1 , 
        \downlink_buffer[8]_net_1 , \downlink_buffer[9]_net_1 , 
        \downlink_buffer[7]_net_1 , resolution5, 
        \downlink_buffer[6]_net_1 , \downlink_buffer[0]_net_1 , 
        \downlink_buffer[1]_net_1 , \downlink_buffer[2]_net_1 , 
        \downlink_buffer[3]_net_1 , \downlink_buffer[4]_net_1 , 
        \downlink_buffer[5]_net_1 , GND, VCC;
    
    DFN0E1C0 \downlink_buffer[3]  (.D(\downlink_buffer[2]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[3]_net_1 ));
    DFN0E1C0 \downlink_buffer[1]  (.D(\downlink_buffer[0]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[1]_net_1 ));
    DFN0E1C0 \downlink_buffer[11]  (.D(\downlink_buffer[10]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[11]_net_1 ));
    NOR2B resolution_RNO_3 (.A(\downlink_buffer[9]_net_1 ), .B(
        \downlink_buffer[7]_net_1 ), .Y(resolution5_1));
    DFN0E1C0 \downlink_buffer[9]  (.D(\downlink_buffer[8]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[9]_net_1 ));
    NOR2B resolution_RNO_0 (.A(\downlink_buffer[13]_net_1 ), .B(
        \downlink_buffer[11]_net_1 ), .Y(resolution5_3));
    VCC VCC_i (.Y(VCC));
    DFN0E1C0 \downlink_buffer[2]  (.D(\downlink_buffer[1]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[2]_net_1 ));
    DFN0E1C0 \downlink_buffer[8]  (.D(\downlink_buffer[7]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[8]_net_1 ));
    NOR3C resolution_RNO (.A(resolution5_3), .B(resolution5_2), .C(
        resolution5_4), .Y(resolution5));
    GND GND_i (.Y(GND));
    DFN0E1C0 \downlink_buffer[4]  (.D(\downlink_buffer[3]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[4]_net_1 ));
    DFN0E1C0 \downlink_buffer[12]  (.D(\downlink_buffer[11]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[12]_net_1 ));
    DFN0E1C0 \downlink_buffer[13]  (.D(\downlink_buffer[12]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[13]_net_1 ));
    DFN0E1C0 \downlink_buffer[6]  (.D(\downlink_buffer[5]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[6]_net_1 ));
    NOR2 resolution_RNO_1 (.A(\downlink_buffer[12]_net_1 ), .B(
        \downlink_buffer[8]_net_1 ), .Y(resolution5_2));
    DFN0E1C0 \downlink_buffer[7]  (.D(\downlink_buffer[6]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[7]_net_1 ));
    NOR3C resolution_RNO_2 (.A(\downlink_buffer[10]_net_1 ), .B(
        \downlink_buffer[14]_net_1 ), .C(resolution5_1), .Y(
        resolution5_4));
    DFN0E1C0 \downlink_buffer[10]  (.D(\downlink_buffer[9]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[10]_net_1 ));
    DFN0E1C0 \downlink_buffer[14]  (.D(\downlink_buffer[13]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[14]_net_1 ));
    DFN0E1C0 \downlink_buffer[5]  (.D(\downlink_buffer[4]_net_1 ), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[5]_net_1 ));
    DFN1E1C0 resolution (.D(\downlink_buffer[6]_net_1 ), .CLK(GLB), 
        .CLR(reset_c), .E(resolution5), .Q(camera_res_c));
    DFN0E1C0 \downlink_buffer[0]  (.D(downlink_decoder_0_downlink_bit), 
        .CLK(GLB), .CLR(reset_c), .E(camera_res_net_0), .Q(
        \downlink_buffer[0]_net_1 ));
    
endmodule


module whitening(
       clock_control_0_clock_out,
       whitening_0_output_whitening,
       reset_c,
       clock_control_0_switch,
       packet_encoder_0_output_data
    );
input  clock_control_0_clock_out;
output whitening_0_output_whitening;
input  reset_c;
input  clock_control_0_switch;
input  packet_encoder_0_output_data;

    wire output_whitening_2, \state[6]_net_1 , \state[3]_net_1 , 
        \state_4[2]_net_1 , \state[1]_net_1 , \state_4[3]_net_1 , 
        \state[2]_net_1 , \state_4[5]_net_1 , \state[4]_net_1 , 
        \state_4[6]_net_1 , \state[5]_net_1 , 
        output_whitening_0_sqmuxa, \state_4[4]_net_1 , 
        \state_4[0]_net_1 , \state_4[1]_net_1 , \state[0]_net_1 , GND, 
        VCC;
    
    NOR2B \state_4[1]  (.A(clock_control_0_switch), .B(
        \state[0]_net_1 ), .Y(\state_4[1]_net_1 ));
    DFN1C0 \state[6]  (.D(\state_4[6]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[6]_net_1 )
        );
    NOR2B \state_4[6]  (.A(\state[5]_net_1 ), .B(
        clock_control_0_switch), .Y(\state_4[6]_net_1 ));
    DFN1C0 \state[1]  (.D(\state_4[1]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[1]_net_1 )
        );
    DFN1C0 \state[4]  (.D(\state_4[4]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[4]_net_1 )
        );
    VCC VCC_i (.Y(VCC));
    NOR2B \state_4[0]  (.A(output_whitening_2), .B(
        clock_control_0_switch), .Y(\state_4[0]_net_1 ));
    NOR2B \state_4[4]  (.A(\state[3]_net_1 ), .B(
        clock_control_0_switch), .Y(\state_4[4]_net_1 ));
    DFN1C0 \state[2]  (.D(\state_4[2]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[2]_net_1 )
        );
    GND GND_i (.Y(GND));
    NOR2B \state_4[5]  (.A(\state[4]_net_1 ), .B(
        clock_control_0_switch), .Y(\state_4[5]_net_1 ));
    NOR2B output_whitening_RNO (.A(reset_c), .B(clock_control_0_switch)
        , .Y(output_whitening_0_sqmuxa));
    NOR2B \state_4[3]  (.A(\state[2]_net_1 ), .B(
        clock_control_0_switch), .Y(\state_4[3]_net_1 ));
    DFN1C0 \state[5]  (.D(\state_4[5]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[5]_net_1 )
        );
    DFN1E1 output_whitening (.D(output_whitening_2), .CLK(
        clock_control_0_clock_out), .E(output_whitening_0_sqmuxa), .Q(
        whitening_0_output_whitening));
    NOR2B \state_4[2]  (.A(\state[1]_net_1 ), .B(
        clock_control_0_switch), .Y(\state_4[2]_net_1 ));
    DFN1C0 \state[0]  (.D(\state_4[0]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[0]_net_1 )
        );
    XOR3 \state_RNIDGFP[6]  (.A(\state[6]_net_1 ), .B(
        packet_encoder_0_output_data), .C(\state[3]_net_1 ), .Y(
        output_whitening_2));
    DFN1C0 \state[3]  (.D(\state_4[3]_net_1 ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(\state[3]_net_1 )
        );
    
endmodule


module pll_core(
       clock_c,
       GLB,
       GLA
    );
input  clock_c;
output GLB;
output GLA;

    wire CLKAP, Core_GLC, LOCK, Core_YB, Core_YC, pll_core_GND, 
        pll_core_VCC;
    
    PLL #( .VCOFREQUENCY(50.000000) )  Core (.CLKA(CLKAP), .EXTFB(
        pll_core_GND), .POWERDOWN(pll_core_VCC), .GLA(GLA), .LOCK(LOCK)
        , .GLB(GLB), .YB(Core_YB), .GLC(Core_GLC), .YC(Core_YC), 
        .OADIV0(pll_core_GND), .OADIV1(pll_core_GND), .OADIV2(
        pll_core_GND), .OADIV3(pll_core_GND), .OADIV4(pll_core_GND), 
        .OAMUX0(pll_core_GND), .OAMUX1(pll_core_GND), .OAMUX2(
        pll_core_VCC), .DLYGLA0(pll_core_GND), .DLYGLA1(pll_core_GND), 
        .DLYGLA2(pll_core_GND), .DLYGLA3(pll_core_GND), .DLYGLA4(
        pll_core_GND), .OBDIV0(pll_core_GND), .OBDIV1(pll_core_GND), 
        .OBDIV2(pll_core_GND), .OBDIV3(pll_core_VCC), .OBDIV4(
        pll_core_VCC), .OBMUX0(pll_core_GND), .OBMUX1(pll_core_VCC), 
        .OBMUX2(pll_core_GND), .DLYYB0(pll_core_GND), .DLYYB1(
        pll_core_GND), .DLYYB2(pll_core_GND), .DLYYB3(pll_core_GND), 
        .DLYYB4(pll_core_GND), .DLYGLB0(pll_core_GND), .DLYGLB1(
        pll_core_GND), .DLYGLB2(pll_core_GND), .DLYGLB3(pll_core_GND), 
        .DLYGLB4(pll_core_GND), .OCDIV0(pll_core_GND), .OCDIV1(
        pll_core_GND), .OCDIV2(pll_core_GND), .OCDIV3(pll_core_GND), 
        .OCDIV4(pll_core_GND), .OCMUX0(pll_core_GND), .OCMUX1(
        pll_core_GND), .OCMUX2(pll_core_GND), .DLYYC0(pll_core_GND), 
        .DLYYC1(pll_core_GND), .DLYYC2(pll_core_GND), .DLYYC3(
        pll_core_GND), .DLYYC4(pll_core_GND), .DLYGLC0(pll_core_GND), 
        .DLYGLC1(pll_core_GND), .DLYGLC2(pll_core_GND), .DLYGLC3(
        pll_core_GND), .DLYGLC4(pll_core_GND), .FINDIV0(pll_core_VCC), 
        .FINDIV1(pll_core_VCC), .FINDIV2(pll_core_GND), .FINDIV3(
        pll_core_GND), .FINDIV4(pll_core_GND), .FINDIV5(pll_core_GND), 
        .FINDIV6(pll_core_GND), .FBDIV0(pll_core_VCC), .FBDIV1(
        pll_core_GND), .FBDIV2(pll_core_GND), .FBDIV3(pll_core_VCC), 
        .FBDIV4(pll_core_GND), .FBDIV5(pll_core_GND), .FBDIV6(
        pll_core_GND), .FBDLY0(pll_core_GND), .FBDLY1(pll_core_GND), 
        .FBDLY2(pll_core_GND), .FBDLY3(pll_core_GND), .FBDLY4(
        pll_core_GND), .FBSEL0(pll_core_VCC), .FBSEL1(pll_core_GND), 
        .XDLYSEL(pll_core_GND), .VCOSEL0(pll_core_GND), .VCOSEL1(
        pll_core_VCC), .VCOSEL2(pll_core_GND));
    PLLINT pllint1 (.A(clock_c), .Y(CLKAP));
    VCC VCC_i (.Y(pll_core_VCC));
    GND GND_i (.Y(pll_core_GND));
    
endmodule


module switch_encoder(
       output_dbpsk_4,
       GLA,
       signal_into_switch_c
    );
input  output_dbpsk_4;
input  GLA;
output signal_into_switch_c;

    wire GND, VCC;
    
    XOR2 signal_to_switch (.A(GLA), .B(output_dbpsk_4), .Y(
        signal_into_switch_c));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    
endmodule


module downlink_decoder(
       camera_res_net_0,
       downlink_decoder_0_downlink_bit,
       reset_c,
       GLB,
       trigger_signal_c_0,
       trigger_signal_c
    );
output camera_res_net_0;
output downlink_decoder_0_downlink_bit;
input  reset_c;
input  GLB;
input  trigger_signal_c_0;
input  trigger_signal_c;

    wire detected_0_sqmuxa_0, trigger_state_net_1, packet_length_25_0, 
        \packet_length[9]_net_1 , detected14_1, un6lto6, 
        un1_packet_lengthlt7, detected14_0, un6lto10, un6lto9, 
        un7lto9_3, \packet_length[8]_net_1 , un7lto9_1, un7lto9_2, 
        \packet_length[4]_net_1 , \packet_length[5]_net_1 , un6lto7, 
        un1_packet_length_1lto9_2, un1_packet_length_1lto9_1, 
        un1_packet_length_1lt10, un1_packet_length_1lt9, un7lt10, 
        un7lt9, detected_RNO_net_1, N_44, detected_0_sqmuxa, un6lt10, 
        un1_packet_lengthlt4, \packet_length[2]_net_1 , 
        \packet_length[1]_net_1 , un7lto3, packet_length_n6, 
        packet_length_c5, packet_length_n5, packet_length_c4, 
        packet_length_n4, packet_length_c3, packet_length_n3, 
        packet_length_c2, packet_length_n2, packet_length_c1, 
        packet_length_n7, packet_length_c6, packet_length_n8, 
        packet_length_c7, packet_length_n9, packet_length_c8, 
        packet_length_n1, un6lto0, packet_length_n0, un6lt7, 
        detected15, N_69, packet_length_n10, GND, VCC;
    
    XA1 \packet_length_RNO[8]  (.A(\packet_length[8]_net_1 ), .B(
        packet_length_c7), .C(trigger_signal_c_0), .Y(packet_length_n8)
        );
    DFN1C0 \packet_length[0]  (.D(packet_length_n0), .CLK(GLB), .CLR(
        reset_c), .Q(un6lto0));
    OR2 \packet_length_RNI4SPJ1[6]  (.A(packet_length_c5), .B(un6lto6), 
        .Y(un6lt7));
    DFN1C0 detected (.D(detected_RNO_net_1), .CLK(GLB), .CLR(reset_c), 
        .Q(camera_res_net_0));
    DFN1C0 \packet_length[9]  (.D(packet_length_n9), .CLK(GLB), .CLR(
        reset_c), .Q(\packet_length[9]_net_1 ));
    DFN1C0 \packet_length[8]  (.D(packet_length_n8), .CLK(GLB), .CLR(
        reset_c), .Q(\packet_length[8]_net_1 ));
    NOR2B detected_RNO_5 (.A(\packet_length[4]_net_1 ), .B(un6lto6), 
        .Y(un7lto9_2));
    XA1 \packet_length_RNO[2]  (.A(packet_length_c1), .B(
        \packet_length[2]_net_1 ), .C(trigger_signal_c_0), .Y(
        packet_length_n2));
    NOR2B \packet_length_RNI71051[4]  (.A(packet_length_c3), .B(
        \packet_length[4]_net_1 ), .Y(packet_length_c4));
    XA1 \packet_length_RNO[7]  (.A(un6lto7), .B(packet_length_c6), .C(
        trigger_signal_c_0), .Y(packet_length_n7));
    NOR2B \packet_length_RNIJGPE[0]  (.A(un6lto0), .B(
        \packet_length[1]_net_1 ), .Y(packet_length_c1));
    NOR3A detected_RNO_8 (.A(un1_packet_length_1lto9_1), .B(
        \packet_length[5]_net_1 ), .C(\packet_length[4]_net_1 ), .Y(
        un1_packet_length_1lto9_2));
    NOR2A \packet_length_RNID8UI[10]  (.A(un6lto10), .B(un6lto9), .Y(
        detected14_0));
    AOI1 detected_RNO_0 (.A(detected14_1), .B(un6lt10), .C(detected15), 
        .Y(N_44));
    VCC VCC_i (.Y(VCC));
    XA1 \packet_length_RNO[5]  (.A(packet_length_c4), .B(
        \packet_length[5]_net_1 ), .C(trigger_signal_c_0), .Y(
        packet_length_n5));
    NOR2B \packet_length_RNO_1[10]  (.A(trigger_signal_c), .B(un6lto10)
        , .Y(N_69));
    OA1C \packet_length_RNIC6051[4]  (.A(\packet_length[4]_net_1 ), .B(
        un1_packet_lengthlt4), .C(\packet_length[5]_net_1 ), .Y(
        un1_packet_lengthlt7));
    DFN1C0 \packet_length[1]  (.D(packet_length_n1), .CLK(GLB), .CLR(
        reset_c), .Q(\packet_length[1]_net_1 ));
    XA1 \packet_length_RNO[1]  (.A(\packet_length[1]_net_1 ), .B(
        un6lto0), .C(trigger_signal_c_0), .Y(packet_length_n1));
    MX2 detected_RNO_1 (.A(un7lt10), .B(un1_packet_length_1lt10), .S(
        un6lto10), .Y(detected15));
    XA1 \packet_length_RNO[3]  (.A(packet_length_c2), .B(un7lto3), .C(
        trigger_signal_c_0), .Y(packet_length_n3));
    OR2 detected_RNO_6 (.A(packet_length_c2), .B(un7lto3), .Y(un7lt9));
    NOR3C detected_RNO_4 (.A(\packet_length[9]_net_1 ), .B(
        \packet_length[8]_net_1 ), .C(un7lto9_1), .Y(un7lto9_3));
    NOR2A \packet_length_RNO[0]  (.A(trigger_signal_c), .B(un6lto0), 
        .Y(packet_length_n0));
    NOR3C downlink_bit_RNO (.A(un6lt10), .B(detected14_1), .C(
        detected_0_sqmuxa_0), .Y(detected_0_sqmuxa));
    AX1C \packet_length_RNO[10]  (.A(packet_length_c8), .B(
        packet_length_25_0), .C(N_69), .Y(packet_length_n10));
    NOR2B detected_RNO_9 (.A(\packet_length[5]_net_1 ), .B(un6lto7), 
        .Y(un7lto9_1));
    NOR3C detected_RNO_2 (.A(un7lto9_3), .B(un7lto9_2), .C(un7lt9), .Y(
        un7lt10));
    AO1 \packet_length_RNI7S0A2[7]  (.A(un6lt7), .B(un6lto7), .C(
        un6lto9), .Y(un6lt10));
    GND GND_i (.Y(GND));
    NOR2B \packet_length_RNIA5JT[3]  (.A(packet_length_c2), .B(un7lto3)
        , .Y(packet_length_c3));
    DFN1C0 \packet_length[2]  (.D(packet_length_n2), .CLK(GLB), .CLR(
        reset_c), .Q(\packet_length[2]_net_1 ));
    NOR2 detected_RNO_10 (.A(un6lto7), .B(un6lto6), .Y(
        un1_packet_length_1lto9_1));
    NOR2B \packet_length_RNI5UCC1[5]  (.A(packet_length_c4), .B(
        \packet_length[5]_net_1 ), .Y(packet_length_c5));
    DFN1C0 \packet_length[5]  (.D(packet_length_n5), .CLK(GLB), .CLR(
        reset_c), .Q(\packet_length[5]_net_1 ));
    NOR2B \packet_length_RNI5RJ22[8]  (.A(packet_length_c7), .B(
        \packet_length[8]_net_1 ), .Y(packet_length_c8));
    XA1 \packet_length_RNO[4]  (.A(packet_length_c3), .B(
        \packet_length[4]_net_1 ), .C(trigger_signal_c_0), .Y(
        packet_length_n4));
    NOR2B \packet_length_RNI4R6R1[7]  (.A(packet_length_c6), .B(
        un6lto7), .Y(packet_length_c7));
    NOR2B \packet_length_RNO_0[10]  (.A(trigger_signal_c), .B(
        \packet_length[9]_net_1 ), .Y(packet_length_25_0));
    XA1 \packet_length_RNO[6]  (.A(packet_length_c5), .B(un6lto6), .C(
        trigger_signal_c_0), .Y(packet_length_n6));
    NOR2B \packet_length_RNIEA6M[2]  (.A(packet_length_c1), .B(
        \packet_length[2]_net_1 ), .Y(packet_length_c2));
    DFN1C0 downlink_bit (.D(detected_0_sqmuxa), .CLK(GLB), .CLR(
        reset_c), .Q(downlink_decoder_0_downlink_bit));
    NOR3A detected_RNO (.A(trigger_state_net_1), .B(trigger_signal_c_0)
        , .C(N_44), .Y(detected_RNO_net_1));
    DFN1C0 \packet_length[10]  (.D(packet_length_n10), .CLK(GLB), .CLR(
        reset_c), .Q(un6lto10));
    OA1A \packet_length_RNIOCBV1[6]  (.A(un6lto6), .B(
        un1_packet_lengthlt7), .C(detected14_0), .Y(detected14_1));
    NOR3 \packet_length_RNIHD6M[1]  (.A(\packet_length[2]_net_1 ), .B(
        \packet_length[1]_net_1 ), .C(un7lto3), .Y(
        un1_packet_lengthlt4));
    DFN1C0 \packet_length[7]  (.D(packet_length_n7), .CLK(GLB), .CLR(
        reset_c), .Q(un6lto7));
    NOR2A downlink_bit_RNO_0 (.A(trigger_state_net_1), .B(
        trigger_signal_c), .Y(detected_0_sqmuxa_0));
    OAI1 detected_RNO_7 (.A(\packet_length[2]_net_1 ), .B(
        \packet_length[1]_net_1 ), .C(un7lto3), .Y(
        un1_packet_length_1lt9));
    DFN1C0 \packet_length[3]  (.D(packet_length_n3), .CLK(GLB), .CLR(
        reset_c), .Q(un7lto3));
    DFN1C0 \packet_length[4]  (.D(packet_length_n4), .CLK(GLB), .CLR(
        reset_c), .Q(\packet_length[4]_net_1 ));
    DFN1C0 trigger_state (.D(trigger_signal_c_0), .CLK(GLB), .CLR(
        reset_c), .Q(trigger_state_net_1));
    OR2 \packet_length_RNI31QE[8]  (.A(\packet_length[8]_net_1 ), .B(
        \packet_length[9]_net_1 ), .Y(un6lto9));
    NOR3B detected_RNO_3 (.A(un1_packet_length_1lt9), .B(
        un1_packet_length_1lto9_2), .C(un6lto9), .Y(
        un1_packet_length_1lt10));
    NOR2B \packet_length_RNI4SPJ1_0[6]  (.A(packet_length_c5), .B(
        un6lto6), .Y(packet_length_c6));
    XA1 \packet_length_RNO[9]  (.A(\packet_length[9]_net_1 ), .B(
        packet_length_c8), .C(trigger_signal_c_0), .Y(packet_length_n9)
        );
    DFN1C0 \packet_length[6]  (.D(packet_length_n6), .CLK(GLB), .CLR(
        reset_c), .Q(un6lto6));
    
endmodule


module camera_clock(
       reset_c,
       GLA,
       camera_mclk_c
    );
input  reset_c;
input  GLA;
output camera_mclk_c;

    wire N_5, \counter[1]_net_1 , \counter[0]_net_1 , N_3, 
        \counter[3]_net_1 , \DWACT_FINC_E[0] , counter21_1, 
        counter21_2, \counter[5]_net_1 , \counter[4]_net_1 , 
        counter21_0, \counter[2]_net_1 , clock_out5_0, 
        clock_out_RNO_net_1, \counter_5[2] , I_7, \counter_5[1] , I_5, 
        I_4, I_9, I_12, I_14, N_2, N_4, GND, VCC;
    
    NOR2B \counter_RNIKD0O[2]  (.A(\counter[2]_net_1 ), .B(
        \counter[0]_net_1 ), .Y(counter21_0));
    NOR2B un3_counter_I_6 (.A(\counter[1]_net_1 ), .B(
        \counter[0]_net_1 ), .Y(N_5));
    XOR2 un3_counter_I_5 (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .Y(I_5));
    AND3 un3_counter_I_13 (.A(\DWACT_FINC_E[0] ), .B(
        \counter[3]_net_1 ), .C(\counter[4]_net_1 ), .Y(N_2));
    NOR2 clock_out_RNO_0 (.A(\counter[2]_net_1 ), .B(
        \counter[0]_net_1 ), .Y(clock_out5_0));
    XOR2 un3_counter_I_7 (.A(N_5), .B(\counter[2]_net_1 ), .Y(I_7));
    DFN1C0 \counter[3]  (.D(I_9), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[3]_net_1 ));
    AND3 un3_counter_I_8 (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .C(\counter[2]_net_1 ), .Y(N_4));
    NOR2B un3_counter_I_11 (.A(\counter[3]_net_1 ), .B(
        \DWACT_FINC_E[0] ), .Y(N_3));
    DFN1C0 \counter[1]  (.D(\counter_5[1] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[1]_net_1 ));
    NOR2 \counter_RNIMF0O[3]  (.A(\counter[3]_net_1 ), .B(
        \counter[1]_net_1 ), .Y(counter21_2));
    DFN1C0 \counter[2]  (.D(\counter_5[2] ), .CLK(GLA), .CLR(reset_c), 
        .Q(\counter[2]_net_1 ));
    DFN1C0 \counter[0]  (.D(I_4), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[0]_net_1 ));
    VCC VCC_i (.Y(VCC));
    XOR2 un3_counter_I_14 (.A(N_2), .B(\counter[5]_net_1 ), .Y(I_14));
    AOI1B \counter_RNO[1]  (.A(counter21_1), .B(counter21_0), .C(I_5), 
        .Y(\counter_5[1] ));
    AOI1B \counter_RNO[2]  (.A(counter21_1), .B(counter21_0), .C(I_7), 
        .Y(\counter_5[2] ));
    AX1C clock_out_RNO (.A(clock_out5_0), .B(counter21_1), .C(
        camera_mclk_c), .Y(clock_out_RNO_net_1));
    GND GND_i (.Y(GND));
    XOR2 un3_counter_I_9 (.A(N_4), .B(\counter[3]_net_1 ), .Y(I_9));
    AND3 un3_counter_I_10 (.A(\counter[0]_net_1 ), .B(
        \counter[1]_net_1 ), .C(\counter[2]_net_1 ), .Y(
        \DWACT_FINC_E[0] ));
    XOR2 un3_counter_I_12 (.A(N_3), .B(\counter[4]_net_1 ), .Y(I_12));
    NOR3A \counter_RNIH41G1[5]  (.A(counter21_2), .B(
        \counter[5]_net_1 ), .C(\counter[4]_net_1 ), .Y(counter21_1));
    DFN1C0 clock_out (.D(clock_out_RNO_net_1), .CLK(GLA), .CLR(reset_c)
        , .Q(camera_mclk_c));
    INV un3_counter_I_4 (.A(\counter[0]_net_1 ), .Y(I_4));
    DFN1C0 \counter[5]  (.D(I_14), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[5]_net_1 ));
    DFN1C0 \counter[4]  (.D(I_12), .CLK(GLA), .CLR(reset_c), .Q(
        \counter[4]_net_1 ));
    
endmodule


module input_buffer(
       camera_adapter_0_output_data_3,
       input_buffer_0_Q,
       clock_control_0_clock_out,
       pclk_c,
       camera_adapter_0_write_en,
       packet_encoder_0_fifo_re,
       input_buffer_0_EMPTY,
       reset_c
    );
input  [7:0] camera_adapter_0_output_data_3;
output [7:0] input_buffer_0_Q;
input  clock_control_0_clock_out;
input  pclk_c;
input  camera_adapter_0_write_en;
input  packet_encoder_0_fifo_re;
output input_buffer_0_EMPTY;
input  reset_c;

    wire WRITE_RESET_P_1, WCLOCKP, DFN1C0_15_Q, WRITE_RESET_P_0, 
        READ_RESET_P_1, RCLOCKP, DFN1C0_3_Q, READ_RESET_P_0, 
        WCLKBUBBLE_net_1, RCLKBUBBLE_net_1, \WGRYSYNC[5] , DFN1C0_24_Q, 
        \MEM_RADDR[11] , \RBINNXTSHIFT[11] , AND2_25_Y, AND2_59_Y, 
        AND2_44_Y, XNOR3_2_Y, \RGRYSYNC[3] , \RGRYSYNC[2] , 
        \RGRYSYNC[1] , XNOR2_8_Y, \RBINSYNCSHIFT[7] , 
        \WBINNXTSHIFT[7] , \RBINSYNCSHIFT[6] , \RGRYSYNC[6] , XOR3_5_Y, 
        XNOR3_0_Y, XOR2_74_Y, \MEM_RADDR[12] , input_buffer_GND, 
        XOR2_36_Y, \MEM_RADDR[1] , \MEM_RADDR[9] , READ_RESET_P, 
        \RBINNXTSHIFT[9] , AO1_21_Y, XOR2_53_Y, AO1_2_Y, AND2_1_Y, 
        XNOR3_37_Y, \RGRYSYNC[12] , \RGRYSYNC[11] , \RGRYSYNC[10] , 
        \RBINNXTSHIFT[2] , XOR2_34_Y, AO1_14_Y, XOR2_42_Y, 
        \RBINNXTSHIFT[3] , XNOR2_14_Y, \WBINSYNCSHIFT[3] , XNOR3_4_Y, 
        \WGRYSYNC[12] , \WGRYSYNC[11] , \WGRYSYNC[10] , XOR2_68_Y, 
        \MEM_RADDR[6] , AO1_4_Y, XOR2_47_Y, AND2_52_Y, AND2_13_Y, 
        \RGRYSYNC[8] , DFN1C0_25_Q, \WBINSYNCSHIFT[6] , \WGRYSYNC[6] , 
        XOR3_3_Y, XNOR3_26_Y, DFN1C0_22_Q, \WGRY[9] , NAND2_1_Y, 
        input_buffer_VCC, XOR2_70_Y, \RBINNXTSHIFT[5] , 
        \RBINNXTSHIFT[6] , XOR2_0_Y, \MEM_WADDR[6] , XNOR3_17_Y, 
        \RGRY[8] , \WGRY[4] , XOR2_46_Y, XOR3_7_Y, AO1_37_Y, XOR2_4_Y, 
        AND2_30_Y, \WBINNXTSHIFT[1] , XOR2_48_Y, AND2_27_Y, \RGRY[0] , 
        XOR2_13_Y, XNOR3_28_Y, \WGRYSYNC[3] , \WGRYSYNC[2] , 
        \WGRYSYNC[1] , AND3_4_Y, XNOR2_15_Y, XNOR2_2_Y, 
        \WBINNXTSHIFT[11] , XOR2_49_Y, AO1_29_Y, \MEM_RADDR[10] , 
        \RBINNXTSHIFT[10] , \RAM4K9_QXI[3]_DOUTA0 , 
        \RAM4K9_QXI[3]_DOUTA1 , \RAM4K9_QXI[3]_DOUTA2 , 
        \RAM4K9_QXI[3]_DOUTA3 , \RAM4K9_QXI[3]_DOUTA4 , 
        \RAM4K9_QXI[3]_DOUTA5 , \RAM4K9_QXI[3]_DOUTA6 , 
        \RAM4K9_QXI[3]_DOUTA7 , \RAM4K9_QXI[3]_DOUTA8 , \QXI[3] , 
        \RAM4K9_QXI[3]_DOUTB1 , \RAM4K9_QXI[3]_DOUTB2 , 
        \RAM4K9_QXI[3]_DOUTB3 , \RAM4K9_QXI[3]_DOUTB4 , 
        \RAM4K9_QXI[3]_DOUTB5 , \RAM4K9_QXI[3]_DOUTB6 , 
        \RAM4K9_QXI[3]_DOUTB7 , \RAM4K9_QXI[3]_DOUTB8 , \MEM_WADDR[0] , 
        \MEM_WADDR[1] , \MEM_WADDR[2] , \MEM_WADDR[3] , \MEM_WADDR[4] , 
        \MEM_WADDR[5] , \MEM_WADDR[7] , \MEM_WADDR[8] , \MEM_WADDR[9] , 
        \MEM_WADDR[10] , \MEM_WADDR[11] , \MEM_RADDR[0] , 
        \MEM_RADDR[2] , \MEM_RADDR[3] , \MEM_RADDR[4] , \MEM_RADDR[5] , 
        \MEM_RADDR[7] , \MEM_RADDR[8] , MEMWENEG, MEMRENEG, XNOR2_17_Y, 
        \RBINSYNCSHIFT[1] , \WBINSYNCSHIFT[4] , XNOR3_13_Y, XNOR3_32_Y, 
        AO1_17_Y, XOR2_41_Y, AND2_58_Y, AND2_50_Y, \RBINNXTSHIFT[0] , 
        XNOR3_48_Y, \WGRYSYNC[9] , \WGRYSYNC[8] , \WGRYSYNC[7] , 
        XOR2_15_Y, \WBINNXTSHIFT[9] , \WBINNXTSHIFT[10] , 
        WRITE_RESET_P, \WBINNXTSHIFT[5] , XNOR3_36_Y, XNOR3_7_Y, 
        XNOR3_19_Y, XOR2_28_Y, \WBINNXTSHIFT[6] , AND3_7_Y, XNOR2_12_Y, 
        XNOR2_7_Y, XNOR2_13_Y, XNOR3_51_Y, \RGRYSYNC[9] , 
        \RGRYSYNC[7] , DFN1C0_13_Q, \WGRY[0] , AND2_53_Y, XOR2_9_Y, 
        XOR2_3_Y, XOR2_73_Y, XOR2_17_Y, \WBINNXTSHIFT[2] , 
        \WBINNXTSHIFT[3] , \RBINNXTSHIFT[1] , AND2_61_Y, XNOR3_16_Y, 
        \WGRYSYNC[4] , \RBINSYNCSHIFT[0] , XNOR3_43_Y, XNOR3_12_Y, 
        XNOR3_5_Y, AND2_56_Y, AND2_48_Y, AND2_41_Y, \WGRY[5] , 
        XOR2_66_Y, XOR2_51_Y, AO1_27_Y, XOR2_19_Y, AO1_5_Y, XOR2_76_Y, 
        AO1_36_Y, XOR3_1_Y, XNOR3_21_Y, XOR2_54_Y, \WBINNXTSHIFT[4] , 
        \WBINSYNCSHIFT[9] , XNOR3_22_Y, AND2_8_Y, XOR2_39_Y, XOR3_2_Y, 
        \RGRY[3] , XOR2_43_Y, XNOR3_41_Y, \RBINSYNCSHIFT[11] , 
        XNOR2_16_Y, \RBINNXTSHIFT[8] , \WBINSYNCSHIFT[8] , AO1_25_Y, 
        AO1_23_Y, XNOR2_5_Y, \RBINSYNCSHIFT[5] , \WGRY[8] , XOR2_45_Y, 
        \QXI[2] , DVLDI, DFN1C0_20_Q, XOR2_50_Y, FULLINT, AND3_1_Y, 
        XOR2_40_Y, AND2_4_Y, DFN1C0_8_Q, \RGRY[10] , XOR2_67_Y, 
        XOR2_62_Y, XOR2_58_Y, DFN1C0_1_Q, \RGRY[9] , XOR2_26_Y, 
        \RBINNXTSHIFT[12] , \RAM4K9_QXI[5]_DOUTA0 , 
        \RAM4K9_QXI[5]_DOUTA1 , \RAM4K9_QXI[5]_DOUTA2 , 
        \RAM4K9_QXI[5]_DOUTA3 , \RAM4K9_QXI[5]_DOUTA4 , 
        \RAM4K9_QXI[5]_DOUTA5 , \RAM4K9_QXI[5]_DOUTA6 , 
        \RAM4K9_QXI[5]_DOUTA7 , \RAM4K9_QXI[5]_DOUTA8 , \QXI[5] , 
        \RAM4K9_QXI[5]_DOUTB1 , \RAM4K9_QXI[5]_DOUTB2 , 
        \RAM4K9_QXI[5]_DOUTB3 , \RAM4K9_QXI[5]_DOUTB4 , 
        \RAM4K9_QXI[5]_DOUTB5 , \RAM4K9_QXI[5]_DOUTB6 , 
        \RAM4K9_QXI[5]_DOUTB7 , \RAM4K9_QXI[5]_DOUTB8 , XOR2_24_Y, 
        AO1_10_Y, AO1_19_Y, AND2_49_Y, DFN1C0_21_Q, \RGRY[6] , 
        DFN1C0_5_Q, AND2_45_Y, XOR2_14_Y, XOR2_65_Y, XOR2_12_Y, 
        \MEM_WADDR[12] , \WBINSYNCSHIFT[1] , \WBINSYNCSHIFT[0] , 
        DFN1C0_26_Q, DFN1C0_19_Q, \RGRY[12] , AO1_33_Y, AND2_31_Y, 
        AO1_8_Y, XOR2_27_Y, AO1_12_Y, XNOR2_23_Y, \WBINSYNCSHIFT[10] , 
        AO1_16_Y, AND2_26_Y, XOR2_38_Y, \RBINSYNCSHIFT[2] , XNOR3_3_Y, 
        XNOR3_44_Y, XNOR3_49_Y, AO1_13_Y, AND2_43_Y, AO1_28_Y, 
        AND2_54_Y, XOR2_16_Y, \WGRY[12] , XOR2_52_Y, XOR2_6_Y, 
        XOR2_60_Y, AND2_2_Y, XNOR3_40_Y, AND2_17_Y, XNOR2_4_Y, 
        AO1_18_Y, AO1_32_Y, XOR2_33_Y, XOR2_69_Y, XOR2_7_Y, 
        \RBINNXTSHIFT[7] , XOR2_63_Y, \WBINSYNCSHIFT[11] , AO1_30_Y, 
        AND2_15_Y, AND2_46_Y, DFN1C0_27_Q, \RBINSYNCSHIFT[4] , 
        XNOR3_30_Y, XNOR3_9_Y, XNOR3_29_Y, EMPTYINT, \WGRY[1] , 
        XOR2_29_Y, \RGRYSYNC[0] , XNOR2_24_Y, \RBINNXTSHIFT[4] , 
        AO1_9_Y, DFN1C0_6_Q, XOR2_44_Y, \WBINNXTSHIFT[8] , AND2_33_Y, 
        AO1_3_Y, XOR2_20_Y, AO1_11_Y, AND3_9_Y, XNOR2_18_Y, XNOR2_20_Y, 
        \RGRY[7] , XOR2_18_Y, XNOR3_15_Y, XNOR3_34_Y, XNOR3_11_Y, 
        \WGRY[10] , AO1_26_Y, AO1_1_Y, AND2_9_Y, AND2A_0_Y, XOR2_37_Y, 
        XNOR3_10_Y, \RGRYSYNC[5] , XNOR3_45_Y, \RGRY[5] , \WGRY[7] , 
        XOR2_2_Y, \WBINNXTSHIFT[12] , XOR3_0_Y, DFN1C0_0_Q, 
        \RBINSYNCSHIFT[12] , DFN1C0_23_Q, AO1_0_Y, AO1_15_Y, \WGRY[2] , 
        AO1_20_Y, AND2_6_Y, MEMORYWE, NAND2_0_Y, XNOR2_10_Y, 
        \WBINSYNCSHIFT[5] , XOR2_56_Y, DFN1C0_2_Q, FULL, 
        \RBINSYNCSHIFT[3] , XNOR3_39_Y, XNOR3_47_Y, AND2_24_Y, 
        XNOR3_35_Y, XOR2_32_Y, AND3_2_Y, AND3_5_Y, AND3_3_Y, AO1_6_Y, 
        DFN1C0_7_Q, XOR3_6_Y, XNOR2_22_Y, READDOMAIN_WMSB, XOR2_11_Y, 
        XNOR2_3_Y, \RBINSYNCSHIFT[9] , XNOR3_1_Y, XNOR3_23_Y, 
        \RAM4K9_QXI[4]_DOUTA0 , \RAM4K9_QXI[4]_DOUTA1 , 
        \RAM4K9_QXI[4]_DOUTA2 , \RAM4K9_QXI[4]_DOUTA3 , 
        \RAM4K9_QXI[4]_DOUTA4 , \RAM4K9_QXI[4]_DOUTA5 , 
        \RAM4K9_QXI[4]_DOUTA6 , \RAM4K9_QXI[4]_DOUTA7 , 
        \RAM4K9_QXI[4]_DOUTA8 , \QXI[4] , \RAM4K9_QXI[4]_DOUTB1 , 
        \RAM4K9_QXI[4]_DOUTB2 , \RAM4K9_QXI[4]_DOUTB3 , 
        \RAM4K9_QXI[4]_DOUTB4 , \RAM4K9_QXI[4]_DOUTB5 , 
        \RAM4K9_QXI[4]_DOUTB6 , \RAM4K9_QXI[4]_DOUTB7 , 
        \RAM4K9_QXI[4]_DOUTB8 , AND2_5_Y, MEMORYRE, \RGRYSYNC[4] , 
        \RGRY[4] , XOR2_64_Y, XNOR3_6_Y, \RAM4K9_QXI[0]_DOUTA0 , 
        \RAM4K9_QXI[0]_DOUTA1 , \RAM4K9_QXI[0]_DOUTA2 , 
        \RAM4K9_QXI[0]_DOUTA3 , \RAM4K9_QXI[0]_DOUTA4 , 
        \RAM4K9_QXI[0]_DOUTA5 , \RAM4K9_QXI[0]_DOUTA6 , 
        \RAM4K9_QXI[0]_DOUTA7 , \RAM4K9_QXI[0]_DOUTA8 , \QXI[0] , 
        \RAM4K9_QXI[0]_DOUTB1 , \RAM4K9_QXI[0]_DOUTB2 , 
        \RAM4K9_QXI[0]_DOUTB3 , \RAM4K9_QXI[0]_DOUTB4 , 
        \RAM4K9_QXI[0]_DOUTB5 , \RAM4K9_QXI[0]_DOUTB6 , 
        \RAM4K9_QXI[0]_DOUTB7 , \RAM4K9_QXI[0]_DOUTB8 , XNOR3_38_Y, 
        XNOR2_1_Y, \WBINNXTSHIFT[0] , XOR2_10_Y, DFN1C0_18_Q, 
        XNOR3_24_Y, XNOR3_18_Y, XNOR3_27_Y, AO1_24_Y, AND2_3_Y, 
        AND2_10_Y, \WGRYSYNC[0] , XNOR3_31_Y, DFN1C0_11_Q, DFN1C0_10_Q, 
        XOR2_30_Y, \RBINSYNCSHIFT[8] , XOR2_22_Y, \WBINSYNCSHIFT[7] , 
        XNOR3_25_Y, \RGRY[2] , AND2_19_Y, XOR2_23_Y, AND2_12_Y, 
        AO1_35_Y, DFN1C0_16_Q, XOR2_5_Y, XOR2_55_Y, XOR2_59_Y, 
        XNOR3_14_Y, XNOR3_33_Y, XNOR2_21_Y, \RAM4K9_QXI[7]_DOUTA0 , 
        \RAM4K9_QXI[7]_DOUTA1 , \RAM4K9_QXI[7]_DOUTA2 , 
        \RAM4K9_QXI[7]_DOUTA3 , \RAM4K9_QXI[7]_DOUTA4 , 
        \RAM4K9_QXI[7]_DOUTA5 , \RAM4K9_QXI[7]_DOUTA6 , 
        \RAM4K9_QXI[7]_DOUTA7 , \RAM4K9_QXI[7]_DOUTA8 , \QXI[7] , 
        \RAM4K9_QXI[7]_DOUTB1 , \RAM4K9_QXI[7]_DOUTB2 , 
        \RAM4K9_QXI[7]_DOUTB3 , \RAM4K9_QXI[7]_DOUTB4 , 
        \RAM4K9_QXI[7]_DOUTB5 , \RAM4K9_QXI[7]_DOUTB6 , 
        \RAM4K9_QXI[7]_DOUTB7 , \RAM4K9_QXI[7]_DOUTB8 , XOR2_75_Y, 
        XOR2_31_Y, XNOR2_11_Y, XOR3_4_Y, AND3_8_Y, AND3_6_Y, AND2_32_Y, 
        AND2_14_Y, XNOR2_6_Y, \RBINSYNCSHIFT[10] , XNOR3_46_Y, 
        \WGRY[11] , AND2_35_Y, \QXI[6] , XOR2_8_Y, \WGRY[3] , 
        DFN1C0_14_Q, \RGRY[1] , XOR2_21_Y, XOR2_72_Y, \RGRY[11] , 
        AO1_34_Y, DFN1C0_12_Q, XNOR3_42_Y, XNOR2_0_Y, AND2_65_Y, 
        XNOR3_8_Y, XOR2_1_Y, XNOR2_19_Y, XOR2_61_Y, DFN1C0_9_Q, 
        AND3_0_Y, XNOR2_9_Y, \RAM4K9_QXI[1]_DOUTA0 , 
        \RAM4K9_QXI[1]_DOUTA1 , \RAM4K9_QXI[1]_DOUTA2 , 
        \RAM4K9_QXI[1]_DOUTA3 , \RAM4K9_QXI[1]_DOUTA4 , 
        \RAM4K9_QXI[1]_DOUTA5 , \RAM4K9_QXI[1]_DOUTA6 , 
        \RAM4K9_QXI[1]_DOUTA7 , \RAM4K9_QXI[1]_DOUTA8 , \QXI[1] , 
        \RAM4K9_QXI[1]_DOUTB1 , \RAM4K9_QXI[1]_DOUTB2 , 
        \RAM4K9_QXI[1]_DOUTB3 , \RAM4K9_QXI[1]_DOUTB4 , 
        \RAM4K9_QXI[1]_DOUTB5 , \RAM4K9_QXI[1]_DOUTB6 , 
        \RAM4K9_QXI[1]_DOUTB7 , \RAM4K9_QXI[1]_DOUTB8 , XNOR3_50_Y, 
        DFN1C0_4_Q, DFN1C0_17_Q, XNOR3_20_Y, \WBINSYNCSHIFT[2] , 
        \RAM4K9_QXI[2]_DOUTA0 , \RAM4K9_QXI[2]_DOUTA1 , 
        \RAM4K9_QXI[2]_DOUTA2 , \RAM4K9_QXI[2]_DOUTA3 , 
        \RAM4K9_QXI[2]_DOUTA4 , \RAM4K9_QXI[2]_DOUTA5 , 
        \RAM4K9_QXI[2]_DOUTA6 , \RAM4K9_QXI[2]_DOUTA7 , 
        \RAM4K9_QXI[2]_DOUTA8 , \RAM4K9_QXI[2]_DOUTB1 , 
        \RAM4K9_QXI[2]_DOUTB2 , \RAM4K9_QXI[2]_DOUTB3 , 
        \RAM4K9_QXI[2]_DOUTB4 , \RAM4K9_QXI[2]_DOUTB5 , 
        \RAM4K9_QXI[2]_DOUTB6 , \RAM4K9_QXI[2]_DOUTB7 , 
        \RAM4K9_QXI[2]_DOUTB8 , \WGRY[6] , AO1_7_Y, 
        \RAM4K9_QXI[6]_DOUTA0 , \RAM4K9_QXI[6]_DOUTA1 , 
        \RAM4K9_QXI[6]_DOUTA2 , \RAM4K9_QXI[6]_DOUTA3 , 
        \RAM4K9_QXI[6]_DOUTA4 , \RAM4K9_QXI[6]_DOUTA5 , 
        \RAM4K9_QXI[6]_DOUTA6 , \RAM4K9_QXI[6]_DOUTA7 , 
        \RAM4K9_QXI[6]_DOUTA8 , \RAM4K9_QXI[6]_DOUTB1 , 
        \RAM4K9_QXI[6]_DOUTB2 , \RAM4K9_QXI[6]_DOUTB3 , 
        \RAM4K9_QXI[6]_DOUTB4 , \RAM4K9_QXI[6]_DOUTB5 , 
        \RAM4K9_QXI[6]_DOUTB6 , \RAM4K9_QXI[6]_DOUTB7 , 
        \RAM4K9_QXI[6]_DOUTB8 ;
    
    XNOR3 XNOR3_14 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_14_Y));
    XNOR3 XNOR3_5 (.A(\RGRYSYNC[0] ), .B(XNOR3_6_Y), .C(XNOR3_23_Y), 
        .Y(XNOR3_5_Y));
    XNOR3 XNOR3_45 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XNOR3_45_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[4]  (.D(DFN1C0_4_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[4] ));
    AND2 AND2_2 (.A(\MEM_WADDR[10] ), .B(input_buffer_GND), .Y(
        AND2_2_Y));
    XOR3 \XOR3_WBINSYNCSHIFT[10]  (.A(\WGRYSYNC[12] ), .B(
        \WGRYSYNC[11] ), .C(\WGRYSYNC[10] ), .Y(\WBINSYNCSHIFT[10] ));
    AND3 AND3_6 (.A(XNOR2_14_Y), .B(XNOR2_24_Y), .C(XNOR2_10_Y), .Y(
        AND3_6_Y));
    XNOR2 XNOR2_13 (.A(\RBINNXTSHIFT[2] ), .B(\WBINSYNCSHIFT[2] ), .Y(
        XNOR2_13_Y));
    AO1 AO1_11 (.A(XOR2_10_Y), .B(AO1_6_Y), .C(AND2_4_Y), .Y(AO1_11_Y));
    XOR2 \XOR2_WBINNXTSHIFT[2]  (.A(XOR2_11_Y), .B(AO1_1_Y), .Y(
        \WBINNXTSHIFT[2] ));
    XNOR3 XNOR3_34 (.A(\WGRYSYNC[3] ), .B(\WGRYSYNC[2] ), .C(
        \WGRYSYNC[1] ), .Y(XNOR3_34_Y));
    XNOR3 XNOR3_25 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_25_Y));
    XOR3 \XOR3_RBINSYNCSHIFT[10]  (.A(\RGRYSYNC[12] ), .B(
        \RGRYSYNC[11] ), .C(\RGRYSYNC[10] ), .Y(\RBINSYNCSHIFT[10] ));
    XNOR2 XNOR2_9 (.A(\RBINNXTSHIFT[9] ), .B(\WBINSYNCSHIFT[9] ), .Y(
        XNOR2_9_Y));
    DFN1C0 \DFN1C0_RGRY[9]  (.D(XOR2_32_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[9] ));
    DFN1C0 DFN1C0_FULL (.D(FULLINT), .CLK(WCLOCKP), .CLR(WRITE_RESET_P)
        , .Q(FULL));
    DFN1C0 DFN1C0_17 (.D(\WGRY[12] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_17_Q));
    XOR2 XOR2_19 (.A(\MEM_WADDR[8] ), .B(input_buffer_GND), .Y(
        XOR2_19_Y));
    RAM4K9 \RAM4K9_QXI[6]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[6]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[6]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[6]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[6]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[6]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[6]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[6]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[6]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[6]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[6]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[6]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[6]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[6]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[6]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[6]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[6]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[6]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[6]_DOUTB1 ), 
        .DOUTB0(\QXI[6] ));
    AND2 AND2_44 (.A(XOR2_0_Y), .B(XOR2_47_Y), .Y(AND2_44_Y));
    XOR2 XOR2_23 (.A(\MEM_RADDR[5] ), .B(input_buffer_GND), .Y(
        XOR2_23_Y));
    XOR2 XOR2_1 (.A(\MEM_WADDR[8] ), .B(input_buffer_GND), .Y(XOR2_1_Y)
        );
    DFN1E1C0 \DFN1E1C0_Q[1]  (.D(\QXI[1] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[1]));
    XNOR3 XNOR3_13 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_13_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[3]  (.D(DFN1C0_18_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[3] ));
    DFN1E1C0 \DFN1E1C0_Q[4]  (.D(\QXI[4] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[4]));
    DFN1E1C0 \DFN1E1C0_Q[7]  (.D(\QXI[7] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[7]));
    XOR2 XOR2_47 (.A(\MEM_WADDR[7] ), .B(input_buffer_GND), .Y(
        XOR2_47_Y));
    XOR2 XOR2_38 (.A(\MEM_WADDR[5] ), .B(input_buffer_GND), .Y(
        XOR2_38_Y));
    XOR2 \XOR2_RBINNXTSHIFT[0]  (.A(\MEM_RADDR[0] ), .B(MEMORYRE), .Y(
        \RBINNXTSHIFT[0] ));
    BUFF BUFF_READDOMAIN_WMSB (.A(\WGRYSYNC[12] ), .Y(READDOMAIN_WMSB));
    AO1 AO1_7 (.A(XOR2_14_Y), .B(AO1_18_Y), .C(AND2_24_Y), .Y(AO1_7_Y));
    DFN1C0 DFN1C0_9 (.D(\RGRY[11] ), .CLK(WCLOCKP), .CLR(WRITE_RESET_P)
        , .Q(DFN1C0_9_Q));
    DFN1C0 \DFN1C0_WGRY[6]  (.D(XOR2_37_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[6] ));
    AND2 AND2_15 (.A(\MEM_RADDR[2] ), .B(input_buffer_GND), .Y(
        AND2_15_Y));
    XNOR3 XNOR3_33 (.A(\WGRYSYNC[6] ), .B(\WGRYSYNC[5] ), .C(
        XNOR3_21_Y), .Y(XNOR3_33_Y));
    DFN1C0 DFN1C0_WRITE_RESET_P (.D(DFN1C0_15_Q), .CLK(WCLOCKP), .CLR(
        reset_c), .Q(WRITE_RESET_P));
    AO1 AO1_25 (.A(AND2_54_Y), .B(AO1_1_Y), .C(AO1_20_Y), .Y(AO1_25_Y));
    DFN1C0 DFN1C0_26 (.D(\WGRY[3] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_26_Q));
    XOR2 XOR2_45 (.A(\WBINNXTSHIFT[8] ), .B(\WBINNXTSHIFT[9] ), .Y(
        XOR2_45_Y));
    XOR2 \XOR2_RBINNXTSHIFT[9]  (.A(XOR2_8_Y), .B(AO1_7_Y), .Y(
        \RBINNXTSHIFT[9] ));
    DFN1C0 \DFN1C0_RGRYSYNC[7]  (.D(DFN1C0_16_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[7] ));
    DFN1C0 DFN1C0_11 (.D(\WGRY[2] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_11_Q));
    DFN1C0 DFN1C0_0 (.D(\RGRY[1] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_0_Q));
    DFN1C0 \DFN1C0_MEM_WADDR[0]  (.D(\WBINNXTSHIFT[0] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[0] ));
    BUFF \BUFF_RBINSYNCSHIFT[12]  (.A(\RGRYSYNC[12] ), .Y(
        \RBINSYNCSHIFT[12] ));
    AND2 AND2_1 (.A(\MEM_RADDR[6] ), .B(input_buffer_GND), .Y(AND2_1_Y)
        );
    XNOR2 XNOR2_21 (.A(\RBINSYNCSHIFT[2] ), .B(\WBINNXTSHIFT[2] ), .Y(
        XNOR2_21_Y));
    DFN1C0 \DFN1C0_MEM_WADDR[3]  (.D(\WBINNXTSHIFT[3] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[3] ));
    DFN1C0 \DFN1C0_MEM_RADDR[1]  (.D(\RBINNXTSHIFT[1] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[1] ));
    AO1 AO1_8 (.A(XOR2_23_Y), .B(AND2_4_Y), .C(AND2_14_Y), .Y(AO1_8_Y));
    AND2 AND2_49 (.A(\MEM_WADDR[4] ), .B(input_buffer_GND), .Y(
        AND2_49_Y));
    DFN1C0 DFN1C0_20 (.D(\WGRY[6] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_20_Q));
    AND2 AND2_10 (.A(\MEM_WADDR[5] ), .B(input_buffer_GND), .Y(
        AND2_10_Y));
    XOR2 XOR2_20 (.A(\MEM_RADDR[5] ), .B(input_buffer_GND), .Y(
        XOR2_20_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[6]  (.D(DFN1C0_21_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[6] ));
    XOR2 XOR2_63 (.A(\MEM_RADDR[7] ), .B(input_buffer_GND), .Y(
        XOR2_63_Y));
    RAM4K9 \RAM4K9_QXI[2]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[2]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[2]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[2]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[2]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[2]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[2]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[2]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[2]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[2]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[2]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[2]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[2]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[2]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[2]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[2]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[2]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[2]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[2]_DOUTB1 ), 
        .DOUTB0(\QXI[2] ));
    DFN1C0 \DFN1C0_WGRY[5]  (.D(XOR2_28_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[5] ));
    AND2 AND2_12 (.A(XOR2_60_Y), .B(XOR2_22_Y), .Y(AND2_12_Y));
    XOR2 XOR2_52 (.A(\WBINNXTSHIFT[12] ), .B(input_buffer_GND), .Y(
        XOR2_52_Y));
    XNOR3 XNOR3_40 (.A(XNOR3_17_Y), .B(XNOR3_31_Y), .C(XNOR3_38_Y), .Y(
        XNOR3_40_Y));
    XOR2 \XOR2_WBINNXTSHIFT[0]  (.A(\MEM_WADDR[0] ), .B(MEMORYWE), .Y(
        \WBINNXTSHIFT[0] ));
    DFN1C0 \DFN1C0_MEM_WADDR[4]  (.D(\WBINNXTSHIFT[4] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[4] ));
    AO1 AO1_15 (.A(XOR2_7_Y), .B(AND2_26_Y), .C(AND2_32_Y), .Y(
        AO1_15_Y));
    AND2 AND2_61 (.A(\MEM_RADDR[0] ), .B(MEMORYRE), .Y(AND2_61_Y));
    XNOR3 \XNOR3_WBINSYNCSHIFT[2]  (.A(XNOR3_29_Y), .B(XNOR3_16_Y), .C(
        XNOR3_20_Y), .Y(\WBINSYNCSHIFT[2] ));
    DFN1C0 \DFN1C0_WGRY[7]  (.D(XOR2_44_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[7] ));
    DFN1C0 DFN1C0_READ_RESET_P (.D(DFN1C0_3_Q), .CLK(RCLOCKP), .CLR(
        reset_c), .Q(READ_RESET_P));
    DFN1C0 \DFN1C0_MEM_WADDR[12]  (.D(\WBINNXTSHIFT[12] ), .CLK(
        WCLOCKP), .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[12] ));
    AND2 AND2_EMPTYINT (.A(AND3_0_Y), .B(XNOR2_22_Y), .Y(EMPTYINT));
    XNOR2 \XNOR2_RBINSYNCSHIFT[5]  (.A(XNOR3_42_Y), .B(XNOR3_10_Y), .Y(
        \RBINSYNCSHIFT[5] ));
    XOR2 XOR2_24 (.A(\MEM_WADDR[7] ), .B(input_buffer_GND), .Y(
        XOR2_24_Y));
    XNOR3 XNOR3_20 (.A(\WGRYSYNC[3] ), .B(\WGRYSYNC[2] ), .C(XOR3_4_Y), 
        .Y(XNOR3_20_Y));
    XOR2 XOR2_21 (.A(\RBINNXTSHIFT[1] ), .B(\RBINNXTSHIFT[2] ), .Y(
        XOR2_21_Y));
    XOR2 \XOR2_WBINNXTSHIFT[9]  (.A(XOR2_61_Y), .B(AO1_27_Y), .Y(
        \WBINNXTSHIFT[9] ));
    AO1 AO1_35 (.A(XOR2_22_Y), .B(AND2_2_Y), .C(AND2_5_Y), .Y(AO1_35_Y)
        );
    XNOR2 \XNOR2_RBINSYNCSHIFT[9]  (.A(\RGRYSYNC[9] ), .B(XNOR3_46_Y), 
        .Y(\RBINSYNCSHIFT[9] ));
    DFN1C0 \DFN1C0_WGRYSYNC[11]  (.D(DFN1C0_12_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(\WGRYSYNC[11] ));
    DFN1C0 \DFN1C0_WGRYSYNC[12]  (.D(DFN1C0_17_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(\WGRYSYNC[12] ));
    AND2 AND2_46 (.A(\MEM_RADDR[3] ), .B(input_buffer_GND), .Y(
        AND2_46_Y));
    XOR2 \XOR2_RBINNXTSHIFT[8]  (.A(XOR2_73_Y), .B(AO1_18_Y), .Y(
        \RBINNXTSHIFT[8] ));
    XNOR3 XNOR3_9 (.A(\RGRYSYNC[6] ), .B(\RGRYSYNC[5] ), .C(
        \RGRYSYNC[4] ), .Y(XNOR3_9_Y));
    XNOR3 XNOR3_8 (.A(\WGRYSYNC[6] ), .B(\WGRYSYNC[5] ), .C(
        \WGRYSYNC[4] ), .Y(XNOR3_8_Y));
    XNOR2 \XNOR2_RBINSYNCSHIFT[1]  (.A(XNOR3_2_Y), .B(XNOR3_36_Y), .Y(
        \RBINSYNCSHIFT[1] ));
    XOR2 XOR2_16 (.A(\MEM_WADDR[2] ), .B(input_buffer_GND), .Y(
        XOR2_16_Y));
    XNOR3 XNOR3_50 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XNOR3_50_Y));
    DFN1C0 DFN1C0_4 (.D(\RGRY[4] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_4_Q));
    XOR2 XOR2_60 (.A(\MEM_WADDR[10] ), .B(input_buffer_GND), .Y(
        XOR2_60_Y));
    DFN1C0 DFN1C0_14 (.D(\RGRY[5] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_14_Q));
    AND2 AND2_65 (.A(XNOR2_6_Y), .B(XNOR2_11_Y), .Y(AND2_65_Y));
    AO1 AO1_24 (.A(XOR2_9_Y), .B(AO1_14_Y), .C(AND2_15_Y), .Y(AO1_24_Y)
        );
    AND2 AND2_43 (.A(AND2_8_Y), .B(AND2_12_Y), .Y(AND2_43_Y));
    XNOR3 \XNOR3_WBINSYNCSHIFT[8]  (.A(\WGRYSYNC[9] ), .B(
        \WGRYSYNC[8] ), .C(XNOR3_50_Y), .Y(\WBINSYNCSHIFT[8] ));
    AND3 AND3_3 (.A(XNOR2_19_Y), .B(XNOR2_0_Y), .C(XNOR2_5_Y), .Y(
        AND3_3_Y));
    INV MEMWEBUBBLE (.A(MEMORYWE), .Y(MEMWENEG));
    AND2 AND2_6 (.A(\MEM_WADDR[3] ), .B(input_buffer_GND), .Y(AND2_6_Y)
        );
    XOR2 XOR2_64 (.A(\RBINNXTSHIFT[4] ), .B(\RBINNXTSHIFT[5] ), .Y(
        XOR2_64_Y));
    RAM4K9 \RAM4K9_QXI[1]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[1]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[1]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[1]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[1]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[1]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[1]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[1]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[1]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[1]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[1]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[1]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[1]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[1]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[1]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[1]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[1]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[1]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[1]_DOUTB1 ), 
        .DOUTB0(\QXI[1] ));
    AND3 AND3_0 (.A(XNOR2_9_Y), .B(AND3_8_Y), .C(AND2_17_Y), .Y(
        AND3_0_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[11]  (.D(DFN1C0_9_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[11] ));
    DFN1C0 \DFN1C0_MEM_RADDR[2]  (.D(\RBINNXTSHIFT[2] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[2] ));
    XOR2 XOR2_61 (.A(\MEM_WADDR[9] ), .B(input_buffer_GND), .Y(
        XOR2_61_Y));
    DFN1C0 \DFN1C0_RGRY[2]  (.D(XOR2_42_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[2] ));
    XOR2 XOR2_33 (.A(\RBINNXTSHIFT[12] ), .B(input_buffer_GND), .Y(
        XOR2_33_Y));
    XNOR2 XNOR2_2 (.A(\RBINSYNCSHIFT[8] ), .B(\WBINNXTSHIFT[8] ), .Y(
        XNOR2_2_Y));
    XOR2 \XOR2_WBINNXTSHIFT[8]  (.A(XOR2_1_Y), .B(AO1_5_Y), .Y(
        \WBINNXTSHIFT[8] ));
    XOR2 XOR2_49 (.A(\MEM_WADDR[11] ), .B(input_buffer_GND), .Y(
        XOR2_49_Y));
    XNOR2 XNOR2_19 (.A(\RBINSYNCSHIFT[3] ), .B(\WBINNXTSHIFT[3] ), .Y(
        XNOR2_19_Y));
    AO1 AO1_14 (.A(XOR2_6_Y), .B(AND2_61_Y), .C(AND2_35_Y), .Y(
        AO1_14_Y));
    XOR2 XOR2_4 (.A(\MEM_RADDR[7] ), .B(input_buffer_GND), .Y(XOR2_4_Y)
        );
    XNOR2 \XNOR2_WBINSYNCSHIFT[3]  (.A(XNOR3_8_Y), .B(XNOR3_18_Y), .Y(
        \WBINSYNCSHIFT[3] ));
    AND3 AND3_1 (.A(XNOR2_3_Y), .B(AND3_2_Y), .C(AND2_65_Y), .Y(
        AND3_1_Y));
    XOR2 XOR2_55 (.A(\RBINNXTSHIFT[8] ), .B(\RBINNXTSHIFT[9] ), .Y(
        XOR2_55_Y));
    AND2 AND2_24 (.A(\MEM_RADDR[8] ), .B(input_buffer_GND), .Y(
        AND2_24_Y));
    XOR2 XOR2_72 (.A(\MEM_RADDR[4] ), .B(input_buffer_GND), .Y(
        XOR2_72_Y));
    XNOR2 XNOR2_0 (.A(\RBINSYNCSHIFT[4] ), .B(\WBINNXTSHIFT[4] ), .Y(
        XNOR2_0_Y));
    AND2 AND2_31 (.A(XOR2_53_Y), .B(XOR2_4_Y), .Y(AND2_31_Y));
    GND GND_i (.Y(input_buffer_GND));
    DFN1C0 \DFN1C0_MEM_WADDR[10]  (.D(\WBINNXTSHIFT[10] ), .CLK(
        WCLOCKP), .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[10] ));
    DFN1C0 DFN1C0_15 (.D(input_buffer_VCC), .CLK(WCLOCKP), .CLR(
        reset_c), .Q(DFN1C0_15_Q));
    AO1 AO1_34 (.A(AND2_56_Y), .B(AO1_18_Y), .C(AO1_0_Y), .Y(AO1_34_Y));
    XOR2 \XOR2_RBINNXTSHIFT[12]  (.A(XOR2_74_Y), .B(AO1_34_Y), .Y(
        \RBINNXTSHIFT[12] ));
    XNOR3 XNOR3_42 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_42_Y));
    DFN1C0 DFN1C0_12 (.D(\WGRY[11] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_12_Q));
    XOR2 XOR2_18 (.A(\RBINNXTSHIFT[7] ), .B(\RBINNXTSHIFT[8] ), .Y(
        XOR2_18_Y));
    XNOR3 XNOR3_19 (.A(\RGRYSYNC[6] ), .B(\RGRYSYNC[5] ), .C(
        \RGRYSYNC[4] ), .Y(XNOR3_19_Y));
    DFN1C0 \DFN1C0_RGRY[11]  (.D(XOR2_5_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[11] ));
    XOR2 \XOR2_RBINNXTSHIFT[4]  (.A(XOR2_72_Y), .B(AO1_6_Y), .Y(
        \RBINNXTSHIFT[4] ));
    DFN1C0 \DFN1C0_WGRYSYNC[9]  (.D(DFN1C0_22_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[9] ));
    XNOR3 XNOR3_22 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XNOR3_22_Y));
    DFN1C0 \DFN1C0_RGRY[1]  (.D(XOR2_21_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[1] ));
    DFN1C0 \DFN1C0_MEM_WADDR[8]  (.D(\WBINNXTSHIFT[8] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[8] ));
    DFN1C0 \DFN1C0_RGRYSYNC[5]  (.D(DFN1C0_14_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[5] ));
    XOR2 XOR2_8 (.A(\MEM_RADDR[9] ), .B(input_buffer_GND), .Y(XOR2_8_Y)
        );
    DFN1E1C0 \DFN1E1C0_Q[6]  (.D(\QXI[6] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[6]));
    DFN1C0 \DFN1C0_WGRY[3]  (.D(XOR2_54_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[3] ));
    XOR2 \XOR2_RBINNXTSHIFT[6]  (.A(XOR2_68_Y), .B(AO1_2_Y), .Y(
        \RBINNXTSHIFT[6] ));
    XOR2 XOR2_30 (.A(\MEM_WADDR[1] ), .B(input_buffer_GND), .Y(
        XOR2_30_Y));
    XNOR3 XNOR3_39 (.A(\RGRYSYNC[6] ), .B(\RGRYSYNC[5] ), .C(
        \RGRYSYNC[4] ), .Y(XNOR3_39_Y));
    INV MEMREBUBBLE (.A(MEMORYRE), .Y(MEMRENEG));
    AND2 AND2_35 (.A(\MEM_RADDR[1] ), .B(input_buffer_GND), .Y(
        AND2_35_Y));
    DFN1C0 \DFN1C0_WGRY[11]  (.D(XOR2_2_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P), .Q(\WGRY[11] ));
    DFN1C0 \DFN1C0_MEM_WADDR[7]  (.D(\WBINNXTSHIFT[7] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[7] ));
    DFN1C0 \DFN1C0_MEM_RADDR[4]  (.D(\RBINNXTSHIFT[4] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[4] ));
    XNOR3 XNOR3_7 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_7_Y));
    XNOR3 XNOR3_46 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XNOR3_46_Y));
    XOR2 \XOR2_WBINNXTSHIFT[12]  (.A(XOR2_12_Y), .B(AO1_13_Y), .Y(
        \WBINNXTSHIFT[12] ));
    XOR2 XOR2_34 (.A(\MEM_RADDR[2] ), .B(input_buffer_GND), .Y(
        XOR2_34_Y));
    XOR2 XOR2_31 (.A(\WBINNXTSHIFT[0] ), .B(\WBINNXTSHIFT[1] ), .Y(
        XOR2_31_Y));
    AND2 AND2_3 (.A(AND2_19_Y), .B(AND2_31_Y), .Y(AND2_3_Y));
    DFN1C0 \DFN1C0_MEM_WADDR[11]  (.D(\WBINNXTSHIFT[11] ), .CLK(
        WCLOCKP), .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[11] ));
    AND2 AND2_30 (.A(\MEM_RADDR[7] ), .B(input_buffer_GND), .Y(
        AND2_30_Y));
    XOR2 \XOR2_WBINNXTSHIFT[4]  (.A(XOR2_75_Y), .B(AO1_25_Y), .Y(
        \WBINNXTSHIFT[4] ));
    XNOR3 XNOR3_26 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_26_Y));
    XNOR2 XNOR2_6 (.A(\RBINSYNCSHIFT[10] ), .B(\WBINNXTSHIFT[10] ), .Y(
        XNOR2_6_Y));
    AND2 AND2_14 (.A(\MEM_RADDR[5] ), .B(input_buffer_GND), .Y(
        AND2_14_Y));
    AND2 AND2_32 (.A(\MEM_RADDR[11] ), .B(input_buffer_GND), .Y(
        AND2_32_Y));
    XOR2 \XOR2_WBINNXTSHIFT[6]  (.A(XOR2_59_Y), .B(AO1_9_Y), .Y(
        \WBINNXTSHIFT[6] ));
    DFN1C0 \DFN1C0_MEM_RADDR[5]  (.D(\RBINNXTSHIFT[5] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[5] ));
    AND3 AND3_8 (.A(AND3_9_Y), .B(AND3_7_Y), .C(AND3_6_Y), .Y(AND3_8_Y)
        );
    XOR3 XOR3_4 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XOR3_4_Y));
    XOR2 XOR2_46 (.A(\WBINNXTSHIFT[4] ), .B(\WBINNXTSHIFT[5] ), .Y(
        XOR2_46_Y));
    XNOR2 XNOR2_11 (.A(\RBINSYNCSHIFT[11] ), .B(\WBINNXTSHIFT[11] ), 
        .Y(XNOR2_11_Y));
    DFN1C0 DFN1C0_WRITE_RESET_P_1 (.D(DFN1C0_15_Q), .CLK(WCLOCKP), 
        .CLR(reset_c), .Q(WRITE_RESET_P_1));
    AO1 AO1_2 (.A(AND2_19_Y), .B(AO1_6_Y), .C(AO1_8_Y), .Y(AO1_2_Y));
    DFN1C0 \DFN1C0_WGRY[0]  (.D(XOR2_31_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[0] ));
    DFN1C0 \DFN1C0_MEM_RADDR[8]  (.D(\RBINNXTSHIFT[8] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P), .Q(\MEM_RADDR[8] ));
    XOR2 XOR2_75 (.A(\MEM_WADDR[4] ), .B(input_buffer_GND), .Y(
        XOR2_75_Y));
    AND2 AND2_26 (.A(\MEM_RADDR[10] ), .B(input_buffer_GND), .Y(
        AND2_26_Y));
    XOR2 XOR2_9 (.A(\MEM_RADDR[2] ), .B(input_buffer_GND), .Y(XOR2_9_Y)
        );
    RAM4K9 \RAM4K9_QXI[7]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[7]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[7]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[7]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[7]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[7]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[7]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[7]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[7]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[7]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[7]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[7]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[7]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[7]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[7]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[7]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[7]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[7]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[7]_DOUTB1 ), 
        .DOUTB0(\QXI[7] ));
    VCC VCC_i (.Y(input_buffer_VCC));
    AND3 AND3_5 (.A(XNOR2_1_Y), .B(XNOR2_17_Y), .C(XNOR2_21_Y), .Y(
        AND3_5_Y));
    XNOR2 \XNOR2_WBINSYNCSHIFT[5]  (.A(XNOR3_14_Y), .B(XNOR3_33_Y), .Y(
        \WBINSYNCSHIFT[5] ));
    XOR2 XOR2_59 (.A(\MEM_WADDR[6] ), .B(input_buffer_GND), .Y(
        XOR2_59_Y));
    XNOR2 XNOR2_4 (.A(\RBINNXTSHIFT[11] ), .B(\WBINSYNCSHIFT[11] ), .Y(
        XNOR2_4_Y));
    CLKINT WCLKBUBBLE_RNI39CD (.A(WCLKBUBBLE_net_1), .Y(WCLOCKP));
    DFN1C0 \DFN1C0_WGRYSYNC[1]  (.D(DFN1C0_10_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[1] ));
    DFN1C0 \DFN1C0_MEM_WADDR[9]  (.D(\WBINNXTSHIFT[9] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[9] ));
    XOR2 XOR2_5 (.A(\RBINNXTSHIFT[11] ), .B(\RBINNXTSHIFT[12] ), .Y(
        XOR2_5_Y));
    DFN1C0 \DFN1C0_RGRY[8]  (.D(XOR2_55_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[8] ));
    XNOR3 XNOR3_47 (.A(\RGRYSYNC[3] ), .B(XOR3_2_Y), .C(XNOR3_1_Y), .Y(
        XNOR3_47_Y));
    XNOR2 XNOR2_20 (.A(\RBINNXTSHIFT[7] ), .B(\WBINSYNCSHIFT[7] ), .Y(
        XNOR2_20_Y));
    DFN1C0 DFN1C0_16 (.D(\RGRY[7] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_16_Q));
    XNOR3 XNOR3_11 (.A(\WGRYSYNC[0] ), .B(XNOR3_35_Y), .C(XNOR3_48_Y), 
        .Y(XNOR3_11_Y));
    AO1 AO1_28 (.A(AND2_12_Y), .B(AO1_17_Y), .C(AO1_35_Y), .Y(AO1_28_Y)
        );
    AND2 AND2_19 (.A(XOR2_10_Y), .B(XOR2_23_Y), .Y(AND2_19_Y));
    DFN1C0 DFN1C0_6 (.D(\RGRY[2] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_6_Q));
    XNOR2 \XNOR2_WBINSYNCSHIFT[7]  (.A(XOR3_6_Y), .B(XNOR3_25_Y), .Y(
        \WBINSYNCSHIFT[7] ));
    DFN1E1C0 \DFN1E1C0_Q[0]  (.D(\QXI[0] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[0]));
    DFN1C0 \DFN1C0_MEM_RADDR[6]  (.D(\RBINNXTSHIFT[6] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[6] ));
    XOR2 XOR2_22 (.A(\MEM_WADDR[11] ), .B(input_buffer_GND), .Y(
        XOR2_22_Y));
    XNOR3 XNOR3_27 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_27_Y));
    XNOR3 \XNOR3_RBINSYNCSHIFT[8]  (.A(\RGRYSYNC[9] ), .B(
        \RGRYSYNC[8] ), .C(XNOR3_24_Y), .Y(\RBINSYNCSHIFT[8] ));
    INV RCLKBUBBLE (.A(clock_control_0_clock_out), .Y(RCLKBUBBLE_net_1)
        );
    AO1 AO1_1 (.A(XOR2_30_Y), .B(AND2_27_Y), .C(AND2_45_Y), .Y(AO1_1_Y)
        );
    DFN1C0 DFN1C0_10 (.D(\WGRY[1] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_10_Q));
    XOR2 XOR2_13 (.A(\RBINNXTSHIFT[0] ), .B(\RBINNXTSHIFT[1] ), .Y(
        XOR2_13_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[2]  (.D(DFN1C0_11_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[2] ));
    XNOR3 XNOR3_31 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_31_Y));
    XNOR2 XNOR2_18 (.A(\RBINNXTSHIFT[6] ), .B(\WBINSYNCSHIFT[6] ), .Y(
        XNOR2_18_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[0]  (.D(DFN1C0_13_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[0] ));
    AO1 AO1_3 (.A(XOR2_58_Y), .B(AND2_49_Y), .C(AND2_10_Y), .Y(AO1_3_Y)
        );
    XNOR3 XNOR3_44 (.A(\RGRYSYNC[6] ), .B(\RGRYSYNC[5] ), .C(
        \RGRYSYNC[4] ), .Y(XNOR3_44_Y));
    DFN1C0 DFN1C0_READ_RESET_P_1 (.D(DFN1C0_3_Q), .CLK(RCLOCKP), .CLR(
        reset_c), .Q(READ_RESET_P_1));
    AO1 AO1_18 (.A(AND2_3_Y), .B(AO1_6_Y), .C(AO1_33_Y), .Y(AO1_18_Y));
    XOR2 XOR2_48 (.A(\MEM_WADDR[1] ), .B(input_buffer_GND), .Y(
        XOR2_48_Y));
    XOR2 \XOR2_RBINNXTSHIFT[3]  (.A(XOR2_51_Y), .B(AO1_24_Y), .Y(
        \RBINNXTSHIFT[3] ));
    DFN1C0 DFN1C0_3 (.D(input_buffer_VCC), .CLK(RCLOCKP), .CLR(reset_c)
        , .Q(DFN1C0_3_Q));
    XNOR3 XNOR3_18 (.A(\WGRYSYNC[3] ), .B(XOR3_0_Y), .C(XNOR3_27_Y), 
        .Y(XNOR3_18_Y));
    DFN1C0 \DFN1C0_MEM_RADDR[7]  (.D(\RBINNXTSHIFT[7] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P), .Q(\MEM_RADDR[7] ));
    XNOR3 XNOR3_24 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XNOR3_24_Y));
    DFN1C0 \DFN1C0_WGRY[9]  (.D(XOR2_15_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[9] ));
    XOR2 XOR2_62 (.A(\MEM_WADDR[4] ), .B(input_buffer_GND), .Y(
        XOR2_62_Y));
    AND2 AND2_13 (.A(\MEM_WADDR[7] ), .B(input_buffer_GND), .Y(
        AND2_13_Y));
    DFN1C0 DFN1C0_18 (.D(\RGRY[3] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_18_Q));
    XOR2 XOR2_10 (.A(\MEM_RADDR[4] ), .B(input_buffer_GND), .Y(
        XOR2_10_Y));
    XNOR2 XNOR2_1 (.A(\RBINSYNCSHIFT[0] ), .B(\WBINNXTSHIFT[0] ), .Y(
        XNOR2_1_Y));
    XNOR3 XNOR3_38 (.A(\WGRYSYNC[6] ), .B(\WGRYSYNC[5] ), .C(
        \WGRYSYNC[4] ), .Y(XNOR3_38_Y));
    AND2 AND2_58 (.A(\MEM_WADDR[8] ), .B(input_buffer_GND), .Y(
        AND2_58_Y));
    XNOR3 XNOR3_6 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XNOR3_6_Y));
    RAM4K9 \RAM4K9_QXI[0]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[0]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[0]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[0]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[0]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[0]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[0]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[0]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[0]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[0]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[0]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[0]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[0]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[0]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[0]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[0]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[0]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[0]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[0]_DOUTB1 ), 
        .DOUTB0(\QXI[0] ));
    DFN1C0 \DFN1C0_RGRY[4]  (.D(XOR2_64_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[4] ));
    DFN1C0 DFN1C0_2 (.D(\WGRY[10] ), .CLK(RCLOCKP), .CLR(READ_RESET_P), 
        .Q(DFN1C0_2_Q));
    XNOR3 XNOR3_43 (.A(\RGRYSYNC[6] ), .B(\RGRYSYNC[5] ), .C(
        \RGRYSYNC[4] ), .Y(XNOR3_43_Y));
    DFN1C0 \DFN1C0_MEM_WADDR[2]  (.D(\WBINNXTSHIFT[2] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[2] ));
    XOR3 XOR3_3 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XOR3_3_Y));
    XOR2 XOR2_27 (.A(\MEM_WADDR[10] ), .B(input_buffer_GND), .Y(
        XOR2_27_Y));
    AND2 AND2_MEMORYRE (.A(NAND2_1_Y), .B(packet_encoder_0_fifo_re), 
        .Y(MEMORYRE));
    XOR2 \XOR2_WBINNXTSHIFT[3]  (.A(XOR2_69_Y), .B(AO1_26_Y), .Y(
        \WBINNXTSHIFT[3] ));
    XOR2 XOR2_7 (.A(\MEM_RADDR[11] ), .B(input_buffer_GND), .Y(
        XOR2_7_Y));
    AND2 AND2_5 (.A(\MEM_WADDR[11] ), .B(input_buffer_GND), .Y(
        AND2_5_Y));
    XOR2 XOR2_56 (.A(\RBINNXTSHIFT[6] ), .B(\RBINNXTSHIFT[7] ), .Y(
        XOR2_56_Y));
    XOR2 XOR2_14 (.A(\MEM_RADDR[8] ), .B(input_buffer_GND), .Y(
        XOR2_14_Y));
    RAM4K9 \RAM4K9_QXI[4]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[4]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[4]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[4]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[4]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[4]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[4]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[4]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[4]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[4]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[4]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[4]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[4]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[4]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[4]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[4]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[4]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[4]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[4]_DOUTB1 ), 
        .DOUTB0(\QXI[4] ));
    XNOR3 XNOR3_23 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_23_Y));
    XNOR3 XNOR3_1 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_1_Y));
    AND2 AND2_50 (.A(\MEM_WADDR[9] ), .B(input_buffer_GND), .Y(
        AND2_50_Y));
    XOR2 XOR2_11 (.A(\MEM_WADDR[2] ), .B(input_buffer_GND), .Y(
        XOR2_11_Y));
    XNOR2 XNOR2_3 (.A(\RBINSYNCSHIFT[9] ), .B(\WBINNXTSHIFT[9] ), .Y(
        XNOR2_3_Y));
    DFN1C0 DFN1C0_7 (.D(\RGRY[10] ), .CLK(WCLOCKP), .CLR(WRITE_RESET_P)
        , .Q(DFN1C0_7_Q));
    XNOR2 XNOR2_22 (.A(\RBINNXTSHIFT[12] ), .B(READDOMAIN_WMSB), .Y(
        XNOR2_22_Y));
    XOR3 XOR3_6 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XOR3_6_Y));
    AND2 AND2_52 (.A(\MEM_WADDR[6] ), .B(input_buffer_GND), .Y(
        AND2_52_Y));
    XNOR2 XNOR2_15 (.A(\RBINSYNCSHIFT[6] ), .B(\WBINNXTSHIFT[6] ), .Y(
        XNOR2_15_Y));
    XNOR3 XNOR3_3 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_3_Y));
    XNOR2 \XNOR2_RBINSYNCSHIFT[7]  (.A(XOR3_1_Y), .B(XNOR3_51_Y), .Y(
        \RBINSYNCSHIFT[7] ));
    DFN1C0 \DFN1C0_RGRYSYNC[10]  (.D(DFN1C0_7_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[10] ));
    DFN1C0 DFN1C0_WRITE_RESET_P_0 (.D(DFN1C0_15_Q), .CLK(WCLOCKP), 
        .CLR(reset_c), .Q(WRITE_RESET_P_0));
    DFN1C0 \DFN1C0_RGRYSYNC[9]  (.D(DFN1C0_1_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[9] ));
    AO1 AO1_6 (.A(AND2_53_Y), .B(AO1_14_Y), .C(AO1_30_Y), .Y(AO1_6_Y));
    XNOR3 XNOR3_15 (.A(\WGRYSYNC[6] ), .B(\WGRYSYNC[5] ), .C(
        \WGRYSYNC[4] ), .Y(XNOR3_15_Y));
    DFN1C0 \DFN1C0_MEM_RADDR[3]  (.D(\RBINNXTSHIFT[3] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[3] ));
    XOR2 XOR2_67 (.A(\RBINNXTSHIFT[10] ), .B(\RBINNXTSHIFT[11] ), .Y(
        XOR2_67_Y));
    DFN1C0 DFN1C0_23 (.D(\WGRY[8] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_23_Q));
    AND3 AND3_2 (.A(AND3_4_Y), .B(AND3_5_Y), .C(AND3_3_Y), .Y(AND3_2_Y)
        );
    AO1 AO1_12 (.A(AND2_8_Y), .B(AO1_5_Y), .C(AO1_17_Y), .Y(AO1_12_Y));
    XOR2 XOR2_32 (.A(\RBINNXTSHIFT[9] ), .B(\RBINNXTSHIFT[10] ), .Y(
        XOR2_32_Y));
    XNOR3 XNOR3_35 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XNOR3_35_Y));
    DFN1E1C0 \DFN1E1C0_Q[5]  (.D(\QXI[5] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[5]));
    AND2 AND2_9 (.A(\MEM_WADDR[2] ), .B(input_buffer_GND), .Y(AND2_9_Y)
        );
    XOR2 XOR2_65 (.A(\MEM_RADDR[9] ), .B(input_buffer_GND), .Y(
        XOR2_65_Y));
    XOR2 XOR2_58 (.A(\MEM_WADDR[5] ), .B(input_buffer_GND), .Y(
        XOR2_58_Y));
    XOR2 XOR2_43 (.A(\RBINNXTSHIFT[3] ), .B(\RBINNXTSHIFT[4] ), .Y(
        XOR2_43_Y));
    AO1 AO1_32 (.A(XOR2_65_Y), .B(AND2_24_Y), .C(AND2_33_Y), .Y(
        AO1_32_Y));
    XNOR2 \XNOR2_RBINSYNCSHIFT[3]  (.A(XNOR3_39_Y), .B(XNOR3_47_Y), .Y(
        \RBINSYNCSHIFT[3] ));
    INV WCLKBUBBLE (.A(pclk_c), .Y(WCLKBUBBLE_net_1));
    DFN1C0 \DFN1C0_RGRYSYNC[12]  (.D(DFN1C0_19_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[12] ));
    AO1 AO1_9 (.A(AND2_59_Y), .B(AO1_25_Y), .C(AO1_3_Y), .Y(AO1_9_Y));
    NAND2 NAND2_0 (.A(FULL), .B(input_buffer_GND), .Y(NAND2_0_Y));
    XNOR3 XNOR3_0 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_0_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[10]  (.D(DFN1C0_2_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(\WGRYSYNC[10] ));
    DFN1C0 \DFN1C0_RGRY[6]  (.D(XOR2_56_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[6] ));
    XOR2 XOR2_76 (.A(\MEM_RADDR[11] ), .B(input_buffer_GND), .Y(
        XOR2_76_Y));
    AND2 AND2_27 (.A(\MEM_WADDR[0] ), .B(MEMORYWE), .Y(AND2_27_Y));
    DFN1C0 DFN1C0_DVLDI (.D(AND2A_0_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(DVLDI));
    XNOR2 XNOR2_10 (.A(\RBINNXTSHIFT[5] ), .B(\WBINSYNCSHIFT[5] ), .Y(
        XNOR2_10_Y));
    AO1 AO1_20 (.A(XOR2_66_Y), .B(AND2_9_Y), .C(AND2_6_Y), .Y(AO1_20_Y)
        );
    AND2 AND2_MEMORYWE (.A(NAND2_0_Y), .B(camera_adapter_0_write_en), 
        .Y(MEMORYWE));
    CLKINT RCLKBUBBLE_RNIURM3 (.A(RCLKBUBBLE_net_1), .Y(RCLOCKP));
    DFN1C0 \DFN1C0_WGRY[2]  (.D(XOR2_17_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[2] ));
    AO1 AO1_0 (.A(AND2_41_Y), .B(AO1_32_Y), .C(AO1_15_Y), .Y(AO1_0_Y));
    XOR2 XOR2_29 (.A(\MEM_RADDR[10] ), .B(input_buffer_GND), .Y(
        XOR2_29_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[8]  (.D(DFN1C0_23_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[8] ));
    XOR3 XOR3_0 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XOR3_0_Y));
    XOR2 XOR2_40 (.A(\RBINSYNCSHIFT[12] ), .B(\WBINNXTSHIFT[12] ), .Y(
        XOR2_40_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[1]  (.D(DFN1C0_0_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\RGRYSYNC[1] ));
    XOR2 XOR2_2 (.A(\WBINNXTSHIFT[11] ), .B(\WBINNXTSHIFT[12] ), .Y(
        XOR2_2_Y));
    DFN1C0 DFN1C0_8 (.D(\WGRY[7] ), .CLK(RCLOCKP), .CLR(READ_RESET_P), 
        .Q(DFN1C0_8_Q));
    DFN1C0 \DFN1C0_RGRY[5]  (.D(XOR2_70_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[5] ));
    XNOR3 XNOR3_10 (.A(\RGRYSYNC[6] ), .B(\RGRYSYNC[5] ), .C(
        XNOR3_45_Y), .Y(XNOR3_10_Y));
    XOR2 XOR2_37 (.A(\WBINNXTSHIFT[6] ), .B(\WBINNXTSHIFT[7] ), .Y(
        XOR2_37_Y));
    AND2A AND2A_0 (.A(input_buffer_0_EMPTY), .B(
        packet_encoder_0_fifo_re), .Y(AND2A_0_Y));
    DFN1C0 \DFN1C0_WGRY[10]  (.D(XOR2_39_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P), .Q(\WGRY[10] ));
    AO1 AO1_26 (.A(XOR2_16_Y), .B(AO1_1_Y), .C(AND2_9_Y), .Y(AO1_26_Y));
    XNOR3 \XNOR3_WBINSYNCSHIFT[0]  (.A(XNOR3_15_Y), .B(XNOR3_34_Y), .C(
        XNOR3_11_Y), .Y(\WBINSYNCSHIFT[0] ));
    DFN1C0 \DFN1C0_RGRY[7]  (.D(XOR2_18_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[7] ));
    XOR3 XOR3_5 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XOR3_5_Y));
    XOR2 \XOR2_RBINNXTSHIFT[5]  (.A(XOR2_20_Y), .B(AO1_11_Y), .Y(
        \RBINNXTSHIFT[5] ));
    AND3 AND3_9 (.A(XNOR2_18_Y), .B(XNOR2_20_Y), .C(XNOR2_16_Y), .Y(
        AND3_9_Y));
    AO1 AO1_23 (.A(AND2_44_Y), .B(AO1_3_Y), .C(AO1_4_Y), .Y(AO1_23_Y));
    AND2 AND2_33 (.A(\MEM_RADDR[9] ), .B(input_buffer_GND), .Y(
        AND2_33_Y));
    XOR2 XOR2_44 (.A(\WBINNXTSHIFT[7] ), .B(\WBINNXTSHIFT[8] ), .Y(
        XOR2_44_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[2]  (.D(DFN1C0_6_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\RGRYSYNC[2] ));
    AO1 AO1_10 (.A(XOR2_0_Y), .B(AO1_9_Y), .C(AND2_52_Y), .Y(AO1_10_Y));
    XOR2 XOR2_41 (.A(\MEM_WADDR[9] ), .B(input_buffer_GND), .Y(
        XOR2_41_Y));
    XNOR3 XNOR3_49 (.A(\RGRYSYNC[3] ), .B(\RGRYSYNC[2] ), .C(XOR3_7_Y), 
        .Y(XNOR3_49_Y));
    XNOR3 XNOR3_30 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XNOR3_30_Y));
    XOR2 \XOR2_RBINNXTSHIFT[10]  (.A(XOR2_29_Y), .B(AO1_16_Y), .Y(
        \RBINNXTSHIFT[10] ));
    XNOR2 XNOR2_24 (.A(\RBINNXTSHIFT[4] ), .B(\WBINSYNCSHIFT[4] ), .Y(
        XNOR2_24_Y));
    DFN1C0 \DFN1C0_RGRYSYNC[0]  (.D(DFN1C0_27_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\RGRYSYNC[0] ));
    DFN1C0 \DFN1C0_WGRY[1]  (.D(XOR2_26_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[1] ));
    DFN1P0 DFN1P0_EMPTY (.D(EMPTYINT), .CLK(RCLOCKP), .PRE(
        READ_RESET_P_1), .Q(input_buffer_0_EMPTY));
    DFN1E1C0 \DFN1E1C0_Q[3]  (.D(\QXI[3] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[3]));
    XNOR3 \XNOR3_RBINSYNCSHIFT[4]  (.A(XNOR3_30_Y), .B(XNOR3_41_Y), .C(
        XNOR3_9_Y), .Y(\RBINSYNCSHIFT[4] ));
    XNOR3 XNOR3_29 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_29_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[4]  (.D(DFN1C0_5_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[4] ));
    DFN1C0 DFN1C0_27 (.D(\RGRY[0] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_27_Q));
    XOR2 \XOR2_WBINSYNCSHIFT[11]  (.A(\WGRYSYNC[12] ), .B(
        \WGRYSYNC[11] ), .Y(\WBINSYNCSHIFT[11] ));
    AO1 AO1_30 (.A(XOR2_3_Y), .B(AND2_15_Y), .C(AND2_46_Y), .Y(
        AO1_30_Y));
    XOR2 \XOR2_RBINNXTSHIFT[7]  (.A(XOR2_63_Y), .B(AO1_21_Y), .Y(
        \RBINNXTSHIFT[7] ));
    AND2 AND2_41 (.A(XOR2_50_Y), .B(XOR2_7_Y), .Y(AND2_41_Y));
    XOR2 XOR2_69 (.A(\MEM_WADDR[3] ), .B(input_buffer_GND), .Y(
        XOR2_69_Y));
    DFN1C0 \DFN1C0_RGRY[12]  (.D(XOR2_33_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[12] ));
    AO1 AO1_16 (.A(AND2_48_Y), .B(AO1_18_Y), .C(AO1_32_Y), .Y(AO1_16_Y)
        );
    AND2 AND2_17 (.A(XNOR2_23_Y), .B(XNOR2_4_Y), .Y(AND2_17_Y));
    XNOR2 \XNOR2_WBINSYNCSHIFT[1]  (.A(XNOR3_28_Y), .B(XNOR3_40_Y), .Y(
        \WBINSYNCSHIFT[1] ));
    XOR2 XOR2_6 (.A(\MEM_RADDR[1] ), .B(input_buffer_GND), .Y(XOR2_6_Y)
        );
    AO1 AO1_29 (.A(XOR2_60_Y), .B(AO1_12_Y), .C(AND2_2_Y), .Y(AO1_29_Y)
        );
    DFN1C0 \DFN1C0_WGRY[12]  (.D(XOR2_52_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P), .Q(\WGRY[12] ));
    AO1 AO1_13 (.A(AND2_43_Y), .B(AO1_5_Y), .C(AO1_28_Y), .Y(AO1_13_Y));
    AND2 AND2_54 (.A(XOR2_16_Y), .B(XOR2_66_Y), .Y(AND2_54_Y));
    XNOR3 \XNOR3_RBINSYNCSHIFT[2]  (.A(XNOR3_3_Y), .B(XNOR3_44_Y), .C(
        XNOR3_49_Y), .Y(\RBINSYNCSHIFT[2] ));
    XOR2 \XOR2_WBINNXTSHIFT[5]  (.A(XOR2_38_Y), .B(AO1_19_Y), .Y(
        \WBINNXTSHIFT[5] ));
    DFN1C0 \DFN1C0_MEM_WADDR[6]  (.D(\WBINNXTSHIFT[6] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[6] ));
    XOR2 XOR2_53 (.A(\MEM_RADDR[6] ), .B(input_buffer_GND), .Y(
        XOR2_53_Y));
    AO1 AO1_36 (.A(XOR2_50_Y), .B(AO1_16_Y), .C(AND2_26_Y), .Y(
        AO1_36_Y));
    XNOR2 XNOR2_23 (.A(\RBINNXTSHIFT[10] ), .B(\WBINSYNCSHIFT[10] ), 
        .Y(XNOR2_23_Y));
    XOR2 \XOR2_WBINNXTSHIFT[10]  (.A(XOR2_27_Y), .B(AO1_12_Y), .Y(
        \WBINNXTSHIFT[10] ));
    DFN1C0 DFN1C0_19 (.D(\RGRY[12] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_19_Q));
    AO1 AO1_33 (.A(AND2_31_Y), .B(AO1_8_Y), .C(AO1_37_Y), .Y(AO1_33_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[3]  (.D(DFN1C0_26_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[3] ));
    XOR2 XOR2_12 (.A(\MEM_WADDR[12] ), .B(input_buffer_GND), .Y(
        XOR2_12_Y));
    XNOR2 XNOR2_7 (.A(\RBINNXTSHIFT[1] ), .B(\WBINSYNCSHIFT[1] ), .Y(
        XNOR2_7_Y));
    XNOR2 XNOR2_12 (.A(\RBINNXTSHIFT[0] ), .B(\WBINSYNCSHIFT[0] ), .Y(
        XNOR2_12_Y));
    AND2 AND2_48 (.A(XOR2_14_Y), .B(XOR2_65_Y), .Y(AND2_48_Y));
    AND2 AND2_45 (.A(\MEM_WADDR[1] ), .B(input_buffer_GND), .Y(
        AND2_45_Y));
    DFN1C0 DFN1C0_5 (.D(\WGRY[4] ), .CLK(RCLOCKP), .CLR(READ_RESET_P), 
        .Q(DFN1C0_5_Q));
    DFN1C0 DFN1C0_21 (.D(\RGRY[6] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_21_Q));
    AO1 AO1_19 (.A(XOR2_62_Y), .B(AO1_25_Y), .C(AND2_49_Y), .Y(
        AO1_19_Y));
    XOR2 \XOR2_WBINNXTSHIFT[7]  (.A(XOR2_24_Y), .B(AO1_10_Y), .Y(
        \WBINNXTSHIFT[7] ));
    RAM4K9 \RAM4K9_QXI[5]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[5]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[5]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[5]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[5]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[5]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[5]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[5]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[5]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[5]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[5]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[5]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[5]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[5]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[5]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[5]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[5]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[5]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[5]_DOUTB1 ), 
        .DOUTB0(\QXI[5] ));
    DFN1C0 \DFN1C0_MEM_RADDR[12]  (.D(\RBINNXTSHIFT[12] ), .CLK(
        RCLOCKP), .CLR(READ_RESET_P_0), .Q(\MEM_RADDR[12] ));
    XOR2 XOR2_26 (.A(\WBINNXTSHIFT[1] ), .B(\WBINNXTSHIFT[2] ), .Y(
        XOR2_26_Y));
    DFN1C0 DFN1C0_1 (.D(\RGRY[9] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_1_Q));
    DFN1C0 \DFN1C0_RGRY[10]  (.D(XOR2_67_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[10] ));
    AND2 AND2_59 (.A(XOR2_62_Y), .B(XOR2_58_Y), .Y(AND2_59_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[7]  (.D(DFN1C0_8_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[7] ));
    AND2 AND2_4 (.A(\MEM_RADDR[4] ), .B(input_buffer_GND), .Y(AND2_4_Y)
        );
    AND2 AND2_FULLINT (.A(AND3_1_Y), .B(XOR2_40_Y), .Y(FULLINT));
    XNOR3 XNOR3_12 (.A(\RGRYSYNC[3] ), .B(\RGRYSYNC[2] ), .C(
        \RGRYSYNC[1] ), .Y(XNOR3_12_Y));
    XOR2 XOR2_50 (.A(\MEM_RADDR[10] ), .B(input_buffer_GND), .Y(
        XOR2_50_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[6]  (.D(DFN1C0_20_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[6] ));
    DFN1E1C0 \DFN1E1C0_Q[2]  (.D(\QXI[2] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .E(DVLDI), .Q(input_buffer_0_Q[2]));
    DFN1C0 \DFN1C0_WGRY[8]  (.D(XOR2_45_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[8] ));
    XNOR2 XNOR2_5 (.A(\RBINSYNCSHIFT[5] ), .B(\WBINNXTSHIFT[5] ), .Y(
        XNOR2_5_Y));
    AO1 AO1_5 (.A(AND2_25_Y), .B(AO1_25_Y), .C(AO1_23_Y), .Y(AO1_5_Y));
    XOR2 \XOR2_RBINSYNCSHIFT[11]  (.A(\RGRYSYNC[12] ), .B(
        \RGRYSYNC[11] ), .Y(\RBINSYNCSHIFT[11] ));
    XNOR2 XNOR2_16 (.A(\RBINNXTSHIFT[8] ), .B(\WBINSYNCSHIFT[8] ), .Y(
        XNOR2_16_Y));
    XNOR3 XNOR3_41 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_41_Y));
    XNOR3 XNOR3_32 (.A(\WGRYSYNC[6] ), .B(\WGRYSYNC[5] ), .C(
        \WGRYSYNC[4] ), .Y(XNOR3_32_Y));
    DFN1C0 \DFN1C0_RGRY[3]  (.D(XOR2_43_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[3] ));
    XOR3 XOR3_2 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XOR3_2_Y));
    XOR2 XOR2_39 (.A(\WBINNXTSHIFT[10] ), .B(\WBINNXTSHIFT[11] ), .Y(
        XOR2_39_Y));
    AND2 AND2_8 (.A(XOR2_19_Y), .B(XOR2_41_Y), .Y(AND2_8_Y));
    XOR2 XOR2_3 (.A(\MEM_RADDR[3] ), .B(input_buffer_GND), .Y(XOR2_3_Y)
        );
    XNOR2 \XNOR2_WBINSYNCSHIFT[9]  (.A(\WGRYSYNC[9] ), .B(XNOR3_22_Y), 
        .Y(\WBINSYNCSHIFT[9] ));
    XOR2 XOR2_54 (.A(\WBINNXTSHIFT[3] ), .B(\WBINNXTSHIFT[4] ), .Y(
        XOR2_54_Y));
    XOR3 XOR3_1 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XOR3_1_Y));
    XOR2 \XOR2_RBINNXTSHIFT[11]  (.A(XOR2_76_Y), .B(AO1_36_Y), .Y(
        \RBINNXTSHIFT[11] ));
    XNOR3 XNOR3_21 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XNOR3_21_Y));
    XOR2 XOR2_51 (.A(\MEM_RADDR[3] ), .B(input_buffer_GND), .Y(
        XOR2_51_Y));
    AO1 AO1_27 (.A(XOR2_19_Y), .B(AO1_5_Y), .C(AND2_58_Y), .Y(AO1_27_Y)
        );
    XOR2 XOR2_66 (.A(\MEM_WADDR[3] ), .B(input_buffer_GND), .Y(
        XOR2_66_Y));
    XNOR3 \XNOR3_RBINSYNCSHIFT[0]  (.A(XNOR3_43_Y), .B(XNOR3_12_Y), .C(
        XNOR3_5_Y), .Y(\RBINSYNCSHIFT[0] ));
    DFN1C0 DFN1C0_24 (.D(\WGRY[5] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_24_Q));
    AND2 AND2_56 (.A(AND2_48_Y), .B(AND2_41_Y), .Y(AND2_56_Y));
    XNOR3 XNOR3_16 (.A(\WGRYSYNC[6] ), .B(\WGRYSYNC[5] ), .C(
        \WGRYSYNC[4] ), .Y(XNOR3_16_Y));
    DFN1C0 \DFN1C0_MEM_WADDR[1]  (.D(\WBINNXTSHIFT[1] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[1] ));
    XOR2 \XOR2_RBINNXTSHIFT[1]  (.A(XOR2_36_Y), .B(AND2_61_Y), .Y(
        \RBINNXTSHIFT[1] ));
    DFN1C0 DFN1C0_READ_RESET_P_0 (.D(DFN1C0_3_Q), .CLK(RCLOCKP), .CLR(
        reset_c), .Q(READ_RESET_P_0));
    XOR2 XOR2_17 (.A(\WBINNXTSHIFT[2] ), .B(\WBINNXTSHIFT[3] ), .Y(
        XOR2_17_Y));
    XOR2 XOR2_73 (.A(\MEM_RADDR[8] ), .B(input_buffer_GND), .Y(
        XOR2_73_Y));
    DFN1C0 DFN1C0_13 (.D(\WGRY[0] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_13_Q));
    AND2 AND2_53 (.A(XOR2_9_Y), .B(XOR2_3_Y), .Y(AND2_53_Y));
    XNOR3 XNOR3_51 (.A(\RGRYSYNC[9] ), .B(\RGRYSYNC[8] ), .C(
        \RGRYSYNC[7] ), .Y(XNOR3_51_Y));
    AND3 AND3_7 (.A(XNOR2_12_Y), .B(XNOR2_7_Y), .C(XNOR2_13_Y), .Y(
        AND3_7_Y));
    XOR2 XOR2_28 (.A(\WBINNXTSHIFT[5] ), .B(\WBINNXTSHIFT[6] ), .Y(
        XOR2_28_Y));
    XNOR3 XNOR3_36 (.A(XNOR3_37_Y), .B(XNOR3_7_Y), .C(XNOR3_19_Y), .Y(
        XNOR3_36_Y));
    XOR2 XOR2_15 (.A(\WBINNXTSHIFT[9] ), .B(\WBINNXTSHIFT[10] ), .Y(
        XOR2_15_Y));
    DFN1C0 \DFN1C0_MEM_WADDR[5]  (.D(\WBINNXTSHIFT[5] ), .CLK(WCLOCKP), 
        .CLR(WRITE_RESET_P), .Q(\MEM_WADDR[5] ));
    XNOR3 XNOR3_48 (.A(\WGRYSYNC[9] ), .B(\WGRYSYNC[8] ), .C(
        \WGRYSYNC[7] ), .Y(XNOR3_48_Y));
    DFN1C0 \DFN1C0_MEM_RADDR[0]  (.D(\RBINNXTSHIFT[0] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P_1), .Q(\MEM_RADDR[0] ));
    AO1 AO1_17 (.A(XOR2_41_Y), .B(AND2_58_Y), .C(AND2_50_Y), .Y(
        AO1_17_Y));
    XNOR3 \XNOR3_WBINSYNCSHIFT[4]  (.A(XNOR3_4_Y), .B(XNOR3_13_Y), .C(
        XNOR3_32_Y), .Y(\WBINSYNCSHIFT[4] ));
    XNOR2 XNOR2_17 (.A(\RBINSYNCSHIFT[1] ), .B(\WBINNXTSHIFT[1] ), .Y(
        XNOR2_17_Y));
    RAM4K9 \RAM4K9_QXI[3]  (.ADDRA11(\MEM_WADDR[11] ), .ADDRA10(
        \MEM_WADDR[10] ), .ADDRA9(\MEM_WADDR[9] ), .ADDRA8(
        \MEM_WADDR[8] ), .ADDRA7(\MEM_WADDR[7] ), .ADDRA6(
        \MEM_WADDR[6] ), .ADDRA5(\MEM_WADDR[5] ), .ADDRA4(
        \MEM_WADDR[4] ), .ADDRA3(\MEM_WADDR[3] ), .ADDRA2(
        \MEM_WADDR[2] ), .ADDRA1(\MEM_WADDR[1] ), .ADDRA0(
        \MEM_WADDR[0] ), .ADDRB11(\MEM_RADDR[11] ), .ADDRB10(
        \MEM_RADDR[10] ), .ADDRB9(\MEM_RADDR[9] ), .ADDRB8(
        \MEM_RADDR[8] ), .ADDRB7(\MEM_RADDR[7] ), .ADDRB6(
        \MEM_RADDR[6] ), .ADDRB5(\MEM_RADDR[5] ), .ADDRB4(
        \MEM_RADDR[4] ), .ADDRB3(\MEM_RADDR[3] ), .ADDRB2(
        \MEM_RADDR[2] ), .ADDRB1(\MEM_RADDR[1] ), .ADDRB0(
        \MEM_RADDR[0] ), .DINA8(input_buffer_GND), .DINA7(
        input_buffer_GND), .DINA6(input_buffer_GND), .DINA5(
        input_buffer_GND), .DINA4(input_buffer_GND), .DINA3(
        input_buffer_GND), .DINA2(input_buffer_GND), .DINA1(
        input_buffer_GND), .DINA0(camera_adapter_0_output_data_3[3]), 
        .DINB8(input_buffer_GND), .DINB7(input_buffer_GND), .DINB6(
        input_buffer_GND), .DINB5(input_buffer_GND), .DINB4(
        input_buffer_GND), .DINB3(input_buffer_GND), .DINB2(
        input_buffer_GND), .DINB1(input_buffer_GND), .DINB0(
        input_buffer_GND), .WIDTHA0(input_buffer_GND), .WIDTHA1(
        input_buffer_GND), .WIDTHB0(input_buffer_GND), .WIDTHB1(
        input_buffer_GND), .PIPEA(input_buffer_GND), .PIPEB(
        input_buffer_GND), .WMODEA(input_buffer_GND), .WMODEB(
        input_buffer_GND), .BLKA(MEMWENEG), .BLKB(MEMRENEG), .WENA(
        input_buffer_GND), .WENB(input_buffer_VCC), .CLKA(WCLOCKP), 
        .CLKB(RCLOCKP), .RESET(WRITE_RESET_P_0), .DOUTA8(
        \RAM4K9_QXI[3]_DOUTA8 ), .DOUTA7(\RAM4K9_QXI[3]_DOUTA7 ), 
        .DOUTA6(\RAM4K9_QXI[3]_DOUTA6 ), .DOUTA5(
        \RAM4K9_QXI[3]_DOUTA5 ), .DOUTA4(\RAM4K9_QXI[3]_DOUTA4 ), 
        .DOUTA3(\RAM4K9_QXI[3]_DOUTA3 ), .DOUTA2(
        \RAM4K9_QXI[3]_DOUTA2 ), .DOUTA1(\RAM4K9_QXI[3]_DOUTA1 ), 
        .DOUTA0(\RAM4K9_QXI[3]_DOUTA0 ), .DOUTB8(
        \RAM4K9_QXI[3]_DOUTB8 ), .DOUTB7(\RAM4K9_QXI[3]_DOUTB7 ), 
        .DOUTB6(\RAM4K9_QXI[3]_DOUTB6 ), .DOUTB5(
        \RAM4K9_QXI[3]_DOUTB5 ), .DOUTB4(\RAM4K9_QXI[3]_DOUTB4 ), 
        .DOUTB3(\RAM4K9_QXI[3]_DOUTB3 ), .DOUTB2(
        \RAM4K9_QXI[3]_DOUTB2 ), .DOUTB1(\RAM4K9_QXI[3]_DOUTB1 ), 
        .DOUTB0(\QXI[3] ));
    DFN1C0 \DFN1C0_MEM_RADDR[10]  (.D(\RBINNXTSHIFT[10] ), .CLK(
        RCLOCKP), .CLR(READ_RESET_P_0), .Q(\MEM_RADDR[10] ));
    XOR2 \XOR2_WBINNXTSHIFT[11]  (.A(XOR2_49_Y), .B(AO1_29_Y), .Y(
        \WBINNXTSHIFT[11] ));
    AND3 AND3_4 (.A(XNOR2_15_Y), .B(XNOR2_8_Y), .C(XNOR2_2_Y), .Y(
        AND3_4_Y));
    XNOR3 XNOR3_28 (.A(\WGRYSYNC[3] ), .B(\WGRYSYNC[2] ), .C(
        \WGRYSYNC[1] ), .Y(XNOR3_28_Y));
    DFN1C0 \DFN1C0_RGRY[0]  (.D(XOR2_13_Y), .CLK(RCLOCKP), .CLR(
        READ_RESET_P), .Q(\RGRY[0] ));
    XOR2 \XOR2_WBINNXTSHIFT[1]  (.A(XOR2_48_Y), .B(AND2_27_Y), .Y(
        \WBINNXTSHIFT[1] ));
    XOR3 XOR3_7 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XOR3_7_Y));
    DFN1C0 \DFN1C0_WGRY[4]  (.D(XOR2_46_Y), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_0), .Q(\WGRY[4] ));
    AO1 AO1_37 (.A(XOR2_4_Y), .B(AND2_1_Y), .C(AND2_30_Y), .Y(AO1_37_Y)
        );
    XOR2 XOR2_0 (.A(\MEM_WADDR[6] ), .B(input_buffer_GND), .Y(XOR2_0_Y)
        );
    XNOR3 XNOR3_17 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XNOR3_17_Y));
    DFN1C0 DFN1C0_25 (.D(\RGRY[8] ), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(DFN1C0_25_Q));
    XOR2 XOR2_70 (.A(\RBINNXTSHIFT[5] ), .B(\RBINNXTSHIFT[6] ), .Y(
        XOR2_70_Y));
    NAND2 NAND2_1 (.A(input_buffer_0_EMPTY), .B(input_buffer_VCC), .Y(
        NAND2_1_Y));
    DFN1C0 DFN1C0_22 (.D(\WGRY[9] ), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_1), .Q(DFN1C0_22_Q));
    XNOR3 \XNOR3_WBINSYNCSHIFT[6]  (.A(\WGRYSYNC[6] ), .B(XOR3_3_Y), 
        .C(XNOR3_26_Y), .Y(\WBINSYNCSHIFT[6] ));
    DFN1C0 \DFN1C0_RGRYSYNC[8]  (.D(DFN1C0_25_Q), .CLK(WCLOCKP), .CLR(
        WRITE_RESET_P_1), .Q(\RGRYSYNC[8] ));
    AO1 AO1_4 (.A(XOR2_47_Y), .B(AND2_52_Y), .C(AND2_13_Y), .Y(AO1_4_Y)
        );
    XOR2 XOR2_68 (.A(\MEM_RADDR[6] ), .B(input_buffer_GND), .Y(
        XOR2_68_Y));
    XNOR3 XNOR3_4 (.A(\WGRYSYNC[12] ), .B(\WGRYSYNC[11] ), .C(
        \WGRYSYNC[10] ), .Y(XNOR3_4_Y));
    XOR2 \XOR2_RBINNXTSHIFT[2]  (.A(XOR2_34_Y), .B(AO1_14_Y), .Y(
        \RBINNXTSHIFT[2] ));
    XOR2 XOR2_42 (.A(\RBINNXTSHIFT[2] ), .B(\RBINNXTSHIFT[3] ), .Y(
        XOR2_42_Y));
    XNOR2 XNOR2_14 (.A(\RBINNXTSHIFT[3] ), .B(\WBINSYNCSHIFT[3] ), .Y(
        XNOR2_14_Y));
    XNOR3 XNOR3_37 (.A(\RGRYSYNC[12] ), .B(\RGRYSYNC[11] ), .C(
        \RGRYSYNC[10] ), .Y(XNOR3_37_Y));
    AO1 AO1_21 (.A(XOR2_53_Y), .B(AO1_2_Y), .C(AND2_1_Y), .Y(AO1_21_Y));
    DFN1C0 \DFN1C0_MEM_RADDR[9]  (.D(\RBINNXTSHIFT[9] ), .CLK(RCLOCKP), 
        .CLR(READ_RESET_P), .Q(\MEM_RADDR[9] ));
    XOR2 XOR2_36 (.A(\MEM_RADDR[1] ), .B(input_buffer_GND), .Y(
        XOR2_36_Y));
    XOR2 XOR2_74 (.A(\MEM_RADDR[12] ), .B(input_buffer_GND), .Y(
        XOR2_74_Y));
    XNOR3 \XNOR3_RBINSYNCSHIFT[6]  (.A(\RGRYSYNC[6] ), .B(XOR3_5_Y), 
        .C(XNOR3_0_Y), .Y(\RBINSYNCSHIFT[6] ));
    XNOR3 XNOR3_2 (.A(\RGRYSYNC[3] ), .B(\RGRYSYNC[2] ), .C(
        \RGRYSYNC[1] ), .Y(XNOR3_2_Y));
    XNOR2 XNOR2_8 (.A(\RBINSYNCSHIFT[7] ), .B(\WBINNXTSHIFT[7] ), .Y(
        XNOR2_8_Y));
    AND2 AND2_25 (.A(AND2_59_Y), .B(AND2_44_Y), .Y(AND2_25_Y));
    DFN1C0 \DFN1C0_WGRYSYNC[5]  (.D(DFN1C0_24_Q), .CLK(RCLOCKP), .CLR(
        READ_RESET_P_0), .Q(\WGRYSYNC[5] ));
    DFN1C0 \DFN1C0_MEM_RADDR[11]  (.D(\RBINNXTSHIFT[11] ), .CLK(
        RCLOCKP), .CLR(READ_RESET_P_0), .Q(\MEM_RADDR[11] ));
    
endmodule


module camera_adapter(
       camera_adapter_0_output_data_3,
       input_data_c,
       camera_adapter_0_write_en,
       reset_c,
       pclk_c,
       hsync_c,
       vsync_c
    );
output [7:0] camera_adapter_0_output_data_3;
input  [3:0] input_data_c;
output camera_adapter_0_write_en;
input  reset_c;
input  pclk_c;
input  hsync_c;
input  vsync_c;

    wire \DWACT_ADD_CI_0_g_array_1[0] , \DWACT_ADD_CI_0_TMP[0] , 
        \buffer_state[1]_net_1 , \DWACT_ADD_CI_0_g_array_12[0] , 
        \buffer_state[2]_net_1 , un1_frame_flag8_2_0, frame_flag_net_1, 
        un1_frame_flag8_5_0, buffer_state42, write_en_0_sqmuxa_1_0, 
        output_data30_1, \buffer_state[0]_net_1 , output_data30_0, 
        \buffer_state[3]_net_1 , un1_frame_flag8_2, un1_cam_hsync, 
        write_en_0_sqmuxa_1, output_data30, frame_flag_RNIEOII2_net_1, 
        buffer_state_3_sqmuxa, un1_buffer_state41, 
        \repeat_counter[0]_net_1 , \repeat_counter[1]_net_1 , 
        output_data_1_sqmuxa_1, write_en_1_sqmuxa_1, 
        \buffer_state_11[0] , \DWACT_ADD_CI_0_partial_sum[0] , N_131, 
        N_132, N_133, N_134, N_135, N_136, N_137, N_138, 
        \output_data_19[0] , \output_data_19[2] , \output_data_19[4] , 
        \output_data_19[6] , \output_data_19[1] , \output_data_19[3] , 
        \output_data_19[5] , \output_data_19[7] , 
        \repeat_counter_4[1] , I_10, \repeat_counter_4[0] , 
        \DWACT_ADD_CI_0_partial_sum_0[0] , \buffer_state_11[3] , I_16, 
        \buffer_state_11[2] , I_18, \buffer_state_11[1] , I_15, 
        \DWACT_ADD_CI_0_partial_sum[1] , \DWACT_ADD_CI_0_TMP_0[0] , 
        GND, VCC;
    
    DFN1E0C0 \output_data[1]  (.D(\output_data_19[1] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[1]));
    OR3A frame_flag_RNI7BN21 (.A(frame_flag_net_1), .B(
        \repeat_counter[0]_net_1 ), .C(\repeat_counter[1]_net_1 ), .Y(
        un1_buffer_state41));
    DFN1C0 write_en (.D(write_en_1_sqmuxa_1), .CLK(pclk_c), .CLR(
        reset_c), .Q(camera_adapter_0_write_en));
    NOR2A frame_flag_RNIEOII2 (.A(un1_cam_hsync), .B(
        un1_frame_flag8_5_0), .Y(frame_flag_RNIEOII2_net_1));
    NOR3A \output_data_RNO[6]  (.A(N_137), .B(
        \repeat_counter[0]_net_1 ), .C(\repeat_counter[1]_net_1 ), .Y(
        \output_data_19[6] ));
    DFN1E0C0 \output_data[6]  (.D(\output_data_19[6] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[6]));
    DFN1E0C0 \output_data[0]  (.D(\output_data_19[0] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[0]));
    MX2 \buffer_state_RNO[0]  (.A(\DWACT_ADD_CI_0_partial_sum[0] ), .B(
        buffer_state_3_sqmuxa), .S(frame_flag_RNIEOII2_net_1), .Y(
        \buffer_state_11[0] ));
    OR3 \output_data_RNO[3]  (.A(\repeat_counter[0]_net_1 ), .B(
        \repeat_counter[1]_net_1 ), .C(N_134), .Y(\output_data_19[3] ));
    DFN1C0 \buffer_state[2]  (.D(\buffer_state_11[2] ), .CLK(pclk_c), 
        .CLR(reset_c), .Q(\buffer_state[2]_net_1 ));
    DFN1E0C0 \output_data[7]  (.D(\output_data_19[7] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[7]));
    DFN1C0 \repeat_counter[0]  (.D(\repeat_counter_4[0] ), .CLK(pclk_c)
        , .CLR(reset_c), .Q(\repeat_counter[0]_net_1 ));
    OR2B frame_flag_RNIHU2E (.A(vsync_c), .B(frame_flag_net_1), .Y(
        un1_frame_flag8_2_0));
    VCC VCC_i (.Y(VCC));
    AND2 un1_repeat_counter_3_I_1 (.A(\repeat_counter[0]_net_1 ), .B(
        output_data_1_sqmuxa_1), .Y(\DWACT_ADD_CI_0_TMP_0[0] ));
    DFN1E0C0 \output_data[5]  (.D(\output_data_19[5] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[5]));
    DFN1C0 \buffer_state[1]  (.D(\buffer_state_11[1] ), .CLK(pclk_c), 
        .CLR(reset_c), .Q(\buffer_state[1]_net_1 ));
    DFN1C0 \repeat_counter[1]  (.D(\repeat_counter_4[1] ), .CLK(pclk_c)
        , .CLR(reset_c), .Q(\repeat_counter[1]_net_1 ));
    MX2 \output_data_RNO_0[0]  (.A(input_data_c[0]), .B(
        camera_adapter_0_output_data_3[0]), .S(output_data30), .Y(
        N_131));
    NOR2 \buffer_state_RNIH3A7[0]  (.A(\buffer_state[0]_net_1 ), .B(
        \buffer_state[1]_net_1 ), .Y(output_data30_1));
    MX2 \output_data_RNO_0[1]  (.A(input_data_c[1]), .B(
        camera_adapter_0_output_data_3[1]), .S(output_data30), .Y(
        N_132));
    XOR2 un1_buffer_state_4_I_15 (.A(\buffer_state[1]_net_1 ), .B(
        \DWACT_ADD_CI_0_TMP[0] ), .Y(I_15));
    NOR2B un1_buffer_state_4_I_20 (.A(\DWACT_ADD_CI_0_TMP[0] ), .B(
        \buffer_state[1]_net_1 ), .Y(\DWACT_ADD_CI_0_g_array_1[0] ));
    MX2 \output_data_RNO_0[3]  (.A(input_data_c[3]), .B(
        camera_adapter_0_output_data_3[3]), .S(output_data30), .Y(
        N_134));
    OA1 frame_flag_RNI7BN21_0 (.A(\repeat_counter[0]_net_1 ), .B(
        \repeat_counter[1]_net_1 ), .C(frame_flag_net_1), .Y(
        buffer_state42));
    NOR3A \output_data_RNO[4]  (.A(N_135), .B(
        \repeat_counter[0]_net_1 ), .C(\repeat_counter[1]_net_1 ), .Y(
        \output_data_19[4] ));
    MX2 \output_data_RNO_0[2]  (.A(input_data_c[2]), .B(
        camera_adapter_0_output_data_3[2]), .S(output_data30), .Y(
        N_133));
    DFN1E0C0 \output_data[3]  (.D(\output_data_19[3] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[3]));
    DFN1E0C0 \output_data[2]  (.D(\output_data_19[2] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[2]));
    AND2 un1_buffer_state_4_I_1 (.A(\buffer_state[0]_net_1 ), .B(
        frame_flag_RNIEOII2_net_1), .Y(\DWACT_ADD_CI_0_TMP[0] ));
    NOR3A \output_data_RNO[0]  (.A(N_131), .B(
        \repeat_counter[0]_net_1 ), .C(\repeat_counter[1]_net_1 ), .Y(
        \output_data_19[0] ));
    DFN1E0C0 \output_data[4]  (.D(\output_data_19[4] ), .CLK(pclk_c), 
        .CLR(reset_c), .E(un1_frame_flag8_2), .Q(
        camera_adapter_0_output_data_3[4]));
    MX2 \output_data_RNO_0[6]  (.A(camera_adapter_0_output_data_3[6]), 
        .B(input_data_c[2]), .S(output_data30), .Y(N_137));
    OA1A write_en_RNO_1 (.A(vsync_c), .B(frame_flag_net_1), .C(hsync_c)
        , .Y(write_en_0_sqmuxa_1_0));
    GND GND_i (.Y(GND));
    OR2 frame_flag_RNI0K3B1 (.A(hsync_c), .B(un1_buffer_state41), .Y(
        un1_cam_hsync));
    XOR2 un1_repeat_counter_3_I_10 (.A(\DWACT_ADD_CI_0_partial_sum[1] )
        , .B(\DWACT_ADD_CI_0_TMP_0[0] ), .Y(I_10));
    MX2 \output_data_RNO_0[4]  (.A(camera_adapter_0_output_data_3[4]), 
        .B(input_data_c[0]), .S(output_data30), .Y(N_135));
    NOR2A \buffer_state_RNO[2]  (.A(I_18), .B(
        frame_flag_RNIEOII2_net_1), .Y(\buffer_state_11[2] ));
    NOR2A \buffer_state_RNO_0[0]  (.A(output_data30), .B(
        un1_buffer_state41), .Y(buffer_state_3_sqmuxa));
    AO1A \repeat_counter_RNO[1]  (.A(frame_flag_net_1), .B(vsync_c), 
        .C(I_10), .Y(\repeat_counter_4[1] ));
    OR3 \output_data_RNO[1]  (.A(\repeat_counter[0]_net_1 ), .B(
        \repeat_counter[1]_net_1 ), .C(N_132), .Y(\output_data_19[1] ));
    DFN1C0 frame_flag (.D(vsync_c), .CLK(pclk_c), .CLR(reset_c), .Q(
        frame_flag_net_1));
    OA1 write_en_RNO (.A(buffer_state42), .B(write_en_0_sqmuxa_1), .C(
        vsync_c), .Y(write_en_1_sqmuxa_1));
    OR2A frame_flag_RNIHI6P1 (.A(un1_cam_hsync), .B(
        un1_frame_flag8_2_0), .Y(un1_frame_flag8_2));
    OR3 \output_data_RNO[5]  (.A(\repeat_counter[0]_net_1 ), .B(
        \repeat_counter[1]_net_1 ), .C(N_136), .Y(\output_data_19[5] ));
    NOR3A \output_data_RNO[2]  (.A(N_133), .B(
        \repeat_counter[0]_net_1 ), .C(\repeat_counter[1]_net_1 ), .Y(
        \output_data_19[2] ));
    NOR2 \buffer_state_RNIL7A7[3]  (.A(\buffer_state[3]_net_1 ), .B(
        \buffer_state[2]_net_1 ), .Y(output_data30_0));
    XOR2 un1_buffer_state_4_I_16 (.A(\buffer_state[3]_net_1 ), .B(
        \DWACT_ADD_CI_0_g_array_12[0] ), .Y(I_16));
    MX2 \output_data_RNO_0[7]  (.A(camera_adapter_0_output_data_3[7]), 
        .B(input_data_c[3]), .S(output_data30), .Y(N_138));
    NOR2A \buffer_state_RNO[1]  (.A(I_15), .B(
        frame_flag_RNIEOII2_net_1), .Y(\buffer_state_11[1] ));
    NOR2A write_en_RNO_0 (.A(write_en_0_sqmuxa_1_0), .B(output_data30), 
        .Y(write_en_0_sqmuxa_1));
    XOR2 un1_buffer_state_4_I_18 (.A(\buffer_state[2]_net_1 ), .B(
        \DWACT_ADD_CI_0_g_array_1[0] ), .Y(I_18));
    MX2 \output_data_RNO_0[5]  (.A(camera_adapter_0_output_data_3[5]), 
        .B(input_data_c[1]), .S(output_data30), .Y(N_136));
    XOR2 un1_buffer_state_4_I_13 (.A(\buffer_state[0]_net_1 ), .B(
        frame_flag_RNIEOII2_net_1), .Y(\DWACT_ADD_CI_0_partial_sum[0] )
        );
    NOR2B un1_buffer_state_4_I_22 (.A(\DWACT_ADD_CI_0_g_array_1[0] ), 
        .B(\buffer_state[2]_net_1 ), .Y(\DWACT_ADD_CI_0_g_array_12[0] )
        );
    DFN1C0 \buffer_state[0]  (.D(\buffer_state_11[0] ), .CLK(pclk_c), 
        .CLR(reset_c), .Q(\buffer_state[0]_net_1 ));
    OR3 \output_data_RNO[7]  (.A(\repeat_counter[0]_net_1 ), .B(
        \repeat_counter[1]_net_1 ), .C(N_138), .Y(\output_data_19[7] ));
    DFN1C0 \buffer_state[3]  (.D(\buffer_state_11[3] ), .CLK(pclk_c), 
        .CLR(reset_c), .Q(\buffer_state[3]_net_1 ));
    AO1A \repeat_counter_RNO[0]  (.A(frame_flag_net_1), .B(vsync_c), 
        .C(\DWACT_ADD_CI_0_partial_sum_0[0] ), .Y(
        \repeat_counter_4[0] ));
    NOR2B frame_flag_RNIE4F71_0 (.A(vsync_c), .B(buffer_state42), .Y(
        output_data_1_sqmuxa_1));
    NOR2B \buffer_state_RNI6BKE[0]  (.A(output_data30_1), .B(
        output_data30_0), .Y(output_data30));
    XOR2 un1_repeat_counter_3_I_8 (.A(\repeat_counter[0]_net_1 ), .B(
        output_data_1_sqmuxa_1), .Y(\DWACT_ADD_CI_0_partial_sum_0[0] ));
    XOR2 un1_repeat_counter_3_I_7 (.A(\repeat_counter[1]_net_1 ), .B(
        output_data_1_sqmuxa_1), .Y(\DWACT_ADD_CI_0_partial_sum[1] ));
    NOR2A \buffer_state_RNO[3]  (.A(I_16), .B(
        frame_flag_RNIEOII2_net_1), .Y(\buffer_state_11[3] ));
    OR2A frame_flag_RNIE4F71 (.A(vsync_c), .B(buffer_state42), .Y(
        un1_frame_flag8_5_0));
    
endmodule


module packet_encoder(
       input_buffer_0_Q,
       packet_encoder_0_fifo_re,
       reset_c,
       clock_control_0_clock_out,
       packet_encoder_0_output_data,
       clock_control_0_switch_0,
       input_buffer_0_EMPTY,
       clock_control_0_switch
    );
input  [7:0] input_buffer_0_Q;
output packet_encoder_0_fifo_re;
input  reset_c;
input  clock_control_0_clock_out;
output packet_encoder_0_output_data;
input  clock_control_0_switch_0;
input  input_buffer_0_EMPTY;
input  clock_control_0_switch;

    wire N_88_0, packet_ended_net_1, N_84, byte_counter_35_0, 
        \byte_counter[14]_net_1 , current_2_sqmuxa_0_a3_0, 
        \byte_counter[1]_net_1 , \byte_counter[2]_net_1 , 
        \byte_counter[0]_net_1 , current_3_sqmuxa_0_a3_0, 
        \current_12_iv_0_a2_1_9[7] , \current_12_iv_0_a2_1_6[7] , 
        \current_12_iv_0_a2_1_5[7] , \current_12_iv_0_a2_1_7[7] , 
        \current_12_iv_0_a2_1_1[7] , \current_12_iv_0_a2_1_0[7] , N_90, 
        \byte_counter[15]_net_1 , N_92, \current_12_iv_0_a2_1_3[7] , 
        \byte_counter[9]_net_1 , \byte_counter[3]_net_1 , 
        \byte_counter[5]_net_1 , \byte_counter[7]_net_1 , 
        \byte_counter[8]_net_1 , \byte_counter[4]_net_1 , 
        \byte_counter[6]_net_1 , \current_12_iv_0_o2_0[7] , 
        \current[6]_net_1 , bit_state_n3_i_0, N_80, fifo_re_4_0_a3_2, 
        N_254_1, fifo_re_4_0_a3_0, \bit_state[2]_net_1 , 
        packet_ended_1_sqmuxa_i_a3_1, \current_12_iv_2[2] , 
        current_4_sqmuxa, \payload_size[2]_net_1 , \seq_number_m[18] , 
        \current_12_iv_1[2] , current_3_sqmuxa, \seq_number[2]_net_1 , 
        \current_12_iv_0[2] , current_2_sqmuxa, \seq_number[10]_net_1 , 
        \current_m[1] , \current_12_iv_2[3] , \payload_size[3]_net_1 , 
        \seq_number_m[19] , \current_12_iv_1[3] , 
        \seq_number[3]_net_1 , \current_12_iv_0[3] , 
        \seq_number[11]_net_1 , \current_m[2] , \current_12_iv_2[1] , 
        \payload_size[1]_net_1 , \seq_number_i_m[17] , 
        \current_12_iv_1[1] , \seq_number[1]_net_1 , 
        \current_12_iv_0[1] , \seq_number[9]_net_1 , \current_i_m[0] , 
        \current_12_iv_2[6] , \payload_size[6]_net_1 , 
        \seq_number_m[22] , \current_12_iv_1[6] , 
        \seq_number[14]_net_1 , \current_12_iv_0[6] , 
        \seq_number[6]_net_1 , \current_m[5] , \current_12_iv_2[4] , 
        \payload_size[4]_net_1 , \seq_number_i_m[20] , 
        \current_12_iv_1[4] , \seq_number[12]_net_1 , 
        \current_12_iv_0[4] , \seq_number[4]_net_1 , \current_i_m[3] , 
        \current_12_iv_2[5] , \payload_size[5]_net_1 , 
        \seq_number_m[21] , \current_12_iv_1[5] , 
        \seq_number[13]_net_1 , \current_12_iv_0[5] , 
        \seq_number[5]_net_1 , \current_m[4] , \current_12_iv_2[0] , 
        \payload_size[0]_net_1 , \seq_number_m[16] , 
        \current_12_iv_1[0] , \seq_number[0]_net_1 , 
        \current_12_iv_0[0] , \seq_number[8]_net_1 , \current_m[7] , 
        un1_fifo_empty_7, un1_fifo_empty_4, un1_fifo_empty_3, 
        un1_fifo_empty_5, un1_byte_counter_13lt5_0, un1_fifo_empty_2, 
        \current_12_iv[4] , \input_data_i_m[4] , un1_fifo_empty, N_150, 
        byte_counter_c13, \current_12[6] , \input_data_m[6] , 
        current_1_sqmuxa_2, N_152, \payload_size[7]_net_1 , N_30, N_74, 
        \bit_state[3]_net_1 , \current_12[5] , \input_data_m[5] , N_28, 
        N_120, N_119, \current_12_iv[7] , N_59, N_113, N_229, N_82, 
        N_32, N_71, N_34, \bit_state[0]_net_1 , \bit_state_i_0[1] , 
        \current_12[0] , \input_data_m[0] , \current_12_iv[1] , 
        \input_data_i_m[1] , \current_12[2] , \input_data_m[2] , 
        \current_12[3] , \input_data_m[3] , fifo_re_4, 
        byte_counter_n13, byte_counter_c12, \byte_counter[13]_net_1 , 
        byte_counter_n12, byte_counter_c11, \byte_counter[12]_net_1 , 
        byte_counter_n10, byte_counter_c9, \byte_counter[10]_net_1 , 
        byte_counter_n9, byte_counter_c8, byte_counter_n8, 
        byte_counter_c7, byte_counter_n6, byte_counter_c5, 
        byte_counter_n5, byte_counter_c4, byte_counter_n3, 
        byte_counter_c2, byte_counter_n14, byte_counter_n11, 
        byte_counter_c10, \byte_counter[11]_net_1 , byte_counter_n7, 
        byte_counter_c6, byte_counter_n4, byte_counter_c3, 
        byte_counter_n2, N_14, payload_size_n2, payload_size_c1, 
        payload_size_n3, payload_size_c2, payload_size_n4, 
        payload_size_c3, payload_size_n5, payload_size_c4, 
        payload_size_n6, payload_size_c5, payload_size_n7, 
        payload_size_51_0, \current_i_0[3] , N_58, current_1_sqmuxa_1, 
        \seq_number[20]_net_1 , N_88, \seq_number[22]_net_1 , 
        byte_counter_n15, \current[5]_net_1 , byte_counter_n1, N_227, 
        N_79, N_76, N_154, \seq_number[23]_net_1 , 
        \seq_number[7]_net_1 , N_255, \current[4]_net_1 , 
        \seq_number[21]_net_1 , seq_number_n11, N_69, N_228, 
        payload_size_n1, \bit_state[4]_net_1 , payload_sizee, 
        output_data_3, \current[7]_net_1 , bit_state_n0, 
        \seq_number[15]_net_1 , seq_number_n23, N_109, seq_number_n22, 
        N_87, seq_number_n17, \seq_number[17]_net_1 , N_81, 
        seq_number_n16, N_75, \seq_number[16]_net_1 , seq_number_n15, 
        seq_number_n14, N_72, seq_number_n9, N_67, seq_number_n8, N_65, 
        seq_number_n7, seq_number_n6, N_63, N_51, N_56, N_61, N_105_i, 
        N_106_i, N_107_i, N_108_i, N_110_i, \seq_number[19]_net_1 , 
        N_85, \seq_number[18]_net_1 , seq_number_n21, seq_number_n20, 
        seq_number_n19, seq_number_n18, seq_number_n13, seq_number_n12, 
        seq_number_n10, \current[2]_net_1 , \current[1]_net_1 , 
        \current_i_0[0] , GND, VCC;
    
    OR2B \bit_state_RNO_0[3]  (.A(clock_control_0_switch), .B(N_80), 
        .Y(bit_state_n3_i_0));
    OR3 \byte_counter_RNIK7CU[8]  (.A(\byte_counter[8]_net_1 ), .B(
        \byte_counter[9]_net_1 ), .C(N_92), .Y(un1_fifo_empty_3));
    XA1B \payload_size_RNO[1]  (.A(\payload_size[1]_net_1 ), .B(
        \payload_size[0]_net_1 ), .C(N_84), .Y(payload_size_n1));
    NOR3C \current_RNO_3[2]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[18]_net_1 ), .Y(
        \seq_number_m[18] ));
    NOR3B \byte_counter_RNI95N44_0[0]  (.A(\current_12_iv_0_a2_1_9[7] )
        , .B(current_2_sqmuxa_0_a3_0), .C(N_84), .Y(current_2_sqmuxa));
    DFN1E0C0 \seq_number[7]  (.D(seq_number_n7), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[7]_net_1 ));
    NOR3B \byte_counter_RNI95N44_1[0]  (.A(\current_12_iv_0_a2_1_9[7] )
        , .B(current_3_sqmuxa_0_a3_0), .C(N_84), .Y(current_3_sqmuxa));
    NOR2 \byte_counter_RNID2T[7]  (.A(\byte_counter[7]_net_1 ), .B(
        \byte_counter[8]_net_1 ), .Y(\current_12_iv_0_a2_1_1[7] ));
    OR3B \seq_number_RNIBLR42[4]  (.A(\seq_number[3]_net_1 ), .B(
        \seq_number[4]_net_1 ), .C(N_61), .Y(N_63));
    OR2 \byte_counter_RNI1VET[10]  (.A(\byte_counter[11]_net_1 ), .B(
        \byte_counter[10]_net_1 ), .Y(N_90));
    DFN1E0C0 \seq_number[10]  (.D(seq_number_n10), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[10]_net_1 ));
    NOR3C \byte_counter_RNIDT7S2[9]  (.A(\current_12_iv_0_a2_1_6[7] ), 
        .B(\current_12_iv_0_a2_1_5[7] ), .C(
        \current_12_iv_0_a2_1_7[7] ), .Y(\current_12_iv_0_a2_1_9[7] ));
    NOR2B \payload_size_RNIF35N[5]  (.A(payload_size_c4), .B(
        \payload_size[5]_net_1 ), .Y(payload_size_c5));
    NOR2B \byte_counter_RNI6RS[3]  (.A(\byte_counter[3]_net_1 ), .B(
        \byte_counter[5]_net_1 ), .Y(\current_12_iv_0_a2_1_3[7] ));
    XNOR2 \seq_number_RNO[9]  (.A(\seq_number[9]_net_1 ), .B(N_67), .Y(
        seq_number_n9));
    DFN1E0C0 \seq_number[23]  (.D(seq_number_n23), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[23]_net_1 ));
    NOR2A \current_RNO_5[6]  (.A(\current[5]_net_1 ), .B(N_58), .Y(
        \current_m[5] ));
    XA1C \bit_state_RNO[3]  (.A(N_74), .B(\bit_state[3]_net_1 ), .C(
        bit_state_n3_i_0), .Y(N_30));
    DFN1E0C0 \seq_number[11]  (.D(seq_number_n11), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[11]_net_1 ));
    NOR3 \current_RNO[1]  (.A(\current_12_iv_2[1] ), .B(
        \current_12_iv_1[1] ), .C(\input_data_i_m[1] ), .Y(
        \current_12_iv[1] ));
    DFN1E1C0 \byte_counter[4]  (.D(byte_counter_n4), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[4]_net_1 ));
    XNOR2 \seq_number_RNO[17]  (.A(\seq_number[17]_net_1 ), .B(N_81), 
        .Y(seq_number_n17));
    XNOR2 \seq_number_RNO[7]  (.A(\seq_number[7]_net_1 ), .B(N_65), .Y(
        seq_number_n7));
    AX1 \seq_number_RNO[12]  (.A(N_69), .B(\seq_number[11]_net_1 ), .C(
        \seq_number[12]_net_1 ), .Y(seq_number_n12));
    AO1 \current_RNO_4[3]  (.A(current_2_sqmuxa), .B(
        \seq_number[11]_net_1 ), .C(\current_m[2] ), .Y(
        \current_12_iv_0[3] ));
    OR3 \byte_counter_RNIDT7S2[5]  (.A(un1_fifo_empty_4), .B(
        un1_fifo_empty_3), .C(un1_fifo_empty_5), .Y(un1_fifo_empty_7));
    AO1 \current_RNO_1[5]  (.A(\seq_number[13]_net_1 ), .B(
        current_2_sqmuxa), .C(\current_12_iv_0[5] ), .Y(
        \current_12_iv_1[5] ));
    DFN1E1C0 \payload_size[1]  (.D(payload_size_n1), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[1]_net_1 ));
    OR2A \current_RNO_3[7]  (.A(clock_control_0_switch), .B(
        \current[6]_net_1 ), .Y(\current_12_iv_0_o2_0[7] ));
    DFN1E0C0 \seq_number[5]  (.D(N_110_i), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[5]_net_1 ));
    DFN1C0 \current[2]  (.D(\current_12[2] ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(
        \current[2]_net_1 ));
    NOR3B \byte_counter_RNI95N44[0]  (.A(\byte_counter[2]_net_1 ), .B(
        current_1_sqmuxa_2), .C(\byte_counter[0]_net_1 ), .Y(
        current_4_sqmuxa));
    DFN1P0 \current[3]  (.D(\current_12[3] ), .CLK(
        clock_control_0_clock_out), .PRE(reset_c), .Q(\current_i_0[3] )
        );
    OA1C \bit_state_RNO_1[4]  (.A(\bit_state[3]_net_1 ), .B(N_74), .C(
        \bit_state[4]_net_1 ), .Y(N_119));
    DFN1E1C0 \byte_counter[3]  (.D(byte_counter_n3), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[3]_net_1 ));
    XNOR2 \seq_number_RNO[13]  (.A(N_72), .B(\seq_number[13]_net_1 ), 
        .Y(seq_number_n13));
    AX1 \seq_number_RNO[22]  (.A(N_87), .B(\seq_number[21]_net_1 ), .C(
        \seq_number[22]_net_1 ), .Y(seq_number_n22));
    OR3B \seq_number_RNIGBD03[6]  (.A(\seq_number[5]_net_1 ), .B(
        \seq_number[6]_net_1 ), .C(N_63), .Y(N_65));
    XA1B \payload_size_RNO[2]  (.A(payload_size_c1), .B(
        \payload_size[2]_net_1 ), .C(N_84), .Y(payload_size_n2));
    AO1 \current_RNO_0[3]  (.A(current_4_sqmuxa), .B(
        \payload_size[3]_net_1 ), .C(\seq_number_m[19] ), .Y(
        \current_12_iv_2[3] ));
    NOR3B \current_RNO_3[1]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[17]_net_1 ), .Y(
        \seq_number_i_m[17] ));
    DFN1E1C0 \byte_counter[10]  (.D(byte_counter_n10), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[10]_net_1 ));
    OR3B \seq_number_RNICI1T4[12]  (.A(\seq_number[11]_net_1 ), .B(
        \seq_number[12]_net_1 ), .C(N_69), .Y(N_72));
    DFN1E0C0 \seq_number[13]  (.D(seq_number_n13), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[13]_net_1 ));
    DFN1E1C0 \byte_counter[5]  (.D(byte_counter_n5), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[5]_net_1 ));
    XA1B \payload_size_RNO[6]  (.A(payload_size_c5), .B(
        \payload_size[6]_net_1 ), .C(N_84), .Y(payload_size_n6));
    DFN1E1C0 \byte_counter[13]  (.D(byte_counter_n13), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[13]_net_1 ));
    DFN1E1C0 \byte_counter[0]  (.D(N_227), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[0]_net_1 ));
    NOR3B \current_RNO_3[4]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[20]_net_1 ), .Y(
        \seq_number_i_m[20] ));
    OR2 \byte_counter_RNI53FT[12]  (.A(\byte_counter[12]_net_1 ), .B(
        \byte_counter[13]_net_1 ), .Y(N_92));
    XNOR2 \seq_number_RNO[23]  (.A(\seq_number[23]_net_1 ), .B(N_109), 
        .Y(seq_number_n23));
    DFN1E1C0 \payload_size[5]  (.D(payload_size_n5), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[5]_net_1 ));
    XA1 \byte_counter_RNO[6]  (.A(byte_counter_c5), .B(
        \byte_counter[6]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n6));
    OR3B \seq_number_RNI77IG6[20]  (.A(\seq_number[19]_net_1 ), .B(
        \seq_number[20]_net_1 ), .C(N_85), .Y(N_87));
    NOR3A \current_RNO_7[7]  (.A(\byte_counter[2]_net_1 ), .B(
        \payload_size[7]_net_1 ), .C(\byte_counter[1]_net_1 ), .Y(
        N_152));
    DFN1E0C0 \seq_number[4]  (.D(N_108_i), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[4]_net_1 ));
    NOR2A fifo_re_RNO (.A(fifo_re_4_0_a3_2), .B(un1_fifo_empty), .Y(
        fifo_re_4));
    AO1A \current_RNO_1[1]  (.A(\seq_number[1]_net_1 ), .B(
        current_3_sqmuxa), .C(\current_12_iv_0[1] ), .Y(
        \current_12_iv_1[1] ));
    GND GND_i (.Y(GND));
    AO1 \current_RNO_1[3]  (.A(current_3_sqmuxa), .B(
        \seq_number[3]_net_1 ), .C(\current_12_iv_0[3] ), .Y(
        \current_12_iv_1[3] ));
    OR3 \byte_counter_RNIM6I1[6]  (.A(\byte_counter[6]_net_1 ), .B(
        \byte_counter[7]_net_1 ), .C(packet_ended_net_1), .Y(
        un1_fifo_empty_2));
    NOR3A \byte_counter_RNIGVA1_0[0]  (.A(\byte_counter[1]_net_1 ), .B(
        \byte_counter[2]_net_1 ), .C(\byte_counter[0]_net_1 ), .Y(
        current_2_sqmuxa_0_a3_0));
    NOR2A \current_RNO_2[3]  (.A(input_buffer_0_Q[3]), .B(N_88), .Y(
        \input_data_m[3] ));
    NOR2 \current_RNO_2[1]  (.A(N_88), .B(input_buffer_0_Q[1]), .Y(
        \input_data_i_m[1] ));
    OR3C \seq_number_RNIA3A91[2]  (.A(\seq_number[0]_net_1 ), .B(
        \seq_number[1]_net_1 ), .C(\seq_number[2]_net_1 ), .Y(N_61));
    DFN1C0 \bit_state[4]  (.D(N_28), .CLK(clock_control_0_clock_out), 
        .CLR(reset_c), .Q(\bit_state[4]_net_1 ));
    DFN1E1C0 \byte_counter[6]  (.D(byte_counter_n6), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[6]_net_1 ));
    OR2 packet_ended_RNINEP71 (.A(packet_ended_net_1), .B(N_84), .Y(
        N_88));
    NOR3A \byte_counter_RNI9GQ34[1]  (.A(\current_12_iv_0_a2_1_9[7] ), 
        .B(N_84), .C(\byte_counter[1]_net_1 ), .Y(current_1_sqmuxa_2));
    XOR2 \seq_number_RNO[1]  (.A(\seq_number[1]_net_1 ), .B(
        \seq_number[0]_net_1 ), .Y(N_105_i));
    AO1B packet_ended_RNO (.A(packet_ended_1_sqmuxa_i_a3_1), .B(
        un1_fifo_empty), .C(clock_control_0_switch), .Y(N_56));
    NOR2B \byte_counter_RNI2CP1[3]  (.A(byte_counter_c2), .B(
        \byte_counter[3]_net_1 ), .Y(byte_counter_c3));
    XA1B \payload_size_RNO[5]  (.A(payload_size_c4), .B(
        \payload_size[5]_net_1 ), .C(N_84), .Y(payload_size_n5));
    OR3B \seq_number_RNIM8PM5[16]  (.A(\seq_number[15]_net_1 ), .B(
        \seq_number[16]_net_1 ), .C(N_75), .Y(N_81));
    NOR3C \current_RNO_3[0]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[16]_net_1 ), .Y(
        \seq_number_m[16] ));
    DFN1C0 \current[6]  (.D(\current_12[6] ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(
        \current[6]_net_1 ));
    NOR2A \byte_counter_RNI0LS[0]  (.A(\byte_counter[0]_net_1 ), .B(
        \byte_counter[2]_net_1 ), .Y(current_1_sqmuxa_1));
    DFN1E1C0 packet_ended (.D(clock_control_0_switch_0), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_56), .Q(
        packet_ended_net_1));
    AO1 \current_RNO_1[2]  (.A(current_3_sqmuxa), .B(
        \seq_number[2]_net_1 ), .C(\current_12_iv_0[2] ), .Y(
        \current_12_iv_1[2] ));
    DFN1E1C0 \byte_counter[11]  (.D(byte_counter_n11), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[11]_net_1 ));
    XA1B \payload_size_RNO[4]  (.A(payload_size_c3), .B(
        \payload_size[4]_net_1 ), .C(N_84), .Y(payload_size_n4));
    NOR3B \current_RNO_1[7]  (.A(\current_12_iv_0_a2_1_9[7] ), .B(N_79)
        , .C(N_84), .Y(N_113));
    NOR3A \current_RNO[7]  (.A(N_59), .B(N_113), .C(N_229), .Y(
        \current_12_iv[7] ));
    OR2B \byte_counter_RNI5QS[3]  (.A(\byte_counter[4]_net_1 ), .B(
        \byte_counter[3]_net_1 ), .Y(un1_byte_counter_13lt5_0));
    DFN1E0C0 \seq_number[1]  (.D(N_105_i), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[1]_net_1 ));
    NOR2 \payload_size_RNO[0]  (.A(\payload_size[0]_net_1 ), .B(N_84), 
        .Y(N_228));
    AO1A \current_RNO_4[4]  (.A(\seq_number[4]_net_1 ), .B(
        current_3_sqmuxa), .C(\current_i_m[3] ), .Y(
        \current_12_iv_0[4] ));
    NOR2B output_data_RNO (.A(clock_control_0_switch), .B(
        \current[7]_net_1 ), .Y(output_data_3));
    NOR2B \byte_counter_RNO_1[15]  (.A(clock_control_0_switch), .B(
        \byte_counter[14]_net_1 ), .Y(byte_counter_35_0));
    AO1 \current_RNO_4[0]  (.A(current_2_sqmuxa), .B(
        \seq_number[8]_net_1 ), .C(\current_m[7] ), .Y(
        \current_12_iv_0[0] ));
    NOR3B \byte_counter_RNIGVA1[0]  (.A(\byte_counter[1]_net_1 ), .B(
        \byte_counter[0]_net_1 ), .C(\byte_counter[2]_net_1 ), .Y(
        current_3_sqmuxa_0_a3_0));
    XNOR2 \seq_number_RNO[15]  (.A(\seq_number[15]_net_1 ), .B(N_75), 
        .Y(seq_number_n15));
    OAI1 packet_ended_RNI68H41 (.A(N_82), .B(packet_ended_net_1), .C(
        clock_control_0_switch_0), .Y(payload_sizee));
    NOR2B \byte_counter_RNI4CV11[11]  (.A(byte_counter_c10), .B(
        \byte_counter[11]_net_1 ), .Y(byte_counter_c11));
    DFN1E1C0 \byte_counter[9]  (.D(byte_counter_n9), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[9]_net_1 ));
    VCC VCC_i (.Y(VCC));
    AO1 \current_RNO_4[5]  (.A(\seq_number[5]_net_1 ), .B(
        current_3_sqmuxa), .C(\current_m[4] ), .Y(\current_12_iv_0[5] )
        );
    NOR2B \payload_size_RNO_0[7]  (.A(\payload_size[6]_net_1 ), .B(
        payload_size_c5), .Y(payload_size_51_0));
    DFN1C0 \bit_state[0]  (.D(bit_state_n0), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(
        \bit_state[0]_net_1 ));
    NOR2A \bit_state_RNO_0[4]  (.A(\bit_state[4]_net_1 ), .B(N_74), .Y(
        N_120));
    XNOR2 \seq_number_RNO[3]  (.A(N_61), .B(\seq_number[3]_net_1 ), .Y(
        N_107_i));
    XA1 \byte_counter_RNO[13]  (.A(byte_counter_c12), .B(
        \byte_counter[13]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n13));
    DFN1E1C0 \byte_counter[8]  (.D(byte_counter_n8), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[8]_net_1 ));
    AO1A \current_RNO_0[1]  (.A(\payload_size[1]_net_1 ), .B(
        current_4_sqmuxa), .C(\seq_number_i_m[17] ), .Y(
        \current_12_iv_2[1] ));
    XA1 \byte_counter_RNO[5]  (.A(byte_counter_c4), .B(
        \byte_counter[5]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n5));
    DFN1E0C0 \seq_number[6]  (.D(seq_number_n6), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[6]_net_1 ));
    AO1A \current_RNO_0[4]  (.A(\payload_size[4]_net_1 ), .B(
        current_4_sqmuxa), .C(\seq_number_i_m[20] ), .Y(
        \current_12_iv_2[4] ));
    NOR3C \current_RNO_3[3]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[19]_net_1 ), .Y(
        \seq_number_m[19] ));
    AX1 \seq_number_RNO[8]  (.A(N_65), .B(\seq_number[7]_net_1 ), .C(
        \seq_number[8]_net_1 ), .Y(seq_number_n8));
    AX1 \seq_number_RNO[10]  (.A(N_67), .B(\seq_number[9]_net_1 ), .C(
        \seq_number[10]_net_1 ), .Y(seq_number_n10));
    NOR3 \current_RNO[4]  (.A(\current_12_iv_2[4] ), .B(
        \current_12_iv_1[4] ), .C(\input_data_i_m[4] ), .Y(
        \current_12_iv[4] ));
    OR2A \current_RNO_0[7]  (.A(N_82), .B(\current_12_iv_0_o2_0[7] ), 
        .Y(N_59));
    AO1 \current_RNO_0[0]  (.A(current_4_sqmuxa), .B(
        \payload_size[0]_net_1 ), .C(\seq_number_m[16] ), .Y(
        \current_12_iv_2[0] ));
    DFN1E0C0 \seq_number[9]  (.D(seq_number_n9), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[9]_net_1 ));
    NOR2B \byte_counter_RNI3S7J[10]  (.A(byte_counter_c9), .B(
        \byte_counter[10]_net_1 ), .Y(byte_counter_c10));
    NOR2A \current_RNO_5[3]  (.A(\current[2]_net_1 ), .B(N_58), .Y(
        \current_m[2] ));
    OR3B \seq_number_RNIFBT95[14]  (.A(\seq_number[13]_net_1 ), .B(
        \seq_number[14]_net_1 ), .C(N_72), .Y(N_75));
    DFN1E1C0 \payload_size[7]  (.D(payload_size_n7), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[7]_net_1 ));
    OR3 \current_RNO[5]  (.A(\current_12_iv_2[5] ), .B(
        \current_12_iv_1[5] ), .C(\input_data_m[5] ), .Y(
        \current_12[5] ));
    NOR2B \byte_counter_RNIBQ14[8]  (.A(byte_counter_c7), .B(
        \byte_counter[8]_net_1 ), .Y(byte_counter_c8));
    DFN1P0 \current[1]  (.D(\current_12_iv[1] ), .CLK(
        clock_control_0_clock_out), .PRE(reset_c), .Q(
        \current[1]_net_1 ));
    NOR2B \byte_counter_RNI98M2[5]  (.A(byte_counter_c4), .B(
        \byte_counter[5]_net_1 ), .Y(byte_counter_c5));
    NOR3A \current_RNO_8[7]  (.A(\byte_counter[1]_net_1 ), .B(
        \byte_counter[2]_net_1 ), .C(\seq_number[15]_net_1 ), .Y(N_255)
        );
    NOR2B \byte_counter_RNO_0[15]  (.A(byte_counter_35_0), .B(
        byte_counter_c13), .Y(N_150));
    XNOR2 \seq_number_RNO[11]  (.A(N_69), .B(\seq_number[11]_net_1 ), 
        .Y(seq_number_n11));
    OR3B \seq_number_RNIDT5G4[10]  (.A(\seq_number[9]_net_1 ), .B(
        \seq_number[10]_net_1 ), .C(N_67), .Y(N_69));
    DFN1C0 fifo_re (.D(fifo_re_4), .CLK(clock_control_0_clock_out), 
        .CLR(reset_c), .Q(packet_encoder_0_fifo_re));
    NOR2B \byte_counter_RNIUN43[6]  (.A(byte_counter_c5), .B(
        \byte_counter[6]_net_1 ), .Y(byte_counter_c6));
    DFN1E1C0 \payload_size[4]  (.D(payload_size_n4), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[4]_net_1 ));
    AX1 \seq_number_RNO[20]  (.A(N_85), .B(\seq_number[19]_net_1 ), .C(
        \seq_number[20]_net_1 ), .Y(seq_number_n20));
    AO1 \current_RNO_1[6]  (.A(\seq_number[14]_net_1 ), .B(
        current_2_sqmuxa), .C(\current_12_iv_0[6] ), .Y(
        \current_12_iv_1[6] ));
    DFN1E1C0 \payload_size[3]  (.D(payload_size_n3), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[3]_net_1 ));
    OR3B \seq_number_RNO_0[23]  (.A(\seq_number[21]_net_1 ), .B(
        \seq_number[22]_net_1 ), .C(N_87), .Y(N_109));
    AX1 \seq_number_RNO[4]  (.A(N_61), .B(\seq_number[3]_net_1 ), .C(
        \seq_number[4]_net_1 ), .Y(N_108_i));
    DFN1E1C0 \payload_size[0]  (.D(N_228), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[0]_net_1 ));
    NOR2A \current_RNO_5[5]  (.A(\current[4]_net_1 ), .B(N_58), .Y(
        \current_m[4] ));
    OR2A \bit_state_RNITQ1E[3]  (.A(\bit_state[4]_net_1 ), .B(
        \bit_state[3]_net_1 ), .Y(N_80));
    XA1 \byte_counter_RNO[1]  (.A(\byte_counter[1]_net_1 ), .B(
        \byte_counter[0]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n1));
    DFN1E0C0 \seq_number[22]  (.D(seq_number_n22), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[22]_net_1 ));
    XNOR2 \seq_number_RNO[21]  (.A(N_87), .B(\seq_number[21]_net_1 ), 
        .Y(seq_number_n21));
    NOR2A \byte_counter_RNIGVA1[2]  (.A(\byte_counter[2]_net_1 ), .B(
        N_14), .Y(byte_counter_c2));
    OR2 \bit_state_RNIHB431[2]  (.A(N_80), .B(N_74), .Y(N_82));
    NOR2B \byte_counter_RNILP72[4]  (.A(byte_counter_c3), .B(
        \byte_counter[4]_net_1 ), .Y(byte_counter_c4));
    DFN1E1C0 \byte_counter[1]  (.D(byte_counter_n1), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[1]_net_1 ));
    XA1A \byte_counter_RNO[2]  (.A(\byte_counter[2]_net_1 ), .B(N_14), 
        .C(clock_control_0_switch_0), .Y(byte_counter_n2));
    NOR2B \payload_size_RNI1TM7[1]  (.A(\payload_size[0]_net_1 ), .B(
        \payload_size[1]_net_1 ), .Y(payload_size_c1));
    XA1 \byte_counter_RNO[14]  (.A(byte_counter_c13), .B(
        \byte_counter[14]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n14));
    OR2 \byte_counter_RNIAE123[5]  (.A(un1_fifo_empty_7), .B(
        input_buffer_0_EMPTY), .Y(un1_fifo_empty));
    AX1 \seq_number_RNO[14]  (.A(N_72), .B(\seq_number[13]_net_1 ), .C(
        \seq_number[14]_net_1 ), .Y(seq_number_n14));
    XAI1A \bit_state_RNO[1]  (.A(\bit_state[0]_net_1 ), .B(
        \bit_state_i_0[1] ), .C(clock_control_0_switch_0), .Y(N_34));
    AO1 \current_RNO_4[2]  (.A(current_2_sqmuxa), .B(
        \seq_number[10]_net_1 ), .C(\current_m[1] ), .Y(
        \current_12_iv_0[2] ));
    AO1A \current_RNO_4[7]  (.A(N_76), .B(current_1_sqmuxa_1), .C(
        N_154), .Y(N_79));
    AO1 \current_RNO_0[6]  (.A(\payload_size[6]_net_1 ), .B(
        current_4_sqmuxa), .C(\seq_number_m[22] ), .Y(
        \current_12_iv_2[6] ));
    NOR2A \current_RNO_5[0]  (.A(\current[7]_net_1 ), .B(N_58), .Y(
        \current_m[7] ));
    DFN1C0 output_data (.D(output_data_3), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(
        packet_encoder_0_output_data));
    NOR2A \bit_state_RNO[0]  (.A(clock_control_0_switch), .B(
        \bit_state[0]_net_1 ), .Y(bit_state_n0));
    DFN1E1C0 \byte_counter[14]  (.D(byte_counter_n14), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[14]_net_1 ));
    OR3B \seq_number_RNIP5VR3[8]  (.A(\seq_number[7]_net_1 ), .B(
        \seq_number[8]_net_1 ), .C(N_65), .Y(N_67));
    DFN1E0C0 \seq_number[12]  (.D(seq_number_n12), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[12]_net_1 ));
    NOR2B \payload_size_RNIAG9J[4]  (.A(payload_size_c3), .B(
        \payload_size[4]_net_1 ), .Y(payload_size_c4));
    XA1 \byte_counter_RNO[7]  (.A(byte_counter_c6), .B(
        \byte_counter[7]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n7));
    NOR3 \byte_counter_RNIEAUQ1[15]  (.A(\byte_counter[14]_net_1 ), .B(
        \byte_counter[15]_net_1 ), .C(N_92), .Y(
        \current_12_iv_0_a2_1_6[7] ));
    AO1 \current_RNO_4[6]  (.A(\seq_number[6]_net_1 ), .B(
        current_3_sqmuxa), .C(\current_m[5] ), .Y(\current_12_iv_0[6] )
        );
    NOR3 \current_RNO[0]  (.A(\current_12_iv_2[0] ), .B(
        \current_12_iv_1[0] ), .C(\input_data_m[0] ), .Y(
        \current_12[0] ));
    XA1 \byte_counter_RNO[12]  (.A(byte_counter_c11), .B(
        \byte_counter[12]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n12));
    DFN1E0C0 \seq_number[3]  (.D(N_107_i), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[3]_net_1 ));
    DFN1E0C0 \seq_number[18]  (.D(seq_number_n18), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[18]_net_1 ));
    DFN1E1C0 \byte_counter[12]  (.D(byte_counter_n12), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[12]_net_1 ));
    DFN1C0 \seq_number[0]  (.D(N_51), .CLK(clock_control_0_clock_out), 
        .CLR(reset_c), .Q(\seq_number[0]_net_1 ));
    DFN1E0C0 \seq_number[17]  (.D(seq_number_n17), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[17]_net_1 ));
    OA1B \current_RNO_6[7]  (.A(N_152), .B(N_255), .C(
        \byte_counter[0]_net_1 ), .Y(N_154));
    NOR3A \bit_state_RNO[4]  (.A(clock_control_0_switch_0), .B(N_120), 
        .C(N_119), .Y(N_28));
    DFN1E0C0 \seq_number[8]  (.D(seq_number_n8), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88), .Q(
        \seq_number[8]_net_1 ));
    DFN1C0 \bit_state[2]  (.D(N_32), .CLK(clock_control_0_clock_out), 
        .CLR(reset_c), .Q(\bit_state[2]_net_1 ));
    NOR2 \current_RNO_2[7]  (.A(input_buffer_0_Q[7]), .B(N_88), .Y(
        N_229));
    DFN1P0 \current[7]  (.D(\current_12_iv[7] ), .CLK(
        clock_control_0_clock_out), .PRE(reset_c), .Q(
        \current[7]_net_1 ));
    DFN1E0C0 \seq_number[2]  (.D(N_106_i), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[2]_net_1 ));
    AX1 \seq_number_RNO[18]  (.A(N_81), .B(\seq_number[17]_net_1 ), .C(
        \seq_number[18]_net_1 ), .Y(seq_number_n18));
    XA1A \bit_state_RNO[2]  (.A(\bit_state[2]_net_1 ), .B(N_71), .C(
        clock_control_0_switch_0), .Y(N_32));
    DFN1E1C0 \byte_counter[7]  (.D(byte_counter_n7), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[7]_net_1 ));
    XA1 \byte_counter_RNO[8]  (.A(byte_counter_c7), .B(
        \byte_counter[8]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n8));
    NOR2B \byte_counter_RNIK8J3[7]  (.A(byte_counter_c6), .B(
        \byte_counter[7]_net_1 ), .Y(byte_counter_c7));
    NOR2A \current_RNO_5[1]  (.A(\current_i_0[0] ), .B(N_58), .Y(
        \current_i_m[0] ));
    NOR3C \current_RNO_3[6]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[22]_net_1 ), .Y(
        \seq_number_m[22] ));
    XA1 \byte_counter_RNO[10]  (.A(byte_counter_c9), .B(
        \byte_counter[10]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n10));
    NOR2A \current_RNO_2[0]  (.A(input_buffer_0_Q[0]), .B(N_88), .Y(
        \input_data_m[0] ));
    NOR3B \byte_counter_RNIMU8V[4]  (.A(\current_12_iv_0_a2_1_1[7] ), 
        .B(\current_12_iv_0_a2_1_0[7] ), .C(N_90), .Y(
        \current_12_iv_0_a2_1_7[7] ));
    XNOR2 \seq_number_RNO[0]  (.A(\seq_number[0]_net_1 ), .B(N_88), .Y(
        N_51));
    DFN1E0C0 \seq_number[14]  (.D(seq_number_n14), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[14]_net_1 ));
    DFN1E1C0 \payload_size[6]  (.D(payload_size_n6), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[6]_net_1 ));
    DFN1P0 \bit_state[1]  (.D(N_34), .CLK(clock_control_0_clock_out), 
        .PRE(reset_c), .Q(\bit_state_i_0[1] ));
    NOR2B \payload_size_RNI3DIB[2]  (.A(payload_size_c1), .B(
        \payload_size[2]_net_1 ), .Y(payload_size_c2));
    DFN1P0 \current[4]  (.D(\current_12_iv[4] ), .CLK(
        clock_control_0_clock_out), .PRE(reset_c), .Q(
        \current[4]_net_1 ));
    MX2 \current_RNO_5[7]  (.A(\seq_number[23]_net_1 ), .B(
        \seq_number[7]_net_1 ), .S(\byte_counter[1]_net_1 ), .Y(N_76));
    OR3 \current_RNO[2]  (.A(\current_12_iv_2[2] ), .B(
        \current_12_iv_1[2] ), .C(\input_data_m[2] ), .Y(
        \current_12[2] ));
    AO1 \current_RNO_0[2]  (.A(current_4_sqmuxa), .B(
        \payload_size[2]_net_1 ), .C(\seq_number_m[18] ), .Y(
        \current_12_iv_2[2] ));
    AO1A \byte_counter_RNIFFT2[5]  (.A(un1_byte_counter_13lt5_0), .B(
        \byte_counter[5]_net_1 ), .C(un1_fifo_empty_2), .Y(
        un1_fifo_empty_5));
    DFN1C0 \bit_state[3]  (.D(N_30), .CLK(clock_control_0_clock_out), 
        .CLR(reset_c), .Q(\bit_state[3]_net_1 ));
    NOR3C \current_RNO_3[5]  (.A(current_1_sqmuxa_2), .B(
        current_1_sqmuxa_1), .C(\seq_number[21]_net_1 ), .Y(
        \seq_number_m[21] ));
    NOR2B fifo_re_RNO_1 (.A(clock_control_0_switch), .B(
        \bit_state[2]_net_1 ), .Y(fifo_re_4_0_a3_0));
    NOR3 \current_RNO[3]  (.A(\current_12_iv_2[3] ), .B(
        \current_12_iv_1[3] ), .C(\input_data_m[3] ), .Y(
        \current_12[3] ));
    DFN1C0 \current[5]  (.D(\current_12[5] ), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .Q(
        \current[5]_net_1 ));
    NOR2B \payload_size_RNI6UDF[3]  (.A(payload_size_c2), .B(
        \payload_size[3]_net_1 ), .Y(payload_size_c3));
    NOR2A \current_RNO_5[2]  (.A(\current[1]_net_1 ), .B(N_58), .Y(
        \current_m[1] ));
    OR2B \bit_state_RNIC8471[2]  (.A(N_82), .B(clock_control_0_switch), 
        .Y(N_58));
    NOR2B \byte_counter_RNI3DG4[9]  (.A(byte_counter_c8), .B(
        \byte_counter[9]_net_1 ), .Y(byte_counter_c9));
    AX1 \seq_number_RNO[6]  (.A(N_63), .B(\seq_number[5]_net_1 ), .C(
        \seq_number[6]_net_1 ), .Y(seq_number_n6));
    NOR2A \current_RNO_2[5]  (.A(input_buffer_0_Q[5]), .B(N_88), .Y(
        \input_data_m[5] ));
    NOR2A \current_RNO_2[2]  (.A(input_buffer_0_Q[2]), .B(N_88), .Y(
        \input_data_m[2] ));
    DFN1E0C0 \seq_number[16]  (.D(seq_number_n16), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[16]_net_1 ));
    NOR2A \current_RNO_5[4]  (.A(\current_i_0[3] ), .B(N_58), .Y(
        \current_i_m[3] ));
    NOR2B \byte_counter_RNI6TMG1[12]  (.A(byte_counter_c11), .B(
        \byte_counter[12]_net_1 ), .Y(byte_counter_c12));
    AO1 \current_RNO_0[5]  (.A(current_4_sqmuxa), .B(
        \payload_size[5]_net_1 ), .C(\seq_number_m[21] ), .Y(
        \current_12_iv_2[5] ));
    NOR3B fifo_re_RNO_0 (.A(N_254_1), .B(fifo_re_4_0_a3_0), .C(N_80), 
        .Y(fifo_re_4_0_a3_2));
    NOR2 \current_RNO_2[4]  (.A(input_buffer_0_Q[4]), .B(N_88), .Y(
        \input_data_i_m[4] ));
    DFN1E1C0 \byte_counter[15]  (.D(byte_counter_n15), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[15]_net_1 ));
    NOR2B \bit_state_RNINK1E_0[1]  (.A(\bit_state_i_0[1] ), .B(
        \bit_state[0]_net_1 ), .Y(N_254_1));
    XA1 \byte_counter_RNO[4]  (.A(\byte_counter[4]_net_1 ), .B(
        byte_counter_c3), .C(clock_control_0_switch_0), .Y(
        byte_counter_n4));
    XA1B \payload_size_RNO[7]  (.A(payload_size_51_0), .B(
        \payload_size[7]_net_1 ), .C(N_84), .Y(payload_size_n7));
    AO1 \current_RNO_1[0]  (.A(current_3_sqmuxa), .B(
        \seq_number[0]_net_1 ), .C(\current_12_iv_0[0] ), .Y(
        \current_12_iv_1[0] ));
    NOR3B \byte_counter_RNI9K02[9]  (.A(packet_ended_net_1), .B(
        \current_12_iv_0_a2_1_3[7] ), .C(\byte_counter[9]_net_1 ), .Y(
        \current_12_iv_0_a2_1_5[7] ));
    DFN1E0C0 \seq_number[15]  (.D(seq_number_n15), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[15]_net_1 ));
    DFN1E1C0 \byte_counter[2]  (.D(byte_counter_n2), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_58), .Q(
        \byte_counter[2]_net_1 ));
    OR2 packet_ended_RNINEP71_0 (.A(packet_ended_net_1), .B(N_84), .Y(
        N_88_0));
    DFN1E1C0 \payload_size[2]  (.D(payload_size_n2), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(payload_sizee), 
        .Q(\payload_size[2]_net_1 ));
    AO1A \current_RNO_1[4]  (.A(\seq_number[12]_net_1 ), .B(
        current_2_sqmuxa), .C(\current_12_iv_0[4] ), .Y(
        \current_12_iv_1[4] ));
    AX1C \byte_counter_RNO[15]  (.A(clock_control_0_switch_0), .B(
        \byte_counter[15]_net_1 ), .C(N_150), .Y(byte_counter_n15));
    AX1 \seq_number_RNO[16]  (.A(N_75), .B(\seq_number[15]_net_1 ), .C(
        \seq_number[16]_net_1 ), .Y(seq_number_n16));
    OR2B \byte_counter_RNIVJS[0]  (.A(\byte_counter[1]_net_1 ), .B(
        \byte_counter[0]_net_1 ), .Y(N_14));
    NOR2B \byte_counter_RNI9FEV1[13]  (.A(byte_counter_c12), .B(
        \byte_counter[13]_net_1 ), .Y(byte_counter_c13));
    NOR3B packet_ended_RNO_0 (.A(N_254_1), .B(\bit_state[2]_net_1 ), 
        .C(N_80), .Y(packet_ended_1_sqmuxa_i_a3_1));
    XNOR2 \seq_number_RNO[5]  (.A(N_63), .B(\seq_number[5]_net_1 ), .Y(
        N_110_i));
    XA1 \byte_counter_RNO[9]  (.A(byte_counter_c8), .B(
        \byte_counter[9]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n9));
    OR2A \bit_state_RNIC8471_0[2]  (.A(clock_control_0_switch), .B(
        N_82), .Y(N_84));
    XNOR2 \seq_number_RNO[19]  (.A(N_85), .B(\seq_number[19]_net_1 ), 
        .Y(seq_number_n19));
    DFN1E0C0 \seq_number[19]  (.D(seq_number_n19), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[19]_net_1 ));
    XA1 \byte_counter_RNO[11]  (.A(byte_counter_c10), .B(
        \byte_counter[11]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n11));
    OR2A \bit_state_RNINK1E[1]  (.A(\bit_state[0]_net_1 ), .B(
        \bit_state_i_0[1] ), .Y(N_71));
    NOR2A \current_RNO_2[6]  (.A(input_buffer_0_Q[6]), .B(N_88), .Y(
        \input_data_m[6] ));
    OR3 \byte_counter_RNIA6UQ1[15]  (.A(\byte_counter[14]_net_1 ), .B(
        \byte_counter[15]_net_1 ), .C(N_90), .Y(un1_fifo_empty_4));
    OR2A \bit_state_RNIKG2L[2]  (.A(\bit_state[2]_net_1 ), .B(N_71), 
        .Y(N_74));
    OR3 \current_RNO[6]  (.A(\current_12_iv_2[6] ), .B(
        \current_12_iv_1[6] ), .C(\input_data_m[6] ), .Y(
        \current_12[6] ));
    DFN1E0C0 \seq_number[20]  (.D(seq_number_n20), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[20]_net_1 ));
    XA1B \payload_size_RNO[3]  (.A(payload_size_c2), .B(
        \payload_size[3]_net_1 ), .C(N_84), .Y(payload_size_n3));
    OR3B \seq_number_RNI1AL36[18]  (.A(\seq_number[17]_net_1 ), .B(
        \seq_number[18]_net_1 ), .C(N_81), .Y(N_85));
    NOR2A \byte_counter_RNO[0]  (.A(clock_control_0_switch), .B(
        \byte_counter[0]_net_1 ), .Y(N_227));
    AO1A \current_RNO_4[1]  (.A(\seq_number[9]_net_1 ), .B(
        current_2_sqmuxa), .C(\current_i_m[0] ), .Y(
        \current_12_iv_0[1] ));
    AX1C \seq_number_RNO[2]  (.A(\seq_number[0]_net_1 ), .B(
        \seq_number[1]_net_1 ), .C(\seq_number[2]_net_1 ), .Y(N_106_i));
    DFN1P0 \current[0]  (.D(\current_12[0] ), .CLK(
        clock_control_0_clock_out), .PRE(reset_c), .Q(\current_i_0[0] )
        );
    NOR2A \byte_counter_RNI8TS[4]  (.A(\byte_counter[4]_net_1 ), .B(
        \byte_counter[6]_net_1 ), .Y(\current_12_iv_0_a2_1_0[7] ));
    DFN1E0C0 \seq_number[21]  (.D(seq_number_n21), .CLK(
        clock_control_0_clock_out), .CLR(reset_c), .E(N_88_0), .Q(
        \seq_number[21]_net_1 ));
    XA1 \byte_counter_RNO[3]  (.A(byte_counter_c2), .B(
        \byte_counter[3]_net_1 ), .C(clock_control_0_switch_0), .Y(
        byte_counter_n3));
    
endmodule


module top(
       clock,
       hsync,
       input_data,
       pclk,
       reset,
       trigger_signal,
       vsync,
       camera_mclk,
       camera_res,
       signal_into_switch
    );
input  clock;
input  hsync;
input  [3:0] input_data;
input  pclk;
input  reset;
input  trigger_signal;
input  vsync;
output camera_mclk;
output camera_res;
output signal_into_switch;

    wire \camera_adapter_0_output_data_3[0] , 
        \camera_adapter_0_output_data_3[1] , 
        \camera_adapter_0_output_data_3[2] , 
        \camera_adapter_0_output_data_3[3] , 
        \camera_adapter_0_output_data_3[4] , 
        \camera_adapter_0_output_data_3[5] , 
        \camera_adapter_0_output_data_3[6] , 
        \camera_adapter_0_output_data_3[7] , camera_adapter_0_write_en, 
        GND, GLA, clock_control_0_clock_out, clock_control_0_switch, 
        whitening_0_output_whitening, GLB, camera_res_net_0, 
        downlink_decoder_0_downlink_bit, \input_buffer_0_Q[0] , 
        \input_buffer_0_Q[1] , \input_buffer_0_Q[2] , 
        \input_buffer_0_Q[3] , \input_buffer_0_Q[4] , 
        \input_buffer_0_Q[5] , \input_buffer_0_Q[6] , 
        \input_buffer_0_Q[7] , packet_encoder_0_fifo_re, 
        input_buffer_0_EMPTY, packet_encoder_0_output_data, VCC, 
        clock_c, hsync_c, \input_data_c[0] , \input_data_c[1] , 
        \input_data_c[2] , \input_data_c[3] , pclk_c, reset_c, 
        trigger_signal_c, vsync_c, camera_mclk_c, camera_res_c, 
        signal_into_switch_c, \dbpsk_modulator_0.output_dbpsk_4 , 
        trigger_signal_c_0, clock_control_0_switch_0;
    
    INBUF pclk_pad (.PAD(pclk), .Y(pclk_c));
    INBUF \input_data_pad[3]  (.PAD(input_data[3]), .Y(
        \input_data_c[3] ));
    clock_control clock_control_0 (.clock_control_0_switch(
        clock_control_0_switch), .trigger_signal_c_0(
        trigger_signal_c_0), .trigger_signal_c(trigger_signal_c), 
        .clock_control_0_clock_out(clock_control_0_clock_out), 
        .reset_c(reset_c), .GLA(GLA), .clock_control_0_switch_0(
        clock_control_0_switch_0));
    dbpsk_modulator dbpsk_modulator_0 (.reset_c(reset_c), 
        .clock_control_0_clock_out(clock_control_0_clock_out), 
        .output_dbpsk_4(\dbpsk_modulator_0.output_dbpsk_4 ), 
        .whitening_0_output_whitening(whitening_0_output_whitening), 
        .clock_control_0_switch(clock_control_0_switch));
    downlink_parser downlink_parser_0 (.camera_res_net_0(
        camera_res_net_0), .downlink_decoder_0_downlink_bit(
        downlink_decoder_0_downlink_bit), .reset_c(reset_c), .GLB(GLB), 
        .camera_res_c(camera_res_c));
    INBUF hsync_pad (.PAD(hsync), .Y(hsync_c));
    VCC VCC_i (.Y(VCC));
    whitening whitening_0 (.clock_control_0_clock_out(
        clock_control_0_clock_out), .whitening_0_output_whitening(
        whitening_0_output_whitening), .reset_c(reset_c), 
        .clock_control_0_switch(clock_control_0_switch), 
        .packet_encoder_0_output_data(packet_encoder_0_output_data));
    pll_core pll_core_0 (.clock_c(clock_c), .GLB(GLB), .GLA(GLA));
    GND GND_i (.Y(GND));
    INBUF trigger_signal_pad (.PAD(trigger_signal), .Y(
        trigger_signal_c));
    CLKBUF reset_pad (.PAD(reset), .Y(reset_c));
    switch_encoder switch_encoder_0 (.output_dbpsk_4(
        \dbpsk_modulator_0.output_dbpsk_4 ), .GLA(GLA), 
        .signal_into_switch_c(signal_into_switch_c));
    INBUF \input_data_pad[1]  (.PAD(input_data[1]), .Y(
        \input_data_c[1] ));
    INBUF \input_data_pad[0]  (.PAD(input_data[0]), .Y(
        \input_data_c[0] ));
    downlink_decoder downlink_decoder_0 (.camera_res_net_0(
        camera_res_net_0), .downlink_decoder_0_downlink_bit(
        downlink_decoder_0_downlink_bit), .reset_c(reset_c), .GLB(GLB), 
        .trigger_signal_c_0(trigger_signal_c_0), .trigger_signal_c(
        trigger_signal_c));
    INBUF vsync_pad (.PAD(vsync), .Y(vsync_c));
    OUTBUF signal_into_switch_pad (.D(signal_into_switch_c), .PAD(
        signal_into_switch));
    OUTBUF camera_mclk_pad (.D(camera_mclk_c), .PAD(camera_mclk));
    OUTBUF camera_res_pad (.D(camera_res_c), .PAD(camera_res));
    camera_clock camera_clock_0 (.reset_c(reset_c), .GLA(GLA), 
        .camera_mclk_c(camera_mclk_c));
    input_buffer input_buffer_0 (.camera_adapter_0_output_data_3({
        \camera_adapter_0_output_data_3[7] , 
        \camera_adapter_0_output_data_3[6] , 
        \camera_adapter_0_output_data_3[5] , 
        \camera_adapter_0_output_data_3[4] , 
        \camera_adapter_0_output_data_3[3] , 
        \camera_adapter_0_output_data_3[2] , 
        \camera_adapter_0_output_data_3[1] , 
        \camera_adapter_0_output_data_3[0] }), .input_buffer_0_Q({
        \input_buffer_0_Q[7] , \input_buffer_0_Q[6] , 
        \input_buffer_0_Q[5] , \input_buffer_0_Q[4] , 
        \input_buffer_0_Q[3] , \input_buffer_0_Q[2] , 
        \input_buffer_0_Q[1] , \input_buffer_0_Q[0] }), 
        .clock_control_0_clock_out(clock_control_0_clock_out), .pclk_c(
        pclk_c), .camera_adapter_0_write_en(camera_adapter_0_write_en), 
        .packet_encoder_0_fifo_re(packet_encoder_0_fifo_re), 
        .input_buffer_0_EMPTY(input_buffer_0_EMPTY), .reset_c(reset_c));
    camera_adapter camera_adapter_0 (.camera_adapter_0_output_data_3({
        \camera_adapter_0_output_data_3[7] , 
        \camera_adapter_0_output_data_3[6] , 
        \camera_adapter_0_output_data_3[5] , 
        \camera_adapter_0_output_data_3[4] , 
        \camera_adapter_0_output_data_3[3] , 
        \camera_adapter_0_output_data_3[2] , 
        \camera_adapter_0_output_data_3[1] , 
        \camera_adapter_0_output_data_3[0] }), .input_data_c({
        \input_data_c[3] , \input_data_c[2] , \input_data_c[1] , 
        \input_data_c[0] }), .camera_adapter_0_write_en(
        camera_adapter_0_write_en), .reset_c(reset_c), .pclk_c(pclk_c), 
        .hsync_c(hsync_c), .vsync_c(vsync_c));
    INBUF \input_data_pad[2]  (.PAD(input_data[2]), .Y(
        \input_data_c[2] ));
    INBUF clock_pad (.PAD(clock), .Y(clock_c));
    BUFF trigger_signal_pad_RNI5M7B (.A(trigger_signal_c), .Y(
        trigger_signal_c_0));
    packet_encoder packet_encoder_0 (.input_buffer_0_Q({
        \input_buffer_0_Q[7] , \input_buffer_0_Q[6] , 
        \input_buffer_0_Q[5] , \input_buffer_0_Q[4] , 
        \input_buffer_0_Q[3] , \input_buffer_0_Q[2] , 
        \input_buffer_0_Q[1] , \input_buffer_0_Q[0] }), 
        .packet_encoder_0_fifo_re(packet_encoder_0_fifo_re), .reset_c(
        reset_c), .clock_control_0_clock_out(clock_control_0_clock_out)
        , .packet_encoder_0_output_data(packet_encoder_0_output_data), 
        .clock_control_0_switch_0(clock_control_0_switch_0), 
        .input_buffer_0_EMPTY(input_buffer_0_EMPTY), 
        .clock_control_0_switch(clock_control_0_switch));
    
endmodule
