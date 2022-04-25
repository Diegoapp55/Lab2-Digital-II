`timescale 1ns / 1ps
`include "sh_l.v"
module sh_l_tb;
// Inputs
reg [2:0] portA;
reg init_sh_l;
reg clk;
reg rst;

// Outputs
wire [3:0] sal_sh_l;

// Instantiate the Unit Under Test (UUT)
sh_l uut (
  .portA(portA),
  .init_sh_l(init_sh_l),
  .clk(clk),
  .rst(rst),
  .sal_sh_l(sal_sh_l)
);


initial begin
  // Initialize Inputs
  init_sh_l = 0;
  clk = 0;
  rst = 1;
  portA = 5;

  // Wait 5 ns for global reset to finish
  #5 rst = 0;
  // Add stimulus here

  #2  init_sh_l = 1;
  #15 rst = 1;
  #2  rst = 0;
  #4  init_sh_l = 0;

end

always #1 clk = ~clk;
initial begin
     $dumpfile("sh_l.vcd");
     $dumpvars(0,sh_l_tb);
     #(40) $finish;
   end

endmodule
