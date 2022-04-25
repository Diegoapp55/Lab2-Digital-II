//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   22:10:33 09/15/2019
// Design Name:   alu
// Module Name:   C:/Users/UECCI/Desktop/ejer01/ALU/alu/testbench.v
// Project Name:  alu
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [2:0] portA;
	reg [2:0] portB;
	reg [1:0] opcode;
	reg clk;
	reg rst;

	// Outputs
	wire [0:6] sevenseg;
	wire [3:0] anode;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.portA(portA),
		.portB(portB),
		.opcode(opcode),
		.sevenseg(sevenseg),
		.anode(anode),
		.clk(clk),
		.rst(rst)
	);


	initial begin
		// Initialize Inputs
		opcode = 0;
		clk = 0;
		rst = 1;
		portA=5;
		portB=3;

		// Wait 100 ns for global reset to finish
		#10;

		rst = 0;
		
		// Add stimulus here

		#500000 opcode = 0;

		rst = 1;
		#2 rst=0;
		#500000 opcode = 1;

		rst = 1;
		#2 rst=0;
		#500000 opcode = 2;

		//rst = 1;
		//#50 opcode = 3;

	end

	always #1 clk = ~clk;

	initial begin
	     $dumpfile("alu.vcd");
	     $dumpvars(0,testbench);
	     #(2100000) $finish;
	   end
endmodule
