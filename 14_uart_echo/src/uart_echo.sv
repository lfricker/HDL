//---------------------------------
// Projet : HDL_2020
// Name   : uart_echo
// Author : lfr
// Date   : 28.01.2021
//---------------------------------


module uart_echo
#(
   parameter FCLK = 100000000,
   parameter BAUD = 115200,
   parameter BUFFER = 32
)
(
   input    logic       rst_n,
   input    logic       clk,
   input    logic       rx,

   output   logic       tx
);

logic [7:0]    tx_data;
logic          tx_en;
logic          tx_full;
logic          rx_next;
logic [7:0]    rx_data;
logic          rx_empty;

// echo generation
assign tx_data = rx_data;

typedef enum {IDLE, RX_RECEIVED, TX_STARTED, STATE_4} uart_states;
uart_states state;
uart_states state_next;

always_ff @ (negedge rst_n or posedge clk)
begin
   if(~rst_n)
   begin
      state <= IDLE;
   end
   else
   begin
      state <= state_next;
   end
end

always_comb
begin
// default states
   state_next = state;
   tx_en = 0;
   rx_next = 0;

   case(state)
      IDLE:
      begin
         // state 1 action
         if(~rx_empty)
         begin
            state_next = RX_RECEIVED;
         end
      end

      RX_RECEIVED:
      begin
         state_next = TX_STARTED;
         tx_en = 1;
         rx_next = 1;
      end

      TX_STARTED:
      begin
         if(rx_empty)
         begin
            state_next = IDLE;
         end
      end

      default:
      begin
         state_next = IDLE;
      end
   endcase
end



uart_with_buffer #(.FCLK (FCLK), .BAUD (BAUD), .BUFFER_SIZE (BUFFER)) u0_uart
(
   .rst_n         (rst_n),
   .clk           (clk),
   .tx_data       (tx_data),
   .tx_en         (tx_en),
   .tx_full       (tx_full),
   .rx_next       (rx_next),
   .rx_data       (rx_data),
   .rx_empty      (rx_empty),
   .rx            (rx),
   .tx            (tx)
);


endmodule