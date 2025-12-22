import tkinter as tk    
import serial
import subprocess
import serial.tools.list_ports
import time
from tkinter import scrolledtext, messagebox, filedialog, ttk

SENDING_INSTRUCTIONS    = bytes([0b00000001])
DEBUG_MODE              = bytes([0b00000010])
CONTINOUS_MODE          = bytes([0b00000100])  # Note: label kept as in original (typo intentional)
STEP_MODE               = bytes([0b00001000])
END_DEBUG_MODE          = bytes([0b00010000])
PORT                    = '/dev/ttyUSB1'
LOG_COUNTER             = 0  

# Pipeline/CPU structures (default values for table initialization)
id_ex_registers = {
    "RA": 0,
    "RB": 0,
    "Opcode": 0,
    "rs": 0,
    "rt": 0,
    "rd": 0,
    "shamt": 0,
    "funct": 0,
    "imm": 0,
    "jump_address": 0
}

ex_mem_registers = {
    "ALU result": 0
}

control_signals = {
    "jump": 0,
    "branch": 0,
    "regDst": 0,
    "mem2Reg": 0,
    "memRead": 0,
    "memWrite": 0,
    "inmediate flag": 0,
    "sign flag": 0,
    "regWrite": 0,
    "aluSrc": 0,
    "width": 0,
    "aluOp": 0,
    "fwA": 0,
    "fwB": 0
}

data_memory = {
    "Address": 0,
    "Data": 0,
    "MemWrite": 0
}

registers_memory = {
    "Address": 0,
    "Register": 0,
    "Write enable": 0
}


def connect_serial():
    global ser 
    selected_port = ports_combobox.get()  # Get selected port from the Combobox
    try:
        ser = serial.Serial(
            port=selected_port, 
            baudrate=19200,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            bytesize=serial.EIGHTBITS,
        )
        log_message("Connected to " + selected_port)
    except Exception as e:
        messagebox.showerror("Connection", "Error connecting to " + selected_port)

def load_asm_file():
    global bin_file_path
    filepath = filedialog.askopenfilename(filetypes=[("ASM files", "*.asm")])
    if not filepath:
        return
    try:
        with open(filepath, "r", encoding='utf-8') as file:
            content = file.read()
            asm_text.delete(1.0, tk.END)
            asm_text.insert(tk.END, content)
            log_message("ASM file loaded.")
    except:
        messagebox.showerror("File", "Error loading .asm file")

    bin_file_path = filepath.replace(".asm", ".bin")
    try:
        subprocess.run(["python3", "asm_to_bin.py", filepath, bin_file_path], check=True)
        log_message("File converted to binary.")
    except subprocess.CalledProcessError as e:
        messagebox.showerror("File", "Error converting file to .bin")

def send_uart(ser, data):
    if ser and ser.is_open:
        ser.write(data)
        log_message(f"Data sent: {data}")
    else:
        messagebox.showerror("Connection", "Not connected to serial port")

    time.sleep(0.05)
    receive_uart()

def get_ports():
    ports = serial.tools.list_ports.comports()
    ports_list = [port.device for port in ports]

    ports_combobox['values'] = ports_list
    if ports_list:
        ports_combobox.current(0)
    else:
        log_message("No ports available")

def load_program():
    # If you want to force requiring a .bin, restore the check below
    # if not bin_file_path:
    #     messagebox.showerror("File", "No .bin file loaded")
    if not bin_file_path:
        messagebox.showerror("File", "No .asm file loaded")
        return
    # Send LOAD PROGRAM byte
    ser.write(SENDING_INSTRUCTIONS)

    try:
        with open(bin_file_path, "rb") as bin_file:
            data = bin_file.read(1)
            while data:
                ser.write(data)
                # time.sleep(0.01)                        # 10 ms pause
                print(f"Sending byte: {data.hex()}")  # 👈 Print the byte in hex to console
                data = bin_file.read(1)
        log_message("Program loaded to FPGA.")
    except Exception as e:
        messagebox.showerror("File", f"Error loading program: {str(e)}")

