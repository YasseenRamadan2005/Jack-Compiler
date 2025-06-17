//Set 256 to be the start of the stack
@256
D=A
@SP
M=D
//Set up the comparison ops subroutines
@SKIP
0;JMP
// ------------------------------------------------------------
//  Shared code for gt, lt, eq
//  Expectations on entry:
//R13  – return address
//R15  – (left – right)
// ------------------------------------------------------------
// want  (left  > right)  ⇔ (R15 > 0)
(DO_GT)
@15
D=M
@RETURN_TRUE
D;JGT
@RETURN_FALSE
0;JMP
// want  (left == right)  ⇔ (R15 == 0)
(DO_EQ)
@15
D=M
@RETURN_TRUE
D;JEQ
@RETURN_FALSE
0;JMP
// want  (left  < right)  ⇔ (R15 < 0)
(DO_LT)
@15
D=M
@RETURN_TRUE
D;JLT
@RETURN_FALSE
0;JMP
// ---- set boolean in D --------------------------------------
(RETURN_TRUE)
D=-1
@WRITE_BACK
0;JMP
(RETURN_FALSE)
D=0
@WRITE_BACK
0;JMP
// ---- collapse stack and return -----------------------------
(WRITE_BACK)
@13
A=M
0;JMP
(SKIP)
//Set up calling and returning from functions
@SKIPo
0;JMP
(CALL)
@SP
AM=M+1
A=A-1
M=D
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
@14
D=M
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@13
A=M
0;JMP
(RETURN)
@LCL
D=M
@14
M=D
@5
A=D-A
D=M
@15
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@14
A=M-1
D=M
@THAT
M=D
@14
A=M-1
A=A-1
D=M
@THIS
M=D
@14
A=M-1
A=A-1
A=A-1
D=M
@ARG
M=D
@14
A=M-1
A=A-1
A=A-1
A=A-1
D=M
@LCL
M=D
@15
A=M
0;JMP
(SKIPo)
// call Sys.init.0
@5
D=A
@14
M=D
@Sys.init.0
D=A
@13
M=D
@global.ret.0
D=A
@CALL
0;JMP
(global.ret.0)
// function Array.new with 0
(Array.new)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc
@6
D=A
@14
M=D
@Memory.alloc
D=A
@13
M=D
@Array.new.ret.0
D=A
@CALL
0;JMP
(Array.new.ret.0)


@RETURN
0;JMP


// function Array.dispose with 0
(Array.dispose)


@ARG
A=M
D=M
@3
M=D


@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.deAlloc
@6
D=A
@14
M=D
@Memory.deAlloc
D=A
@13
M=D
@Array.dispose.ret.0
D=A
@CALL
0;JMP
(Array.dispose.ret.0)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.init with 0
(Keyboard.init)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)


@24576
D=A
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP
AM=M+1
A=A-1
M=0


// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)


@24576
D=A
@4
M=D


@Keyboard.readInt.EQ.1
D=A
@13
M=D
@Keyboard.readInt.EQ.2
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.2)
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.1)
@WHILE_END_Keyboard.readChar1
D;JNE


// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1
0;JMP


// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)


@24576
D=A
@4
M=D


@THAT
A=M
D=M
@LCL
A=M
M=D


// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)


@24576
D=A
@4
M=D


@Keyboard.readInt.EQ.4
D=A
@13
M=D
@Keyboard.readInt.EQ.5
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.5)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.4)
@WHILE_END_Keyboard.readChar2
D;JNE


// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2
0;JMP


// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printChar
@6
D=A
@14
M=D
@Output.printChar
D=A
@13
M=D
@Keyboard.readChar.ret.0
D=A
@CALL
0;JMP
(Keyboard.readChar.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Keyboard.readLine.ret.0
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@50
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.new
@6
D=A
@14
M=D
@String.new
D=A
@13
M=D
@Keyboard.readLine.ret.1
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


// call Keyboard.readChar
@5
D=A
@14
M=D
@Keyboard.readChar
D=A
@13
M=D
@Keyboard.readLine.ret.2
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)


@Keyboard.readInt.EQ.7
D=A
@13
M=D
@Keyboard.readInt.EQ.8
D=A
@13
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.newLine
@5
D=A
@14
M=D
@String.newLine
D=A
@13
M=D
@Keyboard.readLine.ret.4
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.4)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.8)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.7)
@WHILE_END_Keyboard.readLine1
D;JNE


@Keyboard.readInt.EQ.10
D=A
@13
M=D
@Keyboard.readInt.EQ.11
D=A
@13
M=D
@LCL
A=M+1
D=M
@129
D=D-A
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.11)
@15
M=D
@DO_EQ
0;JMP
(Keyboard.readInt.EQ.10)
@Keyboard.readLine.IfElse1
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.eraseLastChar
@6
D=A
@14
M=D
@String.eraseLastChar
D=A
@13
M=D
@Keyboard.readLine.ret.5
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.5)
@SP
AM=M-1
D=M
@5
M=D


// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1
0;JMP


// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@Keyboard.readLine.ret.6
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.6)
@SP
AM=M-1
D=M
@5
M=D


// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)


// call Keyboard.readChar
@5
D=A
@14
M=D
@Keyboard.readChar
D=A
@13
M=D
@Keyboard.readLine.ret.7
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.7)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1
0;JMP


// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Keyboard.readLine
@6
D=A
@14
M=D
@Keyboard.readLine
D=A
@13
M=D
@Keyboard.readInt.ret.0
D=A
@CALL
0;JMP
(Keyboard.readInt.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.intValue
@6
D=A
@14
M=D
@String.intValue
D=A
@13
M=D
@Keyboard.readInt.ret.1
D=A
@CALL
0;JMP
(Keyboard.readInt.ret.1)


@RETURN
0;JMP


// function Main.main with 0
(Main.main)


D=0
@SP
AM=M+1
A=A-1
M=D
@220
D=A
@SP
AM=M+1
A=A-1
M=D
@511
D=A
@SP
AM=M+1
A=A-1
M=D
@220
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.0
D=A
@CALL
0;JMP
(Main.main.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@280
D=A
@SP
AM=M+1
A=A-1
M=D
@90
D=A
@SP
AM=M+1
A=A-1
M=D
@410
D=A
@SP
AM=M+1
A=A-1
M=D
@220
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawRectangle
@9
D=A
@14
M=D
@Screen.drawRectangle
D=A
@13
M=D
@Main.main.ret.1
D=A
@CALL
0;JMP
(Main.main.ret.1)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D
// call Screen.setColor
@6
D=A
@14
M=D
@Screen.setColor
D=A
@13
M=D
@Main.main.ret.2
D=A
@CALL
0;JMP
(Main.main.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@350
D=A
@SP
AM=M+1
A=A-1
M=D
@120
D=A
@SP
AM=M+1
A=A-1
M=D
@390
D=A
@SP
AM=M+1
A=A-1
M=D
@219
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawRectangle
@9
D=A
@14
M=D
@Screen.drawRectangle
D=A
@13
M=D
@Main.main.ret.3
D=A
@CALL
0;JMP
(Main.main.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@292
D=A
@SP
AM=M+1
A=A-1
M=D
@120
D=A
@SP
AM=M+1
A=A-1
M=D
@332
D=A
@SP
AM=M+1
A=A-1
M=D
@150
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawRectangle
@9
D=A
@14
M=D
@Screen.drawRectangle
D=A
@13
M=D
@Main.main.ret.4
D=A
@CALL
0;JMP
(Main.main.ret.4)
@SP
AM=M-1
D=M
@5
M=D


@SP
AM=M+1
A=A-1
M=-1
// call Screen.setColor
@6
D=A
@14
M=D
@Screen.setColor
D=A
@13
M=D
@Main.main.ret.5
D=A
@CALL
0;JMP
(Main.main.ret.5)
@SP
AM=M-1
D=M
@5
M=D


@360
D=A
@SP
AM=M+1
A=A-1
M=D
@170
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawCircle
@8
D=A
@14
M=D
@Screen.drawCircle
D=A
@13
M=D
@Main.main.ret.6
D=A
@CALL
0;JMP
(Main.main.ret.6)
@SP
AM=M-1
D=M
@5
M=D


@280
D=A
@SP
AM=M+1
A=A-1
M=D
@90
D=A
@SP
AM=M+1
A=A-1
M=D
@345
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.7
D=A
@CALL
0;JMP
(Main.main.ret.7)
@SP
AM=M-1
D=M
@5
M=D


@345
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@410
D=A
@SP
AM=M+1
A=A-1
M=D
@90
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.8
D=A
@CALL
0;JMP
(Main.main.ret.8)
@SP
AM=M-1
D=M
@5
M=D


@140
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawCircle
@8
D=A
@14
M=D
@Screen.drawCircle
D=A
@13
M=D
@Main.main.ret.9
D=A
@CALL
0;JMP
(Main.main.ret.9)
@SP
AM=M-1
D=M
@5
M=D


@140
D=A
@SP
AM=M+1
A=A-1
M=D
@26
D=A
@SP
AM=M+1
A=A-1
M=D
@140
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.10
D=A
@CALL
0;JMP
(Main.main.ret.10)
@SP
AM=M-1
D=M
@5
M=D


@163
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@178
D=A
@SP
AM=M+1
A=A-1
M=D
@20
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.11
D=A
@CALL
0;JMP
(Main.main.ret.11)
@SP
AM=M-1
D=M
@5
M=D


@174
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
@194
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.12
D=A
@CALL
0;JMP
(Main.main.ret.12)
@SP
AM=M-1
D=M
@5
M=D


@163
D=A
@SP
AM=M+1
A=A-1
M=D
@85
D=A
@SP
AM=M+1
A=A-1
M=D
@178
D=A
@SP
AM=M+1
A=A-1
M=D
@100
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.13
D=A
@CALL
0;JMP
(Main.main.ret.13)
@SP
AM=M-1
D=M
@5
M=D


@140
D=A
@SP
AM=M+1
A=A-1
M=D
@94
D=A
@SP
AM=M+1
A=A-1
M=D
@140
D=A
@SP
AM=M+1
A=A-1
M=D
@114
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.14
D=A
@CALL
0;JMP
(Main.main.ret.14)
@SP
AM=M-1
D=M
@5
M=D


@117
D=A
@SP
AM=M+1
A=A-1
M=D
@85
D=A
@SP
AM=M+1
A=A-1
M=D
@102
D=A
@SP
AM=M+1
A=A-1
M=D
@100
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.15
D=A
@CALL
0;JMP
(Main.main.ret.15)
@SP
AM=M-1
D=M
@5
M=D


@106
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
@86
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.16
D=A
@CALL
0;JMP
(Main.main.ret.16)
@SP
AM=M-1
D=M
@5
M=D


@117
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@102
D=A
@SP
AM=M+1
A=A-1
M=D
@20
D=A
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine
@9
D=A
@14
M=D
@Screen.drawLine
D=A
@13
M=D
@Main.main.ret.17
D=A
@CALL
0;JMP
(Main.main.ret.17)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.init with 0
(Math.init)


@16
D=A
@SP
AM=M+1
A=A-1
M=D
// call Array.new
@6
D=A
@14
M=D
@Array.new
D=A
@13
M=D
@Math.init.ret.0
D=A
@CALL
0;JMP
(Math.init.ret.0)
@SP
AM=M-1
D=M
@Math.0
M=D


@Math.0
D=M
@4
M=D
@THAT
A=M
M=1


@Math.0
D=M+1
@4
M=D
@2
D=A
@THAT
A=M
M=D


@Math.0
D=M
@2
D=D+A
@4
M=D
@4
D=A
@THAT
A=M
M=D


@Math.0
D=M
@3
D=D+A
@4
M=D
@8
D=A
@THAT
A=M
M=D


@Math.0
D=M
@4
D=D+A
@4
M=D
@16
D=A
@THAT
A=M
M=D


@Math.0
D=M
@5
D=D+A
@4
M=D
@32
D=A
@THAT
A=M
M=D


@Math.0
D=M
@6
D=D+A
@4
M=D
@64
D=A
@THAT
A=M
M=D


@Math.0
D=M
@7
D=D+A
@4
M=D
@128
D=A
@THAT
A=M
M=D


@Math.0
D=M
@8
D=D+A
@4
M=D
@256
D=A
@THAT
A=M
M=D


@Math.0
D=M
@9
D=D+A
@4
M=D
@512
D=A
@THAT
A=M
M=D


@Math.0
D=M
@10
D=D+A
@4
M=D
@1024
D=A
@THAT
A=M
M=D


@Math.0
D=M
@11
D=D+A
@4
M=D
@2048
D=A
@THAT
A=M
M=D


@Math.0
D=M
@12
D=D+A
@4
M=D
@4096
D=A
@THAT
A=M
M=D


@Math.0
D=M
@13
D=D+A
@4
M=D
@8192
D=A
@THAT
A=M
M=D


@Math.0
D=M
@14
D=D+A
@4
M=D
@16384
D=A
@THAT
A=M
M=D


@Math.0
D=M
@15
D=D+A
@4
M=D
@32768
D=-A
@THAT
A=M
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.bit with 0
(Math.bit)


@ARG
A=M
D=M
@R13
M=D
@THAT
A=M
D=M
@R13
D=D&M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.multiply with 3
(Math.multiply)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@Math.abs.EQ.2
D=A
@13
M=D
@Math.abs.EQ.3
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.3)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.EQ.4
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.4)
@SP
AM=M-1
D=D|M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.2)
@Math.multiply.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1
0;JMP


// label Math.multiply.IfElse1
(Math.multiply.IfElse1)


// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)


@Math.abs.EQ.6
D=A
@13
M=D
@Math.abs.EQ.7
D=A
@13
M=D
@ARG
A=M
D=M-1
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.7)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.6)
@Math.multiply.IfElse2
D;JNE


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2
0;JMP


