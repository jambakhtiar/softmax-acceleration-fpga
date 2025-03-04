module address_generator3 (
    input        clock,
    input        reset,
    output reg [9:0] address
);


    always @(posedge clock) begin
        if (reset) begin
            address <= 10'd0; // Reset address to 0
        end else begin
            if (address == 10'd1023) begin
                address <= 10'd0; // Wrap around after the maximum address
            end else begin
                address <= address + 1; // Increment address
            end
        end
    end

endmodule
