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
@SP // 6284
AM=M+1 // 6285
A=A-1 // 6286
M=D // 6287
@51 // 6288
D=A // 6289
@SP // 6290
AM=M+1 // 6291
A=A-1 // 6292
M=D // 6293
@30 // 6294
D=A // 6295
@SP // 6296
AM=M+1 // 6297
A=A-1 // 6298
M=D // 6299
@SP // 6300
AM=M+1 // 6301
A=A-1 // 6302
M=0 // 6303
@SP // 6304
AM=M+1 // 6305
A=A-1 // 6306
M=0 // 6307
// call Output.create
@17 // 6308
D=A // 6309
@14 // 6310
M=D // 6311
@Output.create // 6312
D=A // 6313
@13 // 6314
M=D // 6315
@Output.initMap.ret.24 // 6316
D=A // 6317
@CALL // 6318
0;JMP // 6319
(Output.initMap.ret.24)
@SP // 6320
AM=M-1 // 6321
D=M // 6322
@5 // 6323
M=D // 6324

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 55")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 49")
//          arg[3]:
//              PushInstruction("constant 48")
//          arg[4]:
//              PushInstruction("constant 48")
//          arg[5]:
//              PushInstruction("constant 24")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=25}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@55 // 6325
D=A // 6326
@SP // 6327
AM=M+1 // 6328
A=A-1 // 6329
M=D // 6330
@63 // 6331
D=A // 6332
@SP // 6333
AM=M+1 // 6334
A=A-1 // 6335
M=D // 6336
@49 // 6337
D=A // 6338
@SP // 6339
AM=M+1 // 6340
A=A-1 // 6341
M=D // 6342
@48 // 6343
D=A // 6344
@SP // 6345
AM=M+1 // 6346
A=A-1 // 6347
M=D // 6348
@48 // 6349
D=A // 6350
@SP // 6351
AM=M+1 // 6352
A=A-1 // 6353
M=D // 6354
@24 // 6355
D=A // 6356
@SP // 6357
AM=M+1 // 6358
A=A-1 // 6359
M=D // 6360
@12 // 6361
D=A // 6362
@SP // 6363
AM=M+1 // 6364
A=A-1 // 6365
M=D // 6366
@12 // 6367
D=A // 6368
@SP // 6369
AM=M+1 // 6370
A=A-1 // 6371
M=D // 6372
@12 // 6373
D=A // 6374
@SP // 6375
AM=M+1 // 6376
A=A-1 // 6377
M=D // 6378
@12 // 6379
D=A // 6380
@SP // 6381
AM=M+1 // 6382
A=A-1 // 6383
M=D // 6384
@SP // 6385
AM=M+1 // 6386
A=A-1 // 6387
M=0 // 6388
@SP // 6389
AM=M+1 // 6390
A=A-1 // 6391
M=0 // 6392
// call Output.create
@17 // 6393
D=A // 6394
@14 // 6395
M=D // 6396
@Output.create // 6397
D=A // 6398
@13 // 6399
M=D // 6400
@Output.initMap.ret.25 // 6401
D=A // 6402
@CALL // 6403
0;JMP // 6404
(Output.initMap.ret.25)
@SP // 6405
AM=M-1 // 6406
D=M // 6407
@5 // 6408
M=D // 6409

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 56")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 30")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=26}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@56 // 6410
D=A // 6411
@SP // 6412
AM=M+1 // 6413
A=A-1 // 6414
M=D // 6415
@30 // 6416
D=A // 6417
@SP // 6418
AM=M+1 // 6419
A=A-1 // 6420
M=D // 6421
@51 // 6422
D=A // 6423
@SP // 6424
AM=M+1 // 6425
A=A-1 // 6426
M=D // 6427
@51 // 6428
D=A // 6429
@SP // 6430
AM=M+1 // 6431
A=A-1 // 6432
M=D // 6433
@51 // 6434
D=A // 6435
@SP // 6436
AM=M+1 // 6437
A=A-1 // 6438
M=D // 6439
@30 // 6440
D=A // 6441
@SP // 6442
AM=M+1 // 6443
A=A-1 // 6444
M=D // 6445
@51 // 6446
D=A // 6447
@SP // 6448
AM=M+1 // 6449
A=A-1 // 6450
M=D // 6451
@51 // 6452
D=A // 6453
@SP // 6454
AM=M+1 // 6455
A=A-1 // 6456
M=D // 6457
@51 // 6458
D=A // 6459
@SP // 6460
AM=M+1 // 6461
A=A-1 // 6462
M=D // 6463
@30 // 6464
D=A // 6465
@SP // 6466
AM=M+1 // 6467
A=A-1 // 6468
M=D // 6469
@SP // 6470
AM=M+1 // 6471
A=A-1 // 6472
M=0 // 6473
@SP // 6474
AM=M+1 // 6475
A=A-1 // 6476
M=0 // 6477
// call Output.create
@17 // 6478
D=A // 6479
@14 // 6480
M=D // 6481
@Output.create // 6482
D=A // 6483
@13 // 6484
M=D // 6485
@Output.initMap.ret.26 // 6486
D=A // 6487
@CALL // 6488
0;JMP // 6489
(Output.initMap.ret.26)
@SP // 6490
AM=M-1 // 6491
D=M // 6492
@5 // 6493
M=D // 6494

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 57")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 62")
//          arg[6]:
//              PushInstruction("constant 48")
//          arg[7]:
//              PushInstruction("constant 48")
//          arg[8]:
//              PushInstruction("constant 24")
//          arg[9]:
//              PushInstruction("constant 14")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=27}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@57 // 6495
D=A // 6496
@SP // 6497
AM=M+1 // 6498
A=A-1 // 6499
M=D // 6500
@30 // 6501
D=A // 6502
@SP // 6503
AM=M+1 // 6504
A=A-1 // 6505
M=D // 6506
@51 // 6507
D=A // 6508
@SP // 6509
AM=M+1 // 6510
A=A-1 // 6511
M=D // 6512
@51 // 6513
D=A // 6514
@SP // 6515
AM=M+1 // 6516
A=A-1 // 6517
M=D // 6518
@51 // 6519
D=A // 6520
@SP // 6521
AM=M+1 // 6522
A=A-1 // 6523
M=D // 6524
@62 // 6525
D=A // 6526
@SP // 6527
AM=M+1 // 6528
A=A-1 // 6529
M=D // 6530
@48 // 6531
D=A // 6532
@SP // 6533
AM=M+1 // 6534
A=A-1 // 6535
M=D // 6536
@48 // 6537
D=A // 6538
@SP // 6539
AM=M+1 // 6540
A=A-1 // 6541
M=D // 6542
@24 // 6543
D=A // 6544
@SP // 6545
AM=M+1 // 6546
A=A-1 // 6547
M=D // 6548
@14 // 6549
D=A // 6550
@SP // 6551
AM=M+1 // 6552
A=A-1 // 6553
M=D // 6554
@SP // 6555
AM=M+1 // 6556
A=A-1 // 6557
M=0 // 6558
@SP // 6559
AM=M+1 // 6560
A=A-1 // 6561
M=0 // 6562
// call Output.create
@17 // 6563
D=A // 6564
@14 // 6565
M=D // 6566
@Output.create // 6567
D=A // 6568
@13 // 6569
M=D // 6570
@Output.initMap.ret.27 // 6571
D=A // 6572
@CALL // 6573
0;JMP // 6574
(Output.initMap.ret.27)
@SP // 6575
AM=M-1 // 6576
D=M // 6577
@5 // 6578
M=D // 6579

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 58")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 12")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=28}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@58 // 6580
D=A // 6581
@SP // 6582
AM=M+1 // 6583
A=A-1 // 6584
M=D // 6585
@SP // 6586
AM=M+1 // 6587
A=A-1 // 6588
M=0 // 6589
@SP // 6590
AM=M+1 // 6591
A=A-1 // 6592
M=0 // 6593
@12 // 6594
D=A // 6595
@SP // 6596
AM=M+1 // 6597
A=A-1 // 6598
M=D // 6599
@12 // 6600
D=A // 6601
@SP // 6602
AM=M+1 // 6603
A=A-1 // 6604
M=D // 6605
@SP // 6606
AM=M+1 // 6607
A=A-1 // 6608
M=0 // 6609
@SP // 6610
AM=M+1 // 6611
A=A-1 // 6612
M=0 // 6613
@12 // 6614
D=A // 6615
@SP // 6616
AM=M+1 // 6617
A=A-1 // 6618
M=D // 6619
@12 // 6620
D=A // 6621
@SP // 6622
AM=M+1 // 6623
A=A-1 // 6624
M=D // 6625
@SP // 6626
AM=M+1 // 6627
A=A-1 // 6628
M=0 // 6629
@SP // 6630
AM=M+1 // 6631
A=A-1 // 6632
M=0 // 6633
@SP // 6634
AM=M+1 // 6635
A=A-1 // 6636
M=0 // 6637
// call Output.create
@17 // 6638
D=A // 6639
@14 // 6640
M=D // 6641
@Output.create // 6642
D=A // 6643
@13 // 6644
M=D // 6645
@Output.initMap.ret.28 // 6646
D=A // 6647
@CALL // 6648
0;JMP // 6649
(Output.initMap.ret.28)
@SP // 6650
AM=M-1 // 6651
D=M // 6652
@5 // 6653
M=D // 6654

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 59")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 12")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 6")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=29}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@59 // 6655
D=A // 6656
@SP // 6657
AM=M+1 // 6658
A=A-1 // 6659
M=D // 6660
@SP // 6661
AM=M+1 // 6662
A=A-1 // 6663
M=0 // 6664
@SP // 6665
AM=M+1 // 6666
A=A-1 // 6667
M=0 // 6668
@12 // 6669
D=A // 6670
@SP // 6671
AM=M+1 // 6672
A=A-1 // 6673
M=D // 6674
@12 // 6675
D=A // 6676
@SP // 6677
AM=M+1 // 6678
A=A-1 // 6679
M=D // 6680
@SP // 6681
AM=M+1 // 6682
A=A-1 // 6683
M=0 // 6684
@SP // 6685
AM=M+1 // 6686
A=A-1 // 6687
M=0 // 6688
@12 // 6689
D=A // 6690
@SP // 6691
AM=M+1 // 6692
A=A-1 // 6693
M=D // 6694
@12 // 6695
D=A // 6696
@SP // 6697
AM=M+1 // 6698
A=A-1 // 6699
M=D // 6700
@6 // 6701
D=A // 6702
@SP // 6703
AM=M+1 // 6704
A=A-1 // 6705
M=D // 6706
@SP // 6707
AM=M+1 // 6708
A=A-1 // 6709
M=0 // 6710
@SP // 6711
AM=M+1 // 6712
A=A-1 // 6713
M=0 // 6714
// call Output.create
@17 // 6715
D=A // 6716
@14 // 6717
M=D // 6718
@Output.create // 6719
D=A // 6720
@13 // 6721
M=D // 6722
@Output.initMap.ret.29 // 6723
D=A // 6724
@CALL // 6725
0;JMP // 6726
(Output.initMap.ret.29)
@SP // 6727
AM=M-1 // 6728
D=M // 6729
@5 // 6730
M=D // 6731

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 60")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 24")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 6")
//          arg[6]:
//              PushInstruction("constant 3")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=30}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@60 // 6732
D=A // 6733
@SP // 6734
AM=M+1 // 6735
A=A-1 // 6736
M=D // 6737
@SP // 6738
AM=M+1 // 6739
A=A-1 // 6740
M=0 // 6741
@SP // 6742
AM=M+1 // 6743
A=A-1 // 6744
M=0 // 6745
@24 // 6746
D=A // 6747
@SP // 6748
AM=M+1 // 6749
A=A-1 // 6750
M=D // 6751
@12 // 6752
D=A // 6753
@SP // 6754
AM=M+1 // 6755
A=A-1 // 6756
M=D // 6757
@6 // 6758
D=A // 6759
@SP // 6760
AM=M+1 // 6761
A=A-1 // 6762
M=D // 6763
@3 // 6764
D=A // 6765
@SP // 6766
AM=M+1 // 6767
A=A-1 // 6768
M=D // 6769
@6 // 6770
D=A // 6771
@SP // 6772
AM=M+1 // 6773
A=A-1 // 6774
M=D // 6775
@12 // 6776
D=A // 6777
@SP // 6778
AM=M+1 // 6779
A=A-1 // 6780
M=D // 6781
@24 // 6782
D=A // 6783
@SP // 6784
AM=M+1 // 6785
A=A-1 // 6786
M=D // 6787
@SP // 6788
AM=M+1 // 6789
A=A-1 // 6790
M=0 // 6791
@SP // 6792
AM=M+1 // 6793
A=A-1 // 6794
M=0 // 6795
// call Output.create
@17 // 6796
D=A // 6797
@14 // 6798
M=D // 6799
@Output.create // 6800
D=A // 6801
@13 // 6802
M=D // 6803
@Output.initMap.ret.30 // 6804
D=A // 6805
@CALL // 6806
0;JMP // 6807
(Output.initMap.ret.30)
@SP // 6808
AM=M-1 // 6809
D=M // 6810
@5 // 6811
M=D // 6812

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 61")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 63")
//          arg[5]:
//              PushInstruction("constant 0")
//          arg[6]:
//              PushInstruction("constant 0")
//          arg[7]:
//              PushInstruction("constant 63")
//          arg[8]:
//              PushInstruction("constant 0")
//          arg[9]:
//              PushInstruction("constant 0")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=31}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@61 // 6813
D=A // 6814
@SP // 6815
AM=M+1 // 6816
A=A-1 // 6817
M=D // 6818
@SP // 6819
AM=M+1 // 6820
A=A-1 // 6821
M=0 // 6822
@SP // 6823
AM=M+1 // 6824
A=A-1 // 6825
M=0 // 6826
@SP // 6827
AM=M+1 // 6828
A=A-1 // 6829
M=0 // 6830
@63 // 6831
D=A // 6832
@SP // 6833
AM=M+1 // 6834
A=A-1 // 6835
M=D // 6836
@SP // 6837
AM=M+1 // 6838
A=A-1 // 6839
M=0 // 6840
@SP // 6841
AM=M+1 // 6842
A=A-1 // 6843
M=0 // 6844
@63 // 6845
D=A // 6846
@SP // 6847
AM=M+1 // 6848
A=A-1 // 6849
M=D // 6850
@SP // 6851
AM=M+1 // 6852
A=A-1 // 6853
M=0 // 6854
@SP // 6855
AM=M+1 // 6856
A=A-1 // 6857
M=0 // 6858
@SP // 6859
AM=M+1 // 6860
A=A-1 // 6861
M=0 // 6862
@SP // 6863
AM=M+1 // 6864
A=A-1 // 6865
M=0 // 6866
// call Output.create
@17 // 6867
D=A // 6868
@14 // 6869
M=D // 6870
@Output.create // 6871
D=A // 6872
@13 // 6873
M=D // 6874
@Output.initMap.ret.31 // 6875
D=A // 6876
@CALL // 6877
0;JMP // 6878
(Output.initMap.ret.31)
@SP // 6879
AM=M-1 // 6880
D=M // 6881
@5 // 6882
M=D // 6883

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 62")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 6")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 24")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 6")
//          arg[9]:
//              PushInstruction("constant 3")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=32}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@62 // 6884
D=A // 6885
@SP // 6886
AM=M+1 // 6887
A=A-1 // 6888
M=D // 6889
@SP // 6890
AM=M+1 // 6891
A=A-1 // 6892
M=0 // 6893
@SP // 6894
AM=M+1 // 6895
A=A-1 // 6896
M=0 // 6897
@3 // 6898
D=A // 6899
@SP // 6900
AM=M+1 // 6901
A=A-1 // 6902
M=D // 6903
@6 // 6904
D=A // 6905
@SP // 6906
AM=M+1 // 6907
A=A-1 // 6908
M=D // 6909
@12 // 6910
D=A // 6911
@SP // 6912
AM=M+1 // 6913
A=A-1 // 6914
M=D // 6915
@24 // 6916
D=A // 6917
@SP // 6918
AM=M+1 // 6919
A=A-1 // 6920
M=D // 6921
@12 // 6922
D=A // 6923
@SP // 6924
AM=M+1 // 6925
A=A-1 // 6926
M=D // 6927
@6 // 6928
D=A // 6929
@SP // 6930
AM=M+1 // 6931
A=A-1 // 6932
M=D // 6933
@3 // 6934
D=A // 6935
@SP // 6936
AM=M+1 // 6937
A=A-1 // 6938
M=D // 6939
@SP // 6940
AM=M+1 // 6941
A=A-1 // 6942
M=0 // 6943
@SP // 6944
AM=M+1 // 6945
A=A-1 // 6946
M=0 // 6947
// call Output.create
@17 // 6948
D=A // 6949
@14 // 6950
M=D // 6951
@Output.create // 6952
D=A // 6953
@13 // 6954
M=D // 6955
@Output.initMap.ret.32 // 6956
D=A // 6957
@CALL // 6958
0;JMP // 6959
(Output.initMap.ret.32)
@SP // 6960
AM=M-1 // 6961
D=M // 6962
@5 // 6963
M=D // 6964

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 64")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 59")
//          arg[5]:
//              PushInstruction("constant 59")
//          arg[6]:
//              PushInstruction("constant 59")
//          arg[7]:
//              PushInstruction("constant 27")
//          arg[8]:
//              PushInstruction("constant 3")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=33}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@64 // 6965
D=A // 6966
@SP // 6967
AM=M+1 // 6968
A=A-1 // 6969
M=D // 6970
@30 // 6971
D=A // 6972
@SP // 6973
AM=M+1 // 6974
A=A-1 // 6975
M=D // 6976
@51 // 6977
D=A // 6978
@SP // 6979
AM=M+1 // 6980
A=A-1 // 6981
M=D // 6982
@51 // 6983
D=A // 6984
@SP // 6985
AM=M+1 // 6986
A=A-1 // 6987
M=D // 6988
@59 // 6989
D=A // 6990
@SP // 6991
AM=M+1 // 6992
A=A-1 // 6993
M=D // 6994
@59 // 6995
D=A // 6996
@SP // 6997
AM=M+1 // 6998
A=A-1 // 6999
M=D // 7000
@59 // 7001
D=A // 7002
@SP // 7003
AM=M+1 // 7004
A=A-1 // 7005
M=D // 7006
@27 // 7007
D=A // 7008
@SP // 7009
AM=M+1 // 7010
A=A-1 // 7011
M=D // 7012
@3 // 7013
D=A // 7014
@SP // 7015
AM=M+1 // 7016
A=A-1 // 7017
M=D // 7018
@30 // 7019
D=A // 7020
@SP // 7021
AM=M+1 // 7022
A=A-1 // 7023
M=D // 7024
@SP // 7025
AM=M+1 // 7026
A=A-1 // 7027
M=0 // 7028
@SP // 7029
AM=M+1 // 7030
A=A-1 // 7031
M=0 // 7032
// call Output.create
@17 // 7033
D=A // 7034
@14 // 7035
M=D // 7036
@Output.create // 7037
D=A // 7038
@13 // 7039
M=D // 7040
@Output.initMap.ret.33 // 7041
D=A // 7042
@CALL // 7043
0;JMP // 7044
(Output.initMap.ret.33)
@SP // 7045
AM=M-1 // 7046
D=M // 7047
@5 // 7048
M=D // 7049

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 63")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 24")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=34}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@63 // 7050
D=A // 7051
@SP // 7052
AM=M+1 // 7053
A=A-1 // 7054
M=D // 7055
@30 // 7056
D=A // 7057
@SP // 7058
AM=M+1 // 7059
A=A-1 // 7060
M=D // 7061
@51 // 7062
D=A // 7063
@SP // 7064
AM=M+1 // 7065
A=A-1 // 7066
M=D // 7067
@51 // 7068
D=A // 7069
@SP // 7070
AM=M+1 // 7071
A=A-1 // 7072
M=D // 7073
@24 // 7074
D=A // 7075
@SP // 7076
AM=M+1 // 7077
A=A-1 // 7078
M=D // 7079
@12 // 7080
D=A // 7081
@SP // 7082
AM=M+1 // 7083
A=A-1 // 7084
M=D // 7085
@12 // 7086
D=A // 7087
@SP // 7088
AM=M+1 // 7089
A=A-1 // 7090
M=D // 7091
@SP // 7092
AM=M+1 // 7093
A=A-1 // 7094
M=0 // 7095
@12 // 7096
D=A // 7097
@SP // 7098
AM=M+1 // 7099
A=A-1 // 7100
M=D // 7101
@12 // 7102
D=A // 7103
@SP // 7104
AM=M+1 // 7105
A=A-1 // 7106
M=D // 7107
@SP // 7108
AM=M+1 // 7109
A=A-1 // 7110
M=0 // 7111
@SP // 7112
AM=M+1 // 7113
A=A-1 // 7114
M=0 // 7115
// call Output.create
@17 // 7116
D=A // 7117
@14 // 7118
M=D // 7119
@Output.create // 7120
D=A // 7121
@13 // 7122
M=D // 7123
@Output.initMap.ret.34 // 7124
D=A // 7125
@CALL // 7126
0;JMP // 7127
(Output.initMap.ret.34)
@SP // 7128
AM=M-1 // 7129
D=M // 7130
@5 // 7131
M=D // 7132

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 65")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 30")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 63")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=35}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@65 // 7133
D=A // 7134
@SP // 7135
AM=M+1 // 7136
A=A-1 // 7137
M=D // 7138
@12 // 7139
D=A // 7140
@SP // 7141
AM=M+1 // 7142
A=A-1 // 7143
M=D // 7144
@30 // 7145
D=A // 7146
@SP // 7147
AM=M+1 // 7148
A=A-1 // 7149
M=D // 7150
@51 // 7151
D=A // 7152
@SP // 7153
AM=M+1 // 7154
A=A-1 // 7155
M=D // 7156
@51 // 7157
D=A // 7158
@SP // 7159
AM=M+1 // 7160
A=A-1 // 7161
M=D // 7162
@63 // 7163
D=A // 7164
@SP // 7165
AM=M+1 // 7166
A=A-1 // 7167
M=D // 7168
@51 // 7169
D=A // 7170
@SP // 7171
AM=M+1 // 7172
A=A-1 // 7173
M=D // 7174
@51 // 7175
D=A // 7176
@SP // 7177
AM=M+1 // 7178
A=A-1 // 7179
M=D // 7180
@51 // 7181
D=A // 7182
@SP // 7183
AM=M+1 // 7184
A=A-1 // 7185
M=D // 7186
@51 // 7187
D=A // 7188
@SP // 7189
AM=M+1 // 7190
A=A-1 // 7191
M=D // 7192
@SP // 7193
AM=M+1 // 7194
A=A-1 // 7195
M=0 // 7196
@SP // 7197
AM=M+1 // 7198
A=A-1 // 7199
M=0 // 7200
// call Output.create
@17 // 7201
D=A // 7202
@14 // 7203
M=D // 7204
@Output.create // 7205
D=A // 7206
@13 // 7207
M=D // 7208
@Output.initMap.ret.35 // 7209
D=A // 7210
@CALL // 7211
0;JMP // 7212
(Output.initMap.ret.35)
@SP // 7213
AM=M-1 // 7214
D=M // 7215
@5 // 7216
M=D // 7217

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 66")
//          arg[1]:
//              PushInstruction("constant 31")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 31")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 31")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=36}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@66 // 7218
D=A // 7219
@SP // 7220
AM=M+1 // 7221
A=A-1 // 7222
M=D // 7223
@31 // 7224
D=A // 7225
@SP // 7226
AM=M+1 // 7227
A=A-1 // 7228
M=D // 7229
@51 // 7230
D=A // 7231
@SP // 7232
AM=M+1 // 7233
A=A-1 // 7234
M=D // 7235
@51 // 7236
D=A // 7237
@SP // 7238
AM=M+1 // 7239
A=A-1 // 7240
M=D // 7241
@51 // 7242
D=A // 7243
@SP // 7244
AM=M+1 // 7245
A=A-1 // 7246
M=D // 7247
@31 // 7248
D=A // 7249
@SP // 7250
AM=M+1 // 7251
A=A-1 // 7252
M=D // 7253
@51 // 7254
D=A // 7255
@SP // 7256
AM=M+1 // 7257
A=A-1 // 7258
M=D // 7259
@51 // 7260
D=A // 7261
@SP // 7262
AM=M+1 // 7263
A=A-1 // 7264
M=D // 7265
@51 // 7266
D=A // 7267
@SP // 7268
AM=M+1 // 7269
A=A-1 // 7270
M=D // 7271
@31 // 7272
D=A // 7273
@SP // 7274
AM=M+1 // 7275
A=A-1 // 7276
M=D // 7277
@SP // 7278
AM=M+1 // 7279
A=A-1 // 7280
M=0 // 7281
@SP // 7282
AM=M+1 // 7283
A=A-1 // 7284
M=0 // 7285
// call Output.create
@17 // 7286
D=A // 7287
@14 // 7288
M=D // 7289
@Output.create // 7290
D=A // 7291
@13 // 7292
M=D // 7293
@Output.initMap.ret.36 // 7294
D=A // 7295
@CALL // 7296
0;JMP // 7297
(Output.initMap.ret.36)
@SP // 7298
AM=M-1 // 7299
D=M // 7300
@5 // 7301
M=D // 7302

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 67")
//          arg[1]:
//              PushInstruction("constant 28")
//          arg[2]:
//              PushInstruction("constant 54")
//          arg[3]:
//              PushInstruction("constant 35")
//          arg[4]:
//              PushInstruction("constant 3")
//          arg[5]:
//              PushInstruction("constant 3")
//          arg[6]:
//              PushInstruction("constant 3")
//          arg[7]:
//              PushInstruction("constant 35")
//          arg[8]:
//              PushInstruction("constant 54")
//          arg[9]:
//              PushInstruction("constant 28")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=37}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@67 // 7303
D=A // 7304
@SP // 7305
AM=M+1 // 7306
A=A-1 // 7307
M=D // 7308
@28 // 7309
D=A // 7310
@SP // 7311
AM=M+1 // 7312
A=A-1 // 7313
M=D // 7314
@54 // 7315
D=A // 7316
@SP // 7317
AM=M+1 // 7318
A=A-1 // 7319
M=D // 7320
@35 // 7321
D=A // 7322
@SP // 7323
AM=M+1 // 7324
A=A-1 // 7325
M=D // 7326
@3 // 7327
D=A // 7328
@SP // 7329
AM=M+1 // 7330
A=A-1 // 7331
M=D // 7332
@3 // 7333
D=A // 7334
@SP // 7335
AM=M+1 // 7336
A=A-1 // 7337
M=D // 7338
@3 // 7339
D=A // 7340
@SP // 7341
AM=M+1 // 7342
A=A-1 // 7343
M=D // 7344
@35 // 7345
D=A // 7346
@SP // 7347
AM=M+1 // 7348
A=A-1 // 7349
M=D // 7350
@54 // 7351
D=A // 7352
@SP // 7353
AM=M+1 // 7354
A=A-1 // 7355
M=D // 7356
@28 // 7357
D=A // 7358
@SP // 7359
AM=M+1 // 7360
A=A-1 // 7361
M=D // 7362
@SP // 7363
AM=M+1 // 7364
A=A-1 // 7365
M=0 // 7366
@SP // 7367
AM=M+1 // 7368
A=A-1 // 7369
M=0 // 7370
// call Output.create
@17 // 7371
D=A // 7372
@14 // 7373
M=D // 7374
@Output.create // 7375
D=A // 7376
@13 // 7377
M=D // 7378
@Output.initMap.ret.37 // 7379
D=A // 7380
@CALL // 7381
0;JMP // 7382
(Output.initMap.ret.37)
@SP // 7383
AM=M-1 // 7384
D=M // 7385
@5 // 7386
M=D // 7387

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 68")
//          arg[1]:
//              PushInstruction("constant 15")
//          arg[2]:
//              PushInstruction("constant 27")
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
//              PushInstruction("constant 27")
//          arg[9]:
//              PushInstruction("constant 15")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=38}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@68 // 7388
D=A // 7389
@SP // 7390
AM=M+1 // 7391
A=A-1 // 7392
M=D // 7393
@15 // 7394
D=A // 7395
@SP // 7396
AM=M+1 // 7397
A=A-1 // 7398
M=D // 7399
@27 // 7400
D=A // 7401
@SP // 7402
AM=M+1 // 7403
A=A-1 // 7404
M=D // 7405
@51 // 7406
D=A // 7407
@SP // 7408
AM=M+1 // 7409
A=A-1 // 7410
M=D // 7411
@51 // 7412
D=A // 7413
@SP // 7414
AM=M+1 // 7415
A=A-1 // 7416
M=D // 7417
@51 // 7418
D=A // 7419
@SP // 7420
AM=M+1 // 7421
A=A-1 // 7422
M=D // 7423
@51 // 7424
D=A // 7425
@SP // 7426
AM=M+1 // 7427
A=A-1 // 7428
M=D // 7429
@51 // 7430
D=A // 7431
@SP // 7432
AM=M+1 // 7433
A=A-1 // 7434
M=D // 7435
@27 // 7436
D=A // 7437
@SP // 7438
AM=M+1 // 7439
A=A-1 // 7440
M=D // 7441
@15 // 7442
D=A // 7443
@SP // 7444
AM=M+1 // 7445
A=A-1 // 7446
M=D // 7447
@SP // 7448
AM=M+1 // 7449
A=A-1 // 7450
M=0 // 7451
@SP // 7452
AM=M+1 // 7453
A=A-1 // 7454
M=0 // 7455
// call Output.create
@17 // 7456
D=A // 7457
@14 // 7458
M=D // 7459
@Output.create // 7460
D=A // 7461
@13 // 7462
M=D // 7463
@Output.initMap.ret.38 // 7464
D=A // 7465
@CALL // 7466
0;JMP // 7467
(Output.initMap.ret.38)
@SP // 7468
AM=M-1 // 7469
D=M // 7470
@5 // 7471
M=D // 7472

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 69")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 35")
//          arg[4]:
//              PushInstruction("constant 11")
//          arg[5]:
//              PushInstruction("constant 15")
//          arg[6]:
//              PushInstruction("constant 11")
//          arg[7]:
//              PushInstruction("constant 35")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=39}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@69 // 7473
D=A // 7474
@SP // 7475
AM=M+1 // 7476
A=A-1 // 7477
M=D // 7478
@63 // 7479
D=A // 7480
@SP // 7481
AM=M+1 // 7482
A=A-1 // 7483
M=D // 7484
@51 // 7485
D=A // 7486
@SP // 7487
AM=M+1 // 7488
A=A-1 // 7489
M=D // 7490
@35 // 7491
D=A // 7492
@SP // 7493
AM=M+1 // 7494
A=A-1 // 7495
M=D // 7496
@11 // 7497
D=A // 7498
@SP // 7499
AM=M+1 // 7500
A=A-1 // 7501
M=D // 7502
@15 // 7503
D=A // 7504
@SP // 7505
AM=M+1 // 7506
A=A-1 // 7507
M=D // 7508
@11 // 7509
D=A // 7510
@SP // 7511
AM=M+1 // 7512
A=A-1 // 7513
M=D // 7514
@35 // 7515
D=A // 7516
@SP // 7517
AM=M+1 // 7518
A=A-1 // 7519
M=D // 7520
@51 // 7521
D=A // 7522
@SP // 7523
AM=M+1 // 7524
A=A-1 // 7525
M=D // 7526
@63 // 7527
D=A // 7528
@SP // 7529
AM=M+1 // 7530
A=A-1 // 7531
M=D // 7532
@SP // 7533
AM=M+1 // 7534
A=A-1 // 7535
M=0 // 7536
@SP // 7537
AM=M+1 // 7538
A=A-1 // 7539
M=0 // 7540
// call Output.create
@17 // 7541
D=A // 7542
@14 // 7543
M=D // 7544
@Output.create // 7545
D=A // 7546
@13 // 7547
M=D // 7548
@Output.initMap.ret.39 // 7549
D=A // 7550
@CALL // 7551
0;JMP // 7552
(Output.initMap.ret.39)
@SP // 7553
AM=M-1 // 7554
D=M // 7555
@5 // 7556
M=D // 7557

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 70")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 35")
//          arg[4]:
//              PushInstruction("constant 11")
//          arg[5]:
//              PushInstruction("constant 15")
//          arg[6]:
//              PushInstruction("constant 11")
//          arg[7]:
//              PushInstruction("constant 3")
//          arg[8]:
//              PushInstruction("constant 3")
//          arg[9]:
//              PushInstruction("constant 3")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=40}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@70 // 7558
D=A // 7559
@SP // 7560
AM=M+1 // 7561
A=A-1 // 7562
M=D // 7563
@63 // 7564
D=A // 7565
@SP // 7566
AM=M+1 // 7567
A=A-1 // 7568
M=D // 7569
@51 // 7570
D=A // 7571
@SP // 7572
AM=M+1 // 7573
A=A-1 // 7574
M=D // 7575
@35 // 7576
D=A // 7577
@SP // 7578
AM=M+1 // 7579
A=A-1 // 7580
M=D // 7581
@11 // 7582
D=A // 7583
@SP // 7584
AM=M+1 // 7585
A=A-1 // 7586
M=D // 7587
@15 // 7588
D=A // 7589
@SP // 7590
AM=M+1 // 7591
A=A-1 // 7592
M=D // 7593
@11 // 7594
D=A // 7595
@SP // 7596
AM=M+1 // 7597
A=A-1 // 7598
M=D // 7599
@3 // 7600
D=A // 7601
@SP // 7602
AM=M+1 // 7603
A=A-1 // 7604
M=D // 7605
@3 // 7606
D=A // 7607
@SP // 7608
AM=M+1 // 7609
A=A-1 // 7610
M=D // 7611
@3 // 7612
D=A // 7613
@SP // 7614
AM=M+1 // 7615
A=A-1 // 7616
M=D // 7617
@SP // 7618
AM=M+1 // 7619
A=A-1 // 7620
M=0 // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=0 // 7625
// call Output.create
@17 // 7626
D=A // 7627
@14 // 7628
M=D // 7629
@Output.create // 7630
D=A // 7631
@13 // 7632
M=D // 7633
@Output.initMap.ret.40 // 7634
D=A // 7635
@CALL // 7636
0;JMP // 7637
(Output.initMap.ret.40)
@SP // 7638
AM=M-1 // 7639
D=M // 7640
@5 // 7641
M=D // 7642

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 71")
//          arg[1]:
//              PushInstruction("constant 28")
//          arg[2]:
//              PushInstruction("constant 54")
//          arg[3]:
//              PushInstruction("constant 35")
//          arg[4]:
//              PushInstruction("constant 3")
//          arg[5]:
//              PushInstruction("constant 59")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 54")
//          arg[9]:
//              PushInstruction("constant 44")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=41}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@71 // 7643
D=A // 7644
@SP // 7645
AM=M+1 // 7646
A=A-1 // 7647
M=D // 7648
@28 // 7649
D=A // 7650
@SP // 7651
AM=M+1 // 7652
A=A-1 // 7653
M=D // 7654
@54 // 7655
D=A // 7656
@SP // 7657
AM=M+1 // 7658
A=A-1 // 7659
M=D // 7660
@35 // 7661
D=A // 7662
@SP // 7663
AM=M+1 // 7664
A=A-1 // 7665
M=D // 7666
@3 // 7667
D=A // 7668
@SP // 7669
AM=M+1 // 7670
A=A-1 // 7671
M=D // 7672
@59 // 7673
D=A // 7674
@SP // 7675
AM=M+1 // 7676
A=A-1 // 7677
M=D // 7678
@51 // 7679
D=A // 7680
@SP // 7681
AM=M+1 // 7682
A=A-1 // 7683
M=D // 7684
@51 // 7685
D=A // 7686
@SP // 7687
AM=M+1 // 7688
A=A-1 // 7689
M=D // 7690
@54 // 7691
D=A // 7692
@SP // 7693
AM=M+1 // 7694
A=A-1 // 7695
M=D // 7696
@44 // 7697
D=A // 7698
@SP // 7699
AM=M+1 // 7700
A=A-1 // 7701
M=D // 7702
@SP // 7703
AM=M+1 // 7704
A=A-1 // 7705
M=0 // 7706
@SP // 7707
AM=M+1 // 7708
A=A-1 // 7709
M=0 // 7710
// call Output.create
@17 // 7711
D=A // 7712
@14 // 7713
M=D // 7714
@Output.create // 7715
D=A // 7716
@13 // 7717
M=D // 7718
@Output.initMap.ret.41 // 7719
D=A // 7720
@CALL // 7721
0;JMP // 7722
(Output.initMap.ret.41)
@SP // 7723
AM=M-1 // 7724
D=M // 7725
@5 // 7726
M=D // 7727

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 72")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 63")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=42}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@72 // 7728
D=A // 7729
@SP // 7730
AM=M+1 // 7731
A=A-1 // 7732
M=D // 7733
@51 // 7734
D=A // 7735
@SP // 7736
AM=M+1 // 7737
A=A-1 // 7738
M=D // 7739
@51 // 7740
D=A // 7741
@SP // 7742
AM=M+1 // 7743
A=A-1 // 7744
M=D // 7745
@51 // 7746
D=A // 7747
@SP // 7748
AM=M+1 // 7749
A=A-1 // 7750
M=D // 7751
@51 // 7752
D=A // 7753
@SP // 7754
AM=M+1 // 7755
A=A-1 // 7756
M=D // 7757
@63 // 7758
D=A // 7759
@SP // 7760
AM=M+1 // 7761
A=A-1 // 7762
M=D // 7763
@51 // 7764
D=A // 7765
@SP // 7766
AM=M+1 // 7767
A=A-1 // 7768
M=D // 7769
@51 // 7770
D=A // 7771
@SP // 7772
AM=M+1 // 7773
A=A-1 // 7774
M=D // 7775
@51 // 7776
D=A // 7777
@SP // 7778
AM=M+1 // 7779
A=A-1 // 7780
M=D // 7781
@51 // 7782
D=A // 7783
@SP // 7784
AM=M+1 // 7785
A=A-1 // 7786
M=D // 7787
@SP // 7788
AM=M+1 // 7789
A=A-1 // 7790
M=0 // 7791
@SP // 7792
AM=M+1 // 7793
A=A-1 // 7794
M=0 // 7795
// call Output.create
@17 // 7796
D=A // 7797
@14 // 7798
M=D // 7799
@Output.create // 7800
D=A // 7801
@13 // 7802
M=D // 7803
@Output.initMap.ret.42 // 7804
D=A // 7805
@CALL // 7806
0;JMP // 7807
(Output.initMap.ret.42)
@SP // 7808
AM=M-1 // 7809
D=M // 7810
@5 // 7811
M=D // 7812

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 73")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 12")
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
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=43}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@73 // 7813
D=A // 7814
@SP // 7815
AM=M+1 // 7816
A=A-1 // 7817
M=D // 7818
@30 // 7819
D=A // 7820
@SP // 7821
AM=M+1 // 7822
A=A-1 // 7823
M=D // 7824
@12 // 7825
D=A // 7826
@SP // 7827
AM=M+1 // 7828
A=A-1 // 7829
M=D // 7830
@12 // 7831
D=A // 7832
@SP // 7833
AM=M+1 // 7834
A=A-1 // 7835
M=D // 7836
@12 // 7837
D=A // 7838
@SP // 7839
AM=M+1 // 7840
A=A-1 // 7841
M=D // 7842
@12 // 7843
D=A // 7844
@SP // 7845
AM=M+1 // 7846
A=A-1 // 7847
M=D // 7848
@12 // 7849
D=A // 7850
@SP // 7851
AM=M+1 // 7852
A=A-1 // 7853
M=D // 7854
@12 // 7855
D=A // 7856
@SP // 7857
AM=M+1 // 7858
A=A-1 // 7859
M=D // 7860
@12 // 7861
D=A // 7862
@SP // 7863
AM=M+1 // 7864
A=A-1 // 7865
M=D // 7866
@30 // 7867
D=A // 7868
@SP // 7869
AM=M+1 // 7870
A=A-1 // 7871
M=D // 7872
@SP // 7873
AM=M+1 // 7874
A=A-1 // 7875
M=0 // 7876
@SP // 7877
AM=M+1 // 7878
A=A-1 // 7879
M=0 // 7880
// call Output.create
@17 // 7881
D=A // 7882
@14 // 7883
M=D // 7884
@Output.create // 7885
D=A // 7886
@13 // 7887
M=D // 7888
@Output.initMap.ret.43 // 7889
D=A // 7890
@CALL // 7891
0;JMP // 7892
(Output.initMap.ret.43)
@SP // 7893
AM=M-1 // 7894
D=M // 7895
@5 // 7896
M=D // 7897

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 74")
//          arg[1]:
//              PushInstruction("constant 60")
//          arg[2]:
//              PushInstruction("constant 24")
//          arg[3]:
//              PushInstruction("constant 24")
//          arg[4]:
//              PushInstruction("constant 24")
//          arg[5]:
//              PushInstruction("constant 24")
//          arg[6]:
//              PushInstruction("constant 24")
//          arg[7]:
//              PushInstruction("constant 27")
//          arg[8]:
//              PushInstruction("constant 27")
//          arg[9]:
//              PushInstruction("constant 14")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=44}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@74 // 7898
D=A // 7899
@SP // 7900
AM=M+1 // 7901
A=A-1 // 7902
M=D // 7903
@60 // 7904
D=A // 7905
@SP // 7906
AM=M+1 // 7907
A=A-1 // 7908
M=D // 7909
@24 // 7910
D=A // 7911
@SP // 7912
AM=M+1 // 7913
A=A-1 // 7914
M=D // 7915
@24 // 7916
D=A // 7917
@SP // 7918
AM=M+1 // 7919
A=A-1 // 7920
M=D // 7921
@24 // 7922
D=A // 7923
@SP // 7924
AM=M+1 // 7925
A=A-1 // 7926
M=D // 7927
@24 // 7928
D=A // 7929
@SP // 7930
AM=M+1 // 7931
A=A-1 // 7932
M=D // 7933
@24 // 7934
D=A // 7935
@SP // 7936
AM=M+1 // 7937
A=A-1 // 7938
M=D // 7939
@27 // 7940
D=A // 7941
@SP // 7942
AM=M+1 // 7943
A=A-1 // 7944
M=D // 7945
@27 // 7946
D=A // 7947
@SP // 7948
AM=M+1 // 7949
A=A-1 // 7950
M=D // 7951
@14 // 7952
D=A // 7953
@SP // 7954
AM=M+1 // 7955
A=A-1 // 7956
M=D // 7957
@SP // 7958
AM=M+1 // 7959
A=A-1 // 7960
M=0 // 7961
@SP // 7962
AM=M+1 // 7963
A=A-1 // 7964
M=0 // 7965
// call Output.create
@17 // 7966
D=A // 7967
@14 // 7968
M=D // 7969
@Output.create // 7970
D=A // 7971
@13 // 7972
M=D // 7973
@Output.initMap.ret.44 // 7974
D=A // 7975
@CALL // 7976
0;JMP // 7977
(Output.initMap.ret.44)
@SP // 7978
AM=M-1 // 7979
D=M // 7980
@5 // 7981
M=D // 7982

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 75")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 27")
//          arg[5]:
//              PushInstruction("constant 15")
//          arg[6]:
//              PushInstruction("constant 27")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=45}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@75 // 7983
D=A // 7984
@SP // 7985
AM=M+1 // 7986
A=A-1 // 7987
M=D // 7988
@51 // 7989
D=A // 7990
@SP // 7991
AM=M+1 // 7992
A=A-1 // 7993
M=D // 7994
@51 // 7995
D=A // 7996
@SP // 7997
AM=M+1 // 7998
A=A-1 // 7999
M=D // 8000
@51 // 8001
D=A // 8002
@SP // 8003
AM=M+1 // 8004
A=A-1 // 8005
M=D // 8006
@27 // 8007
D=A // 8008
@SP // 8009
AM=M+1 // 8010
A=A-1 // 8011
M=D // 8012
@15 // 8013
D=A // 8014
@SP // 8015
AM=M+1 // 8016
A=A-1 // 8017
M=D // 8018
@27 // 8019
D=A // 8020
@SP // 8021
AM=M+1 // 8022
A=A-1 // 8023
M=D // 8024
@51 // 8025
D=A // 8026
@SP // 8027
AM=M+1 // 8028
A=A-1 // 8029
M=D // 8030
@51 // 8031
D=A // 8032
@SP // 8033
AM=M+1 // 8034
A=A-1 // 8035
M=D // 8036
@51 // 8037
D=A // 8038
@SP // 8039
AM=M+1 // 8040
A=A-1 // 8041
M=D // 8042
@SP // 8043
AM=M+1 // 8044
A=A-1 // 8045
M=0 // 8046
@SP // 8047
AM=M+1 // 8048
A=A-1 // 8049
M=0 // 8050
// call Output.create
@17 // 8051
D=A // 8052
@14 // 8053
M=D // 8054
@Output.create // 8055
D=A // 8056
@13 // 8057
M=D // 8058
@Output.initMap.ret.45 // 8059
D=A // 8060
@CALL // 8061
0;JMP // 8062
(Output.initMap.ret.45)
@SP // 8063
AM=M-1 // 8064
D=M // 8065
@5 // 8066
M=D // 8067

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 76")
//          arg[1]:
//              PushInstruction("constant 3")
//          arg[2]:
//              PushInstruction("constant 3")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 3")
//          arg[5]:
//              PushInstruction("constant 3")
//          arg[6]:
//              PushInstruction("constant 3")
//          arg[7]:
//              PushInstruction("constant 35")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=46}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@76 // 8068
D=A // 8069
@SP // 8070
AM=M+1 // 8071
A=A-1 // 8072
M=D // 8073
@3 // 8074
D=A // 8075
@SP // 8076
AM=M+1 // 8077
A=A-1 // 8078
M=D // 8079
@3 // 8080
D=A // 8081
@SP // 8082
AM=M+1 // 8083
A=A-1 // 8084
M=D // 8085
@3 // 8086
D=A // 8087
@SP // 8088
AM=M+1 // 8089
A=A-1 // 8090
M=D // 8091
@3 // 8092
D=A // 8093
@SP // 8094
AM=M+1 // 8095
A=A-1 // 8096
M=D // 8097
@3 // 8098
D=A // 8099
@SP // 8100
AM=M+1 // 8101
A=A-1 // 8102
M=D // 8103
@3 // 8104
D=A // 8105
@SP // 8106
AM=M+1 // 8107
A=A-1 // 8108
M=D // 8109
@35 // 8110
D=A // 8111
@SP // 8112
AM=M+1 // 8113
A=A-1 // 8114
M=D // 8115
@51 // 8116
D=A // 8117
@SP // 8118
AM=M+1 // 8119
A=A-1 // 8120
M=D // 8121
@63 // 8122
D=A // 8123
@SP // 8124
AM=M+1 // 8125
A=A-1 // 8126
M=D // 8127
@SP // 8128
AM=M+1 // 8129
A=A-1 // 8130
M=0 // 8131
@SP // 8132
AM=M+1 // 8133
A=A-1 // 8134
M=0 // 8135
// call Output.create
@17 // 8136
D=A // 8137
@14 // 8138
M=D // 8139
@Output.create // 8140
D=A // 8141
@13 // 8142
M=D // 8143
@Output.initMap.ret.46 // 8144
D=A // 8145
@CALL // 8146
0;JMP // 8147
(Output.initMap.ret.46)
@SP // 8148
AM=M-1 // 8149
D=M // 8150
@5 // 8151
M=D // 8152

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 77")
//          arg[1]:
//              PushInstruction("constant 33")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 63")
//          arg[4]:
//              PushInstruction("constant 63")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=47}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@77 // 8153
D=A // 8154
@SP // 8155
AM=M+1 // 8156
A=A-1 // 8157
M=D // 8158
@33 // 8159
D=A // 8160
@SP // 8161
AM=M+1 // 8162
A=A-1 // 8163
M=D // 8164
@51 // 8165
D=A // 8166
@SP // 8167
AM=M+1 // 8168
A=A-1 // 8169
M=D // 8170
@63 // 8171
D=A // 8172
@SP // 8173
AM=M+1 // 8174
A=A-1 // 8175
M=D // 8176
@63 // 8177
D=A // 8178
@SP // 8179
AM=M+1 // 8180
A=A-1 // 8181
M=D // 8182
@51 // 8183
D=A // 8184
@SP // 8185
AM=M+1 // 8186
A=A-1 // 8187
M=D // 8188
@51 // 8189
D=A // 8190
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=D // 8194
@51 // 8195
D=A // 8196
@SP // 8197
AM=M+1 // 8198
A=A-1 // 8199
M=D // 8200
@51 // 8201
D=A // 8202
@SP // 8203
AM=M+1 // 8204
A=A-1 // 8205
M=D // 8206
@51 // 8207
D=A // 8208
@SP // 8209
AM=M+1 // 8210
A=A-1 // 8211
M=D // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=0 // 8216
@SP // 8217
AM=M+1 // 8218
A=A-1 // 8219
M=0 // 8220
// call Output.create
@17 // 8221
D=A // 8222
@14 // 8223
M=D // 8224
@Output.create // 8225
D=A // 8226
@13 // 8227
M=D // 8228
@Output.initMap.ret.47 // 8229
D=A // 8230
@CALL // 8231
0;JMP // 8232
(Output.initMap.ret.47)
@SP // 8233
AM=M-1 // 8234
D=M // 8235
@5 // 8236
M=D // 8237

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 78")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 55")
//          arg[4]:
//              PushInstruction("constant 55")
//          arg[5]:
//              PushInstruction("constant 63")
//          arg[6]:
//              PushInstruction("constant 59")
//          arg[7]:
//              PushInstruction("constant 59")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=48}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@78 // 8238
D=A // 8239
@SP // 8240
AM=M+1 // 8241
A=A-1 // 8242
M=D // 8243
@51 // 8244
D=A // 8245
@SP // 8246
AM=M+1 // 8247
A=A-1 // 8248
M=D // 8249
@51 // 8250
D=A // 8251
@SP // 8252
AM=M+1 // 8253
A=A-1 // 8254
M=D // 8255
@55 // 8256
D=A // 8257
@SP // 8258
AM=M+1 // 8259
A=A-1 // 8260
M=D // 8261
@55 // 8262
D=A // 8263
@SP // 8264
AM=M+1 // 8265
A=A-1 // 8266
M=D // 8267
@63 // 8268
D=A // 8269
@SP // 8270
AM=M+1 // 8271
A=A-1 // 8272
M=D // 8273
@59 // 8274
D=A // 8275
@SP // 8276
AM=M+1 // 8277
A=A-1 // 8278
M=D // 8279
@59 // 8280
D=A // 8281
@SP // 8282
AM=M+1 // 8283
A=A-1 // 8284
M=D // 8285
@51 // 8286
D=A // 8287
@SP // 8288
AM=M+1 // 8289
A=A-1 // 8290
M=D // 8291
@51 // 8292
D=A // 8293
@SP // 8294
AM=M+1 // 8295
A=A-1 // 8296
M=D // 8297
@SP // 8298
AM=M+1 // 8299
A=A-1 // 8300
M=0 // 8301
@SP // 8302
AM=M+1 // 8303
A=A-1 // 8304
M=0 // 8305
// call Output.create
@17 // 8306
D=A // 8307
@14 // 8308
M=D // 8309
@Output.create // 8310
D=A // 8311
@13 // 8312
M=D // 8313
@Output.initMap.ret.48 // 8314
D=A // 8315
@CALL // 8316
0;JMP // 8317
(Output.initMap.ret.48)
@SP // 8318
AM=M-1 // 8319
D=M // 8320
@5 // 8321
M=D // 8322

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 79")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
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
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=49}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@79 // 8323
D=A // 8324
@SP // 8325
AM=M+1 // 8326
A=A-1 // 8327
M=D // 8328
@30 // 8329
D=A // 8330
@SP // 8331
AM=M+1 // 8332
A=A-1 // 8333
M=D // 8334
@51 // 8335
D=A // 8336
@SP // 8337
AM=M+1 // 8338
A=A-1 // 8339
M=D // 8340
@51 // 8341
D=A // 8342
@SP // 8343
AM=M+1 // 8344
A=A-1 // 8345
M=D // 8346
@51 // 8347
D=A // 8348
@SP // 8349
AM=M+1 // 8350
A=A-1 // 8351
M=D // 8352
@51 // 8353
D=A // 8354
@SP // 8355
AM=M+1 // 8356
A=A-1 // 8357
M=D // 8358
@51 // 8359
D=A // 8360
@SP // 8361
AM=M+1 // 8362
A=A-1 // 8363
M=D // 8364
@51 // 8365
D=A // 8366
@SP // 8367
AM=M+1 // 8368
A=A-1 // 8369
M=D // 8370
@51 // 8371
D=A // 8372
@SP // 8373
AM=M+1 // 8374
A=A-1 // 8375
M=D // 8376
@30 // 8377
D=A // 8378
@SP // 8379
AM=M+1 // 8380
A=A-1 // 8381
M=D // 8382
@SP // 8383
AM=M+1 // 8384
A=A-1 // 8385
M=0 // 8386
@SP // 8387
AM=M+1 // 8388
A=A-1 // 8389
M=0 // 8390
// call Output.create
@17 // 8391
D=A // 8392
@14 // 8393
M=D // 8394
@Output.create // 8395
D=A // 8396
@13 // 8397
M=D // 8398
@Output.initMap.ret.49 // 8399
D=A // 8400
@CALL // 8401
0;JMP // 8402
(Output.initMap.ret.49)
@SP // 8403
AM=M-1 // 8404
D=M // 8405
@5 // 8406
M=D // 8407

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 80")
//          arg[1]:
//              PushInstruction("constant 31")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 31")
//          arg[6]:
//              PushInstruction("constant 3")
//          arg[7]:
//              PushInstruction("constant 3")
//          arg[8]:
//              PushInstruction("constant 3")
//          arg[9]:
//              PushInstruction("constant 3")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=50}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@80 // 8408
D=A // 8409
@SP // 8410
AM=M+1 // 8411
A=A-1 // 8412
M=D // 8413
@31 // 8414
D=A // 8415
@SP // 8416
AM=M+1 // 8417
A=A-1 // 8418
M=D // 8419
@51 // 8420
D=A // 8421
@SP // 8422
AM=M+1 // 8423
A=A-1 // 8424
M=D // 8425
@51 // 8426
D=A // 8427
@SP // 8428
AM=M+1 // 8429
A=A-1 // 8430
M=D // 8431
@51 // 8432
D=A // 8433
@SP // 8434
AM=M+1 // 8435
A=A-1 // 8436
M=D // 8437
@31 // 8438
D=A // 8439
@SP // 8440
AM=M+1 // 8441
A=A-1 // 8442
M=D // 8443
@3 // 8444
D=A // 8445
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=D // 8449
@3 // 8450
D=A // 8451
@SP // 8452
AM=M+1 // 8453
A=A-1 // 8454
M=D // 8455
@3 // 8456
D=A // 8457
@SP // 8458
AM=M+1 // 8459
A=A-1 // 8460
M=D // 8461
@3 // 8462
D=A // 8463
@SP // 8464
AM=M+1 // 8465
A=A-1 // 8466
M=D // 8467
@SP // 8468
AM=M+1 // 8469
A=A-1 // 8470
M=0 // 8471
@SP // 8472
AM=M+1 // 8473
A=A-1 // 8474
M=0 // 8475
// call Output.create
@17 // 8476
D=A // 8477
@14 // 8478
M=D // 8479
@Output.create // 8480
D=A // 8481
@13 // 8482
M=D // 8483
@Output.initMap.ret.50 // 8484
D=A // 8485
@CALL // 8486
0;JMP // 8487
(Output.initMap.ret.50)
@SP // 8488
AM=M-1 // 8489
D=M // 8490
@5 // 8491
M=D // 8492

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 81")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 63")
//          arg[8]:
//              PushInstruction("constant 59")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 48")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=51}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@81 // 8493
D=A // 8494
@SP // 8495
AM=M+1 // 8496
A=A-1 // 8497
M=D // 8498
@30 // 8499
D=A // 8500
@SP // 8501
AM=M+1 // 8502
A=A-1 // 8503
M=D // 8504
@51 // 8505
D=A // 8506
@SP // 8507
AM=M+1 // 8508
A=A-1 // 8509
M=D // 8510
@51 // 8511
D=A // 8512
@SP // 8513
AM=M+1 // 8514
A=A-1 // 8515
M=D // 8516
@51 // 8517
D=A // 8518
@SP // 8519
AM=M+1 // 8520
A=A-1 // 8521
M=D // 8522
@51 // 8523
D=A // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=D // 8528
@51 // 8529
D=A // 8530
@SP // 8531
AM=M+1 // 8532
A=A-1 // 8533
M=D // 8534
@63 // 8535
D=A // 8536
@SP // 8537
AM=M+1 // 8538
A=A-1 // 8539
M=D // 8540
@59 // 8541
D=A // 8542
@SP // 8543
AM=M+1 // 8544
A=A-1 // 8545
M=D // 8546
@30 // 8547
D=A // 8548
@SP // 8549
AM=M+1 // 8550
A=A-1 // 8551
M=D // 8552
@48 // 8553
D=A // 8554
@SP // 8555
AM=M+1 // 8556
A=A-1 // 8557
M=D // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=0 // 8562
// call Output.create
@17 // 8563
D=A // 8564
@14 // 8565
M=D // 8566
@Output.create // 8567
D=A // 8568
@13 // 8569
M=D // 8570
@Output.initMap.ret.51 // 8571
D=A // 8572
@CALL // 8573
0;JMP // 8574
(Output.initMap.ret.51)
@SP // 8575
AM=M-1 // 8576
D=M // 8577
@5 // 8578
M=D // 8579

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 82")
//          arg[1]:
//              PushInstruction("constant 31")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 31")
//          arg[6]:
//              PushInstruction("constant 27")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=52}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@82 // 8580
D=A // 8581
@SP // 8582
AM=M+1 // 8583
A=A-1 // 8584
M=D // 8585
@31 // 8586
D=A // 8587
@SP // 8588
AM=M+1 // 8589
A=A-1 // 8590
M=D // 8591
@51 // 8592
D=A // 8593
@SP // 8594
AM=M+1 // 8595
A=A-1 // 8596
M=D // 8597
@51 // 8598
D=A // 8599
@SP // 8600
AM=M+1 // 8601
A=A-1 // 8602
M=D // 8603
@51 // 8604
D=A // 8605
@SP // 8606
AM=M+1 // 8607
A=A-1 // 8608
M=D // 8609
@31 // 8610
D=A // 8611
@SP // 8612
AM=M+1 // 8613
A=A-1 // 8614
M=D // 8615
@27 // 8616
D=A // 8617
@SP // 8618
AM=M+1 // 8619
A=A-1 // 8620
M=D // 8621
@51 // 8622
D=A // 8623
@SP // 8624
AM=M+1 // 8625
A=A-1 // 8626
M=D // 8627
@51 // 8628
D=A // 8629
@SP // 8630
AM=M+1 // 8631
A=A-1 // 8632
M=D // 8633
@51 // 8634
D=A // 8635
@SP // 8636
AM=M+1 // 8637
A=A-1 // 8638
M=D // 8639
@SP // 8640
AM=M+1 // 8641
A=A-1 // 8642
M=0 // 8643
@SP // 8644
AM=M+1 // 8645
A=A-1 // 8646
M=0 // 8647
// call Output.create
@17 // 8648
D=A // 8649
@14 // 8650
M=D // 8651
@Output.create // 8652
D=A // 8653
@13 // 8654
M=D // 8655
@Output.initMap.ret.52 // 8656
D=A // 8657
@CALL // 8658
0;JMP // 8659
(Output.initMap.ret.52)
@SP // 8660
AM=M-1 // 8661
D=M // 8662
@5 // 8663
M=D // 8664

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 83")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 6")
//          arg[5]:
//              PushInstruction("constant 28")
//          arg[6]:
//              PushInstruction("constant 48")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=53}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@83 // 8665
D=A // 8666
@SP // 8667
AM=M+1 // 8668
A=A-1 // 8669
M=D // 8670
@30 // 8671
D=A // 8672
@SP // 8673
AM=M+1 // 8674
A=A-1 // 8675
M=D // 8676
@51 // 8677
D=A // 8678
@SP // 8679
AM=M+1 // 8680
A=A-1 // 8681
M=D // 8682
@51 // 8683
D=A // 8684
@SP // 8685
AM=M+1 // 8686
A=A-1 // 8687
M=D // 8688
@6 // 8689
D=A // 8690
@SP // 8691
AM=M+1 // 8692
A=A-1 // 8693
M=D // 8694
@28 // 8695
D=A // 8696
@SP // 8697
AM=M+1 // 8698
A=A-1 // 8699
M=D // 8700
@48 // 8701
D=A // 8702
@SP // 8703
AM=M+1 // 8704
A=A-1 // 8705
M=D // 8706
@51 // 8707
D=A // 8708
@SP // 8709
AM=M+1 // 8710
A=A-1 // 8711
M=D // 8712
@51 // 8713
D=A // 8714
@SP // 8715
AM=M+1 // 8716
A=A-1 // 8717
M=D // 8718
@30 // 8719
D=A // 8720
@SP // 8721
AM=M+1 // 8722
A=A-1 // 8723
M=D // 8724
@SP // 8725
AM=M+1 // 8726
A=A-1 // 8727
M=0 // 8728
@SP // 8729
AM=M+1 // 8730
A=A-1 // 8731
M=0 // 8732
// call Output.create
@17 // 8733
D=A // 8734
@14 // 8735
M=D // 8736
@Output.create // 8737
D=A // 8738
@13 // 8739
M=D // 8740
@Output.initMap.ret.53 // 8741
D=A // 8742
@CALL // 8743
0;JMP // 8744
(Output.initMap.ret.53)
@SP // 8745
AM=M-1 // 8746
D=M // 8747
@5 // 8748
M=D // 8749

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 84")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 63")
//          arg[3]:
//              PushInstruction("constant 45")
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
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=54}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@84 // 8750
D=A // 8751
@SP // 8752
AM=M+1 // 8753
A=A-1 // 8754
M=D // 8755
@63 // 8756
D=A // 8757
@SP // 8758
AM=M+1 // 8759
A=A-1 // 8760
M=D // 8761
@63 // 8762
D=A // 8763
@SP // 8764
AM=M+1 // 8765
A=A-1 // 8766
M=D // 8767
@45 // 8768
D=A // 8769
@SP // 8770
AM=M+1 // 8771
A=A-1 // 8772
M=D // 8773
@12 // 8774
D=A // 8775
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=D // 8779
@12 // 8780
D=A // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=D // 8785
@12 // 8786
D=A // 8787
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=D // 8791
@12 // 8792
D=A // 8793
@SP // 8794
AM=M+1 // 8795
A=A-1 // 8796
M=D // 8797
@12 // 8798
D=A // 8799
@SP // 8800
AM=M+1 // 8801
A=A-1 // 8802
M=D // 8803
@30 // 8804
D=A // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=D // 8809
@SP // 8810
AM=M+1 // 8811
A=A-1 // 8812
M=0 // 8813
@SP // 8814
AM=M+1 // 8815
A=A-1 // 8816
M=0 // 8817
// call Output.create
@17 // 8818
D=A // 8819
@14 // 8820
M=D // 8821
@Output.create // 8822
D=A // 8823
@13 // 8824
M=D // 8825
@Output.initMap.ret.54 // 8826
D=A // 8827
@CALL // 8828
0;JMP // 8829
(Output.initMap.ret.54)
@SP // 8830
AM=M-1 // 8831
D=M // 8832
@5 // 8833
M=D // 8834

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 85")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
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
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=55}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@85 // 8835
D=A // 8836
@SP // 8837
AM=M+1 // 8838
A=A-1 // 8839
M=D // 8840
@51 // 8841
D=A // 8842
@SP // 8843
AM=M+1 // 8844
A=A-1 // 8845
M=D // 8846
@51 // 8847
D=A // 8848
@SP // 8849
AM=M+1 // 8850
A=A-1 // 8851
M=D // 8852
@51 // 8853
D=A // 8854
@SP // 8855
AM=M+1 // 8856
A=A-1 // 8857
M=D // 8858
@51 // 8859
D=A // 8860
@SP // 8861
AM=M+1 // 8862
A=A-1 // 8863
M=D // 8864
@51 // 8865
D=A // 8866
@SP // 8867
AM=M+1 // 8868
A=A-1 // 8869
M=D // 8870
@51 // 8871
D=A // 8872
@SP // 8873
AM=M+1 // 8874
A=A-1 // 8875
M=D // 8876
@51 // 8877
D=A // 8878
@SP // 8879
AM=M+1 // 8880
A=A-1 // 8881
M=D // 8882
@51 // 8883
D=A // 8884
@SP // 8885
AM=M+1 // 8886
A=A-1 // 8887
M=D // 8888
@30 // 8889
D=A // 8890
@SP // 8891
AM=M+1 // 8892
A=A-1 // 8893
M=D // 8894
@SP // 8895
AM=M+1 // 8896
A=A-1 // 8897
M=0 // 8898
@SP // 8899
AM=M+1 // 8900
A=A-1 // 8901
M=0 // 8902
// call Output.create
@17 // 8903
D=A // 8904
@14 // 8905
M=D // 8906
@Output.create // 8907
D=A // 8908
@13 // 8909
M=D // 8910
@Output.initMap.ret.55 // 8911
D=A // 8912
@CALL // 8913
0;JMP // 8914
(Output.initMap.ret.55)
@SP // 8915
AM=M-1 // 8916
D=M // 8917
@5 // 8918
M=D // 8919

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 86")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 30")
//          arg[7]:
//              PushInstruction("constant 30")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=56}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@86 // 8920
D=A // 8921
@SP // 8922
AM=M+1 // 8923
A=A-1 // 8924
M=D // 8925
@51 // 8926
D=A // 8927
@SP // 8928
AM=M+1 // 8929
A=A-1 // 8930
M=D // 8931
@51 // 8932
D=A // 8933
@SP // 8934
AM=M+1 // 8935
A=A-1 // 8936
M=D // 8937
@51 // 8938
D=A // 8939
@SP // 8940
AM=M+1 // 8941
A=A-1 // 8942
M=D // 8943
@51 // 8944
D=A // 8945
@SP // 8946
AM=M+1 // 8947
A=A-1 // 8948
M=D // 8949
@51 // 8950
D=A // 8951
@SP // 8952
AM=M+1 // 8953
A=A-1 // 8954
M=D // 8955
@30 // 8956
D=A // 8957
@SP // 8958
AM=M+1 // 8959
A=A-1 // 8960
M=D // 8961
@30 // 8962
D=A // 8963
@SP // 8964
AM=M+1 // 8965
A=A-1 // 8966
M=D // 8967
@12 // 8968
D=A // 8969
@SP // 8970
AM=M+1 // 8971
A=A-1 // 8972
M=D // 8973
@12 // 8974
D=A // 8975
@SP // 8976
AM=M+1 // 8977
A=A-1 // 8978
M=D // 8979
@SP // 8980
AM=M+1 // 8981
A=A-1 // 8982
M=0 // 8983
@SP // 8984
AM=M+1 // 8985
A=A-1 // 8986
M=0 // 8987
// call Output.create
@17 // 8988
D=A // 8989
@14 // 8990
M=D // 8991
@Output.create // 8992
D=A // 8993
@13 // 8994
M=D // 8995
@Output.initMap.ret.56 // 8996
D=A // 8997
@CALL // 8998
0;JMP // 8999
(Output.initMap.ret.56)
@SP // 9000
AM=M-1 // 9001
D=M // 9002
@5 // 9003
M=D // 9004

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 87")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 63")
//          arg[8]:
//              PushInstruction("constant 63")
//          arg[9]:
//              PushInstruction("constant 18")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=57}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@87 // 9005
D=A // 9006
@SP // 9007
AM=M+1 // 9008
A=A-1 // 9009
M=D // 9010
@51 // 9011
D=A // 9012
@SP // 9013
AM=M+1 // 9014
A=A-1 // 9015
M=D // 9016
@51 // 9017
D=A // 9018
@SP // 9019
AM=M+1 // 9020
A=A-1 // 9021
M=D // 9022
@51 // 9023
D=A // 9024
@SP // 9025
AM=M+1 // 9026
A=A-1 // 9027
M=D // 9028
@51 // 9029
D=A // 9030
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=D // 9034
@51 // 9035
D=A // 9036
@SP // 9037
AM=M+1 // 9038
A=A-1 // 9039
M=D // 9040
@63 // 9041
D=A // 9042
@SP // 9043
AM=M+1 // 9044
A=A-1 // 9045
M=D // 9046
@63 // 9047
D=A // 9048
@SP // 9049
AM=M+1 // 9050
A=A-1 // 9051
M=D // 9052
@63 // 9053
D=A // 9054
@SP // 9055
AM=M+1 // 9056
A=A-1 // 9057
M=D // 9058
@18 // 9059
D=A // 9060
@SP // 9061
AM=M+1 // 9062
A=A-1 // 9063
M=D // 9064
@SP // 9065
AM=M+1 // 9066
A=A-1 // 9067
M=0 // 9068
@SP // 9069
AM=M+1 // 9070
A=A-1 // 9071
M=0 // 9072
// call Output.create
@17 // 9073
D=A // 9074
@14 // 9075
M=D // 9076
@Output.create // 9077
D=A // 9078
@13 // 9079
M=D // 9080
@Output.initMap.ret.57 // 9081
D=A // 9082
@CALL // 9083
0;JMP // 9084
(Output.initMap.ret.57)
@SP // 9085
AM=M-1 // 9086
D=M // 9087
@5 // 9088
M=D // 9089

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 88")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 30")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 30")
//          arg[7]:
//              PushInstruction("constant 30")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=58}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@88 // 9090
D=A // 9091
@SP // 9092
AM=M+1 // 9093
A=A-1 // 9094
M=D // 9095
@51 // 9096
D=A // 9097
@SP // 9098
AM=M+1 // 9099
A=A-1 // 9100
M=D // 9101
@51 // 9102
D=A // 9103
@SP // 9104
AM=M+1 // 9105
A=A-1 // 9106
M=D // 9107
@30 // 9108
D=A // 9109
@SP // 9110
AM=M+1 // 9111
A=A-1 // 9112
M=D // 9113
@30 // 9114
D=A // 9115
@SP // 9116
AM=M+1 // 9117
A=A-1 // 9118
M=D // 9119
@12 // 9120
D=A // 9121
@SP // 9122
AM=M+1 // 9123
A=A-1 // 9124
M=D // 9125
@30 // 9126
D=A // 9127
@SP // 9128
AM=M+1 // 9129
A=A-1 // 9130
M=D // 9131
@30 // 9132
D=A // 9133
@SP // 9134
AM=M+1 // 9135
A=A-1 // 9136
M=D // 9137
@51 // 9138
D=A // 9139
@SP // 9140
AM=M+1 // 9141
A=A-1 // 9142
M=D // 9143
@51 // 9144
D=A // 9145
@SP // 9146
AM=M+1 // 9147
A=A-1 // 9148
M=D // 9149
@SP // 9150
AM=M+1 // 9151
A=A-1 // 9152
M=0 // 9153
@SP // 9154
AM=M+1 // 9155
A=A-1 // 9156
M=0 // 9157
// call Output.create
@17 // 9158
D=A // 9159
@14 // 9160
M=D // 9161
@Output.create // 9162
D=A // 9163
@13 // 9164
M=D // 9165
@Output.initMap.ret.58 // 9166
D=A // 9167
@CALL // 9168
0;JMP // 9169
(Output.initMap.ret.58)
@SP // 9170
AM=M-1 // 9171
D=M // 9172
@5 // 9173
M=D // 9174

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 89")
//          arg[1]:
//              PushInstruction("constant 51")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 51")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 30")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=59}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@89 // 9175
D=A // 9176
@SP // 9177
AM=M+1 // 9178
A=A-1 // 9179
M=D // 9180
@51 // 9181
D=A // 9182
@SP // 9183
AM=M+1 // 9184
A=A-1 // 9185
M=D // 9186
@51 // 9187
D=A // 9188
@SP // 9189
AM=M+1 // 9190
A=A-1 // 9191
M=D // 9192
@51 // 9193
D=A // 9194
@SP // 9195
AM=M+1 // 9196
A=A-1 // 9197
M=D // 9198
@51 // 9199
D=A // 9200
@SP // 9201
AM=M+1 // 9202
A=A-1 // 9203
M=D // 9204
@30 // 9205
D=A // 9206
@SP // 9207
AM=M+1 // 9208
A=A-1 // 9209
M=D // 9210
@12 // 9211
D=A // 9212
@SP // 9213
AM=M+1 // 9214
A=A-1 // 9215
M=D // 9216
@12 // 9217
D=A // 9218
@SP // 9219
AM=M+1 // 9220
A=A-1 // 9221
M=D // 9222
@12 // 9223
D=A // 9224
@SP // 9225
AM=M+1 // 9226
A=A-1 // 9227
M=D // 9228
@30 // 9229
D=A // 9230
@SP // 9231
AM=M+1 // 9232
A=A-1 // 9233
M=D // 9234
@SP // 9235
AM=M+1 // 9236
A=A-1 // 9237
M=0 // 9238
@SP // 9239
AM=M+1 // 9240
A=A-1 // 9241
M=0 // 9242
// call Output.create
@17 // 9243
D=A // 9244
@14 // 9245
M=D // 9246
@Output.create // 9247
D=A // 9248
@13 // 9249
M=D // 9250
@Output.initMap.ret.59 // 9251
D=A // 9252
@CALL // 9253
0;JMP // 9254
(Output.initMap.ret.59)
@SP // 9255
AM=M-1 // 9256
D=M // 9257
@5 // 9258
M=D // 9259

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 90")
//          arg[1]:
//              PushInstruction("constant 63")
//          arg[2]:
//              PushInstruction("constant 51")
//          arg[3]:
//              PushInstruction("constant 49")
//          arg[4]:
//              PushInstruction("constant 24")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 6")
//          arg[7]:
//              PushInstruction("constant 35")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=60}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@90 // 9260
D=A // 9261
@SP // 9262
AM=M+1 // 9263
A=A-1 // 9264
M=D // 9265
@63 // 9266
D=A // 9267
@SP // 9268
AM=M+1 // 9269
A=A-1 // 9270
M=D // 9271
@51 // 9272
D=A // 9273
@SP // 9274
AM=M+1 // 9275
A=A-1 // 9276
M=D // 9277
@49 // 9278
D=A // 9279
@SP // 9280
AM=M+1 // 9281
A=A-1 // 9282
M=D // 9283
@24 // 9284
D=A // 9285
@SP // 9286
AM=M+1 // 9287
A=A-1 // 9288
M=D // 9289
@12 // 9290
D=A // 9291
@SP // 9292
AM=M+1 // 9293
A=A-1 // 9294
M=D // 9295
@6 // 9296
D=A // 9297
@SP // 9298
AM=M+1 // 9299
A=A-1 // 9300
M=D // 9301
@35 // 9302
D=A // 9303
@SP // 9304
AM=M+1 // 9305
A=A-1 // 9306
M=D // 9307
@51 // 9308
D=A // 9309
@SP // 9310
AM=M+1 // 9311
A=A-1 // 9312
M=D // 9313
@63 // 9314
D=A // 9315
@SP // 9316
AM=M+1 // 9317
A=A-1 // 9318
M=D // 9319
@SP // 9320
AM=M+1 // 9321
A=A-1 // 9322
M=0 // 9323
@SP // 9324
AM=M+1 // 9325
A=A-1 // 9326
M=0 // 9327
// call Output.create
@17 // 9328
D=A // 9329
@14 // 9330
M=D // 9331
@Output.create // 9332
D=A // 9333
@13 // 9334
M=D // 9335
@Output.initMap.ret.60 // 9336
D=A // 9337
@CALL // 9338
0;JMP // 9339
(Output.initMap.ret.60)
@SP // 9340
AM=M-1 // 9341
D=M // 9342
@5 // 9343
M=D // 9344

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 91")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 6")
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
//              PushInstruction("constant 6")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=61}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@91 // 9345
D=A // 9346
@SP // 9347
AM=M+1 // 9348
A=A-1 // 9349
M=D // 9350
@30 // 9351
D=A // 9352
@SP // 9353
AM=M+1 // 9354
A=A-1 // 9355
M=D // 9356
@6 // 9357
D=A // 9358
@SP // 9359
AM=M+1 // 9360
A=A-1 // 9361
M=D // 9362
@6 // 9363
D=A // 9364
@SP // 9365
AM=M+1 // 9366
A=A-1 // 9367
M=D // 9368
@6 // 9369
D=A // 9370
@SP // 9371
AM=M+1 // 9372
A=A-1 // 9373
M=D // 9374
@6 // 9375
D=A // 9376
@SP // 9377
AM=M+1 // 9378
A=A-1 // 9379
M=D // 9380
@6 // 9381
D=A // 9382
@SP // 9383
AM=M+1 // 9384
A=A-1 // 9385
M=D // 9386
@6 // 9387
D=A // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=D // 9392
@6 // 9393
D=A // 9394
@SP // 9395
AM=M+1 // 9396
A=A-1 // 9397
M=D // 9398
@30 // 9399
D=A // 9400
@SP // 9401
AM=M+1 // 9402
A=A-1 // 9403
M=D // 9404
@SP // 9405
AM=M+1 // 9406
A=A-1 // 9407
M=0 // 9408
@SP // 9409
AM=M+1 // 9410
A=A-1 // 9411
M=0 // 9412
// call Output.create
@17 // 9413
D=A // 9414
@14 // 9415
M=D // 9416
@Output.create // 9417
D=A // 9418
@13 // 9419
M=D // 9420
@Output.initMap.ret.61 // 9421
D=A // 9422
@CALL // 9423
0;JMP // 9424
(Output.initMap.ret.61)
@SP // 9425
AM=M-1 // 9426
D=M // 9427
@5 // 9428
M=D // 9429

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 92")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 1")
//          arg[4]:
//              PushInstruction("constant 3")
//          arg[5]:
//              PushInstruction("constant 6")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 24")
//          arg[8]:
//              PushInstruction("constant 48")
//          arg[9]:
//              PushInstruction("constant 32")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=62}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@92 // 9430
D=A // 9431
@SP // 9432
AM=M+1 // 9433
A=A-1 // 9434
M=D // 9435
@SP // 9436
AM=M+1 // 9437
A=A-1 // 9438
M=0 // 9439
@SP // 9440
AM=M+1 // 9441
A=A-1 // 9442
M=0 // 9443
@SP // 9444
AM=M+1 // 9445
A=A-1 // 9446
M=1 // 9447
@3 // 9448
D=A // 9449
@SP // 9450
AM=M+1 // 9451
A=A-1 // 9452
M=D // 9453
@6 // 9454
D=A // 9455
@SP // 9456
AM=M+1 // 9457
A=A-1 // 9458
M=D // 9459
@12 // 9460
D=A // 9461
@SP // 9462
AM=M+1 // 9463
A=A-1 // 9464
M=D // 9465
@24 // 9466
D=A // 9467
@SP // 9468
AM=M+1 // 9469
A=A-1 // 9470
M=D // 9471
@48 // 9472
D=A // 9473
@SP // 9474
AM=M+1 // 9475
A=A-1 // 9476
M=D // 9477
@32 // 9478
D=A // 9479
@SP // 9480
AM=M+1 // 9481
A=A-1 // 9482
M=D // 9483
@SP // 9484
AM=M+1 // 9485
A=A-1 // 9486
M=0 // 9487
@SP // 9488
AM=M+1 // 9489
A=A-1 // 9490
M=0 // 9491
// call Output.create
@17 // 9492
D=A // 9493
@14 // 9494
M=D // 9495
@Output.create // 9496
D=A // 9497
@13 // 9498
M=D // 9499
@Output.initMap.ret.62 // 9500
D=A // 9501
@CALL // 9502
0;JMP // 9503
(Output.initMap.ret.62)
@SP // 9504
AM=M-1 // 9505
D=M // 9506
@5 // 9507
M=D // 9508

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 93")
//          arg[1]:
//              PushInstruction("constant 30")
//          arg[2]:
//              PushInstruction("constant 24")
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
//              PushInstruction("constant 24")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=63}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@93 // 9509
D=A // 9510
@SP // 9511
AM=M+1 // 9512
A=A-1 // 9513
M=D // 9514
@30 // 9515
D=A // 9516
@SP // 9517
AM=M+1 // 9518
A=A-1 // 9519
M=D // 9520
@24 // 9521
D=A // 9522
@SP // 9523
AM=M+1 // 9524
A=A-1 // 9525
M=D // 9526
@24 // 9527
D=A // 9528
@SP // 9529
AM=M+1 // 9530
A=A-1 // 9531
M=D // 9532
@24 // 9533
D=A // 9534
@SP // 9535
AM=M+1 // 9536
A=A-1 // 9537
M=D // 9538
@24 // 9539
D=A // 9540
@SP // 9541
AM=M+1 // 9542
A=A-1 // 9543
M=D // 9544
@24 // 9545
D=A // 9546
@SP // 9547
AM=M+1 // 9548
A=A-1 // 9549
M=D // 9550
@24 // 9551
D=A // 9552
@SP // 9553
AM=M+1 // 9554
A=A-1 // 9555
M=D // 9556
@24 // 9557
D=A // 9558
@SP // 9559
AM=M+1 // 9560
A=A-1 // 9561
M=D // 9562
@30 // 9563
D=A // 9564
@SP // 9565
AM=M+1 // 9566
A=A-1 // 9567
M=D // 9568
@SP // 9569
AM=M+1 // 9570
A=A-1 // 9571
M=0 // 9572
@SP // 9573
AM=M+1 // 9574
A=A-1 // 9575
M=0 // 9576
// call Output.create
@17 // 9577
D=A // 9578
@14 // 9579
M=D // 9580
@Output.create // 9581
D=A // 9582
@13 // 9583
M=D // 9584
@Output.initMap.ret.63 // 9585
D=A // 9586
@CALL // 9587
0;JMP // 9588
(Output.initMap.ret.63)
@SP // 9589
AM=M-1 // 9590
D=M // 9591
@5 // 9592
M=D // 9593

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 94")
//          arg[1]:
//              PushInstruction("constant 8")
//          arg[2]:
//              PushInstruction("constant 28")
//          arg[3]:
//              PushInstruction("constant 54")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=64}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@94 // 9594
D=A // 9595
@SP // 9596
AM=M+1 // 9597
A=A-1 // 9598
M=D // 9599
@8 // 9600
D=A // 9601
@SP // 9602
AM=M+1 // 9603
A=A-1 // 9604
M=D // 9605
@28 // 9606
D=A // 9607
@SP // 9608
AM=M+1 // 9609
A=A-1 // 9610
M=D // 9611
@54 // 9612
D=A // 9613
@SP // 9614
AM=M+1 // 9615
A=A-1 // 9616
M=D // 9617
@SP // 9618
AM=M+1 // 9619
A=A-1 // 9620
M=0 // 9621
@SP // 9622
AM=M+1 // 9623
A=A-1 // 9624
M=0 // 9625
@SP // 9626
AM=M+1 // 9627
A=A-1 // 9628
M=0 // 9629
@SP // 9630
AM=M+1 // 9631
A=A-1 // 9632
M=0 // 9633
@SP // 9634
AM=M+1 // 9635
A=A-1 // 9636
M=0 // 9637
@SP // 9638
AM=M+1 // 9639
A=A-1 // 9640
M=0 // 9641
@SP // 9642
AM=M+1 // 9643
A=A-1 // 9644
M=0 // 9645
@SP // 9646
AM=M+1 // 9647
A=A-1 // 9648
M=0 // 9649
// call Output.create
@17 // 9650
D=A // 9651
@14 // 9652
M=D // 9653
@Output.create // 9654
D=A // 9655
@13 // 9656
M=D // 9657
@Output.initMap.ret.64 // 9658
D=A // 9659
@CALL // 9660
0;JMP // 9661
(Output.initMap.ret.64)
@SP // 9662
AM=M-1 // 9663
D=M // 9664
@5 // 9665
M=D // 9666

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 95")
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
//              PushInstruction("constant 63")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=65}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@95 // 9667
D=A // 9668
@SP // 9669
AM=M+1 // 9670
A=A-1 // 9671
M=D // 9672
@SP // 9673
AM=M+1 // 9674
A=A-1 // 9675
M=0 // 9676
@SP // 9677
AM=M+1 // 9678
A=A-1 // 9679
M=0 // 9680
@SP // 9681
AM=M+1 // 9682
A=A-1 // 9683
M=0 // 9684
@SP // 9685
AM=M+1 // 9686
A=A-1 // 9687
M=0 // 9688
@SP // 9689
AM=M+1 // 9690
A=A-1 // 9691
M=0 // 9692
@SP // 9693
AM=M+1 // 9694
A=A-1 // 9695
M=0 // 9696
@SP // 9697
AM=M+1 // 9698
A=A-1 // 9699
M=0 // 9700
@SP // 9701
AM=M+1 // 9702
A=A-1 // 9703
M=0 // 9704
@SP // 9705
AM=M+1 // 9706
A=A-1 // 9707
M=0 // 9708
@63 // 9709
D=A // 9710
@SP // 9711
AM=M+1 // 9712
A=A-1 // 9713
M=D // 9714
@SP // 9715
AM=M+1 // 9716
A=A-1 // 9717
M=0 // 9718
// call Output.create
@17 // 9719
D=A // 9720
@14 // 9721
M=D // 9722
@Output.create // 9723
D=A // 9724
@13 // 9725
M=D // 9726
@Output.initMap.ret.65 // 9727
D=A // 9728
@CALL // 9729
0;JMP // 9730
(Output.initMap.ret.65)
@SP // 9731
AM=M-1 // 9732
D=M // 9733
@5 // 9734
M=D // 9735

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 96")
//          arg[1]:
//              PushInstruction("constant 6")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 24")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=66}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@96 // 9736
D=A // 9737
@SP // 9738
AM=M+1 // 9739
A=A-1 // 9740
M=D // 9741
@6 // 9742
D=A // 9743
@SP // 9744
AM=M+1 // 9745
A=A-1 // 9746
M=D // 9747
@12 // 9748
D=A // 9749
@SP // 9750
AM=M+1 // 9751
A=A-1 // 9752
M=D // 9753
@24 // 9754
D=A // 9755
@SP // 9756
AM=M+1 // 9757
A=A-1 // 9758
M=D // 9759
@SP // 9760
AM=M+1 // 9761
A=A-1 // 9762
M=0 // 9763
@SP // 9764
AM=M+1 // 9765
A=A-1 // 9766
M=0 // 9767
@SP // 9768
AM=M+1 // 9769
A=A-1 // 9770
M=0 // 9771
@SP // 9772
AM=M+1 // 9773
A=A-1 // 9774
M=0 // 9775
@SP // 9776
AM=M+1 // 9777
A=A-1 // 9778
M=0 // 9779
@SP // 9780
AM=M+1 // 9781
A=A-1 // 9782
M=0 // 9783
@SP // 9784
AM=M+1 // 9785
A=A-1 // 9786
M=0 // 9787
@SP // 9788
AM=M+1 // 9789
A=A-1 // 9790
M=0 // 9791
// call Output.create
@17 // 9792
D=A // 9793
@14 // 9794
M=D // 9795
@Output.create // 9796
D=A // 9797
@13 // 9798
M=D // 9799
@Output.initMap.ret.66 // 9800
D=A // 9801
@CALL // 9802
0;JMP // 9803
(Output.initMap.ret.66)
@SP // 9804
AM=M-1 // 9805
D=M // 9806
@5 // 9807
M=D // 9808

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 97")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 14")
//          arg[5]:
//              PushInstruction("constant 24")
//          arg[6]:
//              PushInstruction("constant 30")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=67}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@97 // 9809
D=A // 9810
@SP // 9811
AM=M+1 // 9812
A=A-1 // 9813
M=D // 9814
@SP // 9815
AM=M+1 // 9816
A=A-1 // 9817
M=0 // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=0 // 9822
@SP // 9823
AM=M+1 // 9824
A=A-1 // 9825
M=0 // 9826
@14 // 9827
D=A // 9828
@SP // 9829
AM=M+1 // 9830
A=A-1 // 9831
M=D // 9832
@24 // 9833
D=A // 9834
@SP // 9835
AM=M+1 // 9836
A=A-1 // 9837
M=D // 9838
@30 // 9839
D=A // 9840
@SP // 9841
AM=M+1 // 9842
A=A-1 // 9843
M=D // 9844
@27 // 9845
D=A // 9846
@SP // 9847
AM=M+1 // 9848
A=A-1 // 9849
M=D // 9850
@27 // 9851
D=A // 9852
@SP // 9853
AM=M+1 // 9854
A=A-1 // 9855
M=D // 9856
@54 // 9857
D=A // 9858
@SP // 9859
AM=M+1 // 9860
A=A-1 // 9861
M=D // 9862
@SP // 9863
AM=M+1 // 9864
A=A-1 // 9865
M=0 // 9866
@SP // 9867
AM=M+1 // 9868
A=A-1 // 9869
M=0 // 9870
// call Output.create
@17 // 9871
D=A // 9872
@14 // 9873
M=D // 9874
@Output.create // 9875
D=A // 9876
@13 // 9877
M=D // 9878
@Output.initMap.ret.67 // 9879
D=A // 9880
@CALL // 9881
0;JMP // 9882
(Output.initMap.ret.67)
@SP // 9883
AM=M-1 // 9884
D=M // 9885
@5 // 9886
M=D // 9887

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 98")
//          arg[1]:
//              PushInstruction("constant 3")
//          arg[2]:
//              PushInstruction("constant 3")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 15")
//          arg[5]:
//              PushInstruction("constant 27")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=68}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@98 // 9888
D=A // 9889
@SP // 9890
AM=M+1 // 9891
A=A-1 // 9892
M=D // 9893
@3 // 9894
D=A // 9895
@SP // 9896
AM=M+1 // 9897
A=A-1 // 9898
M=D // 9899
@3 // 9900
D=A // 9901
@SP // 9902
AM=M+1 // 9903
A=A-1 // 9904
M=D // 9905
@3 // 9906
D=A // 9907
@SP // 9908
AM=M+1 // 9909
A=A-1 // 9910
M=D // 9911
@15 // 9912
D=A // 9913
@SP // 9914
AM=M+1 // 9915
A=A-1 // 9916
M=D // 9917
@27 // 9918
D=A // 9919
@SP // 9920
AM=M+1 // 9921
A=A-1 // 9922
M=D // 9923
@51 // 9924
D=A // 9925
@SP // 9926
AM=M+1 // 9927
A=A-1 // 9928
M=D // 9929
@51 // 9930
D=A // 9931
@SP // 9932
AM=M+1 // 9933
A=A-1 // 9934
M=D // 9935
@51 // 9936
D=A // 9937
@SP // 9938
AM=M+1 // 9939
A=A-1 // 9940
M=D // 9941
@30 // 9942
D=A // 9943
@SP // 9944
AM=M+1 // 9945
A=A-1 // 9946
M=D // 9947
@SP // 9948
AM=M+1 // 9949
A=A-1 // 9950
M=0 // 9951
@SP // 9952
AM=M+1 // 9953
A=A-1 // 9954
M=0 // 9955
// call Output.create
@17 // 9956
D=A // 9957
@14 // 9958
M=D // 9959
@Output.create // 9960
D=A // 9961
@13 // 9962
M=D // 9963
@Output.initMap.ret.68 // 9964
D=A // 9965
@CALL // 9966
0;JMP // 9967
(Output.initMap.ret.68)
@SP // 9968
AM=M-1 // 9969
D=M // 9970
@5 // 9971
M=D // 9972

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 99")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 3")
//          arg[7]:
//              PushInstruction("constant 3")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=69}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@99 // 9973
D=A // 9974
@SP // 9975
AM=M+1 // 9976
A=A-1 // 9977
M=D // 9978
@SP // 9979
AM=M+1 // 9980
A=A-1 // 9981
M=0 // 9982
@SP // 9983
AM=M+1 // 9984
A=A-1 // 9985
M=0 // 9986
@SP // 9987
AM=M+1 // 9988
A=A-1 // 9989
M=0 // 9990
@30 // 9991
D=A // 9992
@SP // 9993
AM=M+1 // 9994
A=A-1 // 9995
M=D // 9996
@51 // 9997
D=A // 9998
@SP // 9999
AM=M+1 // 10000
A=A-1 // 10001
M=D // 10002
@3 // 10003
D=A // 10004
@SP // 10005
AM=M+1 // 10006
A=A-1 // 10007
M=D // 10008
@3 // 10009
D=A // 10010
@SP // 10011
AM=M+1 // 10012
A=A-1 // 10013
M=D // 10014
@51 // 10015
D=A // 10016
@SP // 10017
AM=M+1 // 10018
A=A-1 // 10019
M=D // 10020
@30 // 10021
D=A // 10022
@SP // 10023
AM=M+1 // 10024
A=A-1 // 10025
M=D // 10026
@SP // 10027
AM=M+1 // 10028
A=A-1 // 10029
M=0 // 10030
@SP // 10031
AM=M+1 // 10032
A=A-1 // 10033
M=0 // 10034
// call Output.create
@17 // 10035
D=A // 10036
@14 // 10037
M=D // 10038
@Output.create // 10039
D=A // 10040
@13 // 10041
M=D // 10042
@Output.initMap.ret.69 // 10043
D=A // 10044
@CALL // 10045
0;JMP // 10046
(Output.initMap.ret.69)
@SP // 10047
AM=M-1 // 10048
D=M // 10049
@5 // 10050
M=D // 10051

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 100")
//          arg[1]:
//              PushInstruction("constant 48")
//          arg[2]:
//              PushInstruction("constant 48")
//          arg[3]:
//              PushInstruction("constant 48")
//          arg[4]:
//              PushInstruction("constant 60")
//          arg[5]:
//              PushInstruction("constant 54")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=70}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@100 // 10052
D=A // 10053
@SP // 10054
AM=M+1 // 10055
A=A-1 // 10056
M=D // 10057
@48 // 10058
D=A // 10059
@SP // 10060
AM=M+1 // 10061
A=A-1 // 10062
M=D // 10063
@48 // 10064
D=A // 10065
@SP // 10066
AM=M+1 // 10067
A=A-1 // 10068
M=D // 10069
@48 // 10070
D=A // 10071
@SP // 10072
AM=M+1 // 10073
A=A-1 // 10074
M=D // 10075
@60 // 10076
D=A // 10077
@SP // 10078
AM=M+1 // 10079
A=A-1 // 10080
M=D // 10081
@54 // 10082
D=A // 10083
@SP // 10084
AM=M+1 // 10085
A=A-1 // 10086
M=D // 10087
@51 // 10088
D=A // 10089
@SP // 10090
AM=M+1 // 10091
A=A-1 // 10092
M=D // 10093
@51 // 10094
D=A // 10095
@SP // 10096
AM=M+1 // 10097
A=A-1 // 10098
M=D // 10099
@51 // 10100
D=A // 10101
@SP // 10102
AM=M+1 // 10103
A=A-1 // 10104
M=D // 10105
@30 // 10106
D=A // 10107
@SP // 10108
AM=M+1 // 10109
A=A-1 // 10110
M=D // 10111
@SP // 10112
AM=M+1 // 10113
A=A-1 // 10114
M=0 // 10115
@SP // 10116
AM=M+1 // 10117
A=A-1 // 10118
M=0 // 10119
// call Output.create
@17 // 10120
D=A // 10121
@14 // 10122
M=D // 10123
@Output.create // 10124
D=A // 10125
@13 // 10126
M=D // 10127
@Output.initMap.ret.70 // 10128
D=A // 10129
@CALL // 10130
0;JMP // 10131
(Output.initMap.ret.70)
@SP // 10132
AM=M-1 // 10133
D=M // 10134
@5 // 10135
M=D // 10136

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 101")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 63")
//          arg[7]:
//              PushInstruction("constant 3")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=71}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@101 // 10137
D=A // 10138
@SP // 10139
AM=M+1 // 10140
A=A-1 // 10141
M=D // 10142
@SP // 10143
AM=M+1 // 10144
A=A-1 // 10145
M=0 // 10146
@SP // 10147
AM=M+1 // 10148
A=A-1 // 10149
M=0 // 10150
@SP // 10151
AM=M+1 // 10152
A=A-1 // 10153
M=0 // 10154
@30 // 10155
D=A // 10156
@SP // 10157
AM=M+1 // 10158
A=A-1 // 10159
M=D // 10160
@51 // 10161
D=A // 10162
@SP // 10163
AM=M+1 // 10164
A=A-1 // 10165
M=D // 10166
@63 // 10167
D=A // 10168
@SP // 10169
AM=M+1 // 10170
A=A-1 // 10171
M=D // 10172
@3 // 10173
D=A // 10174
@SP // 10175
AM=M+1 // 10176
A=A-1 // 10177
M=D // 10178
@51 // 10179
D=A // 10180
@SP // 10181
AM=M+1 // 10182
A=A-1 // 10183
M=D // 10184
@30 // 10185
D=A // 10186
@SP // 10187
AM=M+1 // 10188
A=A-1 // 10189
M=D // 10190
@SP // 10191
AM=M+1 // 10192
A=A-1 // 10193
M=0 // 10194
@SP // 10195
AM=M+1 // 10196
A=A-1 // 10197
M=0 // 10198
// call Output.create
@17 // 10199
D=A // 10200
@14 // 10201
M=D // 10202
@Output.create // 10203
D=A // 10204
@13 // 10205
M=D // 10206
@Output.initMap.ret.71 // 10207
D=A // 10208
@CALL // 10209
0;JMP // 10210
(Output.initMap.ret.71)
@SP // 10211
AM=M-1 // 10212
D=M // 10213
@5 // 10214
M=D // 10215

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 102")
//          arg[1]:
//              PushInstruction("constant 28")
//          arg[2]:
//              PushInstruction("constant 54")
//          arg[3]:
//              PushInstruction("constant 38")
//          arg[4]:
//              PushInstruction("constant 6")
//          arg[5]:
//              PushInstruction("constant 15")
//          arg[6]:
//              PushInstruction("constant 6")
//          arg[7]:
//              PushInstruction("constant 6")
//          arg[8]:
//              PushInstruction("constant 6")
//          arg[9]:
//              PushInstruction("constant 15")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=72}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@102 // 10216
D=A // 10217
@SP // 10218
AM=M+1 // 10219
A=A-1 // 10220
M=D // 10221
@28 // 10222
D=A // 10223
@SP // 10224
AM=M+1 // 10225
A=A-1 // 10226
M=D // 10227
@54 // 10228
D=A // 10229
@SP // 10230
AM=M+1 // 10231
A=A-1 // 10232
M=D // 10233
@38 // 10234
D=A // 10235
@SP // 10236
AM=M+1 // 10237
A=A-1 // 10238
M=D // 10239
@6 // 10240
D=A // 10241
@SP // 10242
AM=M+1 // 10243
A=A-1 // 10244
M=D // 10245
@15 // 10246
D=A // 10247
@SP // 10248
AM=M+1 // 10249
A=A-1 // 10250
M=D // 10251
@6 // 10252
D=A // 10253
@SP // 10254
AM=M+1 // 10255
A=A-1 // 10256
M=D // 10257
@6 // 10258
D=A // 10259
@SP // 10260
AM=M+1 // 10261
A=A-1 // 10262
M=D // 10263
@6 // 10264
D=A // 10265
@SP // 10266
AM=M+1 // 10267
A=A-1 // 10268
M=D // 10269
@15 // 10270
D=A // 10271
@SP // 10272
AM=M+1 // 10273
A=A-1 // 10274
M=D // 10275
@SP // 10276
AM=M+1 // 10277
A=A-1 // 10278
M=0 // 10279
@SP // 10280
AM=M+1 // 10281
A=A-1 // 10282
M=0 // 10283
// call Output.create
@17 // 10284
D=A // 10285
@14 // 10286
M=D // 10287
@Output.create // 10288
D=A // 10289
@13 // 10290
M=D // 10291
@Output.initMap.ret.72 // 10292
D=A // 10293
@CALL // 10294
0;JMP // 10295
(Output.initMap.ret.72)
@SP // 10296
AM=M-1 // 10297
D=M // 10298
@5 // 10299
M=D // 10300

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 103")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 30")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 62")
//          arg[8]:
//              PushInstruction("constant 48")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 30")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=73}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@103 // 10301
D=A // 10302
@SP // 10303
AM=M+1 // 10304
A=A-1 // 10305
M=D // 10306
@SP // 10307
AM=M+1 // 10308
A=A-1 // 10309
M=0 // 10310
@SP // 10311
AM=M+1 // 10312
A=A-1 // 10313
M=0 // 10314
@30 // 10315
D=A // 10316
@SP // 10317
AM=M+1 // 10318
A=A-1 // 10319
M=D // 10320
@51 // 10321
D=A // 10322
@SP // 10323
AM=M+1 // 10324
A=A-1 // 10325
M=D // 10326
@51 // 10327
D=A // 10328
@SP // 10329
AM=M+1 // 10330
A=A-1 // 10331
M=D // 10332
@51 // 10333
D=A // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=D // 10338
@62 // 10339
D=A // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=D // 10344
@48 // 10345
D=A // 10346
@SP // 10347
AM=M+1 // 10348
A=A-1 // 10349
M=D // 10350
@51 // 10351
D=A // 10352
@SP // 10353
AM=M+1 // 10354
A=A-1 // 10355
M=D // 10356
@30 // 10357
D=A // 10358
@SP // 10359
AM=M+1 // 10360
A=A-1 // 10361
M=D // 10362
@SP // 10363
AM=M+1 // 10364
A=A-1 // 10365
M=0 // 10366
// call Output.create
@17 // 10367
D=A // 10368
@14 // 10369
M=D // 10370
@Output.create // 10371
D=A // 10372
@13 // 10373
M=D // 10374
@Output.initMap.ret.73 // 10375
D=A // 10376
@CALL // 10377
0;JMP // 10378
(Output.initMap.ret.73)
@SP // 10379
AM=M-1 // 10380
D=M // 10381
@5 // 10382
M=D // 10383

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 104")
//          arg[1]:
//              PushInstruction("constant 3")
//          arg[2]:
//              PushInstruction("constant 3")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 27")
//          arg[5]:
//              PushInstruction("constant 55")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=74}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@104 // 10384
D=A // 10385
@SP // 10386
AM=M+1 // 10387
A=A-1 // 10388
M=D // 10389
@3 // 10390
D=A // 10391
@SP // 10392
AM=M+1 // 10393
A=A-1 // 10394
M=D // 10395
@3 // 10396
D=A // 10397
@SP // 10398
AM=M+1 // 10399
A=A-1 // 10400
M=D // 10401
@3 // 10402
D=A // 10403
@SP // 10404
AM=M+1 // 10405
A=A-1 // 10406
M=D // 10407
@27 // 10408
D=A // 10409
@SP // 10410
AM=M+1 // 10411
A=A-1 // 10412
M=D // 10413
@55 // 10414
D=A // 10415
@SP // 10416
AM=M+1 // 10417
A=A-1 // 10418
M=D // 10419
@51 // 10420
D=A // 10421
@SP // 10422
AM=M+1 // 10423
A=A-1 // 10424
M=D // 10425
@51 // 10426
D=A // 10427
@SP // 10428
AM=M+1 // 10429
A=A-1 // 10430
M=D // 10431
@51 // 10432
D=A // 10433
@SP // 10434
AM=M+1 // 10435
A=A-1 // 10436
M=D // 10437
@51 // 10438
D=A // 10439
@SP // 10440
AM=M+1 // 10441
A=A-1 // 10442
M=D // 10443
@SP // 10444
AM=M+1 // 10445
A=A-1 // 10446
M=0 // 10447
@SP // 10448
AM=M+1 // 10449
A=A-1 // 10450
M=0 // 10451
// call Output.create
@17 // 10452
D=A // 10453
@14 // 10454
M=D // 10455
@Output.create // 10456
D=A // 10457
@13 // 10458
M=D // 10459
@Output.initMap.ret.74 // 10460
D=A // 10461
@CALL // 10462
0;JMP // 10463
(Output.initMap.ret.74)
@SP // 10464
AM=M-1 // 10465
D=M // 10466
@5 // 10467
M=D // 10468

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 105")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 14")
//          arg[5]:
//              PushInstruction("constant 12")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=75}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@105 // 10469
D=A // 10470
@SP // 10471
AM=M+1 // 10472
A=A-1 // 10473
M=D // 10474
@12 // 10475
D=A // 10476
@SP // 10477
AM=M+1 // 10478
A=A-1 // 10479
M=D // 10480
@12 // 10481
D=A // 10482
@SP // 10483
AM=M+1 // 10484
A=A-1 // 10485
M=D // 10486
@SP // 10487
AM=M+1 // 10488
A=A-1 // 10489
M=0 // 10490
@14 // 10491
D=A // 10492
@SP // 10493
AM=M+1 // 10494
A=A-1 // 10495
M=D // 10496
@12 // 10497
D=A // 10498
@SP // 10499
AM=M+1 // 10500
A=A-1 // 10501
M=D // 10502
@12 // 10503
D=A // 10504
@SP // 10505
AM=M+1 // 10506
A=A-1 // 10507
M=D // 10508
@12 // 10509
D=A // 10510
@SP // 10511
AM=M+1 // 10512
A=A-1 // 10513
M=D // 10514
@12 // 10515
D=A // 10516
@SP // 10517
AM=M+1 // 10518
A=A-1 // 10519
M=D // 10520
@30 // 10521
D=A // 10522
@SP // 10523
AM=M+1 // 10524
A=A-1 // 10525
M=D // 10526
@SP // 10527
AM=M+1 // 10528
A=A-1 // 10529
M=0 // 10530
@SP // 10531
AM=M+1 // 10532
A=A-1 // 10533
M=0 // 10534
// call Output.create
@17 // 10535
D=A // 10536
@14 // 10537
M=D // 10538
@Output.create // 10539
D=A // 10540
@13 // 10541
M=D // 10542
@Output.initMap.ret.75 // 10543
D=A // 10544
@CALL // 10545
0;JMP // 10546
(Output.initMap.ret.75)
@SP // 10547
AM=M-1 // 10548
D=M // 10549
@5 // 10550
M=D // 10551

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 106")
//          arg[1]:
//              PushInstruction("constant 48")
//          arg[2]:
//              PushInstruction("constant 48")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 56")
//          arg[5]:
//              PushInstruction("constant 48")
//          arg[6]:
//              PushInstruction("constant 48")
//          arg[7]:
//              PushInstruction("constant 48")
//          arg[8]:
//              PushInstruction("constant 48")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 30")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=76}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@106 // 10552
D=A // 10553
@SP // 10554
AM=M+1 // 10555
A=A-1 // 10556
M=D // 10557
@48 // 10558
D=A // 10559
@SP // 10560
AM=M+1 // 10561
A=A-1 // 10562
M=D // 10563
@48 // 10564
D=A // 10565
@SP // 10566
AM=M+1 // 10567
A=A-1 // 10568
M=D // 10569
@SP // 10570
AM=M+1 // 10571
A=A-1 // 10572
M=0 // 10573
@56 // 10574
D=A // 10575
@SP // 10576
AM=M+1 // 10577
A=A-1 // 10578
M=D // 10579
@48 // 10580
D=A // 10581
@SP // 10582
AM=M+1 // 10583
A=A-1 // 10584
M=D // 10585
@48 // 10586
D=A // 10587
@SP // 10588
AM=M+1 // 10589
A=A-1 // 10590
M=D // 10591
@48 // 10592
D=A // 10593
@SP // 10594
AM=M+1 // 10595
A=A-1 // 10596
M=D // 10597
@48 // 10598
D=A // 10599
@SP // 10600
AM=M+1 // 10601
A=A-1 // 10602
M=D // 10603
@51 // 10604
D=A // 10605
@SP // 10606
AM=M+1 // 10607
A=A-1 // 10608
M=D // 10609
@30 // 10610
D=A // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=D // 10615
@SP // 10616
AM=M+1 // 10617
A=A-1 // 10618
M=0 // 10619
// call Output.create
@17 // 10620
D=A // 10621
@14 // 10622
M=D // 10623
@Output.create // 10624
D=A // 10625
@13 // 10626
M=D // 10627
@Output.initMap.ret.76 // 10628
D=A // 10629
@CALL // 10630
0;JMP // 10631
(Output.initMap.ret.76)
@SP // 10632
AM=M-1 // 10633
D=M // 10634
@5 // 10635
M=D // 10636

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 107")
//          arg[1]:
//              PushInstruction("constant 3")
//          arg[2]:
//              PushInstruction("constant 3")
//          arg[3]:
//              PushInstruction("constant 3")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 27")
//          arg[6]:
//              PushInstruction("constant 15")
//          arg[7]:
//              PushInstruction("constant 15")
//          arg[8]:
//              PushInstruction("constant 27")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=77}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@107 // 10637
D=A // 10638
@SP // 10639
AM=M+1 // 10640
A=A-1 // 10641
M=D // 10642
@3 // 10643
D=A // 10644
@SP // 10645
AM=M+1 // 10646
A=A-1 // 10647
M=D // 10648
@3 // 10649
D=A // 10650
@SP // 10651
AM=M+1 // 10652
A=A-1 // 10653
M=D // 10654
@3 // 10655
D=A // 10656
@SP // 10657
AM=M+1 // 10658
A=A-1 // 10659
M=D // 10660
@51 // 10661
D=A // 10662
@SP // 10663
AM=M+1 // 10664
A=A-1 // 10665
M=D // 10666
@27 // 10667
D=A // 10668
@SP // 10669
AM=M+1 // 10670
A=A-1 // 10671
M=D // 10672
@15 // 10673
D=A // 10674
@SP // 10675
AM=M+1 // 10676
A=A-1 // 10677
M=D // 10678
@15 // 10679
D=A // 10680
@SP // 10681
AM=M+1 // 10682
A=A-1 // 10683
M=D // 10684
@27 // 10685
D=A // 10686
@SP // 10687
AM=M+1 // 10688
A=A-1 // 10689
M=D // 10690
@51 // 10691
D=A // 10692
@SP // 10693
AM=M+1 // 10694
A=A-1 // 10695
M=D // 10696
@SP // 10697
AM=M+1 // 10698
A=A-1 // 10699
M=0 // 10700
@SP // 10701
AM=M+1 // 10702
A=A-1 // 10703
M=0 // 10704
// call Output.create
@17 // 10705
D=A // 10706
@14 // 10707
M=D // 10708
@Output.create // 10709
D=A // 10710
@13 // 10711
M=D // 10712
@Output.initMap.ret.77 // 10713
D=A // 10714
@CALL // 10715
0;JMP // 10716
(Output.initMap.ret.77)
@SP // 10717
AM=M-1 // 10718
D=M // 10719
@5 // 10720
M=D // 10721

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 108")
//          arg[1]:
//              PushInstruction("constant 14")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 12")
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
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=78}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@108 // 10722
D=A // 10723
@SP // 10724
AM=M+1 // 10725
A=A-1 // 10726
M=D // 10727
@14 // 10728
D=A // 10729
@SP // 10730
AM=M+1 // 10731
A=A-1 // 10732
M=D // 10733
@12 // 10734
D=A // 10735
@SP // 10736
AM=M+1 // 10737
A=A-1 // 10738
M=D // 10739
@12 // 10740
D=A // 10741
@SP // 10742
AM=M+1 // 10743
A=A-1 // 10744
M=D // 10745
@12 // 10746
D=A // 10747
@SP // 10748
AM=M+1 // 10749
A=A-1 // 10750
M=D // 10751
@12 // 10752
D=A // 10753
@SP // 10754
AM=M+1 // 10755
A=A-1 // 10756
M=D // 10757
@12 // 10758
D=A // 10759
@SP // 10760
AM=M+1 // 10761
A=A-1 // 10762
M=D // 10763
@12 // 10764
D=A // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=D // 10769
@12 // 10770
D=A // 10771
@SP // 10772
AM=M+1 // 10773
A=A-1 // 10774
M=D // 10775
@30 // 10776
D=A // 10777
@SP // 10778
AM=M+1 // 10779
A=A-1 // 10780
M=D // 10781
@SP // 10782
AM=M+1 // 10783
A=A-1 // 10784
M=0 // 10785
@SP // 10786
AM=M+1 // 10787
A=A-1 // 10788
M=0 // 10789
// call Output.create
@17 // 10790
D=A // 10791
@14 // 10792
M=D // 10793
@Output.create // 10794
D=A // 10795
@13 // 10796
M=D // 10797
@Output.initMap.ret.78 // 10798
D=A // 10799
@CALL // 10800
0;JMP // 10801
(Output.initMap.ret.78)
@SP // 10802
AM=M-1 // 10803
D=M // 10804
@5 // 10805
M=D // 10806

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 109")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 29")
//          arg[5]:
//              PushInstruction("constant 63")
//          arg[6]:
//              PushInstruction("constant 43")
//          arg[7]:
//              PushInstruction("constant 43")
//          arg[8]:
//              PushInstruction("constant 43")
//          arg[9]:
//              PushInstruction("constant 43")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=79}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@109 // 10807
D=A // 10808
@SP // 10809
AM=M+1 // 10810
A=A-1 // 10811
M=D // 10812
@SP // 10813
AM=M+1 // 10814
A=A-1 // 10815
M=0 // 10816
@SP // 10817
AM=M+1 // 10818
A=A-1 // 10819
M=0 // 10820
@SP // 10821
AM=M+1 // 10822
A=A-1 // 10823
M=0 // 10824
@29 // 10825
D=A // 10826
@SP // 10827
AM=M+1 // 10828
A=A-1 // 10829
M=D // 10830
@63 // 10831
D=A // 10832
@SP // 10833
AM=M+1 // 10834
A=A-1 // 10835
M=D // 10836
@43 // 10837
D=A // 10838
@SP // 10839
AM=M+1 // 10840
A=A-1 // 10841
M=D // 10842
@43 // 10843
D=A // 10844
@SP // 10845
AM=M+1 // 10846
A=A-1 // 10847
M=D // 10848
@43 // 10849
D=A // 10850
@SP // 10851
AM=M+1 // 10852
A=A-1 // 10853
M=D // 10854
@43 // 10855
D=A // 10856
@SP // 10857
AM=M+1 // 10858
A=A-1 // 10859
M=D // 10860
@SP // 10861
AM=M+1 // 10862
A=A-1 // 10863
M=0 // 10864
@SP // 10865
AM=M+1 // 10866
A=A-1 // 10867
M=0 // 10868
// call Output.create
@17 // 10869
D=A // 10870
@14 // 10871
M=D // 10872
@Output.create // 10873
D=A // 10874
@13 // 10875
M=D // 10876
@Output.initMap.ret.79 // 10877
D=A // 10878
@CALL // 10879
0;JMP // 10880
(Output.initMap.ret.79)
@SP // 10881
AM=M-1 // 10882
D=M // 10883
@5 // 10884
M=D // 10885

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 110")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 29")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=80}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@110 // 10886
D=A // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=D // 10891
@SP // 10892
AM=M+1 // 10893
A=A-1 // 10894
M=0 // 10895
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=0 // 10899
@SP // 10900
AM=M+1 // 10901
A=A-1 // 10902
M=0 // 10903
@29 // 10904
D=A // 10905
@SP // 10906
AM=M+1 // 10907
A=A-1 // 10908
M=D // 10909
@51 // 10910
D=A // 10911
@SP // 10912
AM=M+1 // 10913
A=A-1 // 10914
M=D // 10915
@51 // 10916
D=A // 10917
@SP // 10918
AM=M+1 // 10919
A=A-1 // 10920
M=D // 10921
@51 // 10922
D=A // 10923
@SP // 10924
AM=M+1 // 10925
A=A-1 // 10926
M=D // 10927
@51 // 10928
D=A // 10929
@SP // 10930
AM=M+1 // 10931
A=A-1 // 10932
M=D // 10933
@51 // 10934
D=A // 10935
@SP // 10936
AM=M+1 // 10937
A=A-1 // 10938
M=D // 10939
@SP // 10940
AM=M+1 // 10941
A=A-1 // 10942
M=0 // 10943
@SP // 10944
AM=M+1 // 10945
A=A-1 // 10946
M=0 // 10947
// call Output.create
@17 // 10948
D=A // 10949
@14 // 10950
M=D // 10951
@Output.create // 10952
D=A // 10953
@13 // 10954
M=D // 10955
@Output.initMap.ret.80 // 10956
D=A // 10957
@CALL // 10958
0;JMP // 10959
(Output.initMap.ret.80)
@SP // 10960
AM=M-1 // 10961
D=M // 10962
@5 // 10963
M=D // 10964

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 111")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 51")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=81}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@111 // 10965
D=A // 10966
@SP // 10967
AM=M+1 // 10968
A=A-1 // 10969
M=D // 10970
@SP // 10971
AM=M+1 // 10972
A=A-1 // 10973
M=0 // 10974
@SP // 10975
AM=M+1 // 10976
A=A-1 // 10977
M=0 // 10978
@SP // 10979
AM=M+1 // 10980
A=A-1 // 10981
M=0 // 10982
@30 // 10983
D=A // 10984
@SP // 10985
AM=M+1 // 10986
A=A-1 // 10987
M=D // 10988
@51 // 10989
D=A // 10990
@SP // 10991
AM=M+1 // 10992
A=A-1 // 10993
M=D // 10994
@51 // 10995
D=A // 10996
@SP // 10997
AM=M+1 // 10998
A=A-1 // 10999
M=D // 11000
@51 // 11001
D=A // 11002
@SP // 11003
AM=M+1 // 11004
A=A-1 // 11005
M=D // 11006
@51 // 11007
D=A // 11008
@SP // 11009
AM=M+1 // 11010
A=A-1 // 11011
M=D // 11012
@30 // 11013
D=A // 11014
@SP // 11015
AM=M+1 // 11016
A=A-1 // 11017
M=D // 11018
@SP // 11019
AM=M+1 // 11020
A=A-1 // 11021
M=0 // 11022
@SP // 11023
AM=M+1 // 11024
A=A-1 // 11025
M=0 // 11026
// call Output.create
@17 // 11027
D=A // 11028
@14 // 11029
M=D // 11030
@Output.create // 11031
D=A // 11032
@13 // 11033
M=D // 11034
@Output.initMap.ret.81 // 11035
D=A // 11036
@CALL // 11037
0;JMP // 11038
(Output.initMap.ret.81)
@SP // 11039
AM=M-1 // 11040
D=M // 11041
@5 // 11042
M=D // 11043

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 112")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 31")
//          arg[9]:
//              PushInstruction("constant 3")
//          arg[10]:
//              PushInstruction("constant 3")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=82}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@112 // 11044
D=A // 11045
@SP // 11046
AM=M+1 // 11047
A=A-1 // 11048
M=D // 11049
@SP // 11050
AM=M+1 // 11051
A=A-1 // 11052
M=0 // 11053
@SP // 11054
AM=M+1 // 11055
A=A-1 // 11056
M=0 // 11057
@SP // 11058
AM=M+1 // 11059
A=A-1 // 11060
M=0 // 11061
@30 // 11062
D=A // 11063
@SP // 11064
AM=M+1 // 11065
A=A-1 // 11066
M=D // 11067
@51 // 11068
D=A // 11069
@SP // 11070
AM=M+1 // 11071
A=A-1 // 11072
M=D // 11073
@51 // 11074
D=A // 11075
@SP // 11076
AM=M+1 // 11077
A=A-1 // 11078
M=D // 11079
@51 // 11080
D=A // 11081
@SP // 11082
AM=M+1 // 11083
A=A-1 // 11084
M=D // 11085
@31 // 11086
D=A // 11087
@SP // 11088
AM=M+1 // 11089
A=A-1 // 11090
M=D // 11091
@3 // 11092
D=A // 11093
@SP // 11094
AM=M+1 // 11095
A=A-1 // 11096
M=D // 11097
@3 // 11098
D=A // 11099
@SP // 11100
AM=M+1 // 11101
A=A-1 // 11102
M=D // 11103
@SP // 11104
AM=M+1 // 11105
A=A-1 // 11106
M=0 // 11107
// call Output.create
@17 // 11108
D=A // 11109
@14 // 11110
M=D // 11111
@Output.create // 11112
D=A // 11113
@13 // 11114
M=D // 11115
@Output.initMap.ret.82 // 11116
D=A // 11117
@CALL // 11118
0;JMP // 11119
(Output.initMap.ret.82)
@SP // 11120
AM=M-1 // 11121
D=M // 11122
@5 // 11123
M=D // 11124

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 113")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 51")
//          arg[8]:
//              PushInstruction("constant 62")
//          arg[9]:
//              PushInstruction("constant 48")
//          arg[10]:
//              PushInstruction("constant 48")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=83}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@113 // 11125
D=A // 11126
@SP // 11127
AM=M+1 // 11128
A=A-1 // 11129
M=D // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=0 // 11134
@SP // 11135
AM=M+1 // 11136
A=A-1 // 11137
M=0 // 11138
@SP // 11139
AM=M+1 // 11140
A=A-1 // 11141
M=0 // 11142
@30 // 11143
D=A // 11144
@SP // 11145
AM=M+1 // 11146
A=A-1 // 11147
M=D // 11148
@51 // 11149
D=A // 11150
@SP // 11151
AM=M+1 // 11152
A=A-1 // 11153
M=D // 11154
@51 // 11155
D=A // 11156
@SP // 11157
AM=M+1 // 11158
A=A-1 // 11159
M=D // 11160
@51 // 11161
D=A // 11162
@SP // 11163
AM=M+1 // 11164
A=A-1 // 11165
M=D // 11166
@62 // 11167
D=A // 11168
@SP // 11169
AM=M+1 // 11170
A=A-1 // 11171
M=D // 11172
@48 // 11173
D=A // 11174
@SP // 11175
AM=M+1 // 11176
A=A-1 // 11177
M=D // 11178
@48 // 11179
D=A // 11180
@SP // 11181
AM=M+1 // 11182
A=A-1 // 11183
M=D // 11184
@SP // 11185
AM=M+1 // 11186
A=A-1 // 11187
M=0 // 11188
// call Output.create
@17 // 11189
D=A // 11190
@14 // 11191
M=D // 11192
@Output.create // 11193
D=A // 11194
@13 // 11195
M=D // 11196
@Output.initMap.ret.83 // 11197
D=A // 11198
@CALL // 11199
0;JMP // 11200
(Output.initMap.ret.83)
@SP // 11201
AM=M-1 // 11202
D=M // 11203
@5 // 11204
M=D // 11205

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 114")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 29")
//          arg[5]:
//              PushInstruction("constant 55")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 3")
//          arg[8]:
//              PushInstruction("constant 3")
//          arg[9]:
//              PushInstruction("constant 7")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=84}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@114 // 11206
D=A // 11207
@SP // 11208
AM=M+1 // 11209
A=A-1 // 11210
M=D // 11211
@SP // 11212
AM=M+1 // 11213
A=A-1 // 11214
M=0 // 11215
@SP // 11216
AM=M+1 // 11217
A=A-1 // 11218
M=0 // 11219
@SP // 11220
AM=M+1 // 11221
A=A-1 // 11222
M=0 // 11223
@29 // 11224
D=A // 11225
@SP // 11226
AM=M+1 // 11227
A=A-1 // 11228
M=D // 11229
@55 // 11230
D=A // 11231
@SP // 11232
AM=M+1 // 11233
A=A-1 // 11234
M=D // 11235
@51 // 11236
D=A // 11237
@SP // 11238
AM=M+1 // 11239
A=A-1 // 11240
M=D // 11241
@3 // 11242
D=A // 11243
@SP // 11244
AM=M+1 // 11245
A=A-1 // 11246
M=D // 11247
@3 // 11248
D=A // 11249
@SP // 11250
AM=M+1 // 11251
A=A-1 // 11252
M=D // 11253
@7 // 11254
D=A // 11255
@SP // 11256
AM=M+1 // 11257
A=A-1 // 11258
M=D // 11259
@SP // 11260
AM=M+1 // 11261
A=A-1 // 11262
M=0 // 11263
@SP // 11264
AM=M+1 // 11265
A=A-1 // 11266
M=0 // 11267
// call Output.create
@17 // 11268
D=A // 11269
@14 // 11270
M=D // 11271
@Output.create // 11272
D=A // 11273
@13 // 11274
M=D // 11275
@Output.initMap.ret.84 // 11276
D=A // 11277
@CALL // 11278
0;JMP // 11279
(Output.initMap.ret.84)
@SP // 11280
AM=M-1 // 11281
D=M // 11282
@5 // 11283
M=D // 11284

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 115")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 30")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 6")
//          arg[7]:
//              PushInstruction("constant 24")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 30")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=85}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@115 // 11285
D=A // 11286
@SP // 11287
AM=M+1 // 11288
A=A-1 // 11289
M=D // 11290
@SP // 11291
AM=M+1 // 11292
A=A-1 // 11293
M=0 // 11294
@SP // 11295
AM=M+1 // 11296
A=A-1 // 11297
M=0 // 11298
@SP // 11299
AM=M+1 // 11300
A=A-1 // 11301
M=0 // 11302
@30 // 11303
D=A // 11304
@SP // 11305
AM=M+1 // 11306
A=A-1 // 11307
M=D // 11308
@51 // 11309
D=A // 11310
@SP // 11311
AM=M+1 // 11312
A=A-1 // 11313
M=D // 11314
@6 // 11315
D=A // 11316
@SP // 11317
AM=M+1 // 11318
A=A-1 // 11319
M=D // 11320
@24 // 11321
D=A // 11322
@SP // 11323
AM=M+1 // 11324
A=A-1 // 11325
M=D // 11326
@51 // 11327
D=A // 11328
@SP // 11329
AM=M+1 // 11330
A=A-1 // 11331
M=D // 11332
@30 // 11333
D=A // 11334
@SP // 11335
AM=M+1 // 11336
A=A-1 // 11337
M=D // 11338
@SP // 11339
AM=M+1 // 11340
A=A-1 // 11341
M=0 // 11342
@SP // 11343
AM=M+1 // 11344
A=A-1 // 11345
M=0 // 11346
// call Output.create
@17 // 11347
D=A // 11348
@14 // 11349
M=D // 11350
@Output.create // 11351
D=A // 11352
@13 // 11353
M=D // 11354
@Output.initMap.ret.85 // 11355
D=A // 11356
@CALL // 11357
0;JMP // 11358
(Output.initMap.ret.85)
@SP // 11359
AM=M-1 // 11360
D=M // 11361
@5 // 11362
M=D // 11363

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 116")
//          arg[1]:
//              PushInstruction("constant 4")
//          arg[2]:
//              PushInstruction("constant 6")
//          arg[3]:
//              PushInstruction("constant 6")
//          arg[4]:
//              PushInstruction("constant 15")
//          arg[5]:
//              PushInstruction("constant 6")
//          arg[6]:
//              PushInstruction("constant 6")
//          arg[7]:
//              PushInstruction("constant 6")
//          arg[8]:
//              PushInstruction("constant 54")
//          arg[9]:
//              PushInstruction("constant 28")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=86}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@116 // 11364
D=A // 11365
@SP // 11366
AM=M+1 // 11367
A=A-1 // 11368
M=D // 11369
@4 // 11370
D=A // 11371
@SP // 11372
AM=M+1 // 11373
A=A-1 // 11374
M=D // 11375
@6 // 11376
D=A // 11377
@SP // 11378
AM=M+1 // 11379
A=A-1 // 11380
M=D // 11381
@6 // 11382
D=A // 11383
@SP // 11384
AM=M+1 // 11385
A=A-1 // 11386
M=D // 11387
@15 // 11388
D=A // 11389
@SP // 11390
AM=M+1 // 11391
A=A-1 // 11392
M=D // 11393
@6 // 11394
D=A // 11395
@SP // 11396
AM=M+1 // 11397
A=A-1 // 11398
M=D // 11399
@6 // 11400
D=A // 11401
@SP // 11402
AM=M+1 // 11403
A=A-1 // 11404
M=D // 11405
@6 // 11406
D=A // 11407
@SP // 11408
AM=M+1 // 11409
A=A-1 // 11410
M=D // 11411
@54 // 11412
D=A // 11413
@SP // 11414
AM=M+1 // 11415
A=A-1 // 11416
M=D // 11417
@28 // 11418
D=A // 11419
@SP // 11420
AM=M+1 // 11421
A=A-1 // 11422
M=D // 11423
@SP // 11424
AM=M+1 // 11425
A=A-1 // 11426
M=0 // 11427
@SP // 11428
AM=M+1 // 11429
A=A-1 // 11430
M=0 // 11431
// call Output.create
@17 // 11432
D=A // 11433
@14 // 11434
M=D // 11435
@Output.create // 11436
D=A // 11437
@13 // 11438
M=D // 11439
@Output.initMap.ret.86 // 11440
D=A // 11441
@CALL // 11442
0;JMP // 11443
(Output.initMap.ret.86)
@SP // 11444
AM=M-1 // 11445
D=M // 11446
@5 // 11447
M=D // 11448

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 117")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 27")
//          arg[5]:
//              PushInstruction("constant 27")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=87}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@117 // 11449
D=A // 11450
@SP // 11451
AM=M+1 // 11452
A=A-1 // 11453
M=D // 11454
@SP // 11455
AM=M+1 // 11456
A=A-1 // 11457
M=0 // 11458
@SP // 11459
AM=M+1 // 11460
A=A-1 // 11461
M=0 // 11462
@SP // 11463
AM=M+1 // 11464
A=A-1 // 11465
M=0 // 11466
@27 // 11467
D=A // 11468
@SP // 11469
AM=M+1 // 11470
A=A-1 // 11471
M=D // 11472
@27 // 11473
D=A // 11474
@SP // 11475
AM=M+1 // 11476
A=A-1 // 11477
M=D // 11478
@27 // 11479
D=A // 11480
@SP // 11481
AM=M+1 // 11482
A=A-1 // 11483
M=D // 11484
@27 // 11485
D=A // 11486
@SP // 11487
AM=M+1 // 11488
A=A-1 // 11489
M=D // 11490
@27 // 11491
D=A // 11492
@SP // 11493
AM=M+1 // 11494
A=A-1 // 11495
M=D // 11496
@54 // 11497
D=A // 11498
@SP // 11499
AM=M+1 // 11500
A=A-1 // 11501
M=D // 11502
@SP // 11503
AM=M+1 // 11504
A=A-1 // 11505
M=0 // 11506
@SP // 11507
AM=M+1 // 11508
A=A-1 // 11509
M=0 // 11510
// call Output.create
@17 // 11511
D=A // 11512
@14 // 11513
M=D // 11514
@Output.create // 11515
D=A // 11516
@13 // 11517
M=D // 11518
@Output.initMap.ret.87 // 11519
D=A // 11520
@CALL // 11521
0;JMP // 11522
(Output.initMap.ret.87)
@SP // 11523
AM=M-1 // 11524
D=M // 11525
@5 // 11526
M=D // 11527

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 118")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=88}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@118 // 11528
D=A // 11529
@SP // 11530
AM=M+1 // 11531
A=A-1 // 11532
M=D // 11533
@SP // 11534
AM=M+1 // 11535
A=A-1 // 11536
M=0 // 11537
@SP // 11538
AM=M+1 // 11539
A=A-1 // 11540
M=0 // 11541
@SP // 11542
AM=M+1 // 11543
A=A-1 // 11544
M=0 // 11545
@51 // 11546
D=A // 11547
@SP // 11548
AM=M+1 // 11549
A=A-1 // 11550
M=D // 11551
@51 // 11552
D=A // 11553
@SP // 11554
AM=M+1 // 11555
A=A-1 // 11556
M=D // 11557
@51 // 11558
D=A // 11559
@SP // 11560
AM=M+1 // 11561
A=A-1 // 11562
M=D // 11563
@51 // 11564
D=A // 11565
@SP // 11566
AM=M+1 // 11567
A=A-1 // 11568
M=D // 11569
@30 // 11570
D=A // 11571
@SP // 11572
AM=M+1 // 11573
A=A-1 // 11574
M=D // 11575
@12 // 11576
D=A // 11577
@SP // 11578
AM=M+1 // 11579
A=A-1 // 11580
M=D // 11581
@SP // 11582
AM=M+1 // 11583
A=A-1 // 11584
M=0 // 11585
@SP // 11586
AM=M+1 // 11587
A=A-1 // 11588
M=0 // 11589
// call Output.create
@17 // 11590
D=A // 11591
@14 // 11592
M=D // 11593
@Output.create // 11594
D=A // 11595
@13 // 11596
M=D // 11597
@Output.initMap.ret.88 // 11598
D=A // 11599
@CALL // 11600
0;JMP // 11601
(Output.initMap.ret.88)
@SP // 11602
AM=M-1 // 11603
D=M // 11604
@5 // 11605
M=D // 11606

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 119")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 63")
//          arg[8]:
//              PushInstruction("constant 63")
//          arg[9]:
//              PushInstruction("constant 18")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=89}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@119 // 11607
D=A // 11608
@SP // 11609
AM=M+1 // 11610
A=A-1 // 11611
M=D // 11612
@SP // 11613
AM=M+1 // 11614
A=A-1 // 11615
M=0 // 11616
@SP // 11617
AM=M+1 // 11618
A=A-1 // 11619
M=0 // 11620
@SP // 11621
AM=M+1 // 11622
A=A-1 // 11623
M=0 // 11624
@51 // 11625
D=A // 11626
@SP // 11627
AM=M+1 // 11628
A=A-1 // 11629
M=D // 11630
@51 // 11631
D=A // 11632
@SP // 11633
AM=M+1 // 11634
A=A-1 // 11635
M=D // 11636
@51 // 11637
D=A // 11638
@SP // 11639
AM=M+1 // 11640
A=A-1 // 11641
M=D // 11642
@63 // 11643
D=A // 11644
@SP // 11645
AM=M+1 // 11646
A=A-1 // 11647
M=D // 11648
@63 // 11649
D=A // 11650
@SP // 11651
AM=M+1 // 11652
A=A-1 // 11653
M=D // 11654
@18 // 11655
D=A // 11656
@SP // 11657
AM=M+1 // 11658
A=A-1 // 11659
M=D // 11660
@SP // 11661
AM=M+1 // 11662
A=A-1 // 11663
M=0 // 11664
@SP // 11665
AM=M+1 // 11666
A=A-1 // 11667
M=0 // 11668
// call Output.create
@17 // 11669
D=A // 11670
@14 // 11671
M=D // 11672
@Output.create // 11673
D=A // 11674
@13 // 11675
M=D // 11676
@Output.initMap.ret.89 // 11677
D=A // 11678
@CALL // 11679
0;JMP // 11680
(Output.initMap.ret.89)
@SP // 11681
AM=M-1 // 11682
D=M // 11683
@5 // 11684
M=D // 11685

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 120")
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
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 30")
//          arg[9]:
//              PushInstruction("constant 51")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=90}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@120 // 11686
D=A // 11687
@SP // 11688
AM=M+1 // 11689
A=A-1 // 11690
M=D // 11691
@SP // 11692
AM=M+1 // 11693
A=A-1 // 11694
M=0 // 11695
@SP // 11696
AM=M+1 // 11697
A=A-1 // 11698
M=0 // 11699
@SP // 11700
AM=M+1 // 11701
A=A-1 // 11702
M=0 // 11703
@51 // 11704
D=A // 11705
@SP // 11706
AM=M+1 // 11707
A=A-1 // 11708
M=D // 11709
@30 // 11710
D=A // 11711
@SP // 11712
AM=M+1 // 11713
A=A-1 // 11714
M=D // 11715
@12 // 11716
D=A // 11717
@SP // 11718
AM=M+1 // 11719
A=A-1 // 11720
M=D // 11721
@12 // 11722
D=A // 11723
@SP // 11724
AM=M+1 // 11725
A=A-1 // 11726
M=D // 11727
@30 // 11728
D=A // 11729
@SP // 11730
AM=M+1 // 11731
A=A-1 // 11732
M=D // 11733
@51 // 11734
D=A // 11735
@SP // 11736
AM=M+1 // 11737
A=A-1 // 11738
M=D // 11739
@SP // 11740
AM=M+1 // 11741
A=A-1 // 11742
M=0 // 11743
@SP // 11744
AM=M+1 // 11745
A=A-1 // 11746
M=0 // 11747
// call Output.create
@17 // 11748
D=A // 11749
@14 // 11750
M=D // 11751
@Output.create // 11752
D=A // 11753
@13 // 11754
M=D // 11755
@Output.initMap.ret.90 // 11756
D=A // 11757
@CALL // 11758
0;JMP // 11759
(Output.initMap.ret.90)
@SP // 11760
AM=M-1 // 11761
D=M // 11762
@5 // 11763
M=D // 11764

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 121")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 51")
//          arg[5]:
//              PushInstruction("constant 51")
//          arg[6]:
//              PushInstruction("constant 51")
//          arg[7]:
//              PushInstruction("constant 62")
//          arg[8]:
//              PushInstruction("constant 48")
//          arg[9]:
//              PushInstruction("constant 24")
//          arg[10]:
//              PushInstruction("constant 15")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=91}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@121 // 11765
D=A // 11766
@SP // 11767
AM=M+1 // 11768
A=A-1 // 11769
M=D // 11770
@SP // 11771
AM=M+1 // 11772
A=A-1 // 11773
M=0 // 11774
@SP // 11775
AM=M+1 // 11776
A=A-1 // 11777
M=0 // 11778
@SP // 11779
AM=M+1 // 11780
A=A-1 // 11781
M=0 // 11782
@51 // 11783
D=A // 11784
@SP // 11785
AM=M+1 // 11786
A=A-1 // 11787
M=D // 11788
@51 // 11789
D=A // 11790
@SP // 11791
AM=M+1 // 11792
A=A-1 // 11793
M=D // 11794
@51 // 11795
D=A // 11796
@SP // 11797
AM=M+1 // 11798
A=A-1 // 11799
M=D // 11800
@62 // 11801
D=A // 11802
@SP // 11803
AM=M+1 // 11804
A=A-1 // 11805
M=D // 11806
@48 // 11807
D=A // 11808
@SP // 11809
AM=M+1 // 11810
A=A-1 // 11811
M=D // 11812
@24 // 11813
D=A // 11814
@SP // 11815
AM=M+1 // 11816
A=A-1 // 11817
M=D // 11818
@15 // 11819
D=A // 11820
@SP // 11821
AM=M+1 // 11822
A=A-1 // 11823
M=D // 11824
@SP // 11825
AM=M+1 // 11826
A=A-1 // 11827
M=0 // 11828
// call Output.create
@17 // 11829
D=A // 11830
@14 // 11831
M=D // 11832
@Output.create // 11833
D=A // 11834
@13 // 11835
M=D // 11836
@Output.initMap.ret.91 // 11837
D=A // 11838
@CALL // 11839
0;JMP // 11840
(Output.initMap.ret.91)
@SP // 11841
AM=M-1 // 11842
D=M // 11843
@5 // 11844
M=D // 11845

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 122")
//          arg[1]:
//              PushInstruction("constant 0")
//          arg[2]:
//              PushInstruction("constant 0")
//          arg[3]:
//              PushInstruction("constant 0")
//          arg[4]:
//              PushInstruction("constant 63")
//          arg[5]:
//              PushInstruction("constant 27")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 6")
//          arg[8]:
//              PushInstruction("constant 51")
//          arg[9]:
//              PushInstruction("constant 63")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=92}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@122 // 11846
D=A // 11847
@SP // 11848
AM=M+1 // 11849
A=A-1 // 11850
M=D // 11851
@SP // 11852
AM=M+1 // 11853
A=A-1 // 11854
M=0 // 11855
@SP // 11856
AM=M+1 // 11857
A=A-1 // 11858
M=0 // 11859
@SP // 11860
AM=M+1 // 11861
A=A-1 // 11862
M=0 // 11863
@63 // 11864
D=A // 11865
@SP // 11866
AM=M+1 // 11867
A=A-1 // 11868
M=D // 11869
@27 // 11870
D=A // 11871
@SP // 11872
AM=M+1 // 11873
A=A-1 // 11874
M=D // 11875
@12 // 11876
D=A // 11877
@SP // 11878
AM=M+1 // 11879
A=A-1 // 11880
M=D // 11881
@6 // 11882
D=A // 11883
@SP // 11884
AM=M+1 // 11885
A=A-1 // 11886
M=D // 11887
@51 // 11888
D=A // 11889
@SP // 11890
AM=M+1 // 11891
A=A-1 // 11892
M=D // 11893
@63 // 11894
D=A // 11895
@SP // 11896
AM=M+1 // 11897
A=A-1 // 11898
M=D // 11899
@SP // 11900
AM=M+1 // 11901
A=A-1 // 11902
M=0 // 11903
@SP // 11904
AM=M+1 // 11905
A=A-1 // 11906
M=0 // 11907
// call Output.create
@17 // 11908
D=A // 11909
@14 // 11910
M=D // 11911
@Output.create // 11912
D=A // 11913
@13 // 11914
M=D // 11915
@Output.initMap.ret.92 // 11916
D=A // 11917
@CALL // 11918
0;JMP // 11919
(Output.initMap.ret.92)
@SP // 11920
AM=M-1 // 11921
D=M // 11922
@5 // 11923
M=D // 11924

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 123")
//          arg[1]:
//              PushInstruction("constant 56")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 12")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 7")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 56")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=93}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@123 // 11925
D=A // 11926
@SP // 11927
AM=M+1 // 11928
A=A-1 // 11929
M=D // 11930
@56 // 11931
D=A // 11932
@SP // 11933
AM=M+1 // 11934
A=A-1 // 11935
M=D // 11936
@12 // 11937
D=A // 11938
@SP // 11939
AM=M+1 // 11940
A=A-1 // 11941
M=D // 11942
@12 // 11943
D=A // 11944
@SP // 11945
AM=M+1 // 11946
A=A-1 // 11947
M=D // 11948
@12 // 11949
D=A // 11950
@SP // 11951
AM=M+1 // 11952
A=A-1 // 11953
M=D // 11954
@7 // 11955
D=A // 11956
@SP // 11957
AM=M+1 // 11958
A=A-1 // 11959
M=D // 11960
@12 // 11961
D=A // 11962
@SP // 11963
AM=M+1 // 11964
A=A-1 // 11965
M=D // 11966
@12 // 11967
D=A // 11968
@SP // 11969
AM=M+1 // 11970
A=A-1 // 11971
M=D // 11972
@12 // 11973
D=A // 11974
@SP // 11975
AM=M+1 // 11976
A=A-1 // 11977
M=D // 11978
@56 // 11979
D=A // 11980
@SP // 11981
AM=M+1 // 11982
A=A-1 // 11983
M=D // 11984
@SP // 11985
AM=M+1 // 11986
A=A-1 // 11987
M=0 // 11988
@SP // 11989
AM=M+1 // 11990
A=A-1 // 11991
M=0 // 11992
// call Output.create
@17 // 11993
D=A // 11994
@14 // 11995
M=D // 11996
@Output.create // 11997
D=A // 11998
@13 // 11999
M=D // 12000
@Output.initMap.ret.93 // 12001
D=A // 12002
@CALL // 12003
0;JMP // 12004
(Output.initMap.ret.93)
@SP // 12005
AM=M-1 // 12006
D=M // 12007
@5 // 12008
M=D // 12009

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 124")
//          arg[1]:
//              PushInstruction("constant 12")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 12")
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
//              PushInstruction("constant 12")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=94}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@124 // 12010
D=A // 12011
@SP // 12012
AM=M+1 // 12013
A=A-1 // 12014
M=D // 12015
@12 // 12016
D=A // 12017
@SP // 12018
AM=M+1 // 12019
A=A-1 // 12020
M=D // 12021
@12 // 12022
D=A // 12023
@SP // 12024
AM=M+1 // 12025
A=A-1 // 12026
M=D // 12027
@12 // 12028
D=A // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=D // 12033
@12 // 12034
D=A // 12035
@SP // 12036
AM=M+1 // 12037
A=A-1 // 12038
M=D // 12039
@12 // 12040
D=A // 12041
@SP // 12042
AM=M+1 // 12043
A=A-1 // 12044
M=D // 12045
@12 // 12046
D=A // 12047
@SP // 12048
AM=M+1 // 12049
A=A-1 // 12050
M=D // 12051
@12 // 12052
D=A // 12053
@SP // 12054
AM=M+1 // 12055
A=A-1 // 12056
M=D // 12057
@12 // 12058
D=A // 12059
@SP // 12060
AM=M+1 // 12061
A=A-1 // 12062
M=D // 12063
@12 // 12064
D=A // 12065
@SP // 12066
AM=M+1 // 12067
A=A-1 // 12068
M=D // 12069
@SP // 12070
AM=M+1 // 12071
A=A-1 // 12072
M=0 // 12073
@SP // 12074
AM=M+1 // 12075
A=A-1 // 12076
M=0 // 12077
// call Output.create
@17 // 12078
D=A // 12079
@14 // 12080
M=D // 12081
@Output.create // 12082
D=A // 12083
@13 // 12084
M=D // 12085
@Output.initMap.ret.94 // 12086
D=A // 12087
@CALL // 12088
0;JMP // 12089
(Output.initMap.ret.94)
@SP // 12090
AM=M-1 // 12091
D=M // 12092
@5 // 12093
M=D // 12094

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 125")
//          arg[1]:
//              PushInstruction("constant 7")
//          arg[2]:
//              PushInstruction("constant 12")
//          arg[3]:
//              PushInstruction("constant 12")
//          arg[4]:
//              PushInstruction("constant 12")
//          arg[5]:
//              PushInstruction("constant 56")
//          arg[6]:
//              PushInstruction("constant 12")
//          arg[7]:
//              PushInstruction("constant 12")
//          arg[8]:
//              PushInstruction("constant 12")
//          arg[9]:
//              PushInstruction("constant 7")
//          arg[10]:
//              PushInstruction("constant 0")
//          arg[11]:
//              PushInstruction("constant 0")
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=95}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@125 // 12095
D=A // 12096
@SP // 12097
AM=M+1 // 12098
A=A-1 // 12099
M=D // 12100
@7 // 12101
D=A // 12102
@SP // 12103
AM=M+1 // 12104
A=A-1 // 12105
M=D // 12106
@12 // 12107
D=A // 12108
@SP // 12109
AM=M+1 // 12110
A=A-1 // 12111
M=D // 12112
@12 // 12113
D=A // 12114
@SP // 12115
AM=M+1 // 12116
A=A-1 // 12117
M=D // 12118
@12 // 12119
D=A // 12120
@SP // 12121
AM=M+1 // 12122
A=A-1 // 12123
M=D // 12124
@56 // 12125
D=A // 12126
@SP // 12127
AM=M+1 // 12128
A=A-1 // 12129
M=D // 12130
@12 // 12131
D=A // 12132
@SP // 12133
AM=M+1 // 12134
A=A-1 // 12135
M=D // 12136
@12 // 12137
D=A // 12138
@SP // 12139
AM=M+1 // 12140
A=A-1 // 12141
M=D // 12142
@12 // 12143
D=A // 12144
@SP // 12145
AM=M+1 // 12146
A=A-1 // 12147
M=D // 12148
@7 // 12149
D=A // 12150
@SP // 12151
AM=M+1 // 12152
A=A-1 // 12153
M=D // 12154
@SP // 12155
AM=M+1 // 12156
A=A-1 // 12157
M=0 // 12158
@SP // 12159
AM=M+1 // 12160
A=A-1 // 12161
M=0 // 12162
// call Output.create
@17 // 12163
D=A // 12164
@14 // 12165
M=D // 12166
@Output.create // 12167
D=A // 12168
@13 // 12169
M=D // 12170
@Output.initMap.ret.95 // 12171
D=A // 12172
@CALL // 12173
0;JMP // 12174
(Output.initMap.ret.95)
@SP // 12175
AM=M-1 // 12176
D=M // 12177
@5 // 12178
M=D // 12179

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 126")
//          arg[1]:
//              PushInstruction("constant 38")
//          arg[2]:
//              PushInstruction("constant 45")
//          arg[3]:
//              PushInstruction("constant 25")
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
//          call: CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=96}, currentFunction='Output.initMap'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@126 // 12180
D=A // 12181
@SP // 12182
AM=M+1 // 12183
A=A-1 // 12184
M=D // 12185
@38 // 12186
D=A // 12187
@SP // 12188
AM=M+1 // 12189
A=A-1 // 12190
M=D // 12191
@45 // 12192
D=A // 12193
@SP // 12194
AM=M+1 // 12195
A=A-1 // 12196
M=D // 12197
@25 // 12198
D=A // 12199
@SP // 12200
AM=M+1 // 12201
A=A-1 // 12202
M=D // 12203
@SP // 12204
AM=M+1 // 12205
A=A-1 // 12206
M=0 // 12207
@SP // 12208
AM=M+1 // 12209
A=A-1 // 12210
M=0 // 12211
@SP // 12212
AM=M+1 // 12213
A=A-1 // 12214
M=0 // 12215
@SP // 12216
AM=M+1 // 12217
A=A-1 // 12218
M=0 // 12219
@SP // 12220
AM=M+1 // 12221
A=A-1 // 12222
M=0 // 12223
@SP // 12224
AM=M+1 // 12225
A=A-1 // 12226
M=0 // 12227
@SP // 12228
AM=M+1 // 12229
A=A-1 // 12230
M=0 // 12231
@SP // 12232
AM=M+1 // 12233
A=A-1 // 12234
M=0 // 12235
// call Output.create
@17 // 12236
D=A // 12237
@14 // 12238
M=D // 12239
@Output.create // 12240
D=A // 12241
@13 // 12242
M=D // 12243
@Output.initMap.ret.96 // 12244
D=A // 12245
@CALL // 12246
0;JMP // 12247
(Output.initMap.ret.96)
@SP // 12248
AM=M-1 // 12249
D=M // 12250
@5 // 12251
M=D // 12252

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 12253
AM=M+1 // 12254
A=A-1 // 12255
M=0 // 12256

