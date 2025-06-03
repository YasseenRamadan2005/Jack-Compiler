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
D = -1  // true
@WRITE_BACK
0;JMP
(RETURN_FALSE)
D = 0   // false
@WRITE_BACK
0;JMP
// ---- collapse stack and return -----------------------------
(WRITE_BACK)
@13 // go back to caller
A = M
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
// function Array.new.1 with 0
(Array.new.1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc.1
@6
D=A
@14
M=D
@Memory.alloc.1
D=A
@13
M=D
@Array.new.1.ret.0
D=A
@CALL
0;JMP
(Array.new.1.ret.0)


@RETURN
0;JMP


// function Array.dispose.1 with 0
(Array.dispose.1)


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
// call Memory.free.1
@6
D=A
@14
M=D
@Memory.free.1
D=A
@13
M=D
@Array.dispose.1.ret.0
D=A
@CALL
0;JMP
(Array.dispose.1.ret.0)
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


// function Keyboard.init.0 with 0
(Keyboard.init.0)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.keyPressed.0 with 0
(Keyboard.keyPressed.0)


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


// function Keyboard.readChar.0 with 1
(Keyboard.readChar.0)
@SP
AM=M+1
A=A-1
M=0


// label WHILE_START_Keyboard.readChar.01
(WHILE_START_Keyboard.readChar.01)


@24576
D=A
@4
M=D


@Keyboard.readInt.1.EQ.0
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
(Keyboard.readInt.1.EQ.0)
@WHILE_END_Keyboard.readChar.01
D;JNE


// goto WHILE_START_Keyboard.readChar.01
@WHILE_START_Keyboard.readChar.01
0;JMP


// label WHILE_END_Keyboard.readChar.01
(WHILE_END_Keyboard.readChar.01)


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


// label WHILE_START_Keyboard.readChar.02
(WHILE_START_Keyboard.readChar.02)


@24576
D=A
@4
M=D


@Keyboard.readInt.1.EQ.1
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
(Keyboard.readInt.1.EQ.1)
D=!D
@WHILE_END_Keyboard.readChar.02
D;JNE


// goto WHILE_START_Keyboard.readChar.02
@WHILE_START_Keyboard.readChar.02
0;JMP


// label WHILE_END_Keyboard.readChar.02
(WHILE_END_Keyboard.readChar.02)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printChar.1
@6
D=A
@14
M=D
@Output.printChar.1
D=A
@13
M=D
@Keyboard.readChar.0.ret.0
D=A
@CALL
0;JMP
(Keyboard.readChar.0.ret.0)
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


// function Keyboard.readLine.1 with 2
(Keyboard.readLine.1)
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
// call Output.printString.1
@6
D=A
@14
M=D
@Output.printString.1
D=A
@13
M=D
@Keyboard.readLine.1.ret.0
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.0)
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
// call String.new.1
@6
D=A
@14
M=D
@String.new.1
D=A
@13
M=D
@Keyboard.readLine.1.ret.1
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


// call Keyboard.readChar.0
@5
D=A
@14
M=D
@Keyboard.readChar.0
D=A
@13
M=D
@Keyboard.readLine.1.ret.2
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


// label WHILE_START_Keyboard.readLine.11
(WHILE_START_Keyboard.readLine.11)


@Keyboard.readInt.1.EQ.2
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
// call String.newLine.0
@5
D=A
@14
M=D
@String.newLine.0
D=A
@13
M=D
@Keyboard.readLine.1.ret.3
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.3)
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
(Keyboard.readInt.1.EQ.2)
D=!D
@WHILE_END_Keyboard.readLine.11
D;JNE


@Keyboard.readInt.1.EQ.3
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
// call String.backSpace.0
@5
D=A
@14
M=D
@String.backSpace.0
D=A
@13
M=D
@Keyboard.readLine.1.ret.4
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.4)
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
(Keyboard.readInt.1.EQ.3)
D=!D
@Keyboard.readLine.1.IfElse1
D;JNE


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.eraseLastChar.1
@6
D=A
@14
M=D
@String.eraseLastChar.1
D=A
@13
M=D
@Keyboard.readLine.1.ret.5
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.5)
@SP
AM=M-1
D=M
@5
M=D


// goto Keyboard.readLine.1.IfElse1
@Keyboard.readLine.1.IfElse1
0;JMP


// label Keyboard.readLine.1.IfElse1
(Keyboard.readLine.1.IfElse1)


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
// call String.appendChar.2
@7
D=A
@14
M=D
@String.appendChar.2
D=A
@13
M=D
@Keyboard.readLine.1.ret.6
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.6)
@SP
AM=M-1
D=M
@5
M=D


// label Keyboard.readLine.1.IfElse1
(Keyboard.readLine.1.IfElse1)


// call Keyboard.readChar.0
@5
D=A
@14
M=D
@Keyboard.readChar.0
D=A
@13
M=D
@Keyboard.readLine.1.ret.7
D=A
@CALL
0;JMP
(Keyboard.readLine.1.ret.7)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


// goto WHILE_START_Keyboard.readLine.11
@WHILE_START_Keyboard.readLine.11
0;JMP


// label WHILE_END_Keyboard.readLine.11
(WHILE_END_Keyboard.readLine.11)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Keyboard.readInt.1 with 1
(Keyboard.readInt.1)
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
// call Keyboard.readLine.1
@6
D=A
@14
M=D
@Keyboard.readLine.1
D=A
@13
M=D
@Keyboard.readInt.1.ret.0
D=A
@CALL
0;JMP
(Keyboard.readInt.1.ret.0)
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
// call String.intValue.1
@6
D=A
@14
M=D
@String.intValue.1
D=A
@13
M=D
@Keyboard.readInt.1.ret.1
D=A
@CALL
0;JMP
(Keyboard.readInt.1.ret.1)


@RETURN
0;JMP


// function Main.main.0 with 0
(Main.main.0)


@13
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.new.1
@6
D=A
@14
M=D
@String.new.1
D=A
@13
M=D
@Main.main.0.ret.0
D=A
@CALL
0;JMP
(Main.main.0.ret.0)
@72
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.1
D=A
@CALL
0;JMP
(Main.main.0.ret.1)
@101
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.2
D=A
@CALL
0;JMP
(Main.main.0.ret.2)
@108
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.3
D=A
@CALL
0;JMP
(Main.main.0.ret.3)
@108
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.4
D=A
@CALL
0;JMP
(Main.main.0.ret.4)
@111
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.5
D=A
@CALL
0;JMP
(Main.main.0.ret.5)
@44
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.6
D=A
@CALL
0;JMP
(Main.main.0.ret.6)
@32
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.7
D=A
@CALL
0;JMP
(Main.main.0.ret.7)
@87
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.8
D=A
@CALL
0;JMP
(Main.main.0.ret.8)
@111
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.9
D=A
@CALL
0;JMP
(Main.main.0.ret.9)
@114
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.10
D=A
@CALL
0;JMP
(Main.main.0.ret.10)
@108
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.11
D=A
@CALL
0;JMP
(Main.main.0.ret.11)
@100
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.12
D=A
@CALL
0;JMP
(Main.main.0.ret.12)
@33
D=A
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.1
@7
D=A
@14
M=D
@String.appendChar.1
D=A
@13
M=D
@Main.main.0.ret.13
D=A
@CALL
0;JMP
(Main.main.0.ret.13)
// call Output.printString.1
@6
D=A
@14
M=D
@Output.printString.1
D=A
@13
M=D
@Main.main.0.ret.14
D=A
@CALL
0;JMP
(Main.main.0.ret.14)
@SP
AM=M-1
D=M
@5
M=D


// function Math.init.0 with 0
(Math.init.0)


@16
D=A
@SP
AM=M+1
A=A-1
M=D
// call Array.new.1
@6
D=A
@14
M=D
@Array.new.1
D=A
@13
M=D
@Math.init.0.ret.0
D=A
@CALL
0;JMP
(Math.init.0.ret.0)
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
M=0


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


@-32768
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


// function Math.bit.2 with 0
(Math.bit.2)


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
D=!D
@Math.bit.2.IfElse1
D;JNE


@SP
AM=M+1
A=A-1
M=-1


@RETURN
0;JMP


