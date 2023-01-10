[bits 16]
org 0x7c00
BRST equ 0x10       ;set costants
TTY equ 0x0e
ENDL equ 0xa
%macro print 3      ;macro to display characters
    mov al,%1
    int BRST
    mov al,%2
    int BRST
    mov al, %3
    int BRST
%endmacro
section .text
    global _start
    mov cx, 6       ;i want display 6(sex) times "Joe Mama", ok?
    nop
    in al, 0x92      ;enable a20line
    or al, 2
    out 0x92, al
_start:
    mov ah, TTY
    print "J", "o", "e"
    print ENDL, "M", "a"
    print "m", "a", ENDL
    loop _start         ;initialize our loop
    call finally       
endloop:
    times 510-($-$$)db 0    ;infinite loop
    dw 0xaa55
finally:
    xor cx, cx      ;set cx to 0, halt and jump in to infinite loop
    hlt
    jmp endloop     ;something like spaghetti
section .data
    pusha   ;useless istructions because i want to do it
    ret 0
    popa
section .bss
    resb 0
