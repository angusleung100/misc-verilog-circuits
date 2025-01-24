module register4bit_test;

  // Initialize values
  reg clk = 0;
  reg reset = 0;
  reg load = 0;
  reg[3:0] d = 4'b0000;
  wire[3:0] q;
  
  register4bit r4bit (clk, load, reset, d, q);

  // 5ns clock pulses
  initial begin
    forever #5 clk = !clk;
  end

  initial begin

    $dumpfile("out/register4bit_wave.vcd");
    $dumpvars(0, register4bit_test);

    // Test loading toggle and data load
    # 10 load = 1; d = 4'b1111; // Load 1111
    # 10 load = 0; d = 4'b0000;


    # 10 load = 0; d = 4'b1001; // Load 1111 without load toggle
    # 10 load = 0; d = 4'b0000;

    # 10 load = 1; d = 4'b0111; // Load 0111 with load toggle
    # 10 load = 0; d = 4'b0000; // Reset load and data inputs

    // Test reset state
    # 10 reset = 1; // Reset to 0000
    # 10 reset = 0;

    # 10 load = 1; d = 4'b0110; // Load 0110 with load toggle
    # 10 load = 0; d = 0; // Reset load and data inputs

    # 10 $stop;
  end

  

  initial
     $monitor("At time %t: clk = %b, reset = %b, load = %b, d = %b, q = %b", $time, clk, reset, load, d, q);
endmodule