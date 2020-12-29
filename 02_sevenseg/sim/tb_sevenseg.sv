//---------------------------------
// Projet : HDL_2020
// Name   : tb_sevenseg
// Author : lfr
// Date   : 29.12.2020
//---------------------------------


module tb_sevenseg();

// (1) Create wires
logic[3:0] bin;
logic[6:0] hex;
logic[6:0] hexn;

// (2) Connect DUT
sevenseg	dut(
   .*
);

// (3) Test all possible inputs
initial begin
   bin = 4'b0000;
   for (int i = 0 ; i < 16; ++i) begin
      bin = i;
      #1us;
      $display("input: %d\t hex: 0x%02X\t hexn:0x%02X", bin, hex, hexn);
   end
end

endmodule