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


@8000
D=A
@SP
AM=M+1
A=A-1
M=D
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


@8000
D=A
@SP
AM=M+1
A=A-1
M=D
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


@8001
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
M=D+1
// call Memory.poke
@7
D=A
@14
M=D
@Memory.poke
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


@3
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
@Main.main.ret.3
D=A
@CALL
0;JMP
(Main.main.ret.3)
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
D=M
@2
D=D+A
@4
M=D
@222
D=A
@THAT
A=M
M=D


@8002
D=A
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
// call Memory.poke
@7
D=A
@14
M=D
@Memory.poke
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


@LCL
A=M+1
M=0


@3
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
@Main.main.ret.5
D=A
@CALL
0;JMP
(Main.main.ret.5)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
A=A+1
M=D


@LCL
A=M+1
A=A+1
D=M
@2
D=D+A
@4
M=D


@LCL
A=M+1
A=A+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
D=M
@100
D=D-A
@THAT
A=M
M=D


@Main.main.EQ.1
D=A
@13
M=D
@Main.main.EQ.2
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
A=A-1
D=D-M
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.2)
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.1)
@Main.main.IfElse1
D;JNE


@LCL
A=M+1
M=1


// label Main.main.IfElse1
(Main.main.IfElse1)


@8003
D=A
@SP
AM=M+1
A=A-1
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
D=D+M
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
A=M+1
M=0


@500
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
@Main.main.ret.7
D=A
@CALL
0;JMP
(Main.main.ret.7)
@SP
AM=M-1
D=M
@LCL
D=M
@4
A=D+A
M=D


@LCL
A=M+1
A=A+1
D=M
@2
D=D+A
@4
M=D


@LCL
D=M
@4
A=D+A
D=M
@499
D=D+A
@4
M=D
@THAT
A=M
D=M
D=D-M
@THAT
A=M
M=D


@Main.main.EQ.4
D=A
@13
M=D
@Main.main.EQ.5
D=A
@13
M=D
@LCL
D=M
@4
A=D+A
D=M
A=A-1
A=A-1
D=D-M
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.5)
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.4)
@Main.main.IfElse2
D;JNE


@LCL
A=M+1
M=1


// label Main.main.IfElse2
(Main.main.IfElse2)


@Main.main.EQ.7
D=A
@13
M=D
@Main.main.EQ.8
D=A
@13
M=D
@LCL
D=M
@4
A=D+A
D=M
A=A-1
D=D-M
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.8)
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.7)
@Main.main.IfElse3
D;JNE


@LCL
A=M+1
D=M
@10
D=D+A
@LCL
A=M+1
M=D


// label Main.main.IfElse3
(Main.main.IfElse3)


@8004
D=A
@SP
AM=M+1
A=A-1
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
D=D+M
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
A=M+1
A=A+1
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
A=M+1
A=A+1
A=A+1
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
A=M+1
M=0


@3
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
@Main.main.ret.11
D=A
@CALL
0;JMP
(Main.main.ret.11)
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
@499
D=D+A
@4
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
@90
D=D-A
@THAT
A=M
M=D


@Main.main.EQ.10
D=A
@13
M=D
@Main.main.EQ.11
D=A
@13
M=D
@LCL
D=M
@4
A=D+A
D=M
A=A-1
D=M-D
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.11)
@15
M=D
@DO_EQ
0;JMP
(Main.main.EQ.10)
@Main.main.IfElse4
D;JNE


@LCL
A=M+1
M=1


// label Main.main.IfElse4
(Main.main.IfElse4)


@8005
D=A
@SP
AM=M+1
A=A-1
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
D=D+M
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


@LCL
A=M+1
A=A+1
A=A+1
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


// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)


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
@5
D=D-A
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


// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)


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
// call Memory.getPrevNode
@6
D=A
@14
M=D
@Memory.getPrevNode
D=A
@13
M=D
@Memory.deAlloc.ret.0
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.0)
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
// call Memory.getNextNode
@6
D=A
@14
M=D
@Memory.getNextNode
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
@LCL
A=M+1
A=A+1
M=D


