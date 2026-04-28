# MIPS Single-Cycle Processor

A fully functional single-cycle MIPS processor implemented in Verilog HDL, supporting a representative subset of the MIPS32 instruction set including R-type arithmetic and logic operations, memory access, branch, and jump instructions.

## Architecture

The processor follows the classical single-cycle datapath design, where every instruction completes execution in exactly one clock cycle. All control signals are generated combinatorially from the opcode and function fields, with no pipelining or hazard logic. The datapath includes a register file, ALU, instruction memory, data memory, sign-extension unit, and a control unit that drives multiplexers across the path.

## Supported Instructions

### R-Type (ALU Operations)

All R-type instructions use `opcode = 000000` and are distinguished by their `funct` field.

| Instruction | Operation |
|-------------|-----------|
| `add`       | Signed addition |
| `sub`       | Signed subtraction |
| `and`       | Bitwise AND |
| `or`        | Bitwise OR |
| `nor`       | Bitwise NOR |
| `slt`       | Set on less than (signed) |
| `sll`       | Shift left logical |
| `srl`       | Shift right logical |
| `sra`       | Shift right arithmetic |

### Memory Instructions

| Instruction | Operation |
|-------------|-----------|
| `lw`        | Load word from data memory |
| `sw`        | Store word to data memory |

### Control Flow Instructions

| Instruction | Operation |
|-------------|-----------|
| `beq`       | Branch if equal (PC-relative) |
| `j`         | Unconditional jump (26-bit target) |

## Instruction Encoding

The processor decodes standard MIPS 32-bit instruction formats. R-type instructions encode `rs`, `rt`, `rd`, `shamt`, and `funct` fields. I-type instructions (`lw`, `sw`, `beq`) carry a 16-bit immediate sign-extended to 32 bits. The `j` instruction uses a 26-bit target field shifted left by 2 and concatenated with the upper 4 bits of the PC.

## Test Program

The verification testbench exercises all supported instructions in sequence through a program loaded directly into instruction memory:

```
add  $t1, $s0, $t0
sub  $t2, $s0, $t0
and  $t3, $s0, $t0
or   $t4, $s0, $t0
slt  $t5, $t0, $s0
nor  $t6, $s0, $t0
sll  $t7, $t0, 2
srl  $t1, $s0, 1
sra  $s2, $s0, 1
sw   $t1, 0($zero)
lw   $v0, 0($zero)
beq  $t1, $t2, +1
add  $t0, $t0, $t0
j    0
```

The final `j 0` loops the program back to the start, allowing continuous observation of all datapath signals in simulation.


## Simulation

The design was simulated using ModelSim/Questa. To run the testbench, compile all source files and the testbench, then launch simulation on `processor_tb`. All register and memory outputs can be observed on the waveform to verify correct instruction execution.

## Tools

- **HDL:** Verilog
- **Simulation:** ModelSim / Questa
