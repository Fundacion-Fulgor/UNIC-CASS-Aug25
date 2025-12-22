
# **Implement the MIPS Processor Pipeline**

## Implementation Instructions

### R-type Instructions:
- **Shift operations:** `SLL`, `SRL`, `SRA`, `SLLV`, `SRLV`, `SRAV`
- **Arithmetic operations:** `ADDU`, `SUBU`
- **Logical operations:** `AND`, `OR`, `XOR`, `NOR`
- **Comparison operations:** `SLT`, `SLTU`

### I-type Instructions:
- **Load and store operations:** `LB`, `LH`, `LW`, `LWU`, `LBU`, `LHU`, `SB`, `SH`, `SW`
- **Arithmetic and logical operations:** `ADDI`, `ADDIU`, `ANDI`, `ORI`, `XORI`, `LUI`
- **Comparison and conditional branches:** `SLTI`, `SLTIU`, `BEQ`, `BNE`

### J-type Instructions:
- **Jumps:** `J`, `JAL`, `JR`, `JALR`

## Other Requirements

| Requirement                    | Description                                                                                                          |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Data and instruction memory** | Data memory must be separated from instruction memory; both must be implemented using IP Cores.                     |
| **Program loading**             | The program to be executed must be loaded into instruction memory via a `.coe` file.                                |
| **Debugging unit**              | A debug unit must be included to send information to the PC through UART.                                           |
| **Segmentation**                | Must perform read and write in the same cycle (1 per clock edge).                                                   |

### Debugging Information Sent via UART

- Contents of the 32 registers.  
- Contents of intermediate latches.  
- Contents of the data memory used.  

## Operating Modes

- **Continuous Mode:** In this mode, sending a command to the FPGA via UART starts the program execution until completion, displaying all required values at the end.
- **Step-by-Step Mode:** Each UART command executes one clock cycle, displaying required values at each step.

## Final Pipeline

<p align="center">
    <img src="img/image16.png">
</p>

## Bibliography

- **Instructions:**
  - *MIPS IV Instruction Set*
- **Pipeline:**
  - *Computer Organization and Design*, 3rd Edition. Chapter 6. Hennessy and Patterson

---

# Theoretical Framework

## Stages

- **IF (Instruction Fetch):** Fetch the instruction from program memory.  
- **ID (Instruction Decode):** Decode the instruction and read registers.  
- **EX (Execute):** Execute the actual operation.  
- **MEM (Memory Access):** Read or write from/to data memory.  
- **WB (Write Back):** Write results into registers.  

## Datapath

<p align="center">
    <img src="img/image1.png">
</p>

## Segmentation

<p align="center">
    <img src="img/image2.png">
</p>

## Control Unit

<p align="center">
    <img src="img/image3.png">
</p>

<p align="center">
    <img src="img/image4.png">
</p>

## Hazards

### Types:
- **Structural:** Occur when two instructions try to use the same resource in the same cycle.  
- **Data:** Occur when a value is used before it is ready. Requires strict ordering of reads and writes.  
- **Control:** Occur when a decision depends on a condition not yet evaluated.  

## Data Hazards
### Register Dependencies

<p align="center">
    <img src="img/image5.png" alt="Register dependencies">
</p>

#### Solution

<p align="center">
    <img src="img/image6.png" alt="Solution to register dependencies">
</p>

### Forwarding Unit

<p align="center">
    <img src="img/image7.png" alt="Forwarding Unit">
</p>

---

## Data Hazards
### Data Dependencies

<p align="center">
    <img src="img/image8.png" alt="Data dependencies">
</p>

#### Solution

<p align="center">
    <img src="img/image9.png" alt="Solution to data dependencies">
</p>

### Hazard Detection Unit

<p align="center">
    <img src="img/image10.png" alt="Hazard detection unit">
</p>

---

## Control Hazards

<p align="center">
    <img src="img/image11.png" alt="Control hazards">
</p>

<p align="center">
    <img src="img/image12.png" alt="Solution to control hazards">
</p>

## Instruction Types

### R-Type
- Arithmetic and logical operations.  
- **OP Code:** `000000`  
- The operation is indicated in the 6 least significant bits.  

<p align="center">
    <img src="img/image13.png" alt="R-Type instruction format">
</p>

### I-Type
- Operations with a register and an immediate value.  
- For arithmetic/logical ops: operate with `rs`, store result in `rt`.  
- For **load** and **store** ops: `rs` is the base, immediate is the offset.  

<p align="center">
    <img src="img/image14.png" alt="I-Type instruction format">
</p>

### J-Type
- Unconditional jump operations.  
- Jump address is stored in `rs`.  

<p align="center">
    <img src="img/image15.png" alt="J-Type instruction format">
</p>





# Implementation

The main design of this development follows an incremental approach. Each significant milestone is translated into a branch that depends on a previous one, progressively contributing to the final MIPS implementation.

## Milestone I: MIPS Only Adder

