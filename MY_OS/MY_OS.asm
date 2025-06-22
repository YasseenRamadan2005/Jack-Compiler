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
//R13  – return address
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
@13 // 24
A=M // 25
0;JMP // 26
(SKIP)
//Set up calling and returning from functions
@SKIPo // 27
0;JMP // 28
(CALL)
@SP // 29
AM=M+1 // 30
A=A-1 // 31
M=D // 32
@LCL // 33
D=M // 34
@SP // 35
AM=M+1 // 36
A=A-1 // 37
M=D // 38
@ARG // 39
D=M // 40
@SP // 41
AM=M+1 // 42
A=A-1 // 43
M=D // 44
@THIS // 45
D=M // 46
@SP // 47
AM=M+1 // 48
A=A-1 // 49
M=D // 50
@THAT // 51
D=M // 52
@SP // 53
AM=M+1 // 54
A=A-1 // 55
M=D // 56
@14 // 57
D=M // 58
@SP // 59
D=M-D // 60
@ARG // 61
M=D // 62
@SP // 63
D=M // 64
@LCL // 65
M=D // 66
@13 // 67
A=M // 68
0;JMP // 69
(RETURN)
@LCL // 70
D=M // 71
@14 // 72
M=D // 73
@5 // 74
A=D-A // 75
D=M // 76
@15 // 77
M=D // 78
@SP // 79
AM=M-1 // 80
D=M // 81
@ARG // 82
A=M // 83
M=D // 84
@ARG // 85
D=M // 86
@SP // 87
M=D+1 // 88
@14 // 89
A=M-1 // 90
D=M // 91
@THAT // 92
M=D // 93
@14 // 94
A=M-1 // 95
A=A-1 // 96
D=M // 97
@THIS // 98
M=D // 99
@14 // 100
A=M-1 // 101
A=A-1 // 102
A=A-1 // 103
D=M // 104
@ARG // 105
M=D // 106
@14 // 107
A=M-1 // 108
A=A-1 // 109
A=A-1 // 110
A=A-1 // 111
D=M // 112
@LCL // 113
M=D // 114
@15 // 115
A=M // 116
0;JMP // 117
(SKIPo)
// call Sys.init
@5 // 118
D=A // 119
@14 // 120
M=D // 121
@Sys.init // 122
D=A // 123
@13 // 124
M=D // 125
@global.ret.0 // 126
D=A // 127
@CALL // 128
0;JMP // 129
(global.ret.0)
////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push:     UnaryPushGroup (
//      UnaryPushGroup(
//          inner:
//              PushInstruction("constant 0")
//,
//          unaryOp: NOT
//      )    )
//
//  pop: PopInstruction{address=Screen.0}
//}

@Screen.0 // 130
M=-1 // 131

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 132
AM=M+1 // 133
A=A-1 // 134
M=0 // 135

////ReturnInstruction{}
@RETURN // 136
0;JMP // 137

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=Screen.0}
//}

@ARG // 138
A=M // 139
D=M // 140
@Screen.0 // 141
M=D // 142

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 143
AM=M+1 // 144
A=A-1 // 145
M=0 // 146

////ReturnInstruction{}
@RETURN // 147
0;JMP // 148

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 149
AM=M+1 // 150
A=A-1 // 151
M=0 // 152
@SP // 153
AM=M+1 // 154
A=A-1 // 155
M=0 // 156

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              BinaryPushGroup(
//                  left:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("argument 1")
//                          arg[1]:
//                              PushInstruction("constant 32")
//                          call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=0}, currentFunction='Screen.drawPixel'}
//                      ),
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("argument 0")
//                          arg[1]:
//                              PushInstruction("constant 16")
//                          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=0}, currentFunction='Screen.drawPixel'}
//                      ),
//                  binaryOp: "ADD"
//              ),
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 157
A=M+1 // 158
D=M // 159
@SP // 160
AM=M+1 // 161
A=A-1 // 162
M=D // 163
@32 // 164
D=A // 165
@SP // 166
AM=M+1 // 167
A=A-1 // 168
M=D // 169
// call Math.multiply
@7 // 170
D=A // 171
@14 // 172
M=D // 173
@Math.multiply // 174
D=A // 175
@13 // 176
M=D // 177
@Screen.drawPixel.ret.2 // 178
D=A // 179
@CALL // 180
0;JMP // 181
(Screen.drawPixel.ret.2)
@ARG // 182
A=M // 183
D=M // 184
@SP // 185
AM=M+1 // 186
A=A-1 // 187
M=D // 188
@16 // 189
D=A // 190
@SP // 191
AM=M+1 // 192
A=A-1 // 193
M=D // 194
// call Math.divide
@7 // 195
D=A // 196
@14 // 197
M=D // 198
@Math.divide // 199
D=A // 200
@13 // 201
M=D // 202
@Screen.drawPixel.ret.3 // 203
D=A // 204
@CALL // 205
0;JMP // 206
(Screen.drawPixel.ret.3)
@SP // 207
AM=M-1 // 208
D=M // 209
@SP // 210
AM=M-1 // 211
D=D+M // 212
@16384 // 213
D=D+A // 214
@LCL // 215
A=M // 216
M=D // 217

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 15")
//,
//          binaryOp: "AND"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@ARG // 218
A=M // 219
D=M // 220
@15 // 221
D=D&A // 222
@LCL // 223
A=M+1 // 224
M=D // 225

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("Screen.0")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "EQ"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawPixel.IfElse1}}
@Screen.0 // 226
D=M // 227
@15 // 228
M=D // 229
@Screen.drawPixel.EQ.2 // 230
D=A // 231
@13 // 232
M=D // 233
@DO_EQ // 234
0;JMP // 235
(Screen.drawPixel.EQ.2)
D=!D // 236
@15 // 237
M=D // 238
@Screen.drawPixel.EQ.1 // 239
D=A // 240
@13 // 241
M=D // 242
@DO_EQ // 243
0;JMP // 244
(Screen.drawPixel.EQ.1)
@Screen.drawPixel.IfElse1 // 245
D;JNE // 246

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 247
A=M // 248
D=M // 249
@4 // 250
M=D // 251

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              CallGroup(
//                  arg[0]:
//                      PushInstruction("local 1")
//                  call: CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawPixel'}
//              ),
//          binaryOp: "OR"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
//,
//                  right:
//                      PushInstruction("constant 0")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 252
A=M // 253
D=M // 254
@SP // 255
AM=M+1 // 256
A=A-1 // 257
M=D // 258
@LCL // 259
A=M+1 // 260
D=M // 261
@SP // 262
AM=M+1 // 263
A=A-1 // 264
M=D // 265
// call Math.twoToThe
@6 // 266
D=A // 267
@14 // 268
M=D // 269
@Math.twoToThe // 270
D=A // 271
@13 // 272
M=D // 273
@Screen.drawPixel.ret.4 // 274
D=A // 275
@CALL // 276
0;JMP // 277
(Screen.drawPixel.ret.4)
@SP // 278
AM=M-1 // 279
D=M // 280
@SP // 281
AM=M-1 // 282
D=D|M // 283
@THAT // 284
A=M // 285
M=D // 286

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 287
0;JMP // 288

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 289
A=M // 290
D=M // 291
@4 // 292
M=D // 293

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              UnaryPushGroup(
//                  inner:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("local 1")
//                          call: CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=5}, currentFunction='Screen.drawPixel'}
//                      ),
//                  unaryOp: NOT
//              ),
//          binaryOp: "AND"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
//,
//                  right:
//                      PushInstruction("constant 0")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 294
A=M // 295
D=M // 296
@SP // 297
AM=M+1 // 298
A=A-1 // 299
M=D // 300
@LCL // 301
A=M+1 // 302
D=M // 303
@SP // 304
AM=M+1 // 305
A=A-1 // 306
M=D // 307
// call Math.twoToThe
@6 // 308
D=A // 309
@14 // 310
M=D // 311
@Math.twoToThe // 312
D=A // 313
@13 // 314
M=D // 315
@Screen.drawPixel.ret.5 // 316
D=A // 317
@CALL // 318
0;JMP // 319
(Screen.drawPixel.ret.5)
@SP // 320
AM=M-1 // 321
D=M // 322
D=!D // 323
@SP // 324
AM=M-1 // 325
D=D&M // 326
@THAT // 327
A=M // 328
M=D // 329

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 330
AM=M+1 // 331
A=A-1 // 332
M=0 // 333

////ReturnInstruction{}
@RETURN // 334
0;JMP // 335

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 336
AM=M+1 // 337
A=A-1 // 338
M=0 // 339
@SP // 340
AM=M+1 // 341
A=A-1 // 342
M=0 // 343
@SP // 344
AM=M+1 // 345
A=A-1 // 346
M=0 // 347
@SP // 348
AM=M+1 // 349
A=A-1 // 350
M=0 // 351
@SP // 352
AM=M+1 // 353
A=A-1 // 354
M=0 // 355
@SP // 356
AM=M+1 // 357
A=A-1 // 358
M=0 // 359

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 2")
//,
//                  right:
//                      PushInstruction("argument 0")
//,
//                  binaryOp: "SUB"
//              )          call: CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 360
A=M+1 // 361
A=A+1 // 362
D=M // 363
A=A-1 // 364
A=A-1 // 365
D=D-M // 366
@SP // 367
AM=M+1 // 368
A=A-1 // 369
M=D // 370
// call Math.abs
@6 // 371
D=A // 372
@14 // 373
M=D // 374
@Math.abs // 375
D=A // 376
@13 // 377
M=D // 378
@Screen.drawLine.ret.0 // 379
D=A // 380
@CALL // 381
0;JMP // 382
(Screen.drawLine.ret.0)
@SP // 383
AM=M-1 // 384
D=M // 385
@LCL // 386
A=M // 387
M=D // 388

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 3")
//,
//                  right:
//                      PushInstruction("argument 1")
//,
//                  binaryOp: "SUB"
//              )          call: CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@ARG // 389
A=M+1 // 390
A=A+1 // 391
A=A+1 // 392
D=M // 393
A=A-1 // 394
A=A-1 // 395
D=D-M // 396
@SP // 397
AM=M+1 // 398
A=A-1 // 399
M=D // 400
// call Math.abs
@6 // 401
D=A // 402
@14 // 403
M=D // 404
@Math.abs // 405
D=A // 406
@13 // 407
M=D // 408
@Screen.drawLine.ret.1 // 409
D=A // 410
@CALL // 411
0;JMP // 412
(Screen.drawLine.ret.1)
@SP // 413
AM=M-1 // 414
D=M // 415
@LCL // 416
A=M+1 // 417
M=D // 418

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("argument 2")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse1}}
@ARG // 419
A=M+1 // 420
A=A+1 // 421
D=M // 422
A=A-1 // 423
A=A-1 // 424
D=M-D // 425
@15 // 426
M=D // 427
@Screen.drawLine.LT.5 // 428
D=A // 429
@13 // 430
M=D // 431
@DO_LT // 432
0;JMP // 433
(Screen.drawLine.LT.5)
@15 // 434
M=D // 435
@Screen.drawLine.EQ.4 // 436
D=A // 437
@13 // 438
M=D // 439
@DO_EQ // 440
0;JMP // 441
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse1 // 442
D;JNE // 443

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 444
A=M+1 // 445
A=A+1 // 446
M=1 // 447

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 448
0;JMP // 449

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push:     UnaryPushGroup (
//      UnaryPushGroup(
//          inner:
//              PushInstruction("constant 1")
//,
//          unaryOp: NEG
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 450
A=M+1 // 451
A=A+1 // 452
M=-1 // 453

////LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("argument 3")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse2}}
@ARG // 454
A=M+1 // 455
A=A+1 // 456
A=A+1 // 457
D=M // 458
A=A-1 // 459
A=A-1 // 460
D=M-D // 461
@15 // 462
M=D // 463
@Screen.drawLine.LT.8 // 464
D=A // 465
@13 // 466
M=D // 467
@DO_LT // 468
0;JMP // 469
(Screen.drawLine.LT.8)
@15 // 470
M=D // 471
@Screen.drawLine.EQ.7 // 472
D=A // 473
@13 // 474
M=D // 475
@DO_EQ // 476
0;JMP // 477
(Screen.drawLine.EQ.7)
@Screen.drawLine.IfElse2 // 478
D;JNE // 479

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//    )
//
//  pop: PopInstruction{address=local 3}
//}

@LCL // 480
A=M+1 // 481
A=A+1 // 482
A=A+1 // 483
M=1 // 484

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 485
0;JMP // 486

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push:     UnaryPushGroup (
//      UnaryPushGroup(
//          inner:
//              PushInstruction("constant 1")
//,
//          unaryOp: NEG
//      )    )
//
//  pop: PopInstruction{address=local 3}
//}

@LCL // 487
A=M+1 // 488
A=A+1 // 489
A=A+1 // 490
M=-1 // 491

////LabelInstruction{label='Screen.drawLine.IfElseEND2}
// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("local 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 492
D=M // 493
@4 // 494
A=D+A // 495
D=A // 496
@13 // 497
M=D // 498
@LCL // 499
A=M+1 // 500
D=M // 501
A=A-1 // 502
D=M-D // 503
@13 // 504
A=M // 505
M=D // 506

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  PushInstruction("constant 0")
//,
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0 // 507
@WHILE_END_Screen.drawLine1 // 508
D;JNE // 509

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          arg[1]:
//              PushInstruction("argument 1")
//          call: CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 510
A=M // 511
D=M // 512
@SP // 513
AM=M+1 // 514
A=A-1 // 515
M=D // 516
@ARG // 517
A=M+1 // 518
D=M // 519
@SP // 520
AM=M+1 // 521
A=A-1 // 522
M=D // 523
// call Screen.drawPixel
@7 // 524
D=A // 525
@14 // 526
M=D // 527
@Screen.drawPixel // 528
D=A // 529
@13 // 530
M=D // 531
@Screen.drawLine.ret.2 // 532
D=A // 533
@CALL // 534
0;JMP // 535
(Screen.drawLine.ret.2)
@SP // 536
AM=M-1 // 537
D=M // 538
@5 // 539
M=D // 540

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          PushInstruction("argument 2")
//,
//                      binaryOp: "EQ"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 1")
//,
//                      right:
//                          PushInstruction("argument 3")
//,
//                      binaryOp: "EQ"
//                  ),
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse3}}
@ARG // 541
A=M+1 // 542
A=A+1 // 543
D=M // 544
A=A-1 // 545
A=A-1 // 546
D=M-D // 547
@15 // 548
M=D // 549
@Screen.drawLine.EQ.12 // 550
D=A // 551
@13 // 552
M=D // 553
@DO_EQ // 554
0;JMP // 555
(Screen.drawLine.EQ.12)
@SP // 556
AM=M+1 // 557
A=A-1 // 558
M=D // 559
@ARG // 560
A=M+1 // 561
A=A+1 // 562
A=A+1 // 563
D=M // 564
A=A-1 // 565
A=A-1 // 566
D=M-D // 567
@15 // 568
M=D // 569
@Screen.drawLine.EQ.13 // 570
D=A // 571
@13 // 572
M=D // 573
@DO_EQ // 574
0;JMP // 575
(Screen.drawLine.EQ.13)
@SP // 576
AM=M-1 // 577
D=D&M // 578
@15 // 579
M=D // 580
@Screen.drawLine.EQ.11 // 581
D=A // 582
@13 // 583
M=D // 584
@DO_EQ // 585
0;JMP // 586
(Screen.drawLine.EQ.11)
@Screen.drawLine.IfElse3 // 587
D;JNE // 588

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 589
AM=M+1 // 590
A=A-1 // 591
M=0 // 592

////ReturnInstruction{}
@RETURN // 593
0;JMP // 594

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 595
0;JMP // 596

////LabelInstruction{label='Screen.drawLine.IfElse3}
// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)

////LabelInstruction{label='Screen.drawLine.IfElseEND3}
// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 4")
//,
//          right:
//              PushInstruction("local 4")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 5}
//}

