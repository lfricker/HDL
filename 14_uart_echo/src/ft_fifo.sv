//---------------------------------
// Projet : HDL_2020
// Name   : ft_fifo
// Author : lfr
// Date   : 28.01.2021
//---------------------------------


module ft_fifo
#(
   parameter WIDTH = 8,
   parameter DEPTH = 32
)
(
   input    logic                rst_n,
   input    logic                clk,

   input    logic [WIDTH-1:0]    d_in,
   input    logic                w_en,
   output   logic                full,

   input    logic                r_en,
   output   logic [WIDTH-1:0]    d_out,
   output   logic                empty
);

   localparam CNT_W = $clog2(DEPTH);


   logic [DEPTH-1:0][WIDTH-1:0] data;
   logic [CNT_W:0] d_cnt;
   logic d_cnt_max;
   logic d_cnt_zero;
   assign d_cnt_max = d_cnt == DEPTH;
   assign d_cnt_zero = d_cnt == 0;

   assign d_out = data[0];
   assign full = d_cnt_max;

   always_ff @ (negedge rst_n or posedge clk)
   begin
      if(~rst_n)
      begin
         data <= '0;
         d_cnt <= '0;
         empty <= '1;
      end
      else if(w_en && r_en)
      begin
         // d_cnt stays the same
         // shift the data and place the new data
         data[DEPTH-1:0] <= {1'b0, data[DEPTH-1:1]};
         data[d_cnt] <= d_in;
         empty <= '0;
//         data[d_cnt-1:0] <= {d_in, data[d_cnt-1:1]};
      end
      else if(w_en && ~d_cnt_max)
      begin
         empty <= '0;
         data[d_cnt] <= d_in;
         d_cnt <= d_cnt + 'd1;
      end
      else if(r_en && ~d_cnt_zero)
      begin
         empty <= '0;
         d_cnt <= d_cnt - 'd1;
         data[DEPTH-1:0] <= {1'b0, data[DEPTH-1:1]};
      end
      else if(d_cnt_zero)
      begin
         empty <= '1;
      end
   end

endmodule