////ReturnInstruction{}
@RETURN // 12257
0;JMP // 12258

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 12259
AM=M+1 // 12260
A=A-1 // 12261
M=0 // 12262

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 11")
//          call: CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@11 // 12263
D=A // 12264
@SP // 12265
AM=M+1 // 12266
A=A-1 // 12267
M=D // 12268
// call Array.new
@6 // 12269
D=A // 12270
@14 // 12271
M=D // 12272
@Array.new // 12273
D=A // 12274
@13 // 12275
M=D // 12276
@Output.create.ret.0 // 12277
D=A // 12278
@CALL // 12279
0;JMP // 12280
(Output.create.ret.0)
@SP // 12281
AM=M-1 // 12282
D=M // 12283
@LCL // 12284
A=M // 12285
M=D // 12286

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("Output.0")
//,
//                  right:
//                      PushInstruction("argument 0")
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

@LCL // 12287
A=M // 12288
D=M // 12289
@THAT // 12290
A=M // 12291
M=D // 12292

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
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

@ARG // 12293
A=M+1 // 12294
D=M // 12295
@THAT // 12296
A=M // 12297
M=D // 12298

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 2")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12299
A=M+1 // 12300
A=A+1 // 12301
D=M // 12302
@THAT // 12303
A=M // 12304
M=D // 12305

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 3")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12306
A=M+1 // 12307
A=A+1 // 12308
A=A+1 // 12309
D=M // 12310
@THAT // 12311
A=M // 12312
M=D // 12313

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 4")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12314
D=M // 12315
@4 // 12316
A=D+A // 12317
D=M // 12318
@THAT // 12319
A=M // 12320
M=D // 12321

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 5")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12322
D=M // 12323
@5 // 12324
A=D+A // 12325
D=M // 12326
@THAT // 12327
A=M // 12328
M=D // 12329

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 6")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12330
D=M // 12331
@6 // 12332
A=D+A // 12333
D=M // 12334
@THAT // 12335
A=M // 12336
M=D // 12337

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 7")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12338
D=M // 12339
@7 // 12340
A=D+A // 12341
D=M // 12342
@THAT // 12343
A=M // 12344
M=D // 12345

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 8")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12346
D=M // 12347
@8 // 12348
A=D+A // 12349
D=M // 12350
@THAT // 12351
A=M // 12352
M=D // 12353

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 9")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12354
D=M // 12355
@9 // 12356
A=D+A // 12357
D=M // 12358
@THAT // 12359
A=M // 12360
M=D // 12361

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 10")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12362
D=M // 12363
@10 // 12364
A=D+A // 12365
D=M // 12366
@THAT // 12367
A=M // 12368
M=D // 12369

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 11")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 12370
D=M // 12371
@11 // 12372
A=D+A // 12373
D=M // 12374
@THAT // 12375
A=M // 12376
M=D // 12377

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 12378
AM=M+1 // 12379
A=A-1 // 12380
M=0 // 12381

