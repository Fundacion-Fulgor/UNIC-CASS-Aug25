
# R-Type 
`R`-type instructions operate exclusively with registers. They perform arithmetic, logical, or control-flow operations using values stored in the registers. They do not require memory access nor include explicit addresses.

- **SLL, SLLV, SRA, SRAV, SRL, SRLV** (Shift Instructions)
    Each instruction shifts the contents of `Rs1` left or right by the distance specified in `Rs2`, placing the result in `Rd`.

| Instruction      | Description                                    | Explanation |
|------------------|----------------------------------------------|-------------|
| `sll $s1,$s2,10`    | Logical shift left         | `$s1 = $s2 << 10` (Empty bits are filled with 0) |
| `sllv Rd, Rs1, Rs2` | Variable logical shift left | `Rd = Rs1 << (Rs2 % 32)` (Shift amount is variable) |
| `sra Rd, Rs1, imm`  | Arithmetic right shift | `Rd = Rs1 >> imm` (Empty bits are filled with the sign bit) |
| `srav Rd, Rs1, Rs2` | Variable arithmetic right shift  | `Rd = Rs1 >> (Rs2 % 32)` (Preserves the sign) |
| `srl $s1,$s2,10`  | Logical shift right           | `$s1 = $s2 >> 10` (Empty bits are filled with 0) |
| `srlv Rd, Rs1, Rs2` | Variable logical shift right  | `Rd = Rs1 >>> (Rs2 % 32)` (Shift amount is variable) |


**Example: SLL**

```assembly 
  sll v0,v1,10 -> 000000 00000 00011 00010 01010 000000 -> 0x00031280 -> 201344
```

<p align="center"> <img src="../img/image45.png" alt=""> </p>

```assembly 
  sll v0,v1,10 -> 000000 00000 00011 00010 01010 000000 -> 0x00031280 -> 201344
```

##### Conclusion

- **Use SLL** when the shift amount is fixed and known at compile time.
- **Use SLLV** when the shift amount is variable and depends on a register value.

Both instructions are useful for multiplying by powers of 2 without using `mul`, but **SLLV** is more flexible as it allows dynamic shifting.

**Example: SLLV**

```assembly 
  sllv v0,v1,t2 -> 000000 01010 00011 00010 00000 000100 -> 0x1431004 -> 21172228
```

<p align="center"> <img src="../img/image46.png" alt=""> </p>

**Example: SRA**

📝 NOTE: Negative values are stored in registers using two's complement representation. Example:

<p align="center"> <img src="../img/image47.png" alt=""> </p>

```assembly 
   sra $t1, $t0, 2 -> 000000 00000 01000 01001 00010 000011 -> 0x84883  -> 542851 (with t0=-16)
   sra $t2, $v0, 8 -> 000000 00000 00010 01010 01000 000011 -> 0x25203  -> 152067 (with v0=2)
   sra $t3, $t9, 1 -> 000000 00000 11001 01011 00001 000011 -> 0x195843 -> 1660995 (with t9=25)
   sra $t4, $t3, 1 -> 000000 00000 01011 01100 00001 000011 -> 0xB6043  -> 745539 
```
##### **SRA Interpretation for `sra $t1, $t0, 2`**
```assembly 
  Sign extension   Original shifted bits
      1 1           11111111 11111111 11111111 11110000  → Shift right by 2
      └─────────────────────────────────────────────────────────┘
                 ↓
Result:   11111111 11111111 11111111 11111100 = 0xFFFFFFFC
```

<p align="center"> <img src="../img/image48.png" alt=""> </p>

**Example: SRAV**

```assembly 
   srav $t1, $t0, $v0 -> 000000 00010 01000 01001 00000 000111 -> 0x484807  -> 4737031 (with t0=-16, V0=2)
   srav $t2, $v0, $a3 -> 000000 00111 00010 01010 00000 000111 -> 0xE25007  -> 14831623  (with v0=2 , a3=7 )
   srav $t3, $t9, $at -> 000000 00001 11001 01011 00000 000111 -> 0x395807  -> 3758087 (with t9=25)
   srav $t4, $t3, $at -> 000000 00001 01011 01100 00000 000111 -> 0x2B6007  -> 2842631 
```

<p align="center"> <img src="../img/image49.png" alt=""> </p>


**Example: SRL**

