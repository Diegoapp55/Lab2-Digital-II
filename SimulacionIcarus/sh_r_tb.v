`timescale 1ns / 1ps
//`include "sh_r.v"
module sh_r_tb;
// Inputs
reg [2:0] portA;
reg init_sh_r;
reg clk;
reg rst;

// Outputs
wire [3:0] sal_sh_r;

// Instantiate the Unit Under Test (UUT)
sh_r uut (
  .portA(portA),
  .init_sh_r(init_sh_r),
  .clk(clk),
  .rst(rst),
  .sal_sh_r(sal_sh_r)
);


initial begin
  // Initialize Inputs
  init_sh_r = 0;
  clk = 0;
  rst = 1;
  portA = 5;

  // Wait 5 ns for global reset to finish
  #5 rst = 0;
  // Add stimulus here

  #2  init_sh_r = 1;
  #15 rst = 1;
  #2  rst = 0;
  #4  init_sh_r = 0;

end

always #1 clk = ~clk;
initial begin
     $dumpfile("sh_r.vcd");
     $dumpvars(0,sh_r_tb);
     #(40) $finish;
   end

endmodule
