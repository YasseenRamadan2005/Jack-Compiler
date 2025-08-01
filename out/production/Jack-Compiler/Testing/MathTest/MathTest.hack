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
@Math.1
M=D


@Math.1
D=M
@4
M=D


@THAT
A=M
M=1


@Math.1
D=M+1
@4
M=D


@2
D=A
@THAT
A=M
M=D


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.1
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


@Math.abs.1.EQ.1
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
(Math.abs.1.EQ.1)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.1.GT.2
D=A
@13
M=D
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
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
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
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
@15
M=D
@DO_GT
0;JMP
(Math.abs.1.GT.2)
@SP
AM=M-1
D=D|M
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


@Math.abs.1.EQ.3
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
(Math.abs.1.EQ.3)
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


@Math.abs.1.LT.4
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
(Math.abs.1.LT.4)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.1.LT.5
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
(Math.abs.1.LT.5)
@SP
AM=M-1
D=D&M
D=!D
@Math.divide.2.IfElse3
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
D=A
@13
M=D
@Math.divide.2.ret.2
D=A
@CALL
0;JMP
(Math.divide.2.ret.2)
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
D=A
@13
M=D
@Math.divide.2.ret.3
D=A
@CALL
0;JMP
(Math.divide.2.ret.3)
// call Math.divide.2
@7
D=A
@14
M=D
@Math.divide.2
D=A
@13
M=D
@Math.divide.2.ret.4
D=A
@CALL
0;JMP
(Math.divide.2.ret.4)


@RETURN
0;JMP


// goto Math.divide.2.IfElse3
@Math.divide.2.IfElse3
0;JMP


// label Math.divide.2.IfElse3
(Math.divide.2.IfElse3)


@Math.abs.1.LT.6
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
(Math.abs.1.LT.6)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.1.LT.7
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
(Math.abs.1.LT.7)
@SP
AM=M-1
D=D|M
D=!D
@Math.divide.2.IfElse4
D;JNE


@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
D=A
@13
M=D
@Math.divide.2.ret.5
D=A
@CALL
0;JMP
(Math.divide.2.ret.5)
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
D=A
@13
M=D
@Math.divide.2.ret.6
D=A
@CALL
0;JMP
(Math.divide.2.ret.6)
// call Math.divide.2
@7
D=A
@14
M=D
@Math.divide.2
D=A
@13
M=D
@Math.divide.2.ret.7
D=A
@CALL
0;JMP
(Math.divide.2.ret.7)
@SP
A=M-1
M=-D


@RETURN
0;JMP


// label Math.divide.2.IfElse4
(Math.divide.2.IfElse4)


// label Math.divide.2.IfElse3
(Math.divide.2.IfElse3)


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
@Math.divide.2.ret.8
D=A
@CALL
0;JMP
(Math.divide.2.ret.8)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Math.abs.1.LT.8
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
@Math.divide.2.ret.9
D=A
@CALL
0;JMP
(Math.divide.2.ret.9)
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
(Math.abs.1.LT.8)
D=!D
@Math.divide.2.IfElse5
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


// label Math.divide.2.IfElse5
(Math.divide.2.IfElse5)


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


// function Math.mod.2 with 0
(Math.mod.2)


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
// call Math.divide.2
@7
D=A
@14
M=D
@Math.divide.2
D=A
@13
M=D
@Math.mod.2.ret.0
D=A
@CALL
0;JMP
(Math.mod.2.ret.0)
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
@Math.mod.2.ret.1
D=A
@CALL
0;JMP
(Math.mod.2.ret.1)
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


// function Math.sqrt.1 with 4
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


// label WHILE_START_Math.sqrt.11
(WHILE_START_Math.sqrt.11)


@Math.abs.1.LT.9
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
(Math.abs.1.LT.9)
D=!D
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
@LCL
A=M+1
A=A+1
A=A+1
M=D


@Math.abs.1.GT.10
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
(Math.abs.1.GT.10)
D=!D
@SP
AM=M+1
A=A-1
M=D
@Math.abs.1.GT.11
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
(Math.abs.1.GT.11)
@SP
AM=M-1
D=D&M
D=!D
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


