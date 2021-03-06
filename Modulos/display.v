`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.04.2022 08:12:39
// Design Name:
// Module Name: display
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


module display(
    input [15:0] num,
    input clk,
    output [0:6] sseg,
    output reg [3:0] an,
	  input rst
    );

reg [3:0]bcd=0;
//wire [15:0] num=16'h4321;

BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg));

reg [26:0] cfreq=0;   //Puede que toque dejarlo a 29 bits
wire enable;

// Divisor de frecuecia

assign enable = cfreq[16]; //Original=16. Disminuir el indice de cfreq para acelerar simulacion, aumentarlo para visualizar mas lento en la tarjeta
always @(posedge clk) begin
  if(rst) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end

reg [1:0] count =0;
always @(posedge enable) begin
		if(rst) begin
			count<= 0;
			an<=4'b1111;
		end else begin
			count<= count+1;
			an<=4'b1101;
			case (count)
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end
			endcase
		end
end

endmodule
