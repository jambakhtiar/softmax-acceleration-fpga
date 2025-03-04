
`timescale 1 ps / 1 ps
module softmax
	#(
		parameter TOTAL_WORDS = 1024,
		parameter DATA_WIDTH 		= 32,
		parameter ADDR_WIDTH 	= 10,
		
		parameter EXPONENT_LATENCY= 23,
		parameter ACC_LATENCY= 11,
		parameter RECIPROCAL_LATENCY= 15,
		parameter MULTIPLIER_LATENCY= 7
	)
	(
	input	clk,
	input	rst,
	//input buffer
	input data_in_enable,
	input data_in_wr_enable,
	input [9:0] data_in_address,
	input [31:0]data_in,
	//output buffer
	input data_out_enable,
	input [9:0]data_out_address,
	output [31:0] data_out
	);
	
	
		
		//parameter TOTAL_WORDS = 1024
	
wire [ADDR_WIDTH-1:0] ram1_addr, ram2_addr;
wire [DATA_WIDTH-1:0] ram1_output_data_b, expo_q, ram2_data_b_out, multi_q, acc_r, reci_q;

counter #(.LATENCY_CYCLES(EXPONENT_LATENCY))
 expo_latency_cnt(
    .clk(clk),           // Clock signal
    .reset(rst),         // Reset signal (active high)
    .enable(expo_latency_cnt_en),        // Enable signal
    .done(expo_latency_cnt_done)
);


counter #(.LATENCY_CYCLES(ACC_LATENCY))
 acc_latency_cnt(
    .clk(clk),           // Clock signal
    .reset(rst),         // Reset signal (active high)
    .enable(acc_latency_cnt_en),        // Enable signal
    .done(acc_latency_cnt_done)
);

counter #(.LATENCY_CYCLES(RECIPROCAL_LATENCY))
 reci_latency_cnt(
    .clk(clk),           // Clock signal
    .reset(rst),         // Reset signal (active high)
    .enable(reci_latency_cnt_en),        // Enable signal
    .done(reci_latency_cnt_done)
);


counter #(.LATENCY_CYCLES(MULTIPLIER_LATENCY))
 multi_latency_cnt(
    .clk(clk),           // Clock signal
    .reset(rst),         // Reset signal (active high)
    .enable(multi_latency_cnt_en),        // Enable signal
    .done(multi_latency_cnt_done)
);



control_unit #(.TOTAL_VALUES(TOTAL_WORDS))(
    	.clk(clk),          // Clock signal
    	.rst(rst),        // Reset signal (active high)
	// Latency counters control signals
    	.expo_latency_cnt_en(expo_latency_cnt_en),           // Output signal
    	.expo_latency_cnt_done(expo_latency_cnt_done),           // Output signal
	   .acc_latency_cnt_en(acc_latency_cnt_en),           // output signal
    	.acc_latency_cnt_done(acc_latency_cnt_done),           // input signal
		.reci_latency_cnt_en(reci_latency_cnt_en),           // output signal
    	.reci_latency_cnt_done(reci_latency_cnt_done),           // input signal
		.multi_latency_cnt_en(multi_latency_cnt_en),           // output signal
    	.multi_latency_cnt_done(multi_latency_cnt_done),           // input signal
	// data flow controls signals
		.ram1_enable_b(ram1_enable_b),           // Output signal
		.addr_gen1_en(addr_gen1_en),           // Output signal
		.ram2_en_a(ram2_en_a),           // Output signal
		.ram2_wr_en_a(ram2_wr_en_a),           // Output signal
		.acc_en(acc_en),           // Output signal
		.ram2_en_b(ram2_en_b),           // Output signal
		.addr_gen2_en(addr_gen2_en),           // Output signal
		.ram3_enable_a(ram3_enable_a),           // Output signal
		.ram3_wr_en_a(ram3_wr_en_a),           // Output signal
	// ram addresses
		.ram1_addr(ram1_addr),		// input signal
		.ram2_addr(ram2_addr)		// input signal
);


	
	dualport_ram
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH),
		.TOTAL_WORDS(TOTAL_WORDS)
	)
	RAM1(
	.clock(clk),
	.ram_enable_a(data_in_enable),
	.write_enable_a(data_in_wr_enable),
   .address_a(data_in_address),
   .input_data_a(data_in),
	.output_data_a(),

	.ram_enable_b(ram1_enable_b),
	.write_enable_b(),
   .address_b(ram1_addr),
   .input_data_b(),
	.output_data_b(ram1_output_data_b)
	);
	
	
	
address_gen addr_gen1(
    .clock(clk),
    .reset(rst),
    .en(addr_gen1_en),
    .address(ram1_addr)
);	


	
expo exponent(
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.a(ram1_output_data_b),      //      a.a
		.q(expo_q)       //      q.q
	);	
	
	

acc1 accumulator(
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.x(expo_q),      //      x.x
		.n(),      //      n.n
		.r(acc_r),      //      r.r
		.xo(),     //     xo.xo
		.xu(),     //     xu.xu
		.ao(),     //     ao.ao
		.en(acc_en)      //     en.en
	);	
	

dualport_ram
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH),
		.TOTAL_WORDS(TOTAL_WORDS)
	)
	RAM2(
	.clock(clk),
	.ram_enable_a(ram2_en_a),
	.write_enable_a(ram2_wr_en_a),
   .address_a(ram1_addr),
   .input_data_a(expo_q),
	.output_data_a(),

	.ram_enable_b(ram2_en_b),
	.write_enable_b(),
   .address_b(ram2_addr),
   .input_data_b(),
	.output_data_b(ram2_data_b_out)
	);
	
	
reciprocal1 (
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.a(acc_r),      //      a.a
		.q(reci_q)       //      q.q
	);	
		

address_gen addr_gen2(
    .clock(clk),
    .reset(rst),
    .en(addr_gen2_en),
    .address(ram2_addr)
);		

	
multiplier1 (
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.a(reci_q),      //      a.a
		.b(ram2_data_b_out),      //      b.b
		.q(multi_q)       //      q.q
	);	
	
	
dualport_ram
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH),
		.TOTAL_WORDS(TOTAL_WORDS)
	)
	RAM3(
	.clock			(clk),
	.ram_enable_a	(ram3_enable_a),
	.write_enable_a(ram3_wr_en_a),
   .address_a		(ram2_addr),
   .input_data_a	(multi_q),
	.output_data_a(),

	.ram_enable_b(data_out_enable),
	.write_enable_b(),
   .address_b(data_out_address),
   .input_data_b(),
	.output_data_b(data_out)
	);	
	
endmodule
						