//---------------------------------
// Projet : HDL_2020
// Name   : counter_pwm
// Purpose: PWM Counter module
// Author : lfr
// Version: v00, 03.12.2020 -- initial
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

assign pwm = (cnt < cmp) ? 1'b1 : 1'b0;

// counter
always_ff @ (negedge rst_n or posedge clk50m)
begin
   if(!rst_n)
   begin
      cnt <= 'b0;
   end
   else if(!down)
   begin
      if(cnt == per)
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
      if(cnt == 'b0)
      begin
         cnt <= per;
      end
      else
      begin
         cnt <= cnt - 'b1;
      end
   end
end

endmodule