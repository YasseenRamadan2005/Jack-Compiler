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
//FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)


//PPP : push UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//pop PopInstruction{address=Screen.0} END PPP 

@Screen.0
M=-1


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=Screen.0} END PPP 

@ARG
A=M
D=M
@Screen.0
M=D


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 32")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=0}, currentFunction='Screen.drawPixel'}},
//            right:
//CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=0}, currentFunction='Screen.drawPixel'}},
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//pop PopInstruction{address=local 1} END PPP 

@ARG
A=M
D=M
@15
D=D&A
@LCL
A=M+1
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("static 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawPixel.IfElse1}}
@Screen.0
D=M
@15
M=D
@Screen.drawPixel.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawPixel.EQ.2)
D=!D
@15
M=D
@Screen.drawPixel.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawPixel.EQ.1)
@Screen.drawPixel.IfElse1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawPixel'}},
//    binaryOp: "OR"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1
0;JMP


//LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=5}, currentFunction='Screen.drawPixel'}},
//NOT),
//    binaryOp: "AND"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=6}}
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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 3"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//pop PopInstruction{address=local 1} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("argument 2"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse1}}
@ARG
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=M-D
@15
M=D
@Screen.drawLine.LT.5
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.drawLine.LT.5)
@15
M=D
@Screen.drawLine.EQ.4
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse1
D;JNE


//PPP : push PushInstruction("constant 1")
//pop PopInstruction{address=local 2} END PPP 

@LCL
A=M+1
A=A+1
M=1


//GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1
0;JMP


//LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)


//PPP : push UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//pop PopInstruction{address=local 2} END PPP 

@LCL
A=M+1
A=A+1
M=-1


//LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("argument 3"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse2}}
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
@Screen.drawLine.LT.8
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.drawLine.LT.8)
@15
M=D
@Screen.drawLine.EQ.7
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.7)
@Screen.drawLine.IfElse2
D;JNE


//PPP : push PushInstruction("constant 1")
//pop PopInstruction{address=local 3} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
M=1


//GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2
0;JMP


//LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)


//PPP : push UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//pop PopInstruction{address=local 3} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
M=-1


//LabelInstruction{label='Screen.drawLine.IfElseEND2}
// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 4} END PPP 

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


//LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("constant 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0
@WHILE_END_Screen.drawLine1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("argument 2"),
//                    binaryOp: "EQ"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("argument 3"),
//                    binaryOp: "EQ"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse3}}
@ARG
A=M+1
A=A+1
D=M
A=A-1
A=A-1
D=M-D
@15
M=D
@Screen.drawLine.EQ.12
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.12)
@SP
AM=M+1
A=A-1
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
@Screen.drawLine.EQ.13
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.13)
@SP
AM=M-1
D=D&M
@15
M=D
@Screen.drawLine.EQ.11
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.11)
@Screen.drawLine.IfElse3
D;JNE


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3
0;JMP


//LabelInstruction{label='Screen.drawLine.IfElse3}
// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)


//LabelInstruction{label='Screen.drawLine.IfElseEND3}
// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 4"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 5} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 5"),
//                    right:
//                        PushInstruction("local 1"),
//                    binaryOp: "ADD"
//                ),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse4}}
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
@Screen.drawLine.GT.16
D=A
@13
M=D
@DO_GT
0;JMP
(Screen.drawLine.GT.16)
@15
M=D
@Screen.drawLine.EQ.15
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.15)
@Screen.drawLine.IfElse4
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 4} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=argument 0} END PPP 

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


//GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4
0;JMP


//LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)


//LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 5"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse5}}
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
@Screen.drawLine.LT.19
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.drawLine.LT.19)
@15
M=D
@Screen.drawLine.EQ.18
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawLine.EQ.18)
@Screen.drawLine.IfElse5
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 4} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=argument 1} END PPP 

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


//GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5
0;JMP


//LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)


//LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)


//GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1
0;JMP


//LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP
AM=M+1
A=A-1
M=0


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=local 0} END PPP 

@ARG
A=M
D=M
@LCL
A=M
M=D


//LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawHorizontalLine1}}
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
@Screen.drawHorizontalLine.GT.22
D=A
@13
M=D
@DO_GT
0;JMP
(Screen.drawHorizontalLine.GT.22)
D=!D
@15
M=D
@Screen.drawHorizontalLine.EQ.21
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawHorizontalLine.EQ.21)
@WHILE_END_Screen.drawHorizontalLine1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawHorizontalLine'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1
0;JMP


//LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
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


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//PPP : push PushInstruction("argument 2")
//pop PopInstruction{address=local 1} END PPP 

@ARG
A=M+1
A=A+1
D=M
@LCL
A=M+1
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 1"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 2} END PPP 

@ARG
A=M+1
A=A+1
D=M-1
D=-D
@LCL
A=M+1
A=A+1
M=D


//LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("local 1"),
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawCircle1}}
@LCL
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@Screen.drawCircle.GT.25
D=A
@13
M=D
@DO_GT
0;JMP
(Screen.drawCircle.GT.25)
D=!D
@15
M=D
@Screen.drawCircle.EQ.24
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawCircle.EQ.24)
@WHILE_END_Screen.drawCircle1
D;JNE


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "SUB"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "SUB"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=1, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=2, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//), BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle.IfElse1}}
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@Screen.drawCircle.LT.28
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.drawCircle.LT.28)
@15
M=D
@Screen.drawCircle.EQ.27
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawCircle.EQ.27)
@Screen.drawCircle.IfElse1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("local 0"),
//                    binaryOp: "ADD"
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 2} END PPP 

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


//GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1
0;JMP


//LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 0"),
//                            right:
//                                PushInstruction("local 1"),
//                            binaryOp: "SUB"
//                        ),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 0"),
//                            right:
//                                PushInstruction("local 1"),
//                            binaryOp: "SUB"
//                        ),
//                    binaryOp: "ADD"
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 2} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=M-1


//LabelInstruction{label='Screen.drawCircle.IfElseEND1}
// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)


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


//GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1
0;JMP


//LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
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


//PPP : push UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//pop PopInstruction{address=local 9} END PPP 

@LCL
D=M
@9
A=D+A
M=-1


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.0
D=!M
@15
M=D
@Screen.drawRectangle.EQ.29
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.29)
@Screen.drawRectangle.IfElse1
D;JNE


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 9} END PPP 

@LCL
D=M
@9
A=D+A
M=0


//GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1
0;JMP


//LabelInstruction{label='Screen.drawRectangle.IfElse1}
// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)


//LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)


//PPP : push PushInstruction("argument 1")
//pop PopInstruction{address=local 0} END PPP 

@ARG
A=M+1
D=M
@LCL
A=M
M=D


//LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("argument 3"),
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawRectangle1}}
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
@Screen.drawRectangle.GT.32
D=A
@13
M=D
@DO_GT
0;JMP
(Screen.drawRectangle.GT.32)
D=!D
@15
M=D
@Screen.drawRectangle.EQ.31
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.31)
@WHILE_END_Screen.drawRectangle1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//pop PopInstruction{address=local 1} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//pop PopInstruction{address=local 2} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//pop PopInstruction{address=local 3} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//pop PopInstruction{address=local 4} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=2, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//pop PopInstruction{address=local 5} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse2}}
@LCL
A=M+1
A=A+1
D=M
A=A-1
D=M-D
@15
M=D
@Screen.drawRectangle.EQ.35
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.35)
@15
M=D
@Screen.drawRectangle.EQ.34
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.34)
@Screen.drawRectangle.IfElse2
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}},
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "SUB"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}},
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "SUB"
//        ),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 6} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 7} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0
D=M
@15
M=D
@Screen.drawRectangle.EQ.36
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.36)
@Screen.drawRectangle.IfElse3
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3
0;JMP


//LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)


//GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2
0;JMP


//LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)


//PPP : push UnaryPushGroup(    BinaryPushGroup(
//        left:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=5, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}},
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "SUB"
//    ),
//NOT)
//pop PopInstruction{address=local 6} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 7} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0
D=M
@15
M=D
@Screen.drawRectangle.EQ.37
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.37)
@Screen.drawRectangle.IfElse4
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4
0;JMP


//LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//LabelInstruction{label='Screen.drawRectangle.IfElseEND4}
// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 8} END PPP 

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


//LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 8"),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawRectangle2}}
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
@Screen.drawRectangle.LT.40
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.drawRectangle.LT.40)
@15
M=D
@Screen.drawRectangle.EQ.39
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.39)
@WHILE_END_Screen.drawRectangle2
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 8"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 7} END PPP 

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


//PPP : push PushInstruction("local 9")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 8} END PPP 

@LCL
D=M
@8
A=D+A
M=M+1


//GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2
0;JMP


//LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)


//PPP : push BinaryPushGroup(
//    left:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=6, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}},
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 6} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 7} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0
D=M
@15
M=D
@Screen.drawRectangle.EQ.41
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.drawRectangle.EQ.41)
@Screen.drawRectangle.IfElse5
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5
0;JMP


//LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
D=M
@7
A=D+A
D=M
@16384
D=D+A
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//LabelInstruction{label='Screen.drawRectangle.IfElseEND5}
// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)


//LabelInstruction{label='Screen.drawRectangle.IfElseEND2}
// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)


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


//GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1
0;JMP


//LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=6}}
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
@Screen.clearScreen.LT.44
D=A
@13
M=D
@DO_LT
0;JMP
(Screen.clearScreen.LT.44)
@15
M=D
@Screen.clearScreen.EQ.43
D=A
@13
M=D
@DO_EQ
0;JMP
(Screen.clearScreen.EQ.43)
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


//FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)


//PPP : push CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}}
//pop PopInstruction{address=pointer 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new.IfElse1}}
@ARG
A=M
D=M
@15
M=D
@String.new.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(String.new.EQ.2)
@15
M=D
@String.new.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(String.new.EQ.1)
@String.new.IfElse1
D;JNE


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=this 0} END PPP 

@THIS
A=M
M=0


//GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1
0;JMP


//LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}}
//pop PopInstruction{address=this 0} END PPP 

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


//LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=this 2} END PPP 

@ARG
A=M
D=M
@THIS
A=M+1
A=A+1
M=D


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=this 1} END PPP 

@THIS
A=M+1
M=0


//PushInstruction("pointer 0")
@3
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("this 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.dispose.IfElse1}}
@THIS
A=M
D=M
@15
M=D
@String.dispose.EQ.5
D=A
@13
M=D
@DO_EQ
0;JMP
(String.dispose.EQ.5)
D=!D
@15
M=D
@String.dispose.EQ.4
D=A
@13
M=D
@DO_EQ
0;JMP
(String.dispose.EQ.4)
@String.dispose.IfElse1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1
0;JMP


//LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)


//LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PushInstruction("this 1")
@THIS
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

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


//FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push PushInstruction("argument 2")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP
AM=M+1
A=A-1
M=0


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 1"),
//            right:
//                PushInstruction("this 2"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar.IfElse1}}
@THIS
A=M+1
A=A+1
D=M
A=A-1
D=M-D
@15
M=D
@String.appendChar.EQ.8
D=A
@13
M=D
@DO_EQ
0;JMP
(String.appendChar.EQ.8)
@15
M=D
@String.appendChar.EQ.7
D=A
@13
M=D
@DO_EQ
0;JMP
(String.appendChar.EQ.7)
@String.appendChar.IfElse1
D;JNE


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=this 2} END PPP 

@THIS
A=M+1
A=A+1
D=M
D=D+M
@THIS
A=M+1
A=A+1
M=D


//PPP : push PushInstruction("local 0")
//pop PopInstruction{address=this 0} END PPP 

@LCL
A=M
D=M
@THIS
A=M
M=D


//GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1
0;JMP


//LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)


//LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("this 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=this 1} END PPP 

@THIS
A=M+1
M=M+1


//PushInstruction("pointer 0")
@3
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=this 1} END PPP 

@THIS
A=M+1
M=M-1


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
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


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push PushInstruction("constant 1")
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=1


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("this 1"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_String.intValue1}}
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
@String.intValue.LT.11
D=A
@13
M=D
@DO_LT
0;JMP
(String.intValue.LT.11)
@15
M=D
@String.intValue.EQ.10
D=A
@13
M=D
@DO_EQ
0;JMP
(String.intValue.EQ.10)
@WHILE_END_String.intValue1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.intValue'}},
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("constant 48"),
//            binaryOp: "SUB"
//        ),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=M+1


//GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1
0;JMP


//LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
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


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=this 1} END PPP 

@THIS
A=M+1
M=0


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 4} END PPP 

@LCL
D=M
@4
A=D+A
M=0


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt.IfElse1}}
@ARG
A=M+1
D=M
@15
M=D
@String.setInt.EQ.14
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.14)
@15
M=D
@String.setInt.EQ.13
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.13)
@String.setInt.IfElse1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1
0;JMP


//LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)


//LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt.IfElse2}}
@ARG
A=M+1
D=M
@15
M=D
@String.setInt.LT.17
D=A
@13
M=D
@DO_LT
0;JMP
(String.setInt.LT.17)
@15
M=D
@String.setInt.EQ.16
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.16)
@String.setInt.IfElse2
D;JNE


//PPP : push PushInstruction("constant 1")
//pop PopInstruction{address=local 4} END PPP 

