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
// function Main.main with 2
(Main.main)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


D=0
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
@Main.main.ret.0
D=A
@CALL
0;JMP
(Main.main.ret.0)
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
// call String.dispose
@6
D=A
@14
M=D
@String.dispose
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


@6
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
@Main.main.ret.2
D=A
@CALL
0;JMP
(Main.main.ret.2)
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
@97
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
@Main.main.ret.3
D=A
@CALL
0;JMP
(Main.main.ret.3)
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
@98
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
@Main.main.ret.4
D=A
@CALL
0;JMP
(Main.main.ret.4)
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
@99
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
@Main.main.ret.5
D=A
@CALL
0;JMP
(Main.main.ret.5)
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
@100
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
@Main.main.ret.6
D=A
@CALL
0;JMP
(Main.main.ret.6)
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
@101
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
@Main.main.ret.7
D=A
@CALL
0;JMP
(Main.main.ret.7)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@16
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
@Main.main.ret.8
D=A
@CALL
0;JMP
(Main.main.ret.8)
@110
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
@Main.main.ret.9
D=A
@CALL
0;JMP
(Main.main.ret.9)
@101
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
@Main.main.ret.10
D=A
@CALL
0;JMP
(Main.main.ret.10)
@119
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
@Main.main.ret.11
D=A
@CALL
0;JMP
(Main.main.ret.11)
@44
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
@Main.main.ret.12
D=A
@CALL
0;JMP
(Main.main.ret.12)
@97
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
@Main.main.ret.13
D=A
@CALL
0;JMP
(Main.main.ret.13)
@112
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
@Main.main.ret.14
D=A
@CALL
0;JMP
(Main.main.ret.14)
@112
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
@Main.main.ret.15
D=A
@CALL
0;JMP
(Main.main.ret.15)
@101
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
@Main.main.ret.16
D=A
@CALL
0;JMP
(Main.main.ret.16)
@110
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
@Main.main.ret.17
D=A
@CALL
0;JMP
(Main.main.ret.17)
@100
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
@Main.main.ret.18
D=A
@CALL
0;JMP
(Main.main.ret.18)
@67
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
@Main.main.ret.19
D=A
@CALL
0;JMP
(Main.main.ret.19)
@104
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
@Main.main.ret.20
D=A
@CALL
0;JMP
(Main.main.ret.20)
@97
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
@Main.main.ret.21
D=A
@CALL
0;JMP
(Main.main.ret.21)
@114
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
@Main.main.ret.22
D=A
@CALL
0;JMP
(Main.main.ret.22)
@58
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
@Main.main.ret.23
D=A
@CALL
0;JMP
(Main.main.ret.23)
@32
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
@Main.main.ret.24
D=A
@CALL
0;JMP
(Main.main.ret.24)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.25
D=A
@CALL
0;JMP
(Main.main.ret.25)
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
@Main.main.ret.26
D=A
@CALL
0;JMP
(Main.main.ret.26)
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
@Main.main.ret.27
D=A
@CALL
0;JMP
(Main.main.ret.27)
@SP
AM=M-1
D=M
@5
M=D


@6
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
@Main.main.ret.28
D=A
@CALL
0;JMP
(Main.main.ret.28)
@SP
AM=M-1
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
@12345
D=A
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
@Main.main.ret.29
D=A
@CALL
0;JMP
(Main.main.ret.29)
@SP
AM=M-1
D=M
@5
M=D


