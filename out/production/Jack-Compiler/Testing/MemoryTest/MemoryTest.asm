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
\\FunctionInstruction{functionName='Main.main', numLocals=5, funcMapping={}}
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


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8000"), PushInstruction("constant 333")], call=CallInstruction{calleeFunction='Memory.poke', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8000")], call=CallInstruction{calleeFunction='Memory.peek', numArgs=1, funcMapping={Main.main=1}, currentFunction='Main.main'}}
\\pop PopInstruction{address=local 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8001"), BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)], call=CallInstruction{calleeFunction='Memory.poke', numArgs=2, funcMapping={Main.main=2}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Main.main=3}, currentFunction='Main.main'}}
\\pop PopInstruction{address=local 2} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 222")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8002"), PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.poke', numArgs=2, funcMapping={Main.main=4}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=0


\\PPP : push CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Main.main=5}, currentFunction='Main.main'}}
\\pop PopInstruction{address=local 3} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
D=M
@2
D=D+A
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 3"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("constant 100"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 3"),
\\            right:
\\                PushInstruction("local 2"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Main.main.IfElse1}}
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


\\PPP : push PushInstruction("constant 1")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=1


\\GotoInstruction{label='Main.main.IfElseEND1}
// goto Main.main.IfElseEND1
@Main.main.IfElseEND1
0;JMP


\\LabelInstruction{label='Main.main.IfElse1}
// label Main.main.IfElse1
(Main.main.IfElse1)


\\LabelInstruction{label='Main.main.IfElseEND1}
// label Main.main.IfElseEND1
(Main.main.IfElseEND1)


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8003"), BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("local 1"),
\\    binaryOp: "ADD"
\\)], call=CallInstruction{calleeFunction='Memory.poke', numArgs=2, funcMapping={Main.main=6}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=0


\\PPP : push CallGroup{pushes=[PushInstruction("constant 500")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Main.main=7}, currentFunction='Main.main'}}
\\pop PopInstruction{address=local 4} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
D=M
@2
D=D+A
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 4"),
\\    right:
\\        PushInstruction("constant 499"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("that 0"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 4"),
\\            right:
\\                PushInstruction("local 2"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Main.main.IfElse2}}
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


\\PPP : push PushInstruction("constant 1")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=1


\\GotoInstruction{label='Main.main.IfElseEND2}
// goto Main.main.IfElseEND2
@Main.main.IfElseEND2
0;JMP


\\LabelInstruction{label='Main.main.IfElse2}
// label Main.main.IfElse2
(Main.main.IfElse2)


\\LabelInstruction{label='Main.main.IfElseEND2}
// label Main.main.IfElseEND2
(Main.main.IfElseEND2)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 4"),
\\            right:
\\                PushInstruction("local 3"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Main.main.IfElse3}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 1"),
\\    right:
\\        PushInstruction("constant 10"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
D=M
@10
D=D+A
@LCL
A=M+1
M=D


\\GotoInstruction{label='Main.main.IfElseEND3}
// goto Main.main.IfElseEND3
@Main.main.IfElseEND3
0;JMP


\\LabelInstruction{label='Main.main.IfElse3}
// label Main.main.IfElse3
(Main.main.IfElse3)


\\LabelInstruction{label='Main.main.IfElseEND3}
// label Main.main.IfElseEND3
(Main.main.IfElseEND3)


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8004"), BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("local 1"),
\\    binaryOp: "ADD"
\\)], call=CallInstruction{calleeFunction='Memory.poke', numArgs=2, funcMapping={Main.main=8}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={Main.main=9}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={Main.main=10}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=0


\\PPP : push CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Main.main=11}, currentFunction='Main.main'}}
\\pop PopInstruction{address=local 3} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 4"),
\\    right:
\\        PushInstruction("constant 499"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@4
A=D+A
D=M
@499
D=D+A
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 3"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("constant 90"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 3"),
\\            right:
\\                PushInstruction("local 4"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Main.main.IfElse4}}
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


\\PPP : push PushInstruction("constant 1")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=1


\\GotoInstruction{label='Main.main.IfElseEND4}
// goto Main.main.IfElseEND4
@Main.main.IfElseEND4
0;JMP


\\LabelInstruction{label='Main.main.IfElse4}
// label Main.main.IfElse4
(Main.main.IfElse4)


\\LabelInstruction{label='Main.main.IfElseEND4}
// label Main.main.IfElseEND4
(Main.main.IfElseEND4)


\\PPP : push CallGroup{pushes=[PushInstruction("constant 8005"), BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("local 1"),
\\    binaryOp: "ADD"
\\)], call=CallInstruction{calleeFunction='Memory.poke', numArgs=2, funcMapping={Main.main=12}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={Main.main=13}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={Main.main=14}, currentFunction='Main.main'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\        PushInstruction("constant 7"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 0} END PPP 

@2055
D=A
@LCL
A=M
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("constant 16384"),
\\            right:
\\                PushInstruction("local 0"),
\\            binaryOp: "SUB"
\\        ),
\\    right:
\\        PushInstruction("constant 5"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 1")
\\pop PopInstruction{address=that 0} END PPP 

@LCL
A=M
D=M+1
@4
M=D
@THAT
A=M
M=1


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\        PushInstruction("constant 6"),
\\    binaryOp: "ADD"
\\), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=1}, currentFunction='Memory.init'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
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


\\PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=local 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\        PushInstruction("local 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M
D=M
@2048
D=D+A
@LCL
A=M+1
M=D


\\PPP : push CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=1, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=local 2} END PPP 

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


\\LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 2"),
\\            right:
\\                PushInstruction("constant 0"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.alloc1}}
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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    BinaryPushGroup(
\\                        left:
\\                            PushInstruction("local 0"),
\\                        right:
\\                            PushInstruction("constant 1"),
\\                        binaryOp: "ADD"
\\                    ),
\\                right:
\\                    PushInstruction("constant 7"),
\\                binaryOp: "LT"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse1}}
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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)


\\LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=M+1


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\        PushInstruction("local 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M
D=M
@2048
D=D+A
@LCL
A=M+1
M=D


\\PPP : push CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=local 2} END PPP 

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


\\GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1
0;JMP


\\LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)


\\PPP : push CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}},
\\    binaryOp: "ADD"
\\), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
D=M
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("that 0"),
\\    right:
\\        PushInstruction("argument 0"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=local 3} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 3"),
\\            right:
\\                PushInstruction("constant 5"),
\\            binaryOp: "GT"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

