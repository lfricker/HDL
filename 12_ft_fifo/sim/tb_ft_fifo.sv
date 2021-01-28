//---------------------------------
// Projet : HDL_2020
// Name   : tb_ft_fifo
// Author : lfr
// Date   : 29.12.2020
//---------------------------------


module tb_ft_fifo ();

// (1)  DUT wiring

int WIDHT = 8;

logic                rst_n;
logic                clk;
logic [8-1:0]          d_in;
logic                w_en;
logic                full;
logic                r_en;
logic [8-1:0]         d_out;
logic                empty;

// (2) Dut instances

ft_fifo #(.WIDTH(8), .DEPTH(8)) dut (.*);

// (3) DUT stimuli
   logic run_sim = 1'b1;
   string action;

   initial begin
      clk = 1'b0;
      while(run_sim) begin
         #10ns;
         clk =~clk;
      end
   end

   task push_data(logic [8-1:0] data);
      action = "push";
      d_in = data;
      @(negedge clk);
      w_en = '1;
      @(negedge clk);
      w_en = '0;
      @(negedge clk);
   endtask

   task get_data();
      action = "get";
      $display("%c", d_out);
      @(negedge clk);
      r_en = '1;
      @(negedge clk);
      r_en = '0;
      @(negedge clk);
   endtask

   task push_get_data(logic [7:0] din);
      action = "push_get";
      $display("%c", d_out);
      d_in = din;
      @(negedge clk);
      r_en = '1;
      w_en = '1;
      @(negedge clk);
      r_en = '0;
      w_en = '0;
      @(negedge clk);
   endtask

   initial begin
      $display("----------------");
      $display("tb_ft_fifo started");
      $display("----------------");
      rst_n = 1'b0;
      d_in = '0;
      w_en = '0;
      r_en = '0;
      action = "POR";
      #200ns;
      $display("POR");
      rst_n = 1'b1;
      #50ns;

      push_data("T");
      push_data("e");
      push_data("s");
      push_data("t");
      push_data(" ");
      push_data("T");
      push_data("e");
      push_data("s");
      push_data("t");
      push_data(" ");

      push_get_data(" ");
      push_get_data("T");
      push_get_data("e");
      push_get_data("s");
      push_get_data("t");

      get_data();
      get_data();
      get_data();
      get_data();

      #10ns;
      run_sim = 1'b0;
      $display("----------------");
      $display("tb_ft_fifo finished");
      $display("----------------");
   end

endmodule