SYS_PRINT equ 4
STDOUT equ 1

section .data
m1		db		10,'  Resultado :   ',10,13
lm1		equ		$ - m1

section .bss
a:       resb    2
b:       resb    2
c:       resb    2
valorsup  resb    2
valorinf resb    2
resultado:  resb    2

section .text
global _start
_start:

;se multiplica 4 por 2
  mov eax,   4
  mov ebx,   2
  mul   ebx
;el resultado se guarda en a 
  mov [a], eax


;3(x)²/2 cuando x vale 2
  mov eax,    2
  mul eax ;al cuadrado²

;multiplicacion por 3
  mov ebx,    3
  mul ebx

;divide entre dos
  mov ebx,    2
  div ebx

  mov [b], eax

  ; x cuadrada cuando x vale 2

  mov eax,    2
  mov ebx,    2

  mul eax
  mul ebx
  mov [c],eax

  ;resultado de evaluar el limite superior
  mov eax,   [a]
  mov ebx,   [b]
  mov ecx,   [c]

  add eax, ebx
  sub eax, ecx

	add eax, '0'
  mov [valorsup], eax


;----------------------------------------------------------

;Operacion 4(x) cuando x vale 0
  mov eax,   4
  mov ebx,   0
  ;Multiplicamos
  mul   ebx
  ;movemos resultado
  mov [a], eax

; 3(x)²/2 cuando x vale 0
	mov eax,    0
	mul eax ;multiplica por si mismo 

 ;multiplicamos por 3
	mov ebx,    3
	mul ebx

;division sobre dos
  mov ebx,    2
  div ebx
  mov [b], eax

;x² cuando x vale 0
 mov eax,    0
 mov ebx,    0

 mul eax
 mul ebx

 mov [a], eax

 ;optenemos resultado del limite inferior

 mov eax,   [a]
 mov ebx,   [b]
 mov ecx,   [c]

 add eax, ebx
 sub eax, ecx

 add eax, '0'
 mov [valorinf], eax

;resultado
; restamos el valor superior menos el inferior
  mov eax,   [valorsup]
  mov ebx,   [valorinf]

  sub eax, ebx

  add eax, '0'
  mov [resultado], eax



  ;extra
  ;imrimimos en pantalla a

  mov eax, SYS_PRINT
  mov ebx, 1
  mov ecx, m1
  mov edx, lm1
  int 80h

  mov eax, SYS_PRINT
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h



;finaliza programa
  mov eax,  1
  mov ebx,  0
  int 80h
