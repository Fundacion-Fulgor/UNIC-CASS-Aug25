//`timescale 1ns / 1ps

module tb_MIPS_Datapath;

// System inputs
reg clk_in;
reg Reset;

// Outputs for monitoring

wire [31:0] IF_PC,IF_Instruction,IFID_Instruction,ID_ReadData1,ID_ReadData2,IDEX_ReadData1,IDEX_ReadData2;
wire ID_Stall,IFID_Flush;
wire [31:0] EX_ALUResult,EXMEM_AluResult,MEMWB_AluResult,WB_MemToReg ;

// Instance of the main MIPS module
MIPS uut (
    .clk_in(clk_in),
    .Reset(Reset)
);

// Paths to access signals from the MEM stage

assign IF_PC = uut.IF_Stage.PC.PCResult;
assign IF_Instruction = uut.IF_Stage.InstructionMemory.Instruction;
assign IFID_Instruction = uut.IFID.Out_Instruction;
assign IDEX_ReadData1 = uut.IDEX.Out_ReadData1;
assign IDEX_ReadData2 = uut.IDEX.Out_ReadData2;
assign EXMEM_AluResult = uut.EXMEM.Out_ALUResult;
assign MEMWB_AluResult = uut.MEMWB.Out_ALUResult;
assign WB_MemToReg = uut.WB_Stage.MemToReg_Out;
assign ID_Stall = uut.ID_Stage.HazardDetection.ControlStall;

assign ID_ReadData1 = uut.ID_Stage.ReadData1_out;
assign ID_ReadData2 = uut.ID_Stage.ReadData2_out;

assign EX_ALUResult = uut.EX_Stage.ALU.ALUResult;
assign EX_RegWrite_Out = uut.EX_Stage.ALU.RegWrite_Out;
assign EX_Zero = uut.EX_Stage.ALU.Zero;
assign IFID_Flush = uut.IFID.Flush;

// Clock generator
initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in; // Clock period: 10 ns
end

// Test process
initial begin
    // Initialization
    Reset = 1;
    #15 Reset = 0;

    // Wait for initial synchronization
    
    #50;
    $stop;
end

endmodule