The main goal of Milestone I is to develop an extremely basic MIPS with the following characteristics:

- Ability to process only one addition instruction: `add $t1, $t2, $t3`.
- No hazard handling.
- No jump support of any kind.

The purpose of this step is to establish the fundamental modules forming the MIPS base structure (skeleton), serving as a starting point and facilitating integration of new features in later stages.

### Results

<p align="center">
    <img src="img/image18.png" alt="Milestone I">
</p>

We can see how MIPS performs the `add $t1, $t2, $t3` operation, which sums the values stored in registers 10 (`$t2`) and 11 (`$t3`) and stores the result in register 9 (`$t1`).

---

## Milestone II: Hazard without jumps

The main goal of Milestone II is to integrate and improve Milestone I by incorporating hazard resolution. This allows instructions to be processed correctly, avoiding incorrect results caused by race conditions or related problems.

Taking into account the register distribution in MIPS (see `Doc\REGISTERS.md`), we consider the following cases:

### Case A: No hazards, multiple instructions

```assembly
add $t0, $t1, $t2 # 000000 01001 01010 01000 00000 100000  -> 0x012A4020 -> 19546144, Register 08h (08d) = 13h
add $s1, $s2, $s3 # 000000 10010 10011 10001 00000 100000  -> 0x2538820  -> 39028768, Register 11h (17d) = 25h
add $a0, $a1, $a2 # 000000 00101 00110 00100 00000 100000  -> 0xA62020   -> 10887200, Register 04h (04d) = 0bh
```

In this specific case, the three add instructions present no direct data, control, or structural hazards.

The initial state of the registers is as follows:

<p align="center"> <img src="img/image19.png" alt="Initial register state"> </p>

Registers are aligned so that the first hex value corresponds to `$zero`, the second to `$at`, and so on.

When testing with the file `tb_MIPS_II.v`, we obtain the following results:

<p align="center"> <img src="img/image20.png" alt="Final register state"> </p>

### Case B: STORE

**NOTE:** Refer to `OPERATIONS.md` for details on how the instructions work.

<p align="center"> <img src="img/image23.png" alt=""> </p>

```assembly
sw  $s0 , 14($s1) -> 101011  10001 10000 0000 0000 0000 1110 = 2922381326d

      Address: 18H = 24d = 10d + 14d (offset) = 000110   00 (Discarded)
```

This value is stored in element 6 (6x4) of memory, as shown below:

<p align="center"> <img src="img/image24.png" alt=""> </p> 

### Case C: LOAD

<p align="center"> <img src="img/image25.png" alt=""> </p> 

```assembly
lw  $s2 , 16 ($s3) -> 100011   10011  10010  0000 0000 0001 0000 -> 2389835792
```

<p align="center"> <img src="img/image26.png" alt=""> </p> 

### Case D: Data Hazards

**Data hazards** occur when, due to pipelining, the order of reading operands and writing results changes compared to the program specification.

A hazard arises if there is a **dependency between instructions** that execute concurrently. Depending on the pipeline segmentation, the hazard may or may not occur. There are three main types of data hazards:

- **Read after Write (RAW):**  
  A hazard occurs if a register is read before it is written by a previous instruction.

- **Write after Read (WAR):**  
  A hazard occurs if a register is written before a previous instruction finishes reading it.

- **Write after Write (WAW):**  
  A hazard occurs if a register is written before a previous instruction finishes writing to it.

---

#### Examples of Data Hazards

| Type | Code                  | Description                            |
|------|-----------------------|----------------------------------------|
| RAW  | `ADD $t1, $t2, $t3`   | `$t1` is read before being written.    |
|      | `ADD $t4, $t1, $t2`   |                                        |
| WAR  | `ADD $t1, $t4, $t3`   | `$t4` is written before being read.    |
|      | `ADD $t4, $t1, $t2`   |                                        |
| WAW  | `ADD $t4, $t2, $t3`   | If the 2nd instruction executes first. |
|      | `ADD $t4, $t1, $t2`   |                                        |

<p align="center"> <img src="img/image27.png" alt=""> </p> 

### Problem Analysis

#### First instruction: `ADD $t1, $t2, $t3`
- Writes the result into `$t1` at the end of the WB stage (C5).

#### Second instruction: `ADD $t4, $t1, $t2`
- Attempts to read `$t1` during the ID stage (C3), but `$t1` is not yet available since it has not been written back.







### Solutions to Avoid this Hazard

#### Forwarding Technique
1. **Description**:  
   Use hardware bypass or forwarding to send the result of the EX stage of the first instruction directly to the ID or EX stage of the second instruction, without waiting for the result to be written back to the register.

2. **Implementation in this case**:  
   - The result of the EX stage of the first instruction (C3) can be directly forwarded as input to the EX stage of the second instruction (C4).

#### Advantages
- Forwarding is the most efficient technique, as it avoids unnecessary clock cycle loss.  
- However, **it requires hardware support in the pipeline**.

### Implementation