// label Math.multiply.IfElse2
(Math.multiply.IfElse2)


// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)


@Math.abs.EQ.9
D=A
@13
M=D
@Math.abs.EQ.10
D=A
@13
M=D
@ARG
A=M+1
D=M-1
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.10)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.9)
@Math.multiply.IfElse3
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3
0;JMP


// label Math.multiply.IfElse3
(Math.multiply.IfElse3)


// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)


@Math.abs.EQ.12
D=A
@13
M=D
@Math.abs.EQ.13
D=A
@13
M=D
@ARG
A=M
D=M
@2
D=D-A
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.13)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.12)
@Math.multiply.IfElse4
D;JNE


@ARG
A=M+1
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4
0;JMP


// label Math.multiply.IfElse4
(Math.multiply.IfElse4)


// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)


@Math.abs.EQ.15
D=A
@13
M=D
@Math.abs.EQ.16
D=A
@13
M=D
@ARG
A=M+1
D=M
@2
D=D-A
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.16)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.15)
@Math.multiply.IfElse5
D;JNE


@ARG
A=M
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5
0;JMP


// label Math.multiply.IfElse5
(Math.multiply.IfElse5)


// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)


@LCL
A=M+1
A=A+1
M=1


// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)


@Math.abs.EQ.18
D=A
@13
M=D
@Math.abs.LT.19
D=A
@13
M=D
@LCL
A=M+1
D=M
@16
D=D-A
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.19)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.18)
@WHILE_END_Math.multiply1
D;JNE


@Math.abs.EQ.20
D=A
@13
M=D
@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M+1
A=A+1
D=M
@R13
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.20)
@Math.multiply.IfElse6
D;JNE


@LCL
A=M
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=D+M
@LCL
A=M
M=D


// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6
0;JMP


// label Math.multiply.IfElse6
(Math.multiply.IfElse6)


// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)


@ARG
A=M
D=M
D=D+M
@ARG
A=M
M=D


@LCL
A=M+1
M=M+1


@LCL
A=M+1
A=A+1
D=M
D=D+M
@LCL
A=M+1
A=A+1
M=D


// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1
0;JMP


// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.divide with 3
(Math.divide)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs
@6
D=A
@14
M=D
@Math.abs
D=A
@13
M=D
@Math.divide.ret.0
D=A
@CALL
0;JMP
(Math.divide.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs
@6
D=A
@14
M=D
@Math.abs
D=A
@13
M=D
@Math.divide.ret.1
D=A
@CALL
0;JMP
(Math.divide.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@Math.abs.EQ.23
D=A
@13
M=D
@Math.abs.EQ.24
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.24)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.GT.25
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Math.abs.GT.25)
@SP
AM=M-1
D=D|M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.23)
@Math.divide.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1
0;JMP


// label Math.divide.IfElse1
(Math.divide.IfElse1)


// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)


@Math.abs.EQ.27
D=A
@13
M=D
@Math.abs.EQ.28
D=A
@13
M=D
@ARG
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.28)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.27)
@Math.divide.IfElse2
D;JNE


D=1
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2
0;JMP


// label Math.divide.IfElse2
(Math.divide.IfElse2)


// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)


@Math.abs.EQ.31
D=A
@13
M=D
@Math.abs.LT.32
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.32)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.LT.33
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.33)
@SP
AM=M-1
D=D|M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.31)
@Math.divide.IfElse3
D;JNE


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Math.divide.ret.2
D=A
@CALL
0;JMP
(Math.divide.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Math.abs.EQ.36
D=A
@13
M=D
@Math.abs.LT.37
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.37)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.LT.38
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.38)
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.36)
@Math.divide.IfElse4
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4
0;JMP


// label Math.divide.IfElse4
(Math.divide.IfElse4)


// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D


@RETURN
0;JMP


// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3
0;JMP


// label Math.divide.IfElse3
(Math.divide.IfElse3)


// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Math.divide.ret.3
D=A
@CALL
0;JMP
(Math.divide.ret.3)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Math.abs.EQ.40
D=A
@13
M=D
@Math.abs.LT.41
D=A
@13
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Math.divide.ret.5
D=A
@CALL
0;JMP
(Math.divide.ret.5)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.41)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.40)
@Math.divide.IfElse5
D;JNE


@LCL
A=M
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5
0;JMP


// label Math.divide.IfElse5
(Math.divide.IfElse5)


// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)


@LCL
A=M
D=M
D=D+M
D=M+1
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.mod with 0
(Math.mod)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Math.mod.ret.0
D=A
@CALL
0;JMP
(Math.mod.ret.0)
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Math.mod.ret.1
D=A
@CALL
0;JMP
(Math.mod.ret.1)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.twoToThe with 0
(Math.twoToThe)


@Math.0
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=D+M
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.sqrt with 4
(Math.sqrt)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


@7
D=A
@LCL
A=M+1
M=D


// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)


@Math.abs.EQ.43
D=A
@13
M=D
@Math.abs.LT.44
D=A
@13
M=D
@LCL
A=M+1
D=M
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.44)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.43)
@WHILE_END_Math.sqrt1
D;JNE


@LCL
A=M
D=M
@R13
M=D
@THAT
A=M
D=M
@R13
D=D+M
@LCL
A=M+1
A=A+1
M=D


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Math.sqrt.ret.0
D=A
@CALL
0;JMP
(Math.sqrt.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
A=A+1
M=D


@Math.abs.EQ.47
D=A
@13
M=D
@Math.abs.GT.48
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=M-D
@15
M=D
@DO_GT
0;JMP
(Math.abs.GT.48)
D=!D
@SP
AM=M+1
A=A-1
M=D
@Math.abs.GT.49
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@15
M=D
@DO_GT
0;JMP
(Math.abs.GT.49)
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.47)
@Math.sqrt.IfElse1
D;JNE


@LCL
A=M+1
A=A+1
D=M
@LCL
A=M
M=D


// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1
0;JMP


// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)


// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)


@LCL
A=M+1
M=M-1


// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1
0;JMP


// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.max with 0
(Math.max)


@Math.abs.EQ.51
D=A
@13
M=D
@Math.abs.GT.52
D=A
@13
M=D
@ARG
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Math.abs.GT.52)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.51)
@Math.max.IfElse1
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.max.IfElseEND1
@Math.max.IfElseEND1
0;JMP


// label Math.max.IfElse1
(Math.max.IfElse1)


// label Math.max.IfElseEND1
(Math.max.IfElseEND1)


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.min with 0
(Math.min)


@Math.abs.EQ.54
D=A
@13
M=D
@Math.abs.LT.55
D=A
@13
M=D
@ARG
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_LT
0;JMP
(Math.abs.LT.55)
@15
M=D
@DO_EQ
0;JMP
(Math.abs.EQ.54)
@Math.min.IfElse1
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Math.min.IfElseEND1
@Math.min.IfElseEND1
0;JMP


// label Math.min.IfElse1
(Math.min.IfElse1)


// label Math.min.IfElseEND1
(Math.min.IfElseEND1)


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.abs with 0
(Math.abs)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D
// call Math.max
@7
D=A
@14
M=D
@Math.max
D=A
@13
M=D
@Math.abs.ret.0
D=A
@CALL
0;JMP
(Math.abs.ret.0)


@RETURN
0;JMP


// function Memory.init with 2
(Memory.init)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@2055
D=A
@LCL
A=M
M=D


@LCL
A=M
D=M
@4
M=D
@LCL
A=M
D=M
@16384
D=A-D
@5
D=D-A
@THAT
A=M
M=D


@LCL
A=M
D=M+1
@4
M=D
@THAT
A=M
M=1


@LCL
A=M
D=M
@2
D=D+A
@4
M=D
@THAT
A=M
M=0


@LCL
A=M
D=M
@3
D=D+A
@4
M=D
@THAT
A=M
M=0


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.create_foot
@6
D=A
@14
M=D
@Memory.create_foot
D=A
@13
M=D
@Memory.init.ret.0
D=A
@CALL
0;JMP
(Memory.init.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@2054
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.add_node
@7
D=A
@14
M=D
@Memory.add_node
D=A
@13
M=D
@Memory.init.ret.1
D=A
@CALL
0;JMP
(Memory.init.ret.1)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.alloc with 5
(Memory.alloc)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex
@6
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.alloc.ret.0
D=A
@CALL
0;JMP
(Memory.alloc.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@LCL
A=M
D=M
@2048
D=D+A
@LCL
A=M+1
M=D


@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.get_best_fit
@7
D=A
@14
M=D
@Memory.get_best_fit
D=A
@13
M=D
@Memory.alloc.ret.1
D=A
@CALL
0;JMP
(Memory.alloc.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)


@Memory.peek.EQ.1
D=A
@13
M=D
@Memory.peek.EQ.2
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.2)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.1)
@WHILE_END_Memory.alloc1
D;JNE


