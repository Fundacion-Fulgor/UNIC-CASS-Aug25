`timescale 1ns / 1ps

module tb_MIPS_II;

// System inputs
reg ClockIn;
reg Reset;

// Instance of the main MIPS module
MIPS uut (
    .ClockIn(ClockIn),
    .Reset(Reset)
);

// Clock generator
initial begin
    ClockIn = 0;
    forever #5 ClockIn = ~ClockIn; // Clock period: 10 ns
end

// Test process
initial begin
    // Initialization
    Reset = 1;
    #15 Reset = 0;

    #50;
    $stop;
end

endmodule
