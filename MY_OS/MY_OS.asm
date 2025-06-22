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
////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}}
@ARG // 130
A=M // 131
D=M // 132
@SP // 133
AM=M+1 // 134
A=A-1 // 135
M=D // 136
// call Memory.alloc
@6 // 137
D=A // 138
@14 // 139
M=D // 140
@Memory.alloc // 141
D=A // 142
@13 // 143
M=D // 144
@Array.new.ret.0 // 145
D=A // 146
@CALL // 147
0;JMP // 148
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 149
0;JMP // 150

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

////  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=pointer 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Array.dispose=0, Array.new=1}, currentFunction='Array.dispose'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 151
D=M // 152
@SP // 153
AM=M+1 // 154
A=A-1 // 155
M=D // 156
// call Memory.deAlloc
@6 // 157
D=A // 158
@14 // 159
M=D // 160
@Memory.deAlloc // 161
D=A // 162
@13 // 163
M=D // 164
@Array.dispose.ret.0 // 165
D=A // 166
@CALL // 167
0;JMP // 168
(Array.dispose.ret.0)
@ARG // 169
A=M // 170
D=M // 171
@3 // 172
M=D // 173
@SP // 174
AM=M-1 // 175
D=M // 176
@5 // 177
M=D // 178

////PushInstruction("constant 0")
@SP // 179
AM=M+1 // 180
A=A-1 // 181
M=0 // 182

////ReturnInstruction{}
@RETURN // 183
0;JMP // 184

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 185
AM=M+1 // 186
A=A-1 // 187
M=0 // 188

////ReturnInstruction{}
@RETURN // 189
0;JMP // 190

////FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)

////Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("constant 24576"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
@24576 // 191
A=A // 192
D=M // 193
@SP // 194
AM=M+1 // 195
A=A-1 // 196
M=D // 197

////ReturnInstruction{}
@RETURN // 198
0;JMP // 199

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 200
AM=M+1 // 201
A=A-1 // 202
M=0 // 203

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("constant 24576"),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}}
@Keyboard.readChar.EQ.1 // 204
D=A // 205
@SP // 206
AM=M+1 // 207
A=A-1 // 208
M=D // 209
@Keyboard.readChar.EQ.2 // 210
D=A // 211
@SP // 212
AM=M+1 // 213
A=A-1 // 214
M=D // 215
@24576 // 216
A=A // 217
D=M // 218
@14 // 219
M=D // 220
@SP // 221
AM=M-1 // 222
D=M // 223
@13 // 224
M=D // 225
@14 // 226
D=M // 227
@DO_EQ // 228
0;JMP // 229
(Keyboard.readChar.EQ.2)
@14 // 230
M=D // 231
@SP // 232
AM=M-1 // 233
D=M // 234
@13 // 235
M=D // 236
@14 // 237
D=M // 238
@DO_EQ // 239
0;JMP // 240
(Keyboard.readChar.EQ.1)
@WHILE_END_Keyboard.readChar1 // 241
D;JNE // 242

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 243
0;JMP // 244

////LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("constant 24576"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 0}
//}

@24576 // 245
A=A // 246
D=M // 247
@LCL // 248
A=M // 249
M=D // 250

////LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    Dereference(
//                        base:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("constant 24576"),
//                                right:
//                                    PushInstruction("constant 0"),
//                                binaryOp: "ADD"
//                            )
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}}
@Keyboard.readChar.EQ.4 // 251
D=A // 252
@SP // 253
AM=M+1 // 254
A=A-1 // 255
M=D // 256
@Keyboard.readChar.EQ.5 // 257
D=A // 258
@SP // 259
AM=M+1 // 260
A=A-1 // 261
M=D // 262
@24576 // 263
A=A // 264
D=M // 265
@14 // 266
M=D // 267
@SP // 268
AM=M-1 // 269
D=M // 270
@13 // 271
M=D // 272
@14 // 273
D=M // 274
@DO_EQ // 275
0;JMP // 276
(Keyboard.readChar.EQ.5)
D=!D // 277
@14 // 278
M=D // 279
@SP // 280
AM=M-1 // 281
D=M // 282
@13 // 283
M=D // 284
@14 // 285
D=M // 286
@DO_EQ // 287
0;JMP // 288
(Keyboard.readChar.EQ.4)
@WHILE_END_Keyboard.readChar2 // 289
D;JNE // 290

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 291
0;JMP // 292

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 293
A=M // 294
D=M // 295
@SP // 296
AM=M+1 // 297
A=A-1 // 298
M=D // 299
// call Output.printChar
@6 // 300
D=A // 301
@14 // 302
M=D // 303
@Output.printChar // 304
D=A // 305
@13 // 306
M=D // 307
@Keyboard.readChar.ret.0 // 308
D=A // 309
@CALL // 310
0;JMP // 311
(Keyboard.readChar.ret.0)
@SP // 312
AM=M-1 // 313
D=M // 314
@5 // 315
M=D // 316

////PushInstruction("local 0")
@LCL // 317
A=M // 318
D=M // 319
@SP // 320
AM=M+1 // 321
A=A-1 // 322
M=D // 323

////ReturnInstruction{}
@RETURN // 324
0;JMP // 325

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 326
AM=M+1 // 327
A=A-1 // 328
M=0 // 329
@SP // 330
AM=M+1 // 331
A=A-1 // 332
M=0 // 333

////  nested:
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 334
D=A // 335
@14 // 336
M=D // 337
@Keyboard.readChar // 338
D=A // 339
@13 // 340
M=D // 341
@Keyboard.readLine.ret.0 // 342
D=A // 343
@CALL // 344
0;JMP // 345
(Keyboard.readLine.ret.0)
@50 // 346
D=A // 347
@SP // 348
AM=M+1 // 349
A=A-1 // 350
M=D // 351
// call String.new
@6 // 352
D=A // 353
@14 // 354
M=D // 355
@String.new // 356
D=A // 357
@13 // 358
M=D // 359
@Keyboard.readLine.ret.1 // 360
D=A // 361
@CALL // 362
0;JMP // 363
(Keyboard.readLine.ret.1)
@ARG // 364
A=M // 365
D=M // 366
@SP // 367
AM=M+1 // 368
A=A-1 // 369
M=D // 370
// call Output.printString
@6 // 371
D=A // 372
@14 // 373
M=D // 374
@Output.printString // 375
D=A // 376
@13 // 377
M=D // 378
@Keyboard.readLine.ret.2 // 379
D=A // 380
@CALL // 381
0;JMP // 382
(Keyboard.readLine.ret.2)
@SP // 383
AM=M-1 // 384
D=M // 385
@5 // 386
M=D // 387
@SP // 388
AM=M-1 // 389
D=M // 390
@LCL // 391
A=M // 392
M=D // 393
@SP // 394
AM=M-1 // 395
D=M // 396
@LCL // 397
A=M+1 // 398
M=D // 399

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
@Keyboard.readLine.EQ.7 // 400
D=A // 401
@SP // 402
AM=M+1 // 403
A=A-1 // 404
M=D // 405
@Keyboard.readLine.EQ.8 // 406
D=A // 407
@SP // 408
AM=M+1 // 409
A=A-1 // 410
M=D // 411
@LCL // 412
A=M+1 // 413
D=M // 414
@SP // 415
AM=M+1 // 416
A=A-1 // 417
M=D // 418
// call String.newLine
@5 // 419
D=A // 420
@14 // 421
M=D // 422
@String.newLine // 423
D=A // 424
@13 // 425
M=D // 426
@Keyboard.readLine.ret.4 // 427
D=A // 428
@CALL // 429
0;JMP // 430
(Keyboard.readLine.ret.4)
@SP // 431
AM=M-1 // 432
D=M // 433
@SP // 434
AM=M-1 // 435
D=M-D // 436
@14 // 437
M=D // 438
@SP // 439
AM=M-1 // 440
D=M // 441
@13 // 442
M=D // 443
@14 // 444
D=M // 445
@DO_EQ // 446
0;JMP // 447
(Keyboard.readLine.EQ.8)
D=!D // 448
@14 // 449
M=D // 450
@SP // 451
AM=M-1 // 452
D=M // 453
@13 // 454
M=D // 455
@14 // 456
D=M // 457
@DO_EQ // 458
0;JMP // 459
(Keyboard.readLine.EQ.7)
@WHILE_END_Keyboard.readLine1 // 460
D;JNE // 461

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
@Keyboard.readLine.EQ.10 // 462
D=A // 463
@SP // 464
AM=M+1 // 465
A=A-1 // 466
M=D // 467
@Keyboard.readLine.EQ.11 // 468
D=A // 469
@SP // 470
AM=M+1 // 471
A=A-1 // 472
M=D // 473
@LCL // 474
A=M+1 // 475
D=M // 476
@129 // 477
D=D-A // 478
@14 // 479
M=D // 480
@SP // 481
AM=M-1 // 482
D=M // 483
@13 // 484
M=D // 485
@14 // 486
D=M // 487
@DO_EQ // 488
0;JMP // 489
(Keyboard.readLine.EQ.11)
@14 // 490
M=D // 491
@SP // 492
AM=M-1 // 493
D=M // 494
@13 // 495
M=D // 496
@14 // 497
D=M // 498
@DO_EQ // 499
0;JMP // 500
(Keyboard.readLine.EQ.10)
@Keyboard.readLine.IfElse1 // 501
D;JNE // 502

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 503
A=M // 504
D=M // 505
@SP // 506
AM=M+1 // 507
A=A-1 // 508
M=D // 509
// call String.eraseLastChar
@6 // 510
D=A // 511
@14 // 512
M=D // 513
@String.eraseLastChar // 514
D=A // 515
@13 // 516
M=D // 517
@Keyboard.readLine.ret.5 // 518
D=A // 519
@CALL // 520
0;JMP // 521
(Keyboard.readLine.ret.5)
@SP // 522
AM=M-1 // 523
D=M // 524
@5 // 525
M=D // 526

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 527
0;JMP // 528

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 529
A=M // 530
D=M // 531
@SP // 532
AM=M+1 // 533
A=A-1 // 534
M=D // 535
@LCL // 536
A=M+1 // 537
D=M // 538
@SP // 539
AM=M+1 // 540
A=A-1 // 541
M=D // 542
// call String.appendChar
@7 // 543
D=A // 544
@14 // 545
M=D // 546
@String.appendChar // 547
D=A // 548
@13 // 549
M=D // 550
@Keyboard.readLine.ret.6 // 551
D=A // 552
@CALL // 553
0;JMP // 554
(Keyboard.readLine.ret.6)
@SP // 555
AM=M-1 // 556
D=M // 557
@5 // 558
M=D // 559

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readLine'}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 560
D=A // 561
@14 // 562
M=D // 563
@Keyboard.readChar // 564
D=A // 565
@13 // 566
M=D // 567
@Keyboard.readLine.ret.7 // 568
D=A // 569
@CALL // 570
0;JMP // 571
(Keyboard.readLine.ret.7)
@SP // 572
AM=M-1 // 573
D=M // 574
@LCL // 575
A=M+1 // 576
M=D // 577

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 578
0;JMP // 579

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 580
A=M // 581
D=M // 582
@SP // 583
AM=M+1 // 584
A=A-1 // 585
M=D // 586

////ReturnInstruction{}
@RETURN // 587
0;JMP // 588

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 589
AM=M+1 // 590
A=A-1 // 591
M=0 // 592

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Keyboard.readLine', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=0, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}, currentFunction='Keyboard.readInt'}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 593
A=M // 594
D=M // 595
@SP // 596
AM=M+1 // 597
A=A-1 // 598
M=D // 599
// call Keyboard.readLine
@6 // 600
D=A // 601
@14 // 602
M=D // 603
@Keyboard.readLine // 604
D=A // 605
@13 // 606
M=D // 607
@Keyboard.readInt.ret.0 // 608
D=A // 609
@CALL // 610
0;JMP // 611
(Keyboard.readInt.ret.0)
@SP // 612
AM=M-1 // 613
D=M // 614
@LCL // 615
A=M // 616
M=D // 617

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.intValue', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=8}, currentFunction='Keyboard.readInt'}}
@LCL // 618
A=M // 619
D=M // 620
@SP // 621
AM=M+1 // 622
A=A-1 // 623
M=D // 624
// call String.intValue
@6 // 625
D=A // 626
@14 // 627
M=D // 628
@String.intValue // 629
D=A // 630
@13 // 631
M=D // 632
@Keyboard.readInt.ret.1 // 633
D=A // 634
@CALL // 635
0;JMP // 636
(Keyboard.readInt.ret.1)

////ReturnInstruction{}
@RETURN // 637
0;JMP // 638

////FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)

////  nested:
//      nested:
//          nested:
//              nested:
//                  nested:
//                      nested:
//                          nested:
//                              nested:
//                                  nested:
//                                      nested:
//                                          nested:
//                                              nested:
//                                                  nested:
//                                                      nested:
//                                                          nested:
//                                                              nested:
//                                                                  nested:
//                                                                      nested:
//                                                                          nested:
//                                                                            PushPopPair {
//                                                                              push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                                              pop:  PopInstruction{address=temp 0}
//                                                                            }
//                                                                        PushPopPair {
//                                                                          push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                                          pop:  PopInstruction{address=temp 0}
//                                                                        }
//                                                                    PushPopPair {
//                                                                      push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                                      pop:  PopInstruction{address=temp 0}
//                                                                    }
//                                                                PushPopPair {
//                                                                  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                                  pop:  PopInstruction{address=temp 0}
//                                                                }
//                                                            PushPopPair {
//                                                              push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                              pop:  PopInstruction{address=temp 0}
//                                                            }
//                                                        PushPopPair {
//                                                          push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                          pop:  PopInstruction{address=temp 0}
//                                                        }
//                                                    PushPopPair {
//                                                      push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                      pop:  PopInstruction{address=temp 0}
//                                                    }
//                                                PushPopPair {
//                                                  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                                  pop:  PopInstruction{address=temp 0}
//                                                }
//                                            PushPopPair {
//                                              push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                              pop:  PopInstruction{address=temp 0}
//                                            }
//                                        PushPopPair {
//                                          push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                          pop:  PopInstruction{address=temp 0}
//                                        }
//                                    PushPopPair {
//                                      push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                      pop:  PopInstruction{address=temp 0}
//                                    }
//                                PushPopPair {
//                                  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                                  pop:  PopInstruction{address=temp 0}
//                                }
//                            PushPopPair {
//                              push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                              pop:  PopInstruction{address=temp 0}
//                            }
//                        PushPopPair {
//                          push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                          pop:  PopInstruction{address=temp 0}
//                        }
//                    PushPopPair {
//                      push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//                  pop:  PopInstruction{address=temp 0}
//                }
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//              pop:  PopInstruction{address=temp 0}
//            }
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 19")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 72")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 101")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 108")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 108")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 111")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 44")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 32")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 110")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 97")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 110")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 100")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 116")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 101")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 116")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 114")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 105")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 115")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}, PushInstruction("constant 33")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Main.main=0}, currentFunction='Main.main'}}], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Main.main=0}, currentFunction='Main.main'}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 639
D=A // 640
@14 // 641
M=D // 642
@Output.println // 643
D=A // 644
@13 // 645
M=D // 646
@Main.main.ret.0 // 647
D=A // 648
@CALL // 649
0;JMP // 650
(Main.main.ret.0)
@19 // 651
D=A // 652
@SP // 653
AM=M+1 // 654
A=A-1 // 655
M=D // 656
// call String.new
@6 // 657
D=A // 658
@14 // 659
M=D // 660
@String.new // 661
D=A // 662
@13 // 663
M=D // 664
@Main.main.ret.1 // 665
D=A // 666
@CALL // 667
0;JMP // 668
(Main.main.ret.1)
@72 // 669
D=A // 670
@SP // 671
AM=M+1 // 672
A=A-1 // 673
M=D // 674
// call String.appendChar
@7 // 675
D=A // 676
@14 // 677
M=D // 678
@String.appendChar // 679
D=A // 680
@13 // 681
M=D // 682
@Main.main.ret.2 // 683
D=A // 684
@CALL // 685
0;JMP // 686
(Main.main.ret.2)
@101 // 687
D=A // 688
@SP // 689
AM=M+1 // 690
A=A-1 // 691
M=D // 692
// call String.appendChar
@7 // 693
D=A // 694
@14 // 695
M=D // 696
@String.appendChar // 697
D=A // 698
@13 // 699
M=D // 700
@Main.main.ret.3 // 701
D=A // 702
@CALL // 703
0;JMP // 704
(Main.main.ret.3)
@108 // 705
D=A // 706
@SP // 707
AM=M+1 // 708
A=A-1 // 709
M=D // 710
// call String.appendChar
@7 // 711
D=A // 712
@14 // 713
M=D // 714
@String.appendChar // 715
D=A // 716
@13 // 717
M=D // 718
@Main.main.ret.4 // 719
D=A // 720
@CALL // 721
0;JMP // 722
(Main.main.ret.4)
@108 // 723
D=A // 724
@SP // 725
AM=M+1 // 726
A=A-1 // 727
M=D // 728
// call String.appendChar
@7 // 729
D=A // 730
@14 // 731
M=D // 732
@String.appendChar // 733
D=A // 734
@13 // 735
M=D // 736
@Main.main.ret.5 // 737
D=A // 738
@CALL // 739
0;JMP // 740
(Main.main.ret.5)
@111 // 741
D=A // 742
@SP // 743
AM=M+1 // 744
A=A-1 // 745
M=D // 746
// call String.appendChar
@7 // 747
D=A // 748
@14 // 749
M=D // 750
@String.appendChar // 751
D=A // 752
@13 // 753
M=D // 754
@Main.main.ret.6 // 755
D=A // 756
@CALL // 757
0;JMP // 758
(Main.main.ret.6)
@44 // 759
D=A // 760
@SP // 761
AM=M+1 // 762
A=A-1 // 763
M=D // 764
// call String.appendChar
@7 // 765
D=A // 766
@14 // 767
M=D // 768
@String.appendChar // 769
D=A // 770
@13 // 771
M=D // 772
@Main.main.ret.7 // 773
D=A // 774
@CALL // 775
0;JMP // 776
(Main.main.ret.7)
@32 // 777
D=A // 778
@SP // 779
AM=M+1 // 780
A=A-1 // 781
M=D // 782
// call String.appendChar
@7 // 783
D=A // 784
@14 // 785
M=D // 786
@String.appendChar // 787
D=A // 788
@13 // 789
M=D // 790
@Main.main.ret.8 // 791
D=A // 792
@CALL // 793
0;JMP // 794
(Main.main.ret.8)
@110 // 795
D=A // 796
@SP // 797
AM=M+1 // 798
A=A-1 // 799
M=D // 800
// call String.appendChar
@7 // 801
D=A // 802
@14 // 803
M=D // 804
@String.appendChar // 805
D=A // 806
@13 // 807
M=D // 808
@Main.main.ret.9 // 809
D=A // 810
@CALL // 811
0;JMP // 812
(Main.main.ret.9)
@97 // 813
D=A // 814
@SP // 815
AM=M+1 // 816
A=A-1 // 817
M=D // 818
// call String.appendChar
@7 // 819
D=A // 820
@14 // 821
M=D // 822
@String.appendChar // 823
D=A // 824
@13 // 825
M=D // 826
@Main.main.ret.10 // 827
D=A // 828
@CALL // 829
0;JMP // 830
(Main.main.ret.10)
@110 // 831
D=A // 832
@SP // 833
AM=M+1 // 834
A=A-1 // 835
M=D // 836
// call String.appendChar
@7 // 837
D=A // 838
@14 // 839
M=D // 840
@String.appendChar // 841
D=A // 842
@13 // 843
M=D // 844
@Main.main.ret.11 // 845
D=A // 846
@CALL // 847
0;JMP // 848
(Main.main.ret.11)
@100 // 849
D=A // 850
@SP // 851
AM=M+1 // 852
A=A-1 // 853
M=D // 854
// call String.appendChar
@7 // 855
D=A // 856
@14 // 857
M=D // 858
@String.appendChar // 859
D=A // 860
@13 // 861
M=D // 862
@Main.main.ret.12 // 863
D=A // 864
@CALL // 865
0;JMP // 866
(Main.main.ret.12)
@50 // 867
D=A // 868
@SP // 869
AM=M+1 // 870
A=A-1 // 871
M=D // 872
// call String.appendChar
@7 // 873
D=A // 874
@14 // 875
M=D // 876
@String.appendChar // 877
D=A // 878
@13 // 879
M=D // 880
@Main.main.ret.13 // 881
D=A // 882
@CALL // 883
0;JMP // 884
(Main.main.ret.13)
@116 // 885
D=A // 886
@SP // 887
AM=M+1 // 888
A=A-1 // 889
M=D // 890
// call String.appendChar
@7 // 891
D=A // 892
@14 // 893
M=D // 894
@String.appendChar // 895
D=A // 896
@13 // 897
M=D // 898
@Main.main.ret.14 // 899
D=A // 900
@CALL // 901
0;JMP // 902
(Main.main.ret.14)
@101 // 903
D=A // 904
@SP // 905
AM=M+1 // 906
A=A-1 // 907
M=D // 908
// call String.appendChar
@7 // 909
D=A // 910
@14 // 911
M=D // 912
@String.appendChar // 913
D=A // 914
@13 // 915
M=D // 916
@Main.main.ret.15 // 917
D=A // 918
@CALL // 919
0;JMP // 920
(Main.main.ret.15)
@116 // 921
D=A // 922
@SP // 923
AM=M+1 // 924
A=A-1 // 925
M=D // 926
// call String.appendChar
@7 // 927
D=A // 928
@14 // 929
M=D // 930
@String.appendChar // 931
D=A // 932
@13 // 933
M=D // 934
@Main.main.ret.16 // 935
D=A // 936
@CALL // 937
0;JMP // 938
(Main.main.ret.16)
@114 // 939
D=A // 940
@SP // 941
AM=M+1 // 942
A=A-1 // 943
M=D // 944
// call String.appendChar
@7 // 945
D=A // 946
@14 // 947
M=D // 948
@String.appendChar // 949
D=A // 950
@13 // 951
M=D // 952
@Main.main.ret.17 // 953
D=A // 954
@CALL // 955
0;JMP // 956
(Main.main.ret.17)
@105 // 957
D=A // 958
@SP // 959
AM=M+1 // 960
A=A-1 // 961
M=D // 962
// call String.appendChar
@7 // 963
D=A // 964
@14 // 965
M=D // 966
@String.appendChar // 967
D=A // 968
@13 // 969
M=D // 970
@Main.main.ret.18 // 971
D=A // 972
@CALL // 973
0;JMP // 974
(Main.main.ret.18)
@115 // 975
D=A // 976
@SP // 977
AM=M+1 // 978
A=A-1 // 979
M=D // 980
// call String.appendChar
@7 // 981
D=A // 982
@14 // 983
M=D // 984
@String.appendChar // 985
D=A // 986
@13 // 987
M=D // 988
@Main.main.ret.19 // 989
D=A // 990
@CALL // 991
0;JMP // 992
(Main.main.ret.19)
@33 // 993
D=A // 994
@SP // 995
AM=M+1 // 996
A=A-1 // 997
M=D // 998
// call String.appendChar
@7 // 999
D=A // 1000
@14 // 1001
M=D // 1002
@String.appendChar // 1003
D=A // 1004
@13 // 1005
M=D // 1006
@Main.main.ret.20 // 1007
D=A // 1008
@CALL // 1009
0;JMP // 1010
(Main.main.ret.20)
// call Output.printString
@6 // 1011
D=A // 1012
@14 // 1013
M=D // 1014
@Output.printString // 1015
D=A // 1016
@13 // 1017
M=D // 1018
@Main.main.ret.21 // 1019
D=A // 1020
@CALL // 1021
0;JMP // 1022
(Main.main.ret.21)
@117 // 1023
D=A // 1024
@SP // 1025
AM=M+1 // 1026
A=A-1 // 1027
M=D // 1028
@35 // 1029
D=A // 1030
@SP // 1031
AM=M+1 // 1032
A=A-1 // 1033
M=D // 1034
@102 // 1035
D=A // 1036
@SP // 1037
AM=M+1 // 1038
A=A-1 // 1039
M=D // 1040
@20 // 1041
D=A // 1042
@SP // 1043
AM=M+1 // 1044
A=A-1 // 1045
M=D // 1046
// call Screen.drawLine
@9 // 1047
D=A // 1048
@14 // 1049
M=D // 1050
@Screen.drawLine // 1051
D=A // 1052
@13 // 1053
M=D // 1054
@Main.main.ret.22 // 1055
D=A // 1056
@CALL // 1057
0;JMP // 1058
(Main.main.ret.22)
@106 // 1059
D=A // 1060
@SP // 1061
AM=M+1 // 1062
A=A-1 // 1063
M=D // 1064
@60 // 1065
D=A // 1066
@SP // 1067
AM=M+1 // 1068
A=A-1 // 1069
M=D // 1070
@86 // 1071
D=A // 1072
@SP // 1073
AM=M+1 // 1074
A=A-1 // 1075
M=D // 1076
@60 // 1077
D=A // 1078
@SP // 1079
AM=M+1 // 1080
A=A-1 // 1081
M=D // 1082
// call Screen.drawLine
@9 // 1083
D=A // 1084
@14 // 1085
M=D // 1086
@Screen.drawLine // 1087
D=A // 1088
@13 // 1089
M=D // 1090
@Main.main.ret.23 // 1091
D=A // 1092
@CALL // 1093
0;JMP // 1094
(Main.main.ret.23)
@117 // 1095
D=A // 1096
@SP // 1097
AM=M+1 // 1098
A=A-1 // 1099
M=D // 1100
@85 // 1101
D=A // 1102
@SP // 1103
AM=M+1 // 1104
A=A-1 // 1105
M=D // 1106
@102 // 1107
D=A // 1108
@SP // 1109
AM=M+1 // 1110
A=A-1 // 1111
M=D // 1112
@100 // 1113
D=A // 1114
@SP // 1115
AM=M+1 // 1116
A=A-1 // 1117
M=D // 1118
// call Screen.drawLine
@9 // 1119
D=A // 1120
@14 // 1121
M=D // 1122
@Screen.drawLine // 1123
D=A // 1124
@13 // 1125
M=D // 1126
@Main.main.ret.24 // 1127
D=A // 1128
@CALL // 1129
0;JMP // 1130
(Main.main.ret.24)
@140 // 1131
D=A // 1132
@SP // 1133
AM=M+1 // 1134
A=A-1 // 1135
M=D // 1136
@94 // 1137
D=A // 1138
@SP // 1139
AM=M+1 // 1140
A=A-1 // 1141
M=D // 1142
@140 // 1143
D=A // 1144
@SP // 1145
AM=M+1 // 1146
A=A-1 // 1147
M=D // 1148
@114 // 1149
D=A // 1150
@SP // 1151
AM=M+1 // 1152
A=A-1 // 1153
M=D // 1154
// call Screen.drawLine
@9 // 1155
D=A // 1156
@14 // 1157
M=D // 1158
@Screen.drawLine // 1159
D=A // 1160
@13 // 1161
M=D // 1162
@Main.main.ret.25 // 1163
D=A // 1164
@CALL // 1165
0;JMP // 1166
(Main.main.ret.25)
@163 // 1167
D=A // 1168
@SP // 1169
AM=M+1 // 1170
A=A-1 // 1171
M=D // 1172
@85 // 1173
D=A // 1174
@SP // 1175
AM=M+1 // 1176
A=A-1 // 1177
M=D // 1178
@178 // 1179
D=A // 1180
@SP // 1181
AM=M+1 // 1182
A=A-1 // 1183
M=D // 1184
@100 // 1185
D=A // 1186
@SP // 1187
AM=M+1 // 1188
A=A-1 // 1189
M=D // 1190
// call Screen.drawLine
@9 // 1191
D=A // 1192
@14 // 1193
M=D // 1194
@Screen.drawLine // 1195
D=A // 1196
@13 // 1197
M=D // 1198
@Main.main.ret.26 // 1199
D=A // 1200
@CALL // 1201
0;JMP // 1202
(Main.main.ret.26)
@174 // 1203
D=A // 1204
@SP // 1205
AM=M+1 // 1206
A=A-1 // 1207
M=D // 1208
@60 // 1209
D=A // 1210
@SP // 1211
AM=M+1 // 1212
A=A-1 // 1213
M=D // 1214
@194 // 1215
D=A // 1216
@SP // 1217
AM=M+1 // 1218
A=A-1 // 1219
M=D // 1220
@60 // 1221
D=A // 1222
@SP // 1223
AM=M+1 // 1224
A=A-1 // 1225
M=D // 1226
// call Screen.drawLine
@9 // 1227
D=A // 1228
@14 // 1229
M=D // 1230
@Screen.drawLine // 1231
D=A // 1232
@13 // 1233
M=D // 1234
@Main.main.ret.27 // 1235
D=A // 1236
@CALL // 1237
0;JMP // 1238
(Main.main.ret.27)
@163 // 1239
D=A // 1240
@SP // 1241
AM=M+1 // 1242
A=A-1 // 1243
M=D // 1244
@35 // 1245
D=A // 1246
@SP // 1247
AM=M+1 // 1248
A=A-1 // 1249
M=D // 1250
@178 // 1251
D=A // 1252
@SP // 1253
AM=M+1 // 1254
A=A-1 // 1255
M=D // 1256
@20 // 1257
D=A // 1258
@SP // 1259
AM=M+1 // 1260
A=A-1 // 1261
M=D // 1262
// call Screen.drawLine
@9 // 1263
D=A // 1264
@14 // 1265
M=D // 1266
@Screen.drawLine // 1267
D=A // 1268
@13 // 1269
M=D // 1270
@Main.main.ret.28 // 1271
D=A // 1272
@CALL // 1273
0;JMP // 1274
(Main.main.ret.28)
@140 // 1275
D=A // 1276
@SP // 1277
AM=M+1 // 1278
A=A-1 // 1279
M=D // 1280
@26 // 1281
D=A // 1282
@SP // 1283
AM=M+1 // 1284
A=A-1 // 1285
M=D // 1286
@140 // 1287
D=A // 1288
@SP // 1289
AM=M+1 // 1290
A=A-1 // 1291
M=D // 1292
@6 // 1293
D=A // 1294
@SP // 1295
AM=M+1 // 1296
A=A-1 // 1297
M=D // 1298
// call Screen.drawLine
@9 // 1299
D=A // 1300
@14 // 1301
M=D // 1302
@Screen.drawLine // 1303
D=A // 1304
@13 // 1305
M=D // 1306
@Main.main.ret.29 // 1307
D=A // 1308
@CALL // 1309
0;JMP // 1310
(Main.main.ret.29)
@140 // 1311
D=A // 1312
@SP // 1313
AM=M+1 // 1314
A=A-1 // 1315
M=D // 1316
@60 // 1317
D=A // 1318
@SP // 1319
AM=M+1 // 1320
A=A-1 // 1321
M=D // 1322
@30 // 1323
D=A // 1324
@SP // 1325
AM=M+1 // 1326
A=A-1 // 1327
M=D // 1328
// call Screen.drawCircle
@8 // 1329
D=A // 1330
@14 // 1331
M=D // 1332
@Screen.drawCircle // 1333
D=A // 1334
@13 // 1335
M=D // 1336
@Main.main.ret.30 // 1337
D=A // 1338
@CALL // 1339
0;JMP // 1340
(Main.main.ret.30)
@345 // 1341
D=A // 1342
@SP // 1343
AM=M+1 // 1344
A=A-1 // 1345
M=D // 1346
@35 // 1347
D=A // 1348
@SP // 1349
AM=M+1 // 1350
A=A-1 // 1351
M=D // 1352
@410 // 1353
D=A // 1354
@SP // 1355
AM=M+1 // 1356
A=A-1 // 1357
M=D // 1358
@90 // 1359
D=A // 1360
@SP // 1361
AM=M+1 // 1362
A=A-1 // 1363
M=D // 1364
// call Screen.drawLine
@9 // 1365
D=A // 1366
@14 // 1367
M=D // 1368
@Screen.drawLine // 1369
D=A // 1370
@13 // 1371
M=D // 1372
@Main.main.ret.31 // 1373
D=A // 1374
@CALL // 1375
0;JMP // 1376
(Main.main.ret.31)
@280 // 1377
D=A // 1378
@SP // 1379
AM=M+1 // 1380
A=A-1 // 1381
M=D // 1382
@90 // 1383
D=A // 1384
@SP // 1385
AM=M+1 // 1386
A=A-1 // 1387
M=D // 1388
@345 // 1389
D=A // 1390
@SP // 1391
AM=M+1 // 1392
A=A-1 // 1393
M=D // 1394
@35 // 1395
D=A // 1396
@SP // 1397
AM=M+1 // 1398
A=A-1 // 1399
M=D // 1400
// call Screen.drawLine
@9 // 1401
D=A // 1402
@14 // 1403
M=D // 1404
@Screen.drawLine // 1405
D=A // 1406
@13 // 1407
M=D // 1408
@Main.main.ret.32 // 1409
D=A // 1410
@CALL // 1411
0;JMP // 1412
(Main.main.ret.32)
@360 // 1413
D=A // 1414
@SP // 1415
AM=M+1 // 1416
A=A-1 // 1417
M=D // 1418
@170 // 1419
D=A // 1420
@SP // 1421
AM=M+1 // 1422
A=A-1 // 1423
M=D // 1424
@3 // 1425
D=A // 1426
@SP // 1427
AM=M+1 // 1428
A=A-1 // 1429
M=D // 1430
// call Screen.drawCircle
@8 // 1431
D=A // 1432
@14 // 1433
M=D // 1434
@Screen.drawCircle // 1435
D=A // 1436
@13 // 1437
M=D // 1438
@Main.main.ret.33 // 1439
D=A // 1440
@CALL // 1441
0;JMP // 1442
(Main.main.ret.33)
@SP // 1443
AM=M+1 // 1444
A=A-1 // 1445
M=-1 // 1446
// call Screen.setColor
@6 // 1447
D=A // 1448
@14 // 1449
M=D // 1450
@Screen.setColor // 1451
D=A // 1452
@13 // 1453
M=D // 1454
@Main.main.ret.34 // 1455
D=A // 1456
@CALL // 1457
0;JMP // 1458
(Main.main.ret.34)
@292 // 1459
D=A // 1460
@SP // 1461
AM=M+1 // 1462
A=A-1 // 1463
M=D // 1464
@120 // 1465
D=A // 1466
@SP // 1467
AM=M+1 // 1468
A=A-1 // 1469
M=D // 1470
@332 // 1471
D=A // 1472
@SP // 1473
AM=M+1 // 1474
A=A-1 // 1475
M=D // 1476
@150 // 1477
D=A // 1478
@SP // 1479
AM=M+1 // 1480
A=A-1 // 1481
M=D // 1482
// call Screen.drawRectangle
@9 // 1483
D=A // 1484
@14 // 1485
M=D // 1486
@Screen.drawRectangle // 1487
D=A // 1488
@13 // 1489
M=D // 1490
@Main.main.ret.35 // 1491
D=A // 1492
@CALL // 1493
0;JMP // 1494
(Main.main.ret.35)
@350 // 1495
D=A // 1496
@SP // 1497
AM=M+1 // 1498
A=A-1 // 1499
M=D // 1500
@120 // 1501
D=A // 1502
@SP // 1503
AM=M+1 // 1504
A=A-1 // 1505
M=D // 1506
@390 // 1507
D=A // 1508
@SP // 1509
AM=M+1 // 1510
A=A-1 // 1511
M=D // 1512
@219 // 1513
D=A // 1514
@SP // 1515
AM=M+1 // 1516
A=A-1 // 1517
M=D // 1518
// call Screen.drawRectangle
@9 // 1519
D=A // 1520
@14 // 1521
M=D // 1522
@Screen.drawRectangle // 1523
D=A // 1524
@13 // 1525
M=D // 1526
@Main.main.ret.36 // 1527
D=A // 1528
@CALL // 1529
0;JMP // 1530
(Main.main.ret.36)
@SP // 1531
AM=M+1 // 1532
A=A-1 // 1533
M=0 // 1534
// call Screen.setColor
@6 // 1535
D=A // 1536
@14 // 1537
M=D // 1538
@Screen.setColor // 1539
D=A // 1540
@13 // 1541
M=D // 1542
@Main.main.ret.37 // 1543
D=A // 1544
@CALL // 1545
0;JMP // 1546
(Main.main.ret.37)
@280 // 1547
D=A // 1548
@SP // 1549
AM=M+1 // 1550
A=A-1 // 1551
M=D // 1552
@90 // 1553
D=A // 1554
@SP // 1555
AM=M+1 // 1556
A=A-1 // 1557
M=D // 1558
@410 // 1559
D=A // 1560
@SP // 1561
AM=M+1 // 1562
A=A-1 // 1563
M=D // 1564
@220 // 1565
D=A // 1566
@SP // 1567
AM=M+1 // 1568
A=A-1 // 1569
M=D // 1570
// call Screen.drawRectangle
@9 // 1571
D=A // 1572
@14 // 1573
M=D // 1574
@Screen.drawRectangle // 1575
D=A // 1576
@13 // 1577
M=D // 1578
@Main.main.ret.38 // 1579
D=A // 1580
@CALL // 1581
0;JMP // 1582
(Main.main.ret.38)
@SP // 1583
AM=M+1 // 1584
A=A-1 // 1585
M=0 // 1586
@220 // 1587
D=A // 1588
@SP // 1589
AM=M+1 // 1590
A=A-1 // 1591
M=D // 1592
@511 // 1593
D=A // 1594
@SP // 1595
AM=M+1 // 1596
A=A-1 // 1597
M=D // 1598
@220 // 1599
D=A // 1600
@SP // 1601
AM=M+1 // 1602
A=A-1 // 1603
M=D // 1604
// call Screen.drawLine
@9 // 1605
D=A // 1606
@14 // 1607
M=D // 1608
@Screen.drawLine // 1609
D=A // 1610
@13 // 1611
M=D // 1612
@Main.main.ret.39 // 1613
D=A // 1614
@CALL // 1615
0;JMP // 1616
(Main.main.ret.39)
@SP // 1617
AM=M-1 // 1618
D=M // 1619
@5 // 1620
M=D // 1621
@SP // 1622
AM=M-1 // 1623
D=M // 1624
@5 // 1625
M=D // 1626
@SP // 1627
AM=M-1 // 1628
D=M // 1629
@5 // 1630
M=D // 1631
@SP // 1632
AM=M-1 // 1633
D=M // 1634
@5 // 1635
M=D // 1636
@SP // 1637
AM=M-1 // 1638
D=M // 1639
@5 // 1640
M=D // 1641
@SP // 1642
AM=M-1 // 1643
D=M // 1644
@5 // 1645
M=D // 1646
@SP // 1647
AM=M-1 // 1648
D=M // 1649
@5 // 1650
M=D // 1651
@SP // 1652
AM=M-1 // 1653
D=M // 1654
@5 // 1655
M=D // 1656
@SP // 1657
AM=M-1 // 1658
D=M // 1659
@5 // 1660
M=D // 1661
@SP // 1662
AM=M-1 // 1663
D=M // 1664
@5 // 1665
M=D // 1666
@SP // 1667
AM=M-1 // 1668
D=M // 1669
@5 // 1670
M=D // 1671
@SP // 1672
AM=M-1 // 1673
D=M // 1674
@5 // 1675
M=D // 1676
@SP // 1677
AM=M-1 // 1678
D=M // 1679
@5 // 1680
M=D // 1681
@SP // 1682
AM=M-1 // 1683
D=M // 1684
@5 // 1685
M=D // 1686
@SP // 1687
AM=M-1 // 1688
D=M // 1689
@5 // 1690
M=D // 1691
@SP // 1692
AM=M-1 // 1693
D=M // 1694
@5 // 1695
M=D // 1696
@SP // 1697
AM=M-1 // 1698
D=M // 1699
@5 // 1700
M=D // 1701
@SP // 1702
AM=M-1 // 1703
D=M // 1704
@5 // 1705
M=D // 1706
@SP // 1707
AM=M-1 // 1708
D=M // 1709
@5 // 1710
M=D // 1711
@SP // 1712
AM=M-1 // 1713
D=M // 1714
@5 // 1715
M=D // 1716

////PushInstruction("constant 0")
@SP // 1717
AM=M+1 // 1718
A=A-1 // 1719
M=0 // 1720

////ReturnInstruction{}
@RETURN // 1721
0;JMP // 1722

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 1723
AM=M+1 // 1724
A=A-1 // 1725
M=0 // 1726
@SP // 1727
AM=M+1 // 1728
A=A-1 // 1729
M=0 // 1730

////  nested:
//      nested:
//        PushPopPair {
//          push: PushInstruction("constant 1")
//          pop:  PopInstruction{address=local 0}
//        }
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}}
//  pop:  PopInstruction{address=Math.0}
//}

@16 // 1731
D=A // 1732
@SP // 1733
AM=M+1 // 1734
A=A-1 // 1735
M=D // 1736
// call Array.new
@6 // 1737
D=A // 1738
@14 // 1739
M=D // 1740
@Array.new // 1741
D=A // 1742
@13 // 1743
M=D // 1744
@Math.init.ret.0 // 1745
D=A // 1746
@CALL // 1747
0;JMP // 1748
(Math.init.ret.0)
@SP // 1749
AM=M+1 // 1750
A=A-1 // 1751
M=0 // 1752
D=1 // 1753
@LCL // 1754
A=M // 1755
M=D // 1756
@SP // 1757
AM=M-1 // 1758
D=M // 1759
@LCL // 1760
A=M+1 // 1761
M=D // 1762
@SP // 1763
AM=M-1 // 1764
D=M // 1765
@Math.0 // 1766
M=D // 1767

////LabelInstruction{label='WHILE_START_Math.init1}
// label WHILE_START_Math.init1
(WHILE_START_Math.init1)

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
//), ifGoto=IfGotoInstruction{label='WHILE_END_Math.init1}}
@Math.init.EQ.1 // 1768
D=A // 1769
@SP // 1770
AM=M+1 // 1771
A=A-1 // 1772
M=D // 1773
@Math.init.LT.2 // 1774
D=A // 1775
@SP // 1776
AM=M+1 // 1777
A=A-1 // 1778
M=D // 1779
@LCL // 1780
A=M+1 // 1781
D=M // 1782
@16 // 1783
D=D-A // 1784
@14 // 1785
M=D // 1786
@SP // 1787
AM=M-1 // 1788
D=M // 1789
@13 // 1790
M=D // 1791
@14 // 1792
D=M // 1793
@DO_LT // 1794
0;JMP // 1795
(Math.init.LT.2)
@14 // 1796
M=D // 1797
@SP // 1798
AM=M-1 // 1799
D=M // 1800
@13 // 1801
M=D // 1802
@14 // 1803
D=M // 1804
@DO_EQ // 1805
0;JMP // 1806
(Math.init.EQ.1)
@WHILE_END_Math.init1 // 1807
D;JNE // 1808

////  nested:
//      nested:
//          nested:
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//        PushPopPair {
//          push: PushInstruction("local 0")
//          pop:  PopInstruction{address=that 0}
//        }
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1809
A=M+1 // 1810
D=M // 1811
@SP // 1812
AM=M+1 // 1813
A=A-1 // 1814
M=D+1 // 1815
@LCL // 1816
A=M // 1817
D=M // 1818
D=D+M // 1819
@SP // 1820
AM=M+1 // 1821
A=A-1 // 1822
M=D // 1823
@LCL // 1824
A=M // 1825
D=M // 1826
@SP // 1827
AM=M+1 // 1828
A=A-1 // 1829
M=D // 1830
@Math.0 // 1831
D=M // 1832
@SP // 1833
AM=M+1 // 1834
A=A-1 // 1835
M=D // 1836
@LCL // 1837
A=M+1 // 1838
D=M // 1839
@SP // 1840
AM=M-1 // 1841
D=D+M // 1842
@4 // 1843
M=D // 1844
@SP // 1845
AM=M-1 // 1846
D=M // 1847
@THAT // 1848
A=M // 1849
M=D // 1850
@SP // 1851
AM=M-1 // 1852
D=M // 1853
@LCL // 1854
A=M // 1855
M=D // 1856
@SP // 1857
AM=M-1 // 1858
D=M // 1859
@LCL // 1860
A=M+1 // 1861
M=D // 1862

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 1863
0;JMP // 1864

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 1865
AM=M+1 // 1866
A=A-1 // 1867
M=0 // 1868

////ReturnInstruction{}
@RETURN // 1869
0;JMP // 1870

////FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("static 0"),
//                    right:
//                        PushInstruction("argument 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "AND"
//)
@ARG // 1871
A=M // 1872
D=M // 1873
@SP // 1874
AM=M+1 // 1875
A=A-1 // 1876
M=D // 1877
@Math.0 // 1878
D=M // 1879
@SP // 1880
AM=M+1 // 1881
A=A-1 // 1882
M=D // 1883
@ARG // 1884
A=M+1 // 1885
D=M // 1886
@SP // 1887
AM=M-1 // 1888
A=D+M // 1889
D=M // 1890
@SP // 1891
AM=M-1 // 1892
D=D&M // 1893
@SP // 1894
AM=M+1 // 1895
A=A-1 // 1896
M=D // 1897

////ReturnInstruction{}
@RETURN // 1898
0;JMP // 1899

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 1900
AM=M+1 // 1901
A=A-1 // 1902
M=0 // 1903
@SP // 1904
AM=M+1 // 1905
A=A-1 // 1906
M=0 // 1907
@SP // 1908
AM=M+1 // 1909
A=A-1 // 1910
M=0 // 1911

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
@Math.multiply.EQ.5 // 1912
D=A // 1913
@SP // 1914
AM=M+1 // 1915
A=A-1 // 1916
M=D // 1917
@Math.multiply.EQ.6 // 1918
D=A // 1919
@SP // 1920
AM=M+1 // 1921
A=A-1 // 1922
M=D // 1923
@ARG // 1924
A=M // 1925
D=M // 1926
@14 // 1927
M=D // 1928
@SP // 1929
AM=M-1 // 1930
D=M // 1931
@13 // 1932
M=D // 1933
@14 // 1934
D=M // 1935
@DO_EQ // 1936
0;JMP // 1937
(Math.multiply.EQ.6)
@SP // 1938
AM=M+1 // 1939
A=A-1 // 1940
M=D // 1941
@Math.multiply.EQ.7 // 1942
D=A // 1943
@SP // 1944
AM=M+1 // 1945
A=A-1 // 1946
M=D // 1947
@ARG // 1948
A=M+1 // 1949
D=M // 1950
@14 // 1951
M=D // 1952
@SP // 1953
AM=M-1 // 1954
D=M // 1955
@13 // 1956
M=D // 1957
@14 // 1958
D=M // 1959
@DO_EQ // 1960
0;JMP // 1961
(Math.multiply.EQ.7)
@SP // 1962
AM=M-1 // 1963
D=D|M // 1964
@14 // 1965
M=D // 1966
@SP // 1967
AM=M-1 // 1968
D=M // 1969
@13 // 1970
M=D // 1971
@14 // 1972
D=M // 1973
@DO_EQ // 1974
0;JMP // 1975
(Math.multiply.EQ.5)
@Math.multiply.IfElse1 // 1976
D;JNE // 1977

////PushInstruction("constant 0")
@SP // 1978
AM=M+1 // 1979
A=A-1 // 1980
M=0 // 1981

////ReturnInstruction{}
@RETURN // 1982
0;JMP // 1983

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 1984
0;JMP // 1985

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
@Math.multiply.EQ.9 // 1986
D=A // 1987
@SP // 1988
AM=M+1 // 1989
A=A-1 // 1990
M=D // 1991
@Math.multiply.EQ.10 // 1992
D=A // 1993
@SP // 1994
AM=M+1 // 1995
A=A-1 // 1996
M=D // 1997
@ARG // 1998
A=M // 1999
D=M-1 // 2000
@14 // 2001
M=D // 2002
@SP // 2003
AM=M-1 // 2004
D=M // 2005
@13 // 2006
M=D // 2007
@14 // 2008
D=M // 2009
@DO_EQ // 2010
0;JMP // 2011
(Math.multiply.EQ.10)
@14 // 2012
M=D // 2013
@SP // 2014
AM=M-1 // 2015
D=M // 2016
@13 // 2017
M=D // 2018
@14 // 2019
D=M // 2020
@DO_EQ // 2021
0;JMP // 2022
(Math.multiply.EQ.9)
@Math.multiply.IfElse2 // 2023
D;JNE // 2024

////PushInstruction("argument 1")
@ARG // 2025
A=M+1 // 2026
D=M // 2027
@SP // 2028
AM=M+1 // 2029
A=A-1 // 2030
M=D // 2031

////ReturnInstruction{}
@RETURN // 2032
0;JMP // 2033

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 2034
0;JMP // 2035

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
@Math.multiply.EQ.12 // 2036
D=A // 2037
@SP // 2038
AM=M+1 // 2039
A=A-1 // 2040
M=D // 2041
@Math.multiply.EQ.13 // 2042
D=A // 2043
@SP // 2044
AM=M+1 // 2045
A=A-1 // 2046
M=D // 2047
@ARG // 2048
A=M+1 // 2049
D=M-1 // 2050
@14 // 2051
M=D // 2052
@SP // 2053
AM=M-1 // 2054
D=M // 2055
@13 // 2056
M=D // 2057
@14 // 2058
D=M // 2059
@DO_EQ // 2060
0;JMP // 2061
(Math.multiply.EQ.13)
@14 // 2062
M=D // 2063
@SP // 2064
AM=M-1 // 2065
D=M // 2066
@13 // 2067
M=D // 2068
@14 // 2069
D=M // 2070
@DO_EQ // 2071
0;JMP // 2072
(Math.multiply.EQ.12)
@Math.multiply.IfElse3 // 2073
D;JNE // 2074

////PushInstruction("argument 0")
@ARG // 2075
A=M // 2076
D=M // 2077
@SP // 2078
AM=M+1 // 2079
A=A-1 // 2080
M=D // 2081

////ReturnInstruction{}
@RETURN // 2082
0;JMP // 2083

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 2084
0;JMP // 2085

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
@Math.multiply.EQ.15 // 2086
D=A // 2087
@SP // 2088
AM=M+1 // 2089
A=A-1 // 2090
M=D // 2091
@Math.multiply.EQ.16 // 2092
D=A // 2093
@SP // 2094
AM=M+1 // 2095
A=A-1 // 2096
M=D // 2097
@ARG // 2098
A=M // 2099
D=M // 2100
@2 // 2101
D=D-A // 2102
@14 // 2103
M=D // 2104
@SP // 2105
AM=M-1 // 2106
D=M // 2107
@13 // 2108
M=D // 2109
@14 // 2110
D=M // 2111
@DO_EQ // 2112
0;JMP // 2113
(Math.multiply.EQ.16)
@14 // 2114
M=D // 2115
@SP // 2116
AM=M-1 // 2117
D=M // 2118
@13 // 2119
M=D // 2120
@14 // 2121
D=M // 2122
@DO_EQ // 2123
0;JMP // 2124
(Math.multiply.EQ.15)
@Math.multiply.IfElse4 // 2125
D;JNE // 2126

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 2127
A=M+1 // 2128
D=M // 2129
D=D+M // 2130
@SP // 2131
AM=M+1 // 2132
A=A-1 // 2133
M=D // 2134

////ReturnInstruction{}
@RETURN // 2135
0;JMP // 2136

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 2137
0;JMP // 2138

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
@Math.multiply.EQ.18 // 2139
D=A // 2140
@SP // 2141
AM=M+1 // 2142
A=A-1 // 2143
M=D // 2144
@Math.multiply.EQ.19 // 2145
D=A // 2146
@SP // 2147
AM=M+1 // 2148
A=A-1 // 2149
M=D // 2150
@ARG // 2151
A=M+1 // 2152
D=M // 2153
@2 // 2154
D=D-A // 2155
@14 // 2156
M=D // 2157
@SP // 2158
AM=M-1 // 2159
D=M // 2160
@13 // 2161
M=D // 2162
@14 // 2163
D=M // 2164
@DO_EQ // 2165
0;JMP // 2166
(Math.multiply.EQ.19)
@14 // 2167
M=D // 2168
@SP // 2169
AM=M-1 // 2170
D=M // 2171
@13 // 2172
M=D // 2173
@14 // 2174
D=M // 2175
@DO_EQ // 2176
0;JMP // 2177
(Math.multiply.EQ.18)
@Math.multiply.IfElse5 // 2178
D;JNE // 2179

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 2180
A=M // 2181
D=M // 2182
D=D+M // 2183
@SP // 2184
AM=M+1 // 2185
A=A-1 // 2186
M=D // 2187

////ReturnInstruction{}
@RETURN // 2188
0;JMP // 2189

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 2190
0;JMP // 2191

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

D=1 // 2192
@LCL // 2193
A=M+1 // 2194
A=A+1 // 2195
M=D // 2196

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
@Math.multiply.EQ.21 // 2197
D=A // 2198
@SP // 2199
AM=M+1 // 2200
A=A-1 // 2201
M=D // 2202
@Math.multiply.LT.22 // 2203
D=A // 2204
@SP // 2205
AM=M+1 // 2206
A=A-1 // 2207
M=D // 2208
@LCL // 2209
A=M+1 // 2210
D=M // 2211
@16 // 2212
D=D-A // 2213
@14 // 2214
M=D // 2215
@SP // 2216
AM=M-1 // 2217
D=M // 2218
@13 // 2219
M=D // 2220
@14 // 2221
D=M // 2222
@DO_LT // 2223
0;JMP // 2224
(Math.multiply.LT.22)
@14 // 2225
M=D // 2226
@SP // 2227
AM=M-1 // 2228
D=M // 2229
@13 // 2230
M=D // 2231
@14 // 2232
D=M // 2233
@DO_EQ // 2234
0;JMP // 2235
(Math.multiply.EQ.21)
@WHILE_END_Math.multiply1 // 2236
D;JNE // 2237

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
@Math.multiply.EQ.23 // 2238
D=A // 2239
@SP // 2240
AM=M+1 // 2241
A=A-1 // 2242
M=D // 2243
@ARG // 2244
A=M+1 // 2245
D=M // 2246
@SP // 2247
AM=M+1 // 2248
A=A-1 // 2249
M=D // 2250
@LCL // 2251
A=M+1 // 2252
A=A+1 // 2253
D=M // 2254
@SP // 2255
AM=M-1 // 2256
D=D&M // 2257
@14 // 2258
M=D // 2259
@SP // 2260
AM=M-1 // 2261
D=M // 2262
@13 // 2263
M=D // 2264
@14 // 2265
D=M // 2266
@DO_EQ // 2267
0;JMP // 2268
(Math.multiply.EQ.23)
@Math.multiply.IfElse6 // 2269
D;JNE // 2270

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

@LCL // 2271
A=M // 2272
D=M // 2273
@SP // 2274
AM=M+1 // 2275
A=A-1 // 2276
M=D // 2277
@ARG // 2278
A=M // 2279
D=M // 2280
@SP // 2281
AM=M-1 // 2282
D=D+M // 2283
@LCL // 2284
A=M // 2285
M=D // 2286

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 2287
0;JMP // 2288

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////  nested:
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
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2289
A=M+1 // 2290
A=A+1 // 2291
D=M // 2292
D=D+M // 2293
@SP // 2294
AM=M+1 // 2295
A=A-1 // 2296
M=D // 2297
@LCL // 2298
A=M+1 // 2299
D=M // 2300
@SP // 2301
AM=M+1 // 2302
A=A-1 // 2303
M=D+1 // 2304
@ARG // 2305
A=M // 2306
D=M // 2307
D=D+M // 2308
@ARG // 2309
A=M // 2310
M=D // 2311
@SP // 2312
AM=M-1 // 2313
D=M // 2314
@LCL // 2315
A=M+1 // 2316
M=D // 2317
@SP // 2318
AM=M-1 // 2319
D=M // 2320
@LCL // 2321
A=M+1 // 2322
A=A+1 // 2323
M=D // 2324

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 2325
0;JMP // 2326

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 2327
A=M // 2328
D=M // 2329
@SP // 2330
AM=M+1 // 2331
A=A-1 // 2332
M=D // 2333

////ReturnInstruction{}
@RETURN // 2334
0;JMP // 2335

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 2336
AM=M+1 // 2337
A=A-1 // 2338
M=0 // 2339
@SP // 2340
AM=M+1 // 2341
A=A-1 // 2342
M=0 // 2343
@SP // 2344
AM=M+1 // 2345
A=A-1 // 2346
M=0 // 2347

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//      pop:  PopInstruction{address=local 2}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2348
A=M+1 // 2349
D=M // 2350
@SP // 2351
AM=M+1 // 2352
A=A-1 // 2353
M=D // 2354
// call Math.abs
@6 // 2355
D=A // 2356
@14 // 2357
M=D // 2358
@Math.abs // 2359
D=A // 2360
@13 // 2361
M=D // 2362
@Math.divide.ret.0 // 2363
D=A // 2364
@CALL // 2365
0;JMP // 2366
(Math.divide.ret.0)
@ARG // 2367
A=M // 2368
D=M // 2369
@SP // 2370
AM=M+1 // 2371
A=A-1 // 2372
M=D // 2373
// call Math.abs
@6 // 2374
D=A // 2375
@14 // 2376
M=D // 2377
@Math.abs // 2378
D=A // 2379
@13 // 2380
M=D // 2381
@Math.divide.ret.1 // 2382
D=A // 2383
@CALL // 2384
0;JMP // 2385
(Math.divide.ret.1)
@SP // 2386
AM=M-1 // 2387
D=M // 2388
@LCL // 2389
A=M+1 // 2390
A=A+1 // 2391
M=D // 2392
@SP // 2393
AM=M-1 // 2394
D=M // 2395
@LCL // 2396
A=M+1 // 2397
M=D // 2398

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
@Math.divide.EQ.26 // 2399
D=A // 2400
@SP // 2401
AM=M+1 // 2402
A=A-1 // 2403
M=D // 2404
@Math.divide.EQ.27 // 2405
D=A // 2406
@SP // 2407
AM=M+1 // 2408
A=A-1 // 2409
M=D // 2410
@ARG // 2411
A=M // 2412
D=M // 2413
@14 // 2414
M=D // 2415
@SP // 2416
AM=M-1 // 2417
D=M // 2418
@13 // 2419
M=D // 2420
@14 // 2421
D=M // 2422
@DO_EQ // 2423
0;JMP // 2424
(Math.divide.EQ.27)
@SP // 2425
AM=M+1 // 2426
A=A-1 // 2427
M=D // 2428
@Math.divide.GT.28 // 2429
D=A // 2430
@SP // 2431
AM=M+1 // 2432
A=A-1 // 2433
M=D // 2434
@LCL // 2435
A=M+1 // 2436
A=A+1 // 2437
D=M // 2438
A=A-1 // 2439
D=M-D // 2440
@14 // 2441
M=D // 2442
@SP // 2443
AM=M-1 // 2444
D=M // 2445
@13 // 2446
M=D // 2447
@14 // 2448
D=M // 2449
@DO_GT // 2450
0;JMP // 2451
(Math.divide.GT.28)
@SP // 2452
AM=M-1 // 2453
D=D|M // 2454
@14 // 2455
M=D // 2456
@SP // 2457
AM=M-1 // 2458
D=M // 2459
@13 // 2460
M=D // 2461
@14 // 2462
D=M // 2463
@DO_EQ // 2464
0;JMP // 2465
(Math.divide.EQ.26)
@Math.divide.IfElse1 // 2466
D;JNE // 2467

////PushInstruction("constant 0")
@SP // 2468
AM=M+1 // 2469
A=A-1 // 2470
M=0 // 2471

////ReturnInstruction{}
@RETURN // 2472
0;JMP // 2473

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 2474
0;JMP // 2475

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
@Math.divide.EQ.30 // 2476
D=A // 2477
@SP // 2478
AM=M+1 // 2479
A=A-1 // 2480
M=D // 2481
@Math.divide.EQ.31 // 2482
D=A // 2483
@SP // 2484
AM=M+1 // 2485
A=A-1 // 2486
M=D // 2487
@ARG // 2488
A=M+1 // 2489
D=M // 2490
A=A-1 // 2491
D=M-D // 2492
@14 // 2493
M=D // 2494
@SP // 2495
AM=M-1 // 2496
D=M // 2497
@13 // 2498
M=D // 2499
@14 // 2500
D=M // 2501
@DO_EQ // 2502
0;JMP // 2503
(Math.divide.EQ.31)
@14 // 2504
M=D // 2505
@SP // 2506
AM=M-1 // 2507
D=M // 2508
@13 // 2509
M=D // 2510
@14 // 2511
D=M // 2512
@DO_EQ // 2513
0;JMP // 2514
(Math.divide.EQ.30)
@Math.divide.IfElse2 // 2515
D;JNE // 2516

////PushInstruction("constant 1")
@SP // 2517
AM=M+1 // 2518
A=A-1 // 2519
M=1 // 2520

////ReturnInstruction{}
@RETURN // 2521
0;JMP // 2522

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 2523
0;JMP // 2524

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
@Math.divide.EQ.34 // 2525
D=A // 2526
@SP // 2527
AM=M+1 // 2528
A=A-1 // 2529
M=D // 2530
@Math.divide.LT.35 // 2531
D=A // 2532
@SP // 2533
AM=M+1 // 2534
A=A-1 // 2535
M=D // 2536
@ARG // 2537
A=M // 2538
D=M // 2539
@14 // 2540
M=D // 2541
@SP // 2542
AM=M-1 // 2543
D=M // 2544
@13 // 2545
M=D // 2546
@14 // 2547
D=M // 2548
@DO_LT // 2549
0;JMP // 2550
(Math.divide.LT.35)
@SP // 2551
AM=M+1 // 2552
A=A-1 // 2553
M=D // 2554
@Math.divide.LT.36 // 2555
D=A // 2556
@SP // 2557
AM=M+1 // 2558
A=A-1 // 2559
M=D // 2560
@ARG // 2561
A=M+1 // 2562
D=M // 2563
@14 // 2564
M=D // 2565
@SP // 2566
AM=M-1 // 2567
D=M // 2568
@13 // 2569
M=D // 2570
@14 // 2571
D=M // 2572
@DO_LT // 2573
0;JMP // 2574
(Math.divide.LT.36)
@SP // 2575
AM=M-1 // 2576
D=D|M // 2577
@14 // 2578
M=D // 2579
@SP // 2580
AM=M-1 // 2581
D=M // 2582
@13 // 2583
M=D // 2584
@14 // 2585
D=M // 2586
@DO_EQ // 2587
0;JMP // 2588
(Math.divide.EQ.34)
@Math.divide.IfElse3 // 2589
D;JNE // 2590

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2591
A=M+1 // 2592
A=A+1 // 2593
D=M // 2594
@SP // 2595
AM=M+1 // 2596
A=A-1 // 2597
M=D // 2598
@LCL // 2599
A=M+1 // 2600
D=M // 2601
@SP // 2602
AM=M+1 // 2603
A=A-1 // 2604
M=D // 2605
// call Math.divide
@7 // 2606
D=A // 2607
@14 // 2608
M=D // 2609
@Math.divide // 2610
D=A // 2611
@13 // 2612
M=D // 2613
@Math.divide.ret.2 // 2614
D=A // 2615
@CALL // 2616
0;JMP // 2617
(Math.divide.ret.2)
@SP // 2618
AM=M-1 // 2619
D=M // 2620
@LCL // 2621
A=M // 2622
M=D // 2623

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
@Math.divide.EQ.39 // 2624
D=A // 2625
@SP // 2626
AM=M+1 // 2627
A=A-1 // 2628
M=D // 2629
@Math.divide.LT.40 // 2630
D=A // 2631
@SP // 2632
AM=M+1 // 2633
A=A-1 // 2634
M=D // 2635
@ARG // 2636
A=M // 2637
D=M // 2638
@14 // 2639
M=D // 2640
@SP // 2641
AM=M-1 // 2642
D=M // 2643
@13 // 2644
M=D // 2645
@14 // 2646
D=M // 2647
@DO_LT // 2648
0;JMP // 2649
(Math.divide.LT.40)
@SP // 2650
AM=M+1 // 2651
A=A-1 // 2652
M=D // 2653
@Math.divide.LT.41 // 2654
D=A // 2655
@SP // 2656
AM=M+1 // 2657
A=A-1 // 2658
M=D // 2659
@ARG // 2660
A=M+1 // 2661
D=M // 2662
@14 // 2663
M=D // 2664
@SP // 2665
AM=M-1 // 2666
D=M // 2667
@13 // 2668
M=D // 2669
@14 // 2670
D=M // 2671
@DO_LT // 2672
0;JMP // 2673
(Math.divide.LT.41)
@SP // 2674
AM=M-1 // 2675
D=D&M // 2676
@14 // 2677
M=D // 2678
@SP // 2679
AM=M-1 // 2680
D=M // 2681
@13 // 2682
M=D // 2683
@14 // 2684
D=M // 2685
@DO_EQ // 2686
0;JMP // 2687
(Math.divide.EQ.39)
@Math.divide.IfElse4 // 2688
D;JNE // 2689

////PushInstruction("local 0")
@LCL // 2690
A=M // 2691
D=M // 2692
@SP // 2693
AM=M+1 // 2694
A=A-1 // 2695
M=D // 2696

////ReturnInstruction{}
@RETURN // 2697
0;JMP // 2698

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 2699
0;JMP // 2700

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
@LCL // 2701
A=M // 2702
D=M // 2703
@SP // 2704
AM=M+1 // 2705
A=A-1 // 2706
M=D // 2707
@SP // 2708
A=M-1 // 2709
M=-D // 2710

////ReturnInstruction{}
@RETURN // 2711
0;JMP // 2712

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 2713
0;JMP // 2714

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

@ARG // 2715
A=M // 2716
D=M // 2717
@SP // 2718
AM=M+1 // 2719
A=A-1 // 2720
M=D // 2721
@ARG // 2722
A=M+1 // 2723
D=M // 2724
D=D+M // 2725
@SP // 2726
AM=M+1 // 2727
A=A-1 // 2728
M=D // 2729
// call Math.divide
@7 // 2730
D=A // 2731
@14 // 2732
M=D // 2733
@Math.divide // 2734
D=A // 2735
@13 // 2736
M=D // 2737
@Math.divide.ret.3 // 2738
D=A // 2739
@CALL // 2740
0;JMP // 2741
(Math.divide.ret.3)
@SP // 2742
AM=M-1 // 2743
D=M // 2744
@LCL // 2745
A=M // 2746
M=D // 2747

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
@Math.divide.EQ.43 // 2748
D=A // 2749
@SP // 2750
AM=M+1 // 2751
A=A-1 // 2752
M=D // 2753
@Math.divide.LT.44 // 2754
D=A // 2755
@SP // 2756
AM=M+1 // 2757
A=A-1 // 2758
M=D // 2759
@ARG // 2760
A=M // 2761
D=M // 2762
@SP // 2763
AM=M+1 // 2764
A=A-1 // 2765
M=D // 2766
@LCL // 2767
A=M // 2768
D=M // 2769
D=D+M // 2770
@SP // 2771
AM=M+1 // 2772
A=A-1 // 2773
M=D // 2774
@ARG // 2775
A=M+1 // 2776
D=M // 2777
@SP // 2778
AM=M+1 // 2779
A=A-1 // 2780
M=D // 2781
// call Math.multiply
@7 // 2782
D=A // 2783
@14 // 2784
M=D // 2785
@Math.multiply // 2786
D=A // 2787
@13 // 2788
M=D // 2789
@Math.divide.ret.5 // 2790
D=A // 2791
@CALL // 2792
0;JMP // 2793
(Math.divide.ret.5)
@SP // 2794
AM=M-1 // 2795
D=M // 2796
@SP // 2797
AM=M-1 // 2798
D=M-D // 2799
@SP // 2800
AM=M+1 // 2801
A=A-1 // 2802
M=D // 2803
@ARG // 2804
A=M+1 // 2805
D=M // 2806
@SP // 2807
AM=M-1 // 2808
D=M-D // 2809
@14 // 2810
M=D // 2811
@SP // 2812
AM=M-1 // 2813
D=M // 2814
@13 // 2815
M=D // 2816
@14 // 2817
D=M // 2818
@DO_LT // 2819
0;JMP // 2820
(Math.divide.LT.44)
@14 // 2821
M=D // 2822
@SP // 2823
AM=M-1 // 2824
D=M // 2825
@13 // 2826
M=D // 2827
@14 // 2828
D=M // 2829
@DO_EQ // 2830
0;JMP // 2831
(Math.divide.EQ.43)
@Math.divide.IfElse5 // 2832
D;JNE // 2833

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 2834
A=M // 2835
D=M // 2836
D=D+M // 2837
@SP // 2838
AM=M+1 // 2839
A=A-1 // 2840
M=D // 2841

////ReturnInstruction{}
@RETURN // 2842
0;JMP // 2843

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 2844
0;JMP // 2845

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
@LCL // 2846
A=M // 2847
D=M // 2848
D=D+M // 2849
D=M+1 // 2850
@SP // 2851
AM=M+1 // 2852
A=A-1 // 2853
M=D // 2854

////ReturnInstruction{}
@RETURN // 2855
0;JMP // 2856

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
@ARG // 2857
A=M // 2858
D=M // 2859
@SP // 2860
AM=M+1 // 2861
A=A-1 // 2862
M=D // 2863
@ARG // 2864
A=M // 2865
D=M // 2866
@SP // 2867
AM=M+1 // 2868
A=A-1 // 2869
M=D // 2870
@ARG // 2871
A=M+1 // 2872
D=M // 2873
@SP // 2874
AM=M+1 // 2875
A=A-1 // 2876
M=D // 2877
// call Math.divide
@7 // 2878
D=A // 2879
@14 // 2880
M=D // 2881
@Math.divide // 2882
D=A // 2883
@13 // 2884
M=D // 2885
@Math.mod.ret.0 // 2886
D=A // 2887
@CALL // 2888
0;JMP // 2889
(Math.mod.ret.0)
@ARG // 2890
A=M+1 // 2891
D=M // 2892
@SP // 2893
AM=M+1 // 2894
A=A-1 // 2895
M=D // 2896
// call Math.multiply
@7 // 2897
D=A // 2898
@14 // 2899
M=D // 2900
@Math.multiply // 2901
D=A // 2902
@13 // 2903
M=D // 2904
@Math.mod.ret.1 // 2905
D=A // 2906
@CALL // 2907
0;JMP // 2908
(Math.mod.ret.1)
@SP // 2909
AM=M-1 // 2910
D=M // 2911
@SP // 2912
AM=M-1 // 2913
D=M-D // 2914
@SP // 2915
AM=M+1 // 2916
A=A-1 // 2917
M=D // 2918

////ReturnInstruction{}
@RETURN // 2919
0;JMP // 2920

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)

////Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 0"),
//            right:
//                PushInstruction("argument 0"),
//            binaryOp: "ADD"
//        )
//)
@Math.0 // 2921
D=M // 2922
@SP // 2923
AM=M+1 // 2924
A=A-1 // 2925
M=D // 2926
@ARG // 2927
A=M // 2928
D=M // 2929
@SP // 2930
AM=M-1 // 2931
A=D+M // 2932
D=M // 2933
@SP // 2934
AM=M+1 // 2935
A=A-1 // 2936
M=D // 2937

////ReturnInstruction{}
@RETURN // 2938
0;JMP // 2939

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 2940
AM=M+1 // 2941
A=A-1 // 2942
M=0 // 2943
@SP // 2944
AM=M+1 // 2945
A=A-1 // 2946
M=0 // 2947
@SP // 2948
AM=M+1 // 2949
A=A-1 // 2950
M=0 // 2951
@SP // 2952
AM=M+1 // 2953
A=A-1 // 2954
M=0 // 2955

////  nested:
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 2956
D=A // 2957
@SP // 2958
AM=M+1 // 2959
A=A-1 // 2960
M=D // 2961
D=0 // 2962
@LCL // 2963
A=M // 2964
M=D // 2965
@SP // 2966
AM=M-1 // 2967
D=M // 2968
@LCL // 2969
A=M+1 // 2970
M=D // 2971

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
@Math.sqrt.EQ.46 // 2972
D=A // 2973
@SP // 2974
AM=M+1 // 2975
A=A-1 // 2976
M=D // 2977
@Math.sqrt.LT.47 // 2978
D=A // 2979
@SP // 2980
AM=M+1 // 2981
A=A-1 // 2982
M=D // 2983
@LCL // 2984
A=M+1 // 2985
D=M // 2986
@14 // 2987
M=D // 2988
@SP // 2989
AM=M-1 // 2990
D=M // 2991
@13 // 2992
M=D // 2993
@14 // 2994
D=M // 2995
@DO_LT // 2996
0;JMP // 2997
(Math.sqrt.LT.47)
D=!D // 2998
@14 // 2999
M=D // 3000
@SP // 3001
AM=M-1 // 3002
D=M // 3003
@13 // 3004
M=D // 3005
@14 // 3006
D=M // 3007
@DO_EQ // 3008
0;JMP // 3009
(Math.sqrt.EQ.46)
@WHILE_END_Math.sqrt1 // 3010
D;JNE // 3011

////  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("static 0"),
//                    right:
//                        PushInstruction("local 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 2}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 3012
A=M+1 // 3013
A=A+1 // 3014
D=M // 3015
@SP // 3016
AM=M+1 // 3017
A=A-1 // 3018
M=D // 3019
@LCL // 3020
A=M+1 // 3021
A=A+1 // 3022
D=M // 3023
@SP // 3024
AM=M+1 // 3025
A=A-1 // 3026
M=D // 3027
// call Math.multiply
@7 // 3028
D=A // 3029
@14 // 3030
M=D // 3031
@Math.multiply // 3032
D=A // 3033
@13 // 3034
M=D // 3035
@Math.sqrt.ret.0 // 3036
D=A // 3037
@CALL // 3038
0;JMP // 3039
(Math.sqrt.ret.0)
@LCL // 3040
A=M // 3041
D=M // 3042
@SP // 3043
AM=M+1 // 3044
A=A-1 // 3045
M=D // 3046
@Math.0 // 3047
D=M // 3048
@SP // 3049
AM=M+1 // 3050
A=A-1 // 3051
M=D // 3052
@LCL // 3053
A=M+1 // 3054
D=M // 3055
@SP // 3056
AM=M-1 // 3057
A=D+M // 3058
D=M // 3059
@SP // 3060
AM=M-1 // 3061
D=D+M // 3062
@LCL // 3063
A=M+1 // 3064
A=A+1 // 3065
M=D // 3066
@SP // 3067
AM=M-1 // 3068
D=M // 3069
@LCL // 3070
A=M+1 // 3071
A=A+1 // 3072
A=A+1 // 3073
M=D // 3074

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
@Math.sqrt.EQ.50 // 3075
D=A // 3076
@SP // 3077
AM=M+1 // 3078
A=A-1 // 3079
M=D // 3080
@Math.sqrt.GT.51 // 3081
D=A // 3082
@SP // 3083
AM=M+1 // 3084
A=A-1 // 3085
M=D // 3086
@LCL // 3087
A=M+1 // 3088
A=A+1 // 3089
A=A+1 // 3090
D=M // 3091
@SP // 3092
AM=M+1 // 3093
A=A-1 // 3094
M=D // 3095
@ARG // 3096
A=M // 3097
D=M // 3098
@SP // 3099
AM=M-1 // 3100
D=M-D // 3101
@14 // 3102
M=D // 3103
@SP // 3104
AM=M-1 // 3105
D=M // 3106
@13 // 3107
M=D // 3108
@14 // 3109
D=M // 3110
@DO_GT // 3111
0;JMP // 3112
(Math.sqrt.GT.51)
@SP // 3113
AM=M+1 // 3114
A=A-1 // 3115
M=D // 3116
@SP // 3117
A=M-1 // 3118
M=!D // 3119
@Math.sqrt.GT.52 // 3120
D=A // 3121
@SP // 3122
AM=M+1 // 3123
A=A-1 // 3124
M=D // 3125
@LCL // 3126
A=M+1 // 3127
A=A+1 // 3128
A=A+1 // 3129
D=M // 3130
@14 // 3131
M=D // 3132
@SP // 3133
AM=M-1 // 3134
D=M // 3135
@13 // 3136
M=D // 3137
@14 // 3138
D=M // 3139
@DO_GT // 3140
0;JMP // 3141
(Math.sqrt.GT.52)
@SP // 3142
AM=M-1 // 3143
D=D&M // 3144
@14 // 3145
M=D // 3146
@SP // 3147
AM=M-1 // 3148
D=M // 3149
@13 // 3150
M=D // 3151
@14 // 3152
D=M // 3153
@DO_EQ // 3154
0;JMP // 3155
(Math.sqrt.EQ.50)
@Math.sqrt.IfElse1 // 3156
D;JNE // 3157

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3158
A=M+1 // 3159
A=A+1 // 3160
D=M // 3161
@LCL // 3162
A=M // 3163
M=D // 3164

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 3165
0;JMP // 3166

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

@LCL // 3167
A=M+1 // 3168
D=M-1 // 3169
@LCL // 3170
A=M+1 // 3171
M=D // 3172

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 3173
0;JMP // 3174

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 3175
A=M // 3176
D=M // 3177
@SP // 3178
AM=M+1 // 3179
A=A-1 // 3180
M=D // 3181

////ReturnInstruction{}
@RETURN // 3182
0;JMP // 3183

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
@Math.max.EQ.54 // 3184
D=A // 3185
@SP // 3186
AM=M+1 // 3187
A=A-1 // 3188
M=D // 3189
@Math.max.GT.55 // 3190
D=A // 3191
@SP // 3192
AM=M+1 // 3193
A=A-1 // 3194
M=D // 3195
@ARG // 3196
A=M+1 // 3197
D=M // 3198
A=A-1 // 3199
D=M-D // 3200
@14 // 3201
M=D // 3202
@SP // 3203
AM=M-1 // 3204
D=M // 3205
@13 // 3206
M=D // 3207
@14 // 3208
D=M // 3209
@DO_GT // 3210
0;JMP // 3211
(Math.max.GT.55)
@14 // 3212
M=D // 3213
@SP // 3214
AM=M-1 // 3215
D=M // 3216
@13 // 3217
M=D // 3218
@14 // 3219
D=M // 3220
@DO_EQ // 3221
0;JMP // 3222
(Math.max.EQ.54)
@Math.max.IfElse1 // 3223
D;JNE // 3224

////PushInstruction("argument 0")
@ARG // 3225
A=M // 3226
D=M // 3227
@SP // 3228
AM=M+1 // 3229
A=A-1 // 3230
M=D // 3231

////ReturnInstruction{}
@RETURN // 3232
0;JMP // 3233

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 3234
0;JMP // 3235

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 3236
A=M+1 // 3237
D=M // 3238
@SP // 3239
AM=M+1 // 3240
A=A-1 // 3241
M=D // 3242

////ReturnInstruction{}
@RETURN // 3243
0;JMP // 3244

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
@Math.min.EQ.57 // 3245
D=A // 3246
@SP // 3247
AM=M+1 // 3248
A=A-1 // 3249
M=D // 3250
@Math.min.LT.58 // 3251
D=A // 3252
@SP // 3253
AM=M+1 // 3254
A=A-1 // 3255
M=D // 3256
@ARG // 3257
A=M+1 // 3258
D=M // 3259
A=A-1 // 3260
D=M-D // 3261
@14 // 3262
M=D // 3263
@SP // 3264
AM=M-1 // 3265
D=M // 3266
@13 // 3267
M=D // 3268
@14 // 3269
D=M // 3270
@DO_LT // 3271
0;JMP // 3272
(Math.min.LT.58)
@14 // 3273
M=D // 3274
@SP // 3275
AM=M-1 // 3276
D=M // 3277
@13 // 3278
M=D // 3279
@14 // 3280
D=M // 3281
@DO_EQ // 3282
0;JMP // 3283
(Math.min.EQ.57)
@Math.min.IfElse1 // 3284
D;JNE // 3285

////PushInstruction("argument 0")
@ARG // 3286
A=M // 3287
D=M // 3288
@SP // 3289
AM=M+1 // 3290
A=A-1 // 3291
M=D // 3292

////ReturnInstruction{}
@RETURN // 3293
0;JMP // 3294

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 3295
0;JMP // 3296

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 3297
A=M+1 // 3298
D=M // 3299
@SP // 3300
AM=M+1 // 3301
A=A-1 // 3302
M=D // 3303

////ReturnInstruction{}
@RETURN // 3304
0;JMP // 3305

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{calleeFunction='Math.max', numArgs=2, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.abs=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.abs'}}
@ARG // 3306
A=M // 3307
D=M // 3308
@SP // 3309
AM=M+1 // 3310
A=A-1 // 3311
M=D // 3312
@ARG // 3313
A=M // 3314
D=M // 3315
@SP // 3316
AM=M+1 // 3317
A=A-1 // 3318
M=D // 3319
@SP // 3320
A=M-1 // 3321
M=-D // 3322
// call Math.max
@7 // 3323
D=A // 3324
@14 // 3325
M=D // 3326
@Math.max // 3327
D=A // 3328
@13 // 3329
M=D // 3330
@Math.abs.ret.0 // 3331
D=A // 3332
@CALL // 3333
0;JMP // 3334
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 3335
0;JMP // 3336

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 3337
AM=M+1 // 3338
A=A-1 // 3339
M=0 // 3340
@SP // 3341
AM=M+1 // 3342
A=A-1 // 3343
M=0 // 3344

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

@2055 // 3345
D=A // 3346
@LCL // 3347
A=M // 3348
M=D // 3349

////  nested:
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
//PushPopPair {
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
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 3350
A=M // 3351
D=M // 3352
@16384 // 3353
D=A-D // 3354
@5 // 3355
D=D-A // 3356
@SP // 3357
AM=M+1 // 3358
A=A-1 // 3359
M=D // 3360
@LCL // 3361
A=M // 3362
D=M // 3363
@4 // 3364
M=D // 3365
@SP // 3366
AM=M-1 // 3367
D=M // 3368
@THAT // 3369
A=M // 3370
M=D // 3371

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 3372
A=M // 3373
A=M+1 // 3374
M=1 // 3375

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 3376
A=M // 3377
D=M // 3378
@2 // 3379
A=D+A // 3380
M=0 // 3381

////  nested:
//      nested:
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
//        PushPopPair {
//          push: PushInstruction("constant 0")
//          pop:  PopInstruction{address=that 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=0}, currentFunction='Memory.init'}}
//  pop:  PopInstruction{address=temp 0}
//}

@2054 // 3382
D=A // 3383
@SP // 3384
AM=M+1 // 3385
A=A-1 // 3386
M=D // 3387
@2054 // 3388
D=A // 3389
@SP // 3390
AM=M+1 // 3391
A=A-1 // 3392
M=D // 3393
@LCL // 3394
A=M // 3395
D=M // 3396
@SP // 3397
AM=M+1 // 3398
A=A-1 // 3399
M=D // 3400
// call Memory.add_node
@7 // 3401
D=A // 3402
@14 // 3403
M=D // 3404
@Memory.add_node // 3405
D=A // 3406
@13 // 3407
M=D // 3408
@Memory.init.ret.0 // 3409
D=A // 3410
@CALL // 3411
0;JMP // 3412
(Memory.init.ret.0)
@LCL // 3413
A=M // 3414
D=M // 3415
@SP // 3416
AM=M+1 // 3417
A=A-1 // 3418
M=D // 3419
// call Memory.create_foot
@6 // 3420
D=A // 3421
@14 // 3422
M=D // 3423
@Memory.create_foot // 3424
D=A // 3425
@13 // 3426
M=D // 3427
@Memory.init.ret.1 // 3428
D=A // 3429
@CALL // 3430
0;JMP // 3431
(Memory.init.ret.1)
@LCL // 3432
A=M // 3433
D=M // 3434
@3 // 3435
A=D+A // 3436
M=0 // 3437
@SP // 3438
AM=M-1 // 3439
D=M // 3440
@5 // 3441
M=D // 3442
@SP // 3443
AM=M-1 // 3444
D=M // 3445
@5 // 3446
M=D // 3447

////PushInstruction("constant 0")
@SP // 3448
AM=M+1 // 3449
A=A-1 // 3450
M=0 // 3451

////ReturnInstruction{}
@RETURN // 3452
0;JMP // 3453

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 3454
AM=M+1 // 3455
A=A-1 // 3456
M=0 // 3457
@SP // 3458
AM=M+1 // 3459
A=A-1 // 3460
M=0 // 3461
@SP // 3462
AM=M+1 // 3463
A=A-1 // 3464
M=0 // 3465
@SP // 3466
AM=M+1 // 3467
A=A-1 // 3468
M=0 // 3469
@SP // 3470
AM=M+1 // 3471
A=A-1 // 3472
M=0 // 3473

////  nested:
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}}
//          pop:  PopInstruction{address=local 0}
//        }
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3474
A=M+1 // 3475
D=M // 3476
@SP // 3477
AM=M+1 // 3478
A=A-1 // 3479
M=D // 3480
@ARG // 3481
A=M // 3482
D=M // 3483
@SP // 3484
AM=M+1 // 3485
A=A-1 // 3486
M=D // 3487
// call Memory.get_best_fit
@7 // 3488
D=A // 3489
@14 // 3490
M=D // 3491
@Memory.get_best_fit // 3492
D=A // 3493
@13 // 3494
M=D // 3495
@Memory.alloc.ret.0 // 3496
D=A // 3497
@CALL // 3498
0;JMP // 3499
(Memory.alloc.ret.0)
@LCL // 3500
A=M // 3501
D=M // 3502
@2048 // 3503
D=D+A // 3504
@SP // 3505
AM=M+1 // 3506
A=A-1 // 3507
M=D // 3508
@ARG // 3509
A=M // 3510
D=M // 3511
@SP // 3512
AM=M+1 // 3513
A=A-1 // 3514
M=D // 3515
// call Memory.getBinIndex
@6 // 3516
D=A // 3517
@14 // 3518
M=D // 3519
@Memory.getBinIndex // 3520
D=A // 3521
@13 // 3522
M=D // 3523
@Memory.alloc.ret.1 // 3524
D=A // 3525
@CALL // 3526
0;JMP // 3527
(Memory.alloc.ret.1)
@SP // 3528
AM=M-1 // 3529
D=M // 3530
@LCL // 3531
A=M // 3532
M=D // 3533
@SP // 3534
AM=M-1 // 3535
D=M // 3536
@LCL // 3537
A=M+1 // 3538
M=D // 3539
@SP // 3540
AM=M-1 // 3541
D=M // 3542
@LCL // 3543
A=M+1 // 3544
A=A+1 // 3545
M=D // 3546

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
@Memory.alloc.EQ.1 // 3547
D=A // 3548
@SP // 3549
AM=M+1 // 3550
A=A-1 // 3551
M=D // 3552
@Memory.alloc.EQ.2 // 3553
D=A // 3554
@SP // 3555
AM=M+1 // 3556
A=A-1 // 3557
M=D // 3558
@LCL // 3559
A=M+1 // 3560
A=A+1 // 3561
D=M // 3562
@14 // 3563
M=D // 3564
@SP // 3565
AM=M-1 // 3566
D=M // 3567
@13 // 3568
M=D // 3569
@14 // 3570
D=M // 3571
@DO_EQ // 3572
0;JMP // 3573
(Memory.alloc.EQ.2)
@14 // 3574
M=D // 3575
@SP // 3576
AM=M-1 // 3577
D=M // 3578
@13 // 3579
M=D // 3580
@14 // 3581
D=M // 3582
@DO_EQ // 3583
0;JMP // 3584
(Memory.alloc.EQ.1)
@WHILE_END_Memory.alloc1 // 3585
D;JNE // 3586

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
@Memory.alloc.EQ.4 // 3587
D=A // 3588
@SP // 3589
AM=M+1 // 3590
A=A-1 // 3591
M=D // 3592
@Memory.alloc.LT.5 // 3593
D=A // 3594
@SP // 3595
AM=M+1 // 3596
A=A-1 // 3597
M=D // 3598
@LCL // 3599
A=M // 3600
D=M+1 // 3601
@7 // 3602
D=D-A // 3603
@14 // 3604
M=D // 3605
@SP // 3606
AM=M-1 // 3607
D=M // 3608
@13 // 3609
M=D // 3610
@14 // 3611
D=M // 3612
@DO_LT // 3613
0;JMP // 3614
(Memory.alloc.LT.5)
D=!D // 3615
@14 // 3616
M=D // 3617
@SP // 3618
AM=M-1 // 3619
D=M // 3620
@13 // 3621
M=D // 3622
@14 // 3623
D=M // 3624
@DO_EQ // 3625
0;JMP // 3626
(Memory.alloc.EQ.4)
@Memory.alloc.IfElse1 // 3627
D;JNE // 3628

////PushInstruction("constant 0")
@SP // 3629
AM=M+1 // 3630
A=A-1 // 3631
M=0 // 3632

////ReturnInstruction{}
@RETURN // 3633
0;JMP // 3634

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 3635
0;JMP // 3636

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

////  nested:
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
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3637
A=M+1 // 3638
D=M // 3639
@SP // 3640
AM=M+1 // 3641
A=A-1 // 3642
M=D // 3643
@ARG // 3644
A=M // 3645
D=M // 3646
@SP // 3647
AM=M+1 // 3648
A=A-1 // 3649
M=D // 3650
// call Memory.get_best_fit
@7 // 3651
D=A // 3652
@14 // 3653
M=D // 3654
@Memory.get_best_fit // 3655
D=A // 3656
@13 // 3657
M=D // 3658
@Memory.alloc.ret.2 // 3659
D=A // 3660
@CALL // 3661
0;JMP // 3662
(Memory.alloc.ret.2)
@LCL // 3663
A=M // 3664
D=M // 3665
@2048 // 3666
D=D+A // 3667
@SP // 3668
AM=M+1 // 3669
A=A-1 // 3670
M=D // 3671
@LCL // 3672
A=M // 3673
D=M+1 // 3674
@LCL // 3675
A=M // 3676
M=D // 3677
@SP // 3678
AM=M-1 // 3679
D=M // 3680
@LCL // 3681
A=M+1 // 3682
M=D // 3683
@SP // 3684
AM=M-1 // 3685
D=M // 3686
@LCL // 3687
A=M+1 // 3688
A=A+1 // 3689
M=D // 3690

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 3691
0;JMP // 3692

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////  nested:
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}}
//          pop:  PopInstruction{address=temp 0}
//        }
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("that 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 3}
//}

@THAT // 3693
A=M // 3694
D=M // 3695
@SP // 3696
AM=M+1 // 3697
A=A-1 // 3698
M=D // 3699
@ARG // 3700
A=M // 3701
D=M // 3702
@SP // 3703
AM=M-1 // 3704
D=M-D // 3705
@SP // 3706
AM=M+1 // 3707
A=A-1 // 3708
M=D // 3709
@LCL // 3710
A=M+1 // 3711
A=A+1 // 3712
D=M // 3713
@SP // 3714
AM=M+1 // 3715
A=A-1 // 3716
M=D // 3717
@LCL // 3718
A=M+1 // 3719
A=A+1 // 3720
D=M // 3721
@SP // 3722
AM=M+1 // 3723
A=A-1 // 3724
M=D // 3725
@LCL // 3726
A=M+1 // 3727
A=A+1 // 3728
A=M // 3729
D=M // 3730
@SP // 3731
AM=M+1 // 3732
A=A-1 // 3733
M=D // 3734
// call Memory.getBinIndex
@6 // 3735
D=A // 3736
@14 // 3737
M=D // 3738
@Memory.getBinIndex // 3739
D=A // 3740
@13 // 3741
M=D // 3742
@Memory.alloc.ret.4 // 3743
D=A // 3744
@CALL // 3745
0;JMP // 3746
(Memory.alloc.ret.4)
@SP // 3747
AM=M-1 // 3748
D=M // 3749
@2048 // 3750
D=D+A // 3751
@SP // 3752
AM=M+1 // 3753
A=A-1 // 3754
M=D // 3755
@LCL // 3756
A=M+1 // 3757
A=A+1 // 3758
D=M // 3759
@SP // 3760
AM=M+1 // 3761
A=A-1 // 3762
M=D // 3763
// call Memory.remove_node
@7 // 3764
D=A // 3765
@14 // 3766
M=D // 3767
@Memory.remove_node // 3768
D=A // 3769
@13 // 3770
M=D // 3771
@Memory.alloc.ret.5 // 3772
D=A // 3773
@CALL // 3774
0;JMP // 3775
(Memory.alloc.ret.5)
@SP // 3776
AM=M-1 // 3777
D=M // 3778
@5 // 3779
M=D // 3780
@SP // 3781
AM=M-1 // 3782
D=M // 3783
@4 // 3784
M=D // 3785
@SP // 3786
AM=M-1 // 3787
D=M // 3788
@LCL // 3789
A=M+1 // 3790
A=A+1 // 3791
A=A+1 // 3792
M=D // 3793

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
@Memory.alloc.EQ.7 // 3794
D=A // 3795
@SP // 3796
AM=M+1 // 3797
A=A-1 // 3798
M=D // 3799
@Memory.alloc.GT.8 // 3800
D=A // 3801
@SP // 3802
AM=M+1 // 3803
A=A-1 // 3804
M=D // 3805
@LCL // 3806
A=M+1 // 3807
A=A+1 // 3808
A=A+1 // 3809
D=M // 3810
@5 // 3811
D=D-A // 3812
@14 // 3813
M=D // 3814
@SP // 3815
AM=M-1 // 3816
D=M // 3817
@13 // 3818
M=D // 3819
@14 // 3820
D=M // 3821
@DO_GT // 3822
0;JMP // 3823
(Memory.alloc.GT.8)
@14 // 3824
M=D // 3825
@SP // 3826
AM=M-1 // 3827
D=M // 3828
@13 // 3829
M=D // 3830
@14 // 3831
D=M // 3832
@DO_EQ // 3833
0;JMP // 3834
(Memory.alloc.EQ.7)
@Memory.alloc.IfElse2 // 3835
D;JNE // 3836

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 3837
A=M // 3838
D=M // 3839
@SP // 3840
AM=M+1 // 3841
A=A-1 // 3842
M=D // 3843
@LCL // 3844
A=M+1 // 3845
A=A+1 // 3846
D=M // 3847
@4 // 3848
M=D // 3849
@SP // 3850
AM=M-1 // 3851
D=M // 3852
@THAT // 3853
A=M // 3854
M=D // 3855

////  nested:
//      nested:
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
//        PushPopPair {
//          push: PushInstruction("constant 0")
//          pop:  PopInstruction{address=that 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
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
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 3856
A=M+1 // 3857
A=A+1 // 3858
D=M // 3859
@SP // 3860
AM=M+1 // 3861
A=A-1 // 3862
M=D // 3863
@ARG // 3864
A=M // 3865
D=M // 3866
@SP // 3867
AM=M-1 // 3868
D=D+M // 3869
@5 // 3870
D=D+A // 3871
@SP // 3872
AM=M+1 // 3873
A=A-1 // 3874
M=D // 3875
@LCL // 3876
A=M+1 // 3877
A=A+1 // 3878
D=M // 3879
@SP // 3880
AM=M+1 // 3881
A=A-1 // 3882
M=D // 3883
// call Memory.create_foot
@6 // 3884
D=A // 3885
@14 // 3886
M=D // 3887
@Memory.create_foot // 3888
D=A // 3889
@13 // 3890
M=D // 3891
@Memory.alloc.ret.6 // 3892
D=A // 3893
@CALL // 3894
0;JMP // 3895
(Memory.alloc.ret.6)
@LCL // 3896
A=M+1 // 3897
A=A+1 // 3898
A=M+1 // 3899
M=0 // 3900
@SP // 3901
AM=M-1 // 3902
D=M // 3903
@5 // 3904
M=D // 3905
@LCL // 3906
D=M // 3907
@4 // 3908
A=D+A // 3909
D=A // 3910
@R13 // 3911
M=D // 3912
@SP // 3913
AM=M-1 // 3914
D=M // 3915
@R13 // 3916
A=M // 3917
M=D // 3918

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 3919
A=M+1 // 3920
A=A+1 // 3921
A=A+1 // 3922
D=M // 3923
@5 // 3924
D=D-A // 3925
@SP // 3926
AM=M+1 // 3927
A=A-1 // 3928
M=D // 3929
@LCL // 3930
D=M // 3931
@4 // 3932
A=D+A // 3933
D=M // 3934
@4 // 3935
M=D // 3936
@SP // 3937
AM=M-1 // 3938
D=M // 3939
@THAT // 3940
A=M // 3941
M=D // 3942

////  nested:
//      nested:
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
//        PushPopPair {
//          push: PushInstruction("constant 1")
//          pop:  PopInstruction{address=that 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 4")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3943
A=M+1 // 3944
A=A+1 // 3945
A=A+1 // 3946
D=M // 3947
@SP // 3948
AM=M+1 // 3949
A=A-1 // 3950
M=D // 3951
// call Memory.getBinIndex
@6 // 3952
D=A // 3953
@14 // 3954
M=D // 3955
@Memory.getBinIndex // 3956
D=A // 3957
@13 // 3958
M=D // 3959
@Memory.alloc.ret.8 // 3960
D=A // 3961
@CALL // 3962
0;JMP // 3963
(Memory.alloc.ret.8)
@SP // 3964
AM=M-1 // 3965
D=M // 3966
@2048 // 3967
D=D+A // 3968
@SP // 3969
AM=M+1 // 3970
A=A-1 // 3971
M=D // 3972
@LCL // 3973
D=M // 3974
@4 // 3975
A=D+A // 3976
D=M // 3977
@SP // 3978
AM=M+1 // 3979
A=A-1 // 3980
M=D // 3981
// call Memory.add_node
@7 // 3982
D=A // 3983
@14 // 3984
M=D // 3985
@Memory.add_node // 3986
D=A // 3987
@13 // 3988
M=D // 3989
@Memory.alloc.ret.9 // 3990
D=A // 3991
@CALL // 3992
0;JMP // 3993
(Memory.alloc.ret.9)
@LCL // 3994
D=M // 3995
@4 // 3996
A=D+A // 3997
D=M // 3998
@SP // 3999
AM=M+1 // 4000
A=A-1 // 4001
M=D // 4002
// call Memory.create_foot
@6 // 4003
D=A // 4004
@14 // 4005
M=D // 4006
@Memory.create_foot // 4007
D=A // 4008
@13 // 4009
M=D // 4010
@Memory.alloc.ret.10 // 4011
D=A // 4012
@CALL // 4013
0;JMP // 4014
(Memory.alloc.ret.10)
@LCL // 4015
D=M // 4016
@4 // 4017
A=D+A // 4018
A=M+1 // 4019
M=1 // 4020
@SP // 4021
AM=M-1 // 4022
D=M // 4023
@5 // 4024
M=D // 4025
@SP // 4026
AM=M-1 // 4027
D=M // 4028
@5 // 4029
M=D // 4030

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 4031
0;JMP // 4032

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////  nested:
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
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=11, Memory.init=2}, currentFunction='Memory.alloc'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4033
A=M+1 // 4034
A=A+1 // 4035
D=M // 4036
@SP // 4037
AM=M+1 // 4038
A=A-1 // 4039
M=D // 4040
// call Memory.create_foot
@6 // 4041
D=A // 4042
@14 // 4043
M=D // 4044
@Memory.create_foot // 4045
D=A // 4046
@13 // 4047
M=D // 4048
@Memory.alloc.ret.11 // 4049
D=A // 4050
@CALL // 4051
0;JMP // 4052
(Memory.alloc.ret.11)
@LCL // 4053
A=M+1 // 4054
A=A+1 // 4055
A=M+1 // 4056
M=0 // 4057
@SP // 4058
AM=M-1 // 4059
D=M // 4060
@5 // 4061
M=D // 4062

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
@LCL // 4063
A=M+1 // 4064
A=A+1 // 4065
D=M // 4066
@4 // 4067
D=D+A // 4068
@SP // 4069
AM=M+1 // 4070
A=A-1 // 4071
M=D // 4072

////ReturnInstruction{}
@RETURN // 4073
0;JMP // 4074

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=12, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 4075
AM=M+1 // 4076
A=A-1 // 4077
M=0 // 4078

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=12, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 4079
A=M // 4080
D=M // 4081
@SP // 4082
AM=M+1 // 4083
A=A-1 // 4084
M=D // 4085
// call Memory.alloc
@6 // 4086
D=A // 4087
@14 // 4088
M=D // 4089
@Memory.alloc // 4090
D=A // 4091
@13 // 4092
M=D // 4093
@Memory.calloc.ret.0 // 4094
D=A // 4095
@CALL // 4096
0;JMP // 4097
(Memory.calloc.ret.0)
@SP // 4098
AM=M-1 // 4099
D=M // 4100
@LCL // 4101
A=M // 4102
M=D // 4103

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.9 // 4104
D=A // 4105
@SP // 4106
AM=M+1 // 4107
A=A-1 // 4108
M=D // 4109
@LCL // 4110
A=M // 4111
D=!M // 4112
@14 // 4113
M=D // 4114
@SP // 4115
AM=M-1 // 4116
D=M // 4117
@13 // 4118
M=D // 4119
@14 // 4120
D=M // 4121
@DO_EQ // 4122
0;JMP // 4123
(Memory.calloc.EQ.9)
@Memory.calloc.IfElse1 // 4124
D;JNE // 4125

////PushInstruction("constant 0")
@SP // 4126
AM=M+1 // 4127
A=A-1 // 4128
M=0 // 4129

////ReturnInstruction{}
@RETURN // 4130
0;JMP // 4131

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 4132
0;JMP // 4133

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
@Memory.calloc.EQ.11 // 4134
D=A // 4135
@SP // 4136
AM=M+1 // 4137
A=A-1 // 4138
M=D // 4139
@Memory.calloc.GT.12 // 4140
D=A // 4141
@SP // 4142
AM=M+1 // 4143
A=A-1 // 4144
M=D // 4145
@ARG // 4146
A=M // 4147
D=M // 4148
@14 // 4149
M=D // 4150
@SP // 4151
AM=M-1 // 4152
D=M // 4153
@13 // 4154
M=D // 4155
@14 // 4156
D=M // 4157
@DO_GT // 4158
0;JMP // 4159
(Memory.calloc.GT.12)
@14 // 4160
M=D // 4161
@SP // 4162
AM=M-1 // 4163
D=M // 4164
@13 // 4165
M=D // 4166
@14 // 4167
D=M // 4168
@DO_EQ // 4169
0;JMP // 4170
(Memory.calloc.EQ.11)
@WHILE_END_Memory.calloc1 // 4171
D;JNE // 4172

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

@ARG // 4173
A=M // 4174
D=M-1 // 4175
@ARG // 4176
A=M // 4177
M=D // 4178

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 4179
A=M // 4180
D=M // 4181
@SP // 4182
AM=M+1 // 4183
A=A-1 // 4184
M=D // 4185
@ARG // 4186
A=M // 4187
D=M // 4188
@SP // 4189
AM=M-1 // 4190
A=D+M // 4191
M=0 // 4192

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 4193
0;JMP // 4194

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 4195
A=M // 4196
D=M // 4197
@SP // 4198
AM=M+1 // 4199
A=A-1 // 4200
M=D // 4201

////ReturnInstruction{}
@RETURN // 4202
0;JMP // 4203

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 4204
AM=M+1 // 4205
A=A-1 // 4206
M=0 // 4207
@SP // 4208
AM=M+1 // 4209
A=A-1 // 4210
M=0 // 4211
@SP // 4212
AM=M+1 // 4213
A=A-1 // 4214
M=0 // 4215

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

@ARG // 4216
A=M // 4217
D=M // 4218
@4 // 4219
D=D-A // 4220
@LCL // 4221
A=M // 4222
M=D // 4223

////  nested:
//      nested:
//          nested:
//              nested:
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
//                PushPopPair {
//                  push: PushInstruction("constant 1")
//                  pop:  PopInstruction{address=that 0}
//                }
//            PushPopPair {
//              push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)
//              pop:  PopInstruction{address=pointer 1}
//            }
//        PushPopPair {
//          push: PushInstruction("that 0")
//          pop:  PopInstruction{address=local 1}
//        }
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
//PushPopPair {
//  push: PushInstruction("that 0")
//  pop:  PopInstruction{address=local 2}
//}

@THAT // 4224
A=M // 4225
D=M // 4226
@SP // 4227
AM=M+1 // 4228
A=A-1 // 4229
M=D // 4230
@LCL // 4231
A=M // 4232
D=M // 4233
@3 // 4234
D=D+A // 4235
@SP // 4236
AM=M+1 // 4237
A=A-1 // 4238
M=D // 4239
@THAT // 4240
A=M // 4241
D=M // 4242
@SP // 4243
AM=M+1 // 4244
A=A-1 // 4245
M=D // 4246
@LCL // 4247
A=M // 4248
D=M // 4249
@2 // 4250
D=D+A // 4251
@SP // 4252
AM=M+1 // 4253
A=A-1 // 4254
M=D // 4255
@LCL // 4256
A=M // 4257
A=M+1 // 4258
M=1 // 4259
@SP // 4260
AM=M-1 // 4261
D=M // 4262
@4 // 4263
M=D // 4264
@SP // 4265
AM=M-1 // 4266
D=M // 4267
@LCL // 4268
A=M+1 // 4269
M=D // 4270
@SP // 4271
AM=M-1 // 4272
D=M // 4273
@4 // 4274
M=D // 4275
@SP // 4276
AM=M-1 // 4277
D=M // 4278
@LCL // 4279
A=M+1 // 4280
A=A+1 // 4281
M=D // 4282

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
@Memory.deAlloc.EQ.14 // 4283
D=A // 4284
@SP // 4285
AM=M+1 // 4286
A=A-1 // 4287
M=D // 4288
@Memory.deAlloc.EQ.15 // 4289
D=A // 4290
@SP // 4291
AM=M+1 // 4292
A=A-1 // 4293
M=D // 4294
@LCL // 4295
A=M+1 // 4296
D=M // 4297
@14 // 4298
M=D // 4299
@SP // 4300
AM=M-1 // 4301
D=M // 4302
@13 // 4303
M=D // 4304
@14 // 4305
D=M // 4306
@DO_EQ // 4307
0;JMP // 4308
(Memory.deAlloc.EQ.15)
D=!D // 4309
@14 // 4310
M=D // 4311
@SP // 4312
AM=M-1 // 4313
D=M // 4314
@13 // 4315
M=D // 4316
@14 // 4317
D=M // 4318
@DO_EQ // 4319
0;JMP // 4320
(Memory.deAlloc.EQ.14)
@Memory.deAlloc.IfElse1 // 4321
D;JNE // 4322

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 1"),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse2}}
@Memory.deAlloc.EQ.17 // 4323
D=A // 4324
@SP // 4325
AM=M+1 // 4326
A=A-1 // 4327
M=D // 4328
@Memory.deAlloc.EQ.18 // 4329
D=A // 4330
@SP // 4331
AM=M+1 // 4332
A=A-1 // 4333
M=D // 4334
@LCL // 4335
A=M+1 // 4336
A=M+1 // 4337
D=M // 4338
D=M-1 // 4339
@14 // 4340
M=D // 4341
@SP // 4342
AM=M-1 // 4343
D=M // 4344
@13 // 4345
M=D // 4346
@14 // 4347
D=M // 4348
@DO_EQ // 4349
0;JMP // 4350
(Memory.deAlloc.EQ.18)
@14 // 4351
M=D // 4352
@SP // 4353
AM=M-1 // 4354
D=M // 4355
@13 // 4356
M=D // 4357
@14 // 4358
D=M // 4359
@DO_EQ // 4360
0;JMP // 4361
(Memory.deAlloc.EQ.17)
@Memory.deAlloc.IfElse2 // 4362
D;JNE // 4363

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=0, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 4364
A=M+1 // 4365
D=M // 4366
@SP // 4367
AM=M+1 // 4368
A=A-1 // 4369
M=D // 4370
@LCL // 4371
A=M+1 // 4372
D=M // 4373
@SP // 4374
AM=M+1 // 4375
A=A-1 // 4376
M=D // 4377
@LCL // 4378
A=M+1 // 4379
A=M // 4380
D=M // 4381
@SP // 4382
AM=M+1 // 4383
A=A-1 // 4384
M=D // 4385
// call Memory.getBinIndex
@6 // 4386
D=A // 4387
@14 // 4388
M=D // 4389
@Memory.getBinIndex // 4390
D=A // 4391
@13 // 4392
M=D // 4393
@Memory.deAlloc.ret.1 // 4394
D=A // 4395
@CALL // 4396
0;JMP // 4397
(Memory.deAlloc.ret.1)
@SP // 4398
AM=M-1 // 4399
D=M // 4400
@2048 // 4401
D=D+A // 4402
@SP // 4403
AM=M+1 // 4404
A=A-1 // 4405
M=D // 4406
@LCL // 4407
A=M+1 // 4408
D=M // 4409
@SP // 4410
AM=M+1 // 4411
A=A-1 // 4412
M=D // 4413
// call Memory.remove_node
@7 // 4414
D=A // 4415
@14 // 4416
M=D // 4417
@Memory.remove_node // 4418
D=A // 4419
@13 // 4420
M=D // 4421
@Memory.deAlloc.ret.2 // 4422
D=A // 4423
@CALL // 4424
0;JMP // 4425
(Memory.deAlloc.ret.2)
@SP // 4426
AM=M-1 // 4427
D=M // 4428
@5 // 4429
M=D // 4430
@SP // 4431
AM=M-1 // 4432
D=M // 4433
@4 // 4434
M=D // 4435

////  nested:
//      nested:
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
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 0"),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=that 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4436
A=M+1 // 4437
D=M // 4438
@SP // 4439
AM=M+1 // 4440
A=A-1 // 4441
M=D // 4442
@LCL // 4443
A=M+1 // 4444
D=M // 4445
@SP // 4446
AM=M+1 // 4447
A=A-1 // 4448
M=D // 4449
// call Memory.create_foot
@6 // 4450
D=A // 4451
@14 // 4452
M=D // 4453
@Memory.create_foot // 4454
D=A // 4455
@13 // 4456
M=D // 4457
@Memory.deAlloc.ret.3 // 4458
D=A // 4459
@CALL // 4460
0;JMP // 4461
(Memory.deAlloc.ret.3)
@THAT // 4462
A=M // 4463
D=M // 4464
@SP // 4465
AM=M+1 // 4466
A=A-1 // 4467
M=D // 4468
@LCL // 4469
A=M // 4470
A=M // 4471
D=M // 4472
@SP // 4473
AM=M-1 // 4474
D=D+M // 4475
@5 // 4476
D=D+A // 4477
@SP // 4478
AM=M+1 // 4479
A=A-1 // 4480
M=D // 4481
@LCL // 4482
A=M+1 // 4483
D=M // 4484
@4 // 4485
M=D // 4486
@SP // 4487
AM=M-1 // 4488
D=M // 4489
@THAT // 4490
A=M // 4491
M=D // 4492
@SP // 4493
AM=M-1 // 4494
D=M // 4495
@5 // 4496
M=D // 4497
@SP // 4498
AM=M-1 // 4499
D=M // 4500
@LCL // 4501
A=M // 4502
M=D // 4503

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 4504
0;JMP // 4505

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 4506
0;JMP // 4507

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
@Memory.deAlloc.EQ.20 // 4508
D=A // 4509
@SP // 4510
AM=M+1 // 4511
A=A-1 // 4512
M=D // 4513
@Memory.deAlloc.EQ.21 // 4514
D=A // 4515
@SP // 4516
AM=M+1 // 4517
A=A-1 // 4518
M=D // 4519
@LCL // 4520
A=M+1 // 4521
A=A+1 // 4522
D=M // 4523
@14 // 4524
M=D // 4525
@SP // 4526
AM=M-1 // 4527
D=M // 4528
@13 // 4529
M=D // 4530
@14 // 4531
D=M // 4532
@DO_EQ // 4533
0;JMP // 4534
(Memory.deAlloc.EQ.21)
D=!D // 4535
@14 // 4536
M=D // 4537
@SP // 4538
AM=M-1 // 4539
D=M // 4540
@13 // 4541
M=D // 4542
@14 // 4543
D=M // 4544
@DO_EQ // 4545
0;JMP // 4546
(Memory.deAlloc.EQ.20)
@Memory.deAlloc.IfElse3 // 4547
D;JNE // 4548

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 2"),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse4}}
@Memory.deAlloc.EQ.23 // 4549
D=A // 4550
@SP // 4551
AM=M+1 // 4552
A=A-1 // 4553
M=D // 4554
@Memory.deAlloc.EQ.24 // 4555
D=A // 4556
@SP // 4557
AM=M+1 // 4558
A=A-1 // 4559
M=D // 4560
@LCL // 4561
A=M+1 // 4562
A=A+1 // 4563
A=M+1 // 4564
D=M // 4565
D=M-1 // 4566
@14 // 4567
M=D // 4568
@SP // 4569
AM=M-1 // 4570
D=M // 4571
@13 // 4572
M=D // 4573
@14 // 4574
D=M // 4575
@DO_EQ // 4576
0;JMP // 4577
(Memory.deAlloc.EQ.24)
@14 // 4578
M=D // 4579
@SP // 4580
AM=M-1 // 4581
D=M // 4582
@13 // 4583
M=D // 4584
@14 // 4585
D=M // 4586
@DO_EQ // 4587
0;JMP // 4588
(Memory.deAlloc.EQ.23)
@Memory.deAlloc.IfElse4 // 4589
D;JNE // 4590

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 4591
A=M // 4592
D=M // 4593
@SP // 4594
AM=M+1 // 4595
A=A-1 // 4596
M=D // 4597
@LCL // 4598
A=M // 4599
D=M // 4600
@SP // 4601
AM=M+1 // 4602
A=A-1 // 4603
M=D // 4604
@LCL // 4605
A=M+1 // 4606
A=A+1 // 4607
A=M // 4608
D=M // 4609
@SP // 4610
AM=M+1 // 4611
A=A-1 // 4612
M=D // 4613
// call Memory.getBinIndex
@6 // 4614
D=A // 4615
@14 // 4616
M=D // 4617
@Memory.getBinIndex // 4618
D=A // 4619
@13 // 4620
M=D // 4621
@Memory.deAlloc.ret.5 // 4622
D=A // 4623
@CALL // 4624
0;JMP // 4625
(Memory.deAlloc.ret.5)
@SP // 4626
AM=M-1 // 4627
D=M // 4628
@2048 // 4629
D=D+A // 4630
@SP // 4631
AM=M+1 // 4632
A=A-1 // 4633
M=D // 4634
@LCL // 4635
A=M+1 // 4636
A=A+1 // 4637
D=M // 4638
@SP // 4639
AM=M+1 // 4640
A=A-1 // 4641
M=D // 4642
// call Memory.remove_node
@7 // 4643
D=A // 4644
@14 // 4645
M=D // 4646
@Memory.remove_node // 4647
D=A // 4648
@13 // 4649
M=D // 4650
@Memory.deAlloc.ret.6 // 4651
D=A // 4652
@CALL // 4653
0;JMP // 4654
(Memory.deAlloc.ret.6)
@SP // 4655
AM=M-1 // 4656
D=M // 4657
@5 // 4658
M=D // 4659
@SP // 4660
AM=M-1 // 4661
D=M // 4662
@4 // 4663
M=D // 4664

////  nested:
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
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("that 0"),
//            right:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 2"),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=7, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4665
A=M // 4666
D=M // 4667
@SP // 4668
AM=M+1 // 4669
A=A-1 // 4670
M=D // 4671
// call Memory.create_foot
@6 // 4672
D=A // 4673
@14 // 4674
M=D // 4675
@Memory.create_foot // 4676
D=A // 4677
@13 // 4678
M=D // 4679
@Memory.deAlloc.ret.7 // 4680
D=A // 4681
@CALL // 4682
0;JMP // 4683
(Memory.deAlloc.ret.7)
@THAT // 4684
A=M // 4685
D=M // 4686
@SP // 4687
AM=M+1 // 4688
A=A-1 // 4689
M=D // 4690
@LCL // 4691
A=M+1 // 4692
A=A+1 // 4693
A=M // 4694
D=M // 4695
@SP // 4696
AM=M-1 // 4697
D=D+M // 4698
@5 // 4699
D=D+A // 4700
@SP // 4701
AM=M+1 // 4702
A=A-1 // 4703
M=D // 4704
@LCL // 4705
A=M // 4706
D=M // 4707
@4 // 4708
M=D // 4709
@SP // 4710
AM=M-1 // 4711
D=M // 4712
@THAT // 4713
A=M // 4714
M=D // 4715
@SP // 4716
AM=M-1 // 4717
D=M // 4718
@5 // 4719
M=D // 4720

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 4721
0;JMP // 4722

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 4723
0;JMP // 4724

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
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}},
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.alloc=12, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4725
A=M // 4726
A=M // 4727
D=M // 4728
@SP // 4729
AM=M+1 // 4730
A=A-1 // 4731
M=D // 4732
// call Memory.getBinIndex
@6 // 4733
D=A // 4734
@14 // 4735
M=D // 4736
@Memory.getBinIndex // 4737
D=A // 4738
@13 // 4739
M=D // 4740
@Memory.deAlloc.ret.9 // 4741
D=A // 4742
@CALL // 4743
0;JMP // 4744
(Memory.deAlloc.ret.9)
@SP // 4745
AM=M-1 // 4746
D=M // 4747
@2048 // 4748
D=D+A // 4749
@SP // 4750
AM=M+1 // 4751
A=A-1 // 4752
M=D // 4753
@LCL // 4754
A=M // 4755
D=M // 4756
@SP // 4757
AM=M+1 // 4758
A=A-1 // 4759
M=D // 4760
// call Memory.add_node
@7 // 4761
D=A // 4762
@14 // 4763
M=D // 4764
@Memory.add_node // 4765
D=A // 4766
@13 // 4767
M=D // 4768
@Memory.deAlloc.ret.10 // 4769
D=A // 4770
@CALL // 4771
0;JMP // 4772
(Memory.deAlloc.ret.10)
@SP // 4773
AM=M-1 // 4774
D=M // 4775
@5 // 4776
M=D // 4777

////PushInstruction("constant 0")
@SP // 4778
AM=M+1 // 4779
A=A-1 // 4780
M=0 // 4781

////ReturnInstruction{}
@RETURN // 4782
0;JMP // 4783

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 4784
AM=M+1 // 4785
A=A-1 // 4786
M=0 // 4787
@SP // 4788
AM=M+1 // 4789
A=A-1 // 4790
M=0 // 4791
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=0 // 4795
@SP // 4796
AM=M+1 // 4797
A=A-1 // 4798
M=0 // 4799

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
@Memory.realloc.EQ.26 // 4800
D=A // 4801
@SP // 4802
AM=M+1 // 4803
A=A-1 // 4804
M=D // 4805
@Memory.realloc.EQ.27 // 4806
D=A // 4807
@SP // 4808
AM=M+1 // 4809
A=A-1 // 4810
M=D // 4811
@ARG // 4812
A=M // 4813
D=M // 4814
@14 // 4815
M=D // 4816
@SP // 4817
AM=M-1 // 4818
D=M // 4819
@13 // 4820
M=D // 4821
@14 // 4822
D=M // 4823
@DO_EQ // 4824
0;JMP // 4825
(Memory.realloc.EQ.27)
@14 // 4826
M=D // 4827
@SP // 4828
AM=M-1 // 4829
D=M // 4830
@13 // 4831
M=D // 4832
@14 // 4833
D=M // 4834
@DO_EQ // 4835
0;JMP // 4836
(Memory.realloc.EQ.26)
@Memory.realloc.IfElse1 // 4837
D;JNE // 4838

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
@ARG // 4839
A=M+1 // 4840
D=M // 4841
@SP // 4842
AM=M+1 // 4843
A=A-1 // 4844
M=D // 4845
// call Memory.alloc
@6 // 4846
D=A // 4847
@14 // 4848
M=D // 4849
@Memory.alloc // 4850
D=A // 4851
@13 // 4852
M=D // 4853
@Memory.realloc.ret.0 // 4854
D=A // 4855
@CALL // 4856
0;JMP // 4857
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 4858
0;JMP // 4859

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 4860
0;JMP // 4861

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////  nested:
//      nested:
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
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//    PushPopPair {
//      push: PushInstruction("that 0")
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 4862
A=M+1 // 4863
D=M // 4864
@SP // 4865
AM=M+1 // 4866
A=A-1 // 4867
M=D // 4868
// call Memory.alloc
@6 // 4869
D=A // 4870
@14 // 4871
M=D // 4872
@Memory.alloc // 4873
D=A // 4874
@13 // 4875
M=D // 4876
@Memory.realloc.ret.1 // 4877
D=A // 4878
@CALL // 4879
0;JMP // 4880
(Memory.realloc.ret.1)
@THAT // 4881
A=M // 4882
D=M // 4883
@SP // 4884
AM=M+1 // 4885
A=A-1 // 4886
M=D // 4887
@LCL // 4888
A=M+1 // 4889
A=A+1 // 4890
A=A+1 // 4891
D=M // 4892
@SP // 4893
AM=M+1 // 4894
A=A-1 // 4895
M=D // 4896
@LCL // 4897
A=M+1 // 4898
A=A+1 // 4899
A=A+1 // 4900
D=M // 4901
@SP // 4902
AM=M+1 // 4903
A=A-1 // 4904
M=D // 4905
@ARG // 4906
A=M // 4907
D=M-1 // 4908
@LCL // 4909
A=M+1 // 4910
A=A+1 // 4911
A=A+1 // 4912
M=D // 4913
@SP // 4914
AM=M-1 // 4915
D=M // 4916
@4 // 4917
M=D // 4918
@SP // 4919
AM=M-1 // 4920
D=M // 4921
@LCL // 4922
A=M // 4923
M=D // 4924
@SP // 4925
AM=M-1 // 4926
D=M // 4927
@LCL // 4928
A=M+1 // 4929
M=D // 4930

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
@Memory.realloc.EQ.29 // 4931
D=A // 4932
@SP // 4933
AM=M+1 // 4934
A=A-1 // 4935
M=D // 4936
@Memory.realloc.EQ.30 // 4937
D=A // 4938
@SP // 4939
AM=M+1 // 4940
A=A-1 // 4941
M=D // 4942
@LCL // 4943
A=M+1 // 4944
D=M // 4945
@14 // 4946
M=D // 4947
@SP // 4948
AM=M-1 // 4949
D=M // 4950
@13 // 4951
M=D // 4952
@14 // 4953
D=M // 4954
@DO_EQ // 4955
0;JMP // 4956
(Memory.realloc.EQ.30)
@14 // 4957
M=D // 4958
@SP // 4959
AM=M-1 // 4960
D=M // 4961
@13 // 4962
M=D // 4963
@14 // 4964
D=M // 4965
@DO_EQ // 4966
0;JMP // 4967
(Memory.realloc.EQ.29)
@Memory.realloc.IfElse2 // 4968
D;JNE // 4969

////PushInstruction("constant 0")
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=0 // 4973

////ReturnInstruction{}
@RETURN // 4974
0;JMP // 4975

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 4976
0;JMP // 4977

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
@Memory.realloc.EQ.32 // 4978
D=A // 4979
@SP // 4980
AM=M+1 // 4981
A=A-1 // 4982
M=D // 4983
@Memory.realloc.GT.33 // 4984
D=A // 4985
@SP // 4986
AM=M+1 // 4987
A=A-1 // 4988
M=D // 4989
@LCL // 4990
A=M // 4991
D=M // 4992
@SP // 4993
AM=M+1 // 4994
A=A-1 // 4995
M=D // 4996
@ARG // 4997
A=M+1 // 4998
D=M // 4999
@SP // 5000
AM=M-1 // 5001
D=M-D // 5002
@14 // 5003
M=D // 5004
@SP // 5005
AM=M-1 // 5006
D=M // 5007
@13 // 5008
M=D // 5009
@14 // 5010
D=M // 5011
@DO_GT // 5012
0;JMP // 5013
(Memory.realloc.GT.33)
D=!D // 5014
@14 // 5015
M=D // 5016
@SP // 5017
AM=M-1 // 5018
D=M // 5019
@13 // 5020
M=D // 5021
@14 // 5022
D=M // 5023
@DO_EQ // 5024
0;JMP // 5025
(Memory.realloc.EQ.32)
@Memory.realloc.IfElse3 // 5026
D;JNE // 5027

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 5028
A=M // 5029
D=M // 5030
@LCL // 5031
A=M+1 // 5032
A=A+1 // 5033
M=D // 5034

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 5035
0;JMP // 5036

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 5037
A=M+1 // 5038
D=M // 5039
@LCL // 5040
A=M+1 // 5041
A=A+1 // 5042
M=D // 5043

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 5044
A=M // 5045
D=M // 5046
@SP // 5047
AM=M+1 // 5048
A=A-1 // 5049
M=D // 5050
// call Memory.deAlloc
@6 // 5051
D=A // 5052
@14 // 5053
M=D // 5054
@Memory.deAlloc // 5055
D=A // 5056
@13 // 5057
M=D // 5058
@Memory.realloc.ret.2 // 5059
D=A // 5060
@CALL // 5061
0;JMP // 5062
(Memory.realloc.ret.2)
@ARG // 5063
A=M // 5064
D=M // 5065
@SP // 5066
AM=M+1 // 5067
A=A-1 // 5068
M=D // 5069
@LCL // 5070
A=M+1 // 5071
D=M // 5072
@SP // 5073
AM=M+1 // 5074
A=A-1 // 5075
M=D // 5076
@LCL // 5077
A=M+1 // 5078
A=A+1 // 5079
D=M // 5080
@SP // 5081
AM=M+1 // 5082
A=A-1 // 5083
M=D // 5084
// call Memory.copy
@8 // 5085
D=A // 5086
@14 // 5087
M=D // 5088
@Memory.copy // 5089
D=A // 5090
@13 // 5091
M=D // 5092
@Memory.realloc.ret.3 // 5093
D=A // 5094
@CALL // 5095
0;JMP // 5096
(Memory.realloc.ret.3)
@SP // 5097
AM=M-1 // 5098
D=M // 5099
@5 // 5100
M=D // 5101
@SP // 5102
AM=M-1 // 5103
D=M // 5104
@5 // 5105
M=D // 5106

////PushInstruction("local 1")
@LCL // 5107
A=M+1 // 5108
D=M // 5109
@SP // 5110
AM=M+1 // 5111
A=A-1 // 5112
M=D // 5113

////ReturnInstruction{}
@RETURN // 5114
0;JMP // 5115

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 5116
AM=M+1 // 5117
A=A-1 // 5118
M=0 // 5119

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 5120
@LCL // 5121
A=M // 5122
M=D // 5123

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
@Memory.copy.EQ.35 // 5124
D=A // 5125
@SP // 5126
AM=M+1 // 5127
A=A-1 // 5128
M=D // 5129
@Memory.copy.LT.36 // 5130
D=A // 5131
@SP // 5132
AM=M+1 // 5133
A=A-1 // 5134
M=D // 5135
@LCL // 5136
A=M // 5137
D=M // 5138
@SP // 5139
AM=M+1 // 5140
A=A-1 // 5141
M=D // 5142
@ARG // 5143
A=M+1 // 5144
A=A+1 // 5145
D=M // 5146
@SP // 5147
AM=M-1 // 5148
D=M-D // 5149
@14 // 5150
M=D // 5151
@SP // 5152
AM=M-1 // 5153
D=M // 5154
@13 // 5155
M=D // 5156
@14 // 5157
D=M // 5158
@DO_LT // 5159
0;JMP // 5160
(Memory.copy.LT.36)
@14 // 5161
M=D // 5162
@SP // 5163
AM=M-1 // 5164
D=M // 5165
@13 // 5166
M=D // 5167
@14 // 5168
D=M // 5169
@DO_EQ // 5170
0;JMP // 5171
(Memory.copy.EQ.35)
@WHILE_END_Memory.copy1 // 5172
D;JNE // 5173

////  nested:
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
//    PushPopPair {
//      push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "ADD"
//        )
//)
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 5174
A=M // 5175
D=M // 5176
@SP // 5177
AM=M+1 // 5178
A=A-1 // 5179
M=D+1 // 5180
@ARG // 5181
A=M // 5182
D=M // 5183
@SP // 5184
AM=M+1 // 5185
A=A-1 // 5186
M=D // 5187
@LCL // 5188
A=M // 5189
D=M // 5190
@SP // 5191
AM=M-1 // 5192
A=D+M // 5193
D=M // 5194
@SP // 5195
AM=M+1 // 5196
A=A-1 // 5197
M=D // 5198
@ARG // 5199
A=M+1 // 5200
D=M // 5201
@SP // 5202
AM=M+1 // 5203
A=A-1 // 5204
M=D // 5205
@LCL // 5206
A=M // 5207
D=M // 5208
@SP // 5209
AM=M-1 // 5210
D=D+M // 5211
@4 // 5212
M=D // 5213
@SP // 5214
AM=M-1 // 5215
D=M // 5216
@THAT // 5217
A=M // 5218
M=D // 5219
@SP // 5220
AM=M-1 // 5221
D=M // 5222
@LCL // 5223
A=M // 5224
M=D // 5225

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 5226
0;JMP // 5227

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 5228
AM=M+1 // 5229
A=A-1 // 5230
M=0 // 5231

////ReturnInstruction{}
@RETURN // 5232
0;JMP // 5233

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    Dereference(
//                        base:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("argument 1"),
//                                right:
//                                    PushInstruction("constant 2"),
//                                binaryOp: "ADD"
//                            )
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse1}}
@Memory.remove_node.EQ.38 // 5234
D=A // 5235
@SP // 5236
AM=M+1 // 5237
A=A-1 // 5238
M=D // 5239
@Memory.remove_node.EQ.39 // 5240
D=A // 5241
@SP // 5242
AM=M+1 // 5243
A=A-1 // 5244
M=D // 5245
@ARG // 5246
A=M+1 // 5247
D=M // 5248
@2 // 5249
A=D+A // 5250
D=M // 5251
@14 // 5252
M=D // 5253
@SP // 5254
AM=M-1 // 5255
D=M // 5256
@13 // 5257
M=D // 5258
@14 // 5259
D=M // 5260
@DO_EQ // 5261
0;JMP // 5262
(Memory.remove_node.EQ.39)
D=!D // 5263
@14 // 5264
M=D // 5265
@SP // 5266
AM=M-1 // 5267
D=M // 5268
@13 // 5269
M=D // 5270
@14 // 5271
D=M // 5272
@DO_EQ // 5273
0;JMP // 5274
(Memory.remove_node.EQ.38)
@Memory.remove_node.IfElse1 // 5275
D;JNE // 5276

////  nested:
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
//PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5277
A=M+1 // 5278
D=M // 5279
@3 // 5280
A=D+A // 5281
D=M // 5282
@SP // 5283
AM=M+1 // 5284
A=A-1 // 5285
M=D // 5286
@ARG // 5287
A=M+1 // 5288
D=M // 5289
@2 // 5290
D=D+A // 5291
@3 // 5292
D=D+A // 5293
@4 // 5294
M=D // 5295
@SP // 5296
AM=M-1 // 5297
D=M // 5298
@THAT // 5299
A=M // 5300
M=D // 5301

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 5302
0;JMP // 5303

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////  nested:
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
//PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5304
A=M+1 // 5305
D=M // 5306
@3 // 5307
A=D+A // 5308
D=M // 5309
@SP // 5310
AM=M+1 // 5311
A=A-1 // 5312
M=D // 5313
@ARG // 5314
A=M // 5315
D=M // 5316
@4 // 5317
M=D // 5318
@SP // 5319
AM=M-1 // 5320
D=M // 5321
@THAT // 5322
A=M // 5323
M=D // 5324

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    Dereference(
//                        base:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("argument 1"),
//                                right:
//                                    PushInstruction("constant 3"),
//                                binaryOp: "ADD"
//                            )
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse2}}
@Memory.remove_node.EQ.41 // 5325
D=A // 5326
@SP // 5327
AM=M+1 // 5328
A=A-1 // 5329
M=D // 5330
@Memory.remove_node.EQ.42 // 5331
D=A // 5332
@SP // 5333
AM=M+1 // 5334
A=A-1 // 5335
M=D // 5336
@ARG // 5337
A=M+1 // 5338
D=M // 5339
@3 // 5340
A=D+A // 5341
D=M // 5342
@14 // 5343
M=D // 5344
@SP // 5345
AM=M-1 // 5346
D=M // 5347
@13 // 5348
M=D // 5349
@14 // 5350
D=M // 5351
@DO_EQ // 5352
0;JMP // 5353
(Memory.remove_node.EQ.42)
D=!D // 5354
@14 // 5355
M=D // 5356
@SP // 5357
AM=M-1 // 5358
D=M // 5359
@13 // 5360
M=D // 5361
@14 // 5362
D=M // 5363
@DO_EQ // 5364
0;JMP // 5365
(Memory.remove_node.EQ.41)
@Memory.remove_node.IfElse2 // 5366
D;JNE // 5367

////  nested:
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
//PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5368
A=M+1 // 5369
D=M // 5370
@2 // 5371
A=D+A // 5372
D=M // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377
@ARG // 5378
A=M+1 // 5379
D=M // 5380
@3 // 5381
D=D+A // 5382
@2 // 5383
D=D+A // 5384
@4 // 5385
M=D // 5386
@SP // 5387
AM=M-1 // 5388
D=M // 5389
@THAT // 5390
A=M // 5391
M=D // 5392

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 5393
0;JMP // 5394

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5395
A=M+1 // 5396
D=M // 5397
@2 // 5398
A=D+A // 5399
M=0 // 5400

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5401
A=M+1 // 5402
D=M // 5403
@3 // 5404
A=D+A // 5405
M=0 // 5406

////PushInstruction("constant 0")
@SP // 5407
AM=M+1 // 5408
A=A-1 // 5409
M=0 // 5410

////ReturnInstruction{}
@RETURN // 5411
0;JMP // 5412

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 5413
AM=M+1 // 5414
A=A-1 // 5415
M=0 // 5416

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 5417
@LCL // 5418
A=M // 5419
M=D // 5420

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

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
//                            Dereference(
//                                base:
//                                    BinaryPushGroup(
//                                        left:
//                                            PushInstruction("constant 2048"),
//                                        right:
//                                            PushInstruction("local 0"),
//                                        binaryOp: "ADD"
//                                    )
//                            ),
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
@Memory.getBinIndex.EQ.45 // 5421
D=A // 5422
@SP // 5423
AM=M+1 // 5424
A=A-1 // 5425
M=D // 5426
@Memory.getBinIndex.LT.46 // 5427
D=A // 5428
@SP // 5429
AM=M+1 // 5430
A=A-1 // 5431
M=D // 5432
@LCL // 5433
A=M // 5434
D=M // 5435
@7 // 5436
D=D-A // 5437
@14 // 5438
M=D // 5439
@SP // 5440
AM=M-1 // 5441
D=M // 5442
@13 // 5443
M=D // 5444
@14 // 5445
D=M // 5446
@DO_LT // 5447
0;JMP // 5448
(Memory.getBinIndex.LT.46)
@SP // 5449
AM=M+1 // 5450
A=A-1 // 5451
M=D // 5452
@Memory.getBinIndex.EQ.47 // 5453
D=A // 5454
@SP // 5455
AM=M+1 // 5456
A=A-1 // 5457
M=D // 5458
@LCL // 5459
A=M // 5460
D=M // 5461
@2048 // 5462
A=D+A // 5463
D=M // 5464
@14 // 5465
M=D // 5466
@SP // 5467
AM=M-1 // 5468
D=M // 5469
@13 // 5470
M=D // 5471
@14 // 5472
D=M // 5473
@DO_EQ // 5474
0;JMP // 5475
(Memory.getBinIndex.EQ.47)
D=!D // 5476
@SP // 5477
AM=M-1 // 5478
D=D&M // 5479
@14 // 5480
M=D // 5481
@SP // 5482
AM=M-1 // 5483
D=M // 5484
@13 // 5485
M=D // 5486
@14 // 5487
D=M // 5488
@DO_EQ // 5489
0;JMP // 5490
(Memory.getBinIndex.EQ.45)
@WHILE_END_Memory.getBinIndex1 // 5491
D;JNE // 5492

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
@Memory.getBinIndex.EQ.49 // 5493
D=A // 5494
@SP // 5495
AM=M+1 // 5496
A=A-1 // 5497
M=D // 5498
@Memory.getBinIndex.GT.50 // 5499
D=A // 5500
@SP // 5501
AM=M+1 // 5502
A=A-1 // 5503
M=D // 5504
@ARG // 5505
A=M // 5506
D=M // 5507
@SP // 5508
AM=M+1 // 5509
A=A-1 // 5510
M=D // 5511
@LCL // 5512
A=M // 5513
D=M // 5514
@SP // 5515
AM=M+1 // 5516
A=A-1 // 5517
M=D+1 // 5518
@16 // 5519
D=A // 5520
@SP // 5521
AM=M+1 // 5522
A=A-1 // 5523
M=D // 5524
// call Math.multiply
@7 // 5525
D=A // 5526
@14 // 5527
M=D // 5528
@Math.multiply // 5529
D=A // 5530
@13 // 5531
M=D // 5532
@Memory.getBinIndex.ret.1 // 5533
D=A // 5534
@CALL // 5535
0;JMP // 5536
(Memory.getBinIndex.ret.1)
@SP // 5537
AM=M-1 // 5538
D=M // 5539
@SP // 5540
AM=M-1 // 5541
D=M-D // 5542
@14 // 5543
M=D // 5544
@SP // 5545
AM=M-1 // 5546
D=M // 5547
@13 // 5548
M=D // 5549
@14 // 5550
D=M // 5551
@DO_GT // 5552
0;JMP // 5553
(Memory.getBinIndex.GT.50)
D=!D // 5554
@14 // 5555
M=D // 5556
@SP // 5557
AM=M-1 // 5558
D=M // 5559
@13 // 5560
M=D // 5561
@14 // 5562
D=M // 5563
@DO_EQ // 5564
0;JMP // 5565
(Memory.getBinIndex.EQ.49)
@Memory.getBinIndex.IfElse1 // 5566
D;JNE // 5567

////PushInstruction("local 0")
@LCL // 5568
A=M // 5569
D=M // 5570
@SP // 5571
AM=M+1 // 5572
A=A-1 // 5573
M=D // 5574

////ReturnInstruction{}
@RETURN // 5575
0;JMP // 5576

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 5577
0;JMP // 5578

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

@LCL // 5579
A=M // 5580
D=M+1 // 5581
@LCL // 5582
A=M // 5583
M=D // 5584

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 5585
0;JMP // 5586

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
@6 // 5587
D=A // 5588
@SP // 5589
AM=M+1 // 5590
A=A-1 // 5591
M=D // 5592
@7 // 5593
D=A // 5594
@SP // 5595
AM=M+1 // 5596
A=A-1 // 5597
M=D-1 // 5598

////ReturnInstruction{}
@RETURN // 5599
0;JMP // 5600

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 5601
AM=M+1 // 5602
A=A-1 // 5603
M=0 // 5604

////  nested:
//    PushPopPair {
//      push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 5605
A=M // 5606
D=M // 5607
@SP // 5608
AM=M+1 // 5609
A=A-1 // 5610
M=D // 5611
@LCL // 5612
A=M // 5613
D=M // 5614
@SP // 5615
AM=M+1 // 5616
A=A-1 // 5617
M=D // 5618
@ARG // 5619
A=M // 5620
A=M // 5621
D=M // 5622
@LCL // 5623
A=M // 5624
M=D // 5625
@SP // 5626
AM=M-1 // 5627
D=M // 5628
@4 // 5629
M=D // 5630

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
@Memory.get_best_fit.EQ.52 // 5631
D=A // 5632
@SP // 5633
AM=M+1 // 5634
A=A-1 // 5635
M=D // 5636
@Memory.get_best_fit.LT.53 // 5637
D=A // 5638
@SP // 5639
AM=M+1 // 5640
A=A-1 // 5641
M=D // 5642
@THAT // 5643
A=M // 5644
D=M // 5645
@SP // 5646
AM=M+1 // 5647
A=A-1 // 5648
M=D // 5649
@ARG // 5650
A=M+1 // 5651
D=M // 5652
@SP // 5653
AM=M-1 // 5654
D=M-D // 5655
@14 // 5656
M=D // 5657
@SP // 5658
AM=M-1 // 5659
D=M // 5660
@13 // 5661
M=D // 5662
@14 // 5663
D=M // 5664
@DO_LT // 5665
0;JMP // 5666
(Memory.get_best_fit.LT.53)
D=!D // 5667
@14 // 5668
M=D // 5669
@SP // 5670
AM=M-1 // 5671
D=M // 5672
@13 // 5673
M=D // 5674
@14 // 5675
D=M // 5676
@DO_EQ // 5677
0;JMP // 5678
(Memory.get_best_fit.EQ.52)
@Memory.get_best_fit.IfElse1 // 5679
D;JNE // 5680

////PushInstruction("local 0")
@LCL // 5681
A=M // 5682
D=M // 5683
@SP // 5684
AM=M+1 // 5685
A=A-1 // 5686
M=D // 5687

////ReturnInstruction{}
@RETURN // 5688
0;JMP // 5689

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 5690
0;JMP // 5691

////LabelInstruction{label='Memory.get_best_fit.IfElse1}
// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND1}
// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.get_best_fit1}
// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    Dereference(
//                        base:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("local 0"),
//                                right:
//                                    PushInstruction("constant 3"),
//                                binaryOp: "ADD"
//                            )
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}}
@Memory.get_best_fit.EQ.55 // 5692
D=A // 5693
@SP // 5694
AM=M+1 // 5695
A=A-1 // 5696
M=D // 5697
@Memory.get_best_fit.EQ.56 // 5698
D=A // 5699
@SP // 5700
AM=M+1 // 5701
A=A-1 // 5702
M=D // 5703
@LCL // 5704
A=M // 5705
D=M // 5706
@3 // 5707
A=D+A // 5708
D=M // 5709
@14 // 5710
M=D // 5711
@SP // 5712
AM=M-1 // 5713
D=M // 5714
@13 // 5715
M=D // 5716
@14 // 5717
D=M // 5718
@DO_EQ // 5719
0;JMP // 5720
(Memory.get_best_fit.EQ.56)
D=!D // 5721
@14 // 5722
M=D // 5723
@SP // 5724
AM=M-1 // 5725
D=M // 5726
@13 // 5727
M=D // 5728
@14 // 5729
D=M // 5730
@DO_EQ // 5731
0;JMP // 5732
(Memory.get_best_fit.EQ.55)
@WHILE_END_Memory.get_best_fit1 // 5733
D;JNE // 5734

////  nested:
//    PushPopPair {
//      push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//)
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@LCL // 5735
A=M // 5736
D=M // 5737
@SP // 5738
AM=M+1 // 5739
A=A-1 // 5740
M=D // 5741
@LCL // 5742
A=M // 5743
D=M // 5744
@SP // 5745
AM=M+1 // 5746
A=A-1 // 5747
M=D // 5748
@LCL // 5749
A=M // 5750
D=M // 5751
@3 // 5752
A=D+A // 5753
D=M // 5754
@LCL // 5755
A=M // 5756
M=D // 5757
@SP // 5758
AM=M-1 // 5759
D=M // 5760
@4 // 5761
M=D // 5762

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
@Memory.get_best_fit.EQ.58 // 5763
D=A // 5764
@SP // 5765
AM=M+1 // 5766
A=A-1 // 5767
M=D // 5768
@Memory.get_best_fit.LT.59 // 5769
D=A // 5770
@SP // 5771
AM=M+1 // 5772
A=A-1 // 5773
M=D // 5774
@THAT // 5775
A=M // 5776
D=M // 5777
@SP // 5778
AM=M+1 // 5779
A=A-1 // 5780
M=D // 5781
@ARG // 5782
A=M+1 // 5783
D=M // 5784
@SP // 5785
AM=M-1 // 5786
D=M-D // 5787
@14 // 5788
M=D // 5789
@SP // 5790
AM=M-1 // 5791
D=M // 5792
@13 // 5793
M=D // 5794
@14 // 5795
D=M // 5796
@DO_LT // 5797
0;JMP // 5798
(Memory.get_best_fit.LT.59)
D=!D // 5799
@14 // 5800
M=D // 5801
@SP // 5802
AM=M-1 // 5803
D=M // 5804
@13 // 5805
M=D // 5806
@14 // 5807
D=M // 5808
@DO_EQ // 5809
0;JMP // 5810
(Memory.get_best_fit.EQ.58)
@Memory.get_best_fit.IfElse2 // 5811
D;JNE // 5812

////PushInstruction("local 0")
@LCL // 5813
A=M // 5814
D=M // 5815
@SP // 5816
AM=M+1 // 5817
A=A-1 // 5818
M=D // 5819

////ReturnInstruction{}
@RETURN // 5820
0;JMP // 5821

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 5822
0;JMP // 5823

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 5824
0;JMP // 5825

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 5826
AM=M+1 // 5827
A=A-1 // 5828
M=0 // 5829

////ReturnInstruction{}
@RETURN // 5830
0;JMP // 5831

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("argument 0"),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 4"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=pointer 1}
//    }
//PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5832
A=M // 5833
D=M // 5834
@SP // 5835
AM=M+1 // 5836
A=A-1 // 5837
M=D // 5838
@ARG // 5839
A=M // 5840
D=M // 5841
@SP // 5842
AM=M+1 // 5843
A=A-1 // 5844
M=D // 5845
@ARG // 5846
A=M // 5847
A=M // 5848
D=M // 5849
@4 // 5850
D=D+A // 5851
@SP // 5852
AM=M-1 // 5853
D=D+M // 5854
@4 // 5855
M=D // 5856
@SP // 5857
AM=M-1 // 5858
D=M // 5859
@THAT // 5860
A=M // 5861
M=D // 5862

////PushInstruction("constant 0")
@SP // 5863
AM=M+1 // 5864
A=A-1 // 5865
M=0 // 5866

////ReturnInstruction{}
@RETURN // 5867
0;JMP // 5868

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 5869
AM=M+1 // 5870
A=A-1 // 5871
M=0 // 5872
@SP // 5873
AM=M+1 // 5874
A=A-1 // 5875
M=0 // 5876

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5877
A=M+1 // 5878
D=M // 5879
@2 // 5880
A=D+A // 5881
M=0 // 5882

////  nested:
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
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@ARG // 5883
A=M // 5884
D=M // 5885
@SP // 5886
AM=M+1 // 5887
A=A-1 // 5888
M=D // 5889
@ARG // 5890
A=M // 5891
D=M // 5892
@SP // 5893
AM=M+1 // 5894
A=A-1 // 5895
M=D // 5896
@ARG // 5897
A=M+1 // 5898
D=M // 5899
@3 // 5900
A=D+A // 5901
M=0 // 5902
@SP // 5903
AM=M-1 // 5904
D=M // 5905
@4 // 5906
M=D // 5907

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
@Memory.add_node.EQ.61 // 5908
D=A // 5909
@SP // 5910
AM=M+1 // 5911
A=A-1 // 5912
M=D // 5913
@Memory.add_node.EQ.62 // 5914
D=A // 5915
@SP // 5916
AM=M+1 // 5917
A=A-1 // 5918
M=D // 5919
@THAT // 5920
A=M // 5921
D=M // 5922
@14 // 5923
M=D // 5924
@SP // 5925
AM=M-1 // 5926
D=M // 5927
@13 // 5928
M=D // 5929
@14 // 5930
D=M // 5931
@DO_EQ // 5932
0;JMP // 5933
(Memory.add_node.EQ.62)
@14 // 5934
M=D // 5935
@SP // 5936
AM=M-1 // 5937
D=M // 5938
@13 // 5939
M=D // 5940
@14 // 5941
D=M // 5942
@DO_EQ // 5943
0;JMP // 5944
(Memory.add_node.EQ.61)
@Memory.add_node.IfElse1 // 5945
D;JNE // 5946

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 5947
A=M+1 // 5948
D=M // 5949
@SP // 5950
AM=M+1 // 5951
A=A-1 // 5952
M=D // 5953
@ARG // 5954
A=M // 5955
D=M // 5956
@4 // 5957
M=D // 5958
@SP // 5959
AM=M-1 // 5960
D=M // 5961
@THAT // 5962
A=M // 5963
M=D // 5964

////PushInstruction("constant 0")
@SP // 5965
AM=M+1 // 5966
A=A-1 // 5967
M=0 // 5968

////ReturnInstruction{}
@RETURN // 5969
0;JMP // 5970

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 5971
0;JMP // 5972

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////  nested:
//    PushPopPair {
//      push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@SP // 5973
AM=M+1 // 5974
A=A-1 // 5975
M=0 // 5976
@ARG // 5977
A=M // 5978
A=M // 5979
D=M // 5980
@LCL // 5981
A=M // 5982
M=D // 5983
@SP // 5984
AM=M-1 // 5985
D=M // 5986
@LCL // 5987
A=M+1 // 5988
M=D // 5989

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

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
//                            Dereference(
//                                base:
//                                    BinaryPushGroup(
//                                        left:
//                                            PushInstruction("local 0"),
//                                        right:
//                                            PushInstruction("constant 0"),
//                                        binaryOp: "ADD"
//                                    )
//                            ),
//                        right:
//                            Dereference(
//                                base:
//                                    BinaryPushGroup(
//                                        left:
//                                            PushInstruction("argument 1"),
//                                        right:
//                                            PushInstruction("constant 0"),
//                                        binaryOp: "ADD"
//                                    )
//                            ),
//                        binaryOp: "GT"
//                    ),
//NOT),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.add_node1}}
@Memory.add_node.EQ.65 // 5990
D=A // 5991
@SP // 5992
AM=M+1 // 5993
A=A-1 // 5994
M=D // 5995
@Memory.add_node.EQ.66 // 5996
D=A // 5997
@SP // 5998
AM=M+1 // 5999
A=A-1 // 6000
M=D // 6001
@LCL // 6002
A=M // 6003
D=M // 6004
@14 // 6005
M=D // 6006
@SP // 6007
AM=M-1 // 6008
D=M // 6009
@13 // 6010
M=D // 6011
@14 // 6012
D=M // 6013
@DO_EQ // 6014
0;JMP // 6015
(Memory.add_node.EQ.66)
@SP // 6016
AM=M+1 // 6017
A=A-1 // 6018
M=D // 6019
@SP // 6020
A=M-1 // 6021
M=!D // 6022
@Memory.add_node.GT.67 // 6023
D=A // 6024
@SP // 6025
AM=M+1 // 6026
A=A-1 // 6027
M=D // 6028
@LCL // 6029
A=M // 6030
A=M // 6031
D=M // 6032
@SP // 6033
AM=M+1 // 6034
A=A-1 // 6035
M=D // 6036
@ARG // 6037
A=M+1 // 6038
A=M // 6039
D=M // 6040
@SP // 6041
AM=M-1 // 6042
D=M-D // 6043
@14 // 6044
M=D // 6045
@SP // 6046
AM=M-1 // 6047
D=M // 6048
@13 // 6049
M=D // 6050
@14 // 6051
D=M // 6052
@DO_GT // 6053
0;JMP // 6054
(Memory.add_node.GT.67)
D=!D // 6055
@SP // 6056
AM=M-1 // 6057
D=D&M // 6058
@14 // 6059
M=D // 6060
@SP // 6061
AM=M-1 // 6062
D=M // 6063
@13 // 6064
M=D // 6065
@14 // 6066
D=M // 6067
@DO_EQ // 6068
0;JMP // 6069
(Memory.add_node.EQ.65)
@WHILE_END_Memory.add_node1 // 6070
D;JNE // 6071

////  nested:
//      nested:
//        PushPopPair {
//          push: PushInstruction("local 0")
//          pop:  PopInstruction{address=local 1}
//        }
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
//PushPopPair {
//  push: PushInstruction("that 0")
//  pop:  PopInstruction{address=local 0}
//}

@THAT // 6072
A=M // 6073
D=M // 6074
@SP // 6075
AM=M+1 // 6076
A=A-1 // 6077
M=D // 6078
@LCL // 6079
A=M // 6080
D=M // 6081
@3 // 6082
D=D+A // 6083
@SP // 6084
AM=M+1 // 6085
A=A-1 // 6086
M=D // 6087
@LCL // 6088
A=M // 6089
D=M // 6090
@LCL // 6091
A=M+1 // 6092
M=D // 6093
@SP // 6094
AM=M-1 // 6095
D=M // 6096
@4 // 6097
M=D // 6098
@SP // 6099
AM=M-1 // 6100
D=M // 6101
@LCL // 6102
A=M // 6103
M=D // 6104

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 6105
0;JMP // 6106

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
@Memory.add_node.EQ.68 // 6107
D=A // 6108
@SP // 6109
AM=M+1 // 6110
A=A-1 // 6111
M=D // 6112
@LCL // 6113
A=M+1 // 6114
D=!M // 6115
@14 // 6116
M=D // 6117
@SP // 6118
AM=M-1 // 6119
D=M // 6120
@13 // 6121
M=D // 6122
@14 // 6123
D=M // 6124
@DO_EQ // 6125
0;JMP // 6126
(Memory.add_node.EQ.68)
@Memory.add_node.IfElse2 // 6127
D;JNE // 6128

////  nested:
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
//PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 6129
A=M // 6130
A=M // 6131
D=M // 6132
@SP // 6133
AM=M+1 // 6134
A=A-1 // 6135
M=D // 6136
@ARG // 6137
A=M+1 // 6138
D=M // 6139
@3 // 6140
D=D+A // 6141
@4 // 6142
M=D // 6143
@SP // 6144
AM=M-1 // 6145
D=M // 6146
@THAT // 6147
A=M // 6148
M=D // 6149

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 6150
A=M+1 // 6151
D=M // 6152
@SP // 6153
AM=M+1 // 6154
A=A-1 // 6155
M=D // 6156
@ARG // 6157
A=M // 6158
D=M // 6159
@2 // 6160
D=D+A // 6161
@4 // 6162
M=D // 6163
@SP // 6164
AM=M-1 // 6165
D=M // 6166
@THAT // 6167
A=M // 6168
M=D // 6169

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 6170
A=M+1 // 6171
D=M // 6172
@SP // 6173
AM=M+1 // 6174
A=A-1 // 6175
M=D // 6176
@ARG // 6177
A=M // 6178
D=M // 6179
@4 // 6180
M=D // 6181
@SP // 6182
AM=M-1 // 6183
D=M // 6184
@THAT // 6185
A=M // 6186
M=D // 6187

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 6188
0;JMP // 6189

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////  nested:
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
//PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 6190
A=M // 6191
D=M // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=D // 6196
@ARG // 6197
A=M+1 // 6198
D=M // 6199
@3 // 6200
D=D+A // 6201
@4 // 6202
M=D // 6203
@SP // 6204
AM=M-1 // 6205
D=M // 6206
@THAT // 6207
A=M // 6208
M=D // 6209

////  nested:
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
//PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 6210
A=M+1 // 6211
D=M // 6212
@SP // 6213
AM=M+1 // 6214
A=A-1 // 6215
M=D // 6216
@ARG // 6217
A=M+1 // 6218
D=M // 6219
@2 // 6220
D=D+A // 6221
@4 // 6222
M=D // 6223
@SP // 6224
AM=M-1 // 6225
D=M // 6226
@THAT // 6227
A=M // 6228
M=D // 6229

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.69 // 6230
D=A // 6231
@SP // 6232
AM=M+1 // 6233
A=A-1 // 6234
M=D // 6235
@LCL // 6236
A=M // 6237
D=M // 6238
@14 // 6239
M=D // 6240
@SP // 6241
AM=M-1 // 6242
D=M // 6243
@13 // 6244
M=D // 6245
@14 // 6246
D=M // 6247
@DO_EQ // 6248
0;JMP // 6249
(Memory.add_node.EQ.69)
@Memory.add_node.IfElse3 // 6250
D;JNE // 6251

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 6252
A=M+1 // 6253
D=M // 6254
@SP // 6255
AM=M+1 // 6256
A=A-1 // 6257
M=D // 6258
@LCL // 6259
A=M // 6260
D=M // 6261
@2 // 6262
D=D+A // 6263
@4 // 6264
M=D // 6265
@SP // 6266
AM=M-1 // 6267
D=M // 6268
@THAT // 6269
A=M // 6270
M=D // 6271

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 6272
0;JMP // 6273

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 6274
A=M+1 // 6275
D=M // 6276
@SP // 6277
AM=M+1 // 6278
A=A-1 // 6279
M=D // 6280
@LCL // 6281
A=M+1 // 6282
D=M // 6283
@3 // 6284
D=D+A // 6285
@4 // 6286
M=D // 6287
@SP // 6288
AM=M-1 // 6289
D=M // 6290
@THAT // 6291
A=M // 6292
M=D // 6293

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 6294
AM=M+1 // 6295
A=A-1 // 6296
M=0 // 6297

////ReturnInstruction{}
@RETURN // 6298
0;JMP // 6299

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 6300
A=M+1 // 6301
D=M // 6302
@SP // 6303
AM=M+1 // 6304
A=A-1 // 6305
M=D // 6306
@ARG // 6307
A=M // 6308
D=M // 6309
@4 // 6310
M=D // 6311
@SP // 6312
AM=M-1 // 6313
D=M // 6314
@THAT // 6315
A=M // 6316
M=D // 6317

////PushInstruction("constant 0")
@SP // 6318
AM=M+1 // 6319
A=A-1 // 6320
M=0 // 6321

////ReturnInstruction{}
@RETURN // 6322
0;JMP // 6323

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)

////Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
@ARG // 6324
A=M // 6325
A=M // 6326
D=M // 6327
@SP // 6328
AM=M+1 // 6329
A=A-1 // 6330
M=D // 6331

////ReturnInstruction{}
@RETURN // 6332
0;JMP // 6333

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////  nested:
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=Output.1}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.2}
//}

@SP // 6334
AM=M+1 // 6335
A=A-1 // 6336
M=0 // 6337
@SP // 6338
AM=M+1 // 6339
A=A-1 // 6340
M=0 // 6341
// call Output.initMap
@5 // 6342
D=A // 6343
@14 // 6344
M=D // 6345
@Output.initMap // 6346
D=A // 6347
@13 // 6348
M=D // 6349
@Output.init.ret.0 // 6350
D=A // 6351
@CALL // 6352
0;JMP // 6353
(Output.init.ret.0)
@SP // 6354
AM=M-1 // 6355
D=M // 6356
@5 // 6357
M=D // 6358
@SP // 6359
AM=M-1 // 6360
D=M // 6361
@Output.1 // 6362
M=D // 6363
@SP // 6364
AM=M-1 // 6365
D=M // 6366
@Output.2 // 6367
M=D // 6368

////PushInstruction("constant 0")
@SP // 6369
AM=M+1 // 6370
A=A-1 // 6371
M=0 // 6372

////ReturnInstruction{}
@RETURN // 6373
0;JMP // 6374

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 6375
AM=M+1 // 6376
A=A-1 // 6377
M=0 // 6378

////  nested:
//      nested:
//          nested:
//              nested:
//                  nested:
//                      nested:
//                          nested:
//                              nested:
//                                  nested:
//                                      nested:
//                                          nested:
//                                              nested:
//                                                  nested:
//                                                      nested:
//                                                          nested:
//                                                              nested:
//                                                                  nested:
//                                                                      nested:
//                                                                          nested:
//                                                                              nested:
//                                                                                  nested:
//                                                                                      nested:
//                                                                                          nested:
//                                                                                              nested:
//                                                                                                  nested:
//                                                                                                      nested:
//                                                                                                          nested:
//                                                                                                              nested:
//                                                                                                                  nested:
//                                                                                                                      nested:
//                                                                                                                          nested:
//                                                                                                                              nested:
//                                                                                                                                  nested:
//                                                                                                                                      nested:
//                                                                                                                                          nested:
//                                                                                                                                              nested:
//                                                                                                                                                  nested:
//                                                                                                                                                      nested:
//                                                                                                                                                          nested:
//                                                                                                                                                              nested:
//                                                                                                                                                                  nested:
//                                                                                                                                                                      nested:
//                                                                                                                                                                          nested:
//                                                                                                                                                                              nested:
//                                                                                                                                                                                  nested:
//                                                                                                                                                                                      nested:
//                                                                                                                                                                                          nested:
//                                                                                                                                                                                              nested:
//                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                                                  nested:
//                                                                                                                                                                                                                                                                                                                                                                                      nested:
//                                                                                                                                                                                                                                                                                                                                                                                          nested:
//                                                                                                                                                                                                                                                                                                                                                                                              nested:
//                                                                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=Output.0}
//                                                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                                }
//                                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                            }
//                                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                        }
//                                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                    }
//                                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                                }
//                                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                            }
//                                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                        }
//                                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                    }
//                                                                                                                                                                                PushPopPair {
//                                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                                }
//                                                                                                                                                                            PushPopPair {
//                                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                            }
//                                                                                                                                                                        PushPopPair {
//                                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                        }
//                                                                                                                                                                    PushPopPair {
//                                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                    }
//                                                                                                                                                                PushPopPair {
//                                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                                }
//                                                                                                                                                            PushPopPair {
//                                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                                            }
//                                                                                                                                                        PushPopPair {
//                                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                                        }
//                                                                                                                                                    PushPopPair {
//                                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                                    }
//                                                                                                                                                PushPopPair {
//                                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                                }
//                                                                                                                                            PushPopPair {
//                                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                                            }
//                                                                                                                                        PushPopPair {
//                                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                                        }
//                                                                                                                                    PushPopPair {
//                                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                                    }
//                                                                                                                                PushPopPair {
//                                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                                }
//                                                                                                                            PushPopPair {
//                                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                                            }
//                                                                                                                        PushPopPair {
//                                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                                        }
//                                                                                                                    PushPopPair {
//                                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                                    }
//                                                                                                                PushPopPair {
//                                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                                }
//                                                                                                            PushPopPair {
//                                                                                                              push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                                            }
//                                                                                                        PushPopPair {
//                                                                                                          push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                                        }
//                                                                                                    PushPopPair {
//                                                                                                      push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                                    }
//                                                                                                PushPopPair {
//                                                                                                  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                                }
//                                                                                            PushPopPair {
//                                                                                              push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                              pop:  PopInstruction{address=temp 0}
//                                                                                            }
//                                                                                        PushPopPair {
//                                                                                          push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                          pop:  PopInstruction{address=temp 0}
//                                                                                        }
//                                                                                    PushPopPair {
//                                                                                      push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                      pop:  PopInstruction{address=temp 0}
//                                                                                    }
//                                                                                PushPopPair {
//                                                                                  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                                  pop:  PopInstruction{address=temp 0}
//                                                                                }
//                                                                            PushPopPair {
//                                                                              push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                              pop:  PopInstruction{address=temp 0}
//                                                                            }
//                                                                        PushPopPair {
//                                                                          push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                          pop:  PopInstruction{address=temp 0}
//                                                                        }
//                                                                    PushPopPair {
//                                                                      push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                      pop:  PopInstruction{address=temp 0}
//                                                                    }
//                                                                PushPopPair {
//                                                                  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                                  pop:  PopInstruction{address=temp 0}
//                                                                }
//                                                            PushPopPair {
//                                                              push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                              pop:  PopInstruction{address=temp 0}
//                                                            }
//                                                        PushPopPair {
//                                                          push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                          pop:  PopInstruction{address=temp 0}
//                                                        }
//                                                    PushPopPair {
//                                                      push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                      pop:  PopInstruction{address=temp 0}
//                                                    }
//                                                PushPopPair {
//                                                  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                                  pop:  PopInstruction{address=temp 0}
//                                                }
//                                            PushPopPair {
//                                              push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                              pop:  PopInstruction{address=temp 0}
//                                            }
//                                        PushPopPair {
//                                          push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                          pop:  PopInstruction{address=temp 0}
//                                        }
//                                    PushPopPair {
//                                      push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                      pop:  PopInstruction{address=temp 0}
//                                    }
//                                PushPopPair {
//                                  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                                  pop:  PopInstruction{address=temp 0}
//                                }
//                            PushPopPair {
//                              push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                              pop:  PopInstruction{address=temp 0}
//                            }
//                        PushPopPair {
//                          push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                          pop:  PopInstruction{address=temp 0}
//                        }
//                    PushPopPair {
//                      push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//                  pop:  PopInstruction{address=temp 0}
//                }
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//              pop:  PopInstruction{address=temp 0}
//            }
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 6379
D=A // 6380
@SP // 6381
AM=M+1 // 6382
A=A-1 // 6383
M=D // 6384
@38 // 6385
D=A // 6386
@SP // 6387
AM=M+1 // 6388
A=A-1 // 6389
M=D // 6390
@45 // 6391
D=A // 6392
@SP // 6393
AM=M+1 // 6394
A=A-1 // 6395
M=D // 6396
@25 // 6397
D=A // 6398
@SP // 6399
AM=M+1 // 6400
A=A-1 // 6401
M=D // 6402
@SP // 6403
AM=M+1 // 6404
A=A-1 // 6405
M=0 // 6406
@SP // 6407
AM=M+1 // 6408
A=A-1 // 6409
M=0 // 6410
@SP // 6411
AM=M+1 // 6412
A=A-1 // 6413
M=0 // 6414
@SP // 6415
AM=M+1 // 6416
A=A-1 // 6417
M=0 // 6418
@SP // 6419
AM=M+1 // 6420
A=A-1 // 6421
M=0 // 6422
@SP // 6423
AM=M+1 // 6424
A=A-1 // 6425
M=0 // 6426
@SP // 6427
AM=M+1 // 6428
A=A-1 // 6429
M=0 // 6430
@SP // 6431
AM=M+1 // 6432
A=A-1 // 6433
M=0 // 6434
// call Output.create
@17 // 6435
D=A // 6436
@14 // 6437
M=D // 6438
@Output.create // 6439
D=A // 6440
@13 // 6441
M=D // 6442
@Output.initMap.ret.0 // 6443
D=A // 6444
@CALL // 6445
0;JMP // 6446
(Output.initMap.ret.0)
@125 // 6447
D=A // 6448
@SP // 6449
AM=M+1 // 6450
A=A-1 // 6451
M=D // 6452
@7 // 6453
D=A // 6454
@SP // 6455
AM=M+1 // 6456
A=A-1 // 6457
M=D // 6458
@12 // 6459
D=A // 6460
@SP // 6461
AM=M+1 // 6462
A=A-1 // 6463
M=D // 6464
@12 // 6465
D=A // 6466
@SP // 6467
AM=M+1 // 6468
A=A-1 // 6469
M=D // 6470
@12 // 6471
D=A // 6472
@SP // 6473
AM=M+1 // 6474
A=A-1 // 6475
M=D // 6476
@56 // 6477
D=A // 6478
@SP // 6479
AM=M+1 // 6480
A=A-1 // 6481
M=D // 6482
@12 // 6483
D=A // 6484
@SP // 6485
AM=M+1 // 6486
A=A-1 // 6487
M=D // 6488
@12 // 6489
D=A // 6490
@SP // 6491
AM=M+1 // 6492
A=A-1 // 6493
M=D // 6494
@12 // 6495
D=A // 6496
@SP // 6497
AM=M+1 // 6498
A=A-1 // 6499
M=D // 6500
@7 // 6501
D=A // 6502
@SP // 6503
AM=M+1 // 6504
A=A-1 // 6505
M=D // 6506
@SP // 6507
AM=M+1 // 6508
A=A-1 // 6509
M=0 // 6510
@SP // 6511
AM=M+1 // 6512
A=A-1 // 6513
M=0 // 6514
// call Output.create
@17 // 6515
D=A // 6516
@14 // 6517
M=D // 6518
@Output.create // 6519
D=A // 6520
@13 // 6521
M=D // 6522
@Output.initMap.ret.1 // 6523
D=A // 6524
@CALL // 6525
0;JMP // 6526
(Output.initMap.ret.1)
@124 // 6527
D=A // 6528
@SP // 6529
AM=M+1 // 6530
A=A-1 // 6531
M=D // 6532
@12 // 6533
D=A // 6534
@SP // 6535
AM=M+1 // 6536
A=A-1 // 6537
M=D // 6538
@12 // 6539
D=A // 6540
@SP // 6541
AM=M+1 // 6542
A=A-1 // 6543
M=D // 6544
@12 // 6545
D=A // 6546
@SP // 6547
AM=M+1 // 6548
A=A-1 // 6549
M=D // 6550
@12 // 6551
D=A // 6552
@SP // 6553
AM=M+1 // 6554
A=A-1 // 6555
M=D // 6556
@12 // 6557
D=A // 6558
@SP // 6559
AM=M+1 // 6560
A=A-1 // 6561
M=D // 6562
@12 // 6563
D=A // 6564
@SP // 6565
AM=M+1 // 6566
A=A-1 // 6567
M=D // 6568
@12 // 6569
D=A // 6570
@SP // 6571
AM=M+1 // 6572
A=A-1 // 6573
M=D // 6574
@12 // 6575
D=A // 6576
@SP // 6577
AM=M+1 // 6578
A=A-1 // 6579
M=D // 6580
@12 // 6581
D=A // 6582
@SP // 6583
AM=M+1 // 6584
A=A-1 // 6585
M=D // 6586
@SP // 6587
AM=M+1 // 6588
A=A-1 // 6589
M=0 // 6590
@SP // 6591
AM=M+1 // 6592
A=A-1 // 6593
M=0 // 6594
// call Output.create
@17 // 6595
D=A // 6596
@14 // 6597
M=D // 6598
@Output.create // 6599
D=A // 6600
@13 // 6601
M=D // 6602
@Output.initMap.ret.2 // 6603
D=A // 6604
@CALL // 6605
0;JMP // 6606
(Output.initMap.ret.2)
@123 // 6607
D=A // 6608
@SP // 6609
AM=M+1 // 6610
A=A-1 // 6611
M=D // 6612
@56 // 6613
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
@12 // 6631
D=A // 6632
@SP // 6633
AM=M+1 // 6634
A=A-1 // 6635
M=D // 6636
@7 // 6637
D=A // 6638
@SP // 6639
AM=M+1 // 6640
A=A-1 // 6641
M=D // 6642
@12 // 6643
D=A // 6644
@SP // 6645
AM=M+1 // 6646
A=A-1 // 6647
M=D // 6648
@12 // 6649
D=A // 6650
@SP // 6651
AM=M+1 // 6652
A=A-1 // 6653
M=D // 6654
@12 // 6655
D=A // 6656
@SP // 6657
AM=M+1 // 6658
A=A-1 // 6659
M=D // 6660
@56 // 6661
D=A // 6662
@SP // 6663
AM=M+1 // 6664
A=A-1 // 6665
M=D // 6666
@SP // 6667
AM=M+1 // 6668
A=A-1 // 6669
M=0 // 6670
@SP // 6671
AM=M+1 // 6672
A=A-1 // 6673
M=0 // 6674
// call Output.create
@17 // 6675
D=A // 6676
@14 // 6677
M=D // 6678
@Output.create // 6679
D=A // 6680
@13 // 6681
M=D // 6682
@Output.initMap.ret.3 // 6683
D=A // 6684
@CALL // 6685
0;JMP // 6686
(Output.initMap.ret.3)
@122 // 6687
D=A // 6688
@SP // 6689
AM=M+1 // 6690
A=A-1 // 6691
M=D // 6692
@SP // 6693
AM=M+1 // 6694
A=A-1 // 6695
M=0 // 6696
@SP // 6697
AM=M+1 // 6698
A=A-1 // 6699
M=0 // 6700
@SP // 6701
AM=M+1 // 6702
A=A-1 // 6703
M=0 // 6704
@63 // 6705
D=A // 6706
@SP // 6707
AM=M+1 // 6708
A=A-1 // 6709
M=D // 6710
@27 // 6711
D=A // 6712
@SP // 6713
AM=M+1 // 6714
A=A-1 // 6715
M=D // 6716
@12 // 6717
D=A // 6718
@SP // 6719
AM=M+1 // 6720
A=A-1 // 6721
M=D // 6722
@6 // 6723
D=A // 6724
@SP // 6725
AM=M+1 // 6726
A=A-1 // 6727
M=D // 6728
@51 // 6729
D=A // 6730
@SP // 6731
AM=M+1 // 6732
A=A-1 // 6733
M=D // 6734
@63 // 6735
D=A // 6736
@SP // 6737
AM=M+1 // 6738
A=A-1 // 6739
M=D // 6740
@SP // 6741
AM=M+1 // 6742
A=A-1 // 6743
M=0 // 6744
@SP // 6745
AM=M+1 // 6746
A=A-1 // 6747
M=0 // 6748
// call Output.create
@17 // 6749
D=A // 6750
@14 // 6751
M=D // 6752
@Output.create // 6753
D=A // 6754
@13 // 6755
M=D // 6756
@Output.initMap.ret.4 // 6757
D=A // 6758
@CALL // 6759
0;JMP // 6760
(Output.initMap.ret.4)
@121 // 6761
D=A // 6762
@SP // 6763
AM=M+1 // 6764
A=A-1 // 6765
M=D // 6766
@SP // 6767
AM=M+1 // 6768
A=A-1 // 6769
M=0 // 6770
@SP // 6771
AM=M+1 // 6772
A=A-1 // 6773
M=0 // 6774
@SP // 6775
AM=M+1 // 6776
A=A-1 // 6777
M=0 // 6778
@51 // 6779
D=A // 6780
@SP // 6781
AM=M+1 // 6782
A=A-1 // 6783
M=D // 6784
@51 // 6785
D=A // 6786
@SP // 6787
AM=M+1 // 6788
A=A-1 // 6789
M=D // 6790
@51 // 6791
D=A // 6792
@SP // 6793
AM=M+1 // 6794
A=A-1 // 6795
M=D // 6796
@62 // 6797
D=A // 6798
@SP // 6799
AM=M+1 // 6800
A=A-1 // 6801
M=D // 6802
@48 // 6803
D=A // 6804
@SP // 6805
AM=M+1 // 6806
A=A-1 // 6807
M=D // 6808
@24 // 6809
D=A // 6810
@SP // 6811
AM=M+1 // 6812
A=A-1 // 6813
M=D // 6814
@15 // 6815
D=A // 6816
@SP // 6817
AM=M+1 // 6818
A=A-1 // 6819
M=D // 6820
@SP // 6821
AM=M+1 // 6822
A=A-1 // 6823
M=0 // 6824
// call Output.create
@17 // 6825
D=A // 6826
@14 // 6827
M=D // 6828
@Output.create // 6829
D=A // 6830
@13 // 6831
M=D // 6832
@Output.initMap.ret.5 // 6833
D=A // 6834
@CALL // 6835
0;JMP // 6836
(Output.initMap.ret.5)
@120 // 6837
D=A // 6838
@SP // 6839
AM=M+1 // 6840
A=A-1 // 6841
M=D // 6842
@SP // 6843
AM=M+1 // 6844
A=A-1 // 6845
M=0 // 6846
@SP // 6847
AM=M+1 // 6848
A=A-1 // 6849
M=0 // 6850
@SP // 6851
AM=M+1 // 6852
A=A-1 // 6853
M=0 // 6854
@51 // 6855
D=A // 6856
@SP // 6857
AM=M+1 // 6858
A=A-1 // 6859
M=D // 6860
@30 // 6861
D=A // 6862
@SP // 6863
AM=M+1 // 6864
A=A-1 // 6865
M=D // 6866
@12 // 6867
D=A // 6868
@SP // 6869
AM=M+1 // 6870
A=A-1 // 6871
M=D // 6872
@12 // 6873
D=A // 6874
@SP // 6875
AM=M+1 // 6876
A=A-1 // 6877
M=D // 6878
@30 // 6879
D=A // 6880
@SP // 6881
AM=M+1 // 6882
A=A-1 // 6883
M=D // 6884
@51 // 6885
D=A // 6886
@SP // 6887
AM=M+1 // 6888
A=A-1 // 6889
M=D // 6890
@SP // 6891
AM=M+1 // 6892
A=A-1 // 6893
M=0 // 6894
@SP // 6895
AM=M+1 // 6896
A=A-1 // 6897
M=0 // 6898
// call Output.create
@17 // 6899
D=A // 6900
@14 // 6901
M=D // 6902
@Output.create // 6903
D=A // 6904
@13 // 6905
M=D // 6906
@Output.initMap.ret.6 // 6907
D=A // 6908
@CALL // 6909
0;JMP // 6910
(Output.initMap.ret.6)
@119 // 6911
D=A // 6912
@SP // 6913
AM=M+1 // 6914
A=A-1 // 6915
M=D // 6916
@SP // 6917
AM=M+1 // 6918
A=A-1 // 6919
M=0 // 6920
@SP // 6921
AM=M+1 // 6922
A=A-1 // 6923
M=0 // 6924
@SP // 6925
AM=M+1 // 6926
A=A-1 // 6927
M=0 // 6928
@51 // 6929
D=A // 6930
@SP // 6931
AM=M+1 // 6932
A=A-1 // 6933
M=D // 6934
@51 // 6935
D=A // 6936
@SP // 6937
AM=M+1 // 6938
A=A-1 // 6939
M=D // 6940
@51 // 6941
D=A // 6942
@SP // 6943
AM=M+1 // 6944
A=A-1 // 6945
M=D // 6946
@63 // 6947
D=A // 6948
@SP // 6949
AM=M+1 // 6950
A=A-1 // 6951
M=D // 6952
@63 // 6953
D=A // 6954
@SP // 6955
AM=M+1 // 6956
A=A-1 // 6957
M=D // 6958
@18 // 6959
D=A // 6960
@SP // 6961
AM=M+1 // 6962
A=A-1 // 6963
M=D // 6964
@SP // 6965
AM=M+1 // 6966
A=A-1 // 6967
M=0 // 6968
@SP // 6969
AM=M+1 // 6970
A=A-1 // 6971
M=0 // 6972
// call Output.create
@17 // 6973
D=A // 6974
@14 // 6975
M=D // 6976
@Output.create // 6977
D=A // 6978
@13 // 6979
M=D // 6980
@Output.initMap.ret.7 // 6981
D=A // 6982
@CALL // 6983
0;JMP // 6984
(Output.initMap.ret.7)
@118 // 6985
D=A // 6986
@SP // 6987
AM=M+1 // 6988
A=A-1 // 6989
M=D // 6990
@SP // 6991
AM=M+1 // 6992
A=A-1 // 6993
M=0 // 6994
@SP // 6995
AM=M+1 // 6996
A=A-1 // 6997
M=0 // 6998
@SP // 6999
AM=M+1 // 7000
A=A-1 // 7001
M=0 // 7002
@51 // 7003
D=A // 7004
@SP // 7005
AM=M+1 // 7006
A=A-1 // 7007
M=D // 7008
@51 // 7009
D=A // 7010
@SP // 7011
AM=M+1 // 7012
A=A-1 // 7013
M=D // 7014
@51 // 7015
D=A // 7016
@SP // 7017
AM=M+1 // 7018
A=A-1 // 7019
M=D // 7020
@51 // 7021
D=A // 7022
@SP // 7023
AM=M+1 // 7024
A=A-1 // 7025
M=D // 7026
@30 // 7027
D=A // 7028
@SP // 7029
AM=M+1 // 7030
A=A-1 // 7031
M=D // 7032
@12 // 7033
D=A // 7034
@SP // 7035
AM=M+1 // 7036
A=A-1 // 7037
M=D // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=0 // 7042
@SP // 7043
AM=M+1 // 7044
A=A-1 // 7045
M=0 // 7046
// call Output.create
@17 // 7047
D=A // 7048
@14 // 7049
M=D // 7050
@Output.create // 7051
D=A // 7052
@13 // 7053
M=D // 7054
@Output.initMap.ret.8 // 7055
D=A // 7056
@CALL // 7057
0;JMP // 7058
(Output.initMap.ret.8)
@117 // 7059
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
@27 // 7077
D=A // 7078
@SP // 7079
AM=M+1 // 7080
A=A-1 // 7081
M=D // 7082
@27 // 7083
D=A // 7084
@SP // 7085
AM=M+1 // 7086
A=A-1 // 7087
M=D // 7088
@27 // 7089
D=A // 7090
@SP // 7091
AM=M+1 // 7092
A=A-1 // 7093
M=D // 7094
@27 // 7095
D=A // 7096
@SP // 7097
AM=M+1 // 7098
A=A-1 // 7099
M=D // 7100
@27 // 7101
D=A // 7102
@SP // 7103
AM=M+1 // 7104
A=A-1 // 7105
M=D // 7106
@54 // 7107
D=A // 7108
@SP // 7109
AM=M+1 // 7110
A=A-1 // 7111
M=D // 7112
@SP // 7113
AM=M+1 // 7114
A=A-1 // 7115
M=0 // 7116
@SP // 7117
AM=M+1 // 7118
A=A-1 // 7119
M=0 // 7120
// call Output.create
@17 // 7121
D=A // 7122
@14 // 7123
M=D // 7124
@Output.create // 7125
D=A // 7126
@13 // 7127
M=D // 7128
@Output.initMap.ret.9 // 7129
D=A // 7130
@CALL // 7131
0;JMP // 7132
(Output.initMap.ret.9)
@116 // 7133
D=A // 7134
@SP // 7135
AM=M+1 // 7136
A=A-1 // 7137
M=D // 7138
@4 // 7139
D=A // 7140
@SP // 7141
AM=M+1 // 7142
A=A-1 // 7143
M=D // 7144
@6 // 7145
D=A // 7146
@SP // 7147
AM=M+1 // 7148
A=A-1 // 7149
M=D // 7150
@6 // 7151
D=A // 7152
@SP // 7153
AM=M+1 // 7154
A=A-1 // 7155
M=D // 7156
@15 // 7157
D=A // 7158
@SP // 7159
AM=M+1 // 7160
A=A-1 // 7161
M=D // 7162
@6 // 7163
D=A // 7164
@SP // 7165
AM=M+1 // 7166
A=A-1 // 7167
M=D // 7168
@6 // 7169
D=A // 7170
@SP // 7171
AM=M+1 // 7172
A=A-1 // 7173
M=D // 7174
@6 // 7175
D=A // 7176
@SP // 7177
AM=M+1 // 7178
A=A-1 // 7179
M=D // 7180
@54 // 7181
D=A // 7182
@SP // 7183
AM=M+1 // 7184
A=A-1 // 7185
M=D // 7186
@28 // 7187
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
@Output.initMap.ret.10 // 7209
D=A // 7210
@CALL // 7211
0;JMP // 7212
(Output.initMap.ret.10)
@115 // 7213
D=A // 7214
@SP // 7215
AM=M+1 // 7216
A=A-1 // 7217
M=D // 7218
@SP // 7219
AM=M+1 // 7220
A=A-1 // 7221
M=0 // 7222
@SP // 7223
AM=M+1 // 7224
A=A-1 // 7225
M=0 // 7226
@SP // 7227
AM=M+1 // 7228
A=A-1 // 7229
M=0 // 7230
@30 // 7231
D=A // 7232
@SP // 7233
AM=M+1 // 7234
A=A-1 // 7235
M=D // 7236
@51 // 7237
D=A // 7238
@SP // 7239
AM=M+1 // 7240
A=A-1 // 7241
M=D // 7242
@6 // 7243
D=A // 7244
@SP // 7245
AM=M+1 // 7246
A=A-1 // 7247
M=D // 7248
@24 // 7249
D=A // 7250
@SP // 7251
AM=M+1 // 7252
A=A-1 // 7253
M=D // 7254
@51 // 7255
D=A // 7256
@SP // 7257
AM=M+1 // 7258
A=A-1 // 7259
M=D // 7260
@30 // 7261
D=A // 7262
@SP // 7263
AM=M+1 // 7264
A=A-1 // 7265
M=D // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=0 // 7270
@SP // 7271
AM=M+1 // 7272
A=A-1 // 7273
M=0 // 7274
// call Output.create
@17 // 7275
D=A // 7276
@14 // 7277
M=D // 7278
@Output.create // 7279
D=A // 7280
@13 // 7281
M=D // 7282
@Output.initMap.ret.11 // 7283
D=A // 7284
@CALL // 7285
0;JMP // 7286
(Output.initMap.ret.11)
@114 // 7287
D=A // 7288
@SP // 7289
AM=M+1 // 7290
A=A-1 // 7291
M=D // 7292
@SP // 7293
AM=M+1 // 7294
A=A-1 // 7295
M=0 // 7296
@SP // 7297
AM=M+1 // 7298
A=A-1 // 7299
M=0 // 7300
@SP // 7301
AM=M+1 // 7302
A=A-1 // 7303
M=0 // 7304
@29 // 7305
D=A // 7306
@SP // 7307
AM=M+1 // 7308
A=A-1 // 7309
M=D // 7310
@55 // 7311
D=A // 7312
@SP // 7313
AM=M+1 // 7314
A=A-1 // 7315
M=D // 7316
@51 // 7317
D=A // 7318
@SP // 7319
AM=M+1 // 7320
A=A-1 // 7321
M=D // 7322
@3 // 7323
D=A // 7324
@SP // 7325
AM=M+1 // 7326
A=A-1 // 7327
M=D // 7328
@3 // 7329
D=A // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=D // 7334
@7 // 7335
D=A // 7336
@SP // 7337
AM=M+1 // 7338
A=A-1 // 7339
M=D // 7340
@SP // 7341
AM=M+1 // 7342
A=A-1 // 7343
M=0 // 7344
@SP // 7345
AM=M+1 // 7346
A=A-1 // 7347
M=0 // 7348
// call Output.create
@17 // 7349
D=A // 7350
@14 // 7351
M=D // 7352
@Output.create // 7353
D=A // 7354
@13 // 7355
M=D // 7356
@Output.initMap.ret.12 // 7357
D=A // 7358
@CALL // 7359
0;JMP // 7360
(Output.initMap.ret.12)
@113 // 7361
D=A // 7362
@SP // 7363
AM=M+1 // 7364
A=A-1 // 7365
M=D // 7366
@SP // 7367
AM=M+1 // 7368
A=A-1 // 7369
M=0 // 7370
@SP // 7371
AM=M+1 // 7372
A=A-1 // 7373
M=0 // 7374
@SP // 7375
AM=M+1 // 7376
A=A-1 // 7377
M=0 // 7378
@30 // 7379
D=A // 7380
@SP // 7381
AM=M+1 // 7382
A=A-1 // 7383
M=D // 7384
@51 // 7385
D=A // 7386
@SP // 7387
AM=M+1 // 7388
A=A-1 // 7389
M=D // 7390
@51 // 7391
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
@62 // 7403
D=A // 7404
@SP // 7405
AM=M+1 // 7406
A=A-1 // 7407
M=D // 7408
@48 // 7409
D=A // 7410
@SP // 7411
AM=M+1 // 7412
A=A-1 // 7413
M=D // 7414
@48 // 7415
D=A // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=D // 7420
@SP // 7421
AM=M+1 // 7422
A=A-1 // 7423
M=0 // 7424
// call Output.create
@17 // 7425
D=A // 7426
@14 // 7427
M=D // 7428
@Output.create // 7429
D=A // 7430
@13 // 7431
M=D // 7432
@Output.initMap.ret.13 // 7433
D=A // 7434
@CALL // 7435
0;JMP // 7436
(Output.initMap.ret.13)
@112 // 7437
D=A // 7438
@SP // 7439
AM=M+1 // 7440
A=A-1 // 7441
M=D // 7442
@SP // 7443
AM=M+1 // 7444
A=A-1 // 7445
M=0 // 7446
@SP // 7447
AM=M+1 // 7448
A=A-1 // 7449
M=0 // 7450
@SP // 7451
AM=M+1 // 7452
A=A-1 // 7453
M=0 // 7454
@30 // 7455
D=A // 7456
@SP // 7457
AM=M+1 // 7458
A=A-1 // 7459
M=D // 7460
@51 // 7461
D=A // 7462
@SP // 7463
AM=M+1 // 7464
A=A-1 // 7465
M=D // 7466
@51 // 7467
D=A // 7468
@SP // 7469
AM=M+1 // 7470
A=A-1 // 7471
M=D // 7472
@51 // 7473
D=A // 7474
@SP // 7475
AM=M+1 // 7476
A=A-1 // 7477
M=D // 7478
@31 // 7479
D=A // 7480
@SP // 7481
AM=M+1 // 7482
A=A-1 // 7483
M=D // 7484
@3 // 7485
D=A // 7486
@SP // 7487
AM=M+1 // 7488
A=A-1 // 7489
M=D // 7490
@3 // 7491
D=A // 7492
@SP // 7493
AM=M+1 // 7494
A=A-1 // 7495
M=D // 7496
@SP // 7497
AM=M+1 // 7498
A=A-1 // 7499
M=0 // 7500
// call Output.create
@17 // 7501
D=A // 7502
@14 // 7503
M=D // 7504
@Output.create // 7505
D=A // 7506
@13 // 7507
M=D // 7508
@Output.initMap.ret.14 // 7509
D=A // 7510
@CALL // 7511
0;JMP // 7512
(Output.initMap.ret.14)
@111 // 7513
D=A // 7514
@SP // 7515
AM=M+1 // 7516
A=A-1 // 7517
M=D // 7518
@SP // 7519
AM=M+1 // 7520
A=A-1 // 7521
M=0 // 7522
@SP // 7523
AM=M+1 // 7524
A=A-1 // 7525
M=0 // 7526
@SP // 7527
AM=M+1 // 7528
A=A-1 // 7529
M=0 // 7530
@30 // 7531
D=A // 7532
@SP // 7533
AM=M+1 // 7534
A=A-1 // 7535
M=D // 7536
@51 // 7537
D=A // 7538
@SP // 7539
AM=M+1 // 7540
A=A-1 // 7541
M=D // 7542
@51 // 7543
D=A // 7544
@SP // 7545
AM=M+1 // 7546
A=A-1 // 7547
M=D // 7548
@51 // 7549
D=A // 7550
@SP // 7551
AM=M+1 // 7552
A=A-1 // 7553
M=D // 7554
@51 // 7555
D=A // 7556
@SP // 7557
AM=M+1 // 7558
A=A-1 // 7559
M=D // 7560
@30 // 7561
D=A // 7562
@SP // 7563
AM=M+1 // 7564
A=A-1 // 7565
M=D // 7566
@SP // 7567
AM=M+1 // 7568
A=A-1 // 7569
M=0 // 7570
@SP // 7571
AM=M+1 // 7572
A=A-1 // 7573
M=0 // 7574
// call Output.create
@17 // 7575
D=A // 7576
@14 // 7577
M=D // 7578
@Output.create // 7579
D=A // 7580
@13 // 7581
M=D // 7582
@Output.initMap.ret.15 // 7583
D=A // 7584
@CALL // 7585
0;JMP // 7586
(Output.initMap.ret.15)
@110 // 7587
D=A // 7588
@SP // 7589
AM=M+1 // 7590
A=A-1 // 7591
M=D // 7592
@SP // 7593
AM=M+1 // 7594
A=A-1 // 7595
M=0 // 7596
@SP // 7597
AM=M+1 // 7598
A=A-1 // 7599
M=0 // 7600
@SP // 7601
AM=M+1 // 7602
A=A-1 // 7603
M=0 // 7604
@29 // 7605
D=A // 7606
@SP // 7607
AM=M+1 // 7608
A=A-1 // 7609
M=D // 7610
@51 // 7611
D=A // 7612
@SP // 7613
AM=M+1 // 7614
A=A-1 // 7615
M=D // 7616
@51 // 7617
D=A // 7618
@SP // 7619
AM=M+1 // 7620
A=A-1 // 7621
M=D // 7622
@51 // 7623
D=A // 7624
@SP // 7625
AM=M+1 // 7626
A=A-1 // 7627
M=D // 7628
@51 // 7629
D=A // 7630
@SP // 7631
AM=M+1 // 7632
A=A-1 // 7633
M=D // 7634
@51 // 7635
D=A // 7636
@SP // 7637
AM=M+1 // 7638
A=A-1 // 7639
M=D // 7640
@SP // 7641
AM=M+1 // 7642
A=A-1 // 7643
M=0 // 7644
@SP // 7645
AM=M+1 // 7646
A=A-1 // 7647
M=0 // 7648
// call Output.create
@17 // 7649
D=A // 7650
@14 // 7651
M=D // 7652
@Output.create // 7653
D=A // 7654
@13 // 7655
M=D // 7656
@Output.initMap.ret.16 // 7657
D=A // 7658
@CALL // 7659
0;JMP // 7660
(Output.initMap.ret.16)
@109 // 7661
D=A // 7662
@SP // 7663
AM=M+1 // 7664
A=A-1 // 7665
M=D // 7666
@SP // 7667
AM=M+1 // 7668
A=A-1 // 7669
M=0 // 7670
@SP // 7671
AM=M+1 // 7672
A=A-1 // 7673
M=0 // 7674
@SP // 7675
AM=M+1 // 7676
A=A-1 // 7677
M=0 // 7678
@29 // 7679
D=A // 7680
@SP // 7681
AM=M+1 // 7682
A=A-1 // 7683
M=D // 7684
@63 // 7685
D=A // 7686
@SP // 7687
AM=M+1 // 7688
A=A-1 // 7689
M=D // 7690
@43 // 7691
D=A // 7692
@SP // 7693
AM=M+1 // 7694
A=A-1 // 7695
M=D // 7696
@43 // 7697
D=A // 7698
@SP // 7699
AM=M+1 // 7700
A=A-1 // 7701
M=D // 7702
@43 // 7703
D=A // 7704
@SP // 7705
AM=M+1 // 7706
A=A-1 // 7707
M=D // 7708
@43 // 7709
D=A // 7710
@SP // 7711
AM=M+1 // 7712
A=A-1 // 7713
M=D // 7714
@SP // 7715
AM=M+1 // 7716
A=A-1 // 7717
M=0 // 7718
@SP // 7719
AM=M+1 // 7720
A=A-1 // 7721
M=0 // 7722
// call Output.create
@17 // 7723
D=A // 7724
@14 // 7725
M=D // 7726
@Output.create // 7727
D=A // 7728
@13 // 7729
M=D // 7730
@Output.initMap.ret.17 // 7731
D=A // 7732
@CALL // 7733
0;JMP // 7734
(Output.initMap.ret.17)
@108 // 7735
D=A // 7736
@SP // 7737
AM=M+1 // 7738
A=A-1 // 7739
M=D // 7740
@14 // 7741
D=A // 7742
@SP // 7743
AM=M+1 // 7744
A=A-1 // 7745
M=D // 7746
@12 // 7747
D=A // 7748
@SP // 7749
AM=M+1 // 7750
A=A-1 // 7751
M=D // 7752
@12 // 7753
D=A // 7754
@SP // 7755
AM=M+1 // 7756
A=A-1 // 7757
M=D // 7758
@12 // 7759
D=A // 7760
@SP // 7761
AM=M+1 // 7762
A=A-1 // 7763
M=D // 7764
@12 // 7765
D=A // 7766
@SP // 7767
AM=M+1 // 7768
A=A-1 // 7769
M=D // 7770
@12 // 7771
D=A // 7772
@SP // 7773
AM=M+1 // 7774
A=A-1 // 7775
M=D // 7776
@12 // 7777
D=A // 7778
@SP // 7779
AM=M+1 // 7780
A=A-1 // 7781
M=D // 7782
@12 // 7783
D=A // 7784
@SP // 7785
AM=M+1 // 7786
A=A-1 // 7787
M=D // 7788
@30 // 7789
D=A // 7790
@SP // 7791
AM=M+1 // 7792
A=A-1 // 7793
M=D // 7794
@SP // 7795
AM=M+1 // 7796
A=A-1 // 7797
M=0 // 7798
@SP // 7799
AM=M+1 // 7800
A=A-1 // 7801
M=0 // 7802
// call Output.create
@17 // 7803
D=A // 7804
@14 // 7805
M=D // 7806
@Output.create // 7807
D=A // 7808
@13 // 7809
M=D // 7810
@Output.initMap.ret.18 // 7811
D=A // 7812
@CALL // 7813
0;JMP // 7814
(Output.initMap.ret.18)
@107 // 7815
D=A // 7816
@SP // 7817
AM=M+1 // 7818
A=A-1 // 7819
M=D // 7820
@3 // 7821
D=A // 7822
@SP // 7823
AM=M+1 // 7824
A=A-1 // 7825
M=D // 7826
@3 // 7827
D=A // 7828
@SP // 7829
AM=M+1 // 7830
A=A-1 // 7831
M=D // 7832
@3 // 7833
D=A // 7834
@SP // 7835
AM=M+1 // 7836
A=A-1 // 7837
M=D // 7838
@51 // 7839
D=A // 7840
@SP // 7841
AM=M+1 // 7842
A=A-1 // 7843
M=D // 7844
@27 // 7845
D=A // 7846
@SP // 7847
AM=M+1 // 7848
A=A-1 // 7849
M=D // 7850
@15 // 7851
D=A // 7852
@SP // 7853
AM=M+1 // 7854
A=A-1 // 7855
M=D // 7856
@15 // 7857
D=A // 7858
@SP // 7859
AM=M+1 // 7860
A=A-1 // 7861
M=D // 7862
@27 // 7863
D=A // 7864
@SP // 7865
AM=M+1 // 7866
A=A-1 // 7867
M=D // 7868
@51 // 7869
D=A // 7870
@SP // 7871
AM=M+1 // 7872
A=A-1 // 7873
M=D // 7874
@SP // 7875
AM=M+1 // 7876
A=A-1 // 7877
M=0 // 7878
@SP // 7879
AM=M+1 // 7880
A=A-1 // 7881
M=0 // 7882
// call Output.create
@17 // 7883
D=A // 7884
@14 // 7885
M=D // 7886
@Output.create // 7887
D=A // 7888
@13 // 7889
M=D // 7890
@Output.initMap.ret.19 // 7891
D=A // 7892
@CALL // 7893
0;JMP // 7894
(Output.initMap.ret.19)
@106 // 7895
D=A // 7896
@SP // 7897
AM=M+1 // 7898
A=A-1 // 7899
M=D // 7900
@48 // 7901
D=A // 7902
@SP // 7903
AM=M+1 // 7904
A=A-1 // 7905
M=D // 7906
@48 // 7907
D=A // 7908
@SP // 7909
AM=M+1 // 7910
A=A-1 // 7911
M=D // 7912
@SP // 7913
AM=M+1 // 7914
A=A-1 // 7915
M=0 // 7916
@56 // 7917
D=A // 7918
@SP // 7919
AM=M+1 // 7920
A=A-1 // 7921
M=D // 7922
@48 // 7923
D=A // 7924
@SP // 7925
AM=M+1 // 7926
A=A-1 // 7927
M=D // 7928
@48 // 7929
D=A // 7930
@SP // 7931
AM=M+1 // 7932
A=A-1 // 7933
M=D // 7934
@48 // 7935
D=A // 7936
@SP // 7937
AM=M+1 // 7938
A=A-1 // 7939
M=D // 7940
@48 // 7941
D=A // 7942
@SP // 7943
AM=M+1 // 7944
A=A-1 // 7945
M=D // 7946
@51 // 7947
D=A // 7948
@SP // 7949
AM=M+1 // 7950
A=A-1 // 7951
M=D // 7952
@30 // 7953
D=A // 7954
@SP // 7955
AM=M+1 // 7956
A=A-1 // 7957
M=D // 7958
@SP // 7959
AM=M+1 // 7960
A=A-1 // 7961
M=0 // 7962
// call Output.create
@17 // 7963
D=A // 7964
@14 // 7965
M=D // 7966
@Output.create // 7967
D=A // 7968
@13 // 7969
M=D // 7970
@Output.initMap.ret.20 // 7971
D=A // 7972
@CALL // 7973
0;JMP // 7974
(Output.initMap.ret.20)
@105 // 7975
D=A // 7976
@SP // 7977
AM=M+1 // 7978
A=A-1 // 7979
M=D // 7980
@12 // 7981
D=A // 7982
@SP // 7983
AM=M+1 // 7984
A=A-1 // 7985
M=D // 7986
@12 // 7987
D=A // 7988
@SP // 7989
AM=M+1 // 7990
A=A-1 // 7991
M=D // 7992
@SP // 7993
AM=M+1 // 7994
A=A-1 // 7995
M=0 // 7996
@14 // 7997
D=A // 7998
@SP // 7999
AM=M+1 // 8000
A=A-1 // 8001
M=D // 8002
@12 // 8003
D=A // 8004
@SP // 8005
AM=M+1 // 8006
A=A-1 // 8007
M=D // 8008
@12 // 8009
D=A // 8010
@SP // 8011
AM=M+1 // 8012
A=A-1 // 8013
M=D // 8014
@12 // 8015
D=A // 8016
@SP // 8017
AM=M+1 // 8018
A=A-1 // 8019
M=D // 8020
@12 // 8021
D=A // 8022
@SP // 8023
AM=M+1 // 8024
A=A-1 // 8025
M=D // 8026
@30 // 8027
D=A // 8028
@SP // 8029
AM=M+1 // 8030
A=A-1 // 8031
M=D // 8032
@SP // 8033
AM=M+1 // 8034
A=A-1 // 8035
M=0 // 8036
@SP // 8037
AM=M+1 // 8038
A=A-1 // 8039
M=0 // 8040
// call Output.create
@17 // 8041
D=A // 8042
@14 // 8043
M=D // 8044
@Output.create // 8045
D=A // 8046
@13 // 8047
M=D // 8048
@Output.initMap.ret.21 // 8049
D=A // 8050
@CALL // 8051
0;JMP // 8052
(Output.initMap.ret.21)
@104 // 8053
D=A // 8054
@SP // 8055
AM=M+1 // 8056
A=A-1 // 8057
M=D // 8058
@3 // 8059
D=A // 8060
@SP // 8061
AM=M+1 // 8062
A=A-1 // 8063
M=D // 8064
@3 // 8065
D=A // 8066
@SP // 8067
AM=M+1 // 8068
A=A-1 // 8069
M=D // 8070
@3 // 8071
D=A // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=D // 8076
@27 // 8077
D=A // 8078
@SP // 8079
AM=M+1 // 8080
A=A-1 // 8081
M=D // 8082
@55 // 8083
D=A // 8084
@SP // 8085
AM=M+1 // 8086
A=A-1 // 8087
M=D // 8088
@51 // 8089
D=A // 8090
@SP // 8091
AM=M+1 // 8092
A=A-1 // 8093
M=D // 8094
@51 // 8095
D=A // 8096
@SP // 8097
AM=M+1 // 8098
A=A-1 // 8099
M=D // 8100
@51 // 8101
D=A // 8102
@SP // 8103
AM=M+1 // 8104
A=A-1 // 8105
M=D // 8106
@51 // 8107
D=A // 8108
@SP // 8109
AM=M+1 // 8110
A=A-1 // 8111
M=D // 8112
@SP // 8113
AM=M+1 // 8114
A=A-1 // 8115
M=0 // 8116
@SP // 8117
AM=M+1 // 8118
A=A-1 // 8119
M=0 // 8120
// call Output.create
@17 // 8121
D=A // 8122
@14 // 8123
M=D // 8124
@Output.create // 8125
D=A // 8126
@13 // 8127
M=D // 8128
@Output.initMap.ret.22 // 8129
D=A // 8130
@CALL // 8131
0;JMP // 8132
(Output.initMap.ret.22)
@103 // 8133
D=A // 8134
@SP // 8135
AM=M+1 // 8136
A=A-1 // 8137
M=D // 8138
@SP // 8139
AM=M+1 // 8140
A=A-1 // 8141
M=0 // 8142
@SP // 8143
AM=M+1 // 8144
A=A-1 // 8145
M=0 // 8146
@30 // 8147
D=A // 8148
@SP // 8149
AM=M+1 // 8150
A=A-1 // 8151
M=D // 8152
@51 // 8153
D=A // 8154
@SP // 8155
AM=M+1 // 8156
A=A-1 // 8157
M=D // 8158
@51 // 8159
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
@62 // 8171
D=A // 8172
@SP // 8173
AM=M+1 // 8174
A=A-1 // 8175
M=D // 8176
@48 // 8177
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
@30 // 8189
D=A // 8190
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=D // 8194
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=0 // 8198
// call Output.create
@17 // 8199
D=A // 8200
@14 // 8201
M=D // 8202
@Output.create // 8203
D=A // 8204
@13 // 8205
M=D // 8206
@Output.initMap.ret.23 // 8207
D=A // 8208
@CALL // 8209
0;JMP // 8210
(Output.initMap.ret.23)
@102 // 8211
D=A // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=D // 8216
@28 // 8217
D=A // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=D // 8222
@54 // 8223
D=A // 8224
@SP // 8225
AM=M+1 // 8226
A=A-1 // 8227
M=D // 8228
@38 // 8229
D=A // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=D // 8234
@6 // 8235
D=A // 8236
@SP // 8237
AM=M+1 // 8238
A=A-1 // 8239
M=D // 8240
@15 // 8241
D=A // 8242
@SP // 8243
AM=M+1 // 8244
A=A-1 // 8245
M=D // 8246
@6 // 8247
D=A // 8248
@SP // 8249
AM=M+1 // 8250
A=A-1 // 8251
M=D // 8252
@6 // 8253
D=A // 8254
@SP // 8255
AM=M+1 // 8256
A=A-1 // 8257
M=D // 8258
@6 // 8259
D=A // 8260
@SP // 8261
AM=M+1 // 8262
A=A-1 // 8263
M=D // 8264
@15 // 8265
D=A // 8266
@SP // 8267
AM=M+1 // 8268
A=A-1 // 8269
M=D // 8270
@SP // 8271
AM=M+1 // 8272
A=A-1 // 8273
M=0 // 8274
@SP // 8275
AM=M+1 // 8276
A=A-1 // 8277
M=0 // 8278
// call Output.create
@17 // 8279
D=A // 8280
@14 // 8281
M=D // 8282
@Output.create // 8283
D=A // 8284
@13 // 8285
M=D // 8286
@Output.initMap.ret.24 // 8287
D=A // 8288
@CALL // 8289
0;JMP // 8290
(Output.initMap.ret.24)
@101 // 8291
D=A // 8292
@SP // 8293
AM=M+1 // 8294
A=A-1 // 8295
M=D // 8296
@SP // 8297
AM=M+1 // 8298
A=A-1 // 8299
M=0 // 8300
@SP // 8301
AM=M+1 // 8302
A=A-1 // 8303
M=0 // 8304
@SP // 8305
AM=M+1 // 8306
A=A-1 // 8307
M=0 // 8308
@30 // 8309
D=A // 8310
@SP // 8311
AM=M+1 // 8312
A=A-1 // 8313
M=D // 8314
@51 // 8315
D=A // 8316
@SP // 8317
AM=M+1 // 8318
A=A-1 // 8319
M=D // 8320
@63 // 8321
D=A // 8322
@SP // 8323
AM=M+1 // 8324
A=A-1 // 8325
M=D // 8326
@3 // 8327
D=A // 8328
@SP // 8329
AM=M+1 // 8330
A=A-1 // 8331
M=D // 8332
@51 // 8333
D=A // 8334
@SP // 8335
AM=M+1 // 8336
A=A-1 // 8337
M=D // 8338
@30 // 8339
D=A // 8340
@SP // 8341
AM=M+1 // 8342
A=A-1 // 8343
M=D // 8344
@SP // 8345
AM=M+1 // 8346
A=A-1 // 8347
M=0 // 8348
@SP // 8349
AM=M+1 // 8350
A=A-1 // 8351
M=0 // 8352
// call Output.create
@17 // 8353
D=A // 8354
@14 // 8355
M=D // 8356
@Output.create // 8357
D=A // 8358
@13 // 8359
M=D // 8360
@Output.initMap.ret.25 // 8361
D=A // 8362
@CALL // 8363
0;JMP // 8364
(Output.initMap.ret.25)
@100 // 8365
D=A // 8366
@SP // 8367
AM=M+1 // 8368
A=A-1 // 8369
M=D // 8370
@48 // 8371
D=A // 8372
@SP // 8373
AM=M+1 // 8374
A=A-1 // 8375
M=D // 8376
@48 // 8377
D=A // 8378
@SP // 8379
AM=M+1 // 8380
A=A-1 // 8381
M=D // 8382
@48 // 8383
D=A // 8384
@SP // 8385
AM=M+1 // 8386
A=A-1 // 8387
M=D // 8388
@60 // 8389
D=A // 8390
@SP // 8391
AM=M+1 // 8392
A=A-1 // 8393
M=D // 8394
@54 // 8395
D=A // 8396
@SP // 8397
AM=M+1 // 8398
A=A-1 // 8399
M=D // 8400
@51 // 8401
D=A // 8402
@SP // 8403
AM=M+1 // 8404
A=A-1 // 8405
M=D // 8406
@51 // 8407
D=A // 8408
@SP // 8409
AM=M+1 // 8410
A=A-1 // 8411
M=D // 8412
@51 // 8413
D=A // 8414
@SP // 8415
AM=M+1 // 8416
A=A-1 // 8417
M=D // 8418
@30 // 8419
D=A // 8420
@SP // 8421
AM=M+1 // 8422
A=A-1 // 8423
M=D // 8424
@SP // 8425
AM=M+1 // 8426
A=A-1 // 8427
M=0 // 8428
@SP // 8429
AM=M+1 // 8430
A=A-1 // 8431
M=0 // 8432
// call Output.create
@17 // 8433
D=A // 8434
@14 // 8435
M=D // 8436
@Output.create // 8437
D=A // 8438
@13 // 8439
M=D // 8440
@Output.initMap.ret.26 // 8441
D=A // 8442
@CALL // 8443
0;JMP // 8444
(Output.initMap.ret.26)
@99 // 8445
D=A // 8446
@SP // 8447
AM=M+1 // 8448
A=A-1 // 8449
M=D // 8450
@SP // 8451
AM=M+1 // 8452
A=A-1 // 8453
M=0 // 8454
@SP // 8455
AM=M+1 // 8456
A=A-1 // 8457
M=0 // 8458
@SP // 8459
AM=M+1 // 8460
A=A-1 // 8461
M=0 // 8462
@30 // 8463
D=A // 8464
@SP // 8465
AM=M+1 // 8466
A=A-1 // 8467
M=D // 8468
@51 // 8469
D=A // 8470
@SP // 8471
AM=M+1 // 8472
A=A-1 // 8473
M=D // 8474
@3 // 8475
D=A // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=D // 8480
@3 // 8481
D=A // 8482
@SP // 8483
AM=M+1 // 8484
A=A-1 // 8485
M=D // 8486
@51 // 8487
D=A // 8488
@SP // 8489
AM=M+1 // 8490
A=A-1 // 8491
M=D // 8492
@30 // 8493
D=A // 8494
@SP // 8495
AM=M+1 // 8496
A=A-1 // 8497
M=D // 8498
@SP // 8499
AM=M+1 // 8500
A=A-1 // 8501
M=0 // 8502
@SP // 8503
AM=M+1 // 8504
A=A-1 // 8505
M=0 // 8506
// call Output.create
@17 // 8507
D=A // 8508
@14 // 8509
M=D // 8510
@Output.create // 8511
D=A // 8512
@13 // 8513
M=D // 8514
@Output.initMap.ret.27 // 8515
D=A // 8516
@CALL // 8517
0;JMP // 8518
(Output.initMap.ret.27)
@98 // 8519
D=A // 8520
@SP // 8521
AM=M+1 // 8522
A=A-1 // 8523
M=D // 8524
@3 // 8525
D=A // 8526
@SP // 8527
AM=M+1 // 8528
A=A-1 // 8529
M=D // 8530
@3 // 8531
D=A // 8532
@SP // 8533
AM=M+1 // 8534
A=A-1 // 8535
M=D // 8536
@3 // 8537
D=A // 8538
@SP // 8539
AM=M+1 // 8540
A=A-1 // 8541
M=D // 8542
@15 // 8543
D=A // 8544
@SP // 8545
AM=M+1 // 8546
A=A-1 // 8547
M=D // 8548
@27 // 8549
D=A // 8550
@SP // 8551
AM=M+1 // 8552
A=A-1 // 8553
M=D // 8554
@51 // 8555
D=A // 8556
@SP // 8557
AM=M+1 // 8558
A=A-1 // 8559
M=D // 8560
@51 // 8561
D=A // 8562
@SP // 8563
AM=M+1 // 8564
A=A-1 // 8565
M=D // 8566
@51 // 8567
D=A // 8568
@SP // 8569
AM=M+1 // 8570
A=A-1 // 8571
M=D // 8572
@30 // 8573
D=A // 8574
@SP // 8575
AM=M+1 // 8576
A=A-1 // 8577
M=D // 8578
@SP // 8579
AM=M+1 // 8580
A=A-1 // 8581
M=0 // 8582
@SP // 8583
AM=M+1 // 8584
A=A-1 // 8585
M=0 // 8586
// call Output.create
@17 // 8587
D=A // 8588
@14 // 8589
M=D // 8590
@Output.create // 8591
D=A // 8592
@13 // 8593
M=D // 8594
@Output.initMap.ret.28 // 8595
D=A // 8596
@CALL // 8597
0;JMP // 8598
(Output.initMap.ret.28)
@97 // 8599
D=A // 8600
@SP // 8601
AM=M+1 // 8602
A=A-1 // 8603
M=D // 8604
@SP // 8605
AM=M+1 // 8606
A=A-1 // 8607
M=0 // 8608
@SP // 8609
AM=M+1 // 8610
A=A-1 // 8611
M=0 // 8612
@SP // 8613
AM=M+1 // 8614
A=A-1 // 8615
M=0 // 8616
@14 // 8617
D=A // 8618
@SP // 8619
AM=M+1 // 8620
A=A-1 // 8621
M=D // 8622
@24 // 8623
D=A // 8624
@SP // 8625
AM=M+1 // 8626
A=A-1 // 8627
M=D // 8628
@30 // 8629
D=A // 8630
@SP // 8631
AM=M+1 // 8632
A=A-1 // 8633
M=D // 8634
@27 // 8635
D=A // 8636
@SP // 8637
AM=M+1 // 8638
A=A-1 // 8639
M=D // 8640
@27 // 8641
D=A // 8642
@SP // 8643
AM=M+1 // 8644
A=A-1 // 8645
M=D // 8646
@54 // 8647
D=A // 8648
@SP // 8649
AM=M+1 // 8650
A=A-1 // 8651
M=D // 8652
@SP // 8653
AM=M+1 // 8654
A=A-1 // 8655
M=0 // 8656
@SP // 8657
AM=M+1 // 8658
A=A-1 // 8659
M=0 // 8660
// call Output.create
@17 // 8661
D=A // 8662
@14 // 8663
M=D // 8664
@Output.create // 8665
D=A // 8666
@13 // 8667
M=D // 8668
@Output.initMap.ret.29 // 8669
D=A // 8670
@CALL // 8671
0;JMP // 8672
(Output.initMap.ret.29)
@96 // 8673
D=A // 8674
@SP // 8675
AM=M+1 // 8676
A=A-1 // 8677
M=D // 8678
@6 // 8679
D=A // 8680
@SP // 8681
AM=M+1 // 8682
A=A-1 // 8683
M=D // 8684
@12 // 8685
D=A // 8686
@SP // 8687
AM=M+1 // 8688
A=A-1 // 8689
M=D // 8690
@24 // 8691
D=A // 8692
@SP // 8693
AM=M+1 // 8694
A=A-1 // 8695
M=D // 8696
@SP // 8697
AM=M+1 // 8698
A=A-1 // 8699
M=0 // 8700
@SP // 8701
AM=M+1 // 8702
A=A-1 // 8703
M=0 // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=0 // 8708
@SP // 8709
AM=M+1 // 8710
A=A-1 // 8711
M=0 // 8712
@SP // 8713
AM=M+1 // 8714
A=A-1 // 8715
M=0 // 8716
@SP // 8717
AM=M+1 // 8718
A=A-1 // 8719
M=0 // 8720
@SP // 8721
AM=M+1 // 8722
A=A-1 // 8723
M=0 // 8724
@SP // 8725
AM=M+1 // 8726
A=A-1 // 8727
M=0 // 8728
// call Output.create
@17 // 8729
D=A // 8730
@14 // 8731
M=D // 8732
@Output.create // 8733
D=A // 8734
@13 // 8735
M=D // 8736
@Output.initMap.ret.30 // 8737
D=A // 8738
@CALL // 8739
0;JMP // 8740
(Output.initMap.ret.30)
@95 // 8741
D=A // 8742
@SP // 8743
AM=M+1 // 8744
A=A-1 // 8745
M=D // 8746
@SP // 8747
AM=M+1 // 8748
A=A-1 // 8749
M=0 // 8750
@SP // 8751
AM=M+1 // 8752
A=A-1 // 8753
M=0 // 8754
@SP // 8755
AM=M+1 // 8756
A=A-1 // 8757
M=0 // 8758
@SP // 8759
AM=M+1 // 8760
A=A-1 // 8761
M=0 // 8762
@SP // 8763
AM=M+1 // 8764
A=A-1 // 8765
M=0 // 8766
@SP // 8767
AM=M+1 // 8768
A=A-1 // 8769
M=0 // 8770
@SP // 8771
AM=M+1 // 8772
A=A-1 // 8773
M=0 // 8774
@SP // 8775
AM=M+1 // 8776
A=A-1 // 8777
M=0 // 8778
@SP // 8779
AM=M+1 // 8780
A=A-1 // 8781
M=0 // 8782
@63 // 8783
D=A // 8784
@SP // 8785
AM=M+1 // 8786
A=A-1 // 8787
M=D // 8788
@SP // 8789
AM=M+1 // 8790
A=A-1 // 8791
M=0 // 8792
// call Output.create
@17 // 8793
D=A // 8794
@14 // 8795
M=D // 8796
@Output.create // 8797
D=A // 8798
@13 // 8799
M=D // 8800
@Output.initMap.ret.31 // 8801
D=A // 8802
@CALL // 8803
0;JMP // 8804
(Output.initMap.ret.31)
@94 // 8805
D=A // 8806
@SP // 8807
AM=M+1 // 8808
A=A-1 // 8809
M=D // 8810
@8 // 8811
D=A // 8812
@SP // 8813
AM=M+1 // 8814
A=A-1 // 8815
M=D // 8816
@28 // 8817
D=A // 8818
@SP // 8819
AM=M+1 // 8820
A=A-1 // 8821
M=D // 8822
@54 // 8823
D=A // 8824
@SP // 8825
AM=M+1 // 8826
A=A-1 // 8827
M=D // 8828
@SP // 8829
AM=M+1 // 8830
A=A-1 // 8831
M=0 // 8832
@SP // 8833
AM=M+1 // 8834
A=A-1 // 8835
M=0 // 8836
@SP // 8837
AM=M+1 // 8838
A=A-1 // 8839
M=0 // 8840
@SP // 8841
AM=M+1 // 8842
A=A-1 // 8843
M=0 // 8844
@SP // 8845
AM=M+1 // 8846
A=A-1 // 8847
M=0 // 8848
@SP // 8849
AM=M+1 // 8850
A=A-1 // 8851
M=0 // 8852
@SP // 8853
AM=M+1 // 8854
A=A-1 // 8855
M=0 // 8856
@SP // 8857
AM=M+1 // 8858
A=A-1 // 8859
M=0 // 8860
// call Output.create
@17 // 8861
D=A // 8862
@14 // 8863
M=D // 8864
@Output.create // 8865
D=A // 8866
@13 // 8867
M=D // 8868
@Output.initMap.ret.32 // 8869
D=A // 8870
@CALL // 8871
0;JMP // 8872
(Output.initMap.ret.32)
@93 // 8873
D=A // 8874
@SP // 8875
AM=M+1 // 8876
A=A-1 // 8877
M=D // 8878
@30 // 8879
D=A // 8880
@SP // 8881
AM=M+1 // 8882
A=A-1 // 8883
M=D // 8884
@24 // 8885
D=A // 8886
@SP // 8887
AM=M+1 // 8888
A=A-1 // 8889
M=D // 8890
@24 // 8891
D=A // 8892
@SP // 8893
AM=M+1 // 8894
A=A-1 // 8895
M=D // 8896
@24 // 8897
D=A // 8898
@SP // 8899
AM=M+1 // 8900
A=A-1 // 8901
M=D // 8902
@24 // 8903
D=A // 8904
@SP // 8905
AM=M+1 // 8906
A=A-1 // 8907
M=D // 8908
@24 // 8909
D=A // 8910
@SP // 8911
AM=M+1 // 8912
A=A-1 // 8913
M=D // 8914
@24 // 8915
D=A // 8916
@SP // 8917
AM=M+1 // 8918
A=A-1 // 8919
M=D // 8920
@24 // 8921
D=A // 8922
@SP // 8923
AM=M+1 // 8924
A=A-1 // 8925
M=D // 8926
@30 // 8927
D=A // 8928
@SP // 8929
AM=M+1 // 8930
A=A-1 // 8931
M=D // 8932
@SP // 8933
AM=M+1 // 8934
A=A-1 // 8935
M=0 // 8936
@SP // 8937
AM=M+1 // 8938
A=A-1 // 8939
M=0 // 8940
// call Output.create
@17 // 8941
D=A // 8942
@14 // 8943
M=D // 8944
@Output.create // 8945
D=A // 8946
@13 // 8947
M=D // 8948
@Output.initMap.ret.33 // 8949
D=A // 8950
@CALL // 8951
0;JMP // 8952
(Output.initMap.ret.33)
@92 // 8953
D=A // 8954
@SP // 8955
AM=M+1 // 8956
A=A-1 // 8957
M=D // 8958
@SP // 8959
AM=M+1 // 8960
A=A-1 // 8961
M=0 // 8962
@SP // 8963
AM=M+1 // 8964
A=A-1 // 8965
M=0 // 8966
@SP // 8967
AM=M+1 // 8968
A=A-1 // 8969
M=1 // 8970
@3 // 8971
D=A // 8972
@SP // 8973
AM=M+1 // 8974
A=A-1 // 8975
M=D // 8976
@6 // 8977
D=A // 8978
@SP // 8979
AM=M+1 // 8980
A=A-1 // 8981
M=D // 8982
@12 // 8983
D=A // 8984
@SP // 8985
AM=M+1 // 8986
A=A-1 // 8987
M=D // 8988
@24 // 8989
D=A // 8990
@SP // 8991
AM=M+1 // 8992
A=A-1 // 8993
M=D // 8994
@48 // 8995
D=A // 8996
@SP // 8997
AM=M+1 // 8998
A=A-1 // 8999
M=D // 9000
@32 // 9001
D=A // 9002
@SP // 9003
AM=M+1 // 9004
A=A-1 // 9005
M=D // 9006
@SP // 9007
AM=M+1 // 9008
A=A-1 // 9009
M=0 // 9010
@SP // 9011
AM=M+1 // 9012
A=A-1 // 9013
M=0 // 9014
// call Output.create
@17 // 9015
D=A // 9016
@14 // 9017
M=D // 9018
@Output.create // 9019
D=A // 9020
@13 // 9021
M=D // 9022
@Output.initMap.ret.34 // 9023
D=A // 9024
@CALL // 9025
0;JMP // 9026
(Output.initMap.ret.34)
@91 // 9027
D=A // 9028
@SP // 9029
AM=M+1 // 9030
A=A-1 // 9031
M=D // 9032
@30 // 9033
D=A // 9034
@SP // 9035
AM=M+1 // 9036
A=A-1 // 9037
M=D // 9038
@6 // 9039
D=A // 9040
@SP // 9041
AM=M+1 // 9042
A=A-1 // 9043
M=D // 9044
@6 // 9045
D=A // 9046
@SP // 9047
AM=M+1 // 9048
A=A-1 // 9049
M=D // 9050
@6 // 9051
D=A // 9052
@SP // 9053
AM=M+1 // 9054
A=A-1 // 9055
M=D // 9056
@6 // 9057
D=A // 9058
@SP // 9059
AM=M+1 // 9060
A=A-1 // 9061
M=D // 9062
@6 // 9063
D=A // 9064
@SP // 9065
AM=M+1 // 9066
A=A-1 // 9067
M=D // 9068
@6 // 9069
D=A // 9070
@SP // 9071
AM=M+1 // 9072
A=A-1 // 9073
M=D // 9074
@6 // 9075
D=A // 9076
@SP // 9077
AM=M+1 // 9078
A=A-1 // 9079
M=D // 9080
@30 // 9081
D=A // 9082
@SP // 9083
AM=M+1 // 9084
A=A-1 // 9085
M=D // 9086
@SP // 9087
AM=M+1 // 9088
A=A-1 // 9089
M=0 // 9090
@SP // 9091
AM=M+1 // 9092
A=A-1 // 9093
M=0 // 9094
// call Output.create
@17 // 9095
D=A // 9096
@14 // 9097
M=D // 9098
@Output.create // 9099
D=A // 9100
@13 // 9101
M=D // 9102
@Output.initMap.ret.35 // 9103
D=A // 9104
@CALL // 9105
0;JMP // 9106
(Output.initMap.ret.35)
@90 // 9107
D=A // 9108
@SP // 9109
AM=M+1 // 9110
A=A-1 // 9111
M=D // 9112
@63 // 9113
D=A // 9114
@SP // 9115
AM=M+1 // 9116
A=A-1 // 9117
M=D // 9118
@51 // 9119
D=A // 9120
@SP // 9121
AM=M+1 // 9122
A=A-1 // 9123
M=D // 9124
@49 // 9125
D=A // 9126
@SP // 9127
AM=M+1 // 9128
A=A-1 // 9129
M=D // 9130
@24 // 9131
D=A // 9132
@SP // 9133
AM=M+1 // 9134
A=A-1 // 9135
M=D // 9136
@12 // 9137
D=A // 9138
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=D // 9142
@6 // 9143
D=A // 9144
@SP // 9145
AM=M+1 // 9146
A=A-1 // 9147
M=D // 9148
@35 // 9149
D=A // 9150
@SP // 9151
AM=M+1 // 9152
A=A-1 // 9153
M=D // 9154
@51 // 9155
D=A // 9156
@SP // 9157
AM=M+1 // 9158
A=A-1 // 9159
M=D // 9160
@63 // 9161
D=A // 9162
@SP // 9163
AM=M+1 // 9164
A=A-1 // 9165
M=D // 9166
@SP // 9167
AM=M+1 // 9168
A=A-1 // 9169
M=0 // 9170
@SP // 9171
AM=M+1 // 9172
A=A-1 // 9173
M=0 // 9174
// call Output.create
@17 // 9175
D=A // 9176
@14 // 9177
M=D // 9178
@Output.create // 9179
D=A // 9180
@13 // 9181
M=D // 9182
@Output.initMap.ret.36 // 9183
D=A // 9184
@CALL // 9185
0;JMP // 9186
(Output.initMap.ret.36)
@89 // 9187
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
@51 // 9205
D=A // 9206
@SP // 9207
AM=M+1 // 9208
A=A-1 // 9209
M=D // 9210
@51 // 9211
D=A // 9212
@SP // 9213
AM=M+1 // 9214
A=A-1 // 9215
M=D // 9216
@30 // 9217
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
@12 // 9229
D=A // 9230
@SP // 9231
AM=M+1 // 9232
A=A-1 // 9233
M=D // 9234
@12 // 9235
D=A // 9236
@SP // 9237
AM=M+1 // 9238
A=A-1 // 9239
M=D // 9240
@30 // 9241
D=A // 9242
@SP // 9243
AM=M+1 // 9244
A=A-1 // 9245
M=D // 9246
@SP // 9247
AM=M+1 // 9248
A=A-1 // 9249
M=0 // 9250
@SP // 9251
AM=M+1 // 9252
A=A-1 // 9253
M=0 // 9254
// call Output.create
@17 // 9255
D=A // 9256
@14 // 9257
M=D // 9258
@Output.create // 9259
D=A // 9260
@13 // 9261
M=D // 9262
@Output.initMap.ret.37 // 9263
D=A // 9264
@CALL // 9265
0;JMP // 9266
(Output.initMap.ret.37)
@88 // 9267
D=A // 9268
@SP // 9269
AM=M+1 // 9270
A=A-1 // 9271
M=D // 9272
@51 // 9273
D=A // 9274
@SP // 9275
AM=M+1 // 9276
A=A-1 // 9277
M=D // 9278
@51 // 9279
D=A // 9280
@SP // 9281
AM=M+1 // 9282
A=A-1 // 9283
M=D // 9284
@30 // 9285
D=A // 9286
@SP // 9287
AM=M+1 // 9288
A=A-1 // 9289
M=D // 9290
@30 // 9291
D=A // 9292
@SP // 9293
AM=M+1 // 9294
A=A-1 // 9295
M=D // 9296
@12 // 9297
D=A // 9298
@SP // 9299
AM=M+1 // 9300
A=A-1 // 9301
M=D // 9302
@30 // 9303
D=A // 9304
@SP // 9305
AM=M+1 // 9306
A=A-1 // 9307
M=D // 9308
@30 // 9309
D=A // 9310
@SP // 9311
AM=M+1 // 9312
A=A-1 // 9313
M=D // 9314
@51 // 9315
D=A // 9316
@SP // 9317
AM=M+1 // 9318
A=A-1 // 9319
M=D // 9320
@51 // 9321
D=A // 9322
@SP // 9323
AM=M+1 // 9324
A=A-1 // 9325
M=D // 9326
@SP // 9327
AM=M+1 // 9328
A=A-1 // 9329
M=0 // 9330
@SP // 9331
AM=M+1 // 9332
A=A-1 // 9333
M=0 // 9334
// call Output.create
@17 // 9335
D=A // 9336
@14 // 9337
M=D // 9338
@Output.create // 9339
D=A // 9340
@13 // 9341
M=D // 9342
@Output.initMap.ret.38 // 9343
D=A // 9344
@CALL // 9345
0;JMP // 9346
(Output.initMap.ret.38)
@87 // 9347
D=A // 9348
@SP // 9349
AM=M+1 // 9350
A=A-1 // 9351
M=D // 9352
@51 // 9353
D=A // 9354
@SP // 9355
AM=M+1 // 9356
A=A-1 // 9357
M=D // 9358
@51 // 9359
D=A // 9360
@SP // 9361
AM=M+1 // 9362
A=A-1 // 9363
M=D // 9364
@51 // 9365
D=A // 9366
@SP // 9367
AM=M+1 // 9368
A=A-1 // 9369
M=D // 9370
@51 // 9371
D=A // 9372
@SP // 9373
AM=M+1 // 9374
A=A-1 // 9375
M=D // 9376
@51 // 9377
D=A // 9378
@SP // 9379
AM=M+1 // 9380
A=A-1 // 9381
M=D // 9382
@63 // 9383
D=A // 9384
@SP // 9385
AM=M+1 // 9386
A=A-1 // 9387
M=D // 9388
@63 // 9389
D=A // 9390
@SP // 9391
AM=M+1 // 9392
A=A-1 // 9393
M=D // 9394
@63 // 9395
D=A // 9396
@SP // 9397
AM=M+1 // 9398
A=A-1 // 9399
M=D // 9400
@18 // 9401
D=A // 9402
@SP // 9403
AM=M+1 // 9404
A=A-1 // 9405
M=D // 9406
@SP // 9407
AM=M+1 // 9408
A=A-1 // 9409
M=0 // 9410
@SP // 9411
AM=M+1 // 9412
A=A-1 // 9413
M=0 // 9414
// call Output.create
@17 // 9415
D=A // 9416
@14 // 9417
M=D // 9418
@Output.create // 9419
D=A // 9420
@13 // 9421
M=D // 9422
@Output.initMap.ret.39 // 9423
D=A // 9424
@CALL // 9425
0;JMP // 9426
(Output.initMap.ret.39)
@86 // 9427
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
@51 // 9451
D=A // 9452
@SP // 9453
AM=M+1 // 9454
A=A-1 // 9455
M=D // 9456
@51 // 9457
D=A // 9458
@SP // 9459
AM=M+1 // 9460
A=A-1 // 9461
M=D // 9462
@30 // 9463
D=A // 9464
@SP // 9465
AM=M+1 // 9466
A=A-1 // 9467
M=D // 9468
@30 // 9469
D=A // 9470
@SP // 9471
AM=M+1 // 9472
A=A-1 // 9473
M=D // 9474
@12 // 9475
D=A // 9476
@SP // 9477
AM=M+1 // 9478
A=A-1 // 9479
M=D // 9480
@12 // 9481
D=A // 9482
@SP // 9483
AM=M+1 // 9484
A=A-1 // 9485
M=D // 9486
@SP // 9487
AM=M+1 // 9488
A=A-1 // 9489
M=0 // 9490
@SP // 9491
AM=M+1 // 9492
A=A-1 // 9493
M=0 // 9494
// call Output.create
@17 // 9495
D=A // 9496
@14 // 9497
M=D // 9498
@Output.create // 9499
D=A // 9500
@13 // 9501
M=D // 9502
@Output.initMap.ret.40 // 9503
D=A // 9504
@CALL // 9505
0;JMP // 9506
(Output.initMap.ret.40)
@85 // 9507
D=A // 9508
@SP // 9509
AM=M+1 // 9510
A=A-1 // 9511
M=D // 9512
@51 // 9513
D=A // 9514
@SP // 9515
AM=M+1 // 9516
A=A-1 // 9517
M=D // 9518
@51 // 9519
D=A // 9520
@SP // 9521
AM=M+1 // 9522
A=A-1 // 9523
M=D // 9524
@51 // 9525
D=A // 9526
@SP // 9527
AM=M+1 // 9528
A=A-1 // 9529
M=D // 9530
@51 // 9531
D=A // 9532
@SP // 9533
AM=M+1 // 9534
A=A-1 // 9535
M=D // 9536
@51 // 9537
D=A // 9538
@SP // 9539
AM=M+1 // 9540
A=A-1 // 9541
M=D // 9542
@51 // 9543
D=A // 9544
@SP // 9545
AM=M+1 // 9546
A=A-1 // 9547
M=D // 9548
@51 // 9549
D=A // 9550
@SP // 9551
AM=M+1 // 9552
A=A-1 // 9553
M=D // 9554
@51 // 9555
D=A // 9556
@SP // 9557
AM=M+1 // 9558
A=A-1 // 9559
M=D // 9560
@30 // 9561
D=A // 9562
@SP // 9563
AM=M+1 // 9564
A=A-1 // 9565
M=D // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=0 // 9570
@SP // 9571
AM=M+1 // 9572
A=A-1 // 9573
M=0 // 9574
// call Output.create
@17 // 9575
D=A // 9576
@14 // 9577
M=D // 9578
@Output.create // 9579
D=A // 9580
@13 // 9581
M=D // 9582
@Output.initMap.ret.41 // 9583
D=A // 9584
@CALL // 9585
0;JMP // 9586
(Output.initMap.ret.41)
@84 // 9587
D=A // 9588
@SP // 9589
AM=M+1 // 9590
A=A-1 // 9591
M=D // 9592
@63 // 9593
D=A // 9594
@SP // 9595
AM=M+1 // 9596
A=A-1 // 9597
M=D // 9598
@63 // 9599
D=A // 9600
@SP // 9601
AM=M+1 // 9602
A=A-1 // 9603
M=D // 9604
@45 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610
@12 // 9611
D=A // 9612
@SP // 9613
AM=M+1 // 9614
A=A-1 // 9615
M=D // 9616
@12 // 9617
D=A // 9618
@SP // 9619
AM=M+1 // 9620
A=A-1 // 9621
M=D // 9622
@12 // 9623
D=A // 9624
@SP // 9625
AM=M+1 // 9626
A=A-1 // 9627
M=D // 9628
@12 // 9629
D=A // 9630
@SP // 9631
AM=M+1 // 9632
A=A-1 // 9633
M=D // 9634
@12 // 9635
D=A // 9636
@SP // 9637
AM=M+1 // 9638
A=A-1 // 9639
M=D // 9640
@30 // 9641
D=A // 9642
@SP // 9643
AM=M+1 // 9644
A=A-1 // 9645
M=D // 9646
@SP // 9647
AM=M+1 // 9648
A=A-1 // 9649
M=0 // 9650
@SP // 9651
AM=M+1 // 9652
A=A-1 // 9653
M=0 // 9654
// call Output.create
@17 // 9655
D=A // 9656
@14 // 9657
M=D // 9658
@Output.create // 9659
D=A // 9660
@13 // 9661
M=D // 9662
@Output.initMap.ret.42 // 9663
D=A // 9664
@CALL // 9665
0;JMP // 9666
(Output.initMap.ret.42)
@83 // 9667
D=A // 9668
@SP // 9669
AM=M+1 // 9670
A=A-1 // 9671
M=D // 9672
@30 // 9673
D=A // 9674
@SP // 9675
AM=M+1 // 9676
A=A-1 // 9677
M=D // 9678
@51 // 9679
D=A // 9680
@SP // 9681
AM=M+1 // 9682
A=A-1 // 9683
M=D // 9684
@51 // 9685
D=A // 9686
@SP // 9687
AM=M+1 // 9688
A=A-1 // 9689
M=D // 9690
@6 // 9691
D=A // 9692
@SP // 9693
AM=M+1 // 9694
A=A-1 // 9695
M=D // 9696
@28 // 9697
D=A // 9698
@SP // 9699
AM=M+1 // 9700
A=A-1 // 9701
M=D // 9702
@48 // 9703
D=A // 9704
@SP // 9705
AM=M+1 // 9706
A=A-1 // 9707
M=D // 9708
@51 // 9709
D=A // 9710
@SP // 9711
AM=M+1 // 9712
A=A-1 // 9713
M=D // 9714
@51 // 9715
D=A // 9716
@SP // 9717
AM=M+1 // 9718
A=A-1 // 9719
M=D // 9720
@30 // 9721
D=A // 9722
@SP // 9723
AM=M+1 // 9724
A=A-1 // 9725
M=D // 9726
@SP // 9727
AM=M+1 // 9728
A=A-1 // 9729
M=0 // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=0 // 9734
// call Output.create
@17 // 9735
D=A // 9736
@14 // 9737
M=D // 9738
@Output.create // 9739
D=A // 9740
@13 // 9741
M=D // 9742
@Output.initMap.ret.43 // 9743
D=A // 9744
@CALL // 9745
0;JMP // 9746
(Output.initMap.ret.43)
@82 // 9747
D=A // 9748
@SP // 9749
AM=M+1 // 9750
A=A-1 // 9751
M=D // 9752
@31 // 9753
D=A // 9754
@SP // 9755
AM=M+1 // 9756
A=A-1 // 9757
M=D // 9758
@51 // 9759
D=A // 9760
@SP // 9761
AM=M+1 // 9762
A=A-1 // 9763
M=D // 9764
@51 // 9765
D=A // 9766
@SP // 9767
AM=M+1 // 9768
A=A-1 // 9769
M=D // 9770
@51 // 9771
D=A // 9772
@SP // 9773
AM=M+1 // 9774
A=A-1 // 9775
M=D // 9776
@31 // 9777
D=A // 9778
@SP // 9779
AM=M+1 // 9780
A=A-1 // 9781
M=D // 9782
@27 // 9783
D=A // 9784
@SP // 9785
AM=M+1 // 9786
A=A-1 // 9787
M=D // 9788
@51 // 9789
D=A // 9790
@SP // 9791
AM=M+1 // 9792
A=A-1 // 9793
M=D // 9794
@51 // 9795
D=A // 9796
@SP // 9797
AM=M+1 // 9798
A=A-1 // 9799
M=D // 9800
@51 // 9801
D=A // 9802
@SP // 9803
AM=M+1 // 9804
A=A-1 // 9805
M=D // 9806
@SP // 9807
AM=M+1 // 9808
A=A-1 // 9809
M=0 // 9810
@SP // 9811
AM=M+1 // 9812
A=A-1 // 9813
M=0 // 9814
// call Output.create
@17 // 9815
D=A // 9816
@14 // 9817
M=D // 9818
@Output.create // 9819
D=A // 9820
@13 // 9821
M=D // 9822
@Output.initMap.ret.44 // 9823
D=A // 9824
@CALL // 9825
0;JMP // 9826
(Output.initMap.ret.44)
@81 // 9827
D=A // 9828
@SP // 9829
AM=M+1 // 9830
A=A-1 // 9831
M=D // 9832
@30 // 9833
D=A // 9834
@SP // 9835
AM=M+1 // 9836
A=A-1 // 9837
M=D // 9838
@51 // 9839
D=A // 9840
@SP // 9841
AM=M+1 // 9842
A=A-1 // 9843
M=D // 9844
@51 // 9845
D=A // 9846
@SP // 9847
AM=M+1 // 9848
A=A-1 // 9849
M=D // 9850
@51 // 9851
D=A // 9852
@SP // 9853
AM=M+1 // 9854
A=A-1 // 9855
M=D // 9856
@51 // 9857
D=A // 9858
@SP // 9859
AM=M+1 // 9860
A=A-1 // 9861
M=D // 9862
@51 // 9863
D=A // 9864
@SP // 9865
AM=M+1 // 9866
A=A-1 // 9867
M=D // 9868
@63 // 9869
D=A // 9870
@SP // 9871
AM=M+1 // 9872
A=A-1 // 9873
M=D // 9874
@59 // 9875
D=A // 9876
@SP // 9877
AM=M+1 // 9878
A=A-1 // 9879
M=D // 9880
@30 // 9881
D=A // 9882
@SP // 9883
AM=M+1 // 9884
A=A-1 // 9885
M=D // 9886
@48 // 9887
D=A // 9888
@SP // 9889
AM=M+1 // 9890
A=A-1 // 9891
M=D // 9892
@SP // 9893
AM=M+1 // 9894
A=A-1 // 9895
M=0 // 9896
// call Output.create
@17 // 9897
D=A // 9898
@14 // 9899
M=D // 9900
@Output.create // 9901
D=A // 9902
@13 // 9903
M=D // 9904
@Output.initMap.ret.45 // 9905
D=A // 9906
@CALL // 9907
0;JMP // 9908
(Output.initMap.ret.45)
@80 // 9909
D=A // 9910
@SP // 9911
AM=M+1 // 9912
A=A-1 // 9913
M=D // 9914
@31 // 9915
D=A // 9916
@SP // 9917
AM=M+1 // 9918
A=A-1 // 9919
M=D // 9920
@51 // 9921
D=A // 9922
@SP // 9923
AM=M+1 // 9924
A=A-1 // 9925
M=D // 9926
@51 // 9927
D=A // 9928
@SP // 9929
AM=M+1 // 9930
A=A-1 // 9931
M=D // 9932
@51 // 9933
D=A // 9934
@SP // 9935
AM=M+1 // 9936
A=A-1 // 9937
M=D // 9938
@31 // 9939
D=A // 9940
@SP // 9941
AM=M+1 // 9942
A=A-1 // 9943
M=D // 9944
@3 // 9945
D=A // 9946
@SP // 9947
AM=M+1 // 9948
A=A-1 // 9949
M=D // 9950
@3 // 9951
D=A // 9952
@SP // 9953
AM=M+1 // 9954
A=A-1 // 9955
M=D // 9956
@3 // 9957
D=A // 9958
@SP // 9959
AM=M+1 // 9960
A=A-1 // 9961
M=D // 9962
@3 // 9963
D=A // 9964
@SP // 9965
AM=M+1 // 9966
A=A-1 // 9967
M=D // 9968
@SP // 9969
AM=M+1 // 9970
A=A-1 // 9971
M=0 // 9972
@SP // 9973
AM=M+1 // 9974
A=A-1 // 9975
M=0 // 9976
// call Output.create
@17 // 9977
D=A // 9978
@14 // 9979
M=D // 9980
@Output.create // 9981
D=A // 9982
@13 // 9983
M=D // 9984
@Output.initMap.ret.46 // 9985
D=A // 9986
@CALL // 9987
0;JMP // 9988
(Output.initMap.ret.46)
@79 // 9989
D=A // 9990
@SP // 9991
AM=M+1 // 9992
A=A-1 // 9993
M=D // 9994
@30 // 9995
D=A // 9996
@SP // 9997
AM=M+1 // 9998
A=A-1 // 9999
M=D // 10000
@51 // 10001
D=A // 10002
@SP // 10003
AM=M+1 // 10004
A=A-1 // 10005
M=D // 10006
@51 // 10007
D=A // 10008
@SP // 10009
AM=M+1 // 10010
A=A-1 // 10011
M=D // 10012
@51 // 10013
D=A // 10014
@SP // 10015
AM=M+1 // 10016
A=A-1 // 10017
M=D // 10018
@51 // 10019
D=A // 10020
@SP // 10021
AM=M+1 // 10022
A=A-1 // 10023
M=D // 10024
@51 // 10025
D=A // 10026
@SP // 10027
AM=M+1 // 10028
A=A-1 // 10029
M=D // 10030
@51 // 10031
D=A // 10032
@SP // 10033
AM=M+1 // 10034
A=A-1 // 10035
M=D // 10036
@51 // 10037
D=A // 10038
@SP // 10039
AM=M+1 // 10040
A=A-1 // 10041
M=D // 10042
@30 // 10043
D=A // 10044
@SP // 10045
AM=M+1 // 10046
A=A-1 // 10047
M=D // 10048
@SP // 10049
AM=M+1 // 10050
A=A-1 // 10051
M=0 // 10052
@SP // 10053
AM=M+1 // 10054
A=A-1 // 10055
M=0 // 10056
// call Output.create
@17 // 10057
D=A // 10058
@14 // 10059
M=D // 10060
@Output.create // 10061
D=A // 10062
@13 // 10063
M=D // 10064
@Output.initMap.ret.47 // 10065
D=A // 10066
@CALL // 10067
0;JMP // 10068
(Output.initMap.ret.47)
@78 // 10069
D=A // 10070
@SP // 10071
AM=M+1 // 10072
A=A-1 // 10073
M=D // 10074
@51 // 10075
D=A // 10076
@SP // 10077
AM=M+1 // 10078
A=A-1 // 10079
M=D // 10080
@51 // 10081
D=A // 10082
@SP // 10083
AM=M+1 // 10084
A=A-1 // 10085
M=D // 10086
@55 // 10087
D=A // 10088
@SP // 10089
AM=M+1 // 10090
A=A-1 // 10091
M=D // 10092
@55 // 10093
D=A // 10094
@SP // 10095
AM=M+1 // 10096
A=A-1 // 10097
M=D // 10098
@63 // 10099
D=A // 10100
@SP // 10101
AM=M+1 // 10102
A=A-1 // 10103
M=D // 10104
@59 // 10105
D=A // 10106
@SP // 10107
AM=M+1 // 10108
A=A-1 // 10109
M=D // 10110
@59 // 10111
D=A // 10112
@SP // 10113
AM=M+1 // 10114
A=A-1 // 10115
M=D // 10116
@51 // 10117
D=A // 10118
@SP // 10119
AM=M+1 // 10120
A=A-1 // 10121
M=D // 10122
@51 // 10123
D=A // 10124
@SP // 10125
AM=M+1 // 10126
A=A-1 // 10127
M=D // 10128
@SP // 10129
AM=M+1 // 10130
A=A-1 // 10131
M=0 // 10132
@SP // 10133
AM=M+1 // 10134
A=A-1 // 10135
M=0 // 10136
// call Output.create
@17 // 10137
D=A // 10138
@14 // 10139
M=D // 10140
@Output.create // 10141
D=A // 10142
@13 // 10143
M=D // 10144
@Output.initMap.ret.48 // 10145
D=A // 10146
@CALL // 10147
0;JMP // 10148
(Output.initMap.ret.48)
@77 // 10149
D=A // 10150
@SP // 10151
AM=M+1 // 10152
A=A-1 // 10153
M=D // 10154
@33 // 10155
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
@63 // 10173
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
@51 // 10185
D=A // 10186
@SP // 10187
AM=M+1 // 10188
A=A-1 // 10189
M=D // 10190
@51 // 10191
D=A // 10192
@SP // 10193
AM=M+1 // 10194
A=A-1 // 10195
M=D // 10196
@51 // 10197
D=A // 10198
@SP // 10199
AM=M+1 // 10200
A=A-1 // 10201
M=D // 10202
@51 // 10203
D=A // 10204
@SP // 10205
AM=M+1 // 10206
A=A-1 // 10207
M=D // 10208
@SP // 10209
AM=M+1 // 10210
A=A-1 // 10211
M=0 // 10212
@SP // 10213
AM=M+1 // 10214
A=A-1 // 10215
M=0 // 10216
// call Output.create
@17 // 10217
D=A // 10218
@14 // 10219
M=D // 10220
@Output.create // 10221
D=A // 10222
@13 // 10223
M=D // 10224
@Output.initMap.ret.49 // 10225
D=A // 10226
@CALL // 10227
0;JMP // 10228
(Output.initMap.ret.49)
@76 // 10229
D=A // 10230
@SP // 10231
AM=M+1 // 10232
A=A-1 // 10233
M=D // 10234
@3 // 10235
D=A // 10236
@SP // 10237
AM=M+1 // 10238
A=A-1 // 10239
M=D // 10240
@3 // 10241
D=A // 10242
@SP // 10243
AM=M+1 // 10244
A=A-1 // 10245
M=D // 10246
@3 // 10247
D=A // 10248
@SP // 10249
AM=M+1 // 10250
A=A-1 // 10251
M=D // 10252
@3 // 10253
D=A // 10254
@SP // 10255
AM=M+1 // 10256
A=A-1 // 10257
M=D // 10258
@3 // 10259
D=A // 10260
@SP // 10261
AM=M+1 // 10262
A=A-1 // 10263
M=D // 10264
@3 // 10265
D=A // 10266
@SP // 10267
AM=M+1 // 10268
A=A-1 // 10269
M=D // 10270
@35 // 10271
D=A // 10272
@SP // 10273
AM=M+1 // 10274
A=A-1 // 10275
M=D // 10276
@51 // 10277
D=A // 10278
@SP // 10279
AM=M+1 // 10280
A=A-1 // 10281
M=D // 10282
@63 // 10283
D=A // 10284
@SP // 10285
AM=M+1 // 10286
A=A-1 // 10287
M=D // 10288
@SP // 10289
AM=M+1 // 10290
A=A-1 // 10291
M=0 // 10292
@SP // 10293
AM=M+1 // 10294
A=A-1 // 10295
M=0 // 10296
// call Output.create
@17 // 10297
D=A // 10298
@14 // 10299
M=D // 10300
@Output.create // 10301
D=A // 10302
@13 // 10303
M=D // 10304
@Output.initMap.ret.50 // 10305
D=A // 10306
@CALL // 10307
0;JMP // 10308
(Output.initMap.ret.50)
@75 // 10309
D=A // 10310
@SP // 10311
AM=M+1 // 10312
A=A-1 // 10313
M=D // 10314
@51 // 10315
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
@27 // 10333
D=A // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=D // 10338
@15 // 10339
D=A // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=D // 10344
@27 // 10345
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
@51 // 10357
D=A // 10358
@SP // 10359
AM=M+1 // 10360
A=A-1 // 10361
M=D // 10362
@51 // 10363
D=A // 10364
@SP // 10365
AM=M+1 // 10366
A=A-1 // 10367
M=D // 10368
@SP // 10369
AM=M+1 // 10370
A=A-1 // 10371
M=0 // 10372
@SP // 10373
AM=M+1 // 10374
A=A-1 // 10375
M=0 // 10376
// call Output.create
@17 // 10377
D=A // 10378
@14 // 10379
M=D // 10380
@Output.create // 10381
D=A // 10382
@13 // 10383
M=D // 10384
@Output.initMap.ret.51 // 10385
D=A // 10386
@CALL // 10387
0;JMP // 10388
(Output.initMap.ret.51)
@74 // 10389
D=A // 10390
@SP // 10391
AM=M+1 // 10392
A=A-1 // 10393
M=D // 10394
@60 // 10395
D=A // 10396
@SP // 10397
AM=M+1 // 10398
A=A-1 // 10399
M=D // 10400
@24 // 10401
D=A // 10402
@SP // 10403
AM=M+1 // 10404
A=A-1 // 10405
M=D // 10406
@24 // 10407
D=A // 10408
@SP // 10409
AM=M+1 // 10410
A=A-1 // 10411
M=D // 10412
@24 // 10413
D=A // 10414
@SP // 10415
AM=M+1 // 10416
A=A-1 // 10417
M=D // 10418
@24 // 10419
D=A // 10420
@SP // 10421
AM=M+1 // 10422
A=A-1 // 10423
M=D // 10424
@24 // 10425
D=A // 10426
@SP // 10427
AM=M+1 // 10428
A=A-1 // 10429
M=D // 10430
@27 // 10431
D=A // 10432
@SP // 10433
AM=M+1 // 10434
A=A-1 // 10435
M=D // 10436
@27 // 10437
D=A // 10438
@SP // 10439
AM=M+1 // 10440
A=A-1 // 10441
M=D // 10442
@14 // 10443
D=A // 10444
@SP // 10445
AM=M+1 // 10446
A=A-1 // 10447
M=D // 10448
@SP // 10449
AM=M+1 // 10450
A=A-1 // 10451
M=0 // 10452
@SP // 10453
AM=M+1 // 10454
A=A-1 // 10455
M=0 // 10456
// call Output.create
@17 // 10457
D=A // 10458
@14 // 10459
M=D // 10460
@Output.create // 10461
D=A // 10462
@13 // 10463
M=D // 10464
@Output.initMap.ret.52 // 10465
D=A // 10466
@CALL // 10467
0;JMP // 10468
(Output.initMap.ret.52)
@73 // 10469
D=A // 10470
@SP // 10471
AM=M+1 // 10472
A=A-1 // 10473
M=D // 10474
@30 // 10475
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
@12 // 10487
D=A // 10488
@SP // 10489
AM=M+1 // 10490
A=A-1 // 10491
M=D // 10492
@12 // 10493
D=A // 10494
@SP // 10495
AM=M+1 // 10496
A=A-1 // 10497
M=D // 10498
@12 // 10499
D=A // 10500
@SP // 10501
AM=M+1 // 10502
A=A-1 // 10503
M=D // 10504
@12 // 10505
D=A // 10506
@SP // 10507
AM=M+1 // 10508
A=A-1 // 10509
M=D // 10510
@12 // 10511
D=A // 10512
@SP // 10513
AM=M+1 // 10514
A=A-1 // 10515
M=D // 10516
@12 // 10517
D=A // 10518
@SP // 10519
AM=M+1 // 10520
A=A-1 // 10521
M=D // 10522
@30 // 10523
D=A // 10524
@SP // 10525
AM=M+1 // 10526
A=A-1 // 10527
M=D // 10528
@SP // 10529
AM=M+1 // 10530
A=A-1 // 10531
M=0 // 10532
@SP // 10533
AM=M+1 // 10534
A=A-1 // 10535
M=0 // 10536
// call Output.create
@17 // 10537
D=A // 10538
@14 // 10539
M=D // 10540
@Output.create // 10541
D=A // 10542
@13 // 10543
M=D // 10544
@Output.initMap.ret.53 // 10545
D=A // 10546
@CALL // 10547
0;JMP // 10548
(Output.initMap.ret.53)
@72 // 10549
D=A // 10550
@SP // 10551
AM=M+1 // 10552
A=A-1 // 10553
M=D // 10554
@51 // 10555
D=A // 10556
@SP // 10557
AM=M+1 // 10558
A=A-1 // 10559
M=D // 10560
@51 // 10561
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
@63 // 10579
D=A // 10580
@SP // 10581
AM=M+1 // 10582
A=A-1 // 10583
M=D // 10584
@51 // 10585
D=A // 10586
@SP // 10587
AM=M+1 // 10588
A=A-1 // 10589
M=D // 10590
@51 // 10591
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
@51 // 10603
D=A // 10604
@SP // 10605
AM=M+1 // 10606
A=A-1 // 10607
M=D // 10608
@SP // 10609
AM=M+1 // 10610
A=A-1 // 10611
M=0 // 10612
@SP // 10613
AM=M+1 // 10614
A=A-1 // 10615
M=0 // 10616
// call Output.create
@17 // 10617
D=A // 10618
@14 // 10619
M=D // 10620
@Output.create // 10621
D=A // 10622
@13 // 10623
M=D // 10624
@Output.initMap.ret.54 // 10625
D=A // 10626
@CALL // 10627
0;JMP // 10628
(Output.initMap.ret.54)
@71 // 10629
D=A // 10630
@SP // 10631
AM=M+1 // 10632
A=A-1 // 10633
M=D // 10634
@28 // 10635
D=A // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=D // 10640
@54 // 10641
D=A // 10642
@SP // 10643
AM=M+1 // 10644
A=A-1 // 10645
M=D // 10646
@35 // 10647
D=A // 10648
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=D // 10652
@3 // 10653
D=A // 10654
@SP // 10655
AM=M+1 // 10656
A=A-1 // 10657
M=D // 10658
@59 // 10659
D=A // 10660
@SP // 10661
AM=M+1 // 10662
A=A-1 // 10663
M=D // 10664
@51 // 10665
D=A // 10666
@SP // 10667
AM=M+1 // 10668
A=A-1 // 10669
M=D // 10670
@51 // 10671
D=A // 10672
@SP // 10673
AM=M+1 // 10674
A=A-1 // 10675
M=D // 10676
@54 // 10677
D=A // 10678
@SP // 10679
AM=M+1 // 10680
A=A-1 // 10681
M=D // 10682
@44 // 10683
D=A // 10684
@SP // 10685
AM=M+1 // 10686
A=A-1 // 10687
M=D // 10688
@SP // 10689
AM=M+1 // 10690
A=A-1 // 10691
M=0 // 10692
@SP // 10693
AM=M+1 // 10694
A=A-1 // 10695
M=0 // 10696
// call Output.create
@17 // 10697
D=A // 10698
@14 // 10699
M=D // 10700
@Output.create // 10701
D=A // 10702
@13 // 10703
M=D // 10704
@Output.initMap.ret.55 // 10705
D=A // 10706
@CALL // 10707
0;JMP // 10708
(Output.initMap.ret.55)
@70 // 10709
D=A // 10710
@SP // 10711
AM=M+1 // 10712
A=A-1 // 10713
M=D // 10714
@63 // 10715
D=A // 10716
@SP // 10717
AM=M+1 // 10718
A=A-1 // 10719
M=D // 10720
@51 // 10721
D=A // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=D // 10726
@35 // 10727
D=A // 10728
@SP // 10729
AM=M+1 // 10730
A=A-1 // 10731
M=D // 10732
@11 // 10733
D=A // 10734
@SP // 10735
AM=M+1 // 10736
A=A-1 // 10737
M=D // 10738
@15 // 10739
D=A // 10740
@SP // 10741
AM=M+1 // 10742
A=A-1 // 10743
M=D // 10744
@11 // 10745
D=A // 10746
@SP // 10747
AM=M+1 // 10748
A=A-1 // 10749
M=D // 10750
@3 // 10751
D=A // 10752
@SP // 10753
AM=M+1 // 10754
A=A-1 // 10755
M=D // 10756
@3 // 10757
D=A // 10758
@SP // 10759
AM=M+1 // 10760
A=A-1 // 10761
M=D // 10762
@3 // 10763
D=A // 10764
@SP // 10765
AM=M+1 // 10766
A=A-1 // 10767
M=D // 10768
@SP // 10769
AM=M+1 // 10770
A=A-1 // 10771
M=0 // 10772
@SP // 10773
AM=M+1 // 10774
A=A-1 // 10775
M=0 // 10776
// call Output.create
@17 // 10777
D=A // 10778
@14 // 10779
M=D // 10780
@Output.create // 10781
D=A // 10782
@13 // 10783
M=D // 10784
@Output.initMap.ret.56 // 10785
D=A // 10786
@CALL // 10787
0;JMP // 10788
(Output.initMap.ret.56)
@69 // 10789
D=A // 10790
@SP // 10791
AM=M+1 // 10792
A=A-1 // 10793
M=D // 10794
@63 // 10795
D=A // 10796
@SP // 10797
AM=M+1 // 10798
A=A-1 // 10799
M=D // 10800
@51 // 10801
D=A // 10802
@SP // 10803
AM=M+1 // 10804
A=A-1 // 10805
M=D // 10806
@35 // 10807
D=A // 10808
@SP // 10809
AM=M+1 // 10810
A=A-1 // 10811
M=D // 10812
@11 // 10813
D=A // 10814
@SP // 10815
AM=M+1 // 10816
A=A-1 // 10817
M=D // 10818
@15 // 10819
D=A // 10820
@SP // 10821
AM=M+1 // 10822
A=A-1 // 10823
M=D // 10824
@11 // 10825
D=A // 10826
@SP // 10827
AM=M+1 // 10828
A=A-1 // 10829
M=D // 10830
@35 // 10831
D=A // 10832
@SP // 10833
AM=M+1 // 10834
A=A-1 // 10835
M=D // 10836
@51 // 10837
D=A // 10838
@SP // 10839
AM=M+1 // 10840
A=A-1 // 10841
M=D // 10842
@63 // 10843
D=A // 10844
@SP // 10845
AM=M+1 // 10846
A=A-1 // 10847
M=D // 10848
@SP // 10849
AM=M+1 // 10850
A=A-1 // 10851
M=0 // 10852
@SP // 10853
AM=M+1 // 10854
A=A-1 // 10855
M=0 // 10856
// call Output.create
@17 // 10857
D=A // 10858
@14 // 10859
M=D // 10860
@Output.create // 10861
D=A // 10862
@13 // 10863
M=D // 10864
@Output.initMap.ret.57 // 10865
D=A // 10866
@CALL // 10867
0;JMP // 10868
(Output.initMap.ret.57)
@68 // 10869
D=A // 10870
@SP // 10871
AM=M+1 // 10872
A=A-1 // 10873
M=D // 10874
@15 // 10875
D=A // 10876
@SP // 10877
AM=M+1 // 10878
A=A-1 // 10879
M=D // 10880
@27 // 10881
D=A // 10882
@SP // 10883
AM=M+1 // 10884
A=A-1 // 10885
M=D // 10886
@51 // 10887
D=A // 10888
@SP // 10889
AM=M+1 // 10890
A=A-1 // 10891
M=D // 10892
@51 // 10893
D=A // 10894
@SP // 10895
AM=M+1 // 10896
A=A-1 // 10897
M=D // 10898
@51 // 10899
D=A // 10900
@SP // 10901
AM=M+1 // 10902
A=A-1 // 10903
M=D // 10904
@51 // 10905
D=A // 10906
@SP // 10907
AM=M+1 // 10908
A=A-1 // 10909
M=D // 10910
@51 // 10911
D=A // 10912
@SP // 10913
AM=M+1 // 10914
A=A-1 // 10915
M=D // 10916
@27 // 10917
D=A // 10918
@SP // 10919
AM=M+1 // 10920
A=A-1 // 10921
M=D // 10922
@15 // 10923
D=A // 10924
@SP // 10925
AM=M+1 // 10926
A=A-1 // 10927
M=D // 10928
@SP // 10929
AM=M+1 // 10930
A=A-1 // 10931
M=0 // 10932
@SP // 10933
AM=M+1 // 10934
A=A-1 // 10935
M=0 // 10936
// call Output.create
@17 // 10937
D=A // 10938
@14 // 10939
M=D // 10940
@Output.create // 10941
D=A // 10942
@13 // 10943
M=D // 10944
@Output.initMap.ret.58 // 10945
D=A // 10946
@CALL // 10947
0;JMP // 10948
(Output.initMap.ret.58)
@67 // 10949
D=A // 10950
@SP // 10951
AM=M+1 // 10952
A=A-1 // 10953
M=D // 10954
@28 // 10955
D=A // 10956
@SP // 10957
AM=M+1 // 10958
A=A-1 // 10959
M=D // 10960
@54 // 10961
D=A // 10962
@SP // 10963
AM=M+1 // 10964
A=A-1 // 10965
M=D // 10966
@35 // 10967
D=A // 10968
@SP // 10969
AM=M+1 // 10970
A=A-1 // 10971
M=D // 10972
@3 // 10973
D=A // 10974
@SP // 10975
AM=M+1 // 10976
A=A-1 // 10977
M=D // 10978
@3 // 10979
D=A // 10980
@SP // 10981
AM=M+1 // 10982
A=A-1 // 10983
M=D // 10984
@3 // 10985
D=A // 10986
@SP // 10987
AM=M+1 // 10988
A=A-1 // 10989
M=D // 10990
@35 // 10991
D=A // 10992
@SP // 10993
AM=M+1 // 10994
A=A-1 // 10995
M=D // 10996
@54 // 10997
D=A // 10998
@SP // 10999
AM=M+1 // 11000
A=A-1 // 11001
M=D // 11002
@28 // 11003
D=A // 11004
@SP // 11005
AM=M+1 // 11006
A=A-1 // 11007
M=D // 11008
@SP // 11009
AM=M+1 // 11010
A=A-1 // 11011
M=0 // 11012
@SP // 11013
AM=M+1 // 11014
A=A-1 // 11015
M=0 // 11016
// call Output.create
@17 // 11017
D=A // 11018
@14 // 11019
M=D // 11020
@Output.create // 11021
D=A // 11022
@13 // 11023
M=D // 11024
@Output.initMap.ret.59 // 11025
D=A // 11026
@CALL // 11027
0;JMP // 11028
(Output.initMap.ret.59)
@66 // 11029
D=A // 11030
@SP // 11031
AM=M+1 // 11032
A=A-1 // 11033
M=D // 11034
@31 // 11035
D=A // 11036
@SP // 11037
AM=M+1 // 11038
A=A-1 // 11039
M=D // 11040
@51 // 11041
D=A // 11042
@SP // 11043
AM=M+1 // 11044
A=A-1 // 11045
M=D // 11046
@51 // 11047
D=A // 11048
@SP // 11049
AM=M+1 // 11050
A=A-1 // 11051
M=D // 11052
@51 // 11053
D=A // 11054
@SP // 11055
AM=M+1 // 11056
A=A-1 // 11057
M=D // 11058
@31 // 11059
D=A // 11060
@SP // 11061
AM=M+1 // 11062
A=A-1 // 11063
M=D // 11064
@51 // 11065
D=A // 11066
@SP // 11067
AM=M+1 // 11068
A=A-1 // 11069
M=D // 11070
@51 // 11071
D=A // 11072
@SP // 11073
AM=M+1 // 11074
A=A-1 // 11075
M=D // 11076
@51 // 11077
D=A // 11078
@SP // 11079
AM=M+1 // 11080
A=A-1 // 11081
M=D // 11082
@31 // 11083
D=A // 11084
@SP // 11085
AM=M+1 // 11086
A=A-1 // 11087
M=D // 11088
@SP // 11089
AM=M+1 // 11090
A=A-1 // 11091
M=0 // 11092
@SP // 11093
AM=M+1 // 11094
A=A-1 // 11095
M=0 // 11096
// call Output.create
@17 // 11097
D=A // 11098
@14 // 11099
M=D // 11100
@Output.create // 11101
D=A // 11102
@13 // 11103
M=D // 11104
@Output.initMap.ret.60 // 11105
D=A // 11106
@CALL // 11107
0;JMP // 11108
(Output.initMap.ret.60)
@65 // 11109
D=A // 11110
@SP // 11111
AM=M+1 // 11112
A=A-1 // 11113
M=D // 11114
@12 // 11115
D=A // 11116
@SP // 11117
AM=M+1 // 11118
A=A-1 // 11119
M=D // 11120
@30 // 11121
D=A // 11122
@SP // 11123
AM=M+1 // 11124
A=A-1 // 11125
M=D // 11126
@51 // 11127
D=A // 11128
@SP // 11129
AM=M+1 // 11130
A=A-1 // 11131
M=D // 11132
@51 // 11133
D=A // 11134
@SP // 11135
AM=M+1 // 11136
A=A-1 // 11137
M=D // 11138
@63 // 11139
D=A // 11140
@SP // 11141
AM=M+1 // 11142
A=A-1 // 11143
M=D // 11144
@51 // 11145
D=A // 11146
@SP // 11147
AM=M+1 // 11148
A=A-1 // 11149
M=D // 11150
@51 // 11151
D=A // 11152
@SP // 11153
AM=M+1 // 11154
A=A-1 // 11155
M=D // 11156
@51 // 11157
D=A // 11158
@SP // 11159
AM=M+1 // 11160
A=A-1 // 11161
M=D // 11162
@51 // 11163
D=A // 11164
@SP // 11165
AM=M+1 // 11166
A=A-1 // 11167
M=D // 11168
@SP // 11169
AM=M+1 // 11170
A=A-1 // 11171
M=0 // 11172
@SP // 11173
AM=M+1 // 11174
A=A-1 // 11175
M=0 // 11176
// call Output.create
@17 // 11177
D=A // 11178
@14 // 11179
M=D // 11180
@Output.create // 11181
D=A // 11182
@13 // 11183
M=D // 11184
@Output.initMap.ret.61 // 11185
D=A // 11186
@CALL // 11187
0;JMP // 11188
(Output.initMap.ret.61)
@63 // 11189
D=A // 11190
@SP // 11191
AM=M+1 // 11192
A=A-1 // 11193
M=D // 11194
@30 // 11195
D=A // 11196
@SP // 11197
AM=M+1 // 11198
A=A-1 // 11199
M=D // 11200
@51 // 11201
D=A // 11202
@SP // 11203
AM=M+1 // 11204
A=A-1 // 11205
M=D // 11206
@51 // 11207
D=A // 11208
@SP // 11209
AM=M+1 // 11210
A=A-1 // 11211
M=D // 11212
@24 // 11213
D=A // 11214
@SP // 11215
AM=M+1 // 11216
A=A-1 // 11217
M=D // 11218
@12 // 11219
D=A // 11220
@SP // 11221
AM=M+1 // 11222
A=A-1 // 11223
M=D // 11224
@12 // 11225
D=A // 11226
@SP // 11227
AM=M+1 // 11228
A=A-1 // 11229
M=D // 11230
@SP // 11231
AM=M+1 // 11232
A=A-1 // 11233
M=0 // 11234
@12 // 11235
D=A // 11236
@SP // 11237
AM=M+1 // 11238
A=A-1 // 11239
M=D // 11240
@12 // 11241
D=A // 11242
@SP // 11243
AM=M+1 // 11244
A=A-1 // 11245
M=D // 11246
@SP // 11247
AM=M+1 // 11248
A=A-1 // 11249
M=0 // 11250
@SP // 11251
AM=M+1 // 11252
A=A-1 // 11253
M=0 // 11254
// call Output.create
@17 // 11255
D=A // 11256
@14 // 11257
M=D // 11258
@Output.create // 11259
D=A // 11260
@13 // 11261
M=D // 11262
@Output.initMap.ret.62 // 11263
D=A // 11264
@CALL // 11265
0;JMP // 11266
(Output.initMap.ret.62)
@64 // 11267
D=A // 11268
@SP // 11269
AM=M+1 // 11270
A=A-1 // 11271
M=D // 11272
@30 // 11273
D=A // 11274
@SP // 11275
AM=M+1 // 11276
A=A-1 // 11277
M=D // 11278
@51 // 11279
D=A // 11280
@SP // 11281
AM=M+1 // 11282
A=A-1 // 11283
M=D // 11284
@51 // 11285
D=A // 11286
@SP // 11287
AM=M+1 // 11288
A=A-1 // 11289
M=D // 11290
@59 // 11291
D=A // 11292
@SP // 11293
AM=M+1 // 11294
A=A-1 // 11295
M=D // 11296
@59 // 11297
D=A // 11298
@SP // 11299
AM=M+1 // 11300
A=A-1 // 11301
M=D // 11302
@59 // 11303
D=A // 11304
@SP // 11305
AM=M+1 // 11306
A=A-1 // 11307
M=D // 11308
@27 // 11309
D=A // 11310
@SP // 11311
AM=M+1 // 11312
A=A-1 // 11313
M=D // 11314
@3 // 11315
D=A // 11316
@SP // 11317
AM=M+1 // 11318
A=A-1 // 11319
M=D // 11320
@30 // 11321
D=A // 11322
@SP // 11323
AM=M+1 // 11324
A=A-1 // 11325
M=D // 11326
@SP // 11327
AM=M+1 // 11328
A=A-1 // 11329
M=0 // 11330
@SP // 11331
AM=M+1 // 11332
A=A-1 // 11333
M=0 // 11334
// call Output.create
@17 // 11335
D=A // 11336
@14 // 11337
M=D // 11338
@Output.create // 11339
D=A // 11340
@13 // 11341
M=D // 11342
@Output.initMap.ret.63 // 11343
D=A // 11344
@CALL // 11345
0;JMP // 11346
(Output.initMap.ret.63)
@62 // 11347
D=A // 11348
@SP // 11349
AM=M+1 // 11350
A=A-1 // 11351
M=D // 11352
@SP // 11353
AM=M+1 // 11354
A=A-1 // 11355
M=0 // 11356
@SP // 11357
AM=M+1 // 11358
A=A-1 // 11359
M=0 // 11360
@3 // 11361
D=A // 11362
@SP // 11363
AM=M+1 // 11364
A=A-1 // 11365
M=D // 11366
@6 // 11367
D=A // 11368
@SP // 11369
AM=M+1 // 11370
A=A-1 // 11371
M=D // 11372
@12 // 11373
D=A // 11374
@SP // 11375
AM=M+1 // 11376
A=A-1 // 11377
M=D // 11378
@24 // 11379
D=A // 11380
@SP // 11381
AM=M+1 // 11382
A=A-1 // 11383
M=D // 11384
@12 // 11385
D=A // 11386
@SP // 11387
AM=M+1 // 11388
A=A-1 // 11389
M=D // 11390
@6 // 11391
D=A // 11392
@SP // 11393
AM=M+1 // 11394
A=A-1 // 11395
M=D // 11396
@3 // 11397
D=A // 11398
@SP // 11399
AM=M+1 // 11400
A=A-1 // 11401
M=D // 11402
@SP // 11403
AM=M+1 // 11404
A=A-1 // 11405
M=0 // 11406
@SP // 11407
AM=M+1 // 11408
A=A-1 // 11409
M=0 // 11410
// call Output.create
@17 // 11411
D=A // 11412
@14 // 11413
M=D // 11414
@Output.create // 11415
D=A // 11416
@13 // 11417
M=D // 11418
@Output.initMap.ret.64 // 11419
D=A // 11420
@CALL // 11421
0;JMP // 11422
(Output.initMap.ret.64)
@61 // 11423
D=A // 11424
@SP // 11425
AM=M+1 // 11426
A=A-1 // 11427
M=D // 11428
@SP // 11429
AM=M+1 // 11430
A=A-1 // 11431
M=0 // 11432
@SP // 11433
AM=M+1 // 11434
A=A-1 // 11435
M=0 // 11436
@SP // 11437
AM=M+1 // 11438
A=A-1 // 11439
M=0 // 11440
@63 // 11441
D=A // 11442
@SP // 11443
AM=M+1 // 11444
A=A-1 // 11445
M=D // 11446
@SP // 11447
AM=M+1 // 11448
A=A-1 // 11449
M=0 // 11450
@SP // 11451
AM=M+1 // 11452
A=A-1 // 11453
M=0 // 11454
@63 // 11455
D=A // 11456
@SP // 11457
AM=M+1 // 11458
A=A-1 // 11459
M=D // 11460
@SP // 11461
AM=M+1 // 11462
A=A-1 // 11463
M=0 // 11464
@SP // 11465
AM=M+1 // 11466
A=A-1 // 11467
M=0 // 11468
@SP // 11469
AM=M+1 // 11470
A=A-1 // 11471
M=0 // 11472
@SP // 11473
AM=M+1 // 11474
A=A-1 // 11475
M=0 // 11476
// call Output.create
@17 // 11477
D=A // 11478
@14 // 11479
M=D // 11480
@Output.create // 11481
D=A // 11482
@13 // 11483
M=D // 11484
@Output.initMap.ret.65 // 11485
D=A // 11486
@CALL // 11487
0;JMP // 11488
(Output.initMap.ret.65)
@60 // 11489
D=A // 11490
@SP // 11491
AM=M+1 // 11492
A=A-1 // 11493
M=D // 11494
@SP // 11495
AM=M+1 // 11496
A=A-1 // 11497
M=0 // 11498
@SP // 11499
AM=M+1 // 11500
A=A-1 // 11501
M=0 // 11502
@24 // 11503
D=A // 11504
@SP // 11505
AM=M+1 // 11506
A=A-1 // 11507
M=D // 11508
@12 // 11509
D=A // 11510
@SP // 11511
AM=M+1 // 11512
A=A-1 // 11513
M=D // 11514
@6 // 11515
D=A // 11516
@SP // 11517
AM=M+1 // 11518
A=A-1 // 11519
M=D // 11520
@3 // 11521
D=A // 11522
@SP // 11523
AM=M+1 // 11524
A=A-1 // 11525
M=D // 11526
@6 // 11527
D=A // 11528
@SP // 11529
AM=M+1 // 11530
A=A-1 // 11531
M=D // 11532
@12 // 11533
D=A // 11534
@SP // 11535
AM=M+1 // 11536
A=A-1 // 11537
M=D // 11538
@24 // 11539
D=A // 11540
@SP // 11541
AM=M+1 // 11542
A=A-1 // 11543
M=D // 11544
@SP // 11545
AM=M+1 // 11546
A=A-1 // 11547
M=0 // 11548
@SP // 11549
AM=M+1 // 11550
A=A-1 // 11551
M=0 // 11552
// call Output.create
@17 // 11553
D=A // 11554
@14 // 11555
M=D // 11556
@Output.create // 11557
D=A // 11558
@13 // 11559
M=D // 11560
@Output.initMap.ret.66 // 11561
D=A // 11562
@CALL // 11563
0;JMP // 11564
(Output.initMap.ret.66)
@59 // 11565
D=A // 11566
@SP // 11567
AM=M+1 // 11568
A=A-1 // 11569
M=D // 11570
@SP // 11571
AM=M+1 // 11572
A=A-1 // 11573
M=0 // 11574
@SP // 11575
AM=M+1 // 11576
A=A-1 // 11577
M=0 // 11578
@12 // 11579
D=A // 11580
@SP // 11581
AM=M+1 // 11582
A=A-1 // 11583
M=D // 11584
@12 // 11585
D=A // 11586
@SP // 11587
AM=M+1 // 11588
A=A-1 // 11589
M=D // 11590
@SP // 11591
AM=M+1 // 11592
A=A-1 // 11593
M=0 // 11594
@SP // 11595
AM=M+1 // 11596
A=A-1 // 11597
M=0 // 11598
@12 // 11599
D=A // 11600
@SP // 11601
AM=M+1 // 11602
A=A-1 // 11603
M=D // 11604
@12 // 11605
D=A // 11606
@SP // 11607
AM=M+1 // 11608
A=A-1 // 11609
M=D // 11610
@6 // 11611
D=A // 11612
@SP // 11613
AM=M+1 // 11614
A=A-1 // 11615
M=D // 11616
@SP // 11617
AM=M+1 // 11618
A=A-1 // 11619
M=0 // 11620
@SP // 11621
AM=M+1 // 11622
A=A-1 // 11623
M=0 // 11624
// call Output.create
@17 // 11625
D=A // 11626
@14 // 11627
M=D // 11628
@Output.create // 11629
D=A // 11630
@13 // 11631
M=D // 11632
@Output.initMap.ret.67 // 11633
D=A // 11634
@CALL // 11635
0;JMP // 11636
(Output.initMap.ret.67)
@58 // 11637
D=A // 11638
@SP // 11639
AM=M+1 // 11640
A=A-1 // 11641
M=D // 11642
@SP // 11643
AM=M+1 // 11644
A=A-1 // 11645
M=0 // 11646
@SP // 11647
AM=M+1 // 11648
A=A-1 // 11649
M=0 // 11650
@12 // 11651
D=A // 11652
@SP // 11653
AM=M+1 // 11654
A=A-1 // 11655
M=D // 11656
@12 // 11657
D=A // 11658
@SP // 11659
AM=M+1 // 11660
A=A-1 // 11661
M=D // 11662
@SP // 11663
AM=M+1 // 11664
A=A-1 // 11665
M=0 // 11666
@SP // 11667
AM=M+1 // 11668
A=A-1 // 11669
M=0 // 11670
@12 // 11671
D=A // 11672
@SP // 11673
AM=M+1 // 11674
A=A-1 // 11675
M=D // 11676
@12 // 11677
D=A // 11678
@SP // 11679
AM=M+1 // 11680
A=A-1 // 11681
M=D // 11682
@SP // 11683
AM=M+1 // 11684
A=A-1 // 11685
M=0 // 11686
@SP // 11687
AM=M+1 // 11688
A=A-1 // 11689
M=0 // 11690
@SP // 11691
AM=M+1 // 11692
A=A-1 // 11693
M=0 // 11694
// call Output.create
@17 // 11695
D=A // 11696
@14 // 11697
M=D // 11698
@Output.create // 11699
D=A // 11700
@13 // 11701
M=D // 11702
@Output.initMap.ret.68 // 11703
D=A // 11704
@CALL // 11705
0;JMP // 11706
(Output.initMap.ret.68)
@57 // 11707
D=A // 11708
@SP // 11709
AM=M+1 // 11710
A=A-1 // 11711
M=D // 11712
@30 // 11713
D=A // 11714
@SP // 11715
AM=M+1 // 11716
A=A-1 // 11717
M=D // 11718
@51 // 11719
D=A // 11720
@SP // 11721
AM=M+1 // 11722
A=A-1 // 11723
M=D // 11724
@51 // 11725
D=A // 11726
@SP // 11727
AM=M+1 // 11728
A=A-1 // 11729
M=D // 11730
@51 // 11731
D=A // 11732
@SP // 11733
AM=M+1 // 11734
A=A-1 // 11735
M=D // 11736
@62 // 11737
D=A // 11738
@SP // 11739
AM=M+1 // 11740
A=A-1 // 11741
M=D // 11742
@48 // 11743
D=A // 11744
@SP // 11745
AM=M+1 // 11746
A=A-1 // 11747
M=D // 11748
@48 // 11749
D=A // 11750
@SP // 11751
AM=M+1 // 11752
A=A-1 // 11753
M=D // 11754
@24 // 11755
D=A // 11756
@SP // 11757
AM=M+1 // 11758
A=A-1 // 11759
M=D // 11760
@14 // 11761
D=A // 11762
@SP // 11763
AM=M+1 // 11764
A=A-1 // 11765
M=D // 11766
@SP // 11767
AM=M+1 // 11768
A=A-1 // 11769
M=0 // 11770
@SP // 11771
AM=M+1 // 11772
A=A-1 // 11773
M=0 // 11774
// call Output.create
@17 // 11775
D=A // 11776
@14 // 11777
M=D // 11778
@Output.create // 11779
D=A // 11780
@13 // 11781
M=D // 11782
@Output.initMap.ret.69 // 11783
D=A // 11784
@CALL // 11785
0;JMP // 11786
(Output.initMap.ret.69)
@56 // 11787
D=A // 11788
@SP // 11789
AM=M+1 // 11790
A=A-1 // 11791
M=D // 11792
@30 // 11793
D=A // 11794
@SP // 11795
AM=M+1 // 11796
A=A-1 // 11797
M=D // 11798
@51 // 11799
D=A // 11800
@SP // 11801
AM=M+1 // 11802
A=A-1 // 11803
M=D // 11804
@51 // 11805
D=A // 11806
@SP // 11807
AM=M+1 // 11808
A=A-1 // 11809
M=D // 11810
@51 // 11811
D=A // 11812
@SP // 11813
AM=M+1 // 11814
A=A-1 // 11815
M=D // 11816
@30 // 11817
D=A // 11818
@SP // 11819
AM=M+1 // 11820
A=A-1 // 11821
M=D // 11822
@51 // 11823
D=A // 11824
@SP // 11825
AM=M+1 // 11826
A=A-1 // 11827
M=D // 11828
@51 // 11829
D=A // 11830
@SP // 11831
AM=M+1 // 11832
A=A-1 // 11833
M=D // 11834
@51 // 11835
D=A // 11836
@SP // 11837
AM=M+1 // 11838
A=A-1 // 11839
M=D // 11840
@30 // 11841
D=A // 11842
@SP // 11843
AM=M+1 // 11844
A=A-1 // 11845
M=D // 11846
@SP // 11847
AM=M+1 // 11848
A=A-1 // 11849
M=0 // 11850
@SP // 11851
AM=M+1 // 11852
A=A-1 // 11853
M=0 // 11854
// call Output.create
@17 // 11855
D=A // 11856
@14 // 11857
M=D // 11858
@Output.create // 11859
D=A // 11860
@13 // 11861
M=D // 11862
@Output.initMap.ret.70 // 11863
D=A // 11864
@CALL // 11865
0;JMP // 11866
(Output.initMap.ret.70)
@55 // 11867
D=A // 11868
@SP // 11869
AM=M+1 // 11870
A=A-1 // 11871
M=D // 11872
@63 // 11873
D=A // 11874
@SP // 11875
AM=M+1 // 11876
A=A-1 // 11877
M=D // 11878
@49 // 11879
D=A // 11880
@SP // 11881
AM=M+1 // 11882
A=A-1 // 11883
M=D // 11884
@48 // 11885
D=A // 11886
@SP // 11887
AM=M+1 // 11888
A=A-1 // 11889
M=D // 11890
@48 // 11891
D=A // 11892
@SP // 11893
AM=M+1 // 11894
A=A-1 // 11895
M=D // 11896
@24 // 11897
D=A // 11898
@SP // 11899
AM=M+1 // 11900
A=A-1 // 11901
M=D // 11902
@12 // 11903
D=A // 11904
@SP // 11905
AM=M+1 // 11906
A=A-1 // 11907
M=D // 11908
@12 // 11909
D=A // 11910
@SP // 11911
AM=M+1 // 11912
A=A-1 // 11913
M=D // 11914
@12 // 11915
D=A // 11916
@SP // 11917
AM=M+1 // 11918
A=A-1 // 11919
M=D // 11920
@12 // 11921
D=A // 11922
@SP // 11923
AM=M+1 // 11924
A=A-1 // 11925
M=D // 11926
@SP // 11927
AM=M+1 // 11928
A=A-1 // 11929
M=0 // 11930
@SP // 11931
AM=M+1 // 11932
A=A-1 // 11933
M=0 // 11934
// call Output.create
@17 // 11935
D=A // 11936
@14 // 11937
M=D // 11938
@Output.create // 11939
D=A // 11940
@13 // 11941
M=D // 11942
@Output.initMap.ret.71 // 11943
D=A // 11944
@CALL // 11945
0;JMP // 11946
(Output.initMap.ret.71)
@54 // 11947
D=A // 11948
@SP // 11949
AM=M+1 // 11950
A=A-1 // 11951
M=D // 11952
@28 // 11953
D=A // 11954
@SP // 11955
AM=M+1 // 11956
A=A-1 // 11957
M=D // 11958
@6 // 11959
D=A // 11960
@SP // 11961
AM=M+1 // 11962
A=A-1 // 11963
M=D // 11964
@3 // 11965
D=A // 11966
@SP // 11967
AM=M+1 // 11968
A=A-1 // 11969
M=D // 11970
@3 // 11971
D=A // 11972
@SP // 11973
AM=M+1 // 11974
A=A-1 // 11975
M=D // 11976
@31 // 11977
D=A // 11978
@SP // 11979
AM=M+1 // 11980
A=A-1 // 11981
M=D // 11982
@51 // 11983
D=A // 11984
@SP // 11985
AM=M+1 // 11986
A=A-1 // 11987
M=D // 11988
@51 // 11989
D=A // 11990
@SP // 11991
AM=M+1 // 11992
A=A-1 // 11993
M=D // 11994
@51 // 11995
D=A // 11996
@SP // 11997
AM=M+1 // 11998
A=A-1 // 11999
M=D // 12000
@30 // 12001
D=A // 12002
@SP // 12003
AM=M+1 // 12004
A=A-1 // 12005
M=D // 12006
@SP // 12007
AM=M+1 // 12008
A=A-1 // 12009
M=0 // 12010
@SP // 12011
AM=M+1 // 12012
A=A-1 // 12013
M=0 // 12014
// call Output.create
@17 // 12015
D=A // 12016
@14 // 12017
M=D // 12018
@Output.create // 12019
D=A // 12020
@13 // 12021
M=D // 12022
@Output.initMap.ret.72 // 12023
D=A // 12024
@CALL // 12025
0;JMP // 12026
(Output.initMap.ret.72)
@53 // 12027
D=A // 12028
@SP // 12029
AM=M+1 // 12030
A=A-1 // 12031
M=D // 12032
@63 // 12033
D=A // 12034
@SP // 12035
AM=M+1 // 12036
A=A-1 // 12037
M=D // 12038
@3 // 12039
D=A // 12040
@SP // 12041
AM=M+1 // 12042
A=A-1 // 12043
M=D // 12044
@3 // 12045
D=A // 12046
@SP // 12047
AM=M+1 // 12048
A=A-1 // 12049
M=D // 12050
@31 // 12051
D=A // 12052
@SP // 12053
AM=M+1 // 12054
A=A-1 // 12055
M=D // 12056
@48 // 12057
D=A // 12058
@SP // 12059
AM=M+1 // 12060
A=A-1 // 12061
M=D // 12062
@48 // 12063
D=A // 12064
@SP // 12065
AM=M+1 // 12066
A=A-1 // 12067
M=D // 12068
@48 // 12069
D=A // 12070
@SP // 12071
AM=M+1 // 12072
A=A-1 // 12073
M=D // 12074
@51 // 12075
D=A // 12076
@SP // 12077
AM=M+1 // 12078
A=A-1 // 12079
M=D // 12080
@30 // 12081
D=A // 12082
@SP // 12083
AM=M+1 // 12084
A=A-1 // 12085
M=D // 12086
@SP // 12087
AM=M+1 // 12088
A=A-1 // 12089
M=0 // 12090
@SP // 12091
AM=M+1 // 12092
A=A-1 // 12093
M=0 // 12094
// call Output.create
@17 // 12095
D=A // 12096
@14 // 12097
M=D // 12098
@Output.create // 12099
D=A // 12100
@13 // 12101
M=D // 12102
@Output.initMap.ret.73 // 12103
D=A // 12104
@CALL // 12105
0;JMP // 12106
(Output.initMap.ret.73)
@52 // 12107
D=A // 12108
@SP // 12109
AM=M+1 // 12110
A=A-1 // 12111
M=D // 12112
@16 // 12113
D=A // 12114
@SP // 12115
AM=M+1 // 12116
A=A-1 // 12117
M=D // 12118
@24 // 12119
D=A // 12120
@SP // 12121
AM=M+1 // 12122
A=A-1 // 12123
M=D // 12124
@28 // 12125
D=A // 12126
@SP // 12127
AM=M+1 // 12128
A=A-1 // 12129
M=D // 12130
@26 // 12131
D=A // 12132
@SP // 12133
AM=M+1 // 12134
A=A-1 // 12135
M=D // 12136
@25 // 12137
D=A // 12138
@SP // 12139
AM=M+1 // 12140
A=A-1 // 12141
M=D // 12142
@63 // 12143
D=A // 12144
@SP // 12145
AM=M+1 // 12146
A=A-1 // 12147
M=D // 12148
@24 // 12149
D=A // 12150
@SP // 12151
AM=M+1 // 12152
A=A-1 // 12153
M=D // 12154
@24 // 12155
D=A // 12156
@SP // 12157
AM=M+1 // 12158
A=A-1 // 12159
M=D // 12160
@60 // 12161
D=A // 12162
@SP // 12163
AM=M+1 // 12164
A=A-1 // 12165
M=D // 12166
@SP // 12167
AM=M+1 // 12168
A=A-1 // 12169
M=0 // 12170
@SP // 12171
AM=M+1 // 12172
A=A-1 // 12173
M=0 // 12174
// call Output.create
@17 // 12175
D=A // 12176
@14 // 12177
M=D // 12178
@Output.create // 12179
D=A // 12180
@13 // 12181
M=D // 12182
@Output.initMap.ret.74 // 12183
D=A // 12184
@CALL // 12185
0;JMP // 12186
(Output.initMap.ret.74)
@51 // 12187
D=A // 12188
@SP // 12189
AM=M+1 // 12190
A=A-1 // 12191
M=D // 12192
@30 // 12193
D=A // 12194
@SP // 12195
AM=M+1 // 12196
A=A-1 // 12197
M=D // 12198
@51 // 12199
D=A // 12200
@SP // 12201
AM=M+1 // 12202
A=A-1 // 12203
M=D // 12204
@48 // 12205
D=A // 12206
@SP // 12207
AM=M+1 // 12208
A=A-1 // 12209
M=D // 12210
@48 // 12211
D=A // 12212
@SP // 12213
AM=M+1 // 12214
A=A-1 // 12215
M=D // 12216
@28 // 12217
D=A // 12218
@SP // 12219
AM=M+1 // 12220
A=A-1 // 12221
M=D // 12222
@48 // 12223
D=A // 12224
@SP // 12225
AM=M+1 // 12226
A=A-1 // 12227
M=D // 12228
@48 // 12229
D=A // 12230
@SP // 12231
AM=M+1 // 12232
A=A-1 // 12233
M=D // 12234
@51 // 12235
D=A // 12236
@SP // 12237
AM=M+1 // 12238
A=A-1 // 12239
M=D // 12240
@30 // 12241
D=A // 12242
@SP // 12243
AM=M+1 // 12244
A=A-1 // 12245
M=D // 12246
@SP // 12247
AM=M+1 // 12248
A=A-1 // 12249
M=0 // 12250
@SP // 12251
AM=M+1 // 12252
A=A-1 // 12253
M=0 // 12254
// call Output.create
@17 // 12255
D=A // 12256
@14 // 12257
M=D // 12258
@Output.create // 12259
D=A // 12260
@13 // 12261
M=D // 12262
@Output.initMap.ret.75 // 12263
D=A // 12264
@CALL // 12265
0;JMP // 12266
(Output.initMap.ret.75)
@50 // 12267
D=A // 12268
@SP // 12269
AM=M+1 // 12270
A=A-1 // 12271
M=D // 12272
@30 // 12273
D=A // 12274
@SP // 12275
AM=M+1 // 12276
A=A-1 // 12277
M=D // 12278
@51 // 12279
D=A // 12280
@SP // 12281
AM=M+1 // 12282
A=A-1 // 12283
M=D // 12284
@48 // 12285
D=A // 12286
@SP // 12287
AM=M+1 // 12288
A=A-1 // 12289
M=D // 12290
@24 // 12291
D=A // 12292
@SP // 12293
AM=M+1 // 12294
A=A-1 // 12295
M=D // 12296
@12 // 12297
D=A // 12298
@SP // 12299
AM=M+1 // 12300
A=A-1 // 12301
M=D // 12302
@6 // 12303
D=A // 12304
@SP // 12305
AM=M+1 // 12306
A=A-1 // 12307
M=D // 12308
@3 // 12309
D=A // 12310
@SP // 12311
AM=M+1 // 12312
A=A-1 // 12313
M=D // 12314
@51 // 12315
D=A // 12316
@SP // 12317
AM=M+1 // 12318
A=A-1 // 12319
M=D // 12320
@63 // 12321
D=A // 12322
@SP // 12323
AM=M+1 // 12324
A=A-1 // 12325
M=D // 12326
@SP // 12327
AM=M+1 // 12328
A=A-1 // 12329
M=0 // 12330
@SP // 12331
AM=M+1 // 12332
A=A-1 // 12333
M=0 // 12334
// call Output.create
@17 // 12335
D=A // 12336
@14 // 12337
M=D // 12338
@Output.create // 12339
D=A // 12340
@13 // 12341
M=D // 12342
@Output.initMap.ret.76 // 12343
D=A // 12344
@CALL // 12345
0;JMP // 12346
(Output.initMap.ret.76)
@49 // 12347
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
@14 // 12359
D=A // 12360
@SP // 12361
AM=M+1 // 12362
A=A-1 // 12363
M=D // 12364
@15 // 12365
D=A // 12366
@SP // 12367
AM=M+1 // 12368
A=A-1 // 12369
M=D // 12370
@12 // 12371
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
@12 // 12395
D=A // 12396
@SP // 12397
AM=M+1 // 12398
A=A-1 // 12399
M=D // 12400
@63 // 12401
D=A // 12402
@SP // 12403
AM=M+1 // 12404
A=A-1 // 12405
M=D // 12406
@SP // 12407
AM=M+1 // 12408
A=A-1 // 12409
M=0 // 12410
@SP // 12411
AM=M+1 // 12412
A=A-1 // 12413
M=0 // 12414
// call Output.create
@17 // 12415
D=A // 12416
@14 // 12417
M=D // 12418
@Output.create // 12419
D=A // 12420
@13 // 12421
M=D // 12422
@Output.initMap.ret.77 // 12423
D=A // 12424
@CALL // 12425
0;JMP // 12426
(Output.initMap.ret.77)
@48 // 12427
D=A // 12428
@SP // 12429
AM=M+1 // 12430
A=A-1 // 12431
M=D // 12432
@12 // 12433
D=A // 12434
@SP // 12435
AM=M+1 // 12436
A=A-1 // 12437
M=D // 12438
@30 // 12439
D=A // 12440
@SP // 12441
AM=M+1 // 12442
A=A-1 // 12443
M=D // 12444
@51 // 12445
D=A // 12446
@SP // 12447
AM=M+1 // 12448
A=A-1 // 12449
M=D // 12450
@51 // 12451
D=A // 12452
@SP // 12453
AM=M+1 // 12454
A=A-1 // 12455
M=D // 12456
@51 // 12457
D=A // 12458
@SP // 12459
AM=M+1 // 12460
A=A-1 // 12461
M=D // 12462
@51 // 12463
D=A // 12464
@SP // 12465
AM=M+1 // 12466
A=A-1 // 12467
M=D // 12468
@51 // 12469
D=A // 12470
@SP // 12471
AM=M+1 // 12472
A=A-1 // 12473
M=D // 12474
@30 // 12475
D=A // 12476
@SP // 12477
AM=M+1 // 12478
A=A-1 // 12479
M=D // 12480
@12 // 12481
D=A // 12482
@SP // 12483
AM=M+1 // 12484
A=A-1 // 12485
M=D // 12486
@SP // 12487
AM=M+1 // 12488
A=A-1 // 12489
M=0 // 12490
@SP // 12491
AM=M+1 // 12492
A=A-1 // 12493
M=0 // 12494
// call Output.create
@17 // 12495
D=A // 12496
@14 // 12497
M=D // 12498
@Output.create // 12499
D=A // 12500
@13 // 12501
M=D // 12502
@Output.initMap.ret.78 // 12503
D=A // 12504
@CALL // 12505
0;JMP // 12506
(Output.initMap.ret.78)
@47 // 12507
D=A // 12508
@SP // 12509
AM=M+1 // 12510
A=A-1 // 12511
M=D // 12512
@SP // 12513
AM=M+1 // 12514
A=A-1 // 12515
M=0 // 12516
@SP // 12517
AM=M+1 // 12518
A=A-1 // 12519
M=0 // 12520
@32 // 12521
D=A // 12522
@SP // 12523
AM=M+1 // 12524
A=A-1 // 12525
M=D // 12526
@48 // 12527
D=A // 12528
@SP // 12529
AM=M+1 // 12530
A=A-1 // 12531
M=D // 12532
@24 // 12533
D=A // 12534
@SP // 12535
AM=M+1 // 12536
A=A-1 // 12537
M=D // 12538
@12 // 12539
D=A // 12540
@SP // 12541
AM=M+1 // 12542
A=A-1 // 12543
M=D // 12544
@6 // 12545
D=A // 12546
@SP // 12547
AM=M+1 // 12548
A=A-1 // 12549
M=D // 12550
@3 // 12551
D=A // 12552
@SP // 12553
AM=M+1 // 12554
A=A-1 // 12555
M=D // 12556
@SP // 12557
AM=M+1 // 12558
A=A-1 // 12559
M=1 // 12560
@SP // 12561
AM=M+1 // 12562
A=A-1 // 12563
M=0 // 12564
@SP // 12565
AM=M+1 // 12566
A=A-1 // 12567
M=0 // 12568
// call Output.create
@17 // 12569
D=A // 12570
@14 // 12571
M=D // 12572
@Output.create // 12573
D=A // 12574
@13 // 12575
M=D // 12576
@Output.initMap.ret.79 // 12577
D=A // 12578
@CALL // 12579
0;JMP // 12580
(Output.initMap.ret.79)
@46 // 12581
D=A // 12582
@SP // 12583
AM=M+1 // 12584
A=A-1 // 12585
M=D // 12586
@SP // 12587
AM=M+1 // 12588
A=A-1 // 12589
M=0 // 12590
@SP // 12591
AM=M+1 // 12592
A=A-1 // 12593
M=0 // 12594
@SP // 12595
AM=M+1 // 12596
A=A-1 // 12597
M=0 // 12598
@SP // 12599
AM=M+1 // 12600
A=A-1 // 12601
M=0 // 12602
@SP // 12603
AM=M+1 // 12604
A=A-1 // 12605
M=0 // 12606
@SP // 12607
AM=M+1 // 12608
A=A-1 // 12609
M=0 // 12610
@SP // 12611
AM=M+1 // 12612
A=A-1 // 12613
M=0 // 12614
@12 // 12615
D=A // 12616
@SP // 12617
AM=M+1 // 12618
A=A-1 // 12619
M=D // 12620
@12 // 12621
D=A // 12622
@SP // 12623
AM=M+1 // 12624
A=A-1 // 12625
M=D // 12626
@SP // 12627
AM=M+1 // 12628
A=A-1 // 12629
M=0 // 12630
@SP // 12631
AM=M+1 // 12632
A=A-1 // 12633
M=0 // 12634
// call Output.create
@17 // 12635
D=A // 12636
@14 // 12637
M=D // 12638
@Output.create // 12639
D=A // 12640
@13 // 12641
M=D // 12642
@Output.initMap.ret.80 // 12643
D=A // 12644
@CALL // 12645
0;JMP // 12646
(Output.initMap.ret.80)
@45 // 12647
D=A // 12648
@SP // 12649
AM=M+1 // 12650
A=A-1 // 12651
M=D // 12652
@SP // 12653
AM=M+1 // 12654
A=A-1 // 12655
M=0 // 12656
@SP // 12657
AM=M+1 // 12658
A=A-1 // 12659
M=0 // 12660
@SP // 12661
AM=M+1 // 12662
A=A-1 // 12663
M=0 // 12664
@SP // 12665
AM=M+1 // 12666
A=A-1 // 12667
M=0 // 12668
@SP // 12669
AM=M+1 // 12670
A=A-1 // 12671
M=0 // 12672
@63 // 12673
D=A // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=D // 12678
@SP // 12679
AM=M+1 // 12680
A=A-1 // 12681
M=0 // 12682
@SP // 12683
AM=M+1 // 12684
A=A-1 // 12685
M=0 // 12686
@SP // 12687
AM=M+1 // 12688
A=A-1 // 12689
M=0 // 12690
@SP // 12691
AM=M+1 // 12692
A=A-1 // 12693
M=0 // 12694
@SP // 12695
AM=M+1 // 12696
A=A-1 // 12697
M=0 // 12698
// call Output.create
@17 // 12699
D=A // 12700
@14 // 12701
M=D // 12702
@Output.create // 12703
D=A // 12704
@13 // 12705
M=D // 12706
@Output.initMap.ret.81 // 12707
D=A // 12708
@CALL // 12709
0;JMP // 12710
(Output.initMap.ret.81)
@44 // 12711
D=A // 12712
@SP // 12713
AM=M+1 // 12714
A=A-1 // 12715
M=D // 12716
@SP // 12717
AM=M+1 // 12718
A=A-1 // 12719
M=0 // 12720
@SP // 12721
AM=M+1 // 12722
A=A-1 // 12723
M=0 // 12724
@SP // 12725
AM=M+1 // 12726
A=A-1 // 12727
M=0 // 12728
@SP // 12729
AM=M+1 // 12730
A=A-1 // 12731
M=0 // 12732
@SP // 12733
AM=M+1 // 12734
A=A-1 // 12735
M=0 // 12736
@SP // 12737
AM=M+1 // 12738
A=A-1 // 12739
M=0 // 12740
@SP // 12741
AM=M+1 // 12742
A=A-1 // 12743
M=0 // 12744
@12 // 12745
D=A // 12746
@SP // 12747
AM=M+1 // 12748
A=A-1 // 12749
M=D // 12750
@12 // 12751
D=A // 12752
@SP // 12753
AM=M+1 // 12754
A=A-1 // 12755
M=D // 12756
@6 // 12757
D=A // 12758
@SP // 12759
AM=M+1 // 12760
A=A-1 // 12761
M=D // 12762
@SP // 12763
AM=M+1 // 12764
A=A-1 // 12765
M=0 // 12766
// call Output.create
@17 // 12767
D=A // 12768
@14 // 12769
M=D // 12770
@Output.create // 12771
D=A // 12772
@13 // 12773
M=D // 12774
@Output.initMap.ret.82 // 12775
D=A // 12776
@CALL // 12777
0;JMP // 12778
(Output.initMap.ret.82)
@43 // 12779
D=A // 12780
@SP // 12781
AM=M+1 // 12782
A=A-1 // 12783
M=D // 12784
@SP // 12785
AM=M+1 // 12786
A=A-1 // 12787
M=0 // 12788
@SP // 12789
AM=M+1 // 12790
A=A-1 // 12791
M=0 // 12792
@SP // 12793
AM=M+1 // 12794
A=A-1 // 12795
M=0 // 12796
@12 // 12797
D=A // 12798
@SP // 12799
AM=M+1 // 12800
A=A-1 // 12801
M=D // 12802
@12 // 12803
D=A // 12804
@SP // 12805
AM=M+1 // 12806
A=A-1 // 12807
M=D // 12808
@63 // 12809
D=A // 12810
@SP // 12811
AM=M+1 // 12812
A=A-1 // 12813
M=D // 12814
@12 // 12815
D=A // 12816
@SP // 12817
AM=M+1 // 12818
A=A-1 // 12819
M=D // 12820
@12 // 12821
D=A // 12822
@SP // 12823
AM=M+1 // 12824
A=A-1 // 12825
M=D // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=0 // 12830
@SP // 12831
AM=M+1 // 12832
A=A-1 // 12833
M=0 // 12834
@SP // 12835
AM=M+1 // 12836
A=A-1 // 12837
M=0 // 12838
// call Output.create
@17 // 12839
D=A // 12840
@14 // 12841
M=D // 12842
@Output.create // 12843
D=A // 12844
@13 // 12845
M=D // 12846
@Output.initMap.ret.83 // 12847
D=A // 12848
@CALL // 12849
0;JMP // 12850
(Output.initMap.ret.83)
@42 // 12851
D=A // 12852
@SP // 12853
AM=M+1 // 12854
A=A-1 // 12855
M=D // 12856
@SP // 12857
AM=M+1 // 12858
A=A-1 // 12859
M=0 // 12860
@SP // 12861
AM=M+1 // 12862
A=A-1 // 12863
M=0 // 12864
@SP // 12865
AM=M+1 // 12866
A=A-1 // 12867
M=0 // 12868
@51 // 12869
D=A // 12870
@SP // 12871
AM=M+1 // 12872
A=A-1 // 12873
M=D // 12874
@30 // 12875
D=A // 12876
@SP // 12877
AM=M+1 // 12878
A=A-1 // 12879
M=D // 12880
@63 // 12881
D=A // 12882
@SP // 12883
AM=M+1 // 12884
A=A-1 // 12885
M=D // 12886
@30 // 12887
D=A // 12888
@SP // 12889
AM=M+1 // 12890
A=A-1 // 12891
M=D // 12892
@51 // 12893
D=A // 12894
@SP // 12895
AM=M+1 // 12896
A=A-1 // 12897
M=D // 12898
@SP // 12899
AM=M+1 // 12900
A=A-1 // 12901
M=0 // 12902
@SP // 12903
AM=M+1 // 12904
A=A-1 // 12905
M=0 // 12906
@SP // 12907
AM=M+1 // 12908
A=A-1 // 12909
M=0 // 12910
// call Output.create
@17 // 12911
D=A // 12912
@14 // 12913
M=D // 12914
@Output.create // 12915
D=A // 12916
@13 // 12917
M=D // 12918
@Output.initMap.ret.84 // 12919
D=A // 12920
@CALL // 12921
0;JMP // 12922
(Output.initMap.ret.84)
@41 // 12923
D=A // 12924
@SP // 12925
AM=M+1 // 12926
A=A-1 // 12927
M=D // 12928
@6 // 12929
D=A // 12930
@SP // 12931
AM=M+1 // 12932
A=A-1 // 12933
M=D // 12934
@12 // 12935
D=A // 12936
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=D // 12940
@24 // 12941
D=A // 12942
@SP // 12943
AM=M+1 // 12944
A=A-1 // 12945
M=D // 12946
@24 // 12947
D=A // 12948
@SP // 12949
AM=M+1 // 12950
A=A-1 // 12951
M=D // 12952
@24 // 12953
D=A // 12954
@SP // 12955
AM=M+1 // 12956
A=A-1 // 12957
M=D // 12958
@24 // 12959
D=A // 12960
@SP // 12961
AM=M+1 // 12962
A=A-1 // 12963
M=D // 12964
@24 // 12965
D=A // 12966
@SP // 12967
AM=M+1 // 12968
A=A-1 // 12969
M=D // 12970
@12 // 12971
D=A // 12972
@SP // 12973
AM=M+1 // 12974
A=A-1 // 12975
M=D // 12976
@6 // 12977
D=A // 12978
@SP // 12979
AM=M+1 // 12980
A=A-1 // 12981
M=D // 12982
@SP // 12983
AM=M+1 // 12984
A=A-1 // 12985
M=0 // 12986
@SP // 12987
AM=M+1 // 12988
A=A-1 // 12989
M=0 // 12990
// call Output.create
@17 // 12991
D=A // 12992
@14 // 12993
M=D // 12994
@Output.create // 12995
D=A // 12996
@13 // 12997
M=D // 12998
@Output.initMap.ret.85 // 12999
D=A // 13000
@CALL // 13001
0;JMP // 13002
(Output.initMap.ret.85)
@40 // 13003
D=A // 13004
@SP // 13005
AM=M+1 // 13006
A=A-1 // 13007
M=D // 13008
@24 // 13009
D=A // 13010
@SP // 13011
AM=M+1 // 13012
A=A-1 // 13013
M=D // 13014
@12 // 13015
D=A // 13016
@SP // 13017
AM=M+1 // 13018
A=A-1 // 13019
M=D // 13020
@6 // 13021
D=A // 13022
@SP // 13023
AM=M+1 // 13024
A=A-1 // 13025
M=D // 13026
@6 // 13027
D=A // 13028
@SP // 13029
AM=M+1 // 13030
A=A-1 // 13031
M=D // 13032
@6 // 13033
D=A // 13034
@SP // 13035
AM=M+1 // 13036
A=A-1 // 13037
M=D // 13038
@6 // 13039
D=A // 13040
@SP // 13041
AM=M+1 // 13042
A=A-1 // 13043
M=D // 13044
@6 // 13045
D=A // 13046
@SP // 13047
AM=M+1 // 13048
A=A-1 // 13049
M=D // 13050
@12 // 13051
D=A // 13052
@SP // 13053
AM=M+1 // 13054
A=A-1 // 13055
M=D // 13056
@24 // 13057
D=A // 13058
@SP // 13059
AM=M+1 // 13060
A=A-1 // 13061
M=D // 13062
@SP // 13063
AM=M+1 // 13064
A=A-1 // 13065
M=0 // 13066
@SP // 13067
AM=M+1 // 13068
A=A-1 // 13069
M=0 // 13070
// call Output.create
@17 // 13071
D=A // 13072
@14 // 13073
M=D // 13074
@Output.create // 13075
D=A // 13076
@13 // 13077
M=D // 13078
@Output.initMap.ret.86 // 13079
D=A // 13080
@CALL // 13081
0;JMP // 13082
(Output.initMap.ret.86)
@39 // 13083
D=A // 13084
@SP // 13085
AM=M+1 // 13086
A=A-1 // 13087
M=D // 13088
@12 // 13089
D=A // 13090
@SP // 13091
AM=M+1 // 13092
A=A-1 // 13093
M=D // 13094
@12 // 13095
D=A // 13096
@SP // 13097
AM=M+1 // 13098
A=A-1 // 13099
M=D // 13100
@6 // 13101
D=A // 13102
@SP // 13103
AM=M+1 // 13104
A=A-1 // 13105
M=D // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=0 // 13110
@SP // 13111
AM=M+1 // 13112
A=A-1 // 13113
M=0 // 13114
@SP // 13115
AM=M+1 // 13116
A=A-1 // 13117
M=0 // 13118
@SP // 13119
AM=M+1 // 13120
A=A-1 // 13121
M=0 // 13122
@SP // 13123
AM=M+1 // 13124
A=A-1 // 13125
M=0 // 13126
@SP // 13127
AM=M+1 // 13128
A=A-1 // 13129
M=0 // 13130
@SP // 13131
AM=M+1 // 13132
A=A-1 // 13133
M=0 // 13134
@SP // 13135
AM=M+1 // 13136
A=A-1 // 13137
M=0 // 13138
// call Output.create
@17 // 13139
D=A // 13140
@14 // 13141
M=D // 13142
@Output.create // 13143
D=A // 13144
@13 // 13145
M=D // 13146
@Output.initMap.ret.87 // 13147
D=A // 13148
@CALL // 13149
0;JMP // 13150
(Output.initMap.ret.87)
@38 // 13151
D=A // 13152
@SP // 13153
AM=M+1 // 13154
A=A-1 // 13155
M=D // 13156
@12 // 13157
D=A // 13158
@SP // 13159
AM=M+1 // 13160
A=A-1 // 13161
M=D // 13162
@30 // 13163
D=A // 13164
@SP // 13165
AM=M+1 // 13166
A=A-1 // 13167
M=D // 13168
@30 // 13169
D=A // 13170
@SP // 13171
AM=M+1 // 13172
A=A-1 // 13173
M=D // 13174
@12 // 13175
D=A // 13176
@SP // 13177
AM=M+1 // 13178
A=A-1 // 13179
M=D // 13180
@54 // 13181
D=A // 13182
@SP // 13183
AM=M+1 // 13184
A=A-1 // 13185
M=D // 13186
@27 // 13187
D=A // 13188
@SP // 13189
AM=M+1 // 13190
A=A-1 // 13191
M=D // 13192
@27 // 13193
D=A // 13194
@SP // 13195
AM=M+1 // 13196
A=A-1 // 13197
M=D // 13198
@27 // 13199
D=A // 13200
@SP // 13201
AM=M+1 // 13202
A=A-1 // 13203
M=D // 13204
@54 // 13205
D=A // 13206
@SP // 13207
AM=M+1 // 13208
A=A-1 // 13209
M=D // 13210
@SP // 13211
AM=M+1 // 13212
A=A-1 // 13213
M=0 // 13214
@SP // 13215
AM=M+1 // 13216
A=A-1 // 13217
M=0 // 13218
// call Output.create
@17 // 13219
D=A // 13220
@14 // 13221
M=D // 13222
@Output.create // 13223
D=A // 13224
@13 // 13225
M=D // 13226
@Output.initMap.ret.88 // 13227
D=A // 13228
@CALL // 13229
0;JMP // 13230
(Output.initMap.ret.88)
@37 // 13231
D=A // 13232
@SP // 13233
AM=M+1 // 13234
A=A-1 // 13235
M=D // 13236
@SP // 13237
AM=M+1 // 13238
A=A-1 // 13239
M=0 // 13240
@SP // 13241
AM=M+1 // 13242
A=A-1 // 13243
M=0 // 13244
@35 // 13245
D=A // 13246
@SP // 13247
AM=M+1 // 13248
A=A-1 // 13249
M=D // 13250
@51 // 13251
D=A // 13252
@SP // 13253
AM=M+1 // 13254
A=A-1 // 13255
M=D // 13256
@24 // 13257
D=A // 13258
@SP // 13259
AM=M+1 // 13260
A=A-1 // 13261
M=D // 13262
@12 // 13263
D=A // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268
@6 // 13269
D=A // 13270
@SP // 13271
AM=M+1 // 13272
A=A-1 // 13273
M=D // 13274
@51 // 13275
D=A // 13276
@SP // 13277
AM=M+1 // 13278
A=A-1 // 13279
M=D // 13280
@49 // 13281
D=A // 13282
@SP // 13283
AM=M+1 // 13284
A=A-1 // 13285
M=D // 13286
@SP // 13287
AM=M+1 // 13288
A=A-1 // 13289
M=0 // 13290
@SP // 13291
AM=M+1 // 13292
A=A-1 // 13293
M=0 // 13294
// call Output.create
@17 // 13295
D=A // 13296
@14 // 13297
M=D // 13298
@Output.create // 13299
D=A // 13300
@13 // 13301
M=D // 13302
@Output.initMap.ret.89 // 13303
D=A // 13304
@CALL // 13305
0;JMP // 13306
(Output.initMap.ret.89)
@36 // 13307
D=A // 13308
@SP // 13309
AM=M+1 // 13310
A=A-1 // 13311
M=D // 13312
@12 // 13313
D=A // 13314
@SP // 13315
AM=M+1 // 13316
A=A-1 // 13317
M=D // 13318
@30 // 13319
D=A // 13320
@SP // 13321
AM=M+1 // 13322
A=A-1 // 13323
M=D // 13324
@51 // 13325
D=A // 13326
@SP // 13327
AM=M+1 // 13328
A=A-1 // 13329
M=D // 13330
@3 // 13331
D=A // 13332
@SP // 13333
AM=M+1 // 13334
A=A-1 // 13335
M=D // 13336
@30 // 13337
D=A // 13338
@SP // 13339
AM=M+1 // 13340
A=A-1 // 13341
M=D // 13342
@48 // 13343
D=A // 13344
@SP // 13345
AM=M+1 // 13346
A=A-1 // 13347
M=D // 13348
@51 // 13349
D=A // 13350
@SP // 13351
AM=M+1 // 13352
A=A-1 // 13353
M=D // 13354
@30 // 13355
D=A // 13356
@SP // 13357
AM=M+1 // 13358
A=A-1 // 13359
M=D // 13360
@12 // 13361
D=A // 13362
@SP // 13363
AM=M+1 // 13364
A=A-1 // 13365
M=D // 13366
@12 // 13367
D=A // 13368
@SP // 13369
AM=M+1 // 13370
A=A-1 // 13371
M=D // 13372
@SP // 13373
AM=M+1 // 13374
A=A-1 // 13375
M=0 // 13376
// call Output.create
@17 // 13377
D=A // 13378
@14 // 13379
M=D // 13380
@Output.create // 13381
D=A // 13382
@13 // 13383
M=D // 13384
@Output.initMap.ret.90 // 13385
D=A // 13386
@CALL // 13387
0;JMP // 13388
(Output.initMap.ret.90)
@35 // 13389
D=A // 13390
@SP // 13391
AM=M+1 // 13392
A=A-1 // 13393
M=D // 13394
@SP // 13395
AM=M+1 // 13396
A=A-1 // 13397
M=0 // 13398
@18 // 13399
D=A // 13400
@SP // 13401
AM=M+1 // 13402
A=A-1 // 13403
M=D // 13404
@18 // 13405
D=A // 13406
@SP // 13407
AM=M+1 // 13408
A=A-1 // 13409
M=D // 13410
@63 // 13411
D=A // 13412
@SP // 13413
AM=M+1 // 13414
A=A-1 // 13415
M=D // 13416
@18 // 13417
D=A // 13418
@SP // 13419
AM=M+1 // 13420
A=A-1 // 13421
M=D // 13422
@18 // 13423
D=A // 13424
@SP // 13425
AM=M+1 // 13426
A=A-1 // 13427
M=D // 13428
@63 // 13429
D=A // 13430
@SP // 13431
AM=M+1 // 13432
A=A-1 // 13433
M=D // 13434
@18 // 13435
D=A // 13436
@SP // 13437
AM=M+1 // 13438
A=A-1 // 13439
M=D // 13440
@18 // 13441
D=A // 13442
@SP // 13443
AM=M+1 // 13444
A=A-1 // 13445
M=D // 13446
@SP // 13447
AM=M+1 // 13448
A=A-1 // 13449
M=0 // 13450
@SP // 13451
AM=M+1 // 13452
A=A-1 // 13453
M=0 // 13454
// call Output.create
@17 // 13455
D=A // 13456
@14 // 13457
M=D // 13458
@Output.create // 13459
D=A // 13460
@13 // 13461
M=D // 13462
@Output.initMap.ret.91 // 13463
D=A // 13464
@CALL // 13465
0;JMP // 13466
(Output.initMap.ret.91)
@34 // 13467
D=A // 13468
@SP // 13469
AM=M+1 // 13470
A=A-1 // 13471
M=D // 13472
@54 // 13473
D=A // 13474
@SP // 13475
AM=M+1 // 13476
A=A-1 // 13477
M=D // 13478
@54 // 13479
D=A // 13480
@SP // 13481
AM=M+1 // 13482
A=A-1 // 13483
M=D // 13484
@20 // 13485
D=A // 13486
@SP // 13487
AM=M+1 // 13488
A=A-1 // 13489
M=D // 13490
@SP // 13491
AM=M+1 // 13492
A=A-1 // 13493
M=0 // 13494
@SP // 13495
AM=M+1 // 13496
A=A-1 // 13497
M=0 // 13498
@SP // 13499
AM=M+1 // 13500
A=A-1 // 13501
M=0 // 13502
@SP // 13503
AM=M+1 // 13504
A=A-1 // 13505
M=0 // 13506
@SP // 13507
AM=M+1 // 13508
A=A-1 // 13509
M=0 // 13510
@SP // 13511
AM=M+1 // 13512
A=A-1 // 13513
M=0 // 13514
@SP // 13515
AM=M+1 // 13516
A=A-1 // 13517
M=0 // 13518
@SP // 13519
AM=M+1 // 13520
A=A-1 // 13521
M=0 // 13522
// call Output.create
@17 // 13523
D=A // 13524
@14 // 13525
M=D // 13526
@Output.create // 13527
D=A // 13528
@13 // 13529
M=D // 13530
@Output.initMap.ret.92 // 13531
D=A // 13532
@CALL // 13533
0;JMP // 13534
(Output.initMap.ret.92)
@33 // 13535
D=A // 13536
@SP // 13537
AM=M+1 // 13538
A=A-1 // 13539
M=D // 13540
@12 // 13541
D=A // 13542
@SP // 13543
AM=M+1 // 13544
A=A-1 // 13545
M=D // 13546
@30 // 13547
D=A // 13548
@SP // 13549
AM=M+1 // 13550
A=A-1 // 13551
M=D // 13552
@30 // 13553
D=A // 13554
@SP // 13555
AM=M+1 // 13556
A=A-1 // 13557
M=D // 13558
@30 // 13559
D=A // 13560
@SP // 13561
AM=M+1 // 13562
A=A-1 // 13563
M=D // 13564
@12 // 13565
D=A // 13566
@SP // 13567
AM=M+1 // 13568
A=A-1 // 13569
M=D // 13570
@12 // 13571
D=A // 13572
@SP // 13573
AM=M+1 // 13574
A=A-1 // 13575
M=D // 13576
@SP // 13577
AM=M+1 // 13578
A=A-1 // 13579
M=0 // 13580
@12 // 13581
D=A // 13582
@SP // 13583
AM=M+1 // 13584
A=A-1 // 13585
M=D // 13586
@12 // 13587
D=A // 13588
@SP // 13589
AM=M+1 // 13590
A=A-1 // 13591
M=D // 13592
@SP // 13593
AM=M+1 // 13594
A=A-1 // 13595
M=0 // 13596
@SP // 13597
AM=M+1 // 13598
A=A-1 // 13599
M=0 // 13600
// call Output.create
@17 // 13601
D=A // 13602
@14 // 13603
M=D // 13604
@Output.create // 13605
D=A // 13606
@13 // 13607
M=D // 13608
@Output.initMap.ret.93 // 13609
D=A // 13610
@CALL // 13611
0;JMP // 13612
(Output.initMap.ret.93)
@32 // 13613
D=A // 13614
@SP // 13615
AM=M+1 // 13616
A=A-1 // 13617
M=D // 13618
@SP // 13619
AM=M+1 // 13620
A=A-1 // 13621
M=0 // 13622
@SP // 13623
AM=M+1 // 13624
A=A-1 // 13625
M=0 // 13626
@SP // 13627
AM=M+1 // 13628
A=A-1 // 13629
M=0 // 13630
@SP // 13631
AM=M+1 // 13632
A=A-1 // 13633
M=0 // 13634
@SP // 13635
AM=M+1 // 13636
A=A-1 // 13637
M=0 // 13638
@SP // 13639
AM=M+1 // 13640
A=A-1 // 13641
M=0 // 13642
@SP // 13643
AM=M+1 // 13644
A=A-1 // 13645
M=0 // 13646
@SP // 13647
AM=M+1 // 13648
A=A-1 // 13649
M=0 // 13650
@SP // 13651
AM=M+1 // 13652
A=A-1 // 13653
M=0 // 13654
@SP // 13655
AM=M+1 // 13656
A=A-1 // 13657
M=0 // 13658
@SP // 13659
AM=M+1 // 13660
A=A-1 // 13661
M=0 // 13662
// call Output.create
@17 // 13663
D=A // 13664
@14 // 13665
M=D // 13666
@Output.create // 13667
D=A // 13668
@13 // 13669
M=D // 13670
@Output.initMap.ret.94 // 13671
D=A // 13672
@CALL // 13673
0;JMP // 13674
(Output.initMap.ret.94)
@SP // 13675
AM=M+1 // 13676
A=A-1 // 13677
M=0 // 13678
@63 // 13679
D=A // 13680
@SP // 13681
AM=M+1 // 13682
A=A-1 // 13683
M=D // 13684
@63 // 13685
D=A // 13686
@SP // 13687
AM=M+1 // 13688
A=A-1 // 13689
M=D // 13690
@63 // 13691
D=A // 13692
@SP // 13693
AM=M+1 // 13694
A=A-1 // 13695
M=D // 13696
@63 // 13697
D=A // 13698
@SP // 13699
AM=M+1 // 13700
A=A-1 // 13701
M=D // 13702
@63 // 13703
D=A // 13704
@SP // 13705
AM=M+1 // 13706
A=A-1 // 13707
M=D // 13708
@63 // 13709
D=A // 13710
@SP // 13711
AM=M+1 // 13712
A=A-1 // 13713
M=D // 13714
@63 // 13715
D=A // 13716
@SP // 13717
AM=M+1 // 13718
A=A-1 // 13719
M=D // 13720
@63 // 13721
D=A // 13722
@SP // 13723
AM=M+1 // 13724
A=A-1 // 13725
M=D // 13726
@63 // 13727
D=A // 13728
@SP // 13729
AM=M+1 // 13730
A=A-1 // 13731
M=D // 13732
@SP // 13733
AM=M+1 // 13734
A=A-1 // 13735
M=0 // 13736
@SP // 13737
AM=M+1 // 13738
A=A-1 // 13739
M=0 // 13740
// call Output.create
@17 // 13741
D=A // 13742
@14 // 13743
M=D // 13744
@Output.create // 13745
D=A // 13746
@13 // 13747
M=D // 13748
@Output.initMap.ret.95 // 13749
D=A // 13750
@CALL // 13751
0;JMP // 13752
(Output.initMap.ret.95)
@127 // 13753
D=A // 13754
@SP // 13755
AM=M+1 // 13756
A=A-1 // 13757
M=D // 13758
// call Array.new
@6 // 13759
D=A // 13760
@14 // 13761
M=D // 13762
@Array.new // 13763
D=A // 13764
@13 // 13765
M=D // 13766
@Output.initMap.ret.96 // 13767
D=A // 13768
@CALL // 13769
0;JMP // 13770
(Output.initMap.ret.96)
@SP // 13771
AM=M-1 // 13772
D=M // 13773
@Output.0 // 13774
M=D // 13775
@SP // 13776
AM=M-1 // 13777
D=M // 13778
@5 // 13779
M=D // 13780
@SP // 13781
AM=M-1 // 13782
D=M // 13783
@5 // 13784
M=D // 13785
@SP // 13786
AM=M-1 // 13787
D=M // 13788
@5 // 13789
M=D // 13790
@SP // 13791
AM=M-1 // 13792
D=M // 13793
@5 // 13794
M=D // 13795
@SP // 13796
AM=M-1 // 13797
D=M // 13798
@5 // 13799
M=D // 13800
@SP // 13801
AM=M-1 // 13802
D=M // 13803
@5 // 13804
M=D // 13805
@SP // 13806
AM=M-1 // 13807
D=M // 13808
@5 // 13809
M=D // 13810
@SP // 13811
AM=M-1 // 13812
D=M // 13813
@5 // 13814
M=D // 13815
@SP // 13816
AM=M-1 // 13817
D=M // 13818
@5 // 13819
M=D // 13820
@SP // 13821
AM=M-1 // 13822
D=M // 13823
@5 // 13824
M=D // 13825
@SP // 13826
AM=M-1 // 13827
D=M // 13828
@5 // 13829
M=D // 13830
@SP // 13831
AM=M-1 // 13832
D=M // 13833
@5 // 13834
M=D // 13835
@SP // 13836
AM=M-1 // 13837
D=M // 13838
@5 // 13839
M=D // 13840
@SP // 13841
AM=M-1 // 13842
D=M // 13843
@5 // 13844
M=D // 13845
@SP // 13846
AM=M-1 // 13847
D=M // 13848
@5 // 13849
M=D // 13850
@SP // 13851
AM=M-1 // 13852
D=M // 13853
@5 // 13854
M=D // 13855
@SP // 13856
AM=M-1 // 13857
D=M // 13858
@5 // 13859
M=D // 13860
@SP // 13861
AM=M-1 // 13862
D=M // 13863
@5 // 13864
M=D // 13865
@SP // 13866
AM=M-1 // 13867
D=M // 13868
@5 // 13869
M=D // 13870
@SP // 13871
AM=M-1 // 13872
D=M // 13873
@5 // 13874
M=D // 13875
@SP // 13876
AM=M-1 // 13877
D=M // 13878
@5 // 13879
M=D // 13880
@SP // 13881
AM=M-1 // 13882
D=M // 13883
@5 // 13884
M=D // 13885
@SP // 13886
AM=M-1 // 13887
D=M // 13888
@5 // 13889
M=D // 13890
@SP // 13891
AM=M-1 // 13892
D=M // 13893
@5 // 13894
M=D // 13895
@SP // 13896
AM=M-1 // 13897
D=M // 13898
@5 // 13899
M=D // 13900
@SP // 13901
AM=M-1 // 13902
D=M // 13903
@5 // 13904
M=D // 13905
@SP // 13906
AM=M-1 // 13907
D=M // 13908
@5 // 13909
M=D // 13910
@SP // 13911
AM=M-1 // 13912
D=M // 13913
@5 // 13914
M=D // 13915
@SP // 13916
AM=M-1 // 13917
D=M // 13918
@5 // 13919
M=D // 13920
@SP // 13921
AM=M-1 // 13922
D=M // 13923
@5 // 13924
M=D // 13925
@SP // 13926
AM=M-1 // 13927
D=M // 13928
@5 // 13929
M=D // 13930
@SP // 13931
AM=M-1 // 13932
D=M // 13933
@5 // 13934
M=D // 13935
@SP // 13936
AM=M-1 // 13937
D=M // 13938
@5 // 13939
M=D // 13940
@SP // 13941
AM=M-1 // 13942
D=M // 13943
@5 // 13944
M=D // 13945
@SP // 13946
AM=M-1 // 13947
D=M // 13948
@5 // 13949
M=D // 13950
@SP // 13951
AM=M-1 // 13952
D=M // 13953
@5 // 13954
M=D // 13955
@SP // 13956
AM=M-1 // 13957
D=M // 13958
@5 // 13959
M=D // 13960
@SP // 13961
AM=M-1 // 13962
D=M // 13963
@5 // 13964
M=D // 13965
@SP // 13966
AM=M-1 // 13967
D=M // 13968
@5 // 13969
M=D // 13970
@SP // 13971
AM=M-1 // 13972
D=M // 13973
@5 // 13974
M=D // 13975
@SP // 13976
AM=M-1 // 13977
D=M // 13978
@5 // 13979
M=D // 13980
@SP // 13981
AM=M-1 // 13982
D=M // 13983
@5 // 13984
M=D // 13985
@SP // 13986
AM=M-1 // 13987
D=M // 13988
@5 // 13989
M=D // 13990
@SP // 13991
AM=M-1 // 13992
D=M // 13993
@5 // 13994
M=D // 13995
@SP // 13996
AM=M-1 // 13997
D=M // 13998
@5 // 13999
M=D // 14000
@SP // 14001
AM=M-1 // 14002
D=M // 14003
@5 // 14004
M=D // 14005
@SP // 14006
AM=M-1 // 14007
D=M // 14008
@5 // 14009
M=D // 14010
@SP // 14011
AM=M-1 // 14012
D=M // 14013
@5 // 14014
M=D // 14015
@SP // 14016
AM=M-1 // 14017
D=M // 14018
@5 // 14019
M=D // 14020
@SP // 14021
AM=M-1 // 14022
D=M // 14023
@5 // 14024
M=D // 14025
@SP // 14026
AM=M-1 // 14027
D=M // 14028
@5 // 14029
M=D // 14030
@SP // 14031
AM=M-1 // 14032
D=M // 14033
@5 // 14034
M=D // 14035
@SP // 14036
AM=M-1 // 14037
D=M // 14038
@5 // 14039
M=D // 14040
@SP // 14041
AM=M-1 // 14042
D=M // 14043
@5 // 14044
M=D // 14045
@SP // 14046
AM=M-1 // 14047
D=M // 14048
@5 // 14049
M=D // 14050
@SP // 14051
AM=M-1 // 14052
D=M // 14053
@5 // 14054
M=D // 14055
@SP // 14056
AM=M-1 // 14057
D=M // 14058
@5 // 14059
M=D // 14060
@SP // 14061
AM=M-1 // 14062
D=M // 14063
@5 // 14064
M=D // 14065
@SP // 14066
AM=M-1 // 14067
D=M // 14068
@5 // 14069
M=D // 14070
@SP // 14071
AM=M-1 // 14072
D=M // 14073
@5 // 14074
M=D // 14075
@SP // 14076
AM=M-1 // 14077
D=M // 14078
@5 // 14079
M=D // 14080
@SP // 14081
AM=M-1 // 14082
D=M // 14083
@5 // 14084
M=D // 14085
@SP // 14086
AM=M-1 // 14087
D=M // 14088
@5 // 14089
M=D // 14090
@SP // 14091
AM=M-1 // 14092
D=M // 14093
@5 // 14094
M=D // 14095
@SP // 14096
AM=M-1 // 14097
D=M // 14098
@5 // 14099
M=D // 14100
@SP // 14101
AM=M-1 // 14102
D=M // 14103
@5 // 14104
M=D // 14105
@SP // 14106
AM=M-1 // 14107
D=M // 14108
@5 // 14109
M=D // 14110
@SP // 14111
AM=M-1 // 14112
D=M // 14113
@5 // 14114
M=D // 14115
@SP // 14116
AM=M-1 // 14117
D=M // 14118
@5 // 14119
M=D // 14120
@SP // 14121
AM=M-1 // 14122
D=M // 14123
@5 // 14124
M=D // 14125
@SP // 14126
AM=M-1 // 14127
D=M // 14128
@5 // 14129
M=D // 14130
@SP // 14131
AM=M-1 // 14132
D=M // 14133
@5 // 14134
M=D // 14135
@SP // 14136
AM=M-1 // 14137
D=M // 14138
@5 // 14139
M=D // 14140
@SP // 14141
AM=M-1 // 14142
D=M // 14143
@5 // 14144
M=D // 14145
@SP // 14146
AM=M-1 // 14147
D=M // 14148
@5 // 14149
M=D // 14150
@SP // 14151
AM=M-1 // 14152
D=M // 14153
@5 // 14154
M=D // 14155
@SP // 14156
AM=M-1 // 14157
D=M // 14158
@5 // 14159
M=D // 14160
@SP // 14161
AM=M-1 // 14162
D=M // 14163
@5 // 14164
M=D // 14165
@SP // 14166
AM=M-1 // 14167
D=M // 14168
@5 // 14169
M=D // 14170
@SP // 14171
AM=M-1 // 14172
D=M // 14173
@5 // 14174
M=D // 14175
@SP // 14176
AM=M-1 // 14177
D=M // 14178
@5 // 14179
M=D // 14180
@SP // 14181
AM=M-1 // 14182
D=M // 14183
@5 // 14184
M=D // 14185
@SP // 14186
AM=M-1 // 14187
D=M // 14188
@5 // 14189
M=D // 14190
@SP // 14191
AM=M-1 // 14192
D=M // 14193
@5 // 14194
M=D // 14195
@SP // 14196
AM=M-1 // 14197
D=M // 14198
@5 // 14199
M=D // 14200
@SP // 14201
AM=M-1 // 14202
D=M // 14203
@5 // 14204
M=D // 14205
@SP // 14206
AM=M-1 // 14207
D=M // 14208
@5 // 14209
M=D // 14210
@SP // 14211
AM=M-1 // 14212
D=M // 14213
@5 // 14214
M=D // 14215
@SP // 14216
AM=M-1 // 14217
D=M // 14218
@5 // 14219
M=D // 14220
@SP // 14221
AM=M-1 // 14222
D=M // 14223
@5 // 14224
M=D // 14225
@SP // 14226
AM=M-1 // 14227
D=M // 14228
@5 // 14229
M=D // 14230
@SP // 14231
AM=M-1 // 14232
D=M // 14233
@5 // 14234
M=D // 14235
@SP // 14236
AM=M-1 // 14237
D=M // 14238
@5 // 14239
M=D // 14240
@SP // 14241
AM=M-1 // 14242
D=M // 14243
@5 // 14244
M=D // 14245
@SP // 14246
AM=M-1 // 14247
D=M // 14248
@5 // 14249
M=D // 14250
@SP // 14251
AM=M-1 // 14252
D=M // 14253
@5 // 14254
M=D // 14255

////PushInstruction("constant 0")
@SP // 14256
AM=M+1 // 14257
A=A-1 // 14258
M=0 // 14259

////ReturnInstruction{}
@RETURN // 14260
0;JMP // 14261

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 14262
AM=M+1 // 14263
A=A-1 // 14264
M=0 // 14265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 14266
D=A // 14267
@SP // 14268
AM=M+1 // 14269
A=A-1 // 14270
M=D // 14271
// call Array.new
@6 // 14272
D=A // 14273
@14 // 14274
M=D // 14275
@Array.new // 14276
D=A // 14277
@13 // 14278
M=D // 14279
@Output.create.ret.0 // 14280
D=A // 14281
@CALL // 14282
0;JMP // 14283
(Output.create.ret.0)
@SP // 14284
AM=M-1 // 14285
D=M // 14286
@LCL // 14287
A=M // 14288
M=D // 14289

////  nested:
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
//PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 14290
A=M // 14291
D=M // 14292
@SP // 14293
AM=M+1 // 14294
A=A-1 // 14295
M=D // 14296
@Output.0 // 14297
D=M // 14298
@SP // 14299
AM=M+1 // 14300
A=A-1 // 14301
M=D // 14302
@ARG // 14303
A=M // 14304
D=M // 14305
@SP // 14306
AM=M-1 // 14307
D=D+M // 14308
@4 // 14309
M=D // 14310
@SP // 14311
AM=M-1 // 14312
D=M // 14313
@THAT // 14314
A=M // 14315
M=D // 14316

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14317
A=M+1 // 14318
D=M // 14319
@SP // 14320
AM=M+1 // 14321
A=A-1 // 14322
M=D // 14323
@LCL // 14324
A=M // 14325
D=M // 14326
@4 // 14327
M=D // 14328
@SP // 14329
AM=M-1 // 14330
D=M // 14331
@THAT // 14332
A=M // 14333
M=D // 14334

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14335
A=M+1 // 14336
A=A+1 // 14337
D=M // 14338
@SP // 14339
AM=M+1 // 14340
A=A-1 // 14341
M=D // 14342
@LCL // 14343
A=M // 14344
D=M+1 // 14345
@4 // 14346
M=D // 14347
@SP // 14348
AM=M-1 // 14349
D=M // 14350
@THAT // 14351
A=M // 14352
M=D // 14353

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 3")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14354
A=M+1 // 14355
A=A+1 // 14356
A=A+1 // 14357
D=M // 14358
@SP // 14359
AM=M+1 // 14360
A=A-1 // 14361
M=D // 14362
@LCL // 14363
A=M // 14364
D=M // 14365
@2 // 14366
D=D+A // 14367
@4 // 14368
M=D // 14369
@SP // 14370
AM=M-1 // 14371
D=M // 14372
@THAT // 14373
A=M // 14374
M=D // 14375

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 4")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14376
D=M // 14377
@4 // 14378
A=D+A // 14379
D=M // 14380
@SP // 14381
AM=M+1 // 14382
A=A-1 // 14383
M=D // 14384
@LCL // 14385
A=M // 14386
D=M // 14387
@3 // 14388
D=D+A // 14389
@4 // 14390
M=D // 14391
@SP // 14392
AM=M-1 // 14393
D=M // 14394
@THAT // 14395
A=M // 14396
M=D // 14397

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 5")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14398
D=M // 14399
@5 // 14400
A=D+A // 14401
D=M // 14402
@SP // 14403
AM=M+1 // 14404
A=A-1 // 14405
M=D // 14406
@LCL // 14407
A=M // 14408
D=M // 14409
@4 // 14410
D=D+A // 14411
@4 // 14412
M=D // 14413
@SP // 14414
AM=M-1 // 14415
D=M // 14416
@THAT // 14417
A=M // 14418
M=D // 14419

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 6")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14420
D=M // 14421
@6 // 14422
A=D+A // 14423
D=M // 14424
@SP // 14425
AM=M+1 // 14426
A=A-1 // 14427
M=D // 14428
@LCL // 14429
A=M // 14430
D=M // 14431
@5 // 14432
D=D+A // 14433
@4 // 14434
M=D // 14435
@SP // 14436
AM=M-1 // 14437
D=M // 14438
@THAT // 14439
A=M // 14440
M=D // 14441

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 7")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14442
D=M // 14443
@7 // 14444
A=D+A // 14445
D=M // 14446
@SP // 14447
AM=M+1 // 14448
A=A-1 // 14449
M=D // 14450
@LCL // 14451
A=M // 14452
D=M // 14453
@6 // 14454
D=D+A // 14455
@4 // 14456
M=D // 14457
@SP // 14458
AM=M-1 // 14459
D=M // 14460
@THAT // 14461
A=M // 14462
M=D // 14463

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 8")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14464
D=M // 14465
@8 // 14466
A=D+A // 14467
D=M // 14468
@SP // 14469
AM=M+1 // 14470
A=A-1 // 14471
M=D // 14472
@LCL // 14473
A=M // 14474
D=M // 14475
@7 // 14476
D=D+A // 14477
@4 // 14478
M=D // 14479
@SP // 14480
AM=M-1 // 14481
D=M // 14482
@THAT // 14483
A=M // 14484
M=D // 14485

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 9")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14486
D=M // 14487
@9 // 14488
A=D+A // 14489
D=M // 14490
@SP // 14491
AM=M+1 // 14492
A=A-1 // 14493
M=D // 14494
@LCL // 14495
A=M // 14496
D=M // 14497
@8 // 14498
D=D+A // 14499
@4 // 14500
M=D // 14501
@SP // 14502
AM=M-1 // 14503
D=M // 14504
@THAT // 14505
A=M // 14506
M=D // 14507

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 10")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14508
D=M // 14509
@10 // 14510
A=D+A // 14511
D=M // 14512
@SP // 14513
AM=M+1 // 14514
A=A-1 // 14515
M=D // 14516
@LCL // 14517
A=M // 14518
D=M // 14519
@9 // 14520
D=D+A // 14521
@4 // 14522
M=D // 14523
@SP // 14524
AM=M-1 // 14525
D=M // 14526
@THAT // 14527
A=M // 14528
M=D // 14529

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 11")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 14530
D=M // 14531
@11 // 14532
A=D+A // 14533
D=M // 14534
@SP // 14535
AM=M+1 // 14536
A=A-1 // 14537
M=D // 14538
@LCL // 14539
A=M // 14540
D=M // 14541
@10 // 14542
D=D+A // 14543
@4 // 14544
M=D // 14545
@SP // 14546
AM=M-1 // 14547
D=M // 14548
@THAT // 14549
A=M // 14550
M=D // 14551

////PushInstruction("constant 0")
@SP // 14552
AM=M+1 // 14553
A=A-1 // 14554
M=0 // 14555

////ReturnInstruction{}
@RETURN // 14556
0;JMP // 14557

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
@Output.getMap.EQ.2 // 14558
D=A // 14559
@SP // 14560
AM=M+1 // 14561
A=A-1 // 14562
M=D // 14563
@Output.getMap.LT.3 // 14564
D=A // 14565
@SP // 14566
AM=M+1 // 14567
A=A-1 // 14568
M=D // 14569
@ARG // 14570
A=M // 14571
D=M // 14572
@32 // 14573
D=D-A // 14574
@14 // 14575
M=D // 14576
@SP // 14577
AM=M-1 // 14578
D=M // 14579
@13 // 14580
M=D // 14581
@14 // 14582
D=M // 14583
@DO_LT // 14584
0;JMP // 14585
(Output.getMap.LT.3)
@SP // 14586
AM=M+1 // 14587
A=A-1 // 14588
M=D // 14589
@Output.getMap.GT.4 // 14590
D=A // 14591
@SP // 14592
AM=M+1 // 14593
A=A-1 // 14594
M=D // 14595
@ARG // 14596
A=M // 14597
D=M // 14598
@126 // 14599
D=D-A // 14600
@14 // 14601
M=D // 14602
@SP // 14603
AM=M-1 // 14604
D=M // 14605
@13 // 14606
M=D // 14607
@14 // 14608
D=M // 14609
@DO_GT // 14610
0;JMP // 14611
(Output.getMap.GT.4)
@SP // 14612
AM=M-1 // 14613
D=D|M // 14614
@14 // 14615
M=D // 14616
@SP // 14617
AM=M-1 // 14618
D=M // 14619
@13 // 14620
M=D // 14621
@14 // 14622
D=M // 14623
@DO_EQ // 14624
0;JMP // 14625
(Output.getMap.EQ.2)
@Output.getMap.IfElse1 // 14626
D;JNE // 14627

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

D=0 // 14628
@ARG // 14629
A=M // 14630
M=D // 14631

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 14632
0;JMP // 14633

////LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)

////LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)

////Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 0"),
//            right:
//                PushInstruction("argument 0"),
//            binaryOp: "ADD"
//        )
//)
@Output.0 // 14634
D=M // 14635
@SP // 14636
AM=M+1 // 14637
A=A-1 // 14638
M=D // 14639
@ARG // 14640
A=M // 14641
D=M // 14642
@SP // 14643
AM=M-1 // 14644
A=D+M // 14645
D=M // 14646
@SP // 14647
AM=M+1 // 14648
A=A-1 // 14649
M=D // 14650

////ReturnInstruction{}
@RETURN // 14651
0;JMP // 14652

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////  nested:
//    PushPopPair {
//      push: PushInstruction("argument 1")
//      pop:  PopInstruction{address=Output.1}
//    }
//PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=Output.2}
//}

@ARG // 14653
A=M // 14654
D=M // 14655
@SP // 14656
AM=M+1 // 14657
A=A-1 // 14658
M=D // 14659
@ARG // 14660
A=M+1 // 14661
D=M // 14662
@Output.1 // 14663
M=D // 14664
@SP // 14665
AM=M-1 // 14666
D=M // 14667
@Output.2 // 14668
M=D // 14669

////PushInstruction("constant 0")
@SP // 14670
AM=M+1 // 14671
A=A-1 // 14672
M=0 // 14673

////ReturnInstruction{}
@RETURN // 14674
0;JMP // 14675

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 14676
AM=M+1 // 14677
A=A-1 // 14678
M=0 // 14679
@SP // 14680
AM=M+1 // 14681
A=A-1 // 14682
M=0 // 14683
@SP // 14684
AM=M+1 // 14685
A=A-1 // 14686
M=0 // 14687
@SP // 14688
AM=M+1 // 14689
A=A-1 // 14690
M=0 // 14691

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}}
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@SP // 14692
AM=M+1 // 14693
A=A-1 // 14694
M=0 // 14695
@ARG // 14696
A=M // 14697
D=M // 14698
@SP // 14699
AM=M+1 // 14700
A=A-1 // 14701
M=D // 14702
// call Output.getMap
@6 // 14703
D=A // 14704
@14 // 14705
M=D // 14706
@Output.getMap // 14707
D=A // 14708
@13 // 14709
M=D // 14710
@Output.printChar.ret.0 // 14711
D=A // 14712
@CALL // 14713
0;JMP // 14714
(Output.printChar.ret.0)
@SP // 14715
AM=M-1 // 14716
D=M // 14717
@LCL // 14718
A=M // 14719
M=D // 14720
@SP // 14721
AM=M-1 // 14722
D=M // 14723
@LCL // 14724
A=M+1 // 14725
A=A+1 // 14726
A=A+1 // 14727
M=D // 14728

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
@Output.printChar.EQ.6 // 14729
D=A // 14730
@SP // 14731
AM=M+1 // 14732
A=A-1 // 14733
M=D // 14734
@Output.printChar.LT.7 // 14735
D=A // 14736
@SP // 14737
AM=M+1 // 14738
A=A-1 // 14739
M=D // 14740
@LCL // 14741
A=M+1 // 14742
A=A+1 // 14743
A=A+1 // 14744
D=M // 14745
@11 // 14746
D=D-A // 14747
@14 // 14748
M=D // 14749
@SP // 14750
AM=M-1 // 14751
D=M // 14752
@13 // 14753
M=D // 14754
@14 // 14755
D=M // 14756
@DO_LT // 14757
0;JMP // 14758
(Output.printChar.LT.7)
@14 // 14759
M=D // 14760
@SP // 14761
AM=M-1 // 14762
D=M // 14763
@13 // 14764
M=D // 14765
@14 // 14766
D=M // 14767
@DO_EQ // 14768
0;JMP // 14769
(Output.printChar.EQ.6)
@WHILE_END_Output.printChar1 // 14770
D;JNE // 14771

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

@Output.2 // 14772
D=M // 14773
@SP // 14774
AM=M+1 // 14775
A=A-1 // 14776
M=D // 14777
@11 // 14778
D=A // 14779
@SP // 14780
AM=M+1 // 14781
A=A-1 // 14782
M=D // 14783
// call Math.multiply
@7 // 14784
D=A // 14785
@14 // 14786
M=D // 14787
@Math.multiply // 14788
D=A // 14789
@13 // 14790
M=D // 14791
@Output.printChar.ret.3 // 14792
D=A // 14793
@CALL // 14794
0;JMP // 14795
(Output.printChar.ret.3)
@LCL // 14796
A=M+1 // 14797
A=A+1 // 14798
A=A+1 // 14799
D=M // 14800
@SP // 14801
AM=M-1 // 14802
D=D+M // 14803
@SP // 14804
AM=M+1 // 14805
A=A-1 // 14806
M=D // 14807
@32 // 14808
D=A // 14809
@SP // 14810
AM=M+1 // 14811
A=A-1 // 14812
M=D // 14813
// call Math.multiply
@7 // 14814
D=A // 14815
@14 // 14816
M=D // 14817
@Math.multiply // 14818
D=A // 14819
@13 // 14820
M=D // 14821
@Output.printChar.ret.4 // 14822
D=A // 14823
@CALL // 14824
0;JMP // 14825
(Output.printChar.ret.4)
@SP // 14826
AM=M-1 // 14827
D=M // 14828
@16384 // 14829
D=D+A // 14830
@SP // 14831
AM=M+1 // 14832
A=A-1 // 14833
M=D // 14834
@Output.1 // 14835
D=M // 14836
@SP // 14837
AM=M+1 // 14838
A=A-1 // 14839
M=D // 14840
@2 // 14841
D=A // 14842
@SP // 14843
AM=M+1 // 14844
A=A-1 // 14845
M=D // 14846
// call Math.divide
@7 // 14847
D=A // 14848
@14 // 14849
M=D // 14850
@Math.divide // 14851
D=A // 14852
@13 // 14853
M=D // 14854
@Output.printChar.ret.5 // 14855
D=A // 14856
@CALL // 14857
0;JMP // 14858
(Output.printChar.ret.5)
@SP // 14859
AM=M-1 // 14860
D=M // 14861
@SP // 14862
AM=M-1 // 14863
D=D+M // 14864
@LCL // 14865
A=M+1 // 14866
M=D // 14867

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
@Output.printChar.EQ.9 // 14868
D=A // 14869
@SP // 14870
AM=M+1 // 14871
A=A-1 // 14872
M=D // 14873
@Output.printChar.EQ.10 // 14874
D=A // 14875
@SP // 14876
AM=M+1 // 14877
A=A-1 // 14878
M=D // 14879
@Output.1 // 14880
D=M // 14881
@1 // 14882
D=D&A // 14883
@14 // 14884
M=D // 14885
@SP // 14886
AM=M-1 // 14887
D=M // 14888
@13 // 14889
M=D // 14890
@14 // 14891
D=M // 14892
@DO_EQ // 14893
0;JMP // 14894
(Output.printChar.EQ.10)
@14 // 14895
M=D // 14896
@SP // 14897
AM=M-1 // 14898
D=M // 14899
@13 // 14900
M=D // 14901
@14 // 14902
D=M // 14903
@DO_EQ // 14904
0;JMP // 14905
(Output.printChar.EQ.9)
@Output.printChar.IfElse1 // 14906
D;JNE // 14907

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("local 3"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 14908
A=M+1 // 14909
A=A+1 // 14910
A=A+1 // 14911
D=M // 14912
A=A-1 // 14913
A=A-1 // 14914
A=A-1 // 14915
A=D+M // 14916
D=M // 14917
@LCL // 14918
A=M+1 // 14919
A=A+1 // 14920
M=D // 14921

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 14922
0;JMP // 14923

////LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("local 3"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 256")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printChar'}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 14924
A=M+1 // 14925
A=A+1 // 14926
A=A+1 // 14927
D=M // 14928
A=A-1 // 14929
A=A-1 // 14930
A=A-1 // 14931
A=D+M // 14932
D=M // 14933
@SP // 14934
AM=M+1 // 14935
A=A-1 // 14936
M=D // 14937
@256 // 14938
D=A // 14939
@SP // 14940
AM=M+1 // 14941
A=A-1 // 14942
M=D // 14943
// call Math.multiply
@7 // 14944
D=A // 14945
@14 // 14946
M=D // 14947
@Math.multiply // 14948
D=A // 14949
@13 // 14950
M=D // 14951
@Output.printChar.ret.6 // 14952
D=A // 14953
@CALL // 14954
0;JMP // 14955
(Output.printChar.ret.6)
@SP // 14956
AM=M-1 // 14957
D=M // 14958
@LCL // 14959
A=M+1 // 14960
A=A+1 // 14961
M=D // 14962

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////  nested:
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
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "OR"
//)
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 14963
A=M+1 // 14964
A=A+1 // 14965
A=A+1 // 14966
D=M // 14967
@SP // 14968
AM=M+1 // 14969
A=A-1 // 14970
M=D+1 // 14971
@LCL // 14972
A=M+1 // 14973
A=M // 14974
D=M // 14975
@SP // 14976
AM=M+1 // 14977
A=A-1 // 14978
M=D // 14979
@LCL // 14980
A=M+1 // 14981
A=A+1 // 14982
D=M // 14983
@SP // 14984
AM=M-1 // 14985
D=D|M // 14986
@SP // 14987
AM=M+1 // 14988
A=A-1 // 14989
M=D // 14990
@LCL // 14991
A=M+1 // 14992
D=M // 14993
@4 // 14994
M=D // 14995
@SP // 14996
AM=M-1 // 14997
D=M // 14998
@THAT // 14999
A=M // 15000
M=D // 15001
@SP // 15002
AM=M-1 // 15003
D=M // 15004
@LCL // 15005
A=M+1 // 15006
A=A+1 // 15007
A=A+1 // 15008
M=D // 15009

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 15010
0;JMP // 15011

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
@Output.printChar.EQ.12 // 15012
D=A // 15013
@SP // 15014
AM=M+1 // 15015
A=A-1 // 15016
M=D // 15017
@Output.printChar.EQ.13 // 15018
D=A // 15019
@SP // 15020
AM=M+1 // 15021
A=A-1 // 15022
M=D // 15023
@Output.1 // 15024
D=M // 15025
@63 // 15026
D=D-A // 15027
@14 // 15028
M=D // 15029
@SP // 15030
AM=M-1 // 15031
D=M // 15032
@13 // 15033
M=D // 15034
@14 // 15035
D=M // 15036
@DO_EQ // 15037
0;JMP // 15038
(Output.printChar.EQ.13)
@14 // 15039
M=D // 15040
@SP // 15041
AM=M-1 // 15042
D=M // 15043
@13 // 15044
M=D // 15045
@14 // 15046
D=M // 15047
@DO_EQ // 15048
0;JMP // 15049
(Output.printChar.EQ.12)
@Output.printChar.IfElse2 // 15050
D;JNE // 15051

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=7, Output.create=1}, currentFunction='Output.printChar'}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15052
D=A // 15053
@14 // 15054
M=D // 15055
@Output.println // 15056
D=A // 15057
@13 // 15058
M=D // 15059
@Output.printChar.ret.7 // 15060
D=A // 15061
@CALL // 15062
0;JMP // 15063
(Output.printChar.ret.7)
@SP // 15064
AM=M-1 // 15065
D=M // 15066
@5 // 15067
M=D // 15068

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 15069
0;JMP // 15070

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

@Output.1 // 15071
D=M+1 // 15072
@Output.1 // 15073
M=D // 15074

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 15075
AM=M+1 // 15076
A=A-1 // 15077
M=0 // 15078

////ReturnInstruction{}
@RETURN // 15079
0;JMP // 15080

////FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP // 15081
AM=M+1 // 15082
A=A-1 // 15083
M=0 // 15084

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 15085
@LCL // 15086
A=M // 15087
M=D // 15088

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
@Output.printString.EQ.15 // 15089
D=A // 15090
@SP // 15091
AM=M+1 // 15092
A=A-1 // 15093
M=D // 15094
@Output.printString.LT.16 // 15095
D=A // 15096
@SP // 15097
AM=M+1 // 15098
A=A-1 // 15099
M=D // 15100
@LCL // 15101
A=M // 15102
D=M // 15103
@SP // 15104
AM=M+1 // 15105
A=A-1 // 15106
M=D // 15107
@ARG // 15108
A=M // 15109
D=M // 15110
@SP // 15111
AM=M+1 // 15112
A=A-1 // 15113
M=D // 15114
// call String.length
@6 // 15115
D=A // 15116
@14 // 15117
M=D // 15118
@String.length // 15119
D=A // 15120
@13 // 15121
M=D // 15122
@Output.printString.ret.1 // 15123
D=A // 15124
@CALL // 15125
0;JMP // 15126
(Output.printString.ret.1)
@SP // 15127
AM=M-1 // 15128
D=M // 15129
@SP // 15130
AM=M-1 // 15131
D=M-D // 15132
@14 // 15133
M=D // 15134
@SP // 15135
AM=M-1 // 15136
D=M // 15137
@13 // 15138
M=D // 15139
@14 // 15140
D=M // 15141
@DO_LT // 15142
0;JMP // 15143
(Output.printString.LT.16)
@14 // 15144
M=D // 15145
@SP // 15146
AM=M-1 // 15147
D=M // 15148
@13 // 15149
M=D // 15150
@14 // 15151
D=M // 15152
@DO_EQ // 15153
0;JMP // 15154
(Output.printString.EQ.15)
@WHILE_END_Output.printString1 // 15155
D;JNE // 15156

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}}], call=CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printString'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15157
A=M // 15158
D=M // 15159
@SP // 15160
AM=M+1 // 15161
A=A-1 // 15162
M=D+1 // 15163
@ARG // 15164
A=M // 15165
D=M // 15166
@SP // 15167
AM=M+1 // 15168
A=A-1 // 15169
M=D // 15170
@LCL // 15171
A=M // 15172
D=M // 15173
@SP // 15174
AM=M+1 // 15175
A=A-1 // 15176
M=D // 15177
// call String.charAt
@7 // 15178
D=A // 15179
@14 // 15180
M=D // 15181
@String.charAt // 15182
D=A // 15183
@13 // 15184
M=D // 15185
@Output.printString.ret.2 // 15186
D=A // 15187
@CALL // 15188
0;JMP // 15189
(Output.printString.ret.2)
// call Output.printChar
@6 // 15190
D=A // 15191
@14 // 15192
M=D // 15193
@Output.printChar // 15194
D=A // 15195
@13 // 15196
M=D // 15197
@Output.printString.ret.3 // 15198
D=A // 15199
@CALL // 15200
0;JMP // 15201
(Output.printString.ret.3)
@SP // 15202
AM=M-1 // 15203
D=M // 15204
@5 // 15205
M=D // 15206
@SP // 15207
AM=M-1 // 15208
D=M // 15209
@LCL // 15210
A=M // 15211
M=D // 15212

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 15213
0;JMP // 15214

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 15215
AM=M+1 // 15216
A=A-1 // 15217
M=0 // 15218

////ReturnInstruction{}
@RETURN // 15219
0;JMP // 15220

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 15221
AM=M+1 // 15222
A=A-1 // 15223
M=0 // 15224

////  nested:
//      nested:
//          nested:
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//              pop:  PopInstruction{address=local 0}
//            }
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}, currentFunction='Output.printInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15225
A=M // 15226
D=M // 15227
@SP // 15228
AM=M+1 // 15229
A=A-1 // 15230
M=D // 15231
// call String.dispose
@6 // 15232
D=A // 15233
@14 // 15234
M=D // 15235
@String.dispose // 15236
D=A // 15237
@13 // 15238
M=D // 15239
@Output.printInt.ret.0 // 15240
D=A // 15241
@CALL // 15242
0;JMP // 15243
(Output.printInt.ret.0)
@LCL // 15244
A=M // 15245
D=M // 15246
@SP // 15247
AM=M+1 // 15248
A=A-1 // 15249
M=D // 15250
// call Output.printString
@6 // 15251
D=A // 15252
@14 // 15253
M=D // 15254
@Output.printString // 15255
D=A // 15256
@13 // 15257
M=D // 15258
@Output.printInt.ret.1 // 15259
D=A // 15260
@CALL // 15261
0;JMP // 15262
(Output.printInt.ret.1)
@LCL // 15263
A=M // 15264
D=M // 15265
@SP // 15266
AM=M+1 // 15267
A=A-1 // 15268
M=D // 15269
@ARG // 15270
A=M // 15271
D=M // 15272
@SP // 15273
AM=M+1 // 15274
A=A-1 // 15275
M=D // 15276
// call String.setInt
@7 // 15277
D=A // 15278
@14 // 15279
M=D // 15280
@String.setInt // 15281
D=A // 15282
@13 // 15283
M=D // 15284
@Output.printInt.ret.2 // 15285
D=A // 15286
@CALL // 15287
0;JMP // 15288
(Output.printInt.ret.2)
@10 // 15289
D=A // 15290
@SP // 15291
AM=M+1 // 15292
A=A-1 // 15293
M=D // 15294
// call String.new
@6 // 15295
D=A // 15296
@14 // 15297
M=D // 15298
@String.new // 15299
D=A // 15300
@13 // 15301
M=D // 15302
@Output.printInt.ret.3 // 15303
D=A // 15304
@CALL // 15305
0;JMP // 15306
(Output.printInt.ret.3)
@SP // 15307
AM=M-1 // 15308
D=M // 15309
@LCL // 15310
A=M // 15311
M=D // 15312
@SP // 15313
AM=M-1 // 15314
D=M // 15315
@5 // 15316
M=D // 15317
@SP // 15318
AM=M-1 // 15319
D=M // 15320
@5 // 15321
M=D // 15322
@SP // 15323
AM=M-1 // 15324
D=M // 15325
@5 // 15326
M=D // 15327

////PushInstruction("constant 0")
@SP // 15328
AM=M+1 // 15329
A=A-1 // 15330
M=0 // 15331

////ReturnInstruction{}
@RETURN // 15332
0;JMP // 15333

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.1}
//}

D=0 // 15334
@Output.1 // 15335
M=D // 15336

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
@Output.println.EQ.18 // 15337
D=A // 15338
@SP // 15339
AM=M+1 // 15340
A=A-1 // 15341
M=D // 15342
@Output.println.EQ.19 // 15343
D=A // 15344
@SP // 15345
AM=M+1 // 15346
A=A-1 // 15347
M=D // 15348
@Output.2 // 15349
D=M // 15350
@22 // 15351
D=D-A // 15352
@14 // 15353
M=D // 15354
@SP // 15355
AM=M-1 // 15356
D=M // 15357
@13 // 15358
M=D // 15359
@14 // 15360
D=M // 15361
@DO_EQ // 15362
0;JMP // 15363
(Output.println.EQ.19)
@14 // 15364
M=D // 15365
@SP // 15366
AM=M-1 // 15367
D=M // 15368
@13 // 15369
M=D // 15370
@14 // 15371
D=M // 15372
@DO_EQ // 15373
0;JMP // 15374
(Output.println.EQ.18)
@Output.println.IfElse1 // 15375
D;JNE // 15376

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.2}
//}

D=0 // 15377
@Output.2 // 15378
M=D // 15379

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 15380
0;JMP // 15381

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

@Output.2 // 15382
D=M+1 // 15383
@Output.2 // 15384
M=D // 15385

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 15386
AM=M+1 // 15387
A=A-1 // 15388
M=0 // 15389

////ReturnInstruction{}
@RETURN // 15390
0;JMP // 15391

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=4, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////ConditionalGroup{push=BinaryPushGroup(
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
@Output.backSpace.EQ.21 // 15392
D=A // 15393
@SP // 15394
AM=M+1 // 15395
A=A-1 // 15396
M=D // 15397
@Output.backSpace.EQ.22 // 15398
D=A // 15399
@SP // 15400
AM=M+1 // 15401
A=A-1 // 15402
M=D // 15403
@Output.1 // 15404
D=M // 15405
@14 // 15406
M=D // 15407
@SP // 15408
AM=M-1 // 15409
D=M // 15410
@13 // 15411
M=D // 15412
@14 // 15413
D=M // 15414
@DO_EQ // 15415
0;JMP // 15416
(Output.backSpace.EQ.22)
@14 // 15417
M=D // 15418
@SP // 15419
AM=M-1 // 15420
D=M // 15421
@13 // 15422
M=D // 15423
@14 // 15424
D=M // 15425
@DO_EQ // 15426
0;JMP // 15427
(Output.backSpace.EQ.21)
@Output.backSpace.IfElse1 // 15428
D;JNE // 15429

////  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//      pop:  PopInstruction{address=Output.2}
//    }
//PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=Output.1}
//}

@63 // 15430
D=A // 15431
@SP // 15432
AM=M+1 // 15433
A=A-1 // 15434
M=D // 15435
@Output.2 // 15436
D=M-1 // 15437
@Output.2 // 15438
M=D // 15439
@SP // 15440
AM=M-1 // 15441
D=M // 15442
@Output.1 // 15443
M=D // 15444

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 15445
0;JMP // 15446

////LabelInstruction{label='Output.backSpace.IfElse1}
// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=Output.1}
//}

@Output.1 // 15447
D=M-1 // 15448
@Output.1 // 15449
M=D // 15450

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 15451
AM=M+1 // 15452
A=A-1 // 15453
M=0 // 15454

////ReturnInstruction{}
@RETURN // 15455
0;JMP // 15456

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=Screen.0}
//}

D=-1 // 15457
@Screen.0 // 15458
M=D // 15459

////PushInstruction("constant 0")
@SP // 15460
AM=M+1 // 15461
A=A-1 // 15462
M=0 // 15463

////ReturnInstruction{}
@RETURN // 15464
0;JMP // 15465

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=Screen.0}
//}

@ARG // 15466
A=M // 15467
D=M // 15468
@Screen.0 // 15469
M=D // 15470

////PushInstruction("constant 0")
@SP // 15471
AM=M+1 // 15472
A=A-1 // 15473
M=0 // 15474

////ReturnInstruction{}
@RETURN // 15475
0;JMP // 15476

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 15477
AM=M+1 // 15478
A=A-1 // 15479
M=0 // 15480
@SP // 15481
AM=M+1 // 15482
A=A-1 // 15483
M=0 // 15484

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15485
A=M // 15486
D=M // 15487
@15 // 15488
D=D&A // 15489
@SP // 15490
AM=M+1 // 15491
A=A-1 // 15492
M=D // 15493
@ARG // 15494
A=M+1 // 15495
D=M // 15496
@SP // 15497
AM=M+1 // 15498
A=A-1 // 15499
M=D // 15500
@32 // 15501
D=A // 15502
@SP // 15503
AM=M+1 // 15504
A=A-1 // 15505
M=D // 15506
// call Math.multiply
@7 // 15507
D=A // 15508
@14 // 15509
M=D // 15510
@Math.multiply // 15511
D=A // 15512
@13 // 15513
M=D // 15514
@Screen.drawPixel.ret.2 // 15515
D=A // 15516
@CALL // 15517
0;JMP // 15518
(Screen.drawPixel.ret.2)
@ARG // 15519
A=M // 15520
D=M // 15521
@SP // 15522
AM=M+1 // 15523
A=A-1 // 15524
M=D // 15525
@16 // 15526
D=A // 15527
@SP // 15528
AM=M+1 // 15529
A=A-1 // 15530
M=D // 15531
// call Math.divide
@7 // 15532
D=A // 15533
@14 // 15534
M=D // 15535
@Math.divide // 15536
D=A // 15537
@13 // 15538
M=D // 15539
@Screen.drawPixel.ret.3 // 15540
D=A // 15541
@CALL // 15542
0;JMP // 15543
(Screen.drawPixel.ret.3)
@SP // 15544
AM=M-1 // 15545
D=M // 15546
@SP // 15547
AM=M-1 // 15548
D=D+M // 15549
@16384 // 15550
D=D+A // 15551
@LCL // 15552
A=M // 15553
M=D // 15554
@SP // 15555
AM=M-1 // 15556
D=M // 15557
@LCL // 15558
A=M+1 // 15559
M=D // 15560

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
@Screen.drawPixel.EQ.1 // 15561
D=A // 15562
@SP // 15563
AM=M+1 // 15564
A=A-1 // 15565
M=D // 15566
@Screen.drawPixel.EQ.2 // 15567
D=A // 15568
@SP // 15569
AM=M+1 // 15570
A=A-1 // 15571
M=D // 15572
@Screen.0 // 15573
D=M // 15574
@14 // 15575
M=D // 15576
@SP // 15577
AM=M-1 // 15578
D=M // 15579
@13 // 15580
M=D // 15581
@14 // 15582
D=M // 15583
@DO_EQ // 15584
0;JMP // 15585
(Screen.drawPixel.EQ.2)
D=!D // 15586
@14 // 15587
M=D // 15588
@SP // 15589
AM=M-1 // 15590
D=M // 15591
@13 // 15592
M=D // 15593
@14 // 15594
D=M // 15595
@DO_EQ // 15596
0;JMP // 15597
(Screen.drawPixel.EQ.1)
@Screen.drawPixel.IfElse1 // 15598
D;JNE // 15599

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawPixel'}},
//    binaryOp: "OR"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 15600
A=M // 15601
A=M // 15602
D=M // 15603
@SP // 15604
AM=M+1 // 15605
A=A-1 // 15606
M=D // 15607
@LCL // 15608
A=M+1 // 15609
D=M // 15610
@SP // 15611
AM=M+1 // 15612
A=A-1 // 15613
M=D // 15614
// call Math.twoToThe
@6 // 15615
D=A // 15616
@14 // 15617
M=D // 15618
@Math.twoToThe // 15619
D=A // 15620
@13 // 15621
M=D // 15622
@Screen.drawPixel.ret.4 // 15623
D=A // 15624
@CALL // 15625
0;JMP // 15626
(Screen.drawPixel.ret.4)
@SP // 15627
AM=M-1 // 15628
D=M // 15629
@SP // 15630
AM=M-1 // 15631
D=D|M // 15632
@SP // 15633
AM=M+1 // 15634
A=A-1 // 15635
M=D // 15636
@LCL // 15637
A=M // 15638
D=M // 15639
@4 // 15640
M=D // 15641
@SP // 15642
AM=M-1 // 15643
D=M // 15644
@THAT // 15645
A=M // 15646
M=D // 15647

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 15648
0;JMP // 15649

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=5}, currentFunction='Screen.drawPixel'}},
//NOT),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 15650
A=M // 15651
A=M // 15652
D=M // 15653
@SP // 15654
AM=M+1 // 15655
A=A-1 // 15656
M=D // 15657
@LCL // 15658
A=M+1 // 15659
D=M // 15660
@SP // 15661
AM=M+1 // 15662
A=A-1 // 15663
M=D // 15664
// call Math.twoToThe
@6 // 15665
D=A // 15666
@14 // 15667
M=D // 15668
@Math.twoToThe // 15669
D=A // 15670
@13 // 15671
M=D // 15672
@Screen.drawPixel.ret.5 // 15673
D=A // 15674
@CALL // 15675
0;JMP // 15676
(Screen.drawPixel.ret.5)
@SP // 15677
AM=M-1 // 15678
D=M // 15679
D=!D // 15680
@SP // 15681
AM=M-1 // 15682
D=D&M // 15683
@SP // 15684
AM=M+1 // 15685
A=A-1 // 15686
M=D // 15687
@LCL // 15688
A=M // 15689
D=M // 15690
@4 // 15691
M=D // 15692
@SP // 15693
AM=M-1 // 15694
D=M // 15695
@THAT // 15696
A=M // 15697
M=D // 15698

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 15699
AM=M+1 // 15700
A=A-1 // 15701
M=0 // 15702

////ReturnInstruction{}
@RETURN // 15703
0;JMP // 15704

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 15705
AM=M+1 // 15706
A=A-1 // 15707
M=0 // 15708
@SP // 15709
AM=M+1 // 15710
A=A-1 // 15711
M=0 // 15712
@SP // 15713
AM=M+1 // 15714
A=A-1 // 15715
M=0 // 15716
@SP // 15717
AM=M+1 // 15718
A=A-1 // 15719
M=0 // 15720
@SP // 15721
AM=M+1 // 15722
A=A-1 // 15723
M=0 // 15724
@SP // 15725
AM=M+1 // 15726
A=A-1 // 15727
M=0 // 15728

////  nested:
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
//PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 3"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "SUB"
//)], call=CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15729
A=M+1 // 15730
A=A+1 // 15731
A=A+1 // 15732
D=M // 15733
A=A-1 // 15734
A=A-1 // 15735
D=D-M // 15736
@SP // 15737
AM=M+1 // 15738
A=A-1 // 15739
M=D // 15740
// call Math.abs
@6 // 15741
D=A // 15742
@14 // 15743
M=D // 15744
@Math.abs // 15745
D=A // 15746
@13 // 15747
M=D // 15748
@Screen.drawLine.ret.0 // 15749
D=A // 15750
@CALL // 15751
0;JMP // 15752
(Screen.drawLine.ret.0)
@ARG // 15753
A=M+1 // 15754
A=A+1 // 15755
D=M // 15756
A=A-1 // 15757
A=A-1 // 15758
D=D-M // 15759
@SP // 15760
AM=M+1 // 15761
A=A-1 // 15762
M=D // 15763
// call Math.abs
@6 // 15764
D=A // 15765
@14 // 15766
M=D // 15767
@Math.abs // 15768
D=A // 15769
@13 // 15770
M=D // 15771
@Screen.drawLine.ret.1 // 15772
D=A // 15773
@CALL // 15774
0;JMP // 15775
(Screen.drawLine.ret.1)
@SP // 15776
AM=M-1 // 15777
D=M // 15778
@LCL // 15779
A=M // 15780
M=D // 15781
@SP // 15782
AM=M-1 // 15783
D=M // 15784
@LCL // 15785
A=M+1 // 15786
M=D // 15787

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
@Screen.drawLine.EQ.4 // 15788
D=A // 15789
@SP // 15790
AM=M+1 // 15791
A=A-1 // 15792
M=D // 15793
@Screen.drawLine.LT.5 // 15794
D=A // 15795
@SP // 15796
AM=M+1 // 15797
A=A-1 // 15798
M=D // 15799
@ARG // 15800
A=M+1 // 15801
A=A+1 // 15802
D=M // 15803
A=A-1 // 15804
A=A-1 // 15805
D=M-D // 15806
@14 // 15807
M=D // 15808
@SP // 15809
AM=M-1 // 15810
D=M // 15811
@13 // 15812
M=D // 15813
@14 // 15814
D=M // 15815
@DO_LT // 15816
0;JMP // 15817
(Screen.drawLine.LT.5)
@14 // 15818
M=D // 15819
@SP // 15820
AM=M-1 // 15821
D=M // 15822
@13 // 15823
M=D // 15824
@14 // 15825
D=M // 15826
@DO_EQ // 15827
0;JMP // 15828
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse1 // 15829
D;JNE // 15830

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

D=1 // 15831
@LCL // 15832
A=M+1 // 15833
A=A+1 // 15834
M=D // 15835

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 15836
0;JMP // 15837

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

D=-1 // 15838
@LCL // 15839
A=M+1 // 15840
A=A+1 // 15841
M=D // 15842

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
@Screen.drawLine.EQ.7 // 15843
D=A // 15844
@SP // 15845
AM=M+1 // 15846
A=A-1 // 15847
M=D // 15848
@Screen.drawLine.LT.8 // 15849
D=A // 15850
@SP // 15851
AM=M+1 // 15852
A=A-1 // 15853
M=D // 15854
@ARG // 15855
A=M+1 // 15856
A=A+1 // 15857
A=A+1 // 15858
D=M // 15859
A=A-1 // 15860
A=A-1 // 15861
D=M-D // 15862
@14 // 15863
M=D // 15864
@SP // 15865
AM=M-1 // 15866
D=M // 15867
@13 // 15868
M=D // 15869
@14 // 15870
D=M // 15871
@DO_LT // 15872
0;JMP // 15873
(Screen.drawLine.LT.8)
@14 // 15874
M=D // 15875
@SP // 15876
AM=M-1 // 15877
D=M // 15878
@13 // 15879
M=D // 15880
@14 // 15881
D=M // 15882
@DO_EQ // 15883
0;JMP // 15884
(Screen.drawLine.EQ.7)
@Screen.drawLine.IfElse2 // 15885
D;JNE // 15886

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

D=1 // 15887
@LCL // 15888
A=M+1 // 15889
A=A+1 // 15890
A=A+1 // 15891
M=D // 15892

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 15893
0;JMP // 15894

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

D=-1 // 15895
@LCL // 15896
A=M+1 // 15897
A=A+1 // 15898
A=A+1 // 15899
M=D // 15900

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

@LCL // 15901
A=M+1 // 15902
D=M // 15903
A=A-1 // 15904
D=M-D // 15905
@SP // 15906
AM=M+1 // 15907
A=A-1 // 15908
M=D // 15909
@LCL // 15910
D=M // 15911
@4 // 15912
A=D+A // 15913
D=A // 15914
@R13 // 15915
M=D // 15916
@SP // 15917
AM=M-1 // 15918
D=M // 15919
@R13 // 15920
A=M // 15921
M=D // 15922

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
D=0 // 15923
@WHILE_END_Screen.drawLine1 // 15924
D;JNE // 15925

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawLine'}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15926
A=M // 15927
D=M // 15928
@SP // 15929
AM=M+1 // 15930
A=A-1 // 15931
M=D // 15932
@ARG // 15933
A=M+1 // 15934
D=M // 15935
@SP // 15936
AM=M+1 // 15937
A=A-1 // 15938
M=D // 15939
// call Screen.drawPixel
@7 // 15940
D=A // 15941
@14 // 15942
M=D // 15943
@Screen.drawPixel // 15944
D=A // 15945
@13 // 15946
M=D // 15947
@Screen.drawLine.ret.2 // 15948
D=A // 15949
@CALL // 15950
0;JMP // 15951
(Screen.drawLine.ret.2)
@SP // 15952
AM=M-1 // 15953
D=M // 15954
@5 // 15955
M=D // 15956

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
@Screen.drawLine.EQ.11 // 15957
D=A // 15958
@SP // 15959
AM=M+1 // 15960
A=A-1 // 15961
M=D // 15962
@Screen.drawLine.EQ.12 // 15963
D=A // 15964
@SP // 15965
AM=M+1 // 15966
A=A-1 // 15967
M=D // 15968
@ARG // 15969
A=M+1 // 15970
A=A+1 // 15971
D=M // 15972
A=A-1 // 15973
A=A-1 // 15974
D=M-D // 15975
@14 // 15976
M=D // 15977
@SP // 15978
AM=M-1 // 15979
D=M // 15980
@13 // 15981
M=D // 15982
@14 // 15983
D=M // 15984
@DO_EQ // 15985
0;JMP // 15986
(Screen.drawLine.EQ.12)
@SP // 15987
AM=M+1 // 15988
A=A-1 // 15989
M=D // 15990
@Screen.drawLine.EQ.13 // 15991
D=A // 15992
@SP // 15993
AM=M+1 // 15994
A=A-1 // 15995
M=D // 15996
@ARG // 15997
A=M+1 // 15998
A=A+1 // 15999
A=A+1 // 16000
D=M // 16001
A=A-1 // 16002
A=A-1 // 16003
D=M-D // 16004
@14 // 16005
M=D // 16006
@SP // 16007
AM=M-1 // 16008
D=M // 16009
@13 // 16010
M=D // 16011
@14 // 16012
D=M // 16013
@DO_EQ // 16014
0;JMP // 16015
(Screen.drawLine.EQ.13)
@SP // 16016
AM=M-1 // 16017
D=D&M // 16018
@14 // 16019
M=D // 16020
@SP // 16021
AM=M-1 // 16022
D=M // 16023
@13 // 16024
M=D // 16025
@14 // 16026
D=M // 16027
@DO_EQ // 16028
0;JMP // 16029
(Screen.drawLine.EQ.11)
@Screen.drawLine.IfElse3 // 16030
D;JNE // 16031

////PushInstruction("constant 0")
@SP // 16032
AM=M+1 // 16033
A=A-1 // 16034
M=0 // 16035

////ReturnInstruction{}
@RETURN // 16036
0;JMP // 16037

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 16038
0;JMP // 16039

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

@LCL // 16040
D=M // 16041
@4 // 16042
A=D+A // 16043
D=M // 16044
D=D+M // 16045
@SP // 16046
AM=M+1 // 16047
A=A-1 // 16048
M=D // 16049
@LCL // 16050
D=M // 16051
@5 // 16052
A=D+A // 16053
D=A // 16054
@R13 // 16055
M=D // 16056
@SP // 16057
AM=M-1 // 16058
D=M // 16059
@R13 // 16060
A=M // 16061
M=D // 16062

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
@Screen.drawLine.EQ.15 // 16063
D=A // 16064
@SP // 16065
AM=M+1 // 16066
A=A-1 // 16067
M=D // 16068
@Screen.drawLine.GT.16 // 16069
D=A // 16070
@SP // 16071
AM=M+1 // 16072
A=A-1 // 16073
M=D // 16074
@LCL // 16075
D=M // 16076
@5 // 16077
A=D+A // 16078
D=M // 16079
@SP // 16080
AM=M+1 // 16081
A=A-1 // 16082
M=D // 16083
@LCL // 16084
A=M+1 // 16085
D=M // 16086
@SP // 16087
AM=M-1 // 16088
D=D+M // 16089
@14 // 16090
M=D // 16091
@SP // 16092
AM=M-1 // 16093
D=M // 16094
@13 // 16095
M=D // 16096
@14 // 16097
D=M // 16098
@DO_GT // 16099
0;JMP // 16100
(Screen.drawLine.GT.16)
@14 // 16101
M=D // 16102
@SP // 16103
AM=M-1 // 16104
D=M // 16105
@13 // 16106
M=D // 16107
@14 // 16108
D=M // 16109
@DO_EQ // 16110
0;JMP // 16111
(Screen.drawLine.EQ.15)
@Screen.drawLine.IfElse4 // 16112
D;JNE // 16113

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 16114
A=M // 16115
D=M // 16116
@SP // 16117
AM=M+1 // 16118
A=A-1 // 16119
M=D // 16120
@LCL // 16121
A=M+1 // 16122
A=A+1 // 16123
D=M // 16124
@SP // 16125
AM=M-1 // 16126
D=D+M // 16127
@SP // 16128
AM=M+1 // 16129
A=A-1 // 16130
M=D // 16131
@LCL // 16132
D=M // 16133
@4 // 16134
A=D+A // 16135
D=M // 16136
A=A-1 // 16137
A=A-1 // 16138
A=A-1 // 16139
D=D-M // 16140
@SP // 16141
AM=M+1 // 16142
A=A-1 // 16143
M=D // 16144
@LCL // 16145
D=M // 16146
@4 // 16147
A=D+A // 16148
D=A // 16149
@R13 // 16150
M=D // 16151
@SP // 16152
AM=M-1 // 16153
D=M // 16154
@R13 // 16155
A=M // 16156
M=D // 16157
@SP // 16158
AM=M-1 // 16159
D=M // 16160
@ARG // 16161
A=M // 16162
M=D // 16163

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 16164
0;JMP // 16165

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
@Screen.drawLine.EQ.18 // 16166
D=A // 16167
@SP // 16168
AM=M+1 // 16169
A=A-1 // 16170
M=D // 16171
@Screen.drawLine.LT.19 // 16172
D=A // 16173
@SP // 16174
AM=M+1 // 16175
A=A-1 // 16176
M=D // 16177
@LCL // 16178
D=M // 16179
@5 // 16180
A=D+A // 16181
D=M // 16182
@SP // 16183
AM=M+1 // 16184
A=A-1 // 16185
M=D // 16186
@LCL // 16187
A=M // 16188
D=M // 16189
@SP // 16190
AM=M-1 // 16191
D=M-D // 16192
@14 // 16193
M=D // 16194
@SP // 16195
AM=M-1 // 16196
D=M // 16197
@13 // 16198
M=D // 16199
@14 // 16200
D=M // 16201
@DO_LT // 16202
0;JMP // 16203
(Screen.drawLine.LT.19)
@14 // 16204
M=D // 16205
@SP // 16206
AM=M-1 // 16207
D=M // 16208
@13 // 16209
M=D // 16210
@14 // 16211
D=M // 16212
@DO_EQ // 16213
0;JMP // 16214
(Screen.drawLine.EQ.18)
@Screen.drawLine.IfElse5 // 16215
D;JNE // 16216

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 16217
A=M+1 // 16218
D=M // 16219
@SP // 16220
AM=M+1 // 16221
A=A-1 // 16222
M=D // 16223
@LCL // 16224
A=M+1 // 16225
A=A+1 // 16226
A=A+1 // 16227
D=M // 16228
@SP // 16229
AM=M-1 // 16230
D=D+M // 16231
@SP // 16232
AM=M+1 // 16233
A=A-1 // 16234
M=D // 16235
@LCL // 16236
D=M // 16237
@4 // 16238
A=D+A // 16239
D=M // 16240
@SP // 16241
AM=M+1 // 16242
A=A-1 // 16243
M=D // 16244
@LCL // 16245
A=M // 16246
D=M // 16247
@SP // 16248
AM=M-1 // 16249
D=D+M // 16250
@SP // 16251
AM=M+1 // 16252
A=A-1 // 16253
M=D // 16254
@LCL // 16255
D=M // 16256
@4 // 16257
A=D+A // 16258
D=A // 16259
@R13 // 16260
M=D // 16261
@SP // 16262
AM=M-1 // 16263
D=M // 16264
@R13 // 16265
A=M // 16266
M=D // 16267
@SP // 16268
AM=M-1 // 16269
D=M // 16270
@ARG // 16271
A=M+1 // 16272
M=D // 16273

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 16274
0;JMP // 16275

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 16276
0;JMP // 16277

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 16278
AM=M+1 // 16279
A=A-1 // 16280
M=0 // 16281

////ReturnInstruction{}
@RETURN // 16282
0;JMP // 16283

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 16284
AM=M+1 // 16285
A=A-1 // 16286
M=0 // 16287

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 16288
A=M // 16289
D=M // 16290
@LCL // 16291
A=M // 16292
M=D // 16293

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
@Screen.drawHorizontalLine.EQ.21 // 16294
D=A // 16295
@SP // 16296
AM=M+1 // 16297
A=A-1 // 16298
M=D // 16299
@Screen.drawHorizontalLine.GT.22 // 16300
D=A // 16301
@SP // 16302
AM=M+1 // 16303
A=A-1 // 16304
M=D // 16305
@LCL // 16306
A=M // 16307
D=M // 16308
@SP // 16309
AM=M+1 // 16310
A=A-1 // 16311
M=D // 16312
@ARG // 16313
A=M+1 // 16314
D=M // 16315
@SP // 16316
AM=M-1 // 16317
D=M-D // 16318
@14 // 16319
M=D // 16320
@SP // 16321
AM=M-1 // 16322
D=M // 16323
@13 // 16324
M=D // 16325
@14 // 16326
D=M // 16327
@DO_GT // 16328
0;JMP // 16329
(Screen.drawHorizontalLine.GT.22)
D=!D // 16330
@14 // 16331
M=D // 16332
@SP // 16333
AM=M-1 // 16334
D=M // 16335
@13 // 16336
M=D // 16337
@14 // 16338
D=M // 16339
@DO_EQ // 16340
0;JMP // 16341
(Screen.drawHorizontalLine.EQ.21)
@WHILE_END_Screen.drawHorizontalLine1 // 16342
D;JNE // 16343

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawHorizontalLine'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 16344
A=M // 16345
D=M // 16346
@SP // 16347
AM=M+1 // 16348
A=A-1 // 16349
M=D+1 // 16350
@LCL // 16351
A=M // 16352
D=M // 16353
@SP // 16354
AM=M+1 // 16355
A=A-1 // 16356
M=D // 16357
@ARG // 16358
A=M+1 // 16359
A=A+1 // 16360
D=M // 16361
@SP // 16362
AM=M+1 // 16363
A=A-1 // 16364
M=D // 16365
// call Screen.drawPixel
@7 // 16366
D=A // 16367
@14 // 16368
M=D // 16369
@Screen.drawPixel // 16370
D=A // 16371
@13 // 16372
M=D // 16373
@Screen.drawHorizontalLine.ret.0 // 16374
D=A // 16375
@CALL // 16376
0;JMP // 16377
(Screen.drawHorizontalLine.ret.0)
@SP // 16378
AM=M-1 // 16379
D=M // 16380
@5 // 16381
M=D // 16382
@SP // 16383
AM=M-1 // 16384
D=M // 16385
@LCL // 16386
A=M // 16387
M=D // 16388

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 16389
0;JMP // 16390

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 16391
AM=M+1 // 16392
A=A-1 // 16393
M=0 // 16394

////ReturnInstruction{}
@RETURN // 16395
0;JMP // 16396

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 16397
AM=M+1 // 16398
A=A-1 // 16399
M=0 // 16400
@SP // 16401
AM=M+1 // 16402
A=A-1 // 16403
M=0 // 16404
@SP // 16405
AM=M+1 // 16406
A=A-1 // 16407
M=0 // 16408
@SP // 16409
AM=M+1 // 16410
A=A-1 // 16411
M=0 // 16412
@SP // 16413
AM=M+1 // 16414
A=A-1 // 16415
M=0 // 16416

////  nested:
//      nested:
//        PushPopPair {
//          push: PushInstruction("constant 0")
//          pop:  PopInstruction{address=local 0}
//        }
//    PushPopPair {
//      push: PushInstruction("argument 2")
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 1"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 16417
A=M+1 // 16418
A=A+1 // 16419
D=M-1 // 16420
D=-D // 16421
@SP // 16422
AM=M+1 // 16423
A=A-1 // 16424
M=D // 16425
@ARG // 16426
A=M+1 // 16427
A=A+1 // 16428
D=M // 16429
@SP // 16430
AM=M+1 // 16431
A=A-1 // 16432
M=D // 16433
D=0 // 16434
@LCL // 16435
A=M // 16436
M=D // 16437
@SP // 16438
AM=M-1 // 16439
D=M // 16440
@LCL // 16441
A=M+1 // 16442
M=D // 16443
@SP // 16444
AM=M-1 // 16445
D=M // 16446
@LCL // 16447
A=M+1 // 16448
A=A+1 // 16449
M=D // 16450

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
@Screen.drawCircle.EQ.24 // 16451
D=A // 16452
@SP // 16453
AM=M+1 // 16454
A=A-1 // 16455
M=D // 16456
@Screen.drawCircle.GT.25 // 16457
D=A // 16458
@SP // 16459
AM=M+1 // 16460
A=A-1 // 16461
M=D // 16462
@LCL // 16463
A=M+1 // 16464
D=M // 16465
A=A-1 // 16466
D=M-D // 16467
@14 // 16468
M=D // 16469
@SP // 16470
AM=M-1 // 16471
D=M // 16472
@13 // 16473
M=D // 16474
@14 // 16475
D=M // 16476
@DO_GT // 16477
0;JMP // 16478
(Screen.drawCircle.GT.25)
D=!D // 16479
@14 // 16480
M=D // 16481
@SP // 16482
AM=M-1 // 16483
D=M // 16484
@13 // 16485
M=D // 16486
@14 // 16487
D=M // 16488
@DO_EQ // 16489
0;JMP // 16490
(Screen.drawCircle.EQ.24)
@WHILE_END_Screen.drawCircle1 // 16491
D;JNE // 16492

////  nested:
//      nested:
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
//          pop:  PopInstruction{address=temp 0}
//        }
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
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
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
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 16493
A=M // 16494
D=M // 16495
@SP // 16496
AM=M+1 // 16497
A=A-1 // 16498
M=D // 16499
@LCL // 16500
A=M+1 // 16501
D=M // 16502
@SP // 16503
AM=M-1 // 16504
D=M-D // 16505
@SP // 16506
AM=M+1 // 16507
A=A-1 // 16508
M=D // 16509
@ARG // 16510
A=M // 16511
D=M // 16512
@SP // 16513
AM=M+1 // 16514
A=A-1 // 16515
M=D // 16516
@LCL // 16517
A=M+1 // 16518
D=M // 16519
@SP // 16520
AM=M-1 // 16521
D=D+M // 16522
@SP // 16523
AM=M+1 // 16524
A=A-1 // 16525
M=D // 16526
@ARG // 16527
A=M+1 // 16528
D=M // 16529
@SP // 16530
AM=M+1 // 16531
A=A-1 // 16532
M=D // 16533
@LCL // 16534
A=M // 16535
D=M // 16536
@SP // 16537
AM=M-1 // 16538
D=M-D // 16539
@SP // 16540
AM=M+1 // 16541
A=A-1 // 16542
M=D // 16543
// call Screen.drawHorizontalLine
@8 // 16544
D=A // 16545
@14 // 16546
M=D // 16547
@Screen.drawHorizontalLine // 16548
D=A // 16549
@13 // 16550
M=D // 16551
@Screen.drawCircle.ret.0 // 16552
D=A // 16553
@CALL // 16554
0;JMP // 16555
(Screen.drawCircle.ret.0)
@ARG // 16556
A=M // 16557
D=M // 16558
@SP // 16559
AM=M+1 // 16560
A=A-1 // 16561
M=D // 16562
@LCL // 16563
A=M+1 // 16564
D=M // 16565
@SP // 16566
AM=M-1 // 16567
D=M-D // 16568
@SP // 16569
AM=M+1 // 16570
A=A-1 // 16571
M=D // 16572
@ARG // 16573
A=M // 16574
D=M // 16575
@SP // 16576
AM=M+1 // 16577
A=A-1 // 16578
M=D // 16579
@LCL // 16580
A=M+1 // 16581
D=M // 16582
@SP // 16583
AM=M-1 // 16584
D=D+M // 16585
@SP // 16586
AM=M+1 // 16587
A=A-1 // 16588
M=D // 16589
@ARG // 16590
A=M+1 // 16591
D=M // 16592
@SP // 16593
AM=M+1 // 16594
A=A-1 // 16595
M=D // 16596
@LCL // 16597
A=M // 16598
D=M // 16599
@SP // 16600
AM=M-1 // 16601
D=D+M // 16602
@SP // 16603
AM=M+1 // 16604
A=A-1 // 16605
M=D // 16606
// call Screen.drawHorizontalLine
@8 // 16607
D=A // 16608
@14 // 16609
M=D // 16610
@Screen.drawHorizontalLine // 16611
D=A // 16612
@13 // 16613
M=D // 16614
@Screen.drawCircle.ret.1 // 16615
D=A // 16616
@CALL // 16617
0;JMP // 16618
(Screen.drawCircle.ret.1)
@ARG // 16619
A=M // 16620
D=M // 16621
@SP // 16622
AM=M+1 // 16623
A=A-1 // 16624
M=D // 16625
@LCL // 16626
A=M // 16627
D=M // 16628
@SP // 16629
AM=M-1 // 16630
D=M-D // 16631
@SP // 16632
AM=M+1 // 16633
A=A-1 // 16634
M=D // 16635
@ARG // 16636
A=M // 16637
D=M // 16638
@SP // 16639
AM=M+1 // 16640
A=A-1 // 16641
M=D // 16642
@LCL // 16643
A=M // 16644
D=M // 16645
@SP // 16646
AM=M-1 // 16647
D=D+M // 16648
@SP // 16649
AM=M+1 // 16650
A=A-1 // 16651
M=D // 16652
@ARG // 16653
A=M+1 // 16654
D=M // 16655
@SP // 16656
AM=M+1 // 16657
A=A-1 // 16658
M=D // 16659
@LCL // 16660
A=M+1 // 16661
D=M // 16662
@SP // 16663
AM=M-1 // 16664
D=M-D // 16665
@SP // 16666
AM=M+1 // 16667
A=A-1 // 16668
M=D // 16669
// call Screen.drawHorizontalLine
@8 // 16670
D=A // 16671
@14 // 16672
M=D // 16673
@Screen.drawHorizontalLine // 16674
D=A // 16675
@13 // 16676
M=D // 16677
@Screen.drawCircle.ret.2 // 16678
D=A // 16679
@CALL // 16680
0;JMP // 16681
(Screen.drawCircle.ret.2)
@ARG // 16682
A=M // 16683
D=M // 16684
@SP // 16685
AM=M+1 // 16686
A=A-1 // 16687
M=D // 16688
@LCL // 16689
A=M // 16690
D=M // 16691
@SP // 16692
AM=M-1 // 16693
D=M-D // 16694
@SP // 16695
AM=M+1 // 16696
A=A-1 // 16697
M=D // 16698
@ARG // 16699
A=M // 16700
D=M // 16701
@SP // 16702
AM=M+1 // 16703
A=A-1 // 16704
M=D // 16705
@LCL // 16706
A=M // 16707
D=M // 16708
@SP // 16709
AM=M-1 // 16710
D=D+M // 16711
@SP // 16712
AM=M+1 // 16713
A=A-1 // 16714
M=D // 16715
@ARG // 16716
A=M+1 // 16717
D=M // 16718
@SP // 16719
AM=M+1 // 16720
A=A-1 // 16721
M=D // 16722
@LCL // 16723
A=M+1 // 16724
D=M // 16725
@SP // 16726
AM=M-1 // 16727
D=D+M // 16728
@SP // 16729
AM=M+1 // 16730
A=A-1 // 16731
M=D // 16732
// call Screen.drawHorizontalLine
@8 // 16733
D=A // 16734
@14 // 16735
M=D // 16736
@Screen.drawHorizontalLine // 16737
D=A // 16738
@13 // 16739
M=D // 16740
@Screen.drawCircle.ret.3 // 16741
D=A // 16742
@CALL // 16743
0;JMP // 16744
(Screen.drawCircle.ret.3)
@SP // 16745
AM=M-1 // 16746
D=M // 16747
@5 // 16748
M=D // 16749
@SP // 16750
AM=M-1 // 16751
D=M // 16752
@5 // 16753
M=D // 16754
@SP // 16755
AM=M-1 // 16756
D=M // 16757
@5 // 16758
M=D // 16759
@SP // 16760
AM=M-1 // 16761
D=M // 16762
@5 // 16763
M=D // 16764

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
@Screen.drawCircle.EQ.27 // 16765
D=A // 16766
@SP // 16767
AM=M+1 // 16768
A=A-1 // 16769
M=D // 16770
@Screen.drawCircle.LT.28 // 16771
D=A // 16772
@SP // 16773
AM=M+1 // 16774
A=A-1 // 16775
M=D // 16776
@LCL // 16777
A=M+1 // 16778
A=A+1 // 16779
D=M // 16780
@14 // 16781
M=D // 16782
@SP // 16783
AM=M-1 // 16784
D=M // 16785
@13 // 16786
M=D // 16787
@14 // 16788
D=M // 16789
@DO_LT // 16790
0;JMP // 16791
(Screen.drawCircle.LT.28)
@14 // 16792
M=D // 16793
@SP // 16794
AM=M-1 // 16795
D=M // 16796
@13 // 16797
M=D // 16798
@14 // 16799
D=M // 16800
@DO_EQ // 16801
0;JMP // 16802
(Screen.drawCircle.EQ.27)
@Screen.drawCircle.IfElse1 // 16803
D;JNE // 16804

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

@LCL // 16805
A=M+1 // 16806
A=A+1 // 16807
D=M // 16808
@SP // 16809
AM=M+1 // 16810
A=A-1 // 16811
M=D // 16812
@LCL // 16813
A=M // 16814
D=M // 16815
D=D+M // 16816
@SP // 16817
AM=M-1 // 16818
D=D+M // 16819
@3 // 16820
D=D+A // 16821
@LCL // 16822
A=M+1 // 16823
A=A+1 // 16824
M=D // 16825

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 16826
0;JMP // 16827

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 16828
A=M+1 // 16829
D=M // 16830
@SP // 16831
AM=M+1 // 16832
A=A-1 // 16833
M=D-1 // 16834
@LCL // 16835
A=M+1 // 16836
A=A+1 // 16837
D=M // 16838
@SP // 16839
AM=M+1 // 16840
A=A-1 // 16841
M=D // 16842
@LCL // 16843
A=M+1 // 16844
D=M // 16845
A=A-1 // 16846
D=M-D // 16847
@R13 // 16848
M=D // 16849
D=D+M // 16850
@SP // 16851
AM=M-1 // 16852
D=D+M // 16853
@5 // 16854
D=D+A // 16855
@LCL // 16856
A=M+1 // 16857
A=A+1 // 16858
M=D // 16859
@SP // 16860
AM=M-1 // 16861
D=M // 16862
@LCL // 16863
A=M+1 // 16864
M=D // 16865

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

@LCL // 16866
A=M // 16867
D=M+1 // 16868
@LCL // 16869
A=M // 16870
M=D // 16871

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 16872
0;JMP // 16873

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 16874
AM=M+1 // 16875
A=A-1 // 16876
M=0 // 16877

////ReturnInstruction{}
@RETURN // 16878
0;JMP // 16879

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 16880
AM=M+1 // 16881
A=A-1 // 16882
M=0 // 16883
@SP // 16884
AM=M+1 // 16885
A=A-1 // 16886
M=0 // 16887
@SP // 16888
AM=M+1 // 16889
A=A-1 // 16890
M=0 // 16891
@SP // 16892
AM=M+1 // 16893
A=A-1 // 16894
M=0 // 16895
@SP // 16896
AM=M+1 // 16897
A=A-1 // 16898
M=0 // 16899
@SP // 16900
AM=M+1 // 16901
A=A-1 // 16902
M=0 // 16903
@SP // 16904
AM=M+1 // 16905
A=A-1 // 16906
M=0 // 16907
@SP // 16908
AM=M+1 // 16909
A=A-1 // 16910
M=0 // 16911
@SP // 16912
AM=M+1 // 16913
A=A-1 // 16914
M=0 // 16915
@SP // 16916
AM=M+1 // 16917
A=A-1 // 16918
M=0 // 16919

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@SP // 16920
AM=M+1 // 16921
A=A-1 // 16922
M=-1 // 16923
@LCL // 16924
D=M // 16925
@9 // 16926
A=D+A // 16927
D=A // 16928
@R13 // 16929
M=D // 16930
@SP // 16931
AM=M-1 // 16932
D=M // 16933
@R13 // 16934
A=M // 16935
M=D // 16936

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.29 // 16937
D=A // 16938
@SP // 16939
AM=M+1 // 16940
A=A-1 // 16941
M=D // 16942
@Screen.0 // 16943
D=!M // 16944
@14 // 16945
M=D // 16946
@SP // 16947
AM=M-1 // 16948
D=M // 16949
@13 // 16950
M=D // 16951
@14 // 16952
D=M // 16953
@DO_EQ // 16954
0;JMP // 16955
(Screen.drawRectangle.EQ.29)
@Screen.drawRectangle.IfElse1 // 16956
D;JNE // 16957

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@SP // 16958
AM=M+1 // 16959
A=A-1 // 16960
M=0 // 16961
@LCL // 16962
D=M // 16963
@9 // 16964
A=D+A // 16965
D=A // 16966
@R13 // 16967
M=D // 16968
@SP // 16969
AM=M-1 // 16970
D=M // 16971
@R13 // 16972
A=M // 16973
M=D // 16974

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 16975
0;JMP // 16976

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

@ARG // 16977
A=M+1 // 16978
D=M // 16979
@LCL // 16980
A=M // 16981
M=D // 16982

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
@Screen.drawRectangle.EQ.31 // 16983
D=A // 16984
@SP // 16985
AM=M+1 // 16986
A=A-1 // 16987
M=D // 16988
@Screen.drawRectangle.GT.32 // 16989
D=A // 16990
@SP // 16991
AM=M+1 // 16992
A=A-1 // 16993
M=D // 16994
@LCL // 16995
A=M // 16996
D=M // 16997
@SP // 16998
AM=M+1 // 16999
A=A-1 // 17000
M=D // 17001
@ARG // 17002
A=M+1 // 17003
A=A+1 // 17004
A=A+1 // 17005
D=M // 17006
@SP // 17007
AM=M-1 // 17008
D=M-D // 17009
@14 // 17010
M=D // 17011
@SP // 17012
AM=M-1 // 17013
D=M // 17014
@13 // 17015
M=D // 17016
@14 // 17017
D=M // 17018
@DO_GT // 17019
0;JMP // 17020
(Screen.drawRectangle.GT.32)
D=!D // 17021
@14 // 17022
M=D // 17023
@SP // 17024
AM=M-1 // 17025
D=M // 17026
@13 // 17027
M=D // 17028
@14 // 17029
D=M // 17030
@DO_EQ // 17031
0;JMP // 17032
(Screen.drawRectangle.EQ.31)
@WHILE_END_Screen.drawRectangle1 // 17033
D;JNE // 17034

////  nested:
//      nested:
//          nested:
//              nested:
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//                  pop:  PopInstruction{address=local 1}
//                }
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//              pop:  PopInstruction{address=local 2}
//            }
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//          pop:  PopInstruction{address=local 3}
//        }
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//      pop:  PopInstruction{address=local 4}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=6}, currentFunction='Screen.drawRectangle'}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 17035
A=M // 17036
D=M // 17037
@SP // 17038
AM=M+1 // 17039
A=A-1 // 17040
M=D // 17041
@32 // 17042
D=A // 17043
@SP // 17044
AM=M+1 // 17045
A=A-1 // 17046
M=D // 17047
// call Math.multiply
@7 // 17048
D=A // 17049
@14 // 17050
M=D // 17051
@Math.multiply // 17052
D=A // 17053
@13 // 17054
M=D // 17055
@Screen.drawRectangle.ret.0 // 17056
D=A // 17057
@CALL // 17058
0;JMP // 17059
(Screen.drawRectangle.ret.0)
@ARG // 17060
A=M+1 // 17061
A=A+1 // 17062
D=M // 17063
@15 // 17064
D=D&A // 17065
@SP // 17066
AM=M+1 // 17067
A=A-1 // 17068
M=D // 17069
@ARG // 17070
A=M // 17071
D=M // 17072
@15 // 17073
D=D&A // 17074
@SP // 17075
AM=M+1 // 17076
A=A-1 // 17077
M=D // 17078
@ARG // 17079
A=M+1 // 17080
A=A+1 // 17081
D=M // 17082
@SP // 17083
AM=M+1 // 17084
A=A-1 // 17085
M=D // 17086
@16 // 17087
D=A // 17088
@SP // 17089
AM=M+1 // 17090
A=A-1 // 17091
M=D // 17092
// call Math.divide
@7 // 17093
D=A // 17094
@14 // 17095
M=D // 17096
@Math.divide // 17097
D=A // 17098
@13 // 17099
M=D // 17100
@Screen.drawRectangle.ret.1 // 17101
D=A // 17102
@CALL // 17103
0;JMP // 17104
(Screen.drawRectangle.ret.1)
@ARG // 17105
A=M // 17106
D=M // 17107
@SP // 17108
AM=M+1 // 17109
A=A-1 // 17110
M=D // 17111
@16 // 17112
D=A // 17113
@SP // 17114
AM=M+1 // 17115
A=A-1 // 17116
M=D // 17117
// call Math.divide
@7 // 17118
D=A // 17119
@14 // 17120
M=D // 17121
@Math.divide // 17122
D=A // 17123
@13 // 17124
M=D // 17125
@Screen.drawRectangle.ret.2 // 17126
D=A // 17127
@CALL // 17128
0;JMP // 17129
(Screen.drawRectangle.ret.2)
@SP // 17130
AM=M-1 // 17131
D=M // 17132
@LCL // 17133
A=M+1 // 17134
M=D // 17135
@SP // 17136
AM=M-1 // 17137
D=M // 17138
@LCL // 17139
A=M+1 // 17140
A=A+1 // 17141
M=D // 17142
@SP // 17143
AM=M-1 // 17144
D=M // 17145
@LCL // 17146
A=M+1 // 17147
A=A+1 // 17148
A=A+1 // 17149
M=D // 17150
@LCL // 17151
D=M // 17152
@4 // 17153
A=D+A // 17154
D=A // 17155
@R13 // 17156
M=D // 17157
@SP // 17158
AM=M-1 // 17159
D=M // 17160
@R13 // 17161
A=M // 17162
M=D // 17163
@LCL // 17164
D=M // 17165
@5 // 17166
A=D+A // 17167
D=A // 17168
@R13 // 17169
M=D // 17170
@SP // 17171
AM=M-1 // 17172
D=M // 17173
@R13 // 17174
A=M // 17175
M=D // 17176

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
@Screen.drawRectangle.EQ.34 // 17177
D=A // 17178
@SP // 17179
AM=M+1 // 17180
A=A-1 // 17181
M=D // 17182
@Screen.drawRectangle.EQ.35 // 17183
D=A // 17184
@SP // 17185
AM=M+1 // 17186
A=A-1 // 17187
M=D // 17188
@LCL // 17189
A=M+1 // 17190
A=A+1 // 17191
D=M // 17192
A=A-1 // 17193
D=M-D // 17194
@14 // 17195
M=D // 17196
@SP // 17197
AM=M-1 // 17198
D=M // 17199
@13 // 17200
M=D // 17201
@14 // 17202
D=M // 17203
@DO_EQ // 17204
0;JMP // 17205
(Screen.drawRectangle.EQ.35)
@14 // 17206
M=D // 17207
@SP // 17208
AM=M-1 // 17209
D=M // 17210
@13 // 17211
M=D // 17212
@14 // 17213
D=M // 17214
@DO_EQ // 17215
0;JMP // 17216
(Screen.drawRectangle.EQ.34)
@Screen.drawRectangle.IfElse2 // 17217
D;JNE // 17218

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 17219
D=M // 17220
@5 // 17221
A=D+A // 17222
D=M // 17223
@SP // 17224
AM=M+1 // 17225
A=A-1 // 17226
M=D // 17227
@LCL // 17228
A=M+1 // 17229
D=M // 17230
@SP // 17231
AM=M-1 // 17232
D=D+M // 17233
@SP // 17234
AM=M+1 // 17235
A=A-1 // 17236
M=D // 17237
@LCL // 17238
D=M // 17239
@4 // 17240
A=D+A // 17241
D=M // 17242
@SP // 17243
AM=M+1 // 17244
A=A-1 // 17245
M=D+1 // 17246
// call Math.twoToThe
@6 // 17247
D=A // 17248
@14 // 17249
M=D // 17250
@Math.twoToThe // 17251
D=A // 17252
@13 // 17253
M=D // 17254
@Screen.drawRectangle.ret.3 // 17255
D=A // 17256
@CALL // 17257
0;JMP // 17258
(Screen.drawRectangle.ret.3)
@SP // 17259
AM=M-1 // 17260
D=M // 17261
D=M-1 // 17262
@SP // 17263
AM=M+1 // 17264
A=A-1 // 17265
M=D // 17266
@LCL // 17267
A=M+1 // 17268
A=A+1 // 17269
A=A+1 // 17270
D=M // 17271
@SP // 17272
AM=M+1 // 17273
A=A-1 // 17274
M=D // 17275
// call Math.twoToThe
@6 // 17276
D=A // 17277
@14 // 17278
M=D // 17279
@Math.twoToThe // 17280
D=A // 17281
@13 // 17282
M=D // 17283
@Screen.drawRectangle.ret.4 // 17284
D=A // 17285
@CALL // 17286
0;JMP // 17287
(Screen.drawRectangle.ret.4)
@SP // 17288
AM=M-1 // 17289
D=M // 17290
D=M-1 // 17291
@SP // 17292
AM=M-1 // 17293
D=M-D // 17294
@SP // 17295
AM=M+1 // 17296
A=A-1 // 17297
M=D // 17298
@LCL // 17299
D=M // 17300
@6 // 17301
A=D+A // 17302
D=A // 17303
@R13 // 17304
M=D // 17305
@SP // 17306
AM=M-1 // 17307
D=M // 17308
@R13 // 17309
A=M // 17310
M=D // 17311
@LCL // 17312
D=M // 17313
@7 // 17314
A=D+A // 17315
D=A // 17316
@R13 // 17317
M=D // 17318
@SP // 17319
AM=M-1 // 17320
D=M // 17321
@R13 // 17322
A=M // 17323
M=D // 17324

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.36 // 17325
D=A // 17326
@SP // 17327
AM=M+1 // 17328
A=A-1 // 17329
M=D // 17330
@Screen.0 // 17331
D=M // 17332
@14 // 17333
M=D // 17334
@SP // 17335
AM=M-1 // 17336
D=M // 17337
@13 // 17338
M=D // 17339
@14 // 17340
D=M // 17341
@DO_EQ // 17342
0;JMP // 17343
(Screen.drawRectangle.EQ.36)
@Screen.drawRectangle.IfElse3 // 17344
D;JNE // 17345

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 16384"),
//                    right:
//                        PushInstruction("local 7"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 17346
D=M // 17347
@7 // 17348
A=D+A // 17349
D=M // 17350
@16384 // 17351
A=D+A // 17352
D=M // 17353
@SP // 17354
AM=M+1 // 17355
A=A-1 // 17356
M=D // 17357
@LCL // 17358
D=M // 17359
@6 // 17360
A=D+A // 17361
D=M // 17362
@SP // 17363
AM=M-1 // 17364
D=D|M // 17365
@SP // 17366
AM=M+1 // 17367
A=A-1 // 17368
M=D // 17369
@LCL // 17370
D=M // 17371
@7 // 17372
A=D+A // 17373
D=M // 17374
@16384 // 17375
D=D+A // 17376
@4 // 17377
M=D // 17378
@SP // 17379
AM=M-1 // 17380
D=M // 17381
@THAT // 17382
A=M // 17383
M=D // 17384

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 17385
0;JMP // 17386

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 16384"),
//                    right:
//                        PushInstruction("local 7"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 17387
D=M // 17388
@7 // 17389
A=D+A // 17390
D=M // 17391
@16384 // 17392
A=D+A // 17393
D=M // 17394
@SP // 17395
AM=M+1 // 17396
A=A-1 // 17397
M=D // 17398
@LCL // 17399
D=M // 17400
@6 // 17401
A=D+A // 17402
D=!M // 17403
@SP // 17404
AM=M-1 // 17405
D=D&M // 17406
@SP // 17407
AM=M+1 // 17408
A=A-1 // 17409
M=D // 17410
@LCL // 17411
D=M // 17412
@7 // 17413
A=D+A // 17414
D=M // 17415
@16384 // 17416
D=D+A // 17417
@4 // 17418
M=D // 17419
@SP // 17420
AM=M-1 // 17421
D=M // 17422
@THAT // 17423
A=M // 17424
M=D // 17425

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 17426
0;JMP // 17427

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 17428
D=M // 17429
@5 // 17430
A=D+A // 17431
D=M // 17432
@SP // 17433
AM=M+1 // 17434
A=A-1 // 17435
M=D // 17436
@LCL // 17437
A=M+1 // 17438
D=M // 17439
@SP // 17440
AM=M-1 // 17441
D=D+M // 17442
@SP // 17443
AM=M+1 // 17444
A=A-1 // 17445
M=D // 17446
@LCL // 17447
A=M+1 // 17448
A=A+1 // 17449
A=A+1 // 17450
D=M // 17451
@SP // 17452
AM=M+1 // 17453
A=A-1 // 17454
M=D // 17455
// call Math.twoToThe
@6 // 17456
D=A // 17457
@14 // 17458
M=D // 17459
@Math.twoToThe // 17460
D=A // 17461
@13 // 17462
M=D // 17463
@Screen.drawRectangle.ret.5 // 17464
D=A // 17465
@CALL // 17466
0;JMP // 17467
(Screen.drawRectangle.ret.5)
@SP // 17468
AM=M-1 // 17469
D=M // 17470
D=M-1 // 17471
@SP // 17472
AM=M+1 // 17473
A=A-1 // 17474
M=D // 17475
@SP // 17476
A=M-1 // 17477
M=!D // 17478
@LCL // 17479
D=M // 17480
@6 // 17481
A=D+A // 17482
D=A // 17483
@R13 // 17484
M=D // 17485
@SP // 17486
AM=M-1 // 17487
D=M // 17488
@R13 // 17489
A=M // 17490
M=D // 17491
@LCL // 17492
D=M // 17493
@7 // 17494
A=D+A // 17495
D=A // 17496
@R13 // 17497
M=D // 17498
@SP // 17499
AM=M-1 // 17500
D=M // 17501
@R13 // 17502
A=M // 17503
M=D // 17504

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.37 // 17505
D=A // 17506
@SP // 17507
AM=M+1 // 17508
A=A-1 // 17509
M=D // 17510
@Screen.0 // 17511
D=M // 17512
@14 // 17513
M=D // 17514
@SP // 17515
AM=M-1 // 17516
D=M // 17517
@13 // 17518
M=D // 17519
@14 // 17520
D=M // 17521
@DO_EQ // 17522
0;JMP // 17523
(Screen.drawRectangle.EQ.37)
@Screen.drawRectangle.IfElse4 // 17524
D;JNE // 17525

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 16384"),
//                    right:
//                        PushInstruction("local 7"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 17526
D=M // 17527
@7 // 17528
A=D+A // 17529
D=M // 17530
@16384 // 17531
A=D+A // 17532
D=M // 17533
@SP // 17534
AM=M+1 // 17535
A=A-1 // 17536
M=D // 17537
@LCL // 17538
D=M // 17539
@6 // 17540
A=D+A // 17541
D=M // 17542
@SP // 17543
AM=M-1 // 17544
D=D|M // 17545
@SP // 17546
AM=M+1 // 17547
A=A-1 // 17548
M=D // 17549
@LCL // 17550
D=M // 17551
@7 // 17552
A=D+A // 17553
D=M // 17554
@16384 // 17555
D=D+A // 17556
@4 // 17557
M=D // 17558
@SP // 17559
AM=M-1 // 17560
D=M // 17561
@THAT // 17562
A=M // 17563
M=D // 17564

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 17565
0;JMP // 17566

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 16384"),
//                    right:
//                        PushInstruction("local 7"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 17567
D=M // 17568
@7 // 17569
A=D+A // 17570
D=M // 17571
@16384 // 17572
A=D+A // 17573
D=M // 17574
@SP // 17575
AM=M+1 // 17576
A=A-1 // 17577
M=D // 17578
@LCL // 17579
D=M // 17580
@6 // 17581
A=D+A // 17582
D=!M // 17583
@SP // 17584
AM=M-1 // 17585
D=D&M // 17586
@SP // 17587
AM=M+1 // 17588
A=A-1 // 17589
M=D // 17590
@LCL // 17591
D=M // 17592
@7 // 17593
A=D+A // 17594
D=M // 17595
@16384 // 17596
D=D+A // 17597
@4 // 17598
M=D // 17599
@SP // 17600
AM=M-1 // 17601
D=M // 17602
@THAT // 17603
A=M // 17604
M=D // 17605

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

@LCL // 17606
A=M+1 // 17607
D=M // 17608
@SP // 17609
AM=M+1 // 17610
A=A-1 // 17611
M=D+1 // 17612
@LCL // 17613
D=M // 17614
@8 // 17615
A=D+A // 17616
D=A // 17617
@R13 // 17618
M=D // 17619
@SP // 17620
AM=M-1 // 17621
D=M // 17622
@R13 // 17623
A=M // 17624
M=D // 17625

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
@Screen.drawRectangle.EQ.39 // 17626
D=A // 17627
@SP // 17628
AM=M+1 // 17629
A=A-1 // 17630
M=D // 17631
@Screen.drawRectangle.LT.40 // 17632
D=A // 17633
@SP // 17634
AM=M+1 // 17635
A=A-1 // 17636
M=D // 17637
@LCL // 17638
D=M // 17639
@8 // 17640
A=D+A // 17641
D=M // 17642
@SP // 17643
AM=M+1 // 17644
A=A-1 // 17645
M=D // 17646
@LCL // 17647
A=M+1 // 17648
A=A+1 // 17649
D=M // 17650
@SP // 17651
AM=M-1 // 17652
D=M-D // 17653
@14 // 17654
M=D // 17655
@SP // 17656
AM=M-1 // 17657
D=M // 17658
@13 // 17659
M=D // 17660
@14 // 17661
D=M // 17662
@DO_LT // 17663
0;JMP // 17664
(Screen.drawRectangle.LT.40)
@14 // 17665
M=D // 17666
@SP // 17667
AM=M-1 // 17668
D=M // 17669
@13 // 17670
M=D // 17671
@14 // 17672
D=M // 17673
@DO_EQ // 17674
0;JMP // 17675
(Screen.drawRectangle.EQ.39)
@WHILE_END_Screen.drawRectangle2 // 17676
D;JNE // 17677

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

@LCL // 17678
D=M // 17679
@8 // 17680
A=D+A // 17681
D=M // 17682
A=A-1 // 17683
A=A-1 // 17684
A=A-1 // 17685
D=D+M // 17686
@SP // 17687
AM=M+1 // 17688
A=A-1 // 17689
M=D // 17690
@LCL // 17691
D=M // 17692
@7 // 17693
A=D+A // 17694
D=A // 17695
@R13 // 17696
M=D // 17697
@SP // 17698
AM=M-1 // 17699
D=M // 17700
@R13 // 17701
A=M // 17702
M=D // 17703

////  nested:
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
//    PushPopPair {
//      push: PushInstruction("local 9")
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 17704
D=M // 17705
@8 // 17706
A=D+A // 17707
D=M // 17708
@SP // 17709
AM=M+1 // 17710
A=A-1 // 17711
M=D+1 // 17712
@LCL // 17713
D=M // 17714
@9 // 17715
A=D+A // 17716
D=M // 17717
@SP // 17718
AM=M+1 // 17719
A=A-1 // 17720
M=D // 17721
@LCL // 17722
D=M // 17723
@7 // 17724
A=D+A // 17725
D=M // 17726
@16384 // 17727
D=D+A // 17728
@4 // 17729
M=D // 17730
@SP // 17731
AM=M-1 // 17732
D=M // 17733
@THAT // 17734
A=M // 17735
M=D // 17736
@LCL // 17737
D=M // 17738
@8 // 17739
A=D+A // 17740
D=A // 17741
@R13 // 17742
M=D // 17743
@SP // 17744
AM=M-1 // 17745
D=M // 17746
@R13 // 17747
A=M // 17748
M=D // 17749

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 17750
0;JMP // 17751

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 17752
D=M // 17753
@5 // 17754
A=D+A // 17755
D=M // 17756
A=A-1 // 17757
A=A-1 // 17758
A=A-1 // 17759
D=D+M // 17760
@SP // 17761
AM=M+1 // 17762
A=A-1 // 17763
M=D // 17764
@LCL // 17765
D=M // 17766
@4 // 17767
A=D+A // 17768
D=M // 17769
@SP // 17770
AM=M+1 // 17771
A=A-1 // 17772
M=D+1 // 17773
// call Math.twoToThe
@6 // 17774
D=A // 17775
@14 // 17776
M=D // 17777
@Math.twoToThe // 17778
D=A // 17779
@13 // 17780
M=D // 17781
@Screen.drawRectangle.ret.6 // 17782
D=A // 17783
@CALL // 17784
0;JMP // 17785
(Screen.drawRectangle.ret.6)
@SP // 17786
AM=M-1 // 17787
D=M // 17788
D=M-1 // 17789
@SP // 17790
AM=M+1 // 17791
A=A-1 // 17792
M=D // 17793
@LCL // 17794
D=M // 17795
@6 // 17796
A=D+A // 17797
D=A // 17798
@R13 // 17799
M=D // 17800
@SP // 17801
AM=M-1 // 17802
D=M // 17803
@R13 // 17804
A=M // 17805
M=D // 17806
@LCL // 17807
D=M // 17808
@7 // 17809
A=D+A // 17810
D=A // 17811
@R13 // 17812
M=D // 17813
@SP // 17814
AM=M-1 // 17815
D=M // 17816
@R13 // 17817
A=M // 17818
M=D // 17819

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.41 // 17820
D=A // 17821
@SP // 17822
AM=M+1 // 17823
A=A-1 // 17824
M=D // 17825
@Screen.0 // 17826
D=M // 17827
@14 // 17828
M=D // 17829
@SP // 17830
AM=M-1 // 17831
D=M // 17832
@13 // 17833
M=D // 17834
@14 // 17835
D=M // 17836
@DO_EQ // 17837
0;JMP // 17838
(Screen.drawRectangle.EQ.41)
@Screen.drawRectangle.IfElse5 // 17839
D;JNE // 17840

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 16384"),
//                    right:
//                        PushInstruction("local 7"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("local 6"),
//    binaryOp: "OR"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 17841
D=M // 17842
@7 // 17843
A=D+A // 17844
D=M // 17845
@16384 // 17846
A=D+A // 17847
D=M // 17848
@SP // 17849
AM=M+1 // 17850
A=A-1 // 17851
M=D // 17852
@LCL // 17853
D=M // 17854
@6 // 17855
A=D+A // 17856
D=M // 17857
@SP // 17858
AM=M-1 // 17859
D=D|M // 17860
@SP // 17861
AM=M+1 // 17862
A=A-1 // 17863
M=D // 17864
@LCL // 17865
D=M // 17866
@7 // 17867
A=D+A // 17868
D=M // 17869
@16384 // 17870
D=D+A // 17871
@4 // 17872
M=D // 17873
@SP // 17874
AM=M-1 // 17875
D=M // 17876
@THAT // 17877
A=M // 17878
M=D // 17879

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 17880
0;JMP // 17881

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////  nested:
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
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 16384"),
//                    right:
//                        PushInstruction("local 7"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        UnaryPushGroup(            PushInstruction("local 6"),
//NOT),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=that 0}
//}

@LCL // 17882
D=M // 17883
@7 // 17884
A=D+A // 17885
D=M // 17886
@16384 // 17887
A=D+A // 17888
D=M // 17889
@SP // 17890
AM=M+1 // 17891
A=A-1 // 17892
M=D // 17893
@LCL // 17894
D=M // 17895
@6 // 17896
A=D+A // 17897
D=!M // 17898
@SP // 17899
AM=M-1 // 17900
D=D&M // 17901
@SP // 17902
AM=M+1 // 17903
A=A-1 // 17904
M=D // 17905
@LCL // 17906
D=M // 17907
@7 // 17908
A=D+A // 17909
D=M // 17910
@16384 // 17911
D=D+A // 17912
@4 // 17913
M=D // 17914
@SP // 17915
AM=M-1 // 17916
D=M // 17917
@THAT // 17918
A=M // 17919
M=D // 17920

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

@LCL // 17921
A=M // 17922
D=M+1 // 17923
@LCL // 17924
A=M // 17925
M=D // 17926

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 17927
0;JMP // 17928

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 17929
AM=M+1 // 17930
A=A-1 // 17931
M=0 // 17932

////ReturnInstruction{}
@RETURN // 17933
0;JMP // 17934

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 17935
AM=M+1 // 17936
A=A-1 // 17937
M=0 // 17938

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 17939
@LCL // 17940
A=M // 17941
M=D // 17942

////LabelInstruction{label='WHILE_START_Screen.clearScreen1}
// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)

////ConditionalGroup{push=BinaryPushGroup(
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
@Screen.clearScreen.EQ.43 // 17943
D=A // 17944
@SP // 17945
AM=M+1 // 17946
A=A-1 // 17947
M=D // 17948
@Screen.clearScreen.LT.44 // 17949
D=A // 17950
@SP // 17951
AM=M+1 // 17952
A=A-1 // 17953
M=D // 17954
@LCL // 17955
A=M // 17956
D=M // 17957
@8192 // 17958
D=D-A // 17959
@14 // 17960
M=D // 17961
@SP // 17962
AM=M-1 // 17963
D=M // 17964
@13 // 17965
M=D // 17966
@14 // 17967
D=M // 17968
@DO_LT // 17969
0;JMP // 17970
(Screen.clearScreen.LT.44)
@14 // 17971
M=D // 17972
@SP // 17973
AM=M-1 // 17974
D=M // 17975
@13 // 17976
M=D // 17977
@14 // 17978
D=M // 17979
@DO_EQ // 17980
0;JMP // 17981
(Screen.clearScreen.EQ.43)
@WHILE_END_Screen.clearScreen1 // 17982
D;JNE // 17983

////  nested:
//      nested:
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=pointer 1}
//        }
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 17984
A=M // 17985
D=M // 17986
@SP // 17987
AM=M+1 // 17988
A=A-1 // 17989
M=D+1 // 17990
@LCL // 17991
A=M // 17992
D=M // 17993
@16384 // 17994
A=D+A // 17995
M=0 // 17996
@SP // 17997
AM=M-1 // 17998
D=M // 17999
@LCL // 18000
A=M // 18001
M=D // 18002

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 18003
0;JMP // 18004

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 18005
AM=M+1 // 18006
A=A-1 // 18007
M=0 // 18008

////ReturnInstruction{}
@RETURN // 18009
0;JMP // 18010

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 18011
D=A // 18012
@SP // 18013
AM=M+1 // 18014
A=A-1 // 18015
M=D // 18016
// call Memory.alloc
@6 // 18017
D=A // 18018
@14 // 18019
M=D // 18020
@Memory.alloc // 18021
D=A // 18022
@13 // 18023
M=D // 18024
@String.new.ret.0 // 18025
D=A // 18026
@CALL // 18027
0;JMP // 18028
(String.new.ret.0)
@SP // 18029
AM=M-1 // 18030
D=M // 18031
@3 // 18032
M=D // 18033

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
@String.new.EQ.1 // 18034
D=A // 18035
@SP // 18036
AM=M+1 // 18037
A=A-1 // 18038
M=D // 18039
@String.new.EQ.2 // 18040
D=A // 18041
@SP // 18042
AM=M+1 // 18043
A=A-1 // 18044
M=D // 18045
@ARG // 18046
A=M // 18047
D=M // 18048
@14 // 18049
M=D // 18050
@SP // 18051
AM=M-1 // 18052
D=M // 18053
@13 // 18054
M=D // 18055
@14 // 18056
D=M // 18057
@DO_EQ // 18058
0;JMP // 18059
(String.new.EQ.2)
@14 // 18060
M=D // 18061
@SP // 18062
AM=M-1 // 18063
D=M // 18064
@13 // 18065
M=D // 18066
@14 // 18067
D=M // 18068
@DO_EQ // 18069
0;JMP // 18070
(String.new.EQ.1)
@String.new.IfElse1 // 18071
D;JNE // 18072

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

D=0 // 18073
@THIS // 18074
A=M // 18075
M=D // 18076

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 18077
0;JMP // 18078

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 18079
A=M // 18080
D=M // 18081
@SP // 18082
AM=M+1 // 18083
A=A-1 // 18084
M=D // 18085
// call Array.new
@6 // 18086
D=A // 18087
@14 // 18088
M=D // 18089
@Array.new // 18090
D=A // 18091
@13 // 18092
M=D // 18093
@String.new.ret.1 // 18094
D=A // 18095
@CALL // 18096
0;JMP // 18097
(String.new.ret.1)
@SP // 18098
AM=M-1 // 18099
D=M // 18100
@THIS // 18101
A=M // 18102
M=D // 18103

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=this 2}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@SP // 18104
AM=M+1 // 18105
A=A-1 // 18106
M=0 // 18107
@ARG // 18108
A=M // 18109
D=M // 18110
@THIS // 18111
A=M+1 // 18112
A=A+1 // 18113
M=D // 18114
@SP // 18115
AM=M-1 // 18116
D=M // 18117
@THIS // 18118
A=M+1 // 18119
M=D // 18120

////PushInstruction("pointer 0")
@3 // 18121
D=M // 18122
@SP // 18123
AM=M+1 // 18124
A=A-1 // 18125
M=D // 18126

////ReturnInstruction{}
@RETURN // 18127
0;JMP // 18128

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18129
A=M // 18130
D=M // 18131
@3 // 18132
M=D // 18133

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
@String.dispose.EQ.4 // 18134
D=A // 18135
@SP // 18136
AM=M+1 // 18137
A=A-1 // 18138
M=D // 18139
@String.dispose.EQ.5 // 18140
D=A // 18141
@SP // 18142
AM=M+1 // 18143
A=A-1 // 18144
M=D // 18145
@THIS // 18146
A=M // 18147
D=M // 18148
@14 // 18149
M=D // 18150
@SP // 18151
AM=M-1 // 18152
D=M // 18153
@13 // 18154
M=D // 18155
@14 // 18156
D=M // 18157
@DO_EQ // 18158
0;JMP // 18159
(String.dispose.EQ.5)
D=!D // 18160
@14 // 18161
M=D // 18162
@SP // 18163
AM=M-1 // 18164
D=M // 18165
@13 // 18166
M=D // 18167
@14 // 18168
D=M // 18169
@DO_EQ // 18170
0;JMP // 18171
(String.dispose.EQ.4)
@String.dispose.IfElse1 // 18172
D;JNE // 18173

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18174
A=M // 18175
D=M // 18176
@SP // 18177
AM=M+1 // 18178
A=A-1 // 18179
M=D // 18180
// call Array.dispose
@6 // 18181
D=A // 18182
@14 // 18183
M=D // 18184
@Array.dispose // 18185
D=A // 18186
@13 // 18187
M=D // 18188
@String.dispose.ret.0 // 18189
D=A // 18190
@CALL // 18191
0;JMP // 18192
(String.dispose.ret.0)
@SP // 18193
AM=M-1 // 18194
D=M // 18195
@5 // 18196
M=D // 18197

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 18198
0;JMP // 18199

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 18200
AM=M+1 // 18201
A=A-1 // 18202
M=0 // 18203

////ReturnInstruction{}
@RETURN // 18204
0;JMP // 18205

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18206
A=M // 18207
D=M // 18208
@3 // 18209
M=D // 18210

////PushInstruction("this 1")
@THIS // 18211
A=M+1 // 18212
D=M // 18213
@SP // 18214
AM=M+1 // 18215
A=A-1 // 18216
M=D // 18217

////ReturnInstruction{}
@RETURN // 18218
0;JMP // 18219

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=pointer 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=pointer 1}
//}

@THIS // 18220
A=M // 18221
D=M // 18222
@SP // 18223
AM=M+1 // 18224
A=A-1 // 18225
M=D // 18226
@ARG // 18227
A=M+1 // 18228
D=M // 18229
@SP // 18230
AM=M-1 // 18231
D=D+M // 18232
@SP // 18233
AM=M+1 // 18234
A=A-1 // 18235
M=D // 18236
@ARG // 18237
A=M // 18238
D=M // 18239
@3 // 18240
M=D // 18241
@SP // 18242
AM=M-1 // 18243
D=M // 18244
@4 // 18245
M=D // 18246

////PushInstruction("that 0")
@THAT // 18247
A=M // 18248
D=M // 18249
@SP // 18250
AM=M+1 // 18251
A=A-1 // 18252
M=D // 18253

////ReturnInstruction{}
@RETURN // 18254
0;JMP // 18255

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18256
A=M // 18257
D=M // 18258
@3 // 18259
M=D // 18260

////  nested:
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
//PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=that 0}
//}

@ARG // 18261
A=M+1 // 18262
A=A+1 // 18263
D=M // 18264
@SP // 18265
AM=M+1 // 18266
A=A-1 // 18267
M=D // 18268
@THIS // 18269
A=M // 18270
D=M // 18271
@SP // 18272
AM=M+1 // 18273
A=A-1 // 18274
M=D // 18275
@ARG // 18276
A=M+1 // 18277
D=M // 18278
@SP // 18279
AM=M-1 // 18280
D=D+M // 18281
@4 // 18282
M=D // 18283
@SP // 18284
AM=M-1 // 18285
D=M // 18286
@THAT // 18287
A=M // 18288
M=D // 18289

////PushInstruction("constant 0")
@SP // 18290
AM=M+1 // 18291
A=A-1 // 18292
M=0 // 18293

////ReturnInstruction{}
@RETURN // 18294
0;JMP // 18295

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 18296
AM=M+1 // 18297
A=A-1 // 18298
M=0 // 18299

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18300
A=M // 18301
D=M // 18302
@3 // 18303
M=D // 18304

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
@String.appendChar.EQ.7 // 18305
D=A // 18306
@SP // 18307
AM=M+1 // 18308
A=A-1 // 18309
M=D // 18310
@String.appendChar.EQ.8 // 18311
D=A // 18312
@SP // 18313
AM=M+1 // 18314
A=A-1 // 18315
M=D // 18316
@THIS // 18317
A=M+1 // 18318
A=A+1 // 18319
D=M // 18320
A=A-1 // 18321
D=M-D // 18322
@14 // 18323
M=D // 18324
@SP // 18325
AM=M-1 // 18326
D=M // 18327
@13 // 18328
M=D // 18329
@14 // 18330
D=M // 18331
@DO_EQ // 18332
0;JMP // 18333
(String.appendChar.EQ.8)
@14 // 18334
M=D // 18335
@SP // 18336
AM=M-1 // 18337
D=M // 18338
@13 // 18339
M=D // 18340
@14 // 18341
D=M // 18342
@DO_EQ // 18343
0;JMP // 18344
(String.appendChar.EQ.7)
@String.appendChar.IfElse1 // 18345
D;JNE // 18346

////  nested:
//      nested:
//          nested:
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
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//              pop:  PopInstruction{address=temp 0}
//            }
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=this 2}
//    }
//PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 18347
A=M // 18348
D=M // 18349
@SP // 18350
AM=M+1 // 18351
A=A-1 // 18352
M=D // 18353
@THIS // 18354
A=M+1 // 18355
A=A+1 // 18356
D=M // 18357
D=D+M // 18358
@SP // 18359
AM=M+1 // 18360
A=A-1 // 18361
M=D // 18362
@THIS // 18363
A=M // 18364
D=M // 18365
@SP // 18366
AM=M+1 // 18367
A=A-1 // 18368
M=D // 18369
// call Array.dispose
@6 // 18370
D=A // 18371
@14 // 18372
M=D // 18373
@Array.dispose // 18374
D=A // 18375
@13 // 18376
M=D // 18377
@String.appendChar.ret.0 // 18378
D=A // 18379
@CALL // 18380
0;JMP // 18381
(String.appendChar.ret.0)
@THIS // 18382
A=M // 18383
D=M // 18384
@SP // 18385
AM=M+1 // 18386
A=A-1 // 18387
M=D // 18388
@LCL // 18389
A=M // 18390
D=M // 18391
@SP // 18392
AM=M+1 // 18393
A=A-1 // 18394
M=D // 18395
@THIS // 18396
A=M+1 // 18397
D=M // 18398
@SP // 18399
AM=M+1 // 18400
A=A-1 // 18401
M=D // 18402
// call Memory.copy
@8 // 18403
D=A // 18404
@14 // 18405
M=D // 18406
@Memory.copy // 18407
D=A // 18408
@13 // 18409
M=D // 18410
@String.appendChar.ret.1 // 18411
D=A // 18412
@CALL // 18413
0;JMP // 18414
(String.appendChar.ret.1)
@THIS // 18415
A=M+1 // 18416
A=A+1 // 18417
D=M // 18418
D=D+M // 18419
@SP // 18420
AM=M+1 // 18421
A=A-1 // 18422
M=D // 18423
// call Array.new
@6 // 18424
D=A // 18425
@14 // 18426
M=D // 18427
@Array.new // 18428
D=A // 18429
@13 // 18430
M=D // 18431
@String.appendChar.ret.2 // 18432
D=A // 18433
@CALL // 18434
0;JMP // 18435
(String.appendChar.ret.2)
@SP // 18436
AM=M-1 // 18437
D=M // 18438
@LCL // 18439
A=M // 18440
M=D // 18441
@SP // 18442
AM=M-1 // 18443
D=M // 18444
@5 // 18445
M=D // 18446
@SP // 18447
AM=M-1 // 18448
D=M // 18449
@5 // 18450
M=D // 18451
@SP // 18452
AM=M-1 // 18453
D=M // 18454
@THIS // 18455
A=M+1 // 18456
A=A+1 // 18457
M=D // 18458
@SP // 18459
AM=M-1 // 18460
D=M // 18461
@THIS // 18462
A=M // 18463
M=D // 18464

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 18465
0;JMP // 18466

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////  nested:
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
//    PushPopPair {
//      push: PushInstruction("argument 1")
//      pop:  PopInstruction{address=that 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 18467
A=M+1 // 18468
D=M // 18469
@SP // 18470
AM=M+1 // 18471
A=A-1 // 18472
M=D+1 // 18473
@ARG // 18474
A=M+1 // 18475
D=M // 18476
@SP // 18477
AM=M+1 // 18478
A=A-1 // 18479
M=D // 18480
@THIS // 18481
A=M+1 // 18482
D=M // 18483
A=A-1 // 18484
D=D+M // 18485
@4 // 18486
M=D // 18487
@SP // 18488
AM=M-1 // 18489
D=M // 18490
@THAT // 18491
A=M // 18492
M=D // 18493
@SP // 18494
AM=M-1 // 18495
D=M // 18496
@THIS // 18497
A=M+1 // 18498
M=D // 18499

////PushInstruction("pointer 0")
@3 // 18500
D=M // 18501
@SP // 18502
AM=M+1 // 18503
A=A-1 // 18504
M=D // 18505

////ReturnInstruction{}
@RETURN // 18506
0;JMP // 18507

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////  nested:
//    PushPopPair {
//      push: PushInstruction("argument 0")
//      pop:  PopInstruction{address=pointer 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 18508
A=M+1 // 18509
D=M // 18510
@SP // 18511
AM=M+1 // 18512
A=A-1 // 18513
M=D-1 // 18514
@ARG // 18515
A=M // 18516
D=M // 18517
@3 // 18518
M=D // 18519
@SP // 18520
AM=M-1 // 18521
D=M // 18522
@THIS // 18523
A=M+1 // 18524
M=D // 18525

////PushInstruction("constant 0")
@SP // 18526
AM=M+1 // 18527
A=A-1 // 18528
M=0 // 18529

////ReturnInstruction{}
@RETURN // 18530
0;JMP // 18531

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 18532
AM=M+1 // 18533
A=A-1 // 18534
M=0 // 18535
@SP // 18536
AM=M+1 // 18537
A=A-1 // 18538
M=0 // 18539

////  nested:
//      nested:
//        PushPopPair {
//          push: PushInstruction("argument 0")
//          pop:  PopInstruction{address=pointer 0}
//        }
//    PushPopPair {
//      push: PushInstruction("constant 1")
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@SP // 18540
AM=M+1 // 18541
A=A-1 // 18542
M=0 // 18543
@SP // 18544
AM=M+1 // 18545
A=A-1 // 18546
M=1 // 18547
@ARG // 18548
A=M // 18549
D=M // 18550
@3 // 18551
M=D // 18552
@SP // 18553
AM=M-1 // 18554
D=M // 18555
@LCL // 18556
A=M+1 // 18557
M=D // 18558
@SP // 18559
AM=M-1 // 18560
D=M // 18561
@LCL // 18562
A=M // 18563
M=D // 18564

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
@String.intValue.EQ.10 // 18565
D=A // 18566
@SP // 18567
AM=M+1 // 18568
A=A-1 // 18569
M=D // 18570
@String.intValue.LT.11 // 18571
D=A // 18572
@SP // 18573
AM=M+1 // 18574
A=A-1 // 18575
M=D // 18576
@LCL // 18577
A=M+1 // 18578
D=M // 18579
@SP // 18580
AM=M+1 // 18581
A=A-1 // 18582
M=D // 18583
@THIS // 18584
A=M+1 // 18585
D=M // 18586
@SP // 18587
AM=M-1 // 18588
D=M-D // 18589
@14 // 18590
M=D // 18591
@SP // 18592
AM=M-1 // 18593
D=M // 18594
@13 // 18595
M=D // 18596
@14 // 18597
D=M // 18598
@DO_LT // 18599
0;JMP // 18600
(String.intValue.LT.11)
@14 // 18601
M=D // 18602
@SP // 18603
AM=M-1 // 18604
D=M // 18605
@13 // 18606
M=D // 18607
@14 // 18608
D=M // 18609
@DO_EQ // 18610
0;JMP // 18611
(String.intValue.EQ.10)
@WHILE_END_String.intValue1 // 18612
D;JNE // 18613

////  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.intValue'}},
//    right:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("this 0"),
//                            right:
//                                PushInstruction("local 1"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 48"),
//            binaryOp: "SUB"
//        ),
//    binaryOp: "ADD"
//)
//      pop:  PopInstruction{address=local 0}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 18614
A=M+1 // 18615
D=M // 18616
@SP // 18617
AM=M+1 // 18618
A=A-1 // 18619
M=D+1 // 18620
@LCL // 18621
A=M // 18622
D=M // 18623
@SP // 18624
AM=M+1 // 18625
A=A-1 // 18626
M=D // 18627
@10 // 18628
D=A // 18629
@SP // 18630
AM=M+1 // 18631
A=A-1 // 18632
M=D // 18633
// call Math.multiply
@7 // 18634
D=A // 18635
@14 // 18636
M=D // 18637
@Math.multiply // 18638
D=A // 18639
@13 // 18640
M=D // 18641
@String.intValue.ret.0 // 18642
D=A // 18643
@CALL // 18644
0;JMP // 18645
(String.intValue.ret.0)
@THIS // 18646
A=M // 18647
D=M // 18648
@SP // 18649
AM=M+1 // 18650
A=A-1 // 18651
M=D // 18652
@LCL // 18653
A=M+1 // 18654
D=M // 18655
@SP // 18656
AM=M-1 // 18657
A=D+M // 18658
D=M // 18659
@48 // 18660
D=D-A // 18661
@SP // 18662
AM=M-1 // 18663
D=D+M // 18664
@LCL // 18665
A=M // 18666
M=D // 18667
@SP // 18668
AM=M-1 // 18669
D=M // 18670
@LCL // 18671
A=M+1 // 18672
M=D // 18673

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 18674
0;JMP // 18675

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 18676
A=M // 18677
D=M // 18678
@SP // 18679
AM=M+1 // 18680
A=A-1 // 18681
M=D // 18682

////ReturnInstruction{}
@RETURN // 18683
0;JMP // 18684

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 18685
AM=M+1 // 18686
A=A-1 // 18687
M=0 // 18688
@SP // 18689
AM=M+1 // 18690
A=A-1 // 18691
M=0 // 18692
@SP // 18693
AM=M+1 // 18694
A=A-1 // 18695
M=0 // 18696
@SP // 18697
AM=M+1 // 18698
A=A-1 // 18699
M=0 // 18700
@SP // 18701
AM=M+1 // 18702
A=A-1 // 18703
M=0 // 18704
@SP // 18705
AM=M+1 // 18706
A=A-1 // 18707
M=0 // 18708

////  nested:
//      nested:
//        PushPopPair {
//          push: PushInstruction("argument 0")
//          pop:  PopInstruction{address=pointer 0}
//        }
//    PushPopPair {
//      push: PushInstruction("constant 0")
//      pop:  PopInstruction{address=this 1}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@SP // 18709
AM=M+1 // 18710
A=A-1 // 18711
M=0 // 18712
@SP // 18713
AM=M+1 // 18714
A=A-1 // 18715
M=0 // 18716
@ARG // 18717
A=M // 18718
D=M // 18719
@3 // 18720
M=D // 18721
@SP // 18722
AM=M-1 // 18723
D=M // 18724
@THIS // 18725
A=M+1 // 18726
M=D // 18727
@LCL // 18728
D=M // 18729
@4 // 18730
A=D+A // 18731
D=A // 18732
@R13 // 18733
M=D // 18734
@SP // 18735
AM=M-1 // 18736
D=M // 18737
@R13 // 18738
A=M // 18739
M=D // 18740

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
@String.setInt.EQ.13 // 18741
D=A // 18742
@SP // 18743
AM=M+1 // 18744
A=A-1 // 18745
M=D // 18746
@String.setInt.EQ.14 // 18747
D=A // 18748
@SP // 18749
AM=M+1 // 18750
A=A-1 // 18751
M=D // 18752
@ARG // 18753
A=M+1 // 18754
D=M // 18755
@14 // 18756
M=D // 18757
@SP // 18758
AM=M-1 // 18759
D=M // 18760
@13 // 18761
M=D // 18762
@14 // 18763
D=M // 18764
@DO_EQ // 18765
0;JMP // 18766
(String.setInt.EQ.14)
@14 // 18767
M=D // 18768
@SP // 18769
AM=M-1 // 18770
D=M // 18771
@13 // 18772
M=D // 18773
@14 // 18774
D=M // 18775
@DO_EQ // 18776
0;JMP // 18777
(String.setInt.EQ.13)
@String.setInt.IfElse1 // 18778
D;JNE // 18779

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 18780
D=M // 18781
@SP // 18782
AM=M+1 // 18783
A=A-1 // 18784
M=D // 18785
@48 // 18786
D=A // 18787
@SP // 18788
AM=M+1 // 18789
A=A-1 // 18790
M=D // 18791
// call String.appendChar
@7 // 18792
D=A // 18793
@14 // 18794
M=D // 18795
@String.appendChar // 18796
D=A // 18797
@13 // 18798
M=D // 18799
@String.setInt.ret.0 // 18800
D=A // 18801
@CALL // 18802
0;JMP // 18803
(String.setInt.ret.0)
@SP // 18804
AM=M-1 // 18805
D=M // 18806
@5 // 18807
M=D // 18808

////PushInstruction("constant 0")
@SP // 18809
AM=M+1 // 18810
A=A-1 // 18811
M=0 // 18812

////ReturnInstruction{}
@RETURN // 18813
0;JMP // 18814

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 18815
0;JMP // 18816

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
@String.setInt.EQ.16 // 18817
D=A // 18818
@SP // 18819
AM=M+1 // 18820
A=A-1 // 18821
M=D // 18822
@String.setInt.LT.17 // 18823
D=A // 18824
@SP // 18825
AM=M+1 // 18826
A=A-1 // 18827
M=D // 18828
@ARG // 18829
A=M+1 // 18830
D=M // 18831
@14 // 18832
M=D // 18833
@SP // 18834
AM=M-1 // 18835
D=M // 18836
@13 // 18837
M=D // 18838
@14 // 18839
D=M // 18840
@DO_LT // 18841
0;JMP // 18842
(String.setInt.LT.17)
@14 // 18843
M=D // 18844
@SP // 18845
AM=M-1 // 18846
D=M // 18847
@13 // 18848
M=D // 18849
@14 // 18850
D=M // 18851
@DO_EQ // 18852
0;JMP // 18853
(String.setInt.EQ.16)
@String.setInt.IfElse2 // 18854
D;JNE // 18855

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@SP // 18856
AM=M+1 // 18857
A=A-1 // 18858
M=1 // 18859
@LCL // 18860
D=M // 18861
@4 // 18862
A=D+A // 18863
D=A // 18864
@R13 // 18865
M=D // 18866
@SP // 18867
AM=M-1 // 18868
D=M // 18869
@R13 // 18870
A=M // 18871
M=D // 18872

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
@String.setInt.EQ.20 // 18873
D=A // 18874
@SP // 18875
AM=M+1 // 18876
A=A-1 // 18877
M=D // 18878
@String.setInt.LT.21 // 18879
D=A // 18880
@SP // 18881
AM=M+1 // 18882
A=A-1 // 18883
M=D // 18884
@ARG // 18885
A=M+1 // 18886
D=M // 18887
@14 // 18888
M=D // 18889
@SP // 18890
AM=M-1 // 18891
D=M // 18892
@13 // 18893
M=D // 18894
@14 // 18895
D=M // 18896
@DO_LT // 18897
0;JMP // 18898
(String.setInt.LT.21)
@SP // 18899
AM=M+1 // 18900
A=A-1 // 18901
M=D // 18902
@String.setInt.EQ.22 // 18903
D=A // 18904
@SP // 18905
AM=M+1 // 18906
A=A-1 // 18907
M=D // 18908
@ARG // 18909
A=M+1 // 18910
D=M // 18911
@32767 // 18912
D=D&A // 18913
@32767 // 18914
D=D-A // 18915
@14 // 18916
M=D // 18917
@SP // 18918
AM=M-1 // 18919
D=M // 18920
@13 // 18921
M=D // 18922
@14 // 18923
D=M // 18924
@DO_EQ // 18925
0;JMP // 18926
(String.setInt.EQ.22)
@SP // 18927
AM=M-1 // 18928
D=D&M // 18929
@14 // 18930
M=D // 18931
@SP // 18932
AM=M-1 // 18933
D=M // 18934
@13 // 18935
M=D // 18936
@14 // 18937
D=M // 18938
@DO_EQ // 18939
0;JMP // 18940
(String.setInt.EQ.20)
@String.setInt.IfElse3 // 18941
D;JNE // 18942

////  nested:
//      nested:
//          nested:
//              nested:
//                  nested:
//                    PushPopPair {
//                      push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                PushPopPair {
//                  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//                  pop:  PopInstruction{address=temp 0}
//                }
//            PushPopPair {
//              push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//              pop:  PopInstruction{address=temp 0}
//            }
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 18943
D=M // 18944
@SP // 18945
AM=M+1 // 18946
A=A-1 // 18947
M=D // 18948
@56 // 18949
D=A // 18950
@SP // 18951
AM=M+1 // 18952
A=A-1 // 18953
M=D // 18954
// call String.appendChar
@7 // 18955
D=A // 18956
@14 // 18957
M=D // 18958
@String.appendChar // 18959
D=A // 18960
@13 // 18961
M=D // 18962
@String.setInt.ret.1 // 18963
D=A // 18964
@CALL // 18965
0;JMP // 18966
(String.setInt.ret.1)
@3 // 18967
D=M // 18968
@SP // 18969
AM=M+1 // 18970
A=A-1 // 18971
M=D // 18972
@54 // 18973
D=A // 18974
@SP // 18975
AM=M+1 // 18976
A=A-1 // 18977
M=D // 18978
// call String.appendChar
@7 // 18979
D=A // 18980
@14 // 18981
M=D // 18982
@String.appendChar // 18983
D=A // 18984
@13 // 18985
M=D // 18986
@String.setInt.ret.2 // 18987
D=A // 18988
@CALL // 18989
0;JMP // 18990
(String.setInt.ret.2)
@3 // 18991
D=M // 18992
@SP // 18993
AM=M+1 // 18994
A=A-1 // 18995
M=D // 18996
@55 // 18997
D=A // 18998
@SP // 18999
AM=M+1 // 19000
A=A-1 // 19001
M=D // 19002
// call String.appendChar
@7 // 19003
D=A // 19004
@14 // 19005
M=D // 19006
@String.appendChar // 19007
D=A // 19008
@13 // 19009
M=D // 19010
@String.setInt.ret.3 // 19011
D=A // 19012
@CALL // 19013
0;JMP // 19014
(String.setInt.ret.3)
@3 // 19015
D=M // 19016
@SP // 19017
AM=M+1 // 19018
A=A-1 // 19019
M=D // 19020
@50 // 19021
D=A // 19022
@SP // 19023
AM=M+1 // 19024
A=A-1 // 19025
M=D // 19026
// call String.appendChar
@7 // 19027
D=A // 19028
@14 // 19029
M=D // 19030
@String.appendChar // 19031
D=A // 19032
@13 // 19033
M=D // 19034
@String.setInt.ret.4 // 19035
D=A // 19036
@CALL // 19037
0;JMP // 19038
(String.setInt.ret.4)
@3 // 19039
D=M // 19040
@SP // 19041
AM=M+1 // 19042
A=A-1 // 19043
M=D // 19044
@51 // 19045
D=A // 19046
@SP // 19047
AM=M+1 // 19048
A=A-1 // 19049
M=D // 19050
// call String.appendChar
@7 // 19051
D=A // 19052
@14 // 19053
M=D // 19054
@String.appendChar // 19055
D=A // 19056
@13 // 19057
M=D // 19058
@String.setInt.ret.5 // 19059
D=A // 19060
@CALL // 19061
0;JMP // 19062
(String.setInt.ret.5)
@3 // 19063
D=M // 19064
@SP // 19065
AM=M+1 // 19066
A=A-1 // 19067
M=D // 19068
@45 // 19069
D=A // 19070
@SP // 19071
AM=M+1 // 19072
A=A-1 // 19073
M=D // 19074
// call String.appendChar
@7 // 19075
D=A // 19076
@14 // 19077
M=D // 19078
@String.appendChar // 19079
D=A // 19080
@13 // 19081
M=D // 19082
@String.setInt.ret.6 // 19083
D=A // 19084
@CALL // 19085
0;JMP // 19086
(String.setInt.ret.6)
@SP // 19087
AM=M-1 // 19088
D=M // 19089
@5 // 19090
M=D // 19091
@SP // 19092
AM=M-1 // 19093
D=M // 19094
@5 // 19095
M=D // 19096
@SP // 19097
AM=M-1 // 19098
D=M // 19099
@5 // 19100
M=D // 19101
@SP // 19102
AM=M-1 // 19103
D=M // 19104
@5 // 19105
M=D // 19106
@SP // 19107
AM=M-1 // 19108
D=M // 19109
@5 // 19110
M=D // 19111
@SP // 19112
AM=M-1 // 19113
D=M // 19114
@5 // 19115
M=D // 19116

////PushInstruction("constant 0")
@SP // 19117
AM=M+1 // 19118
A=A-1 // 19119
M=0 // 19120

////ReturnInstruction{}
@RETURN // 19121
0;JMP // 19122

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 19123
0;JMP // 19124

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

@ARG // 19125
A=M+1 // 19126
D=-M // 19127
@ARG // 19128
A=M+1 // 19129
M=D // 19130

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 19131
0;JMP // 19132

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////  nested:
//    PushPopPair {
//      push: PushInstruction("argument 1")
//      pop:  PopInstruction{address=local 2}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@SP // 19133
AM=M+1 // 19134
A=A-1 // 19135
M=0 // 19136
@ARG // 19137
A=M+1 // 19138
D=M // 19139
@LCL // 19140
A=M+1 // 19141
A=A+1 // 19142
M=D // 19143
@SP // 19144
AM=M-1 // 19145
D=M // 19146
@LCL // 19147
A=M+1 // 19148
A=A+1 // 19149
A=A+1 // 19150
M=D // 19151

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
@String.setInt.EQ.24 // 19152
D=A // 19153
@SP // 19154
AM=M+1 // 19155
A=A-1 // 19156
M=D // 19157
@String.setInt.GT.25 // 19158
D=A // 19159
@SP // 19160
AM=M+1 // 19161
A=A-1 // 19162
M=D // 19163
@LCL // 19164
A=M+1 // 19165
A=A+1 // 19166
D=M // 19167
@14 // 19168
M=D // 19169
@SP // 19170
AM=M-1 // 19171
D=M // 19172
@13 // 19173
M=D // 19174
@14 // 19175
D=M // 19176
@DO_GT // 19177
0;JMP // 19178
(String.setInt.GT.25)
@14 // 19179
M=D // 19180
@SP // 19181
AM=M-1 // 19182
D=M // 19183
@13 // 19184
M=D // 19185
@14 // 19186
D=M // 19187
@DO_EQ // 19188
0;JMP // 19189
(String.setInt.EQ.24)
@WHILE_END_String.setInt1 // 19190
D;JNE // 19191

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      pop:  PopInstruction{address=local 2}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 19192
A=M+1 // 19193
A=A+1 // 19194
A=A+1 // 19195
D=M // 19196
@SP // 19197
AM=M+1 // 19198
A=A-1 // 19199
M=D+1 // 19200
@LCL // 19201
A=M+1 // 19202
A=A+1 // 19203
D=M // 19204
@SP // 19205
AM=M+1 // 19206
A=A-1 // 19207
M=D // 19208
@10 // 19209
D=A // 19210
@SP // 19211
AM=M+1 // 19212
A=A-1 // 19213
M=D // 19214
// call Math.divide
@7 // 19215
D=A // 19216
@14 // 19217
M=D // 19218
@Math.divide // 19219
D=A // 19220
@13 // 19221
M=D // 19222
@String.setInt.ret.7 // 19223
D=A // 19224
@CALL // 19225
0;JMP // 19226
(String.setInt.ret.7)
@SP // 19227
AM=M-1 // 19228
D=M // 19229
@LCL // 19230
A=M+1 // 19231
A=A+1 // 19232
M=D // 19233
@SP // 19234
AM=M-1 // 19235
D=M // 19236
@LCL // 19237
A=M+1 // 19238
A=A+1 // 19239
A=A+1 // 19240
M=D // 19241

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 19242
0;JMP // 19243

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////  nested:
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      pop:  PopInstruction{address=local 5}
//    }
//PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@SP // 19244
AM=M+1 // 19245
A=A-1 // 19246
M=0 // 19247
@LCL // 19248
A=M+1 // 19249
A=A+1 // 19250
A=A+1 // 19251
D=M // 19252
@SP // 19253
AM=M+1 // 19254
A=A-1 // 19255
M=D // 19256
// call Array.new
@6 // 19257
D=A // 19258
@14 // 19259
M=D // 19260
@Array.new // 19261
D=A // 19262
@13 // 19263
M=D // 19264
@String.setInt.ret.8 // 19265
D=A // 19266
@CALL // 19267
0;JMP // 19268
(String.setInt.ret.8)
@LCL // 19269
D=M // 19270
@5 // 19271
A=D+A // 19272
D=A // 19273
@R13 // 19274
M=D // 19275
@SP // 19276
AM=M-1 // 19277
D=M // 19278
@R13 // 19279
A=M // 19280
M=D // 19281
@SP // 19282
AM=M-1 // 19283
D=M // 19284
@LCL // 19285
A=M+1 // 19286
M=D // 19287

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
@String.setInt.EQ.27 // 19288
D=A // 19289
@SP // 19290
AM=M+1 // 19291
A=A-1 // 19292
M=D // 19293
@String.setInt.GT.28 // 19294
D=A // 19295
@SP // 19296
AM=M+1 // 19297
A=A-1 // 19298
M=D // 19299
@ARG // 19300
A=M+1 // 19301
D=M // 19302
@14 // 19303
M=D // 19304
@SP // 19305
AM=M-1 // 19306
D=M // 19307
@13 // 19308
M=D // 19309
@14 // 19310
D=M // 19311
@DO_GT // 19312
0;JMP // 19313
(String.setInt.GT.28)
@14 // 19314
M=D // 19315
@SP // 19316
AM=M-1 // 19317
D=M // 19318
@13 // 19319
M=D // 19320
@14 // 19321
D=M // 19322
@DO_EQ // 19323
0;JMP // 19324
(String.setInt.EQ.27)
@WHILE_END_String.setInt2 // 19325
D;JNE // 19326

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

@ARG // 19327
A=M+1 // 19328
D=M // 19329
@SP // 19330
AM=M+1 // 19331
A=A-1 // 19332
M=D // 19333
@ARG // 19334
A=M+1 // 19335
D=M // 19336
@SP // 19337
AM=M+1 // 19338
A=A-1 // 19339
M=D // 19340
@10 // 19341
D=A // 19342
@SP // 19343
AM=M+1 // 19344
A=A-1 // 19345
M=D // 19346
// call Math.divide
@7 // 19347
D=A // 19348
@14 // 19349
M=D // 19350
@Math.divide // 19351
D=A // 19352
@13 // 19353
M=D // 19354
@String.setInt.ret.9 // 19355
D=A // 19356
@CALL // 19357
0;JMP // 19358
(String.setInt.ret.9)
@10 // 19359
D=A // 19360
@SP // 19361
AM=M+1 // 19362
A=A-1 // 19363
M=D // 19364
// call Math.multiply
@7 // 19365
D=A // 19366
@14 // 19367
M=D // 19368
@Math.multiply // 19369
D=A // 19370
@13 // 19371
M=D // 19372
@String.setInt.ret.10 // 19373
D=A // 19374
@CALL // 19375
0;JMP // 19376
(String.setInt.ret.10)
@SP // 19377
AM=M-1 // 19378
D=M // 19379
@SP // 19380
AM=M-1 // 19381
D=M-D // 19382
@LCL // 19383
A=M // 19384
M=D // 19385

////  nested:
//      nested:
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
//        PushPopPair {
//          push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 48"),
//    binaryOp: "ADD"
//)
//          pop:  PopInstruction{address=that 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//      pop:  PopInstruction{address=argument 1}
//    }
//PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 19386
A=M+1 // 19387
D=M // 19388
@SP // 19389
AM=M+1 // 19390
A=A-1 // 19391
M=D+1 // 19392
@ARG // 19393
A=M+1 // 19394
D=M // 19395
@SP // 19396
AM=M+1 // 19397
A=A-1 // 19398
M=D // 19399
@10 // 19400
D=A // 19401
@SP // 19402
AM=M+1 // 19403
A=A-1 // 19404
M=D // 19405
// call Math.divide
@7 // 19406
D=A // 19407
@14 // 19408
M=D // 19409
@Math.divide // 19410
D=A // 19411
@13 // 19412
M=D // 19413
@String.setInt.ret.11 // 19414
D=A // 19415
@CALL // 19416
0;JMP // 19417
(String.setInt.ret.11)
@LCL // 19418
A=M // 19419
D=M // 19420
@48 // 19421
D=D+A // 19422
@SP // 19423
AM=M+1 // 19424
A=A-1 // 19425
M=D // 19426
@LCL // 19427
D=M // 19428
@5 // 19429
A=D+A // 19430
D=M // 19431
@SP // 19432
AM=M+1 // 19433
A=A-1 // 19434
M=D // 19435
@LCL // 19436
A=M+1 // 19437
D=M // 19438
@SP // 19439
AM=M-1 // 19440
D=D+M // 19441
@4 // 19442
M=D // 19443
@SP // 19444
AM=M-1 // 19445
D=M // 19446
@THAT // 19447
A=M // 19448
M=D // 19449
@SP // 19450
AM=M-1 // 19451
D=M // 19452
@ARG // 19453
A=M+1 // 19454
M=D // 19455
@SP // 19456
AM=M-1 // 19457
D=M // 19458
@LCL // 19459
A=M+1 // 19460
M=D // 19461

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 19462
0;JMP // 19463

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
@String.setInt.EQ.30 // 19464
D=A // 19465
@SP // 19466
AM=M+1 // 19467
A=A-1 // 19468
M=D // 19469
@String.setInt.EQ.31 // 19470
D=A // 19471
@SP // 19472
AM=M+1 // 19473
A=A-1 // 19474
M=D // 19475
@LCL // 19476
D=M // 19477
@4 // 19478
A=D+A // 19479
D=M-1 // 19480
@14 // 19481
M=D // 19482
@SP // 19483
AM=M-1 // 19484
D=M // 19485
@13 // 19486
M=D // 19487
@14 // 19488
D=M // 19489
@DO_EQ // 19490
0;JMP // 19491
(String.setInt.EQ.31)
@14 // 19492
M=D // 19493
@SP // 19494
AM=M-1 // 19495
D=M // 19496
@13 // 19497
M=D // 19498
@14 // 19499
D=M // 19500
@DO_EQ // 19501
0;JMP // 19502
(String.setInt.EQ.30)
@String.setInt.IfElse4 // 19503
D;JNE // 19504

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 19505
D=M // 19506
@SP // 19507
AM=M+1 // 19508
A=A-1 // 19509
M=D // 19510
@45 // 19511
D=A // 19512
@SP // 19513
AM=M+1 // 19514
A=A-1 // 19515
M=D // 19516
// call String.appendChar
@7 // 19517
D=A // 19518
@14 // 19519
M=D // 19520
@String.appendChar // 19521
D=A // 19522
@13 // 19523
M=D // 19524
@String.setInt.ret.12 // 19525
D=A // 19526
@CALL // 19527
0;JMP // 19528
(String.setInt.ret.12)
@SP // 19529
AM=M-1 // 19530
D=M // 19531
@5 // 19532
M=D // 19533

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 19534
0;JMP // 19535

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
@String.setInt.EQ.33 // 19536
D=A // 19537
@SP // 19538
AM=M+1 // 19539
A=A-1 // 19540
M=D // 19541
@String.setInt.GT.34 // 19542
D=A // 19543
@SP // 19544
AM=M+1 // 19545
A=A-1 // 19546
M=D // 19547
@LCL // 19548
A=M+1 // 19549
D=M // 19550
@14 // 19551
M=D // 19552
@SP // 19553
AM=M-1 // 19554
D=M // 19555
@13 // 19556
M=D // 19557
@14 // 19558
D=M // 19559
@DO_GT // 19560
0;JMP // 19561
(String.setInt.GT.34)
@14 // 19562
M=D // 19563
@SP // 19564
AM=M-1 // 19565
D=M // 19566
@13 // 19567
M=D // 19568
@14 // 19569
D=M // 19570
@DO_EQ // 19571
0;JMP // 19572
(String.setInt.EQ.33)
@WHILE_END_String.setInt3 // 19573
D;JNE // 19574

////  nested:
//    PushPopPair {
//      push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//      pop:  PopInstruction{address=local 1}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 5"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 19575
D=M // 19576
@SP // 19577
AM=M+1 // 19578
A=A-1 // 19579
M=D // 19580
@LCL // 19581
D=M // 19582
@5 // 19583
A=D+A // 19584
D=M // 19585
@SP // 19586
AM=M+1 // 19587
A=A-1 // 19588
M=D // 19589
@LCL // 19590
A=M+1 // 19591
D=M // 19592
@SP // 19593
AM=M-1 // 19594
A=D+M // 19595
D=M // 19596
@SP // 19597
AM=M+1 // 19598
A=A-1 // 19599
M=D // 19600
// call String.appendChar
@7 // 19601
D=A // 19602
@14 // 19603
M=D // 19604
@String.appendChar // 19605
D=A // 19606
@13 // 19607
M=D // 19608
@String.setInt.ret.13 // 19609
D=A // 19610
@CALL // 19611
0;JMP // 19612
(String.setInt.ret.13)
@LCL // 19613
A=M+1 // 19614
D=M-1 // 19615
@LCL // 19616
A=M+1 // 19617
M=D // 19618
@SP // 19619
AM=M-1 // 19620
D=M // 19621
@5 // 19622
M=D // 19623

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 19624
0;JMP // 19625

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19626
D=M // 19627
@5 // 19628
A=D+A // 19629
D=M // 19630
@SP // 19631
AM=M+1 // 19632
A=A-1 // 19633
M=D // 19634
// call Array.dispose
@6 // 19635
D=A // 19636
@14 // 19637
M=D // 19638
@Array.dispose // 19639
D=A // 19640
@13 // 19641
M=D // 19642
@String.setInt.ret.14 // 19643
D=A // 19644
@CALL // 19645
0;JMP // 19646
(String.setInt.ret.14)
@SP // 19647
AM=M-1 // 19648
D=M // 19649
@5 // 19650
M=D // 19651

////PushInstruction("constant 0")
@SP // 19652
AM=M+1 // 19653
A=A-1 // 19654
M=0 // 19655

////ReturnInstruction{}
@RETURN // 19656
0;JMP // 19657

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 19658
D=A // 19659
@SP // 19660
AM=M+1 // 19661
A=A-1 // 19662
M=D // 19663

////ReturnInstruction{}
@RETURN // 19664
0;JMP // 19665

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 19666
D=A // 19667
@SP // 19668
AM=M+1 // 19669
A=A-1 // 19670
M=D // 19671

////ReturnInstruction{}
@RETURN // 19672
0;JMP // 19673

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 19674
D=A // 19675
@SP // 19676
AM=M+1 // 19677
A=A-1 // 19678
M=D // 19679

////ReturnInstruction{}
@RETURN // 19680
0;JMP // 19681

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////  nested:
//      nested:
//          nested:
//              nested:
//                  nested:
//                      nested:
//                        PushPopPair {
//                          push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//                          pop:  PopInstruction{address=temp 0}
//                        }
//                    PushPopPair {
//                      push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//                      pop:  PopInstruction{address=temp 0}
//                    }
//                PushPopPair {
//                  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//                  pop:  PopInstruction{address=temp 0}
//                }
//            PushPopPair {
//              push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//              pop:  PopInstruction{address=temp 0}
//            }
//        PushPopPair {
//          push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 19682
D=A // 19683
@14 // 19684
M=D // 19685
@Sys.halt // 19686
D=A // 19687
@13 // 19688
M=D // 19689
@Sys.init.ret.0 // 19690
D=A // 19691
@CALL // 19692
0;JMP // 19693
(Sys.init.ret.0)
// call Main.main
@5 // 19694
D=A // 19695
@14 // 19696
M=D // 19697
@Main.main // 19698
D=A // 19699
@13 // 19700
M=D // 19701
@Sys.init.ret.1 // 19702
D=A // 19703
@CALL // 19704
0;JMP // 19705
(Sys.init.ret.1)
// call Keyboard.init
@5 // 19706
D=A // 19707
@14 // 19708
M=D // 19709
@Keyboard.init // 19710
D=A // 19711
@13 // 19712
M=D // 19713
@Sys.init.ret.2 // 19714
D=A // 19715
@CALL // 19716
0;JMP // 19717
(Sys.init.ret.2)
// call Output.init
@5 // 19718
D=A // 19719
@14 // 19720
M=D // 19721
@Output.init // 19722
D=A // 19723
@13 // 19724
M=D // 19725
@Sys.init.ret.3 // 19726
D=A // 19727
@CALL // 19728
0;JMP // 19729
(Sys.init.ret.3)
// call Screen.init
@5 // 19730
D=A // 19731
@14 // 19732
M=D // 19733
@Screen.init // 19734
D=A // 19735
@13 // 19736
M=D // 19737
@Sys.init.ret.4 // 19738
D=A // 19739
@CALL // 19740
0;JMP // 19741
(Sys.init.ret.4)
// call Math.init
@5 // 19742
D=A // 19743
@14 // 19744
M=D // 19745
@Math.init // 19746
D=A // 19747
@13 // 19748
M=D // 19749
@Sys.init.ret.5 // 19750
D=A // 19751
@CALL // 19752
0;JMP // 19753
(Sys.init.ret.5)
// call Memory.init
@5 // 19754
D=A // 19755
@14 // 19756
M=D // 19757
@Memory.init // 19758
D=A // 19759
@13 // 19760
M=D // 19761
@Sys.init.ret.6 // 19762
D=A // 19763
@CALL // 19764
0;JMP // 19765
(Sys.init.ret.6)
@SP // 19766
AM=M-1 // 19767
D=M // 19768
@5 // 19769
M=D // 19770
@SP // 19771
AM=M-1 // 19772
D=M // 19773
@5 // 19774
M=D // 19775
@SP // 19776
AM=M-1 // 19777
D=M // 19778
@5 // 19779
M=D // 19780
@SP // 19781
AM=M-1 // 19782
D=M // 19783
@5 // 19784
M=D // 19785
@SP // 19786
AM=M-1 // 19787
D=M // 19788
@5 // 19789
M=D // 19790
@SP // 19791
AM=M-1 // 19792
D=M // 19793
@5 // 19794
M=D // 19795
@SP // 19796
AM=M-1 // 19797
D=M // 19798
@5 // 19799
M=D // 19800

////PushInstruction("constant 0")
@SP // 19801
AM=M+1 // 19802
A=A-1 // 19803
M=0 // 19804

////ReturnInstruction{}
@RETURN // 19805
0;JMP // 19806

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
D=0 // 19807
@WHILE_END_Sys.halt1 // 19808
D;JNE // 19809

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 19810
0;JMP // 19811

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 19812
AM=M+1 // 19813
A=A-1 // 19814
M=0 // 19815

////ReturnInstruction{}
@RETURN // 19816
0;JMP // 19817

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 19818
AM=M+1 // 19819
A=A-1 // 19820
M=0 // 19821

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
@Sys.wait.EQ.1 // 19822
D=A // 19823
@SP // 19824
AM=M+1 // 19825
A=A-1 // 19826
M=D // 19827
@Sys.wait.GT.2 // 19828
D=A // 19829
@SP // 19830
AM=M+1 // 19831
A=A-1 // 19832
M=D // 19833
@ARG // 19834
A=M // 19835
D=M // 19836
@14 // 19837
M=D // 19838
@SP // 19839
AM=M-1 // 19840
D=M // 19841
@13 // 19842
M=D // 19843
@14 // 19844
D=M // 19845
@DO_GT // 19846
0;JMP // 19847
(Sys.wait.GT.2)
@14 // 19848
M=D // 19849
@SP // 19850
AM=M-1 // 19851
D=M // 19852
@13 // 19853
M=D // 19854
@14 // 19855
D=M // 19856
@DO_EQ // 19857
0;JMP // 19858
(Sys.wait.EQ.1)
@WHILE_END_Sys.wait1 // 19859
D;JNE // 19860

////  nested:
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
//PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 19861
D=A // 19862
@SP // 19863
AM=M+1 // 19864
A=A-1 // 19865
M=D // 19866
@ARG // 19867
A=M // 19868
D=M-1 // 19869
@ARG // 19870
A=M // 19871
M=D // 19872
@SP // 19873
AM=M-1 // 19874
D=M // 19875
@LCL // 19876
A=M // 19877
M=D // 19878

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
@Sys.wait.EQ.4 // 19879
D=A // 19880
@SP // 19881
AM=M+1 // 19882
A=A-1 // 19883
M=D // 19884
@Sys.wait.GT.5 // 19885
D=A // 19886
@SP // 19887
AM=M+1 // 19888
A=A-1 // 19889
M=D // 19890
@LCL // 19891
A=M // 19892
D=M // 19893
@14 // 19894
M=D // 19895
@SP // 19896
AM=M-1 // 19897
D=M // 19898
@13 // 19899
M=D // 19900
@14 // 19901
D=M // 19902
@DO_GT // 19903
0;JMP // 19904
(Sys.wait.GT.5)
@14 // 19905
M=D // 19906
@SP // 19907
AM=M-1 // 19908
D=M // 19909
@13 // 19910
M=D // 19911
@14 // 19912
D=M // 19913
@DO_EQ // 19914
0;JMP // 19915
(Sys.wait.EQ.4)
@WHILE_END_Sys.wait2 // 19916
D;JNE // 19917

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

@LCL // 19918
A=M // 19919
D=M-1 // 19920
@LCL // 19921
A=M // 19922
M=D // 19923

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 19924
0;JMP // 19925

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 19926
0;JMP // 19927

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 19928
AM=M+1 // 19929
A=A-1 // 19930
M=0 // 19931

////ReturnInstruction{}
@RETURN // 19932
0;JMP // 19933

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////  nested:
//      nested:
//        PushPopPair {
//          push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{calleeFunction='Output.printInt', numArgs=1, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}}
//          pop:  PopInstruction{address=temp 0}
//        }
//    PushPopPair {
//      push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}}
//      pop:  PopInstruction{address=temp 0}
//    }
//PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 19934
D=A // 19935
@14 // 19936
M=D // 19937
@Sys.halt // 19938
D=A // 19939
@13 // 19940
M=D // 19941
@Sys.error.ret.0 // 19942
D=A // 19943
@CALL // 19944
0;JMP // 19945
(Sys.error.ret.0)
// call Output.println
@5 // 19946
D=A // 19947
@14 // 19948
M=D // 19949
@Output.println // 19950
D=A // 19951
@13 // 19952
M=D // 19953
@Sys.error.ret.1 // 19954
D=A // 19955
@CALL // 19956
0;JMP // 19957
(Sys.error.ret.1)
@ARG // 19958
A=M // 19959
D=M // 19960
@SP // 19961
AM=M+1 // 19962
A=A-1 // 19963
M=D // 19964
// call Output.printInt
@6 // 19965
D=A // 19966
@14 // 19967
M=D // 19968
@Output.printInt // 19969
D=A // 19970
@13 // 19971
M=D // 19972
@Sys.error.ret.2 // 19973
D=A // 19974
@CALL // 19975
0;JMP // 19976
(Sys.error.ret.2)
@SP // 19977
AM=M-1 // 19978
D=M // 19979
@5 // 19980
M=D // 19981
@SP // 19982
AM=M-1 // 19983
D=M // 19984
@5 // 19985
M=D // 19986
@SP // 19987
AM=M-1 // 19988
D=M // 19989
@5 // 19990
M=D // 19991

////PushInstruction("constant 0")
@SP // 19992
AM=M+1 // 19993
A=A-1 // 19994
M=0 // 19995

////ReturnInstruction{}
@RETURN // 19996
0;JMP // 19997

