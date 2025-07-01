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
@global.ret.0 // 127
D=A // 128
@CALL // 129
0;JMP // 130
(global.ret.0)
////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
@ARG // 131
A=M // 132
D=M // 133
@SP // 134
AM=M+1 // 135
A=A-1 // 136
M=D // 137
// call Memory.alloc
@6 // 138
D=A // 139
@14 // 140
M=D // 141
@Memory.alloc // 142
D=A // 143
@13 // 144
M=D // 145
@Array.new.ret.0 // 146
D=A // 147
@CALL // 148
0;JMP // 149
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 150
0;JMP // 151

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 152
A=M // 153
D=M // 154
@3 // 155
M=D // 156

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 157
D=M // 158
@SP // 159
AM=M+1 // 160
A=A-1 // 161
M=D // 162
// call Memory.deAlloc
@6 // 163
D=A // 164
@14 // 165
M=D // 166
@Memory.deAlloc // 167
D=A // 168
@13 // 169
M=D // 170
@Array.dispose.ret.0 // 171
D=A // 172
@CALL // 173
0;JMP // 174
(Array.dispose.ret.0)
@SP // 175
M=M-1 // 176

////PushInstruction("constant 0")
@SP // 177
AM=M+1 // 178
A=A-1 // 179
M=0 // 180

////ReturnInstruction{}
@RETURN // 181
0;JMP // 182

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 183
AM=M+1 // 184
A=A-1 // 185
M=0 // 186

////ReturnInstruction{}
@RETURN // 187
0;JMP // 188

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
@24576 // 189
D=M // 190
@SP // 191
AM=M+1 // 192
A=A-1 // 193
M=D // 194

////ReturnInstruction{}
@RETURN // 195
0;JMP // 196

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 197
AM=M+1 // 198
A=A-1 // 199
M=0 // 200

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
@Keyboard.readChar.EQ.0 // 201
D=A // 202
@SP // 203
AM=M+1 // 204
A=A-1 // 205
M=D // 206
@24576 // 207
D=M // 208
@DO_EQ // 209
0;JMP // 210
(Keyboard.readChar.EQ.0)
@WHILE_END_Keyboard.readChar1 // 211
D;JEQ // 212

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 213
0;JMP // 214

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

@24576 // 215
D=M // 216
@LCL // 217
A=M // 218
M=D // 219

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
@Keyboard.readChar.EQ.1 // 220
D=A // 221
@SP // 222
AM=M+1 // 223
A=A-1 // 224
M=D // 225
@Keyboard.readChar.EQ.2 // 226
D=A // 227
@SP // 228
AM=M+1 // 229
A=A-1 // 230
M=D // 231
@24576 // 232
D=M // 233
@DO_EQ // 234
0;JMP // 235
(Keyboard.readChar.EQ.2)
D=!D // 236
@DO_EQ // 237
0;JMP // 238
(Keyboard.readChar.EQ.1)
@WHILE_END_Keyboard.readChar2 // 239
D;JNE // 240

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 241
0;JMP // 242

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 243
A=M // 244
D=M // 245
@SP // 246
AM=M+1 // 247
A=A-1 // 248
M=D // 249
// call Output.printChar
@6 // 250
D=A // 251
@14 // 252
M=D // 253
@Output.printChar // 254
D=A // 255
@13 // 256
M=D // 257
@Keyboard.readChar.ret.0 // 258
D=A // 259
@CALL // 260
0;JMP // 261
(Keyboard.readChar.ret.0)
@SP // 262
M=M-1 // 263

////PushInstruction("local 0")
@LCL // 264
A=M // 265
D=M // 266
@SP // 267
AM=M+1 // 268
A=A-1 // 269
M=D // 270

////ReturnInstruction{}
@RETURN // 271
0;JMP // 272

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 273
M=M+1 // 274
AM=M+1 // 275
A=A-1 // 276
M=0 // 277
A=A-1 // 278
M=0 // 279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 280
A=M // 281
D=M // 282
@SP // 283
AM=M+1 // 284
A=A-1 // 285
M=D // 286
// call Output.printString
@6 // 287
D=A // 288
@14 // 289
M=D // 290
@Output.printString // 291
D=A // 292
@13 // 293
M=D // 294
@Keyboard.readLine.ret.0 // 295
D=A // 296
@CALL // 297
0;JMP // 298
(Keyboard.readLine.ret.0)
@SP // 299
M=M-1 // 300

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@50 // 301
D=A // 302
@SP // 303
AM=M+1 // 304
A=A-1 // 305
M=D // 306
// call String.new
@6 // 307
D=A // 308
@14 // 309
M=D // 310
@String.new // 311
D=A // 312
@13 // 313
M=D // 314
@Keyboard.readLine.ret.1 // 315
D=A // 316
@CALL // 317
0;JMP // 318
(Keyboard.readLine.ret.1)
@SP // 319
AM=M-1 // 320
D=M // 321
@LCL // 322
A=M // 323
M=D // 324

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 325
D=A // 326
@14 // 327
M=D // 328
@Keyboard.readChar // 329
D=A // 330
@13 // 331
M=D // 332
@Keyboard.readLine.ret.2 // 333
D=A // 334
@CALL // 335
0;JMP // 336
(Keyboard.readLine.ret.2)
@SP // 337
AM=M-1 // 338
D=M // 339
@LCL // 340
A=M+1 // 341
M=D // 342

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 1"),
//                right:
//CallGroup{pushes=[], call=CallInstruction{String.newLine}},
//                binaryOp: "EQ"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}}
@Keyboard.readLine.EQ.3 // 343
D=A // 344
@SP // 345
AM=M+1 // 346
A=A-1 // 347
M=D // 348
@Keyboard.readLine.EQ.4 // 349
D=A // 350
@SP // 351
AM=M+1 // 352
A=A-1 // 353
M=D // 354
@LCL // 355
A=M+1 // 356
D=M // 357
@SP // 358
AM=M+1 // 359
A=A-1 // 360
M=D // 361
// call String.newLine
@5 // 362
D=A // 363
@14 // 364
M=D // 365
@String.newLine // 366
D=A // 367
@13 // 368
M=D // 369
@Keyboard.readLine.ret.3 // 370
D=A // 371
@CALL // 372
0;JMP // 373
(Keyboard.readLine.ret.3)
@SP // 374
AM=M-1 // 375
D=M // 376
@SP // 377
AM=M-1 // 378
D=M-D // 379
@DO_EQ // 380
0;JMP // 381
(Keyboard.readLine.EQ.4)
D=!D // 382
@DO_EQ // 383
0;JMP // 384
(Keyboard.readLine.EQ.3)
@WHILE_END_Keyboard.readLine1 // 385
D;JNE // 386

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
@Keyboard.readLine.EQ.5 // 387
D=A // 388
@SP // 389
AM=M+1 // 390
A=A-1 // 391
M=D // 392
@LCL // 393
A=M+1 // 394
D=M // 395
@129 // 396
D=D-A // 397
@DO_EQ // 398
0;JMP // 399
(Keyboard.readLine.EQ.5)
D=!D // 400
@Keyboard.readLine.IfElse1 // 401
D;JNE // 402

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.eraseLastChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 403
A=M // 404
D=M // 405
@SP // 406
AM=M+1 // 407
A=A-1 // 408
M=D // 409
// call String.eraseLastChar
@6 // 410
D=A // 411
@14 // 412
M=D // 413
@String.eraseLastChar // 414
D=A // 415
@13 // 416
M=D // 417
@Keyboard.readLine.ret.4 // 418
D=A // 419
@CALL // 420
0;JMP // 421
(Keyboard.readLine.ret.4)
@SP // 422
M=M-1 // 423

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 424
0;JMP // 425

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 426
A=M // 427
D=M // 428
@SP // 429
AM=M+1 // 430
A=A-1 // 431
M=D // 432
@LCL // 433
A=M+1 // 434
D=M // 435
@SP // 436
AM=M+1 // 437
A=A-1 // 438
M=D // 439
// call String.appendChar
@7 // 440
D=A // 441
@14 // 442
M=D // 443
@String.appendChar // 444
D=A // 445
@13 // 446
M=D // 447
@Keyboard.readLine.ret.5 // 448
D=A // 449
@CALL // 450
0;JMP // 451
(Keyboard.readLine.ret.5)
@SP // 452
M=M-1 // 453

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 454
D=A // 455
@14 // 456
M=D // 457
@Keyboard.readChar // 458
D=A // 459
@13 // 460
M=D // 461
@Keyboard.readLine.ret.6 // 462
D=A // 463
@CALL // 464
0;JMP // 465
(Keyboard.readLine.ret.6)
@SP // 466
AM=M-1 // 467
D=M // 468
@LCL // 469
A=M+1 // 470
M=D // 471

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 472
0;JMP // 473

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 474
A=M // 475
D=M // 476
@SP // 477
AM=M+1 // 478
A=A-1 // 479
M=D // 480

////ReturnInstruction{}
@RETURN // 481
0;JMP // 482

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 483
AM=M+1 // 484
A=A-1 // 485
M=0 // 486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Keyboard.readLine}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 487
A=M // 488
D=M // 489
@SP // 490
AM=M+1 // 491
A=A-1 // 492
M=D // 493
// call Keyboard.readLine
@6 // 494
D=A // 495
@14 // 496
M=D // 497
@Keyboard.readLine // 498
D=A // 499
@13 // 500
M=D // 501
@Keyboard.readInt.ret.0 // 502
D=A // 503
@CALL // 504
0;JMP // 505
(Keyboard.readInt.ret.0)
@SP // 506
AM=M-1 // 507
D=M // 508
@LCL // 509
A=M // 510
M=D // 511

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.intValue}}
@LCL // 512
A=M // 513
D=M // 514
@SP // 515
AM=M+1 // 516
A=A-1 // 517
M=D // 518
// call String.intValue
@6 // 519
D=A // 520
@14 // 521
M=D // 522
@String.intValue // 523
D=A // 524
@13 // 525
M=D // 526
@Keyboard.readInt.ret.1 // 527
D=A // 528
@CALL // 529
0;JMP // 530
(Keyboard.readInt.ret.1)

////ReturnInstruction{}
@RETURN // 531
0;JMP // 532

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 533
AM=M+1 // 534
A=A-1 // 535
M=0 // 536

////PushPopPair {
//  push: PushInstruction("constant 32")
//  pop:  PopInstruction{address=local 0}
//}

@32 // 537
D=A // 538
@LCL // 539
A=M // 540
M=D // 541

////LabelInstruction{label='WHILE_START_Main.main1}
// label WHILE_START_Main.main1
(WHILE_START_Main.main1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 127"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Main.main1}}
@Main.main.LT.0 // 542
D=A // 543
@SP // 544
AM=M+1 // 545
A=A-1 // 546
M=D // 547
@LCL // 548
A=M // 549
D=M // 550
@127 // 551
D=D-A // 552
@DO_LT // 553
0;JMP // 554
(Main.main.LT.0)
D=!D // 555
@WHILE_END_Main.main1 // 556
D;JNE // 557

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 558
A=M // 559
D=M // 560
@SP // 561
AM=M+1 // 562
A=A-1 // 563
M=D // 564
// call Output.printChar
@6 // 565
D=A // 566
@14 // 567
M=D // 568
@Output.printChar // 569
D=A // 570
@13 // 571
M=D // 572
@Main.main.ret.0 // 573
D=A // 574
@CALL // 575
0;JMP // 576
(Main.main.ret.0)
@SP // 577
M=M-1 // 578

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

@LCL // 579
A=M // 580
M=M+1 // 581

////GotoInstruction{label='WHILE_START_Main.main1}
// goto WHILE_START_Main.main1
@WHILE_START_Main.main1 // 582
0;JMP // 583

////LabelInstruction{label='WHILE_END_Main.main1}
// label WHILE_END_Main.main1
(WHILE_END_Main.main1)

////PushInstruction("constant 0")
@SP // 584
AM=M+1 // 585
A=A-1 // 586
M=0 // 587

////ReturnInstruction{}
@RETURN // 588
0;JMP // 589

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 590
M=M+1 // 591
AM=M+1 // 592
A=A-1 // 593
M=0 // 594
A=A-1 // 595
M=0 // 596

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 597
A=M // 598
M=1 // 599

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 600
A=M+1 // 601
M=0 // 602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 603
D=A // 604
@SP // 605
AM=M+1 // 606
A=A-1 // 607
M=D // 608
// call Array.new
@6 // 609
D=A // 610
@14 // 611
M=D // 612
@Array.new // 613
D=A // 614
@13 // 615
M=D // 616
@Math.init.ret.0 // 617
D=A // 618
@CALL // 619
0;JMP // 620
(Math.init.ret.0)
@SP // 621
AM=M-1 // 622
D=M // 623
@Math.0 // 624
M=D // 625

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
@Math.init.LT.0 // 626
D=A // 627
@SP // 628
AM=M+1 // 629
A=A-1 // 630
M=D // 631
@LCL // 632
A=M+1 // 633
D=M // 634
@16 // 635
D=D-A // 636
@DO_LT // 637
0;JMP // 638
(Math.init.LT.0)
D=!D // 639
@WHILE_END_Math.init1 // 640
D;JNE // 641

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 642
D=M // 643
@SP // 644
AM=M+1 // 645
A=A-1 // 646
M=D // 647
@LCL // 648
A=M+1 // 649
D=M // 650
@SP // 651
AM=M-1 // 652
D=D+M // 653
@SP // 654
AM=M+1 // 655
A=A-1 // 656
M=D // 657
@LCL // 658
A=M // 659
D=M // 660
@SP // 661
AM=M-1 // 662
A=M // 663
M=D // 664

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 665
A=M // 666
D=M // 667
@LCL // 668
A=M // 669
M=D+M // 670

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 671
A=M+1 // 672
M=M+1 // 673

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 674
0;JMP // 675

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 676
AM=M+1 // 677
A=A-1 // 678
M=0 // 679

////ReturnInstruction{}
@RETURN // 680
0;JMP // 681

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
@ARG // 682
A=M // 683
D=M // 684
@SP // 685
AM=M+1 // 686
A=A-1 // 687
M=D // 688
@Math.0 // 689
D=M // 690
@SP // 691
AM=M+1 // 692
A=A-1 // 693
M=D // 694
@ARG // 695
A=M+1 // 696
D=M // 697
@SP // 698
AM=M-1 // 699
A=D+M // 700
D=M // 701
@SP // 702
AM=M-1 // 703
D=D&M // 704
@SP // 705
AM=M+1 // 706
A=A-1 // 707
M=D // 708

////ReturnInstruction{}
@RETURN // 709
0;JMP // 710

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 711
D=A // 712
@SP // 713
AM=D+M // 714
A=A-1 // 715
M=0 // 716
A=A-1 // 717
M=0 // 718
A=A-1 // 719
M=0 // 720

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
@Math.multiply.EQ.1 // 721
D=A // 722
@SP // 723
AM=M+1 // 724
A=A-1 // 725
M=D // 726
@Math.multiply.EQ.2 // 727
D=A // 728
@SP // 729
AM=M+1 // 730
A=A-1 // 731
M=D // 732
@ARG // 733
A=M // 734
D=M // 735
@DO_EQ // 736
0;JMP // 737
(Math.multiply.EQ.2)
@SP // 738
AM=M+1 // 739
A=A-1 // 740
M=D // 741
@Math.multiply.EQ.3 // 742
D=A // 743
@SP // 744
AM=M+1 // 745
A=A-1 // 746
M=D // 747
@ARG // 748
A=M+1 // 749
D=M // 750
@DO_EQ // 751
0;JMP // 752
(Math.multiply.EQ.3)
@SP // 753
AM=M-1 // 754
D=D|M // 755
@DO_EQ // 756
0;JMP // 757
(Math.multiply.EQ.1)
@Math.multiply.IfElse1 // 758
D;JNE // 759

////PushInstruction("constant 0")
@SP // 760
AM=M+1 // 761
A=A-1 // 762
M=0 // 763

////ReturnInstruction{}
@RETURN // 764
0;JMP // 765

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 766
0;JMP // 767

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
@Math.multiply.EQ.4 // 768
D=A // 769
@SP // 770
AM=M+1 // 771
A=A-1 // 772
M=D // 773
@ARG // 774
A=M // 775
D=M // 776
D=D-1 // 777
@DO_EQ // 778
0;JMP // 779
(Math.multiply.EQ.4)
D=!D // 780
@Math.multiply.IfElse2 // 781
D;JNE // 782

////PushInstruction("argument 1")
@ARG // 783
A=M+1 // 784
D=M // 785
@SP // 786
AM=M+1 // 787
A=A-1 // 788
M=D // 789

////ReturnInstruction{}
@RETURN // 790
0;JMP // 791

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 792
0;JMP // 793

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
@Math.multiply.EQ.5 // 794
D=A // 795
@SP // 796
AM=M+1 // 797
A=A-1 // 798
M=D // 799
@ARG // 800
A=M+1 // 801
D=M // 802
D=D-1 // 803
@DO_EQ // 804
0;JMP // 805
(Math.multiply.EQ.5)
D=!D // 806
@Math.multiply.IfElse3 // 807
D;JNE // 808

////PushInstruction("argument 0")
@ARG // 809
A=M // 810
D=M // 811
@SP // 812
AM=M+1 // 813
A=A-1 // 814
M=D // 815

////ReturnInstruction{}
@RETURN // 816
0;JMP // 817

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 818
0;JMP // 819

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
@Math.multiply.EQ.6 // 820
D=A // 821
@SP // 822
AM=M+1 // 823
A=A-1 // 824
M=D // 825
@ARG // 826
A=M // 827
D=M // 828
@2 // 829
D=D-A // 830
@DO_EQ // 831
0;JMP // 832
(Math.multiply.EQ.6)
D=!D // 833
@Math.multiply.IfElse4 // 834
D;JNE // 835

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 836
A=M+1 // 837
D=M // 838
D=D+M // 839
@SP // 840
AM=M+1 // 841
A=A-1 // 842
M=D // 843

////ReturnInstruction{}
@RETURN // 844
0;JMP // 845

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 846
0;JMP // 847

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
@Math.multiply.EQ.7 // 848
D=A // 849
@SP // 850
AM=M+1 // 851
A=A-1 // 852
M=D // 853
@ARG // 854
A=M+1 // 855
D=M // 856
@2 // 857
D=D-A // 858
@DO_EQ // 859
0;JMP // 860
(Math.multiply.EQ.7)
D=!D // 861
@Math.multiply.IfElse5 // 862
D;JNE // 863

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 864
A=M // 865
D=M // 866
D=D+M // 867
@SP // 868
AM=M+1 // 869
A=A-1 // 870
M=D // 871

////ReturnInstruction{}
@RETURN // 872
0;JMP // 873

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 874
0;JMP // 875

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

@LCL // 876
A=M+1 // 877
A=A+1 // 878
M=1 // 879

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
@Math.multiply.LT.8 // 880
D=A // 881
@SP // 882
AM=M+1 // 883
A=A-1 // 884
M=D // 885
@LCL // 886
A=M+1 // 887
D=M // 888
@16 // 889
D=D-A // 890
@DO_LT // 891
0;JMP // 892
(Math.multiply.LT.8)
D=!D // 893
@WHILE_END_Math.multiply1 // 894
D;JNE // 895

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
@Math.multiply.EQ.9 // 896
D=A // 897
@SP // 898
AM=M+1 // 899
A=A-1 // 900
M=D // 901
@ARG // 902
A=M+1 // 903
D=M // 904
@SP // 905
AM=M+1 // 906
A=A-1 // 907
M=D // 908
@LCL // 909
A=M+1 // 910
A=A+1 // 911
D=M // 912
@SP // 913
AM=M-1 // 914
D=D&M // 915
@DO_EQ // 916
0;JMP // 917
(Math.multiply.EQ.9)
@Math.multiply.IfElse6 // 918
D;JNE // 919

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

@ARG // 920
A=M // 921
D=M // 922
@LCL // 923
A=M // 924
M=D+M // 925

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 926
0;JMP // 927

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 928
A=M // 929
D=M // 930
@ARG // 931
A=M // 932
M=D+M // 933

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 934
A=M+1 // 935
M=M+1 // 936

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 937
A=M+1 // 938
A=A+1 // 939
D=M // 940
@LCL // 941
A=M+1 // 942
A=A+1 // 943
M=D+M // 944

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 945
0;JMP // 946

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 947
A=M // 948
D=M // 949
@SP // 950
AM=M+1 // 951
A=A-1 // 952
M=D // 953

////ReturnInstruction{}
@RETURN // 954
0;JMP // 955

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 956
D=A // 957
@SP // 958
AM=D+M // 959
A=A-1 // 960
M=0 // 961
A=A-1 // 962
M=0 // 963
A=A-1 // 964
M=0 // 965

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 966
A=M // 967
D=M // 968
@SP // 969
AM=M+1 // 970
A=A-1 // 971
M=D // 972
// call Math.abs
@6 // 973
D=A // 974
@14 // 975
M=D // 976
@Math.abs // 977
D=A // 978
@13 // 979
M=D // 980
@Math.divide.ret.0 // 981
D=A // 982
@CALL // 983
0;JMP // 984
(Math.divide.ret.0)
@SP // 985
AM=M-1 // 986
D=M // 987
@LCL // 988
A=M+1 // 989
M=D // 990

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 991
A=M+1 // 992
D=M // 993
@SP // 994
AM=M+1 // 995
A=A-1 // 996
M=D // 997
// call Math.abs
@6 // 998
D=A // 999
@14 // 1000
M=D // 1001
@Math.abs // 1002
D=A // 1003
@13 // 1004
M=D // 1005
@Math.divide.ret.1 // 1006
D=A // 1007
@CALL // 1008
0;JMP // 1009
(Math.divide.ret.1)
@SP // 1010
AM=M-1 // 1011
D=M // 1012
@LCL // 1013
A=M+1 // 1014
A=A+1 // 1015
M=D // 1016

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "GT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse1}}
@Math.divide.GT.10 // 1017
D=A // 1018
@SP // 1019
AM=M+1 // 1020
A=A-1 // 1021
M=D // 1022
@LCL // 1023
A=M+1 // 1024
A=A+1 // 1025
D=M // 1026
A=A-1 // 1027
D=D-M // 1028
@DO_GT // 1029
0;JMP // 1030
(Math.divide.GT.10)
D=!D // 1031
@Math.divide.IfElse1 // 1032
D;JNE // 1033

////PushInstruction("constant 0")
@SP // 1034
AM=M+1 // 1035
A=A-1 // 1036
M=0 // 1037

////ReturnInstruction{}
@RETURN // 1038
0;JMP // 1039

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 1040
0;JMP // 1041

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1042
A=M+1 // 1043
D=M // 1044
@SP // 1045
AM=M+1 // 1046
A=A-1 // 1047
M=D // 1048
@LCL // 1049
A=M+1 // 1050
A=A+1 // 1051
D=M // 1052
D=D+M // 1053
@SP // 1054
AM=M+1 // 1055
A=A-1 // 1056
M=D // 1057
// call Math.divide
@7 // 1058
D=A // 1059
@14 // 1060
M=D // 1061
@Math.divide // 1062
D=A // 1063
@13 // 1064
M=D // 1065
@Math.divide.ret.2 // 1066
D=A // 1067
@CALL // 1068
0;JMP // 1069
(Math.divide.ret.2)
@SP // 1070
AM=M-1 // 1071
D=M // 1072
@LCL // 1073
A=M // 1074
M=D // 1075

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{Math.multiply}},
//                    binaryOp: "SUB"
//                ),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse2}}
@Math.divide.LT.11 // 1076
D=A // 1077
@SP // 1078
AM=M+1 // 1079
A=A-1 // 1080
M=D // 1081
@LCL // 1082
A=M+1 // 1083
D=M // 1084
@SP // 1085
AM=M+1 // 1086
A=A-1 // 1087
M=D // 1088
@LCL // 1089
A=M // 1090
D=M // 1091
D=D+M // 1092
@SP // 1093
AM=M+1 // 1094
A=A-1 // 1095
M=D // 1096
@LCL // 1097
A=M+1 // 1098
A=A+1 // 1099
D=M // 1100
@SP // 1101
AM=M+1 // 1102
A=A-1 // 1103
M=D // 1104
// call Math.multiply
@7 // 1105
D=A // 1106
@14 // 1107
M=D // 1108
@Math.multiply // 1109
D=A // 1110
@13 // 1111
M=D // 1112
@Math.divide.ret.3 // 1113
D=A // 1114
@CALL // 1115
0;JMP // 1116
(Math.divide.ret.3)
@SP // 1117
AM=M-1 // 1118
D=M // 1119
@SP // 1120
AM=M-1 // 1121
D=M-D // 1122
@SP // 1123
AM=M+1 // 1124
A=A-1 // 1125
M=D // 1126
@LCL // 1127
A=M+1 // 1128
A=A+1 // 1129
D=M // 1130
@SP // 1131
AM=M-1 // 1132
D=M-D // 1133
@DO_LT // 1134
0;JMP // 1135
(Math.divide.LT.11)
D=!D // 1136
@Math.divide.IfElse2 // 1137
D;JNE // 1138

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("argument 0"),
//                                    right:
//                                        PushInstruction("constant 0"),
//                                    binaryOp: "LT"
//                                ),
//                            right:
//                                PushInstruction("argument 1"),
//                            binaryOp: "AND"
//                        ),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "GT"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("argument 0"),
//                                    right:
//                                        PushInstruction("constant 0"),
//                                    binaryOp: "GT"
//                                ),
//                            right:
//                                PushInstruction("argument 1"),
//                            binaryOp: "AND"
//                        ),
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
@Math.divide.EQ.12 // 1139
D=A // 1140
@SP // 1141
AM=M+1 // 1142
A=A-1 // 1143
M=D // 1144
@Math.divide.GT.13 // 1145
D=A // 1146
@SP // 1147
AM=M+1 // 1148
A=A-1 // 1149
M=D // 1150
@Math.divide.LT.14 // 1151
D=A // 1152
@SP // 1153
AM=M+1 // 1154
A=A-1 // 1155
M=D // 1156
@ARG // 1157
A=M // 1158
D=M // 1159
@DO_LT // 1160
0;JMP // 1161
(Math.divide.LT.14)
@SP // 1162
AM=M+1 // 1163
A=A-1 // 1164
M=D // 1165
@ARG // 1166
A=M+1 // 1167
D=M // 1168
@SP // 1169
AM=M-1 // 1170
D=D&M // 1171
@DO_GT // 1172
0;JMP // 1173
(Math.divide.GT.13)
@SP // 1174
AM=M+1 // 1175
A=A-1 // 1176
M=D // 1177
@Math.divide.LT.15 // 1178
D=A // 1179
@SP // 1180
AM=M+1 // 1181
A=A-1 // 1182
M=D // 1183
@Math.divide.GT.16 // 1184
D=A // 1185
@SP // 1186
AM=M+1 // 1187
A=A-1 // 1188
M=D // 1189
@ARG // 1190
A=M // 1191
D=M // 1192
@DO_GT // 1193
0;JMP // 1194
(Math.divide.GT.16)
@SP // 1195
AM=M+1 // 1196
A=A-1 // 1197
M=D // 1198
@ARG // 1199
A=M+1 // 1200
D=M // 1201
@SP // 1202
AM=M-1 // 1203
D=D&M // 1204
@DO_LT // 1205
0;JMP // 1206
(Math.divide.LT.15)
@SP // 1207
AM=M-1 // 1208
D=D|M // 1209
@DO_EQ // 1210
0;JMP // 1211
(Math.divide.EQ.12)
@Math.divide.IfElse3 // 1212
D;JNE // 1213

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1214
A=M // 1215
D=-M // 1216
@LCL // 1217
A=M // 1218
M=D // 1219

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 1220
0;JMP // 1221

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 1222
A=M // 1223
D=M // 1224
D=D+M // 1225
@SP // 1226
AM=M+1 // 1227
A=A-1 // 1228
M=D // 1229

////ReturnInstruction{}
@RETURN // 1230
0;JMP // 1231

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1232
0;JMP // 1233

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("argument 0"),
//                                    right:
//                                        PushInstruction("constant 0"),
//                                    binaryOp: "LT"
//                                ),
//                            right:
//                                PushInstruction("argument 1"),
//                            binaryOp: "AND"
//                        ),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "GT"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("argument 0"),
//                                    right:
//                                        PushInstruction("constant 0"),
//                                    binaryOp: "GT"
//                                ),
//                            right:
//                                PushInstruction("argument 1"),
//                            binaryOp: "AND"
//                        ),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "LT"
//                ),
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide.IfElse4}}
@Math.divide.EQ.17 // 1234
D=A // 1235
@SP // 1236
AM=M+1 // 1237
A=A-1 // 1238
M=D // 1239
@Math.divide.GT.18 // 1240
D=A // 1241
@SP // 1242
AM=M+1 // 1243
A=A-1 // 1244
M=D // 1245
@Math.divide.LT.19 // 1246
D=A // 1247
@SP // 1248
AM=M+1 // 1249
A=A-1 // 1250
M=D // 1251
@ARG // 1252
A=M // 1253
D=M // 1254
@DO_LT // 1255
0;JMP // 1256
(Math.divide.LT.19)
@SP // 1257
AM=M+1 // 1258
A=A-1 // 1259
M=D // 1260
@ARG // 1261
A=M+1 // 1262
D=M // 1263
@SP // 1264
AM=M-1 // 1265
D=D&M // 1266
@DO_GT // 1267
0;JMP // 1268
(Math.divide.GT.18)
@SP // 1269
AM=M+1 // 1270
A=A-1 // 1271
M=D // 1272
@Math.divide.LT.20 // 1273
D=A // 1274
@SP // 1275
AM=M+1 // 1276
A=A-1 // 1277
M=D // 1278
@Math.divide.GT.21 // 1279
D=A // 1280
@SP // 1281
AM=M+1 // 1282
A=A-1 // 1283
M=D // 1284
@ARG // 1285
A=M // 1286
D=M // 1287
@DO_GT // 1288
0;JMP // 1289
(Math.divide.GT.21)
@SP // 1290
AM=M+1 // 1291
A=A-1 // 1292
M=D // 1293
@ARG // 1294
A=M+1 // 1295
D=M // 1296
@SP // 1297
AM=M-1 // 1298
D=D&M // 1299
@DO_LT // 1300
0;JMP // 1301
(Math.divide.LT.20)
@SP // 1302
AM=M-1 // 1303
D=D|M // 1304
@DO_EQ // 1305
0;JMP // 1306
(Math.divide.EQ.17)
@Math.divide.IfElse4 // 1307
D;JNE // 1308

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1309
A=M // 1310
D=-M // 1311
@LCL // 1312
A=M // 1313
M=D // 1314

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 1315
0;JMP // 1316

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

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
@LCL // 1317
A=M // 1318
D=M // 1319
D=D+M // 1320
D=D+1 // 1321
@SP // 1322
AM=M+1 // 1323
A=A-1 // 1324
M=D // 1325

////ReturnInstruction{}
@RETURN // 1326
0;JMP // 1327

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=4, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Math.divide}}, PushInstruction("argument 1")], call=CallInstruction{Math.multiply}},
//    binaryOp: "SUB"
//)
@ARG // 1328
A=M // 1329
D=M // 1330
@SP // 1331
AM=M+1 // 1332
A=A-1 // 1333
M=D // 1334
@ARG // 1335
A=M // 1336
D=M // 1337
@SP // 1338
AM=M+1 // 1339
A=A-1 // 1340
M=D // 1341
@ARG // 1342
A=M+1 // 1343
D=M // 1344
@SP // 1345
AM=M+1 // 1346
A=A-1 // 1347
M=D // 1348
// call Math.divide
@7 // 1349
D=A // 1350
@14 // 1351
M=D // 1352
@Math.divide // 1353
D=A // 1354
@13 // 1355
M=D // 1356
@Math.mod.ret.0 // 1357
D=A // 1358
@CALL // 1359
0;JMP // 1360
(Math.mod.ret.0)
@ARG // 1361
A=M+1 // 1362
D=M // 1363
@SP // 1364
AM=M+1 // 1365
A=A-1 // 1366
M=D // 1367
// call Math.multiply
@7 // 1368
D=A // 1369
@14 // 1370
M=D // 1371
@Math.multiply // 1372
D=A // 1373
@13 // 1374
M=D // 1375
@Math.mod.ret.1 // 1376
D=A // 1377
@CALL // 1378
0;JMP // 1379
(Math.mod.ret.1)
@SP // 1380
AM=M-1 // 1381
D=M // 1382
@SP // 1383
AM=M-1 // 1384
D=M-D // 1385
@SP // 1386
AM=M+1 // 1387
A=A-1 // 1388
M=D // 1389

////ReturnInstruction{}
@RETURN // 1390
0;JMP // 1391

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.0 // 1392
D=M // 1393
@SP // 1394
AM=M+1 // 1395
A=A-1 // 1396
M=D // 1397
@ARG // 1398
A=M // 1399
D=M // 1400
@SP // 1401
AM=M-1 // 1402
A=D+M // 1403
D=M // 1404
@SP // 1405
AM=M+1 // 1406
A=A-1 // 1407
M=D // 1408

////ReturnInstruction{}
@RETURN // 1409
0;JMP // 1410

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1411
D=A // 1412
@SP // 1413
AM=D+M // 1414
A=A-1 // 1415
M=0 // 1416
A=A-1 // 1417
M=0 // 1418
A=A-1 // 1419
M=0 // 1420
A=A-1 // 1421
M=0 // 1422

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1423
A=M // 1424
M=0 // 1425

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1426
D=A // 1427
@LCL // 1428
A=M+1 // 1429
M=D // 1430

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
@Math.sqrt.EQ.22 // 1431
D=A // 1432
@SP // 1433
AM=M+1 // 1434
A=A-1 // 1435
M=D // 1436
@Math.sqrt.LT.23 // 1437
D=A // 1438
@SP // 1439
AM=M+1 // 1440
A=A-1 // 1441
M=D // 1442
@LCL // 1443
A=M+1 // 1444
D=M // 1445
@DO_LT // 1446
0;JMP // 1447
(Math.sqrt.LT.23)
D=!D // 1448
@DO_EQ // 1449
0;JMP // 1450
(Math.sqrt.EQ.22)
@WHILE_END_Math.sqrt1 // 1451
D;JNE // 1452

////PushPopPair {
//  push: BinaryPushGroup(
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
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1453
A=M // 1454
D=M // 1455
@SP // 1456
AM=M+1 // 1457
A=A-1 // 1458
M=D // 1459
@Math.0 // 1460
D=M // 1461
@SP // 1462
AM=M+1 // 1463
A=A-1 // 1464
M=D // 1465
@LCL // 1466
A=M+1 // 1467
D=M // 1468
@SP // 1469
AM=M-1 // 1470
A=D+M // 1471
D=M // 1472
@SP // 1473
AM=M-1 // 1474
D=D+M // 1475
@LCL // 1476
A=M+1 // 1477
A=A+1 // 1478
M=D // 1479

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1480
D=A // 1481
@SP // 1482
M=D+M // 1483
@LCL // 1484
A=M+1 // 1485
A=A+1 // 1486
D=M // 1487
@SP // 1488
A=M-1 // 1489
M=D // 1490
A=A-1 // 1491
M=D // 1492
// call Math.multiply
@7 // 1493
D=A // 1494
@14 // 1495
M=D // 1496
@Math.multiply // 1497
D=A // 1498
@13 // 1499
M=D // 1500
@Math.sqrt.ret.0 // 1501
D=A // 1502
@CALL // 1503
0;JMP // 1504
(Math.sqrt.ret.0)
@SP // 1505
AM=M-1 // 1506
D=M // 1507
@LCL // 1508
A=M+1 // 1509
A=A+1 // 1510
A=A+1 // 1511
M=D // 1512

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
@Math.sqrt.EQ.24 // 1513
D=A // 1514
@SP // 1515
AM=M+1 // 1516
A=A-1 // 1517
M=D // 1518
@Math.sqrt.GT.25 // 1519
D=A // 1520
@SP // 1521
AM=M+1 // 1522
A=A-1 // 1523
M=D // 1524
@LCL // 1525
A=M+1 // 1526
A=A+1 // 1527
A=A+1 // 1528
D=M // 1529
@SP // 1530
AM=M+1 // 1531
A=A-1 // 1532
M=D // 1533
@ARG // 1534
A=M // 1535
D=M // 1536
@SP // 1537
AM=M-1 // 1538
D=M-D // 1539
@DO_GT // 1540
0;JMP // 1541
(Math.sqrt.GT.25)
@SP // 1542
AM=M+1 // 1543
A=A-1 // 1544
M=D // 1545
@SP // 1546
A=M-1 // 1547
M=!D // 1548
@Math.sqrt.GT.26 // 1549
D=A // 1550
@SP // 1551
AM=M+1 // 1552
A=A-1 // 1553
M=D // 1554
@LCL // 1555
A=M+1 // 1556
A=A+1 // 1557
A=A+1 // 1558
D=M // 1559
@DO_GT // 1560
0;JMP // 1561
(Math.sqrt.GT.26)
@SP // 1562
AM=M-1 // 1563
D=D&M // 1564
@DO_EQ // 1565
0;JMP // 1566
(Math.sqrt.EQ.24)
@Math.sqrt.IfElse1 // 1567
D;JNE // 1568

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1569
A=M+1 // 1570
A=A+1 // 1571
D=M // 1572
@LCL // 1573
A=M // 1574
M=D // 1575

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 1576
0;JMP // 1577

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

@LCL // 1578
A=M+1 // 1579
M=M-1 // 1580

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1581
0;JMP // 1582

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1583
A=M // 1584
D=M // 1585
@SP // 1586
AM=M+1 // 1587
A=A-1 // 1588
M=D // 1589

////ReturnInstruction{}
@RETURN // 1590
0;JMP // 1591

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.max.GT.27 // 1592
D=A // 1593
@SP // 1594
AM=M+1 // 1595
A=A-1 // 1596
M=D // 1597
@ARG // 1598
A=M+1 // 1599
D=M // 1600
A=A-1 // 1601
D=M-D // 1602
@DO_GT // 1603
0;JMP // 1604
(Math.max.GT.27)
D=!D // 1605
@Math.max.IfElse1 // 1606
D;JNE // 1607

////PushInstruction("argument 0")
@ARG // 1608
A=M // 1609
D=M // 1610
@SP // 1611
AM=M+1 // 1612
A=A-1 // 1613
M=D // 1614

////ReturnInstruction{}
@RETURN // 1615
0;JMP // 1616

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 1617
0;JMP // 1618

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1619
A=M+1 // 1620
D=M // 1621
@SP // 1622
AM=M+1 // 1623
A=A-1 // 1624
M=D // 1625

////ReturnInstruction{}
@RETURN // 1626
0;JMP // 1627

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.min.LT.28 // 1628
D=A // 1629
@SP // 1630
AM=M+1 // 1631
A=A-1 // 1632
M=D // 1633
@ARG // 1634
A=M+1 // 1635
D=M // 1636
A=A-1 // 1637
D=M-D // 1638
@DO_LT // 1639
0;JMP // 1640
(Math.min.LT.28)
D=!D // 1641
@Math.min.IfElse1 // 1642
D;JNE // 1643

////PushInstruction("argument 0")
@ARG // 1644
A=M // 1645
D=M // 1646
@SP // 1647
AM=M+1 // 1648
A=A-1 // 1649
M=D // 1650

////ReturnInstruction{}
@RETURN // 1651
0;JMP // 1652

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 1653
0;JMP // 1654

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1655
A=M+1 // 1656
D=M // 1657
@SP // 1658
AM=M+1 // 1659
A=A-1 // 1660
M=D // 1661

////ReturnInstruction{}
@RETURN // 1662
0;JMP // 1663

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1664
A=M // 1665
D=M // 1666
@SP // 1667
AM=M+1 // 1668
A=A-1 // 1669
M=D // 1670
@ARG // 1671
A=M // 1672
D=M // 1673
@SP // 1674
AM=M+1 // 1675
A=A-1 // 1676
M=D // 1677
@SP // 1678
A=M-1 // 1679
M=-D // 1680
// call Math.max
@7 // 1681
D=A // 1682
@14 // 1683
M=D // 1684
@Math.max // 1685
D=A // 1686
@13 // 1687
M=D // 1688
@Math.abs.ret.0 // 1689
D=A // 1690
@CALL // 1691
0;JMP // 1692
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 1693
0;JMP // 1694

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1695
M=M+1 // 1696
AM=M+1 // 1697
A=A-1 // 1698
M=0 // 1699
A=A-1 // 1700
M=0 // 1701

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

@2055 // 1702
D=A // 1703
@LCL // 1704
A=M // 1705
M=D // 1706

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 1707
A=M // 1708
D=M // 1709
@SP // 1710
AM=M+1 // 1711
A=A-1 // 1712
M=D // 1713
@LCL // 1714
A=M // 1715
D=M // 1716
@16384 // 1717
D=A-D // 1718
@5 // 1719
D=D-A // 1720
@SP // 1721
AM=M-1 // 1722
A=M // 1723
M=D // 1724

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1725
A=M // 1726
D=M // 1727
@SP // 1728
AM=M+1 // 1729
A=A-1 // 1730
M=D+1 // 1731
D=1 // 1732
@SP // 1733
AM=M-1 // 1734
A=M // 1735
M=D // 1736

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1737
A=M // 1738
D=M // 1739
@2 // 1740
D=D+A // 1741
@SP // 1742
AM=M+1 // 1743
A=A-1 // 1744
M=D // 1745
D=0 // 1746
@SP // 1747
AM=M-1 // 1748
A=M // 1749
M=D // 1750

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1751
A=M // 1752
D=M // 1753
@3 // 1754
D=D+A // 1755
@SP // 1756
AM=M+1 // 1757
A=A-1 // 1758
M=D // 1759
D=0 // 1760
@SP // 1761
AM=M-1 // 1762
A=M // 1763
M=D // 1764

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1765
A=M // 1766
D=M // 1767
@SP // 1768
AM=M+1 // 1769
A=A-1 // 1770
M=D // 1771
// call Memory.create_foot
@6 // 1772
D=A // 1773
@14 // 1774
M=D // 1775
@Memory.create_foot // 1776
D=A // 1777
@13 // 1778
M=D // 1779
@Memory.init.ret.0 // 1780
D=A // 1781
@CALL // 1782
0;JMP // 1783
(Memory.init.ret.0)
@SP // 1784
M=M-1 // 1785

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@2054 // 1786
D=A // 1787
@SP // 1788
AM=M+1 // 1789
A=A-1 // 1790
M=D // 1791
@2054 // 1792
D=A // 1793
@SP // 1794
AM=M+1 // 1795
A=A-1 // 1796
M=D // 1797
@LCL // 1798
A=M // 1799
D=M // 1800
@SP // 1801
AM=M+1 // 1802
A=A-1 // 1803
M=D // 1804
// call Memory.add_node
@7 // 1805
D=A // 1806
@14 // 1807
M=D // 1808
@Memory.add_node // 1809
D=A // 1810
@13 // 1811
M=D // 1812
@Memory.init.ret.1 // 1813
D=A // 1814
@CALL // 1815
0;JMP // 1816
(Memory.init.ret.1)
@SP // 1817
M=M-1 // 1818

////PushInstruction("constant 0")
@SP // 1819
AM=M+1 // 1820
A=A-1 // 1821
M=0 // 1822

////ReturnInstruction{}
@RETURN // 1823
0;JMP // 1824

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 1825
D=A // 1826
@SP // 1827
AM=D+M // 1828
A=A-1 // 1829
M=0 // 1830
A=A-1 // 1831
M=0 // 1832
A=A-1 // 1833
M=0 // 1834
A=A-1 // 1835
M=0 // 1836
A=A-1 // 1837
M=0 // 1838

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1839
A=M // 1840
D=M // 1841
@SP // 1842
AM=M+1 // 1843
A=A-1 // 1844
M=D // 1845
// call Memory.getBinIndex
@6 // 1846
D=A // 1847
@14 // 1848
M=D // 1849
@Memory.getBinIndex // 1850
D=A // 1851
@13 // 1852
M=D // 1853
@Memory.alloc.ret.0 // 1854
D=A // 1855
@CALL // 1856
0;JMP // 1857
(Memory.alloc.ret.0)
@SP // 1858
AM=M-1 // 1859
D=M // 1860
@LCL // 1861
A=M // 1862
M=D // 1863

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1864
A=M // 1865
D=M // 1866
@2048 // 1867
D=D+A // 1868
@LCL // 1869
A=M+1 // 1870
M=D // 1871

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1872
A=M+1 // 1873
D=M // 1874
@SP // 1875
AM=M+1 // 1876
A=A-1 // 1877
M=D // 1878
@ARG // 1879
A=M // 1880
D=M // 1881
@SP // 1882
AM=M+1 // 1883
A=A-1 // 1884
M=D // 1885
// call Memory.get_best_fit
@7 // 1886
D=A // 1887
@14 // 1888
M=D // 1889
@Memory.get_best_fit // 1890
D=A // 1891
@13 // 1892
M=D // 1893
@Memory.alloc.ret.1 // 1894
D=A // 1895
@CALL // 1896
0;JMP // 1897
(Memory.alloc.ret.1)
@SP // 1898
AM=M-1 // 1899
D=M // 1900
@LCL // 1901
A=M+1 // 1902
A=A+1 // 1903
M=D // 1904

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
@Memory.alloc.EQ.0 // 1905
D=A // 1906
@SP // 1907
AM=M+1 // 1908
A=A-1 // 1909
M=D // 1910
@LCL // 1911
A=M+1 // 1912
A=A+1 // 1913
D=M // 1914
@DO_EQ // 1915
0;JMP // 1916
(Memory.alloc.EQ.0)
@WHILE_END_Memory.alloc1 // 1917
D;JEQ // 1918

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
@Memory.alloc.EQ.1 // 1919
D=A // 1920
@SP // 1921
AM=M+1 // 1922
A=A-1 // 1923
M=D // 1924
@Memory.alloc.LT.2 // 1925
D=A // 1926
@SP // 1927
AM=M+1 // 1928
A=A-1 // 1929
M=D // 1930
@LCL // 1931
A=M // 1932
D=M // 1933
D=D+1 // 1934
@7 // 1935
D=D-A // 1936
@DO_LT // 1937
0;JMP // 1938
(Memory.alloc.LT.2)
D=!D // 1939
@DO_EQ // 1940
0;JMP // 1941
(Memory.alloc.EQ.1)
@Memory.alloc.IfElse1 // 1942
D;JNE // 1943

////PushInstruction("constant 0")
@SP // 1944
AM=M+1 // 1945
A=A-1 // 1946
M=0 // 1947

////ReturnInstruction{}
@RETURN // 1948
0;JMP // 1949

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 1950
0;JMP // 1951

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

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

@LCL // 1952
A=M // 1953
M=M+1 // 1954

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1955
A=M // 1956
D=M // 1957
@2048 // 1958
D=D+A // 1959
@LCL // 1960
A=M+1 // 1961
M=D // 1962

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1963
A=M+1 // 1964
D=M // 1965
@SP // 1966
AM=M+1 // 1967
A=A-1 // 1968
M=D // 1969
@ARG // 1970
A=M // 1971
D=M // 1972
@SP // 1973
AM=M+1 // 1974
A=A-1 // 1975
M=D // 1976
// call Memory.get_best_fit
@7 // 1977
D=A // 1978
@14 // 1979
M=D // 1980
@Memory.get_best_fit // 1981
D=A // 1982
@13 // 1983
M=D // 1984
@Memory.alloc.ret.2 // 1985
D=A // 1986
@CALL // 1987
0;JMP // 1988
(Memory.alloc.ret.2)
@SP // 1989
AM=M-1 // 1990
D=M // 1991
@LCL // 1992
A=M+1 // 1993
A=A+1 // 1994
M=D // 1995

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 1996
0;JMP // 1997

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{Memory.getBinIndex}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{Memory.remove_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1998
A=M+1 // 1999
A=A+1 // 2000
D=M // 2001
@0 // 2002
A=D+A // 2003
D=M // 2004
@SP // 2005
AM=M+1 // 2006
A=A-1 // 2007
M=D // 2008
// call Memory.getBinIndex
@6 // 2009
D=A // 2010
@14 // 2011
M=D // 2012
@Memory.getBinIndex // 2013
D=A // 2014
@13 // 2015
M=D // 2016
@Memory.alloc.ret.3 // 2017
D=A // 2018
@CALL // 2019
0;JMP // 2020
(Memory.alloc.ret.3)
@SP // 2021
AM=M-1 // 2022
D=M // 2023
@2048 // 2024
D=D+A // 2025
@SP // 2026
AM=M+1 // 2027
A=A-1 // 2028
M=D // 2029
@LCL // 2030
A=M+1 // 2031
A=A+1 // 2032
D=M // 2033
@SP // 2034
AM=M+1 // 2035
A=A-1 // 2036
M=D // 2037
// call Memory.remove_node
@7 // 2038
D=A // 2039
@14 // 2040
M=D // 2041
@Memory.remove_node // 2042
D=A // 2043
@13 // 2044
M=D // 2045
@Memory.alloc.ret.4 // 2046
D=A // 2047
@CALL // 2048
0;JMP // 2049
(Memory.alloc.ret.4)
@SP // 2050
M=M-1 // 2051

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 2"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 2052
A=M+1 // 2053
A=A+1 // 2054
D=M // 2055
@0 // 2056
A=D+A // 2057
D=M // 2058
@SP // 2059
AM=M+1 // 2060
A=A-1 // 2061
M=D // 2062
@ARG // 2063
A=M // 2064
D=M // 2065
@SP // 2066
AM=M-1 // 2067
D=M-D // 2068
@LCL // 2069
A=M+1 // 2070
A=A+1 // 2071
A=A+1 // 2072
M=D // 2073

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
@Memory.alloc.GT.3 // 2074
D=A // 2075
@SP // 2076
AM=M+1 // 2077
A=A-1 // 2078
M=D // 2079
@LCL // 2080
A=M+1 // 2081
A=A+1 // 2082
A=A+1 // 2083
D=M // 2084
@5 // 2085
D=D-A // 2086
@DO_GT // 2087
0;JMP // 2088
(Memory.alloc.GT.3)
D=!D // 2089
@Memory.alloc.IfElse2 // 2090
D;JNE // 2091

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2092
A=M+1 // 2093
A=A+1 // 2094
D=M // 2095
@SP // 2096
AM=M+1 // 2097
A=A-1 // 2098
M=D // 2099
@ARG // 2100
A=M // 2101
D=M // 2102
@SP // 2103
AM=M-1 // 2104
A=M // 2105
M=D // 2106

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2107
A=M+1 // 2108
A=A+1 // 2109
D=M // 2110
@SP // 2111
AM=M+1 // 2112
A=A-1 // 2113
M=D+1 // 2114
D=0 // 2115
@SP // 2116
AM=M-1 // 2117
A=M // 2118
M=D // 2119

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2120
A=M+1 // 2121
A=A+1 // 2122
D=M // 2123
@SP // 2124
AM=M+1 // 2125
A=A-1 // 2126
M=D // 2127
// call Memory.create_foot
@6 // 2128
D=A // 2129
@14 // 2130
M=D // 2131
@Memory.create_foot // 2132
D=A // 2133
@13 // 2134
M=D // 2135
@Memory.alloc.ret.5 // 2136
D=A // 2137
@CALL // 2138
0;JMP // 2139
(Memory.alloc.ret.5)
@SP // 2140
M=M-1 // 2141

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
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 2142
A=M+1 // 2143
A=A+1 // 2144
D=M // 2145
@SP // 2146
AM=M+1 // 2147
A=A-1 // 2148
M=D // 2149
@ARG // 2150
A=M // 2151
D=M // 2152
@SP // 2153
AM=M-1 // 2154
D=D+M // 2155
@5 // 2156
D=D+A // 2157
@SP // 2158
AM=M+1 // 2159
A=A-1 // 2160
M=D // 2161
@LCL // 2162
D=M // 2163
@4 // 2164
A=D+A // 2165
D=A // 2166
@R13 // 2167
M=D // 2168
@SP // 2169
AM=M-1 // 2170
D=M // 2171
@R13 // 2172
A=M // 2173
M=D // 2174

////PushWriter{source=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "SUB"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2175
D=M // 2176
@4 // 2177
A=D+A // 2178
D=M // 2179
@SP // 2180
AM=M+1 // 2181
A=A-1 // 2182
M=D // 2183
@LCL // 2184
A=M+1 // 2185
A=A+1 // 2186
A=A+1 // 2187
D=M // 2188
@5 // 2189
D=D-A // 2190
@SP // 2191
AM=M-1 // 2192
A=M // 2193
M=D // 2194

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2195
D=M // 2196
@4 // 2197
A=D+A // 2198
D=M // 2199
@SP // 2200
AM=M+1 // 2201
A=A-1 // 2202
M=D+1 // 2203
D=1 // 2204
@SP // 2205
AM=M-1 // 2206
A=M // 2207
M=D // 2208

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2209
D=M // 2210
@4 // 2211
A=D+A // 2212
D=M // 2213
@SP // 2214
AM=M+1 // 2215
A=A-1 // 2216
M=D // 2217
// call Memory.create_foot
@6 // 2218
D=A // 2219
@14 // 2220
M=D // 2221
@Memory.create_foot // 2222
D=A // 2223
@13 // 2224
M=D // 2225
@Memory.alloc.ret.6 // 2226
D=A // 2227
@CALL // 2228
0;JMP // 2229
(Memory.alloc.ret.6)
@SP // 2230
M=M-1 // 2231

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 2048"),
//    right:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.getBinIndex}},
//    binaryOp: "ADD"
//), PushInstruction("local 4")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2232
A=M+1 // 2233
A=A+1 // 2234
A=A+1 // 2235
D=M // 2236
@SP // 2237
AM=M+1 // 2238
A=A-1 // 2239
M=D // 2240
// call Memory.getBinIndex
@6 // 2241
D=A // 2242
@14 // 2243
M=D // 2244
@Memory.getBinIndex // 2245
D=A // 2246
@13 // 2247
M=D // 2248
@Memory.alloc.ret.7 // 2249
D=A // 2250
@CALL // 2251
0;JMP // 2252
(Memory.alloc.ret.7)
@SP // 2253
AM=M-1 // 2254
D=M // 2255
@2048 // 2256
D=D+A // 2257
@SP // 2258
AM=M+1 // 2259
A=A-1 // 2260
M=D // 2261
@LCL // 2262
D=M // 2263
@4 // 2264
A=D+A // 2265
D=M // 2266
@SP // 2267
AM=M+1 // 2268
A=A-1 // 2269
M=D // 2270
// call Memory.add_node
@7 // 2271
D=A // 2272
@14 // 2273
M=D // 2274
@Memory.add_node // 2275
D=A // 2276
@13 // 2277
M=D // 2278
@Memory.alloc.ret.8 // 2279
D=A // 2280
@CALL // 2281
0;JMP // 2282
(Memory.alloc.ret.8)
@SP // 2283
M=M-1 // 2284

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2285
0;JMP // 2286

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2287
A=M+1 // 2288
A=A+1 // 2289
D=M // 2290
@SP // 2291
AM=M+1 // 2292
A=A-1 // 2293
M=D+1 // 2294
D=0 // 2295
@SP // 2296
AM=M-1 // 2297
A=M // 2298
M=D // 2299

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2300
A=M+1 // 2301
A=A+1 // 2302
D=M // 2303
@SP // 2304
AM=M+1 // 2305
A=A-1 // 2306
M=D // 2307
// call Memory.create_foot
@6 // 2308
D=A // 2309
@14 // 2310
M=D // 2311
@Memory.create_foot // 2312
D=A // 2313
@13 // 2314
M=D // 2315
@Memory.alloc.ret.9 // 2316
D=A // 2317
@CALL // 2318
0;JMP // 2319
(Memory.alloc.ret.9)
@SP // 2320
M=M-1 // 2321

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
@LCL // 2322
A=M+1 // 2323
A=A+1 // 2324
D=M // 2325
@4 // 2326
D=D+A // 2327
@SP // 2328
AM=M+1 // 2329
A=A-1 // 2330
M=D // 2331

////ReturnInstruction{}
@RETURN // 2332
0;JMP // 2333

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2334
AM=M+1 // 2335
A=A-1 // 2336
M=0 // 2337

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2338
A=M // 2339
D=M // 2340
@SP // 2341
AM=M+1 // 2342
A=A-1 // 2343
M=D // 2344
// call Memory.alloc
@6 // 2345
D=A // 2346
@14 // 2347
M=D // 2348
@Memory.alloc // 2349
D=A // 2350
@13 // 2351
M=D // 2352
@Memory.calloc.ret.0 // 2353
D=A // 2354
@CALL // 2355
0;JMP // 2356
(Memory.calloc.ret.0)
@SP // 2357
AM=M-1 // 2358
D=M // 2359
@LCL // 2360
A=M // 2361
M=D // 2362

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.4 // 2363
D=A // 2364
@SP // 2365
AM=M+1 // 2366
A=A-1 // 2367
M=D // 2368
@LCL // 2369
A=M // 2370
D=!M // 2371
@DO_EQ // 2372
0;JMP // 2373
(Memory.calloc.EQ.4)
@Memory.calloc.IfElse1 // 2374
D;JNE // 2375

////PushInstruction("constant 0")
@SP // 2376
AM=M+1 // 2377
A=A-1 // 2378
M=0 // 2379

////ReturnInstruction{}
@RETURN // 2380
0;JMP // 2381

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 2382
0;JMP // 2383

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
@Memory.calloc.GT.5 // 2384
D=A // 2385
@SP // 2386
AM=M+1 // 2387
A=A-1 // 2388
M=D // 2389
@ARG // 2390
A=M // 2391
D=M // 2392
@DO_GT // 2393
0;JMP // 2394
(Memory.calloc.GT.5)
D=!D // 2395
@WHILE_END_Memory.calloc1 // 2396
D;JNE // 2397

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

@ARG // 2398
A=M // 2399
M=M-1 // 2400

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2401
A=M // 2402
D=M // 2403
@SP // 2404
AM=M+1 // 2405
A=A-1 // 2406
M=D // 2407
@ARG // 2408
A=M // 2409
D=M // 2410
@SP // 2411
AM=M-1 // 2412
D=D+M // 2413
@SP // 2414
AM=M+1 // 2415
A=A-1 // 2416
M=D // 2417
D=0 // 2418
@SP // 2419
AM=M-1 // 2420
A=M // 2421
M=D // 2422

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2423
0;JMP // 2424

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2425
A=M // 2426
D=M // 2427
@SP // 2428
AM=M+1 // 2429
A=A-1 // 2430
M=D // 2431

////ReturnInstruction{}
@RETURN // 2432
0;JMP // 2433

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2434
D=A // 2435
@SP // 2436
AM=D+M // 2437
A=A-1 // 2438
M=0 // 2439
A=A-1 // 2440
M=0 // 2441
A=A-1 // 2442
M=0 // 2443

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

@ARG // 2444
A=M // 2445
D=M // 2446
@4 // 2447
D=D-A // 2448
@LCL // 2449
A=M // 2450
M=D // 2451

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2452
A=M // 2453
D=M // 2454
@SP // 2455
AM=M+1 // 2456
A=A-1 // 2457
M=D+1 // 2458
D=1 // 2459
@SP // 2460
AM=M-1 // 2461
A=M // 2462
M=D // 2463

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2464
A=M // 2465
D=M // 2466
@2 // 2467
A=D+A // 2468
D=M // 2469
@LCL // 2470
A=M+1 // 2471
M=D // 2472

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2473
A=M // 2474
D=M // 2475
@3 // 2476
A=D+A // 2477
D=M // 2478
@LCL // 2479
A=M+1 // 2480
A=A+1 // 2481
M=D // 2482

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
@Memory.deAlloc.EQ.6 // 2483
D=A // 2484
@SP // 2485
AM=M+1 // 2486
A=A-1 // 2487
M=D // 2488
@Memory.deAlloc.EQ.7 // 2489
D=A // 2490
@SP // 2491
AM=M+1 // 2492
A=A-1 // 2493
M=D // 2494
@LCL // 2495
A=M+1 // 2496
D=M // 2497
@DO_EQ // 2498
0;JMP // 2499
(Memory.deAlloc.EQ.7)
D=!D // 2500
@DO_EQ // 2501
0;JMP // 2502
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse1 // 2503
D;JNE // 2504

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
@Memory.deAlloc.EQ.8 // 2505
D=A // 2506
@SP // 2507
AM=M+1 // 2508
A=A-1 // 2509
M=D // 2510
@LCL // 2511
A=M+1 // 2512
D=M // 2513
A=D+1 // 2514
D=M // 2515
D=D-1 // 2516
@DO_EQ // 2517
0;JMP // 2518
(Memory.deAlloc.EQ.8)
D=!D // 2519
@Memory.deAlloc.IfElse2 // 2520
D;JNE // 2521

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{Memory.getBinIndex}},
//    binaryOp: "ADD"
//), PushInstruction("local 1")], call=CallInstruction{Memory.remove_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2522
A=M+1 // 2523
D=M // 2524
@0 // 2525
A=D+A // 2526
D=M // 2527
@SP // 2528
AM=M+1 // 2529
A=A-1 // 2530
M=D // 2531
// call Memory.getBinIndex
@6 // 2532
D=A // 2533
@14 // 2534
M=D // 2535
@Memory.getBinIndex // 2536
D=A // 2537
@13 // 2538
M=D // 2539
@Memory.deAlloc.ret.0 // 2540
D=A // 2541
@CALL // 2542
0;JMP // 2543
(Memory.deAlloc.ret.0)
@SP // 2544
AM=M-1 // 2545
D=M // 2546
@2048 // 2547
D=D+A // 2548
@SP // 2549
AM=M+1 // 2550
A=A-1 // 2551
M=D // 2552
@LCL // 2553
A=M+1 // 2554
D=M // 2555
@SP // 2556
AM=M+1 // 2557
A=A-1 // 2558
M=D // 2559
// call Memory.remove_node
@7 // 2560
D=A // 2561
@14 // 2562
M=D // 2563
@Memory.remove_node // 2564
D=A // 2565
@13 // 2566
M=D // 2567
@Memory.deAlloc.ret.1 // 2568
D=A // 2569
@CALL // 2570
0;JMP // 2571
(Memory.deAlloc.ret.1)
@SP // 2572
M=M-1 // 2573

////PushWriter{source=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 1"),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "ADD"
//                        )
//                ),
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2574
A=M+1 // 2575
D=M // 2576
@SP // 2577
AM=M+1 // 2578
A=A-1 // 2579
M=D // 2580
@LCL // 2581
A=M+1 // 2582
D=M // 2583
@0 // 2584
A=D+A // 2585
D=M // 2586
@SP // 2587
AM=M+1 // 2588
A=A-1 // 2589
M=D // 2590
@LCL // 2591
A=M // 2592
D=M // 2593
@0 // 2594
A=D+A // 2595
D=M // 2596
@SP // 2597
AM=M-1 // 2598
D=D+M // 2599
@5 // 2600
D=D+A // 2601
@SP // 2602
AM=M-1 // 2603
A=M // 2604
M=D // 2605

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2606
A=M+1 // 2607
D=M // 2608
@SP // 2609
AM=M+1 // 2610
A=A-1 // 2611
M=D // 2612
// call Memory.create_foot
@6 // 2613
D=A // 2614
@14 // 2615
M=D // 2616
@Memory.create_foot // 2617
D=A // 2618
@13 // 2619
M=D // 2620
@Memory.deAlloc.ret.2 // 2621
D=A // 2622
@CALL // 2623
0;JMP // 2624
(Memory.deAlloc.ret.2)
@SP // 2625
M=M-1 // 2626

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2627
A=M+1 // 2628
D=M // 2629
@LCL // 2630
A=M // 2631
M=D // 2632

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 2633
0;JMP // 2634

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 2635
0;JMP // 2636

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
@Memory.deAlloc.EQ.9 // 2637
D=A // 2638
@SP // 2639
AM=M+1 // 2640
A=A-1 // 2641
M=D // 2642
@Memory.deAlloc.EQ.10 // 2643
D=A // 2644
@SP // 2645
AM=M+1 // 2646
A=A-1 // 2647
M=D // 2648
@LCL // 2649
A=M+1 // 2650
A=A+1 // 2651
D=M // 2652
@DO_EQ // 2653
0;JMP // 2654
(Memory.deAlloc.EQ.10)
D=!D // 2655
@DO_EQ // 2656
0;JMP // 2657
(Memory.deAlloc.EQ.9)
@Memory.deAlloc.IfElse3 // 2658
D;JNE // 2659

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
@Memory.deAlloc.EQ.11 // 2660
D=A // 2661
@SP // 2662
AM=M+1 // 2663
A=A-1 // 2664
M=D // 2665
@LCL // 2666
A=M+1 // 2667
A=A+1 // 2668
D=M // 2669
A=D+1 // 2670
D=M // 2671
D=D-1 // 2672
@DO_EQ // 2673
0;JMP // 2674
(Memory.deAlloc.EQ.11)
D=!D // 2675
@Memory.deAlloc.IfElse4 // 2676
D;JNE // 2677

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{Memory.getBinIndex}},
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{Memory.remove_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2678
A=M+1 // 2679
A=A+1 // 2680
D=M // 2681
@0 // 2682
A=D+A // 2683
D=M // 2684
@SP // 2685
AM=M+1 // 2686
A=A-1 // 2687
M=D // 2688
// call Memory.getBinIndex
@6 // 2689
D=A // 2690
@14 // 2691
M=D // 2692
@Memory.getBinIndex // 2693
D=A // 2694
@13 // 2695
M=D // 2696
@Memory.deAlloc.ret.3 // 2697
D=A // 2698
@CALL // 2699
0;JMP // 2700
(Memory.deAlloc.ret.3)
@SP // 2701
AM=M-1 // 2702
D=M // 2703
@2048 // 2704
D=D+A // 2705
@SP // 2706
AM=M+1 // 2707
A=A-1 // 2708
M=D // 2709
@LCL // 2710
A=M+1 // 2711
A=A+1 // 2712
D=M // 2713
@SP // 2714
AM=M+1 // 2715
A=A-1 // 2716
M=D // 2717
// call Memory.remove_node
@7 // 2718
D=A // 2719
@14 // 2720
M=D // 2721
@Memory.remove_node // 2722
D=A // 2723
@13 // 2724
M=D // 2725
@Memory.deAlloc.ret.4 // 2726
D=A // 2727
@CALL // 2728
0;JMP // 2729
(Memory.deAlloc.ret.4)
@SP // 2730
M=M-1 // 2731

////PushWriter{source=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2732
A=M // 2733
D=M // 2734
@SP // 2735
AM=M+1 // 2736
A=A-1 // 2737
M=D // 2738
@LCL // 2739
A=M // 2740
D=M // 2741
@0 // 2742
A=D+A // 2743
D=M // 2744
@SP // 2745
AM=M+1 // 2746
A=A-1 // 2747
M=D // 2748
@LCL // 2749
A=M+1 // 2750
A=A+1 // 2751
D=M // 2752
@0 // 2753
A=D+A // 2754
D=M // 2755
@SP // 2756
AM=M-1 // 2757
D=D+M // 2758
@5 // 2759
D=D+A // 2760
@SP // 2761
AM=M-1 // 2762
A=M // 2763
M=D // 2764

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2765
A=M // 2766
D=M // 2767
@SP // 2768
AM=M+1 // 2769
A=A-1 // 2770
M=D // 2771
// call Memory.create_foot
@6 // 2772
D=A // 2773
@14 // 2774
M=D // 2775
@Memory.create_foot // 2776
D=A // 2777
@13 // 2778
M=D // 2779
@Memory.deAlloc.ret.5 // 2780
D=A // 2781
@CALL // 2782
0;JMP // 2783
(Memory.deAlloc.ret.5)
@SP // 2784
M=M-1 // 2785

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 2786
0;JMP // 2787

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 2788
0;JMP // 2789

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
//)], call=CallInstruction{Memory.getBinIndex}},
//    binaryOp: "ADD"
//), PushInstruction("local 0")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2790
A=M // 2791
D=M // 2792
@0 // 2793
A=D+A // 2794
D=M // 2795
@SP // 2796
AM=M+1 // 2797
A=A-1 // 2798
M=D // 2799
// call Memory.getBinIndex
@6 // 2800
D=A // 2801
@14 // 2802
M=D // 2803
@Memory.getBinIndex // 2804
D=A // 2805
@13 // 2806
M=D // 2807
@Memory.deAlloc.ret.6 // 2808
D=A // 2809
@CALL // 2810
0;JMP // 2811
(Memory.deAlloc.ret.6)
@SP // 2812
AM=M-1 // 2813
D=M // 2814
@2048 // 2815
D=D+A // 2816
@SP // 2817
AM=M+1 // 2818
A=A-1 // 2819
M=D // 2820
@LCL // 2821
A=M // 2822
D=M // 2823
@SP // 2824
AM=M+1 // 2825
A=A-1 // 2826
M=D // 2827
// call Memory.add_node
@7 // 2828
D=A // 2829
@14 // 2830
M=D // 2831
@Memory.add_node // 2832
D=A // 2833
@13 // 2834
M=D // 2835
@Memory.deAlloc.ret.7 // 2836
D=A // 2837
@CALL // 2838
0;JMP // 2839
(Memory.deAlloc.ret.7)
@SP // 2840
M=M-1 // 2841

////PushInstruction("constant 0")
@SP // 2842
AM=M+1 // 2843
A=A-1 // 2844
M=0 // 2845

////ReturnInstruction{}
@RETURN // 2846
0;JMP // 2847

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 2848
D=A // 2849
@SP // 2850
AM=D+M // 2851
A=A-1 // 2852
M=0 // 2853
A=A-1 // 2854
M=0 // 2855
A=A-1 // 2856
M=0 // 2857
A=A-1 // 2858
M=0 // 2859

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
@Memory.realloc.EQ.12 // 2860
D=A // 2861
@SP // 2862
AM=M+1 // 2863
A=A-1 // 2864
M=D // 2865
@ARG // 2866
A=M // 2867
D=M // 2868
@DO_EQ // 2869
0;JMP // 2870
(Memory.realloc.EQ.12)
@Memory.realloc.IfElse1 // 2871
D;JEQ // 2872

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 2873
A=M+1 // 2874
D=M // 2875
@SP // 2876
AM=M+1 // 2877
A=A-1 // 2878
M=D // 2879
// call Memory.alloc
@6 // 2880
D=A // 2881
@14 // 2882
M=D // 2883
@Memory.alloc // 2884
D=A // 2885
@13 // 2886
M=D // 2887
@Memory.realloc.ret.0 // 2888
D=A // 2889
@CALL // 2890
0;JMP // 2891
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 2892
0;JMP // 2893

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 2894
0;JMP // 2895

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 2896
A=M // 2897
D=M // 2898
D=D-1 // 2899
@LCL // 2900
A=M+1 // 2901
A=A+1 // 2902
A=A+1 // 2903
M=D // 2904

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 3"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2905
A=M+1 // 2906
A=A+1 // 2907
A=A+1 // 2908
D=M // 2909
@0 // 2910
A=D+A // 2911
D=M // 2912
@LCL // 2913
A=M // 2914
M=D // 2915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2916
A=M+1 // 2917
D=M // 2918
@SP // 2919
AM=M+1 // 2920
A=A-1 // 2921
M=D // 2922
// call Memory.alloc
@6 // 2923
D=A // 2924
@14 // 2925
M=D // 2926
@Memory.alloc // 2927
D=A // 2928
@13 // 2929
M=D // 2930
@Memory.realloc.ret.1 // 2931
D=A // 2932
@CALL // 2933
0;JMP // 2934
(Memory.realloc.ret.1)
@SP // 2935
AM=M-1 // 2936
D=M // 2937
@LCL // 2938
A=M+1 // 2939
M=D // 2940

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
@Memory.realloc.EQ.13 // 2941
D=A // 2942
@SP // 2943
AM=M+1 // 2944
A=A-1 // 2945
M=D // 2946
@LCL // 2947
A=M+1 // 2948
D=M // 2949
@DO_EQ // 2950
0;JMP // 2951
(Memory.realloc.EQ.13)
@Memory.realloc.IfElse2 // 2952
D;JEQ // 2953

////PushInstruction("constant 0")
@SP // 2954
AM=M+1 // 2955
A=A-1 // 2956
M=0 // 2957

////ReturnInstruction{}
@RETURN // 2958
0;JMP // 2959

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 2960
0;JMP // 2961

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
@Memory.realloc.EQ.14 // 2962
D=A // 2963
@SP // 2964
AM=M+1 // 2965
A=A-1 // 2966
M=D // 2967
@Memory.realloc.GT.15 // 2968
D=A // 2969
@SP // 2970
AM=M+1 // 2971
A=A-1 // 2972
M=D // 2973
@LCL // 2974
A=M // 2975
D=M // 2976
@SP // 2977
AM=M+1 // 2978
A=A-1 // 2979
M=D // 2980
@ARG // 2981
A=M+1 // 2982
D=M // 2983
@SP // 2984
AM=M-1 // 2985
D=M-D // 2986
@DO_GT // 2987
0;JMP // 2988
(Memory.realloc.GT.15)
D=!D // 2989
@DO_EQ // 2990
0;JMP // 2991
(Memory.realloc.EQ.14)
@Memory.realloc.IfElse3 // 2992
D;JNE // 2993

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2994
A=M // 2995
D=M // 2996
@LCL // 2997
A=M+1 // 2998
A=A+1 // 2999
M=D // 3000

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3001
0;JMP // 3002

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3003
A=M+1 // 3004
D=M // 3005
@LCL // 3006
A=M+1 // 3007
A=A+1 // 3008
M=D // 3009

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3010
A=M // 3011
D=M // 3012
@SP // 3013
AM=M+1 // 3014
A=A-1 // 3015
M=D // 3016
@LCL // 3017
A=M+1 // 3018
D=M // 3019
@SP // 3020
AM=M+1 // 3021
A=A-1 // 3022
M=D // 3023
@LCL // 3024
A=M+1 // 3025
A=A+1 // 3026
D=M // 3027
@SP // 3028
AM=M+1 // 3029
A=A-1 // 3030
M=D // 3031
// call Memory.copy
@8 // 3032
D=A // 3033
@14 // 3034
M=D // 3035
@Memory.copy // 3036
D=A // 3037
@13 // 3038
M=D // 3039
@Memory.realloc.ret.2 // 3040
D=A // 3041
@CALL // 3042
0;JMP // 3043
(Memory.realloc.ret.2)
@SP // 3044
M=M-1 // 3045

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3046
A=M // 3047
D=M // 3048
@SP // 3049
AM=M+1 // 3050
A=A-1 // 3051
M=D // 3052
// call Memory.deAlloc
@6 // 3053
D=A // 3054
@14 // 3055
M=D // 3056
@Memory.deAlloc // 3057
D=A // 3058
@13 // 3059
M=D // 3060
@Memory.realloc.ret.3 // 3061
D=A // 3062
@CALL // 3063
0;JMP // 3064
(Memory.realloc.ret.3)
@SP // 3065
M=M-1 // 3066

////PushInstruction("local 1")
@LCL // 3067
A=M+1 // 3068
D=M // 3069
@SP // 3070
AM=M+1 // 3071
A=A-1 // 3072
M=D // 3073

////ReturnInstruction{}
@RETURN // 3074
0;JMP // 3075

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3076
AM=M+1 // 3077
A=A-1 // 3078
M=0 // 3079

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3080
A=M // 3081
M=0 // 3082

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
@Memory.copy.LT.16 // 3083
D=A // 3084
@SP // 3085
AM=M+1 // 3086
A=A-1 // 3087
M=D // 3088
@LCL // 3089
A=M // 3090
D=M // 3091
@SP // 3092
AM=M+1 // 3093
A=A-1 // 3094
M=D // 3095
@ARG // 3096
A=M+1 // 3097
A=A+1 // 3098
D=M // 3099
@SP // 3100
AM=M-1 // 3101
D=M-D // 3102
@DO_LT // 3103
0;JMP // 3104
(Memory.copy.LT.16)
D=!D // 3105
@WHILE_END_Memory.copy1 // 3106
D;JNE // 3107

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3108
A=M+1 // 3109
D=M // 3110
@SP // 3111
AM=M+1 // 3112
A=A-1 // 3113
M=D // 3114
@LCL // 3115
A=M // 3116
D=M // 3117
@SP // 3118
AM=M-1 // 3119
D=D+M // 3120
@SP // 3121
AM=M+1 // 3122
A=A-1 // 3123
M=D // 3124
@ARG // 3125
A=M // 3126
D=M // 3127
@SP // 3128
AM=M+1 // 3129
A=A-1 // 3130
M=D // 3131
@LCL // 3132
A=M // 3133
D=M // 3134
@SP // 3135
AM=M-1 // 3136
A=D+M // 3137
D=M // 3138
@SP // 3139
AM=M-1 // 3140
A=M // 3141
M=D // 3142

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

@LCL // 3143
A=M // 3144
M=M+1 // 3145

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3146
0;JMP // 3147

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3148
AM=M+1 // 3149
A=A-1 // 3150
M=0 // 3151

////ReturnInstruction{}
@RETURN // 3152
0;JMP // 3153

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
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
@Memory.remove_node.EQ.17 // 3154
D=A // 3155
@SP // 3156
AM=M+1 // 3157
A=A-1 // 3158
M=D // 3159
@Memory.remove_node.EQ.18 // 3160
D=A // 3161
@SP // 3162
AM=M+1 // 3163
A=A-1 // 3164
M=D // 3165
@ARG // 3166
A=M+1 // 3167
D=M // 3168
@2 // 3169
A=D+A // 3170
D=M // 3171
@DO_EQ // 3172
0;JMP // 3173
(Memory.remove_node.EQ.18)
D=!D // 3174
@DO_EQ // 3175
0;JMP // 3176
(Memory.remove_node.EQ.17)
@Memory.remove_node.IfElse1 // 3177
D;JNE // 3178

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
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
//)}
@ARG // 3179
A=M+1 // 3180
D=M // 3181
@2 // 3182
D=D+A // 3183
@3 // 3184
D=D+A // 3185
@SP // 3186
AM=M+1 // 3187
A=A-1 // 3188
M=D // 3189
@ARG // 3190
A=M+1 // 3191
D=M // 3192
@3 // 3193
A=D+A // 3194
D=M // 3195
@SP // 3196
AM=M-1 // 3197
A=M // 3198
M=D // 3199

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3200
0;JMP // 3201

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3202
A=M // 3203
D=M // 3204
@SP // 3205
AM=M+1 // 3206
A=A-1 // 3207
M=D // 3208
@ARG // 3209
A=M+1 // 3210
D=M // 3211
@3 // 3212
A=D+A // 3213
D=M // 3214
@SP // 3215
AM=M-1 // 3216
A=M // 3217
M=D // 3218

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
@Memory.remove_node.EQ.19 // 3219
D=A // 3220
@SP // 3221
AM=M+1 // 3222
A=A-1 // 3223
M=D // 3224
@Memory.remove_node.EQ.20 // 3225
D=A // 3226
@SP // 3227
AM=M+1 // 3228
A=A-1 // 3229
M=D // 3230
@ARG // 3231
A=M+1 // 3232
D=M // 3233
@3 // 3234
A=D+A // 3235
D=M // 3236
@DO_EQ // 3237
0;JMP // 3238
(Memory.remove_node.EQ.20)
D=!D // 3239
@DO_EQ // 3240
0;JMP // 3241
(Memory.remove_node.EQ.19)
@Memory.remove_node.IfElse2 // 3242
D;JNE // 3243

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
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
//)}
@ARG // 3244
A=M+1 // 3245
D=M // 3246
@3 // 3247
D=D+A // 3248
@2 // 3249
D=D+A // 3250
@SP // 3251
AM=M+1 // 3252
A=A-1 // 3253
M=D // 3254
@ARG // 3255
A=M+1 // 3256
D=M // 3257
@2 // 3258
A=D+A // 3259
D=M // 3260
@SP // 3261
AM=M-1 // 3262
A=M // 3263
M=D // 3264

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 3265
0;JMP // 3266

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3267
A=M+1 // 3268
D=M // 3269
@2 // 3270
D=D+A // 3271
@SP // 3272
AM=M+1 // 3273
A=A-1 // 3274
M=D // 3275
D=0 // 3276
@SP // 3277
AM=M-1 // 3278
A=M // 3279
M=D // 3280

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3281
A=M+1 // 3282
D=M // 3283
@3 // 3284
D=D+A // 3285
@SP // 3286
AM=M+1 // 3287
A=A-1 // 3288
M=D // 3289
D=0 // 3290
@SP // 3291
AM=M-1 // 3292
A=M // 3293
M=D // 3294

////PushInstruction("constant 0")
@SP // 3295
AM=M+1 // 3296
A=A-1 // 3297
M=0 // 3298

////ReturnInstruction{}
@RETURN // 3299
0;JMP // 3300

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3301
AM=M+1 // 3302
A=A-1 // 3303
M=0 // 3304

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3305
A=M // 3306
M=0 // 3307

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
@Memory.getBinIndex.EQ.21 // 3308
D=A // 3309
@SP // 3310
AM=M+1 // 3311
A=A-1 // 3312
M=D // 3313
@Memory.getBinIndex.LT.22 // 3314
D=A // 3315
@SP // 3316
AM=M+1 // 3317
A=A-1 // 3318
M=D // 3319
@LCL // 3320
A=M // 3321
D=M // 3322
@7 // 3323
D=D-A // 3324
@DO_LT // 3325
0;JMP // 3326
(Memory.getBinIndex.LT.22)
@SP // 3327
AM=M+1 // 3328
A=A-1 // 3329
M=D // 3330
@Memory.getBinIndex.EQ.23 // 3331
D=A // 3332
@SP // 3333
AM=M+1 // 3334
A=A-1 // 3335
M=D // 3336
@LCL // 3337
A=M // 3338
D=M // 3339
@2048 // 3340
A=D+A // 3341
D=M // 3342
@DO_EQ // 3343
0;JMP // 3344
(Memory.getBinIndex.EQ.23)
D=!D // 3345
@SP // 3346
AM=M-1 // 3347
D=D&M // 3348
@DO_EQ // 3349
0;JMP // 3350
(Memory.getBinIndex.EQ.21)
@WHILE_END_Memory.getBinIndex1 // 3351
D;JNE // 3352

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
//), PushInstruction("constant 16")], call=CallInstruction{Math.multiply}},
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.getBinIndex.IfElse1}}
@Memory.getBinIndex.EQ.24 // 3353
D=A // 3354
@SP // 3355
AM=M+1 // 3356
A=A-1 // 3357
M=D // 3358
@Memory.getBinIndex.GT.25 // 3359
D=A // 3360
@SP // 3361
AM=M+1 // 3362
A=A-1 // 3363
M=D // 3364
@ARG // 3365
A=M // 3366
D=M // 3367
@SP // 3368
AM=M+1 // 3369
A=A-1 // 3370
M=D // 3371
@LCL // 3372
A=M // 3373
D=M // 3374
@SP // 3375
AM=M+1 // 3376
A=A-1 // 3377
M=D+1 // 3378
@16 // 3379
D=A // 3380
@SP // 3381
AM=M+1 // 3382
A=A-1 // 3383
M=D // 3384
// call Math.multiply
@7 // 3385
D=A // 3386
@14 // 3387
M=D // 3388
@Math.multiply // 3389
D=A // 3390
@13 // 3391
M=D // 3392
@Memory.getBinIndex.ret.0 // 3393
D=A // 3394
@CALL // 3395
0;JMP // 3396
(Memory.getBinIndex.ret.0)
@SP // 3397
AM=M-1 // 3398
D=M // 3399
@SP // 3400
AM=M-1 // 3401
D=M-D // 3402
@DO_GT // 3403
0;JMP // 3404
(Memory.getBinIndex.GT.25)
D=!D // 3405
@DO_EQ // 3406
0;JMP // 3407
(Memory.getBinIndex.EQ.24)
@Memory.getBinIndex.IfElse1 // 3408
D;JNE // 3409

////PushInstruction("local 0")
@LCL // 3410
A=M // 3411
D=M // 3412
@SP // 3413
AM=M+1 // 3414
A=A-1 // 3415
M=D // 3416

////ReturnInstruction{}
@RETURN // 3417
0;JMP // 3418

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 3419
0;JMP // 3420

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

@LCL // 3421
A=M // 3422
M=M+1 // 3423

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3424
0;JMP // 3425

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
@6 // 3426
D=A // 3427
@SP // 3428
AM=M+1 // 3429
A=A-1 // 3430
M=D // 3431
@7 // 3432
D=A // 3433
@SP // 3434
AM=M+1 // 3435
A=A-1 // 3436
M=D-1 // 3437

////ReturnInstruction{}
@RETURN // 3438
0;JMP // 3439

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3440
AM=M+1 // 3441
A=A-1 // 3442
M=0 // 3443

////PushPopPair {
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
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3444
A=M // 3445
D=M // 3446
@0 // 3447
A=D+A // 3448
D=M // 3449
@LCL // 3450
A=M // 3451
M=D // 3452

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
//                                    PushInstruction("constant 0"),
//                                binaryOp: "ADD"
//                            )
//                    ),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse1}}
@Memory.get_best_fit.EQ.26 // 3453
D=A // 3454
@SP // 3455
AM=M+1 // 3456
A=A-1 // 3457
M=D // 3458
@Memory.get_best_fit.LT.27 // 3459
D=A // 3460
@SP // 3461
AM=M+1 // 3462
A=A-1 // 3463
M=D // 3464
@LCL // 3465
A=M // 3466
D=M // 3467
@0 // 3468
A=D+A // 3469
D=M // 3470
@SP // 3471
AM=M+1 // 3472
A=A-1 // 3473
M=D // 3474
@ARG // 3475
A=M+1 // 3476
D=M // 3477
@SP // 3478
AM=M-1 // 3479
D=M-D // 3480
@DO_LT // 3481
0;JMP // 3482
(Memory.get_best_fit.LT.27)
D=!D // 3483
@DO_EQ // 3484
0;JMP // 3485
(Memory.get_best_fit.EQ.26)
@Memory.get_best_fit.IfElse1 // 3486
D;JNE // 3487

////PushInstruction("local 0")
@LCL // 3488
A=M // 3489
D=M // 3490
@SP // 3491
AM=M+1 // 3492
A=A-1 // 3493
M=D // 3494

////ReturnInstruction{}
@RETURN // 3495
0;JMP // 3496

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 3497
0;JMP // 3498

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
@Memory.get_best_fit.EQ.28 // 3499
D=A // 3500
@SP // 3501
AM=M+1 // 3502
A=A-1 // 3503
M=D // 3504
@Memory.get_best_fit.EQ.29 // 3505
D=A // 3506
@SP // 3507
AM=M+1 // 3508
A=A-1 // 3509
M=D // 3510
@LCL // 3511
A=M // 3512
D=M // 3513
@3 // 3514
A=D+A // 3515
D=M // 3516
@DO_EQ // 3517
0;JMP // 3518
(Memory.get_best_fit.EQ.29)
D=!D // 3519
@DO_EQ // 3520
0;JMP // 3521
(Memory.get_best_fit.EQ.28)
@WHILE_END_Memory.get_best_fit1 // 3522
D;JNE // 3523

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3524
A=M // 3525
D=M // 3526
@3 // 3527
A=D+A // 3528
D=M // 3529
@LCL // 3530
A=M // 3531
M=D // 3532

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
//                                    PushInstruction("constant 0"),
//                                binaryOp: "ADD"
//                            )
//                    ),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse2}}
@Memory.get_best_fit.EQ.30 // 3533
D=A // 3534
@SP // 3535
AM=M+1 // 3536
A=A-1 // 3537
M=D // 3538
@Memory.get_best_fit.LT.31 // 3539
D=A // 3540
@SP // 3541
AM=M+1 // 3542
A=A-1 // 3543
M=D // 3544
@LCL // 3545
A=M // 3546
D=M // 3547
@0 // 3548
A=D+A // 3549
D=M // 3550
@SP // 3551
AM=M+1 // 3552
A=A-1 // 3553
M=D // 3554
@ARG // 3555
A=M+1 // 3556
D=M // 3557
@SP // 3558
AM=M-1 // 3559
D=M-D // 3560
@DO_LT // 3561
0;JMP // 3562
(Memory.get_best_fit.LT.31)
D=!D // 3563
@DO_EQ // 3564
0;JMP // 3565
(Memory.get_best_fit.EQ.30)
@Memory.get_best_fit.IfElse2 // 3566
D;JNE // 3567

////PushInstruction("local 0")
@LCL // 3568
A=M // 3569
D=M // 3570
@SP // 3571
AM=M+1 // 3572
A=A-1 // 3573
M=D // 3574

////ReturnInstruction{}
@RETURN // 3575
0;JMP // 3576

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 3577
0;JMP // 3578

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3579
0;JMP // 3580

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3581
AM=M+1 // 3582
A=A-1 // 3583
M=0 // 3584

////ReturnInstruction{}
@RETURN // 3585
0;JMP // 3586

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
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
//)}
@ARG // 3587
A=M // 3588
D=M // 3589
@SP // 3590
AM=M+1 // 3591
A=A-1 // 3592
M=D // 3593
@ARG // 3594
A=M // 3595
D=M // 3596
@0 // 3597
A=D+A // 3598
D=M // 3599
@4 // 3600
D=D+A // 3601
@SP // 3602
AM=M-1 // 3603
D=D+M // 3604
@SP // 3605
AM=M+1 // 3606
A=A-1 // 3607
M=D // 3608
@ARG // 3609
A=M // 3610
D=M // 3611
@SP // 3612
AM=M-1 // 3613
A=M // 3614
M=D // 3615

////PushInstruction("constant 0")
@SP // 3616
AM=M+1 // 3617
A=A-1 // 3618
M=0 // 3619

////ReturnInstruction{}
@RETURN // 3620
0;JMP // 3621

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3622
M=M+1 // 3623
AM=M+1 // 3624
A=A-1 // 3625
M=0 // 3626
A=A-1 // 3627
M=0 // 3628

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3629
A=M+1 // 3630
D=M // 3631
@2 // 3632
D=D+A // 3633
@SP // 3634
AM=M+1 // 3635
A=A-1 // 3636
M=D // 3637
D=0 // 3638
@SP // 3639
AM=M-1 // 3640
A=M // 3641
M=D // 3642

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3643
A=M+1 // 3644
D=M // 3645
@3 // 3646
D=D+A // 3647
@SP // 3648
AM=M+1 // 3649
A=A-1 // 3650
M=D // 3651
D=0 // 3652
@SP // 3653
AM=M-1 // 3654
A=M // 3655
M=D // 3656

////ConditionalGroup{push=BinaryPushGroup(
//    left:
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
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse1}}
@Memory.add_node.EQ.32 // 3657
D=A // 3658
@SP // 3659
AM=M+1 // 3660
A=A-1 // 3661
M=D // 3662
@ARG // 3663
A=M // 3664
D=M // 3665
@0 // 3666
A=D+A // 3667
D=M // 3668
@DO_EQ // 3669
0;JMP // 3670
(Memory.add_node.EQ.32)
@Memory.add_node.IfElse1 // 3671
D;JEQ // 3672

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3673
A=M // 3674
D=M // 3675
@SP // 3676
AM=M+1 // 3677
A=A-1 // 3678
M=D // 3679
@ARG // 3680
A=M+1 // 3681
D=M // 3682
@SP // 3683
AM=M-1 // 3684
A=M // 3685
M=D // 3686

////PushInstruction("constant 0")
@SP // 3687
AM=M+1 // 3688
A=A-1 // 3689
M=0 // 3690

////ReturnInstruction{}
@RETURN // 3691
0;JMP // 3692

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 3693
0;JMP // 3694

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////PushPopPair {
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
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3695
A=M // 3696
D=M // 3697
@0 // 3698
A=D+A // 3699
D=M // 3700
@LCL // 3701
A=M // 3702
M=D // 3703

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3704
A=M+1 // 3705
M=0 // 3706

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
@Memory.add_node.EQ.33 // 3707
D=A // 3708
@SP // 3709
AM=M+1 // 3710
A=A-1 // 3711
M=D // 3712
@Memory.add_node.EQ.34 // 3713
D=A // 3714
@SP // 3715
AM=M+1 // 3716
A=A-1 // 3717
M=D // 3718
@LCL // 3719
A=M // 3720
D=M // 3721
@DO_EQ // 3722
0;JMP // 3723
(Memory.add_node.EQ.34)
@SP // 3724
AM=M+1 // 3725
A=A-1 // 3726
M=D // 3727
@SP // 3728
A=M-1 // 3729
M=!D // 3730
@Memory.add_node.GT.35 // 3731
D=A // 3732
@SP // 3733
AM=M+1 // 3734
A=A-1 // 3735
M=D // 3736
@LCL // 3737
A=M // 3738
D=M // 3739
@0 // 3740
A=D+A // 3741
D=M // 3742
@SP // 3743
AM=M+1 // 3744
A=A-1 // 3745
M=D // 3746
@ARG // 3747
A=M+1 // 3748
D=M // 3749
@0 // 3750
A=D+A // 3751
D=M // 3752
@SP // 3753
AM=M-1 // 3754
D=M-D // 3755
@DO_GT // 3756
0;JMP // 3757
(Memory.add_node.GT.35)
D=!D // 3758
@SP // 3759
AM=M-1 // 3760
D=D&M // 3761
@DO_EQ // 3762
0;JMP // 3763
(Memory.add_node.EQ.33)
@WHILE_END_Memory.add_node1 // 3764
D;JNE // 3765

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3766
A=M // 3767
D=M // 3768
@LCL // 3769
A=M+1 // 3770
M=D // 3771

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3772
A=M // 3773
D=M // 3774
@3 // 3775
A=D+A // 3776
D=M // 3777
@LCL // 3778
A=M // 3779
M=D // 3780

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 3781
0;JMP // 3782

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
@Memory.add_node.EQ.36 // 3783
D=A // 3784
@SP // 3785
AM=M+1 // 3786
A=A-1 // 3787
M=D // 3788
@LCL // 3789
A=M+1 // 3790
D=!M // 3791
@DO_EQ // 3792
0;JMP // 3793
(Memory.add_node.EQ.36)
@Memory.add_node.IfElse2 // 3794
D;JNE // 3795

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3796
A=M+1 // 3797
D=M // 3798
@3 // 3799
D=D+A // 3800
@SP // 3801
AM=M+1 // 3802
A=A-1 // 3803
M=D // 3804
@ARG // 3805
A=M // 3806
D=M // 3807
@0 // 3808
A=D+A // 3809
D=M // 3810
@SP // 3811
AM=M-1 // 3812
A=M // 3813
M=D // 3814

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
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
//)}
@ARG // 3815
A=M // 3816
D=M // 3817
@0 // 3818
D=D+A // 3819
@2 // 3820
D=D+A // 3821
@SP // 3822
AM=M+1 // 3823
A=A-1 // 3824
M=D // 3825
@ARG // 3826
A=M+1 // 3827
D=M // 3828
@SP // 3829
AM=M-1 // 3830
A=M // 3831
M=D // 3832

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3833
A=M // 3834
D=M // 3835
@SP // 3836
AM=M+1 // 3837
A=A-1 // 3838
M=D // 3839
@ARG // 3840
A=M+1 // 3841
D=M // 3842
@SP // 3843
AM=M-1 // 3844
A=M // 3845
M=D // 3846

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 3847
0;JMP // 3848

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3849
A=M+1 // 3850
D=M // 3851
@3 // 3852
D=D+A // 3853
@SP // 3854
AM=M+1 // 3855
A=A-1 // 3856
M=D // 3857
@LCL // 3858
A=M // 3859
D=M // 3860
@SP // 3861
AM=M-1 // 3862
A=M // 3863
M=D // 3864

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3865
A=M+1 // 3866
D=M // 3867
@2 // 3868
D=D+A // 3869
@SP // 3870
AM=M+1 // 3871
A=A-1 // 3872
M=D // 3873
@LCL // 3874
A=M+1 // 3875
D=M // 3876
@SP // 3877
AM=M-1 // 3878
A=M // 3879
M=D // 3880

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.37 // 3881
D=A // 3882
@SP // 3883
AM=M+1 // 3884
A=A-1 // 3885
M=D // 3886
@LCL // 3887
A=M // 3888
D=M // 3889
@DO_EQ // 3890
0;JMP // 3891
(Memory.add_node.EQ.37)
@Memory.add_node.IfElse3 // 3892
D;JNE // 3893

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 3894
A=M // 3895
D=M // 3896
@2 // 3897
D=D+A // 3898
@SP // 3899
AM=M+1 // 3900
A=A-1 // 3901
M=D // 3902
@ARG // 3903
A=M+1 // 3904
D=M // 3905
@SP // 3906
AM=M-1 // 3907
A=M // 3908
M=D // 3909

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 3910
0;JMP // 3911

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 3912
A=M+1 // 3913
D=M // 3914
@3 // 3915
D=D+A // 3916
@SP // 3917
AM=M+1 // 3918
A=A-1 // 3919
M=D // 3920
@ARG // 3921
A=M+1 // 3922
D=M // 3923
@SP // 3924
AM=M-1 // 3925
A=M // 3926
M=D // 3927

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 3928
AM=M+1 // 3929
A=A-1 // 3930
M=0 // 3931

////ReturnInstruction{}
@RETURN // 3932
0;JMP // 3933

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3934
A=M // 3935
D=M // 3936
@SP // 3937
AM=M+1 // 3938
A=A-1 // 3939
M=D // 3940
@ARG // 3941
A=M+1 // 3942
D=M // 3943
@SP // 3944
AM=M-1 // 3945
A=M // 3946
M=D // 3947

////PushInstruction("constant 0")
@SP // 3948
AM=M+1 // 3949
A=A-1 // 3950
M=0 // 3951

////ReturnInstruction{}
@RETURN // 3952
0;JMP // 3953

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
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
@ARG // 3954
A=M // 3955
D=M // 3956
@0 // 3957
A=D+A // 3958
D=M // 3959
@SP // 3960
AM=M+1 // 3961
A=A-1 // 3962
M=D // 3963

////ReturnInstruction{}
@RETURN // 3964
0;JMP // 3965

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 3966
D=A // 3967
@14 // 3968
M=D // 3969
@Output.initMap // 3970
D=A // 3971
@13 // 3972
M=D // 3973
@Output.init.ret.0 // 3974
D=A // 3975
@CALL // 3976
0;JMP // 3977
(Output.init.ret.0)
@SP // 3978
M=M-1 // 3979

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 3980
M=0 // 3981

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 3982
M=0 // 3983

////PushInstruction("constant 0")
@SP // 3984
AM=M+1 // 3985
A=A-1 // 3986
M=0 // 3987

////ReturnInstruction{}
@RETURN // 3988
0;JMP // 3989

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 3990
AM=M+1 // 3991
A=A-1 // 3992
M=0 // 3993

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 3994
D=A // 3995
@SP // 3996
AM=M+1 // 3997
A=A-1 // 3998
M=D // 3999
// call Array.new
@6 // 4000
D=A // 4001
@14 // 4002
M=D // 4003
@Array.new // 4004
D=A // 4005
@13 // 4006
M=D // 4007
@Output.initMap.ret.0 // 4008
D=A // 4009
@CALL // 4010
0;JMP // 4011
(Output.initMap.ret.0)
@SP // 4012
AM=M-1 // 4013
D=M // 4014
@Output.0 // 4015
M=D // 4016

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4017
D=A // 4018
@SP // 4019
M=D+M // 4020
@63 // 4021
D=A // 4022
@SP // 4023
A=M-1 // 4024
M=0 // 4025
A=A-1 // 4026
M=0 // 4027
A=A-1 // 4028
M=D // 4029
A=A-1 // 4030
M=D // 4031
A=A-1 // 4032
M=D // 4033
A=A-1 // 4034
M=D // 4035
A=A-1 // 4036
M=D // 4037
A=A-1 // 4038
M=D // 4039
A=A-1 // 4040
M=D // 4041
A=A-1 // 4042
M=D // 4043
A=A-1 // 4044
M=D // 4045
A=A-1 // 4046
M=0 // 4047
// call Output.create
@17 // 4048
D=A // 4049
@14 // 4050
M=D // 4051
@Output.create // 4052
D=A // 4053
@13 // 4054
M=D // 4055
@Output.initMap.ret.1 // 4056
D=A // 4057
@CALL // 4058
0;JMP // 4059
(Output.initMap.ret.1)
@SP // 4060
M=M-1 // 4061

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4062
D=A // 4063
@SP // 4064
M=D+M // 4065
@32 // 4066
D=A // 4067
@SP // 4068
A=M-1 // 4069
M=0 // 4070
A=A-1 // 4071
M=0 // 4072
A=A-1 // 4073
M=0 // 4074
A=A-1 // 4075
M=0 // 4076
A=A-1 // 4077
M=0 // 4078
A=A-1 // 4079
M=0 // 4080
A=A-1 // 4081
M=0 // 4082
A=A-1 // 4083
M=0 // 4084
A=A-1 // 4085
M=0 // 4086
A=A-1 // 4087
M=0 // 4088
A=A-1 // 4089
M=0 // 4090
A=A-1 // 4091
M=D // 4092
A=A-1 // 4093
// call Output.create
@17 // 4094
D=A // 4095
@14 // 4096
M=D // 4097
@Output.create // 4098
D=A // 4099
@13 // 4100
M=D // 4101
@Output.initMap.ret.2 // 4102
D=A // 4103
@CALL // 4104
0;JMP // 4105
(Output.initMap.ret.2)
@SP // 4106
M=M-1 // 4107

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4108
D=A // 4109
@SP // 4110
AM=M+1 // 4111
A=A-1 // 4112
M=D // 4113
@12 // 4114
D=A // 4115
@SP // 4116
AM=M+1 // 4117
A=A-1 // 4118
M=D // 4119
@30 // 4120
D=A // 4121
@SP // 4122
AM=M+1 // 4123
A=A-1 // 4124
M=D // 4125
@30 // 4126
D=A // 4127
@SP // 4128
AM=M+1 // 4129
A=A-1 // 4130
M=D // 4131
@30 // 4132
D=A // 4133
@SP // 4134
AM=M+1 // 4135
A=A-1 // 4136
M=D // 4137
@12 // 4138
D=A // 4139
@SP // 4140
AM=M+1 // 4141
A=A-1 // 4142
M=D // 4143
@12 // 4144
D=A // 4145
@SP // 4146
AM=M+1 // 4147
A=A-1 // 4148
M=D // 4149
@SP // 4150
AM=M+1 // 4151
A=A-1 // 4152
M=0 // 4153
@4 // 4154
D=A // 4155
@SP // 4156
M=D+M // 4157
@12 // 4158
D=A // 4159
@SP // 4160
A=M-1 // 4161
M=0 // 4162
A=A-1 // 4163
M=0 // 4164
A=A-1 // 4165
M=D // 4166
A=A-1 // 4167
M=D // 4168
A=A-1 // 4169
// call Output.create
@17 // 4170
D=A // 4171
@14 // 4172
M=D // 4173
@Output.create // 4174
D=A // 4175
@13 // 4176
M=D // 4177
@Output.initMap.ret.3 // 4178
D=A // 4179
@CALL // 4180
0;JMP // 4181
(Output.initMap.ret.3)
@SP // 4182
M=M-1 // 4183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4184
D=A // 4185
@SP // 4186
AM=M+1 // 4187
A=A-1 // 4188
M=D // 4189
@54 // 4190
D=A // 4191
@SP // 4192
AM=M+1 // 4193
A=A-1 // 4194
M=D // 4195
@54 // 4196
D=A // 4197
@SP // 4198
AM=M+1 // 4199
A=A-1 // 4200
M=D // 4201
@20 // 4202
D=A // 4203
@SP // 4204
AM=M+1 // 4205
A=A-1 // 4206
M=D // 4207
@SP // 4208
AM=M+1 // 4209
A=A-1 // 4210
M=0 // 4211
@SP // 4212
AM=M+1 // 4213
A=A-1 // 4214
M=0 // 4215
@SP // 4216
AM=M+1 // 4217
A=A-1 // 4218
M=0 // 4219
@SP // 4220
AM=M+1 // 4221
A=A-1 // 4222
M=0 // 4223
@SP // 4224
AM=M+1 // 4225
A=A-1 // 4226
M=0 // 4227
@SP // 4228
AM=M+1 // 4229
A=A-1 // 4230
M=0 // 4231
@SP // 4232
AM=M+1 // 4233
A=A-1 // 4234
M=0 // 4235
@SP // 4236
AM=M+1 // 4237
A=A-1 // 4238
M=0 // 4239
// call Output.create
@17 // 4240
D=A // 4241
@14 // 4242
M=D // 4243
@Output.create // 4244
D=A // 4245
@13 // 4246
M=D // 4247
@Output.initMap.ret.4 // 4248
D=A // 4249
@CALL // 4250
0;JMP // 4251
(Output.initMap.ret.4)
@SP // 4252
M=M-1 // 4253

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4254
D=A // 4255
@SP // 4256
M=D+M // 4257
@35 // 4258
D=A // 4259
@SP // 4260
A=M-1 // 4261
M=0 // 4262
A=A-1 // 4263
M=D // 4264
A=A-1 // 4265
@18 // 4266
D=A // 4267
@SP // 4268
AM=M+1 // 4269
A=A-1 // 4270
M=D // 4271
@18 // 4272
D=A // 4273
@SP // 4274
AM=M+1 // 4275
A=A-1 // 4276
M=D // 4277
@63 // 4278
D=A // 4279
@SP // 4280
AM=M+1 // 4281
A=A-1 // 4282
M=D // 4283
@18 // 4284
D=A // 4285
@SP // 4286
AM=M+1 // 4287
A=A-1 // 4288
M=D // 4289
@18 // 4290
D=A // 4291
@SP // 4292
AM=M+1 // 4293
A=A-1 // 4294
M=D // 4295
@63 // 4296
D=A // 4297
@SP // 4298
AM=M+1 // 4299
A=A-1 // 4300
M=D // 4301
@18 // 4302
D=A // 4303
@SP // 4304
AM=M+1 // 4305
A=A-1 // 4306
M=D // 4307
@18 // 4308
D=A // 4309
@SP // 4310
AM=M+1 // 4311
A=A-1 // 4312
M=D // 4313
@SP // 4314
AM=M+1 // 4315
A=A-1 // 4316
M=0 // 4317
@SP // 4318
AM=M+1 // 4319
A=A-1 // 4320
M=0 // 4321
// call Output.create
@17 // 4322
D=A // 4323
@14 // 4324
M=D // 4325
@Output.create // 4326
D=A // 4327
@13 // 4328
M=D // 4329
@Output.initMap.ret.5 // 4330
D=A // 4331
@CALL // 4332
0;JMP // 4333
(Output.initMap.ret.5)
@SP // 4334
M=M-1 // 4335

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4336
D=A // 4337
@SP // 4338
AM=M+1 // 4339
A=A-1 // 4340
M=D // 4341
@12 // 4342
D=A // 4343
@SP // 4344
AM=M+1 // 4345
A=A-1 // 4346
M=D // 4347
@30 // 4348
D=A // 4349
@SP // 4350
AM=M+1 // 4351
A=A-1 // 4352
M=D // 4353
@51 // 4354
D=A // 4355
@SP // 4356
AM=M+1 // 4357
A=A-1 // 4358
M=D // 4359
@3 // 4360
D=A // 4361
@SP // 4362
AM=M+1 // 4363
A=A-1 // 4364
M=D // 4365
@30 // 4366
D=A // 4367
@SP // 4368
AM=M+1 // 4369
A=A-1 // 4370
M=D // 4371
@48 // 4372
D=A // 4373
@SP // 4374
AM=M+1 // 4375
A=A-1 // 4376
M=D // 4377
@51 // 4378
D=A // 4379
@SP // 4380
AM=M+1 // 4381
A=A-1 // 4382
M=D // 4383
@30 // 4384
D=A // 4385
@SP // 4386
AM=M+1 // 4387
A=A-1 // 4388
M=D // 4389
@12 // 4390
D=A // 4391
@SP // 4392
AM=M+1 // 4393
A=A-1 // 4394
M=D // 4395
@12 // 4396
D=A // 4397
@SP // 4398
AM=M+1 // 4399
A=A-1 // 4400
M=D // 4401
@SP // 4402
AM=M+1 // 4403
A=A-1 // 4404
M=0 // 4405
// call Output.create
@17 // 4406
D=A // 4407
@14 // 4408
M=D // 4409
@Output.create // 4410
D=A // 4411
@13 // 4412
M=D // 4413
@Output.initMap.ret.6 // 4414
D=A // 4415
@CALL // 4416
0;JMP // 4417
(Output.initMap.ret.6)
@SP // 4418
M=M-1 // 4419

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4420
D=A // 4421
@SP // 4422
M=D+M // 4423
@37 // 4424
D=A // 4425
@SP // 4426
A=M-1 // 4427
M=0 // 4428
A=A-1 // 4429
M=0 // 4430
A=A-1 // 4431
M=D // 4432
A=A-1 // 4433
@35 // 4434
D=A // 4435
@SP // 4436
AM=M+1 // 4437
A=A-1 // 4438
M=D // 4439
@51 // 4440
D=A // 4441
@SP // 4442
AM=M+1 // 4443
A=A-1 // 4444
M=D // 4445
@24 // 4446
D=A // 4447
@SP // 4448
AM=M+1 // 4449
A=A-1 // 4450
M=D // 4451
@12 // 4452
D=A // 4453
@SP // 4454
AM=M+1 // 4455
A=A-1 // 4456
M=D // 4457
@6 // 4458
D=A // 4459
@SP // 4460
AM=M+1 // 4461
A=A-1 // 4462
M=D // 4463
@51 // 4464
D=A // 4465
@SP // 4466
AM=M+1 // 4467
A=A-1 // 4468
M=D // 4469
@49 // 4470
D=A // 4471
@SP // 4472
AM=M+1 // 4473
A=A-1 // 4474
M=D // 4475
@SP // 4476
AM=M+1 // 4477
A=A-1 // 4478
M=0 // 4479
@SP // 4480
AM=M+1 // 4481
A=A-1 // 4482
M=0 // 4483
// call Output.create
@17 // 4484
D=A // 4485
@14 // 4486
M=D // 4487
@Output.create // 4488
D=A // 4489
@13 // 4490
M=D // 4491
@Output.initMap.ret.7 // 4492
D=A // 4493
@CALL // 4494
0;JMP // 4495
(Output.initMap.ret.7)
@SP // 4496
M=M-1 // 4497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4498
D=A // 4499
@SP // 4500
AM=M+1 // 4501
A=A-1 // 4502
M=D // 4503
@12 // 4504
D=A // 4505
@SP // 4506
AM=M+1 // 4507
A=A-1 // 4508
M=D // 4509
@30 // 4510
D=A // 4511
@SP // 4512
AM=M+1 // 4513
A=A-1 // 4514
M=D // 4515
@30 // 4516
D=A // 4517
@SP // 4518
AM=M+1 // 4519
A=A-1 // 4520
M=D // 4521
@12 // 4522
D=A // 4523
@SP // 4524
AM=M+1 // 4525
A=A-1 // 4526
M=D // 4527
@54 // 4528
D=A // 4529
@SP // 4530
AM=M+1 // 4531
A=A-1 // 4532
M=D // 4533
@27 // 4534
D=A // 4535
@SP // 4536
AM=M+1 // 4537
A=A-1 // 4538
M=D // 4539
@27 // 4540
D=A // 4541
@SP // 4542
AM=M+1 // 4543
A=A-1 // 4544
M=D // 4545
@27 // 4546
D=A // 4547
@SP // 4548
AM=M+1 // 4549
A=A-1 // 4550
M=D // 4551
@54 // 4552
D=A // 4553
@SP // 4554
AM=M+1 // 4555
A=A-1 // 4556
M=D // 4557
@SP // 4558
AM=M+1 // 4559
A=A-1 // 4560
M=0 // 4561
@SP // 4562
AM=M+1 // 4563
A=A-1 // 4564
M=0 // 4565
// call Output.create
@17 // 4566
D=A // 4567
@14 // 4568
M=D // 4569
@Output.create // 4570
D=A // 4571
@13 // 4572
M=D // 4573
@Output.initMap.ret.8 // 4574
D=A // 4575
@CALL // 4576
0;JMP // 4577
(Output.initMap.ret.8)
@SP // 4578
M=M-1 // 4579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4580
D=A // 4581
@SP // 4582
AM=M+1 // 4583
A=A-1 // 4584
M=D // 4585
@12 // 4586
D=A // 4587
@SP // 4588
AM=M+1 // 4589
A=A-1 // 4590
M=D // 4591
@12 // 4592
D=A // 4593
@SP // 4594
AM=M+1 // 4595
A=A-1 // 4596
M=D // 4597
@6 // 4598
D=A // 4599
@SP // 4600
AM=M+1 // 4601
A=A-1 // 4602
M=D // 4603
@SP // 4604
AM=M+1 // 4605
A=A-1 // 4606
M=0 // 4607
@SP // 4608
AM=M+1 // 4609
A=A-1 // 4610
M=0 // 4611
@SP // 4612
AM=M+1 // 4613
A=A-1 // 4614
M=0 // 4615
@SP // 4616
AM=M+1 // 4617
A=A-1 // 4618
M=0 // 4619
@SP // 4620
AM=M+1 // 4621
A=A-1 // 4622
M=0 // 4623
@SP // 4624
AM=M+1 // 4625
A=A-1 // 4626
M=0 // 4627
@SP // 4628
AM=M+1 // 4629
A=A-1 // 4630
M=0 // 4631
@SP // 4632
AM=M+1 // 4633
A=A-1 // 4634
M=0 // 4635
// call Output.create
@17 // 4636
D=A // 4637
@14 // 4638
M=D // 4639
@Output.create // 4640
D=A // 4641
@13 // 4642
M=D // 4643
@Output.initMap.ret.9 // 4644
D=A // 4645
@CALL // 4646
0;JMP // 4647
(Output.initMap.ret.9)
@SP // 4648
M=M-1 // 4649

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4650
D=A // 4651
@SP // 4652
AM=M+1 // 4653
A=A-1 // 4654
M=D // 4655
@24 // 4656
D=A // 4657
@SP // 4658
AM=M+1 // 4659
A=A-1 // 4660
M=D // 4661
@12 // 4662
D=A // 4663
@SP // 4664
AM=M+1 // 4665
A=A-1 // 4666
M=D // 4667
@6 // 4668
D=A // 4669
@SP // 4670
AM=M+1 // 4671
A=A-1 // 4672
M=D // 4673
@6 // 4674
D=A // 4675
@SP // 4676
AM=M+1 // 4677
A=A-1 // 4678
M=D // 4679
@6 // 4680
D=A // 4681
@SP // 4682
AM=M+1 // 4683
A=A-1 // 4684
M=D // 4685
@6 // 4686
D=A // 4687
@SP // 4688
AM=M+1 // 4689
A=A-1 // 4690
M=D // 4691
@6 // 4692
D=A // 4693
@SP // 4694
AM=M+1 // 4695
A=A-1 // 4696
M=D // 4697
@12 // 4698
D=A // 4699
@SP // 4700
AM=M+1 // 4701
A=A-1 // 4702
M=D // 4703
@24 // 4704
D=A // 4705
@SP // 4706
AM=M+1 // 4707
A=A-1 // 4708
M=D // 4709
@SP // 4710
AM=M+1 // 4711
A=A-1 // 4712
M=0 // 4713
@SP // 4714
AM=M+1 // 4715
A=A-1 // 4716
M=0 // 4717
// call Output.create
@17 // 4718
D=A // 4719
@14 // 4720
M=D // 4721
@Output.create // 4722
D=A // 4723
@13 // 4724
M=D // 4725
@Output.initMap.ret.10 // 4726
D=A // 4727
@CALL // 4728
0;JMP // 4729
(Output.initMap.ret.10)
@SP // 4730
M=M-1 // 4731

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4732
D=A // 4733
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=D // 4737
@6 // 4738
D=A // 4739
@SP // 4740
AM=M+1 // 4741
A=A-1 // 4742
M=D // 4743
@12 // 4744
D=A // 4745
@SP // 4746
AM=M+1 // 4747
A=A-1 // 4748
M=D // 4749
@24 // 4750
D=A // 4751
@SP // 4752
AM=M+1 // 4753
A=A-1 // 4754
M=D // 4755
@24 // 4756
D=A // 4757
@SP // 4758
AM=M+1 // 4759
A=A-1 // 4760
M=D // 4761
@24 // 4762
D=A // 4763
@SP // 4764
AM=M+1 // 4765
A=A-1 // 4766
M=D // 4767
@24 // 4768
D=A // 4769
@SP // 4770
AM=M+1 // 4771
A=A-1 // 4772
M=D // 4773
@24 // 4774
D=A // 4775
@SP // 4776
AM=M+1 // 4777
A=A-1 // 4778
M=D // 4779
@12 // 4780
D=A // 4781
@SP // 4782
AM=M+1 // 4783
A=A-1 // 4784
M=D // 4785
@6 // 4786
D=A // 4787
@SP // 4788
AM=M+1 // 4789
A=A-1 // 4790
M=D // 4791
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=0 // 4795
@SP // 4796
AM=M+1 // 4797
A=A-1 // 4798
M=0 // 4799
// call Output.create
@17 // 4800
D=A // 4801
@14 // 4802
M=D // 4803
@Output.create // 4804
D=A // 4805
@13 // 4806
M=D // 4807
@Output.initMap.ret.11 // 4808
D=A // 4809
@CALL // 4810
0;JMP // 4811
(Output.initMap.ret.11)
@SP // 4812
M=M-1 // 4813

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4814
D=A // 4815
@SP // 4816
M=D+M // 4817
@42 // 4818
D=A // 4819
@SP // 4820
A=M-1 // 4821
M=0 // 4822
A=A-1 // 4823
M=0 // 4824
A=A-1 // 4825
M=0 // 4826
A=A-1 // 4827
M=D // 4828
A=A-1 // 4829
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
@63 // 4842
D=A // 4843
@SP // 4844
AM=M+1 // 4845
A=A-1 // 4846
M=D // 4847
@30 // 4848
D=A // 4849
@SP // 4850
AM=M+1 // 4851
A=A-1 // 4852
M=D // 4853
@51 // 4854
D=A // 4855
@SP // 4856
AM=M+1 // 4857
A=A-1 // 4858
M=D // 4859
@SP // 4860
AM=M+1 // 4861
A=A-1 // 4862
M=0 // 4863
@SP // 4864
AM=M+1 // 4865
A=A-1 // 4866
M=0 // 4867
@SP // 4868
AM=M+1 // 4869
A=A-1 // 4870
M=0 // 4871
// call Output.create
@17 // 4872
D=A // 4873
@14 // 4874
M=D // 4875
@Output.create // 4876
D=A // 4877
@13 // 4878
M=D // 4879
@Output.initMap.ret.12 // 4880
D=A // 4881
@CALL // 4882
0;JMP // 4883
(Output.initMap.ret.12)
@SP // 4884
M=M-1 // 4885

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4886
D=A // 4887
@SP // 4888
M=D+M // 4889
@43 // 4890
D=A // 4891
@SP // 4892
A=M-1 // 4893
M=0 // 4894
A=A-1 // 4895
M=0 // 4896
A=A-1 // 4897
M=0 // 4898
A=A-1 // 4899
M=D // 4900
A=A-1 // 4901
@12 // 4902
D=A // 4903
@SP // 4904
AM=M+1 // 4905
A=A-1 // 4906
M=D // 4907
@12 // 4908
D=A // 4909
@SP // 4910
AM=M+1 // 4911
A=A-1 // 4912
M=D // 4913
@63 // 4914
D=A // 4915
@SP // 4916
AM=M+1 // 4917
A=A-1 // 4918
M=D // 4919
@12 // 4920
D=A // 4921
@SP // 4922
AM=M+1 // 4923
A=A-1 // 4924
M=D // 4925
@12 // 4926
D=A // 4927
@SP // 4928
AM=M+1 // 4929
A=A-1 // 4930
M=D // 4931
@SP // 4932
AM=M+1 // 4933
A=A-1 // 4934
M=0 // 4935
@SP // 4936
AM=M+1 // 4937
A=A-1 // 4938
M=0 // 4939
@SP // 4940
AM=M+1 // 4941
A=A-1 // 4942
M=0 // 4943
// call Output.create
@17 // 4944
D=A // 4945
@14 // 4946
M=D // 4947
@Output.create // 4948
D=A // 4949
@13 // 4950
M=D // 4951
@Output.initMap.ret.13 // 4952
D=A // 4953
@CALL // 4954
0;JMP // 4955
(Output.initMap.ret.13)
@SP // 4956
M=M-1 // 4957

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 4958
D=A // 4959
@SP // 4960
M=D+M // 4961
@44 // 4962
D=A // 4963
@SP // 4964
A=M-1 // 4965
M=0 // 4966
A=A-1 // 4967
M=0 // 4968
A=A-1 // 4969
M=0 // 4970
A=A-1 // 4971
M=0 // 4972
A=A-1 // 4973
M=0 // 4974
A=A-1 // 4975
M=0 // 4976
A=A-1 // 4977
M=0 // 4978
A=A-1 // 4979
M=D // 4980
A=A-1 // 4981
@12 // 4982
D=A // 4983
@SP // 4984
AM=M+1 // 4985
A=A-1 // 4986
M=D // 4987
@12 // 4988
D=A // 4989
@SP // 4990
AM=M+1 // 4991
A=A-1 // 4992
M=D // 4993
@6 // 4994
D=A // 4995
@SP // 4996
AM=M+1 // 4997
A=A-1 // 4998
M=D // 4999
@SP // 5000
AM=M+1 // 5001
A=A-1 // 5002
M=0 // 5003
// call Output.create
@17 // 5004
D=A // 5005
@14 // 5006
M=D // 5007
@Output.create // 5008
D=A // 5009
@13 // 5010
M=D // 5011
@Output.initMap.ret.14 // 5012
D=A // 5013
@CALL // 5014
0;JMP // 5015
(Output.initMap.ret.14)
@SP // 5016
M=M-1 // 5017

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5018
D=A // 5019
@SP // 5020
M=D+M // 5021
@45 // 5022
D=A // 5023
@SP // 5024
A=M-1 // 5025
M=0 // 5026
A=A-1 // 5027
M=0 // 5028
A=A-1 // 5029
M=0 // 5030
A=A-1 // 5031
M=0 // 5032
A=A-1 // 5033
M=0 // 5034
A=A-1 // 5035
M=D // 5036
A=A-1 // 5037
@6 // 5038
D=A // 5039
@SP // 5040
M=D+M // 5041
@63 // 5042
D=A // 5043
@SP // 5044
A=M-1 // 5045
M=0 // 5046
A=A-1 // 5047
M=0 // 5048
A=A-1 // 5049
M=0 // 5050
A=A-1 // 5051
M=0 // 5052
A=A-1 // 5053
M=0 // 5054
A=A-1 // 5055
M=D // 5056
A=A-1 // 5057
// call Output.create
@17 // 5058
D=A // 5059
@14 // 5060
M=D // 5061
@Output.create // 5062
D=A // 5063
@13 // 5064
M=D // 5065
@Output.initMap.ret.15 // 5066
D=A // 5067
@CALL // 5068
0;JMP // 5069
(Output.initMap.ret.15)
@SP // 5070
M=M-1 // 5071

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5072
D=A // 5073
@SP // 5074
M=D+M // 5075
@46 // 5076
D=A // 5077
@SP // 5078
A=M-1 // 5079
M=0 // 5080
A=A-1 // 5081
M=0 // 5082
A=A-1 // 5083
M=0 // 5084
A=A-1 // 5085
M=0 // 5086
A=A-1 // 5087
M=0 // 5088
A=A-1 // 5089
M=0 // 5090
A=A-1 // 5091
M=0 // 5092
A=A-1 // 5093
M=D // 5094
A=A-1 // 5095
@4 // 5096
D=A // 5097
@SP // 5098
M=D+M // 5099
@12 // 5100
D=A // 5101
@SP // 5102
A=M-1 // 5103
M=0 // 5104
A=A-1 // 5105
M=0 // 5106
A=A-1 // 5107
M=D // 5108
A=A-1 // 5109
M=D // 5110
A=A-1 // 5111
// call Output.create
@17 // 5112
D=A // 5113
@14 // 5114
M=D // 5115
@Output.create // 5116
D=A // 5117
@13 // 5118
M=D // 5119
@Output.initMap.ret.16 // 5120
D=A // 5121
@CALL // 5122
0;JMP // 5123
(Output.initMap.ret.16)
@SP // 5124
M=M-1 // 5125

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5126
D=A // 5127
@SP // 5128
M=D+M // 5129
@47 // 5130
D=A // 5131
@SP // 5132
A=M-1 // 5133
M=0 // 5134
A=A-1 // 5135
M=0 // 5136
A=A-1 // 5137
M=D // 5138
A=A-1 // 5139
@32 // 5140
D=A // 5141
@SP // 5142
AM=M+1 // 5143
A=A-1 // 5144
M=D // 5145
@48 // 5146
D=A // 5147
@SP // 5148
AM=M+1 // 5149
A=A-1 // 5150
M=D // 5151
@24 // 5152
D=A // 5153
@SP // 5154
AM=M+1 // 5155
A=A-1 // 5156
M=D // 5157
@12 // 5158
D=A // 5159
@SP // 5160
AM=M+1 // 5161
A=A-1 // 5162
M=D // 5163
@6 // 5164
D=A // 5165
@SP // 5166
AM=M+1 // 5167
A=A-1 // 5168
M=D // 5169
@3 // 5170
D=A // 5171
@SP // 5172
AM=M+1 // 5173
A=A-1 // 5174
M=D // 5175
@SP // 5176
AM=M+1 // 5177
A=A-1 // 5178
M=1 // 5179
@SP // 5180
AM=M+1 // 5181
A=A-1 // 5182
M=0 // 5183
@SP // 5184
AM=M+1 // 5185
A=A-1 // 5186
M=0 // 5187
// call Output.create
@17 // 5188
D=A // 5189
@14 // 5190
M=D // 5191
@Output.create // 5192
D=A // 5193
@13 // 5194
M=D // 5195
@Output.initMap.ret.17 // 5196
D=A // 5197
@CALL // 5198
0;JMP // 5199
(Output.initMap.ret.17)
@SP // 5200
M=M-1 // 5201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5202
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
@51 // 5220
D=A // 5221
@SP // 5222
AM=M+1 // 5223
A=A-1 // 5224
M=D // 5225
@51 // 5226
D=A // 5227
@SP // 5228
AM=M+1 // 5229
A=A-1 // 5230
M=D // 5231
@51 // 5232
D=A // 5233
@SP // 5234
AM=M+1 // 5235
A=A-1 // 5236
M=D // 5237
@51 // 5238
D=A // 5239
@SP // 5240
AM=M+1 // 5241
A=A-1 // 5242
M=D // 5243
@51 // 5244
D=A // 5245
@SP // 5246
AM=M+1 // 5247
A=A-1 // 5248
M=D // 5249
@30 // 5250
D=A // 5251
@SP // 5252
AM=M+1 // 5253
A=A-1 // 5254
M=D // 5255
@12 // 5256
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
@Output.initMap.ret.18 // 5278
D=A // 5279
@CALL // 5280
0;JMP // 5281
(Output.initMap.ret.18)
@SP // 5282
M=M-1 // 5283

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5284
D=A // 5285
@SP // 5286
AM=M+1 // 5287
A=A-1 // 5288
M=D // 5289
@12 // 5290
D=A // 5291
@SP // 5292
AM=M+1 // 5293
A=A-1 // 5294
M=D // 5295
@14 // 5296
D=A // 5297
@SP // 5298
AM=M+1 // 5299
A=A-1 // 5300
M=D // 5301
@15 // 5302
D=A // 5303
@SP // 5304
AM=M+1 // 5305
A=A-1 // 5306
M=D // 5307
@12 // 5308
D=A // 5309
@SP // 5310
AM=M+1 // 5311
A=A-1 // 5312
M=D // 5313
@12 // 5314
D=A // 5315
@SP // 5316
AM=M+1 // 5317
A=A-1 // 5318
M=D // 5319
@12 // 5320
D=A // 5321
@SP // 5322
AM=M+1 // 5323
A=A-1 // 5324
M=D // 5325
@12 // 5326
D=A // 5327
@SP // 5328
AM=M+1 // 5329
A=A-1 // 5330
M=D // 5331
@12 // 5332
D=A // 5333
@SP // 5334
AM=M+1 // 5335
A=A-1 // 5336
M=D // 5337
@63 // 5338
D=A // 5339
@SP // 5340
AM=M+1 // 5341
A=A-1 // 5342
M=D // 5343
@SP // 5344
AM=M+1 // 5345
A=A-1 // 5346
M=0 // 5347
@SP // 5348
AM=M+1 // 5349
A=A-1 // 5350
M=0 // 5351
// call Output.create
@17 // 5352
D=A // 5353
@14 // 5354
M=D // 5355
@Output.create // 5356
D=A // 5357
@13 // 5358
M=D // 5359
@Output.initMap.ret.19 // 5360
D=A // 5361
@CALL // 5362
0;JMP // 5363
(Output.initMap.ret.19)
@SP // 5364
M=M-1 // 5365

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5366
D=A // 5367
@SP // 5368
AM=M+1 // 5369
A=A-1 // 5370
M=D // 5371
@30 // 5372
D=A // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377
@51 // 5378
D=A // 5379
@SP // 5380
AM=M+1 // 5381
A=A-1 // 5382
M=D // 5383
@48 // 5384
D=A // 5385
@SP // 5386
AM=M+1 // 5387
A=A-1 // 5388
M=D // 5389
@24 // 5390
D=A // 5391
@SP // 5392
AM=M+1 // 5393
A=A-1 // 5394
M=D // 5395
@12 // 5396
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
@3 // 5408
D=A // 5409
@SP // 5410
AM=M+1 // 5411
A=A-1 // 5412
M=D // 5413
@51 // 5414
D=A // 5415
@SP // 5416
AM=M+1 // 5417
A=A-1 // 5418
M=D // 5419
@63 // 5420
D=A // 5421
@SP // 5422
AM=M+1 // 5423
A=A-1 // 5424
M=D // 5425
@SP // 5426
AM=M+1 // 5427
A=A-1 // 5428
M=0 // 5429
@SP // 5430
AM=M+1 // 5431
A=A-1 // 5432
M=0 // 5433
// call Output.create
@17 // 5434
D=A // 5435
@14 // 5436
M=D // 5437
@Output.create // 5438
D=A // 5439
@13 // 5440
M=D // 5441
@Output.initMap.ret.20 // 5442
D=A // 5443
@CALL // 5444
0;JMP // 5445
(Output.initMap.ret.20)
@SP // 5446
M=M-1 // 5447

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5448
D=A // 5449
@SP // 5450
AM=M+1 // 5451
A=A-1 // 5452
M=D // 5453
@30 // 5454
D=A // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=D // 5459
@51 // 5460
D=A // 5461
@SP // 5462
AM=M+1 // 5463
A=A-1 // 5464
M=D // 5465
@48 // 5466
D=A // 5467
@SP // 5468
AM=M+1 // 5469
A=A-1 // 5470
M=D // 5471
@48 // 5472
D=A // 5473
@SP // 5474
AM=M+1 // 5475
A=A-1 // 5476
M=D // 5477
@28 // 5478
D=A // 5479
@SP // 5480
AM=M+1 // 5481
A=A-1 // 5482
M=D // 5483
@48 // 5484
D=A // 5485
@SP // 5486
AM=M+1 // 5487
A=A-1 // 5488
M=D // 5489
@48 // 5490
D=A // 5491
@SP // 5492
AM=M+1 // 5493
A=A-1 // 5494
M=D // 5495
@51 // 5496
D=A // 5497
@SP // 5498
AM=M+1 // 5499
A=A-1 // 5500
M=D // 5501
@30 // 5502
D=A // 5503
@SP // 5504
AM=M+1 // 5505
A=A-1 // 5506
M=D // 5507
@SP // 5508
AM=M+1 // 5509
A=A-1 // 5510
M=0 // 5511
@SP // 5512
AM=M+1 // 5513
A=A-1 // 5514
M=0 // 5515
// call Output.create
@17 // 5516
D=A // 5517
@14 // 5518
M=D // 5519
@Output.create // 5520
D=A // 5521
@13 // 5522
M=D // 5523
@Output.initMap.ret.21 // 5524
D=A // 5525
@CALL // 5526
0;JMP // 5527
(Output.initMap.ret.21)
@SP // 5528
M=M-1 // 5529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5530
D=A // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=D // 5535
@16 // 5536
D=A // 5537
@SP // 5538
AM=M+1 // 5539
A=A-1 // 5540
M=D // 5541
@24 // 5542
D=A // 5543
@SP // 5544
AM=M+1 // 5545
A=A-1 // 5546
M=D // 5547
@28 // 5548
D=A // 5549
@SP // 5550
AM=M+1 // 5551
A=A-1 // 5552
M=D // 5553
@26 // 5554
D=A // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=D // 5559
@25 // 5560
D=A // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=D // 5565
@63 // 5566
D=A // 5567
@SP // 5568
AM=M+1 // 5569
A=A-1 // 5570
M=D // 5571
@24 // 5572
D=A // 5573
@SP // 5574
AM=M+1 // 5575
A=A-1 // 5576
M=D // 5577
@24 // 5578
D=A // 5579
@SP // 5580
AM=M+1 // 5581
A=A-1 // 5582
M=D // 5583
@60 // 5584
D=A // 5585
@SP // 5586
AM=M+1 // 5587
A=A-1 // 5588
M=D // 5589
@SP // 5590
AM=M+1 // 5591
A=A-1 // 5592
M=0 // 5593
@SP // 5594
AM=M+1 // 5595
A=A-1 // 5596
M=0 // 5597
// call Output.create
@17 // 5598
D=A // 5599
@14 // 5600
M=D // 5601
@Output.create // 5602
D=A // 5603
@13 // 5604
M=D // 5605
@Output.initMap.ret.22 // 5606
D=A // 5607
@CALL // 5608
0;JMP // 5609
(Output.initMap.ret.22)
@SP // 5610
M=M-1 // 5611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5612
D=A // 5613
@SP // 5614
AM=M+1 // 5615
A=A-1 // 5616
M=D // 5617
@63 // 5618
D=A // 5619
@SP // 5620
AM=M+1 // 5621
A=A-1 // 5622
M=D // 5623
@3 // 5624
D=A // 5625
@SP // 5626
AM=M+1 // 5627
A=A-1 // 5628
M=D // 5629
@3 // 5630
D=A // 5631
@SP // 5632
AM=M+1 // 5633
A=A-1 // 5634
M=D // 5635
@31 // 5636
D=A // 5637
@SP // 5638
AM=M+1 // 5639
A=A-1 // 5640
M=D // 5641
@48 // 5642
D=A // 5643
@SP // 5644
AM=M+1 // 5645
A=A-1 // 5646
M=D // 5647
@48 // 5648
D=A // 5649
@SP // 5650
AM=M+1 // 5651
A=A-1 // 5652
M=D // 5653
@48 // 5654
D=A // 5655
@SP // 5656
AM=M+1 // 5657
A=A-1 // 5658
M=D // 5659
@51 // 5660
D=A // 5661
@SP // 5662
AM=M+1 // 5663
A=A-1 // 5664
M=D // 5665
@30 // 5666
D=A // 5667
@SP // 5668
AM=M+1 // 5669
A=A-1 // 5670
M=D // 5671
@SP // 5672
AM=M+1 // 5673
A=A-1 // 5674
M=0 // 5675
@SP // 5676
AM=M+1 // 5677
A=A-1 // 5678
M=0 // 5679
// call Output.create
@17 // 5680
D=A // 5681
@14 // 5682
M=D // 5683
@Output.create // 5684
D=A // 5685
@13 // 5686
M=D // 5687
@Output.initMap.ret.23 // 5688
D=A // 5689
@CALL // 5690
0;JMP // 5691
(Output.initMap.ret.23)
@SP // 5692
M=M-1 // 5693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5694
D=A // 5695
@SP // 5696
AM=M+1 // 5697
A=A-1 // 5698
M=D // 5699
@28 // 5700
D=A // 5701
@SP // 5702
AM=M+1 // 5703
A=A-1 // 5704
M=D // 5705
@6 // 5706
D=A // 5707
@SP // 5708
AM=M+1 // 5709
A=A-1 // 5710
M=D // 5711
@3 // 5712
D=A // 5713
@SP // 5714
AM=M+1 // 5715
A=A-1 // 5716
M=D // 5717
@3 // 5718
D=A // 5719
@SP // 5720
AM=M+1 // 5721
A=A-1 // 5722
M=D // 5723
@31 // 5724
D=A // 5725
@SP // 5726
AM=M+1 // 5727
A=A-1 // 5728
M=D // 5729
@51 // 5730
D=A // 5731
@SP // 5732
AM=M+1 // 5733
A=A-1 // 5734
M=D // 5735
@51 // 5736
D=A // 5737
@SP // 5738
AM=M+1 // 5739
A=A-1 // 5740
M=D // 5741
@51 // 5742
D=A // 5743
@SP // 5744
AM=M+1 // 5745
A=A-1 // 5746
M=D // 5747
@30 // 5748
D=A // 5749
@SP // 5750
AM=M+1 // 5751
A=A-1 // 5752
M=D // 5753
@SP // 5754
AM=M+1 // 5755
A=A-1 // 5756
M=0 // 5757
@SP // 5758
AM=M+1 // 5759
A=A-1 // 5760
M=0 // 5761
// call Output.create
@17 // 5762
D=A // 5763
@14 // 5764
M=D // 5765
@Output.create // 5766
D=A // 5767
@13 // 5768
M=D // 5769
@Output.initMap.ret.24 // 5770
D=A // 5771
@CALL // 5772
0;JMP // 5773
(Output.initMap.ret.24)
@SP // 5774
M=M-1 // 5775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 5776
D=A // 5777
@SP // 5778
AM=M+1 // 5779
A=A-1 // 5780
M=D // 5781
@63 // 5782
D=A // 5783
@SP // 5784
AM=M+1 // 5785
A=A-1 // 5786
M=D // 5787
@49 // 5788
D=A // 5789
@SP // 5790
AM=M+1 // 5791
A=A-1 // 5792
M=D // 5793
@48 // 5794
D=A // 5795
@SP // 5796
AM=M+1 // 5797
A=A-1 // 5798
M=D // 5799
@48 // 5800
D=A // 5801
@SP // 5802
AM=M+1 // 5803
A=A-1 // 5804
M=D // 5805
@24 // 5806
D=A // 5807
@SP // 5808
AM=M+1 // 5809
A=A-1 // 5810
M=D // 5811
@12 // 5812
D=A // 5813
@SP // 5814
AM=M+1 // 5815
A=A-1 // 5816
M=D // 5817
@12 // 5818
D=A // 5819
@SP // 5820
AM=M+1 // 5821
A=A-1 // 5822
M=D // 5823
@12 // 5824
D=A // 5825
@SP // 5826
AM=M+1 // 5827
A=A-1 // 5828
M=D // 5829
@12 // 5830
D=A // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=D // 5835
@SP // 5836
AM=M+1 // 5837
A=A-1 // 5838
M=0 // 5839
@SP // 5840
AM=M+1 // 5841
A=A-1 // 5842
M=0 // 5843
// call Output.create
@17 // 5844
D=A // 5845
@14 // 5846
M=D // 5847
@Output.create // 5848
D=A // 5849
@13 // 5850
M=D // 5851
@Output.initMap.ret.25 // 5852
D=A // 5853
@CALL // 5854
0;JMP // 5855
(Output.initMap.ret.25)
@SP // 5856
M=M-1 // 5857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 5858
D=A // 5859
@SP // 5860
AM=M+1 // 5861
A=A-1 // 5862
M=D // 5863
@30 // 5864
D=A // 5865
@SP // 5866
AM=M+1 // 5867
A=A-1 // 5868
M=D // 5869
@51 // 5870
D=A // 5871
@SP // 5872
AM=M+1 // 5873
A=A-1 // 5874
M=D // 5875
@51 // 5876
D=A // 5877
@SP // 5878
AM=M+1 // 5879
A=A-1 // 5880
M=D // 5881
@51 // 5882
D=A // 5883
@SP // 5884
AM=M+1 // 5885
A=A-1 // 5886
M=D // 5887
@30 // 5888
D=A // 5889
@SP // 5890
AM=M+1 // 5891
A=A-1 // 5892
M=D // 5893
@51 // 5894
D=A // 5895
@SP // 5896
AM=M+1 // 5897
A=A-1 // 5898
M=D // 5899
@51 // 5900
D=A // 5901
@SP // 5902
AM=M+1 // 5903
A=A-1 // 5904
M=D // 5905
@51 // 5906
D=A // 5907
@SP // 5908
AM=M+1 // 5909
A=A-1 // 5910
M=D // 5911
@30 // 5912
D=A // 5913
@SP // 5914
AM=M+1 // 5915
A=A-1 // 5916
M=D // 5917
@SP // 5918
AM=M+1 // 5919
A=A-1 // 5920
M=0 // 5921
@SP // 5922
AM=M+1 // 5923
A=A-1 // 5924
M=0 // 5925
// call Output.create
@17 // 5926
D=A // 5927
@14 // 5928
M=D // 5929
@Output.create // 5930
D=A // 5931
@13 // 5932
M=D // 5933
@Output.initMap.ret.26 // 5934
D=A // 5935
@CALL // 5936
0;JMP // 5937
(Output.initMap.ret.26)
@SP // 5938
M=M-1 // 5939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 5940
D=A // 5941
@SP // 5942
AM=M+1 // 5943
A=A-1 // 5944
M=D // 5945
@30 // 5946
D=A // 5947
@SP // 5948
AM=M+1 // 5949
A=A-1 // 5950
M=D // 5951
@51 // 5952
D=A // 5953
@SP // 5954
AM=M+1 // 5955
A=A-1 // 5956
M=D // 5957
@51 // 5958
D=A // 5959
@SP // 5960
AM=M+1 // 5961
A=A-1 // 5962
M=D // 5963
@51 // 5964
D=A // 5965
@SP // 5966
AM=M+1 // 5967
A=A-1 // 5968
M=D // 5969
@62 // 5970
D=A // 5971
@SP // 5972
AM=M+1 // 5973
A=A-1 // 5974
M=D // 5975
@48 // 5976
D=A // 5977
@SP // 5978
AM=M+1 // 5979
A=A-1 // 5980
M=D // 5981
@48 // 5982
D=A // 5983
@SP // 5984
AM=M+1 // 5985
A=A-1 // 5986
M=D // 5987
@24 // 5988
D=A // 5989
@SP // 5990
AM=M+1 // 5991
A=A-1 // 5992
M=D // 5993
@14 // 5994
D=A // 5995
@SP // 5996
AM=M+1 // 5997
A=A-1 // 5998
M=D // 5999
@SP // 6000
AM=M+1 // 6001
A=A-1 // 6002
M=0 // 6003
@SP // 6004
AM=M+1 // 6005
A=A-1 // 6006
M=0 // 6007
// call Output.create
@17 // 6008
D=A // 6009
@14 // 6010
M=D // 6011
@Output.create // 6012
D=A // 6013
@13 // 6014
M=D // 6015
@Output.initMap.ret.27 // 6016
D=A // 6017
@CALL // 6018
0;JMP // 6019
(Output.initMap.ret.27)
@SP // 6020
M=M-1 // 6021

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6022
D=A // 6023
@SP // 6024
M=D+M // 6025
@58 // 6026
D=A // 6027
@SP // 6028
A=M-1 // 6029
M=0 // 6030
A=A-1 // 6031
M=0 // 6032
A=A-1 // 6033
M=D // 6034
A=A-1 // 6035
@4 // 6036
D=A // 6037
@SP // 6038
M=D+M // 6039
@12 // 6040
D=A // 6041
@SP // 6042
A=M-1 // 6043
M=0 // 6044
A=A-1 // 6045
M=0 // 6046
A=A-1 // 6047
M=D // 6048
A=A-1 // 6049
M=D // 6050
A=A-1 // 6051
@5 // 6052
D=A // 6053
@SP // 6054
M=D+M // 6055
@12 // 6056
D=A // 6057
@SP // 6058
A=M-1 // 6059
M=0 // 6060
A=A-1 // 6061
M=0 // 6062
A=A-1 // 6063
M=0 // 6064
A=A-1 // 6065
M=D // 6066
A=A-1 // 6067
M=D // 6068
A=A-1 // 6069
// call Output.create
@17 // 6070
D=A // 6071
@14 // 6072
M=D // 6073
@Output.create // 6074
D=A // 6075
@13 // 6076
M=D // 6077
@Output.initMap.ret.28 // 6078
D=A // 6079
@CALL // 6080
0;JMP // 6081
(Output.initMap.ret.28)
@SP // 6082
M=M-1 // 6083

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6084
D=A // 6085
@SP // 6086
M=D+M // 6087
@59 // 6088
D=A // 6089
@SP // 6090
A=M-1 // 6091
M=0 // 6092
A=A-1 // 6093
M=0 // 6094
A=A-1 // 6095
M=D // 6096
A=A-1 // 6097
@4 // 6098
D=A // 6099
@SP // 6100
M=D+M // 6101
@12 // 6102
D=A // 6103
@SP // 6104
A=M-1 // 6105
M=0 // 6106
A=A-1 // 6107
M=0 // 6108
A=A-1 // 6109
M=D // 6110
A=A-1 // 6111
M=D // 6112
A=A-1 // 6113
@12 // 6114
D=A // 6115
@SP // 6116
AM=M+1 // 6117
A=A-1 // 6118
M=D // 6119
@12 // 6120
D=A // 6121
@SP // 6122
AM=M+1 // 6123
A=A-1 // 6124
M=D // 6125
@6 // 6126
D=A // 6127
@SP // 6128
AM=M+1 // 6129
A=A-1 // 6130
M=D // 6131
@SP // 6132
AM=M+1 // 6133
A=A-1 // 6134
M=0 // 6135
@SP // 6136
AM=M+1 // 6137
A=A-1 // 6138
M=0 // 6139
// call Output.create
@17 // 6140
D=A // 6141
@14 // 6142
M=D // 6143
@Output.create // 6144
D=A // 6145
@13 // 6146
M=D // 6147
@Output.initMap.ret.29 // 6148
D=A // 6149
@CALL // 6150
0;JMP // 6151
(Output.initMap.ret.29)
@SP // 6152
M=M-1 // 6153

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6154
D=A // 6155
@SP // 6156
M=D+M // 6157
@60 // 6158
D=A // 6159
@SP // 6160
A=M-1 // 6161
M=0 // 6162
A=A-1 // 6163
M=0 // 6164
A=A-1 // 6165
M=D // 6166
A=A-1 // 6167
@24 // 6168
D=A // 6169
@SP // 6170
AM=M+1 // 6171
A=A-1 // 6172
M=D // 6173
@12 // 6174
D=A // 6175
@SP // 6176
AM=M+1 // 6177
A=A-1 // 6178
M=D // 6179
@6 // 6180
D=A // 6181
@SP // 6182
AM=M+1 // 6183
A=A-1 // 6184
M=D // 6185
@3 // 6186
D=A // 6187
@SP // 6188
AM=M+1 // 6189
A=A-1 // 6190
M=D // 6191
@6 // 6192
D=A // 6193
@SP // 6194
AM=M+1 // 6195
A=A-1 // 6196
M=D // 6197
@12 // 6198
D=A // 6199
@SP // 6200
AM=M+1 // 6201
A=A-1 // 6202
M=D // 6203
@24 // 6204
D=A // 6205
@SP // 6206
AM=M+1 // 6207
A=A-1 // 6208
M=D // 6209
@SP // 6210
AM=M+1 // 6211
A=A-1 // 6212
M=0 // 6213
@SP // 6214
AM=M+1 // 6215
A=A-1 // 6216
M=0 // 6217
// call Output.create
@17 // 6218
D=A // 6219
@14 // 6220
M=D // 6221
@Output.create // 6222
D=A // 6223
@13 // 6224
M=D // 6225
@Output.initMap.ret.30 // 6226
D=A // 6227
@CALL // 6228
0;JMP // 6229
(Output.initMap.ret.30)
@SP // 6230
M=M-1 // 6231

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6232
D=A // 6233
@SP // 6234
M=D+M // 6235
@61 // 6236
D=A // 6237
@SP // 6238
A=M-1 // 6239
M=0 // 6240
A=A-1 // 6241
M=0 // 6242
A=A-1 // 6243
M=0 // 6244
A=A-1 // 6245
M=D // 6246
A=A-1 // 6247
@3 // 6248
D=A // 6249
@SP // 6250
M=D+M // 6251
@63 // 6252
D=A // 6253
@SP // 6254
A=M-1 // 6255
M=0 // 6256
A=A-1 // 6257
M=0 // 6258
A=A-1 // 6259
M=D // 6260
A=A-1 // 6261
@5 // 6262
D=A // 6263
@SP // 6264
M=D+M // 6265
@63 // 6266
D=A // 6267
@SP // 6268
A=M-1 // 6269
M=0 // 6270
A=A-1 // 6271
M=0 // 6272
A=A-1 // 6273
M=0 // 6274
A=A-1 // 6275
M=0 // 6276
A=A-1 // 6277
M=D // 6278
A=A-1 // 6279
// call Output.create
@17 // 6280
D=A // 6281
@14 // 6282
M=D // 6283
@Output.create // 6284
D=A // 6285
@13 // 6286
M=D // 6287
@Output.initMap.ret.31 // 6288
D=A // 6289
@CALL // 6290
0;JMP // 6291
(Output.initMap.ret.31)
@SP // 6292
M=M-1 // 6293

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6294
D=A // 6295
@SP // 6296
M=D+M // 6297
@62 // 6298
D=A // 6299
@SP // 6300
A=M-1 // 6301
M=0 // 6302
A=A-1 // 6303
M=0 // 6304
A=A-1 // 6305
M=D // 6306
A=A-1 // 6307
@3 // 6308
D=A // 6309
@SP // 6310
AM=M+1 // 6311
A=A-1 // 6312
M=D // 6313
@6 // 6314
D=A // 6315
@SP // 6316
AM=M+1 // 6317
A=A-1 // 6318
M=D // 6319
@12 // 6320
D=A // 6321
@SP // 6322
AM=M+1 // 6323
A=A-1 // 6324
M=D // 6325
@24 // 6326
D=A // 6327
@SP // 6328
AM=M+1 // 6329
A=A-1 // 6330
M=D // 6331
@12 // 6332
D=A // 6333
@SP // 6334
AM=M+1 // 6335
A=A-1 // 6336
M=D // 6337
@6 // 6338
D=A // 6339
@SP // 6340
AM=M+1 // 6341
A=A-1 // 6342
M=D // 6343
@3 // 6344
D=A // 6345
@SP // 6346
AM=M+1 // 6347
A=A-1 // 6348
M=D // 6349
@SP // 6350
AM=M+1 // 6351
A=A-1 // 6352
M=0 // 6353
@SP // 6354
AM=M+1 // 6355
A=A-1 // 6356
M=0 // 6357
// call Output.create
@17 // 6358
D=A // 6359
@14 // 6360
M=D // 6361
@Output.create // 6362
D=A // 6363
@13 // 6364
M=D // 6365
@Output.initMap.ret.32 // 6366
D=A // 6367
@CALL // 6368
0;JMP // 6369
(Output.initMap.ret.32)
@SP // 6370
M=M-1 // 6371

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6372
D=A // 6373
@SP // 6374
AM=M+1 // 6375
A=A-1 // 6376
M=D // 6377
@30 // 6378
D=A // 6379
@SP // 6380
AM=M+1 // 6381
A=A-1 // 6382
M=D // 6383
@51 // 6384
D=A // 6385
@SP // 6386
AM=M+1 // 6387
A=A-1 // 6388
M=D // 6389
@51 // 6390
D=A // 6391
@SP // 6392
AM=M+1 // 6393
A=A-1 // 6394
M=D // 6395
@59 // 6396
D=A // 6397
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=D // 6401
@59 // 6402
D=A // 6403
@SP // 6404
AM=M+1 // 6405
A=A-1 // 6406
M=D // 6407
@59 // 6408
D=A // 6409
@SP // 6410
AM=M+1 // 6411
A=A-1 // 6412
M=D // 6413
@27 // 6414
D=A // 6415
@SP // 6416
AM=M+1 // 6417
A=A-1 // 6418
M=D // 6419
@3 // 6420
D=A // 6421
@SP // 6422
AM=M+1 // 6423
A=A-1 // 6424
M=D // 6425
@30 // 6426
D=A // 6427
@SP // 6428
AM=M+1 // 6429
A=A-1 // 6430
M=D // 6431
@SP // 6432
AM=M+1 // 6433
A=A-1 // 6434
M=0 // 6435
@SP // 6436
AM=M+1 // 6437
A=A-1 // 6438
M=0 // 6439
// call Output.create
@17 // 6440
D=A // 6441
@14 // 6442
M=D // 6443
@Output.create // 6444
D=A // 6445
@13 // 6446
M=D // 6447
@Output.initMap.ret.33 // 6448
D=A // 6449
@CALL // 6450
0;JMP // 6451
(Output.initMap.ret.33)
@SP // 6452
M=M-1 // 6453

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6454
D=A // 6455
@SP // 6456
AM=M+1 // 6457
A=A-1 // 6458
M=D // 6459
@30 // 6460
D=A // 6461
@SP // 6462
AM=M+1 // 6463
A=A-1 // 6464
M=D // 6465
@51 // 6466
D=A // 6467
@SP // 6468
AM=M+1 // 6469
A=A-1 // 6470
M=D // 6471
@51 // 6472
D=A // 6473
@SP // 6474
AM=M+1 // 6475
A=A-1 // 6476
M=D // 6477
@24 // 6478
D=A // 6479
@SP // 6480
AM=M+1 // 6481
A=A-1 // 6482
M=D // 6483
@12 // 6484
D=A // 6485
@SP // 6486
AM=M+1 // 6487
A=A-1 // 6488
M=D // 6489
@12 // 6490
D=A // 6491
@SP // 6492
AM=M+1 // 6493
A=A-1 // 6494
M=D // 6495
@SP // 6496
AM=M+1 // 6497
A=A-1 // 6498
M=0 // 6499
@4 // 6500
D=A // 6501
@SP // 6502
M=D+M // 6503
@12 // 6504
D=A // 6505
@SP // 6506
A=M-1 // 6507
M=0 // 6508
A=A-1 // 6509
M=0 // 6510
A=A-1 // 6511
M=D // 6512
A=A-1 // 6513
M=D // 6514
A=A-1 // 6515
// call Output.create
@17 // 6516
D=A // 6517
@14 // 6518
M=D // 6519
@Output.create // 6520
D=A // 6521
@13 // 6522
M=D // 6523
@Output.initMap.ret.34 // 6524
D=A // 6525
@CALL // 6526
0;JMP // 6527
(Output.initMap.ret.34)
@SP // 6528
M=M-1 // 6529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6530
D=A // 6531
@SP // 6532
AM=M+1 // 6533
A=A-1 // 6534
M=D // 6535
@12 // 6536
D=A // 6537
@SP // 6538
AM=M+1 // 6539
A=A-1 // 6540
M=D // 6541
@30 // 6542
D=A // 6543
@SP // 6544
AM=M+1 // 6545
A=A-1 // 6546
M=D // 6547
@51 // 6548
D=A // 6549
@SP // 6550
AM=M+1 // 6551
A=A-1 // 6552
M=D // 6553
@51 // 6554
D=A // 6555
@SP // 6556
AM=M+1 // 6557
A=A-1 // 6558
M=D // 6559
@63 // 6560
D=A // 6561
@SP // 6562
AM=M+1 // 6563
A=A-1 // 6564
M=D // 6565
@51 // 6566
D=A // 6567
@SP // 6568
AM=M+1 // 6569
A=A-1 // 6570
M=D // 6571
@51 // 6572
D=A // 6573
@SP // 6574
AM=M+1 // 6575
A=A-1 // 6576
M=D // 6577
@51 // 6578
D=A // 6579
@SP // 6580
AM=M+1 // 6581
A=A-1 // 6582
M=D // 6583
@51 // 6584
D=A // 6585
@SP // 6586
AM=M+1 // 6587
A=A-1 // 6588
M=D // 6589
@SP // 6590
AM=M+1 // 6591
A=A-1 // 6592
M=0 // 6593
@SP // 6594
AM=M+1 // 6595
A=A-1 // 6596
M=0 // 6597
// call Output.create
@17 // 6598
D=A // 6599
@14 // 6600
M=D // 6601
@Output.create // 6602
D=A // 6603
@13 // 6604
M=D // 6605
@Output.initMap.ret.35 // 6606
D=A // 6607
@CALL // 6608
0;JMP // 6609
(Output.initMap.ret.35)
@SP // 6610
M=M-1 // 6611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6612
D=A // 6613
@SP // 6614
AM=M+1 // 6615
A=A-1 // 6616
M=D // 6617
@31 // 6618
D=A // 6619
@SP // 6620
AM=M+1 // 6621
A=A-1 // 6622
M=D // 6623
@51 // 6624
D=A // 6625
@SP // 6626
AM=M+1 // 6627
A=A-1 // 6628
M=D // 6629
@51 // 6630
D=A // 6631
@SP // 6632
AM=M+1 // 6633
A=A-1 // 6634
M=D // 6635
@51 // 6636
D=A // 6637
@SP // 6638
AM=M+1 // 6639
A=A-1 // 6640
M=D // 6641
@31 // 6642
D=A // 6643
@SP // 6644
AM=M+1 // 6645
A=A-1 // 6646
M=D // 6647
@51 // 6648
D=A // 6649
@SP // 6650
AM=M+1 // 6651
A=A-1 // 6652
M=D // 6653
@51 // 6654
D=A // 6655
@SP // 6656
AM=M+1 // 6657
A=A-1 // 6658
M=D // 6659
@51 // 6660
D=A // 6661
@SP // 6662
AM=M+1 // 6663
A=A-1 // 6664
M=D // 6665
@31 // 6666
D=A // 6667
@SP // 6668
AM=M+1 // 6669
A=A-1 // 6670
M=D // 6671
@SP // 6672
AM=M+1 // 6673
A=A-1 // 6674
M=0 // 6675
@SP // 6676
AM=M+1 // 6677
A=A-1 // 6678
M=0 // 6679
// call Output.create
@17 // 6680
D=A // 6681
@14 // 6682
M=D // 6683
@Output.create // 6684
D=A // 6685
@13 // 6686
M=D // 6687
@Output.initMap.ret.36 // 6688
D=A // 6689
@CALL // 6690
0;JMP // 6691
(Output.initMap.ret.36)
@SP // 6692
M=M-1 // 6693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6694
D=A // 6695
@SP // 6696
AM=M+1 // 6697
A=A-1 // 6698
M=D // 6699
@28 // 6700
D=A // 6701
@SP // 6702
AM=M+1 // 6703
A=A-1 // 6704
M=D // 6705
@54 // 6706
D=A // 6707
@SP // 6708
AM=M+1 // 6709
A=A-1 // 6710
M=D // 6711
@35 // 6712
D=A // 6713
@SP // 6714
AM=M+1 // 6715
A=A-1 // 6716
M=D // 6717
@3 // 6718
D=A // 6719
@SP // 6720
AM=M+1 // 6721
A=A-1 // 6722
M=D // 6723
@3 // 6724
D=A // 6725
@SP // 6726
AM=M+1 // 6727
A=A-1 // 6728
M=D // 6729
@3 // 6730
D=A // 6731
@SP // 6732
AM=M+1 // 6733
A=A-1 // 6734
M=D // 6735
@35 // 6736
D=A // 6737
@SP // 6738
AM=M+1 // 6739
A=A-1 // 6740
M=D // 6741
@54 // 6742
D=A // 6743
@SP // 6744
AM=M+1 // 6745
A=A-1 // 6746
M=D // 6747
@28 // 6748
D=A // 6749
@SP // 6750
AM=M+1 // 6751
A=A-1 // 6752
M=D // 6753
@SP // 6754
AM=M+1 // 6755
A=A-1 // 6756
M=0 // 6757
@SP // 6758
AM=M+1 // 6759
A=A-1 // 6760
M=0 // 6761
// call Output.create
@17 // 6762
D=A // 6763
@14 // 6764
M=D // 6765
@Output.create // 6766
D=A // 6767
@13 // 6768
M=D // 6769
@Output.initMap.ret.37 // 6770
D=A // 6771
@CALL // 6772
0;JMP // 6773
(Output.initMap.ret.37)
@SP // 6774
M=M-1 // 6775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 6776
D=A // 6777
@SP // 6778
AM=M+1 // 6779
A=A-1 // 6780
M=D // 6781
@15 // 6782
D=A // 6783
@SP // 6784
AM=M+1 // 6785
A=A-1 // 6786
M=D // 6787
@27 // 6788
D=A // 6789
@SP // 6790
AM=M+1 // 6791
A=A-1 // 6792
M=D // 6793
@51 // 6794
D=A // 6795
@SP // 6796
AM=M+1 // 6797
A=A-1 // 6798
M=D // 6799
@51 // 6800
D=A // 6801
@SP // 6802
AM=M+1 // 6803
A=A-1 // 6804
M=D // 6805
@51 // 6806
D=A // 6807
@SP // 6808
AM=M+1 // 6809
A=A-1 // 6810
M=D // 6811
@51 // 6812
D=A // 6813
@SP // 6814
AM=M+1 // 6815
A=A-1 // 6816
M=D // 6817
@51 // 6818
D=A // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=D // 6823
@27 // 6824
D=A // 6825
@SP // 6826
AM=M+1 // 6827
A=A-1 // 6828
M=D // 6829
@15 // 6830
D=A // 6831
@SP // 6832
AM=M+1 // 6833
A=A-1 // 6834
M=D // 6835
@SP // 6836
AM=M+1 // 6837
A=A-1 // 6838
M=0 // 6839
@SP // 6840
AM=M+1 // 6841
A=A-1 // 6842
M=0 // 6843
// call Output.create
@17 // 6844
D=A // 6845
@14 // 6846
M=D // 6847
@Output.create // 6848
D=A // 6849
@13 // 6850
M=D // 6851
@Output.initMap.ret.38 // 6852
D=A // 6853
@CALL // 6854
0;JMP // 6855
(Output.initMap.ret.38)
@SP // 6856
M=M-1 // 6857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 6858
D=A // 6859
@SP // 6860
AM=M+1 // 6861
A=A-1 // 6862
M=D // 6863
@63 // 6864
D=A // 6865
@SP // 6866
AM=M+1 // 6867
A=A-1 // 6868
M=D // 6869
@51 // 6870
D=A // 6871
@SP // 6872
AM=M+1 // 6873
A=A-1 // 6874
M=D // 6875
@35 // 6876
D=A // 6877
@SP // 6878
AM=M+1 // 6879
A=A-1 // 6880
M=D // 6881
@11 // 6882
D=A // 6883
@SP // 6884
AM=M+1 // 6885
A=A-1 // 6886
M=D // 6887
@15 // 6888
D=A // 6889
@SP // 6890
AM=M+1 // 6891
A=A-1 // 6892
M=D // 6893
@11 // 6894
D=A // 6895
@SP // 6896
AM=M+1 // 6897
A=A-1 // 6898
M=D // 6899
@35 // 6900
D=A // 6901
@SP // 6902
AM=M+1 // 6903
A=A-1 // 6904
M=D // 6905
@51 // 6906
D=A // 6907
@SP // 6908
AM=M+1 // 6909
A=A-1 // 6910
M=D // 6911
@63 // 6912
D=A // 6913
@SP // 6914
AM=M+1 // 6915
A=A-1 // 6916
M=D // 6917
@SP // 6918
AM=M+1 // 6919
A=A-1 // 6920
M=0 // 6921
@SP // 6922
AM=M+1 // 6923
A=A-1 // 6924
M=0 // 6925
// call Output.create
@17 // 6926
D=A // 6927
@14 // 6928
M=D // 6929
@Output.create // 6930
D=A // 6931
@13 // 6932
M=D // 6933
@Output.initMap.ret.39 // 6934
D=A // 6935
@CALL // 6936
0;JMP // 6937
(Output.initMap.ret.39)
@SP // 6938
M=M-1 // 6939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 6940
D=A // 6941
@SP // 6942
AM=M+1 // 6943
A=A-1 // 6944
M=D // 6945
@63 // 6946
D=A // 6947
@SP // 6948
AM=M+1 // 6949
A=A-1 // 6950
M=D // 6951
@51 // 6952
D=A // 6953
@SP // 6954
AM=M+1 // 6955
A=A-1 // 6956
M=D // 6957
@35 // 6958
D=A // 6959
@SP // 6960
AM=M+1 // 6961
A=A-1 // 6962
M=D // 6963
@11 // 6964
D=A // 6965
@SP // 6966
AM=M+1 // 6967
A=A-1 // 6968
M=D // 6969
@15 // 6970
D=A // 6971
@SP // 6972
AM=M+1 // 6973
A=A-1 // 6974
M=D // 6975
@11 // 6976
D=A // 6977
@SP // 6978
AM=M+1 // 6979
A=A-1 // 6980
M=D // 6981
@3 // 6982
D=A // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=D // 6987
@3 // 6988
D=A // 6989
@SP // 6990
AM=M+1 // 6991
A=A-1 // 6992
M=D // 6993
@3 // 6994
D=A // 6995
@SP // 6996
AM=M+1 // 6997
A=A-1 // 6998
M=D // 6999
@SP // 7000
AM=M+1 // 7001
A=A-1 // 7002
M=0 // 7003
@SP // 7004
AM=M+1 // 7005
A=A-1 // 7006
M=0 // 7007
// call Output.create
@17 // 7008
D=A // 7009
@14 // 7010
M=D // 7011
@Output.create // 7012
D=A // 7013
@13 // 7014
M=D // 7015
@Output.initMap.ret.40 // 7016
D=A // 7017
@CALL // 7018
0;JMP // 7019
(Output.initMap.ret.40)
@SP // 7020
M=M-1 // 7021

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7022
D=A // 7023
@SP // 7024
AM=M+1 // 7025
A=A-1 // 7026
M=D // 7027
@28 // 7028
D=A // 7029
@SP // 7030
AM=M+1 // 7031
A=A-1 // 7032
M=D // 7033
@54 // 7034
D=A // 7035
@SP // 7036
AM=M+1 // 7037
A=A-1 // 7038
M=D // 7039
@35 // 7040
D=A // 7041
@SP // 7042
AM=M+1 // 7043
A=A-1 // 7044
M=D // 7045
@3 // 7046
D=A // 7047
@SP // 7048
AM=M+1 // 7049
A=A-1 // 7050
M=D // 7051
@59 // 7052
D=A // 7053
@SP // 7054
AM=M+1 // 7055
A=A-1 // 7056
M=D // 7057
@51 // 7058
D=A // 7059
@SP // 7060
AM=M+1 // 7061
A=A-1 // 7062
M=D // 7063
@51 // 7064
D=A // 7065
@SP // 7066
AM=M+1 // 7067
A=A-1 // 7068
M=D // 7069
@54 // 7070
D=A // 7071
@SP // 7072
AM=M+1 // 7073
A=A-1 // 7074
M=D // 7075
@44 // 7076
D=A // 7077
@SP // 7078
AM=M+1 // 7079
A=A-1 // 7080
M=D // 7081
@SP // 7082
AM=M+1 // 7083
A=A-1 // 7084
M=0 // 7085
@SP // 7086
AM=M+1 // 7087
A=A-1 // 7088
M=0 // 7089
// call Output.create
@17 // 7090
D=A // 7091
@14 // 7092
M=D // 7093
@Output.create // 7094
D=A // 7095
@13 // 7096
M=D // 7097
@Output.initMap.ret.41 // 7098
D=A // 7099
@CALL // 7100
0;JMP // 7101
(Output.initMap.ret.41)
@SP // 7102
M=M-1 // 7103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7104
D=A // 7105
@SP // 7106
AM=M+1 // 7107
A=A-1 // 7108
M=D // 7109
@51 // 7110
D=A // 7111
@SP // 7112
AM=M+1 // 7113
A=A-1 // 7114
M=D // 7115
@51 // 7116
D=A // 7117
@SP // 7118
AM=M+1 // 7119
A=A-1 // 7120
M=D // 7121
@51 // 7122
D=A // 7123
@SP // 7124
AM=M+1 // 7125
A=A-1 // 7126
M=D // 7127
@51 // 7128
D=A // 7129
@SP // 7130
AM=M+1 // 7131
A=A-1 // 7132
M=D // 7133
@63 // 7134
D=A // 7135
@SP // 7136
AM=M+1 // 7137
A=A-1 // 7138
M=D // 7139
@51 // 7140
D=A // 7141
@SP // 7142
AM=M+1 // 7143
A=A-1 // 7144
M=D // 7145
@51 // 7146
D=A // 7147
@SP // 7148
AM=M+1 // 7149
A=A-1 // 7150
M=D // 7151
@51 // 7152
D=A // 7153
@SP // 7154
AM=M+1 // 7155
A=A-1 // 7156
M=D // 7157
@51 // 7158
D=A // 7159
@SP // 7160
AM=M+1 // 7161
A=A-1 // 7162
M=D // 7163
@SP // 7164
AM=M+1 // 7165
A=A-1 // 7166
M=0 // 7167
@SP // 7168
AM=M+1 // 7169
A=A-1 // 7170
M=0 // 7171
// call Output.create
@17 // 7172
D=A // 7173
@14 // 7174
M=D // 7175
@Output.create // 7176
D=A // 7177
@13 // 7178
M=D // 7179
@Output.initMap.ret.42 // 7180
D=A // 7181
@CALL // 7182
0;JMP // 7183
(Output.initMap.ret.42)
@SP // 7184
M=M-1 // 7185

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7186
D=A // 7187
@SP // 7188
AM=M+1 // 7189
A=A-1 // 7190
M=D // 7191
@30 // 7192
D=A // 7193
@SP // 7194
AM=M+1 // 7195
A=A-1 // 7196
M=D // 7197
@12 // 7198
D=A // 7199
@SP // 7200
AM=M+1 // 7201
A=A-1 // 7202
M=D // 7203
@12 // 7204
D=A // 7205
@SP // 7206
AM=M+1 // 7207
A=A-1 // 7208
M=D // 7209
@12 // 7210
D=A // 7211
@SP // 7212
AM=M+1 // 7213
A=A-1 // 7214
M=D // 7215
@12 // 7216
D=A // 7217
@SP // 7218
AM=M+1 // 7219
A=A-1 // 7220
M=D // 7221
@12 // 7222
D=A // 7223
@SP // 7224
AM=M+1 // 7225
A=A-1 // 7226
M=D // 7227
@12 // 7228
D=A // 7229
@SP // 7230
AM=M+1 // 7231
A=A-1 // 7232
M=D // 7233
@12 // 7234
D=A // 7235
@SP // 7236
AM=M+1 // 7237
A=A-1 // 7238
M=D // 7239
@30 // 7240
D=A // 7241
@SP // 7242
AM=M+1 // 7243
A=A-1 // 7244
M=D // 7245
@SP // 7246
AM=M+1 // 7247
A=A-1 // 7248
M=0 // 7249
@SP // 7250
AM=M+1 // 7251
A=A-1 // 7252
M=0 // 7253
// call Output.create
@17 // 7254
D=A // 7255
@14 // 7256
M=D // 7257
@Output.create // 7258
D=A // 7259
@13 // 7260
M=D // 7261
@Output.initMap.ret.43 // 7262
D=A // 7263
@CALL // 7264
0;JMP // 7265
(Output.initMap.ret.43)
@SP // 7266
M=M-1 // 7267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7268
D=A // 7269
@SP // 7270
AM=M+1 // 7271
A=A-1 // 7272
M=D // 7273
@60 // 7274
D=A // 7275
@SP // 7276
AM=M+1 // 7277
A=A-1 // 7278
M=D // 7279
@24 // 7280
D=A // 7281
@SP // 7282
AM=M+1 // 7283
A=A-1 // 7284
M=D // 7285
@24 // 7286
D=A // 7287
@SP // 7288
AM=M+1 // 7289
A=A-1 // 7290
M=D // 7291
@24 // 7292
D=A // 7293
@SP // 7294
AM=M+1 // 7295
A=A-1 // 7296
M=D // 7297
@24 // 7298
D=A // 7299
@SP // 7300
AM=M+1 // 7301
A=A-1 // 7302
M=D // 7303
@24 // 7304
D=A // 7305
@SP // 7306
AM=M+1 // 7307
A=A-1 // 7308
M=D // 7309
@27 // 7310
D=A // 7311
@SP // 7312
AM=M+1 // 7313
A=A-1 // 7314
M=D // 7315
@27 // 7316
D=A // 7317
@SP // 7318
AM=M+1 // 7319
A=A-1 // 7320
M=D // 7321
@14 // 7322
D=A // 7323
@SP // 7324
AM=M+1 // 7325
A=A-1 // 7326
M=D // 7327
@SP // 7328
AM=M+1 // 7329
A=A-1 // 7330
M=0 // 7331
@SP // 7332
AM=M+1 // 7333
A=A-1 // 7334
M=0 // 7335
// call Output.create
@17 // 7336
D=A // 7337
@14 // 7338
M=D // 7339
@Output.create // 7340
D=A // 7341
@13 // 7342
M=D // 7343
@Output.initMap.ret.44 // 7344
D=A // 7345
@CALL // 7346
0;JMP // 7347
(Output.initMap.ret.44)
@SP // 7348
M=M-1 // 7349

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7350
D=A // 7351
@SP // 7352
AM=M+1 // 7353
A=A-1 // 7354
M=D // 7355
@51 // 7356
D=A // 7357
@SP // 7358
AM=M+1 // 7359
A=A-1 // 7360
M=D // 7361
@51 // 7362
D=A // 7363
@SP // 7364
AM=M+1 // 7365
A=A-1 // 7366
M=D // 7367
@51 // 7368
D=A // 7369
@SP // 7370
AM=M+1 // 7371
A=A-1 // 7372
M=D // 7373
@27 // 7374
D=A // 7375
@SP // 7376
AM=M+1 // 7377
A=A-1 // 7378
M=D // 7379
@15 // 7380
D=A // 7381
@SP // 7382
AM=M+1 // 7383
A=A-1 // 7384
M=D // 7385
@27 // 7386
D=A // 7387
@SP // 7388
AM=M+1 // 7389
A=A-1 // 7390
M=D // 7391
@51 // 7392
D=A // 7393
@SP // 7394
AM=M+1 // 7395
A=A-1 // 7396
M=D // 7397
@51 // 7398
D=A // 7399
@SP // 7400
AM=M+1 // 7401
A=A-1 // 7402
M=D // 7403
@51 // 7404
D=A // 7405
@SP // 7406
AM=M+1 // 7407
A=A-1 // 7408
M=D // 7409
@SP // 7410
AM=M+1 // 7411
A=A-1 // 7412
M=0 // 7413
@SP // 7414
AM=M+1 // 7415
A=A-1 // 7416
M=0 // 7417
// call Output.create
@17 // 7418
D=A // 7419
@14 // 7420
M=D // 7421
@Output.create // 7422
D=A // 7423
@13 // 7424
M=D // 7425
@Output.initMap.ret.45 // 7426
D=A // 7427
@CALL // 7428
0;JMP // 7429
(Output.initMap.ret.45)
@SP // 7430
M=M-1 // 7431

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7432
D=A // 7433
@SP // 7434
AM=M+1 // 7435
A=A-1 // 7436
M=D // 7437
@3 // 7438
D=A // 7439
@SP // 7440
AM=M+1 // 7441
A=A-1 // 7442
M=D // 7443
@3 // 7444
D=A // 7445
@SP // 7446
AM=M+1 // 7447
A=A-1 // 7448
M=D // 7449
@3 // 7450
D=A // 7451
@SP // 7452
AM=M+1 // 7453
A=A-1 // 7454
M=D // 7455
@3 // 7456
D=A // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=D // 7461
@3 // 7462
D=A // 7463
@SP // 7464
AM=M+1 // 7465
A=A-1 // 7466
M=D // 7467
@3 // 7468
D=A // 7469
@SP // 7470
AM=M+1 // 7471
A=A-1 // 7472
M=D // 7473
@35 // 7474
D=A // 7475
@SP // 7476
AM=M+1 // 7477
A=A-1 // 7478
M=D // 7479
@51 // 7480
D=A // 7481
@SP // 7482
AM=M+1 // 7483
A=A-1 // 7484
M=D // 7485
@63 // 7486
D=A // 7487
@SP // 7488
AM=M+1 // 7489
A=A-1 // 7490
M=D // 7491
@SP // 7492
AM=M+1 // 7493
A=A-1 // 7494
M=0 // 7495
@SP // 7496
AM=M+1 // 7497
A=A-1 // 7498
M=0 // 7499
// call Output.create
@17 // 7500
D=A // 7501
@14 // 7502
M=D // 7503
@Output.create // 7504
D=A // 7505
@13 // 7506
M=D // 7507
@Output.initMap.ret.46 // 7508
D=A // 7509
@CALL // 7510
0;JMP // 7511
(Output.initMap.ret.46)
@SP // 7512
M=M-1 // 7513

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7514
D=A // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=D // 7519
@33 // 7520
D=A // 7521
@SP // 7522
AM=M+1 // 7523
A=A-1 // 7524
M=D // 7525
@51 // 7526
D=A // 7527
@SP // 7528
AM=M+1 // 7529
A=A-1 // 7530
M=D // 7531
@63 // 7532
D=A // 7533
@SP // 7534
AM=M+1 // 7535
A=A-1 // 7536
M=D // 7537
@63 // 7538
D=A // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=D // 7543
@51 // 7544
D=A // 7545
@SP // 7546
AM=M+1 // 7547
A=A-1 // 7548
M=D // 7549
@51 // 7550
D=A // 7551
@SP // 7552
AM=M+1 // 7553
A=A-1 // 7554
M=D // 7555
@51 // 7556
D=A // 7557
@SP // 7558
AM=M+1 // 7559
A=A-1 // 7560
M=D // 7561
@51 // 7562
D=A // 7563
@SP // 7564
AM=M+1 // 7565
A=A-1 // 7566
M=D // 7567
@51 // 7568
D=A // 7569
@SP // 7570
AM=M+1 // 7571
A=A-1 // 7572
M=D // 7573
@SP // 7574
AM=M+1 // 7575
A=A-1 // 7576
M=0 // 7577
@SP // 7578
AM=M+1 // 7579
A=A-1 // 7580
M=0 // 7581
// call Output.create
@17 // 7582
D=A // 7583
@14 // 7584
M=D // 7585
@Output.create // 7586
D=A // 7587
@13 // 7588
M=D // 7589
@Output.initMap.ret.47 // 7590
D=A // 7591
@CALL // 7592
0;JMP // 7593
(Output.initMap.ret.47)
@SP // 7594
M=M-1 // 7595

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7596
D=A // 7597
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=D // 7601
@51 // 7602
D=A // 7603
@SP // 7604
AM=M+1 // 7605
A=A-1 // 7606
M=D // 7607
@51 // 7608
D=A // 7609
@SP // 7610
AM=M+1 // 7611
A=A-1 // 7612
M=D // 7613
@55 // 7614
D=A // 7615
@SP // 7616
AM=M+1 // 7617
A=A-1 // 7618
M=D // 7619
@55 // 7620
D=A // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=D // 7625
@63 // 7626
D=A // 7627
@SP // 7628
AM=M+1 // 7629
A=A-1 // 7630
M=D // 7631
@59 // 7632
D=A // 7633
@SP // 7634
AM=M+1 // 7635
A=A-1 // 7636
M=D // 7637
@59 // 7638
D=A // 7639
@SP // 7640
AM=M+1 // 7641
A=A-1 // 7642
M=D // 7643
@51 // 7644
D=A // 7645
@SP // 7646
AM=M+1 // 7647
A=A-1 // 7648
M=D // 7649
@51 // 7650
D=A // 7651
@SP // 7652
AM=M+1 // 7653
A=A-1 // 7654
M=D // 7655
@SP // 7656
AM=M+1 // 7657
A=A-1 // 7658
M=0 // 7659
@SP // 7660
AM=M+1 // 7661
A=A-1 // 7662
M=0 // 7663
// call Output.create
@17 // 7664
D=A // 7665
@14 // 7666
M=D // 7667
@Output.create // 7668
D=A // 7669
@13 // 7670
M=D // 7671
@Output.initMap.ret.48 // 7672
D=A // 7673
@CALL // 7674
0;JMP // 7675
(Output.initMap.ret.48)
@SP // 7676
M=M-1 // 7677

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7678
D=A // 7679
@SP // 7680
AM=M+1 // 7681
A=A-1 // 7682
M=D // 7683
@30 // 7684
D=A // 7685
@SP // 7686
AM=M+1 // 7687
A=A-1 // 7688
M=D // 7689
@51 // 7690
D=A // 7691
@SP // 7692
AM=M+1 // 7693
A=A-1 // 7694
M=D // 7695
@51 // 7696
D=A // 7697
@SP // 7698
AM=M+1 // 7699
A=A-1 // 7700
M=D // 7701
@51 // 7702
D=A // 7703
@SP // 7704
AM=M+1 // 7705
A=A-1 // 7706
M=D // 7707
@51 // 7708
D=A // 7709
@SP // 7710
AM=M+1 // 7711
A=A-1 // 7712
M=D // 7713
@51 // 7714
D=A // 7715
@SP // 7716
AM=M+1 // 7717
A=A-1 // 7718
M=D // 7719
@51 // 7720
D=A // 7721
@SP // 7722
AM=M+1 // 7723
A=A-1 // 7724
M=D // 7725
@51 // 7726
D=A // 7727
@SP // 7728
AM=M+1 // 7729
A=A-1 // 7730
M=D // 7731
@30 // 7732
D=A // 7733
@SP // 7734
AM=M+1 // 7735
A=A-1 // 7736
M=D // 7737
@SP // 7738
AM=M+1 // 7739
A=A-1 // 7740
M=0 // 7741
@SP // 7742
AM=M+1 // 7743
A=A-1 // 7744
M=0 // 7745
// call Output.create
@17 // 7746
D=A // 7747
@14 // 7748
M=D // 7749
@Output.create // 7750
D=A // 7751
@13 // 7752
M=D // 7753
@Output.initMap.ret.49 // 7754
D=A // 7755
@CALL // 7756
0;JMP // 7757
(Output.initMap.ret.49)
@SP // 7758
M=M-1 // 7759

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 7760
D=A // 7761
@SP // 7762
AM=M+1 // 7763
A=A-1 // 7764
M=D // 7765
@31 // 7766
D=A // 7767
@SP // 7768
AM=M+1 // 7769
A=A-1 // 7770
M=D // 7771
@51 // 7772
D=A // 7773
@SP // 7774
AM=M+1 // 7775
A=A-1 // 7776
M=D // 7777
@51 // 7778
D=A // 7779
@SP // 7780
AM=M+1 // 7781
A=A-1 // 7782
M=D // 7783
@51 // 7784
D=A // 7785
@SP // 7786
AM=M+1 // 7787
A=A-1 // 7788
M=D // 7789
@31 // 7790
D=A // 7791
@SP // 7792
AM=M+1 // 7793
A=A-1 // 7794
M=D // 7795
@3 // 7796
D=A // 7797
@SP // 7798
AM=M+1 // 7799
A=A-1 // 7800
M=D // 7801
@3 // 7802
D=A // 7803
@SP // 7804
AM=M+1 // 7805
A=A-1 // 7806
M=D // 7807
@3 // 7808
D=A // 7809
@SP // 7810
AM=M+1 // 7811
A=A-1 // 7812
M=D // 7813
@3 // 7814
D=A // 7815
@SP // 7816
AM=M+1 // 7817
A=A-1 // 7818
M=D // 7819
@SP // 7820
AM=M+1 // 7821
A=A-1 // 7822
M=0 // 7823
@SP // 7824
AM=M+1 // 7825
A=A-1 // 7826
M=0 // 7827
// call Output.create
@17 // 7828
D=A // 7829
@14 // 7830
M=D // 7831
@Output.create // 7832
D=A // 7833
@13 // 7834
M=D // 7835
@Output.initMap.ret.50 // 7836
D=A // 7837
@CALL // 7838
0;JMP // 7839
(Output.initMap.ret.50)
@SP // 7840
M=M-1 // 7841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 7842
D=A // 7843
@SP // 7844
AM=M+1 // 7845
A=A-1 // 7846
M=D // 7847
@30 // 7848
D=A // 7849
@SP // 7850
AM=M+1 // 7851
A=A-1 // 7852
M=D // 7853
@51 // 7854
D=A // 7855
@SP // 7856
AM=M+1 // 7857
A=A-1 // 7858
M=D // 7859
@51 // 7860
D=A // 7861
@SP // 7862
AM=M+1 // 7863
A=A-1 // 7864
M=D // 7865
@51 // 7866
D=A // 7867
@SP // 7868
AM=M+1 // 7869
A=A-1 // 7870
M=D // 7871
@51 // 7872
D=A // 7873
@SP // 7874
AM=M+1 // 7875
A=A-1 // 7876
M=D // 7877
@51 // 7878
D=A // 7879
@SP // 7880
AM=M+1 // 7881
A=A-1 // 7882
M=D // 7883
@63 // 7884
D=A // 7885
@SP // 7886
AM=M+1 // 7887
A=A-1 // 7888
M=D // 7889
@59 // 7890
D=A // 7891
@SP // 7892
AM=M+1 // 7893
A=A-1 // 7894
M=D // 7895
@30 // 7896
D=A // 7897
@SP // 7898
AM=M+1 // 7899
A=A-1 // 7900
M=D // 7901
@48 // 7902
D=A // 7903
@SP // 7904
AM=M+1 // 7905
A=A-1 // 7906
M=D // 7907
@SP // 7908
AM=M+1 // 7909
A=A-1 // 7910
M=0 // 7911
// call Output.create
@17 // 7912
D=A // 7913
@14 // 7914
M=D // 7915
@Output.create // 7916
D=A // 7917
@13 // 7918
M=D // 7919
@Output.initMap.ret.51 // 7920
D=A // 7921
@CALL // 7922
0;JMP // 7923
(Output.initMap.ret.51)
@SP // 7924
M=M-1 // 7925

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 7926
D=A // 7927
@SP // 7928
AM=M+1 // 7929
A=A-1 // 7930
M=D // 7931
@31 // 7932
D=A // 7933
@SP // 7934
AM=M+1 // 7935
A=A-1 // 7936
M=D // 7937
@51 // 7938
D=A // 7939
@SP // 7940
AM=M+1 // 7941
A=A-1 // 7942
M=D // 7943
@51 // 7944
D=A // 7945
@SP // 7946
AM=M+1 // 7947
A=A-1 // 7948
M=D // 7949
@51 // 7950
D=A // 7951
@SP // 7952
AM=M+1 // 7953
A=A-1 // 7954
M=D // 7955
@31 // 7956
D=A // 7957
@SP // 7958
AM=M+1 // 7959
A=A-1 // 7960
M=D // 7961
@27 // 7962
D=A // 7963
@SP // 7964
AM=M+1 // 7965
A=A-1 // 7966
M=D // 7967
@51 // 7968
D=A // 7969
@SP // 7970
AM=M+1 // 7971
A=A-1 // 7972
M=D // 7973
@51 // 7974
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
@SP // 7986
AM=M+1 // 7987
A=A-1 // 7988
M=0 // 7989
@SP // 7990
AM=M+1 // 7991
A=A-1 // 7992
M=0 // 7993
// call Output.create
@17 // 7994
D=A // 7995
@14 // 7996
M=D // 7997
@Output.create // 7998
D=A // 7999
@13 // 8000
M=D // 8001
@Output.initMap.ret.52 // 8002
D=A // 8003
@CALL // 8004
0;JMP // 8005
(Output.initMap.ret.52)
@SP // 8006
M=M-1 // 8007

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8008
D=A // 8009
@SP // 8010
AM=M+1 // 8011
A=A-1 // 8012
M=D // 8013
@30 // 8014
D=A // 8015
@SP // 8016
AM=M+1 // 8017
A=A-1 // 8018
M=D // 8019
@51 // 8020
D=A // 8021
@SP // 8022
AM=M+1 // 8023
A=A-1 // 8024
M=D // 8025
@51 // 8026
D=A // 8027
@SP // 8028
AM=M+1 // 8029
A=A-1 // 8030
M=D // 8031
@6 // 8032
D=A // 8033
@SP // 8034
AM=M+1 // 8035
A=A-1 // 8036
M=D // 8037
@28 // 8038
D=A // 8039
@SP // 8040
AM=M+1 // 8041
A=A-1 // 8042
M=D // 8043
@48 // 8044
D=A // 8045
@SP // 8046
AM=M+1 // 8047
A=A-1 // 8048
M=D // 8049
@51 // 8050
D=A // 8051
@SP // 8052
AM=M+1 // 8053
A=A-1 // 8054
M=D // 8055
@51 // 8056
D=A // 8057
@SP // 8058
AM=M+1 // 8059
A=A-1 // 8060
M=D // 8061
@30 // 8062
D=A // 8063
@SP // 8064
AM=M+1 // 8065
A=A-1 // 8066
M=D // 8067
@SP // 8068
AM=M+1 // 8069
A=A-1 // 8070
M=0 // 8071
@SP // 8072
AM=M+1 // 8073
A=A-1 // 8074
M=0 // 8075
// call Output.create
@17 // 8076
D=A // 8077
@14 // 8078
M=D // 8079
@Output.create // 8080
D=A // 8081
@13 // 8082
M=D // 8083
@Output.initMap.ret.53 // 8084
D=A // 8085
@CALL // 8086
0;JMP // 8087
(Output.initMap.ret.53)
@SP // 8088
M=M-1 // 8089

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8090
D=A // 8091
@SP // 8092
AM=M+1 // 8093
A=A-1 // 8094
M=D // 8095
@63 // 8096
D=A // 8097
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=D // 8101
@63 // 8102
D=A // 8103
@SP // 8104
AM=M+1 // 8105
A=A-1 // 8106
M=D // 8107
@45 // 8108
D=A // 8109
@SP // 8110
AM=M+1 // 8111
A=A-1 // 8112
M=D // 8113
@12 // 8114
D=A // 8115
@SP // 8116
AM=M+1 // 8117
A=A-1 // 8118
M=D // 8119
@12 // 8120
D=A // 8121
@SP // 8122
AM=M+1 // 8123
A=A-1 // 8124
M=D // 8125
@12 // 8126
D=A // 8127
@SP // 8128
AM=M+1 // 8129
A=A-1 // 8130
M=D // 8131
@12 // 8132
D=A // 8133
@SP // 8134
AM=M+1 // 8135
A=A-1 // 8136
M=D // 8137
@12 // 8138
D=A // 8139
@SP // 8140
AM=M+1 // 8141
A=A-1 // 8142
M=D // 8143
@30 // 8144
D=A // 8145
@SP // 8146
AM=M+1 // 8147
A=A-1 // 8148
M=D // 8149
@SP // 8150
AM=M+1 // 8151
A=A-1 // 8152
M=0 // 8153
@SP // 8154
AM=M+1 // 8155
A=A-1 // 8156
M=0 // 8157
// call Output.create
@17 // 8158
D=A // 8159
@14 // 8160
M=D // 8161
@Output.create // 8162
D=A // 8163
@13 // 8164
M=D // 8165
@Output.initMap.ret.54 // 8166
D=A // 8167
@CALL // 8168
0;JMP // 8169
(Output.initMap.ret.54)
@SP // 8170
M=M-1 // 8171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8172
D=A // 8173
@SP // 8174
AM=M+1 // 8175
A=A-1 // 8176
M=D // 8177
@51 // 8178
D=A // 8179
@SP // 8180
AM=M+1 // 8181
A=A-1 // 8182
M=D // 8183
@51 // 8184
D=A // 8185
@SP // 8186
AM=M+1 // 8187
A=A-1 // 8188
M=D // 8189
@51 // 8190
D=A // 8191
@SP // 8192
AM=M+1 // 8193
A=A-1 // 8194
M=D // 8195
@51 // 8196
D=A // 8197
@SP // 8198
AM=M+1 // 8199
A=A-1 // 8200
M=D // 8201
@51 // 8202
D=A // 8203
@SP // 8204
AM=M+1 // 8205
A=A-1 // 8206
M=D // 8207
@51 // 8208
D=A // 8209
@SP // 8210
AM=M+1 // 8211
A=A-1 // 8212
M=D // 8213
@51 // 8214
D=A // 8215
@SP // 8216
AM=M+1 // 8217
A=A-1 // 8218
M=D // 8219
@51 // 8220
D=A // 8221
@SP // 8222
AM=M+1 // 8223
A=A-1 // 8224
M=D // 8225
@30 // 8226
D=A // 8227
@SP // 8228
AM=M+1 // 8229
A=A-1 // 8230
M=D // 8231
@SP // 8232
AM=M+1 // 8233
A=A-1 // 8234
M=0 // 8235
@SP // 8236
AM=M+1 // 8237
A=A-1 // 8238
M=0 // 8239
// call Output.create
@17 // 8240
D=A // 8241
@14 // 8242
M=D // 8243
@Output.create // 8244
D=A // 8245
@13 // 8246
M=D // 8247
@Output.initMap.ret.55 // 8248
D=A // 8249
@CALL // 8250
0;JMP // 8251
(Output.initMap.ret.55)
@SP // 8252
M=M-1 // 8253

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8254
D=A // 8255
@SP // 8256
AM=M+1 // 8257
A=A-1 // 8258
M=D // 8259
@51 // 8260
D=A // 8261
@SP // 8262
AM=M+1 // 8263
A=A-1 // 8264
M=D // 8265
@51 // 8266
D=A // 8267
@SP // 8268
AM=M+1 // 8269
A=A-1 // 8270
M=D // 8271
@51 // 8272
D=A // 8273
@SP // 8274
AM=M+1 // 8275
A=A-1 // 8276
M=D // 8277
@51 // 8278
D=A // 8279
@SP // 8280
AM=M+1 // 8281
A=A-1 // 8282
M=D // 8283
@51 // 8284
D=A // 8285
@SP // 8286
AM=M+1 // 8287
A=A-1 // 8288
M=D // 8289
@30 // 8290
D=A // 8291
@SP // 8292
AM=M+1 // 8293
A=A-1 // 8294
M=D // 8295
@30 // 8296
D=A // 8297
@SP // 8298
AM=M+1 // 8299
A=A-1 // 8300
M=D // 8301
@12 // 8302
D=A // 8303
@SP // 8304
AM=M+1 // 8305
A=A-1 // 8306
M=D // 8307
@12 // 8308
D=A // 8309
@SP // 8310
AM=M+1 // 8311
A=A-1 // 8312
M=D // 8313
@SP // 8314
AM=M+1 // 8315
A=A-1 // 8316
M=0 // 8317
@SP // 8318
AM=M+1 // 8319
A=A-1 // 8320
M=0 // 8321
// call Output.create
@17 // 8322
D=A // 8323
@14 // 8324
M=D // 8325
@Output.create // 8326
D=A // 8327
@13 // 8328
M=D // 8329
@Output.initMap.ret.56 // 8330
D=A // 8331
@CALL // 8332
0;JMP // 8333
(Output.initMap.ret.56)
@SP // 8334
M=M-1 // 8335

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8336
D=A // 8337
@SP // 8338
AM=M+1 // 8339
A=A-1 // 8340
M=D // 8341
@51 // 8342
D=A // 8343
@SP // 8344
AM=M+1 // 8345
A=A-1 // 8346
M=D // 8347
@51 // 8348
D=A // 8349
@SP // 8350
AM=M+1 // 8351
A=A-1 // 8352
M=D // 8353
@51 // 8354
D=A // 8355
@SP // 8356
AM=M+1 // 8357
A=A-1 // 8358
M=D // 8359
@51 // 8360
D=A // 8361
@SP // 8362
AM=M+1 // 8363
A=A-1 // 8364
M=D // 8365
@51 // 8366
D=A // 8367
@SP // 8368
AM=M+1 // 8369
A=A-1 // 8370
M=D // 8371
@63 // 8372
D=A // 8373
@SP // 8374
AM=M+1 // 8375
A=A-1 // 8376
M=D // 8377
@63 // 8378
D=A // 8379
@SP // 8380
AM=M+1 // 8381
A=A-1 // 8382
M=D // 8383
@63 // 8384
D=A // 8385
@SP // 8386
AM=M+1 // 8387
A=A-1 // 8388
M=D // 8389
@18 // 8390
D=A // 8391
@SP // 8392
AM=M+1 // 8393
A=A-1 // 8394
M=D // 8395
@SP // 8396
AM=M+1 // 8397
A=A-1 // 8398
M=0 // 8399
@SP // 8400
AM=M+1 // 8401
A=A-1 // 8402
M=0 // 8403
// call Output.create
@17 // 8404
D=A // 8405
@14 // 8406
M=D // 8407
@Output.create // 8408
D=A // 8409
@13 // 8410
M=D // 8411
@Output.initMap.ret.57 // 8412
D=A // 8413
@CALL // 8414
0;JMP // 8415
(Output.initMap.ret.57)
@SP // 8416
M=M-1 // 8417

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8418
D=A // 8419
@SP // 8420
AM=M+1 // 8421
A=A-1 // 8422
M=D // 8423
@51 // 8424
D=A // 8425
@SP // 8426
AM=M+1 // 8427
A=A-1 // 8428
M=D // 8429
@51 // 8430
D=A // 8431
@SP // 8432
AM=M+1 // 8433
A=A-1 // 8434
M=D // 8435
@30 // 8436
D=A // 8437
@SP // 8438
AM=M+1 // 8439
A=A-1 // 8440
M=D // 8441
@30 // 8442
D=A // 8443
@SP // 8444
AM=M+1 // 8445
A=A-1 // 8446
M=D // 8447
@12 // 8448
D=A // 8449
@SP // 8450
AM=M+1 // 8451
A=A-1 // 8452
M=D // 8453
@30 // 8454
D=A // 8455
@SP // 8456
AM=M+1 // 8457
A=A-1 // 8458
M=D // 8459
@30 // 8460
D=A // 8461
@SP // 8462
AM=M+1 // 8463
A=A-1 // 8464
M=D // 8465
@51 // 8466
D=A // 8467
@SP // 8468
AM=M+1 // 8469
A=A-1 // 8470
M=D // 8471
@51 // 8472
D=A // 8473
@SP // 8474
AM=M+1 // 8475
A=A-1 // 8476
M=D // 8477
@SP // 8478
AM=M+1 // 8479
A=A-1 // 8480
M=0 // 8481
@SP // 8482
AM=M+1 // 8483
A=A-1 // 8484
M=0 // 8485
// call Output.create
@17 // 8486
D=A // 8487
@14 // 8488
M=D // 8489
@Output.create // 8490
D=A // 8491
@13 // 8492
M=D // 8493
@Output.initMap.ret.58 // 8494
D=A // 8495
@CALL // 8496
0;JMP // 8497
(Output.initMap.ret.58)
@SP // 8498
M=M-1 // 8499

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8500
D=A // 8501
@SP // 8502
AM=M+1 // 8503
A=A-1 // 8504
M=D // 8505
@51 // 8506
D=A // 8507
@SP // 8508
AM=M+1 // 8509
A=A-1 // 8510
M=D // 8511
@51 // 8512
D=A // 8513
@SP // 8514
AM=M+1 // 8515
A=A-1 // 8516
M=D // 8517
@51 // 8518
D=A // 8519
@SP // 8520
AM=M+1 // 8521
A=A-1 // 8522
M=D // 8523
@51 // 8524
D=A // 8525
@SP // 8526
AM=M+1 // 8527
A=A-1 // 8528
M=D // 8529
@30 // 8530
D=A // 8531
@SP // 8532
AM=M+1 // 8533
A=A-1 // 8534
M=D // 8535
@12 // 8536
D=A // 8537
@SP // 8538
AM=M+1 // 8539
A=A-1 // 8540
M=D // 8541
@12 // 8542
D=A // 8543
@SP // 8544
AM=M+1 // 8545
A=A-1 // 8546
M=D // 8547
@12 // 8548
D=A // 8549
@SP // 8550
AM=M+1 // 8551
A=A-1 // 8552
M=D // 8553
@30 // 8554
D=A // 8555
@SP // 8556
AM=M+1 // 8557
A=A-1 // 8558
M=D // 8559
@SP // 8560
AM=M+1 // 8561
A=A-1 // 8562
M=0 // 8563
@SP // 8564
AM=M+1 // 8565
A=A-1 // 8566
M=0 // 8567
// call Output.create
@17 // 8568
D=A // 8569
@14 // 8570
M=D // 8571
@Output.create // 8572
D=A // 8573
@13 // 8574
M=D // 8575
@Output.initMap.ret.59 // 8576
D=A // 8577
@CALL // 8578
0;JMP // 8579
(Output.initMap.ret.59)
@SP // 8580
M=M-1 // 8581

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8582
D=A // 8583
@SP // 8584
AM=M+1 // 8585
A=A-1 // 8586
M=D // 8587
@63 // 8588
D=A // 8589
@SP // 8590
AM=M+1 // 8591
A=A-1 // 8592
M=D // 8593
@51 // 8594
D=A // 8595
@SP // 8596
AM=M+1 // 8597
A=A-1 // 8598
M=D // 8599
@49 // 8600
D=A // 8601
@SP // 8602
AM=M+1 // 8603
A=A-1 // 8604
M=D // 8605
@24 // 8606
D=A // 8607
@SP // 8608
AM=M+1 // 8609
A=A-1 // 8610
M=D // 8611
@12 // 8612
D=A // 8613
@SP // 8614
AM=M+1 // 8615
A=A-1 // 8616
M=D // 8617
@6 // 8618
D=A // 8619
@SP // 8620
AM=M+1 // 8621
A=A-1 // 8622
M=D // 8623
@35 // 8624
D=A // 8625
@SP // 8626
AM=M+1 // 8627
A=A-1 // 8628
M=D // 8629
@51 // 8630
D=A // 8631
@SP // 8632
AM=M+1 // 8633
A=A-1 // 8634
M=D // 8635
@63 // 8636
D=A // 8637
@SP // 8638
AM=M+1 // 8639
A=A-1 // 8640
M=D // 8641
@SP // 8642
AM=M+1 // 8643
A=A-1 // 8644
M=0 // 8645
@SP // 8646
AM=M+1 // 8647
A=A-1 // 8648
M=0 // 8649
// call Output.create
@17 // 8650
D=A // 8651
@14 // 8652
M=D // 8653
@Output.create // 8654
D=A // 8655
@13 // 8656
M=D // 8657
@Output.initMap.ret.60 // 8658
D=A // 8659
@CALL // 8660
0;JMP // 8661
(Output.initMap.ret.60)
@SP // 8662
M=M-1 // 8663

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8664
D=A // 8665
@SP // 8666
AM=M+1 // 8667
A=A-1 // 8668
M=D // 8669
@30 // 8670
D=A // 8671
@SP // 8672
AM=M+1 // 8673
A=A-1 // 8674
M=D // 8675
@6 // 8676
D=A // 8677
@SP // 8678
AM=M+1 // 8679
A=A-1 // 8680
M=D // 8681
@6 // 8682
D=A // 8683
@SP // 8684
AM=M+1 // 8685
A=A-1 // 8686
M=D // 8687
@6 // 8688
D=A // 8689
@SP // 8690
AM=M+1 // 8691
A=A-1 // 8692
M=D // 8693
@6 // 8694
D=A // 8695
@SP // 8696
AM=M+1 // 8697
A=A-1 // 8698
M=D // 8699
@6 // 8700
D=A // 8701
@SP // 8702
AM=M+1 // 8703
A=A-1 // 8704
M=D // 8705
@6 // 8706
D=A // 8707
@SP // 8708
AM=M+1 // 8709
A=A-1 // 8710
M=D // 8711
@6 // 8712
D=A // 8713
@SP // 8714
AM=M+1 // 8715
A=A-1 // 8716
M=D // 8717
@30 // 8718
D=A // 8719
@SP // 8720
AM=M+1 // 8721
A=A-1 // 8722
M=D // 8723
@SP // 8724
AM=M+1 // 8725
A=A-1 // 8726
M=0 // 8727
@SP // 8728
AM=M+1 // 8729
A=A-1 // 8730
M=0 // 8731
// call Output.create
@17 // 8732
D=A // 8733
@14 // 8734
M=D // 8735
@Output.create // 8736
D=A // 8737
@13 // 8738
M=D // 8739
@Output.initMap.ret.61 // 8740
D=A // 8741
@CALL // 8742
0;JMP // 8743
(Output.initMap.ret.61)
@SP // 8744
M=M-1 // 8745

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8746
D=A // 8747
@SP // 8748
M=D+M // 8749
@92 // 8750
D=A // 8751
@SP // 8752
A=M-1 // 8753
M=1 // 8754
A=A-1 // 8755
M=0 // 8756
A=A-1 // 8757
M=0 // 8758
A=A-1 // 8759
M=D // 8760
A=A-1 // 8761
@3 // 8762
D=A // 8763
@SP // 8764
AM=M+1 // 8765
A=A-1 // 8766
M=D // 8767
@6 // 8768
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
@24 // 8780
D=A // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=D // 8785
@48 // 8786
D=A // 8787
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=D // 8791
@32 // 8792
D=A // 8793
@SP // 8794
AM=M+1 // 8795
A=A-1 // 8796
M=D // 8797
@SP // 8798
AM=M+1 // 8799
A=A-1 // 8800
M=0 // 8801
@SP // 8802
AM=M+1 // 8803
A=A-1 // 8804
M=0 // 8805
// call Output.create
@17 // 8806
D=A // 8807
@14 // 8808
M=D // 8809
@Output.create // 8810
D=A // 8811
@13 // 8812
M=D // 8813
@Output.initMap.ret.62 // 8814
D=A // 8815
@CALL // 8816
0;JMP // 8817
(Output.initMap.ret.62)
@SP // 8818
M=M-1 // 8819

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 8820
D=A // 8821
@SP // 8822
AM=M+1 // 8823
A=A-1 // 8824
M=D // 8825
@30 // 8826
D=A // 8827
@SP // 8828
AM=M+1 // 8829
A=A-1 // 8830
M=D // 8831
@24 // 8832
D=A // 8833
@SP // 8834
AM=M+1 // 8835
A=A-1 // 8836
M=D // 8837
@24 // 8838
D=A // 8839
@SP // 8840
AM=M+1 // 8841
A=A-1 // 8842
M=D // 8843
@24 // 8844
D=A // 8845
@SP // 8846
AM=M+1 // 8847
A=A-1 // 8848
M=D // 8849
@24 // 8850
D=A // 8851
@SP // 8852
AM=M+1 // 8853
A=A-1 // 8854
M=D // 8855
@24 // 8856
D=A // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=D // 8861
@24 // 8862
D=A // 8863
@SP // 8864
AM=M+1 // 8865
A=A-1 // 8866
M=D // 8867
@24 // 8868
D=A // 8869
@SP // 8870
AM=M+1 // 8871
A=A-1 // 8872
M=D // 8873
@30 // 8874
D=A // 8875
@SP // 8876
AM=M+1 // 8877
A=A-1 // 8878
M=D // 8879
@SP // 8880
AM=M+1 // 8881
A=A-1 // 8882
M=0 // 8883
@SP // 8884
AM=M+1 // 8885
A=A-1 // 8886
M=0 // 8887
// call Output.create
@17 // 8888
D=A // 8889
@14 // 8890
M=D // 8891
@Output.create // 8892
D=A // 8893
@13 // 8894
M=D // 8895
@Output.initMap.ret.63 // 8896
D=A // 8897
@CALL // 8898
0;JMP // 8899
(Output.initMap.ret.63)
@SP // 8900
M=M-1 // 8901

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 8902
D=A // 8903
@SP // 8904
AM=M+1 // 8905
A=A-1 // 8906
M=D // 8907
@8 // 8908
D=A // 8909
@SP // 8910
AM=M+1 // 8911
A=A-1 // 8912
M=D // 8913
@28 // 8914
D=A // 8915
@SP // 8916
AM=M+1 // 8917
A=A-1 // 8918
M=D // 8919
@54 // 8920
D=A // 8921
@SP // 8922
AM=M+1 // 8923
A=A-1 // 8924
M=D // 8925
@SP // 8926
AM=M+1 // 8927
A=A-1 // 8928
M=0 // 8929
@SP // 8930
AM=M+1 // 8931
A=A-1 // 8932
M=0 // 8933
@SP // 8934
AM=M+1 // 8935
A=A-1 // 8936
M=0 // 8937
@SP // 8938
AM=M+1 // 8939
A=A-1 // 8940
M=0 // 8941
@SP // 8942
AM=M+1 // 8943
A=A-1 // 8944
M=0 // 8945
@SP // 8946
AM=M+1 // 8947
A=A-1 // 8948
M=0 // 8949
@SP // 8950
AM=M+1 // 8951
A=A-1 // 8952
M=0 // 8953
@SP // 8954
AM=M+1 // 8955
A=A-1 // 8956
M=0 // 8957
// call Output.create
@17 // 8958
D=A // 8959
@14 // 8960
M=D // 8961
@Output.create // 8962
D=A // 8963
@13 // 8964
M=D // 8965
@Output.initMap.ret.64 // 8966
D=A // 8967
@CALL // 8968
0;JMP // 8969
(Output.initMap.ret.64)
@SP // 8970
M=M-1 // 8971

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 8972
D=A // 8973
@SP // 8974
M=D+M // 8975
@95 // 8976
D=A // 8977
@SP // 8978
A=M-1 // 8979
M=0 // 8980
A=A-1 // 8981
M=0 // 8982
A=A-1 // 8983
M=0 // 8984
A=A-1 // 8985
M=0 // 8986
A=A-1 // 8987
M=0 // 8988
A=A-1 // 8989
M=0 // 8990
A=A-1 // 8991
M=0 // 8992
A=A-1 // 8993
M=0 // 8994
A=A-1 // 8995
M=0 // 8996
A=A-1 // 8997
M=D // 8998
A=A-1 // 8999
@2 // 9000
D=A // 9001
@SP // 9002
M=D+M // 9003
@63 // 9004
D=A // 9005
@SP // 9006
A=M-1 // 9007
M=0 // 9008
A=A-1 // 9009
M=D // 9010
A=A-1 // 9011
// call Output.create
@17 // 9012
D=A // 9013
@14 // 9014
M=D // 9015
@Output.create // 9016
D=A // 9017
@13 // 9018
M=D // 9019
@Output.initMap.ret.65 // 9020
D=A // 9021
@CALL // 9022
0;JMP // 9023
(Output.initMap.ret.65)
@SP // 9024
M=M-1 // 9025

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9026
D=A // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=D // 9031
@6 // 9032
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
@24 // 9044
D=A // 9045
@SP // 9046
AM=M+1 // 9047
A=A-1 // 9048
M=D // 9049
@SP // 9050
AM=M+1 // 9051
A=A-1 // 9052
M=0 // 9053
@SP // 9054
AM=M+1 // 9055
A=A-1 // 9056
M=0 // 9057
@SP // 9058
AM=M+1 // 9059
A=A-1 // 9060
M=0 // 9061
@SP // 9062
AM=M+1 // 9063
A=A-1 // 9064
M=0 // 9065
@SP // 9066
AM=M+1 // 9067
A=A-1 // 9068
M=0 // 9069
@SP // 9070
AM=M+1 // 9071
A=A-1 // 9072
M=0 // 9073
@SP // 9074
AM=M+1 // 9075
A=A-1 // 9076
M=0 // 9077
@SP // 9078
AM=M+1 // 9079
A=A-1 // 9080
M=0 // 9081
// call Output.create
@17 // 9082
D=A // 9083
@14 // 9084
M=D // 9085
@Output.create // 9086
D=A // 9087
@13 // 9088
M=D // 9089
@Output.initMap.ret.66 // 9090
D=A // 9091
@CALL // 9092
0;JMP // 9093
(Output.initMap.ret.66)
@SP // 9094
M=M-1 // 9095

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9096
D=A // 9097
@SP // 9098
M=D+M // 9099
@97 // 9100
D=A // 9101
@SP // 9102
A=M-1 // 9103
M=0 // 9104
A=A-1 // 9105
M=0 // 9106
A=A-1 // 9107
M=0 // 9108
A=A-1 // 9109
M=D // 9110
A=A-1 // 9111
@14 // 9112
D=A // 9113
@SP // 9114
AM=M+1 // 9115
A=A-1 // 9116
M=D // 9117
@24 // 9118
D=A // 9119
@SP // 9120
AM=M+1 // 9121
A=A-1 // 9122
M=D // 9123
@30 // 9124
D=A // 9125
@SP // 9126
AM=M+1 // 9127
A=A-1 // 9128
M=D // 9129
@27 // 9130
D=A // 9131
@SP // 9132
AM=M+1 // 9133
A=A-1 // 9134
M=D // 9135
@27 // 9136
D=A // 9137
@SP // 9138
AM=M+1 // 9139
A=A-1 // 9140
M=D // 9141
@54 // 9142
D=A // 9143
@SP // 9144
AM=M+1 // 9145
A=A-1 // 9146
M=D // 9147
@SP // 9148
AM=M+1 // 9149
A=A-1 // 9150
M=0 // 9151
@SP // 9152
AM=M+1 // 9153
A=A-1 // 9154
M=0 // 9155
// call Output.create
@17 // 9156
D=A // 9157
@14 // 9158
M=D // 9159
@Output.create // 9160
D=A // 9161
@13 // 9162
M=D // 9163
@Output.initMap.ret.67 // 9164
D=A // 9165
@CALL // 9166
0;JMP // 9167
(Output.initMap.ret.67)
@SP // 9168
M=M-1 // 9169

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9170
D=A // 9171
@SP // 9172
AM=M+1 // 9173
A=A-1 // 9174
M=D // 9175
@3 // 9176
D=A // 9177
@SP // 9178
AM=M+1 // 9179
A=A-1 // 9180
M=D // 9181
@3 // 9182
D=A // 9183
@SP // 9184
AM=M+1 // 9185
A=A-1 // 9186
M=D // 9187
@3 // 9188
D=A // 9189
@SP // 9190
AM=M+1 // 9191
A=A-1 // 9192
M=D // 9193
@15 // 9194
D=A // 9195
@SP // 9196
AM=M+1 // 9197
A=A-1 // 9198
M=D // 9199
@27 // 9200
D=A // 9201
@SP // 9202
AM=M+1 // 9203
A=A-1 // 9204
M=D // 9205
@51 // 9206
D=A // 9207
@SP // 9208
AM=M+1 // 9209
A=A-1 // 9210
M=D // 9211
@51 // 9212
D=A // 9213
@SP // 9214
AM=M+1 // 9215
A=A-1 // 9216
M=D // 9217
@51 // 9218
D=A // 9219
@SP // 9220
AM=M+1 // 9221
A=A-1 // 9222
M=D // 9223
@30 // 9224
D=A // 9225
@SP // 9226
AM=M+1 // 9227
A=A-1 // 9228
M=D // 9229
@SP // 9230
AM=M+1 // 9231
A=A-1 // 9232
M=0 // 9233
@SP // 9234
AM=M+1 // 9235
A=A-1 // 9236
M=0 // 9237
// call Output.create
@17 // 9238
D=A // 9239
@14 // 9240
M=D // 9241
@Output.create // 9242
D=A // 9243
@13 // 9244
M=D // 9245
@Output.initMap.ret.68 // 9246
D=A // 9247
@CALL // 9248
0;JMP // 9249
(Output.initMap.ret.68)
@SP // 9250
M=M-1 // 9251

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9252
D=A // 9253
@SP // 9254
M=D+M // 9255
@99 // 9256
D=A // 9257
@SP // 9258
A=M-1 // 9259
M=0 // 9260
A=A-1 // 9261
M=0 // 9262
A=A-1 // 9263
M=0 // 9264
A=A-1 // 9265
M=D // 9266
A=A-1 // 9267
@30 // 9268
D=A // 9269
@SP // 9270
AM=M+1 // 9271
A=A-1 // 9272
M=D // 9273
@51 // 9274
D=A // 9275
@SP // 9276
AM=M+1 // 9277
A=A-1 // 9278
M=D // 9279
@3 // 9280
D=A // 9281
@SP // 9282
AM=M+1 // 9283
A=A-1 // 9284
M=D // 9285
@3 // 9286
D=A // 9287
@SP // 9288
AM=M+1 // 9289
A=A-1 // 9290
M=D // 9291
@51 // 9292
D=A // 9293
@SP // 9294
AM=M+1 // 9295
A=A-1 // 9296
M=D // 9297
@30 // 9298
D=A // 9299
@SP // 9300
AM=M+1 // 9301
A=A-1 // 9302
M=D // 9303
@SP // 9304
AM=M+1 // 9305
A=A-1 // 9306
M=0 // 9307
@SP // 9308
AM=M+1 // 9309
A=A-1 // 9310
M=0 // 9311
// call Output.create
@17 // 9312
D=A // 9313
@14 // 9314
M=D // 9315
@Output.create // 9316
D=A // 9317
@13 // 9318
M=D // 9319
@Output.initMap.ret.69 // 9320
D=A // 9321
@CALL // 9322
0;JMP // 9323
(Output.initMap.ret.69)
@SP // 9324
M=M-1 // 9325

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9326
D=A // 9327
@SP // 9328
AM=M+1 // 9329
A=A-1 // 9330
M=D // 9331
@48 // 9332
D=A // 9333
@SP // 9334
AM=M+1 // 9335
A=A-1 // 9336
M=D // 9337
@48 // 9338
D=A // 9339
@SP // 9340
AM=M+1 // 9341
A=A-1 // 9342
M=D // 9343
@48 // 9344
D=A // 9345
@SP // 9346
AM=M+1 // 9347
A=A-1 // 9348
M=D // 9349
@60 // 9350
D=A // 9351
@SP // 9352
AM=M+1 // 9353
A=A-1 // 9354
M=D // 9355
@54 // 9356
D=A // 9357
@SP // 9358
AM=M+1 // 9359
A=A-1 // 9360
M=D // 9361
@51 // 9362
D=A // 9363
@SP // 9364
AM=M+1 // 9365
A=A-1 // 9366
M=D // 9367
@51 // 9368
D=A // 9369
@SP // 9370
AM=M+1 // 9371
A=A-1 // 9372
M=D // 9373
@51 // 9374
D=A // 9375
@SP // 9376
AM=M+1 // 9377
A=A-1 // 9378
M=D // 9379
@30 // 9380
D=A // 9381
@SP // 9382
AM=M+1 // 9383
A=A-1 // 9384
M=D // 9385
@SP // 9386
AM=M+1 // 9387
A=A-1 // 9388
M=0 // 9389
@SP // 9390
AM=M+1 // 9391
A=A-1 // 9392
M=0 // 9393
// call Output.create
@17 // 9394
D=A // 9395
@14 // 9396
M=D // 9397
@Output.create // 9398
D=A // 9399
@13 // 9400
M=D // 9401
@Output.initMap.ret.70 // 9402
D=A // 9403
@CALL // 9404
0;JMP // 9405
(Output.initMap.ret.70)
@SP // 9406
M=M-1 // 9407

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9408
D=A // 9409
@SP // 9410
M=D+M // 9411
@101 // 9412
D=A // 9413
@SP // 9414
A=M-1 // 9415
M=0 // 9416
A=A-1 // 9417
M=0 // 9418
A=A-1 // 9419
M=0 // 9420
A=A-1 // 9421
M=D // 9422
A=A-1 // 9423
@30 // 9424
D=A // 9425
@SP // 9426
AM=M+1 // 9427
A=A-1 // 9428
M=D // 9429
@51 // 9430
D=A // 9431
@SP // 9432
AM=M+1 // 9433
A=A-1 // 9434
M=D // 9435
@63 // 9436
D=A // 9437
@SP // 9438
AM=M+1 // 9439
A=A-1 // 9440
M=D // 9441
@3 // 9442
D=A // 9443
@SP // 9444
AM=M+1 // 9445
A=A-1 // 9446
M=D // 9447
@51 // 9448
D=A // 9449
@SP // 9450
AM=M+1 // 9451
A=A-1 // 9452
M=D // 9453
@30 // 9454
D=A // 9455
@SP // 9456
AM=M+1 // 9457
A=A-1 // 9458
M=D // 9459
@SP // 9460
AM=M+1 // 9461
A=A-1 // 9462
M=0 // 9463
@SP // 9464
AM=M+1 // 9465
A=A-1 // 9466
M=0 // 9467
// call Output.create
@17 // 9468
D=A // 9469
@14 // 9470
M=D // 9471
@Output.create // 9472
D=A // 9473
@13 // 9474
M=D // 9475
@Output.initMap.ret.71 // 9476
D=A // 9477
@CALL // 9478
0;JMP // 9479
(Output.initMap.ret.71)
@SP // 9480
M=M-1 // 9481

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9482
D=A // 9483
@SP // 9484
AM=M+1 // 9485
A=A-1 // 9486
M=D // 9487
@28 // 9488
D=A // 9489
@SP // 9490
AM=M+1 // 9491
A=A-1 // 9492
M=D // 9493
@54 // 9494
D=A // 9495
@SP // 9496
AM=M+1 // 9497
A=A-1 // 9498
M=D // 9499
@38 // 9500
D=A // 9501
@SP // 9502
AM=M+1 // 9503
A=A-1 // 9504
M=D // 9505
@6 // 9506
D=A // 9507
@SP // 9508
AM=M+1 // 9509
A=A-1 // 9510
M=D // 9511
@15 // 9512
D=A // 9513
@SP // 9514
AM=M+1 // 9515
A=A-1 // 9516
M=D // 9517
@6 // 9518
D=A // 9519
@SP // 9520
AM=M+1 // 9521
A=A-1 // 9522
M=D // 9523
@6 // 9524
D=A // 9525
@SP // 9526
AM=M+1 // 9527
A=A-1 // 9528
M=D // 9529
@6 // 9530
D=A // 9531
@SP // 9532
AM=M+1 // 9533
A=A-1 // 9534
M=D // 9535
@15 // 9536
D=A // 9537
@SP // 9538
AM=M+1 // 9539
A=A-1 // 9540
M=D // 9541
@SP // 9542
AM=M+1 // 9543
A=A-1 // 9544
M=0 // 9545
@SP // 9546
AM=M+1 // 9547
A=A-1 // 9548
M=0 // 9549
// call Output.create
@17 // 9550
D=A // 9551
@14 // 9552
M=D // 9553
@Output.create // 9554
D=A // 9555
@13 // 9556
M=D // 9557
@Output.initMap.ret.72 // 9558
D=A // 9559
@CALL // 9560
0;JMP // 9561
(Output.initMap.ret.72)
@SP // 9562
M=M-1 // 9563

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9564
D=A // 9565
@SP // 9566
M=D+M // 9567
@103 // 9568
D=A // 9569
@SP // 9570
A=M-1 // 9571
M=0 // 9572
A=A-1 // 9573
M=0 // 9574
A=A-1 // 9575
M=D // 9576
A=A-1 // 9577
@30 // 9578
D=A // 9579
@SP // 9580
AM=M+1 // 9581
A=A-1 // 9582
M=D // 9583
@51 // 9584
D=A // 9585
@SP // 9586
AM=M+1 // 9587
A=A-1 // 9588
M=D // 9589
@51 // 9590
D=A // 9591
@SP // 9592
AM=M+1 // 9593
A=A-1 // 9594
M=D // 9595
@51 // 9596
D=A // 9597
@SP // 9598
AM=M+1 // 9599
A=A-1 // 9600
M=D // 9601
@62 // 9602
D=A // 9603
@SP // 9604
AM=M+1 // 9605
A=A-1 // 9606
M=D // 9607
@48 // 9608
D=A // 9609
@SP // 9610
AM=M+1 // 9611
A=A-1 // 9612
M=D // 9613
@51 // 9614
D=A // 9615
@SP // 9616
AM=M+1 // 9617
A=A-1 // 9618
M=D // 9619
@30 // 9620
D=A // 9621
@SP // 9622
AM=M+1 // 9623
A=A-1 // 9624
M=D // 9625
@SP // 9626
AM=M+1 // 9627
A=A-1 // 9628
M=0 // 9629
// call Output.create
@17 // 9630
D=A // 9631
@14 // 9632
M=D // 9633
@Output.create // 9634
D=A // 9635
@13 // 9636
M=D // 9637
@Output.initMap.ret.73 // 9638
D=A // 9639
@CALL // 9640
0;JMP // 9641
(Output.initMap.ret.73)
@SP // 9642
M=M-1 // 9643

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9644
D=A // 9645
@SP // 9646
AM=M+1 // 9647
A=A-1 // 9648
M=D // 9649
@3 // 9650
D=A // 9651
@SP // 9652
AM=M+1 // 9653
A=A-1 // 9654
M=D // 9655
@3 // 9656
D=A // 9657
@SP // 9658
AM=M+1 // 9659
A=A-1 // 9660
M=D // 9661
@3 // 9662
D=A // 9663
@SP // 9664
AM=M+1 // 9665
A=A-1 // 9666
M=D // 9667
@27 // 9668
D=A // 9669
@SP // 9670
AM=M+1 // 9671
A=A-1 // 9672
M=D // 9673
@55 // 9674
D=A // 9675
@SP // 9676
AM=M+1 // 9677
A=A-1 // 9678
M=D // 9679
@51 // 9680
D=A // 9681
@SP // 9682
AM=M+1 // 9683
A=A-1 // 9684
M=D // 9685
@51 // 9686
D=A // 9687
@SP // 9688
AM=M+1 // 9689
A=A-1 // 9690
M=D // 9691
@51 // 9692
D=A // 9693
@SP // 9694
AM=M+1 // 9695
A=A-1 // 9696
M=D // 9697
@51 // 9698
D=A // 9699
@SP // 9700
AM=M+1 // 9701
A=A-1 // 9702
M=D // 9703
@SP // 9704
AM=M+1 // 9705
A=A-1 // 9706
M=0 // 9707
@SP // 9708
AM=M+1 // 9709
A=A-1 // 9710
M=0 // 9711
// call Output.create
@17 // 9712
D=A // 9713
@14 // 9714
M=D // 9715
@Output.create // 9716
D=A // 9717
@13 // 9718
M=D // 9719
@Output.initMap.ret.74 // 9720
D=A // 9721
@CALL // 9722
0;JMP // 9723
(Output.initMap.ret.74)
@SP // 9724
M=M-1 // 9725

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9726
D=A // 9727
@SP // 9728
AM=M+1 // 9729
A=A-1 // 9730
M=D // 9731
@12 // 9732
D=A // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=D // 9737
@12 // 9738
D=A // 9739
@SP // 9740
AM=M+1 // 9741
A=A-1 // 9742
M=D // 9743
@SP // 9744
AM=M+1 // 9745
A=A-1 // 9746
M=0 // 9747
@14 // 9748
D=A // 9749
@SP // 9750
AM=M+1 // 9751
A=A-1 // 9752
M=D // 9753
@12 // 9754
D=A // 9755
@SP // 9756
AM=M+1 // 9757
A=A-1 // 9758
M=D // 9759
@12 // 9760
D=A // 9761
@SP // 9762
AM=M+1 // 9763
A=A-1 // 9764
M=D // 9765
@12 // 9766
D=A // 9767
@SP // 9768
AM=M+1 // 9769
A=A-1 // 9770
M=D // 9771
@12 // 9772
D=A // 9773
@SP // 9774
AM=M+1 // 9775
A=A-1 // 9776
M=D // 9777
@30 // 9778
D=A // 9779
@SP // 9780
AM=M+1 // 9781
A=A-1 // 9782
M=D // 9783
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
@Output.initMap.ret.75 // 9800
D=A // 9801
@CALL // 9802
0;JMP // 9803
(Output.initMap.ret.75)
@SP // 9804
M=M-1 // 9805

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 9806
D=A // 9807
@SP // 9808
AM=M+1 // 9809
A=A-1 // 9810
M=D // 9811
@48 // 9812
D=A // 9813
@SP // 9814
AM=M+1 // 9815
A=A-1 // 9816
M=D // 9817
@48 // 9818
D=A // 9819
@SP // 9820
AM=M+1 // 9821
A=A-1 // 9822
M=D // 9823
@SP // 9824
AM=M+1 // 9825
A=A-1 // 9826
M=0 // 9827
@56 // 9828
D=A // 9829
@SP // 9830
AM=M+1 // 9831
A=A-1 // 9832
M=D // 9833
@48 // 9834
D=A // 9835
@SP // 9836
AM=M+1 // 9837
A=A-1 // 9838
M=D // 9839
@48 // 9840
D=A // 9841
@SP // 9842
AM=M+1 // 9843
A=A-1 // 9844
M=D // 9845
@48 // 9846
D=A // 9847
@SP // 9848
AM=M+1 // 9849
A=A-1 // 9850
M=D // 9851
@48 // 9852
D=A // 9853
@SP // 9854
AM=M+1 // 9855
A=A-1 // 9856
M=D // 9857
@51 // 9858
D=A // 9859
@SP // 9860
AM=M+1 // 9861
A=A-1 // 9862
M=D // 9863
@30 // 9864
D=A // 9865
@SP // 9866
AM=M+1 // 9867
A=A-1 // 9868
M=D // 9869
@SP // 9870
AM=M+1 // 9871
A=A-1 // 9872
M=0 // 9873
// call Output.create
@17 // 9874
D=A // 9875
@14 // 9876
M=D // 9877
@Output.create // 9878
D=A // 9879
@13 // 9880
M=D // 9881
@Output.initMap.ret.76 // 9882
D=A // 9883
@CALL // 9884
0;JMP // 9885
(Output.initMap.ret.76)
@SP // 9886
M=M-1 // 9887

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 9888
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
@51 // 9912
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
@15 // 9924
D=A // 9925
@SP // 9926
AM=M+1 // 9927
A=A-1 // 9928
M=D // 9929
@15 // 9930
D=A // 9931
@SP // 9932
AM=M+1 // 9933
A=A-1 // 9934
M=D // 9935
@27 // 9936
D=A // 9937
@SP // 9938
AM=M+1 // 9939
A=A-1 // 9940
M=D // 9941
@51 // 9942
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
@Output.initMap.ret.77 // 9964
D=A // 9965
@CALL // 9966
0;JMP // 9967
(Output.initMap.ret.77)
@SP // 9968
M=M-1 // 9969

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 9970
D=A // 9971
@SP // 9972
AM=M+1 // 9973
A=A-1 // 9974
M=D // 9975
@14 // 9976
D=A // 9977
@SP // 9978
AM=M+1 // 9979
A=A-1 // 9980
M=D // 9981
@12 // 9982
D=A // 9983
@SP // 9984
AM=M+1 // 9985
A=A-1 // 9986
M=D // 9987
@12 // 9988
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
@12 // 10000
D=A // 10001
@SP // 10002
AM=M+1 // 10003
A=A-1 // 10004
M=D // 10005
@12 // 10006
D=A // 10007
@SP // 10008
AM=M+1 // 10009
A=A-1 // 10010
M=D // 10011
@12 // 10012
D=A // 10013
@SP // 10014
AM=M+1 // 10015
A=A-1 // 10016
M=D // 10017
@12 // 10018
D=A // 10019
@SP // 10020
AM=M+1 // 10021
A=A-1 // 10022
M=D // 10023
@30 // 10024
D=A // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=D // 10029
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
@Output.initMap.ret.78 // 10046
D=A // 10047
@CALL // 10048
0;JMP // 10049
(Output.initMap.ret.78)
@SP // 10050
M=M-1 // 10051

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10052
D=A // 10053
@SP // 10054
M=D+M // 10055
@109 // 10056
D=A // 10057
@SP // 10058
A=M-1 // 10059
M=0 // 10060
A=A-1 // 10061
M=0 // 10062
A=A-1 // 10063
M=0 // 10064
A=A-1 // 10065
M=D // 10066
A=A-1 // 10067
@29 // 10068
D=A // 10069
@SP // 10070
AM=M+1 // 10071
A=A-1 // 10072
M=D // 10073
@63 // 10074
D=A // 10075
@SP // 10076
AM=M+1 // 10077
A=A-1 // 10078
M=D // 10079
@43 // 10080
D=A // 10081
@SP // 10082
AM=M+1 // 10083
A=A-1 // 10084
M=D // 10085
@43 // 10086
D=A // 10087
@SP // 10088
AM=M+1 // 10089
A=A-1 // 10090
M=D // 10091
@43 // 10092
D=A // 10093
@SP // 10094
AM=M+1 // 10095
A=A-1 // 10096
M=D // 10097
@43 // 10098
D=A // 10099
@SP // 10100
AM=M+1 // 10101
A=A-1 // 10102
M=D // 10103
@SP // 10104
AM=M+1 // 10105
A=A-1 // 10106
M=0 // 10107
@SP // 10108
AM=M+1 // 10109
A=A-1 // 10110
M=0 // 10111
// call Output.create
@17 // 10112
D=A // 10113
@14 // 10114
M=D // 10115
@Output.create // 10116
D=A // 10117
@13 // 10118
M=D // 10119
@Output.initMap.ret.79 // 10120
D=A // 10121
@CALL // 10122
0;JMP // 10123
(Output.initMap.ret.79)
@SP // 10124
M=M-1 // 10125

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10126
D=A // 10127
@SP // 10128
M=D+M // 10129
@110 // 10130
D=A // 10131
@SP // 10132
A=M-1 // 10133
M=0 // 10134
A=A-1 // 10135
M=0 // 10136
A=A-1 // 10137
M=0 // 10138
A=A-1 // 10139
M=D // 10140
A=A-1 // 10141
@29 // 10142
D=A // 10143
@SP // 10144
AM=M+1 // 10145
A=A-1 // 10146
M=D // 10147
@51 // 10148
D=A // 10149
@SP // 10150
AM=M+1 // 10151
A=A-1 // 10152
M=D // 10153
@51 // 10154
D=A // 10155
@SP // 10156
AM=M+1 // 10157
A=A-1 // 10158
M=D // 10159
@51 // 10160
D=A // 10161
@SP // 10162
AM=M+1 // 10163
A=A-1 // 10164
M=D // 10165
@51 // 10166
D=A // 10167
@SP // 10168
AM=M+1 // 10169
A=A-1 // 10170
M=D // 10171
@51 // 10172
D=A // 10173
@SP // 10174
AM=M+1 // 10175
A=A-1 // 10176
M=D // 10177
@SP // 10178
AM=M+1 // 10179
A=A-1 // 10180
M=0 // 10181
@SP // 10182
AM=M+1 // 10183
A=A-1 // 10184
M=0 // 10185
// call Output.create
@17 // 10186
D=A // 10187
@14 // 10188
M=D // 10189
@Output.create // 10190
D=A // 10191
@13 // 10192
M=D // 10193
@Output.initMap.ret.80 // 10194
D=A // 10195
@CALL // 10196
0;JMP // 10197
(Output.initMap.ret.80)
@SP // 10198
M=M-1 // 10199

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10200
D=A // 10201
@SP // 10202
M=D+M // 10203
@111 // 10204
D=A // 10205
@SP // 10206
A=M-1 // 10207
M=0 // 10208
A=A-1 // 10209
M=0 // 10210
A=A-1 // 10211
M=0 // 10212
A=A-1 // 10213
M=D // 10214
A=A-1 // 10215
@30 // 10216
D=A // 10217
@SP // 10218
AM=M+1 // 10219
A=A-1 // 10220
M=D // 10221
@51 // 10222
D=A // 10223
@SP // 10224
AM=M+1 // 10225
A=A-1 // 10226
M=D // 10227
@51 // 10228
D=A // 10229
@SP // 10230
AM=M+1 // 10231
A=A-1 // 10232
M=D // 10233
@51 // 10234
D=A // 10235
@SP // 10236
AM=M+1 // 10237
A=A-1 // 10238
M=D // 10239
@51 // 10240
D=A // 10241
@SP // 10242
AM=M+1 // 10243
A=A-1 // 10244
M=D // 10245
@30 // 10246
D=A // 10247
@SP // 10248
AM=M+1 // 10249
A=A-1 // 10250
M=D // 10251
@SP // 10252
AM=M+1 // 10253
A=A-1 // 10254
M=0 // 10255
@SP // 10256
AM=M+1 // 10257
A=A-1 // 10258
M=0 // 10259
// call Output.create
@17 // 10260
D=A // 10261
@14 // 10262
M=D // 10263
@Output.create // 10264
D=A // 10265
@13 // 10266
M=D // 10267
@Output.initMap.ret.81 // 10268
D=A // 10269
@CALL // 10270
0;JMP // 10271
(Output.initMap.ret.81)
@SP // 10272
M=M-1 // 10273

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10274
D=A // 10275
@SP // 10276
M=D+M // 10277
@112 // 10278
D=A // 10279
@SP // 10280
A=M-1 // 10281
M=0 // 10282
A=A-1 // 10283
M=0 // 10284
A=A-1 // 10285
M=0 // 10286
A=A-1 // 10287
M=D // 10288
A=A-1 // 10289
@30 // 10290
D=A // 10291
@SP // 10292
AM=M+1 // 10293
A=A-1 // 10294
M=D // 10295
@51 // 10296
D=A // 10297
@SP // 10298
AM=M+1 // 10299
A=A-1 // 10300
M=D // 10301
@51 // 10302
D=A // 10303
@SP // 10304
AM=M+1 // 10305
A=A-1 // 10306
M=D // 10307
@51 // 10308
D=A // 10309
@SP // 10310
AM=M+1 // 10311
A=A-1 // 10312
M=D // 10313
@31 // 10314
D=A // 10315
@SP // 10316
AM=M+1 // 10317
A=A-1 // 10318
M=D // 10319
@3 // 10320
D=A // 10321
@SP // 10322
AM=M+1 // 10323
A=A-1 // 10324
M=D // 10325
@3 // 10326
D=A // 10327
@SP // 10328
AM=M+1 // 10329
A=A-1 // 10330
M=D // 10331
@SP // 10332
AM=M+1 // 10333
A=A-1 // 10334
M=0 // 10335
// call Output.create
@17 // 10336
D=A // 10337
@14 // 10338
M=D // 10339
@Output.create // 10340
D=A // 10341
@13 // 10342
M=D // 10343
@Output.initMap.ret.82 // 10344
D=A // 10345
@CALL // 10346
0;JMP // 10347
(Output.initMap.ret.82)
@SP // 10348
M=M-1 // 10349

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10350
D=A // 10351
@SP // 10352
M=D+M // 10353
@113 // 10354
D=A // 10355
@SP // 10356
A=M-1 // 10357
M=0 // 10358
A=A-1 // 10359
M=0 // 10360
A=A-1 // 10361
M=0 // 10362
A=A-1 // 10363
M=D // 10364
A=A-1 // 10365
@30 // 10366
D=A // 10367
@SP // 10368
AM=M+1 // 10369
A=A-1 // 10370
M=D // 10371
@51 // 10372
D=A // 10373
@SP // 10374
AM=M+1 // 10375
A=A-1 // 10376
M=D // 10377
@51 // 10378
D=A // 10379
@SP // 10380
AM=M+1 // 10381
A=A-1 // 10382
M=D // 10383
@51 // 10384
D=A // 10385
@SP // 10386
AM=M+1 // 10387
A=A-1 // 10388
M=D // 10389
@62 // 10390
D=A // 10391
@SP // 10392
AM=M+1 // 10393
A=A-1 // 10394
M=D // 10395
@48 // 10396
D=A // 10397
@SP // 10398
AM=M+1 // 10399
A=A-1 // 10400
M=D // 10401
@48 // 10402
D=A // 10403
@SP // 10404
AM=M+1 // 10405
A=A-1 // 10406
M=D // 10407
@SP // 10408
AM=M+1 // 10409
A=A-1 // 10410
M=0 // 10411
// call Output.create
@17 // 10412
D=A // 10413
@14 // 10414
M=D // 10415
@Output.create // 10416
D=A // 10417
@13 // 10418
M=D // 10419
@Output.initMap.ret.83 // 10420
D=A // 10421
@CALL // 10422
0;JMP // 10423
(Output.initMap.ret.83)
@SP // 10424
M=M-1 // 10425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10426
D=A // 10427
@SP // 10428
M=D+M // 10429
@114 // 10430
D=A // 10431
@SP // 10432
A=M-1 // 10433
M=0 // 10434
A=A-1 // 10435
M=0 // 10436
A=A-1 // 10437
M=0 // 10438
A=A-1 // 10439
M=D // 10440
A=A-1 // 10441
@29 // 10442
D=A // 10443
@SP // 10444
AM=M+1 // 10445
A=A-1 // 10446
M=D // 10447
@55 // 10448
D=A // 10449
@SP // 10450
AM=M+1 // 10451
A=A-1 // 10452
M=D // 10453
@51 // 10454
D=A // 10455
@SP // 10456
AM=M+1 // 10457
A=A-1 // 10458
M=D // 10459
@3 // 10460
D=A // 10461
@SP // 10462
AM=M+1 // 10463
A=A-1 // 10464
M=D // 10465
@3 // 10466
D=A // 10467
@SP // 10468
AM=M+1 // 10469
A=A-1 // 10470
M=D // 10471
@7 // 10472
D=A // 10473
@SP // 10474
AM=M+1 // 10475
A=A-1 // 10476
M=D // 10477
@SP // 10478
AM=M+1 // 10479
A=A-1 // 10480
M=0 // 10481
@SP // 10482
AM=M+1 // 10483
A=A-1 // 10484
M=0 // 10485
// call Output.create
@17 // 10486
D=A // 10487
@14 // 10488
M=D // 10489
@Output.create // 10490
D=A // 10491
@13 // 10492
M=D // 10493
@Output.initMap.ret.84 // 10494
D=A // 10495
@CALL // 10496
0;JMP // 10497
(Output.initMap.ret.84)
@SP // 10498
M=M-1 // 10499

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10500
D=A // 10501
@SP // 10502
M=D+M // 10503
@115 // 10504
D=A // 10505
@SP // 10506
A=M-1 // 10507
M=0 // 10508
A=A-1 // 10509
M=0 // 10510
A=A-1 // 10511
M=0 // 10512
A=A-1 // 10513
M=D // 10514
A=A-1 // 10515
@30 // 10516
D=A // 10517
@SP // 10518
AM=M+1 // 10519
A=A-1 // 10520
M=D // 10521
@51 // 10522
D=A // 10523
@SP // 10524
AM=M+1 // 10525
A=A-1 // 10526
M=D // 10527
@6 // 10528
D=A // 10529
@SP // 10530
AM=M+1 // 10531
A=A-1 // 10532
M=D // 10533
@24 // 10534
D=A // 10535
@SP // 10536
AM=M+1 // 10537
A=A-1 // 10538
M=D // 10539
@51 // 10540
D=A // 10541
@SP // 10542
AM=M+1 // 10543
A=A-1 // 10544
M=D // 10545
@30 // 10546
D=A // 10547
@SP // 10548
AM=M+1 // 10549
A=A-1 // 10550
M=D // 10551
@SP // 10552
AM=M+1 // 10553
A=A-1 // 10554
M=0 // 10555
@SP // 10556
AM=M+1 // 10557
A=A-1 // 10558
M=0 // 10559
// call Output.create
@17 // 10560
D=A // 10561
@14 // 10562
M=D // 10563
@Output.create // 10564
D=A // 10565
@13 // 10566
M=D // 10567
@Output.initMap.ret.85 // 10568
D=A // 10569
@CALL // 10570
0;JMP // 10571
(Output.initMap.ret.85)
@SP // 10572
M=M-1 // 10573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10574
D=A // 10575
@SP // 10576
AM=M+1 // 10577
A=A-1 // 10578
M=D // 10579
@4 // 10580
D=A // 10581
@SP // 10582
AM=M+1 // 10583
A=A-1 // 10584
M=D // 10585
@6 // 10586
D=A // 10587
@SP // 10588
AM=M+1 // 10589
A=A-1 // 10590
M=D // 10591
@6 // 10592
D=A // 10593
@SP // 10594
AM=M+1 // 10595
A=A-1 // 10596
M=D // 10597
@15 // 10598
D=A // 10599
@SP // 10600
AM=M+1 // 10601
A=A-1 // 10602
M=D // 10603
@6 // 10604
D=A // 10605
@SP // 10606
AM=M+1 // 10607
A=A-1 // 10608
M=D // 10609
@6 // 10610
D=A // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=D // 10615
@6 // 10616
D=A // 10617
@SP // 10618
AM=M+1 // 10619
A=A-1 // 10620
M=D // 10621
@54 // 10622
D=A // 10623
@SP // 10624
AM=M+1 // 10625
A=A-1 // 10626
M=D // 10627
@28 // 10628
D=A // 10629
@SP // 10630
AM=M+1 // 10631
A=A-1 // 10632
M=D // 10633
@SP // 10634
AM=M+1 // 10635
A=A-1 // 10636
M=0 // 10637
@SP // 10638
AM=M+1 // 10639
A=A-1 // 10640
M=0 // 10641
// call Output.create
@17 // 10642
D=A // 10643
@14 // 10644
M=D // 10645
@Output.create // 10646
D=A // 10647
@13 // 10648
M=D // 10649
@Output.initMap.ret.86 // 10650
D=A // 10651
@CALL // 10652
0;JMP // 10653
(Output.initMap.ret.86)
@SP // 10654
M=M-1 // 10655

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10656
D=A // 10657
@SP // 10658
M=D+M // 10659
@117 // 10660
D=A // 10661
@SP // 10662
A=M-1 // 10663
M=0 // 10664
A=A-1 // 10665
M=0 // 10666
A=A-1 // 10667
M=0 // 10668
A=A-1 // 10669
M=D // 10670
A=A-1 // 10671
@27 // 10672
D=A // 10673
@SP // 10674
AM=M+1 // 10675
A=A-1 // 10676
M=D // 10677
@27 // 10678
D=A // 10679
@SP // 10680
AM=M+1 // 10681
A=A-1 // 10682
M=D // 10683
@27 // 10684
D=A // 10685
@SP // 10686
AM=M+1 // 10687
A=A-1 // 10688
M=D // 10689
@27 // 10690
D=A // 10691
@SP // 10692
AM=M+1 // 10693
A=A-1 // 10694
M=D // 10695
@27 // 10696
D=A // 10697
@SP // 10698
AM=M+1 // 10699
A=A-1 // 10700
M=D // 10701
@54 // 10702
D=A // 10703
@SP // 10704
AM=M+1 // 10705
A=A-1 // 10706
M=D // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=0 // 10711
@SP // 10712
AM=M+1 // 10713
A=A-1 // 10714
M=0 // 10715
// call Output.create
@17 // 10716
D=A // 10717
@14 // 10718
M=D // 10719
@Output.create // 10720
D=A // 10721
@13 // 10722
M=D // 10723
@Output.initMap.ret.87 // 10724
D=A // 10725
@CALL // 10726
0;JMP // 10727
(Output.initMap.ret.87)
@SP // 10728
M=M-1 // 10729

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10730
D=A // 10731
@SP // 10732
M=D+M // 10733
@118 // 10734
D=A // 10735
@SP // 10736
A=M-1 // 10737
M=0 // 10738
A=A-1 // 10739
M=0 // 10740
A=A-1 // 10741
M=0 // 10742
A=A-1 // 10743
M=D // 10744
A=A-1 // 10745
@51 // 10746
D=A // 10747
@SP // 10748
AM=M+1 // 10749
A=A-1 // 10750
M=D // 10751
@51 // 10752
D=A // 10753
@SP // 10754
AM=M+1 // 10755
A=A-1 // 10756
M=D // 10757
@51 // 10758
D=A // 10759
@SP // 10760
AM=M+1 // 10761
A=A-1 // 10762
M=D // 10763
@51 // 10764
D=A // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=D // 10769
@30 // 10770
D=A // 10771
@SP // 10772
AM=M+1 // 10773
A=A-1 // 10774
M=D // 10775
@12 // 10776
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
@Output.initMap.ret.88 // 10798
D=A // 10799
@CALL // 10800
0;JMP // 10801
(Output.initMap.ret.88)
@SP // 10802
M=M-1 // 10803

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10804
D=A // 10805
@SP // 10806
M=D+M // 10807
@119 // 10808
D=A // 10809
@SP // 10810
A=M-1 // 10811
M=0 // 10812
A=A-1 // 10813
M=0 // 10814
A=A-1 // 10815
M=0 // 10816
A=A-1 // 10817
M=D // 10818
A=A-1 // 10819
@51 // 10820
D=A // 10821
@SP // 10822
AM=M+1 // 10823
A=A-1 // 10824
M=D // 10825
@51 // 10826
D=A // 10827
@SP // 10828
AM=M+1 // 10829
A=A-1 // 10830
M=D // 10831
@51 // 10832
D=A // 10833
@SP // 10834
AM=M+1 // 10835
A=A-1 // 10836
M=D // 10837
@63 // 10838
D=A // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=D // 10843
@63 // 10844
D=A // 10845
@SP // 10846
AM=M+1 // 10847
A=A-1 // 10848
M=D // 10849
@18 // 10850
D=A // 10851
@SP // 10852
AM=M+1 // 10853
A=A-1 // 10854
M=D // 10855
@SP // 10856
AM=M+1 // 10857
A=A-1 // 10858
M=0 // 10859
@SP // 10860
AM=M+1 // 10861
A=A-1 // 10862
M=0 // 10863
// call Output.create
@17 // 10864
D=A // 10865
@14 // 10866
M=D // 10867
@Output.create // 10868
D=A // 10869
@13 // 10870
M=D // 10871
@Output.initMap.ret.89 // 10872
D=A // 10873
@CALL // 10874
0;JMP // 10875
(Output.initMap.ret.89)
@SP // 10876
M=M-1 // 10877

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10878
D=A // 10879
@SP // 10880
M=D+M // 10881
@120 // 10882
D=A // 10883
@SP // 10884
A=M-1 // 10885
M=0 // 10886
A=A-1 // 10887
M=0 // 10888
A=A-1 // 10889
M=0 // 10890
A=A-1 // 10891
M=D // 10892
A=A-1 // 10893
@51 // 10894
D=A // 10895
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=D // 10899
@30 // 10900
D=A // 10901
@SP // 10902
AM=M+1 // 10903
A=A-1 // 10904
M=D // 10905
@12 // 10906
D=A // 10907
@SP // 10908
AM=M+1 // 10909
A=A-1 // 10910
M=D // 10911
@12 // 10912
D=A // 10913
@SP // 10914
AM=M+1 // 10915
A=A-1 // 10916
M=D // 10917
@30 // 10918
D=A // 10919
@SP // 10920
AM=M+1 // 10921
A=A-1 // 10922
M=D // 10923
@51 // 10924
D=A // 10925
@SP // 10926
AM=M+1 // 10927
A=A-1 // 10928
M=D // 10929
@SP // 10930
AM=M+1 // 10931
A=A-1 // 10932
M=0 // 10933
@SP // 10934
AM=M+1 // 10935
A=A-1 // 10936
M=0 // 10937
// call Output.create
@17 // 10938
D=A // 10939
@14 // 10940
M=D // 10941
@Output.create // 10942
D=A // 10943
@13 // 10944
M=D // 10945
@Output.initMap.ret.90 // 10946
D=A // 10947
@CALL // 10948
0;JMP // 10949
(Output.initMap.ret.90)
@SP // 10950
M=M-1 // 10951

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10952
D=A // 10953
@SP // 10954
M=D+M // 10955
@121 // 10956
D=A // 10957
@SP // 10958
A=M-1 // 10959
M=0 // 10960
A=A-1 // 10961
M=0 // 10962
A=A-1 // 10963
M=0 // 10964
A=A-1 // 10965
M=D // 10966
A=A-1 // 10967
@51 // 10968
D=A // 10969
@SP // 10970
AM=M+1 // 10971
A=A-1 // 10972
M=D // 10973
@51 // 10974
D=A // 10975
@SP // 10976
AM=M+1 // 10977
A=A-1 // 10978
M=D // 10979
@51 // 10980
D=A // 10981
@SP // 10982
AM=M+1 // 10983
A=A-1 // 10984
M=D // 10985
@62 // 10986
D=A // 10987
@SP // 10988
AM=M+1 // 10989
A=A-1 // 10990
M=D // 10991
@48 // 10992
D=A // 10993
@SP // 10994
AM=M+1 // 10995
A=A-1 // 10996
M=D // 10997
@24 // 10998
D=A // 10999
@SP // 11000
AM=M+1 // 11001
A=A-1 // 11002
M=D // 11003
@15 // 11004
D=A // 11005
@SP // 11006
AM=M+1 // 11007
A=A-1 // 11008
M=D // 11009
@SP // 11010
AM=M+1 // 11011
A=A-1 // 11012
M=0 // 11013
// call Output.create
@17 // 11014
D=A // 11015
@14 // 11016
M=D // 11017
@Output.create // 11018
D=A // 11019
@13 // 11020
M=D // 11021
@Output.initMap.ret.91 // 11022
D=A // 11023
@CALL // 11024
0;JMP // 11025
(Output.initMap.ret.91)
@SP // 11026
M=M-1 // 11027

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11028
D=A // 11029
@SP // 11030
M=D+M // 11031
@122 // 11032
D=A // 11033
@SP // 11034
A=M-1 // 11035
M=0 // 11036
A=A-1 // 11037
M=0 // 11038
A=A-1 // 11039
M=0 // 11040
A=A-1 // 11041
M=D // 11042
A=A-1 // 11043
@63 // 11044
D=A // 11045
@SP // 11046
AM=M+1 // 11047
A=A-1 // 11048
M=D // 11049
@27 // 11050
D=A // 11051
@SP // 11052
AM=M+1 // 11053
A=A-1 // 11054
M=D // 11055
@12 // 11056
D=A // 11057
@SP // 11058
AM=M+1 // 11059
A=A-1 // 11060
M=D // 11061
@6 // 11062
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
@63 // 11074
D=A // 11075
@SP // 11076
AM=M+1 // 11077
A=A-1 // 11078
M=D // 11079
@SP // 11080
AM=M+1 // 11081
A=A-1 // 11082
M=0 // 11083
@SP // 11084
AM=M+1 // 11085
A=A-1 // 11086
M=0 // 11087
// call Output.create
@17 // 11088
D=A // 11089
@14 // 11090
M=D // 11091
@Output.create // 11092
D=A // 11093
@13 // 11094
M=D // 11095
@Output.initMap.ret.92 // 11096
D=A // 11097
@CALL // 11098
0;JMP // 11099
(Output.initMap.ret.92)
@SP // 11100
M=M-1 // 11101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11102
D=A // 11103
@SP // 11104
AM=M+1 // 11105
A=A-1 // 11106
M=D // 11107
@56 // 11108
D=A // 11109
@SP // 11110
AM=M+1 // 11111
A=A-1 // 11112
M=D // 11113
@12 // 11114
D=A // 11115
@SP // 11116
AM=M+1 // 11117
A=A-1 // 11118
M=D // 11119
@12 // 11120
D=A // 11121
@SP // 11122
AM=M+1 // 11123
A=A-1 // 11124
M=D // 11125
@12 // 11126
D=A // 11127
@SP // 11128
AM=M+1 // 11129
A=A-1 // 11130
M=D // 11131
@7 // 11132
D=A // 11133
@SP // 11134
AM=M+1 // 11135
A=A-1 // 11136
M=D // 11137
@12 // 11138
D=A // 11139
@SP // 11140
AM=M+1 // 11141
A=A-1 // 11142
M=D // 11143
@12 // 11144
D=A // 11145
@SP // 11146
AM=M+1 // 11147
A=A-1 // 11148
M=D // 11149
@12 // 11150
D=A // 11151
@SP // 11152
AM=M+1 // 11153
A=A-1 // 11154
M=D // 11155
@56 // 11156
D=A // 11157
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=D // 11161
@SP // 11162
AM=M+1 // 11163
A=A-1 // 11164
M=0 // 11165
@SP // 11166
AM=M+1 // 11167
A=A-1 // 11168
M=0 // 11169
// call Output.create
@17 // 11170
D=A // 11171
@14 // 11172
M=D // 11173
@Output.create // 11174
D=A // 11175
@13 // 11176
M=D // 11177
@Output.initMap.ret.93 // 11178
D=A // 11179
@CALL // 11180
0;JMP // 11181
(Output.initMap.ret.93)
@SP // 11182
M=M-1 // 11183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11184
D=A // 11185
@SP // 11186
AM=M+1 // 11187
A=A-1 // 11188
M=D // 11189
@12 // 11190
D=A // 11191
@SP // 11192
AM=M+1 // 11193
A=A-1 // 11194
M=D // 11195
@12 // 11196
D=A // 11197
@SP // 11198
AM=M+1 // 11199
A=A-1 // 11200
M=D // 11201
@12 // 11202
D=A // 11203
@SP // 11204
AM=M+1 // 11205
A=A-1 // 11206
M=D // 11207
@12 // 11208
D=A // 11209
@SP // 11210
AM=M+1 // 11211
A=A-1 // 11212
M=D // 11213
@12 // 11214
D=A // 11215
@SP // 11216
AM=M+1 // 11217
A=A-1 // 11218
M=D // 11219
@12 // 11220
D=A // 11221
@SP // 11222
AM=M+1 // 11223
A=A-1 // 11224
M=D // 11225
@12 // 11226
D=A // 11227
@SP // 11228
AM=M+1 // 11229
A=A-1 // 11230
M=D // 11231
@12 // 11232
D=A // 11233
@SP // 11234
AM=M+1 // 11235
A=A-1 // 11236
M=D // 11237
@12 // 11238
D=A // 11239
@SP // 11240
AM=M+1 // 11241
A=A-1 // 11242
M=D // 11243
@SP // 11244
AM=M+1 // 11245
A=A-1 // 11246
M=0 // 11247
@SP // 11248
AM=M+1 // 11249
A=A-1 // 11250
M=0 // 11251
// call Output.create
@17 // 11252
D=A // 11253
@14 // 11254
M=D // 11255
@Output.create // 11256
D=A // 11257
@13 // 11258
M=D // 11259
@Output.initMap.ret.94 // 11260
D=A // 11261
@CALL // 11262
0;JMP // 11263
(Output.initMap.ret.94)
@SP // 11264
M=M-1 // 11265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11266
D=A // 11267
@SP // 11268
AM=M+1 // 11269
A=A-1 // 11270
M=D // 11271
@7 // 11272
D=A // 11273
@SP // 11274
AM=M+1 // 11275
A=A-1 // 11276
M=D // 11277
@12 // 11278
D=A // 11279
@SP // 11280
AM=M+1 // 11281
A=A-1 // 11282
M=D // 11283
@12 // 11284
D=A // 11285
@SP // 11286
AM=M+1 // 11287
A=A-1 // 11288
M=D // 11289
@12 // 11290
D=A // 11291
@SP // 11292
AM=M+1 // 11293
A=A-1 // 11294
M=D // 11295
@56 // 11296
D=A // 11297
@SP // 11298
AM=M+1 // 11299
A=A-1 // 11300
M=D // 11301
@12 // 11302
D=A // 11303
@SP // 11304
AM=M+1 // 11305
A=A-1 // 11306
M=D // 11307
@12 // 11308
D=A // 11309
@SP // 11310
AM=M+1 // 11311
A=A-1 // 11312
M=D // 11313
@12 // 11314
D=A // 11315
@SP // 11316
AM=M+1 // 11317
A=A-1 // 11318
M=D // 11319
@7 // 11320
D=A // 11321
@SP // 11322
AM=M+1 // 11323
A=A-1 // 11324
M=D // 11325
@SP // 11326
AM=M+1 // 11327
A=A-1 // 11328
M=0 // 11329
@SP // 11330
AM=M+1 // 11331
A=A-1 // 11332
M=0 // 11333
// call Output.create
@17 // 11334
D=A // 11335
@14 // 11336
M=D // 11337
@Output.create // 11338
D=A // 11339
@13 // 11340
M=D // 11341
@Output.initMap.ret.95 // 11342
D=A // 11343
@CALL // 11344
0;JMP // 11345
(Output.initMap.ret.95)
@SP // 11346
M=M-1 // 11347

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11348
D=A // 11349
@SP // 11350
AM=M+1 // 11351
A=A-1 // 11352
M=D // 11353
@38 // 11354
D=A // 11355
@SP // 11356
AM=M+1 // 11357
A=A-1 // 11358
M=D // 11359
@45 // 11360
D=A // 11361
@SP // 11362
AM=M+1 // 11363
A=A-1 // 11364
M=D // 11365
@25 // 11366
D=A // 11367
@SP // 11368
AM=M+1 // 11369
A=A-1 // 11370
M=D // 11371
@SP // 11372
AM=M+1 // 11373
A=A-1 // 11374
M=0 // 11375
@SP // 11376
AM=M+1 // 11377
A=A-1 // 11378
M=0 // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=0 // 11383
@SP // 11384
AM=M+1 // 11385
A=A-1 // 11386
M=0 // 11387
@SP // 11388
AM=M+1 // 11389
A=A-1 // 11390
M=0 // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=0 // 11395
@SP // 11396
AM=M+1 // 11397
A=A-1 // 11398
M=0 // 11399
@SP // 11400
AM=M+1 // 11401
A=A-1 // 11402
M=0 // 11403
// call Output.create
@17 // 11404
D=A // 11405
@14 // 11406
M=D // 11407
@Output.create // 11408
D=A // 11409
@13 // 11410
M=D // 11411
@Output.initMap.ret.96 // 11412
D=A // 11413
@CALL // 11414
0;JMP // 11415
(Output.initMap.ret.96)
@SP // 11416
M=M-1 // 11417

////PushInstruction("constant 0")
@SP // 11418
AM=M+1 // 11419
A=A-1 // 11420
M=0 // 11421

////ReturnInstruction{}
@RETURN // 11422
0;JMP // 11423

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 11424
AM=M+1 // 11425
A=A-1 // 11426
M=0 // 11427

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11428
D=A // 11429
@SP // 11430
AM=M+1 // 11431
A=A-1 // 11432
M=D // 11433
// call Array.new
@6 // 11434
D=A // 11435
@14 // 11436
M=D // 11437
@Array.new // 11438
D=A // 11439
@13 // 11440
M=D // 11441
@Output.create.ret.0 // 11442
D=A // 11443
@CALL // 11444
0;JMP // 11445
(Output.create.ret.0)
@SP // 11446
AM=M-1 // 11447
D=M // 11448
@LCL // 11449
A=M // 11450
M=D // 11451

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11452
D=M // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=D // 11457
@ARG // 11458
A=M // 11459
D=M // 11460
@SP // 11461
AM=M-1 // 11462
D=D+M // 11463
@SP // 11464
AM=M+1 // 11465
A=A-1 // 11466
M=D // 11467
@LCL // 11468
A=M // 11469
D=M // 11470
@SP // 11471
AM=M-1 // 11472
A=M // 11473
M=D // 11474

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11475
A=M // 11476
D=M // 11477
@SP // 11478
AM=M+1 // 11479
A=A-1 // 11480
M=D // 11481
@ARG // 11482
A=M+1 // 11483
D=M // 11484
@SP // 11485
AM=M-1 // 11486
A=M // 11487
M=D // 11488

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11489
A=M // 11490
D=M // 11491
@SP // 11492
AM=M+1 // 11493
A=A-1 // 11494
M=D+1 // 11495
@ARG // 11496
A=M+1 // 11497
A=A+1 // 11498
D=M // 11499
@SP // 11500
AM=M-1 // 11501
A=M // 11502
M=D // 11503

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11504
A=M // 11505
D=M // 11506
@2 // 11507
D=D+A // 11508
@SP // 11509
AM=M+1 // 11510
A=A-1 // 11511
M=D // 11512
@ARG // 11513
A=M+1 // 11514
A=A+1 // 11515
A=A+1 // 11516
D=M // 11517
@SP // 11518
AM=M-1 // 11519
A=M // 11520
M=D // 11521

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11522
A=M // 11523
D=M // 11524
@3 // 11525
D=D+A // 11526
@SP // 11527
AM=M+1 // 11528
A=A-1 // 11529
M=D // 11530
@ARG // 11531
D=M // 11532
@4 // 11533
A=D+A // 11534
D=M // 11535
@SP // 11536
AM=M-1 // 11537
A=M // 11538
M=D // 11539

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11540
A=M // 11541
D=M // 11542
@4 // 11543
D=D+A // 11544
@SP // 11545
AM=M+1 // 11546
A=A-1 // 11547
M=D // 11548
@ARG // 11549
D=M // 11550
@5 // 11551
A=D+A // 11552
D=M // 11553
@SP // 11554
AM=M-1 // 11555
A=M // 11556
M=D // 11557

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11558
A=M // 11559
D=M // 11560
@5 // 11561
D=D+A // 11562
@SP // 11563
AM=M+1 // 11564
A=A-1 // 11565
M=D // 11566
@ARG // 11567
D=M // 11568
@6 // 11569
A=D+A // 11570
D=M // 11571
@SP // 11572
AM=M-1 // 11573
A=M // 11574
M=D // 11575

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11576
A=M // 11577
D=M // 11578
@6 // 11579
D=D+A // 11580
@SP // 11581
AM=M+1 // 11582
A=A-1 // 11583
M=D // 11584
@ARG // 11585
D=M // 11586
@7 // 11587
A=D+A // 11588
D=M // 11589
@SP // 11590
AM=M-1 // 11591
A=M // 11592
M=D // 11593

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11594
A=M // 11595
D=M // 11596
@7 // 11597
D=D+A // 11598
@SP // 11599
AM=M+1 // 11600
A=A-1 // 11601
M=D // 11602
@ARG // 11603
D=M // 11604
@8 // 11605
A=D+A // 11606
D=M // 11607
@SP // 11608
AM=M-1 // 11609
A=M // 11610
M=D // 11611

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11612
A=M // 11613
D=M // 11614
@8 // 11615
D=D+A // 11616
@SP // 11617
AM=M+1 // 11618
A=A-1 // 11619
M=D // 11620
@ARG // 11621
D=M // 11622
@9 // 11623
A=D+A // 11624
D=M // 11625
@SP // 11626
AM=M-1 // 11627
A=M // 11628
M=D // 11629

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11630
A=M // 11631
D=M // 11632
@9 // 11633
D=D+A // 11634
@SP // 11635
AM=M+1 // 11636
A=A-1 // 11637
M=D // 11638
@ARG // 11639
D=M // 11640
@10 // 11641
A=D+A // 11642
D=M // 11643
@SP // 11644
AM=M-1 // 11645
A=M // 11646
M=D // 11647

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11648
A=M // 11649
D=M // 11650
@10 // 11651
D=D+A // 11652
@SP // 11653
AM=M+1 // 11654
A=A-1 // 11655
M=D // 11656
@ARG // 11657
D=M // 11658
@11 // 11659
A=D+A // 11660
D=M // 11661
@SP // 11662
AM=M-1 // 11663
A=M // 11664
M=D // 11665

////PushInstruction("constant 0")
@SP // 11666
AM=M+1 // 11667
A=A-1 // 11668
M=0 // 11669

////ReturnInstruction{}
@RETURN // 11670
0;JMP // 11671

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
@Output.getMap.EQ.0 // 11672
D=A // 11673
@SP // 11674
AM=M+1 // 11675
A=A-1 // 11676
M=D // 11677
@Output.getMap.LT.1 // 11678
D=A // 11679
@SP // 11680
AM=M+1 // 11681
A=A-1 // 11682
M=D // 11683
@ARG // 11684
A=M // 11685
D=M // 11686
@32 // 11687
D=D-A // 11688
@DO_LT // 11689
0;JMP // 11690
(Output.getMap.LT.1)
@SP // 11691
AM=M+1 // 11692
A=A-1 // 11693
M=D // 11694
@Output.getMap.GT.2 // 11695
D=A // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=D // 11700
@ARG // 11701
A=M // 11702
D=M // 11703
@126 // 11704
D=D-A // 11705
@DO_GT // 11706
0;JMP // 11707
(Output.getMap.GT.2)
@SP // 11708
AM=M-1 // 11709
D=D|M // 11710
@DO_EQ // 11711
0;JMP // 11712
(Output.getMap.EQ.0)
@Output.getMap.IfElse1 // 11713
D;JNE // 11714

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11715
A=M // 11716
M=0 // 11717

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 11718
0;JMP // 11719

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
@Output.0 // 11720
D=M // 11721
@SP // 11722
AM=M+1 // 11723
A=A-1 // 11724
M=D // 11725
@ARG // 11726
A=M // 11727
D=M // 11728
@SP // 11729
AM=M-1 // 11730
A=D+M // 11731
D=M // 11732
@SP // 11733
AM=M+1 // 11734
A=A-1 // 11735
M=D // 11736

////ReturnInstruction{}
@RETURN // 11737
0;JMP // 11738

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 11739
A=M+1 // 11740
D=M // 11741
@Output.1 // 11742
M=D // 11743

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 11744
A=M // 11745
D=M // 11746
@Output.2 // 11747
M=D // 11748

////PushInstruction("constant 0")
@SP // 11749
AM=M+1 // 11750
A=A-1 // 11751
M=0 // 11752

////ReturnInstruction{}
@RETURN // 11753
0;JMP // 11754

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 11755
D=A // 11756
@SP // 11757
AM=D+M // 11758
A=A-1 // 11759
M=0 // 11760
A=A-1 // 11761
M=0 // 11762
A=A-1 // 11763
M=0 // 11764
A=A-1 // 11765
M=0 // 11766

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 11767
A=M // 11768
D=M // 11769
@SP // 11770
AM=M+1 // 11771
A=A-1 // 11772
M=D // 11773
// call Output.getMap
@6 // 11774
D=A // 11775
@14 // 11776
M=D // 11777
@Output.getMap // 11778
D=A // 11779
@13 // 11780
M=D // 11781
@Output.printChar.ret.0 // 11782
D=A // 11783
@CALL // 11784
0;JMP // 11785
(Output.printChar.ret.0)
@SP // 11786
AM=M-1 // 11787
D=M // 11788
@LCL // 11789
A=M // 11790
M=D // 11791

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 11792
A=M+1 // 11793
A=A+1 // 11794
A=A+1 // 11795
M=0 // 11796

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
@Output.printChar.LT.3 // 11797
D=A // 11798
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=D // 11802
@LCL // 11803
A=M+1 // 11804
A=A+1 // 11805
A=A+1 // 11806
D=M // 11807
@11 // 11808
D=D-A // 11809
@DO_LT // 11810
0;JMP // 11811
(Output.printChar.LT.3)
D=!D // 11812
@WHILE_END_Output.printChar1 // 11813
D;JNE // 11814

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("constant 16384"),
//            right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("static 2"), PushInstruction("constant 11")], call=CallInstruction{Math.multiply}},
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}},
//            binaryOp: "ADD"
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("static 1"), PushInstruction("constant 2")], call=CallInstruction{Math.divide}},
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@Output.2 // 11815
D=M // 11816
@SP // 11817
AM=M+1 // 11818
A=A-1 // 11819
M=D // 11820
@11 // 11821
D=A // 11822
@SP // 11823
AM=M+1 // 11824
A=A-1 // 11825
M=D // 11826
// call Math.multiply
@7 // 11827
D=A // 11828
@14 // 11829
M=D // 11830
@Math.multiply // 11831
D=A // 11832
@13 // 11833
M=D // 11834
@Output.printChar.ret.1 // 11835
D=A // 11836
@CALL // 11837
0;JMP // 11838
(Output.printChar.ret.1)
@LCL // 11839
A=M+1 // 11840
A=A+1 // 11841
A=A+1 // 11842
D=M // 11843
@SP // 11844
AM=M-1 // 11845
D=D+M // 11846
@SP // 11847
AM=M+1 // 11848
A=A-1 // 11849
M=D // 11850
@32 // 11851
D=A // 11852
@SP // 11853
AM=M+1 // 11854
A=A-1 // 11855
M=D // 11856
// call Math.multiply
@7 // 11857
D=A // 11858
@14 // 11859
M=D // 11860
@Math.multiply // 11861
D=A // 11862
@13 // 11863
M=D // 11864
@Output.printChar.ret.2 // 11865
D=A // 11866
@CALL // 11867
0;JMP // 11868
(Output.printChar.ret.2)
@SP // 11869
AM=M-1 // 11870
D=M // 11871
@16384 // 11872
D=D+A // 11873
@SP // 11874
AM=M+1 // 11875
A=A-1 // 11876
M=D // 11877
@Output.1 // 11878
D=M // 11879
@SP // 11880
AM=M+1 // 11881
A=A-1 // 11882
M=D // 11883
@2 // 11884
D=A // 11885
@SP // 11886
AM=M+1 // 11887
A=A-1 // 11888
M=D // 11889
// call Math.divide
@7 // 11890
D=A // 11891
@14 // 11892
M=D // 11893
@Math.divide // 11894
D=A // 11895
@13 // 11896
M=D // 11897
@Output.printChar.ret.3 // 11898
D=A // 11899
@CALL // 11900
0;JMP // 11901
(Output.printChar.ret.3)
@SP // 11902
AM=M-1 // 11903
D=M // 11904
@SP // 11905
AM=M-1 // 11906
D=D+M // 11907
@LCL // 11908
A=M+1 // 11909
M=D // 11910

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
@Output.printChar.EQ.4 // 11911
D=A // 11912
@SP // 11913
AM=M+1 // 11914
A=A-1 // 11915
M=D // 11916
@Output.1 // 11917
D=M // 11918
@1 // 11919
D=D&A // 11920
@DO_EQ // 11921
0;JMP // 11922
(Output.printChar.EQ.4)
@Output.printChar.IfElse1 // 11923
D;JEQ // 11924

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

@LCL // 11925
A=M+1 // 11926
A=A+1 // 11927
A=A+1 // 11928
D=M // 11929
A=A-1 // 11930
A=A-1 // 11931
A=A-1 // 11932
A=D+M // 11933
D=M // 11934
@LCL // 11935
A=M+1 // 11936
A=A+1 // 11937
M=D // 11938

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 11939
0;JMP // 11940

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
//), PushInstruction("constant 256")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 11941
A=M+1 // 11942
A=A+1 // 11943
A=A+1 // 11944
D=M // 11945
A=A-1 // 11946
A=A-1 // 11947
A=A-1 // 11948
A=D+M // 11949
D=M // 11950
@SP // 11951
AM=M+1 // 11952
A=A-1 // 11953
M=D // 11954
@256 // 11955
D=A // 11956
@SP // 11957
AM=M+1 // 11958
A=A-1 // 11959
M=D // 11960
// call Math.multiply
@7 // 11961
D=A // 11962
@14 // 11963
M=D // 11964
@Math.multiply // 11965
D=A // 11966
@13 // 11967
M=D // 11968
@Output.printChar.ret.4 // 11969
D=A // 11970
@CALL // 11971
0;JMP // 11972
(Output.printChar.ret.4)
@SP // 11973
AM=M-1 // 11974
D=M // 11975
@LCL // 11976
A=M+1 // 11977
A=A+1 // 11978
M=D // 11979

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11980
A=M+1 // 11981
D=M // 11982
@SP // 11983
AM=M+1 // 11984
A=A-1 // 11985
M=D // 11986
@LCL // 11987
A=M+1 // 11988
D=M // 11989
@0 // 11990
A=D+A // 11991
D=M // 11992
@SP // 11993
AM=M+1 // 11994
A=A-1 // 11995
M=D // 11996
@LCL // 11997
A=M+1 // 11998
A=A+1 // 11999
D=M // 12000
@SP // 12001
AM=M-1 // 12002
D=D|M // 12003
@SP // 12004
AM=M-1 // 12005
A=M // 12006
M=D // 12007

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12008
A=M+1 // 12009
A=A+1 // 12010
A=A+1 // 12011
M=M+1 // 12012

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12013
0;JMP // 12014

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
@Output.printChar.EQ.5 // 12015
D=A // 12016
@SP // 12017
AM=M+1 // 12018
A=A-1 // 12019
M=D // 12020
@Output.1 // 12021
D=M // 12022
@63 // 12023
D=D-A // 12024
@DO_EQ // 12025
0;JMP // 12026
(Output.printChar.EQ.5)
D=!D // 12027
@Output.printChar.IfElse2 // 12028
D;JNE // 12029

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12030
D=A // 12031
@14 // 12032
M=D // 12033
@Output.println // 12034
D=A // 12035
@13 // 12036
M=D // 12037
@Output.printChar.ret.5 // 12038
D=A // 12039
@CALL // 12040
0;JMP // 12041
(Output.printChar.ret.5)
@SP // 12042
M=M-1 // 12043

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12044
0;JMP // 12045

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
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12046
M=M+1 // 12047

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12048
AM=M+1 // 12049
A=A-1 // 12050
M=0 // 12051

////ReturnInstruction{}
@RETURN // 12052
0;JMP // 12053

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12054
M=M+1 // 12055
AM=M+1 // 12056
A=A-1 // 12057
M=0 // 12058
A=A-1 // 12059
M=0 // 12060

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12061
A=M // 12062
M=0 // 12063

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12064
A=M // 12065
D=M // 12066
@SP // 12067
AM=M+1 // 12068
A=A-1 // 12069
M=D // 12070
// call String.length
@6 // 12071
D=A // 12072
@14 // 12073
M=D // 12074
@String.length // 12075
D=A // 12076
@13 // 12077
M=D // 12078
@Output.printString.ret.0 // 12079
D=A // 12080
@CALL // 12081
0;JMP // 12082
(Output.printString.ret.0)
@SP // 12083
AM=M-1 // 12084
D=M // 12085
@LCL // 12086
A=M+1 // 12087
M=D // 12088

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "LT"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Output.printString1}}
@Output.printString.LT.6 // 12089
D=A // 12090
@SP // 12091
AM=M+1 // 12092
A=A-1 // 12093
M=D // 12094
@LCL // 12095
A=M+1 // 12096
D=M // 12097
A=A-1 // 12098
D=M-D // 12099
@DO_LT // 12100
0;JMP // 12101
(Output.printString.LT.6)
D=!D // 12102
@WHILE_END_Output.printString1 // 12103
D;JNE // 12104

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12105
A=M // 12106
D=M // 12107
@SP // 12108
AM=M+1 // 12109
A=A-1 // 12110
M=D // 12111
@LCL // 12112
A=M // 12113
D=M // 12114
@SP // 12115
AM=M+1 // 12116
A=A-1 // 12117
M=D // 12118
// call String.charAt
@7 // 12119
D=A // 12120
@14 // 12121
M=D // 12122
@String.charAt // 12123
D=A // 12124
@13 // 12125
M=D // 12126
@Output.printString.ret.1 // 12127
D=A // 12128
@CALL // 12129
0;JMP // 12130
(Output.printString.ret.1)
// call Output.printChar
@6 // 12131
D=A // 12132
@14 // 12133
M=D // 12134
@Output.printChar // 12135
D=A // 12136
@13 // 12137
M=D // 12138
@Output.printString.ret.2 // 12139
D=A // 12140
@CALL // 12141
0;JMP // 12142
(Output.printString.ret.2)
@SP // 12143
M=M-1 // 12144

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

@LCL // 12145
A=M // 12146
M=M+1 // 12147

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12148
0;JMP // 12149

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12150
AM=M+1 // 12151
A=A-1 // 12152
M=0 // 12153

////ReturnInstruction{}
@RETURN // 12154
0;JMP // 12155

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12156
AM=M+1 // 12157
A=A-1 // 12158
M=0 // 12159

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12160
D=A // 12161
@SP // 12162
AM=M+1 // 12163
A=A-1 // 12164
M=D // 12165
// call String.new
@6 // 12166
D=A // 12167
@14 // 12168
M=D // 12169
@String.new // 12170
D=A // 12171
@13 // 12172
M=D // 12173
@Output.printInt.ret.0 // 12174
D=A // 12175
@CALL // 12176
0;JMP // 12177
(Output.printInt.ret.0)
@SP // 12178
AM=M-1 // 12179
D=M // 12180
@LCL // 12181
A=M // 12182
M=D // 12183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12184
A=M // 12185
D=M // 12186
@SP // 12187
AM=M+1 // 12188
A=A-1 // 12189
M=D // 12190
@ARG // 12191
A=M // 12192
D=M // 12193
@SP // 12194
AM=M+1 // 12195
A=A-1 // 12196
M=D // 12197
// call String.setInt
@7 // 12198
D=A // 12199
@14 // 12200
M=D // 12201
@String.setInt // 12202
D=A // 12203
@13 // 12204
M=D // 12205
@Output.printInt.ret.1 // 12206
D=A // 12207
@CALL // 12208
0;JMP // 12209
(Output.printInt.ret.1)
@SP // 12210
M=M-1 // 12211

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12212
A=M // 12213
D=M // 12214
@SP // 12215
AM=M+1 // 12216
A=A-1 // 12217
M=D // 12218
// call Output.printString
@6 // 12219
D=A // 12220
@14 // 12221
M=D // 12222
@Output.printString // 12223
D=A // 12224
@13 // 12225
M=D // 12226
@Output.printInt.ret.2 // 12227
D=A // 12228
@CALL // 12229
0;JMP // 12230
(Output.printInt.ret.2)
@SP // 12231
M=M-1 // 12232

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12233
A=M // 12234
D=M // 12235
@SP // 12236
AM=M+1 // 12237
A=A-1 // 12238
M=D // 12239
// call String.dispose
@6 // 12240
D=A // 12241
@14 // 12242
M=D // 12243
@String.dispose // 12244
D=A // 12245
@13 // 12246
M=D // 12247
@Output.printInt.ret.3 // 12248
D=A // 12249
@CALL // 12250
0;JMP // 12251
(Output.printInt.ret.3)
@SP // 12252
M=M-1 // 12253

////PushInstruction("constant 0")
@SP // 12254
AM=M+1 // 12255
A=A-1 // 12256
M=0 // 12257

////ReturnInstruction{}
@RETURN // 12258
0;JMP // 12259

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12260
M=0 // 12261

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
@Output.println.EQ.7 // 12262
D=A // 12263
@SP // 12264
AM=M+1 // 12265
A=A-1 // 12266
M=D // 12267
@Output.2 // 12268
D=M // 12269
@22 // 12270
D=D-A // 12271
@DO_EQ // 12272
0;JMP // 12273
(Output.println.EQ.7)
D=!D // 12274
@Output.println.IfElse1 // 12275
D;JNE // 12276

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12277
M=0 // 12278

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12279
0;JMP // 12280

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
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12281
M=M+1 // 12282

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12283
AM=M+1 // 12284
A=A-1 // 12285
M=0 // 12286

////ReturnInstruction{}
@RETURN // 12287
0;JMP // 12288

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
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
@Output.backSpace.EQ.8 // 12289
D=A // 12290
@SP // 12291
AM=M+1 // 12292
A=A-1 // 12293
M=D // 12294
@Output.1 // 12295
D=M // 12296
@DO_EQ // 12297
0;JMP // 12298
(Output.backSpace.EQ.8)
@Output.backSpace.IfElse1 // 12299
D;JEQ // 12300

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12301
M=M-1 // 12302

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12303
D=A // 12304
@Output.1 // 12305
M=D // 12306

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12307
0;JMP // 12308

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
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12309
M=M-1 // 12310

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12311
AM=M+1 // 12312
A=A-1 // 12313
M=0 // 12314

////ReturnInstruction{}
@RETURN // 12315
0;JMP // 12316

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12317
M=-1 // 12318

////PushInstruction("constant 0")
@SP // 12319
AM=M+1 // 12320
A=A-1 // 12321
M=0 // 12322

////ReturnInstruction{}
@RETURN // 12323
0;JMP // 12324

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12325
A=M // 12326
D=M // 12327
@Screen.0 // 12328
M=D // 12329

////PushInstruction("constant 0")
@SP // 12330
AM=M+1 // 12331
A=A-1 // 12332
M=0 // 12333

////ReturnInstruction{}
@RETURN // 12334
0;JMP // 12335

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12336
M=M+1 // 12337
AM=M+1 // 12338
A=A-1 // 12339
M=0 // 12340
A=A-1 // 12341
M=0 // 12342

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}},
//            right:
//CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}},
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12343
A=M+1 // 12344
D=M // 12345
@SP // 12346
AM=M+1 // 12347
A=A-1 // 12348
M=D // 12349
@32 // 12350
D=A // 12351
@SP // 12352
AM=M+1 // 12353
A=A-1 // 12354
M=D // 12355
// call Math.multiply
@7 // 12356
D=A // 12357
@14 // 12358
M=D // 12359
@Math.multiply // 12360
D=A // 12361
@13 // 12362
M=D // 12363
@Screen.drawPixel.ret.0 // 12364
D=A // 12365
@CALL // 12366
0;JMP // 12367
(Screen.drawPixel.ret.0)
@ARG // 12368
A=M // 12369
D=M // 12370
@SP // 12371
AM=M+1 // 12372
A=A-1 // 12373
M=D // 12374
@16 // 12375
D=A // 12376
@SP // 12377
AM=M+1 // 12378
A=A-1 // 12379
M=D // 12380
// call Math.divide
@7 // 12381
D=A // 12382
@14 // 12383
M=D // 12384
@Math.divide // 12385
D=A // 12386
@13 // 12387
M=D // 12388
@Screen.drawPixel.ret.1 // 12389
D=A // 12390
@CALL // 12391
0;JMP // 12392
(Screen.drawPixel.ret.1)
@SP // 12393
AM=M-1 // 12394
D=M // 12395
@SP // 12396
AM=M-1 // 12397
D=D+M // 12398
@16384 // 12399
D=D+A // 12400
@LCL // 12401
A=M // 12402
M=D // 12403

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12404
A=M // 12405
D=M // 12406
@15 // 12407
D=D&A // 12408
@LCL // 12409
A=M+1 // 12410
M=D // 12411

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
@Screen.drawPixel.EQ.0 // 12412
D=A // 12413
@SP // 12414
AM=M+1 // 12415
A=A-1 // 12416
M=D // 12417
@Screen.drawPixel.EQ.1 // 12418
D=A // 12419
@SP // 12420
AM=M+1 // 12421
A=A-1 // 12422
M=D // 12423
@Screen.0 // 12424
D=M // 12425
@DO_EQ // 12426
0;JMP // 12427
(Screen.drawPixel.EQ.1)
D=!D // 12428
@DO_EQ // 12429
0;JMP // 12430
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12431
D;JNE // 12432

////PushWriter{source=BinaryPushGroup(
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
//CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Math.twoToThe}},
//    binaryOp: "OR"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 12433
A=M // 12434
D=M // 12435
@SP // 12436
AM=M+1 // 12437
A=A-1 // 12438
M=D // 12439
@LCL // 12440
A=M // 12441
D=M // 12442
@0 // 12443
A=D+A // 12444
D=M // 12445
@SP // 12446
AM=M+1 // 12447
A=A-1 // 12448
M=D // 12449
@LCL // 12450
A=M+1 // 12451
D=M // 12452
@SP // 12453
AM=M+1 // 12454
A=A-1 // 12455
M=D // 12456
// call Math.twoToThe
@6 // 12457
D=A // 12458
@14 // 12459
M=D // 12460
@Math.twoToThe // 12461
D=A // 12462
@13 // 12463
M=D // 12464
@Screen.drawPixel.ret.2 // 12465
D=A // 12466
@CALL // 12467
0;JMP // 12468
(Screen.drawPixel.ret.2)
@SP // 12469
AM=M-1 // 12470
D=M // 12471
@SP // 12472
AM=M-1 // 12473
D=D|M // 12474
@SP // 12475
AM=M-1 // 12476
A=M // 12477
M=D // 12478

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12479
0;JMP // 12480

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////PushWriter{source=BinaryPushGroup(
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
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Math.twoToThe}},
//NOT),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 12481
A=M // 12482
D=M // 12483
@SP // 12484
AM=M+1 // 12485
A=A-1 // 12486
M=D // 12487
@LCL // 12488
A=M // 12489
D=M // 12490
@0 // 12491
A=D+A // 12492
D=M // 12493
@SP // 12494
AM=M+1 // 12495
A=A-1 // 12496
M=D // 12497
@LCL // 12498
A=M+1 // 12499
D=M // 12500
@SP // 12501
AM=M+1 // 12502
A=A-1 // 12503
M=D // 12504
// call Math.twoToThe
@6 // 12505
D=A // 12506
@14 // 12507
M=D // 12508
@Math.twoToThe // 12509
D=A // 12510
@13 // 12511
M=D // 12512
@Screen.drawPixel.ret.3 // 12513
D=A // 12514
@CALL // 12515
0;JMP // 12516
(Screen.drawPixel.ret.3)
@SP // 12517
AM=M-1 // 12518
D=M // 12519
D=!D // 12520
@SP // 12521
AM=M-1 // 12522
D=D&M // 12523
@SP // 12524
AM=M-1 // 12525
A=M // 12526
M=D // 12527

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12528
AM=M+1 // 12529
A=A-1 // 12530
M=0 // 12531

////ReturnInstruction{}
@RETURN // 12532
0;JMP // 12533

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12534
D=A // 12535
@SP // 12536
AM=D+M // 12537
A=A-1 // 12538
M=0 // 12539
A=A-1 // 12540
M=0 // 12541
A=A-1 // 12542
M=0 // 12543
A=A-1 // 12544
M=0 // 12545
A=A-1 // 12546
M=0 // 12547
A=A-1 // 12548
M=0 // 12549

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "SUB"
//)], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12550
A=M+1 // 12551
A=A+1 // 12552
D=M // 12553
A=A-1 // 12554
A=A-1 // 12555
D=D-M // 12556
@SP // 12557
AM=M+1 // 12558
A=A-1 // 12559
M=D // 12560
// call Math.abs
@6 // 12561
D=A // 12562
@14 // 12563
M=D // 12564
@Math.abs // 12565
D=A // 12566
@13 // 12567
M=D // 12568
@Screen.drawLine.ret.0 // 12569
D=A // 12570
@CALL // 12571
0;JMP // 12572
(Screen.drawLine.ret.0)
@SP // 12573
AM=M-1 // 12574
D=M // 12575
@LCL // 12576
A=M // 12577
M=D // 12578

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("argument 3"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "SUB"
//)], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12579
A=M+1 // 12580
A=A+1 // 12581
A=A+1 // 12582
D=M // 12583
A=A-1 // 12584
A=A-1 // 12585
D=D-M // 12586
@SP // 12587
AM=M+1 // 12588
A=A-1 // 12589
M=D // 12590
// call Math.abs
@6 // 12591
D=A // 12592
@14 // 12593
M=D // 12594
@Math.abs // 12595
D=A // 12596
@13 // 12597
M=D // 12598
@Screen.drawLine.ret.1 // 12599
D=A // 12600
@CALL // 12601
0;JMP // 12602
(Screen.drawLine.ret.1)
@SP // 12603
AM=M-1 // 12604
D=M // 12605
@LCL // 12606
A=M+1 // 12607
M=D // 12608

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
@Screen.drawLine.LT.2 // 12609
D=A // 12610
@SP // 12611
AM=M+1 // 12612
A=A-1 // 12613
M=D // 12614
@ARG // 12615
A=M+1 // 12616
A=A+1 // 12617
D=M // 12618
A=A-1 // 12619
A=A-1 // 12620
D=M-D // 12621
@DO_LT // 12622
0;JMP // 12623
(Screen.drawLine.LT.2)
D=!D // 12624
@Screen.drawLine.IfElse1 // 12625
D;JNE // 12626

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12627
A=M+1 // 12628
A=A+1 // 12629
M=1 // 12630

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 12631
0;JMP // 12632

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12633
A=M+1 // 12634
A=A+1 // 12635
M=-1 // 12636

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
@Screen.drawLine.LT.3 // 12637
D=A // 12638
@SP // 12639
AM=M+1 // 12640
A=A-1 // 12641
M=D // 12642
@ARG // 12643
A=M+1 // 12644
A=A+1 // 12645
A=A+1 // 12646
D=M // 12647
A=A-1 // 12648
A=A-1 // 12649
D=M-D // 12650
@DO_LT // 12651
0;JMP // 12652
(Screen.drawLine.LT.3)
D=!D // 12653
@Screen.drawLine.IfElse2 // 12654
D;JNE // 12655

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12656
A=M+1 // 12657
A=A+1 // 12658
A=A+1 // 12659
M=1 // 12660

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 12661
0;JMP // 12662

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12663
A=M+1 // 12664
A=A+1 // 12665
A=A+1 // 12666
M=-1 // 12667

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

@LCL // 12668
A=M+1 // 12669
D=M // 12670
A=A-1 // 12671
D=M-D // 12672
@SP // 12673
AM=M+1 // 12674
A=A-1 // 12675
M=D // 12676
@LCL // 12677
D=M // 12678
@4 // 12679
A=D+A // 12680
D=A // 12681
@R13 // 12682
M=D // 12683
@SP // 12684
AM=M-1 // 12685
D=M // 12686
@R13 // 12687
A=M // 12688
M=D // 12689

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
D=0 // 12690
@WHILE_END_Screen.drawLine1 // 12691
D;JNE // 12692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12693
A=M // 12694
D=M // 12695
@SP // 12696
AM=M+1 // 12697
A=A-1 // 12698
M=D // 12699
@ARG // 12700
A=M+1 // 12701
D=M // 12702
@SP // 12703
AM=M+1 // 12704
A=A-1 // 12705
M=D // 12706
// call Screen.drawPixel
@7 // 12707
D=A // 12708
@14 // 12709
M=D // 12710
@Screen.drawPixel // 12711
D=A // 12712
@13 // 12713
M=D // 12714
@Screen.drawLine.ret.2 // 12715
D=A // 12716
@CALL // 12717
0;JMP // 12718
(Screen.drawLine.ret.2)
@SP // 12719
M=M-1 // 12720

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
@Screen.drawLine.EQ.4 // 12721
D=A // 12722
@SP // 12723
AM=M+1 // 12724
A=A-1 // 12725
M=D // 12726
@Screen.drawLine.EQ.5 // 12727
D=A // 12728
@SP // 12729
AM=M+1 // 12730
A=A-1 // 12731
M=D // 12732
@ARG // 12733
A=M+1 // 12734
A=A+1 // 12735
D=M // 12736
A=A-1 // 12737
A=A-1 // 12738
D=M-D // 12739
@DO_EQ // 12740
0;JMP // 12741
(Screen.drawLine.EQ.5)
@SP // 12742
AM=M+1 // 12743
A=A-1 // 12744
M=D // 12745
@Screen.drawLine.EQ.6 // 12746
D=A // 12747
@SP // 12748
AM=M+1 // 12749
A=A-1 // 12750
M=D // 12751
@ARG // 12752
A=M+1 // 12753
A=A+1 // 12754
A=A+1 // 12755
D=M // 12756
A=A-1 // 12757
A=A-1 // 12758
D=M-D // 12759
@DO_EQ // 12760
0;JMP // 12761
(Screen.drawLine.EQ.6)
@SP // 12762
AM=M-1 // 12763
D=D&M // 12764
@DO_EQ // 12765
0;JMP // 12766
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse3 // 12767
D;JNE // 12768

////PushInstruction("constant 0")
@SP // 12769
AM=M+1 // 12770
A=A-1 // 12771
M=0 // 12772

////ReturnInstruction{}
@RETURN // 12773
0;JMP // 12774

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 12775
0;JMP // 12776

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

@LCL // 12777
D=M // 12778
@4 // 12779
A=D+A // 12780
D=M // 12781
D=D+M // 12782
@SP // 12783
AM=M+1 // 12784
A=A-1 // 12785
M=D // 12786
@LCL // 12787
D=M // 12788
@5 // 12789
A=D+A // 12790
D=A // 12791
@R13 // 12792
M=D // 12793
@SP // 12794
AM=M-1 // 12795
D=M // 12796
@R13 // 12797
A=M // 12798
M=D // 12799

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
@Screen.drawLine.GT.7 // 12800
D=A // 12801
@SP // 12802
AM=M+1 // 12803
A=A-1 // 12804
M=D // 12805
@LCL // 12806
D=M // 12807
@5 // 12808
A=D+A // 12809
D=M // 12810
@SP // 12811
AM=M+1 // 12812
A=A-1 // 12813
M=D // 12814
@LCL // 12815
A=M+1 // 12816
D=M // 12817
@SP // 12818
AM=M-1 // 12819
D=D+M // 12820
@DO_GT // 12821
0;JMP // 12822
(Screen.drawLine.GT.7)
D=!D // 12823
@Screen.drawLine.IfElse4 // 12824
D;JNE // 12825

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 12826
D=M // 12827
@4 // 12828
A=D+A // 12829
D=M // 12830
A=A-1 // 12831
A=A-1 // 12832
A=A-1 // 12833
D=D-M // 12834
@SP // 12835
AM=M+1 // 12836
A=A-1 // 12837
M=D // 12838
@LCL // 12839
D=M // 12840
@4 // 12841
A=D+A // 12842
D=A // 12843
@R13 // 12844
M=D // 12845
@SP // 12846
AM=M-1 // 12847
D=M // 12848
@R13 // 12849
A=M // 12850
M=D // 12851

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=argument 0}
//}

@LCL // 12852
A=M+1 // 12853
A=A+1 // 12854
D=M // 12855
@ARG // 12856
A=M // 12857
M=D+M // 12858

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 12859
0;JMP // 12860

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
@Screen.drawLine.LT.8 // 12861
D=A // 12862
@SP // 12863
AM=M+1 // 12864
A=A-1 // 12865
M=D // 12866
@LCL // 12867
D=M // 12868
@5 // 12869
A=D+A // 12870
D=M // 12871
@SP // 12872
AM=M+1 // 12873
A=A-1 // 12874
M=D // 12875
@LCL // 12876
A=M // 12877
D=M // 12878
@SP // 12879
AM=M-1 // 12880
D=M-D // 12881
@DO_LT // 12882
0;JMP // 12883
(Screen.drawLine.LT.8)
D=!D // 12884
@Screen.drawLine.IfElse5 // 12885
D;JNE // 12886

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 12887
D=M // 12888
@4 // 12889
A=D+A // 12890
D=M // 12891
@SP // 12892
AM=M+1 // 12893
A=A-1 // 12894
M=D // 12895
@LCL // 12896
A=M // 12897
D=M // 12898
@SP // 12899
AM=M-1 // 12900
D=D+M // 12901
@SP // 12902
AM=M+1 // 12903
A=A-1 // 12904
M=D // 12905
@LCL // 12906
D=M // 12907
@4 // 12908
A=D+A // 12909
D=A // 12910
@R13 // 12911
M=D // 12912
@SP // 12913
AM=M-1 // 12914
D=M // 12915
@R13 // 12916
A=M // 12917
M=D // 12918

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=argument 1}
//}

@LCL // 12919
A=M+1 // 12920
A=A+1 // 12921
A=A+1 // 12922
D=M // 12923
@ARG // 12924
A=M+1 // 12925
M=D+M // 12926

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 12927
0;JMP // 12928

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 12929
0;JMP // 12930

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 12931
AM=M+1 // 12932
A=A-1 // 12933
M=0 // 12934

////ReturnInstruction{}
@RETURN // 12935
0;JMP // 12936

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=0 // 12940

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12941
A=M // 12942
D=M // 12943
@LCL // 12944
A=M // 12945
M=D // 12946

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
@Screen.drawHorizontalLine.EQ.9 // 12947
D=A // 12948
@SP // 12949
AM=M+1 // 12950
A=A-1 // 12951
M=D // 12952
@Screen.drawHorizontalLine.GT.10 // 12953
D=A // 12954
@SP // 12955
AM=M+1 // 12956
A=A-1 // 12957
M=D // 12958
@LCL // 12959
A=M // 12960
D=M // 12961
@SP // 12962
AM=M+1 // 12963
A=A-1 // 12964
M=D // 12965
@ARG // 12966
A=M+1 // 12967
D=M // 12968
@SP // 12969
AM=M-1 // 12970
D=M-D // 12971
@DO_GT // 12972
0;JMP // 12973
(Screen.drawHorizontalLine.GT.10)
D=!D // 12974
@DO_EQ // 12975
0;JMP // 12976
(Screen.drawHorizontalLine.EQ.9)
@WHILE_END_Screen.drawHorizontalLine1 // 12977
D;JNE // 12978

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12979
A=M // 12980
D=M // 12981
@SP // 12982
AM=M+1 // 12983
A=A-1 // 12984
M=D // 12985
@ARG // 12986
A=M+1 // 12987
A=A+1 // 12988
D=M // 12989
@SP // 12990
AM=M+1 // 12991
A=A-1 // 12992
M=D // 12993
// call Screen.drawPixel
@7 // 12994
D=A // 12995
@14 // 12996
M=D // 12997
@Screen.drawPixel // 12998
D=A // 12999
@13 // 13000
M=D // 13001
@Screen.drawHorizontalLine.ret.0 // 13002
D=A // 13003
@CALL // 13004
0;JMP // 13005
(Screen.drawHorizontalLine.ret.0)
@SP // 13006
M=M-1 // 13007

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

@LCL // 13008
A=M // 13009
M=M+1 // 13010

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 13011
0;JMP // 13012

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 13013
AM=M+1 // 13014
A=A-1 // 13015
M=0 // 13016

////ReturnInstruction{}
@RETURN // 13017
0;JMP // 13018

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13019
D=A // 13020
@SP // 13021
AM=D+M // 13022
A=A-1 // 13023
M=0 // 13024
A=A-1 // 13025
M=0 // 13026
A=A-1 // 13027
M=0 // 13028
A=A-1 // 13029
M=0 // 13030
A=A-1 // 13031
M=0 // 13032

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13033
A=M // 13034
M=0 // 13035

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13036
A=M+1 // 13037
A=A+1 // 13038
D=M // 13039
@LCL // 13040
A=M+1 // 13041
M=D // 13042

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 1"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13043
A=M+1 // 13044
A=A+1 // 13045
D=M // 13046
D=D-1 // 13047
D=-D // 13048
@LCL // 13049
A=M+1 // 13050
A=A+1 // 13051
M=D // 13052

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
@Screen.drawCircle.EQ.11 // 13053
D=A // 13054
@SP // 13055
AM=M+1 // 13056
A=A-1 // 13057
M=D // 13058
@Screen.drawCircle.GT.12 // 13059
D=A // 13060
@SP // 13061
AM=M+1 // 13062
A=A-1 // 13063
M=D // 13064
@LCL // 13065
A=M+1 // 13066
D=M // 13067
A=A-1 // 13068
D=M-D // 13069
@DO_GT // 13070
0;JMP // 13071
(Screen.drawCircle.GT.12)
D=!D // 13072
@DO_EQ // 13073
0;JMP // 13074
(Screen.drawCircle.EQ.11)
@WHILE_END_Screen.drawCircle1 // 13075
D;JNE // 13076

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{Screen.drawHorizontalLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13077
A=M // 13078
D=M // 13079
@SP // 13080
AM=M+1 // 13081
A=A-1 // 13082
M=D // 13083
@LCL // 13084
A=M // 13085
D=M // 13086
@SP // 13087
AM=M-1 // 13088
D=M-D // 13089
@SP // 13090
AM=M+1 // 13091
A=A-1 // 13092
M=D // 13093
@ARG // 13094
A=M // 13095
D=M // 13096
@SP // 13097
AM=M+1 // 13098
A=A-1 // 13099
M=D // 13100
@LCL // 13101
A=M // 13102
D=M // 13103
@SP // 13104
AM=M-1 // 13105
D=D+M // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=D // 13110
@ARG // 13111
A=M+1 // 13112
D=M // 13113
@SP // 13114
AM=M+1 // 13115
A=A-1 // 13116
M=D // 13117
@LCL // 13118
A=M+1 // 13119
D=M // 13120
@SP // 13121
AM=M-1 // 13122
D=D+M // 13123
@SP // 13124
AM=M+1 // 13125
A=A-1 // 13126
M=D // 13127
// call Screen.drawHorizontalLine
@8 // 13128
D=A // 13129
@14 // 13130
M=D // 13131
@Screen.drawHorizontalLine // 13132
D=A // 13133
@13 // 13134
M=D // 13135
@Screen.drawCircle.ret.0 // 13136
D=A // 13137
@CALL // 13138
0;JMP // 13139
(Screen.drawCircle.ret.0)
@SP // 13140
M=M-1 // 13141

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
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
//)], call=CallInstruction{Screen.drawHorizontalLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13142
A=M // 13143
D=M // 13144
@SP // 13145
AM=M+1 // 13146
A=A-1 // 13147
M=D // 13148
@LCL // 13149
A=M // 13150
D=M // 13151
@SP // 13152
AM=M-1 // 13153
D=M-D // 13154
@SP // 13155
AM=M+1 // 13156
A=A-1 // 13157
M=D // 13158
@ARG // 13159
A=M // 13160
D=M // 13161
@SP // 13162
AM=M+1 // 13163
A=A-1 // 13164
M=D // 13165
@LCL // 13166
A=M // 13167
D=M // 13168
@SP // 13169
AM=M-1 // 13170
D=D+M // 13171
@SP // 13172
AM=M+1 // 13173
A=A-1 // 13174
M=D // 13175
@ARG // 13176
A=M+1 // 13177
D=M // 13178
@SP // 13179
AM=M+1 // 13180
A=A-1 // 13181
M=D // 13182
@LCL // 13183
A=M+1 // 13184
D=M // 13185
@SP // 13186
AM=M-1 // 13187
D=M-D // 13188
@SP // 13189
AM=M+1 // 13190
A=A-1 // 13191
M=D // 13192
// call Screen.drawHorizontalLine
@8 // 13193
D=A // 13194
@14 // 13195
M=D // 13196
@Screen.drawHorizontalLine // 13197
D=A // 13198
@13 // 13199
M=D // 13200
@Screen.drawCircle.ret.1 // 13201
D=A // 13202
@CALL // 13203
0;JMP // 13204
(Screen.drawCircle.ret.1)
@SP // 13205
M=M-1 // 13206

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
//    binaryOp: "ADD"
//)], call=CallInstruction{Screen.drawHorizontalLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13207
A=M // 13208
D=M // 13209
@SP // 13210
AM=M+1 // 13211
A=A-1 // 13212
M=D // 13213
@LCL // 13214
A=M+1 // 13215
D=M // 13216
@SP // 13217
AM=M-1 // 13218
D=M-D // 13219
@SP // 13220
AM=M+1 // 13221
A=A-1 // 13222
M=D // 13223
@ARG // 13224
A=M // 13225
D=M // 13226
@SP // 13227
AM=M+1 // 13228
A=A-1 // 13229
M=D // 13230
@LCL // 13231
A=M+1 // 13232
D=M // 13233
@SP // 13234
AM=M-1 // 13235
D=D+M // 13236
@SP // 13237
AM=M+1 // 13238
A=A-1 // 13239
M=D // 13240
@ARG // 13241
A=M+1 // 13242
D=M // 13243
@SP // 13244
AM=M+1 // 13245
A=A-1 // 13246
M=D // 13247
@LCL // 13248
A=M // 13249
D=M // 13250
@SP // 13251
AM=M-1 // 13252
D=D+M // 13253
@SP // 13254
AM=M+1 // 13255
A=A-1 // 13256
M=D // 13257
// call Screen.drawHorizontalLine
@8 // 13258
D=A // 13259
@14 // 13260
M=D // 13261
@Screen.drawHorizontalLine // 13262
D=A // 13263
@13 // 13264
M=D // 13265
@Screen.drawCircle.ret.2 // 13266
D=A // 13267
@CALL // 13268
0;JMP // 13269
(Screen.drawCircle.ret.2)
@SP // 13270
M=M-1 // 13271

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
//)], call=CallInstruction{Screen.drawHorizontalLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13272
A=M // 13273
D=M // 13274
@SP // 13275
AM=M+1 // 13276
A=A-1 // 13277
M=D // 13278
@LCL // 13279
A=M+1 // 13280
D=M // 13281
@SP // 13282
AM=M-1 // 13283
D=M-D // 13284
@SP // 13285
AM=M+1 // 13286
A=A-1 // 13287
M=D // 13288
@ARG // 13289
A=M // 13290
D=M // 13291
@SP // 13292
AM=M+1 // 13293
A=A-1 // 13294
M=D // 13295
@LCL // 13296
A=M+1 // 13297
D=M // 13298
@SP // 13299
AM=M-1 // 13300
D=D+M // 13301
@SP // 13302
AM=M+1 // 13303
A=A-1 // 13304
M=D // 13305
@ARG // 13306
A=M+1 // 13307
D=M // 13308
@SP // 13309
AM=M+1 // 13310
A=A-1 // 13311
M=D // 13312
@LCL // 13313
A=M // 13314
D=M // 13315
@SP // 13316
AM=M-1 // 13317
D=M-D // 13318
@SP // 13319
AM=M+1 // 13320
A=A-1 // 13321
M=D // 13322
// call Screen.drawHorizontalLine
@8 // 13323
D=A // 13324
@14 // 13325
M=D // 13326
@Screen.drawHorizontalLine // 13327
D=A // 13328
@13 // 13329
M=D // 13330
@Screen.drawCircle.ret.3 // 13331
D=A // 13332
@CALL // 13333
0;JMP // 13334
(Screen.drawCircle.ret.3)
@SP // 13335
M=M-1 // 13336

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
@Screen.drawCircle.LT.13 // 13337
D=A // 13338
@SP // 13339
AM=M+1 // 13340
A=A-1 // 13341
M=D // 13342
@LCL // 13343
A=M+1 // 13344
A=A+1 // 13345
D=M // 13346
@DO_LT // 13347
0;JMP // 13348
(Screen.drawCircle.LT.13)
D=!D // 13349
@Screen.drawCircle.IfElse1 // 13350
D;JNE // 13351

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

@LCL // 13352
A=M+1 // 13353
A=A+1 // 13354
D=M // 13355
@SP // 13356
AM=M+1 // 13357
A=A-1 // 13358
M=D // 13359
@LCL // 13360
A=M // 13361
D=M // 13362
D=D+M // 13363
@SP // 13364
AM=M-1 // 13365
D=D+M // 13366
@3 // 13367
D=D+A // 13368
@LCL // 13369
A=M+1 // 13370
A=A+1 // 13371
M=D // 13372

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13373
0;JMP // 13374

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////PushPopPair {
//  push: BinaryPushGroup(
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
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13375
A=M+1 // 13376
A=A+1 // 13377
D=M // 13378
@SP // 13379
AM=M+1 // 13380
A=A-1 // 13381
M=D // 13382
@LCL // 13383
A=M+1 // 13384
D=M // 13385
A=A-1 // 13386
D=M-D // 13387
@R13 // 13388
M=D // 13389
D=D+M // 13390
@SP // 13391
AM=M-1 // 13392
D=D+M // 13393
@5 // 13394
D=D+A // 13395
@LCL // 13396
A=M+1 // 13397
A=A+1 // 13398
M=D // 13399

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

@LCL // 13400
A=M+1 // 13401
M=M-1 // 13402

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

@LCL // 13403
A=M // 13404
M=M+1 // 13405

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13406
0;JMP // 13407

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13408
AM=M+1 // 13409
A=A-1 // 13410
M=0 // 13411

////ReturnInstruction{}
@RETURN // 13412
0;JMP // 13413

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13414
D=A // 13415
@SP // 13416
AM=D+M // 13417
A=A-1 // 13418
M=0 // 13419
A=A-1 // 13420
M=0 // 13421
A=A-1 // 13422
M=0 // 13423
A=A-1 // 13424
M=0 // 13425
A=A-1 // 13426
M=0 // 13427
A=A-1 // 13428
M=0 // 13429
A=A-1 // 13430
M=0 // 13431
A=A-1 // 13432
M=0 // 13433
A=A-1 // 13434
M=0 // 13435
A=A-1 // 13436
M=0 // 13437

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13438
D=M // 13439
@9 // 13440
A=D+A // 13441
M=-1 // 13442

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.14 // 13443
D=A // 13444
@SP // 13445
AM=M+1 // 13446
A=A-1 // 13447
M=D // 13448
@Screen.0 // 13449
D=!M // 13450
@DO_EQ // 13451
0;JMP // 13452
(Screen.drawRectangle.EQ.14)
@Screen.drawRectangle.IfElse1 // 13453
D;JNE // 13454

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13455
D=M // 13456
@9 // 13457
A=D+A // 13458
M=0 // 13459

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 13460
0;JMP // 13461

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

@ARG // 13462
A=M+1 // 13463
D=M // 13464
@LCL // 13465
A=M // 13466
M=D // 13467

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
@Screen.drawRectangle.EQ.15 // 13468
D=A // 13469
@SP // 13470
AM=M+1 // 13471
A=A-1 // 13472
M=D // 13473
@Screen.drawRectangle.GT.16 // 13474
D=A // 13475
@SP // 13476
AM=M+1 // 13477
A=A-1 // 13478
M=D // 13479
@LCL // 13480
A=M // 13481
D=M // 13482
@SP // 13483
AM=M+1 // 13484
A=A-1 // 13485
M=D // 13486
@ARG // 13487
A=M+1 // 13488
A=A+1 // 13489
A=A+1 // 13490
D=M // 13491
@SP // 13492
AM=M-1 // 13493
D=M-D // 13494
@DO_GT // 13495
0;JMP // 13496
(Screen.drawRectangle.GT.16)
D=!D // 13497
@DO_EQ // 13498
0;JMP // 13499
(Screen.drawRectangle.EQ.15)
@WHILE_END_Screen.drawRectangle1 // 13500
D;JNE // 13501

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13502
A=M // 13503
D=M // 13504
@SP // 13505
AM=M+1 // 13506
A=A-1 // 13507
M=D // 13508
@16 // 13509
D=A // 13510
@SP // 13511
AM=M+1 // 13512
A=A-1 // 13513
M=D // 13514
// call Math.divide
@7 // 13515
D=A // 13516
@14 // 13517
M=D // 13518
@Math.divide // 13519
D=A // 13520
@13 // 13521
M=D // 13522
@Screen.drawRectangle.ret.0 // 13523
D=A // 13524
@CALL // 13525
0;JMP // 13526
(Screen.drawRectangle.ret.0)
@SP // 13527
AM=M-1 // 13528
D=M // 13529
@LCL // 13530
A=M+1 // 13531
M=D // 13532

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13533
A=M+1 // 13534
A=A+1 // 13535
D=M // 13536
@SP // 13537
AM=M+1 // 13538
A=A-1 // 13539
M=D // 13540
@16 // 13541
D=A // 13542
@SP // 13543
AM=M+1 // 13544
A=A-1 // 13545
M=D // 13546
// call Math.divide
@7 // 13547
D=A // 13548
@14 // 13549
M=D // 13550
@Math.divide // 13551
D=A // 13552
@13 // 13553
M=D // 13554
@Screen.drawRectangle.ret.1 // 13555
D=A // 13556
@CALL // 13557
0;JMP // 13558
(Screen.drawRectangle.ret.1)
@SP // 13559
AM=M-1 // 13560
D=M // 13561
@LCL // 13562
A=M+1 // 13563
A=A+1 // 13564
M=D // 13565

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 13566
A=M // 13567
D=M // 13568
@15 // 13569
D=D&A // 13570
@LCL // 13571
A=M+1 // 13572
A=A+1 // 13573
A=A+1 // 13574
M=D // 13575

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 4}
//}

@ARG // 13576
A=M+1 // 13577
A=A+1 // 13578
D=M // 13579
@15 // 13580
D=D&A // 13581
@SP // 13582
AM=M+1 // 13583
A=A-1 // 13584
M=D // 13585
@LCL // 13586
D=M // 13587
@4 // 13588
A=D+A // 13589
D=A // 13590
@R13 // 13591
M=D // 13592
@SP // 13593
AM=M-1 // 13594
D=M // 13595
@R13 // 13596
A=M // 13597
M=D // 13598

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13599
A=M // 13600
D=M // 13601
@SP // 13602
AM=M+1 // 13603
A=A-1 // 13604
M=D // 13605
@32 // 13606
D=A // 13607
@SP // 13608
AM=M+1 // 13609
A=A-1 // 13610
M=D // 13611
// call Math.multiply
@7 // 13612
D=A // 13613
@14 // 13614
M=D // 13615
@Math.multiply // 13616
D=A // 13617
@13 // 13618
M=D // 13619
@Screen.drawRectangle.ret.2 // 13620
D=A // 13621
@CALL // 13622
0;JMP // 13623
(Screen.drawRectangle.ret.2)
@LCL // 13624
D=M // 13625
@5 // 13626
A=D+A // 13627
D=A // 13628
@R13 // 13629
M=D // 13630
@SP // 13631
AM=M-1 // 13632
D=M // 13633
@R13 // 13634
A=M // 13635
M=D // 13636

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
@Screen.drawRectangle.EQ.17 // 13637
D=A // 13638
@SP // 13639
AM=M+1 // 13640
A=A-1 // 13641
M=D // 13642
@LCL // 13643
A=M+1 // 13644
A=A+1 // 13645
D=M // 13646
A=A-1 // 13647
D=M-D // 13648
@DO_EQ // 13649
0;JMP // 13650
(Screen.drawRectangle.EQ.17)
D=!D // 13651
@Screen.drawRectangle.IfElse2 // 13652
D;JNE // 13653

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{Math.twoToThe}},
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "SUB"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Math.twoToThe}},
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "SUB"
//        ),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 13654
D=M // 13655
@4 // 13656
A=D+A // 13657
D=M // 13658
@SP // 13659
AM=M+1 // 13660
A=A-1 // 13661
M=D+1 // 13662
// call Math.twoToThe
@6 // 13663
D=A // 13664
@14 // 13665
M=D // 13666
@Math.twoToThe // 13667
D=A // 13668
@13 // 13669
M=D // 13670
@Screen.drawRectangle.ret.3 // 13671
D=A // 13672
@CALL // 13673
0;JMP // 13674
(Screen.drawRectangle.ret.3)
@SP // 13675
AM=M-1 // 13676
D=M // 13677
D=D-1 // 13678
@SP // 13679
AM=M+1 // 13680
A=A-1 // 13681
M=D // 13682
@LCL // 13683
A=M+1 // 13684
A=A+1 // 13685
A=A+1 // 13686
D=M // 13687
@SP // 13688
AM=M+1 // 13689
A=A-1 // 13690
M=D // 13691
// call Math.twoToThe
@6 // 13692
D=A // 13693
@14 // 13694
M=D // 13695
@Math.twoToThe // 13696
D=A // 13697
@13 // 13698
M=D // 13699
@Screen.drawRectangle.ret.4 // 13700
D=A // 13701
@CALL // 13702
0;JMP // 13703
(Screen.drawRectangle.ret.4)
@SP // 13704
AM=M-1 // 13705
D=M // 13706
D=D-1 // 13707
@SP // 13708
AM=M-1 // 13709
D=M-D // 13710
@SP // 13711
AM=M+1 // 13712
A=A-1 // 13713
M=D // 13714
@LCL // 13715
D=M // 13716
@6 // 13717
A=D+A // 13718
D=A // 13719
@R13 // 13720
M=D // 13721
@SP // 13722
AM=M-1 // 13723
D=M // 13724
@R13 // 13725
A=M // 13726
M=D // 13727

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 13728
D=M // 13729
@5 // 13730
A=D+A // 13731
D=M // 13732
@SP // 13733
AM=M+1 // 13734
A=A-1 // 13735
M=D // 13736
@LCL // 13737
A=M+1 // 13738
D=M // 13739
@SP // 13740
AM=M-1 // 13741
D=D+M // 13742
@SP // 13743
AM=M+1 // 13744
A=A-1 // 13745
M=D // 13746
@LCL // 13747
D=M // 13748
@7 // 13749
A=D+A // 13750
D=A // 13751
@R13 // 13752
M=D // 13753
@SP // 13754
AM=M-1 // 13755
D=M // 13756
@R13 // 13757
A=M // 13758
M=D // 13759

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.18 // 13760
D=A // 13761
@SP // 13762
AM=M+1 // 13763
A=A-1 // 13764
M=D // 13765
@Screen.0 // 13766
D=M // 13767
@DO_EQ // 13768
0;JMP // 13769
(Screen.drawRectangle.EQ.18)
@Screen.drawRectangle.IfElse3 // 13770
D;JNE // 13771

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 13772
D=M // 13773
@7 // 13774
A=D+A // 13775
D=M // 13776
@16384 // 13777
D=D+A // 13778
@SP // 13779
AM=M+1 // 13780
A=A-1 // 13781
M=D // 13782
@LCL // 13783
D=M // 13784
@7 // 13785
A=D+A // 13786
D=M // 13787
@16384 // 13788
A=D+A // 13789
D=M // 13790
@SP // 13791
AM=M+1 // 13792
A=A-1 // 13793
M=D // 13794
@LCL // 13795
D=M // 13796
@6 // 13797
A=D+A // 13798
D=M // 13799
@SP // 13800
AM=M-1 // 13801
D=D|M // 13802
@SP // 13803
AM=M-1 // 13804
A=M // 13805
M=D // 13806

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 13807
0;JMP // 13808

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 13809
D=M // 13810
@7 // 13811
A=D+A // 13812
D=M // 13813
@16384 // 13814
D=D+A // 13815
@SP // 13816
AM=M+1 // 13817
A=A-1 // 13818
M=D // 13819
@LCL // 13820
D=M // 13821
@7 // 13822
A=D+A // 13823
D=M // 13824
@16384 // 13825
A=D+A // 13826
D=M // 13827
@SP // 13828
AM=M+1 // 13829
A=A-1 // 13830
M=D // 13831
@LCL // 13832
D=M // 13833
@6 // 13834
A=D+A // 13835
D=!M // 13836
@SP // 13837
AM=M-1 // 13838
D=D&M // 13839
@SP // 13840
AM=M-1 // 13841
A=M // 13842
M=D // 13843

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 13844
0;JMP // 13845

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    BinaryPushGroup(
//        left:
//CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Math.twoToThe}},
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "SUB"
//    ),
//NOT)
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 13846
A=M+1 // 13847
A=A+1 // 13848
A=A+1 // 13849
D=M // 13850
@SP // 13851
AM=M+1 // 13852
A=A-1 // 13853
M=D // 13854
// call Math.twoToThe
@6 // 13855
D=A // 13856
@14 // 13857
M=D // 13858
@Math.twoToThe // 13859
D=A // 13860
@13 // 13861
M=D // 13862
@Screen.drawRectangle.ret.5 // 13863
D=A // 13864
@CALL // 13865
0;JMP // 13866
(Screen.drawRectangle.ret.5)
@SP // 13867
AM=M-1 // 13868
D=M // 13869
D=D-1 // 13870
@SP // 13871
AM=M+1 // 13872
A=A-1 // 13873
M=D // 13874
@SP // 13875
A=M-1 // 13876
M=!D // 13877
@LCL // 13878
D=M // 13879
@6 // 13880
A=D+A // 13881
D=A // 13882
@R13 // 13883
M=D // 13884
@SP // 13885
AM=M-1 // 13886
D=M // 13887
@R13 // 13888
A=M // 13889
M=D // 13890

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 13891
D=M // 13892
@5 // 13893
A=D+A // 13894
D=M // 13895
@SP // 13896
AM=M+1 // 13897
A=A-1 // 13898
M=D // 13899
@LCL // 13900
A=M+1 // 13901
D=M // 13902
@SP // 13903
AM=M-1 // 13904
D=D+M // 13905
@SP // 13906
AM=M+1 // 13907
A=A-1 // 13908
M=D // 13909
@LCL // 13910
D=M // 13911
@7 // 13912
A=D+A // 13913
D=A // 13914
@R13 // 13915
M=D // 13916
@SP // 13917
AM=M-1 // 13918
D=M // 13919
@R13 // 13920
A=M // 13921
M=D // 13922

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.19 // 13923
D=A // 13924
@SP // 13925
AM=M+1 // 13926
A=A-1 // 13927
M=D // 13928
@Screen.0 // 13929
D=M // 13930
@DO_EQ // 13931
0;JMP // 13932
(Screen.drawRectangle.EQ.19)
@Screen.drawRectangle.IfElse4 // 13933
D;JNE // 13934

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 13935
D=M // 13936
@7 // 13937
A=D+A // 13938
D=M // 13939
@16384 // 13940
D=D+A // 13941
@SP // 13942
AM=M+1 // 13943
A=A-1 // 13944
M=D // 13945
@LCL // 13946
D=M // 13947
@7 // 13948
A=D+A // 13949
D=M // 13950
@16384 // 13951
A=D+A // 13952
D=M // 13953
@SP // 13954
AM=M+1 // 13955
A=A-1 // 13956
M=D // 13957
@LCL // 13958
D=M // 13959
@6 // 13960
A=D+A // 13961
D=M // 13962
@SP // 13963
AM=M-1 // 13964
D=D|M // 13965
@SP // 13966
AM=M-1 // 13967
A=M // 13968
M=D // 13969

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 13970
0;JMP // 13971

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 13972
D=M // 13973
@7 // 13974
A=D+A // 13975
D=M // 13976
@16384 // 13977
D=D+A // 13978
@SP // 13979
AM=M+1 // 13980
A=A-1 // 13981
M=D // 13982
@LCL // 13983
D=M // 13984
@7 // 13985
A=D+A // 13986
D=M // 13987
@16384 // 13988
A=D+A // 13989
D=M // 13990
@SP // 13991
AM=M+1 // 13992
A=A-1 // 13993
M=D // 13994
@LCL // 13995
D=M // 13996
@6 // 13997
A=D+A // 13998
D=!M // 13999
@SP // 14000
AM=M-1 // 14001
D=D&M // 14002
@SP // 14003
AM=M-1 // 14004
A=M // 14005
M=D // 14006

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

@LCL // 14007
A=M+1 // 14008
D=M // 14009
@SP // 14010
AM=M+1 // 14011
A=A-1 // 14012
M=D+1 // 14013
@LCL // 14014
D=M // 14015
@8 // 14016
A=D+A // 14017
D=A // 14018
@R13 // 14019
M=D // 14020
@SP // 14021
AM=M-1 // 14022
D=M // 14023
@R13 // 14024
A=M // 14025
M=D // 14026

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
@Screen.drawRectangle.LT.20 // 14027
D=A // 14028
@SP // 14029
AM=M+1 // 14030
A=A-1 // 14031
M=D // 14032
@LCL // 14033
D=M // 14034
@8 // 14035
A=D+A // 14036
D=M // 14037
@SP // 14038
AM=M+1 // 14039
A=A-1 // 14040
M=D // 14041
@LCL // 14042
A=M+1 // 14043
A=A+1 // 14044
D=M // 14045
@SP // 14046
AM=M-1 // 14047
D=M-D // 14048
@DO_LT // 14049
0;JMP // 14050
(Screen.drawRectangle.LT.20)
D=!D // 14051
@WHILE_END_Screen.drawRectangle2 // 14052
D;JNE // 14053

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

@LCL // 14054
D=M // 14055
@8 // 14056
A=D+A // 14057
D=M // 14058
A=A-1 // 14059
A=A-1 // 14060
A=A-1 // 14061
D=D+M // 14062
@SP // 14063
AM=M+1 // 14064
A=A-1 // 14065
M=D // 14066
@LCL // 14067
D=M // 14068
@7 // 14069
A=D+A // 14070
D=A // 14071
@R13 // 14072
M=D // 14073
@SP // 14074
AM=M-1 // 14075
D=M // 14076
@R13 // 14077
A=M // 14078
M=D // 14079

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14080
D=M // 14081
@7 // 14082
A=D+A // 14083
D=M // 14084
@16384 // 14085
D=D+A // 14086
@SP // 14087
AM=M+1 // 14088
A=A-1 // 14089
M=D // 14090
@LCL // 14091
D=M // 14092
@9 // 14093
A=D+A // 14094
D=M // 14095
@SP // 14096
AM=M-1 // 14097
A=M // 14098
M=D // 14099

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 14100
D=M // 14101
@8 // 14102
A=D+A // 14103
M=M+1 // 14104

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14105
0;JMP // 14106

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)], call=CallInstruction{Math.twoToThe}},
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 14107
D=M // 14108
@4 // 14109
A=D+A // 14110
D=M // 14111
@SP // 14112
AM=M+1 // 14113
A=A-1 // 14114
M=D+1 // 14115
// call Math.twoToThe
@6 // 14116
D=A // 14117
@14 // 14118
M=D // 14119
@Math.twoToThe // 14120
D=A // 14121
@13 // 14122
M=D // 14123
@Screen.drawRectangle.ret.6 // 14124
D=A // 14125
@CALL // 14126
0;JMP // 14127
(Screen.drawRectangle.ret.6)
@SP // 14128
AM=M-1 // 14129
D=M // 14130
D=D-1 // 14131
@SP // 14132
AM=M+1 // 14133
A=A-1 // 14134
M=D // 14135
@LCL // 14136
D=M // 14137
@6 // 14138
A=D+A // 14139
D=A // 14140
@R13 // 14141
M=D // 14142
@SP // 14143
AM=M-1 // 14144
D=M // 14145
@R13 // 14146
A=M // 14147
M=D // 14148

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 14149
D=M // 14150
@5 // 14151
A=D+A // 14152
D=M // 14153
A=A-1 // 14154
A=A-1 // 14155
A=A-1 // 14156
D=D+M // 14157
@SP // 14158
AM=M+1 // 14159
A=A-1 // 14160
M=D // 14161
@LCL // 14162
D=M // 14163
@7 // 14164
A=D+A // 14165
D=A // 14166
@R13 // 14167
M=D // 14168
@SP // 14169
AM=M-1 // 14170
D=M // 14171
@R13 // 14172
A=M // 14173
M=D // 14174

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.21 // 14175
D=A // 14176
@SP // 14177
AM=M+1 // 14178
A=A-1 // 14179
M=D // 14180
@Screen.0 // 14181
D=M // 14182
@DO_EQ // 14183
0;JMP // 14184
(Screen.drawRectangle.EQ.21)
@Screen.drawRectangle.IfElse5 // 14185
D;JNE // 14186

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14187
D=M // 14188
@7 // 14189
A=D+A // 14190
D=M // 14191
@16384 // 14192
D=D+A // 14193
@SP // 14194
AM=M+1 // 14195
A=A-1 // 14196
M=D // 14197
@LCL // 14198
D=M // 14199
@7 // 14200
A=D+A // 14201
D=M // 14202
@16384 // 14203
A=D+A // 14204
D=M // 14205
@SP // 14206
AM=M+1 // 14207
A=A-1 // 14208
M=D // 14209
@LCL // 14210
D=M // 14211
@6 // 14212
A=D+A // 14213
D=M // 14214
@SP // 14215
AM=M-1 // 14216
D=D|M // 14217
@SP // 14218
AM=M-1 // 14219
A=M // 14220
M=D // 14221

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14222
0;JMP // 14223

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////PushWriter{source=BinaryPushGroup(
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
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14224
D=M // 14225
@7 // 14226
A=D+A // 14227
D=M // 14228
@16384 // 14229
D=D+A // 14230
@SP // 14231
AM=M+1 // 14232
A=A-1 // 14233
M=D // 14234
@LCL // 14235
D=M // 14236
@7 // 14237
A=D+A // 14238
D=M // 14239
@16384 // 14240
A=D+A // 14241
D=M // 14242
@SP // 14243
AM=M+1 // 14244
A=A-1 // 14245
M=D // 14246
@LCL // 14247
D=M // 14248
@6 // 14249
A=D+A // 14250
D=!M // 14251
@SP // 14252
AM=M-1 // 14253
D=D&M // 14254
@SP // 14255
AM=M-1 // 14256
A=M // 14257
M=D // 14258

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

@LCL // 14259
A=M // 14260
M=M+1 // 14261

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14262
0;JMP // 14263

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14264
AM=M+1 // 14265
A=A-1 // 14266
M=0 // 14267

////ReturnInstruction{}
@RETURN // 14268
0;JMP // 14269

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14270
AM=M+1 // 14271
A=A-1 // 14272
M=0 // 14273

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14274
A=M // 14275
M=0 // 14276

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
@Screen.clearScreen.LT.22 // 14277
D=A // 14278
@SP // 14279
AM=M+1 // 14280
A=A-1 // 14281
M=D // 14282
@LCL // 14283
A=M // 14284
D=M // 14285
@8192 // 14286
D=D-A // 14287
@DO_LT // 14288
0;JMP // 14289
(Screen.clearScreen.LT.22)
D=!D // 14290
@WHILE_END_Screen.clearScreen1 // 14291
D;JNE // 14292

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14293
A=M // 14294
D=M // 14295
@16384 // 14296
D=D+A // 14297
@SP // 14298
AM=M+1 // 14299
A=A-1 // 14300
M=D // 14301
D=0 // 14302
@SP // 14303
AM=M-1 // 14304
A=M // 14305
M=D // 14306

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

@LCL // 14307
A=M // 14308
M=M+1 // 14309

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14310
0;JMP // 14311

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14312
AM=M+1 // 14313
A=A-1 // 14314
M=0 // 14315

////ReturnInstruction{}
@RETURN // 14316
0;JMP // 14317

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14318
D=A // 14319
@SP // 14320
AM=M+1 // 14321
A=A-1 // 14322
M=D // 14323
// call Memory.alloc
@6 // 14324
D=A // 14325
@14 // 14326
M=D // 14327
@Memory.alloc // 14328
D=A // 14329
@13 // 14330
M=D // 14331
@String.new.ret.0 // 14332
D=A // 14333
@CALL // 14334
0;JMP // 14335
(String.new.ret.0)
@SP // 14336
AM=M-1 // 14337
D=M // 14338
@3 // 14339
M=D // 14340

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
@String.new.EQ.0 // 14341
D=A // 14342
@SP // 14343
AM=M+1 // 14344
A=A-1 // 14345
M=D // 14346
@ARG // 14347
A=M // 14348
D=M // 14349
@DO_EQ // 14350
0;JMP // 14351
(String.new.EQ.0)
@String.new.IfElse1 // 14352
D;JEQ // 14353

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14354
A=M // 14355
M=0 // 14356

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14357
0;JMP // 14358

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14359
A=M // 14360
D=M // 14361
@SP // 14362
AM=M+1 // 14363
A=A-1 // 14364
M=D // 14365
// call Array.new
@6 // 14366
D=A // 14367
@14 // 14368
M=D // 14369
@Array.new // 14370
D=A // 14371
@13 // 14372
M=D // 14373
@String.new.ret.1 // 14374
D=A // 14375
@CALL // 14376
0;JMP // 14377
(String.new.ret.1)
@SP // 14378
AM=M-1 // 14379
D=M // 14380
@THIS // 14381
A=M // 14382
M=D // 14383

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14384
A=M // 14385
D=M // 14386
@THIS // 14387
A=M+1 // 14388
A=A+1 // 14389
M=D // 14390

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14391
A=M+1 // 14392
M=0 // 14393

////PushInstruction("pointer 0")
@3 // 14394
D=M // 14395
@SP // 14396
AM=M+1 // 14397
A=A-1 // 14398
M=D // 14399

////ReturnInstruction{}
@RETURN // 14400
0;JMP // 14401

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14402
A=M // 14403
D=M // 14404
@3 // 14405
M=D // 14406

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
@String.dispose.EQ.1 // 14407
D=A // 14408
@SP // 14409
AM=M+1 // 14410
A=A-1 // 14411
M=D // 14412
@String.dispose.EQ.2 // 14413
D=A // 14414
@SP // 14415
AM=M+1 // 14416
A=A-1 // 14417
M=D // 14418
@THIS // 14419
A=M // 14420
D=M // 14421
@DO_EQ // 14422
0;JMP // 14423
(String.dispose.EQ.2)
D=!D // 14424
@DO_EQ // 14425
0;JMP // 14426
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 14427
D;JNE // 14428

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14429
A=M // 14430
D=M // 14431
@SP // 14432
AM=M+1 // 14433
A=A-1 // 14434
M=D // 14435
// call Array.dispose
@6 // 14436
D=A // 14437
@14 // 14438
M=D // 14439
@Array.dispose // 14440
D=A // 14441
@13 // 14442
M=D // 14443
@String.dispose.ret.0 // 14444
D=A // 14445
@CALL // 14446
0;JMP // 14447
(String.dispose.ret.0)
@SP // 14448
M=M-1 // 14449

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 14450
0;JMP // 14451

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14452
AM=M+1 // 14453
A=A-1 // 14454
M=0 // 14455

////ReturnInstruction{}
@RETURN // 14456
0;JMP // 14457

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14458
A=M // 14459
D=M // 14460
@3 // 14461
M=D // 14462

////PushInstruction("this 1")
@THIS // 14463
A=M+1 // 14464
D=M // 14465
@SP // 14466
AM=M+1 // 14467
A=A-1 // 14468
M=D // 14469

////ReturnInstruction{}
@RETURN // 14470
0;JMP // 14471

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14472
A=M // 14473
D=M // 14474
@3 // 14475
M=D // 14476

////Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 0"),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "ADD"
//        )
//)
@THIS // 14477
A=M // 14478
D=M // 14479
@SP // 14480
AM=M+1 // 14481
A=A-1 // 14482
M=D // 14483
@ARG // 14484
A=M+1 // 14485
D=M // 14486
@SP // 14487
AM=M-1 // 14488
A=D+M // 14489
D=M // 14490
@SP // 14491
AM=M+1 // 14492
A=A-1 // 14493
M=D // 14494

////ReturnInstruction{}
@RETURN // 14495
0;JMP // 14496

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14497
A=M // 14498
D=M // 14499
@3 // 14500
M=D // 14501

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14502
A=M // 14503
D=M // 14504
@SP // 14505
AM=M+1 // 14506
A=A-1 // 14507
M=D // 14508
@ARG // 14509
A=M+1 // 14510
D=M // 14511
@SP // 14512
AM=M-1 // 14513
D=D+M // 14514
@SP // 14515
AM=M+1 // 14516
A=A-1 // 14517
M=D // 14518
@ARG // 14519
A=M+1 // 14520
A=A+1 // 14521
D=M // 14522
@SP // 14523
AM=M-1 // 14524
A=M // 14525
M=D // 14526

////PushInstruction("constant 0")
@SP // 14527
AM=M+1 // 14528
A=A-1 // 14529
M=0 // 14530

////ReturnInstruction{}
@RETURN // 14531
0;JMP // 14532

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14533
AM=M+1 // 14534
A=A-1 // 14535
M=0 // 14536

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14537
A=M // 14538
D=M // 14539
@3 // 14540
M=D // 14541

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
@String.appendChar.EQ.3 // 14542
D=A // 14543
@SP // 14544
AM=M+1 // 14545
A=A-1 // 14546
M=D // 14547
@THIS // 14548
A=M+1 // 14549
A=A+1 // 14550
D=M // 14551
A=A-1 // 14552
D=M-D // 14553
@DO_EQ // 14554
0;JMP // 14555
(String.appendChar.EQ.3)
D=!D // 14556
@String.appendChar.IfElse1 // 14557
D;JNE // 14558

////PushPopPair {
//  push: CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 14559
A=M+1 // 14560
A=A+1 // 14561
D=M // 14562
D=D+M // 14563
@SP // 14564
AM=M+1 // 14565
A=A-1 // 14566
M=D // 14567
// call Array.new
@6 // 14568
D=A // 14569
@14 // 14570
M=D // 14571
@Array.new // 14572
D=A // 14573
@13 // 14574
M=D // 14575
@String.appendChar.ret.0 // 14576
D=A // 14577
@CALL // 14578
0;JMP // 14579
(String.appendChar.ret.0)
@SP // 14580
AM=M-1 // 14581
D=M // 14582
@LCL // 14583
A=M // 14584
M=D // 14585

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14586
A=M // 14587
D=M // 14588
@SP // 14589
AM=M+1 // 14590
A=A-1 // 14591
M=D // 14592
@LCL // 14593
A=M // 14594
D=M // 14595
@SP // 14596
AM=M+1 // 14597
A=A-1 // 14598
M=D // 14599
@THIS // 14600
A=M+1 // 14601
D=M // 14602
@SP // 14603
AM=M+1 // 14604
A=A-1 // 14605
M=D // 14606
// call Memory.copy
@8 // 14607
D=A // 14608
@14 // 14609
M=D // 14610
@Memory.copy // 14611
D=A // 14612
@13 // 14613
M=D // 14614
@String.appendChar.ret.1 // 14615
D=A // 14616
@CALL // 14617
0;JMP // 14618
(String.appendChar.ret.1)
@SP // 14619
M=M-1 // 14620

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14621
A=M // 14622
D=M // 14623
@SP // 14624
AM=M+1 // 14625
A=A-1 // 14626
M=D // 14627
// call Array.dispose
@6 // 14628
D=A // 14629
@14 // 14630
M=D // 14631
@Array.dispose // 14632
D=A // 14633
@13 // 14634
M=D // 14635
@String.appendChar.ret.2 // 14636
D=A // 14637
@CALL // 14638
0;JMP // 14639
(String.appendChar.ret.2)
@SP // 14640
M=M-1 // 14641

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 2"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=this 2}
//}

@THIS // 14642
A=M+1 // 14643
A=A+1 // 14644
D=M // 14645
@THIS // 14646
A=M+1 // 14647
A=A+1 // 14648
M=D+M // 14649

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14650
A=M // 14651
D=M // 14652
@THIS // 14653
A=M // 14654
M=D // 14655

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 14656
0;JMP // 14657

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("this 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14658
A=M+1 // 14659
D=M // 14660
A=A-1 // 14661
D=D+M // 14662
@SP // 14663
AM=M+1 // 14664
A=A-1 // 14665
M=D // 14666
@ARG // 14667
A=M+1 // 14668
D=M // 14669
@SP // 14670
AM=M-1 // 14671
A=M // 14672
M=D // 14673

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14674
A=M+1 // 14675
M=M+1 // 14676

////PushInstruction("pointer 0")
@3 // 14677
D=M // 14678
@SP // 14679
AM=M+1 // 14680
A=A-1 // 14681
M=D // 14682

////ReturnInstruction{}
@RETURN // 14683
0;JMP // 14684

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14685
A=M // 14686
D=M // 14687
@3 // 14688
M=D // 14689

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14690
A=M+1 // 14691
M=M-1 // 14692

////PushInstruction("constant 0")
@SP // 14693
AM=M+1 // 14694
A=A-1 // 14695
M=0 // 14696

////ReturnInstruction{}
@RETURN // 14697
0;JMP // 14698

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14699
M=M+1 // 14700
AM=M+1 // 14701
A=A-1 // 14702
M=0 // 14703
A=A-1 // 14704
M=0 // 14705

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14706
A=M // 14707
D=M // 14708
@3 // 14709
M=D // 14710

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14711
A=M+1 // 14712
M=1 // 14713

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14714
A=M // 14715
M=0 // 14716

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
@String.intValue.LT.4 // 14717
D=A // 14718
@SP // 14719
AM=M+1 // 14720
A=A-1 // 14721
M=D // 14722
@LCL // 14723
A=M+1 // 14724
D=M // 14725
@SP // 14726
AM=M+1 // 14727
A=A-1 // 14728
M=D // 14729
@THIS // 14730
A=M+1 // 14731
D=M // 14732
@SP // 14733
AM=M-1 // 14734
D=M-D // 14735
@DO_LT // 14736
0;JMP // 14737
(String.intValue.LT.4)
D=!D // 14738
@WHILE_END_String.intValue1 // 14739
D;JNE // 14740

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 10")], call=CallInstruction{Math.multiply}},
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
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14741
A=M // 14742
D=M // 14743
@SP // 14744
AM=M+1 // 14745
A=A-1 // 14746
M=D // 14747
@10 // 14748
D=A // 14749
@SP // 14750
AM=M+1 // 14751
A=A-1 // 14752
M=D // 14753
// call Math.multiply
@7 // 14754
D=A // 14755
@14 // 14756
M=D // 14757
@Math.multiply // 14758
D=A // 14759
@13 // 14760
M=D // 14761
@String.intValue.ret.0 // 14762
D=A // 14763
@CALL // 14764
0;JMP // 14765
(String.intValue.ret.0)
@THIS // 14766
A=M // 14767
D=M // 14768
@SP // 14769
AM=M+1 // 14770
A=A-1 // 14771
M=D // 14772
@LCL // 14773
A=M+1 // 14774
D=M // 14775
@SP // 14776
AM=M-1 // 14777
A=D+M // 14778
D=M // 14779
@48 // 14780
D=D-A // 14781
@SP // 14782
AM=M-1 // 14783
D=D+M // 14784
@LCL // 14785
A=M // 14786
M=D // 14787

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14788
A=M+1 // 14789
M=M+1 // 14790

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 14791
0;JMP // 14792

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 14793
A=M // 14794
D=M // 14795
@SP // 14796
AM=M+1 // 14797
A=A-1 // 14798
M=D // 14799

////ReturnInstruction{}
@RETURN // 14800
0;JMP // 14801

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 14802
D=A // 14803
@SP // 14804
AM=D+M // 14805
A=A-1 // 14806
M=0 // 14807
A=A-1 // 14808
M=0 // 14809
A=A-1 // 14810
M=0 // 14811
A=A-1 // 14812
M=0 // 14813
A=A-1 // 14814
M=0 // 14815
A=A-1 // 14816
M=0 // 14817

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14818
A=M // 14819
D=M // 14820
@3 // 14821
M=D // 14822

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14823
A=M+1 // 14824
M=0 // 14825

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14826
D=M // 14827
@4 // 14828
A=D+A // 14829
M=0 // 14830

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
@String.setInt.EQ.5 // 14831
D=A // 14832
@SP // 14833
AM=M+1 // 14834
A=A-1 // 14835
M=D // 14836
@ARG // 14837
A=M+1 // 14838
D=M // 14839
@DO_EQ // 14840
0;JMP // 14841
(String.setInt.EQ.5)
@String.setInt.IfElse1 // 14842
D;JEQ // 14843

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14844
D=M // 14845
@SP // 14846
AM=M+1 // 14847
A=A-1 // 14848
M=D // 14849
@48 // 14850
D=A // 14851
@SP // 14852
AM=M+1 // 14853
A=A-1 // 14854
M=D // 14855
// call String.appendChar
@7 // 14856
D=A // 14857
@14 // 14858
M=D // 14859
@String.appendChar // 14860
D=A // 14861
@13 // 14862
M=D // 14863
@String.setInt.ret.0 // 14864
D=A // 14865
@CALL // 14866
0;JMP // 14867
(String.setInt.ret.0)
@SP // 14868
M=M-1 // 14869

////PushInstruction("constant 0")
@SP // 14870
AM=M+1 // 14871
A=A-1 // 14872
M=0 // 14873

////ReturnInstruction{}
@RETURN // 14874
0;JMP // 14875

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 14876
0;JMP // 14877

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
@String.setInt.LT.6 // 14878
D=A // 14879
@SP // 14880
AM=M+1 // 14881
A=A-1 // 14882
M=D // 14883
@ARG // 14884
A=M+1 // 14885
D=M // 14886
@DO_LT // 14887
0;JMP // 14888
(String.setInt.LT.6)
D=!D // 14889
@String.setInt.IfElse2 // 14890
D;JNE // 14891

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14892
D=M // 14893
@4 // 14894
A=D+A // 14895
M=1 // 14896

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
@String.setInt.EQ.7 // 14897
D=A // 14898
@SP // 14899
AM=M+1 // 14900
A=A-1 // 14901
M=D // 14902
@String.setInt.LT.8 // 14903
D=A // 14904
@SP // 14905
AM=M+1 // 14906
A=A-1 // 14907
M=D // 14908
@ARG // 14909
A=M+1 // 14910
D=M // 14911
@DO_LT // 14912
0;JMP // 14913
(String.setInt.LT.8)
@SP // 14914
AM=M+1 // 14915
A=A-1 // 14916
M=D // 14917
@String.setInt.EQ.9 // 14918
D=A // 14919
@SP // 14920
AM=M+1 // 14921
A=A-1 // 14922
M=D // 14923
@ARG // 14924
A=M+1 // 14925
D=M // 14926
@32767 // 14927
D=D&A // 14928
@32767 // 14929
D=D-A // 14930
@DO_EQ // 14931
0;JMP // 14932
(String.setInt.EQ.9)
@SP // 14933
AM=M-1 // 14934
D=D&M // 14935
@DO_EQ // 14936
0;JMP // 14937
(String.setInt.EQ.7)
@String.setInt.IfElse3 // 14938
D;JNE // 14939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14940
D=M // 14941
@SP // 14942
AM=M+1 // 14943
A=A-1 // 14944
M=D // 14945
@45 // 14946
D=A // 14947
@SP // 14948
AM=M+1 // 14949
A=A-1 // 14950
M=D // 14951
// call String.appendChar
@7 // 14952
D=A // 14953
@14 // 14954
M=D // 14955
@String.appendChar // 14956
D=A // 14957
@13 // 14958
M=D // 14959
@String.setInt.ret.1 // 14960
D=A // 14961
@CALL // 14962
0;JMP // 14963
(String.setInt.ret.1)
@SP // 14964
M=M-1 // 14965

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14966
D=M // 14967
@SP // 14968
AM=M+1 // 14969
A=A-1 // 14970
M=D // 14971
@51 // 14972
D=A // 14973
@SP // 14974
AM=M+1 // 14975
A=A-1 // 14976
M=D // 14977
// call String.appendChar
@7 // 14978
D=A // 14979
@14 // 14980
M=D // 14981
@String.appendChar // 14982
D=A // 14983
@13 // 14984
M=D // 14985
@String.setInt.ret.2 // 14986
D=A // 14987
@CALL // 14988
0;JMP // 14989
(String.setInt.ret.2)
@SP // 14990
M=M-1 // 14991

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14992
D=M // 14993
@SP // 14994
AM=M+1 // 14995
A=A-1 // 14996
M=D // 14997
@50 // 14998
D=A // 14999
@SP // 15000
AM=M+1 // 15001
A=A-1 // 15002
M=D // 15003
// call String.appendChar
@7 // 15004
D=A // 15005
@14 // 15006
M=D // 15007
@String.appendChar // 15008
D=A // 15009
@13 // 15010
M=D // 15011
@String.setInt.ret.3 // 15012
D=A // 15013
@CALL // 15014
0;JMP // 15015
(String.setInt.ret.3)
@SP // 15016
M=M-1 // 15017

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15018
D=M // 15019
@SP // 15020
AM=M+1 // 15021
A=A-1 // 15022
M=D // 15023
@55 // 15024
D=A // 15025
@SP // 15026
AM=M+1 // 15027
A=A-1 // 15028
M=D // 15029
// call String.appendChar
@7 // 15030
D=A // 15031
@14 // 15032
M=D // 15033
@String.appendChar // 15034
D=A // 15035
@13 // 15036
M=D // 15037
@String.setInt.ret.4 // 15038
D=A // 15039
@CALL // 15040
0;JMP // 15041
(String.setInt.ret.4)
@SP // 15042
M=M-1 // 15043

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15044
D=M // 15045
@SP // 15046
AM=M+1 // 15047
A=A-1 // 15048
M=D // 15049
@54 // 15050
D=A // 15051
@SP // 15052
AM=M+1 // 15053
A=A-1 // 15054
M=D // 15055
// call String.appendChar
@7 // 15056
D=A // 15057
@14 // 15058
M=D // 15059
@String.appendChar // 15060
D=A // 15061
@13 // 15062
M=D // 15063
@String.setInt.ret.5 // 15064
D=A // 15065
@CALL // 15066
0;JMP // 15067
(String.setInt.ret.5)
@SP // 15068
M=M-1 // 15069

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15070
D=M // 15071
@SP // 15072
AM=M+1 // 15073
A=A-1 // 15074
M=D // 15075
@56 // 15076
D=A // 15077
@SP // 15078
AM=M+1 // 15079
A=A-1 // 15080
M=D // 15081
// call String.appendChar
@7 // 15082
D=A // 15083
@14 // 15084
M=D // 15085
@String.appendChar // 15086
D=A // 15087
@13 // 15088
M=D // 15089
@String.setInt.ret.6 // 15090
D=A // 15091
@CALL // 15092
0;JMP // 15093
(String.setInt.ret.6)
@SP // 15094
M=M-1 // 15095

////PushInstruction("constant 0")
@SP // 15096
AM=M+1 // 15097
A=A-1 // 15098
M=0 // 15099

////ReturnInstruction{}
@RETURN // 15100
0;JMP // 15101

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 15102
0;JMP // 15103

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

@ARG // 15104
A=M+1 // 15105
D=-M // 15106
@ARG // 15107
A=M+1 // 15108
M=D // 15109

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 15110
0;JMP // 15111

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15112
A=M+1 // 15113
D=M // 15114
@LCL // 15115
A=M+1 // 15116
A=A+1 // 15117
M=D // 15118

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15119
A=M+1 // 15120
A=A+1 // 15121
A=A+1 // 15122
M=0 // 15123

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
@String.setInt.GT.10 // 15124
D=A // 15125
@SP // 15126
AM=M+1 // 15127
A=A-1 // 15128
M=D // 15129
@LCL // 15130
A=M+1 // 15131
A=A+1 // 15132
D=M // 15133
@DO_GT // 15134
0;JMP // 15135
(String.setInt.GT.10)
D=!D // 15136
@WHILE_END_String.setInt1 // 15137
D;JNE // 15138

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15139
A=M+1 // 15140
A=A+1 // 15141
D=M // 15142
@SP // 15143
AM=M+1 // 15144
A=A-1 // 15145
M=D // 15146
@10 // 15147
D=A // 15148
@SP // 15149
AM=M+1 // 15150
A=A-1 // 15151
M=D // 15152
// call Math.divide
@7 // 15153
D=A // 15154
@14 // 15155
M=D // 15156
@Math.divide // 15157
D=A // 15158
@13 // 15159
M=D // 15160
@String.setInt.ret.7 // 15161
D=A // 15162
@CALL // 15163
0;JMP // 15164
(String.setInt.ret.7)
@SP // 15165
AM=M-1 // 15166
D=M // 15167
@LCL // 15168
A=M+1 // 15169
A=A+1 // 15170
M=D // 15171

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15172
A=M+1 // 15173
A=A+1 // 15174
A=A+1 // 15175
M=M+1 // 15176

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15177
0;JMP // 15178

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15179
A=M+1 // 15180
A=A+1 // 15181
A=A+1 // 15182
D=M // 15183
@SP // 15184
AM=M+1 // 15185
A=A-1 // 15186
M=D // 15187
// call Array.new
@6 // 15188
D=A // 15189
@14 // 15190
M=D // 15191
@Array.new // 15192
D=A // 15193
@13 // 15194
M=D // 15195
@String.setInt.ret.8 // 15196
D=A // 15197
@CALL // 15198
0;JMP // 15199
(String.setInt.ret.8)
@LCL // 15200
D=M // 15201
@5 // 15202
A=D+A // 15203
D=A // 15204
@R13 // 15205
M=D // 15206
@SP // 15207
AM=M-1 // 15208
D=M // 15209
@R13 // 15210
A=M // 15211
M=D // 15212

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15213
A=M+1 // 15214
M=0 // 15215

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
@String.setInt.GT.11 // 15216
D=A // 15217
@SP // 15218
AM=M+1 // 15219
A=A-1 // 15220
M=D // 15221
@ARG // 15222
A=M+1 // 15223
D=M // 15224
@DO_GT // 15225
0;JMP // 15226
(String.setInt.GT.11)
D=!D // 15227
@WHILE_END_String.setInt2 // 15228
D;JNE // 15229

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}, PushInstruction("constant 10")], call=CallInstruction{Math.multiply}},
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 15230
A=M+1 // 15231
D=M // 15232
@SP // 15233
AM=M+1 // 15234
A=A-1 // 15235
M=D // 15236
@ARG // 15237
A=M+1 // 15238
D=M // 15239
@SP // 15240
AM=M+1 // 15241
A=A-1 // 15242
M=D // 15243
@10 // 15244
D=A // 15245
@SP // 15246
AM=M+1 // 15247
A=A-1 // 15248
M=D // 15249
// call Math.divide
@7 // 15250
D=A // 15251
@14 // 15252
M=D // 15253
@Math.divide // 15254
D=A // 15255
@13 // 15256
M=D // 15257
@String.setInt.ret.9 // 15258
D=A // 15259
@CALL // 15260
0;JMP // 15261
(String.setInt.ret.9)
@10 // 15262
D=A // 15263
@SP // 15264
AM=M+1 // 15265
A=A-1 // 15266
M=D // 15267
// call Math.multiply
@7 // 15268
D=A // 15269
@14 // 15270
M=D // 15271
@Math.multiply // 15272
D=A // 15273
@13 // 15274
M=D // 15275
@String.setInt.ret.10 // 15276
D=A // 15277
@CALL // 15278
0;JMP // 15279
(String.setInt.ret.10)
@SP // 15280
AM=M-1 // 15281
D=M // 15282
@SP // 15283
AM=M-1 // 15284
D=M-D // 15285
@LCL // 15286
A=M // 15287
M=D // 15288

////PushWriter{source=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 48"),
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@LCL // 15289
D=M // 15290
@5 // 15291
A=D+A // 15292
D=M // 15293
@SP // 15294
AM=M+1 // 15295
A=A-1 // 15296
M=D // 15297
@LCL // 15298
A=M+1 // 15299
D=M // 15300
@SP // 15301
AM=M-1 // 15302
D=D+M // 15303
@SP // 15304
AM=M+1 // 15305
A=A-1 // 15306
M=D // 15307
@LCL // 15308
A=M // 15309
D=M // 15310
@48 // 15311
D=D+A // 15312
@SP // 15313
AM=M-1 // 15314
A=M // 15315
M=D // 15316

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15317
A=M+1 // 15318
D=M // 15319
@SP // 15320
AM=M+1 // 15321
A=A-1 // 15322
M=D // 15323
@10 // 15324
D=A // 15325
@SP // 15326
AM=M+1 // 15327
A=A-1 // 15328
M=D // 15329
// call Math.divide
@7 // 15330
D=A // 15331
@14 // 15332
M=D // 15333
@Math.divide // 15334
D=A // 15335
@13 // 15336
M=D // 15337
@String.setInt.ret.11 // 15338
D=A // 15339
@CALL // 15340
0;JMP // 15341
(String.setInt.ret.11)
@SP // 15342
AM=M-1 // 15343
D=M // 15344
@ARG // 15345
A=M+1 // 15346
M=D // 15347

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15348
A=M+1 // 15349
M=M+1 // 15350

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15351
0;JMP // 15352

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
@String.setInt.EQ.12 // 15353
D=A // 15354
@SP // 15355
AM=M+1 // 15356
A=A-1 // 15357
M=D // 15358
@LCL // 15359
D=M // 15360
@4 // 15361
A=D+A // 15362
D=M // 15363
D=D-1 // 15364
@DO_EQ // 15365
0;JMP // 15366
(String.setInt.EQ.12)
D=!D // 15367
@String.setInt.IfElse4 // 15368
D;JNE // 15369

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15370
D=M // 15371
@SP // 15372
AM=M+1 // 15373
A=A-1 // 15374
M=D // 15375
@45 // 15376
D=A // 15377
@SP // 15378
AM=M+1 // 15379
A=A-1 // 15380
M=D // 15381
// call String.appendChar
@7 // 15382
D=A // 15383
@14 // 15384
M=D // 15385
@String.appendChar // 15386
D=A // 15387
@13 // 15388
M=D // 15389
@String.setInt.ret.12 // 15390
D=A // 15391
@CALL // 15392
0;JMP // 15393
(String.setInt.ret.12)
@SP // 15394
M=M-1 // 15395

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 15396
0;JMP // 15397

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
@String.setInt.GT.13 // 15398
D=A // 15399
@SP // 15400
AM=M+1 // 15401
A=A-1 // 15402
M=D // 15403
@LCL // 15404
A=M+1 // 15405
D=M // 15406
@DO_GT // 15407
0;JMP // 15408
(String.setInt.GT.13)
D=!D // 15409
@WHILE_END_String.setInt3 // 15410
D;JNE // 15411

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

@LCL // 15412
A=M+1 // 15413
M=M-1 // 15414

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 5"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15415
D=M // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420
@LCL // 15421
D=M // 15422
@5 // 15423
A=D+A // 15424
D=M // 15425
@SP // 15426
AM=M+1 // 15427
A=A-1 // 15428
M=D // 15429
@LCL // 15430
A=M+1 // 15431
D=M // 15432
@SP // 15433
AM=M-1 // 15434
A=D+M // 15435
D=M // 15436
@SP // 15437
AM=M+1 // 15438
A=A-1 // 15439
M=D // 15440
// call String.appendChar
@7 // 15441
D=A // 15442
@14 // 15443
M=D // 15444
@String.appendChar // 15445
D=A // 15446
@13 // 15447
M=D // 15448
@String.setInt.ret.13 // 15449
D=A // 15450
@CALL // 15451
0;JMP // 15452
(String.setInt.ret.13)
@SP // 15453
M=M-1 // 15454

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 15455
0;JMP // 15456

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15457
D=M // 15458
@5 // 15459
A=D+A // 15460
D=M // 15461
@SP // 15462
AM=M+1 // 15463
A=A-1 // 15464
M=D // 15465
// call Array.dispose
@6 // 15466
D=A // 15467
@14 // 15468
M=D // 15469
@Array.dispose // 15470
D=A // 15471
@13 // 15472
M=D // 15473
@String.setInt.ret.14 // 15474
D=A // 15475
@CALL // 15476
0;JMP // 15477
(String.setInt.ret.14)
@SP // 15478
M=M-1 // 15479

////PushInstruction("constant 0")
@SP // 15480
AM=M+1 // 15481
A=A-1 // 15482
M=0 // 15483

////ReturnInstruction{}
@RETURN // 15484
0;JMP // 15485

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15486
D=A // 15487
@SP // 15488
AM=M+1 // 15489
A=A-1 // 15490
M=D // 15491

////ReturnInstruction{}
@RETURN // 15492
0;JMP // 15493

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15494
D=A // 15495
@SP // 15496
AM=M+1 // 15497
A=A-1 // 15498
M=D // 15499

////ReturnInstruction{}
@RETURN // 15500
0;JMP // 15501

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15502
D=A // 15503
@SP // 15504
AM=M+1 // 15505
A=A-1 // 15506
M=D // 15507

////ReturnInstruction{}
@RETURN // 15508
0;JMP // 15509

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15510
D=A // 15511
@14 // 15512
M=D // 15513
@Memory.init // 15514
D=A // 15515
@13 // 15516
M=D // 15517
@Sys.init.ret.0 // 15518
D=A // 15519
@CALL // 15520
0;JMP // 15521
(Sys.init.ret.0)
@SP // 15522
M=M-1 // 15523

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15524
D=A // 15525
@14 // 15526
M=D // 15527
@Math.init // 15528
D=A // 15529
@13 // 15530
M=D // 15531
@Sys.init.ret.1 // 15532
D=A // 15533
@CALL // 15534
0;JMP // 15535
(Sys.init.ret.1)
@SP // 15536
M=M-1 // 15537

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15538
D=A // 15539
@14 // 15540
M=D // 15541
@Screen.init // 15542
D=A // 15543
@13 // 15544
M=D // 15545
@Sys.init.ret.2 // 15546
D=A // 15547
@CALL // 15548
0;JMP // 15549
(Sys.init.ret.2)
@SP // 15550
M=M-1 // 15551

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15552
D=A // 15553
@14 // 15554
M=D // 15555
@Output.init // 15556
D=A // 15557
@13 // 15558
M=D // 15559
@Sys.init.ret.3 // 15560
D=A // 15561
@CALL // 15562
0;JMP // 15563
(Sys.init.ret.3)
@SP // 15564
M=M-1 // 15565

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15566
D=A // 15567
@14 // 15568
M=D // 15569
@Keyboard.init // 15570
D=A // 15571
@13 // 15572
M=D // 15573
@Sys.init.ret.4 // 15574
D=A // 15575
@CALL // 15576
0;JMP // 15577
(Sys.init.ret.4)
@SP // 15578
M=M-1 // 15579

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15580
D=A // 15581
@14 // 15582
M=D // 15583
@Main.main // 15584
D=A // 15585
@13 // 15586
M=D // 15587
@Sys.init.ret.5 // 15588
D=A // 15589
@CALL // 15590
0;JMP // 15591
(Sys.init.ret.5)
@SP // 15592
M=M-1 // 15593

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15594
D=A // 15595
@14 // 15596
M=D // 15597
@Sys.halt // 15598
D=A // 15599
@13 // 15600
M=D // 15601
@Sys.init.ret.6 // 15602
D=A // 15603
@CALL // 15604
0;JMP // 15605
(Sys.init.ret.6)
@SP // 15606
M=M-1 // 15607

////PushInstruction("constant 0")
@SP // 15608
AM=M+1 // 15609
A=A-1 // 15610
M=0 // 15611

////ReturnInstruction{}
@RETURN // 15612
0;JMP // 15613

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
D=0 // 15614
@WHILE_END_Sys.halt1 // 15615
D;JNE // 15616

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15617
0;JMP // 15618

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15619
AM=M+1 // 15620
A=A-1 // 15621
M=0 // 15622

////ReturnInstruction{}
@RETURN // 15623
0;JMP // 15624

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15625
AM=M+1 // 15626
A=A-1 // 15627
M=0 // 15628

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
@Sys.wait.GT.0 // 15629
D=A // 15630
@SP // 15631
AM=M+1 // 15632
A=A-1 // 15633
M=D // 15634
@ARG // 15635
A=M // 15636
D=M // 15637
@DO_GT // 15638
0;JMP // 15639
(Sys.wait.GT.0)
D=!D // 15640
@WHILE_END_Sys.wait1 // 15641
D;JNE // 15642

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

@ARG // 15643
A=M // 15644
M=M-1 // 15645

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15646
D=A // 15647
@LCL // 15648
A=M // 15649
M=D // 15650

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
@Sys.wait.GT.1 // 15651
D=A // 15652
@SP // 15653
AM=M+1 // 15654
A=A-1 // 15655
M=D // 15656
@LCL // 15657
A=M // 15658
D=M // 15659
@DO_GT // 15660
0;JMP // 15661
(Sys.wait.GT.1)
D=!D // 15662
@WHILE_END_Sys.wait2 // 15663
D;JNE // 15664

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

@LCL // 15665
A=M // 15666
M=M-1 // 15667

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15668
0;JMP // 15669

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15670
0;JMP // 15671

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15672
AM=M+1 // 15673
A=A-1 // 15674
M=0 // 15675

////ReturnInstruction{}
@RETURN // 15676
0;JMP // 15677

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15678
A=M // 15679
D=M // 15680
@SP // 15681
AM=M+1 // 15682
A=A-1 // 15683
M=D // 15684
// call Output.printInt
@6 // 15685
D=A // 15686
@14 // 15687
M=D // 15688
@Output.printInt // 15689
D=A // 15690
@13 // 15691
M=D // 15692
@Sys.error.ret.0 // 15693
D=A // 15694
@CALL // 15695
0;JMP // 15696
(Sys.error.ret.0)
@SP // 15697
M=M-1 // 15698

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15699
D=A // 15700
@14 // 15701
M=D // 15702
@Output.println // 15703
D=A // 15704
@13 // 15705
M=D // 15706
@Sys.error.ret.1 // 15707
D=A // 15708
@CALL // 15709
0;JMP // 15710
(Sys.error.ret.1)
@SP // 15711
M=M-1 // 15712

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15713
D=A // 15714
@14 // 15715
M=D // 15716
@Sys.halt // 15717
D=A // 15718
@13 // 15719
M=D // 15720
@Sys.error.ret.2 // 15721
D=A // 15722
@CALL // 15723
0;JMP // 15724
(Sys.error.ret.2)
@SP // 15725
M=M-1 // 15726

////PushInstruction("constant 0")
@SP // 15727
AM=M+1 // 15728
A=A-1 // 15729
M=0 // 15730

////ReturnInstruction{}
@RETURN // 15731
0;JMP // 15732