@LCL
D=M
@4
A=D+A
M=1


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "LT"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("argument 1"),
//                            right:
//                                PushInstruction("constant 32767"),
//                            binaryOp: "AND"
//                        ),
//                    right:
//                        PushInstruction("constant 32767"),
//                    binaryOp: "EQ"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt.IfElse3}}
@ARG
A=M+1
D=M
@15
M=D
@String.setInt.LT.21
D=A
@13
M=D
@DO_LT
0;JMP
(String.setInt.LT.21)
@SP
AM=M+1
A=A-1
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
@String.setInt.EQ.22
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.22)
@SP
AM=M-1
D=D&M
@15
M=D
@String.setInt.EQ.20
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.20)
@String.setInt.IfElse3
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=4, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=5, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=6, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3
0;JMP


//LabelInstruction{label='String.setInt.IfElse3}
// label String.setInt.IfElse3
(String.setInt.IfElse3)


//LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)


//PPP : push UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//pop PopInstruction{address=argument 1} END PPP 

@ARG
A=M+1
M=-M


//GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2
0;JMP


//LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)


//LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)


//PPP : push PushInstruction("argument 1")
//pop PopInstruction{address=local 2} END PPP 

@ARG
A=M+1
D=M
@LCL
A=M+1
A=A+1
M=D


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 3} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
M=0


//LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt1}}
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@String.setInt.GT.25
D=A
@13
M=D
@DO_GT
0;JMP
(String.setInt.GT.25)
@15
M=D
@String.setInt.EQ.24
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.24)
@WHILE_END_String.setInt1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=local 2} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 3} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
M=M+1


//GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1
0;JMP


//LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)


//PPP : push CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=local 5} END PPP 

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


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=0


//LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt2}}
@ARG
A=M+1
D=M
@15
M=D
@String.setInt.GT.28
D=A
@13
M=D
@DO_GT
0;JMP
(String.setInt.GT.28)
@15
M=D
@String.setInt.EQ.27
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.27)
@WHILE_END_String.setInt2
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}, PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}},
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 48"),
//    binaryOp: "ADD"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=argument 1} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=M+1


//GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2
0;JMP


//LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 4"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt.IfElse4}}
@LCL
D=M
@4
A=D+A
D=M-1
@15
M=D
@String.setInt.EQ.31
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.31)
@15
M=D
@String.setInt.EQ.30
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.30)
@String.setInt.IfElse4
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4
0;JMP


//LabelInstruction{label='String.setInt.IfElse4}
// label String.setInt.IfElse4
(String.setInt.IfElse4)


//LabelInstruction{label='String.setInt.IfElseEND4}
// label String.setInt.IfElseEND4
(String.setInt.IfElseEND4)


//LabelInstruction{label='WHILE_START_String.setInt3}
// label WHILE_START_String.setInt3
(WHILE_START_String.setInt3)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt3}}
@LCL
A=M+1
D=M
@15
M=D
@String.setInt.GT.34
D=A
@13
M=D
@DO_GT
0;JMP
(String.setInt.GT.34)
@15
M=D
@String.setInt.EQ.33
D=A
@13
M=D
@DO_EQ
0;JMP
(String.setInt.EQ.33)
@WHILE_END_String.setInt3
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=M-1


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("that 0")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3
0;JMP


//LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)


//PPP : push CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)


//PushInstruction("constant 129")
@129
D=A
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)


//PushInstruction("constant 34")
@34
D=A
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
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


//FunctionInstruction{functionName='Math.init', numLocals=0, funcMapping={}}
// function Math.init with 0
(Math.init)


//PPP : push CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}}
//pop PopInstruction{address=Math.0} END PPP 

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


//PPP : push PushInstruction("constant 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

@Math.0
D=M
@4
M=D
@THAT
A=M
M=1


//PPP : push PushInstruction("constant 2")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

@Math.0
D=M+1
@4
M=D
@2
D=A
@THAT
A=M
M=D


//PPP : push PushInstruction("constant 4")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 8")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 16")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 32")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 64")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 128")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 256")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 512")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 1024")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 2048")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 11"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 4096")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 12"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 8192")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 13"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 16384")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 14"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("constant 16384"),
//    binaryOp: "ADD"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)


//BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("that 0"),
//    binaryOp: "AND"
//)
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


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse1}}
@ARG
A=M
D=M
@15
M=D
@Math.multiply.EQ.3
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.3)
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@15
M=D
@Math.multiply.EQ.4
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.4)
@SP
AM=M-1
D=D|M
@15
M=D
@Math.multiply.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.2)
@Math.multiply.IfElse1
D;JNE


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1
0;JMP


//LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)


//LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse2}}
@ARG
A=M
D=M-1
@15
M=D
@Math.multiply.EQ.7
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.7)
@15
M=D
@Math.multiply.EQ.6
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.6)
@Math.multiply.IfElse2
D;JNE


//PushInstruction("argument 1")
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2
0;JMP


//LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)


//LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse3}}
@ARG
A=M+1
D=M-1
@15
M=D
@Math.multiply.EQ.10
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.10)
@15
M=D
@Math.multiply.EQ.9
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.9)
@Math.multiply.IfElse3
D;JNE


//PushInstruction("argument 0")
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3
0;JMP


//LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)


//LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse4}}
@ARG
A=M
D=M
@2
D=D-A
@15
M=D
@Math.multiply.EQ.13
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.13)
@15
M=D
@Math.multiply.EQ.12
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.12)
@Math.multiply.IfElse4
D;JNE


//BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG
A=M+1
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4
0;JMP


//LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)


//LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse5}}
@ARG
A=M+1
D=M
@2
D=D-A
@15
M=D
@Math.multiply.EQ.16
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.16)
@15
M=D
@Math.multiply.EQ.15
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.15)
@Math.multiply.IfElse5
D;JNE


//BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG
A=M
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5
0;JMP


//LabelInstruction{label='Math.multiply.IfElse5}
// label Math.multiply.IfElse5
(Math.multiply.IfElse5)


//LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)


//PPP : push PushInstruction("constant 1")
//pop PopInstruction{address=local 2} END PPP 

@LCL
A=M+1
A=A+1
M=1


//LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("constant 16"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Math.multiply1}}
@LCL
A=M+1
D=M
@16
D=D-A
@15
M=D
@Math.multiply.LT.19
D=A
@13
M=D
@DO_LT
0;JMP
(Math.multiply.LT.19)
@15
M=D
@Math.multiply.EQ.18
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.18)
@WHILE_END_Math.multiply1
D;JNE


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse6}}
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
@Math.multiply.EQ.20
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.multiply.EQ.20)
@Math.multiply.IfElse6
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 0} END PPP 

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


//GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6
0;JMP


//LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)


//LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=argument 0} END PPP 

