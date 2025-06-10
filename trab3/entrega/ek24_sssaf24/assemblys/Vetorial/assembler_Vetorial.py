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

    # SCALAR
    "S.LD":      (Type.R.value, "0000"),
    "S.ST":      (Type.R.value, "0001"),
    "S.MOVH":    (Type.I.value, "0010"),
    "S.MOVL":    (Type.I.value, "0011"),
    "S.ADD":     (Type.R.value, "0100"),
    "S.SUB":     (Type.R.value, "0101"),
    "S.AND":     (Type.R.value, "0110"),
    "S.BRZR":    (Type.R.value, "0111"),

    # VETORIAL
    "V.LD":      (Type.R.value, "1000"),
    "V.ST":      (Type.R.value, "1001"),
    "V.MOVH":    (Type.I.value, "1010"),
    "V.MOVL":    (Type.I.value, "1011"),
    "V.ADD":     (Type.R.value, "1100"),
    "V.SUB":     (Type.R.value, "1101"),

    # EXTRAS
    "S.INC-OPS": (Type.M.value, "1110"),
    "S.REP":     (Type.R.value, "1111"),
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

        if opcodes[command_name][0] == Type.I.value:
            command = opcodes[command_name][1] + str(to_twos_complement(int(info[1]), 4))
        elif opcodes[command_name][1] == "1110":
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