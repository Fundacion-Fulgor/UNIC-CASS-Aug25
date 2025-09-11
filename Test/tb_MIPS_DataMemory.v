`timescale 1ns / 1ps

module tb_MIPS_DataMemory;

// System inputs
reg ClockIn;
reg Reset;

// Outputs for monitoring
wire MEM_MemWrite;
wire MEM_MemRead;
wire ID_RegWrite ;
wire [31:0] MEM_MemReadData, WB_MemToReg;
wire [31:0] MEM_Address, MEM_WriteData;
wire [3:0]  ByteSig;
wire [31:0] RegRTData, ID_WriteRegister;
wire [31:0] ID_WriteData;


// Instance of the main MIPS module
MIPS uut (
    .ClockIn(ClockIn),
    .Reset(Reset)
);

// Paths to access signals from the MEM stage
assign MEM_MemWrite = uut.MEM_Stage.MemWrite;
assign ByteSig      = uut.MEM_Stage.ByteSig;
assign ID_RegWrite  = uut.ID_Stage.Registers.RegWrite;

assign MEM_MemRead     = uut.MEM_Stage.MemRead;
assign MEM_MemReadData = uut.MEM_Stage.MemReadData;
assign MEM_Address     = uut.MEM_Stage.ALUResult;
assign MEM_WriteData   = uut.MEM_Stage.RegRTData;

assign WB_MemToReg     = uut.WB_Stage.MemToReg_Out;
assign ID_WriteRegister = uut.ID_Stage.Registers.WriteRegister;
assign ID_WriteData     = uut.ID_Stage.Registers.WriteData;


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

    // Wait for initial synchronization
    #20;

    // MEM stage monitoring
    $display("Iniciando pruebas en la etapa MEM");

    // Monitor memory write
    wait(MEM_MemWrite);
   // #1 $display("[Write] MEM_MemWrite = %b, ALUResult = %h, RegRTData = %h", MEM_MemWrite, Address, RegRTData);

    // Monitor memory read
    wait(MEM_MemRead);
   // #1 $display("[Read] MemRead = %b, ALUResult = %h, MemReadData = %h", MemRead, Address, MemReadData);

    // Monitor ByteSig
    #20;
    //$display("[ByteSig] ByteSig = %h", ByteSig);

    // End simulation
    #50;
    $stop;
end

endmodule
