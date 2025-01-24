module register1bit_test;

  // Initialize values
  reg clk = 0;
  reg reset = 0;
  reg load = 0;
  reg d = 0;
  wire q;
  
  register1bit r1bit (clk, load, reset, d, q);

  // 5ns clock pulses
  initial begin
    forever #5 clk = !clk;
  end

  initial begin

    $dumpfile("out/register1bit_wave.vcd");
    $dumpvars(0, register1bit_test);

    // Test loading toggle and data load
    # 10 load = 1; d = 1;
    # 10 load = 0; d = 1;
    # 10 load = 1; d = 0;

    # 10 load = 1; d = 1; // Set to 1 to test reset
    # 10 load = 0; d = 0; // Reset load and data inputs

    // Test reset state
    # 10 reset = 1; 
    # 10 reset = 0;

    # 10 $stop;
  end

  

  initial
     $monitor("At time %t: clk = %b, reset = %b, load = %b, d = %b, q = %b", $time, clk, reset, load, d, q);
endmodule