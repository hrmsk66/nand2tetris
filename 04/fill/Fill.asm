// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Initialize stat which takes either 0 or -1
@stat
M=0

// Check keyboard input
(CHECKINPUT)
@KBD
D=M

@FILL // Detect input. Jumpt to FILL
D;JNE

@CLEAR // No input. Jump to CLEAR
D;JEQ

(FILL)
@SCREEN
D=M

@CHECKINPUT // Back to CHECKINPUT if it is black
D;JNE

@stat
M=-1
@FLIPBITS
0;JMP

(CLEAR)
@SCREEN
D=M

@CHECKINPUT // Back to CHECKINPUT if it is clear
D;JEQ

@stat
M=0
@FLIPBITS
0;JMP

(FLIPBITS)
// Initialize vars.
@SCREEN
D=A
@addr
M=D

@i
M=0

@8192
D=A
@j
M=D

(LOOP)
@j
D=M
@i
D=D-M
@CHECKINPUT // if i >= 8192 goto CHECKINPUT
D;JLE

@stat // Change the register value with the value of stat
D=M
@addr
A=M
M=D

@i
M=M+1
@addr
M=M+1

@LOOP
0;JMP