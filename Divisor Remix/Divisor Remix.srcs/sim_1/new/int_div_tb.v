`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2022 01:41:15
// Design Name: 
// Module Name: int_div_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module int_div_tb;
 
reg [2:0] a;
reg [2:0] b;
wire [2:0] yshang;
wire [2:0] yyushu;
 
initial
begin
	#10 a = 7;
		b = 2;	
		
	#100;
  end
 
int_div div
(
.a (a),
.b (b),
 
.yshang (yshang),
.yyushu (yyushu)
);
 

initial begin
    //$fsdbDumpvars();
    $dumpvars();
    #1000 $finish;
end
  
endmodule