@LCL
A=M+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
M=0


\\PPP : push CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 2"),
\\            right:
\\                PushInstruction("argument 0"),
\\            binaryOp: "ADD"
\\        ),
\\    right:
\\        PushInstruction("constant 5"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 4} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 4"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 3"),
\\    right:
\\        PushInstruction("constant 5"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 4"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}},
\\    binaryOp: "ADD"
\\), PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2
0;JMP


\\LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

@LCL
A=M+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
M=0


\\PPP : push CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=11, Memory.init=2}, currentFunction='Memory.alloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)


\\BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 4"),
\\    binaryOp: "ADD"
\\)
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


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=12, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP
AM=M+1
A=A-1
M=0


\\PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=12, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}}
\\pop PopInstruction{address=local 0} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            PushInstruction("local 0")),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.calloc.IfElse1}
// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)


\\LabelInstruction{label='Memory.calloc.IfElseEND1}
// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)


\\LabelInstruction{label='WHILE_START_Memory.calloc1}
// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("argument 0"),
\\            right:
\\                PushInstruction("constant 0"),
\\            binaryOp: "GT"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.calloc1}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=argument 0} END PPP 

@ARG
A=M
M=M-1


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("argument 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1
0;JMP


\\LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)


\\PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 4"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=local 0} END PPP 

@ARG
A=M
D=M
@4
D=D-A
@LCL
A=M
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 1")
\\pop PopInstruction{address=that 0} END PPP 

@LCL
A=M
D=M+1
@4
M=D
@THAT
A=M
M=1


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@2
D=D+A
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 1} END PPP 

