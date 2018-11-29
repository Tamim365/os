;
; A boot sector that prints a string using our function.
;

[org 0x7c00]				; Tell the assembler where this code will be loaded

mov bx, msg
call print_string

jmp $						; Hang

%include "src/boot/io.asm"

; Data
msg:
db "Hello World!"

; Padding and magic number.
times 510-($-$$) db 0
dw 0xaa55