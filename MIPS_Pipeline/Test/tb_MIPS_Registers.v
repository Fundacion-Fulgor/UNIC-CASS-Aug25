`timescale 1ns / 1ps

module tb_MIPS_Registers;

// System inputs
reg ClockIn;
reg Reset;

// Signals to monitor the register file
wire [31:0] ReadData1, ReadData2; // Data read from registers
wire [4:0]  WriteRegister, WriteRegister_reg; // Destination register for write
wire [31:0] WriteData;            // Data written to the register
wire        RegWrite;             // Write enable signal

// Instance of the main MIPS module
MIPS uut (
    .ClockIn(ClockIn),
    .Reset(Reset)
);

// Paths to access the register file signals inside ID_Stage
assign ReadData1        = uut.ID_Stage.ReadData1;
assign ReadData2        = uut.ID_Stage.ReadData2;
assign WriteRegister    = uut.ID_Stage.Registers.WriteRegister;
assign WriteRegister_reg= uut.ID_Stage.Registers.WriteRegister_reg;
assign WriteData        = uut.ID_Stage.Registers.WriteData;
assign RegWrite         = uut.ID_Stage.Registers.RegWrite;

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

    // Simulate instructions to test the register file
    #20; // Wait for first-cycle synchronization

    // End simulation
    #50;
    $stop;
end

endmodule