@THAT
A=M
D=M
@LCL
A=M+1
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 2} END PPP 

@THAT
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("local 1"),
\\                right:
\\                    PushInstruction("constant 0"),
\\                binaryOp: "EQ"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse1}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 1"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
D=M+1
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("that 0"),
\\            right:
\\                PushInstruction("constant 1"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse2}}
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


\\PPP : push CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
\\    binaryOp: "ADD"
\\), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 1"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
D=M
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 1"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("that 0"),
\\            right:
\\                PushInstruction("that 0"),
\\            binaryOp: "ADD"
\\        ),
\\    right:
\\        PushInstruction("constant 5"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push PushInstruction("local 1")
\\pop PopInstruction{address=local 0} END PPP 

@LCL
A=M+1
D=M
@LCL
A=M
M=D


\\GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2
0;JMP


\\LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)


\\LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)


\\GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)


\\LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("local 2"),
\\                right:
\\                    PushInstruction("constant 0"),
\\                binaryOp: "EQ"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse3}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 2"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
D=M+1
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("that 0"),
\\            right:
\\                PushInstruction("constant 1"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse4}}
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


\\PPP : push CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
\\    binaryOp: "ADD"
\\), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("that 0"),
\\            right:
\\                PushInstruction("that 0"),
\\            binaryOp: "ADD"
\\        ),
\\    right:
\\        PushInstruction("constant 5"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=7, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4
0;JMP


\\LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)


\\LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)


\\GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3
0;JMP


\\LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)


\\LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)


\\PPP : push CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 2048"),
\\    right:
\\CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
\\    binaryOp: "ADD"
\\), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("argument 0"),
\\            right:
\\                PushInstruction("constant 0"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse1}}
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


\\CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
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


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)


\\LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "SUB"
\\)
\\pop PopInstruction{address=local 3} END PPP 

@ARG
A=M
D=M-1
@LCL
A=M+1
A=A+1
A=A+1
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 3"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
D=M
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


\\PPP : push CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
\\pop PopInstruction{address=local 1} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 1"),
\\            right:
\\                PushInstruction("constant 0"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse2}}
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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2
0;JMP


\\LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)


\\LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("local 0"),
\\                right:
\\                    PushInstruction("argument 1"),
\\                binaryOp: "GT"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse3}}
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


\\PPP : push PushInstruction("local 0")
\\pop PopInstruction{address=local 2} END PPP 

@LCL
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


\\GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3
0;JMP


\\LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)


\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=local 2} END PPP 

@ARG
A=M+1
D=M
@LCL
A=M+1
A=A+1
M=D


\\LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)


\\PPP : push CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=3, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
\\pop PopInstruction{address=temp 0} END PPP 

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


\\PushInstruction("local 1")
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP
AM=M+1
A=A-1
M=0


\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


\\LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("local 0"),
\\            right:
\\                PushInstruction("argument 2"),
\\            binaryOp: "LT"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.copy1}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("local 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("local 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=M+1


\\GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1
0;JMP


\\LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("that 0"),
\\                right:
\\                    PushInstruction("constant 0"),
\\                binaryOp: "EQ"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse1}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("argument 1"),
\\            right:
\\                PushInstruction("constant 2"),
\\            binaryOp: "ADD"
\\        ),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("that 0"),
\\                right:
\\                    PushInstruction("constant 0"),
\\                binaryOp: "EQ"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse2}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("argument 1"),
\\            right:
\\                PushInstruction("constant 3"),
\\            binaryOp: "ADD"
\\        ),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2
0;JMP


\\LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)


\\LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP
AM=M+1
A=A-1
M=0


\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


\\LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                BinaryPushGroup(
\\                    left:
\\                        PushInstruction("local 0"),
\\                    right:
\\                        PushInstruction("constant 7"),
\\                    binaryOp: "LT"
\\                ),
\\            right:
\\                UnaryPushGroup(NOT,
\\                    BinaryPushGroup(
\\                        left:
\\                            PushInstruction("that 0"),
\\                        right:
\\                            PushInstruction("constant 0"),
\\                        binaryOp: "EQ"
\\                    )),
\\            binaryOp: "AND"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}}
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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("argument 0"),
\\                right:
\\CallGroup{pushes=[BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=0, Memory.remove_node=0}, currentFunction='Memory.getBinIndex'}},
\\                binaryOp: "GT"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.getBinIndex.IfElse1}}
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


