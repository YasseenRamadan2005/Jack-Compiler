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
// call Sys.init
@5
D=A
@14
M=D
@Sys.init
D=A
@13
M=D
@global.ret.0
D=A
@CALL
0;JMP
(global.ret.0)
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
@Main.1
M=D


@Main.1
D=M
@4
M=D


@THAT
A=M
M=0


@Main.1
D=M+1
@4
M=D


@2
D=A
@THAT
A=M
M=D


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


@Main.1
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


// label Math.bit.2.IfEnd1
(Math.bit.2.IfEnd1)


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


// label Math.multiply.2.IfEnd1
(Math.multiply.2.IfEnd1)


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


// label Math.divide.2.IfEnd1
(Math.divide.2.IfEnd1)


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


// label Math.divide.2.IfEnd2
(Math.divide.2.IfEnd2)


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


// label Math.divide.2.IfEnd3
(Math.divide.2.IfEnd3)


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


// label Math.sqrt.1.IfEnd1
(Math.sqrt.1.IfEnd1)


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


// label Math.max.2.IfEnd1
(Math.max.2.IfEnd1)


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


// label Math.min.2.IfEnd1
(Math.min.2.IfEnd1)


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


// label Math.abs.1.IfEnd1
(Math.abs.1.IfEnd1)


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


