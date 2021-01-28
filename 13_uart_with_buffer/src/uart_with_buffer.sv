//---------------------------------
// Projet : HDL_2020
// Name   : uart_with_buffer
// Author : lfr
// Date   : 28.01.2021
//---------------------------------

module uart_with_buffer
#(
   parameter FCLK = 100000000,
   parameter BAUD = 115200,
   parameter BUFFER_SIZE = 32
)
(
   input    logic          rst_n,
   input    logic          clk,

   input    logic [7:0]    tx_data,
   input    logic          tx_en,
   output   logic          tx_full,

   input    logic          rx_next,
   output   logic [7:0]    rx_data,
   output   logic          rx_empty,

   input    logic          rx,
   output   logic          tx
);

// signals
logic [7:0] tx_intern;
logic [7:0] rx_intern;
logic       tx_next;
logic       tx_empty;
logic       rx_complete;

// submodules

ft_fifo #( .WIDTH (8), .DEPTH (BUFFER_SIZE)) rx_fifo
(
   .rst_n      (rst_n),
   .clk        (clk),
   .d_in       (rx_intern),
   .w_en       (rx_complete),
   .full       (),
   .r_en       (rx_next),
   .d_out      (rx_data),
   .empty      (rx_empty)
);

ft_fifo #( .WIDTH (8), .DEPTH (BUFFER_SIZE)) tx_fifo
(
   .rst_n      (rst_n),
   .clk        (clk),
   .d_in       (tx_data),
   .w_en       (tx_en),
   .full       (tx_full),
   .r_en       (tx_next),
   .d_out      (tx_intern),
   .empty      (tx_empty)
);

uart_rx #(.FCLK (FCLK), .BAUD (BAUD)) u0_uart_rx
(
   .rst_n      (rst_n),
   .clk        (clk),
   .rx         (rx),
   .rx_data    (rx_intern),
   .idle       (),
   .valid      (rx_complete)
);

uart_tx #(.FCLK (FCLK), .BAUD (BAUD)) u0_uart_tx
(
   .rst_n      (rst_n),
   .clk        (clk),
   .tx_data    (tx_intern),
   .tx_start   (~tx_empty),
   .tx         (tx),
   .idle       (tx_next)
);

// additional logic


endmodule