```assembly 
   srl $t1, $t0, 2 -> 000000 00000 01000 01001 00010 000010 -> 0x84882  -> 542850 (with t0=-16)
   srl $t2, $v0, 8 -> 000000 00000 00010 01010 01000 000010 -> 0x25202  -> 152066 (with v0=2)
   srl $t3, $t9, 1 -> 000000 00000 11001 01011 00001 000010 -> 0x195842 -> 1660994 (with t9=25)
   srl $t4, $t3, 1 -> 000000 00000 01011 01100 00001 000010 -> 0xB6042  -> 745538 
```

<p align="center"> <img src="../img/image50.png" alt=""> </p>

**Example: SRLV**

```assembly 
   srlv $t1, $t0, $v0 -> 000000 00010 01000 01001 00000 000110 -> 0x484806  -> 4737030 (with t0=-16, V0=2)
   srlv $t2, $v0, $a3 -> 000000 00111 00010 01010 00000 000110 -> 0xE25006  -> 14831622  (with v0=2 , a3=7 )
   srlv $t3, $t9, $at -> 000000 00001 11001 01011 00000 000110 -> 0x395806  -> 3758086 (with t9=25)
   srlv $t4, $t3, $v0 -> 000000 00010 01011 01100 00000 000110 -> 0x4B6006  -> 4939782
```

<p align="center"> <img src="../img/image51.png" alt=""> </p>

---






# R-Type — Arithmetic & Logical (Unsigned vs. Signed)

- **ADDU (Add Unsigned)**  

Adds two registers **without** checking for overflow. If the sum exceeds 32 bits, the result is truncated.  
Example: **ADDU R1, [0x7FFFFFFF], [0x00000001]**, **ADDU R2, R1, [0x7FFFFFFF]**, and **ADDU R3, R1, R2**

```assembly
    0111 1111 1111 1111 1111 1111 1111 1111   (0x7FFFFFFF)  
  + 0000 0000 0000 0000 0000 0000 0000 0001   (0x00000001)  
  -------------------------------------------------------  
    1000 0000 0000 0000 0000 0000 0000 0000   (0x80000000, two's complement)  


      0111 1111 1111 1111 1111 1111 1111 1111   (0x7FFFFFFF)
    + 1000 0000 0000 0000 0000 0000 0000 0000   (0x80000000)
    -------------------------------------------------------
      1111 1111 1111 1111 1111 1111 1111 1111   (0xFFFFFFFF)

       1000 0000 0000 0000 0000 0000 0000 0000   
    + 1111 1111 1111 1111 1111 1111 1111 1111   
    ------------------------------------------------
      0111 1111 1111 1111 1111 1111 1111 1111
```

Here, the result is *negative* when interpreted as two's complement.  
This would raise an exception with **ADD**, since adding two positive numbers must not yield a negative result.  

However, **ADDU** simply stores the (truncated) result `0x80000000` in **Rd** without overflow checking.

```assembly
ADDU $t0,$t1,$t2 -> 000000 01001 01010 01000 00000 100001 ->  0x012A4021 -> 19546145
ADDU $t3,$t1,$t0 -> 000000 01001 01000 01011 00000 100001 ->  0x01285821 -> 19421217
ADDU $t4,$t0,$t3 -> 000000 01000 01011 01100 00000 100001 ->  0x010B6021 -> 17522721
```
**RESULT:**

<p align="center"> <img src="../img/image44.png" alt=""> </p>

---

### 📊 NOTE: Signed vs. Unsigned in MIPS (32-bit)

| Characteristic                | Signed                      | Unsigned                 |
|------------------------------|-----------------------------|--------------------------|
| **Representation**           | Two's complement            | Pure binary              |
| **Range**                    | -2,147,483,648 to 2,147,483,647 | 0 to 4,294,967,295   |
| **Most Significant Bit (MSB)** | 0 = positive, 1 = negative | Always part of the value |
| **Example of +1**            | `0000 0000 0000 0000 0000 0000 0000 0001` (0x00000001) | Same: `0000 0000 0000 0000 0000 0000 0000 0001` (0x00000001) |
| **Example of -1**            | `1111 1111 1111 1111 1111 1111 1111 1111` (0xFFFFFFFF) | Not defined for unsigned |
| **Maximum value**            | `0111 1111 1111 1111 1111 1111 1111 1111` (0x7FFFFFFF) → 2,147,483,647 | `1111 1111 1111 1111 1111 1111 1111 1111` (0xFFFFFFFF) → 4,294,967,295 |
| **Minimum value**            | `1000 0000 0000 0000 0000 0000 0000 0000` (0x80000000) → -2,147,483,648 | `0000 0000 0000 0000 0000 0000 0000 0000` (0x00000000) → 0 |
| **Arithmetic ops**           | Signed (`add`, `sub`, `mult`, `div`) | Unsigned (`addu`, `subu`, `multu`, `divu`) |
| **Comparisons**              | `slt`, `ble`, `bge`, etc. (signed)   | `sltu`, `bleu`, `bgeu`, etc. (unsigned)   |