@ARG
A=M
D=M
D=D+M
@ARG
A=M
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=M+1


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 2} END PPP 

@LCL
A=M+1
A=A+1
D=M
D=D+M
@LCL
A=M+1
A=A+1
M=D


//GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1
0;JMP


//LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
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


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//pop PopInstruction{address=local 2} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//pop PopInstruction{address=local 1} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("local 2"),
//                    binaryOp: "GT"
//                ),
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse1}}
@ARG
A=M
D=M
@15
M=D
@Math.divide.EQ.24
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.24)
@SP
AM=M+1
A=A-1
M=D
@LCL
A=M+1
A=A+1
D=M
A=A-1
D=M-D
@15
M=D
@Math.divide.GT.25
D=A
@13
M=D
@DO_GT
0;JMP
(Math.divide.GT.25)
@SP
AM=M-1
D=D|M
@15
M=D
@Math.divide.EQ.23
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.23)
@Math.divide.IfElse1
D;JNE


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1
0;JMP


//LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)


//LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse2}}
@ARG
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@Math.divide.EQ.28
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.28)
@15
M=D
@Math.divide.EQ.27
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.27)
@Math.divide.IfElse2
D;JNE


//PushInstruction("constant 1")
@SP
AM=M+1
A=A-1
M=1


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2
0;JMP


//LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)


//LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "LT"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "LT"
//                ),
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse3}}
@ARG
A=M
D=M
@15
M=D
@Math.divide.LT.32
D=A
@13
M=D
@DO_LT
0;JMP
(Math.divide.LT.32)
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@15
M=D
@Math.divide.LT.33
D=A
@13
M=D
@DO_LT
0;JMP
(Math.divide.LT.33)
@SP
AM=M-1
D=D|M
@15
M=D
@Math.divide.EQ.31
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.31)
@Math.divide.IfElse3
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//pop PopInstruction{address=local 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "LT"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "LT"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse4}}
@ARG
A=M
D=M
@15
M=D
@Math.divide.LT.37
D=A
@13
M=D
@DO_LT
0;JMP
(Math.divide.LT.37)
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M+1
D=M
@15
M=D
@Math.divide.LT.38
D=A
@13
M=D
@DO_LT
0;JMP
(Math.divide.LT.38)
@SP
AM=M-1
D=D&M
@15
M=D
@Math.divide.EQ.36
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.36)
@Math.divide.IfElse4
D;JNE


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4
0;JMP


//LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)


//LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)


//UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
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


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3
0;JMP


//LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)


//LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)


//PPP : push CallGroup{pushes=[PushInstruction("argument 0"), BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=3, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//pop PopInstruction{address=local 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=4, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}},
//                    binaryOp: "SUB"
//                ),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse5}}
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
@Math.divide.LT.41
D=A
@13
M=D
@DO_LT
0;JMP
(Math.divide.LT.41)
@15
M=D
@Math.divide.EQ.40
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.divide.EQ.40)
@Math.divide.IfElse5
D;JNE


//BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL
A=M
D=M
D=D+M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5
0;JMP


//LabelInstruction{label='Math.divide.IfElse5}
// label Math.divide.IfElse5
(Math.divide.IfElse5)


//LabelInstruction{label='Math.divide.IfElseEND5}
// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)


//BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
@LCL
A=M
D=M
D=D+M
D=M+1
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=6, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)


//BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=6, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}}, PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}},
//    binaryOp: "SUB"
//)
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


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

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


//FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
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


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//PPP : push PushInstruction("constant 7")
//pop PopInstruction{address=local 1} END PPP 

@7
D=A
@LCL
A=M+1
M=D


//LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 1"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Math.sqrt1}}
@LCL
A=M+1
D=M
@15
M=D
@Math.sqrt.LT.44
D=A
@13
M=D
@DO_LT
0;JMP
(Math.sqrt.LT.44)
D=!D
@15
M=D
@Math.sqrt.EQ.43
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.sqrt.EQ.43)
@WHILE_END_Math.sqrt1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("that 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 2} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}}
//pop PopInstruction{address=local 3} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                UnaryPushGroup(                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 3"),
//                        right:
//                            PushInstruction("argument 0"),
//                        binaryOp: "GT"
//                    ),
//NOT),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 3"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "GT"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.sqrt.IfElse1}}
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
@Math.sqrt.GT.48
D=A
@13
M=D
@DO_GT
0;JMP
(Math.sqrt.GT.48)
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=!D
@LCL
A=M+1
A=A+1
A=A+1
D=M
@15
M=D
@Math.sqrt.GT.49
D=A
@13
M=D
@DO_GT
0;JMP
(Math.sqrt.GT.49)
@SP
AM=M-1
D=D&M
@15
M=D
@Math.sqrt.EQ.47
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.sqrt.EQ.47)
@Math.sqrt.IfElse1
D;JNE


//PPP : push PushInstruction("local 2")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M+1
A=A+1
D=M
@LCL
A=M
M=D


//GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1
0;JMP


//LabelInstruction{label='Math.sqrt.IfElse1}
// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)


//LabelInstruction{label='Math.sqrt.IfElseEND1}
// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=M-1


//GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1
0;JMP


//LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.max.IfElse1}}
@ARG
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@Math.max.GT.52
D=A
@13
M=D
@DO_GT
0;JMP
(Math.max.GT.52)
@15
M=D
@Math.max.EQ.51
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.max.EQ.51)
@Math.max.IfElse1
D;JNE


//PushInstruction("argument 0")
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1
0;JMP


//LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)


//LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)


//PushInstruction("argument 1")
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.min.IfElse1}}
@ARG
A=M+1
D=M
A=A-1
D=M-D
@15
M=D
@Math.min.LT.55
D=A
@13
M=D
@DO_LT
0;JMP
(Math.min.LT.55)
@15
M=D
@Math.min.EQ.54
D=A
@13
M=D
@DO_EQ
0;JMP
(Math.min.EQ.54)
@Math.min.IfElse1
D;JNE


//PushInstruction("argument 0")
@ARG
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1
0;JMP


//LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)


//LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)


//PushInstruction("argument 1")
@ARG
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)


//CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{calleeFunction='Math.max', numArgs=2, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.abs=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.abs'}}
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


//FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=Output.1} END PPP 

@Output.1
M=0


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=Output.2} END PPP 

@Output.2
M=0


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP
AM=M+1
A=A-1
M=0


