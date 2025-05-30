from enum import Enum
import sys

class Type(Enum):
    R = 1
    I = 2
    M = 3

def to_twos_complement(n: int, bits: int = 4) -> str:
    if n >= 0:
        return f"{n:0{bits}b}"
    else:
        return f"{(1 << bits) + n:0{bits}b}"


# "INSTRUCTION": (TIPO, OPCODE)
opcodes = {

    # DADOS
    "LD":        (Type.R.value, "0000"),
    "ST":        (Type.R.value, "0001"),
    "MOVH":      (Type.I.value, "0010"),
    "MOVL":      (Type.I.value, "0011"),
    "F-LD":      (Type.R.value, "0100"),
    "F-ST":      (Type.R.value, "0101"),
    "F-MOVH":    (Type.I.value, "0110"),
    "F-MOVL":    (Type.I.value, "0111"),

    # CONTROLE
    "BRZR":      (Type.R.value, "0000"),
    "BRZI":      (Type.I.value, "0001"),
    "JR":        (Type.R.value, "0010"),
    "MOV":       (Type.R.value, "0011"),  
    "F-BRZR":    (Type.R.value, "0100"),
    "F-BRZI":    (Type.I.value, "0101"),
    "F-JR":      (Type.R.value, "0110"),
    "F-MOV":     (Type.R.value, "0111"),
    "SGT":       (Type.R.value, "1000"),
    "SLT":       (Type.R.value, "1001"),
    "SEQ":       (Type.R.value, "1010"),  
    "STRUE":     (Type.R.value, "1011"),

    # ARITMÉTICA E LÓGICA
    "ADD":       (Type.R.value, "0000"),
    "SUB":       (Type.R.value, "0001"),
    "MULT-OP":   (Type.M.value, "0010"),
    "OR":        (Type.R.value, "0011"),
    "NOT":       (Type.R.value, "0100"),
    "SLR":       (Type.R.value, "0101"),
    "SRR":       (Type.R.value, "0110"),
    "F-ADD":     (Type.R.value, "1000"),
    "F-SUB":     (Type.R.value, "1001"),
    "F-MULT-OP": (Type.M.value, "1010"),
    "F-OR":      (Type.R.value, "1011"),
    "F-NOT":     (Type.R.value, "1100"),
    "F-SLR":     (Type.R.value, "1101"),
    "F-SRR":     (Type.R.value, "1110"),

    # NO OPERATION
    "NOP":       (Type.R.value, "1111"),
}


registers = {
    "R0": "00",
    "R1": "01",
    "R2": "10",
    "R3": "11",
}


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
        elif opcodes[command_name][0] == Type.M.value:
            command = opcodes[command_name][1] + registers[info[1].upper()] + str(to_twos_complement(int(info[2]), 2))
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