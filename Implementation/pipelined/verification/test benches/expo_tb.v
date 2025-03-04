
// Testbench for the expo module

`timescale 1 ps / 1 ps

module expo_tb;

    // Testbench signals
    reg clk;
    reg areset;
    reg [31:0] a;
    wire [31:0] q;

    // Instantiate the module under test
    expo uut (
        .clk(clk),
        .areset(areset),
        .a(a),
        .q(q)
    );

    // Clock generation
    initial clk = 0;
    always #2 clk = ~clk; // 250 MHz clock (10 ns period)

    // Test sequence
    initial begin
        // Initialize inputs
        areset = 1;  // Assert reset
        //a = 32'b0;   // Initialize input to zero

        #15;         // Wait for some clock cycles
        areset = 0;  // Deassert reset

        // Apply test cases
        #4 a = 32'h3F800000; // Input: 1.0 in IEEE 754 single-precision
        #4 a = 32'h40000000; // Input: 2.0 in IEEE 754 single-precision
        #4 a = 32'h40400000; // Input: 3.0 in IEEE 754 single-precision
        #4 a = 32'hC0000000; // Input: -2.0 in IEEE 754 single-precision

        // Additional test cases can be added here

        #200; // Wait before ending simulation
        $stop; // End simulation
    end

endmodule
