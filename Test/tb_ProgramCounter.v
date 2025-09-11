`timescale 1ns / 1ps

// IT WORKS!!!

// Testbench to verify the operation of the ProgramCounter module
module tb_ProgramCounter();

    // Module inputs
    reg [31:0] PC_In;          // Input address to the program counter
    reg Reset;                 // Reset signal
    reg Clock;                 // Clock signal
    reg Enable;                // Enable signal

    // Module output
    wire [31:0] PCResult;      // Current value of the program counter

    // Instance of the ProgramCounter module
    PC u0(
        .PC_In(PC_In), 
        .PCResult(PCResult), 
        .Enable(Enable),
        .Reset(Reset), 
        .Clock(Clock)
    );

    // Clock signal generation
    // The clock toggles between 0 and 1 every 100 time units
    initial begin
        Clock <= 1'b0;                // Initialize clock low
        forever #100 Clock <= ~Clock; // Toggle clock state every 100 time units
    end

    // Process to apply stimuli to the module
    initial begin
        // Initialization and reset
        PC_In <= 32'd0;               // Initialize input to 0
        Reset <= 1'b1;                // Assert reset
        Enable <= 1'b0;               // Initialize Enable low
        #200;                         // Wait 200 time units
        Reset <= 1'b0;                // Deassert reset

        // Enable and apply changes to the counter address
        Enable <= 1'b1;               // Enable the counter
        #100 PC_In <= 32'd4;          // Change address to 4
        @ (posedge Clock);            // Wait for a positive clock edge

        #100 PC_In <= 32'd8;          // Change address to 8
        @ (posedge Clock);            // Wait for a positive clock edge

        #100 PC_In <= 32'd12;         // Change address to 12
        @ (posedge Clock);            // Wait for a positive clock edge

        #100 PC_In <= 32'd16;         // Change address to 16
        @ (posedge Clock);            // Wait for a positive clock edge

        #100 PC_In <= 32'h00000AA1;   // Change address to an arbitrary hexadecimal value
        @ (posedge Clock);            // Wait for a positive clock edge

        // Disable Enable and verify that the PC does not change
        Enable <= 1'b0;
        #100 PC_In <= 32'd20;         // Change address to 20 but it won't update because Enable is disabled
        @ (posedge Clock);

        // End the simulation
        #100 $finish;                 // Stop the simulation after completing the stimuli
    end

    // Signal monitoring
    initial begin
        $monitor("Time: %0t | Reset: %b | Enable: %b | PC_In: %h | PCResult: %h", $time, Reset, Enable, PC_In, PCResult);
    end
endmodule