@LCL // 597
D=M // 598
@5 // 599
A=D+A // 600
D=A // 601
@13 // 602
M=D // 603
@LCL // 604
D=M // 605
@4 // 606
A=D+A // 607
D=M // 608
D=D+M // 609
@13 // 610
A=M // 611
M=D // 612

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 5")
//,
//                      right:
//                          PushInstruction("local 1")
//,
//                      binaryOp: "ADD"
//                  ),
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse4}}
@LCL // 613
D=M // 614
@5 // 615
A=D+A // 616
D=M // 617
@R13 // 618
M=D // 619
@LCL // 620
A=M+1 // 621
D=M // 622
@R13 // 623
D=D+M // 624
@15 // 625
M=D // 626
@Screen.drawLine.GT.16 // 627
D=A // 628
@13 // 629
M=D // 630
@DO_GT // 631
0;JMP // 632
(Screen.drawLine.GT.16)
@15 // 633
M=D // 634
@Screen.drawLine.EQ.15 // 635
D=A // 636
@13 // 637
M=D // 638
@DO_EQ // 639
0;JMP // 640
(Screen.drawLine.EQ.15)
@Screen.drawLine.IfElse4 // 641
D;JNE // 642

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 4")
//,
//          right:
//              PushInstruction("local 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 643
D=M // 644
@4 // 645
A=D+A // 646
D=A // 647
@13 // 648
M=D // 649
@LCL // 650
D=M // 651
@4 // 652
A=D+A // 653
D=M // 654
A=A-1 // 655
A=A-1 // 656
A=A-1 // 657
D=D-M // 658
@13 // 659
A=M // 660
M=D // 661

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("local 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=argument 0}
//}

@ARG // 662
A=M // 663
D=M // 664
@R13 // 665
M=D // 666
@LCL // 667
A=M+1 // 668
A=A+1 // 669
D=M // 670
@R13 // 671
D=D+M // 672
@ARG // 673
A=M // 674
M=D // 675

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 676
0;JMP // 677

////LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)

////LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 5")
//,
//              right:
//                  PushInstruction("local 0")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse5}}
@LCL // 678
D=M // 679
@5 // 680
A=D+A // 681
D=M // 682
@R13 // 683
M=D // 684
@LCL // 685
A=M // 686
D=M // 687
@R13 // 688
D=M-D // 689
@15 // 690
M=D // 691
@Screen.drawLine.LT.19 // 692
D=A // 693
@13 // 694
M=D // 695
@DO_LT // 696
0;JMP // 697
(Screen.drawLine.LT.19)
@15 // 698
M=D // 699
@Screen.drawLine.EQ.18 // 700
D=A // 701
@13 // 702
M=D // 703
@DO_EQ // 704
0;JMP // 705
(Screen.drawLine.EQ.18)
@Screen.drawLine.IfElse5 // 706
D;JNE // 707

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 4")
//,
//          right:
//              PushInstruction("local 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 708
D=M // 709
@4 // 710
A=D+A // 711
D=A // 712
@13 // 713
M=D // 714
@LCL // 715
D=M // 716
@4 // 717
A=D+A // 718
D=M // 719
@R13 // 720
M=D // 721
@LCL // 722
A=M // 723
D=M // 724
@R13 // 725
D=D+M // 726
@13 // 727
A=M // 728
M=D // 729

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              PushInstruction("local 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=argument 1}
//}

@ARG // 730
A=M+1 // 731
D=M // 732
@R13 // 733
M=D // 734
@LCL // 735
A=M+1 // 736
A=A+1 // 737
A=A+1 // 738
D=M // 739
@R13 // 740
D=D+M // 741
@ARG // 742
A=M+1 // 743
M=D // 744

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 745
0;JMP // 746

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 747
0;JMP // 748

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 749
AM=M+1 // 750
A=A-1 // 751
M=0 // 752

////ReturnInstruction{}
@RETURN // 753
0;JMP // 754

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 755
AM=M+1 // 756
A=A-1 // 757
M=0 // 758

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 759
A=M // 760
D=M // 761
@LCL // 762
A=M // 763
M=D // 764

////LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 0")
//,
//                      right:
//                          PushInstruction("argument 1")
//,
//                      binaryOp: "GT"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawHorizontalLine1}}
@LCL // 765
A=M // 766
D=M // 767
@R13 // 768
M=D // 769
@ARG // 770
A=M+1 // 771
D=M // 772
@R13 // 773
D=M-D // 774
@15 // 775
M=D // 776
@Screen.drawHorizontalLine.GT.22 // 777
D=A // 778
@13 // 779
M=D // 780
@DO_GT // 781
0;JMP // 782
(Screen.drawHorizontalLine.GT.22)
D=!D // 783
@15 // 784
M=D // 785
@Screen.drawHorizontalLine.EQ.21 // 786
D=A // 787
@13 // 788
M=D // 789
@DO_EQ // 790
0;JMP // 791
(Screen.drawHorizontalLine.EQ.21)
@WHILE_END_Screen.drawHorizontalLine1 // 792
D;JNE // 793

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          arg[1]:
//              PushInstruction("argument 2")
//          call: CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawHorizontalLine'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 794
A=M // 795
D=M // 796
@SP // 797
AM=M+1 // 798
A=A-1 // 799
M=D // 800
@ARG // 801
A=M+1 // 802
A=A+1 // 803
D=M // 804
@SP // 805
AM=M+1 // 806
A=A-1 // 807
M=D // 808
// call Screen.drawPixel
@7 // 809
D=A // 810
@14 // 811
M=D // 812
@Screen.drawPixel // 813
D=A // 814
@13 // 815
M=D // 816
@Screen.drawHorizontalLine.ret.0 // 817
D=A // 818
@CALL // 819
0;JMP // 820
(Screen.drawHorizontalLine.ret.0)
@SP // 821
AM=M-1 // 822
D=M // 823
@5 // 824
M=D // 825

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 826
A=M // 827
M=M+1 // 828

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 829
0;JMP // 830

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 831
AM=M+1 // 832
A=A-1 // 833
M=0 // 834

////ReturnInstruction{}
@RETURN // 835
0;JMP // 836

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 837
AM=M+1 // 838
A=A-1 // 839
M=0 // 840
@SP // 841
AM=M+1 // 842
A=A-1 // 843
M=0 // 844
@SP // 845
AM=M+1 // 846
A=A-1 // 847
M=0 // 848
@SP // 849
AM=M+1 // 850
A=A-1 // 851
M=0 // 852
@SP // 853
AM=M+1 // 854
A=A-1 // 855
M=0 // 856

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 857
A=M // 858
M=0 // 859

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 2")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@ARG // 860
A=M+1 // 861
A=A+1 // 862
D=M // 863
@LCL // 864
A=M+1 // 865
M=D // 866

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 1")
//,
//          right:
//              PushInstruction("argument 2")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@ARG // 867
A=M+1 // 868
A=A+1 // 869
D=M-1 // 870
D=-D // 871
@LCL // 872
A=M+1 // 873
A=A+1 // 874
M=D // 875

////LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 0")
//,
//                      right:
//                          PushInstruction("local 1")
//,
//                      binaryOp: "GT"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawCircle1}}
@LCL // 876
A=M+1 // 877
D=M // 878
A=A-1 // 879
D=M-D // 880
@15 // 881
M=D // 882
@Screen.drawCircle.GT.25 // 883
D=A // 884
@13 // 885
M=D // 886
@DO_GT // 887
0;JMP // 888
(Screen.drawCircle.GT.25)
D=!D // 889
@15 // 890
M=D // 891
@Screen.drawCircle.EQ.24 // 892
D=A // 893
@13 // 894
M=D // 895
@DO_EQ // 896
0;JMP // 897
(Screen.drawCircle.EQ.24)
@WHILE_END_Screen.drawCircle1 // 898
D;JNE // 899

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "SUB"
//              )          arg[1]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "ADD"
//              )          arg[2]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "ADD"
//              )          call: CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 900
A=M // 901
D=M // 902
@R13 // 903
M=D // 904
@LCL // 905
A=M // 906
D=M // 907
@R13 // 908
D=M-D // 909
@SP // 910
AM=M+1 // 911
A=A-1 // 912
M=D // 913
@ARG // 914
A=M // 915
D=M // 916
@R13 // 917
M=D // 918
@LCL // 919
A=M // 920
D=M // 921
@R13 // 922
D=D+M // 923
@SP // 924
AM=M+1 // 925
A=A-1 // 926
M=D // 927
@ARG // 928
A=M+1 // 929
D=M // 930
@R13 // 931
M=D // 932
@LCL // 933
A=M+1 // 934
D=M // 935
@R13 // 936
D=D+M // 937
@SP // 938
AM=M+1 // 939
A=A-1 // 940
M=D // 941
// call Screen.drawHorizontalLine
@8 // 942
D=A // 943
@14 // 944
M=D // 945
@Screen.drawHorizontalLine // 946
D=A // 947
@13 // 948
M=D // 949
@Screen.drawCircle.ret.0 // 950
D=A // 951
@CALL // 952
0;JMP // 953
(Screen.drawCircle.ret.0)
@SP // 954
AM=M-1 // 955
D=M // 956
@5 // 957
M=D // 958

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "SUB"
//              )          arg[1]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "ADD"
//              )          arg[2]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "SUB"
//              )          call: CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=1, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 959
A=M // 960
D=M // 961
@R13 // 962
M=D // 963
@LCL // 964
A=M // 965
D=M // 966
@R13 // 967
D=M-D // 968
@SP // 969
AM=M+1 // 970
A=A-1 // 971
M=D // 972
@ARG // 973
A=M // 974
D=M // 975
@R13 // 976
M=D // 977
@LCL // 978
A=M // 979
D=M // 980
@R13 // 981
D=D+M // 982
@SP // 983
AM=M+1 // 984
A=A-1 // 985
M=D // 986
@ARG // 987
A=M+1 // 988
D=M // 989
@R13 // 990
M=D // 991
@LCL // 992
A=M+1 // 993
D=M // 994
@R13 // 995
D=M-D // 996
@SP // 997
AM=M+1 // 998
A=A-1 // 999
M=D // 1000
// call Screen.drawHorizontalLine
@8 // 1001
D=A // 1002
@14 // 1003
M=D // 1004
@Screen.drawHorizontalLine // 1005
D=A // 1006
@13 // 1007
M=D // 1008
@Screen.drawCircle.ret.1 // 1009
D=A // 1010
@CALL // 1011
0;JMP // 1012
(Screen.drawCircle.ret.1)
@SP // 1013
AM=M-1 // 1014
D=M // 1015
@5 // 1016
M=D // 1017

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "SUB"
//              )          arg[1]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "ADD"
//              )          arg[2]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "ADD"
//              )          call: CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=2, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 1018
A=M // 1019
D=M // 1020
@R13 // 1021
M=D // 1022
@LCL // 1023
A=M+1 // 1024
D=M // 1025
@R13 // 1026
D=M-D // 1027
@SP // 1028
AM=M+1 // 1029
A=A-1 // 1030
M=D // 1031
@ARG // 1032
A=M // 1033
D=M // 1034
@R13 // 1035
M=D // 1036
@LCL // 1037
A=M+1 // 1038
D=M // 1039
@R13 // 1040
D=D+M // 1041
@SP // 1042
AM=M+1 // 1043
A=A-1 // 1044
M=D // 1045
@ARG // 1046
A=M+1 // 1047
D=M // 1048
@R13 // 1049
M=D // 1050
@LCL // 1051
A=M // 1052
D=M // 1053
@R13 // 1054
D=D+M // 1055
@SP // 1056
AM=M+1 // 1057
A=A-1 // 1058
M=D // 1059
// call Screen.drawHorizontalLine
@8 // 1060
D=A // 1061
@14 // 1062
M=D // 1063
@Screen.drawHorizontalLine // 1064
D=A // 1065
@13 // 1066
M=D // 1067
@Screen.drawCircle.ret.2 // 1068
D=A // 1069
@CALL // 1070
0;JMP // 1071
(Screen.drawCircle.ret.2)
@SP // 1072
AM=M-1 // 1073
D=M // 1074
@5 // 1075
M=D // 1076

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "SUB"
//              )          arg[1]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "ADD"
//              )          arg[2]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "SUB"
//              )          call: CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 1077
A=M // 1078
D=M // 1079
@R13 // 1080
M=D // 1081
@LCL // 1082
A=M+1 // 1083
D=M // 1084
@R13 // 1085
D=M-D // 1086
@SP // 1087
AM=M+1 // 1088
A=A-1 // 1089
M=D // 1090
@ARG // 1091
A=M // 1092
D=M // 1093
@R13 // 1094
M=D // 1095
@LCL // 1096
A=M+1 // 1097
D=M // 1098
@R13 // 1099
D=D+M // 1100
@SP // 1101
AM=M+1 // 1102
A=A-1 // 1103
M=D // 1104
@ARG // 1105
A=M+1 // 1106
D=M // 1107
@R13 // 1108
M=D // 1109
@LCL // 1110
A=M // 1111
D=M // 1112
@R13 // 1113
D=M-D // 1114
@SP // 1115
AM=M+1 // 1116
A=A-1 // 1117
M=D // 1118
// call Screen.drawHorizontalLine
@8 // 1119
D=A // 1120
@14 // 1121
M=D // 1122
@Screen.drawHorizontalLine // 1123
D=A // 1124
@13 // 1125
M=D // 1126
@Screen.drawCircle.ret.3 // 1127
D=A // 1128
@CALL // 1129
0;JMP // 1130
(Screen.drawCircle.ret.3)
@SP // 1131
AM=M-1 // 1132
D=M // 1133
@5 // 1134
M=D // 1135

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 2")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawCircle.IfElse1}}
@LCL // 1136
A=M+1 // 1137
A=A+1 // 1138
D=M // 1139
@15 // 1140
M=D // 1141
@Screen.drawCircle.LT.28 // 1142
D=A // 1143
@13 // 1144
M=D // 1145
@DO_LT // 1146
0;JMP // 1147
(Screen.drawCircle.LT.28)
@15 // 1148
M=D // 1149
@Screen.drawCircle.EQ.27 // 1150
D=A // 1151
@13 // 1152
M=D // 1153
@DO_EQ // 1154
0;JMP // 1155
(Screen.drawCircle.EQ.27)
@Screen.drawCircle.IfElse1 // 1156
D;JNE // 1157

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 2")
//,
//                  right:
//                      BinaryPushGroup(
//                          left:
//                              PushInstruction("local 0")
//,
//                          right:
//                              PushInstruction("local 0")
//,
//                          binaryOp: "ADD"
//                      ),
//                  binaryOp: "ADD"
//              ),
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 1158
A=M+1 // 1159
A=A+1 // 1160
D=M // 1161
@SP // 1162
AM=M+1 // 1163
A=A-1 // 1164
M=D // 1165
@LCL // 1166
A=M // 1167
D=M // 1168
D=D+M // 1169
@SP // 1170
AM=M-1 // 1171
D=D+M // 1172
@3 // 1173
D=D+A // 1174
@LCL // 1175
A=M+1 // 1176
A=A+1 // 1177
M=D // 1178

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 1179
0;JMP // 1180

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 2")
//,
//                  right:
//                      BinaryPushGroup(
//                          left:
//                              BinaryPushGroup(
//                                  left:
//                                      PushInstruction("local 0")
//,
//                                  right:
//                                      PushInstruction("local 1")
//,
//                                  binaryOp: "SUB"
//                              ),
//                          right:
//                              BinaryPushGroup(
//                                  left:
//                                      PushInstruction("local 0")
//,
//                                  right:
//                                      PushInstruction("local 1")
//,
//                                  binaryOp: "SUB"
//                              ),
//                          binaryOp: "ADD"
//                      ),
//                  binaryOp: "ADD"
//              ),
//          right:
//              PushInstruction("constant 5")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 1181
A=M+1 // 1182
A=A+1 // 1183
D=M // 1184
@SP // 1185
AM=M+1 // 1186
A=A-1 // 1187
M=D // 1188
@LCL // 1189
A=M+1 // 1190
D=M // 1191
A=A-1 // 1192
D=M-D // 1193
@R13 // 1194
M=D // 1195
D=D+M // 1196
@SP // 1197
AM=M-1 // 1198
D=D+M // 1199
@5 // 1200
D=D+A // 1201
@LCL // 1202
A=M+1 // 1203
A=A+1 // 1204
M=D // 1205

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 1206
A=M+1 // 1207
M=M-1 // 1208

////LabelInstruction{label='Screen.drawCircle.IfElseEND1}
// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 1209
A=M // 1210
M=M+1 // 1211

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 1212
0;JMP // 1213

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 1214
AM=M+1 // 1215
A=A-1 // 1216
M=0 // 1217

////ReturnInstruction{}
@RETURN // 1218
0;JMP // 1219

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 1220
AM=M+1 // 1221
A=A-1 // 1222
M=0 // 1223
@SP // 1224
AM=M+1 // 1225
A=A-1 // 1226
M=0 // 1227
@SP // 1228
AM=M+1 // 1229
A=A-1 // 1230
M=0 // 1231
@SP // 1232
AM=M+1 // 1233
A=A-1 // 1234
M=0 // 1235
@SP // 1236
AM=M+1 // 1237
A=A-1 // 1238
M=0 // 1239
@SP // 1240
AM=M+1 // 1241
A=A-1 // 1242
M=0 // 1243
@SP // 1244
AM=M+1 // 1245
A=A-1 // 1246
M=0 // 1247
@SP // 1248
AM=M+1 // 1249
A=A-1 // 1250
M=0 // 1251
@SP // 1252
AM=M+1 // 1253
A=A-1 // 1254
M=0 // 1255
@SP // 1256
AM=M+1 // 1257
A=A-1 // 1258
M=0 // 1259

////PushPopPair {
//  push:     UnaryPushGroup (
//      UnaryPushGroup(
//          inner:
//              PushInstruction("constant 1")
//,
//          unaryOp: NEG
//      )    )
//
//  pop: PopInstruction{address=local 9}
//}

@LCL // 1260
D=M // 1261
@9 // 1262
A=D+A // 1263
M=-1 // 1264

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  PushInstruction("Screen.0")
//,
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.0 // 1265
D=!M // 1266
@15 // 1267
M=D // 1268
@Screen.drawRectangle.EQ.29 // 1269
D=A // 1270
@13 // 1271
M=D // 1272
@DO_EQ // 1273
0;JMP // 1274
(Screen.drawRectangle.EQ.29)
@Screen.drawRectangle.IfElse1 // 1275
D;JNE // 1276

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 9}
//}

@LCL // 1277
D=M // 1278
@9 // 1279
A=D+A // 1280
M=0 // 1281

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 1282
0;JMP // 1283

////LabelInstruction{label='Screen.drawRectangle.IfElse1}
// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 1284
A=M+1 // 1285
D=M // 1286
@LCL // 1287
A=M // 1288
M=D // 1289

////LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 0")
//,
//                      right:
//                          PushInstruction("argument 3")
//,
//                      binaryOp: "GT"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawRectangle1}}
@LCL // 1290
A=M // 1291
D=M // 1292
@R13 // 1293
M=D // 1294
@ARG // 1295
A=M+1 // 1296
A=A+1 // 1297
A=A+1 // 1298
D=M // 1299
@R13 // 1300
D=M-D // 1301
@15 // 1302
M=D // 1303
@Screen.drawRectangle.GT.32 // 1304
D=A // 1305
@13 // 1306
M=D // 1307
@DO_GT // 1308
0;JMP // 1309
(Screen.drawRectangle.GT.32)
D=!D // 1310
@15 // 1311
M=D // 1312
@Screen.drawRectangle.EQ.31 // 1313
D=A // 1314
@13 // 1315
M=D // 1316
@DO_EQ // 1317
0;JMP // 1318
(Screen.drawRectangle.EQ.31)
@WHILE_END_Screen.drawRectangle1 // 1319
D;JNE // 1320

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          arg[1]:
//              PushInstruction("constant 16")
//          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@ARG // 1321
A=M // 1322
D=M // 1323
@SP // 1324
AM=M+1 // 1325
A=A-1 // 1326
M=D // 1327
@16 // 1328
D=A // 1329
@SP // 1330
AM=M+1 // 1331
A=A-1 // 1332
M=D // 1333
// call Math.divide
@7 // 1334
D=A // 1335
@14 // 1336
M=D // 1337
@Math.divide // 1338
D=A // 1339
@13 // 1340
M=D // 1341
@Screen.drawRectangle.ret.0 // 1342
D=A // 1343
@CALL // 1344
0;JMP // 1345
(Screen.drawRectangle.ret.0)
@SP // 1346
AM=M-1 // 1347
D=M // 1348
@LCL // 1349
A=M+1 // 1350
M=D // 1351

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 2")
//          arg[1]:
//              PushInstruction("constant 16")
//          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@ARG // 1352
A=M+1 // 1353
A=A+1 // 1354
D=M // 1355
@SP // 1356
AM=M+1 // 1357
A=A-1 // 1358
M=D // 1359
@16 // 1360
D=A // 1361
@SP // 1362
AM=M+1 // 1363
A=A-1 // 1364
M=D // 1365
// call Math.divide
@7 // 1366
D=A // 1367
@14 // 1368
M=D // 1369
@Math.divide // 1370
D=A // 1371
@13 // 1372
M=D // 1373
@Screen.drawRectangle.ret.1 // 1374
D=A // 1375
@CALL // 1376
0;JMP // 1377
(Screen.drawRectangle.ret.1)
@SP // 1378
AM=M-1 // 1379
D=M // 1380
@LCL // 1381
A=M+1 // 1382
A=A+1 // 1383
M=D // 1384

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 15")
//,
//          binaryOp: "AND"
//      )    )
//
//  pop: PopInstruction{address=local 3}
//}

@ARG // 1385
A=M // 1386
D=M // 1387
@15 // 1388
D=D&A // 1389
@LCL // 1390
A=M+1 // 1391
A=A+1 // 1392
A=A+1 // 1393
M=D // 1394

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 2")
//,
//          right:
//              PushInstruction("constant 15")
//,
//          binaryOp: "AND"
//      )    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 1395
D=M // 1396
@4 // 1397
A=D+A // 1398
D=A // 1399
@13 // 1400
M=D // 1401
@ARG // 1402
A=M+1 // 1403
A=A+1 // 1404
D=M // 1405
@15 // 1406
D=D&A // 1407
@13 // 1408
A=M // 1409
M=D // 1410

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          arg[1]:
//              PushInstruction("constant 32")
//          call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=2, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//      )    )
//
//  pop: PopInstruction{address=local 5}
//}

@LCL // 1411
D=M // 1412
@5 // 1413
A=D+A // 1414
D=A // 1415
@SP // 1416
AM=M+1 // 1417
A=A-1 // 1418
M=D // 1419
@LCL // 1420
A=M // 1421
D=M // 1422
@SP // 1423
AM=M+1 // 1424
A=A-1 // 1425
M=D // 1426
@32 // 1427
D=A // 1428
@SP // 1429
AM=M+1 // 1430
A=A-1 // 1431
M=D // 1432
// call Math.multiply
@7 // 1433
D=A // 1434
@14 // 1435
M=D // 1436
@Math.multiply // 1437
D=A // 1438
@13 // 1439
M=D // 1440
@Screen.drawRectangle.ret.2 // 1441
D=A // 1442
@CALL // 1443
0;JMP // 1444
(Screen.drawRectangle.ret.2)
@SP // 1445
AM=M-1 // 1446
D=M // 1447
@SP // 1448
AM=M-1 // 1449
A=M // 1450
M=D // 1451

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 1")
//,
//              right:
//                  PushInstruction("local 2")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse2}}
@LCL // 1452
A=M+1 // 1453
A=A+1 // 1454
D=M // 1455
A=A-1 // 1456
D=M-D // 1457
@15 // 1458
M=D // 1459
@Screen.drawRectangle.EQ.35 // 1460
D=A // 1461
@13 // 1462
M=D // 1463
@DO_EQ // 1464
0;JMP // 1465
(Screen.drawRectangle.EQ.35)
@15 // 1466
M=D // 1467
@Screen.drawRectangle.EQ.34 // 1468
D=A // 1469
@13 // 1470
M=D // 1471
@DO_EQ // 1472
0;JMP // 1473
(Screen.drawRectangle.EQ.34)
@Screen.drawRectangle.IfElse2 // 1474
D;JNE // 1475

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      CallGroup(
//                          arg[0]:
//                              BinaryPushGroup(
//                                  left:
//                                      PushInstruction("local 4")
//,
//                                  right:
//                                      PushInstruction("constant 1")
//,
//                                  binaryOp: "ADD"
//                              )                          call: CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//                      ),
//                  right:
//                      PushInstruction("constant 1")
//,
//                  binaryOp: "SUB"
//              ),
//          right:
//              BinaryPushGroup(
//                  left:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("local 3")
//                          call: CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//                      ),
//                  right:
//                      PushInstruction("constant 1")
//,
//                  binaryOp: "SUB"
//              ),
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 6}
//}

@LCL // 1476
D=M // 1477
@6 // 1478
A=D+A // 1479
D=A // 1480
@SP // 1481
AM=M+1 // 1482
A=A-1 // 1483
M=D // 1484
@LCL // 1485
D=M // 1486
@4 // 1487
A=D+A // 1488
D=M // 1489
@SP // 1490
AM=M+1 // 1491
A=A-1 // 1492
M=D+1 // 1493
// call Math.twoToThe
@6 // 1494
D=A // 1495
@14 // 1496
M=D // 1497
@Math.twoToThe // 1498
D=A // 1499
@13 // 1500
M=D // 1501
@Screen.drawRectangle.ret.3 // 1502
D=A // 1503
@CALL // 1504
0;JMP // 1505
(Screen.drawRectangle.ret.3)
@SP // 1506
AM=M-1 // 1507
D=M // 1508
D=M-1 // 1509
@SP // 1510
AM=M+1 // 1511
A=A-1 // 1512
M=D // 1513
@LCL // 1514
A=M+1 // 1515
A=A+1 // 1516
A=A+1 // 1517
D=M // 1518
@SP // 1519
AM=M+1 // 1520
A=A-1 // 1521
M=D // 1522
// call Math.twoToThe
@6 // 1523
D=A // 1524
@14 // 1525
M=D // 1526
@Math.twoToThe // 1527
D=A // 1528
@13 // 1529
M=D // 1530
@Screen.drawRectangle.ret.4 // 1531
D=A // 1532
@CALL // 1533
0;JMP // 1534
(Screen.drawRectangle.ret.4)
@SP // 1535
AM=M-1 // 1536
D=M // 1537
D=M-1 // 1538
@SP // 1539
AM=M-1 // 1540
D=M-D // 1541
@SP // 1542
AM=M-1 // 1543
A=M // 1544
M=D // 1545

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 5")
//,
//          right:
//              PushInstruction("local 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 7}
//}

@LCL // 1546
D=M // 1547
@7 // 1548
A=D+A // 1549
D=A // 1550
@13 // 1551
M=D // 1552
@LCL // 1553
D=M // 1554
@5 // 1555
A=D+A // 1556
D=M // 1557
@R13 // 1558
M=D // 1559
@LCL // 1560
A=M+1 // 1561
D=M // 1562
@R13 // 1563
D=D+M // 1564
@13 // 1565
A=M // 1566
M=D // 1567

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("Screen.0")
//,
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0 // 1568
D=M // 1569
@15 // 1570
M=D // 1571
@Screen.drawRectangle.EQ.36 // 1572
D=A // 1573
@13 // 1574
M=D // 1575
@DO_EQ // 1576
0;JMP // 1577
(Screen.drawRectangle.EQ.36)
@Screen.drawRectangle.IfElse3 // 1578
D;JNE // 1579

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("local 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 1580
D=M // 1581
@7 // 1582
A=D+A // 1583
D=M // 1584
@16384 // 1585
D=D+A // 1586
@4 // 1587
M=D // 1588

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              PushInstruction("local 6")
//,
//          binaryOp: "OR"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 1589
A=M // 1590
D=M // 1591
@R13 // 1592
M=D // 1593
@LCL // 1594
D=M // 1595
@6 // 1596
A=D+A // 1597
D=M // 1598
@R13 // 1599
D=D|M // 1600
@THAT // 1601
A=M // 1602
M=D // 1603

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 1604
0;JMP // 1605

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("local 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 1606
D=M // 1607
@7 // 1608
A=D+A // 1609
D=M // 1610
@16384 // 1611
D=D+A // 1612
@4 // 1613
M=D // 1614

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              UnaryPushGroup(
//                  inner:
//                      PushInstruction("local 6")
//,
//                  unaryOp: NOT
//              ),
//          binaryOp: "AND"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 1615
A=M // 1616
D=M // 1617
@R13 // 1618
M=D // 1619
@LCL // 1620
D=M // 1621
@6 // 1622
A=D+A // 1623
D=!M // 1624
@R13 // 1625
D=D&M // 1626
@THAT // 1627
A=M // 1628
M=D // 1629

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 1630
0;JMP // 1631

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////PushPopPair {
//  push:     UnaryPushGroup (
//      UnaryPushGroup(
//          inner:
//              BinaryPushGroup(
//                  left:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("local 3")
//                          call: CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=5, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//                      ),
//                  right:
//                      PushInstruction("constant 1")
//,
//                  binaryOp: "SUB"
//              ),
//          unaryOp: NOT
//      )    )
//
//  pop: PopInstruction{address=local 6}
//}

@LCL // 1632
D=M // 1633
@6 // 1634
A=D+A // 1635
D=A // 1636
@SP // 1637
AM=M+1 // 1638
A=A-1 // 1639
M=D // 1640
@LCL // 1641
A=M+1 // 1642
A=A+1 // 1643
A=A+1 // 1644
D=M // 1645
@SP // 1646
AM=M+1 // 1647
A=A-1 // 1648
M=D // 1649
// call Math.twoToThe
@6 // 1650
D=A // 1651
@14 // 1652
M=D // 1653
@Math.twoToThe // 1654
D=A // 1655
@13 // 1656
M=D // 1657
@Screen.drawRectangle.ret.5 // 1658
D=A // 1659
@CALL // 1660
0;JMP // 1661
(Screen.drawRectangle.ret.5)
@SP // 1662
AM=M-1 // 1663
D=M // 1664
D=M-1 // 1665
D=!D // 1666
@SP // 1667
AM=M-1 // 1668
A=M // 1669
M=D // 1670

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 5")
//,
//          right:
//              PushInstruction("local 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 7}
//}

@LCL // 1671
D=M // 1672
@7 // 1673
A=D+A // 1674
D=A // 1675
@13 // 1676
M=D // 1677
@LCL // 1678
D=M // 1679
@5 // 1680
A=D+A // 1681
D=M // 1682
@R13 // 1683
M=D // 1684
@LCL // 1685
A=M+1 // 1686
D=M // 1687
@R13 // 1688
D=D+M // 1689
@13 // 1690
A=M // 1691
M=D // 1692

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("Screen.0")
//,
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0 // 1693
D=M // 1694
@15 // 1695
M=D // 1696
@Screen.drawRectangle.EQ.37 // 1697
D=A // 1698
@13 // 1699
M=D // 1700
@DO_EQ // 1701
0;JMP // 1702
(Screen.drawRectangle.EQ.37)
@Screen.drawRectangle.IfElse4 // 1703
D;JNE // 1704

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("local 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 1705
D=M // 1706
@7 // 1707
A=D+A // 1708
D=M // 1709
@16384 // 1710
D=D+A // 1711
@4 // 1712
M=D // 1713

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              PushInstruction("local 6")
//,
//          binaryOp: "OR"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 1714
A=M // 1715
D=M // 1716
@R13 // 1717
M=D // 1718
@LCL // 1719
D=M // 1720
@6 // 1721
A=D+A // 1722
D=M // 1723
@R13 // 1724
D=D|M // 1725
@THAT // 1726
A=M // 1727
M=D // 1728

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 1729
0;JMP // 1730

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("local 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 1731
D=M // 1732
@7 // 1733
A=D+A // 1734
D=M // 1735
@16384 // 1736
D=D+A // 1737
@4 // 1738
M=D // 1739

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              UnaryPushGroup(
//                  inner:
//                      PushInstruction("local 6")
//,
//                  unaryOp: NOT
//              ),
//          binaryOp: "AND"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 1740
A=M // 1741
D=M // 1742
@R13 // 1743
M=D // 1744
@LCL // 1745
D=M // 1746
@6 // 1747
A=D+A // 1748
D=!M // 1749
@R13 // 1750
D=D&M // 1751
@THAT // 1752
A=M // 1753
M=D // 1754

////LabelInstruction{label='Screen.drawRectangle.IfElseEND4}
// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 8}
//}

@LCL // 1755
D=M // 1756
@8 // 1757
A=D+A // 1758
D=A // 1759
@13 // 1760
M=D // 1761
@LCL // 1762
A=M+1 // 1763
D=M+1 // 1764
@13 // 1765
A=M // 1766
M=D // 1767

////LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 8")
//,
//              right:
//                  PushInstruction("local 2")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawRectangle2}}
@LCL // 1768
D=M // 1769
@8 // 1770
A=D+A // 1771
D=M // 1772
@R13 // 1773
M=D // 1774
@LCL // 1775
A=M+1 // 1776
A=A+1 // 1777
D=M // 1778
@R13 // 1779
D=M-D // 1780
@15 // 1781
M=D // 1782
@Screen.drawRectangle.LT.40 // 1783
D=A // 1784
@13 // 1785
M=D // 1786
@DO_LT // 1787
0;JMP // 1788
(Screen.drawRectangle.LT.40)
@15 // 1789
M=D // 1790
@Screen.drawRectangle.EQ.39 // 1791
D=A // 1792
@13 // 1793
M=D // 1794
@DO_EQ // 1795
0;JMP // 1796
(Screen.drawRectangle.EQ.39)
@WHILE_END_Screen.drawRectangle2 // 1797
D;JNE // 1798

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 5")
//,
//          right:
//              PushInstruction("local 8")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 7}
//}

@LCL // 1799
D=M // 1800
@7 // 1801
A=D+A // 1802
D=A // 1803
@13 // 1804
M=D // 1805
@LCL // 1806
D=M // 1807
@8 // 1808
A=D+A // 1809
D=M // 1810
A=A-1 // 1811
A=A-1 // 1812
A=A-1 // 1813
D=D+M // 1814
@13 // 1815
A=M // 1816
M=D // 1817

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 9")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@LCL // 1818
D=M // 1819
@9 // 1820
A=D+A // 1821
D=M // 1822
@THAT // 1823
A=M // 1824
M=D // 1825

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 8")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 8}
//}

@LCL // 1826
D=M // 1827
@8 // 1828
A=D+A // 1829
M=M+1 // 1830

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 1831
0;JMP // 1832

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              CallGroup(
//                  arg[0]:
//                      BinaryPushGroup(
//                          left:
//                              PushInstruction("local 4")
//,
//                          right:
//                              PushInstruction("constant 1")
//,
//                          binaryOp: "ADD"
//                      )                  call: CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=6, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}
//              ),
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 6}
//}

@LCL // 1833
D=M // 1834
@6 // 1835
A=D+A // 1836
D=A // 1837
@SP // 1838
AM=M+1 // 1839
A=A-1 // 1840
M=D // 1841
@LCL // 1842
D=M // 1843
@4 // 1844
A=D+A // 1845
D=M // 1846
@SP // 1847
AM=M+1 // 1848
A=A-1 // 1849
M=D+1 // 1850
// call Math.twoToThe
@6 // 1851
D=A // 1852
@14 // 1853
M=D // 1854
@Math.twoToThe // 1855
D=A // 1856
@13 // 1857
M=D // 1858
@Screen.drawRectangle.ret.6 // 1859
D=A // 1860
@CALL // 1861
0;JMP // 1862
(Screen.drawRectangle.ret.6)
@SP // 1863
AM=M-1 // 1864
D=M // 1865
D=M-1 // 1866
@SP // 1867
AM=M-1 // 1868
A=M // 1869
M=D // 1870

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 5")
//,
//          right:
//              PushInstruction("local 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 7}
//}

@LCL // 1871
D=M // 1872
@7 // 1873
A=D+A // 1874
D=A // 1875
@13 // 1876
M=D // 1877
@LCL // 1878
D=M // 1879
@5 // 1880
A=D+A // 1881
D=M // 1882
A=A-1 // 1883
A=A-1 // 1884
A=A-1 // 1885
D=D+M // 1886
@13 // 1887
A=M // 1888
M=D // 1889

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("Screen.0")
//,
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0 // 1890
D=M // 1891
@15 // 1892
M=D // 1893
@Screen.drawRectangle.EQ.41 // 1894
D=A // 1895
@13 // 1896
M=D // 1897
@DO_EQ // 1898
0;JMP // 1899
(Screen.drawRectangle.EQ.41)
@Screen.drawRectangle.IfElse5 // 1900
D;JNE // 1901

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("local 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 1902
D=M // 1903
@7 // 1904
A=D+A // 1905
D=M // 1906
@16384 // 1907
D=D+A // 1908
@4 // 1909
M=D // 1910

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              PushInstruction("local 6")
//,
//          binaryOp: "OR"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 1911
A=M // 1912
D=M // 1913
@R13 // 1914
M=D // 1915
@LCL // 1916
D=M // 1917
@6 // 1918
A=D+A // 1919
D=M // 1920
@R13 // 1921
D=D|M // 1922
@THAT // 1923
A=M // 1924
M=D // 1925

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 1926
0;JMP // 1927

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("local 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 1928
D=M // 1929
@7 // 1930
A=D+A // 1931
D=M // 1932
@16384 // 1933
D=D+A // 1934
@4 // 1935
M=D // 1936

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              UnaryPushGroup(
//                  inner:
//                      PushInstruction("local 6")
//,
//                  unaryOp: NOT
//              ),
//          binaryOp: "AND"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 1937
A=M // 1938
D=M // 1939
@R13 // 1940
M=D // 1941
@LCL // 1942
D=M // 1943
@6 // 1944
A=D+A // 1945
D=!M // 1946
@R13 // 1947
D=D&M // 1948
@THAT // 1949
A=M // 1950
M=D // 1951

////LabelInstruction{label='Screen.drawRectangle.IfElseEND5}
// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND2}
// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 1952
A=M // 1953
M=M+1 // 1954

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 1955
0;JMP // 1956

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 1957
AM=M+1 // 1958
A=A-1 // 1959
M=0 // 1960

////ReturnInstruction{}
@RETURN // 1961
0;JMP // 1962

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 1963
AM=M+1 // 1964
A=A-1 // 1965
M=0 // 1966

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 3")
//          call: CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}
//      )    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@3 // 1967
D=A // 1968
@SP // 1969
AM=M+1 // 1970
A=A-1 // 1971
M=D // 1972
// call Memory.alloc
@6 // 1973
D=A // 1974
@14 // 1975
M=D // 1976
@Memory.alloc // 1977
D=A // 1978
@13 // 1979
M=D // 1980
@String.new.ret.0 // 1981
D=A // 1982
@CALL // 1983
0;JMP // 1984
(String.new.ret.0)
@SP // 1985
AM=M-1 // 1986
D=M // 1987
@3 // 1988
M=D // 1989

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.new.IfElse1}}
@ARG // 1990
A=M // 1991
D=M // 1992
@15 // 1993
M=D // 1994
@String.new.EQ.2 // 1995
D=A // 1996
@13 // 1997
M=D // 1998
@DO_EQ // 1999
0;JMP // 2000
(String.new.EQ.2)
@15 // 2001
M=D // 2002
@String.new.EQ.1 // 2003
D=A // 2004
@13 // 2005
M=D // 2006
@DO_EQ // 2007
0;JMP // 2008
(String.new.EQ.1)
@String.new.IfElse1 // 2009
D;JNE // 2010

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=this 0}
//}

@THIS // 2011
A=M // 2012
M=0 // 2013

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 2014
0;JMP // 2015

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}
//      )    )
//
//  pop: PopInstruction{address=this 0}
//}

@ARG // 2016
A=M // 2017
D=M // 2018
@SP // 2019
AM=M+1 // 2020
A=A-1 // 2021
M=D // 2022
// call Array.new
@6 // 2023
D=A // 2024
@14 // 2025
M=D // 2026
@Array.new // 2027
D=A // 2028
@13 // 2029
M=D // 2030
@String.new.ret.1 // 2031
D=A // 2032
@CALL // 2033
0;JMP // 2034
(String.new.ret.1)
@SP // 2035
AM=M-1 // 2036
D=M // 2037
@THIS // 2038
A=M // 2039
M=D // 2040

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=this 2}
//}

@ARG // 2041
A=M // 2042
D=M // 2043
@THIS // 2044
A=M+1 // 2045
A=A+1 // 2046
M=D // 2047

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=this 1}
//}

@THIS // 2048
A=M+1 // 2049
M=0 // 2050

////PushInstruction (
//  PushInstruction("pointer 0")
//)

@3 // 2051
D=M // 2052
@SP // 2053
AM=M+1 // 2054
A=A-1 // 2055
M=D // 2056

////ReturnInstruction{}
@RETURN // 2057
0;JMP // 2058

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2059
A=M // 2060
D=M // 2061
@3 // 2062
M=D // 2063

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("this 0")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "EQ"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.dispose.IfElse1}}
@THIS // 2064
A=M // 2065
D=M // 2066
@15 // 2067
M=D // 2068
@String.dispose.EQ.5 // 2069
D=A // 2070
@13 // 2071
M=D // 2072
@DO_EQ // 2073
0;JMP // 2074
(String.dispose.EQ.5)
D=!D // 2075
@15 // 2076
M=D // 2077
@String.dispose.EQ.4 // 2078
D=A // 2079
@13 // 2080
M=D // 2081
@DO_EQ // 2082
0;JMP // 2083
(String.dispose.EQ.4)
@String.dispose.IfElse1 // 2084
D;JNE // 2085

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("this 0")
//          call: CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THIS // 2086
A=M // 2087
D=M // 2088
@SP // 2089
AM=M+1 // 2090
A=A-1 // 2091
M=D // 2092
// call Array.dispose
@6 // 2093
D=A // 2094
@14 // 2095
M=D // 2096
@Array.dispose // 2097
D=A // 2098
@13 // 2099
M=D // 2100
@String.dispose.ret.0 // 2101
D=A // 2102
@CALL // 2103
0;JMP // 2104
(String.dispose.ret.0)
@SP // 2105
AM=M-1 // 2106
D=M // 2107
@5 // 2108
M=D // 2109

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 2110
0;JMP // 2111

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 2112
AM=M+1 // 2113
A=A-1 // 2114
M=0 // 2115

////ReturnInstruction{}
@RETURN // 2116
0;JMP // 2117

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2118
A=M // 2119
D=M // 2120
@3 // 2121
M=D // 2122

////PushInstruction (
//  PushInstruction("this 1")
//)

@THIS // 2123
A=M+1 // 2124
D=M // 2125
@SP // 2126
AM=M+1 // 2127
A=A-1 // 2128
M=D // 2129

////ReturnInstruction{}
@RETURN // 2130
0;JMP // 2131

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2132
A=M // 2133
D=M // 2134
@3 // 2135
M=D // 2136

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("this 0")
//,
//          right:
//              PushInstruction("argument 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@THIS // 2137
A=M // 2138
D=M // 2139
@R13 // 2140
M=D // 2141
@ARG // 2142
A=M+1 // 2143
D=M // 2144
@R13 // 2145
D=D+M // 2146
@4 // 2147
M=D // 2148

////PushInstruction (
//  PushInstruction("that 0")
//)

@THAT // 2149
A=M // 2150
D=M // 2151
@SP // 2152
AM=M+1 // 2153
A=A-1 // 2154
M=D // 2155

////ReturnInstruction{}
@RETURN // 2156
0;JMP // 2157

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2158
A=M // 2159
D=M // 2160
@3 // 2161
M=D // 2162

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 2")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("this 0")
//,
//                  right:
//                      PushInstruction("argument 1")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@ARG // 2163
A=M+1 // 2164
A=A+1 // 2165
D=M // 2166
@THAT // 2167
A=M // 2168
M=D // 2169

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 2170
AM=M+1 // 2171
A=A-1 // 2172
M=0 // 2173

////ReturnInstruction{}
@RETURN // 2174
0;JMP // 2175

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 2176
AM=M+1 // 2177
A=A-1 // 2178
M=0 // 2179

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2180
A=M // 2181
D=M // 2182
@3 // 2183
M=D // 2184

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("this 1")
//,
//              right:
//                  PushInstruction("this 2")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.appendChar.IfElse1}}
@THIS // 2185
A=M+1 // 2186
A=A+1 // 2187
D=M // 2188
A=A-1 // 2189
D=M-D // 2190
@15 // 2191
M=D // 2192
@String.appendChar.EQ.8 // 2193
D=A // 2194
@13 // 2195
M=D // 2196
@DO_EQ // 2197
0;JMP // 2198
(String.appendChar.EQ.8)
@15 // 2199
M=D // 2200
@String.appendChar.EQ.7 // 2201
D=A // 2202
@13 // 2203
M=D // 2204
@DO_EQ // 2205
0;JMP // 2206
(String.appendChar.EQ.7)
@String.appendChar.IfElse1 // 2207
D;JNE // 2208

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("this 2")
//,
//                  right:
//                      PushInstruction("this 2")
//,
//                  binaryOp: "ADD"
//              )          call: CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@THIS // 2209
A=M+1 // 2210
A=A+1 // 2211
D=M // 2212
D=D+M // 2213
@SP // 2214
AM=M+1 // 2215
A=A-1 // 2216
M=D // 2217
// call Array.new
@6 // 2218
D=A // 2219
@14 // 2220
M=D // 2221
@Array.new // 2222
D=A // 2223
@13 // 2224
M=D // 2225
@String.appendChar.ret.0 // 2226
D=A // 2227
@CALL // 2228
0;JMP // 2229
(String.appendChar.ret.0)
@SP // 2230
AM=M-1 // 2231
D=M // 2232
@LCL // 2233
A=M // 2234
M=D // 2235

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("this 0")
//          arg[1]:
//              PushInstruction("local 0")
//          arg[2]:
//              PushInstruction("this 1")
//          call: CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THIS // 2236
A=M // 2237
D=M // 2238
@SP // 2239
AM=M+1 // 2240
A=A-1 // 2241
M=D // 2242
@LCL // 2243
A=M // 2244
D=M // 2245
@SP // 2246
AM=M+1 // 2247
A=A-1 // 2248
M=D // 2249
@THIS // 2250
A=M+1 // 2251
D=M // 2252
@SP // 2253
AM=M+1 // 2254
A=A-1 // 2255
M=D // 2256
// call Memory.copy
@8 // 2257
D=A // 2258
@14 // 2259
M=D // 2260
@Memory.copy // 2261
D=A // 2262
@13 // 2263
M=D // 2264
@String.appendChar.ret.1 // 2265
D=A // 2266
@CALL // 2267
0;JMP // 2268
(String.appendChar.ret.1)
@SP // 2269
AM=M-1 // 2270
D=M // 2271
@5 // 2272
M=D // 2273

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("this 0")
//          call: CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THIS // 2274
A=M // 2275
D=M // 2276
@SP // 2277
AM=M+1 // 2278
A=A-1 // 2279
M=D // 2280
// call Array.dispose
@6 // 2281
D=A // 2282
@14 // 2283
M=D // 2284
@Array.dispose // 2285
D=A // 2286
@13 // 2287
M=D // 2288
@String.appendChar.ret.2 // 2289
D=A // 2290
@CALL // 2291
0;JMP // 2292
(String.appendChar.ret.2)
@SP // 2293
AM=M-1 // 2294
D=M // 2295
@5 // 2296
M=D // 2297

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("this 2")
//,
//          right:
//              PushInstruction("this 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=this 2}
//}

@THIS // 2298
A=M+1 // 2299
A=A+1 // 2300
D=M // 2301
D=D+M // 2302
@THIS // 2303
A=M+1 // 2304
A=A+1 // 2305
M=D // 2306

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 0")
//    )
//
//  pop: PopInstruction{address=this 0}
//}

@LCL // 2307
A=M // 2308
D=M // 2309
@THIS // 2310
A=M // 2311
M=D // 2312

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 2313
0;JMP // 2314

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("this 0")
//,
//                  right:
//                      PushInstruction("this 1")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@ARG // 2315
A=M+1 // 2316
D=M // 2317
@THAT // 2318
A=M // 2319
M=D // 2320

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("this 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=this 1}
//}

@THIS // 2321
A=M+1 // 2322
M=M+1 // 2323

////PushInstruction (
//  PushInstruction("pointer 0")
//)

@3 // 2324
D=M // 2325
@SP // 2326
AM=M+1 // 2327
A=A-1 // 2328
M=D // 2329

////ReturnInstruction{}
@RETURN // 2330
0;JMP // 2331

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2332
A=M // 2333
D=M // 2334
@3 // 2335
M=D // 2336

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("this 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=this 1}
//}

@THIS // 2337
A=M+1 // 2338
M=M-1 // 2339

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 2340
AM=M+1 // 2341
A=A-1 // 2342
M=0 // 2343

////ReturnInstruction{}
@RETURN // 2344
0;JMP // 2345

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 2346
AM=M+1 // 2347
A=A-1 // 2348
M=0 // 2349
@SP // 2350
AM=M+1 // 2351
A=A-1 // 2352
M=0 // 2353

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2354
A=M // 2355
D=M // 2356
@3 // 2357
M=D // 2358

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 2359
A=M+1 // 2360
M=1 // 2361

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 2362
A=M // 2363
M=0 // 2364

////LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 1")
//,
//              right:
//                  PushInstruction("this 1")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_String.intValue1}}
@LCL // 2365
A=M+1 // 2366
D=M // 2367
@R13 // 2368
M=D // 2369
@THIS // 2370
A=M+1 // 2371
D=M // 2372
@R13 // 2373
D=M-D // 2374
@15 // 2375
M=D // 2376
@String.intValue.LT.11 // 2377
D=A // 2378
@13 // 2379
M=D // 2380
@DO_LT // 2381
0;JMP // 2382
(String.intValue.LT.11)
@15 // 2383
M=D // 2384
@String.intValue.EQ.10 // 2385
D=A // 2386
@13 // 2387
M=D // 2388
@DO_EQ // 2389
0;JMP // 2390
(String.intValue.EQ.10)
@WHILE_END_String.intValue1 // 2391
D;JNE // 2392

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              CallGroup(
//                  arg[0]:
//                      PushInstruction("local 0")
//                  arg[1]:
//                      PushInstruction("constant 10")
//                  call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.intValue'}
//              ),
//          right:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("that 0")
//,
//                  right:
//                      PushInstruction("constant 48")
//,
//                  binaryOp: "SUB"
//              ),
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 2393
A=M // 2394
D=M // 2395
@SP // 2396
AM=M+1 // 2397
A=A-1 // 2398
M=D // 2399
@10 // 2400
D=A // 2401
@SP // 2402
AM=M+1 // 2403
A=A-1 // 2404
M=D // 2405
// call Math.multiply
@7 // 2406
D=A // 2407
@14 // 2408
M=D // 2409
@Math.multiply // 2410
D=A // 2411
@13 // 2412
M=D // 2413
@String.intValue.ret.0 // 2414
D=A // 2415
@CALL // 2416
0;JMP // 2417
(String.intValue.ret.0)
@THAT // 2418
A=M // 2419
D=M // 2420
@48 // 2421
D=D-A // 2422
@SP // 2423
AM=M-1 // 2424
D=D+M // 2425
@LCL // 2426
A=M // 2427
M=D // 2428

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 2429
A=M+1 // 2430
M=M+1 // 2431

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 2432
0;JMP // 2433

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 2434
A=M // 2435
D=M // 2436
@SP // 2437
AM=M+1 // 2438
A=A-1 // 2439
M=D // 2440

////ReturnInstruction{}
@RETURN // 2441
0;JMP // 2442

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 2443
AM=M+1 // 2444
A=A-1 // 2445
M=0 // 2446
@SP // 2447
AM=M+1 // 2448
A=A-1 // 2449
M=0 // 2450
@SP // 2451
AM=M+1 // 2452
A=A-1 // 2453
M=0 // 2454
@SP // 2455
AM=M+1 // 2456
A=A-1 // 2457
M=0 // 2458
@SP // 2459
AM=M+1 // 2460
A=A-1 // 2461
M=0 // 2462
@SP // 2463
AM=M+1 // 2464
A=A-1 // 2465
M=0 // 2466

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=pointer 0}
//}

@ARG // 2467
A=M // 2468
D=M // 2469
@3 // 2470
M=D // 2471

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=this 1}
//}

@THIS // 2472
A=M+1 // 2473
M=0 // 2474

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 2475
D=M // 2476
@4 // 2477
A=D+A // 2478
M=0 // 2479

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.setInt.IfElse1}}
@ARG // 2480
A=M+1 // 2481
D=M // 2482
@15 // 2483
M=D // 2484
@String.setInt.EQ.14 // 2485
D=A // 2486
@13 // 2487
M=D // 2488
@DO_EQ // 2489
0;JMP // 2490
(String.setInt.EQ.14)
@15 // 2491
M=D // 2492
@String.setInt.EQ.13 // 2493
D=A // 2494
@13 // 2495
M=D // 2496
@DO_EQ // 2497
0;JMP // 2498
(String.setInt.EQ.13)
@String.setInt.IfElse1 // 2499
D;JNE // 2500

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 48")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2501
D=M // 2502
@SP // 2503
AM=M+1 // 2504
A=A-1 // 2505
M=D // 2506
@48 // 2507
D=A // 2508
@SP // 2509
AM=M+1 // 2510
A=A-1 // 2511
M=D // 2512
// call String.appendChar
@7 // 2513
D=A // 2514
@14 // 2515
M=D // 2516
@String.appendChar // 2517
D=A // 2518
@13 // 2519
M=D // 2520
@String.setInt.ret.0 // 2521
D=A // 2522
@CALL // 2523
0;JMP // 2524
(String.setInt.ret.0)
@SP // 2525
AM=M-1 // 2526
D=M // 2527
@5 // 2528
M=D // 2529

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 2530
AM=M+1 // 2531
A=A-1 // 2532
M=0 // 2533

////ReturnInstruction{}
@RETURN // 2534
0;JMP // 2535

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 2536
0;JMP // 2537

////LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)

////LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.setInt.IfElse2}}
@ARG // 2538
A=M+1 // 2539
D=M // 2540
@15 // 2541
M=D // 2542
@String.setInt.LT.17 // 2543
D=A // 2544
@13 // 2545
M=D // 2546
@DO_LT // 2547
0;JMP // 2548
(String.setInt.LT.17)
@15 // 2549
M=D // 2550
@String.setInt.EQ.16 // 2551
D=A // 2552
@13 // 2553
M=D // 2554
@DO_EQ // 2555
0;JMP // 2556
(String.setInt.EQ.16)
@String.setInt.IfElse2 // 2557
D;JNE // 2558

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 2559
D=M // 2560
@4 // 2561
A=D+A // 2562
M=1 // 2563

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 1")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "LT"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          BinaryPushGroup(
//                              left:
//                                  PushInstruction("argument 1")
//,
//                              right:
//                                  PushInstruction("constant 32767")
//,
//                              binaryOp: "AND"
//                          ),
//                      right:
//                          PushInstruction("constant 32767")
//,
//                      binaryOp: "EQ"
//                  ),
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.setInt.IfElse3}}
@ARG // 2564
A=M+1 // 2565
D=M // 2566
@15 // 2567
M=D // 2568
@String.setInt.LT.21 // 2569
D=A // 2570
@13 // 2571
M=D // 2572
@DO_LT // 2573
0;JMP // 2574
(String.setInt.LT.21)
@SP // 2575
AM=M+1 // 2576
A=A-1 // 2577
M=D // 2578
@ARG // 2579
A=M+1 // 2580
D=M // 2581
@32767 // 2582
D=D&A // 2583
@32767 // 2584
D=D-A // 2585
@15 // 2586
M=D // 2587
@String.setInt.EQ.22 // 2588
D=A // 2589
@13 // 2590
M=D // 2591
@DO_EQ // 2592
0;JMP // 2593
(String.setInt.EQ.22)
@SP // 2594
AM=M-1 // 2595
D=D&M // 2596
@15 // 2597
M=D // 2598
@String.setInt.EQ.20 // 2599
D=A // 2600
@13 // 2601
M=D // 2602
@DO_EQ // 2603
0;JMP // 2604
(String.setInt.EQ.20)
@String.setInt.IfElse3 // 2605
D;JNE // 2606

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 45")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2607
D=M // 2608
@SP // 2609
AM=M+1 // 2610
A=A-1 // 2611
M=D // 2612
@45 // 2613
D=A // 2614
@SP // 2615
AM=M+1 // 2616
A=A-1 // 2617
M=D // 2618
// call String.appendChar
@7 // 2619
D=A // 2620
@14 // 2621
M=D // 2622
@String.appendChar // 2623
D=A // 2624
@13 // 2625
M=D // 2626
@String.setInt.ret.1 // 2627
D=A // 2628
@CALL // 2629
0;JMP // 2630
(String.setInt.ret.1)
@SP // 2631
AM=M-1 // 2632
D=M // 2633
@5 // 2634
M=D // 2635

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 51")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2636
D=M // 2637
@SP // 2638
AM=M+1 // 2639
A=A-1 // 2640
M=D // 2641
@51 // 2642
D=A // 2643
@SP // 2644
AM=M+1 // 2645
A=A-1 // 2646
M=D // 2647
// call String.appendChar
@7 // 2648
D=A // 2649
@14 // 2650
M=D // 2651
@String.appendChar // 2652
D=A // 2653
@13 // 2654
M=D // 2655
@String.setInt.ret.2 // 2656
D=A // 2657
@CALL // 2658
0;JMP // 2659
(String.setInt.ret.2)
@SP // 2660
AM=M-1 // 2661
D=M // 2662
@5 // 2663
M=D // 2664

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 50")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2665
D=M // 2666
@SP // 2667
AM=M+1 // 2668
A=A-1 // 2669
M=D // 2670
@50 // 2671
D=A // 2672
@SP // 2673
AM=M+1 // 2674
A=A-1 // 2675
M=D // 2676
// call String.appendChar
@7 // 2677
D=A // 2678
@14 // 2679
M=D // 2680
@String.appendChar // 2681
D=A // 2682
@13 // 2683
M=D // 2684
@String.setInt.ret.3 // 2685
D=A // 2686
@CALL // 2687
0;JMP // 2688
(String.setInt.ret.3)
@SP // 2689
AM=M-1 // 2690
D=M // 2691
@5 // 2692
M=D // 2693

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 55")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=4, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2694
D=M // 2695
@SP // 2696
AM=M+1 // 2697
A=A-1 // 2698
M=D // 2699
@55 // 2700
D=A // 2701
@SP // 2702
AM=M+1 // 2703
A=A-1 // 2704
M=D // 2705
// call String.appendChar
@7 // 2706
D=A // 2707
@14 // 2708
M=D // 2709
@String.appendChar // 2710
D=A // 2711
@13 // 2712
M=D // 2713
@String.setInt.ret.4 // 2714
D=A // 2715
@CALL // 2716
0;JMP // 2717
(String.setInt.ret.4)
@SP // 2718
AM=M-1 // 2719
D=M // 2720
@5 // 2721
M=D // 2722

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 54")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=5, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2723
D=M // 2724
@SP // 2725
AM=M+1 // 2726
A=A-1 // 2727
M=D // 2728
@54 // 2729
D=A // 2730
@SP // 2731
AM=M+1 // 2732
A=A-1 // 2733
M=D // 2734
// call String.appendChar
@7 // 2735
D=A // 2736
@14 // 2737
M=D // 2738
@String.appendChar // 2739
D=A // 2740
@13 // 2741
M=D // 2742
@String.setInt.ret.5 // 2743
D=A // 2744
@CALL // 2745
0;JMP // 2746
(String.setInt.ret.5)
@SP // 2747
AM=M-1 // 2748
D=M // 2749
@5 // 2750
M=D // 2751

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 56")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=6, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 2752
D=M // 2753
@SP // 2754
AM=M+1 // 2755
A=A-1 // 2756
M=D // 2757
@56 // 2758
D=A // 2759
@SP // 2760
AM=M+1 // 2761
A=A-1 // 2762
M=D // 2763
// call String.appendChar
@7 // 2764
D=A // 2765
@14 // 2766
M=D // 2767
@String.appendChar // 2768
D=A // 2769
@13 // 2770
M=D // 2771
@String.setInt.ret.6 // 2772
D=A // 2773
@CALL // 2774
0;JMP // 2775
(String.setInt.ret.6)
@SP // 2776
AM=M-1 // 2777
D=M // 2778
@5 // 2779
M=D // 2780

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 2781
AM=M+1 // 2782
A=A-1 // 2783
M=0 // 2784

