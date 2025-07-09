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


