`timescale 1ns / 1ps
module zero_tb;
  // Inputs
  reg [2:0] portA;
  reg init_isZero;
  reg clk;
  // Outputs
  wire comp;

  // Instantiate the Unit Under Test (UUT)
  zero uut (
    .portA(portA),
    .init_isZero,
    .clk(clk),
    .comp(comp)
  );

  initial begin
    // Initialize Inputs
    init_isZero = 0;
    clk = 0;

    // Add stimulus here
       portA = 7;
    #5 portA = 2;
    #5 portA = 3;
    #5 portA = 0;
    #5 portA = 1;

    #5 init_isZero = 1;

       portA = 5;
    #5 portA = 6;
    #5 portA = 0;
    #5 portA = 1;
    #5 portA = 2;

  end

  always #1 clk = ~clk;
  initial begin
       $dumpfile("zero.vcd");
       $dumpvars(0,zero_tb);
       #(50) $finish;
     end
endmodule
