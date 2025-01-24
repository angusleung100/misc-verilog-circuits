module ram64kb_test;

  // Initialize values
  reg clk = 0;
  reg enable = 0;
  reg readWrite = 0;
  reg[15:0] addr = 16'bx;
  reg[7:0] dataIn = 8'bx;
  wire[7:0] dataOut;
  
  ram64kb ram (clk, enable, readWrite, addr, dataIn, dataOut);

  // 5ns clock pulses
  initial begin
    forever #5 clk = !clk;
  end

  initial begin

    $dumpfile("out/ram64kb_wave.vcd");
    $dumpvars(0, ram64kb_test);

    // Test enable and data write
    # 10 enable = 1; readWrite = 0; addr = 16'b0; dataIn = 8'b10101010;

    // Test enable and data read
    # 10 enable = 1; readWrite = 1; addr = 16'b0;

    // Test no enabling and data read
    # 10 enable = 0; readWrite = 1; addr = 16'b0;

    // Test no enabling and data write
    # 10 enable = 0; readWrite = 0; addr = 16'b0000000000000001; dataIn = 8'b1;

    // Test enable and data read from unused location
    # 10 enable = 1; readWrite = 1; addr = 16'b0000000000000010;

    // Test enabling and data read from test case 3 write
    # 10 enable = 1; readWrite = 1; addr = 16'b0000000000000001;

    // Test no enable and data write to another location
    # 10 enable = 0; readWrite = 0; addr = 16'b0000000000000010; dataIn = 8'b1;

    // Test enabling and data read from test case 5 write
    # 10 enable = 1; readWrite = 1; addr = 16'b0000000000000010;

    // Test enable and data overwrite
    # 10 enable = 1; readWrite = 0; addr = 16'b0; dataIn = 8'b01010111;

    // Test enable and data read from an old location
    # 10 enable = 1; readWrite = 1; addr = 16'b0;
   


    # 10 $stop;
  end

  

  initial
     $monitor("At time %t: clk = %b, enable = %b, readWrite = %b, addr = %b, dataIn = %b, dataOut = %b", $time, clk, enable, readWrite, addr, dataIn, dataOut);
endmodule