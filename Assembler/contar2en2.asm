
;loop
;    LD /val1   ;-- Sacar valor 1 por los leds
;    ST /LEDS
;   WAIT       ; Pausa
;    LD /val2   ;-- Sacar valor 2 por los leds
;    ST /LEDS
;    WAIT
;    BR /loop   ;-- Repetir


;-- Datos
;val1  DATA H'AA   ;-- Valor 1 de la secuencia
;val2  DATA H'55   ;-- Valor 2 de la secuencia


;------ PERIFERICO: puerto de leds ------------------

;          ORG 507

;LEDS      DATA    0  ;-- Todo lo escrito aqui se saca por los leds

;end



        CLR
        ST /ult   ; ult = 0
        ST /sum   ; sum = 0
        ST /leds
        LD /num2   ;
        ST /pen   ; pen = 2
        LD /num10
        ST /cont  ; CONT = 10
        WAIT
        WAIT
        WAIT
        WAIT

loop    LD /pen
        ADD /ult
        ST /sig    ; SIG = PEN + ULT = 2 + 0
        ST /sum    ; sum = 2 + ult
        ST /leds
        WAIT
        WAIT
        WAIT
        WAIT
        LD /sig
        ST /ult    ; PEN = ULT
        LD /cont
        DEC        ; CONT--
        BZ  /fin   ; si es cero, sale del bucle
        ST /cont   ; si no, lo lleva a CONT
        BR /loop   ; y vuelve al bucle

;-- Fin. Cargar la suma en registro A para mostrarlo por los leds
fin     LD /sum
        st /leds
        HALT


        ;-- Variables
        ORG 46
cont    DATA 0
pen     DATA 0
ult     DATA 0
sig     DATA 0
sum     DATA 0
num2    DATA 2
num10   DATA 10

;---- Perifericos

      ORG 507
leds  RES 1    ;-- Leds. Reservar 1 posicion de memoria en la direccion 507

     end
