module tb_sevenseg();

// (1) Create wires
logic[3:0] in;
logic[6:0] out;
logic[6:0] outn;

// (2) Connect DUT
sevenseg	dut(
   .*
);

// (3) Test all possible inputs
initial begin
   in = 4'b0000;
   for (int i = 0 ; i < 16; ++i) begin
      in = i;
      #1us;
      $display("input: %d\t out: 0x%02X\t outn:0x%02X", in, out, outn);
   end
end

endmodule