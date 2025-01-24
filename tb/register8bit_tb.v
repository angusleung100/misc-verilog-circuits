module register8bit_test;

  // Initialize values
  reg clk = 0;
  reg reset = 0;
  reg load = 0;
  reg[7:0] d = 8'bx;
  wire[7:0] q;
  
  register8bit r8bit (clk, load, reset, d, q);

  // 5ns clock pulses
  initial begin
    forever #5 clk = !clk;
  end

  initial begin

    $dumpfile("out/register8bit_wave.vcd");
    $dumpvars(0, register8bit_test);

    // Test loading toggle and data load
    # 10 load = 1; d = 8'b1; // Load 1111
    # 10 load = 0; d = 8'b0;


    # 10 load = 0; d = 8'b10101001; // Load 10101001 without load toggle
    # 10 load = 0; d = 8'b0;

    # 10 load = 1; d = 8'b0000111; // Load 0111 with load toggle
    # 10 load = 0; d = 8'b0; // Reset load and data inputs

    // Test reset state
    # 10 reset = 1; // Reset to 0000
    # 10 reset = 0;

    # 10 load = 1; d = 8'b00000110; // Load 00000110 with load toggle
    # 10 load = 0; d = 0; // Reset load and data inputs

    # 10 $stop;
  end

  

  initial
     $monitor("At time %t: clk = %b, reset = %b, load = %b, d = %b, q = %b", $time, clk, reset, load, d, q);
endmodule