@8
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
@Main.main.ret.30
D=A
@CALL
0;JMP
(Main.main.ret.30)
@115
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
@Main.main.ret.31
D=A
@CALL
0;JMP
(Main.main.ret.31)
@101
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
@Main.main.ret.32
D=A
@CALL
0;JMP
(Main.main.ret.32)
@116
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
@Main.main.ret.33
D=A
@CALL
0;JMP
(Main.main.ret.33)
@73
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
@Main.main.ret.34
D=A
@CALL
0;JMP
(Main.main.ret.34)
@110
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
@Main.main.ret.35
D=A
@CALL
0;JMP
(Main.main.ret.35)
@116
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
@Main.main.ret.36
D=A
@CALL
0;JMP
(Main.main.ret.36)
@58
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
@Main.main.ret.37
D=A
@CALL
0;JMP
(Main.main.ret.37)
@32
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
@Main.main.ret.38
D=A
@CALL
0;JMP
(Main.main.ret.38)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.39
D=A
@CALL
0;JMP
(Main.main.ret.39)
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
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.40
D=A
@CALL
0;JMP
(Main.main.ret.40)
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
@Main.main.ret.41
D=A
@CALL
0;JMP
(Main.main.ret.41)
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
@32767
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=-D
// call String.setInt
@7
D=A
@14
M=D
@String.setInt
D=A
@13
M=D
@Main.main.ret.42
D=A
@CALL
0;JMP
(Main.main.ret.42)
@SP
AM=M-1
D=M
@5
M=D


@8
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
@Main.main.ret.43
D=A
@CALL
0;JMP
(Main.main.ret.43)
@115
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
@Main.main.ret.44
D=A
@CALL
0;JMP
(Main.main.ret.44)
@101
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
@Main.main.ret.45
D=A
@CALL
0;JMP
(Main.main.ret.45)
@116
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
@Main.main.ret.46
D=A
@CALL
0;JMP
(Main.main.ret.46)
@73
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
@Main.main.ret.47
D=A
@CALL
0;JMP
(Main.main.ret.47)
@110
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
@Main.main.ret.48
D=A
@CALL
0;JMP
(Main.main.ret.48)
@116
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
@Main.main.ret.49
D=A
@CALL
0;JMP
(Main.main.ret.49)
@58
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
@Main.main.ret.50
D=A
@CALL
0;JMP
(Main.main.ret.50)
@32
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
@Main.main.ret.51
D=A
@CALL
0;JMP
(Main.main.ret.51)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.52
D=A
@CALL
0;JMP
(Main.main.ret.52)
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
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.53
D=A
@CALL
0;JMP
(Main.main.ret.53)
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
@Main.main.ret.54
D=A
@CALL
0;JMP
(Main.main.ret.54)
@SP
AM=M-1
D=M
@5
M=D


@8
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
@Main.main.ret.55
D=A
@CALL
0;JMP
(Main.main.ret.55)
@108
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
@Main.main.ret.56
D=A
@CALL
0;JMP
(Main.main.ret.56)
@101
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
@Main.main.ret.57
D=A
@CALL
0;JMP
(Main.main.ret.57)
@110
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
@Main.main.ret.58
D=A
@CALL
0;JMP
(Main.main.ret.58)
@103
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
@Main.main.ret.59
D=A
@CALL
0;JMP
(Main.main.ret.59)
@116
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
@Main.main.ret.60
D=A
@CALL
0;JMP
(Main.main.ret.60)
@104
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
@Main.main.ret.61
D=A
@CALL
0;JMP
(Main.main.ret.61)
@58
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
@Main.main.ret.62
D=A
@CALL
0;JMP
(Main.main.ret.62)
@32
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
@Main.main.ret.63
D=A
@CALL
0;JMP
(Main.main.ret.63)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.64
D=A
@CALL
0;JMP
(Main.main.ret.64)
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
// call String.length
@6
D=A
@14
M=D
@String.length
D=A
@13
M=D
@Main.main.ret.65
D=A
@CALL
0;JMP
(Main.main.ret.65)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.66
D=A
@CALL
0;JMP
(Main.main.ret.66)
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
@Main.main.ret.67
D=A
@CALL
0;JMP
(Main.main.ret.67)
@SP
AM=M-1
D=M
@5
M=D


