;-- Acceso a los perifericos
LEDS      EQU 507

org h'40

ld /num1
add /num2
st /suma
st /LEDS
HALT

num1    DATA H'7
num2    DATA H'8
suma    DATA 0

;        ORG 507
;LEDS    DATA    0

end