////ReturnInstruction{}
@RETURN // 2785
0;JMP // 2786

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 2787
0;JMP // 2788

////LabelInstruction{label='String.setInt.IfElse3}
// label String.setInt.IfElse3
(String.setInt.IfElse3)

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushPopPair {
//  push:     UnaryPushGroup (
//      UnaryPushGroup(
//          inner:
//              PushInstruction("argument 1")
//,
//          unaryOp: NEG
//      )    )
//
//  pop: PopInstruction{address=argument 1}
//}

@ARG // 2789
A=M+1 // 2790
M=-M // 2791

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 2792
0;JMP // 2793

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@ARG // 2794
A=M+1 // 2795
D=M // 2796
@LCL // 2797
A=M+1 // 2798
A=A+1 // 2799
M=D // 2800

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 3}
//}

@LCL // 2801
A=M+1 // 2802
A=A+1 // 2803
A=A+1 // 2804
M=0 // 2805

////LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 2")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt1}}
@LCL // 2806
A=M+1 // 2807
A=A+1 // 2808
D=M // 2809
@15 // 2810
M=D // 2811
@String.setInt.GT.25 // 2812
D=A // 2813
@13 // 2814
M=D // 2815
@DO_GT // 2816
0;JMP // 2817
(String.setInt.GT.25)
@15 // 2818
M=D // 2819
@String.setInt.EQ.24 // 2820
D=A // 2821
@13 // 2822
M=D // 2823
@DO_EQ // 2824
0;JMP // 2825
(String.setInt.EQ.24)
@WHILE_END_String.setInt1 // 2826
D;JNE // 2827

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 2")
//          arg[1]:
//              PushInstruction("constant 10")
//          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 2828
A=M+1 // 2829
A=A+1 // 2830
D=M // 2831
@SP // 2832
AM=M+1 // 2833
A=A-1 // 2834
M=D // 2835
@10 // 2836
D=A // 2837
@SP // 2838
AM=M+1 // 2839
A=A-1 // 2840
M=D // 2841
// call Math.divide
@7 // 2842
D=A // 2843
@14 // 2844
M=D // 2845
@Math.divide // 2846
D=A // 2847
@13 // 2848
M=D // 2849
@String.setInt.ret.7 // 2850
D=A // 2851
@CALL // 2852
0;JMP // 2853
(String.setInt.ret.7)
@SP // 2854
AM=M-1 // 2855
D=M // 2856
@LCL // 2857
A=M+1 // 2858
A=A+1 // 2859
M=D // 2860

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 3")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 3}
//}

