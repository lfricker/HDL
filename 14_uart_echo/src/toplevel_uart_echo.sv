//---------------------------------
// Projet : HDL_2020
// Name   : toplevel_uart_echo
// Author : lfr
// Date   : 28.01.2021
//---------------------------------

module toplevel_uart_echo
(
   input       logic          rst_n,
   input       logic          clk,
   input       logic          rx,

   output      logic          tx,
   output      logic          led_rx,
   output      logic          led_tx
);

assign led_tx = tx;
assign led_rx = rx;

uart_echo #( .FCLK = 100000000, .parameter BAUD = 115200, .BUFFER = 4)
(
   .rst_n      (rst_n),
   .clk        (clk),
   .rx         (rx),
   .tx         (tx)
);

endmodule