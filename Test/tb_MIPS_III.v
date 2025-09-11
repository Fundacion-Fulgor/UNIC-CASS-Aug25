`timescale 1ns / 1ps

module tb_MIPS_III;

    // Inputs
    reg ClockIn;
    reg Reset;

    // Outputs
    wire [31:0] PCResult;
    wire [31:0] V0, V1;

    // Instance of the module under test
    MIPS uut (
        .ClockIn(ClockIn),
        .Reset(Reset)
    );

    // Clock generator
    initial begin
        ClockIn = 0;
        forever #5 ClockIn = ~ClockIn; // 10 ns clock period
    end

    // Initialization and reset
    initial begin
        $dumpfile("tb_MIPS_III.vcd");
        $dumpvars(0, tb_MIPS_III);

        Reset = 1; // Assert reset
        #10;
        Reset = 0; // Deassert reset
    end

    // Monitoring of the registers of interest
    initial begin
        $display("Time(ns)\tReg[0]\tReg[8]\tReg[4]\tReg[17]");
        $monitor("%t\t%h\t%h\t%h\t%h", 
                 $time,  
                 uut.ID_Stage.Registers.registers[0], 
                 uut.ID_Stage.Registers.registers[8], 
                 uut.ID_Stage.Registers.registers[4], 
                 uut.ID_Stage.Registers.registers[17]);
        #2000; // 2000 ns simulation (200 cycles)
        $finish;
    end

endmodule
