module baudrate_generator
#(
    parameter BAUD_RATE   = 19200,        // Baud rate (bits per second)
    parameter CLK_FREQ    = 45_000_000,   // Input clock frequency (Hz)
    parameter OVERSAMPLING = 16           // Oversampling factor
)
(
    input   wire clk,       // Clock signal
    input   wire i_reset,   // Active-low reset signal
    output  wire o_tick     // Pulse generated at the desired frequency
);

// Calculation of the number of clock cycles per sampling tick
localparam NC_PER_TICK = CLK_FREQ / BAUD_RATE / OVERSAMPLING;   // CLOCK /(16*19200)
localparam NB_COUNTER = 8; // Number of counter bits
reg [NB_COUNTER:0] counter; // Register for the counter

// Sequential logic of the counter
always @(posedge clk) begin
    if(!i_reset) begin 
        counter <= {NB_COUNTER {1'b0}}; // Reset counter on reset
    end else begin
        if(counter == NC_PER_TICK) 
            counter <= {NB_COUNTER {1'b0}}; // Reset counter when limit is reached
        else                        
            counter <= counter + 1; // Increment counter on each clock cycle
    end
end

// Pulse generation on o_tick when counter reaches NC_PER_TICK
assign o_tick = (counter == NC_PER_TICK);

endmodule
