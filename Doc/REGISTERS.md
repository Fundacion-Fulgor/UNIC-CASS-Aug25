
# MIPS Registers 🧮

## Introduction
MIPS (Microprocessor without Interlocked Pipeline Stages) is an instruction set architecture (ISA) widely used in embedded systems and academia. In this architecture, registers are an essential component for temporary data storage and instruction execution control.

This document details all MIPS registers, including their name, purpose, and usage conventions.

---

## Register Table

<p align="center"> <img src="../img/image21.png" alt=""> </p>

### General Purpose Registers (GPR)

| Number | Name   | Alias | Main Usage                                                                 |
|--------|--------|-------|----------------------------------------------------------------------------|
| $0     | zero   | -     | Always contains the value 0.                                               |
| $1     | at     | -     | Temporary register reserved for the assembler.                             |
| $2-$3  | v0-v1  | -     | Return values for functions.                                               |
| $4-$7  | a0-a3  | -     | Function arguments (the first four).                                       |
| $8-$15 | t0-t7  | -     | Temporaries (not preserved across function calls).                         |
| $16-$23| s0-s7  | -     | Saved temporaries (preserved across function calls).                       |
| $24-$25| t8-t9  | -     | Additional temporaries (not preserved across function calls).              |
| $26-$27| k0-k1  | -     | Reserved for the kernel (used by the operating system).                    |
| $28    | gp     | -     | Global pointer (points to global data).                                    |
| $29    | sp     | -     | Stack pointer (points to the stack).                                       |
| $30    | fp     | s8    | Frame pointer (points to the current frame).                               |
| $31    | ra     | -     | Return address (stores the return address after function calls).           |

### Special Registers

| Name   | Description                                                                                 |
|--------|---------------------------------------------------------------------------------------------|
| HI     | High accumulator for multiplication/division results.                                       |
| LO     | Low accumulator for multiplication/division results.                                        |
| PC     | Program Counter, points to the next instruction to be executed.                             |

---

## Detailed Description

### General Purpose Registers (GPR)

1. **$zero ($0)**:
   - Constant value 0. Used for operations requiring a constant zero, such as initialization or comparisons.

2. **$at ($1)**:
   - Reserved for the assembler; should not be used directly in programs.

3. **$v0-$v1 ($2-$3)**:
   - Store function return values. For example, if a function returns an integer, it is placed in `$v0`.

4. **$a0-$a3 ($4-$7)**:
   - Contain function arguments (up to four). If more than four arguments exist, the rest are passed on the stack.

5. **$t0-$t7 ($8-$15) and $t8-$t9 ($24-$25)**:
   - Temporary registers that can be overwritten anytime. Used for intermediate calculations.

6. **$s0-$s7 ($16-$23)**:
   - Saved registers. Their value must be preserved across function calls. It is the programmer’s or compiler’s responsibility to save and restore them when used.

7. **$gp ($28)**:
   - Global pointer. Facilitates access to global variables in programs.

8. **$sp ($29)**:
   - Stack pointer. Used for managing temporary storage and function calls.

9. **$fp ($30)**:
   - Frame pointer. Optional but useful for simplifying access to local variables in functions.

10. **$ra ($31)**:
    - Return address. Holds the address to return to after a function call.

### Special Registers

1. **HI and LO**:
   - Store results of multiplication/division:
     - Multiplication: the 64-bit result is split between HI (high bits) and LO (low bits).
     - Division: quotient is placed in LO, remainder in HI.

2. **PC (Program Counter)**:
   - Contains the address of the next instruction to execute. Managed automatically by hardware.

---

## Usage Conventions

In MIPS, calling conventions define how registers must be used in the context of functions:

- **Preserved registers** (`$s0-$s7`, `$sp`, `$fp`, `$ra`): The caller expects these to retain their value. If a function modifies them, it must restore them before returning.
- **Not preserved registers** (`$t0-$t9`, `$a0-$a3`, `$v0-$v1`): These can be freely overwritten by called functions.
- **Stack**: Values that don’t fit into registers must be stored in the stack.
