//Set 256 to be the start of the stack
@256 // 0
D=A // 1
@SP // 2
M=D // 3
//Set up the comparison ops subroutines
@SKIP // 4
0;JMP // 5
// ------------------------------------------------------------
//  Shared code for gt, lt, eq
//  Expectations on entry:
//Stack  – return address
//D  – (left – right)
// ------------------------------------------------------------
// want  (left  > right)  ⇔ (D > 0)
(DO_GT)
@RETURN_TRUE // 6
D;JGT // 7
@RETURN_FALSE // 8
0;JMP // 9
// want  (left == right)  ⇔ (D == 0)
(DO_EQ)
@RETURN_TRUE // 10
D;JEQ // 11
@RETURN_FALSE // 12
0;JMP // 13
// want  (left  < right)  ⇔ (D < 0)
(DO_LT)
@RETURN_TRUE // 14
D;JLT // 15
@RETURN_FALSE // 16
0;JMP // 17
// ---- set boolean in D --------------------------------------
(RETURN_TRUE)
D=-1 // 18
@WRITE_BACK // 19
0;JMP // 20
(RETURN_FALSE)
D=0 // 21
@WRITE_BACK // 22
0;JMP // 23
// ---- collapse stack and return -----------------------------
(WRITE_BACK)
@SP // 24
AM=M-1 // 25
A=M // 26
0;JMP // 27
(SKIP)
//Set up calling and returning from functions
@SKIPo // 28
0;JMP // 29
(CALL)
@SP // 30
AM=M+1 // 31
A=A-1 // 32
M=D // 33
@LCL // 34
D=M // 35
@SP // 36
AM=M+1 // 37
A=A-1 // 38
M=D // 39
@ARG // 40
D=M // 41
@SP // 42
AM=M+1 // 43
A=A-1 // 44
M=D // 45
@THIS // 46
D=M // 47
@SP // 48
AM=M+1 // 49
A=A-1 // 50
M=D // 51
@THAT // 52
D=M // 53
@SP // 54
AM=M+1 // 55
A=A-1 // 56
M=D // 57
@14 // 58
D=M // 59
@SP // 60
D=M-D // 61
@ARG // 62
M=D // 63
@SP // 64
D=M // 65
@LCL // 66
M=D // 67
@13 // 68
A=M // 69
0;JMP // 70
(RETURN)
@LCL // 71
D=M // 72
@14 // 73
M=D // 74
@5 // 75
A=D-A // 76
D=M // 77
@15 // 78
M=D // 79
@SP // 80
AM=M-1 // 81
D=M // 82
@ARG // 83
A=M // 84
M=D // 85
@ARG // 86
D=M // 87
@SP // 88
M=D+1 // 89
@14 // 90
A=M-1 // 91
D=M // 92
@THAT // 93
M=D // 94
@14 // 95
A=M-1 // 96
A=A-1 // 97
D=M // 98
@THIS // 99
M=D // 100
@14 // 101
A=M-1 // 102
A=A-1 // 103
A=A-1 // 104
D=M // 105
@ARG // 106
M=D // 107
@14 // 108
A=M-1 // 109
A=A-1 // 110
A=A-1 // 111
A=A-1 // 112
D=M // 113
@LCL // 114
M=D // 115
@15 // 116
A=M // 117
0;JMP // 118
(SKIPo)
// call Sys.init
@5 // 119
D=A // 120
@14 // 121
M=D // 122
@Sys.init // 123
D=A // 124
@13 // 125
M=D // 126
@Array.dispose.ret.0 // 127
D=A // 128
@CALL // 129
0;JMP // 130
(Array.dispose.ret.0)
////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 131
D=A // 132
@14 // 133
M=D // 134
@Memory.init // 135
D=A // 136
@13 // 137
M=D // 138
@Sys.init.ret.0 // 139
D=A // 140
@CALL // 141
0;JMP // 142
(Sys.init.ret.0)
@SP // 143
M=M-1 // 144

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 145
D=A // 146
@14 // 147
M=D // 148
@Math.init // 149
D=A // 150
@13 // 151
M=D // 152
@Sys.init.ret.1 // 153
D=A // 154
@CALL // 155
0;JMP // 156
(Sys.init.ret.1)
@SP // 157
M=M-1 // 158

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 159
D=A // 160
@14 // 161
M=D // 162
@Screen.init // 163
D=A // 164
@13 // 165
M=D // 166
@Sys.init.ret.2 // 167
D=A // 168
@CALL // 169
0;JMP // 170
(Sys.init.ret.2)
@SP // 171
M=M-1 // 172

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 173
D=A // 174
@14 // 175
M=D // 176
@Output.init // 177
D=A // 178
@13 // 179
M=D // 180
@Sys.init.ret.3 // 181
D=A // 182
@CALL // 183
0;JMP // 184
(Sys.init.ret.3)
@SP // 185
M=M-1 // 186

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 187
D=A // 188
@14 // 189
M=D // 190
@Keyboard.init // 191
D=A // 192
@13 // 193
M=D // 194
@Sys.init.ret.4 // 195
D=A // 196
@CALL // 197
0;JMP // 198
(Sys.init.ret.4)
@SP // 199
M=M-1 // 200

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 201
D=A // 202
@14 // 203
M=D // 204
@Main.main // 205
D=A // 206
@13 // 207
M=D // 208
@Sys.init.ret.5 // 209
D=A // 210
@CALL // 211
0;JMP // 212
(Sys.init.ret.5)
@SP // 213
M=M-1 // 214

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 215
D=A // 216
@14 // 217
M=D // 218
@Sys.halt // 219
D=A // 220
@13 // 221
M=D // 222
@Sys.init.ret.6 // 223
D=A // 224
@CALL // 225
0;JMP // 226
(Sys.init.ret.6)
@SP // 227
M=M-1 // 228

////PushInstruction("constant 0")
@SP // 229
AM=M+1 // 230
A=A-1 // 231
M=0 // 232
@RETURN // 233
0;JMP // 234

