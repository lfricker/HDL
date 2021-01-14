//---------------------------------
// Projet : HDL_2020
// Name   : prescaler
// Author : lfr
// Date   : 29.12.2020
//---------------------------------


module prescaler
#(
   parameter ratio
)
(
   input logic rst_n,
   input logic clk,

   output logic en
);

localparam preload = ratio - 1;
localparam w = $clog2(preload);

logic [w:0] cnt;
logic cntzero;

assign cntzero = cnt == '0;

always_ff @ (negedge rst_n or posedge clk)
begin
   if(~rst_n)
   begin
      cnt <= preload;
      en <= 1'b0;
   end
   else if(cntzero)
   begin
      cnt <= preload;
      en <= 1'b1;
   end
   else
   begin
      cnt <= cnt - 'b1;
      en <= 1'b0;
   end
end

endmodule