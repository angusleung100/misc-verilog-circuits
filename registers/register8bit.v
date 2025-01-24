`include "registers/register1bit.v"

module register8bit(
  input clk, load, reset,  // Clock, load toggle, and clear
  input[7:0] d,
  output[7:0] q
);

// Group 8 x 1 bit registers

register1bit q7(clk, load, reset, d[7], q[7]);
register1bit q6(clk, load, reset, d[6], q[6]);
register1bit q5(clk, load, reset, d[5], q[5]);
register1bit q4(clk, load, reset, d[4], q[4]);
register1bit q3(clk, load, reset, d[3], q[3]);
register1bit q2(clk, load, reset, d[2], q[2]);
register1bit q1(clk, load, reset, d[1], q[1]);
register1bit q0(clk, load, reset, d[0], q[0]);

endmodule