@Memory.peek.EQ.4
D=A
@13
M=D
@Memory.peek.LT.5
D=A
@13
M=D
@LCL
A=M
D=M+1
@7
D=D-A
@15
M=D
@DO_LT
0;JMP
(Memory.peek.LT.5)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.4)
@Memory.alloc.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1
0;JMP


// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)


// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)


@LCL
A=M
M=M+1


@LCL
A=M
D=M
@2048
D=D+A
@LCL
A=M+1
M=D


@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.get_best_fit
@7
D=A
@14
M=D
@Memory.get_best_fit
D=A
@13
M=D
@Memory.alloc.ret.2
D=A
@CALL
0;JMP
(Memory.alloc.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1
0;JMP


// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex
@6
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.alloc.ret.4
D=A
@CALL
0;JMP
(Memory.alloc.ret.4)
@SP
AM=M-1
D=M
@2048
D=D+A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.remove_node
@7
D=A
@14
M=D
@Memory.remove_node
D=A
@13
M=D
@Memory.alloc.ret.5
D=A
@CALL
0;JMP
(Memory.alloc.ret.5)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
A=A+1
D=M
@4
M=D


@THAT
A=M
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=M-D
@LCL
A=M+1
A=A+1
A=A+1
M=D


@Memory.peek.EQ.7
D=A
@13
M=D
@Memory.peek.GT.8
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@5
D=D-A
@15
M=D
@DO_GT
0;JMP
(Memory.peek.GT.8)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.7)
@Memory.alloc.IfElse2
D;JNE


@LCL
A=M+1
A=A+1
D=M
@4
M=D
@ARG
A=M
D=M
@THAT
A=M
M=D


@LCL
A=M+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
M=0


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.create_foot
@6
D=A
@14
M=D
@Memory.create_foot
D=A
@13
M=D
@Memory.alloc.ret.6
D=A
@CALL
0;JMP
(Memory.alloc.ret.6)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
A=A+1
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=D+M
@5
D=D+A
@LCL
D=M
@4
A=D+A
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@5
D=D-A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M+1
@4
M=D
@THAT
A=M
M=1


@LCL
D=M
@4
A=D+A
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.create_foot
@6
D=A
@14
M=D
@Memory.create_foot
D=A
@13
M=D
@Memory.alloc.ret.7
D=A
@CALL
0;JMP
(Memory.alloc.ret.7)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex
@6
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.alloc.ret.9
D=A
@CALL
0;JMP
(Memory.alloc.ret.9)
@SP
AM=M-1
D=M
@2048
D=D+A
@SP
AM=M+1
A=A-1
M=D
@LCL
D=M
@4
A=D+A
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.add_node
@7
D=A
@14
M=D
@Memory.add_node
D=A
@13
M=D
@Memory.alloc.ret.10
D=A
@CALL
0;JMP
(Memory.alloc.ret.10)
@SP
AM=M-1
D=M
@5
M=D


// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2
0;JMP


// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)


@LCL
A=M+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
M=0


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.create_foot
@6
D=A
@14
M=D
@Memory.create_foot
D=A
@13
M=D
@Memory.alloc.ret.11
D=A
@CALL
0;JMP
(Memory.alloc.ret.11)
@SP
AM=M-1
D=M
@5
M=D


// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)


@LCL
A=M+1
A=A+1
D=M
@4
D=D+A
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.calloc with 1
(Memory.calloc)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc
@6
D=A
@14
M=D
@Memory.alloc
D=A
@13
M=D
@Memory.calloc.ret.0
D=A
@CALL
0;JMP
(Memory.calloc.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Memory.peek.EQ.9
D=A
@13
M=D
@LCL
A=M
D=!M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.9)
@Memory.calloc.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1
0;JMP


// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)


// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)


// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)


@Memory.peek.EQ.11
D=A
@13
M=D
@Memory.peek.GT.12
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_GT
0;JMP
(Memory.peek.GT.12)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.11)
@WHILE_END_Memory.calloc1
D;JNE


@ARG
A=M
M=M-1


@LCL
A=M
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=D+M
@4
M=D
@THAT
A=M
M=0


// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1
0;JMP


// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@4
D=D-A
@LCL
A=M
M=D


@LCL
A=M
D=M+1
@4
M=D
@THAT
A=M
M=1


@LCL
A=M
D=M
@2
D=D+A
@4
M=D


@THAT
A=M
D=M
@LCL
A=M+1
M=D


@LCL
A=M
D=M
@3
D=D+A
@4
M=D


@THAT
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


@Memory.peek.EQ.14
D=A
@13
M=D
@Memory.peek.EQ.15
D=A
@13
M=D
@LCL
A=M+1
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.15)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.14)
@Memory.deAlloc.IfElse1
D;JNE


@LCL
A=M+1
D=M+1
@4
M=D


@Memory.peek.EQ.17
D=A
@13
M=D
@Memory.peek.EQ.18
D=A
@13
M=D
@THAT
A=M
D=M-1
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.18)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.17)
@Memory.deAlloc.IfElse2
D;JNE


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex
@6
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.deAlloc.ret.1
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.1)
@SP
AM=M-1
D=M
@2048
D=D+A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.remove_node
@7
D=A
@14
M=D
@Memory.remove_node
D=A
@13
M=D
@Memory.deAlloc.ret.2
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
D=M
@4
M=D


@LCL
A=M+1
D=M
@4
M=D
@THAT
A=M
D=M
D=D+M
@5
D=D+A
@THAT
A=M
M=D


@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.create_foot
@6
D=A
@14
M=D
@Memory.create_foot
D=A
@13
M=D
@Memory.deAlloc.ret.3
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
D=M
@LCL
A=M
M=D


// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2
0;JMP


// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)


// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)


// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1
0;JMP


// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)


// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)


@Memory.peek.EQ.20
D=A
@13
M=D
@Memory.peek.EQ.21
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.21)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.20)
@Memory.deAlloc.IfElse3
D;JNE


@LCL
A=M+1
A=A+1
D=M+1
@4
M=D


@Memory.peek.EQ.23
D=A
@13
M=D
@Memory.peek.EQ.24
D=A
@13
M=D
@THAT
A=M
D=M-1
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.24)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.23)
@Memory.deAlloc.IfElse4
D;JNE


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex
@6
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.deAlloc.ret.5
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.5)
@SP
AM=M-1
D=M
@2048
D=D+A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.remove_node
@7
D=A
@14
M=D
@Memory.remove_node
D=A
@13
M=D
@Memory.deAlloc.ret.6
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.6)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@4
M=D


@LCL
A=M
D=M
@4
M=D
@THAT
A=M
D=M
D=D+M
@5
D=D+A
@THAT
A=M
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.create_foot
@6
D=A
@14
M=D
@Memory.create_foot
D=A
@13
M=D
@Memory.deAlloc.ret.7
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.7)
@SP
AM=M-1
D=M
@5
M=D


// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4
0;JMP


// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)


// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)


// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3
0;JMP


// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)


// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex
@6
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.deAlloc.ret.9
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.9)
@SP
AM=M-1
D=M
@2048
D=D+A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.add_node
@7
D=A
@14
M=D
@Memory.add_node
D=A
@13
M=D
@Memory.deAlloc.ret.10
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.10)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.realloc with 4
(Memory.realloc)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@Memory.peek.EQ.26
D=A
@13
M=D
@Memory.peek.EQ.27
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.27)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.26)
@Memory.realloc.IfElse1
D;JNE


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc
@6
D=A
@14
M=D
@Memory.alloc
D=A
@13
M=D
@Memory.realloc.ret.0
D=A
@CALL
0;JMP
(Memory.realloc.ret.0)


@RETURN
0;JMP


// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1
0;JMP


// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)


// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)


@ARG
A=M
D=M-1
@LCL
A=M+1
A=A+1
A=A+1
M=D


@LCL
A=M+1
A=A+1
A=A+1
D=M
@4
M=D


@THAT
A=M
D=M
@LCL
A=M
M=D


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc
@6
D=A
@14
M=D
@Memory.alloc
D=A
@13
M=D
@Memory.realloc.ret.1
D=A
@CALL
0;JMP
(Memory.realloc.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@Memory.peek.EQ.29
D=A
@13
M=D
@Memory.peek.EQ.30
D=A
@13
M=D
@LCL
A=M+1
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.30)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.29)
@Memory.realloc.IfElse2
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2
0;JMP


// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)


// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)


@Memory.peek.EQ.32
D=A
@13
M=D
@Memory.peek.GT.33
D=A
@13
M=D
@LCL
A=M
D=M
@R13
M=D
@ARG
A=M+1
D=M
@R13
D=M-D
@15
M=D
@DO_GT
0;JMP
(Memory.peek.GT.33)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.32)
@Memory.realloc.IfElse3
D;JNE


@LCL
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3
0;JMP


// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)


@ARG
A=M+1
D=M
@LCL
A=M+1
A=A+1
M=D


// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.copy
@8
D=A
@14
M=D
@Memory.copy
D=A
@13
M=D
@Memory.realloc.ret.2
D=A
@CALL
0;JMP
(Memory.realloc.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.deAlloc
@6
D=A
@14
M=D
@Memory.deAlloc
D=A
@13
M=D
@Memory.realloc.ret.3
D=A
@CALL
0;JMP
(Memory.realloc.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.copy with 1
(Memory.copy)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)


@Memory.peek.EQ.35
D=A
@13
M=D
@Memory.peek.LT.36
D=A
@13
M=D
@LCL
A=M
D=M
@R13
M=D
@ARG
A=M+1
A=A+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Memory.peek.LT.36)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.35)
@WHILE_END_Memory.copy1
D;JNE


@ARG
A=M
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@4
M=D


@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@4
M=D
@THAT
A=M
D=M
@THAT
A=M
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1
0;JMP


// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.remove_node with 0
(Memory.remove_node)


@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


@Memory.peek.EQ.38
D=A
@13
M=D
@Memory.peek.EQ.39
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.39)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.38)
@Memory.remove_node.IfElse1
D;JNE


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


@ARG
A=M+1
D=M
@2
D=D+A
@3
D=D+A
@4
M=D
@THAT
A=M
D=M
@THAT
A=M
M=D


// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1
0;JMP


// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


@ARG
A=M
D=M
@4
M=D
@THAT
A=M
D=M
@THAT
A=M
M=D


// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


@Memory.peek.EQ.41
D=A
@13
M=D
@Memory.peek.EQ.42
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.42)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.41)
@Memory.remove_node.IfElse2
D;JNE


@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


@ARG
A=M+1
D=M
@3
D=D+A
@2
D=D+A
@4
M=D
@THAT
A=M
D=M
@THAT
A=M
M=D


// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2
0;JMP


// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)


// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)


@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D
@THAT
A=M
M=0


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D
@THAT
A=M
M=0


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)


