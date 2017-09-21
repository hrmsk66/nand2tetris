// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//  Pseudocode
//  for i := 0; i < R1; i++ {
//    R2 = R2 + R0
//  }

@i
M=0
@R2
M=0 // Initialize i and R2

(LOOP)

@i
D=M
@R1
D=D-M
@END
D;JGE // if (i - R1) >= 0 goto END

@R0
D=M
@R2
M=M+D // R2 = R2 + R0

@i
M=M+1 // i++

@LOOP
0;JMP // goto LOOP

(END)
@END
0;JMP // goto LOOP