////ReturnInstruction{}
@RETURN // 12382
0;JMP // 12383

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

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
//                          PushInstruction("constant 32")
//,
//                      binaryOp: "LT"
//                  ),
//              right:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("argument 0")
//,
//                      right:
//                          PushInstruction("constant 126")
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
//, ifGoto=IfGotoInstruction{label='Output.getMap.IfElse1}}
@ARG // 12384
A=M // 12385
D=M // 12386
@32 // 12387
D=D-A // 12388
@15 // 12389
M=D // 12390
@Output.getMap.LT.3 // 12391
D=A // 12392
@13 // 12393
M=D // 12394
@DO_LT // 12395
0;JMP // 12396
(Output.getMap.LT.3)
@SP // 12397
AM=M+1 // 12398
A=A-1 // 12399
M=D // 12400
@ARG // 12401
A=M // 12402
D=M // 12403
@126 // 12404
D=D-A // 12405
@15 // 12406
M=D // 12407
@Output.getMap.GT.4 // 12408
D=A // 12409
@13 // 12410
M=D // 12411
@DO_GT // 12412
0;JMP // 12413
(Output.getMap.GT.4)
@SP // 12414
AM=M-1 // 12415
D=D|M // 12416
@15 // 12417
M=D // 12418
@Output.getMap.EQ.2 // 12419
D=A // 12420
@13 // 12421
M=D // 12422
@DO_EQ // 12423
0;JMP // 12424
(Output.getMap.EQ.2)
@Output.getMap.IfElse1 // 12425
D;JNE // 12426

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=argument 0}
//}

