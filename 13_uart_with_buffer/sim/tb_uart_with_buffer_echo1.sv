//---------------------------------
// Projet : HDL_2020
// Name   : tb_uart_with_buffer
// Author : lfr
// Date   : 28.01.2021
//---------------------------------


module tb_uart_with_buffer ();

// (1)  DUT wiring
logic          rst_n;
logic          clk;
logic [7:0]    tx_data;
logic          tx_en;
logic          tx_full;
logic          rx_next;
logic [7:0]    rx_data;
logic          rx_empty;
logic          rx;
logic          tx;

// (2) Dut instances

uart_with_buffer dut (.*);

// (3) DUT stimuli
   logic run_sim = 1'b1;
   string action;

   initial begin
      clk = 1'b0;
      while(run_sim) begin
         #5ns;
         clk =~clk;
      end
   end

   // straight echo
   assign rx = tx;

   task send_single_bit(input int data);
      tx_data = data;
      @(negedge clk) tx_en = 1'b1;
      @(negedge clk) tx_en = 1'b0;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
   endtask

   initial begin
      $display("----------------");
      $display("tb_uart_with_buffer started");
      $display("----------------");
      rst_n = 1'b0;

      tx_data = '0;
      tx_en = '0;
      rx_next = '0;
      action = "POR";

      #200ns;
      $display("POR");
      rst_n = 1'b1;

      #50ns;
      action = "input data";
      send_single_bit("A");
      send_single_bit("B");
      send_single_bit("C");
      send_single_bit("D");

      action = "wait for echo";
      @(negedge rx_empty);
      $display("%c received", rx_data);
      @(negedge clk) rx_next = 1'b1;
      @(negedge clk) rx_next = 1'b0;
      action = "First Received";
      @(negedge rx_empty);
      $display("%c received", rx_data);
      @(negedge clk) rx_next = 1'b1;
      @(negedge clk) rx_next = 1'b0;
      action = "Second Received";
      @(negedge rx_empty);
      $display("%c received", rx_data);
      @(negedge clk) rx_next = 1'b1;
      @(negedge clk) rx_next = 1'b0;
      action = "Third Received";
      @(negedge rx_empty);
      $display("%c received", rx_data);
      @(negedge clk) rx_next = 1'b1;
      @(negedge clk) rx_next = 1'b0;
      action = "Forth Received";

      #10us;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_uart_with_buffer finished");
      $display("----------------");
   end

endmodule