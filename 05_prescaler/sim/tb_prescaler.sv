/* Header */


module tb_prescaler ();

// (1)  DUT wiring
   logic    rst_n;
   logic    clk50m;

   logic    en_1;
   logic    en_2;

   localparam tb_ratio_1 = 50;
   localparam tb_ratio_2 = 100;

// (2) Dut instances

   prescaler #( .ratio (tb_ratio_1)) dut1
   (
      .rst_n       ,
      .clk50m      ,
      .en          (en_1)
   );
   prescaler #( .ratio (tb_ratio_2)) dut2
   (
      .rst_n       ,
      .clk50m      ,
      .en          (en_2)
   );

// (3) DUT stimuli
   logic run_sim = 1'b1;

   initial begin
      clk50m = 1'b0;
      while(run_sim) begin
         #10ns;
         clk50m =~clk50m;
      end
   end

   initial begin
      $display("----------------");
      $display("tb_prescaler started");
      $display("----------------");
      rst_n = 1'b0;
      #90ns;
      $display("POR");
      rst_n = 1'b1;
      
      $display("Now, lets wait for 2mS");
      #10us;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_prescaler finished");
      $display("----------------");
   end

endmodule