@11
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
@Main.main.ret.68
D=A
@CALL
0;JMP
(Main.main.ret.68)
@99
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
@Main.main.ret.69
D=A
@CALL
0;JMP
(Main.main.ret.69)
@104
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
@Main.main.ret.70
D=A
@CALL
0;JMP
(Main.main.ret.70)
@97
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
@Main.main.ret.71
D=A
@CALL
0;JMP
(Main.main.ret.71)
@114
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
@Main.main.ret.72
D=A
@CALL
0;JMP
(Main.main.ret.72)
@65
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
@Main.main.ret.73
D=A
@CALL
0;JMP
(Main.main.ret.73)
@116
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
@Main.main.ret.74
D=A
@CALL
0;JMP
(Main.main.ret.74)
@91
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
@Main.main.ret.75
D=A
@CALL
0;JMP
(Main.main.ret.75)
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
@Main.main.ret.76
D=A
@CALL
0;JMP
(Main.main.ret.76)
@93
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
@Main.main.ret.77
D=A
@CALL
0;JMP
(Main.main.ret.77)
@58
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
@Main.main.ret.78
D=A
@CALL
0;JMP
(Main.main.ret.78)
@32
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
@Main.main.ret.79
D=A
@CALL
0;JMP
(Main.main.ret.79)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.80
D=A
@CALL
0;JMP
(Main.main.ret.80)
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
@2
D=A
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
@Main.main.ret.81
D=A
@CALL
0;JMP
(Main.main.ret.81)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.82
D=A
@CALL
0;JMP
(Main.main.ret.82)
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
@Main.main.ret.83
D=A
@CALL
0;JMP
(Main.main.ret.83)
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
@2
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
// call String.setCharAt
@8
D=A
@14
M=D
@String.setCharAt
D=A
@13
M=D
@Main.main.ret.84
D=A
@CALL
0;JMP
(Main.main.ret.84)
@SP
AM=M-1
D=M
@5
M=D


@18
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
@Main.main.ret.85
D=A
@CALL
0;JMP
(Main.main.ret.85)
@115
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
@Main.main.ret.86
D=A
@CALL
0;JMP
(Main.main.ret.86)
@101
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
@Main.main.ret.87
D=A
@CALL
0;JMP
(Main.main.ret.87)
@116
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
@Main.main.ret.88
D=A
@CALL
0;JMP
(Main.main.ret.88)
@67
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
@Main.main.ret.89
D=A
@CALL
0;JMP
(Main.main.ret.89)
@104
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
@Main.main.ret.90
D=A
@CALL
0;JMP
(Main.main.ret.90)
@97
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
@Main.main.ret.91
D=A
@CALL
0;JMP
(Main.main.ret.91)
@114
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
@Main.main.ret.92
D=A
@CALL
0;JMP
(Main.main.ret.92)
@65
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
@Main.main.ret.93
D=A
@CALL
0;JMP
(Main.main.ret.93)
@116
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
@Main.main.ret.94
D=A
@CALL
0;JMP
(Main.main.ret.94)
@40
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
@Main.main.ret.95
D=A
@CALL
0;JMP
(Main.main.ret.95)
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
@Main.main.ret.96
D=A
@CALL
0;JMP
(Main.main.ret.96)
@44
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
@Main.main.ret.97
D=A
@CALL
0;JMP
(Main.main.ret.97)
@39
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
@Main.main.ret.98
D=A
@CALL
0;JMP
(Main.main.ret.98)
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
@Main.main.ret.99
D=A
@CALL
0;JMP
(Main.main.ret.99)
@39
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
@Main.main.ret.100
D=A
@CALL
0;JMP
(Main.main.ret.100)
@41
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
@Main.main.ret.101
D=A
@CALL
0;JMP
(Main.main.ret.101)
@58
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
@Main.main.ret.102
D=A
@CALL
0;JMP
(Main.main.ret.102)
@32
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
@Main.main.ret.103
D=A
@CALL
0;JMP
(Main.main.ret.103)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.104
D=A
@CALL
0;JMP
(Main.main.ret.104)
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
@Main.main.ret.105
D=A
@CALL
0;JMP
(Main.main.ret.105)
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
@Main.main.ret.106
D=A
@CALL
0;JMP
(Main.main.ret.106)
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
// call String.eraseLastChar
@6
D=A
@14
M=D
@String.eraseLastChar
D=A
@13
M=D
@Main.main.ret.107
D=A
@CALL
0;JMP
(Main.main.ret.107)
@SP
AM=M-1
D=M
@5
M=D


