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
//FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP
AM=M+1
A=A-1
M=0


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//LabelInstruction{label='WHILE_START_Screen.clearScreen1}
// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 8192"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.clearScreen1}}
@LCL
A=M
D=M
@8192
D=D-A
@15
M=D
@Screen.clearScreen.LT.2
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.2)
@15
M=D
@Screen.clearScreen.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.1)
@WHILE_END_Screen.clearScreen1
D;JNE


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=M+1


//GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1
0;JMP


//LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={}}
// function String.newLine with 0
(String.newLine)


//PushInstruction("constant 128")
@128
D=A
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={}}
// function Math.abs with 0
(Math.abs)


//CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{calleeFunction='Math.max', numArgs=2, funcMapping={Math.abs=0}, currentFunction='Math.abs'}}
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


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={}}
// function Output.backSpace with 0
(Output.backSpace)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.backSpace.IfElse1}}
@Output.1
D=M
@15
M=D
@Output.backSpace.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.2)
@15
M=D
@Output.backSpace.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.1)
@Output.backSpace.IfElse1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=Output.2} END PPP 

@Output.2
M=M-1


//PPP : push PushInstruction("constant 63")
//pop PopInstruction{address=Output.1} END PPP 

@63
D=A
@Output.1
M=D


//GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1
0;JMP


//LabelInstruction{label='Output.backSpace.IfElse1}
// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=Output.1} END PPP 

@Output.1
M=M-1


//LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)


//PPP : push CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=1}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=2}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=3}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=4}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=5}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=6}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=7}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=8}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=9}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=10}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=11}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=12}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=13}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=14}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=15}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=16}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=17}, currentFunction='Main.main'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={}}
// function Memory.peek with 0
(Memory.peek)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M
D=M
@4
M=D


//PushInstruction("that 0")
@THAT
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={}}
// function Sys.error with 0
(Sys.error)


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.printInt', numArgs=1, funcMapping={Sys.error=0}, currentFunction='Sys.error'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Sys.error=1}, currentFunction='Sys.error'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.error=2}, currentFunction='Sys.error'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP
AM=M+1
A=A-1
M=0


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Keyboard.readLine', numArgs=1, funcMapping={Keyboard.readInt=0}, currentFunction='Keyboard.readInt'}}
//pop PopInstruction{address=local 0} END PPP 

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


//CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.intValue', numArgs=1, funcMapping={Keyboard.readInt=1}, currentFunction='Keyboard.readInt'}}
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


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={}}
// function Array.dispose with 0
(Array.dispose)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Array.dispose=0}, currentFunction='Array.dispose'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