@ARG // 12427
A=M // 12428
M=0 // 12429

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 12430
0;JMP // 12431

////LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)

////LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("Output.0")
//,
//          right:
//              PushInstruction("argument 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@Output.0 // 12432
D=M // 12433
@R13 // 12434
M=D // 12435
@ARG // 12436
A=M // 12437
D=M // 12438
@R13 // 12439
D=D+M // 12440
@4 // 12441
M=D // 12442

////PushInstruction (
//  PushInstruction("that 0")
//)

@THAT // 12443
A=M // 12444
D=M // 12445
@SP // 12446
AM=M+1 // 12447
A=A-1 // 12448
M=D // 12449

////ReturnInstruction{}
@RETURN // 12450
0;JMP // 12451

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//    )
//
//  pop: PopInstruction{address=Output.1}
//}

@ARG // 12452
A=M+1 // 12453
D=M // 12454
@Output.1 // 12455
M=D // 12456

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//    )
//
//  pop: PopInstruction{address=Output.2}
//}

@ARG // 12457
A=M // 12458
D=M // 12459
@Output.2 // 12460
M=D // 12461

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 12462
AM=M+1 // 12463
A=A-1 // 12464
M=0 // 12465

////ReturnInstruction{}
@RETURN // 12466
0;JMP // 12467

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 12468
AM=M+1 // 12469
A=A-1 // 12470
M=0 // 12471
@SP // 12472
AM=M+1 // 12473
A=A-1 // 12474
M=0 // 12475
@SP // 12476
AM=M+1 // 12477
A=A-1 // 12478
M=0 // 12479
@SP // 12480
AM=M+1 // 12481
A=A-1 // 12482
M=0 // 12483

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 12484
A=M // 12485
D=M // 12486
@SP // 12487
AM=M+1 // 12488
A=A-1 // 12489
M=D // 12490
// call Output.getMap
@6 // 12491
D=A // 12492
@14 // 12493
M=D // 12494
@Output.getMap // 12495
D=A // 12496
@13 // 12497
M=D // 12498
@Output.printChar.ret.0 // 12499
D=A // 12500
@CALL // 12501
0;JMP // 12502
(Output.printChar.ret.0)
@SP // 12503
AM=M-1 // 12504
D=M // 12505
@LCL // 12506
A=M // 12507
M=D // 12508

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 3}
//}

