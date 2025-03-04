
`timescale 1ns / 1ps

module multiplier1_tb;

    // Testbench signals
    reg         clk;
    reg         areset;
    reg  [31:0] a;
    reg  [31:0] b;
    wire [31:0] q;

    // Instantiate the multiplier1 module
    multiplier1 uut (
        .clk(clk),
        .areset(areset),
        .a(a),
        .b(b),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize signals
        clk = 0;
        areset = 0;
        a = 32'b0;
        b = 32'b0;

        // Apply reset
        $display("Applying reset...");
        areset = 1;
        #10;
        areset = 0;
        $display("Reset de-asserted.");



        // Test case 1: Multiplication of -1 and 1 (two's complement)
        a = 32'hFFFFFFFF; // -1
        b = 32'h00000001; // 1
        #20;
        $display("Input: a=%h, b=%h, Output: q=%h", a, b, q);

        // Test case 2: Multiplication of large values
        a = 32'h7FFFFFFF; // Maximum positive 32-bit integer
        b = 32'h00000002; // 2
        #20;
        $display("Input: a=%h, b=%h, Output: q=%h", a, b, q);

        // Test case 3: Multiplication of small and large values
        a = 32'h00000001; // 1
        b = 32'hFFFFFFFF; // -1
        #20;
        $display("Input: a=%h, b=%h, Output: q=%h", a, b, q);

        // End simulation
        $display("Simulation complete.");
        #200 $stop;
    end

endmodule
