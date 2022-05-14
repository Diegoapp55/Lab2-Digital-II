wait       ;-- Inicio: esperar 200ms

     ld /val1   ; Inicializar acumulador
     st /leds   ; Mostrarlo por los leds
bucle  WAIT
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     add /uno   ; Incrementar en uno
     st /leds   ; Sacarlo por los leds
     BR /bucle   ; Repetir

;--- Datos
val1    DATA  h'2
uno     DATA  h'2


;---- Perifericos

    ORG 507
leds  RES 5    ;-- Leds. Reservar 1 posicion de memoria en la direccion 507

   end