@Math.abs.1.GT.12
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
(Math.abs.1.GT.12)
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


@Math.abs.1.LT.13
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
(Math.abs.1.LT.13)
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
// call Math.max.2
@7
D=A
@14
M=D
@Math.max.2
D=A
@13
M=D
@Math.abs.1.ret.0
D=A
@CALL
0;JMP
(Math.abs.1.ret.0)


@RETURN
0;JMP


// function Main.main.0 with 1
(Main.main.0)
@SP
AM=M+1
A=A-1
M=0


@8000
D=A
@LCL
A=M
M=D


@LCL
A=M
D=M
@4
M=D


@2
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
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Main.main.0.ret.0
D=A
@CALL
0;JMP
(Main.main.0.ret.0)
@SP
AM=M-1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M+1
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
@30
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Main.main.0.ret.1
D=A
@CALL
0;JMP
(Main.main.0.ret.1)
@SP
AM=M-1
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


@LCL
A=M
D=M+1
@4
M=D


@THAT
A=M
D=M
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
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Main.main.0.ret.2
D=A
@CALL
0;JMP
(Main.main.0.ret.2)
@SP
AM=M-1
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


D=1
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
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Main.main.0.ret.3
D=A
@CALL
0;JMP
(Main.main.0.ret.3)
@SP
AM=M-1
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
@SP
AM=M+1
A=A-1
M=D
D=0
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
@Main.main.0.ret.4
D=A
@CALL
0;JMP
(Main.main.0.ret.4)
@SP
AM=M-1
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


@9
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
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Main.main.0.ret.5
D=A
@CALL
0;JMP
(Main.main.0.ret.5)
@SP
AM=M-1
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


@18000
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D
@6
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
@Main.main.0.ret.6
D=A
@CALL
0;JMP
(Main.main.0.ret.6)
@SP
AM=M-1
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


@32766
D=A
@SP
AM=M+1
A=A-1
M=D
@32767
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D
// call Math.divide
@7
D=A
@14
M=D
@Math.divide
D=A
@13
M=D
@Main.main.0.ret.7
D=A
@CALL
0;JMP
(Main.main.0.ret.7)
@SP
AM=M-1
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


@9
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.sqrt.1
@6
D=A
@14
M=D
@Math.sqrt.1
D=A
@13
M=D
@Main.main.0.ret.8
D=A
@CALL
0;JMP
(Main.main.0.ret.8)
@SP
AM=M-1
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


@32767
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.sqrt.1
@6
D=A
@14
M=D
@Math.sqrt.1
D=A
@13
M=D
@Main.main.0.ret.9
D=A
@CALL
0;JMP
(Main.main.0.ret.9)
@SP
AM=M-1
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


@345
D=A
@SP
AM=M+1
A=A-1
M=D
@123
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.min.2
@7
D=A
@14
M=D
@Math.min.2
D=A
@13
M=D
@Main.main.0.ret.10
D=A
@CALL
0;JMP
(Main.main.0.ret.10)
@SP
AM=M-1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@11
D=D+A
@4
M=D


@123
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
@SP
A=M-1
M=-D
// call Math.max.2
@7
D=A
@14
M=D
@Math.max.2
D=A
@13
M=D
@Main.main.0.ret.11
D=A
@CALL
0;JMP
(Main.main.0.ret.11)
@SP
AM=M-1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@12
D=D+A
@4
M=D


@27
D=A
@SP
AM=M+1
A=A-1
M=D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
D=A
@13
M=D
@Main.main.0.ret.12
D=A
@CALL
0;JMP
(Main.main.0.ret.12)
@SP
AM=M-1
D=M
@THAT
A=M
M=D


@LCL
A=M
D=M
@13
D=D+A
@4
M=D


@32767
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D
// call Math.abs.1
@6
D=A
@14
M=D
@Math.abs.1
D=A
@13
M=D
@Main.main.0.ret.13
D=A
@CALL
0;JMP
(Main.main.0.ret.13)
@SP
AM=M-1
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


