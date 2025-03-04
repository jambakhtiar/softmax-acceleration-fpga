`timescale 1 ps / 1 ps


module control_unit #(parameter TOTAL_VALUES = 1024)(
    	input wire clk,          // Clock signal
    	input wire rst,        // Reset signal (active high)
	// Latency counters control signals
    	output reg expo_latency_cnt_en,           // Output signal
    	input wire expo_latency_cnt_done,           // Output signal
	output reg acc_latency_cnt_en,           // output signal
    	input wire acc_latency_cnt_done,           // input signal
	output reg reci_latency_cnt_en,           // output signal
    	input wire reci_latency_cnt_done,           // input signal
	output reg multi_latency_cnt_en,           // output signal
    	input wire multi_latency_cnt_done,           // input signal
	// data flow controls signals
	output reg ram1_enable_b,           // Output signal
	output reg addr_gen1_en,           // Output signal
	output reg ram2_en_a,           // Output signal
	output reg ram2_wr_en_a,           // Output signal
	output reg acc_en,           // Output signal
	output reg ram2_en_b,           // Output signal
	output reg addr_gen2_en,           // Output signal
	output reg ram3_enable_a,           // Output signal
	output reg ram3_wr_en_a,           // Output signal
	// ram addresses
	input [9:0] ram1_addr,		// input signal
	input [9:0] ram2_addr		// input signal
);

wire ram1_addr_done,  ram2_addr_done;
assign  ram1_addr_done = (ram1_addr == TOTAL_VALUES-1 )? 1'b1: 1'b0;
assign  ram2_addr_done = (ram2_addr == TOTAL_VALUES-1 )? 1'b1: 1'b0;


// State encoding
       localparam idle 		= 3'b000;  // State 0
       localparam read_input_data = 3'b001;  // State 1
       localparam exponent 	= 3'b010;  // State 2
       localparam accumulate 	= 3'b011;   // State 3
       localparam reciprocal 	= 3'b100;  // State 4
       localparam fetch_expo 	= 3'b101;  // State 5
       localparam multiplier 	= 3'b110;  // State 6
       localparam store_data 	= 3'b111;   // State 7
	
       reg [2:0] current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= idle;  // Reset to initial state
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            idle: 		next_state = read_input_data;
            read_input_data: 	next_state = exponent;
            exponent: 		next_state = (expo_latency_cnt_done) ? accumulate : exponent;
            accumulate: begin 	
			if(acc_latency_cnt_done) begin
				if(ram1_addr_done) 	next_state = reciprocal;
				else 			next_state = read_input_data;
			end
			else 	next_state = current_state;
		end
	    reciprocal: 	next_state = (reci_latency_cnt_done) ? fetch_expo : reciprocal;
	    fetch_expo: 	next_state = multiplier;
	    multiplier: 	next_state = (reci_latency_cnt_done) ? store_data : multiplier;
	    store_data: begin 	
			if(multi_latency_cnt_done) begin
				if(ram2_addr_done) 	next_state = idle;
				else 			next_state = fetch_expo;
			end
			else 	next_state = current_state;
		end
            default: next_state = idle;
        endcase
    end

    // Output logic (Moore: depends only on the current state)
    always @(*) begin
        case (current_state)
         idle: begin
	  	expo_latency_cnt_en <= 1'b0;        
	  	acc_latency_cnt_en <=   1'b0;    
	  	reci_latency_cnt_en <=  1'b0;     
	  	multi_latency_cnt_en <= 1'b0;        
	  	ram1_enable_b <=  1'b0;   
	  	addr_gen1_en 	<=  1'b0;    
	  	ram2_en_a <=   1'b0;
	  	ram2_wr_en_a <=  1'b0;    
	  	acc_en <=	1'b0;
	  	ram2_en_b <=  1'b0;
	  	addr_gen2_en <=  1'b0;    
	  	ram3_enable_a <= 1'b0;     
	  	ram3_wr_en_a <=   1'b0;  
	end

         read_input_data: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b1;   
	  	addr_gen1_en 		<= 1'b1;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<=  1'b0;  
	end
         exponent: begin
	  	expo_latency_cnt_en 	<= 1'b1;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b1;
	  	ram2_wr_en_a 		<= 1'b1;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<= 1'b0;  
	end
         accumulate: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b1;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<= 1'b0;  
	end
	 reciprocal: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b1;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<= 1'b0;  
	end
         fetch_expo: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b1;
	  	addr_gen2_en 		<= 1'b1;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<= 1'b0;  
	end
         multiplier: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b1;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<= 1'b0;  
	end
         store_data: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b1;     
	  	ram3_wr_en_a 		<= 1'b1;  
	end
            default: begin
	  	expo_latency_cnt_en 	<= 1'b0;        
	  	acc_latency_cnt_en 	<= 1'b0;    
	  	reci_latency_cnt_en 	<= 1'b0;     
	  	multi_latency_cnt_en 	<= 1'b0;        
	  	ram1_enable_b 		<= 1'b0;   
	  	addr_gen1_en 		<= 1'b0;    
	  	ram2_en_a 		<= 1'b0;
	  	ram2_wr_en_a 		<= 1'b0;    
	  	acc_en 			<= 1'b0;
	  	ram2_en_b 		<= 1'b0;
	  	addr_gen2_en 		<= 1'b0;    
	  	ram3_enable_a 		<= 1'b0;     
	  	ram3_wr_en_a 		<= 1'b0;  
	    end
        endcase
    end

endmodule
