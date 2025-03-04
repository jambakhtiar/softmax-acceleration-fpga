
`timescale 1ns / 1ps

module softmax_16p_tb;
    // Parameters
    parameter TOTAL_WORDS = 16;
    parameter PARALLEL_FACTOR = 16;
    
    // Inputs
    reg clk;
    reg rst;
    reg [511:0] data_in;
    
    // Outputs
    wire [511:0] data_out;
    
    // Instantiate the softmax_16p module
    softmax_16p #(
        .TOTAL_WORDS(TOTAL_WORDS),
        .PARALLEL_FACTOR(PARALLEL_FACTOR)
    ) uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        data_in = 0;
        
        // Reset sequence
        #10 rst = 0;
        
        // Apply test vector
        //data_in = {16{32'h00010000}}; // Example: 16 identical 32-bit words
        data_in = {32'h00000000,32'h00000000,32'h00000000,32'h00000000,
		   32'h00000000,32'h00000000,32'h41000000, 32'h40E00000,
		   32'h40C00000,32'h40A00000,32'h40800000, 32'h40400000,
		   32'hC0000000,32'h40400000,32'h40000000, 32'h3F800000}; 
        // Wait for processing
        #100;
        
        // Apply another test vector
       // data_in = {16{32'h00020000}};
        
        // Wait and observe output
        #500;
        
        // Finish simulation
        $stop;
    end
    
endmodule
