
`timescale 1 ps / 1 ps
module address_gen (
    input        clock,
    input        reset,
    input        en,
    output reg [9:0] address
);


    always @(posedge clock) begin
        if (reset) begin
            address <= 10'd0; // Reset address to 0
        end 
		  else begin
          if(en) begin  
					if (address == 10'd1023) begin
						address <= 10'd0; // Wrap around after the maximum address
					end else begin
						address <= address + 1; // Increment address
					end
				end
        end
    end

endmodule
