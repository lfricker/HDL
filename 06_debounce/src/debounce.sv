//---------------------------------
// Projet : HDL_2020
// Name   : debounce
// Author : lfr
// Date   : 29.12.2020
//---------------------------------

`include "debounce.sh"

module debounce (
   input    logic   rst_n,
   input    logic   clk50m,
   input    logic   sw,
   
   output   logic   sw_hi,
   output   logic   sw_lo,
   output   logic   sw_dbnc
);

   logic [`BITS-1:0] sw_hi_cnt;
   logic             sw_hi_cnt_zero;
   logic [`BITS-1:0] sw_lo_cnt;
   logic             sw_lo_cnt_zero;

   assign sw_hi_cnt_zero = sw_hi_cnt == 'b0;
   assign sw_lo_cnt_zero = sw_lo_cnt == 'b0;

   always_ff @(negedge rst_n or posedge clk50m)
   begin
      if(~rst_n)
      begin
         sw_hi_cnt            <= '1;
         sw_lo_cnt            <= '1;
         sw_lo                <= 'b0;
         sw_hi                <= 'b0;
         sw_dbnc              <= 'b0;
      end
      else if(sw == 1'b0)
      begin
         sw_hi_cnt <= '1;
         sw_hi     <= '0;
         if(sw_lo_cnt == 'd1)
         begin
            sw_lo_cnt <= '0;
            sw_lo <= 'b1;
         end
         else if(sw_lo_cnt_zero)
         begin
            sw_lo <= 'b0;
         end
         else
         begin
            sw_lo_cnt <= sw_lo_cnt - 'b1;
         end
      end
      else if(sw == 1'b1)
      begin
         sw_lo_cnt <= '1;
         sw_lo     <= '0;
         if(sw_hi_cnt == 'd1)
         begin
            sw_hi_cnt <= '0;
            sw_hi <= 'b1;
         end
         else if(sw_hi_cnt_zero)
         begin
            sw_hi <= 'b0;
         end
         else
         begin
            sw_hi_cnt <= sw_hi_cnt - 'b1;
         end
      end
   end

endmodule