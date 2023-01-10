# Joe-Mama
Little x86-64 bootloader in assembly to display who asked.
## Compile
Use _`make`_ or compile manually with _`nasm -fbin boot.asm -o boot.bin`_
## Emulate
Use qemu, after compiling do _`qemu-system-x86_64 boot.bin`_

![image](https://user-images.githubusercontent.com/68278515/211629061-8d5ee48b-c1f4-4969-a596-dc2fed0785ed.png)

## Running in to a real machine
So, you're a man of culture as well. 

Just flash the *boot.bin** file inside an usb.
### Dependencies
I think you're not so stupid