\\PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)


\\LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=M+1


\\GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1
0;JMP


\\LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)


\\BinaryPushGroup(
\\    left:
\\        PushInstruction("constant 7"),
\\    right:
\\        PushInstruction("constant 1"),
\\    binaryOp: "SUB"
\\)
@7
D=A
@SP
AM=M+1
A=A-1
M=D-1


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP
AM=M+1
A=A-1
M=0


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M
D=M
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("that 0"),
\\                right:
\\                    PushInstruction("argument 1"),
\\                binaryOp: "LT"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse1}}
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


\\PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.get_best_fit.IfElse1}
// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)


\\LabelInstruction{label='Memory.get_best_fit.IfElseEND1}
// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)


\\LabelInstruction{label='WHILE_START_Memory.get_best_fit1}
// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("that 0"),
\\                right:
\\                    PushInstruction("constant 0"),
\\                binaryOp: "EQ"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            BinaryPushGroup(
\\                left:
\\                    PushInstruction("that 0"),
\\                right:
\\                    PushInstruction("argument 1"),
\\                binaryOp: "LT"
\\            )),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse2}}
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


\\PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2
0;JMP


\\LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)


\\LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)


\\GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1
0;JMP


\\LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("that 0"),
\\            right:
\\                PushInstruction("constant 4"),
\\            binaryOp: "ADD"
\\        ),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M
D=M
@4
M=D


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("that 0"),
\\            right:
\\                PushInstruction("constant 0"),
\\            binaryOp: "EQ"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse1}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1
0;JMP


\\LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)


\\LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M
D=M
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


\\PPP : push PushInstruction("constant 0")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=0


\\LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                UnaryPushGroup(NOT,
\\                    BinaryPushGroup(
\\                        left:
\\                            PushInstruction("local 0"),
\\                        right:
\\                            PushInstruction("constant 0"),
\\                        binaryOp: "EQ"
\\                    )),
\\            right:
\\                UnaryPushGroup(NOT,
\\                    BinaryPushGroup(
\\                        left:
\\                            PushInstruction("that 0"),
\\                        right:
\\                            PushInstruction("that 0"),
\\                        binaryOp: "GT"
\\                    )),
\\            binaryOp: "AND"
\\        ),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.add_node1}}
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


\\PPP : push PushInstruction("local 0")
\\pop PopInstruction{address=local 1} END PPP 

@LCL
A=M
D=M
@LCL
A=M+1
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


\\GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1
0;JMP


\\LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        UnaryPushGroup(NOT,
\\            PushInstruction("local 1")),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M
D=M
@4
M=D


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("that 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        BinaryPushGroup(
\\            left:
\\                PushInstruction("argument 0"),
\\            right:
\\                PushInstruction("constant 0"),
\\            binaryOp: "ADD"
\\        ),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2
0;JMP


\\LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("local 0")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 1"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("local 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\ConditionalGroup{push=BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "EQ"
\\), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
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


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 0"),
\\    right:
\\        PushInstruction("constant 2"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3
0;JMP


\\LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)


\\LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("local 1"),
\\    right:
\\        PushInstruction("constant 3"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 
\\
\\PPP : push PushInstruction("argument 1")
\\pop PopInstruction{address=that 0} END PPP 

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


\\PushInstruction("constant 0")
D=0
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


\\FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)


\\PPP : push BinaryPushGroup(
\\    left:
\\        PushInstruction("argument 0"),
\\    right:
\\        PushInstruction("constant 0"),
\\    binaryOp: "ADD"
\\)
\\pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M
D=M
@4
M=D


\\PushInstruction("that 0")
@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


\\ReturnInstruction{}
@RETURN
0;JMP


