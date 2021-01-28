//---------------------------------
// Projet : HDL_2020
// Name   : uart_tx
// Author : lfr
// Date   : 21.01.2021
//---------------------------------


module uart_tx
#(
   parameter FCLK = 100000000,
   parameter BAUD = 115200
)
(
   input logic                rst_n,
   input logic                clk,
   input logic  [7:0]         tx_data,
   input logic                tx_start,

   output logic               tx,
   output logic               idle
);

localparam WIDTHCNT_LOAD = (FCLK / BAUD) - 1;
localparam WIDTHCNT_W = $clog2(WIDTHCNT_LOAD);

// counter for baud rate generation
logic [WIDTHCNT_W-1:0] widthCnt;
logic widthCnt_load;
logic widthCnt_zero;
assign widthCnt_zero = (widthCnt == '0) ? 1'b1 : 1'b0;
always_ff @ (negedge rst_n or posedge clk)
begin
   if(~rst_n)
   begin
      widthCnt <= WIDTHCNT_LOAD;
   end
   else if (widthCnt_load)
   begin
      widthCnt <= WIDTHCNT_LOAD;
   end
   else if (~widthCnt_zero)
   begin
      widthCnt <= widthCnt - 1'b1;
   end
end

// counter for bit sequencing switching
logic [2:0] bitCnt;
logic bitCnt_inc;
logic bitCnt_clear;
always_ff @ (negedge rst_n or posedge clk)
begin
   if(~rst_n)
   begin
      bitCnt <= '0;
   end
   else if(bitCnt_clear)
   begin
      bitCnt <= '0;
   end
   else if(bitCnt_inc)
   begin
      bitCnt <= bitCnt + 1'b1;
   end
end

//state machine

typedef enum {IDLE, START, DATA, STOP} uart_states;
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

logic [7:0] tx_buffer;

always_comb
begin
// idle zustände
   bitCnt_clear   = 'b0;
   bitCnt_inc     = 'b0;
   widthCnt_load  = 'b0;

   tx_buffer = tx_buffer;
   // tx is idle HIGH
   tx             = 'b1;
   idle           = 'b0;

   state_next = state;

   case(state)
      IDLE:
      begin
         idle = 1'b1;
         if(tx_start)
         begin
            tx_buffer = tx_data;
            widthCnt_load = 'b1;
            state_next = START;
         end
      end

      START:
      begin
         tx = 0;
         if(widthCnt_zero)
         begin
            widthCnt_load = 'b1;
            bitCnt_clear = 'b1;
            state_next = DATA;
         end
      end

      DATA:
      begin
         tx = tx_buffer[bitCnt];
         if((bitCnt >= 7) && widthCnt_zero)
         begin
            state_next = STOP;
            widthCnt_load = 'b1;
         end
         else if(widthCnt_zero)
         begin
            widthCnt_load = 'b1;
            bitCnt_inc = 'b1;
         end
      end

      STOP:
      begin
         if(widthCnt_zero)
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

endmodule