//PPP : push CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=Output.0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=1}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=2}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@32
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=3}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=4}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=5}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@35
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=6}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=7}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@37
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=8}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=9}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=10}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=11}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=12}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@42
D=A
@SP
AM=M+1
A=A-1
M=D
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=13}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@43
D=A
@SP
AM=M+1
A=A-1
M=D
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=14}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@44
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=15}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@45
D=A
@SP
AM=M+1
A=A-1
M=D
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
@63
D=A
@SP
AM=M+1
A=A-1
M=D
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=16}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@46
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=17}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@47
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=1
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=18}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=19}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=20}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=21}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=22}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=23}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=24}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=25}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=26}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=27}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=28}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@58
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=29}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@59
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=30}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@60
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=31}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@61
D=A
@SP
AM=M+1
A=A-1
M=D
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
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
@63
D=A
@SP
AM=M+1
A=A-1
M=D
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=32}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@62
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=33}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=34}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=35}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@65
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=36}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=37}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=38}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=39}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=40}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=41}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=42}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=43}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=44}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=45}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=46}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=47}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=48}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=49}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=50}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=51}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=52}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=53}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=54}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=55}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=56}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=57}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=58}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=59}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=60}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=61}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=62}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@92
D=A
@SP
AM=M+1
A=A-1
M=D
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
M=1
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=63}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=64}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=65}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@95
D=A
@SP
AM=M+1
A=A-1
M=D
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
@63
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=66}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=67}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@97
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=68}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=69}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@99
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=70}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=71}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@101
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=72}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=73}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@103
D=A
@SP
AM=M+1
A=A-1
M=D
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=74}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=75}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=76}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=77}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=78}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=79}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@109
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=80}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@110
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=81}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@111
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=82}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@112
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=83}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@113
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=84}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@114
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=85}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@115
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=86}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=87}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@117
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=88}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@118
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=89}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@119
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=90}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@120
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=91}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@121
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=92}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

@122
D=A
@SP
AM=M+1
A=A-1
M=D
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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=93}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=94}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=95}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@SP
AM=M+1
A=A-1
M=0
@SP
AM=M+1
A=A-1
M=0
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


//PPP : push CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=96}, currentFunction='Output.initMap'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP
AM=M+1
A=A-1
M=0


//PPP : push CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}}
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push PushInstruction("local 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 2")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 3")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 4")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 5")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 6")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 7")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 8")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 9")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 10")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 11")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 32"),
//                    binaryOp: "LT"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 126"),
//                    binaryOp: "GT"
//                ),
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.getMap.IfElse1}}
@ARG
A=M
D=M
@32
D=D-A
@15
M=D
@Output.getMap.LT.3
D=A
@13
M=D
@DO_LT
0;JMP
(Output.getMap.LT.3)
@SP
AM=M+1
A=A-1
M=D
@ARG
A=M
D=M
@126
D=D-A
@15
M=D
@Output.getMap.GT.4
D=A
@13
M=D
@DO_GT
0;JMP
(Output.getMap.GT.4)
@SP
AM=M-1
D=D|M
@15
M=D
@Output.getMap.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.getMap.EQ.2)
@Output.getMap.IfElse1
D;JNE


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=argument 0} END PPP 

@ARG
A=M
M=0


//GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1
0;JMP


//LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)


//LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

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


//FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)


//PPP : push PushInstruction("argument 1")
//pop PopInstruction{address=Output.1} END PPP 

@ARG
A=M+1
D=M
@Output.1
M=D


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=Output.2} END PPP 

@ARG
A=M
D=M
@Output.2
M=D


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
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


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}}
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 3} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
M=0


//LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 3"),
//            right:
//                PushInstruction("constant 11"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Output.printChar1}}
@LCL
A=M+1
A=A+1
A=A+1
D=M
@11
D=D-A
@15
M=D
@Output.printChar.LT.7
D=A
@13
M=D
@DO_LT
0;JMP
(Output.printChar.LT.7)
@15
M=D
@Output.printChar.EQ.6
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.printChar.EQ.6)
@WHILE_END_Output.printChar1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("constant 16384"),
//            right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("static 2"), PushInstruction("constant 11")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}},
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//), PushInstruction("constant 32")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}},
//            binaryOp: "ADD"
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("static 1"), PushInstruction("constant 2")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}},
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 1} END PPP 

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
@Output.printChar.ret.3
D=A
@CALL
0;JMP
(Output.printChar.ret.3)
@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
AM=M-1
D=D+M
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
@Output.printChar.ret.4
D=A
@CALL
0;JMP
(Output.printChar.ret.4)
@SP
AM=M-1
D=M
@16384
D=D+A
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
@Output.printChar.ret.5
D=A
@CALL
0;JMP
(Output.printChar.ret.5)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=D+M
@LCL
A=M+1
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("static 1"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "AND"
//                ),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.printChar.IfElse1}}
@Output.1
D=M
@1
D=D&A
@15
M=D
@Output.printChar.EQ.10
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.printChar.EQ.10)
@15
M=D
@Output.printChar.EQ.9
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.printChar.EQ.9)
@Output.printChar.IfElse1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

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


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 2} END PPP 

@THAT
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


//GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1
0;JMP


//LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("that 0"), PushInstruction("constant 256")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printChar'}}
//pop PopInstruction{address=local 2} END PPP 

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
@Output.printChar.ret.6
D=A
@CALL
0;JMP
(Output.printChar.ret.6)
@SP
AM=M-1
D=M
@LCL
A=M+1
A=A+1
M=D


//LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
D=M
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "OR"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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
D=D|M
@THAT
A=M
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 3} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
M=M+1


//GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1
0;JMP


//LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 1"),
//            right:
//                PushInstruction("constant 63"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.printChar.IfElse2}}
@Output.1
D=M
@63
D=D-A
@15
M=D
@Output.printChar.EQ.13
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.printChar.EQ.13)
@15
M=D
@Output.printChar.EQ.12
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.printChar.EQ.12)
@Output.printChar.IfElse2
D;JNE


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=7, Output.create=1}, currentFunction='Output.printChar'}}
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
@Output.printChar.ret.7
D=A
@CALL
0;JMP
(Output.printChar.ret.7)
@SP
AM=M-1
D=M
@5
M=D


//GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2
0;JMP


//LabelInstruction{label='Output.printChar.IfElse2}
// label Output.printChar.IfElse2
(Output.printChar.IfElse2)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=Output.1} END PPP 

@Output.1
M=M+1


//LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP
AM=M+1
A=A-1
M=0


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='String.length', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=0, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}},
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Output.printString1}}
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
@Output.printString.ret.1
D=A
@CALL
0;JMP
(Output.printString.ret.1)
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
@15
M=D
@Output.printString.LT.16
D=A
@13
M=D
@DO_LT
0;JMP
(Output.printString.LT.16)
@15
M=D
@Output.printString.EQ.15
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.printString.EQ.15)
@WHILE_END_Output.printString1
D;JNE


