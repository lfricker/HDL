//---------------------------------
// Projet : HDL_2020
// Name   : tb_prescaler
// Author : lfr
// Date   : 29.12.2020
//---------------------------------


module tb_uart_tx ();

// (1)  DUT wiring
   logic                rst_n;
   logic                clk;
   logic  [7:0]         tx_data;
   logic                tx_start;
   logic                tx;
   logic                idle;

// (2) Dut instances

uart_tx dut (.*);

// (3) DUT stimuli
   logic run_sim = 1'b1;

   initial begin
      clk = 1'b0;
      while(run_sim) begin
         #10ns;
         clk =~clk;
      end
   end

   task send_single_bit(input int data);
      tx_data = data;
      @(negedge clk) tx_start = 1'b1;
      @(negedge clk) tx_start = 1'b0;
      @(posedge idle);
   endtask

   initial begin
      $display("----------------");
      $display("tb_uart_tx started");
      $display("----------------");
      rst_n = 1'b0;
      tx_data = 'b0;
      tx_start = 'b0;
      #200ns;
      $display("POR");
      rst_n = 1'b1;

      #50ns;
      tx_data = 'hAA;
      send_single_bit('hAA);
      send_single_bit('h55);
      send_single_bit('h00);
      send_single_bit('hFF);

      #10us;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_uart_tx finished");
      $display("----------------");
   end

endmodule