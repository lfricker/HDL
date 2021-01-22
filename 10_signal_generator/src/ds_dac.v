//---------------------------------
// Projet : HDL_2020
// Name   : da_dac
// Author : lfr
// Date   : 13.01.2021
//---------------------------------

//`timescale 1 ns / 1 ns

module ds_dac
          (clk,
           rst_n,
           clk_en,
           din,
           ce_out,
           dout);


  input   clk;
  input   rst_n;
  input   clk_en;
  input   [15:0] din;  // uint16
  output  ce_out;
  output  dout;


  wire enb;
  wire [15:0] mid_range_out1;  // uint16
  wire Relational_Operator_relop1;
  wire dout_1;
  wire [15:0] fdbk;  // uint16
  wire signed [16:0] Sum_1;  // sfix17
  wire signed [16:0] Sum_2;  // sfix17
  wire signed [16:0] delta;  // sfix17
  reg signed [17:0] integ;  // sfix18
  wire signed [17:0] Sum1_1;  // sfix18
  wire signed [17:0] integ_add;  // sfix18
  wire signed [17:0] Relational_Operator_1_1;  // sfix18


  assign enb = clk_en;

  assign mid_range_out1 = 16'b1000000000000000;



  assign dout_1 = Relational_Operator_relop1;

  assign fdbk = (dout_1 == 1'b1 ? 16'b1111111111111111 :
              16'b0000000000000000);



  assign Sum_1 = {1'b0, din};
  assign Sum_2 = {1'b0, fdbk};
  assign delta = Sum_1 - Sum_2;



  assign Sum1_1 = {delta[16], delta};
  assign integ_add = Sum1_1 + integ;



  always @(posedge clk or negedge rst_n)
    begin : Unit_Delay_process
      if (rst_n == 1'b0) begin
        integ <= 18'sb000000000000000000;
      end
      else begin
        if (enb) begin
          integ <= integ_add;
        end
      end
    end



  assign Relational_Operator_1_1 = {2'b0, mid_range_out1};
  assign Relational_Operator_relop1 = integ >= Relational_Operator_1_1;



  assign dout = Relational_Operator_relop1;

  assign ce_out = clk_en;

endmodule  // ds_dac_sl