NOTE: Each register has its value equal to its index:

```assembly
add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
add $a0, $a1, $a2 -> 000000 00101 00110 00100 00000 100000  -> 0x00A62020 -> 10887200
add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
add $t4, $t1, $t2 -> 000000 01001 01010 01100 00000 100000  -> 0X012A6020 -> 19554336 
add $t0, $t1, $t2 -> 000000 01001 01010 01000 00000 100000  -> 0x012A4020 -> 19546144
add $t0, $t1, $t2 -> 000000 01001 01010 01000 00000 100000  -> 0x012A4020 -> 19546144
add $t0, $t1, $t2 -> 000000 01001 01010 01000 00000 100000  -> 0x012A4020 -> 19546144
add $t0, $t1, $t2 -> 000000 01001 01010 01000 00000 100000  -> 0x012A4020 -> 19546144
add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
add $t2, $t0, $t3 -> 000000 01000 01011 01010 00000 100000  -> 0x010B5020 -> 17518624
add $t4, $t1, $t2 -> 000000 01001 01010 01100 00000 100000  -> 0X012A6020 -> 19554336 
```

#### Breakdown

| Instruction          | Final Register (Decimal) | Calculation                          |
|----------------------|--------------------------|--------------------------------------|
| add $s1, $s2, $s3    | (08) | s1 = 18d + 19d = 37d = 25h |
| add $a0, $a1, $a2    | (04) | a0 = 05d + 06d = 11d = 0bh |
| add $t1, $t2, $t3    | (09) | t1 = 10d + 11d = 21d = 15h |
| add $t4, $t1, $t2    | (12) | t4 = 21d + 10d = 31d = 1Fh |
| add $t0, $t1, $t2    | (08) | t0 = 21d + 10d = 31d = 1Fh |
| add $t0, $t1, $t2    | (08) | t0 = 21d + 10d = 31d = 1Fh |
| add $t0, $t1, $t2    | (08) | t0 = 21d + 10d = 31d = 1Fh |
| add $t0, $t1, $t2    | (08) | t0 = 21d + 10d = 31d = 1Fh |
| add $t1, $t2, $t3    | (09) | t1 = 10d + 11d = 21d = 15h |
| add $t2, $t0, $t3    | (10) | t2 = 31d + 11d = 42d = 2Ah |
| add $t4, $t1, $t2    | (12) | t4 = 21d + 42d = 63d = 3Fh |

<p align="center"> <img src="img/image28.png" alt=""> </p>

#### Temporal Interpretation of the Hazard

<p align="center"> <img src="img/image29.png" alt=""> </p>

### Case E: Load-Use Hazard

When a `LW` instruction is followed by an R-type instruction, it is necessary to forward the output of memory (from the `LW` instruction) directly to the ALU input of the second instruction.

To perform this control, the **Forwarding Unit** requires the following information, stored in the pipeline registers up to the `EX` stage:

- The register being written by the previous instruction (`rd` for R-type, `rt` for I-type like `LW`).  
- The registers being read in the new instruction (`rs` and `rt`).  
- The `Write_Reg` control signal, indicating whether the instruction writes to a register (R-type or I-type like `LW`).  

Even with forwarding, there is still a backward dependency between the first and second instruction.

For the instruction `LW r1, 0(r2)`, the value of `r1` will not be available until the fourth stage (`MEM`), because the data is retrieved from memory. However, the second instruction that depends on it will need the value in its second stage (`EX`).  

This type of dependency cannot be resolved by the Forwarding Unit, since the data is not yet available. As a result, the second instruction must *WAIT* one clock cycle before continuing execution. This wait is called a **stall** or **bubble**, and it is required to prevent reading incorrect data.

### Solution

In addition to a Forwarding Unit, a **Hazard Detection Unit** is required.  

This unit must operate during the `ID` stage to insert a stall between a load instruction and the dependent instruction.

Control for hazard detection in the case of a `load` instruction is performed by evaluating:

1. The `memRead` control signal of the previous instruction.  
2. The `rt` register of the previous instruction, which indicates where the load result will be stored.  
3. The `rs` and `rt` registers of the current instruction (in the `ID` stage).  

### Implementation

```assembly
lw s2, 16(s3)  -> 0x8E520010 -> 10001110011100100000000000010000 -> 2389835792  -> s2 = 10d (16d level 5)
add v1,s2,v0   -> 0x02421820 -> 00100100001000011000001000000000 -> 37885984    -> v1 = 12d (v0 = 2h)
```

<p align="center"> <img src="img/image30.png" alt=""> </p>

<p align="center"> <img src="img/image31.png" alt=""> </p>

<p align="center"> <img src="img/image32.png" alt=""> </p>

### Case F: Hazards with LOAD and STORE

With $v0=2d and $t0=8d (initial):