#### **Important Notes**
- In MIPS, `add` and `sub` are **signed**; `addu` and `subu` are **unsigned** (no overflow exceptions).
- Mixing signed and unsigned interpretations can yield **unexpected comparisons** if you use the wrong instruction.
- Interpreting an **unsigned** value as **signed** may appear negative.

---

- **SUBU (Subtract Unsigned)**  

Subtracts two registers **without** overflow exceptions. Stores in `Rd` the difference of the integers in `Rs1` and `Rs2`. Useful where you prefer avoiding overflow traps.  

**subu $s1, $s2, $s3** → `\$s1 = \$s2 - \$s3`  
Three operands; overflow is **not detected**.  

```assembly
 $t0 = 0x80000000   # Smallest 32-bit signed number (-2^31)
 $t1 = 1
 sub  $t2, $t0, $t1   # Causes overflow -> Exception
 subu $t3, $t0, $t1   # NO exception; result is "incorrect" if read as signed
```

##### SUB vs SUBU

```assembly
$t2 = $t0 - $t1             |     1000 0000 0000 0000 0000 0000 0000 0000   (-2^31)
    = (-2^31) - (1)         |   + 1111 1111 1111 1111 1111 1111 1111 1111   (-1)
    = -2147483648 - 1       |     ------------------------------------------------
    = -2147483649           |     0111 1111 1111 1111 1111 1111 1111 1111   (+2147483647)
```

In 32 bits, `-2147483649` does not exist (minimum is `-2147483648`, i.e., `1000...000`).  
Trying to compute it wraps to `+2147483647`. MIPS traps on `sub` but not on `subu`.

```assembly
  subu $t0, $a1, $v1 -> 000000 00101 00011 01000 00000 100011 -> 10698787
  subu $t1 ,$v1, $a1 -> 000000 00011 00101 01001 00000 100011 -> 6637603
  subu $t2 ,$t8, $t8 -> 000000 11000 11000 01010 00000 100011 -> 51925027
  subu $t3, $t2, $t1 -> 000000 01010 01001 01011 00000 100011 -> 21583907
```

<p align="center"> <img src="../img/image52.png" alt=""> </p>

- **AND**  
Performs a bitwise AND between two registers.  
Example: `AND R1, R2, R3`

- **OR**  
Performs a bitwise OR between two registers.  
Example: `OR R1, R2, R3`

```assembly
  AND $t0, $a1, $v0 -> 000000 00101 00010 01000 00000 100100 -> 10633252
  AND $t1 ,$s0, $s0 -> 000000 10000 10000 01001 00000 100100 -> 34621476
  AND $t2 ,$t1, $t7 -> 000000 01001 01111 01010 00000 100100 -> 19877924
  AND $t3, $t2, $t1 -> 000000 01010 01001 01011 00000 100100 -> 21583908
  OR  $t4, $t3, $v1 -> 000000 01011 00011 01100 00000 100101 -> 23289893
  OR  $t5, $t4, a0  -> 000000 01100 00100 01101 00000 100101 -> 25454629
```

<p align="center"> <img src="../img/image53.png" alt=""> </p>

- **XOR**  
Performs a bitwise XOR between two registers.  
Example: `XOR R1, R2, R3`

- **NOR**  
Performs a bitwise NOR between two registers.  
Example: `NOR R1, R2, R3`

```assembly
  XOR $t0, $a1, $v0 -> 000000 00101 00010 01000 00000 100110 -> 10633254
  NOR $t1 ,$s0, $s0 -> 000000 10000 10000 01001 00000 100111 -> 34621479
  XOR $t2 ,$t1, $t7 -> 000000 01001 01111 01010 00000 100110 -> 19877926
  NOR $t3, $t2, $t1 -> 000000 01010 01001 01011 00000 100111 -> 21583911
  NOR $t4, $t3, $v1 -> 000000 01011 00011 01100 00000 100111 -> 23289895
  XOR $t5, $t4, a0  -> 000000 01100 00100 01101 00000 100110 -> 25454630
```

