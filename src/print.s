%define ENDL 0xA            ; set \n costant
%define RETL 0xD            ; set \r costant
%macro print 1-255          ; macro function to display characters
    mov ah, 0xE             ; enable character visualization mode
    %rep %0
        mov al, %1
        int 0x10            ; call BIOS video service
        %rotate 1-%0
    %endrep
%endmacro
