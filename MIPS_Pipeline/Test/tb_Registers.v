`timescale 1ns / 1ps

module tb_Registers;

    reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    reg [31:0] WriteData;
    reg RegWrite, Clock;
    wire [31:0] ReadData1, ReadData2;
    wire [31:0] V0, V1;

    // Instantiate the Registers module
    Registers uut (
        .ReadRegister1(ReadRegister1),
        .ReadRegister2(ReadRegister2),
        .WriteRegister(WriteRegister),
        .WriteData(WriteData),
        .RegWrite(RegWrite),
        .Clock(Clock),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .V0(V0),
        .V1(V1)
    );

    // Clock generator
    initial begin
        Clock = 0;
        forever #5 Clock = ~Clock; // Clock with 10 ns period
    end

    // Simulation
    initial begin
        // Initialization
        RegWrite = 0;
        WriteRegister = 0;
        WriteData = 0;
        ReadRegister1 = 0;
        ReadRegister2 = 0;

        #10;

        // Write to register 5
        WriteRegister = 5;
        WriteData = 32'hDEADBEEF;
        RegWrite = 1;
        #10;  // Wait one clock cycle

        // Disable write
        RegWrite = 0;

        // Read register 5
        ReadRegister1 = 5;
        #5;  // Stabilization time for read
        $display("ReadData1 (Reg 5): %h", ReadData1);

        // Write to register 10
        WriteRegister = 10;
        WriteData = 32'hCAFEBABE;
        RegWrite = 1;
        #10;

        // Disable write
        RegWrite = 0;

        // Read register 10
        ReadRegister2 = 10;
        #5;
        $display("ReadData2 (Reg 10): %h", ReadData2);

        // End of simulation
        $finish;
    end

endmodule