@LCL // 12509
A=M+1 // 12510
A=A+1 // 12511
A=A+1 // 12512
M=0 // 12513

////LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 3")
//,
//              right:
//                  PushInstruction("constant 11")
//,
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Output.printChar1}}
@LCL // 12514
A=M+1 // 12515
A=A+1 // 12516
A=A+1 // 12517
D=M // 12518
@11 // 12519
D=D-A // 12520
@15 // 12521
M=D // 12522
@Output.printChar.LT.7 // 12523
D=A // 12524
@13 // 12525
M=D // 12526
@DO_LT // 12527
0;JMP // 12528
(Output.printChar.LT.7)
@15 // 12529
M=D // 12530
@Output.printChar.EQ.6 // 12531
D=A // 12532
@13 // 12533
M=D // 12534
@DO_EQ // 12535
0;JMP // 12536
(Output.printChar.EQ.6)
@WHILE_END_Output.printChar1 // 12537
D;JNE // 12538

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              BinaryPushGroup(
//                                  left:
//                                      CallGroup(
//                                          arg[0]:
//                                              PushInstruction("Output.2")
//                                          arg[1]:
//                                              PushInstruction("constant 11")
//                                          call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}
//                                      ),
//                                  right:
//                                      PushInstruction("local 3")
//,
//                                  binaryOp: "ADD"
//                              )                          arg[1]:
//                              PushInstruction("constant 32")
//                          call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}
//                      ),
//                  binaryOp: "ADD"
//              ),
//          right:
//              CallGroup(
//                  arg[0]:
//                      PushInstruction("Output.1")
//                  arg[1]:
//                      PushInstruction("constant 2")
//                  call: CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}
//              ),
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@Output.2 // 12539
D=M // 12540
@SP // 12541
AM=M+1 // 12542
A=A-1 // 12543
M=D // 12544
@11 // 12545
D=A // 12546
@SP // 12547
AM=M+1 // 12548
A=A-1 // 12549
M=D // 12550
// call Math.multiply
@7 // 12551
D=A // 12552
@14 // 12553
M=D // 12554
@Math.multiply // 12555
D=A // 12556
@13 // 12557
M=D // 12558
@Output.printChar.ret.3 // 12559
D=A // 12560
@CALL // 12561
0;JMP // 12562
(Output.printChar.ret.3)
@LCL // 12563
A=M+1 // 12564
A=A+1 // 12565
A=A+1 // 12566
D=M // 12567
@SP // 12568
AM=M-1 // 12569
D=D+M // 12570
@SP // 12571
AM=M+1 // 12572
A=A-1 // 12573
M=D // 12574
@32 // 12575
D=A // 12576
@SP // 12577
AM=M+1 // 12578
A=A-1 // 12579
M=D // 12580
// call Math.multiply
@7 // 12581
D=A // 12582
@14 // 12583
M=D // 12584
@Math.multiply // 12585
D=A // 12586
@13 // 12587
M=D // 12588
@Output.printChar.ret.4 // 12589
D=A // 12590
@CALL // 12591
0;JMP // 12592
(Output.printChar.ret.4)
@SP // 12593
AM=M-1 // 12594
D=M // 12595
@16384 // 12596
D=D+A // 12597
@SP // 12598
AM=M+1 // 12599
A=A-1 // 12600
M=D // 12601
@Output.1 // 12602
D=M // 12603
@SP // 12604
AM=M+1 // 12605
A=A-1 // 12606
M=D // 12607
@2 // 12608
D=A // 12609
@SP // 12610
AM=M+1 // 12611
A=A-1 // 12612
M=D // 12613
// call Math.divide
@7 // 12614
D=A // 12615
@14 // 12616
M=D // 12617
@Math.divide // 12618
D=A // 12619
@13 // 12620
M=D // 12621
@Output.printChar.ret.5 // 12622
D=A // 12623
@CALL // 12624
0;JMP // 12625
(Output.printChar.ret.5)
@SP // 12626
AM=M-1 // 12627
D=M // 12628
@SP // 12629
AM=M-1 // 12630
D=D+M // 12631
@LCL // 12632
A=M+1 // 12633
M=D // 12634

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("Output.1")
//,
//                      right:
//                          PushInstruction("constant 1")
//,
//                      binaryOp: "AND"
//                  ),
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
//, ifGoto=IfGotoInstruction{label='Output.printChar.IfElse1}}
@Output.1 // 12635
D=M // 12636
@1 // 12637
D=D&A // 12638
@15 // 12639
M=D // 12640
@Output.printChar.EQ.10 // 12641
D=A // 12642
@13 // 12643
M=D // 12644
@DO_EQ // 12645
0;JMP // 12646
(Output.printChar.EQ.10)
@15 // 12647
M=D // 12648
@Output.printChar.EQ.9 // 12649
D=A // 12650
@13 // 12651
M=D // 12652
@DO_EQ // 12653
0;JMP // 12654
(Output.printChar.EQ.9)
@Output.printChar.IfElse1 // 12655
D;JNE // 12656

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("local 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 12657
A=M+1 // 12658
A=A+1 // 12659
A=A+1 // 12660
D=M // 12661
A=A-1 // 12662
A=A-1 // 12663
A=A-1 // 12664
D=D+M // 12665
@4 // 12666
M=D // 12667

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@THAT // 12668
A=M // 12669
D=M // 12670
@LCL // 12671
A=M+1 // 12672
A=A+1 // 12673
M=D // 12674

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 12675
0;JMP // 12676

////LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("local 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 12677
A=M+1 // 12678
A=A+1 // 12679
A=A+1 // 12680
D=M // 12681
A=A-1 // 12682
A=A-1 // 12683
A=A-1 // 12684
D=D+M // 12685
@4 // 12686
M=D // 12687

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("that 0")
//          arg[1]:
//              PushInstruction("constant 256")
//          call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printChar'}
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@THAT // 12688
A=M // 12689
D=M // 12690
@SP // 12691
AM=M+1 // 12692
A=A-1 // 12693
M=D // 12694
@256 // 12695
D=A // 12696
@SP // 12697
AM=M+1 // 12698
A=A-1 // 12699
M=D // 12700
// call Math.multiply
@7 // 12701
D=A // 12702
@14 // 12703
M=D // 12704
@Math.multiply // 12705
D=A // 12706
@13 // 12707
M=D // 12708
@Output.printChar.ret.6 // 12709
D=A // 12710
@CALL // 12711
0;JMP // 12712
(Output.printChar.ret.6)
@SP // 12713
AM=M-1 // 12714
D=M // 12715
@LCL // 12716
A=M+1 // 12717
A=A+1 // 12718
M=D // 12719

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 12720
A=M+1 // 12721
D=M // 12722
@4 // 12723
M=D // 12724

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              PushInstruction("local 2")
//,
//          binaryOp: "OR"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 1")
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

@THAT // 12725
A=M // 12726
D=M // 12727
@R13 // 12728
M=D // 12729
@LCL // 12730
A=M+1 // 12731
A=A+1 // 12732
D=M // 12733
@R13 // 12734
D=D|M // 12735
@THAT // 12736
A=M // 12737
M=D // 12738

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

@LCL // 12739
A=M+1 // 12740
A=A+1 // 12741
A=A+1 // 12742
M=M+1 // 12743

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12744
0;JMP // 12745

////LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("Output.1")
//,
//              right:
//                  PushInstruction("constant 63")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Output.printChar.IfElse2}}
@Output.1 // 12746
D=M // 12747
@63 // 12748
D=D-A // 12749
@15 // 12750
M=D // 12751
@Output.printChar.EQ.13 // 12752
D=A // 12753
@13 // 12754
M=D // 12755
@DO_EQ // 12756
0;JMP // 12757
(Output.printChar.EQ.13)
@15 // 12758
M=D // 12759
@Output.printChar.EQ.12 // 12760
D=A // 12761
@13 // 12762
M=D // 12763
@DO_EQ // 12764
0;JMP // 12765
(Output.printChar.EQ.12)
@Output.printChar.IfElse2 // 12766
D;JNE // 12767

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=7, Output.create=1}, currentFunction='Output.printChar'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12768
D=A // 12769
@14 // 12770
M=D // 12771
@Output.println // 12772
D=A // 12773
@13 // 12774
M=D // 12775
@Output.printChar.ret.7 // 12776
D=A // 12777
@CALL // 12778
0;JMP // 12779
(Output.printChar.ret.7)
@SP // 12780
AM=M-1 // 12781
D=M // 12782
@5 // 12783
M=D // 12784

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12785
0;JMP // 12786

////LabelInstruction{label='Output.printChar.IfElse2}
// label Output.printChar.IfElse2
(Output.printChar.IfElse2)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("Output.1")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=Output.1}
//}