@15
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
@Main.main.ret.108
D=A
@CALL
0;JMP
(Main.main.ret.108)
@101
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
@Main.main.ret.109
D=A
@CALL
0;JMP
(Main.main.ret.109)
@114
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
@Main.main.ret.110
D=A
@CALL
0;JMP
(Main.main.ret.110)
@97
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
@Main.main.ret.111
D=A
@CALL
0;JMP
(Main.main.ret.111)
@115
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
@Main.main.ret.112
D=A
@CALL
0;JMP
(Main.main.ret.112)
@101
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
@Main.main.ret.113
D=A
@CALL
0;JMP
(Main.main.ret.113)
@76
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
@Main.main.ret.114
D=A
@CALL
0;JMP
(Main.main.ret.114)
@97
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
@Main.main.ret.115
D=A
@CALL
0;JMP
(Main.main.ret.115)
@115
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
@Main.main.ret.116
D=A
@CALL
0;JMP
(Main.main.ret.116)
@116
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
@Main.main.ret.117
D=A
@CALL
0;JMP
(Main.main.ret.117)
@67
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
@Main.main.ret.118
D=A
@CALL
0;JMP
(Main.main.ret.118)
@104
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
@Main.main.ret.119
D=A
@CALL
0;JMP
(Main.main.ret.119)
@97
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
@Main.main.ret.120
D=A
@CALL
0;JMP
(Main.main.ret.120)
@114
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
@Main.main.ret.121
D=A
@CALL
0;JMP
(Main.main.ret.121)
@58
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
@Main.main.ret.122
D=A
@CALL
0;JMP
(Main.main.ret.122)
@32
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
@Main.main.ret.123
D=A
@CALL
0;JMP
(Main.main.ret.123)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.124
D=A
@CALL
0;JMP
(Main.main.ret.124)
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
@Main.main.ret.125
D=A
@CALL
0;JMP
(Main.main.ret.125)
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
@Main.main.ret.126
D=A
@CALL
0;JMP
(Main.main.ret.126)
@SP
AM=M-1
D=M
@5
M=D


@3
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
@Main.main.ret.127
D=A
@CALL
0;JMP
(Main.main.ret.127)
@52
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
@Main.main.ret.128
D=A
@CALL
0;JMP
(Main.main.ret.128)
@53
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
@Main.main.ret.129
D=A
@CALL
0;JMP
(Main.main.ret.129)
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
@Main.main.ret.130
D=A
@CALL
0;JMP
(Main.main.ret.130)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


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
@Main.main.ret.131
D=A
@CALL
0;JMP
(Main.main.ret.131)
@105
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
@Main.main.ret.132
D=A
@CALL
0;JMP
(Main.main.ret.132)
@110
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
@Main.main.ret.133
D=A
@CALL
0;JMP
(Main.main.ret.133)
@116
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
@Main.main.ret.134
D=A
@CALL
0;JMP
(Main.main.ret.134)
@86
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
@Main.main.ret.135
D=A
@CALL
0;JMP
(Main.main.ret.135)
@97
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
@Main.main.ret.136
D=A
@CALL
0;JMP
(Main.main.ret.136)
@108
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
@Main.main.ret.137
D=A
@CALL
0;JMP
(Main.main.ret.137)
@117
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
@Main.main.ret.138
D=A
@CALL
0;JMP
(Main.main.ret.138)
@101
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
@Main.main.ret.139
D=A
@CALL
0;JMP
(Main.main.ret.139)
@58
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
@Main.main.ret.140
D=A
@CALL
0;JMP
(Main.main.ret.140)
@32
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
@Main.main.ret.141
D=A
@CALL
0;JMP
(Main.main.ret.141)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.142
D=A
@CALL
0;JMP
(Main.main.ret.142)
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
// call String.intValue
@6
D=A
@14
M=D
@String.intValue
D=A
@13
M=D
@Main.main.ret.143
D=A
@CALL
0;JMP
(Main.main.ret.143)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.144
D=A
@CALL
0;JMP
(Main.main.ret.144)
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
@Main.main.ret.145
D=A
@CALL
0;JMP
(Main.main.ret.145)
@SP
AM=M-1
D=M
@5
M=D


