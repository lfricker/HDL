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

   assign tx_data = rx_data;

   // internal echo
   initial begin
      tx_en = '0;
      rx_next = '0;
      while(run_sim)
      begin
         @(negedge rx_empty)
         begin
            @(negedge clk)
            begin
               tx_en = 1'b1;
               rx_next = 1'b1;
            end
            @(negedge clk)
            begin
               tx_en = 1'b0;
               rx_next = 1'b0;
            end
         end
      end
   end


int cnt;
   task send_byte(input logic[7:0] data);
      cnt = 0;
      rx = 1'b0;
      #8680ns;
      repeat(8)
      begin
         rx = data[cnt];
         #8680ns;
         cnt += 1;
      end
      rx = 1'b1;
      #8680ns;
   endtask
int stringCnt;
   task send_string(input string data);
      stringCnt = 0;
      while(data[stringCnt] != 0)
      begin
         send_byte(data[stringCnt]);
         stringCnt += 1;
      end
   endtask

   initial begin
      $display("----------------");
      $display("tb_uart_with_buffer started");
      $display("----------------");
      rst_n = 1'b0;

      rx = '1;
      action = "POR";

      #200ns;
      $display("POR");
      rst_n = 1'b1;

      #50ns;
      action = "input data";

      send_string("Test echo   \0");

#1ms;

      #10us;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_uart_with_buffer finished");
      $display("----------------");
   end

endmodule