@Output.1 // 12787
M=M+1 // 12788

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 12789
AM=M+1 // 12790
A=A-1 // 12791
M=0 // 12792

////ReturnInstruction{}
@RETURN // 12793
0;JMP // 12794

////FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP // 12795
AM=M+1 // 12796
A=A-1 // 12797
M=0 // 12798

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 12799
A=M // 12800
M=0 // 12801

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 0")
//,
//              right:
//                  CallGroup(
//                      arg[0]:
//                          PushInstruction("argument 0")
//                      call: CallInstruction{calleeFunction='String.length', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=0, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}
//                  ),
//              binaryOp: "LT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Output.printString1}}
@LCL // 12802
A=M // 12803
D=M // 12804
@SP // 12805
AM=M+1 // 12806
A=A-1 // 12807
M=D // 12808
@ARG // 12809
A=M // 12810
D=M // 12811
@SP // 12812
AM=M+1 // 12813
A=A-1 // 12814
M=D // 12815
// call String.length
@6 // 12816
D=A // 12817
@14 // 12818
M=D // 12819
@String.length // 12820
D=A // 12821
@13 // 12822
M=D // 12823
@Output.printString.ret.1 // 12824
D=A // 12825
@CALL // 12826
0;JMP // 12827
(Output.printString.ret.1)
@SP // 12828
AM=M-1 // 12829
D=M // 12830
@SP // 12831
AM=M-1 // 12832
D=M-D // 12833
@15 // 12834
M=D // 12835
@Output.printString.LT.16 // 12836
D=A // 12837
@13 // 12838
M=D // 12839
@DO_LT // 12840
0;JMP // 12841
(Output.printString.LT.16)
@15 // 12842
M=D // 12843
@Output.printString.EQ.15 // 12844
D=A // 12845
@13 // 12846
M=D // 12847
@DO_EQ // 12848
0;JMP // 12849
(Output.printString.EQ.15)
@WHILE_END_Output.printString1 // 12850
D;JNE // 12851

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              CallGroup(
//                  arg[0]:
//                      PushInstruction("argument 0")
//                  arg[1]:
//                      PushInstruction("local 0")
//                  call: CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}
//              )          call: CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 12852
A=M // 12853
D=M // 12854
@SP // 12855
AM=M+1 // 12856
A=A-1 // 12857
M=D // 12858
@LCL // 12859
A=M // 12860
D=M // 12861
@SP // 12862
AM=M+1 // 12863
A=A-1 // 12864
M=D // 12865
// call String.charAt
@7 // 12866
D=A // 12867
@14 // 12868
M=D // 12869
@String.charAt // 12870
D=A // 12871
@13 // 12872
M=D // 12873
@Output.printString.ret.2 // 12874
D=A // 12875
@CALL // 12876
0;JMP // 12877
(Output.printString.ret.2)
// call Output.printChar
@6 // 12878
D=A // 12879
@14 // 12880
M=D // 12881
@Output.printChar // 12882
D=A // 12883
@13 // 12884
M=D // 12885
@Output.printString.ret.3 // 12886
D=A // 12887
@CALL // 12888
0;JMP // 12889
(Output.printString.ret.3)
@SP // 12890
AM=M-1 // 12891
D=M // 12892
@5 // 12893
M=D // 12894

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

@LCL // 12895
A=M // 12896
M=M+1 // 12897

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12898
0;JMP // 12899

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 12900
AM=M+1 // 12901
A=A-1 // 12902
M=0 // 12903

////ReturnInstruction{}
@RETURN // 12904
0;JMP // 12905

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12906
AM=M+1 // 12907
A=A-1 // 12908
M=0 // 12909

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 10")
//          call: CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@10 // 12910
D=A // 12911
@SP // 12912
AM=M+1 // 12913
A=A-1 // 12914
M=D // 12915
// call String.new
@6 // 12916
D=A // 12917
@14 // 12918
M=D // 12919
@String.new // 12920
D=A // 12921
@13 // 12922
M=D // 12923
@Output.printInt.ret.0 // 12924
D=A // 12925
@CALL // 12926
0;JMP // 12927
(Output.printInt.ret.0)
@SP // 12928
AM=M-1 // 12929
D=M // 12930
@LCL // 12931
A=M // 12932
M=D // 12933

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          arg[1]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=1, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 12934
A=M // 12935
D=M // 12936
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=D // 12940
@ARG // 12941
A=M // 12942
D=M // 12943
@SP // 12944
AM=M+1 // 12945
A=A-1 // 12946
M=D // 12947
// call String.setInt
@7 // 12948
D=A // 12949
@14 // 12950
M=D // 12951
@String.setInt // 12952
D=A // 12953
@13 // 12954
M=D // 12955
@Output.printInt.ret.1 // 12956
D=A // 12957
@CALL // 12958
0;JMP // 12959
(Output.printInt.ret.1)
@SP // 12960
AM=M-1 // 12961
D=M // 12962
@5 // 12963
M=D // 12964

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=2, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 12965
A=M // 12966
D=M // 12967
@SP // 12968
AM=M+1 // 12969
A=A-1 // 12970
M=D // 12971
// call Output.printString
@6 // 12972
D=A // 12973
@14 // 12974
M=D // 12975
@Output.printString // 12976
D=A // 12977
@13 // 12978
M=D // 12979
@Output.printInt.ret.2 // 12980
D=A // 12981
@CALL // 12982
0;JMP // 12983
(Output.printInt.ret.2)
@SP // 12984
AM=M-1 // 12985
D=M // 12986
@5 // 12987
M=D // 12988

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=3, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 12989
A=M // 12990
D=M // 12991
@SP // 12992
AM=M+1 // 12993
A=A-1 // 12994
M=D // 12995
// call String.dispose
@6 // 12996
D=A // 12997
@14 // 12998
M=D // 12999
@String.dispose // 13000
D=A // 13001
@13 // 13002
M=D // 13003
@Output.printInt.ret.3 // 13004
D=A // 13005
@CALL // 13006
0;JMP // 13007
(Output.printInt.ret.3)
@SP // 13008
AM=M-1 // 13009
D=M // 13010
@5 // 13011
M=D // 13012

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 13013
AM=M+1 // 13014
A=A-1 // 13015
M=0 // 13016

////ReturnInstruction{}
@RETURN // 13017
0;JMP // 13018

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=Output.1}
//}

@Output.1 // 13019
M=0 // 13020

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("Output.2")
//,
//              right:
//                  PushInstruction("constant 22")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Output.println.IfElse1}}
@Output.2 // 13021
D=M // 13022
@22 // 13023
D=D-A // 13024
@15 // 13025
M=D // 13026
@Output.println.EQ.19 // 13027
D=A // 13028
@13 // 13029
M=D // 13030
@DO_EQ // 13031
0;JMP // 13032
(Output.println.EQ.19)
@15 // 13033
M=D // 13034
@Output.println.EQ.18 // 13035
D=A // 13036
@13 // 13037
M=D // 13038
@DO_EQ // 13039
0;JMP // 13040
(Output.println.EQ.18)
@Output.println.IfElse1 // 13041
D;JNE // 13042

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=Output.2}
//}

@Output.2 // 13043
M=0 // 13044

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 13045
0;JMP // 13046

////LabelInstruction{label='Output.println.IfElse1}
// label Output.println.IfElse1
(Output.println.IfElse1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("Output.2")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=Output.2}
//}

@Output.2 // 13047
M=M+1 // 13048

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 13049
AM=M+1 // 13050
A=A-1 // 13051
M=0 // 13052

////ReturnInstruction{}
@RETURN // 13053
0;JMP // 13054

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 13055
AM=M+1 // 13056
A=A-1 // 13057
M=0 // 13058
@SP // 13059
AM=M+1 // 13060
A=A-1 // 13061
M=0 // 13062

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 2048")
//,
//          right:
//              PushInstruction("constant 7")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@2055 // 13063
D=A // 13064
@LCL // 13065
A=M // 13066
M=D // 13067

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 16384")
//,
//                  right:
//                      PushInstruction("local 0")
//,
//                  binaryOp: "SUB"
//              ),
//          right:
//              PushInstruction("constant 5")
//,
//          binaryOp: "SUB"
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

@LCL // 13068
A=M // 13069
D=M // 13070
@16384 // 13071
D=A-D // 13072
@5 // 13073
D=D-A // 13074
@THAT // 13075
A=M // 13076
M=D // 13077

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@THAT // 13078
A=M // 13079
M=1 // 13080

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@THAT // 13081
A=M // 13082
M=0 // 13083

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@THAT // 13084
A=M // 13085
M=0 // 13086

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 13087
A=M // 13088
D=M // 13089
@SP // 13090
AM=M+1 // 13091
A=A-1 // 13092
M=D // 13093
// call Memory.create_foot
@6 // 13094
D=A // 13095
@14 // 13096
M=D // 13097
@Memory.create_foot // 13098
D=A // 13099
@13 // 13100
M=D // 13101
@Memory.init.ret.0 // 13102
D=A // 13103
@CALL // 13104
0;JMP // 13105
(Memory.init.ret.0)
@SP // 13106
AM=M-1 // 13107
D=M // 13108
@5 // 13109
M=D // 13110

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 2048")
//,
//                  right:
//                      PushInstruction("constant 6")
//,
//                  binaryOp: "ADD"
//              )          arg[1]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=1}, currentFunction='Memory.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@2054 // 13111
D=A // 13112
@SP // 13113
AM=M+1 // 13114
A=A-1 // 13115
M=D // 13116
@2054 // 13117
D=A // 13118
@SP // 13119
AM=M+1 // 13120
A=A-1 // 13121
M=D // 13122
@LCL // 13123
A=M // 13124
D=M // 13125
@SP // 13126
AM=M+1 // 13127
A=A-1 // 13128
M=D // 13129
// call Memory.add_node
@7 // 13130
D=A // 13131
@14 // 13132
M=D // 13133
@Memory.add_node // 13134
D=A // 13135
@13 // 13136
M=D // 13137
@Memory.init.ret.1 // 13138
D=A // 13139
@CALL // 13140
0;JMP // 13141
(Memory.init.ret.1)
@SP // 13142
AM=M-1 // 13143
D=M // 13144
@5 // 13145
M=D // 13146

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 13147
AM=M+1 // 13148
A=A-1 // 13149
M=0 // 13150

////ReturnInstruction{}
@RETURN // 13151
0;JMP // 13152

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 13153
AM=M+1 // 13154
A=A-1 // 13155
M=0 // 13156
@SP // 13157
AM=M+1 // 13158
A=A-1 // 13159
M=0 // 13160
@SP // 13161
AM=M+1 // 13162
A=A-1 // 13163
M=0 // 13164
@SP // 13165
AM=M+1 // 13166
A=A-1 // 13167
M=0 // 13168
@SP // 13169
AM=M+1 // 13170
A=A-1 // 13171
M=0 // 13172

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 13173
A=M // 13174
D=M // 13175
@SP // 13176
AM=M+1 // 13177
A=A-1 // 13178
M=D // 13179
// call Memory.getBinIndex
@6 // 13180
D=A // 13181
@14 // 13182
M=D // 13183
@Memory.getBinIndex // 13184
D=A // 13185
@13 // 13186
M=D // 13187
@Memory.alloc.ret.0 // 13188
D=A // 13189
@CALL // 13190
0;JMP // 13191
(Memory.alloc.ret.0)
@SP // 13192
AM=M-1 // 13193
D=M // 13194
@LCL // 13195
A=M // 13196
M=D // 13197

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 2048")
//,
//          right:
//              PushInstruction("local 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 13198
A=M // 13199
D=M // 13200
@2048 // 13201
D=D+A // 13202
@LCL // 13203
A=M+1 // 13204
M=D // 13205

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 1")
//          arg[1]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=1, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 13206
A=M+1 // 13207
D=M // 13208
@SP // 13209
AM=M+1 // 13210
A=A-1 // 13211
M=D // 13212
@ARG // 13213
A=M // 13214
D=M // 13215
@SP // 13216
AM=M+1 // 13217
A=A-1 // 13218
M=D // 13219
// call Memory.get_best_fit
@7 // 13220
D=A // 13221
@14 // 13222
M=D // 13223
@Memory.get_best_fit // 13224
D=A // 13225
@13 // 13226
M=D // 13227
@Memory.alloc.ret.1 // 13228
D=A // 13229
@CALL // 13230
0;JMP // 13231
(Memory.alloc.ret.1)
@SP // 13232
AM=M-1 // 13233
D=M // 13234
@LCL // 13235
A=M+1 // 13236
A=A+1 // 13237
M=D // 13238

////LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)

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
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Memory.alloc1}}
@LCL // 13239
A=M+1 // 13240
A=A+1 // 13241
D=M // 13242
@15 // 13243
M=D // 13244
@Memory.alloc.EQ.2 // 13245
D=A // 13246
@13 // 13247
M=D // 13248
@DO_EQ // 13249
0;JMP // 13250
(Memory.alloc.EQ.2)
@15 // 13251
M=D // 13252
@Memory.alloc.EQ.1 // 13253
D=A // 13254
@13 // 13255
M=D // 13256
@DO_EQ // 13257
0;JMP // 13258
(Memory.alloc.EQ.1)
@WHILE_END_Memory.alloc1 // 13259
D;JNE // 13260

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          BinaryPushGroup(
//                              left:
//                                  PushInstruction("local 0")
//,
//                              right:
//                                  PushInstruction("constant 1")
//,
//                              binaryOp: "ADD"
//                          ),
//                      right:
//                          PushInstruction("constant 7")
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
//, ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse1}}
@LCL // 13261
A=M // 13262
D=M+1 // 13263
@7 // 13264
D=D-A // 13265
@15 // 13266
M=D // 13267
@Memory.alloc.LT.5 // 13268
D=A // 13269
@13 // 13270
M=D // 13271
@DO_LT // 13272
0;JMP // 13273
(Memory.alloc.LT.5)
D=!D // 13274
@15 // 13275
M=D // 13276
@Memory.alloc.EQ.4 // 13277
D=A // 13278
@13 // 13279
M=D // 13280
@DO_EQ // 13281
0;JMP // 13282
(Memory.alloc.EQ.4)
@Memory.alloc.IfElse1 // 13283
D;JNE // 13284

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 13285
AM=M+1 // 13286
A=A-1 // 13287
M=0 // 13288

////ReturnInstruction{}
@RETURN // 13289
0;JMP // 13290

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 13291
0;JMP // 13292

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

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

@LCL // 13293
A=M // 13294
M=M+1 // 13295

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 2048")
//,
//          right:
//              PushInstruction("local 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 13296
A=M // 13297
D=M // 13298
@2048 // 13299
D=D+A // 13300
@LCL // 13301
A=M+1 // 13302
M=D // 13303

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 1")
//          arg[1]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 13304
A=M+1 // 13305
D=M // 13306
@SP // 13307
AM=M+1 // 13308
A=A-1 // 13309
M=D // 13310
@ARG // 13311
A=M // 13312
D=M // 13313
@SP // 13314
AM=M+1 // 13315
A=A-1 // 13316
M=D // 13317
// call Memory.get_best_fit
@7 // 13318
D=A // 13319
@14 // 13320
M=D // 13321
@Memory.get_best_fit // 13322
D=A // 13323
@13 // 13324
M=D // 13325
@Memory.alloc.ret.2 // 13326
D=A // 13327
@CALL // 13328
0;JMP // 13329
(Memory.alloc.ret.2)
@SP // 13330
AM=M-1 // 13331
D=M // 13332
@LCL // 13333
A=M+1 // 13334
A=A+1 // 13335
M=D // 13336

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 13337
0;JMP // 13338

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 2048")
//,
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("that 0")
//                          call: CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}
//                      ),
//                  binaryOp: "ADD"
//              )          arg[1]:
//              PushInstruction("local 2")
//          call: CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THAT // 13339
A=M // 13340
D=M // 13341
@SP // 13342
AM=M+1 // 13343
A=A-1 // 13344
M=D // 13345
// call Memory.getBinIndex
@6 // 13346
D=A // 13347
@14 // 13348
M=D // 13349
@Memory.getBinIndex // 13350
D=A // 13351
@13 // 13352
M=D // 13353
@Memory.alloc.ret.4 // 13354
D=A // 13355
@CALL // 13356
0;JMP // 13357
(Memory.alloc.ret.4)
@SP // 13358
AM=M-1 // 13359
D=M // 13360
@2048 // 13361
D=D+A // 13362
@SP // 13363
AM=M+1 // 13364
A=A-1 // 13365
M=D // 13366
@LCL // 13367
A=M+1 // 13368
A=A+1 // 13369
D=M // 13370
@SP // 13371
AM=M+1 // 13372
A=A-1 // 13373
M=D // 13374
// call Memory.remove_node
@7 // 13375
D=A // 13376
@14 // 13377
M=D // 13378
@Memory.remove_node // 13379
D=A // 13380
@13 // 13381
M=D // 13382
@Memory.alloc.ret.5 // 13383
D=A // 13384
@CALL // 13385
0;JMP // 13386
(Memory.alloc.ret.5)
@SP // 13387
AM=M-1 // 13388
D=M // 13389
@5 // 13390
M=D // 13391

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 2")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 13392
A=M+1 // 13393
A=A+1 // 13394
D=M // 13395
@4 // 13396
M=D // 13397

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("that 0")
//,
//          right:
//              PushInstruction("argument 0")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 3}
//}

@THAT // 13398
A=M // 13399
D=M // 13400
@R13 // 13401
M=D // 13402
@ARG // 13403
A=M // 13404
D=M // 13405
@R13 // 13406
D=M-D // 13407
@LCL // 13408
A=M+1 // 13409
A=A+1 // 13410
A=A+1 // 13411
M=D // 13412

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 3")
//,
//              right:
//                  PushInstruction("constant 5")
//,
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
@LCL // 13413
A=M+1 // 13414
A=A+1 // 13415
A=A+1 // 13416
D=M // 13417
@5 // 13418
D=D-A // 13419
@15 // 13420
M=D // 13421
@Memory.alloc.GT.8 // 13422
D=A // 13423
@13 // 13424
M=D // 13425
@DO_GT // 13426
0;JMP // 13427
(Memory.alloc.GT.8)
@15 // 13428
M=D // 13429
@Memory.alloc.EQ.7 // 13430
D=A // 13431
@13 // 13432
M=D // 13433
@DO_EQ // 13434
0;JMP // 13435
(Memory.alloc.EQ.7)
@Memory.alloc.IfElse2 // 13436
D;JNE // 13437

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 2")
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

@ARG // 13438
A=M // 13439
D=M // 13440
@THAT // 13441
A=M // 13442
M=D // 13443

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 2")
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

@THAT // 13444
A=M // 13445
M=0 // 13446

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 2")
//          call: CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 13447
A=M+1 // 13448
A=A+1 // 13449
D=M // 13450
@SP // 13451
AM=M+1 // 13452
A=A-1 // 13453
M=D // 13454
// call Memory.create_foot
@6 // 13455
D=A // 13456
@14 // 13457
M=D // 13458
@Memory.create_foot // 13459
D=A // 13460
@13 // 13461
M=D // 13462
@Memory.alloc.ret.6 // 13463
D=A // 13464
@CALL // 13465
0;JMP // 13466
(Memory.alloc.ret.6)
@SP // 13467
AM=M-1 // 13468
D=M // 13469
@5 // 13470
M=D // 13471

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 2")
//,
//                  right:
//                      PushInstruction("argument 0")
//,
//                  binaryOp: "ADD"
//              ),
//          right:
//              PushInstruction("constant 5")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=local 4}
//}

@LCL // 13472
D=M // 13473
@4 // 13474
A=D+A // 13475
D=A // 13476
@13 // 13477
M=D // 13478
@LCL // 13479
A=M+1 // 13480
A=A+1 // 13481
D=M // 13482
@R13 // 13483
M=D // 13484
@ARG // 13485
A=M // 13486
D=M // 13487
@R13 // 13488
D=D+M // 13489
@5 // 13490
D=D+A // 13491
@13 // 13492
A=M // 13493
M=D // 13494

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 3")
//,
//          right:
//              PushInstruction("constant 5")
//,
//          binaryOp: "SUB"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 4")
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

@LCL // 13495
A=M+1 // 13496
A=A+1 // 13497
A=A+1 // 13498
D=M // 13499
@5 // 13500
D=D-A // 13501
@THAT // 13502
A=M // 13503
M=D // 13504

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 4")
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

@THAT // 13505
A=M // 13506
M=1 // 13507

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 4")
//          call: CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 13508
D=M // 13509
@4 // 13510
A=D+A // 13511
D=M // 13512
@SP // 13513
AM=M+1 // 13514
A=A-1 // 13515
M=D // 13516
// call Memory.create_foot
@6 // 13517
D=A // 13518
@14 // 13519
M=D // 13520
@Memory.create_foot // 13521
D=A // 13522
@13 // 13523
M=D // 13524
@Memory.alloc.ret.7 // 13525
D=A // 13526
@CALL // 13527
0;JMP // 13528
(Memory.alloc.ret.7)
@SP // 13529
AM=M-1 // 13530
D=M // 13531
@5 // 13532
M=D // 13533

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 2048")
//,
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("local 3")
//                          call: CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}
//                      ),
//                  binaryOp: "ADD"
//              )          arg[1]:
//              PushInstruction("local 4")
//          call: CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 13534
A=M+1 // 13535
A=A+1 // 13536
A=A+1 // 13537
D=M // 13538
@SP // 13539
AM=M+1 // 13540
A=A-1 // 13541
M=D // 13542
// call Memory.getBinIndex
@6 // 13543
D=A // 13544
@14 // 13545
M=D // 13546
@Memory.getBinIndex // 13547
D=A // 13548
@13 // 13549
M=D // 13550
@Memory.alloc.ret.9 // 13551
D=A // 13552
@CALL // 13553
0;JMP // 13554
(Memory.alloc.ret.9)
@SP // 13555
AM=M-1 // 13556
D=M // 13557
@2048 // 13558
D=D+A // 13559
@SP // 13560
AM=M+1 // 13561
A=A-1 // 13562
M=D // 13563
@LCL // 13564
D=M // 13565
@4 // 13566
A=D+A // 13567
D=M // 13568
@SP // 13569
AM=M+1 // 13570
A=A-1 // 13571
M=D // 13572
// call Memory.add_node
@7 // 13573
D=A // 13574
@14 // 13575
M=D // 13576
@Memory.add_node // 13577
D=A // 13578
@13 // 13579
M=D // 13580
@Memory.alloc.ret.10 // 13581
D=A // 13582
@CALL // 13583
0;JMP // 13584
(Memory.alloc.ret.10)
@SP // 13585
AM=M-1 // 13586
D=M // 13587
@5 // 13588
M=D // 13589

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 13590
0;JMP // 13591

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 2")
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

@THAT // 13592
A=M // 13593
M=0 // 13594

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 2")
//          call: CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=11, Memory.init=2}, currentFunction='Memory.alloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 13595
A=M+1 // 13596
A=A+1 // 13597
D=M // 13598
@SP // 13599
AM=M+1 // 13600
A=A-1 // 13601
M=D // 13602
// call Memory.create_foot
@6 // 13603
D=A // 13604
@14 // 13605
M=D // 13606
@Memory.create_foot // 13607
D=A // 13608
@13 // 13609
M=D // 13610
@Memory.alloc.ret.11 // 13611
D=A // 13612
@CALL // 13613
0;JMP // 13614
(Memory.alloc.ret.11)
@SP // 13615
AM=M-1 // 13616
D=M // 13617
@5 // 13618
M=D // 13619

////LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("local 2")
//,
//      right:
//          PushInstruction("constant 4")
//,
//      binaryOp: "ADD"
//  ))

@LCL // 13620
A=M+1 // 13621
A=A+1 // 13622
D=M // 13623
@4 // 13624
D=D+A // 13625
@SP // 13626
AM=M+1 // 13627
A=A-1 // 13628
M=D // 13629

////ReturnInstruction{}
@RETURN // 13630
0;JMP // 13631

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=12, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 13632
AM=M+1 // 13633
A=A-1 // 13634
M=0 // 13635

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=12, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 13636
A=M // 13637
D=M // 13638
@SP // 13639
AM=M+1 // 13640
A=A-1 // 13641
M=D // 13642
// call Memory.alloc
@6 // 13643
D=A // 13644
@14 // 13645
M=D // 13646
@Memory.alloc // 13647
D=A // 13648
@13 // 13649
M=D // 13650
@Memory.calloc.ret.0 // 13651
D=A // 13652
@CALL // 13653
0;JMP // 13654
(Memory.calloc.ret.0)
@SP // 13655
AM=M-1 // 13656
D=M // 13657
@LCL // 13658
A=M // 13659
M=D // 13660

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  PushInstruction("local 0")
//,
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@LCL // 13661
A=M // 13662
D=!M // 13663
@15 // 13664
M=D // 13665
@Memory.calloc.EQ.9 // 13666
D=A // 13667
@13 // 13668
M=D // 13669
@DO_EQ // 13670
0;JMP // 13671
(Memory.calloc.EQ.9)
@Memory.calloc.IfElse1 // 13672
D;JNE // 13673

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 13674
AM=M+1 // 13675
A=A-1 // 13676
M=0 // 13677

////ReturnInstruction{}
@RETURN // 13678
0;JMP // 13679

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 13680
0;JMP // 13681

////LabelInstruction{label='Memory.calloc.IfElse1}
// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)

////LabelInstruction{label='Memory.calloc.IfElseEND1}
// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.calloc1}
// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)

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
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Memory.calloc1}}
@ARG // 13682
A=M // 13683
D=M // 13684
@15 // 13685
M=D // 13686
@Memory.calloc.GT.12 // 13687
D=A // 13688
@13 // 13689
M=D // 13690
@DO_GT // 13691
0;JMP // 13692
(Memory.calloc.GT.12)
@15 // 13693
M=D // 13694
@Memory.calloc.EQ.11 // 13695
D=A // 13696
@13 // 13697
M=D // 13698
@DO_EQ // 13699
0;JMP // 13700
(Memory.calloc.EQ.11)
@WHILE_END_Memory.calloc1 // 13701
D;JNE // 13702

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=argument 0}
//}

