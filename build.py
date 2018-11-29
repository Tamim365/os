import os, io

# build the bootsector, because that's all that exists atm
os.system("nasm ./src/boot/boot.asm -f bin -o ./bin/boot.bin")

# TODO: write .bin file to beginning of test boot floppy
# open disk file in binary rw mode while also not truncating it
boot_disk = open('./bin/boot.img', 'r+b')
# open bootsector code file in binary read mode
boot_code = open('./bin/boot.bin', 'rb')
boot_disk.write(boot_code.read(512))