@Memory.peek.EQ.45
D=A
@13
M=D
@Memory.peek.LT.46
D=A
@13
M=D
@LCL
A=M
D=M
@7
D=D-A
@15
M=D
@DO_LT
0;JMP
(Memory.peek.LT.46)
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.EQ.47
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.47)
D=!D
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.45)
@WHILE_END_Memory.getBinIndex1
D;JNE


@Memory.peek.EQ.49
D=A
@13
M=D
@Memory.peek.GT.50
D=A
@13
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D+1
@16
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Memory.getBinIndex.ret.1
D=A
@CALL
0;JMP
(Memory.getBinIndex.ret.1)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Memory.peek.GT.50)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.49)
@Memory.getBinIndex.IfElse1
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1
0;JMP


// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)


// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)


@LCL
A=M
M=M+1


// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1
0;JMP


// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)


@7
D=A
@SP
AM=M+1
A=A-1
M=D-1


@RETURN
0;JMP


// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@4
M=D


@THAT
A=M
D=M
@LCL
A=M
M=D


@LCL
A=M
D=M
@4
M=D


@Memory.peek.EQ.52
D=A
@13
M=D
@Memory.peek.LT.53
D=A
@13
M=D
@THAT
A=M
D=M
@R13
M=D
@ARG
A=M+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Memory.peek.LT.53)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.52)
@Memory.get_best_fit.IfElse1
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1
0;JMP


// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)


// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)


// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)


@LCL
A=M
D=M
@3
D=D+A
@4
M=D


@Memory.peek.EQ.55
D=A
@13
M=D
@Memory.peek.EQ.56
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.56)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.55)
@WHILE_END_Memory.get_best_fit1
D;JNE


@LCL
A=M
D=M
@3
D=D+A
@4
M=D


@THAT
A=M
D=M
@LCL
A=M
M=D


@LCL
A=M
D=M
@4
M=D


@Memory.peek.EQ.58
D=A
@13
M=D
@Memory.peek.LT.59
D=A
@13
M=D
@THAT
A=M
D=M
@R13
M=D
@ARG
A=M+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Memory.peek.LT.59)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.58)
@Memory.get_best_fit.IfElse2
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2
0;JMP


// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)


// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)


// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1
0;JMP


// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.create_foot with 0
(Memory.create_foot)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@THAT
A=M
D=M
@4
D=D+A
@SP
AM=M-1
D=D+M
@4
M=D
@ARG
A=M
D=M
@THAT
A=M
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.add_node with 2
(Memory.add_node)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D
@THAT
A=M
M=0


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D
@THAT
A=M
M=0


@ARG
A=M
D=M
@4
M=D


@Memory.peek.EQ.61
D=A
@13
M=D
@Memory.peek.EQ.62
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.62)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.61)
@Memory.add_node.IfElse1
D;JNE


@ARG
A=M
D=M
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1
0;JMP


// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)


// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)


@ARG
A=M
D=M
@4
M=D


@THAT
A=M
D=M
@LCL
A=M
M=D


@LCL
A=M+1
M=0


// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)


@Memory.peek.EQ.65
D=A
@13
M=D
@Memory.peek.EQ.66
D=A
@13
M=D
@LCL
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.66)
D=!D
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.GT.67
D=A
@13
M=D
@THAT
A=M
D=M
D=D-M
@15
M=D
@DO_GT
0;JMP
(Memory.peek.GT.67)
D=!D
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.65)
@WHILE_END_Memory.add_node1
D;JNE


@LCL
A=M
D=M
@LCL
A=M+1
M=D


@LCL
A=M
D=M
@3
D=D+A
@4
M=D


@THAT
A=M
D=M
@LCL
A=M
M=D


// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1
0;JMP


// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)


@Memory.peek.EQ.68
D=A
@13
M=D
@LCL
A=M+1
D=!M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.68)
@Memory.add_node.IfElse2
D;JNE


@ARG
A=M
D=M
@4
M=D


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D
@THAT
A=M
D=M
@THAT
A=M
M=D


@ARG
A=M
D=M
@2
D=D+A
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


@ARG
A=M
D=M
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2
0;JMP


// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D
@LCL
A=M
D=M
@THAT
A=M
M=D


@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D
@LCL
A=M+1
D=M
@THAT
A=M
M=D


@Memory.peek.EQ.69
D=A
@13
M=D
@LCL
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.69)
@Memory.add_node.IfElse3
D;JNE


@LCL
A=M
D=M
@2
D=D+A
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3
0;JMP


// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)


// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)


@LCL
A=M+1
D=M
@3
D=D+A
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.poke with 0
(Memory.poke)


@ARG
A=M
D=M
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.peek with 0
(Memory.peek)


@ARG
A=M
D=M
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.init with 0
(Output.init)