@ARG // 13703
A=M // 13704
M=M-1 // 13705

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
//,
//                  right:
//                      PushInstruction("argument 0")
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

@THAT // 13706
A=M // 13707
M=0 // 13708

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 13709
0;JMP // 13710

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 13711
A=M // 13712
D=M // 13713
@SP // 13714
AM=M+1 // 13715
A=A-1 // 13716
M=D // 13717

////ReturnInstruction{}
@RETURN // 13718
0;JMP // 13719

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 13720
AM=M+1 // 13721
A=A-1 // 13722
M=0 // 13723
@SP // 13724
AM=M+1 // 13725
A=A-1 // 13726
M=0 // 13727
@SP // 13728
AM=M+1 // 13729
A=A-1 // 13730
M=0 // 13731

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 4")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@ARG // 13732
A=M // 13733
D=M // 13734
@4 // 13735
D=D-A // 13736
@LCL // 13737
A=M // 13738
M=D // 13739

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@THAT // 13740
A=M // 13741
M=1 // 13742

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 13743
A=M // 13744
D=M // 13745
@2 // 13746
D=D+A // 13747
@4 // 13748
M=D // 13749

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@THAT // 13750
A=M // 13751
D=M // 13752
@LCL // 13753
A=M+1 // 13754
M=D // 13755

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 13756
A=M // 13757
D=M // 13758
@3 // 13759
D=D+A // 13760
@4 // 13761
M=D // 13762

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@THAT // 13763
A=M // 13764
D=M // 13765
@LCL // 13766
A=M+1 // 13767
A=A+1 // 13768
M=D // 13769

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
//                      binaryOp: "EQ"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse1}}
@LCL // 13770
A=M+1 // 13771
D=M // 13772
@15 // 13773
M=D // 13774
@Memory.deAlloc.EQ.15 // 13775
D=A // 13776
@13 // 13777
M=D // 13778
@DO_EQ // 13779
0;JMP // 13780
(Memory.deAlloc.EQ.15)
D=!D // 13781
@15 // 13782
M=D // 13783
@Memory.deAlloc.EQ.14 // 13784
D=A // 13785
@13 // 13786
M=D // 13787
@DO_EQ // 13788
0;JMP // 13789
(Memory.deAlloc.EQ.14)
@Memory.deAlloc.IfElse1 // 13790
D;JNE // 13791

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
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 13792
A=M+1 // 13793
D=M+1 // 13794
@4 // 13795
M=D // 13796

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse2}}
@THAT // 13797
A=M // 13798
D=M-1 // 13799
@15 // 13800
M=D // 13801
@Memory.deAlloc.EQ.18 // 13802
D=A // 13803
@13 // 13804
M=D // 13805
@DO_EQ // 13806
0;JMP // 13807
(Memory.deAlloc.EQ.18)
@15 // 13808
M=D // 13809
@Memory.deAlloc.EQ.17 // 13810
D=A // 13811
@13 // 13812
M=D // 13813
@DO_EQ // 13814
0;JMP // 13815
(Memory.deAlloc.EQ.17)
@Memory.deAlloc.IfElse2 // 13816
D;JNE // 13817

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 2048")
//,
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("that 0")
//                          call: CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//                      ),
//                  binaryOp: "ADD"
//              )          arg[1]:
//              PushInstruction("local 1")
//          call: CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THAT // 13818
A=M // 13819
D=M // 13820
@SP // 13821
AM=M+1 // 13822
A=A-1 // 13823
M=D // 13824
// call Memory.getBinIndex
@6 // 13825
D=A // 13826
@14 // 13827
M=D // 13828
@Memory.getBinIndex // 13829
D=A // 13830
@13 // 13831
M=D // 13832
@Memory.deAlloc.ret.1 // 13833
D=A // 13834
@CALL // 13835
0;JMP // 13836
(Memory.deAlloc.ret.1)
@SP // 13837
AM=M-1 // 13838
D=M // 13839
@2048 // 13840
D=D+A // 13841
@SP // 13842
AM=M+1 // 13843
A=A-1 // 13844
M=D // 13845
@LCL // 13846
A=M+1 // 13847
D=M // 13848
@SP // 13849
AM=M+1 // 13850
A=A-1 // 13851
M=D // 13852
// call Memory.remove_node
@7 // 13853
D=A // 13854
@14 // 13855
M=D // 13856
@Memory.remove_node // 13857
D=A // 13858
@13 // 13859
M=D // 13860
@Memory.deAlloc.ret.2 // 13861
D=A // 13862
@CALL // 13863
0;JMP // 13864
(Memory.deAlloc.ret.2)
@SP // 13865
AM=M-1 // 13866
D=M // 13867
@5 // 13868
M=D // 13869

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 1")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 13870
A=M+1 // 13871
D=M // 13872
@4 // 13873
M=D // 13874

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("that 0")
//,
//                  right:
//                      PushInstruction("that 0")
//,
//                  binaryOp: "ADD"
//              ),
//          right:
//              PushInstruction("constant 5")
//,
//          binaryOp: "ADD"
//      )      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 1")
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

@THAT // 13875
A=M // 13876
D=M // 13877
D=D+M // 13878
@5 // 13879
D=D+A // 13880
@THAT // 13881
A=M // 13882
M=D // 13883

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 1")
//          call: CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 13884
A=M+1 // 13885
D=M // 13886
@SP // 13887
AM=M+1 // 13888
A=A-1 // 13889
M=D // 13890
// call Memory.create_foot
@6 // 13891
D=A // 13892
@14 // 13893
M=D // 13894
@Memory.create_foot // 13895
D=A // 13896
@13 // 13897
M=D // 13898
@Memory.deAlloc.ret.3 // 13899
D=A // 13900
@CALL // 13901
0;JMP // 13902
(Memory.deAlloc.ret.3)
@SP // 13903
AM=M-1 // 13904
D=M // 13905
@5 // 13906
M=D // 13907

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 1")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 13908
A=M+1 // 13909
D=M // 13910
@LCL // 13911
A=M // 13912
M=D // 13913

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 13914
0;JMP // 13915

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 13916
0;JMP // 13917

////LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 2")
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
//, ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse3}}
@LCL // 13918
A=M+1 // 13919
A=A+1 // 13920
D=M // 13921
@15 // 13922
M=D // 13923
@Memory.deAlloc.EQ.21 // 13924
D=A // 13925
@13 // 13926
M=D // 13927
@DO_EQ // 13928
0;JMP // 13929
(Memory.deAlloc.EQ.21)
D=!D // 13930
@15 // 13931
M=D // 13932
@Memory.deAlloc.EQ.20 // 13933
D=A // 13934
@13 // 13935
M=D // 13936
@DO_EQ // 13937
0;JMP // 13938
(Memory.deAlloc.EQ.20)
@Memory.deAlloc.IfElse3 // 13939
D;JNE // 13940

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 2")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 13941
A=M+1 // 13942
A=A+1 // 13943
D=M+1 // 13944
@4 // 13945
M=D // 13946

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse4}}
@THAT // 13947
A=M // 13948
D=M-1 // 13949
@15 // 13950
M=D // 13951
@Memory.deAlloc.EQ.24 // 13952
D=A // 13953
@13 // 13954
M=D // 13955
@DO_EQ // 13956
0;JMP // 13957
(Memory.deAlloc.EQ.24)
@15 // 13958
M=D // 13959
@Memory.deAlloc.EQ.23 // 13960
D=A // 13961
@13 // 13962
M=D // 13963
@DO_EQ // 13964
0;JMP // 13965
(Memory.deAlloc.EQ.23)
@Memory.deAlloc.IfElse4 // 13966
D;JNE // 13967

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 2048")
//,
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("that 0")
//                          call: CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//                      ),
//                  binaryOp: "ADD"
//              )          arg[1]:
//              PushInstruction("local 2")
//          call: CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THAT // 13968
A=M // 13969
D=M // 13970
@SP // 13971
AM=M+1 // 13972
A=A-1 // 13973
M=D // 13974
// call Memory.getBinIndex
@6 // 13975
D=A // 13976
@14 // 13977
M=D // 13978
@Memory.getBinIndex // 13979
D=A // 13980
@13 // 13981
M=D // 13982
@Memory.deAlloc.ret.5 // 13983
D=A // 13984
@CALL // 13985
0;JMP // 13986
(Memory.deAlloc.ret.5)
@SP // 13987
AM=M-1 // 13988
D=M // 13989
@2048 // 13990
D=D+A // 13991
@SP // 13992
AM=M+1 // 13993
A=A-1 // 13994
M=D // 13995
@LCL // 13996
A=M+1 // 13997
A=A+1 // 13998
D=M // 13999
@SP // 14000
AM=M+1 // 14001
A=A-1 // 14002
M=D // 14003
// call Memory.remove_node
@7 // 14004
D=A // 14005
@14 // 14006
M=D // 14007
@Memory.remove_node // 14008
D=A // 14009
@13 // 14010
M=D // 14011
@Memory.deAlloc.ret.6 // 14012
D=A // 14013
@CALL // 14014
0;JMP // 14015
(Memory.deAlloc.ret.6)
@SP // 14016
AM=M-1 // 14017
D=M // 14018
@5 // 14019
M=D // 14020

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

@LCL // 14021
A=M // 14022
D=M // 14023
@4 // 14024
M=D // 14025

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("that 0")
//,
//                  right:
//                      PushInstruction("that 0")
//,
//                  binaryOp: "ADD"
//              ),
//          right:
//              PushInstruction("constant 5")
//,
//          binaryOp: "ADD"
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

@THAT // 14026
A=M // 14027
D=M // 14028
D=D+M // 14029
@5 // 14030
D=D+A // 14031
@THAT // 14032
A=M // 14033
M=D // 14034

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=7, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 14035
A=M // 14036
D=M // 14037
@SP // 14038
AM=M+1 // 14039
A=A-1 // 14040
M=D // 14041
// call Memory.create_foot
@6 // 14042
D=A // 14043
@14 // 14044
M=D // 14045
@Memory.create_foot // 14046
D=A // 14047
@13 // 14048
M=D // 14049
@Memory.deAlloc.ret.7 // 14050
D=A // 14051
@CALL // 14052
0;JMP // 14053
(Memory.deAlloc.ret.7)
@SP // 14054
AM=M-1 // 14055
D=M // 14056
@5 // 14057
M=D // 14058

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 14059
0;JMP // 14060

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 14061
0;JMP // 14062

////LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)

////LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("constant 2048")
//,
//                  right:
//                      CallGroup(
//                          arg[0]:
//                              PushInstruction("that 0")
//                          call: CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//                      ),
//                  binaryOp: "ADD"
//              )          arg[1]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@THAT // 14063
A=M // 14064
D=M // 14065
@SP // 14066
AM=M+1 // 14067
A=A-1 // 14068
M=D // 14069
// call Memory.getBinIndex
@6 // 14070
D=A // 14071
@14 // 14072
M=D // 14073
@Memory.getBinIndex // 14074
D=A // 14075
@13 // 14076
M=D // 14077
@Memory.deAlloc.ret.9 // 14078
D=A // 14079
@CALL // 14080
0;JMP // 14081
(Memory.deAlloc.ret.9)
@SP // 14082
AM=M-1 // 14083
D=M // 14084
@2048 // 14085
D=D+A // 14086
@SP // 14087
AM=M+1 // 14088
A=A-1 // 14089
M=D // 14090
@LCL // 14091
A=M // 14092
D=M // 14093
@SP // 14094
AM=M+1 // 14095
A=A-1 // 14096
M=D // 14097
// call Memory.add_node
@7 // 14098
D=A // 14099
@14 // 14100
M=D // 14101
@Memory.add_node // 14102
D=A // 14103
@13 // 14104
M=D // 14105
@Memory.deAlloc.ret.10 // 14106
D=A // 14107
@CALL // 14108
0;JMP // 14109
(Memory.deAlloc.ret.10)
@SP // 14110
AM=M-1 // 14111
D=M // 14112
@5 // 14113
M=D // 14114

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14115
AM=M+1 // 14116
A=A-1 // 14117
M=0 // 14118

////ReturnInstruction{}
@RETURN // 14119
0;JMP // 14120

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 14121
AM=M+1 // 14122
A=A-1 // 14123
M=0 // 14124
@SP // 14125
AM=M+1 // 14126
A=A-1 // 14127
M=0 // 14128
@SP // 14129
AM=M+1 // 14130
A=A-1 // 14131
M=0 // 14132
@SP // 14133
AM=M+1 // 14134
A=A-1 // 14135
M=0 // 14136

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
//, ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse1}}
@ARG // 14137
A=M // 14138
D=M // 14139
@15 // 14140
M=D // 14141
@Memory.realloc.EQ.27 // 14142
D=A // 14143
@13 // 14144
M=D // 14145
@DO_EQ // 14146
0;JMP // 14147
(Memory.realloc.EQ.27)
@15 // 14148
M=D // 14149
@Memory.realloc.EQ.26 // 14150
D=A // 14151
@13 // 14152
M=D // 14153
@DO_EQ // 14154
0;JMP // 14155
(Memory.realloc.EQ.26)
@Memory.realloc.IfElse1 // 14156
D;JNE // 14157

////CallGroup (
//  CallGroup(
//      arg[0]:
//          PushInstruction("argument 1")
//      call: CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
//  ))

@ARG // 14158
A=M+1 // 14159
D=M // 14160
@SP // 14161
AM=M+1 // 14162
A=A-1 // 14163
M=D // 14164
// call Memory.alloc
@6 // 14165
D=A // 14166
@14 // 14167
M=D // 14168
@Memory.alloc // 14169
D=A // 14170
@13 // 14171
M=D // 14172
@Memory.realloc.ret.0 // 14173
D=A // 14174
@CALL // 14175
0;JMP // 14176
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 14177
0;JMP // 14178

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 14179
0;JMP // 14180

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 3}
//}

@ARG // 14181
A=M // 14182
D=M-1 // 14183
@LCL // 14184
A=M+1 // 14185
A=A+1 // 14186
A=A+1 // 14187
M=D // 14188

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 3")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 14189
A=M+1 // 14190
A=A+1 // 14191
A=A+1 // 14192
D=M // 14193
@4 // 14194
M=D // 14195

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@THAT // 14196
A=M // 14197
D=M // 14198
@LCL // 14199
A=M // 14200
M=D // 14201

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 1")
//          call: CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

@ARG // 14202
A=M+1 // 14203
D=M // 14204
@SP // 14205
AM=M+1 // 14206
A=A-1 // 14207
M=D // 14208
// call Memory.alloc
@6 // 14209
D=A // 14210
@14 // 14211
M=D // 14212
@Memory.alloc // 14213
D=A // 14214
@13 // 14215
M=D // 14216
@Memory.realloc.ret.1 // 14217
D=A // 14218
@CALL // 14219
0;JMP // 14220
(Memory.realloc.ret.1)
@SP // 14221
AM=M-1 // 14222
D=M // 14223
@LCL // 14224
A=M+1 // 14225
M=D // 14226

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
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse2}}
@LCL // 14227
A=M+1 // 14228
D=M // 14229
@15 // 14230
M=D // 14231
@Memory.realloc.EQ.30 // 14232
D=A // 14233
@13 // 14234
M=D // 14235
@DO_EQ // 14236
0;JMP // 14237
(Memory.realloc.EQ.30)
@15 // 14238
M=D // 14239
@Memory.realloc.EQ.29 // 14240
D=A // 14241
@13 // 14242
M=D // 14243
@DO_EQ // 14244
0;JMP // 14245
(Memory.realloc.EQ.29)
@Memory.realloc.IfElse2 // 14246
D;JNE // 14247

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14248
AM=M+1 // 14249
A=A-1 // 14250
M=0 // 14251

////ReturnInstruction{}
@RETURN // 14252
0;JMP // 14253

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 14254
0;JMP // 14255

////LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)

////LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)

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
//, ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse3}}
@LCL // 14256
A=M // 14257
D=M // 14258
@R13 // 14259
M=D // 14260
@ARG // 14261
A=M+1 // 14262
D=M // 14263
@R13 // 14264
D=M-D // 14265
@15 // 14266
M=D // 14267
@Memory.realloc.GT.33 // 14268
D=A // 14269
@13 // 14270
M=D // 14271
@DO_GT // 14272
0;JMP // 14273
(Memory.realloc.GT.33)
D=!D // 14274
@15 // 14275
M=D // 14276
@Memory.realloc.EQ.32 // 14277
D=A // 14278
@13 // 14279
M=D // 14280
@DO_EQ // 14281
0;JMP // 14282
(Memory.realloc.EQ.32)
@Memory.realloc.IfElse3 // 14283
D;JNE // 14284

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 0")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@LCL // 14285
A=M // 14286
D=M // 14287
@LCL // 14288
A=M+1 // 14289
A=A+1 // 14290
M=D // 14291

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 14292
0;JMP // 14293

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//    )
//
//  pop: PopInstruction{address=local 2}
//}

@ARG // 14294
A=M+1 // 14295
D=M // 14296
@LCL // 14297
A=M+1 // 14298
A=A+1 // 14299
M=D // 14300

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          arg[1]:
//              PushInstruction("local 1")
//          arg[2]:
//              PushInstruction("local 2")
//          call: CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 14301
A=M // 14302
D=M // 14303
@SP // 14304
AM=M+1 // 14305
A=A-1 // 14306
M=D // 14307
@LCL // 14308
A=M+1 // 14309
D=M // 14310
@SP // 14311
AM=M+1 // 14312
A=A-1 // 14313
M=D // 14314
@LCL // 14315
A=M+1 // 14316
A=A+1 // 14317
D=M // 14318
@SP // 14319
AM=M+1 // 14320
A=A-1 // 14321
M=D // 14322
// call Memory.copy
@8 // 14323
D=A // 14324
@14 // 14325
M=D // 14326
@Memory.copy // 14327
D=A // 14328
@13 // 14329
M=D // 14330
@Memory.realloc.ret.2 // 14331
D=A // 14332
@CALL // 14333
0;JMP // 14334
(Memory.realloc.ret.2)
@SP // 14335
AM=M-1 // 14336
D=M // 14337
@5 // 14338
M=D // 14339

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=3, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 14340
A=M // 14341
D=M // 14342
@SP // 14343
AM=M+1 // 14344
A=A-1 // 14345
M=D // 14346
// call Memory.deAlloc
@6 // 14347
D=A // 14348
@14 // 14349
M=D // 14350
@Memory.deAlloc // 14351
D=A // 14352
@13 // 14353
M=D // 14354
@Memory.realloc.ret.3 // 14355
D=A // 14356
@CALL // 14357
0;JMP // 14358
(Memory.realloc.ret.3)
@SP // 14359
AM=M-1 // 14360
D=M // 14361
@5 // 14362
M=D // 14363

////PushInstruction (
//  PushInstruction("local 1")
//)

@LCL // 14364
A=M+1 // 14365
D=M // 14366
@SP // 14367
AM=M+1 // 14368
A=A-1 // 14369
M=D // 14370

////ReturnInstruction{}
@RETURN // 14371
0;JMP // 14372

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 14373
AM=M+1 // 14374
A=A-1 // 14375
M=0 // 14376

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 14377
A=M // 14378
M=0 // 14379

////LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 0")
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
//, ifGoto=IfGotoInstruction{label='WHILE_END_Memory.copy1}}
@LCL // 14380
A=M // 14381
D=M // 14382
@R13 // 14383
M=D // 14384
@ARG // 14385
A=M+1 // 14386
A=A+1 // 14387
D=M // 14388
@R13 // 14389
D=M-D // 14390
@15 // 14391
M=D // 14392
@Memory.copy.LT.36 // 14393
D=A // 14394
@13 // 14395
M=D // 14396
@DO_LT // 14397
0;JMP // 14398
(Memory.copy.LT.36)
@15 // 14399
M=D // 14400
@Memory.copy.EQ.35 // 14401
D=A // 14402
@13 // 14403
M=D // 14404
@DO_EQ // 14405
0;JMP // 14406
(Memory.copy.EQ.35)
@WHILE_END_Memory.copy1 // 14407
D;JNE // 14408

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("local 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14409
A=M // 14410
D=M // 14411
@R13 // 14412
M=D // 14413
@LCL // 14414
A=M // 14415
D=M // 14416
@R13 // 14417
D=D+M // 14418
@4 // 14419
M=D // 14420

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
//,
//                  right:
//                      PushInstruction("local 0")
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

@THAT // 14421
A=M // 14422
D=M // 14423
@THAT // 14424
A=M // 14425
M=D // 14426

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

@LCL // 14427
A=M // 14428
M=M+1 // 14429

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 14430
0;JMP // 14431

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14432
AM=M+1 // 14433
A=A-1 // 14434
M=0 // 14435

////ReturnInstruction{}
@RETURN // 14436
0;JMP // 14437

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              PushInstruction("constant 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14438
A=M+1 // 14439
D=M // 14440
@2 // 14441
D=D+A // 14442
@4 // 14443
M=D // 14444

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse1}}
@THAT // 14445
A=M // 14446
D=M // 14447
@15 // 14448
M=D // 14449
@Memory.remove_node.EQ.39 // 14450
D=A // 14451
@13 // 14452
M=D // 14453
@DO_EQ // 14454
0;JMP // 14455
(Memory.remove_node.EQ.39)
D=!D // 14456
@15 // 14457
M=D // 14458
@Memory.remove_node.EQ.38 // 14459
D=A // 14460
@13 // 14461
M=D // 14462
@DO_EQ // 14463
0;JMP // 14464
(Memory.remove_node.EQ.38)
@Memory.remove_node.IfElse1 // 14465
D;JNE // 14466

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14467
A=M+1 // 14468
D=M // 14469
@3 // 14470
D=D+A // 14471
@4 // 14472
M=D // 14473

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      BinaryPushGroup(
//                          left:
//                              PushInstruction("argument 1")
//,
//                          right:
//                              PushInstruction("constant 2")
//,
//                          binaryOp: "ADD"
//                      ),
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

@THAT // 14474
A=M // 14475
D=M // 14476
@THAT // 14477
A=M // 14478
M=D // 14479

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 14480
0;JMP // 14481

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14482
A=M+1 // 14483
D=M // 14484
@3 // 14485
D=D+A // 14486
@4 // 14487
M=D // 14488

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
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

@THAT // 14489
A=M // 14490
D=M // 14491
@THAT // 14492
A=M // 14493
M=D // 14494

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14495
A=M+1 // 14496
D=M // 14497
@3 // 14498
D=D+A // 14499
@4 // 14500
M=D // 14501

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse2}}
@THAT // 14502
A=M // 14503
D=M // 14504
@15 // 14505
M=D // 14506
@Memory.remove_node.EQ.42 // 14507
D=A // 14508
@13 // 14509
M=D // 14510
@DO_EQ // 14511
0;JMP // 14512
(Memory.remove_node.EQ.42)
D=!D // 14513
@15 // 14514
M=D // 14515
@Memory.remove_node.EQ.41 // 14516
D=A // 14517
@13 // 14518
M=D // 14519
@DO_EQ // 14520
0;JMP // 14521
(Memory.remove_node.EQ.41)
@Memory.remove_node.IfElse2 // 14522
D;JNE // 14523

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 1")
//,
//          right:
//              PushInstruction("constant 2")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14524
A=M+1 // 14525
D=M // 14526
@2 // 14527
D=D+A // 14528
@4 // 14529
M=D // 14530

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      BinaryPushGroup(
//                          left:
//                              PushInstruction("argument 1")
//,
//                          right:
//                              PushInstruction("constant 3")
//,
//                          binaryOp: "ADD"
//                      ),
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

@THAT // 14531
A=M // 14532
D=M // 14533
@THAT // 14534
A=M // 14535
M=D // 14536

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 14537
0;JMP // 14538

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@THAT // 14539
A=M // 14540
M=0 // 14541

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@THAT // 14542
A=M // 14543
M=0 // 14544

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14545
AM=M+1 // 14546
A=A-1 // 14547
M=0 // 14548

////ReturnInstruction{}
@RETURN // 14549
0;JMP // 14550

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 14551
AM=M+1 // 14552
A=A-1 // 14553
M=0 // 14554

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 14555
A=M // 14556
M=0 // 14557

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("local 0")
//,
//                      right:
//                          PushInstruction("constant 7")
//,
//                      binaryOp: "LT"
//                  ),
//              right:
//                  UnaryPushGroup(
//                      inner:
//                          BinaryPushGroup(
//                              left:
//                                  PushInstruction("that 0")
//,
//                              right:
//                                  PushInstruction("constant 0")
//,
//                              binaryOp: "EQ"
//                          ),
//                      unaryOp: NOT
//                  ),
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}}
@LCL // 14558
A=M // 14559
D=M // 14560
@7 // 14561
D=D-A // 14562
@15 // 14563
M=D // 14564
@Memory.getBinIndex.LT.46 // 14565
D=A // 14566
@13 // 14567
M=D // 14568
@DO_LT // 14569
0;JMP // 14570
(Memory.getBinIndex.LT.46)
@SP // 14571
AM=M+1 // 14572
A=A-1 // 14573
M=D // 14574
@THAT // 14575
A=M // 14576
D=M // 14577
@15 // 14578
M=D // 14579
@Memory.getBinIndex.EQ.47 // 14580
D=A // 14581
@13 // 14582
M=D // 14583
@DO_EQ // 14584
0;JMP // 14585
(Memory.getBinIndex.EQ.47)
D=!D // 14586
@SP // 14587
AM=M-1 // 14588
D=D&M // 14589
@15 // 14590
M=D // 14591
@Memory.getBinIndex.EQ.45 // 14592
D=A // 14593
@13 // 14594
M=D // 14595
@DO_EQ // 14596
0;JMP // 14597
(Memory.getBinIndex.EQ.45)
@WHILE_END_Memory.getBinIndex1 // 14598
D;JNE // 14599

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
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
//                                          PushInstruction("constant 1")
//,
//                                      binaryOp: "ADD"
//                                  )                              arg[1]:
//                                  PushInstruction("constant 16")
//                              call: CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=0, Memory.remove_node=0}, currentFunction='Memory.getBinIndex'}
//                          ),
//                      binaryOp: "GT"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.getBinIndex.IfElse1}}
@ARG // 14600
A=M // 14601
D=M // 14602
@SP // 14603
AM=M+1 // 14604
A=A-1 // 14605
M=D // 14606
@LCL // 14607
A=M // 14608
D=M // 14609
@SP // 14610
AM=M+1 // 14611
A=A-1 // 14612
M=D+1 // 14613
@16 // 14614
D=A // 14615
@SP // 14616
AM=M+1 // 14617
A=A-1 // 14618
M=D // 14619
// call Math.multiply
@7 // 14620
D=A // 14621
@14 // 14622
M=D // 14623
@Math.multiply // 14624
D=A // 14625
@13 // 14626
M=D // 14627
@Memory.getBinIndex.ret.1 // 14628
D=A // 14629
@CALL // 14630
0;JMP // 14631
(Memory.getBinIndex.ret.1)
@SP // 14632
AM=M-1 // 14633
D=M // 14634
@SP // 14635
AM=M-1 // 14636
D=M-D // 14637
@15 // 14638
M=D // 14639
@Memory.getBinIndex.GT.50 // 14640
D=A // 14641
@13 // 14642
M=D // 14643
@DO_GT // 14644
0;JMP // 14645
(Memory.getBinIndex.GT.50)
D=!D // 14646
@15 // 14647
M=D // 14648
@Memory.getBinIndex.EQ.49 // 14649
D=A // 14650
@13 // 14651
M=D // 14652
@DO_EQ // 14653
0;JMP // 14654
(Memory.getBinIndex.EQ.49)
@Memory.getBinIndex.IfElse1 // 14655
D;JNE // 14656

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 14657
A=M // 14658
D=M // 14659
@SP // 14660
AM=M+1 // 14661
A=A-1 // 14662
M=D // 14663