//PPP : push CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}}], call=CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@Output.printString.ret.2
D=A
@CALL
0;JMP
(Output.printString.ret.2)
// call Output.printChar
@6
D=A
@14
M=D
@Output.printChar
D=A
@13
M=D
@Output.printString.ret.3
D=A
@CALL
0;JMP
(Output.printString.ret.3)
@SP
AM=M-1
D=M
@5
M=D


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


//GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1
0;JMP


//LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP
AM=M+1
A=A-1
M=0


//PPP : push CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//pop PopInstruction{address=local 0} END PPP 

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
@Output.printInt.ret.0
D=A
@CALL
0;JMP
(Output.printInt.ret.0)
@SP
AM=M-1
D=M
@LCL
A=M
M=D


//PPP : push CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=1, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=2, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=3, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//pop PopInstruction{address=temp 0} END PPP 

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
@Output.printInt.ret.3
D=A
@CALL
0;JMP
(Output.printInt.ret.3)
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


//FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.println with 0
(Output.println)


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=Output.1} END PPP 

@Output.1
M=0


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 2"),
//            right:
//                PushInstruction("constant 22"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println.IfElse1}}
@Output.2
D=M
@22
D=D-A
@15
M=D
@Output.println.EQ.19
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.println.EQ.19)
@15
M=D
@Output.println.EQ.18
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.println.EQ.18)
@Output.println.IfElse1
D;JNE


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=Output.2} END PPP 

@Output.2
M=0


//GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1
0;JMP


//LabelInstruction{label='Output.println.IfElse1}
// label Output.println.IfElse1
(Output.println.IfElse1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=Output.2} END PPP 

@Output.2
M=M+1


//LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
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
@Output.backSpace.EQ.22
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.22)
@15
M=D
@Output.backSpace.EQ.21
D=A
@13
M=D
@DO_EQ
0;JMP
(Output.backSpace.EQ.21)
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


//FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 0} END PPP 

@2055
D=A
@LCL
A=M
M=D


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("constant 16384"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "SUB"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "SUB"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

@LCL
A=M
D=M+1
@4
M=D
@THAT
A=M
M=1


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=1}, currentFunction='Memory.init'}}
//pop PopInstruction{address=temp 0} END PPP 

@2054
D=A
@SP
AM=M+1
A=A-1
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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
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


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M
D=M
@2048
D=D+A
@LCL
A=M+1
M=D


//PPP : push CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=1, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=local 2} END PPP 

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


//LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.alloc1}}
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@Memory.alloc.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.alloc.EQ.2)
@15
M=D
@Memory.alloc.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.alloc.EQ.1)
@WHILE_END_Memory.alloc1
D;JNE


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 0"),
//                        right:
//                            PushInstruction("constant 1"),
//                        binaryOp: "ADD"
//                    ),
//                right:
//                    PushInstruction("constant 7"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse1}}
@LCL
A=M
D=M+1
@7
D=D-A
@15
M=D
@Memory.alloc.LT.5
D=A
@13
M=D
@DO_LT
0;JMP
(Memory.alloc.LT.5)
D=!D
@15
M=D
@Memory.alloc.EQ.4
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.alloc.EQ.4)
@Memory.alloc.IfElse1
D;JNE


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)


//LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)


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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M
D=M
@2048
D=D+A
@LCL
A=M+1
M=D


//PPP : push CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=local 2} END PPP 

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


//GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1
0;JMP


//LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
D=M
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 3} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 3"),
//            right:
//                PushInstruction("constant 5"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
@LCL
A=M+1
A=A+1
A=A+1
D=M
@5
D=D-A
@15
M=D
@Memory.alloc.GT.8
D=A
@13
M=D
@DO_GT
0;JMP
(Memory.alloc.GT.8)
@15
M=D
@Memory.alloc.EQ.7
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.alloc.EQ.7)
@Memory.alloc.IfElse2
D;JNE


//PPP : push PushInstruction("argument 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

@LCL
A=M+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
M=0


//PPP : push CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("argument 0"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=local 4} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "SUB"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2
0;JMP


//LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

@LCL
A=M+1
A=A+1
D=M+1
@4
M=D
@THAT
A=M
M=0


//PPP : push CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=11, Memory.init=2}, currentFunction='Memory.alloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)


//BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
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


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=12, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP
AM=M+1
A=A-1
M=0


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=12, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}}
//pop PopInstruction{address=local 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@LCL
A=M
D=!M
@15
M=D
@Memory.calloc.EQ.9
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.calloc.EQ.9)
@Memory.calloc.IfElse1
D;JNE


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.calloc.IfElse1}
// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)


//LabelInstruction{label='Memory.calloc.IfElseEND1}
// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)


//LabelInstruction{label='WHILE_START_Memory.calloc1}
// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.calloc1}}
@ARG
A=M
D=M
@15
M=D
@Memory.calloc.GT.12
D=A
@13
M=D
@DO_GT
0;JMP
(Memory.calloc.GT.12)
@15
M=D
@Memory.calloc.EQ.11
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.calloc.EQ.11)
@WHILE_END_Memory.calloc1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=argument 0} END PPP 

@ARG
A=M
M=M-1


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1
0;JMP


//LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 0} END PPP 

@ARG
A=M
D=M
@4
D=D-A
@LCL
A=M
M=D


//PPP : push PushInstruction("constant 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

@LCL
A=M
D=M+1
@4
M=D
@THAT
A=M
M=1


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@2
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 1} END PPP 

@THAT
A=M
D=M
@LCL
A=M+1
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 2} END PPP 

@THAT
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 1"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse1}}
@LCL
A=M+1
D=M
@15
M=D
@Memory.deAlloc.EQ.15
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.15)
D=!D
@15
M=D
@Memory.deAlloc.EQ.14
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.14)
@Memory.deAlloc.IfElse1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
D=M+1
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse2}}
@THAT
A=M
D=M-1
@15
M=D
@Memory.deAlloc.EQ.18
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.18)
@15
M=D
@Memory.deAlloc.EQ.17
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.17)
@Memory.deAlloc.IfElse2
D;JNE


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
D=M
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("that 0"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push PushInstruction("local 1")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M+1
D=M
@LCL
A=M
M=D


//GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2
0;JMP


//LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)


//LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)


//GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)


//LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 2"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse3}}
@LCL
A=M+1
A=A+1
D=M
@15
M=D
@Memory.deAlloc.EQ.21
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.21)
D=!D
@15
M=D
@Memory.deAlloc.EQ.20
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.20)
@Memory.deAlloc.IfElse3
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
D=M+1
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse4}}
@THAT
A=M
D=M-1
@15
M=D
@Memory.deAlloc.EQ.24
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.24)
@15
M=D
@Memory.deAlloc.EQ.23
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.deAlloc.EQ.23)
@Memory.deAlloc.IfElse4
D;JNE


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("that 0"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=7, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4
0;JMP


//LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)


//LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)


//GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3
0;JMP


//LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)


//LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)


//PPP : push CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse1}}
@ARG
A=M
D=M
@15
M=D
@Memory.realloc.EQ.27
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.realloc.EQ.27)
@15
M=D
@Memory.realloc.EQ.26
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.realloc.EQ.26)
@Memory.realloc.IfElse1
D;JNE


//CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
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


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)


//LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 3} END PPP 

@ARG
A=M
D=M-1
@LCL
A=M+1
A=A+1
A=A+1
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M+1
A=A+1
A=A+1
D=M
@4
M=D


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


//PPP : push CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//pop PopInstruction{address=local 1} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse2}}
@LCL
A=M+1
D=M
@15
M=D
@Memory.realloc.EQ.30
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.realloc.EQ.30)
@15
M=D
@Memory.realloc.EQ.29
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.realloc.EQ.29)
@Memory.realloc.IfElse2
D;JNE


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2
0;JMP


//LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)


//LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse3}}
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
@Memory.realloc.GT.33
D=A
@13
M=D
@DO_GT
0;JMP
(Memory.realloc.GT.33)
D=!D
@15
M=D
@Memory.realloc.EQ.32
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.realloc.EQ.32)
@Memory.realloc.IfElse3
D;JNE


//PPP : push PushInstruction("local 0")
//pop PopInstruction{address=local 2} END PPP 

@LCL
A=M
D=M
@LCL
A=M+1
A=A+1
M=D


//GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3
0;JMP


//LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)


//PPP : push PushInstruction("argument 1")
//pop PopInstruction{address=local 2} END PPP 

@ARG
A=M+1
D=M
@LCL
A=M+1
A=A+1
M=D


//LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)


//PPP : push CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=3, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("local 1")
@LCL
A=M+1
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP
AM=M+1
A=A-1
M=0


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("argument 2"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.copy1}}
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
@Memory.copy.LT.36
D=A
@13
M=D
@DO_LT
0;JMP
(Memory.copy.LT.36)
@15
M=D
@Memory.copy.EQ.35
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.copy.EQ.35)
@WHILE_END_Memory.copy1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

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


//PPP : push PushInstruction("that 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1
0;JMP


//LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("that 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse1}}
@THAT
A=M
D=M
@15
M=D
@Memory.remove_node.EQ.39
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.remove_node.EQ.39)
D=!D
@15
M=D
@Memory.remove_node.EQ.38
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.remove_node.EQ.38)
@Memory.remove_node.IfElse1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@3
D=D+A
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("that 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse2}}
@THAT
A=M
D=M
@15
M=D
@Memory.remove_node.EQ.42
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.remove_node.EQ.42)
D=!D
@15
M=D
@Memory.remove_node.EQ.41
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.remove_node.EQ.41)
@Memory.remove_node.IfElse2
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@ARG
A=M+1
D=M
@2
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2
0;JMP


//LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)


//LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP
AM=M+1
A=A-1
M=0


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=0


//LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 7"),
//                    binaryOp: "LT"
//                ),
//            right:
//                UnaryPushGroup(                    BinaryPushGroup(
//                        left:
//                            PushInstruction("that 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "EQ"
//                    ),
//NOT),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}}
@LCL
A=M
D=M
@7
D=D-A
@15
M=D
@Memory.getBinIndex.LT.46
D=A
@13
M=D
@DO_LT
0;JMP
(Memory.getBinIndex.LT.46)
@SP
AM=M+1
A=A-1
M=D
@THAT
A=M
D=M
@15
M=D
@Memory.getBinIndex.EQ.47
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.getBinIndex.EQ.47)
D=!D
@SP
AM=M-1
D=D&M
@15
M=D
@Memory.getBinIndex.EQ.45
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.getBinIndex.EQ.45)
@WHILE_END_Memory.getBinIndex1
D;JNE


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 0"),
//                right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=0, Memory.remove_node=0}, currentFunction='Memory.getBinIndex'}},
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.getBinIndex.IfElse1}}
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
@Memory.getBinIndex.GT.50
D=A
@13
M=D
@DO_GT
0;JMP
(Memory.getBinIndex.GT.50)
D=!D
@15
M=D
@Memory.getBinIndex.EQ.49
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.getBinIndex.EQ.49)
@Memory.getBinIndex.IfElse1
D;JNE


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)


//LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)


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


//GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1
0;JMP


//LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)


//BinaryPushGroup(
//    left:
//        PushInstruction("constant 7"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
@6
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
M=D-1


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP
AM=M+1
A=A-1
M=0


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


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("that 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse1}}
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
@Memory.get_best_fit.LT.53
D=A
@13
M=D
@DO_LT
0;JMP
(Memory.get_best_fit.LT.53)
D=!D
@15
M=D
@Memory.get_best_fit.EQ.52
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.get_best_fit.EQ.52)
@Memory.get_best_fit.IfElse1
D;JNE


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.get_best_fit.IfElse1}
// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)


//LabelInstruction{label='Memory.get_best_fit.IfElseEND1}
// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)


//LabelInstruction{label='WHILE_START_Memory.get_best_fit1}
// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("that 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}}
@THAT
A=M
D=M
@15
M=D
@Memory.get_best_fit.EQ.56
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.get_best_fit.EQ.56)
D=!D
@15
M=D
@Memory.get_best_fit.EQ.55
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.get_best_fit.EQ.55)
@WHILE_END_Memory.get_best_fit1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("that 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse2}}
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
@Memory.get_best_fit.LT.59
D=A
@13
M=D
@DO_LT
0;JMP
(Memory.get_best_fit.LT.59)
D=!D
@15
M=D
@Memory.get_best_fit.EQ.58
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.get_best_fit.EQ.58)
@Memory.get_best_fit.IfElse2
D;JNE


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2
0;JMP


//LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)


//LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)


//GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1
0;JMP


//LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)


//PPP : push PushInstruction("argument 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("constant 4"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
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


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("constant 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse1}}
@THAT
A=M
D=M
@15
M=D
@Memory.add_node.EQ.62
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.add_node.EQ.62)
@15
M=D
@Memory.add_node.EQ.61
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.add_node.EQ.61)
@Memory.add_node.IfElse1
D;JNE


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1
0;JMP


//LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)


//LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)


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


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


//PPP : push PushInstruction("constant 0")
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M+1
M=0


//LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                UnaryPushGroup(                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "EQ"
//                    ),
//NOT),
//            right:
//                UnaryPushGroup(                    BinaryPushGroup(
//                        left:
//                            PushInstruction("that 0"),
//                        right:
//                            PushInstruction("that 0"),
//                        binaryOp: "GT"
//                    ),
//NOT),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.add_node1}}
@LCL
A=M
D=M
@15
M=D
@Memory.add_node.EQ.66
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.add_node.EQ.66)
@SP
AM=M+1
A=A-1
M=D
@SP
A=M-1
M=!D
@THAT
A=M
D=M
D=D-M
@15
M=D
@Memory.add_node.GT.67
D=A
@13
M=D
@DO_GT
0;JMP
(Memory.add_node.GT.67)
D=!D
@SP
AM=M-1
D=D&M
@15
M=D
@Memory.add_node.EQ.65
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.add_node.EQ.65)
@WHILE_END_Memory.add_node1
D;JNE


//PPP : push PushInstruction("local 0")
//pop PopInstruction{address=local 1} END PPP 

@LCL
A=M
D=M
@LCL
A=M+1
M=D


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@LCL
A=M
D=M
@3
D=D+A
@4
M=D


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


//GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1
0;JMP


//LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 1"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL
A=M+1
D=!M
@15
M=D
@Memory.add_node.EQ.68
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.add_node.EQ.68)
@Memory.add_node.IfElse2
D;JNE


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


//PPP : push PushInstruction("that 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2
0;JMP


//LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)


//PPP : push PushInstruction("local 0")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PPP : push PushInstruction("local 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@LCL
A=M
D=M
@15
M=D
@Memory.add_node.EQ.69
D=A
@13
M=D
@DO_EQ
0;JMP
(Memory.add_node.EQ.69)
@Memory.add_node.IfElse3
D;JNE


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3
0;JMP


//LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)


//LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)


//PPP : push PushInstruction("argument 1")
//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 
//
//pop PopInstruction{address=that 0} END PPP 

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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
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


//FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=1}, currentFunction='Sys.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=2}, currentFunction='Sys.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=3}, currentFunction='Sys.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=4}, currentFunction='Sys.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=5}, currentFunction='Sys.init'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=6}, currentFunction='Sys.init'}}
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


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)


//LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("constant 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0
@WHILE_END_Sys.halt1
D;JNE


//GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1
0;JMP


//LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP
AM=M+1
A=A-1
M=0


//LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.wait1}}
@ARG
A=M
D=M
@15
M=D
@Sys.wait.GT.2
D=A
@13
M=D
@DO_GT
0;JMP
(Sys.wait.GT.2)
@15
M=D
@Sys.wait.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(Sys.wait.EQ.1)
@WHILE_END_Sys.wait1
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=argument 0} END PPP 

@ARG
A=M
M=M-1


//PPP : push PushInstruction("constant 70")
//pop PopInstruction{address=local 0} END PPP 

@70
D=A
@LCL
A=M
M=D


//LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.wait2}}
@LCL
A=M
D=M
@15
M=D
@Sys.wait.GT.5
D=A
@13
M=D
@DO_GT
0;JMP
(Sys.wait.GT.5)
@15
M=D
@Sys.wait.EQ.4
D=A
@13
M=D
@DO_EQ
0;JMP
(Sys.wait.EQ.4)
@WHILE_END_Sys.wait2
D;JNE


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//pop PopInstruction{address=local 0} END PPP 

@LCL
A=M
M=M-1


//GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2
0;JMP


//LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)


//GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1
0;JMP


//LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.printInt', numArgs=1, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}}
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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Sys.wait=0, Sys.error=1, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}}
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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.wait=0, Sys.error=2, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}}
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


//FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)


//PushInstruction("constant 0")
@SP
AM=M+1
A=A-1
M=0


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@24576
D=A
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


//FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP
AM=M+1
A=A-1
M=0


//LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@24576
D=A
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}}
@THAT
A=M
D=M
@15
M=D
@Keyboard.readChar.EQ.2
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readChar.EQ.2)
@15
M=D
@Keyboard.readChar.EQ.1
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readChar.EQ.1)
@WHILE_END_Keyboard.readChar1
D;JNE


//GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1
0;JMP


//LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@24576
D=A
@4
M=D


//PPP : push PushInstruction("that 0")
//pop PopInstruction{address=local 0} END PPP 

@THAT
A=M
D=M
@LCL
A=M
M=D


//LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)


//PPP : push BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//pop PopInstruction{address=pointer 1} END PPP 

@24576
D=A
@4
M=D


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("that 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}}
@THAT
A=M
D=M
@15
M=D
@Keyboard.readChar.EQ.5
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readChar.EQ.5)
D=!D
@15
M=D
@Keyboard.readChar.EQ.4
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readChar.EQ.4)
@WHILE_END_Keyboard.readChar2
D;JNE


//GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2
0;JMP


//LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)


//PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
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


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//PPP : push CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=1}, currentFunction='Keyboard.readLine'}}
//pop PopInstruction{address=local 0} END PPP 

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


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=2}, currentFunction='Keyboard.readLine'}}
//pop PopInstruction{address=local 1} END PPP 

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


//LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 1"),
//                right:
//CallGroup{pushes=[], call=CallInstruction{calleeFunction='String.newLine', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=3}, currentFunction='Keyboard.readLine'}},
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}}
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
@Keyboard.readLine.EQ.8
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readLine.EQ.8)
D=!D
@15
M=D
@Keyboard.readLine.EQ.7
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readLine.EQ.7)
@WHILE_END_Keyboard.readLine1
D;JNE


//ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("constant 129"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Keyboard.readLine.IfElse1}}
@LCL
A=M+1
D=M
@129
D=D-A
@15
M=D
@Keyboard.readLine.EQ.11
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readLine.EQ.11)
@15
M=D
@Keyboard.readLine.EQ.10
D=A
@13
M=D
@DO_EQ
0;JMP
(Keyboard.readLine.EQ.10)
@Keyboard.readLine.IfElse1
D;JNE


//PPP : push CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1
0;JMP


//LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)


//PPP : push CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}}
//pop PopInstruction{address=temp 0} END PPP 

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


//LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)


//PPP : push CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readLine'}}
//pop PopInstruction{address=local 1} END PPP 

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


//GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1
0;JMP


//LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)


//PushInstruction("local 0")
@LCL
A=M
D=M
@SP
AM=M+1
A=A-1
M=D


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP
AM=M+1
A=A-1
M=0


//PPP : push CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Keyboard.readLine', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=0, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}, currentFunction='Keyboard.readInt'}}
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


//CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.intValue', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}, currentFunction='Keyboard.readInt'}}
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


//FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)


//CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}}
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
@Array.new.ret.0
D=A
@CALL
0;JMP
(Array.new.ret.0)


//ReturnInstruction{}
@RETURN
0;JMP


//FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)


//PPP : push PushInstruction("argument 0")
//pop PopInstruction{address=pointer 0} END PPP 

@ARG
A=M
D=M
@3
M=D


//PPP : push CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Array.dispose=0, Array.new=1}, currentFunction='Array.dispose'}}
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


