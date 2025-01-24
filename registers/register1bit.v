module register1bit(
  input clk, load, reset,  // Clock, load toggle, and clear
  input d,
  output reg q
);

always @ (posedge clk)

begin

  // Parallel load only when toggled
  if(load == 1) begin
    q <= d;
  end  
  else if(reset == 1) begin
    q <= 1'b0;
  end
end



endmodule