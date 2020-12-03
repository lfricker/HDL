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
logic run = 1;

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
   per = 31;

   $display("cmp:\t%d", cmp);
   $display("per:\t%d", per);
   $display("down:\t%d", down);
   $display("en:\t%d", en);

   #50ns;
   rst_n = 1;
   #10us;
   down = 1;
   #10us;
   run = 0;
end

endmodule