def receive_uart():
    # Receives 32-bit A data and updates the register table
    aux = receive_data("AUX" , ser)
    id_ex_data = receive_data("ID_EX", ser)
    if id_ex_data == -1:
        log_message("Error receiving ID_EX data.")
        return
    ex_mem_data = receive_data("EX_MEM", ser)
    if ex_mem_data == -1:
        log_message("Error receiving EX_MEM data.")
        return
    memory_data = receive_data("MEMORY", ser)
    if memory_data == -1:
        log_message("Error receiving MEMORY data.")
        return
    registers_data = receive_data("REGISTERS", ser)
    if registers_data == -1:
        log_message("Error receiving REGISTERS data.")
        return
    control_data = receive_data("CONTROL", ser)
    if control_data == -1:
        log_message("Error receiving CONTROL data.")
        return
    
    id_ex_decoded = decode_data("ID_EX", id_ex_data)
    ex_mem_decoded = decode_data("EX_MEM", ex_mem_data)
    data_decoded = decode_data("DATA", memory_data)
    registers_decoded = decode_data("REGISTERS", registers_data)
    control_decoded = decode_data("CONTROL", control_data)

    # Update tables with received data
    # Update ID_EX table
    id_ex_table.delete(*id_ex_table.get_children())  # Clear table
    for key, value in id_ex_decoded.items():
        id_ex_table.insert("", "end", values=(key, value))

    # Update EX_MEM table
    ex_mem_table.delete(*ex_mem_table.get_children())  # Clear table
    for key, value in ex_mem_decoded.items():
        ex_mem_table.insert("", "end", values=(key, value))

    # Update CONTROL table
    control_table.delete(*control_table.get_children())  # Clear table
    for key, value in control_decoded.items():
        control_table.insert("", "end", values=(key, value))

    # Update DATA MEMORY table
    # memWrite = control_signals["memWrite"]
    address = data_decoded["Address"]
    data = data_decoded["Data"]
    memWrite = data_decoded["MemWrite"]

    if(memWrite):
        # Find the row matching the address and update the value
        for item in data_table.get_children():
            item_values = data_table.item(item, "values")
            if int(item_values[0]) == address:  # Compare address
                data_table.item(item, values=(address, data))  # Update value
                break

    # Update REGISTERS table
    address = registers_decoded["Address"]
    register = registers_decoded["Register"]
    write_enable = registers_decoded["Write enable"]

    if(write_enable):
        # Find the row matching the register and update the value
        for item in registers_table.get_children():
            item_values = registers_table.item(item, "values")
            if int(item_values[0]) == address:
                registers_table.item(item, values=(address, register))
                break

    log_message("Updated tables with received data.")
    
def receive_data(type, ser):
    if type == "ID_EX":
        # rcv = ser.read(1)
        rcv = ser.read(18) # Read 18 bytes (144 bits) for ID_EX
    elif type == "EX_MEM":
        rcv = ser.read(4) # Read 4 bytes (32 bits) for EX_MEM
    elif type == "MEMORY":
        rcv = ser.read(6) # Read 6 bytes (48 bits) for MEMORY
    elif type == "REGISTERS":
        rcv = ser.read(5) # Read 5 bytes (40 bits) for REGISTERS
    elif type == "CONTROL":
        rcv = ser.read(3) # Read 3 bytes (24 bits) for CONTROL
    elif type == "AUX":
        rcv = ser.read(1) # Read 1 byte for AUX
    else:
        log_message("Invalid data type received.")
        return -1
    
    return rcv