// call Output.initMap
@5
D=A
@14
M=D
@Output.initMap
D=A
@13
M=D
@Output.init.ret.0
D=A
@CALL
0;JMP
(Output.init.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@Output.1
M=0


@Output.2
M=0


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.initMap with 1
(Output.initMap)
@SP
AM=M+1
A=A-1
M=0


@127
D=A
@SP
AM=M+1
A=A-1
M=D
// call Array.new
@6
D=A
@14
M=D
@Array.new
D=A
@13
M=D
@Output.initMap.ret.0
D=A
@CALL
0;JMP
(Output.initMap.ret.0)
@SP
AM=M-1
D=M
@Output.0
M=D


D=0
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.1
D=A
@CALL
0;JMP
(Output.initMap.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@32
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.2
D=A
@CALL
0;JMP
(Output.initMap.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@33
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.3
D=A
@CALL
0;JMP
(Output.initMap.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@34
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@20
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.4
D=A
@CALL
0;JMP
(Output.initMap.ret.4)
@SP
AM=M-1
D=M
@5
M=D


@35
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.5
D=A
@CALL
0;JMP
(Output.initMap.ret.5)
@SP
AM=M-1
D=M
@5
M=D


@36
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.6
D=A
@CALL
0;JMP
(Output.initMap.ret.6)
@SP
AM=M-1
D=M
@5
M=D


@37
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@49
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.7
D=A
@CALL
0;JMP
(Output.initMap.ret.7)
@SP
AM=M-1
D=M
@5
M=D


@38
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.8
D=A
@CALL
0;JMP
(Output.initMap.ret.8)
@SP
AM=M-1
D=M
@5
M=D


@39
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.9
D=A
@CALL
0;JMP
(Output.initMap.ret.9)
@SP
AM=M-1
D=M
@5
M=D


@40
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.10
D=A
@CALL
0;JMP
(Output.initMap.ret.10)
@SP
AM=M-1
D=M
@5
M=D


@41
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.11
D=A
@CALL
0;JMP
(Output.initMap.ret.11)
@SP
AM=M-1
D=M
@5
M=D


@42
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.12
D=A
@CALL
0;JMP
(Output.initMap.ret.12)
@SP
AM=M-1
D=M
@5
M=D


@43
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.13
D=A
@CALL
0;JMP
(Output.initMap.ret.13)
@SP
AM=M-1
D=M
@5
M=D


@44
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.14
D=A
@CALL
0;JMP
(Output.initMap.ret.14)
@SP
AM=M-1
D=M
@5
M=D


@45
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.15
D=A
@CALL
0;JMP
(Output.initMap.ret.15)
@SP
AM=M-1
D=M
@5
M=D


@46
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.16
D=A
@CALL
0;JMP
(Output.initMap.ret.16)
@SP
AM=M-1
D=M
@5
M=D


@47
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@32
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
D=1
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.17
D=A
@CALL
0;JMP
(Output.initMap.ret.17)
@SP
AM=M-1
D=M
@5
M=D


@48
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.18
D=A
@CALL
0;JMP
(Output.initMap.ret.18)
@SP
AM=M-1
D=M
@5
M=D


@49
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@14
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.19
D=A
@CALL
0;JMP
(Output.initMap.ret.19)
@SP
AM=M-1
D=M
@5
M=D


@50
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.20
D=A
@CALL
0;JMP
(Output.initMap.ret.20)
@SP
AM=M-1
D=M
@5
M=D


@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.21
D=A
@CALL
0;JMP
(Output.initMap.ret.21)
@SP
AM=M-1
D=M
@5
M=D


@52
D=A
@SP
AM=M+1
A=A-1
M=D
@16
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@26
D=A
@SP
AM=M+1
A=A-1
M=D
@25
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.22
D=A
@CALL
0;JMP
(Output.initMap.ret.22)
@SP
AM=M-1
D=M
@5
M=D


@53
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.23
D=A
@CALL
0;JMP
(Output.initMap.ret.23)
@SP
AM=M-1
D=M
@5
M=D


@54
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.24
D=A
@CALL
0;JMP
(Output.initMap.ret.24)
@SP
AM=M-1
D=M
@5
M=D


@55
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@49
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.25
D=A
@CALL
0;JMP
(Output.initMap.ret.25)
@SP
AM=M-1
D=M
@5
M=D


@56
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.26
D=A
@CALL
0;JMP
(Output.initMap.ret.26)
@SP
AM=M-1
D=M
@5
M=D


@57
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@62
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@14
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.27
D=A
@CALL
0;JMP
(Output.initMap.ret.27)
@SP
AM=M-1
D=M
@5
M=D


@58
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.28
D=A
@CALL
0;JMP
(Output.initMap.ret.28)
@SP
AM=M-1
D=M
@5
M=D


@59
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.29
D=A
@CALL
0;JMP
(Output.initMap.ret.29)
@SP
AM=M-1
D=M
@5
M=D


@60
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.30
D=A
@CALL
0;JMP
(Output.initMap.ret.30)
@SP
AM=M-1
D=M
@5
M=D


@61
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.31
D=A
@CALL
0;JMP
(Output.initMap.ret.31)
@SP
AM=M-1
D=M
@5
M=D


@62
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.32
D=A
@CALL
0;JMP
(Output.initMap.ret.32)
@SP
AM=M-1
D=M
@5
M=D


@64
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.33
D=A
@CALL
0;JMP
(Output.initMap.ret.33)
@SP
AM=M-1
D=M
@5
M=D


@63
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.34
D=A
@CALL
0;JMP
(Output.initMap.ret.34)
@SP
AM=M-1
D=M
@5
M=D


@65
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.35
D=A
@CALL
0;JMP
(Output.initMap.ret.35)
@SP
AM=M-1
D=M
@5
M=D


@66
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.36
D=A
@CALL
0;JMP
(Output.initMap.ret.36)
@SP
AM=M-1
D=M
@5
M=D


@67
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.37
D=A
@CALL
0;JMP
(Output.initMap.ret.37)
@SP
AM=M-1
D=M
@5
M=D


@68
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.38
D=A
@CALL
0;JMP
(Output.initMap.ret.38)
@SP
AM=M-1
D=M
@5
M=D


@69
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@11
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@11
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.39
D=A
@CALL
0;JMP
(Output.initMap.ret.39)
@SP
AM=M-1
D=M
@5
M=D


@70
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@11
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@11
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.40
D=A
@CALL
0;JMP
(Output.initMap.ret.40)
@SP
AM=M-1
D=M
@5
M=D


@71
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@44
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.41
D=A
@CALL
0;JMP
(Output.initMap.ret.41)
@SP
AM=M-1
D=M
@5
M=D


@72
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.42
D=A
@CALL
0;JMP
(Output.initMap.ret.42)
@SP
AM=M-1
D=M
@5
M=D


@73
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.43
D=A
@CALL
0;JMP
(Output.initMap.ret.43)
@SP
AM=M-1
D=M
@5
M=D


@74
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@14
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.44
D=A
@CALL
0;JMP
(Output.initMap.ret.44)
@SP
AM=M-1
D=M
@5
M=D


@75
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.45
D=A
@CALL
0;JMP
(Output.initMap.ret.45)
@SP
AM=M-1
D=M
@5
M=D


@76
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.46
D=A
@CALL
0;JMP
(Output.initMap.ret.46)
@SP
AM=M-1
D=M
@5
M=D


@77
D=A
@SP
AM=M+1
A=A-1
M=D
@33
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.47
D=A
@CALL
0;JMP
(Output.initMap.ret.47)
@SP
AM=M-1
D=M
@5
M=D


@78
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@55
D=A
@SP
AM=M+1
A=A-1
M=D
@55
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.48
D=A
@CALL
0;JMP
(Output.initMap.ret.48)
@SP
AM=M-1
D=M
@5
M=D


@79
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.49
D=A
@CALL
0;JMP
(Output.initMap.ret.49)
@SP
AM=M-1
D=M
@5
M=D


@80
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.50
D=A
@CALL
0;JMP
(Output.initMap.ret.50)
@SP
AM=M-1
D=M
@5
M=D


@81
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@59
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.51
D=A
@CALL
0;JMP
(Output.initMap.ret.51)
@SP
AM=M-1
D=M
@5
M=D


@82
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.52
D=A
@CALL
0;JMP
(Output.initMap.ret.52)
@SP
AM=M-1
D=M
@5
M=D


@83
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.53
D=A
@CALL
0;JMP
(Output.initMap.ret.53)
@SP
AM=M-1
D=M
@5
M=D


@84
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@45
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.54
D=A
@CALL
0;JMP
(Output.initMap.ret.54)
@SP
AM=M-1
D=M
@5
M=D


@85
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.55
D=A
@CALL
0;JMP
(Output.initMap.ret.55)
@SP
AM=M-1
D=M
@5
M=D


@86
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.56
D=A
@CALL
0;JMP
(Output.initMap.ret.56)
@SP
AM=M-1
D=M
@5
M=D


@87
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.57
D=A
@CALL
0;JMP
(Output.initMap.ret.57)
@SP
AM=M-1
D=M
@5
M=D


@88
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.58
D=A
@CALL
0;JMP
(Output.initMap.ret.58)
@SP
AM=M-1
D=M
@5
M=D


@89
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.59
D=A
@CALL
0;JMP
(Output.initMap.ret.59)
@SP
AM=M-1
D=M
@5
M=D


@90
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@49
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@35
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.60
D=A
@CALL
0;JMP
(Output.initMap.ret.60)
@SP
AM=M-1
D=M
@5
M=D


@91
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.61
D=A
@CALL
0;JMP
(Output.initMap.ret.61)
@SP
AM=M-1
D=M
@5
M=D


@92
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=1
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@32
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.62
D=A
@CALL
0;JMP
(Output.initMap.ret.62)
@SP
AM=M-1
D=M
@5
M=D


@93
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.63
D=A
@CALL
0;JMP
(Output.initMap.ret.63)
@SP
AM=M-1
D=M
@5
M=D


@94
D=A
@SP
AM=M+1
A=A-1
M=D
@8
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.64
D=A
@CALL
0;JMP
(Output.initMap.ret.64)
@SP
AM=M-1
D=M
@5
M=D


@95
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.65
D=A
@CALL
0;JMP
(Output.initMap.ret.65)
@SP
AM=M-1
D=M
@5
M=D


@96
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.66
D=A
@CALL
0;JMP
(Output.initMap.ret.66)
@SP
AM=M-1
D=M
@5
M=D


@97
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@14
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.67
D=A
@CALL
0;JMP
(Output.initMap.ret.67)
@SP
AM=M-1
D=M
@5
M=D


@98
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.68
D=A
@CALL
0;JMP
(Output.initMap.ret.68)
@SP
AM=M-1
D=M
@5
M=D


@99
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.69
D=A
@CALL
0;JMP
(Output.initMap.ret.69)
@SP
AM=M-1
D=M
@5
M=D


@100
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@60
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.70
D=A
@CALL
0;JMP
(Output.initMap.ret.70)
@SP
AM=M-1
D=M
@5
M=D


@101
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.71
D=A
@CALL
0;JMP
(Output.initMap.ret.71)
@SP
AM=M-1
D=M
@5
M=D


@102
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@38
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.72
D=A
@CALL
0;JMP
(Output.initMap.ret.72)
@SP
AM=M-1
D=M
@5
M=D


@103
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@62
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.73
D=A
@CALL
0;JMP
(Output.initMap.ret.73)
@SP
AM=M-1
D=M
@5
M=D


@104
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@55
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.74
D=A
@CALL
0;JMP
(Output.initMap.ret.74)
@SP
AM=M-1
D=M
@5
M=D


@105
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@14
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.75
D=A
@CALL
0;JMP
(Output.initMap.ret.75)
@SP
AM=M-1
D=M
@5
M=D


@106
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@56
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.76
D=A
@CALL
0;JMP
(Output.initMap.ret.76)
@SP
AM=M-1
D=M
@5
M=D


@107
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.77
D=A
@CALL
0;JMP
(Output.initMap.ret.77)
@SP
AM=M-1
D=M
@5
M=D


@108
D=A
@SP
AM=M+1
A=A-1
M=D
@14
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.78
D=A
@CALL
0;JMP
(Output.initMap.ret.78)
@SP
AM=M-1
D=M
@5
M=D


@109
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@29
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@43
D=A
@SP
AM=M+1
A=A-1
M=D
@43
D=A
@SP
AM=M+1
A=A-1
M=D
@43
D=A
@SP
AM=M+1
A=A-1
M=D
@43
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.79
D=A
@CALL
0;JMP
(Output.initMap.ret.79)
@SP
AM=M-1
D=M
@5
M=D


@110
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@29
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.80
D=A
@CALL
0;JMP
(Output.initMap.ret.80)
@SP
AM=M-1
D=M
@5
M=D


@111
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.81
D=A
@CALL
0;JMP
(Output.initMap.ret.81)
@SP
AM=M-1
D=M
@5
M=D


@112
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@31
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.82
D=A
@CALL
0;JMP
(Output.initMap.ret.82)
@SP
AM=M-1
D=M
@5
M=D


@113
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@62
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.83
D=A
@CALL
0;JMP
(Output.initMap.ret.83)
@SP
AM=M-1
D=M
@5
M=D


@114
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@29
D=A
@SP
AM=M+1
A=A-1
M=D
@55
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=A
@SP
AM=M+1
A=A-1
M=D
@7
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.84
D=A
@CALL
0;JMP
(Output.initMap.ret.84)
@SP
AM=M-1
D=M
@5
M=D


@115
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.85
D=A
@CALL
0;JMP
(Output.initMap.ret.85)
@SP
AM=M-1
D=M
@5
M=D


@116
D=A
@SP
AM=M+1
A=A-1
M=D
@4
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
@28
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.86
D=A
@CALL
0;JMP
(Output.initMap.ret.86)
@SP
AM=M-1
D=M
@5
M=D


@117
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.87
D=A
@CALL
0;JMP
(Output.initMap.ret.87)
@SP
AM=M-1
D=M
@5
M=D


@118
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.88
D=A
@CALL
0;JMP
(Output.initMap.ret.88)
@SP
AM=M-1
D=M
@5
M=D


@119
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@18
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.89
D=A
@CALL
0;JMP
(Output.initMap.ret.89)
@SP
AM=M-1
D=M
@5
M=D


@120
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.90
D=A
@CALL
0;JMP
(Output.initMap.ret.90)
@SP
AM=M-1
D=M
@5
M=D


@121
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@62
D=A
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
@24
D=A
@SP
AM=M+1
A=A-1
M=D
@15
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.91
D=A
@CALL
0;JMP
(Output.initMap.ret.91)
@SP
AM=M-1
D=M
@5
M=D


@122
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@27
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@6
D=A
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
@63
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.92
D=A
@CALL
0;JMP
(Output.initMap.ret.92)
@SP
AM=M-1
D=M
@5
M=D


@123
D=A
@SP
AM=M+1
A=A-1
M=D
@56
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@7
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@56
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.93
D=A
@CALL
0;JMP
(Output.initMap.ret.93)
@SP
AM=M-1
D=M
@5
M=D


@124
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.94
D=A
@CALL
0;JMP
(Output.initMap.ret.94)
@SP
AM=M-1
D=M
@5
M=D


@125
D=A
@SP
AM=M+1
A=A-1
M=D
@7
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@56
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@12
D=A
@SP
AM=M+1
A=A-1
M=D
@7
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.95
D=A
@CALL
0;JMP
(Output.initMap.ret.95)
@SP
AM=M-1
D=M
@5
M=D


@126
D=A
@SP
AM=M+1
A=A-1
M=D
@38
D=A
@SP
AM=M+1
A=A-1
M=D
@45
D=A
@SP
AM=M+1
A=A-1
M=D
@25
D=A
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.create
@17
D=A
@14
M=D
@Output.create
D=A
@13
M=D
@Output.initMap.ret.96
D=A
@CALL
0;JMP
(Output.initMap.ret.96)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.create with 1
(Output.create)
@SP
AM=M+1
A=A-1
M=0


@11
D=A
@SP
AM=M+1
A=A-1
M=D
// call Array.new
@6
D=A
@14
M=D
@Array.new
D=A
@13
M=D
@Output.create.ret.0
D=A
@CALL
0;JMP
(Output.create.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Output.0
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=D+M
@4
M=D
@LCL
A=M
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M+1
@4
M=D
@ARG
A=M+1
A=A+1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@2
D=D+A
@4
M=D
@ARG
A=M+1
A=A+1
A=A+1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@3
D=D+A
@4
M=D
@ARG
D=M
@4
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@4
D=D+A
@4
M=D
@ARG
D=M
@5
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@5
D=D+A
@4
M=D
@ARG
D=M
@6
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@6
D=D+A
@4
M=D
@ARG
D=M
@7
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@7
D=D+A
@4
M=D
@ARG
D=M
@8
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@8
D=D+A
@4
M=D
@ARG
D=M
@9
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@9
D=D+A
@4
M=D
@ARG
D=M
@10
A=D+A
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@10
D=D+A
@4
M=D
@ARG
D=M
@11
A=D+A
D=M
@THAT
A=M
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.getMap with 0
(Output.getMap)


@Output.backSpace.EQ.2
D=A
@13
M=D
@Output.backSpace.LT.3
D=A
@13
M=D
@ARG
A=M
D=M
@32
D=D-A
@15
M=D
@DO_LT
0;JMP
(Output.backSpace.LT.3)
@SP
AM=M+1
A=A-1
M=D
@Output.backSpace.GT.4
D=A
@13
M=D
@ARG
A=M
D=M
@126
D=D-A
@15
M=D
@DO_GT
0;JMP
(Output.backSpace.GT.4)
@SP
AM=M-1
D=D|M
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.2)
@Output.getMap.IfElse1
D;JNE


@ARG
A=M
M=0


// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1
0;JMP


// label Output.getMap.IfElse1
(Output.getMap.IfElse1)


// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)


@Output.0
D=M
@R13
M=D
@ARG
A=M
D=M
@R13
D=D+M
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.moveCursor with 0
(Output.moveCursor)


@ARG
A=M+1
D=M
@Output.1
M=D


@ARG
A=M
D=M
@Output.2
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.printChar with 4
(Output.printChar)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.getMap
@6
D=A
@14
M=D
@Output.getMap
D=A
@13
M=D
@Output.printChar.ret.0
D=A
@CALL
0;JMP
(Output.printChar.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=0


// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)


@Output.backSpace.EQ.6
D=A
@13
M=D
@Output.backSpace.LT.7
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@11
D=D-A
@15
M=D
@DO_LT
0;JMP
(Output.backSpace.LT.7)
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.6)
@WHILE_END_Output.printChar1
D;JNE


@Output.2
D=M
@SP
AM=M+1
A=A-1
M=D
@11
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Output.printChar.ret.3
D=A
@CALL
0;JMP
(Output.printChar.ret.3)
@SP
AM=M-1
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
AM=M-1
D=D+M
@SP
AM=M+1
A=A-1
M=D
@32
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Output.printChar.ret.4
D=A
@CALL
0;JMP
(Output.printChar.ret.4)
@SP
AM=M-1
D=M
@16384
D=D+A
@SP
AM=M+1
A=A-1
M=D
@Output.1
D=M
@SP
AM=M+1
A=A-1
M=D
@2
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Output.printChar.ret.5
D=A
@CALL
0;JMP
(Output.printChar.ret.5)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
@LCL
A=M+1
M=D


@Output.backSpace.EQ.9
D=A
@13
M=D
@Output.backSpace.EQ.10
D=A
@13
M=D
@Output.1
D=M
@1
D=D&A
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.10)
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.9)
@Output.printChar.IfElse1
D;JNE


@LCL
A=M+1
A=A+1
A=A+1
D=M
A=A-1
A=A-1
A=A-1
D=D+M
@4
M=D


@THAT
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1
0;JMP


// label Output.printChar.IfElse1
(Output.printChar.IfElse1)


@LCL
A=M+1
A=A+1
A=A+1
D=M
A=A-1
A=A-1
A=A-1
D=D+M
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@256
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Output.printChar.ret.6
D=A
@CALL
0;JMP
(Output.printChar.ret.6)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)


@LCL
A=M+1
D=M
@4
M=D


@LCL
A=M+1
D=M
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
A=M+1
A=A+1
D=M
@R13
D=D|M
@THAT
A=M
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1
0;JMP


// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)


@Output.backSpace.EQ.12
D=A
@13
M=D
@Output.backSpace.EQ.13
D=A
@13
M=D
@Output.1
D=M
@63
D=D-A
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.13)
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.12)
@Output.printChar.IfElse2
D;JNE


