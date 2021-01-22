/*------------------------------
Projekt: Generic
Purpose: Prescaler from 50MHz to 100Hz
Author: ANM
Version: v00, 01.10.2017
--------------------------------*/

module prescaler_50m_1m(
    input   logic           rst_n,
    input   logic           clk50m,
    output  logic           en50m_1m
);

logic [15:0]    cnt;
logic           cnt_zero;
assign cnt_zero = ~|cnt;

always_ff @ (negedge rst_n or posedge clk50m) begin
    if (~rst_n) begin
        cnt <= 16'd49;
        en50m_1m <= 1'b0;
    end
    else if (cnt_zero) begin
        cnt <= 16'd49;
        en50m_1m <= 1'b1;
    end
    else begin
        cnt <= cnt - 16'd1;
        en50m_1m <= 1'b0;
    end
end


endmodule