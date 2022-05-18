;-- Acceso a los perifericos (Para bootloader)
;leds    EQU 507
;-- Comienzo del programa:
;-- Direccion h'40: para cargarlo con el bootloader
;      org h'40

     ld /diez
     st /cont   ;Para el reset del contador
     CLR
     st /val1   ;Fijar val1 en cero para el reset
     ld /val1   ; Inicializar acumulador
     st /leds   ; Mostrarlo por los leds

bucle WAIT
      WAIT
      WAIT
      WAIT
      ld /val1
      add /two   ; Incrementar en uno
      st /leds   ; Sacarlo por los leds
      st /val1
      ld /cont
      dec
      BZ  /fin   ; si es cero, sale del bucle
      ST /cont   ; si no, lo lleva a CONT
      BR /bucle   ; y vuelve al bucle

fin     LD /val1
        st /leds
        HALT

;--- Datos
val1    DATA  h'0
two     DATA  h'2
diez    DATA  h'A
cont    DATA  h'A

;---- Perifericos (Sin bootloader)

    ORG 507
leds  RES 1    ;-- Leds. Reservar 1 posicion de memoria en la direccion 507

   end
