
`timescale 1ns / 1ps

module adder_tb;
    // Inputs
    reg clock;
    reg [31:0] dataa;
    reg [31:0] datab;
    
    // Outputs
    wire [31:0] result;
    
    // Instantiate the adder module
    adder1 uut (
        .clock(clock),
        .dataa(dataa),
        .datab(datab),
        .result(result)
    );
    
    // Clock generation
    always #2 clock = ~clock;
    
    initial begin
        // Initialize inputs
        clock = 0;
        dataa = 0;
        datab = 0;
        
        // Apply test vectors
        #10 dataa = 32'h00000001; datab = 32'h00000001;
        //#10 dataa = 32'h00000010; datab = 32'h00000010;
        //#10 dataa = 32'hFFFFFFFF; datab = 32'h00000001;
        #10 dataa = 32'h12345678; datab = 32'h87654321;
        
        // Wait and observe output
        #500;
        
        // Finish simulation
        $stop;
    end
    
endmodule
