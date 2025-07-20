// fir_filter.v
module fir_filter (
    input clk,
    input rst,
    input signed [7:0] x,
    output reg signed [15:0] y
);
    parameter N = 8;
    reg signed [7:0] coeffs [0:N-1] = '{8'd2, 8'd5, 8'd12, 8'd22, 8'd22, 8'd12, 8'd5, 8'd2}; // Example coefficients
    reg signed [7:0] shift_reg [0:N-1];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < N; i = i + 1)
                shift_reg[i] <= 0;
            y <= 0;
        end else begin
            for (i = N-1; i > 0; i = i - 1)
                shift_reg[i] <= shift_reg[i-1];
            shift_reg[0] <= x;

            y <= 0;
            for (i = 0; i < N; i = i + 1)
                y <= y + shift_reg[i] * coeffs[i];
        end
    end
endmodule