```assembly
add s3 , v0 , v0    -> 0x00429820 -> 00000000010000101001100000100000 -> 4364320     -> s3 = 2d + 2d = 4d
lw  s2 , 16(s3)     -> 0x8E520010 -> 10001110011100100000000000010000 -> 2389835792  -> s2 = 10d (16d level 5)
sw  s3 , 14(s2)     -> 0xAE53000E -> 10101110010100110000000000001110 -> 2924675086  -> level 6 = 4d 
lw  $t1 , 16($t0)   -> 0x8D090010 -> 10001101000010010000000000010000 -> 2366177296  -> t1 = 8d 
add $v0 , $s3 , $s2 -> 0x02721020 -> 00000010011100100001000000100000 -> 41029664    -> v0 = 14d
add $t2 , $t1 , $v0 -> 0x1225020  -> 00000001001000100101000000100000 -> 19025952    -> t2 = 22d = 16h
```

#### Interpretation

<p align="center"> <img src="img/image33.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image34.png" alt=""> </p>

## Milestone III: Jumps

What differentiates a computer from a simple calculator is its ability to make decisions. In this milestone, the goal is to extend Milestone II by incorporating the ability to perform operations that affect the program counter (PC) and handle associated control hazards.

### Case G: J

MIPS **J (jump)** instructions have the following 32-bit binary format:  

📌 **Important rules for the jump target address:**  
1. MIPS CPUs **truncate** the **2 least significant bits** of the address (`PC`), since MIPS instructions are always aligned to 4 bytes.  
2. The `target address` in the `j` instruction is not the absolute address but represents the **upper 26 bits** of the address divided by 4.  
3. The real jump address is reconstructed during execution as:  

   `Jump Address = (PC[31:28] << 28) | (target address << 2)`  

Since the jump is within the same segment, we do not worry about `PC[31:28]`.

#### 🔹 Jump Address Calculation for `j 00011000` (PC = 24)

| Step | Description | Result |
|------|-------------|---------|
| 1️⃣  | Target address in decimal | `PC = 24 (decimal)` |
| 2️⃣  | Divide by 4 | `24 / 4 = 6` |
| 3️⃣  | Convert `6` to 26-bit binary | `00000000000000000000000110` |
| 4️⃣  | Combine with opcode of `j` (`000010`) | `000010 00000000000000000000000110` |
| 5️⃣  | Convert to hexadecimal | **`0x08000006`** |

#### 🔹 **Conclusion**  
- **The reason we use `110` (6 in binary) is because MIPS stores the jump address divided by 4 in the J instruction**.  
- **This is because MIPS addresses are aligned to 4 bytes, so the two least significant bits are always `00` and not stored in the instruction**.  
- **The processor reconstructs the real address by multiplying the target address by 4 during execution**.  

When the *jump* instruction reaches the **ID** stage, the next sequential instruction (**PC + 4**) is fetched.  

However, this is **NOT** the correct instruction, since execution should continue at the jump destination.  

This introduces a new type of hazard: the **control hazard**.

#### Handling Control Hazards

A **control hazard** occurs when the current instruction cannot execute in the correct cycle because the fetched instruction is not the required one.  

In other words, the instruction flow is not what the pipeline expected.  

The option to handle control hazards (for *JUMP*) is to **stall the pipeline** until the correct instruction to fetch in the **IF** stage is determined.  

Suppose the following instruction set:

```assembly
PC                 |   Instruction   
00000000                add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
00000100                add $a0, $a1, $a2 -> 000000 00101 00110 00100 00000 100000  -> 0x00A62020 -> 10887200
00001000                j 00011000        -> 000010 00000 00000 00000 00000 000110  -> 0x08000006 -> 134217752
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
```

#### Interpretation

<p align="center"> <img src="img/image35.png" alt=""> </p>

##### PROBLEM ⚠️

The issue arises when executing:  
`IF_instruction = j 00011000`. When this instruction advances to the **ID** stage, the pipeline continues executing the next sequential instruction as if the jump didn’t exist. For example, `add $t1, $t2, $t3` would execute immediately after the jump, since control does not detect the flow change until the **ID** stage. This behavior can be represented as:

<p align="center"> <img src="img/image36.png" alt=""> </p>

##### SOLUTION 👍  

Add a **Flush** signal in `Hazard.v` to clear the **IFID** pipeline registers, introducing a one-cycle stall.

<p align="center"> <img src="img/image37.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image38.png" alt=""> </p>








### Case H: JAL

#### `jal dir`: Jump and Link

Jumps to the instruction whose address is labeled by `dir`, and links (stores the address of the next instruction in the `$ra` register).

<p align="center"> <img src="img/image39.png" alt=""> </p>

When executing `jal dir`, the `$ra` register stores the address of the next instruction, and execution jumps to the instructions at the address labeled `dir`.

If the block ends with `jr $ra`, the program returns to the address stored in `$ra`, continuing from the instruction immediately after `jal`.

Assume the following instruction set:

