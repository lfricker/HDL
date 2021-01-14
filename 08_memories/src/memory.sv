//---------------------------------
// Projet : HDL_2020
// Name   : memory
// Author : lfr
// Date   : 14.01.2021
//---------------------------------

// 10bit wide, 32 entries (5bit address)

module memory
(
   input    logic          clk,

   input    logic [4:0]    addr,
   input    logic          we,   // write enable
   input    logic [9:0]    data_in,
   output   logic [9:0]    data_out
);

   // define the memory
   logic [9:0] mem [0:31];
   // 10bit wide and 32 entries (deep)

   always_ff @ (posedge clk)
   begin
      // no reset -> after POR the mem content is random
      if (we)
      begin
         mem[addr] <= data_in;
      end
   end

   // read from addr
   assign data_out = mem[addr];

endmodule