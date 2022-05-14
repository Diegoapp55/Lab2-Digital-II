;-- Acceso a los perifericos
leds    EQU 507

;-- Comienzo del programa:
;-- Direccion h'40: para cargarlo con el bootloader
        org h'40

loop    LD /val1    ;-- Valor secuencia 1
        ST /leds
        Wait
        ld /val2    ;-- Valor secuencia 2
        st /leds
        wait
        BR /loop

val1     DATA h'C3
val2     DATA h'3C

END
