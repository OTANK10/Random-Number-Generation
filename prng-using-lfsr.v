// 6-bit LFSR with polynomial x^6 + x^5 + 1
module LFSR_PRNG (
    input clk,
    input rst,
    output wire [2:0] out
);

reg [6:0] D123456;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        D123456 <= 7'b1;  // Non-zero seed
    end else begin
        // Feedback polynomial: (x^6) + (x^5) + 1
        D123456 <= {D123456[5:0], D123456[6] ^ D123456[5] ^ 1'b1};
    end
end

// Output bits 2, 4, and 6 as PRNG output
assign out = D123456[6] ? D123456[4:2] : 3'b0;

endmodule
