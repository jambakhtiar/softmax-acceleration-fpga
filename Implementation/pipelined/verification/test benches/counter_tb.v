
`timescale 1ps/1ps

module counter_tb;

    // Parameters
    parameter LATENCY_CYCLES = 23;

    // Testbench signals
    reg clk;
    reg reset;
    reg enable;
    wire done;

    // Instantiate the counter module
    counter #(LATENCY_CYCLES) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .done(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock
    end

    // Test procedure
    initial begin
        // Initialize inputs
        reset = 1;
        enable = 0;

        // Wait for some clock cycles
        #20;

        // Release reset
        reset = 0;
        #10;

        // Enable the counter
        enable = 1;
        #((LATENCY_CYCLES + 1) * 10); // Wait for the counter to reach LATENCY_CYCLES

        // Disable the counter
        enable = 0;
        #20;

        // Apply reset again
        reset = 1;
        #20;

        // End simulation
        $stop;
    end

endmodule