@LCL // 2861
A=M+1 // 2862
A=A+1 // 2863
A=A+1 // 2864
M=M+1 // 2865

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 2866
0;JMP // 2867

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 3")
//          call: CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=local 5}
//}

@LCL // 2868
D=M // 2869
@5 // 2870
A=D+A // 2871
D=A // 2872
@SP // 2873
AM=M+1 // 2874
A=A-1 // 2875
M=D // 2876
@LCL // 2877
A=M+1 // 2878
A=A+1 // 2879
A=A+1 // 2880
D=M // 2881
@SP // 2882
AM=M+1 // 2883
A=A-1 // 2884
M=D // 2885
// call Array.new
@6 // 2886
D=A // 2887
@14 // 2888
M=D // 2889
@Array.new // 2890
D=A // 2891
@13 // 2892
M=D // 2893
@String.setInt.ret.8 // 2894
D=A // 2895
@CALL // 2896
0;JMP // 2897
(String.setInt.ret.8)
@SP // 2898
AM=M-1 // 2899
D=M // 2900
@SP // 2901
AM=M-1 // 2902
A=M // 2903
M=D // 2904

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 2905
A=M+1 // 2906
M=0 // 2907

////LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt2}}
@ARG // 2908
A=M+1 // 2909
D=M // 2910
@15 // 2911
M=D // 2912
@String.setInt.GT.28 // 2913
D=A // 2914
@13 // 2915
M=D // 2916
@DO_GT // 2917
0;JMP // 2918
(String.setInt.GT.28)
@15 // 2919
M=D // 2920
@String.setInt.EQ.27 // 2921
D=A // 2922
@13 // 2923
M=D // 2924
@DO_EQ // 2925
0;JMP // 2926
(String.setInt.EQ.27)
@WHILE_END_String.setInt2 // 2927
D;JNE // 2928

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              CallGroup(
//                  arg[0]:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("argument 1")
//                          arg[1]:
//                              PushInstruction("constant 10")
//                          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//                      )                  arg[1]:
//                      PushInstruction("constant 10")
//                  call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//              ),
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 2929
A=M+1 // 2930
D=M // 2931
@SP // 2932
AM=M+1 // 2933
A=A-1 // 2934
M=D // 2935
@ARG // 2936
A=M+1 // 2937
D=M // 2938
@SP // 2939
AM=M+1 // 2940
A=A-1 // 2941
M=D // 2942
@10 // 2943
D=A // 2944
@SP // 2945
AM=M+1 // 2946
A=A-1 // 2947
M=D // 2948
// call Math.divide
@7 // 2949
D=A // 2950
@14 // 2951
M=D // 2952
@Math.divide // 2953
D=A // 2954
@13 // 2955
M=D // 2956
@String.setInt.ret.9 // 2957
D=A // 2958
@CALL // 2959
0;JMP // 2960
(String.setInt.ret.9)
@10 // 2961
D=A // 2962
@SP // 2963
AM=M+1 // 2964
A=A-1 // 2965
M=D // 2966
// call Math.multiply
@7 // 2967
D=A // 2968
@14 // 2969
M=D // 2970
@Math.multiply // 2971
D=A // 2972
@13 // 2973
M=D // 2974
@String.setInt.ret.10 // 2975
D=A // 2976
@CALL // 2977
0;JMP // 2978
(String.setInt.ret.10)
@SP // 2979
AM=M-1 // 2980
D=M // 2981
@SP // 2982
AM=M-1 // 2983
D=M-D // 2984
@LCL // 2985
A=M // 2986
M=D // 2987

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 48")
//,
//          binaryOp: "ADD"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 5")
//,
//                  right:
//                      PushInstruction("local 1")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@LCL // 2988
A=M // 2989
D=M // 2990
@48 // 2991
D=D+A // 2992
@THAT // 2993
A=M // 2994
M=D // 2995

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 1")
//          arg[1]:
//              PushInstruction("constant 10")
//          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=argument 1}
//}

@ARG // 2996
A=M+1 // 2997
D=M // 2998
@SP // 2999
AM=M+1 // 3000
A=A-1 // 3001
M=D // 3002
@10 // 3003
D=A // 3004
@SP // 3005
AM=M+1 // 3006
A=A-1 // 3007
M=D // 3008
// call Math.divide
@7 // 3009
D=A // 3010
@14 // 3011
M=D // 3012
@Math.divide // 3013
D=A // 3014
@13 // 3015
M=D // 3016
@String.setInt.ret.11 // 3017
D=A // 3018
@CALL // 3019
0;JMP // 3020
(String.setInt.ret.11)
@SP // 3021
AM=M-1 // 3022
D=M // 3023
@ARG // 3024
A=M+1 // 3025
M=D // 3026

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 3027
A=M+1 // 3028
M=M+1 // 3029

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 3030
0;JMP // 3031

////LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 4")
//,
//              right:
//                  PushInstruction("constant 1")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='String.setInt.IfElse4}}
@LCL // 3032
D=M // 3033
@4 // 3034
A=D+A // 3035
D=M-1 // 3036
@15 // 3037
M=D // 3038
@String.setInt.EQ.31 // 3039
D=A // 3040
@13 // 3041
M=D // 3042
@DO_EQ // 3043
0;JMP // 3044
(String.setInt.EQ.31)
@15 // 3045
M=D // 3046
@String.setInt.EQ.30 // 3047
D=A // 3048
@13 // 3049
M=D // 3050
@DO_EQ // 3051
0;JMP // 3052
(String.setInt.EQ.30)
@String.setInt.IfElse4 // 3053
D;JNE // 3054

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("constant 45")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 3055
D=M // 3056
@SP // 3057
AM=M+1 // 3058
A=A-1 // 3059
M=D // 3060
@45 // 3061
D=A // 3062
@SP // 3063
AM=M+1 // 3064
A=A-1 // 3065
M=D // 3066
// call String.appendChar
@7 // 3067
D=A // 3068
@14 // 3069
M=D // 3070
@String.appendChar // 3071
D=A // 3072
@13 // 3073
M=D // 3074
@String.setInt.ret.12 // 3075
D=A // 3076
@CALL // 3077
0;JMP // 3078
(String.setInt.ret.12)
@SP // 3079
AM=M-1 // 3080
D=M // 3081
@5 // 3082
M=D // 3083

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 3084
0;JMP // 3085

////LabelInstruction{label='String.setInt.IfElse4}
// label String.setInt.IfElse4
(String.setInt.IfElse4)

////LabelInstruction{label='String.setInt.IfElseEND4}
// label String.setInt.IfElseEND4
(String.setInt.IfElseEND4)

////LabelInstruction{label='WHILE_START_String.setInt3}
// label WHILE_START_String.setInt3
(WHILE_START_String.setInt3)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 1")
//,
//              right:
//                  PushInstruction("constant 0")
//,
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt3}}
@LCL // 3086
A=M+1 // 3087
D=M // 3088
@15 // 3089
M=D // 3090
@String.setInt.GT.34 // 3091
D=A // 3092
@13 // 3093
M=D // 3094
@DO_GT // 3095
0;JMP // 3096
(String.setInt.GT.34)
@15 // 3097
M=D // 3098
@String.setInt.EQ.33 // 3099
D=A // 3100
@13 // 3101
M=D // 3102
@DO_EQ // 3103
0;JMP // 3104
(String.setInt.EQ.33)
@WHILE_END_String.setInt3 // 3105
D;JNE // 3106

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 3107
A=M+1 // 3108
M=M-1 // 3109

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("pointer 0")
//          arg[1]:
//              PushInstruction("that 0")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@3 // 3110
D=M // 3111
@SP // 3112
AM=M+1 // 3113
A=A-1 // 3114
M=D // 3115
@THAT // 3116
A=M // 3117
D=M // 3118
@SP // 3119
AM=M+1 // 3120
A=A-1 // 3121
M=D // 3122
// call String.appendChar
@7 // 3123
D=A // 3124
@14 // 3125
M=D // 3126
@String.appendChar // 3127
D=A // 3128
@13 // 3129
M=D // 3130
@String.setInt.ret.13 // 3131
D=A // 3132
@CALL // 3133
0;JMP // 3134
(String.setInt.ret.13)
@SP // 3135
AM=M-1 // 3136
D=M // 3137
@5 // 3138
M=D // 3139

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 3140
0;JMP // 3141

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 5")
//          call: CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 3142
D=M // 3143
@5 // 3144
A=D+A // 3145
D=M // 3146
@SP // 3147
AM=M+1 // 3148
A=A-1 // 3149
M=D // 3150
// call Array.dispose
@6 // 3151
D=A // 3152
@14 // 3153
M=D // 3154
@Array.dispose // 3155
D=A // 3156
@13 // 3157
M=D // 3158
@String.setInt.ret.14 // 3159
D=A // 3160
@CALL // 3161
0;JMP // 3162
(String.setInt.ret.14)
@SP // 3163
AM=M-1 // 3164
D=M // 3165
@5 // 3166
M=D // 3167

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 3168
AM=M+1 // 3169
A=A-1 // 3170
M=0 // 3171

