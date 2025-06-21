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
//                                          push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"),