/*------------------------------
Projekt: Generic
Purpose: Adjustable 8bit prescaler
Author: ANM
Version: v00, 01.12.2017
--------------------------------*/

module prescaler_8bit(
input   logic               rst_n,
input   logic               clk50m,
input   logic               en,
input   logic [7:0]         preval,
output  logic [7:0]         cnt,
output  logic               cnt_zero
);

assign cnt_zero = (cnt == '0) && en;

always_ff @ (negedge rst_n or posedge clk50m) begin
    if(!rst_n) begin
        cnt <= '1;
    end
    else if (cnt_zero) begin
        cnt <= preval;
    end
    else if (en) begin
        cnt <= cnt - 8'd1;
    end
end




endmodule