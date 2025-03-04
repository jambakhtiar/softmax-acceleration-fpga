`timescale 1ps / 1ps

module softmax_tb;
    // Parameters
    parameter TOTAL_WORDS = 1024;
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 10;
    parameter EXPONENT_LATENCY = 23;
    parameter ACC_LATENCY = 11;
    parameter RECIPROCAL_LATENCY = 15;
    parameter MULTIPLIER_LATENCY = 7;

    // Inputs
    reg clk;
    reg rst;
    reg data_in_enable;
    reg data_in_wr_enable;
    reg [ADDR_WIDTH-1:0] data_in_address;
    reg [DATA_WIDTH-1:0] data_in;
    reg data_out_enable;
    reg [ADDR_WIDTH-1:0] data_out_address;

    // Outputs
    wire [DATA_WIDTH-1:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    softmax #(
        .TOTAL_WORDS(TOTAL_WORDS),
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .EXPONENT_LATENCY(EXPONENT_LATENCY),
        .ACC_LATENCY(ACC_LATENCY),
        .RECIPROCAL_LATENCY(RECIPROCAL_LATENCY),
        .MULTIPLIER_LATENCY(MULTIPLIER_LATENCY)
    ) uut (
        .clk(clk),
        .rst(rst),
        .data_in_enable(data_in_enable),
        .data_in_wr_enable(data_in_wr_enable),
        .data_in_address(data_in_address),
        .data_in(data_in),
        .data_out_enable(data_out_enable),
        .data_out_address(data_out_address),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        data_in_enable = 0;
        data_in_wr_enable = 0;
        data_in_address = 0;
        data_in = 0;
        data_out_enable = 0;
        data_out_address = 0;

        // Reset the module
        #20 rst = 0;
        #20 rst = 1;

        // Write data to the input buffer
        data_in_enable = 1;
        data_in_wr_enable = 1;
        for (int i = 0; i < 10; i = i + 1) begin
            data_in_address = i;
            data_in = i * 32'h00010000; // Example data
            #10; // Wait for a clock cycle
        end
        data_in_enable = 0;
        data_in_wr_enable = 0;

        // Enable data output and read data
        #20;
        data_out_enable = 1;
        for (int i = 0; i < 10; i = i + 1) begin
            data_out_address = i;
            #10; // Wait for a clock cycle to observe the output
        end
        data_out_enable = 0;

        // End of simulation
        #100;
        $stop;
    end

endmodule
