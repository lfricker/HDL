//---------------------------------
// Projet : HDL_2020
// Name   : tb_Toplevel_C5G_GPIO
// Author : lfr
// Date   : 14.01.2021
//---------------------------------

`timescale 10ns/10ns
module tb_Toplevel_C5G_GPIO ();

   logic CLOCK_125_p;
   logic CLOCK_50_B5B;
   logic CLOCK_50_B6A;
   logic CLOCK_50_B7A;
   logic CLOCK_50_B8A;
   logic            CPU_RESET_n;
   logic [3:0]      KEY;
   logic [9:0]      SW;
   logic [7:0]      LEDG;
   logic [9:0]      LEDR;
   logic [6:0]      HEX0;
   logic [6:0]      HEX1;
   logic [35:0]      GPIO;

   Toplevel_C5G_GPIO dut(.*);

   logic run_sim = 1'b1;
   logic clk50m;
   logic rst_n;

   assign CLOCK_50_B5B = clk50m;
   assign CPU_RESET_n  = rst_n;

   assign CLOCK_125_p  = 'b0;
   assign CLOCK_50_B6A = 'b0;
   assign CLOCK_50_B7A = 'b0;
   assign CLOCK_50_B8A = 'b0;

   task wait_clks(input int clks);
      repeat(clks)
      begin
         @(negedge clk50m);
      end
   endtask

   initial begin
      clk50m = 1'b0;
      while(run_sim) begin
         #10ns;
         clk50m =~clk50m;
      end
   end

   initial begin
      $display("-------------------");
      $display("tb_Toplevel_C5G_GPIO started");
      $display("-------------------");
      rst_n = 1'b0;
      KEY = 'b0;
      SW = 'b0;

      $readmemh("../ip/running_light_3.txt", tb_Toplevel_C5G_GPIO.dut.u0_memory_quartus.altsyncram_component.m_default.altsyncram_inst.mem_data);

      #100ns;

      rst_n = 1'b1;
      #100ns;


      #100us;
//      wait_clks(2000);

      run_sim = 1'b0;
      $display("--------------------");
      $display("tb_Toplevel_C5G_GPIO finished");
      $display("--------------------");
   end



endmodule