%include "print.s"
[bits 16]
org 0x7C00                  ; physical address where the bootloader starts, a linear absolute address
section .text
    global _start
_start:
    print ENDL,ENDL         ; in case you didn't know str([*"hello"]).replace(", '",",'")
    print 'O','v','e','r','w','r','i','t','i','n','g',' ','C','M','O','S',' ','m','e','m','o','r','y','.','.','.'
    call ovrwrt_cmos
    print ENDL,ENDL,RETL
    print 'B','I','O','S',' ','f','a','c','t','o','r','y',' ','r','e','s','e','t',' ','d','o','n','e','.'
    jmp $                   ; jump into infinite loop
ovrwrt_cmos:
    mov cl, 0               ; our starting index
    jmp .fill               ; this ain't so useful cuh, but whatever.
    .fill:
        cli                 ; disable interrupts
        mov al, cl          ; move our index address to AL
        out 0x70, al        ; send it to the CMOS address I/O port
        %rep 6
            nop             ; delay
        %endrep
        mov al, 0           ; value to overwrite CMOS memory with
        out 0x71, al        ; send 0 to the I/O CMOS data port 
        sti                 ; enable interrupts
        cmp cl, 127         ; CMOS memory usually have a size of 128 bytes
        inc cl              ; incrase cl by 1
        jne .fill           ; loop until cl isn't 127 (128th byte starting from 0)
    ret
times 510-($-$$) db 0       ; fill the rest with zeros
dw 0xAA55                   ; bootloader signature
;section .data               ; bios only loads 1 sector (512 bytes) from booted drive!
;section .bss                ; also is useless using uninitialzed memory at runtime
