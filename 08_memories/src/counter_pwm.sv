//---------------------------------
// Projet : HDL_2020
// Name   : counter_pwm
// Author : lfr
// Date   : 29.12.2020
//---------------------------------


module counter_pwm #(parameter W)
(
input logic          rst_n,
input logic          clk50m,
input logic          en,
input logic          down,
input logic [W-1:0]  cmp,
input logic [W-1:0]  per,

output logic [W-1:0] cnt,
output logic         pwm
);

logic cntzero;
logic cntcmp;

assign cntzero = (cnt == 'b0);
assign cntmax  = (cnt >= per-1);

assign pwm = (cnt < cmp) ? 1'b1 : 1'b0;

// counter
always_ff @ (negedge rst_n or posedge clk50m)
begin
   if(!rst_n)
   begin
      cnt <= 'b0;
   end
   else if(en)
   begin
      if(!down)
      begin
         if(cntmax)
         begin
            cnt <= 0;
         end
         else
         begin
            cnt <= cnt + 'b1;
         end
      end
      else
      begin
         if(cntzero)
         begin
            cnt <= per -1;
         end
         else
         begin
            cnt <= cnt - 'b1;
         end
      end
   end
end

endmodule