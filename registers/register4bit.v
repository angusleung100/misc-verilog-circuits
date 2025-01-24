`include "registers/register1bit.v"

module register4bit(
  input clk, load, reset,  // Clock, load toggle, and clear
  input[3:0] d,
  output[3:0] q
);

// Group 4 x 1 bit registers

register1bit q3(clk, load, reset, d[3], q[3]);
register1bit q2(clk, load, reset, d[2], q[2]);
register1bit q1(clk, load, reset, d[1], q[1]);
register1bit q0(clk, load, reset, d[0], q[0]);

endmodule