// label Math.bit.2.IfElse1
(Math.bit.2.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.multiply.2 with 3
(Math.multiply.2)
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
A=M
D=M
@LCL
A=M+1
M=D


@LCL
A=M+1
A=A+1
M=0


// label WHILE_START_Math.multiply.21
(WHILE_START_Math.multiply.21)


@Math.abs.1.LT.0
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
@16
D=D-A
@15
M=D
@DO_LT
0;JMP
(Math.abs.1.LT.0)
@WHILE_END_Math.multiply.21
D;JNE


@ARG
A=M
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
// call Math.bit.2
@7
D=A
@14
M=D
@Math.bit.2
D=A
@13
M=D
@Math.multiply.2.ret.0
D=A
@CALL
0;JMP
(Math.multiply.2.ret.0)
@SP
AM=M-1
D=M
D=!D
@Math.multiply.2.IfElse1
D;JNE


@LCL
A=M+1
D=M
A=A-1
D=D+M
@LCL
A=M
M=D


// label Math.multiply.2.IfElse1
(Math.multiply.2.IfElse1)


@LCL
A=M+1
D=M
D=D+M
@LCL
A=M+1
M=D


@LCL
A=M+1
A=A+1
M=M+1


// goto WHILE_START_Math.multiply.21
@WHILE_START_Math.multiply.21
0;JMP


// label WHILE_END_Math.multiply.21
(WHILE_END_Math.multiply.21)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.divide.2 with 1
(Math.divide.2)
@SP
AM=M+1
A=A-1
M=0


@Math.abs.1.GT.1
D=A
@13
M=D
@ARG
A=M+1
D=M
A=A-1
D=D-M
@15
M=D
@DO_GT
0;JMP
(Math.abs.1.GT.1)
D=!D
@Math.divide.2.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Math.divide.2.IfElse1
(Math.divide.2.IfElse1)


@Math.abs.1.EQ.2
D=A
@13
M=D
@ARG
A=M+1
D=M
A=A-1
D=D-M
@15
M=D
@DO_EQ
0;JMP
(Math.abs.1.EQ.2)
D=!D
@Math.divide.2.IfElse2
D;JNE


D=1
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Math.divide.2.IfElse2
(Math.divide.2.IfElse2)


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
// call Math.divide.2
@7
D=A
@14
M=D
@Math.divide.2
D=A
@13
M=D
@Math.divide.2.ret.0
D=A
@CALL
0;JMP
(Math.divide.2.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Math.abs.1.LT.3
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
@Math.divide.2.ret.1
D=A
@CALL
0;JMP
(Math.divide.2.ret.1)
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
(Math.abs.1.LT.3)
D=!D
@Math.divide.2.IfElse3
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


// label Math.divide.2.IfElse3
(Math.divide.2.IfElse3)


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


// function Math.sqrt.1 with 3
(Math.sqrt.1)
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


@15
D=A
@LCL
A=M+1
M=D


// label WHILE_START_Math.sqrt.11
(WHILE_START_Math.sqrt.11)


@Math.abs.1.GT.4
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
(Math.abs.1.GT.4)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.1.EQ.5
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
(Math.abs.1.EQ.5)
@SP
AM=M-1
D=D|M
@WHILE_END_Math.sqrt.11
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


@Math.abs.1.GT.6
D=A
@13
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
@Math.sqrt.1.ret.0
D=A
@CALL
0;JMP
(Math.sqrt.1.ret.0)
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
AM=M-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Math.abs.1.GT.6)
@Math.sqrt.1.IfElse1
D;JNE


@LCL
A=M+1
A=A+1
D=M
@LCL
A=M
M=D


// label Math.sqrt.1.IfElse1
(Math.sqrt.1.IfElse1)


@LCL
A=M+1
M=M-1


// goto WHILE_START_Math.sqrt.11
@WHILE_START_Math.sqrt.11
0;JMP


// label WHILE_END_Math.sqrt.11
(WHILE_END_Math.sqrt.11)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.max.2 with 0
(Math.max.2)


@Math.abs.1.GT.7
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
(Math.abs.1.GT.7)
D=!D
@Math.max.2.IfElse1
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


// label Math.max.2.IfElse1
(Math.max.2.IfElse1)


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.min.2 with 0
(Math.min.2)


@Math.abs.1.LT.8
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
(Math.abs.1.LT.8)
D=!D
@Math.min.2.IfElse1
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


// label Math.min.2.IfElse1
(Math.min.2.IfElse1)


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Math.abs.1 with 0
(Math.abs.1)


@Math.abs.1.LT.9
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
(Math.abs.1.LT.9)
D=!D
@Math.abs.1.IfElse1
D;JNE


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


@RETURN
0;JMP


// label Math.abs.1.IfElse1
(Math.abs.1.IfElse1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.init.0 with 2
(Memory.init.0)
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


// label WHILE_START_Memory.init.01
(WHILE_START_Memory.init.01)


@Memory.peek.1.LT.0
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
(Memory.peek.1.LT.0)
@WHILE_END_Memory.init.01
D;JNE


@LCL
A=M
D=M
@2048
D=D+A
@4
M=D


@THAT
A=M
M=0


@LCL
A=M
M=M+1


// goto WHILE_START_Memory.init.01
@WHILE_START_Memory.init.01
0;JMP


// label WHILE_END_Memory.init.01
(WHILE_END_Memory.init.01)


@2055
D=A
@4
M=D


@2055
D=A
@THAT
A=M
M=D


@2055
D=A
@4
M=D


@14423
D=A
@THAT
A=M
M=D


@2055
D=A
@4
M=D


@THAT
A=M
M=1


@2055
D=A
@4
M=D


@THAT
A=M
M=0


@2055
D=A
@4
M=D


@THAT
A=M
M=0


@2055
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
// call Memory.create_foot.1
@6
D=A
@14
M=D
@Memory.create_foot.1
D=A
@13
M=D
@Memory.init.0.ret.0
D=A
@CALL
0;JMP
(Memory.init.0.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@14423
D=A
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.init.0.ret.2
D=A
@CALL
0;JMP
(Memory.init.0.ret.2)
@SP
AM=M-1
D=M
@2048
D=D+A
@4
M=D


@THAT
A=M
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
// call Memory.add_node.2
@7
D=A
@14
M=D
@Memory.add_node.2
D=A
@13
M=D
@Memory.init.0.ret.3
D=A
@CALL
0;JMP
(Memory.init.0.ret.3)
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


// function Memory.alloc.1 with 5
(Memory.alloc.1)
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.alloc.1.ret.0
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.0)
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
@4
M=D


@THAT
A=M
D=M
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.get_best_fit.3
@8
D=A
@14
M=D
@Memory.get_best_fit.3
D=A
@13
M=D
@Memory.alloc.1.ret.1
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


// label WHILE_START_Memory.alloc.11
(WHILE_START_Memory.alloc.11)


@LCL
A=M+1
A=A+1
D=!M
@WHILE_END_Memory.alloc.11
D;JNE


@Memory.peek.1.LT.1
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
(Memory.peek.1.LT.1)
@Memory.alloc.1.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Memory.alloc.1.IfElse1
(Memory.alloc.1.IfElse1)


@LCL
A=M
M=M+1


@LCL
A=M
D=M
@2048
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.get_best_fit.3
@8
D=A
@14
M=D
@Memory.get_best_fit.3
D=A
@13
M=D
@Memory.alloc.1.ret.2
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


// goto WHILE_START_Memory.alloc.11
@WHILE_START_Memory.alloc.11
0;JMP


// label WHILE_END_Memory.alloc.11
(WHILE_END_Memory.alloc.11)


@LCL
A=M+1
A=A+1
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.alloc.1.ret.4
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.4)
@SP
AM=M-1
D=M
@2048
D=D+A
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
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.remove_node.3
@8
D=A
@14
M=D
@Memory.remove_node.3
D=A
@13
M=D
@Memory.alloc.1.ret.5
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.5)
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
@5
D=D-A
@LCL
A=M+1
A=A+1
A=A+1
M=D


@Memory.peek.1.LT.2
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
@DO_LT
0;JMP
(Memory.peek.1.LT.2)
@Memory.alloc.1.IfElse2
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
// call Memory.create_foot.1
@6
D=A
@14
M=D
@Memory.create_foot.1
D=A
@13
M=D
@Memory.alloc.1.ret.6
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.6)
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
@4
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
// call Memory.create_foot.1
@6
D=A
@14
M=D
@Memory.create_foot.1
D=A
@13
M=D
@Memory.alloc.1.ret.7
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.7)
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.alloc.1.ret.9
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.9)
@SP
AM=M-1
D=M
@2048
D=D+A
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
D=M
@4
A=D+A
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.add_node.2
@7
D=A
@14
M=D
@Memory.add_node.2
D=A
@13
M=D
@Memory.alloc.1.ret.10
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.10)
@SP
AM=M-1
D=M
@5
M=D


