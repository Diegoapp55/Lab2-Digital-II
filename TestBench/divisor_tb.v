`timescale 1ns / 1ps
module divisor_tb;
// Inputs
reg [2:0] A;
reg [2:0] B;
reg clk;
reg init;
// Outputs
wire [2:0] cociente;
//wire [2:0] residuo;

initial
begin
// Initialize inputs
    clk = 0;

	#10 init = 1;
	A = 7;
	B = 2;

	#100;
	A = 1;
	B = 3;

	#100;
	A = 4;
	B = 2;

	#50 init = 0; //Para simular que se cambió de opcode y debería dejar de dividir
	#50	A = 6;
	B = 3;

	#100;
	A = 2;
	B = 7;

  end
// Instantiate the unit under test (UUT)
divisor uut
(
.A (A),
.B (B),
.clk(clk),
.init(init),
.cociente (cociente)
//.residuo (residuo)
);

always #1 clk = ~clk;
initial begin
    //$fsdbDumpvars();
    $dumpvars();
    #1000 $finish;
end

endmodule
