from enum import Enum

def to_twos_complement(n: int, bits: int = 4) -> str:
    if n >= 0:
        return f"{n:0{bits}b}"
    else:
        return f"{(1 << bits) + n:0{bits}b}"

class Type(Enum):
    R = 1
    I = 2

# "INSTRUCTION": (TIPO, OPCODE)
opcodes = {
    "BRZR":     (Type.R.value, "0000"),
    "BRZI":     (Type.I.value, "0001"),
    "JR":       (Type.R.value, "0010"),
    "RESERVED": (Type.R.value, "0011"),
    "LD":       (Type.R.value, "0100"),
    "ST":       (Type.R.value, "0101"),
    "MOVH":     (Type.I.value, "0110"),
    "MOVL":     (Type.I.value, "0111"),
    "ADD":      (Type.R.value, "1000"),
    "SUB":      (Type.R.value, "1001"),
    "RESERVED": (Type.R.value, "1010"),
    "OR":       (Type.R.value, "1011"),
    "NOT":      (Type.R.value, "1100"),
    "SLR":      (Type.R.value, "1101"),
    "SRR":      (Type.R.value, "1110"),
    "NOP":      (Type.R.value, "1111"),
}

registers = {
    "R0": "00",
    "R1": "01",
    "R2": "10",
    "R3": "11",
}

import sys

if len(sys.argv) == 2:
    assembly = sys.argv[1]
    if assembly[-4:] != ".asm":
        print("Please provide just one .asm")
        exit(0)
else:
    print("Please provide just one .asm")
    exit(0)

with open(assembly, "r") as inputFile:
    lines = [l for l in inputFile.readlines() if l != "\n"]
    
    fb = open("binary_output.txt", "w")

    for line in lines:
        command = ""

        info = [element.strip() for element in line.split(" ")]
        command_name = info[0].upper()

        if command_name == 'NOP':
            command = '11110000'
        elif opcodes[command_name][0] == Type.I.value:
            command = opcodes[command_name][1] + str(to_twos_complement(int(info[1]), 4))
        else:
            command = opcodes[command_name][1] + registers[info[1].upper()] + registers[info[2].upper()]

        fb.write(command + "\n")


fb.close()

# Transforma o binário para hex
fh = open("hex_output.txt", "w")

with open("binary_output.txt", "r") as inputFile:
    lines = inputFile.readlines()

    for line in lines:
        fh.write(hex(int(line, 2)) + "\n")

fh.close()

print("Success")