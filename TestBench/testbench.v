`timescale 1ns / 1ps
module testbench;

	// Inputs
	reg [2:0] portA;
	reg [2:0] portB;
	reg [1:0] opcode;
	reg sh_now;
	reg clk;
	reg rst;

	// Outputs
	wire [0:6] sevenseg;
	wire [3:0] anode;
	//wire [15:0] vis;
	//wire testFlanco;


	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.portA(portA),
		.portB(portB),
		.opcode(opcode),
		.sevenseg(sevenseg),
		.anode(anode),
        //.visualizar(vis),
	    //.testFlanco(testFlanco),
        .sh_now(sh_now),
		.clk(clk),
		.rst(rst)
	);


	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		portA=5;
		portB=0;
		sh_now=0;

		// Wait 100 ns for global reset to finish

		/*
		// Descomentar para simular funcionamiento del sh_r
		opcode = 0;
		rst = 1;
		#10 rst = 0;
		#500000 sh_now = 1; #50000 sh_now = 0;
		#1000000 sh_now = 1; #1050000 sh_now = 0; //Para ver como, si se deja pulsado, no se hacen varios shifts sino solo 1
		#1000000 sh_now = 1; #50000 sh_now = 0;
        */
        
        /*
		// Descomentar para simular funcionamiento del sh_l
		opcode = 1;
		rst = 1;
		#10 rst = 0;
		#500000 sh_now = 1; #50000 sh_now = 0;
		#1000000 sh_now = 1; #1050000 sh_now = 0; //Para ver como, si se deja pulsado, no se hacen varios shifts sino solo 1
		#1000000 sh_now = 1; #50000 sh_now = 0;
        */

        /*
        // Descomentar para simular funcionamiento del comparador
		portA = 0;
		opcode = 2;
        #500000;
		portA=3;
		#1000000;
		portA=0;
		#1000000;
		portA=5;
		*/

		
		// Descomentar para simular funcionamiento del divisor
		portA=7;
		portB=2;
		opcode = 3;
		#500000;
		portA=3;
		portB=3;
		#1000000;
		portA=4;
		portB=2;
		#1000000;
		portA=5;
		portB=6;
		#1000000;
		portA=5;
		portB=1;
		
	end

	always #1 clk = ~clk;

	initial begin
	     $dumpfile("alu.vcd");
	     $dumpvars(0,testbench);
	     #(45000000) $finish;
	   end
endmodule