// call Output.println
@5
D=A
@14
M=D
@Output.println
D=A
@13
M=D
@Output.printChar.ret.7
D=A
@CALL
0;JMP
(Output.printChar.ret.7)
@SP
AM=M-1
D=M
@5
M=D


// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2
0;JMP


// label Output.printChar.IfElse2
(Output.printChar.IfElse2)


@Output.1
M=M+1


// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.printString with 1
(Output.printString)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)


@Output.backSpace.EQ.15
D=A
@13
M=D
@Output.backSpace.LT.16
D=A
@13
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.length
@6
D=A
@14
M=D
@String.length
D=A
@13
M=D
@Output.printString.ret.1
D=A
@CALL
0;JMP
(Output.printString.ret.1)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@DO_LT
0;JMP
(Output.backSpace.LT.16)
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.15)
@WHILE_END_Output.printString1
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.charAt
@7
D=A
@14
M=D
@String.charAt
D=A
@13
M=D
@Output.printString.ret.2
D=A
@CALL
0;JMP
(Output.printString.ret.2)
// call Output.printChar
@6
D=A
@14
M=D
@Output.printChar
D=A
@13
M=D
@Output.printString.ret.3
D=A
@CALL
0;JMP
(Output.printString.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1
0;JMP


// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.printInt with 1
(Output.printInt)
@SP
AM=M+1
A=A-1
M=0


@10
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.new
@6
D=A
@14
M=D
@String.new
D=A
@13
M=D
@Output.printInt.ret.0
D=A
@CALL
0;JMP
(Output.printInt.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.setInt
@7
D=A
@14
M=D
@String.setInt
D=A
@13
M=D
@Output.printInt.ret.1
D=A
@CALL
0;JMP
(Output.printInt.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Output.printInt.ret.2
D=A
@CALL
0;JMP
(Output.printInt.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.dispose
@6
D=A
@14
M=D
@String.dispose
D=A
@13
M=D
@Output.printInt.ret.3
D=A
@CALL
0;JMP
(Output.printInt.ret.3)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.println with 0
(Output.println)


@Output.1
M=0


@Output.backSpace.EQ.18
D=A
@13
M=D
@Output.backSpace.EQ.19
D=A
@13
M=D
@Output.2
D=M
@22
D=D-A
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.19)
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.18)
@Output.println.IfElse1
D;JNE


@Output.2
M=0


// goto Output.println.IfElseEND1
@Output.println.IfElseEND1
0;JMP


// label Output.println.IfElse1
(Output.println.IfElse1)


@Output.2
M=M+1


// label Output.println.IfElseEND1
(Output.println.IfElseEND1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.backSpace with 0
(Output.backSpace)


@Output.backSpace.EQ.21
D=A
@13
M=D
@Output.backSpace.EQ.22
D=A
@13
M=D
@Output.1
D=M
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.22)
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.21)
@Output.backSpace.IfElse1
D;JNE


@Output.2
M=M-1


@63
D=A
@Output.1
M=D


// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1
0;JMP


// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)


@Output.1
M=M-1


// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.init with 0
(Screen.init)


D=0
@Screen.0
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.setColor with 0
(Screen.setColor)


@ARG
A=M
D=M
@Screen.0
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@32
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Screen.drawPixel.ret.2
D=A
@CALL
0;JMP
(Screen.drawPixel.ret.2)
@SP
AM=M-1
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@16
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Screen.drawPixel.ret.3
D=A
@CALL
0;JMP
(Screen.drawPixel.ret.3)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
@16384
D=D+A
@LCL
A=M
M=D


@ARG
A=M
D=M
@15
D=D&A
@LCL
A=M+1
M=D


@Screen.clearScreen.EQ.1
D=A
@13
M=D
@Screen.clearScreen.EQ.2
D=A
@13
M=D
@Screen.0
D=M
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.2)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.1)
@Screen.drawPixel.IfElse1
D;JNE


@LCL
A=M
D=M
@4
M=D


@LCL
A=M
D=M
@4
M=D
@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.twoToThe
@6
D=A
@14
M=D
@Math.twoToThe
D=A
@13
M=D
@Screen.drawPixel.ret.4
D=A
@CALL
0;JMP
(Screen.drawPixel.ret.4)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D|M
@THAT
A=M
M=D


// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1
0;JMP


// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)


@LCL
A=M
D=M
@4
M=D


@LCL
A=M
D=M
@4
M=D
@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.twoToThe
@6
D=A
@14
M=D
@Math.twoToThe
D=A
@13
M=D
@Screen.drawPixel.ret.5
D=A
@CALL
0;JMP
(Screen.drawPixel.ret.5)
@SP
AM=M-1
D=M
D=!D
@SP
AM=M-1
D=D&M
@THAT
A=M
M=D


// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawLine with 6
(Screen.drawLine)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=D-M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs
@6
D=A
@14
M=D
@Math.abs
D=A
@13
M=D
@Screen.drawLine.ret.0
D=A
@CALL
0;JMP
(Screen.drawLine.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@ARG
A=M+1
A=A+1
A=A+1
D=M
A=A-1
A=A-1
D=D-M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs
@6
D=A
@14
M=D
@Math.abs
D=A
@13
M=D
@Screen.drawLine.ret.1
D=A
@CALL
0;JMP
(Screen.drawLine.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@Screen.clearScreen.EQ.4
D=A
@13
M=D
@Screen.clearScreen.LT.5
D=A
@13
M=D
@ARG
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=M-D
@15
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.5)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.4)
@Screen.drawLine.IfElse1
D;JNE


@LCL
A=M+1
A=A+1
M=1


// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1
0;JMP


// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)


D=1
@LCL
A=M+1
A=A+1
M=D


// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)


@Screen.clearScreen.EQ.7
D=A
@13
M=D
@Screen.clearScreen.LT.8
D=A
@13
M=D
@ARG
A=M+1
A=A+1
A=A+1
D=M
A=A-1
A=A-1
D=M-D
@15
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.8)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.7)
@Screen.drawLine.IfElse2
D;JNE


@LCL
A=M+1
A=A+1
A=A+1
M=1


// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2
0;JMP


// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)


D=1
@LCL
A=M+1
A=A+1
A=A+1
M=D


// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)


@LCL
A=M+1
D=M
A=A-1
D=M-D
@LCL
D=M
@4
A=D+A
M=D


// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)


D=0
@WHILE_END_Screen.drawLine1
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawPixel
@7
D=A
@14
M=D
@Screen.drawPixel
D=A
@13
M=D
@Screen.drawLine.ret.2
D=A
@CALL
0;JMP
(Screen.drawLine.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@Screen.clearScreen.EQ.11
D=A
@13
M=D
@Screen.clearScreen.EQ.12
D=A
@13
M=D
@ARG
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.12)
@SP
AM=M+1
A=A-1
M=D
@Screen.clearScreen.EQ.13
D=A
@13
M=D
@ARG
A=M+1
A=A+1
A=A+1
D=M
A=A-1
A=A-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.13)
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.11)
@Screen.drawLine.IfElse3
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3
0;JMP


// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)


// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)


@LCL
D=M
@5
A=D+A
D=A
@13
M=D
@LCL
D=M
@4
A=D+A
D=M
D=D+M
@13
A=M
M=D


@Screen.clearScreen.EQ.15
D=A
@13
M=D
@Screen.clearScreen.GT.16
D=A
@13
M=D
@LCL
D=M
@5
A=D+A
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@15
M=D
@DO_GT
0;JMP
(Screen.clearScreen.GT.16)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.15)
@Screen.drawLine.IfElse4
D;JNE


@LCL
D=M
@4
A=D+A
D=M
A=A-1
A=A-1
A=A-1
D=D-M
@LCL
D=M
@4
A=D+A
M=D


@ARG
A=M
D=M
@R13
M=D
@LCL
A=M+1
A=A+1
D=M
@R13
D=D+M
@ARG
A=M
M=D


// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4
0;JMP


// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)


// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)


@Screen.clearScreen.EQ.18
D=A
@13
M=D
@Screen.clearScreen.LT.19
D=A
@13
M=D
@LCL
D=M
@5
A=D+A
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.19)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.18)
@Screen.drawLine.IfElse5
D;JNE


