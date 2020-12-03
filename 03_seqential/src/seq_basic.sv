



module seq_basic(
   input logic             rst_n,      // acitve low reset
   input logic             clk,        // clock for all FFs, rising edge

   input logic             d,          // input of the D-FF
   input logic  [7:0 ]     regin,      // input of the 8bit register
   input logic             srin,       // input of the shift register

   output logic            q,          // output of the D-FF
   output logic [7:0]      regout,     // Output of the 8bit register
   output logic [7:0]      sr          // shift register
);

// D-FF
   always_ff @ (negedge rst_n or posedge clk)
   begin
      //(1) Async reset -> what happens when rst_n == 1'b0?
      if(!rst_n)
      begin
         q <= 1'b0;
      end
      else
      begin
         q <= d;
      end
   end

// register
   always_ff @ (negedge rst_n or posedge clk)
   begin
      if(!rst_n)
      begin
         regout <= 'b0;
      end
      else
      begin
         regout <= regin;
      end
   end
// Shift Register
   always_ff @ (negedge rst_n or posedge clk)
   begin
      if(!rst_n)
      begin
         sr <= 'b0;
      end
      else
      begin // -> shift in srin at the position of the LSB
         sr <= {sr[6:0], srin};
      end
   end

endmodule