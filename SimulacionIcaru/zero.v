`timescale 1ns / 1ps
module zero(
  input [2:0] portA, //Por defecto, trabajar solo con el A
  input init_isZero, //Enable de la operación
  input clk,
  output comp        //Salida del comparador
);
reg [2:0] A;
reg z;

// A = portA;
assign comp = z; /*Importante: assign solo se usa para cables (wire), usando la
                  sintaxis:
                  assign wire_name = value;
                  */

always @ (posedge clk && init_isZero) begin
  A = portA; /*Importante: Si se quiere asignar valores a registros, toca
               hacerlo dentro de un bloque always, porque para almacenar en un
               registro se necesita algun flanco que habilite su carga y no
               hacerlo a lo malditasea xD (regA = 20 sería hacerlo asíncrono,
               entonces está mal)*/
  // if (init_isZero) begin
    if (A == 0) begin
      z <= 1;
    end else begin
      z <= 0;
    end
  // end

end

endmodule