@Memory.peek.EQ.14
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
@Memory.peek.EQ.15
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
(Memory.peek.EQ.15)
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.14)
@Memory.deAlloc.IfElse1
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
@Memory.deAlloc.ret.3
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.3)
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
@Memory.deAlloc.ret.4
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.4)
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
@Memory.deAlloc.ret.5
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.5)
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


// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)


@Memory.peek.EQ.17
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
@SP
AM=M-1
D=D&M
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
@Memory.deAlloc.ret.7
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.7)
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
@Memory.deAlloc.ret.8
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.8)
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
@Memory.deAlloc.ret.9
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.9)
@SP
AM=M-1
D=M
@5
M=D


// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)


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
// call Memory.getBinIndex
@7
D=A
@14
M=D
@Memory.getBinIndex
D=A
@13
M=D
@Memory.deAlloc.ret.11
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.11)
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
@Memory.deAlloc.ret.12
D=A
@CALL
0;JMP
(Memory.deAlloc.ret.12)
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


@Memory.peek.EQ.20
D=A
@13
M=D
@Memory.peek.EQ.21
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
(Memory.peek.EQ.21)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.20)
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


// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)


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


@Memory.peek.EQ.23
D=A
@13
M=D
@Memory.peek.EQ.24
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
(Memory.peek.EQ.24)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.23)
@Memory.realloc.IfElse2
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)


@Memory.peek.EQ.26
D=A
@13
M=D
@Memory.peek.GT.27
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
(Memory.peek.GT.27)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.26)
@Memory.realloc.IfElse3
D;JNE


@LCL
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)


@ARG
A=M+1
D=M
@LCL
A=M+1
A=A+1
M=D


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


@Memory.peek.EQ.29
D=A
@13
M=D
@Memory.peek.LT.30
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
(Memory.peek.LT.30)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.29)
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


@Memory.peek.EQ.32
D=A
@13
M=D
@Memory.peek.EQ.33
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
(Memory.peek.EQ.33)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.32)
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


@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


@Memory.peek.EQ.35
D=A
@13
M=D
@Memory.peek.EQ.36
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
(Memory.peek.EQ.36)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.35)
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


// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)


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


@Memory.peek.EQ.38
D=A
@13
M=D
@Memory.peek.LT.39
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
(Memory.peek.LT.39)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.38)
@WHILE_END_Memory.getBinIndex1
D;JNE


@Memory.peek.EQ.41
D=A
@13
M=D
@Memory.peek.GT.42
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
(Memory.peek.GT.42)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.41)
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


// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)


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
@LCL
A=M
M=D


// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)


@Memory.peek.EQ.43
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
(Memory.peek.EQ.43)
@WHILE_END_Memory.get_best_fit1
D;JNE


@LCL
A=M
D=M
@4
M=D


@Memory.peek.EQ.45
D=A
@13
M=D
@Memory.peek.LT.46
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
(Memory.peek.LT.46)
D=!D
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.45)
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


// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)


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
@5
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


@Memory.peek.EQ.48
D=A
@13
M=D
@Memory.peek.EQ.49
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
(Memory.peek.EQ.49)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.48)
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


// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)


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


@Memory.peek.EQ.52
D=A
@13
M=D
@Memory.peek.EQ.53
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
(Memory.peek.EQ.53)
D=!D
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.GT.54
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
(Memory.peek.GT.54)
D=!D
@SP
AM=M-1
D=D&M
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.52)
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


@Memory.peek.EQ.55
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
(Memory.peek.EQ.55)
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


@Memory.peek.EQ.56
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
(Memory.peek.EQ.56)
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


// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)


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


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.getPrevNode with 1
(Memory.getPrevNode)
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


@Memory.peek.EQ.58
D=A
@13
M=D
@Memory.peek.EQ.59
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
(Memory.peek.EQ.59)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.58)
@Memory.getPrevNode.IfElse1
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


// label Memory.getPrevNode.IfElse1
(Memory.getPrevNode.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Memory.getNextNode with 1
(Memory.getNextNode)
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


@Memory.peek.EQ.61
D=A
@13
M=D
@Memory.peek.GT.62
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
(Memory.peek.GT.62)
@15
M=D
@DO_EQ
0;JMP
(Memory.peek.EQ.61)
@Memory.getNextNode.IfElse1
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


// label Memory.getNextNode.IfElse1
(Memory.getNextNode.IfElse1)


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


