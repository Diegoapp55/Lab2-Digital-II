`timescale 1ns / 1ps
module sh_r(
  input [2:0] portA,
  input init_sh_r,       //Pin para habilitar o no este módulo (Asignar a pulsador para que refresque y no se quede en 1)
  input sh_now,       //Pin para habilitar o no este módulo (Asignar a pulsador para que refresque y no se quede en 1)
  input clk,             //Pin para sincronizar con el reloj
  input rst,             //Pin para volver al dato sin corrimientos
  output [3:0] sal_sh_r  //Pines para extraer lo que retorna este módulo y usarlo en el top-module
);

reg [3:0] A; //Registro que almacenará el número desplazado
//reg shft_r = 0;
//reg done = 0;
wire flanco;
assign sal_sh_r = A;

/*
always @ (posedge sh_now) begin
    shft_r = 1;
    if (done) shft_r = 0;
end

always @ (init_sh_r) begin //Asi deja implementar pero no simular :/ y quien sabe si la implementaci�n sea como se espera
  if (rst) A = {1'b0,portA}; //Devuelve A a su posición original (En los últimos 3 LSB), es decir, reinicia el desplazamiento
  else if (init_sh_r) begin
    if (sh_now) begin
      if (sh_now) A = A; //Si no se ha soltado el pulsador, no hace desplazamiento
      else A <= A >> 1; //Desplaza A a la derecha
    end
  end
end
*/
detector Activador (.clk(clk), .rst(rst), .sh_now(sh_now), .flanco(flanco));

always @ ( posedge clk ) begin
// valor = flanco;
if (rst) A = {1'b0,portA}; //Devuelve A a su posición original (En los últimos 3 LSB), es decir, reinicia el desplazamiento
else if (init_sh_r) begin
  if(flanco) A <= A >> 1;
end
end

endmodule