////ReturnInstruction{}
@RETURN // 3172
0;JMP // 3173

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction (
//  PushInstruction("constant 129")
//)

@129 // 3174
D=A // 3175
@SP // 3176
AM=M+1 // 3177
A=A-1 // 3178
M=D // 3179

////ReturnInstruction{}
@RETURN // 3180
0;JMP // 3181

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction (
//  PushInstruction("constant 34")
//)

@34 // 3182
D=A // 3183
@SP // 3184
AM=M+1 // 3185
A=A-1 // 3186
M=D // 3187

////ReturnInstruction{}
@RETURN // 3188
0;JMP // 3189

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////FunctionInstruction{functionName='Math.init', numLocals=0, funcMapping={}}
// function Math.init with 0
(Math.init)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 16")
//          call: CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}
//      )    )
//
//  pop: PopInstruction{address=Math.0}
//}

@16 // 3190
D=A // 3191
@SP // 3192
AM=M+1 // 3193
A=A-1 // 3194
M=D // 3195
// call Array.new
@6 // 3196
D=A // 3197
@14 // 3198
M=D // 3199
@Array.new // 3200
D=A // 3201
@13 // 3202
M=D // 3203
@Math.init.ret.0 // 3204
D=A // 3205
@CALL // 3206
0;JMP // 3207
(Math.init.ret.0)
@SP // 3208
AM=M-1 // 3209
D=M // 3210
@Math.0 // 3211
M=D // 3212

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 0")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@THAT // 3213
A=M // 3214
M=1 // 3215

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 2")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 1")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@2 // 3216
D=A // 3217
@THAT // 3218
A=M // 3219
M=D // 3220

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 4")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 2")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@4 // 3221
D=A // 3222
@THAT // 3223
A=M // 3224
M=D // 3225

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 8")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 3")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@8 // 3226
D=A // 3227
@THAT // 3228
A=M // 3229
M=D // 3230

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 16")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 4")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@16 // 3231
D=A // 3232
@THAT // 3233
A=M // 3234
M=D // 3235

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 32")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 5")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@32 // 3236
D=A // 3237
@THAT // 3238
A=M // 3239
M=D // 3240

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 64")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 6")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@64 // 3241
D=A // 3242
@THAT // 3243
A=M // 3244
M=D // 3245

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 128")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 7")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@128 // 3246
D=A // 3247
@THAT // 3248
A=M // 3249
M=D // 3250

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 256")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 8")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@256 // 3251
D=A // 3252
@THAT // 3253
A=M // 3254
M=D // 3255

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 512")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 9")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@512 // 3256
D=A // 3257
@THAT // 3258
A=M // 3259
M=D // 3260

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1024")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 10")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@1024 // 3261
D=A // 3262
@THAT // 3263
A=M // 3264
M=D // 3265

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 2048")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 11")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@2048 // 3266
D=A // 3267
@THAT // 3268
A=M // 3269
M=D // 3270

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 4096")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 12")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@4096 // 3271
D=A // 3272
@THAT // 3273
A=M // 3274
M=D // 3275

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 8192")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 13")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@8192 // 3276
D=A // 3277
@THAT // 3278
A=M // 3279
M=D // 3280

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 16384")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 14")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@16384 // 3281
D=A // 3282
@THAT // 3283
A=M // 3284
M=D // 3285

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 16384")
//,
//          right:
//              PushInstruction("constant 16384")
//,
//          binaryOp: "ADD"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Math.0")
//,
//                  right:
//                      PushInstruction("constant 15")
//,
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@32768 // 3286
D=-A // 3287
@THAT // 3288
A=M // 3289
M=D // 3290

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 3291
AM=M+1 // 3292
A=A-1 // 3293
M=0 // 3294

////ReturnInstruction{}
@RETURN // 3295
0;JMP // 3296

////FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("argument 0")
//,
//      right:
//          PushInstruction("that 0")
//,
//      binaryOp: "AND"
//  ))

@ARG // 3297
A=M // 3298
D=M // 3299
@R13 // 3300
M=D // 3301
@THAT // 3302
A=M // 3303
D=M // 3304
@R13 // 3305
D=D&M // 3306
@SP // 3307
AM=M+1 // 3308
A=A-1 // 3309
M=D // 3310

////ReturnInstruction{}
@RETURN // 3311
0;JMP // 3312

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 3313
AM=M+1 // 3314
A=A-1 // 3315
M=0 // 3316
@SP // 3317
AM=M+1 // 3318
A=A-1 // 3319
M=0 // 3320
@SP // 3321
AM=M+1 // 3322
A=A-1 // 3323
M=0 // 3324

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "EQ"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 1")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "EQ"
//                  ),
//              binaryOp: "OR"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.multiply.IfElse1}}
@ARG // 3325
A=M // 3326
D=M // 3327
@15 // 3328
M=D // 3329
@Math.multiply.EQ.3 // 3330
D=A // 3331
@13 // 3332
M=D // 3333
@DO_EQ // 3334
0;JMP // 3335
(Math.multiply.EQ.3)
@SP // 3336
AM=M+1 // 3337
A=A-1 // 3338
M=D // 3339
@ARG // 3340
A=M+1 // 3341
D=M // 3342
@15 // 3343
M=D // 3344
@Math.multiply.EQ.4 // 3345
D=A // 3346
@13 // 3347
M=D // 3348
@DO_EQ // 3349
0;JMP // 3350
(Math.multiply.EQ.4)
@SP // 3351
AM=M-1 // 3352
D=D|M // 3353
@15 // 3354
M=D // 3355
@Math.multiply.EQ.2 // 3356
D=A // 3357
@13 // 3358
M=D // 3359
@DO_EQ // 3360
0;JMP // 3361
(Math.multiply.EQ.2)
@Math.multiply.IfElse1 // 3362
D;JNE // 3363

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 3364
AM=M+1 // 3365
A=A-1 // 3366
M=0 // 3367

////ReturnInstruction{}
@RETURN // 3368
0;JMP // 3369

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 3370
0;JMP // 3371

////LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)

////LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("constant 1")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.multiply.IfElse2}}
@ARG // 3372
A=M // 3373
D=M-1 // 3374
@15 // 3375
M=D // 3376
@Math.multiply.EQ.7 // 3377
D=A // 3378
@13 // 3379
M=D // 3380
@DO_EQ // 3381
0;JMP // 3382
(Math.multiply.EQ.7)
@15 // 3383
M=D // 3384
@Math.multiply.EQ.6 // 3385
D=A // 3386
@13 // 3387
M=D // 3388
@DO_EQ // 3389
0;JMP // 3390
(Math.multiply.EQ.6)
@Math.multiply.IfElse2 // 3391
D;JNE // 3392

////PushInstruction (
//  PushInstruction("argument 1")
//)

@ARG // 3393
A=M+1 // 3394
D=M // 3395
@SP // 3396
AM=M+1 // 3397
A=A-1 // 3398
M=D // 3399

////ReturnInstruction{}
@RETURN // 3400
0;JMP // 3401

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 3402
0;JMP // 3403

////LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)

////LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("constant 1")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.multiply.IfElse3}}
@ARG // 3404
A=M+1 // 3405
D=M-1 // 3406
@15 // 3407
M=D // 3408
@Math.multiply.EQ.10 // 3409
D=A // 3410
@13 // 3411
M=D // 3412
@DO_EQ // 3413
0;JMP // 3414
(Math.multiply.EQ.10)
@15 // 3415
M=D // 3416
@Math.multiply.EQ.9 // 3417
D=A // 3418
@13 // 3419
M=D // 3420
@DO_EQ // 3421
0;JMP // 3422
(Math.multiply.EQ.9)
@Math.multiply.IfElse3 // 3423
D;JNE // 3424

////PushInstruction (
//  PushInstruction("argument 0")
//)

@ARG // 3425
A=M // 3426
D=M // 3427
@SP // 3428
AM=M+1 // 3429
A=A-1 // 3430
M=D // 3431

////ReturnInstruction{}
@RETURN // 3432
0;JMP // 3433

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 3434
0;JMP // 3435

////LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)

////LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("constant 2")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.multiply.IfElse4}}
@ARG // 3436
A=M // 3437
D=M // 3438
@2 // 3439
D=D-A // 3440
@15 // 3441
M=D // 3442
@Math.multiply.EQ.13 // 3443
D=A // 3444
@13 // 3445
M=D // 3446
@DO_EQ // 3447
0;JMP // 3448
(Math.multiply.EQ.13)
@15 // 3449
M=D // 3450
@Math.multiply.EQ.12 // 3451
D=A // 3452
@13 // 3453
M=D // 3454
@DO_EQ // 3455
0;JMP // 3456
(Math.multiply.EQ.12)
@Math.multiply.IfElse4 // 3457
D;JNE // 3458

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("argument 1")
//,
//      right:
//          PushInstruction("argument 1")
//,
//      binaryOp: "ADD"
//  ))

@ARG // 3459
A=M+1 // 3460
D=M // 3461
D=D+M // 3462
@SP // 3463
AM=M+1 // 3464
A=A-1 // 3465
M=D // 3466

////ReturnInstruction{}
@RETURN // 3467
0;JMP // 3468

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 3469
0;JMP // 3470

////LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)

////LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("constant 2")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.multiply.IfElse5}}
@ARG // 3471
A=M+1 // 3472
D=M // 3473
@2 // 3474
D=D-A // 3475
@15 // 3476
M=D // 3477
@Math.multiply.EQ.16 // 3478
D=A // 3479
@13 // 3480
M=D // 3481
@DO_EQ // 3482
0;JMP // 3483
(Math.multiply.EQ.16)
@15 // 3484
M=D // 3485
@Math.multiply.EQ.15 // 3486
D=A // 3487
@13 // 3488
M=D // 3489
@DO_EQ // 3490
0;JMP // 3491
(Math.multiply.EQ.15)
@Math.multiply.IfElse5 // 3492
D;JNE // 3493

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("argument 0")
//,
//      right:
//          PushInstruction("argument 0")
//,
//      binaryOp: "ADD"
//  ))

@ARG // 3494
A=M // 3495
D=M // 3496
D=D+M // 3497
@SP // 3498
AM=M+1 // 3499
A=A-1 // 3500
M=D // 3501

////ReturnInstruction{}
@RETURN // 3502
0;JMP // 3503

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 3504
0;JMP // 3505

////LabelInstruction{label='Math.multiply.IfElse5}
// label Math.multiply.IfElse5
(Math.multiply.IfElse5)

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 3506
A=M+1 // 3507
A=A+1 // 3508
M=1 // 3509

////LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 1")
//,
//              right:
//                  PushInstruction("constant 16")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Math.multiply1}}
@LCL // 3510
A=M+1 // 3511
D=M // 3512
@16 // 3513
D=D-A // 3514
@15 // 3515
M=D // 3516
@Math.multiply.LT.19 // 3517
D=A // 3518
@13 // 3519
M=D // 3520
@DO_LT // 3521
0;JMP // 3522
(Math.multiply.LT.19)
@15 // 3523
M=D // 3524
@Math.multiply.EQ.18 // 3525
D=A // 3526
@13 // 3527
M=D // 3528
@DO_EQ // 3529
0;JMP // 3530
(Math.multiply.EQ.18)
@WHILE_END_Math.multiply1 // 3531
D;JNE // 3532

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 1")
//,
//              right:
//                  PushInstruction("local 2")
//,
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.multiply.IfElse6}}
@ARG // 3533
A=M+1 // 3534
D=M // 3535
@R13 // 3536
M=D // 3537
@LCL // 3538
A=M+1 // 3539
A=A+1 // 3540
D=M // 3541
@R13 // 3542
D=D&M // 3543
@15 // 3544
M=D // 3545
@Math.multiply.EQ.20 // 3546
D=A // 3547
@13 // 3548
M=D // 3549
@DO_EQ // 3550
0;JMP // 3551
(Math.multiply.EQ.20)
@Math.multiply.IfElse6 // 3552
D;JNE // 3553

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("argument 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 3554
A=M // 3555
D=M // 3556
@R13 // 3557
M=D // 3558
@ARG // 3559
A=M // 3560
D=M // 3561
@R13 // 3562
D=D+M // 3563
@LCL // 3564
A=M // 3565
M=D // 3566

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 3567
0;JMP // 3568

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("argument 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=argument 0}
//}

@ARG // 3569
A=M // 3570
D=M // 3571
D=D+M // 3572
@ARG // 3573
A=M // 3574
M=D // 3575

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 3576
A=M+1 // 3577
M=M+1 // 3578

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 2")
//,
//          right:
//              PushInstruction("local 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 3579
A=M+1 // 3580
A=A+1 // 3581
D=M // 3582
D=D+M // 3583
@LCL // 3584
A=M+1 // 3585
A=A+1 // 3586
M=D // 3587

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 3588
0;JMP // 3589

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 3590
A=M // 3591
D=M // 3592
@SP // 3593
AM=M+1 // 3594
A=A-1 // 3595
M=D // 3596

////ReturnInstruction{}
@RETURN // 3597
0;JMP // 3598

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 3599
AM=M+1 // 3600
A=A-1 // 3601
M=0 // 3602
@SP // 3603
AM=M+1 // 3604
A=A-1 // 3605
M=0 // 3606
@SP // 3607
AM=M+1 // 3608
A=A-1 // 3609
M=0 // 3610

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@ARG // 3611
A=M // 3612
D=M // 3613
@SP // 3614
AM=M+1 // 3615
A=A-1 // 3616
M=D // 3617
// call Math.abs
@6 // 3618
D=A // 3619
@14 // 3620
M=D // 3621
@Math.abs // 3622
D=A // 3623
@13 // 3624
M=D // 3625
@Math.divide.ret.0 // 3626
D=A // 3627
@CALL // 3628
0;JMP // 3629
(Math.divide.ret.0)
@SP // 3630
AM=M-1 // 3631
D=M // 3632
@LCL // 3633
A=M+1 // 3634
A=A+1 // 3635
M=D // 3636

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 1")
//          call: CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@ARG // 3637
A=M+1 // 3638
D=M // 3639
@SP // 3640
AM=M+1 // 3641
A=A-1 // 3642
M=D // 3643
// call Math.abs
@6 // 3644
D=A // 3645
@14 // 3646
M=D // 3647
@Math.abs // 3648
D=A // 3649
@13 // 3650
M=D // 3651
@Math.divide.ret.1 // 3652
D=A // 3653
@CALL // 3654
0;JMP // 3655
(Math.divide.ret.1)
@SP // 3656
AM=M-1 // 3657
D=M // 3658
@LCL // 3659
A=M+1 // 3660
M=D // 3661

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "EQ"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 1")
//,
//                      right:
//                          PushInstruction("local 2")
//,
//                      binaryOp: "GT"
//                  ),
//              binaryOp: "OR"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.divide.IfElse1}}
@ARG // 3662
A=M // 3663
D=M // 3664
@15 // 3665
M=D // 3666
@Math.divide.EQ.24 // 3667
D=A // 3668
@13 // 3669
M=D // 3670
@DO_EQ // 3671
0;JMP // 3672
(Math.divide.EQ.24)
@SP // 3673
AM=M+1 // 3674
A=A-1 // 3675
M=D // 3676
@LCL // 3677
A=M+1 // 3678
A=A+1 // 3679
D=M // 3680
A=A-1 // 3681
D=M-D // 3682
@15 // 3683
M=D // 3684
@Math.divide.GT.25 // 3685
D=A // 3686
@13 // 3687
M=D // 3688
@DO_GT // 3689
0;JMP // 3690
(Math.divide.GT.25)
@SP // 3691
AM=M-1 // 3692
D=D|M // 3693
@15 // 3694
M=D // 3695
@Math.divide.EQ.23 // 3696
D=A // 3697
@13 // 3698
M=D // 3699
@DO_EQ // 3700
0;JMP // 3701
(Math.divide.EQ.23)
@Math.divide.IfElse1 // 3702
D;JNE // 3703

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 3704
AM=M+1 // 3705
A=A-1 // 3706
M=0 // 3707

////ReturnInstruction{}
@RETURN // 3708
0;JMP // 3709

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 3710
0;JMP // 3711

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("argument 1")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.divide.IfElse2}}
@ARG // 3712
A=M+1 // 3713
D=M // 3714
A=A-1 // 3715
D=M-D // 3716
@15 // 3717
M=D // 3718
@Math.divide.EQ.28 // 3719
D=A // 3720
@13 // 3721
M=D // 3722
@DO_EQ // 3723
0;JMP // 3724
(Math.divide.EQ.28)
@15 // 3725
M=D // 3726
@Math.divide.EQ.27 // 3727
D=A // 3728
@13 // 3729
M=D // 3730
@DO_EQ // 3731
0;JMP // 3732
(Math.divide.EQ.27)
@Math.divide.IfElse2 // 3733
D;JNE // 3734

////PushInstruction (
//  PushInstruction("constant 1")
//)

@SP // 3735
AM=M+1 // 3736
A=A-1 // 3737
M=1 // 3738

////ReturnInstruction{}
@RETURN // 3739
0;JMP // 3740

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 3741
0;JMP // 3742

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "LT"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 1")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "LT"
//                  ),
//              binaryOp: "OR"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.divide.IfElse3}}
@ARG // 3743
A=M // 3744
D=M // 3745
@15 // 3746
M=D // 3747
@Math.divide.LT.32 // 3748
D=A // 3749
@13 // 3750
M=D // 3751
@DO_LT // 3752
0;JMP // 3753
(Math.divide.LT.32)
@SP // 3754
AM=M+1 // 3755
A=A-1 // 3756
M=D // 3757
@ARG // 3758
A=M+1 // 3759
D=M // 3760
@15 // 3761
M=D // 3762
@Math.divide.LT.33 // 3763
D=A // 3764
@13 // 3765
M=D // 3766
@DO_LT // 3767
0;JMP // 3768
(Math.divide.LT.33)
@SP // 3769
AM=M-1 // 3770
D=D|M // 3771
@15 // 3772
M=D // 3773
@Math.divide.EQ.31 // 3774
D=A // 3775
@13 // 3776
M=D // 3777
@DO_EQ // 3778
0;JMP // 3779
(Math.divide.EQ.31)
@Math.divide.IfElse3 // 3780
D;JNE // 3781

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 2")
//          arg[1]:
//              PushInstruction("local 1")
//          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 3782
A=M+1 // 3783
A=A+1 // 3784
D=M // 3785
@SP // 3786
AM=M+1 // 3787
A=A-1 // 3788
M=D // 3789
@LCL // 3790
A=M+1 // 3791
D=M // 3792
@SP // 3793
AM=M+1 // 3794
A=A-1 // 3795
M=D // 3796
// call Math.divide
@7 // 3797
D=A // 3798
@14 // 3799
M=D // 3800
@Math.divide // 3801
D=A // 3802
@13 // 3803
M=D // 3804
@Math.divide.ret.2 // 3805
D=A // 3806
@CALL // 3807
0;JMP // 3808
(Math.divide.ret.2)
@SP // 3809
AM=M-1 // 3810
D=M // 3811
@LCL // 3812
A=M // 3813
M=D // 3814

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "LT"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 1")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "LT"
//                  ),
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.divide.IfElse4}}
@ARG // 3815
A=M // 3816
D=M // 3817
@15 // 3818
M=D // 3819
@Math.divide.LT.37 // 3820
D=A // 3821
@13 // 3822
M=D // 3823
@DO_LT // 3824
0;JMP // 3825
(Math.divide.LT.37)
@SP // 3826
AM=M+1 // 3827
A=A-1 // 3828
M=D // 3829
@ARG // 3830
A=M+1 // 3831
D=M // 3832
@15 // 3833
M=D // 3834
@Math.divide.LT.38 // 3835
D=A // 3836
@13 // 3837
M=D // 3838
@DO_LT // 3839
0;JMP // 3840
(Math.divide.LT.38)
@SP // 3841
AM=M-1 // 3842
D=D&M // 3843
@15 // 3844
M=D // 3845
@Math.divide.EQ.36 // 3846
D=A // 3847
@13 // 3848
M=D // 3849
@DO_EQ // 3850
0;JMP // 3851
(Math.divide.EQ.36)
@Math.divide.IfElse4 // 3852
D;JNE // 3853

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 3854
A=M // 3855
D=M // 3856
@SP // 3857
AM=M+1 // 3858
A=A-1 // 3859
M=D // 3860

