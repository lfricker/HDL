//---------------------------------
// Projet : HDL_2020
// Name   : tb_counter_pwm
// Author : lfr
// Date   : 29.12.2020
//---------------------------------

module tb_counter_pwm();

// (1) Create wires
logic          rst_n;
logic          clk50m;
logic          en;
logic          down;
logic [5-1:0]  cmp;
logic [5-1:0]  per;
logic [5-1:0]  cnt;
logic          pwm;

// (2) Connect DUT
counter_pwm #(.W(5)) dut (.*);

// (3) Test

task wait_clks(input int clks);
   repeat(clks)
   begin
      @(negedge clk50m);
   end
endtask

logic run = 1;
string action = "POR";

initial
begin
   clk50m = 0;
   while(run)
   begin
      clk50m = ~clk50m;
      #20ns;
   end
end

initial
begin
   rst_n = 0;
   en = 0;
   down = 0;
   cmp = 18;
   per = '1;

   $display("cmp:\t%d", cmp);
   $display("per:\t%d", per);
   $display("down:\t%d", down);
   $display("en:\t%d", en);

   wait_clks(10);
   $display("counting up 50 times");
   action = "UP";
   rst_n = 1;
   wait_clks(50);
   $$display("counting down 100 times");
   action = "DOWN";
   down = 1;
   wait_clks(100);
   $display("set cmp all zeros for 100 clks / cnt up");
   action = "UP ALL ZERO";
   down = 0;
   cmp = '0;
   wait_clks(100);
   $display("set cmp all ones for 100 clks / cnt down");
   action = "DOWN ALL ONES";
   down = 1;
   cmp = '1;
   wait_clks(100);
   $display("set cmp 5'b10000 for 100 clks cnt up");
   action = "UP 5'b10000";
   down = 0;
   cmp = 5'b10000;
   wait_clks(100);
   $display("set cmp 8 for 35 clks cnt up");
   action = "CMP 8";
   cmp = 8;
   wait_clks(35);
   action = "PER 15";
   per = 15;
   wait_clks(30);

   $display("tb_counter_pwm complete!");
   run = 0;
end

endmodule