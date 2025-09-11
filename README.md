# Implement a UART Communication Interface for the Arithmetic Logic Unit (ALU)

This serial communication will allow the ALU to receive operands and the operator through the serial port (RX), and transmit the result via the same channel (TX).

<p align="center">
    <img src="img/image1.png" alt="block">
</p>

---

# Theoretical Framework

### UART (Universal Asynchronous Receiver-Transmitter)

It is a simple two-wire protocol used to exchange serial data.

- **Asynchronous** means there is no shared clock between devices. For UART to work correctly, both ends of the connection must be configured with the same baud rate or bits per second.

- **Start and stop bits**: These are used to indicate where user data begins and ends, allowing data framing.

- **Parity bit**: Optionally, a parity bit can be used to detect single-bit errors.

Although **UART** is still widely used, in recent years it has been replaced in some applications by technologies such as **SPI**, **I2C**, **USB**, and **Ethernet**.

#### Operation

<p align="center">
    <img src="img/image2.png" alt="block">
</p>

The UART protocol works as follows, both for transmitting and receiving data:

1. **Transition detection**: Initially, the line is at 1, indicating no communication. When transmission is desired, the line goes low (0) to start the transmission.

2. **Sampling incoming data**: After the start bit time, the full byte begins transmission, starting with the **least significant bit (LSB)**. At the end, the parity bit is sent, which allows verifying whether the transmitted and received data is correct.

3. **Stop bit sampling**: This bit indicates that the transmission or reception of data has been completed.

The trick of this protocol is to sample each bit exactly in the middle of its period. This ensures there is no ambiguity in the information. On an **FPGA**, care must be taken to sample at the rising edge of the sampling signal.

### Tick Generation

**Baud Rate:** The transmission speed of data, measured in symbols per second. For example, a Baud Rate of 19,200 means 19,200 symbols are transmitted per second.

- For a Baud Rate of 19,200 bps, **16 samples** _(TICKS)_ are required per transmitted bit. This ensures capturing the signal at different times within each bit, allowing better detection of signal states.

- The sampling frequency is calculated as:
  - Sampling frequency = Baud Rate × 16  
  - Sampling frequency = 19,200 bps × 16 = 307,200 ticks per second

#### Relation with the Board Clock

- If the board clock is **100 MHz**, it generates **100,000,000 cycles** per second. To determine how many clock cycles are needed to generate a tick, the calculation is:
  - Clock cycles per tick = Clock frequency / Sampling frequency  
  - Clock cycles per tick = 100,000,000 Hz / 307,200 ticks per second ≈ 326 clock cycles

#### Baud Rate Generator

The `baud_rate` module generates a periodic synchronization signal, called `tick`, at a lower frequency than the input clock.

- The **Baud Rate Generator** is a counter that counts up to **163** (the number of clock cycles needed to generate a tick) and then resets. When the counter reaches this value, it generates a tick (sampling signal).

- This counter can be implemented in Verilog or in hardware in other ways. Each time the counter resets, it indicates the elapsed time to sample one bit of data.

#### SUMMARY:

1. **Baud Rate** of 19,200 bps requires 16 samples per bit, resulting in a sampling frequency of 307,200 ticks per second.  
2. With a 50 MHz clock, each tick is generated every 163 clock cycles.  
3. The Baud Rate Generator counts to 163 to generate the required ticks for UART transmission.

This ensures the UART system can read and transmit data accurately and reliably.

---

# Implementation

The main function of the PC’s serial communication module is to transmit each bit of a byte individually. The developed UART module receives these bits into an RX FIFO queue, where they are reassembled into complete bytes, and then sent to the ALU.

Once the ALU performs the operation, the result is placed in the TX FIFO queue and transmitted through the serial port to the PC, which is waiting for the data. This is represented by the following diagram:

<p align="center">
  <img src="img/image3.png" alt="block">
</p>

<p align="center">
  <img src="img/image12.png" alt="block">
</p>

The state machine is represented by an interface module between the ALU and the UART module, as well as the FIFO module managing data read/write operations. The system is composed of four interrelated state machines:

1. **UART Transmitter State Machine**: Controls the process of transmitting data through UART, ensuring correct sequencing of data bits and the control of start/stop signals.  

<p align="center">
    <img src="img/image5.png" alt="block">
</p>

2. **UART Receiver State Machine**: Handles data reception through UART, managing detection of the start of transmission, capturing data bits, and signaling reception completion.  

<p align="center">
    <img src="img/image4.png" alt="block">
</p>

3. **FIFO State Machine**: Manages read and write operations in the FIFO memory, controlling read/write pointers, and generating signals indicating whether the FIFO is full or empty.  

<p align="center">
    <img src="img/image6.png" alt="block">
</p>

4. **ALU-UART Interface State Machine**: Coordinates interaction between the ALU and the UART module, managing data reads from the FIFO, selecting ALU operations, and writing results back to the FIFO.  

<p align="center">
    <img src="img/image7.png" alt="block">
</p>

These graphs reflect control logic and events that lead to state changes in each module, enabling effective and synergistic communication between the ALU and the UART module.

## Possible Future Improvements

Additional states **_verify_** and **_error_** could be added in future versions for better system management:

### Error State

In some systems, when parity errors are detected or a timeout occurs without receiving data, an error or timeout state can be defined. This state is used to manage error correction or restart transmission attempts.

### Verification State (Parity Bit)

If parity is used, an extra bit is transmitted to verify data correctness. This parity bit can be even or odd depending on configuration, and it helps detect errors in received data.

## Design Schematic

Graphical representation providing a detailed view of the connections inside the digital design. With this tool, designers can:

- View a graphical representation of the netlist.  
- Review gates, hierarchies, and component connectivity.  
- Trace and expand logic cones for deeper analysis.  
- Analyze the design to identify potential improvements or errors.  
- Better understand the processes inside the design.  

Below is the schematic of the entire program:

<p align="center">
    <img src="img/image8.png" alt="block">
</p>

<p align="center">
    <img src="img/image9.png" alt="block">
</p>

---

# Constraints

The `constraints.xdc` file defines how the design’s logical signals are assigned to the FPGA’s physical pins on the Basys 3 board, as well as other properties like clock frequency and I/O standards. In this case, pins B18 and A18 are used for data reception and transmission, respectively. LEDs, from V14 to U16 (MSB to LSB), display the result that the ALU transmits to the computer. The center button is used to reset the system. The pin assignment is shown below:

<p align="center">
    <img src="img/image11.png" alt="block">
</p>

---

# Test Bench Baud Rate

This test bench verifies the operation of the `baud_rate` module.

### Test Signals

- **i_clk**: Input clock signal.  
- **i_reset**: Reset signal.  
- **o_tick**: Output indicating when a tick is generated.  

### Operation

1. **Clock Generator**: Toggles the clock signal at 50 MHz (every 10 ns).  
2. **Reset Process**: Asserted at the start and held for 30 ns.  
3. **Cycle Counter**: Counts clock cycles until a tick is generated, displaying time and count each time it occurs.  
4. **Monitoring**: Prints the reset and tick state at each relevant instant.  

### Expected Result

The test bench allows observing clock cycle counts and tick generation, confirming correct operation of the `baud_rate` module.

<p align="center">
    <img src="img/image10.png" alt="block">
</p>

---

# ANNEX: Video

The following link presents the physical test implemented on the FPGA for the following operations:
