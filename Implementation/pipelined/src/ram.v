`timescale 1 ps / 1 ps
module ram
	#(
		parameter DATA_WIDTH 		= 32,
		parameter ADDR_WIDTH 	= 10,
		parameter TOTAL_WORDS = 1024
	)
	(
	input							clock,
	input							ram_enable,
	input							write_enable,
    input 		[ADDR_WIDTH-1:0]	address,
    input 		[DATA_WIDTH-1:0] 	input_data,
	output reg 	[DATA_WIDTH-1:0] 	output_data
	);
	
	
	
	// data file initialization 
	//localparam DATA_FILE 		= "/home/jam/Downloads/NU/Projects/bram_hdmi/coe_generation/sample1.txt,
	//localparam INIT_START_ADDR 	= 0;
	//localparam INIT_END_ADDR		= 1023;
		
	
   
   (* RAM_STYLE="BLOCK" *)
   reg [DATA_WIDTH-1:0] ram_name [0:TOTAL_WORDS-1];


   //  The forllowing code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   //initial begin
   //   $readmemh(DATA_FILE, ram_name, INIT_START_ADDR, INIT_END_ADDR);
    //end
    
   always @(posedge clock)
      if (ram_enable) begin
         output_data <= ram_name[address];   
         if (write_enable)
            ram_name[address] <= input_data;
      end

endmodule
						