```assembly 
PC                 |   Instruction   
00000000                add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
00000100                add $a0, $a1, $a2 -> 000000 00101 00110 00100 00000 100000  -> 0x00A62020 -> 10887200
00001000                jal 00011000      -> 000011 00000 00000 00000 00000 000110  -> 0x0C000006 -> 201326598
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384
```

#### Interpretation

<p align="center"> <img src="img/image40.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image41.png" alt=""> </p>

### Case I: JR

The `jr $t0` (Jump Register) instruction jumps to the address stored in register `$t0` (`$t0 = b11000 = 0x18`). That is, execution will continue from the address contained in `$t0`.

Example program with corresponding memory addresses:

```assembly
0x00000000  li $t0, 0x00000018  # Load address 0x00000018 into $t0
0x00000004  instruction1
0x00000008  instruction2
0x0000000c  jr $t0              # Jump to the address in $t0 (0x00000018)
0x00000010  instruction3        # Not executed
0x00000014  instruction4        # Not executed
0x00000018  instruction5        # Executed after the jump
0x0000001c  instruction6
0x00000020  instruction7
```

During execution:
- All instructions run up to `jr $t0`.
- `jr $t0` makes the program jump to the address contained in `$t0` (0x00000018).
- Instructions at 0x00000010 and 0x00000014 are **not** executed.
- Execution continues from 0x00000018 onward.

```assembly 
PC                 |   Instruction   
00000000                add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
00000100                add $a0, $a1, $a2 -> 000000 00101 00110 00100 00000 100000  -> 0x00A62020 -> 10887200
00001000                jr  $t8           -> 000000 11000 00000 00000 00000 001000  -> 0x3000008  -> 50331656
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
```
#### Interpretation

<p align="center"> <img src="img/image42.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image43.png" alt=""> </p>

### Case J: JALR

📖 See **Patterson, D. A., & Hennessy, J. L.**  
*Computer Organization and Design: The Hardware/Software Interface* (4th ed.). See page **866**.

<p align="center"> <img src="img/image59.png" alt=""> </p>

🔹 If **`rd`** is not specified, **`$31`** (**`$ra`**, return address) is used by default.  

**NOTE:** JR and JALR are **R-format** operations. JAL is **not** R-format.

```assembly 
PC                 |   Instruction   
00000000                add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
00000100                add $a0, $a1, $a2 -> 000000 00101 00110 00100 00000 100000  -> 0x00A62020 -> 10887200
00001000                jalr $t8          -> 000000 11000 00000 11111 00000 001001  -> 0x300F809  -> 50395145
   //                   jalr $t8,$s0      -> 000000 11000 00000 10000 00000 001001  -> 0x3008009  -> 50364425
   //                   jalr $t8,$a1      -> 000000 11000 00000 00101 00000 001001  -> 0x3002809  -> 50341897
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
```

<p align="center"> <img src="img/image60.png" alt=""> </p>

### Case K: JR with Data Hazard

In this case, **JR** attempts to read a register that is being modified by an instruction currently in **EX** or **MEM** (e.g., **JAL** or **LW**). This creates a control/data dependency that must be resolved using **stall** and **flush** control, ensuring correct execution and avoiding reading/writing incorrect data.

The solution is to add the new dependency condition to `hazard.v`, enabling proper pipeline flow control.

```assembly 
PC                 |   Instruction   
00000000                add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x00A62020 -> 21893152
00001000                jr  $v0           -> 000000 00010 00000 00000 00000 001000  -> 0x3000008  -> 4194312
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
```

#### Interpretation

<p align="center"> <img src="img/image61.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image62.png" alt=""> </p>

## Milestone IV: Branch

In **MIPS**, *branch* instructions (conditional jumps) change the program flow based on a condition. For this milestone, we focus on equality/inequality comparisons:

- **BEQ** (*Branch if Equal*): Jump if two registers hold the same value.  
- **BNE** (*Branch if Not Equal*): Jump if two registers hold different values.  

The objective is to implement these within **MIPS**, continuing from **Milestone III** and addressing the control hazards for branches.

### Control Hazard and Mitigation

A **control hazard** arises when a decision must be made based on an instruction’s result while others are still executing.

### Mitigating Control Hazards

#### Assume Not Taken
To avoid stalls, a common strategy is to **assume the branch is not taken** and continue sequential fetch.  
- If the branch **is** taken, the fetched/decoded instructions **MUST BE FLUSHED** 🚮.  
- If ~half the branches are not taken and flushing is cheap, this **cuts control hazard cost roughly in half**.

#### Flushing Instructions 🚮
To flush instructions, set control signals to **zero**, similar to stalling for load-use hazards.  
- In **IF/ID**, the **PC** value and the immediate field are available.

### 🚀 Performance Tweak: Move Forwarding One Stage Earlier (MEM -> ID)
**Optimization:** Move branch resolution to **ID**.  
- ✅ Pros: Better performance.  
- ⚠️ Cons: More hardware.  