////ReturnInstruction{}
@RETURN // 3861
0;JMP // 3862

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 3863
0;JMP // 3864

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////UnaryPushGroup (
//  UnaryPushGroup(
//      inner:
//          PushInstruction("local 0")
//,
//      unaryOp: NEG
//  ))

@LCL // 3865
A=M // 3866
D=M // 3867
@SP // 3868
AM=M+1 // 3869
A=A-1 // 3870
M=D // 3871
@SP // 3872
A=M-1 // 3873
M=-D // 3874

////ReturnInstruction{}
@RETURN // 3875
0;JMP // 3876

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 3877
0;JMP // 3878

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          arg[1]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
//,
//                  right:
//                      PushInstruction("argument 1")
//,
//                  binaryOp: "ADD"
//              )          call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=3, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 3879
A=M // 3880
D=M // 3881
@SP // 3882
AM=M+1 // 3883
A=A-1 // 3884
M=D // 3885
@ARG // 3886
A=M+1 // 3887
D=M // 3888
D=D+M // 3889
@SP // 3890
AM=M+1 // 3891
A=A-1 // 3892
M=D // 3893
// call Math.divide
@7 // 3894
D=A // 3895
@14 // 3896
M=D // 3897
@Math.divide // 3898
D=A // 3899
@13 // 3900
M=D // 3901
@Math.divide.ret.3 // 3902
D=A // 3903
@CALL // 3904
0;JMP // 3905
(Math.divide.ret.3)
@SP // 3906
AM=M-1 // 3907
D=M // 3908
@LCL // 3909
A=M // 3910
M=D // 3911

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          CallGroup(
//                              arg[0]:
//                                  BinaryPushGroup(
//                                      left:
//                                          PushInstruction("local 0")
//,
//                                      right:
//                                          PushInstruction("local 0")
//,
//                                      binaryOp: "ADD"
//                                  )                              arg[1]:
//                                  PushInstruction("argument 1")
//                              call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=4, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
//                          ),
//                      binaryOp: "SUB"
//                  ),
//              right:
//                  PushInstruction("argument 1")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.divide.IfElse5}}
@ARG // 3912
A=M // 3913
D=M // 3914
@SP // 3915
AM=M+1 // 3916
A=A-1 // 3917
M=D // 3918
@LCL // 3919
A=M // 3920
D=M // 3921
D=D+M // 3922
@SP // 3923
AM=M+1 // 3924
A=A-1 // 3925
M=D // 3926
@ARG // 3927
A=M+1 // 3928
D=M // 3929
@SP // 3930
AM=M+1 // 3931
A=A-1 // 3932
M=D // 3933
// call Math.multiply
@7 // 3934
D=A // 3935
@14 // 3936
M=D // 3937
@Math.multiply // 3938
D=A // 3939
@13 // 3940
M=D // 3941
@Math.divide.ret.5 // 3942
D=A // 3943
@CALL // 3944
0;JMP // 3945
(Math.divide.ret.5)
@SP // 3946
AM=M-1 // 3947
D=M // 3948
@SP // 3949
AM=M-1 // 3950
D=M-D // 3951
@SP // 3952
AM=M+1 // 3953
A=A-1 // 3954
M=D // 3955
@ARG // 3956
A=M+1 // 3957
D=M // 3958
@SP // 3959
AM=M-1 // 3960
D=M-D // 3961
@15 // 3962
M=D // 3963
@Math.divide.LT.41 // 3964
D=A // 3965
@13 // 3966
M=D // 3967
@DO_LT // 3968
0;JMP // 3969
(Math.divide.LT.41)
@15 // 3970
M=D // 3971
@Math.divide.EQ.40 // 3972
D=A // 3973
@13 // 3974
M=D // 3975
@DO_EQ // 3976
0;JMP // 3977
(Math.divide.EQ.40)
@Math.divide.IfElse5 // 3978
D;JNE // 3979

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("local 0")
//,
//      right:
//          PushInstruction("local 0")
//,
//      binaryOp: "ADD"
//  ))

@LCL // 3980
A=M // 3981
D=M // 3982
D=D+M // 3983
@SP // 3984
AM=M+1 // 3985
A=A-1 // 3986
M=D // 3987

////ReturnInstruction{}
@RETURN // 3988
0;JMP // 3989

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 3990
0;JMP // 3991

////LabelInstruction{label='Math.divide.IfElse5}
// label Math.divide.IfElse5
(Math.divide.IfElse5)

////LabelInstruction{label='Math.divide.IfElseEND5}
// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 0")
//,
//              right:
//                  PushInstruction("local 0")
//,
//              binaryOp: "ADD"
//          ),
//      right:
//          PushInstruction("constant 1")
//,
//      binaryOp: "ADD"
//  ))

@LCL // 3992
A=M // 3993
D=M // 3994
D=D+M // 3995
D=M+1 // 3996
@SP // 3997
AM=M+1 // 3998
A=A-1 // 3999
M=D // 4000

////ReturnInstruction{}
@RETURN // 4001
0;JMP // 4002

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=6, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("argument 0")
//,
//      right:
//          CallGroup(
//              arg[0]:
//                  CallGroup(
//                      arg[0]:
//                          PushInstruction("argument 0")
//                      arg[1]:
//                          PushInstruction("argument 1")
//                      call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=6, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
//                  )              arg[1]:
//                  PushInstruction("argument 1")
//              call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
//          ),
//      binaryOp: "SUB"
//  ))

@ARG // 4003
A=M // 4004
D=M // 4005
@SP // 4006
AM=M+1 // 4007
A=A-1 // 4008
M=D // 4009
@ARG // 4010
A=M // 4011
D=M // 4012
@SP // 4013
AM=M+1 // 4014
A=A-1 // 4015
M=D // 4016
@ARG // 4017
A=M+1 // 4018
D=M // 4019
@SP // 4020
AM=M+1 // 4021
A=A-1 // 4022
M=D // 4023
// call Math.divide
@7 // 4024
D=A // 4025
@14 // 4026
M=D // 4027
@Math.divide // 4028
D=A // 4029
@13 // 4030
M=D // 4031
@Math.mod.ret.0 // 4032
D=A // 4033
@CALL // 4034
0;JMP // 4035
(Math.mod.ret.0)
@ARG // 4036
A=M+1 // 4037
D=M // 4038
@SP // 4039
AM=M+1 // 4040
A=A-1 // 4041
M=D // 4042
// call Math.multiply
@7 // 4043
D=A // 4044
@14 // 4045
M=D // 4046
@Math.multiply // 4047
D=A // 4048
@13 // 4049
M=D // 4050
@Math.mod.ret.1 // 4051
D=A // 4052
@CALL // 4053
0;JMP // 4054
(Math.mod.ret.1)
@SP // 4055
AM=M-1 // 4056
D=M // 4057
@SP // 4058
AM=M-1 // 4059
D=M-D // 4060
@SP // 4061
AM=M+1 // 4062
A=A-1 // 4063
M=D // 4064

////ReturnInstruction{}
@RETURN // 4065
0;JMP // 4066

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("Math.0")
//,
//          right:
//              PushInstruction("argument 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@Math.0 // 4067
D=M // 4068
@R13 // 4069
M=D // 4070
@ARG // 4071
A=M // 4072
D=M // 4073
@R13 // 4074
D=D+M // 4075
@4 // 4076
M=D // 4077

////PushInstruction (
//  PushInstruction("that 0")
//)

@THAT // 4078
A=M // 4079
D=M // 4080
@SP // 4081
AM=M+1 // 4082
A=A-1 // 4083
M=D // 4084

////ReturnInstruction{}
@RETURN // 4085
0;JMP // 4086

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 4087
AM=M+1 // 4088
A=A-1 // 4089
M=0 // 4090
@SP // 4091
AM=M+1 // 4092
A=A-1 // 4093
M=0 // 4094
@SP // 4095
AM=M+1 // 4096
A=A-1 // 4097
M=0 // 4098
@SP // 4099
AM=M+1 // 4100
A=A-1 // 4101
M=0 // 4102

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 4103
A=M // 4104
M=0 // 4105

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 7")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@7 // 4106
D=A // 4107
@LCL // 4108
A=M+1 // 4109
M=D // 4110

////LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 1")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "LT"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Math.sqrt1}}
@LCL // 4111
A=M+1 // 4112
D=M // 4113
@15 // 4114
M=D // 4115
@Math.sqrt.LT.44 // 4116
D=A // 4117
@13 // 4118
M=D // 4119
@DO_LT // 4120
0;JMP // 4121
(Math.sqrt.LT.44)
D=!D // 4122
@15 // 4123
M=D // 4124
@Math.sqrt.EQ.43 // 4125
D=A // 4126
@13 // 4127
M=D // 4128
@DO_EQ // 4129
0;JMP // 4130
(Math.sqrt.EQ.43)
@WHILE_END_Math.sqrt1 // 4131
D;JNE // 4132

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("that 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 4133
A=M // 4134
D=M // 4135
@R13 // 4136
M=D // 4137
@THAT // 4138
A=M // 4139
D=M // 4140
@R13 // 4141
D=D+M // 4142
@LCL // 4143
A=M+1 // 4144
A=A+1 // 4145
M=D // 4146

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 2")
//          arg[1]:
//              PushInstruction("local 2")
//          call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}
//      )    )
//
//  pop: PopInstruction{address=local 3}
//}

@LCL // 4147
A=M+1 // 4148
A=A+1 // 4149
D=M // 4150
@SP // 4151
AM=M+1 // 4152
A=A-1 // 4153
M=D // 4154
@LCL // 4155
A=M+1 // 4156
A=A+1 // 4157
D=M // 4158
@SP // 4159
AM=M+1 // 4160
A=A-1 // 4161
M=D // 4162
// call Math.multiply
@7 // 4163
D=A // 4164
@14 // 4165
M=D // 4166
@Math.multiply // 4167
D=A // 4168
@13 // 4169
M=D // 4170
@Math.sqrt.ret.0 // 4171
D=A // 4172
@CALL // 4173
0;JMP // 4174
(Math.sqrt.ret.0)
@SP // 4175
AM=M-1 // 4176
D=M // 4177
@LCL // 4178
A=M+1 // 4179
A=A+1 // 4180
A=A+1 // 4181
M=D // 4182

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  UnaryPushGroup(
//                      inner:
//                          BinaryPushGroup(
//                              left:
//                                  PushInstruction("local 3")
//,
//                              right:
//                                  PushInstruction("argument 0")
//,
//                              binaryOp: "GT"
//                          ),
//                      unaryOp: NOT
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 3")
//,
//                      right:
//                          PushInstruction("constant 0")
//,
//                      binaryOp: "GT"
//                  ),
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.sqrt.IfElse1}}
@LCL // 4183
A=M+1 // 4184
A=A+1 // 4185
A=A+1 // 4186
D=M // 4187
@R13 // 4188
M=D // 4189
@ARG // 4190
A=M // 4191
D=M // 4192
@R13 // 4193
D=M-D // 4194
@15 // 4195
M=D // 4196
@Math.sqrt.GT.48 // 4197
D=A // 4198
@13 // 4199
M=D // 4200
@DO_GT // 4201
0;JMP // 4202
(Math.sqrt.GT.48)
@SP // 4203
AM=M+1 // 4204
A=A-1 // 4205
M=D // 4206
@SP // 4207
A=M-1 // 4208
M=!D // 4209
@LCL // 4210
A=M+1 // 4211
A=A+1 // 4212
A=A+1 // 4213
D=M // 4214
@15 // 4215
M=D // 4216
@Math.sqrt.GT.49 // 4217
D=A // 4218
@13 // 4219
M=D // 4220
@DO_GT // 4221
0;JMP // 4222
(Math.sqrt.GT.49)
@SP // 4223
AM=M-1 // 4224
D=D&M // 4225
@15 // 4226
M=D // 4227
@Math.sqrt.EQ.47 // 4228
D=A // 4229
@13 // 4230
M=D // 4231
@DO_EQ // 4232
0;JMP // 4233
(Math.sqrt.EQ.47)
@Math.sqrt.IfElse1 // 4234
D;JNE // 4235

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 2")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 4236
A=M+1 // 4237
A=A+1 // 4238
D=M // 4239
@LCL // 4240
A=M // 4241
M=D // 4242

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 4243
0;JMP // 4244

////LabelInstruction{label='Math.sqrt.IfElse1}
// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)

////LabelInstruction{label='Math.sqrt.IfElseEND1}
// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 4245
A=M+1 // 4246
M=M-1 // 4247

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 4248
0;JMP // 4249

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 4250
A=M // 4251
D=M // 4252
@SP // 4253
AM=M+1 // 4254
A=A-1 // 4255
M=D // 4256

////ReturnInstruction{}
@RETURN // 4257
0;JMP // 4258

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("argument 1")
//,
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.max.IfElse1}}
@ARG // 4259
A=M+1 // 4260
D=M // 4261
A=A-1 // 4262
D=M-D // 4263
@15 // 4264
M=D // 4265
@Math.max.GT.52 // 4266
D=A // 4267
@13 // 4268
M=D // 4269
@DO_GT // 4270
0;JMP // 4271
(Math.max.GT.52)
@15 // 4272
M=D // 4273
@Math.max.EQ.51 // 4274
D=A // 4275
@13 // 4276
M=D // 4277
@DO_EQ // 4278
0;JMP // 4279
(Math.max.EQ.51)
@Math.max.IfElse1 // 4280
D;JNE // 4281

////PushInstruction (
//  PushInstruction("argument 0")
//)

@ARG // 4282
A=M // 4283
D=M // 4284
@SP // 4285
AM=M+1 // 4286
A=A-1 // 4287
M=D // 4288

////ReturnInstruction{}
@RETURN // 4289
0;JMP // 4290

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 4291
0;JMP // 4292

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction (
//  PushInstruction("argument 1")
//)

@ARG // 4293
A=M+1 // 4294
D=M // 4295
@SP // 4296
AM=M+1 // 4297
A=A-1 // 4298
M=D // 4299

////ReturnInstruction{}
@RETURN // 4300
0;JMP // 4301

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("argument 0")
//,
//              right:
//                  PushInstruction("argument 1")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Math.min.IfElse1}}
@ARG // 4302
A=M+1 // 4303
D=M // 4304
A=A-1 // 4305
D=M-D // 4306
@15 // 4307
M=D // 4308
@Math.min.LT.55 // 4309
D=A // 4310
@13 // 4311
M=D // 4312
@DO_LT // 4313
0;JMP // 4314
(Math.min.LT.55)
@15 // 4315
M=D // 4316
@Math.min.EQ.54 // 4317
D=A // 4318
@13 // 4319
M=D // 4320
@DO_EQ // 4321
0;JMP // 4322
(Math.min.EQ.54)
@Math.min.IfElse1 // 4323
D;JNE // 4324

////PushInstruction (
//  PushInstruction("argument 0")
//)

@ARG // 4325
A=M // 4326
D=M // 4327
@SP // 4328
AM=M+1 // 4329
A=A-1 // 4330
M=D // 4331

////ReturnInstruction{}
@RETURN // 4332
0;JMP // 4333

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 4334
0;JMP // 4335

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction (
//  PushInstruction("argument 1")
//)

@ARG // 4336
A=M+1 // 4337
D=M // 4338
@SP // 4339
AM=M+1 // 4340
A=A-1 // 4341
M=D // 4342

////ReturnInstruction{}
@RETURN // 4343
0;JMP // 4344

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 4345
D=A // 4346
@14 // 4347
M=D // 4348
@Output.initMap // 4349
D=A // 4350
@13 // 4351
M=D // 4352
@Output.init.ret.0 // 4353
D=A // 4354
@CALL // 4355
0;JMP // 4356
(Output.init.ret.0)
@SP // 4357
AM=M-1 // 4358
D=M // 4359
@5 // 4360
M=D // 4361

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=Output.1}
//}

@Output.1 // 4362
M=0 // 4363

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=Output.2}
//}

@Output.2 // 4364
M=0 // 4365

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 4366
AM=M+1 // 4367
A=A-1 // 4368
M=0 // 4369

////ReturnInstruction{}
@RETURN // 4370
0;JMP // 4371

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4372
AM=M+1 // 4373
A=A-1 // 4374
M=0 // 4375

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 127")
//          call: CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=Output.0}
//}

