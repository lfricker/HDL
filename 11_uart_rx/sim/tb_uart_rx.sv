//---------------------------------
// Projet : HDL_2020
// Name   : tb_prescaler
// Author : lfr
// Date   : 29.12.2020
//---------------------------------


module tb_uart_rx ();

// (1)  DUT wiring
   logic       rst_n;
   logic       clk;
   logic       rx;
   logic [7:0] rx_data;
   logic       idle;
   logic       valid;

// (2) Dut instances

uart_rx dut (.*);

// (3) DUT stimuli
   logic run_sim = 1'b1;

   initial begin
      clk = 1'b0;
      while(run_sim) begin
         #10ns;
         clk =~clk;
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

   initial
   begin
      while(run_sim)
      begin
         @(negedge valid)
         $display("%c", rx_data);
      end
   end

   initial begin
      $display("----------------");
      $display("tb_uart_rx started");
      $display("----------------");
      rst_n = 1'b0;
      rx = 'b1;
      #200ns;
      $display("POR");
      rst_n = 1'b1;
      #50us;

      send_string("Hello World, this is my first very cool testbench");

      #100us;
//      #50ns;
//      rx = 1'b0;
//      #40us;
//      rx = 1'b1;
//      #60us;

      #10ns;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_uart_rx finished");
      $display("----------------");
   end

endmodule