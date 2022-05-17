;-- Programas de prueba para Simplez
;-- Ejemplo 10: Escritura en pantalla.  Ejemplo hola mundo de escritura en pantalla
;-- enviando los datos directamente al registro de datos. NO se usa el registro de
;-- estado. Se escriben 2 caracteres
;-- Acceso a los perifericos

LEDS      EQU 507
TXSTATUS  EQU 508
TXDATA    EQU 509
RXSTATUS  EQU 510
RXDATA    EQU 511


        ORG h'40
       WAIT         ;-- Inicio: esperar 200ms

       ld /car1
       st /TXDATA   ;-- Escribir en pantalla en primer caracter
       WAIT         ;-- No se usa el registro de status. Se espera un tiempo

       ld /car2
       st /TXDATA   ;-- Escribir el segundo caracter
       HALT

;--- Datos
car1  DATA  "H"
car2  DATA  "O"

        ORG 509
TXDATA  DATA 0


;------ PERIFERICOS ------------------

;-- Pantalla

          ORG 508
TXSTATUS  DATA    0  ;-- 508:  Registro de estado

end