// goto Memory.alloc.1.IfElse2
@Memory.alloc.1.IfElse2
0;JMP


// label Memory.alloc.1.IfElse2
(Memory.alloc.1.IfElse2)


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
// call Memory.create_foot.1
@6
D=A
@14
M=D
@Memory.create_foot.1
D=A
@13
M=D
@Memory.alloc.1.ret.11
D=A
@CALL
0;JMP
(Memory.alloc.1.ret.11)
@SP
AM=M-1
D=M
@5
M=D


// label Memory.alloc.1.IfElse2
(Memory.alloc.1.IfElse2)


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D+1


@RETURN
0;JMP


// function Memory.calloc.1 with 1
(Memory.calloc.1)
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
// call Memory.alloc.1
@6
D=A
@14
M=D
@Memory.alloc.1
D=A
@13
M=D
@Memory.calloc.1.ret.0
D=A
@CALL
0;JMP
(Memory.calloc.1.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@LCL
A=M
D=M
@Memory.calloc.1.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Memory.calloc.1.IfElse1
(Memory.calloc.1.IfElse1)


// label WHILE_START_Memory.calloc.11
(WHILE_START_Memory.calloc.11)


@Memory.peek.1.GT.3
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
(Memory.peek.1.GT.3)
@WHILE_END_Memory.calloc.11
D;JNE


@ARG
A=M
M=M-1


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


@THAT
A=M
M=0


// goto WHILE_START_Memory.calloc.11
@WHILE_START_Memory.calloc.11
0;JMP


// label WHILE_END_Memory.calloc.11
(WHILE_END_Memory.calloc.11)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.free.1 with 3
(Memory.free.1)
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
D=M-1
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
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getPrevNode.2
@7
D=A
@14
M=D
@Memory.getPrevNode.2
D=A
@13
M=D
@Memory.free.1.ret.0
D=A
@CALL
0;JMP
(Memory.free.1.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getNextNode.2
@7
D=A
@14
M=D
@Memory.getNextNode.2
D=A
@13
M=D
@Memory.free.1.ret.1
D=A
@CALL
0;JMP
(Memory.free.1.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@Memory.peek.1.EQ.4
D=A
@13
M=D
@LCL
A=M+1
D=M
@R13
M=D
@THAT
A=M
D=M
@R13
D=D&M
D=M-1
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.1.EQ.4)
D=!D
@Memory.free.1.IfElse1
D;JNE


@LCL
A=M+1
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.free.1.ret.3
D=A
@CALL
0;JMP
(Memory.free.1.ret.3)
@SP
AM=M-1
D=M
@2048
D=D+A
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.remove_node.3
@8
D=A
@14
M=D
@Memory.remove_node.3
D=A
@13
M=D
@Memory.free.1.ret.4
D=A
@CALL
0;JMP
(Memory.free.1.ret.4)
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
// call Memory.create_foot.1
@6
D=A
@14
M=D
@Memory.create_foot.1
D=A
@13
M=D
@Memory.free.1.ret.5
D=A
@CALL
0;JMP
(Memory.free.1.ret.5)
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


// label Memory.free.1.IfElse1
(Memory.free.1.IfElse1)


@Memory.peek.1.EQ.5
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
@R13
M=D
@THAT
A=M
D=M
@R13
D=D&M
D=M-1
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.1.EQ.5)
D=!D
@Memory.free.1.IfElse2
D;JNE


@LCL
A=M+1
A=A+1
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.free.1.ret.7
D=A
@CALL
0;JMP
(Memory.free.1.ret.7)
@SP
AM=M-1
D=M
@2048
D=D+A
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
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.remove_node.3
@8
D=A
@14
M=D
@Memory.remove_node.3
D=A
@13
M=D
@Memory.free.1.ret.8
D=A
@CALL
0;JMP
(Memory.free.1.ret.8)
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
// call Memory.create_foot.1
@6
D=A
@14
M=D
@Memory.create_foot.1
D=A
@13
M=D
@Memory.free.1.ret.9
D=A
@CALL
0;JMP
(Memory.free.1.ret.9)
@SP
AM=M-1
D=M
@5
M=D


// label Memory.free.1.IfElse2
(Memory.free.1.IfElse2)


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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBinIndex.2
@7
D=A
@14
M=D
@Memory.getBinIndex.2
D=A
@13
M=D
@Memory.free.1.ret.11
D=A
@CALL
0;JMP
(Memory.free.1.ret.11)
@SP
AM=M-1
D=M
@2048
D=D+A
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
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.add_node.2
@7
D=A
@14
M=D
@Memory.add_node.2
D=A
@13
M=D
@Memory.free.1.ret.12
D=A
@CALL
0;JMP
(Memory.free.1.ret.12)
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


// function Memory.realloc.2 with 3
(Memory.realloc.2)
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


@Memory.peek.1.EQ.6
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
(Memory.peek.1.EQ.6)
D=!D
@Memory.realloc.2.IfElse1
D;JNE


@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc.2
@7
D=A
@14
M=D
@Memory.alloc.2
D=A
@13
M=D
@Memory.realloc.2.ret.0
D=A
@CALL
0;JMP
(Memory.realloc.2.ret.0)


@RETURN
0;JMP


// label Memory.realloc.2.IfElse1
(Memory.realloc.2.IfElse1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D-1
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.getBlockSize.2
@7
D=A
@14
M=D
@Memory.getBlockSize.2
D=A
@13
M=D
@Memory.realloc.2.ret.1
D=A
@CALL
0;JMP
(Memory.realloc.2.ret.1)
@SP
AM=M-1
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.alloc.2
@7
D=A
@14
M=D
@Memory.alloc.2
D=A
@13
M=D
@Memory.realloc.2.ret.2
D=A
@CALL
0;JMP
(Memory.realloc.2.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@Memory.peek.1.EQ.7
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
(Memory.peek.1.EQ.7)
D=!D
@Memory.realloc.2.IfElse2
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


@THAT
A=M
D=M
@THAT
A=M
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Memory.copy.31
@WHILE_START_Memory.copy.31
0;JMP


// label WHILE_END_Memory.copy.31
(WHILE_END_Memory.copy.31)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.remove_node.2 with 0
(Memory.remove_node.2)


@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


@THAT
A=M
D=!M
@Memory.remove_node.2.IfElse1
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
@4
M=D


@THAT
A=M
D=M
@THAT
A=M
M=D


// goto Memory.remove_node.2.IfElse1
@Memory.remove_node.2.IfElse1
0;JMP


// label Memory.remove_node.2.IfElse1
(Memory.remove_node.2.IfElse1)


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


// label Memory.remove_node.2.IfElse1
(Memory.remove_node.2.IfElse1)


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


@THAT
A=M
D=!M
@Memory.remove_node.2.IfElse2
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
@4
M=D


@THAT
A=M
D=M
@THAT
A=M
M=D


// label Memory.remove_node.2.IfElse2
(Memory.remove_node.2.IfElse2)


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


// function Memory.getBinIndex.1 with 1
(Memory.getBinIndex.1)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Memory.getBinIndex.11
(WHILE_START_Memory.getBinIndex.11)


@Memory.peek.1.LT.8
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
(Memory.peek.1.LT.8)
@WHILE_END_Memory.getBinIndex.11
D;JNE


@Memory.peek.1.GT.9
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
D=M+1
@SP
AM=M-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Memory.peek.1.GT.9)
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
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Memory.getBinIndex.1.ret.0
D=A
@CALL
0;JMP
(Memory.getBinIndex.1.ret.0)
@SP
AM=M-1
D=M
@Memory.getBinIndex.1.IfElse1
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


// label Memory.getBinIndex.1.IfElse1
(Memory.getBinIndex.1.IfElse1)


@LCL
A=M
M=M+1


// goto WHILE_START_Memory.getBinIndex.11
@WHILE_START_Memory.getBinIndex.11
0;JMP


// label WHILE_END_Memory.getBinIndex.11
(WHILE_END_Memory.getBinIndex.11)


@7
D=A
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.get_best_fit.2 with 1
(Memory.get_best_fit.2)
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


// label WHILE_START_Memory.get_best_fit.21
(WHILE_START_Memory.get_best_fit.21)


@LCL
A=M
D=M
@WHILE_END_Memory.get_best_fit.21
D;JNE


@LCL
A=M
D=M
@4
M=D


@Memory.peek.1.LT.10
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
(Memory.peek.1.LT.10)
@Memory.get_best_fit.2.IfElse1
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


// label Memory.get_best_fit.2.IfElse1
(Memory.get_best_fit.2.IfElse1)


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


// goto WHILE_START_Memory.get_best_fit.21
@WHILE_START_Memory.get_best_fit.21
0;JMP


// label WHILE_END_Memory.get_best_fit.21
(WHILE_END_Memory.get_best_fit.21)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.get_foot.1 with 0
(Memory.get_foot.1)


@ARG
A=M
D=M
@4
D=D+A
@SP
AM=M+1
A=A-1
M=D
@THAT
A=M
D=M
@SP
AM=M-1
D=D+M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.create_foot.1 with 0
(Memory.create_foot.1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.get_foot.2
@7
D=A
@14
M=D
@Memory.get_foot.2
D=A
@13
M=D
@Memory.create_foot.1.ret.0
D=A
@CALL
0;JMP
(Memory.create_foot.1.ret.0)
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.poke.2
@7
D=A
@14
M=D
@Memory.poke.2
D=A
@13
M=D
@Memory.create_foot.1.ret.1
D=A
@CALL
0;JMP
(Memory.create_foot.1.ret.1)
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


// function Memory.add_node.2 with 2
(Memory.add_node.2)
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


@THAT
A=M
D=M
@Memory.add_node.2.IfElse1
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


// label Memory.add_node.2.IfElse1
(Memory.add_node.2.IfElse1)


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


// label WHILE_START_Memory.add_node.21
(WHILE_START_Memory.add_node.21)


@Memory.peek.1.EQ.11
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
(Memory.peek.1.EQ.11)
D=!D
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.1.GT.12
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
(Memory.peek.1.GT.12)
D=!D
@SP
AM=M-1
D=D&M
@WHILE_END_Memory.add_node.21
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


// goto WHILE_START_Memory.add_node.21
@WHILE_START_Memory.add_node.21
0;JMP


// label WHILE_END_Memory.add_node.21
(WHILE_END_Memory.add_node.21)


@LCL
A=M+1
D=M
@Memory.add_node.2.IfElse2
D;JNE


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


// goto Memory.add_node.2.IfElse2
@Memory.add_node.2.IfElse2
0;JMP


// label Memory.add_node.2.IfElse2
(Memory.add_node.2.IfElse2)


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


@LCL
A=M
D=!M
@Memory.add_node.2.IfElse3
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


// label Memory.add_node.2.IfElse3
(Memory.add_node.2.IfElse3)


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


// label Memory.add_node.2.IfElse2
(Memory.add_node.2.IfElse2)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.getPrevNode.1 with 1
(Memory.getPrevNode.1)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@5
D=D-A
@LCL
A=M
M=D


@LCL
A=M
D=M
@4
M=D


@Memory.peek.1.EQ.13
D=A
@13
M=D
@THAT
A=M
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@5
D=D+A
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.1.EQ.13)
D=!D
@Memory.getPrevNode.1.IfElse1
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


// label Memory.getPrevNode.1.IfElse1
(Memory.getPrevNode.1.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.getNextNode.1 with 1
(Memory.getNextNode.1)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@R13
M=D
@THAT
A=M
D=M
@R13
D=D+M
@5
D=D+A
@LCL
A=M
M=D


@LCL
A=M
D=M
@4
M=D


@Memory.peek.1.GT.14
D=A
@13
M=D
@THAT
A=M
D=M
@15
M=D
@DO_GT
0;JMP
(Memory.peek.1.GT.14)
D=!D
@Memory.getNextNode.1.IfElse1
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


// label Memory.getNextNode.1.IfElse1
(Memory.getNextNode.1.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.poke.2 with 0
(Memory.poke.2)


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


// function Memory.peek.1 with 0
(Memory.peek.1)


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


// function Output.init.0 with 0
(Output.init.0)


@16384
D=A
@Output.3
M=D


// call Output.initMap.0
@5
D=A
@14
M=D
@Output.initMap.0
D=A
@13
M=D
@Output.init.0.ret.0
D=A
@CALL
0;JMP
(Output.init.0.ret.0)
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


// function Output.initMap.0 with 1
(Output.initMap.0)
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
// call Array.new.1
@6
D=A
@14
M=D
@Array.new.1
D=A
@13
M=D
@Output.initMap.0.ret.0
D=A
@CALL
0;JMP
(Output.initMap.0.ret.0)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.1
D=A
@CALL
0;JMP
(Output.initMap.0.ret.1)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.2
D=A
@CALL
0;JMP
(Output.initMap.0.ret.2)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.3
D=A
@CALL
0;JMP
(Output.initMap.0.ret.3)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.4
D=A
@CALL
0;JMP
(Output.initMap.0.ret.4)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.5
D=A
@CALL
0;JMP
(Output.initMap.0.ret.5)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.6
D=A
@CALL
0;JMP
(Output.initMap.0.ret.6)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.7
D=A
@CALL
0;JMP
(Output.initMap.0.ret.7)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.8
D=A
@CALL
0;JMP
(Output.initMap.0.ret.8)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.9
D=A
@CALL
0;JMP
(Output.initMap.0.ret.9)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.10
D=A
@CALL
0;JMP
(Output.initMap.0.ret.10)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.11
D=A
@CALL
0;JMP
(Output.initMap.0.ret.11)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.12
D=A
@CALL
0;JMP
(Output.initMap.0.ret.12)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.13
D=A
@CALL
0;JMP
(Output.initMap.0.ret.13)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.14
D=A
@CALL
0;JMP
(Output.initMap.0.ret.14)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.15
D=A
@CALL
0;JMP
(Output.initMap.0.ret.15)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.16
D=A
@CALL
0;JMP
(Output.initMap.0.ret.16)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.17
D=A
@CALL
0;JMP
(Output.initMap.0.ret.17)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.18
D=A
@CALL
0;JMP
(Output.initMap.0.ret.18)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.19
D=A
@CALL
0;JMP
(Output.initMap.0.ret.19)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.20
D=A
@CALL
0;JMP
(Output.initMap.0.ret.20)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.21
D=A
@CALL
0;JMP
(Output.initMap.0.ret.21)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.22
D=A
@CALL
0;JMP
(Output.initMap.0.ret.22)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.23
D=A
@CALL
0;JMP
(Output.initMap.0.ret.23)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.24
D=A
@CALL
0;JMP
(Output.initMap.0.ret.24)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.25
D=A
@CALL
0;JMP
(Output.initMap.0.ret.25)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.26
D=A
@CALL
0;JMP
(Output.initMap.0.ret.26)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.27
D=A
@CALL
0;JMP
(Output.initMap.0.ret.27)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.28
D=A
@CALL
0;JMP
(Output.initMap.0.ret.28)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.29
D=A
@CALL
0;JMP
(Output.initMap.0.ret.29)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.30
D=A
@CALL
0;JMP
(Output.initMap.0.ret.30)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.31
D=A
@CALL
0;JMP
(Output.initMap.0.ret.31)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.32
D=A
@CALL
0;JMP
(Output.initMap.0.ret.32)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.33
D=A
@CALL
0;JMP
(Output.initMap.0.ret.33)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.34
D=A
@CALL
0;JMP
(Output.initMap.0.ret.34)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.35
D=A
@CALL
0;JMP
(Output.initMap.0.ret.35)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.36
D=A
@CALL
0;JMP
(Output.initMap.0.ret.36)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.37
D=A
@CALL
0;JMP
(Output.initMap.0.ret.37)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.38
D=A
@CALL
0;JMP
(Output.initMap.0.ret.38)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.39
D=A
@CALL
0;JMP
(Output.initMap.0.ret.39)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.40
D=A
@CALL
0;JMP
(Output.initMap.0.ret.40)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.41
D=A
@CALL
0;JMP
(Output.initMap.0.ret.41)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.42
D=A
@CALL
0;JMP
(Output.initMap.0.ret.42)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.43
D=A
@CALL
0;JMP
(Output.initMap.0.ret.43)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.44
D=A
@CALL
0;JMP
(Output.initMap.0.ret.44)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.45
D=A
@CALL
0;JMP
(Output.initMap.0.ret.45)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.46
D=A
@CALL
0;JMP
(Output.initMap.0.ret.46)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.47
D=A
@CALL
0;JMP
(Output.initMap.0.ret.47)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.48
D=A
@CALL
0;JMP
(Output.initMap.0.ret.48)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.49
D=A
@CALL
0;JMP
(Output.initMap.0.ret.49)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.50
D=A
@CALL
0;JMP
(Output.initMap.0.ret.50)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.51
D=A
@CALL
0;JMP
(Output.initMap.0.ret.51)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.52
D=A
@CALL
0;JMP
(Output.initMap.0.ret.52)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.53
D=A
@CALL
0;JMP
(Output.initMap.0.ret.53)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.54
D=A
@CALL
0;JMP
(Output.initMap.0.ret.54)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.55
D=A
@CALL
0;JMP
(Output.initMap.0.ret.55)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.56
D=A
@CALL
0;JMP
(Output.initMap.0.ret.56)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.57
D=A
@CALL
0;JMP
(Output.initMap.0.ret.57)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.58
D=A
@CALL
0;JMP
(Output.initMap.0.ret.58)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.59
D=A
@CALL
0;JMP
(Output.initMap.0.ret.59)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.60
D=A
@CALL
0;JMP
(Output.initMap.0.ret.60)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.61
D=A
@CALL
0;JMP
(Output.initMap.0.ret.61)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.62
D=A
@CALL
0;JMP
(Output.initMap.0.ret.62)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.63
D=A
@CALL
0;JMP
(Output.initMap.0.ret.63)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.64
D=A
@CALL
0;JMP
(Output.initMap.0.ret.64)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.65
D=A
@CALL
0;JMP
(Output.initMap.0.ret.65)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.66
D=A
@CALL
0;JMP
(Output.initMap.0.ret.66)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.67
D=A
@CALL
0;JMP
(Output.initMap.0.ret.67)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.68
D=A
@CALL
0;JMP
(Output.initMap.0.ret.68)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.69
D=A
@CALL
0;JMP
(Output.initMap.0.ret.69)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.70
D=A
@CALL
0;JMP
(Output.initMap.0.ret.70)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.71
D=A
@CALL
0;JMP
(Output.initMap.0.ret.71)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.72
D=A
@CALL
0;JMP
(Output.initMap.0.ret.72)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.73
D=A
@CALL
0;JMP
(Output.initMap.0.ret.73)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.74
D=A
@CALL
0;JMP
(Output.initMap.0.ret.74)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.75
D=A
@CALL
0;JMP
(Output.initMap.0.ret.75)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.76
D=A
@CALL
0;JMP
(Output.initMap.0.ret.76)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.77
D=A
@CALL
0;JMP
(Output.initMap.0.ret.77)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.78
D=A
@CALL
0;JMP
(Output.initMap.0.ret.78)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.79
D=A
@CALL
0;JMP
(Output.initMap.0.ret.79)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.80
D=A
@CALL
0;JMP
(Output.initMap.0.ret.80)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.81
D=A
@CALL
0;JMP
(Output.initMap.0.ret.81)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.82
D=A
@CALL
0;JMP
(Output.initMap.0.ret.82)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.83
D=A
@CALL
0;JMP
(Output.initMap.0.ret.83)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.84
D=A
@CALL
0;JMP
(Output.initMap.0.ret.84)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.85
D=A
@CALL
0;JMP
(Output.initMap.0.ret.85)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.86
D=A
@CALL
0;JMP
(Output.initMap.0.ret.86)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.87
D=A
@CALL
0;JMP
(Output.initMap.0.ret.87)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.88
D=A
@CALL
0;JMP
(Output.initMap.0.ret.88)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.89
D=A
@CALL
0;JMP
(Output.initMap.0.ret.89)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.90
D=A
@CALL
0;JMP
(Output.initMap.0.ret.90)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.91
D=A
@CALL
0;JMP
(Output.initMap.0.ret.91)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.92
D=A
@CALL
0;JMP
(Output.initMap.0.ret.92)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.93
D=A
@CALL
0;JMP
(Output.initMap.0.ret.93)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.94
D=A
@CALL
0;JMP
(Output.initMap.0.ret.94)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.95
D=A
@CALL
0;JMP
(Output.initMap.0.ret.95)
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
// call Output.create.12
@17
D=A
@14
M=D
@Output.create.12
D=A
@13
M=D
@Output.initMap.0.ret.96
D=A
@CALL
0;JMP
(Output.initMap.0.ret.96)
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


// function Output.create.12 with 1
(Output.create.12)
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
// call Array.new.1
@6
D=A
@14
M=D
@Array.new.1
D=A
@13
M=D
@Output.create.12.ret.0
D=A
@CALL
0;JMP
(Output.create.12.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@ARG
A=M
D=M
@R13
M=D
@Output.0
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


// function Output.getMap.1 with 0
(Output.getMap.1)


@Output.backSpace.0.LT.0
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
(Output.backSpace.0.LT.0)
@SP
AM=M+1
A=A-1
M=D
@Output.backSpace.0.GT.1
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
(Output.backSpace.0.GT.1)
@SP
AM=M-1
D=D|M
D=!D
@Output.getMap.1.IfElse1
D;JNE


@ARG
A=M
M=0


// label Output.getMap.1.IfElse1
(Output.getMap.1.IfElse1)


@ARG
A=M
D=M
@R13
M=D
@Output.0
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


// function Output.moveCursor.2 with 0
(Output.moveCursor.2)


@ARG
A=M
D=M
@Output.1
M=D


@ARG
A=M+1
D=M
@Output.2
M=D


D=0
@SP
AM=M+1
A=A-1
M=D
// call Output.printChar.1
@6
D=A
@14
M=D
@Output.printChar.1
D=A
@13
M=D
@Output.moveCursor.2.ret.0
D=A
@CALL
0;JMP
(Output.moveCursor.2.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// call Output.backSpace.0
@5
D=A
@14
M=D
@Output.backSpace.0
D=A
@13
M=D
@Output.moveCursor.2.ret.1
D=A
@CALL
0;JMP
(Output.moveCursor.2.ret.1)
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


// function Output.printChar.1 with 4
(Output.printChar.1)
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
// call Output.getMap.1
@6
D=A
@14
M=D
@Output.getMap.1
D=A
@13
M=D
@Output.printChar.1.ret.0
D=A
@CALL
0;JMP
(Output.printChar.1.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Output.3
D=M
@SP
AM=M+1
A=A-1
M=D
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
@Output.printChar.1.ret.1
D=A
@CALL
0;JMP
(Output.printChar.1.ret.1)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
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
@Output.printChar.1.ret.2
D=A
@CALL
0;JMP
(Output.printChar.1.ret.2)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
@LCL
A=M+1
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=0


// label WHILE_START_Output.printChar.11
(WHILE_START_Output.printChar.11)


@Output.backSpace.0.LT.2
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
(Output.backSpace.0.LT.2)
@WHILE_END_Output.printChar.11
D;JNE


@Output.backSpace.0.EQ.3
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
(Output.backSpace.0.EQ.3)
D=!D
@Output.printChar.1.IfElse1
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
@Output.printChar.1.ret.3
D=A
@CALL
0;JMP
(Output.printChar.1.ret.3)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


// goto Output.printChar.1.IfElse1
@Output.printChar.1.IfElse1
0;JMP


// label Output.printChar.1.IfElse1
(Output.printChar.1.IfElse1)


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


// label Output.printChar.1.IfElse1
(Output.printChar.1.IfElse1)


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
D=D&M
@THAT
A=M
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_Output.printChar.11
@WHILE_START_Output.printChar.11
0;JMP


// label WHILE_END_Output.printChar.11
(WHILE_END_Output.printChar.11)


@Output.backSpace.0.EQ.4
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
(Output.backSpace.0.EQ.4)
D=!D
@Output.printChar.1.IfElse2
D;JNE


// call Output.println.0
@5
D=A
@14
M=D
@Output.println.0
D=A
@13
M=D
@Output.printChar.1.ret.4
D=A
@CALL
0;JMP
(Output.printChar.1.ret.4)
@SP
AM=M-1
D=M
@5
M=D


// goto Output.printChar.1.IfElse2
@Output.printChar.1.IfElse2
0;JMP


// label Output.printChar.1.IfElse2
(Output.printChar.1.IfElse2)


@Output.1
M=M+1


// label Output.printChar.1.IfElse2
(Output.printChar.1.IfElse2)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.printString.1 with 1
(Output.printString.1)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Output.printString.11
(WHILE_START_Output.printString.11)


@Output.backSpace.0.LT.5
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
// call String.length.1
@6
D=A
@14
M=D
@String.length.1
D=A
@13
M=D
@Output.printString.1.ret.0
D=A
@CALL
0;JMP
(Output.printString.1.ret.0)
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
(Output.backSpace.0.LT.5)
@WHILE_END_Output.printString.11
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
@4
M=D


@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printChar.1
@6
D=A
@14
M=D
@Output.printChar.1
D=A
@13
M=D
@Output.printString.1.ret.1
D=A
@CALL
0;JMP
(Output.printString.1.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Output.printString.11
@WHILE_START_Output.printString.11
0;JMP


// label WHILE_END_Output.printString.11
(WHILE_END_Output.printString.11)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.printInt.1 with 1
(Output.printInt.1)
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
// call String.int2String.1
@6
D=A
@14
M=D
@String.int2String.1
D=A
@13
M=D
@Output.printInt.1.ret.0
D=A
@CALL
0;JMP
(Output.printInt.1.ret.0)
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
// call Output.printString.1
@6
D=A
@14
M=D
@Output.printString.1
D=A
@13
M=D
@Output.printInt.1.ret.1
D=A
@CALL
0;JMP
(Output.printInt.1.ret.1)
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
// call String.dispose.1
@6
D=A
@14
M=D
@String.dispose.1
D=A
@13
M=D
@Output.printInt.1.ret.2
D=A
@CALL
0;JMP
(Output.printInt.1.ret.2)
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


// function Output.println.0 with 0
(Output.println.0)


@Output.1
M=0


@Output.backSpace.0.EQ.6
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
(Output.backSpace.0.EQ.6)
D=!D
@Output.println.0.IfElse1
D;JNE


@Output.2
M=0


// goto Output.println.0.IfElse1
@Output.println.0.IfElse1
0;JMP


// label Output.println.0.IfElse1
(Output.println.0.IfElse1)


@Output.2
M=M+1


// label Output.println.0.IfElse1
(Output.println.0.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.backSpace.0 with 0
(Output.backSpace.0)


@Output.backSpace.0.EQ.7
D=A
@13
M=D
@Output.1
D=M
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.0.EQ.7)
D=!D
@Output.backSpace.0.IfElse1
D;JNE


@Output.2
M=M-1


@63
D=A
@Output.1
M=D


// goto Output.backSpace.0.IfElse1
@Output.backSpace.0.IfElse1
0;JMP


// label Output.backSpace.0.IfElse1
(Output.backSpace.0.IfElse1)


@Output.1
M=M-1


// label Output.backSpace.0.IfElse1
(Output.backSpace.0.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.init.0 with 0
(Screen.init.0)


D=0
@Screen.0
M=D


@16384
D=A
@Screen.1
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.clearScreen.0 with 1
(Screen.clearScreen.0)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Screen.clearScreen.01
(WHILE_START_Screen.clearScreen.01)


@Screen.drawCircle.3.LT.0
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
(Screen.drawCircle.3.LT.0)
@WHILE_END_Screen.clearScreen.01
D;JNE


@LCL
A=M
D=M
@R13
M=D
@Screen.1
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
D=0
@SP
AM=M+1
A=A-1
M=D
// call Memory.poke.2
@7
D=A
@14
M=D
@Memory.poke.2
D=A
@13
M=D
@Screen.clearScreen.0.ret.0
D=A
@CALL
0;JMP
(Screen.clearScreen.0.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.clearScreen.01
@WHILE_START_Screen.clearScreen.01
0;JMP


// label WHILE_END_Screen.clearScreen.01
(WHILE_END_Screen.clearScreen.01)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.setColor.1 with 0
(Screen.setColor.1)


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


// function Screen.drawPixel.2 with 2
(Screen.drawPixel.2)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@Screen.1
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
@Screen.drawPixel.2.ret.0
D=A
@CALL
0;JMP
(Screen.drawPixel.2.ret.0)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
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
@Screen.drawPixel.2.ret.1
D=A
@CALL
0;JMP
(Screen.drawPixel.2.ret.1)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
@LCL
A=M
M=D


@ARG
A=M
D=M
@15
D=D&A
@SP
AM=M+1
A=A-1
M=D
// call Math.two_to_the_power_of.1
@6
D=A
@14
M=D
@Math.two_to_the_power_of.1
D=A
@13
M=D
@Screen.drawPixel.2.ret.2
D=A
@CALL
0;JMP
(Screen.drawPixel.2.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@Screen.0
D=!M
@Screen.drawPixel.2.IfElse1
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
@R13
M=D
@LCL
A=M+1
D=M
@R13
D=D|M
@THAT
A=M
M=D


// goto Screen.drawPixel.2.IfElse1
@Screen.drawPixel.2.IfElse1
0;JMP


// label Screen.drawPixel.2.IfElse1
(Screen.drawPixel.2.IfElse1)


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
@R13
M=D
@LCL
A=M+1
D=!M
@R13
D=D&M
@THAT
A=M
M=D


// label Screen.drawPixel.2.IfElse1
(Screen.drawPixel.2.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawLine.4 with 7
(Screen.drawLine.4)
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


@Screen.drawCircle.3.EQ.1
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
(Screen.drawCircle.3.EQ.1)
D=!D
@Screen.drawLine.4.IfElse1
D;JNE


@Screen.drawCircle.3.GT.2
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.2)
D=!D
@Screen.drawLine.4.IfElse2
D;JNE


@ARG
A=M+1
D=M
@SP
A=M
A=A-1
A=A-1
A=A-1
A=A-1
A=A-1
M=D


@ARG
A=M+1
A=A+1
A=A+1
D=M
@ARG
A=M+1
M=D


@LCL
D=M
@6
A=D+A
D=M
@ARG
A=M+1
A=A+1
A=A+1
M=D


// label Screen.drawLine.4.IfElse2
(Screen.drawLine.4.IfElse2)


@ARG
A=M+1
D=M
@LCL
D=M
@4
A=D+A
M=D


// label WHILE_START_Screen.drawLine.41
(WHILE_START_Screen.drawLine.41)


@Screen.drawCircle.3.GT.3
D=A
@13
M=D
@LCL
D=M
@4
A=D+A
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
(Screen.drawCircle.3.GT.3)
D=!D
@WHILE_END_Screen.drawLine.41
D;JNE


@ARG
A=M
D=M
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
// call Screen.drawPixel.2
@7
D=A
@14
M=D
@Screen.drawPixel.2
D=A
@13
M=D
@Screen.drawLine.4.ret.0
D=A
@CALL
0;JMP
(Screen.drawLine.4.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@LCL
D=M
@4
A=D+A
M=M+1


// goto WHILE_START_Screen.drawLine.41
@WHILE_START_Screen.drawLine.41
0;JMP


// label WHILE_END_Screen.drawLine.41
(WHILE_END_Screen.drawLine.41)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Screen.drawLine.4.IfElse1
(Screen.drawLine.4.IfElse1)


@Screen.drawCircle.3.EQ.4
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
(Screen.drawCircle.3.EQ.4)
D=!D
@Screen.drawLine.4.IfElse3
D;JNE


@Screen.drawCircle.3.GT.5
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.5)
D=!D
@Screen.drawLine.4.IfElse4
D;JNE


@ARG
A=M
D=M
@SP
A=M
A=A-1
A=A-1
A=A-1
A=A-1
A=A-1
A=A-1
M=D


@ARG
A=M+1
A=A+1
D=M
@ARG
A=M
M=D


@LCL
D=M
@6
A=D+A
D=M
@ARG
A=M+1
A=A+1
M=D


// label Screen.drawLine.4.IfElse4
(Screen.drawLine.4.IfElse4)


@ARG
A=M
D=M
@LCL
A=M+1
A=A+1
A=A+1
M=D


// label WHILE_START_Screen.drawLine.42
(WHILE_START_Screen.drawLine.42)


@Screen.drawCircle.3.GT.6
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
A=M+1
A=A+1
D=M
@R13
D=M-D
@15
M=D
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.6)
D=!D
@WHILE_END_Screen.drawLine.42
D;JNE


@LCL
A=M+1
A=A+1
A=A+1
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
// call Screen.drawPixel.2
@7
D=A
@14
M=D
@Screen.drawPixel.2
D=A
@13
M=D
@Screen.drawLine.4.ret.1
D=A
@CALL
0;JMP
(Screen.drawLine.4.ret.1)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_Screen.drawLine.42
@WHILE_START_Screen.drawLine.42
0;JMP


// label WHILE_END_Screen.drawLine.42
(WHILE_END_Screen.drawLine.42)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Screen.drawLine.4.IfElse3
(Screen.drawLine.4.IfElse3)


@Screen.drawCircle.3.GT.7
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.7)
D=!D
@Screen.drawLine.4.IfElse5
D;JNE


@ARG
A=M
D=M
@SP
A=M
A=A-1
A=A-1
A=A-1
A=A-1
A=A-1
A=A-1
M=D


@ARG
A=M+1
A=A+1
D=M
@ARG
A=M
M=D


@LCL
D=M
@6
A=D+A
D=M
@ARG
A=M+1
A=A+1
M=D


@ARG
A=M+1
D=M
@SP
A=M
A=A-1
A=A-1
A=A-1
A=A-1
A=A-1
M=D


@ARG
A=M+1
A=A+1
A=A+1
D=M
@ARG
A=M+1
M=D


@LCL
D=M
@6
A=D+A
D=M
@ARG
A=M+1
A=A+1
A=A+1
M=D


// label Screen.drawLine.4.IfElse5
(Screen.drawLine.4.IfElse5)


@ARG
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=D-M
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
@LCL
A=M+1
M=D


@LCL
D=M
@5
A=D+A
M=1


@Screen.drawCircle.3.LT.8
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
(Screen.drawCircle.3.LT.8)
D=!D
@Screen.drawLine.4.IfElse6
D;JNE


@LCL
A=M+1
M=-M


@LCL
D=M
@5
A=D+A
D=A
@13
M=D
D=1
@13
A=M
M=D


// label Screen.drawLine.4.IfElse6
(Screen.drawLine.4.IfElse6)


@LCL
A=M+1
A=A+1
A=A+1
M=0


@LCL
D=M
@4
A=D+A
M=0


@LCL
A=M+1
A=A+1
M=0


// label WHILE_START_Screen.drawLine.43
(WHILE_START_Screen.drawLine.43)


@Screen.drawCircle.3.GT.9
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
A=A-1
A=A-1
A=A-1
D=D-M
@15
M=D
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.9)
D=!D
@WHILE_END_Screen.drawLine.43
D;JNE


@ARG
A=M
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
D=M
@4
A=D+A
D=M
@R13
D=D+M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawPixel.2
@7
D=A
@14
M=D
@Screen.drawPixel.2
D=A
@13
M=D
@Screen.drawLine.4.ret.2
D=A
@CALL
0;JMP
(Screen.drawLine.4.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
A=A+1
D=M
A=A-1
D=D+M
@LCL
A=M+1
A=A+1
M=D


@Screen.drawCircle.3.LT.10
D=A
@13
M=D
@LCL
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=D-M
@15
M=D
@DO_LT
0;JMP
(Screen.drawCircle.3.LT.10)
@Screen.drawLine.4.IfElse7
D;JNE


@LCL
D=M
@5
A=D+A
D=M
A=A-1
D=D+M
@LCL
D=M
@4
A=D+A
M=D


@LCL
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=D-M
@LCL
A=M+1
A=A+1
M=D


// label Screen.drawLine.4.IfElse7
(Screen.drawLine.4.IfElse7)


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_Screen.drawLine.43
@WHILE_START_Screen.drawLine.43
0;JMP


// label WHILE_END_Screen.drawLine.43
(WHILE_END_Screen.drawLine.43)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawRectangle.4 with 2
(Screen.drawRectangle.4)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@Screen.drawCircle.3.GT.11
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.11)
D=!D
@Screen.drawRectangle.4.IfElse1
D;JNE


@ARG
A=M
D=M
@LCL
A=M
M=D


@ARG
A=M+1
A=A+1
D=M
@ARG
A=M
M=D


@LCL
A=M
D=M
@ARG
A=M+1
A=A+1
M=D


// label Screen.drawRectangle.4.IfElse1
(Screen.drawRectangle.4.IfElse1)


@Screen.drawCircle.3.GT.12
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.12)
D=!D
@Screen.drawRectangle.4.IfElse2
D;JNE


@ARG
A=M+1
D=M
@LCL
A=M
M=D


@ARG
A=M+1
A=A+1
A=A+1
D=M
@ARG
A=M+1
M=D


@LCL
A=M
D=M
@ARG
A=M+1
A=A+1
A=A+1
M=D


// label Screen.drawRectangle.4.IfElse2
(Screen.drawRectangle.4.IfElse2)


@ARG
A=M+1
D=M
@LCL
A=M+1
M=D


// label WHILE_START_Screen.drawRectangle.41
(WHILE_START_Screen.drawRectangle.41)


@Screen.drawCircle.3.GT.13
D=A
@13
M=D
@LCL
A=M+1
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
(Screen.drawCircle.3.GT.13)
D=!D
@WHILE_END_Screen.drawRectangle.41
D;JNE


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
@ARG
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawLine.5
@10
D=A
@14
M=D
@Screen.drawLine.5
D=A
@13
M=D
@Screen.drawRectangle.4.ret.0
D=A
@CALL
0;JMP
(Screen.drawRectangle.4.ret.0)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
M=M+1


// goto WHILE_START_Screen.drawRectangle.41
@WHILE_START_Screen.drawRectangle.41
0;JMP


// label WHILE_END_Screen.drawRectangle.41
(WHILE_END_Screen.drawRectangle.41)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawCircle.3 with 3
(Screen.drawCircle.3)
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


@Screen.drawCircle.3.GT.14
D=A
@13
M=D
@ARG
A=M+1
A=A+1
D=M
@181
D=D-A
@15
M=D
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.14)
D=!D
@Screen.drawCircle.3.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Screen.drawCircle.3.IfElse1
(Screen.drawCircle.3.IfElse1)


@ARG
A=M+1
A=A+1
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
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Screen.drawCircle.3.ret.0
D=A
@CALL
0;JMP
(Screen.drawCircle.3.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@ARG
A=M+1
A=A+1
D=-M
@LCL
A=M+1
M=D


// label WHILE_START_Screen.drawCircle.31
(WHILE_START_Screen.drawCircle.31)


@Screen.drawCircle.3.GT.15
D=A
@13
M=D
@LCL
A=M+1
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.15)
D=!D
@WHILE_END_Screen.drawCircle.31
D;JNE


@ARG
A=M+1
A=A+1
D=-M
@LCL
A=M
M=D


// label WHILE_START_Screen.drawCircle.32
(WHILE_START_Screen.drawCircle.32)


@Screen.drawCircle.3.GT.16
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
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.16)
D=!D
@WHILE_END_Screen.drawCircle.32
D;JNE


@Screen.drawCircle.3.GT.17
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
@LCL
A=M
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
@Screen.drawCircle.3.ret.1
D=A
@CALL
0;JMP
(Screen.drawCircle.3.ret.1)
@SP
AM=M-1
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
@Screen.drawCircle.3.ret.2
D=A
@CALL
0;JMP
(Screen.drawCircle.3.ret.2)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@DO_GT
0;JMP
(Screen.drawCircle.3.GT.17)
@Screen.drawCircle.3.IfElse2
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
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Screen.drawPixel.3
@8
D=A
@14
M=D
@Screen.drawPixel.3
D=A
@13
M=D
@Screen.drawCircle.3.ret.3
D=A
@CALL
0;JMP
(Screen.drawCircle.3.ret.3)
@SP
AM=M-1
D=M
@5
M=D


// label Screen.drawCircle.3.IfElse2
(Screen.drawCircle.3.IfElse2)


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.drawCircle.32
@WHILE_START_Screen.drawCircle.32
0;JMP


// label WHILE_END_Screen.drawCircle.32
(WHILE_END_Screen.drawCircle.32)


@LCL
A=M+1
M=M+1


// goto WHILE_START_Screen.drawCircle.31
@WHILE_START_Screen.drawCircle.31
0;JMP


// label WHILE_END_Screen.drawCircle.31
(WHILE_END_Screen.drawCircle.31)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.new.1 with 0
(String.new.1)


@2
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
@String.new.1.ret.0
D=A
@CALL
0;JMP
(String.new.1.ret.0)
@SP
AM=M-1
D=M
@3
M=D


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.new.1
@6
D=A
@14
M=D
@Array.new.1
D=A
@13
M=D
@String.new.1.ret.1
D=A
@CALL
0;JMP
(String.new.1.ret.1)
@SP
AM=M-1
D=M
@THIS
A=M
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


// function String.dispose.1 with 0
(String.dispose.1)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.dispose.1
@6
D=A
@14
M=D
@Array.dispose.1
D=A
@13
M=D
@String.dispose.1.ret.0
D=A
@CALL
0;JMP
(String.dispose.1.ret.0)
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


// function String.length.1 with 0
(String.length.1)


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


// function String.charAt.2 with 0
(String.charAt.2)


@ARG
A=M
D=M
@3
M=D


@ARG
A=M+1
D=M
@R13
M=D
@THIS
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


// function String.setCharAt.3 with 0
(String.setCharAt.3)


@ARG
A=M
D=M
@3
M=D


@ARG
A=M+1
D=M
@R13
M=D
@THIS
A=M
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


// function String.appendChar.2 with 1
(String.appendChar.2)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@String.setInt.2.EQ.0
D=A
@13
M=D
@THIS
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.maxLength.1
@6
D=A
@14
M=D
@Array.maxLength.1
D=A
@13
M=D
@String.appendChar.2.ret.0
D=A
@CALL
0;JMP
(String.appendChar.2.ret.0)
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
(String.setInt.2.EQ.0)
D=!D
@String.appendChar.2.IfElse1
D;JNE


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.maxLength.1
@6
D=A
@14
M=D
@Array.maxLength.1
D=A
@13
M=D
@String.appendChar.2.ret.1
D=A
@CALL
0;JMP
(String.appendChar.2.ret.1)
@2
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
@String.appendChar.2.ret.2
D=A
@CALL
0;JMP
(String.appendChar.2.ret.2)
// call Memory.realloc.2
@7
D=A
@14
M=D
@Memory.realloc.2
D=A
@13
M=D
@String.appendChar.2.ret.3
D=A
@CALL
0;JMP
(String.appendChar.2.ret.3)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@String.setInt.2.EQ.1
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
(String.setInt.2.EQ.1)
D=!D
@String.appendChar.2.IfElse2
D;JNE


@3
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label String.appendChar.2.IfElse2
(String.appendChar.2.IfElse2)


@LCL
A=M
D=M
@THIS
A=M
M=D


// label String.appendChar.2.IfElse1
(String.appendChar.2.IfElse1)


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


// function String.eraseLastChar.1 with 0
(String.eraseLastChar.1)


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


// function String.intValue.1 with 2
(String.intValue.1)
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
A=M
M=0


@LCL
A=M+1
M=0


// label WHILE_START_String.intValue.11
(WHILE_START_String.intValue.11)


@String.setInt.2.LT.2
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
(String.setInt.2.LT.2)
@WHILE_END_String.intValue.11
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
@String.intValue.1.ret.0
D=A
@CALL
0;JMP
(String.intValue.1.ret.0)
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


// goto WHILE_START_String.intValue.11
@WHILE_START_String.intValue.11
0;JMP


// label WHILE_END_String.intValue.11
(WHILE_END_String.intValue.11)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.setInt.2 with 1
(String.setInt.2)
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


// label WHILE_START_String.setInt.21
(WHILE_START_String.setInt.21)


D=0
@WHILE_END_String.setInt.21
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
@String.setInt.2.ret.0
D=A
@CALL
0;JMP
(String.setInt.2.ret.0)
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
@String.setInt.2.ret.1
D=A
@CALL
0;JMP
(String.setInt.2.ret.1)
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
A=M
D=M
@48
D=D+A
@SP
AM=M+1
A=A-1
M=D
@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call String.appendChar.2
@7
D=A
@14
M=D
@String.appendChar.2
D=A
@13
M=D
@String.setInt.2.ret.2
D=A
@CALL
0;JMP
(String.setInt.2.ret.2)
@SP
AM=M-1
D=M
@5
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
@String.setInt.2.ret.3
D=A
@CALL
0;JMP
(String.setInt.2.ret.3)
@SP
AM=M-1
D=M
@ARG
A=M+1
M=D


@String.setInt.2.EQ.3
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
(String.setInt.2.EQ.3)
D=!D
@String.setInt.2.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label String.setInt.2.IfElse1
(String.setInt.2.IfElse1)


// goto WHILE_START_String.setInt.21
@WHILE_START_String.setInt.21
0;JMP


// label WHILE_END_String.setInt.21
(WHILE_END_String.setInt.21)


// function Sys.init.0 with 0
(Sys.init.0)


// call Memory.init.0
@5
D=A
@14
M=D
@Memory.init.0
D=A
@13
M=D
@Sys.init.0.ret.0
D=A
@CALL
0;JMP
(Sys.init.0.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// call Math.init.0
@5
D=A
@14
M=D
@Math.init.0
D=A
@13
M=D
@Sys.init.0.ret.1
D=A
@CALL
0;JMP
(Sys.init.0.ret.1)
@SP
AM=M-1
D=M
@5
M=D


// call Screen.init.0
@5
D=A
@14
M=D
@Screen.init.0
D=A
@13
M=D
@Sys.init.0.ret.2
D=A
@CALL
0;JMP
(Sys.init.0.ret.2)
@SP
AM=M-1
D=M
@5
M=D


// call Output.init.0
@5
D=A
@14
M=D
@Output.init.0
D=A
@13
M=D
@Sys.init.0.ret.3
D=A
@CALL
0;JMP
(Sys.init.0.ret.3)
@SP
AM=M-1
D=M
@5
M=D


// call Keyboard.init.0
@5
D=A
@14
M=D
@Keyboard.init.0
D=A
@13
M=D
@Sys.init.0.ret.4
D=A
@CALL
0;JMP
(Sys.init.0.ret.4)
@SP
AM=M-1
D=M
@5
M=D


// call Main.main.0
@5
D=A
@14
M=D
@Main.main.0
D=A
@13
M=D
@Sys.init.0.ret.5
D=A
@CALL
0;JMP
(Sys.init.0.ret.5)
@SP
AM=M-1
D=M
@5
M=D


// call Sys.halt.0
@5
D=A
@14
M=D
@Sys.halt.0
D=A
@13
M=D
@Sys.init.0.ret.6
D=A
@CALL
0;JMP
(Sys.init.0.ret.6)
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


// function Sys.halt.0 with 0
(Sys.halt.0)


// label WHILE_START_Sys.halt.01
(WHILE_START_Sys.halt.01)


D=0
@WHILE_END_Sys.halt.01
D;JNE


// goto WHILE_START_Sys.halt.01
@WHILE_START_Sys.halt.01
0;JMP


// label WHILE_END_Sys.halt.01
(WHILE_END_Sys.halt.01)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Sys.wait.1 with 1
(Sys.wait.1)
@SP
AM=M+1
A=A-1
M=0


// label WHILE_START_Sys.wait.11
(WHILE_START_Sys.wait.11)


@Sys.error.1.GT.0
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
(Sys.error.1.GT.0)
@WHILE_END_Sys.wait.11
D;JNE


@ARG
A=M
M=M-1


@100
D=A
@LCL
A=M
M=D


// label WHILE_START_Sys.wait.12
(WHILE_START_Sys.wait.12)


@Sys.error.1.GT.1
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
(Sys.error.1.GT.1)
@WHILE_END_Sys.wait.12
D;JNE


@LCL
A=M
M=M-1


// goto WHILE_START_Sys.wait.12
@WHILE_START_Sys.wait.12
0;JMP


// label WHILE_END_Sys.wait.12
(WHILE_END_Sys.wait.12)


// goto WHILE_START_Sys.wait.11
@WHILE_START_Sys.wait.11
0;JMP


// label WHILE_END_Sys.wait.11
(WHILE_END_Sys.wait.11)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Sys.error.1 with 0
(Sys.error.1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Output.printInt.1
@6
D=A
@14
M=D
@Output.printInt.1
D=A
@13
M=D
@Sys.error.1.ret.0
D=A
@CALL
0;JMP
(Sys.error.1.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// call Output.println.0
@5
D=A
@14
M=D
@Output.println.0
D=A
@13
M=D
@Sys.error.1.ret.1
D=A
@CALL
0;JMP
(Sys.error.1.ret.1)
@SP
AM=M-1
D=M
@5
M=D


// call Sys.halt.0
@5
D=A
@14
M=D
@Sys.halt.0
D=A
@13
M=D
@Sys.error.1.ret.2
D=A
@CALL
0;JMP
(Sys.error.1.ret.2)
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