def decode_data(type, data):
    # Convert bytes to a single integer
    concatenated_data = int.from_bytes(data, byteorder='big')
    
    if type == "ID_EX":
        # Convert bytes to a single integer
        concatenated_data = int.from_bytes(data, byteorder='big')
        return {
            "RA": format((concatenated_data >> 112) & 0xFFFFFFFF, '032b'),   # 32 bits as binary string
            "RB": format((concatenated_data >> 80) & 0xFFFFFFFF, '032b'),    # 32 bits as binary string
            "Opcode": format((concatenated_data >> 74) & 0x3F, '06b'),       # 6-bit binary
            "rs": format((concatenated_data >> 69) & 0x1F, '05b'),           # 5-bit binary
            "rt": format((concatenated_data >> 64) & 0x1F, '05b'),           # 5-bit binary
            "rd": format((concatenated_data >> 59) & 0x1F, '05b'),           # 5-bit binary
            "shamt": format((concatenated_data >> 54) & 0x1F, '05b'),        # 5-bit binary
            "funct": format((concatenated_data >> 48) & 0x3F, '06b'),        # 6-bit binary
            "imm": format((concatenated_data >> 32) & 0xFFFF, '016b'),       # 16-bit binary
            "jump_address": format(concatenated_data & 0xFFFFFFFF, '032b'),  # 32-bit binary
        }
    elif type == "EX_MEM":
        return {
            "ALU result": format(int.from_bytes(data[0:4], byteorder='big'), '032b')
        }
    elif type == "DATA":
        concatenated_data = int.from_bytes(data, byteorder='big')
        return {
            "Data": format(int.from_bytes(data[0:4], byteorder='big'), '032b'), # 32-bit binary
            "Address": data[4] % 32,                                            # 8-bit value, modulo table size
            "MemWrite": (concatenated_data >> 7) & 0x1
        }
    elif type == "REGISTERS":
        concatenated_data = int.from_bytes(data, byteorder='big')
        return {
            "Register": format((concatenated_data >> 8) & 0xFFFFFFFF, '032b'), # 32-bit binary
            "Address": (concatenated_data >> 3) & 0x1F,                        # 5-bit value
            "Write enable": (concatenated_data >> 2) & 0x1,                    # 1-bit value
        }
    elif type == "CONTROL":
        concatenated_data = int.from_bytes(data, byteorder='big')
        return {
            "jump": (concatenated_data >> 23) & 0x1,
            "branch": (concatenated_data >> 22) & 0x1,
            "regDst": (concatenated_data >> 21) & 0x1,
            "mem2Reg": (concatenated_data >> 20) & 0x1,
            "memRead": (concatenated_data >> 19) & 0x1,
            "memWrite": (concatenated_data >> 18) & 0x1,
            "inmediate flag": (concatenated_data >> 17) & 0x1,
            "sign flag": (concatenated_data >> 16) & 0x1,
            "regWrite": (concatenated_data >> 15) & 0x1,
            "aluSrc": format((concatenated_data >> 13) & 0x3, '02b'),
            "width": format((concatenated_data >> 11) & 0x3, '02b'),
            "aluOp": format((concatenated_data >> 9) & 0x3, '02b'),
            "fwA": format((concatenated_data >> 7) & 0x3, '02b'),
            "fwB": format((concatenated_data >> 5) & 0x3, '02b')
        }
    return {}  # Return empty dict if type does not match

def clean_table():
    # Reset ID_EX table
    id_ex_table.delete(*id_ex_table.get_children())
    for key, value in id_ex_registers.items():
        id_ex_table.insert("", "end", values=(key, "0"))

    # Reset EX_MEM table
    ex_mem_table.delete(*ex_mem_table.get_children())
    for key, value in ex_mem_registers.items():
        ex_mem_table.insert("", "end", values=(key, "0"))

    # Reset CONTROL table
    control_table.delete(*control_table.get_children())
    for key, value in control_signals.items():
        control_table.insert("", "end", values=(key, "0"))

    # Reset DATA MEMORY table (32 entries)
    data_table.delete(*data_table.get_children())
    for i in range(32):
        data_table.insert("", tk.END, values=((i), (0)))

    # Reset REGISTERS table (32 entries)
    registers_table.delete(*registers_table.get_children())
    for i in range(32):
        registers_table.insert("", tk.END, values=((i), (0)))

def log_message(msg):
    global LOG_COUNTER
    timestamp = time.strftime("%H:%M:%S")  # Format: HH:MM:SS

    formatted_msg = f"[{LOG_COUNTER:02d}] {timestamp} | {msg}"

    log_box.configure(state='normal')
    log_box.insert(tk.END, formatted_msg + "\n")
    log_box.see(tk.END)  # Scroll to the end
    log_box.configure(state='disabled')

    LOG_COUNTER += 1

def start_debug():
    ser.write(DEBUG_MODE)
    log_message("Debug mode started")
    
def end_debug():
    send_uart(ser, END_DEBUG_MODE)
    log_message("Debug mode ended")

def upload_and_load():
    load_asm_file()  # Sets the file and displays it
    load_program()   # Loads it into memory

window = tk.Tk()
window.title("DEBUG UNIT")
baudrate = tk.IntVar(value=19200)
port = tk.StringVar(value='/dev/ttyUSB1')

