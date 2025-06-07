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
@Array.new.ret.0
D=A
@CALL
0;JMP
(Array.new.ret.0)
@SP
AM=M-1
D=M
@3
M=D


@Array.__setitem__.GT.0
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
(Array.__setitem__.GT.0)
@Array.new.IfElse1
D;JNE


@ARG
A=M
M=1


// label Array.new.IfElse1
(Array.new.IfElse1)


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
@Array.new.ret.1
D=A
@CALL
0;JMP
(Array.new.ret.1)
@SP
AM=M-1
D=M
@THIS
A=M
M=D


@ARG
A=M
D=M
@THIS
A=M+1
M=D


@THIS
A=M+1
A=A+1
M=0


@3
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.dispose with 0
(Array.dispose)


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
// call Memory.free
@6
D=A
@14
M=D
@Memory.free
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


// function Array.capacity with 0
(Array.capacity)


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


// function Array.size with 0
(Array.size)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.get with 0
(Array.get)


@ARG
A=M
D=M
@3
M=D


@Array.__setitem__.LT.1
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
(Array.__setitem__.LT.1)
@SP
AM=M+1
A=A-1
M=D
@Array.__setitem__.LT.2
D=A
@13
M=D
@ARG
A=M+1
D=M
@R13
M=D
@THIS
A=M+1
A=A+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Array.__setitem__.LT.2)
D=!D
@SP
AM=M-1
D=D|M
D=!D
@Array.get.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Array.get.IfElse1
(Array.get.IfElse1)


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


// function Array.set with 0
(Array.set)


@ARG
A=M
D=M
@3
M=D


@Array.__setitem__.LT.3
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
(Array.__setitem__.LT.3)
@SP
AM=M+1
A=A-1
M=D
@Array.__setitem__.LT.4
D=A
@13
M=D
@ARG
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
(Array.__setitem__.LT.4)
D=!D
@SP
AM=M-1
D=D|M
D=!D
@Array.set.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Array.set.IfElse1
(Array.set.IfElse1)


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


@Array.__setitem__.LT.5
D=A
@13
M=D
@ARG
A=M+1
D=M
@R13
M=D
@THIS
A=M+1
A=A+1
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Array.__setitem__.LT.5)
@Array.set.IfElse2
D;JNE


@ARG
A=M+1
D=M+1
@THIS
A=M+1
A=A+1
M=D


// label Array.set.IfElse2
(Array.set.IfElse2)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.append with 0
(Array.append)


@ARG
A=M
D=M
@3
M=D


@Array.__setitem__.LT.6
D=A
@13
M=D
@THIS
A=M+1
A=A+1
D=M
A=A-1
D=D-M
@15
M=D
@DO_LT
0;JMP
(Array.__setitem__.LT.6)
@Array.append.IfElse1
D;JNE


