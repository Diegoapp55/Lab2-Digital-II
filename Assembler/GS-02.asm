WAIT         ;-- Inicio: esperar 200ms

ld /car1
st /TXDATA   ;-- Escribir en pantalla en primer caracter
WAIT         ;-- No se usa el registro de status. Se espera un tiempo

ld /car2
st /TXDATA   ;-- Escribir el segundo caracter
WAIT

ld /car3
st /TXDATA   ;-- Escribir en pantalla en primer caracter
WAIT         ;-- No se usa el registro de status. Se espera un tiempo

ld /car4
st /TXDATA   ;-- Escribir el segundo caracter
WAIT         ;-- No se usa el registro de status. Se espera un tiempo

ld /car5
st /TXDATA   ;-- Escribir el segundo caracter
HALT

;--- Datos
car1  DATA  "G"
car2  DATA  "S"
car3  DATA  "-"
car4  DATA  "0"
car5  DATA  "2"

 ORG 509
TXDATA  DATA 0


;------ PERIFERICOS ------------------

;-- Pantalla

   ORG 508
TXSTATUS  DATA    0  ;-- 508:  Registro de estado

end
