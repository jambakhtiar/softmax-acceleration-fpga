module reg32 (
    input wire clk,        // Clock signal
    input wire rst,        // Active-high reset signal
    input wire en,         // Enable signal
    input wire [31:0] d,   // 32-bit input data
    output reg [31:0] q    // 32-bit output data
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 32'b0; // Reset register to 0
        else if (en)
            q <= d;     // Load new data when enable is high
    end

endmodule
