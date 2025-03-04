
`timescale 1ns/1ps

module control_unit_tb;

    // Parameters
    parameter TOTAL_VALUES = 5;

    // Testbench signals
    reg clk;
    reg rst;
    
    // Latency counters control signals
    wire expo_latency_cnt_en;
    reg expo_latency_cnt_done;
    wire acc_latency_cnt_en;
    reg acc_latency_cnt_done;
    wire reci_latency_cnt_en;
    reg reci_latency_cnt_done;
    wire multi_latency_cnt_en;
    reg multi_latency_cnt_done;

    // Data flow control signals
    wire ram1_enable_b;
    wire addr_gen1_en;
    wire ram2_en_a;
    wire ram2_wr_en_a;
    wire acc_en;
    wire ram2_en_b;
    wire addr_gen2_en;
    wire ram3_enable_a;
    wire ram3_wr_en_a;

    // RAM addresses
    reg [9:0] ram1_addr;
    reg [9:0] ram2_addr;

    // Instantiate the control unit module
    control_unit #(TOTAL_VALUES) uut (
        .clk(clk),
        .rst(rst),
        .expo_latency_cnt_en(expo_latency_cnt_en),
        .expo_latency_cnt_done(expo_latency_cnt_done),
        .acc_latency_cnt_en(acc_latency_cnt_en),
        .acc_latency_cnt_done(acc_latency_cnt_done),
        .reci_latency_cnt_en(reci_latency_cnt_en),
        .reci_latency_cnt_done(reci_latency_cnt_done),
        .multi_latency_cnt_en(multi_latency_cnt_en),
        .multi_latency_cnt_done(multi_latency_cnt_done),
        .ram1_enable_b(ram1_enable_b),
        .addr_gen1_en(addr_gen1_en),
        .ram2_en_a(ram2_en_a),
        .ram2_wr_en_a(ram2_wr_en_a),
        .acc_en(acc_en),
        .ram2_en_b(ram2_en_b),
        .addr_gen2_en(addr_gen2_en),
        .ram3_enable_a(ram3_enable_a),
        .ram3_wr_en_a(ram3_wr_en_a),
        .ram1_addr(ram1_addr),
        .ram2_addr(ram2_addr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        rst = 1;
        expo_latency_cnt_done = 0;
        acc_latency_cnt_done = 0;
        reci_latency_cnt_done = 0;
        multi_latency_cnt_done = 0;
        ram1_addr = 10'b0;
        ram2_addr = 10'b0;

        // Apply reset
        #15 rst = 0; // Release reset after 15ns

        // Simulate latency counter done signals
        #20 expo_latency_cnt_done = 1;
        #30 acc_latency_cnt_done = 1;
        #40 reci_latency_cnt_done = 1;
        #50 multi_latency_cnt_done = 1;

        // Change RAM addresses
        #60 ram1_addr =  10'd4;//10'b1010101010;
        #60 ram2_addr = 10'd4;//10'b0101010101;

        // End simulation
        #100 $stop;
    end

endmodule
