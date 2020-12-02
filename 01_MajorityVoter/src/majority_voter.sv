//------------------------------------------------------------------------------
//
// Project: MajorityVoter
// Autor:   lfricker
// Date:    26.11.2020
// Version: 00.01
//------------------------------------------------------------------------------



module majority_voter
(
   input logic    x2,
   input logic    x1,
   input logic    x0,

   output logic   y,
   output logic   y2
);

logic [2:0] xBus;
assign xBus = {x2,x1,x0};

//assign y = ((x0 + x1 + x2) > 1) ? 1 : 0;
assign y = x2&x0 | x2&x1 | x1&x0 | x2&x1&x0;


always_comb begin
   // default value
   y2 = 1'b0;

   case (xBus)
      3'b011: y2 = 1'b1;
      3'b101: y2 = 1'b1;
      3'b110: y2 = 1'b1;
      3'b111: y2 = 1'b1;
   endcase

end




endmodule
