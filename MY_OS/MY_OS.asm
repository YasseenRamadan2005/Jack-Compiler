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
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=Screen.0}
//}

@Screen.0 // 130
M=-1 // 131

////PushInstruction("constant 0")
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
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=Screen.0}
//}

@ARG // 138
A=M // 139
D=M // 140
@Screen.0 // 141
M=D // 142

////PushInstruction("constant 0")
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
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
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
@ARG // 218
A=M // 219
D=M // 220
@15 // 221
D=D&A // 222
@LCL // 223
A=M+1 // 224
M=D // 225

////ConditionalGroup{push=BinaryPushGroup(
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
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 247
A=M // 248
D=M // 249
@4 // 250
M=D // 251

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawPixel'}},
//    binaryOp: "OR"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 252
A=M // 253
D=M // 254
@4 // 255
M=D // 256
@THAT // 257
A=M // 258
D=M // 259
@SP // 260
AM=M+1 // 261
A=A-1 // 262
M=D // 263
@LCL // 264
A=M+1 // 265
D=M // 266
@SP // 267
AM=M+1 // 268
A=A-1 // 269
M=D // 270
// call Math.twoToThe
@6 // 271
D=A // 272
@14 // 273
M=D // 274
@Math.twoToThe // 275
D=A // 276
@13 // 277
M=D // 278
@Screen.drawPixel.ret.4 // 279
D=A // 280
@CALL // 281
0;JMP // 282
(Screen.drawPixel.ret.4)
@SP // 283
AM=M-1 // 284
D=M // 285
@SP // 286
AM=M-1 // 287
D=D|M // 288
@THAT // 289
A=M // 290
M=D // 291

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 292
0;JMP // 293

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 294
A=M // 295
D=M // 296
@4 // 297
M=D // 298

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=5}, currentFunction='Screen.drawPixel'}},
//NOT),
//    binaryOp: "AND"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 299
A=M // 300
D=M // 301
@4 // 302
M=D // 303
@THAT // 304
A=M // 305
D=M // 306
@SP // 307
AM=M+1 // 308
A=A-1 // 309
M=D // 310
@LCL // 311
A=M+1 // 312
D=M // 313
@SP // 314
AM=M+1 // 315
A=A-1 // 316
M=D // 317
// call Math.twoToThe
@6 // 318
D=A // 319
@14 // 320
M=D // 321
@Math.twoToThe // 322
D=A // 323
@13 // 324
M=D // 325
@Screen.drawPixel.ret.5 // 326
D=A // 327
@CALL // 328
0;JMP // 329
(Screen.drawPixel.ret.5)
@SP // 330
AM=M-1 // 331
D=M // 332
D=!D // 333
@SP // 334
AM=M-1 // 335
D=D&M // 336
@THAT // 337
A=M // 338
M=D // 339

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 340
AM=M+1 // 341
A=A-1 // 342
M=0 // 343

////ReturnInstruction{}
@RETURN // 344
0;JMP // 345

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 346
AM=M+1 // 347
A=A-1 // 348
M=0 // 349
@SP // 350
AM=M+1 // 351
A=A-1 // 352
M=0 // 353
@SP // 354
AM=M+1 // 355
A=A-1 // 356
M=0 // 357
@SP // 358
AM=M+1 // 359
A=A-1 // 360
M=0 // 361
@SP // 362
AM=M+1 // 363
A=A-1 // 364
M=0 // 365
@SP // 366
AM=M+1 // 367
A=A-1 // 368
M=0 // 369

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 3"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 370
A=M+1 // 371
A=A+1 // 372
D=M // 373
A=A-1 // 374
A=A-1 // 375
D=D-M // 376
@SP // 377
AM=M+1 // 378
A=A-1 // 379
M=D // 380
// call Math.abs
@6 // 381
D=A // 382
@14 // 383
M=D // 384
@Math.abs // 385
D=A // 386
@13 // 387
M=D // 388
@Screen.drawLine.ret.0 // 389
D=A // 390
@CALL // 391
0;JMP // 392
(Screen.drawLine.ret.0)
@SP // 393
AM=M-1 // 394
D=M // 395
@LCL // 396
A=M // 397
M=D // 398
@ARG // 399
A=M+1 // 400
A=A+1 // 401
A=A+1 // 402
D=M // 403
A=A-1 // 404
A=A-1 // 405
D=D-M // 406
@SP // 407
AM=M+1 // 408
A=A-1 // 409
M=D // 410
// call Math.abs
@6 // 411
D=A // 412
@14 // 413
M=D // 414
@Math.abs // 415
D=A // 416
@13 // 417
M=D // 418
@Screen.drawLine.ret.1 // 419
D=A // 420
@CALL // 421
0;JMP // 422
(Screen.drawLine.ret.1)
@SP // 423
AM=M-1 // 424
D=M // 425
@LCL // 426
A=M+1 // 427
M=D // 428

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 429
A=M+1 // 430
A=A+1 // 431
D=M // 432
A=A-1 // 433
A=A-1 // 434
D=M-D // 435
@15 // 436
M=D // 437
@Screen.drawLine.LT.5 // 438
D=A // 439
@13 // 440
M=D // 441
@DO_LT // 442
0;JMP // 443
(Screen.drawLine.LT.5)
@15 // 444
M=D // 445
@Screen.drawLine.EQ.4 // 446
D=A // 447
@13 // 448
M=D // 449
@DO_EQ // 450
0;JMP // 451
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse1 // 452
D;JNE // 453

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 454
A=M+1 // 455
A=A+1 // 456
M=1 // 457

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 458
0;JMP // 459

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 460
A=M+1 // 461
A=A+1 // 462
M=-1 // 463

////LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 464
A=M+1 // 465
A=A+1 // 466
A=A+1 // 467
D=M // 468
A=A-1 // 469
A=A-1 // 470
D=M-D // 471
@15 // 472
M=D // 473
@Screen.drawLine.LT.8 // 474
D=A // 475
@13 // 476
M=D // 477
@DO_LT // 478
0;JMP // 479
(Screen.drawLine.LT.8)
@15 // 480
M=D // 481
@Screen.drawLine.EQ.7 // 482
D=A // 483
@13 // 484
M=D // 485
@DO_EQ // 486
0;JMP // 487
(Screen.drawLine.EQ.7)
@Screen.drawLine.IfElse2 // 488
D;JNE // 489

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 490
A=M+1 // 491
A=A+1 // 492
A=A+1 // 493
M=1 // 494

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 495
0;JMP // 496

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 497
A=M+1 // 498
A=A+1 // 499
A=A+1 // 500
M=-1 // 501

////LabelInstruction{label='Screen.drawLine.IfElseEND2}
// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 502
D=M // 503
@4 // 504
A=D+A // 505
D=A // 506
@13 // 507
M=D // 508
@LCL // 509
A=M+1 // 510
D=M // 511
A=A-1 // 512
D=M-D // 513
@13 // 514
A=M // 515
M=D // 516

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("constant 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0 // 517
@WHILE_END_Screen.drawLine1 // 518
D;JNE // 519

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 520
A=M // 521
D=M // 522
@SP // 523
AM=M+1 // 524
A=A-1 // 525
M=D // 526
@ARG // 527
A=M+1 // 528
D=M // 529
@SP // 530
AM=M+1 // 531
A=A-1 // 532
M=D // 533
// call Screen.drawPixel
@7 // 534
D=A // 535
@14 // 536
M=D // 537
@Screen.drawPixel // 538
D=A // 539
@13 // 540
M=D // 541
@Screen.drawLine.ret.2 // 542
D=A // 543
@CALL // 544
0;JMP // 545
(Screen.drawLine.ret.2)
@SP // 546
AM=M-1 // 547
D=M // 548
@5 // 549
M=D // 550

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 551
A=M+1 // 552
A=A+1 // 553
D=M // 554
A=A-1 // 555
A=A-1 // 556
D=M-D // 557
@15 // 558
M=D // 559
@Screen.drawLine.EQ.12 // 560
D=A // 561
@13 // 562
M=D // 563
@DO_EQ // 564
0;JMP // 565
(Screen.drawLine.EQ.12)
@SP // 566
AM=M+1 // 567
A=A-1 // 568
M=D // 569
@ARG // 570
A=M+1 // 571
A=A+1 // 572
A=A+1 // 573
D=M // 574
A=A-1 // 575
A=A-1 // 576
D=M-D // 577
@15 // 578
M=D // 579
@Screen.drawLine.EQ.13 // 580
D=A // 581
@13 // 582
M=D // 583
@DO_EQ // 584
0;JMP // 585
(Screen.drawLine.EQ.13)
@SP // 586
AM=M-1 // 587
D=D&M // 588
@15 // 589
M=D // 590
@Screen.drawLine.EQ.11 // 591
D=A // 592
@13 // 593
M=D // 594
@DO_EQ // 595
0;JMP // 596
(Screen.drawLine.EQ.11)
@Screen.drawLine.IfElse3 // 597
D;JNE // 598

////PushInstruction("constant 0")
@SP // 599
AM=M+1 // 600
A=A-1 // 601
M=0 // 602

////ReturnInstruction{}
@RETURN // 603
0;JMP // 604

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 605
0;JMP // 606

////LabelInstruction{label='Screen.drawLine.IfElse3}
// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)

////LabelInstruction{label='Screen.drawLine.IfElseEND3}
// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 4"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 607
D=M // 608
@5 // 609
A=D+A // 610
D=A // 611
@13 // 612
M=D // 613
@LCL // 614
D=M // 615
@4 // 616
A=D+A // 617
D=M // 618
D=D+M // 619
@13 // 620
A=M // 621
M=D // 622

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 623
D=M // 624
@5 // 625
A=D+A // 626
D=M // 627
@R13 // 628
M=D // 629
@LCL // 630
A=M+1 // 631
D=M // 632
@R13 // 633
D=D+M // 634
@15 // 635
M=D // 636
@Screen.drawLine.GT.16 // 637
D=A // 638
@13 // 639
M=D // 640
@DO_GT // 641
0;JMP // 642
(Screen.drawLine.GT.16)
@15 // 643
M=D // 644
@Screen.drawLine.EQ.15 // 645
D=A // 646
@13 // 647
M=D // 648
@DO_EQ // 649
0;JMP // 650
(Screen.drawLine.EQ.15)
@Screen.drawLine.IfElse4 // 651
D;JNE // 652

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//)
//      pop:  PopInstruction{address=local 4}
//    }
//  pop:  PopInstruction{address=argument 0}
//}

@LCL // 653
D=M // 654
@4 // 655
A=D+A // 656
D=A // 657
@13 // 658
M=D // 659
@LCL // 660
D=M // 661
@4 // 662
A=D+A // 663
D=M // 664
A=A-1 // 665
A=A-1 // 666
A=A-1 // 667
D=D-M // 668
@13 // 669
A=M // 670
M=D // 671
@ARG // 672
A=M // 673
D=M // 674
@R13 // 675
M=D // 676
@LCL // 677
A=M+1 // 678
A=A+1 // 679
D=M // 680
@R13 // 681
D=D+M // 682
@ARG // 683
A=M // 684
M=D // 685

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 686
0;JMP // 687

////LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)

////LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 688
D=M // 689
@5 // 690
A=D+A // 691
D=M // 692
@R13 // 693
M=D // 694
@LCL // 695
A=M // 696
D=M // 697
@R13 // 698
D=M-D // 699
@15 // 700
M=D // 701
@Screen.drawLine.LT.19 // 702
D=A // 703
@13 // 704
M=D // 705
@DO_LT // 706
0;JMP // 707
(Screen.drawLine.LT.19)
@15 // 708
M=D // 709
@Screen.drawLine.EQ.18 // 710
D=A // 711
@13 // 712
M=D // 713
@DO_EQ // 714
0;JMP // 715
(Screen.drawLine.EQ.18)
@Screen.drawLine.IfElse5 // 716
D;JNE // 717

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 4}
//    }
//  pop:  PopInstruction{address=argument 1}
//}

@LCL // 718
D=M // 719
@4 // 720
A=D+A // 721
D=A // 722
@13 // 723
M=D // 724
@LCL // 725
D=M // 726
@4 // 727
A=D+A // 728
D=M // 729
@R13 // 730
M=D // 731
@LCL // 732
A=M // 733
D=M // 734
@R13 // 735
D=D+M // 736
@13 // 737
A=M // 738
M=D // 739
@ARG // 740
A=M+1 // 741
D=M // 742
@R13 // 743
M=D // 744
@LCL // 745
A=M+1 // 746
A=A+1 // 747
A=A+1 // 748
D=M // 749
@R13 // 750
D=D+M // 751
@ARG // 752
A=M+1 // 753
M=D // 754

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 755
0;JMP // 756

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 757
0;JMP // 758

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 759
AM=M+1 // 760
A=A-1 // 761
M=0 // 762

////ReturnInstruction{}
@RETURN // 763
0;JMP // 764

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 765
AM=M+1 // 766
A=A-1 // 767
M=0 // 768

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 769
A=M // 770
D=M // 771
@LCL // 772
A=M // 773
M=D // 774

////LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 775
A=M // 776
D=M // 777
@R13 // 778
M=D // 779
@ARG // 780
A=M+1 // 781
D=M // 782
@R13 // 783
D=M-D // 784
@15 // 785
M=D // 786
@Screen.drawHorizontalLine.GT.22 // 787
D=A // 788
@13 // 789
M=D // 790
@DO_GT // 791
0;JMP // 792
(Screen.drawHorizontalLine.GT.22)
D=!D // 793
@15 // 794
M=D // 795
@Screen.drawHorizontalLine.EQ.21 // 796
D=A // 797
@13 // 798
M=D // 799
@DO_EQ // 800
0;JMP // 801
(Screen.drawHorizontalLine.EQ.21)
@WHILE_END_Screen.drawHorizontalLine1 // 802
D;JNE // 803

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawHorizontalLine'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 804
A=M // 805
D=M // 806
@SP // 807
AM=M+1 // 808
A=A-1 // 809
M=D // 810
@ARG // 811
A=M+1 // 812
A=A+1 // 813
D=M // 814
@SP // 815
AM=M+1 // 816
A=A-1 // 817
M=D // 818
// call Screen.drawPixel
@7 // 819
D=A // 820
@14 // 821
M=D // 822
@Screen.drawPixel // 823
D=A // 824
@13 // 825
M=D // 826
@Screen.drawHorizontalLine.ret.0 // 827
D=A // 828
@CALL // 829
0;JMP // 830
(Screen.drawHorizontalLine.ret.0)
@SP // 831
AM=M-1 // 832
D=M // 833
@5 // 834
M=D // 835
@LCL // 836
A=M // 837
M=M+1 // 838

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 839
0;JMP // 840

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 841
AM=M+1 // 842
A=A-1 // 843
M=0 // 844

////ReturnInstruction{}
@RETURN // 845
0;JMP // 846

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 847
AM=M+1 // 848
A=A-1 // 849
M=0 // 850
@SP // 851
AM=M+1 // 852
A=A-1 // 853
M=0 // 854
@SP // 855
AM=M+1 // 856
A=A-1 // 857
M=0 // 858
@SP // 859
AM=M+1 // 860
A=A-1 // 861
M=0 // 862
@SP // 863
AM=M+1 // 864
A=A-1 // 865
M=0 // 866

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 1"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "SUB"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 2")
//      nested:
//        PushPopPair {
//          push: PushInstruction("constant 0")
//          pop:  PopInstruction{address=local 0}
//        }
//      pop:  PopInstruction{address=local 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 867
A=M // 868
M=0 // 869
@ARG // 870
A=M+1 // 871
A=A+1 // 872
D=M // 873
@LCL // 874
A=M+1 // 875
M=D // 876
@ARG // 877
A=M+1 // 878
A=A+1 // 879
D=M-1 // 880
D=-D // 881
@LCL // 882
A=M+1 // 883
A=A+1 // 884
M=D // 885

////LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 886
A=M+1 // 887
D=M // 888
A=A-1 // 889
D=M-D // 890
@15 // 891
M=D // 892
@Screen.drawCircle.GT.25 // 893
D=A // 894
@13 // 895
M=D // 896
@DO_GT // 897
0;JMP // 898
(Screen.drawCircle.GT.25)
D=!D // 899
@15 // 900
M=D // 901
@Screen.drawCircle.EQ.24 // 902
D=A // 903
@13 // 904
M=D // 905
@DO_EQ // 906
0;JMP // 907
(Screen.drawCircle.EQ.24)
@WHILE_END_Screen.drawCircle1 // 908
D;JNE // 909

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawCircle'}}
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[BinaryPushGroup(
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
//              pop:  PopInstruction{address=temp 0}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 910
A=M // 911
D=M // 912
@R13 // 913
M=D // 914
@LCL // 915
A=M // 916
D=M // 917
@R13 // 918
D=M-D // 919
@SP // 920
AM=M+1 // 921
A=A-1 // 922
M=D // 923
@ARG // 924
A=M // 925
D=M // 926
@R13 // 927
M=D // 928
@LCL // 929
A=M // 930
D=M // 931
@R13 // 932
D=D+M // 933
@SP // 934
AM=M+1 // 935
A=A-1 // 936
M=D // 937
@ARG // 938
A=M+1 // 939
D=M // 940
@R13 // 941
M=D // 942
@LCL // 943
A=M+1 // 944
D=M // 945
@R13 // 946
D=D+M // 947
@SP // 948
AM=M+1 // 949
A=A-1 // 950
M=D // 951
// call Screen.drawHorizontalLine
@8 // 952
D=A // 953
@14 // 954
M=D // 955
@Screen.drawHorizontalLine // 956
D=A // 957
@13 // 958
M=D // 959
@Screen.drawCircle.ret.0 // 960
D=A // 961
@CALL // 962
0;JMP // 963
(Screen.drawCircle.ret.0)
@SP // 964
AM=M-1 // 965
D=M // 966
@5 // 967
M=D // 968
@ARG // 969
A=M // 970
D=M // 971
@R13 // 972
M=D // 973
@LCL // 974
A=M // 975
D=M // 976
@R13 // 977
D=M-D // 978
@SP // 979
AM=M+1 // 980
A=A-1 // 981
M=D // 982
@ARG // 983
A=M // 984
D=M // 985
@R13 // 986
M=D // 987
@LCL // 988
A=M // 989
D=M // 990
@R13 // 991
D=D+M // 992
@SP // 993
AM=M+1 // 994
A=A-1 // 995
M=D // 996
@ARG // 997
A=M+1 // 998
D=M // 999
@R13 // 1000
M=D // 1001
@LCL // 1002
A=M+1 // 1003
D=M // 1004
@R13 // 1005
D=M-D // 1006
@SP // 1007
AM=M+1 // 1008
A=A-1 // 1009
M=D // 1010
// call Screen.drawHorizontalLine
@8 // 1011
D=A // 1012
@14 // 1013
M=D // 1014
@Screen.drawHorizontalLine // 1015
D=A // 1016
@13 // 1017
M=D // 1018
@Screen.drawCircle.ret.1 // 1019
D=A // 1020
@CALL // 1021
0;JMP // 1022
(Screen.drawCircle.ret.1)
@SP // 1023
AM=M-1 // 1024
D=M // 1025
@5 // 1026
M=D // 1027
@ARG // 1028
A=M // 1029
D=M // 1030
@R13 // 1031
M=D // 1032
@LCL // 1033
A=M+1 // 1034
D=M // 1035
@R13 // 1036
D=M-D // 1037
@SP // 1038
AM=M+1 // 1039
A=A-1 // 1040
M=D // 1041
@ARG // 1042
A=M // 1043
D=M // 1044
@R13 // 1045
M=D // 1046
@LCL // 1047
A=M+1 // 1048
D=M // 1049
@R13 // 1050
D=D+M // 1051
@SP // 1052
AM=M+1 // 1053
A=A-1 // 1054
M=D // 1055
@ARG // 1056
A=M+1 // 1057
D=M // 1058
@R13 // 1059
M=D // 1060
@LCL // 1061
A=M // 1062
D=M // 1063
@R13 // 1064
D=D+M // 1065
@SP // 1066
AM=M+1 // 1067
A=A-1 // 1068
M=D // 1069
// call Screen.drawHorizontalLine
@8 // 1070
D=A // 1071
@14 // 1072
M=D // 1073
@Screen.drawHorizontalLine // 1074
D=A // 1075
@13 // 1076
M=D // 1077
@Screen.drawCircle.ret.2 // 1078
D=A // 1079
@CALL // 1080
0;JMP // 1081
(Screen.drawCircle.ret.2)
@SP // 1082
AM=M-1 // 1083
D=M // 1084
@5 // 1085
M=D // 1086
@ARG // 1087
A=M // 1088
D=M // 1089
@R13 // 1090
M=D // 1091
@LCL // 1092
A=M+1 // 1093
D=M // 1094
@R13 // 1095
D=M-D // 1096
@SP // 1097
AM=M+1 // 1098
A=A-1 // 1099
M=D // 1100
@ARG // 1101
A=M // 1102
D=M // 1103
@R13 // 1104
M=D // 1105
@LCL // 1106
A=M+1 // 1107
D=M // 1108
@R13 // 1109
D=D+M // 1110
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=D // 1114
@ARG // 1115
A=M+1 // 1116
D=M // 1117
@R13 // 1118
M=D // 1119
@LCL // 1120
A=M // 1121
D=M // 1122
@R13 // 1123
D=M-D // 1124
@SP // 1125
AM=M+1 // 1126
A=A-1 // 1127
M=D // 1128
// call Screen.drawHorizontalLine
@8 // 1129
D=A // 1130
@14 // 1131
M=D // 1132
@Screen.drawHorizontalLine // 1133
D=A // 1134
@13 // 1135
M=D // 1136
@Screen.drawCircle.ret.3 // 1137
D=A // 1138
@CALL // 1139
0;JMP // 1140
(Screen.drawCircle.ret.3)
@SP // 1141
AM=M-1 // 1142
D=M // 1143
@5 // 1144
M=D // 1145

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 1146
A=M+1 // 1147
A=A+1 // 1148
D=M // 1149
@15 // 1150
M=D // 1151
@Screen.drawCircle.LT.28 // 1152
D=A // 1153
@13 // 1154
M=D // 1155
@DO_LT // 1156
0;JMP // 1157
(Screen.drawCircle.LT.28)
@15 // 1158
M=D // 1159
@Screen.drawCircle.EQ.27 // 1160
D=A // 1161
@13 // 1162
M=D // 1163
@DO_EQ // 1164
0;JMP // 1165
(Screen.drawCircle.EQ.27)
@Screen.drawCircle.IfElse1 // 1166
D;JNE // 1167

////PushPopPair {
//  push: BinaryPushGroup(
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
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1168
A=M+1 // 1169
A=A+1 // 1170
D=M // 1171
@SP // 1172
AM=M+1 // 1173
A=A-1 // 1174
M=D // 1175
@LCL // 1176
A=M // 1177
D=M // 1178
D=D+M // 1179
@SP // 1180
AM=M-1 // 1181
D=D+M // 1182
@3 // 1183
D=D+A // 1184
@LCL // 1185
A=M+1 // 1186
A=A+1 // 1187
M=D // 1188

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 1189
0;JMP // 1190

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=local 2}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1191
A=M+1 // 1192
A=A+1 // 1193
D=M // 1194
@SP // 1195
AM=M+1 // 1196
A=A-1 // 1197
M=D // 1198
@LCL // 1199
A=M+1 // 1200
D=M // 1201
A=A-1 // 1202
D=M-D // 1203
@R13 // 1204
M=D // 1205
D=D+M // 1206
@SP // 1207
AM=M-1 // 1208
D=D+M // 1209
@5 // 1210
D=D+A // 1211
@LCL // 1212
A=M+1 // 1213
A=A+1 // 1214
M=D // 1215
@LCL // 1216
A=M+1 // 1217
M=M-1 // 1218

////LabelInstruction{label='Screen.drawCircle.IfElseEND1}
// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1219
A=M // 1220
M=M+1 // 1221

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 1222
0;JMP // 1223

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 1224
AM=M+1 // 1225
A=A-1 // 1226
M=0 // 1227

////ReturnInstruction{}
@RETURN // 1228
0;JMP // 1229

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 1230
AM=M+1 // 1231
A=A-1 // 1232
M=0 // 1233
@SP // 1234
AM=M+1 // 1235
A=A-1 // 1236
M=0 // 1237
@SP // 1238
AM=M+1 // 1239
A=A-1 // 1240
M=0 // 1241
@SP // 1242
AM=M+1 // 1243
A=A-1 // 1244
M=0 // 1245
@SP // 1246
AM=M+1 // 1247
A=A-1 // 1248
M=0 // 1249
@SP // 1250
AM=M+1 // 1251
A=A-1 // 1252
M=0 // 1253
@SP // 1254
AM=M+1 // 1255
A=A-1 // 1256
M=0 // 1257
@SP // 1258
AM=M+1 // 1259
A=A-1 // 1260
M=0 // 1261
@SP // 1262
AM=M+1 // 1263
A=A-1 // 1264
M=0 // 1265
@SP // 1266
AM=M+1 // 1267
A=A-1 // 1268
M=0 // 1269

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 1270
D=M // 1271
@9 // 1272
A=D+A // 1273
M=-1 // 1274

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.0 // 1275
D=!M // 1276
@15 // 1277
M=D // 1278
@Screen.drawRectangle.EQ.29 // 1279
D=A // 1280
@13 // 1281
M=D // 1282
@DO_EQ // 1283
0;JMP // 1284
(Screen.drawRectangle.EQ.29)
@Screen.drawRectangle.IfElse1 // 1285
D;JNE // 1286

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 1287
D=M // 1288
@9 // 1289
A=D+A // 1290
M=0 // 1291

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 1292
0;JMP // 1293

////LabelInstruction{label='Screen.drawRectangle.IfElse1}
// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1294
A=M+1 // 1295
D=M // 1296
@LCL // 1297
A=M // 1298
M=D // 1299

////LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 1300
A=M // 1301
D=M // 1302
@R13 // 1303
M=D // 1304
@ARG // 1305
A=M+1 // 1306
A=A+1 // 1307
A=A+1 // 1308
D=M // 1309
@R13 // 1310
D=M-D // 1311
@15 // 1312
M=D // 1313
@Screen.drawRectangle.GT.32 // 1314
D=A // 1315
@13 // 1316
M=D // 1317
@DO_GT // 1318
0;JMP // 1319
(Screen.drawRectangle.GT.32)
D=!D // 1320
@15 // 1321
M=D // 1322
@Screen.drawRectangle.EQ.31 // 1323
D=A // 1324
@13 // 1325
M=D // 1326
@DO_EQ // 1327
0;JMP // 1328
(Screen.drawRectangle.EQ.31)
@WHILE_END_Screen.drawRectangle1 // 1329
D;JNE // 1330

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//              nested:
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//                  pop:  PopInstruction{address=local 1}
//                }
//              pop:  PopInstruction{address=local 2}
//            }
//          pop:  PopInstruction{address=local 3}
//        }
//      pop:  PopInstruction{address=local 4}
//    }
//  pop:  PopInstruction{address=local 5}
//}

@ARG // 1331
A=M // 1332
D=M // 1333
@SP // 1334
AM=M+1 // 1335
A=A-1 // 1336
M=D // 1337
@16 // 1338
D=A // 1339
@SP // 1340
AM=M+1 // 1341
A=A-1 // 1342
M=D // 1343
// call Math.divide
@7 // 1344
D=A // 1345
@14 // 1346
M=D // 1347
@Math.divide // 1348
D=A // 1349
@13 // 1350
M=D // 1351
@Screen.drawRectangle.ret.0 // 1352
D=A // 1353
@CALL // 1354
0;JMP // 1355
(Screen.drawRectangle.ret.0)
@SP // 1356
AM=M-1 // 1357
D=M // 1358
@LCL // 1359
A=M+1 // 1360
M=D // 1361
@ARG // 1362
A=M+1 // 1363
A=A+1 // 1364
D=M // 1365
@SP // 1366
AM=M+1 // 1367
A=A-1 // 1368
M=D // 1369
@16 // 1370
D=A // 1371
@SP // 1372
AM=M+1 // 1373
A=A-1 // 1374
M=D // 1375
// call Math.divide
@7 // 1376
D=A // 1377
@14 // 1378
M=D // 1379
@Math.divide // 1380
D=A // 1381
@13 // 1382
M=D // 1383
@Screen.drawRectangle.ret.1 // 1384
D=A // 1385
@CALL // 1386
0;JMP // 1387
(Screen.drawRectangle.ret.1)
@SP // 1388
AM=M-1 // 1389
D=M // 1390
@LCL // 1391
A=M+1 // 1392
A=A+1 // 1393
M=D // 1394
@ARG // 1395
A=M // 1396
D=M // 1397
@15 // 1398
D=D&A // 1399
@LCL // 1400
A=M+1 // 1401
A=A+1 // 1402
A=A+1 // 1403
M=D // 1404
@LCL // 1405
D=M // 1406
@4 // 1407
A=D+A // 1408
D=A // 1409
@13 // 1410
M=D // 1411
@ARG // 1412
A=M+1 // 1413
A=A+1 // 1414
D=M // 1415
@15 // 1416
D=D&A // 1417
@13 // 1418
A=M // 1419
M=D // 1420
@LCL // 1421
D=M // 1422
@5 // 1423
A=D+A // 1424
D=A // 1425
@SP // 1426
AM=M+1 // 1427
A=A-1 // 1428
M=D // 1429
@LCL // 1430
A=M // 1431
D=M // 1432
@SP // 1433
AM=M+1 // 1434
A=A-1 // 1435
M=D // 1436
@32 // 1437
D=A // 1438
@SP // 1439
AM=M+1 // 1440
A=A-1 // 1441
M=D // 1442
// call Math.multiply
@7 // 1443
D=A // 1444
@14 // 1445
M=D // 1446
@Math.multiply // 1447
D=A // 1448
@13 // 1449
M=D // 1450
@Screen.drawRectangle.ret.2 // 1451
D=A // 1452
@CALL // 1453
0;JMP // 1454
(Screen.drawRectangle.ret.2)
@SP // 1455
AM=M-1 // 1456
D=M // 1457
@SP // 1458
AM=M-1 // 1459
A=M // 1460
M=D // 1461

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 1462
A=M+1 // 1463
A=A+1 // 1464
D=M // 1465
A=A-1 // 1466
D=M-D // 1467
@15 // 1468
M=D // 1469
@Screen.drawRectangle.EQ.35 // 1470
D=A // 1471
@13 // 1472
M=D // 1473
@DO_EQ // 1474
0;JMP // 1475
(Screen.drawRectangle.EQ.35)
@15 // 1476
M=D // 1477
@Screen.drawRectangle.EQ.34 // 1478
D=A // 1479
@13 // 1480
M=D // 1481
@DO_EQ // 1482
0;JMP // 1483
(Screen.drawRectangle.EQ.34)
@Screen.drawRectangle.IfElse2 // 1484
D;JNE // 1485

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=local 6}
//    }
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 1486
D=M // 1487
@6 // 1488
A=D+A // 1489
D=A // 1490
@SP // 1491
AM=M+1 // 1492
A=A-1 // 1493
M=D // 1494
@LCL // 1495
D=M // 1496
@4 // 1497
A=D+A // 1498
D=M // 1499
@SP // 1500
AM=M+1 // 1501
A=A-1 // 1502
M=D+1 // 1503
// call Math.twoToThe
@6 // 1504
D=A // 1505
@14 // 1506
M=D // 1507
@Math.twoToThe // 1508
D=A // 1509
@13 // 1510
M=D // 1511
@Screen.drawRectangle.ret.3 // 1512
D=A // 1513
@CALL // 1514
0;JMP // 1515
(Screen.drawRectangle.ret.3)
@SP // 1516
AM=M-1 // 1517
D=M // 1518
D=M-1 // 1519
@SP // 1520
AM=M+1 // 1521
A=A-1 // 1522
M=D // 1523
@LCL // 1524
A=M+1 // 1525
A=A+1 // 1526
A=A+1 // 1527
D=M // 1528
@SP // 1529
AM=M+1 // 1530
A=A-1 // 1531
M=D // 1532
// call Math.twoToThe
@6 // 1533
D=A // 1534
@14 // 1535
M=D // 1536
@Math.twoToThe // 1537
D=A // 1538
@13 // 1539
M=D // 1540
@Screen.drawRectangle.ret.4 // 1541
D=A // 1542
@CALL // 1543
0;JMP // 1544
(Screen.drawRectangle.ret.4)
@SP // 1545
AM=M-1 // 1546
D=M // 1547
D=M-1 // 1548
@SP // 1549
AM=M-1 // 1550
D=M-D // 1551
@SP // 1552
AM=M-1 // 1553
A=M // 1554
M=D // 1555
@LCL // 1556
D=M // 1557
@7 // 1558
A=D+A // 1559
D=A // 1560
@13 // 1561
M=D // 1562
@LCL // 1563
D=M // 1564
@5 // 1565
A=D+A // 1566
D=M // 1567
@R13 // 1568
M=D // 1569
@LCL // 1570
A=M+1 // 1571
D=M // 1572
@R13 // 1573
D=D+M // 1574
@13 // 1575
A=M // 1576
M=D // 1577

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0 // 1578
D=M // 1579
@15 // 1580
M=D // 1581
@Screen.drawRectangle.EQ.36 // 1582
D=A // 1583
@13 // 1584
M=D // 1585
@DO_EQ // 1586
0;JMP // 1587
(Screen.drawRectangle.EQ.36)
@Screen.drawRectangle.IfElse3 // 1588
D;JNE // 1589

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 1590
D=M // 1591
@7 // 1592
A=D+A // 1593
D=M // 1594
@16384 // 1595
D=D+A // 1596
@4 // 1597
M=D // 1598

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 1599
D=M // 1600
@7 // 1601
A=D+A // 1602
D=M // 1603
@16384 // 1604
D=D+A // 1605
@4 // 1606
M=D // 1607
@THAT // 1608
A=M // 1609
D=M // 1610
@R13 // 1611
M=D // 1612
@LCL // 1613
D=M // 1614
@6 // 1615
A=D+A // 1616
D=M // 1617
@R13 // 1618
D=D|M // 1619
@THAT // 1620
A=M // 1621
M=D // 1622

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 1623
0;JMP // 1624

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 1625
D=M // 1626
@7 // 1627
A=D+A // 1628
D=M // 1629
@16384 // 1630
D=D+A // 1631
@4 // 1632
M=D // 1633

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 1634
D=M // 1635
@7 // 1636
A=D+A // 1637
D=M // 1638
@16384 // 1639
D=D+A // 1640
@4 // 1641
M=D // 1642
@THAT // 1643
A=M // 1644
D=M // 1645
@R13 // 1646
M=D // 1647
@LCL // 1648
D=M // 1649
@6 // 1650
A=D+A // 1651
D=!M // 1652
@R13 // 1653
D=D&M // 1654
@THAT // 1655
A=M // 1656
M=D // 1657

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 1658
0;JMP // 1659

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: UnaryPushGroup(    BinaryPushGroup(
//        left:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=5, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}},
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "SUB"
//    ),
//NOT)
//      pop:  PopInstruction{address=local 6}
//    }
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 1660
D=M // 1661
@6 // 1662
A=D+A // 1663
D=A // 1664
@SP // 1665
AM=M+1 // 1666
A=A-1 // 1667
M=D // 1668
@LCL // 1669
A=M+1 // 1670
A=A+1 // 1671
A=A+1 // 1672
D=M // 1673
@SP // 1674
AM=M+1 // 1675
A=A-1 // 1676
M=D // 1677
// call Math.twoToThe
@6 // 1678
D=A // 1679
@14 // 1680
M=D // 1681
@Math.twoToThe // 1682
D=A // 1683
@13 // 1684
M=D // 1685
@Screen.drawRectangle.ret.5 // 1686
D=A // 1687
@CALL // 1688
0;JMP // 1689
(Screen.drawRectangle.ret.5)
@SP // 1690
AM=M-1 // 1691
D=M // 1692
D=M-1 // 1693
D=!D // 1694
@SP // 1695
AM=M-1 // 1696
A=M // 1697
M=D // 1698
@LCL // 1699
D=M // 1700
@7 // 1701
A=D+A // 1702
D=A // 1703
@13 // 1704
M=D // 1705
@LCL // 1706
D=M // 1707
@5 // 1708
A=D+A // 1709
D=M // 1710
@R13 // 1711
M=D // 1712
@LCL // 1713
A=M+1 // 1714
D=M // 1715
@R13 // 1716
D=D+M // 1717
@13 // 1718
A=M // 1719
M=D // 1720

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0 // 1721
D=M // 1722
@15 // 1723
M=D // 1724
@Screen.drawRectangle.EQ.37 // 1725
D=A // 1726
@13 // 1727
M=D // 1728
@DO_EQ // 1729
0;JMP // 1730
(Screen.drawRectangle.EQ.37)
@Screen.drawRectangle.IfElse4 // 1731
D;JNE // 1732

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 1733
D=M // 1734
@7 // 1735
A=D+A // 1736
D=M // 1737
@16384 // 1738
D=D+A // 1739
@4 // 1740
M=D // 1741

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 1742
D=M // 1743
@7 // 1744
A=D+A // 1745
D=M // 1746
@16384 // 1747
D=D+A // 1748
@4 // 1749
M=D // 1750
@THAT // 1751
A=M // 1752
D=M // 1753
@R13 // 1754
M=D // 1755
@LCL // 1756
D=M // 1757
@6 // 1758
A=D+A // 1759
D=M // 1760
@R13 // 1761
D=D|M // 1762
@THAT // 1763
A=M // 1764
M=D // 1765

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 1766
0;JMP // 1767

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 1768
D=M // 1769
@7 // 1770
A=D+A // 1771
D=M // 1772
@16384 // 1773
D=D+A // 1774
@4 // 1775
M=D // 1776

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 1777
D=M // 1778
@7 // 1779
A=D+A // 1780
D=M // 1781
@16384 // 1782
D=D+A // 1783
@4 // 1784
M=D // 1785
@THAT // 1786
A=M // 1787
D=M // 1788
@R13 // 1789
M=D // 1790
@LCL // 1791
D=M // 1792
@6 // 1793
A=D+A // 1794
D=!M // 1795
@R13 // 1796
D=D&M // 1797
@THAT // 1798
A=M // 1799
M=D // 1800

////LabelInstruction{label='Screen.drawRectangle.IfElseEND4}
// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 1801
D=M // 1802
@8 // 1803
A=D+A // 1804
D=A // 1805
@13 // 1806
M=D // 1807
@LCL // 1808
A=M+1 // 1809
D=M+1 // 1810
@13 // 1811
A=M // 1812
M=D // 1813

////LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 1814
D=M // 1815
@8 // 1816
A=D+A // 1817
D=M // 1818
@R13 // 1819
M=D // 1820
@LCL // 1821
A=M+1 // 1822
A=A+1 // 1823
D=M // 1824
@R13 // 1825
D=M-D // 1826
@15 // 1827
M=D // 1828
@Screen.drawRectangle.LT.40 // 1829
D=A // 1830
@13 // 1831
M=D // 1832
@DO_LT // 1833
0;JMP // 1834
(Screen.drawRectangle.LT.40)
@15 // 1835
M=D // 1836
@Screen.drawRectangle.EQ.39 // 1837
D=A // 1838
@13 // 1839
M=D // 1840
@DO_EQ // 1841
0;JMP // 1842
(Screen.drawRectangle.EQ.39)
@WHILE_END_Screen.drawRectangle2 // 1843
D;JNE // 1844

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 8"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 1845
D=M // 1846
@7 // 1847
A=D+A // 1848
D=A // 1849
@13 // 1850
M=D // 1851
@LCL // 1852
D=M // 1853
@8 // 1854
A=D+A // 1855
D=M // 1856
A=A-1 // 1857
A=A-1 // 1858
A=A-1 // 1859
D=D+M // 1860
@13 // 1861
A=M // 1862
M=D // 1863

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("local 9")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 1864
D=M // 1865
@7 // 1866
A=D+A // 1867
D=M // 1868
@16384 // 1869
D=D+A // 1870
@4 // 1871
M=D // 1872
@LCL // 1873
D=M // 1874
@9 // 1875
A=D+A // 1876
D=M // 1877
@THAT // 1878
A=M // 1879
M=D // 1880
@LCL // 1881
D=M // 1882
@8 // 1883
A=D+A // 1884
M=M+1 // 1885

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 1886
0;JMP // 1887

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=local 6}
//    }
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 1888
D=M // 1889
@6 // 1890
A=D+A // 1891
D=A // 1892
@SP // 1893
AM=M+1 // 1894
A=A-1 // 1895
M=D // 1896
@LCL // 1897
D=M // 1898
@4 // 1899
A=D+A // 1900
D=M // 1901
@SP // 1902
AM=M+1 // 1903
A=A-1 // 1904
M=D+1 // 1905
// call Math.twoToThe
@6 // 1906
D=A // 1907
@14 // 1908
M=D // 1909
@Math.twoToThe // 1910
D=A // 1911
@13 // 1912
M=D // 1913
@Screen.drawRectangle.ret.6 // 1914
D=A // 1915
@CALL // 1916
0;JMP // 1917
(Screen.drawRectangle.ret.6)
@SP // 1918
AM=M-1 // 1919
D=M // 1920
D=M-1 // 1921
@SP // 1922
AM=M-1 // 1923
A=M // 1924
M=D // 1925
@LCL // 1926
D=M // 1927
@7 // 1928
A=D+A // 1929
D=A // 1930
@13 // 1931
M=D // 1932
@LCL // 1933
D=M // 1934
@5 // 1935
A=D+A // 1936
D=M // 1937
A=A-1 // 1938
A=A-1 // 1939
A=A-1 // 1940
D=D+M // 1941
@13 // 1942
A=M // 1943
M=D // 1944

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0 // 1945
D=M // 1946
@15 // 1947
M=D // 1948
@Screen.drawRectangle.EQ.41 // 1949
D=A // 1950
@13 // 1951
M=D // 1952
@DO_EQ // 1953
0;JMP // 1954
(Screen.drawRectangle.EQ.41)
@Screen.drawRectangle.IfElse5 // 1955
D;JNE // 1956

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 1957
D=M // 1958
@7 // 1959
A=D+A // 1960
D=M // 1961
@16384 // 1962
D=D+A // 1963
@4 // 1964
M=D // 1965

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 1966
D=M // 1967
@7 // 1968
A=D+A // 1969
D=M // 1970
@16384 // 1971
D=D+A // 1972
@4 // 1973
M=D // 1974
@THAT // 1975
A=M // 1976
D=M // 1977
@R13 // 1978
M=D // 1979
@LCL // 1980
D=M // 1981
@6 // 1982
A=D+A // 1983
D=M // 1984
@R13 // 1985
D=D|M // 1986
@THAT // 1987
A=M // 1988
M=D // 1989

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 1990
0;JMP // 1991

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 1992
D=M // 1993
@7 // 1994
A=D+A // 1995
D=M // 1996
@16384 // 1997
D=D+A // 1998
@4 // 1999
M=D // 2000

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 2001
D=M // 2002
@7 // 2003
A=D+A // 2004
D=M // 2005
@16384 // 2006
D=D+A // 2007
@4 // 2008
M=D // 2009
@THAT // 2010
A=M // 2011
D=M // 2012
@R13 // 2013
M=D // 2014
@LCL // 2015
D=M // 2016
@6 // 2017
A=D+A // 2018
D=!M // 2019
@R13 // 2020
D=D&M // 2021
@THAT // 2022
A=M // 2023
M=D // 2024

////LabelInstruction{label='Screen.drawRectangle.IfElseEND5}
// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND2}
// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2025
A=M // 2026
M=M+1 // 2027

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 2028
0;JMP // 2029

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 2030
AM=M+1 // 2031
A=A-1 // 2032
M=0 // 2033

////ReturnInstruction{}
@RETURN // 2034
0;JMP // 2035

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 2036
AM=M+1 // 2037
A=A-1 // 2038
M=0 // 2039

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2040
D=A // 2041
@SP // 2042
AM=M+1 // 2043
A=A-1 // 2044
M=D // 2045
// call Memory.alloc
@6 // 2046
D=A // 2047
@14 // 2048
M=D // 2049
@Memory.alloc // 2050
D=A // 2051
@13 // 2052
M=D // 2053
@String.new.ret.0 // 2054
D=A // 2055
@CALL // 2056
0;JMP // 2057
(String.new.ret.0)
@SP // 2058
AM=M-1 // 2059
D=M // 2060
@3 // 2061
M=D // 2062

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 2063
A=M // 2064
D=M // 2065
@15 // 2066
M=D // 2067
@String.new.EQ.2 // 2068
D=A // 2069
@13 // 2070
M=D // 2071
@DO_EQ // 2072
0;JMP // 2073
(String.new.EQ.2)
@15 // 2074
M=D // 2075
@String.new.EQ.1 // 2076
D=A // 2077
@13 // 2078
M=D // 2079
@DO_EQ // 2080
0;JMP // 2081
(String.new.EQ.1)
@String.new.IfElse1 // 2082
D;JNE // 2083

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2084
A=M // 2085
M=0 // 2086

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 2087
0;JMP // 2088

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2089
A=M // 2090
D=M // 2091
@SP // 2092
AM=M+1 // 2093
A=A-1 // 2094
M=D // 2095
// call Array.new
@6 // 2096
D=A // 2097
@14 // 2098
M=D // 2099
@Array.new // 2100
D=A // 2101
@13 // 2102
M=D // 2103
@String.new.ret.1 // 2104
D=A // 2105
@CALL // 2106
0;JMP // 2107
(String.new.ret.1)
@SP // 2108
AM=M-1 // 2109
D=M // 2110
@THIS // 2111
A=M // 2112
M=D // 2113

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=this 2}
//    }
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 2114
A=M // 2115
D=M // 2116
@THIS // 2117
A=M+1 // 2118
A=A+1 // 2119
M=D // 2120
@THIS // 2121
A=M+1 // 2122
M=0 // 2123

////PushInstruction("pointer 0")
@3 // 2124
D=M // 2125
@SP // 2126
AM=M+1 // 2127
A=A-1 // 2128
M=D // 2129

////ReturnInstruction{}
@RETURN // 2130
0;JMP // 2131

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2132
A=M // 2133
D=M // 2134
@3 // 2135
M=D // 2136

////ConditionalGroup{push=BinaryPushGroup(
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
@THIS // 2137
A=M // 2138
D=M // 2139
@15 // 2140
M=D // 2141
@String.dispose.EQ.5 // 2142
D=A // 2143
@13 // 2144
M=D // 2145
@DO_EQ // 2146
0;JMP // 2147
(String.dispose.EQ.5)
D=!D // 2148
@15 // 2149
M=D // 2150
@String.dispose.EQ.4 // 2151
D=A // 2152
@13 // 2153
M=D // 2154
@DO_EQ // 2155
0;JMP // 2156
(String.dispose.EQ.4)
@String.dispose.IfElse1 // 2157
D;JNE // 2158

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 2159
A=M // 2160
D=M // 2161
@SP // 2162
AM=M+1 // 2163
A=A-1 // 2164
M=D // 2165
// call Array.dispose
@6 // 2166
D=A // 2167
@14 // 2168
M=D // 2169
@Array.dispose // 2170
D=A // 2171
@13 // 2172
M=D // 2173
@String.dispose.ret.0 // 2174
D=A // 2175
@CALL // 2176
0;JMP // 2177
(String.dispose.ret.0)
@SP // 2178
AM=M-1 // 2179
D=M // 2180
@5 // 2181
M=D // 2182

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 2183
0;JMP // 2184

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 2185
AM=M+1 // 2186
A=A-1 // 2187
M=0 // 2188

////ReturnInstruction{}
@RETURN // 2189
0;JMP // 2190

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2191
A=M // 2192
D=M // 2193
@3 // 2194
M=D // 2195

////PushInstruction("this 1")
@THIS // 2196
A=M+1 // 2197
D=M // 2198
@SP // 2199
AM=M+1 // 2200
A=A-1 // 2201
M=D // 2202

////ReturnInstruction{}
@RETURN // 2203
0;JMP // 2204

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=pointer 0}
//    }
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 2205
A=M // 2206
D=M // 2207
@3 // 2208
M=D // 2209
@THIS // 2210
A=M // 2211
D=M // 2212
@R13 // 2213
M=D // 2214
@ARG // 2215
A=M+1 // 2216
D=M // 2217
@R13 // 2218
D=D+M // 2219
@4 // 2220
M=D // 2221

////PushInstruction("that 0")
@THAT // 2222
A=M // 2223
D=M // 2224
@SP // 2225
AM=M+1 // 2226
A=A-1 // 2227
M=D // 2228

////ReturnInstruction{}
@RETURN // 2229
0;JMP // 2230

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2231
A=M // 2232
D=M // 2233
@3 // 2234
M=D // 2235

////PushPopPair {
//  push: PushInstruction("argument 2")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@THIS // 2236
A=M // 2237
D=M // 2238
@R13 // 2239
M=D // 2240
@ARG // 2241
A=M+1 // 2242
D=M // 2243
@R13 // 2244
D=D+M // 2245
@4 // 2246
M=D // 2247
@ARG // 2248
A=M+1 // 2249
A=A+1 // 2250
D=M // 2251
@THAT // 2252
A=M // 2253
M=D // 2254

////PushInstruction("constant 0")
@SP // 2255
AM=M+1 // 2256
A=A-1 // 2257
M=0 // 2258

////ReturnInstruction{}
@RETURN // 2259
0;JMP // 2260

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 2261
AM=M+1 // 2262
A=A-1 // 2263
M=0 // 2264

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2265
A=M // 2266
D=M // 2267
@3 // 2268
M=D // 2269

////ConditionalGroup{push=BinaryPushGroup(
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
@THIS // 2270
A=M+1 // 2271
A=A+1 // 2272
D=M // 2273
A=A-1 // 2274
D=M-D // 2275
@15 // 2276
M=D // 2277
@String.appendChar.EQ.8 // 2278
D=A // 2279
@13 // 2280
M=D // 2281
@DO_EQ // 2282
0;JMP // 2283
(String.appendChar.EQ.8)
@15 // 2284
M=D // 2285
@String.appendChar.EQ.7 // 2286
D=A // 2287
@13 // 2288
M=D // 2289
@DO_EQ // 2290
0;JMP // 2291
(String.appendChar.EQ.7)
@String.appendChar.IfElse1 // 2292
D;JNE // 2293

////PushPopPair {
//  push: PushInstruction("local 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//              nested:
//                PushPopPair {
//                  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//                  pop:  PopInstruction{address=local 0}
//                }
//              pop:  PopInstruction{address=temp 0}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=this 2}
//    }
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2294
A=M+1 // 2295
A=A+1 // 2296
D=M // 2297
D=D+M // 2298
@SP // 2299
AM=M+1 // 2300
A=A-1 // 2301
M=D // 2302
// call Array.new
@6 // 2303
D=A // 2304
@14 // 2305
M=D // 2306
@Array.new // 2307
D=A // 2308
@13 // 2309
M=D // 2310
@String.appendChar.ret.0 // 2311
D=A // 2312
@CALL // 2313
0;JMP // 2314
(String.appendChar.ret.0)
@SP // 2315
AM=M-1 // 2316
D=M // 2317
@LCL // 2318
A=M // 2319
M=D // 2320
@THIS // 2321
A=M // 2322
D=M // 2323
@SP // 2324
AM=M+1 // 2325
A=A-1 // 2326
M=D // 2327
@LCL // 2328
A=M // 2329
D=M // 2330
@SP // 2331
AM=M+1 // 2332
A=A-1 // 2333
M=D // 2334
@THIS // 2335
A=M+1 // 2336
D=M // 2337
@SP // 2338
AM=M+1 // 2339
A=A-1 // 2340
M=D // 2341
// call Memory.copy
@8 // 2342
D=A // 2343
@14 // 2344
M=D // 2345
@Memory.copy // 2346
D=A // 2347
@13 // 2348
M=D // 2349
@String.appendChar.ret.1 // 2350
D=A // 2351
@CALL // 2352
0;JMP // 2353
(String.appendChar.ret.1)
@SP // 2354
AM=M-1 // 2355
D=M // 2356
@5 // 2357
M=D // 2358
@THIS // 2359
A=M // 2360
D=M // 2361
@SP // 2362
AM=M+1 // 2363
A=A-1 // 2364
M=D // 2365
// call Array.dispose
@6 // 2366
D=A // 2367
@14 // 2368
M=D // 2369
@Array.dispose // 2370
D=A // 2371
@13 // 2372
M=D // 2373
@String.appendChar.ret.2 // 2374
D=A // 2375
@CALL // 2376
0;JMP // 2377
(String.appendChar.ret.2)
@SP // 2378
AM=M-1 // 2379
D=M // 2380
@5 // 2381
M=D // 2382
@THIS // 2383
A=M+1 // 2384
A=A+1 // 2385
D=M // 2386
D=D+M // 2387
@THIS // 2388
A=M+1 // 2389
A=A+1 // 2390
M=D // 2391
@LCL // 2392
A=M // 2393
D=M // 2394
@THIS // 2395
A=M // 2396
M=D // 2397

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 2398
0;JMP // 2399

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 1")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("this 1"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2400
A=M+1 // 2401
D=M // 2402
A=A-1 // 2403
D=D+M // 2404
@4 // 2405
M=D // 2406
@ARG // 2407
A=M+1 // 2408
D=M // 2409
@THAT // 2410
A=M // 2411
M=D // 2412
@THIS // 2413
A=M+1 // 2414
M=M+1 // 2415

////PushInstruction("pointer 0")
@3 // 2416
D=M // 2417
@SP // 2418
AM=M+1 // 2419
A=A-1 // 2420
M=D // 2421

////ReturnInstruction{}
@RETURN // 2422
0;JMP // 2423

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=pointer 0}
//    }
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 2424
A=M // 2425
D=M // 2426
@3 // 2427
M=D // 2428
@THIS // 2429
A=M+1 // 2430
M=M-1 // 2431

////PushInstruction("constant 0")
@SP // 2432
AM=M+1 // 2433
A=A-1 // 2434
M=0 // 2435

////ReturnInstruction{}
@RETURN // 2436
0;JMP // 2437

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 2438
AM=M+1 // 2439
A=A-1 // 2440
M=0 // 2441
@SP // 2442
AM=M+1 // 2443
A=A-1 // 2444
M=0 // 2445

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("constant 1")
//      nested:
//        PushPopPair {
//          push: PushInstruction("argument 0")
//          pop:  PopInstruction{address=pointer 0}
//        }
//      pop:  PopInstruction{address=local 1}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2446
A=M // 2447
D=M // 2448
@3 // 2449
M=D // 2450
@LCL // 2451
A=M+1 // 2452
M=1 // 2453
@LCL // 2454
A=M // 2455
M=0 // 2456

////LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 2457
A=M+1 // 2458
D=M // 2459
@R13 // 2460
M=D // 2461
@THIS // 2462
A=M+1 // 2463
D=M // 2464
@R13 // 2465
D=M-D // 2466
@15 // 2467
M=D // 2468
@String.intValue.LT.11 // 2469
D=A // 2470
@13 // 2471
M=D // 2472
@DO_LT // 2473
0;JMP // 2474
(String.intValue.LT.11)
@15 // 2475
M=D // 2476
@String.intValue.EQ.10 // 2477
D=A // 2478
@13 // 2479
M=D // 2480
@DO_EQ // 2481
0;JMP // 2482
(String.intValue.EQ.10)
@WHILE_END_String.intValue1 // 2483
D;JNE // 2484

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 2485
A=M // 2486
D=M // 2487
@R13 // 2488
M=D // 2489
@LCL // 2490
A=M+1 // 2491
D=M // 2492
@R13 // 2493
D=D+M // 2494
@4 // 2495
M=D // 2496
@LCL // 2497
A=M // 2498
D=M // 2499
@SP // 2500
AM=M+1 // 2501
A=A-1 // 2502
M=D // 2503
@10 // 2504
D=A // 2505
@SP // 2506
AM=M+1 // 2507
A=A-1 // 2508
M=D // 2509
// call Math.multiply
@7 // 2510
D=A // 2511
@14 // 2512
M=D // 2513
@Math.multiply // 2514
D=A // 2515
@13 // 2516
M=D // 2517
@String.intValue.ret.0 // 2518
D=A // 2519
@CALL // 2520
0;JMP // 2521
(String.intValue.ret.0)
@THAT // 2522
A=M // 2523
D=M // 2524
@48 // 2525
D=D-A // 2526
@SP // 2527
AM=M-1 // 2528
D=D+M // 2529
@LCL // 2530
A=M // 2531
M=D // 2532
@LCL // 2533
A=M+1 // 2534
M=M+1 // 2535

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 2536
0;JMP // 2537

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 2538
A=M // 2539
D=M // 2540
@SP // 2541
AM=M+1 // 2542
A=A-1 // 2543
M=D // 2544

////ReturnInstruction{}
@RETURN // 2545
0;JMP // 2546

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 2547
AM=M+1 // 2548
A=A-1 // 2549
M=0 // 2550
@SP // 2551
AM=M+1 // 2552
A=A-1 // 2553
M=0 // 2554
@SP // 2555
AM=M+1 // 2556
A=A-1 // 2557
M=0 // 2558
@SP // 2559
AM=M+1 // 2560
A=A-1 // 2561
M=0 // 2562
@SP // 2563
AM=M+1 // 2564
A=A-1 // 2565
M=0 // 2566
@SP // 2567
AM=M+1 // 2568
A=A-1 // 2569
M=0 // 2570

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      nested:
//        PushPopPair {
//          push: PushInstruction("argument 0")
//          pop:  PopInstruction{address=pointer 0}
//        }
//      pop:  PopInstruction{address=this 1}
//    }
//  pop:  PopInstruction{address=local 4}
//}

@ARG // 2571
A=M // 2572
D=M // 2573
@3 // 2574
M=D // 2575
@THIS // 2576
A=M+1 // 2577
M=0 // 2578
@LCL // 2579
D=M // 2580
@4 // 2581
A=D+A // 2582
M=0 // 2583

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 2584
A=M+1 // 2585
D=M // 2586
@15 // 2587
M=D // 2588
@String.setInt.EQ.14 // 2589
D=A // 2590
@13 // 2591
M=D // 2592
@DO_EQ // 2593
0;JMP // 2594
(String.setInt.EQ.14)
@15 // 2595
M=D // 2596
@String.setInt.EQ.13 // 2597
D=A // 2598
@13 // 2599
M=D // 2600
@DO_EQ // 2601
0;JMP // 2602
(String.setInt.EQ.13)
@String.setInt.IfElse1 // 2603
D;JNE // 2604

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2605
D=M // 2606
@SP // 2607
AM=M+1 // 2608
A=A-1 // 2609
M=D // 2610
@48 // 2611
D=A // 2612
@SP // 2613
AM=M+1 // 2614
A=A-1 // 2615
M=D // 2616
// call String.appendChar
@7 // 2617
D=A // 2618
@14 // 2619
M=D // 2620
@String.appendChar // 2621
D=A // 2622
@13 // 2623
M=D // 2624
@String.setInt.ret.0 // 2625
D=A // 2626
@CALL // 2627
0;JMP // 2628
(String.setInt.ret.0)
@SP // 2629
AM=M-1 // 2630
D=M // 2631
@5 // 2632
M=D // 2633

////PushInstruction("constant 0")
@SP // 2634
AM=M+1 // 2635
A=A-1 // 2636
M=0 // 2637

////ReturnInstruction{}
@RETURN // 2638
0;JMP // 2639

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 2640
0;JMP // 2641

////LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)

////LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 2642
A=M+1 // 2643
D=M // 2644
@15 // 2645
M=D // 2646
@String.setInt.LT.17 // 2647
D=A // 2648
@13 // 2649
M=D // 2650
@DO_LT // 2651
0;JMP // 2652
(String.setInt.LT.17)
@15 // 2653
M=D // 2654
@String.setInt.EQ.16 // 2655
D=A // 2656
@13 // 2657
M=D // 2658
@DO_EQ // 2659
0;JMP // 2660
(String.setInt.EQ.16)
@String.setInt.IfElse2 // 2661
D;JNE // 2662

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 2663
D=M // 2664
@4 // 2665
A=D+A // 2666
M=1 // 2667

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 2668
A=M+1 // 2669
D=M // 2670
@15 // 2671
M=D // 2672
@String.setInt.LT.21 // 2673
D=A // 2674
@13 // 2675
M=D // 2676
@DO_LT // 2677
0;JMP // 2678
(String.setInt.LT.21)
@SP // 2679
AM=M+1 // 2680
A=A-1 // 2681
M=D // 2682
@ARG // 2683
A=M+1 // 2684
D=M // 2685
@32767 // 2686
D=D&A // 2687
@32767 // 2688
D=D-A // 2689
@15 // 2690
M=D // 2691
@String.setInt.EQ.22 // 2692
D=A // 2693
@13 // 2694
M=D // 2695
@DO_EQ // 2696
0;JMP // 2697
(String.setInt.EQ.22)
@SP // 2698
AM=M-1 // 2699
D=D&M // 2700
@15 // 2701
M=D // 2702
@String.setInt.EQ.20 // 2703
D=A // 2704
@13 // 2705
M=D // 2706
@DO_EQ // 2707
0;JMP // 2708
(String.setInt.EQ.20)
@String.setInt.IfElse3 // 2709
D;JNE // 2710

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//              nested:
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//                  nested:
//                    PushPopPair {
//                      push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                  pop:  PopInstruction{address=temp 0}
//                }
//              pop:  PopInstruction{address=temp 0}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2711
D=M // 2712
@SP // 2713
AM=M+1 // 2714
A=A-1 // 2715
M=D // 2716
@45 // 2717
D=A // 2718
@SP // 2719
AM=M+1 // 2720
A=A-1 // 2721
M=D // 2722
// call String.appendChar
@7 // 2723
D=A // 2724
@14 // 2725
M=D // 2726
@String.appendChar // 2727
D=A // 2728
@13 // 2729
M=D // 2730
@String.setInt.ret.1 // 2731
D=A // 2732
@CALL // 2733
0;JMP // 2734
(String.setInt.ret.1)
@SP // 2735
AM=M-1 // 2736
D=M // 2737
@5 // 2738
M=D // 2739
@3 // 2740
D=M // 2741
@SP // 2742
AM=M+1 // 2743
A=A-1 // 2744
M=D // 2745
@51 // 2746
D=A // 2747
@SP // 2748
AM=M+1 // 2749
A=A-1 // 2750
M=D // 2751
// call String.appendChar
@7 // 2752
D=A // 2753
@14 // 2754
M=D // 2755
@String.appendChar // 2756
D=A // 2757
@13 // 2758
M=D // 2759
@String.setInt.ret.2 // 2760
D=A // 2761
@CALL // 2762
0;JMP // 2763
(String.setInt.ret.2)
@SP // 2764
AM=M-1 // 2765
D=M // 2766
@5 // 2767
M=D // 2768
@3 // 2769
D=M // 2770
@SP // 2771
AM=M+1 // 2772
A=A-1 // 2773
M=D // 2774
@50 // 2775
D=A // 2776
@SP // 2777
AM=M+1 // 2778
A=A-1 // 2779
M=D // 2780
// call String.appendChar
@7 // 2781
D=A // 2782
@14 // 2783
M=D // 2784
@String.appendChar // 2785
D=A // 2786
@13 // 2787
M=D // 2788
@String.setInt.ret.3 // 2789
D=A // 2790
@CALL // 2791
0;JMP // 2792
(String.setInt.ret.3)
@SP // 2793
AM=M-1 // 2794
D=M // 2795
@5 // 2796
M=D // 2797
@3 // 2798
D=M // 2799
@SP // 2800
AM=M+1 // 2801
A=A-1 // 2802
M=D // 2803
@55 // 2804
D=A // 2805
@SP // 2806
AM=M+1 // 2807
A=A-1 // 2808
M=D // 2809
// call String.appendChar
@7 // 2810
D=A // 2811
@14 // 2812
M=D // 2813
@String.appendChar // 2814
D=A // 2815
@13 // 2816
M=D // 2817
@String.setInt.ret.4 // 2818
D=A // 2819
@CALL // 2820
0;JMP // 2821
(String.setInt.ret.4)
@SP // 2822
AM=M-1 // 2823
D=M // 2824
@5 // 2825
M=D // 2826
@3 // 2827
D=M // 2828
@SP // 2829
AM=M+1 // 2830
A=A-1 // 2831
M=D // 2832
@54 // 2833
D=A // 2834
@SP // 2835
AM=M+1 // 2836
A=A-1 // 2837
M=D // 2838
// call String.appendChar
@7 // 2839
D=A // 2840
@14 // 2841
M=D // 2842
@String.appendChar // 2843
D=A // 2844
@13 // 2845
M=D // 2846
@String.setInt.ret.5 // 2847
D=A // 2848
@CALL // 2849
0;JMP // 2850
(String.setInt.ret.5)
@SP // 2851
AM=M-1 // 2852
D=M // 2853
@5 // 2854
M=D // 2855
@3 // 2856
D=M // 2857
@SP // 2858
AM=M+1 // 2859
A=A-1 // 2860
M=D // 2861
@56 // 2862
D=A // 2863
@SP // 2864
AM=M+1 // 2865
A=A-1 // 2866
M=D // 2867
// call String.appendChar
@7 // 2868
D=A // 2869
@14 // 2870
M=D // 2871
@String.appendChar // 2872
D=A // 2873
@13 // 2874
M=D // 2875
@String.setInt.ret.6 // 2876
D=A // 2877
@CALL // 2878
0;JMP // 2879
(String.setInt.ret.6)
@SP // 2880
AM=M-1 // 2881
D=M // 2882
@5 // 2883
M=D // 2884

////PushInstruction("constant 0")
@SP // 2885
AM=M+1 // 2886
A=A-1 // 2887
M=0 // 2888

////ReturnInstruction{}
@RETURN // 2889
0;JMP // 2890

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 2891
0;JMP // 2892

////LabelInstruction{label='String.setInt.IfElse3}
// label String.setInt.IfElse3
(String.setInt.IfElse3)

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 2893
A=M+1 // 2894
M=-M // 2895

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 2896
0;JMP // 2897

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 1")
//      pop:  PopInstruction{address=local 2}
//    }
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 2898
A=M+1 // 2899
D=M // 2900
@LCL // 2901
A=M+1 // 2902
A=A+1 // 2903
M=D // 2904
@LCL // 2905
A=M+1 // 2906
A=A+1 // 2907
A=A+1 // 2908
M=0 // 2909

////LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 2910
A=M+1 // 2911
A=A+1 // 2912
D=M // 2913
@15 // 2914
M=D // 2915
@String.setInt.GT.25 // 2916
D=A // 2917
@13 // 2918
M=D // 2919
@DO_GT // 2920
0;JMP // 2921
(String.setInt.GT.25)
@15 // 2922
M=D // 2923
@String.setInt.EQ.24 // 2924
D=A // 2925
@13 // 2926
M=D // 2927
@DO_EQ // 2928
0;JMP // 2929
(String.setInt.EQ.24)
@WHILE_END_String.setInt1 // 2930
D;JNE // 2931

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      pop:  PopInstruction{address=local 2}
//    }
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 2932
A=M+1 // 2933
A=A+1 // 2934
D=M // 2935
@SP // 2936
AM=M+1 // 2937
A=A-1 // 2938
M=D // 2939
@10 // 2940
D=A // 2941
@SP // 2942
AM=M+1 // 2943
A=A-1 // 2944
M=D // 2945
// call Math.divide
@7 // 2946
D=A // 2947
@14 // 2948
M=D // 2949
@Math.divide // 2950
D=A // 2951
@13 // 2952
M=D // 2953
@String.setInt.ret.7 // 2954
D=A // 2955
@CALL // 2956
0;JMP // 2957
(String.setInt.ret.7)
@SP // 2958
AM=M-1 // 2959
D=M // 2960
@LCL // 2961
A=M+1 // 2962
A=A+1 // 2963
M=D // 2964
@LCL // 2965
A=M+1 // 2966
A=A+1 // 2967
A=A+1 // 2968
M=M+1 // 2969

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 2970
0;JMP // 2971

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      pop:  PopInstruction{address=local 5}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2972
D=M // 2973
@5 // 2974
A=D+A // 2975
D=A // 2976
@SP // 2977
AM=M+1 // 2978
A=A-1 // 2979
M=D // 2980
@LCL // 2981
A=M+1 // 2982
A=A+1 // 2983
A=A+1 // 2984
D=M // 2985
@SP // 2986
AM=M+1 // 2987
A=A-1 // 2988
M=D // 2989
// call Array.new
@6 // 2990
D=A // 2991
@14 // 2992
M=D // 2993
@Array.new // 2994
D=A // 2995
@13 // 2996
M=D // 2997
@String.setInt.ret.8 // 2998
D=A // 2999
@CALL // 3000
0;JMP // 3001
(String.setInt.ret.8)
@SP // 3002
AM=M-1 // 3003
D=M // 3004
@SP // 3005
AM=M-1 // 3006
A=M // 3007
M=D // 3008
@LCL // 3009
A=M+1 // 3010
M=0 // 3011

////LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3012
A=M+1 // 3013
D=M // 3014
@15 // 3015
M=D // 3016
@String.setInt.GT.28 // 3017
D=A // 3018
@13 // 3019
M=D // 3020
@DO_GT // 3021
0;JMP // 3022
(String.setInt.GT.28)
@15 // 3023
M=D // 3024
@String.setInt.EQ.27 // 3025
D=A // 3026
@13 // 3027
M=D // 3028
@DO_EQ // 3029
0;JMP // 3030
(String.setInt.EQ.27)
@WHILE_END_String.setInt2 // 3031
D;JNE // 3032

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}, PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}},
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3033
A=M+1 // 3034
D=M // 3035
@SP // 3036
AM=M+1 // 3037
A=A-1 // 3038
M=D // 3039
@ARG // 3040
A=M+1 // 3041
D=M // 3042
@SP // 3043
AM=M+1 // 3044
A=A-1 // 3045
M=D // 3046
@10 // 3047
D=A // 3048
@SP // 3049
AM=M+1 // 3050
A=A-1 // 3051
M=D // 3052
// call Math.divide
@7 // 3053
D=A // 3054
@14 // 3055
M=D // 3056
@Math.divide // 3057
D=A // 3058
@13 // 3059
M=D // 3060
@String.setInt.ret.9 // 3061
D=A // 3062
@CALL // 3063
0;JMP // 3064
(String.setInt.ret.9)
@10 // 3065
D=A // 3066
@SP // 3067
AM=M+1 // 3068
A=A-1 // 3069
M=D // 3070
// call Math.multiply
@7 // 3071
D=A // 3072
@14 // 3073
M=D // 3074
@Math.multiply // 3075
D=A // 3076
@13 // 3077
M=D // 3078
@String.setInt.ret.10 // 3079
D=A // 3080
@CALL // 3081
0;JMP // 3082
(String.setInt.ret.10)
@SP // 3083
AM=M-1 // 3084
D=M // 3085
@SP // 3086
AM=M-1 // 3087
D=M-D // 3088
@LCL // 3089
A=M // 3090
M=D // 3091

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 48"),
//    binaryOp: "ADD"
//)
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=that 0}
//        }
//      pop:  PopInstruction{address=argument 1}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3092
D=M // 3093
@5 // 3094
A=D+A // 3095
D=M // 3096
@R13 // 3097
M=D // 3098
@LCL // 3099
A=M+1 // 3100
D=M // 3101
@R13 // 3102
D=D+M // 3103
@4 // 3104
M=D // 3105
@LCL // 3106
A=M // 3107
D=M // 3108
@48 // 3109
D=D+A // 3110
@THAT // 3111
A=M // 3112
M=D // 3113
@ARG // 3114
A=M+1 // 3115
D=M // 3116
@SP // 3117
AM=M+1 // 3118
A=A-1 // 3119
M=D // 3120
@10 // 3121
D=A // 3122
@SP // 3123
AM=M+1 // 3124
A=A-1 // 3125
M=D // 3126
// call Math.divide
@7 // 3127
D=A // 3128
@14 // 3129
M=D // 3130
@Math.divide // 3131
D=A // 3132
@13 // 3133
M=D // 3134
@String.setInt.ret.11 // 3135
D=A // 3136
@CALL // 3137
0;JMP // 3138
(String.setInt.ret.11)
@SP // 3139
AM=M-1 // 3140
D=M // 3141
@ARG // 3142
A=M+1 // 3143
M=D // 3144
@LCL // 3145
A=M+1 // 3146
M=M+1 // 3147

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 3148
0;JMP // 3149

////LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 3150
D=M // 3151
@4 // 3152
A=D+A // 3153
D=M-1 // 3154
@15 // 3155
M=D // 3156
@String.setInt.EQ.31 // 3157
D=A // 3158
@13 // 3159
M=D // 3160
@DO_EQ // 3161
0;JMP // 3162
(String.setInt.EQ.31)
@15 // 3163
M=D // 3164
@String.setInt.EQ.30 // 3165
D=A // 3166
@13 // 3167
M=D // 3168
@DO_EQ // 3169
0;JMP // 3170
(String.setInt.EQ.30)
@String.setInt.IfElse4 // 3171
D;JNE // 3172

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 3173
D=M // 3174
@SP // 3175
AM=M+1 // 3176
A=A-1 // 3177
M=D // 3178
@45 // 3179
D=A // 3180
@SP // 3181
AM=M+1 // 3182
A=A-1 // 3183
M=D // 3184
// call String.appendChar
@7 // 3185
D=A // 3186
@14 // 3187
M=D // 3188
@String.appendChar // 3189
D=A // 3190
@13 // 3191
M=D // 3192
@String.setInt.ret.12 // 3193
D=A // 3194
@CALL // 3195
0;JMP // 3196
(String.setInt.ret.12)
@SP // 3197
AM=M-1 // 3198
D=M // 3199
@5 // 3200
M=D // 3201

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 3202
0;JMP // 3203

////LabelInstruction{label='String.setInt.IfElse4}
// label String.setInt.IfElse4
(String.setInt.IfElse4)

////LabelInstruction{label='String.setInt.IfElseEND4}
// label String.setInt.IfElseEND4
(String.setInt.IfElseEND4)

////LabelInstruction{label='WHILE_START_String.setInt3}
// label WHILE_START_String.setInt3
(WHILE_START_String.setInt3)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 3204
A=M+1 // 3205
D=M // 3206
@15 // 3207
M=D // 3208
@String.setInt.GT.34 // 3209
D=A // 3210
@13 // 3211
M=D // 3212
@DO_GT // 3213
0;JMP // 3214
(String.setInt.GT.34)
@15 // 3215
M=D // 3216
@String.setInt.EQ.33 // 3217
D=A // 3218
@13 // 3219
M=D // 3220
@DO_EQ // 3221
0;JMP // 3222
(String.setInt.EQ.33)
@WHILE_END_String.setInt3 // 3223
D;JNE // 3224

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3225
A=M+1 // 3226
M=M-1 // 3227

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("that 0")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3228
D=M // 3229
@5 // 3230
A=D+A // 3231
D=M // 3232
@R13 // 3233
M=D // 3234
@LCL // 3235
A=M+1 // 3236
D=M // 3237
@R13 // 3238
D=D+M // 3239
@4 // 3240
M=D // 3241
@3 // 3242
D=M // 3243
@SP // 3244
AM=M+1 // 3245
A=A-1 // 3246
M=D // 3247
@THAT // 3248
A=M // 3249
D=M // 3250
@SP // 3251
AM=M+1 // 3252
A=A-1 // 3253
M=D // 3254
// call String.appendChar
@7 // 3255
D=A // 3256
@14 // 3257
M=D // 3258
@String.appendChar // 3259
D=A // 3260
@13 // 3261
M=D // 3262
@String.setInt.ret.13 // 3263
D=A // 3264
@CALL // 3265
0;JMP // 3266
(String.setInt.ret.13)
@SP // 3267
AM=M-1 // 3268
D=M // 3269
@5 // 3270
M=D // 3271

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 3272
0;JMP // 3273

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3274
D=M // 3275
@5 // 3276
A=D+A // 3277
D=M // 3278
@SP // 3279
AM=M+1 // 3280
A=A-1 // 3281
M=D // 3282
// call Array.dispose
@6 // 3283
D=A // 3284
@14 // 3285
M=D // 3286
@Array.dispose // 3287
D=A // 3288
@13 // 3289
M=D // 3290
@String.setInt.ret.14 // 3291
D=A // 3292
@CALL // 3293
0;JMP // 3294
(String.setInt.ret.14)
@SP // 3295
AM=M-1 // 3296
D=M // 3297
@5 // 3298
M=D // 3299

////PushInstruction("constant 0")
@SP // 3300
AM=M+1 // 3301
A=A-1 // 3302
M=0 // 3303

////ReturnInstruction{}
@RETURN // 3304
0;JMP // 3305

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 3306
D=A // 3307
@SP // 3308
AM=M+1 // 3309
A=A-1 // 3310
M=D // 3311

////ReturnInstruction{}
@RETURN // 3312
0;JMP // 3313

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 3314
D=A // 3315
@SP // 3316
AM=M+1 // 3317
A=A-1 // 3318
M=D // 3319

////ReturnInstruction{}
@RETURN // 3320
0;JMP // 3321

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////FunctionInstruction{functionName='Math.init', numLocals=0, funcMapping={}}
// function Math.init with 0
(Math.init)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}}
//  pop:  PopInstruction{address=Math.0}
//}

@16 // 3322
D=A // 3323
@SP // 3324
AM=M+1 // 3325
A=A-1 // 3326
M=D // 3327
// call Array.new
@6 // 3328
D=A // 3329
@14 // 3330
M=D // 3331
@Array.new // 3332
D=A // 3333
@13 // 3334
M=D // 3335
@Math.init.ret.0 // 3336
D=A // 3337
@CALL // 3338
0;JMP // 3339
(Math.init.ret.0)
@SP // 3340
AM=M-1 // 3341
D=M // 3342
@Math.0 // 3343
M=D // 3344

////PushPopPair {
//  push: PushInstruction("constant 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3345
D=M // 3346
@4 // 3347
M=D // 3348
@THAT // 3349
A=M // 3350
M=1 // 3351

////PushPopPair {
//  push: PushInstruction("constant 2")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3352
D=M+1 // 3353
@4 // 3354
M=D // 3355
@2 // 3356
D=A // 3357
@THAT // 3358
A=M // 3359
M=D // 3360

////PushPopPair {
//  push: PushInstruction("constant 4")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3361
D=M // 3362
@2 // 3363
D=D+A // 3364
@4 // 3365
M=D // 3366
@4 // 3367
D=A // 3368
@THAT // 3369
A=M // 3370
M=D // 3371

////PushPopPair {
//  push: PushInstruction("constant 8")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3372
D=M // 3373
@3 // 3374
D=D+A // 3375
@4 // 3376
M=D // 3377
@8 // 3378
D=A // 3379
@THAT // 3380
A=M // 3381
M=D // 3382

////PushPopPair {
//  push: PushInstruction("constant 16")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3383
D=M // 3384
@4 // 3385
D=D+A // 3386
@4 // 3387
M=D // 3388
@16 // 3389
D=A // 3390
@THAT // 3391
A=M // 3392
M=D // 3393

////PushPopPair {
//  push: PushInstruction("constant 32")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3394
D=M // 3395
@5 // 3396
D=D+A // 3397
@4 // 3398
M=D // 3399
@32 // 3400
D=A // 3401
@THAT // 3402
A=M // 3403
M=D // 3404

////PushPopPair {
//  push: PushInstruction("constant 64")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3405
D=M // 3406
@6 // 3407
D=D+A // 3408
@4 // 3409
M=D // 3410
@64 // 3411
D=A // 3412
@THAT // 3413
A=M // 3414
M=D // 3415

////PushPopPair {
//  push: PushInstruction("constant 128")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3416
D=M // 3417
@7 // 3418
D=D+A // 3419
@4 // 3420
M=D // 3421
@128 // 3422
D=A // 3423
@THAT // 3424
A=M // 3425
M=D // 3426

////PushPopPair {
//  push: PushInstruction("constant 256")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3427
D=M // 3428
@8 // 3429
D=D+A // 3430
@4 // 3431
M=D // 3432
@256 // 3433
D=A // 3434
@THAT // 3435
A=M // 3436
M=D // 3437

////PushPopPair {
//  push: PushInstruction("constant 512")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3438
D=M // 3439
@9 // 3440
D=D+A // 3441
@4 // 3442
M=D // 3443
@512 // 3444
D=A // 3445
@THAT // 3446
A=M // 3447
M=D // 3448

////PushPopPair {
//  push: PushInstruction("constant 1024")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3449
D=M // 3450
@10 // 3451
D=D+A // 3452
@4 // 3453
M=D // 3454
@1024 // 3455
D=A // 3456
@THAT // 3457
A=M // 3458
M=D // 3459

////PushPopPair {
//  push: PushInstruction("constant 2048")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 11"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3460
D=M // 3461
@11 // 3462
D=D+A // 3463
@4 // 3464
M=D // 3465
@2048 // 3466
D=A // 3467
@THAT // 3468
A=M // 3469
M=D // 3470

////PushPopPair {
//  push: PushInstruction("constant 4096")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 12"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3471
D=M // 3472
@12 // 3473
D=D+A // 3474
@4 // 3475
M=D // 3476
@4096 // 3477
D=A // 3478
@THAT // 3479
A=M // 3480
M=D // 3481

////PushPopPair {
//  push: PushInstruction("constant 8192")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 13"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3482
D=M // 3483
@13 // 3484
D=D+A // 3485
@4 // 3486
M=D // 3487
@8192 // 3488
D=A // 3489
@THAT // 3490
A=M // 3491
M=D // 3492

////PushPopPair {
//  push: PushInstruction("constant 16384")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 14"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3493
D=M // 3494
@14 // 3495
D=D+A // 3496
@4 // 3497
M=D // 3498
@16384 // 3499
D=A // 3500
@THAT // 3501
A=M // 3502
M=D // 3503

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("constant 16384"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Math.0 // 3504
D=M // 3505
@15 // 3506
D=D+A // 3507
@4 // 3508
M=D // 3509
@32768 // 3510
D=-A // 3511
@THAT // 3512
A=M // 3513
M=D // 3514

////PushInstruction("constant 0")
@SP // 3515
AM=M+1 // 3516
A=A-1 // 3517
M=0 // 3518

////ReturnInstruction{}
@RETURN // 3519
0;JMP // 3520

////FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@Math.0 // 3521
D=M // 3522
@R13 // 3523
M=D // 3524
@ARG // 3525
A=M+1 // 3526
D=M // 3527
@R13 // 3528
D=D+M // 3529
@4 // 3530
M=D // 3531

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("that 0"),
//    binaryOp: "AND"
//)
@ARG // 3532
A=M // 3533
D=M // 3534
@R13 // 3535
M=D // 3536
@THAT // 3537
A=M // 3538
D=M // 3539
@R13 // 3540
D=D&M // 3541
@SP // 3542
AM=M+1 // 3543
A=A-1 // 3544
M=D // 3545

////ReturnInstruction{}
@RETURN // 3546
0;JMP // 3547

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 3548
AM=M+1 // 3549
A=A-1 // 3550
M=0 // 3551
@SP // 3552
AM=M+1 // 3553
A=A-1 // 3554
M=0 // 3555
@SP // 3556
AM=M+1 // 3557
A=A-1 // 3558
M=0 // 3559

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3560
A=M // 3561
D=M // 3562
@15 // 3563
M=D // 3564
@Math.multiply.EQ.3 // 3565
D=A // 3566
@13 // 3567
M=D // 3568
@DO_EQ // 3569
0;JMP // 3570
(Math.multiply.EQ.3)
@SP // 3571
AM=M+1 // 3572
A=A-1 // 3573
M=D // 3574
@ARG // 3575
A=M+1 // 3576
D=M // 3577
@15 // 3578
M=D // 3579
@Math.multiply.EQ.4 // 3580
D=A // 3581
@13 // 3582
M=D // 3583
@DO_EQ // 3584
0;JMP // 3585
(Math.multiply.EQ.4)
@SP // 3586
AM=M-1 // 3587
D=D|M // 3588
@15 // 3589
M=D // 3590
@Math.multiply.EQ.2 // 3591
D=A // 3592
@13 // 3593
M=D // 3594
@DO_EQ // 3595
0;JMP // 3596
(Math.multiply.EQ.2)
@Math.multiply.IfElse1 // 3597
D;JNE // 3598

////PushInstruction("constant 0")
@SP // 3599
AM=M+1 // 3600
A=A-1 // 3601
M=0 // 3602

////ReturnInstruction{}
@RETURN // 3603
0;JMP // 3604

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 3605
0;JMP // 3606

////LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)

////LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3607
A=M // 3608
D=M-1 // 3609
@15 // 3610
M=D // 3611
@Math.multiply.EQ.7 // 3612
D=A // 3613
@13 // 3614
M=D // 3615
@DO_EQ // 3616
0;JMP // 3617
(Math.multiply.EQ.7)
@15 // 3618
M=D // 3619
@Math.multiply.EQ.6 // 3620
D=A // 3621
@13 // 3622
M=D // 3623
@DO_EQ // 3624
0;JMP // 3625
(Math.multiply.EQ.6)
@Math.multiply.IfElse2 // 3626
D;JNE // 3627

////PushInstruction("argument 1")
@ARG // 3628
A=M+1 // 3629
D=M // 3630
@SP // 3631
AM=M+1 // 3632
A=A-1 // 3633
M=D // 3634

////ReturnInstruction{}
@RETURN // 3635
0;JMP // 3636

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 3637
0;JMP // 3638

////LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)

////LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3639
A=M+1 // 3640
D=M-1 // 3641
@15 // 3642
M=D // 3643
@Math.multiply.EQ.10 // 3644
D=A // 3645
@13 // 3646
M=D // 3647
@DO_EQ // 3648
0;JMP // 3649
(Math.multiply.EQ.10)
@15 // 3650
M=D // 3651
@Math.multiply.EQ.9 // 3652
D=A // 3653
@13 // 3654
M=D // 3655
@DO_EQ // 3656
0;JMP // 3657
(Math.multiply.EQ.9)
@Math.multiply.IfElse3 // 3658
D;JNE // 3659

////PushInstruction("argument 0")
@ARG // 3660
A=M // 3661
D=M // 3662
@SP // 3663
AM=M+1 // 3664
A=A-1 // 3665
M=D // 3666

////ReturnInstruction{}
@RETURN // 3667
0;JMP // 3668

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 3669
0;JMP // 3670

////LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)

////LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3671
A=M // 3672
D=M // 3673
@2 // 3674
D=D-A // 3675
@15 // 3676
M=D // 3677
@Math.multiply.EQ.13 // 3678
D=A // 3679
@13 // 3680
M=D // 3681
@DO_EQ // 3682
0;JMP // 3683
(Math.multiply.EQ.13)
@15 // 3684
M=D // 3685
@Math.multiply.EQ.12 // 3686
D=A // 3687
@13 // 3688
M=D // 3689
@DO_EQ // 3690
0;JMP // 3691
(Math.multiply.EQ.12)
@Math.multiply.IfElse4 // 3692
D;JNE // 3693

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 3694
A=M+1 // 3695
D=M // 3696
D=D+M // 3697
@SP // 3698
AM=M+1 // 3699
A=A-1 // 3700
M=D // 3701

////ReturnInstruction{}
@RETURN // 3702
0;JMP // 3703

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 3704
0;JMP // 3705

////LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)

////LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3706
A=M+1 // 3707
D=M // 3708
@2 // 3709
D=D-A // 3710
@15 // 3711
M=D // 3712
@Math.multiply.EQ.16 // 3713
D=A // 3714
@13 // 3715
M=D // 3716
@DO_EQ // 3717
0;JMP // 3718
(Math.multiply.EQ.16)
@15 // 3719
M=D // 3720
@Math.multiply.EQ.15 // 3721
D=A // 3722
@13 // 3723
M=D // 3724
@DO_EQ // 3725
0;JMP // 3726
(Math.multiply.EQ.15)
@Math.multiply.IfElse5 // 3727
D;JNE // 3728

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 3729
A=M // 3730
D=M // 3731
D=D+M // 3732
@SP // 3733
AM=M+1 // 3734
A=A-1 // 3735
M=D // 3736

////ReturnInstruction{}
@RETURN // 3737
0;JMP // 3738

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 3739
0;JMP // 3740

////LabelInstruction{label='Math.multiply.IfElse5}
// label Math.multiply.IfElse5
(Math.multiply.IfElse5)

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3741
A=M+1 // 3742
A=A+1 // 3743
M=1 // 3744

////LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 3745
A=M+1 // 3746
D=M // 3747
@16 // 3748
D=D-A // 3749
@15 // 3750
M=D // 3751
@Math.multiply.LT.19 // 3752
D=A // 3753
@13 // 3754
M=D // 3755
@DO_LT // 3756
0;JMP // 3757
(Math.multiply.LT.19)
@15 // 3758
M=D // 3759
@Math.multiply.EQ.18 // 3760
D=A // 3761
@13 // 3762
M=D // 3763
@DO_EQ // 3764
0;JMP // 3765
(Math.multiply.EQ.18)
@WHILE_END_Math.multiply1 // 3766
D;JNE // 3767

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3768
A=M+1 // 3769
D=M // 3770
@R13 // 3771
M=D // 3772
@LCL // 3773
A=M+1 // 3774
A=A+1 // 3775
D=M // 3776
@R13 // 3777
D=D&M // 3778
@15 // 3779
M=D // 3780
@Math.multiply.EQ.20 // 3781
D=A // 3782
@13 // 3783
M=D // 3784
@DO_EQ // 3785
0;JMP // 3786
(Math.multiply.EQ.20)
@Math.multiply.IfElse6 // 3787
D;JNE // 3788

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3789
A=M // 3790
D=M // 3791
@R13 // 3792
M=D // 3793
@ARG // 3794
A=M // 3795
D=M // 3796
@R13 // 3797
D=D+M // 3798
@LCL // 3799
A=M // 3800
M=D // 3801

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 3802
0;JMP // 3803

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=argument 0}
//        }
//      pop:  PopInstruction{address=local 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3804
A=M // 3805
D=M // 3806
D=D+M // 3807
@ARG // 3808
A=M // 3809
M=D // 3810
@LCL // 3811
A=M+1 // 3812
M=M+1 // 3813
@LCL // 3814
A=M+1 // 3815
A=A+1 // 3816
D=M // 3817
D=D+M // 3818
@LCL // 3819
A=M+1 // 3820
A=A+1 // 3821
M=D // 3822

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 3823
0;JMP // 3824

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 3825
A=M // 3826
D=M // 3827
@SP // 3828
AM=M+1 // 3829
A=A-1 // 3830
M=D // 3831

////ReturnInstruction{}
@RETURN // 3832
0;JMP // 3833

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 3834
AM=M+1 // 3835
A=A-1 // 3836
M=0 // 3837
@SP // 3838
AM=M+1 // 3839
A=A-1 // 3840
M=0 // 3841
@SP // 3842
AM=M+1 // 3843
A=A-1 // 3844
M=0 // 3845

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//      pop:  PopInstruction{address=local 2}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3846
A=M // 3847
D=M // 3848
@SP // 3849
AM=M+1 // 3850
A=A-1 // 3851
M=D // 3852
// call Math.abs
@6 // 3853
D=A // 3854
@14 // 3855
M=D // 3856
@Math.abs // 3857
D=A // 3858
@13 // 3859
M=D // 3860
@Math.divide.ret.0 // 3861
D=A // 3862
@CALL // 3863
0;JMP // 3864
(Math.divide.ret.0)
@SP // 3865
AM=M-1 // 3866
D=M // 3867
@LCL // 3868
A=M+1 // 3869
A=A+1 // 3870
M=D // 3871
@ARG // 3872
A=M+1 // 3873
D=M // 3874
@SP // 3875
AM=M+1 // 3876
A=A-1 // 3877
M=D // 3878
// call Math.abs
@6 // 3879
D=A // 3880
@14 // 3881
M=D // 3882
@Math.abs // 3883
D=A // 3884
@13 // 3885
M=D // 3886
@Math.divide.ret.1 // 3887
D=A // 3888
@CALL // 3889
0;JMP // 3890
(Math.divide.ret.1)
@SP // 3891
AM=M-1 // 3892
D=M // 3893
@LCL // 3894
A=M+1 // 3895
M=D // 3896

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3897
A=M // 3898
D=M // 3899
@15 // 3900
M=D // 3901
@Math.divide.EQ.24 // 3902
D=A // 3903
@13 // 3904
M=D // 3905
@DO_EQ // 3906
0;JMP // 3907
(Math.divide.EQ.24)
@SP // 3908
AM=M+1 // 3909
A=A-1 // 3910
M=D // 3911
@LCL // 3912
A=M+1 // 3913
A=A+1 // 3914
D=M // 3915
A=A-1 // 3916
D=M-D // 3917
@15 // 3918
M=D // 3919
@Math.divide.GT.25 // 3920
D=A // 3921
@13 // 3922
M=D // 3923
@DO_GT // 3924
0;JMP // 3925
(Math.divide.GT.25)
@SP // 3926
AM=M-1 // 3927
D=D|M // 3928
@15 // 3929
M=D // 3930
@Math.divide.EQ.23 // 3931
D=A // 3932
@13 // 3933
M=D // 3934
@DO_EQ // 3935
0;JMP // 3936
(Math.divide.EQ.23)
@Math.divide.IfElse1 // 3937
D;JNE // 3938

////PushInstruction("constant 0")
@SP // 3939
AM=M+1 // 3940
A=A-1 // 3941
M=0 // 3942

////ReturnInstruction{}
@RETURN // 3943
0;JMP // 3944

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 3945
0;JMP // 3946

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3947
A=M+1 // 3948
D=M // 3949
A=A-1 // 3950
D=M-D // 3951
@15 // 3952
M=D // 3953
@Math.divide.EQ.28 // 3954
D=A // 3955
@13 // 3956
M=D // 3957
@DO_EQ // 3958
0;JMP // 3959
(Math.divide.EQ.28)
@15 // 3960
M=D // 3961
@Math.divide.EQ.27 // 3962
D=A // 3963
@13 // 3964
M=D // 3965
@DO_EQ // 3966
0;JMP // 3967
(Math.divide.EQ.27)
@Math.divide.IfElse2 // 3968
D;JNE // 3969

////PushInstruction("constant 1")
@SP // 3970
AM=M+1 // 3971
A=A-1 // 3972
M=1 // 3973

////ReturnInstruction{}
@RETURN // 3974
0;JMP // 3975

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 3976
0;JMP // 3977

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 3978
A=M // 3979
D=M // 3980
@15 // 3981
M=D // 3982
@Math.divide.LT.32 // 3983
D=A // 3984
@13 // 3985
M=D // 3986
@DO_LT // 3987
0;JMP // 3988
(Math.divide.LT.32)
@SP // 3989
AM=M+1 // 3990
A=A-1 // 3991
M=D // 3992
@ARG // 3993
A=M+1 // 3994
D=M // 3995
@15 // 3996
M=D // 3997
@Math.divide.LT.33 // 3998
D=A // 3999
@13 // 4000
M=D // 4001
@DO_LT // 4002
0;JMP // 4003
(Math.divide.LT.33)
@SP // 4004
AM=M-1 // 4005
D=D|M // 4006
@15 // 4007
M=D // 4008
@Math.divide.EQ.31 // 4009
D=A // 4010
@13 // 4011
M=D // 4012
@DO_EQ // 4013
0;JMP // 4014
(Math.divide.EQ.31)
@Math.divide.IfElse3 // 4015
D;JNE // 4016

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4017
A=M+1 // 4018
A=A+1 // 4019
D=M // 4020
@SP // 4021
AM=M+1 // 4022
A=A-1 // 4023
M=D // 4024
@LCL // 4025
A=M+1 // 4026
D=M // 4027
@SP // 4028
AM=M+1 // 4029
A=A-1 // 4030
M=D // 4031
// call Math.divide
@7 // 4032
D=A // 4033
@14 // 4034
M=D // 4035
@Math.divide // 4036
D=A // 4037
@13 // 4038
M=D // 4039
@Math.divide.ret.2 // 4040
D=A // 4041
@CALL // 4042
0;JMP // 4043
(Math.divide.ret.2)
@SP // 4044
AM=M-1 // 4045
D=M // 4046
@LCL // 4047
A=M // 4048
M=D // 4049

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 4050
A=M // 4051
D=M // 4052
@15 // 4053
M=D // 4054
@Math.divide.LT.37 // 4055
D=A // 4056
@13 // 4057
M=D // 4058
@DO_LT // 4059
0;JMP // 4060
(Math.divide.LT.37)
@SP // 4061
AM=M+1 // 4062
A=A-1 // 4063
M=D // 4064
@ARG // 4065
A=M+1 // 4066
D=M // 4067
@15 // 4068
M=D // 4069
@Math.divide.LT.38 // 4070
D=A // 4071
@13 // 4072
M=D // 4073
@DO_LT // 4074
0;JMP // 4075
(Math.divide.LT.38)
@SP // 4076
AM=M-1 // 4077
D=D&M // 4078
@15 // 4079
M=D // 4080
@Math.divide.EQ.36 // 4081
D=A // 4082
@13 // 4083
M=D // 4084
@DO_EQ // 4085
0;JMP // 4086
(Math.divide.EQ.36)
@Math.divide.IfElse4 // 4087
D;JNE // 4088

////PushInstruction("local 0")
@LCL // 4089
A=M // 4090
D=M // 4091
@SP // 4092
AM=M+1 // 4093
A=A-1 // 4094
M=D // 4095

////ReturnInstruction{}
@RETURN // 4096
0;JMP // 4097

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 4098
0;JMP // 4099

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
@LCL // 4100
A=M // 4101
D=M // 4102
@SP // 4103
AM=M+1 // 4104
A=A-1 // 4105
M=D // 4106
@SP // 4107
A=M-1 // 4108
M=-D // 4109

////ReturnInstruction{}
@RETURN // 4110
0;JMP // 4111

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 4112
0;JMP // 4113

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=3, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 4114
A=M // 4115
D=M // 4116
@SP // 4117
AM=M+1 // 4118
A=A-1 // 4119
M=D // 4120
@ARG // 4121
A=M+1 // 4122
D=M // 4123
D=D+M // 4124
@SP // 4125
AM=M+1 // 4126
A=A-1 // 4127
M=D // 4128
// call Math.divide
@7 // 4129
D=A // 4130
@14 // 4131
M=D // 4132
@Math.divide // 4133
D=A // 4134
@13 // 4135
M=D // 4136
@Math.divide.ret.3 // 4137
D=A // 4138
@CALL // 4139
0;JMP // 4140
(Math.divide.ret.3)
@SP // 4141
AM=M-1 // 4142
D=M // 4143
@LCL // 4144
A=M // 4145
M=D // 4146

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 4147
A=M // 4148
D=M // 4149
@SP // 4150
AM=M+1 // 4151
A=A-1 // 4152
M=D // 4153
@LCL // 4154
A=M // 4155
D=M // 4156
D=D+M // 4157
@SP // 4158
AM=M+1 // 4159
A=A-1 // 4160
M=D // 4161
@ARG // 4162
A=M+1 // 4163
D=M // 4164
@SP // 4165
AM=M+1 // 4166
A=A-1 // 4167
M=D // 4168
// call Math.multiply
@7 // 4169
D=A // 4170
@14 // 4171
M=D // 4172
@Math.multiply // 4173
D=A // 4174
@13 // 4175
M=D // 4176
@Math.divide.ret.5 // 4177
D=A // 4178
@CALL // 4179
0;JMP // 4180
(Math.divide.ret.5)
@SP // 4181
AM=M-1 // 4182
D=M // 4183
@SP // 4184
AM=M-1 // 4185
D=M-D // 4186
@SP // 4187
AM=M+1 // 4188
A=A-1 // 4189
M=D // 4190
@ARG // 4191
A=M+1 // 4192
D=M // 4193
@SP // 4194
AM=M-1 // 4195
D=M-D // 4196
@15 // 4197
M=D // 4198
@Math.divide.LT.41 // 4199
D=A // 4200
@13 // 4201
M=D // 4202
@DO_LT // 4203
0;JMP // 4204
(Math.divide.LT.41)
@15 // 4205
M=D // 4206
@Math.divide.EQ.40 // 4207
D=A // 4208
@13 // 4209
M=D // 4210
@DO_EQ // 4211
0;JMP // 4212
(Math.divide.EQ.40)
@Math.divide.IfElse5 // 4213
D;JNE // 4214

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 4215
A=M // 4216
D=M // 4217
D=D+M // 4218
@SP // 4219
AM=M+1 // 4220
A=A-1 // 4221
M=D // 4222

////ReturnInstruction{}
@RETURN // 4223
0;JMP // 4224

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 4225
0;JMP // 4226

////LabelInstruction{label='Math.divide.IfElse5}
// label Math.divide.IfElse5
(Math.divide.IfElse5)

////LabelInstruction{label='Math.divide.IfElseEND5}
// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)

////BinaryPushGroup(
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
@LCL // 4227
A=M // 4228
D=M // 4229
D=D+M // 4230
D=M+1 // 4231
@SP // 4232
AM=M+1 // 4233
A=A-1 // 4234
M=D // 4235

////ReturnInstruction{}
@RETURN // 4236
0;JMP // 4237

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=6, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=6, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}}, PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}},
//    binaryOp: "SUB"
//)
@ARG // 4238
A=M // 4239
D=M // 4240
@SP // 4241
AM=M+1 // 4242
A=A-1 // 4243
M=D // 4244
@ARG // 4245
A=M // 4246
D=M // 4247
@SP // 4248
AM=M+1 // 4249
A=A-1 // 4250
M=D // 4251
@ARG // 4252
A=M+1 // 4253
D=M // 4254
@SP // 4255
AM=M+1 // 4256
A=A-1 // 4257
M=D // 4258
// call Math.divide
@7 // 4259
D=A // 4260
@14 // 4261
M=D // 4262
@Math.divide // 4263
D=A // 4264
@13 // 4265
M=D // 4266
@Math.mod.ret.0 // 4267
D=A // 4268
@CALL // 4269
0;JMP // 4270
(Math.mod.ret.0)
@ARG // 4271
A=M+1 // 4272
D=M // 4273
@SP // 4274
AM=M+1 // 4275
A=A-1 // 4276
M=D // 4277
// call Math.multiply
@7 // 4278
D=A // 4279
@14 // 4280
M=D // 4281
@Math.multiply // 4282
D=A // 4283
@13 // 4284
M=D // 4285
@Math.mod.ret.1 // 4286
D=A // 4287
@CALL // 4288
0;JMP // 4289
(Math.mod.ret.1)
@SP // 4290
AM=M-1 // 4291
D=M // 4292
@SP // 4293
AM=M-1 // 4294
D=M-D // 4295
@SP // 4296
AM=M+1 // 4297
A=A-1 // 4298
M=D // 4299

////ReturnInstruction{}
@RETURN // 4300
0;JMP // 4301

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@Math.0 // 4302
D=M // 4303
@R13 // 4304
M=D // 4305
@ARG // 4306
A=M // 4307
D=M // 4308
@R13 // 4309
D=D+M // 4310
@4 // 4311
M=D // 4312

////PushInstruction("that 0")
@THAT // 4313
A=M // 4314
D=M // 4315
@SP // 4316
AM=M+1 // 4317
A=A-1 // 4318
M=D // 4319

////ReturnInstruction{}
@RETURN // 4320
0;JMP // 4321

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 4322
AM=M+1 // 4323
A=A-1 // 4324
M=0 // 4325
@SP // 4326
AM=M+1 // 4327
A=A-1 // 4328
M=0 // 4329
@SP // 4330
AM=M+1 // 4331
A=A-1 // 4332
M=0 // 4333
@SP // 4334
AM=M+1 // 4335
A=A-1 // 4336
M=0 // 4337

////PushPopPair {
//  push: PushInstruction("constant 7")
//  nested:
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4338
A=M // 4339
M=0 // 4340
@7 // 4341
D=A // 4342
@LCL // 4343
A=M+1 // 4344
M=D // 4345

////LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 4346
A=M+1 // 4347
D=M // 4348
@15 // 4349
M=D // 4350
@Math.sqrt.LT.44 // 4351
D=A // 4352
@13 // 4353
M=D // 4354
@DO_LT // 4355
0;JMP // 4356
(Math.sqrt.LT.44)
D=!D // 4357
@15 // 4358
M=D // 4359
@Math.sqrt.EQ.43 // 4360
D=A // 4361
@13 // 4362
M=D // 4363
@DO_EQ // 4364
0;JMP // 4365
(Math.sqrt.EQ.43)
@WHILE_END_Math.sqrt1 // 4366
D;JNE // 4367

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("that 0"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=local 2}
//    }
//  pop:  PopInstruction{address=local 3}
//}

@Math.0 // 4368
D=M // 4369
@R13 // 4370
M=D // 4371
@LCL // 4372
A=M+1 // 4373
D=M // 4374
@R13 // 4375
D=D+M // 4376
@4 // 4377
M=D // 4378
@LCL // 4379
A=M // 4380
D=M // 4381
@R13 // 4382
M=D // 4383
@THAT // 4384
A=M // 4385
D=M // 4386
@R13 // 4387
D=D+M // 4388
@LCL // 4389
A=M+1 // 4390
A=A+1 // 4391
M=D // 4392
@LCL // 4393
A=M+1 // 4394
A=A+1 // 4395
D=M // 4396
@SP // 4397
AM=M+1 // 4398
A=A-1 // 4399
M=D // 4400
@LCL // 4401
A=M+1 // 4402
A=A+1 // 4403
D=M // 4404
@SP // 4405
AM=M+1 // 4406
A=A-1 // 4407
M=D // 4408
// call Math.multiply
@7 // 4409
D=A // 4410
@14 // 4411
M=D // 4412
@Math.multiply // 4413
D=A // 4414
@13 // 4415
M=D // 4416
@Math.sqrt.ret.0 // 4417
D=A // 4418
@CALL // 4419
0;JMP // 4420
(Math.sqrt.ret.0)
@SP // 4421
AM=M-1 // 4422
D=M // 4423
@LCL // 4424
A=M+1 // 4425
A=A+1 // 4426
A=A+1 // 4427
M=D // 4428

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 4429
A=M+1 // 4430
A=A+1 // 4431
A=A+1 // 4432
D=M // 4433
@R13 // 4434
M=D // 4435
@ARG // 4436
A=M // 4437
D=M // 4438
@R13 // 4439
D=M-D // 4440
@15 // 4441
M=D // 4442
@Math.sqrt.GT.48 // 4443
D=A // 4444
@13 // 4445
M=D // 4446
@DO_GT // 4447
0;JMP // 4448
(Math.sqrt.GT.48)
@SP // 4449
AM=M+1 // 4450
A=A-1 // 4451
M=D // 4452
@SP // 4453
A=M-1 // 4454
M=!D // 4455
@LCL // 4456
A=M+1 // 4457
A=A+1 // 4458
A=A+1 // 4459
D=M // 4460
@15 // 4461
M=D // 4462
@Math.sqrt.GT.49 // 4463
D=A // 4464
@13 // 4465
M=D // 4466
@DO_GT // 4467
0;JMP // 4468
(Math.sqrt.GT.49)
@SP // 4469
AM=M-1 // 4470
D=D&M // 4471
@15 // 4472
M=D // 4473
@Math.sqrt.EQ.47 // 4474
D=A // 4475
@13 // 4476
M=D // 4477
@DO_EQ // 4478
0;JMP // 4479
(Math.sqrt.EQ.47)
@Math.sqrt.IfElse1 // 4480
D;JNE // 4481

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4482
A=M+1 // 4483
A=A+1 // 4484
D=M // 4485
@LCL // 4486
A=M // 4487
M=D // 4488

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 4489
0;JMP // 4490

////LabelInstruction{label='Math.sqrt.IfElse1}
// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)

////LabelInstruction{label='Math.sqrt.IfElseEND1}
// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4491
A=M+1 // 4492
M=M-1 // 4493

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 4494
0;JMP // 4495

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 4496
A=M // 4497
D=M // 4498
@SP // 4499
AM=M+1 // 4500
A=A-1 // 4501
M=D // 4502

////ReturnInstruction{}
@RETURN // 4503
0;JMP // 4504

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 4505
A=M+1 // 4506
D=M // 4507
A=A-1 // 4508
D=M-D // 4509
@15 // 4510
M=D // 4511
@Math.max.GT.52 // 4512
D=A // 4513
@13 // 4514
M=D // 4515
@DO_GT // 4516
0;JMP // 4517
(Math.max.GT.52)
@15 // 4518
M=D // 4519
@Math.max.EQ.51 // 4520
D=A // 4521
@13 // 4522
M=D // 4523
@DO_EQ // 4524
0;JMP // 4525
(Math.max.EQ.51)
@Math.max.IfElse1 // 4526
D;JNE // 4527

////PushInstruction("argument 0")
@ARG // 4528
A=M // 4529
D=M // 4530
@SP // 4531
AM=M+1 // 4532
A=A-1 // 4533
M=D // 4534

////ReturnInstruction{}
@RETURN // 4535
0;JMP // 4536

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 4537
0;JMP // 4538

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 4539
A=M+1 // 4540
D=M // 4541
@SP // 4542
AM=M+1 // 4543
A=A-1 // 4544
M=D // 4545

////ReturnInstruction{}
@RETURN // 4546
0;JMP // 4547

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 4548
A=M+1 // 4549
D=M // 4550
A=A-1 // 4551
D=M-D // 4552
@15 // 4553
M=D // 4554
@Math.min.LT.55 // 4555
D=A // 4556
@13 // 4557
M=D // 4558
@DO_LT // 4559
0;JMP // 4560
(Math.min.LT.55)
@15 // 4561
M=D // 4562
@Math.min.EQ.54 // 4563
D=A // 4564
@13 // 4565
M=D // 4566
@DO_EQ // 4567
0;JMP // 4568
(Math.min.EQ.54)
@Math.min.IfElse1 // 4569
D;JNE // 4570

////PushInstruction("argument 0")
@ARG // 4571
A=M // 4572
D=M // 4573
@SP // 4574
AM=M+1 // 4575
A=A-1 // 4576
M=D // 4577

////ReturnInstruction{}
@RETURN // 4578
0;JMP // 4579

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 4580
0;JMP // 4581

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 4582
A=M+1 // 4583
D=M // 4584
@SP // 4585
AM=M+1 // 4586
A=A-1 // 4587
M=D // 4588

////ReturnInstruction{}
@RETURN // 4589
0;JMP // 4590

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=Output.1}
//    }
//  pop:  PopInstruction{address=Output.2}
//}

// call Output.initMap
@5 // 4591
D=A // 4592
@14 // 4593
M=D // 4594
@Output.initMap // 4595
D=A // 4596
@13 // 4597
M=D // 4598
@Output.init.ret.0 // 4599
D=A // 4600
@CALL // 4601
0;JMP // 4602
(Output.init.ret.0)
@SP // 4603
AM=M-1 // 4604
D=M // 4605
@5 // 4606
M=D // 4607
@Output.1 // 4608
M=0 // 4609
@Output.2 // 4610
M=0 // 4611

////PushInstruction("constant 0")
@SP // 4612
AM=M+1 // 4613
A=A-1 // 4614
M=0 // 4615

////ReturnInstruction{}
@RETURN // 4616
0;JMP // 4617

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4618
AM=M+1 // 4619
A=A-1 // 4620
M=0 // 4621

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//              nested:
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                  nested:
//                    PushPopPair {
//                      push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                      nested:
//                        PushPopPair {
//                          push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                          nested:
//                            PushPopPair {
//                              push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                              nested:
//                                PushPopPair {
//                                  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                  nested:
//                                    PushPopPair {
//                                      push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                      nested:
//                                        PushPopPair {
//                                          push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                          nested:
//                                            PushPopPair {
//                                              push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                              nested:
//                                                PushPopPair {
//                                                  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                  nested:
//                                                    PushPopPair {
//                                                      push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                      nested:
//                                                        PushPopPair {
//                                                          push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                          nested:
//                                                            PushPopPair {
//                                                              push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                              nested:
//                                                                PushPopPair {
//                                                                  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                  nested:
//                                                                    PushPopPair {
//                                                                      push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                      nested:
//                                                                        PushPopPair {
//                                                                          push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                          nested:
//                                                                            PushPopPair {
//                                                                              push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                              nested:
//                                                                                PushPopPair {
//                                                                                  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                  nested:
//                                                                                    PushPopPair {
//                                                                                      push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                      nested:
//                                                                                        PushPopPair {
//                                                                                          push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                          nested:
//                                                                                            PushPopPair {
//                                                                                              push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                              nested:
//                                                                                                PushPopPair {
//                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                  nested:
//                                                                                                    PushPopPair {
//                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                      nested:
//                                                                                                        PushPopPair {
//                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                          nested:
//                                                                                                            PushPopPair {
//                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                              nested:
//                                                                                                                PushPopPair {
//                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                  nested:
//                                                                                                                    PushPopPair {
//                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                      nested:
//                                                                                                                        PushPopPair {
//                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                          nested:
//                                                                                                                            PushPopPair {
//                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                              nested:
//                                                                                                                                PushPopPair {
//                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                  nested:
//                                                                                                                                    PushPopPair {
//                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                      nested:
//                                                                                                                                        PushPopPair {
//                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                          nested:
//                                                                                                                                            PushPopPair {
//                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                              nested:
//                                                                                                                                                PushPopPair {
//                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                  nested:
//                                                                                                                                                    PushPopPair {
//                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                      nested:
//                                                                                                                                                        PushPopPair {
//                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                          nested:
//                                                                                                                                                            PushPopPair {
//                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                              nested:
//                                                                                                                                                                PushPopPair {
//                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                  nested:
//                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                      nested:
//                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                          nested:
//                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                              nested:
//                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                  nested:
//                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                      nested:
//                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                          nested:
//                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                              nested:
//                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=Output.0}
//                                                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                }
//                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                            }
//                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                        }
//                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                    }
//                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                }
//                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                            }
//                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                        }
//                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                    }
//                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                }
//                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                            }
//                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                        }
//                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                    }
//                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                }
//                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                            }
//                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                        }
//                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                    }
//                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                }
//                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                            }
//                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                        }
//                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                    }
//                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                }
//                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                            }
//                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                        }
//                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                    }
//                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                }
//                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                            }
//                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                        }
//                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                    }
//                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                }
//                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                            }
//                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                        }
//                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                    }
//                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                }
//                                                                              pop:  PopInstruction{address=temp 0}
//                                                                            }
//                                                                          pop:  PopInstruction{address=temp 0}
//                                                                        }
//                                                                      pop:  PopInstruction{address=temp 0}
//                                                                    }
//                                                                  pop:  PopInstruction{address=temp 0}
//                                                                }
//                                                              pop:  PopInstruction{address=temp 0}
//                                                            }
//                                                          pop:  PopInstruction{address=temp 0}
//                                                        }
//                                                      pop:  PopInstruction{address=temp 0}
//                                                    }
//                                                  pop:  PopInstruction{address=temp 0}
//                                                }
//                                              pop:  PopInstruction{address=temp 0}
//                                            }
//                                          pop:  PopInstruction{address=temp 0}
//                                        }
//                                      pop:  PopInstruction{address=temp 0}
//                                    }
//                                  pop:  PopInstruction{address=temp 0}
//                                }
//                              pop:  PopInstruction{address=temp 0}
//                            }
//                          pop:  PopInstruction{address=temp 0}
//                        }
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                  pop:  PopInstruction{address=temp 0}
//                }
//              pop:  PopInstruction{address=temp 0}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@127 // 4622
D=A // 4623
@SP // 4624
AM=M+1 // 4625
A=A-1 // 4626
M=D // 4627
// call Array.new
@6 // 4628
D=A // 4629
@14 // 4630
M=D // 4631
@Array.new // 4632
D=A // 4633
@13 // 4634
M=D // 4635
@Output.initMap.ret.0 // 4636
D=A // 4637
@CALL // 4638
0;JMP // 4639
(Output.initMap.ret.0)
@SP // 4640
AM=M-1 // 4641
D=M // 4642
@Output.0 // 4643
M=D // 4644
@SP // 4645
AM=M+1 // 4646
A=A-1 // 4647
M=0 // 4648
@63 // 4649
D=A // 4650
@SP // 4651
AM=M+1 // 4652
A=A-1 // 4653
M=D // 4654
@63 // 4655
D=A // 4656
@SP // 4657
AM=M+1 // 4658
A=A-1 // 4659
M=D // 4660
@63 // 4661
D=A // 4662
@SP // 4663
AM=M+1 // 4664
A=A-1 // 4665
M=D // 4666
@63 // 4667
D=A // 4668
@SP // 4669
AM=M+1 // 4670
A=A-1 // 4671
M=D // 4672
@63 // 4673
D=A // 4674
@SP // 4675
AM=M+1 // 4676
A=A-1 // 4677
M=D // 4678
@63 // 4679
D=A // 4680
@SP // 4681
AM=M+1 // 4682
A=A-1 // 4683
M=D // 4684
@63 // 4685
D=A // 4686
@SP // 4687
AM=M+1 // 4688
A=A-1 // 4689
M=D // 4690
@63 // 4691
D=A // 4692
@SP // 4693
AM=M+1 // 4694
A=A-1 // 4695
M=D // 4696
@63 // 4697
D=A // 4698
@SP // 4699
AM=M+1 // 4700
A=A-1 // 4701
M=D // 4702
@SP // 4703
AM=M+1 // 4704
A=A-1 // 4705
M=0 // 4706
@SP // 4707
AM=M+1 // 4708
A=A-1 // 4709
M=0 // 4710
// call Output.create
@17 // 4711
D=A // 4712
@14 // 4713
M=D // 4714
@Output.create // 4715
D=A // 4716
@13 // 4717
M=D // 4718
@Output.initMap.ret.1 // 4719
D=A // 4720
@CALL // 4721
0;JMP // 4722
(Output.initMap.ret.1)
@SP // 4723
AM=M-1 // 4724
D=M // 4725
@5 // 4726
M=D // 4727
@32 // 4728
D=A // 4729
@SP // 4730
AM=M+1 // 4731
A=A-1 // 4732
M=D // 4733
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=0 // 4737
@SP // 4738
AM=M+1 // 4739
A=A-1 // 4740
M=0 // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=0 // 4745
@SP // 4746
AM=M+1 // 4747
A=A-1 // 4748
M=0 // 4749
@SP // 4750
AM=M+1 // 4751
A=A-1 // 4752
M=0 // 4753
@SP // 4754
AM=M+1 // 4755
A=A-1 // 4756
M=0 // 4757
@SP // 4758
AM=M+1 // 4759
A=A-1 // 4760
M=0 // 4761
@SP // 4762
AM=M+1 // 4763
A=A-1 // 4764
M=0 // 4765
@SP // 4766
AM=M+1 // 4767
A=A-1 // 4768
M=0 // 4769
@SP // 4770
AM=M+1 // 4771
A=A-1 // 4772
M=0 // 4773
@SP // 4774
AM=M+1 // 4775
A=A-1 // 4776
M=0 // 4777
// call Output.create
@17 // 4778
D=A // 4779
@14 // 4780
M=D // 4781
@Output.create // 4782
D=A // 4783
@13 // 4784
M=D // 4785
@Output.initMap.ret.2 // 4786
D=A // 4787
@CALL // 4788
0;JMP // 4789
(Output.initMap.ret.2)
@SP // 4790
AM=M-1 // 4791
D=M // 4792
@5 // 4793
M=D // 4794
@33 // 4795
D=A // 4796
@SP // 4797
AM=M+1 // 4798
A=A-1 // 4799
M=D // 4800
@12 // 4801
D=A // 4802
@SP // 4803
AM=M+1 // 4804
A=A-1 // 4805
M=D // 4806
@30 // 4807
D=A // 4808
@SP // 4809
AM=M+1 // 4810
A=A-1 // 4811
M=D // 4812
@30 // 4813
D=A // 4814
@SP // 4815
AM=M+1 // 4816
A=A-1 // 4817
M=D // 4818
@30 // 4819
D=A // 4820
@SP // 4821
AM=M+1 // 4822
A=A-1 // 4823
M=D // 4824
@12 // 4825
D=A // 4826
@SP // 4827
AM=M+1 // 4828
A=A-1 // 4829
M=D // 4830
@12 // 4831
D=A // 4832
@SP // 4833
AM=M+1 // 4834
A=A-1 // 4835
M=D // 4836
@SP // 4837
AM=M+1 // 4838
A=A-1 // 4839
M=0 // 4840
@12 // 4841
D=A // 4842
@SP // 4843
AM=M+1 // 4844
A=A-1 // 4845
M=D // 4846
@12 // 4847
D=A // 4848
@SP // 4849
AM=M+1 // 4850
A=A-1 // 4851
M=D // 4852
@SP // 4853
AM=M+1 // 4854
A=A-1 // 4855
M=0 // 4856
@SP // 4857
AM=M+1 // 4858
A=A-1 // 4859
M=0 // 4860
// call Output.create
@17 // 4861
D=A // 4862
@14 // 4863
M=D // 4864
@Output.create // 4865
D=A // 4866
@13 // 4867
M=D // 4868
@Output.initMap.ret.3 // 4869
D=A // 4870
@CALL // 4871
0;JMP // 4872
(Output.initMap.ret.3)
@SP // 4873
AM=M-1 // 4874
D=M // 4875
@5 // 4876
M=D // 4877
@34 // 4878
D=A // 4879
@SP // 4880
AM=M+1 // 4881
A=A-1 // 4882
M=D // 4883
@54 // 4884
D=A // 4885
@SP // 4886
AM=M+1 // 4887
A=A-1 // 4888
M=D // 4889
@54 // 4890
D=A // 4891
@SP // 4892
AM=M+1 // 4893
A=A-1 // 4894
M=D // 4895
@20 // 4896
D=A // 4897
@SP // 4898
AM=M+1 // 4899
A=A-1 // 4900
M=D // 4901
@SP // 4902
AM=M+1 // 4903
A=A-1 // 4904
M=0 // 4905
@SP // 4906
AM=M+1 // 4907
A=A-1 // 4908
M=0 // 4909
@SP // 4910
AM=M+1 // 4911
A=A-1 // 4912
M=0 // 4913
@SP // 4914
AM=M+1 // 4915
A=A-1 // 4916
M=0 // 4917
@SP // 4918
AM=M+1 // 4919
A=A-1 // 4920
M=0 // 4921
@SP // 4922
AM=M+1 // 4923
A=A-1 // 4924
M=0 // 4925
@SP // 4926
AM=M+1 // 4927
A=A-1 // 4928
M=0 // 4929
@SP // 4930
AM=M+1 // 4931
A=A-1 // 4932
M=0 // 4933
// call Output.create
@17 // 4934
D=A // 4935
@14 // 4936
M=D // 4937
@Output.create // 4938
D=A // 4939
@13 // 4940
M=D // 4941
@Output.initMap.ret.4 // 4942
D=A // 4943
@CALL // 4944
0;JMP // 4945
(Output.initMap.ret.4)
@SP // 4946
AM=M-1 // 4947
D=M // 4948
@5 // 4949
M=D // 4950
@35 // 4951
D=A // 4952
@SP // 4953
AM=M+1 // 4954
A=A-1 // 4955
M=D // 4956
@SP // 4957
AM=M+1 // 4958
A=A-1 // 4959
M=0 // 4960
@18 // 4961
D=A // 4962
@SP // 4963
AM=M+1 // 4964
A=A-1 // 4965
M=D // 4966
@18 // 4967
D=A // 4968
@SP // 4969
AM=M+1 // 4970
A=A-1 // 4971
M=D // 4972
@63 // 4973
D=A // 4974
@SP // 4975
AM=M+1 // 4976
A=A-1 // 4977
M=D // 4978
@18 // 4979
D=A // 4980
@SP // 4981
AM=M+1 // 4982
A=A-1 // 4983
M=D // 4984
@18 // 4985
D=A // 4986
@SP // 4987
AM=M+1 // 4988
A=A-1 // 4989
M=D // 4990
@63 // 4991
D=A // 4992
@SP // 4993
AM=M+1 // 4994
A=A-1 // 4995
M=D // 4996
@18 // 4997
D=A // 4998
@SP // 4999
AM=M+1 // 5000
A=A-1 // 5001
M=D // 5002
@18 // 5003
D=A // 5004
@SP // 5005
AM=M+1 // 5006
A=A-1 // 5007
M=D // 5008
@SP // 5009
AM=M+1 // 5010
A=A-1 // 5011
M=0 // 5012
@SP // 5013
AM=M+1 // 5014
A=A-1 // 5015
M=0 // 5016
// call Output.create
@17 // 5017
D=A // 5018
@14 // 5019
M=D // 5020
@Output.create // 5021
D=A // 5022
@13 // 5023
M=D // 5024
@Output.initMap.ret.5 // 5025
D=A // 5026
@CALL // 5027
0;JMP // 5028
(Output.initMap.ret.5)
@SP // 5029
AM=M-1 // 5030
D=M // 5031
@5 // 5032
M=D // 5033
@36 // 5034
D=A // 5035
@SP // 5036
AM=M+1 // 5037
A=A-1 // 5038
M=D // 5039
@12 // 5040
D=A // 5041
@SP // 5042
AM=M+1 // 5043
A=A-1 // 5044
M=D // 5045
@30 // 5046
D=A // 5047
@SP // 5048
AM=M+1 // 5049
A=A-1 // 5050
M=D // 5051
@51 // 5052
D=A // 5053
@SP // 5054
AM=M+1 // 5055
A=A-1 // 5056
M=D // 5057
@3 // 5058
D=A // 5059
@SP // 5060
AM=M+1 // 5061
A=A-1 // 5062
M=D // 5063
@30 // 5064
D=A // 5065
@SP // 5066
AM=M+1 // 5067
A=A-1 // 5068
M=D // 5069
@48 // 5070
D=A // 5071
@SP // 5072
AM=M+1 // 5073
A=A-1 // 5074
M=D // 5075
@51 // 5076
D=A // 5077
@SP // 5078
AM=M+1 // 5079
A=A-1 // 5080
M=D // 5081
@30 // 5082
D=A // 5083
@SP // 5084
AM=M+1 // 5085
A=A-1 // 5086
M=D // 5087
@12 // 5088
D=A // 5089
@SP // 5090
AM=M+1 // 5091
A=A-1 // 5092
M=D // 5093
@12 // 5094
D=A // 5095
@SP // 5096
AM=M+1 // 5097
A=A-1 // 5098
M=D // 5099
@SP // 5100
AM=M+1 // 5101
A=A-1 // 5102
M=0 // 5103
// call Output.create
@17 // 5104
D=A // 5105
@14 // 5106
M=D // 5107
@Output.create // 5108
D=A // 5109
@13 // 5110
M=D // 5111
@Output.initMap.ret.6 // 5112
D=A // 5113
@CALL // 5114
0;JMP // 5115
(Output.initMap.ret.6)
@SP // 5116
AM=M-1 // 5117
D=M // 5118
@5 // 5119
M=D // 5120
@37 // 5121
D=A // 5122
@SP // 5123
AM=M+1 // 5124
A=A-1 // 5125
M=D // 5126
@SP // 5127
AM=M+1 // 5128
A=A-1 // 5129
M=0 // 5130
@SP // 5131
AM=M+1 // 5132
A=A-1 // 5133
M=0 // 5134
@35 // 5135
D=A // 5136
@SP // 5137
AM=M+1 // 5138
A=A-1 // 5139
M=D // 5140
@51 // 5141
D=A // 5142
@SP // 5143
AM=M+1 // 5144
A=A-1 // 5145
M=D // 5146
@24 // 5147
D=A // 5148
@SP // 5149
AM=M+1 // 5150
A=A-1 // 5151
M=D // 5152
@12 // 5153
D=A // 5154
@SP // 5155
AM=M+1 // 5156
A=A-1 // 5157
M=D // 5158
@6 // 5159
D=A // 5160
@SP // 5161
AM=M+1 // 5162
A=A-1 // 5163
M=D // 5164
@51 // 5165
D=A // 5166
@SP // 5167
AM=M+1 // 5168
A=A-1 // 5169
M=D // 5170
@49 // 5171
D=A // 5172
@SP // 5173
AM=M+1 // 5174
A=A-1 // 5175
M=D // 5176
@SP // 5177
AM=M+1 // 5178
A=A-1 // 5179
M=0 // 5180
@SP // 5181
AM=M+1 // 5182
A=A-1 // 5183
M=0 // 5184
// call Output.create
@17 // 5185
D=A // 5186
@14 // 5187
M=D // 5188
@Output.create // 5189
D=A // 5190
@13 // 5191
M=D // 5192
@Output.initMap.ret.7 // 5193
D=A // 5194
@CALL // 5195
0;JMP // 5196
(Output.initMap.ret.7)
@SP // 5197
AM=M-1 // 5198
D=M // 5199
@5 // 5200
M=D // 5201
@38 // 5202
D=A // 5203
@SP // 5204
AM=M+1 // 5205
A=A-1 // 5206
M=D // 5207
@12 // 5208
D=A // 5209
@SP // 5210
AM=M+1 // 5211
A=A-1 // 5212
M=D // 5213
@30 // 5214
D=A // 5215
@SP // 5216
AM=M+1 // 5217
A=A-1 // 5218
M=D // 5219
@30 // 5220
D=A // 5221
@SP // 5222
AM=M+1 // 5223
A=A-1 // 5224
M=D // 5225
@12 // 5226
D=A // 5227
@SP // 5228
AM=M+1 // 5229
A=A-1 // 5230
M=D // 5231
@54 // 5232
D=A // 5233
@SP // 5234
AM=M+1 // 5235
A=A-1 // 5236
M=D // 5237
@27 // 5238
D=A // 5239
@SP // 5240
AM=M+1 // 5241
A=A-1 // 5242
M=D // 5243
@27 // 5244
D=A // 5245
@SP // 5246
AM=M+1 // 5247
A=A-1 // 5248
M=D // 5249
@27 // 5250
D=A // 5251
@SP // 5252
AM=M+1 // 5253
A=A-1 // 5254
M=D // 5255
@54 // 5256
D=A // 5257
@SP // 5258
AM=M+1 // 5259
A=A-1 // 5260
M=D // 5261
@SP // 5262
AM=M+1 // 5263
A=A-1 // 5264
M=0 // 5265
@SP // 5266
AM=M+1 // 5267
A=A-1 // 5268
M=0 // 5269
// call Output.create
@17 // 5270
D=A // 5271
@14 // 5272
M=D // 5273
@Output.create // 5274
D=A // 5275
@13 // 5276
M=D // 5277
@Output.initMap.ret.8 // 5278
D=A // 5279
@CALL // 5280
0;JMP // 5281
(Output.initMap.ret.8)
@SP // 5282
AM=M-1 // 5283
D=M // 5284
@5 // 5285
M=D // 5286
@39 // 5287
D=A // 5288
@SP // 5289
AM=M+1 // 5290
A=A-1 // 5291
M=D // 5292
@12 // 5293
D=A // 5294
@SP // 5295
AM=M+1 // 5296
A=A-1 // 5297
M=D // 5298
@12 // 5299
D=A // 5300
@SP // 5301
AM=M+1 // 5302
A=A-1 // 5303
M=D // 5304
@6 // 5305
D=A // 5306
@SP // 5307
AM=M+1 // 5308
A=A-1 // 5309
M=D // 5310
@SP // 5311
AM=M+1 // 5312
A=A-1 // 5313
M=0 // 5314
@SP // 5315
AM=M+1 // 5316
A=A-1 // 5317
M=0 // 5318
@SP // 5319
AM=M+1 // 5320
A=A-1 // 5321
M=0 // 5322
@SP // 5323
AM=M+1 // 5324
A=A-1 // 5325
M=0 // 5326
@SP // 5327
AM=M+1 // 5328
A=A-1 // 5329
M=0 // 5330
@SP // 5331
AM=M+1 // 5332
A=A-1 // 5333
M=0 // 5334
@SP // 5335
AM=M+1 // 5336
A=A-1 // 5337
M=0 // 5338
@SP // 5339
AM=M+1 // 5340
A=A-1 // 5341
M=0 // 5342
// call Output.create
@17 // 5343
D=A // 5344
@14 // 5345
M=D // 5346
@Output.create // 5347
D=A // 5348
@13 // 5349
M=D // 5350
@Output.initMap.ret.9 // 5351
D=A // 5352
@CALL // 5353
0;JMP // 5354
(Output.initMap.ret.9)
@SP // 5355
AM=M-1 // 5356
D=M // 5357
@5 // 5358
M=D // 5359
@40 // 5360
D=A // 5361
@SP // 5362
AM=M+1 // 5363
A=A-1 // 5364
M=D // 5365
@24 // 5366
D=A // 5367
@SP // 5368
AM=M+1 // 5369
A=A-1 // 5370
M=D // 5371
@12 // 5372
D=A // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377
@6 // 5378
D=A // 5379
@SP // 5380
AM=M+1 // 5381
A=A-1 // 5382
M=D // 5383
@6 // 5384
D=A // 5385
@SP // 5386
AM=M+1 // 5387
A=A-1 // 5388
M=D // 5389
@6 // 5390
D=A // 5391
@SP // 5392
AM=M+1 // 5393
A=A-1 // 5394
M=D // 5395
@6 // 5396
D=A // 5397
@SP // 5398
AM=M+1 // 5399
A=A-1 // 5400
M=D // 5401
@6 // 5402
D=A // 5403
@SP // 5404
AM=M+1 // 5405
A=A-1 // 5406
M=D // 5407
@12 // 5408
D=A // 5409
@SP // 5410
AM=M+1 // 5411
A=A-1 // 5412
M=D // 5413
@24 // 5414
D=A // 5415
@SP // 5416
AM=M+1 // 5417
A=A-1 // 5418
M=D // 5419
@SP // 5420
AM=M+1 // 5421
A=A-1 // 5422
M=0 // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=0 // 5427
// call Output.create
@17 // 5428
D=A // 5429
@14 // 5430
M=D // 5431
@Output.create // 5432
D=A // 5433
@13 // 5434
M=D // 5435
@Output.initMap.ret.10 // 5436
D=A // 5437
@CALL // 5438
0;JMP // 5439
(Output.initMap.ret.10)
@SP // 5440
AM=M-1 // 5441
D=M // 5442
@5 // 5443
M=D // 5444
@41 // 5445
D=A // 5446
@SP // 5447
AM=M+1 // 5448
A=A-1 // 5449
M=D // 5450
@6 // 5451
D=A // 5452
@SP // 5453
AM=M+1 // 5454
A=A-1 // 5455
M=D // 5456
@12 // 5457
D=A // 5458
@SP // 5459
AM=M+1 // 5460
A=A-1 // 5461
M=D // 5462
@24 // 5463
D=A // 5464
@SP // 5465
AM=M+1 // 5466
A=A-1 // 5467
M=D // 5468
@24 // 5469
D=A // 5470
@SP // 5471
AM=M+1 // 5472
A=A-1 // 5473
M=D // 5474
@24 // 5475
D=A // 5476
@SP // 5477
AM=M+1 // 5478
A=A-1 // 5479
M=D // 5480
@24 // 5481
D=A // 5482
@SP // 5483
AM=M+1 // 5484
A=A-1 // 5485
M=D // 5486
@24 // 5487
D=A // 5488
@SP // 5489
AM=M+1 // 5490
A=A-1 // 5491
M=D // 5492
@12 // 5493
D=A // 5494
@SP // 5495
AM=M+1 // 5496
A=A-1 // 5497
M=D // 5498
@6 // 5499
D=A // 5500
@SP // 5501
AM=M+1 // 5502
A=A-1 // 5503
M=D // 5504
@SP // 5505
AM=M+1 // 5506
A=A-1 // 5507
M=0 // 5508
@SP // 5509
AM=M+1 // 5510
A=A-1 // 5511
M=0 // 5512
// call Output.create
@17 // 5513
D=A // 5514
@14 // 5515
M=D // 5516
@Output.create // 5517
D=A // 5518
@13 // 5519
M=D // 5520
@Output.initMap.ret.11 // 5521
D=A // 5522
@CALL // 5523
0;JMP // 5524
(Output.initMap.ret.11)
@SP // 5525
AM=M-1 // 5526
D=M // 5527
@5 // 5528
M=D // 5529
@42 // 5530
D=A // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=D // 5535
@SP // 5536
AM=M+1 // 5537
A=A-1 // 5538
M=0 // 5539
@SP // 5540
AM=M+1 // 5541
A=A-1 // 5542
M=0 // 5543
@SP // 5544
AM=M+1 // 5545
A=A-1 // 5546
M=0 // 5547
@51 // 5548
D=A // 5549
@SP // 5550
AM=M+1 // 5551
A=A-1 // 5552
M=D // 5553
@30 // 5554
D=A // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=D // 5559
@63 // 5560
D=A // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=D // 5565
@30 // 5566
D=A // 5567
@SP // 5568
AM=M+1 // 5569
A=A-1 // 5570
M=D // 5571
@51 // 5572
D=A // 5573
@SP // 5574
AM=M+1 // 5575
A=A-1 // 5576
M=D // 5577
@SP // 5578
AM=M+1 // 5579
A=A-1 // 5580
M=0 // 5581
@SP // 5582
AM=M+1 // 5583
A=A-1 // 5584
M=0 // 5585
@SP // 5586
AM=M+1 // 5587
A=A-1 // 5588
M=0 // 5589
// call Output.create
@17 // 5590
D=A // 5591
@14 // 5592
M=D // 5593
@Output.create // 5594
D=A // 5595
@13 // 5596
M=D // 5597
@Output.initMap.ret.12 // 5598
D=A // 5599
@CALL // 5600
0;JMP // 5601
(Output.initMap.ret.12)
@SP // 5602
AM=M-1 // 5603
D=M // 5604
@5 // 5605
M=D // 5606
@43 // 5607
D=A // 5608
@SP // 5609
AM=M+1 // 5610
A=A-1 // 5611
M=D // 5612
@SP // 5613
AM=M+1 // 5614
A=A-1 // 5615
M=0 // 5616
@SP // 5617
AM=M+1 // 5618
A=A-1 // 5619
M=0 // 5620
@SP // 5621
AM=M+1 // 5622
A=A-1 // 5623
M=0 // 5624
@12 // 5625
D=A // 5626
@SP // 5627
AM=M+1 // 5628
A=A-1 // 5629
M=D // 5630
@12 // 5631
D=A // 5632
@SP // 5633
AM=M+1 // 5634
A=A-1 // 5635
M=D // 5636
@63 // 5637
D=A // 5638
@SP // 5639
AM=M+1 // 5640
A=A-1 // 5641
M=D // 5642
@12 // 5643
D=A // 5644
@SP // 5645
AM=M+1 // 5646
A=A-1 // 5647
M=D // 5648
@12 // 5649
D=A // 5650
@SP // 5651
AM=M+1 // 5652
A=A-1 // 5653
M=D // 5654
@SP // 5655
AM=M+1 // 5656
A=A-1 // 5657
M=0 // 5658
@SP // 5659
AM=M+1 // 5660
A=A-1 // 5661
M=0 // 5662
@SP // 5663
AM=M+1 // 5664
A=A-1 // 5665
M=0 // 5666
// call Output.create
@17 // 5667
D=A // 5668
@14 // 5669
M=D // 5670
@Output.create // 5671
D=A // 5672
@13 // 5673
M=D // 5674
@Output.initMap.ret.13 // 5675
D=A // 5676
@CALL // 5677
0;JMP // 5678
(Output.initMap.ret.13)
@SP // 5679
AM=M-1 // 5680
D=M // 5681
@5 // 5682
M=D // 5683
@44 // 5684
D=A // 5685
@SP // 5686
AM=M+1 // 5687
A=A-1 // 5688
M=D // 5689
@SP // 5690
AM=M+1 // 5691
A=A-1 // 5692
M=0 // 5693
@SP // 5694
AM=M+1 // 5695
A=A-1 // 5696
M=0 // 5697
@SP // 5698
AM=M+1 // 5699
A=A-1 // 5700
M=0 // 5701
@SP // 5702
AM=M+1 // 5703
A=A-1 // 5704
M=0 // 5705
@SP // 5706
AM=M+1 // 5707
A=A-1 // 5708
M=0 // 5709
@SP // 5710
AM=M+1 // 5711
A=A-1 // 5712
M=0 // 5713
@SP // 5714
AM=M+1 // 5715
A=A-1 // 5716
M=0 // 5717
@12 // 5718
D=A // 5719
@SP // 5720
AM=M+1 // 5721
A=A-1 // 5722
M=D // 5723
@12 // 5724
D=A // 5725
@SP // 5726
AM=M+1 // 5727
A=A-1 // 5728
M=D // 5729
@6 // 5730
D=A // 5731
@SP // 5732
AM=M+1 // 5733
A=A-1 // 5734
M=D // 5735
@SP // 5736
AM=M+1 // 5737
A=A-1 // 5738
M=0 // 5739
// call Output.create
@17 // 5740
D=A // 5741
@14 // 5742
M=D // 5743
@Output.create // 5744
D=A // 5745
@13 // 5746
M=D // 5747
@Output.initMap.ret.14 // 5748
D=A // 5749
@CALL // 5750
0;JMP // 5751
(Output.initMap.ret.14)
@SP // 5752
AM=M-1 // 5753
D=M // 5754
@5 // 5755
M=D // 5756
@45 // 5757
D=A // 5758
@SP // 5759
AM=M+1 // 5760
A=A-1 // 5761
M=D // 5762
@SP // 5763
AM=M+1 // 5764
A=A-1 // 5765
M=0 // 5766
@SP // 5767
AM=M+1 // 5768
A=A-1 // 5769
M=0 // 5770
@SP // 5771
AM=M+1 // 5772
A=A-1 // 5773
M=0 // 5774
@SP // 5775
AM=M+1 // 5776
A=A-1 // 5777
M=0 // 5778
@SP // 5779
AM=M+1 // 5780
A=A-1 // 5781
M=0 // 5782
@63 // 5783
D=A // 5784
@SP // 5785
AM=M+1 // 5786
A=A-1 // 5787
M=D // 5788
@SP // 5789
AM=M+1 // 5790
A=A-1 // 5791
M=0 // 5792
@SP // 5793
AM=M+1 // 5794
A=A-1 // 5795
M=0 // 5796
@SP // 5797
AM=M+1 // 5798
A=A-1 // 5799
M=0 // 5800
@SP // 5801
AM=M+1 // 5802
A=A-1 // 5803
M=0 // 5804
@SP // 5805
AM=M+1 // 5806
A=A-1 // 5807
M=0 // 5808
// call Output.create
@17 // 5809
D=A // 5810
@14 // 5811
M=D // 5812
@Output.create // 5813
D=A // 5814
@13 // 5815
M=D // 5816
@Output.initMap.ret.15 // 5817
D=A // 5818
@CALL // 5819
0;JMP // 5820
(Output.initMap.ret.15)
@SP // 5821
AM=M-1 // 5822
D=M // 5823
@5 // 5824
M=D // 5825
@46 // 5826
D=A // 5827
@SP // 5828
AM=M+1 // 5829
A=A-1 // 5830
M=D // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=0 // 5835
@SP // 5836
AM=M+1 // 5837
A=A-1 // 5838
M=0 // 5839
@SP // 5840
AM=M+1 // 5841
A=A-1 // 5842
M=0 // 5843
@SP // 5844
AM=M+1 // 5845
A=A-1 // 5846
M=0 // 5847
@SP // 5848
AM=M+1 // 5849
A=A-1 // 5850
M=0 // 5851
@SP // 5852
AM=M+1 // 5853
A=A-1 // 5854
M=0 // 5855
@SP // 5856
AM=M+1 // 5857
A=A-1 // 5858
M=0 // 5859
@12 // 5860
D=A // 5861
@SP // 5862
AM=M+1 // 5863
A=A-1 // 5864
M=D // 5865
@12 // 5866
D=A // 5867
@SP // 5868
AM=M+1 // 5869
A=A-1 // 5870
M=D // 5871
@SP // 5872
AM=M+1 // 5873
A=A-1 // 5874
M=0 // 5875
@SP // 5876
AM=M+1 // 5877
A=A-1 // 5878
M=0 // 5879
// call Output.create
@17 // 5880
D=A // 5881
@14 // 5882
M=D // 5883
@Output.create // 5884
D=A // 5885
@13 // 5886
M=D // 5887
@Output.initMap.ret.16 // 5888
D=A // 5889
@CALL // 5890
0;JMP // 5891
(Output.initMap.ret.16)
@SP // 5892
AM=M-1 // 5893
D=M // 5894
@5 // 5895
M=D // 5896
@47 // 5897
D=A // 5898
@SP // 5899
AM=M+1 // 5900
A=A-1 // 5901
M=D // 5902
@SP // 5903
AM=M+1 // 5904
A=A-1 // 5905
M=0 // 5906
@SP // 5907
AM=M+1 // 5908
A=A-1 // 5909
M=0 // 5910
@32 // 5911
D=A // 5912
@SP // 5913
AM=M+1 // 5914
A=A-1 // 5915
M=D // 5916
@48 // 5917
D=A // 5918
@SP // 5919
AM=M+1 // 5920
A=A-1 // 5921
M=D // 5922
@24 // 5923
D=A // 5924
@SP // 5925
AM=M+1 // 5926
A=A-1 // 5927
M=D // 5928
@12 // 5929
D=A // 5930
@SP // 5931
AM=M+1 // 5932
A=A-1 // 5933
M=D // 5934
@6 // 5935
D=A // 5936
@SP // 5937
AM=M+1 // 5938
A=A-1 // 5939
M=D // 5940
@3 // 5941
D=A // 5942
@SP // 5943
AM=M+1 // 5944
A=A-1 // 5945
M=D // 5946
@SP // 5947
AM=M+1 // 5948
A=A-1 // 5949
M=1 // 5950
@SP // 5951
AM=M+1 // 5952
A=A-1 // 5953
M=0 // 5954
@SP // 5955
AM=M+1 // 5956
A=A-1 // 5957
M=0 // 5958
// call Output.create
@17 // 5959
D=A // 5960
@14 // 5961
M=D // 5962
@Output.create // 5963
D=A // 5964
@13 // 5965
M=D // 5966
@Output.initMap.ret.17 // 5967
D=A // 5968
@CALL // 5969
0;JMP // 5970
(Output.initMap.ret.17)
@SP // 5971
AM=M-1 // 5972
D=M // 5973
@5 // 5974
M=D // 5975
@48 // 5976
D=A // 5977
@SP // 5978
AM=M+1 // 5979
A=A-1 // 5980
M=D // 5981
@12 // 5982
D=A // 5983
@SP // 5984
AM=M+1 // 5985
A=A-1 // 5986
M=D // 5987
@30 // 5988
D=A // 5989
@SP // 5990
AM=M+1 // 5991
A=A-1 // 5992
M=D // 5993
@51 // 5994
D=A // 5995
@SP // 5996
AM=M+1 // 5997
A=A-1 // 5998
M=D // 5999
@51 // 6000
D=A // 6001
@SP // 6002
AM=M+1 // 6003
A=A-1 // 6004
M=D // 6005
@51 // 6006
D=A // 6007
@SP // 6008
AM=M+1 // 6009
A=A-1 // 6010
M=D // 6011
@51 // 6012
D=A // 6013
@SP // 6014
AM=M+1 // 6015
A=A-1 // 6016
M=D // 6017
@51 // 6018
D=A // 6019
@SP // 6020
AM=M+1 // 6021
A=A-1 // 6022
M=D // 6023
@30 // 6024
D=A // 6025
@SP // 6026
AM=M+1 // 6027
A=A-1 // 6028
M=D // 6029
@12 // 6030
D=A // 6031
@SP // 6032
AM=M+1 // 6033
A=A-1 // 6034
M=D // 6035
@SP // 6036
AM=M+1 // 6037
A=A-1 // 6038
M=0 // 6039
@SP // 6040
AM=M+1 // 6041
A=A-1 // 6042
M=0 // 6043
// call Output.create
@17 // 6044
D=A // 6045
@14 // 6046
M=D // 6047
@Output.create // 6048
D=A // 6049
@13 // 6050
M=D // 6051
@Output.initMap.ret.18 // 6052
D=A // 6053
@CALL // 6054
0;JMP // 6055
(Output.initMap.ret.18)
@SP // 6056
AM=M-1 // 6057
D=M // 6058
@5 // 6059
M=D // 6060
@49 // 6061
D=A // 6062
@SP // 6063
AM=M+1 // 6064
A=A-1 // 6065
M=D // 6066
@12 // 6067
D=A // 6068
@SP // 6069
AM=M+1 // 6070
A=A-1 // 6071
M=D // 6072
@14 // 6073
D=A // 6074
@SP // 6075
AM=M+1 // 6076
A=A-1 // 6077
M=D // 6078
@15 // 6079
D=A // 6080
@SP // 6081
AM=M+1 // 6082
A=A-1 // 6083
M=D // 6084
@12 // 6085
D=A // 6086
@SP // 6087
AM=M+1 // 6088
A=A-1 // 6089
M=D // 6090
@12 // 6091
D=A // 6092
@SP // 6093
AM=M+1 // 6094
A=A-1 // 6095
M=D // 6096
@12 // 6097
D=A // 6098
@SP // 6099
AM=M+1 // 6100
A=A-1 // 6101
M=D // 6102
@12 // 6103
D=A // 6104
@SP // 6105
AM=M+1 // 6106
A=A-1 // 6107
M=D // 6108
@12 // 6109
D=A // 6110
@SP // 6111
AM=M+1 // 6112
A=A-1 // 6113
M=D // 6114
@63 // 6115
D=A // 6116
@SP // 6117
AM=M+1 // 6118
A=A-1 // 6119
M=D // 6120
@SP // 6121
AM=M+1 // 6122
A=A-1 // 6123
M=0 // 6124
@SP // 6125
AM=M+1 // 6126
A=A-1 // 6127
M=0 // 6128
// call Output.create
@17 // 6129
D=A // 6130
@14 // 6131
M=D // 6132
@Output.create // 6133
D=A // 6134
@13 // 6135
M=D // 6136
@Output.initMap.ret.19 // 6137
D=A // 6138
@CALL // 6139
0;JMP // 6140
(Output.initMap.ret.19)
@SP // 6141
AM=M-1 // 6142
D=M // 6143
@5 // 6144
M=D // 6145
@50 // 6146
D=A // 6147
@SP // 6148
AM=M+1 // 6149
A=A-1 // 6150
M=D // 6151
@30 // 6152
D=A // 6153
@SP // 6154
AM=M+1 // 6155
A=A-1 // 6156
M=D // 6157
@51 // 6158
D=A // 6159
@SP // 6160
AM=M+1 // 6161
A=A-1 // 6162
M=D // 6163
@48 // 6164
D=A // 6165
@SP // 6166
AM=M+1 // 6167
A=A-1 // 6168
M=D // 6169
@24 // 6170
D=A // 6171
@SP // 6172
AM=M+1 // 6173
A=A-1 // 6174
M=D // 6175
@12 // 6176
D=A // 6177
@SP // 6178
AM=M+1 // 6179
A=A-1 // 6180
M=D // 6181
@6 // 6182
D=A // 6183
@SP // 6184
AM=M+1 // 6185
A=A-1 // 6186
M=D // 6187
@3 // 6188
D=A // 6189
@SP // 6190
AM=M+1 // 6191
A=A-1 // 6192
M=D // 6193
@51 // 6194
D=A // 6195
@SP // 6196
AM=M+1 // 6197
A=A-1 // 6198
M=D // 6199
@63 // 6200
D=A // 6201
@SP // 6202
AM=M+1 // 6203
A=A-1 // 6204
M=D // 6205
@SP // 6206
AM=M+1 // 6207
A=A-1 // 6208
M=0 // 6209
@SP // 6210
AM=M+1 // 6211
A=A-1 // 6212
M=0 // 6213
// call Output.create
@17 // 6214
D=A // 6215
@14 // 6216
M=D // 6217
@Output.create // 6218
D=A // 6219
@13 // 6220
M=D // 6221
@Output.initMap.ret.20 // 6222
D=A // 6223
@CALL // 6224
0;JMP // 6225
(Output.initMap.ret.20)
@SP // 6226
AM=M-1 // 6227
D=M // 6228
@5 // 6229
M=D // 6230
@51 // 6231
D=A // 6232
@SP // 6233
AM=M+1 // 6234
A=A-1 // 6235
M=D // 6236
@30 // 6237
D=A // 6238
@SP // 6239
AM=M+1 // 6240
A=A-1 // 6241
M=D // 6242
@51 // 6243
D=A // 6244
@SP // 6245
AM=M+1 // 6246
A=A-1 // 6247
M=D // 6248
@48 // 6249
D=A // 6250
@SP // 6251
AM=M+1 // 6252
A=A-1 // 6253
M=D // 6254
@48 // 6255
D=A // 6256
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=D // 6260
@28 // 6261
D=A // 6262
@SP // 6263
AM=M+1 // 6264
A=A-1 // 6265
M=D // 6266
@48 // 6267
D=A // 6268
@SP // 6269
AM=M+1 // 6270
A=A-1 // 6271
M=D // 6272
@48 // 6273
D=A // 6274
@SP // 6275
AM=M+1 // 6276
A=A-1 // 6277
M=D // 6278
@51 // 6279
D=A // 6280
@SP // 6281
AM=M+1 // 6282
A=A-1 // 6283
M=D // 6284
@30 // 6285
D=A // 6286
@SP // 6287
AM=M+1 // 6288
A=A-1 // 6289
M=D // 6290
@SP // 6291
AM=M+1 // 6292
A=A-1 // 6293
M=0 // 6294
@SP // 6295
AM=M+1 // 6296
A=A-1 // 6297
M=0 // 6298
// call Output.create
@17 // 6299
D=A // 6300
@14 // 6301
M=D // 6302
@Output.create // 6303
D=A // 6304
@13 // 6305
M=D // 6306
@Output.initMap.ret.21 // 6307
D=A // 6308
@CALL // 6309
0;JMP // 6310
(Output.initMap.ret.21)
@SP // 6311
AM=M-1 // 6312
D=M // 6313
@5 // 6314
M=D // 6315
@52 // 6316
D=A // 6317
@SP // 6318
AM=M+1 // 6319
A=A-1 // 6320
M=D // 6321
@16 // 6322
D=A // 6323
@SP // 6324
AM=M+1 // 6325
A=A-1 // 6326
M=D // 6327
@24 // 6328
D=A // 6329
@SP // 6330
AM=M+1 // 6331
A=A-1 // 6332
M=D // 6333
@28 // 6334
D=A // 6335
@SP // 6336
AM=M+1 // 6337
A=A-1 // 6338
M=D // 6339
@26 // 6340
D=A // 6341
@SP // 6342
AM=M+1 // 6343
A=A-1 // 6344
M=D // 6345
@25 // 6346
D=A // 6347
@SP // 6348
AM=M+1 // 6349
A=A-1 // 6350
M=D // 6351
@63 // 6352
D=A // 6353
@SP // 6354
AM=M+1 // 6355
A=A-1 // 6356
M=D // 6357
@24 // 6358
D=A // 6359
@SP // 6360
AM=M+1 // 6361
A=A-1 // 6362
M=D // 6363
@24 // 6364
D=A // 6365
@SP // 6366
AM=M+1 // 6367
A=A-1 // 6368
M=D // 6369
@60 // 6370
D=A // 6371
@SP // 6372
AM=M+1 // 6373
A=A-1 // 6374
M=D // 6375
@SP // 6376
AM=M+1 // 6377
A=A-1 // 6378
M=0 // 6379
@SP // 6380
AM=M+1 // 6381
A=A-1 // 6382
M=0 // 6383
// call Output.create
@17 // 6384
D=A // 6385
@14 // 6386
M=D // 6387
@Output.create // 6388
D=A // 6389
@13 // 6390
M=D // 6391
@Output.initMap.ret.22 // 6392
D=A // 6393
@CALL // 6394
0;JMP // 6395
(Output.initMap.ret.22)
@SP // 6396
AM=M-1 // 6397
D=M // 6398
@5 // 6399
M=D // 6400
@53 // 6401
D=A // 6402
@SP // 6403
AM=M+1 // 6404
A=A-1 // 6405
M=D // 6406
@63 // 6407
D=A // 6408
@SP // 6409
AM=M+1 // 6410
A=A-1 // 6411
M=D // 6412
@3 // 6413
D=A // 6414
@SP // 6415
AM=M+1 // 6416
A=A-1 // 6417
M=D // 6418
@3 // 6419
D=A // 6420
@SP // 6421
AM=M+1 // 6422
A=A-1 // 6423
M=D // 6424
@31 // 6425
D=A // 6426
@SP // 6427
AM=M+1 // 6428
A=A-1 // 6429
M=D // 6430
@48 // 6431
D=A // 6432
@SP // 6433
AM=M+1 // 6434
A=A-1 // 6435
M=D // 6436
@48 // 6437
D=A // 6438
@SP // 6439
AM=M+1 // 6440
A=A-1 // 6441
M=D // 6442
@48 // 6443
D=A // 6444
@SP // 6445
AM=M+1 // 6446
A=A-1 // 6447
M=D // 6448
@51 // 6449
D=A // 6450
@SP // 6451
AM=M+1 // 6452
A=A-1 // 6453
M=D // 6454
@30 // 6455
D=A // 6456
@SP // 6457
AM=M+1 // 6458
A=A-1 // 6459
M=D // 6460
@SP // 6461
AM=M+1 // 6462
A=A-1 // 6463
M=0 // 6464
@SP // 6465
AM=M+1 // 6466
A=A-1 // 6467
M=0 // 6468
// call Output.create
@17 // 6469
D=A // 6470
@14 // 6471
M=D // 6472
@Output.create // 6473
D=A // 6474
@13 // 6475
M=D // 6476
@Output.initMap.ret.23 // 6477
D=A // 6478
@CALL // 6479
0;JMP // 6480
(Output.initMap.ret.23)
@SP // 6481
AM=M-1 // 6482
D=M // 6483
@5 // 6484
M=D // 6485
@54 // 6486
D=A // 6487
@SP // 6488
AM=M+1 // 6489
A=A-1 // 6490
M=D // 6491
@28 // 6492
D=A // 6493
@SP // 6494
AM=M+1 // 6495
A=A-1 // 6496
M=D // 6497
@6 // 6498
D=A // 6499
@SP // 6500
AM=M+1 // 6501
A=A-1 // 6502
M=D // 6503
@3 // 6504
D=A // 6505
@SP // 6506
AM=M+1 // 6507
A=A-1 // 6508
M=D // 6509
@3 // 6510
D=A // 6511
@SP // 6512
AM=M+1 // 6513
A=A-1 // 6514
M=D // 6515
@31 // 6516
D=A // 6517
@SP // 6518
AM=M+1 // 6519
A=A-1 // 6520
M=D // 6521
@51 // 6522
D=A // 6523
@SP // 6524
AM=M+1 // 6525
A=A-1 // 6526
M=D // 6527
@51 // 6528
D=A // 6529
@SP // 6530
AM=M+1 // 6531
A=A-1 // 6532
M=D // 6533
@51 // 6534
D=A // 6535
@SP // 6536
AM=M+1 // 6537
A=A-1 // 6538
M=D // 6539
@30 // 6540
D=A // 6541
@SP // 6542
AM=M+1 // 6543
A=A-1 // 6544
M=D // 6545
@SP // 6546
AM=M+1 // 6547
A=A-1 // 6548
M=0 // 6549
@SP // 6550
AM=M+1 // 6551
A=A-1 // 6552
M=0 // 6553
// call Output.create
@17 // 6554
D=A // 6555
@14 // 6556
M=D // 6557
@Output.create // 6558
D=A // 6559
@13 // 6560
M=D // 6561
@Output.initMap.ret.24 // 6562
D=A // 6563
@CALL // 6564
0;JMP // 6565
(Output.initMap.ret.24)
@SP // 6566
AM=M-1 // 6567
D=M // 6568
@5 // 6569
M=D // 6570
@55 // 6571
D=A // 6572
@SP // 6573
AM=M+1 // 6574
A=A-1 // 6575
M=D // 6576
@63 // 6577
D=A // 6578
@SP // 6579
AM=M+1 // 6580
A=A-1 // 6581
M=D // 6582
@49 // 6583
D=A // 6584
@SP // 6585
AM=M+1 // 6586
A=A-1 // 6587
M=D // 6588
@48 // 6589
D=A // 6590
@SP // 6591
AM=M+1 // 6592
A=A-1 // 6593
M=D // 6594
@48 // 6595
D=A // 6596
@SP // 6597
AM=M+1 // 6598
A=A-1 // 6599
M=D // 6600
@24 // 6601
D=A // 6602
@SP // 6603
AM=M+1 // 6604
A=A-1 // 6605
M=D // 6606
@12 // 6607
D=A // 6608
@SP // 6609
AM=M+1 // 6610
A=A-1 // 6611
M=D // 6612
@12 // 6613
D=A // 6614
@SP // 6615
AM=M+1 // 6616
A=A-1 // 6617
M=D // 6618
@12 // 6619
D=A // 6620
@SP // 6621
AM=M+1 // 6622
A=A-1 // 6623
M=D // 6624
@12 // 6625
D=A // 6626
@SP // 6627
AM=M+1 // 6628
A=A-1 // 6629
M=D // 6630
@SP // 6631
AM=M+1 // 6632
A=A-1 // 6633
M=0 // 6634
@SP // 6635
AM=M+1 // 6636
A=A-1 // 6637
M=0 // 6638
// call Output.create
@17 // 6639
D=A // 6640
@14 // 6641
M=D // 6642
@Output.create // 6643
D=A // 6644
@13 // 6645
M=D // 6646
@Output.initMap.ret.25 // 6647
D=A // 6648
@CALL // 6649
0;JMP // 6650
(Output.initMap.ret.25)
@SP // 6651
AM=M-1 // 6652
D=M // 6653
@5 // 6654
M=D // 6655
@56 // 6656
D=A // 6657
@SP // 6658
AM=M+1 // 6659
A=A-1 // 6660
M=D // 6661
@30 // 6662
D=A // 6663
@SP // 6664
AM=M+1 // 6665
A=A-1 // 6666
M=D // 6667
@51 // 6668
D=A // 6669
@SP // 6670
AM=M+1 // 6671
A=A-1 // 6672
M=D // 6673
@51 // 6674
D=A // 6675
@SP // 6676
AM=M+1 // 6677
A=A-1 // 6678
M=D // 6679
@51 // 6680
D=A // 6681
@SP // 6682
AM=M+1 // 6683
A=A-1 // 6684
M=D // 6685
@30 // 6686
D=A // 6687
@SP // 6688
AM=M+1 // 6689
A=A-1 // 6690
M=D // 6691
@51 // 6692
D=A // 6693
@SP // 6694
AM=M+1 // 6695
A=A-1 // 6696
M=D // 6697
@51 // 6698
D=A // 6699
@SP // 6700
AM=M+1 // 6701
A=A-1 // 6702
M=D // 6703
@51 // 6704
D=A // 6705
@SP // 6706
AM=M+1 // 6707
A=A-1 // 6708
M=D // 6709
@30 // 6710
D=A // 6711
@SP // 6712
AM=M+1 // 6713
A=A-1 // 6714
M=D // 6715
@SP // 6716
AM=M+1 // 6717
A=A-1 // 6718
M=0 // 6719
@SP // 6720
AM=M+1 // 6721
A=A-1 // 6722
M=0 // 6723
// call Output.create
@17 // 6724
D=A // 6725
@14 // 6726
M=D // 6727
@Output.create // 6728
D=A // 6729
@13 // 6730
M=D // 6731
@Output.initMap.ret.26 // 6732
D=A // 6733
@CALL // 6734
0;JMP // 6735
(Output.initMap.ret.26)
@SP // 6736
AM=M-1 // 6737
D=M // 6738
@5 // 6739
M=D // 6740
@57 // 6741
D=A // 6742
@SP // 6743
AM=M+1 // 6744
A=A-1 // 6745
M=D // 6746
@30 // 6747
D=A // 6748
@SP // 6749
AM=M+1 // 6750
A=A-1 // 6751
M=D // 6752
@51 // 6753
D=A // 6754
@SP // 6755
AM=M+1 // 6756
A=A-1 // 6757
M=D // 6758
@51 // 6759
D=A // 6760
@SP // 6761
AM=M+1 // 6762
A=A-1 // 6763
M=D // 6764
@51 // 6765
D=A // 6766
@SP // 6767
AM=M+1 // 6768
A=A-1 // 6769
M=D // 6770
@62 // 6771
D=A // 6772
@SP // 6773
AM=M+1 // 6774
A=A-1 // 6775
M=D // 6776
@48 // 6777
D=A // 6778
@SP // 6779
AM=M+1 // 6780
A=A-1 // 6781
M=D // 6782
@48 // 6783
D=A // 6784
@SP // 6785
AM=M+1 // 6786
A=A-1 // 6787
M=D // 6788
@24 // 6789
D=A // 6790
@SP // 6791
AM=M+1 // 6792
A=A-1 // 6793
M=D // 6794
@14 // 6795
D=A // 6796
@SP // 6797
AM=M+1 // 6798
A=A-1 // 6799
M=D // 6800
@SP // 6801
AM=M+1 // 6802
A=A-1 // 6803
M=0 // 6804
@SP // 6805
AM=M+1 // 6806
A=A-1 // 6807
M=0 // 6808
// call Output.create
@17 // 6809
D=A // 6810
@14 // 6811
M=D // 6812
@Output.create // 6813
D=A // 6814
@13 // 6815
M=D // 6816
@Output.initMap.ret.27 // 6817
D=A // 6818
@CALL // 6819
0;JMP // 6820
(Output.initMap.ret.27)
@SP // 6821
AM=M-1 // 6822
D=M // 6823
@5 // 6824
M=D // 6825
@58 // 6826
D=A // 6827
@SP // 6828
AM=M+1 // 6829
A=A-1 // 6830
M=D // 6831
@SP // 6832
AM=M+1 // 6833
A=A-1 // 6834
M=0 // 6835
@SP // 6836
AM=M+1 // 6837
A=A-1 // 6838
M=0 // 6839
@12 // 6840
D=A // 6841
@SP // 6842
AM=M+1 // 6843
A=A-1 // 6844
M=D // 6845
@12 // 6846
D=A // 6847
@SP // 6848
AM=M+1 // 6849
A=A-1 // 6850
M=D // 6851
@SP // 6852
AM=M+1 // 6853
A=A-1 // 6854
M=0 // 6855
@SP // 6856
AM=M+1 // 6857
A=A-1 // 6858
M=0 // 6859
@12 // 6860
D=A // 6861
@SP // 6862
AM=M+1 // 6863
A=A-1 // 6864
M=D // 6865
@12 // 6866
D=A // 6867
@SP // 6868
AM=M+1 // 6869
A=A-1 // 6870
M=D // 6871
@SP // 6872
AM=M+1 // 6873
A=A-1 // 6874
M=0 // 6875
@SP // 6876
AM=M+1 // 6877
A=A-1 // 6878
M=0 // 6879
@SP // 6880
AM=M+1 // 6881
A=A-1 // 6882
M=0 // 6883
// call Output.create
@17 // 6884
D=A // 6885
@14 // 6886
M=D // 6887
@Output.create // 6888
D=A // 6889
@13 // 6890
M=D // 6891
@Output.initMap.ret.28 // 6892
D=A // 6893
@CALL // 6894
0;JMP // 6895
(Output.initMap.ret.28)
@SP // 6896
AM=M-1 // 6897
D=M // 6898
@5 // 6899
M=D // 6900
@59 // 6901
D=A // 6902
@SP // 6903
AM=M+1 // 6904
A=A-1 // 6905
M=D // 6906
@SP // 6907
AM=M+1 // 6908
A=A-1 // 6909
M=0 // 6910
@SP // 6911
AM=M+1 // 6912
A=A-1 // 6913
M=0 // 6914
@12 // 6915
D=A // 6916
@SP // 6917
AM=M+1 // 6918
A=A-1 // 6919
M=D // 6920
@12 // 6921
D=A // 6922
@SP // 6923
AM=M+1 // 6924
A=A-1 // 6925
M=D // 6926
@SP // 6927
AM=M+1 // 6928
A=A-1 // 6929
M=0 // 6930
@SP // 6931
AM=M+1 // 6932
A=A-1 // 6933
M=0 // 6934
@12 // 6935
D=A // 6936
@SP // 6937
AM=M+1 // 6938
A=A-1 // 6939
M=D // 6940
@12 // 6941
D=A // 6942
@SP // 6943
AM=M+1 // 6944
A=A-1 // 6945
M=D // 6946
@6 // 6947
D=A // 6948
@SP // 6949
AM=M+1 // 6950
A=A-1 // 6951
M=D // 6952
@SP // 6953
AM=M+1 // 6954
A=A-1 // 6955
M=0 // 6956
@SP // 6957
AM=M+1 // 6958
A=A-1 // 6959
M=0 // 6960
// call Output.create
@17 // 6961
D=A // 6962
@14 // 6963
M=D // 6964
@Output.create // 6965
D=A // 6966
@13 // 6967
M=D // 6968
@Output.initMap.ret.29 // 6969
D=A // 6970
@CALL // 6971
0;JMP // 6972
(Output.initMap.ret.29)
@SP // 6973
AM=M-1 // 6974
D=M // 6975
@5 // 6976
M=D // 6977
@60 // 6978
D=A // 6979
@SP // 6980
AM=M+1 // 6981
A=A-1 // 6982
M=D // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=0 // 6987
@SP // 6988
AM=M+1 // 6989
A=A-1 // 6990
M=0 // 6991
@24 // 6992
D=A // 6993
@SP // 6994
AM=M+1 // 6995
A=A-1 // 6996
M=D // 6997
@12 // 6998
D=A // 6999
@SP // 7000
AM=M+1 // 7001
A=A-1 // 7002
M=D // 7003
@6 // 7004
D=A // 7005
@SP // 7006
AM=M+1 // 7007
A=A-1 // 7008
M=D // 7009
@3 // 7010
D=A // 7011
@SP // 7012
AM=M+1 // 7013
A=A-1 // 7014
M=D // 7015
@6 // 7016
D=A // 7017
@SP // 7018
AM=M+1 // 7019
A=A-1 // 7020
M=D // 7021
@12 // 7022
D=A // 7023
@SP // 7024
AM=M+1 // 7025
A=A-1 // 7026
M=D // 7027
@24 // 7028
D=A // 7029
@SP // 7030
AM=M+1 // 7031
A=A-1 // 7032
M=D // 7033
@SP // 7034
AM=M+1 // 7035
A=A-1 // 7036
M=0 // 7037
@SP // 7038
AM=M+1 // 7039
A=A-1 // 7040
M=0 // 7041
// call Output.create
@17 // 7042
D=A // 7043
@14 // 7044
M=D // 7045
@Output.create // 7046
D=A // 7047
@13 // 7048
M=D // 7049
@Output.initMap.ret.30 // 7050
D=A // 7051
@CALL // 7052
0;JMP // 7053
(Output.initMap.ret.30)
@SP // 7054
AM=M-1 // 7055
D=M // 7056
@5 // 7057
M=D // 7058
@61 // 7059
D=A // 7060
@SP // 7061
AM=M+1 // 7062
A=A-1 // 7063
M=D // 7064
@SP // 7065
AM=M+1 // 7066
A=A-1 // 7067
M=0 // 7068
@SP // 7069
AM=M+1 // 7070
A=A-1 // 7071
M=0 // 7072
@SP // 7073
AM=M+1 // 7074
A=A-1 // 7075
M=0 // 7076
@63 // 7077
D=A // 7078
@SP // 7079
AM=M+1 // 7080
A=A-1 // 7081
M=D // 7082
@SP // 7083
AM=M+1 // 7084
A=A-1 // 7085
M=0 // 7086
@SP // 7087
AM=M+1 // 7088
A=A-1 // 7089
M=0 // 7090
@63 // 7091
D=A // 7092
@SP // 7093
AM=M+1 // 7094
A=A-1 // 7095
M=D // 7096
@SP // 7097
AM=M+1 // 7098
A=A-1 // 7099
M=0 // 7100
@SP // 7101
AM=M+1 // 7102
A=A-1 // 7103
M=0 // 7104
@SP // 7105
AM=M+1 // 7106
A=A-1 // 7107
M=0 // 7108
@SP // 7109
AM=M+1 // 7110
A=A-1 // 7111
M=0 // 7112
// call Output.create
@17 // 7113
D=A // 7114
@14 // 7115
M=D // 7116
@Output.create // 7117
D=A // 7118
@13 // 7119
M=D // 7120
@Output.initMap.ret.31 // 7121
D=A // 7122
@CALL // 7123
0;JMP // 7124
(Output.initMap.ret.31)
@SP // 7125
AM=M-1 // 7126
D=M // 7127
@5 // 7128
M=D // 7129
@62 // 7130
D=A // 7131
@SP // 7132
AM=M+1 // 7133
A=A-1 // 7134
M=D // 7135
@SP // 7136
AM=M+1 // 7137
A=A-1 // 7138
M=0 // 7139
@SP // 7140
AM=M+1 // 7141
A=A-1 // 7142
M=0 // 7143
@3 // 7144
D=A // 7145
@SP // 7146
AM=M+1 // 7147
A=A-1 // 7148
M=D // 7149
@6 // 7150
D=A // 7151
@SP // 7152
AM=M+1 // 7153
A=A-1 // 7154
M=D // 7155
@12 // 7156
D=A // 7157
@SP // 7158
AM=M+1 // 7159
A=A-1 // 7160
M=D // 7161
@24 // 7162
D=A // 7163
@SP // 7164
AM=M+1 // 7165
A=A-1 // 7166
M=D // 7167
@12 // 7168
D=A // 7169
@SP // 7170
AM=M+1 // 7171
A=A-1 // 7172
M=D // 7173
@6 // 7174
D=A // 7175
@SP // 7176
AM=M+1 // 7177
A=A-1 // 7178
M=D // 7179
@3 // 7180
D=A // 7181
@SP // 7182
AM=M+1 // 7183
A=A-1 // 7184
M=D // 7185
@SP // 7186
AM=M+1 // 7187
A=A-1 // 7188
M=0 // 7189
@SP // 7190
AM=M+1 // 7191
A=A-1 // 7192
M=0 // 7193
// call Output.create
@17 // 7194
D=A // 7195
@14 // 7196
M=D // 7197
@Output.create // 7198
D=A // 7199
@13 // 7200
M=D // 7201
@Output.initMap.ret.32 // 7202
D=A // 7203
@CALL // 7204
0;JMP // 7205
(Output.initMap.ret.32)
@SP // 7206
AM=M-1 // 7207
D=M // 7208
@5 // 7209
M=D // 7210
@64 // 7211
D=A // 7212
@SP // 7213
AM=M+1 // 7214
A=A-1 // 7215
M=D // 7216
@30 // 7217
D=A // 7218
@SP // 7219
AM=M+1 // 7220
A=A-1 // 7221
M=D // 7222
@51 // 7223
D=A // 7224
@SP // 7225
AM=M+1 // 7226
A=A-1 // 7227
M=D // 7228
@51 // 7229
D=A // 7230
@SP // 7231
AM=M+1 // 7232
A=A-1 // 7233
M=D // 7234
@59 // 7235
D=A // 7236
@SP // 7237
AM=M+1 // 7238
A=A-1 // 7239
M=D // 7240
@59 // 7241
D=A // 7242
@SP // 7243
AM=M+1 // 7244
A=A-1 // 7245
M=D // 7246
@59 // 7247
D=A // 7248
@SP // 7249
AM=M+1 // 7250
A=A-1 // 7251
M=D // 7252
@27 // 7253
D=A // 7254
@SP // 7255
AM=M+1 // 7256
A=A-1 // 7257
M=D // 7258
@3 // 7259
D=A // 7260
@SP // 7261
AM=M+1 // 7262
A=A-1 // 7263
M=D // 7264
@30 // 7265
D=A // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=D // 7270
@SP // 7271
AM=M+1 // 7272
A=A-1 // 7273
M=0 // 7274
@SP // 7275
AM=M+1 // 7276
A=A-1 // 7277
M=0 // 7278
// call Output.create
@17 // 7279
D=A // 7280
@14 // 7281
M=D // 7282
@Output.create // 7283
D=A // 7284
@13 // 7285
M=D // 7286
@Output.initMap.ret.33 // 7287
D=A // 7288
@CALL // 7289
0;JMP // 7290
(Output.initMap.ret.33)
@SP // 7291
AM=M-1 // 7292
D=M // 7293
@5 // 7294
M=D // 7295
@63 // 7296
D=A // 7297
@SP // 7298
AM=M+1 // 7299
A=A-1 // 7300
M=D // 7301
@30 // 7302
D=A // 7303
@SP // 7304
AM=M+1 // 7305
A=A-1 // 7306
M=D // 7307
@51 // 7308
D=A // 7309
@SP // 7310
AM=M+1 // 7311
A=A-1 // 7312
M=D // 7313
@51 // 7314
D=A // 7315
@SP // 7316
AM=M+1 // 7317
A=A-1 // 7318
M=D // 7319
@24 // 7320
D=A // 7321
@SP // 7322
AM=M+1 // 7323
A=A-1 // 7324
M=D // 7325
@12 // 7326
D=A // 7327
@SP // 7328
AM=M+1 // 7329
A=A-1 // 7330
M=D // 7331
@12 // 7332
D=A // 7333
@SP // 7334
AM=M+1 // 7335
A=A-1 // 7336
M=D // 7337
@SP // 7338
AM=M+1 // 7339
A=A-1 // 7340
M=0 // 7341
@12 // 7342
D=A // 7343
@SP // 7344
AM=M+1 // 7345
A=A-1 // 7346
M=D // 7347
@12 // 7348
D=A // 7349
@SP // 7350
AM=M+1 // 7351
A=A-1 // 7352
M=D // 7353
@SP // 7354
AM=M+1 // 7355
A=A-1 // 7356
M=0 // 7357
@SP // 7358
AM=M+1 // 7359
A=A-1 // 7360
M=0 // 7361
// call Output.create
@17 // 7362
D=A // 7363
@14 // 7364
M=D // 7365
@Output.create // 7366
D=A // 7367
@13 // 7368
M=D // 7369
@Output.initMap.ret.34 // 7370
D=A // 7371
@CALL // 7372
0;JMP // 7373
(Output.initMap.ret.34)
@SP // 7374
AM=M-1 // 7375
D=M // 7376
@5 // 7377
M=D // 7378
@65 // 7379
D=A // 7380
@SP // 7381
AM=M+1 // 7382
A=A-1 // 7383
M=D // 7384
@12 // 7385
D=A // 7386
@SP // 7387
AM=M+1 // 7388
A=A-1 // 7389
M=D // 7390
@30 // 7391
D=A // 7392
@SP // 7393
AM=M+1 // 7394
A=A-1 // 7395
M=D // 7396
@51 // 7397
D=A // 7398
@SP // 7399
AM=M+1 // 7400
A=A-1 // 7401
M=D // 7402
@51 // 7403
D=A // 7404
@SP // 7405
AM=M+1 // 7406
A=A-1 // 7407
M=D // 7408
@63 // 7409
D=A // 7410
@SP // 7411
AM=M+1 // 7412
A=A-1 // 7413
M=D // 7414
@51 // 7415
D=A // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=D // 7420
@51 // 7421
D=A // 7422
@SP // 7423
AM=M+1 // 7424
A=A-1 // 7425
M=D // 7426
@51 // 7427
D=A // 7428
@SP // 7429
AM=M+1 // 7430
A=A-1 // 7431
M=D // 7432
@51 // 7433
D=A // 7434
@SP // 7435
AM=M+1 // 7436
A=A-1 // 7437
M=D // 7438
@SP // 7439
AM=M+1 // 7440
A=A-1 // 7441
M=0 // 7442
@SP // 7443
AM=M+1 // 7444
A=A-1 // 7445
M=0 // 7446
// call Output.create
@17 // 7447
D=A // 7448
@14 // 7449
M=D // 7450
@Output.create // 7451
D=A // 7452
@13 // 7453
M=D // 7454
@Output.initMap.ret.35 // 7455
D=A // 7456
@CALL // 7457
0;JMP // 7458
(Output.initMap.ret.35)
@SP // 7459
AM=M-1 // 7460
D=M // 7461
@5 // 7462
M=D // 7463
@66 // 7464
D=A // 7465
@SP // 7466
AM=M+1 // 7467
A=A-1 // 7468
M=D // 7469
@31 // 7470
D=A // 7471
@SP // 7472
AM=M+1 // 7473
A=A-1 // 7474
M=D // 7475
@51 // 7476
D=A // 7477
@SP // 7478
AM=M+1 // 7479
A=A-1 // 7480
M=D // 7481
@51 // 7482
D=A // 7483
@SP // 7484
AM=M+1 // 7485
A=A-1 // 7486
M=D // 7487
@51 // 7488
D=A // 7489
@SP // 7490
AM=M+1 // 7491
A=A-1 // 7492
M=D // 7493
@31 // 7494
D=A // 7495
@SP // 7496
AM=M+1 // 7497
A=A-1 // 7498
M=D // 7499
@51 // 7500
D=A // 7501
@SP // 7502
AM=M+1 // 7503
A=A-1 // 7504
M=D // 7505
@51 // 7506
D=A // 7507
@SP // 7508
AM=M+1 // 7509
A=A-1 // 7510
M=D // 7511
@51 // 7512
D=A // 7513
@SP // 7514
AM=M+1 // 7515
A=A-1 // 7516
M=D // 7517
@31 // 7518
D=A // 7519
@SP // 7520
AM=M+1 // 7521
A=A-1 // 7522
M=D // 7523
@SP // 7524
AM=M+1 // 7525
A=A-1 // 7526
M=0 // 7527
@SP // 7528
AM=M+1 // 7529
A=A-1 // 7530
M=0 // 7531
// call Output.create
@17 // 7532
D=A // 7533
@14 // 7534
M=D // 7535
@Output.create // 7536
D=A // 7537
@13 // 7538
M=D // 7539
@Output.initMap.ret.36 // 7540
D=A // 7541
@CALL // 7542
0;JMP // 7543
(Output.initMap.ret.36)
@SP // 7544
AM=M-1 // 7545
D=M // 7546
@5 // 7547
M=D // 7548
@67 // 7549
D=A // 7550
@SP // 7551
AM=M+1 // 7552
A=A-1 // 7553
M=D // 7554
@28 // 7555
D=A // 7556
@SP // 7557
AM=M+1 // 7558
A=A-1 // 7559
M=D // 7560
@54 // 7561
D=A // 7562
@SP // 7563
AM=M+1 // 7564
A=A-1 // 7565
M=D // 7566
@35 // 7567
D=A // 7568
@SP // 7569
AM=M+1 // 7570
A=A-1 // 7571
M=D // 7572
@3 // 7573
D=A // 7574
@SP // 7575
AM=M+1 // 7576
A=A-1 // 7577
M=D // 7578
@3 // 7579
D=A // 7580
@SP // 7581
AM=M+1 // 7582
A=A-1 // 7583
M=D // 7584
@3 // 7585
D=A // 7586
@SP // 7587
AM=M+1 // 7588
A=A-1 // 7589
M=D // 7590
@35 // 7591
D=A // 7592
@SP // 7593
AM=M+1 // 7594
A=A-1 // 7595
M=D // 7596
@54 // 7597
D=A // 7598
@SP // 7599
AM=M+1 // 7600
A=A-1 // 7601
M=D // 7602
@28 // 7603
D=A // 7604
@SP // 7605
AM=M+1 // 7606
A=A-1 // 7607
M=D // 7608
@SP // 7609
AM=M+1 // 7610
A=A-1 // 7611
M=0 // 7612
@SP // 7613
AM=M+1 // 7614
A=A-1 // 7615
M=0 // 7616
// call Output.create
@17 // 7617
D=A // 7618
@14 // 7619
M=D // 7620
@Output.create // 7621
D=A // 7622
@13 // 7623
M=D // 7624
@Output.initMap.ret.37 // 7625
D=A // 7626
@CALL // 7627
0;JMP // 7628
(Output.initMap.ret.37)
@SP // 7629
AM=M-1 // 7630
D=M // 7631
@5 // 7632
M=D // 7633
@68 // 7634
D=A // 7635
@SP // 7636
AM=M+1 // 7637
A=A-1 // 7638
M=D // 7639
@15 // 7640
D=A // 7641
@SP // 7642
AM=M+1 // 7643
A=A-1 // 7644
M=D // 7645
@27 // 7646
D=A // 7647
@SP // 7648
AM=M+1 // 7649
A=A-1 // 7650
M=D // 7651
@51 // 7652
D=A // 7653
@SP // 7654
AM=M+1 // 7655
A=A-1 // 7656
M=D // 7657
@51 // 7658
D=A // 7659
@SP // 7660
AM=M+1 // 7661
A=A-1 // 7662
M=D // 7663
@51 // 7664
D=A // 7665
@SP // 7666
AM=M+1 // 7667
A=A-1 // 7668
M=D // 7669
@51 // 7670
D=A // 7671
@SP // 7672
AM=M+1 // 7673
A=A-1 // 7674
M=D // 7675
@51 // 7676
D=A // 7677
@SP // 7678
AM=M+1 // 7679
A=A-1 // 7680
M=D // 7681
@27 // 7682
D=A // 7683
@SP // 7684
AM=M+1 // 7685
A=A-1 // 7686
M=D // 7687
@15 // 7688
D=A // 7689
@SP // 7690
AM=M+1 // 7691
A=A-1 // 7692
M=D // 7693
@SP // 7694
AM=M+1 // 7695
A=A-1 // 7696
M=0 // 7697
@SP // 7698
AM=M+1 // 7699
A=A-1 // 7700
M=0 // 7701
// call Output.create
@17 // 7702
D=A // 7703
@14 // 7704
M=D // 7705
@Output.create // 7706
D=A // 7707
@13 // 7708
M=D // 7709
@Output.initMap.ret.38 // 7710
D=A // 7711
@CALL // 7712
0;JMP // 7713
(Output.initMap.ret.38)
@SP // 7714
AM=M-1 // 7715
D=M // 7716
@5 // 7717
M=D // 7718
@69 // 7719
D=A // 7720
@SP // 7721
AM=M+1 // 7722
A=A-1 // 7723
M=D // 7724
@63 // 7725
D=A // 7726
@SP // 7727
AM=M+1 // 7728
A=A-1 // 7729
M=D // 7730
@51 // 7731
D=A // 7732
@SP // 7733
AM=M+1 // 7734
A=A-1 // 7735
M=D // 7736
@35 // 7737
D=A // 7738
@SP // 7739
AM=M+1 // 7740
A=A-1 // 7741
M=D // 7742
@11 // 7743
D=A // 7744
@SP // 7745
AM=M+1 // 7746
A=A-1 // 7747
M=D // 7748
@15 // 7749
D=A // 7750
@SP // 7751
AM=M+1 // 7752
A=A-1 // 7753
M=D // 7754
@11 // 7755
D=A // 7756
@SP // 7757
AM=M+1 // 7758
A=A-1 // 7759
M=D // 7760
@35 // 7761
D=A // 7762
@SP // 7763
AM=M+1 // 7764
A=A-1 // 7765
M=D // 7766
@51 // 7767
D=A // 7768
@SP // 7769
AM=M+1 // 7770
A=A-1 // 7771
M=D // 7772
@63 // 7773
D=A // 7774
@SP // 7775
AM=M+1 // 7776
A=A-1 // 7777
M=D // 7778
@SP // 7779
AM=M+1 // 7780
A=A-1 // 7781
M=0 // 7782
@SP // 7783
AM=M+1 // 7784
A=A-1 // 7785
M=0 // 7786
// call Output.create
@17 // 7787
D=A // 7788
@14 // 7789
M=D // 7790
@Output.create // 7791
D=A // 7792
@13 // 7793
M=D // 7794
@Output.initMap.ret.39 // 7795
D=A // 7796
@CALL // 7797
0;JMP // 7798
(Output.initMap.ret.39)
@SP // 7799
AM=M-1 // 7800
D=M // 7801
@5 // 7802
M=D // 7803
@70 // 7804
D=A // 7805
@SP // 7806
AM=M+1 // 7807
A=A-1 // 7808
M=D // 7809
@63 // 7810
D=A // 7811
@SP // 7812
AM=M+1 // 7813
A=A-1 // 7814
M=D // 7815
@51 // 7816
D=A // 7817
@SP // 7818
AM=M+1 // 7819
A=A-1 // 7820
M=D // 7821
@35 // 7822
D=A // 7823
@SP // 7824
AM=M+1 // 7825
A=A-1 // 7826
M=D // 7827
@11 // 7828
D=A // 7829
@SP // 7830
AM=M+1 // 7831
A=A-1 // 7832
M=D // 7833
@15 // 7834
D=A // 7835
@SP // 7836
AM=M+1 // 7837
A=A-1 // 7838
M=D // 7839
@11 // 7840
D=A // 7841
@SP // 7842
AM=M+1 // 7843
A=A-1 // 7844
M=D // 7845
@3 // 7846
D=A // 7847
@SP // 7848
AM=M+1 // 7849
A=A-1 // 7850
M=D // 7851
@3 // 7852
D=A // 7853
@SP // 7854
AM=M+1 // 7855
A=A-1 // 7856
M=D // 7857
@3 // 7858
D=A // 7859
@SP // 7860
AM=M+1 // 7861
A=A-1 // 7862
M=D // 7863
@SP // 7864
AM=M+1 // 7865
A=A-1 // 7866
M=0 // 7867
@SP // 7868
AM=M+1 // 7869
A=A-1 // 7870
M=0 // 7871
// call Output.create
@17 // 7872
D=A // 7873
@14 // 7874
M=D // 7875
@Output.create // 7876
D=A // 7877
@13 // 7878
M=D // 7879
@Output.initMap.ret.40 // 7880
D=A // 7881
@CALL // 7882
0;JMP // 7883
(Output.initMap.ret.40)
@SP // 7884
AM=M-1 // 7885
D=M // 7886
@5 // 7887
M=D // 7888
@71 // 7889
D=A // 7890
@SP // 7891
AM=M+1 // 7892
A=A-1 // 7893
M=D // 7894
@28 // 7895
D=A // 7896
@SP // 7897
AM=M+1 // 7898
A=A-1 // 7899
M=D // 7900
@54 // 7901
D=A // 7902
@SP // 7903
AM=M+1 // 7904
A=A-1 // 7905
M=D // 7906
@35 // 7907
D=A // 7908
@SP // 7909
AM=M+1 // 7910
A=A-1 // 7911
M=D // 7912
@3 // 7913
D=A // 7914
@SP // 7915
AM=M+1 // 7916
A=A-1 // 7917
M=D // 7918
@59 // 7919
D=A // 7920
@SP // 7921
AM=M+1 // 7922
A=A-1 // 7923
M=D // 7924
@51 // 7925
D=A // 7926
@SP // 7927
AM=M+1 // 7928
A=A-1 // 7929
M=D // 7930
@51 // 7931
D=A // 7932
@SP // 7933
AM=M+1 // 7934
A=A-1 // 7935
M=D // 7936
@54 // 7937
D=A // 7938
@SP // 7939
AM=M+1 // 7940
A=A-1 // 7941
M=D // 7942
@44 // 7943
D=A // 7944
@SP // 7945
AM=M+1 // 7946
A=A-1 // 7947
M=D // 7948
@SP // 7949
AM=M+1 // 7950
A=A-1 // 7951
M=0 // 7952
@SP // 7953
AM=M+1 // 7954
A=A-1 // 7955
M=0 // 7956
// call Output.create
@17 // 7957
D=A // 7958
@14 // 7959
M=D // 7960
@Output.create // 7961
D=A // 7962
@13 // 7963
M=D // 7964
@Output.initMap.ret.41 // 7965
D=A // 7966
@CALL // 7967
0;JMP // 7968
(Output.initMap.ret.41)
@SP // 7969
AM=M-1 // 7970
D=M // 7971
@5 // 7972
M=D // 7973
@72 // 7974
D=A // 7975
@SP // 7976
AM=M+1 // 7977
A=A-1 // 7978
M=D // 7979
@51 // 7980
D=A // 7981
@SP // 7982
AM=M+1 // 7983
A=A-1 // 7984
M=D // 7985
@51 // 7986
D=A // 7987
@SP // 7988
AM=M+1 // 7989
A=A-1 // 7990
M=D // 7991
@51 // 7992
D=A // 7993
@SP // 7994
AM=M+1 // 7995
A=A-1 // 7996
M=D // 7997
@51 // 7998
D=A // 7999
@SP // 8000
AM=M+1 // 8001
A=A-1 // 8002
M=D // 8003
@63 // 8004
D=A // 8005
@SP // 8006
AM=M+1 // 8007
A=A-1 // 8008
M=D // 8009
@51 // 8010
D=A // 8011
@SP // 8012
AM=M+1 // 8013
A=A-1 // 8014
M=D // 8015
@51 // 8016
D=A // 8017
@SP // 8018
AM=M+1 // 8019
A=A-1 // 8020
M=D // 8021
@51 // 8022
D=A // 8023
@SP // 8024
AM=M+1 // 8025
A=A-1 // 8026
M=D // 8027
@51 // 8028
D=A // 8029
@SP // 8030
AM=M+1 // 8031
A=A-1 // 8032
M=D // 8033
@SP // 8034
AM=M+1 // 8035
A=A-1 // 8036
M=0 // 8037
@SP // 8038
AM=M+1 // 8039
A=A-1 // 8040
M=0 // 8041
// call Output.create
@17 // 8042
D=A // 8043
@14 // 8044
M=D // 8045
@Output.create // 8046
D=A // 8047
@13 // 8048
M=D // 8049
@Output.initMap.ret.42 // 8050
D=A // 8051
@CALL // 8052
0;JMP // 8053
(Output.initMap.ret.42)
@SP // 8054
AM=M-1 // 8055
D=M // 8056
@5 // 8057
M=D // 8058
@73 // 8059
D=A // 8060
@SP // 8061
AM=M+1 // 8062
A=A-1 // 8063
M=D // 8064
@30 // 8065
D=A // 8066
@SP // 8067
AM=M+1 // 8068
A=A-1 // 8069
M=D // 8070
@12 // 8071
D=A // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=D // 8076
@12 // 8077
D=A // 8078
@SP // 8079
AM=M+1 // 8080
A=A-1 // 8081
M=D // 8082
@12 // 8083
D=A // 8084
@SP // 8085
AM=M+1 // 8086
A=A-1 // 8087
M=D // 8088
@12 // 8089
D=A // 8090
@SP // 8091
AM=M+1 // 8092
A=A-1 // 8093
M=D // 8094
@12 // 8095
D=A // 8096
@SP // 8097
AM=M+1 // 8098
A=A-1 // 8099
M=D // 8100
@12 // 8101
D=A // 8102
@SP // 8103
AM=M+1 // 8104
A=A-1 // 8105
M=D // 8106
@12 // 8107
D=A // 8108
@SP // 8109
AM=M+1 // 8110
A=A-1 // 8111
M=D // 8112
@30 // 8113
D=A // 8114
@SP // 8115
AM=M+1 // 8116
A=A-1 // 8117
M=D // 8118
@SP // 8119
AM=M+1 // 8120
A=A-1 // 8121
M=0 // 8122
@SP // 8123
AM=M+1 // 8124
A=A-1 // 8125
M=0 // 8126
// call Output.create
@17 // 8127
D=A // 8128
@14 // 8129
M=D // 8130
@Output.create // 8131
D=A // 8132
@13 // 8133
M=D // 8134
@Output.initMap.ret.43 // 8135
D=A // 8136
@CALL // 8137
0;JMP // 8138
(Output.initMap.ret.43)
@SP // 8139
AM=M-1 // 8140
D=M // 8141
@5 // 8142
M=D // 8143
@74 // 8144
D=A // 8145
@SP // 8146
AM=M+1 // 8147
A=A-1 // 8148
M=D // 8149
@60 // 8150
D=A // 8151
@SP // 8152
AM=M+1 // 8153
A=A-1 // 8154
M=D // 8155
@24 // 8156
D=A // 8157
@SP // 8158
AM=M+1 // 8159
A=A-1 // 8160
M=D // 8161
@24 // 8162
D=A // 8163
@SP // 8164
AM=M+1 // 8165
A=A-1 // 8166
M=D // 8167
@24 // 8168
D=A // 8169
@SP // 8170
AM=M+1 // 8171
A=A-1 // 8172
M=D // 8173
@24 // 8174
D=A // 8175
@SP // 8176
AM=M+1 // 8177
A=A-1 // 8178
M=D // 8179
@24 // 8180
D=A // 8181
@SP // 8182
AM=M+1 // 8183
A=A-1 // 8184
M=D // 8185
@27 // 8186
D=A // 8187
@SP // 8188
AM=M+1 // 8189
A=A-1 // 8190
M=D // 8191
@27 // 8192
D=A // 8193
@SP // 8194
AM=M+1 // 8195
A=A-1 // 8196
M=D // 8197
@14 // 8198
D=A // 8199
@SP // 8200
AM=M+1 // 8201
A=A-1 // 8202
M=D // 8203
@SP // 8204
AM=M+1 // 8205
A=A-1 // 8206
M=0 // 8207
@SP // 8208
AM=M+1 // 8209
A=A-1 // 8210
M=0 // 8211
// call Output.create
@17 // 8212
D=A // 8213
@14 // 8214
M=D // 8215
@Output.create // 8216
D=A // 8217
@13 // 8218
M=D // 8219
@Output.initMap.ret.44 // 8220
D=A // 8221
@CALL // 8222
0;JMP // 8223
(Output.initMap.ret.44)
@SP // 8224
AM=M-1 // 8225
D=M // 8226
@5 // 8227
M=D // 8228
@75 // 8229
D=A // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=D // 8234
@51 // 8235
D=A // 8236
@SP // 8237
AM=M+1 // 8238
A=A-1 // 8239
M=D // 8240
@51 // 8241
D=A // 8242
@SP // 8243
AM=M+1 // 8244
A=A-1 // 8245
M=D // 8246
@51 // 8247
D=A // 8248
@SP // 8249
AM=M+1 // 8250
A=A-1 // 8251
M=D // 8252
@27 // 8253
D=A // 8254
@SP // 8255
AM=M+1 // 8256
A=A-1 // 8257
M=D // 8258
@15 // 8259
D=A // 8260
@SP // 8261
AM=M+1 // 8262
A=A-1 // 8263
M=D // 8264
@27 // 8265
D=A // 8266
@SP // 8267
AM=M+1 // 8268
A=A-1 // 8269
M=D // 8270
@51 // 8271
D=A // 8272
@SP // 8273
AM=M+1 // 8274
A=A-1 // 8275
M=D // 8276
@51 // 8277
D=A // 8278
@SP // 8279
AM=M+1 // 8280
A=A-1 // 8281
M=D // 8282
@51 // 8283
D=A // 8284
@SP // 8285
AM=M+1 // 8286
A=A-1 // 8287
M=D // 8288
@SP // 8289
AM=M+1 // 8290
A=A-1 // 8291
M=0 // 8292
@SP // 8293
AM=M+1 // 8294
A=A-1 // 8295
M=0 // 8296
// call Output.create
@17 // 8297
D=A // 8298
@14 // 8299
M=D // 8300
@Output.create // 8301
D=A // 8302
@13 // 8303
M=D // 8304
@Output.initMap.ret.45 // 8305
D=A // 8306
@CALL // 8307
0;JMP // 8308
(Output.initMap.ret.45)
@SP // 8309
AM=M-1 // 8310
D=M // 8311
@5 // 8312
M=D // 8313
@76 // 8314
D=A // 8315
@SP // 8316
AM=M+1 // 8317
A=A-1 // 8318
M=D // 8319
@3 // 8320
D=A // 8321
@SP // 8322
AM=M+1 // 8323
A=A-1 // 8324
M=D // 8325
@3 // 8326
D=A // 8327
@SP // 8328
AM=M+1 // 8329
A=A-1 // 8330
M=D // 8331
@3 // 8332
D=A // 8333
@SP // 8334
AM=M+1 // 8335
A=A-1 // 8336
M=D // 8337
@3 // 8338
D=A // 8339
@SP // 8340
AM=M+1 // 8341
A=A-1 // 8342
M=D // 8343
@3 // 8344
D=A // 8345
@SP // 8346
AM=M+1 // 8347
A=A-1 // 8348
M=D // 8349
@3 // 8350
D=A // 8351
@SP // 8352
AM=M+1 // 8353
A=A-1 // 8354
M=D // 8355
@35 // 8356
D=A // 8357
@SP // 8358
AM=M+1 // 8359
A=A-1 // 8360
M=D // 8361
@51 // 8362
D=A // 8363
@SP // 8364
AM=M+1 // 8365
A=A-1 // 8366
M=D // 8367
@63 // 8368
D=A // 8369
@SP // 8370
AM=M+1 // 8371
A=A-1 // 8372
M=D // 8373
@SP // 8374
AM=M+1 // 8375
A=A-1 // 8376
M=0 // 8377
@SP // 8378
AM=M+1 // 8379
A=A-1 // 8380
M=0 // 8381
// call Output.create
@17 // 8382
D=A // 8383
@14 // 8384
M=D // 8385
@Output.create // 8386
D=A // 8387
@13 // 8388
M=D // 8389
@Output.initMap.ret.46 // 8390
D=A // 8391
@CALL // 8392
0;JMP // 8393
(Output.initMap.ret.46)
@SP // 8394
AM=M-1 // 8395
D=M // 8396
@5 // 8397
M=D // 8398
@77 // 8399
D=A // 8400
@SP // 8401
AM=M+1 // 8402
A=A-1 // 8403
M=D // 8404
@33 // 8405
D=A // 8406
@SP // 8407
AM=M+1 // 8408
A=A-1 // 8409
M=D // 8410
@51 // 8411
D=A // 8412
@SP // 8413
AM=M+1 // 8414
A=A-1 // 8415
M=D // 8416
@63 // 8417
D=A // 8418
@SP // 8419
AM=M+1 // 8420
A=A-1 // 8421
M=D // 8422
@63 // 8423
D=A // 8424
@SP // 8425
AM=M+1 // 8426
A=A-1 // 8427
M=D // 8428
@51 // 8429
D=A // 8430
@SP // 8431
AM=M+1 // 8432
A=A-1 // 8433
M=D // 8434
@51 // 8435
D=A // 8436
@SP // 8437
AM=M+1 // 8438
A=A-1 // 8439
M=D // 8440
@51 // 8441
D=A // 8442
@SP // 8443
AM=M+1 // 8444
A=A-1 // 8445
M=D // 8446
@51 // 8447
D=A // 8448
@SP // 8449
AM=M+1 // 8450
A=A-1 // 8451
M=D // 8452
@51 // 8453
D=A // 8454
@SP // 8455
AM=M+1 // 8456
A=A-1 // 8457
M=D // 8458
@SP // 8459
AM=M+1 // 8460
A=A-1 // 8461
M=0 // 8462
@SP // 8463
AM=M+1 // 8464
A=A-1 // 8465
M=0 // 8466
// call Output.create
@17 // 8467
D=A // 8468
@14 // 8469
M=D // 8470
@Output.create // 8471
D=A // 8472
@13 // 8473
M=D // 8474
@Output.initMap.ret.47 // 8475
D=A // 8476
@CALL // 8477
0;JMP // 8478
(Output.initMap.ret.47)
@SP // 8479
AM=M-1 // 8480
D=M // 8481
@5 // 8482
M=D // 8483
@78 // 8484
D=A // 8485
@SP // 8486
AM=M+1 // 8487
A=A-1 // 8488
M=D // 8489
@51 // 8490
D=A // 8491
@SP // 8492
AM=M+1 // 8493
A=A-1 // 8494
M=D // 8495
@51 // 8496
D=A // 8497
@SP // 8498
AM=M+1 // 8499
A=A-1 // 8500
M=D // 8501
@55 // 8502
D=A // 8503
@SP // 8504
AM=M+1 // 8505
A=A-1 // 8506
M=D // 8507
@55 // 8508
D=A // 8509
@SP // 8510
AM=M+1 // 8511
A=A-1 // 8512
M=D // 8513
@63 // 8514
D=A // 8515
@SP // 8516
AM=M+1 // 8517
A=A-1 // 8518
M=D // 8519
@59 // 8520
D=A // 8521
@SP // 8522
AM=M+1 // 8523
A=A-1 // 8524
M=D // 8525
@59 // 8526
D=A // 8527
@SP // 8528
AM=M+1 // 8529
A=A-1 // 8530
M=D // 8531
@51 // 8532
D=A // 8533
@SP // 8534
AM=M+1 // 8535
A=A-1 // 8536
M=D // 8537
@51 // 8538
D=A // 8539
@SP // 8540
AM=M+1 // 8541
A=A-1 // 8542
M=D // 8543
@SP // 8544
AM=M+1 // 8545
A=A-1 // 8546
M=0 // 8547
@SP // 8548
AM=M+1 // 8549
A=A-1 // 8550
M=0 // 8551
// call Output.create
@17 // 8552
D=A // 8553
@14 // 8554
M=D // 8555
@Output.create // 8556
D=A // 8557
@13 // 8558
M=D // 8559
@Output.initMap.ret.48 // 8560
D=A // 8561
@CALL // 8562
0;JMP // 8563
(Output.initMap.ret.48)
@SP // 8564
AM=M-1 // 8565
D=M // 8566
@5 // 8567
M=D // 8568
@79 // 8569
D=A // 8570
@SP // 8571
AM=M+1 // 8572
A=A-1 // 8573
M=D // 8574
@30 // 8575
D=A // 8576
@SP // 8577
AM=M+1 // 8578
A=A-1 // 8579
M=D // 8580
@51 // 8581
D=A // 8582
@SP // 8583
AM=M+1 // 8584
A=A-1 // 8585
M=D // 8586
@51 // 8587
D=A // 8588
@SP // 8589
AM=M+1 // 8590
A=A-1 // 8591
M=D // 8592
@51 // 8593
D=A // 8594
@SP // 8595
AM=M+1 // 8596
A=A-1 // 8597
M=D // 8598
@51 // 8599
D=A // 8600
@SP // 8601
AM=M+1 // 8602
A=A-1 // 8603
M=D // 8604
@51 // 8605
D=A // 8606
@SP // 8607
AM=M+1 // 8608
A=A-1 // 8609
M=D // 8610
@51 // 8611
D=A // 8612
@SP // 8613
AM=M+1 // 8614
A=A-1 // 8615
M=D // 8616
@51 // 8617
D=A // 8618
@SP // 8619
AM=M+1 // 8620
A=A-1 // 8621
M=D // 8622
@30 // 8623
D=A // 8624
@SP // 8625
AM=M+1 // 8626
A=A-1 // 8627
M=D // 8628
@SP // 8629
AM=M+1 // 8630
A=A-1 // 8631
M=0 // 8632
@SP // 8633
AM=M+1 // 8634
A=A-1 // 8635
M=0 // 8636
// call Output.create
@17 // 8637
D=A // 8638
@14 // 8639
M=D // 8640
@Output.create // 8641
D=A // 8642
@13 // 8643
M=D // 8644
@Output.initMap.ret.49 // 8645
D=A // 8646
@CALL // 8647
0;JMP // 8648
(Output.initMap.ret.49)
@SP // 8649
AM=M-1 // 8650
D=M // 8651
@5 // 8652
M=D // 8653
@80 // 8654
D=A // 8655
@SP // 8656
AM=M+1 // 8657
A=A-1 // 8658
M=D // 8659
@31 // 8660
D=A // 8661
@SP // 8662
AM=M+1 // 8663
A=A-1 // 8664
M=D // 8665
@51 // 8666
D=A // 8667
@SP // 8668
AM=M+1 // 8669
A=A-1 // 8670
M=D // 8671
@51 // 8672
D=A // 8673
@SP // 8674
AM=M+1 // 8675
A=A-1 // 8676
M=D // 8677
@51 // 8678
D=A // 8679
@SP // 8680
AM=M+1 // 8681
A=A-1 // 8682
M=D // 8683
@31 // 8684
D=A // 8685
@SP // 8686
AM=M+1 // 8687
A=A-1 // 8688
M=D // 8689
@3 // 8690
D=A // 8691
@SP // 8692
AM=M+1 // 8693
A=A-1 // 8694
M=D // 8695
@3 // 8696
D=A // 8697
@SP // 8698
AM=M+1 // 8699
A=A-1 // 8700
M=D // 8701
@3 // 8702
D=A // 8703
@SP // 8704
AM=M+1 // 8705
A=A-1 // 8706
M=D // 8707
@3 // 8708
D=A // 8709
@SP // 8710
AM=M+1 // 8711
A=A-1 // 8712
M=D // 8713
@SP // 8714
AM=M+1 // 8715
A=A-1 // 8716
M=0 // 8717
@SP // 8718
AM=M+1 // 8719
A=A-1 // 8720
M=0 // 8721
// call Output.create
@17 // 8722
D=A // 8723
@14 // 8724
M=D // 8725
@Output.create // 8726
D=A // 8727
@13 // 8728
M=D // 8729
@Output.initMap.ret.50 // 8730
D=A // 8731
@CALL // 8732
0;JMP // 8733
(Output.initMap.ret.50)
@SP // 8734
AM=M-1 // 8735
D=M // 8736
@5 // 8737
M=D // 8738
@81 // 8739
D=A // 8740
@SP // 8741
AM=M+1 // 8742
A=A-1 // 8743
M=D // 8744
@30 // 8745
D=A // 8746
@SP // 8747
AM=M+1 // 8748
A=A-1 // 8749
M=D // 8750
@51 // 8751
D=A // 8752
@SP // 8753
AM=M+1 // 8754
A=A-1 // 8755
M=D // 8756
@51 // 8757
D=A // 8758
@SP // 8759
AM=M+1 // 8760
A=A-1 // 8761
M=D // 8762
@51 // 8763
D=A // 8764
@SP // 8765
AM=M+1 // 8766
A=A-1 // 8767
M=D // 8768
@51 // 8769
D=A // 8770
@SP // 8771
AM=M+1 // 8772
A=A-1 // 8773
M=D // 8774
@51 // 8775
D=A // 8776
@SP // 8777
AM=M+1 // 8778
A=A-1 // 8779
M=D // 8780
@63 // 8781
D=A // 8782
@SP // 8783
AM=M+1 // 8784
A=A-1 // 8785
M=D // 8786
@59 // 8787
D=A // 8788
@SP // 8789
AM=M+1 // 8790
A=A-1 // 8791
M=D // 8792
@30 // 8793
D=A // 8794
@SP // 8795
AM=M+1 // 8796
A=A-1 // 8797
M=D // 8798
@48 // 8799
D=A // 8800
@SP // 8801
AM=M+1 // 8802
A=A-1 // 8803
M=D // 8804
@SP // 8805
AM=M+1 // 8806
A=A-1 // 8807
M=0 // 8808
// call Output.create
@17 // 8809
D=A // 8810
@14 // 8811
M=D // 8812
@Output.create // 8813
D=A // 8814
@13 // 8815
M=D // 8816
@Output.initMap.ret.51 // 8817
D=A // 8818
@CALL // 8819
0;JMP // 8820
(Output.initMap.ret.51)
@SP // 8821
AM=M-1 // 8822
D=M // 8823
@5 // 8824
M=D // 8825
@82 // 8826
D=A // 8827
@SP // 8828
AM=M+1 // 8829
A=A-1 // 8830
M=D // 8831
@31 // 8832
D=A // 8833
@SP // 8834
AM=M+1 // 8835
A=A-1 // 8836
M=D // 8837
@51 // 8838
D=A // 8839
@SP // 8840
AM=M+1 // 8841
A=A-1 // 8842
M=D // 8843
@51 // 8844
D=A // 8845
@SP // 8846
AM=M+1 // 8847
A=A-1 // 8848
M=D // 8849
@51 // 8850
D=A // 8851
@SP // 8852
AM=M+1 // 8853
A=A-1 // 8854
M=D // 8855
@31 // 8856
D=A // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=D // 8861
@27 // 8862
D=A // 8863
@SP // 8864
AM=M+1 // 8865
A=A-1 // 8866
M=D // 8867
@51 // 8868
D=A // 8869
@SP // 8870
AM=M+1 // 8871
A=A-1 // 8872
M=D // 8873
@51 // 8874
D=A // 8875
@SP // 8876
AM=M+1 // 8877
A=A-1 // 8878
M=D // 8879
@51 // 8880
D=A // 8881
@SP // 8882
AM=M+1 // 8883
A=A-1 // 8884
M=D // 8885
@SP // 8886
AM=M+1 // 8887
A=A-1 // 8888
M=0 // 8889
@SP // 8890
AM=M+1 // 8891
A=A-1 // 8892
M=0 // 8893
// call Output.create
@17 // 8894
D=A // 8895
@14 // 8896
M=D // 8897
@Output.create // 8898
D=A // 8899
@13 // 8900
M=D // 8901
@Output.initMap.ret.52 // 8902
D=A // 8903
@CALL // 8904
0;JMP // 8905
(Output.initMap.ret.52)
@SP // 8906
AM=M-1 // 8907
D=M // 8908
@5 // 8909
M=D // 8910
@83 // 8911
D=A // 8912
@SP // 8913
AM=M+1 // 8914
A=A-1 // 8915
M=D // 8916
@30 // 8917
D=A // 8918
@SP // 8919
AM=M+1 // 8920
A=A-1 // 8921
M=D // 8922
@51 // 8923
D=A // 8924
@SP // 8925
AM=M+1 // 8926
A=A-1 // 8927
M=D // 8928
@51 // 8929
D=A // 8930
@SP // 8931
AM=M+1 // 8932
A=A-1 // 8933
M=D // 8934
@6 // 8935
D=A // 8936
@SP // 8937
AM=M+1 // 8938
A=A-1 // 8939
M=D // 8940
@28 // 8941
D=A // 8942
@SP // 8943
AM=M+1 // 8944
A=A-1 // 8945
M=D // 8946
@48 // 8947
D=A // 8948
@SP // 8949
AM=M+1 // 8950
A=A-1 // 8951
M=D // 8952
@51 // 8953
D=A // 8954
@SP // 8955
AM=M+1 // 8956
A=A-1 // 8957
M=D // 8958
@51 // 8959
D=A // 8960
@SP // 8961
AM=M+1 // 8962
A=A-1 // 8963
M=D // 8964
@30 // 8965
D=A // 8966
@SP // 8967
AM=M+1 // 8968
A=A-1 // 8969
M=D // 8970
@SP // 8971
AM=M+1 // 8972
A=A-1 // 8973
M=0 // 8974
@SP // 8975
AM=M+1 // 8976
A=A-1 // 8977
M=0 // 8978
// call Output.create
@17 // 8979
D=A // 8980
@14 // 8981
M=D // 8982
@Output.create // 8983
D=A // 8984
@13 // 8985
M=D // 8986
@Output.initMap.ret.53 // 8987
D=A // 8988
@CALL // 8989
0;JMP // 8990
(Output.initMap.ret.53)
@SP // 8991
AM=M-1 // 8992
D=M // 8993
@5 // 8994
M=D // 8995
@84 // 8996
D=A // 8997
@SP // 8998
AM=M+1 // 8999
A=A-1 // 9000
M=D // 9001
@63 // 9002
D=A // 9003
@SP // 9004
AM=M+1 // 9005
A=A-1 // 9006
M=D // 9007
@63 // 9008
D=A // 9009
@SP // 9010
AM=M+1 // 9011
A=A-1 // 9012
M=D // 9013
@45 // 9014
D=A // 9015
@SP // 9016
AM=M+1 // 9017
A=A-1 // 9018
M=D // 9019
@12 // 9020
D=A // 9021
@SP // 9022
AM=M+1 // 9023
A=A-1 // 9024
M=D // 9025
@12 // 9026
D=A // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=D // 9031
@12 // 9032
D=A // 9033
@SP // 9034
AM=M+1 // 9035
A=A-1 // 9036
M=D // 9037
@12 // 9038
D=A // 9039
@SP // 9040
AM=M+1 // 9041
A=A-1 // 9042
M=D // 9043
@12 // 9044
D=A // 9045
@SP // 9046
AM=M+1 // 9047
A=A-1 // 9048
M=D // 9049
@30 // 9050
D=A // 9051
@SP // 9052
AM=M+1 // 9053
A=A-1 // 9054
M=D // 9055
@SP // 9056
AM=M+1 // 9057
A=A-1 // 9058
M=0 // 9059
@SP // 9060
AM=M+1 // 9061
A=A-1 // 9062
M=0 // 9063
// call Output.create
@17 // 9064
D=A // 9065
@14 // 9066
M=D // 9067
@Output.create // 9068
D=A // 9069
@13 // 9070
M=D // 9071
@Output.initMap.ret.54 // 9072
D=A // 9073
@CALL // 9074
0;JMP // 9075
(Output.initMap.ret.54)
@SP // 9076
AM=M-1 // 9077
D=M // 9078
@5 // 9079
M=D // 9080
@85 // 9081
D=A // 9082
@SP // 9083
AM=M+1 // 9084
A=A-1 // 9085
M=D // 9086
@51 // 9087
D=A // 9088
@SP // 9089
AM=M+1 // 9090
A=A-1 // 9091
M=D // 9092
@51 // 9093
D=A // 9094
@SP // 9095
AM=M+1 // 9096
A=A-1 // 9097
M=D // 9098
@51 // 9099
D=A // 9100
@SP // 9101
AM=M+1 // 9102
A=A-1 // 9103
M=D // 9104
@51 // 9105
D=A // 9106
@SP // 9107
AM=M+1 // 9108
A=A-1 // 9109
M=D // 9110
@51 // 9111
D=A // 9112
@SP // 9113
AM=M+1 // 9114
A=A-1 // 9115
M=D // 9116
@51 // 9117
D=A // 9118
@SP // 9119
AM=M+1 // 9120
A=A-1 // 9121
M=D // 9122
@51 // 9123
D=A // 9124
@SP // 9125
AM=M+1 // 9126
A=A-1 // 9127
M=D // 9128
@51 // 9129
D=A // 9130
@SP // 9131
AM=M+1 // 9132
A=A-1 // 9133
M=D // 9134
@30 // 9135
D=A // 9136
@SP // 9137
AM=M+1 // 9138
A=A-1 // 9139
M=D // 9140
@SP // 9141
AM=M+1 // 9142
A=A-1 // 9143
M=0 // 9144
@SP // 9145
AM=M+1 // 9146
A=A-1 // 9147
M=0 // 9148
// call Output.create
@17 // 9149
D=A // 9150
@14 // 9151
M=D // 9152
@Output.create // 9153
D=A // 9154
@13 // 9155
M=D // 9156
@Output.initMap.ret.55 // 9157
D=A // 9158
@CALL // 9159
0;JMP // 9160
(Output.initMap.ret.55)
@SP // 9161
AM=M-1 // 9162
D=M // 9163
@5 // 9164
M=D // 9165
@86 // 9166
D=A // 9167
@SP // 9168
AM=M+1 // 9169
A=A-1 // 9170
M=D // 9171
@51 // 9172
D=A // 9173
@SP // 9174
AM=M+1 // 9175
A=A-1 // 9176
M=D // 9177
@51 // 9178
D=A // 9179
@SP // 9180
AM=M+1 // 9181
A=A-1 // 9182
M=D // 9183
@51 // 9184
D=A // 9185
@SP // 9186
AM=M+1 // 9187
A=A-1 // 9188
M=D // 9189
@51 // 9190
D=A // 9191
@SP // 9192
AM=M+1 // 9193
A=A-1 // 9194
M=D // 9195
@51 // 9196
D=A // 9197
@SP // 9198
AM=M+1 // 9199
A=A-1 // 9200
M=D // 9201
@30 // 9202
D=A // 9203
@SP // 9204
AM=M+1 // 9205
A=A-1 // 9206
M=D // 9207
@30 // 9208
D=A // 9209
@SP // 9210
AM=M+1 // 9211
A=A-1 // 9212
M=D // 9213
@12 // 9214
D=A // 9215
@SP // 9216
AM=M+1 // 9217
A=A-1 // 9218
M=D // 9219
@12 // 9220
D=A // 9221
@SP // 9222
AM=M+1 // 9223
A=A-1 // 9224
M=D // 9225
@SP // 9226
AM=M+1 // 9227
A=A-1 // 9228
M=0 // 9229
@SP // 9230
AM=M+1 // 9231
A=A-1 // 9232
M=0 // 9233
// call Output.create
@17 // 9234
D=A // 9235
@14 // 9236
M=D // 9237
@Output.create // 9238
D=A // 9239
@13 // 9240
M=D // 9241
@Output.initMap.ret.56 // 9242
D=A // 9243
@CALL // 9244
0;JMP // 9245
(Output.initMap.ret.56)
@SP // 9246
AM=M-1 // 9247
D=M // 9248
@5 // 9249
M=D // 9250
@87 // 9251
D=A // 9252
@SP // 9253
AM=M+1 // 9254
A=A-1 // 9255
M=D // 9256
@51 // 9257
D=A // 9258
@SP // 9259
AM=M+1 // 9260
A=A-1 // 9261
M=D // 9262
@51 // 9263
D=A // 9264
@SP // 9265
AM=M+1 // 9266
A=A-1 // 9267
M=D // 9268
@51 // 9269
D=A // 9270
@SP // 9271
AM=M+1 // 9272
A=A-1 // 9273
M=D // 9274
@51 // 9275
D=A // 9276
@SP // 9277
AM=M+1 // 9278
A=A-1 // 9279
M=D // 9280
@51 // 9281
D=A // 9282
@SP // 9283
AM=M+1 // 9284
A=A-1 // 9285
M=D // 9286
@63 // 9287
D=A // 9288
@SP // 9289
AM=M+1 // 9290
A=A-1 // 9291
M=D // 9292
@63 // 9293
D=A // 9294
@SP // 9295
AM=M+1 // 9296
A=A-1 // 9297
M=D // 9298
@63 // 9299
D=A // 9300
@SP // 9301
AM=M+1 // 9302
A=A-1 // 9303
M=D // 9304
@18 // 9305
D=A // 9306
@SP // 9307
AM=M+1 // 9308
A=A-1 // 9309
M=D // 9310
@SP // 9311
AM=M+1 // 9312
A=A-1 // 9313
M=0 // 9314
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=0 // 9318
// call Output.create
@17 // 9319
D=A // 9320
@14 // 9321
M=D // 9322
@Output.create // 9323
D=A // 9324
@13 // 9325
M=D // 9326
@Output.initMap.ret.57 // 9327
D=A // 9328
@CALL // 9329
0;JMP // 9330
(Output.initMap.ret.57)
@SP // 9331
AM=M-1 // 9332
D=M // 9333
@5 // 9334
M=D // 9335
@88 // 9336
D=A // 9337
@SP // 9338
AM=M+1 // 9339
A=A-1 // 9340
M=D // 9341
@51 // 9342
D=A // 9343
@SP // 9344
AM=M+1 // 9345
A=A-1 // 9346
M=D // 9347
@51 // 9348
D=A // 9349
@SP // 9350
AM=M+1 // 9351
A=A-1 // 9352
M=D // 9353
@30 // 9354
D=A // 9355
@SP // 9356
AM=M+1 // 9357
A=A-1 // 9358
M=D // 9359
@30 // 9360
D=A // 9361
@SP // 9362
AM=M+1 // 9363
A=A-1 // 9364
M=D // 9365
@12 // 9366
D=A // 9367
@SP // 9368
AM=M+1 // 9369
A=A-1 // 9370
M=D // 9371
@30 // 9372
D=A // 9373
@SP // 9374
AM=M+1 // 9375
A=A-1 // 9376
M=D // 9377
@30 // 9378
D=A // 9379
@SP // 9380
AM=M+1 // 9381
A=A-1 // 9382
M=D // 9383
@51 // 9384
D=A // 9385
@SP // 9386
AM=M+1 // 9387
A=A-1 // 9388
M=D // 9389
@51 // 9390
D=A // 9391
@SP // 9392
AM=M+1 // 9393
A=A-1 // 9394
M=D // 9395
@SP // 9396
AM=M+1 // 9397
A=A-1 // 9398
M=0 // 9399
@SP // 9400
AM=M+1 // 9401
A=A-1 // 9402
M=0 // 9403
// call Output.create
@17 // 9404
D=A // 9405
@14 // 9406
M=D // 9407
@Output.create // 9408
D=A // 9409
@13 // 9410
M=D // 9411
@Output.initMap.ret.58 // 9412
D=A // 9413
@CALL // 9414
0;JMP // 9415
(Output.initMap.ret.58)
@SP // 9416
AM=M-1 // 9417
D=M // 9418
@5 // 9419
M=D // 9420
@89 // 9421
D=A // 9422
@SP // 9423
AM=M+1 // 9424
A=A-1 // 9425
M=D // 9426
@51 // 9427
D=A // 9428
@SP // 9429
AM=M+1 // 9430
A=A-1 // 9431
M=D // 9432
@51 // 9433
D=A // 9434
@SP // 9435
AM=M+1 // 9436
A=A-1 // 9437
M=D // 9438
@51 // 9439
D=A // 9440
@SP // 9441
AM=M+1 // 9442
A=A-1 // 9443
M=D // 9444
@51 // 9445
D=A // 9446
@SP // 9447
AM=M+1 // 9448
A=A-1 // 9449
M=D // 9450
@30 // 9451
D=A // 9452
@SP // 9453
AM=M+1 // 9454
A=A-1 // 9455
M=D // 9456
@12 // 9457
D=A // 9458
@SP // 9459
AM=M+1 // 9460
A=A-1 // 9461
M=D // 9462
@12 // 9463
D=A // 9464
@SP // 9465
AM=M+1 // 9466
A=A-1 // 9467
M=D // 9468
@12 // 9469
D=A // 9470
@SP // 9471
AM=M+1 // 9472
A=A-1 // 9473
M=D // 9474
@30 // 9475
D=A // 9476
@SP // 9477
AM=M+1 // 9478
A=A-1 // 9479
M=D // 9480
@SP // 9481
AM=M+1 // 9482
A=A-1 // 9483
M=0 // 9484
@SP // 9485
AM=M+1 // 9486
A=A-1 // 9487
M=0 // 9488
// call Output.create
@17 // 9489
D=A // 9490
@14 // 9491
M=D // 9492
@Output.create // 9493
D=A // 9494
@13 // 9495
M=D // 9496
@Output.initMap.ret.59 // 9497
D=A // 9498
@CALL // 9499
0;JMP // 9500
(Output.initMap.ret.59)
@SP // 9501
AM=M-1 // 9502
D=M // 9503
@5 // 9504
M=D // 9505
@90 // 9506
D=A // 9507
@SP // 9508
AM=M+1 // 9509
A=A-1 // 9510
M=D // 9511
@63 // 9512
D=A // 9513
@SP // 9514
AM=M+1 // 9515
A=A-1 // 9516
M=D // 9517
@51 // 9518
D=A // 9519
@SP // 9520
AM=M+1 // 9521
A=A-1 // 9522
M=D // 9523
@49 // 9524
D=A // 9525
@SP // 9526
AM=M+1 // 9527
A=A-1 // 9528
M=D // 9529
@24 // 9530
D=A // 9531
@SP // 9532
AM=M+1 // 9533
A=A-1 // 9534
M=D // 9535
@12 // 9536
D=A // 9537
@SP // 9538
AM=M+1 // 9539
A=A-1 // 9540
M=D // 9541
@6 // 9542
D=A // 9543
@SP // 9544
AM=M+1 // 9545
A=A-1 // 9546
M=D // 9547
@35 // 9548
D=A // 9549
@SP // 9550
AM=M+1 // 9551
A=A-1 // 9552
M=D // 9553
@51 // 9554
D=A // 9555
@SP // 9556
AM=M+1 // 9557
A=A-1 // 9558
M=D // 9559
@63 // 9560
D=A // 9561
@SP // 9562
AM=M+1 // 9563
A=A-1 // 9564
M=D // 9565
@SP // 9566
AM=M+1 // 9567
A=A-1 // 9568
M=0 // 9569
@SP // 9570
AM=M+1 // 9571
A=A-1 // 9572
M=0 // 9573
// call Output.create
@17 // 9574
D=A // 9575
@14 // 9576
M=D // 9577
@Output.create // 9578
D=A // 9579
@13 // 9580
M=D // 9581
@Output.initMap.ret.60 // 9582
D=A // 9583
@CALL // 9584
0;JMP // 9585
(Output.initMap.ret.60)
@SP // 9586
AM=M-1 // 9587
D=M // 9588
@5 // 9589
M=D // 9590
@91 // 9591
D=A // 9592
@SP // 9593
AM=M+1 // 9594
A=A-1 // 9595
M=D // 9596
@30 // 9597
D=A // 9598
@SP // 9599
AM=M+1 // 9600
A=A-1 // 9601
M=D // 9602
@6 // 9603
D=A // 9604
@SP // 9605
AM=M+1 // 9606
A=A-1 // 9607
M=D // 9608
@6 // 9609
D=A // 9610
@SP // 9611
AM=M+1 // 9612
A=A-1 // 9613
M=D // 9614
@6 // 9615
D=A // 9616
@SP // 9617
AM=M+1 // 9618
A=A-1 // 9619
M=D // 9620
@6 // 9621
D=A // 9622
@SP // 9623
AM=M+1 // 9624
A=A-1 // 9625
M=D // 9626
@6 // 9627
D=A // 9628
@SP // 9629
AM=M+1 // 9630
A=A-1 // 9631
M=D // 9632
@6 // 9633
D=A // 9634
@SP // 9635
AM=M+1 // 9636
A=A-1 // 9637
M=D // 9638
@6 // 9639
D=A // 9640
@SP // 9641
AM=M+1 // 9642
A=A-1 // 9643
M=D // 9644
@30 // 9645
D=A // 9646
@SP // 9647
AM=M+1 // 9648
A=A-1 // 9649
M=D // 9650
@SP // 9651
AM=M+1 // 9652
A=A-1 // 9653
M=0 // 9654
@SP // 9655
AM=M+1 // 9656
A=A-1 // 9657
M=0 // 9658
// call Output.create
@17 // 9659
D=A // 9660
@14 // 9661
M=D // 9662
@Output.create // 9663
D=A // 9664
@13 // 9665
M=D // 9666
@Output.initMap.ret.61 // 9667
D=A // 9668
@CALL // 9669
0;JMP // 9670
(Output.initMap.ret.61)
@SP // 9671
AM=M-1 // 9672
D=M // 9673
@5 // 9674
M=D // 9675
@92 // 9676
D=A // 9677
@SP // 9678
AM=M+1 // 9679
A=A-1 // 9680
M=D // 9681
@SP // 9682
AM=M+1 // 9683
A=A-1 // 9684
M=0 // 9685
@SP // 9686
AM=M+1 // 9687
A=A-1 // 9688
M=0 // 9689
@SP // 9690
AM=M+1 // 9691
A=A-1 // 9692
M=1 // 9693
@3 // 9694
D=A // 9695
@SP // 9696
AM=M+1 // 9697
A=A-1 // 9698
M=D // 9699
@6 // 9700
D=A // 9701
@SP // 9702
AM=M+1 // 9703
A=A-1 // 9704
M=D // 9705
@12 // 9706
D=A // 9707
@SP // 9708
AM=M+1 // 9709
A=A-1 // 9710
M=D // 9711
@24 // 9712
D=A // 9713
@SP // 9714
AM=M+1 // 9715
A=A-1 // 9716
M=D // 9717
@48 // 9718
D=A // 9719
@SP // 9720
AM=M+1 // 9721
A=A-1 // 9722
M=D // 9723
@32 // 9724
D=A // 9725
@SP // 9726
AM=M+1 // 9727
A=A-1 // 9728
M=D // 9729
@SP // 9730
AM=M+1 // 9731
A=A-1 // 9732
M=0 // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=0 // 9737
// call Output.create
@17 // 9738
D=A // 9739
@14 // 9740
M=D // 9741
@Output.create // 9742
D=A // 9743
@13 // 9744
M=D // 9745
@Output.initMap.ret.62 // 9746
D=A // 9747
@CALL // 9748
0;JMP // 9749
(Output.initMap.ret.62)
@SP // 9750
AM=M-1 // 9751
D=M // 9752
@5 // 9753
M=D // 9754
@93 // 9755
D=A // 9756
@SP // 9757
AM=M+1 // 9758
A=A-1 // 9759
M=D // 9760
@30 // 9761
D=A // 9762
@SP // 9763
AM=M+1 // 9764
A=A-1 // 9765
M=D // 9766
@24 // 9767
D=A // 9768
@SP // 9769
AM=M+1 // 9770
A=A-1 // 9771
M=D // 9772
@24 // 9773
D=A // 9774
@SP // 9775
AM=M+1 // 9776
A=A-1 // 9777
M=D // 9778
@24 // 9779
D=A // 9780
@SP // 9781
AM=M+1 // 9782
A=A-1 // 9783
M=D // 9784
@24 // 9785
D=A // 9786
@SP // 9787
AM=M+1 // 9788
A=A-1 // 9789
M=D // 9790
@24 // 9791
D=A // 9792
@SP // 9793
AM=M+1 // 9794
A=A-1 // 9795
M=D // 9796
@24 // 9797
D=A // 9798
@SP // 9799
AM=M+1 // 9800
A=A-1 // 9801
M=D // 9802
@24 // 9803
D=A // 9804
@SP // 9805
AM=M+1 // 9806
A=A-1 // 9807
M=D // 9808
@30 // 9809
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
// call Output.create
@17 // 9823
D=A // 9824
@14 // 9825
M=D // 9826
@Output.create // 9827
D=A // 9828
@13 // 9829
M=D // 9830
@Output.initMap.ret.63 // 9831
D=A // 9832
@CALL // 9833
0;JMP // 9834
(Output.initMap.ret.63)
@SP // 9835
AM=M-1 // 9836
D=M // 9837
@5 // 9838
M=D // 9839
@94 // 9840
D=A // 9841
@SP // 9842
AM=M+1 // 9843
A=A-1 // 9844
M=D // 9845
@8 // 9846
D=A // 9847
@SP // 9848
AM=M+1 // 9849
A=A-1 // 9850
M=D // 9851
@28 // 9852
D=A // 9853
@SP // 9854
AM=M+1 // 9855
A=A-1 // 9856
M=D // 9857
@54 // 9858
D=A // 9859
@SP // 9860
AM=M+1 // 9861
A=A-1 // 9862
M=D // 9863
@SP // 9864
AM=M+1 // 9865
A=A-1 // 9866
M=0 // 9867
@SP // 9868
AM=M+1 // 9869
A=A-1 // 9870
M=0 // 9871
@SP // 9872
AM=M+1 // 9873
A=A-1 // 9874
M=0 // 9875
@SP // 9876
AM=M+1 // 9877
A=A-1 // 9878
M=0 // 9879
@SP // 9880
AM=M+1 // 9881
A=A-1 // 9882
M=0 // 9883
@SP // 9884
AM=M+1 // 9885
A=A-1 // 9886
M=0 // 9887
@SP // 9888
AM=M+1 // 9889
A=A-1 // 9890
M=0 // 9891
@SP // 9892
AM=M+1 // 9893
A=A-1 // 9894
M=0 // 9895
// call Output.create
@17 // 9896
D=A // 9897
@14 // 9898
M=D // 9899
@Output.create // 9900
D=A // 9901
@13 // 9902
M=D // 9903
@Output.initMap.ret.64 // 9904
D=A // 9905
@CALL // 9906
0;JMP // 9907
(Output.initMap.ret.64)
@SP // 9908
AM=M-1 // 9909
D=M // 9910
@5 // 9911
M=D // 9912
@95 // 9913
D=A // 9914
@SP // 9915
AM=M+1 // 9916
A=A-1 // 9917
M=D // 9918
@SP // 9919
AM=M+1 // 9920
A=A-1 // 9921
M=0 // 9922
@SP // 9923
AM=M+1 // 9924
A=A-1 // 9925
M=0 // 9926
@SP // 9927
AM=M+1 // 9928
A=A-1 // 9929
M=0 // 9930
@SP // 9931
AM=M+1 // 9932
A=A-1 // 9933
M=0 // 9934
@SP // 9935
AM=M+1 // 9936
A=A-1 // 9937
M=0 // 9938
@SP // 9939
AM=M+1 // 9940
A=A-1 // 9941
M=0 // 9942
@SP // 9943
AM=M+1 // 9944
A=A-1 // 9945
M=0 // 9946
@SP // 9947
AM=M+1 // 9948
A=A-1 // 9949
M=0 // 9950
@SP // 9951
AM=M+1 // 9952
A=A-1 // 9953
M=0 // 9954
@63 // 9955
D=A // 9956
@SP // 9957
AM=M+1 // 9958
A=A-1 // 9959
M=D // 9960
@SP // 9961
AM=M+1 // 9962
A=A-1 // 9963
M=0 // 9964
// call Output.create
@17 // 9965
D=A // 9966
@14 // 9967
M=D // 9968
@Output.create // 9969
D=A // 9970
@13 // 9971
M=D // 9972
@Output.initMap.ret.65 // 9973
D=A // 9974
@CALL // 9975
0;JMP // 9976
(Output.initMap.ret.65)
@SP // 9977
AM=M-1 // 9978
D=M // 9979
@5 // 9980
M=D // 9981
@96 // 9982
D=A // 9983
@SP // 9984
AM=M+1 // 9985
A=A-1 // 9986
M=D // 9987
@6 // 9988
D=A // 9989
@SP // 9990
AM=M+1 // 9991
A=A-1 // 9992
M=D // 9993
@12 // 9994
D=A // 9995
@SP // 9996
AM=M+1 // 9997
A=A-1 // 9998
M=D // 9999
@24 // 10000
D=A // 10001
@SP // 10002
AM=M+1 // 10003
A=A-1 // 10004
M=D // 10005
@SP // 10006
AM=M+1 // 10007
A=A-1 // 10008
M=0 // 10009
@SP // 10010
AM=M+1 // 10011
A=A-1 // 10012
M=0 // 10013
@SP // 10014
AM=M+1 // 10015
A=A-1 // 10016
M=0 // 10017
@SP // 10018
AM=M+1 // 10019
A=A-1 // 10020
M=0 // 10021
@SP // 10022
AM=M+1 // 10023
A=A-1 // 10024
M=0 // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=0 // 10029
@SP // 10030
AM=M+1 // 10031
A=A-1 // 10032
M=0 // 10033
@SP // 10034
AM=M+1 // 10035
A=A-1 // 10036
M=0 // 10037
// call Output.create
@17 // 10038
D=A // 10039
@14 // 10040
M=D // 10041
@Output.create // 10042
D=A // 10043
@13 // 10044
M=D // 10045
@Output.initMap.ret.66 // 10046
D=A // 10047
@CALL // 10048
0;JMP // 10049
(Output.initMap.ret.66)
@SP // 10050
AM=M-1 // 10051
D=M // 10052
@5 // 10053
M=D // 10054
@97 // 10055
D=A // 10056
@SP // 10057
AM=M+1 // 10058
A=A-1 // 10059
M=D // 10060
@SP // 10061
AM=M+1 // 10062
A=A-1 // 10063
M=0 // 10064
@SP // 10065
AM=M+1 // 10066
A=A-1 // 10067
M=0 // 10068
@SP // 10069
AM=M+1 // 10070
A=A-1 // 10071
M=0 // 10072
@14 // 10073
D=A // 10074
@SP // 10075
AM=M+1 // 10076
A=A-1 // 10077
M=D // 10078
@24 // 10079
D=A // 10080
@SP // 10081
AM=M+1 // 10082
A=A-1 // 10083
M=D // 10084
@30 // 10085
D=A // 10086
@SP // 10087
AM=M+1 // 10088
A=A-1 // 10089
M=D // 10090
@27 // 10091
D=A // 10092
@SP // 10093
AM=M+1 // 10094
A=A-1 // 10095
M=D // 10096
@27 // 10097
D=A // 10098
@SP // 10099
AM=M+1 // 10100
A=A-1 // 10101
M=D // 10102
@54 // 10103
D=A // 10104
@SP // 10105
AM=M+1 // 10106
A=A-1 // 10107
M=D // 10108
@SP // 10109
AM=M+1 // 10110
A=A-1 // 10111
M=0 // 10112
@SP // 10113
AM=M+1 // 10114
A=A-1 // 10115
M=0 // 10116
// call Output.create
@17 // 10117
D=A // 10118
@14 // 10119
M=D // 10120
@Output.create // 10121
D=A // 10122
@13 // 10123
M=D // 10124
@Output.initMap.ret.67 // 10125
D=A // 10126
@CALL // 10127
0;JMP // 10128
(Output.initMap.ret.67)
@SP // 10129
AM=M-1 // 10130
D=M // 10131
@5 // 10132
M=D // 10133
@98 // 10134
D=A // 10135
@SP // 10136
AM=M+1 // 10137
A=A-1 // 10138
M=D // 10139
@3 // 10140
D=A // 10141
@SP // 10142
AM=M+1 // 10143
A=A-1 // 10144
M=D // 10145
@3 // 10146
D=A // 10147
@SP // 10148
AM=M+1 // 10149
A=A-1 // 10150
M=D // 10151
@3 // 10152
D=A // 10153
@SP // 10154
AM=M+1 // 10155
A=A-1 // 10156
M=D // 10157
@15 // 10158
D=A // 10159
@SP // 10160
AM=M+1 // 10161
A=A-1 // 10162
M=D // 10163
@27 // 10164
D=A // 10165
@SP // 10166
AM=M+1 // 10167
A=A-1 // 10168
M=D // 10169
@51 // 10170
D=A // 10171
@SP // 10172
AM=M+1 // 10173
A=A-1 // 10174
M=D // 10175
@51 // 10176
D=A // 10177
@SP // 10178
AM=M+1 // 10179
A=A-1 // 10180
M=D // 10181
@51 // 10182
D=A // 10183
@SP // 10184
AM=M+1 // 10185
A=A-1 // 10186
M=D // 10187
@30 // 10188
D=A // 10189
@SP // 10190
AM=M+1 // 10191
A=A-1 // 10192
M=D // 10193
@SP // 10194
AM=M+1 // 10195
A=A-1 // 10196
M=0 // 10197
@SP // 10198
AM=M+1 // 10199
A=A-1 // 10200
M=0 // 10201
// call Output.create
@17 // 10202
D=A // 10203
@14 // 10204
M=D // 10205
@Output.create // 10206
D=A // 10207
@13 // 10208
M=D // 10209
@Output.initMap.ret.68 // 10210
D=A // 10211
@CALL // 10212
0;JMP // 10213
(Output.initMap.ret.68)
@SP // 10214
AM=M-1 // 10215
D=M // 10216
@5 // 10217
M=D // 10218
@99 // 10219
D=A // 10220
@SP // 10221
AM=M+1 // 10222
A=A-1 // 10223
M=D // 10224
@SP // 10225
AM=M+1 // 10226
A=A-1 // 10227
M=0 // 10228
@SP // 10229
AM=M+1 // 10230
A=A-1 // 10231
M=0 // 10232
@SP // 10233
AM=M+1 // 10234
A=A-1 // 10235
M=0 // 10236
@30 // 10237
D=A // 10238
@SP // 10239
AM=M+1 // 10240
A=A-1 // 10241
M=D // 10242
@51 // 10243
D=A // 10244
@SP // 10245
AM=M+1 // 10246
A=A-1 // 10247
M=D // 10248
@3 // 10249
D=A // 10250
@SP // 10251
AM=M+1 // 10252
A=A-1 // 10253
M=D // 10254
@3 // 10255
D=A // 10256
@SP // 10257
AM=M+1 // 10258
A=A-1 // 10259
M=D // 10260
@51 // 10261
D=A // 10262
@SP // 10263
AM=M+1 // 10264
A=A-1 // 10265
M=D // 10266
@30 // 10267
D=A // 10268
@SP // 10269
AM=M+1 // 10270
A=A-1 // 10271
M=D // 10272
@SP // 10273
AM=M+1 // 10274
A=A-1 // 10275
M=0 // 10276
@SP // 10277
AM=M+1 // 10278
A=A-1 // 10279
M=0 // 10280
// call Output.create
@17 // 10281
D=A // 10282
@14 // 10283
M=D // 10284
@Output.create // 10285
D=A // 10286
@13 // 10287
M=D // 10288
@Output.initMap.ret.69 // 10289
D=A // 10290
@CALL // 10291
0;JMP // 10292
(Output.initMap.ret.69)
@SP // 10293
AM=M-1 // 10294
D=M // 10295
@5 // 10296
M=D // 10297
@100 // 10298
D=A // 10299
@SP // 10300
AM=M+1 // 10301
A=A-1 // 10302
M=D // 10303
@48 // 10304
D=A // 10305
@SP // 10306
AM=M+1 // 10307
A=A-1 // 10308
M=D // 10309
@48 // 10310
D=A // 10311
@SP // 10312
AM=M+1 // 10313
A=A-1 // 10314
M=D // 10315
@48 // 10316
D=A // 10317
@SP // 10318
AM=M+1 // 10319
A=A-1 // 10320
M=D // 10321
@60 // 10322
D=A // 10323
@SP // 10324
AM=M+1 // 10325
A=A-1 // 10326
M=D // 10327
@54 // 10328
D=A // 10329
@SP // 10330
AM=M+1 // 10331
A=A-1 // 10332
M=D // 10333
@51 // 10334
D=A // 10335
@SP // 10336
AM=M+1 // 10337
A=A-1 // 10338
M=D // 10339
@51 // 10340
D=A // 10341
@SP // 10342
AM=M+1 // 10343
A=A-1 // 10344
M=D // 10345
@51 // 10346
D=A // 10347
@SP // 10348
AM=M+1 // 10349
A=A-1 // 10350
M=D // 10351
@30 // 10352
D=A // 10353
@SP // 10354
AM=M+1 // 10355
A=A-1 // 10356
M=D // 10357
@SP // 10358
AM=M+1 // 10359
A=A-1 // 10360
M=0 // 10361
@SP // 10362
AM=M+1 // 10363
A=A-1 // 10364
M=0 // 10365
// call Output.create
@17 // 10366
D=A // 10367
@14 // 10368
M=D // 10369
@Output.create // 10370
D=A // 10371
@13 // 10372
M=D // 10373
@Output.initMap.ret.70 // 10374
D=A // 10375
@CALL // 10376
0;JMP // 10377
(Output.initMap.ret.70)
@SP // 10378
AM=M-1 // 10379
D=M // 10380
@5 // 10381
M=D // 10382
@101 // 10383
D=A // 10384
@SP // 10385
AM=M+1 // 10386
A=A-1 // 10387
M=D // 10388
@SP // 10389
AM=M+1 // 10390
A=A-1 // 10391
M=0 // 10392
@SP // 10393
AM=M+1 // 10394
A=A-1 // 10395
M=0 // 10396
@SP // 10397
AM=M+1 // 10398
A=A-1 // 10399
M=0 // 10400
@30 // 10401
D=A // 10402
@SP // 10403
AM=M+1 // 10404
A=A-1 // 10405
M=D // 10406
@51 // 10407
D=A // 10408
@SP // 10409
AM=M+1 // 10410
A=A-1 // 10411
M=D // 10412
@63 // 10413
D=A // 10414
@SP // 10415
AM=M+1 // 10416
A=A-1 // 10417
M=D // 10418
@3 // 10419
D=A // 10420
@SP // 10421
AM=M+1 // 10422
A=A-1 // 10423
M=D // 10424
@51 // 10425
D=A // 10426
@SP // 10427
AM=M+1 // 10428
A=A-1 // 10429
M=D // 10430
@30 // 10431
D=A // 10432
@SP // 10433
AM=M+1 // 10434
A=A-1 // 10435
M=D // 10436
@SP // 10437
AM=M+1 // 10438
A=A-1 // 10439
M=0 // 10440
@SP // 10441
AM=M+1 // 10442
A=A-1 // 10443
M=0 // 10444
// call Output.create
@17 // 10445
D=A // 10446
@14 // 10447
M=D // 10448
@Output.create // 10449
D=A // 10450
@13 // 10451
M=D // 10452
@Output.initMap.ret.71 // 10453
D=A // 10454
@CALL // 10455
0;JMP // 10456
(Output.initMap.ret.71)
@SP // 10457
AM=M-1 // 10458
D=M // 10459
@5 // 10460
M=D // 10461
@102 // 10462
D=A // 10463
@SP // 10464
AM=M+1 // 10465
A=A-1 // 10466
M=D // 10467
@28 // 10468
D=A // 10469
@SP // 10470
AM=M+1 // 10471
A=A-1 // 10472
M=D // 10473
@54 // 10474
D=A // 10475
@SP // 10476
AM=M+1 // 10477
A=A-1 // 10478
M=D // 10479
@38 // 10480
D=A // 10481
@SP // 10482
AM=M+1 // 10483
A=A-1 // 10484
M=D // 10485
@6 // 10486
D=A // 10487
@SP // 10488
AM=M+1 // 10489
A=A-1 // 10490
M=D // 10491
@15 // 10492
D=A // 10493
@SP // 10494
AM=M+1 // 10495
A=A-1 // 10496
M=D // 10497
@6 // 10498
D=A // 10499
@SP // 10500
AM=M+1 // 10501
A=A-1 // 10502
M=D // 10503
@6 // 10504
D=A // 10505
@SP // 10506
AM=M+1 // 10507
A=A-1 // 10508
M=D // 10509
@6 // 10510
D=A // 10511
@SP // 10512
AM=M+1 // 10513
A=A-1 // 10514
M=D // 10515
@15 // 10516
D=A // 10517
@SP // 10518
AM=M+1 // 10519
A=A-1 // 10520
M=D // 10521
@SP // 10522
AM=M+1 // 10523
A=A-1 // 10524
M=0 // 10525
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=0 // 10529
// call Output.create
@17 // 10530
D=A // 10531
@14 // 10532
M=D // 10533
@Output.create // 10534
D=A // 10535
@13 // 10536
M=D // 10537
@Output.initMap.ret.72 // 10538
D=A // 10539
@CALL // 10540
0;JMP // 10541
(Output.initMap.ret.72)
@SP // 10542
AM=M-1 // 10543
D=M // 10544
@5 // 10545
M=D // 10546
@103 // 10547
D=A // 10548
@SP // 10549
AM=M+1 // 10550
A=A-1 // 10551
M=D // 10552
@SP // 10553
AM=M+1 // 10554
A=A-1 // 10555
M=0 // 10556
@SP // 10557
AM=M+1 // 10558
A=A-1 // 10559
M=0 // 10560
@30 // 10561
D=A // 10562
@SP // 10563
AM=M+1 // 10564
A=A-1 // 10565
M=D // 10566
@51 // 10567
D=A // 10568
@SP // 10569
AM=M+1 // 10570
A=A-1 // 10571
M=D // 10572
@51 // 10573
D=A // 10574
@SP // 10575
AM=M+1 // 10576
A=A-1 // 10577
M=D // 10578
@51 // 10579
D=A // 10580
@SP // 10581
AM=M+1 // 10582
A=A-1 // 10583
M=D // 10584
@62 // 10585
D=A // 10586
@SP // 10587
AM=M+1 // 10588
A=A-1 // 10589
M=D // 10590
@48 // 10591
D=A // 10592
@SP // 10593
AM=M+1 // 10594
A=A-1 // 10595
M=D // 10596
@51 // 10597
D=A // 10598
@SP // 10599
AM=M+1 // 10600
A=A-1 // 10601
M=D // 10602
@30 // 10603
D=A // 10604
@SP // 10605
AM=M+1 // 10606
A=A-1 // 10607
M=D // 10608
@SP // 10609
AM=M+1 // 10610
A=A-1 // 10611
M=0 // 10612
// call Output.create
@17 // 10613
D=A // 10614
@14 // 10615
M=D // 10616
@Output.create // 10617
D=A // 10618
@13 // 10619
M=D // 10620
@Output.initMap.ret.73 // 10621
D=A // 10622
@CALL // 10623
0;JMP // 10624
(Output.initMap.ret.73)
@SP // 10625
AM=M-1 // 10626
D=M // 10627
@5 // 10628
M=D // 10629
@104 // 10630
D=A // 10631
@SP // 10632
AM=M+1 // 10633
A=A-1 // 10634
M=D // 10635
@3 // 10636
D=A // 10637
@SP // 10638
AM=M+1 // 10639
A=A-1 // 10640
M=D // 10641
@3 // 10642
D=A // 10643
@SP // 10644
AM=M+1 // 10645
A=A-1 // 10646
M=D // 10647
@3 // 10648
D=A // 10649
@SP // 10650
AM=M+1 // 10651
A=A-1 // 10652
M=D // 10653
@27 // 10654
D=A // 10655
@SP // 10656
AM=M+1 // 10657
A=A-1 // 10658
M=D // 10659
@55 // 10660
D=A // 10661
@SP // 10662
AM=M+1 // 10663
A=A-1 // 10664
M=D // 10665
@51 // 10666
D=A // 10667
@SP // 10668
AM=M+1 // 10669
A=A-1 // 10670
M=D // 10671
@51 // 10672
D=A // 10673
@SP // 10674
AM=M+1 // 10675
A=A-1 // 10676
M=D // 10677
@51 // 10678
D=A // 10679
@SP // 10680
AM=M+1 // 10681
A=A-1 // 10682
M=D // 10683
@51 // 10684
D=A // 10685
@SP // 10686
AM=M+1 // 10687
A=A-1 // 10688
M=D // 10689
@SP // 10690
AM=M+1 // 10691
A=A-1 // 10692
M=0 // 10693
@SP // 10694
AM=M+1 // 10695
A=A-1 // 10696
M=0 // 10697
// call Output.create
@17 // 10698
D=A // 10699
@14 // 10700
M=D // 10701
@Output.create // 10702
D=A // 10703
@13 // 10704
M=D // 10705
@Output.initMap.ret.74 // 10706
D=A // 10707
@CALL // 10708
0;JMP // 10709
(Output.initMap.ret.74)
@SP // 10710
AM=M-1 // 10711
D=M // 10712
@5 // 10713
M=D // 10714
@105 // 10715
D=A // 10716
@SP // 10717
AM=M+1 // 10718
A=A-1 // 10719
M=D // 10720
@12 // 10721
D=A // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=D // 10726
@12 // 10727
D=A // 10728
@SP // 10729
AM=M+1 // 10730
A=A-1 // 10731
M=D // 10732
@SP // 10733
AM=M+1 // 10734
A=A-1 // 10735
M=0 // 10736
@14 // 10737
D=A // 10738
@SP // 10739
AM=M+1 // 10740
A=A-1 // 10741
M=D // 10742
@12 // 10743
D=A // 10744
@SP // 10745
AM=M+1 // 10746
A=A-1 // 10747
M=D // 10748
@12 // 10749
D=A // 10750
@SP // 10751
AM=M+1 // 10752
A=A-1 // 10753
M=D // 10754
@12 // 10755
D=A // 10756
@SP // 10757
AM=M+1 // 10758
A=A-1 // 10759
M=D // 10760
@12 // 10761
D=A // 10762
@SP // 10763
AM=M+1 // 10764
A=A-1 // 10765
M=D // 10766
@30 // 10767
D=A // 10768
@SP // 10769
AM=M+1 // 10770
A=A-1 // 10771
M=D // 10772
@SP // 10773
AM=M+1 // 10774
A=A-1 // 10775
M=0 // 10776
@SP // 10777
AM=M+1 // 10778
A=A-1 // 10779
M=0 // 10780
// call Output.create
@17 // 10781
D=A // 10782
@14 // 10783
M=D // 10784
@Output.create // 10785
D=A // 10786
@13 // 10787
M=D // 10788
@Output.initMap.ret.75 // 10789
D=A // 10790
@CALL // 10791
0;JMP // 10792
(Output.initMap.ret.75)
@SP // 10793
AM=M-1 // 10794
D=M // 10795
@5 // 10796
M=D // 10797
@106 // 10798
D=A // 10799
@SP // 10800
AM=M+1 // 10801
A=A-1 // 10802
M=D // 10803
@48 // 10804
D=A // 10805
@SP // 10806
AM=M+1 // 10807
A=A-1 // 10808
M=D // 10809
@48 // 10810
D=A // 10811
@SP // 10812
AM=M+1 // 10813
A=A-1 // 10814
M=D // 10815
@SP // 10816
AM=M+1 // 10817
A=A-1 // 10818
M=0 // 10819
@56 // 10820
D=A // 10821
@SP // 10822
AM=M+1 // 10823
A=A-1 // 10824
M=D // 10825
@48 // 10826
D=A // 10827
@SP // 10828
AM=M+1 // 10829
A=A-1 // 10830
M=D // 10831
@48 // 10832
D=A // 10833
@SP // 10834
AM=M+1 // 10835
A=A-1 // 10836
M=D // 10837
@48 // 10838
D=A // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=D // 10843
@48 // 10844
D=A // 10845
@SP // 10846
AM=M+1 // 10847
A=A-1 // 10848
M=D // 10849
@51 // 10850
D=A // 10851
@SP // 10852
AM=M+1 // 10853
A=A-1 // 10854
M=D // 10855
@30 // 10856
D=A // 10857
@SP // 10858
AM=M+1 // 10859
A=A-1 // 10860
M=D // 10861
@SP // 10862
AM=M+1 // 10863
A=A-1 // 10864
M=0 // 10865
// call Output.create
@17 // 10866
D=A // 10867
@14 // 10868
M=D // 10869
@Output.create // 10870
D=A // 10871
@13 // 10872
M=D // 10873
@Output.initMap.ret.76 // 10874
D=A // 10875
@CALL // 10876
0;JMP // 10877
(Output.initMap.ret.76)
@SP // 10878
AM=M-1 // 10879
D=M // 10880
@5 // 10881
M=D // 10882
@107 // 10883
D=A // 10884
@SP // 10885
AM=M+1 // 10886
A=A-1 // 10887
M=D // 10888
@3 // 10889
D=A // 10890
@SP // 10891
AM=M+1 // 10892
A=A-1 // 10893
M=D // 10894
@3 // 10895
D=A // 10896
@SP // 10897
AM=M+1 // 10898
A=A-1 // 10899
M=D // 10900
@3 // 10901
D=A // 10902
@SP // 10903
AM=M+1 // 10904
A=A-1 // 10905
M=D // 10906
@51 // 10907
D=A // 10908
@SP // 10909
AM=M+1 // 10910
A=A-1 // 10911
M=D // 10912
@27 // 10913
D=A // 10914
@SP // 10915
AM=M+1 // 10916
A=A-1 // 10917
M=D // 10918
@15 // 10919
D=A // 10920
@SP // 10921
AM=M+1 // 10922
A=A-1 // 10923
M=D // 10924
@15 // 10925
D=A // 10926
@SP // 10927
AM=M+1 // 10928
A=A-1 // 10929
M=D // 10930
@27 // 10931
D=A // 10932
@SP // 10933
AM=M+1 // 10934
A=A-1 // 10935
M=D // 10936
@51 // 10937
D=A // 10938
@SP // 10939
AM=M+1 // 10940
A=A-1 // 10941
M=D // 10942
@SP // 10943
AM=M+1 // 10944
A=A-1 // 10945
M=0 // 10946
@SP // 10947
AM=M+1 // 10948
A=A-1 // 10949
M=0 // 10950
// call Output.create
@17 // 10951
D=A // 10952
@14 // 10953
M=D // 10954
@Output.create // 10955
D=A // 10956
@13 // 10957
M=D // 10958
@Output.initMap.ret.77 // 10959
D=A // 10960
@CALL // 10961
0;JMP // 10962
(Output.initMap.ret.77)
@SP // 10963
AM=M-1 // 10964
D=M // 10965
@5 // 10966
M=D // 10967
@108 // 10968
D=A // 10969
@SP // 10970
AM=M+1 // 10971
A=A-1 // 10972
M=D // 10973
@14 // 10974
D=A // 10975
@SP // 10976
AM=M+1 // 10977
A=A-1 // 10978
M=D // 10979
@12 // 10980
D=A // 10981
@SP // 10982
AM=M+1 // 10983
A=A-1 // 10984
M=D // 10985
@12 // 10986
D=A // 10987
@SP // 10988
AM=M+1 // 10989
A=A-1 // 10990
M=D // 10991
@12 // 10992
D=A // 10993
@SP // 10994
AM=M+1 // 10995
A=A-1 // 10996
M=D // 10997
@12 // 10998
D=A // 10999
@SP // 11000
AM=M+1 // 11001
A=A-1 // 11002
M=D // 11003
@12 // 11004
D=A // 11005
@SP // 11006
AM=M+1 // 11007
A=A-1 // 11008
M=D // 11009
@12 // 11010
D=A // 11011
@SP // 11012
AM=M+1 // 11013
A=A-1 // 11014
M=D // 11015
@12 // 11016
D=A // 11017
@SP // 11018
AM=M+1 // 11019
A=A-1 // 11020
M=D // 11021
@30 // 11022
D=A // 11023
@SP // 11024
AM=M+1 // 11025
A=A-1 // 11026
M=D // 11027
@SP // 11028
AM=M+1 // 11029
A=A-1 // 11030
M=0 // 11031
@SP // 11032
AM=M+1 // 11033
A=A-1 // 11034
M=0 // 11035
// call Output.create
@17 // 11036
D=A // 11037
@14 // 11038
M=D // 11039
@Output.create // 11040
D=A // 11041
@13 // 11042
M=D // 11043
@Output.initMap.ret.78 // 11044
D=A // 11045
@CALL // 11046
0;JMP // 11047
(Output.initMap.ret.78)
@SP // 11048
AM=M-1 // 11049
D=M // 11050
@5 // 11051
M=D // 11052
@109 // 11053
D=A // 11054
@SP // 11055
AM=M+1 // 11056
A=A-1 // 11057
M=D // 11058
@SP // 11059
AM=M+1 // 11060
A=A-1 // 11061
M=0 // 11062
@SP // 11063
AM=M+1 // 11064
A=A-1 // 11065
M=0 // 11066
@SP // 11067
AM=M+1 // 11068
A=A-1 // 11069
M=0 // 11070
@29 // 11071
D=A // 11072
@SP // 11073
AM=M+1 // 11074
A=A-1 // 11075
M=D // 11076
@63 // 11077
D=A // 11078
@SP // 11079
AM=M+1 // 11080
A=A-1 // 11081
M=D // 11082
@43 // 11083
D=A // 11084
@SP // 11085
AM=M+1 // 11086
A=A-1 // 11087
M=D // 11088
@43 // 11089
D=A // 11090
@SP // 11091
AM=M+1 // 11092
A=A-1 // 11093
M=D // 11094
@43 // 11095
D=A // 11096
@SP // 11097
AM=M+1 // 11098
A=A-1 // 11099
M=D // 11100
@43 // 11101
D=A // 11102
@SP // 11103
AM=M+1 // 11104
A=A-1 // 11105
M=D // 11106
@SP // 11107
AM=M+1 // 11108
A=A-1 // 11109
M=0 // 11110
@SP // 11111
AM=M+1 // 11112
A=A-1 // 11113
M=0 // 11114
// call Output.create
@17 // 11115
D=A // 11116
@14 // 11117
M=D // 11118
@Output.create // 11119
D=A // 11120
@13 // 11121
M=D // 11122
@Output.initMap.ret.79 // 11123
D=A // 11124
@CALL // 11125
0;JMP // 11126
(Output.initMap.ret.79)
@SP // 11127
AM=M-1 // 11128
D=M // 11129
@5 // 11130
M=D // 11131
@110 // 11132
D=A // 11133
@SP // 11134
AM=M+1 // 11135
A=A-1 // 11136
M=D // 11137
@SP // 11138
AM=M+1 // 11139
A=A-1 // 11140
M=0 // 11141
@SP // 11142
AM=M+1 // 11143
A=A-1 // 11144
M=0 // 11145
@SP // 11146
AM=M+1 // 11147
A=A-1 // 11148
M=0 // 11149
@29 // 11150
D=A // 11151
@SP // 11152
AM=M+1 // 11153
A=A-1 // 11154
M=D // 11155
@51 // 11156
D=A // 11157
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=D // 11161
@51 // 11162
D=A // 11163
@SP // 11164
AM=M+1 // 11165
A=A-1 // 11166
M=D // 11167
@51 // 11168
D=A // 11169
@SP // 11170
AM=M+1 // 11171
A=A-1 // 11172
M=D // 11173
@51 // 11174
D=A // 11175
@SP // 11176
AM=M+1 // 11177
A=A-1 // 11178
M=D // 11179
@51 // 11180
D=A // 11181
@SP // 11182
AM=M+1 // 11183
A=A-1 // 11184
M=D // 11185
@SP // 11186
AM=M+1 // 11187
A=A-1 // 11188
M=0 // 11189
@SP // 11190
AM=M+1 // 11191
A=A-1 // 11192
M=0 // 11193
// call Output.create
@17 // 11194
D=A // 11195
@14 // 11196
M=D // 11197
@Output.create // 11198
D=A // 11199
@13 // 11200
M=D // 11201
@Output.initMap.ret.80 // 11202
D=A // 11203
@CALL // 11204
0;JMP // 11205
(Output.initMap.ret.80)
@SP // 11206
AM=M-1 // 11207
D=M // 11208
@5 // 11209
M=D // 11210
@111 // 11211
D=A // 11212
@SP // 11213
AM=M+1 // 11214
A=A-1 // 11215
M=D // 11216
@SP // 11217
AM=M+1 // 11218
A=A-1 // 11219
M=0 // 11220
@SP // 11221
AM=M+1 // 11222
A=A-1 // 11223
M=0 // 11224
@SP // 11225
AM=M+1 // 11226
A=A-1 // 11227
M=0 // 11228
@30 // 11229
D=A // 11230
@SP // 11231
AM=M+1 // 11232
A=A-1 // 11233
M=D // 11234
@51 // 11235
D=A // 11236
@SP // 11237
AM=M+1 // 11238
A=A-1 // 11239
M=D // 11240
@51 // 11241
D=A // 11242
@SP // 11243
AM=M+1 // 11244
A=A-1 // 11245
M=D // 11246
@51 // 11247
D=A // 11248
@SP // 11249
AM=M+1 // 11250
A=A-1 // 11251
M=D // 11252
@51 // 11253
D=A // 11254
@SP // 11255
AM=M+1 // 11256
A=A-1 // 11257
M=D // 11258
@30 // 11259
D=A // 11260
@SP // 11261
AM=M+1 // 11262
A=A-1 // 11263
M=D // 11264
@SP // 11265
AM=M+1 // 11266
A=A-1 // 11267
M=0 // 11268
@SP // 11269
AM=M+1 // 11270
A=A-1 // 11271
M=0 // 11272
// call Output.create
@17 // 11273
D=A // 11274
@14 // 11275
M=D // 11276
@Output.create // 11277
D=A // 11278
@13 // 11279
M=D // 11280
@Output.initMap.ret.81 // 11281
D=A // 11282
@CALL // 11283
0;JMP // 11284
(Output.initMap.ret.81)
@SP // 11285
AM=M-1 // 11286
D=M // 11287
@5 // 11288
M=D // 11289
@112 // 11290
D=A // 11291
@SP // 11292
AM=M+1 // 11293
A=A-1 // 11294
M=D // 11295
@SP // 11296
AM=M+1 // 11297
A=A-1 // 11298
M=0 // 11299
@SP // 11300
AM=M+1 // 11301
A=A-1 // 11302
M=0 // 11303
@SP // 11304
AM=M+1 // 11305
A=A-1 // 11306
M=0 // 11307
@30 // 11308
D=A // 11309
@SP // 11310
AM=M+1 // 11311
A=A-1 // 11312
M=D // 11313
@51 // 11314
D=A // 11315
@SP // 11316
AM=M+1 // 11317
A=A-1 // 11318
M=D // 11319
@51 // 11320
D=A // 11321
@SP // 11322
AM=M+1 // 11323
A=A-1 // 11324
M=D // 11325
@51 // 11326
D=A // 11327
@SP // 11328
AM=M+1 // 11329
A=A-1 // 11330
M=D // 11331
@31 // 11332
D=A // 11333
@SP // 11334
AM=M+1 // 11335
A=A-1 // 11336
M=D // 11337
@3 // 11338
D=A // 11339
@SP // 11340
AM=M+1 // 11341
A=A-1 // 11342
M=D // 11343
@3 // 11344
D=A // 11345
@SP // 11346
AM=M+1 // 11347
A=A-1 // 11348
M=D // 11349
@SP // 11350
AM=M+1 // 11351
A=A-1 // 11352
M=0 // 11353
// call Output.create
@17 // 11354
D=A // 11355
@14 // 11356
M=D // 11357
@Output.create // 11358
D=A // 11359
@13 // 11360
M=D // 11361
@Output.initMap.ret.82 // 11362
D=A // 11363
@CALL // 11364
0;JMP // 11365
(Output.initMap.ret.82)
@SP // 11366
AM=M-1 // 11367
D=M // 11368
@5 // 11369
M=D // 11370
@113 // 11371
D=A // 11372
@SP // 11373
AM=M+1 // 11374
A=A-1 // 11375
M=D // 11376
@SP // 11377
AM=M+1 // 11378
A=A-1 // 11379
M=0 // 11380
@SP // 11381
AM=M+1 // 11382
A=A-1 // 11383
M=0 // 11384
@SP // 11385
AM=M+1 // 11386
A=A-1 // 11387
M=0 // 11388
@30 // 11389
D=A // 11390
@SP // 11391
AM=M+1 // 11392
A=A-1 // 11393
M=D // 11394
@51 // 11395
D=A // 11396
@SP // 11397
AM=M+1 // 11398
A=A-1 // 11399
M=D // 11400
@51 // 11401
D=A // 11402
@SP // 11403
AM=M+1 // 11404
A=A-1 // 11405
M=D // 11406
@51 // 11407
D=A // 11408
@SP // 11409
AM=M+1 // 11410
A=A-1 // 11411
M=D // 11412
@62 // 11413
D=A // 11414
@SP // 11415
AM=M+1 // 11416
A=A-1 // 11417
M=D // 11418
@48 // 11419
D=A // 11420
@SP // 11421
AM=M+1 // 11422
A=A-1 // 11423
M=D // 11424
@48 // 11425
D=A // 11426
@SP // 11427
AM=M+1 // 11428
A=A-1 // 11429
M=D // 11430
@SP // 11431
AM=M+1 // 11432
A=A-1 // 11433
M=0 // 11434
// call Output.create
@17 // 11435
D=A // 11436
@14 // 11437
M=D // 11438
@Output.create // 11439
D=A // 11440
@13 // 11441
M=D // 11442
@Output.initMap.ret.83 // 11443
D=A // 11444
@CALL // 11445
0;JMP // 11446
(Output.initMap.ret.83)
@SP // 11447
AM=M-1 // 11448
D=M // 11449
@5 // 11450
M=D // 11451
@114 // 11452
D=A // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=D // 11457
@SP // 11458
AM=M+1 // 11459
A=A-1 // 11460
M=0 // 11461
@SP // 11462
AM=M+1 // 11463
A=A-1 // 11464
M=0 // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=0 // 11469
@29 // 11470
D=A // 11471
@SP // 11472
AM=M+1 // 11473
A=A-1 // 11474
M=D // 11475
@55 // 11476
D=A // 11477
@SP // 11478
AM=M+1 // 11479
A=A-1 // 11480
M=D // 11481
@51 // 11482
D=A // 11483
@SP // 11484
AM=M+1 // 11485
A=A-1 // 11486
M=D // 11487
@3 // 11488
D=A // 11489
@SP // 11490
AM=M+1 // 11491
A=A-1 // 11492
M=D // 11493
@3 // 11494
D=A // 11495
@SP // 11496
AM=M+1 // 11497
A=A-1 // 11498
M=D // 11499
@7 // 11500
D=A // 11501
@SP // 11502
AM=M+1 // 11503
A=A-1 // 11504
M=D // 11505
@SP // 11506
AM=M+1 // 11507
A=A-1 // 11508
M=0 // 11509
@SP // 11510
AM=M+1 // 11511
A=A-1 // 11512
M=0 // 11513
// call Output.create
@17 // 11514
D=A // 11515
@14 // 11516
M=D // 11517
@Output.create // 11518
D=A // 11519
@13 // 11520
M=D // 11521
@Output.initMap.ret.84 // 11522
D=A // 11523
@CALL // 11524
0;JMP // 11525
(Output.initMap.ret.84)
@SP // 11526
AM=M-1 // 11527
D=M // 11528
@5 // 11529
M=D // 11530
@115 // 11531
D=A // 11532
@SP // 11533
AM=M+1 // 11534
A=A-1 // 11535
M=D // 11536
@SP // 11537
AM=M+1 // 11538
A=A-1 // 11539
M=0 // 11540
@SP // 11541
AM=M+1 // 11542
A=A-1 // 11543
M=0 // 11544
@SP // 11545
AM=M+1 // 11546
A=A-1 // 11547
M=0 // 11548
@30 // 11549
D=A // 11550
@SP // 11551
AM=M+1 // 11552
A=A-1 // 11553
M=D // 11554
@51 // 11555
D=A // 11556
@SP // 11557
AM=M+1 // 11558
A=A-1 // 11559
M=D // 11560
@6 // 11561
D=A // 11562
@SP // 11563
AM=M+1 // 11564
A=A-1 // 11565
M=D // 11566
@24 // 11567
D=A // 11568
@SP // 11569
AM=M+1 // 11570
A=A-1 // 11571
M=D // 11572
@51 // 11573
D=A // 11574
@SP // 11575
AM=M+1 // 11576
A=A-1 // 11577
M=D // 11578
@30 // 11579
D=A // 11580
@SP // 11581
AM=M+1 // 11582
A=A-1 // 11583
M=D // 11584
@SP // 11585
AM=M+1 // 11586
A=A-1 // 11587
M=0 // 11588
@SP // 11589
AM=M+1 // 11590
A=A-1 // 11591
M=0 // 11592
// call Output.create
@17 // 11593
D=A // 11594
@14 // 11595
M=D // 11596
@Output.create // 11597
D=A // 11598
@13 // 11599
M=D // 11600
@Output.initMap.ret.85 // 11601
D=A // 11602
@CALL // 11603
0;JMP // 11604
(Output.initMap.ret.85)
@SP // 11605
AM=M-1 // 11606
D=M // 11607
@5 // 11608
M=D // 11609
@116 // 11610
D=A // 11611
@SP // 11612
AM=M+1 // 11613
A=A-1 // 11614
M=D // 11615
@4 // 11616
D=A // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=D // 11621
@6 // 11622
D=A // 11623
@SP // 11624
AM=M+1 // 11625
A=A-1 // 11626
M=D // 11627
@6 // 11628
D=A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633
@15 // 11634
D=A // 11635
@SP // 11636
AM=M+1 // 11637
A=A-1 // 11638
M=D // 11639
@6 // 11640
D=A // 11641
@SP // 11642
AM=M+1 // 11643
A=A-1 // 11644
M=D // 11645
@6 // 11646
D=A // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=D // 11651
@6 // 11652
D=A // 11653
@SP // 11654
AM=M+1 // 11655
A=A-1 // 11656
M=D // 11657
@54 // 11658
D=A // 11659
@SP // 11660
AM=M+1 // 11661
A=A-1 // 11662
M=D // 11663
@28 // 11664
D=A // 11665
@SP // 11666
AM=M+1 // 11667
A=A-1 // 11668
M=D // 11669
@SP // 11670
AM=M+1 // 11671
A=A-1 // 11672
M=0 // 11673
@SP // 11674
AM=M+1 // 11675
A=A-1 // 11676
M=0 // 11677
// call Output.create
@17 // 11678
D=A // 11679
@14 // 11680
M=D // 11681
@Output.create // 11682
D=A // 11683
@13 // 11684
M=D // 11685
@Output.initMap.ret.86 // 11686
D=A // 11687
@CALL // 11688
0;JMP // 11689
(Output.initMap.ret.86)
@SP // 11690
AM=M-1 // 11691
D=M // 11692
@5 // 11693
M=D // 11694
@117 // 11695
D=A // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=D // 11700
@SP // 11701
AM=M+1 // 11702
A=A-1 // 11703
M=0 // 11704
@SP // 11705
AM=M+1 // 11706
A=A-1 // 11707
M=0 // 11708
@SP // 11709
AM=M+1 // 11710
A=A-1 // 11711
M=0 // 11712
@27 // 11713
D=A // 11714
@SP // 11715
AM=M+1 // 11716
A=A-1 // 11717
M=D // 11718
@27 // 11719
D=A // 11720
@SP // 11721
AM=M+1 // 11722
A=A-1 // 11723
M=D // 11724
@27 // 11725
D=A // 11726
@SP // 11727
AM=M+1 // 11728
A=A-1 // 11729
M=D // 11730
@27 // 11731
D=A // 11732
@SP // 11733
AM=M+1 // 11734
A=A-1 // 11735
M=D // 11736
@27 // 11737
D=A // 11738
@SP // 11739
AM=M+1 // 11740
A=A-1 // 11741
M=D // 11742
@54 // 11743
D=A // 11744
@SP // 11745
AM=M+1 // 11746
A=A-1 // 11747
M=D // 11748
@SP // 11749
AM=M+1 // 11750
A=A-1 // 11751
M=0 // 11752
@SP // 11753
AM=M+1 // 11754
A=A-1 // 11755
M=0 // 11756
// call Output.create
@17 // 11757
D=A // 11758
@14 // 11759
M=D // 11760
@Output.create // 11761
D=A // 11762
@13 // 11763
M=D // 11764
@Output.initMap.ret.87 // 11765
D=A // 11766
@CALL // 11767
0;JMP // 11768
(Output.initMap.ret.87)
@SP // 11769
AM=M-1 // 11770
D=M // 11771
@5 // 11772
M=D // 11773
@118 // 11774
D=A // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=D // 11779
@SP // 11780
AM=M+1 // 11781
A=A-1 // 11782
M=0 // 11783
@SP // 11784
AM=M+1 // 11785
A=A-1 // 11786
M=0 // 11787
@SP // 11788
AM=M+1 // 11789
A=A-1 // 11790
M=0 // 11791
@51 // 11792
D=A // 11793
@SP // 11794
AM=M+1 // 11795
A=A-1 // 11796
M=D // 11797
@51 // 11798
D=A // 11799
@SP // 11800
AM=M+1 // 11801
A=A-1 // 11802
M=D // 11803
@51 // 11804
D=A // 11805
@SP // 11806
AM=M+1 // 11807
A=A-1 // 11808
M=D // 11809
@51 // 11810
D=A // 11811
@SP // 11812
AM=M+1 // 11813
A=A-1 // 11814
M=D // 11815
@30 // 11816
D=A // 11817
@SP // 11818
AM=M+1 // 11819
A=A-1 // 11820
M=D // 11821
@12 // 11822
D=A // 11823
@SP // 11824
AM=M+1 // 11825
A=A-1 // 11826
M=D // 11827
@SP // 11828
AM=M+1 // 11829
A=A-1 // 11830
M=0 // 11831
@SP // 11832
AM=M+1 // 11833
A=A-1 // 11834
M=0 // 11835
// call Output.create
@17 // 11836
D=A // 11837
@14 // 11838
M=D // 11839
@Output.create // 11840
D=A // 11841
@13 // 11842
M=D // 11843
@Output.initMap.ret.88 // 11844
D=A // 11845
@CALL // 11846
0;JMP // 11847
(Output.initMap.ret.88)
@SP // 11848
AM=M-1 // 11849
D=M // 11850
@5 // 11851
M=D // 11852
@119 // 11853
D=A // 11854
@SP // 11855
AM=M+1 // 11856
A=A-1 // 11857
M=D // 11858
@SP // 11859
AM=M+1 // 11860
A=A-1 // 11861
M=0 // 11862
@SP // 11863
AM=M+1 // 11864
A=A-1 // 11865
M=0 // 11866
@SP // 11867
AM=M+1 // 11868
A=A-1 // 11869
M=0 // 11870
@51 // 11871
D=A // 11872
@SP // 11873
AM=M+1 // 11874
A=A-1 // 11875
M=D // 11876
@51 // 11877
D=A // 11878
@SP // 11879
AM=M+1 // 11880
A=A-1 // 11881
M=D // 11882
@51 // 11883
D=A // 11884
@SP // 11885
AM=M+1 // 11886
A=A-1 // 11887
M=D // 11888
@63 // 11889
D=A // 11890
@SP // 11891
AM=M+1 // 11892
A=A-1 // 11893
M=D // 11894
@63 // 11895
D=A // 11896
@SP // 11897
AM=M+1 // 11898
A=A-1 // 11899
M=D // 11900
@18 // 11901
D=A // 11902
@SP // 11903
AM=M+1 // 11904
A=A-1 // 11905
M=D // 11906
@SP // 11907
AM=M+1 // 11908
A=A-1 // 11909
M=0 // 11910
@SP // 11911
AM=M+1 // 11912
A=A-1 // 11913
M=0 // 11914
// call Output.create
@17 // 11915
D=A // 11916
@14 // 11917
M=D // 11918
@Output.create // 11919
D=A // 11920
@13 // 11921
M=D // 11922
@Output.initMap.ret.89 // 11923
D=A // 11924
@CALL // 11925
0;JMP // 11926
(Output.initMap.ret.89)
@SP // 11927
AM=M-1 // 11928
D=M // 11929
@5 // 11930
M=D // 11931
@120 // 11932
D=A // 11933
@SP // 11934
AM=M+1 // 11935
A=A-1 // 11936
M=D // 11937
@SP // 11938
AM=M+1 // 11939
A=A-1 // 11940
M=0 // 11941
@SP // 11942
AM=M+1 // 11943
A=A-1 // 11944
M=0 // 11945
@SP // 11946
AM=M+1 // 11947
A=A-1 // 11948
M=0 // 11949
@51 // 11950
D=A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955
@30 // 11956
D=A // 11957
@SP // 11958
AM=M+1 // 11959
A=A-1 // 11960
M=D // 11961
@12 // 11962
D=A // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=D // 11967
@12 // 11968
D=A // 11969
@SP // 11970
AM=M+1 // 11971
A=A-1 // 11972
M=D // 11973
@30 // 11974
D=A // 11975
@SP // 11976
AM=M+1 // 11977
A=A-1 // 11978
M=D // 11979
@51 // 11980
D=A // 11981
@SP // 11982
AM=M+1 // 11983
A=A-1 // 11984
M=D // 11985
@SP // 11986
AM=M+1 // 11987
A=A-1 // 11988
M=0 // 11989
@SP // 11990
AM=M+1 // 11991
A=A-1 // 11992
M=0 // 11993
// call Output.create
@17 // 11994
D=A // 11995
@14 // 11996
M=D // 11997
@Output.create // 11998
D=A // 11999
@13 // 12000
M=D // 12001
@Output.initMap.ret.90 // 12002
D=A // 12003
@CALL // 12004
0;JMP // 12005
(Output.initMap.ret.90)
@SP // 12006
AM=M-1 // 12007
D=M // 12008
@5 // 12009
M=D // 12010
@121 // 12011
D=A // 12012
@SP // 12013
AM=M+1 // 12014
A=A-1 // 12015
M=D // 12016
@SP // 12017
AM=M+1 // 12018
A=A-1 // 12019
M=0 // 12020
@SP // 12021
AM=M+1 // 12022
A=A-1 // 12023
M=0 // 12024
@SP // 12025
AM=M+1 // 12026
A=A-1 // 12027
M=0 // 12028
@51 // 12029
D=A // 12030
@SP // 12031
AM=M+1 // 12032
A=A-1 // 12033
M=D // 12034
@51 // 12035
D=A // 12036
@SP // 12037
AM=M+1 // 12038
A=A-1 // 12039
M=D // 12040
@51 // 12041
D=A // 12042
@SP // 12043
AM=M+1 // 12044
A=A-1 // 12045
M=D // 12046
@62 // 12047
D=A // 12048
@SP // 12049
AM=M+1 // 12050
A=A-1 // 12051
M=D // 12052
@48 // 12053
D=A // 12054
@SP // 12055
AM=M+1 // 12056
A=A-1 // 12057
M=D // 12058
@24 // 12059
D=A // 12060
@SP // 12061
AM=M+1 // 12062
A=A-1 // 12063
M=D // 12064
@15 // 12065
D=A // 12066
@SP // 12067
AM=M+1 // 12068
A=A-1 // 12069
M=D // 12070
@SP // 12071
AM=M+1 // 12072
A=A-1 // 12073
M=0 // 12074
// call Output.create
@17 // 12075
D=A // 12076
@14 // 12077
M=D // 12078
@Output.create // 12079
D=A // 12080
@13 // 12081
M=D // 12082
@Output.initMap.ret.91 // 12083
D=A // 12084
@CALL // 12085
0;JMP // 12086
(Output.initMap.ret.91)
@SP // 12087
AM=M-1 // 12088
D=M // 12089
@5 // 12090
M=D // 12091
@122 // 12092
D=A // 12093
@SP // 12094
AM=M+1 // 12095
A=A-1 // 12096
M=D // 12097
@SP // 12098
AM=M+1 // 12099
A=A-1 // 12100
M=0 // 12101
@SP // 12102
AM=M+1 // 12103
A=A-1 // 12104
M=0 // 12105
@SP // 12106
AM=M+1 // 12107
A=A-1 // 12108
M=0 // 12109
@63 // 12110
D=A // 12111
@SP // 12112
AM=M+1 // 12113
A=A-1 // 12114
M=D // 12115
@27 // 12116
D=A // 12117
@SP // 12118
AM=M+1 // 12119
A=A-1 // 12120
M=D // 12121
@12 // 12122
D=A // 12123
@SP // 12124
AM=M+1 // 12125
A=A-1 // 12126
M=D // 12127
@6 // 12128
D=A // 12129
@SP // 12130
AM=M+1 // 12131
A=A-1 // 12132
M=D // 12133
@51 // 12134
D=A // 12135
@SP // 12136
AM=M+1 // 12137
A=A-1 // 12138
M=D // 12139
@63 // 12140
D=A // 12141
@SP // 12142
AM=M+1 // 12143
A=A-1 // 12144
M=D // 12145
@SP // 12146
AM=M+1 // 12147
A=A-1 // 12148
M=0 // 12149
@SP // 12150
AM=M+1 // 12151
A=A-1 // 12152
M=0 // 12153
// call Output.create
@17 // 12154
D=A // 12155
@14 // 12156
M=D // 12157
@Output.create // 12158
D=A // 12159
@13 // 12160
M=D // 12161
@Output.initMap.ret.92 // 12162
D=A // 12163
@CALL // 12164
0;JMP // 12165
(Output.initMap.ret.92)
@SP // 12166
AM=M-1 // 12167
D=M // 12168
@5 // 12169
M=D // 12170
@123 // 12171
D=A // 12172
@SP // 12173
AM=M+1 // 12174
A=A-1 // 12175
M=D // 12176
@56 // 12177
D=A // 12178
@SP // 12179
AM=M+1 // 12180
A=A-1 // 12181
M=D // 12182
@12 // 12183
D=A // 12184
@SP // 12185
AM=M+1 // 12186
A=A-1 // 12187
M=D // 12188
@12 // 12189
D=A // 12190
@SP // 12191
AM=M+1 // 12192
A=A-1 // 12193
M=D // 12194
@12 // 12195
D=A // 12196
@SP // 12197
AM=M+1 // 12198
A=A-1 // 12199
M=D // 12200
@7 // 12201
D=A // 12202
@SP // 12203
AM=M+1 // 12204
A=A-1 // 12205
M=D // 12206
@12 // 12207
D=A // 12208
@SP // 12209
AM=M+1 // 12210
A=A-1 // 12211
M=D // 12212
@12 // 12213
D=A // 12214
@SP // 12215
AM=M+1 // 12216
A=A-1 // 12217
M=D // 12218
@12 // 12219
D=A // 12220
@SP // 12221
AM=M+1 // 12222
A=A-1 // 12223
M=D // 12224
@56 // 12225
D=A // 12226
@SP // 12227
AM=M+1 // 12228
A=A-1 // 12229
M=D // 12230
@SP // 12231
AM=M+1 // 12232
A=A-1 // 12233
M=0 // 12234
@SP // 12235
AM=M+1 // 12236
A=A-1 // 12237
M=0 // 12238
// call Output.create
@17 // 12239
D=A // 12240
@14 // 12241
M=D // 12242
@Output.create // 12243
D=A // 12244
@13 // 12245
M=D // 12246
@Output.initMap.ret.93 // 12247
D=A // 12248
@CALL // 12249
0;JMP // 12250
(Output.initMap.ret.93)
@SP // 12251
AM=M-1 // 12252
D=M // 12253
@5 // 12254
M=D // 12255
@124 // 12256
D=A // 12257
@SP // 12258
AM=M+1 // 12259
A=A-1 // 12260
M=D // 12261
@12 // 12262
D=A // 12263
@SP // 12264
AM=M+1 // 12265
A=A-1 // 12266
M=D // 12267
@12 // 12268
D=A // 12269
@SP // 12270
AM=M+1 // 12271
A=A-1 // 12272
M=D // 12273
@12 // 12274
D=A // 12275
@SP // 12276
AM=M+1 // 12277
A=A-1 // 12278
M=D // 12279
@12 // 12280
D=A // 12281
@SP // 12282
AM=M+1 // 12283
A=A-1 // 12284
M=D // 12285
@12 // 12286
D=A // 12287
@SP // 12288
AM=M+1 // 12289
A=A-1 // 12290
M=D // 12291
@12 // 12292
D=A // 12293
@SP // 12294
AM=M+1 // 12295
A=A-1 // 12296
M=D // 12297
@12 // 12298
D=A // 12299
@SP // 12300
AM=M+1 // 12301
A=A-1 // 12302
M=D // 12303
@12 // 12304
D=A // 12305
@SP // 12306
AM=M+1 // 12307
A=A-1 // 12308
M=D // 12309
@12 // 12310
D=A // 12311
@SP // 12312
AM=M+1 // 12313
A=A-1 // 12314
M=D // 12315
@SP // 12316
AM=M+1 // 12317
A=A-1 // 12318
M=0 // 12319
@SP // 12320
AM=M+1 // 12321
A=A-1 // 12322
M=0 // 12323
// call Output.create
@17 // 12324
D=A // 12325
@14 // 12326
M=D // 12327
@Output.create // 12328
D=A // 12329
@13 // 12330
M=D // 12331
@Output.initMap.ret.94 // 12332
D=A // 12333
@CALL // 12334
0;JMP // 12335
(Output.initMap.ret.94)
@SP // 12336
AM=M-1 // 12337
D=M // 12338
@5 // 12339
M=D // 12340
@125 // 12341
D=A // 12342
@SP // 12343
AM=M+1 // 12344
A=A-1 // 12345
M=D // 12346
@7 // 12347
D=A // 12348
@SP // 12349
AM=M+1 // 12350
A=A-1 // 12351
M=D // 12352
@12 // 12353
D=A // 12354
@SP // 12355
AM=M+1 // 12356
A=A-1 // 12357
M=D // 12358
@12 // 12359
D=A // 12360
@SP // 12361
AM=M+1 // 12362
A=A-1 // 12363
M=D // 12364
@12 // 12365
D=A // 12366
@SP // 12367
AM=M+1 // 12368
A=A-1 // 12369
M=D // 12370
@56 // 12371
D=A // 12372
@SP // 12373
AM=M+1 // 12374
A=A-1 // 12375
M=D // 12376
@12 // 12377
D=A // 12378
@SP // 12379
AM=M+1 // 12380
A=A-1 // 12381
M=D // 12382
@12 // 12383
D=A // 12384
@SP // 12385
AM=M+1 // 12386
A=A-1 // 12387
M=D // 12388
@12 // 12389
D=A // 12390
@SP // 12391
AM=M+1 // 12392
A=A-1 // 12393
M=D // 12394
@7 // 12395
D=A // 12396
@SP // 12397
AM=M+1 // 12398
A=A-1 // 12399
M=D // 12400
@SP // 12401
AM=M+1 // 12402
A=A-1 // 12403
M=0 // 12404
@SP // 12405
AM=M+1 // 12406
A=A-1 // 12407
M=0 // 12408
// call Output.create
@17 // 12409
D=A // 12410
@14 // 12411
M=D // 12412
@Output.create // 12413
D=A // 12414
@13 // 12415
M=D // 12416
@Output.initMap.ret.95 // 12417
D=A // 12418
@CALL // 12419
0;JMP // 12420
(Output.initMap.ret.95)
@SP // 12421
AM=M-1 // 12422
D=M // 12423
@5 // 12424
M=D // 12425
@126 // 12426
D=A // 12427
@SP // 12428
AM=M+1 // 12429
A=A-1 // 12430
M=D // 12431
@38 // 12432
D=A // 12433
@SP // 12434
AM=M+1 // 12435
A=A-1 // 12436
M=D // 12437
@45 // 12438
D=A // 12439
@SP // 12440
AM=M+1 // 12441
A=A-1 // 12442
M=D // 12443
@25 // 12444
D=A // 12445
@SP // 12446
AM=M+1 // 12447
A=A-1 // 12448
M=D // 12449
@SP // 12450
AM=M+1 // 12451
A=A-1 // 12452
M=0 // 12453
@SP // 12454
AM=M+1 // 12455
A=A-1 // 12456
M=0 // 12457
@SP // 12458
AM=M+1 // 12459
A=A-1 // 12460
M=0 // 12461
@SP // 12462
AM=M+1 // 12463
A=A-1 // 12464
M=0 // 12465
@SP // 12466
AM=M+1 // 12467
A=A-1 // 12468
M=0 // 12469
@SP // 12470
AM=M+1 // 12471
A=A-1 // 12472
M=0 // 12473
@SP // 12474
AM=M+1 // 12475
A=A-1 // 12476
M=0 // 12477
@SP // 12478
AM=M+1 // 12479
A=A-1 // 12480
M=0 // 12481
// call Output.create
@17 // 12482
D=A // 12483
@14 // 12484
M=D // 12485
@Output.create // 12486
D=A // 12487
@13 // 12488
M=D // 12489
@Output.initMap.ret.96 // 12490
D=A // 12491
@CALL // 12492
0;JMP // 12493
(Output.initMap.ret.96)
@SP // 12494
AM=M-1 // 12495
D=M // 12496
@5 // 12497
M=D // 12498

////PushInstruction("constant 0")
@SP // 12499
AM=M+1 // 12500
A=A-1 // 12501
M=0 // 12502

////ReturnInstruction{}
@RETURN // 12503
0;JMP // 12504

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 12505
AM=M+1 // 12506
A=A-1 // 12507
M=0 // 12508

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 12509
D=A // 12510
@SP // 12511
AM=M+1 // 12512
A=A-1 // 12513
M=D // 12514
// call Array.new
@6 // 12515
D=A // 12516
@14 // 12517
M=D // 12518
@Array.new // 12519
D=A // 12520
@13 // 12521
M=D // 12522
@Output.create.ret.0 // 12523
D=A // 12524
@CALL // 12525
0;JMP // 12526
(Output.create.ret.0)
@SP // 12527
AM=M-1 // 12528
D=M // 12529
@LCL // 12530
A=M // 12531
M=D // 12532

////PushPopPair {
//  push: PushInstruction("local 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@Output.0 // 12533
D=M // 12534
@R13 // 12535
M=D // 12536
@ARG // 12537
A=M // 12538
D=M // 12539
@R13 // 12540
D=D+M // 12541
@4 // 12542
M=D // 12543
@LCL // 12544
A=M // 12545
D=M // 12546
@THAT // 12547
A=M // 12548
M=D // 12549

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12550
A=M // 12551
D=M // 12552
@4 // 12553
M=D // 12554
@ARG // 12555
A=M+1 // 12556
D=M // 12557
@THAT // 12558
A=M // 12559
M=D // 12560

////PushPopPair {
//  push: PushInstruction("argument 2")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12561
A=M // 12562
D=M+1 // 12563
@4 // 12564
M=D // 12565
@ARG // 12566
A=M+1 // 12567
A=A+1 // 12568
D=M // 12569
@THAT // 12570
A=M // 12571
M=D // 12572

////PushPopPair {
//  push: PushInstruction("argument 3")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12573
A=M // 12574
D=M // 12575
@2 // 12576
D=D+A // 12577
@4 // 12578
M=D // 12579
@ARG // 12580
A=M+1 // 12581
A=A+1 // 12582
A=A+1 // 12583
D=M // 12584
@THAT // 12585
A=M // 12586
M=D // 12587

////PushPopPair {
//  push: PushInstruction("argument 4")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12588
A=M // 12589
D=M // 12590
@3 // 12591
D=D+A // 12592
@4 // 12593
M=D // 12594
@ARG // 12595
D=M // 12596
@4 // 12597
A=D+A // 12598
D=M // 12599
@THAT // 12600
A=M // 12601
M=D // 12602

////PushPopPair {
//  push: PushInstruction("argument 5")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12603
A=M // 12604
D=M // 12605
@4 // 12606
D=D+A // 12607
@4 // 12608
M=D // 12609
@ARG // 12610
D=M // 12611
@5 // 12612
A=D+A // 12613
D=M // 12614
@THAT // 12615
A=M // 12616
M=D // 12617

////PushPopPair {
//  push: PushInstruction("argument 6")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12618
A=M // 12619
D=M // 12620
@5 // 12621
D=D+A // 12622
@4 // 12623
M=D // 12624
@ARG // 12625
D=M // 12626
@6 // 12627
A=D+A // 12628
D=M // 12629
@THAT // 12630
A=M // 12631
M=D // 12632

////PushPopPair {
//  push: PushInstruction("argument 7")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12633
A=M // 12634
D=M // 12635
@6 // 12636
D=D+A // 12637
@4 // 12638
M=D // 12639
@ARG // 12640
D=M // 12641
@7 // 12642
A=D+A // 12643
D=M // 12644
@THAT // 12645
A=M // 12646
M=D // 12647

////PushPopPair {
//  push: PushInstruction("argument 8")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12648
A=M // 12649
D=M // 12650
@7 // 12651
D=D+A // 12652
@4 // 12653
M=D // 12654
@ARG // 12655
D=M // 12656
@8 // 12657
A=D+A // 12658
D=M // 12659
@THAT // 12660
A=M // 12661
M=D // 12662

////PushPopPair {
//  push: PushInstruction("argument 9")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12663
A=M // 12664
D=M // 12665
@8 // 12666
D=D+A // 12667
@4 // 12668
M=D // 12669
@ARG // 12670
D=M // 12671
@9 // 12672
A=D+A // 12673
D=M // 12674
@THAT // 12675
A=M // 12676
M=D // 12677

////PushPopPair {
//  push: PushInstruction("argument 10")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12678
A=M // 12679
D=M // 12680
@9 // 12681
D=D+A // 12682
@4 // 12683
M=D // 12684
@ARG // 12685
D=M // 12686
@10 // 12687
A=D+A // 12688
D=M // 12689
@THAT // 12690
A=M // 12691
M=D // 12692

////PushPopPair {
//  push: PushInstruction("argument 11")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 12693
A=M // 12694
D=M // 12695
@10 // 12696
D=D+A // 12697
@4 // 12698
M=D // 12699
@ARG // 12700
D=M // 12701
@11 // 12702
A=D+A // 12703
D=M // 12704
@THAT // 12705
A=M // 12706
M=D // 12707

////PushInstruction("constant 0")
@SP // 12708
AM=M+1 // 12709
A=A-1 // 12710
M=0 // 12711

////ReturnInstruction{}
@RETURN // 12712
0;JMP // 12713

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 12714
A=M // 12715
D=M // 12716
@32 // 12717
D=D-A // 12718
@15 // 12719
M=D // 12720
@Output.getMap.LT.3 // 12721
D=A // 12722
@13 // 12723
M=D // 12724
@DO_LT // 12725
0;JMP // 12726
(Output.getMap.LT.3)
@SP // 12727
AM=M+1 // 12728
A=A-1 // 12729
M=D // 12730
@ARG // 12731
A=M // 12732
D=M // 12733
@126 // 12734
D=D-A // 12735
@15 // 12736
M=D // 12737
@Output.getMap.GT.4 // 12738
D=A // 12739
@13 // 12740
M=D // 12741
@DO_GT // 12742
0;JMP // 12743
(Output.getMap.GT.4)
@SP // 12744
AM=M-1 // 12745
D=D|M // 12746
@15 // 12747
M=D // 12748
@Output.getMap.EQ.2 // 12749
D=A // 12750
@13 // 12751
M=D // 12752
@DO_EQ // 12753
0;JMP // 12754
(Output.getMap.EQ.2)
@Output.getMap.IfElse1 // 12755
D;JNE // 12756

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 12757
A=M // 12758
M=0 // 12759

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 12760
0;JMP // 12761

////LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)

////LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@Output.0 // 12762
D=M // 12763
@R13 // 12764
M=D // 12765
@ARG // 12766
A=M // 12767
D=M // 12768
@R13 // 12769
D=D+M // 12770
@4 // 12771
M=D // 12772

////PushInstruction("that 0")
@THAT // 12773
A=M // 12774
D=M // 12775
@SP // 12776
AM=M+1 // 12777
A=A-1 // 12778
M=D // 12779

////ReturnInstruction{}
@RETURN // 12780
0;JMP // 12781

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("argument 1")
//      pop:  PopInstruction{address=Output.1}
//    }
//  pop:  PopInstruction{address=Output.2}
//}

@ARG // 12782
A=M+1 // 12783
D=M // 12784
@Output.1 // 12785
M=D // 12786
@ARG // 12787
A=M // 12788
D=M // 12789
@Output.2 // 12790
M=D // 12791

////PushInstruction("constant 0")
@SP // 12792
AM=M+1 // 12793
A=A-1 // 12794
M=0 // 12795

////ReturnInstruction{}
@RETURN // 12796
0;JMP // 12797

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 12798
AM=M+1 // 12799
A=A-1 // 12800
M=0 // 12801
@SP // 12802
AM=M+1 // 12803
A=A-1 // 12804
M=0 // 12805
@SP // 12806
AM=M+1 // 12807
A=A-1 // 12808
M=0 // 12809
@SP // 12810
AM=M+1 // 12811
A=A-1 // 12812
M=0 // 12813

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}}
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 12814
A=M // 12815
D=M // 12816
@SP // 12817
AM=M+1 // 12818
A=A-1 // 12819
M=D // 12820
// call Output.getMap
@6 // 12821
D=A // 12822
@14 // 12823
M=D // 12824
@Output.getMap // 12825
D=A // 12826
@13 // 12827
M=D // 12828
@Output.printChar.ret.0 // 12829
D=A // 12830
@CALL // 12831
0;JMP // 12832
(Output.printChar.ret.0)
@SP // 12833
AM=M-1 // 12834
D=M // 12835
@LCL // 12836
A=M // 12837
M=D // 12838
@LCL // 12839
A=M+1 // 12840
A=A+1 // 12841
A=A+1 // 12842
M=0 // 12843

////LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 12844
A=M+1 // 12845
A=A+1 // 12846
A=A+1 // 12847
D=M // 12848
@11 // 12849
D=D-A // 12850
@15 // 12851
M=D // 12852
@Output.printChar.LT.7 // 12853
D=A // 12854
@13 // 12855
M=D // 12856
@DO_LT // 12857
0;JMP // 12858
(Output.printChar.LT.7)
@15 // 12859
M=D // 12860
@Output.printChar.EQ.6 // 12861
D=A // 12862
@13 // 12863
M=D // 12864
@DO_EQ // 12865
0;JMP // 12866
(Output.printChar.EQ.6)
@WHILE_END_Output.printChar1 // 12867
D;JNE // 12868

////PushPopPair {
//  push: BinaryPushGroup(
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
//  pop:  PopInstruction{address=local 1}
//}

@Output.2 // 12869
D=M // 12870
@SP // 12871
AM=M+1 // 12872
A=A-1 // 12873
M=D // 12874
@11 // 12875
D=A // 12876
@SP // 12877
AM=M+1 // 12878
A=A-1 // 12879
M=D // 12880
// call Math.multiply
@7 // 12881
D=A // 12882
@14 // 12883
M=D // 12884
@Math.multiply // 12885
D=A // 12886
@13 // 12887
M=D // 12888
@Output.printChar.ret.3 // 12889
D=A // 12890
@CALL // 12891
0;JMP // 12892
(Output.printChar.ret.3)
@LCL // 12893
A=M+1 // 12894
A=A+1 // 12895
A=A+1 // 12896
D=M // 12897
@SP // 12898
AM=M-1 // 12899
D=D+M // 12900
@SP // 12901
AM=M+1 // 12902
A=A-1 // 12903
M=D // 12904
@32 // 12905
D=A // 12906
@SP // 12907
AM=M+1 // 12908
A=A-1 // 12909
M=D // 12910
// call Math.multiply
@7 // 12911
D=A // 12912
@14 // 12913
M=D // 12914
@Math.multiply // 12915
D=A // 12916
@13 // 12917
M=D // 12918
@Output.printChar.ret.4 // 12919
D=A // 12920
@CALL // 12921
0;JMP // 12922
(Output.printChar.ret.4)
@SP // 12923
AM=M-1 // 12924
D=M // 12925
@16384 // 12926
D=D+A // 12927
@SP // 12928
AM=M+1 // 12929
A=A-1 // 12930
M=D // 12931
@Output.1 // 12932
D=M // 12933
@SP // 12934
AM=M+1 // 12935
A=A-1 // 12936
M=D // 12937
@2 // 12938
D=A // 12939
@SP // 12940
AM=M+1 // 12941
A=A-1 // 12942
M=D // 12943
// call Math.divide
@7 // 12944
D=A // 12945
@14 // 12946
M=D // 12947
@Math.divide // 12948
D=A // 12949
@13 // 12950
M=D // 12951
@Output.printChar.ret.5 // 12952
D=A // 12953
@CALL // 12954
0;JMP // 12955
(Output.printChar.ret.5)
@SP // 12956
AM=M-1 // 12957
D=M // 12958
@SP // 12959
AM=M-1 // 12960
D=D+M // 12961
@LCL // 12962
A=M+1 // 12963
M=D // 12964

////ConditionalGroup{push=BinaryPushGroup(
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
@Output.1 // 12965
D=M // 12966
@1 // 12967
D=D&A // 12968
@15 // 12969
M=D // 12970
@Output.printChar.EQ.10 // 12971
D=A // 12972
@13 // 12973
M=D // 12974
@DO_EQ // 12975
0;JMP // 12976
(Output.printChar.EQ.10)
@15 // 12977
M=D // 12978
@Output.printChar.EQ.9 // 12979
D=A // 12980
@13 // 12981
M=D // 12982
@DO_EQ // 12983
0;JMP // 12984
(Output.printChar.EQ.9)
@Output.printChar.IfElse1 // 12985
D;JNE // 12986

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12987
A=M+1 // 12988
A=A+1 // 12989
A=A+1 // 12990
D=M // 12991
A=A-1 // 12992
A=A-1 // 12993
A=A-1 // 12994
D=D+M // 12995
@4 // 12996
M=D // 12997
@THAT // 12998
A=M // 12999
D=M // 13000
@LCL // 13001
A=M+1 // 13002
A=A+1 // 13003
M=D // 13004

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 13005
0;JMP // 13006

////LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("that 0"), PushInstruction("constant 256")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printChar'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13007
A=M+1 // 13008
A=A+1 // 13009
A=A+1 // 13010
D=M // 13011
A=A-1 // 13012
A=A-1 // 13013
A=A-1 // 13014
D=D+M // 13015
@4 // 13016
M=D // 13017
@THAT // 13018
A=M // 13019
D=M // 13020
@SP // 13021
AM=M+1 // 13022
A=A-1 // 13023
M=D // 13024
@256 // 13025
D=A // 13026
@SP // 13027
AM=M+1 // 13028
A=A-1 // 13029
M=D // 13030
// call Math.multiply
@7 // 13031
D=A // 13032
@14 // 13033
M=D // 13034
@Math.multiply // 13035
D=A // 13036
@13 // 13037
M=D // 13038
@Output.printChar.ret.6 // 13039
D=A // 13040
@CALL // 13041
0;JMP // 13042
(Output.printChar.ret.6)
@SP // 13043
AM=M-1 // 13044
D=M // 13045
@LCL // 13046
A=M+1 // 13047
A=A+1 // 13048
M=D // 13049

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 13050
A=M+1 // 13051
D=M // 13052
@4 // 13053
M=D // 13054

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "OR"
//)
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13055
A=M+1 // 13056
D=M // 13057
@4 // 13058
M=D // 13059
@THAT // 13060
A=M // 13061
D=M // 13062
@R13 // 13063
M=D // 13064
@LCL // 13065
A=M+1 // 13066
A=A+1 // 13067
D=M // 13068
@R13 // 13069
D=D|M // 13070
@THAT // 13071
A=M // 13072
M=D // 13073
@LCL // 13074
A=M+1 // 13075
A=A+1 // 13076
A=A+1 // 13077
M=M+1 // 13078

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 13079
0;JMP // 13080

////LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)

////ConditionalGroup{push=BinaryPushGroup(
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
@Output.1 // 13081
D=M // 13082
@63 // 13083
D=D-A // 13084
@15 // 13085
M=D // 13086
@Output.printChar.EQ.13 // 13087
D=A // 13088
@13 // 13089
M=D // 13090
@DO_EQ // 13091
0;JMP // 13092
(Output.printChar.EQ.13)
@15 // 13093
M=D // 13094
@Output.printChar.EQ.12 // 13095
D=A // 13096
@13 // 13097
M=D // 13098
@DO_EQ // 13099
0;JMP // 13100
(Output.printChar.EQ.12)
@Output.printChar.IfElse2 // 13101
D;JNE // 13102

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=7, Output.create=1}, currentFunction='Output.printChar'}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 13103
D=A // 13104
@14 // 13105
M=D // 13106
@Output.println // 13107
D=A // 13108
@13 // 13109
M=D // 13110
@Output.printChar.ret.7 // 13111
D=A // 13112
@CALL // 13113
0;JMP // 13114
(Output.printChar.ret.7)
@SP // 13115
AM=M-1 // 13116
D=M // 13117
@5 // 13118
M=D // 13119

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 13120
0;JMP // 13121

////LabelInstruction{label='Output.printChar.IfElse2}
// label Output.printChar.IfElse2
(Output.printChar.IfElse2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=Output.1}
//}

@Output.1 // 13122
M=M+1 // 13123

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 13124
AM=M+1 // 13125
A=A-1 // 13126
M=0 // 13127

////ReturnInstruction{}
@RETURN // 13128
0;JMP // 13129

////FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP // 13130
AM=M+1 // 13131
A=A-1 // 13132
M=0 // 13133

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13134
A=M // 13135
M=0 // 13136

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 13137
A=M // 13138
D=M // 13139
@SP // 13140
AM=M+1 // 13141
A=A-1 // 13142
M=D // 13143
@ARG // 13144
A=M // 13145
D=M // 13146
@SP // 13147
AM=M+1 // 13148
A=A-1 // 13149
M=D // 13150
// call String.length
@6 // 13151
D=A // 13152
@14 // 13153
M=D // 13154
@String.length // 13155
D=A // 13156
@13 // 13157
M=D // 13158
@Output.printString.ret.1 // 13159
D=A // 13160
@CALL // 13161
0;JMP // 13162
(Output.printString.ret.1)
@SP // 13163
AM=M-1 // 13164
D=M // 13165
@SP // 13166
AM=M-1 // 13167
D=M-D // 13168
@15 // 13169
M=D // 13170
@Output.printString.LT.16 // 13171
D=A // 13172
@13 // 13173
M=D // 13174
@DO_LT // 13175
0;JMP // 13176
(Output.printString.LT.16)
@15 // 13177
M=D // 13178
@Output.printString.EQ.15 // 13179
D=A // 13180
@13 // 13181
M=D // 13182
@DO_EQ // 13183
0;JMP // 13184
(Output.printString.EQ.15)
@WHILE_END_Output.printString1 // 13185
D;JNE // 13186

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}}], call=CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13187
A=M // 13188
D=M // 13189
@SP // 13190
AM=M+1 // 13191
A=A-1 // 13192
M=D // 13193
@LCL // 13194
A=M // 13195
D=M // 13196
@SP // 13197
AM=M+1 // 13198
A=A-1 // 13199
M=D // 13200
// call String.charAt
@7 // 13201
D=A // 13202
@14 // 13203
M=D // 13204
@String.charAt // 13205
D=A // 13206
@13 // 13207
M=D // 13208
@Output.printString.ret.2 // 13209
D=A // 13210
@CALL // 13211
0;JMP // 13212
(Output.printString.ret.2)
// call Output.printChar
@6 // 13213
D=A // 13214
@14 // 13215
M=D // 13216
@Output.printChar // 13217
D=A // 13218
@13 // 13219
M=D // 13220
@Output.printString.ret.3 // 13221
D=A // 13222
@CALL // 13223
0;JMP // 13224
(Output.printString.ret.3)
@SP // 13225
AM=M-1 // 13226
D=M // 13227
@5 // 13228
M=D // 13229
@LCL // 13230
A=M // 13231
M=M+1 // 13232

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 13233
0;JMP // 13234

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 13235
AM=M+1 // 13236
A=A-1 // 13237
M=0 // 13238

////ReturnInstruction{}
@RETURN // 13239
0;JMP // 13240

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 13241
AM=M+1 // 13242
A=A-1 // 13243
M=0 // 13244

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//              pop:  PopInstruction{address=local 0}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 13245
D=A // 13246
@SP // 13247
AM=M+1 // 13248
A=A-1 // 13249
M=D // 13250
// call String.new
@6 // 13251
D=A // 13252
@14 // 13253
M=D // 13254
@String.new // 13255
D=A // 13256
@13 // 13257
M=D // 13258
@Output.printInt.ret.0 // 13259
D=A // 13260
@CALL // 13261
0;JMP // 13262
(Output.printInt.ret.0)
@SP // 13263
AM=M-1 // 13264
D=M // 13265
@LCL // 13266
A=M // 13267
M=D // 13268
@LCL // 13269
A=M // 13270
D=M // 13271
@SP // 13272
AM=M+1 // 13273
A=A-1 // 13274
M=D // 13275
@ARG // 13276
A=M // 13277
D=M // 13278
@SP // 13279
AM=M+1 // 13280
A=A-1 // 13281
M=D // 13282
// call String.setInt
@7 // 13283
D=A // 13284
@14 // 13285
M=D // 13286
@String.setInt // 13287
D=A // 13288
@13 // 13289
M=D // 13290
@Output.printInt.ret.1 // 13291
D=A // 13292
@CALL // 13293
0;JMP // 13294
(Output.printInt.ret.1)
@SP // 13295
AM=M-1 // 13296
D=M // 13297
@5 // 13298
M=D // 13299
@LCL // 13300
A=M // 13301
D=M // 13302
@SP // 13303
AM=M+1 // 13304
A=A-1 // 13305
M=D // 13306
// call Output.printString
@6 // 13307
D=A // 13308
@14 // 13309
M=D // 13310
@Output.printString // 13311
D=A // 13312
@13 // 13313
M=D // 13314
@Output.printInt.ret.2 // 13315
D=A // 13316
@CALL // 13317
0;JMP // 13318
(Output.printInt.ret.2)
@SP // 13319
AM=M-1 // 13320
D=M // 13321
@5 // 13322
M=D // 13323
@LCL // 13324
A=M // 13325
D=M // 13326
@SP // 13327
AM=M+1 // 13328
A=A-1 // 13329
M=D // 13330
// call String.dispose
@6 // 13331
D=A // 13332
@14 // 13333
M=D // 13334
@String.dispose // 13335
D=A // 13336
@13 // 13337
M=D // 13338
@Output.printInt.ret.3 // 13339
D=A // 13340
@CALL // 13341
0;JMP // 13342
(Output.printInt.ret.3)
@SP // 13343
AM=M-1 // 13344
D=M // 13345
@5 // 13346
M=D // 13347

////PushInstruction("constant 0")
@SP // 13348
AM=M+1 // 13349
A=A-1 // 13350
M=0 // 13351

////ReturnInstruction{}
@RETURN // 13352
0;JMP // 13353

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.1}
//}

@Output.1 // 13354
M=0 // 13355

////ConditionalGroup{push=BinaryPushGroup(
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
@Output.2 // 13356
D=M // 13357
@22 // 13358
D=D-A // 13359
@15 // 13360
M=D // 13361
@Output.println.EQ.19 // 13362
D=A // 13363
@13 // 13364
M=D // 13365
@DO_EQ // 13366
0;JMP // 13367
(Output.println.EQ.19)
@15 // 13368
M=D // 13369
@Output.println.EQ.18 // 13370
D=A // 13371
@13 // 13372
M=D // 13373
@DO_EQ // 13374
0;JMP // 13375
(Output.println.EQ.18)
@Output.println.IfElse1 // 13376
D;JNE // 13377

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.2}
//}

@Output.2 // 13378
M=0 // 13379

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 13380
0;JMP // 13381

////LabelInstruction{label='Output.println.IfElse1}
// label Output.println.IfElse1
(Output.println.IfElse1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=Output.2}
//}

@Output.2 // 13382
M=M+1 // 13383

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13384
AM=M+1 // 13385
A=A-1 // 13386
M=0 // 13387

////ReturnInstruction{}
@RETURN // 13388
0;JMP // 13389

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 13390
AM=M+1 // 13391
A=A-1 // 13392
M=0 // 13393
@SP // 13394
AM=M+1 // 13395
A=A-1 // 13396
M=0 // 13397

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@2055 // 13398
D=A // 13399
@LCL // 13400
A=M // 13401
M=D // 13402

////PushPopPair {
//  push: BinaryPushGroup(
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
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 13403
A=M // 13404
D=M // 13405
@4 // 13406
M=D // 13407
@LCL // 13408
A=M // 13409
D=M // 13410
@16384 // 13411
D=A-D // 13412
@5 // 13413
D=D-A // 13414
@THAT // 13415
A=M // 13416
M=D // 13417

////PushPopPair {
//  push: PushInstruction("constant 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 13418
A=M // 13419
D=M+1 // 13420
@4 // 13421
M=D // 13422
@THAT // 13423
A=M // 13424
M=1 // 13425

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 13426
A=M // 13427
D=M // 13428
@2 // 13429
D=D+A // 13430
@4 // 13431
M=D // 13432
@THAT // 13433
A=M // 13434
M=0 // 13435

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=0}, currentFunction='Memory.init'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}}
//      nested:
//        PushPopPair {
//          push: PushInstruction("constant 0")
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=that 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13436
A=M // 13437
D=M // 13438
@3 // 13439
D=D+A // 13440
@4 // 13441
M=D // 13442
@THAT // 13443
A=M // 13444
M=0 // 13445
@LCL // 13446
A=M // 13447
D=M // 13448
@SP // 13449
AM=M+1 // 13450
A=A-1 // 13451
M=D // 13452
// call Memory.create_foot
@6 // 13453
D=A // 13454
@14 // 13455
M=D // 13456
@Memory.create_foot // 13457
D=A // 13458
@13 // 13459
M=D // 13460
@Memory.init.ret.0 // 13461
D=A // 13462
@CALL // 13463
0;JMP // 13464
(Memory.init.ret.0)
@SP // 13465
AM=M-1 // 13466
D=M // 13467
@5 // 13468
M=D // 13469
@2054 // 13470
D=A // 13471
@SP // 13472
AM=M+1 // 13473
A=A-1 // 13474
M=D // 13475
@2054 // 13476
D=A // 13477
@SP // 13478
AM=M+1 // 13479
A=A-1 // 13480
M=D // 13481
@LCL // 13482
A=M // 13483
D=M // 13484
@SP // 13485
AM=M+1 // 13486
A=A-1 // 13487
M=D // 13488
// call Memory.add_node
@7 // 13489
D=A // 13490
@14 // 13491
M=D // 13492
@Memory.add_node // 13493
D=A // 13494
@13 // 13495
M=D // 13496
@Memory.init.ret.1 // 13497
D=A // 13498
@CALL // 13499
0;JMP // 13500
(Memory.init.ret.1)
@SP // 13501
AM=M-1 // 13502
D=M // 13503
@5 // 13504
M=D // 13505

////PushInstruction("constant 0")
@SP // 13506
AM=M+1 // 13507
A=A-1 // 13508
M=0 // 13509

////ReturnInstruction{}
@RETURN // 13510
0;JMP // 13511

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 13512
AM=M+1 // 13513
A=A-1 // 13514
M=0 // 13515
@SP // 13516
AM=M+1 // 13517
A=A-1 // 13518
M=0 // 13519
@SP // 13520
AM=M+1 // 13521
A=A-1 // 13522
M=0 // 13523
@SP // 13524
AM=M+1 // 13525
A=A-1 // 13526
M=0 // 13527
@SP // 13528
AM=M+1 // 13529
A=A-1 // 13530
M=0 // 13531

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}}
//          pop:  PopInstruction{address=local 0}
//        }
//      pop:  PopInstruction{address=local 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13532
A=M // 13533
D=M // 13534
@SP // 13535
AM=M+1 // 13536
A=A-1 // 13537
M=D // 13538
// call Memory.getBinIndex
@6 // 13539
D=A // 13540
@14 // 13541
M=D // 13542
@Memory.getBinIndex // 13543
D=A // 13544
@13 // 13545
M=D // 13546
@Memory.alloc.ret.0 // 13547
D=A // 13548
@CALL // 13549
0;JMP // 13550
(Memory.alloc.ret.0)
@SP // 13551
AM=M-1 // 13552
D=M // 13553
@LCL // 13554
A=M // 13555
M=D // 13556
@LCL // 13557
A=M // 13558
D=M // 13559
@2048 // 13560
D=D+A // 13561
@LCL // 13562
A=M+1 // 13563
M=D // 13564
@LCL // 13565
A=M+1 // 13566
D=M // 13567
@SP // 13568
AM=M+1 // 13569
A=A-1 // 13570
M=D // 13571
@ARG // 13572
A=M // 13573
D=M // 13574
@SP // 13575
AM=M+1 // 13576
A=A-1 // 13577
M=D // 13578
// call Memory.get_best_fit
@7 // 13579
D=A // 13580
@14 // 13581
M=D // 13582
@Memory.get_best_fit // 13583
D=A // 13584
@13 // 13585
M=D // 13586
@Memory.alloc.ret.1 // 13587
D=A // 13588
@CALL // 13589
0;JMP // 13590
(Memory.alloc.ret.1)
@SP // 13591
AM=M-1 // 13592
D=M // 13593
@LCL // 13594
A=M+1 // 13595
A=A+1 // 13596
M=D // 13597

////LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 13598
A=M+1 // 13599
A=A+1 // 13600
D=M // 13601
@15 // 13602
M=D // 13603
@Memory.alloc.EQ.2 // 13604
D=A // 13605
@13 // 13606
M=D // 13607
@DO_EQ // 13608
0;JMP // 13609
(Memory.alloc.EQ.2)
@15 // 13610
M=D // 13611
@Memory.alloc.EQ.1 // 13612
D=A // 13613
@13 // 13614
M=D // 13615
@DO_EQ // 13616
0;JMP // 13617
(Memory.alloc.EQ.1)
@WHILE_END_Memory.alloc1 // 13618
D;JNE // 13619

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 13620
A=M // 13621
D=M+1 // 13622
@7 // 13623
D=D-A // 13624
@15 // 13625
M=D // 13626
@Memory.alloc.LT.5 // 13627
D=A // 13628
@13 // 13629
M=D // 13630
@DO_LT // 13631
0;JMP // 13632
(Memory.alloc.LT.5)
D=!D // 13633
@15 // 13634
M=D // 13635
@Memory.alloc.EQ.4 // 13636
D=A // 13637
@13 // 13638
M=D // 13639
@DO_EQ // 13640
0;JMP // 13641
(Memory.alloc.EQ.4)
@Memory.alloc.IfElse1 // 13642
D;JNE // 13643

////PushInstruction("constant 0")
@SP // 13644
AM=M+1 // 13645
A=A-1 // 13646
M=0 // 13647

////ReturnInstruction{}
@RETURN // 13648
0;JMP // 13649

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 13650
0;JMP // 13651

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=local 0}
//        }
//      pop:  PopInstruction{address=local 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13652
A=M // 13653
M=M+1 // 13654
@LCL // 13655
A=M // 13656
D=M // 13657
@2048 // 13658
D=D+A // 13659
@LCL // 13660
A=M+1 // 13661
M=D // 13662
@LCL // 13663
A=M+1 // 13664
D=M // 13665
@SP // 13666
AM=M+1 // 13667
A=A-1 // 13668
M=D // 13669
@ARG // 13670
A=M // 13671
D=M // 13672
@SP // 13673
AM=M+1 // 13674
A=A-1 // 13675
M=D // 13676
// call Memory.get_best_fit
@7 // 13677
D=A // 13678
@14 // 13679
M=D // 13680
@Memory.get_best_fit // 13681
D=A // 13682
@13 // 13683
M=D // 13684
@Memory.alloc.ret.2 // 13685
D=A // 13686
@CALL // 13687
0;JMP // 13688
(Memory.alloc.ret.2)
@SP // 13689
AM=M-1 // 13690
D=M // 13691
@LCL // 13692
A=M+1 // 13693
A=A+1 // 13694
M=D // 13695

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 13696
0;JMP // 13697

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}}
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13698
A=M+1 // 13699
A=A+1 // 13700
D=M // 13701
@4 // 13702
M=D // 13703
@THAT // 13704
A=M // 13705
D=M // 13706
@SP // 13707
AM=M+1 // 13708
A=A-1 // 13709
M=D // 13710
// call Memory.getBinIndex
@6 // 13711
D=A // 13712
@14 // 13713
M=D // 13714
@Memory.getBinIndex // 13715
D=A // 13716
@13 // 13717
M=D // 13718
@Memory.alloc.ret.4 // 13719
D=A // 13720
@CALL // 13721
0;JMP // 13722
(Memory.alloc.ret.4)
@SP // 13723
AM=M-1 // 13724
D=M // 13725
@2048 // 13726
D=D+A // 13727
@SP // 13728
AM=M+1 // 13729
A=A-1 // 13730
M=D // 13731
@LCL // 13732
A=M+1 // 13733
A=A+1 // 13734
D=M // 13735
@SP // 13736
AM=M+1 // 13737
A=A-1 // 13738
M=D // 13739
// call Memory.remove_node
@7 // 13740
D=A // 13741
@14 // 13742
M=D // 13743
@Memory.remove_node // 13744
D=A // 13745
@13 // 13746
M=D // 13747
@Memory.alloc.ret.5 // 13748
D=A // 13749
@CALL // 13750
0;JMP // 13751
(Memory.alloc.ret.5)
@SP // 13752
AM=M-1 // 13753
D=M // 13754
@5 // 13755
M=D // 13756
@LCL // 13757
A=M+1 // 13758
A=A+1 // 13759
D=M // 13760
@4 // 13761
M=D // 13762
@THAT // 13763
A=M // 13764
D=M // 13765
@R13 // 13766
M=D // 13767
@ARG // 13768
A=M // 13769
D=M // 13770
@R13 // 13771
D=M-D // 13772
@LCL // 13773
A=M+1 // 13774
A=A+1 // 13775
A=A+1 // 13776
M=D // 13777

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 13778
A=M+1 // 13779
A=A+1 // 13780
A=A+1 // 13781
D=M // 13782
@5 // 13783
D=D-A // 13784
@15 // 13785
M=D // 13786
@Memory.alloc.GT.8 // 13787
D=A // 13788
@13 // 13789
M=D // 13790
@DO_GT // 13791
0;JMP // 13792
(Memory.alloc.GT.8)
@15 // 13793
M=D // 13794
@Memory.alloc.EQ.7 // 13795
D=A // 13796
@13 // 13797
M=D // 13798
@DO_EQ // 13799
0;JMP // 13800
(Memory.alloc.EQ.7)
@Memory.alloc.IfElse2 // 13801
D;JNE // 13802

////PushPopPair {
//  push: PushInstruction("argument 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 13803
A=M+1 // 13804
A=A+1 // 13805
D=M // 13806
@4 // 13807
M=D // 13808
@ARG // 13809
A=M // 13810
D=M // 13811
@THAT // 13812
A=M // 13813
M=D // 13814

////PushPopPair {
//  push: BinaryPushGroup(
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
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}}
//      nested:
//        PushPopPair {
//          push: PushInstruction("constant 0")
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=that 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 13815
A=M+1 // 13816
A=A+1 // 13817
D=M+1 // 13818
@4 // 13819
M=D // 13820
@THAT // 13821
A=M // 13822
M=0 // 13823
@LCL // 13824
A=M+1 // 13825
A=A+1 // 13826
D=M // 13827
@SP // 13828
AM=M+1 // 13829
A=A-1 // 13830
M=D // 13831
// call Memory.create_foot
@6 // 13832
D=A // 13833
@14 // 13834
M=D // 13835
@Memory.create_foot // 13836
D=A // 13837
@13 // 13838
M=D // 13839
@Memory.alloc.ret.6 // 13840
D=A // 13841
@CALL // 13842
0;JMP // 13843
(Memory.alloc.ret.6)
@SP // 13844
AM=M-1 // 13845
D=M // 13846
@5 // 13847
M=D // 13848
@LCL // 13849
D=M // 13850
@4 // 13851
A=D+A // 13852
D=A // 13853
@13 // 13854
M=D // 13855
@LCL // 13856
A=M+1 // 13857
A=A+1 // 13858
D=M // 13859
@R13 // 13860
M=D // 13861
@ARG // 13862
A=M // 13863
D=M // 13864
@R13 // 13865
D=D+M // 13866
@5 // 13867
D=D+A // 13868
@13 // 13869
A=M // 13870
M=D // 13871

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "SUB"
//)
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 13872
D=M // 13873
@4 // 13874
A=D+A // 13875
D=M // 13876
@4 // 13877
M=D // 13878
@LCL // 13879
A=M+1 // 13880
A=A+1 // 13881
A=A+1 // 13882
D=M // 13883
@5 // 13884
D=D-A // 13885
@THAT // 13886
A=M // 13887
M=D // 13888

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}}
//      nested:
//        PushPopPair {
//          push: PushInstruction("constant 1")
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=that 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13889
D=M // 13890
@4 // 13891
A=D+A // 13892
D=M+1 // 13893
@4 // 13894
M=D // 13895
@THAT // 13896
A=M // 13897
M=1 // 13898
@LCL // 13899
D=M // 13900
@4 // 13901
A=D+A // 13902
D=M // 13903
@SP // 13904
AM=M+1 // 13905
A=A-1 // 13906
M=D // 13907
// call Memory.create_foot
@6 // 13908
D=A // 13909
@14 // 13910
M=D // 13911
@Memory.create_foot // 13912
D=A // 13913
@13 // 13914
M=D // 13915
@Memory.alloc.ret.7 // 13916
D=A // 13917
@CALL // 13918
0;JMP // 13919
(Memory.alloc.ret.7)
@SP // 13920
AM=M-1 // 13921
D=M // 13922
@5 // 13923
M=D // 13924
@LCL // 13925
A=M+1 // 13926
A=A+1 // 13927
A=A+1 // 13928
D=M // 13929
@SP // 13930
AM=M+1 // 13931
A=A-1 // 13932
M=D // 13933
// call Memory.getBinIndex
@6 // 13934
D=A // 13935
@14 // 13936
M=D // 13937
@Memory.getBinIndex // 13938
D=A // 13939
@13 // 13940
M=D // 13941
@Memory.alloc.ret.9 // 13942
D=A // 13943
@CALL // 13944
0;JMP // 13945
(Memory.alloc.ret.9)
@SP // 13946
AM=M-1 // 13947
D=M // 13948
@2048 // 13949
D=D+A // 13950
@SP // 13951
AM=M+1 // 13952
A=A-1 // 13953
M=D // 13954
@LCL // 13955
D=M // 13956
@4 // 13957
A=D+A // 13958
D=M // 13959
@SP // 13960
AM=M+1 // 13961
A=A-1 // 13962
M=D // 13963
// call Memory.add_node
@7 // 13964
D=A // 13965
@14 // 13966
M=D // 13967
@Memory.add_node // 13968
D=A // 13969
@13 // 13970
M=D // 13971
@Memory.alloc.ret.10 // 13972
D=A // 13973
@CALL // 13974
0;JMP // 13975
(Memory.alloc.ret.10)
@SP // 13976
AM=M-1 // 13977
D=M // 13978
@5 // 13979
M=D // 13980

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 13981
0;JMP // 13982

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=11, Memory.init=2}, currentFunction='Memory.alloc'}}
//  nested:
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13983
A=M+1 // 13984
A=A+1 // 13985
D=M+1 // 13986
@4 // 13987
M=D // 13988
@THAT // 13989
A=M // 13990
M=0 // 13991
@LCL // 13992
A=M+1 // 13993
A=A+1 // 13994
D=M // 13995
@SP // 13996
AM=M+1 // 13997
A=A-1 // 13998
M=D // 13999
// call Memory.create_foot
@6 // 14000
D=A // 14001
@14 // 14002
M=D // 14003
@Memory.create_foot // 14004
D=A // 14005
@13 // 14006
M=D // 14007
@Memory.alloc.ret.11 // 14008
D=A // 14009
@CALL // 14010
0;JMP // 14011
(Memory.alloc.ret.11)
@SP // 14012
AM=M-1 // 14013
D=M // 14014
@5 // 14015
M=D // 14016

////LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)

////BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
@LCL // 14017
A=M+1 // 14018
A=A+1 // 14019
D=M // 14020
@4 // 14021
D=D+A // 14022
@SP // 14023
AM=M+1 // 14024
A=A-1 // 14025
M=D // 14026

////ReturnInstruction{}
@RETURN // 14027
0;JMP // 14028

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=12, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 14029
AM=M+1 // 14030
A=A-1 // 14031
M=0 // 14032

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=12, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 14033
A=M // 14034
D=M // 14035
@SP // 14036
AM=M+1 // 14037
A=A-1 // 14038
M=D // 14039
// call Memory.alloc
@6 // 14040
D=A // 14041
@14 // 14042
M=D // 14043
@Memory.alloc // 14044
D=A // 14045
@13 // 14046
M=D // 14047
@Memory.calloc.ret.0 // 14048
D=A // 14049
@CALL // 14050
0;JMP // 14051
(Memory.calloc.ret.0)
@SP // 14052
AM=M-1 // 14053
D=M // 14054
@LCL // 14055
A=M // 14056
M=D // 14057

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@LCL // 14058
A=M // 14059
D=!M // 14060
@15 // 14061
M=D // 14062
@Memory.calloc.EQ.9 // 14063
D=A // 14064
@13 // 14065
M=D // 14066
@DO_EQ // 14067
0;JMP // 14068
(Memory.calloc.EQ.9)
@Memory.calloc.IfElse1 // 14069
D;JNE // 14070

////PushInstruction("constant 0")
@SP // 14071
AM=M+1 // 14072
A=A-1 // 14073
M=0 // 14074

////ReturnInstruction{}
@RETURN // 14075
0;JMP // 14076

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 14077
0;JMP // 14078

////LabelInstruction{label='Memory.calloc.IfElse1}
// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)

////LabelInstruction{label='Memory.calloc.IfElseEND1}
// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.calloc1}
// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 14079
A=M // 14080
D=M // 14081
@15 // 14082
M=D // 14083
@Memory.calloc.GT.12 // 14084
D=A // 14085
@13 // 14086
M=D // 14087
@DO_GT // 14088
0;JMP // 14089
(Memory.calloc.GT.12)
@15 // 14090
M=D // 14091
@Memory.calloc.EQ.11 // 14092
D=A // 14093
@13 // 14094
M=D // 14095
@DO_EQ // 14096
0;JMP // 14097
(Memory.calloc.EQ.11)
@WHILE_END_Memory.calloc1 // 14098
D;JNE // 14099

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 14100
A=M // 14101
M=M-1 // 14102

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 14103
A=M // 14104
D=M // 14105
@R13 // 14106
M=D // 14107
@ARG // 14108
A=M // 14109
D=M // 14110
@R13 // 14111
D=D+M // 14112
@4 // 14113
M=D // 14114
@THAT // 14115
A=M // 14116
M=0 // 14117

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 14118
0;JMP // 14119

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 14120
A=M // 14121
D=M // 14122
@SP // 14123
AM=M+1 // 14124
A=A-1 // 14125
M=D // 14126

////ReturnInstruction{}
@RETURN // 14127
0;JMP // 14128

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 14129
AM=M+1 // 14130
A=A-1 // 14131
M=0 // 14132
@SP // 14133
AM=M+1 // 14134
A=A-1 // 14135
M=0 // 14136
@SP // 14137
AM=M+1 // 14138
A=A-1 // 14139
M=0 // 14140

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 14141
A=M // 14142
D=M // 14143
@4 // 14144
D=D-A // 14145
@LCL // 14146
A=M // 14147
M=D // 14148

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: PushInstruction("that 0")
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//              nested:
//                PushPopPair {
//                  push: PushInstruction("constant 1")
//                  nested:
//                    PushPopPair {
//                      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//                      pop:  PopInstruction{address=pointer 1}
//                    }
//                  pop:  PopInstruction{address=that 0}
//                }
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=local 1}
//        }
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 14149
A=M // 14150
D=M+1 // 14151
@4 // 14152
M=D // 14153
@THAT // 14154
A=M // 14155
M=1 // 14156
@LCL // 14157
A=M // 14158
D=M // 14159
@2 // 14160
D=D+A // 14161
@4 // 14162
M=D // 14163
@THAT // 14164
A=M // 14165
D=M // 14166
@LCL // 14167
A=M+1 // 14168
M=D // 14169
@LCL // 14170
A=M // 14171
D=M // 14172
@3 // 14173
D=D+A // 14174
@4 // 14175
M=D // 14176
@THAT // 14177
A=M // 14178
D=M // 14179
@LCL // 14180
A=M+1 // 14181
A=A+1 // 14182
M=D // 14183

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 14184
A=M+1 // 14185
D=M // 14186
@15 // 14187
M=D // 14188
@Memory.deAlloc.EQ.15 // 14189
D=A // 14190
@13 // 14191
M=D // 14192
@DO_EQ // 14193
0;JMP // 14194
(Memory.deAlloc.EQ.15)
D=!D // 14195
@15 // 14196
M=D // 14197
@Memory.deAlloc.EQ.14 // 14198
D=A // 14199
@13 // 14200
M=D // 14201
@DO_EQ // 14202
0;JMP // 14203
(Memory.deAlloc.EQ.14)
@Memory.deAlloc.IfElse1 // 14204
D;JNE // 14205

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 14206
A=M+1 // 14207
D=M+1 // 14208
@4 // 14209
M=D // 14210

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 14211
A=M // 14212
D=M-1 // 14213
@15 // 14214
M=D // 14215
@Memory.deAlloc.EQ.18 // 14216
D=A // 14217
@13 // 14218
M=D // 14219
@DO_EQ // 14220
0;JMP // 14221
(Memory.deAlloc.EQ.18)
@15 // 14222
M=D // 14223
@Memory.deAlloc.EQ.17 // 14224
D=A // 14225
@13 // 14226
M=D // 14227
@DO_EQ // 14228
0;JMP // 14229
(Memory.deAlloc.EQ.17)
@Memory.deAlloc.IfElse2 // 14230
D;JNE // 14231

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 14232
A=M+1 // 14233
D=M // 14234
@4 // 14235
M=D // 14236
@THAT // 14237
A=M // 14238
D=M // 14239
@SP // 14240
AM=M+1 // 14241
A=A-1 // 14242
M=D // 14243
// call Memory.getBinIndex
@6 // 14244
D=A // 14245
@14 // 14246
M=D // 14247
@Memory.getBinIndex // 14248
D=A // 14249
@13 // 14250
M=D // 14251
@Memory.deAlloc.ret.1 // 14252
D=A // 14253
@CALL // 14254
0;JMP // 14255
(Memory.deAlloc.ret.1)
@SP // 14256
AM=M-1 // 14257
D=M // 14258
@2048 // 14259
D=D+A // 14260
@SP // 14261
AM=M+1 // 14262
A=A-1 // 14263
M=D // 14264
@LCL // 14265
A=M+1 // 14266
D=M // 14267
@SP // 14268
AM=M+1 // 14269
A=A-1 // 14270
M=D // 14271
// call Memory.remove_node
@7 // 14272
D=A // 14273
@14 // 14274
M=D // 14275
@Memory.remove_node // 14276
D=A // 14277
@13 // 14278
M=D // 14279
@Memory.deAlloc.ret.2 // 14280
D=A // 14281
@CALL // 14282
0;JMP // 14283
(Memory.deAlloc.ret.2)
@SP // 14284
AM=M-1 // 14285
D=M // 14286
@5 // 14287
M=D // 14288
@LCL // 14289
A=M+1 // 14290
D=M // 14291
@4 // 14292
M=D // 14293

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 14294
A=M // 14295
D=M // 14296
@4 // 14297
M=D // 14298

////PushPopPair {
//  push: PushInstruction("local 1")
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
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
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//          pop:  PopInstruction{address=that 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14299
A=M+1 // 14300
D=M // 14301
@4 // 14302
M=D // 14303
@THAT // 14304
A=M // 14305
D=M // 14306
D=D+M // 14307
@5 // 14308
D=D+A // 14309
@THAT // 14310
A=M // 14311
M=D // 14312
@LCL // 14313
A=M+1 // 14314
D=M // 14315
@SP // 14316
AM=M+1 // 14317
A=A-1 // 14318
M=D // 14319
// call Memory.create_foot
@6 // 14320
D=A // 14321
@14 // 14322
M=D // 14323
@Memory.create_foot // 14324
D=A // 14325
@13 // 14326
M=D // 14327
@Memory.deAlloc.ret.3 // 14328
D=A // 14329
@CALL // 14330
0;JMP // 14331
(Memory.deAlloc.ret.3)
@SP // 14332
AM=M-1 // 14333
D=M // 14334
@5 // 14335
M=D // 14336
@LCL // 14337
A=M+1 // 14338
D=M // 14339
@LCL // 14340
A=M // 14341
M=D // 14342

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 14343
0;JMP // 14344

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 14345
0;JMP // 14346

////LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 14347
A=M+1 // 14348
A=A+1 // 14349
D=M // 14350
@15 // 14351
M=D // 14352
@Memory.deAlloc.EQ.21 // 14353
D=A // 14354
@13 // 14355
M=D // 14356
@DO_EQ // 14357
0;JMP // 14358
(Memory.deAlloc.EQ.21)
D=!D // 14359
@15 // 14360
M=D // 14361
@Memory.deAlloc.EQ.20 // 14362
D=A // 14363
@13 // 14364
M=D // 14365
@DO_EQ // 14366
0;JMP // 14367
(Memory.deAlloc.EQ.20)
@Memory.deAlloc.IfElse3 // 14368
D;JNE // 14369

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 14370
A=M+1 // 14371
A=A+1 // 14372
D=M+1 // 14373
@4 // 14374
M=D // 14375

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 14376
A=M // 14377
D=M-1 // 14378
@15 // 14379
M=D // 14380
@Memory.deAlloc.EQ.24 // 14381
D=A // 14382
@13 // 14383
M=D // 14384
@DO_EQ // 14385
0;JMP // 14386
(Memory.deAlloc.EQ.24)
@15 // 14387
M=D // 14388
@Memory.deAlloc.EQ.23 // 14389
D=A // 14390
@13 // 14391
M=D // 14392
@DO_EQ // 14393
0;JMP // 14394
(Memory.deAlloc.EQ.23)
@Memory.deAlloc.IfElse4 // 14395
D;JNE // 14396

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 14397
A=M+1 // 14398
A=A+1 // 14399
D=M // 14400
@4 // 14401
M=D // 14402
@THAT // 14403
A=M // 14404
D=M // 14405
@SP // 14406
AM=M+1 // 14407
A=A-1 // 14408
M=D // 14409
// call Memory.getBinIndex
@6 // 14410
D=A // 14411
@14 // 14412
M=D // 14413
@Memory.getBinIndex // 14414
D=A // 14415
@13 // 14416
M=D // 14417
@Memory.deAlloc.ret.5 // 14418
D=A // 14419
@CALL // 14420
0;JMP // 14421
(Memory.deAlloc.ret.5)
@SP // 14422
AM=M-1 // 14423
D=M // 14424
@2048 // 14425
D=D+A // 14426
@SP // 14427
AM=M+1 // 14428
A=A-1 // 14429
M=D // 14430
@LCL // 14431
A=M+1 // 14432
A=A+1 // 14433
D=M // 14434
@SP // 14435
AM=M+1 // 14436
A=A-1 // 14437
M=D // 14438
// call Memory.remove_node
@7 // 14439
D=A // 14440
@14 // 14441
M=D // 14442
@Memory.remove_node // 14443
D=A // 14444
@13 // 14445
M=D // 14446
@Memory.deAlloc.ret.6 // 14447
D=A // 14448
@CALL // 14449
0;JMP // 14450
(Memory.deAlloc.ret.6)
@SP // 14451
AM=M-1 // 14452
D=M // 14453
@5 // 14454
M=D // 14455
@LCL // 14456
A=M // 14457
D=M // 14458
@4 // 14459
M=D // 14460

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 14461
A=M+1 // 14462
A=A+1 // 14463
D=M // 14464
@4 // 14465
M=D // 14466

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=7, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14467
A=M // 14468
D=M // 14469
@4 // 14470
M=D // 14471
@THAT // 14472
A=M // 14473
D=M // 14474
D=D+M // 14475
@5 // 14476
D=D+A // 14477
@THAT // 14478
A=M // 14479
M=D // 14480
@LCL // 14481
A=M // 14482
D=M // 14483
@SP // 14484
AM=M+1 // 14485
A=A-1 // 14486
M=D // 14487
// call Memory.create_foot
@6 // 14488
D=A // 14489
@14 // 14490
M=D // 14491
@Memory.create_foot // 14492
D=A // 14493
@13 // 14494
M=D // 14495
@Memory.deAlloc.ret.7 // 14496
D=A // 14497
@CALL // 14498
0;JMP // 14499
(Memory.deAlloc.ret.7)
@SP // 14500
AM=M-1 // 14501
D=M // 14502
@5 // 14503
M=D // 14504

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 14505
0;JMP // 14506

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 14507
0;JMP // 14508

////LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)

////LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("that 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14509
A=M // 14510
D=M // 14511
@4 // 14512
M=D // 14513
@THAT // 14514
A=M // 14515
D=M // 14516
@SP // 14517
AM=M+1 // 14518
A=A-1 // 14519
M=D // 14520
// call Memory.getBinIndex
@6 // 14521
D=A // 14522
@14 // 14523
M=D // 14524
@Memory.getBinIndex // 14525
D=A // 14526
@13 // 14527
M=D // 14528
@Memory.deAlloc.ret.9 // 14529
D=A // 14530
@CALL // 14531
0;JMP // 14532
(Memory.deAlloc.ret.9)
@SP // 14533
AM=M-1 // 14534
D=M // 14535
@2048 // 14536
D=D+A // 14537
@SP // 14538
AM=M+1 // 14539
A=A-1 // 14540
M=D // 14541
@LCL // 14542
A=M // 14543
D=M // 14544
@SP // 14545
AM=M+1 // 14546
A=A-1 // 14547
M=D // 14548
// call Memory.add_node
@7 // 14549
D=A // 14550
@14 // 14551
M=D // 14552
@Memory.add_node // 14553
D=A // 14554
@13 // 14555
M=D // 14556
@Memory.deAlloc.ret.10 // 14557
D=A // 14558
@CALL // 14559
0;JMP // 14560
(Memory.deAlloc.ret.10)
@SP // 14561
AM=M-1 // 14562
D=M // 14563
@5 // 14564
M=D // 14565

////PushInstruction("constant 0")
@SP // 14566
AM=M+1 // 14567
A=A-1 // 14568
M=0 // 14569

////ReturnInstruction{}
@RETURN // 14570
0;JMP // 14571

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 14572
AM=M+1 // 14573
A=A-1 // 14574
M=0 // 14575
@SP // 14576
AM=M+1 // 14577
A=A-1 // 14578
M=0 // 14579
@SP // 14580
AM=M+1 // 14581
A=A-1 // 14582
M=0 // 14583
@SP // 14584
AM=M+1 // 14585
A=A-1 // 14586
M=0 // 14587

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 14588
A=M // 14589
D=M // 14590
@15 // 14591
M=D // 14592
@Memory.realloc.EQ.27 // 14593
D=A // 14594
@13 // 14595
M=D // 14596
@DO_EQ // 14597
0;JMP // 14598
(Memory.realloc.EQ.27)
@15 // 14599
M=D // 14600
@Memory.realloc.EQ.26 // 14601
D=A // 14602
@13 // 14603
M=D // 14604
@DO_EQ // 14605
0;JMP // 14606
(Memory.realloc.EQ.26)
@Memory.realloc.IfElse1 // 14607
D;JNE // 14608

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
@ARG // 14609
A=M+1 // 14610
D=M // 14611
@SP // 14612
AM=M+1 // 14613
A=A-1 // 14614
M=D // 14615
// call Memory.alloc
@6 // 14616
D=A // 14617
@14 // 14618
M=D // 14619
@Memory.alloc // 14620
D=A // 14621
@13 // 14622
M=D // 14623
@Memory.realloc.ret.0 // 14624
D=A // 14625
@CALL // 14626
0;JMP // 14627
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 14628
0;JMP // 14629

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 14630
0;JMP // 14631

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//  nested:
//    PushPopPair {
//      push: PushInstruction("that 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//              pop:  PopInstruction{address=local 3}
//            }
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 14632
A=M // 14633
D=M-1 // 14634
@LCL // 14635
A=M+1 // 14636
A=A+1 // 14637
A=A+1 // 14638
M=D // 14639
@LCL // 14640
A=M+1 // 14641
A=A+1 // 14642
A=A+1 // 14643
D=M // 14644
@4 // 14645
M=D // 14646
@THAT // 14647
A=M // 14648
D=M // 14649
@LCL // 14650
A=M // 14651
M=D // 14652
@ARG // 14653
A=M+1 // 14654
D=M // 14655
@SP // 14656
AM=M+1 // 14657
A=A-1 // 14658
M=D // 14659
// call Memory.alloc
@6 // 14660
D=A // 14661
@14 // 14662
M=D // 14663
@Memory.alloc // 14664
D=A // 14665
@13 // 14666
M=D // 14667
@Memory.realloc.ret.1 // 14668
D=A // 14669
@CALL // 14670
0;JMP // 14671
(Memory.realloc.ret.1)
@SP // 14672
AM=M-1 // 14673
D=M // 14674
@LCL // 14675
A=M+1 // 14676
M=D // 14677

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 14678
A=M+1 // 14679
D=M // 14680
@15 // 14681
M=D // 14682
@Memory.realloc.EQ.30 // 14683
D=A // 14684
@13 // 14685
M=D // 14686
@DO_EQ // 14687
0;JMP // 14688
(Memory.realloc.EQ.30)
@15 // 14689
M=D // 14690
@Memory.realloc.EQ.29 // 14691
D=A // 14692
@13 // 14693
M=D // 14694
@DO_EQ // 14695
0;JMP // 14696
(Memory.realloc.EQ.29)
@Memory.realloc.IfElse2 // 14697
D;JNE // 14698

////PushInstruction("constant 0")
@SP // 14699
AM=M+1 // 14700
A=A-1 // 14701
M=0 // 14702

////ReturnInstruction{}
@RETURN // 14703
0;JMP // 14704

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 14705
0;JMP // 14706

////LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)

////LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 14707
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
@Memory.realloc.GT.33 // 14719
D=A // 14720
@13 // 14721
M=D // 14722
@DO_GT // 14723
0;JMP // 14724
(Memory.realloc.GT.33)
D=!D // 14725
@15 // 14726
M=D // 14727
@Memory.realloc.EQ.32 // 14728
D=A // 14729
@13 // 14730
M=D // 14731
@DO_EQ // 14732
0;JMP // 14733
(Memory.realloc.EQ.32)
@Memory.realloc.IfElse3 // 14734
D;JNE // 14735

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 14736
A=M // 14737
D=M // 14738
@LCL // 14739
A=M+1 // 14740
A=A+1 // 14741
M=D // 14742

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 14743
0;JMP // 14744

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 14745
A=M+1 // 14746
D=M // 14747
@LCL // 14748
A=M+1 // 14749
A=A+1 // 14750
M=D // 14751

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 14752
A=M // 14753
D=M // 14754
@SP // 14755
AM=M+1 // 14756
A=A-1 // 14757
M=D // 14758
@LCL // 14759
A=M+1 // 14760
D=M // 14761
@SP // 14762
AM=M+1 // 14763
A=A-1 // 14764
M=D // 14765
@LCL // 14766
A=M+1 // 14767
A=A+1 // 14768
D=M // 14769
@SP // 14770
AM=M+1 // 14771
A=A-1 // 14772
M=D // 14773
// call Memory.copy
@8 // 14774
D=A // 14775
@14 // 14776
M=D // 14777
@Memory.copy // 14778
D=A // 14779
@13 // 14780
M=D // 14781
@Memory.realloc.ret.2 // 14782
D=A // 14783
@CALL // 14784
0;JMP // 14785
(Memory.realloc.ret.2)
@SP // 14786
AM=M-1 // 14787
D=M // 14788
@5 // 14789
M=D // 14790
@ARG // 14791
A=M // 14792
D=M // 14793
@SP // 14794
AM=M+1 // 14795
A=A-1 // 14796
M=D // 14797
// call Memory.deAlloc
@6 // 14798
D=A // 14799
@14 // 14800
M=D // 14801
@Memory.deAlloc // 14802
D=A // 14803
@13 // 14804
M=D // 14805
@Memory.realloc.ret.3 // 14806
D=A // 14807
@CALL // 14808
0;JMP // 14809
(Memory.realloc.ret.3)
@SP // 14810
AM=M-1 // 14811
D=M // 14812
@5 // 14813
M=D // 14814

////PushInstruction("local 1")
@LCL // 14815
A=M+1 // 14816
D=M // 14817
@SP // 14818
AM=M+1 // 14819
A=A-1 // 14820
M=D // 14821

////ReturnInstruction{}
@RETURN // 14822
0;JMP // 14823

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 14824
AM=M+1 // 14825
A=A-1 // 14826
M=0 // 14827

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14828
A=M // 14829
M=0 // 14830

////LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 14831
A=M // 14832
D=M // 14833
@R13 // 14834
M=D // 14835
@ARG // 14836
A=M+1 // 14837
A=A+1 // 14838
D=M // 14839
@R13 // 14840
D=M-D // 14841
@15 // 14842
M=D // 14843
@Memory.copy.LT.36 // 14844
D=A // 14845
@13 // 14846
M=D // 14847
@DO_LT // 14848
0;JMP // 14849
(Memory.copy.LT.36)
@15 // 14850
M=D // 14851
@Memory.copy.EQ.35 // 14852
D=A // 14853
@13 // 14854
M=D // 14855
@DO_EQ // 14856
0;JMP // 14857
(Memory.copy.EQ.35)
@WHILE_END_Memory.copy1 // 14858
D;JNE // 14859

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 14860
A=M // 14861
D=M // 14862
@R13 // 14863
M=D // 14864
@LCL // 14865
A=M // 14866
D=M // 14867
@R13 // 14868
D=D+M // 14869
@4 // 14870
M=D // 14871

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("that 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 14872
A=M+1 // 14873
D=M // 14874
@R13 // 14875
M=D // 14876
@LCL // 14877
A=M // 14878
D=M // 14879
@R13 // 14880
D=D+M // 14881
@4 // 14882
M=D // 14883
@THAT // 14884
A=M // 14885
D=M // 14886
@THAT // 14887
A=M // 14888
M=D // 14889
@LCL // 14890
A=M // 14891
M=M+1 // 14892

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 14893
0;JMP // 14894

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 14895
AM=M+1 // 14896
A=A-1 // 14897
M=0 // 14898

////ReturnInstruction{}
@RETURN // 14899
0;JMP // 14900

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 14901
A=M+1 // 14902
D=M // 14903
@2 // 14904
D=D+A // 14905
@4 // 14906
M=D // 14907

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 14908
A=M // 14909
D=M // 14910
@15 // 14911
M=D // 14912
@Memory.remove_node.EQ.39 // 14913
D=A // 14914
@13 // 14915
M=D // 14916
@DO_EQ // 14917
0;JMP // 14918
(Memory.remove_node.EQ.39)
D=!D // 14919
@15 // 14920
M=D // 14921
@Memory.remove_node.EQ.38 // 14922
D=A // 14923
@13 // 14924
M=D // 14925
@DO_EQ // 14926
0;JMP // 14927
(Memory.remove_node.EQ.38)
@Memory.remove_node.IfElse1 // 14928
D;JNE // 14929

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 14930
A=M+1 // 14931
D=M // 14932
@3 // 14933
D=D+A // 14934
@4 // 14935
M=D // 14936

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14937
A=M+1 // 14938
D=M // 14939
@2 // 14940
D=D+A // 14941
@3 // 14942
D=D+A // 14943
@4 // 14944
M=D // 14945
@THAT // 14946
A=M // 14947
D=M // 14948
@THAT // 14949
A=M // 14950
M=D // 14951

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 14952
0;JMP // 14953

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 14954
A=M+1 // 14955
D=M // 14956
@3 // 14957
D=D+A // 14958
@4 // 14959
M=D // 14960

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14961
A=M // 14962
D=M // 14963
@4 // 14964
M=D // 14965
@THAT // 14966
A=M // 14967
D=M // 14968
@THAT // 14969
A=M // 14970
M=D // 14971

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 14972
A=M+1 // 14973
D=M // 14974
@3 // 14975
D=D+A // 14976
@4 // 14977
M=D // 14978

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 14979
A=M // 14980
D=M // 14981
@15 // 14982
M=D // 14983
@Memory.remove_node.EQ.42 // 14984
D=A // 14985
@13 // 14986
M=D // 14987
@DO_EQ // 14988
0;JMP // 14989
(Memory.remove_node.EQ.42)
D=!D // 14990
@15 // 14991
M=D // 14992
@Memory.remove_node.EQ.41 // 14993
D=A // 14994
@13 // 14995
M=D // 14996
@DO_EQ // 14997
0;JMP // 14998
(Memory.remove_node.EQ.41)
@Memory.remove_node.IfElse2 // 14999
D;JNE // 15000

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 15001
A=M+1 // 15002
D=M // 15003
@2 // 15004
D=D+A // 15005
@4 // 15006
M=D // 15007

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15008
A=M+1 // 15009
D=M // 15010
@3 // 15011
D=D+A // 15012
@2 // 15013
D=D+A // 15014
@4 // 15015
M=D // 15016
@THAT // 15017
A=M // 15018
D=M // 15019
@THAT // 15020
A=M // 15021
M=D // 15022

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 15023
0;JMP // 15024

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15025
A=M+1 // 15026
D=M // 15027
@2 // 15028
D=D+A // 15029
@4 // 15030
M=D // 15031
@THAT // 15032
A=M // 15033
M=0 // 15034

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15035
A=M+1 // 15036
D=M // 15037
@3 // 15038
D=D+A // 15039
@4 // 15040
M=D // 15041
@THAT // 15042
A=M // 15043
M=0 // 15044

////PushInstruction("constant 0")
@SP // 15045
AM=M+1 // 15046
A=A-1 // 15047
M=0 // 15048

////ReturnInstruction{}
@RETURN // 15049
0;JMP // 15050

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 15051
AM=M+1 // 15052
A=A-1 // 15053
M=0 // 15054

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15055
A=M // 15056
M=0 // 15057

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 15058
A=M // 15059
D=M // 15060
@2048 // 15061
D=D+A // 15062
@4 // 15063
M=D // 15064

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 15065
A=M // 15066
D=M // 15067
@7 // 15068
D=D-A // 15069
@15 // 15070
M=D // 15071
@Memory.getBinIndex.LT.46 // 15072
D=A // 15073
@13 // 15074
M=D // 15075
@DO_LT // 15076
0;JMP // 15077
(Memory.getBinIndex.LT.46)
@SP // 15078
AM=M+1 // 15079
A=A-1 // 15080
M=D // 15081
@THAT // 15082
A=M // 15083
D=M // 15084
@15 // 15085
M=D // 15086
@Memory.getBinIndex.EQ.47 // 15087
D=A // 15088
@13 // 15089
M=D // 15090
@DO_EQ // 15091
0;JMP // 15092
(Memory.getBinIndex.EQ.47)
D=!D // 15093
@SP // 15094
AM=M-1 // 15095
D=D&M // 15096
@15 // 15097
M=D // 15098
@Memory.getBinIndex.EQ.45 // 15099
D=A // 15100
@13 // 15101
M=D // 15102
@DO_EQ // 15103
0;JMP // 15104
(Memory.getBinIndex.EQ.45)
@WHILE_END_Memory.getBinIndex1 // 15105
D;JNE // 15106

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 15107
A=M // 15108
D=M // 15109
@SP // 15110
AM=M+1 // 15111
A=A-1 // 15112
M=D // 15113
@LCL // 15114
A=M // 15115
D=M // 15116
@SP // 15117
AM=M+1 // 15118
A=A-1 // 15119
M=D+1 // 15120
@16 // 15121
D=A // 15122
@SP // 15123
AM=M+1 // 15124
A=A-1 // 15125
M=D // 15126
// call Math.multiply
@7 // 15127
D=A // 15128
@14 // 15129
M=D // 15130
@Math.multiply // 15131
D=A // 15132
@13 // 15133
M=D // 15134
@Memory.getBinIndex.ret.1 // 15135
D=A // 15136
@CALL // 15137
0;JMP // 15138
(Memory.getBinIndex.ret.1)
@SP // 15139
AM=M-1 // 15140
D=M // 15141
@SP // 15142
AM=M-1 // 15143
D=M-D // 15144
@15 // 15145
M=D // 15146
@Memory.getBinIndex.GT.50 // 15147
D=A // 15148
@13 // 15149
M=D // 15150
@DO_GT // 15151
0;JMP // 15152
(Memory.getBinIndex.GT.50)
D=!D // 15153
@15 // 15154
M=D // 15155
@Memory.getBinIndex.EQ.49 // 15156
D=A // 15157
@13 // 15158
M=D // 15159
@DO_EQ // 15160
0;JMP // 15161
(Memory.getBinIndex.EQ.49)
@Memory.getBinIndex.IfElse1 // 15162
D;JNE // 15163

////PushInstruction("local 0")
@LCL // 15164
A=M // 15165
D=M // 15166
@SP // 15167
AM=M+1 // 15168
A=A-1 // 15169
M=D // 15170

////ReturnInstruction{}
@RETURN // 15171
0;JMP // 15172

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 15173
0;JMP // 15174

////LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)

////LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15175
A=M // 15176
M=M+1 // 15177

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 15178
0;JMP // 15179

////LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)

////BinaryPushGroup(
//    left:
//        PushInstruction("constant 7"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
@6 // 15180
D=A // 15181
@SP // 15182
AM=M+1 // 15183
A=A-1 // 15184
M=D // 15185
@7 // 15186
D=A // 15187
@SP // 15188
AM=M+1 // 15189
A=A-1 // 15190
M=D-1 // 15191

////ReturnInstruction{}
@RETURN // 15192
0;JMP // 15193

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 15194
AM=M+1 // 15195
A=A-1 // 15196
M=0 // 15197

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("that 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 15198
A=M // 15199
D=M // 15200
@4 // 15201
M=D // 15202
@THAT // 15203
A=M // 15204
D=M // 15205
@LCL // 15206
A=M // 15207
M=D // 15208
@LCL // 15209
A=M // 15210
D=M // 15211
@4 // 15212
M=D // 15213

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 15214
A=M // 15215
D=M // 15216
@R13 // 15217
M=D // 15218
@ARG // 15219
A=M+1 // 15220
D=M // 15221
@R13 // 15222
D=M-D // 15223
@15 // 15224
M=D // 15225
@Memory.get_best_fit.LT.53 // 15226
D=A // 15227
@13 // 15228
M=D // 15229
@DO_LT // 15230
0;JMP // 15231
(Memory.get_best_fit.LT.53)
D=!D // 15232
@15 // 15233
M=D // 15234
@Memory.get_best_fit.EQ.52 // 15235
D=A // 15236
@13 // 15237
M=D // 15238
@DO_EQ // 15239
0;JMP // 15240
(Memory.get_best_fit.EQ.52)
@Memory.get_best_fit.IfElse1 // 15241
D;JNE // 15242

////PushInstruction("local 0")
@LCL // 15243
A=M // 15244
D=M // 15245
@SP // 15246
AM=M+1 // 15247
A=A-1 // 15248
M=D // 15249

////ReturnInstruction{}
@RETURN // 15250
0;JMP // 15251

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 15252
0;JMP // 15253

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
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 15254
A=M // 15255
D=M // 15256
@3 // 15257
D=D+A // 15258
@4 // 15259
M=D // 15260

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 15261
A=M // 15262
D=M // 15263
@15 // 15264
M=D // 15265
@Memory.get_best_fit.EQ.56 // 15266
D=A // 15267
@13 // 15268
M=D // 15269
@DO_EQ // 15270
0;JMP // 15271
(Memory.get_best_fit.EQ.56)
D=!D // 15272
@15 // 15273
M=D // 15274
@Memory.get_best_fit.EQ.55 // 15275
D=A // 15276
@13 // 15277
M=D // 15278
@DO_EQ // 15279
0;JMP // 15280
(Memory.get_best_fit.EQ.55)
@WHILE_END_Memory.get_best_fit1 // 15281
D;JNE // 15282

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("that 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 15283
A=M // 15284
D=M // 15285
@3 // 15286
D=D+A // 15287
@4 // 15288
M=D // 15289
@THAT // 15290
A=M // 15291
D=M // 15292
@LCL // 15293
A=M // 15294
M=D // 15295
@LCL // 15296
A=M // 15297
D=M // 15298
@4 // 15299
M=D // 15300

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 15301
A=M // 15302
D=M // 15303
@R13 // 15304
M=D // 15305
@ARG // 15306
A=M+1 // 15307
D=M // 15308
@R13 // 15309
D=M-D // 15310
@15 // 15311
M=D // 15312
@Memory.get_best_fit.LT.59 // 15313
D=A // 15314
@13 // 15315
M=D // 15316
@DO_LT // 15317
0;JMP // 15318
(Memory.get_best_fit.LT.59)
D=!D // 15319
@15 // 15320
M=D // 15321
@Memory.get_best_fit.EQ.58 // 15322
D=A // 15323
@13 // 15324
M=D // 15325
@DO_EQ // 15326
0;JMP // 15327
(Memory.get_best_fit.EQ.58)
@Memory.get_best_fit.IfElse2 // 15328
D;JNE // 15329

////PushInstruction("local 0")
@LCL // 15330
A=M // 15331
D=M // 15332
@SP // 15333
AM=M+1 // 15334
A=A-1 // 15335
M=D // 15336

////ReturnInstruction{}
@RETURN // 15337
0;JMP // 15338

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 15339
0;JMP // 15340

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 15341
0;JMP // 15342

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 15343
AM=M+1 // 15344
A=A-1 // 15345
M=0 // 15346

////ReturnInstruction{}
@RETURN // 15347
0;JMP // 15348

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15349
A=M // 15350
D=M // 15351
@4 // 15352
M=D // 15353
@ARG // 15354
A=M // 15355
D=M // 15356
@SP // 15357
AM=M+1 // 15358
A=A-1 // 15359
M=D // 15360
@THAT // 15361
A=M // 15362
D=M // 15363
@4 // 15364
D=D+A // 15365
@SP // 15366
AM=M-1 // 15367
D=D+M // 15368
@4 // 15369
M=D // 15370
@ARG // 15371
A=M // 15372
D=M // 15373
@THAT // 15374
A=M // 15375
M=D // 15376

////PushInstruction("constant 0")
@SP // 15377
AM=M+1 // 15378
A=A-1 // 15379
M=0 // 15380

////ReturnInstruction{}
@RETURN // 15381
0;JMP // 15382

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 15383
AM=M+1 // 15384
A=A-1 // 15385
M=0 // 15386
@SP // 15387
AM=M+1 // 15388
A=A-1 // 15389
M=0 // 15390

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15391
A=M+1 // 15392
D=M // 15393
@2 // 15394
D=D+A // 15395
@4 // 15396
M=D // 15397
@THAT // 15398
A=M // 15399
M=0 // 15400

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  nested:
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=that 0}
//    }
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 15401
A=M+1 // 15402
D=M // 15403
@3 // 15404
D=D+A // 15405
@4 // 15406
M=D // 15407
@THAT // 15408
A=M // 15409
M=0 // 15410
@ARG // 15411
A=M // 15412
D=M // 15413
@4 // 15414
M=D // 15415

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 15416
A=M // 15417
D=M // 15418
@15 // 15419
M=D // 15420
@Memory.add_node.EQ.62 // 15421
D=A // 15422
@13 // 15423
M=D // 15424
@DO_EQ // 15425
0;JMP // 15426
(Memory.add_node.EQ.62)
@15 // 15427
M=D // 15428
@Memory.add_node.EQ.61 // 15429
D=A // 15430
@13 // 15431
M=D // 15432
@DO_EQ // 15433
0;JMP // 15434
(Memory.add_node.EQ.61)
@Memory.add_node.IfElse1 // 15435
D;JNE // 15436

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15437
A=M // 15438
D=M // 15439
@4 // 15440
M=D // 15441
@ARG // 15442
A=M+1 // 15443
D=M // 15444
@THAT // 15445
A=M // 15446
M=D // 15447

////PushInstruction("constant 0")
@SP // 15448
AM=M+1 // 15449
A=A-1 // 15450
M=0 // 15451

////ReturnInstruction{}
@RETURN // 15452
0;JMP // 15453

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 15454
0;JMP // 15455

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  nested:
//    PushPopPair {
//      push: PushInstruction("that 0")
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15456
A=M // 15457
D=M // 15458
@4 // 15459
M=D // 15460
@THAT // 15461
A=M // 15462
D=M // 15463
@LCL // 15464
A=M // 15465
M=D // 15466
@LCL // 15467
A=M+1 // 15468
M=0 // 15469

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 15470
A=M // 15471
D=M // 15472
@4 // 15473
M=D // 15474

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 15475
A=M+1 // 15476
D=M // 15477
@4 // 15478
M=D // 15479

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 15480
A=M // 15481
D=M // 15482
@15 // 15483
M=D // 15484
@Memory.add_node.EQ.66 // 15485
D=A // 15486
@13 // 15487
M=D // 15488
@DO_EQ // 15489
0;JMP // 15490
(Memory.add_node.EQ.66)
@SP // 15491
AM=M+1 // 15492
A=A-1 // 15493
M=D // 15494
@SP // 15495
A=M-1 // 15496
M=!D // 15497
@THAT // 15498
A=M // 15499
D=M // 15500
D=D-M // 15501
@15 // 15502
M=D // 15503
@Memory.add_node.GT.67 // 15504
D=A // 15505
@13 // 15506
M=D // 15507
@DO_GT // 15508
0;JMP // 15509
(Memory.add_node.GT.67)
D=!D // 15510
@SP // 15511
AM=M-1 // 15512
D=D&M // 15513
@15 // 15514
M=D // 15515
@Memory.add_node.EQ.65 // 15516
D=A // 15517
@13 // 15518
M=D // 15519
@DO_EQ // 15520
0;JMP // 15521
(Memory.add_node.EQ.65)
@WHILE_END_Memory.add_node1 // 15522
D;JNE // 15523

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      nested:
//        PushPopPair {
//          push: PushInstruction("local 0")
//          pop:  PopInstruction{address=local 1}
//        }
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15524
A=M // 15525
D=M // 15526
@LCL // 15527
A=M+1 // 15528
M=D // 15529
@LCL // 15530
A=M // 15531
D=M // 15532
@3 // 15533
D=D+A // 15534
@4 // 15535
M=D // 15536
@THAT // 15537
A=M // 15538
D=M // 15539
@LCL // 15540
A=M // 15541
M=D // 15542

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 15543
0;JMP // 15544

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 1"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL // 15545
A=M+1 // 15546
D=!M // 15547
@15 // 15548
M=D // 15549
@Memory.add_node.EQ.68 // 15550
D=A // 15551
@13 // 15552
M=D // 15553
@DO_EQ // 15554
0;JMP // 15555
(Memory.add_node.EQ.68)
@Memory.add_node.IfElse2 // 15556
D;JNE // 15557

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 15558
A=M // 15559
D=M // 15560
@4 // 15561
M=D // 15562

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15563
A=M+1 // 15564
D=M // 15565
@3 // 15566
D=D+A // 15567
@4 // 15568
M=D // 15569
@THAT // 15570
A=M // 15571
D=M // 15572
@THAT // 15573
A=M // 15574
M=D // 15575

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
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
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15576
A=M // 15577
D=M // 15578
@2 // 15579
D=D+A // 15580
@4 // 15581
M=D // 15582
@ARG // 15583
A=M+1 // 15584
D=M // 15585
@THAT // 15586
A=M // 15587
M=D // 15588

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15589
A=M // 15590
D=M // 15591
@4 // 15592
M=D // 15593
@ARG // 15594
A=M+1 // 15595
D=M // 15596
@THAT // 15597
A=M // 15598
M=D // 15599

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 15600
0;JMP // 15601

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////PushPopPair {
//  push: PushInstruction("local 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15602
A=M+1 // 15603
D=M // 15604
@3 // 15605
D=D+A // 15606
@4 // 15607
M=D // 15608
@LCL // 15609
A=M // 15610
D=M // 15611
@THAT // 15612
A=M // 15613
M=D // 15614

////PushPopPair {
//  push: PushInstruction("local 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15615
A=M+1 // 15616
D=M // 15617
@2 // 15618
D=D+A // 15619
@4 // 15620
M=D // 15621
@LCL // 15622
A=M+1 // 15623
D=M // 15624
@THAT // 15625
A=M // 15626
M=D // 15627

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@LCL // 15628
A=M // 15629
D=M // 15630
@15 // 15631
M=D // 15632
@Memory.add_node.EQ.69 // 15633
D=A // 15634
@13 // 15635
M=D // 15636
@DO_EQ // 15637
0;JMP // 15638
(Memory.add_node.EQ.69)
@Memory.add_node.IfElse3 // 15639
D;JNE // 15640

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 15641
A=M // 15642
D=M // 15643
@2 // 15644
D=D+A // 15645
@4 // 15646
M=D // 15647
@ARG // 15648
A=M+1 // 15649
D=M // 15650
@THAT // 15651
A=M // 15652
M=D // 15653

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 15654
0;JMP // 15655

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 15656
A=M+1 // 15657
D=M // 15658
@3 // 15659
D=D+A // 15660
@4 // 15661
M=D // 15662
@ARG // 15663
A=M+1 // 15664
D=M // 15665
@THAT // 15666
A=M // 15667
M=D // 15668

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 15669
AM=M+1 // 15670
A=A-1 // 15671
M=0 // 15672

////ReturnInstruction{}
@RETURN // 15673
0;JMP // 15674

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 15675
A=M // 15676
D=M // 15677
@4 // 15678
M=D // 15679
@ARG // 15680
A=M+1 // 15681
D=M // 15682
@THAT // 15683
A=M // 15684
M=D // 15685

////PushInstruction("constant 0")
@SP // 15686
AM=M+1 // 15687
A=A-1 // 15688
M=0 // 15689

////ReturnInstruction{}
@RETURN // 15690
0;JMP // 15691

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//              nested:
//                PushPopPair {
//                  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//                  nested:
//                    PushPopPair {
//                      push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//                      nested:
//                        PushPopPair {
//                          push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//                          pop:  PopInstruction{address=temp 0}
//                        }
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                  pop:  PopInstruction{address=temp 0}
//                }
//              pop:  PopInstruction{address=temp 0}
//            }
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=temp 0}
//    }
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15692
D=A // 15693
@14 // 15694
M=D // 15695
@Memory.init // 15696
D=A // 15697
@13 // 15698
M=D // 15699
@Sys.init.ret.0 // 15700
D=A // 15701
@CALL // 15702
0;JMP // 15703
(Sys.init.ret.0)
@SP // 15704
AM=M-1 // 15705
D=M // 15706
@5 // 15707
M=D // 15708
// call Math.init
@5 // 15709
D=A // 15710
@14 // 15711
M=D // 15712
@Math.init // 15713
D=A // 15714
@13 // 15715
M=D // 15716
@Sys.init.ret.1 // 15717
D=A // 15718
@CALL // 15719
0;JMP // 15720
(Sys.init.ret.1)
@SP // 15721
AM=M-1 // 15722
D=M // 15723
@5 // 15724
M=D // 15725
// call Screen.init
@5 // 15726
D=A // 15727
@14 // 15728
M=D // 15729
@Screen.init // 15730
D=A // 15731
@13 // 15732
M=D // 15733
@Sys.init.ret.2 // 15734
D=A // 15735
@CALL // 15736
0;JMP // 15737
(Sys.init.ret.2)
@SP // 15738
AM=M-1 // 15739
D=M // 15740
@5 // 15741
M=D // 15742
// call Output.init
@5 // 15743
D=A // 15744
@14 // 15745
M=D // 15746
@Output.init // 15747
D=A // 15748
@13 // 15749
M=D // 15750
@Sys.init.ret.3 // 15751
D=A // 15752
@CALL // 15753
0;JMP // 15754
(Sys.init.ret.3)
@SP // 15755
AM=M-1 // 15756
D=M // 15757
@5 // 15758
M=D // 15759
// call Keyboard.init
@5 // 15760
D=A // 15761
@14 // 15762
M=D // 15763
@Keyboard.init // 15764
D=A // 15765
@13 // 15766
M=D // 15767
@Sys.init.ret.4 // 15768
D=A // 15769
@CALL // 15770
0;JMP // 15771
(Sys.init.ret.4)
@SP // 15772
AM=M-1 // 15773
D=M // 15774
@5 // 15775
M=D // 15776
// call Main.main
@5 // 15777
D=A // 15778
@14 // 15779
M=D // 15780
@Main.main // 15781
D=A // 15782
@13 // 15783
M=D // 15784
@Sys.init.ret.5 // 15785
D=A // 15786
@CALL // 15787
0;JMP // 15788
(Sys.init.ret.5)
@SP // 15789
AM=M-1 // 15790
D=M // 15791
@5 // 15792
M=D // 15793
// call Sys.halt
@5 // 15794
D=A // 15795
@14 // 15796
M=D // 15797
@Sys.halt // 15798
D=A // 15799
@13 // 15800
M=D // 15801
@Sys.init.ret.6 // 15802
D=A // 15803
@CALL // 15804
0;JMP // 15805
(Sys.init.ret.6)
@SP // 15806
AM=M-1 // 15807
D=M // 15808
@5 // 15809
M=D // 15810

////PushInstruction("constant 0")
@SP // 15811
AM=M+1 // 15812
A=A-1 // 15813
M=0 // 15814

////ReturnInstruction{}
@RETURN // 15815
0;JMP // 15816

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("constant 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0 // 15817
@WHILE_END_Sys.halt1 // 15818
D;JNE // 15819

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15820
0;JMP // 15821

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15822
AM=M+1 // 15823
A=A-1 // 15824
M=0 // 15825

////ReturnInstruction{}
@RETURN // 15826
0;JMP // 15827

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15828
AM=M+1 // 15829
A=A-1 // 15830
M=0 // 15831

////LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)

////ConditionalGroup{push=BinaryPushGroup(
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
@ARG // 15832
A=M // 15833
D=M // 15834
@15 // 15835
M=D // 15836
@Sys.wait.GT.2 // 15837
D=A // 15838
@13 // 15839
M=D // 15840
@DO_GT // 15841
0;JMP // 15842
(Sys.wait.GT.2)
@15 // 15843
M=D // 15844
@Sys.wait.EQ.1 // 15845
D=A // 15846
@13 // 15847
M=D // 15848
@DO_EQ // 15849
0;JMP // 15850
(Sys.wait.EQ.1)
@WHILE_END_Sys.wait1 // 15851
D;JNE // 15852

////PushPopPair {
//  push: PushInstruction("constant 70")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//      pop:  PopInstruction{address=argument 0}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 15853
A=M // 15854
M=M-1 // 15855
@70 // 15856
D=A // 15857
@LCL // 15858
A=M // 15859
M=D // 15860

////LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 15861
A=M // 15862
D=M // 15863
@15 // 15864
M=D // 15865
@Sys.wait.GT.5 // 15866
D=A // 15867
@13 // 15868
M=D // 15869
@DO_GT // 15870
0;JMP // 15871
(Sys.wait.GT.5)
@15 // 15872
M=D // 15873
@Sys.wait.EQ.4 // 15874
D=A // 15875
@13 // 15876
M=D // 15877
@DO_EQ // 15878
0;JMP // 15879
(Sys.wait.EQ.4)
@WHILE_END_Sys.wait2 // 15880
D;JNE // 15881

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15882
A=M // 15883
M=M-1 // 15884

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15885
0;JMP // 15886

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15887
0;JMP // 15888

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15889
AM=M+1 // 15890
A=A-1 // 15891
M=0 // 15892

////ReturnInstruction{}
@RETURN // 15893
0;JMP // 15894

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 15895
AM=M+1 // 15896
A=A-1 // 15897
M=0 // 15898

////ReturnInstruction{}
@RETURN // 15899
0;JMP // 15900

////FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@24576 // 15901
D=A // 15902
@4 // 15903
M=D // 15904

////PushInstruction("that 0")
@THAT // 15905
A=M // 15906
D=M // 15907
@SP // 15908
AM=M+1 // 15909
A=A-1 // 15910
M=D // 15911

////ReturnInstruction{}
@RETURN // 15912
0;JMP // 15913

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 15914
AM=M+1 // 15915
A=A-1 // 15916
M=0 // 15917

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@24576 // 15918
D=A // 15919
@4 // 15920
M=D // 15921

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 15922
A=M // 15923
D=M // 15924
@15 // 15925
M=D // 15926
@Keyboard.readChar.EQ.2 // 15927
D=A // 15928
@13 // 15929
M=D // 15930
@DO_EQ // 15931
0;JMP // 15932
(Keyboard.readChar.EQ.2)
@15 // 15933
M=D // 15934
@Keyboard.readChar.EQ.1 // 15935
D=A // 15936
@13 // 15937
M=D // 15938
@DO_EQ // 15939
0;JMP // 15940
(Keyboard.readChar.EQ.1)
@WHILE_END_Keyboard.readChar1 // 15941
D;JNE // 15942

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 15943
0;JMP // 15944

////LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)

////PushPopPair {
//  push: PushInstruction("that 0")
//  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//  pop:  PopInstruction{address=local 0}
//}

@24576 // 15945
D=A // 15946
@4 // 15947
M=D // 15948
@THAT // 15949
A=M // 15950
D=M // 15951
@LCL // 15952
A=M // 15953
M=D // 15954

////LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 24576"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@24576 // 15955
D=A // 15956
@4 // 15957
M=D // 15958

////ConditionalGroup{push=BinaryPushGroup(
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
@THAT // 15959
A=M // 15960
D=M // 15961
@15 // 15962
M=D // 15963
@Keyboard.readChar.EQ.5 // 15964
D=A // 15965
@13 // 15966
M=D // 15967
@DO_EQ // 15968
0;JMP // 15969
(Keyboard.readChar.EQ.5)
D=!D // 15970
@15 // 15971
M=D // 15972
@Keyboard.readChar.EQ.4 // 15973
D=A // 15974
@13 // 15975
M=D // 15976
@DO_EQ // 15977
0;JMP // 15978
(Keyboard.readChar.EQ.4)
@WHILE_END_Keyboard.readChar2 // 15979
D;JNE // 15980

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 15981
0;JMP // 15982

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15983
A=M // 15984
D=M // 15985
@SP // 15986
AM=M+1 // 15987
A=A-1 // 15988
M=D // 15989
// call Output.printChar
@6 // 15990
D=A // 15991
@14 // 15992
M=D // 15993
@Output.printChar // 15994
D=A // 15995
@13 // 15996
M=D // 15997
@Keyboard.readChar.ret.0 // 15998
D=A // 15999
@CALL // 16000
0;JMP // 16001
(Keyboard.readChar.ret.0)
@SP // 16002
AM=M-1 // 16003
D=M // 16004
@5 // 16005
M=D // 16006

////PushInstruction("local 0")
@LCL // 16007
A=M // 16008
D=M // 16009
@SP // 16010
AM=M+1 // 16011
A=A-1 // 16012
M=D // 16013

////ReturnInstruction{}
@RETURN // 16014
0;JMP // 16015

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 16016
AM=M+1 // 16017
A=A-1 // 16018
M=0 // 16019
@SP // 16020
AM=M+1 // 16021
A=A-1 // 16022
M=0 // 16023

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//      pop:  PopInstruction{address=local 0}
//    }
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 16024
A=M // 16025
D=M // 16026
@SP // 16027
AM=M+1 // 16028
A=A-1 // 16029
M=D // 16030
// call Output.printString
@6 // 16031
D=A // 16032
@14 // 16033
M=D // 16034
@Output.printString // 16035
D=A // 16036
@13 // 16037
M=D // 16038
@Keyboard.readLine.ret.0 // 16039
D=A // 16040
@CALL // 16041
0;JMP // 16042
(Keyboard.readLine.ret.0)
@SP // 16043
AM=M-1 // 16044
D=M // 16045
@5 // 16046
M=D // 16047
@50 // 16048
D=A // 16049
@SP // 16050
AM=M+1 // 16051
A=A-1 // 16052
M=D // 16053
// call String.new
@6 // 16054
D=A // 16055
@14 // 16056
M=D // 16057
@String.new // 16058
D=A // 16059
@13 // 16060
M=D // 16061
@Keyboard.readLine.ret.1 // 16062
D=A // 16063
@CALL // 16064
0;JMP // 16065
(Keyboard.readLine.ret.1)
@SP // 16066
AM=M-1 // 16067
D=M // 16068
@LCL // 16069
A=M // 16070
M=D // 16071
// call Keyboard.readChar
@5 // 16072
D=A // 16073
@14 // 16074
M=D // 16075
@Keyboard.readChar // 16076
D=A // 16077
@13 // 16078
M=D // 16079
@Keyboard.readLine.ret.2 // 16080
D=A // 16081
@CALL // 16082
0;JMP // 16083
(Keyboard.readLine.ret.2)
@SP // 16084
AM=M-1 // 16085
D=M // 16086
@LCL // 16087
A=M+1 // 16088
M=D // 16089

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 16090
A=M+1 // 16091
D=M // 16092
@SP // 16093
AM=M+1 // 16094
A=A-1 // 16095
M=D // 16096
// call String.newLine
@5 // 16097
D=A // 16098
@14 // 16099
M=D // 16100
@String.newLine // 16101
D=A // 16102
@13 // 16103
M=D // 16104
@Keyboard.readLine.ret.4 // 16105
D=A // 16106
@CALL // 16107
0;JMP // 16108
(Keyboard.readLine.ret.4)
@SP // 16109
AM=M-1 // 16110
D=M // 16111
@SP // 16112
AM=M-1 // 16113
D=M-D // 16114
@15 // 16115
M=D // 16116
@Keyboard.readLine.EQ.8 // 16117
D=A // 16118
@13 // 16119
M=D // 16120
@DO_EQ // 16121
0;JMP // 16122
(Keyboard.readLine.EQ.8)
D=!D // 16123
@15 // 16124
M=D // 16125
@Keyboard.readLine.EQ.7 // 16126
D=A // 16127
@13 // 16128
M=D // 16129
@DO_EQ // 16130
0;JMP // 16131
(Keyboard.readLine.EQ.7)
@WHILE_END_Keyboard.readLine1 // 16132
D;JNE // 16133

////ConditionalGroup{push=BinaryPushGroup(
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
@LCL // 16134
A=M+1 // 16135
D=M // 16136
@129 // 16137
D=D-A // 16138
@15 // 16139
M=D // 16140
@Keyboard.readLine.EQ.11 // 16141
D=A // 16142
@13 // 16143
M=D // 16144
@DO_EQ // 16145
0;JMP // 16146
(Keyboard.readLine.EQ.11)
@15 // 16147
M=D // 16148
@Keyboard.readLine.EQ.10 // 16149
D=A // 16150
@13 // 16151
M=D // 16152
@DO_EQ // 16153
0;JMP // 16154
(Keyboard.readLine.EQ.10)
@Keyboard.readLine.IfElse1 // 16155
D;JNE // 16156

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16157
A=M // 16158
D=M // 16159
@SP // 16160
AM=M+1 // 16161
A=A-1 // 16162
M=D // 16163
// call String.eraseLastChar
@6 // 16164
D=A // 16165
@14 // 16166
M=D // 16167
@String.eraseLastChar // 16168
D=A // 16169
@13 // 16170
M=D // 16171
@Keyboard.readLine.ret.5 // 16172
D=A // 16173
@CALL // 16174
0;JMP // 16175
(Keyboard.readLine.ret.5)
@SP // 16176
AM=M-1 // 16177
D=M // 16178
@5 // 16179
M=D // 16180

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 16181
0;JMP // 16182

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16183
A=M // 16184
D=M // 16185
@SP // 16186
AM=M+1 // 16187
A=A-1 // 16188
M=D // 16189
@LCL // 16190
A=M+1 // 16191
D=M // 16192
@SP // 16193
AM=M+1 // 16194
A=A-1 // 16195
M=D // 16196
// call String.appendChar
@7 // 16197
D=A // 16198
@14 // 16199
M=D // 16200
@String.appendChar // 16201
D=A // 16202
@13 // 16203
M=D // 16204
@Keyboard.readLine.ret.6 // 16205
D=A // 16206
@CALL // 16207
0;JMP // 16208
(Keyboard.readLine.ret.6)
@SP // 16209
AM=M-1 // 16210
D=M // 16211
@5 // 16212
M=D // 16213

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 16214
D=A // 16215
@14 // 16216
M=D // 16217
@Keyboard.readChar // 16218
D=A // 16219
@13 // 16220
M=D // 16221
@Keyboard.readLine.ret.7 // 16222
D=A // 16223
@CALL // 16224
0;JMP // 16225
(Keyboard.readLine.ret.7)
@SP // 16226
AM=M-1 // 16227
D=M // 16228
@LCL // 16229
A=M+1 // 16230
M=D // 16231

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 16232
0;JMP // 16233

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 16234
A=M // 16235
D=M // 16236
@SP // 16237
AM=M+1 // 16238
A=A-1 // 16239
M=D // 16240

////ReturnInstruction{}
@RETURN // 16241
0;JMP // 16242

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 16243
AM=M+1 // 16244
A=A-1 // 16245
M=0 // 16246

////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}}
@ARG // 16247
A=M // 16248
D=M // 16249
@SP // 16250
AM=M+1 // 16251
A=A-1 // 16252
M=D // 16253
// call Memory.alloc
@6 // 16254
D=A // 16255
@14 // 16256
M=D // 16257
@Memory.alloc // 16258
D=A // 16259
@13 // 16260
M=D // 16261
@Array.new.ret.0 // 16262
D=A // 16263
@CALL // 16264
0;JMP // 16265
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 16266
0;JMP // 16267

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

