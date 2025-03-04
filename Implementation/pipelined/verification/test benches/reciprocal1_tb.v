
`timescale 1 ps / 1 ps

module reciprocal1_tb;

    // Testbench signals
    reg         clk;
    reg         areset;
    reg  [31:0] a;
    wire [31:0] q;

    // Instantiate the reciprocal1 module
    reciprocal1 uut (
        .clk(clk),
        .areset(areset),
        .a(a),
        .q(q)
    );

    // Clock generation
    always #2 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize signals
        clk = 0;
        areset = 0;
        a = 32'b0;

        // Apply reset
        $display("Applying reset...");
        areset = 1;
        #10;
        areset = 0;
        $display("Reset de-asserted.");

        // Test case 1: Reciprocal of 1 (should output 1)
        a = 32'h3F800000; // IEEE-754 representation of 1.0
        #20;
        $display("Input: %h, Output: %h", a, q);

        // Test case 2: Reciprocal of 2 (should output 0.5)
        #20 a = 32'h40000000; // IEEE-754 representation of 2.0
        #20;
        $display("Input: %h, Output: %h", a, q);

        // Test case 3: Reciprocal of 0.5 (should output 2.0)
        a = 32'h3F000000; // IEEE-754 representation of 0.5
        #20;
        $display("Input: %h, Output: %h", a, q);

        // Test case 4: Reciprocal of 0 (should output infinity)
        a = 32'h00000000; // IEEE-754 representation of 0.0
        #20;
        $display("Input: %h, Output: %h", a, q);

        // Test case 5: Reciprocal of infinity (should output 0)
        a = 32'h7F800000; // IEEE-754 representation of infinity
        #20;
        $display("Input: %h, Output: %h", a, q);

        // Test case 6: Reciprocal of NaN (should output NaN)
        a = 32'h7FC00000; // IEEE-754 representation of NaN
        #20;
        $display("Input: %h, Output: %h", a, q);

        // End simulation
        $display("Simulation complete.");
        $stop;
    end

endmodule
