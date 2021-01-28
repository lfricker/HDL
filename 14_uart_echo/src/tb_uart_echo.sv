//---------------------------------
// Projet : HDL_2020
// Name   : tb_uart_echo
// Author : lfr
// Date   : 28.01.2021
//---------------------------------


module tb_uart_echo ();

// (1)  DUT wiring
logic       rst_n;
logic       clk;
logic       rx;
logic       tx;

// (2) Dut instances

uart_echo dut (.*);

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
      $display("tb_uart_echo started");
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

      #10us;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_uart_echo finished");
      $display("----------------");
   end

endmodule