<p align="center"> <img src="../img/image54.png" alt=""> </p>

- **SLT (Set on Less Than)**  
Sets a register to 1 if one register is less than another; otherwise sets it to 0.  
Example: `SLT R1, R2, R3`

- **SLTU (Set on Less Than Unsigned)**  
Same as SLT but for **unsigned** comparison.  
Example: `SLTU R1, R2, R3`

**SLT** is useful when values may be negative and you need signed comparison.  
**SLTU** is useful when values must be interpreted as unsigned (e.g., memory addresses, sizes).  
- If both operands are non-negative, **SLT** and **SLTU** yield the same result.  
  They differ when:
  - There are negative values (signed comparison with **SLT**).
  - Very large values under unsigned interpretation (with **SLTU**).

```assembly
     t0 = -5          # signed
     t1 = 10          # signed
     t2 = 4294967290  # unsigned (equivalent to -6 if read as signed)
     t3 = 5           # unsigned

    slt $t4, $t0, $t1     # $t4 = 1 if $t0 < $t1 (signed, -5 < 10)
    add $t6, $t4, a0
    sltu $t5, $t2, $t3    # $t5 = 1 if $t2 < $t3 (unsigned, 4294967290 < 5)
    add $t7, $t5, $t9
```
```assembly
  slt $t4, $t0, $t1	 -> 000000 01000 01001 01100 00000 101010 ->	0x0109602A -> 17391658
  add $t6, $t4, $a0	 -> 000000 01100 00100 01110 00000 100000	->  0x01847020 -> 25456672
  sltu $t5, $t2, $t3 ->	000000 01010 01011 01101 00000 101011	->  0x014B682B -> 21719083
  add $t7, $t5, $t9	 -> 000000 01101 11001 01111 00000 100000	->  0x01B97820 -> 28932128
```

<p align="center"> <img src="../img/image55.png" alt=""> </p>

---


# I-Type  

MIPS is a **load–store architecture**: to use data stored in memory, you must first load it into a register.

`I`-type instructions work with a register and an immediate value (constant), or use a base address to access memory. They are common in arithmetic, logical, and memory access operations.

## LOAD

Arithmetic operations in MIPS occur only between registers. Therefore, MIPS must include instructions that transfer data between memory and registers. These are called **data transfer instructions**.  

To access a word in memory, the instruction must provide the memory address. **Memory is simply a large one-dimensional table**, and the address acts as the index of that table starting from 0.

In MIPS, words must begin at addresses that are multiples of 4. This requirement is called the **alignment restriction**, which is present in many architectures.

MIPS uses **big-endian** ordering. Byte addressing also affects indexing.  
To access the correct address in the example, the offset added to the base register `$s3` must be `4 × 8 = 32`, so that the address corresponds to A[8] and not A[8/4].

<p align="center"> <img src="../img/image22.png" alt=""> </p>

---

- **LB (Load Byte)**  
Loads a byte from memory into a register, with sign extension.  
Example: `LB R1, 0(R2)` or `lb $t0, dir`  

It loads into `$t0` the content of the **byte** at memory address `dir`, extending the sign.

```assembly  
add $s3, $v0, $v0  -> 000000 00010 00010 10011 00000 100000 -> 4364320
LB  $s2 , 16 ($s3) -> 100000 10011 10010 0000000000010000 -> 2188509200
LH  $s1 , 12 ($s3) -> 100001 10011 10001 0000000000001100 -> 2255552524
add $s4 , $s1, $s2 -> 000000 10001 10010 10100 00000 100000 -> 36872224
```

⚠️ Only a **single byte** is loaded, and the sign is extended.  

 **Why sign-extend for `LB $s2 , 16 ($s3)`?**  
The `LB` instruction interprets the byte as a **signed number** in two’s complement.  
The most significant bit (MSB) of the byte determines the sign:

- If the MSB of the first byte at `16($s3)` is **0**, the number is positive, padded with zeros (`0`).
- If the MSB is **1**, the number is negative, padded with ones (`1`).

This process is called **sign extension**, ensuring the value is preserved when expanded from 8 to 32 bits.

<p align="center"> <img src="../img/image56.png" alt=""> </p>

