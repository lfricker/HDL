//--------------------------------------
// Project: HDL_2020
// Purpose: Testbench for debounce
// Author : lfr
// Date   : 29.12.2020
//-------------------------------------- 


module tb_debounce ();

// (1)  DUT wiring
logic   rst_n;
logic   clk50m;
logic   sw;
logic   sw_hi;
logic   sw_lo;
logic   sw_dbnc;

// (2) Dut instance

   debounce dut(.*);

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



   initial begin
      $display("-------------------");
      $display("tb_debounce started");
      $display("-------------------");
      rst_n = 1'b0;
      sw = 1'b0;
      #90ns;
      $display("POR");
      rst_n = 1'b1;

      $display("Generate the Switch Pulses");

      wait_clks(12);
      sw = 1'b1;
      wait_clks(5);
      sw = 1'b0;
      wait_clks(1);
      sw = 1'b1;
      wait_clks(3);
      sw = 1'b0;
      wait_clks(5);
      sw = 1'b1;
      wait_clks(2);
      sw = 1'b0;
      wait_clks(15);
      sw = 1'b1;
      wait_clks(15);
      sw = 1'b0;
      wait_clks(5);


      run_sim = 1'b0;
      $display("--------------------");
      $display("tb_debounce finished");
      $display("--------------------");
   end

endmodule