@127 // 4376
D=A // 4377
@SP // 4378
AM=M+1 // 4379
A=A-1 // 4380
M=D // 4381
// call Array.new
@6 // 4382
D=A // 4383
@14 // 4384
M=D // 4385
@Array.new // 4386
D=A // 4387
@13 // 4388
M=D // 4389
@Output.initMap.ret.0 // 4390
D=A // 4391
@CALL // 4392
0;JMP // 4393
(Output.initMap.ret.0)
@SP // 4394
AM=M-1 // 4395
D=M // 4396
@Output.0 // 4397
M=D // 4398

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 0")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 63")
//          arg[3]:
//              PushInstruction("constant 63")
//          arg[4]:
//              PushInstruction("constant 63")
//          arg[5]:
//              PushInstruction("constant 63")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 63")
//          arg[8]:
//              PushInstruction("constant 63")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=1}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@SP // 4399
AM=M+1 // 4400
A=A-1 // 4401
M=0 // 4402
@63 // 4403
D=A // 4404
@SP // 4405
AM=M+1 // 4406
A=A-1 // 4407
M=D // 4408
@63 // 4409
D=A // 4410
@SP // 4411
AM=M+1 // 4412
A=A-1 // 4413
M=D // 4414
@63 // 4415
D=A // 4416
@SP // 4417
AM=M+1 // 4418
A=A-1 // 4419
M=D // 4420
@63 // 4421
D=A // 4422
@SP // 4423
AM=M+1 // 4424
A=A-1 // 4425
M=D // 4426
@63 // 4427
D=A // 4428
@SP // 4429
AM=M+1 // 4430
A=A-1 // 4431
M=D // 4432
@63 // 4433
D=A // 4434
@SP // 4435
AM=M+1 // 4436
A=A-1 // 4437
M=D // 4438
@63 // 4439
D=A // 4440
@SP // 4441
AM=M+1 // 4442
A=A-1 // 4443
M=D // 4444
@63 // 4445
D=A // 4446
@SP // 4447
AM=M+1 // 4448
A=A-1 // 4449
M=D // 4450
@63 // 4451
D=A // 4452
@SP // 4453
AM=M+1 // 4454
A=A-1 // 4455
M=D // 4456
@SP // 4457
AM=M+1 // 4458
A=A-1 // 4459
M=0 // 4460
@SP // 4461
AM=M+1 // 4462
A=A-1 // 4463
M=0 // 4464
// call Output.create
@17 // 4465
D=A // 4466
@14 // 4467
M=D // 4468
@Output.create // 4469
D=A // 4470
@13 // 4471
M=D // 4472
@Output.initMap.ret.1 // 4473
D=A // 4474
@CALL // 4475
0;JMP // 4476
(Output.initMap.ret.1)
@SP // 4477
AM=M-1 // 4478
D=M // 4479
@5 // 4480
M=D // 4481

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 32")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 0")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 0")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=2}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@32 // 4482
D=A // 4483
@SP // 4484
AM=M+1 // 4485
A=A-1 // 4486
M=D // 4487
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=0 // 4491
@SP // 4492
AM=M+1 // 4493
A=A-1 // 4494
M=0 // 4495
@SP // 4496
AM=M+1 // 4497
A=A-1 // 4498
M=0 // 4499
@SP // 4500
AM=M+1 // 4501
A=A-1 // 4502
M=0 // 4503
@SP // 4504
AM=M+1 // 4505
A=A-1 // 4506
M=0 // 4507
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=0 // 4511
@SP // 4512
AM=M+1 // 4513
A=A-1 // 4514
M=0 // 4515
@SP // 4516
AM=M+1 // 4517
A=A-1 // 4518
M=0 // 4519
@SP // 4520
AM=M+1 // 4521
A=A-1 // 4522
M=0 // 4523
@SP // 4524
AM=M+1 // 4525
A=A-1 // 4526
M=0 // 4527
@SP // 4528
AM=M+1 // 4529
A=A-1 // 4530
M=0 // 4531
// call Output.create
@17 // 4532
D=A // 4533
@14 // 4534
M=D // 4535
@Output.create // 4536
D=A // 4537
@13 // 4538
M=D // 4539
@Output.initMap.ret.2 // 4540
D=A // 4541
@CALL // 4542
0;JMP // 4543
(Output.initMap.ret.2)
@SP // 4544
AM=M-1 // 4545
D=M // 4546
@5 // 4547
M=D // 4548

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 33")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 30")
//          arg[3]:
//              PushInstruction("constant 30")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=3}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@33 // 4549
D=A // 4550
@SP // 4551
AM=M+1 // 4552
A=A-1 // 4553
M=D // 4554
@12 // 4555
D=A // 4556
@SP // 4557
AM=M+1 // 4558
A=A-1 // 4559
M=D // 4560
@30 // 4561
D=A // 4562
@SP // 4563
AM=M+1 // 4564
A=A-1 // 4565
M=D // 4566
@30 // 4567
D=A // 4568
@SP // 4569
AM=M+1 // 4570
A=A-1 // 4571
M=D // 4572
@30 // 4573
D=A // 4574
@SP // 4575
AM=M+1 // 4576
A=A-1 // 4577
M=D // 4578
@12 // 4579
D=A // 4580
@SP // 4581
AM=M+1 // 4582
A=A-1 // 4583
M=D // 4584
@12 // 4585
D=A // 4586
@SP // 4587
AM=M+1 // 4588
A=A-1 // 4589
M=D // 4590
@SP // 4591
AM=M+1 // 4592
A=A-1 // 4593
M=0 // 4594
@12 // 4595
D=A // 4596
@SP // 4597
AM=M+1 // 4598
A=A-1 // 4599
M=D // 4600
@12 // 4601
D=A // 4602
@SP // 4603
AM=M+1 // 4604
A=A-1 // 4605
M=D // 4606
@SP // 4607
AM=M+1 // 4608
A=A-1 // 4609
M=0 // 4610
@SP // 4611
AM=M+1 // 4612
A=A-1 // 4613
M=0 // 4614
// call Output.create
@17 // 4615
D=A // 4616
@14 // 4617
M=D // 4618
@Output.create // 4619
D=A // 4620
@13 // 4621
M=D // 4622
@Output.initMap.ret.3 // 4623
D=A // 4624
@CALL // 4625
0;JMP // 4626
(Output.initMap.ret.3)
@SP // 4627
AM=M-1 // 4628
D=M // 4629
@5 // 4630
M=D // 4631

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 34")
//          arg[1]:
//              PushInstruction("constant 54")
//          arg[2]:
//              PushInstruction("constant 54")
//          arg[3]:
//              PushInstruction("constant 20")
//          arg[4]:
//              PushInstruction("constant 0")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 0")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=4}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@34 // 4632
D=A // 4633
@SP // 4634
AM=M+1 // 4635
A=A-1 // 4636
M=D // 4637
@54 // 4638
D=A // 4639
@SP // 4640
AM=M+1 // 4641
A=A-1 // 4642
M=D // 4643
@54 // 4644
D=A // 4645
@SP // 4646
AM=M+1 // 4647
A=A-1 // 4648
M=D // 4649
@20 // 4650
D=A // 4651
@SP // 4652
AM=M+1 // 4653
A=A-1 // 4654
M=D // 4655
@SP // 4656
AM=M+1 // 4657
A=A-1 // 4658
M=0 // 4659
@SP // 4660
AM=M+1 // 4661
A=A-1 // 4662
M=0 // 4663
@SP // 4664
AM=M+1 // 4665
A=A-1 // 4666
M=0 // 4667
@SP // 4668
AM=M+1 // 4669
A=A-1 // 4670
M=0 // 4671
@SP // 4672
AM=M+1 // 4673
A=A-1 // 4674
M=0 // 4675
@SP // 4676
AM=M+1 // 4677
A=A-1 // 4678
M=0 // 4679
@SP // 4680
AM=M+1 // 4681
A=A-1 // 4682
M=0 // 4683
@SP // 4684
AM=M+1 // 4685
A=A-1 // 4686
M=0 // 4687
// call Output.create
@17 // 4688
D=A // 4689
@14 // 4690
M=D // 4691
@Output.create // 4692
D=A // 4693
@13 // 4694
M=D // 4695
@Output.initMap.ret.4 // 4696
D=A // 4697
@CALL // 4698
0;JMP // 4699
(Output.initMap.ret.4)
@SP // 4700
AM=M-1 // 4701
D=M // 4702
@5 // 4703
M=D // 4704

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 35")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 18")
//          arg[3]:
//              PushInstruction("constant 18")
//          arg[4]:
//              PushInstruction("constant 63")
//          arg[5]:
//              PushInstruction("constant 18")
//          arg[6]:
//              PushInstruction("constant 18")
//          arg[7]:
//              PushInstruction("constant 63")
//          arg[8]:
//              PushInstruction("constant 18")
//          arg[9]:
//              PushInstruction("constant 18")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=5}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@35 // 4705
D=A // 4706
@SP // 4707
AM=M+1 // 4708
A=A-1 // 4709
M=D // 4710
@SP // 4711
AM=M+1 // 4712
A=A-1 // 4713
M=0 // 4714
@18 // 4715
D=A // 4716
@SP // 4717
AM=M+1 // 4718
A=A-1 // 4719
M=D // 4720
@18 // 4721
D=A // 4722
@SP // 4723
AM=M+1 // 4724
A=A-1 // 4725
M=D // 4726
@63 // 4727
D=A // 4728
@SP // 4729
AM=M+1 // 4730
A=A-1 // 4731
M=D // 4732
@18 // 4733
D=A // 4734
@SP // 4735
AM=M+1 // 4736
A=A-1 // 4737
M=D // 4738
@18 // 4739
D=A // 4740
@SP // 4741
AM=M+1 // 4742
A=A-1 // 4743
M=D // 4744
@63 // 4745
D=A // 4746
@SP // 4747
AM=M+1 // 4748
A=A-1 // 4749
M=D // 4750
@18 // 4751
D=A // 4752
@SP // 4753
AM=M+1 // 4754
A=A-1 // 4755
M=D // 4756
@18 // 4757
D=A // 4758
@SP // 4759
AM=M+1 // 4760
A=A-1 // 4761
M=D // 4762
@SP // 4763
AM=M+1 // 4764
A=A-1 // 4765
M=0 // 4766
@SP // 4767
AM=M+1 // 4768
A=A-1 // 4769
M=0 // 4770
// call Output.create
@17 // 4771
D=A // 4772
@14 // 4773
M=D // 4774
@Output.create // 4775
D=A // 4776
@13 // 4777
M=D // 4778
@Output.initMap.ret.5 // 4779
D=A // 4780
@CALL // 4781
0;JMP // 4782
(Output.initMap.ret.5)
@SP // 4783
AM=M-1 // 4784
D=M // 4785
@5 // 4786
M=D // 4787

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 36")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 30")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 3")
//          arg[5]:
//              PushInstruction("constant 30")
//          arg[6]:
//              PushInstruction("constant 48")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 30")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 12")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=6}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@36 // 4788
D=A // 4789
@SP // 4790
AM=M+1 // 4791
A=A-1 // 4792
M=D // 4793
@12 // 4794
D=A // 4795
@SP // 4796
AM=M+1 // 4797
A=A-1 // 4798
M=D // 4799
@30 // 4800
D=A // 4801
@SP // 4802
AM=M+1 // 4803
A=A-1 // 4804
M=D // 4805
@51 // 4806
D=A // 4807
@SP // 4808
AM=M+1 // 4809
A=A-1 // 4810
M=D // 4811
@3 // 4812
D=A // 4813
@SP // 4814
AM=M+1 // 4815
A=A-1 // 4816
M=D // 4817
@30 // 4818
D=A // 4819
@SP // 4820
AM=M+1 // 4821
A=A-1 // 4822
M=D // 4823
@48 // 4824
D=A // 4825
@SP // 4826
AM=M+1 // 4827
A=A-1 // 4828
M=D // 4829
@51 // 4830
D=A // 4831
@SP // 4832
AM=M+1 // 4833
A=A-1 // 4834
M=D // 4835
@30 // 4836
D=A // 4837
@SP // 4838
AM=M+1 // 4839
A=A-1 // 4840
M=D // 4841
@12 // 4842
D=A // 4843
@SP // 4844
AM=M+1 // 4845
A=A-1 // 4846
M=D // 4847
@12 // 4848
D=A // 4849
@SP // 4850
AM=M+1 // 4851
A=A-1 // 4852
M=D // 4853
@SP // 4854
AM=M+1 // 4855
A=A-1 // 4856
M=0 // 4857
// call Output.create
@17 // 4858
D=A // 4859
@14 // 4860
M=D // 4861
@Output.create // 4862
D=A // 4863
@13 // 4864
M=D // 4865
@Output.initMap.ret.6 // 4866
D=A // 4867
@CALL // 4868
0;JMP // 4869
(Output.initMap.ret.6)
@SP // 4870
AM=M-1 // 4871
D=M // 4872
@5 // 4873
M=D // 4874

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 37")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 35")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 24")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 6")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 49")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=7}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@37 // 4875
D=A // 4876
@SP // 4877
AM=M+1 // 4878
A=A-1 // 4879
M=D // 4880
@SP // 4881
AM=M+1 // 4882
A=A-1 // 4883
M=0 // 4884
@SP // 4885
AM=M+1 // 4886
A=A-1 // 4887
M=0 // 4888
@35 // 4889
D=A // 4890
@SP // 4891
AM=M+1 // 4892
A=A-1 // 4893
M=D // 4894
@51 // 4895
D=A // 4896
@SP // 4897
AM=M+1 // 4898
A=A-1 // 4899
M=D // 4900
@24 // 4901
D=A // 4902
@SP // 4903
AM=M+1 // 4904
A=A-1 // 4905
M=D // 4906
@12 // 4907
D=A // 4908
@SP // 4909
AM=M+1 // 4910
A=A-1 // 4911
M=D // 4912
@6 // 4913
D=A // 4914
@SP // 4915
AM=M+1 // 4916
A=A-1 // 4917
M=D // 4918
@51 // 4919
D=A // 4920
@SP // 4921
AM=M+1 // 4922
A=A-1 // 4923
M=D // 4924
@49 // 4925
D=A // 4926
@SP // 4927
AM=M+1 // 4928
A=A-1 // 4929
M=D // 4930
@SP // 4931
AM=M+1 // 4932
A=A-1 // 4933
M=0 // 4934
@SP // 4935
AM=M+1 // 4936
A=A-1 // 4937
M=0 // 4938
// call Output.create
@17 // 4939
D=A // 4940
@14 // 4941
M=D // 4942
@Output.create // 4943
D=A // 4944
@13 // 4945
M=D // 4946
@Output.initMap.ret.7 // 4947
D=A // 4948
@CALL // 4949
0;JMP // 4950
(Output.initMap.ret.7)
@SP // 4951
AM=M-1 // 4952
D=M // 4953
@5 // 4954
M=D // 4955

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 38")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 30")
//          arg[3]:
//              PushInstruction("constant 30")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 54")
//          arg[6]:
//              PushInstruction("constant 27")
//          arg[7]:
//              PushInstruction("constant 27")
//          arg[8]:
//              PushInstruction("constant 27")
//          arg[9]:
//              PushInstruction("constant 54")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=8}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@38 // 4956
D=A // 4957
@SP // 4958
AM=M+1 // 4959
A=A-1 // 4960
M=D // 4961
@12 // 4962
D=A // 4963
@SP // 4964
AM=M+1 // 4965
A=A-1 // 4966
M=D // 4967
@30 // 4968
D=A // 4969
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=D // 4973
@30 // 4974
D=A // 4975
@SP // 4976
AM=M+1 // 4977
A=A-1 // 4978
M=D // 4979
@12 // 4980
D=A // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=D // 4985
@54 // 4986
D=A // 4987
@SP // 4988
AM=M+1 // 4989
A=A-1 // 4990
M=D // 4991
@27 // 4992
D=A // 4993
@SP // 4994
AM=M+1 // 4995
A=A-1 // 4996
M=D // 4997
@27 // 4998
D=A // 4999
@SP // 5000
AM=M+1 // 5001
A=A-1 // 5002
M=D // 5003
@27 // 5004
D=A // 5005
@SP // 5006
AM=M+1 // 5007
A=A-1 // 5008
M=D // 5009
@54 // 5010
D=A // 5011
@SP // 5012
AM=M+1 // 5013
A=A-1 // 5014
M=D // 5015
@SP // 5016
AM=M+1 // 5017
A=A-1 // 5018
M=0 // 5019
@SP // 5020
AM=M+1 // 5021
A=A-1 // 5022
M=0 // 5023
// call Output.create
@17 // 5024
D=A // 5025
@14 // 5026
M=D // 5027
@Output.create // 5028
D=A // 5029
@13 // 5030
M=D // 5031
@Output.initMap.ret.8 // 5032
D=A // 5033
@CALL // 5034
0;JMP // 5035
(Output.initMap.ret.8)
@SP // 5036
AM=M-1 // 5037
D=M // 5038
@5 // 5039
M=D // 5040

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 39")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 6")
//          arg[4]:
//              PushInstruction("constant 0")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 0")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=9}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@39 // 5041
D=A // 5042
@SP // 5043
AM=M+1 // 5044
A=A-1 // 5045
M=D // 5046
@12 // 5047
D=A // 5048
@SP // 5049
AM=M+1 // 5050
A=A-1 // 5051
M=D // 5052
@12 // 5053
D=A // 5054
@SP // 5055
AM=M+1 // 5056
A=A-1 // 5057
M=D // 5058
@6 // 5059
D=A // 5060
@SP // 5061
AM=M+1 // 5062
A=A-1 // 5063
M=D // 5064
@SP // 5065
AM=M+1 // 5066
A=A-1 // 5067
M=0 // 5068
@SP // 5069
AM=M+1 // 5070
A=A-1 // 5071
M=0 // 5072
@SP // 5073
AM=M+1 // 5074
A=A-1 // 5075
M=0 // 5076
@SP // 5077
AM=M+1 // 5078
A=A-1 // 5079
M=0 // 5080
@SP // 5081
AM=M+1 // 5082
A=A-1 // 5083
M=0 // 5084
@SP // 5085
AM=M+1 // 5086
A=A-1 // 5087
M=0 // 5088
@SP // 5089
AM=M+1 // 5090
A=A-1 // 5091
M=0 // 5092
@SP // 5093
AM=M+1 // 5094
A=A-1 // 5095
M=0 // 5096
// call Output.create
@17 // 5097
D=A // 5098
@14 // 5099
M=D // 5100
@Output.create // 5101
D=A // 5102
@13 // 5103
M=D // 5104
@Output.initMap.ret.9 // 5105
D=A // 5106
@CALL // 5107
0;JMP // 5108
(Output.initMap.ret.9)
@SP // 5109
AM=M-1 // 5110
D=M // 5111
@5 // 5112
M=D // 5113

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 40")
//          arg[1]:
//              PushInstruction("constant 24")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 6")
//          arg[4]:
//              PushInstruction("constant 6")
//          arg[5]:
//              PushInstruction("constant 6")
//          arg[6]:
//              PushInstruction("constant 6")
//          arg[7]:
//              PushInstruction("constant 6")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 24")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=10}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@40 // 5114
D=A // 5115
@SP // 5116
AM=M+1 // 5117
A=A-1 // 5118
M=D // 5119
@24 // 5120
D=A // 5121
@SP // 5122
AM=M+1 // 5123
A=A-1 // 5124
M=D // 5125
@12 // 5126
D=A // 5127
@SP // 5128
AM=M+1 // 5129
A=A-1 // 5130
M=D // 5131
@6 // 5132
D=A // 5133
@SP // 5134
AM=M+1 // 5135
A=A-1 // 5136
M=D // 5137
@6 // 5138
D=A // 5139
@SP // 5140
AM=M+1 // 5141
A=A-1 // 5142
M=D // 5143
@6 // 5144
D=A // 5145
@SP // 5146
AM=M+1 // 5147
A=A-1 // 5148
M=D // 5149
@6 // 5150
D=A // 5151
@SP // 5152
AM=M+1 // 5153
A=A-1 // 5154
M=D // 5155
@6 // 5156
D=A // 5157
@SP // 5158
AM=M+1 // 5159
A=A-1 // 5160
M=D // 5161
@12 // 5162
D=A // 5163
@SP // 5164
AM=M+1 // 5165
A=A-1 // 5166
M=D // 5167
@24 // 5168
D=A // 5169
@SP // 5170
AM=M+1 // 5171
A=A-1 // 5172
M=D // 5173
@SP // 5174
AM=M+1 // 5175
A=A-1 // 5176
M=0 // 5177
@SP // 5178
AM=M+1 // 5179
A=A-1 // 5180
M=0 // 5181
// call Output.create
@17 // 5182
D=A // 5183
@14 // 5184
M=D // 5185
@Output.create // 5186
D=A // 5187
@13 // 5188
M=D // 5189
@Output.initMap.ret.10 // 5190
D=A // 5191
@CALL // 5192
0;JMP // 5193
(Output.initMap.ret.10)
@SP // 5194
AM=M-1 // 5195
D=M // 5196
@5 // 5197
M=D // 5198

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 41")
//          arg[1]:
//              PushInstruction("constant 6")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 24")
//          arg[4]:
//              PushInstruction("constant 24")
//          arg[5]:
//              PushInstruction("constant 24")
//          arg[6]:
//              PushInstruction("constant 24")
//          arg[7]:
//              PushInstruction("constant 24")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 6")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=11}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@41 // 5199
D=A // 5200
@SP // 5201
AM=M+1 // 5202
A=A-1 // 5203
M=D // 5204
@6 // 5205
D=A // 5206
@SP // 5207
AM=M+1 // 5208
A=A-1 // 5209
M=D // 5210
@12 // 5211
D=A // 5212
@SP // 5213
AM=M+1 // 5214
A=A-1 // 5215
M=D // 5216
@24 // 5217
D=A // 5218
@SP // 5219
AM=M+1 // 5220
A=A-1 // 5221
M=D // 5222
@24 // 5223
D=A // 5224
@SP // 5225
AM=M+1 // 5226
A=A-1 // 5227
M=D // 5228
@24 // 5229
D=A // 5230
@SP // 5231
AM=M+1 // 5232
A=A-1 // 5233
M=D // 5234
@24 // 5235
D=A // 5236
@SP // 5237
AM=M+1 // 5238
A=A-1 // 5239
M=D // 5240
@24 // 5241
D=A // 5242
@SP // 5243
AM=M+1 // 5244
A=A-1 // 5245
M=D // 5246
@12 // 5247
D=A // 5248
@SP // 5249
AM=M+1 // 5250
A=A-1 // 5251
M=D // 5252
@6 // 5253
D=A // 5254
@SP // 5255
AM=M+1 // 5256
A=A-1 // 5257
M=D // 5258
@SP // 5259
AM=M+1 // 5260
A=A-1 // 5261
M=0 // 5262
@SP // 5263
AM=M+1 // 5264
A=A-1 // 5265
M=0 // 5266
// call Output.create
@17 // 5267
D=A // 5268
@14 // 5269
M=D // 5270
@Output.create // 5271
D=A // 5272
@13 // 5273
M=D // 5274
@Output.initMap.ret.11 // 5275
D=A // 5276
@CALL // 5277
0;JMP // 5278
(Output.initMap.ret.11)
@SP // 5279
AM=M-1 // 5280
D=M // 5281
@5 // 5282
M=D // 5283

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 42")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 30")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 30")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=12}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@42 // 5284
D=A // 5285
@SP // 5286
AM=M+1 // 5287
A=A-1 // 5288
M=D // 5289
@SP // 5290
AM=M+1 // 5291
A=A-1 // 5292
M=0 // 5293
@SP // 5294
AM=M+1 // 5295
A=A-1 // 5296
M=0 // 5297
@SP // 5298
AM=M+1 // 5299
A=A-1 // 5300
M=0 // 5301
@51 // 5302
D=A // 5303
@SP // 5304
AM=M+1 // 5305
A=A-1 // 5306
M=D // 5307
@30 // 5308
D=A // 5309
@SP // 5310
AM=M+1 // 5311
A=A-1 // 5312
M=D // 5313
@63 // 5314
D=A // 5315
@SP // 5316
AM=M+1 // 5317
A=A-1 // 5318
M=D // 5319
@30 // 5320
D=A // 5321
@SP // 5322
AM=M+1 // 5323
A=A-1 // 5324
M=D // 5325
@51 // 5326
D=A // 5327
@SP // 5328
AM=M+1 // 5329
A=A-1 // 5330
M=D // 5331
@SP // 5332
AM=M+1 // 5333
A=A-1 // 5334
M=0 // 5335
@SP // 5336
AM=M+1 // 5337
A=A-1 // 5338
M=0 // 5339
@SP // 5340
AM=M+1 // 5341
A=A-1 // 5342
M=0 // 5343
// call Output.create
@17 // 5344
D=A // 5345
@14 // 5346
M=D // 5347
@Output.create // 5348
D=A // 5349
@13 // 5350
M=D // 5351
@Output.initMap.ret.12 // 5352
D=A // 5353
@CALL // 5354
0;JMP // 5355
(Output.initMap.ret.12)
@SP // 5356
AM=M-1 // 5357
D=M // 5358
@5 // 5359
M=D // 5360

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 43")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=13}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@43 // 5361
D=A // 5362
@SP // 5363
AM=M+1 // 5364
A=A-1 // 5365
M=D // 5366
@SP // 5367
AM=M+1 // 5368
A=A-1 // 5369
M=0 // 5370
@SP // 5371
AM=M+1 // 5372
A=A-1 // 5373
M=0 // 5374
@SP // 5375
AM=M+1 // 5376
A=A-1 // 5377
M=0 // 5378
@12 // 5379
D=A // 5380
@SP // 5381
AM=M+1 // 5382
A=A-1 // 5383
M=D // 5384
@12 // 5385
D=A // 5386
@SP // 5387
AM=M+1 // 5388
A=A-1 // 5389
M=D // 5390
@63 // 5391
D=A // 5392
@SP // 5393
AM=M+1 // 5394
A=A-1 // 5395
M=D // 5396
@12 // 5397
D=A // 5398
@SP // 5399
AM=M+1 // 5400
A=A-1 // 5401
M=D // 5402
@12 // 5403
D=A // 5404
@SP // 5405
AM=M+1 // 5406
A=A-1 // 5407
M=D // 5408
@SP // 5409
AM=M+1 // 5410
A=A-1 // 5411
M=0 // 5412
@SP // 5413
AM=M+1 // 5414
A=A-1 // 5415
M=0 // 5416
@SP // 5417
AM=M+1 // 5418
A=A-1 // 5419
M=0 // 5420
// call Output.create
@17 // 5421
D=A // 5422
@14 // 5423
M=D // 5424
@Output.create // 5425
D=A // 5426
@13 // 5427
M=D // 5428
@Output.initMap.ret.13 // 5429
D=A // 5430
@CALL // 5431
0;JMP // 5432
(Output.initMap.ret.13)
@SP // 5433
AM=M-1 // 5434
D=M // 5435
@5 // 5436
M=D // 5437

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 44")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 0")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 6")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=14}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@44 // 5438
D=A // 5439
@SP // 5440
AM=M+1 // 5441
A=A-1 // 5442
M=D // 5443
@SP // 5444
AM=M+1 // 5445
A=A-1 // 5446
M=0 // 5447
@SP // 5448
AM=M+1 // 5449
A=A-1 // 5450
M=0 // 5451
@SP // 5452
AM=M+1 // 5453
A=A-1 // 5454
M=0 // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=0 // 5459
@SP // 5460
AM=M+1 // 5461
A=A-1 // 5462
M=0 // 5463
@SP // 5464
AM=M+1 // 5465
A=A-1 // 5466
M=0 // 5467
@SP // 5468
AM=M+1 // 5469
A=A-1 // 5470
M=0 // 5471
@12 // 5472
D=A // 5473
@SP // 5474
AM=M+1 // 5475
A=A-1 // 5476
M=D // 5477
@12 // 5478
D=A // 5479
@SP // 5480
AM=M+1 // 5481
A=A-1 // 5482
M=D // 5483
@6 // 5484
D=A // 5485
@SP // 5486
AM=M+1 // 5487
A=A-1 // 5488
M=D // 5489
@SP // 5490
AM=M+1 // 5491
A=A-1 // 5492
M=0 // 5493
// call Output.create
@17 // 5494
D=A // 5495
@14 // 5496
M=D // 5497
@Output.create // 5498
D=A // 5499
@13 // 5500
M=D // 5501
@Output.initMap.ret.14 // 5502
D=A // 5503
@CALL // 5504
0;JMP // 5505
(Output.initMap.ret.14)
@SP // 5506
AM=M-1 // 5507
D=M // 5508
@5 // 5509
M=D // 5510

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 45")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 0")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 0")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=15}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@45 // 5511
D=A // 5512
@SP // 5513
AM=M+1 // 5514
A=A-1 // 5515
M=D // 5516
@SP // 5517
AM=M+1 // 5518
A=A-1 // 5519
M=0 // 5520
@SP // 5521
AM=M+1 // 5522
A=A-1 // 5523
M=0 // 5524
@SP // 5525
AM=M+1 // 5526
A=A-1 // 5527
M=0 // 5528
@SP // 5529
AM=M+1 // 5530
A=A-1 // 5531
M=0 // 5532
@SP // 5533
AM=M+1 // 5534
A=A-1 // 5535
M=0 // 5536
@63 // 5537
D=A // 5538
@SP // 5539
AM=M+1 // 5540
A=A-1 // 5541
M=D // 5542
@SP // 5543
AM=M+1 // 5544
A=A-1 // 5545
M=0 // 5546
@SP // 5547
AM=M+1 // 5548
A=A-1 // 5549
M=0 // 5550
@SP // 5551
AM=M+1 // 5552
A=A-1 // 5553
M=0 // 5554
@SP // 5555
AM=M+1 // 5556
A=A-1 // 5557
M=0 // 5558
@SP // 5559
AM=M+1 // 5560
A=A-1 // 5561
M=0 // 5562
// call Output.create
@17 // 5563
D=A // 5564
@14 // 5565
M=D // 5566
@Output.create // 5567
D=A // 5568
@13 // 5569
M=D // 5570
@Output.initMap.ret.15 // 5571
D=A // 5572
@CALL // 5573
0;JMP // 5574
(Output.initMap.ret.15)
@SP // 5575
AM=M-1 // 5576
D=M // 5577
@5 // 5578
M=D // 5579

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 46")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 0")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 0")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=16}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@46 // 5580
D=A // 5581
@SP // 5582
AM=M+1 // 5583
A=A-1 // 5584
M=D // 5585
@SP // 5586
AM=M+1 // 5587
A=A-1 // 5588
M=0 // 5589
@SP // 5590
AM=M+1 // 5591
A=A-1 // 5592
M=0 // 5593
@SP // 5594
AM=M+1 // 5595
A=A-1 // 5596
M=0 // 5597
@SP // 5598
AM=M+1 // 5599
A=A-1 // 5600
M=0 // 5601
@SP // 5602
AM=M+1 // 5603
A=A-1 // 5604
M=0 // 5605
@SP // 5606
AM=M+1 // 5607
A=A-1 // 5608
M=0 // 5609
@SP // 5610
AM=M+1 // 5611
A=A-1 // 5612
M=0 // 5613
@12 // 5614
D=A // 5615
@SP // 5616
AM=M+1 // 5617
A=A-1 // 5618
M=D // 5619
@12 // 5620
D=A // 5621
@SP // 5622
AM=M+1 // 5623
A=A-1 // 5624
M=D // 5625
@SP // 5626
AM=M+1 // 5627
A=A-1 // 5628
M=0 // 5629
@SP // 5630
AM=M+1 // 5631
A=A-1 // 5632
M=0 // 5633
// call Output.create
@17 // 5634
D=A // 5635
@14 // 5636
M=D // 5637
@Output.create // 5638
D=A // 5639
@13 // 5640
M=D // 5641
@Output.initMap.ret.16 // 5642
D=A // 5643
@CALL // 5644
0;JMP // 5645
(Output.initMap.ret.16)
@SP // 5646
AM=M-1 // 5647
D=M // 5648
@5 // 5649
M=D // 5650

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 47")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 32")
//          arg[4]:
//              PushInstruction("constant 48")
//          arg[5]:
//              PushInstruction("constant 24")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 6")
//          arg[8]:
//              PushInstruction("constant 3")
//          arg[9]:
//              PushInstruction("constant 1")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=17}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@47 // 5651
D=A // 5652
@SP // 5653
AM=M+1 // 5654
A=A-1 // 5655
M=D // 5656
@SP // 5657
AM=M+1 // 5658
A=A-1 // 5659
M=0 // 5660
@SP // 5661
AM=M+1 // 5662
A=A-1 // 5663
M=0 // 5664
@32 // 5665
D=A // 5666
@SP // 5667
AM=M+1 // 5668
A=A-1 // 5669
M=D // 5670
@48 // 5671
D=A // 5672
@SP // 5673
AM=M+1 // 5674
A=A-1 // 5675
M=D // 5676
@24 // 5677
D=A // 5678
@SP // 5679
AM=M+1 // 5680
A=A-1 // 5681
M=D // 5682
@12 // 5683
D=A // 5684
@SP // 5685
AM=M+1 // 5686
A=A-1 // 5687
M=D // 5688
@6 // 5689
D=A // 5690
@SP // 5691
AM=M+1 // 5692
A=A-1 // 5693
M=D // 5694
@3 // 5695
D=A // 5696
@SP // 5697
AM=M+1 // 5698
A=A-1 // 5699
M=D // 5700
@SP // 5701
AM=M+1 // 5702
A=A-1 // 5703
M=1 // 5704
@SP // 5705
AM=M+1 // 5706
A=A-1 // 5707
M=0 // 5708
@SP // 5709
AM=M+1 // 5710
A=A-1 // 5711
M=0 // 5712
// call Output.create
@17 // 5713
D=A // 5714
@14 // 5715
M=D // 5716
@Output.create // 5717
D=A // 5718
@13 // 5719
M=D // 5720
@Output.initMap.ret.17 // 5721
D=A // 5722
@CALL // 5723
0;JMP // 5724
(Output.initMap.ret.17)
@SP // 5725
AM=M-1 // 5726
D=M // 5727
@5 // 5728
M=D // 5729

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 48")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 30")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 30")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=18}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@48 // 5730
D=A // 5731
@SP // 5732
AM=M+1 // 5733
A=A-1 // 5734
M=D // 5735
@12 // 5736
D=A // 5737
@SP // 5738
AM=M+1 // 5739
A=A-1 // 5740
M=D // 5741
@30 // 5742
D=A // 5743
@SP // 5744
AM=M+1 // 5745
A=A-1 // 5746
M=D // 5747
@51 // 5748
D=A // 5749
@SP // 5750
AM=M+1 // 5751
A=A-1 // 5752
M=D // 5753
@51 // 5754
D=A // 5755
@SP // 5756
AM=M+1 // 5757
A=A-1 // 5758
M=D // 5759
@51 // 5760
D=A // 5761
@SP // 5762
AM=M+1 // 5763
A=A-1 // 5764
M=D // 5765
@51 // 5766
D=A // 5767
@SP // 5768
AM=M+1 // 5769
A=A-1 // 5770
M=D // 5771
@51 // 5772
D=A // 5773
@SP // 5774
AM=M+1 // 5775
A=A-1 // 5776
M=D // 5777
@30 // 5778
D=A // 5779
@SP // 5780
AM=M+1 // 5781
A=A-1 // 5782
M=D // 5783
@12 // 5784
D=A // 5785
@SP // 5786
AM=M+1 // 5787
A=A-1 // 5788
M=D // 5789
@SP // 5790
AM=M+1 // 5791
A=A-1 // 5792
M=0 // 5793
@SP // 5794
AM=M+1 // 5795
A=A-1 // 5796
M=0 // 5797
// call Output.create
@17 // 5798
D=A // 5799
@14 // 5800
M=D // 5801
@Output.create // 5802
D=A // 5803
@13 // 5804
M=D // 5805
@Output.initMap.ret.18 // 5806
D=A // 5807
@CALL // 5808
0;JMP // 5809
(Output.initMap.ret.18)
@SP // 5810
AM=M-1 // 5811
D=M // 5812
@5 // 5813
M=D // 5814

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 49")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 14")
//          arg[3]:
//              PushInstruction("constant 15")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=19}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@49 // 5815
D=A // 5816
@SP // 5817
AM=M+1 // 5818
A=A-1 // 5819
M=D // 5820
@12 // 5821
D=A // 5822
@SP // 5823
AM=M+1 // 5824
A=A-1 // 5825
M=D // 5826
@14 // 5827
D=A // 5828
@SP // 5829
AM=M+1 // 5830
A=A-1 // 5831
M=D // 5832
@15 // 5833
D=A // 5834
@SP // 5835
AM=M+1 // 5836
A=A-1 // 5837
M=D // 5838
@12 // 5839
D=A // 5840
@SP // 5841
AM=M+1 // 5842
A=A-1 // 5843
M=D // 5844
@12 // 5845
D=A // 5846
@SP // 5847
AM=M+1 // 5848
A=A-1 // 5849
M=D // 5850
@12 // 5851
D=A // 5852
@SP // 5853
AM=M+1 // 5854
A=A-1 // 5855
M=D // 5856
@12 // 5857
D=A // 5858
@SP // 5859
AM=M+1 // 5860
A=A-1 // 5861
M=D // 5862
@12 // 5863
D=A // 5864
@SP // 5865
AM=M+1 // 5866
A=A-1 // 5867
M=D // 5868
@63 // 5869
D=A // 5870
@SP // 5871
AM=M+1 // 5872
A=A-1 // 5873
M=D // 5874
@SP // 5875
AM=M+1 // 5876
A=A-1 // 5877
M=0 // 5878
@SP // 5879
AM=M+1 // 5880
A=A-1 // 5881
M=0 // 5882
// call Output.create
@17 // 5883
D=A // 5884
@14 // 5885
M=D // 5886
@Output.create // 5887
D=A // 5888
@13 // 5889
M=D // 5890
@Output.initMap.ret.19 // 5891
D=A // 5892
@CALL // 5893
0;JMP // 5894
(Output.initMap.ret.19)
@SP // 5895
AM=M-1 // 5896
D=M // 5897
@5 // 5898
M=D // 5899

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 50")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 48")
//          arg[4]:
//              PushInstruction("constant 24")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 6")
//          arg[7]:
//              PushInstruction("constant 3")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=20}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@50 // 5900
D=A // 5901
@SP // 5902
AM=M+1 // 5903
A=A-1 // 5904
M=D // 5905
@30 // 5906
D=A // 5907
@SP // 5908
AM=M+1 // 5909
A=A-1 // 5910
M=D // 5911
@51 // 5912
D=A // 5913
@SP // 5914
AM=M+1 // 5915
A=A-1 // 5916
M=D // 5917
@48 // 5918
D=A // 5919
@SP // 5920
AM=M+1 // 5921
A=A-1 // 5922
M=D // 5923
@24 // 5924
D=A // 5925
@SP // 5926
AM=M+1 // 5927
A=A-1 // 5928
M=D // 5929
@12 // 5930
D=A // 5931
@SP // 5932
AM=M+1 // 5933
A=A-1 // 5934
M=D // 5935
@6 // 5936
D=A // 5937
@SP // 5938
AM=M+1 // 5939
A=A-1 // 5940
M=D // 5941
@3 // 5942
D=A // 5943
@SP // 5944
AM=M+1 // 5945
A=A-1 // 5946
M=D // 5947
@51 // 5948
D=A // 5949
@SP // 5950
AM=M+1 // 5951
A=A-1 // 5952
M=D // 5953
@63 // 5954
D=A // 5955
@SP // 5956
AM=M+1 // 5957
A=A-1 // 5958
M=D // 5959
@SP // 5960
AM=M+1 // 5961
A=A-1 // 5962
M=0 // 5963
@SP // 5964
AM=M+1 // 5965
A=A-1 // 5966
M=0 // 5967
// call Output.create
@17 // 5968
D=A // 5969
@14 // 5970
M=D // 5971
@Output.create // 5972
D=A // 5973
@13 // 5974
M=D // 5975
@Output.initMap.ret.20 // 5976
D=A // 5977
@CALL // 5978
0;JMP // 5979
(Output.initMap.ret.20)
@SP // 5980
AM=M-1 // 5981
D=M // 5982
@5 // 5983
M=D // 5984

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 51")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 48")
//          arg[4]:
//              PushInstruction("constant 48")
//          arg[5]:
//              PushInstruction("constant 28")
//          arg[6]:
//              PushInstruction("constant 48")
//          arg[7]:
//              PushInstruction("constant 48")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=21}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@51 // 5985
D=A // 5986
@SP // 5987
AM=M+1 // 5988
A=A-1 // 5989
M=D // 5990
@30 // 5991
D=A // 5992
@SP // 5993
AM=M+1 // 5994
A=A-1 // 5995
M=D // 5996
@51 // 5997
D=A // 5998
@SP // 5999
AM=M+1 // 6000
A=A-1 // 6001
M=D // 6002
@48 // 6003
D=A // 6004
@SP // 6005
AM=M+1 // 6006
A=A-1 // 6007
M=D // 6008
@48 // 6009
D=A // 6010
@SP // 6011
AM=M+1 // 6012
A=A-1 // 6013
M=D // 6014
@28 // 6015
D=A // 6016
@SP // 6017
AM=M+1 // 6018
A=A-1 // 6019
M=D // 6020
@48 // 6021
D=A // 6022
@SP // 6023
AM=M+1 // 6024
A=A-1 // 6025
M=D // 6026
@48 // 6027
D=A // 6028
@SP // 6029
AM=M+1 // 6030
A=A-1 // 6031
M=D // 6032
@51 // 6033
D=A // 6034
@SP // 6035
AM=M+1 // 6036
A=A-1 // 6037
M=D // 6038
@30 // 6039
D=A // 6040
@SP // 6041
AM=M+1 // 6042
A=A-1 // 6043
M=D // 6044
@SP // 6045
AM=M+1 // 6046
A=A-1 // 6047
M=0 // 6048
@SP // 6049
AM=M+1 // 6050
A=A-1 // 6051
M=0 // 6052
// call Output.create
@17 // 6053
D=A // 6054
@14 // 6055
M=D // 6056
@Output.create // 6057
D=A // 6058
@13 // 6059
M=D // 6060
@Output.initMap.ret.21 // 6061
D=A // 6062
@CALL // 6063
0;JMP // 6064
(Output.initMap.ret.21)
@SP // 6065
AM=M-1 // 6066
D=M // 6067
@5 // 6068
M=D // 6069

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 52")
//          arg[1]:
//              PushInstruction("constant 16")
//          arg[2]:
//              PushInstruction("constant 24")
//          arg[3]:
//              PushInstruction("constant 28")
//          arg[4]:
//              PushInstruction("constant 26")
//          arg[5]:
//              PushInstruction("constant 25")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 24")
//          arg[8]:
//              PushInstruction("constant 24")
//          arg[9]:
//              PushInstruction("constant 60")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=22}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@52 // 6070
D=A // 6071
@SP // 6072
AM=M+1 // 6073
A=A-1 // 6074
M=D // 6075
@16 // 6076
D=A // 6077
@SP // 6078
AM=M+1 // 6079
A=A-1 // 6080
M=D // 6081
@24 // 6082
D=A // 6083
@SP // 6084
AM=M+1 // 6085
A=A-1 // 6086
M=D // 6087
@28 // 6088
D=A // 6089
@SP // 6090
AM=M+1 // 6091
A=A-1 // 6092
M=D // 6093
@26 // 6094
D=A // 6095
@SP // 6096
AM=M+1 // 6097
A=A-1 // 6098
M=D // 6099
@25 // 6100
D=A // 6101
@SP // 6102
AM=M+1 // 6103
A=A-1 // 6104
M=D // 6105
@63 // 6106
D=A // 6107
@SP // 6108
AM=M+1 // 6109
A=A-1 // 6110
M=D // 6111
@24 // 6112
D=A // 6113
@SP // 6114
AM=M+1 // 6115
A=A-1 // 6116
M=D // 6117
@24 // 6118
D=A // 6119
@SP // 6120
AM=M+1 // 6121
A=A-1 // 6122
M=D // 6123
@60 // 6124
D=A // 6125
@SP // 6126
AM=M+1 // 6127
A=A-1 // 6128
M=D // 6129
@SP // 6130
AM=M+1 // 6131
A=A-1 // 6132
M=0 // 6133
@SP // 6134
AM=M+1 // 6135
A=A-1 // 6136
M=0 // 6137
// call Output.create
@17 // 6138
D=A // 6139
@14 // 6140
M=D // 6141
@Output.create // 6142
D=A // 6143
@13 // 6144
M=D // 6145
@Output.initMap.ret.22 // 6146
D=A // 6147
@CALL // 6148
0;JMP // 6149
(Output.initMap.ret.22)
@SP // 6150
AM=M-1 // 6151
D=M // 6152
@5 // 6153
M=D // 6154

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 53")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 3")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 31")
//          arg[5]:
//              PushInstruction("constant 48")
//          arg[6]:
//              PushInstruction("constant 48")
//          arg[7]:
//              PushInstruction("constant 48")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=23}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@53 // 6155
D=A // 6156
@SP // 6157
AM=M+1 // 6158
A=A-1 // 6159
M=D // 6160
@63 // 6161
D=A // 6162
@SP // 6163
AM=M+1 // 6164
A=A-1 // 6165
M=D // 6166
@3 // 6167
D=A // 6168
@SP // 6169
AM=M+1 // 6170
A=A-1 // 6171
M=D // 6172
@3 // 6173
D=A // 6174
@SP // 6175
AM=M+1 // 6176
A=A-1 // 6177
M=D // 6178
@31 // 6179
D=A // 6180
@SP // 6181
AM=M+1 // 6182
A=A-1 // 6183
M=D // 6184
@48 // 6185
D=A // 6186
@SP // 6187
AM=M+1 // 6188
A=A-1 // 6189
M=D // 6190
@48 // 6191
D=A // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=D // 6196
@48 // 6197
D=A // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=D // 6202
@51 // 6203
D=A // 6204
@SP // 6205
AM=M+1 // 6206
A=A-1 // 6207
M=D // 6208
@30 // 6209
D=A // 6210
@SP // 6211
AM=M+1 // 6212
A=A-1 // 6213
M=D // 6214
@SP // 6215
AM=M+1 // 6216
A=A-1 // 6217
M=0 // 6218
@SP // 6219
AM=M+1 // 6220
A=A-1 // 6221
M=0 // 6222
// call Output.create
@17 // 6223
D=A // 6224
@14 // 6225
M=D // 6226
@Output.create // 6227
D=A // 6228
@13 // 6229
M=D // 6230
@Output.initMap.ret.23 // 6231
D=A // 6232
@CALL // 6233
0;JMP // 6234
(Output.initMap.ret.23)
@SP // 6235
AM=M-1 // 6236
D=M // 6237
@5 // 6238
M=D // 6239

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 54")
//          arg[1]:
//              PushInstruction("constant 28")
//          arg[2]:
//              PushInstruction("constant 6")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 3")
//          arg[5]:
//              PushInstruction("constant 31")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=24}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@54 // 6240
D=A // 6241
@SP // 6242
AM=M+1 // 6243
A=A-1 // 6244
M=D // 6245
@28 // 6246
D=A // 6247
@SP // 6248
AM=M+1 // 6249
A=A-1 // 6250
M=D // 6251
@6 // 6252
D=A // 6253
@SP // 6254
AM=M+1 // 6255
A=A-1 // 6256
M=D // 6257
@3 // 6258
D=A // 6259
@SP // 6260
AM=M+1 // 6261
A=A-1 // 6262
M=D // 6263
@3 // 6264
D=A // 6265
@SP // 6266
AM=M+1 // 6267
A=A-1 // 6268
M=D // 6269
@31 // 6270
D=A // 6271
@SP // 6272
AM=M+1 // 6273
A=A-1 // 6274
M=D // 6275
@51 // 6276
D=A // 6277
@SP // 6278
AM=M+1 // 6279
A=A-1 // 6280
M=D // 6281
@51 // 6282
D=A // 6283
@S