@6
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
@Main.main.ret.146
D=A
@CALL
0;JMP
(Main.main.ret.146)
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
@Main.main.ret.147
D=A
@CALL
0;JMP
(Main.main.ret.147)
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
@Main.main.ret.148
D=A
@CALL
0;JMP
(Main.main.ret.148)
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
@Main.main.ret.149
D=A
@CALL
0;JMP
(Main.main.ret.149)
@49
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
@Main.main.ret.150
D=A
@CALL
0;JMP
(Main.main.ret.150)
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
@Main.main.ret.151
D=A
@CALL
0;JMP
(Main.main.ret.151)
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
@Main.main.ret.152
D=A
@CALL
0;JMP
(Main.main.ret.152)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


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
@Main.main.ret.153
D=A
@CALL
0;JMP
(Main.main.ret.153)
@105
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
@Main.main.ret.154
D=A
@CALL
0;JMP
(Main.main.ret.154)
@110
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
@Main.main.ret.155
D=A
@CALL
0;JMP
(Main.main.ret.155)
@116
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
@Main.main.ret.156
D=A
@CALL
0;JMP
(Main.main.ret.156)
@86
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
@Main.main.ret.157
D=A
@CALL
0;JMP
(Main.main.ret.157)
@97
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
@Main.main.ret.158
D=A
@CALL
0;JMP
(Main.main.ret.158)
@108
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
@Main.main.ret.159
D=A
@CALL
0;JMP
(Main.main.ret.159)
@117
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
@Main.main.ret.160
D=A
@CALL
0;JMP
(Main.main.ret.160)
@101
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
@Main.main.ret.161
D=A
@CALL
0;JMP
(Main.main.ret.161)
@58
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
@Main.main.ret.162
D=A
@CALL
0;JMP
(Main.main.ret.162)
@32
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
@Main.main.ret.163
D=A
@CALL
0;JMP
(Main.main.ret.163)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.164
D=A
@CALL
0;JMP
(Main.main.ret.164)
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
// call String.intValue
@6
D=A
@14
M=D
@String.intValue
D=A
@13
M=D
@Main.main.ret.165
D=A
@CALL
0;JMP
(Main.main.ret.165)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.166
D=A
@CALL
0;JMP
(Main.main.ret.166)
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
@Main.main.ret.167
D=A
@CALL
0;JMP
(Main.main.ret.167)
@SP
AM=M-1
D=M
@5
M=D


@11
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
@Main.main.ret.168
D=A
@CALL
0;JMP
(Main.main.ret.168)
@98
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
@Main.main.ret.169
D=A
@CALL
0;JMP
(Main.main.ret.169)
@97
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
@Main.main.ret.170
D=A
@CALL
0;JMP
(Main.main.ret.170)
@99
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
@Main.main.ret.171
D=A
@CALL
0;JMP
(Main.main.ret.171)
@107
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
@Main.main.ret.172
D=A
@CALL
0;JMP
(Main.main.ret.172)
@83
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
@Main.main.ret.173
D=A
@CALL
0;JMP
(Main.main.ret.173)
@112
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
@Main.main.ret.174
D=A
@CALL
0;JMP
(Main.main.ret.174)
@97
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
@Main.main.ret.175
D=A
@CALL
0;JMP
(Main.main.ret.175)
@99
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
@Main.main.ret.176
D=A
@CALL
0;JMP
(Main.main.ret.176)
@101
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
@Main.main.ret.177
D=A
@CALL
0;JMP
(Main.main.ret.177)
@58
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
@Main.main.ret.178
D=A
@CALL
0;JMP
(Main.main.ret.178)
@32
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
@Main.main.ret.179
D=A
@CALL
0;JMP
(Main.main.ret.179)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.180
D=A
@CALL
0;JMP
(Main.main.ret.180)
@SP
AM=M-1
D=M
@5
M=D


// call String.backSpace
@5
D=A
@14
M=D
@String.backSpace
D=A
@13
M=D
@Main.main.ret.181
D=A
@CALL
0;JMP
(Main.main.ret.181)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.182
D=A
@CALL
0;JMP
(Main.main.ret.182)
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
@Main.main.ret.183
D=A
@CALL
0;JMP
(Main.main.ret.183)
@SP
AM=M-1
D=M
@5
M=D


