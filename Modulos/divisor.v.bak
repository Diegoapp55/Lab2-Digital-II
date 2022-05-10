module divisor( input [2:0] DV,     //Entrada que recibirá el valor de DV (Dividendo)
				input [2:0] DR,             //Entrada que recibirá el valor de DR (Divisor)
				input start,                //Señal de control xd
				input clk,                  //Señal de reloj para sincronizar
				output [1:0] testN,         //Señales de depuración, comentar para implementar
				output testZ,               //
				output testDone,            //
				output [2:0] testA,
				output [5:0] testDV,        //
				output testdv0,             //Comentar hasta acá
				output [3:0] resultado      //Registro que entrega el resultado de la división
    );

// Señales de control
reg init;           //Es equivalente a rst en el multiplicador (Sirve para inicializar registros en sus valores default)
reg sh; 	     	    //Para habilitar el shift
reg lda;            //Para cargar A, es decir, por default A=0, pero cuando este bit vale 1, A=DVshift[5:3] (Los 3 MSB)
reg done;           //Para indicar que la división ha finalizado
reg dec;            //Habilita el decremento en 1 del contador N
reg dv0;            //Determinado por la comparación A < DR (Ver diagrama de flujo)

// Registros
reg [1:0] N;           //Contador que debe empezar en el número de bits del dividendo
reg [5:0] DVshift; 	   //Dividendo (6 bits porque se va desplazando a izq, y no se debe perder la info)
reg [2:0] A;           //Para almacenar los 3MSB de DVshift y poder almacenar la resta
reg [2:0] B; 		   //Divisor
reg [2:0] division;    //Almacena el resultado de la división
reg [2:0] status =0;   //Almacena el estado actual de la MEF (0 a 4) (5 en total)
wire z; 			   //Para poder leer la salida del comparador y saber cuando A=0 de nuevo.


// bloque comparador
assign z=(N==0)?1:0;          //Si N==0, el comparador se mantiene en 1, pero cuando eso no se cumpla, valdrá 0

assign resultado = division;

//Asignaciones de los cables para hacer depuración en simulación (Comentar estos assign, así como los outputs indicados para implementar)
assign testN = N;
assign testZ = z;
assign testDV = DVshift;
assign testdv0 = dv0;
assign testDone = done;
assign testA = A;

// bloque para las funciones de los estados 0 y 1
always @(posedge clk) begin

	if (init) begin
		DVshift <= {3'b000,DV}; //Devuelve A a su posición original (En los últimos 3 LSB), es decir, reinicia el desplazamiento
		B <= DR; //Complementa a 2 el divisor
		N <= 3;
		A <= 0;
	end	else begin
		if (sh && dec) begin
			if (dv0) begin
				A <= (A << 1) + DVshift[N-1];
				DVshift <= (DVshift << 1) + DVshift[N-1]; //Como dv0=1 solo despues de hacer desplazado DVshift y A, podemos sumar 1 a DVshift para agregar temporalmente ese 1 al resultado
			end else begin
				A <= A << 1;
				DVshift <= DVshift << 1;
			end
		N <= N - 1;
		end
	end

end

// bloque para las funciones del bloque add (La parte de evaluar dv0 se hace en el bloque anterior)
always @(posedge clk) begin

	if (lda && dv0) begin
		A <= DVshift [5:3]; //Si dv0=1 es porque A>=DR y por lo tanto se debe comenzar a almacenar la resta y a desplazarla para acabar la división, entonces, lda=1 (Load A from DVshift)
		A <= A + (~B + 1); //Resta A y B (Sumando A con el C2 de B)
	end

end
// bloque que guarda pasa el resultado a la salida
always @ ( posedge clk ) begin
	if (done) division <= {1'b0,DVshift[2:0]}; //Saca 4 bits por uniformidad de las salidas de las operaciones en la ALU
end

// FSM
parameter START =0,  SHIFT_DEC =1,  CHECK =2, ADD =3, END1 =4;

always @(posedge clk) begin
	case (status)
	START: begin                    //Inicia el estado 0
		sh=0;                         //Primero configura los valores de las señales de control del siguiente estado para que al entrar a este todo funcione OK
		lda=0;
		dec=0;
		if (start) begin
			status=SHIFT_DEC;              //Una vez se le da la orden de comenzar, pasa al estado 1
			init=1;
			done=0;
			dv0=0;
		end
		end

		SHIFT_DEC: begin
			done=0;                   //Define los valores para las señales de control tal y como se hizo en anteriores estados
			init=0;
			sh=1;
			lda=0;
			dv0=dv0;
			dec=1;
			status=CHECK;
			end

	CHECK: begin                   //Inicio del estado 2
		done=0;                      //Define los valores para las señales de control tal cual quedó en el diagrama de estados
		init=0;
		lda=0;
		sh=0;
		dec=0;
		dv0=0;
		if (z==1)                //Según lo que indique el comparador al final de definir los valores, se procederá a repetir el estado 1, o seguir al 4
			status=END1;
		else if (DVshift[5:3] < (~B+1))   //Si A < DR, el MSB de la resta será cero, acá no hay que hacer más que mandarlo a hacer shift otra vez. Pero si esa condición no se cunple, entonces se carga el registro A con los 3MSB de DVshift y se almacena de forma recursiva ese valor - DR (Ahora A almacenará el resultado de la resta y se puede desplazar)
			status=SHIFT_DEC;
		else begin
			status=ADD;
		end
	end

	ADD: begin                    //Inicio estado 3
			done=0;                   //Define los valores para las señales de control tal y como se hizo en anteriores estados
			init=0;
			sh=0;
			lda=1;
			dv0=1;
			dec=0;
			if (z==1)
				status=END1;
			else
				status=SHIFT_DEC;
		end

	END1: begin
			done=1;                   //Define los valores para las señales de control tal y como se hizo en anteriores estados
			init=0;
			sh=0;
			lda=0;
			dv0=0;
			dec=0;
			//status=START;
	end
	 default:
		status =START;
	endcase
end
endmodule