This requires new circuitry to **detect hazards** and **forward results**, ensuring branches that depend on recent results work correctly.  
- If branch operands are produced **after ID**, a **data hazard** can cause stalls.  
  - Example: `Add $v0,$v1,$v2 -> BEQ $v0,$t1,JUMP` (immediate branch after ALU result)  
  - If a **load** is followed by a branch testing the loaded value, expect a **two-cycle** stall (**Control Stall**).  

#### IF-stage Instruction Flush 🚮
Introduce **IF.Flush** (from the previous milestone) to zero the **IF/ID** instruction field, turning it into a **NOP** so it cannot change processor state.

#### Benefit
If ~**50%** of branches are not taken and flushing is efficient, then:  
✅ **Control hazard cost is roughly halved.**

### Case L: BEQ without HAZARD

```assembly 
PC                 |   Instruction   
00000000                add $s1, $t2, $t6 -> 000000 01010 01110 10001 00000 100000  -> 0x14E8820  -> 21923872
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x14E1020  -> 21893152
00001000                BEQ t8,t8, 00011000  -> 000100 11000 11000 0000000000011000 -> 0x13180018 -> 320339992  -> JUMP to add $t4, $t5, $t6
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
``` 

Given `$t8=24d=0x18`, there is **no hazard** in the branch instruction because it only depends on `$t8`, which was already loaded.

#### Interpretation

<p align="center"> <img src="img/image69.png" alt=""> </p>

When `BEQ` enters **IF**, the processor still doesn’t know whether the branch will be taken. Thus, in the next cycle it has already started fetching `add $t1, $t2, $t3`, assuming **not taken**.  

In **ID**, `BEQ` evaluates `$t8 == $t8` (true) and decides to jump to `0x00011000` instead of continuing with `0x00001100`.  

This means the in-flight `add $t1, $t2, $t3` is incorrect and must be **flushed**.  

#### How to fix it?

Insert a **bubble** (flush) in **ID**. A bubble is an empty cycle where no real instruction executes, giving time to discard the incorrect instruction and fetch the correct one:  
`add $t4, $t5, $t6  # at address 0x00011000`

#### Result

<p align="center"> <img src="img/image70.png" alt=""> </p>

<p align="center"> <img src="img/image72.png" alt=""> </p>









#### BEQ without HAZARD (WRONG CONDITION)

```assembly 
PC                 |   Instruction   
00000000                add $s1, $t2, $t6 -> 000000 01010 01110 10001 00000 100000  -> 0x14E8820  -> 21923872
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x14E1020  -> 21893152
00001000                BEQ t1,t8, 00011000  -> 000100 01001 11000 0000000000011000 -> 0x11380018 -> 288882712  -> DO NOT JUMP 
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
``` 

#### Result

<p align="center"> <img src="img/image71.png" alt=""> </p>

<p align="center"> <img src="img/image80.png" alt=""> </p>

In this case, since the branch **is NOT** taken because `$t1` differs from `$t8`, there is no need to insert a bubble. Execution continues normally with the next sequential instruction.

If `$t1` is different from `$t8` and the branch is not taken, **there should be no bubble**, as there is no need to wait for branch resolution.

### Branch and Data Hazard

