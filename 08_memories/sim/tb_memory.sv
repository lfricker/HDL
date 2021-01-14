//---------------------------------
// Projet : HDL_2020
// Name   : tb_memory
// Author : lfr
// Date   : 14.01.2021
//---------------------------------

module tb_memory ();

// (1)  DUT wiring
logic          clk;
logic [4:0]    addr;
logic          we;
logic [9:0]    data_in;
logic [9:0]    data_out;

// (2) Dut instance

   memory u0_memory(.*);

// (3) DUT stimuli
   logic run_sim = 1'b1;
   logic clk50m;
   assign clk = clk50m;

   task wait_clks(input int clks);
      repeat(clks)
      begin
         @(negedge clk50m);
      end
   endtask

   task write_data(input int write_addr, input int data);
      $display("writing %d to storage cell %d", data, write_addr);
      data_in = data;
      addr = write_addr;
      @ (negedge clk) we = '1;
      @ (negedge clk) we = '0;
   endtask

   task read_data(input int read_addr);
      @ (negedge clk);
      we = 0;
      addr = read_addr;
      @ (negedge clk);
      $display("read from %d: %d", read_addr, data_out);
   endtask

   initial begin
      clk50m = 1'b0;
      while(run_sim) begin
         #10ns;
         clk50m =~clk50m;
      end
   end

   initial begin
      $display("-------------------");
      $display("tb_memory started");
      $display("-------------------");
      run_sim = 1'b1;
      addr = '0;
      we = 0;
      data_in = '0;
      wait_clks(5);

      // Use $redmemh to define the memory content
      $readmemh("memory_set_all_3ff.txt", tb_memory.u0_memory.mem);

      write_data(0,  10);
      write_data(1,  15);
      write_data(2,  8);
      write_data(9,  150);
      write_data(31, 923);
      write_data(10, 'h3FF);

      wait_clks(5);

      read_data(0);
      read_data(1);
      read_data(2);
      read_data(9);
      read_data(31);

      for(int i = 0; i < 32; ++i)
      begin
         read_data(i);
      end

      wait_clks(5);

      run_sim = 1'b0;
      $display("--------------------");
      $display("tb_memory finished");
      $display("--------------------");
   end

endmodule