`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2022 01:39:57
// Design Name: 
// Module Name: int_div
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


module int_div
(
input[2:0] a,               //Diviendo
input[2:0] b,               //Divisor

output reg [2:0] yshang,   //Cociente
output reg [2:0] yyushu    //Residuo
);

reg[2:0] tempa;
reg[2:0] tempb;
reg[5:0] temp_a;
reg[5:0] temp_b;

integer i;

always @(a or b)    //Init con la ALU
begin
    tempa <= a;
    tempb <= b;
end

always @(tempa or tempb)
begin
    temp_a = {3'h0,tempa};
    temp_b = {tempb,3'h0}; 
    for(i = 0;i < 3;i = i + 1)
        begin
            temp_a = {temp_a[4:0],1'b0};
            if(temp_a[5:3] >= tempb)
                temp_a = temp_a - temp_b + 1'b1;
            else
				temp_a = temp_a;
        end

    yshang <= temp_a[2:0];
    yyushu <= temp_a[5:3];
end

endmodule 