@13
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
@Main.main.ret.184
D=A
@CALL
0;JMP
(Main.main.ret.184)
@100
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
@Main.main.ret.185
D=A
@CALL
0;JMP
(Main.main.ret.185)
@111
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
@Main.main.ret.186
D=A
@CALL
0;JMP
(Main.main.ret.186)
@117
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
@Main.main.ret.187
D=A
@CALL
0;JMP
(Main.main.ret.187)
@98
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
@Main.main.ret.188
D=A
@CALL
0;JMP
(Main.main.ret.188)
@108
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
@Main.main.ret.189
D=A
@CALL
0;JMP
(Main.main.ret.189)
@101
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
@Main.main.ret.190
D=A
@CALL
0;JMP
(Main.main.ret.190)
@81
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
@Main.main.ret.191
D=A
@CALL
0;JMP
(Main.main.ret.191)
@117
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
@Main.main.ret.192
D=A
@CALL
0;JMP
(Main.main.ret.192)
@111
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
@Main.main.ret.193
D=A
@CALL
0;JMP
(Main.main.ret.193)
@116
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
@Main.main.ret.194
D=A
@CALL
0;JMP
(Main.main.ret.194)
@101
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
@Main.main.ret.195
D=A
@CALL
0;JMP
(Main.main.ret.195)
@58
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
@Main.main.ret.196
D=A
@CALL
0;JMP
(Main.main.ret.196)
@32
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
@Main.main.ret.197
D=A
@CALL
0;JMP
(Main.main.ret.197)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.198
D=A
@CALL
0;JMP
(Main.main.ret.198)
@SP
AM=M-1
D=M
@5
M=D


// call String.doubleQuote
@5
D=A
@14
M=D
@String.doubleQuote
D=A
@13
M=D
@Main.main.ret.199
D=A
@CALL
0;JMP
(Main.main.ret.199)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.200
D=A
@CALL
0;JMP
(Main.main.ret.200)
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
@Main.main.ret.201
D=A
@CALL
0;JMP
(Main.main.ret.201)
@SP
AM=M-1
D=M
@5
M=D


@9
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
@Main.main.ret.202
D=A
@CALL
0;JMP
(Main.main.ret.202)
@110
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
@Main.main.ret.203
D=A
@CALL
0;JMP
(Main.main.ret.203)
@101
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
@Main.main.ret.204
D=A
@CALL
0;JMP
(Main.main.ret.204)
@119
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
@Main.main.ret.205
D=A
@CALL
0;JMP
(Main.main.ret.205)
@76
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
@Main.main.ret.206
D=A
@CALL
0;JMP
(Main.main.ret.206)
@105
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
@Main.main.ret.207
D=A
@CALL
0;JMP
(Main.main.ret.207)
@110
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
@Main.main.ret.208
D=A
@CALL
0;JMP
(Main.main.ret.208)
@101
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
@Main.main.ret.209
D=A
@CALL
0;JMP
(Main.main.ret.209)
@58
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
@Main.main.ret.210
D=A
@CALL
0;JMP
(Main.main.ret.210)
@32
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
@Main.main.ret.211
D=A
@CALL
0;JMP
(Main.main.ret.211)
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
D=A
@13
M=D
@Main.main.ret.212
D=A
@CALL
0;JMP
(Main.main.ret.212)
@SP
AM=M-1
D=M
@5
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
@Main.main.ret.213
D=A
@CALL
0;JMP
(Main.main.ret.213)
// call Output.printInt
@6
D=A
@14
M=D
@Output.printInt
D=A
@13
M=D
@Main.main.ret.214
D=A
@CALL
0;JMP
(Main.main.ret.214)
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
@Main.main.ret.215
D=A
@CALL
0;JMP
(Main.main.ret.215)
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
// call String.dispose
@6
D=A
@14
M=D
@String.dispose
D=A
@13
M=D
@Main.main.ret.216
D=A
@CALL
0;JMP
(Main.main.ret.216)
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
@Main.main.ret.217
D=A
@CALL
0;JMP
(Main.main.ret.217)
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


