`timescale 1ns / 1ps
module sh_l(
  input [2:0] portA,     //Pines para ingresar el operando (Se me ocurre que funcione el A para sll y el B para srl para no enredarse tanto con un pin que multiplexe A o B a la salida)
  input init_sh_l,       //Pin para habilitar o no este módulo (Asignar a pulsador para que refresque y no se quede en 1)
  input sh_now,             //Pin para sincronizar con el reloj
  input clk,             //Pin para sincronizar con el reloj
  input rst,             //Pin para volver al dato sin corrimientos
  // output testFlanco,             //Pin para probar el funcionamiento del detector de flanco
  output [3:0] sal_sh_l  //Pines para extraer lo que retorna este módulo y usarlo en el top-module
);

reg [3:0] A; //Registro que almacenará el número desplazado
// reg shft_l = 0;
// reg now = 0;
wire flanco;
assign sal_sh_l = A;

// reg valor;
// assign testFlanco = valor;

/*
always @ (posedge sh_now) begin //Esto da errores de sintesis porque sh_now no es un reloj como tal, revisar como evadir esa restriccion en los constraints
    //now = 1;
    shft_l = 1;
    if (now) shft_l = 0;
end

always @ (posedge clk) begin
  if (rst) A = {1'b0,portA}; //Devuelve A a su posición original (En los últimos 3 LSB), es decir, reinicia el desplazamiento
  else if (init_sh_l) begin
  //if (now) shft_l = 1;
  //else shft_l = 0;
    if (shft_l) begin
      A <= A << 1; //Desplaza A a la izquierda
      shft_l = 0;   //Esto da errores de s�ntesis porque se est� dando valores a shft_l ac� y en el otro always (a la vez aunque no literalmente)
    end
  end
end*/
detector Activador (.clk(clk), .rst(rst), .sh_now(sh_now), .flanco(flanco));

always @ ( posedge clk ) begin
// valor = flanco;
if (rst) A = {1'b0,portA}; //Devuelve A a su posición original (En los últimos 3 LSB), es decir, reinicia el desplazamiento
else if (init_sh_l) begin
  if(flanco) A <= A << 1;
end
end

endmodule
