`timescale 1ns / 1ps
module zero(
  input [2:0] portA, //Por defecto, trabajar solo con el A
  input init_isZero, //Enable de la operacion
  input clk,
  output comp        //Salida del comparador
);
reg [2:0] A;
reg z;

assign comp = z; /*Importante: assign solo se usa para cables (wire), usando la
                  sintaxis:
                  assign wire_name = value;
                  */

always @ (posedge clk) begin
  if (init_isZero) begin
  A = portA; /*Importante: Si se quiere asignar valores a registros, toca
               hacerlo dentro de un bloque always, porque para almacenar en un
               registro se necesita algun flanco que habilite su carga(poner
               regA = 20 fuera de un always seria hacerlo asincrono, entonces
               esta mal)*/
    if (A == 0) begin
      z <= 1;
    end else begin
      z <= 0;
    end
  end
end

endmodule