<p align="center"> <img src="../img/image57.png" alt=""> </p>

---

- **LH (Load Halfword)**  
Loads a halfword (16 bits) from memory into a register, with sign extension.  
Example: `LH R1, 0(R2)`

- **LW (Load Word)**  
Loads a word (32 bits) from memory into a register.  
Example: `LW R1, 0(R2)`

- **LWU (Load Word Unsigned)**  
Loads a word from memory into a register, treated as unsigned.  
Example: `LWU R1, 0(R2)`

- **LBU (Load Byte Unsigned)**  
Loads a byte from memory into a register, treated as unsigned.  
Example: `LBU R1, 0(R2)`

- **LHU (Load Halfword Unsigned)**  
Loads a halfword from memory into a register, treated as unsigned.  
Example: `LHU R1, 0(R2)`

- **SB (Store Byte)**  
Stores a byte from a register into memory.  
Example: `SB R1, 0(R2)`

- **SH (Store Halfword)**  
Stores a halfword from a register into memory.  
Example: `SH R1, 0(R2)`

- **SW (Store Word)**  
Stores a word from a register into memory.  
Example: `SW R1, 0(R2)`

<p align="center"> <img src="../img/image23.png" alt=""> </p>

---

- **ADDI (Add Immediate)**  
Adds an immediate value to a register and stores the result.  
Example: `ADDI R1, R2, 10`

- **ADDIU (Add Immediate Unsigned)**  
Adds an unsigned immediate to a register and stores the result.  
Example: `ADDIU R1, R2, 10`

- **ANDI (AND Immediate)**  
Performs a bitwise AND between a register and an immediate.  
Example: `ANDI R1, R2, 0xFF`

- **ORI (OR Immediate)**  
Performs a bitwise OR between a register and an immediate.  
Example: `ORI R1, R2, 0xFF`

- **XORI (XOR Immediate)**  
Performs a bitwise XOR between a register and an immediate.  
Example: `XORI R1, R2, 0xFF`

- **LUI (Load Upper Immediate)**  
Loads an immediate value into the upper 16 bits of a register.  
Example: `LUI R1, 0x1234`

```assembly 
addi $s1, $s2, 12	    001000 10010 10001 0000000000001100	    575733772 
addi $a0, $a1, 10	    001000 00101 00100 0000000000001010	    547618826 
addiu $t1, $t2, 28	  001001 01010 01001 0000000000011100	    625541148 
andi $t4, $t1, 32	    001100 01001 01100 0000000000100000	    824967200 
ori $t0, $t1, 1	      001101 01001 01000 0000000000000001	    891813889
andi $t2, $t1, 7	    001100 01001 01010 0000000000000111	    824836103 
xori $t3, $t1, 8	    001110 01001 01011 0000000000001000	    959119368 
xori $t7, $t1, 9	    001110 01001 01111 0000000000001001	    959381513 
andi $t6, $t2, 12	    001100 01010 01110 0000000000001100	    827195404
ori $a3, $t0, 13	    001101 01000 00111 0000000000001101	    889651213
addiu $t5, $t1, 15	  001001 01001 01101 0000000000001111	    623706127 
```

<p align="center"> <img src="../img/image58.png" alt=""> </p>

- **SLTI (Set on Less Than Immediate)**  
Sets a register to 1 if it is less than an immediate; otherwise 0.  
Example: `SLTI R1, R2, 10`

- **SLTIU (Set on Less Than Immediate Unsigned)**  
Same as SLTI but for unsigned values.  
Example: `SLTIU R1, R2, 10`

- **BEQ (Branch if Equal)**  
Conditional branch if two registers are equal.  
Example: `BEQ R1, R2, Label`

- **BNE (Branch if Not Equal)**  
Conditional branch if two registers are not equal.  
Example: `BNE R1, R2, Label`  

---

# J-Type  

`J`-type instructions are used for jumps in program execution. They include an address in the instruction specifying the jump target.

- **J (Jump)**  
Performs an unconditional jump to a given address.  
Example: `J 0x00400000`

- **JAL (Jump and Link)**  
Jumps to a given address and stores the return address in register `RA`.  
Example: `JAL 0x00400000`

- **JR (Jump Register)**  
Jumps to the address contained in a register.  
Example: `JR R1`

- **JALR (Jump and Link Register)**  
Jumps to the address contained in a register and stores the return address in another register.  
Example: `JALR R1, R2`
