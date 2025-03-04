
`timescale 1ns / 1ps

module adder1 (
    input clock,
    input [31:0] dataa,
    input [31:0] datab,
    output reg [31:0] result
);

    // Internal signals
    reg [7:0] exp_a, exp_b, exp_res;
    reg [23:0] mant_a, mant_b, mant_res;
    reg sign_a, sign_b, sign_res;
    reg [7:0] exp_diff;
    reg [24:0] aligned_mant;

    always @(posedge clock) begin
        // Extract fields
        sign_a = dataa[31];
        sign_b = datab[31];
        exp_a = dataa[30:23];
        exp_b = datab[30:23];
        mant_a = {1'b1, dataa[22:0]}; // Implicit leading 1
        mant_b = {1'b1, datab[22:0]};

        // Align exponents
        if (exp_a > exp_b) begin
            exp_diff = exp_a - exp_b;
            mant_b = mant_b >> exp_diff;
            exp_res = exp_a;
        end else begin
            exp_diff = exp_b - exp_a;
            mant_a = mant_a >> exp_diff;
            exp_res = exp_b;
        end

        // Addition/Subtraction
        if (sign_a == sign_b) begin
            mant_res = mant_a + mant_b;
            sign_res = sign_a;
        end else begin
            if (mant_a > mant_b) begin
                mant_res = mant_a - mant_b;
                sign_res = sign_a;
            end else begin
                mant_res = mant_b - mant_a;
                sign_res = sign_b;
            end
        end

        // Normalization
        if (mant_res[24]) begin
            mant_res = mant_res >> 1;
            exp_res = exp_res + 1;
        end
        
        // Pack result
        result = {sign_res, exp_res, mant_res[22:0]};
    end

endmodule