#### Recommended sources  
- [Video: Branch Hazards (YouTube)](https://www.youtube.com/watch?v=cOWxinc5oRk)  
- [Video: Data Hazards (YouTube)](https://www.youtube.com/watch?v=EW9vtuthFJY)  

So far, we have focused on hazards related to arithmetic operations and data transfers. However, there are also **hazards** in the **pipeline** related to **branch** instructions.  

To keep the **pipeline** flowing, a new instruction must be fetched every clock cycle. However, **branch** instructions can alter the flow of execution, causing delays and impacting processor performance.  

#### Assume Branch Not Taken

To flush instructions, we simply set the original control values to zero (STALL), similar to how we stalled the pipeline for a LOAD-USE data hazard (previous milestone). The difference is that for control hazards we must modify the three instructions in stages IF, ID, and EX when the branch reaches MEM. In contrast, for load-use hazards, we only change control in ID and let instructions propagate through the pipeline. Flushing instructions thus involves being able to clear IF, ID, and EX.

Control hazards are relatively easier to understand, occur **less** frequently than data hazards, and there is no technique as effective against control hazards as forwarding is for data hazards. 

#### Example: Branch + Data Hazard

Consider the following example  
(Example inspired by *"5-Stage Pipeline Processor Execution Example"*)  

🔗 [Watch on YouTube](https://www.youtube.com/watch?v=EW9vtuthFJY)

##### CASE 1: INCORRECT BRANCH, THE JUMP MUST NOT BE TAKEN.

<p align="center"> <img src="img/image78.png" alt=""> </p>

In `add $v0, $t2, $t6`, `$v0` is updated and becomes available after the execution stage (right after `EX/MEM`).  

However, in the immediately following branch `BNE $v0, $s1, 00011000`, there is a data dependency on `$v0`. This branch attempts to decode but cannot yet obtain the correct value of `$v0`, because it is still being produced by the ALU.

To resolve this, **forwarding** and a **stall** are required. The branch must wait one cycle in **ID** until `$v0` is available. This delays the next instruction `add $t1, $t2, $t3`.

That instruction must wait in **IF** until the branch can proceed.

Once the dependency is resolved via forwarding and the bubble, the branch continues normally, allowing the next instruction to progress as well.

##### CASE 2: CORRECT BRANCH, THE JUMP MUST BE TAKEN.

<p align="center"> <img src="img/image79.png" alt=""> </p>

The first instruction (`add $v0, $t2, $t6`) writes its result to `$v0`, but the value is only available at **EX/MEM**. The next instruction (`BNE $v0, $s1, offset`) needs to read `$v0` in **ID**, but it has not been written yet, creating a data dependency. To avoid errors, the processor stalls `BNE` in **ID** for one cycle.  

This stall prevents `add $t1, $t2, $t3` from being decoded in time. However, the processor has already started fetching `add`, so when the branch resolves as taken, that `add` is already in the pipeline. The processor then realizes `add $t1, $t2, $t3` is invalid and turns it into a `NOP`, inserting a bubble.  

Finally, after resolving the branch, the processor fetches the correct instruction (`add $t4, $t5, $t6`), and execution proceeds. The stall and bubble arise from not predicting the branch and from the data dependency on `$v0`.

### Case M: BEQ with HAZARD

```assembly 
            PC                 |   Instruction   
            00000000                add $s1, $t2, $t6 -> 000000 01010 01110 10001 00000 100000  -> 0x14E8820  -> 21923872
            00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x14E1020  -> 21893152
            00001000                BEQ v0,s1, 00011000  -> 000100 10001 00010 0000000000011000 -> 0x12220018 -> 304218136  -> JUMP to add $t4, $t5, $t6
            00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
            00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
            00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
            00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
            00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
``` 

#### Interpretation

<p align="center"> <img src="img/image81.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image73.png" alt=""> </p>

#### BEQ with HAZARD (WRONG CONDITION)

```assembly 
PC                 |   Instruction   
00000000                add $s1, $t1, $t6 -> 000000 01001 01110 10001 00000 100000  -> 0x12E8820  -> 19826720
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x14E1020  -> 21893152
00001000                BEQ v0,s1, 00011000  -> 000100 10001 00010 0000000000011000 -> 0x12220018 -> 304218136  -> DO NOT JUMP
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
``` 

#### Result

<p align="center"> <img src="img/image75.png" alt=""> </p>

**AS IN THE PREVIOUS CASE:** Wait 1 cycle to get the updated value of `$v0`, since it only enters the **EX** stage when it is requested in **ID**. Therefore, obtaining the data is delayed by one more cycle.

### Case N: BNE without HAZARD

**BNE** (*Branch if Not Equal*): Jumps if two registers hold different values.

```assembly 
PC                 |   Instruction   
00000000                add $s1, $t2, $t6 -> 000000 01010 01110 10001 00000 100000  -> 0x14E8820  -> 21923872
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x14E1020  -> 21893152
00001000                BNE t8,t7, 00011000  -> 000101 11000 10111 0000000000011000 -> 0x17170018 -> 387383320  -> JUMP to add $t4, $t5, $t6
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
``` 

Given `$t8=24d=0x18` and `$t7=23d=0x17`, there is **no hazard** in the branch because it only needs `$t8` and `$t7`, which were already loaded.

#### Result

<p align="center"> <img src="img/image82.png" alt=""> </p>

#### BNE without HAZARD (WRONG CONDITION)

```assembly 
PC                 |   Instruction   
00000000                add $s1, $t2, $t6 -> 000000 01010 01110 10001 00000 100000  -> 0x14E8820  -> 21923872
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x14E1020  -> 21893152
00001000                BNE t8,t8, 00011000  -> 000101 11000 11000  0000000000011000 -> 0x17180018 -> 387448856  -> DO NOT JUMP 
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
``` 

Given `$t8=24d=0x18`, there is **no hazard** in the branch because it only needs `$t8`, which was already loaded.

#### Result

<p align="center"> <img src="img/image83.png" alt=""> </p>

### Case O: BNE with HAZARD

```assembly 
PC                 |   Instruction   
00000000                add $s1, $s2, $s3 -> 000000 10010 10011 10001 00000 100000  -> 0x02538820 -> 39028768
00000100                add $v0, $t2, $t6 -> 000000 01010 01110 00010 00000 100000  -> 0x00A62020 -> 21893152
00001000                BNE v0,s1, 00011000  -> 000101 10001 00010  0000000000011000 -> 0x16220018-> 371327000  -> DO NOT JUMP 
00001100                add $t1, $t2, $t3 -> 000000 01010 01011 01001 00000 100000  -> 0X014B4820 -> 21710880
00010000                add $t2, $t3, $t4 -> 000000 01011 01100 01010 00000 100000  -> 0X016C5020 -> 23875616 
00010100                add $t3, $t4, $t5 -> 000000 01100 01101 01011 00000 100000  -> 0X018D5820 -> 26040352
00011000                add $t4, $t5, $t6 -> 000000 01101 01110 01100 00000 100000  -> 0x01AE6020 -> 28205088
00100000                add $t5, $t1, $t2 -> 000000 01001 01010 01101 00000 100000  -> 0X012A6820 -> 19556384 
```

#### Result

<p align="center"> <img src="img/image84.png" alt=""> </p>

### Case J: Branch & LOAD, HAZARD

Recommendation: https://www.youtube.com/watch?v=cOWxinc5oRk&t=1152s

If a branch source register is the destination of the immediately preceding load, **2 stall cycles** are required.

For this load–branch dependency hazard, use logic similar to **Case E: Load-Use Hazard**.

| PC       | Instruction                     | Machine code          | Binary                                   | Decimal       | Description                    |
|----------|----------------------------------|-----------------------|-------------------------------------------|---------------|--------------------------------|
| 00000000 | add s3, v0, v0                   | 0x00429820            | 000000 00010 00010 10011 00000100000      | 4364320       | s3 = 2d + 2d = 4d              |
| 00000100 | lw a0, 20(s3)                    | 0x8E640014            | 100011 10011 00100 0000000000010100       | 2388918292    | a0 = 10d (20d level 6)         |
| 00001000 | lw s2, 16(s3)                    | 0x8E520010            | 100011 10011 10010 0000000000010000       | 2389835792    | s2 = 10d (16d level 5)         |
| 00001100 | BEQ a0, s2, 00100000             | 0x1092001C            | 000100 00100 10010 0000000000011100       | 278003740     | Conditional branch             |
| 00010000 | add t1, t2, t3                   | 0x014B4820            | 000000 01010 01011 01001 00000 100000     | 21710880      | t1 = t2 + t3                   |
| 00010100 | add t2, t3, t4                   | 0x016C5020            | 000000 01011 01100 01010 00000 100000     | 23875616      | t2 = t3 + t4                   |
| 00011000 | add t3, t4, t5                   | 0x018D5820            | 000000 01100 01101 01011 00000 100000     | 26040352      | t3 = t4 + t5                   |
| 00011100 | add t4, t5, t6                   | 0x01AE6020            | 000000 01101 01110 01100 00000 100000     | 28205088      | t4 = t5 + t6                   |
| 00100000 | add t5, t1, t2                   | 0x012A6820            | 000000 01001 01010 01101 00000 100000     | 19556384      | t5 = t1 + t2                   |

#### Pipeline Interpretation

<p align="center"> <img src="img/image85.png" alt=""> </p>

#### Interpretation 

<p align="center"> <img src="img/image86.png" alt=""> </p>

#### Result

<p align="center"> <img src="img/image87.png" alt=""> </p>

## Milestone V: Ready MIPS & UART

The main goal of this branch is a stable MIPS capable of being synthesized on the Basys 3 FPGA. To achieve this, simulation-only constructs such as `initial begin` were removed, and blocking/non-blocking assignment syntax was corrected.

The result is a MIPS that, by pressing button **W19**, displays the first 16 bits of the registers. With each press, it advances register by register, showing their values on the FPGA LEDs. This verifies the correct MIPS implementation **without UART** to the PC.

### UART

For the UART, we used a version similar to TP2’s, but removed the RX/TX FIFOs.

<p align="center"> <img src="img/image89.png" alt=""> </p>

##### RX and TX Data Process in UART

Assuming **N data bits** and **M stop bits**:

1. **IDLE** → Wait until the input line goes low, indicating the start bit. Start the tick counter.
2. **START** → When the counter reaches **7**, the input is at the middle of the start bit. Reset the counter.
3. **RECEIVE / DATA** → At **15**, the input has advanced one bit and is at the middle of the first data bit. Sample and shift in. Reset the counter.
4. Repeat **step 3** a total of **N−1** more times for the remaining data bits.
5. If parity is used, repeat **step 3** again.
6. **STOP** → Repeat **step 3** a total of **M** times to process the stop bits.

<p align="center"> <img src="img/image91.png" alt=""> </p>

> **Note:** The same state machine is used for `uart_tx`.

<p align="center"> <img src="img/image92.png" alt=""> </p>

> **Specific configuration:** For **CLK = 50 MHz** with **BR = 19200**.

### Timing Requirements

One of the main challenges when integrating MIPS on the FPGA was meeting timing on all critical paths. 

To address this, we used **Clock Wizard** to introduce a **50 MHz** clock, allowing all critical paths to meet timing. As a result, **WNS** (*Worst Negative Slack*) is positive, indicating that even for the most critical path there is positive margin within the clock period.

Further tests will explore other frequencies to determine the operating range that satisfies this requirement.

<p align="center"> <img src="img/image88.png" alt=""> </p>