////ReturnInstruction{}
@RETURN // 14664
0;JMP // 14665

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 14666
0;JMP // 14667

////LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)

////LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)

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

@LCL // 14668
A=M // 14669
M=M+1 // 14670

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 14671
0;JMP // 14672

////LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)

////BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("constant 7")
//,
//      right:
//          PushInstruction("constant 1")
//,
//      binaryOp: "SUB"
//  ))

@6 // 14673
D=A // 14674
@SP // 14675
AM=M+1 // 14676
A=A-1 // 14677
M=D // 14678
@7 // 14679
D=A // 14680
@SP // 14681
AM=M+1 // 14682
A=A-1 // 14683
M=D-1 // 14684

////ReturnInstruction{}
@RETURN // 14685
0;JMP // 14686

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 14687
AM=M+1 // 14688
A=A-1 // 14689
M=0 // 14690

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14691
A=M // 14692
D=M // 14693
@4 // 14694
M=D // 14695

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@THAT // 14696
A=M // 14697
D=M // 14698
@LCL // 14699
A=M // 14700
M=D // 14701

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

@LCL // 14702
A=M // 14703
D=M // 14704
@4 // 14705
M=D // 14706

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("that 0")
//,
//                      right:
//                          PushInstruction("argument 1")
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
//, ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse1}}
@THAT // 14707
A=M // 14708
D=M // 14709
@R13 // 14710
M=D // 14711
@ARG // 14712
A=M+1 // 14713
D=M // 14714
@R13 // 14715
D=M-D // 14716
@15 // 14717
M=D // 14718
@Memory.get_best_fit.LT.53 // 14719
D=A // 14720
@13 // 14721
M=D // 14722
@DO_LT // 14723
0;JMP // 14724
(Memory.get_best_fit.LT.53)
D=!D // 14725
@15 // 14726
M=D // 14727
@Memory.get_best_fit.EQ.52 // 14728
D=A // 14729
@13 // 14730
M=D // 14731
@DO_EQ // 14732
0;JMP // 14733
(Memory.get_best_fit.EQ.52)
@Memory.get_best_fit.IfElse1 // 14734
D;JNE // 14735

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 14736
A=M // 14737
D=M // 14738
@SP // 14739
AM=M+1 // 14740
A=A-1 // 14741
M=D // 14742

////ReturnInstruction{}
@RETURN // 14743
0;JMP // 14744

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 14745
0;JMP // 14746

////LabelInstruction{label='Memory.get_best_fit.IfElse1}
// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND1}
// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.get_best_fit1}
// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 14747
A=M // 14748
D=M // 14749
@3 // 14750
D=D+A // 14751
@4 // 14752
M=D // 14753

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}}
@THAT // 14754
A=M // 14755
D=M // 14756
@15 // 14757
M=D // 14758
@Memory.get_best_fit.EQ.56 // 14759
D=A // 14760
@13 // 14761
M=D // 14762
@DO_EQ // 14763
0;JMP // 14764
(Memory.get_best_fit.EQ.56)
D=!D // 14765
@15 // 14766
M=D // 14767
@Memory.get_best_fit.EQ.55 // 14768
D=A // 14769
@13 // 14770
M=D // 14771
@DO_EQ // 14772
0;JMP // 14773
(Memory.get_best_fit.EQ.55)
@WHILE_END_Memory.get_best_fit1 // 14774
D;JNE // 14775

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 14776
A=M // 14777
D=M // 14778
@3 // 14779
D=D+A // 14780
@4 // 14781
M=D // 14782

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@THAT // 14783
A=M // 14784
D=M // 14785
@LCL // 14786
A=M // 14787
M=D // 14788

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

@LCL // 14789
A=M // 14790
D=M // 14791
@4 // 14792
M=D // 14793

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("that 0")
//,
//                      right:
//                          PushInstruction("argument 1")
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
//, ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse2}}
@THAT // 14794
A=M // 14795
D=M // 14796
@R13 // 14797
M=D // 14798
@ARG // 14799
A=M+1 // 14800
D=M // 14801
@R13 // 14802
D=M-D // 14803
@15 // 14804
M=D // 14805
@Memory.get_best_fit.LT.59 // 14806
D=A // 14807
@13 // 14808
M=D // 14809
@DO_LT // 14810
0;JMP // 14811
(Memory.get_best_fit.LT.59)
D=!D // 14812
@15 // 14813
M=D // 14814
@Memory.get_best_fit.EQ.58 // 14815
D=A // 14816
@13 // 14817
M=D // 14818
@DO_EQ // 14819
0;JMP // 14820
(Memory.get_best_fit.EQ.58)
@Memory.get_best_fit.IfElse2 // 14821
D;JNE // 14822

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 14823
A=M // 14824
D=M // 14825
@SP // 14826
AM=M+1 // 14827
A=A-1 // 14828
M=D // 14829

////ReturnInstruction{}
@RETURN // 14830
0;JMP // 14831

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 14832
0;JMP // 14833

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 14834
0;JMP // 14835

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14836
AM=M+1 // 14837
A=A-1 // 14838
M=0 // 14839

////ReturnInstruction{}
@RETURN // 14840
0;JMP // 14841

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
//,
//                  right:
//                      BinaryPushGroup(
//                          left:
//                              PushInstruction("that 0")
//,
//                          right:
//                              PushInstruction("constant 4")
//,
//                          binaryOp: "ADD"
//                      ),
//                  binaryOp: "ADD"
//              )            )
//
//          pop: PopInstruction{address=pointer 1}
//        }
//    )
//
//  pop: PopInstruction{address=that 0}
//}

@ARG // 14842
A=M // 14843
D=M // 14844
@THAT // 14845
A=M // 14846
M=D // 14847

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14848
AM=M+1 // 14849
A=A-1 // 14850
M=0 // 14851

////ReturnInstruction{}
@RETURN // 14852
0;JMP // 14853

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 14854
AM=M+1 // 14855
A=A-1 // 14856
M=0 // 14857
@SP // 14858
AM=M+1 // 14859
A=A-1 // 14860
M=0 // 14861

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@THAT // 14862
A=M // 14863
M=0 // 14864

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@THAT // 14865
A=M // 14866
M=0 // 14867

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14868
A=M // 14869
D=M // 14870
@4 // 14871
M=D // 14872

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse1}}
@THAT // 14873
A=M // 14874
D=M // 14875
@15 // 14876
M=D // 14877
@Memory.add_node.EQ.62 // 14878
D=A // 14879
@13 // 14880
M=D // 14881
@DO_EQ // 14882
0;JMP // 14883
(Memory.add_node.EQ.62)
@15 // 14884
M=D // 14885
@Memory.add_node.EQ.61 // 14886
D=A // 14887
@13 // 14888
M=D // 14889
@DO_EQ // 14890
0;JMP // 14891
(Memory.add_node.EQ.61)
@Memory.add_node.IfElse1 // 14892
D;JNE // 14893

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
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

@ARG // 14894
A=M+1 // 14895
D=M // 14896
@THAT // 14897
A=M // 14898
M=D // 14899

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 14900
AM=M+1 // 14901
A=A-1 // 14902
M=0 // 14903

////ReturnInstruction{}
@RETURN // 14904
0;JMP // 14905

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 14906
0;JMP // 14907

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 14908
A=M // 14909
D=M // 14910
@4 // 14911
M=D // 14912

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@THAT // 14913
A=M // 14914
D=M // 14915
@LCL // 14916
A=M // 14917
M=D // 14918

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 0")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 14919
A=M+1 // 14920
M=0 // 14921

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  UnaryPushGroup(
//                      inner:
//                          BinaryPushGroup(
//                              left:
//                                  PushInstruction("local 0")
//,
//                              right:
//                                  PushInstruction("constant 0")
//,
//                              binaryOp: "EQ"
//                          ),
//                      unaryOp: NOT
//                  ),
//              right:
//                  UnaryPushGroup(
//                      inner:
//                          BinaryPushGroup(
//                              left:
//                                  PushInstruction("that 0")
//,
//                              right:
//                                  PushInstruction("that 0")
//,
//                              binaryOp: "GT"
//                          ),
//                      unaryOp: NOT
//                  ),
//              binaryOp: "AND"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Memory.add_node1}}
@LCL // 14922
A=M // 14923
D=M // 14924
@15 // 14925
M=D // 14926
@Memory.add_node.EQ.66 // 14927
D=A // 14928
@13 // 14929
M=D // 14930
@DO_EQ // 14931
0;JMP // 14932
(Memory.add_node.EQ.66)
@SP // 14933
AM=M+1 // 14934
A=A-1 // 14935
M=D // 14936
@SP // 14937
A=M-1 // 14938
M=!D // 14939
@THAT // 14940
A=M // 14941
D=M // 14942
D=D-M // 14943
@15 // 14944
M=D // 14945
@Memory.add_node.GT.67 // 14946
D=A // 14947
@13 // 14948
M=D // 14949
@DO_GT // 14950
0;JMP // 14951
(Memory.add_node.GT.67)
D=!D // 14952
@SP // 14953
AM=M-1 // 14954
D=D&M // 14955
@15 // 14956
M=D // 14957
@Memory.add_node.EQ.65 // 14958
D=A // 14959
@13 // 14960
M=D // 14961
@DO_EQ // 14962
0;JMP // 14963
(Memory.add_node.EQ.65)
@WHILE_END_Memory.add_node1 // 14964
D;JNE // 14965

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 0")
//    )
//
//  pop: PopInstruction{address=local 1}
//}

@LCL // 14966
A=M // 14967
D=M // 14968
@LCL // 14969
A=M+1 // 14970
M=D // 14971

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 3")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@LCL // 14972
A=M // 14973
D=M // 14974
@3 // 14975
D=D+A // 14976
@4 // 14977
M=D // 14978

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@THAT // 14979
A=M // 14980
D=M // 14981
@LCL // 14982
A=M // 14983
M=D // 14984

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 14985
0;JMP // 14986

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  PushInstruction("local 1")
//,
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL // 14987
A=M+1 // 14988
D=!M // 14989
@15 // 14990
M=D // 14991
@Memory.add_node.EQ.68 // 14992
D=A // 14993
@13 // 14994
M=D // 14995
@DO_EQ // 14996
0;JMP // 14997
(Memory.add_node.EQ.68)
@Memory.add_node.IfElse2 // 14998
D;JNE // 14999

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@ARG // 15000
A=M // 15001
D=M // 15002
@4 // 15003
M=D // 15004

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@THAT // 15005
A=M // 15006
D=M // 15007
@THAT // 15008
A=M // 15009
M=D // 15010

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      BinaryPushGroup(
//                          left:
//                              PushInstruction("argument 0")
//,
//                          right:
//                              PushInstruction("constant 0")
//,
//                          binaryOp: "ADD"
//                      ),
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

@ARG // 15011
A=M+1 // 15012
D=M // 15013
@THAT // 15014
A=M // 15015
M=D // 15016

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
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

@ARG // 15017
A=M+1 // 15018
D=M // 15019
@THAT // 15020
A=M // 15021
M=D // 15022

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 15023
0;JMP // 15024

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 0")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@LCL // 15025
A=M // 15026
D=M // 15027
@THAT // 15028
A=M // 15029
M=D // 15030

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("local 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 1")
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

@LCL // 15031
A=M+1 // 15032
D=M // 15033
@THAT // 15034
A=M // 15035
M=D // 15036

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          PushInstruction("local 0")
//,
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@LCL // 15037
A=M // 15038
D=M // 15039
@15 // 15040
M=D // 15041
@Memory.add_node.EQ.69 // 15042
D=A // 15043
@13 // 15044
M=D // 15045
@DO_EQ // 15046
0;JMP // 15047
(Memory.add_node.EQ.69)
@Memory.add_node.IfElse3 // 15048
D;JNE // 15049

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 0")
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

@ARG // 15050
A=M+1 // 15051
D=M // 15052
@THAT // 15053
A=M // 15054
M=D // 15055

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 15056
0;JMP // 15057

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("local 1")
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

@ARG // 15058
A=M+1 // 15059
D=M // 15060
@THAT // 15061
A=M // 15062
M=D // 15063

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 15064
AM=M+1 // 15065
A=A-1 // 15066
M=0 // 15067

////ReturnInstruction{}
@RETURN // 15068
0;JMP // 15069

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("argument 1")
//      fluff:
//        PushPopPair {
//          push:             BinaryPushGroup (
//              BinaryPushGroup(
//                  left:
//                      PushInstruction("argument 0")
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

@ARG // 15070
A=M+1 // 15071
D=M // 15072
@THAT // 15073
A=M // 15074
M=D // 15075

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 15076
AM=M+1 // 15077
A=A-1 // 15078
M=0 // 15079

////ReturnInstruction{}
@RETURN // 15080
0;JMP // 15081

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15082
D=A // 15083
@14 // 15084
M=D // 15085
@Memory.init // 15086
D=A // 15087
@13 // 15088
M=D // 15089
@Sys.init.ret.0 // 15090
D=A // 15091
@CALL // 15092
0;JMP // 15093
(Sys.init.ret.0)
@SP // 15094
AM=M-1 // 15095
D=M // 15096
@5 // 15097
M=D // 15098

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=1}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15099
D=A // 15100
@14 // 15101
M=D // 15102
@Math.init // 15103
D=A // 15104
@13 // 15105
M=D // 15106
@Sys.init.ret.1 // 15107
D=A // 15108
@CALL // 15109
0;JMP // 15110
(Sys.init.ret.1)
@SP // 15111
AM=M-1 // 15112
D=M // 15113
@5 // 15114
M=D // 15115

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=2}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15116
D=A // 15117
@14 // 15118
M=D // 15119
@Screen.init // 15120
D=A // 15121
@13 // 15122
M=D // 15123
@Sys.init.ret.2 // 15124
D=A // 15125
@CALL // 15126
0;JMP // 15127
(Sys.init.ret.2)
@SP // 15128
AM=M-1 // 15129
D=M // 15130
@5 // 15131
M=D // 15132

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=3}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15133
D=A // 15134
@14 // 15135
M=D // 15136
@Output.init // 15137
D=A // 15138
@13 // 15139
M=D // 15140
@Sys.init.ret.3 // 15141
D=A // 15142
@CALL // 15143
0;JMP // 15144
(Sys.init.ret.3)
@SP // 15145
AM=M-1 // 15146
D=M // 15147
@5 // 15148
M=D // 15149

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=4}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15150
D=A // 15151
@14 // 15152
M=D // 15153
@Keyboard.init // 15154
D=A // 15155
@13 // 15156
M=D // 15157
@Sys.init.ret.4 // 15158
D=A // 15159
@CALL // 15160
0;JMP // 15161
(Sys.init.ret.4)
@SP // 15162
AM=M-1 // 15163
D=M // 15164
@5 // 15165
M=D // 15166

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=5}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15167
D=A // 15168
@14 // 15169
M=D // 15170
@Main.main // 15171
D=A // 15172
@13 // 15173
M=D // 15174
@Sys.init.ret.5 // 15175
D=A // 15176
@CALL // 15177
0;JMP // 15178
(Sys.init.ret.5)
@SP // 15179
AM=M-1 // 15180
D=M // 15181
@5 // 15182
M=D // 15183

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=6}, currentFunction='Sys.init'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15184
D=A // 15185
@14 // 15186
M=D // 15187
@Sys.halt // 15188
D=A // 15189
@13 // 15190
M=D // 15191
@Sys.init.ret.6 // 15192
D=A // 15193
@CALL // 15194
0;JMP // 15195
(Sys.init.ret.6)
@SP // 15196
AM=M-1 // 15197
D=M // 15198
@5 // 15199
M=D // 15200

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 15201
AM=M+1 // 15202
A=A-1 // 15203
M=0 // 15204

////ReturnInstruction{}
@RETURN // 15205
0;JMP // 15206

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

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
//, ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0 // 15207
@WHILE_END_Sys.halt1 // 15208
D;JNE // 15209

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15210
0;JMP // 15211

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 15212
AM=M+1 // 15213
A=A-1 // 15214
M=0 // 15215

////ReturnInstruction{}
@RETURN // 15216
0;JMP // 15217

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15218
AM=M+1 // 15219
A=A-1 // 15220
M=0 // 15221

////LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)

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
//              binaryOp: "GT"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Sys.wait1}}
@ARG // 15222
A=M // 15223
D=M // 15224
@15 // 15225
M=D // 15226
@Sys.wait.GT.2 // 15227
D=A // 15228
@13 // 15229
M=D // 15230
@DO_GT // 15231
0;JMP // 15232
(Sys.wait.GT.2)
@15 // 15233
M=D // 15234
@Sys.wait.EQ.1 // 15235
D=A // 15236
@13 // 15237
M=D // 15238
@DO_EQ // 15239
0;JMP // 15240
(Sys.wait.EQ.1)
@WHILE_END_Sys.wait1 // 15241
D;JNE // 15242

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("argument 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=argument 0}
//}

@ARG // 15243
A=M // 15244
M=M-1 // 15245

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("constant 70")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@70 // 15246
D=A // 15247
@LCL // 15248
A=M // 15249
M=D // 15250

////LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 0")
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
//, ifGoto=IfGotoInstruction{label='WHILE_END_Sys.wait2}}
@LCL // 15251
A=M // 15252
D=M // 15253
@15 // 15254
M=D // 15255
@Sys.wait.GT.5 // 15256
D=A // 15257
@13 // 15258
M=D // 15259
@DO_GT // 15260
0;JMP // 15261
(Sys.wait.GT.5)
@15 // 15262
M=D // 15263
@Sys.wait.EQ.4 // 15264
D=A // 15265
@13 // 15266
M=D // 15267
@DO_EQ // 15268
0;JMP // 15269
(Sys.wait.EQ.4)
@WHILE_END_Sys.wait2 // 15270
D;JNE // 15271

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("local 0")
//,
//          right:
//              PushInstruction("constant 1")
//,
//          binaryOp: "SUB"
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@LCL // 15272
A=M // 15273
M=M-1 // 15274

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15275
0;JMP // 15276

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15277
0;JMP // 15278

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 15279
AM=M+1 // 15280
A=A-1 // 15281
M=0 // 15282

////ReturnInstruction{}
@RETURN // 15283
0;JMP // 15284

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction (
//  PushInstruction("constant 0")
//)

@SP // 15285
AM=M+1 // 15286
A=A-1 // 15287
M=0 // 15288

////ReturnInstruction{}
@RETURN // 15289
0;JMP // 15290

////FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 24576")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@24576 // 15291
D=A // 15292
@4 // 15293
M=D // 15294

////PushInstruction (
//  PushInstruction("that 0")
//)

@THAT // 15295
A=M // 15296
D=M // 15297
@SP // 15298
AM=M+1 // 15299
A=A-1 // 15300
M=D // 15301

////ReturnInstruction{}
@RETURN // 15302
0;JMP // 15303

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 15304
AM=M+1 // 15305
A=A-1 // 15306
M=0 // 15307

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 24576")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@24576 // 15308
D=A // 15309
@4 // 15310
M=D // 15311

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}}
@THAT // 15312
A=M // 15313
D=M // 15314
@15 // 15315
M=D // 15316
@Keyboard.readChar.EQ.2 // 15317
D=A // 15318
@13 // 15319
M=D // 15320
@DO_EQ // 15321
0;JMP // 15322
(Keyboard.readChar.EQ.2)
@15 // 15323
M=D // 15324
@Keyboard.readChar.EQ.1 // 15325
D=A // 15326
@13 // 15327
M=D // 15328
@DO_EQ // 15329
0;JMP // 15330
(Keyboard.readChar.EQ.1)
@WHILE_END_Keyboard.readChar1 // 15331
D;JNE // 15332

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 15333
0;JMP // 15334

////LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 24576")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@24576 // 15335
D=A // 15336
@4 // 15337
M=D // 15338

////PushPopPair {
//  push:     PushInstruction (
//      PushInstruction("that 0")
//    )
//
//  pop: PopInstruction{address=local 0}
//}

@THAT // 15339
A=M // 15340
D=M // 15341
@LCL // 15342
A=M // 15343
M=D // 15344

////LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)

////PushPopPair {
//  push:     BinaryPushGroup (
//      BinaryPushGroup(
//          left:
//              PushInstruction("constant 24576")
//,
//          right:
//              PushInstruction("constant 0")
//,
//          binaryOp: "ADD"
//      )    )
//
//  pop: PopInstruction{address=pointer 1}
//}

@24576 // 15345
D=A // 15346
@4 // 15347
M=D // 15348

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          UnaryPushGroup(
//              inner:
//                  BinaryPushGroup(
//                      left:
//                          PushInstruction("that 0")
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
//, ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}}
@THAT // 15349
A=M // 15350
D=M // 15351
@15 // 15352
M=D // 15353
@Keyboard.readChar.EQ.5 // 15354
D=A // 15355
@13 // 15356
M=D // 15357
@DO_EQ // 15358
0;JMP // 15359
(Keyboard.readChar.EQ.5)
D=!D // 15360
@15 // 15361
M=D // 15362
@Keyboard.readChar.EQ.4 // 15363
D=A // 15364
@13 // 15365
M=D // 15366
@DO_EQ // 15367
0;JMP // 15368
(Keyboard.readChar.EQ.4)
@WHILE_END_Keyboard.readChar2 // 15369
D;JNE // 15370

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 15371
0;JMP // 15372

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 15373
A=M // 15374
D=M // 15375
@SP // 15376
AM=M+1 // 15377
A=A-1 // 15378
M=D // 15379
// call Output.printChar
@6 // 15380
D=A // 15381
@14 // 15382
M=D // 15383
@Output.printChar // 15384
D=A // 15385
@13 // 15386
M=D // 15387
@Keyboard.readChar.ret.0 // 15388
D=A // 15389
@CALL // 15390
0;JMP // 15391
(Keyboard.readChar.ret.0)
@SP // 15392
AM=M-1 // 15393
D=M // 15394
@5 // 15395
M=D // 15396

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 15397
A=M // 15398
D=M // 15399
@SP // 15400
AM=M+1 // 15401
A=A-1 // 15402
M=D // 15403

////ReturnInstruction{}
@RETURN // 15404
0;JMP // 15405

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 15406
AM=M+1 // 15407
A=A-1 // 15408
M=0 // 15409
@SP // 15410
AM=M+1 // 15411
A=A-1 // 15412
M=0 // 15413

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("argument 0")
//          call: CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@ARG // 15414
A=M // 15415
D=M // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420
// call Output.printString
@6 // 15421
D=A // 15422
@14 // 15423
M=D // 15424
@Output.printString // 15425
D=A // 15426
@13 // 15427
M=D // 15428
@Keyboard.readLine.ret.0 // 15429
D=A // 15430
@CALL // 15431
0;JMP // 15432
(Keyboard.readLine.ret.0)
@SP // 15433
AM=M-1 // 15434
D=M // 15435
@5 // 15436
M=D // 15437

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("constant 50")
//          call: CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=1}, currentFunction='Keyboard.readLine'}
//      )    )
//
//  pop: PopInstruction{address=local 0}
//}

@50 // 15438
D=A // 15439
@SP // 15440
AM=M+1 // 15441
A=A-1 // 15442
M=D // 15443
// call String.new
@6 // 15444
D=A // 15445
@14 // 15446
M=D // 15447
@String.new // 15448
D=A // 15449
@13 // 15450
M=D // 15451
@Keyboard.readLine.ret.1 // 15452
D=A // 15453
@CALL // 15454
0;JMP // 15455
(Keyboard.readLine.ret.1)
@SP // 15456
AM=M-1 // 15457
D=M // 15458
@LCL // 15459
A=M // 15460
M=D // 15461

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=2}, currentFunction='Keyboard.readLine'}
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 15462
D=A // 15463
@14 // 15464
M=D // 15465
@Keyboard.readChar // 15466
D=A // 15467
@13 // 15468
M=D // 15469
@Keyboard.readLine.ret.2 // 15470
D=A // 15471
@CALL // 15472
0;JMP // 15473
(Keyboard.readLine.ret.2)
@SP // 15474
AM=M-1 // 15475
D=M // 15476
@LCL // 15477
A=M+1 // 15478
M=D // 15479

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

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
//                          CallGroup(
//                              call: CallInstruction{calleeFunction='String.newLine', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=3}, currentFunction='Keyboard.readLine'}
//                          ),
//                      binaryOp: "EQ"
//                  ),
//              unaryOp: NOT
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}}
@LCL // 15480
A=M+1 // 15481
D=M // 15482
@SP // 15483
AM=M+1 // 15484
A=A-1 // 15485
M=D // 15486
// call String.newLine
@5 // 15487
D=A // 15488
@14 // 15489
M=D // 15490
@String.newLine // 15491
D=A // 15492
@13 // 15493
M=D // 15494
@Keyboard.readLine.ret.4 // 15495
D=A // 15496
@CALL // 15497
0;JMP // 15498
(Keyboard.readLine.ret.4)
@SP // 15499
AM=M-1 // 15500
D=M // 15501
@SP // 15502
AM=M-1 // 15503
D=M-D // 15504
@15 // 15505
M=D // 15506
@Keyboard.readLine.EQ.8 // 15507
D=A // 15508
@13 // 15509
M=D // 15510
@DO_EQ // 15511
0;JMP // 15512
(Keyboard.readLine.EQ.8)
D=!D // 15513
@15 // 15514
M=D // 15515
@Keyboard.readLine.EQ.7 // 15516
D=A // 15517
@13 // 15518
M=D // 15519
@DO_EQ // 15520
0;JMP // 15521
(Keyboard.readLine.EQ.7)
@WHILE_END_Keyboard.readLine1 // 15522
D;JNE // 15523

////ConditionalGroup{push=BinaryPushGroup (
//  BinaryPushGroup(
//      left:
//          BinaryPushGroup(
//              left:
//                  PushInstruction("local 1")
//,
//              right:
//                  PushInstruction("constant 129")
//,
//              binaryOp: "EQ"
//          ),
//      right:
//          PushInstruction("constant 0")
//,
//      binaryOp: "EQ"
//  ))
//, ifGoto=IfGotoInstruction{label='Keyboard.readLine.IfElse1}}
@LCL // 15524
A=M+1 // 15525
D=M // 15526
@129 // 15527
D=D-A // 15528
@15 // 15529
M=D // 15530
@Keyboard.readLine.EQ.11 // 15531
D=A // 15532
@13 // 15533
M=D // 15534
@DO_EQ // 15535
0;JMP // 15536
(Keyboard.readLine.EQ.11)
@15 // 15537
M=D // 15538
@Keyboard.readLine.EQ.10 // 15539
D=A // 15540
@13 // 15541
M=D // 15542
@DO_EQ // 15543
0;JMP // 15544
(Keyboard.readLine.EQ.10)
@Keyboard.readLine.IfElse1 // 15545
D;JNE // 15546

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          call: CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 15547
A=M // 15548
D=M // 15549
@SP // 15550
AM=M+1 // 15551
A=A-1 // 15552
M=D // 15553
// call String.eraseLastChar
@6 // 15554
D=A // 15555
@14 // 15556
M=D // 15557
@String.eraseLastChar // 15558
D=A // 15559
@13 // 15560
M=D // 15561
@Keyboard.readLine.ret.5 // 15562
D=A // 15563
@CALL // 15564
0;JMP // 15565
(Keyboard.readLine.ret.5)
@SP // 15566
AM=M-1 // 15567
D=M // 15568
@5 // 15569
M=D // 15570

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 15571
0;JMP // 15572

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          arg[0]:
//              PushInstruction("local 0")
//          arg[1]:
//              PushInstruction("local 1")
//          call: CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}
//      )    )
//
//  pop: PopInstruction{address=temp 0}
//}

@LCL // 15573
A=M // 15574
D=M // 15575
@SP // 15576
AM=M+1 // 15577
A=A-1 // 15578
M=D // 15579
@LCL // 15580
A=M+1 // 15581
D=M // 15582
@SP // 15583
AM=M+1 // 15584
A=A-1 // 15585
M=D // 15586
// call String.appendChar
@7 // 15587
D=A // 15588
@14 // 15589
M=D // 15590
@String.appendChar // 15591
D=A // 15592
@13 // 15593
M=D // 15594
@Keyboard.readLine.ret.6 // 15595
D=A // 15596
@CALL // 15597
0;JMP // 15598
(Keyboard.readLine.ret.6)
@SP // 15599
AM=M-1 // 15600
D=M // 15601
@5 // 15602
M=D // 15603

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push:     CallGroup (
//      CallGroup(
//          call: CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readLine'}
//      )    )
//
//  pop: PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 15604
D=A // 15605
@14 // 15606
M=D // 15607
@Keyboard.readChar // 15608
D=A // 15609
@13 // 15610
M=D // 15611
@Keyboard.readLine.ret.7 // 15612
D=A // 15613
@CALL // 15614
0;JMP // 15615
(Keyboard.readLine.ret.7)
@SP // 15616
AM=M-1 // 15617
D=M // 15618
@LCL // 15619
A=M+1 // 15620
M=D // 15621

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 15622
0;JMP // 15623

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction (
//  PushInstruction("local 0")
//)

@LCL // 15624
A=M // 15625
D=M // 15626
@SP // 15627
AM=M+1 // 15628
A=A-1 // 15629
M=D // 15630

////ReturnInstruction{}
@RETURN // 15631
0;JMP // 15632

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 15633
AM=M+1 // 15634
A=A-1 // 15635
M=0 // 15636

////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////CallGroup (
//  CallGroup(
//      arg[0]:
//          PushInstruction("argument 0")
//      call: CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}
//  ))

@ARG // 15637
A=M // 15638
D=M // 15639
@SP // 15640
AM=M+1 // 15641
A=A-1 // 15642
M=D // 15643
// call Memory.alloc
@6 // 15644
D=A // 15645
@14 // 15646
M=D // 15647
@Memory.alloc // 15648
D=A // 15649
@13 // 15650
M=D // 15651
@Array.new.ret.0 // 15652
D=A // 15653
@CALL // 15654
0;JMP // 15655
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 15656
0;JMP // 15657

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

