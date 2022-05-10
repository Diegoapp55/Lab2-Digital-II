`timescale 1ns / 1ps
module divisor
(
input [2:0] A,               //Diviendo
input [2:0] B,               //Divisor
input clk,
input init,
output reg [2:0] cociente   //Cociente
//output reg [2:0] residuo    //Residuo
);

reg[2:0] ina;
reg[2:0] inb;
reg[5:0] temp_a;
reg[5:0] temp_b;

integer i;

always @(posedge clk)    //Carga los datos a utilizar para trabajar una vez si alguna de las entradas var√≠an
begin
    if(init) begin
    ina <= A;
    inb <= B;
    /*end
end

always @(ina || inb) //Posible problema, como no es sÌncrono con reloj no le envÌa el cociente a tiempo a la ALU y esta muestra ?000 en la salida de depuraciÛn "visualizar"
begin*/
    temp_a = {3'h0,ina};
    temp_b = {inb,3'h0};
    for(i = 0;i < 3;i = i + 1)
        begin
            temp_a = temp_a << 1;
            if(temp_a[5:3] >= inb)
                temp_a = temp_a - temp_b + 1'b1;
            else
				temp_a = temp_a;
        end

    cociente <= temp_a[2:0];
    //residuo <= temp_a[5:3];
    end
end

endmodule
