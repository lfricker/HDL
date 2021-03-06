
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Toplevel_C5G_GPIO(

   //////////// CLOCK //////////
   input                       CLOCK_125_p,
   input                       CLOCK_50_B5B,
   input                       CLOCK_50_B6A,
   input                       CLOCK_50_B7A,
   input                       CLOCK_50_B8A,

   //////////// LED //////////
   output           [7:0]      LEDG,
   output           [9:0]      LEDR,

   //////////// KEY //////////
   input                       CPU_RESET_n,
   input            [3:0]      KEY,

   //////////// SW //////////
   input            [9:0]      SW,

   //////////// SEG7 //////////
   output           [6:0]      HEX0,
   output           [6:0]      HEX1,

   //////////// GPIO, GPIO connect to GPIO Default //////////
   output           [35:0]      GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

logic             rst_n;
logic             clk_50m;
logic    [3:0]    key;
logic             en_1m;
logic             sw_up;
logic             sw_down;
logic             up_ndown;
logic    [7:0]    speed ;
logic             inc_data;
logic    [9:0]    addr;
logic    [15:0]   signal;
logic             ds_dac_out;
logic             pwm_out;





//=======================================================
//  Structural coding
//=======================================================

assign rst_n   = CPU_RESET_n;
assign clk_50m  = CLOCK_50_B5B;
assign key     = KEY;

assign LEDG    = ds_dac_out   ? 8'hFF     : 8'b0;
assign LEDR    = pwm_out      ? 10'h3FF   : 10'b0;

assign GPIO    = 36'b0;

prescaler #(.ratio (50)) prescaler_50m_1m
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .en            (en_1m)
);

prescaler_8bit u0_prescaler_8bit
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .en            (en_1m),
   .preval        (speed),
   .cnt           (),
   .cnt_zero      (inc_data)
);

counter_pwm #(.W (8)) counter_updn_8bit
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .en            (sw_up | sw_down),
   .down          (up_ndown),
   .cmp           (8'b0),
   .per           (8'hFF),

   .cnt           (speed),
   .pwm           ()
);

counter_pwm #(.W (10)) counter_up_10bit
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .en            (inc_data),
   .down          (1'b0),
   .cmp           (10'b0),
   .per           (10'h3FF),

   .cnt           (addr),
   .pwm           ()
);

counter_pwm #(.W (16)) pwm_dac_16bit
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .en            (en_1m),
   .down          (1'b0),
   .cmp           (signal),
   .per           (16'hFFFF),

   .cnt           (),
   .pwm           (pwm_out)
);

sevenseg seg0
(
   .bin            (speed[7:4]), 
   .hex            (),
   .hexn           (HEX1[6:0])
);

sevenseg seg1
(
   .bin            (speed[3:0]),
   .hex            (),
   .hexn           (HEX0[6:0])
);

ds_dac ds_dac_16bit
(
   .rst_n          (rst_n),
   .clk            (clk_50m),
   .clk_en         (en_1m),
   .din            (signal),
   .ce_out         (),
   .dout           (ds_dac_out)
);

debounce key_slower
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .sw            (key[1]),
   .sw_hi         (sw_down),
   .sw_lo         (),
   .sw_dbnc       ()
);

debounce key_faster
(
   .rst_n         (rst_n),
   .clk50m        (clk_50m),
   .sw            (key[0]),
   .sw_hi         (sw_up),
   .sw_lo         (),
   .sw_dbnc       (up_ndown)
);

signal_memory u0_signal_memory
(
   .address        (addr),
   .clock          (en_1m),
   .q              (signal)
);

endmodule