@LCL
D=M
@4
A=D+A
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@LCL
D=M
@4
A=D+A
M=D


@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@R13
D=D+M
@ARG
A=M+1
M=D


// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5
0;JMP


// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)


// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)


// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1
0;JMP


// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@LCL
A=M
M=D


// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)


@Screen.clearScreen.EQ.21
D=A
@13
M=D
@Screen.clearScreen.GT.22
D=A
@13
M=D
@LCL
A=M
D=M
@R13
M=D
@ARG
A=M+1
D=M
@R13
D=M-D
@15
M=D
@DO_GT
0;JMP
(Screen.clearScreen.GT.22)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.21)
@WHILE_END_Screen.drawHorizontalLine1
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawPixel
@7
D=A
@14
M=D
@Screen.drawPixel
D=A
@13
M=D
@Screen.drawHorizontalLine.ret.0
D=A
@CALL
0;JMP
(Screen.drawHorizontalLine.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1
0;JMP


// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


@ARG
A=M+1
A=A+1
D=M
@LCL
A=M+1
M=D


@ARG
A=M+1
A=A+1
D=M-1
D=-D
@LCL
A=M+1
A=A+1
M=D


// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)


@Screen.clearScreen.EQ.24
D=A
@13
M=D
@Screen.clearScreen.GT.25
D=A
@13
M=D
@LCL
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Screen.clearScreen.GT.25)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.24)
@WHILE_END_Screen.drawCircle1
D;JNE


@ARG
A=M
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=M-D
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawHorizontalLine
@8
D=A
@14
M=D
@Screen.drawHorizontalLine
D=A
@13
M=D
@Screen.drawCircle.ret.0
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@ARG
A=M
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=M-D
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=M-D
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawHorizontalLine
@8
D=A
@14
M=D
@Screen.drawHorizontalLine
D=A
@13
M=D
@Screen.drawCircle.ret.1
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@ARG
A=M
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=M-D
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawHorizontalLine
@8
D=A
@14
M=D
@Screen.drawHorizontalLine
D=A
@13
M=D
@Screen.drawCircle.ret.2
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@ARG
A=M
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=M-D
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=M-D
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawHorizontalLine
@8
D=A
@14
M=D
@Screen.drawHorizontalLine
D=A
@13
M=D
@Screen.drawCircle.ret.3
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@Screen.clearScreen.EQ.27
D=A
@13
M=D
@Screen.clearScreen.LT.28
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.28)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.27)
@Screen.drawCircle.IfElse1
D;JNE


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
D=D+M
@SP
AM=M-1
D=D+M
@3
D=D+A
@LCL
A=M+1
A=A+1
M=D


// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1
0;JMP


// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
D=M
A=A-1
D=M-D
@R13
M=D
D=D+M
@SP
AM=M-1
D=D+M
@5
D=D+A
@LCL
A=M+1
A=A+1
M=D


@LCL
A=M+1
M=M-1


// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1
0;JMP


// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@LCL
D=M
@9
A=D+A
D=A
@13
M=D
D=1
@13
A=M
M=D


@Screen.clearScreen.EQ.29
D=A
@13
M=D
@Screen.0
D=!M
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.29)
@Screen.drawRectangle.IfElse1
D;JNE


@LCL
D=M
@9
A=D+A
M=0


// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1
0;JMP


// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)


// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)


@ARG
A=M+1
D=M
@LCL
A=M
M=D


// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)


@Screen.clearScreen.EQ.31
D=A
@13
M=D
@Screen.clearScreen.GT.32
D=A
@13
M=D
@LCL
A=M
D=M
@R13
M=D
@ARG
A=M+1
A=A+1
A=A+1
D=M
@R13
D=M-D
@15
M=D
@DO_GT
0;JMP
(Screen.clearScreen.GT.32)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.31)
@WHILE_END_Screen.drawRectangle1
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@16
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Screen.drawRectangle.ret.0
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@ARG
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@16
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Screen.drawRectangle.ret.1
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@ARG
A=M
D=M
@15
D=D&A
@LCL
A=M+1
A=A+1
A=A+1
M=D


@ARG
A=M+1
A=A+1
D=M
@15
D=D&A
@LCL
D=M
@4
A=D+A
M=D


@LCL
D=M
@5
A=D+A
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@32
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Screen.drawRectangle.ret.2
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.2)
@SP
AM=M-1
D=M
@SP
AM=M-1
A=M
M=D


@Screen.clearScreen.EQ.34
D=A
@13
M=D
@Screen.clearScreen.EQ.35
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.35)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.34)
@Screen.drawRectangle.IfElse2
D;JNE


@LCL
D=M
@6
A=D+A
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
D=M
@4
A=D+A
D=M
@SP
AM=M+1
A=A-1
M=D+1
// call Math.twoToThe
@6
D=A
@14
M=D
@Math.twoToThe
D=A
@13
M=D
@Screen.drawRectangle.ret.3
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.3)
@SP
AM=M-1
D=M
D=M-1
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.twoToThe
@6
D=A
@14
M=D
@Math.twoToThe
D=A
@13
M=D
@Screen.drawRectangle.ret.4
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.4)
@SP
AM=M-1
D=M
D=M-1
@SP
AM=M-1
D=M-D
@SP
AM=M-1
A=M
M=D


@LCL
D=M
@7
A=D+A
D=A
@13
M=D
@LCL
D=M
@5
A=D+A
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@13
A=M
M=D


@Screen.clearScreen.EQ.36
D=A
@13
M=D
@Screen.0
D=M
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.36)
@Screen.drawRectangle.IfElse3
D;JNE


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
D=M
@6
A=D+A
D=M
@R13
D=D|M
@THAT
A=M
M=D


// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3
0;JMP


// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
D=M
@6
A=D+A
D=!M
@R13
D=D&M
@THAT
A=M
M=D


// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)


// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2
0;JMP


// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)


@LCL
D=M
@6
A=D+A
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.twoToThe
@6
D=A
@14
M=D
@Math.twoToThe
D=A
@13
M=D
@Screen.drawRectangle.ret.5
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.5)
@SP
AM=M-1
D=M
D=M-1
D=!D
@SP
AM=M-1
A=M
M=D


@LCL
D=M
@7
A=D+A
D=A
@13
M=D
@LCL
D=M
@5
A=D+A
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@13
A=M
M=D


@Screen.clearScreen.EQ.37
D=A
@13
M=D
@Screen.0
D=M
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.37)
@Screen.drawRectangle.IfElse4
D;JNE


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
D=M
@6
A=D+A
D=M
@R13
D=D|M
@THAT
A=M
M=D


// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4
0;JMP


// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
D=M
@6
A=D+A
D=!M
@R13
D=D&M
@THAT
A=M
M=D


// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)


@LCL
D=M
@8
A=D+A
D=A
@13
M=D
@LCL
A=M+1
D=M+1
@13
A=M
M=D


// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)


@Screen.clearScreen.EQ.39
D=A
@13
M=D
@Screen.clearScreen.LT.40
D=A
@13
M=D
@LCL
D=M
@8
A=D+A
D=M
@R13
M=D
@LCL
A=M+1
A=A+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.40)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.39)
@WHILE_END_Screen.drawRectangle2
D;JNE


@LCL
D=M
@7
A=D+A
D=A
@13
M=D
@LCL
D=M
@8
A=D+A
D=M
A=A-1
A=A-1
A=A-1
D=D+M
@13
A=M
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@LCL
D=M
@9
A=D+A
D=M
@THAT
A=M
M=D


@LCL
D=M
@8
A=D+A
M=M+1


// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2
0;JMP


// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)


@LCL
D=M
@6
A=D+A
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
D=M
@4
A=D+A
D=M
@SP
AM=M+1
A=A-1
M=D+1
// call Math.twoToThe
@6
D=A
@14
M=D
@Math.twoToThe
D=A
@13
M=D
@Screen.drawRectangle.ret.6
D=A
@CALL
0;JMP
(Screen.drawRectangle.ret.6)
@SP
AM=M-1
D=M
D=M-1
@SP
AM=M-1
A=M
M=D


@LCL
D=M
@7
A=D+A
D=A
@13
M=D
@LCL
D=M
@5
A=D+A
D=M
A=A-1
A=A-1
A=A-1
D=D+M
@13
A=M
M=D


@Screen.clearScreen.EQ.41
D=A
@13
M=D
@Screen.0
D=M
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.41)
@Screen.drawRectangle.IfElse5
D;JNE


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
D=M
@6
A=D+A
D=M
@R13
D=D|M
@THAT
A=M
M=D


// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5
0;JMP


// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
D=M
@6
A=D+A
D=!M
@R13
D=D&M
@THAT
A=M
M=D


// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)


// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1
0;JMP


// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)


@Screen.clearScreen.EQ.43
D=A
@13
M=D
@Screen.clearScreen.LT.44
D=A
@13
M=D
@LCL
A=M
D=M
@8192
D=D-A
@15
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.44)
@15
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.43)
@WHILE_END_Screen.clearScreen1
D;JNE


@LCL
A=M
D=M
@16384
D=D+A
@4
M=D
@THAT
A=M
M=0


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1
0;JMP


// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.new with 0
(String.new)


@3
D=A
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc
@6
D=A
@14
M=D
@Memory.alloc
D=A
@13
M=D
@String.new.ret.0
D=A
@CALL
0;JMP
(String.new.ret.0)
@SP
AM=M-1
D=M
@3
M=D


@String.newLine.EQ.1
D=A
@13
M=D
@String.newLine.EQ.2
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.2)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.1)
@String.new.IfElse1
D;JNE


@THIS
A=M
M=0


// goto String.new.IfElseEND1
@String.new.IfElseEND1
0;JMP


// label String.new.IfElse1
(String.new.IfElse1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.new
@6
D=A
@14
M=D
@Array.new
D=A
@13
M=D
@String.new.ret.1
D=A
@CALL
0;JMP
(String.new.ret.1)
@SP
AM=M-1
D=M
@THIS
A=M
M=D


// label String.new.IfElseEND1
(String.new.IfElseEND1)


@ARG
A=M
D=M
@THIS
A=M+1
A=A+1
M=D


@THIS
A=M+1
M=0


@3
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.dispose with 0
(String.dispose)


@ARG
A=M
D=M
@3
M=D


@String.newLine.EQ.4
D=A
@13
M=D
@String.newLine.EQ.5
D=A
@13
M=D
@THIS
A=M
D=M
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.5)
D=!D
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.4)
@String.dispose.IfElse1
D;JNE


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.dispose
@6
D=A
@14
M=D
@Array.dispose
D=A
@13
M=D
@String.dispose.ret.0
D=A
@CALL
0;JMP
(String.dispose.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1
0;JMP


// label String.dispose.IfElse1
(String.dispose.IfElse1)


// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.length with 0
(String.length)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.charAt with 0
(String.charAt)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M
D=M
@R13
M=D
@ARG
A=M+1
D=M
@R13
D=D+M
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.setCharAt with 0
(String.setCharAt)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M
D=M
@R13
M=D
@ARG
A=M+1
D=M
@R13
D=D+M
@4
M=D
@ARG
A=M+1
A=A+1
D=M
@THAT
A=M
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.appendChar with 1
(String.appendChar)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@String.newLine.EQ.7
D=A
@13
M=D
@String.newLine.EQ.8
D=A
@13
M=D
@THIS
A=M+1
A=A+1
D=M
A=A-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.8)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.7)
@String.appendChar.IfElse1
D;JNE


