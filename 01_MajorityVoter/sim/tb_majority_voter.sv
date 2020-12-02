//------------------------------------------------------------------------------
//
// Project: MajorityVoter
// Autor:   lfricker
// Date:    26.11.2020
// Version: 00.01
//------------------------------------------------------------------------------



module tb_majority_voter ();


// wiring
logic    x2;
logic    x1;
logic    x0;
logic   y;
logic   y2;

// connection
majority_voter dut (.*);

// stimulate


initial begin
   x2 = 0;
   x1 = 0;
   x0 = 0;
   
   #100ns;

   x2 = 1;
   x1 = 1;
   x0 = 1;

   #100ns;

   $display("use for loop for all possibilities");
   for(int i = 0; i < 8; ++i) begin
      {x2,x1,x0} = i;
      #100ns;
   end
end



// check


endmodule