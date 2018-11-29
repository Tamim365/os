print_string:
mov ah,	0x0e				; 0x0e : BIOS Teletype output

_startprint:
cmp byte [bx], 0			; compare byte in the address stored in bx with 0
je _endprint				; Nullbyte found, end print
mov al, [bx]				; move byte in the address stored in bx to al
int 0x10					; print al
add bx, 1					; advances address pointer by 1, to next byte
jmp _startprint				; start over

_endprint:
ret
