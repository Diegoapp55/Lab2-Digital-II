;-------------------------------------------------------------------------------------------
;-- Basado en el Programa de ejemplo para Bootloader. "boot_09_filtrar_teclas_v13.asm"
;-- Deberá cargarse el programa, una vez compilado, en modo interactivo desde consola:
;--       # sboot -i prog.list
;-------------------------------------------------------------------------------------------
;   Este código utiliza referencias a direcciones. Debe ser compilado con una
;   versión 1.3 del compilador "sasm" para Simplez.
;-------------------------------------------------------------------------------------------

;-- Acceso a los perifericos
LEDS      EQU 507
TXSTATUS  EQU 508
TXDATA    EQU 509
RXSTATUS  EQU 510
RXDATA    EQU 511


ORG h'40
; Lee primera tecla como caracter ASCII por el puerto serie.
leer_1    LD  /RXSTATUS
          BZ  /leer_1
          LD  /RXDATA
          ST  /tecla_leida

; Se intenta la lógica: <if (tecla_leida == tecla_up) then "goto up" else "goto fin">.
test_up   LD  /tecla_leida      ; Se preparan los parámetros.
          ST  /dato1            ; <dato1 = tecla_leida>
          LD  /tecla_up         ; <dato2 = tecla_up>
          ST  /dato2            ;
          LD  /br_code          ; Se preparan direcciones de destino segun la comparación.
          ADD @up               ; @up - El retorno de valores iguales apunta a la función "up" cuya referencia está en la dirección "direc_up".
          ST  /ret_iguales      ;
          LD  /br_code          ; El retorno de valores distintos apunta a "test_down" para seguir probando con la tecla "down".
          ADD @fin        ; Original @test_down
          ST  /ret_distintos    ;
          BR  /comparar         ; Una vez preparados los parámetros y las direcciones de retorno se ejecuta la subrutina.

; Ejecuta si up.
up        LD  /salida1
          ST  /LEDS
          WAIT

          LD /car1
          ST /TXDATA   ;-- Escribir en pantalla en primer caracter
          WAIT         ;-- No se usa el registro de status. Se espera un tiempo

          LD /car2
          ST /TXDATA   ;-- Escribir el segundo caracter
          WAIT

          LD /car3
          ST /TXDATA   ;-- Escribir en pantalla en primer caracter
          WAIT         ;-- No se usa el registro de status. Se espera un tiempo

          LD /car4
          ST /TXDATA   ;-- Escribir el segundo caracter
          WAIT         ;-- No se usa el registro de status. Se espera un tiempo

          LD /car5
          ST /TXDATA   ;-- Escribir el segundo caracter
          WAIT

          LD /carspace
          ST /TXDATA   ;-- Escribir el segundo caracter
          WAIT
          BR  /fin

; Se vuelve al inicio para leer una nueva tecla.
fin       CLR
          BR  /leer_1

;----------------------------;
;--       Subrutinas       --;
;----------------------------------------------------------------------------------
; Compara dos datos que se cargaron en memoria (dato1 y dato2).
; El algoritmo consiste en ir restando ambos números y ver cual de ellos se hace
; antes cero. Si los dos se hacen cero en la misma iteración es que son iguales.
;----------------------------------------------------------------------------------
; NOTA: En esta versión no nos interesa cual es el mayor, o menor sino simplemente
;       si son iguales o distintos. Con esto eliminamos código del anterior ejemplo
;       para ahorrar memoria.
;----------------------------------------------------------------------------------
comparar       LD   /dato1
               DEC
               BZ   /cero_dato1
               ST   /dato1
               LD   /dato2
               DEC
               BZ   /ret_distintos
               ST   /dato2
               BR   /comparar

; El dato1 llegó antes a   /TXDATAcero que dato2, si son iguales, al restar
; uno más al dato2 se hará también cero. En otro caso es que son distintos.
cero_dato1     LD   /dato2
               DEC
               BZ   /ret_iguales
ret_distintos  DATA 0               ; dato1 != dato2
ret_iguales    DATA 0               ; dato1 == dato2

;----------------------------;
;-- Variables y constantes --;
;----------------------------;
br_code          BR    /0
tecla_up         DATA  "w"          ;Original "q"

tecla_leida      DATA  H'00
dato1            DATA  H'00
dato2            DATA  H'00
salida1          DATA  H'02 ;Para mostrar el 2 en los leds
car1  DATA  "G"
car2  DATA  "S"
car3  DATA  "-"
car4  DATA  "0"
car5  DATA  "2"
carspace DATA " "

end
