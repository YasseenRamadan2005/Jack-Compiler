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
// function Main.main with 5
(Main.main)
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


@17000
D=A
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
@10
D=A
@THAT
A=M
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
@333
D=A
@SP
AM=M+1
A=A-1
M=D
// call Memory.poke
@7
D=A
@14
M=D
@Memory.poke
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@11
D=A
@THAT
A=M
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
// call Memory.peek
@6
D=A
@14
M=D
@Memory.peek
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
@LCL
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@2
D=D+A
@4
M=D
@LCL
A=M
D=M+1
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@12
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@20
D=A
@THAT
A=M
M=D


@20
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
@Main.main.ret.2
D=A
@CALL
0;JMP
(Main.main.ret.2)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@LCL
D=M
@4
A=D+A
D=M
@3
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
D=M
@4
A=D+A
D=M
@4
M=D
@21
D=A
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
@20
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkRange
@7
D=A
@14
M=D
@Main.checkRange
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@22
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@30
D=A
@THAT
A=M
M=D


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
@Main.main.ret.4
D=A
@CALL
0;JMP
(Main.main.ret.4)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
D=D+A
@4
M=D
@LCL
A=M+1
A=A+1
D=M
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@31
D=A
@THAT
A=M
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
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkRange
@7
D=A
@14
M=D
@Main.checkRange
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@32
D=A
@THAT
A=M
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
D=A
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
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkOverlap
@9
D=A
@14
M=D
@Main.checkOverlap
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@33
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@40
D=A
@THAT
A=M
M=D


@500
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
@Main.main.ret.7
D=A
@CALL
0;JMP
(Main.main.ret.7)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
A=A+1
M=D


@LCL
D=M
@4
A=D+A
D=M
@5
D=D+A
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
D=M
@4
M=D
@41
D=A
@THAT
A=M
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
@500
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkRange
@7
D=A
@14
M=D
@Main.checkRange
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@42
D=A
@THAT
A=M
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
@500
D=A
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
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkOverlap
@9
D=A
@14
M=D
@Main.checkOverlap
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@43
D=A
@THAT
A=M
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
@500
D=A
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
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkOverlap
@9
D=A
@14
M=D
@Main.checkOverlap
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@44
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@50
D=A
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
// call Memory.deAlloc
@6
D=A
@14
M=D
@Memory.deAlloc
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@51
D=A
@THAT
A=M
M=D


@LCL
A=M+1
A=A+1
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@52
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@60
D=A
@THAT
A=M
M=D


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
@Main.main.ret.13
D=A
@CALL
0;JMP
(Main.main.ret.13)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@LCL
D=M
@4
A=D+A
D=M
@6
D=D+A
@4
M=D
@LCL
A=M+1
A=A+1
D=M
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@61
D=A
@THAT
A=M
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
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkRange
@7
D=A
@14
M=D
@Main.checkRange
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@62
D=A
@THAT
A=M
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
@500
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkOverlap
@9
D=A
@14
M=D
@Main.checkOverlap
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@63
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@70
D=A
@THAT
A=M
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
// call Memory.deAlloc
@6
D=A
@14
M=D
@Memory.deAlloc
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@71
D=A
@THAT
A=M
M=D


@LCL
A=M+1
A=A+1
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


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@72
D=A
@THAT
A=M
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@70
D=A
@THAT
A=M
M=D


@8000
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
@Main.main.ret.18
D=A
@CALL
0;JMP
(Main.main.ret.18)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@LCL
D=M
@4
A=D+A
D=M
@7
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
D=M
@4
A=D+A
D=M
@4
M=D
@71
D=A
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
@8000
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkRange
@7
D=A
@14
M=D
@Main.checkRange
D=A
@13
M=D
@Main.main.ret.19
D=A
@CALL
0;JMP
(Main.main.ret.19)
@SP
AM=M-1
D=M
@5
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@72
D=A
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
// call Memory.deAlloc
@6
D=A
@14
M=D
@Memory.deAlloc
D=A
@13
M=D
@Main.main.ret.20
D=A
@CALL
0;JMP
(Main.main.ret.20)
@SP
AM=M-1
D=M
@5
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@73
D=A
@THAT
A=M
M=D