# Dark theme colors
# BG = "#1e1e2e"
# PANEL_BG = "#2a2a3c"
# TEXT_COLOR = "#f5f5f5"
# ACCENT = "#89b4fa"
BG = "#06111f"
PANEL_BG = "#091428"
TEXT_COLOR = "#f5f5f5"
ACCENT = "#f5f5f5"

style = ttk.Style()
style.theme_use("clam")
style.configure("TFrame", background=BG)
style.configure("TLabel", background=BG, foreground=TEXT_COLOR)
style.configure("TButton", background=PANEL_BG, foreground=TEXT_COLOR, padding=6, relief="flat")
style.map("TButton", background=[('active', '#3b3b5c')], foreground=[('pressed', '#ffffff'), ('active', '#ffffff')])
style.configure("TCombobox", fieldbackground=PANEL_BG, background=BG, foreground=TEXT_COLOR)
style.configure("Treeview", background=PANEL_BG, fieldbackground=PANEL_BG, foreground=TEXT_COLOR)
style.configure("Treeview.Heading", background=BG, foreground=ACCENT)

window.configure(bg=BG)

# Make main window resizable
for i in range(4):
    window.grid_columnconfigure(i, weight=1)
window.grid_rowconfigure(0, weight=1)

# COLUMN 0 - LEFT PANEL: Controls and file management
left_panel = ttk.Frame(window)
left_panel.grid(row=0, column=0, sticky="nsew", padx=5, pady=5)

# Group 1: GET PORTS, CONNECT, UPLOAD & LOAD (top)
group1 = ttk.Frame(left_panel)
group1.pack(pady=(5, 10), fill='x')

ttk.Button(group1, text="GET PORTS", command=get_ports).pack(pady=2, fill='x')
ttk.Button(group1, text="CONNECT", command=connect_serial).pack(pady=2, fill='x')
ttk.Button(group1, text="UPLOAD & LOAD", command=upload_and_load).pack(pady=2, fill='x')

# Ports dropdown & baudrate below the group
ports_combobox = ttk.Combobox(left_panel)
ports_combobox.pack(pady=2, fill='x')

tk.Label(left_panel, text="BAUDRATE:", bg=BG, fg=TEXT_COLOR).pack(pady=2)
baudrate_entry = tk.Entry(left_panel, textvariable=baudrate, width=20, bg=PANEL_BG, fg=TEXT_COLOR, insertbackground=TEXT_COLOR, relief="flat")
baudrate_entry.pack(pady=2, fill='x')

# Group 2: CONTINOUS (single button, accent color)
group2 = ttk.Frame(left_panel)
group2.pack(pady=(10, 10), fill='x')

style.configure("Accent.TButton", background="#5e81ac", foreground="#ffffff")
style.map("Accent.TButton", background=[('active', '#81a1c1')])

ttk.Button(group2, text="CONTINOUS", command=lambda: send_uart(ser, CONTINOUS_MODE), style="Accent.TButton").pack(pady=2, fill='x')

# Group 3: DEBUG, STEP, END DEBUG (different colors)
group3 = ttk.Frame(left_panel)
group3.pack(pady=(10, 10), fill='x')

style.configure("Debug.TButton", background="#a3be8c", foreground="#000000")
style.map("Debug.TButton", background=[('active', '#b5cea8')])
style.configure("EndDebug.TButton", background="#f38ba8", foreground="#000000")
style.map("EndDebug.TButton", background=[('active', '#f7768e')])

ttk.Button(group3, text="DEBUG", command=start_debug, style="Debug.TButton").pack(pady=2, fill='x')
ttk.Button(group3, text="STEP", command=lambda: send_uart(ser, STEP_MODE), style="Debug.TButton").pack(pady=2, fill='x')
ttk.Button(group3, text="END DEBUG", command=end_debug, style="EndDebug.TButton").pack(pady=2, fill='x')

# Group 4: CLEAN TABLES (single button)
group4 = ttk.Frame(left_panel)
group4.pack(pady=(10, 10), fill='x')

ttk.Button(group4, text="CLEAN TABLES", command=clean_table).pack(pady=2, fill='x')

