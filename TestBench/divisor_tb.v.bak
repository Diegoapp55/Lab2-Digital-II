`timescale 1ns / 1ps
module divisor_tb;
// Inputs
  reg [2:0] DV;
  reg [2:0] DR;
  reg start;
  reg clk;

// Outputs
  wire [3:0] resultado;
// Señales para hacer depuración en la simulación, comentar para implementar
  wire [1:0] testN;
  wire testZ;
  wire testDone;
  wire [5:0] testDV;
  wire [2:0] testA;
  wire testdv0;


// Instantiate the unit under test (UUT)
divisor uut(
  .DV(DV),
  .DR(DR),
  .start(start),
  .clk(clk),
  .testN(testN),        //Comentar desde acá
  .testZ(testZ),        //
  .testDone(testDone),  //
  .testDV(testDV),      //
  .testdv0(testdv0),    //Hasta acá
  .testA(testA),
  .resultado(resultado)
);

initial begin
  // Initialize Inputs
  clk = 0;
  DV = 5;
  DR = 1;
  start = 0;

  #10 start = 1;
  
  
  //#10 start = 0;


end

always #1 clk = ~clk;

initial begin
  $dumpfile("divisor.vcd");
  $dumpvars(0,divisor_tb);
  #(40) $finish;
end

endmodule
