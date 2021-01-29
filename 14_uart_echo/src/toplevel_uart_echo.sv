//---------------------------------
// Projet : HDL_2020
// Name   : toplevel_uart_echo
// Author : lfr
// Date   : 28.01.2021
//---------------------------------

module toplevel_uart_echo
(
   input       logic          rst_n,
   input       logic          clk,
   input       logic          rx,

   output      logic          tx,
   output      logic          led_rx,
   output      logic          led_tx,
	
	output      logic          led_on_board
);

assign led_tx = tx;
assign led_rx = rx;

uart_echo #( .FCLK (500000000), .BAUD (115200), .BUFFER (4)) u0_echo
(
   .rst_n      (rst_n),
   .clk        (clk),
   .rx         (rx),
   .tx         (tx)
);

logic [31:0] cnt;
logic cnt_max;
assign cnt_max = cnt == 31'd50000000;

always_ff @(negedge rst_n or posedge clk)
begin
	if(~rst_n)
	begin
		cnt <= '0;
		led_on_board <= '0;
	end
	else if(cnt_max)
	begin
		cnt <= '0;
		led_on_board <= ~led_on_board;
	end
	else
	begin
		cnt <= cnt + 'b1;
	end
	
end

endmodule