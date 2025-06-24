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
D=!D // 211
@WHILE_END_Keyboard.readChar1 // 212
D;JNE // 213

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 214
0;JMP // 215

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

@24576 // 216
D=M // 217
@LCL // 218
A=M // 219
M=D // 220

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
@Keyboard.readChar.EQ.1 // 221
D=A // 222
@SP // 223
AM=M+1 // 224
A=A-1 // 225
M=D // 226
@Keyboard.readChar.EQ.2 // 227
D=A // 228
@SP // 229
AM=M+1 // 230
A=A-1 // 231
M=D // 232
@24576 // 233
D=M // 234
@DO_EQ // 235
0;JMP // 236
(Keyboard.readChar.EQ.2)
D=!D // 237
@DO_EQ // 238
0;JMP // 239
(Keyboard.readChar.EQ.1)
@WHILE_END_Keyboard.readChar2 // 240
D;JNE // 241

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 242
0;JMP // 243

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 244
A=M // 245
D=M // 246
@SP // 247
AM=M+1 // 248
A=A-1 // 249
M=D // 250
// call Output.printChar
@6 // 251
D=A // 252
@14 // 253
M=D // 254
@Output.printChar // 255
D=A // 256
@13 // 257
M=D // 258
@Keyboard.readChar.ret.0 // 259
D=A // 260
@CALL // 261
0;JMP // 262
(Keyboard.readChar.ret.0)
@SP // 263
M=M-1 // 264

////PushInstruction("local 0")
@LCL // 265
A=M // 266
D=M // 267
@SP // 268
AM=M+1 // 269
A=A-1 // 270
M=D // 271

////ReturnInstruction{}
@RETURN // 272
0;JMP // 273

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 274
AM=M+1 // 275
A=A-1 // 276
M=0 // 277
@SP // 278
AM=M+1 // 279
A=A-1 // 280
M=0 // 281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 282
A=M // 283
D=M // 284
@SP // 285
AM=M+1 // 286
A=A-1 // 287
M=D // 288
// call Output.printString
@6 // 289
D=A // 290
@14 // 291
M=D // 292
@Output.printString // 293
D=A // 294
@13 // 295
M=D // 296
@Keyboard.readLine.ret.0 // 297
D=A // 298
@CALL // 299
0;JMP // 300
(Keyboard.readLine.ret.0)
@SP // 301
M=M-1 // 302

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@50 // 303
D=A // 304
@SP // 305
AM=M+1 // 306
A=A-1 // 307
M=D // 308
// call String.new
@6 // 309
D=A // 310
@14 // 311
M=D // 312
@String.new // 313
D=A // 314
@13 // 315
M=D // 316
@Keyboard.readLine.ret.1 // 317
D=A // 318
@CALL // 319
0;JMP // 320
(Keyboard.readLine.ret.1)
@SP // 321
AM=M-1 // 322
D=M // 323
@LCL // 324
A=M // 325
M=D // 326

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 327
D=A // 328
@14 // 329
M=D // 330
@Keyboard.readChar // 331
D=A // 332
@13 // 333
M=D // 334
@Keyboard.readLine.ret.2 // 335
D=A // 336
@CALL // 337
0;JMP // 338
(Keyboard.readLine.ret.2)
@SP // 339
AM=M-1 // 340
D=M // 341
@LCL // 342
A=M+1 // 343
M=D // 344

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
@Keyboard.readLine.EQ.3 // 345
D=A // 346
@SP // 347
AM=M+1 // 348
A=A-1 // 349
M=D // 350
@Keyboard.readLine.EQ.4 // 351
D=A // 352
@SP // 353
AM=M+1 // 354
A=A-1 // 355
M=D // 356
@LCL // 357
A=M+1 // 358
D=M // 359
@SP // 360
AM=M+1 // 361
A=A-1 // 362
M=D // 363
// call String.newLine
@5 // 364
D=A // 365
@14 // 366
M=D // 367
@String.newLine // 368
D=A // 369
@13 // 370
M=D // 371
@Keyboard.readLine.ret.3 // 372
D=A // 373
@CALL // 374
0;JMP // 375
(Keyboard.readLine.ret.3)
@SP // 376
AM=M-1 // 377
D=M // 378
@SP // 379
AM=M-1 // 380
D=M-D // 381
@DO_EQ // 382
0;JMP // 383
(Keyboard.readLine.EQ.4)
D=!D // 384
@DO_EQ // 385
0;JMP // 386
(Keyboard.readLine.EQ.3)
@WHILE_END_Keyboard.readLine1 // 387
D;JNE // 388

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
@Keyboard.readLine.EQ.5 // 389
D=A // 390
@SP // 391
AM=M+1 // 392
A=A-1 // 393
M=D // 394
@LCL // 395
A=M+1 // 396
D=M // 397
@129 // 398
D=D-A // 399
@DO_EQ // 400
0;JMP // 401
(Keyboard.readLine.EQ.5)
D=!D // 402
@Keyboard.readLine.IfElse1 // 403
D;JNE // 404

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.eraseLastChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 405
A=M // 406
D=M // 407
@SP // 408
AM=M+1 // 409
A=A-1 // 410
M=D // 411
// call String.eraseLastChar
@6 // 412
D=A // 413
@14 // 414
M=D // 415
@String.eraseLastChar // 416
D=A // 417
@13 // 418
M=D // 419
@Keyboard.readLine.ret.4 // 420
D=A // 421
@CALL // 422
0;JMP // 423
(Keyboard.readLine.ret.4)
@SP // 424
M=M-1 // 425

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 426
0;JMP // 427

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 428
A=M // 429
D=M // 430
@SP // 431
AM=M+1 // 432
A=A-1 // 433
M=D // 434
@LCL // 435
A=M+1 // 436
D=M // 437
@SP // 438
AM=M+1 // 439
A=A-1 // 440
M=D // 441
// call String.appendChar
@7 // 442
D=A // 443
@14 // 444
M=D // 445
@String.appendChar // 446
D=A // 447
@13 // 448
M=D // 449
@Keyboard.readLine.ret.5 // 450
D=A // 451
@CALL // 452
0;JMP // 453
(Keyboard.readLine.ret.5)
@SP // 454
M=M-1 // 455

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 456
D=A // 457
@14 // 458
M=D // 459
@Keyboard.readChar // 460
D=A // 461
@13 // 462
M=D // 463
@Keyboard.readLine.ret.6 // 464
D=A // 465
@CALL // 466
0;JMP // 467
(Keyboard.readLine.ret.6)
@SP // 468
AM=M-1 // 469
D=M // 470
@LCL // 471
A=M+1 // 472
M=D // 473

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 474
0;JMP // 475

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 476
A=M // 477
D=M // 478
@SP // 479
AM=M+1 // 480
A=A-1 // 481
M=D // 482

////ReturnInstruction{}
@RETURN // 483
0;JMP // 484

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 485
AM=M+1 // 486
A=A-1 // 487
M=0 // 488

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Keyboard.readLine}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 489
A=M // 490
D=M // 491
@SP // 492
AM=M+1 // 493
A=A-1 // 494
M=D // 495
// call Keyboard.readLine
@6 // 496
D=A // 497
@14 // 498
M=D // 499
@Keyboard.readLine // 500
D=A // 501
@13 // 502
M=D // 503
@Keyboard.readInt.ret.0 // 504
D=A // 505
@CALL // 506
0;JMP // 507
(Keyboard.readInt.ret.0)
@SP // 508
AM=M-1 // 509
D=M // 510
@LCL // 511
A=M // 512
M=D // 513

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.intValue}}
@LCL // 514
A=M // 515
D=M // 516
@SP // 517
AM=M+1 // 518
A=A-1 // 519
M=D // 520
// call String.intValue
@6 // 521
D=A // 522
@14 // 523
M=D // 524
@String.intValue // 525
D=A // 526
@13 // 527
M=D // 528
@Keyboard.readInt.ret.1 // 529
D=A // 530
@CALL // 531
0;JMP // 532
(Keyboard.readInt.ret.1)

////ReturnInstruction{}
@RETURN // 533
0;JMP // 534

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 535
AM=M+1 // 536
A=A-1 // 537
M=0 // 538

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 7")], call=CallInstruction{String.new}}, PushInstruction("constant 49")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 52")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 53")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@7 // 539
D=A // 540
@SP // 541
AM=M+1 // 542
A=A-1 // 543
M=D // 544
// call String.new
@6 // 545
D=A // 546
@14 // 547
M=D // 548
@String.new // 549
D=A // 550
@13 // 551
M=D // 552
@Main.main.ret.0 // 553
D=A // 554
@CALL // 555
0;JMP // 556
(Main.main.ret.0)
@49 // 557
D=A // 558
@SP // 559
AM=M+1 // 560
A=A-1 // 561
M=D // 562
// call String.appendChar
@7 // 563
D=A // 564
@14 // 565
M=D // 566
@String.appendChar // 567
D=A // 568
@13 // 569
M=D // 570
@Main.main.ret.1 // 571
D=A // 572
@CALL // 573
0;JMP // 574
(Main.main.ret.1)
@50 // 575
D=A // 576
@SP // 577
AM=M+1 // 578
A=A-1 // 579
M=D // 580
// call String.appendChar
@7 // 581
D=A // 582
@14 // 583
M=D // 584
@String.appendChar // 585
D=A // 586
@13 // 587
M=D // 588
@Main.main.ret.2 // 589
D=A // 590
@CALL // 591
0;JMP // 592
(Main.main.ret.2)
@51 // 593
D=A // 594
@SP // 595
AM=M+1 // 596
A=A-1 // 597
M=D // 598
// call String.appendChar
@7 // 599
D=A // 600
@14 // 601
M=D // 602
@String.appendChar // 603
D=A // 604
@13 // 605
M=D // 606
@Main.main.ret.3 // 607
D=A // 608
@CALL // 609
0;JMP // 610
(Main.main.ret.3)
@52 // 611
D=A // 612
@SP // 613
AM=M+1 // 614
A=A-1 // 615
M=D // 616
// call String.appendChar
@7 // 617
D=A // 618
@14 // 619
M=D // 620
@String.appendChar // 621
D=A // 622
@13 // 623
M=D // 624
@Main.main.ret.4 // 625
D=A // 626
@CALL // 627
0;JMP // 628
(Main.main.ret.4)
@53 // 629
D=A // 630
@SP // 631
AM=M+1 // 632
A=A-1 // 633
M=D // 634
// call String.appendChar
@7 // 635
D=A // 636
@14 // 637
M=D // 638
@String.appendChar // 639
D=A // 640
@13 // 641
M=D // 642
@Main.main.ret.5 // 643
D=A // 644
@CALL // 645
0;JMP // 646
(Main.main.ret.5)
@54 // 647
D=A // 648
@SP // 649
AM=M+1 // 650
A=A-1 // 651
M=D // 652
// call String.appendChar
@7 // 653
D=A // 654
@14 // 655
M=D // 656
@String.appendChar // 657
D=A // 658
@13 // 659
M=D // 660
@Main.main.ret.6 // 661
D=A // 662
@CALL // 663
0;JMP // 664
(Main.main.ret.6)
@55 // 665
D=A // 666
@SP // 667
AM=M+1 // 668
A=A-1 // 669
M=D // 670
// call String.appendChar
@7 // 671
D=A // 672
@14 // 673
M=D // 674
@String.appendChar // 675
D=A // 676
@13 // 677
M=D // 678
@Main.main.ret.7 // 679
D=A // 680
@CALL // 681
0;JMP // 682
(Main.main.ret.7)
@SP // 683
AM=M-1 // 684
D=M // 685
@LCL // 686
A=M // 687
M=D // 688

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 689
A=M // 690
D=M // 691
@SP // 692
AM=M+1 // 693
A=A-1 // 694
M=D // 695
// call Output.printString
@6 // 696
D=A // 697
@14 // 698
M=D // 699
@Output.printString // 700
D=A // 701
@13 // 702
M=D // 703
@Main.main.ret.8 // 704
D=A // 705
@CALL // 706
0;JMP // 707
(Main.main.ret.8)
@SP // 708
M=M-1 // 709

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 710
D=A // 711
@14 // 712
M=D // 713
@Output.println // 714
D=A // 715
@13 // 716
M=D // 717
@Main.main.ret.9 // 718
D=A // 719
@CALL // 720
0;JMP // 721
(Main.main.ret.9)
@SP // 722
M=M-1 // 723

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 724
A=M // 725
D=M // 726
@SP // 727
AM=M+1 // 728
A=A-1 // 729
M=D // 730
// call String.dispose
@6 // 731
D=A // 732
@14 // 733
M=D // 734
@String.dispose // 735
D=A // 736
@13 // 737
M=D // 738
@Main.main.ret.10 // 739
D=A // 740
@CALL // 741
0;JMP // 742
(Main.main.ret.10)
@SP // 743
M=M-1 // 744

////PushInstruction("constant 0")
@SP // 745
AM=M+1 // 746
A=A-1 // 747
M=0 // 748

////ReturnInstruction{}
@RETURN // 749
0;JMP // 750

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 751
AM=M+1 // 752
A=A-1 // 753
M=0 // 754
@SP // 755
AM=M+1 // 756
A=A-1 // 757
M=0 // 758

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 759
A=M // 760
M=1 // 761

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 762
A=M+1 // 763
M=0 // 764

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 765
D=A // 766
@SP // 767
AM=M+1 // 768
A=A-1 // 769
M=D // 770
// call Array.new
@6 // 771
D=A // 772
@14 // 773
M=D // 774
@Array.new // 775
D=A // 776
@13 // 777
M=D // 778
@Math.init.ret.0 // 779
D=A // 780
@CALL // 781
0;JMP // 782
(Math.init.ret.0)
@SP // 783
AM=M-1 // 784
D=M // 785
@Math.0 // 786
M=D // 787

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
@Math.init.LT.0 // 788
D=A // 789
@SP // 790
AM=M+1 // 791
A=A-1 // 792
M=D // 793
@LCL // 794
A=M+1 // 795
D=M // 796
@16 // 797
D=D-A // 798
@DO_LT // 799
0;JMP // 800
(Math.init.LT.0)
D=!D // 801
@WHILE_END_Math.init1 // 802
D;JNE // 803

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 804
D=M // 805
@SP // 806
AM=M+1 // 807
A=A-1 // 808
M=D // 809
@LCL // 810
A=M+1 // 811
D=M // 812
@SP // 813
AM=M-1 // 814
D=D+M // 815
@SP // 816
AM=M+1 // 817
A=A-1 // 818
M=D // 819
@LCL // 820
A=M // 821
D=M // 822
@SP // 823
AM=M-1 // 824
A=M // 825
M=D // 826

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

@LCL // 827
A=M // 828
D=M // 829
D=D+M // 830
@LCL // 831
A=M // 832
M=D // 833

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

@LCL // 834
A=M+1 // 835
D=M // 836
D=D+1 // 837
@LCL // 838
A=M+1 // 839
M=D // 840

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 841
0;JMP // 842

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 843
AM=M+1 // 844
A=A-1 // 845
M=0 // 846

////ReturnInstruction{}
@RETURN // 847
0;JMP // 848

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
@ARG // 849
A=M // 850
D=M // 851
@SP // 852
AM=M+1 // 853
A=A-1 // 854
M=D // 855
@Math.0 // 856
D=M // 857
@SP // 858
AM=M+1 // 859
A=A-1 // 860
M=D // 861
@ARG // 862
A=M+1 // 863
D=M // 864
@SP // 865
AM=M-1 // 866
A=D+M // 867
D=M // 868
@SP // 869
AM=M-1 // 870
D=D&M // 871
@SP // 872
AM=M+1 // 873
A=A-1 // 874
M=D // 875

////ReturnInstruction{}
@RETURN // 876
0;JMP // 877

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 878
AM=M+1 // 879
A=A-1 // 880
M=0 // 881
@SP // 882
AM=M+1 // 883
A=A-1 // 884
M=0 // 885
@SP // 886
AM=M+1 // 887
A=A-1 // 888
M=0 // 889

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
@Math.multiply.EQ.1 // 890
D=A // 891
@SP // 892
AM=M+1 // 893
A=A-1 // 894
M=D // 895
@Math.multiply.EQ.2 // 896
D=A // 897
@SP // 898
AM=M+1 // 899
A=A-1 // 900
M=D // 901
@ARG // 902
A=M // 903
D=M // 904
@DO_EQ // 905
0;JMP // 906
(Math.multiply.EQ.2)
@SP // 907
AM=M+1 // 908
A=A-1 // 909
M=D // 910
@Math.multiply.EQ.3 // 911
D=A // 912
@SP // 913
AM=M+1 // 914
A=A-1 // 915
M=D // 916
@ARG // 917
A=M+1 // 918
D=M // 919
@DO_EQ // 920
0;JMP // 921
(Math.multiply.EQ.3)
@SP // 922
AM=M-1 // 923
D=D|M // 924
@DO_EQ // 925
0;JMP // 926
(Math.multiply.EQ.1)
@Math.multiply.IfElse1 // 927
D;JNE // 928

////PushInstruction("constant 0")
@SP // 929
AM=M+1 // 930
A=A-1 // 931
M=0 // 932

////ReturnInstruction{}
@RETURN // 933
0;JMP // 934

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 935
0;JMP // 936

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
@Math.multiply.EQ.4 // 937
D=A // 938
@SP // 939
AM=M+1 // 940
A=A-1 // 941
M=D // 942
@ARG // 943
A=M // 944
D=M // 945
D=D-1 // 946
@DO_EQ // 947
0;JMP // 948
(Math.multiply.EQ.4)
D=!D // 949
@Math.multiply.IfElse2 // 950
D;JNE // 951

////PushInstruction("argument 1")
@ARG // 952
A=M+1 // 953
D=M // 954
@SP // 955
AM=M+1 // 956
A=A-1 // 957
M=D // 958

////ReturnInstruction{}
@RETURN // 959
0;JMP // 960

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 961
0;JMP // 962

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
@Math.multiply.EQ.5 // 963
D=A // 964
@SP // 965
AM=M+1 // 966
A=A-1 // 967
M=D // 968
@ARG // 969
A=M+1 // 970
D=M // 971
D=D-1 // 972
@DO_EQ // 973
0;JMP // 974
(Math.multiply.EQ.5)
D=!D // 975
@Math.multiply.IfElse3 // 976
D;JNE // 977

////PushInstruction("argument 0")
@ARG // 978
A=M // 979
D=M // 980
@SP // 981
AM=M+1 // 982
A=A-1 // 983
M=D // 984

////ReturnInstruction{}
@RETURN // 985
0;JMP // 986

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 987
0;JMP // 988

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
@Math.multiply.EQ.6 // 989
D=A // 990
@SP // 991
AM=M+1 // 992
A=A-1 // 993
M=D // 994
@ARG // 995
A=M // 996
D=M // 997
@2 // 998
D=D-A // 999
@DO_EQ // 1000
0;JMP // 1001
(Math.multiply.EQ.6)
D=!D // 1002
@Math.multiply.IfElse4 // 1003
D;JNE // 1004

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1005
A=M+1 // 1006
D=M // 1007
D=D+M // 1008
@SP // 1009
AM=M+1 // 1010
A=A-1 // 1011
M=D // 1012

////ReturnInstruction{}
@RETURN // 1013
0;JMP // 1014

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 1015
0;JMP // 1016

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
@Math.multiply.EQ.7 // 1017
D=A // 1018
@SP // 1019
AM=M+1 // 1020
A=A-1 // 1021
M=D // 1022
@ARG // 1023
A=M+1 // 1024
D=M // 1025
@2 // 1026
D=D-A // 1027
@DO_EQ // 1028
0;JMP // 1029
(Math.multiply.EQ.7)
D=!D // 1030
@Math.multiply.IfElse5 // 1031
D;JNE // 1032

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1033
A=M // 1034
D=M // 1035
D=D+M // 1036
@SP // 1037
AM=M+1 // 1038
A=A-1 // 1039
M=D // 1040

////ReturnInstruction{}
@RETURN // 1041
0;JMP // 1042

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 1043
0;JMP // 1044

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

@LCL // 1045
A=M+1 // 1046
A=A+1 // 1047
M=1 // 1048

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
@Math.multiply.LT.8 // 1049
D=A // 1050
@SP // 1051
AM=M+1 // 1052
A=A-1 // 1053
M=D // 1054
@LCL // 1055
A=M+1 // 1056
D=M // 1057
@16 // 1058
D=D-A // 1059
@DO_LT // 1060
0;JMP // 1061
(Math.multiply.LT.8)
D=!D // 1062
@WHILE_END_Math.multiply1 // 1063
D;JNE // 1064

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
@Math.multiply.EQ.9 // 1065
D=A // 1066
@SP // 1067
AM=M+1 // 1068
A=A-1 // 1069
M=D // 1070
@ARG // 1071
A=M+1 // 1072
D=M // 1073
@SP // 1074
AM=M+1 // 1075
A=A-1 // 1076
M=D // 1077
@LCL // 1078
A=M+1 // 1079
A=A+1 // 1080
D=M // 1081
@SP // 1082
AM=M-1 // 1083
D=D&M // 1084
@DO_EQ // 1085
0;JMP // 1086
(Math.multiply.EQ.9)
@Math.multiply.IfElse6 // 1087
D;JNE // 1088

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

@LCL // 1089
A=M // 1090
D=M // 1091
@SP // 1092
AM=M+1 // 1093
A=A-1 // 1094
M=D // 1095
@ARG // 1096
A=M // 1097
D=M // 1098
@SP // 1099
AM=M-1 // 1100
D=D+M // 1101
@LCL // 1102
A=M // 1103
M=D // 1104

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 1105
0;JMP // 1106

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

@ARG // 1107
A=M // 1108
D=M // 1109
D=D+M // 1110
@ARG // 1111
A=M // 1112
M=D // 1113

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

@LCL // 1114
A=M+1 // 1115
D=M // 1116
D=D+1 // 1117
@LCL // 1118
A=M+1 // 1119
M=D // 1120

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

@LCL // 1121
A=M+1 // 1122
A=A+1 // 1123
D=M // 1124
D=D+M // 1125
@LCL // 1126
A=M+1 // 1127
A=A+1 // 1128
M=D // 1129

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1130
0;JMP // 1131

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1132
A=M // 1133
D=M // 1134
@SP // 1135
AM=M+1 // 1136
A=A-1 // 1137
M=D // 1138

////ReturnInstruction{}
@RETURN // 1139
0;JMP // 1140

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 1141
AM=M+1 // 1142
A=A-1 // 1143
M=0 // 1144
@SP // 1145
AM=M+1 // 1146
A=A-1 // 1147
M=0 // 1148
@SP // 1149
AM=M+1 // 1150
A=A-1 // 1151
M=0 // 1152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1153
A=M // 1154
D=M // 1155
@SP // 1156
AM=M+1 // 1157
A=A-1 // 1158
M=D // 1159
// call Math.abs
@6 // 1160
D=A // 1161
@14 // 1162
M=D // 1163
@Math.abs // 1164
D=A // 1165
@13 // 1166
M=D // 1167
@Math.divide.ret.0 // 1168
D=A // 1169
@CALL // 1170
0;JMP // 1171
(Math.divide.ret.0)
@SP // 1172
AM=M-1 // 1173
D=M // 1174
@LCL // 1175
A=M+1 // 1176
M=D // 1177

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1178
A=M+1 // 1179
D=M // 1180
@SP // 1181
AM=M+1 // 1182
A=A-1 // 1183
M=D // 1184
// call Math.abs
@6 // 1185
D=A // 1186
@14 // 1187
M=D // 1188
@Math.abs // 1189
D=A // 1190
@13 // 1191
M=D // 1192
@Math.divide.ret.1 // 1193
D=A // 1194
@CALL // 1195
0;JMP // 1196
(Math.divide.ret.1)
@SP // 1197
AM=M-1 // 1198
D=M // 1199
@LCL // 1200
A=M+1 // 1201
A=A+1 // 1202
M=D // 1203

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
@Math.divide.GT.10 // 1204
D=A // 1205
@SP // 1206
AM=M+1 // 1207
A=A-1 // 1208
M=D // 1209
@LCL // 1210
A=M+1 // 1211
A=A+1 // 1212
D=M // 1213
A=A-1 // 1214
D=D-M // 1215
@DO_GT // 1216
0;JMP // 1217
(Math.divide.GT.10)
D=!D // 1218
@Math.divide.IfElse1 // 1219
D;JNE // 1220

////PushInstruction("constant 0")
@SP // 1221
AM=M+1 // 1222
A=A-1 // 1223
M=0 // 1224

////ReturnInstruction{}
@RETURN // 1225
0;JMP // 1226

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 1227
0;JMP // 1228

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1229
A=M+1 // 1230
D=M // 1231
@SP // 1232
AM=M+1 // 1233
A=A-1 // 1234
M=D // 1235
@2 // 1236
D=A // 1237
@SP // 1238
AM=M+1 // 1239
A=A-1 // 1240
M=D // 1241
@LCL // 1242
A=M+1 // 1243
A=A+1 // 1244
D=M // 1245
@SP // 1246
AM=M+1 // 1247
A=A-1 // 1248
M=D // 1249
// call Math.multiply
@7 // 1250
D=A // 1251
@14 // 1252
M=D // 1253
@Math.multiply // 1254
D=A // 1255
@13 // 1256
M=D // 1257
@Math.divide.ret.2 // 1258
D=A // 1259
@CALL // 1260
0;JMP // 1261
(Math.divide.ret.2)
// call Math.divide
@7 // 1262
D=A // 1263
@14 // 1264
M=D // 1265
@Math.divide // 1266
D=A // 1267
@13 // 1268
M=D // 1269
@Math.divide.ret.3 // 1270
D=A // 1271
@CALL // 1272
0;JMP // 1273
(Math.divide.ret.3)
@SP // 1274
AM=M-1 // 1275
D=M // 1276
@LCL // 1277
A=M // 1278
M=D // 1279

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("local 0")], call=CallInstruction{Math.multiply}}, PushInstruction("local 2")], call=CallInstruction{Math.multiply}},
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
@Math.divide.LT.11 // 1280
D=A // 1281
@SP // 1282
AM=M+1 // 1283
A=A-1 // 1284
M=D // 1285
@LCL // 1286
A=M+1 // 1287
D=M // 1288
@SP // 1289
AM=M+1 // 1290
A=A-1 // 1291
M=D // 1292
@2 // 1293
D=A // 1294
@SP // 1295
AM=M+1 // 1296
A=A-1 // 1297
M=D // 1298
@LCL // 1299
A=M // 1300
D=M // 1301
@SP // 1302
AM=M+1 // 1303
A=A-1 // 1304
M=D // 1305
// call Math.multiply
@7 // 1306
D=A // 1307
@14 // 1308
M=D // 1309
@Math.multiply // 1310
D=A // 1311
@13 // 1312
M=D // 1313
@Math.divide.ret.4 // 1314
D=A // 1315
@CALL // 1316
0;JMP // 1317
(Math.divide.ret.4)
@LCL // 1318
A=M+1 // 1319
A=A+1 // 1320
D=M // 1321
@SP // 1322
AM=M+1 // 1323
A=A-1 // 1324
M=D // 1325
// call Math.multiply
@7 // 1326
D=A // 1327
@14 // 1328
M=D // 1329
@Math.multiply // 1330
D=A // 1331
@13 // 1332
M=D // 1333
@Math.divide.ret.5 // 1334
D=A // 1335
@CALL // 1336
0;JMP // 1337
(Math.divide.ret.5)
@SP // 1338
AM=M-1 // 1339
D=M // 1340
@SP // 1341
AM=M-1 // 1342
D=M-D // 1343
@SP // 1344
AM=M+1 // 1345
A=A-1 // 1346
M=D // 1347
@LCL // 1348
A=M+1 // 1349
A=A+1 // 1350
D=M // 1351
@SP // 1352
AM=M-1 // 1353
D=M-D // 1354
@DO_LT // 1355
0;JMP // 1356
(Math.divide.LT.11)
D=!D // 1357
@Math.divide.IfElse2 // 1358
D;JNE // 1359

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
@Math.divide.EQ.12 // 1360
D=A // 1361
@SP // 1362
AM=M+1 // 1363
A=A-1 // 1364
M=D // 1365
@Math.divide.GT.13 // 1366
D=A // 1367
@SP // 1368
AM=M+1 // 1369
A=A-1 // 1370
M=D // 1371
@Math.divide.LT.14 // 1372
D=A // 1373
@SP // 1374
AM=M+1 // 1375
A=A-1 // 1376
M=D // 1377
@ARG // 1378
A=M // 1379
D=M // 1380
@DO_LT // 1381
0;JMP // 1382
(Math.divide.LT.14)
@SP // 1383
AM=M+1 // 1384
A=A-1 // 1385
M=D // 1386
@ARG // 1387
A=M+1 // 1388
D=M // 1389
@SP // 1390
AM=M-1 // 1391
D=D&M // 1392
@DO_GT // 1393
0;JMP // 1394
(Math.divide.GT.13)
@SP // 1395
AM=M+1 // 1396
A=A-1 // 1397
M=D // 1398
@Math.divide.LT.15 // 1399
D=A // 1400
@SP // 1401
AM=M+1 // 1402
A=A-1 // 1403
M=D // 1404
@Math.divide.GT.16 // 1405
D=A // 1406
@SP // 1407
AM=M+1 // 1408
A=A-1 // 1409
M=D // 1410
@ARG // 1411
A=M // 1412
D=M // 1413
@DO_GT // 1414
0;JMP // 1415
(Math.divide.GT.16)
@SP // 1416
AM=M+1 // 1417
A=A-1 // 1418
M=D // 1419
@ARG // 1420
A=M+1 // 1421
D=M // 1422
@SP // 1423
AM=M-1 // 1424
D=D&M // 1425
@DO_LT // 1426
0;JMP // 1427
(Math.divide.LT.15)
@SP // 1428
AM=M-1 // 1429
D=D|M // 1430
@DO_EQ // 1431
0;JMP // 1432
(Math.divide.EQ.12)
@Math.divide.IfElse3 // 1433
D;JNE // 1434

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1435
A=M // 1436
D=-M // 1437
@LCL // 1438
A=M // 1439
M=D // 1440

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 1441
0;JMP // 1442

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("local 0")], call=CallInstruction{Math.multiply}}
@2 // 1443
D=A // 1444
@SP // 1445
AM=M+1 // 1446
A=A-1 // 1447
M=D // 1448
@LCL // 1449
A=M // 1450
D=M // 1451
@SP // 1452
AM=M+1 // 1453
A=A-1 // 1454
M=D // 1455
// call Math.multiply
@7 // 1456
D=A // 1457
@14 // 1458
M=D // 1459
@Math.multiply // 1460
D=A // 1461
@13 // 1462
M=D // 1463
@Math.divide.ret.6 // 1464
D=A // 1465
@CALL // 1466
0;JMP // 1467
(Math.divide.ret.6)

////ReturnInstruction{}
@RETURN // 1468
0;JMP // 1469

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1470
0;JMP // 1471

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
@Math.divide.EQ.17 // 1472
D=A // 1473
@SP // 1474
AM=M+1 // 1475
A=A-1 // 1476
M=D // 1477
@Math.divide.GT.18 // 1478
D=A // 1479
@SP // 1480
AM=M+1 // 1481
A=A-1 // 1482
M=D // 1483
@Math.divide.LT.19 // 1484
D=A // 1485
@SP // 1486
AM=M+1 // 1487
A=A-1 // 1488
M=D // 1489
@ARG // 1490
A=M // 1491
D=M // 1492
@DO_LT // 1493
0;JMP // 1494
(Math.divide.LT.19)
@SP // 1495
AM=M+1 // 1496
A=A-1 // 1497
M=D // 1498
@ARG // 1499
A=M+1 // 1500
D=M // 1501
@SP // 1502
AM=M-1 // 1503
D=D&M // 1504
@DO_GT // 1505
0;JMP // 1506
(Math.divide.GT.18)
@SP // 1507
AM=M+1 // 1508
A=A-1 // 1509
M=D // 1510
@Math.divide.LT.20 // 1511
D=A // 1512
@SP // 1513
AM=M+1 // 1514
A=A-1 // 1515
M=D // 1516
@Math.divide.GT.21 // 1517
D=A // 1518
@SP // 1519
AM=M+1 // 1520
A=A-1 // 1521
M=D // 1522
@ARG // 1523
A=M // 1524
D=M // 1525
@DO_GT // 1526
0;JMP // 1527
(Math.divide.GT.21)
@SP // 1528
AM=M+1 // 1529
A=A-1 // 1530
M=D // 1531
@ARG // 1532
A=M+1 // 1533
D=M // 1534
@SP // 1535
AM=M-1 // 1536
D=D&M // 1537
@DO_LT // 1538
0;JMP // 1539
(Math.divide.LT.20)
@SP // 1540
AM=M-1 // 1541
D=D|M // 1542
@DO_EQ // 1543
0;JMP // 1544
(Math.divide.EQ.17)
@Math.divide.IfElse4 // 1545
D;JNE // 1546

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1547
A=M // 1548
D=-M // 1549
@LCL // 1550
A=M // 1551
M=D // 1552

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 1553
0;JMP // 1554

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("local 0")], call=CallInstruction{Math.multiply}},
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
@2 // 1555
D=A // 1556
@SP // 1557
AM=M+1 // 1558
A=A-1 // 1559
M=D // 1560
@LCL // 1561
A=M // 1562
D=M // 1563
@SP // 1564
AM=M+1 // 1565
A=A-1 // 1566
M=D // 1567
// call Math.multiply
@7 // 1568
D=A // 1569
@14 // 1570
M=D // 1571
@Math.multiply // 1572
D=A // 1573
@13 // 1574
M=D // 1575
@Math.divide.ret.7 // 1576
D=A // 1577
@CALL // 1578
0;JMP // 1579
(Math.divide.ret.7)
@SP // 1580
AM=M-1 // 1581
D=M // 1582
D=D+1 // 1583
@SP // 1584
AM=M+1 // 1585
A=A-1 // 1586
M=D // 1587

////ReturnInstruction{}
@RETURN // 1588
0;JMP // 1589

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=8, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Math.divide}}, PushInstruction("argument 1")], call=CallInstruction{Math.multiply}},
//    binaryOp: "SUB"
//)
@ARG // 1590
A=M // 1591
D=M // 1592
@SP // 1593
AM=M+1 // 1594
A=A-1 // 1595
M=D // 1596
@ARG // 1597
A=M // 1598
D=M // 1599
@SP // 1600
AM=M+1 // 1601
A=A-1 // 1602
M=D // 1603
@ARG // 1604
A=M+1 // 1605
D=M // 1606
@SP // 1607
AM=M+1 // 1608
A=A-1 // 1609
M=D // 1610
// call Math.divide
@7 // 1611
D=A // 1612
@14 // 1613
M=D // 1614
@Math.divide // 1615
D=A // 1616
@13 // 1617
M=D // 1618
@Math.mod.ret.0 // 1619
D=A // 1620
@CALL // 1621
0;JMP // 1622
(Math.mod.ret.0)
@ARG // 1623
A=M+1 // 1624
D=M // 1625
@SP // 1626
AM=M+1 // 1627
A=A-1 // 1628
M=D // 1629
// call Math.multiply
@7 // 1630
D=A // 1631
@14 // 1632
M=D // 1633
@Math.multiply // 1634
D=A // 1635
@13 // 1636
M=D // 1637
@Math.mod.ret.1 // 1638
D=A // 1639
@CALL // 1640
0;JMP // 1641
(Math.mod.ret.1)
@SP // 1642
AM=M-1 // 1643
D=M // 1644
@SP // 1645
AM=M-1 // 1646
D=M-D // 1647
@SP // 1648
AM=M+1 // 1649
A=A-1 // 1650
M=D // 1651

////ReturnInstruction{}
@RETURN // 1652
0;JMP // 1653

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=8, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.0 // 1654
D=M // 1655
@SP // 1656
AM=M+1 // 1657
A=A-1 // 1658
M=D // 1659
@ARG // 1660
A=M // 1661
D=M // 1662
@SP // 1663
AM=M-1 // 1664
A=D+M // 1665
D=M // 1666
@SP // 1667
AM=M+1 // 1668
A=A-1 // 1669
M=D // 1670

////ReturnInstruction{}
@RETURN // 1671
0;JMP // 1672

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=8, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 1673
AM=M+1 // 1674
A=A-1 // 1675
M=0 // 1676
@SP // 1677
AM=M+1 // 1678
A=A-1 // 1679
M=0 // 1680
@SP // 1681
AM=M+1 // 1682
A=A-1 // 1683
M=0 // 1684
@SP // 1685
AM=M+1 // 1686
A=A-1 // 1687
M=0 // 1688

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1689
A=M // 1690
M=0 // 1691

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1692
D=A // 1693
@LCL // 1694
A=M+1 // 1695
M=D // 1696

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
@Math.sqrt.EQ.22 // 1697
D=A // 1698
@SP // 1699
AM=M+1 // 1700
A=A-1 // 1701
M=D // 1702
@Math.sqrt.LT.23 // 1703
D=A // 1704
@SP // 1705
AM=M+1 // 1706
A=A-1 // 1707
M=D // 1708
@LCL // 1709
A=M+1 // 1710
D=M // 1711
@DO_LT // 1712
0;JMP // 1713
(Math.sqrt.LT.23)
D=!D // 1714
@DO_EQ // 1715
0;JMP // 1716
(Math.sqrt.EQ.22)
@WHILE_END_Math.sqrt1 // 1717
D;JNE // 1718

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

@LCL // 1719
A=M // 1720
D=M // 1721
@SP // 1722
AM=M+1 // 1723
A=A-1 // 1724
M=D // 1725
@Math.0 // 1726
D=M // 1727
@SP // 1728
AM=M+1 // 1729
A=A-1 // 1730
M=D // 1731
@LCL // 1732
A=M+1 // 1733
D=M // 1734
@SP // 1735
AM=M-1 // 1736
A=D+M // 1737
D=M // 1738
@SP // 1739
AM=M-1 // 1740
D=D+M // 1741
@LCL // 1742
A=M+1 // 1743
A=A+1 // 1744
M=D // 1745

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 1746
A=M+1 // 1747
A=A+1 // 1748
D=M // 1749
@SP // 1750
AM=M+1 // 1751
A=A-1 // 1752
M=D // 1753
@LCL // 1754
A=M+1 // 1755
A=A+1 // 1756
D=M // 1757
@SP // 1758
AM=M+1 // 1759
A=A-1 // 1760
M=D // 1761
// call Math.multiply
@7 // 1762
D=A // 1763
@14 // 1764
M=D // 1765
@Math.multiply // 1766
D=A // 1767
@13 // 1768
M=D // 1769
@Math.sqrt.ret.0 // 1770
D=A // 1771
@CALL // 1772
0;JMP // 1773
(Math.sqrt.ret.0)
@SP // 1774
AM=M-1 // 1775
D=M // 1776
@LCL // 1777
A=M+1 // 1778
A=A+1 // 1779
A=A+1 // 1780
M=D // 1781

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
@Math.sqrt.EQ.24 // 1782
D=A // 1783
@SP // 1784
AM=M+1 // 1785
A=A-1 // 1786
M=D // 1787
@Math.sqrt.GT.25 // 1788
D=A // 1789
@SP // 1790
AM=M+1 // 1791
A=A-1 // 1792
M=D // 1793
@LCL // 1794
A=M+1 // 1795
A=A+1 // 1796
A=A+1 // 1797
D=M // 1798
@SP // 1799
AM=M+1 // 1800
A=A-1 // 1801
M=D // 1802
@ARG // 1803
A=M // 1804
D=M // 1805
@SP // 1806
AM=M-1 // 1807
D=M-D // 1808
@DO_GT // 1809
0;JMP // 1810
(Math.sqrt.GT.25)
@SP // 1811
AM=M+1 // 1812
A=A-1 // 1813
M=D // 1814
@SP // 1815
A=M-1 // 1816
M=!D // 1817
@Math.sqrt.GT.26 // 1818
D=A // 1819
@SP // 1820
AM=M+1 // 1821
A=A-1 // 1822
M=D // 1823
@LCL // 1824
A=M+1 // 1825
A=A+1 // 1826
A=A+1 // 1827
D=M // 1828
@DO_GT // 1829
0;JMP // 1830
(Math.sqrt.GT.26)
@SP // 1831
AM=M-1 // 1832
D=D&M // 1833
@DO_EQ // 1834
0;JMP // 1835
(Math.sqrt.EQ.24)
@Math.sqrt.IfElse1 // 1836
D;JNE // 1837

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1838
A=M+1 // 1839
A=A+1 // 1840
D=M // 1841
@LCL // 1842
A=M // 1843
M=D // 1844

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 1845
0;JMP // 1846

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

@LCL // 1847
A=M+1 // 1848
D=M // 1849
D=D-1 // 1850
@LCL // 1851
A=M+1 // 1852
M=D // 1853

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1854
0;JMP // 1855

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1856
A=M // 1857
D=M // 1858
@SP // 1859
AM=M+1 // 1860
A=A-1 // 1861
M=D // 1862

////ReturnInstruction{}
@RETURN // 1863
0;JMP // 1864

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=8, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.max.GT.27 // 1865
D=A // 1866
@SP // 1867
AM=M+1 // 1868
A=A-1 // 1869
M=D // 1870
@ARG // 1871
A=M+1 // 1872
D=M // 1873
A=A-1 // 1874
D=M-D // 1875
@DO_GT // 1876
0;JMP // 1877
(Math.max.GT.27)
D=!D // 1878
@Math.max.IfElse1 // 1879
D;JNE // 1880

////PushInstruction("argument 0")
@ARG // 1881
A=M // 1882
D=M // 1883
@SP // 1884
AM=M+1 // 1885
A=A-1 // 1886
M=D // 1887

////ReturnInstruction{}
@RETURN // 1888
0;JMP // 1889

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 1890
0;JMP // 1891

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1892
A=M+1 // 1893
D=M // 1894
@SP // 1895
AM=M+1 // 1896
A=A-1 // 1897
M=D // 1898

////ReturnInstruction{}
@RETURN // 1899
0;JMP // 1900

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=8, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.min.LT.28 // 1901
D=A // 1902
@SP // 1903
AM=M+1 // 1904
A=A-1 // 1905
M=D // 1906
@ARG // 1907
A=M+1 // 1908
D=M // 1909
A=A-1 // 1910
D=M-D // 1911
@DO_LT // 1912
0;JMP // 1913
(Math.min.LT.28)
D=!D // 1914
@Math.min.IfElse1 // 1915
D;JNE // 1916

////PushInstruction("argument 0")
@ARG // 1917
A=M // 1918
D=M // 1919
@SP // 1920
AM=M+1 // 1921
A=A-1 // 1922
M=D // 1923

////ReturnInstruction{}
@RETURN // 1924
0;JMP // 1925

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 1926
0;JMP // 1927

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1928
A=M+1 // 1929
D=M // 1930
@SP // 1931
AM=M+1 // 1932
A=A-1 // 1933
M=D // 1934

////ReturnInstruction{}
@RETURN // 1935
0;JMP // 1936

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=8, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1937
A=M // 1938
D=M // 1939
@SP // 1940
AM=M+1 // 1941
A=A-1 // 1942
M=D // 1943
@ARG // 1944
A=M // 1945
D=M // 1946
@SP // 1947
AM=M+1 // 1948
A=A-1 // 1949
M=D // 1950
@SP // 1951
A=M-1 // 1952
M=-D // 1953
// call Math.max
@7 // 1954
D=A // 1955
@14 // 1956
M=D // 1957
@Math.max // 1958
D=A // 1959
@13 // 1960
M=D // 1961
@Math.abs.ret.0 // 1962
D=A // 1963
@CALL // 1964
0;JMP // 1965
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 1966
0;JMP // 1967

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1968
AM=M+1 // 1969
A=A-1 // 1970
M=0 // 1971
@SP // 1972
AM=M+1 // 1973
A=A-1 // 1974
M=0 // 1975

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

@2055 // 1976
D=A // 1977
@LCL // 1978
A=M // 1979
M=D // 1980

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
@LCL // 1981
A=M // 1982
D=M // 1983
@SP // 1984
AM=M+1 // 1985
A=A-1 // 1986
M=D // 1987
@LCL // 1988
A=M // 1989
D=M // 1990
@16384 // 1991
D=A-D // 1992
@5 // 1993
D=D-A // 1994
@SP // 1995
AM=M-1 // 1996
A=M // 1997
M=D // 1998

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1999
A=M // 2000
D=M // 2001
@SP // 2002
AM=M+1 // 2003
A=A-1 // 2004
M=D+1 // 2005
D=1 // 2006
@SP // 2007
AM=M-1 // 2008
A=M // 2009
M=D // 2010

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2011
A=M // 2012
D=M // 2013
@2 // 2014
D=D+A // 2015
@SP // 2016
AM=M+1 // 2017
A=A-1 // 2018
M=D // 2019
D=0 // 2020
@SP // 2021
AM=M-1 // 2022
A=M // 2023
M=D // 2024

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2025
A=M // 2026
D=M // 2027
@3 // 2028
D=D+A // 2029
@SP // 2030
AM=M+1 // 2031
A=A-1 // 2032
M=D // 2033
D=0 // 2034
@SP // 2035
AM=M-1 // 2036
A=M // 2037
M=D // 2038

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2039
A=M // 2040
D=M // 2041
@SP // 2042
AM=M+1 // 2043
A=A-1 // 2044
M=D // 2045
// call Memory.create_foot
@6 // 2046
D=A // 2047
@14 // 2048
M=D // 2049
@Memory.create_foot // 2050
D=A // 2051
@13 // 2052
M=D // 2053
@Memory.init.ret.0 // 2054
D=A // 2055
@CALL // 2056
0;JMP // 2057
(Memory.init.ret.0)
@SP // 2058
M=M-1 // 2059

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

@2054 // 2060
D=A // 2061
@SP // 2062
AM=M+1 // 2063
A=A-1 // 2064
M=D // 2065
@2054 // 2066
D=A // 2067
@SP // 2068
AM=M+1 // 2069
A=A-1 // 2070
M=D // 2071
@LCL // 2072
A=M // 2073
D=M // 2074
@SP // 2075
AM=M+1 // 2076
A=A-1 // 2077
M=D // 2078
// call Memory.add_node
@7 // 2079
D=A // 2080
@14 // 2081
M=D // 2082
@Memory.add_node // 2083
D=A // 2084
@13 // 2085
M=D // 2086
@Memory.init.ret.1 // 2087
D=A // 2088
@CALL // 2089
0;JMP // 2090
(Memory.init.ret.1)
@SP // 2091
M=M-1 // 2092

////PushInstruction("constant 0")
@SP // 2093
AM=M+1 // 2094
A=A-1 // 2095
M=0 // 2096

////ReturnInstruction{}
@RETURN // 2097
0;JMP // 2098

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 2099
AM=M+1 // 2100
A=A-1 // 2101
M=0 // 2102
@SP // 2103
AM=M+1 // 2104
A=A-1 // 2105
M=0 // 2106
@SP // 2107
AM=M+1 // 2108
A=A-1 // 2109
M=0 // 2110
@SP // 2111
AM=M+1 // 2112
A=A-1 // 2113
M=0 // 2114
@SP // 2115
AM=M+1 // 2116
A=A-1 // 2117
M=0 // 2118

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2119
A=M // 2120
D=M // 2121
@SP // 2122
AM=M+1 // 2123
A=A-1 // 2124
M=D // 2125
// call Memory.getBinIndex
@6 // 2126
D=A // 2127
@14 // 2128
M=D // 2129
@Memory.getBinIndex // 2130
D=A // 2131
@13 // 2132
M=D // 2133
@Memory.alloc.ret.0 // 2134
D=A // 2135
@CALL // 2136
0;JMP // 2137
(Memory.alloc.ret.0)
@SP // 2138
AM=M-1 // 2139
D=M // 2140
@LCL // 2141
A=M // 2142
M=D // 2143

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

@LCL // 2144
A=M // 2145
D=M // 2146
@2048 // 2147
D=D+A // 2148
@LCL // 2149
A=M+1 // 2150
M=D // 2151

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2152
A=M+1 // 2153
D=M // 2154
@SP // 2155
AM=M+1 // 2156
A=A-1 // 2157
M=D // 2158
@ARG // 2159
A=M // 2160
D=M // 2161
@SP // 2162
AM=M+1 // 2163
A=A-1 // 2164
M=D // 2165
// call Memory.get_best_fit
@7 // 2166
D=A // 2167
@14 // 2168
M=D // 2169
@Memory.get_best_fit // 2170
D=A // 2171
@13 // 2172
M=D // 2173
@Memory.alloc.ret.1 // 2174
D=A // 2175
@CALL // 2176
0;JMP // 2177
(Memory.alloc.ret.1)
@SP // 2178
AM=M-1 // 2179
D=M // 2180
@LCL // 2181
A=M+1 // 2182
A=A+1 // 2183
M=D // 2184

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
@Memory.alloc.EQ.0 // 2185
D=A // 2186
@SP // 2187
AM=M+1 // 2188
A=A-1 // 2189
M=D // 2190
@LCL // 2191
A=M+1 // 2192
A=A+1 // 2193
D=M // 2194
@DO_EQ // 2195
0;JMP // 2196
(Memory.alloc.EQ.0)
D=!D // 2197
@WHILE_END_Memory.alloc1 // 2198
D;JNE // 2199

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
@Memory.alloc.EQ.1 // 2200
D=A // 2201
@SP // 2202
AM=M+1 // 2203
A=A-1 // 2204
M=D // 2205
@Memory.alloc.LT.2 // 2206
D=A // 2207
@SP // 2208
AM=M+1 // 2209
A=A-1 // 2210
M=D // 2211
@LCL // 2212
A=M // 2213
D=M // 2214
D=D+1 // 2215
@7 // 2216
D=D-A // 2217
@DO_LT // 2218
0;JMP // 2219
(Memory.alloc.LT.2)
D=!D // 2220
@DO_EQ // 2221
0;JMP // 2222
(Memory.alloc.EQ.1)
@Memory.alloc.IfElse1 // 2223
D;JNE // 2224

////PushInstruction("constant 0")
@SP // 2225
AM=M+1 // 2226
A=A-1 // 2227
M=0 // 2228

////ReturnInstruction{}
@RETURN // 2229
0;JMP // 2230

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 2231
0;JMP // 2232

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

@LCL // 2233
A=M // 2234
D=M // 2235
D=D+1 // 2236
@LCL // 2237
A=M // 2238
M=D // 2239

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

@LCL // 2240
A=M // 2241
D=M // 2242
@2048 // 2243
D=D+A // 2244
@LCL // 2245
A=M+1 // 2246
M=D // 2247

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2248
A=M+1 // 2249
D=M // 2250
@SP // 2251
AM=M+1 // 2252
A=A-1 // 2253
M=D // 2254
@ARG // 2255
A=M // 2256
D=M // 2257
@SP // 2258
AM=M+1 // 2259
A=A-1 // 2260
M=D // 2261
// call Memory.get_best_fit
@7 // 2262
D=A // 2263
@14 // 2264
M=D // 2265
@Memory.get_best_fit // 2266
D=A // 2267
@13 // 2268
M=D // 2269
@Memory.alloc.ret.2 // 2270
D=A // 2271
@CALL // 2272
0;JMP // 2273
(Memory.alloc.ret.2)
@SP // 2274
AM=M-1 // 2275
D=M // 2276
@LCL // 2277
A=M+1 // 2278
A=A+1 // 2279
M=D // 2280

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2281
0;JMP // 2282

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

@LCL // 2283
A=M+1 // 2284
A=A+1 // 2285
D=M // 2286
@0 // 2287
A=D+A // 2288
D=M // 2289
@SP // 2290
AM=M+1 // 2291
A=A-1 // 2292
M=D // 2293
// call Memory.getBinIndex
@6 // 2294
D=A // 2295
@14 // 2296
M=D // 2297
@Memory.getBinIndex // 2298
D=A // 2299
@13 // 2300
M=D // 2301
@Memory.alloc.ret.3 // 2302
D=A // 2303
@CALL // 2304
0;JMP // 2305
(Memory.alloc.ret.3)
@SP // 2306
AM=M-1 // 2307
D=M // 2308
@2048 // 2309
D=D+A // 2310
@SP // 2311
AM=M+1 // 2312
A=A-1 // 2313
M=D // 2314
@LCL // 2315
A=M+1 // 2316
A=A+1 // 2317
D=M // 2318
@SP // 2319
AM=M+1 // 2320
A=A-1 // 2321
M=D // 2322
// call Memory.remove_node
@7 // 2323
D=A // 2324
@14 // 2325
M=D // 2326
@Memory.remove_node // 2327
D=A // 2328
@13 // 2329
M=D // 2330
@Memory.alloc.ret.4 // 2331
D=A // 2332
@CALL // 2333
0;JMP // 2334
(Memory.alloc.ret.4)
@SP // 2335
M=M-1 // 2336

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

@LCL // 2337
A=M+1 // 2338
A=A+1 // 2339
D=M // 2340
@0 // 2341
A=D+A // 2342
D=M // 2343
@SP // 2344
AM=M+1 // 2345
A=A-1 // 2346
M=D // 2347
@ARG // 2348
A=M // 2349
D=M // 2350
@SP // 2351
AM=M-1 // 2352
D=M-D // 2353
@LCL // 2354
A=M+1 // 2355
A=A+1 // 2356
A=A+1 // 2357
M=D // 2358

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
@Memory.alloc.GT.3 // 2359
D=A // 2360
@SP // 2361
AM=M+1 // 2362
A=A-1 // 2363
M=D // 2364
@LCL // 2365
A=M+1 // 2366
A=A+1 // 2367
A=A+1 // 2368
D=M // 2369
@5 // 2370
D=D-A // 2371
@DO_GT // 2372
0;JMP // 2373
(Memory.alloc.GT.3)
D=!D // 2374
@Memory.alloc.IfElse2 // 2375
D;JNE // 2376

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2377
A=M+1 // 2378
A=A+1 // 2379
D=M // 2380
@SP // 2381
AM=M+1 // 2382
A=A-1 // 2383
M=D // 2384
@ARG // 2385
A=M // 2386
D=M // 2387
@SP // 2388
AM=M-1 // 2389
A=M // 2390
M=D // 2391

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2392
A=M+1 // 2393
A=A+1 // 2394
D=M // 2395
@SP // 2396
AM=M+1 // 2397
A=A-1 // 2398
M=D+1 // 2399
D=0 // 2400
@SP // 2401
AM=M-1 // 2402
A=M // 2403
M=D // 2404

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2405
A=M+1 // 2406
A=A+1 // 2407
D=M // 2408
@SP // 2409
AM=M+1 // 2410
A=A-1 // 2411
M=D // 2412
// call Memory.create_foot
@6 // 2413
D=A // 2414
@14 // 2415
M=D // 2416
@Memory.create_foot // 2417
D=A // 2418
@13 // 2419
M=D // 2420
@Memory.alloc.ret.5 // 2421
D=A // 2422
@CALL // 2423
0;JMP // 2424
(Memory.alloc.ret.5)
@SP // 2425
M=M-1 // 2426

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

@LCL // 2427
A=M+1 // 2428
A=A+1 // 2429
D=M // 2430
@SP // 2431
AM=M+1 // 2432
A=A-1 // 2433
M=D // 2434
@ARG // 2435
A=M // 2436
D=M // 2437
@SP // 2438
AM=M-1 // 2439
D=D+M // 2440
@5 // 2441
D=D+A // 2442
@SP // 2443
AM=M+1 // 2444
A=A-1 // 2445
M=D // 2446
@LCL // 2447
D=M // 2448
@4 // 2449
A=D+A // 2450
D=A // 2451
@R13 // 2452
M=D // 2453
@SP // 2454
AM=M-1 // 2455
D=M // 2456
@R13 // 2457
A=M // 2458
M=D // 2459

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
@LCL // 2460
D=M // 2461
@4 // 2462
A=D+A // 2463
D=M // 2464
@SP // 2465
AM=M+1 // 2466
A=A-1 // 2467
M=D // 2468
@LCL // 2469
A=M+1 // 2470
A=A+1 // 2471
A=A+1 // 2472
D=M // 2473
@5 // 2474
D=D-A // 2475
@SP // 2476
AM=M-1 // 2477
A=M // 2478
M=D // 2479

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2480
D=M // 2481
@4 // 2482
A=D+A // 2483
D=M // 2484
@SP // 2485
AM=M+1 // 2486
A=A-1 // 2487
M=D+1 // 2488
D=1 // 2489
@SP // 2490
AM=M-1 // 2491
A=M // 2492
M=D // 2493

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2494
D=M // 2495
@4 // 2496
A=D+A // 2497
D=M // 2498
@SP // 2499
AM=M+1 // 2500
A=A-1 // 2501
M=D // 2502
// call Memory.create_foot
@6 // 2503
D=A // 2504
@14 // 2505
M=D // 2506
@Memory.create_foot // 2507
D=A // 2508
@13 // 2509
M=D // 2510
@Memory.alloc.ret.6 // 2511
D=A // 2512
@CALL // 2513
0;JMP // 2514
(Memory.alloc.ret.6)
@SP // 2515
M=M-1 // 2516

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

@LCL // 2517
A=M+1 // 2518
A=A+1 // 2519
A=A+1 // 2520
D=M // 2521
@SP // 2522
AM=M+1 // 2523
A=A-1 // 2524
M=D // 2525
// call Memory.getBinIndex
@6 // 2526
D=A // 2527
@14 // 2528
M=D // 2529
@Memory.getBinIndex // 2530
D=A // 2531
@13 // 2532
M=D // 2533
@Memory.alloc.ret.7 // 2534
D=A // 2535
@CALL // 2536
0;JMP // 2537
(Memory.alloc.ret.7)
@SP // 2538
AM=M-1 // 2539
D=M // 2540
@2048 // 2541
D=D+A // 2542
@SP // 2543
AM=M+1 // 2544
A=A-1 // 2545
M=D // 2546
@LCL // 2547
D=M // 2548
@4 // 2549
A=D+A // 2550
D=M // 2551
@SP // 2552
AM=M+1 // 2553
A=A-1 // 2554
M=D // 2555
// call Memory.add_node
@7 // 2556
D=A // 2557
@14 // 2558
M=D // 2559
@Memory.add_node // 2560
D=A // 2561
@13 // 2562
M=D // 2563
@Memory.alloc.ret.8 // 2564
D=A // 2565
@CALL // 2566
0;JMP // 2567
(Memory.alloc.ret.8)
@SP // 2568
M=M-1 // 2569

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2570
0;JMP // 2571

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
@LCL // 2572
A=M+1 // 2573
A=A+1 // 2574
D=M // 2575
@SP // 2576
AM=M+1 // 2577
A=A-1 // 2578
M=D+1 // 2579
D=0 // 2580
@SP // 2581
AM=M-1 // 2582
A=M // 2583
M=D // 2584

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2585
A=M+1 // 2586
A=A+1 // 2587
D=M // 2588
@SP // 2589
AM=M+1 // 2590
A=A-1 // 2591
M=D // 2592
// call Memory.create_foot
@6 // 2593
D=A // 2594
@14 // 2595
M=D // 2596
@Memory.create_foot // 2597
D=A // 2598
@13 // 2599
M=D // 2600
@Memory.alloc.ret.9 // 2601
D=A // 2602
@CALL // 2603
0;JMP // 2604
(Memory.alloc.ret.9)
@SP // 2605
M=M-1 // 2606

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
@LCL // 2607
A=M+1 // 2608
A=A+1 // 2609
D=M // 2610
@4 // 2611
D=D+A // 2612
@SP // 2613
AM=M+1 // 2614
A=A-1 // 2615
M=D // 2616

////ReturnInstruction{}
@RETURN // 2617
0;JMP // 2618

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2619
AM=M+1 // 2620
A=A-1 // 2621
M=0 // 2622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2623
A=M // 2624
D=M // 2625
@SP // 2626
AM=M+1 // 2627
A=A-1 // 2628
M=D // 2629
// call Memory.alloc
@6 // 2630
D=A // 2631
@14 // 2632
M=D // 2633
@Memory.alloc // 2634
D=A // 2635
@13 // 2636
M=D // 2637
@Memory.calloc.ret.0 // 2638
D=A // 2639
@CALL // 2640
0;JMP // 2641
(Memory.calloc.ret.0)
@SP // 2642
AM=M-1 // 2643
D=M // 2644
@LCL // 2645
A=M // 2646
M=D // 2647

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.4 // 2648
D=A // 2649
@SP // 2650
AM=M+1 // 2651
A=A-1 // 2652
M=D // 2653
@LCL // 2654
A=M // 2655
D=!M // 2656
@DO_EQ // 2657
0;JMP // 2658
(Memory.calloc.EQ.4)
@Memory.calloc.IfElse1 // 2659
D;JNE // 2660

////PushInstruction("constant 0")
@SP // 2661
AM=M+1 // 2662
A=A-1 // 2663
M=0 // 2664

////ReturnInstruction{}
@RETURN // 2665
0;JMP // 2666

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 2667
0;JMP // 2668

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
@Memory.calloc.GT.5 // 2669
D=A // 2670
@SP // 2671
AM=M+1 // 2672
A=A-1 // 2673
M=D // 2674
@ARG // 2675
A=M // 2676
D=M // 2677
@DO_GT // 2678
0;JMP // 2679
(Memory.calloc.GT.5)
D=!D // 2680
@WHILE_END_Memory.calloc1 // 2681
D;JNE // 2682

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

@ARG // 2683
A=M // 2684
D=M // 2685
D=D-1 // 2686
@ARG // 2687
A=M // 2688
M=D // 2689

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2690
A=M // 2691
D=M // 2692
@SP // 2693
AM=M+1 // 2694
A=A-1 // 2695
M=D // 2696
@ARG // 2697
A=M // 2698
D=M // 2699
@SP // 2700
AM=M-1 // 2701
D=D+M // 2702
@SP // 2703
AM=M+1 // 2704
A=A-1 // 2705
M=D // 2706
D=0 // 2707
@SP // 2708
AM=M-1 // 2709
A=M // 2710
M=D // 2711

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2712
0;JMP // 2713

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2714
A=M // 2715
D=M // 2716
@SP // 2717
AM=M+1 // 2718
A=A-1 // 2719
M=D // 2720

////ReturnInstruction{}
@RETURN // 2721
0;JMP // 2722

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 2723
AM=M+1 // 2724
A=A-1 // 2725
M=0 // 2726
@SP // 2727
AM=M+1 // 2728
A=A-1 // 2729
M=0 // 2730
@SP // 2731
AM=M+1 // 2732
A=A-1 // 2733
M=0 // 2734

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

@ARG // 2735
A=M // 2736
D=M // 2737
@4 // 2738
D=D-A // 2739
@LCL // 2740
A=M // 2741
M=D // 2742

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2743
A=M // 2744
D=M // 2745
@SP // 2746
AM=M+1 // 2747
A=A-1 // 2748
M=D+1 // 2749
D=1 // 2750
@SP // 2751
AM=M-1 // 2752
A=M // 2753
M=D // 2754

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

@LCL // 2755
A=M // 2756
D=M // 2757
@2 // 2758
A=D+A // 2759
D=M // 2760
@LCL // 2761
A=M+1 // 2762
M=D // 2763

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

@LCL // 2764
A=M // 2765
D=M // 2766
@3 // 2767
A=D+A // 2768
D=M // 2769
@LCL // 2770
A=M+1 // 2771
A=A+1 // 2772
M=D // 2773

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
@Memory.deAlloc.EQ.6 // 2774
D=A // 2775
@SP // 2776
AM=M+1 // 2777
A=A-1 // 2778
M=D // 2779
@Memory.deAlloc.EQ.7 // 2780
D=A // 2781
@SP // 2782
AM=M+1 // 2783
A=A-1 // 2784
M=D // 2785
@LCL // 2786
A=M+1 // 2787
D=M // 2788
@DO_EQ // 2789
0;JMP // 2790
(Memory.deAlloc.EQ.7)
D=!D // 2791
@DO_EQ // 2792
0;JMP // 2793
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse1 // 2794
D;JNE // 2795

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
@Memory.deAlloc.EQ.8 // 2796
D=A // 2797
@SP // 2798
AM=M+1 // 2799
A=A-1 // 2800
M=D // 2801
@LCL // 2802
A=M+1 // 2803
D=M // 2804
A=D+1 // 2805
D=M // 2806
D=D-1 // 2807
@DO_EQ // 2808
0;JMP // 2809
(Memory.deAlloc.EQ.8)
D=!D // 2810
@Memory.deAlloc.IfElse2 // 2811
D;JNE // 2812

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

@LCL // 2813
A=M+1 // 2814
D=M // 2815
@0 // 2816
A=D+A // 2817
D=M // 2818
@SP // 2819
AM=M+1 // 2820
A=A-1 // 2821
M=D // 2822
// call Memory.getBinIndex
@6 // 2823
D=A // 2824
@14 // 2825
M=D // 2826
@Memory.getBinIndex // 2827
D=A // 2828
@13 // 2829
M=D // 2830
@Memory.deAlloc.ret.0 // 2831
D=A // 2832
@CALL // 2833
0;JMP // 2834
(Memory.deAlloc.ret.0)
@SP // 2835
AM=M-1 // 2836
D=M // 2837
@2048 // 2838
D=D+A // 2839
@SP // 2840
AM=M+1 // 2841
A=A-1 // 2842
M=D // 2843
@LCL // 2844
A=M+1 // 2845
D=M // 2846
@SP // 2847
AM=M+1 // 2848
A=A-1 // 2849
M=D // 2850
// call Memory.remove_node
@7 // 2851
D=A // 2852
@14 // 2853
M=D // 2854
@Memory.remove_node // 2855
D=A // 2856
@13 // 2857
M=D // 2858
@Memory.deAlloc.ret.1 // 2859
D=A // 2860
@CALL // 2861
0;JMP // 2862
(Memory.deAlloc.ret.1)
@SP // 2863
M=M-1 // 2864

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
@LCL // 2865
A=M+1 // 2866
D=M // 2867
@SP // 2868
AM=M+1 // 2869
A=A-1 // 2870
M=D // 2871
@LCL // 2872
A=M+1 // 2873
D=M // 2874
@0 // 2875
A=D+A // 2876
D=M // 2877
@SP // 2878
AM=M+1 // 2879
A=A-1 // 2880
M=D // 2881
@LCL // 2882
A=M // 2883
D=M // 2884
@0 // 2885
A=D+A // 2886
D=M // 2887
@SP // 2888
AM=M-1 // 2889
D=D+M // 2890
@5 // 2891
D=D+A // 2892
@SP // 2893
AM=M-1 // 2894
A=M // 2895
M=D // 2896

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2897
A=M+1 // 2898
D=M // 2899
@SP // 2900
AM=M+1 // 2901
A=A-1 // 2902
M=D // 2903
// call Memory.create_foot
@6 // 2904
D=A // 2905
@14 // 2906
M=D // 2907
@Memory.create_foot // 2908
D=A // 2909
@13 // 2910
M=D // 2911
@Memory.deAlloc.ret.2 // 2912
D=A // 2913
@CALL // 2914
0;JMP // 2915
(Memory.deAlloc.ret.2)
@SP // 2916
M=M-1 // 2917

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2918
A=M+1 // 2919
D=M // 2920
@LCL // 2921
A=M // 2922
M=D // 2923

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 2924
0;JMP // 2925

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 2926
0;JMP // 2927

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
@Memory.deAlloc.EQ.9 // 2928
D=A // 2929
@SP // 2930
AM=M+1 // 2931
A=A-1 // 2932
M=D // 2933
@Memory.deAlloc.EQ.10 // 2934
D=A // 2935
@SP // 2936
AM=M+1 // 2937
A=A-1 // 2938
M=D // 2939
@LCL // 2940
A=M+1 // 2941
A=A+1 // 2942
D=M // 2943
@DO_EQ // 2944
0;JMP // 2945
(Memory.deAlloc.EQ.10)
D=!D // 2946
@DO_EQ // 2947
0;JMP // 2948
(Memory.deAlloc.EQ.9)
@Memory.deAlloc.IfElse3 // 2949
D;JNE // 2950

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
@Memory.deAlloc.EQ.11 // 2951
D=A // 2952
@SP // 2953
AM=M+1 // 2954
A=A-1 // 2955
M=D // 2956
@LCL // 2957
A=M+1 // 2958
A=A+1 // 2959
D=M // 2960
A=D+1 // 2961
D=M // 2962
D=D-1 // 2963
@DO_EQ // 2964
0;JMP // 2965
(Memory.deAlloc.EQ.11)
D=!D // 2966
@Memory.deAlloc.IfElse4 // 2967
D;JNE // 2968

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

@LCL // 2969
A=M+1 // 2970
A=A+1 // 2971
D=M // 2972
@0 // 2973
A=D+A // 2974
D=M // 2975
@SP // 2976
AM=M+1 // 2977
A=A-1 // 2978
M=D // 2979
// call Memory.getBinIndex
@6 // 2980
D=A // 2981
@14 // 2982
M=D // 2983
@Memory.getBinIndex // 2984
D=A // 2985
@13 // 2986
M=D // 2987
@Memory.deAlloc.ret.3 // 2988
D=A // 2989
@CALL // 2990
0;JMP // 2991
(Memory.deAlloc.ret.3)
@SP // 2992
AM=M-1 // 2993
D=M // 2994
@2048 // 2995
D=D+A // 2996
@SP // 2997
AM=M+1 // 2998
A=A-1 // 2999
M=D // 3000
@LCL // 3001
A=M+1 // 3002
A=A+1 // 3003
D=M // 3004
@SP // 3005
AM=M+1 // 3006
A=A-1 // 3007
M=D // 3008
// call Memory.remove_node
@7 // 3009
D=A // 3010
@14 // 3011
M=D // 3012
@Memory.remove_node // 3013
D=A // 3014
@13 // 3015
M=D // 3016
@Memory.deAlloc.ret.4 // 3017
D=A // 3018
@CALL // 3019
0;JMP // 3020
(Memory.deAlloc.ret.4)
@SP // 3021
M=M-1 // 3022

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
@LCL // 3023
A=M // 3024
D=M // 3025
@SP // 3026
AM=M+1 // 3027
A=A-1 // 3028
M=D // 3029
@LCL // 3030
A=M // 3031
D=M // 3032
@0 // 3033
A=D+A // 3034
D=M // 3035
@SP // 3036
AM=M+1 // 3037
A=A-1 // 3038
M=D // 3039
@LCL // 3040
A=M+1 // 3041
A=A+1 // 3042
D=M // 3043
@0 // 3044
A=D+A // 3045
D=M // 3046
@SP // 3047
AM=M-1 // 3048
D=D+M // 3049
@5 // 3050
D=D+A // 3051
@SP // 3052
AM=M-1 // 3053
A=M // 3054
M=D // 3055

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3056
A=M // 3057
D=M // 3058
@SP // 3059
AM=M+1 // 3060
A=A-1 // 3061
M=D // 3062
// call Memory.create_foot
@6 // 3063
D=A // 3064
@14 // 3065
M=D // 3066
@Memory.create_foot // 3067
D=A // 3068
@13 // 3069
M=D // 3070
@Memory.deAlloc.ret.5 // 3071
D=A // 3072
@CALL // 3073
0;JMP // 3074
(Memory.deAlloc.ret.5)
@SP // 3075
M=M-1 // 3076

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 3077
0;JMP // 3078

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 3079
0;JMP // 3080

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

@LCL // 3081
A=M // 3082
D=M // 3083
@0 // 3084
A=D+A // 3085
D=M // 3086
@SP // 3087
AM=M+1 // 3088
A=A-1 // 3089
M=D // 3090
// call Memory.getBinIndex
@6 // 3091
D=A // 3092
@14 // 3093
M=D // 3094
@Memory.getBinIndex // 3095
D=A // 3096
@13 // 3097
M=D // 3098
@Memory.deAlloc.ret.6 // 3099
D=A // 3100
@CALL // 3101
0;JMP // 3102
(Memory.deAlloc.ret.6)
@SP // 3103
AM=M-1 // 3104
D=M // 3105
@2048 // 3106
D=D+A // 3107
@SP // 3108
AM=M+1 // 3109
A=A-1 // 3110
M=D // 3111
@LCL // 3112
A=M // 3113
D=M // 3114
@SP // 3115
AM=M+1 // 3116
A=A-1 // 3117
M=D // 3118
// call Memory.add_node
@7 // 3119
D=A // 3120
@14 // 3121
M=D // 3122
@Memory.add_node // 3123
D=A // 3124
@13 // 3125
M=D // 3126
@Memory.deAlloc.ret.7 // 3127
D=A // 3128
@CALL // 3129
0;JMP // 3130
(Memory.deAlloc.ret.7)
@SP // 3131
M=M-1 // 3132

////PushInstruction("constant 0")
@SP // 3133
AM=M+1 // 3134
A=A-1 // 3135
M=0 // 3136

////ReturnInstruction{}
@RETURN // 3137
0;JMP // 3138

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 3139
AM=M+1 // 3140
A=A-1 // 3141
M=0 // 3142
@SP // 3143
AM=M+1 // 3144
A=A-1 // 3145
M=0 // 3146
@SP // 3147
AM=M+1 // 3148
A=A-1 // 3149
M=0 // 3150
@SP // 3151
AM=M+1 // 3152
A=A-1 // 3153
M=0 // 3154

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
@Memory.realloc.EQ.12 // 3155
D=A // 3156
@SP // 3157
AM=M+1 // 3158
A=A-1 // 3159
M=D // 3160
@ARG // 3161
A=M // 3162
D=M // 3163
@DO_EQ // 3164
0;JMP // 3165
(Memory.realloc.EQ.12)
D=!D // 3166
@Memory.realloc.IfElse1 // 3167
D;JNE // 3168

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3169
A=M+1 // 3170
D=M // 3171
@SP // 3172
AM=M+1 // 3173
A=A-1 // 3174
M=D // 3175
// call Memory.alloc
@6 // 3176
D=A // 3177
@14 // 3178
M=D // 3179
@Memory.alloc // 3180
D=A // 3181
@13 // 3182
M=D // 3183
@Memory.realloc.ret.0 // 3184
D=A // 3185
@CALL // 3186
0;JMP // 3187
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 3188
0;JMP // 3189

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 3190
0;JMP // 3191

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

@ARG // 3192
A=M // 3193
D=M // 3194
D=D-1 // 3195
@LCL // 3196
A=M+1 // 3197
A=A+1 // 3198
A=A+1 // 3199
M=D // 3200

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

@LCL // 3201
A=M+1 // 3202
A=A+1 // 3203
A=A+1 // 3204
D=M // 3205
@0 // 3206
A=D+A // 3207
D=M // 3208
@LCL // 3209
A=M // 3210
M=D // 3211

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3212
A=M+1 // 3213
D=M // 3214
@SP // 3215
AM=M+1 // 3216
A=A-1 // 3217
M=D // 3218
// call Memory.alloc
@6 // 3219
D=A // 3220
@14 // 3221
M=D // 3222
@Memory.alloc // 3223
D=A // 3224
@13 // 3225
M=D // 3226
@Memory.realloc.ret.1 // 3227
D=A // 3228
@CALL // 3229
0;JMP // 3230
(Memory.realloc.ret.1)
@SP // 3231
AM=M-1 // 3232
D=M // 3233
@LCL // 3234
A=M+1 // 3235
M=D // 3236

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
@Memory.realloc.EQ.13 // 3237
D=A // 3238
@SP // 3239
AM=M+1 // 3240
A=A-1 // 3241
M=D // 3242
@LCL // 3243
A=M+1 // 3244
D=M // 3245
@DO_EQ // 3246
0;JMP // 3247
(Memory.realloc.EQ.13)
D=!D // 3248
@Memory.realloc.IfElse2 // 3249
D;JNE // 3250

////PushInstruction("constant 0")
@SP // 3251
AM=M+1 // 3252
A=A-1 // 3253
M=0 // 3254

////ReturnInstruction{}
@RETURN // 3255
0;JMP // 3256

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 3257
0;JMP // 3258

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
@Memory.realloc.EQ.14 // 3259
D=A // 3260
@SP // 3261
AM=M+1 // 3262
A=A-1 // 3263
M=D // 3264
@Memory.realloc.GT.15 // 3265
D=A // 3266
@SP // 3267
AM=M+1 // 3268
A=A-1 // 3269
M=D // 3270
@LCL // 3271
A=M // 3272
D=M // 3273
@SP // 3274
AM=M+1 // 3275
A=A-1 // 3276
M=D // 3277
@ARG // 3278
A=M+1 // 3279
D=M // 3280
@SP // 3281
AM=M-1 // 3282
D=M-D // 3283
@DO_GT // 3284
0;JMP // 3285
(Memory.realloc.GT.15)
D=!D // 3286
@DO_EQ // 3287
0;JMP // 3288
(Memory.realloc.EQ.14)
@Memory.realloc.IfElse3 // 3289
D;JNE // 3290

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3291
A=M // 3292
D=M // 3293
@LCL // 3294
A=M+1 // 3295
A=A+1 // 3296
M=D // 3297

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3298
0;JMP // 3299

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3300
A=M+1 // 3301
D=M // 3302
@LCL // 3303
A=M+1 // 3304
A=A+1 // 3305
M=D // 3306

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3307
A=M // 3308
D=M // 3309
@SP // 3310
AM=M+1 // 3311
A=A-1 // 3312
M=D // 3313
@LCL // 3314
A=M+1 // 3315
D=M // 3316
@SP // 3317
AM=M+1 // 3318
A=A-1 // 3319
M=D // 3320
@LCL // 3321
A=M+1 // 3322
A=A+1 // 3323
D=M // 3324
@SP // 3325
AM=M+1 // 3326
A=A-1 // 3327
M=D // 3328
// call Memory.copy
@8 // 3329
D=A // 3330
@14 // 3331
M=D // 3332
@Memory.copy // 3333
D=A // 3334
@13 // 3335
M=D // 3336
@Memory.realloc.ret.2 // 3337
D=A // 3338
@CALL // 3339
0;JMP // 3340
(Memory.realloc.ret.2)
@SP // 3341
M=M-1 // 3342

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3343
A=M // 3344
D=M // 3345
@SP // 3346
AM=M+1 // 3347
A=A-1 // 3348
M=D // 3349
// call Memory.deAlloc
@6 // 3350
D=A // 3351
@14 // 3352
M=D // 3353
@Memory.deAlloc // 3354
D=A // 3355
@13 // 3356
M=D // 3357
@Memory.realloc.ret.3 // 3358
D=A // 3359
@CALL // 3360
0;JMP // 3361
(Memory.realloc.ret.3)
@SP // 3362
M=M-1 // 3363

////PushInstruction("local 1")
@LCL // 3364
A=M+1 // 3365
D=M // 3366
@SP // 3367
AM=M+1 // 3368
A=A-1 // 3369
M=D // 3370

////ReturnInstruction{}
@RETURN // 3371
0;JMP // 3372

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3373
AM=M+1 // 3374
A=A-1 // 3375
M=0 // 3376

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3377
A=M // 3378
M=0 // 3379

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
@Memory.copy.LT.16 // 3380
D=A // 3381
@SP // 3382
AM=M+1 // 3383
A=A-1 // 3384
M=D // 3385
@LCL // 3386
A=M // 3387
D=M // 3388
@SP // 3389
AM=M+1 // 3390
A=A-1 // 3391
M=D // 3392
@ARG // 3393
A=M+1 // 3394
A=A+1 // 3395
D=M // 3396
@SP // 3397
AM=M-1 // 3398
D=M-D // 3399
@DO_LT // 3400
0;JMP // 3401
(Memory.copy.LT.16)
D=!D // 3402
@WHILE_END_Memory.copy1 // 3403
D;JNE // 3404

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
@ARG // 3405
A=M+1 // 3406
D=M // 3407
@SP // 3408
AM=M+1 // 3409
A=A-1 // 3410
M=D // 3411
@LCL // 3412
A=M // 3413
D=M // 3414
@SP // 3415
AM=M-1 // 3416
D=D+M // 3417
@SP // 3418
AM=M+1 // 3419
A=A-1 // 3420
M=D // 3421
@ARG // 3422
A=M // 3423
D=M // 3424
@SP // 3425
AM=M+1 // 3426
A=A-1 // 3427
M=D // 3428
@LCL // 3429
A=M // 3430
D=M // 3431
@SP // 3432
AM=M-1 // 3433
A=D+M // 3434
D=M // 3435
@SP // 3436
AM=M-1 // 3437
A=M // 3438
M=D // 3439

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

@LCL // 3440
A=M // 3441
D=M // 3442
D=D+1 // 3443
@LCL // 3444
A=M // 3445
M=D // 3446

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3447
0;JMP // 3448

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3449
AM=M+1 // 3450
A=A-1 // 3451
M=0 // 3452

////ReturnInstruction{}
@RETURN // 3453
0;JMP // 3454

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
@Memory.remove_node.EQ.17 // 3455
D=A // 3456
@SP // 3457
AM=M+1 // 3458
A=A-1 // 3459
M=D // 3460
@Memory.remove_node.EQ.18 // 3461
D=A // 3462
@SP // 3463
AM=M+1 // 3464
A=A-1 // 3465
M=D // 3466
@ARG // 3467
A=M+1 // 3468
D=M // 3469
@2 // 3470
A=D+A // 3471
D=M // 3472
@DO_EQ // 3473
0;JMP // 3474
(Memory.remove_node.EQ.18)
D=!D // 3475
@DO_EQ // 3476
0;JMP // 3477
(Memory.remove_node.EQ.17)
@Memory.remove_node.IfElse1 // 3478
D;JNE // 3479

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
@ARG // 3480
A=M+1 // 3481
D=M // 3482
@2 // 3483
D=D+A // 3484
@3 // 3485
D=D+A // 3486
@SP // 3487
AM=M+1 // 3488
A=A-1 // 3489
M=D // 3490
@ARG // 3491
A=M+1 // 3492
D=M // 3493
@3 // 3494
A=D+A // 3495
D=M // 3496
@SP // 3497
AM=M-1 // 3498
A=M // 3499
M=D // 3500

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3501
0;JMP // 3502

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
@ARG // 3503
A=M // 3504
D=M // 3505
@SP // 3506
AM=M+1 // 3507
A=A-1 // 3508
M=D // 3509
@ARG // 3510
A=M+1 // 3511
D=M // 3512
@3 // 3513
A=D+A // 3514
D=M // 3515
@SP // 3516
AM=M-1 // 3517
A=M // 3518
M=D // 3519

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
@Memory.remove_node.EQ.19 // 3520
D=A // 3521
@SP // 3522
AM=M+1 // 3523
A=A-1 // 3524
M=D // 3525
@Memory.remove_node.EQ.20 // 3526
D=A // 3527
@SP // 3528
AM=M+1 // 3529
A=A-1 // 3530
M=D // 3531
@ARG // 3532
A=M+1 // 3533
D=M // 3534
@3 // 3535
A=D+A // 3536
D=M // 3537
@DO_EQ // 3538
0;JMP // 3539
(Memory.remove_node.EQ.20)
D=!D // 3540
@DO_EQ // 3541
0;JMP // 3542
(Memory.remove_node.EQ.19)
@Memory.remove_node.IfElse2 // 3543
D;JNE // 3544

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
@ARG // 3545
A=M+1 // 3546
D=M // 3547
@3 // 3548
D=D+A // 3549
@2 // 3550
D=D+A // 3551
@SP // 3552
AM=M+1 // 3553
A=A-1 // 3554
M=D // 3555
@ARG // 3556
A=M+1 // 3557
D=M // 3558
@2 // 3559
A=D+A // 3560
D=M // 3561
@SP // 3562
AM=M-1 // 3563
A=M // 3564
M=D // 3565

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 3566
0;JMP // 3567

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
@ARG // 3568
A=M+1 // 3569
D=M // 3570
@2 // 3571
D=D+A // 3572
@SP // 3573
AM=M+1 // 3574
A=A-1 // 3575
M=D // 3576
D=0 // 3577
@SP // 3578
AM=M-1 // 3579
A=M // 3580
M=D // 3581

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3582
A=M+1 // 3583
D=M // 3584
@3 // 3585
D=D+A // 3586
@SP // 3587
AM=M+1 // 3588
A=A-1 // 3589
M=D // 3590
D=0 // 3591
@SP // 3592
AM=M-1 // 3593
A=M // 3594
M=D // 3595

////PushInstruction("constant 0")
@SP // 3596
AM=M+1 // 3597
A=A-1 // 3598
M=0 // 3599

////ReturnInstruction{}
@RETURN // 3600
0;JMP // 3601

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3602
AM=M+1 // 3603
A=A-1 // 3604
M=0 // 3605

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3606
A=M // 3607
M=0 // 3608

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
@Memory.getBinIndex.EQ.21 // 3609
D=A // 3610
@SP // 3611
AM=M+1 // 3612
A=A-1 // 3613
M=D // 3614
@Memory.getBinIndex.LT.22 // 3615
D=A // 3616
@SP // 3617
AM=M+1 // 3618
A=A-1 // 3619
M=D // 3620
@LCL // 3621
A=M // 3622
D=M // 3623
@7 // 3624
D=D-A // 3625
@DO_LT // 3626
0;JMP // 3627
(Memory.getBinIndex.LT.22)
@SP // 3628
AM=M+1 // 3629
A=A-1 // 3630
M=D // 3631
@Memory.getBinIndex.EQ.23 // 3632
D=A // 3633
@SP // 3634
AM=M+1 // 3635
A=A-1 // 3636
M=D // 3637
@LCL // 3638
A=M // 3639
D=M // 3640
@2048 // 3641
A=D+A // 3642
D=M // 3643
@DO_EQ // 3644
0;JMP // 3645
(Memory.getBinIndex.EQ.23)
D=!D // 3646
@SP // 3647
AM=M-1 // 3648
D=D&M // 3649
@DO_EQ // 3650
0;JMP // 3651
(Memory.getBinIndex.EQ.21)
@WHILE_END_Memory.getBinIndex1 // 3652
D;JNE // 3653

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
@Memory.getBinIndex.EQ.24 // 3654
D=A // 3655
@SP // 3656
AM=M+1 // 3657
A=A-1 // 3658
M=D // 3659
@Memory.getBinIndex.GT.25 // 3660
D=A // 3661
@SP // 3662
AM=M+1 // 3663
A=A-1 // 3664
M=D // 3665
@ARG // 3666
A=M // 3667
D=M // 3668
@SP // 3669
AM=M+1 // 3670
A=A-1 // 3671
M=D // 3672
@LCL // 3673
A=M // 3674
D=M // 3675
@SP // 3676
AM=M+1 // 3677
A=A-1 // 3678
M=D+1 // 3679
@16 // 3680
D=A // 3681
@SP // 3682
AM=M+1 // 3683
A=A-1 // 3684
M=D // 3685
// call Math.multiply
@7 // 3686
D=A // 3687
@14 // 3688
M=D // 3689
@Math.multiply // 3690
D=A // 3691
@13 // 3692
M=D // 3693
@Memory.getBinIndex.ret.0 // 3694
D=A // 3695
@CALL // 3696
0;JMP // 3697
(Memory.getBinIndex.ret.0)
@SP // 3698
AM=M-1 // 3699
D=M // 3700
@SP // 3701
AM=M-1 // 3702
D=M-D // 3703
@DO_GT // 3704
0;JMP // 3705
(Memory.getBinIndex.GT.25)
D=!D // 3706
@DO_EQ // 3707
0;JMP // 3708
(Memory.getBinIndex.EQ.24)
@Memory.getBinIndex.IfElse1 // 3709
D;JNE // 3710

////PushInstruction("local 0")
@LCL // 3711
A=M // 3712
D=M // 3713
@SP // 3714
AM=M+1 // 3715
A=A-1 // 3716
M=D // 3717

////ReturnInstruction{}
@RETURN // 3718
0;JMP // 3719

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 3720
0;JMP // 3721

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

@LCL // 3722
A=M // 3723
D=M // 3724
D=D+1 // 3725
@LCL // 3726
A=M // 3727
M=D // 3728

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3729
0;JMP // 3730

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
@6 // 3731
D=A // 3732
@SP // 3733
AM=M+1 // 3734
A=A-1 // 3735
M=D // 3736
@7 // 3737
D=A // 3738
@SP // 3739
AM=M+1 // 3740
A=A-1 // 3741
M=D-1 // 3742

////ReturnInstruction{}
@RETURN // 3743
0;JMP // 3744

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3745
AM=M+1 // 3746
A=A-1 // 3747
M=0 // 3748

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

@ARG // 3749
A=M // 3750
D=M // 3751
@0 // 3752
A=D+A // 3753
D=M // 3754
@LCL // 3755
A=M // 3756
M=D // 3757

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
@Memory.get_best_fit.EQ.26 // 3758
D=A // 3759
@SP // 3760
AM=M+1 // 3761
A=A-1 // 3762
M=D // 3763
@Memory.get_best_fit.LT.27 // 3764
D=A // 3765
@SP // 3766
AM=M+1 // 3767
A=A-1 // 3768
M=D // 3769
@LCL // 3770
A=M // 3771
D=M // 3772
@0 // 3773
A=D+A // 3774
D=M // 3775
@SP // 3776
AM=M+1 // 3777
A=A-1 // 3778
M=D // 3779
@ARG // 3780
A=M+1 // 3781
D=M // 3782
@SP // 3783
AM=M-1 // 3784
D=M-D // 3785
@DO_LT // 3786
0;JMP // 3787
(Memory.get_best_fit.LT.27)
D=!D // 3788
@DO_EQ // 3789
0;JMP // 3790
(Memory.get_best_fit.EQ.26)
@Memory.get_best_fit.IfElse1 // 3791
D;JNE // 3792

////PushInstruction("local 0")
@LCL // 3793
A=M // 3794
D=M // 3795
@SP // 3796
AM=M+1 // 3797
A=A-1 // 3798
M=D // 3799

////ReturnInstruction{}
@RETURN // 3800
0;JMP // 3801

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 3802
0;JMP // 3803

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
@Memory.get_best_fit.EQ.28 // 3804
D=A // 3805
@SP // 3806
AM=M+1 // 3807
A=A-1 // 3808
M=D // 3809
@Memory.get_best_fit.EQ.29 // 3810
D=A // 3811
@SP // 3812
AM=M+1 // 3813
A=A-1 // 3814
M=D // 3815
@LCL // 3816
A=M // 3817
D=M // 3818
@3 // 3819
A=D+A // 3820
D=M // 3821
@DO_EQ // 3822
0;JMP // 3823
(Memory.get_best_fit.EQ.29)
D=!D // 3824
@DO_EQ // 3825
0;JMP // 3826
(Memory.get_best_fit.EQ.28)
@WHILE_END_Memory.get_best_fit1 // 3827
D;JNE // 3828

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

@LCL // 3829
A=M // 3830
D=M // 3831
@3 // 3832
A=D+A // 3833
D=M // 3834
@LCL // 3835
A=M // 3836
M=D // 3837

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
@Memory.get_best_fit.EQ.30 // 3838
D=A // 3839
@SP // 3840
AM=M+1 // 3841
A=A-1 // 3842
M=D // 3843
@Memory.get_best_fit.LT.31 // 3844
D=A // 3845
@SP // 3846
AM=M+1 // 3847
A=A-1 // 3848
M=D // 3849
@LCL // 3850
A=M // 3851
D=M // 3852
@0 // 3853
A=D+A // 3854
D=M // 3855
@SP // 3856
AM=M+1 // 3857
A=A-1 // 3858
M=D // 3859
@ARG // 3860
A=M+1 // 3861
D=M // 3862
@SP // 3863
AM=M-1 // 3864
D=M-D // 3865
@DO_LT // 3866
0;JMP // 3867
(Memory.get_best_fit.LT.31)
D=!D // 3868
@DO_EQ // 3869
0;JMP // 3870
(Memory.get_best_fit.EQ.30)
@Memory.get_best_fit.IfElse2 // 3871
D;JNE // 3872

////PushInstruction("local 0")
@LCL // 3873
A=M // 3874
D=M // 3875
@SP // 3876
AM=M+1 // 3877
A=A-1 // 3878
M=D // 3879

////ReturnInstruction{}
@RETURN // 3880
0;JMP // 3881

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 3882
0;JMP // 3883

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3884
0;JMP // 3885

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3886
AM=M+1 // 3887
A=A-1 // 3888
M=0 // 3889

////ReturnInstruction{}
@RETURN // 3890
0;JMP // 3891

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
@ARG // 3892
A=M // 3893
D=M // 3894
@SP // 3895
AM=M+1 // 3896
A=A-1 // 3897
M=D // 3898
@ARG // 3899
A=M // 3900
D=M // 3901
@0 // 3902
A=D+A // 3903
D=M // 3904
@4 // 3905
D=D+A // 3906
@SP // 3907
AM=M-1 // 3908
D=D+M // 3909
@SP // 3910
AM=M+1 // 3911
A=A-1 // 3912
M=D // 3913
@ARG // 3914
A=M // 3915
D=M // 3916
@SP // 3917
AM=M-1 // 3918
A=M // 3919
M=D // 3920

////PushInstruction("constant 0")
@SP // 3921
AM=M+1 // 3922
A=A-1 // 3923
M=0 // 3924

////ReturnInstruction{}
@RETURN // 3925
0;JMP // 3926

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3927
AM=M+1 // 3928
A=A-1 // 3929
M=0 // 3930
@SP // 3931
AM=M+1 // 3932
A=A-1 // 3933
M=0 // 3934

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3935
A=M+1 // 3936
D=M // 3937
@2 // 3938
D=D+A // 3939
@SP // 3940
AM=M+1 // 3941
A=A-1 // 3942
M=D // 3943
D=0 // 3944
@SP // 3945
AM=M-1 // 3946
A=M // 3947
M=D // 3948

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3949
A=M+1 // 3950
D=M // 3951
@3 // 3952
D=D+A // 3953
@SP // 3954
AM=M+1 // 3955
A=A-1 // 3956
M=D // 3957
D=0 // 3958
@SP // 3959
AM=M-1 // 3960
A=M // 3961
M=D // 3962

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
@Memory.add_node.EQ.32 // 3963
D=A // 3964
@SP // 3965
AM=M+1 // 3966
A=A-1 // 3967
M=D // 3968
@ARG // 3969
A=M // 3970
D=M // 3971
@0 // 3972
A=D+A // 3973
D=M // 3974
@DO_EQ // 3975
0;JMP // 3976
(Memory.add_node.EQ.32)
D=!D // 3977
@Memory.add_node.IfElse1 // 3978
D;JNE // 3979

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3980
A=M // 3981
D=M // 3982
@SP // 3983
AM=M+1 // 3984
A=A-1 // 3985
M=D // 3986
@ARG // 3987
A=M+1 // 3988
D=M // 3989
@SP // 3990
AM=M-1 // 3991
A=M // 3992
M=D // 3993

////PushInstruction("constant 0")
@SP // 3994
AM=M+1 // 3995
A=A-1 // 3996
M=0 // 3997

////ReturnInstruction{}
@RETURN // 3998
0;JMP // 3999

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 4000
0;JMP // 4001

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

@ARG // 4002
A=M // 4003
D=M // 4004
@0 // 4005
A=D+A // 4006
D=M // 4007
@LCL // 4008
A=M // 4009
M=D // 4010

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4011
A=M+1 // 4012
M=0 // 4013

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
@Memory.add_node.EQ.33 // 4014
D=A // 4015
@SP // 4016
AM=M+1 // 4017
A=A-1 // 4018
M=D // 4019
@Memory.add_node.EQ.34 // 4020
D=A // 4021
@SP // 4022
AM=M+1 // 4023
A=A-1 // 4024
M=D // 4025
@LCL // 4026
A=M // 4027
D=M // 4028
@DO_EQ // 4029
0;JMP // 4030
(Memory.add_node.EQ.34)
@SP // 4031
AM=M+1 // 4032
A=A-1 // 4033
M=D // 4034
@SP // 4035
A=M-1 // 4036
M=!D // 4037
@Memory.add_node.GT.35 // 4038
D=A // 4039
@SP // 4040
AM=M+1 // 4041
A=A-1 // 4042
M=D // 4043
@LCL // 4044
A=M // 4045
D=M // 4046
@0 // 4047
A=D+A // 4048
D=M // 4049
@SP // 4050
AM=M+1 // 4051
A=A-1 // 4052
M=D // 4053
@ARG // 4054
A=M+1 // 4055
D=M // 4056
@0 // 4057
A=D+A // 4058
D=M // 4059
@SP // 4060
AM=M-1 // 4061
D=M-D // 4062
@DO_GT // 4063
0;JMP // 4064
(Memory.add_node.GT.35)
D=!D // 4065
@SP // 4066
AM=M-1 // 4067
D=D&M // 4068
@DO_EQ // 4069
0;JMP // 4070
(Memory.add_node.EQ.33)
@WHILE_END_Memory.add_node1 // 4071
D;JNE // 4072

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4073
A=M // 4074
D=M // 4075
@LCL // 4076
A=M+1 // 4077
M=D // 4078

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

@LCL // 4079
A=M // 4080
D=M // 4081
@3 // 4082
A=D+A // 4083
D=M // 4084
@LCL // 4085
A=M // 4086
M=D // 4087

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 4088
0;JMP // 4089

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
@Memory.add_node.EQ.36 // 4090
D=A // 4091
@SP // 4092
AM=M+1 // 4093
A=A-1 // 4094
M=D // 4095
@LCL // 4096
A=M+1 // 4097
D=!M // 4098
@DO_EQ // 4099
0;JMP // 4100
(Memory.add_node.EQ.36)
@Memory.add_node.IfElse2 // 4101
D;JNE // 4102

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
@ARG // 4103
A=M+1 // 4104
D=M // 4105
@3 // 4106
D=D+A // 4107
@SP // 4108
AM=M+1 // 4109
A=A-1 // 4110
M=D // 4111
@ARG // 4112
A=M // 4113
D=M // 4114
@0 // 4115
A=D+A // 4116
D=M // 4117
@SP // 4118
AM=M-1 // 4119
A=M // 4120
M=D // 4121

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
@ARG // 4122
A=M // 4123
D=M // 4124
@0 // 4125
D=D+A // 4126
@2 // 4127
D=D+A // 4128
@SP // 4129
AM=M+1 // 4130
A=A-1 // 4131
M=D // 4132
@ARG // 4133
A=M+1 // 4134
D=M // 4135
@SP // 4136
AM=M-1 // 4137
A=M // 4138
M=D // 4139

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4140
A=M // 4141
D=M // 4142
@SP // 4143
AM=M+1 // 4144
A=A-1 // 4145
M=D // 4146
@ARG // 4147
A=M+1 // 4148
D=M // 4149
@SP // 4150
AM=M-1 // 4151
A=M // 4152
M=D // 4153

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 4154
0;JMP // 4155

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
@ARG // 4156
A=M+1 // 4157
D=M // 4158
@3 // 4159
D=D+A // 4160
@SP // 4161
AM=M+1 // 4162
A=A-1 // 4163
M=D // 4164
@LCL // 4165
A=M // 4166
D=M // 4167
@SP // 4168
AM=M-1 // 4169
A=M // 4170
M=D // 4171

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4172
A=M+1 // 4173
D=M // 4174
@2 // 4175
D=D+A // 4176
@SP // 4177
AM=M+1 // 4178
A=A-1 // 4179
M=D // 4180
@LCL // 4181
A=M+1 // 4182
D=M // 4183
@SP // 4184
AM=M-1 // 4185
A=M // 4186
M=D // 4187

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.37 // 4188
D=A // 4189
@SP // 4190
AM=M+1 // 4191
A=A-1 // 4192
M=D // 4193
@LCL // 4194
A=M // 4195
D=M // 4196
@DO_EQ // 4197
0;JMP // 4198
(Memory.add_node.EQ.37)
@Memory.add_node.IfElse3 // 4199
D;JNE // 4200

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 4201
A=M // 4202
D=M // 4203
@2 // 4204
D=D+A // 4205
@SP // 4206
AM=M+1 // 4207
A=A-1 // 4208
M=D // 4209
@ARG // 4210
A=M+1 // 4211
D=M // 4212
@SP // 4213
AM=M-1 // 4214
A=M // 4215
M=D // 4216

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 4217
0;JMP // 4218

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
@LCL // 4219
A=M+1 // 4220
D=M // 4221
@3 // 4222
D=D+A // 4223
@SP // 4224
AM=M+1 // 4225
A=A-1 // 4226
M=D // 4227
@ARG // 4228
A=M+1 // 4229
D=M // 4230
@SP // 4231
AM=M-1 // 4232
A=M // 4233
M=D // 4234

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=0 // 4238

////ReturnInstruction{}
@RETURN // 4239
0;JMP // 4240

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
@ARG // 4241
A=M // 4242
D=M // 4243
@SP // 4244
AM=M+1 // 4245
A=A-1 // 4246
M=D // 4247
@ARG // 4248
A=M+1 // 4249
D=M // 4250
@SP // 4251
AM=M-1 // 4252
A=M // 4253
M=D // 4254

////PushInstruction("constant 0")
@SP // 4255
AM=M+1 // 4256
A=A-1 // 4257
M=0 // 4258

////ReturnInstruction{}
@RETURN // 4259
0;JMP // 4260

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
@ARG // 4261
A=M // 4262
D=M // 4263
@0 // 4264
A=D+A // 4265
D=M // 4266
@SP // 4267
AM=M+1 // 4268
A=A-1 // 4269
M=D // 4270

////ReturnInstruction{}
@RETURN // 4271
0;JMP // 4272

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 4273
D=A // 4274
@14 // 4275
M=D // 4276
@Output.initMap // 4277
D=A // 4278
@13 // 4279
M=D // 4280
@Output.init.ret.0 // 4281
D=A // 4282
@CALL // 4283
0;JMP // 4284
(Output.init.ret.0)
@SP // 4285
M=M-1 // 4286

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 4287
M=0 // 4288

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 4289
M=0 // 4290

////PushInstruction("constant 0")
@SP // 4291
AM=M+1 // 4292
A=A-1 // 4293
M=0 // 4294

////ReturnInstruction{}
@RETURN // 4295
0;JMP // 4296

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4297
AM=M+1 // 4298
A=A-1 // 4299
M=0 // 4300

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4301
D=A // 4302
@SP // 4303
AM=M+1 // 4304
A=A-1 // 4305
M=D // 4306
// call Array.new
@6 // 4307
D=A // 4308
@14 // 4309
M=D // 4310
@Array.new // 4311
D=A // 4312
@13 // 4313
M=D // 4314
@Output.initMap.ret.0 // 4315
D=A // 4316
@CALL // 4317
0;JMP // 4318
(Output.initMap.ret.0)
@SP // 4319
AM=M-1 // 4320
D=M // 4321
@Output.0 // 4322
M=D // 4323

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4324
AM=M+1 // 4325
A=A-1 // 4326
M=0 // 4327
@63 // 4328
D=A // 4329
@SP // 4330
AM=M+1 // 4331
A=A-1 // 4332
M=D // 4333
@63 // 4334
D=A // 4335
@SP // 4336
AM=M+1 // 4337
A=A-1 // 4338
M=D // 4339
@63 // 4340
D=A // 4341
@SP // 4342
AM=M+1 // 4343
A=A-1 // 4344
M=D // 4345
@63 // 4346
D=A // 4347
@SP // 4348
AM=M+1 // 4349
A=A-1 // 4350
M=D // 4351
@63 // 4352
D=A // 4353
@SP // 4354
AM=M+1 // 4355
A=A-1 // 4356
M=D // 4357
@63 // 4358
D=A // 4359
@SP // 4360
AM=M+1 // 4361
A=A-1 // 4362
M=D // 4363
@63 // 4364
D=A // 4365
@SP // 4366
AM=M+1 // 4367
A=A-1 // 4368
M=D // 4369
@63 // 4370
D=A // 4371
@SP // 4372
AM=M+1 // 4373
A=A-1 // 4374
M=D // 4375
@63 // 4376
D=A // 4377
@SP // 4378
AM=M+1 // 4379
A=A-1 // 4380
M=D // 4381
@SP // 4382
AM=M+1 // 4383
A=A-1 // 4384
M=0 // 4385
@SP // 4386
AM=M+1 // 4387
A=A-1 // 4388
M=0 // 4389
// call Output.create
@17 // 4390
D=A // 4391
@14 // 4392
M=D // 4393
@Output.create // 4394
D=A // 4395
@13 // 4396
M=D // 4397
@Output.initMap.ret.1 // 4398
D=A // 4399
@CALL // 4400
0;JMP // 4401
(Output.initMap.ret.1)
@SP // 4402
M=M-1 // 4403

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@32 // 4404
D=A // 4405
@SP // 4406
AM=M+1 // 4407
A=A-1 // 4408
M=D // 4409
@SP // 4410
AM=M+1 // 4411
A=A-1 // 4412
M=0 // 4413
@SP // 4414
AM=M+1 // 4415
A=A-1 // 4416
M=0 // 4417
@SP // 4418
AM=M+1 // 4419
A=A-1 // 4420
M=0 // 4421
@SP // 4422
AM=M+1 // 4423
A=A-1 // 4424
M=0 // 4425
@SP // 4426
AM=M+1 // 4427
A=A-1 // 4428
M=0 // 4429
@SP // 4430
AM=M+1 // 4431
A=A-1 // 4432
M=0 // 4433
@SP // 4434
AM=M+1 // 4435
A=A-1 // 4436
M=0 // 4437
@SP // 4438
AM=M+1 // 4439
A=A-1 // 4440
M=0 // 4441
@SP // 4442
AM=M+1 // 4443
A=A-1 // 4444
M=0 // 4445
@SP // 4446
AM=M+1 // 4447
A=A-1 // 4448
M=0 // 4449
@SP // 4450
AM=M+1 // 4451
A=A-1 // 4452
M=0 // 4453
// call Output.create
@17 // 4454
D=A // 4455
@14 // 4456
M=D // 4457
@Output.create // 4458
D=A // 4459
@13 // 4460
M=D // 4461
@Output.initMap.ret.2 // 4462
D=A // 4463
@CALL // 4464
0;JMP // 4465
(Output.initMap.ret.2)
@SP // 4466
M=M-1 // 4467

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4468
D=A // 4469
@SP // 4470
AM=M+1 // 4471
A=A-1 // 4472
M=D // 4473
@12 // 4474
D=A // 4475
@SP // 4476
AM=M+1 // 4477
A=A-1 // 4478
M=D // 4479
@30 // 4480
D=A // 4481
@SP // 4482
AM=M+1 // 4483
A=A-1 // 4484
M=D // 4485
@30 // 4486
D=A // 4487
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=D // 4491
@30 // 4492
D=A // 4493
@SP // 4494
AM=M+1 // 4495
A=A-1 // 4496
M=D // 4497
@12 // 4498
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
@SP // 4510
AM=M+1 // 4511
A=A-1 // 4512
M=0 // 4513
@12 // 4514
D=A // 4515
@SP // 4516
AM=M+1 // 4517
A=A-1 // 4518
M=D // 4519
@12 // 4520
D=A // 4521
@SP // 4522
AM=M+1 // 4523
A=A-1 // 4524
M=D // 4525
@SP // 4526
AM=M+1 // 4527
A=A-1 // 4528
M=0 // 4529
@SP // 4530
AM=M+1 // 4531
A=A-1 // 4532
M=0 // 4533
// call Output.create
@17 // 4534
D=A // 4535
@14 // 4536
M=D // 4537
@Output.create // 4538
D=A // 4539
@13 // 4540
M=D // 4541
@Output.initMap.ret.3 // 4542
D=A // 4543
@CALL // 4544
0;JMP // 4545
(Output.initMap.ret.3)
@SP // 4546
M=M-1 // 4547

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4548
D=A // 4549
@SP // 4550
AM=M+1 // 4551
A=A-1 // 4552
M=D // 4553
@54 // 4554
D=A // 4555
@SP // 4556
AM=M+1 // 4557
A=A-1 // 4558
M=D // 4559
@54 // 4560
D=A // 4561
@SP // 4562
AM=M+1 // 4563
A=A-1 // 4564
M=D // 4565
@20 // 4566
D=A // 4567
@SP // 4568
AM=M+1 // 4569
A=A-1 // 4570
M=D // 4571
@SP // 4572
AM=M+1 // 4573
A=A-1 // 4574
M=0 // 4575
@SP // 4576
AM=M+1 // 4577
A=A-1 // 4578
M=0 // 4579
@SP // 4580
AM=M+1 // 4581
A=A-1 // 4582
M=0 // 4583
@SP // 4584
AM=M+1 // 4585
A=A-1 // 4586
M=0 // 4587
@SP // 4588
AM=M+1 // 4589
A=A-1 // 4590
M=0 // 4591
@SP // 4592
AM=M+1 // 4593
A=A-1 // 4594
M=0 // 4595
@SP // 4596
AM=M+1 // 4597
A=A-1 // 4598
M=0 // 4599
@SP // 4600
AM=M+1 // 4601
A=A-1 // 4602
M=0 // 4603
// call Output.create
@17 // 4604
D=A // 4605
@14 // 4606
M=D // 4607
@Output.create // 4608
D=A // 4609
@13 // 4610
M=D // 4611
@Output.initMap.ret.4 // 4612
D=A // 4613
@CALL // 4614
0;JMP // 4615
(Output.initMap.ret.4)
@SP // 4616
M=M-1 // 4617

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@35 // 4618
D=A // 4619
@SP // 4620
AM=M+1 // 4621
A=A-1 // 4622
M=D // 4623
@SP // 4624
AM=M+1 // 4625
A=A-1 // 4626
M=0 // 4627
@18 // 4628
D=A // 4629
@SP // 4630
AM=M+1 // 4631
A=A-1 // 4632
M=D // 4633
@18 // 4634
D=A // 4635
@SP // 4636
AM=M+1 // 4637
A=A-1 // 4638
M=D // 4639
@63 // 4640
D=A // 4641
@SP // 4642
AM=M+1 // 4643
A=A-1 // 4644
M=D // 4645
@18 // 4646
D=A // 4647
@SP // 4648
AM=M+1 // 4649
A=A-1 // 4650
M=D // 4651
@18 // 4652
D=A // 4653
@SP // 4654
AM=M+1 // 4655
A=A-1 // 4656
M=D // 4657
@63 // 4658
D=A // 4659
@SP // 4660
AM=M+1 // 4661
A=A-1 // 4662
M=D // 4663
@18 // 4664
D=A // 4665
@SP // 4666
AM=M+1 // 4667
A=A-1 // 4668
M=D // 4669
@18 // 4670
D=A // 4671
@SP // 4672
AM=M+1 // 4673
A=A-1 // 4674
M=D // 4675
@SP // 4676
AM=M+1 // 4677
A=A-1 // 4678
M=0 // 4679
@SP // 4680
AM=M+1 // 4681
A=A-1 // 4682
M=0 // 4683
// call Output.create
@17 // 4684
D=A // 4685
@14 // 4686
M=D // 4687
@Output.create // 4688
D=A // 4689
@13 // 4690
M=D // 4691
@Output.initMap.ret.5 // 4692
D=A // 4693
@CALL // 4694
0;JMP // 4695
(Output.initMap.ret.5)
@SP // 4696
M=M-1 // 4697

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4698
D=A // 4699
@SP // 4700
AM=M+1 // 4701
A=A-1 // 4702
M=D // 4703
@12 // 4704
D=A // 4705
@SP // 4706
AM=M+1 // 4707
A=A-1 // 4708
M=D // 4709
@30 // 4710
D=A // 4711
@SP // 4712
AM=M+1 // 4713
A=A-1 // 4714
M=D // 4715
@51 // 4716
D=A // 4717
@SP // 4718
AM=M+1 // 4719
A=A-1 // 4720
M=D // 4721
@3 // 4722
D=A // 4723
@SP // 4724
AM=M+1 // 4725
A=A-1 // 4726
M=D // 4727
@30 // 4728
D=A // 4729
@SP // 4730
AM=M+1 // 4731
A=A-1 // 4732
M=D // 4733
@48 // 4734
D=A // 4735
@SP // 4736
AM=M+1 // 4737
A=A-1 // 4738
M=D // 4739
@51 // 4740
D=A // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=D // 4745
@30 // 4746
D=A // 4747
@SP // 4748
AM=M+1 // 4749
A=A-1 // 4750
M=D // 4751
@12 // 4752
D=A // 4753
@SP // 4754
AM=M+1 // 4755
A=A-1 // 4756
M=D // 4757
@12 // 4758
D=A // 4759
@SP // 4760
AM=M+1 // 4761
A=A-1 // 4762
M=D // 4763
@SP // 4764
AM=M+1 // 4765
A=A-1 // 4766
M=0 // 4767
// call Output.create
@17 // 4768
D=A // 4769
@14 // 4770
M=D // 4771
@Output.create // 4772
D=A // 4773
@13 // 4774
M=D // 4775
@Output.initMap.ret.6 // 4776
D=A // 4777
@CALL // 4778
0;JMP // 4779
(Output.initMap.ret.6)
@SP // 4780
M=M-1 // 4781

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@37 // 4782
D=A // 4783
@SP // 4784
AM=M+1 // 4785
A=A-1 // 4786
M=D // 4787
@SP // 4788
AM=M+1 // 4789
A=A-1 // 4790
M=0 // 4791
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=0 // 4795
@35 // 4796
D=A // 4797
@SP // 4798
AM=M+1 // 4799
A=A-1 // 4800
M=D // 4801
@51 // 4802
D=A // 4803
@SP // 4804
AM=M+1 // 4805
A=A-1 // 4806
M=D // 4807
@24 // 4808
D=A // 4809
@SP // 4810
AM=M+1 // 4811
A=A-1 // 4812
M=D // 4813
@12 // 4814
D=A // 4815
@SP // 4816
AM=M+1 // 4817
A=A-1 // 4818
M=D // 4819
@6 // 4820
D=A // 4821
@SP // 4822
AM=M+1 // 4823
A=A-1 // 4824
M=D // 4825
@51 // 4826
D=A // 4827
@SP // 4828
AM=M+1 // 4829
A=A-1 // 4830
M=D // 4831
@49 // 4832
D=A // 4833
@SP // 4834
AM=M+1 // 4835
A=A-1 // 4836
M=D // 4837
@SP // 4838
AM=M+1 // 4839
A=A-1 // 4840
M=0 // 4841
@SP // 4842
AM=M+1 // 4843
A=A-1 // 4844
M=0 // 4845
// call Output.create
@17 // 4846
D=A // 4847
@14 // 4848
M=D // 4849
@Output.create // 4850
D=A // 4851
@13 // 4852
M=D // 4853
@Output.initMap.ret.7 // 4854
D=A // 4855
@CALL // 4856
0;JMP // 4857
(Output.initMap.ret.7)
@SP // 4858
M=M-1 // 4859

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4860
D=A // 4861
@SP // 4862
AM=M+1 // 4863
A=A-1 // 4864
M=D // 4865
@12 // 4866
D=A // 4867
@SP // 4868
AM=M+1 // 4869
A=A-1 // 4870
M=D // 4871
@30 // 4872
D=A // 4873
@SP // 4874
AM=M+1 // 4875
A=A-1 // 4876
M=D // 4877
@30 // 4878
D=A // 4879
@SP // 4880
AM=M+1 // 4881
A=A-1 // 4882
M=D // 4883
@12 // 4884
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
@27 // 4896
D=A // 4897
@SP // 4898
AM=M+1 // 4899
A=A-1 // 4900
M=D // 4901
@27 // 4902
D=A // 4903
@SP // 4904
AM=M+1 // 4905
A=A-1 // 4906
M=D // 4907
@27 // 4908
D=A // 4909
@SP // 4910
AM=M+1 // 4911
A=A-1 // 4912
M=D // 4913
@54 // 4914
D=A // 4915
@SP // 4916
AM=M+1 // 4917
A=A-1 // 4918
M=D // 4919
@SP // 4920
AM=M+1 // 4921
A=A-1 // 4922
M=0 // 4923
@SP // 4924
AM=M+1 // 4925
A=A-1 // 4926
M=0 // 4927
// call Output.create
@17 // 4928
D=A // 4929
@14 // 4930
M=D // 4931
@Output.create // 4932
D=A // 4933
@13 // 4934
M=D // 4935
@Output.initMap.ret.8 // 4936
D=A // 4937
@CALL // 4938
0;JMP // 4939
(Output.initMap.ret.8)
@SP // 4940
M=M-1 // 4941

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4942
D=A // 4943
@SP // 4944
AM=M+1 // 4945
A=A-1 // 4946
M=D // 4947
@12 // 4948
D=A // 4949
@SP // 4950
AM=M+1 // 4951
A=A-1 // 4952
M=D // 4953
@12 // 4954
D=A // 4955
@SP // 4956
AM=M+1 // 4957
A=A-1 // 4958
M=D // 4959
@6 // 4960
D=A // 4961
@SP // 4962
AM=M+1 // 4963
A=A-1 // 4964
M=D // 4965
@SP // 4966
AM=M+1 // 4967
A=A-1 // 4968
M=0 // 4969
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=0 // 4973
@SP // 4974
AM=M+1 // 4975
A=A-1 // 4976
M=0 // 4977
@SP // 4978
AM=M+1 // 4979
A=A-1 // 4980
M=0 // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=0 // 4985
@SP // 4986
AM=M+1 // 4987
A=A-1 // 4988
M=0 // 4989
@SP // 4990
AM=M+1 // 4991
A=A-1 // 4992
M=0 // 4993
@SP // 4994
AM=M+1 // 4995
A=A-1 // 4996
M=0 // 4997
// call Output.create
@17 // 4998
D=A // 4999
@14 // 5000
M=D // 5001
@Output.create // 5002
D=A // 5003
@13 // 5004
M=D // 5005
@Output.initMap.ret.9 // 5006
D=A // 5007
@CALL // 5008
0;JMP // 5009
(Output.initMap.ret.9)
@SP // 5010
M=M-1 // 5011

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5012
D=A // 5013
@SP // 5014
AM=M+1 // 5015
A=A-1 // 5016
M=D // 5017
@24 // 5018
D=A // 5019
@SP // 5020
AM=M+1 // 5021
A=A-1 // 5022
M=D // 5023
@12 // 5024
D=A // 5025
@SP // 5026
AM=M+1 // 5027
A=A-1 // 5028
M=D // 5029
@6 // 5030
D=A // 5031
@SP // 5032
AM=M+1 // 5033
A=A-1 // 5034
M=D // 5035
@6 // 5036
D=A // 5037
@SP // 5038
AM=M+1 // 5039
A=A-1 // 5040
M=D // 5041
@6 // 5042
D=A // 5043
@SP // 5044
AM=M+1 // 5045
A=A-1 // 5046
M=D // 5047
@6 // 5048
D=A // 5049
@SP // 5050
AM=M+1 // 5051
A=A-1 // 5052
M=D // 5053
@6 // 5054
D=A // 5055
@SP // 5056
AM=M+1 // 5057
A=A-1 // 5058
M=D // 5059
@12 // 5060
D=A // 5061
@SP // 5062
AM=M+1 // 5063
A=A-1 // 5064
M=D // 5065
@24 // 5066
D=A // 5067
@SP // 5068
AM=M+1 // 5069
A=A-1 // 5070
M=D // 5071
@SP // 5072
AM=M+1 // 5073
A=A-1 // 5074
M=0 // 5075
@SP // 5076
AM=M+1 // 5077
A=A-1 // 5078
M=0 // 5079
// call Output.create
@17 // 5080
D=A // 5081
@14 // 5082
M=D // 5083
@Output.create // 5084
D=A // 5085
@13 // 5086
M=D // 5087
@Output.initMap.ret.10 // 5088
D=A // 5089
@CALL // 5090
0;JMP // 5091
(Output.initMap.ret.10)
@SP // 5092
M=M-1 // 5093

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 5094
D=A // 5095
@SP // 5096
AM=M+1 // 5097
A=A-1 // 5098
M=D // 5099
@6 // 5100
D=A // 5101
@SP // 5102
AM=M+1 // 5103
A=A-1 // 5104
M=D // 5105
@12 // 5106
D=A // 5107
@SP // 5108
AM=M+1 // 5109
A=A-1 // 5110
M=D // 5111
@24 // 5112
D=A // 5113
@SP // 5114
AM=M+1 // 5115
A=A-1 // 5116
M=D // 5117
@24 // 5118
D=A // 5119
@SP // 5120
AM=M+1 // 5121
A=A-1 // 5122
M=D // 5123
@24 // 5124
D=A // 5125
@SP // 5126
AM=M+1 // 5127
A=A-1 // 5128
M=D // 5129
@24 // 5130
D=A // 5131
@SP // 5132
AM=M+1 // 5133
A=A-1 // 5134
M=D // 5135
@24 // 5136
D=A // 5137
@SP // 5138
AM=M+1 // 5139
A=A-1 // 5140
M=D // 5141
@12 // 5142
D=A // 5143
@SP // 5144
AM=M+1 // 5145
A=A-1 // 5146
M=D // 5147
@6 // 5148
D=A // 5149
@SP // 5150
AM=M+1 // 5151
A=A-1 // 5152
M=D // 5153
@SP // 5154
AM=M+1 // 5155
A=A-1 // 5156
M=0 // 5157
@SP // 5158
AM=M+1 // 5159
A=A-1 // 5160
M=0 // 5161
// call Output.create
@17 // 5162
D=A // 5163
@14 // 5164
M=D // 5165
@Output.create // 5166
D=A // 5167
@13 // 5168
M=D // 5169
@Output.initMap.ret.11 // 5170
D=A // 5171
@CALL // 5172
0;JMP // 5173
(Output.initMap.ret.11)
@SP // 5174
M=M-1 // 5175

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@42 // 5176
D=A // 5177
@SP // 5178
AM=M+1 // 5179
A=A-1 // 5180
M=D // 5181
@SP // 5182
AM=M+1 // 5183
A=A-1 // 5184
M=0 // 5185
@SP // 5186
AM=M+1 // 5187
A=A-1 // 5188
M=0 // 5189
@SP // 5190
AM=M+1 // 5191
A=A-1 // 5192
M=0 // 5193
@51 // 5194
D=A // 5195
@SP // 5196
AM=M+1 // 5197
A=A-1 // 5198
M=D // 5199
@30 // 5200
D=A // 5201
@SP // 5202
AM=M+1 // 5203
A=A-1 // 5204
M=D // 5205
@63 // 5206
D=A // 5207
@SP // 5208
AM=M+1 // 5209
A=A-1 // 5210
M=D // 5211
@30 // 5212
D=A // 5213
@SP // 5214
AM=M+1 // 5215
A=A-1 // 5216
M=D // 5217
@51 // 5218
D=A // 5219
@SP // 5220
AM=M+1 // 5221
A=A-1 // 5222
M=D // 5223
@SP // 5224
AM=M+1 // 5225
A=A-1 // 5226
M=0 // 5227
@SP // 5228
AM=M+1 // 5229
A=A-1 // 5230
M=0 // 5231
@SP // 5232
AM=M+1 // 5233
A=A-1 // 5234
M=0 // 5235
// call Output.create
@17 // 5236
D=A // 5237
@14 // 5238
M=D // 5239
@Output.create // 5240
D=A // 5241
@13 // 5242
M=D // 5243
@Output.initMap.ret.12 // 5244
D=A // 5245
@CALL // 5246
0;JMP // 5247
(Output.initMap.ret.12)
@SP // 5248
M=M-1 // 5249

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@43 // 5250
D=A // 5251
@SP // 5252
AM=M+1 // 5253
A=A-1 // 5254
M=D // 5255
@SP // 5256
AM=M+1 // 5257
A=A-1 // 5258
M=0 // 5259
@SP // 5260
AM=M+1 // 5261
A=A-1 // 5262
M=0 // 5263
@SP // 5264
AM=M+1 // 5265
A=A-1 // 5266
M=0 // 5267
@12 // 5268
D=A // 5269
@SP // 5270
AM=M+1 // 5271
A=A-1 // 5272
M=D // 5273
@12 // 5274
D=A // 5275
@SP // 5276
AM=M+1 // 5277
A=A-1 // 5278
M=D // 5279
@63 // 5280
D=A // 5281
@SP // 5282
AM=M+1 // 5283
A=A-1 // 5284
M=D // 5285
@12 // 5286
D=A // 5287
@SP // 5288
AM=M+1 // 5289
A=A-1 // 5290
M=D // 5291
@12 // 5292
D=A // 5293
@SP // 5294
AM=M+1 // 5295
A=A-1 // 5296
M=D // 5297
@SP // 5298
AM=M+1 // 5299
A=A-1 // 5300
M=0 // 5301
@SP // 5302
AM=M+1 // 5303
A=A-1 // 5304
M=0 // 5305
@SP // 5306
AM=M+1 // 5307
A=A-1 // 5308
M=0 // 5309
// call Output.create
@17 // 5310
D=A // 5311
@14 // 5312
M=D // 5313
@Output.create // 5314
D=A // 5315
@13 // 5316
M=D // 5317
@Output.initMap.ret.13 // 5318
D=A // 5319
@CALL // 5320
0;JMP // 5321
(Output.initMap.ret.13)
@SP // 5322
M=M-1 // 5323

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@44 // 5324
D=A // 5325
@SP // 5326
AM=M+1 // 5327
A=A-1 // 5328
M=D // 5329
@SP // 5330
AM=M+1 // 5331
A=A-1 // 5332
M=0 // 5333
@SP // 5334
AM=M+1 // 5335
A=A-1 // 5336
M=0 // 5337
@SP // 5338
AM=M+1 // 5339
A=A-1 // 5340
M=0 // 5341
@SP // 5342
AM=M+1 // 5343
A=A-1 // 5344
M=0 // 5345
@SP // 5346
AM=M+1 // 5347
A=A-1 // 5348
M=0 // 5349
@SP // 5350
AM=M+1 // 5351
A=A-1 // 5352
M=0 // 5353
@SP // 5354
AM=M+1 // 5355
A=A-1 // 5356
M=0 // 5357
@12 // 5358
D=A // 5359
@SP // 5360
AM=M+1 // 5361
A=A-1 // 5362
M=D // 5363
@12 // 5364
D=A // 5365
@SP // 5366
AM=M+1 // 5367
A=A-1 // 5368
M=D // 5369
@6 // 5370
D=A // 5371
@SP // 5372
AM=M+1 // 5373
A=A-1 // 5374
M=D // 5375
@SP // 5376
AM=M+1 // 5377
A=A-1 // 5378
M=0 // 5379
// call Output.create
@17 // 5380
D=A // 5381
@14 // 5382
M=D // 5383
@Output.create // 5384
D=A // 5385
@13 // 5386
M=D // 5387
@Output.initMap.ret.14 // 5388
D=A // 5389
@CALL // 5390
0;JMP // 5391
(Output.initMap.ret.14)
@SP // 5392
M=M-1 // 5393

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@45 // 5394
D=A // 5395
@SP // 5396
AM=M+1 // 5397
A=A-1 // 5398
M=D // 5399
@SP // 5400
AM=M+1 // 5401
A=A-1 // 5402
M=0 // 5403
@SP // 5404
AM=M+1 // 5405
A=A-1 // 5406
M=0 // 5407
@SP // 5408
AM=M+1 // 5409
A=A-1 // 5410
M=0 // 5411
@SP // 5412
AM=M+1 // 5413
A=A-1 // 5414
M=0 // 5415
@SP // 5416
AM=M+1 // 5417
A=A-1 // 5418
M=0 // 5419
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
@SP // 5434
AM=M+1 // 5435
A=A-1 // 5436
M=0 // 5437
@SP // 5438
AM=M+1 // 5439
A=A-1 // 5440
M=0 // 5441
@SP // 5442
AM=M+1 // 5443
A=A-1 // 5444
M=0 // 5445
// call Output.create
@17 // 5446
D=A // 5447
@14 // 5448
M=D // 5449
@Output.create // 5450
D=A // 5451
@13 // 5452
M=D // 5453
@Output.initMap.ret.15 // 5454
D=A // 5455
@CALL // 5456
0;JMP // 5457
(Output.initMap.ret.15)
@SP // 5458
M=M-1 // 5459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@46 // 5460
D=A // 5461
@SP // 5462
AM=M+1 // 5463
A=A-1 // 5464
M=D // 5465
@SP // 5466
AM=M+1 // 5467
A=A-1 // 5468
M=0 // 5469
@SP // 5470
AM=M+1 // 5471
A=A-1 // 5472
M=0 // 5473
@SP // 5474
AM=M+1 // 5475
A=A-1 // 5476
M=0 // 5477
@SP // 5478
AM=M+1 // 5479
A=A-1 // 5480
M=0 // 5481
@SP // 5482
AM=M+1 // 5483
A=A-1 // 5484
M=0 // 5485
@SP // 5486
AM=M+1 // 5487
A=A-1 // 5488
M=0 // 5489
@SP // 5490
AM=M+1 // 5491
A=A-1 // 5492
M=0 // 5493
@12 // 5494
D=A // 5495
@SP // 5496
AM=M+1 // 5497
A=A-1 // 5498
M=D // 5499
@12 // 5500
D=A // 5501
@SP // 5502
AM=M+1 // 5503
A=A-1 // 5504
M=D // 5505
@SP // 5506
AM=M+1 // 5507
A=A-1 // 5508
M=0 // 5509
@SP // 5510
AM=M+1 // 5511
A=A-1 // 5512
M=0 // 5513
// call Output.create
@17 // 5514
D=A // 5515
@14 // 5516
M=D // 5517
@Output.create // 5518
D=A // 5519
@13 // 5520
M=D // 5521
@Output.initMap.ret.16 // 5522
D=A // 5523
@CALL // 5524
0;JMP // 5525
(Output.initMap.ret.16)
@SP // 5526
M=M-1 // 5527

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@47 // 5528
D=A // 5529
@SP // 5530
AM=M+1 // 5531
A=A-1 // 5532
M=D // 5533
@SP // 5534
AM=M+1 // 5535
A=A-1 // 5536
M=0 // 5537
@SP // 5538
AM=M+1 // 5539
A=A-1 // 5540
M=0 // 5541
@32 // 5542
D=A // 5543
@SP // 5544
AM=M+1 // 5545
A=A-1 // 5546
M=D // 5547
@48 // 5548
D=A // 5549
@SP // 5550
AM=M+1 // 5551
A=A-1 // 5552
M=D // 5553
@24 // 5554
D=A // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=D // 5559
@12 // 5560
D=A // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=D // 5565
@6 // 5566
D=A // 5567
@SP // 5568
AM=M+1 // 5569
A=A-1 // 5570
M=D // 5571
@3 // 5572
D=A // 5573
@SP // 5574
AM=M+1 // 5575
A=A-1 // 5576
M=D // 5577
@SP // 5578
AM=M+1 // 5579
A=A-1 // 5580
M=1 // 5581
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
@Output.initMap.ret.17 // 5598
D=A // 5599
@CALL // 5600
0;JMP // 5601
(Output.initMap.ret.17)
@SP // 5602
M=M-1 // 5603

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5604
D=A // 5605
@SP // 5606
AM=M+1 // 5607
A=A-1 // 5608
M=D // 5609
@12 // 5610
D=A // 5611
@SP // 5612
AM=M+1 // 5613
A=A-1 // 5614
M=D // 5615
@30 // 5616
D=A // 5617
@SP // 5618
AM=M+1 // 5619
A=A-1 // 5620
M=D // 5621
@51 // 5622
D=A // 5623
@SP // 5624
AM=M+1 // 5625
A=A-1 // 5626
M=D // 5627
@51 // 5628
D=A // 5629
@SP // 5630
AM=M+1 // 5631
A=A-1 // 5632
M=D // 5633
@51 // 5634
D=A // 5635
@SP // 5636
AM=M+1 // 5637
A=A-1 // 5638
M=D // 5639
@51 // 5640
D=A // 5641
@SP // 5642
AM=M+1 // 5643
A=A-1 // 5644
M=D // 5645
@51 // 5646
D=A // 5647
@SP // 5648
AM=M+1 // 5649
A=A-1 // 5650
M=D // 5651
@30 // 5652
D=A // 5653
@SP // 5654
AM=M+1 // 5655
A=A-1 // 5656
M=D // 5657
@12 // 5658
D=A // 5659
@SP // 5660
AM=M+1 // 5661
A=A-1 // 5662
M=D // 5663
@SP // 5664
AM=M+1 // 5665
A=A-1 // 5666
M=0 // 5667
@SP // 5668
AM=M+1 // 5669
A=A-1 // 5670
M=0 // 5671
// call Output.create
@17 // 5672
D=A // 5673
@14 // 5674
M=D // 5675
@Output.create // 5676
D=A // 5677
@13 // 5678
M=D // 5679
@Output.initMap.ret.18 // 5680
D=A // 5681
@CALL // 5682
0;JMP // 5683
(Output.initMap.ret.18)
@SP // 5684
M=M-1 // 5685

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5686
D=A // 5687
@SP // 5688
AM=M+1 // 5689
A=A-1 // 5690
M=D // 5691
@12 // 5692
D=A // 5693
@SP // 5694
AM=M+1 // 5695
A=A-1 // 5696
M=D // 5697
@14 // 5698
D=A // 5699
@SP // 5700
AM=M+1 // 5701
A=A-1 // 5702
M=D // 5703
@15 // 5704
D=A // 5705
@SP // 5706
AM=M+1 // 5707
A=A-1 // 5708
M=D // 5709
@12 // 5710
D=A // 5711
@SP // 5712
AM=M+1 // 5713
A=A-1 // 5714
M=D // 5715
@12 // 5716
D=A // 5717
@SP // 5718
AM=M+1 // 5719
A=A-1 // 5720
M=D // 5721
@12 // 5722
D=A // 5723
@SP // 5724
AM=M+1 // 5725
A=A-1 // 5726
M=D // 5727
@12 // 5728
D=A // 5729
@SP // 5730
AM=M+1 // 5731
A=A-1 // 5732
M=D // 5733
@12 // 5734
D=A // 5735
@SP // 5736
AM=M+1 // 5737
A=A-1 // 5738
M=D // 5739
@63 // 5740
D=A // 5741
@SP // 5742
AM=M+1 // 5743
A=A-1 // 5744
M=D // 5745
@SP // 5746
AM=M+1 // 5747
A=A-1 // 5748
M=0 // 5749
@SP // 5750
AM=M+1 // 5751
A=A-1 // 5752
M=0 // 5753
// call Output.create
@17 // 5754
D=A // 5755
@14 // 5756
M=D // 5757
@Output.create // 5758
D=A // 5759
@13 // 5760
M=D // 5761
@Output.initMap.ret.19 // 5762
D=A // 5763
@CALL // 5764
0;JMP // 5765
(Output.initMap.ret.19)
@SP // 5766
M=M-1 // 5767

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5768
D=A // 5769
@SP // 5770
AM=M+1 // 5771
A=A-1 // 5772
M=D // 5773
@30 // 5774
D=A // 5775
@SP // 5776
AM=M+1 // 5777
A=A-1 // 5778
M=D // 5779
@51 // 5780
D=A // 5781
@SP // 5782
AM=M+1 // 5783
A=A-1 // 5784
M=D // 5785
@48 // 5786
D=A // 5787
@SP // 5788
AM=M+1 // 5789
A=A-1 // 5790
M=D // 5791
@24 // 5792
D=A // 5793
@SP // 5794
AM=M+1 // 5795
A=A-1 // 5796
M=D // 5797
@12 // 5798
D=A // 5799
@SP // 5800
AM=M+1 // 5801
A=A-1 // 5802
M=D // 5803
@6 // 5804
D=A // 5805
@SP // 5806
AM=M+1 // 5807
A=A-1 // 5808
M=D // 5809
@3 // 5810
D=A // 5811
@SP // 5812
AM=M+1 // 5813
A=A-1 // 5814
M=D // 5815
@51 // 5816
D=A // 5817
@SP // 5818
AM=M+1 // 5819
A=A-1 // 5820
M=D // 5821
@63 // 5822
D=A // 5823
@SP // 5824
AM=M+1 // 5825
A=A-1 // 5826
M=D // 5827
@SP // 5828
AM=M+1 // 5829
A=A-1 // 5830
M=0 // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=0 // 5835
// call Output.create
@17 // 5836
D=A // 5837
@14 // 5838
M=D // 5839
@Output.create // 5840
D=A // 5841
@13 // 5842
M=D // 5843
@Output.initMap.ret.20 // 5844
D=A // 5845
@CALL // 5846
0;JMP // 5847
(Output.initMap.ret.20)
@SP // 5848
M=M-1 // 5849

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5850
D=A // 5851
@SP // 5852
AM=M+1 // 5853
A=A-1 // 5854
M=D // 5855
@30 // 5856
D=A // 5857
@SP // 5858
AM=M+1 // 5859
A=A-1 // 5860
M=D // 5861
@51 // 5862
D=A // 5863
@SP // 5864
AM=M+1 // 5865
A=A-1 // 5866
M=D // 5867
@48 // 5868
D=A // 5869
@SP // 5870
AM=M+1 // 5871
A=A-1 // 5872
M=D // 5873
@48 // 5874
D=A // 5875
@SP // 5876
AM=M+1 // 5877
A=A-1 // 5878
M=D // 5879
@28 // 5880
D=A // 5881
@SP // 5882
AM=M+1 // 5883
A=A-1 // 5884
M=D // 5885
@48 // 5886
D=A // 5887
@SP // 5888
AM=M+1 // 5889
A=A-1 // 5890
M=D // 5891
@48 // 5892
D=A // 5893
@SP // 5894
AM=M+1 // 5895
A=A-1 // 5896
M=D // 5897
@51 // 5898
D=A // 5899
@SP // 5900
AM=M+1 // 5901
A=A-1 // 5902
M=D // 5903
@30 // 5904
D=A // 5905
@SP // 5906
AM=M+1 // 5907
A=A-1 // 5908
M=D // 5909
@SP // 5910
AM=M+1 // 5911
A=A-1 // 5912
M=0 // 5913
@SP // 5914
AM=M+1 // 5915
A=A-1 // 5916
M=0 // 5917
// call Output.create
@17 // 5918
D=A // 5919
@14 // 5920
M=D // 5921
@Output.create // 5922
D=A // 5923
@13 // 5924
M=D // 5925
@Output.initMap.ret.21 // 5926
D=A // 5927
@CALL // 5928
0;JMP // 5929
(Output.initMap.ret.21)
@SP // 5930
M=M-1 // 5931

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5932
D=A // 5933
@SP // 5934
AM=M+1 // 5935
A=A-1 // 5936
M=D // 5937
@16 // 5938
D=A // 5939
@SP // 5940
AM=M+1 // 5941
A=A-1 // 5942
M=D // 5943
@24 // 5944
D=A // 5945
@SP // 5946
AM=M+1 // 5947
A=A-1 // 5948
M=D // 5949
@28 // 5950
D=A // 5951
@SP // 5952
AM=M+1 // 5953
A=A-1 // 5954
M=D // 5955
@26 // 5956
D=A // 5957
@SP // 5958
AM=M+1 // 5959
A=A-1 // 5960
M=D // 5961
@25 // 5962
D=A // 5963
@SP // 5964
AM=M+1 // 5965
A=A-1 // 5966
M=D // 5967
@63 // 5968
D=A // 5969
@SP // 5970
AM=M+1 // 5971
A=A-1 // 5972
M=D // 5973
@24 // 5974
D=A // 5975
@SP // 5976
AM=M+1 // 5977
A=A-1 // 5978
M=D // 5979
@24 // 5980
D=A // 5981
@SP // 5982
AM=M+1 // 5983
A=A-1 // 5984
M=D // 5985
@60 // 5986
D=A // 5987
@SP // 5988
AM=M+1 // 5989
A=A-1 // 5990
M=D // 5991
@SP // 5992
AM=M+1 // 5993
A=A-1 // 5994
M=0 // 5995
@SP // 5996
AM=M+1 // 5997
A=A-1 // 5998
M=0 // 5999
// call Output.create
@17 // 6000
D=A // 6001
@14 // 6002
M=D // 6003
@Output.create // 6004
D=A // 6005
@13 // 6006
M=D // 6007
@Output.initMap.ret.22 // 6008
D=A // 6009
@CALL // 6010
0;JMP // 6011
(Output.initMap.ret.22)
@SP // 6012
M=M-1 // 6013

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 6014
D=A // 6015
@SP // 6016
AM=M+1 // 6017
A=A-1 // 6018
M=D // 6019
@63 // 6020
D=A // 6021
@SP // 6022
AM=M+1 // 6023
A=A-1 // 6024
M=D // 6025
@3 // 6026
D=A // 6027
@SP // 6028
AM=M+1 // 6029
A=A-1 // 6030
M=D // 6031
@3 // 6032
D=A // 6033
@SP // 6034
AM=M+1 // 6035
A=A-1 // 6036
M=D // 6037
@31 // 6038
D=A // 6039
@SP // 6040
AM=M+1 // 6041
A=A-1 // 6042
M=D // 6043
@48 // 6044
D=A // 6045
@SP // 6046
AM=M+1 // 6047
A=A-1 // 6048
M=D // 6049
@48 // 6050
D=A // 6051
@SP // 6052
AM=M+1 // 6053
A=A-1 // 6054
M=D // 6055
@48 // 6056
D=A // 6057
@SP // 6058
AM=M+1 // 6059
A=A-1 // 6060
M=D // 6061
@51 // 6062
D=A // 6063
@SP // 6064
AM=M+1 // 6065
A=A-1 // 6066
M=D // 6067
@30 // 6068
D=A // 6069
@SP // 6070
AM=M+1 // 6071
A=A-1 // 6072
M=D // 6073
@SP // 6074
AM=M+1 // 6075
A=A-1 // 6076
M=0 // 6077
@SP // 6078
AM=M+1 // 6079
A=A-1 // 6080
M=0 // 6081
// call Output.create
@17 // 6082
D=A // 6083
@14 // 6084
M=D // 6085
@Output.create // 6086
D=A // 6087
@13 // 6088
M=D // 6089
@Output.initMap.ret.23 // 6090
D=A // 6091
@CALL // 6092
0;JMP // 6093
(Output.initMap.ret.23)
@SP // 6094
M=M-1 // 6095

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 6096
D=A // 6097
@SP // 6098
AM=M+1 // 6099
A=A-1 // 6100
M=D // 6101
@28 // 6102
D=A // 6103
@SP // 6104
AM=M+1 // 6105
A=A-1 // 6106
M=D // 6107
@6 // 6108
D=A // 6109
@SP // 6110
AM=M+1 // 6111
A=A-1 // 6112
M=D // 6113
@3 // 6114
D=A // 6115
@SP // 6116
AM=M+1 // 6117
A=A-1 // 6118
M=D // 6119
@3 // 6120
D=A // 6121
@SP // 6122
AM=M+1 // 6123
A=A-1 // 6124
M=D // 6125
@31 // 6126
D=A // 6127
@SP // 6128
AM=M+1 // 6129
A=A-1 // 6130
M=D // 6131
@51 // 6132
D=A // 6133
@SP // 6134
AM=M+1 // 6135
A=A-1 // 6136
M=D // 6137
@51 // 6138
D=A // 6139
@SP // 6140
AM=M+1 // 6141
A=A-1 // 6142
M=D // 6143
@51 // 6144
D=A // 6145
@SP // 6146
AM=M+1 // 6147
A=A-1 // 6148
M=D // 6149
@30 // 6150
D=A // 6151
@SP // 6152
AM=M+1 // 6153
A=A-1 // 6154
M=D // 6155
@SP // 6156
AM=M+1 // 6157
A=A-1 // 6158
M=0 // 6159
@SP // 6160
AM=M+1 // 6161
A=A-1 // 6162
M=0 // 6163
// call Output.create
@17 // 6164
D=A // 6165
@14 // 6166
M=D // 6167
@Output.create // 6168
D=A // 6169
@13 // 6170
M=D // 6171
@Output.initMap.ret.24 // 6172
D=A // 6173
@CALL // 6174
0;JMP // 6175
(Output.initMap.ret.24)
@SP // 6176
M=M-1 // 6177

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 6178
D=A // 6179
@SP // 6180
AM=M+1 // 6181
A=A-1 // 6182
M=D // 6183
@63 // 6184
D=A // 6185
@SP // 6186
AM=M+1 // 6187
A=A-1 // 6188
M=D // 6189
@49 // 6190
D=A // 6191
@SP // 6192
AM=M+1 // 6193
A=A-1 // 6194
M=D // 6195
@48 // 6196
D=A // 6197
@SP // 6198
AM=M+1 // 6199
A=A-1 // 6200
M=D // 6201
@48 // 6202
D=A // 6203
@SP // 6204
AM=M+1 // 6205
A=A-1 // 6206
M=D // 6207
@24 // 6208
D=A // 6209
@SP // 6210
AM=M+1 // 6211
A=A-1 // 6212
M=D // 6213
@12 // 6214
D=A // 6215
@SP // 6216
AM=M+1 // 6217
A=A-1 // 6218
M=D // 6219
@12 // 6220
D=A // 6221
@SP // 6222
AM=M+1 // 6223
A=A-1 // 6224
M=D // 6225
@12 // 6226
D=A // 6227
@SP // 6228
AM=M+1 // 6229
A=A-1 // 6230
M=D // 6231
@12 // 6232
D=A // 6233
@SP // 6234
AM=M+1 // 6235
A=A-1 // 6236
M=D // 6237
@SP // 6238
AM=M+1 // 6239
A=A-1 // 6240
M=0 // 6241
@SP // 6242
AM=M+1 // 6243
A=A-1 // 6244
M=0 // 6245
// call Output.create
@17 // 6246
D=A // 6247
@14 // 6248
M=D // 6249
@Output.create // 6250
D=A // 6251
@13 // 6252
M=D // 6253
@Output.initMap.ret.25 // 6254
D=A // 6255
@CALL // 6256
0;JMP // 6257
(Output.initMap.ret.25)
@SP // 6258
M=M-1 // 6259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 6260
D=A // 6261
@SP // 6262
AM=M+1 // 6263
A=A-1 // 6264
M=D // 6265
@30 // 6266
D=A // 6267
@SP // 6268
AM=M+1 // 6269
A=A-1 // 6270
M=D // 6271
@51 // 6272
D=A // 6273
@SP // 6274
AM=M+1 // 6275
A=A-1 // 6276
M=D // 6277
@51 // 6278
D=A // 6279
@SP // 6280
AM=M+1 // 6281
A=A-1 // 6282
M=D // 6283
@51 // 6284
D=A // 6285
@SP // 6286
AM=M+1 // 6287
A=A-1 // 6288
M=D // 6289
@30 // 6290
D=A // 6291
@SP // 6292
AM=M+1 // 6293
A=A-1 // 6294
M=D // 6295
@51 // 6296
D=A // 6297
@SP // 6298
AM=M+1 // 6299
A=A-1 // 6300
M=D // 6301
@51 // 6302
D=A // 6303
@SP // 6304
AM=M+1 // 6305
A=A-1 // 6306
M=D // 6307
@51 // 6308
D=A // 6309
@SP // 6310
AM=M+1 // 6311
A=A-1 // 6312
M=D // 6313
@30 // 6314
D=A // 6315
@SP // 6316
AM=M+1 // 6317
A=A-1 // 6318
M=D // 6319
@SP // 6320
AM=M+1 // 6321
A=A-1 // 6322
M=0 // 6323
@SP // 6324
AM=M+1 // 6325
A=A-1 // 6326
M=0 // 6327
// call Output.create
@17 // 6328
D=A // 6329
@14 // 6330
M=D // 6331
@Output.create // 6332
D=A // 6333
@13 // 6334
M=D // 6335
@Output.initMap.ret.26 // 6336
D=A // 6337
@CALL // 6338
0;JMP // 6339
(Output.initMap.ret.26)
@SP // 6340
M=M-1 // 6341

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6342
D=A // 6343
@SP // 6344
AM=M+1 // 6345
A=A-1 // 6346
M=D // 6347
@30 // 6348
D=A // 6349
@SP // 6350
AM=M+1 // 6351
A=A-1 // 6352
M=D // 6353
@51 // 6354
D=A // 6355
@SP // 6356
AM=M+1 // 6357
A=A-1 // 6358
M=D // 6359
@51 // 6360
D=A // 6361
@SP // 6362
AM=M+1 // 6363
A=A-1 // 6364
M=D // 6365
@51 // 6366
D=A // 6367
@SP // 6368
AM=M+1 // 6369
A=A-1 // 6370
M=D // 6371
@62 // 6372
D=A // 6373
@SP // 6374
AM=M+1 // 6375
A=A-1 // 6376
M=D // 6377
@48 // 6378
D=A // 6379
@SP // 6380
AM=M+1 // 6381
A=A-1 // 6382
M=D // 6383
@48 // 6384
D=A // 6385
@SP // 6386
AM=M+1 // 6387
A=A-1 // 6388
M=D // 6389
@24 // 6390
D=A // 6391
@SP // 6392
AM=M+1 // 6393
A=A-1 // 6394
M=D // 6395
@14 // 6396
D=A // 6397
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=D // 6401
@SP // 6402
AM=M+1 // 6403
A=A-1 // 6404
M=0 // 6405
@SP // 6406
AM=M+1 // 6407
A=A-1 // 6408
M=0 // 6409
// call Output.create
@17 // 6410
D=A // 6411
@14 // 6412
M=D // 6413
@Output.create // 6414
D=A // 6415
@13 // 6416
M=D // 6417
@Output.initMap.ret.27 // 6418
D=A // 6419
@CALL // 6420
0;JMP // 6421
(Output.initMap.ret.27)
@SP // 6422
M=M-1 // 6423

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@58 // 6424
D=A // 6425
@SP // 6426
AM=M+1 // 6427
A=A-1 // 6428
M=D // 6429
@SP // 6430
AM=M+1 // 6431
A=A-1 // 6432
M=0 // 6433
@SP // 6434
AM=M+1 // 6435
A=A-1 // 6436
M=0 // 6437
@12 // 6438
D=A // 6439
@SP // 6440
AM=M+1 // 6441
A=A-1 // 6442
M=D // 6443
@12 // 6444
D=A // 6445
@SP // 6446
AM=M+1 // 6447
A=A-1 // 6448
M=D // 6449
@SP // 6450
AM=M+1 // 6451
A=A-1 // 6452
M=0 // 6453
@SP // 6454
AM=M+1 // 6455
A=A-1 // 6456
M=0 // 6457
@12 // 6458
D=A // 6459
@SP // 6460
AM=M+1 // 6461
A=A-1 // 6462
M=D // 6463
@12 // 6464
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
@SP // 6478
AM=M+1 // 6479
A=A-1 // 6480
M=0 // 6481
// call Output.create
@17 // 6482
D=A // 6483
@14 // 6484
M=D // 6485
@Output.create // 6486
D=A // 6487
@13 // 6488
M=D // 6489
@Output.initMap.ret.28 // 6490
D=A // 6491
@CALL // 6492
0;JMP // 6493
(Output.initMap.ret.28)
@SP // 6494
M=M-1 // 6495

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@59 // 6496
D=A // 6497
@SP // 6498
AM=M+1 // 6499
A=A-1 // 6500
M=D // 6501
@SP // 6502
AM=M+1 // 6503
A=A-1 // 6504
M=0 // 6505
@SP // 6506
AM=M+1 // 6507
A=A-1 // 6508
M=0 // 6509
@12 // 6510
D=A // 6511
@SP // 6512
AM=M+1 // 6513
A=A-1 // 6514
M=D // 6515
@12 // 6516
D=A // 6517
@SP // 6518
AM=M+1 // 6519
A=A-1 // 6520
M=D // 6521
@SP // 6522
AM=M+1 // 6523
A=A-1 // 6524
M=0 // 6525
@SP // 6526
AM=M+1 // 6527
A=A-1 // 6528
M=0 // 6529
@12 // 6530
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
@6 // 6542
D=A // 6543
@SP // 6544
AM=M+1 // 6545
A=A-1 // 6546
M=D // 6547
@SP // 6548
AM=M+1 // 6549
A=A-1 // 6550
M=0 // 6551
@SP // 6552
AM=M+1 // 6553
A=A-1 // 6554
M=0 // 6555
// call Output.create
@17 // 6556
D=A // 6557
@14 // 6558
M=D // 6559
@Output.create // 6560
D=A // 6561
@13 // 6562
M=D // 6563
@Output.initMap.ret.29 // 6564
D=A // 6565
@CALL // 6566
0;JMP // 6567
(Output.initMap.ret.29)
@SP // 6568
M=M-1 // 6569

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@60 // 6570
D=A // 6571
@SP // 6572
AM=M+1 // 6573
A=A-1 // 6574
M=D // 6575
@SP // 6576
AM=M+1 // 6577
A=A-1 // 6578
M=0 // 6579
@SP // 6580
AM=M+1 // 6581
A=A-1 // 6582
M=0 // 6583
@24 // 6584
D=A // 6585
@SP // 6586
AM=M+1 // 6587
A=A-1 // 6588
M=D // 6589
@12 // 6590
D=A // 6591
@SP // 6592
AM=M+1 // 6593
A=A-1 // 6594
M=D // 6595
@6 // 6596
D=A // 6597
@SP // 6598
AM=M+1 // 6599
A=A-1 // 6600
M=D // 6601
@3 // 6602
D=A // 6603
@SP // 6604
AM=M+1 // 6605
A=A-1 // 6606
M=D // 6607
@6 // 6608
D=A // 6609
@SP // 6610
AM=M+1 // 6611
A=A-1 // 6612
M=D // 6613
@12 // 6614
D=A // 6615
@SP // 6616
AM=M+1 // 6617
A=A-1 // 6618
M=D // 6619
@24 // 6620
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
// call Output.create
@17 // 6634
D=A // 6635
@14 // 6636
M=D // 6637
@Output.create // 6638
D=A // 6639
@13 // 6640
M=D // 6641
@Output.initMap.ret.30 // 6642
D=A // 6643
@CALL // 6644
0;JMP // 6645
(Output.initMap.ret.30)
@SP // 6646
M=M-1 // 6647

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@61 // 6648
D=A // 6649
@SP // 6650
AM=M+1 // 6651
A=A-1 // 6652
M=D // 6653
@SP // 6654
AM=M+1 // 6655
A=A-1 // 6656
M=0 // 6657
@SP // 6658
AM=M+1 // 6659
A=A-1 // 6660
M=0 // 6661
@SP // 6662
AM=M+1 // 6663
A=A-1 // 6664
M=0 // 6665
@63 // 6666
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
@63 // 6680
D=A // 6681
@SP // 6682
AM=M+1 // 6683
A=A-1 // 6684
M=D // 6685
@SP // 6686
AM=M+1 // 6687
A=A-1 // 6688
M=0 // 6689
@SP // 6690
AM=M+1 // 6691
A=A-1 // 6692
M=0 // 6693
@SP // 6694
AM=M+1 // 6695
A=A-1 // 6696
M=0 // 6697
@SP // 6698
AM=M+1 // 6699
A=A-1 // 6700
M=0 // 6701
// call Output.create
@17 // 6702
D=A // 6703
@14 // 6704
M=D // 6705
@Output.create // 6706
D=A // 6707
@13 // 6708
M=D // 6709
@Output.initMap.ret.31 // 6710
D=A // 6711
@CALL // 6712
0;JMP // 6713
(Output.initMap.ret.31)
@SP // 6714
M=M-1 // 6715

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@62 // 6716
D=A // 6717
@SP // 6718
AM=M+1 // 6719
A=A-1 // 6720
M=D // 6721
@SP // 6722
AM=M+1 // 6723
A=A-1 // 6724
M=0 // 6725
@SP // 6726
AM=M+1 // 6727
A=A-1 // 6728
M=0 // 6729
@3 // 6730
D=A // 6731
@SP // 6732
AM=M+1 // 6733
A=A-1 // 6734
M=D // 6735
@6 // 6736
D=A // 6737
@SP // 6738
AM=M+1 // 6739
A=A-1 // 6740
M=D // 6741
@12 // 6742
D=A // 6743
@SP // 6744
AM=M+1 // 6745
A=A-1 // 6746
M=D // 6747
@24 // 6748
D=A // 6749
@SP // 6750
AM=M+1 // 6751
A=A-1 // 6752
M=D // 6753
@12 // 6754
D=A // 6755
@SP // 6756
AM=M+1 // 6757
A=A-1 // 6758
M=D // 6759
@6 // 6760
D=A // 6761
@SP // 6762
AM=M+1 // 6763
A=A-1 // 6764
M=D // 6765
@3 // 6766
D=A // 6767
@SP // 6768
AM=M+1 // 6769
A=A-1 // 6770
M=D // 6771
@SP // 6772
AM=M+1 // 6773
A=A-1 // 6774
M=0 // 6775
@SP // 6776
AM=M+1 // 6777
A=A-1 // 6778
M=0 // 6779
// call Output.create
@17 // 6780
D=A // 6781
@14 // 6782
M=D // 6783
@Output.create // 6784
D=A // 6785
@13 // 6786
M=D // 6787
@Output.initMap.ret.32 // 6788
D=A // 6789
@CALL // 6790
0;JMP // 6791
(Output.initMap.ret.32)
@SP // 6792
M=M-1 // 6793

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6794
D=A // 6795
@SP // 6796
AM=M+1 // 6797
A=A-1 // 6798
M=D // 6799
@30 // 6800
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
@59 // 6818
D=A // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=D // 6823
@59 // 6824
D=A // 6825
@SP // 6826
AM=M+1 // 6827
A=A-1 // 6828
M=D // 6829
@59 // 6830
D=A // 6831
@SP // 6832
AM=M+1 // 6833
A=A-1 // 6834
M=D // 6835
@27 // 6836
D=A // 6837
@SP // 6838
AM=M+1 // 6839
A=A-1 // 6840
M=D // 6841
@3 // 6842
D=A // 6843
@SP // 6844
AM=M+1 // 6845
A=A-1 // 6846
M=D // 6847
@30 // 6848
D=A // 6849
@SP // 6850
AM=M+1 // 6851
A=A-1 // 6852
M=D // 6853
@SP // 6854
AM=M+1 // 6855
A=A-1 // 6856
M=0 // 6857
@SP // 6858
AM=M+1 // 6859
A=A-1 // 6860
M=0 // 6861
// call Output.create
@17 // 6862
D=A // 6863
@14 // 6864
M=D // 6865
@Output.create // 6866
D=A // 6867
@13 // 6868
M=D // 6869
@Output.initMap.ret.33 // 6870
D=A // 6871
@CALL // 6872
0;JMP // 6873
(Output.initMap.ret.33)
@SP // 6874
M=M-1 // 6875

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6876
D=A // 6877
@SP // 6878
AM=M+1 // 6879
A=A-1 // 6880
M=D // 6881
@30 // 6882
D=A // 6883
@SP // 6884
AM=M+1 // 6885
A=A-1 // 6886
M=D // 6887
@51 // 6888
D=A // 6889
@SP // 6890
AM=M+1 // 6891
A=A-1 // 6892
M=D // 6893
@51 // 6894
D=A // 6895
@SP // 6896
AM=M+1 // 6897
A=A-1 // 6898
M=D // 6899
@24 // 6900
D=A // 6901
@SP // 6902
AM=M+1 // 6903
A=A-1 // 6904
M=D // 6905
@12 // 6906
D=A // 6907
@SP // 6908
AM=M+1 // 6909
A=A-1 // 6910
M=D // 6911
@12 // 6912
D=A // 6913
@SP // 6914
AM=M+1 // 6915
A=A-1 // 6916
M=D // 6917
@SP // 6918
AM=M+1 // 6919
A=A-1 // 6920
M=0 // 6921
@12 // 6922
D=A // 6923
@SP // 6924
AM=M+1 // 6925
A=A-1 // 6926
M=D // 6927
@12 // 6928
D=A // 6929
@SP // 6930
AM=M+1 // 6931
A=A-1 // 6932
M=D // 6933
@SP // 6934
AM=M+1 // 6935
A=A-1 // 6936
M=0 // 6937
@SP // 6938
AM=M+1 // 6939
A=A-1 // 6940
M=0 // 6941
// call Output.create
@17 // 6942
D=A // 6943
@14 // 6944
M=D // 6945
@Output.create // 6946
D=A // 6947
@13 // 6948
M=D // 6949
@Output.initMap.ret.34 // 6950
D=A // 6951
@CALL // 6952
0;JMP // 6953
(Output.initMap.ret.34)
@SP // 6954
M=M-1 // 6955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6956
D=A // 6957
@SP // 6958
AM=M+1 // 6959
A=A-1 // 6960
M=D // 6961
@12 // 6962
D=A // 6963
@SP // 6964
AM=M+1 // 6965
A=A-1 // 6966
M=D // 6967
@30 // 6968
D=A // 6969
@SP // 6970
AM=M+1 // 6971
A=A-1 // 6972
M=D // 6973
@51 // 6974
D=A // 6975
@SP // 6976
AM=M+1 // 6977
A=A-1 // 6978
M=D // 6979
@51 // 6980
D=A // 6981
@SP // 6982
AM=M+1 // 6983
A=A-1 // 6984
M=D // 6985
@63 // 6986
D=A // 6987
@SP // 6988
AM=M+1 // 6989
A=A-1 // 6990
M=D // 6991
@51 // 6992
D=A // 6993
@SP // 6994
AM=M+1 // 6995
A=A-1 // 6996
M=D // 6997
@51 // 6998
D=A // 6999
@SP // 7000
AM=M+1 // 7001
A=A-1 // 7002
M=D // 7003
@51 // 7004
D=A // 7005
@SP // 7006
AM=M+1 // 7007
A=A-1 // 7008
M=D // 7009
@51 // 7010
D=A // 7011
@SP // 7012
AM=M+1 // 7013
A=A-1 // 7014
M=D // 7015
@SP // 7016
AM=M+1 // 7017
A=A-1 // 7018
M=0 // 7019
@SP // 7020
AM=M+1 // 7021
A=A-1 // 7022
M=0 // 7023
// call Output.create
@17 // 7024
D=A // 7025
@14 // 7026
M=D // 7027
@Output.create // 7028
D=A // 7029
@13 // 7030
M=D // 7031
@Output.initMap.ret.35 // 7032
D=A // 7033
@CALL // 7034
0;JMP // 7035
(Output.initMap.ret.35)
@SP // 7036
M=M-1 // 7037

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 7038
D=A // 7039
@SP // 7040
AM=M+1 // 7041
A=A-1 // 7042
M=D // 7043
@31 // 7044
D=A // 7045
@SP // 7046
AM=M+1 // 7047
A=A-1 // 7048
M=D // 7049
@51 // 7050
D=A // 7051
@SP // 7052
AM=M+1 // 7053
A=A-1 // 7054
M=D // 7055
@51 // 7056
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
@31 // 7068
D=A // 7069
@SP // 7070
AM=M+1 // 7071
A=A-1 // 7072
M=D // 7073
@51 // 7074
D=A // 7075
@SP // 7076
AM=M+1 // 7077
A=A-1 // 7078
M=D // 7079
@51 // 7080
D=A // 7081
@SP // 7082
AM=M+1 // 7083
A=A-1 // 7084
M=D // 7085
@51 // 7086
D=A // 7087
@SP // 7088
AM=M+1 // 7089
A=A-1 // 7090
M=D // 7091
@31 // 7092
D=A // 7093
@SP // 7094
AM=M+1 // 7095
A=A-1 // 7096
M=D // 7097
@SP // 7098
AM=M+1 // 7099
A=A-1 // 7100
M=0 // 7101
@SP // 7102
AM=M+1 // 7103
A=A-1 // 7104
M=0 // 7105
// call Output.create
@17 // 7106
D=A // 7107
@14 // 7108
M=D // 7109
@Output.create // 7110
D=A // 7111
@13 // 7112
M=D // 7113
@Output.initMap.ret.36 // 7114
D=A // 7115
@CALL // 7116
0;JMP // 7117
(Output.initMap.ret.36)
@SP // 7118
M=M-1 // 7119

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 7120
D=A // 7121
@SP // 7122
AM=M+1 // 7123
A=A-1 // 7124
M=D // 7125
@28 // 7126
D=A // 7127
@SP // 7128
AM=M+1 // 7129
A=A-1 // 7130
M=D // 7131
@54 // 7132
D=A // 7133
@SP // 7134
AM=M+1 // 7135
A=A-1 // 7136
M=D // 7137
@35 // 7138
D=A // 7139
@SP // 7140
AM=M+1 // 7141
A=A-1 // 7142
M=D // 7143
@3 // 7144
D=A // 7145
@SP // 7146
AM=M+1 // 7147
A=A-1 // 7148
M=D // 7149
@3 // 7150
D=A // 7151
@SP // 7152
AM=M+1 // 7153
A=A-1 // 7154
M=D // 7155
@3 // 7156
D=A // 7157
@SP // 7158
AM=M+1 // 7159
A=A-1 // 7160
M=D // 7161
@35 // 7162
D=A // 7163
@SP // 7164
AM=M+1 // 7165
A=A-1 // 7166
M=D // 7167
@54 // 7168
D=A // 7169
@SP // 7170
AM=M+1 // 7171
A=A-1 // 7172
M=D // 7173
@28 // 7174
D=A // 7175
@SP // 7176
AM=M+1 // 7177
A=A-1 // 7178
M=D // 7179
@SP // 7180
AM=M+1 // 7181
A=A-1 // 7182
M=0 // 7183
@SP // 7184
AM=M+1 // 7185
A=A-1 // 7186
M=0 // 7187
// call Output.create
@17 // 7188
D=A // 7189
@14 // 7190
M=D // 7191
@Output.create // 7192
D=A // 7193
@13 // 7194
M=D // 7195
@Output.initMap.ret.37 // 7196
D=A // 7197
@CALL // 7198
0;JMP // 7199
(Output.initMap.ret.37)
@SP // 7200
M=M-1 // 7201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 7202
D=A // 7203
@SP // 7204
AM=M+1 // 7205
A=A-1 // 7206
M=D // 7207
@15 // 7208
D=A // 7209
@SP // 7210
AM=M+1 // 7211
A=A-1 // 7212
M=D // 7213
@27 // 7214
D=A // 7215
@SP // 7216
AM=M+1 // 7217
A=A-1 // 7218
M=D // 7219
@51 // 7220
D=A // 7221
@SP // 7222
AM=M+1 // 7223
A=A-1 // 7224
M=D // 7225
@51 // 7226
D=A // 7227
@SP // 7228
AM=M+1 // 7229
A=A-1 // 7230
M=D // 7231
@51 // 7232
D=A // 7233
@SP // 7234
AM=M+1 // 7235
A=A-1 // 7236
M=D // 7237
@51 // 7238
D=A // 7239
@SP // 7240
AM=M+1 // 7241
A=A-1 // 7242
M=D // 7243
@51 // 7244
D=A // 7245
@SP // 7246
AM=M+1 // 7247
A=A-1 // 7248
M=D // 7249
@27 // 7250
D=A // 7251
@SP // 7252
AM=M+1 // 7253
A=A-1 // 7254
M=D // 7255
@15 // 7256
D=A // 7257
@SP // 7258
AM=M+1 // 7259
A=A-1 // 7260
M=D // 7261
@SP // 7262
AM=M+1 // 7263
A=A-1 // 7264
M=0 // 7265
@SP // 7266
AM=M+1 // 7267
A=A-1 // 7268
M=0 // 7269
// call Output.create
@17 // 7270
D=A // 7271
@14 // 7272
M=D // 7273
@Output.create // 7274
D=A // 7275
@13 // 7276
M=D // 7277
@Output.initMap.ret.38 // 7278
D=A // 7279
@CALL // 7280
0;JMP // 7281
(Output.initMap.ret.38)
@SP // 7282
M=M-1 // 7283

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 7284
D=A // 7285
@SP // 7286
AM=M+1 // 7287
A=A-1 // 7288
M=D // 7289
@63 // 7290
D=A // 7291
@SP // 7292
AM=M+1 // 7293
A=A-1 // 7294
M=D // 7295
@51 // 7296
D=A // 7297
@SP // 7298
AM=M+1 // 7299
A=A-1 // 7300
M=D // 7301
@35 // 7302
D=A // 7303
@SP // 7304
AM=M+1 // 7305
A=A-1 // 7306
M=D // 7307
@11 // 7308
D=A // 7309
@SP // 7310
AM=M+1 // 7311
A=A-1 // 7312
M=D // 7313
@15 // 7314
D=A // 7315
@SP // 7316
AM=M+1 // 7317
A=A-1 // 7318
M=D // 7319
@11 // 7320
D=A // 7321
@SP // 7322
AM=M+1 // 7323
A=A-1 // 7324
M=D // 7325
@35 // 7326
D=A // 7327
@SP // 7328
AM=M+1 // 7329
A=A-1 // 7330
M=D // 7331
@51 // 7332
D=A // 7333
@SP // 7334
AM=M+1 // 7335
A=A-1 // 7336
M=D // 7337
@63 // 7338
D=A // 7339
@SP // 7340
AM=M+1 // 7341
A=A-1 // 7342
M=D // 7343
@SP // 7344
AM=M+1 // 7345
A=A-1 // 7346
M=0 // 7347
@SP // 7348
AM=M+1 // 7349
A=A-1 // 7350
M=0 // 7351
// call Output.create
@17 // 7352
D=A // 7353
@14 // 7354
M=D // 7355
@Output.create // 7356
D=A // 7357
@13 // 7358
M=D // 7359
@Output.initMap.ret.39 // 7360
D=A // 7361
@CALL // 7362
0;JMP // 7363
(Output.initMap.ret.39)
@SP // 7364
M=M-1 // 7365

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7366
D=A // 7367
@SP // 7368
AM=M+1 // 7369
A=A-1 // 7370
M=D // 7371
@63 // 7372
D=A // 7373
@SP // 7374
AM=M+1 // 7375
A=A-1 // 7376
M=D // 7377
@51 // 7378
D=A // 7379
@SP // 7380
AM=M+1 // 7381
A=A-1 // 7382
M=D // 7383
@35 // 7384
D=A // 7385
@SP // 7386
AM=M+1 // 7387
A=A-1 // 7388
M=D // 7389
@11 // 7390
D=A // 7391
@SP // 7392
AM=M+1 // 7393
A=A-1 // 7394
M=D // 7395
@15 // 7396
D=A // 7397
@SP // 7398
AM=M+1 // 7399
A=A-1 // 7400
M=D // 7401
@11 // 7402
D=A // 7403
@SP // 7404
AM=M+1 // 7405
A=A-1 // 7406
M=D // 7407
@3 // 7408
D=A // 7409
@SP // 7410
AM=M+1 // 7411
A=A-1 // 7412
M=D // 7413
@3 // 7414
D=A // 7415
@SP // 7416
AM=M+1 // 7417
A=A-1 // 7418
M=D // 7419
@3 // 7420
D=A // 7421
@SP // 7422
AM=M+1 // 7423
A=A-1 // 7424
M=D // 7425
@SP // 7426
AM=M+1 // 7427
A=A-1 // 7428
M=0 // 7429
@SP // 7430
AM=M+1 // 7431
A=A-1 // 7432
M=0 // 7433
// call Output.create
@17 // 7434
D=A // 7435
@14 // 7436
M=D // 7437
@Output.create // 7438
D=A // 7439
@13 // 7440
M=D // 7441
@Output.initMap.ret.40 // 7442
D=A // 7443
@CALL // 7444
0;JMP // 7445
(Output.initMap.ret.40)
@SP // 7446
M=M-1 // 7447

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7448
D=A // 7449
@SP // 7450
AM=M+1 // 7451
A=A-1 // 7452
M=D // 7453
@28 // 7454
D=A // 7455
@SP // 7456
AM=M+1 // 7457
A=A-1 // 7458
M=D // 7459
@54 // 7460
D=A // 7461
@SP // 7462
AM=M+1 // 7463
A=A-1 // 7464
M=D // 7465
@35 // 7466
D=A // 7467
@SP // 7468
AM=M+1 // 7469
A=A-1 // 7470
M=D // 7471
@3 // 7472
D=A // 7473
@SP // 7474
AM=M+1 // 7475
A=A-1 // 7476
M=D // 7477
@59 // 7478
D=A // 7479
@SP // 7480
AM=M+1 // 7481
A=A-1 // 7482
M=D // 7483
@51 // 7484
D=A // 7485
@SP // 7486
AM=M+1 // 7487
A=A-1 // 7488
M=D // 7489
@51 // 7490
D=A // 7491
@SP // 7492
AM=M+1 // 7493
A=A-1 // 7494
M=D // 7495
@54 // 7496
D=A // 7497
@SP // 7498
AM=M+1 // 7499
A=A-1 // 7500
M=D // 7501
@44 // 7502
D=A // 7503
@SP // 7504
AM=M+1 // 7505
A=A-1 // 7506
M=D // 7507
@SP // 7508
AM=M+1 // 7509
A=A-1 // 7510
M=0 // 7511
@SP // 7512
AM=M+1 // 7513
A=A-1 // 7514
M=0 // 7515
// call Output.create
@17 // 7516
D=A // 7517
@14 // 7518
M=D // 7519
@Output.create // 7520
D=A // 7521
@13 // 7522
M=D // 7523
@Output.initMap.ret.41 // 7524
D=A // 7525
@CALL // 7526
0;JMP // 7527
(Output.initMap.ret.41)
@SP // 7528
M=M-1 // 7529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7530
D=A // 7531
@SP // 7532
AM=M+1 // 7533
A=A-1 // 7534
M=D // 7535
@51 // 7536
D=A // 7537
@SP // 7538
AM=M+1 // 7539
A=A-1 // 7540
M=D // 7541
@51 // 7542
D=A // 7543
@SP // 7544
AM=M+1 // 7545
A=A-1 // 7546
M=D // 7547
@51 // 7548
D=A // 7549
@SP // 7550
AM=M+1 // 7551
A=A-1 // 7552
M=D // 7553
@51 // 7554
D=A // 7555
@SP // 7556
AM=M+1 // 7557
A=A-1 // 7558
M=D // 7559
@63 // 7560
D=A // 7561
@SP // 7562
AM=M+1 // 7563
A=A-1 // 7564
M=D // 7565
@51 // 7566
D=A // 7567
@SP // 7568
AM=M+1 // 7569
A=A-1 // 7570
M=D // 7571
@51 // 7572
D=A // 7573
@SP // 7574
AM=M+1 // 7575
A=A-1 // 7576
M=D // 7577
@51 // 7578
D=A // 7579
@SP // 7580
AM=M+1 // 7581
A=A-1 // 7582
M=D // 7583
@51 // 7584
D=A // 7585
@SP // 7586
AM=M+1 // 7587
A=A-1 // 7588
M=D // 7589
@SP // 7590
AM=M+1 // 7591
A=A-1 // 7592
M=0 // 7593
@SP // 7594
AM=M+1 // 7595
A=A-1 // 7596
M=0 // 7597
// call Output.create
@17 // 7598
D=A // 7599
@14 // 7600
M=D // 7601
@Output.create // 7602
D=A // 7603
@13 // 7604
M=D // 7605
@Output.initMap.ret.42 // 7606
D=A // 7607
@CALL // 7608
0;JMP // 7609
(Output.initMap.ret.42)
@SP // 7610
M=M-1 // 7611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7612
D=A // 7613
@SP // 7614
AM=M+1 // 7615
A=A-1 // 7616
M=D // 7617
@30 // 7618
D=A // 7619
@SP // 7620
AM=M+1 // 7621
A=A-1 // 7622
M=D // 7623
@12 // 7624
D=A // 7625
@SP // 7626
AM=M+1 // 7627
A=A-1 // 7628
M=D // 7629
@12 // 7630
D=A // 7631
@SP // 7632
AM=M+1 // 7633
A=A-1 // 7634
M=D // 7635
@12 // 7636
D=A // 7637
@SP // 7638
AM=M+1 // 7639
A=A-1 // 7640
M=D // 7641
@12 // 7642
D=A // 7643
@SP // 7644
AM=M+1 // 7645
A=A-1 // 7646
M=D // 7647
@12 // 7648
D=A // 7649
@SP // 7650
AM=M+1 // 7651
A=A-1 // 7652
M=D // 7653
@12 // 7654
D=A // 7655
@SP // 7656
AM=M+1 // 7657
A=A-1 // 7658
M=D // 7659
@12 // 7660
D=A // 7661
@SP // 7662
AM=M+1 // 7663
A=A-1 // 7664
M=D // 7665
@30 // 7666
D=A // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=D // 7671
@SP // 7672
AM=M+1 // 7673
A=A-1 // 7674
M=0 // 7675
@SP // 7676
AM=M+1 // 7677
A=A-1 // 7678
M=0 // 7679
// call Output.create
@17 // 7680
D=A // 7681
@14 // 7682
M=D // 7683
@Output.create // 7684
D=A // 7685
@13 // 7686
M=D // 7687
@Output.initMap.ret.43 // 7688
D=A // 7689
@CALL // 7690
0;JMP // 7691
(Output.initMap.ret.43)
@SP // 7692
M=M-1 // 7693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7694
D=A // 7695
@SP // 7696
AM=M+1 // 7697
A=A-1 // 7698
M=D // 7699
@60 // 7700
D=A // 7701
@SP // 7702
AM=M+1 // 7703
A=A-1 // 7704
M=D // 7705
@24 // 7706
D=A // 7707
@SP // 7708
AM=M+1 // 7709
A=A-1 // 7710
M=D // 7711
@24 // 7712
D=A // 7713
@SP // 7714
AM=M+1 // 7715
A=A-1 // 7716
M=D // 7717
@24 // 7718
D=A // 7719
@SP // 7720
AM=M+1 // 7721
A=A-1 // 7722
M=D // 7723
@24 // 7724
D=A // 7725
@SP // 7726
AM=M+1 // 7727
A=A-1 // 7728
M=D // 7729
@24 // 7730
D=A // 7731
@SP // 7732
AM=M+1 // 7733
A=A-1 // 7734
M=D // 7735
@27 // 7736
D=A // 7737
@SP // 7738
AM=M+1 // 7739
A=A-1 // 7740
M=D // 7741
@27 // 7742
D=A // 7743
@SP // 7744
AM=M+1 // 7745
A=A-1 // 7746
M=D // 7747
@14 // 7748
D=A // 7749
@SP // 7750
AM=M+1 // 7751
A=A-1 // 7752
M=D // 7753
@SP // 7754
AM=M+1 // 7755
A=A-1 // 7756
M=0 // 7757
@SP // 7758
AM=M+1 // 7759
A=A-1 // 7760
M=0 // 7761
// call Output.create
@17 // 7762
D=A // 7763
@14 // 7764
M=D // 7765
@Output.create // 7766
D=A // 7767
@13 // 7768
M=D // 7769
@Output.initMap.ret.44 // 7770
D=A // 7771
@CALL // 7772
0;JMP // 7773
(Output.initMap.ret.44)
@SP // 7774
M=M-1 // 7775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7776
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
@51 // 7788
D=A // 7789
@SP // 7790
AM=M+1 // 7791
A=A-1 // 7792
M=D // 7793
@51 // 7794
D=A // 7795
@SP // 7796
AM=M+1 // 7797
A=A-1 // 7798
M=D // 7799
@27 // 7800
D=A // 7801
@SP // 7802
AM=M+1 // 7803
A=A-1 // 7804
M=D // 7805
@15 // 7806
D=A // 7807
@SP // 7808
AM=M+1 // 7809
A=A-1 // 7810
M=D // 7811
@27 // 7812
D=A // 7813
@SP // 7814
AM=M+1 // 7815
A=A-1 // 7816
M=D // 7817
@51 // 7818
D=A // 7819
@SP // 7820
AM=M+1 // 7821
A=A-1 // 7822
M=D // 7823
@51 // 7824
D=A // 7825
@SP // 7826
AM=M+1 // 7827
A=A-1 // 7828
M=D // 7829
@51 // 7830
D=A // 7831
@SP // 7832
AM=M+1 // 7833
A=A-1 // 7834
M=D // 7835
@SP // 7836
AM=M+1 // 7837
A=A-1 // 7838
M=0 // 7839
@SP // 7840
AM=M+1 // 7841
A=A-1 // 7842
M=0 // 7843
// call Output.create
@17 // 7844
D=A // 7845
@14 // 7846
M=D // 7847
@Output.create // 7848
D=A // 7849
@13 // 7850
M=D // 7851
@Output.initMap.ret.45 // 7852
D=A // 7853
@CALL // 7854
0;JMP // 7855
(Output.initMap.ret.45)
@SP // 7856
M=M-1 // 7857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7858
D=A // 7859
@SP // 7860
AM=M+1 // 7861
A=A-1 // 7862
M=D // 7863
@3 // 7864
D=A // 7865
@SP // 7866
AM=M+1 // 7867
A=A-1 // 7868
M=D // 7869
@3 // 7870
D=A // 7871
@SP // 7872
AM=M+1 // 7873
A=A-1 // 7874
M=D // 7875
@3 // 7876
D=A // 7877
@SP // 7878
AM=M+1 // 7879
A=A-1 // 7880
M=D // 7881
@3 // 7882
D=A // 7883
@SP // 7884
AM=M+1 // 7885
A=A-1 // 7886
M=D // 7887
@3 // 7888
D=A // 7889
@SP // 7890
AM=M+1 // 7891
A=A-1 // 7892
M=D // 7893
@3 // 7894
D=A // 7895
@SP // 7896
AM=M+1 // 7897
A=A-1 // 7898
M=D // 7899
@35 // 7900
D=A // 7901
@SP // 7902
AM=M+1 // 7903
A=A-1 // 7904
M=D // 7905
@51 // 7906
D=A // 7907
@SP // 7908
AM=M+1 // 7909
A=A-1 // 7910
M=D // 7911
@63 // 7912
D=A // 7913
@SP // 7914
AM=M+1 // 7915
A=A-1 // 7916
M=D // 7917
@SP // 7918
AM=M+1 // 7919
A=A-1 // 7920
M=0 // 7921
@SP // 7922
AM=M+1 // 7923
A=A-1 // 7924
M=0 // 7925
// call Output.create
@17 // 7926
D=A // 7927
@14 // 7928
M=D // 7929
@Output.create // 7930
D=A // 7931
@13 // 7932
M=D // 7933
@Output.initMap.ret.46 // 7934
D=A // 7935
@CALL // 7936
0;JMP // 7937
(Output.initMap.ret.46)
@SP // 7938
M=M-1 // 7939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7940
D=A // 7941
@SP // 7942
AM=M+1 // 7943
A=A-1 // 7944
M=D // 7945
@33 // 7946
D=A // 7947
@SP // 7948
AM=M+1 // 7949
A=A-1 // 7950
M=D // 7951
@51 // 7952
D=A // 7953
@SP // 7954
AM=M+1 // 7955
A=A-1 // 7956
M=D // 7957
@63 // 7958
D=A // 7959
@SP // 7960
AM=M+1 // 7961
A=A-1 // 7962
M=D // 7963
@63 // 7964
D=A // 7965
@SP // 7966
AM=M+1 // 7967
A=A-1 // 7968
M=D // 7969
@51 // 7970
D=A // 7971
@SP // 7972
AM=M+1 // 7973
A=A-1 // 7974
M=D // 7975
@51 // 7976
D=A // 7977
@SP // 7978
AM=M+1 // 7979
A=A-1 // 7980
M=D // 7981
@51 // 7982
D=A // 7983
@SP // 7984
AM=M+1 // 7985
A=A-1 // 7986
M=D // 7987
@51 // 7988
D=A // 7989
@SP // 7990
AM=M+1 // 7991
A=A-1 // 7992
M=D // 7993
@51 // 7994
D=A // 7995
@SP // 7996
AM=M+1 // 7997
A=A-1 // 7998
M=D // 7999
@SP // 8000
AM=M+1 // 8001
A=A-1 // 8002
M=0 // 8003
@SP // 8004
AM=M+1 // 8005
A=A-1 // 8006
M=0 // 8007
// call Output.create
@17 // 8008
D=A // 8009
@14 // 8010
M=D // 8011
@Output.create // 8012
D=A // 8013
@13 // 8014
M=D // 8015
@Output.initMap.ret.47 // 8016
D=A // 8017
@CALL // 8018
0;JMP // 8019
(Output.initMap.ret.47)
@SP // 8020
M=M-1 // 8021

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 8022
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
@51 // 8034
D=A // 8035
@SP // 8036
AM=M+1 // 8037
A=A-1 // 8038
M=D // 8039
@55 // 8040
D=A // 8041
@SP // 8042
AM=M+1 // 8043
A=A-1 // 8044
M=D // 8045
@55 // 8046
D=A // 8047
@SP // 8048
AM=M+1 // 8049
A=A-1 // 8050
M=D // 8051
@63 // 8052
D=A // 8053
@SP // 8054
AM=M+1 // 8055
A=A-1 // 8056
M=D // 8057
@59 // 8058
D=A // 8059
@SP // 8060
AM=M+1 // 8061
A=A-1 // 8062
M=D // 8063
@59 // 8064
D=A // 8065
@SP // 8066
AM=M+1 // 8067
A=A-1 // 8068
M=D // 8069
@51 // 8070
D=A // 8071
@SP // 8072
AM=M+1 // 8073
A=A-1 // 8074
M=D // 8075
@51 // 8076
D=A // 8077
@SP // 8078
AM=M+1 // 8079
A=A-1 // 8080
M=D // 8081
@SP // 8082
AM=M+1 // 8083
A=A-1 // 8084
M=0 // 8085
@SP // 8086
AM=M+1 // 8087
A=A-1 // 8088
M=0 // 8089
// call Output.create
@17 // 8090
D=A // 8091
@14 // 8092
M=D // 8093
@Output.create // 8094
D=A // 8095
@13 // 8096
M=D // 8097
@Output.initMap.ret.48 // 8098
D=A // 8099
@CALL // 8100
0;JMP // 8101
(Output.initMap.ret.48)
@SP // 8102
M=M-1 // 8103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 8104
D=A // 8105
@SP // 8106
AM=M+1 // 8107
A=A-1 // 8108
M=D // 8109
@30 // 8110
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
@51 // 8122
D=A // 8123
@SP // 8124
AM=M+1 // 8125
A=A-1 // 8126
M=D // 8127
@51 // 8128
D=A // 8129
@SP // 8130
AM=M+1 // 8131
A=A-1 // 8132
M=D // 8133
@51 // 8134
D=A // 8135
@SP // 8136
AM=M+1 // 8137
A=A-1 // 8138
M=D // 8139
@51 // 8140
D=A // 8141
@SP // 8142
AM=M+1 // 8143
A=A-1 // 8144
M=D // 8145
@51 // 8146
D=A // 8147
@SP // 8148
AM=M+1 // 8149
A=A-1 // 8150
M=D // 8151
@51 // 8152
D=A // 8153
@SP // 8154
AM=M+1 // 8155
A=A-1 // 8156
M=D // 8157
@30 // 8158
D=A // 8159
@SP // 8160
AM=M+1 // 8161
A=A-1 // 8162
M=D // 8163
@SP // 8164
AM=M+1 // 8165
A=A-1 // 8166
M=0 // 8167
@SP // 8168
AM=M+1 // 8169
A=A-1 // 8170
M=0 // 8171
// call Output.create
@17 // 8172
D=A // 8173
@14 // 8174
M=D // 8175
@Output.create // 8176
D=A // 8177
@13 // 8178
M=D // 8179
@Output.initMap.ret.49 // 8180
D=A // 8181
@CALL // 8182
0;JMP // 8183
(Output.initMap.ret.49)
@SP // 8184
M=M-1 // 8185

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 8186
D=A // 8187
@SP // 8188
AM=M+1 // 8189
A=A-1 // 8190
M=D // 8191
@31 // 8192
D=A // 8193
@SP // 8194
AM=M+1 // 8195
A=A-1 // 8196
M=D // 8197
@51 // 8198
D=A // 8199
@SP // 8200
AM=M+1 // 8201
A=A-1 // 8202
M=D // 8203
@51 // 8204
D=A // 8205
@SP // 8206
AM=M+1 // 8207
A=A-1 // 8208
M=D // 8209
@51 // 8210
D=A // 8211
@SP // 8212
AM=M+1 // 8213
A=A-1 // 8214
M=D // 8215
@31 // 8216
D=A // 8217
@SP // 8218
AM=M+1 // 8219
A=A-1 // 8220
M=D // 8221
@3 // 8222
D=A // 8223
@SP // 8224
AM=M+1 // 8225
A=A-1 // 8226
M=D // 8227
@3 // 8228
D=A // 8229
@SP // 8230
AM=M+1 // 8231
A=A-1 // 8232
M=D // 8233
@3 // 8234
D=A // 8235
@SP // 8236
AM=M+1 // 8237
A=A-1 // 8238
M=D // 8239
@3 // 8240
D=A // 8241
@SP // 8242
AM=M+1 // 8243
A=A-1 // 8244
M=D // 8245
@SP // 8246
AM=M+1 // 8247
A=A-1 // 8248
M=0 // 8249
@SP // 8250
AM=M+1 // 8251
A=A-1 // 8252
M=0 // 8253
// call Output.create
@17 // 8254
D=A // 8255
@14 // 8256
M=D // 8257
@Output.create // 8258
D=A // 8259
@13 // 8260
M=D // 8261
@Output.initMap.ret.50 // 8262
D=A // 8263
@CALL // 8264
0;JMP // 8265
(Output.initMap.ret.50)
@SP // 8266
M=M-1 // 8267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 8268
D=A // 8269
@SP // 8270
AM=M+1 // 8271
A=A-1 // 8272
M=D // 8273
@30 // 8274
D=A // 8275
@SP // 8276
AM=M+1 // 8277
A=A-1 // 8278
M=D // 8279
@51 // 8280
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
@51 // 8298
D=A // 8299
@SP // 8300
AM=M+1 // 8301
A=A-1 // 8302
M=D // 8303
@51 // 8304
D=A // 8305
@SP // 8306
AM=M+1 // 8307
A=A-1 // 8308
M=D // 8309
@63 // 8310
D=A // 8311
@SP // 8312
AM=M+1 // 8313
A=A-1 // 8314
M=D // 8315
@59 // 8316
D=A // 8317
@SP // 8318
AM=M+1 // 8319
A=A-1 // 8320
M=D // 8321
@30 // 8322
D=A // 8323
@SP // 8324
AM=M+1 // 8325
A=A-1 // 8326
M=D // 8327
@48 // 8328
D=A // 8329
@SP // 8330
AM=M+1 // 8331
A=A-1 // 8332
M=D // 8333
@SP // 8334
AM=M+1 // 8335
A=A-1 // 8336
M=0 // 8337
// call Output.create
@17 // 8338
D=A // 8339
@14 // 8340
M=D // 8341
@Output.create // 8342
D=A // 8343
@13 // 8344
M=D // 8345
@Output.initMap.ret.51 // 8346
D=A // 8347
@CALL // 8348
0;JMP // 8349
(Output.initMap.ret.51)
@SP // 8350
M=M-1 // 8351

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8352
D=A // 8353
@SP // 8354
AM=M+1 // 8355
A=A-1 // 8356
M=D // 8357
@31 // 8358
D=A // 8359
@SP // 8360
AM=M+1 // 8361
A=A-1 // 8362
M=D // 8363
@51 // 8364
D=A // 8365
@SP // 8366
AM=M+1 // 8367
A=A-1 // 8368
M=D // 8369
@51 // 8370
D=A // 8371
@SP // 8372
AM=M+1 // 8373
A=A-1 // 8374
M=D // 8375
@51 // 8376
D=A // 8377
@SP // 8378
AM=M+1 // 8379
A=A-1 // 8380
M=D // 8381
@31 // 8382
D=A // 8383
@SP // 8384
AM=M+1 // 8385
A=A-1 // 8386
M=D // 8387
@27 // 8388
D=A // 8389
@SP // 8390
AM=M+1 // 8391
A=A-1 // 8392
M=D // 8393
@51 // 8394
D=A // 8395
@SP // 8396
AM=M+1 // 8397
A=A-1 // 8398
M=D // 8399
@51 // 8400
D=A // 8401
@SP // 8402
AM=M+1 // 8403
A=A-1 // 8404
M=D // 8405
@51 // 8406
D=A // 8407
@SP // 8408
AM=M+1 // 8409
A=A-1 // 8410
M=D // 8411
@SP // 8412
AM=M+1 // 8413
A=A-1 // 8414
M=0 // 8415
@SP // 8416
AM=M+1 // 8417
A=A-1 // 8418
M=0 // 8419
// call Output.create
@17 // 8420
D=A // 8421
@14 // 8422
M=D // 8423
@Output.create // 8424
D=A // 8425
@13 // 8426
M=D // 8427
@Output.initMap.ret.52 // 8428
D=A // 8429
@CALL // 8430
0;JMP // 8431
(Output.initMap.ret.52)
@SP // 8432
M=M-1 // 8433

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8434
D=A // 8435
@SP // 8436
AM=M+1 // 8437
A=A-1 // 8438
M=D // 8439
@30 // 8440
D=A // 8441
@SP // 8442
AM=M+1 // 8443
A=A-1 // 8444
M=D // 8445
@51 // 8446
D=A // 8447
@SP // 8448
AM=M+1 // 8449
A=A-1 // 8450
M=D // 8451
@51 // 8452
D=A // 8453
@SP // 8454
AM=M+1 // 8455
A=A-1 // 8456
M=D // 8457
@6 // 8458
D=A // 8459
@SP // 8460
AM=M+1 // 8461
A=A-1 // 8462
M=D // 8463
@28 // 8464
D=A // 8465
@SP // 8466
AM=M+1 // 8467
A=A-1 // 8468
M=D // 8469
@48 // 8470
D=A // 8471
@SP // 8472
AM=M+1 // 8473
A=A-1 // 8474
M=D // 8475
@51 // 8476
D=A // 8477
@SP // 8478
AM=M+1 // 8479
A=A-1 // 8480
M=D // 8481
@51 // 8482
D=A // 8483
@SP // 8484
AM=M+1 // 8485
A=A-1 // 8486
M=D // 8487
@30 // 8488
D=A // 8489
@SP // 8490
AM=M+1 // 8491
A=A-1 // 8492
M=D // 8493
@SP // 8494
AM=M+1 // 8495
A=A-1 // 8496
M=0 // 8497
@SP // 8498
AM=M+1 // 8499
A=A-1 // 8500
M=0 // 8501
// call Output.create
@17 // 8502
D=A // 8503
@14 // 8504
M=D // 8505
@Output.create // 8506
D=A // 8507
@13 // 8508
M=D // 8509
@Output.initMap.ret.53 // 8510
D=A // 8511
@CALL // 8512
0;JMP // 8513
(Output.initMap.ret.53)
@SP // 8514
M=M-1 // 8515

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8516
D=A // 8517
@SP // 8518
AM=M+1 // 8519
A=A-1 // 8520
M=D // 8521
@63 // 8522
D=A // 8523
@SP // 8524
AM=M+1 // 8525
A=A-1 // 8526
M=D // 8527
@63 // 8528
D=A // 8529
@SP // 8530
AM=M+1 // 8531
A=A-1 // 8532
M=D // 8533
@45 // 8534
D=A // 8535
@SP // 8536
AM=M+1 // 8537
A=A-1 // 8538
M=D // 8539
@12 // 8540
D=A // 8541
@SP // 8542
AM=M+1 // 8543
A=A-1 // 8544
M=D // 8545
@12 // 8546
D=A // 8547
@SP // 8548
AM=M+1 // 8549
A=A-1 // 8550
M=D // 8551
@12 // 8552
D=A // 8553
@SP // 8554
AM=M+1 // 8555
A=A-1 // 8556
M=D // 8557
@12 // 8558
D=A // 8559
@SP // 8560
AM=M+1 // 8561
A=A-1 // 8562
M=D // 8563
@12 // 8564
D=A // 8565
@SP // 8566
AM=M+1 // 8567
A=A-1 // 8568
M=D // 8569
@30 // 8570
D=A // 8571
@SP // 8572
AM=M+1 // 8573
A=A-1 // 8574
M=D // 8575
@SP // 8576
AM=M+1 // 8577
A=A-1 // 8578
M=0 // 8579
@SP // 8580
AM=M+1 // 8581
A=A-1 // 8582
M=0 // 8583
// call Output.create
@17 // 8584
D=A // 8585
@14 // 8586
M=D // 8587
@Output.create // 8588
D=A // 8589
@13 // 8590
M=D // 8591
@Output.initMap.ret.54 // 8592
D=A // 8593
@CALL // 8594
0;JMP // 8595
(Output.initMap.ret.54)
@SP // 8596
M=M-1 // 8597

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8598
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
@51 // 8610
D=A // 8611
@SP // 8612
AM=M+1 // 8613
A=A-1 // 8614
M=D // 8615
@51 // 8616
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
@51 // 8640
D=A // 8641
@SP // 8642
AM=M+1 // 8643
A=A-1 // 8644
M=D // 8645
@51 // 8646
D=A // 8647
@SP // 8648
AM=M+1 // 8649
A=A-1 // 8650
M=D // 8651
@30 // 8652
D=A // 8653
@SP // 8654
AM=M+1 // 8655
A=A-1 // 8656
M=D // 8657
@SP // 8658
AM=M+1 // 8659
A=A-1 // 8660
M=0 // 8661
@SP // 8662
AM=M+1 // 8663
A=A-1 // 8664
M=0 // 8665
// call Output.create
@17 // 8666
D=A // 8667
@14 // 8668
M=D // 8669
@Output.create // 8670
D=A // 8671
@13 // 8672
M=D // 8673
@Output.initMap.ret.55 // 8674
D=A // 8675
@CALL // 8676
0;JMP // 8677
(Output.initMap.ret.55)
@SP // 8678
M=M-1 // 8679

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8680
D=A // 8681
@SP // 8682
AM=M+1 // 8683
A=A-1 // 8684
M=D // 8685
@51 // 8686
D=A // 8687
@SP // 8688
AM=M+1 // 8689
A=A-1 // 8690
M=D // 8691
@51 // 8692
D=A // 8693
@SP // 8694
AM=M+1 // 8695
A=A-1 // 8696
M=D // 8697
@51 // 8698
D=A // 8699
@SP // 8700
AM=M+1 // 8701
A=A-1 // 8702
M=D // 8703
@51 // 8704
D=A // 8705
@SP // 8706
AM=M+1 // 8707
A=A-1 // 8708
M=D // 8709
@51 // 8710
D=A // 8711
@SP // 8712
AM=M+1 // 8713
A=A-1 // 8714
M=D // 8715
@30 // 8716
D=A // 8717
@SP // 8718
AM=M+1 // 8719
A=A-1 // 8720
M=D // 8721
@30 // 8722
D=A // 8723
@SP // 8724
AM=M+1 // 8725
A=A-1 // 8726
M=D // 8727
@12 // 8728
D=A // 8729
@SP // 8730
AM=M+1 // 8731
A=A-1 // 8732
M=D // 8733
@12 // 8734
D=A // 8735
@SP // 8736
AM=M+1 // 8737
A=A-1 // 8738
M=D // 8739
@SP // 8740
AM=M+1 // 8741
A=A-1 // 8742
M=0 // 8743
@SP // 8744
AM=M+1 // 8745
A=A-1 // 8746
M=0 // 8747
// call Output.create
@17 // 8748
D=A // 8749
@14 // 8750
M=D // 8751
@Output.create // 8752
D=A // 8753
@13 // 8754
M=D // 8755
@Output.initMap.ret.56 // 8756
D=A // 8757
@CALL // 8758
0;JMP // 8759
(Output.initMap.ret.56)
@SP // 8760
M=M-1 // 8761

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8762
D=A // 8763
@SP // 8764
AM=M+1 // 8765
A=A-1 // 8766
M=D // 8767
@51 // 8768
D=A // 8769
@SP // 8770
AM=M+1 // 8771
A=A-1 // 8772
M=D // 8773
@51 // 8774
D=A // 8775
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=D // 8779
@51 // 8780
D=A // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=D // 8785
@51 // 8786
D=A // 8787
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=D // 8791
@51 // 8792
D=A // 8793
@SP // 8794
AM=M+1 // 8795
A=A-1 // 8796
M=D // 8797
@63 // 8798
D=A // 8799
@SP // 8800
AM=M+1 // 8801
A=A-1 // 8802
M=D // 8803
@63 // 8804
D=A // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=D // 8809
@63 // 8810
D=A // 8811
@SP // 8812
AM=M+1 // 8813
A=A-1 // 8814
M=D // 8815
@18 // 8816
D=A // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=D // 8821
@SP // 8822
AM=M+1 // 8823
A=A-1 // 8824
M=0 // 8825
@SP // 8826
AM=M+1 // 8827
A=A-1 // 8828
M=0 // 8829
// call Output.create
@17 // 8830
D=A // 8831
@14 // 8832
M=D // 8833
@Output.create // 8834
D=A // 8835
@13 // 8836
M=D // 8837
@Output.initMap.ret.57 // 8838
D=A // 8839
@CALL // 8840
0;JMP // 8841
(Output.initMap.ret.57)
@SP // 8842
M=M-1 // 8843

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8844
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
@51 // 8856
D=A // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=D // 8861
@30 // 8862
D=A // 8863
@SP // 8864
AM=M+1 // 8865
A=A-1 // 8866
M=D // 8867
@30 // 8868
D=A // 8869
@SP // 8870
AM=M+1 // 8871
A=A-1 // 8872
M=D // 8873
@12 // 8874
D=A // 8875
@SP // 8876
AM=M+1 // 8877
A=A-1 // 8878
M=D // 8879
@30 // 8880
D=A // 8881
@SP // 8882
AM=M+1 // 8883
A=A-1 // 8884
M=D // 8885
@30 // 8886
D=A // 8887
@SP // 8888
AM=M+1 // 8889
A=A-1 // 8890
M=D // 8891
@51 // 8892
D=A // 8893
@SP // 8894
AM=M+1 // 8895
A=A-1 // 8896
M=D // 8897
@51 // 8898
D=A // 8899
@SP // 8900
AM=M+1 // 8901
A=A-1 // 8902
M=D // 8903
@SP // 8904
AM=M+1 // 8905
A=A-1 // 8906
M=0 // 8907
@SP // 8908
AM=M+1 // 8909
A=A-1 // 8910
M=0 // 8911
// call Output.create
@17 // 8912
D=A // 8913
@14 // 8914
M=D // 8915
@Output.create // 8916
D=A // 8917
@13 // 8918
M=D // 8919
@Output.initMap.ret.58 // 8920
D=A // 8921
@CALL // 8922
0;JMP // 8923
(Output.initMap.ret.58)
@SP // 8924
M=M-1 // 8925

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8926
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
@12 // 8962
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
@30 // 8980
D=A // 8981
@SP // 8982
AM=M+1 // 8983
A=A-1 // 8984
M=D // 8985
@SP // 8986
AM=M+1 // 8987
A=A-1 // 8988
M=0 // 8989
@SP // 8990
AM=M+1 // 8991
A=A-1 // 8992
M=0 // 8993
// call Output.create
@17 // 8994
D=A // 8995
@14 // 8996
M=D // 8997
@Output.create // 8998
D=A // 8999
@13 // 9000
M=D // 9001
@Output.initMap.ret.59 // 9002
D=A // 9003
@CALL // 9004
0;JMP // 9005
(Output.initMap.ret.59)
@SP // 9006
M=M-1 // 9007

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 9008
D=A // 9009
@SP // 9010
AM=M+1 // 9011
A=A-1 // 9012
M=D // 9013
@63 // 9014
D=A // 9015
@SP // 9016
AM=M+1 // 9017
A=A-1 // 9018
M=D // 9019
@51 // 9020
D=A // 9021
@SP // 9022
AM=M+1 // 9023
A=A-1 // 9024
M=D // 9025
@49 // 9026
D=A // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=D // 9031
@24 // 9032
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
@6 // 9044
D=A // 9045
@SP // 9046
AM=M+1 // 9047
A=A-1 // 9048
M=D // 9049
@35 // 9050
D=A // 9051
@SP // 9052
AM=M+1 // 9053
A=A-1 // 9054
M=D // 9055
@51 // 9056
D=A // 9057
@SP // 9058
AM=M+1 // 9059
A=A-1 // 9060
M=D // 9061
@63 // 9062
D=A // 9063
@SP // 9064
AM=M+1 // 9065
A=A-1 // 9066
M=D // 9067
@SP // 9068
AM=M+1 // 9069
A=A-1 // 9070
M=0 // 9071
@SP // 9072
AM=M+1 // 9073
A=A-1 // 9074
M=0 // 9075
// call Output.create
@17 // 9076
D=A // 9077
@14 // 9078
M=D // 9079
@Output.create // 9080
D=A // 9081
@13 // 9082
M=D // 9083
@Output.initMap.ret.60 // 9084
D=A // 9085
@CALL // 9086
0;JMP // 9087
(Output.initMap.ret.60)
@SP // 9088
M=M-1 // 9089

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 9090
D=A // 9091
@SP // 9092
AM=M+1 // 9093
A=A-1 // 9094
M=D // 9095
@30 // 9096
D=A // 9097
@SP // 9098
AM=M+1 // 9099
A=A-1 // 9100
M=D // 9101
@6 // 9102
D=A // 9103
@SP // 9104
AM=M+1 // 9105
A=A-1 // 9106
M=D // 9107
@6 // 9108
D=A // 9109
@SP // 9110
AM=M+1 // 9111
A=A-1 // 9112
M=D // 9113
@6 // 9114
D=A // 9115
@SP // 9116
AM=M+1 // 9117
A=A-1 // 9118
M=D // 9119
@6 // 9120
D=A // 9121
@SP // 9122
AM=M+1 // 9123
A=A-1 // 9124
M=D // 9125
@6 // 9126
D=A // 9127
@SP // 9128
AM=M+1 // 9129
A=A-1 // 9130
M=D // 9131
@6 // 9132
D=A // 9133
@SP // 9134
AM=M+1 // 9135
A=A-1 // 9136
M=D // 9137
@6 // 9138
D=A // 9139
@SP // 9140
AM=M+1 // 9141
A=A-1 // 9142
M=D // 9143
@30 // 9144
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
@Output.initMap.ret.61 // 9166
D=A // 9167
@CALL // 9168
0;JMP // 9169
(Output.initMap.ret.61)
@SP // 9170
M=M-1 // 9171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@92 // 9172
D=A // 9173
@SP // 9174
AM=M+1 // 9175
A=A-1 // 9176
M=D // 9177
@SP // 9178
AM=M+1 // 9179
A=A-1 // 9180
M=0 // 9181
@SP // 9182
AM=M+1 // 9183
A=A-1 // 9184
M=0 // 9185
@SP // 9186
AM=M+1 // 9187
A=A-1 // 9188
M=1 // 9189
@3 // 9190
D=A // 9191
@SP // 9192
AM=M+1 // 9193
A=A-1 // 9194
M=D // 9195
@6 // 9196
D=A // 9197
@SP // 9198
AM=M+1 // 9199
A=A-1 // 9200
M=D // 9201
@12 // 9202
D=A // 9203
@SP // 9204
AM=M+1 // 9205
A=A-1 // 9206
M=D // 9207
@24 // 9208
D=A // 9209
@SP // 9210
AM=M+1 // 9211
A=A-1 // 9212
M=D // 9213
@48 // 9214
D=A // 9215
@SP // 9216
AM=M+1 // 9217
A=A-1 // 9218
M=D // 9219
@32 // 9220
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
@Output.initMap.ret.62 // 9242
D=A // 9243
@CALL // 9244
0;JMP // 9245
(Output.initMap.ret.62)
@SP // 9246
M=M-1 // 9247

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 9248
D=A // 9249
@SP // 9250
AM=M+1 // 9251
A=A-1 // 9252
M=D // 9253
@30 // 9254
D=A // 9255
@SP // 9256
AM=M+1 // 9257
A=A-1 // 9258
M=D // 9259
@24 // 9260
D=A // 9261
@SP // 9262
AM=M+1 // 9263
A=A-1 // 9264
M=D // 9265
@24 // 9266
D=A // 9267
@SP // 9268
AM=M+1 // 9269
A=A-1 // 9270
M=D // 9271
@24 // 9272
D=A // 9273
@SP // 9274
AM=M+1 // 9275
A=A-1 // 9276
M=D // 9277
@24 // 9278
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
@24 // 9290
D=A // 9291
@SP // 9292
AM=M+1 // 9293
A=A-1 // 9294
M=D // 9295
@24 // 9296
D=A // 9297
@SP // 9298
AM=M+1 // 9299
A=A-1 // 9300
M=D // 9301
@30 // 9302
D=A // 9303
@SP // 9304
AM=M+1 // 9305
A=A-1 // 9306
M=D // 9307
@SP // 9308
AM=M+1 // 9309
A=A-1 // 9310
M=0 // 9311
@SP // 9312
AM=M+1 // 9313
A=A-1 // 9314
M=0 // 9315
// call Output.create
@17 // 9316
D=A // 9317
@14 // 9318
M=D // 9319
@Output.create // 9320
D=A // 9321
@13 // 9322
M=D // 9323
@Output.initMap.ret.63 // 9324
D=A // 9325
@CALL // 9326
0;JMP // 9327
(Output.initMap.ret.63)
@SP // 9328
M=M-1 // 9329

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 9330
D=A // 9331
@SP // 9332
AM=M+1 // 9333
A=A-1 // 9334
M=D // 9335
@8 // 9336
D=A // 9337
@SP // 9338
AM=M+1 // 9339
A=A-1 // 9340
M=D // 9341
@28 // 9342
D=A // 9343
@SP // 9344
AM=M+1 // 9345
A=A-1 // 9346
M=D // 9347
@54 // 9348
D=A // 9349
@SP // 9350
AM=M+1 // 9351
A=A-1 // 9352
M=D // 9353
@SP // 9354
AM=M+1 // 9355
A=A-1 // 9356
M=0 // 9357
@SP // 9358
AM=M+1 // 9359
A=A-1 // 9360
M=0 // 9361
@SP // 9362
AM=M+1 // 9363
A=A-1 // 9364
M=0 // 9365
@SP // 9366
AM=M+1 // 9367
A=A-1 // 9368
M=0 // 9369
@SP // 9370
AM=M+1 // 9371
A=A-1 // 9372
M=0 // 9373
@SP // 9374
AM=M+1 // 9375
A=A-1 // 9376
M=0 // 9377
@SP // 9378
AM=M+1 // 9379
A=A-1 // 9380
M=0 // 9381
@SP // 9382
AM=M+1 // 9383
A=A-1 // 9384
M=0 // 9385
// call Output.create
@17 // 9386
D=A // 9387
@14 // 9388
M=D // 9389
@Output.create // 9390
D=A // 9391
@13 // 9392
M=D // 9393
@Output.initMap.ret.64 // 9394
D=A // 9395
@CALL // 9396
0;JMP // 9397
(Output.initMap.ret.64)
@SP // 9398
M=M-1 // 9399

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@95 // 9400
D=A // 9401
@SP // 9402
AM=M+1 // 9403
A=A-1 // 9404
M=D // 9405
@SP // 9406
AM=M+1 // 9407
A=A-1 // 9408
M=0 // 9409
@SP // 9410
AM=M+1 // 9411
A=A-1 // 9412
M=0 // 9413
@SP // 9414
AM=M+1 // 9415
A=A-1 // 9416
M=0 // 9417
@SP // 9418
AM=M+1 // 9419
A=A-1 // 9420
M=0 // 9421
@SP // 9422
AM=M+1 // 9423
A=A-1 // 9424
M=0 // 9425
@SP // 9426
AM=M+1 // 9427
A=A-1 // 9428
M=0 // 9429
@SP // 9430
AM=M+1 // 9431
A=A-1 // 9432
M=0 // 9433
@SP // 9434
AM=M+1 // 9435
A=A-1 // 9436
M=0 // 9437
@SP // 9438
AM=M+1 // 9439
A=A-1 // 9440
M=0 // 9441
@63 // 9442
D=A // 9443
@SP // 9444
AM=M+1 // 9445
A=A-1 // 9446
M=D // 9447
@SP // 9448
AM=M+1 // 9449
A=A-1 // 9450
M=0 // 9451
// call Output.create
@17 // 9452
D=A // 9453
@14 // 9454
M=D // 9455
@Output.create // 9456
D=A // 9457
@13 // 9458
M=D // 9459
@Output.initMap.ret.65 // 9460
D=A // 9461
@CALL // 9462
0;JMP // 9463
(Output.initMap.ret.65)
@SP // 9464
M=M-1 // 9465

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9466
D=A // 9467
@SP // 9468
AM=M+1 // 9469
A=A-1 // 9470
M=D // 9471
@6 // 9472
D=A // 9473
@SP // 9474
AM=M+1 // 9475
A=A-1 // 9476
M=D // 9477
@12 // 9478
D=A // 9479
@SP // 9480
AM=M+1 // 9481
A=A-1 // 9482
M=D // 9483
@24 // 9484
D=A // 9485
@SP // 9486
AM=M+1 // 9487
A=A-1 // 9488
M=D // 9489
@SP // 9490
AM=M+1 // 9491
A=A-1 // 9492
M=0 // 9493
@SP // 9494
AM=M+1 // 9495
A=A-1 // 9496
M=0 // 9497
@SP // 9498
AM=M+1 // 9499
A=A-1 // 9500
M=0 // 9501
@SP // 9502
AM=M+1 // 9503
A=A-1 // 9504
M=0 // 9505
@SP // 9506
AM=M+1 // 9507
A=A-1 // 9508
M=0 // 9509
@SP // 9510
AM=M+1 // 9511
A=A-1 // 9512
M=0 // 9513
@SP // 9514
AM=M+1 // 9515
A=A-1 // 9516
M=0 // 9517
@SP // 9518
AM=M+1 // 9519
A=A-1 // 9520
M=0 // 9521
// call Output.create
@17 // 9522
D=A // 9523
@14 // 9524
M=D // 9525
@Output.create // 9526
D=A // 9527
@13 // 9528
M=D // 9529
@Output.initMap.ret.66 // 9530
D=A // 9531
@CALL // 9532
0;JMP // 9533
(Output.initMap.ret.66)
@SP // 9534
M=M-1 // 9535

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@97 // 9536
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
@SP // 9550
AM=M+1 // 9551
A=A-1 // 9552
M=0 // 9553
@14 // 9554
D=A // 9555
@SP // 9556
AM=M+1 // 9557
A=A-1 // 9558
M=D // 9559
@24 // 9560
D=A // 9561
@SP // 9562
AM=M+1 // 9563
A=A-1 // 9564
M=D // 9565
@30 // 9566
D=A // 9567
@SP // 9568
AM=M+1 // 9569
A=A-1 // 9570
M=D // 9571
@27 // 9572
D=A // 9573
@SP // 9574
AM=M+1 // 9575
A=A-1 // 9576
M=D // 9577
@27 // 9578
D=A // 9579
@SP // 9580
AM=M+1 // 9581
A=A-1 // 9582
M=D // 9583
@54 // 9584
D=A // 9585
@SP // 9586
AM=M+1 // 9587
A=A-1 // 9588
M=D // 9589
@SP // 9590
AM=M+1 // 9591
A=A-1 // 9592
M=0 // 9593
@SP // 9594
AM=M+1 // 9595
A=A-1 // 9596
M=0 // 9597
// call Output.create
@17 // 9598
D=A // 9599
@14 // 9600
M=D // 9601
@Output.create // 9602
D=A // 9603
@13 // 9604
M=D // 9605
@Output.initMap.ret.67 // 9606
D=A // 9607
@CALL // 9608
0;JMP // 9609
(Output.initMap.ret.67)
@SP // 9610
M=M-1 // 9611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9612
D=A // 9613
@SP // 9614
AM=M+1 // 9615
A=A-1 // 9616
M=D // 9617
@3 // 9618
D=A // 9619
@SP // 9620
AM=M+1 // 9621
A=A-1 // 9622
M=D // 9623
@3 // 9624
D=A // 9625
@SP // 9626
AM=M+1 // 9627
A=A-1 // 9628
M=D // 9629
@3 // 9630
D=A // 9631
@SP // 9632
AM=M+1 // 9633
A=A-1 // 9634
M=D // 9635
@15 // 9636
D=A // 9637
@SP // 9638
AM=M+1 // 9639
A=A-1 // 9640
M=D // 9641
@27 // 9642
D=A // 9643
@SP // 9644
AM=M+1 // 9645
A=A-1 // 9646
M=D // 9647
@51 // 9648
D=A // 9649
@SP // 9650
AM=M+1 // 9651
A=A-1 // 9652
M=D // 9653
@51 // 9654
D=A // 9655
@SP // 9656
AM=M+1 // 9657
A=A-1 // 9658
M=D // 9659
@51 // 9660
D=A // 9661
@SP // 9662
AM=M+1 // 9663
A=A-1 // 9664
M=D // 9665
@30 // 9666
D=A // 9667
@SP // 9668
AM=M+1 // 9669
A=A-1 // 9670
M=D // 9671
@SP // 9672
AM=M+1 // 9673
A=A-1 // 9674
M=0 // 9675
@SP // 9676
AM=M+1 // 9677
A=A-1 // 9678
M=0 // 9679
// call Output.create
@17 // 9680
D=A // 9681
@14 // 9682
M=D // 9683
@Output.create // 9684
D=A // 9685
@13 // 9686
M=D // 9687
@Output.initMap.ret.68 // 9688
D=A // 9689
@CALL // 9690
0;JMP // 9691
(Output.initMap.ret.68)
@SP // 9692
M=M-1 // 9693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@99 // 9694
D=A // 9695
@SP // 9696
AM=M+1 // 9697
A=A-1 // 9698
M=D // 9699
@SP // 9700
AM=M+1 // 9701
A=A-1 // 9702
M=0 // 9703
@SP // 9704
AM=M+1 // 9705
A=A-1 // 9706
M=0 // 9707
@SP // 9708
AM=M+1 // 9709
A=A-1 // 9710
M=0 // 9711
@30 // 9712
D=A // 9713
@SP // 9714
AM=M+1 // 9715
A=A-1 // 9716
M=D // 9717
@51 // 9718
D=A // 9719
@SP // 9720
AM=M+1 // 9721
A=A-1 // 9722
M=D // 9723
@3 // 9724
D=A // 9725
@SP // 9726
AM=M+1 // 9727
A=A-1 // 9728
M=D // 9729
@3 // 9730
D=A // 9731
@SP // 9732
AM=M+1 // 9733
A=A-1 // 9734
M=D // 9735
@51 // 9736
D=A // 9737
@SP // 9738
AM=M+1 // 9739
A=A-1 // 9740
M=D // 9741
@30 // 9742
D=A // 9743
@SP // 9744
AM=M+1 // 9745
A=A-1 // 9746
M=D // 9747
@SP // 9748
AM=M+1 // 9749
A=A-1 // 9750
M=0 // 9751
@SP // 9752
AM=M+1 // 9753
A=A-1 // 9754
M=0 // 9755
// call Output.create
@17 // 9756
D=A // 9757
@14 // 9758
M=D // 9759
@Output.create // 9760
D=A // 9761
@13 // 9762
M=D // 9763
@Output.initMap.ret.69 // 9764
D=A // 9765
@CALL // 9766
0;JMP // 9767
(Output.initMap.ret.69)
@SP // 9768
M=M-1 // 9769

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9770
D=A // 9771
@SP // 9772
AM=M+1 // 9773
A=A-1 // 9774
M=D // 9775
@48 // 9776
D=A // 9777
@SP // 9778
AM=M+1 // 9779
A=A-1 // 9780
M=D // 9781
@48 // 9782
D=A // 9783
@SP // 9784
AM=M+1 // 9785
A=A-1 // 9786
M=D // 9787
@48 // 9788
D=A // 9789
@SP // 9790
AM=M+1 // 9791
A=A-1 // 9792
M=D // 9793
@60 // 9794
D=A // 9795
@SP // 9796
AM=M+1 // 9797
A=A-1 // 9798
M=D // 9799
@54 // 9800
D=A // 9801
@SP // 9802
AM=M+1 // 9803
A=A-1 // 9804
M=D // 9805
@51 // 9806
D=A // 9807
@SP // 9808
AM=M+1 // 9809
A=A-1 // 9810
M=D // 9811
@51 // 9812
D=A // 9813
@SP // 9814
AM=M+1 // 9815
A=A-1 // 9816
M=D // 9817
@51 // 9818
D=A // 9819
@SP // 9820
AM=M+1 // 9821
A=A-1 // 9822
M=D // 9823
@30 // 9824
D=A // 9825
@SP // 9826
AM=M+1 // 9827
A=A-1 // 9828
M=D // 9829
@SP // 9830
AM=M+1 // 9831
A=A-1 // 9832
M=0 // 9833
@SP // 9834
AM=M+1 // 9835
A=A-1 // 9836
M=0 // 9837
// call Output.create
@17 // 9838
D=A // 9839
@14 // 9840
M=D // 9841
@Output.create // 9842
D=A // 9843
@13 // 9844
M=D // 9845
@Output.initMap.ret.70 // 9846
D=A // 9847
@CALL // 9848
0;JMP // 9849
(Output.initMap.ret.70)
@SP // 9850
M=M-1 // 9851

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@101 // 9852
D=A // 9853
@SP // 9854
AM=M+1 // 9855
A=A-1 // 9856
M=D // 9857
@SP // 9858
AM=M+1 // 9859
A=A-1 // 9860
M=0 // 9861
@SP // 9862
AM=M+1 // 9863
A=A-1 // 9864
M=0 // 9865
@SP // 9866
AM=M+1 // 9867
A=A-1 // 9868
M=0 // 9869
@30 // 9870
D=A // 9871
@SP // 9872
AM=M+1 // 9873
A=A-1 // 9874
M=D // 9875
@51 // 9876
D=A // 9877
@SP // 9878
AM=M+1 // 9879
A=A-1 // 9880
M=D // 9881
@63 // 9882
D=A // 9883
@SP // 9884
AM=M+1 // 9885
A=A-1 // 9886
M=D // 9887
@3 // 9888
D=A // 9889
@SP // 9890
AM=M+1 // 9891
A=A-1 // 9892
M=D // 9893
@51 // 9894
D=A // 9895
@SP // 9896
AM=M+1 // 9897
A=A-1 // 9898
M=D // 9899
@30 // 9900
D=A // 9901
@SP // 9902
AM=M+1 // 9903
A=A-1 // 9904
M=D // 9905
@SP // 9906
AM=M+1 // 9907
A=A-1 // 9908
M=0 // 9909
@SP // 9910
AM=M+1 // 9911
A=A-1 // 9912
M=0 // 9913
// call Output.create
@17 // 9914
D=A // 9915
@14 // 9916
M=D // 9917
@Output.create // 9918
D=A // 9919
@13 // 9920
M=D // 9921
@Output.initMap.ret.71 // 9922
D=A // 9923
@CALL // 9924
0;JMP // 9925
(Output.initMap.ret.71)
@SP // 9926
M=M-1 // 9927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9928
D=A // 9929
@SP // 9930
AM=M+1 // 9931
A=A-1 // 9932
M=D // 9933
@28 // 9934
D=A // 9935
@SP // 9936
AM=M+1 // 9937
A=A-1 // 9938
M=D // 9939
@54 // 9940
D=A // 9941
@SP // 9942
AM=M+1 // 9943
A=A-1 // 9944
M=D // 9945
@38 // 9946
D=A // 9947
@SP // 9948
AM=M+1 // 9949
A=A-1 // 9950
M=D // 9951
@6 // 9952
D=A // 9953
@SP // 9954
AM=M+1 // 9955
A=A-1 // 9956
M=D // 9957
@15 // 9958
D=A // 9959
@SP // 9960
AM=M+1 // 9961
A=A-1 // 9962
M=D // 9963
@6 // 9964
D=A // 9965
@SP // 9966
AM=M+1 // 9967
A=A-1 // 9968
M=D // 9969
@6 // 9970
D=A // 9971
@SP // 9972
AM=M+1 // 9973
A=A-1 // 9974
M=D // 9975
@6 // 9976
D=A // 9977
@SP // 9978
AM=M+1 // 9979
A=A-1 // 9980
M=D // 9981
@15 // 9982
D=A // 9983
@SP // 9984
AM=M+1 // 9985
A=A-1 // 9986
M=D // 9987
@SP // 9988
AM=M+1 // 9989
A=A-1 // 9990
M=0 // 9991
@SP // 9992
AM=M+1 // 9993
A=A-1 // 9994
M=0 // 9995
// call Output.create
@17 // 9996
D=A // 9997
@14 // 9998
M=D // 9999
@Output.create // 10000
D=A // 10001
@13 // 10002
M=D // 10003
@Output.initMap.ret.72 // 10004
D=A // 10005
@CALL // 10006
0;JMP // 10007
(Output.initMap.ret.72)
@SP // 10008
M=M-1 // 10009

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@103 // 10010
D=A // 10011
@SP // 10012
AM=M+1 // 10013
A=A-1 // 10014
M=D // 10015
@SP // 10016
AM=M+1 // 10017
A=A-1 // 10018
M=0 // 10019
@SP // 10020
AM=M+1 // 10021
A=A-1 // 10022
M=0 // 10023
@30 // 10024
D=A // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=D // 10029
@51 // 10030
D=A // 10031
@SP // 10032
AM=M+1 // 10033
A=A-1 // 10034
M=D // 10035
@51 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041
@51 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047
@62 // 10048
D=A // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=D // 10053
@48 // 10054
D=A // 10055
@SP // 10056
AM=M+1 // 10057
A=A-1 // 10058
M=D // 10059
@51 // 10060
D=A // 10061
@SP // 10062
AM=M+1 // 10063
A=A-1 // 10064
M=D // 10065
@30 // 10066
D=A // 10067
@SP // 10068
AM=M+1 // 10069
A=A-1 // 10070
M=D // 10071
@SP // 10072
AM=M+1 // 10073
A=A-1 // 10074
M=0 // 10075
// call Output.create
@17 // 10076
D=A // 10077
@14 // 10078
M=D // 10079
@Output.create // 10080
D=A // 10081
@13 // 10082
M=D // 10083
@Output.initMap.ret.73 // 10084
D=A // 10085
@CALL // 10086
0;JMP // 10087
(Output.initMap.ret.73)
@SP // 10088
M=M-1 // 10089

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 10090
D=A // 10091
@SP // 10092
AM=M+1 // 10093
A=A-1 // 10094
M=D // 10095
@3 // 10096
D=A // 10097
@SP // 10098
AM=M+1 // 10099
A=A-1 // 10100
M=D // 10101
@3 // 10102
D=A // 10103
@SP // 10104
AM=M+1 // 10105
A=A-1 // 10106
M=D // 10107
@3 // 10108
D=A // 10109
@SP // 10110
AM=M+1 // 10111
A=A-1 // 10112
M=D // 10113
@27 // 10114
D=A // 10115
@SP // 10116
AM=M+1 // 10117
A=A-1 // 10118
M=D // 10119
@55 // 10120
D=A // 10121
@SP // 10122
AM=M+1 // 10123
A=A-1 // 10124
M=D // 10125
@51 // 10126
D=A // 10127
@SP // 10128
AM=M+1 // 10129
A=A-1 // 10130
M=D // 10131
@51 // 10132
D=A // 10133
@SP // 10134
AM=M+1 // 10135
A=A-1 // 10136
M=D // 10137
@51 // 10138
D=A // 10139
@SP // 10140
AM=M+1 // 10141
A=A-1 // 10142
M=D // 10143
@51 // 10144
D=A // 10145
@SP // 10146
AM=M+1 // 10147
A=A-1 // 10148
M=D // 10149
@SP // 10150
AM=M+1 // 10151
A=A-1 // 10152
M=0 // 10153
@SP // 10154
AM=M+1 // 10155
A=A-1 // 10156
M=0 // 10157
// call Output.create
@17 // 10158
D=A // 10159
@14 // 10160
M=D // 10161
@Output.create // 10162
D=A // 10163
@13 // 10164
M=D // 10165
@Output.initMap.ret.74 // 10166
D=A // 10167
@CALL // 10168
0;JMP // 10169
(Output.initMap.ret.74)
@SP // 10170
M=M-1 // 10171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 10172
D=A // 10173
@SP // 10174
AM=M+1 // 10175
A=A-1 // 10176
M=D // 10177
@12 // 10178
D=A // 10179
@SP // 10180
AM=M+1 // 10181
A=A-1 // 10182
M=D // 10183
@12 // 10184
D=A // 10185
@SP // 10186
AM=M+1 // 10187
A=A-1 // 10188
M=D // 10189
@SP // 10190
AM=M+1 // 10191
A=A-1 // 10192
M=0 // 10193
@14 // 10194
D=A // 10195
@SP // 10196
AM=M+1 // 10197
A=A-1 // 10198
M=D // 10199
@12 // 10200
D=A // 10201
@SP // 10202
AM=M+1 // 10203
A=A-1 // 10204
M=D // 10205
@12 // 10206
D=A // 10207
@SP // 10208
AM=M+1 // 10209
A=A-1 // 10210
M=D // 10211
@12 // 10212
D=A // 10213
@SP // 10214
AM=M+1 // 10215
A=A-1 // 10216
M=D // 10217
@12 // 10218
D=A // 10219
@SP // 10220
AM=M+1 // 10221
A=A-1 // 10222
M=D // 10223
@30 // 10224
D=A // 10225
@SP // 10226
AM=M+1 // 10227
A=A-1 // 10228
M=D // 10229
@SP // 10230
AM=M+1 // 10231
A=A-1 // 10232
M=0 // 10233
@SP // 10234
AM=M+1 // 10235
A=A-1 // 10236
M=0 // 10237
// call Output.create
@17 // 10238
D=A // 10239
@14 // 10240
M=D // 10241
@Output.create // 10242
D=A // 10243
@13 // 10244
M=D // 10245
@Output.initMap.ret.75 // 10246
D=A // 10247
@CALL // 10248
0;JMP // 10249
(Output.initMap.ret.75)
@SP // 10250
M=M-1 // 10251

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 10252
D=A // 10253
@SP // 10254
AM=M+1 // 10255
A=A-1 // 10256
M=D // 10257
@48 // 10258
D=A // 10259
@SP // 10260
AM=M+1 // 10261
A=A-1 // 10262
M=D // 10263
@48 // 10264
D=A // 10265
@SP // 10266
AM=M+1 // 10267
A=A-1 // 10268
M=D // 10269
@SP // 10270
AM=M+1 // 10271
A=A-1 // 10272
M=0 // 10273
@56 // 10274
D=A // 10275
@SP // 10276
AM=M+1 // 10277
A=A-1 // 10278
M=D // 10279
@48 // 10280
D=A // 10281
@SP // 10282
AM=M+1 // 10283
A=A-1 // 10284
M=D // 10285
@48 // 10286
D=A // 10287
@SP // 10288
AM=M+1 // 10289
A=A-1 // 10290
M=D // 10291
@48 // 10292
D=A // 10293
@SP // 10294
AM=M+1 // 10295
A=A-1 // 10296
M=D // 10297
@48 // 10298
D=A // 10299
@SP // 10300
AM=M+1 // 10301
A=A-1 // 10302
M=D // 10303
@51 // 10304
D=A // 10305
@SP // 10306
AM=M+1 // 10307
A=A-1 // 10308
M=D // 10309
@30 // 10310
D=A // 10311
@SP // 10312
AM=M+1 // 10313
A=A-1 // 10314
M=D // 10315
@SP // 10316
AM=M+1 // 10317
A=A-1 // 10318
M=0 // 10319
// call Output.create
@17 // 10320
D=A // 10321
@14 // 10322
M=D // 10323
@Output.create // 10324
D=A // 10325
@13 // 10326
M=D // 10327
@Output.initMap.ret.76 // 10328
D=A // 10329
@CALL // 10330
0;JMP // 10331
(Output.initMap.ret.76)
@SP // 10332
M=M-1 // 10333

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 10334
D=A // 10335
@SP // 10336
AM=M+1 // 10337
A=A-1 // 10338
M=D // 10339
@3 // 10340
D=A // 10341
@SP // 10342
AM=M+1 // 10343
A=A-1 // 10344
M=D // 10345
@3 // 10346
D=A // 10347
@SP // 10348
AM=M+1 // 10349
A=A-1 // 10350
M=D // 10351
@3 // 10352
D=A // 10353
@SP // 10354
AM=M+1 // 10355
A=A-1 // 10356
M=D // 10357
@51 // 10358
D=A // 10359
@SP // 10360
AM=M+1 // 10361
A=A-1 // 10362
M=D // 10363
@27 // 10364
D=A // 10365
@SP // 10366
AM=M+1 // 10367
A=A-1 // 10368
M=D // 10369
@15 // 10370
D=A // 10371
@SP // 10372
AM=M+1 // 10373
A=A-1 // 10374
M=D // 10375
@15 // 10376
D=A // 10377
@SP // 10378
AM=M+1 // 10379
A=A-1 // 10380
M=D // 10381
@27 // 10382
D=A // 10383
@SP // 10384
AM=M+1 // 10385
A=A-1 // 10386
M=D // 10387
@51 // 10388
D=A // 10389
@SP // 10390
AM=M+1 // 10391
A=A-1 // 10392
M=D // 10393
@SP // 10394
AM=M+1 // 10395
A=A-1 // 10396
M=0 // 10397
@SP // 10398
AM=M+1 // 10399
A=A-1 // 10400
M=0 // 10401
// call Output.create
@17 // 10402
D=A // 10403
@14 // 10404
M=D // 10405
@Output.create // 10406
D=A // 10407
@13 // 10408
M=D // 10409
@Output.initMap.ret.77 // 10410
D=A // 10411
@CALL // 10412
0;JMP // 10413
(Output.initMap.ret.77)
@SP // 10414
M=M-1 // 10415

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10416
D=A // 10417
@SP // 10418
AM=M+1 // 10419
A=A-1 // 10420
M=D // 10421
@14 // 10422
D=A // 10423
@SP // 10424
AM=M+1 // 10425
A=A-1 // 10426
M=D // 10427
@12 // 10428
D=A // 10429
@SP // 10430
AM=M+1 // 10431
A=A-1 // 10432
M=D // 10433
@12 // 10434
D=A // 10435
@SP // 10436
AM=M+1 // 10437
A=A-1 // 10438
M=D // 10439
@12 // 10440
D=A // 10441
@SP // 10442
AM=M+1 // 10443
A=A-1 // 10444
M=D // 10445
@12 // 10446
D=A // 10447
@SP // 10448
AM=M+1 // 10449
A=A-1 // 10450
M=D // 10451
@12 // 10452
D=A // 10453
@SP // 10454
AM=M+1 // 10455
A=A-1 // 10456
M=D // 10457
@12 // 10458
D=A // 10459
@SP // 10460
AM=M+1 // 10461
A=A-1 // 10462
M=D // 10463
@12 // 10464
D=A // 10465
@SP // 10466
AM=M+1 // 10467
A=A-1 // 10468
M=D // 10469
@30 // 10470
D=A // 10471
@SP // 10472
AM=M+1 // 10473
A=A-1 // 10474
M=D // 10475
@SP // 10476
AM=M+1 // 10477
A=A-1 // 10478
M=0 // 10479
@SP // 10480
AM=M+1 // 10481
A=A-1 // 10482
M=0 // 10483
// call Output.create
@17 // 10484
D=A // 10485
@14 // 10486
M=D // 10487
@Output.create // 10488
D=A // 10489
@13 // 10490
M=D // 10491
@Output.initMap.ret.78 // 10492
D=A // 10493
@CALL // 10494
0;JMP // 10495
(Output.initMap.ret.78)
@SP // 10496
M=M-1 // 10497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@109 // 10498
D=A // 10499
@SP // 10500
AM=M+1 // 10501
A=A-1 // 10502
M=D // 10503
@SP // 10504
AM=M+1 // 10505
A=A-1 // 10506
M=0 // 10507
@SP // 10508
AM=M+1 // 10509
A=A-1 // 10510
M=0 // 10511
@SP // 10512
AM=M+1 // 10513
A=A-1 // 10514
M=0 // 10515
@29 // 10516
D=A // 10517
@SP // 10518
AM=M+1 // 10519
A=A-1 // 10520
M=D // 10521
@63 // 10522
D=A // 10523
@SP // 10524
AM=M+1 // 10525
A=A-1 // 10526
M=D // 10527
@43 // 10528
D=A // 10529
@SP // 10530
AM=M+1 // 10531
A=A-1 // 10532
M=D // 10533
@43 // 10534
D=A // 10535
@SP // 10536
AM=M+1 // 10537
A=A-1 // 10538
M=D // 10539
@43 // 10540
D=A // 10541
@SP // 10542
AM=M+1 // 10543
A=A-1 // 10544
M=D // 10545
@43 // 10546
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
@Output.initMap.ret.79 // 10568
D=A // 10569
@CALL // 10570
0;JMP // 10571
(Output.initMap.ret.79)
@SP // 10572
M=M-1 // 10573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@110 // 10574
D=A // 10575
@SP // 10576
AM=M+1 // 10577
A=A-1 // 10578
M=D // 10579
@SP // 10580
AM=M+1 // 10581
A=A-1 // 10582
M=0 // 10583
@SP // 10584
AM=M+1 // 10585
A=A-1 // 10586
M=0 // 10587
@SP // 10588
AM=M+1 // 10589
A=A-1 // 10590
M=0 // 10591
@29 // 10592
D=A // 10593
@SP // 10594
AM=M+1 // 10595
A=A-1 // 10596
M=D // 10597
@51 // 10598
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
@51 // 10610
D=A // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=D // 10615
@51 // 10616
D=A // 10617
@SP // 10618
AM=M+1 // 10619
A=A-1 // 10620
M=D // 10621
@51 // 10622
D=A // 10623
@SP // 10624
AM=M+1 // 10625
A=A-1 // 10626
M=D // 10627
@SP // 10628
AM=M+1 // 10629
A=A-1 // 10630
M=0 // 10631
@SP // 10632
AM=M+1 // 10633
A=A-1 // 10634
M=0 // 10635
// call Output.create
@17 // 10636
D=A // 10637
@14 // 10638
M=D // 10639
@Output.create // 10640
D=A // 10641
@13 // 10642
M=D // 10643
@Output.initMap.ret.80 // 10644
D=A // 10645
@CALL // 10646
0;JMP // 10647
(Output.initMap.ret.80)
@SP // 10648
M=M-1 // 10649

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@111 // 10650
D=A // 10651
@SP // 10652
AM=M+1 // 10653
A=A-1 // 10654
M=D // 10655
@SP // 10656
AM=M+1 // 10657
A=A-1 // 10658
M=0 // 10659
@SP // 10660
AM=M+1 // 10661
A=A-1 // 10662
M=0 // 10663
@SP // 10664
AM=M+1 // 10665
A=A-1 // 10666
M=0 // 10667
@30 // 10668
D=A // 10669
@SP // 10670
AM=M+1 // 10671
A=A-1 // 10672
M=D // 10673
@51 // 10674
D=A // 10675
@SP // 10676
AM=M+1 // 10677
A=A-1 // 10678
M=D // 10679
@51 // 10680
D=A // 10681
@SP // 10682
AM=M+1 // 10683
A=A-1 // 10684
M=D // 10685
@51 // 10686
D=A // 10687
@SP // 10688
AM=M+1 // 10689
A=A-1 // 10690
M=D // 10691
@51 // 10692
D=A // 10693
@SP // 10694
AM=M+1 // 10695
A=A-1 // 10696
M=D // 10697
@30 // 10698
D=A // 10699
@SP // 10700
AM=M+1 // 10701
A=A-1 // 10702
M=D // 10703
@SP // 10704
AM=M+1 // 10705
A=A-1 // 10706
M=0 // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=0 // 10711
// call Output.create
@17 // 10712
D=A // 10713
@14 // 10714
M=D // 10715
@Output.create // 10716
D=A // 10717
@13 // 10718
M=D // 10719
@Output.initMap.ret.81 // 10720
D=A // 10721
@CALL // 10722
0;JMP // 10723
(Output.initMap.ret.81)
@SP // 10724
M=M-1 // 10725

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@112 // 10726
D=A // 10727
@SP // 10728
AM=M+1 // 10729
A=A-1 // 10730
M=D // 10731
@SP // 10732
AM=M+1 // 10733
A=A-1 // 10734
M=0 // 10735
@SP // 10736
AM=M+1 // 10737
A=A-1 // 10738
M=0 // 10739
@SP // 10740
AM=M+1 // 10741
A=A-1 // 10742
M=0 // 10743
@30 // 10744
D=A // 10745
@SP // 10746
AM=M+1 // 10747
A=A-1 // 10748
M=D // 10749
@51 // 10750
D=A // 10751
@SP // 10752
AM=M+1 // 10753
A=A-1 // 10754
M=D // 10755
@51 // 10756
D=A // 10757
@SP // 10758
AM=M+1 // 10759
A=A-1 // 10760
M=D // 10761
@51 // 10762
D=A // 10763
@SP // 10764
AM=M+1 // 10765
A=A-1 // 10766
M=D // 10767
@31 // 10768
D=A // 10769
@SP // 10770
AM=M+1 // 10771
A=A-1 // 10772
M=D // 10773
@3 // 10774
D=A // 10775
@SP // 10776
AM=M+1 // 10777
A=A-1 // 10778
M=D // 10779
@3 // 10780
D=A // 10781
@SP // 10782
AM=M+1 // 10783
A=A-1 // 10784
M=D // 10785
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
@Output.initMap.ret.82 // 10798
D=A // 10799
@CALL // 10800
0;JMP // 10801
(Output.initMap.ret.82)
@SP // 10802
M=M-1 // 10803

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@113 // 10804
D=A // 10805
@SP // 10806
AM=M+1 // 10807
A=A-1 // 10808
M=D // 10809
@SP // 10810
AM=M+1 // 10811
A=A-1 // 10812
M=0 // 10813
@SP // 10814
AM=M+1 // 10815
A=A-1 // 10816
M=0 // 10817
@SP // 10818
AM=M+1 // 10819
A=A-1 // 10820
M=0 // 10821
@30 // 10822
D=A // 10823
@SP // 10824
AM=M+1 // 10825
A=A-1 // 10826
M=D // 10827
@51 // 10828
D=A // 10829
@SP // 10830
AM=M+1 // 10831
A=A-1 // 10832
M=D // 10833
@51 // 10834
D=A // 10835
@SP // 10836
AM=M+1 // 10837
A=A-1 // 10838
M=D // 10839
@51 // 10840
D=A // 10841
@SP // 10842
AM=M+1 // 10843
A=A-1 // 10844
M=D // 10845
@62 // 10846
D=A // 10847
@SP // 10848
AM=M+1 // 10849
A=A-1 // 10850
M=D // 10851
@48 // 10852
D=A // 10853
@SP // 10854
AM=M+1 // 10855
A=A-1 // 10856
M=D // 10857
@48 // 10858
D=A // 10859
@SP // 10860
AM=M+1 // 10861
A=A-1 // 10862
M=D // 10863
@SP // 10864
AM=M+1 // 10865
A=A-1 // 10866
M=0 // 10867
// call Output.create
@17 // 10868
D=A // 10869
@14 // 10870
M=D // 10871
@Output.create // 10872
D=A // 10873
@13 // 10874
M=D // 10875
@Output.initMap.ret.83 // 10876
D=A // 10877
@CALL // 10878
0;JMP // 10879
(Output.initMap.ret.83)
@SP // 10880
M=M-1 // 10881

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@114 // 10882
D=A // 10883
@SP // 10884
AM=M+1 // 10885
A=A-1 // 10886
M=D // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=0 // 10891
@SP // 10892
AM=M+1 // 10893
A=A-1 // 10894
M=0 // 10895
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=0 // 10899
@29 // 10900
D=A // 10901
@SP // 10902
AM=M+1 // 10903
A=A-1 // 10904
M=D // 10905
@55 // 10906
D=A // 10907
@SP // 10908
AM=M+1 // 10909
A=A-1 // 10910
M=D // 10911
@51 // 10912
D=A // 10913
@SP // 10914
AM=M+1 // 10915
A=A-1 // 10916
M=D // 10917
@3 // 10918
D=A // 10919
@SP // 10920
AM=M+1 // 10921
A=A-1 // 10922
M=D // 10923
@3 // 10924
D=A // 10925
@SP // 10926
AM=M+1 // 10927
A=A-1 // 10928
M=D // 10929
@7 // 10930
D=A // 10931
@SP // 10932
AM=M+1 // 10933
A=A-1 // 10934
M=D // 10935
@SP // 10936
AM=M+1 // 10937
A=A-1 // 10938
M=0 // 10939
@SP // 10940
AM=M+1 // 10941
A=A-1 // 10942
M=0 // 10943
// call Output.create
@17 // 10944
D=A // 10945
@14 // 10946
M=D // 10947
@Output.create // 10948
D=A // 10949
@13 // 10950
M=D // 10951
@Output.initMap.ret.84 // 10952
D=A // 10953
@CALL // 10954
0;JMP // 10955
(Output.initMap.ret.84)
@SP // 10956
M=M-1 // 10957

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@115 // 10958
D=A // 10959
@SP // 10960
AM=M+1 // 10961
A=A-1 // 10962
M=D // 10963
@SP // 10964
AM=M+1 // 10965
A=A-1 // 10966
M=0 // 10967
@SP // 10968
AM=M+1 // 10969
A=A-1 // 10970
M=0 // 10971
@SP // 10972
AM=M+1 // 10973
A=A-1 // 10974
M=0 // 10975
@30 // 10976
D=A // 10977
@SP // 10978
AM=M+1 // 10979
A=A-1 // 10980
M=D // 10981
@51 // 10982
D=A // 10983
@SP // 10984
AM=M+1 // 10985
A=A-1 // 10986
M=D // 10987
@6 // 10988
D=A // 10989
@SP // 10990
AM=M+1 // 10991
A=A-1 // 10992
M=D // 10993
@24 // 10994
D=A // 10995
@SP // 10996
AM=M+1 // 10997
A=A-1 // 10998
M=D // 10999
@51 // 11000
D=A // 11001
@SP // 11002
AM=M+1 // 11003
A=A-1 // 11004
M=D // 11005
@30 // 11006
D=A // 11007
@SP // 11008
AM=M+1 // 11009
A=A-1 // 11010
M=D // 11011
@SP // 11012
AM=M+1 // 11013
A=A-1 // 11014
M=0 // 11015
@SP // 11016
AM=M+1 // 11017
A=A-1 // 11018
M=0 // 11019
// call Output.create
@17 // 11020
D=A // 11021
@14 // 11022
M=D // 11023
@Output.create // 11024
D=A // 11025
@13 // 11026
M=D // 11027
@Output.initMap.ret.85 // 11028
D=A // 11029
@CALL // 11030
0;JMP // 11031
(Output.initMap.ret.85)
@SP // 11032
M=M-1 // 11033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 11034
D=A // 11035
@SP // 11036
AM=M+1 // 11037
A=A-1 // 11038
M=D // 11039
@4 // 11040
D=A // 11041
@SP // 11042
AM=M+1 // 11043
A=A-1 // 11044
M=D // 11045
@6 // 11046
D=A // 11047
@SP // 11048
AM=M+1 // 11049
A=A-1 // 11050
M=D // 11051
@6 // 11052
D=A // 11053
@SP // 11054
AM=M+1 // 11055
A=A-1 // 11056
M=D // 11057
@15 // 11058
D=A // 11059
@SP // 11060
AM=M+1 // 11061
A=A-1 // 11062
M=D // 11063
@6 // 11064
D=A // 11065
@SP // 11066
AM=M+1 // 11067
A=A-1 // 11068
M=D // 11069
@6 // 11070
D=A // 11071
@SP // 11072
AM=M+1 // 11073
A=A-1 // 11074
M=D // 11075
@6 // 11076
D=A // 11077
@SP // 11078
AM=M+1 // 11079
A=A-1 // 11080
M=D // 11081
@54 // 11082
D=A // 11083
@SP // 11084
AM=M+1 // 11085
A=A-1 // 11086
M=D // 11087
@28 // 11088
D=A // 11089
@SP // 11090
AM=M+1 // 11091
A=A-1 // 11092
M=D // 11093
@SP // 11094
AM=M+1 // 11095
A=A-1 // 11096
M=0 // 11097
@SP // 11098
AM=M+1 // 11099
A=A-1 // 11100
M=0 // 11101
// call Output.create
@17 // 11102
D=A // 11103
@14 // 11104
M=D // 11105
@Output.create // 11106
D=A // 11107
@13 // 11108
M=D // 11109
@Output.initMap.ret.86 // 11110
D=A // 11111
@CALL // 11112
0;JMP // 11113
(Output.initMap.ret.86)
@SP // 11114
M=M-1 // 11115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 11116
D=A // 11117
@SP // 11118
AM=M+1 // 11119
A=A-1 // 11120
M=D // 11121
@SP // 11122
AM=M+1 // 11123
A=A-1 // 11124
M=0 // 11125
@SP // 11126
AM=M+1 // 11127
A=A-1 // 11128
M=0 // 11129
@SP // 11130
AM=M+1 // 11131
A=A-1 // 11132
M=0 // 11133
@27 // 11134
D=A // 11135
@SP // 11136
AM=M+1 // 11137
A=A-1 // 11138
M=D // 11139
@27 // 11140
D=A // 11141
@SP // 11142
AM=M+1 // 11143
A=A-1 // 11144
M=D // 11145
@27 // 11146
D=A // 11147
@SP // 11148
AM=M+1 // 11149
A=A-1 // 11150
M=D // 11151
@27 // 11152
D=A // 11153
@SP // 11154
AM=M+1 // 11155
A=A-1 // 11156
M=D // 11157
@27 // 11158
D=A // 11159
@SP // 11160
AM=M+1 // 11161
A=A-1 // 11162
M=D // 11163
@54 // 11164
D=A // 11165
@SP // 11166
AM=M+1 // 11167
A=A-1 // 11168
M=D // 11169
@SP // 11170
AM=M+1 // 11171
A=A-1 // 11172
M=0 // 11173
@SP // 11174
AM=M+1 // 11175
A=A-1 // 11176
M=0 // 11177
// call Output.create
@17 // 11178
D=A // 11179
@14 // 11180
M=D // 11181
@Output.create // 11182
D=A // 11183
@13 // 11184
M=D // 11185
@Output.initMap.ret.87 // 11186
D=A // 11187
@CALL // 11188
0;JMP // 11189
(Output.initMap.ret.87)
@SP // 11190
M=M-1 // 11191

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@118 // 11192
D=A // 11193
@SP // 11194
AM=M+1 // 11195
A=A-1 // 11196
M=D // 11197
@SP // 11198
AM=M+1 // 11199
A=A-1 // 11200
M=0 // 11201
@SP // 11202
AM=M+1 // 11203
A=A-1 // 11204
M=0 // 11205
@SP // 11206
AM=M+1 // 11207
A=A-1 // 11208
M=0 // 11209
@51 // 11210
D=A // 11211
@SP // 11212
AM=M+1 // 11213
A=A-1 // 11214
M=D // 11215
@51 // 11216
D=A // 11217
@SP // 11218
AM=M+1 // 11219
A=A-1 // 11220
M=D // 11221
@51 // 11222
D=A // 11223
@SP // 11224
AM=M+1 // 11225
A=A-1 // 11226
M=D // 11227
@51 // 11228
D=A // 11229
@SP // 11230
AM=M+1 // 11231
A=A-1 // 11232
M=D // 11233
@30 // 11234
D=A // 11235
@SP // 11236
AM=M+1 // 11237
A=A-1 // 11238
M=D // 11239
@12 // 11240
D=A // 11241
@SP // 11242
AM=M+1 // 11243
A=A-1 // 11244
M=D // 11245
@SP // 11246
AM=M+1 // 11247
A=A-1 // 11248
M=0 // 11249
@SP // 11250
AM=M+1 // 11251
A=A-1 // 11252
M=0 // 11253
// call Output.create
@17 // 11254
D=A // 11255
@14 // 11256
M=D // 11257
@Output.create // 11258
D=A // 11259
@13 // 11260
M=D // 11261
@Output.initMap.ret.88 // 11262
D=A // 11263
@CALL // 11264
0;JMP // 11265
(Output.initMap.ret.88)
@SP // 11266
M=M-1 // 11267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@119 // 11268
D=A // 11269
@SP // 11270
AM=M+1 // 11271
A=A-1 // 11272
M=D // 11273
@SP // 11274
AM=M+1 // 11275
A=A-1 // 11276
M=0 // 11277
@SP // 11278
AM=M+1 // 11279
A=A-1 // 11280
M=0 // 11281
@SP // 11282
AM=M+1 // 11283
A=A-1 // 11284
M=0 // 11285
@51 // 11286
D=A // 11287
@SP // 11288
AM=M+1 // 11289
A=A-1 // 11290
M=D // 11291
@51 // 11292
D=A // 11293
@SP // 11294
AM=M+1 // 11295
A=A-1 // 11296
M=D // 11297
@51 // 11298
D=A // 11299
@SP // 11300
AM=M+1 // 11301
A=A-1 // 11302
M=D // 11303
@63 // 11304
D=A // 11305
@SP // 11306
AM=M+1 // 11307
A=A-1 // 11308
M=D // 11309
@63 // 11310
D=A // 11311
@SP // 11312
AM=M+1 // 11313
A=A-1 // 11314
M=D // 11315
@18 // 11316
D=A // 11317
@SP // 11318
AM=M+1 // 11319
A=A-1 // 11320
M=D // 11321
@SP // 11322
AM=M+1 // 11323
A=A-1 // 11324
M=0 // 11325
@SP // 11326
AM=M+1 // 11327
A=A-1 // 11328
M=0 // 11329
// call Output.create
@17 // 11330
D=A // 11331
@14 // 11332
M=D // 11333
@Output.create // 11334
D=A // 11335
@13 // 11336
M=D // 11337
@Output.initMap.ret.89 // 11338
D=A // 11339
@CALL // 11340
0;JMP // 11341
(Output.initMap.ret.89)
@SP // 11342
M=M-1 // 11343

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@120 // 11344
D=A // 11345
@SP // 11346
AM=M+1 // 11347
A=A-1 // 11348
M=D // 11349
@SP // 11350
AM=M+1 // 11351
A=A-1 // 11352
M=0 // 11353
@SP // 11354
AM=M+1 // 11355
A=A-1 // 11356
M=0 // 11357
@SP // 11358
AM=M+1 // 11359
A=A-1 // 11360
M=0 // 11361
@51 // 11362
D=A // 11363
@SP // 11364
AM=M+1 // 11365
A=A-1 // 11366
M=D // 11367
@30 // 11368
D=A // 11369
@SP // 11370
AM=M+1 // 11371
A=A-1 // 11372
M=D // 11373
@12 // 11374
D=A // 11375
@SP // 11376
AM=M+1 // 11377
A=A-1 // 11378
M=D // 11379
@12 // 11380
D=A // 11381
@SP // 11382
AM=M+1 // 11383
A=A-1 // 11384
M=D // 11385
@30 // 11386
D=A // 11387
@SP // 11388
AM=M+1 // 11389
A=A-1 // 11390
M=D // 11391
@51 // 11392
D=A // 11393
@SP // 11394
AM=M+1 // 11395
A=A-1 // 11396
M=D // 11397
@SP // 11398
AM=M+1 // 11399
A=A-1 // 11400
M=0 // 11401
@SP // 11402
AM=M+1 // 11403
A=A-1 // 11404
M=0 // 11405
// call Output.create
@17 // 11406
D=A // 11407
@14 // 11408
M=D // 11409
@Output.create // 11410
D=A // 11411
@13 // 11412
M=D // 11413
@Output.initMap.ret.90 // 11414
D=A // 11415
@CALL // 11416
0;JMP // 11417
(Output.initMap.ret.90)
@SP // 11418
M=M-1 // 11419

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@121 // 11420
D=A // 11421
@SP // 11422
AM=M+1 // 11423
A=A-1 // 11424
M=D // 11425
@SP // 11426
AM=M+1 // 11427
A=A-1 // 11428
M=0 // 11429
@SP // 11430
AM=M+1 // 11431
A=A-1 // 11432
M=0 // 11433
@SP // 11434
AM=M+1 // 11435
A=A-1 // 11436
M=0 // 11437
@51 // 11438
D=A // 11439
@SP // 11440
AM=M+1 // 11441
A=A-1 // 11442
M=D // 11443
@51 // 11444
D=A // 11445
@SP // 11446
AM=M+1 // 11447
A=A-1 // 11448
M=D // 11449
@51 // 11450
D=A // 11451
@SP // 11452
AM=M+1 // 11453
A=A-1 // 11454
M=D // 11455
@62 // 11456
D=A // 11457
@SP // 11458
AM=M+1 // 11459
A=A-1 // 11460
M=D // 11461
@48 // 11462
D=A // 11463
@SP // 11464
AM=M+1 // 11465
A=A-1 // 11466
M=D // 11467
@24 // 11468
D=A // 11469
@SP // 11470
AM=M+1 // 11471
A=A-1 // 11472
M=D // 11473
@15 // 11474
D=A // 11475
@SP // 11476
AM=M+1 // 11477
A=A-1 // 11478
M=D // 11479
@SP // 11480
AM=M+1 // 11481
A=A-1 // 11482
M=0 // 11483
// call Output.create
@17 // 11484
D=A // 11485
@14 // 11486
M=D // 11487
@Output.create // 11488
D=A // 11489
@13 // 11490
M=D // 11491
@Output.initMap.ret.91 // 11492
D=A // 11493
@CALL // 11494
0;JMP // 11495
(Output.initMap.ret.91)
@SP // 11496
M=M-1 // 11497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@122 // 11498
D=A // 11499
@SP // 11500
AM=M+1 // 11501
A=A-1 // 11502
M=D // 11503
@SP // 11504
AM=M+1 // 11505
A=A-1 // 11506
M=0 // 11507
@SP // 11508
AM=M+1 // 11509
A=A-1 // 11510
M=0 // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=0 // 11515
@63 // 11516
D=A // 11517
@SP // 11518
AM=M+1 // 11519
A=A-1 // 11520
M=D // 11521
@27 // 11522
D=A // 11523
@SP // 11524
AM=M+1 // 11525
A=A-1 // 11526
M=D // 11527
@12 // 11528
D=A // 11529
@SP // 11530
AM=M+1 // 11531
A=A-1 // 11532
M=D // 11533
@6 // 11534
D=A // 11535
@SP // 11536
AM=M+1 // 11537
A=A-1 // 11538
M=D // 11539
@51 // 11540
D=A // 11541
@SP // 11542
AM=M+1 // 11543
A=A-1 // 11544
M=D // 11545
@63 // 11546
D=A // 11547
@SP // 11548
AM=M+1 // 11549
A=A-1 // 11550
M=D // 11551
@SP // 11552
AM=M+1 // 11553
A=A-1 // 11554
M=0 // 11555
@SP // 11556
AM=M+1 // 11557
A=A-1 // 11558
M=0 // 11559
// call Output.create
@17 // 11560
D=A // 11561
@14 // 11562
M=D // 11563
@Output.create // 11564
D=A // 11565
@13 // 11566
M=D // 11567
@Output.initMap.ret.92 // 11568
D=A // 11569
@CALL // 11570
0;JMP // 11571
(Output.initMap.ret.92)
@SP // 11572
M=M-1 // 11573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11574
D=A // 11575
@SP // 11576
AM=M+1 // 11577
A=A-1 // 11578
M=D // 11579
@56 // 11580
D=A // 11581
@SP // 11582
AM=M+1 // 11583
A=A-1 // 11584
M=D // 11585
@12 // 11586
D=A // 11587
@SP // 11588
AM=M+1 // 11589
A=A-1 // 11590
M=D // 11591
@12 // 11592
D=A // 11593
@SP // 11594
AM=M+1 // 11595
A=A-1 // 11596
M=D // 11597
@12 // 11598
D=A // 11599
@SP // 11600
AM=M+1 // 11601
A=A-1 // 11602
M=D // 11603
@7 // 11604
D=A // 11605
@SP // 11606
AM=M+1 // 11607
A=A-1 // 11608
M=D // 11609
@12 // 11610
D=A // 11611
@SP // 11612
AM=M+1 // 11613
A=A-1 // 11614
M=D // 11615
@12 // 11616
D=A // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=D // 11621
@12 // 11622
D=A // 11623
@SP // 11624
AM=M+1 // 11625
A=A-1 // 11626
M=D // 11627
@56 // 11628
D=A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633
@SP // 11634
AM=M+1 // 11635
A=A-1 // 11636
M=0 // 11637
@SP // 11638
AM=M+1 // 11639
A=A-1 // 11640
M=0 // 11641
// call Output.create
@17 // 11642
D=A // 11643
@14 // 11644
M=D // 11645
@Output.create // 11646
D=A // 11647
@13 // 11648
M=D // 11649
@Output.initMap.ret.93 // 11650
D=A // 11651
@CALL // 11652
0;JMP // 11653
(Output.initMap.ret.93)
@SP // 11654
M=M-1 // 11655

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11656
D=A // 11657
@SP // 11658
AM=M+1 // 11659
A=A-1 // 11660
M=D // 11661
@12 // 11662
D=A // 11663
@SP // 11664
AM=M+1 // 11665
A=A-1 // 11666
M=D // 11667
@12 // 11668
D=A // 11669
@SP // 11670
AM=M+1 // 11671
A=A-1 // 11672
M=D // 11673
@12 // 11674
D=A // 11675
@SP // 11676
AM=M+1 // 11677
A=A-1 // 11678
M=D // 11679
@12 // 11680
D=A // 11681
@SP // 11682
AM=M+1 // 11683
A=A-1 // 11684
M=D // 11685
@12 // 11686
D=A // 11687
@SP // 11688
AM=M+1 // 11689
A=A-1 // 11690
M=D // 11691
@12 // 11692
D=A // 11693
@SP // 11694
AM=M+1 // 11695
A=A-1 // 11696
M=D // 11697
@12 // 11698
D=A // 11699
@SP // 11700
AM=M+1 // 11701
A=A-1 // 11702
M=D // 11703
@12 // 11704
D=A // 11705
@SP // 11706
AM=M+1 // 11707
A=A-1 // 11708
M=D // 11709
@12 // 11710
D=A // 11711
@SP // 11712
AM=M+1 // 11713
A=A-1 // 11714
M=D // 11715
@SP // 11716
AM=M+1 // 11717
A=A-1 // 11718
M=0 // 11719
@SP // 11720
AM=M+1 // 11721
A=A-1 // 11722
M=0 // 11723
// call Output.create
@17 // 11724
D=A // 11725
@14 // 11726
M=D // 11727
@Output.create // 11728
D=A // 11729
@13 // 11730
M=D // 11731
@Output.initMap.ret.94 // 11732
D=A // 11733
@CALL // 11734
0;JMP // 11735
(Output.initMap.ret.94)
@SP // 11736
M=M-1 // 11737

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11738
D=A // 11739
@SP // 11740
AM=M+1 // 11741
A=A-1 // 11742
M=D // 11743
@7 // 11744
D=A // 11745
@SP // 11746
AM=M+1 // 11747
A=A-1 // 11748
M=D // 11749
@12 // 11750
D=A // 11751
@SP // 11752
AM=M+1 // 11753
A=A-1 // 11754
M=D // 11755
@12 // 11756
D=A // 11757
@SP // 11758
AM=M+1 // 11759
A=A-1 // 11760
M=D // 11761
@12 // 11762
D=A // 11763
@SP // 11764
AM=M+1 // 11765
A=A-1 // 11766
M=D // 11767
@56 // 11768
D=A // 11769
@SP // 11770
AM=M+1 // 11771
A=A-1 // 11772
M=D // 11773
@12 // 11774
D=A // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=D // 11779
@12 // 11780
D=A // 11781
@SP // 11782
AM=M+1 // 11783
A=A-1 // 11784
M=D // 11785
@12 // 11786
D=A // 11787
@SP // 11788
AM=M+1 // 11789
A=A-1 // 11790
M=D // 11791
@7 // 11792
D=A // 11793
@SP // 11794
AM=M+1 // 11795
A=A-1 // 11796
M=D // 11797
@SP // 11798
AM=M+1 // 11799
A=A-1 // 11800
M=0 // 11801
@SP // 11802
AM=M+1 // 11803
A=A-1 // 11804
M=0 // 11805
// call Output.create
@17 // 11806
D=A // 11807
@14 // 11808
M=D // 11809
@Output.create // 11810
D=A // 11811
@13 // 11812
M=D // 11813
@Output.initMap.ret.95 // 11814
D=A // 11815
@CALL // 11816
0;JMP // 11817
(Output.initMap.ret.95)
@SP // 11818
M=M-1 // 11819

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11820
D=A // 11821
@SP // 11822
AM=M+1 // 11823
A=A-1 // 11824
M=D // 11825
@38 // 11826
D=A // 11827
@SP // 11828
AM=M+1 // 11829
A=A-1 // 11830
M=D // 11831
@45 // 11832
D=A // 11833
@SP // 11834
AM=M+1 // 11835
A=A-1 // 11836
M=D // 11837
@25 // 11838
D=A // 11839
@SP // 11840
AM=M+1 // 11841
A=A-1 // 11842
M=D // 11843
@SP // 11844
AM=M+1 // 11845
A=A-1 // 11846
M=0 // 11847
@SP // 11848
AM=M+1 // 11849
A=A-1 // 11850
M=0 // 11851
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
@SP // 11864
AM=M+1 // 11865
A=A-1 // 11866
M=0 // 11867
@SP // 11868
AM=M+1 // 11869
A=A-1 // 11870
M=0 // 11871
@SP // 11872
AM=M+1 // 11873
A=A-1 // 11874
M=0 // 11875
// call Output.create
@17 // 11876
D=A // 11877
@14 // 11878
M=D // 11879
@Output.create // 11880
D=A // 11881
@13 // 11882
M=D // 11883
@Output.initMap.ret.96 // 11884
D=A // 11885
@CALL // 11886
0;JMP // 11887
(Output.initMap.ret.96)
@SP // 11888
M=M-1 // 11889

////PushInstruction("constant 0")
@SP // 11890
AM=M+1 // 11891
A=A-1 // 11892
M=0 // 11893

////ReturnInstruction{}
@RETURN // 11894
0;JMP // 11895

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 11896
AM=M+1 // 11897
A=A-1 // 11898
M=0 // 11899

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11900
D=A // 11901
@SP // 11902
AM=M+1 // 11903
A=A-1 // 11904
M=D // 11905
// call Array.new
@6 // 11906
D=A // 11907
@14 // 11908
M=D // 11909
@Array.new // 11910
D=A // 11911
@13 // 11912
M=D // 11913
@Output.create.ret.0 // 11914
D=A // 11915
@CALL // 11916
0;JMP // 11917
(Output.create.ret.0)
@SP // 11918
AM=M-1 // 11919
D=M // 11920
@LCL // 11921
A=M // 11922
M=D // 11923

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11924
D=M // 11925
@SP // 11926
AM=M+1 // 11927
A=A-1 // 11928
M=D // 11929
@ARG // 11930
A=M // 11931
D=M // 11932
@SP // 11933
AM=M-1 // 11934
D=D+M // 11935
@SP // 11936
AM=M+1 // 11937
A=A-1 // 11938
M=D // 11939
@LCL // 11940
A=M // 11941
D=M // 11942
@SP // 11943
AM=M-1 // 11944
A=M // 11945
M=D // 11946

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11947
A=M // 11948
D=M // 11949
@SP // 11950
AM=M+1 // 11951
A=A-1 // 11952
M=D // 11953
@ARG // 11954
A=M+1 // 11955
D=M // 11956
@SP // 11957
AM=M-1 // 11958
A=M // 11959
M=D // 11960

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11961
A=M // 11962
D=M // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=D+1 // 11967
@ARG // 11968
A=M+1 // 11969
A=A+1 // 11970
D=M // 11971
@SP // 11972
AM=M-1 // 11973
A=M // 11974
M=D // 11975

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11976
A=M // 11977
D=M // 11978
@2 // 11979
D=D+A // 11980
@SP // 11981
AM=M+1 // 11982
A=A-1 // 11983
M=D // 11984
@ARG // 11985
A=M+1 // 11986
A=A+1 // 11987
A=A+1 // 11988
D=M // 11989
@SP // 11990
AM=M-1 // 11991
A=M // 11992
M=D // 11993

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11994
A=M // 11995
D=M // 11996
@3 // 11997
D=D+A // 11998
@SP // 11999
AM=M+1 // 12000
A=A-1 // 12001
M=D // 12002
@ARG // 12003
D=M // 12004
@4 // 12005
A=D+A // 12006
D=M // 12007
@SP // 12008
AM=M-1 // 12009
A=M // 12010
M=D // 12011

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 12012
A=M // 12013
D=M // 12014
@4 // 12015
D=D+A // 12016
@SP // 12017
AM=M+1 // 12018
A=A-1 // 12019
M=D // 12020
@ARG // 12021
D=M // 12022
@5 // 12023
A=D+A // 12024
D=M // 12025
@SP // 12026
AM=M-1 // 12027
A=M // 12028
M=D // 12029

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 12030
A=M // 12031
D=M // 12032
@5 // 12033
D=D+A // 12034
@SP // 12035
AM=M+1 // 12036
A=A-1 // 12037
M=D // 12038
@ARG // 12039
D=M // 12040
@6 // 12041
A=D+A // 12042
D=M // 12043
@SP // 12044
AM=M-1 // 12045
A=M // 12046
M=D // 12047

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 12048
A=M // 12049
D=M // 12050
@6 // 12051
D=D+A // 12052
@SP // 12053
AM=M+1 // 12054
A=A-1 // 12055
M=D // 12056
@ARG // 12057
D=M // 12058
@7 // 12059
A=D+A // 12060
D=M // 12061
@SP // 12062
AM=M-1 // 12063
A=M // 12064
M=D // 12065

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 12066
A=M // 12067
D=M // 12068
@7 // 12069
D=D+A // 12070
@SP // 12071
AM=M+1 // 12072
A=A-1 // 12073
M=D // 12074
@ARG // 12075
D=M // 12076
@8 // 12077
A=D+A // 12078
D=M // 12079
@SP // 12080
AM=M-1 // 12081
A=M // 12082
M=D // 12083

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 12084
A=M // 12085
D=M // 12086
@8 // 12087
D=D+A // 12088
@SP // 12089
AM=M+1 // 12090
A=A-1 // 12091
M=D // 12092
@ARG // 12093
D=M // 12094
@9 // 12095
A=D+A // 12096
D=M // 12097
@SP // 12098
AM=M-1 // 12099
A=M // 12100
M=D // 12101

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 12102
A=M // 12103
D=M // 12104
@9 // 12105
D=D+A // 12106
@SP // 12107
AM=M+1 // 12108
A=A-1 // 12109
M=D // 12110
@ARG // 12111
D=M // 12112
@10 // 12113
A=D+A // 12114
D=M // 12115
@SP // 12116
AM=M-1 // 12117
A=M // 12118
M=D // 12119

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 12120
A=M // 12121
D=M // 12122
@10 // 12123
D=D+A // 12124
@SP // 12125
AM=M+1 // 12126
A=A-1 // 12127
M=D // 12128
@ARG // 12129
D=M // 12130
@11 // 12131
A=D+A // 12132
D=M // 12133
@SP // 12134
AM=M-1 // 12135
A=M // 12136
M=D // 12137

////PushInstruction("constant 0")
@SP // 12138
AM=M+1 // 12139
A=A-1 // 12140
M=0 // 12141

////ReturnInstruction{}
@RETURN // 12142
0;JMP // 12143

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
@Output.getMap.EQ.0 // 12144
D=A // 12145
@SP // 12146
AM=M+1 // 12147
A=A-1 // 12148
M=D // 12149
@Output.getMap.LT.1 // 12150
D=A // 12151
@SP // 12152
AM=M+1 // 12153
A=A-1 // 12154
M=D // 12155
@ARG // 12156
A=M // 12157
D=M // 12158
@32 // 12159
D=D-A // 12160
@DO_LT // 12161
0;JMP // 12162
(Output.getMap.LT.1)
@SP // 12163
AM=M+1 // 12164
A=A-1 // 12165
M=D // 12166
@Output.getMap.GT.2 // 12167
D=A // 12168
@SP // 12169
AM=M+1 // 12170
A=A-1 // 12171
M=D // 12172
@ARG // 12173
A=M // 12174
D=M // 12175
@126 // 12176
D=D-A // 12177
@DO_GT // 12178
0;JMP // 12179
(Output.getMap.GT.2)
@SP // 12180
AM=M-1 // 12181
D=D|M // 12182
@DO_EQ // 12183
0;JMP // 12184
(Output.getMap.EQ.0)
@Output.getMap.IfElse1 // 12185
D;JNE // 12186

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 12187
A=M // 12188
M=0 // 12189

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 12190
0;JMP // 12191

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
@Output.0 // 12192
D=M // 12193
@SP // 12194
AM=M+1 // 12195
A=A-1 // 12196
M=D // 12197
@ARG // 12198
A=M // 12199
D=M // 12200
@SP // 12201
AM=M-1 // 12202
A=D+M // 12203
D=M // 12204
@SP // 12205
AM=M+1 // 12206
A=A-1 // 12207
M=D // 12208

////ReturnInstruction{}
@RETURN // 12209
0;JMP // 12210

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 12211
A=M+1 // 12212
D=M // 12213
@Output.1 // 12214
M=D // 12215

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 12216
A=M // 12217
D=M // 12218
@Output.2 // 12219
M=D // 12220

////PushInstruction("constant 0")
@SP // 12221
AM=M+1 // 12222
A=A-1 // 12223
M=0 // 12224

////ReturnInstruction{}
@RETURN // 12225
0;JMP // 12226

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 12227
AM=M+1 // 12228
A=A-1 // 12229
M=0 // 12230
@SP // 12231
AM=M+1 // 12232
A=A-1 // 12233
M=0 // 12234
@SP // 12235
AM=M+1 // 12236
A=A-1 // 12237
M=0 // 12238
@SP // 12239
AM=M+1 // 12240
A=A-1 // 12241
M=0 // 12242

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12243
A=M // 12244
D=M // 12245
@SP // 12246
AM=M+1 // 12247
A=A-1 // 12248
M=D // 12249
// call Output.getMap
@6 // 12250
D=A // 12251
@14 // 12252
M=D // 12253
@Output.getMap // 12254
D=A // 12255
@13 // 12256
M=D // 12257
@Output.printChar.ret.0 // 12258
D=A // 12259
@CALL // 12260
0;JMP // 12261
(Output.printChar.ret.0)
@SP // 12262
AM=M-1 // 12263
D=M // 12264
@LCL // 12265
A=M // 12266
M=D // 12267

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12268
A=M+1 // 12269
A=A+1 // 12270
A=A+1 // 12271
M=0 // 12272

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//CallGroup{pushes=[PushInstruction("static 1"), PushInstruction("constant 2")], call=CallInstruction{Math.divide}},
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@Output.1 // 12273
D=M // 12274
@SP // 12275
AM=M+1 // 12276
A=A-1 // 12277
M=D // 12278
@2 // 12279
D=A // 12280
@SP // 12281
AM=M+1 // 12282
A=A-1 // 12283
M=D // 12284
// call Math.divide
@7 // 12285
D=A // 12286
@14 // 12287
M=D // 12288
@Math.divide // 12289
D=A // 12290
@13 // 12291
M=D // 12292
@Output.printChar.ret.1 // 12293
D=A // 12294
@CALL // 12295
0;JMP // 12296
(Output.printChar.ret.1)
@SP // 12297
AM=M-1 // 12298
D=M // 12299
@16384 // 12300
D=D+A // 12301
@LCL // 12302
A=M+1 // 12303
M=D // 12304

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
@Output.printChar.LT.3 // 12305
D=A // 12306
@SP // 12307
AM=M+1 // 12308
A=A-1 // 12309
M=D // 12310
@LCL // 12311
A=M+1 // 12312
A=A+1 // 12313
A=A+1 // 12314
D=M // 12315
@11 // 12316
D=D-A // 12317
@DO_LT // 12318
0;JMP // 12319
(Output.printChar.LT.3)
D=!D // 12320
@WHILE_END_Output.printChar1 // 12321
D;JNE // 12322

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}},
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 12323
A=M+1 // 12324
A=A+1 // 12325
A=A+1 // 12326
D=M // 12327
@SP // 12328
AM=M+1 // 12329
A=A-1 // 12330
M=D // 12331
@32 // 12332
D=A // 12333
@SP // 12334
AM=M+1 // 12335
A=A-1 // 12336
M=D // 12337
// call Math.multiply
@7 // 12338
D=A // 12339
@14 // 12340
M=D // 12341
@Math.multiply // 12342
D=A // 12343
@13 // 12344
M=D // 12345
@Output.printChar.ret.2 // 12346
D=A // 12347
@CALL // 12348
0;JMP // 12349
(Output.printChar.ret.2)
@LCL // 12350
A=M+1 // 12351
D=M // 12352
@SP // 12353
AM=M-1 // 12354
D=D+M // 12355
@LCL // 12356
A=M+1 // 12357
M=D // 12358

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
@Output.printChar.EQ.4 // 12359
D=A // 12360
@SP // 12361
AM=M+1 // 12362
A=A-1 // 12363
M=D // 12364
@Output.1 // 12365
D=M // 12366
@1 // 12367
D=D&A // 12368
@DO_EQ // 12369
0;JMP // 12370
(Output.printChar.EQ.4)
D=!D // 12371
@Output.printChar.IfElse1 // 12372
D;JNE // 12373

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

@LCL // 12374
A=M+1 // 12375
A=A+1 // 12376
A=A+1 // 12377
D=M // 12378
A=A-1 // 12379
A=A-1 // 12380
A=A-1 // 12381
A=D+M // 12382
D=M // 12383
@LCL // 12384
A=M+1 // 12385
A=A+1 // 12386
M=D // 12387

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 12388
0;JMP // 12389

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

@LCL // 12390
A=M+1 // 12391
A=A+1 // 12392
A=A+1 // 12393
D=M // 12394
A=A-1 // 12395
A=A-1 // 12396
A=A-1 // 12397
A=D+M // 12398
D=M // 12399
@SP // 12400
AM=M+1 // 12401
A=A-1 // 12402
M=D // 12403
@256 // 12404
D=A // 12405
@SP // 12406
AM=M+1 // 12407
A=A-1 // 12408
M=D // 12409
// call Math.multiply
@7 // 12410
D=A // 12411
@14 // 12412
M=D // 12413
@Math.multiply // 12414
D=A // 12415
@13 // 12416
M=D // 12417
@Output.printChar.ret.3 // 12418
D=A // 12419
@CALL // 12420
0;JMP // 12421
(Output.printChar.ret.3)
@SP // 12422
AM=M-1 // 12423
D=M // 12424
@LCL // 12425
A=M+1 // 12426
A=A+1 // 12427
M=D // 12428

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
@LCL // 12429
A=M+1 // 12430
D=M // 12431
@SP // 12432
AM=M+1 // 12433
A=A-1 // 12434
M=D // 12435
@LCL // 12436
A=M+1 // 12437
D=M // 12438
@0 // 12439
A=D+A // 12440
D=M // 12441
@SP // 12442
AM=M+1 // 12443
A=A-1 // 12444
M=D // 12445
@LCL // 12446
A=M+1 // 12447
A=A+1 // 12448
D=M // 12449
@SP // 12450
AM=M-1 // 12451
D=D|M // 12452
@SP // 12453
AM=M-1 // 12454
A=M // 12455
M=D // 12456

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

@LCL // 12457
A=M+1 // 12458
A=A+1 // 12459
A=A+1 // 12460
D=M // 12461
D=D+1 // 12462
@LCL // 12463
A=M+1 // 12464
A=A+1 // 12465
A=A+1 // 12466
M=D // 12467

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12468
0;JMP // 12469

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
@Output.printChar.EQ.5 // 12470
D=A // 12471
@SP // 12472
AM=M+1 // 12473
A=A-1 // 12474
M=D // 12475
@Output.1 // 12476
D=M // 12477
@63 // 12478
D=D-A // 12479
@DO_EQ // 12480
0;JMP // 12481
(Output.printChar.EQ.5)
D=!D // 12482
@Output.printChar.IfElse2 // 12483
D;JNE // 12484

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12485
D=A // 12486
@14 // 12487
M=D // 12488
@Output.println // 12489
D=A // 12490
@13 // 12491
M=D // 12492
@Output.printChar.ret.4 // 12493
D=A // 12494
@CALL // 12495
0;JMP // 12496
(Output.printChar.ret.4)
@SP // 12497
M=M-1 // 12498

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12499
0;JMP // 12500

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

@Output.1 // 12501
D=M // 12502
D=D+1 // 12503
@Output.1 // 12504
M=D // 12505

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12506
AM=M+1 // 12507
A=A-1 // 12508
M=0 // 12509

////ReturnInstruction{}
@RETURN // 12510
0;JMP // 12511

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12512
AM=M+1 // 12513
A=A-1 // 12514
M=0 // 12515
@SP // 12516
AM=M+1 // 12517
A=A-1 // 12518
M=0 // 12519

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12520
A=M // 12521
M=0 // 12522

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12523
A=M // 12524
D=M // 12525
@SP // 12526
AM=M+1 // 12527
A=A-1 // 12528
M=D // 12529
// call String.length
@6 // 12530
D=A // 12531
@14 // 12532
M=D // 12533
@String.length // 12534
D=A // 12535
@13 // 12536
M=D // 12537
@Output.printString.ret.0 // 12538
D=A // 12539
@CALL // 12540
0;JMP // 12541
(Output.printString.ret.0)
@SP // 12542
AM=M-1 // 12543
D=M // 12544
@LCL // 12545
A=M+1 // 12546
M=D // 12547

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
@Output.printString.LT.6 // 12548
D=A // 12549
@SP // 12550
AM=M+1 // 12551
A=A-1 // 12552
M=D // 12553
@LCL // 12554
A=M+1 // 12555
D=M // 12556
A=A-1 // 12557
D=M-D // 12558
@DO_LT // 12559
0;JMP // 12560
(Output.printString.LT.6)
D=!D // 12561
@WHILE_END_Output.printString1 // 12562
D;JNE // 12563

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12564
A=M // 12565
D=M // 12566
@SP // 12567
AM=M+1 // 12568
A=A-1 // 12569
M=D // 12570
@LCL // 12571
A=M // 12572
D=M // 12573
@SP // 12574
AM=M+1 // 12575
A=A-1 // 12576
M=D // 12577
// call String.charAt
@7 // 12578
D=A // 12579
@14 // 12580
M=D // 12581
@String.charAt // 12582
D=A // 12583
@13 // 12584
M=D // 12585
@Output.printString.ret.1 // 12586
D=A // 12587
@CALL // 12588
0;JMP // 12589
(Output.printString.ret.1)
// call Output.printChar
@6 // 12590
D=A // 12591
@14 // 12592
M=D // 12593
@Output.printChar // 12594
D=A // 12595
@13 // 12596
M=D // 12597
@Output.printString.ret.2 // 12598
D=A // 12599
@CALL // 12600
0;JMP // 12601
(Output.printString.ret.2)
@SP // 12602
M=M-1 // 12603

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

@LCL // 12604
A=M // 12605
D=M // 12606
D=D+1 // 12607
@LCL // 12608
A=M // 12609
M=D // 12610

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12611
0;JMP // 12612

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12613
AM=M+1 // 12614
A=A-1 // 12615
M=0 // 12616

////ReturnInstruction{}
@RETURN // 12617
0;JMP // 12618

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12619
AM=M+1 // 12620
A=A-1 // 12621
M=0 // 12622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12623
D=A // 12624
@SP // 12625
AM=M+1 // 12626
A=A-1 // 12627
M=D // 12628
// call String.new
@6 // 12629
D=A // 12630
@14 // 12631
M=D // 12632
@String.new // 12633
D=A // 12634
@13 // 12635
M=D // 12636
@Output.printInt.ret.0 // 12637
D=A // 12638
@CALL // 12639
0;JMP // 12640
(Output.printInt.ret.0)
@SP // 12641
AM=M-1 // 12642
D=M // 12643
@LCL // 12644
A=M // 12645
M=D // 12646

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12647
A=M // 12648
D=M // 12649
@SP // 12650
AM=M+1 // 12651
A=A-1 // 12652
M=D // 12653
@ARG // 12654
A=M // 12655
D=M // 12656
@SP // 12657
AM=M+1 // 12658
A=A-1 // 12659
M=D // 12660
// call String.setInt
@7 // 12661
D=A // 12662
@14 // 12663
M=D // 12664
@String.setInt // 12665
D=A // 12666
@13 // 12667
M=D // 12668
@Output.printInt.ret.1 // 12669
D=A // 12670
@CALL // 12671
0;JMP // 12672
(Output.printInt.ret.1)
@SP // 12673
M=M-1 // 12674

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12675
A=M // 12676
D=M // 12677
@SP // 12678
AM=M+1 // 12679
A=A-1 // 12680
M=D // 12681
// call Output.printString
@6 // 12682
D=A // 12683
@14 // 12684
M=D // 12685
@Output.printString // 12686
D=A // 12687
@13 // 12688
M=D // 12689
@Output.printInt.ret.2 // 12690
D=A // 12691
@CALL // 12692
0;JMP // 12693
(Output.printInt.ret.2)
@SP // 12694
M=M-1 // 12695

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12696
A=M // 12697
D=M // 12698
@SP // 12699
AM=M+1 // 12700
A=A-1 // 12701
M=D // 12702
// call String.dispose
@6 // 12703
D=A // 12704
@14 // 12705
M=D // 12706
@String.dispose // 12707
D=A // 12708
@13 // 12709
M=D // 12710
@Output.printInt.ret.3 // 12711
D=A // 12712
@CALL // 12713
0;JMP // 12714
(Output.printInt.ret.3)
@SP // 12715
M=M-1 // 12716

////PushInstruction("constant 0")
@SP // 12717
AM=M+1 // 12718
A=A-1 // 12719
M=0 // 12720

////ReturnInstruction{}
@RETURN // 12721
0;JMP // 12722

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12723
M=0 // 12724

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
@Output.println.EQ.7 // 12725
D=A // 12726
@SP // 12727
AM=M+1 // 12728
A=A-1 // 12729
M=D // 12730
@Output.2 // 12731
D=M // 12732
@22 // 12733
D=D-A // 12734
@DO_EQ // 12735
0;JMP // 12736
(Output.println.EQ.7)
D=!D // 12737
@Output.println.IfElse1 // 12738
D;JNE // 12739

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12740
M=0 // 12741

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12742
0;JMP // 12743

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

@Output.2 // 12744
D=M // 12745
D=D+1 // 12746
@Output.2 // 12747
M=D // 12748

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12749
AM=M+1 // 12750
A=A-1 // 12751
M=0 // 12752

////ReturnInstruction{}
@RETURN // 12753
0;JMP // 12754

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}}
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
@Output.backSpace.EQ.8 // 12755
D=A // 12756
@SP // 12757
AM=M+1 // 12758
A=A-1 // 12759
M=D // 12760
@Output.1 // 12761
D=M // 12762
@DO_EQ // 12763
0;JMP // 12764
(Output.backSpace.EQ.8)
D=!D // 12765
@Output.backSpace.IfElse1 // 12766
D;JNE // 12767

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

@Output.2 // 12768
D=M // 12769
D=D-1 // 12770
@Output.2 // 12771
M=D // 12772

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12773
D=A // 12774
@Output.1 // 12775
M=D // 12776

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12777
0;JMP // 12778

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

@Output.1 // 12779
D=M // 12780
D=D-1 // 12781
@Output.1 // 12782
M=D // 12783

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12784
AM=M+1 // 12785
A=A-1 // 12786
M=0 // 12787

////ReturnInstruction{}
@RETURN // 12788
0;JMP // 12789

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12790
M=-1 // 12791

////PushInstruction("constant 0")
@SP // 12792
AM=M+1 // 12793
A=A-1 // 12794
M=0 // 12795

////ReturnInstruction{}
@RETURN // 12796
0;JMP // 12797

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12798
A=M // 12799
D=M // 12800
@Screen.0 // 12801
M=D // 12802

////PushInstruction("constant 0")
@SP // 12803
AM=M+1 // 12804
A=A-1 // 12805
M=0 // 12806

////ReturnInstruction{}
@RETURN // 12807
0;JMP // 12808

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12809
AM=M+1 // 12810
A=A-1 // 12811
M=0 // 12812
@SP // 12813
AM=M+1 // 12814
A=A-1 // 12815
M=0 // 12816

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

@ARG // 12817
A=M+1 // 12818
D=M // 12819
@SP // 12820
AM=M+1 // 12821
A=A-1 // 12822
M=D // 12823
@32 // 12824
D=A // 12825
@SP // 12826
AM=M+1 // 12827
A=A-1 // 12828
M=D // 12829
// call Math.multiply
@7 // 12830
D=A // 12831
@14 // 12832
M=D // 12833
@Math.multiply // 12834
D=A // 12835
@13 // 12836
M=D // 12837
@Screen.drawPixel.ret.0 // 12838
D=A // 12839
@CALL // 12840
0;JMP // 12841
(Screen.drawPixel.ret.0)
@ARG // 12842
A=M // 12843
D=M // 12844
@SP // 12845
AM=M+1 // 12846
A=A-1 // 12847
M=D // 12848
@16 // 12849
D=A // 12850
@SP // 12851
AM=M+1 // 12852
A=A-1 // 12853
M=D // 12854
// call Math.divide
@7 // 12855
D=A // 12856
@14 // 12857
M=D // 12858
@Math.divide // 12859
D=A // 12860
@13 // 12861
M=D // 12862
@Screen.drawPixel.ret.1 // 12863
D=A // 12864
@CALL // 12865
0;JMP // 12866
(Screen.drawPixel.ret.1)
@SP // 12867
AM=M-1 // 12868
D=M // 12869
@SP // 12870
AM=M-1 // 12871
D=D+M // 12872
@16384 // 12873
D=D+A // 12874
@LCL // 12875
A=M // 12876
M=D // 12877

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

@ARG // 12878
A=M // 12879
D=M // 12880
@15 // 12881
D=D&A // 12882
@LCL // 12883
A=M+1 // 12884
M=D // 12885

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
@Screen.drawPixel.EQ.0 // 12886
D=A // 12887
@SP // 12888
AM=M+1 // 12889
A=A-1 // 12890
M=D // 12891
@Screen.drawPixel.EQ.1 // 12892
D=A // 12893
@SP // 12894
AM=M+1 // 12895
A=A-1 // 12896
M=D // 12897
@Screen.0 // 12898
D=M // 12899
@DO_EQ // 12900
0;JMP // 12901
(Screen.drawPixel.EQ.1)
D=!D // 12902
@DO_EQ // 12903
0;JMP // 12904
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12905
D;JNE // 12906

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
@LCL // 12907
A=M // 12908
D=M // 12909
@SP // 12910
AM=M+1 // 12911
A=A-1 // 12912
M=D // 12913
@LCL // 12914
A=M // 12915
D=M // 12916
@0 // 12917
A=D+A // 12918
D=M // 12919
@SP // 12920
AM=M+1 // 12921
A=A-1 // 12922
M=D // 12923
@LCL // 12924
A=M+1 // 12925
D=M // 12926
@SP // 12927
AM=M+1 // 12928
A=A-1 // 12929
M=D // 12930
// call Math.twoToThe
@6 // 12931
D=A // 12932
@14 // 12933
M=D // 12934
@Math.twoToThe // 12935
D=A // 12936
@13 // 12937
M=D // 12938
@Screen.drawPixel.ret.2 // 12939
D=A // 12940
@CALL // 12941
0;JMP // 12942
(Screen.drawPixel.ret.2)
@SP // 12943
AM=M-1 // 12944
D=M // 12945
@SP // 12946
AM=M-1 // 12947
D=D|M // 12948
@SP // 12949
AM=M-1 // 12950
A=M // 12951
M=D // 12952

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12953
0;JMP // 12954

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
@LCL // 12955
A=M // 12956
D=M // 12957
@SP // 12958
AM=M+1 // 12959
A=A-1 // 12960
M=D // 12961
@LCL // 12962
A=M // 12963
D=M // 12964
@0 // 12965
A=D+A // 12966
D=M // 12967
@SP // 12968
AM=M+1 // 12969
A=A-1 // 12970
M=D // 12971
@LCL // 12972
A=M+1 // 12973
D=M // 12974
@SP // 12975
AM=M+1 // 12976
A=A-1 // 12977
M=D // 12978
// call Math.twoToThe
@6 // 12979
D=A // 12980
@14 // 12981
M=D // 12982
@Math.twoToThe // 12983
D=A // 12984
@13 // 12985
M=D // 12986
@Screen.drawPixel.ret.3 // 12987
D=A // 12988
@CALL // 12989
0;JMP // 12990
(Screen.drawPixel.ret.3)
@SP // 12991
AM=M-1 // 12992
D=M // 12993
D=!D // 12994
@SP // 12995
AM=M-1 // 12996
D=D&M // 12997
@SP // 12998
AM=M-1 // 12999
A=M // 13000
M=D // 13001

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13002
AM=M+1 // 13003
A=A-1 // 13004
M=0 // 13005

////ReturnInstruction{}
@RETURN // 13006
0;JMP // 13007

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 13008
AM=M+1 // 13009
A=A-1 // 13010
M=0 // 13011
@SP // 13012
AM=M+1 // 13013
A=A-1 // 13014
M=0 // 13015
@SP // 13016
AM=M+1 // 13017
A=A-1 // 13018
M=0 // 13019
@SP // 13020
AM=M+1 // 13021
A=A-1 // 13022
M=0 // 13023
@SP // 13024
AM=M+1 // 13025
A=A-1 // 13026
M=0 // 13027
@SP // 13028
AM=M+1 // 13029
A=A-1 // 13030
M=0 // 13031

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

@ARG // 13032
A=M+1 // 13033
A=A+1 // 13034
D=M // 13035
A=A-1 // 13036
A=A-1 // 13037
D=D-M // 13038
@SP // 13039
AM=M+1 // 13040
A=A-1 // 13041
M=D // 13042
// call Math.abs
@6 // 13043
D=A // 13044
@14 // 13045
M=D // 13046
@Math.abs // 13047
D=A // 13048
@13 // 13049
M=D // 13050
@Screen.drawLine.ret.0 // 13051
D=A // 13052
@CALL // 13053
0;JMP // 13054
(Screen.drawLine.ret.0)
@SP // 13055
AM=M-1 // 13056
D=M // 13057
@LCL // 13058
A=M // 13059
M=D // 13060

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

@ARG // 13061
A=M+1 // 13062
A=A+1 // 13063
A=A+1 // 13064
D=M // 13065
A=A-1 // 13066
A=A-1 // 13067
D=D-M // 13068
@SP // 13069
AM=M+1 // 13070
A=A-1 // 13071
M=D // 13072
// call Math.abs
@6 // 13073
D=A // 13074
@14 // 13075
M=D // 13076
@Math.abs // 13077
D=A // 13078
@13 // 13079
M=D // 13080
@Screen.drawLine.ret.1 // 13081
D=A // 13082
@CALL // 13083
0;JMP // 13084
(Screen.drawLine.ret.1)
@SP // 13085
AM=M-1 // 13086
D=M // 13087
@LCL // 13088
A=M+1 // 13089
M=D // 13090

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
@Screen.drawLine.LT.2 // 13091
D=A // 13092
@SP // 13093
AM=M+1 // 13094
A=A-1 // 13095
M=D // 13096
@ARG // 13097
A=M+1 // 13098
A=A+1 // 13099
D=M // 13100
A=A-1 // 13101
A=A-1 // 13102
D=M-D // 13103
@DO_LT // 13104
0;JMP // 13105
(Screen.drawLine.LT.2)
D=!D // 13106
@Screen.drawLine.IfElse1 // 13107
D;JNE // 13108

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13109
A=M+1 // 13110
A=A+1 // 13111
M=1 // 13112

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 13113
0;JMP // 13114

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13115
A=M+1 // 13116
A=A+1 // 13117
M=-1 // 13118

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
@Screen.drawLine.LT.3 // 13119
D=A // 13120
@SP // 13121
AM=M+1 // 13122
A=A-1 // 13123
M=D // 13124
@ARG // 13125
A=M+1 // 13126
A=A+1 // 13127
A=A+1 // 13128
D=M // 13129
A=A-1 // 13130
A=A-1 // 13131
D=M-D // 13132
@DO_LT // 13133
0;JMP // 13134
(Screen.drawLine.LT.3)
D=!D // 13135
@Screen.drawLine.IfElse2 // 13136
D;JNE // 13137

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13138
A=M+1 // 13139
A=A+1 // 13140
A=A+1 // 13141
M=1 // 13142

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 13143
0;JMP // 13144

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13145
A=M+1 // 13146
A=A+1 // 13147
A=A+1 // 13148
M=-1 // 13149

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

@LCL // 13150
A=M+1 // 13151
D=M // 13152
A=A-1 // 13153
D=M-D // 13154
@SP // 13155
AM=M+1 // 13156
A=A-1 // 13157
M=D // 13158
@LCL // 13159
D=M // 13160
@4 // 13161
A=D+A // 13162
D=A // 13163
@R13 // 13164
M=D // 13165
@SP // 13166
AM=M-1 // 13167
D=M // 13168
@R13 // 13169
A=M // 13170
M=D // 13171

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
D=0 // 13172
@WHILE_END_Screen.drawLine1 // 13173
D;JNE // 13174

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13175
A=M // 13176
D=M // 13177
@SP // 13178
AM=M+1 // 13179
A=A-1 // 13180
M=D // 13181
@ARG // 13182
A=M+1 // 13183
D=M // 13184
@SP // 13185
AM=M+1 // 13186
A=A-1 // 13187
M=D // 13188
// call Screen.drawPixel
@7 // 13189
D=A // 13190
@14 // 13191
M=D // 13192
@Screen.drawPixel // 13193
D=A // 13194
@13 // 13195
M=D // 13196
@Screen.drawLine.ret.2 // 13197
D=A // 13198
@CALL // 13199
0;JMP // 13200
(Screen.drawLine.ret.2)
@SP // 13201
M=M-1 // 13202

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
@Screen.drawLine.EQ.4 // 13203
D=A // 13204
@SP // 13205
AM=M+1 // 13206
A=A-1 // 13207
M=D // 13208
@Screen.drawLine.EQ.5 // 13209
D=A // 13210
@SP // 13211
AM=M+1 // 13212
A=A-1 // 13213
M=D // 13214
@ARG // 13215
A=M+1 // 13216
A=A+1 // 13217
D=M // 13218
A=A-1 // 13219
A=A-1 // 13220
D=M-D // 13221
@DO_EQ // 13222
0;JMP // 13223
(Screen.drawLine.EQ.5)
@SP // 13224
AM=M+1 // 13225
A=A-1 // 13226
M=D // 13227
@Screen.drawLine.EQ.6 // 13228
D=A // 13229
@SP // 13230
AM=M+1 // 13231
A=A-1 // 13232
M=D // 13233
@ARG // 13234
A=M+1 // 13235
A=A+1 // 13236
A=A+1 // 13237
D=M // 13238
A=A-1 // 13239
A=A-1 // 13240
D=M-D // 13241
@DO_EQ // 13242
0;JMP // 13243
(Screen.drawLine.EQ.6)
@SP // 13244
AM=M-1 // 13245
D=D&M // 13246
@DO_EQ // 13247
0;JMP // 13248
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse3 // 13249
D;JNE // 13250

////PushInstruction("constant 0")
@SP // 13251
AM=M+1 // 13252
A=A-1 // 13253
M=0 // 13254

////ReturnInstruction{}
@RETURN // 13255
0;JMP // 13256

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 13257
0;JMP // 13258

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

@LCL // 13259
D=M // 13260
@4 // 13261
A=D+A // 13262
D=M // 13263
D=D+M // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268
@LCL // 13269
D=M // 13270
@5 // 13271
A=D+A // 13272
D=A // 13273
@R13 // 13274
M=D // 13275
@SP // 13276
AM=M-1 // 13277
D=M // 13278
@R13 // 13279
A=M // 13280
M=D // 13281

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
@Screen.drawLine.GT.7 // 13282
D=A // 13283
@SP // 13284
AM=M+1 // 13285
A=A-1 // 13286
M=D // 13287
@LCL // 13288
D=M // 13289
@5 // 13290
A=D+A // 13291
D=M // 13292
@SP // 13293
AM=M+1 // 13294
A=A-1 // 13295
M=D // 13296
@LCL // 13297
A=M+1 // 13298
D=M // 13299
@SP // 13300
AM=M-1 // 13301
D=D+M // 13302
@DO_GT // 13303
0;JMP // 13304
(Screen.drawLine.GT.7)
D=!D // 13305
@Screen.drawLine.IfElse4 // 13306
D;JNE // 13307

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

@LCL // 13308
D=M // 13309
@4 // 13310
A=D+A // 13311
D=M // 13312
A=A-1 // 13313
A=A-1 // 13314
A=A-1 // 13315
D=D-M // 13316
@SP // 13317
AM=M+1 // 13318
A=A-1 // 13319
M=D // 13320
@LCL // 13321
D=M // 13322
@4 // 13323
A=D+A // 13324
D=A // 13325
@R13 // 13326
M=D // 13327
@SP // 13328
AM=M-1 // 13329
D=M // 13330
@R13 // 13331
A=M // 13332
M=D // 13333

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

@ARG // 13334
A=M // 13335
D=M // 13336
@SP // 13337
AM=M+1 // 13338
A=A-1 // 13339
M=D // 13340
@LCL // 13341
A=M+1 // 13342
A=A+1 // 13343
D=M // 13344
@SP // 13345
AM=M-1 // 13346
D=D+M // 13347
@ARG // 13348
A=M // 13349
M=D // 13350

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 13351
0;JMP // 13352

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
@Screen.drawLine.LT.8 // 13353
D=A // 13354
@SP // 13355
AM=M+1 // 13356
A=A-1 // 13357
M=D // 13358
@LCL // 13359
D=M // 13360
@5 // 13361
A=D+A // 13362
D=M // 13363
@SP // 13364
AM=M+1 // 13365
A=A-1 // 13366
M=D // 13367
@LCL // 13368
A=M // 13369
D=M // 13370
@SP // 13371
AM=M-1 // 13372
D=M-D // 13373
@DO_LT // 13374
0;JMP // 13375
(Screen.drawLine.LT.8)
D=!D // 13376
@Screen.drawLine.IfElse5 // 13377
D;JNE // 13378

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

@LCL // 13379
D=M // 13380
@4 // 13381
A=D+A // 13382
D=M // 13383
@SP // 13384
AM=M+1 // 13385
A=A-1 // 13386
M=D // 13387
@LCL // 13388
A=M // 13389
D=M // 13390
@SP // 13391
AM=M-1 // 13392
D=D+M // 13393
@SP // 13394
AM=M+1 // 13395
A=A-1 // 13396
M=D // 13397
@LCL // 13398
D=M // 13399
@4 // 13400
A=D+A // 13401
D=A // 13402
@R13 // 13403
M=D // 13404
@SP // 13405
AM=M-1 // 13406
D=M // 13407
@R13 // 13408
A=M // 13409
M=D // 13410

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

@ARG // 13411
A=M+1 // 13412
D=M // 13413
@SP // 13414
AM=M+1 // 13415
A=A-1 // 13416
M=D // 13417
@LCL // 13418
A=M+1 // 13419
A=A+1 // 13420
A=A+1 // 13421
D=M // 13422
@SP // 13423
AM=M-1 // 13424
D=D+M // 13425
@ARG // 13426
A=M+1 // 13427
M=D // 13428

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 13429
0;JMP // 13430

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 13431
0;JMP // 13432

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 13433
AM=M+1 // 13434
A=A-1 // 13435
M=0 // 13436

////ReturnInstruction{}
@RETURN // 13437
0;JMP // 13438

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 13439
AM=M+1 // 13440
A=A-1 // 13441
M=0 // 13442

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13443
A=M // 13444
D=M // 13445
@LCL // 13446
A=M // 13447
M=D // 13448

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
@Screen.drawHorizontalLine.EQ.9 // 13449
D=A // 13450
@SP // 13451
AM=M+1 // 13452
A=A-1 // 13453
M=D // 13454
@Screen.drawHorizontalLine.GT.10 // 13455
D=A // 13456
@SP // 13457
AM=M+1 // 13458
A=A-1 // 13459
M=D // 13460
@LCL // 13461
A=M // 13462
D=M // 13463
@SP // 13464
AM=M+1 // 13465
A=A-1 // 13466
M=D // 13467
@ARG // 13468
A=M+1 // 13469
D=M // 13470
@SP // 13471
AM=M-1 // 13472
D=M-D // 13473
@DO_GT // 13474
0;JMP // 13475
(Screen.drawHorizontalLine.GT.10)
D=!D // 13476
@DO_EQ // 13477
0;JMP // 13478
(Screen.drawHorizontalLine.EQ.9)
@WHILE_END_Screen.drawHorizontalLine1 // 13479
D;JNE // 13480

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13481
A=M // 13482
D=M // 13483
@SP // 13484
AM=M+1 // 13485
A=A-1 // 13486
M=D // 13487
@ARG // 13488
A=M+1 // 13489
A=A+1 // 13490
D=M // 13491
@SP // 13492
AM=M+1 // 13493
A=A-1 // 13494
M=D // 13495
// call Screen.drawPixel
@7 // 13496
D=A // 13497
@14 // 13498
M=D // 13499
@Screen.drawPixel // 13500
D=A // 13501
@13 // 13502
M=D // 13503
@Screen.drawHorizontalLine.ret.0 // 13504
D=A // 13505
@CALL // 13506
0;JMP // 13507
(Screen.drawHorizontalLine.ret.0)
@SP // 13508
M=M-1 // 13509

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

@LCL // 13510
A=M // 13511
D=M // 13512
D=D+1 // 13513
@LCL // 13514
A=M // 13515
M=D // 13516

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 13517
0;JMP // 13518

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 13519
AM=M+1 // 13520
A=A-1 // 13521
M=0 // 13522

////ReturnInstruction{}
@RETURN // 13523
0;JMP // 13524

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 13525
AM=M+1 // 13526
A=A-1 // 13527
M=0 // 13528
@SP // 13529
AM=M+1 // 13530
A=A-1 // 13531
M=0 // 13532
@SP // 13533
AM=M+1 // 13534
A=A-1 // 13535
M=0 // 13536
@SP // 13537
AM=M+1 // 13538
A=A-1 // 13539
M=0 // 13540
@SP // 13541
AM=M+1 // 13542
A=A-1 // 13543
M=0 // 13544

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13545
A=M // 13546
M=0 // 13547

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13548
A=M+1 // 13549
A=A+1 // 13550
D=M // 13551
@LCL // 13552
A=M+1 // 13553
M=D // 13554

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

@ARG // 13555
A=M+1 // 13556
A=A+1 // 13557
D=M // 13558
D=D-1 // 13559
D=-D // 13560
@LCL // 13561
A=M+1 // 13562
A=A+1 // 13563
M=D // 13564

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
@Screen.drawCircle.EQ.11 // 13565
D=A // 13566
@SP // 13567
AM=M+1 // 13568
A=A-1 // 13569
M=D // 13570
@Screen.drawCircle.GT.12 // 13571
D=A // 13572
@SP // 13573
AM=M+1 // 13574
A=A-1 // 13575
M=D // 13576
@LCL // 13577
A=M+1 // 13578
D=M // 13579
A=A-1 // 13580
D=M-D // 13581
@DO_GT // 13582
0;JMP // 13583
(Screen.drawCircle.GT.12)
D=!D // 13584
@DO_EQ // 13585
0;JMP // 13586
(Screen.drawCircle.EQ.11)
@WHILE_END_Screen.drawCircle1 // 13587
D;JNE // 13588

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

@ARG // 13589
A=M // 13590
D=M // 13591
@SP // 13592
AM=M+1 // 13593
A=A-1 // 13594
M=D // 13595
@LCL // 13596
A=M // 13597
D=M // 13598
@SP // 13599
AM=M-1 // 13600
D=M-D // 13601
@SP // 13602
AM=M+1 // 13603
A=A-1 // 13604
M=D // 13605
@ARG // 13606
A=M // 13607
D=M // 13608
@SP // 13609
AM=M+1 // 13610
A=A-1 // 13611
M=D // 13612
@LCL // 13613
A=M // 13614
D=M // 13615
@SP // 13616
AM=M-1 // 13617
D=D+M // 13618
@SP // 13619
AM=M+1 // 13620
A=A-1 // 13621
M=D // 13622
@ARG // 13623
A=M+1 // 13624
D=M // 13625
@SP // 13626
AM=M+1 // 13627
A=A-1 // 13628
M=D // 13629
@LCL // 13630
A=M+1 // 13631
D=M // 13632
@SP // 13633
AM=M-1 // 13634
D=D+M // 13635
@SP // 13636
AM=M+1 // 13637
A=A-1 // 13638
M=D // 13639
// call Screen.drawHorizontalLine
@8 // 13640
D=A // 13641
@14 // 13642
M=D // 13643
@Screen.drawHorizontalLine // 13644
D=A // 13645
@13 // 13646
M=D // 13647
@Screen.drawCircle.ret.0 // 13648
D=A // 13649
@CALL // 13650
0;JMP // 13651
(Screen.drawCircle.ret.0)
@SP // 13652
M=M-1 // 13653

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

@ARG // 13654
A=M // 13655
D=M // 13656
@SP // 13657
AM=M+1 // 13658
A=A-1 // 13659
M=D // 13660
@LCL // 13661
A=M // 13662
D=M // 13663
@SP // 13664
AM=M-1 // 13665
D=M-D // 13666
@SP // 13667
AM=M+1 // 13668
A=A-1 // 13669
M=D // 13670
@ARG // 13671
A=M // 13672
D=M // 13673
@SP // 13674
AM=M+1 // 13675
A=A-1 // 13676
M=D // 13677
@LCL // 13678
A=M // 13679
D=M // 13680
@SP // 13681
AM=M-1 // 13682
D=D+M // 13683
@SP // 13684
AM=M+1 // 13685
A=A-1 // 13686
M=D // 13687
@ARG // 13688
A=M+1 // 13689
D=M // 13690
@SP // 13691
AM=M+1 // 13692
A=A-1 // 13693
M=D // 13694
@LCL // 13695
A=M+1 // 13696
D=M // 13697
@SP // 13698
AM=M-1 // 13699
D=M-D // 13700
@SP // 13701
AM=M+1 // 13702
A=A-1 // 13703
M=D // 13704
// call Screen.drawHorizontalLine
@8 // 13705
D=A // 13706
@14 // 13707
M=D // 13708
@Screen.drawHorizontalLine // 13709
D=A // 13710
@13 // 13711
M=D // 13712
@Screen.drawCircle.ret.1 // 13713
D=A // 13714
@CALL // 13715
0;JMP // 13716
(Screen.drawCircle.ret.1)
@SP // 13717
M=M-1 // 13718

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

@ARG // 13719
A=M // 13720
D=M // 13721
@SP // 13722
AM=M+1 // 13723
A=A-1 // 13724
M=D // 13725
@LCL // 13726
A=M+1 // 13727
D=M // 13728
@SP // 13729
AM=M-1 // 13730
D=M-D // 13731
@SP // 13732
AM=M+1 // 13733
A=A-1 // 13734
M=D // 13735
@ARG // 13736
A=M // 13737
D=M // 13738
@SP // 13739
AM=M+1 // 13740
A=A-1 // 13741
M=D // 13742
@LCL // 13743
A=M+1 // 13744
D=M // 13745
@SP // 13746
AM=M-1 // 13747
D=D+M // 13748
@SP // 13749
AM=M+1 // 13750
A=A-1 // 13751
M=D // 13752
@ARG // 13753
A=M+1 // 13754
D=M // 13755
@SP // 13756
AM=M+1 // 13757
A=A-1 // 13758
M=D // 13759
@LCL // 13760
A=M // 13761
D=M // 13762
@SP // 13763
AM=M-1 // 13764
D=D+M // 13765
@SP // 13766
AM=M+1 // 13767
A=A-1 // 13768
M=D // 13769
// call Screen.drawHorizontalLine
@8 // 13770
D=A // 13771
@14 // 13772
M=D // 13773
@Screen.drawHorizontalLine // 13774
D=A // 13775
@13 // 13776
M=D // 13777
@Screen.drawCircle.ret.2 // 13778
D=A // 13779
@CALL // 13780
0;JMP // 13781
(Screen.drawCircle.ret.2)
@SP // 13782
M=M-1 // 13783

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

@ARG // 13784
A=M // 13785
D=M // 13786
@SP // 13787
AM=M+1 // 13788
A=A-1 // 13789
M=D // 13790
@LCL // 13791
A=M+1 // 13792
D=M // 13793
@SP // 13794
AM=M-1 // 13795
D=M-D // 13796
@SP // 13797
AM=M+1 // 13798
A=A-1 // 13799
M=D // 13800
@ARG // 13801
A=M // 13802
D=M // 13803
@SP // 13804
AM=M+1 // 13805
A=A-1 // 13806
M=D // 13807
@LCL // 13808
A=M+1 // 13809
D=M // 13810
@SP // 13811
AM=M-1 // 13812
D=D+M // 13813
@SP // 13814
AM=M+1 // 13815
A=A-1 // 13816
M=D // 13817
@ARG // 13818
A=M+1 // 13819
D=M // 13820
@SP // 13821
AM=M+1 // 13822
A=A-1 // 13823
M=D // 13824
@LCL // 13825
A=M // 13826
D=M // 13827
@SP // 13828
AM=M-1 // 13829
D=M-D // 13830
@SP // 13831
AM=M+1 // 13832
A=A-1 // 13833
M=D // 13834
// call Screen.drawHorizontalLine
@8 // 13835
D=A // 13836
@14 // 13837
M=D // 13838
@Screen.drawHorizontalLine // 13839
D=A // 13840
@13 // 13841
M=D // 13842
@Screen.drawCircle.ret.3 // 13843
D=A // 13844
@CALL // 13845
0;JMP // 13846
(Screen.drawCircle.ret.3)
@SP // 13847
M=M-1 // 13848

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
@Screen.drawCircle.LT.13 // 13849
D=A // 13850
@SP // 13851
AM=M+1 // 13852
A=A-1 // 13853
M=D // 13854
@LCL // 13855
A=M+1 // 13856
A=A+1 // 13857
D=M // 13858
@DO_LT // 13859
0;JMP // 13860
(Screen.drawCircle.LT.13)
D=!D // 13861
@Screen.drawCircle.IfElse1 // 13862
D;JNE // 13863

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

@LCL // 13864
A=M+1 // 13865
A=A+1 // 13866
D=M // 13867
@SP // 13868
AM=M+1 // 13869
A=A-1 // 13870
M=D // 13871
@LCL // 13872
A=M // 13873
D=M // 13874
D=D+M // 13875
@SP // 13876
AM=M-1 // 13877
D=D+M // 13878
@3 // 13879
D=D+A // 13880
@LCL // 13881
A=M+1 // 13882
A=A+1 // 13883
M=D // 13884

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13885
0;JMP // 13886

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

@LCL // 13887
A=M+1 // 13888
A=A+1 // 13889
D=M // 13890
@SP // 13891
AM=M+1 // 13892
A=A-1 // 13893
M=D // 13894
@LCL // 13895
A=M+1 // 13896
D=M // 13897
A=A-1 // 13898
D=M-D // 13899
@R13 // 13900
M=D // 13901
D=D+M // 13902
@SP // 13903
AM=M-1 // 13904
D=D+M // 13905
@5 // 13906
D=D+A // 13907
@LCL // 13908
A=M+1 // 13909
A=A+1 // 13910
M=D // 13911

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

@LCL // 13912
A=M+1 // 13913
D=M // 13914
D=D-1 // 13915
@LCL // 13916
A=M+1 // 13917
M=D // 13918

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

@LCL // 13919
A=M // 13920
D=M // 13921
D=D+1 // 13922
@LCL // 13923
A=M // 13924
M=D // 13925

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13926
0;JMP // 13927

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13928
AM=M+1 // 13929
A=A-1 // 13930
M=0 // 13931

////ReturnInstruction{}
@RETURN // 13932
0;JMP // 13933

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 13934
AM=M+1 // 13935
A=A-1 // 13936
M=0 // 13937
@SP // 13938
AM=M+1 // 13939
A=A-1 // 13940
M=0 // 13941
@SP // 13942
AM=M+1 // 13943
A=A-1 // 13944
M=0 // 13945
@SP // 13946
AM=M+1 // 13947
A=A-1 // 13948
M=0 // 13949
@SP // 13950
AM=M+1 // 13951
A=A-1 // 13952
M=0 // 13953
@SP // 13954
AM=M+1 // 13955
A=A-1 // 13956
M=0 // 13957
@SP // 13958
AM=M+1 // 13959
A=A-1 // 13960
M=0 // 13961
@SP // 13962
AM=M+1 // 13963
A=A-1 // 13964
M=0 // 13965
@SP // 13966
AM=M+1 // 13967
A=A-1 // 13968
M=0 // 13969
@SP // 13970
AM=M+1 // 13971
A=A-1 // 13972
M=0 // 13973

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13974
D=M // 13975
@9 // 13976
A=D+A // 13977
M=-1 // 13978

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.14 // 13979
D=A // 13980
@SP // 13981
AM=M+1 // 13982
A=A-1 // 13983
M=D // 13984
@Screen.0 // 13985
D=!M // 13986
@DO_EQ // 13987
0;JMP // 13988
(Screen.drawRectangle.EQ.14)
@Screen.drawRectangle.IfElse1 // 13989
D;JNE // 13990

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13991
D=M // 13992
@9 // 13993
A=D+A // 13994
M=0 // 13995

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 13996
0;JMP // 13997

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

@ARG // 13998
A=M+1 // 13999
D=M // 14000
@LCL // 14001
A=M // 14002
M=D // 14003

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
@Screen.drawRectangle.EQ.15 // 14004
D=A // 14005
@SP // 14006
AM=M+1 // 14007
A=A-1 // 14008
M=D // 14009
@Screen.drawRectangle.GT.16 // 14010
D=A // 14011
@SP // 14012
AM=M+1 // 14013
A=A-1 // 14014
M=D // 14015
@LCL // 14016
A=M // 14017
D=M // 14018
@SP // 14019
AM=M+1 // 14020
A=A-1 // 14021
M=D // 14022
@ARG // 14023
A=M+1 // 14024
A=A+1 // 14025
A=A+1 // 14026
D=M // 14027
@SP // 14028
AM=M-1 // 14029
D=M-D // 14030
@DO_GT // 14031
0;JMP // 14032
(Screen.drawRectangle.GT.16)
D=!D // 14033
@DO_EQ // 14034
0;JMP // 14035
(Screen.drawRectangle.EQ.15)
@WHILE_END_Screen.drawRectangle1 // 14036
D;JNE // 14037

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 14038
A=M // 14039
D=M // 14040
@SP // 14041
AM=M+1 // 14042
A=A-1 // 14043
M=D // 14044
@16 // 14045
D=A // 14046
@SP // 14047
AM=M+1 // 14048
A=A-1 // 14049
M=D // 14050
// call Math.divide
@7 // 14051
D=A // 14052
@14 // 14053
M=D // 14054
@Math.divide // 14055
D=A // 14056
@13 // 14057
M=D // 14058
@Screen.drawRectangle.ret.0 // 14059
D=A // 14060
@CALL // 14061
0;JMP // 14062
(Screen.drawRectangle.ret.0)
@SP // 14063
AM=M-1 // 14064
D=M // 14065
@LCL // 14066
A=M+1 // 14067
M=D // 14068

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 14069
A=M+1 // 14070
A=A+1 // 14071
D=M // 14072
@SP // 14073
AM=M+1 // 14074
A=A-1 // 14075
M=D // 14076
@16 // 14077
D=A // 14078
@SP // 14079
AM=M+1 // 14080
A=A-1 // 14081
M=D // 14082
// call Math.divide
@7 // 14083
D=A // 14084
@14 // 14085
M=D // 14086
@Math.divide // 14087
D=A // 14088
@13 // 14089
M=D // 14090
@Screen.drawRectangle.ret.1 // 14091
D=A // 14092
@CALL // 14093
0;JMP // 14094
(Screen.drawRectangle.ret.1)
@SP // 14095
AM=M-1 // 14096
D=M // 14097
@LCL // 14098
A=M+1 // 14099
A=A+1 // 14100
M=D // 14101

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

@ARG // 14102
A=M // 14103
D=M // 14104
@15 // 14105
D=D&A // 14106
@LCL // 14107
A=M+1 // 14108
A=A+1 // 14109
A=A+1 // 14110
M=D // 14111

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

@ARG // 14112
A=M+1 // 14113
A=A+1 // 14114
D=M // 14115
@15 // 14116
D=D&A // 14117
@SP // 14118
AM=M+1 // 14119
A=A-1 // 14120
M=D // 14121
@LCL // 14122
D=M // 14123
@4 // 14124
A=D+A // 14125
D=A // 14126
@R13 // 14127
M=D // 14128
@SP // 14129
AM=M-1 // 14130
D=M // 14131
@R13 // 14132
A=M // 14133
M=D // 14134

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 14135
A=M // 14136
D=M // 14137
@SP // 14138
AM=M+1 // 14139
A=A-1 // 14140
M=D // 14141
@32 // 14142
D=A // 14143
@SP // 14144
AM=M+1 // 14145
A=A-1 // 14146
M=D // 14147
// call Math.multiply
@7 // 14148
D=A // 14149
@14 // 14150
M=D // 14151
@Math.multiply // 14152
D=A // 14153
@13 // 14154
M=D // 14155
@Screen.drawRectangle.ret.2 // 14156
D=A // 14157
@CALL // 14158
0;JMP // 14159
(Screen.drawRectangle.ret.2)
@LCL // 14160
D=M // 14161
@5 // 14162
A=D+A // 14163
D=A // 14164
@R13 // 14165
M=D // 14166
@SP // 14167
AM=M-1 // 14168
D=M // 14169
@R13 // 14170
A=M // 14171
M=D // 14172

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
@Screen.drawRectangle.EQ.17 // 14173
D=A // 14174
@SP // 14175
AM=M+1 // 14176
A=A-1 // 14177
M=D // 14178
@LCL // 14179
A=M+1 // 14180
A=A+1 // 14181
D=M // 14182
A=A-1 // 14183
D=M-D // 14184
@DO_EQ // 14185
0;JMP // 14186
(Screen.drawRectangle.EQ.17)
D=!D // 14187
@Screen.drawRectangle.IfElse2 // 14188
D;JNE // 14189

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

@LCL // 14190
D=M // 14191
@4 // 14192
A=D+A // 14193
D=M // 14194
@SP // 14195
AM=M+1 // 14196
A=A-1 // 14197
M=D+1 // 14198
// call Math.twoToThe
@6 // 14199
D=A // 14200
@14 // 14201
M=D // 14202
@Math.twoToThe // 14203
D=A // 14204
@13 // 14205
M=D // 14206
@Screen.drawRectangle.ret.3 // 14207
D=A // 14208
@CALL // 14209
0;JMP // 14210
(Screen.drawRectangle.ret.3)
@SP // 14211
AM=M-1 // 14212
D=M // 14213
D=D-1 // 14214
@SP // 14215
AM=M+1 // 14216
A=A-1 // 14217
M=D // 14218
@LCL // 14219
A=M+1 // 14220
A=A+1 // 14221
A=A+1 // 14222
D=M // 14223
@SP // 14224
AM=M+1 // 14225
A=A-1 // 14226
M=D // 14227
// call Math.twoToThe
@6 // 14228
D=A // 14229
@14 // 14230
M=D // 14231
@Math.twoToThe // 14232
D=A // 14233
@13 // 14234
M=D // 14235
@Screen.drawRectangle.ret.4 // 14236
D=A // 14237
@CALL // 14238
0;JMP // 14239
(Screen.drawRectangle.ret.4)
@SP // 14240
AM=M-1 // 14241
D=M // 14242
D=D-1 // 14243
@SP // 14244
AM=M-1 // 14245
D=M-D // 14246
@SP // 14247
AM=M+1 // 14248
A=A-1 // 14249
M=D // 14250
@LCL // 14251
D=M // 14252
@6 // 14253
A=D+A // 14254
D=A // 14255
@R13 // 14256
M=D // 14257
@SP // 14258
AM=M-1 // 14259
D=M // 14260
@R13 // 14261
A=M // 14262
M=D // 14263

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

@LCL // 14264
D=M // 14265
@5 // 14266
A=D+A // 14267
D=M // 14268
@SP // 14269
AM=M+1 // 14270
A=A-1 // 14271
M=D // 14272
@LCL // 14273
A=M+1 // 14274
D=M // 14275
@SP // 14276
AM=M-1 // 14277
D=D+M // 14278
@SP // 14279
AM=M+1 // 14280
A=A-1 // 14281
M=D // 14282
@LCL // 14283
D=M // 14284
@7 // 14285
A=D+A // 14286
D=A // 14287
@R13 // 14288
M=D // 14289
@SP // 14290
AM=M-1 // 14291
D=M // 14292
@R13 // 14293
A=M // 14294
M=D // 14295

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.18 // 14296
D=A // 14297
@SP // 14298
AM=M+1 // 14299
A=A-1 // 14300
M=D // 14301
@Screen.0 // 14302
D=M // 14303
@DO_EQ // 14304
0;JMP // 14305
(Screen.drawRectangle.EQ.18)
@Screen.drawRectangle.IfElse3 // 14306
D;JNE // 14307

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
@LCL // 14308
D=M // 14309
@7 // 14310
A=D+A // 14311
D=M // 14312
@16384 // 14313
D=D+A // 14314
@SP // 14315
AM=M+1 // 14316
A=A-1 // 14317
M=D // 14318
@LCL // 14319
D=M // 14320
@7 // 14321
A=D+A // 14322
D=M // 14323
@16384 // 14324
A=D+A // 14325
D=M // 14326
@SP // 14327
AM=M+1 // 14328
A=A-1 // 14329
M=D // 14330
@LCL // 14331
D=M // 14332
@6 // 14333
A=D+A // 14334
D=M // 14335
@SP // 14336
AM=M-1 // 14337
D=D|M // 14338
@SP // 14339
AM=M-1 // 14340
A=M // 14341
M=D // 14342

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 14343
0;JMP // 14344

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
@LCL // 14345
D=M // 14346
@7 // 14347
A=D+A // 14348
D=M // 14349
@16384 // 14350
D=D+A // 14351
@SP // 14352
AM=M+1 // 14353
A=A-1 // 14354
M=D // 14355
@LCL // 14356
D=M // 14357
@7 // 14358
A=D+A // 14359
D=M // 14360
@16384 // 14361
A=D+A // 14362
D=M // 14363
@SP // 14364
AM=M+1 // 14365
A=A-1 // 14366
M=D // 14367
@LCL // 14368
D=M // 14369
@6 // 14370
A=D+A // 14371
D=!M // 14372
@SP // 14373
AM=M-1 // 14374
D=D&M // 14375
@SP // 14376
AM=M-1 // 14377
A=M // 14378
M=D // 14379

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 14380
0;JMP // 14381

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

@LCL // 14382
A=M+1 // 14383
A=A+1 // 14384
A=A+1 // 14385
D=M // 14386
@SP // 14387
AM=M+1 // 14388
A=A-1 // 14389
M=D // 14390
// call Math.twoToThe
@6 // 14391
D=A // 14392
@14 // 14393
M=D // 14394
@Math.twoToThe // 14395
D=A // 14396
@13 // 14397
M=D // 14398
@Screen.drawRectangle.ret.5 // 14399
D=A // 14400
@CALL // 14401
0;JMP // 14402
(Screen.drawRectangle.ret.5)
@SP // 14403
AM=M-1 // 14404
D=M // 14405
D=D-1 // 14406
@SP // 14407
AM=M+1 // 14408
A=A-1 // 14409
M=D // 14410
@SP // 14411
A=M-1 // 14412
M=!D // 14413
@LCL // 14414
D=M // 14415
@6 // 14416
A=D+A // 14417
D=A // 14418
@R13 // 14419
M=D // 14420
@SP // 14421
AM=M-1 // 14422
D=M // 14423
@R13 // 14424
A=M // 14425
M=D // 14426

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

@LCL // 14427
D=M // 14428
@5 // 14429
A=D+A // 14430
D=M // 14431
@SP // 14432
AM=M+1 // 14433
A=A-1 // 14434
M=D // 14435
@LCL // 14436
A=M+1 // 14437
D=M // 14438
@SP // 14439
AM=M-1 // 14440
D=D+M // 14441
@SP // 14442
AM=M+1 // 14443
A=A-1 // 14444
M=D // 14445
@LCL // 14446
D=M // 14447
@7 // 14448
A=D+A // 14449
D=A // 14450
@R13 // 14451
M=D // 14452
@SP // 14453
AM=M-1 // 14454
D=M // 14455
@R13 // 14456
A=M // 14457
M=D // 14458

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.19 // 14459
D=A // 14460
@SP // 14461
AM=M+1 // 14462
A=A-1 // 14463
M=D // 14464
@Screen.0 // 14465
D=M // 14466
@DO_EQ // 14467
0;JMP // 14468
(Screen.drawRectangle.EQ.19)
@Screen.drawRectangle.IfElse4 // 14469
D;JNE // 14470

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
@LCL // 14471
D=M // 14472
@7 // 14473
A=D+A // 14474
D=M // 14475
@16384 // 14476
D=D+A // 14477
@SP // 14478
AM=M+1 // 14479
A=A-1 // 14480
M=D // 14481
@LCL // 14482
D=M // 14483
@7 // 14484
A=D+A // 14485
D=M // 14486
@16384 // 14487
A=D+A // 14488
D=M // 14489
@SP // 14490
AM=M+1 // 14491
A=A-1 // 14492
M=D // 14493
@LCL // 14494
D=M // 14495
@6 // 14496
A=D+A // 14497
D=M // 14498
@SP // 14499
AM=M-1 // 14500
D=D|M // 14501
@SP // 14502
AM=M-1 // 14503
A=M // 14504
M=D // 14505

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 14506
0;JMP // 14507

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
@LCL // 14508
D=M // 14509
@7 // 14510
A=D+A // 14511
D=M // 14512
@16384 // 14513
D=D+A // 14514
@SP // 14515
AM=M+1 // 14516
A=A-1 // 14517
M=D // 14518
@LCL // 14519
D=M // 14520
@7 // 14521
A=D+A // 14522
D=M // 14523
@16384 // 14524
A=D+A // 14525
D=M // 14526
@SP // 14527
AM=M+1 // 14528
A=A-1 // 14529
M=D // 14530
@LCL // 14531
D=M // 14532
@6 // 14533
A=D+A // 14534
D=!M // 14535
@SP // 14536
AM=M-1 // 14537
D=D&M // 14538
@SP // 14539
AM=M-1 // 14540
A=M // 14541
M=D // 14542

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

@LCL // 14543
A=M+1 // 14544
D=M // 14545
@SP // 14546
AM=M+1 // 14547
A=A-1 // 14548
M=D+1 // 14549
@LCL // 14550
D=M // 14551
@8 // 14552
A=D+A // 14553
D=A // 14554
@R13 // 14555
M=D // 14556
@SP // 14557
AM=M-1 // 14558
D=M // 14559
@R13 // 14560
A=M // 14561
M=D // 14562

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
@Screen.drawRectangle.LT.20 // 14563
D=A // 14564
@SP // 14565
AM=M+1 // 14566
A=A-1 // 14567
M=D // 14568
@LCL // 14569
D=M // 14570
@8 // 14571
A=D+A // 14572
D=M // 14573
@SP // 14574
AM=M+1 // 14575
A=A-1 // 14576
M=D // 14577
@LCL // 14578
A=M+1 // 14579
A=A+1 // 14580
D=M // 14581
@SP // 14582
AM=M-1 // 14583
D=M-D // 14584
@DO_LT // 14585
0;JMP // 14586
(Screen.drawRectangle.LT.20)
D=!D // 14587
@WHILE_END_Screen.drawRectangle2 // 14588
D;JNE // 14589

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

@LCL // 14590
D=M // 14591
@8 // 14592
A=D+A // 14593
D=M // 14594
A=A-1 // 14595
A=A-1 // 14596
A=A-1 // 14597
D=D+M // 14598
@SP // 14599
AM=M+1 // 14600
A=A-1 // 14601
M=D // 14602
@LCL // 14603
D=M // 14604
@7 // 14605
A=D+A // 14606
D=A // 14607
@R13 // 14608
M=D // 14609
@SP // 14610
AM=M-1 // 14611
D=M // 14612
@R13 // 14613
A=M // 14614
M=D // 14615

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14616
D=M // 14617
@7 // 14618
A=D+A // 14619
D=M // 14620
@16384 // 14621
D=D+A // 14622
@SP // 14623
AM=M+1 // 14624
A=A-1 // 14625
M=D // 14626
@LCL // 14627
D=M // 14628
@9 // 14629
A=D+A // 14630
D=M // 14631
@SP // 14632
AM=M-1 // 14633
A=M // 14634
M=D // 14635

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

@LCL // 14636
D=M // 14637
@8 // 14638
A=D+A // 14639
D=M // 14640
@SP // 14641
AM=M+1 // 14642
A=A-1 // 14643
M=D+1 // 14644
@LCL // 14645
D=M // 14646
@8 // 14647
A=D+A // 14648
D=A // 14649
@R13 // 14650
M=D // 14651
@SP // 14652
AM=M-1 // 14653
D=M // 14654
@R13 // 14655
A=M // 14656
M=D // 14657

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14658
0;JMP // 14659

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

@LCL // 14660
D=M // 14661
@4 // 14662
A=D+A // 14663
D=M // 14664
@SP // 14665
AM=M+1 // 14666
A=A-1 // 14667
M=D+1 // 14668
// call Math.twoToThe
@6 // 14669
D=A // 14670
@14 // 14671
M=D // 14672
@Math.twoToThe // 14673
D=A // 14674
@13 // 14675
M=D // 14676
@Screen.drawRectangle.ret.6 // 14677
D=A // 14678
@CALL // 14679
0;JMP // 14680
(Screen.drawRectangle.ret.6)
@SP // 14681
AM=M-1 // 14682
D=M // 14683
D=D-1 // 14684
@SP // 14685
AM=M+1 // 14686
A=A-1 // 14687
M=D // 14688
@LCL // 14689
D=M // 14690
@6 // 14691
A=D+A // 14692
D=A // 14693
@R13 // 14694
M=D // 14695
@SP // 14696
AM=M-1 // 14697
D=M // 14698
@R13 // 14699
A=M // 14700
M=D // 14701

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

@LCL // 14702
D=M // 14703
@5 // 14704
A=D+A // 14705
D=M // 14706
A=A-1 // 14707
A=A-1 // 14708
A=A-1 // 14709
D=D+M // 14710
@SP // 14711
AM=M+1 // 14712
A=A-1 // 14713
M=D // 14714
@LCL // 14715
D=M // 14716
@7 // 14717
A=D+A // 14718
D=A // 14719
@R13 // 14720
M=D // 14721
@SP // 14722
AM=M-1 // 14723
D=M // 14724
@R13 // 14725
A=M // 14726
M=D // 14727

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.21 // 14728
D=A // 14729
@SP // 14730
AM=M+1 // 14731
A=A-1 // 14732
M=D // 14733
@Screen.0 // 14734
D=M // 14735
@DO_EQ // 14736
0;JMP // 14737
(Screen.drawRectangle.EQ.21)
@Screen.drawRectangle.IfElse5 // 14738
D;JNE // 14739

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
@LCL // 14740
D=M // 14741
@7 // 14742
A=D+A // 14743
D=M // 14744
@16384 // 14745
D=D+A // 14746
@SP // 14747
AM=M+1 // 14748
A=A-1 // 14749
M=D // 14750
@LCL // 14751
D=M // 14752
@7 // 14753
A=D+A // 14754
D=M // 14755
@16384 // 14756
A=D+A // 14757
D=M // 14758
@SP // 14759
AM=M+1 // 14760
A=A-1 // 14761
M=D // 14762
@LCL // 14763
D=M // 14764
@6 // 14765
A=D+A // 14766
D=M // 14767
@SP // 14768
AM=M-1 // 14769
D=D|M // 14770
@SP // 14771
AM=M-1 // 14772
A=M // 14773
M=D // 14774

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14775
0;JMP // 14776

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
@LCL // 14777
D=M // 14778
@7 // 14779
A=D+A // 14780
D=M // 14781
@16384 // 14782
D=D+A // 14783
@SP // 14784
AM=M+1 // 14785
A=A-1 // 14786
M=D // 14787
@LCL // 14788
D=M // 14789
@7 // 14790
A=D+A // 14791
D=M // 14792
@16384 // 14793
A=D+A // 14794
D=M // 14795
@SP // 14796
AM=M+1 // 14797
A=A-1 // 14798
M=D // 14799
@LCL // 14800
D=M // 14801
@6 // 14802
A=D+A // 14803
D=!M // 14804
@SP // 14805
AM=M-1 // 14806
D=D&M // 14807
@SP // 14808
AM=M-1 // 14809
A=M // 14810
M=D // 14811

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

@LCL // 14812
A=M // 14813
D=M // 14814
D=D+1 // 14815
@LCL // 14816
A=M // 14817
M=D // 14818

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14819
0;JMP // 14820

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14821
AM=M+1 // 14822
A=A-1 // 14823
M=0 // 14824

////ReturnInstruction{}
@RETURN // 14825
0;JMP // 14826

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14827
AM=M+1 // 14828
A=A-1 // 14829
M=0 // 14830

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14831
A=M // 14832
M=0 // 14833

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
@Screen.clearScreen.LT.22 // 14834
D=A // 14835
@SP // 14836
AM=M+1 // 14837
A=A-1 // 14838
M=D // 14839
@LCL // 14840
A=M // 14841
D=M // 14842
@8192 // 14843
D=D-A // 14844
@DO_LT // 14845
0;JMP // 14846
(Screen.clearScreen.LT.22)
D=!D // 14847
@WHILE_END_Screen.clearScreen1 // 14848
D;JNE // 14849

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14850
A=M // 14851
D=M // 14852
@16384 // 14853
D=D+A // 14854
@SP // 14855
AM=M+1 // 14856
A=A-1 // 14857
M=D // 14858
D=0 // 14859
@SP // 14860
AM=M-1 // 14861
A=M // 14862
M=D // 14863

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

@LCL // 14864
A=M // 14865
D=M // 14866
D=D+1 // 14867
@LCL // 14868
A=M // 14869
M=D // 14870

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14871
0;JMP // 14872

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14873
AM=M+1 // 14874
A=A-1 // 14875
M=0 // 14876

////ReturnInstruction{}
@RETURN // 14877
0;JMP // 14878

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14879
D=A // 14880
@SP // 14881
AM=M+1 // 14882
A=A-1 // 14883
M=D // 14884
// call Memory.alloc
@6 // 14885
D=A // 14886
@14 // 14887
M=D // 14888
@Memory.alloc // 14889
D=A // 14890
@13 // 14891
M=D // 14892
@String.new.ret.0 // 14893
D=A // 14894
@CALL // 14895
0;JMP // 14896
(String.new.ret.0)
@SP // 14897
AM=M-1 // 14898
D=M // 14899
@3 // 14900
M=D // 14901

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
@String.new.EQ.0 // 14902
D=A // 14903
@SP // 14904
AM=M+1 // 14905
A=A-1 // 14906
M=D // 14907
@ARG // 14908
A=M // 14909
D=M // 14910
@DO_EQ // 14911
0;JMP // 14912
(String.new.EQ.0)
D=!D // 14913
@String.new.IfElse1 // 14914
D;JNE // 14915

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14916
A=M // 14917
M=0 // 14918

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14919
0;JMP // 14920

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14921
A=M // 14922
D=M // 14923
@SP // 14924
AM=M+1 // 14925
A=A-1 // 14926
M=D // 14927
// call Array.new
@6 // 14928
D=A // 14929
@14 // 14930
M=D // 14931
@Array.new // 14932
D=A // 14933
@13 // 14934
M=D // 14935
@String.new.ret.1 // 14936
D=A // 14937
@CALL // 14938
0;JMP // 14939
(String.new.ret.1)
@SP // 14940
AM=M-1 // 14941
D=M // 14942
@THIS // 14943
A=M // 14944
M=D // 14945

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14946
A=M // 14947
D=M // 14948
@THIS // 14949
A=M+1 // 14950
A=A+1 // 14951
M=D // 14952

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14953
A=M+1 // 14954
M=0 // 14955

////PushInstruction("pointer 0")
@3 // 14956
D=M // 14957
@SP // 14958
AM=M+1 // 14959
A=A-1 // 14960
M=D // 14961

////ReturnInstruction{}
@RETURN // 14962
0;JMP // 14963

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14964
A=M // 14965
D=M // 14966
@3 // 14967
M=D // 14968

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
@String.dispose.EQ.1 // 14969
D=A // 14970
@SP // 14971
AM=M+1 // 14972
A=A-1 // 14973
M=D // 14974
@String.dispose.EQ.2 // 14975
D=A // 14976
@SP // 14977
AM=M+1 // 14978
A=A-1 // 14979
M=D // 14980
@THIS // 14981
A=M // 14982
D=M // 14983
@DO_EQ // 14984
0;JMP // 14985
(String.dispose.EQ.2)
D=!D // 14986
@DO_EQ // 14987
0;JMP // 14988
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 14989
D;JNE // 14990

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14991
A=M // 14992
D=M // 14993
@SP // 14994
AM=M+1 // 14995
A=A-1 // 14996
M=D // 14997
// call Array.dispose
@6 // 14998
D=A // 14999
@14 // 15000
M=D // 15001
@Array.dispose // 15002
D=A // 15003
@13 // 15004
M=D // 15005
@String.dispose.ret.0 // 15006
D=A // 15007
@CALL // 15008
0;JMP // 15009
(String.dispose.ret.0)
@SP // 15010
M=M-1 // 15011

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 15012
0;JMP // 15013

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 15014
AM=M+1 // 15015
A=A-1 // 15016
M=0 // 15017

////ReturnInstruction{}
@RETURN // 15018
0;JMP // 15019

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15020
A=M // 15021
D=M // 15022
@3 // 15023
M=D // 15024

////PushInstruction("this 1")
@THIS // 15025
A=M+1 // 15026
D=M // 15027
@SP // 15028
AM=M+1 // 15029
A=A-1 // 15030
M=D // 15031

////ReturnInstruction{}
@RETURN // 15032
0;JMP // 15033

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15034
A=M // 15035
D=M // 15036
@3 // 15037
M=D // 15038

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
@THIS // 15039
A=M // 15040
D=M // 15041
@SP // 15042
AM=M+1 // 15043
A=A-1 // 15044
M=D // 15045
@ARG // 15046
A=M+1 // 15047
D=M // 15048
@SP // 15049
AM=M-1 // 15050
A=D+M // 15051
D=M // 15052
@SP // 15053
AM=M+1 // 15054
A=A-1 // 15055
M=D // 15056

////ReturnInstruction{}
@RETURN // 15057
0;JMP // 15058

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15059
A=M // 15060
D=M // 15061
@3 // 15062
M=D // 15063

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 15064
A=M // 15065
D=M // 15066
@SP // 15067
AM=M+1 // 15068
A=A-1 // 15069
M=D // 15070
@ARG // 15071
A=M+1 // 15072
D=M // 15073
@SP // 15074
AM=M-1 // 15075
D=D+M // 15076
@SP // 15077
AM=M+1 // 15078
A=A-1 // 15079
M=D // 15080
@ARG // 15081
A=M+1 // 15082
A=A+1 // 15083
D=M // 15084
@SP // 15085
AM=M-1 // 15086
A=M // 15087
M=D // 15088

////PushInstruction("constant 0")
@SP // 15089
AM=M+1 // 15090
A=A-1 // 15091
M=0 // 15092

////ReturnInstruction{}
@RETURN // 15093
0;JMP // 15094

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 15095
AM=M+1 // 15096
A=A-1 // 15097
M=0 // 15098

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15099
A=M // 15100
D=M // 15101
@3 // 15102
M=D // 15103

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
@String.appendChar.EQ.3 // 15104
D=A // 15105
@SP // 15106
AM=M+1 // 15107
A=A-1 // 15108
M=D // 15109
@THIS // 15110
A=M+1 // 15111
A=A+1 // 15112
D=M // 15113
A=A-1 // 15114
D=M-D // 15115
@DO_EQ // 15116
0;JMP // 15117
(String.appendChar.EQ.3)
D=!D // 15118
@String.appendChar.IfElse1 // 15119
D;JNE // 15120

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

@THIS // 15121
A=M+1 // 15122
A=A+1 // 15123
D=M // 15124
D=D+M // 15125
@SP // 15126
AM=M+1 // 15127
A=A-1 // 15128
M=D // 15129
// call Array.new
@6 // 15130
D=A // 15131
@14 // 15132
M=D // 15133
@Array.new // 15134
D=A // 15135
@13 // 15136
M=D // 15137
@String.appendChar.ret.0 // 15138
D=A // 15139
@CALL // 15140
0;JMP // 15141
(String.appendChar.ret.0)
@SP // 15142
AM=M-1 // 15143
D=M // 15144
@LCL // 15145
A=M // 15146
M=D // 15147

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15148
A=M // 15149
D=M // 15150
@SP // 15151
AM=M+1 // 15152
A=A-1 // 15153
M=D // 15154
@LCL // 15155
A=M // 15156
D=M // 15157
@SP // 15158
AM=M+1 // 15159
A=A-1 // 15160
M=D // 15161
@THIS // 15162
A=M+1 // 15163
D=M // 15164
@SP // 15165
AM=M+1 // 15166
A=A-1 // 15167
M=D // 15168
// call Memory.copy
@8 // 15169
D=A // 15170
@14 // 15171
M=D // 15172
@Memory.copy // 15173
D=A // 15174
@13 // 15175
M=D // 15176
@String.appendChar.ret.1 // 15177
D=A // 15178
@CALL // 15179
0;JMP // 15180
(String.appendChar.ret.1)
@SP // 15181
M=M-1 // 15182

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15183
A=M // 15184
D=M // 15185
@SP // 15186
AM=M+1 // 15187
A=A-1 // 15188
M=D // 15189
// call Array.dispose
@6 // 15190
D=A // 15191
@14 // 15192
M=D // 15193
@Array.dispose // 15194
D=A // 15195
@13 // 15196
M=D // 15197
@String.appendChar.ret.2 // 15198
D=A // 15199
@CALL // 15200
0;JMP // 15201
(String.appendChar.ret.2)
@SP // 15202
M=M-1 // 15203

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

@THIS // 15204
A=M+1 // 15205
A=A+1 // 15206
D=M // 15207
D=D+M // 15208
@THIS // 15209
A=M+1 // 15210
A=A+1 // 15211
M=D // 15212

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 15213
A=M // 15214
D=M // 15215
@THIS // 15216
A=M // 15217
M=D // 15218

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 15219
0;JMP // 15220

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
@THIS // 15221
A=M+1 // 15222
D=M // 15223
A=A-1 // 15224
D=D+M // 15225
@SP // 15226
AM=M+1 // 15227
A=A-1 // 15228
M=D // 15229
@ARG // 15230
A=M+1 // 15231
D=M // 15232
@SP // 15233
AM=M-1 // 15234
A=M // 15235
M=D // 15236

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

@THIS // 15237
A=M+1 // 15238
D=M // 15239
D=D+1 // 15240
@THIS // 15241
A=M+1 // 15242
M=D // 15243

////PushInstruction("pointer 0")
@3 // 15244
D=M // 15245
@SP // 15246
AM=M+1 // 15247
A=A-1 // 15248
M=D // 15249

////ReturnInstruction{}
@RETURN // 15250
0;JMP // 15251

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15252
A=M // 15253
D=M // 15254
@3 // 15255
M=D // 15256

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

@THIS // 15257
A=M+1 // 15258
D=M // 15259
D=D-1 // 15260
@THIS // 15261
A=M+1 // 15262
M=D // 15263

////PushInstruction("constant 0")
@SP // 15264
AM=M+1 // 15265
A=A-1 // 15266
M=0 // 15267

////ReturnInstruction{}
@RETURN // 15268
0;JMP // 15269

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 15270
AM=M+1 // 15271
A=A-1 // 15272
M=0 // 15273
@SP // 15274
AM=M+1 // 15275
A=A-1 // 15276
M=0 // 15277

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15278
A=M // 15279
D=M // 15280
@3 // 15281
M=D // 15282

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15283
A=M+1 // 15284
M=1 // 15285

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15286
A=M // 15287
M=0 // 15288

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
@String.intValue.LT.4 // 15289
D=A // 15290
@SP // 15291
AM=M+1 // 15292
A=A-1 // 15293
M=D // 15294
@LCL // 15295
A=M+1 // 15296
D=M // 15297
@SP // 15298
AM=M+1 // 15299
A=A-1 // 15300
M=D // 15301
@THIS // 15302
A=M+1 // 15303
D=M // 15304
@SP // 15305
AM=M-1 // 15306
D=M-D // 15307
@DO_LT // 15308
0;JMP // 15309
(String.intValue.LT.4)
D=!D // 15310
@WHILE_END_String.intValue1 // 15311
D;JNE // 15312

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

@LCL // 15313
A=M // 15314
D=M // 15315
@SP // 15316
AM=M+1 // 15317
A=A-1 // 15318
M=D // 15319
@10 // 15320
D=A // 15321
@SP // 15322
AM=M+1 // 15323
A=A-1 // 15324
M=D // 15325
// call Math.multiply
@7 // 15326
D=A // 15327
@14 // 15328
M=D // 15329
@Math.multiply // 15330
D=A // 15331
@13 // 15332
M=D // 15333
@String.intValue.ret.0 // 15334
D=A // 15335
@CALL // 15336
0;JMP // 15337
(String.intValue.ret.0)
@THIS // 15338
A=M // 15339
D=M // 15340
@SP // 15341
AM=M+1 // 15342
A=A-1 // 15343
M=D // 15344
@LCL // 15345
A=M+1 // 15346
D=M // 15347
@SP // 15348
AM=M-1 // 15349
A=D+M // 15350
D=M // 15351
@48 // 15352
D=D-A // 15353
@SP // 15354
AM=M-1 // 15355
D=D+M // 15356
@LCL // 15357
A=M // 15358
M=D // 15359

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

@LCL // 15360
A=M+1 // 15361
D=M // 15362
D=D+1 // 15363
@LCL // 15364
A=M+1 // 15365
M=D // 15366

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 15367
0;JMP // 15368

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 15369
A=M // 15370
D=M // 15371
@SP // 15372
AM=M+1 // 15373
A=A-1 // 15374
M=D // 15375

////ReturnInstruction{}
@RETURN // 15376
0;JMP // 15377

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 15378
AM=M+1 // 15379
A=A-1 // 15380
M=0 // 15381
@SP // 15382
AM=M+1 // 15383
A=A-1 // 15384
M=0 // 15385
@SP // 15386
AM=M+1 // 15387
A=A-1 // 15388
M=0 // 15389
@SP // 15390
AM=M+1 // 15391
A=A-1 // 15392
M=0 // 15393
@SP // 15394
AM=M+1 // 15395
A=A-1 // 15396
M=0 // 15397
@SP // 15398
AM=M+1 // 15399
A=A-1 // 15400
M=0 // 15401

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15402
A=M // 15403
D=M // 15404
@3 // 15405
M=D // 15406

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 15407
A=M+1 // 15408
M=0 // 15409

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 15410
D=M // 15411
@4 // 15412
A=D+A // 15413
M=0 // 15414

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
@String.setInt.EQ.5 // 15415
D=A // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420
@ARG // 15421
A=M+1 // 15422
D=M // 15423
@DO_EQ // 15424
0;JMP // 15425
(String.setInt.EQ.5)
D=!D // 15426
@String.setInt.IfElse1 // 15427
D;JNE // 15428

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15429
D=M // 15430
@SP // 15431
AM=M+1 // 15432
A=A-1 // 15433
M=D // 15434
@48 // 15435
D=A // 15436
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
@String.setInt.ret.0 // 15449
D=A // 15450
@CALL // 15451
0;JMP // 15452
(String.setInt.ret.0)
@SP // 15453
M=M-1 // 15454

////PushInstruction("constant 0")
@SP // 15455
AM=M+1 // 15456
A=A-1 // 15457
M=0 // 15458

////ReturnInstruction{}
@RETURN // 15459
0;JMP // 15460

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 15461
0;JMP // 15462

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
@String.setInt.LT.6 // 15463
D=A // 15464
@SP // 15465
AM=M+1 // 15466
A=A-1 // 15467
M=D // 15468
@ARG // 15469
A=M+1 // 15470
D=M // 15471
@DO_LT // 15472
0;JMP // 15473
(String.setInt.LT.6)
D=!D // 15474
@String.setInt.IfElse2 // 15475
D;JNE // 15476

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 15477
D=M // 15478
@4 // 15479
A=D+A // 15480
M=1 // 15481

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
@String.setInt.EQ.7 // 15482
D=A // 15483
@SP // 15484
AM=M+1 // 15485
A=A-1 // 15486
M=D // 15487
@String.setInt.LT.8 // 15488
D=A // 15489
@SP // 15490
AM=M+1 // 15491
A=A-1 // 15492
M=D // 15493
@ARG // 15494
A=M+1 // 15495
D=M // 15496
@DO_LT // 15497
0;JMP // 15498
(String.setInt.LT.8)
@SP // 15499
AM=M+1 // 15500
A=A-1 // 15501
M=D // 15502
@String.setInt.EQ.9 // 15503
D=A // 15504
@SP // 15505
AM=M+1 // 15506
A=A-1 // 15507
M=D // 15508
@ARG // 15509
A=M+1 // 15510
D=M // 15511
@32767 // 15512
D=D&A // 15513
@32767 // 15514
D=D-A // 15515
@DO_EQ // 15516
0;JMP // 15517
(String.setInt.EQ.9)
@SP // 15518
AM=M-1 // 15519
D=D&M // 15520
@DO_EQ // 15521
0;JMP // 15522
(String.setInt.EQ.7)
@String.setInt.IfElse3 // 15523
D;JNE // 15524

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15525
D=M // 15526
@SP // 15527
AM=M+1 // 15528
A=A-1 // 15529
M=D // 15530
@45 // 15531
D=A // 15532
@SP // 15533
AM=M+1 // 15534
A=A-1 // 15535
M=D // 15536
// call String.appendChar
@7 // 15537
D=A // 15538
@14 // 15539
M=D // 15540
@String.appendChar // 15541
D=A // 15542
@13 // 15543
M=D // 15544
@String.setInt.ret.1 // 15545
D=A // 15546
@CALL // 15547
0;JMP // 15548
(String.setInt.ret.1)
@SP // 15549
M=M-1 // 15550

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15551
D=M // 15552
@SP // 15553
AM=M+1 // 15554
A=A-1 // 15555
M=D // 15556
@51 // 15557
D=A // 15558
@SP // 15559
AM=M+1 // 15560
A=A-1 // 15561
M=D // 15562
// call String.appendChar
@7 // 15563
D=A // 15564
@14 // 15565
M=D // 15566
@String.appendChar // 15567
D=A // 15568
@13 // 15569
M=D // 15570
@String.setInt.ret.2 // 15571
D=A // 15572
@CALL // 15573
0;JMP // 15574
(String.setInt.ret.2)
@SP // 15575
M=M-1 // 15576

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15577
D=M // 15578
@SP // 15579
AM=M+1 // 15580
A=A-1 // 15581
M=D // 15582
@50 // 15583
D=A // 15584
@SP // 15585
AM=M+1 // 15586
A=A-1 // 15587
M=D // 15588
// call String.appendChar
@7 // 15589
D=A // 15590
@14 // 15591
M=D // 15592
@String.appendChar // 15593
D=A // 15594
@13 // 15595
M=D // 15596
@String.setInt.ret.3 // 15597
D=A // 15598
@CALL // 15599
0;JMP // 15600
(String.setInt.ret.3)
@SP // 15601
M=M-1 // 15602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15603
D=M // 15604
@SP // 15605
AM=M+1 // 15606
A=A-1 // 15607
M=D // 15608
@55 // 15609
D=A // 15610
@SP // 15611
AM=M+1 // 15612
A=A-1 // 15613
M=D // 15614
// call String.appendChar
@7 // 15615
D=A // 15616
@14 // 15617
M=D // 15618
@String.appendChar // 15619
D=A // 15620
@13 // 15621
M=D // 15622
@String.setInt.ret.4 // 15623
D=A // 15624
@CALL // 15625
0;JMP // 15626
(String.setInt.ret.4)
@SP // 15627
M=M-1 // 15628

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15629
D=M // 15630
@SP // 15631
AM=M+1 // 15632
A=A-1 // 15633
M=D // 15634
@54 // 15635
D=A // 15636
@SP // 15637
AM=M+1 // 15638
A=A-1 // 15639
M=D // 15640
// call String.appendChar
@7 // 15641
D=A // 15642
@14 // 15643
M=D // 15644
@String.appendChar // 15645
D=A // 15646
@13 // 15647
M=D // 15648
@String.setInt.ret.5 // 15649
D=A // 15650
@CALL // 15651
0;JMP // 15652
(String.setInt.ret.5)
@SP // 15653
M=M-1 // 15654

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15655
D=M // 15656
@SP // 15657
AM=M+1 // 15658
A=A-1 // 15659
M=D // 15660
@56 // 15661
D=A // 15662
@SP // 15663
AM=M+1 // 15664
A=A-1 // 15665
M=D // 15666
// call String.appendChar
@7 // 15667
D=A // 15668
@14 // 15669
M=D // 15670
@String.appendChar // 15671
D=A // 15672
@13 // 15673
M=D // 15674
@String.setInt.ret.6 // 15675
D=A // 15676
@CALL // 15677
0;JMP // 15678
(String.setInt.ret.6)
@SP // 15679
M=M-1 // 15680

////PushInstruction("constant 0")
@SP // 15681
AM=M+1 // 15682
A=A-1 // 15683
M=0 // 15684

////ReturnInstruction{}
@RETURN // 15685
0;JMP // 15686

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 15687
0;JMP // 15688

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

@ARG // 15689
A=M+1 // 15690
D=-M // 15691
@ARG // 15692
A=M+1 // 15693
M=D // 15694

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 15695
0;JMP // 15696

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

@ARG // 15697
A=M+1 // 15698
D=M // 15699
@LCL // 15700
A=M+1 // 15701
A=A+1 // 15702
M=D // 15703

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15704
A=M+1 // 15705
A=A+1 // 15706
A=A+1 // 15707
M=0 // 15708

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
@String.setInt.GT.10 // 15709
D=A // 15710
@SP // 15711
AM=M+1 // 15712
A=A-1 // 15713
M=D // 15714
@LCL // 15715
A=M+1 // 15716
A=A+1 // 15717
D=M // 15718
@DO_GT // 15719
0;JMP // 15720
(String.setInt.GT.10)
D=!D // 15721
@WHILE_END_String.setInt1 // 15722
D;JNE // 15723

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15724
A=M+1 // 15725
A=A+1 // 15726
D=M // 15727
@SP // 15728
AM=M+1 // 15729
A=A-1 // 15730
M=D // 15731
@10 // 15732
D=A // 15733
@SP // 15734
AM=M+1 // 15735
A=A-1 // 15736
M=D // 15737
// call Math.divide
@7 // 15738
D=A // 15739
@14 // 15740
M=D // 15741
@Math.divide // 15742
D=A // 15743
@13 // 15744
M=D // 15745
@String.setInt.ret.7 // 15746
D=A // 15747
@CALL // 15748
0;JMP // 15749
(String.setInt.ret.7)
@SP // 15750
AM=M-1 // 15751
D=M // 15752
@LCL // 15753
A=M+1 // 15754
A=A+1 // 15755
M=D // 15756

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

@LCL // 15757
A=M+1 // 15758
A=A+1 // 15759
A=A+1 // 15760
D=M // 15761
D=D+1 // 15762
@LCL // 15763
A=M+1 // 15764
A=A+1 // 15765
A=A+1 // 15766
M=D // 15767

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15768
0;JMP // 15769

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15770
A=M+1 // 15771
A=A+1 // 15772
A=A+1 // 15773
D=M // 15774
@SP // 15775
AM=M+1 // 15776
A=A-1 // 15777
M=D // 15778
// call Array.new
@6 // 15779
D=A // 15780
@14 // 15781
M=D // 15782
@Array.new // 15783
D=A // 15784
@13 // 15785
M=D // 15786
@String.setInt.ret.8 // 15787
D=A // 15788
@CALL // 15789
0;JMP // 15790
(String.setInt.ret.8)
@LCL // 15791
D=M // 15792
@5 // 15793
A=D+A // 15794
D=A // 15795
@R13 // 15796
M=D // 15797
@SP // 15798
AM=M-1 // 15799
D=M // 15800
@R13 // 15801
A=M // 15802
M=D // 15803

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15804
A=M+1 // 15805
M=0 // 15806

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
@String.setInt.GT.11 // 15807
D=A // 15808
@SP // 15809
AM=M+1 // 15810
A=A-1 // 15811
M=D // 15812
@ARG // 15813
A=M+1 // 15814
D=M // 15815
@DO_GT // 15816
0;JMP // 15817
(String.setInt.GT.11)
D=!D // 15818
@WHILE_END_String.setInt2 // 15819
D;JNE // 15820

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

@ARG // 15821
A=M+1 // 15822
D=M // 15823
@SP // 15824
AM=M+1 // 15825
A=A-1 // 15826
M=D // 15827
@ARG // 15828
A=M+1 // 15829
D=M // 15830
@SP // 15831
AM=M+1 // 15832
A=A-1 // 15833
M=D // 15834
@10 // 15835
D=A // 15836
@SP // 15837
AM=M+1 // 15838
A=A-1 // 15839
M=D // 15840
// call Math.divide
@7 // 15841
D=A // 15842
@14 // 15843
M=D // 15844
@Math.divide // 15845
D=A // 15846
@13 // 15847
M=D // 15848
@String.setInt.ret.9 // 15849
D=A // 15850
@CALL // 15851
0;JMP // 15852
(String.setInt.ret.9)
@10 // 15853
D=A // 15854
@SP // 15855
AM=M+1 // 15856
A=A-1 // 15857
M=D // 15858
// call Math.multiply
@7 // 15859
D=A // 15860
@14 // 15861
M=D // 15862
@Math.multiply // 15863
D=A // 15864
@13 // 15865
M=D // 15866
@String.setInt.ret.10 // 15867
D=A // 15868
@CALL // 15869
0;JMP // 15870
(String.setInt.ret.10)
@SP // 15871
AM=M-1 // 15872
D=M // 15873
@SP // 15874
AM=M-1 // 15875
D=M-D // 15876
@LCL // 15877
A=M // 15878
M=D // 15879

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
@LCL // 15880
D=M // 15881
@5 // 15882
A=D+A // 15883
D=M // 15884
@SP // 15885
AM=M+1 // 15886
A=A-1 // 15887
M=D // 15888
@LCL // 15889
A=M+1 // 15890
D=M // 15891
@SP // 15892
AM=M-1 // 15893
D=D+M // 15894
@SP // 15895
AM=M+1 // 15896
A=A-1 // 15897
M=D // 15898
@LCL // 15899
A=M // 15900
D=M // 15901
@48 // 15902
D=D+A // 15903
@SP // 15904
AM=M-1 // 15905
A=M // 15906
M=D // 15907

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15908
A=M+1 // 15909
D=M // 15910
@SP // 15911
AM=M+1 // 15912
A=A-1 // 15913
M=D // 15914
@10 // 15915
D=A // 15916
@SP // 15917
AM=M+1 // 15918
A=A-1 // 15919
M=D // 15920
// call Math.divide
@7 // 15921
D=A // 15922
@14 // 15923
M=D // 15924
@Math.divide // 15925
D=A // 15926
@13 // 15927
M=D // 15928
@String.setInt.ret.11 // 15929
D=A // 15930
@CALL // 15931
0;JMP // 15932
(String.setInt.ret.11)
@SP // 15933
AM=M-1 // 15934
D=M // 15935
@ARG // 15936
A=M+1 // 15937
M=D // 15938

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

@LCL // 15939
A=M+1 // 15940
D=M // 15941
D=D+1 // 15942
@LCL // 15943
A=M+1 // 15944
M=D // 15945

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15946
0;JMP // 15947

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
@String.setInt.EQ.12 // 15948
D=A // 15949
@SP // 15950
AM=M+1 // 15951
A=A-1 // 15952
M=D // 15953
@LCL // 15954
D=M // 15955
@4 // 15956
A=D+A // 15957
D=M // 15958
D=D-1 // 15959
@DO_EQ // 15960
0;JMP // 15961
(String.setInt.EQ.12)
D=!D // 15962
@String.setInt.IfElse4 // 15963
D;JNE // 15964

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15965
D=M // 15966
@SP // 15967
AM=M+1 // 15968
A=A-1 // 15969
M=D // 15970
@45 // 15971
D=A // 15972
@SP // 15973
AM=M+1 // 15974
A=A-1 // 15975
M=D // 15976
// call String.appendChar
@7 // 15977
D=A // 15978
@14 // 15979
M=D // 15980
@String.appendChar // 15981
D=A // 15982
@13 // 15983
M=D // 15984
@String.setInt.ret.12 // 15985
D=A // 15986
@CALL // 15987
0;JMP // 15988
(String.setInt.ret.12)
@SP // 15989
M=M-1 // 15990

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 15991
0;JMP // 15992

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
@String.setInt.GT.13 // 15993
D=A // 15994
@SP // 15995
AM=M+1 // 15996
A=A-1 // 15997
M=D // 15998
@LCL // 15999
A=M+1 // 16000
D=M // 16001
@DO_GT // 16002
0;JMP // 16003
(String.setInt.GT.13)
D=!D // 16004
@WHILE_END_String.setInt3 // 16005
D;JNE // 16006

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

@LCL // 16007
A=M+1 // 16008
D=M // 16009
D=D-1 // 16010
@LCL // 16011
A=M+1 // 16012
M=D // 16013

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

@3 // 16014
D=M // 16015
@SP // 16016
AM=M+1 // 16017
A=A-1 // 16018
M=D // 16019
@LCL // 16020
D=M // 16021
@5 // 16022
A=D+A // 16023
D=M // 16024
@SP // 16025
AM=M+1 // 16026
A=A-1 // 16027
M=D // 16028
@LCL // 16029
A=M+1 // 16030
D=M // 16031
@SP // 16032
AM=M-1 // 16033
A=D+M // 16034
D=M // 16035
@SP // 16036
AM=M+1 // 16037
A=A-1 // 16038
M=D // 16039
// call String.appendChar
@7 // 16040
D=A // 16041
@14 // 16042
M=D // 16043
@String.appendChar // 16044
D=A // 16045
@13 // 16046
M=D // 16047
@String.setInt.ret.13 // 16048
D=A // 16049
@CALL // 16050
0;JMP // 16051
(String.setInt.ret.13)
@SP // 16052
M=M-1 // 16053

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 16054
0;JMP // 16055

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16056
D=M // 16057
@5 // 16058
A=D+A // 16059
D=M // 16060
@SP // 16061
AM=M+1 // 16062
A=A-1 // 16063
M=D // 16064
// call Array.dispose
@6 // 16065
D=A // 16066
@14 // 16067
M=D // 16068
@Array.dispose // 16069
D=A // 16070
@13 // 16071
M=D // 16072
@String.setInt.ret.14 // 16073
D=A // 16074
@CALL // 16075
0;JMP // 16076
(String.setInt.ret.14)
@SP // 16077
M=M-1 // 16078

////PushInstruction("constant 0")
@SP // 16079
AM=M+1 // 16080
A=A-1 // 16081
M=0 // 16082

////ReturnInstruction{}
@RETURN // 16083
0;JMP // 16084

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 16085
D=A // 16086
@SP // 16087
AM=M+1 // 16088
A=A-1 // 16089
M=D // 16090

////ReturnInstruction{}
@RETURN // 16091
0;JMP // 16092

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 16093
D=A // 16094
@SP // 16095
AM=M+1 // 16096
A=A-1 // 16097
M=D // 16098

////ReturnInstruction{}
@RETURN // 16099
0;JMP // 16100

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 16101
D=A // 16102
@SP // 16103
AM=M+1 // 16104
A=A-1 // 16105
M=D // 16106

////ReturnInstruction{}
@RETURN // 16107
0;JMP // 16108

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 16109
D=A // 16110
@14 // 16111
M=D // 16112
@Memory.init // 16113
D=A // 16114
@13 // 16115
M=D // 16116
@Sys.init.ret.0 // 16117
D=A // 16118
@CALL // 16119
0;JMP // 16120
(Sys.init.ret.0)
@SP // 16121
M=M-1 // 16122

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 16123
D=A // 16124
@14 // 16125
M=D // 16126
@Math.init // 16127
D=A // 16128
@13 // 16129
M=D // 16130
@Sys.init.ret.1 // 16131
D=A // 16132
@CALL // 16133
0;JMP // 16134
(Sys.init.ret.1)
@SP // 16135
M=M-1 // 16136

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 16137
D=A // 16138
@14 // 16139
M=D // 16140
@Screen.init // 16141
D=A // 16142
@13 // 16143
M=D // 16144
@Sys.init.ret.2 // 16145
D=A // 16146
@CALL // 16147
0;JMP // 16148
(Sys.init.ret.2)
@SP // 16149
M=M-1 // 16150

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 16151
D=A // 16152
@14 // 16153
M=D // 16154
@Output.init // 16155
D=A // 16156
@13 // 16157
M=D // 16158
@Sys.init.ret.3 // 16159
D=A // 16160
@CALL // 16161
0;JMP // 16162
(Sys.init.ret.3)
@SP // 16163
M=M-1 // 16164

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 16165
D=A // 16166
@14 // 16167
M=D // 16168
@Keyboard.init // 16169
D=A // 16170
@13 // 16171
M=D // 16172
@Sys.init.ret.4 // 16173
D=A // 16174
@CALL // 16175
0;JMP // 16176
(Sys.init.ret.4)
@SP // 16177
M=M-1 // 16178

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 16179
D=A // 16180
@14 // 16181
M=D // 16182
@Main.main // 16183
D=A // 16184
@13 // 16185
M=D // 16186
@Sys.init.ret.5 // 16187
D=A // 16188
@CALL // 16189
0;JMP // 16190
(Sys.init.ret.5)
@SP // 16191
M=M-1 // 16192

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 16193
D=A // 16194
@14 // 16195
M=D // 16196
@Sys.halt // 16197
D=A // 16198
@13 // 16199
M=D // 16200
@Sys.init.ret.6 // 16201
D=A // 16202
@CALL // 16203
0;JMP // 16204
(Sys.init.ret.6)
@SP // 16205
M=M-1 // 16206

////PushInstruction("constant 0")
@SP // 16207
AM=M+1 // 16208
A=A-1 // 16209
M=0 // 16210

////ReturnInstruction{}
@RETURN // 16211
0;JMP // 16212

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
D=0 // 16213
@WHILE_END_Sys.halt1 // 16214
D;JNE // 16215

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 16216
0;JMP // 16217

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 16218
AM=M+1 // 16219
A=A-1 // 16220
M=0 // 16221

////ReturnInstruction{}
@RETURN // 16222
0;JMP // 16223

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 16224
AM=M+1 // 16225
A=A-1 // 16226
M=0 // 16227

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
@Sys.wait.GT.0 // 16228
D=A // 16229
@SP // 16230
AM=M+1 // 16231
A=A-1 // 16232
M=D // 16233
@ARG // 16234
A=M // 16235
D=M // 16236
@DO_GT // 16237
0;JMP // 16238
(Sys.wait.GT.0)
D=!D // 16239
@WHILE_END_Sys.wait1 // 16240
D;JNE // 16241

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

@ARG // 16242
A=M // 16243
D=M // 16244
D=D-1 // 16245
@ARG // 16246
A=M // 16247
M=D // 16248

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 16249
D=A // 16250
@LCL // 16251
A=M // 16252
M=D // 16253

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
@Sys.wait.GT.1 // 16254
D=A // 16255
@SP // 16256
AM=M+1 // 16257
A=A-1 // 16258
M=D // 16259
@LCL // 16260
A=M // 16261
D=M // 16262
@DO_GT // 16263
0;JMP // 16264
(Sys.wait.GT.1)
D=!D // 16265
@WHILE_END_Sys.wait2 // 16266
D;JNE // 16267

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

@LCL // 16268
A=M // 16269
D=M // 16270
D=D-1 // 16271
@LCL // 16272
A=M // 16273
M=D // 16274

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 16275
0;JMP // 16276

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 16277
0;JMP // 16278

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 16279
AM=M+1 // 16280
A=A-1 // 16281
M=0 // 16282

////ReturnInstruction{}
@RETURN // 16283
0;JMP // 16284

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 16285
A=M // 16286
D=M // 16287
@SP // 16288
AM=M+1 // 16289
A=A-1 // 16290
M=D // 16291
// call Output.printInt
@6 // 16292
D=A // 16293
@14 // 16294
M=D // 16295
@Output.printInt // 16296
D=A // 16297
@13 // 16298
M=D // 16299
@Sys.error.ret.0 // 16300
D=A // 16301
@CALL // 16302
0;JMP // 16303
(Sys.error.ret.0)
@SP // 16304
M=M-1 // 16305

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 16306
D=A // 16307
@14 // 16308
M=D // 16309
@Output.println // 16310
D=A // 16311
@13 // 16312
M=D // 16313
@Sys.error.ret.1 // 16314
D=A // 16315
@CALL // 16316
0;JMP // 16317
(Sys.error.ret.1)
@SP // 16318
M=M-1 // 16319

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 16320
D=A // 16321
@14 // 16322
M=D // 16323
@Sys.halt // 16324
D=A // 16325
@13 // 16326
M=D // 16327
@Sys.error.ret.2 // 16328
D=A // 16329
@CALL // 16330
0;JMP // 16331
(Sys.error.ret.2)
@SP // 16332
M=M-1 // 16333

////PushInstruction("constant 0")
@SP // 16334
AM=M+1 // 16335
A=A-1 // 16336
M=0 // 16337

////ReturnInstruction{}
@RETURN // 16338
0;JMP // 16339

