
// 6-bit Counter with Enable Signal
`timescale 1 ps / 1 ps
module counter #(parameter LATENCY_CYCLES = 23)
(
    input wire clk,           // Clock signal
    input wire reset,         // Reset signal (active high)
    input wire enable,        // Enable signal
    output reg done
);

reg [5:0] count;
    // Always block triggered on the rising edge of the clock or when reset is active
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 6'd0;     // Reset the counter to 0
        end else if (enable) begin
		if(count == LATENCY_CYCLES-1) begin
			count <= 6'd0;
			done  <= 1'b1;
		end else begin
            		count <= count + 1; // Increment the counter when enabled
			done  <= 1'b0;
		end
        end
    end
endmodule
