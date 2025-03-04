module dualport_ram
	#(
		parameter DATA_WIDTH 		= 32,
		parameter ADDR_WIDTH 	= 10,
		parameter TOTAL_WORDS = 1024
	)
	(
	input						clock,
	input						ram_enable_a,
	input						write_enable_a,
    input		[ADDR_WIDTH-1:0]	address_a,
    input		[DATA_WIDTH-1:0]	input_data_a,
	output reg	[DATA_WIDTH-1:0]	output_data_a,

	input						ram_enable_b,
	input						write_enable_b,
    input		[ADDR_WIDTH-1:0]	address_b,
    input		[DATA_WIDTH-1:0]	input_data_b,
	output reg	[DATA_WIDTH-1:0]	output_data_b
	);
	

	
	(* RAM_STYLE="BLOCK" *)
	reg [DATA_WIDTH-1:0] ram_name [0:TOTAL_WORDS-1];

	// Port A: Read/Write
	always @(posedge clock) begin
		if (ram_enable_a) begin
			output_data_a <= ram_name[address_a];
			if (write_enable_a)
				ram_name[address_a] <= input_data_a;
		end
	end

	// Port B: Read/Write
	always @(posedge clock) begin
		if (ram_enable_b) begin
			output_data_b <= ram_name[address_b];
			if (write_enable_b)
				ram_name[address_b] <= input_data_b;
		end
	end

endmodule