@7000
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
@Main.main.ret.21
D=A
@CALL
0;JMP
(Main.main.ret.21)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@74
D=A
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
@7000
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.checkRange
@7
D=A
@14
M=D
@Main.checkRange
D=A
@13
M=D
@Main.main.ret.22
D=A
@CALL
0;JMP
(Main.main.ret.22)
@SP
AM=M-1
D=M
@5
M=D


@LCL
D=M
@4
A=D+A
D=M
@4
M=D
@75
D=A
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
// call Memory.deAlloc
@6
D=A
@14
M=D
@Memory.deAlloc
D=A
@13
M=D
@Main.main.ret.23
D=A
@CALL
0;JMP
(Main.main.ret.23)
@SP
AM=M-1
D=M
@5
M=D


@LCL
D=M
@4
A=D+A
D=M
@8
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
D=M
@4
A=D+A
D=M
@4
M=D
@100
D=A
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


// function Main.checkRange with 1
(Main.checkRange)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M+1
D=M
A=A-1
D=D+M
D=M-1
@LCL
A=M
M=D


@Main.checkOverlap.EQ.2
D=A
@13
M=D
@Main.checkOverlap.LT.3
D=A
@13
M=D
@ARG
A=M
D=M
@2048
D=D-A
@15
M=D
@DO_LT
0;JMP
(Main.checkOverlap.LT.3)
@SP
AM=M+1
A=A-1
M=D
@Main.checkOverlap.GT.4
D=A
@13
M=D
@LCL
A=M
D=M
@16383
D=D-A
@15
M=D
@DO_GT
0;JMP
(Main.checkOverlap.GT.4)
@SP
AM=M-1
D=D|M
@15
M=D
@DO_EQ
0;JMP
(Main.checkOverlap.EQ.2)
@Main.checkRange.IfElse1
D;JNE


// call Sys.halt
@5
D=A
@14
M=D
@Sys.halt
D=A
@13
M=D
@Main.checkRange.ret.0
D=A
@CALL
0;JMP
(Main.checkRange.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// goto Main.checkRange.IfElseEND1
@Main.checkRange.IfElseEND1
0;JMP


// label Main.checkRange.IfElse1
(Main.checkRange.IfElse1)


// label Main.checkRange.IfElseEND1
(Main.checkRange.IfElseEND1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Main.checkOverlap with 2
(Main.checkOverlap)
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
A=A-1
D=D+M
D=M-1
@LCL
A=M
M=D


@ARG
A=M+1
A=A+1
A=A+1
D=M
A=A-1
D=D+M
D=M-1
@LCL
A=M+1
M=D


@Main.checkOverlap.EQ.7
D=A
@13
M=D
@Main.checkOverlap.GT.8
D=A
@13
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
@15
M=D
@DO_GT
0;JMP
(Main.checkOverlap.GT.8)
@SP
AM=M+1
A=A-1
M=D
@Main.checkOverlap.LT.9
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
(Main.checkOverlap.LT.9)
@SP
AM=M-1
D=D|M
D=!D
@15
M=D
@DO_EQ
0;JMP
(Main.checkOverlap.EQ.7)
@Main.checkOverlap.IfElse1
D;JNE


// call Sys.halt
@5
D=A
@14
M=D
@Sys.halt
D=A
@13
M=D
@Main.checkOverlap.ret.0
D=A
@CALL
0;JMP
(Main.checkOverlap.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// goto Main.checkOverlap.IfElseEND1
@Main.checkOverlap.IfElseEND1
0;JMP


// label Main.checkOverlap.IfElse1
(Main.checkOverlap.IfElse1)


// label Main.checkOverlap.IfElseEND1
(Main.checkOverlap.IfElseEND1)


D=0
@SP
AM=M+1
A=A-1
M=D


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
@14423
D=A
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
@Memory.peek.LT.8
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
(Memory.peek.LT.8)
D=!D
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


