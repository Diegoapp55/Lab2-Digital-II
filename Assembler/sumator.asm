;-- Programas de ejemplo para Simplez
;-- Sumar 2 números guardados en registros

ld /num1
add /num2
st /suma
st /LEDS
HALT

num1    DATA H'7
num2    DATA H'8
suma    DATA 0

        ORG 507
LEDS    DATA    0

end
