

module uart_rx
#(
   parameter FCLK = 50000000,
   parameter BAUD = 115200
)
(
   input    logic       rst_n,
   input    logic       clk,
   input    logic       rx,

   output   logic [7:0] rx_data,
   output   logic       idle,
   output   logic       valid
);

localparam WIDTHCNT_LOAD = (FCLK / BAUD) - 1;
localparam WIDTHCNT_W = $clog2(WIDTHCNT_LOAD);

// counter for baud rate generation
logic [WIDTHCNT_W-1:0] widthCnt;
logic widthCnt_load;
logic widthCnt_zero;
logic widthCnt_sample;
assign widthCnt_zero = (widthCnt == '0) ? 1'b1 : 1'b0;
assign widthCnt_sample = (widthCnt == (WIDTHCNT_LOAD / 2));
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


// rx input shift register
logic [7:0] rx_buffer;
logic sample_rx;
always_ff @(negedge rst_n or posedge clk)
begin
   if(~rst_n)
   begin
      rx_buffer = '0;
   end
   else if(sample_rx)
   begin
      rx_buffer <= {rx, rx_buffer[7:1]};
   end
end


// state machine
typedef enum {IDLE, START, SMPL, DATA, STOP} uart_states;
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

   bitCnt_inc     = 1'b0;
   bitCnt_clear   = 1'b0;
   widthCnt_load  = 1'b0;
   sample_rx      = 1'b0;

   rx_data        = rx_data;
   idle           = 1'b0;
   valid          = 1'b0;

   case(state)
      IDLE:
      begin
         // IDLE
         idle = 1'b1;
         if(~rx)
         begin
            state_next = START;
            widthCnt_load = 1'b1;
         end
      end

      START:
      begin
         // state 2 action
         bitCnt_clear = 1'b1;
         if(widthCnt_zero)
         begin
            widthCnt_load = 1'b1;
            state_next = SMPL;
         end
      end

      SMPL:
      begin
         // state 3 action
         if(widthCnt_sample)
         begin
            state_next = DATA;
            sample_rx = 1'b1;
         end
      end

      DATA:
      begin
         // state 4 action
         if(widthCnt_zero & bitCnt == 7)
         begin
            state_next = STOP;
            widthCnt_load = 1'b1;
         end
         else if (widthCnt_zero)
         begin
            state_next = SMPL;
            bitCnt_inc = 1'b1;
            widthCnt_load = 1'b1;
         end
      end

      STOP:
      begin
         // state 4 action
         if(widthCnt_zero)
         begin
            state_next = IDLE;
            rx_data = rx_buffer;
            valid = 1'b1;
         end
      end

      default:
      begin
         state_next = IDLE;
      end
   endcase
end



endmodule