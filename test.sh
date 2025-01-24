#   Register 1 bit 
C:\iverilog\bin\iverilog.exe -o register1bit tb/register1bit_tb.v registers/register1bit.v
C:\iverilog\bin\vvp.exe register1bit

# Register 4 bit
C:\iverilog\bin\iverilog.exe -o register4bit tb/register4bit_tb.v registers/register4bit.v
C:\iverilog\bin\vvp.exe register4bit

# Register 4 bit
C:\iverilog\bin\iverilog.exe -o register8bit tb/register8bit_tb.v registers/register8bit.v
C:\iverilog\bin\vvp.exe register8bit

# RAM 64kb bit
C:\iverilog\bin\iverilog.exe -o ram64kb tb/ram64kb_tb.v ram64kb.v
C:\iverilog\bin\vvp.exe ram64kb