@THIS
A=M+1
A=A+1
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D
// call Array.new
@6
D=A
@14
M=D
@Array.new
D=A
@13
M=D
@String.appendChar.ret.0
D=A
@CALL
0;JMP
(String.appendChar.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@THIS
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.copy
@8
D=A
@14
M=D
@Memory.copy
D=A
@13
M=D
@String.appendChar.ret.1
D=A
@CALL
0;JMP
(String.appendChar.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.dispose
@6
D=A
@14
M=D
@Array.dispose
D=A
@13
M=D
@String.appendChar.ret.2
D=A
@CALL
0;JMP
(String.appendChar.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@THIS
A=M+1
A=A+1
D=M
D=D+M
@THIS
A=M+1
A=A+1
M=D


@LCL
A=M
D=M
@THIS
A=M
M=D


// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1
0;JMP


// label String.appendChar.IfElse1
(String.appendChar.IfElse1)


// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)


@THIS
A=M+1
D=M
A=A-1
D=D+M
@4
M=D
@ARG
A=M+1
D=M
@THAT
A=M
M=D


@THIS
A=M+1
M=M+1


@3
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.eraseLastChar with 0
(String.eraseLastChar)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
M=M-1


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.intValue with 2
(String.intValue)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@LCL
A=M+1
M=1


@LCL
A=M
M=0


// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)


@String.newLine.EQ.10
D=A
@13
M=D
@String.newLine.LT.11
D=A
@13
M=D
@LCL
A=M+1
D=M
@R13
M=D
@THIS
A=M+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(String.newLine.LT.11)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.10)
@WHILE_END_String.intValue1
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@10
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@String.intValue.ret.0
D=A
@CALL
0;JMP
(String.intValue.ret.0)
@SP
AM=M-1
D=M
@SP
AM=M+1
A=A-1
M=D
@THAT
A=M
D=M
@48
D=D-A
@SP
AM=M-1
D=D+M
@LCL
A=M
M=D


@LCL
A=M+1
M=M+1


// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1
0;JMP


// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.setInt with 6
(String.setInt)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
M=0


@LCL
D=M
@4
A=D+A
M=0


@String.newLine.EQ.13
D=A
@13
M=D
@String.newLine.EQ.14
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.14)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.13)
@String.setInt.IfElse1
D;JNE


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@48
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.0
D=A
@CALL
0;JMP
(String.setInt.ret.0)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1
0;JMP


// label String.setInt.IfElse1
(String.setInt.IfElse1)


// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)


@String.newLine.EQ.16
D=A
@13
M=D
@String.newLine.LT.17
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_LT
0;JMP
(String.newLine.LT.17)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.16)
@String.setInt.IfElse2
D;JNE


@LCL
D=M
@4
A=D+A
M=1


@String.newLine.EQ.20
D=A
@13
M=D
@String.newLine.LT.21
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_LT
0;JMP
(String.newLine.LT.21)
@SP
AM=M+1
A=A-1
M=D
@String.newLine.EQ.22
D=A
@13
M=D
@ARG
A=M+1
D=M
@32767
D=D&A
@32767
D=D-A
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.22)
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.20)
@String.setInt.IfElse3
D;JNE


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@45
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.1
D=A
@CALL
0;JMP
(String.setInt.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@51
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.2
D=A
@CALL
0;JMP
(String.setInt.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@50
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.3
D=A
@CALL
0;JMP
(String.setInt.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@55
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.4
D=A
@CALL
0;JMP
(String.setInt.ret.4)
@SP
AM=M-1
D=M
@5
M=D


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@54
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.5
D=A
@CALL
0;JMP
(String.setInt.ret.5)
@SP
AM=M-1
D=M
@5
M=D


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@56
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.6
D=A
@CALL
0;JMP
(String.setInt.ret.6)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3
0;JMP


// label String.setInt.IfElse3
(String.setInt.IfElse3)


// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)


@ARG
A=M+1
M=-M


// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2
0;JMP


// label String.setInt.IfElse2
(String.setInt.IfElse2)


// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)


@ARG
A=M+1
D=M
@LCL
A=M+1
A=A+1
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=0


// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)


@String.newLine.EQ.24
D=A
@13
M=D
@String.newLine.GT.25
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.25)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.24)
@WHILE_END_String.setInt1
D;JNE


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@10
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@String.setInt.ret.7
D=A
@CALL
0;JMP
(String.setInt.ret.7)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1
0;JMP


// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)


@LCL
D=M
@5
A=D+A
D=A
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.new
@6
D=A
@14
M=D
@Array.new
D=A
@13
M=D
@String.setInt.ret.8
D=A
@CALL
0;JMP
(String.setInt.ret.8)
@SP
AM=M-1
D=M
@SP
AM=M-1
A=M
M=D


@LCL
A=M+1
M=0


// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)


@String.newLine.EQ.27
D=A
@13
M=D
@String.newLine.GT.28
D=A
@13
M=D
@ARG
A=M+1
D=M
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.28)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.27)
@WHILE_END_String.setInt2
D;JNE


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@10
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@String.setInt.ret.9
D=A
@CALL
0;JMP
(String.setInt.ret.9)
@10
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@String.setInt.ret.10
D=A
@CALL
0;JMP
(String.setInt.ret.10)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@LCL
A=M
M=D


@LCL
D=M
@5
A=D+A
D=M
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D+M
@4
M=D
@LCL
A=M
D=M
@48
D=D+A
@THAT
A=M
M=D


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@10
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@String.setInt.ret.11
D=A
@CALL
0;JMP
(String.setInt.ret.11)
@SP
AM=M-1
D=M
@ARG
A=M+1
M=D


@LCL
A=M+1
M=M+1


// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2
0;JMP


// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)


@String.newLine.EQ.30
D=A
@13
M=D
@String.newLine.EQ.31
D=A
@13
M=D
@LCL
D=M
@4
A=D+A
D=M-1
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.31)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.30)
@String.setInt.IfElse4
D;JNE


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@45
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.12
D=A
@CALL
0;JMP
(String.setInt.ret.12)
@SP
AM=M-1
D=M
@5
M=D


// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4
0;JMP


// label String.setInt.IfElse4
(String.setInt.IfElse4)


// label String.setInt.IfElseEND4
(String.setInt.IfElseEND4)


// label WHILE_START_String.setInt3
(WHILE_START_String.setInt3)


@String.newLine.EQ.33
D=A
@13
M=D
@String.newLine.GT.34
D=A
@13
M=D
@LCL
A=M+1
D=M
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.34)
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.33)
@WHILE_END_String.setInt3
D;JNE


@LCL
A=M+1
M=M-1


@3
D=M
@SP
AM=M+1
A=A-1
M=D
@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.setInt.ret.13
D=A
@CALL
0;JMP
(String.setInt.ret.13)
@SP
AM=M-1
D=M
@5
M=D


// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3
0;JMP


// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)


@LCL
D=M
@5
A=D+A
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.dispose
@6
D=A
@14
M=D
@Array.dispose
D=A
@13
M=D
@String.setInt.ret.14
D=A
@CALL
0;JMP
(String.setInt.ret.14)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.backSpace with 0
(String.backSpace)


@129
D=A
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.doubleQuote with 0
(String.doubleQuote)


@34
D=A
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.newLine with 0
(String.newLine)


@128
D=A
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Sys.init with 0
(Sys.init)


// call Memory.init
@5
D=A
@14
M=D
@Memory.init
D=A
@13
M=D
@Sys.init.ret.0
D=A
@CALL
0;JMP
(Sys.init.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// call Math.init
@5
D=A
@14
M=D
@Math.init
D=A
@13
M=D
@Sys.init.ret.1
D=A
@CALL
0;JMP
(Sys.init.ret.1)
@SP
AM=M-1
D=M
@5
M=D


// call Screen.init
@5
D=A
@14
M=D
@Screen.init
D=A
@13
M=D
@Sys.init.ret.2
D=A
@CALL
0;JMP
(Sys.init.ret.2)
@SP
AM=M-1
D=M
@5
M=D


// call Output.init
@5
D=A
@14
M=D
@Output.init
D=A
@13
M=D
@Sys.init.ret.3
D=A
@CALL
0;JMP
(Sys.init.ret.3)
@SP
AM=M-1
D=M
@5
M=D


// call Keyboard.init
@5
D=A
@14
M=D
@Keyboard.init
D=A
@13
M=D
@Sys.init.ret.4
D=A
@CALL
0;JMP
(Sys.init.ret.4)
@SP
AM=M-1
D=M
@5
M=D


// call Main.main
@5
D=A
@14
M=D
@Main.main
D=A
@13
M=D
@Sys.init.ret.5
D=A
@CALL
0;JMP
(Sys.init.ret.5)
@SP
AM=M-1
D=M
@5
M=D


// call Sys.halt
@5
D=A
@14
M=D
@Sys.halt
D=A
@13
M=D
@Sys.init.ret.6
D=A
@CALL
0;JMP
(Sys.init.ret.6)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Sys.halt with 0
(Sys.halt)


// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)


D=0
@WHILE_END_Sys.halt1
D;JNE


// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1
0;JMP


// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Sys.wait with 1
(Sys.wait)
@SP
AM=M+1
A=A-1
M=0


// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)


@Sys.error.EQ.1
D=A
@13
M=D
@Sys.error.GT.2
D=A
@13
M=D
@ARG
A=M
D=M
@15
M=D
@DO_GT
0;JMP
(Sys.error.GT.2)
@15
M=D
@DO_EQ
0;JMP
(Sys.error.EQ.1)
@WHILE_END_Sys.wait1
D;JNE


@ARG
A=M
M=M-1


@70
D=A
@LCL
A=M
M=D


// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)


@Sys.error.EQ.4
D=A
@13
M=D
@Sys.error.GT.5
D=A
@13
M=D
@LCL
A=M
D=M
@15
M=D
@DO_GT
0;JMP
(Sys.error.GT.5)
@15
M=D
@DO_EQ
0;JMP
(Sys.error.EQ.4)
@WHILE_END_Sys.wait2
D;JNE


@LCL
A=M
M=M-1


// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2
0;JMP


// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)


// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1
0;JMP


// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Sys.error with 0
(Sys.error)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Sys.error.ret.0
D=A
@CALL
0;JMP
(Sys.error.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// call Output.println
@5
D=A
@14
M=D
@Output.println
D=A
@13
M=D
@Sys.error.ret.1
D=A
@CALL
0;JMP
(Sys.error.ret.1)
@SP
AM=M-1
D=M
@5
M=D


// call Sys.halt
@5
D=A
@14
M=D
@Sys.halt
D=A
@13
M=D
@Sys.error.ret.2
D=A
@CALL
0;JMP
(Sys.error.ret.2)
@SP
AM=M-1
D=M
@5
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


