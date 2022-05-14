`timescale 1ns / 1ps
module detector(
    input clk,
    input rst,
    input sh_now, //Entrada, en este caso, la señal del pulsador que habilitará el corrimiento de 1 solo bit
    output flanco //Dará un pulso de 1clk de duración cuando detecte un flanco positivo en la entrada
    );

    reg det_posedge;

    always @(posedge clk) begin
      if (rst) begin
         det_posedge <= 1'b0;
      end else begin
         det_posedge <= sh_now;
      end
    end
    assign flanco = ~det_posedge & sh_now; //Aprovecha el tiempo de propagación de la señal para "engañar" a la AND y enviar un 1 justo cuando sh_now cambia de 0 a 1
endmodule
