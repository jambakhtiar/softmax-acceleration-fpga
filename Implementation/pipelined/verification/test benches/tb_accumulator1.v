
`timescale 1 ps / 1 ps

module tb_accumulator1;

    // Testbench signals
    reg clk;
    reg areset;
    reg [31:0] x;
    reg n;
    wire [31:0] r;
    wire xo, xu, ao;

    // Instantiate the accumulator module
    acc1 uut (
        .clk(clk),
        .areset(areset),
        .x(x),
        .n(n),
        .r(r),
        .xo(xo),
        .xu(xu),
        .ao(ao),
	.en(1'b1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #2 clk = ~clk; // 10 ps clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        areset = 1;
        x = 0;
        n = 0;

        // Apply reset
        #10 areset = 0; 
        //#10 areset = 1; 

        // Apply test vectors
        $display("Time\tReset\tInput X\tN\tOutput R\tXO\tXU\tAO");
        $monitor("%0t\t%b\t%h\t%b\t%h\t%b\t%b\t%b", 
                 $time, areset, x, n, r, xo, xu, ao);

        // Test case 1: Add a value
        #4 x = 32'h00000010; //n = 0; 
        #4 x = 32'h00000020; //n = 1;
	#10 x =32'h3FC00000; //1.5
	#10 x =32'h40000000;//2
	#10 x =32'h40400000;//3
	#10 x =32'h40800000;//4
	#10 x =32'h40A00000;//5
	#10 x =32'h40C00000;//6
	#10 x =32'h40E00000;//7
	#10 x =32'h41000000;//8



        // Finish simulation
        #50 $stop;
    end

endmodule
