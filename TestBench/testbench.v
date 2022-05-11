`timescale 1ns / 1ps
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
	//wire [15:0] vis;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.portA(portA),
		.portB(portB),
		.opcode(opcode),
		.sevenseg(sevenseg),
		.anode(anode),
        //.visualizar(vis),
		.clk(clk),
		.rst(rst)
	);


	initial begin
		// Initialize Inputs
		opcode = 0;
		clk = 0;
		rst = 1;
		portA=7;
		portB=0;

		// Wait 100 ns for global reset to finish
		#10;

		rst = 0;

		// Add stimulus here

		#500000 opcode = 1;

		// rst = 1;
		// #2 rst=0;
		#500000 portA = 0;
		opcode = 2;

		// rst = 1;
		// #2 rst=0;
		#500000 opcode = 3;
		portA=7;
		portB=2;

		//rst = 1;

	end

	always #1 clk = ~clk;

	initial begin
	     $dumpfile("alu.vcd");
	     $dumpvars(0,testbench);
	     #(30000000) $finish;
	   end
endmodule
