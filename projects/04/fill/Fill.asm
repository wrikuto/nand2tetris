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

	@SCREEN
	D=A
	@addr
	M=D

	//BLK
	// @
	// M=8192

	@KBD
	D=A
	@kbd
	M=D


(WHILE_NO_PUSH)
	@i
	M=0

	@KBD
	D=M
	@WHILE_NO_PUSH
	D;JEQ
	@BLK
	0;JMP
	
(WHILE_PUSH)
	@i
	M=0

	@KBD
	D=M
	@WHILE_PUSH
	D;JGT
	@WHT
	0;JMP


(BLK)
	@R0
	D=M
	@i
	D=D-M
	@WHILE_PUSH
	D;JEQ

	@i
	D=M
	@addr
	A=M
	A=A+D
	M=-1

	@i
	M=M+1

	@BLK
	0;JMP

(WHT)
	@R0
	D=M
	@i
	D=D-M
	@WHILE_NO_PUSH
	D;JEQ

	@i
	D=M
	@addr
	A=M
	A=A+D
	M=0

	@i
	M=M+1

	@WHT
	0;JMP

