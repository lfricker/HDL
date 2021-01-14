//---------------------------------
// Projet : HDL_2020
// Name   : tb_ds_dac
// Author : lfr
// Date   : 13.01.2021
//---------------------------------

module tb_ds_dac ();

// (1)  DUT wiring
logic             clk50m;
logic             rst_n;
logic             clk_en;
logic  [15:0]     din;
logic             ce_out;
logic             dout;

// (2) Dut instance

   ds_dac dut
   (
     .clk      (clk50m),
     .rst_n    (rst_n),
     .clk_en   (clk_en),
     .din      (din),
     .ce_out   (ce_out),
     .dout     (dout)
   );

// (3) DUT stimuli
   logic run_sim = 1'b1;

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

real saw = 0;
real saw_step = 0.01;
real saw_amp = 2**16 - 1;
// create sawtooth input
initial begin
   din = 0;
   saw = 0;
   while(run_sim)
   begin
      repeat(10)
      begin
         @(negedge clk50m);
      end
      saw = saw + saw_step;
      din = saw * saw_amp;
   end
end



   initial begin
      $display("-------------------");
      $display("tb_ds_dac started");
      $display("-------------------");
      run_sim = 1'b1;
      rst_n = 1'b0;
      clk_en = 1'b0;
      wait_clks(5);
      rst_n = 1'b1;
      clk_en = 1'b1;

      wait_clks(1200);

      run_sim = 1'b0;
      $display("--------------------");
      $display("tb_ds_dac finished");
      $display("--------------------");
   end

endmodule