tk.Label(left_panel, text="ASM FILE:", bg=BG, fg=TEXT_COLOR).pack(pady=2)
asm_text = scrolledtext.ScrolledText(left_panel, width=40, height=10, bg=BG, fg=TEXT_COLOR, insertbackground=TEXT_COLOR, relief='flat')
asm_text.pack(pady=2, fill='both', expand=True)

# COLUMN 1 - Data & Register Memory
memory_panel = ttk.Frame(window)
memory_panel.grid(row=0, column=1, sticky="nsew", padx=5, pady=5)
window.grid_columnconfigure(1, weight=1)
memory_panel.grid_rowconfigure(1, weight=1)
memory_panel.grid_rowconfigure(3, weight=1)

tk.Label(memory_panel, text="DATA MEMORY", bg=BG, fg=ACCENT).pack()
data_table = ttk.Treeview(memory_panel, columns=("address", "value"), show='headings')
data_table.heading("address", text="Address")
data_table.heading("value", text="Value")
data_table.column("address", width=30)
data_table.pack(padx=5, pady=5, fill='both', expand=True)
for i in range(32):
    data_table.insert("", tk.END, values=((i), (0)))

tk.Label(memory_panel, text="REGISTERS", bg=BG, fg=ACCENT).pack()
registers_table = ttk.Treeview(memory_panel, columns=("address", "value"), show='headings')
registers_table.heading("address", text="Address")
registers_table.heading("value", text="Value")
registers_table.column("address", width=30)
registers_table.pack(padx=5, pady=5, fill='both', expand=True)
for i in range(32):
    registers_table.insert("", tk.END, values=((i), (0)))

# COLUMN 2 - ID_EX + EX_MEM
pipeline_panel = ttk.Frame(window)
pipeline_panel.grid(row=0, column=2, sticky="nsew", padx=5, pady=5)
window.grid_columnconfigure(2, weight=1)
pipeline_panel.grid_rowconfigure(1, weight=1)
pipeline_panel.grid_rowconfigure(3, weight=1)

tk.Label(pipeline_panel, text="ID_EX", bg=BG, fg=ACCENT).pack()
id_ex_table = ttk.Treeview(pipeline_panel, columns=("Field", "Value"), show='headings')
id_ex_table.heading("Field", text="Field")
id_ex_table.heading("Value", text="Value")
id_ex_table.column("Field", width=30)
id_ex_table.pack(padx=5, pady=5, fill='both', expand=True)
for key, value in id_ex_registers.items():
    id_ex_table.insert("", tk.END, values=(key, value))

tk.Label(pipeline_panel, text="EX_MEM", bg=BG, fg=ACCENT).pack()
ex_mem_table = ttk.Treeview(pipeline_panel, columns=("Field", "Value"), show='headings')
ex_mem_table.heading("Field", text="Field")
ex_mem_table.heading("Value", text="Value")
ex_mem_table.column("Field", width=30)
ex_mem_table.pack(padx=5, pady=5, fill='both', expand=True)
for key, value in ex_mem_registers.items():
    ex_mem_table.insert("", tk.END, values=(key, value))

# COLUMN 3 - CONTROL + LOG BOX
control_panel = ttk.Frame(window)
control_panel.grid(row=0, column=3, sticky="nsew", padx=5, pady=5)
window.grid_columnconfigure(3, weight=1)
control_panel.grid_rowconfigure(2, weight=1)

tk.Label(control_panel, text="CONTROL", bg=BG, fg=ACCENT).pack()
control_table = ttk.Treeview(control_panel, columns=("Signal", "Value"), show='headings')
control_table.heading("Signal", text="Signal")
control_table.heading("Value", text="Value")
control_table.column("Signal", width=30)
control_table.pack(padx=5, pady=5, fill='both', expand=True)
for key, value in control_signals.items():
    control_table.insert("", tk.END, values=(key, value))

# LOG BOX at the bottom of the control panel
tk.Label(control_panel, text="LOG", bg=BG, fg=ACCENT).pack(pady=(10, 0))
log_box = scrolledtext.ScrolledText(control_panel, width=40, height=10, state='disabled', wrap='word', bg=BG, fg=TEXT_COLOR, insertbackground=TEXT_COLOR, relief='flat')
log_box.pack(padx=5, pady=5, fill='both', expand=True)

ser = None

window.mainloop()