@3
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.grow
@6
D=A
@14
M=D
@Array.grow
D=A
@13
M=D
@Array.append.ret.0
D=A
@CALL
0;JMP
(Array.append.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// label Array.append.IfElse1
(Array.append.IfElse1)


@THIS
A=M+1
A=A+1
D=M
A=A-1
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
A=A+1
M=M+1


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.grow with 3
(Array.grow)
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
// call Math.multiply
@7
D=A
@14
M=D
@Math.multiply
D=A
@13
M=D
@Array.grow.ret.0
D=A
@CALL
0;JMP
(Array.grow.ret.0)
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
// call Memory.alloc
@6
D=A
@14
M=D
@Memory.alloc
D=A
@13
M=D
@Array.grow.ret.1
D=A
@CALL
0;JMP
(Array.grow.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Array.__setitem__.EQ.7
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
(Array.__setitem__.EQ.7)
D=!D
@Array.grow.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Array.grow.IfElse1
(Array.grow.IfElse1)


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
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.copy
@8
D=A
@14
M=D
@Array.copy
D=A
@13
M=D
@Array.grow.ret.2
D=A
@CALL
0;JMP
(Array.grow.ret.2)
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
// call Memory.free
@6
D=A
@14
M=D
@Memory.free
D=A
@13
M=D
@Array.grow.ret.3
D=A
@CALL
0;JMP
(Array.grow.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@THIS
A=M
M=D


@LCL
A=M+1
D=M
@THIS
A=M+1
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.shrinkToFit with 1
(Array.shrinkToFit)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@Array.__setitem__.LT.8
D=A
@13
M=D
@THIS
A=M+1
A=A+1
D=M
A=A-1
D=D-M
@15
M=D
@DO_LT
0;JMP
(Array.__setitem__.LT.8)
D=!D
@Array.shrinkToFit.IfElse1
D;JNE


@THIS
A=M+1
A=A+1
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
@Array.shrinkToFit.ret.0
D=A
@CALL
0;JMP
(Array.shrinkToFit.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Array.__setitem__.EQ.9
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
(Array.__setitem__.EQ.9)
D=!D
@Array.shrinkToFit.IfElse2
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Array.shrinkToFit.IfElse2
(Array.shrinkToFit.IfElse2)


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
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.copy
@8
D=A
@14
M=D
@Array.copy
D=A
@13
M=D
@Array.shrinkToFit.ret.1
D=A
@CALL
0;JMP
(Array.shrinkToFit.ret.1)
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
// call Memory.free
@6
D=A
@14
M=D
@Memory.free
D=A
@13
M=D
@Array.shrinkToFit.ret.2
D=A
@CALL
0;JMP
(Array.shrinkToFit.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@THIS
A=M
M=D


@THIS
A=M+1
A=A+1
D=M
@THIS
A=M+1
M=D


// label Array.shrinkToFit.IfElse1
(Array.shrinkToFit.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.resize with 1
(Array.resize)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@Array.__setitem__.GT.10
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
(Array.__setitem__.GT.10)
@Array.resize.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Array.resize.IfElse1
(Array.resize.IfElse1)


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
@Array.resize.ret.0
D=A
@CALL
0;JMP
(Array.resize.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Array.__setitem__.EQ.11
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
(Array.__setitem__.EQ.11)
D=!D
@Array.resize.IfElse2
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Array.resize.IfElse2
(Array.resize.IfElse2)


@Array.__setitem__.GT.12
D=A
@13
M=D
@THIS
A=M+1
A=A+1
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
(Array.__setitem__.GT.12)
@Array.resize.IfElse3
D;JNE


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
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.copy
@8
D=A
@14
M=D
@Array.copy
D=A
@13
M=D
@Array.resize.ret.1
D=A
@CALL
0;JMP
(Array.resize.ret.1)
@SP
AM=M-1
D=M
@5
M=D


// label Array.resize.IfElse3
(Array.resize.IfElse3)


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
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.copy
@8
D=A
@14
M=D
@Array.copy
D=A
@13
M=D
@Array.resize.ret.2
D=A
@CALL
0;JMP
(Array.resize.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@ARG
A=M+1
D=M
@THIS
A=M+1
A=A+1
M=D


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Memory.free
@6
D=A
@14
M=D
@Memory.free
D=A
@13
M=D
@Array.resize.ret.3
D=A
@CALL
0;JMP
(Array.resize.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
D=M
@THIS
A=M
M=D


@ARG
A=M+1
D=M
@THIS
A=M+1
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.copy with 1
(Array.copy)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Array.copy1
(WHILE_START_Array.copy1)


@Array.__setitem__.LT.13
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
(Array.__setitem__.LT.13)
D=!D
@WHILE_END_Array.copy1
D;JNE


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


// goto WHILE_START_Array.copy1
@WHILE_START_Array.copy1
0;JMP


// label WHILE_END_Array.copy1
(WHILE_END_Array.copy1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.copyRange with 1
(Array.copyRange)
@SP
AM=M+1
A=A-1
M=0


@LCL
A=M
M=0


// label WHILE_START_Array.copyRange1
(WHILE_START_Array.copyRange1)


@Array.__setitem__.LT.14
D=A
@13
M=D
@LCL
A=M
D=M
@R13
M=D
@ARG
D=M
@4
A=D+A
D=M
@R13
D=M-D
@15
M=D
@DO_LT
0;JMP
(Array.__setitem__.LT.14)
D=!D
@WHILE_END_Array.copyRange1
D;JNE


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
A=A+1
D=M
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@SP
AM=M-1
D=D+M
@4
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
@R13
M=D
@LCL
A=M
D=M
@R13
D=D+M
@SP
AM=M-1
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


// goto WHILE_START_Array.copyRange1
@WHILE_START_Array.copyRange1
0;JMP


// label WHILE_END_Array.copyRange1
(WHILE_END_Array.copyRange1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.fill with 1
(Array.fill)
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


// label WHILE_START_Array.fill1
(WHILE_START_Array.fill1)


@Array.__setitem__.LT.15
D=A
@13
M=D
@LCL
A=M
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
(Array.__setitem__.LT.15)
D=!D
@WHILE_END_Array.fill1
D;JNE


@THIS
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
@THAT
A=M
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_Array.fill1
@WHILE_START_Array.fill1
0;JMP


// label WHILE_END_Array.fill1
(WHILE_END_Array.fill1)


@THIS
A=M+1
D=M
@THIS
A=M+1
A=A+1
M=D


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.clear with 0
(Array.clear)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
A=A+1
M=0


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.isEmpty with 0
(Array.isEmpty)


@ARG
A=M
D=M
@3
M=D


@Array.__setitem__.EQ.16
D=A
@13
M=D
@THIS
A=M+1
A=A+1
D=M
@15
M=D
@DO_EQ
0;JMP
(Array.__setitem__.EQ.16)
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Array.__getitem__ with 0
(Array.__getitem__)


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


// function Array.__setitem__ with 0
(Array.__setitem__)


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


@Keyboard.readInt.EQ.0
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
(Keyboard.readInt.EQ.0)
D=!D
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


@Keyboard.readInt.EQ.1
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
(Keyboard.readInt.EQ.1)
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


@Keyboard.readInt.EQ.2
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
@Keyboard.readLine.ret.3
D=A
@CALL
0;JMP
(Keyboard.readLine.ret.3)
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
(Keyboard.readInt.EQ.2)
@WHILE_END_Keyboard.readLine1
D;JNE


@Keyboard.readInt.EQ.3
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
// call String.backSpace
@5
D=A
@14
M=D
@String.backSpace
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
(Keyboard.readInt.EQ.3)
D=!D
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
@Main.main.ret.0
D=A
@CALL
0;JMP
(Main.main.ret.0)
@72
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
@Main.main.ret.1
D=A
@CALL
0;JMP
(Main.main.ret.1)
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
@Main.main.ret.2
D=A
@CALL
0;JMP
(Main.main.ret.2)
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
@Main.main.ret.3
D=A
@CALL
0;JMP
(Main.main.ret.3)
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
@Main.main.ret.4
D=A
@CALL
0;JMP
(Main.main.ret.4)
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
@Main.main.ret.5
D=A
@CALL
0;JMP
(Main.main.ret.5)
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
@Main.main.ret.6
D=A
@CALL
0;JMP
(Main.main.ret.6)
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
@Main.main.ret.7
D=A
@CALL
0;JMP
(Main.main.ret.7)
@87
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
@Main.main.ret.8
D=A
@CALL
0;JMP
(Main.main.ret.8)
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
@Main.main.ret.9
D=A
@CALL
0;JMP
(Main.main.ret.9)
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
@Main.main.ret.10
D=A
@CALL
0;JMP
(Main.main.ret.10)
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
@Main.main.ret.11
D=A
@CALL
0;JMP
(Main.main.ret.11)
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
@Main.main.ret.12
D=A
@CALL
0;JMP
(Main.main.ret.12)
@33
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
// call Output.printString
@6
D=A
@14
M=D
@Output.printString
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


// function Math.two_to_the_power_of with 0
(Math.two_to_the_power_of)


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
D=!D
@Math.bit.IfElse1
D;JNE


@SP
AM=M+1
A=A-1
M=-1


@RETURN
0;JMP


// label Math.bit.IfElse1
(Math.bit.IfElse1)


D=0
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


// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)


@Math.abs.LT.0
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
(Math.abs.LT.0)
D=!D
@WHILE_END_Math.multiply1
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
// call Math.bit
@7
D=A
@14
M=D
@Math.bit
D=A
@13
M=D
@Math.multiply.ret.0
D=A
@CALL
0;JMP
(Math.multiply.ret.0)
@SP
AM=M-1
D=M
D=!D
@Math.multiply.IfElse1
D;JNE


@LCL
A=M+1
D=M
A=A-1
D=D+M
@LCL
A=M
M=D


// label Math.multiply.IfElse1
(Math.multiply.IfElse1)


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


// function Math.divide with 1
(Math.divide)
@SP
AM=M+1
A=A-1
M=0


@Math.abs.GT.1
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
(Math.abs.GT.1)
D=!D
@Math.divide.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Math.divide.IfElse1
(Math.divide.IfElse1)


@Math.abs.EQ.2
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
(Math.abs.EQ.2)
D=!D
@Math.divide.IfElse2
D;JNE


D=1
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Math.divide.IfElse2
(Math.divide.IfElse2)


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
@Math.divide.ret.0
D=A
@CALL
0;JMP
(Math.divide.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@Math.abs.LT.3
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
@Math.divide.ret.1
D=A
@CALL
0;JMP
(Math.divide.ret.1)
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
(Math.abs.LT.3)
D=!D
@Math.divide.IfElse3
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


// label Math.divide.IfElse3
(Math.divide.IfElse3)


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


// function Math.sqrt with 3
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


@LCL
A=M
M=0


@15
D=A
@LCL
A=M+1
M=D


// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)


@Math.abs.GT.4
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
(Math.abs.GT.4)
@SP
AM=M+1
A=A-1
M=D
@Math.abs.EQ.5
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
(Math.abs.EQ.5)
@SP
AM=M-1
D=D|M
D=!D
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


@Math.abs.GT.6
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
@Math.sqrt.ret.0
D=A
@CALL
0;JMP
(Math.sqrt.ret.0)
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
(Math.abs.GT.6)
@Math.sqrt.IfElse1
D;JNE


@LCL
A=M+1
A=A+1
D=M
@LCL
A=M
M=D


// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)


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


@Math.abs.GT.7
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
(Math.abs.GT.7)
D=!D
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


// label Math.max.IfElse1
(Math.max.IfElse1)


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


@Math.abs.LT.8
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
(Math.abs.LT.8)
D=!D
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


// label Math.min.IfElse1
(Math.min.IfElse1)


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


@Math.abs.LT.9
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
(Math.abs.LT.9)
D=!D
@Math.abs.IfElse1
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


// label Math.abs.IfElse1
(Math.abs.IfElse1)


@ARG
A=M
D=M
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


@LCL
A=M
M=0


// label WHILE_START_Memory.init1
(WHILE_START_Memory.init1)


@Memory.peek.LT.0
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
(Memory.peek.LT.0)
D=!D
@WHILE_END_Memory.init1
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


// goto WHILE_START_Memory.init1
@WHILE_START_Memory.init1
0;JMP


// label WHILE_END_Memory.init1
(WHILE_END_Memory.init1)


@2055
D=A
@4
M=D


@14423
D=A
@THAT
A=M
M=D


@2056
D=A
@4
M=D


@THAT
A=M
M=1


@2057
D=A
@4
M=D


@THAT
A=M
M=0


@2058
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


@14423
D=A
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
@Memory.init.ret.2
D=A
@CALL
0;JMP
(Memory.init.ret.2)
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
// call Memory.add_node
@7
D=A
@14
M=D
@Memory.add_node
D=A
@13
M=D
@Memory.init.ret.3
D=A
@CALL
0;JMP
(Memory.init.ret.3)
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


@LCL
A=M+1
A=A+1
D=M
@WHILE_END_Memory.alloc1
D;JNE


@Memory.peek.LT.1
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
(Memory.peek.LT.1)
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


@Memory.peek.LT.2
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
(Memory.peek.LT.2)
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


@LCL
A=M
D=M
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


@Memory.peek.GT.3
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
(Memory.peek.GT.3)
D=!D
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


// function Memory.free with 3
(Memory.free)
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
@Memory.free.ret.0
D=A
@CALL
0;JMP
(Memory.free.ret.0)
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
@Memory.free.ret.1
D=A
@CALL
0;JMP
(Memory.free.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.EQ.4
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
(Memory.peek.EQ.4)
@SP
AM=M-1
D=D&M
D=!D
@Memory.free.IfElse1
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
@Memory.free.ret.3
D=A
@CALL
0;JMP
(Memory.free.ret.3)
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
// call Memory.remove_node
@7
D=A
@14
M=D
@Memory.remove_node
D=A
@13
M=D
@Memory.free.ret.4
D=A
@CALL
0;JMP
(Memory.free.ret.4)
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
@Memory.free.ret.5
D=A
@CALL
0;JMP
(Memory.free.ret.5)
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


// label Memory.free.IfElse1
(Memory.free.IfElse1)


@LCL
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.EQ.5
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
(Memory.peek.EQ.5)
@SP
AM=M-1
D=D&M
D=!D
@Memory.free.IfElse2
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
@Memory.free.ret.7
D=A
@CALL
0;JMP
(Memory.free.ret.7)
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
// call Memory.remove_node
@7
D=A
@14
M=D
@Memory.remove_node
D=A
@13
M=D
@Memory.free.ret.8
D=A
@CALL
0;JMP
(Memory.free.ret.8)
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
@Memory.free.ret.9
D=A
@CALL
0;JMP
(Memory.free.ret.9)
@SP
AM=M-1
D=M
@5
M=D


// label Memory.free.IfElse2
(Memory.free.IfElse2)


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
@Memory.free.ret.11
D=A
@CALL
0;JMP
(Memory.free.ret.11)
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
// call Memory.add_node
@7
D=A
@14
M=D
@Memory.add_node
D=A
@13
M=D
@Memory.free.ret.12
D=A
@CALL
0;JMP
(Memory.free.ret.12)
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


@Memory.peek.EQ.6
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
(Memory.peek.EQ.6)
D=!D
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


@Memory.peek.EQ.7
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
(Memory.peek.EQ.7)
D=!D
@Memory.realloc.IfElse2
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


@THAT
A=M
D=!M
@Memory.remove_node.IfElse1
D;JNE


@ARG
A=M+1
D=M
@2
D=D+A
@3
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


// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)


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
A=M+1
D=M
@3
D=D+A
@4
M=D


@THAT
A=M
D=!M
@Memory.remove_node.IfElse2
D;JNE


@ARG
A=M+1
D=M
@3
D=D+A
@2
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


@Memory.peek.LT.8
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
(Memory.peek.LT.8)
D=!D
@WHILE_END_Memory.getBinIndex1
D;JNE


@Memory.peek.GT.9
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
@Memory.getBinIndex.ret.0
D=A
@CALL
0;JMP
(Memory.getBinIndex.ret.0)
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
(Memory.peek.GT.9)
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
M=D


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


@LCL
A=M
D=!M
@WHILE_END_Memory.get_best_fit1
D;JNE


@LCL
A=M
D=M
@4
M=D


@Memory.peek.LT.10
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
(Memory.peek.LT.10)
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


// function Memory.get_foot with 0
(Memory.get_foot)


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


// function Memory.create_foot with 0
(Memory.create_foot)


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
// call Memory.get_foot
@7
D=A
@14
M=D
@Memory.get_foot
D=A
@13
M=D
@Memory.create_foot.ret.0
D=A
@CALL
0;JMP
(Memory.create_foot.ret.0)
@ARG
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
@Memory.create_foot.ret.1
D=A
@CALL
0;JMP
(Memory.create_foot.ret.1)
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


@THAT
A=M
D=M
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


@Memory.peek.EQ.11
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
(Memory.peek.EQ.11)
D=!D
@SP
AM=M+1
A=A-1
M=D
@Memory.peek.GT.12
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
(Memory.peek.GT.12)
D=!D
@SP
AM=M-1
D=D&M
D=!D
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


@LCL
A=M+1
D=M
@Memory.add_node.IfElse2
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


@LCL
A=M
D=!M
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


@Memory.peek.EQ.13
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
(Memory.peek.EQ.13)
D=!D
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


@Memory.peek.GT.14
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
(Memory.peek.GT.14)
D=!D
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


// function Output.init with 0
(Output.init)


@16384
D=A
@Output.3
M=D


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
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
@SP
AM=M+1
A=A-1
M=D
D=0
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


@Output.backSpace.LT.0
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
(Output.backSpace.LT.0)
@SP
AM=M+1
A=A-1
M=D
@Output.backSpace.GT.1
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
(Output.backSpace.GT.1)
@SP
AM=M-1
D=D|M
D=!D
@Output.getMap.IfElse1
D;JNE


@ARG
A=M
M=0


// label Output.getMap.IfElse1
(Output.getMap.IfElse1)


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
// call Output.printChar
@6
D=A
@14
M=D
@Output.printChar
D=A
@13
M=D
@Output.moveCursor.ret.0
D=A
@CALL
0;JMP
(Output.moveCursor.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// call Output.backSpace
@5
D=A
@14
M=D
@Output.backSpace
D=A
@13
M=D
@Output.moveCursor.ret.1
D=A
@CALL
0;JMP
(Output.moveCursor.ret.1)
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
@Output.printChar.ret.1
D=A
@CALL
0;JMP
(Output.printChar.ret.1)
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
@Output.printChar.ret.2
D=A
@CALL
0;JMP
(Output.printChar.ret.2)
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


// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)


@Output.backSpace.LT.2
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
(Output.backSpace.LT.2)
D=!D
@WHILE_END_Output.printChar1
D;JNE


@Output.backSpace.EQ.3
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
(Output.backSpace.EQ.3)
D=!D
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
@Output.printChar.ret.3
D=A
@CALL
0;JMP
(Output.printChar.ret.3)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


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
@LCL
A=M+1
A=A+1
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


// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1
0;JMP


// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)


@Output.backSpace.EQ.4
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
(Output.backSpace.EQ.4)
D=!D
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
@Output.printChar.ret.4
D=A
@CALL
0;JMP
(Output.printChar.ret.4)
@SP
AM=M-1
D=M
@5
M=D


// label Output.printChar.IfElse2
(Output.printChar.IfElse2)


@Output.1
M=M+1


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


@Output.backSpace.LT.5
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
@Output.printString.ret.0
D=A
@CALL
0;JMP
(Output.printString.ret.0)
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
(Output.backSpace.LT.5)
D=!D
@WHILE_END_Output.printString1
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
@Output.printString.ret.1
D=A
@CALL
0;JMP
(Output.printString.ret.1)
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
@Output.printInt.ret.0
D=A
@CALL
0;JMP
(Output.printInt.ret.0)
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
// call String.dispose
@6
D=A
@14
M=D
@String.dispose
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


@Output.backSpace.EQ.6
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
(Output.backSpace.EQ.6)
D=!D
@Output.println.IfElse1
D;JNE


@Output.2
M=0


// label Output.println.IfElse1
(Output.println.IfElse1)


@Output.2
M=M+1


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Output.backSpace with 0
(Output.backSpace)


@Output.backSpace.EQ.7
D=A
@13
M=D
@Output.1
D=M
@15
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.7)
D=!D
@Output.backSpace.IfElse1
D;JNE


@Output.2
M=M-1


@63
D=A
@Output.1
M=D


// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)


@Output.1
M=M-1


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


@Screen.drawCircle.LT.0
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
(Screen.drawCircle.LT.0)
D=!D
@WHILE_END_Screen.clearScreen1
D;JNE


@Screen.1
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
@SP
AM=M+1
A=A-1
M=D
D=0
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
@Screen.clearScreen.ret.0
D=A
@CALL
0;JMP
(Screen.clearScreen.ret.0)
@SP
AM=M-1
D=M
@5
M=D


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
@Screen.drawPixel.ret.0
D=A
@CALL
0;JMP
(Screen.drawPixel.ret.0)
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
@Screen.drawPixel.ret.1
D=A
@CALL
0;JMP
(Screen.drawPixel.ret.1)
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
// call Math.two_to_the_power_of
@6
D=A
@14
M=D
@Math.two_to_the_power_of
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
@LCL
A=M+1
M=D


@Screen.0
D=!M
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


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawLine with 7
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
@SP
AM=M+1
A=A-1
M=0


@Screen.drawCircle.EQ.1
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
(Screen.drawCircle.EQ.1)
D=!D
@Screen.drawLine.IfElse1
D;JNE


@Screen.drawCircle.GT.2
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
(Screen.drawCircle.GT.2)
D=!D
@Screen.drawLine.IfElse2
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


// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)


@ARG
A=M+1
D=M
@LCL
D=M
@4
A=D+A
M=D


// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)


@Screen.drawCircle.GT.3
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
(Screen.drawCircle.GT.3)
@WHILE_END_Screen.drawLine1
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
// call Screen.drawPixel
@7
D=A
@14
M=D
@Screen.drawPixel
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
@5
M=D


@LCL
D=M
@4
A=D+A
M=M+1


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


// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)


@Screen.drawCircle.EQ.4
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
(Screen.drawCircle.EQ.4)
D=!D
@Screen.drawLine.IfElse3
D;JNE


@Screen.drawCircle.GT.5
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
(Screen.drawCircle.GT.5)
D=!D
@Screen.drawLine.IfElse4
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


// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)


@ARG
A=M
D=M
@LCL
A=M+1
A=A+1
A=A+1
M=D


// label WHILE_START_Screen.drawLine2
(WHILE_START_Screen.drawLine2)


@Screen.drawCircle.GT.6
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
(Screen.drawCircle.GT.6)
@WHILE_END_Screen.drawLine2
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
// call Screen.drawPixel
@7
D=A
@14
M=D
@Screen.drawPixel
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
@5
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_Screen.drawLine2
@WHILE_START_Screen.drawLine2
0;JMP


// label WHILE_END_Screen.drawLine2
(WHILE_END_Screen.drawLine2)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)


@Screen.drawCircle.GT.7
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
(Screen.drawCircle.GT.7)
D=!D
@Screen.drawLine.IfElse5
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


// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)


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


@Screen.drawCircle.LT.8
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
(Screen.drawCircle.LT.8)
D=!D
@Screen.drawLine.IfElse6
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


// label Screen.drawLine.IfElse6
(Screen.drawLine.IfElse6)


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


// label WHILE_START_Screen.drawLine3
(WHILE_START_Screen.drawLine3)


@Screen.drawCircle.GT.9
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
(Screen.drawCircle.GT.9)
@WHILE_END_Screen.drawLine3
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


@Screen.drawCircle.LT.10
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
(Screen.drawCircle.LT.10)
@Screen.drawLine.IfElse7
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


// label Screen.drawLine.IfElse7
(Screen.drawLine.IfElse7)


@LCL
A=M+1
A=A+1
A=A+1
M=M+1


// goto WHILE_START_Screen.drawLine3
@WHILE_START_Screen.drawLine3
0;JMP


// label WHILE_END_Screen.drawLine3
(WHILE_END_Screen.drawLine3)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function Screen.drawRectangle with 2
(Screen.drawRectangle)
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0


@Screen.drawCircle.GT.11
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
(Screen.drawCircle.GT.11)
D=!D
@Screen.drawRectangle.IfElse1
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


// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)


@Screen.drawCircle.GT.12
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
(Screen.drawCircle.GT.12)
D=!D
@Screen.drawRectangle.IfElse2
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


// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)


@ARG
A=M+1
D=M
@LCL
A=M+1
M=D


// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)


@Screen.drawCircle.GT.13
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
(Screen.drawCircle.GT.13)
@WHILE_END_Screen.drawRectangle1
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
// call Screen.drawLine
@10
D=A
@14
M=D
@Screen.drawLine
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
@5
M=D


@LCL
A=M+1
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


// function Screen.drawCircle with 3
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


@Screen.drawCircle.GT.14
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
(Screen.drawCircle.GT.14)
D=!D
@Screen.drawCircle.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)


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
@Screen.drawCircle.ret.0
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.0)
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


// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)


@Screen.drawCircle.GT.15
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
(Screen.drawCircle.GT.15)
@WHILE_END_Screen.drawCircle1
D;JNE


@ARG
A=M+1
A=A+1
D=-M
@LCL
A=M
M=D


// label WHILE_START_Screen.drawCircle2
(WHILE_START_Screen.drawCircle2)


@Screen.drawCircle.GT.16
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
(Screen.drawCircle.GT.16)
@WHILE_END_Screen.drawCircle2
D;JNE


@Screen.drawCircle.GT.17
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
@Screen.drawCircle.ret.1
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.1)
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
@Screen.drawCircle.ret.2
D=A
@CALL
0;JMP
(Screen.drawCircle.ret.2)
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
(Screen.drawCircle.GT.17)
@Screen.drawCircle.IfElse2
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
// call Screen.drawPixel
@8
D=A
@14
M=D
@Screen.drawPixel
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


// label Screen.drawCircle.IfElse2
(Screen.drawCircle.IfElse2)


@LCL
A=M
M=M+1


// goto WHILE_START_Screen.drawCircle2
@WHILE_START_Screen.drawCircle2
0;JMP


// label WHILE_END_Screen.drawCircle2
(WHILE_END_Screen.drawCircle2)


@LCL
A=M+1
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


// function String.new with 0
(String.new)


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


@String.newLine.GT.0
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
(String.newLine.GT.0)
@String.new.IfElse1
D;JNE


@ARG
A=M
M=1


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


// function String.maxLength with 0
(String.maxLength)


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
// call Array.capacity
@6
D=A
@14
M=D
@Array.capacity
D=A
@13
M=D
@String.maxLength.ret.0
D=A
@CALL
0;JMP
(String.maxLength.ret.0)


@RETURN
0;JMP


// function String.charAt with 0
(String.charAt)


@ARG
A=M
D=M
@3
M=D


@String.newLine.LT.1
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
(String.newLine.LT.1)
@SP
AM=M+1
A=A-1
M=D
@String.newLine.LT.2
D=A
@13
M=D
@ARG
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
(String.newLine.LT.2)
D=!D
@SP
AM=M-1
D=D|M
D=!D
@String.charAt.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label String.charAt.IfElse1
(String.charAt.IfElse1)


@THIS
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
// call Array.get
@7
D=A
@14
M=D
@Array.get
D=A
@13
M=D
@String.charAt.ret.0
D=A
@CALL
0;JMP
(String.charAt.ret.0)


@RETURN
0;JMP


// function String.setCharAt with 0
(String.setCharAt)


@ARG
A=M
D=M
@3
M=D


@String.newLine.LT.3
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
(String.newLine.LT.3)
D=!D
@SP
AM=M+1
A=A-1
M=D
@String.newLine.LT.4
D=A
@13
M=D
@ARG
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
(String.newLine.LT.4)
@SP
AM=M-1
D=D&M
D=!D
@String.setCharAt.IfElse1
D;JNE


@THIS
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
@ARG
A=M+1
A=A+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.set
@8
D=A
@14
M=D
@Array.set
D=A
@13
M=D
@String.setCharAt.ret.0
D=A
@CALL
0;JMP
(String.setCharAt.ret.0)
@SP
AM=M-1
D=M
@5
M=D


// label String.setCharAt.IfElse1
(String.setCharAt.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.appendChar with 0
(String.appendChar)


@ARG
A=M
D=M
@3
M=D


@String.newLine.LT.5
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
// call Array.capacity
@6
D=A
@14
M=D
@Array.capacity
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
@SP
AM=M-1
D=M-D
@15
M=D
@DO_LT
0;JMP
(String.newLine.LT.5)
@String.appendChar.IfElse1
D;JNE


@THIS
A=M
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.grow
@6
D=A
@14
M=D
@Array.grow
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


// label String.appendChar.IfElse1
(String.appendChar.IfElse1)


@THIS
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
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.set
@8
D=A
@14
M=D
@Array.set
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


@String.newLine.GT.6
D=A
@13
M=D
@THIS
A=M+1
D=M
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.6)
D=!D
@String.eraseLastChar.IfElse1
D;JNE


@THIS
A=M+1
M=M-1


// label String.eraseLastChar.IfElse1
(String.eraseLastChar.IfElse1)


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.intValue with 4
(String.intValue)
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


@LCL
A=M
M=0


@LCL
A=M+1
M=0


@LCL
A=M+1
A=A+1
M=1


@String.newLine.GT.7
D=A
@13
M=D
@THIS
A=M+1
D=M
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.7)
@SP
AM=M+1
A=A-1
M=D
@String.newLine.EQ.8
D=A
@13
M=D
@THIS
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
// call Array.get
@7
D=A
@14
M=D
@Array.get
D=A
@13
M=D
@String.intValue.ret.2
D=A
@CALL
0;JMP
(String.intValue.ret.2)
@SP
AM=M-1
D=M
@45
D=D-A
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.8)
@SP
AM=M-1
D=D&M
D=!D
@String.intValue.IfElse1
D;JNE


D=1
@LCL
A=M+1
A=A+1
M=D


@LCL
A=M+1
M=1


// label String.intValue.IfElse1
(String.intValue.IfElse1)


// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)


@String.newLine.LT.9
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
(String.newLine.LT.9)
D=!D
@WHILE_END_String.intValue1
D;JNE


@THIS
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
// call Array.get
@7
D=A
@14
M=D
@Array.get
D=A
@13
M=D
@String.intValue.ret.3
D=A
@CALL
0;JMP
(String.intValue.ret.3)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
A=A+1
M=D


@String.newLine.LT.10
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@48
D=D-A
@15
M=D
@DO_LT
0;JMP
(String.newLine.LT.10)
D=!D
@SP
AM=M+1
A=A-1
M=D
@String.newLine.GT.11
D=A
@13
M=D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@57
D=D-A
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.11)
D=!D
@SP
AM=M-1
D=D&M
D=!D
@String.intValue.IfElse2
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
@String.intValue.ret.4
D=A
@CALL
0;JMP
(String.intValue.ret.4)
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
@48
D=D-A
@SP
AM=M-1
D=D+M
@LCL
A=M
M=D


// label String.intValue.IfElse2
(String.intValue.IfElse2)


@THIS
A=M+1
D=M
@LCL
A=M+1
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
@String.intValue.ret.5
D=A
@CALL
0;JMP
(String.intValue.ret.5)


@RETURN
0;JMP


// function String.setInt with 5
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


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
M=0


@String.newLine.LT.12
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
(String.newLine.LT.12)
D=!D
@String.setInt.IfElse1
D;JNE


@45
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


@ARG
A=M+1
M=-M


// label String.setInt.IfElse1
(String.setInt.IfElse1)


@String.newLine.EQ.13
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
(String.newLine.EQ.13)
D=!D
@String.setInt.IfElse2
D;JNE


@48
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


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label String.setInt.IfElse2
(String.setInt.IfElse2)


@10
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
@String.setInt.ret.2
D=A
@CALL
0;JMP
(String.setInt.ret.2)
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
M=0


@ARG
A=M+1
D=M
@LCL
A=M+1
M=D


// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)


@String.newLine.GT.14
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
(String.newLine.GT.14)
D=!D
@WHILE_END_String.setInt1
D;JNE


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
@String.setInt.ret.3
D=A
@CALL
0;JMP
(String.setInt.ret.3)
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
@String.setInt.ret.4
D=A
@CALL
0;JMP
(String.setInt.ret.4)
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
@4
A=D+A
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
@LCL
A=M
D=M
@48
D=D+A
@SP
AM=M+1
A=A-1
M=D
// call Array.set
@8
D=A
@14
M=D
@Array.set
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


@LCL
A=M+1
A=A+1
M=M+1


@LCL
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
@String.setInt.ret.6
D=A
@CALL
0;JMP
(String.setInt.ret.6)
@SP
AM=M-1
D=M
@LCL
A=M+1
M=D


// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1
0;JMP


// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)


@LCL
A=M+1
A=A+1
D=M-1
@LCL
A=M+1
A=A+1
A=A+1
M=D


// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)


@String.newLine.LT.15
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
@DO_LT
0;JMP
(String.newLine.LT.15)
@WHILE_END_String.setInt2
D;JNE


@LCL
D=M
@4
A=D+A
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
AM=M+1
A=A-1
M=D
// call Array.get
@7
D=A
@14
M=D
@Array.get
D=A
@13
M=D
@String.setInt.ret.7
D=A
@CALL
0;JMP
(String.setInt.ret.7)
@3
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
@String.setInt.ret.8
D=A
@CALL
0;JMP
(String.setInt.ret.8)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
A=A+1
A=A+1
M=M-1


// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2
0;JMP


// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)


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
@String.setInt.ret.9
D=A
@CALL
0;JMP
(String.setInt.ret.9)
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


// function String.append with 1
(String.append)
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


// label WHILE_START_String.append1
(WHILE_START_String.append1)


@String.newLine.LT.16
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
A=M+1
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
@String.append.ret.0
D=A
@CALL
0;JMP
(String.append.ret.0)
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
(String.newLine.LT.16)
D=!D
@WHILE_END_String.append1
D;JNE


@ARG
A=M+1
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
@String.append.ret.1
D=A
@CALL
0;JMP
(String.append.ret.1)
@3
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
@String.append.ret.2
D=A
@CALL
0;JMP
(String.append.ret.2)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M
M=M+1


// goto WHILE_START_String.append1
@WHILE_START_String.append1
0;JMP


// label WHILE_END_String.append1
(WHILE_END_String.append1)


@3
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.substring with 2
(String.substring)
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
@SP
AM=M+1
A=A-1
M=D
@String.newLine.LT.18
D=A
@13
M=D
@ARG
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
(String.newLine.LT.18)
D=!D
@SP
AM=M-1
D=D|M
@SP
AM=M+1
A=A-1
M=D
@String.newLine.GT.19
D=A
@13
M=D
@ARG
A=M+1
A=A+1
D=M
A=A-1
D=D-M
@15
M=D
@DO_GT
0;JMP
(String.newLine.GT.19)
D=!D
@SP
AM=M-1
D=D|M
D=!D
@String.substring.IfElse1
D;JNE


D=1
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
@String.substring.ret.0
D=A
@CALL
0;JMP
(String.substring.ret.0)


@RETURN
0;JMP


// label String.substring.IfElse1
(String.substring.IfElse1)


@String.newLine.GT.20
D=A
@13
M=D
@ARG
A=M+1
A=A+1
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
@DO_GT
0;JMP
(String.newLine.GT.20)
D=!D
@String.substring.IfElse2
D;JNE


@THIS
A=M+1
D=M
@ARG
A=M+1
A=A+1
M=D


// label String.substring.IfElse2
(String.substring.IfElse2)


@ARG
A=M+1
A=A+1
D=M
A=A-1
D=D-M
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
@String.substring.ret.1
D=A
@CALL
0;JMP
(String.substring.ret.1)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


@ARG
A=M+1
D=M
@LCL
A=M+1
M=D


// label WHILE_START_String.substring1
(WHILE_START_String.substring1)


@String.newLine.LT.21
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
@DO_LT
0;JMP
(String.newLine.LT.21)
D=!D
@WHILE_END_String.substring1
D;JNE


@LCL
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
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.get
@7
D=A
@14
M=D
@Array.get
D=A
@13
M=D
@String.substring.ret.2
D=A
@CALL
0;JMP
(String.substring.ret.2)
// call String.appendChar
@7
D=A
@14
M=D
@String.appendChar
D=A
@13
M=D
@String.substring.ret.3
D=A
@CALL
0;JMP
(String.substring.ret.3)
@SP
AM=M-1
D=M
@5
M=D


@LCL
A=M+1
M=M+1


// goto WHILE_START_String.substring1
@WHILE_START_String.substring1
0;JMP


// label WHILE_END_String.substring1
(WHILE_END_String.substring1)


@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.equals with 1
(String.equals)
@SP
AM=M+1
A=A-1
M=0


@ARG
A=M
D=M
@3
M=D


@String.newLine.EQ.22
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
@ARG
A=M+1
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
@String.equals.ret.0
D=A
@CALL
0;JMP
(String.equals.ret.0)
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
(String.newLine.EQ.22)
@String.equals.IfElse1
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label String.equals.IfElse1
(String.equals.IfElse1)


@LCL
A=M
M=0


// label WHILE_START_String.equals1
(WHILE_START_String.equals1)


@String.newLine.LT.23
D=A
@13
M=D
@LCL
A=M
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
(String.newLine.LT.23)
D=!D
@WHILE_END_String.equals1
D;JNE


@String.newLine.EQ.24
D=A
@13
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
// call Array.get
@7
D=A
@14
M=D
@Array.get
D=A
@13
M=D
@String.equals.ret.1
D=A
@CALL
0;JMP
(String.equals.ret.1)
@SP
AM=M-1
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
@String.equals.ret.2
D=A
@CALL
0;JMP
(String.equals.ret.2)
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
(String.newLine.EQ.24)
@String.equals.IfElse2
D;JNE


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// label String.equals.IfElse2
(String.equals.IfElse2)


@LCL
A=M
M=M+1


// goto WHILE_START_String.equals1
@WHILE_START_String.equals1
0;JMP


// label WHILE_END_String.equals1
(WHILE_END_String.equals1)


@SP
AM=M+1
A=A-1
M=-1


@RETURN
0;JMP


// function String.clear with 0
(String.clear)


@ARG
A=M
D=M
@3
M=D


@THIS
A=M+1
M=0


D=0
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.isEmpty with 0
(String.isEmpty)


@ARG
A=M
D=M
@3
M=D


@String.newLine.EQ.25
D=A
@13
M=D
@THIS
A=M+1
D=M
@15
M=D
@DO_EQ
0;JMP
(String.newLine.EQ.25)
@SP
AM=M+1
A=A-1
M=D


@RETURN
0;JMP


// function String.shrinkToFit with 0
(String.shrinkToFit)


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
@THIS
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D
// call Array.resize
@7
D=A
@14
M=D
@Array.resize
D=A
@13
M=D
@String.shrinkToFit.ret.0
D=A
@CALL
0;JMP
(String.shrinkToFit.ret.0)
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


@Sys.error.GT.0
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
(Sys.error.GT.0)
D=!D
@WHILE_END_Sys.wait1
D;JNE


@ARG
A=M
M=M-1


@100
D=A
@LCL
A=M
M=D


// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)


@Sys.error.GT.1
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
(Sys.error.GT.1)
D=!D
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


