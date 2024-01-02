# Joe-Mama
Little x86-64 bootloader written in nasm assembly to factory reset BIOS settings overwriting the CMOS memory (NVRAM) with zeros
## Compile
Use _`make`_ or compile manually with _`nasm -fbin main.asm -o boot.bin`_
## Emulate
This isn't so useful but use qemu, after compiling do _`make run`_

![image](https://github.com/komodoooo/Joe-mama/assets/68278515/8aaaed5b-7d5e-4e9f-ba5c-2589f40e3d8d)

## Running in to a real machine
Just flash the **boot.bin** file inside an usb, make sure to select the proper boot order
## Will it run on UEFI?
I don't know, maybe with CSM enabled (compatibility support module) it will.
### Additional notes
Read the makefile before running _`make clean`_.
