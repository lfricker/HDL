//--------------------------------------
// Project: Sequential logic
// Purpose: Testbench for toggle FF with enable input
// Author : Luka
// Version: v0, 1.10.2018
//-------------------------------------- 

module tb_seq_basic();
logic             rst_n;
logic             clk;
logic [7:0]       regin;
logic             d;
logic             srin;
logic             q;
logic [7:0]       regout;
logic [7:0]       sr;


// (2) DUT instance
	seq_basic dut(.*);

// (3) DUT stimuli
logic	run_sim =1'b1;
string action = "init";

// --- clock source ---
initial
begin
   clk = 1'b0;
   while(run_sim) begin
      #10ns
      clk = ~ clk;
   end
end

initial begin

   $display("tb_seq_basic %s", action);
      action = "POR";
   rst_n       = 'b0;
   d           = 'b0;
   regin       = 'b0;
   srin        = 'b0;

   #50ns;
      action = "STIM1";
   rst_n = 'b1;
   @(negedge clk);
   regin = 8'h0F;
   srin  = 'b1;
   d     = 'b1;

   @(negedge clk);
      action = "STIM2";
   regin = 8'hF0;
   srin  = 'b0;
   d     = 'b0;

   @(negedge clk);

      action = "Wait10Clk";
   repeat(10)
   begin
      @(negedge clk);
   end

   d = 'b1;
   srin = 'b1;

   action = "done";
   #100ns;
   // stop simulation
   run_sim = 1'b0;
   $$display("tb_seq_basic done");

end
	
	
// (4) DUT checkers (if any)


endmodule