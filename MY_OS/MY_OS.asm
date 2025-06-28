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
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 539
AM=M+1 // 540
A=A-1 // 541
M=0 // 542
@220 // 543
D=A // 544
@SP // 545
AM=M+1 // 546
A=A-1 // 547
M=D // 548
@511 // 549
D=A // 550
@SP // 551
AM=M+1 // 552
A=A-1 // 553
M=D // 554
@220 // 555
D=A // 556
@SP // 557
AM=M+1 // 558
A=A-1 // 559
M=D // 560
// call Screen.drawLine
@9 // 561
D=A // 562
@14 // 563
M=D // 564
@Screen.drawLine // 565
D=A // 566
@13 // 567
M=D // 568
@Main.main.ret.0 // 569
D=A // 570
@CALL // 571
0;JMP // 572
(Main.main.ret.0)
@SP // 573
M=M-1 // 574

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 575
D=A // 576
@SP // 577
AM=M+1 // 578
A=A-1 // 579
M=D // 580
@90 // 581
D=A // 582
@SP // 583
AM=M+1 // 584
A=A-1 // 585
M=D // 586
@410 // 587
D=A // 588
@SP // 589
AM=M+1 // 590
A=A-1 // 591
M=D // 592
@220 // 593
D=A // 594
@SP // 595
AM=M+1 // 596
A=A-1 // 597
M=D // 598
// call Screen.drawRectangle
@9 // 599
D=A // 600
@14 // 601
M=D // 602
@Screen.drawRectangle // 603
D=A // 604
@13 // 605
M=D // 606
@Main.main.ret.1 // 607
D=A // 608
@CALL // 609
0;JMP // 610
(Main.main.ret.1)
@SP // 611
M=M-1 // 612

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 613
AM=M+1 // 614
A=A-1 // 615
M=0 // 616
// call Screen.setColor
@6 // 617
D=A // 618
@14 // 619
M=D // 620
@Screen.setColor // 621
D=A // 622
@13 // 623
M=D // 624
@Main.main.ret.2 // 625
D=A // 626
@CALL // 627
0;JMP // 628
(Main.main.ret.2)
@SP // 629
M=M-1 // 630

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 631
D=A // 632
@SP // 633
AM=M+1 // 634
A=A-1 // 635
M=D // 636
@120 // 637
D=A // 638
@SP // 639
AM=M+1 // 640
A=A-1 // 641
M=D // 642
@390 // 643
D=A // 644
@SP // 645
AM=M+1 // 646
A=A-1 // 647
M=D // 648
@219 // 649
D=A // 650
@SP // 651
AM=M+1 // 652
A=A-1 // 653
M=D // 654
// call Screen.drawRectangle
@9 // 655
D=A // 656
@14 // 657
M=D // 658
@Screen.drawRectangle // 659
D=A // 660
@13 // 661
M=D // 662
@Main.main.ret.3 // 663
D=A // 664
@CALL // 665
0;JMP // 666
(Main.main.ret.3)
@SP // 667
M=M-1 // 668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 669
D=A // 670
@SP // 671
AM=M+1 // 672
A=A-1 // 673
M=D // 674
@120 // 675
D=A // 676
@SP // 677
AM=M+1 // 678
A=A-1 // 679
M=D // 680
@332 // 681
D=A // 682
@SP // 683
AM=M+1 // 684
A=A-1 // 685
M=D // 686
@150 // 687
D=A // 688
@SP // 689
AM=M+1 // 690
A=A-1 // 691
M=D // 692
// call Screen.drawRectangle
@9 // 693
D=A // 694
@14 // 695
M=D // 696
@Screen.drawRectangle // 697
D=A // 698
@13 // 699
M=D // 700
@Main.main.ret.4 // 701
D=A // 702
@CALL // 703
0;JMP // 704
(Main.main.ret.4)
@SP // 705
M=M-1 // 706

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 707
AM=M+1 // 708
A=A-1 // 709
M=-1 // 710
// call Screen.setColor
@6 // 711
D=A // 712
@14 // 713
M=D // 714
@Screen.setColor // 715
D=A // 716
@13 // 717
M=D // 718
@Main.main.ret.5 // 719
D=A // 720
@CALL // 721
0;JMP // 722
(Main.main.ret.5)
@SP // 723
M=M-1 // 724

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 725
D=A // 726
@SP // 727
AM=M+1 // 728
A=A-1 // 729
M=D // 730
@170 // 731
D=A // 732
@SP // 733
AM=M+1 // 734
A=A-1 // 735
M=D // 736
@3 // 737
D=A // 738
@SP // 739
AM=M+1 // 740
A=A-1 // 741
M=D // 742
// call Screen.drawCircle
@8 // 743
D=A // 744
@14 // 745
M=D // 746
@Screen.drawCircle // 747
D=A // 748
@13 // 749
M=D // 750
@Main.main.ret.6 // 751
D=A // 752
@CALL // 753
0;JMP // 754
(Main.main.ret.6)
@SP // 755
M=M-1 // 756

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 757
D=A // 758
@SP // 759
AM=M+1 // 760
A=A-1 // 761
M=D // 762
@90 // 763
D=A // 764
@SP // 765
AM=M+1 // 766
A=A-1 // 767
M=D // 768
@345 // 769
D=A // 770
@SP // 771
AM=M+1 // 772
A=A-1 // 773
M=D // 774
@35 // 775
D=A // 776
@SP // 777
AM=M+1 // 778
A=A-1 // 779
M=D // 780
// call Screen.drawLine
@9 // 781
D=A // 782
@14 // 783
M=D // 784
@Screen.drawLine // 785
D=A // 786
@13 // 787
M=D // 788
@Main.main.ret.7 // 789
D=A // 790
@CALL // 791
0;JMP // 792
(Main.main.ret.7)
@SP // 793
M=M-1 // 794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 795
D=A // 796
@SP // 797
AM=M+1 // 798
A=A-1 // 799
M=D // 800
@35 // 801
D=A // 802
@SP // 803
AM=M+1 // 804
A=A-1 // 805
M=D // 806
@410 // 807
D=A // 808
@SP // 809
AM=M+1 // 810
A=A-1 // 811
M=D // 812
@90 // 813
D=A // 814
@SP // 815
AM=M+1 // 816
A=A-1 // 817
M=D // 818
// call Screen.drawLine
@9 // 819
D=A // 820
@14 // 821
M=D // 822
@Screen.drawLine // 823
D=A // 824
@13 // 825
M=D // 826
@Main.main.ret.8 // 827
D=A // 828
@CALL // 829
0;JMP // 830
(Main.main.ret.8)
@SP // 831
M=M-1 // 832

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 833
D=A // 834
@SP // 835
AM=M+1 // 836
A=A-1 // 837
M=D // 838
@60 // 839
D=A // 840
@SP // 841
AM=M+1 // 842
A=A-1 // 843
M=D // 844
@30 // 845
D=A // 846
@SP // 847
AM=M+1 // 848
A=A-1 // 849
M=D // 850
// call Screen.drawCircle
@8 // 851
D=A // 852
@14 // 853
M=D // 854
@Screen.drawCircle // 855
D=A // 856
@13 // 857
M=D // 858
@Main.main.ret.9 // 859
D=A // 860
@CALL // 861
0;JMP // 862
(Main.main.ret.9)
@SP // 863
M=M-1 // 864

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 865
D=A // 866
@SP // 867
AM=M+1 // 868
A=A-1 // 869
M=D // 870
@26 // 871
D=A // 872
@SP // 873
AM=M+1 // 874
A=A-1 // 875
M=D // 876
@140 // 877
D=A // 878
@SP // 879
AM=M+1 // 880
A=A-1 // 881
M=D // 882
@6 // 883
D=A // 884
@SP // 885
AM=M+1 // 886
A=A-1 // 887
M=D // 888
// call Screen.drawLine
@9 // 889
D=A // 890
@14 // 891
M=D // 892
@Screen.drawLine // 893
D=A // 894
@13 // 895
M=D // 896
@Main.main.ret.10 // 897
D=A // 898
@CALL // 899
0;JMP // 900
(Main.main.ret.10)
@SP // 901
M=M-1 // 902

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 903
D=A // 904
@SP // 905
AM=M+1 // 906
A=A-1 // 907
M=D // 908
@35 // 909
D=A // 910
@SP // 911
AM=M+1 // 912
A=A-1 // 913
M=D // 914
@178 // 915
D=A // 916
@SP // 917
AM=M+1 // 918
A=A-1 // 919
M=D // 920
@20 // 921
D=A // 922
@SP // 923
AM=M+1 // 924
A=A-1 // 925
M=D // 926
// call Screen.drawLine
@9 // 927
D=A // 928
@14 // 929
M=D // 930
@Screen.drawLine // 931
D=A // 932
@13 // 933
M=D // 934
@Main.main.ret.11 // 935
D=A // 936
@CALL // 937
0;JMP // 938
(Main.main.ret.11)
@SP // 939
M=M-1 // 940

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 941
D=A // 942
@SP // 943
AM=M+1 // 944
A=A-1 // 945
M=D // 946
@60 // 947
D=A // 948
@SP // 949
AM=M+1 // 950
A=A-1 // 951
M=D // 952
@194 // 953
D=A // 954
@SP // 955
AM=M+1 // 956
A=A-1 // 957
M=D // 958
@60 // 959
D=A // 960
@SP // 961
AM=M+1 // 962
A=A-1 // 963
M=D // 964
// call Screen.drawLine
@9 // 965
D=A // 966
@14 // 967
M=D // 968
@Screen.drawLine // 969
D=A // 970
@13 // 971
M=D // 972
@Main.main.ret.12 // 973
D=A // 974
@CALL // 975
0;JMP // 976
(Main.main.ret.12)
@SP // 977
M=M-1 // 978

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 979
D=A // 980
@SP // 981
AM=M+1 // 982
A=A-1 // 983
M=D // 984
@85 // 985
D=A // 986
@SP // 987
AM=M+1 // 988
A=A-1 // 989
M=D // 990
@178 // 991
D=A // 992
@SP // 993
AM=M+1 // 994
A=A-1 // 995
M=D // 996
@100 // 997
D=A // 998
@SP // 999
AM=M+1 // 1000
A=A-1 // 1001
M=D // 1002
// call Screen.drawLine
@9 // 1003
D=A // 1004
@14 // 1005
M=D // 1006
@Screen.drawLine // 1007
D=A // 1008
@13 // 1009
M=D // 1010
@Main.main.ret.13 // 1011
D=A // 1012
@CALL // 1013
0;JMP // 1014
(Main.main.ret.13)
@SP // 1015
M=M-1 // 1016

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 1017
D=A // 1018
@SP // 1019
AM=M+1 // 1020
A=A-1 // 1021
M=D // 1022
@94 // 1023
D=A // 1024
@SP // 1025
AM=M+1 // 1026
A=A-1 // 1027
M=D // 1028
@140 // 1029
D=A // 1030
@SP // 1031
AM=M+1 // 1032
A=A-1 // 1033
M=D // 1034
@114 // 1035
D=A // 1036
@SP // 1037
AM=M+1 // 1038
A=A-1 // 1039
M=D // 1040
// call Screen.drawLine
@9 // 1041
D=A // 1042
@14 // 1043
M=D // 1044
@Screen.drawLine // 1045
D=A // 1046
@13 // 1047
M=D // 1048
@Main.main.ret.14 // 1049
D=A // 1050
@CALL // 1051
0;JMP // 1052
(Main.main.ret.14)
@SP // 1053
M=M-1 // 1054

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 1055
D=A // 1056
@SP // 1057
AM=M+1 // 1058
A=A-1 // 1059
M=D // 1060
@85 // 1061
D=A // 1062
@SP // 1063
AM=M+1 // 1064
A=A-1 // 1065
M=D // 1066
@102 // 1067
D=A // 1068
@SP // 1069
AM=M+1 // 1070
A=A-1 // 1071
M=D // 1072
@100 // 1073
D=A // 1074
@SP // 1075
AM=M+1 // 1076
A=A-1 // 1077
M=D // 1078
// call Screen.drawLine
@9 // 1079
D=A // 1080
@14 // 1081
M=D // 1082
@Screen.drawLine // 1083
D=A // 1084
@13 // 1085
M=D // 1086
@Main.main.ret.15 // 1087
D=A // 1088
@CALL // 1089
0;JMP // 1090
(Main.main.ret.15)
@SP // 1091
M=M-1 // 1092

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 1093
D=A // 1094
@SP // 1095
AM=M+1 // 1096
A=A-1 // 1097
M=D // 1098
@60 // 1099
D=A // 1100
@SP // 1101
AM=M+1 // 1102
A=A-1 // 1103
M=D // 1104
@86 // 1105
D=A // 1106
@SP // 1107
AM=M+1 // 1108
A=A-1 // 1109
M=D // 1110
@60 // 1111
D=A // 1112
@SP // 1113
AM=M+1 // 1114
A=A-1 // 1115
M=D // 1116
// call Screen.drawLine
@9 // 1117
D=A // 1118
@14 // 1119
M=D // 1120
@Screen.drawLine // 1121
D=A // 1122
@13 // 1123
M=D // 1124
@Main.main.ret.16 // 1125
D=A // 1126
@CALL // 1127
0;JMP // 1128
(Main.main.ret.16)
@SP // 1129
M=M-1 // 1130

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 1131
D=A // 1132
@SP // 1133
AM=M+1 // 1134
A=A-1 // 1135
M=D // 1136
@35 // 1137
D=A // 1138
@SP // 1139
AM=M+1 // 1140
A=A-1 // 1141
M=D // 1142
@102 // 1143
D=A // 1144
@SP // 1145
AM=M+1 // 1146
A=A-1 // 1147
M=D // 1148
@20 // 1149
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
@Main.main.ret.17 // 1163
D=A // 1164
@CALL // 1165
0;JMP // 1166
(Main.main.ret.17)
@SP // 1167
M=M-1 // 1168

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 24")], call=CallInstruction{String.new}}, PushInstruction("constant 49")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 52")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 53")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 57")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 46")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@24 // 1169
D=A // 1170
@SP // 1171
AM=M+1 // 1172
A=A-1 // 1173
M=D // 1174
// call String.new
@6 // 1175
D=A // 1176
@14 // 1177
M=D // 1178
@String.new // 1179
D=A // 1180
@13 // 1181
M=D // 1182
@Main.main.ret.18 // 1183
D=A // 1184
@CALL // 1185
0;JMP // 1186
(Main.main.ret.18)
@49 // 1187
D=A // 1188
@SP // 1189
AM=M+1 // 1190
A=A-1 // 1191
M=D // 1192
// call String.appendChar
@7 // 1193
D=A // 1194
@14 // 1195
M=D // 1196
@String.appendChar // 1197
D=A // 1198
@13 // 1199
M=D // 1200
@Main.main.ret.19 // 1201
D=A // 1202
@CALL // 1203
0;JMP // 1204
(Main.main.ret.19)
@50 // 1205
D=A // 1206
@SP // 1207
AM=M+1 // 1208
A=A-1 // 1209
M=D // 1210
// call String.appendChar
@7 // 1211
D=A // 1212
@14 // 1213
M=D // 1214
@String.appendChar // 1215
D=A // 1216
@13 // 1217
M=D // 1218
@Main.main.ret.20 // 1219
D=A // 1220
@CALL // 1221
0;JMP // 1222
(Main.main.ret.20)
@51 // 1223
D=A // 1224
@SP // 1225
AM=M+1 // 1226
A=A-1 // 1227
M=D // 1228
// call String.appendChar
@7 // 1229
D=A // 1230
@14 // 1231
M=D // 1232
@String.appendChar // 1233
D=A // 1234
@13 // 1235
M=D // 1236
@Main.main.ret.21 // 1237
D=A // 1238
@CALL // 1239
0;JMP // 1240
(Main.main.ret.21)
@52 // 1241
D=A // 1242
@SP // 1243
AM=M+1 // 1244
A=A-1 // 1245
M=D // 1246
// call String.appendChar
@7 // 1247
D=A // 1248
@14 // 1249
M=D // 1250
@String.appendChar // 1251
D=A // 1252
@13 // 1253
M=D // 1254
@Main.main.ret.22 // 1255
D=A // 1256
@CALL // 1257
0;JMP // 1258
(Main.main.ret.22)
@53 // 1259
D=A // 1260
@SP // 1261
AM=M+1 // 1262
A=A-1 // 1263
M=D // 1264
// call String.appendChar
@7 // 1265
D=A // 1266
@14 // 1267
M=D // 1268
@String.appendChar // 1269
D=A // 1270
@13 // 1271
M=D // 1272
@Main.main.ret.23 // 1273
D=A // 1274
@CALL // 1275
0;JMP // 1276
(Main.main.ret.23)
@54 // 1277
D=A // 1278
@SP // 1279
AM=M+1 // 1280
A=A-1 // 1281
M=D // 1282
// call String.appendChar
@7 // 1283
D=A // 1284
@14 // 1285
M=D // 1286
@String.appendChar // 1287
D=A // 1288
@13 // 1289
M=D // 1290
@Main.main.ret.24 // 1291
D=A // 1292
@CALL // 1293
0;JMP // 1294
(Main.main.ret.24)
@55 // 1295
D=A // 1296
@SP // 1297
AM=M+1 // 1298
A=A-1 // 1299
M=D // 1300
// call String.appendChar
@7 // 1301
D=A // 1302
@14 // 1303
M=D // 1304
@String.appendChar // 1305
D=A // 1306
@13 // 1307
M=D // 1308
@Main.main.ret.25 // 1309
D=A // 1310
@CALL // 1311
0;JMP // 1312
(Main.main.ret.25)
@56 // 1313
D=A // 1314
@SP // 1315
AM=M+1 // 1316
A=A-1 // 1317
M=D // 1318
// call String.appendChar
@7 // 1319
D=A // 1320
@14 // 1321
M=D // 1322
@String.appendChar // 1323
D=A // 1324
@13 // 1325
M=D // 1326
@Main.main.ret.26 // 1327
D=A // 1328
@CALL // 1329
0;JMP // 1330
(Main.main.ret.26)
@57 // 1331
D=A // 1332
@SP // 1333
AM=M+1 // 1334
A=A-1 // 1335
M=D // 1336
// call String.appendChar
@7 // 1337
D=A // 1338
@14 // 1339
M=D // 1340
@String.appendChar // 1341
D=A // 1342
@13 // 1343
M=D // 1344
@Main.main.ret.27 // 1345
D=A // 1346
@CALL // 1347
0;JMP // 1348
(Main.main.ret.27)
@46 // 1349
D=A // 1350
@SP // 1351
AM=M+1 // 1352
A=A-1 // 1353
M=D // 1354
// call String.appendChar
@7 // 1355
D=A // 1356
@14 // 1357
M=D // 1358
@String.appendChar // 1359
D=A // 1360
@13 // 1361
M=D // 1362
@Main.main.ret.28 // 1363
D=A // 1364
@CALL // 1365
0;JMP // 1366
(Main.main.ret.28)
@32 // 1367
D=A // 1368
@SP // 1369
AM=M+1 // 1370
A=A-1 // 1371
M=D // 1372
// call String.appendChar
@7 // 1373
D=A // 1374
@14 // 1375
M=D // 1376
@String.appendChar // 1377
D=A // 1378
@13 // 1379
M=D // 1380
@Main.main.ret.29 // 1381
D=A // 1382
@CALL // 1383
0;JMP // 1384
(Main.main.ret.29)
@72 // 1385
D=A // 1386
@SP // 1387
AM=M+1 // 1388
A=A-1 // 1389
M=D // 1390
// call String.appendChar
@7 // 1391
D=A // 1392
@14 // 1393
M=D // 1394
@String.appendChar // 1395
D=A // 1396
@13 // 1397
M=D // 1398
@Main.main.ret.30 // 1399
D=A // 1400
@CALL // 1401
0;JMP // 1402
(Main.main.ret.30)
@101 // 1403
D=A // 1404
@SP // 1405
AM=M+1 // 1406
A=A-1 // 1407
M=D // 1408
// call String.appendChar
@7 // 1409
D=A // 1410
@14 // 1411
M=D // 1412
@String.appendChar // 1413
D=A // 1414
@13 // 1415
M=D // 1416
@Main.main.ret.31 // 1417
D=A // 1418
@CALL // 1419
0;JMP // 1420
(Main.main.ret.31)
@108 // 1421
D=A // 1422
@SP // 1423
AM=M+1 // 1424
A=A-1 // 1425
M=D // 1426
// call String.appendChar
@7 // 1427
D=A // 1428
@14 // 1429
M=D // 1430
@String.appendChar // 1431
D=A // 1432
@13 // 1433
M=D // 1434
@Main.main.ret.32 // 1435
D=A // 1436
@CALL // 1437
0;JMP // 1438
(Main.main.ret.32)
@108 // 1439
D=A // 1440
@SP // 1441
AM=M+1 // 1442
A=A-1 // 1443
M=D // 1444
// call String.appendChar
@7 // 1445
D=A // 1446
@14 // 1447
M=D // 1448
@String.appendChar // 1449
D=A // 1450
@13 // 1451
M=D // 1452
@Main.main.ret.33 // 1453
D=A // 1454
@CALL // 1455
0;JMP // 1456
(Main.main.ret.33)
@111 // 1457
D=A // 1458
@SP // 1459
AM=M+1 // 1460
A=A-1 // 1461
M=D // 1462
// call String.appendChar
@7 // 1463
D=A // 1464
@14 // 1465
M=D // 1466
@String.appendChar // 1467
D=A // 1468
@13 // 1469
M=D // 1470
@Main.main.ret.34 // 1471
D=A // 1472
@CALL // 1473
0;JMP // 1474
(Main.main.ret.34)
@44 // 1475
D=A // 1476
@SP // 1477
AM=M+1 // 1478
A=A-1 // 1479
M=D // 1480
// call String.appendChar
@7 // 1481
D=A // 1482
@14 // 1483
M=D // 1484
@String.appendChar // 1485
D=A // 1486
@13 // 1487
M=D // 1488
@Main.main.ret.35 // 1489
D=A // 1490
@CALL // 1491
0;JMP // 1492
(Main.main.ret.35)
@32 // 1493
D=A // 1494
@SP // 1495
AM=M+1 // 1496
A=A-1 // 1497
M=D // 1498
// call String.appendChar
@7 // 1499
D=A // 1500
@14 // 1501
M=D // 1502
@String.appendChar // 1503
D=A // 1504
@13 // 1505
M=D // 1506
@Main.main.ret.36 // 1507
D=A // 1508
@CALL // 1509
0;JMP // 1510
(Main.main.ret.36)
@119 // 1511
D=A // 1512
@SP // 1513
AM=M+1 // 1514
A=A-1 // 1515
M=D // 1516
// call String.appendChar
@7 // 1517
D=A // 1518
@14 // 1519
M=D // 1520
@String.appendChar // 1521
D=A // 1522
@13 // 1523
M=D // 1524
@Main.main.ret.37 // 1525
D=A // 1526
@CALL // 1527
0;JMP // 1528
(Main.main.ret.37)
@111 // 1529
D=A // 1530
@SP // 1531
AM=M+1 // 1532
A=A-1 // 1533
M=D // 1534
// call String.appendChar
@7 // 1535
D=A // 1536
@14 // 1537
M=D // 1538
@String.appendChar // 1539
D=A // 1540
@13 // 1541
M=D // 1542
@Main.main.ret.38 // 1543
D=A // 1544
@CALL // 1545
0;JMP // 1546
(Main.main.ret.38)
@114 // 1547
D=A // 1548
@SP // 1549
AM=M+1 // 1550
A=A-1 // 1551
M=D // 1552
// call String.appendChar
@7 // 1553
D=A // 1554
@14 // 1555
M=D // 1556
@String.appendChar // 1557
D=A // 1558
@13 // 1559
M=D // 1560
@Main.main.ret.39 // 1561
D=A // 1562
@CALL // 1563
0;JMP // 1564
(Main.main.ret.39)
@108 // 1565
D=A // 1566
@SP // 1567
AM=M+1 // 1568
A=A-1 // 1569
M=D // 1570
// call String.appendChar
@7 // 1571
D=A // 1572
@14 // 1573
M=D // 1574
@String.appendChar // 1575
D=A // 1576
@13 // 1577
M=D // 1578
@Main.main.ret.40 // 1579
D=A // 1580
@CALL // 1581
0;JMP // 1582
(Main.main.ret.40)
@100 // 1583
D=A // 1584
@SP // 1585
AM=M+1 // 1586
A=A-1 // 1587
M=D // 1588
// call String.appendChar
@7 // 1589
D=A // 1590
@14 // 1591
M=D // 1592
@String.appendChar // 1593
D=A // 1594
@13 // 1595
M=D // 1596
@Main.main.ret.41 // 1597
D=A // 1598
@CALL // 1599
0;JMP // 1600
(Main.main.ret.41)
@33 // 1601
D=A // 1602
@SP // 1603
AM=M+1 // 1604
A=A-1 // 1605
M=D // 1606
// call String.appendChar
@7 // 1607
D=A // 1608
@14 // 1609
M=D // 1610
@String.appendChar // 1611
D=A // 1612
@13 // 1613
M=D // 1614
@Main.main.ret.42 // 1615
D=A // 1616
@CALL // 1617
0;JMP // 1618
(Main.main.ret.42)
@SP // 1619
AM=M-1 // 1620
D=M // 1621
@LCL // 1622
A=M // 1623
M=D // 1624

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1625
A=M // 1626
D=M // 1627
@SP // 1628
AM=M+1 // 1629
A=A-1 // 1630
M=D // 1631
// call Output.printString
@6 // 1632
D=A // 1633
@14 // 1634
M=D // 1635
@Output.printString // 1636
D=A // 1637
@13 // 1638
M=D // 1639
@Main.main.ret.43 // 1640
D=A // 1641
@CALL // 1642
0;JMP // 1643
(Main.main.ret.43)
@SP // 1644
M=M-1 // 1645

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 1646
D=A // 1647
@14 // 1648
M=D // 1649
@Output.println // 1650
D=A // 1651
@13 // 1652
M=D // 1653
@Main.main.ret.44 // 1654
D=A // 1655
@CALL // 1656
0;JMP // 1657
(Main.main.ret.44)
@SP // 1658
M=M-1 // 1659

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1660
A=M // 1661
D=M // 1662
@SP // 1663
AM=M+1 // 1664
A=A-1 // 1665
M=D // 1666
// call String.dispose
@6 // 1667
D=A // 1668
@14 // 1669
M=D // 1670
@String.dispose // 1671
D=A // 1672
@13 // 1673
M=D // 1674
@Main.main.ret.45 // 1675
D=A // 1676
@CALL // 1677
0;JMP // 1678
(Main.main.ret.45)
@SP // 1679
M=M-1 // 1680

////PushInstruction("constant 0")
@SP // 1681
AM=M+1 // 1682
A=A-1 // 1683
M=0 // 1684

////ReturnInstruction{}
@RETURN // 1685
0;JMP // 1686

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 1687
AM=M+1 // 1688
A=A-1 // 1689
M=0 // 1690
@SP // 1691
AM=M+1 // 1692
A=A-1 // 1693
M=0 // 1694

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1695
A=M // 1696
M=1 // 1697

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1698
A=M+1 // 1699
M=0 // 1700

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 1701
D=A // 1702
@SP // 1703
AM=M+1 // 1704
A=A-1 // 1705
M=D // 1706
// call Array.new
@6 // 1707
D=A // 1708
@14 // 1709
M=D // 1710
@Array.new // 1711
D=A // 1712
@13 // 1713
M=D // 1714
@Math.init.ret.0 // 1715
D=A // 1716
@CALL // 1717
0;JMP // 1718
(Math.init.ret.0)
@SP // 1719
AM=M-1 // 1720
D=M // 1721
@Math.0 // 1722
M=D // 1723

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
@Math.init.LT.0 // 1724
D=A // 1725
@SP // 1726
AM=M+1 // 1727
A=A-1 // 1728
M=D // 1729
@LCL // 1730
A=M+1 // 1731
D=M // 1732
@16 // 1733
D=D-A // 1734
@DO_LT // 1735
0;JMP // 1736
(Math.init.LT.0)
D=!D // 1737
@WHILE_END_Math.init1 // 1738
D;JNE // 1739

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 1740
D=M // 1741
@SP // 1742
AM=M+1 // 1743
A=A-1 // 1744
M=D // 1745
@LCL // 1746
A=M+1 // 1747
D=M // 1748
@SP // 1749
AM=M-1 // 1750
D=D+M // 1751
@SP // 1752
AM=M+1 // 1753
A=A-1 // 1754
M=D // 1755
@LCL // 1756
A=M // 1757
D=M // 1758
@SP // 1759
AM=M-1 // 1760
A=M // 1761
M=D // 1762

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

@LCL // 1763
A=M // 1764
D=M // 1765
D=D+M // 1766
@LCL // 1767
A=M // 1768
M=D // 1769

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

@LCL // 1770
A=M+1 // 1771
D=M // 1772
D=D+1 // 1773
@LCL // 1774
A=M+1 // 1775
M=D // 1776

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 1777
0;JMP // 1778

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 1779
AM=M+1 // 1780
A=A-1 // 1781
M=0 // 1782

////ReturnInstruction{}
@RETURN // 1783
0;JMP // 1784

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
@ARG // 1785
A=M // 1786
D=M // 1787
@SP // 1788
AM=M+1 // 1789
A=A-1 // 1790
M=D // 1791
@Math.0 // 1792
D=M // 1793
@SP // 1794
AM=M+1 // 1795
A=A-1 // 1796
M=D // 1797
@ARG // 1798
A=M+1 // 1799
D=M // 1800
@SP // 1801
AM=M-1 // 1802
A=D+M // 1803
D=M // 1804
@SP // 1805
AM=M-1 // 1806
D=D&M // 1807
@SP // 1808
AM=M+1 // 1809
A=A-1 // 1810
M=D // 1811

////ReturnInstruction{}
@RETURN // 1812
0;JMP // 1813

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 1814
AM=M+1 // 1815
A=A-1 // 1816
M=0 // 1817
@SP // 1818
AM=M+1 // 1819
A=A-1 // 1820
M=0 // 1821
@SP // 1822
AM=M+1 // 1823
A=A-1 // 1824
M=0 // 1825

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
@Math.multiply.EQ.1 // 1826
D=A // 1827
@SP // 1828
AM=M+1 // 1829
A=A-1 // 1830
M=D // 1831
@Math.multiply.EQ.2 // 1832
D=A // 1833
@SP // 1834
AM=M+1 // 1835
A=A-1 // 1836
M=D // 1837
@ARG // 1838
A=M // 1839
D=M // 1840
@DO_EQ // 1841
0;JMP // 1842
(Math.multiply.EQ.2)
@SP // 1843
AM=M+1 // 1844
A=A-1 // 1845
M=D // 1846
@Math.multiply.EQ.3 // 1847
D=A // 1848
@SP // 1849
AM=M+1 // 1850
A=A-1 // 1851
M=D // 1852
@ARG // 1853
A=M+1 // 1854
D=M // 1855
@DO_EQ // 1856
0;JMP // 1857
(Math.multiply.EQ.3)
@SP // 1858
AM=M-1 // 1859
D=D|M // 1860
@DO_EQ // 1861
0;JMP // 1862
(Math.multiply.EQ.1)
@Math.multiply.IfElse1 // 1863
D;JNE // 1864

////PushInstruction("constant 0")
@SP // 1865
AM=M+1 // 1866
A=A-1 // 1867
M=0 // 1868

////ReturnInstruction{}
@RETURN // 1869
0;JMP // 1870

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 1871
0;JMP // 1872

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
@Math.multiply.EQ.4 // 1873
D=A // 1874
@SP // 1875
AM=M+1 // 1876
A=A-1 // 1877
M=D // 1878
@ARG // 1879
A=M // 1880
D=M // 1881
D=D-1 // 1882
@DO_EQ // 1883
0;JMP // 1884
(Math.multiply.EQ.4)
D=!D // 1885
@Math.multiply.IfElse2 // 1886
D;JNE // 1887

////PushInstruction("argument 1")
@ARG // 1888
A=M+1 // 1889
D=M // 1890
@SP // 1891
AM=M+1 // 1892
A=A-1 // 1893
M=D // 1894

////ReturnInstruction{}
@RETURN // 1895
0;JMP // 1896

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 1897
0;JMP // 1898

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
@Math.multiply.EQ.5 // 1899
D=A // 1900
@SP // 1901
AM=M+1 // 1902
A=A-1 // 1903
M=D // 1904
@ARG // 1905
A=M+1 // 1906
D=M // 1907
D=D-1 // 1908
@DO_EQ // 1909
0;JMP // 1910
(Math.multiply.EQ.5)
D=!D // 1911
@Math.multiply.IfElse3 // 1912
D;JNE // 1913

////PushInstruction("argument 0")
@ARG // 1914
A=M // 1915
D=M // 1916
@SP // 1917
AM=M+1 // 1918
A=A-1 // 1919
M=D // 1920

////ReturnInstruction{}
@RETURN // 1921
0;JMP // 1922

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 1923
0;JMP // 1924

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
@Math.multiply.EQ.6 // 1925
D=A // 1926
@SP // 1927
AM=M+1 // 1928
A=A-1 // 1929
M=D // 1930
@ARG // 1931
A=M // 1932
D=M // 1933
@2 // 1934
D=D-A // 1935
@DO_EQ // 1936
0;JMP // 1937
(Math.multiply.EQ.6)
D=!D // 1938
@Math.multiply.IfElse4 // 1939
D;JNE // 1940

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1941
A=M+1 // 1942
D=M // 1943
D=D+M // 1944
@SP // 1945
AM=M+1 // 1946
A=A-1 // 1947
M=D // 1948

////ReturnInstruction{}
@RETURN // 1949
0;JMP // 1950

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 1951
0;JMP // 1952

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
@Math.multiply.EQ.7 // 1953
D=A // 1954
@SP // 1955
AM=M+1 // 1956
A=A-1 // 1957
M=D // 1958
@ARG // 1959
A=M+1 // 1960
D=M // 1961
@2 // 1962
D=D-A // 1963
@DO_EQ // 1964
0;JMP // 1965
(Math.multiply.EQ.7)
D=!D // 1966
@Math.multiply.IfElse5 // 1967
D;JNE // 1968

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1969
A=M // 1970
D=M // 1971
D=D+M // 1972
@SP // 1973
AM=M+1 // 1974
A=A-1 // 1975
M=D // 1976

////ReturnInstruction{}
@RETURN // 1977
0;JMP // 1978

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 1979
0;JMP // 1980

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

@LCL // 1981
A=M+1 // 1982
A=A+1 // 1983
M=1 // 1984

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
@Math.multiply.LT.8 // 1985
D=A // 1986
@SP // 1987
AM=M+1 // 1988
A=A-1 // 1989
M=D // 1990
@LCL // 1991
A=M+1 // 1992
D=M // 1993
@16 // 1994
D=D-A // 1995
@DO_LT // 1996
0;JMP // 1997
(Math.multiply.LT.8)
D=!D // 1998
@WHILE_END_Math.multiply1 // 1999
D;JNE // 2000

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
@Math.multiply.EQ.9 // 2001
D=A // 2002
@SP // 2003
AM=M+1 // 2004
A=A-1 // 2005
M=D // 2006
@ARG // 2007
A=M+1 // 2008
D=M // 2009
@SP // 2010
AM=M+1 // 2011
A=A-1 // 2012
M=D // 2013
@LCL // 2014
A=M+1 // 2015
A=A+1 // 2016
D=M // 2017
@SP // 2018
AM=M-1 // 2019
D=D&M // 2020
@DO_EQ // 2021
0;JMP // 2022
(Math.multiply.EQ.9)
@Math.multiply.IfElse6 // 2023
D;JNE // 2024

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

@LCL // 2025
A=M // 2026
D=M // 2027
@SP // 2028
AM=M+1 // 2029
A=A-1 // 2030
M=D // 2031
@ARG // 2032
A=M // 2033
D=M // 2034
@SP // 2035
AM=M-1 // 2036
D=D+M // 2037
@LCL // 2038
A=M // 2039
M=D // 2040

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 2041
0;JMP // 2042

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

@ARG // 2043
A=M // 2044
D=M // 2045
D=D+M // 2046
@ARG // 2047
A=M // 2048
M=D // 2049

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

@LCL // 2050
A=M+1 // 2051
D=M // 2052
D=D+1 // 2053
@LCL // 2054
A=M+1 // 2055
M=D // 2056

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

@LCL // 2057
A=M+1 // 2058
A=A+1 // 2059
D=M // 2060
D=D+M // 2061
@LCL // 2062
A=M+1 // 2063
A=A+1 // 2064
M=D // 2065

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 2066
0;JMP // 2067

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 2068
A=M // 2069
D=M // 2070
@SP // 2071
AM=M+1 // 2072
A=A-1 // 2073
M=D // 2074

////ReturnInstruction{}
@RETURN // 2075
0;JMP // 2076

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 2077
AM=M+1 // 2078
A=A-1 // 2079
M=0 // 2080
@SP // 2081
AM=M+1 // 2082
A=A-1 // 2083
M=0 // 2084
@SP // 2085
AM=M+1 // 2086
A=A-1 // 2087
M=0 // 2088

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2089
A=M // 2090
D=M // 2091
@SP // 2092
AM=M+1 // 2093
A=A-1 // 2094
M=D // 2095
// call Math.abs
@6 // 2096
D=A // 2097
@14 // 2098
M=D // 2099
@Math.abs // 2100
D=A // 2101
@13 // 2102
M=D // 2103
@Math.divide.ret.0 // 2104
D=A // 2105
@CALL // 2106
0;JMP // 2107
(Math.divide.ret.0)
@SP // 2108
AM=M-1 // 2109
D=M // 2110
@LCL // 2111
A=M+1 // 2112
M=D // 2113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 2114
A=M+1 // 2115
D=M // 2116
@SP // 2117
AM=M+1 // 2118
A=A-1 // 2119
M=D // 2120
// call Math.abs
@6 // 2121
D=A // 2122
@14 // 2123
M=D // 2124
@Math.abs // 2125
D=A // 2126
@13 // 2127
M=D // 2128
@Math.divide.ret.1 // 2129
D=A // 2130
@CALL // 2131
0;JMP // 2132
(Math.divide.ret.1)
@SP // 2133
AM=M-1 // 2134
D=M // 2135
@LCL // 2136
A=M+1 // 2137
A=A+1 // 2138
M=D // 2139

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
@Math.divide.GT.10 // 2140
D=A // 2141
@SP // 2142
AM=M+1 // 2143
A=A-1 // 2144
M=D // 2145
@LCL // 2146
A=M+1 // 2147
A=A+1 // 2148
D=M // 2149
A=A-1 // 2150
D=D-M // 2151
@DO_GT // 2152
0;JMP // 2153
(Math.divide.GT.10)
D=!D // 2154
@Math.divide.IfElse1 // 2155
D;JNE // 2156

////PushInstruction("constant 0")
@SP // 2157
AM=M+1 // 2158
A=A-1 // 2159
M=0 // 2160

////ReturnInstruction{}
@RETURN // 2161
0;JMP // 2162

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 2163
0;JMP // 2164

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

@LCL // 2165
A=M+1 // 2166
D=M // 2167
@SP // 2168
AM=M+1 // 2169
A=A-1 // 2170
M=D // 2171
@2 // 2172
D=A // 2173
@SP // 2174
AM=M+1 // 2175
A=A-1 // 2176
M=D // 2177
@LCL // 2178
A=M+1 // 2179
A=A+1 // 2180
D=M // 2181
@SP // 2182
AM=M+1 // 2183
A=A-1 // 2184
M=D // 2185
// call Math.multiply
@7 // 2186
D=A // 2187
@14 // 2188
M=D // 2189
@Math.multiply // 2190
D=A // 2191
@13 // 2192
M=D // 2193
@Math.divide.ret.2 // 2194
D=A // 2195
@CALL // 2196
0;JMP // 2197
(Math.divide.ret.2)
// call Math.divide
@7 // 2198
D=A // 2199
@14 // 2200
M=D // 2201
@Math.divide // 2202
D=A // 2203
@13 // 2204
M=D // 2205
@Math.divide.ret.3 // 2206
D=A // 2207
@CALL // 2208
0;JMP // 2209
(Math.divide.ret.3)
@SP // 2210
AM=M-1 // 2211
D=M // 2212
@LCL // 2213
A=M // 2214
M=D // 2215

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
@Math.divide.LT.11 // 2216
D=A // 2217
@SP // 2218
AM=M+1 // 2219
A=A-1 // 2220
M=D // 2221
@LCL // 2222
A=M+1 // 2223
D=M // 2224
@SP // 2225
AM=M+1 // 2226
A=A-1 // 2227
M=D // 2228
@2 // 2229
D=A // 2230
@SP // 2231
AM=M+1 // 2232
A=A-1 // 2233
M=D // 2234
@LCL // 2235
A=M // 2236
D=M // 2237
@SP // 2238
AM=M+1 // 2239
A=A-1 // 2240
M=D // 2241
// call Math.multiply
@7 // 2242
D=A // 2243
@14 // 2244
M=D // 2245
@Math.multiply // 2246
D=A // 2247
@13 // 2248
M=D // 2249
@Math.divide.ret.4 // 2250
D=A // 2251
@CALL // 2252
0;JMP // 2253
(Math.divide.ret.4)
@LCL // 2254
A=M+1 // 2255
A=A+1 // 2256
D=M // 2257
@SP // 2258
AM=M+1 // 2259
A=A-1 // 2260
M=D // 2261
// call Math.multiply
@7 // 2262
D=A // 2263
@14 // 2264
M=D // 2265
@Math.multiply // 2266
D=A // 2267
@13 // 2268
M=D // 2269
@Math.divide.ret.5 // 2270
D=A // 2271
@CALL // 2272
0;JMP // 2273
(Math.divide.ret.5)
@SP // 2274
AM=M-1 // 2275
D=M // 2276
@SP // 2277
AM=M-1 // 2278
D=M-D // 2279
@SP // 2280
AM=M+1 // 2281
A=A-1 // 2282
M=D // 2283
@LCL // 2284
A=M+1 // 2285
A=A+1 // 2286
D=M // 2287
@SP // 2288
AM=M-1 // 2289
D=M-D // 2290
@DO_LT // 2291
0;JMP // 2292
(Math.divide.LT.11)
D=!D // 2293
@Math.divide.IfElse2 // 2294
D;JNE // 2295

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
@Math.divide.EQ.12 // 2296
D=A // 2297
@SP // 2298
AM=M+1 // 2299
A=A-1 // 2300
M=D // 2301
@Math.divide.GT.13 // 2302
D=A // 2303
@SP // 2304
AM=M+1 // 2305
A=A-1 // 2306
M=D // 2307
@Math.divide.LT.14 // 2308
D=A // 2309
@SP // 2310
AM=M+1 // 2311
A=A-1 // 2312
M=D // 2313
@ARG // 2314
A=M // 2315
D=M // 2316
@DO_LT // 2317
0;JMP // 2318
(Math.divide.LT.14)
@SP // 2319
AM=M+1 // 2320
A=A-1 // 2321
M=D // 2322
@ARG // 2323
A=M+1 // 2324
D=M // 2325
@SP // 2326
AM=M-1 // 2327
D=D&M // 2328
@DO_GT // 2329
0;JMP // 2330
(Math.divide.GT.13)
@SP // 2331
AM=M+1 // 2332
A=A-1 // 2333
M=D // 2334
@Math.divide.LT.15 // 2335
D=A // 2336
@SP // 2337
AM=M+1 // 2338
A=A-1 // 2339
M=D // 2340
@Math.divide.GT.16 // 2341
D=A // 2342
@SP // 2343
AM=M+1 // 2344
A=A-1 // 2345
M=D // 2346
@ARG // 2347
A=M // 2348
D=M // 2349
@DO_GT // 2350
0;JMP // 2351
(Math.divide.GT.16)
@SP // 2352
AM=M+1 // 2353
A=A-1 // 2354
M=D // 2355
@ARG // 2356
A=M+1 // 2357
D=M // 2358
@SP // 2359
AM=M-1 // 2360
D=D&M // 2361
@DO_LT // 2362
0;JMP // 2363
(Math.divide.LT.15)
@SP // 2364
AM=M-1 // 2365
D=D|M // 2366
@DO_EQ // 2367
0;JMP // 2368
(Math.divide.EQ.12)
@Math.divide.IfElse3 // 2369
D;JNE // 2370

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2371
A=M // 2372
D=-M // 2373
@LCL // 2374
A=M // 2375
M=D // 2376

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 2377
0;JMP // 2378

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("local 0")], call=CallInstruction{Math.multiply}}
@2 // 2379
D=A // 2380
@SP // 2381
AM=M+1 // 2382
A=A-1 // 2383
M=D // 2384
@LCL // 2385
A=M // 2386
D=M // 2387
@SP // 2388
AM=M+1 // 2389
A=A-1 // 2390
M=D // 2391
// call Math.multiply
@7 // 2392
D=A // 2393
@14 // 2394
M=D // 2395
@Math.multiply // 2396
D=A // 2397
@13 // 2398
M=D // 2399
@Math.divide.ret.6 // 2400
D=A // 2401
@CALL // 2402
0;JMP // 2403
(Math.divide.ret.6)

////ReturnInstruction{}
@RETURN // 2404
0;JMP // 2405

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 2406
0;JMP // 2407

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
@Math.divide.EQ.17 // 2408
D=A // 2409
@SP // 2410
AM=M+1 // 2411
A=A-1 // 2412
M=D // 2413
@Math.divide.GT.18 // 2414
D=A // 2415
@SP // 2416
AM=M+1 // 2417
A=A-1 // 2418
M=D // 2419
@Math.divide.LT.19 // 2420
D=A // 2421
@SP // 2422
AM=M+1 // 2423
A=A-1 // 2424
M=D // 2425
@ARG // 2426
A=M // 2427
D=M // 2428
@DO_LT // 2429
0;JMP // 2430
(Math.divide.LT.19)
@SP // 2431
AM=M+1 // 2432
A=A-1 // 2433
M=D // 2434
@ARG // 2435
A=M+1 // 2436
D=M // 2437
@SP // 2438
AM=M-1 // 2439
D=D&M // 2440
@DO_GT // 2441
0;JMP // 2442
(Math.divide.GT.18)
@SP // 2443
AM=M+1 // 2444
A=A-1 // 2445
M=D // 2446
@Math.divide.LT.20 // 2447
D=A // 2448
@SP // 2449
AM=M+1 // 2450
A=A-1 // 2451
M=D // 2452
@Math.divide.GT.21 // 2453
D=A // 2454
@SP // 2455
AM=M+1 // 2456
A=A-1 // 2457
M=D // 2458
@ARG // 2459
A=M // 2460
D=M // 2461
@DO_GT // 2462
0;JMP // 2463
(Math.divide.GT.21)
@SP // 2464
AM=M+1 // 2465
A=A-1 // 2466
M=D // 2467
@ARG // 2468
A=M+1 // 2469
D=M // 2470
@SP // 2471
AM=M-1 // 2472
D=D&M // 2473
@DO_LT // 2474
0;JMP // 2475
(Math.divide.LT.20)
@SP // 2476
AM=M-1 // 2477
D=D|M // 2478
@DO_EQ // 2479
0;JMP // 2480
(Math.divide.EQ.17)
@Math.divide.IfElse4 // 2481
D;JNE // 2482

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2483
A=M // 2484
D=-M // 2485
@LCL // 2486
A=M // 2487
M=D // 2488

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 2489
0;JMP // 2490

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
@2 // 2491
D=A // 2492
@SP // 2493
AM=M+1 // 2494
A=A-1 // 2495
M=D // 2496
@LCL // 2497
A=M // 2498
D=M // 2499
@SP // 2500
AM=M+1 // 2501
A=A-1 // 2502
M=D // 2503
// call Math.multiply
@7 // 2504
D=A // 2505
@14 // 2506
M=D // 2507
@Math.multiply // 2508
D=A // 2509
@13 // 2510
M=D // 2511
@Math.divide.ret.7 // 2512
D=A // 2513
@CALL // 2514
0;JMP // 2515
(Math.divide.ret.7)
@SP // 2516
AM=M-1 // 2517
D=M // 2518
D=D+1 // 2519
@SP // 2520
AM=M+1 // 2521
A=A-1 // 2522
M=D // 2523

////ReturnInstruction{}
@RETURN // 2524
0;JMP // 2525

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
@ARG // 2526
A=M // 2527
D=M // 2528
@SP // 2529
AM=M+1 // 2530
A=A-1 // 2531
M=D // 2532
@ARG // 2533
A=M // 2534
D=M // 2535
@SP // 2536
AM=M+1 // 2537
A=A-1 // 2538
M=D // 2539
@ARG // 2540
A=M+1 // 2541
D=M // 2542
@SP // 2543
AM=M+1 // 2544
A=A-1 // 2545
M=D // 2546
// call Math.divide
@7 // 2547
D=A // 2548
@14 // 2549
M=D // 2550
@Math.divide // 2551
D=A // 2552
@13 // 2553
M=D // 2554
@Math.mod.ret.0 // 2555
D=A // 2556
@CALL // 2557
0;JMP // 2558
(Math.mod.ret.0)
@ARG // 2559
A=M+1 // 2560
D=M // 2561
@SP // 2562
AM=M+1 // 2563
A=A-1 // 2564
M=D // 2565
// call Math.multiply
@7 // 2566
D=A // 2567
@14 // 2568
M=D // 2569
@Math.multiply // 2570
D=A // 2571
@13 // 2572
M=D // 2573
@Math.mod.ret.1 // 2574
D=A // 2575
@CALL // 2576
0;JMP // 2577
(Math.mod.ret.1)
@SP // 2578
AM=M-1 // 2579
D=M // 2580
@SP // 2581
AM=M-1 // 2582
D=M-D // 2583
@SP // 2584
AM=M+1 // 2585
A=A-1 // 2586
M=D // 2587

////ReturnInstruction{}
@RETURN // 2588
0;JMP // 2589

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
@Math.0 // 2590
D=M // 2591
@SP // 2592
AM=M+1 // 2593
A=A-1 // 2594
M=D // 2595
@ARG // 2596
A=M // 2597
D=M // 2598
@SP // 2599
AM=M-1 // 2600
A=D+M // 2601
D=M // 2602
@SP // 2603
AM=M+1 // 2604
A=A-1 // 2605
M=D // 2606

////ReturnInstruction{}
@RETURN // 2607
0;JMP // 2608

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=8, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 2609
AM=M+1 // 2610
A=A-1 // 2611
M=0 // 2612
@SP // 2613
AM=M+1 // 2614
A=A-1 // 2615
M=0 // 2616
@SP // 2617
AM=M+1 // 2618
A=A-1 // 2619
M=0 // 2620
@SP // 2621
AM=M+1 // 2622
A=A-1 // 2623
M=0 // 2624

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2625
A=M // 2626
M=0 // 2627

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 2628
D=A // 2629
@LCL // 2630
A=M+1 // 2631
M=D // 2632

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
@Math.sqrt.EQ.22 // 2633
D=A // 2634
@SP // 2635
AM=M+1 // 2636
A=A-1 // 2637
M=D // 2638
@Math.sqrt.LT.23 // 2639
D=A // 2640
@SP // 2641
AM=M+1 // 2642
A=A-1 // 2643
M=D // 2644
@LCL // 2645
A=M+1 // 2646
D=M // 2647
@DO_LT // 2648
0;JMP // 2649
(Math.sqrt.LT.23)
D=!D // 2650
@DO_EQ // 2651
0;JMP // 2652
(Math.sqrt.EQ.22)
@WHILE_END_Math.sqrt1 // 2653
D;JNE // 2654

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

@LCL // 2655
A=M // 2656
D=M // 2657
@SP // 2658
AM=M+1 // 2659
A=A-1 // 2660
M=D // 2661
@Math.0 // 2662
D=M // 2663
@SP // 2664
AM=M+1 // 2665
A=A-1 // 2666
M=D // 2667
@LCL // 2668
A=M+1 // 2669
D=M // 2670
@SP // 2671
AM=M-1 // 2672
A=D+M // 2673
D=M // 2674
@SP // 2675
AM=M-1 // 2676
D=D+M // 2677
@LCL // 2678
A=M+1 // 2679
A=A+1 // 2680
M=D // 2681

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 2682
A=M+1 // 2683
A=A+1 // 2684
D=M // 2685
@SP // 2686
AM=M+1 // 2687
A=A-1 // 2688
M=D // 2689
@LCL // 2690
A=M+1 // 2691
A=A+1 // 2692
D=M // 2693
@SP // 2694
AM=M+1 // 2695
A=A-1 // 2696
M=D // 2697
// call Math.multiply
@7 // 2698
D=A // 2699
@14 // 2700
M=D // 2701
@Math.multiply // 2702
D=A // 2703
@13 // 2704
M=D // 2705
@Math.sqrt.ret.0 // 2706
D=A // 2707
@CALL // 2708
0;JMP // 2709
(Math.sqrt.ret.0)
@SP // 2710
AM=M-1 // 2711
D=M // 2712
@LCL // 2713
A=M+1 // 2714
A=A+1 // 2715
A=A+1 // 2716
M=D // 2717

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
@Math.sqrt.EQ.24 // 2718
D=A // 2719
@SP // 2720
AM=M+1 // 2721
A=A-1 // 2722
M=D // 2723
@Math.sqrt.GT.25 // 2724
D=A // 2725
@SP // 2726
AM=M+1 // 2727
A=A-1 // 2728
M=D // 2729
@LCL // 2730
A=M+1 // 2731
A=A+1 // 2732
A=A+1 // 2733
D=M // 2734
@SP // 2735
AM=M+1 // 2736
A=A-1 // 2737
M=D // 2738
@ARG // 2739
A=M // 2740
D=M // 2741
@SP // 2742
AM=M-1 // 2743
D=M-D // 2744
@DO_GT // 2745
0;JMP // 2746
(Math.sqrt.GT.25)
@SP // 2747
AM=M+1 // 2748
A=A-1 // 2749
M=D // 2750
@SP // 2751
A=M-1 // 2752
M=!D // 2753
@Math.sqrt.GT.26 // 2754
D=A // 2755
@SP // 2756
AM=M+1 // 2757
A=A-1 // 2758
M=D // 2759
@LCL // 2760
A=M+1 // 2761
A=A+1 // 2762
A=A+1 // 2763
D=M // 2764
@DO_GT // 2765
0;JMP // 2766
(Math.sqrt.GT.26)
@SP // 2767
AM=M-1 // 2768
D=D&M // 2769
@DO_EQ // 2770
0;JMP // 2771
(Math.sqrt.EQ.24)
@Math.sqrt.IfElse1 // 2772
D;JNE // 2773

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2774
A=M+1 // 2775
A=A+1 // 2776
D=M // 2777
@LCL // 2778
A=M // 2779
M=D // 2780

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 2781
0;JMP // 2782

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

@LCL // 2783
A=M+1 // 2784
D=M // 2785
D=D-1 // 2786
@LCL // 2787
A=M+1 // 2788
M=D // 2789

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 2790
0;JMP // 2791

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 2792
A=M // 2793
D=M // 2794
@SP // 2795
AM=M+1 // 2796
A=A-1 // 2797
M=D // 2798

////ReturnInstruction{}
@RETURN // 2799
0;JMP // 2800

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
@Math.max.GT.27 // 2801
D=A // 2802
@SP // 2803
AM=M+1 // 2804
A=A-1 // 2805
M=D // 2806
@ARG // 2807
A=M+1 // 2808
D=M // 2809
A=A-1 // 2810
D=M-D // 2811
@DO_GT // 2812
0;JMP // 2813
(Math.max.GT.27)
D=!D // 2814
@Math.max.IfElse1 // 2815
D;JNE // 2816

////PushInstruction("argument 0")
@ARG // 2817
A=M // 2818
D=M // 2819
@SP // 2820
AM=M+1 // 2821
A=A-1 // 2822
M=D // 2823

////ReturnInstruction{}
@RETURN // 2824
0;JMP // 2825

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 2826
0;JMP // 2827

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2828
A=M+1 // 2829
D=M // 2830
@SP // 2831
AM=M+1 // 2832
A=A-1 // 2833
M=D // 2834

////ReturnInstruction{}
@RETURN // 2835
0;JMP // 2836

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
@Math.min.LT.28 // 2837
D=A // 2838
@SP // 2839
AM=M+1 // 2840
A=A-1 // 2841
M=D // 2842
@ARG // 2843
A=M+1 // 2844
D=M // 2845
A=A-1 // 2846
D=M-D // 2847
@DO_LT // 2848
0;JMP // 2849
(Math.min.LT.28)
D=!D // 2850
@Math.min.IfElse1 // 2851
D;JNE // 2852

////PushInstruction("argument 0")
@ARG // 2853
A=M // 2854
D=M // 2855
@SP // 2856
AM=M+1 // 2857
A=A-1 // 2858
M=D // 2859

////ReturnInstruction{}
@RETURN // 2860
0;JMP // 2861

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 2862
0;JMP // 2863

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2864
A=M+1 // 2865
D=M // 2866
@SP // 2867
AM=M+1 // 2868
A=A-1 // 2869
M=D // 2870

////ReturnInstruction{}
@RETURN // 2871
0;JMP // 2872

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=8, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2873
A=M // 2874
D=M // 2875
@SP // 2876
AM=M+1 // 2877
A=A-1 // 2878
M=D // 2879
@ARG // 2880
A=M // 2881
D=M // 2882
@SP // 2883
AM=M+1 // 2884
A=A-1 // 2885
M=D // 2886
@SP // 2887
A=M-1 // 2888
M=-D // 2889
// call Math.max
@7 // 2890
D=A // 2891
@14 // 2892
M=D // 2893
@Math.max // 2894
D=A // 2895
@13 // 2896
M=D // 2897
@Math.abs.ret.0 // 2898
D=A // 2899
@CALL // 2900
0;JMP // 2901
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 2902
0;JMP // 2903

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 2904
AM=M+1 // 2905
A=A-1 // 2906
M=0 // 2907
@SP // 2908
AM=M+1 // 2909
A=A-1 // 2910
M=0 // 2911

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

@2055 // 2912
D=A // 2913
@LCL // 2914
A=M // 2915
M=D // 2916

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
@LCL // 2917
A=M // 2918
D=M // 2919
@SP // 2920
AM=M+1 // 2921
A=A-1 // 2922
M=D // 2923
@LCL // 2924
A=M // 2925
D=M // 2926
@16384 // 2927
D=A-D // 2928
@5 // 2929
D=D-A // 2930
@SP // 2931
AM=M-1 // 2932
A=M // 2933
M=D // 2934

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2935
A=M // 2936
D=M // 2937
@SP // 2938
AM=M+1 // 2939
A=A-1 // 2940
M=D+1 // 2941
D=1 // 2942
@SP // 2943
AM=M-1 // 2944
A=M // 2945
M=D // 2946

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2947
A=M // 2948
D=M // 2949
@2 // 2950
D=D+A // 2951
@SP // 2952
AM=M+1 // 2953
A=A-1 // 2954
M=D // 2955
D=0 // 2956
@SP // 2957
AM=M-1 // 2958
A=M // 2959
M=D // 2960

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2961
A=M // 2962
D=M // 2963
@3 // 2964
D=D+A // 2965
@SP // 2966
AM=M+1 // 2967
A=A-1 // 2968
M=D // 2969
D=0 // 2970
@SP // 2971
AM=M-1 // 2972
A=M // 2973
M=D // 2974

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2975
A=M // 2976
D=M // 2977
@SP // 2978
AM=M+1 // 2979
A=A-1 // 2980
M=D // 2981
// call Memory.create_foot
@6 // 2982
D=A // 2983
@14 // 2984
M=D // 2985
@Memory.create_foot // 2986
D=A // 2987
@13 // 2988
M=D // 2989
@Memory.init.ret.0 // 2990
D=A // 2991
@CALL // 2992
0;JMP // 2993
(Memory.init.ret.0)
@SP // 2994
M=M-1 // 2995

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

@2054 // 2996
D=A // 2997
@SP // 2998
AM=M+1 // 2999
A=A-1 // 3000
M=D // 3001
@2054 // 3002
D=A // 3003
@SP // 3004
AM=M+1 // 3005
A=A-1 // 3006
M=D // 3007
@LCL // 3008
A=M // 3009
D=M // 3010
@SP // 3011
AM=M+1 // 3012
A=A-1 // 3013
M=D // 3014
// call Memory.add_node
@7 // 3015
D=A // 3016
@14 // 3017
M=D // 3018
@Memory.add_node // 3019
D=A // 3020
@13 // 3021
M=D // 3022
@Memory.init.ret.1 // 3023
D=A // 3024
@CALL // 3025
0;JMP // 3026
(Memory.init.ret.1)
@SP // 3027
M=M-1 // 3028

////PushInstruction("constant 0")
@SP // 3029
AM=M+1 // 3030
A=A-1 // 3031
M=0 // 3032

////ReturnInstruction{}
@RETURN // 3033
0;JMP // 3034

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 3035
AM=M+1 // 3036
A=A-1 // 3037
M=0 // 3038
@SP // 3039
AM=M+1 // 3040
A=A-1 // 3041
M=0 // 3042
@SP // 3043
AM=M+1 // 3044
A=A-1 // 3045
M=0 // 3046
@SP // 3047
AM=M+1 // 3048
A=A-1 // 3049
M=0 // 3050
@SP // 3051
AM=M+1 // 3052
A=A-1 // 3053
M=0 // 3054

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3055
A=M // 3056
D=M // 3057
@SP // 3058
AM=M+1 // 3059
A=A-1 // 3060
M=D // 3061
// call Memory.getBinIndex
@6 // 3062
D=A // 3063
@14 // 3064
M=D // 3065
@Memory.getBinIndex // 3066
D=A // 3067
@13 // 3068
M=D // 3069
@Memory.alloc.ret.0 // 3070
D=A // 3071
@CALL // 3072
0;JMP // 3073
(Memory.alloc.ret.0)
@SP // 3074
AM=M-1 // 3075
D=M // 3076
@LCL // 3077
A=M // 3078
M=D // 3079

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

@LCL // 3080
A=M // 3081
D=M // 3082
@2048 // 3083
D=D+A // 3084
@LCL // 3085
A=M+1 // 3086
M=D // 3087

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3088
A=M+1 // 3089
D=M // 3090
@SP // 3091
AM=M+1 // 3092
A=A-1 // 3093
M=D // 3094
@ARG // 3095
A=M // 3096
D=M // 3097
@SP // 3098
AM=M+1 // 3099
A=A-1 // 3100
M=D // 3101
// call Memory.get_best_fit
@7 // 3102
D=A // 3103
@14 // 3104
M=D // 3105
@Memory.get_best_fit // 3106
D=A // 3107
@13 // 3108
M=D // 3109
@Memory.alloc.ret.1 // 3110
D=A // 3111
@CALL // 3112
0;JMP // 3113
(Memory.alloc.ret.1)
@SP // 3114
AM=M-1 // 3115
D=M // 3116
@LCL // 3117
A=M+1 // 3118
A=A+1 // 3119
M=D // 3120

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
@Memory.alloc.EQ.0 // 3121
D=A // 3122
@SP // 3123
AM=M+1 // 3124
A=A-1 // 3125
M=D // 3126
@LCL // 3127
A=M+1 // 3128
A=A+1 // 3129
D=M // 3130
@DO_EQ // 3131
0;JMP // 3132
(Memory.alloc.EQ.0)
D=!D // 3133
@WHILE_END_Memory.alloc1 // 3134
D;JNE // 3135

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
@Memory.alloc.EQ.1 // 3136
D=A // 3137
@SP // 3138
AM=M+1 // 3139
A=A-1 // 3140
M=D // 3141
@Memory.alloc.LT.2 // 3142
D=A // 3143
@SP // 3144
AM=M+1 // 3145
A=A-1 // 3146
M=D // 3147
@LCL // 3148
A=M // 3149
D=M // 3150
D=D+1 // 3151
@7 // 3152
D=D-A // 3153
@DO_LT // 3154
0;JMP // 3155
(Memory.alloc.LT.2)
D=!D // 3156
@DO_EQ // 3157
0;JMP // 3158
(Memory.alloc.EQ.1)
@Memory.alloc.IfElse1 // 3159
D;JNE // 3160

////PushInstruction("constant 0")
@SP // 3161
AM=M+1 // 3162
A=A-1 // 3163
M=0 // 3164

////ReturnInstruction{}
@RETURN // 3165
0;JMP // 3166

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 3167
0;JMP // 3168

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

@LCL // 3169
A=M // 3170
D=M // 3171
D=D+1 // 3172
@LCL // 3173
A=M // 3174
M=D // 3175

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

@LCL // 3176
A=M // 3177
D=M // 3178
@2048 // 3179
D=D+A // 3180
@LCL // 3181
A=M+1 // 3182
M=D // 3183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3184
A=M+1 // 3185
D=M // 3186
@SP // 3187
AM=M+1 // 3188
A=A-1 // 3189
M=D // 3190
@ARG // 3191
A=M // 3192
D=M // 3193
@SP // 3194
AM=M+1 // 3195
A=A-1 // 3196
M=D // 3197
// call Memory.get_best_fit
@7 // 3198
D=A // 3199
@14 // 3200
M=D // 3201
@Memory.get_best_fit // 3202
D=A // 3203
@13 // 3204
M=D // 3205
@Memory.alloc.ret.2 // 3206
D=A // 3207
@CALL // 3208
0;JMP // 3209
(Memory.alloc.ret.2)
@SP // 3210
AM=M-1 // 3211
D=M // 3212
@LCL // 3213
A=M+1 // 3214
A=A+1 // 3215
M=D // 3216

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 3217
0;JMP // 3218

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

@LCL // 3219
A=M+1 // 3220
A=A+1 // 3221
D=M // 3222
@0 // 3223
A=D+A // 3224
D=M // 3225
@SP // 3226
AM=M+1 // 3227
A=A-1 // 3228
M=D // 3229
// call Memory.getBinIndex
@6 // 3230
D=A // 3231
@14 // 3232
M=D // 3233
@Memory.getBinIndex // 3234
D=A // 3235
@13 // 3236
M=D // 3237
@Memory.alloc.ret.3 // 3238
D=A // 3239
@CALL // 3240
0;JMP // 3241
(Memory.alloc.ret.3)
@SP // 3242
AM=M-1 // 3243
D=M // 3244
@2048 // 3245
D=D+A // 3246
@SP // 3247
AM=M+1 // 3248
A=A-1 // 3249
M=D // 3250
@LCL // 3251
A=M+1 // 3252
A=A+1 // 3253
D=M // 3254
@SP // 3255
AM=M+1 // 3256
A=A-1 // 3257
M=D // 3258
// call Memory.remove_node
@7 // 3259
D=A // 3260
@14 // 3261
M=D // 3262
@Memory.remove_node // 3263
D=A // 3264
@13 // 3265
M=D // 3266
@Memory.alloc.ret.4 // 3267
D=A // 3268
@CALL // 3269
0;JMP // 3270
(Memory.alloc.ret.4)
@SP // 3271
M=M-1 // 3272

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

@LCL // 3273
A=M+1 // 3274
A=A+1 // 3275
D=M // 3276
@0 // 3277
A=D+A // 3278
D=M // 3279
@SP // 3280
AM=M+1 // 3281
A=A-1 // 3282
M=D // 3283
@ARG // 3284
A=M // 3285
D=M // 3286
@SP // 3287
AM=M-1 // 3288
D=M-D // 3289
@LCL // 3290
A=M+1 // 3291
A=A+1 // 3292
A=A+1 // 3293
M=D // 3294

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
@Memory.alloc.GT.3 // 3295
D=A // 3296
@SP // 3297
AM=M+1 // 3298
A=A-1 // 3299
M=D // 3300
@LCL // 3301
A=M+1 // 3302
A=A+1 // 3303
A=A+1 // 3304
D=M // 3305
@5 // 3306
D=D-A // 3307
@DO_GT // 3308
0;JMP // 3309
(Memory.alloc.GT.3)
D=!D // 3310
@Memory.alloc.IfElse2 // 3311
D;JNE // 3312

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 3313
A=M+1 // 3314
A=A+1 // 3315
D=M // 3316
@SP // 3317
AM=M+1 // 3318
A=A-1 // 3319
M=D // 3320
@ARG // 3321
A=M // 3322
D=M // 3323
@SP // 3324
AM=M-1 // 3325
A=M // 3326
M=D // 3327

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3328
A=M+1 // 3329
A=A+1 // 3330
D=M // 3331
@SP // 3332
AM=M+1 // 3333
A=A-1 // 3334
M=D+1 // 3335
D=0 // 3336
@SP // 3337
AM=M-1 // 3338
A=M // 3339
M=D // 3340

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3341
A=M+1 // 3342
A=A+1 // 3343
D=M // 3344
@SP // 3345
AM=M+1 // 3346
A=A-1 // 3347
M=D // 3348
// call Memory.create_foot
@6 // 3349
D=A // 3350
@14 // 3351
M=D // 3352
@Memory.create_foot // 3353
D=A // 3354
@13 // 3355
M=D // 3356
@Memory.alloc.ret.5 // 3357
D=A // 3358
@CALL // 3359
0;JMP // 3360
(Memory.alloc.ret.5)
@SP // 3361
M=M-1 // 3362

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

@LCL // 3363
A=M+1 // 3364
A=A+1 // 3365
D=M // 3366
@SP // 3367
AM=M+1 // 3368
A=A-1 // 3369
M=D // 3370
@ARG // 3371
A=M // 3372
D=M // 3373
@SP // 3374
AM=M-1 // 3375
D=D+M // 3376
@5 // 3377
D=D+A // 3378
@SP // 3379
AM=M+1 // 3380
A=A-1 // 3381
M=D // 3382
@LCL // 3383
D=M // 3384
@4 // 3385
A=D+A // 3386
D=A // 3387
@R13 // 3388
M=D // 3389
@SP // 3390
AM=M-1 // 3391
D=M // 3392
@R13 // 3393
A=M // 3394
M=D // 3395

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
@LCL // 3396
D=M // 3397
@4 // 3398
A=D+A // 3399
D=M // 3400
@SP // 3401
AM=M+1 // 3402
A=A-1 // 3403
M=D // 3404
@LCL // 3405
A=M+1 // 3406
A=A+1 // 3407
A=A+1 // 3408
D=M // 3409
@5 // 3410
D=D-A // 3411
@SP // 3412
AM=M-1 // 3413
A=M // 3414
M=D // 3415

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3416
D=M // 3417
@4 // 3418
A=D+A // 3419
D=M // 3420
@SP // 3421
AM=M+1 // 3422
A=A-1 // 3423
M=D+1 // 3424
D=1 // 3425
@SP // 3426
AM=M-1 // 3427
A=M // 3428
M=D // 3429

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3430
D=M // 3431
@4 // 3432
A=D+A // 3433
D=M // 3434
@SP // 3435
AM=M+1 // 3436
A=A-1 // 3437
M=D // 3438
// call Memory.create_foot
@6 // 3439
D=A // 3440
@14 // 3441
M=D // 3442
@Memory.create_foot // 3443
D=A // 3444
@13 // 3445
M=D // 3446
@Memory.alloc.ret.6 // 3447
D=A // 3448
@CALL // 3449
0;JMP // 3450
(Memory.alloc.ret.6)
@SP // 3451
M=M-1 // 3452

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

@LCL // 3453
A=M+1 // 3454
A=A+1 // 3455
A=A+1 // 3456
D=M // 3457
@SP // 3458
AM=M+1 // 3459
A=A-1 // 3460
M=D // 3461
// call Memory.getBinIndex
@6 // 3462
D=A // 3463
@14 // 3464
M=D // 3465
@Memory.getBinIndex // 3466
D=A // 3467
@13 // 3468
M=D // 3469
@Memory.alloc.ret.7 // 3470
D=A // 3471
@CALL // 3472
0;JMP // 3473
(Memory.alloc.ret.7)
@SP // 3474
AM=M-1 // 3475
D=M // 3476
@2048 // 3477
D=D+A // 3478
@SP // 3479
AM=M+1 // 3480
A=A-1 // 3481
M=D // 3482
@LCL // 3483
D=M // 3484
@4 // 3485
A=D+A // 3486
D=M // 3487
@SP // 3488
AM=M+1 // 3489
A=A-1 // 3490
M=D // 3491
// call Memory.add_node
@7 // 3492
D=A // 3493
@14 // 3494
M=D // 3495
@Memory.add_node // 3496
D=A // 3497
@13 // 3498
M=D // 3499
@Memory.alloc.ret.8 // 3500
D=A // 3501
@CALL // 3502
0;JMP // 3503
(Memory.alloc.ret.8)
@SP // 3504
M=M-1 // 3505

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 3506
0;JMP // 3507

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
@LCL // 3508
A=M+1 // 3509
A=A+1 // 3510
D=M // 3511
@SP // 3512
AM=M+1 // 3513
A=A-1 // 3514
M=D+1 // 3515
D=0 // 3516
@SP // 3517
AM=M-1 // 3518
A=M // 3519
M=D // 3520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3521
A=M+1 // 3522
A=A+1 // 3523
D=M // 3524
@SP // 3525
AM=M+1 // 3526
A=A-1 // 3527
M=D // 3528
// call Memory.create_foot
@6 // 3529
D=A // 3530
@14 // 3531
M=D // 3532
@Memory.create_foot // 3533
D=A // 3534
@13 // 3535
M=D // 3536
@Memory.alloc.ret.9 // 3537
D=A // 3538
@CALL // 3539
0;JMP // 3540
(Memory.alloc.ret.9)
@SP // 3541
M=M-1 // 3542

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
@LCL // 3543
A=M+1 // 3544
A=A+1 // 3545
D=M // 3546
@4 // 3547
D=D+A // 3548
@SP // 3549
AM=M+1 // 3550
A=A-1 // 3551
M=D // 3552

////ReturnInstruction{}
@RETURN // 3553
0;JMP // 3554

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 3555
AM=M+1 // 3556
A=A-1 // 3557
M=0 // 3558

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3559
A=M // 3560
D=M // 3561
@SP // 3562
AM=M+1 // 3563
A=A-1 // 3564
M=D // 3565
// call Memory.alloc
@6 // 3566
D=A // 3567
@14 // 3568
M=D // 3569
@Memory.alloc // 3570
D=A // 3571
@13 // 3572
M=D // 3573
@Memory.calloc.ret.0 // 3574
D=A // 3575
@CALL // 3576
0;JMP // 3577
(Memory.calloc.ret.0)
@SP // 3578
AM=M-1 // 3579
D=M // 3580
@LCL // 3581
A=M // 3582
M=D // 3583

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.4 // 3584
D=A // 3585
@SP // 3586
AM=M+1 // 3587
A=A-1 // 3588
M=D // 3589
@LCL // 3590
A=M // 3591
D=!M // 3592
@DO_EQ // 3593
0;JMP // 3594
(Memory.calloc.EQ.4)
@Memory.calloc.IfElse1 // 3595
D;JNE // 3596

////PushInstruction("constant 0")
@SP // 3597
AM=M+1 // 3598
A=A-1 // 3599
M=0 // 3600

////ReturnInstruction{}
@RETURN // 3601
0;JMP // 3602

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 3603
0;JMP // 3604

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
@Memory.calloc.GT.5 // 3605
D=A // 3606
@SP // 3607
AM=M+1 // 3608
A=A-1 // 3609
M=D // 3610
@ARG // 3611
A=M // 3612
D=M // 3613
@DO_GT // 3614
0;JMP // 3615
(Memory.calloc.GT.5)
D=!D // 3616
@WHILE_END_Memory.calloc1 // 3617
D;JNE // 3618

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

@ARG // 3619
A=M // 3620
D=M // 3621
D=D-1 // 3622
@ARG // 3623
A=M // 3624
M=D // 3625

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 3626
A=M // 3627
D=M // 3628
@SP // 3629
AM=M+1 // 3630
A=A-1 // 3631
M=D // 3632
@ARG // 3633
A=M // 3634
D=M // 3635
@SP // 3636
AM=M-1 // 3637
D=D+M // 3638
@SP // 3639
AM=M+1 // 3640
A=A-1 // 3641
M=D // 3642
D=0 // 3643
@SP // 3644
AM=M-1 // 3645
A=M // 3646
M=D // 3647

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 3648
0;JMP // 3649

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 3650
A=M // 3651
D=M // 3652
@SP // 3653
AM=M+1 // 3654
A=A-1 // 3655
M=D // 3656

////ReturnInstruction{}
@RETURN // 3657
0;JMP // 3658

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 3659
AM=M+1 // 3660
A=A-1 // 3661
M=0 // 3662
@SP // 3663
AM=M+1 // 3664
A=A-1 // 3665
M=0 // 3666
@SP // 3667
AM=M+1 // 3668
A=A-1 // 3669
M=0 // 3670

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

@ARG // 3671
A=M // 3672
D=M // 3673
@4 // 3674
D=D-A // 3675
@LCL // 3676
A=M // 3677
M=D // 3678

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3679
A=M // 3680
D=M // 3681
@SP // 3682
AM=M+1 // 3683
A=A-1 // 3684
M=D+1 // 3685
D=1 // 3686
@SP // 3687
AM=M-1 // 3688
A=M // 3689
M=D // 3690

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

@LCL // 3691
A=M // 3692
D=M // 3693
@2 // 3694
A=D+A // 3695
D=M // 3696
@LCL // 3697
A=M+1 // 3698
M=D // 3699

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

@LCL // 3700
A=M // 3701
D=M // 3702
@3 // 3703
A=D+A // 3704
D=M // 3705
@LCL // 3706
A=M+1 // 3707
A=A+1 // 3708
M=D // 3709

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
@Memory.deAlloc.EQ.6 // 3710
D=A // 3711
@SP // 3712
AM=M+1 // 3713
A=A-1 // 3714
M=D // 3715
@Memory.deAlloc.EQ.7 // 3716
D=A // 3717
@SP // 3718
AM=M+1 // 3719
A=A-1 // 3720
M=D // 3721
@LCL // 3722
A=M+1 // 3723
D=M // 3724
@DO_EQ // 3725
0;JMP // 3726
(Memory.deAlloc.EQ.7)
D=!D // 3727
@DO_EQ // 3728
0;JMP // 3729
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse1 // 3730
D;JNE // 3731

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
@Memory.deAlloc.EQ.8 // 3732
D=A // 3733
@SP // 3734
AM=M+1 // 3735
A=A-1 // 3736
M=D // 3737
@LCL // 3738
A=M+1 // 3739
D=M // 3740
A=D+1 // 3741
D=M // 3742
D=D-1 // 3743
@DO_EQ // 3744
0;JMP // 3745
(Memory.deAlloc.EQ.8)
D=!D // 3746
@Memory.deAlloc.IfElse2 // 3747
D;JNE // 3748

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

@LCL // 3749
A=M+1 // 3750
D=M // 3751
@0 // 3752
A=D+A // 3753
D=M // 3754
@SP // 3755
AM=M+1 // 3756
A=A-1 // 3757
M=D // 3758
// call Memory.getBinIndex
@6 // 3759
D=A // 3760
@14 // 3761
M=D // 3762
@Memory.getBinIndex // 3763
D=A // 3764
@13 // 3765
M=D // 3766
@Memory.deAlloc.ret.0 // 3767
D=A // 3768
@CALL // 3769
0;JMP // 3770
(Memory.deAlloc.ret.0)
@SP // 3771
AM=M-1 // 3772
D=M // 3773
@2048 // 3774
D=D+A // 3775
@SP // 3776
AM=M+1 // 3777
A=A-1 // 3778
M=D // 3779
@LCL // 3780
A=M+1 // 3781
D=M // 3782
@SP // 3783
AM=M+1 // 3784
A=A-1 // 3785
M=D // 3786
// call Memory.remove_node
@7 // 3787
D=A // 3788
@14 // 3789
M=D // 3790
@Memory.remove_node // 3791
D=A // 3792
@13 // 3793
M=D // 3794
@Memory.deAlloc.ret.1 // 3795
D=A // 3796
@CALL // 3797
0;JMP // 3798
(Memory.deAlloc.ret.1)
@SP // 3799
M=M-1 // 3800

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
@LCL // 3801
A=M+1 // 3802
D=M // 3803
@SP // 3804
AM=M+1 // 3805
A=A-1 // 3806
M=D // 3807
@LCL // 3808
A=M+1 // 3809
D=M // 3810
@0 // 3811
A=D+A // 3812
D=M // 3813
@SP // 3814
AM=M+1 // 3815
A=A-1 // 3816
M=D // 3817
@LCL // 3818
A=M // 3819
D=M // 3820
@0 // 3821
A=D+A // 3822
D=M // 3823
@SP // 3824
AM=M-1 // 3825
D=D+M // 3826
@5 // 3827
D=D+A // 3828
@SP // 3829
AM=M-1 // 3830
A=M // 3831
M=D // 3832

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3833
A=M+1 // 3834
D=M // 3835
@SP // 3836
AM=M+1 // 3837
A=A-1 // 3838
M=D // 3839
// call Memory.create_foot
@6 // 3840
D=A // 3841
@14 // 3842
M=D // 3843
@Memory.create_foot // 3844
D=A // 3845
@13 // 3846
M=D // 3847
@Memory.deAlloc.ret.2 // 3848
D=A // 3849
@CALL // 3850
0;JMP // 3851
(Memory.deAlloc.ret.2)
@SP // 3852
M=M-1 // 3853

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3854
A=M+1 // 3855
D=M // 3856
@LCL // 3857
A=M // 3858
M=D // 3859

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 3860
0;JMP // 3861

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 3862
0;JMP // 3863

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
@Memory.deAlloc.EQ.9 // 3864
D=A // 3865
@SP // 3866
AM=M+1 // 3867
A=A-1 // 3868
M=D // 3869
@Memory.deAlloc.EQ.10 // 3870
D=A // 3871
@SP // 3872
AM=M+1 // 3873
A=A-1 // 3874
M=D // 3875
@LCL // 3876
A=M+1 // 3877
A=A+1 // 3878
D=M // 3879
@DO_EQ // 3880
0;JMP // 3881
(Memory.deAlloc.EQ.10)
D=!D // 3882
@DO_EQ // 3883
0;JMP // 3884
(Memory.deAlloc.EQ.9)
@Memory.deAlloc.IfElse3 // 3885
D;JNE // 3886

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
@Memory.deAlloc.EQ.11 // 3887
D=A // 3888
@SP // 3889
AM=M+1 // 3890
A=A-1 // 3891
M=D // 3892
@LCL // 3893
A=M+1 // 3894
A=A+1 // 3895
D=M // 3896
A=D+1 // 3897
D=M // 3898
D=D-1 // 3899
@DO_EQ // 3900
0;JMP // 3901
(Memory.deAlloc.EQ.11)
D=!D // 3902
@Memory.deAlloc.IfElse4 // 3903
D;JNE // 3904

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

@LCL // 3905
A=M+1 // 3906
A=A+1 // 3907
D=M // 3908
@0 // 3909
A=D+A // 3910
D=M // 3911
@SP // 3912
AM=M+1 // 3913
A=A-1 // 3914
M=D // 3915
// call Memory.getBinIndex
@6 // 3916
D=A // 3917
@14 // 3918
M=D // 3919
@Memory.getBinIndex // 3920
D=A // 3921
@13 // 3922
M=D // 3923
@Memory.deAlloc.ret.3 // 3924
D=A // 3925
@CALL // 3926
0;JMP // 3927
(Memory.deAlloc.ret.3)
@SP // 3928
AM=M-1 // 3929
D=M // 3930
@2048 // 3931
D=D+A // 3932
@SP // 3933
AM=M+1 // 3934
A=A-1 // 3935
M=D // 3936
@LCL // 3937
A=M+1 // 3938
A=A+1 // 3939
D=M // 3940
@SP // 3941
AM=M+1 // 3942
A=A-1 // 3943
M=D // 3944
// call Memory.remove_node
@7 // 3945
D=A // 3946
@14 // 3947
M=D // 3948
@Memory.remove_node // 3949
D=A // 3950
@13 // 3951
M=D // 3952
@Memory.deAlloc.ret.4 // 3953
D=A // 3954
@CALL // 3955
0;JMP // 3956
(Memory.deAlloc.ret.4)
@SP // 3957
M=M-1 // 3958

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
@LCL // 3959
A=M // 3960
D=M // 3961
@SP // 3962
AM=M+1 // 3963
A=A-1 // 3964
M=D // 3965
@LCL // 3966
A=M // 3967
D=M // 3968
@0 // 3969
A=D+A // 3970
D=M // 3971
@SP // 3972
AM=M+1 // 3973
A=A-1 // 3974
M=D // 3975
@LCL // 3976
A=M+1 // 3977
A=A+1 // 3978
D=M // 3979
@0 // 3980
A=D+A // 3981
D=M // 3982
@SP // 3983
AM=M-1 // 3984
D=D+M // 3985
@5 // 3986
D=D+A // 3987
@SP // 3988
AM=M-1 // 3989
A=M // 3990
M=D // 3991

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3992
A=M // 3993
D=M // 3994
@SP // 3995
AM=M+1 // 3996
A=A-1 // 3997
M=D // 3998
// call Memory.create_foot
@6 // 3999
D=A // 4000
@14 // 4001
M=D // 4002
@Memory.create_foot // 4003
D=A // 4004
@13 // 4005
M=D // 4006
@Memory.deAlloc.ret.5 // 4007
D=A // 4008
@CALL // 4009
0;JMP // 4010
(Memory.deAlloc.ret.5)
@SP // 4011
M=M-1 // 4012

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 4013
0;JMP // 4014

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 4015
0;JMP // 4016

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

@LCL // 4017
A=M // 4018
D=M // 4019
@0 // 4020
A=D+A // 4021
D=M // 4022
@SP // 4023
AM=M+1 // 4024
A=A-1 // 4025
M=D // 4026
// call Memory.getBinIndex
@6 // 4027
D=A // 4028
@14 // 4029
M=D // 4030
@Memory.getBinIndex // 4031
D=A // 4032
@13 // 4033
M=D // 4034
@Memory.deAlloc.ret.6 // 4035
D=A // 4036
@CALL // 4037
0;JMP // 4038
(Memory.deAlloc.ret.6)
@SP // 4039
AM=M-1 // 4040
D=M // 4041
@2048 // 4042
D=D+A // 4043
@SP // 4044
AM=M+1 // 4045
A=A-1 // 4046
M=D // 4047
@LCL // 4048
A=M // 4049
D=M // 4050
@SP // 4051
AM=M+1 // 4052
A=A-1 // 4053
M=D // 4054
// call Memory.add_node
@7 // 4055
D=A // 4056
@14 // 4057
M=D // 4058
@Memory.add_node // 4059
D=A // 4060
@13 // 4061
M=D // 4062
@Memory.deAlloc.ret.7 // 4063
D=A // 4064
@CALL // 4065
0;JMP // 4066
(Memory.deAlloc.ret.7)
@SP // 4067
M=M-1 // 4068

////PushInstruction("constant 0")
@SP // 4069
AM=M+1 // 4070
A=A-1 // 4071
M=0 // 4072

////ReturnInstruction{}
@RETURN // 4073
0;JMP // 4074

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 4075
AM=M+1 // 4076
A=A-1 // 4077
M=0 // 4078
@SP // 4079
AM=M+1 // 4080
A=A-1 // 4081
M=0 // 4082
@SP // 4083
AM=M+1 // 4084
A=A-1 // 4085
M=0 // 4086
@SP // 4087
AM=M+1 // 4088
A=A-1 // 4089
M=0 // 4090

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
@Memory.realloc.EQ.12 // 4091
D=A // 4092
@SP // 4093
AM=M+1 // 4094
A=A-1 // 4095
M=D // 4096
@ARG // 4097
A=M // 4098
D=M // 4099
@DO_EQ // 4100
0;JMP // 4101
(Memory.realloc.EQ.12)
D=!D // 4102
@Memory.realloc.IfElse1 // 4103
D;JNE // 4104

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 4105
A=M+1 // 4106
D=M // 4107
@SP // 4108
AM=M+1 // 4109
A=A-1 // 4110
M=D // 4111
// call Memory.alloc
@6 // 4112
D=A // 4113
@14 // 4114
M=D // 4115
@Memory.alloc // 4116
D=A // 4117
@13 // 4118
M=D // 4119
@Memory.realloc.ret.0 // 4120
D=A // 4121
@CALL // 4122
0;JMP // 4123
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 4124
0;JMP // 4125

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 4126
0;JMP // 4127

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

@ARG // 4128
A=M // 4129
D=M // 4130
D=D-1 // 4131
@LCL // 4132
A=M+1 // 4133
A=A+1 // 4134
A=A+1 // 4135
M=D // 4136

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

@LCL // 4137
A=M+1 // 4138
A=A+1 // 4139
A=A+1 // 4140
D=M // 4141
@0 // 4142
A=D+A // 4143
D=M // 4144
@LCL // 4145
A=M // 4146
M=D // 4147

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 4148
A=M+1 // 4149
D=M // 4150
@SP // 4151
AM=M+1 // 4152
A=A-1 // 4153
M=D // 4154
// call Memory.alloc
@6 // 4155
D=A // 4156
@14 // 4157
M=D // 4158
@Memory.alloc // 4159
D=A // 4160
@13 // 4161
M=D // 4162
@Memory.realloc.ret.1 // 4163
D=A // 4164
@CALL // 4165
0;JMP // 4166
(Memory.realloc.ret.1)
@SP // 4167
AM=M-1 // 4168
D=M // 4169
@LCL // 4170
A=M+1 // 4171
M=D // 4172

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
@Memory.realloc.EQ.13 // 4173
D=A // 4174
@SP // 4175
AM=M+1 // 4176
A=A-1 // 4177
M=D // 4178
@LCL // 4179
A=M+1 // 4180
D=M // 4181
@DO_EQ // 4182
0;JMP // 4183
(Memory.realloc.EQ.13)
D=!D // 4184
@Memory.realloc.IfElse2 // 4185
D;JNE // 4186

////PushInstruction("constant 0")
@SP // 4187
AM=M+1 // 4188
A=A-1 // 4189
M=0 // 4190

////ReturnInstruction{}
@RETURN // 4191
0;JMP // 4192

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 4193
0;JMP // 4194

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
@Memory.realloc.EQ.14 // 4195
D=A // 4196
@SP // 4197
AM=M+1 // 4198
A=A-1 // 4199
M=D // 4200
@Memory.realloc.GT.15 // 4201
D=A // 4202
@SP // 4203
AM=M+1 // 4204
A=A-1 // 4205
M=D // 4206
@LCL // 4207
A=M // 4208
D=M // 4209
@SP // 4210
AM=M+1 // 4211
A=A-1 // 4212
M=D // 4213
@ARG // 4214
A=M+1 // 4215
D=M // 4216
@SP // 4217
AM=M-1 // 4218
D=M-D // 4219
@DO_GT // 4220
0;JMP // 4221
(Memory.realloc.GT.15)
D=!D // 4222
@DO_EQ // 4223
0;JMP // 4224
(Memory.realloc.EQ.14)
@Memory.realloc.IfElse3 // 4225
D;JNE // 4226

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4227
A=M // 4228
D=M // 4229
@LCL // 4230
A=M+1 // 4231
A=A+1 // 4232
M=D // 4233

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 4234
0;JMP // 4235

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 4236
A=M+1 // 4237
D=M // 4238
@LCL // 4239
A=M+1 // 4240
A=A+1 // 4241
M=D // 4242

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4243
A=M // 4244
D=M // 4245
@SP // 4246
AM=M+1 // 4247
A=A-1 // 4248
M=D // 4249
@LCL // 4250
A=M+1 // 4251
D=M // 4252
@SP // 4253
AM=M+1 // 4254
A=A-1 // 4255
M=D // 4256
@LCL // 4257
A=M+1 // 4258
A=A+1 // 4259
D=M // 4260
@SP // 4261
AM=M+1 // 4262
A=A-1 // 4263
M=D // 4264
// call Memory.copy
@8 // 4265
D=A // 4266
@14 // 4267
M=D // 4268
@Memory.copy // 4269
D=A // 4270
@13 // 4271
M=D // 4272
@Memory.realloc.ret.2 // 4273
D=A // 4274
@CALL // 4275
0;JMP // 4276
(Memory.realloc.ret.2)
@SP // 4277
M=M-1 // 4278

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4279
A=M // 4280
D=M // 4281
@SP // 4282
AM=M+1 // 4283
A=A-1 // 4284
M=D // 4285
// call Memory.deAlloc
@6 // 4286
D=A // 4287
@14 // 4288
M=D // 4289
@Memory.deAlloc // 4290
D=A // 4291
@13 // 4292
M=D // 4293
@Memory.realloc.ret.3 // 4294
D=A // 4295
@CALL // 4296
0;JMP // 4297
(Memory.realloc.ret.3)
@SP // 4298
M=M-1 // 4299

////PushInstruction("local 1")
@LCL // 4300
A=M+1 // 4301
D=M // 4302
@SP // 4303
AM=M+1 // 4304
A=A-1 // 4305
M=D // 4306

////ReturnInstruction{}
@RETURN // 4307
0;JMP // 4308

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 4309
AM=M+1 // 4310
A=A-1 // 4311
M=0 // 4312

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4313
A=M // 4314
M=0 // 4315

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
@Memory.copy.LT.16 // 4316
D=A // 4317
@SP // 4318
AM=M+1 // 4319
A=A-1 // 4320
M=D // 4321
@LCL // 4322
A=M // 4323
D=M // 4324
@SP // 4325
AM=M+1 // 4326
A=A-1 // 4327
M=D // 4328
@ARG // 4329
A=M+1 // 4330
A=A+1 // 4331
D=M // 4332
@SP // 4333
AM=M-1 // 4334
D=M-D // 4335
@DO_LT // 4336
0;JMP // 4337
(Memory.copy.LT.16)
D=!D // 4338
@WHILE_END_Memory.copy1 // 4339
D;JNE // 4340

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
@ARG // 4341
A=M+1 // 4342
D=M // 4343
@SP // 4344
AM=M+1 // 4345
A=A-1 // 4346
M=D // 4347
@LCL // 4348
A=M // 4349
D=M // 4350
@SP // 4351
AM=M-1 // 4352
D=D+M // 4353
@SP // 4354
AM=M+1 // 4355
A=A-1 // 4356
M=D // 4357
@ARG // 4358
A=M // 4359
D=M // 4360
@SP // 4361
AM=M+1 // 4362
A=A-1 // 4363
M=D // 4364
@LCL // 4365
A=M // 4366
D=M // 4367
@SP // 4368
AM=M-1 // 4369
A=D+M // 4370
D=M // 4371
@SP // 4372
AM=M-1 // 4373
A=M // 4374
M=D // 4375

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

@LCL // 4376
A=M // 4377
D=M // 4378
D=D+1 // 4379
@LCL // 4380
A=M // 4381
M=D // 4382

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 4383
0;JMP // 4384

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 4385
AM=M+1 // 4386
A=A-1 // 4387
M=0 // 4388

////ReturnInstruction{}
@RETURN // 4389
0;JMP // 4390

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
@Memory.remove_node.EQ.17 // 4391
D=A // 4392
@SP // 4393
AM=M+1 // 4394
A=A-1 // 4395
M=D // 4396
@Memory.remove_node.EQ.18 // 4397
D=A // 4398
@SP // 4399
AM=M+1 // 4400
A=A-1 // 4401
M=D // 4402
@ARG // 4403
A=M+1 // 4404
D=M // 4405
@2 // 4406
A=D+A // 4407
D=M // 4408
@DO_EQ // 4409
0;JMP // 4410
(Memory.remove_node.EQ.18)
D=!D // 4411
@DO_EQ // 4412
0;JMP // 4413
(Memory.remove_node.EQ.17)
@Memory.remove_node.IfElse1 // 4414
D;JNE // 4415

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
@ARG // 4416
A=M+1 // 4417
D=M // 4418
@2 // 4419
D=D+A // 4420
@3 // 4421
D=D+A // 4422
@SP // 4423
AM=M+1 // 4424
A=A-1 // 4425
M=D // 4426
@ARG // 4427
A=M+1 // 4428
D=M // 4429
@3 // 4430
A=D+A // 4431
D=M // 4432
@SP // 4433
AM=M-1 // 4434
A=M // 4435
M=D // 4436

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 4437
0;JMP // 4438

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
@ARG // 4439
A=M // 4440
D=M // 4441
@SP // 4442
AM=M+1 // 4443
A=A-1 // 4444
M=D // 4445
@ARG // 4446
A=M+1 // 4447
D=M // 4448
@3 // 4449
A=D+A // 4450
D=M // 4451
@SP // 4452
AM=M-1 // 4453
A=M // 4454
M=D // 4455

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
@Memory.remove_node.EQ.19 // 4456
D=A // 4457
@SP // 4458
AM=M+1 // 4459
A=A-1 // 4460
M=D // 4461
@Memory.remove_node.EQ.20 // 4462
D=A // 4463
@SP // 4464
AM=M+1 // 4465
A=A-1 // 4466
M=D // 4467
@ARG // 4468
A=M+1 // 4469
D=M // 4470
@3 // 4471
A=D+A // 4472
D=M // 4473
@DO_EQ // 4474
0;JMP // 4475
(Memory.remove_node.EQ.20)
D=!D // 4476
@DO_EQ // 4477
0;JMP // 4478
(Memory.remove_node.EQ.19)
@Memory.remove_node.IfElse2 // 4479
D;JNE // 4480

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
@ARG // 4481
A=M+1 // 4482
D=M // 4483
@3 // 4484
D=D+A // 4485
@2 // 4486
D=D+A // 4487
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=D // 4491
@ARG // 4492
A=M+1 // 4493
D=M // 4494
@2 // 4495
A=D+A // 4496
D=M // 4497
@SP // 4498
AM=M-1 // 4499
A=M // 4500
M=D // 4501

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 4502
0;JMP // 4503

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
@ARG // 4504
A=M+1 // 4505
D=M // 4506
@2 // 4507
D=D+A // 4508
@SP // 4509
AM=M+1 // 4510
A=A-1 // 4511
M=D // 4512
D=0 // 4513
@SP // 4514
AM=M-1 // 4515
A=M // 4516
M=D // 4517

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4518
A=M+1 // 4519
D=M // 4520
@3 // 4521
D=D+A // 4522
@SP // 4523
AM=M+1 // 4524
A=A-1 // 4525
M=D // 4526
D=0 // 4527
@SP // 4528
AM=M-1 // 4529
A=M // 4530
M=D // 4531

////PushInstruction("constant 0")
@SP // 4532
AM=M+1 // 4533
A=A-1 // 4534
M=0 // 4535

////ReturnInstruction{}
@RETURN // 4536
0;JMP // 4537

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 4538
AM=M+1 // 4539
A=A-1 // 4540
M=0 // 4541

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4542
A=M // 4543
M=0 // 4544

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
@Memory.getBinIndex.EQ.21 // 4545
D=A // 4546
@SP // 4547
AM=M+1 // 4548
A=A-1 // 4549
M=D // 4550
@Memory.getBinIndex.LT.22 // 4551
D=A // 4552
@SP // 4553
AM=M+1 // 4554
A=A-1 // 4555
M=D // 4556
@LCL // 4557
A=M // 4558
D=M // 4559
@7 // 4560
D=D-A // 4561
@DO_LT // 4562
0;JMP // 4563
(Memory.getBinIndex.LT.22)
@SP // 4564
AM=M+1 // 4565
A=A-1 // 4566
M=D // 4567
@Memory.getBinIndex.EQ.23 // 4568
D=A // 4569
@SP // 4570
AM=M+1 // 4571
A=A-1 // 4572
M=D // 4573
@LCL // 4574
A=M // 4575
D=M // 4576
@2048 // 4577
A=D+A // 4578
D=M // 4579
@DO_EQ // 4580
0;JMP // 4581
(Memory.getBinIndex.EQ.23)
D=!D // 4582
@SP // 4583
AM=M-1 // 4584
D=D&M // 4585
@DO_EQ // 4586
0;JMP // 4587
(Memory.getBinIndex.EQ.21)
@WHILE_END_Memory.getBinIndex1 // 4588
D;JNE // 4589

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
@Memory.getBinIndex.EQ.24 // 4590
D=A // 4591
@SP // 4592
AM=M+1 // 4593
A=A-1 // 4594
M=D // 4595
@Memory.getBinIndex.GT.25 // 4596
D=A // 4597
@SP // 4598
AM=M+1 // 4599
A=A-1 // 4600
M=D // 4601
@ARG // 4602
A=M // 4603
D=M // 4604
@SP // 4605
AM=M+1 // 4606
A=A-1 // 4607
M=D // 4608
@LCL // 4609
A=M // 4610
D=M // 4611
@SP // 4612
AM=M+1 // 4613
A=A-1 // 4614
M=D+1 // 4615
@16 // 4616
D=A // 4617
@SP // 4618
AM=M+1 // 4619
A=A-1 // 4620
M=D // 4621
// call Math.multiply
@7 // 4622
D=A // 4623
@14 // 4624
M=D // 4625
@Math.multiply // 4626
D=A // 4627
@13 // 4628
M=D // 4629
@Memory.getBinIndex.ret.0 // 4630
D=A // 4631
@CALL // 4632
0;JMP // 4633
(Memory.getBinIndex.ret.0)
@SP // 4634
AM=M-1 // 4635
D=M // 4636
@SP // 4637
AM=M-1 // 4638
D=M-D // 4639
@DO_GT // 4640
0;JMP // 4641
(Memory.getBinIndex.GT.25)
D=!D // 4642
@DO_EQ // 4643
0;JMP // 4644
(Memory.getBinIndex.EQ.24)
@Memory.getBinIndex.IfElse1 // 4645
D;JNE // 4646

////PushInstruction("local 0")
@LCL // 4647
A=M // 4648
D=M // 4649
@SP // 4650
AM=M+1 // 4651
A=A-1 // 4652
M=D // 4653

////ReturnInstruction{}
@RETURN // 4654
0;JMP // 4655

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 4656
0;JMP // 4657

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

@LCL // 4658
A=M // 4659
D=M // 4660
D=D+1 // 4661
@LCL // 4662
A=M // 4663
M=D // 4664

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 4665
0;JMP // 4666

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
@6 // 4667
D=A // 4668
@SP // 4669
AM=M+1 // 4670
A=A-1 // 4671
M=D // 4672
@7 // 4673
D=A // 4674
@SP // 4675
AM=M+1 // 4676
A=A-1 // 4677
M=D-1 // 4678

////ReturnInstruction{}
@RETURN // 4679
0;JMP // 4680

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 4681
AM=M+1 // 4682
A=A-1 // 4683
M=0 // 4684

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

@ARG // 4685
A=M // 4686
D=M // 4687
@0 // 4688
A=D+A // 4689
D=M // 4690
@LCL // 4691
A=M // 4692
M=D // 4693

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
@Memory.get_best_fit.EQ.26 // 4694
D=A // 4695
@SP // 4696
AM=M+1 // 4697
A=A-1 // 4698
M=D // 4699
@Memory.get_best_fit.LT.27 // 4700
D=A // 4701
@SP // 4702
AM=M+1 // 4703
A=A-1 // 4704
M=D // 4705
@LCL // 4706
A=M // 4707
D=M // 4708
@0 // 4709
A=D+A // 4710
D=M // 4711
@SP // 4712
AM=M+1 // 4713
A=A-1 // 4714
M=D // 4715
@ARG // 4716
A=M+1 // 4717
D=M // 4718
@SP // 4719
AM=M-1 // 4720
D=M-D // 4721
@DO_LT // 4722
0;JMP // 4723
(Memory.get_best_fit.LT.27)
D=!D // 4724
@DO_EQ // 4725
0;JMP // 4726
(Memory.get_best_fit.EQ.26)
@Memory.get_best_fit.IfElse1 // 4727
D;JNE // 4728

////PushInstruction("local 0")
@LCL // 4729
A=M // 4730
D=M // 4731
@SP // 4732
AM=M+1 // 4733
A=A-1 // 4734
M=D // 4735

////ReturnInstruction{}
@RETURN // 4736
0;JMP // 4737

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 4738
0;JMP // 4739

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
@Memory.get_best_fit.EQ.28 // 4740
D=A // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=D // 4745
@Memory.get_best_fit.EQ.29 // 4746
D=A // 4747
@SP // 4748
AM=M+1 // 4749
A=A-1 // 4750
M=D // 4751
@LCL // 4752
A=M // 4753
D=M // 4754
@3 // 4755
A=D+A // 4756
D=M // 4757
@DO_EQ // 4758
0;JMP // 4759
(Memory.get_best_fit.EQ.29)
D=!D // 4760
@DO_EQ // 4761
0;JMP // 4762
(Memory.get_best_fit.EQ.28)
@WHILE_END_Memory.get_best_fit1 // 4763
D;JNE // 4764

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

@LCL // 4765
A=M // 4766
D=M // 4767
@3 // 4768
A=D+A // 4769
D=M // 4770
@LCL // 4771
A=M // 4772
M=D // 4773

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
@Memory.get_best_fit.EQ.30 // 4774
D=A // 4775
@SP // 4776
AM=M+1 // 4777
A=A-1 // 4778
M=D // 4779
@Memory.get_best_fit.LT.31 // 4780
D=A // 4781
@SP // 4782
AM=M+1 // 4783
A=A-1 // 4784
M=D // 4785
@LCL // 4786
A=M // 4787
D=M // 4788
@0 // 4789
A=D+A // 4790
D=M // 4791
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=D // 4795
@ARG // 4796
A=M+1 // 4797
D=M // 4798
@SP // 4799
AM=M-1 // 4800
D=M-D // 4801
@DO_LT // 4802
0;JMP // 4803
(Memory.get_best_fit.LT.31)
D=!D // 4804
@DO_EQ // 4805
0;JMP // 4806
(Memory.get_best_fit.EQ.30)
@Memory.get_best_fit.IfElse2 // 4807
D;JNE // 4808

////PushInstruction("local 0")
@LCL // 4809
A=M // 4810
D=M // 4811
@SP // 4812
AM=M+1 // 4813
A=A-1 // 4814
M=D // 4815

////ReturnInstruction{}
@RETURN // 4816
0;JMP // 4817

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 4818
0;JMP // 4819

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 4820
0;JMP // 4821

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 4822
AM=M+1 // 4823
A=A-1 // 4824
M=0 // 4825

////ReturnInstruction{}
@RETURN // 4826
0;JMP // 4827

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
@ARG // 4828
A=M // 4829
D=M // 4830
@SP // 4831
AM=M+1 // 4832
A=A-1 // 4833
M=D // 4834
@ARG // 4835
A=M // 4836
D=M // 4837
@0 // 4838
A=D+A // 4839
D=M // 4840
@4 // 4841
D=D+A // 4842
@SP // 4843
AM=M-1 // 4844
D=D+M // 4845
@SP // 4846
AM=M+1 // 4847
A=A-1 // 4848
M=D // 4849
@ARG // 4850
A=M // 4851
D=M // 4852
@SP // 4853
AM=M-1 // 4854
A=M // 4855
M=D // 4856

////PushInstruction("constant 0")
@SP // 4857
AM=M+1 // 4858
A=A-1 // 4859
M=0 // 4860

////ReturnInstruction{}
@RETURN // 4861
0;JMP // 4862

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 4863
AM=M+1 // 4864
A=A-1 // 4865
M=0 // 4866
@SP // 4867
AM=M+1 // 4868
A=A-1 // 4869
M=0 // 4870

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4871
A=M+1 // 4872
D=M // 4873
@2 // 4874
D=D+A // 4875
@SP // 4876
AM=M+1 // 4877
A=A-1 // 4878
M=D // 4879
D=0 // 4880
@SP // 4881
AM=M-1 // 4882
A=M // 4883
M=D // 4884

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4885
A=M+1 // 4886
D=M // 4887
@3 // 4888
D=D+A // 4889
@SP // 4890
AM=M+1 // 4891
A=A-1 // 4892
M=D // 4893
D=0 // 4894
@SP // 4895
AM=M-1 // 4896
A=M // 4897
M=D // 4898

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
@Memory.add_node.EQ.32 // 4899
D=A // 4900
@SP // 4901
AM=M+1 // 4902
A=A-1 // 4903
M=D // 4904
@ARG // 4905
A=M // 4906
D=M // 4907
@0 // 4908
A=D+A // 4909
D=M // 4910
@DO_EQ // 4911
0;JMP // 4912
(Memory.add_node.EQ.32)
D=!D // 4913
@Memory.add_node.IfElse1 // 4914
D;JNE // 4915

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4916
A=M // 4917
D=M // 4918
@SP // 4919
AM=M+1 // 4920
A=A-1 // 4921
M=D // 4922
@ARG // 4923
A=M+1 // 4924
D=M // 4925
@SP // 4926
AM=M-1 // 4927
A=M // 4928
M=D // 4929

////PushInstruction("constant 0")
@SP // 4930
AM=M+1 // 4931
A=A-1 // 4932
M=0 // 4933

////ReturnInstruction{}
@RETURN // 4934
0;JMP // 4935

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 4936
0;JMP // 4937

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

@ARG // 4938
A=M // 4939
D=M // 4940
@0 // 4941
A=D+A // 4942
D=M // 4943
@LCL // 4944
A=M // 4945
M=D // 4946

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4947
A=M+1 // 4948
M=0 // 4949

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
@Memory.add_node.EQ.33 // 4950
D=A // 4951
@SP // 4952
AM=M+1 // 4953
A=A-1 // 4954
M=D // 4955
@Memory.add_node.EQ.34 // 4956
D=A // 4957
@SP // 4958
AM=M+1 // 4959
A=A-1 // 4960
M=D // 4961
@LCL // 4962
A=M // 4963
D=M // 4964
@DO_EQ // 4965
0;JMP // 4966
(Memory.add_node.EQ.34)
@SP // 4967
AM=M+1 // 4968
A=A-1 // 4969
M=D // 4970
@SP // 4971
A=M-1 // 4972
M=!D // 4973
@Memory.add_node.GT.35 // 4974
D=A // 4975
@SP // 4976
AM=M+1 // 4977
A=A-1 // 4978
M=D // 4979
@LCL // 4980
A=M // 4981
D=M // 4982
@0 // 4983
A=D+A // 4984
D=M // 4985
@SP // 4986
AM=M+1 // 4987
A=A-1 // 4988
M=D // 4989
@ARG // 4990
A=M+1 // 4991
D=M // 4992
@0 // 4993
A=D+A // 4994
D=M // 4995
@SP // 4996
AM=M-1 // 4997
D=M-D // 4998
@DO_GT // 4999
0;JMP // 5000
(Memory.add_node.GT.35)
D=!D // 5001
@SP // 5002
AM=M-1 // 5003
D=D&M // 5004
@DO_EQ // 5005
0;JMP // 5006
(Memory.add_node.EQ.33)
@WHILE_END_Memory.add_node1 // 5007
D;JNE // 5008

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 5009
A=M // 5010
D=M // 5011
@LCL // 5012
A=M+1 // 5013
M=D // 5014

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

@LCL // 5015
A=M // 5016
D=M // 5017
@3 // 5018
A=D+A // 5019
D=M // 5020
@LCL // 5021
A=M // 5022
M=D // 5023

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 5024
0;JMP // 5025

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
@Memory.add_node.EQ.36 // 5026
D=A // 5027
@SP // 5028
AM=M+1 // 5029
A=A-1 // 5030
M=D // 5031
@LCL // 5032
A=M+1 // 5033
D=!M // 5034
@DO_EQ // 5035
0;JMP // 5036
(Memory.add_node.EQ.36)
@Memory.add_node.IfElse2 // 5037
D;JNE // 5038

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
@ARG // 5039
A=M+1 // 5040
D=M // 5041
@3 // 5042
D=D+A // 5043
@SP // 5044
AM=M+1 // 5045
A=A-1 // 5046
M=D // 5047
@ARG // 5048
A=M // 5049
D=M // 5050
@0 // 5051
A=D+A // 5052
D=M // 5053
@SP // 5054
AM=M-1 // 5055
A=M // 5056
M=D // 5057

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
@ARG // 5058
A=M // 5059
D=M // 5060
@0 // 5061
D=D+A // 5062
@2 // 5063
D=D+A // 5064
@SP // 5065
AM=M+1 // 5066
A=A-1 // 5067
M=D // 5068
@ARG // 5069
A=M+1 // 5070
D=M // 5071
@SP // 5072
AM=M-1 // 5073
A=M // 5074
M=D // 5075

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 5076
A=M // 5077
D=M // 5078
@SP // 5079
AM=M+1 // 5080
A=A-1 // 5081
M=D // 5082
@ARG // 5083
A=M+1 // 5084
D=M // 5085
@SP // 5086
AM=M-1 // 5087
A=M // 5088
M=D // 5089

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 5090
0;JMP // 5091

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
@ARG // 5092
A=M+1 // 5093
D=M // 5094
@3 // 5095
D=D+A // 5096
@SP // 5097
AM=M+1 // 5098
A=A-1 // 5099
M=D // 5100
@LCL // 5101
A=M // 5102
D=M // 5103
@SP // 5104
AM=M-1 // 5105
A=M // 5106
M=D // 5107

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 5108
A=M+1 // 5109
D=M // 5110
@2 // 5111
D=D+A // 5112
@SP // 5113
AM=M+1 // 5114
A=A-1 // 5115
M=D // 5116
@LCL // 5117
A=M+1 // 5118
D=M // 5119
@SP // 5120
AM=M-1 // 5121
A=M // 5122
M=D // 5123

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.37 // 5124
D=A // 5125
@SP // 5126
AM=M+1 // 5127
A=A-1 // 5128
M=D // 5129
@LCL // 5130
A=M // 5131
D=M // 5132
@DO_EQ // 5133
0;JMP // 5134
(Memory.add_node.EQ.37)
@Memory.add_node.IfElse3 // 5135
D;JNE // 5136

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 5137
A=M // 5138
D=M // 5139
@2 // 5140
D=D+A // 5141
@SP // 5142
AM=M+1 // 5143
A=A-1 // 5144
M=D // 5145
@ARG // 5146
A=M+1 // 5147
D=M // 5148
@SP // 5149
AM=M-1 // 5150
A=M // 5151
M=D // 5152

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 5153
0;JMP // 5154

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
@LCL // 5155
A=M+1 // 5156
D=M // 5157
@3 // 5158
D=D+A // 5159
@SP // 5160
AM=M+1 // 5161
A=A-1 // 5162
M=D // 5163
@ARG // 5164
A=M+1 // 5165
D=M // 5166
@SP // 5167
AM=M-1 // 5168
A=M // 5169
M=D // 5170

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 5171
AM=M+1 // 5172
A=A-1 // 5173
M=0 // 5174

////ReturnInstruction{}
@RETURN // 5175
0;JMP // 5176

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
@ARG // 5177
A=M // 5178
D=M // 5179
@SP // 5180
AM=M+1 // 5181
A=A-1 // 5182
M=D // 5183
@ARG // 5184
A=M+1 // 5185
D=M // 5186
@SP // 5187
AM=M-1 // 5188
A=M // 5189
M=D // 5190

////PushInstruction("constant 0")
@SP // 5191
AM=M+1 // 5192
A=A-1 // 5193
M=0 // 5194

////ReturnInstruction{}
@RETURN // 5195
0;JMP // 5196

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
@ARG // 5197
A=M // 5198
D=M // 5199
@0 // 5200
A=D+A // 5201
D=M // 5202
@SP // 5203
AM=M+1 // 5204
A=A-1 // 5205
M=D // 5206

////ReturnInstruction{}
@RETURN // 5207
0;JMP // 5208

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 5209
D=A // 5210
@14 // 5211
M=D // 5212
@Output.initMap // 5213
D=A // 5214
@13 // 5215
M=D // 5216
@Output.init.ret.0 // 5217
D=A // 5218
@CALL // 5219
0;JMP // 5220
(Output.init.ret.0)
@SP // 5221
M=M-1 // 5222

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 5223
M=0 // 5224

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 5225
M=0 // 5226

////PushInstruction("constant 0")
@SP // 5227
AM=M+1 // 5228
A=A-1 // 5229
M=0 // 5230

////ReturnInstruction{}
@RETURN // 5231
0;JMP // 5232

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 5233
AM=M+1 // 5234
A=A-1 // 5235
M=0 // 5236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5237
D=A // 5238
@SP // 5239
AM=M+1 // 5240
A=A-1 // 5241
M=D // 5242
// call Array.new
@6 // 5243
D=A // 5244
@14 // 5245
M=D // 5246
@Array.new // 5247
D=A // 5248
@13 // 5249
M=D // 5250
@Output.initMap.ret.0 // 5251
D=A // 5252
@CALL // 5253
0;JMP // 5254
(Output.initMap.ret.0)
@SP // 5255
AM=M-1 // 5256
D=M // 5257
@Output.0 // 5258
M=D // 5259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 5260
AM=M+1 // 5261
A=A-1 // 5262
M=0 // 5263
@63 // 5264
D=A // 5265
@SP // 5266
AM=M+1 // 5267
A=A-1 // 5268
M=D // 5269
@63 // 5270
D=A // 5271
@SP // 5272
AM=M+1 // 5273
A=A-1 // 5274
M=D // 5275
@63 // 5276
D=A // 5277
@SP // 5278
AM=M+1 // 5279
A=A-1 // 5280
M=D // 5281
@63 // 5282
D=A // 5283
@SP // 5284
AM=M+1 // 5285
A=A-1 // 5286
M=D // 5287
@63 // 5288
D=A // 5289
@SP // 5290
AM=M+1 // 5291
A=A-1 // 5292
M=D // 5293
@63 // 5294
D=A // 5295
@SP // 5296
AM=M+1 // 5297
A=A-1 // 5298
M=D // 5299
@63 // 5300
D=A // 5301
@SP // 5302
AM=M+1 // 5303
A=A-1 // 5304
M=D // 5305
@63 // 5306
D=A // 5307
@SP // 5308
AM=M+1 // 5309
A=A-1 // 5310
M=D // 5311
@63 // 5312
D=A // 5313
@SP // 5314
AM=M+1 // 5315
A=A-1 // 5316
M=D // 5317
@SP // 5318
AM=M+1 // 5319
A=A-1 // 5320
M=0 // 5321
@SP // 5322
AM=M+1 // 5323
A=A-1 // 5324
M=0 // 5325
// call Output.create
@17 // 5326
D=A // 5327
@14 // 5328
M=D // 5329
@Output.create // 5330
D=A // 5331
@13 // 5332
M=D // 5333
@Output.initMap.ret.1 // 5334
D=A // 5335
@CALL // 5336
0;JMP // 5337
(Output.initMap.ret.1)
@SP // 5338
M=M-1 // 5339

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@32 // 5340
D=A // 5341
@SP // 5342
AM=M+1 // 5343
A=A-1 // 5344
M=D // 5345
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
@SP // 5358
AM=M+1 // 5359
A=A-1 // 5360
M=0 // 5361
@SP // 5362
AM=M+1 // 5363
A=A-1 // 5364
M=0 // 5365
@SP // 5366
AM=M+1 // 5367
A=A-1 // 5368
M=0 // 5369
@SP // 5370
AM=M+1 // 5371
A=A-1 // 5372
M=0 // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=0 // 5377
@SP // 5378
AM=M+1 // 5379
A=A-1 // 5380
M=0 // 5381
@SP // 5382
AM=M+1 // 5383
A=A-1 // 5384
M=0 // 5385
@SP // 5386
AM=M+1 // 5387
A=A-1 // 5388
M=0 // 5389
// call Output.create
@17 // 5390
D=A // 5391
@14 // 5392
M=D // 5393
@Output.create // 5394
D=A // 5395
@13 // 5396
M=D // 5397
@Output.initMap.ret.2 // 5398
D=A // 5399
@CALL // 5400
0;JMP // 5401
(Output.initMap.ret.2)
@SP // 5402
M=M-1 // 5403

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5404
D=A // 5405
@SP // 5406
AM=M+1 // 5407
A=A-1 // 5408
M=D // 5409
@12 // 5410
D=A // 5411
@SP // 5412
AM=M+1 // 5413
A=A-1 // 5414
M=D // 5415
@30 // 5416
D=A // 5417
@SP // 5418
AM=M+1 // 5419
A=A-1 // 5420
M=D // 5421
@30 // 5422
D=A // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=D // 5427
@30 // 5428
D=A // 5429
@SP // 5430
AM=M+1 // 5431
A=A-1 // 5432
M=D // 5433
@12 // 5434
D=A // 5435
@SP // 5436
AM=M+1 // 5437
A=A-1 // 5438
M=D // 5439
@12 // 5440
D=A // 5441
@SP // 5442
AM=M+1 // 5443
A=A-1 // 5444
M=D // 5445
@SP // 5446
AM=M+1 // 5447
A=A-1 // 5448
M=0 // 5449
@12 // 5450
D=A // 5451
@SP // 5452
AM=M+1 // 5453
A=A-1 // 5454
M=D // 5455
@12 // 5456
D=A // 5457
@SP // 5458
AM=M+1 // 5459
A=A-1 // 5460
M=D // 5461
@SP // 5462
AM=M+1 // 5463
A=A-1 // 5464
M=0 // 5465
@SP // 5466
AM=M+1 // 5467
A=A-1 // 5468
M=0 // 5469
// call Output.create
@17 // 5470
D=A // 5471
@14 // 5472
M=D // 5473
@Output.create // 5474
D=A // 5475
@13 // 5476
M=D // 5477
@Output.initMap.ret.3 // 5478
D=A // 5479
@CALL // 5480
0;JMP // 5481
(Output.initMap.ret.3)
@SP // 5482
M=M-1 // 5483

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5484
D=A // 5485
@SP // 5486
AM=M+1 // 5487
A=A-1 // 5488
M=D // 5489
@54 // 5490
D=A // 5491
@SP // 5492
AM=M+1 // 5493
A=A-1 // 5494
M=D // 5495
@54 // 5496
D=A // 5497
@SP // 5498
AM=M+1 // 5499
A=A-1 // 5500
M=D // 5501
@20 // 5502
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
@SP // 5516
AM=M+1 // 5517
A=A-1 // 5518
M=0 // 5519
@SP // 5520
AM=M+1 // 5521
A=A-1 // 5522
M=0 // 5523
@SP // 5524
AM=M+1 // 5525
A=A-1 // 5526
M=0 // 5527
@SP // 5528
AM=M+1 // 5529
A=A-1 // 5530
M=0 // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=0 // 5535
@SP // 5536
AM=M+1 // 5537
A=A-1 // 5538
M=0 // 5539
// call Output.create
@17 // 5540
D=A // 5541
@14 // 5542
M=D // 5543
@Output.create // 5544
D=A // 5545
@13 // 5546
M=D // 5547
@Output.initMap.ret.4 // 5548
D=A // 5549
@CALL // 5550
0;JMP // 5551
(Output.initMap.ret.4)
@SP // 5552
M=M-1 // 5553

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@35 // 5554
D=A // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=D // 5559
@SP // 5560
AM=M+1 // 5561
A=A-1 // 5562
M=0 // 5563
@18 // 5564
D=A // 5565
@SP // 5566
AM=M+1 // 5567
A=A-1 // 5568
M=D // 5569
@18 // 5570
D=A // 5571
@SP // 5572
AM=M+1 // 5573
A=A-1 // 5574
M=D // 5575
@63 // 5576
D=A // 5577
@SP // 5578
AM=M+1 // 5579
A=A-1 // 5580
M=D // 5581
@18 // 5582
D=A // 5583
@SP // 5584
AM=M+1 // 5585
A=A-1 // 5586
M=D // 5587
@18 // 5588
D=A // 5589
@SP // 5590
AM=M+1 // 5591
A=A-1 // 5592
M=D // 5593
@63 // 5594
D=A // 5595
@SP // 5596
AM=M+1 // 5597
A=A-1 // 5598
M=D // 5599
@18 // 5600
D=A // 5601
@SP // 5602
AM=M+1 // 5603
A=A-1 // 5604
M=D // 5605
@18 // 5606
D=A // 5607
@SP // 5608
AM=M+1 // 5609
A=A-1 // 5610
M=D // 5611
@SP // 5612
AM=M+1 // 5613
A=A-1 // 5614
M=0 // 5615
@SP // 5616
AM=M+1 // 5617
A=A-1 // 5618
M=0 // 5619
// call Output.create
@17 // 5620
D=A // 5621
@14 // 5622
M=D // 5623
@Output.create // 5624
D=A // 5625
@13 // 5626
M=D // 5627
@Output.initMap.ret.5 // 5628
D=A // 5629
@CALL // 5630
0;JMP // 5631
(Output.initMap.ret.5)
@SP // 5632
M=M-1 // 5633

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 5634
D=A // 5635
@SP // 5636
AM=M+1 // 5637
A=A-1 // 5638
M=D // 5639
@12 // 5640
D=A // 5641
@SP // 5642
AM=M+1 // 5643
A=A-1 // 5644
M=D // 5645
@30 // 5646
D=A // 5647
@SP // 5648
AM=M+1 // 5649
A=A-1 // 5650
M=D // 5651
@51 // 5652
D=A // 5653
@SP // 5654
AM=M+1 // 5655
A=A-1 // 5656
M=D // 5657
@3 // 5658
D=A // 5659
@SP // 5660
AM=M+1 // 5661
A=A-1 // 5662
M=D // 5663
@30 // 5664
D=A // 5665
@SP // 5666
AM=M+1 // 5667
A=A-1 // 5668
M=D // 5669
@48 // 5670
D=A // 5671
@SP // 5672
AM=M+1 // 5673
A=A-1 // 5674
M=D // 5675
@51 // 5676
D=A // 5677
@SP // 5678
AM=M+1 // 5679
A=A-1 // 5680
M=D // 5681
@30 // 5682
D=A // 5683
@SP // 5684
AM=M+1 // 5685
A=A-1 // 5686
M=D // 5687
@12 // 5688
D=A // 5689
@SP // 5690
AM=M+1 // 5691
A=A-1 // 5692
M=D // 5693
@12 // 5694
D=A // 5695
@SP // 5696
AM=M+1 // 5697
A=A-1 // 5698
M=D // 5699
@SP // 5700
AM=M+1 // 5701
A=A-1 // 5702
M=0 // 5703
// call Output.create
@17 // 5704
D=A // 5705
@14 // 5706
M=D // 5707
@Output.create // 5708
D=A // 5709
@13 // 5710
M=D // 5711
@Output.initMap.ret.6 // 5712
D=A // 5713
@CALL // 5714
0;JMP // 5715
(Output.initMap.ret.6)
@SP // 5716
M=M-1 // 5717

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@37 // 5718
D=A // 5719
@SP // 5720
AM=M+1 // 5721
A=A-1 // 5722
M=D // 5723
@SP // 5724
AM=M+1 // 5725
A=A-1 // 5726
M=0 // 5727
@SP // 5728
AM=M+1 // 5729
A=A-1 // 5730
M=0 // 5731
@35 // 5732
D=A // 5733
@SP // 5734
AM=M+1 // 5735
A=A-1 // 5736
M=D // 5737
@51 // 5738
D=A // 5739
@SP // 5740
AM=M+1 // 5741
A=A-1 // 5742
M=D // 5743
@24 // 5744
D=A // 5745
@SP // 5746
AM=M+1 // 5747
A=A-1 // 5748
M=D // 5749
@12 // 5750
D=A // 5751
@SP // 5752
AM=M+1 // 5753
A=A-1 // 5754
M=D // 5755
@6 // 5756
D=A // 5757
@SP // 5758
AM=M+1 // 5759
A=A-1 // 5760
M=D // 5761
@51 // 5762
D=A // 5763
@SP // 5764
AM=M+1 // 5765
A=A-1 // 5766
M=D // 5767
@49 // 5768
D=A // 5769
@SP // 5770
AM=M+1 // 5771
A=A-1 // 5772
M=D // 5773
@SP // 5774
AM=M+1 // 5775
A=A-1 // 5776
M=0 // 5777
@SP // 5778
AM=M+1 // 5779
A=A-1 // 5780
M=0 // 5781
// call Output.create
@17 // 5782
D=A // 5783
@14 // 5784
M=D // 5785
@Output.create // 5786
D=A // 5787
@13 // 5788
M=D // 5789
@Output.initMap.ret.7 // 5790
D=A // 5791
@CALL // 5792
0;JMP // 5793
(Output.initMap.ret.7)
@SP // 5794
M=M-1 // 5795

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 5796
D=A // 5797
@SP // 5798
AM=M+1 // 5799
A=A-1 // 5800
M=D // 5801
@12 // 5802
D=A // 5803
@SP // 5804
AM=M+1 // 5805
A=A-1 // 5806
M=D // 5807
@30 // 5808
D=A // 5809
@SP // 5810
AM=M+1 // 5811
A=A-1 // 5812
M=D // 5813
@30 // 5814
D=A // 5815
@SP // 5816
AM=M+1 // 5817
A=A-1 // 5818
M=D // 5819
@12 // 5820
D=A // 5821
@SP // 5822
AM=M+1 // 5823
A=A-1 // 5824
M=D // 5825
@54 // 5826
D=A // 5827
@SP // 5828
AM=M+1 // 5829
A=A-1 // 5830
M=D // 5831
@27 // 5832
D=A // 5833
@SP // 5834
AM=M+1 // 5835
A=A-1 // 5836
M=D // 5837
@27 // 5838
D=A // 5839
@SP // 5840
AM=M+1 // 5841
A=A-1 // 5842
M=D // 5843
@27 // 5844
D=A // 5845
@SP // 5846
AM=M+1 // 5847
A=A-1 // 5848
M=D // 5849
@54 // 5850
D=A // 5851
@SP // 5852
AM=M+1 // 5853
A=A-1 // 5854
M=D // 5855
@SP // 5856
AM=M+1 // 5857
A=A-1 // 5858
M=0 // 5859
@SP // 5860
AM=M+1 // 5861
A=A-1 // 5862
M=0 // 5863
// call Output.create
@17 // 5864
D=A // 5865
@14 // 5866
M=D // 5867
@Output.create // 5868
D=A // 5869
@13 // 5870
M=D // 5871
@Output.initMap.ret.8 // 5872
D=A // 5873
@CALL // 5874
0;JMP // 5875
(Output.initMap.ret.8)
@SP // 5876
M=M-1 // 5877

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 5878
D=A // 5879
@SP // 5880
AM=M+1 // 5881
A=A-1 // 5882
M=D // 5883
@12 // 5884
D=A // 5885
@SP // 5886
AM=M+1 // 5887
A=A-1 // 5888
M=D // 5889
@12 // 5890
D=A // 5891
@SP // 5892
AM=M+1 // 5893
A=A-1 // 5894
M=D // 5895
@6 // 5896
D=A // 5897
@SP // 5898
AM=M+1 // 5899
A=A-1 // 5900
M=D // 5901
@SP // 5902
AM=M+1 // 5903
A=A-1 // 5904
M=0 // 5905
@SP // 5906
AM=M+1 // 5907
A=A-1 // 5908
M=0 // 5909
@SP // 5910
AM=M+1 // 5911
A=A-1 // 5912
M=0 // 5913
@SP // 5914
AM=M+1 // 5915
A=A-1 // 5916
M=0 // 5917
@SP // 5918
AM=M+1 // 5919
A=A-1 // 5920
M=0 // 5921
@SP // 5922
AM=M+1 // 5923
A=A-1 // 5924
M=0 // 5925
@SP // 5926
AM=M+1 // 5927
A=A-1 // 5928
M=0 // 5929
@SP // 5930
AM=M+1 // 5931
A=A-1 // 5932
M=0 // 5933
// call Output.create
@17 // 5934
D=A // 5935
@14 // 5936
M=D // 5937
@Output.create // 5938
D=A // 5939
@13 // 5940
M=D // 5941
@Output.initMap.ret.9 // 5942
D=A // 5943
@CALL // 5944
0;JMP // 5945
(Output.initMap.ret.9)
@SP // 5946
M=M-1 // 5947

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5948
D=A // 5949
@SP // 5950
AM=M+1 // 5951
A=A-1 // 5952
M=D // 5953
@24 // 5954
D=A // 5955
@SP // 5956
AM=M+1 // 5957
A=A-1 // 5958
M=D // 5959
@12 // 5960
D=A // 5961
@SP // 5962
AM=M+1 // 5963
A=A-1 // 5964
M=D // 5965
@6 // 5966
D=A // 5967
@SP // 5968
AM=M+1 // 5969
A=A-1 // 5970
M=D // 5971
@6 // 5972
D=A // 5973
@SP // 5974
AM=M+1 // 5975
A=A-1 // 5976
M=D // 5977
@6 // 5978
D=A // 5979
@SP // 5980
AM=M+1 // 5981
A=A-1 // 5982
M=D // 5983
@6 // 5984
D=A // 5985
@SP // 5986
AM=M+1 // 5987
A=A-1 // 5988
M=D // 5989
@6 // 5990
D=A // 5991
@SP // 5992
AM=M+1 // 5993
A=A-1 // 5994
M=D // 5995
@12 // 5996
D=A // 5997
@SP // 5998
AM=M+1 // 5999
A=A-1 // 6000
M=D // 6001
@24 // 6002
D=A // 6003
@SP // 6004
AM=M+1 // 6005
A=A-1 // 6006
M=D // 6007
@SP // 6008
AM=M+1 // 6009
A=A-1 // 6010
M=0 // 6011
@SP // 6012
AM=M+1 // 6013
A=A-1 // 6014
M=0 // 6015
// call Output.create
@17 // 6016
D=A // 6017
@14 // 6018
M=D // 6019
@Output.create // 6020
D=A // 6021
@13 // 6022
M=D // 6023
@Output.initMap.ret.10 // 6024
D=A // 6025
@CALL // 6026
0;JMP // 6027
(Output.initMap.ret.10)
@SP // 6028
M=M-1 // 6029

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6030
D=A // 6031
@SP // 6032
AM=M+1 // 6033
A=A-1 // 6034
M=D // 6035
@6 // 6036
D=A // 6037
@SP // 6038
AM=M+1 // 6039
A=A-1 // 6040
M=D // 6041
@12 // 6042
D=A // 6043
@SP // 6044
AM=M+1 // 6045
A=A-1 // 6046
M=D // 6047
@24 // 6048
D=A // 6049
@SP // 6050
AM=M+1 // 6051
A=A-1 // 6052
M=D // 6053
@24 // 6054
D=A // 6055
@SP // 6056
AM=M+1 // 6057
A=A-1 // 6058
M=D // 6059
@24 // 6060
D=A // 6061
@SP // 6062
AM=M+1 // 6063
A=A-1 // 6064
M=D // 6065
@24 // 6066
D=A // 6067
@SP // 6068
AM=M+1 // 6069
A=A-1 // 6070
M=D // 6071
@24 // 6072
D=A // 6073
@SP // 6074
AM=M+1 // 6075
A=A-1 // 6076
M=D // 6077
@12 // 6078
D=A // 6079
@SP // 6080
AM=M+1 // 6081
A=A-1 // 6082
M=D // 6083
@6 // 6084
D=A // 6085
@SP // 6086
AM=M+1 // 6087
A=A-1 // 6088
M=D // 6089
@SP // 6090
AM=M+1 // 6091
A=A-1 // 6092
M=0 // 6093
@SP // 6094
AM=M+1 // 6095
A=A-1 // 6096
M=0 // 6097
// call Output.create
@17 // 6098
D=A // 6099
@14 // 6100
M=D // 6101
@Output.create // 6102
D=A // 6103
@13 // 6104
M=D // 6105
@Output.initMap.ret.11 // 6106
D=A // 6107
@CALL // 6108
0;JMP // 6109
(Output.initMap.ret.11)
@SP // 6110
M=M-1 // 6111

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@42 // 6112
D=A // 6113
@SP // 6114
AM=M+1 // 6115
A=A-1 // 6116
M=D // 6117
@SP // 6118
AM=M+1 // 6119
A=A-1 // 6120
M=0 // 6121
@SP // 6122
AM=M+1 // 6123
A=A-1 // 6124
M=0 // 6125
@SP // 6126
AM=M+1 // 6127
A=A-1 // 6128
M=0 // 6129
@51 // 6130
D=A // 6131
@SP // 6132
AM=M+1 // 6133
A=A-1 // 6134
M=D // 6135
@30 // 6136
D=A // 6137
@SP // 6138
AM=M+1 // 6139
A=A-1 // 6140
M=D // 6141
@63 // 6142
D=A // 6143
@SP // 6144
AM=M+1 // 6145
A=A-1 // 6146
M=D // 6147
@30 // 6148
D=A // 6149
@SP // 6150
AM=M+1 // 6151
A=A-1 // 6152
M=D // 6153
@51 // 6154
D=A // 6155
@SP // 6156
AM=M+1 // 6157
A=A-1 // 6158
M=D // 6159
@SP // 6160
AM=M+1 // 6161
A=A-1 // 6162
M=0 // 6163
@SP // 6164
AM=M+1 // 6165
A=A-1 // 6166
M=0 // 6167
@SP // 6168
AM=M+1 // 6169
A=A-1 // 6170
M=0 // 6171
// call Output.create
@17 // 6172
D=A // 6173
@14 // 6174
M=D // 6175
@Output.create // 6176
D=A // 6177
@13 // 6178
M=D // 6179
@Output.initMap.ret.12 // 6180
D=A // 6181
@CALL // 6182
0;JMP // 6183
(Output.initMap.ret.12)
@SP // 6184
M=M-1 // 6185

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@43 // 6186
D=A // 6187
@SP // 6188
AM=M+1 // 6189
A=A-1 // 6190
M=D // 6191
@SP // 6192
AM=M+1 // 6193
A=A-1 // 6194
M=0 // 6195
@SP // 6196
AM=M+1 // 6197
A=A-1 // 6198
M=0 // 6199
@SP // 6200
AM=M+1 // 6201
A=A-1 // 6202
M=0 // 6203
@12 // 6204
D=A // 6205
@SP // 6206
AM=M+1 // 6207
A=A-1 // 6208
M=D // 6209
@12 // 6210
D=A // 6211
@SP // 6212
AM=M+1 // 6213
A=A-1 // 6214
M=D // 6215
@63 // 6216
D=A // 6217
@SP // 6218
AM=M+1 // 6219
A=A-1 // 6220
M=D // 6221
@12 // 6222
D=A // 6223
@SP // 6224
AM=M+1 // 6225
A=A-1 // 6226
M=D // 6227
@12 // 6228
D=A // 6229
@SP // 6230
AM=M+1 // 6231
A=A-1 // 6232
M=D // 6233
@SP // 6234
AM=M+1 // 6235
A=A-1 // 6236
M=0 // 6237
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
@Output.initMap.ret.13 // 6254
D=A // 6255
@CALL // 6256
0;JMP // 6257
(Output.initMap.ret.13)
@SP // 6258
M=M-1 // 6259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@44 // 6260
D=A // 6261
@SP // 6262
AM=M+1 // 6263
A=A-1 // 6264
M=D // 6265
@SP // 6266
AM=M+1 // 6267
A=A-1 // 6268
M=0 // 6269
@SP // 6270
AM=M+1 // 6271
A=A-1 // 6272
M=0 // 6273
@SP // 6274
AM=M+1 // 6275
A=A-1 // 6276
M=0 // 6277
@SP // 6278
AM=M+1 // 6279
A=A-1 // 6280
M=0 // 6281
@SP // 6282
AM=M+1 // 6283
A=A-1 // 6284
M=0 // 6285
@SP // 6286
AM=M+1 // 6287
A=A-1 // 6288
M=0 // 6289
@SP // 6290
AM=M+1 // 6291
A=A-1 // 6292
M=0 // 6293
@12 // 6294
D=A // 6295
@SP // 6296
AM=M+1 // 6297
A=A-1 // 6298
M=D // 6299
@12 // 6300
D=A // 6301
@SP // 6302
AM=M+1 // 6303
A=A-1 // 6304
M=D // 6305
@6 // 6306
D=A // 6307
@SP // 6308
AM=M+1 // 6309
A=A-1 // 6310
M=D // 6311
@SP // 6312
AM=M+1 // 6313
A=A-1 // 6314
M=0 // 6315
// call Output.create
@17 // 6316
D=A // 6317
@14 // 6318
M=D // 6319
@Output.create // 6320
D=A // 6321
@13 // 6322
M=D // 6323
@Output.initMap.ret.14 // 6324
D=A // 6325
@CALL // 6326
0;JMP // 6327
(Output.initMap.ret.14)
@SP // 6328
M=M-1 // 6329

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@45 // 6330
D=A // 6331
@SP // 6332
AM=M+1 // 6333
A=A-1 // 6334
M=D // 6335
@SP // 6336
AM=M+1 // 6337
A=A-1 // 6338
M=0 // 6339
@SP // 6340
AM=M+1 // 6341
A=A-1 // 6342
M=0 // 6343
@SP // 6344
AM=M+1 // 6345
A=A-1 // 6346
M=0 // 6347
@SP // 6348
AM=M+1 // 6349
A=A-1 // 6350
M=0 // 6351
@SP // 6352
AM=M+1 // 6353
A=A-1 // 6354
M=0 // 6355
@63 // 6356
D=A // 6357
@SP // 6358
AM=M+1 // 6359
A=A-1 // 6360
M=D // 6361
@SP // 6362
AM=M+1 // 6363
A=A-1 // 6364
M=0 // 6365
@SP // 6366
AM=M+1 // 6367
A=A-1 // 6368
M=0 // 6369
@SP // 6370
AM=M+1 // 6371
A=A-1 // 6372
M=0 // 6373
@SP // 6374
AM=M+1 // 6375
A=A-1 // 6376
M=0 // 6377
@SP // 6378
AM=M+1 // 6379
A=A-1 // 6380
M=0 // 6381
// call Output.create
@17 // 6382
D=A // 6383
@14 // 6384
M=D // 6385
@Output.create // 6386
D=A // 6387
@13 // 6388
M=D // 6389
@Output.initMap.ret.15 // 6390
D=A // 6391
@CALL // 6392
0;JMP // 6393
(Output.initMap.ret.15)
@SP // 6394
M=M-1 // 6395

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@46 // 6396
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
@SP // 6410
AM=M+1 // 6411
A=A-1 // 6412
M=0 // 6413
@SP // 6414
AM=M+1 // 6415
A=A-1 // 6416
M=0 // 6417
@SP // 6418
AM=M+1 // 6419
A=A-1 // 6420
M=0 // 6421
@SP // 6422
AM=M+1 // 6423
A=A-1 // 6424
M=0 // 6425
@SP // 6426
AM=M+1 // 6427
A=A-1 // 6428
M=0 // 6429
@12 // 6430
D=A // 6431
@SP // 6432
AM=M+1 // 6433
A=A-1 // 6434
M=D // 6435
@12 // 6436
D=A // 6437
@SP // 6438
AM=M+1 // 6439
A=A-1 // 6440
M=D // 6441
@SP // 6442
AM=M+1 // 6443
A=A-1 // 6444
M=0 // 6445
@SP // 6446
AM=M+1 // 6447
A=A-1 // 6448
M=0 // 6449
// call Output.create
@17 // 6450
D=A // 6451
@14 // 6452
M=D // 6453
@Output.create // 6454
D=A // 6455
@13 // 6456
M=D // 6457
@Output.initMap.ret.16 // 6458
D=A // 6459
@CALL // 6460
0;JMP // 6461
(Output.initMap.ret.16)
@SP // 6462
M=M-1 // 6463

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@47 // 6464
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
@32 // 6478
D=A // 6479
@SP // 6480
AM=M+1 // 6481
A=A-1 // 6482
M=D // 6483
@48 // 6484
D=A // 6485
@SP // 6486
AM=M+1 // 6487
A=A-1 // 6488
M=D // 6489
@24 // 6490
D=A // 6491
@SP // 6492
AM=M+1 // 6493
A=A-1 // 6494
M=D // 6495
@12 // 6496
D=A // 6497
@SP // 6498
AM=M+1 // 6499
A=A-1 // 6500
M=D // 6501
@6 // 6502
D=A // 6503
@SP // 6504
AM=M+1 // 6505
A=A-1 // 6506
M=D // 6507
@3 // 6508
D=A // 6509
@SP // 6510
AM=M+1 // 6511
A=A-1 // 6512
M=D // 6513
@SP // 6514
AM=M+1 // 6515
A=A-1 // 6516
M=1 // 6517
@SP // 6518
AM=M+1 // 6519
A=A-1 // 6520
M=0 // 6521
@SP // 6522
AM=M+1 // 6523
A=A-1 // 6524
M=0 // 6525
// call Output.create
@17 // 6526
D=A // 6527
@14 // 6528
M=D // 6529
@Output.create // 6530
D=A // 6531
@13 // 6532
M=D // 6533
@Output.initMap.ret.17 // 6534
D=A // 6535
@CALL // 6536
0;JMP // 6537
(Output.initMap.ret.17)
@SP // 6538
M=M-1 // 6539

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6540
D=A // 6541
@SP // 6542
AM=M+1 // 6543
A=A-1 // 6544
M=D // 6545
@12 // 6546
D=A // 6547
@SP // 6548
AM=M+1 // 6549
A=A-1 // 6550
M=D // 6551
@30 // 6552
D=A // 6553
@SP // 6554
AM=M+1 // 6555
A=A-1 // 6556
M=D // 6557
@51 // 6558
D=A // 6559
@SP // 6560
AM=M+1 // 6561
A=A-1 // 6562
M=D // 6563
@51 // 6564
D=A // 6565
@SP // 6566
AM=M+1 // 6567
A=A-1 // 6568
M=D // 6569
@51 // 6570
D=A // 6571
@SP // 6572
AM=M+1 // 6573
A=A-1 // 6574
M=D // 6575
@51 // 6576
D=A // 6577
@SP // 6578
AM=M+1 // 6579
A=A-1 // 6580
M=D // 6581
@51 // 6582
D=A // 6583
@SP // 6584
AM=M+1 // 6585
A=A-1 // 6586
M=D // 6587
@30 // 6588
D=A // 6589
@SP // 6590
AM=M+1 // 6591
A=A-1 // 6592
M=D // 6593
@12 // 6594
D=A // 6595
@SP // 6596
AM=M+1 // 6597
A=A-1 // 6598
M=D // 6599
@SP // 6600
AM=M+1 // 6601
A=A-1 // 6602
M=0 // 6603
@SP // 6604
AM=M+1 // 6605
A=A-1 // 6606
M=0 // 6607
// call Output.create
@17 // 6608
D=A // 6609
@14 // 6610
M=D // 6611
@Output.create // 6612
D=A // 6613
@13 // 6614
M=D // 6615
@Output.initMap.ret.18 // 6616
D=A // 6617
@CALL // 6618
0;JMP // 6619
(Output.initMap.ret.18)
@SP // 6620
M=M-1 // 6621

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 6622
D=A // 6623
@SP // 6624
AM=M+1 // 6625
A=A-1 // 6626
M=D // 6627
@12 // 6628
D=A // 6629
@SP // 6630
AM=M+1 // 6631
A=A-1 // 6632
M=D // 6633
@14 // 6634
D=A // 6635
@SP // 6636
AM=M+1 // 6637
A=A-1 // 6638
M=D // 6639
@15 // 6640
D=A // 6641
@SP // 6642
AM=M+1 // 6643
A=A-1 // 6644
M=D // 6645
@12 // 6646
D=A // 6647
@SP // 6648
AM=M+1 // 6649
A=A-1 // 6650
M=D // 6651
@12 // 6652
D=A // 6653
@SP // 6654
AM=M+1 // 6655
A=A-1 // 6656
M=D // 6657
@12 // 6658
D=A // 6659
@SP // 6660
AM=M+1 // 6661
A=A-1 // 6662
M=D // 6663
@12 // 6664
D=A // 6665
@SP // 6666
AM=M+1 // 6667
A=A-1 // 6668
M=D // 6669
@12 // 6670
D=A // 6671
@SP // 6672
AM=M+1 // 6673
A=A-1 // 6674
M=D // 6675
@63 // 6676
D=A // 6677
@SP // 6678
AM=M+1 // 6679
A=A-1 // 6680
M=D // 6681
@SP // 6682
AM=M+1 // 6683
A=A-1 // 6684
M=0 // 6685
@SP // 6686
AM=M+1 // 6687
A=A-1 // 6688
M=0 // 6689
// call Output.create
@17 // 6690
D=A // 6691
@14 // 6692
M=D // 6693
@Output.create // 6694
D=A // 6695
@13 // 6696
M=D // 6697
@Output.initMap.ret.19 // 6698
D=A // 6699
@CALL // 6700
0;JMP // 6701
(Output.initMap.ret.19)
@SP // 6702
M=M-1 // 6703

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 6704
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
@51 // 6716
D=A // 6717
@SP // 6718
AM=M+1 // 6719
A=A-1 // 6720
M=D // 6721
@48 // 6722
D=A // 6723
@SP // 6724
AM=M+1 // 6725
A=A-1 // 6726
M=D // 6727
@24 // 6728
D=A // 6729
@SP // 6730
AM=M+1 // 6731
A=A-1 // 6732
M=D // 6733
@12 // 6734
D=A // 6735
@SP // 6736
AM=M+1 // 6737
A=A-1 // 6738
M=D // 6739
@6 // 6740
D=A // 6741
@SP // 6742
AM=M+1 // 6743
A=A-1 // 6744
M=D // 6745
@3 // 6746
D=A // 6747
@SP // 6748
AM=M+1 // 6749
A=A-1 // 6750
M=D // 6751
@51 // 6752
D=A // 6753
@SP // 6754
AM=M+1 // 6755
A=A-1 // 6756
M=D // 6757
@63 // 6758
D=A // 6759
@SP // 6760
AM=M+1 // 6761
A=A-1 // 6762
M=D // 6763
@SP // 6764
AM=M+1 // 6765
A=A-1 // 6766
M=0 // 6767
@SP // 6768
AM=M+1 // 6769
A=A-1 // 6770
M=0 // 6771
// call Output.create
@17 // 6772
D=A // 6773
@14 // 6774
M=D // 6775
@Output.create // 6776
D=A // 6777
@13 // 6778
M=D // 6779
@Output.initMap.ret.20 // 6780
D=A // 6781
@CALL // 6782
0;JMP // 6783
(Output.initMap.ret.20)
@SP // 6784
M=M-1 // 6785

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 6786
D=A // 6787
@SP // 6788
AM=M+1 // 6789
A=A-1 // 6790
M=D // 6791
@30 // 6792
D=A // 6793
@SP // 6794
AM=M+1 // 6795
A=A-1 // 6796
M=D // 6797
@51 // 6798
D=A // 6799
@SP // 6800
AM=M+1 // 6801
A=A-1 // 6802
M=D // 6803
@48 // 6804
D=A // 6805
@SP // 6806
AM=M+1 // 6807
A=A-1 // 6808
M=D // 6809
@48 // 6810
D=A // 6811
@SP // 6812
AM=M+1 // 6813
A=A-1 // 6814
M=D // 6815
@28 // 6816
D=A // 6817
@SP // 6818
AM=M+1 // 6819
A=A-1 // 6820
M=D // 6821
@48 // 6822
D=A // 6823
@SP // 6824
AM=M+1 // 6825
A=A-1 // 6826
M=D // 6827
@48 // 6828
D=A // 6829
@SP // 6830
AM=M+1 // 6831
A=A-1 // 6832
M=D // 6833
@51 // 6834
D=A // 6835
@SP // 6836
AM=M+1 // 6837
A=A-1 // 6838
M=D // 6839
@30 // 6840
D=A // 6841
@SP // 6842
AM=M+1 // 6843
A=A-1 // 6844
M=D // 6845
@SP // 6846
AM=M+1 // 6847
A=A-1 // 6848
M=0 // 6849
@SP // 6850
AM=M+1 // 6851
A=A-1 // 6852
M=0 // 6853
// call Output.create
@17 // 6854
D=A // 6855
@14 // 6856
M=D // 6857
@Output.create // 6858
D=A // 6859
@13 // 6860
M=D // 6861
@Output.initMap.ret.21 // 6862
D=A // 6863
@CALL // 6864
0;JMP // 6865
(Output.initMap.ret.21)
@SP // 6866
M=M-1 // 6867

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 6868
D=A // 6869
@SP // 6870
AM=M+1 // 6871
A=A-1 // 6872
M=D // 6873
@16 // 6874
D=A // 6875
@SP // 6876
AM=M+1 // 6877
A=A-1 // 6878
M=D // 6879
@24 // 6880
D=A // 6881
@SP // 6882
AM=M+1 // 6883
A=A-1 // 6884
M=D // 6885
@28 // 6886
D=A // 6887
@SP // 6888
AM=M+1 // 6889
A=A-1 // 6890
M=D // 6891
@26 // 6892
D=A // 6893
@SP // 6894
AM=M+1 // 6895
A=A-1 // 6896
M=D // 6897
@25 // 6898
D=A // 6899
@SP // 6900
AM=M+1 // 6901
A=A-1 // 6902
M=D // 6903
@63 // 6904
D=A // 6905
@SP // 6906
AM=M+1 // 6907
A=A-1 // 6908
M=D // 6909
@24 // 6910
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
@60 // 6922
D=A // 6923
@SP // 6924
AM=M+1 // 6925
A=A-1 // 6926
M=D // 6927
@SP // 6928
AM=M+1 // 6929
A=A-1 // 6930
M=0 // 6931
@SP // 6932
AM=M+1 // 6933
A=A-1 // 6934
M=0 // 6935
// call Output.create
@17 // 6936
D=A // 6937
@14 // 6938
M=D // 6939
@Output.create // 6940
D=A // 6941
@13 // 6942
M=D // 6943
@Output.initMap.ret.22 // 6944
D=A // 6945
@CALL // 6946
0;JMP // 6947
(Output.initMap.ret.22)
@SP // 6948
M=M-1 // 6949

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 6950
D=A // 6951
@SP // 6952
AM=M+1 // 6953
A=A-1 // 6954
M=D // 6955
@63 // 6956
D=A // 6957
@SP // 6958
AM=M+1 // 6959
A=A-1 // 6960
M=D // 6961
@3 // 6962
D=A // 6963
@SP // 6964
AM=M+1 // 6965
A=A-1 // 6966
M=D // 6967
@3 // 6968
D=A // 6969
@SP // 6970
AM=M+1 // 6971
A=A-1 // 6972
M=D // 6973
@31 // 6974
D=A // 6975
@SP // 6976
AM=M+1 // 6977
A=A-1 // 6978
M=D // 6979
@48 // 6980
D=A // 6981
@SP // 6982
AM=M+1 // 6983
A=A-1 // 6984
M=D // 6985
@48 // 6986
D=A // 6987
@SP // 6988
AM=M+1 // 6989
A=A-1 // 6990
M=D // 6991
@48 // 6992
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
@30 // 7004
D=A // 7005
@SP // 7006
AM=M+1 // 7007
A=A-1 // 7008
M=D // 7009
@SP // 7010
AM=M+1 // 7011
A=A-1 // 7012
M=0 // 7013
@SP // 7014
AM=M+1 // 7015
A=A-1 // 7016
M=0 // 7017
// call Output.create
@17 // 7018
D=A // 7019
@14 // 7020
M=D // 7021
@Output.create // 7022
D=A // 7023
@13 // 7024
M=D // 7025
@Output.initMap.ret.23 // 7026
D=A // 7027
@CALL // 7028
0;JMP // 7029
(Output.initMap.ret.23)
@SP // 7030
M=M-1 // 7031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7032
D=A // 7033
@SP // 7034
AM=M+1 // 7035
A=A-1 // 7036
M=D // 7037
@28 // 7038
D=A // 7039
@SP // 7040
AM=M+1 // 7041
A=A-1 // 7042
M=D // 7043
@6 // 7044
D=A // 7045
@SP // 7046
AM=M+1 // 7047
A=A-1 // 7048
M=D // 7049
@3 // 7050
D=A // 7051
@SP // 7052
AM=M+1 // 7053
A=A-1 // 7054
M=D // 7055
@3 // 7056
D=A // 7057
@SP // 7058
AM=M+1 // 7059
A=A-1 // 7060
M=D // 7061
@31 // 7062
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
@30 // 7086
D=A // 7087
@SP // 7088
AM=M+1 // 7089
A=A-1 // 7090
M=D // 7091
@SP // 7092
AM=M+1 // 7093
A=A-1 // 7094
M=0 // 7095
@SP // 7096
AM=M+1 // 7097
A=A-1 // 7098
M=0 // 7099
// call Output.create
@17 // 7100
D=A // 7101
@14 // 7102
M=D // 7103
@Output.create // 7104
D=A // 7105
@13 // 7106
M=D // 7107
@Output.initMap.ret.24 // 7108
D=A // 7109
@CALL // 7110
0;JMP // 7111
(Output.initMap.ret.24)
@SP // 7112
M=M-1 // 7113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7114
D=A // 7115
@SP // 7116
AM=M+1 // 7117
A=A-1 // 7118
M=D // 7119
@63 // 7120
D=A // 7121
@SP // 7122
AM=M+1 // 7123
A=A-1 // 7124
M=D // 7125
@49 // 7126
D=A // 7127
@SP // 7128
AM=M+1 // 7129
A=A-1 // 7130
M=D // 7131
@48 // 7132
D=A // 7133
@SP // 7134
AM=M+1 // 7135
A=A-1 // 7136
M=D // 7137
@48 // 7138
D=A // 7139
@SP // 7140
AM=M+1 // 7141
A=A-1 // 7142
M=D // 7143
@24 // 7144
D=A // 7145
@SP // 7146
AM=M+1 // 7147
A=A-1 // 7148
M=D // 7149
@12 // 7150
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
@12 // 7162
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
@SP // 7174
AM=M+1 // 7175
A=A-1 // 7176
M=0 // 7177
@SP // 7178
AM=M+1 // 7179
A=A-1 // 7180
M=0 // 7181
// call Output.create
@17 // 7182
D=A // 7183
@14 // 7184
M=D // 7185
@Output.create // 7186
D=A // 7187
@13 // 7188
M=D // 7189
@Output.initMap.ret.25 // 7190
D=A // 7191
@CALL // 7192
0;JMP // 7193
(Output.initMap.ret.25)
@SP // 7194
M=M-1 // 7195

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7196
D=A // 7197
@SP // 7198
AM=M+1 // 7199
A=A-1 // 7200
M=D // 7201
@30 // 7202
D=A // 7203
@SP // 7204
AM=M+1 // 7205
A=A-1 // 7206
M=D // 7207
@51 // 7208
D=A // 7209
@SP // 7210
AM=M+1 // 7211
A=A-1 // 7212
M=D // 7213
@51 // 7214
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
@30 // 7226
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
@30 // 7250
D=A // 7251
@SP // 7252
AM=M+1 // 7253
A=A-1 // 7254
M=D // 7255
@SP // 7256
AM=M+1 // 7257
A=A-1 // 7258
M=0 // 7259
@SP // 7260
AM=M+1 // 7261
A=A-1 // 7262
M=0 // 7263
// call Output.create
@17 // 7264
D=A // 7265
@14 // 7266
M=D // 7267
@Output.create // 7268
D=A // 7269
@13 // 7270
M=D // 7271
@Output.initMap.ret.26 // 7272
D=A // 7273
@CALL // 7274
0;JMP // 7275
(Output.initMap.ret.26)
@SP // 7276
M=M-1 // 7277

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7278
D=A // 7279
@SP // 7280
AM=M+1 // 7281
A=A-1 // 7282
M=D // 7283
@30 // 7284
D=A // 7285
@SP // 7286
AM=M+1 // 7287
A=A-1 // 7288
M=D // 7289
@51 // 7290
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
@51 // 7302
D=A // 7303
@SP // 7304
AM=M+1 // 7305
A=A-1 // 7306
M=D // 7307
@62 // 7308
D=A // 7309
@SP // 7310
AM=M+1 // 7311
A=A-1 // 7312
M=D // 7313
@48 // 7314
D=A // 7315
@SP // 7316
AM=M+1 // 7317
A=A-1 // 7318
M=D // 7319
@48 // 7320
D=A // 7321
@SP // 7322
AM=M+1 // 7323
A=A-1 // 7324
M=D // 7325
@24 // 7326
D=A // 7327
@SP // 7328
AM=M+1 // 7329
A=A-1 // 7330
M=D // 7331
@14 // 7332
D=A // 7333
@SP // 7334
AM=M+1 // 7335
A=A-1 // 7336
M=D // 7337
@SP // 7338
AM=M+1 // 7339
A=A-1 // 7340
M=0 // 7341
@SP // 7342
AM=M+1 // 7343
A=A-1 // 7344
M=0 // 7345
// call Output.create
@17 // 7346
D=A // 7347
@14 // 7348
M=D // 7349
@Output.create // 7350
D=A // 7351
@13 // 7352
M=D // 7353
@Output.initMap.ret.27 // 7354
D=A // 7355
@CALL // 7356
0;JMP // 7357
(Output.initMap.ret.27)
@SP // 7358
M=M-1 // 7359

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@58 // 7360
D=A // 7361
@SP // 7362
AM=M+1 // 7363
A=A-1 // 7364
M=D // 7365
@SP // 7366
AM=M+1 // 7367
A=A-1 // 7368
M=0 // 7369
@SP // 7370
AM=M+1 // 7371
A=A-1 // 7372
M=0 // 7373
@12 // 7374
D=A // 7375
@SP // 7376
AM=M+1 // 7377
A=A-1 // 7378
M=D // 7379
@12 // 7380
D=A // 7381
@SP // 7382
AM=M+1 // 7383
A=A-1 // 7384
M=D // 7385
@SP // 7386
AM=M+1 // 7387
A=A-1 // 7388
M=0 // 7389
@SP // 7390
AM=M+1 // 7391
A=A-1 // 7392
M=0 // 7393
@12 // 7394
D=A // 7395
@SP // 7396
AM=M+1 // 7397
A=A-1 // 7398
M=D // 7399
@12 // 7400
D=A // 7401
@SP // 7402
AM=M+1 // 7403
A=A-1 // 7404
M=D // 7405
@SP // 7406
AM=M+1 // 7407
A=A-1 // 7408
M=0 // 7409
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
@Output.initMap.ret.28 // 7426
D=A // 7427
@CALL // 7428
0;JMP // 7429
(Output.initMap.ret.28)
@SP // 7430
M=M-1 // 7431

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@59 // 7432
D=A // 7433
@SP // 7434
AM=M+1 // 7435
A=A-1 // 7436
M=D // 7437
@SP // 7438
AM=M+1 // 7439
A=A-1 // 7440
M=0 // 7441
@SP // 7442
AM=M+1 // 7443
A=A-1 // 7444
M=0 // 7445
@12 // 7446
D=A // 7447
@SP // 7448
AM=M+1 // 7449
A=A-1 // 7450
M=D // 7451
@12 // 7452
D=A // 7453
@SP // 7454
AM=M+1 // 7455
A=A-1 // 7456
M=D // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=0 // 7461
@SP // 7462
AM=M+1 // 7463
A=A-1 // 7464
M=0 // 7465
@12 // 7466
D=A // 7467
@SP // 7468
AM=M+1 // 7469
A=A-1 // 7470
M=D // 7471
@12 // 7472
D=A // 7473
@SP // 7474
AM=M+1 // 7475
A=A-1 // 7476
M=D // 7477
@6 // 7478
D=A // 7479
@SP // 7480
AM=M+1 // 7481
A=A-1 // 7482
M=D // 7483
@SP // 7484
AM=M+1 // 7485
A=A-1 // 7486
M=0 // 7487
@SP // 7488
AM=M+1 // 7489
A=A-1 // 7490
M=0 // 7491
// call Output.create
@17 // 7492
D=A // 7493
@14 // 7494
M=D // 7495
@Output.create // 7496
D=A // 7497
@13 // 7498
M=D // 7499
@Output.initMap.ret.29 // 7500
D=A // 7501
@CALL // 7502
0;JMP // 7503
(Output.initMap.ret.29)
@SP // 7504
M=M-1 // 7505

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@60 // 7506
D=A // 7507
@SP // 7508
AM=M+1 // 7509
A=A-1 // 7510
M=D // 7511
@SP // 7512
AM=M+1 // 7513
A=A-1 // 7514
M=0 // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=0 // 7519
@24 // 7520
D=A // 7521
@SP // 7522
AM=M+1 // 7523
A=A-1 // 7524
M=D // 7525
@12 // 7526
D=A // 7527
@SP // 7528
AM=M+1 // 7529
A=A-1 // 7530
M=D // 7531
@6 // 7532
D=A // 7533
@SP // 7534
AM=M+1 // 7535
A=A-1 // 7536
M=D // 7537
@3 // 7538
D=A // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=D // 7543
@6 // 7544
D=A // 7545
@SP // 7546
AM=M+1 // 7547
A=A-1 // 7548
M=D // 7549
@12 // 7550
D=A // 7551
@SP // 7552
AM=M+1 // 7553
A=A-1 // 7554
M=D // 7555
@24 // 7556
D=A // 7557
@SP // 7558
AM=M+1 // 7559
A=A-1 // 7560
M=D // 7561
@SP // 7562
AM=M+1 // 7563
A=A-1 // 7564
M=0 // 7565
@SP // 7566
AM=M+1 // 7567
A=A-1 // 7568
M=0 // 7569
// call Output.create
@17 // 7570
D=A // 7571
@14 // 7572
M=D // 7573
@Output.create // 7574
D=A // 7575
@13 // 7576
M=D // 7577
@Output.initMap.ret.30 // 7578
D=A // 7579
@CALL // 7580
0;JMP // 7581
(Output.initMap.ret.30)
@SP // 7582
M=M-1 // 7583

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@61 // 7584
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
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=0 // 7601
@63 // 7602
D=A // 7603
@SP // 7604
AM=M+1 // 7605
A=A-1 // 7606
M=D // 7607
@SP // 7608
AM=M+1 // 7609
A=A-1 // 7610
M=0 // 7611
@SP // 7612
AM=M+1 // 7613
A=A-1 // 7614
M=0 // 7615
@63 // 7616
D=A // 7617
@SP // 7618
AM=M+1 // 7619
A=A-1 // 7620
M=D // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=0 // 7625
@SP // 7626
AM=M+1 // 7627
A=A-1 // 7628
M=0 // 7629
@SP // 7630
AM=M+1 // 7631
A=A-1 // 7632
M=0 // 7633
@SP // 7634
AM=M+1 // 7635
A=A-1 // 7636
M=0 // 7637
// call Output.create
@17 // 7638
D=A // 7639
@14 // 7640
M=D // 7641
@Output.create // 7642
D=A // 7643
@13 // 7644
M=D // 7645
@Output.initMap.ret.31 // 7646
D=A // 7647
@CALL // 7648
0;JMP // 7649
(Output.initMap.ret.31)
@SP // 7650
M=M-1 // 7651

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@62 // 7652
D=A // 7653
@SP // 7654
AM=M+1 // 7655
A=A-1 // 7656
M=D // 7657
@SP // 7658
AM=M+1 // 7659
A=A-1 // 7660
M=0 // 7661
@SP // 7662
AM=M+1 // 7663
A=A-1 // 7664
M=0 // 7665
@3 // 7666
D=A // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=D // 7671
@6 // 7672
D=A // 7673
@SP // 7674
AM=M+1 // 7675
A=A-1 // 7676
M=D // 7677
@12 // 7678
D=A // 7679
@SP // 7680
AM=M+1 // 7681
A=A-1 // 7682
M=D // 7683
@24 // 7684
D=A // 7685
@SP // 7686
AM=M+1 // 7687
A=A-1 // 7688
M=D // 7689
@12 // 7690
D=A // 7691
@SP // 7692
AM=M+1 // 7693
A=A-1 // 7694
M=D // 7695
@6 // 7696
D=A // 7697
@SP // 7698
AM=M+1 // 7699
A=A-1 // 7700
M=D // 7701
@3 // 7702
D=A // 7703
@SP // 7704
AM=M+1 // 7705
A=A-1 // 7706
M=D // 7707
@SP // 7708
AM=M+1 // 7709
A=A-1 // 7710
M=0 // 7711
@SP // 7712
AM=M+1 // 7713
A=A-1 // 7714
M=0 // 7715
// call Output.create
@17 // 7716
D=A // 7717
@14 // 7718
M=D // 7719
@Output.create // 7720
D=A // 7721
@13 // 7722
M=D // 7723
@Output.initMap.ret.32 // 7724
D=A // 7725
@CALL // 7726
0;JMP // 7727
(Output.initMap.ret.32)
@SP // 7728
M=M-1 // 7729

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 7730
D=A // 7731
@SP // 7732
AM=M+1 // 7733
A=A-1 // 7734
M=D // 7735
@30 // 7736
D=A // 7737
@SP // 7738
AM=M+1 // 7739
A=A-1 // 7740
M=D // 7741
@51 // 7742
D=A // 7743
@SP // 7744
AM=M+1 // 7745
A=A-1 // 7746
M=D // 7747
@51 // 7748
D=A // 7749
@SP // 7750
AM=M+1 // 7751
A=A-1 // 7752
M=D // 7753
@59 // 7754
D=A // 7755
@SP // 7756
AM=M+1 // 7757
A=A-1 // 7758
M=D // 7759
@59 // 7760
D=A // 7761
@SP // 7762
AM=M+1 // 7763
A=A-1 // 7764
M=D // 7765
@59 // 7766
D=A // 7767
@SP // 7768
AM=M+1 // 7769
A=A-1 // 7770
M=D // 7771
@27 // 7772
D=A // 7773
@SP // 7774
AM=M+1 // 7775
A=A-1 // 7776
M=D // 7777
@3 // 7778
D=A // 7779
@SP // 7780
AM=M+1 // 7781
A=A-1 // 7782
M=D // 7783
@30 // 7784
D=A // 7785
@SP // 7786
AM=M+1 // 7787
A=A-1 // 7788
M=D // 7789
@SP // 7790
AM=M+1 // 7791
A=A-1 // 7792
M=0 // 7793
@SP // 7794
AM=M+1 // 7795
A=A-1 // 7796
M=0 // 7797
// call Output.create
@17 // 7798
D=A // 7799
@14 // 7800
M=D // 7801
@Output.create // 7802
D=A // 7803
@13 // 7804
M=D // 7805
@Output.initMap.ret.33 // 7806
D=A // 7807
@CALL // 7808
0;JMP // 7809
(Output.initMap.ret.33)
@SP // 7810
M=M-1 // 7811

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 7812
D=A // 7813
@SP // 7814
AM=M+1 // 7815
A=A-1 // 7816
M=D // 7817
@30 // 7818
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
@24 // 7836
D=A // 7837
@SP // 7838
AM=M+1 // 7839
A=A-1 // 7840
M=D // 7841
@12 // 7842
D=A // 7843
@SP // 7844
AM=M+1 // 7845
A=A-1 // 7846
M=D // 7847
@12 // 7848
D=A // 7849
@SP // 7850
AM=M+1 // 7851
A=A-1 // 7852
M=D // 7853
@SP // 7854
AM=M+1 // 7855
A=A-1 // 7856
M=0 // 7857
@12 // 7858
D=A // 7859
@SP // 7860
AM=M+1 // 7861
A=A-1 // 7862
M=D // 7863
@12 // 7864
D=A // 7865
@SP // 7866
AM=M+1 // 7867
A=A-1 // 7868
M=D // 7869
@SP // 7870
AM=M+1 // 7871
A=A-1 // 7872
M=0 // 7873
@SP // 7874
AM=M+1 // 7875
A=A-1 // 7876
M=0 // 7877
// call Output.create
@17 // 7878
D=A // 7879
@14 // 7880
M=D // 7881
@Output.create // 7882
D=A // 7883
@13 // 7884
M=D // 7885
@Output.initMap.ret.34 // 7886
D=A // 7887
@CALL // 7888
0;JMP // 7889
(Output.initMap.ret.34)
@SP // 7890
M=M-1 // 7891

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 7892
D=A // 7893
@SP // 7894
AM=M+1 // 7895
A=A-1 // 7896
M=D // 7897
@12 // 7898
D=A // 7899
@SP // 7900
AM=M+1 // 7901
A=A-1 // 7902
M=D // 7903
@30 // 7904
D=A // 7905
@SP // 7906
AM=M+1 // 7907
A=A-1 // 7908
M=D // 7909
@51 // 7910
D=A // 7911
@SP // 7912
AM=M+1 // 7913
A=A-1 // 7914
M=D // 7915
@51 // 7916
D=A // 7917
@SP // 7918
AM=M+1 // 7919
A=A-1 // 7920
M=D // 7921
@63 // 7922
D=A // 7923
@SP // 7924
AM=M+1 // 7925
A=A-1 // 7926
M=D // 7927
@51 // 7928
D=A // 7929
@SP // 7930
AM=M+1 // 7931
A=A-1 // 7932
M=D // 7933
@51 // 7934
D=A // 7935
@SP // 7936
AM=M+1 // 7937
A=A-1 // 7938
M=D // 7939
@51 // 7940
D=A // 7941
@SP // 7942
AM=M+1 // 7943
A=A-1 // 7944
M=D // 7945
@51 // 7946
D=A // 7947
@SP // 7948
AM=M+1 // 7949
A=A-1 // 7950
M=D // 7951
@SP // 7952
AM=M+1 // 7953
A=A-1 // 7954
M=0 // 7955
@SP // 7956
AM=M+1 // 7957
A=A-1 // 7958
M=0 // 7959
// call Output.create
@17 // 7960
D=A // 7961
@14 // 7962
M=D // 7963
@Output.create // 7964
D=A // 7965
@13 // 7966
M=D // 7967
@Output.initMap.ret.35 // 7968
D=A // 7969
@CALL // 7970
0;JMP // 7971
(Output.initMap.ret.35)
@SP // 7972
M=M-1 // 7973

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 7974
D=A // 7975
@SP // 7976
AM=M+1 // 7977
A=A-1 // 7978
M=D // 7979
@31 // 7980
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
@31 // 8004
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
@31 // 8028
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
@Output.initMap.ret.36 // 8050
D=A // 8051
@CALL // 8052
0;JMP // 8053
(Output.initMap.ret.36)
@SP // 8054
M=M-1 // 8055

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8056
D=A // 8057
@SP // 8058
AM=M+1 // 8059
A=A-1 // 8060
M=D // 8061
@28 // 8062
D=A // 8063
@SP // 8064
AM=M+1 // 8065
A=A-1 // 8066
M=D // 8067
@54 // 8068
D=A // 8069
@SP // 8070
AM=M+1 // 8071
A=A-1 // 8072
M=D // 8073
@35 // 8074
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
@35 // 8098
D=A // 8099
@SP // 8100
AM=M+1 // 8101
A=A-1 // 8102
M=D // 8103
@54 // 8104
D=A // 8105
@SP // 8106
AM=M+1 // 8107
A=A-1 // 8108
M=D // 8109
@28 // 8110
D=A // 8111
@SP // 8112
AM=M+1 // 8113
A=A-1 // 8114
M=D // 8115
@SP // 8116
AM=M+1 // 8117
A=A-1 // 8118
M=0 // 8119
@SP // 8120
AM=M+1 // 8121
A=A-1 // 8122
M=0 // 8123
// call Output.create
@17 // 8124
D=A // 8125
@14 // 8126
M=D // 8127
@Output.create // 8128
D=A // 8129
@13 // 8130
M=D // 8131
@Output.initMap.ret.37 // 8132
D=A // 8133
@CALL // 8134
0;JMP // 8135
(Output.initMap.ret.37)
@SP // 8136
M=M-1 // 8137

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8138
D=A // 8139
@SP // 8140
AM=M+1 // 8141
A=A-1 // 8142
M=D // 8143
@15 // 8144
D=A // 8145
@SP // 8146
AM=M+1 // 8147
A=A-1 // 8148
M=D // 8149
@27 // 8150
D=A // 8151
@SP // 8152
AM=M+1 // 8153
A=A-1 // 8154
M=D // 8155
@51 // 8156
D=A // 8157
@SP // 8158
AM=M+1 // 8159
A=A-1 // 8160
M=D // 8161
@51 // 8162
D=A // 8163
@SP // 8164
AM=M+1 // 8165
A=A-1 // 8166
M=D // 8167
@51 // 8168
D=A // 8169
@SP // 8170
AM=M+1 // 8171
A=A-1 // 8172
M=D // 8173
@51 // 8174
D=A // 8175
@SP // 8176
AM=M+1 // 8177
A=A-1 // 8178
M=D // 8179
@51 // 8180
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
@15 // 8192
D=A // 8193
@SP // 8194
AM=M+1 // 8195
A=A-1 // 8196
M=D // 8197
@SP // 8198
AM=M+1 // 8199
A=A-1 // 8200
M=0 // 8201
@SP // 8202
AM=M+1 // 8203
A=A-1 // 8204
M=0 // 8205
// call Output.create
@17 // 8206
D=A // 8207
@14 // 8208
M=D // 8209
@Output.create // 8210
D=A // 8211
@13 // 8212
M=D // 8213
@Output.initMap.ret.38 // 8214
D=A // 8215
@CALL // 8216
0;JMP // 8217
(Output.initMap.ret.38)
@SP // 8218
M=M-1 // 8219

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8220
D=A // 8221
@SP // 8222
AM=M+1 // 8223
A=A-1 // 8224
M=D // 8225
@63 // 8226
D=A // 8227
@SP // 8228
AM=M+1 // 8229
A=A-1 // 8230
M=D // 8231
@51 // 8232
D=A // 8233
@SP // 8234
AM=M+1 // 8235
A=A-1 // 8236
M=D // 8237
@35 // 8238
D=A // 8239
@SP // 8240
AM=M+1 // 8241
A=A-1 // 8242
M=D // 8243
@11 // 8244
D=A // 8245
@SP // 8246
AM=M+1 // 8247
A=A-1 // 8248
M=D // 8249
@15 // 8250
D=A // 8251
@SP // 8252
AM=M+1 // 8253
A=A-1 // 8254
M=D // 8255
@11 // 8256
D=A // 8257
@SP // 8258
AM=M+1 // 8259
A=A-1 // 8260
M=D // 8261
@35 // 8262
D=A // 8263
@SP // 8264
AM=M+1 // 8265
A=A-1 // 8266
M=D // 8267
@51 // 8268
D=A // 8269
@SP // 8270
AM=M+1 // 8271
A=A-1 // 8272
M=D // 8273
@63 // 8274
D=A // 8275
@SP // 8276
AM=M+1 // 8277
A=A-1 // 8278
M=D // 8279
@SP // 8280
AM=M+1 // 8281
A=A-1 // 8282
M=0 // 8283
@SP // 8284
AM=M+1 // 8285
A=A-1 // 8286
M=0 // 8287
// call Output.create
@17 // 8288
D=A // 8289
@14 // 8290
M=D // 8291
@Output.create // 8292
D=A // 8293
@13 // 8294
M=D // 8295
@Output.initMap.ret.39 // 8296
D=A // 8297
@CALL // 8298
0;JMP // 8299
(Output.initMap.ret.39)
@SP // 8300
M=M-1 // 8301

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8302
D=A // 8303
@SP // 8304
AM=M+1 // 8305
A=A-1 // 8306
M=D // 8307
@63 // 8308
D=A // 8309
@SP // 8310
AM=M+1 // 8311
A=A-1 // 8312
M=D // 8313
@51 // 8314
D=A // 8315
@SP // 8316
AM=M+1 // 8317
A=A-1 // 8318
M=D // 8319
@35 // 8320
D=A // 8321
@SP // 8322
AM=M+1 // 8323
A=A-1 // 8324
M=D // 8325
@11 // 8326
D=A // 8327
@SP // 8328
AM=M+1 // 8329
A=A-1 // 8330
M=D // 8331
@15 // 8332
D=A // 8333
@SP // 8334
AM=M+1 // 8335
A=A-1 // 8336
M=D // 8337
@11 // 8338
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
@3 // 8356
D=A // 8357
@SP // 8358
AM=M+1 // 8359
A=A-1 // 8360
M=D // 8361
@SP // 8362
AM=M+1 // 8363
A=A-1 // 8364
M=0 // 8365
@SP // 8366
AM=M+1 // 8367
A=A-1 // 8368
M=0 // 8369
// call Output.create
@17 // 8370
D=A // 8371
@14 // 8372
M=D // 8373
@Output.create // 8374
D=A // 8375
@13 // 8376
M=D // 8377
@Output.initMap.ret.40 // 8378
D=A // 8379
@CALL // 8380
0;JMP // 8381
(Output.initMap.ret.40)
@SP // 8382
M=M-1 // 8383

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8384
D=A // 8385
@SP // 8386
AM=M+1 // 8387
A=A-1 // 8388
M=D // 8389
@28 // 8390
D=A // 8391
@SP // 8392
AM=M+1 // 8393
A=A-1 // 8394
M=D // 8395
@54 // 8396
D=A // 8397
@SP // 8398
AM=M+1 // 8399
A=A-1 // 8400
M=D // 8401
@35 // 8402
D=A // 8403
@SP // 8404
AM=M+1 // 8405
A=A-1 // 8406
M=D // 8407
@3 // 8408
D=A // 8409
@SP // 8410
AM=M+1 // 8411
A=A-1 // 8412
M=D // 8413
@59 // 8414
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
@54 // 8432
D=A // 8433
@SP // 8434
AM=M+1 // 8435
A=A-1 // 8436
M=D // 8437
@44 // 8438
D=A // 8439
@SP // 8440
AM=M+1 // 8441
A=A-1 // 8442
M=D // 8443
@SP // 8444
AM=M+1 // 8445
A=A-1 // 8446
M=0 // 8447
@SP // 8448
AM=M+1 // 8449
A=A-1 // 8450
M=0 // 8451
// call Output.create
@17 // 8452
D=A // 8453
@14 // 8454
M=D // 8455
@Output.create // 8456
D=A // 8457
@13 // 8458
M=D // 8459
@Output.initMap.ret.41 // 8460
D=A // 8461
@CALL // 8462
0;JMP // 8463
(Output.initMap.ret.41)
@SP // 8464
M=M-1 // 8465

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8466
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
@51 // 8478
D=A // 8479
@SP // 8480
AM=M+1 // 8481
A=A-1 // 8482
M=D // 8483
@51 // 8484
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
@63 // 8496
D=A // 8497
@SP // 8498
AM=M+1 // 8499
A=A-1 // 8500
M=D // 8501
@51 // 8502
D=A // 8503
@SP // 8504
AM=M+1 // 8505
A=A-1 // 8506
M=D // 8507
@51 // 8508
D=A // 8509
@SP // 8510
AM=M+1 // 8511
A=A-1 // 8512
M=D // 8513
@51 // 8514
D=A // 8515
@SP // 8516
AM=M+1 // 8517
A=A-1 // 8518
M=D // 8519
@51 // 8520
D=A // 8521
@SP // 8522
AM=M+1 // 8523
A=A-1 // 8524
M=D // 8525
@SP // 8526
AM=M+1 // 8527
A=A-1 // 8528
M=0 // 8529
@SP // 8530
AM=M+1 // 8531
A=A-1 // 8532
M=0 // 8533
// call Output.create
@17 // 8534
D=A // 8535
@14 // 8536
M=D // 8537
@Output.create // 8538
D=A // 8539
@13 // 8540
M=D // 8541
@Output.initMap.ret.42 // 8542
D=A // 8543
@CALL // 8544
0;JMP // 8545
(Output.initMap.ret.42)
@SP // 8546
M=M-1 // 8547

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8548
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
@12 // 8560
D=A // 8561
@SP // 8562
AM=M+1 // 8563
A=A-1 // 8564
M=D // 8565
@12 // 8566
D=A // 8567
@SP // 8568
AM=M+1 // 8569
A=A-1 // 8570
M=D // 8571
@12 // 8572
D=A // 8573
@SP // 8574
AM=M+1 // 8575
A=A-1 // 8576
M=D // 8577
@12 // 8578
D=A // 8579
@SP // 8580
AM=M+1 // 8581
A=A-1 // 8582
M=D // 8583
@12 // 8584
D=A // 8585
@SP // 8586
AM=M+1 // 8587
A=A-1 // 8588
M=D // 8589
@12 // 8590
D=A // 8591
@SP // 8592
AM=M+1 // 8593
A=A-1 // 8594
M=D // 8595
@12 // 8596
D=A // 8597
@SP // 8598
AM=M+1 // 8599
A=A-1 // 8600
M=D // 8601
@30 // 8602
D=A // 8603
@SP // 8604
AM=M+1 // 8605
A=A-1 // 8606
M=D // 8607
@SP // 8608
AM=M+1 // 8609
A=A-1 // 8610
M=0 // 8611
@SP // 8612
AM=M+1 // 8613
A=A-1 // 8614
M=0 // 8615
// call Output.create
@17 // 8616
D=A // 8617
@14 // 8618
M=D // 8619
@Output.create // 8620
D=A // 8621
@13 // 8622
M=D // 8623
@Output.initMap.ret.43 // 8624
D=A // 8625
@CALL // 8626
0;JMP // 8627
(Output.initMap.ret.43)
@SP // 8628
M=M-1 // 8629

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8630
D=A // 8631
@SP // 8632
AM=M+1 // 8633
A=A-1 // 8634
M=D // 8635
@60 // 8636
D=A // 8637
@SP // 8638
AM=M+1 // 8639
A=A-1 // 8640
M=D // 8641
@24 // 8642
D=A // 8643
@SP // 8644
AM=M+1 // 8645
A=A-1 // 8646
M=D // 8647
@24 // 8648
D=A // 8649
@SP // 8650
AM=M+1 // 8651
A=A-1 // 8652
M=D // 8653
@24 // 8654
D=A // 8655
@SP // 8656
AM=M+1 // 8657
A=A-1 // 8658
M=D // 8659
@24 // 8660
D=A // 8661
@SP // 8662
AM=M+1 // 8663
A=A-1 // 8664
M=D // 8665
@24 // 8666
D=A // 8667
@SP // 8668
AM=M+1 // 8669
A=A-1 // 8670
M=D // 8671
@27 // 8672
D=A // 8673
@SP // 8674
AM=M+1 // 8675
A=A-1 // 8676
M=D // 8677
@27 // 8678
D=A // 8679
@SP // 8680
AM=M+1 // 8681
A=A-1 // 8682
M=D // 8683
@14 // 8684
D=A // 8685
@SP // 8686
AM=M+1 // 8687
A=A-1 // 8688
M=D // 8689
@SP // 8690
AM=M+1 // 8691
A=A-1 // 8692
M=0 // 8693
@SP // 8694
AM=M+1 // 8695
A=A-1 // 8696
M=0 // 8697
// call Output.create
@17 // 8698
D=A // 8699
@14 // 8700
M=D // 8701
@Output.create // 8702
D=A // 8703
@13 // 8704
M=D // 8705
@Output.initMap.ret.44 // 8706
D=A // 8707
@CALL // 8708
0;JMP // 8709
(Output.initMap.ret.44)
@SP // 8710
M=M-1 // 8711

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 8712
D=A // 8713
@SP // 8714
AM=M+1 // 8715
A=A-1 // 8716
M=D // 8717
@51 // 8718
D=A // 8719
@SP // 8720
AM=M+1 // 8721
A=A-1 // 8722
M=D // 8723
@51 // 8724
D=A // 8725
@SP // 8726
AM=M+1 // 8727
A=A-1 // 8728
M=D // 8729
@51 // 8730
D=A // 8731
@SP // 8732
AM=M+1 // 8733
A=A-1 // 8734
M=D // 8735
@27 // 8736
D=A // 8737
@SP // 8738
AM=M+1 // 8739
A=A-1 // 8740
M=D // 8741
@15 // 8742
D=A // 8743
@SP // 8744
AM=M+1 // 8745
A=A-1 // 8746
M=D // 8747
@27 // 8748
D=A // 8749
@SP // 8750
AM=M+1 // 8751
A=A-1 // 8752
M=D // 8753
@51 // 8754
D=A // 8755
@SP // 8756
AM=M+1 // 8757
A=A-1 // 8758
M=D // 8759
@51 // 8760
D=A // 8761
@SP // 8762
AM=M+1 // 8763
A=A-1 // 8764
M=D // 8765
@51 // 8766
D=A // 8767
@SP // 8768
AM=M+1 // 8769
A=A-1 // 8770
M=D // 8771
@SP // 8772
AM=M+1 // 8773
A=A-1 // 8774
M=0 // 8775
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=0 // 8779
// call Output.create
@17 // 8780
D=A // 8781
@14 // 8782
M=D // 8783
@Output.create // 8784
D=A // 8785
@13 // 8786
M=D // 8787
@Output.initMap.ret.45 // 8788
D=A // 8789
@CALL // 8790
0;JMP // 8791
(Output.initMap.ret.45)
@SP // 8792
M=M-1 // 8793

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 8794
D=A // 8795
@SP // 8796
AM=M+1 // 8797
A=A-1 // 8798
M=D // 8799
@3 // 8800
D=A // 8801
@SP // 8802
AM=M+1 // 8803
A=A-1 // 8804
M=D // 8805
@3 // 8806
D=A // 8807
@SP // 8808
AM=M+1 // 8809
A=A-1 // 8810
M=D // 8811
@3 // 8812
D=A // 8813
@SP // 8814
AM=M+1 // 8815
A=A-1 // 8816
M=D // 8817
@3 // 8818
D=A // 8819
@SP // 8820
AM=M+1 // 8821
A=A-1 // 8822
M=D // 8823
@3 // 8824
D=A // 8825
@SP // 8826
AM=M+1 // 8827
A=A-1 // 8828
M=D // 8829
@3 // 8830
D=A // 8831
@SP // 8832
AM=M+1 // 8833
A=A-1 // 8834
M=D // 8835
@35 // 8836
D=A // 8837
@SP // 8838
AM=M+1 // 8839
A=A-1 // 8840
M=D // 8841
@51 // 8842
D=A // 8843
@SP // 8844
AM=M+1 // 8845
A=A-1 // 8846
M=D // 8847
@63 // 8848
D=A // 8849
@SP // 8850
AM=M+1 // 8851
A=A-1 // 8852
M=D // 8853
@SP // 8854
AM=M+1 // 8855
A=A-1 // 8856
M=0 // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=0 // 8861
// call Output.create
@17 // 8862
D=A // 8863
@14 // 8864
M=D // 8865
@Output.create // 8866
D=A // 8867
@13 // 8868
M=D // 8869
@Output.initMap.ret.46 // 8870
D=A // 8871
@CALL // 8872
0;JMP // 8873
(Output.initMap.ret.46)
@SP // 8874
M=M-1 // 8875

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 8876
D=A // 8877
@SP // 8878
AM=M+1 // 8879
A=A-1 // 8880
M=D // 8881
@33 // 8882
D=A // 8883
@SP // 8884
AM=M+1 // 8885
A=A-1 // 8886
M=D // 8887
@51 // 8888
D=A // 8889
@SP // 8890
AM=M+1 // 8891
A=A-1 // 8892
M=D // 8893
@63 // 8894
D=A // 8895
@SP // 8896
AM=M+1 // 8897
A=A-1 // 8898
M=D // 8899
@63 // 8900
D=A // 8901
@SP // 8902
AM=M+1 // 8903
A=A-1 // 8904
M=D // 8905
@51 // 8906
D=A // 8907
@SP // 8908
AM=M+1 // 8909
A=A-1 // 8910
M=D // 8911
@51 // 8912
D=A // 8913
@SP // 8914
AM=M+1 // 8915
A=A-1 // 8916
M=D // 8917
@51 // 8918
D=A // 8919
@SP // 8920
AM=M+1 // 8921
A=A-1 // 8922
M=D // 8923
@51 // 8924
D=A // 8925
@SP // 8926
AM=M+1 // 8927
A=A-1 // 8928
M=D // 8929
@51 // 8930
D=A // 8931
@SP // 8932
AM=M+1 // 8933
A=A-1 // 8934
M=D // 8935
@SP // 8936
AM=M+1 // 8937
A=A-1 // 8938
M=0 // 8939
@SP // 8940
AM=M+1 // 8941
A=A-1 // 8942
M=0 // 8943
// call Output.create
@17 // 8944
D=A // 8945
@14 // 8946
M=D // 8947
@Output.create // 8948
D=A // 8949
@13 // 8950
M=D // 8951
@Output.initMap.ret.47 // 8952
D=A // 8953
@CALL // 8954
0;JMP // 8955
(Output.initMap.ret.47)
@SP // 8956
M=M-1 // 8957

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 8958
D=A // 8959
@SP // 8960
AM=M+1 // 8961
A=A-1 // 8962
M=D // 8963
@51 // 8964
D=A // 8965
@SP // 8966
AM=M+1 // 8967
A=A-1 // 8968
M=D // 8969
@51 // 8970
D=A // 8971
@SP // 8972
AM=M+1 // 8973
A=A-1 // 8974
M=D // 8975
@55 // 8976
D=A // 8977
@SP // 8978
AM=M+1 // 8979
A=A-1 // 8980
M=D // 8981
@55 // 8982
D=A // 8983
@SP // 8984
AM=M+1 // 8985
A=A-1 // 8986
M=D // 8987
@63 // 8988
D=A // 8989
@SP // 8990
AM=M+1 // 8991
A=A-1 // 8992
M=D // 8993
@59 // 8994
D=A // 8995
@SP // 8996
AM=M+1 // 8997
A=A-1 // 8998
M=D // 8999
@59 // 9000
D=A // 9001
@SP // 9002
AM=M+1 // 9003
A=A-1 // 9004
M=D // 9005
@51 // 9006
D=A // 9007
@SP // 9008
AM=M+1 // 9009
A=A-1 // 9010
M=D // 9011
@51 // 9012
D=A // 9013
@SP // 9014
AM=M+1 // 9015
A=A-1 // 9016
M=D // 9017
@SP // 9018
AM=M+1 // 9019
A=A-1 // 9020
M=0 // 9021
@SP // 9022
AM=M+1 // 9023
A=A-1 // 9024
M=0 // 9025
// call Output.create
@17 // 9026
D=A // 9027
@14 // 9028
M=D // 9029
@Output.create // 9030
D=A // 9031
@13 // 9032
M=D // 9033
@Output.initMap.ret.48 // 9034
D=A // 9035
@CALL // 9036
0;JMP // 9037
(Output.initMap.ret.48)
@SP // 9038
M=M-1 // 9039

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9040
D=A // 9041
@SP // 9042
AM=M+1 // 9043
A=A-1 // 9044
M=D // 9045
@30 // 9046
D=A // 9047
@SP // 9048
AM=M+1 // 9049
A=A-1 // 9050
M=D // 9051
@51 // 9052
D=A // 9053
@SP // 9054
AM=M+1 // 9055
A=A-1 // 9056
M=D // 9057
@51 // 9058
D=A // 9059
@SP // 9060
AM=M+1 // 9061
A=A-1 // 9062
M=D // 9063
@51 // 9064
D=A // 9065
@SP // 9066
AM=M+1 // 9067
A=A-1 // 9068
M=D // 9069
@51 // 9070
D=A // 9071
@SP // 9072
AM=M+1 // 9073
A=A-1 // 9074
M=D // 9075
@51 // 9076
D=A // 9077
@SP // 9078
AM=M+1 // 9079
A=A-1 // 9080
M=D // 9081
@51 // 9082
D=A // 9083
@SP // 9084
AM=M+1 // 9085
A=A-1 // 9086
M=D // 9087
@51 // 9088
D=A // 9089
@SP // 9090
AM=M+1 // 9091
A=A-1 // 9092
M=D // 9093
@30 // 9094
D=A // 9095
@SP // 9096
AM=M+1 // 9097
A=A-1 // 9098
M=D // 9099
@SP // 9100
AM=M+1 // 9101
A=A-1 // 9102
M=0 // 9103
@SP // 9104
AM=M+1 // 9105
A=A-1 // 9106
M=0 // 9107
// call Output.create
@17 // 9108
D=A // 9109
@14 // 9110
M=D // 9111
@Output.create // 9112
D=A // 9113
@13 // 9114
M=D // 9115
@Output.initMap.ret.49 // 9116
D=A // 9117
@CALL // 9118
0;JMP // 9119
(Output.initMap.ret.49)
@SP // 9120
M=M-1 // 9121

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9122
D=A // 9123
@SP // 9124
AM=M+1 // 9125
A=A-1 // 9126
M=D // 9127
@31 // 9128
D=A // 9129
@SP // 9130
AM=M+1 // 9131
A=A-1 // 9132
M=D // 9133
@51 // 9134
D=A // 9135
@SP // 9136
AM=M+1 // 9137
A=A-1 // 9138
M=D // 9139
@51 // 9140
D=A // 9141
@SP // 9142
AM=M+1 // 9143
A=A-1 // 9144
M=D // 9145
@51 // 9146
D=A // 9147
@SP // 9148
AM=M+1 // 9149
A=A-1 // 9150
M=D // 9151
@31 // 9152
D=A // 9153
@SP // 9154
AM=M+1 // 9155
A=A-1 // 9156
M=D // 9157
@3 // 9158
D=A // 9159
@SP // 9160
AM=M+1 // 9161
A=A-1 // 9162
M=D // 9163
@3 // 9164
D=A // 9165
@SP // 9166
AM=M+1 // 9167
A=A-1 // 9168
M=D // 9169
@3 // 9170
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
@SP // 9182
AM=M+1 // 9183
A=A-1 // 9184
M=0 // 9185
@SP // 9186
AM=M+1 // 9187
A=A-1 // 9188
M=0 // 9189
// call Output.create
@17 // 9190
D=A // 9191
@14 // 9192
M=D // 9193
@Output.create // 9194
D=A // 9195
@13 // 9196
M=D // 9197
@Output.initMap.ret.50 // 9198
D=A // 9199
@CALL // 9200
0;JMP // 9201
(Output.initMap.ret.50)
@SP // 9202
M=M-1 // 9203

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9204
D=A // 9205
@SP // 9206
AM=M+1 // 9207
A=A-1 // 9208
M=D // 9209
@30 // 9210
D=A // 9211
@SP // 9212
AM=M+1 // 9213
A=A-1 // 9214
M=D // 9215
@51 // 9216
D=A // 9217
@SP // 9218
AM=M+1 // 9219
A=A-1 // 9220
M=D // 9221
@51 // 9222
D=A // 9223
@SP // 9224
AM=M+1 // 9225
A=A-1 // 9226
M=D // 9227
@51 // 9228
D=A // 9229
@SP // 9230
AM=M+1 // 9231
A=A-1 // 9232
M=D // 9233
@51 // 9234
D=A // 9235
@SP // 9236
AM=M+1 // 9237
A=A-1 // 9238
M=D // 9239
@51 // 9240
D=A // 9241
@SP // 9242
AM=M+1 // 9243
A=A-1 // 9244
M=D // 9245
@63 // 9246
D=A // 9247
@SP // 9248
AM=M+1 // 9249
A=A-1 // 9250
M=D // 9251
@59 // 9252
D=A // 9253
@SP // 9254
AM=M+1 // 9255
A=A-1 // 9256
M=D // 9257
@30 // 9258
D=A // 9259
@SP // 9260
AM=M+1 // 9261
A=A-1 // 9262
M=D // 9263
@48 // 9264
D=A // 9265
@SP // 9266
AM=M+1 // 9267
A=A-1 // 9268
M=D // 9269
@SP // 9270
AM=M+1 // 9271
A=A-1 // 9272
M=0 // 9273
// call Output.create
@17 // 9274
D=A // 9275
@14 // 9276
M=D // 9277
@Output.create // 9278
D=A // 9279
@13 // 9280
M=D // 9281
@Output.initMap.ret.51 // 9282
D=A // 9283
@CALL // 9284
0;JMP // 9285
(Output.initMap.ret.51)
@SP // 9286
M=M-1 // 9287

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9288
D=A // 9289
@SP // 9290
AM=M+1 // 9291
A=A-1 // 9292
M=D // 9293
@31 // 9294
D=A // 9295
@SP // 9296
AM=M+1 // 9297
A=A-1 // 9298
M=D // 9299
@51 // 9300
D=A // 9301
@SP // 9302
AM=M+1 // 9303
A=A-1 // 9304
M=D // 9305
@51 // 9306
D=A // 9307
@SP // 9308
AM=M+1 // 9309
A=A-1 // 9310
M=D // 9311
@51 // 9312
D=A // 9313
@SP // 9314
AM=M+1 // 9315
A=A-1 // 9316
M=D // 9317
@31 // 9318
D=A // 9319
@SP // 9320
AM=M+1 // 9321
A=A-1 // 9322
M=D // 9323
@27 // 9324
D=A // 9325
@SP // 9326
AM=M+1 // 9327
A=A-1 // 9328
M=D // 9329
@51 // 9330
D=A // 9331
@SP // 9332
AM=M+1 // 9333
A=A-1 // 9334
M=D // 9335
@51 // 9336
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
@SP // 9348
AM=M+1 // 9349
A=A-1 // 9350
M=0 // 9351
@SP // 9352
AM=M+1 // 9353
A=A-1 // 9354
M=0 // 9355
// call Output.create
@17 // 9356
D=A // 9357
@14 // 9358
M=D // 9359
@Output.create // 9360
D=A // 9361
@13 // 9362
M=D // 9363
@Output.initMap.ret.52 // 9364
D=A // 9365
@CALL // 9366
0;JMP // 9367
(Output.initMap.ret.52)
@SP // 9368
M=M-1 // 9369

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9370
D=A // 9371
@SP // 9372
AM=M+1 // 9373
A=A-1 // 9374
M=D // 9375
@30 // 9376
D=A // 9377
@SP // 9378
AM=M+1 // 9379
A=A-1 // 9380
M=D // 9381
@51 // 9382
D=A // 9383
@SP // 9384
AM=M+1 // 9385
A=A-1 // 9386
M=D // 9387
@51 // 9388
D=A // 9389
@SP // 9390
AM=M+1 // 9391
A=A-1 // 9392
M=D // 9393
@6 // 9394
D=A // 9395
@SP // 9396
AM=M+1 // 9397
A=A-1 // 9398
M=D // 9399
@28 // 9400
D=A // 9401
@SP // 9402
AM=M+1 // 9403
A=A-1 // 9404
M=D // 9405
@48 // 9406
D=A // 9407
@SP // 9408
AM=M+1 // 9409
A=A-1 // 9410
M=D // 9411
@51 // 9412
D=A // 9413
@SP // 9414
AM=M+1 // 9415
A=A-1 // 9416
M=D // 9417
@51 // 9418
D=A // 9419
@SP // 9420
AM=M+1 // 9421
A=A-1 // 9422
M=D // 9423
@30 // 9424
D=A // 9425
@SP // 9426
AM=M+1 // 9427
A=A-1 // 9428
M=D // 9429
@SP // 9430
AM=M+1 // 9431
A=A-1 // 9432
M=0 // 9433
@SP // 9434
AM=M+1 // 9435
A=A-1 // 9436
M=0 // 9437
// call Output.create
@17 // 9438
D=A // 9439
@14 // 9440
M=D // 9441
@Output.create // 9442
D=A // 9443
@13 // 9444
M=D // 9445
@Output.initMap.ret.53 // 9446
D=A // 9447
@CALL // 9448
0;JMP // 9449
(Output.initMap.ret.53)
@SP // 9450
M=M-1 // 9451

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9452
D=A // 9453
@SP // 9454
AM=M+1 // 9455
A=A-1 // 9456
M=D // 9457
@63 // 9458
D=A // 9459
@SP // 9460
AM=M+1 // 9461
A=A-1 // 9462
M=D // 9463
@63 // 9464
D=A // 9465
@SP // 9466
AM=M+1 // 9467
A=A-1 // 9468
M=D // 9469
@45 // 9470
D=A // 9471
@SP // 9472
AM=M+1 // 9473
A=A-1 // 9474
M=D // 9475
@12 // 9476
D=A // 9477
@SP // 9478
AM=M+1 // 9479
A=A-1 // 9480
M=D // 9481
@12 // 9482
D=A // 9483
@SP // 9484
AM=M+1 // 9485
A=A-1 // 9486
M=D // 9487
@12 // 9488
D=A // 9489
@SP // 9490
AM=M+1 // 9491
A=A-1 // 9492
M=D // 9493
@12 // 9494
D=A // 9495
@SP // 9496
AM=M+1 // 9497
A=A-1 // 9498
M=D // 9499
@12 // 9500
D=A // 9501
@SP // 9502
AM=M+1 // 9503
A=A-1 // 9504
M=D // 9505
@30 // 9506
D=A // 9507
@SP // 9508
AM=M+1 // 9509
A=A-1 // 9510
M=D // 9511
@SP // 9512
AM=M+1 // 9513
A=A-1 // 9514
M=0 // 9515
@SP // 9516
AM=M+1 // 9517
A=A-1 // 9518
M=0 // 9519
// call Output.create
@17 // 9520
D=A // 9521
@14 // 9522
M=D // 9523
@Output.create // 9524
D=A // 9525
@13 // 9526
M=D // 9527
@Output.initMap.ret.54 // 9528
D=A // 9529
@CALL // 9530
0;JMP // 9531
(Output.initMap.ret.54)
@SP // 9532
M=M-1 // 9533

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9534
D=A // 9535
@SP // 9536
AM=M+1 // 9537
A=A-1 // 9538
M=D // 9539
@51 // 9540
D=A // 9541
@SP // 9542
AM=M+1 // 9543
A=A-1 // 9544
M=D // 9545
@51 // 9546
D=A // 9547
@SP // 9548
AM=M+1 // 9549
A=A-1 // 9550
M=D // 9551
@51 // 9552
D=A // 9553
@SP // 9554
AM=M+1 // 9555
A=A-1 // 9556
M=D // 9557
@51 // 9558
D=A // 9559
@SP // 9560
AM=M+1 // 9561
A=A-1 // 9562
M=D // 9563
@51 // 9564
D=A // 9565
@SP // 9566
AM=M+1 // 9567
A=A-1 // 9568
M=D // 9569
@51 // 9570
D=A // 9571
@SP // 9572
AM=M+1 // 9573
A=A-1 // 9574
M=D // 9575
@51 // 9576
D=A // 9577
@SP // 9578
AM=M+1 // 9579
A=A-1 // 9580
M=D // 9581
@51 // 9582
D=A // 9583
@SP // 9584
AM=M+1 // 9585
A=A-1 // 9586
M=D // 9587
@30 // 9588
D=A // 9589
@SP // 9590
AM=M+1 // 9591
A=A-1 // 9592
M=D // 9593
@SP // 9594
AM=M+1 // 9595
A=A-1 // 9596
M=0 // 9597
@SP // 9598
AM=M+1 // 9599
A=A-1 // 9600
M=0 // 9601
// call Output.create
@17 // 9602
D=A // 9603
@14 // 9604
M=D // 9605
@Output.create // 9606
D=A // 9607
@13 // 9608
M=D // 9609
@Output.initMap.ret.55 // 9610
D=A // 9611
@CALL // 9612
0;JMP // 9613
(Output.initMap.ret.55)
@SP // 9614
M=M-1 // 9615

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9616
D=A // 9617
@SP // 9618
AM=M+1 // 9619
A=A-1 // 9620
M=D // 9621
@51 // 9622
D=A // 9623
@SP // 9624
AM=M+1 // 9625
A=A-1 // 9626
M=D // 9627
@51 // 9628
D=A // 9629
@SP // 9630
AM=M+1 // 9631
A=A-1 // 9632
M=D // 9633
@51 // 9634
D=A // 9635
@SP // 9636
AM=M+1 // 9637
A=A-1 // 9638
M=D // 9639
@51 // 9640
D=A // 9641
@SP // 9642
AM=M+1 // 9643
A=A-1 // 9644
M=D // 9645
@51 // 9646
D=A // 9647
@SP // 9648
AM=M+1 // 9649
A=A-1 // 9650
M=D // 9651
@30 // 9652
D=A // 9653
@SP // 9654
AM=M+1 // 9655
A=A-1 // 9656
M=D // 9657
@30 // 9658
D=A // 9659
@SP // 9660
AM=M+1 // 9661
A=A-1 // 9662
M=D // 9663
@12 // 9664
D=A // 9665
@SP // 9666
AM=M+1 // 9667
A=A-1 // 9668
M=D // 9669
@12 // 9670
D=A // 9671
@SP // 9672
AM=M+1 // 9673
A=A-1 // 9674
M=D // 9675
@SP // 9676
AM=M+1 // 9677
A=A-1 // 9678
M=0 // 9679
@SP // 9680
AM=M+1 // 9681
A=A-1 // 9682
M=0 // 9683
// call Output.create
@17 // 9684
D=A // 9685
@14 // 9686
M=D // 9687
@Output.create // 9688
D=A // 9689
@13 // 9690
M=D // 9691
@Output.initMap.ret.56 // 9692
D=A // 9693
@CALL // 9694
0;JMP // 9695
(Output.initMap.ret.56)
@SP // 9696
M=M-1 // 9697

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 9698
D=A // 9699
@SP // 9700
AM=M+1 // 9701
A=A-1 // 9702
M=D // 9703
@51 // 9704
D=A // 9705
@SP // 9706
AM=M+1 // 9707
A=A-1 // 9708
M=D // 9709
@51 // 9710
D=A // 9711
@SP // 9712
AM=M+1 // 9713
A=A-1 // 9714
M=D // 9715
@51 // 9716
D=A // 9717
@SP // 9718
AM=M+1 // 9719
A=A-1 // 9720
M=D // 9721
@51 // 9722
D=A // 9723
@SP // 9724
AM=M+1 // 9725
A=A-1 // 9726
M=D // 9727
@51 // 9728
D=A // 9729
@SP // 9730
AM=M+1 // 9731
A=A-1 // 9732
M=D // 9733
@63 // 9734
D=A // 9735
@SP // 9736
AM=M+1 // 9737
A=A-1 // 9738
M=D // 9739
@63 // 9740
D=A // 9741
@SP // 9742
AM=M+1 // 9743
A=A-1 // 9744
M=D // 9745
@63 // 9746
D=A // 9747
@SP // 9748
AM=M+1 // 9749
A=A-1 // 9750
M=D // 9751
@18 // 9752
D=A // 9753
@SP // 9754
AM=M+1 // 9755
A=A-1 // 9756
M=D // 9757
@SP // 9758
AM=M+1 // 9759
A=A-1 // 9760
M=0 // 9761
@SP // 9762
AM=M+1 // 9763
A=A-1 // 9764
M=0 // 9765
// call Output.create
@17 // 9766
D=A // 9767
@14 // 9768
M=D // 9769
@Output.create // 9770
D=A // 9771
@13 // 9772
M=D // 9773
@Output.initMap.ret.57 // 9774
D=A // 9775
@CALL // 9776
0;JMP // 9777
(Output.initMap.ret.57)
@SP // 9778
M=M-1 // 9779

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 9780
D=A // 9781
@SP // 9782
AM=M+1 // 9783
A=A-1 // 9784
M=D // 9785
@51 // 9786
D=A // 9787
@SP // 9788
AM=M+1 // 9789
A=A-1 // 9790
M=D // 9791
@51 // 9792
D=A // 9793
@SP // 9794
AM=M+1 // 9795
A=A-1 // 9796
M=D // 9797
@30 // 9798
D=A // 9799
@SP // 9800
AM=M+1 // 9801
A=A-1 // 9802
M=D // 9803
@30 // 9804
D=A // 9805
@SP // 9806
AM=M+1 // 9807
A=A-1 // 9808
M=D // 9809
@12 // 9810
D=A // 9811
@SP // 9812
AM=M+1 // 9813
A=A-1 // 9814
M=D // 9815
@30 // 9816
D=A // 9817
@SP // 9818
AM=M+1 // 9819
A=A-1 // 9820
M=D // 9821
@30 // 9822
D=A // 9823
@SP // 9824
AM=M+1 // 9825
A=A-1 // 9826
M=D // 9827
@51 // 9828
D=A // 9829
@SP // 9830
AM=M+1 // 9831
A=A-1 // 9832
M=D // 9833
@51 // 9834
D=A // 9835
@SP // 9836
AM=M+1 // 9837
A=A-1 // 9838
M=D // 9839
@SP // 9840
AM=M+1 // 9841
A=A-1 // 9842
M=0 // 9843
@SP // 9844
AM=M+1 // 9845
A=A-1 // 9846
M=0 // 9847
// call Output.create
@17 // 9848
D=A // 9849
@14 // 9850
M=D // 9851
@Output.create // 9852
D=A // 9853
@13 // 9854
M=D // 9855
@Output.initMap.ret.58 // 9856
D=A // 9857
@CALL // 9858
0;JMP // 9859
(Output.initMap.ret.58)
@SP // 9860
M=M-1 // 9861

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 9862
D=A // 9863
@SP // 9864
AM=M+1 // 9865
A=A-1 // 9866
M=D // 9867
@51 // 9868
D=A // 9869
@SP // 9870
AM=M+1 // 9871
A=A-1 // 9872
M=D // 9873
@51 // 9874
D=A // 9875
@SP // 9876
AM=M+1 // 9877
A=A-1 // 9878
M=D // 9879
@51 // 9880
D=A // 9881
@SP // 9882
AM=M+1 // 9883
A=A-1 // 9884
M=D // 9885
@51 // 9886
D=A // 9887
@SP // 9888
AM=M+1 // 9889
A=A-1 // 9890
M=D // 9891
@30 // 9892
D=A // 9893
@SP // 9894
AM=M+1 // 9895
A=A-1 // 9896
M=D // 9897
@12 // 9898
D=A // 9899
@SP // 9900
AM=M+1 // 9901
A=A-1 // 9902
M=D // 9903
@12 // 9904
D=A // 9905
@SP // 9906
AM=M+1 // 9907
A=A-1 // 9908
M=D // 9909
@12 // 9910
D=A // 9911
@SP // 9912
AM=M+1 // 9913
A=A-1 // 9914
M=D // 9915
@30 // 9916
D=A // 9917
@SP // 9918
AM=M+1 // 9919
A=A-1 // 9920
M=D // 9921
@SP // 9922
AM=M+1 // 9923
A=A-1 // 9924
M=0 // 9925
@SP // 9926
AM=M+1 // 9927
A=A-1 // 9928
M=0 // 9929
// call Output.create
@17 // 9930
D=A // 9931
@14 // 9932
M=D // 9933
@Output.create // 9934
D=A // 9935
@13 // 9936
M=D // 9937
@Output.initMap.ret.59 // 9938
D=A // 9939
@CALL // 9940
0;JMP // 9941
(Output.initMap.ret.59)
@SP // 9942
M=M-1 // 9943

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 9944
D=A // 9945
@SP // 9946
AM=M+1 // 9947
A=A-1 // 9948
M=D // 9949
@63 // 9950
D=A // 9951
@SP // 9952
AM=M+1 // 9953
A=A-1 // 9954
M=D // 9955
@51 // 9956
D=A // 9957
@SP // 9958
AM=M+1 // 9959
A=A-1 // 9960
M=D // 9961
@49 // 9962
D=A // 9963
@SP // 9964
AM=M+1 // 9965
A=A-1 // 9966
M=D // 9967
@24 // 9968
D=A // 9969
@SP // 9970
AM=M+1 // 9971
A=A-1 // 9972
M=D // 9973
@12 // 9974
D=A // 9975
@SP // 9976
AM=M+1 // 9977
A=A-1 // 9978
M=D // 9979
@6 // 9980
D=A // 9981
@SP // 9982
AM=M+1 // 9983
A=A-1 // 9984
M=D // 9985
@35 // 9986
D=A // 9987
@SP // 9988
AM=M+1 // 9989
A=A-1 // 9990
M=D // 9991
@51 // 9992
D=A // 9993
@SP // 9994
AM=M+1 // 9995
A=A-1 // 9996
M=D // 9997
@63 // 9998
D=A // 9999
@SP // 10000
AM=M+1 // 10001
A=A-1 // 10002
M=D // 10003
@SP // 10004
AM=M+1 // 10005
A=A-1 // 10006
M=0 // 10007
@SP // 10008
AM=M+1 // 10009
A=A-1 // 10010
M=0 // 10011
// call Output.create
@17 // 10012
D=A // 10013
@14 // 10014
M=D // 10015
@Output.create // 10016
D=A // 10017
@13 // 10018
M=D // 10019
@Output.initMap.ret.60 // 10020
D=A // 10021
@CALL // 10022
0;JMP // 10023
(Output.initMap.ret.60)
@SP // 10024
M=M-1 // 10025

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10026
D=A // 10027
@SP // 10028
AM=M+1 // 10029
A=A-1 // 10030
M=D // 10031
@30 // 10032
D=A // 10033
@SP // 10034
AM=M+1 // 10035
A=A-1 // 10036
M=D // 10037
@6 // 10038
D=A // 10039
@SP // 10040
AM=M+1 // 10041
A=A-1 // 10042
M=D // 10043
@6 // 10044
D=A // 10045
@SP // 10046
AM=M+1 // 10047
A=A-1 // 10048
M=D // 10049
@6 // 10050
D=A // 10051
@SP // 10052
AM=M+1 // 10053
A=A-1 // 10054
M=D // 10055
@6 // 10056
D=A // 10057
@SP // 10058
AM=M+1 // 10059
A=A-1 // 10060
M=D // 10061
@6 // 10062
D=A // 10063
@SP // 10064
AM=M+1 // 10065
A=A-1 // 10066
M=D // 10067
@6 // 10068
D=A // 10069
@SP // 10070
AM=M+1 // 10071
A=A-1 // 10072
M=D // 10073
@6 // 10074
D=A // 10075
@SP // 10076
AM=M+1 // 10077
A=A-1 // 10078
M=D // 10079
@30 // 10080
D=A // 10081
@SP // 10082
AM=M+1 // 10083
A=A-1 // 10084
M=D // 10085
@SP // 10086
AM=M+1 // 10087
A=A-1 // 10088
M=0 // 10089
@SP // 10090
AM=M+1 // 10091
A=A-1 // 10092
M=0 // 10093
// call Output.create
@17 // 10094
D=A // 10095
@14 // 10096
M=D // 10097
@Output.create // 10098
D=A // 10099
@13 // 10100
M=D // 10101
@Output.initMap.ret.61 // 10102
D=A // 10103
@CALL // 10104
0;JMP // 10105
(Output.initMap.ret.61)
@SP // 10106
M=M-1 // 10107

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@92 // 10108
D=A // 10109
@SP // 10110
AM=M+1 // 10111
A=A-1 // 10112
M=D // 10113
@SP // 10114
AM=M+1 // 10115
A=A-1 // 10116
M=0 // 10117
@SP // 10118
AM=M+1 // 10119
A=A-1 // 10120
M=0 // 10121
@SP // 10122
AM=M+1 // 10123
A=A-1 // 10124
M=1 // 10125
@3 // 10126
D=A // 10127
@SP // 10128
AM=M+1 // 10129
A=A-1 // 10130
M=D // 10131
@6 // 10132
D=A // 10133
@SP // 10134
AM=M+1 // 10135
A=A-1 // 10136
M=D // 10137
@12 // 10138
D=A // 10139
@SP // 10140
AM=M+1 // 10141
A=A-1 // 10142
M=D // 10143
@24 // 10144
D=A // 10145
@SP // 10146
AM=M+1 // 10147
A=A-1 // 10148
M=D // 10149
@48 // 10150
D=A // 10151
@SP // 10152
AM=M+1 // 10153
A=A-1 // 10154
M=D // 10155
@32 // 10156
D=A // 10157
@SP // 10158
AM=M+1 // 10159
A=A-1 // 10160
M=D // 10161
@SP // 10162
AM=M+1 // 10163
A=A-1 // 10164
M=0 // 10165
@SP // 10166
AM=M+1 // 10167
A=A-1 // 10168
M=0 // 10169
// call Output.create
@17 // 10170
D=A // 10171
@14 // 10172
M=D // 10173
@Output.create // 10174
D=A // 10175
@13 // 10176
M=D // 10177
@Output.initMap.ret.62 // 10178
D=A // 10179
@CALL // 10180
0;JMP // 10181
(Output.initMap.ret.62)
@SP // 10182
M=M-1 // 10183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10184
D=A // 10185
@SP // 10186
AM=M+1 // 10187
A=A-1 // 10188
M=D // 10189
@30 // 10190
D=A // 10191
@SP // 10192
AM=M+1 // 10193
A=A-1 // 10194
M=D // 10195
@24 // 10196
D=A // 10197
@SP // 10198
AM=M+1 // 10199
A=A-1 // 10200
M=D // 10201
@24 // 10202
D=A // 10203
@SP // 10204
AM=M+1 // 10205
A=A-1 // 10206
M=D // 10207
@24 // 10208
D=A // 10209
@SP // 10210
AM=M+1 // 10211
A=A-1 // 10212
M=D // 10213
@24 // 10214
D=A // 10215
@SP // 10216
AM=M+1 // 10217
A=A-1 // 10218
M=D // 10219
@24 // 10220
D=A // 10221
@SP // 10222
AM=M+1 // 10223
A=A-1 // 10224
M=D // 10225
@24 // 10226
D=A // 10227
@SP // 10228
AM=M+1 // 10229
A=A-1 // 10230
M=D // 10231
@24 // 10232
D=A // 10233
@SP // 10234
AM=M+1 // 10235
A=A-1 // 10236
M=D // 10237
@30 // 10238
D=A // 10239
@SP // 10240
AM=M+1 // 10241
A=A-1 // 10242
M=D // 10243
@SP // 10244
AM=M+1 // 10245
A=A-1 // 10246
M=0 // 10247
@SP // 10248
AM=M+1 // 10249
A=A-1 // 10250
M=0 // 10251
// call Output.create
@17 // 10252
D=A // 10253
@14 // 10254
M=D // 10255
@Output.create // 10256
D=A // 10257
@13 // 10258
M=D // 10259
@Output.initMap.ret.63 // 10260
D=A // 10261
@CALL // 10262
0;JMP // 10263
(Output.initMap.ret.63)
@SP // 10264
M=M-1 // 10265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10266
D=A // 10267
@SP // 10268
AM=M+1 // 10269
A=A-1 // 10270
M=D // 10271
@8 // 10272
D=A // 10273
@SP // 10274
AM=M+1 // 10275
A=A-1 // 10276
M=D // 10277
@28 // 10278
D=A // 10279
@SP // 10280
AM=M+1 // 10281
A=A-1 // 10282
M=D // 10283
@54 // 10284
D=A // 10285
@SP // 10286
AM=M+1 // 10287
A=A-1 // 10288
M=D // 10289
@SP // 10290
AM=M+1 // 10291
A=A-1 // 10292
M=0 // 10293
@SP // 10294
AM=M+1 // 10295
A=A-1 // 10296
M=0 // 10297
@SP // 10298
AM=M+1 // 10299
A=A-1 // 10300
M=0 // 10301
@SP // 10302
AM=M+1 // 10303
A=A-1 // 10304
M=0 // 10305
@SP // 10306
AM=M+1 // 10307
A=A-1 // 10308
M=0 // 10309
@SP // 10310
AM=M+1 // 10311
A=A-1 // 10312
M=0 // 10313
@SP // 10314
AM=M+1 // 10315
A=A-1 // 10316
M=0 // 10317
@SP // 10318
AM=M+1 // 10319
A=A-1 // 10320
M=0 // 10321
// call Output.create
@17 // 10322
D=A // 10323
@14 // 10324
M=D // 10325
@Output.create // 10326
D=A // 10327
@13 // 10328
M=D // 10329
@Output.initMap.ret.64 // 10330
D=A // 10331
@CALL // 10332
0;JMP // 10333
(Output.initMap.ret.64)
@SP // 10334
M=M-1 // 10335

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@95 // 10336
D=A // 10337
@SP // 10338
AM=M+1 // 10339
A=A-1 // 10340
M=D // 10341
@SP // 10342
AM=M+1 // 10343
A=A-1 // 10344
M=0 // 10345
@SP // 10346
AM=M+1 // 10347
A=A-1 // 10348
M=0 // 10349
@SP // 10350
AM=M+1 // 10351
A=A-1 // 10352
M=0 // 10353
@SP // 10354
AM=M+1 // 10355
A=A-1 // 10356
M=0 // 10357
@SP // 10358
AM=M+1 // 10359
A=A-1 // 10360
M=0 // 10361
@SP // 10362
AM=M+1 // 10363
A=A-1 // 10364
M=0 // 10365
@SP // 10366
AM=M+1 // 10367
A=A-1 // 10368
M=0 // 10369
@SP // 10370
AM=M+1 // 10371
A=A-1 // 10372
M=0 // 10373
@SP // 10374
AM=M+1 // 10375
A=A-1 // 10376
M=0 // 10377
@63 // 10378
D=A // 10379
@SP // 10380
AM=M+1 // 10381
A=A-1 // 10382
M=D // 10383
@SP // 10384
AM=M+1 // 10385
A=A-1 // 10386
M=0 // 10387
// call Output.create
@17 // 10388
D=A // 10389
@14 // 10390
M=D // 10391
@Output.create // 10392
D=A // 10393
@13 // 10394
M=D // 10395
@Output.initMap.ret.65 // 10396
D=A // 10397
@CALL // 10398
0;JMP // 10399
(Output.initMap.ret.65)
@SP // 10400
M=M-1 // 10401

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10402
D=A // 10403
@SP // 10404
AM=M+1 // 10405
A=A-1 // 10406
M=D // 10407
@6 // 10408
D=A // 10409
@SP // 10410
AM=M+1 // 10411
A=A-1 // 10412
M=D // 10413
@12 // 10414
D=A // 10415
@SP // 10416
AM=M+1 // 10417
A=A-1 // 10418
M=D // 10419
@24 // 10420
D=A // 10421
@SP // 10422
AM=M+1 // 10423
A=A-1 // 10424
M=D // 10425
@SP // 10426
AM=M+1 // 10427
A=A-1 // 10428
M=0 // 10429
@SP // 10430
AM=M+1 // 10431
A=A-1 // 10432
M=0 // 10433
@SP // 10434
AM=M+1 // 10435
A=A-1 // 10436
M=0 // 10437
@SP // 10438
AM=M+1 // 10439
A=A-1 // 10440
M=0 // 10441
@SP // 10442
AM=M+1 // 10443
A=A-1 // 10444
M=0 // 10445
@SP // 10446
AM=M+1 // 10447
A=A-1 // 10448
M=0 // 10449
@SP // 10450
AM=M+1 // 10451
A=A-1 // 10452
M=0 // 10453
@SP // 10454
AM=M+1 // 10455
A=A-1 // 10456
M=0 // 10457
// call Output.create
@17 // 10458
D=A // 10459
@14 // 10460
M=D // 10461
@Output.create // 10462
D=A // 10463
@13 // 10464
M=D // 10465
@Output.initMap.ret.66 // 10466
D=A // 10467
@CALL // 10468
0;JMP // 10469
(Output.initMap.ret.66)
@SP // 10470
M=M-1 // 10471

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@97 // 10472
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
@SP // 10486
AM=M+1 // 10487
A=A-1 // 10488
M=0 // 10489
@14 // 10490
D=A // 10491
@SP // 10492
AM=M+1 // 10493
A=A-1 // 10494
M=D // 10495
@24 // 10496
D=A // 10497
@SP // 10498
AM=M+1 // 10499
A=A-1 // 10500
M=D // 10501
@30 // 10502
D=A // 10503
@SP // 10504
AM=M+1 // 10505
A=A-1 // 10506
M=D // 10507
@27 // 10508
D=A // 10509
@SP // 10510
AM=M+1 // 10511
A=A-1 // 10512
M=D // 10513
@27 // 10514
D=A // 10515
@SP // 10516
AM=M+1 // 10517
A=A-1 // 10518
M=D // 10519
@54 // 10520
D=A // 10521
@SP // 10522
AM=M+1 // 10523
A=A-1 // 10524
M=D // 10525
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=0 // 10529
@SP // 10530
AM=M+1 // 10531
A=A-1 // 10532
M=0 // 10533
// call Output.create
@17 // 10534
D=A // 10535
@14 // 10536
M=D // 10537
@Output.create // 10538
D=A // 10539
@13 // 10540
M=D // 10541
@Output.initMap.ret.67 // 10542
D=A // 10543
@CALL // 10544
0;JMP // 10545
(Output.initMap.ret.67)
@SP // 10546
M=M-1 // 10547

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10548
D=A // 10549
@SP // 10550
AM=M+1 // 10551
A=A-1 // 10552
M=D // 10553
@3 // 10554
D=A // 10555
@SP // 10556
AM=M+1 // 10557
A=A-1 // 10558
M=D // 10559
@3 // 10560
D=A // 10561
@SP // 10562
AM=M+1 // 10563
A=A-1 // 10564
M=D // 10565
@3 // 10566
D=A // 10567
@SP // 10568
AM=M+1 // 10569
A=A-1 // 10570
M=D // 10571
@15 // 10572
D=A // 10573
@SP // 10574
AM=M+1 // 10575
A=A-1 // 10576
M=D // 10577
@27 // 10578
D=A // 10579
@SP // 10580
AM=M+1 // 10581
A=A-1 // 10582
M=D // 10583
@51 // 10584
D=A // 10585
@SP // 10586
AM=M+1 // 10587
A=A-1 // 10588
M=D // 10589
@51 // 10590
D=A // 10591
@SP // 10592
AM=M+1 // 10593
A=A-1 // 10594
M=D // 10595
@51 // 10596
D=A // 10597
@SP // 10598
AM=M+1 // 10599
A=A-1 // 10600
M=D // 10601
@30 // 10602
D=A // 10603
@SP // 10604
AM=M+1 // 10605
A=A-1 // 10606
M=D // 10607
@SP // 10608
AM=M+1 // 10609
A=A-1 // 10610
M=0 // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=0 // 10615
// call Output.create
@17 // 10616
D=A // 10617
@14 // 10618
M=D // 10619
@Output.create // 10620
D=A // 10621
@13 // 10622
M=D // 10623
@Output.initMap.ret.68 // 10624
D=A // 10625
@CALL // 10626
0;JMP // 10627
(Output.initMap.ret.68)
@SP // 10628
M=M-1 // 10629

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@99 // 10630
D=A // 10631
@SP // 10632
AM=M+1 // 10633
A=A-1 // 10634
M=D // 10635
@SP // 10636
AM=M+1 // 10637
A=A-1 // 10638
M=0 // 10639
@SP // 10640
AM=M+1 // 10641
A=A-1 // 10642
M=0 // 10643
@SP // 10644
AM=M+1 // 10645
A=A-1 // 10646
M=0 // 10647
@30 // 10648
D=A // 10649
@SP // 10650
AM=M+1 // 10651
A=A-1 // 10652
M=D // 10653
@51 // 10654
D=A // 10655
@SP // 10656
AM=M+1 // 10657
A=A-1 // 10658
M=D // 10659
@3 // 10660
D=A // 10661
@SP // 10662
AM=M+1 // 10663
A=A-1 // 10664
M=D // 10665
@3 // 10666
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
@30 // 10678
D=A // 10679
@SP // 10680
AM=M+1 // 10681
A=A-1 // 10682
M=D // 10683
@SP // 10684
AM=M+1 // 10685
A=A-1 // 10686
M=0 // 10687
@SP // 10688
AM=M+1 // 10689
A=A-1 // 10690
M=0 // 10691
// call Output.create
@17 // 10692
D=A // 10693
@14 // 10694
M=D // 10695
@Output.create // 10696
D=A // 10697
@13 // 10698
M=D // 10699
@Output.initMap.ret.69 // 10700
D=A // 10701
@CALL // 10702
0;JMP // 10703
(Output.initMap.ret.69)
@SP // 10704
M=M-1 // 10705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 10706
D=A // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=D // 10711
@48 // 10712
D=A // 10713
@SP // 10714
AM=M+1 // 10715
A=A-1 // 10716
M=D // 10717
@48 // 10718
D=A // 10719
@SP // 10720
AM=M+1 // 10721
A=A-1 // 10722
M=D // 10723
@48 // 10724
D=A // 10725
@SP // 10726
AM=M+1 // 10727
A=A-1 // 10728
M=D // 10729
@60 // 10730
D=A // 10731
@SP // 10732
AM=M+1 // 10733
A=A-1 // 10734
M=D // 10735
@54 // 10736
D=A // 10737
@SP // 10738
AM=M+1 // 10739
A=A-1 // 10740
M=D // 10741
@51 // 10742
D=A // 10743
@SP // 10744
AM=M+1 // 10745
A=A-1 // 10746
M=D // 10747
@51 // 10748
D=A // 10749
@SP // 10750
AM=M+1 // 10751
A=A-1 // 10752
M=D // 10753
@51 // 10754
D=A // 10755
@SP // 10756
AM=M+1 // 10757
A=A-1 // 10758
M=D // 10759
@30 // 10760
D=A // 10761
@SP // 10762
AM=M+1 // 10763
A=A-1 // 10764
M=D // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=0 // 10769
@SP // 10770
AM=M+1 // 10771
A=A-1 // 10772
M=0 // 10773
// call Output.create
@17 // 10774
D=A // 10775
@14 // 10776
M=D // 10777
@Output.create // 10778
D=A // 10779
@13 // 10780
M=D // 10781
@Output.initMap.ret.70 // 10782
D=A // 10783
@CALL // 10784
0;JMP // 10785
(Output.initMap.ret.70)
@SP // 10786
M=M-1 // 10787

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@101 // 10788
D=A // 10789
@SP // 10790
AM=M+1 // 10791
A=A-1 // 10792
M=D // 10793
@SP // 10794
AM=M+1 // 10795
A=A-1 // 10796
M=0 // 10797
@SP // 10798
AM=M+1 // 10799
A=A-1 // 10800
M=0 // 10801
@SP // 10802
AM=M+1 // 10803
A=A-1 // 10804
M=0 // 10805
@30 // 10806
D=A // 10807
@SP // 10808
AM=M+1 // 10809
A=A-1 // 10810
M=D // 10811
@51 // 10812
D=A // 10813
@SP // 10814
AM=M+1 // 10815
A=A-1 // 10816
M=D // 10817
@63 // 10818
D=A // 10819
@SP // 10820
AM=M+1 // 10821
A=A-1 // 10822
M=D // 10823
@3 // 10824
D=A // 10825
@SP // 10826
AM=M+1 // 10827
A=A-1 // 10828
M=D // 10829
@51 // 10830
D=A // 10831
@SP // 10832
AM=M+1 // 10833
A=A-1 // 10834
M=D // 10835
@30 // 10836
D=A // 10837
@SP // 10838
AM=M+1 // 10839
A=A-1 // 10840
M=D // 10841
@SP // 10842
AM=M+1 // 10843
A=A-1 // 10844
M=0 // 10845
@SP // 10846
AM=M+1 // 10847
A=A-1 // 10848
M=0 // 10849
// call Output.create
@17 // 10850
D=A // 10851
@14 // 10852
M=D // 10853
@Output.create // 10854
D=A // 10855
@13 // 10856
M=D // 10857
@Output.initMap.ret.71 // 10858
D=A // 10859
@CALL // 10860
0;JMP // 10861
(Output.initMap.ret.71)
@SP // 10862
M=M-1 // 10863

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 10864
D=A // 10865
@SP // 10866
AM=M+1 // 10867
A=A-1 // 10868
M=D // 10869
@28 // 10870
D=A // 10871
@SP // 10872
AM=M+1 // 10873
A=A-1 // 10874
M=D // 10875
@54 // 10876
D=A // 10877
@SP // 10878
AM=M+1 // 10879
A=A-1 // 10880
M=D // 10881
@38 // 10882
D=A // 10883
@SP // 10884
AM=M+1 // 10885
A=A-1 // 10886
M=D // 10887
@6 // 10888
D=A // 10889
@SP // 10890
AM=M+1 // 10891
A=A-1 // 10892
M=D // 10893
@15 // 10894
D=A // 10895
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=D // 10899
@6 // 10900
D=A // 10901
@SP // 10902
AM=M+1 // 10903
A=A-1 // 10904
M=D // 10905
@6 // 10906
D=A // 10907
@SP // 10908
AM=M+1 // 10909
A=A-1 // 10910
M=D // 10911
@6 // 10912
D=A // 10913
@SP // 10914
AM=M+1 // 10915
A=A-1 // 10916
M=D // 10917
@15 // 10918
D=A // 10919
@SP // 10920
AM=M+1 // 10921
A=A-1 // 10922
M=D // 10923
@SP // 10924
AM=M+1 // 10925
A=A-1 // 10926
M=0 // 10927
@SP // 10928
AM=M+1 // 10929
A=A-1 // 10930
M=0 // 10931
// call Output.create
@17 // 10932
D=A // 10933
@14 // 10934
M=D // 10935
@Output.create // 10936
D=A // 10937
@13 // 10938
M=D // 10939
@Output.initMap.ret.72 // 10940
D=A // 10941
@CALL // 10942
0;JMP // 10943
(Output.initMap.ret.72)
@SP // 10944
M=M-1 // 10945

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@103 // 10946
D=A // 10947
@SP // 10948
AM=M+1 // 10949
A=A-1 // 10950
M=D // 10951
@SP // 10952
AM=M+1 // 10953
A=A-1 // 10954
M=0 // 10955
@SP // 10956
AM=M+1 // 10957
A=A-1 // 10958
M=0 // 10959
@30 // 10960
D=A // 10961
@SP // 10962
AM=M+1 // 10963
A=A-1 // 10964
M=D // 10965
@51 // 10966
D=A // 10967
@SP // 10968
AM=M+1 // 10969
A=A-1 // 10970
M=D // 10971
@51 // 10972
D=A // 10973
@SP // 10974
AM=M+1 // 10975
A=A-1 // 10976
M=D // 10977
@51 // 10978
D=A // 10979
@SP // 10980
AM=M+1 // 10981
A=A-1 // 10982
M=D // 10983
@62 // 10984
D=A // 10985
@SP // 10986
AM=M+1 // 10987
A=A-1 // 10988
M=D // 10989
@48 // 10990
D=A // 10991
@SP // 10992
AM=M+1 // 10993
A=A-1 // 10994
M=D // 10995
@51 // 10996
D=A // 10997
@SP // 10998
AM=M+1 // 10999
A=A-1 // 11000
M=D // 11001
@30 // 11002
D=A // 11003
@SP // 11004
AM=M+1 // 11005
A=A-1 // 11006
M=D // 11007
@SP // 11008
AM=M+1 // 11009
A=A-1 // 11010
M=0 // 11011
// call Output.create
@17 // 11012
D=A // 11013
@14 // 11014
M=D // 11015
@Output.create // 11016
D=A // 11017
@13 // 11018
M=D // 11019
@Output.initMap.ret.73 // 11020
D=A // 11021
@CALL // 11022
0;JMP // 11023
(Output.initMap.ret.73)
@SP // 11024
M=M-1 // 11025

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11026
D=A // 11027
@SP // 11028
AM=M+1 // 11029
A=A-1 // 11030
M=D // 11031
@3 // 11032
D=A // 11033
@SP // 11034
AM=M+1 // 11035
A=A-1 // 11036
M=D // 11037
@3 // 11038
D=A // 11039
@SP // 11040
AM=M+1 // 11041
A=A-1 // 11042
M=D // 11043
@3 // 11044
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
@55 // 11056
D=A // 11057
@SP // 11058
AM=M+1 // 11059
A=A-1 // 11060
M=D // 11061
@51 // 11062
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
@SP // 11086
AM=M+1 // 11087
A=A-1 // 11088
M=0 // 11089
@SP // 11090
AM=M+1 // 11091
A=A-1 // 11092
M=0 // 11093
// call Output.create
@17 // 11094
D=A // 11095
@14 // 11096
M=D // 11097
@Output.create // 11098
D=A // 11099
@13 // 11100
M=D // 11101
@Output.initMap.ret.74 // 11102
D=A // 11103
@CALL // 11104
0;JMP // 11105
(Output.initMap.ret.74)
@SP // 11106
M=M-1 // 11107

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11108
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
@SP // 11126
AM=M+1 // 11127
A=A-1 // 11128
M=0 // 11129
@14 // 11130
D=A // 11131
@SP // 11132
AM=M+1 // 11133
A=A-1 // 11134
M=D // 11135
@12 // 11136
D=A // 11137
@SP // 11138
AM=M+1 // 11139
A=A-1 // 11140
M=D // 11141
@12 // 11142
D=A // 11143
@SP // 11144
AM=M+1 // 11145
A=A-1 // 11146
M=D // 11147
@12 // 11148
D=A // 11149
@SP // 11150
AM=M+1 // 11151
A=A-1 // 11152
M=D // 11153
@12 // 11154
D=A // 11155
@SP // 11156
AM=M+1 // 11157
A=A-1 // 11158
M=D // 11159
@30 // 11160
D=A // 11161
@SP // 11162
AM=M+1 // 11163
A=A-1 // 11164
M=D // 11165
@SP // 11166
AM=M+1 // 11167
A=A-1 // 11168
M=0 // 11169
@SP // 11170
AM=M+1 // 11171
A=A-1 // 11172
M=0 // 11173
// call Output.create
@17 // 11174
D=A // 11175
@14 // 11176
M=D // 11177
@Output.create // 11178
D=A // 11179
@13 // 11180
M=D // 11181
@Output.initMap.ret.75 // 11182
D=A // 11183
@CALL // 11184
0;JMP // 11185
(Output.initMap.ret.75)
@SP // 11186
M=M-1 // 11187

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11188
D=A // 11189
@SP // 11190
AM=M+1 // 11191
A=A-1 // 11192
M=D // 11193
@48 // 11194
D=A // 11195
@SP // 11196
AM=M+1 // 11197
A=A-1 // 11198
M=D // 11199
@48 // 11200
D=A // 11201
@SP // 11202
AM=M+1 // 11203
A=A-1 // 11204
M=D // 11205
@SP // 11206
AM=M+1 // 11207
A=A-1 // 11208
M=0 // 11209
@56 // 11210
D=A // 11211
@SP // 11212
AM=M+1 // 11213
A=A-1 // 11214
M=D // 11215
@48 // 11216
D=A // 11217
@SP // 11218
AM=M+1 // 11219
A=A-1 // 11220
M=D // 11221
@48 // 11222
D=A // 11223
@SP // 11224
AM=M+1 // 11225
A=A-1 // 11226
M=D // 11227
@48 // 11228
D=A // 11229
@SP // 11230
AM=M+1 // 11231
A=A-1 // 11232
M=D // 11233
@48 // 11234
D=A // 11235
@SP // 11236
AM=M+1 // 11237
A=A-1 // 11238
M=D // 11239
@51 // 11240
D=A // 11241
@SP // 11242
AM=M+1 // 11243
A=A-1 // 11244
M=D // 11245
@30 // 11246
D=A // 11247
@SP // 11248
AM=M+1 // 11249
A=A-1 // 11250
M=D // 11251
@SP // 11252
AM=M+1 // 11253
A=A-1 // 11254
M=0 // 11255
// call Output.create
@17 // 11256
D=A // 11257
@14 // 11258
M=D // 11259
@Output.create // 11260
D=A // 11261
@13 // 11262
M=D // 11263
@Output.initMap.ret.76 // 11264
D=A // 11265
@CALL // 11266
0;JMP // 11267
(Output.initMap.ret.76)
@SP // 11268
M=M-1 // 11269

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11270
D=A // 11271
@SP // 11272
AM=M+1 // 11273
A=A-1 // 11274
M=D // 11275
@3 // 11276
D=A // 11277
@SP // 11278
AM=M+1 // 11279
A=A-1 // 11280
M=D // 11281
@3 // 11282
D=A // 11283
@SP // 11284
AM=M+1 // 11285
A=A-1 // 11286
M=D // 11287
@3 // 11288
D=A // 11289
@SP // 11290
AM=M+1 // 11291
A=A-1 // 11292
M=D // 11293
@51 // 11294
D=A // 11295
@SP // 11296
AM=M+1 // 11297
A=A-1 // 11298
M=D // 11299
@27 // 11300
D=A // 11301
@SP // 11302
AM=M+1 // 11303
A=A-1 // 11304
M=D // 11305
@15 // 11306
D=A // 11307
@SP // 11308
AM=M+1 // 11309
A=A-1 // 11310
M=D // 11311
@15 // 11312
D=A // 11313
@SP // 11314
AM=M+1 // 11315
A=A-1 // 11316
M=D // 11317
@27 // 11318
D=A // 11319
@SP // 11320
AM=M+1 // 11321
A=A-1 // 11322
M=D // 11323
@51 // 11324
D=A // 11325
@SP // 11326
AM=M+1 // 11327
A=A-1 // 11328
M=D // 11329
@SP // 11330
AM=M+1 // 11331
A=A-1 // 11332
M=0 // 11333
@SP // 11334
AM=M+1 // 11335
A=A-1 // 11336
M=0 // 11337
// call Output.create
@17 // 11338
D=A // 11339
@14 // 11340
M=D // 11341
@Output.create // 11342
D=A // 11343
@13 // 11344
M=D // 11345
@Output.initMap.ret.77 // 11346
D=A // 11347
@CALL // 11348
0;JMP // 11349
(Output.initMap.ret.77)
@SP // 11350
M=M-1 // 11351

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11352
D=A // 11353
@SP // 11354
AM=M+1 // 11355
A=A-1 // 11356
M=D // 11357
@14 // 11358
D=A // 11359
@SP // 11360
AM=M+1 // 11361
A=A-1 // 11362
M=D // 11363
@12 // 11364
D=A // 11365
@SP // 11366
AM=M+1 // 11367
A=A-1 // 11368
M=D // 11369
@12 // 11370
D=A // 11371
@SP // 11372
AM=M+1 // 11373
A=A-1 // 11374
M=D // 11375
@12 // 11376
D=A // 11377
@SP // 11378
AM=M+1 // 11379
A=A-1 // 11380
M=D // 11381
@12 // 11382
D=A // 11383
@SP // 11384
AM=M+1 // 11385
A=A-1 // 11386
M=D // 11387
@12 // 11388
D=A // 11389
@SP // 11390
AM=M+1 // 11391
A=A-1 // 11392
M=D // 11393
@12 // 11394
D=A // 11395
@SP // 11396
AM=M+1 // 11397
A=A-1 // 11398
M=D // 11399
@12 // 11400
D=A // 11401
@SP // 11402
AM=M+1 // 11403
A=A-1 // 11404
M=D // 11405
@30 // 11406
D=A // 11407
@SP // 11408
AM=M+1 // 11409
A=A-1 // 11410
M=D // 11411
@SP // 11412
AM=M+1 // 11413
A=A-1 // 11414
M=0 // 11415
@SP // 11416
AM=M+1 // 11417
A=A-1 // 11418
M=0 // 11419
// call Output.create
@17 // 11420
D=A // 11421
@14 // 11422
M=D // 11423
@Output.create // 11424
D=A // 11425
@13 // 11426
M=D // 11427
@Output.initMap.ret.78 // 11428
D=A // 11429
@CALL // 11430
0;JMP // 11431
(Output.initMap.ret.78)
@SP // 11432
M=M-1 // 11433

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@109 // 11434
D=A // 11435
@SP // 11436
AM=M+1 // 11437
A=A-1 // 11438
M=D // 11439
@SP // 11440
AM=M+1 // 11441
A=A-1 // 11442
M=0 // 11443
@SP // 11444
AM=M+1 // 11445
A=A-1 // 11446
M=0 // 11447
@SP // 11448
AM=M+1 // 11449
A=A-1 // 11450
M=0 // 11451
@29 // 11452
D=A // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=D // 11457
@63 // 11458
D=A // 11459
@SP // 11460
AM=M+1 // 11461
A=A-1 // 11462
M=D // 11463
@43 // 11464
D=A // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=D // 11469
@43 // 11470
D=A // 11471
@SP // 11472
AM=M+1 // 11473
A=A-1 // 11474
M=D // 11475
@43 // 11476
D=A // 11477
@SP // 11478
AM=M+1 // 11479
A=A-1 // 11480
M=D // 11481
@43 // 11482
D=A // 11483
@SP // 11484
AM=M+1 // 11485
A=A-1 // 11486
M=D // 11487
@SP // 11488
AM=M+1 // 11489
A=A-1 // 11490
M=0 // 11491
@SP // 11492
AM=M+1 // 11493
A=A-1 // 11494
M=0 // 11495
// call Output.create
@17 // 11496
D=A // 11497
@14 // 11498
M=D // 11499
@Output.create // 11500
D=A // 11501
@13 // 11502
M=D // 11503
@Output.initMap.ret.79 // 11504
D=A // 11505
@CALL // 11506
0;JMP // 11507
(Output.initMap.ret.79)
@SP // 11508
M=M-1 // 11509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@110 // 11510
D=A // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=D // 11515
@SP // 11516
AM=M+1 // 11517
A=A-1 // 11518
M=0 // 11519
@SP // 11520
AM=M+1 // 11521
A=A-1 // 11522
M=0 // 11523
@SP // 11524
AM=M+1 // 11525
A=A-1 // 11526
M=0 // 11527
@29 // 11528
D=A // 11529
@SP // 11530
AM=M+1 // 11531
A=A-1 // 11532
M=D // 11533
@51 // 11534
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
@SP // 11564
AM=M+1 // 11565
A=A-1 // 11566
M=0 // 11567
@SP // 11568
AM=M+1 // 11569
A=A-1 // 11570
M=0 // 11571
// call Output.create
@17 // 11572
D=A // 11573
@14 // 11574
M=D // 11575
@Output.create // 11576
D=A // 11577
@13 // 11578
M=D // 11579
@Output.initMap.ret.80 // 11580
D=A // 11581
@CALL // 11582
0;JMP // 11583
(Output.initMap.ret.80)
@SP // 11584
M=M-1 // 11585

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@111 // 11586
D=A // 11587
@SP // 11588
AM=M+1 // 11589
A=A-1 // 11590
M=D // 11591
@SP // 11592
AM=M+1 // 11593
A=A-1 // 11594
M=0 // 11595
@SP // 11596
AM=M+1 // 11597
A=A-1 // 11598
M=0 // 11599
@SP // 11600
AM=M+1 // 11601
A=A-1 // 11602
M=0 // 11603
@30 // 11604
D=A // 11605
@SP // 11606
AM=M+1 // 11607
A=A-1 // 11608
M=D // 11609
@51 // 11610
D=A // 11611
@SP // 11612
AM=M+1 // 11613
A=A-1 // 11614
M=D // 11615
@51 // 11616
D=A // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=D // 11621
@51 // 11622
D=A // 11623
@SP // 11624
AM=M+1 // 11625
A=A-1 // 11626
M=D // 11627
@51 // 11628
D=A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633
@30 // 11634
D=A // 11635
@SP // 11636
AM=M+1 // 11637
A=A-1 // 11638
M=D // 11639
@SP // 11640
AM=M+1 // 11641
A=A-1 // 11642
M=0 // 11643
@SP // 11644
AM=M+1 // 11645
A=A-1 // 11646
M=0 // 11647
// call Output.create
@17 // 11648
D=A // 11649
@14 // 11650
M=D // 11651
@Output.create // 11652
D=A // 11653
@13 // 11654
M=D // 11655
@Output.initMap.ret.81 // 11656
D=A // 11657
@CALL // 11658
0;JMP // 11659
(Output.initMap.ret.81)
@SP // 11660
M=M-1 // 11661

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@112 // 11662
D=A // 11663
@SP // 11664
AM=M+1 // 11665
A=A-1 // 11666
M=D // 11667
@SP // 11668
AM=M+1 // 11669
A=A-1 // 11670
M=0 // 11671
@SP // 11672
AM=M+1 // 11673
A=A-1 // 11674
M=0 // 11675
@SP // 11676
AM=M+1 // 11677
A=A-1 // 11678
M=0 // 11679
@30 // 11680
D=A // 11681
@SP // 11682
AM=M+1 // 11683
A=A-1 // 11684
M=D // 11685
@51 // 11686
D=A // 11687
@SP // 11688
AM=M+1 // 11689
A=A-1 // 11690
M=D // 11691
@51 // 11692
D=A // 11693
@SP // 11694
AM=M+1 // 11695
A=A-1 // 11696
M=D // 11697
@51 // 11698
D=A // 11699
@SP // 11700
AM=M+1 // 11701
A=A-1 // 11702
M=D // 11703
@31 // 11704
D=A // 11705
@SP // 11706
AM=M+1 // 11707
A=A-1 // 11708
M=D // 11709
@3 // 11710
D=A // 11711
@SP // 11712
AM=M+1 // 11713
A=A-1 // 11714
M=D // 11715
@3 // 11716
D=A // 11717
@SP // 11718
AM=M+1 // 11719
A=A-1 // 11720
M=D // 11721
@SP // 11722
AM=M+1 // 11723
A=A-1 // 11724
M=0 // 11725
// call Output.create
@17 // 11726
D=A // 11727
@14 // 11728
M=D // 11729
@Output.create // 11730
D=A // 11731
@13 // 11732
M=D // 11733
@Output.initMap.ret.82 // 11734
D=A // 11735
@CALL // 11736
0;JMP // 11737
(Output.initMap.ret.82)
@SP // 11738
M=M-1 // 11739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@113 // 11740
D=A // 11741
@SP // 11742
AM=M+1 // 11743
A=A-1 // 11744
M=D // 11745
@SP // 11746
AM=M+1 // 11747
A=A-1 // 11748
M=0 // 11749
@SP // 11750
AM=M+1 // 11751
A=A-1 // 11752
M=0 // 11753
@SP // 11754
AM=M+1 // 11755
A=A-1 // 11756
M=0 // 11757
@30 // 11758
D=A // 11759
@SP // 11760
AM=M+1 // 11761
A=A-1 // 11762
M=D // 11763
@51 // 11764
D=A // 11765
@SP // 11766
AM=M+1 // 11767
A=A-1 // 11768
M=D // 11769
@51 // 11770
D=A // 11771
@SP // 11772
AM=M+1 // 11773
A=A-1 // 11774
M=D // 11775
@51 // 11776
D=A // 11777
@SP // 11778
AM=M+1 // 11779
A=A-1 // 11780
M=D // 11781
@62 // 11782
D=A // 11783
@SP // 11784
AM=M+1 // 11785
A=A-1 // 11786
M=D // 11787
@48 // 11788
D=A // 11789
@SP // 11790
AM=M+1 // 11791
A=A-1 // 11792
M=D // 11793
@48 // 11794
D=A // 11795
@SP // 11796
AM=M+1 // 11797
A=A-1 // 11798
M=D // 11799
@SP // 11800
AM=M+1 // 11801
A=A-1 // 11802
M=0 // 11803
// call Output.create
@17 // 11804
D=A // 11805
@14 // 11806
M=D // 11807
@Output.create // 11808
D=A // 11809
@13 // 11810
M=D // 11811
@Output.initMap.ret.83 // 11812
D=A // 11813
@CALL // 11814
0;JMP // 11815
(Output.initMap.ret.83)
@SP // 11816
M=M-1 // 11817

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@114 // 11818
D=A // 11819
@SP // 11820
AM=M+1 // 11821
A=A-1 // 11822
M=D // 11823
@SP // 11824
AM=M+1 // 11825
A=A-1 // 11826
M=0 // 11827
@SP // 11828
AM=M+1 // 11829
A=A-1 // 11830
M=0 // 11831
@SP // 11832
AM=M+1 // 11833
A=A-1 // 11834
M=0 // 11835
@29 // 11836
D=A // 11837
@SP // 11838
AM=M+1 // 11839
A=A-1 // 11840
M=D // 11841
@55 // 11842
D=A // 11843
@SP // 11844
AM=M+1 // 11845
A=A-1 // 11846
M=D // 11847
@51 // 11848
D=A // 11849
@SP // 11850
AM=M+1 // 11851
A=A-1 // 11852
M=D // 11853
@3 // 11854
D=A // 11855
@SP // 11856
AM=M+1 // 11857
A=A-1 // 11858
M=D // 11859
@3 // 11860
D=A // 11861
@SP // 11862
AM=M+1 // 11863
A=A-1 // 11864
M=D // 11865
@7 // 11866
D=A // 11867
@SP // 11868
AM=M+1 // 11869
A=A-1 // 11870
M=D // 11871
@SP // 11872
AM=M+1 // 11873
A=A-1 // 11874
M=0 // 11875
@SP // 11876
AM=M+1 // 11877
A=A-1 // 11878
M=0 // 11879
// call Output.create
@17 // 11880
D=A // 11881
@14 // 11882
M=D // 11883
@Output.create // 11884
D=A // 11885
@13 // 11886
M=D // 11887
@Output.initMap.ret.84 // 11888
D=A // 11889
@CALL // 11890
0;JMP // 11891
(Output.initMap.ret.84)
@SP // 11892
M=M-1 // 11893

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@115 // 11894
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
@SP // 11908
AM=M+1 // 11909
A=A-1 // 11910
M=0 // 11911
@30 // 11912
D=A // 11913
@SP // 11914
AM=M+1 // 11915
A=A-1 // 11916
M=D // 11917
@51 // 11918
D=A // 11919
@SP // 11920
AM=M+1 // 11921
A=A-1 // 11922
M=D // 11923
@6 // 11924
D=A // 11925
@SP // 11926
AM=M+1 // 11927
A=A-1 // 11928
M=D // 11929
@24 // 11930
D=A // 11931
@SP // 11932
AM=M+1 // 11933
A=A-1 // 11934
M=D // 11935
@51 // 11936
D=A // 11937
@SP // 11938
AM=M+1 // 11939
A=A-1 // 11940
M=D // 11941
@30 // 11942
D=A // 11943
@SP // 11944
AM=M+1 // 11945
A=A-1 // 11946
M=D // 11947
@SP // 11948
AM=M+1 // 11949
A=A-1 // 11950
M=0 // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=0 // 11955
// call Output.create
@17 // 11956
D=A // 11957
@14 // 11958
M=D // 11959
@Output.create // 11960
D=A // 11961
@13 // 11962
M=D // 11963
@Output.initMap.ret.85 // 11964
D=A // 11965
@CALL // 11966
0;JMP // 11967
(Output.initMap.ret.85)
@SP // 11968
M=M-1 // 11969

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 11970
D=A // 11971
@SP // 11972
AM=M+1 // 11973
A=A-1 // 11974
M=D // 11975
@4 // 11976
D=A // 11977
@SP // 11978
AM=M+1 // 11979
A=A-1 // 11980
M=D // 11981
@6 // 11982
D=A // 11983
@SP // 11984
AM=M+1 // 11985
A=A-1 // 11986
M=D // 11987
@6 // 11988
D=A // 11989
@SP // 11990
AM=M+1 // 11991
A=A-1 // 11992
M=D // 11993
@15 // 11994
D=A // 11995
@SP // 11996
AM=M+1 // 11997
A=A-1 // 11998
M=D // 11999
@6 // 12000
D=A // 12001
@SP // 12002
AM=M+1 // 12003
A=A-1 // 12004
M=D // 12005
@6 // 12006
D=A // 12007
@SP // 12008
AM=M+1 // 12009
A=A-1 // 12010
M=D // 12011
@6 // 12012
D=A // 12013
@SP // 12014
AM=M+1 // 12015
A=A-1 // 12016
M=D // 12017
@54 // 12018
D=A // 12019
@SP // 12020
AM=M+1 // 12021
A=A-1 // 12022
M=D // 12023
@28 // 12024
D=A // 12025
@SP // 12026
AM=M+1 // 12027
A=A-1 // 12028
M=D // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=0 // 12033
@SP // 12034
AM=M+1 // 12035
A=A-1 // 12036
M=0 // 12037
// call Output.create
@17 // 12038
D=A // 12039
@14 // 12040
M=D // 12041
@Output.create // 12042
D=A // 12043
@13 // 12044
M=D // 12045
@Output.initMap.ret.86 // 12046
D=A // 12047
@CALL // 12048
0;JMP // 12049
(Output.initMap.ret.86)
@SP // 12050
M=M-1 // 12051

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 12052
D=A // 12053
@SP // 12054
AM=M+1 // 12055
A=A-1 // 12056
M=D // 12057
@SP // 12058
AM=M+1 // 12059
A=A-1 // 12060
M=0 // 12061
@SP // 12062
AM=M+1 // 12063
A=A-1 // 12064
M=0 // 12065
@SP // 12066
AM=M+1 // 12067
A=A-1 // 12068
M=0 // 12069
@27 // 12070
D=A // 12071
@SP // 12072
AM=M+1 // 12073
A=A-1 // 12074
M=D // 12075
@27 // 12076
D=A // 12077
@SP // 12078
AM=M+1 // 12079
A=A-1 // 12080
M=D // 12081
@27 // 12082
D=A // 12083
@SP // 12084
AM=M+1 // 12085
A=A-1 // 12086
M=D // 12087
@27 // 12088
D=A // 12089
@SP // 12090
AM=M+1 // 12091
A=A-1 // 12092
M=D // 12093
@27 // 12094
D=A // 12095
@SP // 12096
AM=M+1 // 12097
A=A-1 // 12098
M=D // 12099
@54 // 12100
D=A // 12101
@SP // 12102
AM=M+1 // 12103
A=A-1 // 12104
M=D // 12105
@SP // 12106
AM=M+1 // 12107
A=A-1 // 12108
M=0 // 12109
@SP // 12110
AM=M+1 // 12111
A=A-1 // 12112
M=0 // 12113
// call Output.create
@17 // 12114
D=A // 12115
@14 // 12116
M=D // 12117
@Output.create // 12118
D=A // 12119
@13 // 12120
M=D // 12121
@Output.initMap.ret.87 // 12122
D=A // 12123
@CALL // 12124
0;JMP // 12125
(Output.initMap.ret.87)
@SP // 12126
M=M-1 // 12127

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@118 // 12128
D=A // 12129
@SP // 12130
AM=M+1 // 12131
A=A-1 // 12132
M=D // 12133
@SP // 12134
AM=M+1 // 12135
A=A-1 // 12136
M=0 // 12137
@SP // 12138
AM=M+1 // 12139
A=A-1 // 12140
M=0 // 12141
@SP // 12142
AM=M+1 // 12143
A=A-1 // 12144
M=0 // 12145
@51 // 12146
D=A // 12147
@SP // 12148
AM=M+1 // 12149
A=A-1 // 12150
M=D // 12151
@51 // 12152
D=A // 12153
@SP // 12154
AM=M+1 // 12155
A=A-1 // 12156
M=D // 12157
@51 // 12158
D=A // 12159
@SP // 12160
AM=M+1 // 12161
A=A-1 // 12162
M=D // 12163
@51 // 12164
D=A // 12165
@SP // 12166
AM=M+1 // 12167
A=A-1 // 12168
M=D // 12169
@30 // 12170
D=A // 12171
@SP // 12172
AM=M+1 // 12173
A=A-1 // 12174
M=D // 12175
@12 // 12176
D=A // 12177
@SP // 12178
AM=M+1 // 12179
A=A-1 // 12180
M=D // 12181
@SP // 12182
AM=M+1 // 12183
A=A-1 // 12184
M=0 // 12185
@SP // 12186
AM=M+1 // 12187
A=A-1 // 12188
M=0 // 12189
// call Output.create
@17 // 12190
D=A // 12191
@14 // 12192
M=D // 12193
@Output.create // 12194
D=A // 12195
@13 // 12196
M=D // 12197
@Output.initMap.ret.88 // 12198
D=A // 12199
@CALL // 12200
0;JMP // 12201
(Output.initMap.ret.88)
@SP // 12202
M=M-1 // 12203

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@119 // 12204
D=A // 12205
@SP // 12206
AM=M+1 // 12207
A=A-1 // 12208
M=D // 12209
@SP // 12210
AM=M+1 // 12211
A=A-1 // 12212
M=0 // 12213
@SP // 12214
AM=M+1 // 12215
A=A-1 // 12216
M=0 // 12217
@SP // 12218
AM=M+1 // 12219
A=A-1 // 12220
M=0 // 12221
@51 // 12222
D=A // 12223
@SP // 12224
AM=M+1 // 12225
A=A-1 // 12226
M=D // 12227
@51 // 12228
D=A // 12229
@SP // 12230
AM=M+1 // 12231
A=A-1 // 12232
M=D // 12233
@51 // 12234
D=A // 12235
@SP // 12236
AM=M+1 // 12237
A=A-1 // 12238
M=D // 12239
@63 // 12240
D=A // 12241
@SP // 12242
AM=M+1 // 12243
A=A-1 // 12244
M=D // 12245
@63 // 12246
D=A // 12247
@SP // 12248
AM=M+1 // 12249
A=A-1 // 12250
M=D // 12251
@18 // 12252
D=A // 12253
@SP // 12254
AM=M+1 // 12255
A=A-1 // 12256
M=D // 12257
@SP // 12258
AM=M+1 // 12259
A=A-1 // 12260
M=0 // 12261
@SP // 12262
AM=M+1 // 12263
A=A-1 // 12264
M=0 // 12265
// call Output.create
@17 // 12266
D=A // 12267
@14 // 12268
M=D // 12269
@Output.create // 12270
D=A // 12271
@13 // 12272
M=D // 12273
@Output.initMap.ret.89 // 12274
D=A // 12275
@CALL // 12276
0;JMP // 12277
(Output.initMap.ret.89)
@SP // 12278
M=M-1 // 12279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@120 // 12280
D=A // 12281
@SP // 12282
AM=M+1 // 12283
A=A-1 // 12284
M=D // 12285
@SP // 12286
AM=M+1 // 12287
A=A-1 // 12288
M=0 // 12289
@SP // 12290
AM=M+1 // 12291
A=A-1 // 12292
M=0 // 12293
@SP // 12294
AM=M+1 // 12295
A=A-1 // 12296
M=0 // 12297
@51 // 12298
D=A // 12299
@SP // 12300
AM=M+1 // 12301
A=A-1 // 12302
M=D // 12303
@30 // 12304
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
@12 // 12316
D=A // 12317
@SP // 12318
AM=M+1 // 12319
A=A-1 // 12320
M=D // 12321
@30 // 12322
D=A // 12323
@SP // 12324
AM=M+1 // 12325
A=A-1 // 12326
M=D // 12327
@51 // 12328
D=A // 12329
@SP // 12330
AM=M+1 // 12331
A=A-1 // 12332
M=D // 12333
@SP // 12334
AM=M+1 // 12335
A=A-1 // 12336
M=0 // 12337
@SP // 12338
AM=M+1 // 12339
A=A-1 // 12340
M=0 // 12341
// call Output.create
@17 // 12342
D=A // 12343
@14 // 12344
M=D // 12345
@Output.create // 12346
D=A // 12347
@13 // 12348
M=D // 12349
@Output.initMap.ret.90 // 12350
D=A // 12351
@CALL // 12352
0;JMP // 12353
(Output.initMap.ret.90)
@SP // 12354
M=M-1 // 12355

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@121 // 12356
D=A // 12357
@SP // 12358
AM=M+1 // 12359
A=A-1 // 12360
M=D // 12361
@SP // 12362
AM=M+1 // 12363
A=A-1 // 12364
M=0 // 12365
@SP // 12366
AM=M+1 // 12367
A=A-1 // 12368
M=0 // 12369
@SP // 12370
AM=M+1 // 12371
A=A-1 // 12372
M=0 // 12373
@51 // 12374
D=A // 12375
@SP // 12376
AM=M+1 // 12377
A=A-1 // 12378
M=D // 12379
@51 // 12380
D=A // 12381
@SP // 12382
AM=M+1 // 12383
A=A-1 // 12384
M=D // 12385
@51 // 12386
D=A // 12387
@SP // 12388
AM=M+1 // 12389
A=A-1 // 12390
M=D // 12391
@62 // 12392
D=A // 12393
@SP // 12394
AM=M+1 // 12395
A=A-1 // 12396
M=D // 12397
@48 // 12398
D=A // 12399
@SP // 12400
AM=M+1 // 12401
A=A-1 // 12402
M=D // 12403
@24 // 12404
D=A // 12405
@SP // 12406
AM=M+1 // 12407
A=A-1 // 12408
M=D // 12409
@15 // 12410
D=A // 12411
@SP // 12412
AM=M+1 // 12413
A=A-1 // 12414
M=D // 12415
@SP // 12416
AM=M+1 // 12417
A=A-1 // 12418
M=0 // 12419
// call Output.create
@17 // 12420
D=A // 12421
@14 // 12422
M=D // 12423
@Output.create // 12424
D=A // 12425
@13 // 12426
M=D // 12427
@Output.initMap.ret.91 // 12428
D=A // 12429
@CALL // 12430
0;JMP // 12431
(Output.initMap.ret.91)
@SP // 12432
M=M-1 // 12433

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@122 // 12434
D=A // 12435
@SP // 12436
AM=M+1 // 12437
A=A-1 // 12438
M=D // 12439
@SP // 12440
AM=M+1 // 12441
A=A-1 // 12442
M=0 // 12443
@SP // 12444
AM=M+1 // 12445
A=A-1 // 12446
M=0 // 12447
@SP // 12448
AM=M+1 // 12449
A=A-1 // 12450
M=0 // 12451
@63 // 12452
D=A // 12453
@SP // 12454
AM=M+1 // 12455
A=A-1 // 12456
M=D // 12457
@27 // 12458
D=A // 12459
@SP // 12460
AM=M+1 // 12461
A=A-1 // 12462
M=D // 12463
@12 // 12464
D=A // 12465
@SP // 12466
AM=M+1 // 12467
A=A-1 // 12468
M=D // 12469
@6 // 12470
D=A // 12471
@SP // 12472
AM=M+1 // 12473
A=A-1 // 12474
M=D // 12475
@51 // 12476
D=A // 12477
@SP // 12478
AM=M+1 // 12479
A=A-1 // 12480
M=D // 12481
@63 // 12482
D=A // 12483
@SP // 12484
AM=M+1 // 12485
A=A-1 // 12486
M=D // 12487
@SP // 12488
AM=M+1 // 12489
A=A-1 // 12490
M=0 // 12491
@SP // 12492
AM=M+1 // 12493
A=A-1 // 12494
M=0 // 12495
// call Output.create
@17 // 12496
D=A // 12497
@14 // 12498
M=D // 12499
@Output.create // 12500
D=A // 12501
@13 // 12502
M=D // 12503
@Output.initMap.ret.92 // 12504
D=A // 12505
@CALL // 12506
0;JMP // 12507
(Output.initMap.ret.92)
@SP // 12508
M=M-1 // 12509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12510
D=A // 12511
@SP // 12512
AM=M+1 // 12513
A=A-1 // 12514
M=D // 12515
@56 // 12516
D=A // 12517
@SP // 12518
AM=M+1 // 12519
A=A-1 // 12520
M=D // 12521
@12 // 12522
D=A // 12523
@SP // 12524
AM=M+1 // 12525
A=A-1 // 12526
M=D // 12527
@12 // 12528
D=A // 12529
@SP // 12530
AM=M+1 // 12531
A=A-1 // 12532
M=D // 12533
@12 // 12534
D=A // 12535
@SP // 12536
AM=M+1 // 12537
A=A-1 // 12538
M=D // 12539
@7 // 12540
D=A // 12541
@SP // 12542
AM=M+1 // 12543
A=A-1 // 12544
M=D // 12545
@12 // 12546
D=A // 12547
@SP // 12548
AM=M+1 // 12549
A=A-1 // 12550
M=D // 12551
@12 // 12552
D=A // 12553
@SP // 12554
AM=M+1 // 12555
A=A-1 // 12556
M=D // 12557
@12 // 12558
D=A // 12559
@SP // 12560
AM=M+1 // 12561
A=A-1 // 12562
M=D // 12563
@56 // 12564
D=A // 12565
@SP // 12566
AM=M+1 // 12567
A=A-1 // 12568
M=D // 12569
@SP // 12570
AM=M+1 // 12571
A=A-1 // 12572
M=0 // 12573
@SP // 12574
AM=M+1 // 12575
A=A-1 // 12576
M=0 // 12577
// call Output.create
@17 // 12578
D=A // 12579
@14 // 12580
M=D // 12581
@Output.create // 12582
D=A // 12583
@13 // 12584
M=D // 12585
@Output.initMap.ret.93 // 12586
D=A // 12587
@CALL // 12588
0;JMP // 12589
(Output.initMap.ret.93)
@SP // 12590
M=M-1 // 12591

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12592
D=A // 12593
@SP // 12594
AM=M+1 // 12595
A=A-1 // 12596
M=D // 12597
@12 // 12598
D=A // 12599
@SP // 12600
AM=M+1 // 12601
A=A-1 // 12602
M=D // 12603
@12 // 12604
D=A // 12605
@SP // 12606
AM=M+1 // 12607
A=A-1 // 12608
M=D // 12609
@12 // 12610
D=A // 12611
@SP // 12612
AM=M+1 // 12613
A=A-1 // 12614
M=D // 12615
@12 // 12616
D=A // 12617
@SP // 12618
AM=M+1 // 12619
A=A-1 // 12620
M=D // 12621
@12 // 12622
D=A // 12623
@SP // 12624
AM=M+1 // 12625
A=A-1 // 12626
M=D // 12627
@12 // 12628
D=A // 12629
@SP // 12630
AM=M+1 // 12631
A=A-1 // 12632
M=D // 12633
@12 // 12634
D=A // 12635
@SP // 12636
AM=M+1 // 12637
A=A-1 // 12638
M=D // 12639
@12 // 12640
D=A // 12641
@SP // 12642
AM=M+1 // 12643
A=A-1 // 12644
M=D // 12645
@12 // 12646
D=A // 12647
@SP // 12648
AM=M+1 // 12649
A=A-1 // 12650
M=D // 12651
@SP // 12652
AM=M+1 // 12653
A=A-1 // 12654
M=0 // 12655
@SP // 12656
AM=M+1 // 12657
A=A-1 // 12658
M=0 // 12659
// call Output.create
@17 // 12660
D=A // 12661
@14 // 12662
M=D // 12663
@Output.create // 12664
D=A // 12665
@13 // 12666
M=D // 12667
@Output.initMap.ret.94 // 12668
D=A // 12669
@CALL // 12670
0;JMP // 12671
(Output.initMap.ret.94)
@SP // 12672
M=M-1 // 12673

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12674
D=A // 12675
@SP // 12676
AM=M+1 // 12677
A=A-1 // 12678
M=D // 12679
@7 // 12680
D=A // 12681
@SP // 12682
AM=M+1 // 12683
A=A-1 // 12684
M=D // 12685
@12 // 12686
D=A // 12687
@SP // 12688
AM=M+1 // 12689
A=A-1 // 12690
M=D // 12691
@12 // 12692
D=A // 12693
@SP // 12694
AM=M+1 // 12695
A=A-1 // 12696
M=D // 12697
@12 // 12698
D=A // 12699
@SP // 12700
AM=M+1 // 12701
A=A-1 // 12702
M=D // 12703
@56 // 12704
D=A // 12705
@SP // 12706
AM=M+1 // 12707
A=A-1 // 12708
M=D // 12709
@12 // 12710
D=A // 12711
@SP // 12712
AM=M+1 // 12713
A=A-1 // 12714
M=D // 12715
@12 // 12716
D=A // 12717
@SP // 12718
AM=M+1 // 12719
A=A-1 // 12720
M=D // 12721
@12 // 12722
D=A // 12723
@SP // 12724
AM=M+1 // 12725
A=A-1 // 12726
M=D // 12727
@7 // 12728
D=A // 12729
@SP // 12730
AM=M+1 // 12731
A=A-1 // 12732
M=D // 12733
@SP // 12734
AM=M+1 // 12735
A=A-1 // 12736
M=0 // 12737
@SP // 12738
AM=M+1 // 12739
A=A-1 // 12740
M=0 // 12741
// call Output.create
@17 // 12742
D=A // 12743
@14 // 12744
M=D // 12745
@Output.create // 12746
D=A // 12747
@13 // 12748
M=D // 12749
@Output.initMap.ret.95 // 12750
D=A // 12751
@CALL // 12752
0;JMP // 12753
(Output.initMap.ret.95)
@SP // 12754
M=M-1 // 12755

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 12756
D=A // 12757
@SP // 12758
AM=M+1 // 12759
A=A-1 // 12760
M=D // 12761
@38 // 12762
D=A // 12763
@SP // 12764
AM=M+1 // 12765
A=A-1 // 12766
M=D // 12767
@45 // 12768
D=A // 12769
@SP // 12770
AM=M+1 // 12771
A=A-1 // 12772
M=D // 12773
@25 // 12774
D=A // 12775
@SP // 12776
AM=M+1 // 12777
A=A-1 // 12778
M=D // 12779
@SP // 12780
AM=M+1 // 12781
A=A-1 // 12782
M=0 // 12783
@SP // 12784
AM=M+1 // 12785
A=A-1 // 12786
M=0 // 12787
@SP // 12788
AM=M+1 // 12789
A=A-1 // 12790
M=0 // 12791
@SP // 12792
AM=M+1 // 12793
A=A-1 // 12794
M=0 // 12795
@SP // 12796
AM=M+1 // 12797
A=A-1 // 12798
M=0 // 12799
@SP // 12800
AM=M+1 // 12801
A=A-1 // 12802
M=0 // 12803
@SP // 12804
AM=M+1 // 12805
A=A-1 // 12806
M=0 // 12807
@SP // 12808
AM=M+1 // 12809
A=A-1 // 12810
M=0 // 12811
// call Output.create
@17 // 12812
D=A // 12813
@14 // 12814
M=D // 12815
@Output.create // 12816
D=A // 12817
@13 // 12818
M=D // 12819
@Output.initMap.ret.96 // 12820
D=A // 12821
@CALL // 12822
0;JMP // 12823
(Output.initMap.ret.96)
@SP // 12824
M=M-1 // 12825

////PushInstruction("constant 0")
@SP // 12826
AM=M+1 // 12827
A=A-1 // 12828
M=0 // 12829

////ReturnInstruction{}
@RETURN // 12830
0;JMP // 12831

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 12832
AM=M+1 // 12833
A=A-1 // 12834
M=0 // 12835

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 12836
D=A // 12837
@SP // 12838
AM=M+1 // 12839
A=A-1 // 12840
M=D // 12841
// call Array.new
@6 // 12842
D=A // 12843
@14 // 12844
M=D // 12845
@Array.new // 12846
D=A // 12847
@13 // 12848
M=D // 12849
@Output.create.ret.0 // 12850
D=A // 12851
@CALL // 12852
0;JMP // 12853
(Output.create.ret.0)
@SP // 12854
AM=M-1 // 12855
D=M // 12856
@LCL // 12857
A=M // 12858
M=D // 12859

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 12860
D=M // 12861
@SP // 12862
AM=M+1 // 12863
A=A-1 // 12864
M=D // 12865
@ARG // 12866
A=M // 12867
D=M // 12868
@SP // 12869
AM=M-1 // 12870
D=D+M // 12871
@SP // 12872
AM=M+1 // 12873
A=A-1 // 12874
M=D // 12875
@LCL // 12876
A=M // 12877
D=M // 12878
@SP // 12879
AM=M-1 // 12880
A=M // 12881
M=D // 12882

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 12883
A=M // 12884
D=M // 12885
@SP // 12886
AM=M+1 // 12887
A=A-1 // 12888
M=D // 12889
@ARG // 12890
A=M+1 // 12891
D=M // 12892
@SP // 12893
AM=M-1 // 12894
A=M // 12895
M=D // 12896

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 12897
A=M // 12898
D=M // 12899
@SP // 12900
AM=M+1 // 12901
A=A-1 // 12902
M=D+1 // 12903
@ARG // 12904
A=M+1 // 12905
A=A+1 // 12906
D=M // 12907
@SP // 12908
AM=M-1 // 12909
A=M // 12910
M=D // 12911

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 12912
A=M // 12913
D=M // 12914
@2 // 12915
D=D+A // 12916
@SP // 12917
AM=M+1 // 12918
A=A-1 // 12919
M=D // 12920
@ARG // 12921
A=M+1 // 12922
A=A+1 // 12923
A=A+1 // 12924
D=M // 12925
@SP // 12926
AM=M-1 // 12927
A=M // 12928
M=D // 12929

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 12930
A=M // 12931
D=M // 12932
@3 // 12933
D=D+A // 12934
@SP // 12935
AM=M+1 // 12936
A=A-1 // 12937
M=D // 12938
@ARG // 12939
D=M // 12940
@4 // 12941
A=D+A // 12942
D=M // 12943
@SP // 12944
AM=M-1 // 12945
A=M // 12946
M=D // 12947

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 12948
A=M // 12949
D=M // 12950
@4 // 12951
D=D+A // 12952
@SP // 12953
AM=M+1 // 12954
A=A-1 // 12955
M=D // 12956
@ARG // 12957
D=M // 12958
@5 // 12959
A=D+A // 12960
D=M // 12961
@SP // 12962
AM=M-1 // 12963
A=M // 12964
M=D // 12965

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 12966
A=M // 12967
D=M // 12968
@5 // 12969
D=D+A // 12970
@SP // 12971
AM=M+1 // 12972
A=A-1 // 12973
M=D // 12974
@ARG // 12975
D=M // 12976
@6 // 12977
A=D+A // 12978
D=M // 12979
@SP // 12980
AM=M-1 // 12981
A=M // 12982
M=D // 12983

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 12984
A=M // 12985
D=M // 12986
@6 // 12987
D=D+A // 12988
@SP // 12989
AM=M+1 // 12990
A=A-1 // 12991
M=D // 12992
@ARG // 12993
D=M // 12994
@7 // 12995
A=D+A // 12996
D=M // 12997
@SP // 12998
AM=M-1 // 12999
A=M // 13000
M=D // 13001

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 13002
A=M // 13003
D=M // 13004
@7 // 13005
D=D+A // 13006
@SP // 13007
AM=M+1 // 13008
A=A-1 // 13009
M=D // 13010
@ARG // 13011
D=M // 13012
@8 // 13013
A=D+A // 13014
D=M // 13015
@SP // 13016
AM=M-1 // 13017
A=M // 13018
M=D // 13019

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 13020
A=M // 13021
D=M // 13022
@8 // 13023
D=D+A // 13024
@SP // 13025
AM=M+1 // 13026
A=A-1 // 13027
M=D // 13028
@ARG // 13029
D=M // 13030
@9 // 13031
A=D+A // 13032
D=M // 13033
@SP // 13034
AM=M-1 // 13035
A=M // 13036
M=D // 13037

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 13038
A=M // 13039
D=M // 13040
@9 // 13041
D=D+A // 13042
@SP // 13043
AM=M+1 // 13044
A=A-1 // 13045
M=D // 13046
@ARG // 13047
D=M // 13048
@10 // 13049
A=D+A // 13050
D=M // 13051
@SP // 13052
AM=M-1 // 13053
A=M // 13054
M=D // 13055

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 13056
A=M // 13057
D=M // 13058
@10 // 13059
D=D+A // 13060
@SP // 13061
AM=M+1 // 13062
A=A-1 // 13063
M=D // 13064
@ARG // 13065
D=M // 13066
@11 // 13067
A=D+A // 13068
D=M // 13069
@SP // 13070
AM=M-1 // 13071
A=M // 13072
M=D // 13073

////PushInstruction("constant 0")
@SP // 13074
AM=M+1 // 13075
A=A-1 // 13076
M=0 // 13077

////ReturnInstruction{}
@RETURN // 13078
0;JMP // 13079

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
@Output.getMap.EQ.0 // 13080
D=A // 13081
@SP // 13082
AM=M+1 // 13083
A=A-1 // 13084
M=D // 13085
@Output.getMap.LT.1 // 13086
D=A // 13087
@SP // 13088
AM=M+1 // 13089
A=A-1 // 13090
M=D // 13091
@ARG // 13092
A=M // 13093
D=M // 13094
@32 // 13095
D=D-A // 13096
@DO_LT // 13097
0;JMP // 13098
(Output.getMap.LT.1)
@SP // 13099
AM=M+1 // 13100
A=A-1 // 13101
M=D // 13102
@Output.getMap.GT.2 // 13103
D=A // 13104
@SP // 13105
AM=M+1 // 13106
A=A-1 // 13107
M=D // 13108
@ARG // 13109
A=M // 13110
D=M // 13111
@126 // 13112
D=D-A // 13113
@DO_GT // 13114
0;JMP // 13115
(Output.getMap.GT.2)
@SP // 13116
AM=M-1 // 13117
D=D|M // 13118
@DO_EQ // 13119
0;JMP // 13120
(Output.getMap.EQ.0)
@Output.getMap.IfElse1 // 13121
D;JNE // 13122

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 13123
A=M // 13124
M=0 // 13125

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 13126
0;JMP // 13127

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
@Output.0 // 13128
D=M // 13129
@SP // 13130
AM=M+1 // 13131
A=A-1 // 13132
M=D // 13133
@ARG // 13134
A=M // 13135
D=M // 13136
@SP // 13137
AM=M-1 // 13138
A=D+M // 13139
D=M // 13140
@SP // 13141
AM=M+1 // 13142
A=A-1 // 13143
M=D // 13144

////ReturnInstruction{}
@RETURN // 13145
0;JMP // 13146

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 13147
A=M+1 // 13148
D=M // 13149
@Output.1 // 13150
M=D // 13151

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 13152
A=M // 13153
D=M // 13154
@Output.2 // 13155
M=D // 13156

////PushInstruction("constant 0")
@SP // 13157
AM=M+1 // 13158
A=A-1 // 13159
M=0 // 13160

////ReturnInstruction{}
@RETURN // 13161
0;JMP // 13162

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 13163
AM=M+1 // 13164
A=A-1 // 13165
M=0 // 13166
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=0 // 13170
@SP // 13171
AM=M+1 // 13172
A=A-1 // 13173
M=0 // 13174
@SP // 13175
AM=M+1 // 13176
A=A-1 // 13177
M=0 // 13178

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13179
A=M // 13180
D=M // 13181
@SP // 13182
AM=M+1 // 13183
A=A-1 // 13184
M=D // 13185
// call Output.getMap
@6 // 13186
D=A // 13187
@14 // 13188
M=D // 13189
@Output.getMap // 13190
D=A // 13191
@13 // 13192
M=D // 13193
@Output.printChar.ret.0 // 13194
D=A // 13195
@CALL // 13196
0;JMP // 13197
(Output.printChar.ret.0)
@SP // 13198
AM=M-1 // 13199
D=M // 13200
@LCL // 13201
A=M // 13202
M=D // 13203

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13204
A=M+1 // 13205
A=A+1 // 13206
A=A+1 // 13207
M=0 // 13208

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
@Output.printChar.LT.3 // 13209
D=A // 13210
@SP // 13211
AM=M+1 // 13212
A=A-1 // 13213
M=D // 13214
@LCL // 13215
A=M+1 // 13216
A=A+1 // 13217
A=A+1 // 13218
D=M // 13219
@11 // 13220
D=D-A // 13221
@DO_LT // 13222
0;JMP // 13223
(Output.printChar.LT.3)
D=!D // 13224
@WHILE_END_Output.printChar1 // 13225
D;JNE // 13226

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

@Output.2 // 13227
D=M // 13228
@SP // 13229
AM=M+1 // 13230
A=A-1 // 13231
M=D // 13232
@11 // 13233
D=A // 13234
@SP // 13235
AM=M+1 // 13236
A=A-1 // 13237
M=D // 13238
// call Math.multiply
@7 // 13239
D=A // 13240
@14 // 13241
M=D // 13242
@Math.multiply // 13243
D=A // 13244
@13 // 13245
M=D // 13246
@Output.printChar.ret.1 // 13247
D=A // 13248
@CALL // 13249
0;JMP // 13250
(Output.printChar.ret.1)
@LCL // 13251
A=M+1 // 13252
A=A+1 // 13253
A=A+1 // 13254
D=M // 13255
@SP // 13256
AM=M-1 // 13257
D=D+M // 13258
@SP // 13259
AM=M+1 // 13260
A=A-1 // 13261
M=D // 13262
@32 // 13263
D=A // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268
// call Math.multiply
@7 // 13269
D=A // 13270
@14 // 13271
M=D // 13272
@Math.multiply // 13273
D=A // 13274
@13 // 13275
M=D // 13276
@Output.printChar.ret.2 // 13277
D=A // 13278
@CALL // 13279
0;JMP // 13280
(Output.printChar.ret.2)
@SP // 13281
AM=M-1 // 13282
D=M // 13283
@16384 // 13284
D=D+A // 13285
@SP // 13286
AM=M+1 // 13287
A=A-1 // 13288
M=D // 13289
@Output.1 // 13290
D=M // 13291
@SP // 13292
AM=M+1 // 13293
A=A-1 // 13294
M=D // 13295
@2 // 13296
D=A // 13297
@SP // 13298
AM=M+1 // 13299
A=A-1 // 13300
M=D // 13301
// call Math.divide
@7 // 13302
D=A // 13303
@14 // 13304
M=D // 13305
@Math.divide // 13306
D=A // 13307
@13 // 13308
M=D // 13309
@Output.printChar.ret.3 // 13310
D=A // 13311
@CALL // 13312
0;JMP // 13313
(Output.printChar.ret.3)
@SP // 13314
AM=M-1 // 13315
D=M // 13316
@SP // 13317
AM=M-1 // 13318
D=D+M // 13319
@LCL // 13320
A=M+1 // 13321
M=D // 13322

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
@Output.printChar.EQ.4 // 13323
D=A // 13324
@SP // 13325
AM=M+1 // 13326
A=A-1 // 13327
M=D // 13328
@Output.1 // 13329
D=M // 13330
@1 // 13331
D=D&A // 13332
@DO_EQ // 13333
0;JMP // 13334
(Output.printChar.EQ.4)
D=!D // 13335
@Output.printChar.IfElse1 // 13336
D;JNE // 13337

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

@LCL // 13338
A=M+1 // 13339
A=A+1 // 13340
A=A+1 // 13341
D=M // 13342
A=A-1 // 13343
A=A-1 // 13344
A=A-1 // 13345
A=D+M // 13346
D=M // 13347
@LCL // 13348
A=M+1 // 13349
A=A+1 // 13350
M=D // 13351

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 13352
0;JMP // 13353

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

@LCL // 13354
A=M+1 // 13355
A=A+1 // 13356
A=A+1 // 13357
D=M // 13358
A=A-1 // 13359
A=A-1 // 13360
A=A-1 // 13361
A=D+M // 13362
D=M // 13363
@SP // 13364
AM=M+1 // 13365
A=A-1 // 13366
M=D // 13367
@256 // 13368
D=A // 13369
@SP // 13370
AM=M+1 // 13371
A=A-1 // 13372
M=D // 13373
// call Math.multiply
@7 // 13374
D=A // 13375
@14 // 13376
M=D // 13377
@Math.multiply // 13378
D=A // 13379
@13 // 13380
M=D // 13381
@Output.printChar.ret.4 // 13382
D=A // 13383
@CALL // 13384
0;JMP // 13385
(Output.printChar.ret.4)
@SP // 13386
AM=M-1 // 13387
D=M // 13388
@LCL // 13389
A=M+1 // 13390
A=A+1 // 13391
M=D // 13392

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
@LCL // 13393
A=M+1 // 13394
D=M // 13395
@SP // 13396
AM=M+1 // 13397
A=A-1 // 13398
M=D // 13399
@LCL // 13400
A=M+1 // 13401
D=M // 13402
@0 // 13403
A=D+A // 13404
D=M // 13405
@SP // 13406
AM=M+1 // 13407
A=A-1 // 13408
M=D // 13409
@LCL // 13410
A=M+1 // 13411
A=A+1 // 13412
D=M // 13413
@SP // 13414
AM=M-1 // 13415
D=D|M // 13416
@SP // 13417
AM=M-1 // 13418
A=M // 13419
M=D // 13420

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

@LCL // 13421
A=M+1 // 13422
A=A+1 // 13423
A=A+1 // 13424
D=M // 13425
D=D+1 // 13426
@LCL // 13427
A=M+1 // 13428
A=A+1 // 13429
A=A+1 // 13430
M=D // 13431

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 13432
0;JMP // 13433

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
@Output.printChar.EQ.5 // 13434
D=A // 13435
@SP // 13436
AM=M+1 // 13437
A=A-1 // 13438
M=D // 13439
@Output.1 // 13440
D=M // 13441
@63 // 13442
D=D-A // 13443
@DO_EQ // 13444
0;JMP // 13445
(Output.printChar.EQ.5)
D=!D // 13446
@Output.printChar.IfElse2 // 13447
D;JNE // 13448

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 13449
D=A // 13450
@14 // 13451
M=D // 13452
@Output.println // 13453
D=A // 13454
@13 // 13455
M=D // 13456
@Output.printChar.ret.5 // 13457
D=A // 13458
@CALL // 13459
0;JMP // 13460
(Output.printChar.ret.5)
@SP // 13461
M=M-1 // 13462

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 13463
0;JMP // 13464

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

@Output.1 // 13465
D=M // 13466
D=D+1 // 13467
@Output.1 // 13468
M=D // 13469

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 13470
AM=M+1 // 13471
A=A-1 // 13472
M=0 // 13473

////ReturnInstruction{}
@RETURN // 13474
0;JMP // 13475

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 13476
AM=M+1 // 13477
A=A-1 // 13478
M=0 // 13479
@SP // 13480
AM=M+1 // 13481
A=A-1 // 13482
M=0 // 13483

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13484
A=M // 13485
M=0 // 13486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13487
A=M // 13488
D=M // 13489
@SP // 13490
AM=M+1 // 13491
A=A-1 // 13492
M=D // 13493
// call String.length
@6 // 13494
D=A // 13495
@14 // 13496
M=D // 13497
@String.length // 13498
D=A // 13499
@13 // 13500
M=D // 13501
@Output.printString.ret.0 // 13502
D=A // 13503
@CALL // 13504
0;JMP // 13505
(Output.printString.ret.0)
@SP // 13506
AM=M-1 // 13507
D=M // 13508
@LCL // 13509
A=M+1 // 13510
M=D // 13511

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
@Output.printString.LT.6 // 13512
D=A // 13513
@SP // 13514
AM=M+1 // 13515
A=A-1 // 13516
M=D // 13517
@LCL // 13518
A=M+1 // 13519
D=M // 13520
A=A-1 // 13521
D=M-D // 13522
@DO_LT // 13523
0;JMP // 13524
(Output.printString.LT.6)
D=!D // 13525
@WHILE_END_Output.printString1 // 13526
D;JNE // 13527

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13528
A=M // 13529
D=M // 13530
@SP // 13531
AM=M+1 // 13532
A=A-1 // 13533
M=D // 13534
@LCL // 13535
A=M // 13536
D=M // 13537
@SP // 13538
AM=M+1 // 13539
A=A-1 // 13540
M=D // 13541
// call String.charAt
@7 // 13542
D=A // 13543
@14 // 13544
M=D // 13545
@String.charAt // 13546
D=A // 13547
@13 // 13548
M=D // 13549
@Output.printString.ret.1 // 13550
D=A // 13551
@CALL // 13552
0;JMP // 13553
(Output.printString.ret.1)
// call Output.printChar
@6 // 13554
D=A // 13555
@14 // 13556
M=D // 13557
@Output.printChar // 13558
D=A // 13559
@13 // 13560
M=D // 13561
@Output.printString.ret.2 // 13562
D=A // 13563
@CALL // 13564
0;JMP // 13565
(Output.printString.ret.2)
@SP // 13566
M=M-1 // 13567

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

@LCL // 13568
A=M // 13569
D=M // 13570
D=D+1 // 13571
@LCL // 13572
A=M // 13573
M=D // 13574

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 13575
0;JMP // 13576

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 13577
AM=M+1 // 13578
A=A-1 // 13579
M=0 // 13580

////ReturnInstruction{}
@RETURN // 13581
0;JMP // 13582

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 13583
AM=M+1 // 13584
A=A-1 // 13585
M=0 // 13586

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 13587
D=A // 13588
@SP // 13589
AM=M+1 // 13590
A=A-1 // 13591
M=D // 13592
// call String.new
@6 // 13593
D=A // 13594
@14 // 13595
M=D // 13596
@String.new // 13597
D=A // 13598
@13 // 13599
M=D // 13600
@Output.printInt.ret.0 // 13601
D=A // 13602
@CALL // 13603
0;JMP // 13604
(Output.printInt.ret.0)
@SP // 13605
AM=M-1 // 13606
D=M // 13607
@LCL // 13608
A=M // 13609
M=D // 13610

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13611
A=M // 13612
D=M // 13613
@SP // 13614
AM=M+1 // 13615
A=A-1 // 13616
M=D // 13617
@ARG // 13618
A=M // 13619
D=M // 13620
@SP // 13621
AM=M+1 // 13622
A=A-1 // 13623
M=D // 13624
// call String.setInt
@7 // 13625
D=A // 13626
@14 // 13627
M=D // 13628
@String.setInt // 13629
D=A // 13630
@13 // 13631
M=D // 13632
@Output.printInt.ret.1 // 13633
D=A // 13634
@CALL // 13635
0;JMP // 13636
(Output.printInt.ret.1)
@SP // 13637
M=M-1 // 13638

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13639
A=M // 13640
D=M // 13641
@SP // 13642
AM=M+1 // 13643
A=A-1 // 13644
M=D // 13645
// call Output.printString
@6 // 13646
D=A // 13647
@14 // 13648
M=D // 13649
@Output.printString // 13650
D=A // 13651
@13 // 13652
M=D // 13653
@Output.printInt.ret.2 // 13654
D=A // 13655
@CALL // 13656
0;JMP // 13657
(Output.printInt.ret.2)
@SP // 13658
M=M-1 // 13659

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13660
A=M // 13661
D=M // 13662
@SP // 13663
AM=M+1 // 13664
A=A-1 // 13665
M=D // 13666
// call String.dispose
@6 // 13667
D=A // 13668
@14 // 13669
M=D // 13670
@String.dispose // 13671
D=A // 13672
@13 // 13673
M=D // 13674
@Output.printInt.ret.3 // 13675
D=A // 13676
@CALL // 13677
0;JMP // 13678
(Output.printInt.ret.3)
@SP // 13679
M=M-1 // 13680

////PushInstruction("constant 0")
@SP // 13681
AM=M+1 // 13682
A=A-1 // 13683
M=0 // 13684

////ReturnInstruction{}
@RETURN // 13685
0;JMP // 13686

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13687
M=0 // 13688

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
@Output.println.EQ.7 // 13689
D=A // 13690
@SP // 13691
AM=M+1 // 13692
A=A-1 // 13693
M=D // 13694
@Output.2 // 13695
D=M // 13696
@22 // 13697
D=D-A // 13698
@DO_EQ // 13699
0;JMP // 13700
(Output.println.EQ.7)
D=!D // 13701
@Output.println.IfElse1 // 13702
D;JNE // 13703

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13704
M=0 // 13705

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 13706
0;JMP // 13707

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

@Output.2 // 13708
D=M // 13709
D=D+1 // 13710
@Output.2 // 13711
M=D // 13712

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13713
AM=M+1 // 13714
A=A-1 // 13715
M=0 // 13716

////ReturnInstruction{}
@RETURN // 13717
0;JMP // 13718

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
@Output.backSpace.EQ.8 // 13719
D=A // 13720
@SP // 13721
AM=M+1 // 13722
A=A-1 // 13723
M=D // 13724
@Output.1 // 13725
D=M // 13726
@DO_EQ // 13727
0;JMP // 13728
(Output.backSpace.EQ.8)
D=!D // 13729
@Output.backSpace.IfElse1 // 13730
D;JNE // 13731

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

@Output.2 // 13732
D=M // 13733
D=D-1 // 13734
@Output.2 // 13735
M=D // 13736

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 13737
D=A // 13738
@Output.1 // 13739
M=D // 13740

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 13741
0;JMP // 13742

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

@Output.1 // 13743
D=M // 13744
D=D-1 // 13745
@Output.1 // 13746
M=D // 13747

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13748
AM=M+1 // 13749
A=A-1 // 13750
M=0 // 13751

////ReturnInstruction{}
@RETURN // 13752
0;JMP // 13753

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 13754
M=-1 // 13755

////PushInstruction("constant 0")
@SP // 13756
AM=M+1 // 13757
A=A-1 // 13758
M=0 // 13759

////ReturnInstruction{}
@RETURN // 13760
0;JMP // 13761

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13762
A=M // 13763
D=M // 13764
@Screen.0 // 13765
M=D // 13766

////PushInstruction("constant 0")
@SP // 13767
AM=M+1 // 13768
A=A-1 // 13769
M=0 // 13770

////ReturnInstruction{}
@RETURN // 13771
0;JMP // 13772

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 13773
AM=M+1 // 13774
A=A-1 // 13775
M=0 // 13776
@SP // 13777
AM=M+1 // 13778
A=A-1 // 13779
M=0 // 13780

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

@ARG // 13781
A=M+1 // 13782
D=M // 13783
@SP // 13784
AM=M+1 // 13785
A=A-1 // 13786
M=D // 13787
@32 // 13788
D=A // 13789
@SP // 13790
AM=M+1 // 13791
A=A-1 // 13792
M=D // 13793
// call Math.multiply
@7 // 13794
D=A // 13795
@14 // 13796
M=D // 13797
@Math.multiply // 13798
D=A // 13799
@13 // 13800
M=D // 13801
@Screen.drawPixel.ret.0 // 13802
D=A // 13803
@CALL // 13804
0;JMP // 13805
(Screen.drawPixel.ret.0)
@ARG // 13806
A=M // 13807
D=M // 13808
@SP // 13809
AM=M+1 // 13810
A=A-1 // 13811
M=D // 13812
@16 // 13813
D=A // 13814
@SP // 13815
AM=M+1 // 13816
A=A-1 // 13817
M=D // 13818
// call Math.divide
@7 // 13819
D=A // 13820
@14 // 13821
M=D // 13822
@Math.divide // 13823
D=A // 13824
@13 // 13825
M=D // 13826
@Screen.drawPixel.ret.1 // 13827
D=A // 13828
@CALL // 13829
0;JMP // 13830
(Screen.drawPixel.ret.1)
@SP // 13831
AM=M-1 // 13832
D=M // 13833
@SP // 13834
AM=M-1 // 13835
D=D+M // 13836
@16384 // 13837
D=D+A // 13838
@LCL // 13839
A=M // 13840
M=D // 13841

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

@ARG // 13842
A=M // 13843
D=M // 13844
@15 // 13845
D=D&A // 13846
@LCL // 13847
A=M+1 // 13848
M=D // 13849

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
@Screen.drawPixel.EQ.0 // 13850
D=A // 13851
@SP // 13852
AM=M+1 // 13853
A=A-1 // 13854
M=D // 13855
@Screen.drawPixel.EQ.1 // 13856
D=A // 13857
@SP // 13858
AM=M+1 // 13859
A=A-1 // 13860
M=D // 13861
@Screen.0 // 13862
D=M // 13863
@DO_EQ // 13864
0;JMP // 13865
(Screen.drawPixel.EQ.1)
D=!D // 13866
@DO_EQ // 13867
0;JMP // 13868
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 13869
D;JNE // 13870

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
@LCL // 13871
A=M // 13872
D=M // 13873
@SP // 13874
AM=M+1 // 13875
A=A-1 // 13876
M=D // 13877
@LCL // 13878
A=M // 13879
D=M // 13880
@0 // 13881
A=D+A // 13882
D=M // 13883
@SP // 13884
AM=M+1 // 13885
A=A-1 // 13886
M=D // 13887
@LCL // 13888
A=M+1 // 13889
D=M // 13890
@SP // 13891
AM=M+1 // 13892
A=A-1 // 13893
M=D // 13894
// call Math.twoToThe
@6 // 13895
D=A // 13896
@14 // 13897
M=D // 13898
@Math.twoToThe // 13899
D=A // 13900
@13 // 13901
M=D // 13902
@Screen.drawPixel.ret.2 // 13903
D=A // 13904
@CALL // 13905
0;JMP // 13906
(Screen.drawPixel.ret.2)
@SP // 13907
AM=M-1 // 13908
D=M // 13909
@SP // 13910
AM=M-1 // 13911
D=D|M // 13912
@SP // 13913
AM=M-1 // 13914
A=M // 13915
M=D // 13916

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 13917
0;JMP // 13918

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
@LCL // 13919
A=M // 13920
D=M // 13921
@SP // 13922
AM=M+1 // 13923
A=A-1 // 13924
M=D // 13925
@LCL // 13926
A=M // 13927
D=M // 13928
@0 // 13929
A=D+A // 13930
D=M // 13931
@SP // 13932
AM=M+1 // 13933
A=A-1 // 13934
M=D // 13935
@LCL // 13936
A=M+1 // 13937
D=M // 13938
@SP // 13939
AM=M+1 // 13940
A=A-1 // 13941
M=D // 13942
// call Math.twoToThe
@6 // 13943
D=A // 13944
@14 // 13945
M=D // 13946
@Math.twoToThe // 13947
D=A // 13948
@13 // 13949
M=D // 13950
@Screen.drawPixel.ret.3 // 13951
D=A // 13952
@CALL // 13953
0;JMP // 13954
(Screen.drawPixel.ret.3)
@SP // 13955
AM=M-1 // 13956
D=M // 13957
D=!D // 13958
@SP // 13959
AM=M-1 // 13960
D=D&M // 13961
@SP // 13962
AM=M-1 // 13963
A=M // 13964
M=D // 13965

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13966
AM=M+1 // 13967
A=A-1 // 13968
M=0 // 13969

////ReturnInstruction{}
@RETURN // 13970
0;JMP // 13971

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 13972
AM=M+1 // 13973
A=A-1 // 13974
M=0 // 13975
@SP // 13976
AM=M+1 // 13977
A=A-1 // 13978
M=0 // 13979
@SP // 13980
AM=M+1 // 13981
A=A-1 // 13982
M=0 // 13983
@SP // 13984
AM=M+1 // 13985
A=A-1 // 13986
M=0 // 13987
@SP // 13988
AM=M+1 // 13989
A=A-1 // 13990
M=0 // 13991
@SP // 13992
AM=M+1 // 13993
A=A-1 // 13994
M=0 // 13995

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

@ARG // 13996
A=M+1 // 13997
A=A+1 // 13998
D=M // 13999
A=A-1 // 14000
A=A-1 // 14001
D=D-M // 14002
@SP // 14003
AM=M+1 // 14004
A=A-1 // 14005
M=D // 14006
// call Math.abs
@6 // 14007
D=A // 14008
@14 // 14009
M=D // 14010
@Math.abs // 14011
D=A // 14012
@13 // 14013
M=D // 14014
@Screen.drawLine.ret.0 // 14015
D=A // 14016
@CALL // 14017
0;JMP // 14018
(Screen.drawLine.ret.0)
@SP // 14019
AM=M-1 // 14020
D=M // 14021
@LCL // 14022
A=M // 14023
M=D // 14024

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

@ARG // 14025
A=M+1 // 14026
A=A+1 // 14027
A=A+1 // 14028
D=M // 14029
A=A-1 // 14030
A=A-1 // 14031
D=D-M // 14032
@SP // 14033
AM=M+1 // 14034
A=A-1 // 14035
M=D // 14036
// call Math.abs
@6 // 14037
D=A // 14038
@14 // 14039
M=D // 14040
@Math.abs // 14041
D=A // 14042
@13 // 14043
M=D // 14044
@Screen.drawLine.ret.1 // 14045
D=A // 14046
@CALL // 14047
0;JMP // 14048
(Screen.drawLine.ret.1)
@SP // 14049
AM=M-1 // 14050
D=M // 14051
@LCL // 14052
A=M+1 // 14053
M=D // 14054

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
@Screen.drawLine.LT.2 // 14055
D=A // 14056
@SP // 14057
AM=M+1 // 14058
A=A-1 // 14059
M=D // 14060
@ARG // 14061
A=M+1 // 14062
A=A+1 // 14063
D=M // 14064
A=A-1 // 14065
A=A-1 // 14066
D=M-D // 14067
@DO_LT // 14068
0;JMP // 14069
(Screen.drawLine.LT.2)
D=!D // 14070
@Screen.drawLine.IfElse1 // 14071
D;JNE // 14072

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 14073
A=M+1 // 14074
A=A+1 // 14075
M=1 // 14076

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 14077
0;JMP // 14078

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 14079
A=M+1 // 14080
A=A+1 // 14081
M=-1 // 14082

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
@Screen.drawLine.LT.3 // 14083
D=A // 14084
@SP // 14085
AM=M+1 // 14086
A=A-1 // 14087
M=D // 14088
@ARG // 14089
A=M+1 // 14090
A=A+1 // 14091
A=A+1 // 14092
D=M // 14093
A=A-1 // 14094
A=A-1 // 14095
D=M-D // 14096
@DO_LT // 14097
0;JMP // 14098
(Screen.drawLine.LT.3)
D=!D // 14099
@Screen.drawLine.IfElse2 // 14100
D;JNE // 14101

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 14102
A=M+1 // 14103
A=A+1 // 14104
A=A+1 // 14105
M=1 // 14106

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 14107
0;JMP // 14108

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 14109
A=M+1 // 14110
A=A+1 // 14111
A=A+1 // 14112
M=-1 // 14113

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

@LCL // 14114
A=M+1 // 14115
D=M // 14116
A=A-1 // 14117
D=M-D // 14118
@SP // 14119
AM=M+1 // 14120
A=A-1 // 14121
M=D // 14122
@LCL // 14123
D=M // 14124
@4 // 14125
A=D+A // 14126
D=A // 14127
@R13 // 14128
M=D // 14129
@SP // 14130
AM=M-1 // 14131
D=M // 14132
@R13 // 14133
A=M // 14134
M=D // 14135

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
D=0 // 14136
@WHILE_END_Screen.drawLine1 // 14137
D;JNE // 14138

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 14139
A=M // 14140
D=M // 14141
@SP // 14142
AM=M+1 // 14143
A=A-1 // 14144
M=D // 14145
@ARG // 14146
A=M+1 // 14147
D=M // 14148
@SP // 14149
AM=M+1 // 14150
A=A-1 // 14151
M=D // 14152
// call Screen.drawPixel
@7 // 14153
D=A // 14154
@14 // 14155
M=D // 14156
@Screen.drawPixel // 14157
D=A // 14158
@13 // 14159
M=D // 14160
@Screen.drawLine.ret.2 // 14161
D=A // 14162
@CALL // 14163
0;JMP // 14164
(Screen.drawLine.ret.2)
@SP // 14165
M=M-1 // 14166

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
@Screen.drawLine.EQ.4 // 14167
D=A // 14168
@SP // 14169
AM=M+1 // 14170
A=A-1 // 14171
M=D // 14172
@Screen.drawLine.EQ.5 // 14173
D=A // 14174
@SP // 14175
AM=M+1 // 14176
A=A-1 // 14177
M=D // 14178
@ARG // 14179
A=M+1 // 14180
A=A+1 // 14181
D=M // 14182
A=A-1 // 14183
A=A-1 // 14184
D=M-D // 14185
@DO_EQ // 14186
0;JMP // 14187
(Screen.drawLine.EQ.5)
@SP // 14188
AM=M+1 // 14189
A=A-1 // 14190
M=D // 14191
@Screen.drawLine.EQ.6 // 14192
D=A // 14193
@SP // 14194
AM=M+1 // 14195
A=A-1 // 14196
M=D // 14197
@ARG // 14198
A=M+1 // 14199
A=A+1 // 14200
A=A+1 // 14201
D=M // 14202
A=A-1 // 14203
A=A-1 // 14204
D=M-D // 14205
@DO_EQ // 14206
0;JMP // 14207
(Screen.drawLine.EQ.6)
@SP // 14208
AM=M-1 // 14209
D=D&M // 14210
@DO_EQ // 14211
0;JMP // 14212
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse3 // 14213
D;JNE // 14214

////PushInstruction("constant 0")
@SP // 14215
AM=M+1 // 14216
A=A-1 // 14217
M=0 // 14218

////ReturnInstruction{}
@RETURN // 14219
0;JMP // 14220

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 14221
0;JMP // 14222

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

@LCL // 14223
D=M // 14224
@4 // 14225
A=D+A // 14226
D=M // 14227
D=D+M // 14228
@SP // 14229
AM=M+1 // 14230
A=A-1 // 14231
M=D // 14232
@LCL // 14233
D=M // 14234
@5 // 14235
A=D+A // 14236
D=A // 14237
@R13 // 14238
M=D // 14239
@SP // 14240
AM=M-1 // 14241
D=M // 14242
@R13 // 14243
A=M // 14244
M=D // 14245

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
@Screen.drawLine.GT.7 // 14246
D=A // 14247
@SP // 14248
AM=M+1 // 14249
A=A-1 // 14250
M=D // 14251
@LCL // 14252
D=M // 14253
@5 // 14254
A=D+A // 14255
D=M // 14256
@SP // 14257
AM=M+1 // 14258
A=A-1 // 14259
M=D // 14260
@LCL // 14261
A=M+1 // 14262
D=M // 14263
@SP // 14264
AM=M-1 // 14265
D=D+M // 14266
@DO_GT // 14267
0;JMP // 14268
(Screen.drawLine.GT.7)
D=!D // 14269
@Screen.drawLine.IfElse4 // 14270
D;JNE // 14271

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

@LCL // 14272
D=M // 14273
@4 // 14274
A=D+A // 14275
D=M // 14276
A=A-1 // 14277
A=A-1 // 14278
A=A-1 // 14279
D=D-M // 14280
@SP // 14281
AM=M+1 // 14282
A=A-1 // 14283
M=D // 14284
@LCL // 14285
D=M // 14286
@4 // 14287
A=D+A // 14288
D=A // 14289
@R13 // 14290
M=D // 14291
@SP // 14292
AM=M-1 // 14293
D=M // 14294
@R13 // 14295
A=M // 14296
M=D // 14297

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

@ARG // 14298
A=M // 14299
D=M // 14300
@SP // 14301
AM=M+1 // 14302
A=A-1 // 14303
M=D // 14304
@LCL // 14305
A=M+1 // 14306
A=A+1 // 14307
D=M // 14308
@SP // 14309
AM=M-1 // 14310
D=D+M // 14311
@ARG // 14312
A=M // 14313
M=D // 14314

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 14315
0;JMP // 14316

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
@Screen.drawLine.LT.8 // 14317
D=A // 14318
@SP // 14319
AM=M+1 // 14320
A=A-1 // 14321
M=D // 14322
@LCL // 14323
D=M // 14324
@5 // 14325
A=D+A // 14326
D=M // 14327
@SP // 14328
AM=M+1 // 14329
A=A-1 // 14330
M=D // 14331
@LCL // 14332
A=M // 14333
D=M // 14334
@SP // 14335
AM=M-1 // 14336
D=M-D // 14337
@DO_LT // 14338
0;JMP // 14339
(Screen.drawLine.LT.8)
D=!D // 14340
@Screen.drawLine.IfElse5 // 14341
D;JNE // 14342

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

@LCL // 14343
D=M // 14344
@4 // 14345
A=D+A // 14346
D=M // 14347
@SP // 14348
AM=M+1 // 14349
A=A-1 // 14350
M=D // 14351
@LCL // 14352
A=M // 14353
D=M // 14354
@SP // 14355
AM=M-1 // 14356
D=D+M // 14357
@SP // 14358
AM=M+1 // 14359
A=A-1 // 14360
M=D // 14361
@LCL // 14362
D=M // 14363
@4 // 14364
A=D+A // 14365
D=A // 14366
@R13 // 14367
M=D // 14368
@SP // 14369
AM=M-1 // 14370
D=M // 14371
@R13 // 14372
A=M // 14373
M=D // 14374

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

@ARG // 14375
A=M+1 // 14376
D=M // 14377
@SP // 14378
AM=M+1 // 14379
A=A-1 // 14380
M=D // 14381
@LCL // 14382
A=M+1 // 14383
A=A+1 // 14384
A=A+1 // 14385
D=M // 14386
@SP // 14387
AM=M-1 // 14388
D=D+M // 14389
@ARG // 14390
A=M+1 // 14391
M=D // 14392

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 14393
0;JMP // 14394

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 14395
0;JMP // 14396

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 14397
AM=M+1 // 14398
A=A-1 // 14399
M=0 // 14400

////ReturnInstruction{}
@RETURN // 14401
0;JMP // 14402

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 14403
AM=M+1 // 14404
A=A-1 // 14405
M=0 // 14406

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 14407
A=M // 14408
D=M // 14409
@LCL // 14410
A=M // 14411
M=D // 14412

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
@Screen.drawHorizontalLine.EQ.9 // 14413
D=A // 14414
@SP // 14415
AM=M+1 // 14416
A=A-1 // 14417
M=D // 14418
@Screen.drawHorizontalLine.GT.10 // 14419
D=A // 14420
@SP // 14421
AM=M+1 // 14422
A=A-1 // 14423
M=D // 14424
@LCL // 14425
A=M // 14426
D=M // 14427
@SP // 14428
AM=M+1 // 14429
A=A-1 // 14430
M=D // 14431
@ARG // 14432
A=M+1 // 14433
D=M // 14434
@SP // 14435
AM=M-1 // 14436
D=M-D // 14437
@DO_GT // 14438
0;JMP // 14439
(Screen.drawHorizontalLine.GT.10)
D=!D // 14440
@DO_EQ // 14441
0;JMP // 14442
(Screen.drawHorizontalLine.EQ.9)
@WHILE_END_Screen.drawHorizontalLine1 // 14443
D;JNE // 14444

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14445
A=M // 14446
D=M // 14447
@SP // 14448
AM=M+1 // 14449
A=A-1 // 14450
M=D // 14451
@ARG // 14452
A=M+1 // 14453
A=A+1 // 14454
D=M // 14455
@SP // 14456
AM=M+1 // 14457
A=A-1 // 14458
M=D // 14459
// call Screen.drawPixel
@7 // 14460
D=A // 14461
@14 // 14462
M=D // 14463
@Screen.drawPixel // 14464
D=A // 14465
@13 // 14466
M=D // 14467
@Screen.drawHorizontalLine.ret.0 // 14468
D=A // 14469
@CALL // 14470
0;JMP // 14471
(Screen.drawHorizontalLine.ret.0)
@SP // 14472
M=M-1 // 14473

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

@LCL // 14474
A=M // 14475
D=M // 14476
D=D+1 // 14477
@LCL // 14478
A=M // 14479
M=D // 14480

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 14481
0;JMP // 14482

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 14483
AM=M+1 // 14484
A=A-1 // 14485
M=0 // 14486

////ReturnInstruction{}
@RETURN // 14487
0;JMP // 14488

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 14489
AM=M+1 // 14490
A=A-1 // 14491
M=0 // 14492
@SP // 14493
AM=M+1 // 14494
A=A-1 // 14495
M=0 // 14496
@SP // 14497
AM=M+1 // 14498
A=A-1 // 14499
M=0 // 14500
@SP // 14501
AM=M+1 // 14502
A=A-1 // 14503
M=0 // 14504
@SP // 14505
AM=M+1 // 14506
A=A-1 // 14507
M=0 // 14508

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14509
A=M // 14510
M=0 // 14511

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 14512
A=M+1 // 14513
A=A+1 // 14514
D=M // 14515
@LCL // 14516
A=M+1 // 14517
M=D // 14518

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

@ARG // 14519
A=M+1 // 14520
A=A+1 // 14521
D=M // 14522
D=D-1 // 14523
D=-D // 14524
@LCL // 14525
A=M+1 // 14526
A=A+1 // 14527
M=D // 14528

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
@Screen.drawCircle.EQ.11 // 14529
D=A // 14530
@SP // 14531
AM=M+1 // 14532
A=A-1 // 14533
M=D // 14534
@Screen.drawCircle.GT.12 // 14535
D=A // 14536
@SP // 14537
AM=M+1 // 14538
A=A-1 // 14539
M=D // 14540
@LCL // 14541
A=M+1 // 14542
D=M // 14543
A=A-1 // 14544
D=M-D // 14545
@DO_GT // 14546
0;JMP // 14547
(Screen.drawCircle.GT.12)
D=!D // 14548
@DO_EQ // 14549
0;JMP // 14550
(Screen.drawCircle.EQ.11)
@WHILE_END_Screen.drawCircle1 // 14551
D;JNE // 14552

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

@ARG // 14553
A=M // 14554
D=M // 14555
@SP // 14556
AM=M+1 // 14557
A=A-1 // 14558
M=D // 14559
@LCL // 14560
A=M // 14561
D=M // 14562
@SP // 14563
AM=M-1 // 14564
D=M-D // 14565
@SP // 14566
AM=M+1 // 14567
A=A-1 // 14568
M=D // 14569
@ARG // 14570
A=M // 14571
D=M // 14572
@SP // 14573
AM=M+1 // 14574
A=A-1 // 14575
M=D // 14576
@LCL // 14577
A=M // 14578
D=M // 14579
@SP // 14580
AM=M-1 // 14581
D=D+M // 14582
@SP // 14583
AM=M+1 // 14584
A=A-1 // 14585
M=D // 14586
@ARG // 14587
A=M+1 // 14588
D=M // 14589
@SP // 14590
AM=M+1 // 14591
A=A-1 // 14592
M=D // 14593
@LCL // 14594
A=M+1 // 14595
D=M // 14596
@SP // 14597
AM=M-1 // 14598
D=D+M // 14599
@SP // 14600
AM=M+1 // 14601
A=A-1 // 14602
M=D // 14603
// call Screen.drawHorizontalLine
@8 // 14604
D=A // 14605
@14 // 14606
M=D // 14607
@Screen.drawHorizontalLine // 14608
D=A // 14609
@13 // 14610
M=D // 14611
@Screen.drawCircle.ret.0 // 14612
D=A // 14613
@CALL // 14614
0;JMP // 14615
(Screen.drawCircle.ret.0)
@SP // 14616
M=M-1 // 14617

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

@ARG // 14618
A=M // 14619
D=M // 14620
@SP // 14621
AM=M+1 // 14622
A=A-1 // 14623
M=D // 14624
@LCL // 14625
A=M // 14626
D=M // 14627
@SP // 14628
AM=M-1 // 14629
D=M-D // 14630
@SP // 14631
AM=M+1 // 14632
A=A-1 // 14633
M=D // 14634
@ARG // 14635
A=M // 14636
D=M // 14637
@SP // 14638
AM=M+1 // 14639
A=A-1 // 14640
M=D // 14641
@LCL // 14642
A=M // 14643
D=M // 14644
@SP // 14645
AM=M-1 // 14646
D=D+M // 14647
@SP // 14648
AM=M+1 // 14649
A=A-1 // 14650
M=D // 14651
@ARG // 14652
A=M+1 // 14653
D=M // 14654
@SP // 14655
AM=M+1 // 14656
A=A-1 // 14657
M=D // 14658
@LCL // 14659
A=M+1 // 14660
D=M // 14661
@SP // 14662
AM=M-1 // 14663
D=M-D // 14664
@SP // 14665
AM=M+1 // 14666
A=A-1 // 14667
M=D // 14668
// call Screen.drawHorizontalLine
@8 // 14669
D=A // 14670
@14 // 14671
M=D // 14672
@Screen.drawHorizontalLine // 14673
D=A // 14674
@13 // 14675
M=D // 14676
@Screen.drawCircle.ret.1 // 14677
D=A // 14678
@CALL // 14679
0;JMP // 14680
(Screen.drawCircle.ret.1)
@SP // 14681
M=M-1 // 14682

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

@ARG // 14683
A=M // 14684
D=M // 14685
@SP // 14686
AM=M+1 // 14687
A=A-1 // 14688
M=D // 14689
@LCL // 14690
A=M+1 // 14691
D=M // 14692
@SP // 14693
AM=M-1 // 14694
D=M-D // 14695
@SP // 14696
AM=M+1 // 14697
A=A-1 // 14698
M=D // 14699
@ARG // 14700
A=M // 14701
D=M // 14702
@SP // 14703
AM=M+1 // 14704
A=A-1 // 14705
M=D // 14706
@LCL // 14707
A=M+1 // 14708
D=M // 14709
@SP // 14710
AM=M-1 // 14711
D=D+M // 14712
@SP // 14713
AM=M+1 // 14714
A=A-1 // 14715
M=D // 14716
@ARG // 14717
A=M+1 // 14718
D=M // 14719
@SP // 14720
AM=M+1 // 14721
A=A-1 // 14722
M=D // 14723
@LCL // 14724
A=M // 14725
D=M // 14726
@SP // 14727
AM=M-1 // 14728
D=D+M // 14729
@SP // 14730
AM=M+1 // 14731
A=A-1 // 14732
M=D // 14733
// call Screen.drawHorizontalLine
@8 // 14734
D=A // 14735
@14 // 14736
M=D // 14737
@Screen.drawHorizontalLine // 14738
D=A // 14739
@13 // 14740
M=D // 14741
@Screen.drawCircle.ret.2 // 14742
D=A // 14743
@CALL // 14744
0;JMP // 14745
(Screen.drawCircle.ret.2)
@SP // 14746
M=M-1 // 14747

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

@ARG // 14748
A=M // 14749
D=M // 14750
@SP // 14751
AM=M+1 // 14752
A=A-1 // 14753
M=D // 14754
@LCL // 14755
A=M+1 // 14756
D=M // 14757
@SP // 14758
AM=M-1 // 14759
D=M-D // 14760
@SP // 14761
AM=M+1 // 14762
A=A-1 // 14763
M=D // 14764
@ARG // 14765
A=M // 14766
D=M // 14767
@SP // 14768
AM=M+1 // 14769
A=A-1 // 14770
M=D // 14771
@LCL // 14772
A=M+1 // 14773
D=M // 14774
@SP // 14775
AM=M-1 // 14776
D=D+M // 14777
@SP // 14778
AM=M+1 // 14779
A=A-1 // 14780
M=D // 14781
@ARG // 14782
A=M+1 // 14783
D=M // 14784
@SP // 14785
AM=M+1 // 14786
A=A-1 // 14787
M=D // 14788
@LCL // 14789
A=M // 14790
D=M // 14791
@SP // 14792
AM=M-1 // 14793
D=M-D // 14794
@SP // 14795
AM=M+1 // 14796
A=A-1 // 14797
M=D // 14798
// call Screen.drawHorizontalLine
@8 // 14799
D=A // 14800
@14 // 14801
M=D // 14802
@Screen.drawHorizontalLine // 14803
D=A // 14804
@13 // 14805
M=D // 14806
@Screen.drawCircle.ret.3 // 14807
D=A // 14808
@CALL // 14809
0;JMP // 14810
(Screen.drawCircle.ret.3)
@SP // 14811
M=M-1 // 14812

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
@Screen.drawCircle.LT.13 // 14813
D=A // 14814
@SP // 14815
AM=M+1 // 14816
A=A-1 // 14817
M=D // 14818
@LCL // 14819
A=M+1 // 14820
A=A+1 // 14821
D=M // 14822
@DO_LT // 14823
0;JMP // 14824
(Screen.drawCircle.LT.13)
D=!D // 14825
@Screen.drawCircle.IfElse1 // 14826
D;JNE // 14827

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

@LCL // 14828
A=M+1 // 14829
A=A+1 // 14830
D=M // 14831
@SP // 14832
AM=M+1 // 14833
A=A-1 // 14834
M=D // 14835
@LCL // 14836
A=M // 14837
D=M // 14838
D=D+M // 14839
@SP // 14840
AM=M-1 // 14841
D=D+M // 14842
@3 // 14843
D=D+A // 14844
@LCL // 14845
A=M+1 // 14846
A=A+1 // 14847
M=D // 14848

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 14849
0;JMP // 14850

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

@LCL // 14851
A=M+1 // 14852
A=A+1 // 14853
D=M // 14854
@SP // 14855
AM=M+1 // 14856
A=A-1 // 14857
M=D // 14858
@LCL // 14859
A=M+1 // 14860
D=M // 14861
A=A-1 // 14862
D=M-D // 14863
@R13 // 14864
M=D // 14865
D=D+M // 14866
@SP // 14867
AM=M-1 // 14868
D=D+M // 14869
@5 // 14870
D=D+A // 14871
@LCL // 14872
A=M+1 // 14873
A=A+1 // 14874
M=D // 14875

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

@LCL // 14876
A=M+1 // 14877
D=M // 14878
D=D-1 // 14879
@LCL // 14880
A=M+1 // 14881
M=D // 14882

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

@LCL // 14883
A=M // 14884
D=M // 14885
D=D+1 // 14886
@LCL // 14887
A=M // 14888
M=D // 14889

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 14890
0;JMP // 14891

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 14892
AM=M+1 // 14893
A=A-1 // 14894
M=0 // 14895

////ReturnInstruction{}
@RETURN // 14896
0;JMP // 14897

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 14898
AM=M+1 // 14899
A=A-1 // 14900
M=0 // 14901
@SP // 14902
AM=M+1 // 14903
A=A-1 // 14904
M=0 // 14905
@SP // 14906
AM=M+1 // 14907
A=A-1 // 14908
M=0 // 14909
@SP // 14910
AM=M+1 // 14911
A=A-1 // 14912
M=0 // 14913
@SP // 14914
AM=M+1 // 14915
A=A-1 // 14916
M=0 // 14917
@SP // 14918
AM=M+1 // 14919
A=A-1 // 14920
M=0 // 14921
@SP // 14922
AM=M+1 // 14923
A=A-1 // 14924
M=0 // 14925
@SP // 14926
AM=M+1 // 14927
A=A-1 // 14928
M=0 // 14929
@SP // 14930
AM=M+1 // 14931
A=A-1 // 14932
M=0 // 14933
@SP // 14934
AM=M+1 // 14935
A=A-1 // 14936
M=0 // 14937

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14938
D=M // 14939
@9 // 14940
A=D+A // 14941
M=-1 // 14942

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.14 // 14943
D=A // 14944
@SP // 14945
AM=M+1 // 14946
A=A-1 // 14947
M=D // 14948
@Screen.0 // 14949
D=!M // 14950
@DO_EQ // 14951
0;JMP // 14952
(Screen.drawRectangle.EQ.14)
@Screen.drawRectangle.IfElse1 // 14953
D;JNE // 14954

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14955
D=M // 14956
@9 // 14957
A=D+A // 14958
M=0 // 14959

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 14960
0;JMP // 14961

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

@ARG // 14962
A=M+1 // 14963
D=M // 14964
@LCL // 14965
A=M // 14966
M=D // 14967

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
@Screen.drawRectangle.EQ.15 // 14968
D=A // 14969
@SP // 14970
AM=M+1 // 14971
A=A-1 // 14972
M=D // 14973
@Screen.drawRectangle.GT.16 // 14974
D=A // 14975
@SP // 14976
AM=M+1 // 14977
A=A-1 // 14978
M=D // 14979
@LCL // 14980
A=M // 14981
D=M // 14982
@SP // 14983
AM=M+1 // 14984
A=A-1 // 14985
M=D // 14986
@ARG // 14987
A=M+1 // 14988
A=A+1 // 14989
A=A+1 // 14990
D=M // 14991
@SP // 14992
AM=M-1 // 14993
D=M-D // 14994
@DO_GT // 14995
0;JMP // 14996
(Screen.drawRectangle.GT.16)
D=!D // 14997
@DO_EQ // 14998
0;JMP // 14999
(Screen.drawRectangle.EQ.15)
@WHILE_END_Screen.drawRectangle1 // 15000
D;JNE // 15001

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15002
A=M // 15003
D=M // 15004
@SP // 15005
AM=M+1 // 15006
A=A-1 // 15007
M=D // 15008
@16 // 15009
D=A // 15010
@SP // 15011
AM=M+1 // 15012
A=A-1 // 15013
M=D // 15014
// call Math.divide
@7 // 15015
D=A // 15016
@14 // 15017
M=D // 15018
@Math.divide // 15019
D=A // 15020
@13 // 15021
M=D // 15022
@Screen.drawRectangle.ret.0 // 15023
D=A // 15024
@CALL // 15025
0;JMP // 15026
(Screen.drawRectangle.ret.0)
@SP // 15027
AM=M-1 // 15028
D=M // 15029
@LCL // 15030
A=M+1 // 15031
M=D // 15032

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15033
A=M+1 // 15034
A=A+1 // 15035
D=M // 15036
@SP // 15037
AM=M+1 // 15038
A=A-1 // 15039
M=D // 15040
@16 // 15041
D=A // 15042
@SP // 15043
AM=M+1 // 15044
A=A-1 // 15045
M=D // 15046
// call Math.divide
@7 // 15047
D=A // 15048
@14 // 15049
M=D // 15050
@Math.divide // 15051
D=A // 15052
@13 // 15053
M=D // 15054
@Screen.drawRectangle.ret.1 // 15055
D=A // 15056
@CALL // 15057
0;JMP // 15058
(Screen.drawRectangle.ret.1)
@SP // 15059
AM=M-1 // 15060
D=M // 15061
@LCL // 15062
A=M+1 // 15063
A=A+1 // 15064
M=D // 15065

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

@ARG // 15066
A=M // 15067
D=M // 15068
@15 // 15069
D=D&A // 15070
@LCL // 15071
A=M+1 // 15072
A=A+1 // 15073
A=A+1 // 15074
M=D // 15075

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

@ARG // 15076
A=M+1 // 15077
A=A+1 // 15078
D=M // 15079
@15 // 15080
D=D&A // 15081
@SP // 15082
AM=M+1 // 15083
A=A-1 // 15084
M=D // 15085
@LCL // 15086
D=M // 15087
@4 // 15088
A=D+A // 15089
D=A // 15090
@R13 // 15091
M=D // 15092
@SP // 15093
AM=M-1 // 15094
D=M // 15095
@R13 // 15096
A=M // 15097
M=D // 15098

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15099
A=M // 15100
D=M // 15101
@SP // 15102
AM=M+1 // 15103
A=A-1 // 15104
M=D // 15105
@32 // 15106
D=A // 15107
@SP // 15108
AM=M+1 // 15109
A=A-1 // 15110
M=D // 15111
// call Math.multiply
@7 // 15112
D=A // 15113
@14 // 15114
M=D // 15115
@Math.multiply // 15116
D=A // 15117
@13 // 15118
M=D // 15119
@Screen.drawRectangle.ret.2 // 15120
D=A // 15121
@CALL // 15122
0;JMP // 15123
(Screen.drawRectangle.ret.2)
@LCL // 15124
D=M // 15125
@5 // 15126
A=D+A // 15127
D=A // 15128
@R13 // 15129
M=D // 15130
@SP // 15131
AM=M-1 // 15132
D=M // 15133
@R13 // 15134
A=M // 15135
M=D // 15136

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
@Screen.drawRectangle.EQ.17 // 15137
D=A // 15138
@SP // 15139
AM=M+1 // 15140
A=A-1 // 15141
M=D // 15142
@LCL // 15143
A=M+1 // 15144
A=A+1 // 15145
D=M // 15146
A=A-1 // 15147
D=M-D // 15148
@DO_EQ // 15149
0;JMP // 15150
(Screen.drawRectangle.EQ.17)
D=!D // 15151
@Screen.drawRectangle.IfElse2 // 15152
D;JNE // 15153

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

@LCL // 15154
D=M // 15155
@4 // 15156
A=D+A // 15157
D=M // 15158
@SP // 15159
AM=M+1 // 15160
A=A-1 // 15161
M=D+1 // 15162
// call Math.twoToThe
@6 // 15163
D=A // 15164
@14 // 15165
M=D // 15166
@Math.twoToThe // 15167
D=A // 15168
@13 // 15169
M=D // 15170
@Screen.drawRectangle.ret.3 // 15171
D=A // 15172
@CALL // 15173
0;JMP // 15174
(Screen.drawRectangle.ret.3)
@SP // 15175
AM=M-1 // 15176
D=M // 15177
D=D-1 // 15178
@SP // 15179
AM=M+1 // 15180
A=A-1 // 15181
M=D // 15182
@LCL // 15183
A=M+1 // 15184
A=A+1 // 15185
A=A+1 // 15186
D=M // 15187
@SP // 15188
AM=M+1 // 15189
A=A-1 // 15190
M=D // 15191
// call Math.twoToThe
@6 // 15192
D=A // 15193
@14 // 15194
M=D // 15195
@Math.twoToThe // 15196
D=A // 15197
@13 // 15198
M=D // 15199
@Screen.drawRectangle.ret.4 // 15200
D=A // 15201
@CALL // 15202
0;JMP // 15203
(Screen.drawRectangle.ret.4)
@SP // 15204
AM=M-1 // 15205
D=M // 15206
D=D-1 // 15207
@SP // 15208
AM=M-1 // 15209
D=M-D // 15210
@SP // 15211
AM=M+1 // 15212
A=A-1 // 15213
M=D // 15214
@LCL // 15215
D=M // 15216
@6 // 15217
A=D+A // 15218
D=A // 15219
@R13 // 15220
M=D // 15221
@SP // 15222
AM=M-1 // 15223
D=M // 15224
@R13 // 15225
A=M // 15226
M=D // 15227

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

@LCL // 15228
D=M // 15229
@5 // 15230
A=D+A // 15231
D=M // 15232
@SP // 15233
AM=M+1 // 15234
A=A-1 // 15235
M=D // 15236
@LCL // 15237
A=M+1 // 15238
D=M // 15239
@SP // 15240
AM=M-1 // 15241
D=D+M // 15242
@SP // 15243
AM=M+1 // 15244
A=A-1 // 15245
M=D // 15246
@LCL // 15247
D=M // 15248
@7 // 15249
A=D+A // 15250
D=A // 15251
@R13 // 15252
M=D // 15253
@SP // 15254
AM=M-1 // 15255
D=M // 15256
@R13 // 15257
A=M // 15258
M=D // 15259

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.18 // 15260
D=A // 15261
@SP // 15262
AM=M+1 // 15263
A=A-1 // 15264
M=D // 15265
@Screen.0 // 15266
D=M // 15267
@DO_EQ // 15268
0;JMP // 15269
(Screen.drawRectangle.EQ.18)
@Screen.drawRectangle.IfElse3 // 15270
D;JNE // 15271

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
@LCL // 15272
D=M // 15273
@7 // 15274
A=D+A // 15275
D=M // 15276
@16384 // 15277
D=D+A // 15278
@SP // 15279
AM=M+1 // 15280
A=A-1 // 15281
M=D // 15282
@LCL // 15283
D=M // 15284
@7 // 15285
A=D+A // 15286
D=M // 15287
@16384 // 15288
A=D+A // 15289
D=M // 15290
@SP // 15291
AM=M+1 // 15292
A=A-1 // 15293
M=D // 15294
@LCL // 15295
D=M // 15296
@6 // 15297
A=D+A // 15298
D=M // 15299
@SP // 15300
AM=M-1 // 15301
D=D|M // 15302
@SP // 15303
AM=M-1 // 15304
A=M // 15305
M=D // 15306

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 15307
0;JMP // 15308

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
@LCL // 15309
D=M // 15310
@7 // 15311
A=D+A // 15312
D=M // 15313
@16384 // 15314
D=D+A // 15315
@SP // 15316
AM=M+1 // 15317
A=A-1 // 15318
M=D // 15319
@LCL // 15320
D=M // 15321
@7 // 15322
A=D+A // 15323
D=M // 15324
@16384 // 15325
A=D+A // 15326
D=M // 15327
@SP // 15328
AM=M+1 // 15329
A=A-1 // 15330
M=D // 15331
@LCL // 15332
D=M // 15333
@6 // 15334
A=D+A // 15335
D=!M // 15336
@SP // 15337
AM=M-1 // 15338
D=D&M // 15339
@SP // 15340
AM=M-1 // 15341
A=M // 15342
M=D // 15343

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 15344
0;JMP // 15345

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

@LCL // 15346
A=M+1 // 15347
A=A+1 // 15348
A=A+1 // 15349
D=M // 15350
@SP // 15351
AM=M+1 // 15352
A=A-1 // 15353
M=D // 15354
// call Math.twoToThe
@6 // 15355
D=A // 15356
@14 // 15357
M=D // 15358
@Math.twoToThe // 15359
D=A // 15360
@13 // 15361
M=D // 15362
@Screen.drawRectangle.ret.5 // 15363
D=A // 15364
@CALL // 15365
0;JMP // 15366
(Screen.drawRectangle.ret.5)
@SP // 15367
AM=M-1 // 15368
D=M // 15369
D=D-1 // 15370
@SP // 15371
AM=M+1 // 15372
A=A-1 // 15373
M=D // 15374
@SP // 15375
A=M-1 // 15376
M=!D // 15377
@LCL // 15378
D=M // 15379
@6 // 15380
A=D+A // 15381
D=A // 15382
@R13 // 15383
M=D // 15384
@SP // 15385
AM=M-1 // 15386
D=M // 15387
@R13 // 15388
A=M // 15389
M=D // 15390

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

@LCL // 15391
D=M // 15392
@5 // 15393
A=D+A // 15394
D=M // 15395
@SP // 15396
AM=M+1 // 15397
A=A-1 // 15398
M=D // 15399
@LCL // 15400
A=M+1 // 15401
D=M // 15402
@SP // 15403
AM=M-1 // 15404
D=D+M // 15405
@SP // 15406
AM=M+1 // 15407
A=A-1 // 15408
M=D // 15409
@LCL // 15410
D=M // 15411
@7 // 15412
A=D+A // 15413
D=A // 15414
@R13 // 15415
M=D // 15416
@SP // 15417
AM=M-1 // 15418
D=M // 15419
@R13 // 15420
A=M // 15421
M=D // 15422

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.19 // 15423
D=A // 15424
@SP // 15425
AM=M+1 // 15426
A=A-1 // 15427
M=D // 15428
@Screen.0 // 15429
D=M // 15430
@DO_EQ // 15431
0;JMP // 15432
(Screen.drawRectangle.EQ.19)
@Screen.drawRectangle.IfElse4 // 15433
D;JNE // 15434

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
@LCL // 15435
D=M // 15436
@7 // 15437
A=D+A // 15438
D=M // 15439
@16384 // 15440
D=D+A // 15441
@SP // 15442
AM=M+1 // 15443
A=A-1 // 15444
M=D // 15445
@LCL // 15446
D=M // 15447
@7 // 15448
A=D+A // 15449
D=M // 15450
@16384 // 15451
A=D+A // 15452
D=M // 15453
@SP // 15454
AM=M+1 // 15455
A=A-1 // 15456
M=D // 15457
@LCL // 15458
D=M // 15459
@6 // 15460
A=D+A // 15461
D=M // 15462
@SP // 15463
AM=M-1 // 15464
D=D|M // 15465
@SP // 15466
AM=M-1 // 15467
A=M // 15468
M=D // 15469

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 15470
0;JMP // 15471

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
@LCL // 15472
D=M // 15473
@7 // 15474
A=D+A // 15475
D=M // 15476
@16384 // 15477
D=D+A // 15478
@SP // 15479
AM=M+1 // 15480
A=A-1 // 15481
M=D // 15482
@LCL // 15483
D=M // 15484
@7 // 15485
A=D+A // 15486
D=M // 15487
@16384 // 15488
A=D+A // 15489
D=M // 15490
@SP // 15491
AM=M+1 // 15492
A=A-1 // 15493
M=D // 15494
@LCL // 15495
D=M // 15496
@6 // 15497
A=D+A // 15498
D=!M // 15499
@SP // 15500
AM=M-1 // 15501
D=D&M // 15502
@SP // 15503
AM=M-1 // 15504
A=M // 15505
M=D // 15506

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

@LCL // 15507
A=M+1 // 15508
D=M // 15509
@SP // 15510
AM=M+1 // 15511
A=A-1 // 15512
M=D+1 // 15513
@LCL // 15514
D=M // 15515
@8 // 15516
A=D+A // 15517
D=A // 15518
@R13 // 15519
M=D // 15520
@SP // 15521
AM=M-1 // 15522
D=M // 15523
@R13 // 15524
A=M // 15525
M=D // 15526

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
@Screen.drawRectangle.LT.20 // 15527
D=A // 15528
@SP // 15529
AM=M+1 // 15530
A=A-1 // 15531
M=D // 15532
@LCL // 15533
D=M // 15534
@8 // 15535
A=D+A // 15536
D=M // 15537
@SP // 15538
AM=M+1 // 15539
A=A-1 // 15540
M=D // 15541
@LCL // 15542
A=M+1 // 15543
A=A+1 // 15544
D=M // 15545
@SP // 15546
AM=M-1 // 15547
D=M-D // 15548
@DO_LT // 15549
0;JMP // 15550
(Screen.drawRectangle.LT.20)
D=!D // 15551
@WHILE_END_Screen.drawRectangle2 // 15552
D;JNE // 15553

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

@LCL // 15554
D=M // 15555
@8 // 15556
A=D+A // 15557
D=M // 15558
A=A-1 // 15559
A=A-1 // 15560
A=A-1 // 15561
D=D+M // 15562
@SP // 15563
AM=M+1 // 15564
A=A-1 // 15565
M=D // 15566
@LCL // 15567
D=M // 15568
@7 // 15569
A=D+A // 15570
D=A // 15571
@R13 // 15572
M=D // 15573
@SP // 15574
AM=M-1 // 15575
D=M // 15576
@R13 // 15577
A=M // 15578
M=D // 15579

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 15580
D=M // 15581
@7 // 15582
A=D+A // 15583
D=M // 15584
@16384 // 15585
D=D+A // 15586
@SP // 15587
AM=M+1 // 15588
A=A-1 // 15589
M=D // 15590
@LCL // 15591
D=M // 15592
@9 // 15593
A=D+A // 15594
D=M // 15595
@SP // 15596
AM=M-1 // 15597
A=M // 15598
M=D // 15599

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

@LCL // 15600
D=M // 15601
@8 // 15602
A=D+A // 15603
D=M // 15604
@SP // 15605
AM=M+1 // 15606
A=A-1 // 15607
M=D+1 // 15608
@LCL // 15609
D=M // 15610
@8 // 15611
A=D+A // 15612
D=A // 15613
@R13 // 15614
M=D // 15615
@SP // 15616
AM=M-1 // 15617
D=M // 15618
@R13 // 15619
A=M // 15620
M=D // 15621

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 15622
0;JMP // 15623

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

@LCL // 15624
D=M // 15625
@4 // 15626
A=D+A // 15627
D=M // 15628
@SP // 15629
AM=M+1 // 15630
A=A-1 // 15631
M=D+1 // 15632
// call Math.twoToThe
@6 // 15633
D=A // 15634
@14 // 15635
M=D // 15636
@Math.twoToThe // 15637
D=A // 15638
@13 // 15639
M=D // 15640
@Screen.drawRectangle.ret.6 // 15641
D=A // 15642
@CALL // 15643
0;JMP // 15644
(Screen.drawRectangle.ret.6)
@SP // 15645
AM=M-1 // 15646
D=M // 15647
D=D-1 // 15648
@SP // 15649
AM=M+1 // 15650
A=A-1 // 15651
M=D // 15652
@LCL // 15653
D=M // 15654
@6 // 15655
A=D+A // 15656
D=A // 15657
@R13 // 15658
M=D // 15659
@SP // 15660
AM=M-1 // 15661
D=M // 15662
@R13 // 15663
A=M // 15664
M=D // 15665

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

@LCL // 15666
D=M // 15667
@5 // 15668
A=D+A // 15669
D=M // 15670
A=A-1 // 15671
A=A-1 // 15672
A=A-1 // 15673
D=D+M // 15674
@SP // 15675
AM=M+1 // 15676
A=A-1 // 15677
M=D // 15678
@LCL // 15679
D=M // 15680
@7 // 15681
A=D+A // 15682
D=A // 15683
@R13 // 15684
M=D // 15685
@SP // 15686
AM=M-1 // 15687
D=M // 15688
@R13 // 15689
A=M // 15690
M=D // 15691

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.21 // 15692
D=A // 15693
@SP // 15694
AM=M+1 // 15695
A=A-1 // 15696
M=D // 15697
@Screen.0 // 15698
D=M // 15699
@DO_EQ // 15700
0;JMP // 15701
(Screen.drawRectangle.EQ.21)
@Screen.drawRectangle.IfElse5 // 15702
D;JNE // 15703

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
@LCL // 15704
D=M // 15705
@7 // 15706
A=D+A // 15707
D=M // 15708
@16384 // 15709
D=D+A // 15710
@SP // 15711
AM=M+1 // 15712
A=A-1 // 15713
M=D // 15714
@LCL // 15715
D=M // 15716
@7 // 15717
A=D+A // 15718
D=M // 15719
@16384 // 15720
A=D+A // 15721
D=M // 15722
@SP // 15723
AM=M+1 // 15724
A=A-1 // 15725
M=D // 15726
@LCL // 15727
D=M // 15728
@6 // 15729
A=D+A // 15730
D=M // 15731
@SP // 15732
AM=M-1 // 15733
D=D|M // 15734
@SP // 15735
AM=M-1 // 15736
A=M // 15737
M=D // 15738

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 15739
0;JMP // 15740

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
@LCL // 15741
D=M // 15742
@7 // 15743
A=D+A // 15744
D=M // 15745
@16384 // 15746
D=D+A // 15747
@SP // 15748
AM=M+1 // 15749
A=A-1 // 15750
M=D // 15751
@LCL // 15752
D=M // 15753
@7 // 15754
A=D+A // 15755
D=M // 15756
@16384 // 15757
A=D+A // 15758
D=M // 15759
@SP // 15760
AM=M+1 // 15761
A=A-1 // 15762
M=D // 15763
@LCL // 15764
D=M // 15765
@6 // 15766
A=D+A // 15767
D=!M // 15768
@SP // 15769
AM=M-1 // 15770
D=D&M // 15771
@SP // 15772
AM=M-1 // 15773
A=M // 15774
M=D // 15775

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

@LCL // 15776
A=M // 15777
D=M // 15778
D=D+1 // 15779
@LCL // 15780
A=M // 15781
M=D // 15782

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 15783
0;JMP // 15784

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 15785
AM=M+1 // 15786
A=A-1 // 15787
M=0 // 15788

////ReturnInstruction{}
@RETURN // 15789
0;JMP // 15790

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 15791
AM=M+1 // 15792
A=A-1 // 15793
M=0 // 15794

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15795
A=M // 15796
M=0 // 15797

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
@Screen.clearScreen.LT.22 // 15798
D=A // 15799
@SP // 15800
AM=M+1 // 15801
A=A-1 // 15802
M=D // 15803
@LCL // 15804
A=M // 15805
D=M // 15806
@8192 // 15807
D=D-A // 15808
@DO_LT // 15809
0;JMP // 15810
(Screen.clearScreen.LT.22)
D=!D // 15811
@WHILE_END_Screen.clearScreen1 // 15812
D;JNE // 15813

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 15814
A=M // 15815
D=M // 15816
@16384 // 15817
D=D+A // 15818
@SP // 15819
AM=M+1 // 15820
A=A-1 // 15821
M=D // 15822
D=0 // 15823
@SP // 15824
AM=M-1 // 15825
A=M // 15826
M=D // 15827

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

@LCL // 15828
A=M // 15829
D=M // 15830
D=D+1 // 15831
@LCL // 15832
A=M // 15833
M=D // 15834

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 15835
0;JMP // 15836

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 15837
AM=M+1 // 15838
A=A-1 // 15839
M=0 // 15840

////ReturnInstruction{}
@RETURN // 15841
0;JMP // 15842

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 15843
D=A // 15844
@SP // 15845
AM=M+1 // 15846
A=A-1 // 15847
M=D // 15848
// call Memory.alloc
@6 // 15849
D=A // 15850
@14 // 15851
M=D // 15852
@Memory.alloc // 15853
D=A // 15854
@13 // 15855
M=D // 15856
@String.new.ret.0 // 15857
D=A // 15858
@CALL // 15859
0;JMP // 15860
(String.new.ret.0)
@SP // 15861
AM=M-1 // 15862
D=M // 15863
@3 // 15864
M=D // 15865

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
@String.new.EQ.0 // 15866
D=A // 15867
@SP // 15868
AM=M+1 // 15869
A=A-1 // 15870
M=D // 15871
@ARG // 15872
A=M // 15873
D=M // 15874
@DO_EQ // 15875
0;JMP // 15876
(String.new.EQ.0)
D=!D // 15877
@String.new.IfElse1 // 15878
D;JNE // 15879

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 15880
A=M // 15881
M=0 // 15882

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 15883
0;JMP // 15884

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 15885
A=M // 15886
D=M // 15887
@SP // 15888
AM=M+1 // 15889
A=A-1 // 15890
M=D // 15891
// call Array.new
@6 // 15892
D=A // 15893
@14 // 15894
M=D // 15895
@Array.new // 15896
D=A // 15897
@13 // 15898
M=D // 15899
@String.new.ret.1 // 15900
D=A // 15901
@CALL // 15902
0;JMP // 15903
(String.new.ret.1)
@SP // 15904
AM=M-1 // 15905
D=M // 15906
@THIS // 15907
A=M // 15908
M=D // 15909

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 15910
A=M // 15911
D=M // 15912
@THIS // 15913
A=M+1 // 15914
A=A+1 // 15915
M=D // 15916

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 15917
A=M+1 // 15918
M=0 // 15919

////PushInstruction("pointer 0")
@3 // 15920
D=M // 15921
@SP // 15922
AM=M+1 // 15923
A=A-1 // 15924
M=D // 15925

////ReturnInstruction{}
@RETURN // 15926
0;JMP // 15927

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15928
A=M // 15929
D=M // 15930
@3 // 15931
M=D // 15932

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
@String.dispose.EQ.1 // 15933
D=A // 15934
@SP // 15935
AM=M+1 // 15936
A=A-1 // 15937
M=D // 15938
@String.dispose.EQ.2 // 15939
D=A // 15940
@SP // 15941
AM=M+1 // 15942
A=A-1 // 15943
M=D // 15944
@THIS // 15945
A=M // 15946
D=M // 15947
@DO_EQ // 15948
0;JMP // 15949
(String.dispose.EQ.2)
D=!D // 15950
@DO_EQ // 15951
0;JMP // 15952
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 15953
D;JNE // 15954

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15955
A=M // 15956
D=M // 15957
@SP // 15958
AM=M+1 // 15959
A=A-1 // 15960
M=D // 15961
// call Array.dispose
@6 // 15962
D=A // 15963
@14 // 15964
M=D // 15965
@Array.dispose // 15966
D=A // 15967
@13 // 15968
M=D // 15969
@String.dispose.ret.0 // 15970
D=A // 15971
@CALL // 15972
0;JMP // 15973
(String.dispose.ret.0)
@SP // 15974
M=M-1 // 15975

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 15976
0;JMP // 15977

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 15978
AM=M+1 // 15979
A=A-1 // 15980
M=0 // 15981

////ReturnInstruction{}
@RETURN // 15982
0;JMP // 15983

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15984
A=M // 15985
D=M // 15986
@3 // 15987
M=D // 15988

////PushInstruction("this 1")
@THIS // 15989
A=M+1 // 15990
D=M // 15991
@SP // 15992
AM=M+1 // 15993
A=A-1 // 15994
M=D // 15995

////ReturnInstruction{}
@RETURN // 15996
0;JMP // 15997

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15998
A=M // 15999
D=M // 16000
@3 // 16001
M=D // 16002

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
@THIS // 16003
A=M // 16004
D=M // 16005
@SP // 16006
AM=M+1 // 16007
A=A-1 // 16008
M=D // 16009
@ARG // 16010
A=M+1 // 16011
D=M // 16012
@SP // 16013
AM=M-1 // 16014
A=D+M // 16015
D=M // 16016
@SP // 16017
AM=M+1 // 16018
A=A-1 // 16019
M=D // 16020

////ReturnInstruction{}
@RETURN // 16021
0;JMP // 16022

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16023
A=M // 16024
D=M // 16025
@3 // 16026
M=D // 16027

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 16028
A=M // 16029
D=M // 16030
@SP // 16031
AM=M+1 // 16032
A=A-1 // 16033
M=D // 16034
@ARG // 16035
A=M+1 // 16036
D=M // 16037
@SP // 16038
AM=M-1 // 16039
D=D+M // 16040
@SP // 16041
AM=M+1 // 16042
A=A-1 // 16043
M=D // 16044
@ARG // 16045
A=M+1 // 16046
A=A+1 // 16047
D=M // 16048
@SP // 16049
AM=M-1 // 16050
A=M // 16051
M=D // 16052

////PushInstruction("constant 0")
@SP // 16053
AM=M+1 // 16054
A=A-1 // 16055
M=0 // 16056

////ReturnInstruction{}
@RETURN // 16057
0;JMP // 16058

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 16059
AM=M+1 // 16060
A=A-1 // 16061
M=0 // 16062

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16063
A=M // 16064
D=M // 16065
@3 // 16066
M=D // 16067

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
@String.appendChar.EQ.3 // 16068
D=A // 16069
@SP // 16070
AM=M+1 // 16071
A=A-1 // 16072
M=D // 16073
@THIS // 16074
A=M+1 // 16075
A=A+1 // 16076
D=M // 16077
A=A-1 // 16078
D=M-D // 16079
@DO_EQ // 16080
0;JMP // 16081
(String.appendChar.EQ.3)
D=!D // 16082
@String.appendChar.IfElse1 // 16083
D;JNE // 16084

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

@THIS // 16085
A=M+1 // 16086
A=A+1 // 16087
D=M // 16088
D=D+M // 16089
@SP // 16090
AM=M+1 // 16091
A=A-1 // 16092
M=D // 16093
// call Array.new
@6 // 16094
D=A // 16095
@14 // 16096
M=D // 16097
@Array.new // 16098
D=A // 16099
@13 // 16100
M=D // 16101
@String.appendChar.ret.0 // 16102
D=A // 16103
@CALL // 16104
0;JMP // 16105
(String.appendChar.ret.0)
@SP // 16106
AM=M-1 // 16107
D=M // 16108
@LCL // 16109
A=M // 16110
M=D // 16111

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 16112
A=M // 16113
D=M // 16114
@SP // 16115
AM=M+1 // 16116
A=A-1 // 16117
M=D // 16118
@LCL // 16119
A=M // 16120
D=M // 16121
@SP // 16122
AM=M+1 // 16123
A=A-1 // 16124
M=D // 16125
@THIS // 16126
A=M+1 // 16127
D=M // 16128
@SP // 16129
AM=M+1 // 16130
A=A-1 // 16131
M=D // 16132
// call Memory.copy
@8 // 16133
D=A // 16134
@14 // 16135
M=D // 16136
@Memory.copy // 16137
D=A // 16138
@13 // 16139
M=D // 16140
@String.appendChar.ret.1 // 16141
D=A // 16142
@CALL // 16143
0;JMP // 16144
(String.appendChar.ret.1)
@SP // 16145
M=M-1 // 16146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 16147
A=M // 16148
D=M // 16149
@SP // 16150
AM=M+1 // 16151
A=A-1 // 16152
M=D // 16153
// call Array.dispose
@6 // 16154
D=A // 16155
@14 // 16156
M=D // 16157
@Array.dispose // 16158
D=A // 16159
@13 // 16160
M=D // 16161
@String.appendChar.ret.2 // 16162
D=A // 16163
@CALL // 16164
0;JMP // 16165
(String.appendChar.ret.2)
@SP // 16166
M=M-1 // 16167

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

@THIS // 16168
A=M+1 // 16169
A=A+1 // 16170
D=M // 16171
D=D+M // 16172
@THIS // 16173
A=M+1 // 16174
A=A+1 // 16175
M=D // 16176

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 16177
A=M // 16178
D=M // 16179
@THIS // 16180
A=M // 16181
M=D // 16182

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 16183
0;JMP // 16184

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
@THIS // 16185
A=M+1 // 16186
D=M // 16187
A=A-1 // 16188
D=D+M // 16189
@SP // 16190
AM=M+1 // 16191
A=A-1 // 16192
M=D // 16193
@ARG // 16194
A=M+1 // 16195
D=M // 16196
@SP // 16197
AM=M-1 // 16198
A=M // 16199
M=D // 16200

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

@THIS // 16201
A=M+1 // 16202
D=M // 16203
D=D+1 // 16204
@THIS // 16205
A=M+1 // 16206
M=D // 16207

////PushInstruction("pointer 0")
@3 // 16208
D=M // 16209
@SP // 16210
AM=M+1 // 16211
A=A-1 // 16212
M=D // 16213

////ReturnInstruction{}
@RETURN // 16214
0;JMP // 16215

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16216
A=M // 16217
D=M // 16218
@3 // 16219
M=D // 16220

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

@THIS // 16221
A=M+1 // 16222
D=M // 16223
D=D-1 // 16224
@THIS // 16225
A=M+1 // 16226
M=D // 16227

////PushInstruction("constant 0")
@SP // 16228
AM=M+1 // 16229
A=A-1 // 16230
M=0 // 16231

////ReturnInstruction{}
@RETURN // 16232
0;JMP // 16233

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 16234
AM=M+1 // 16235
A=A-1 // 16236
M=0 // 16237
@SP // 16238
AM=M+1 // 16239
A=A-1 // 16240
M=0 // 16241

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16242
A=M // 16243
D=M // 16244
@3 // 16245
M=D // 16246

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 16247
A=M+1 // 16248
M=1 // 16249

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 16250
A=M // 16251
M=0 // 16252

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
@String.intValue.LT.4 // 16253
D=A // 16254
@SP // 16255
AM=M+1 // 16256
A=A-1 // 16257
M=D // 16258
@LCL // 16259
A=M+1 // 16260
D=M // 16261
@SP // 16262
AM=M+1 // 16263
A=A-1 // 16264
M=D // 16265
@THIS // 16266
A=M+1 // 16267
D=M // 16268
@SP // 16269
AM=M-1 // 16270
D=M-D // 16271
@DO_LT // 16272
0;JMP // 16273
(String.intValue.LT.4)
D=!D // 16274
@WHILE_END_String.intValue1 // 16275
D;JNE // 16276

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

@LCL // 16277
A=M // 16278
D=M // 16279
@SP // 16280
AM=M+1 // 16281
A=A-1 // 16282
M=D // 16283
@10 // 16284
D=A // 16285
@SP // 16286
AM=M+1 // 16287
A=A-1 // 16288
M=D // 16289
// call Math.multiply
@7 // 16290
D=A // 16291
@14 // 16292
M=D // 16293
@Math.multiply // 16294
D=A // 16295
@13 // 16296
M=D // 16297
@String.intValue.ret.0 // 16298
D=A // 16299
@CALL // 16300
0;JMP // 16301
(String.intValue.ret.0)
@THIS // 16302
A=M // 16303
D=M // 16304
@SP // 16305
AM=M+1 // 16306
A=A-1 // 16307
M=D // 16308
@LCL // 16309
A=M+1 // 16310
D=M // 16311
@SP // 16312
AM=M-1 // 16313
A=D+M // 16314
D=M // 16315
@48 // 16316
D=D-A // 16317
@SP // 16318
AM=M-1 // 16319
D=D+M // 16320
@LCL // 16321
A=M // 16322
M=D // 16323

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

@LCL // 16324
A=M+1 // 16325
D=M // 16326
D=D+1 // 16327
@LCL // 16328
A=M+1 // 16329
M=D // 16330

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 16331
0;JMP // 16332

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 16333
A=M // 16334
D=M // 16335
@SP // 16336
AM=M+1 // 16337
A=A-1 // 16338
M=D // 16339

////ReturnInstruction{}
@RETURN // 16340
0;JMP // 16341

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 16342
AM=M+1 // 16343
A=A-1 // 16344
M=0 // 16345
@SP // 16346
AM=M+1 // 16347
A=A-1 // 16348
M=0 // 16349
@SP // 16350
AM=M+1 // 16351
A=A-1 // 16352
M=0 // 16353
@SP // 16354
AM=M+1 // 16355
A=A-1 // 16356
M=0 // 16357
@SP // 16358
AM=M+1 // 16359
A=A-1 // 16360
M=0 // 16361
@SP // 16362
AM=M+1 // 16363
A=A-1 // 16364
M=0 // 16365

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16366
A=M // 16367
D=M // 16368
@3 // 16369
M=D // 16370

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 16371
A=M+1 // 16372
M=0 // 16373

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 16374
D=M // 16375
@4 // 16376
A=D+A // 16377
M=0 // 16378

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
@String.setInt.EQ.5 // 16379
D=A // 16380
@SP // 16381
AM=M+1 // 16382
A=A-1 // 16383
M=D // 16384
@ARG // 16385
A=M+1 // 16386
D=M // 16387
@DO_EQ // 16388
0;JMP // 16389
(String.setInt.EQ.5)
D=!D // 16390
@String.setInt.IfElse1 // 16391
D;JNE // 16392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16393
D=M // 16394
@SP // 16395
AM=M+1 // 16396
A=A-1 // 16397
M=D // 16398
@48 // 16399
D=A // 16400
@SP // 16401
AM=M+1 // 16402
A=A-1 // 16403
M=D // 16404
// call String.appendChar
@7 // 16405
D=A // 16406
@14 // 16407
M=D // 16408
@String.appendChar // 16409
D=A // 16410
@13 // 16411
M=D // 16412
@String.setInt.ret.0 // 16413
D=A // 16414
@CALL // 16415
0;JMP // 16416
(String.setInt.ret.0)
@SP // 16417
M=M-1 // 16418

////PushInstruction("constant 0")
@SP // 16419
AM=M+1 // 16420
A=A-1 // 16421
M=0 // 16422

////ReturnInstruction{}
@RETURN // 16423
0;JMP // 16424

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 16425
0;JMP // 16426

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
@String.setInt.LT.6 // 16427
D=A // 16428
@SP // 16429
AM=M+1 // 16430
A=A-1 // 16431
M=D // 16432
@ARG // 16433
A=M+1 // 16434
D=M // 16435
@DO_LT // 16436
0;JMP // 16437
(String.setInt.LT.6)
D=!D // 16438
@String.setInt.IfElse2 // 16439
D;JNE // 16440

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 16441
D=M // 16442
@4 // 16443
A=D+A // 16444
M=1 // 16445

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
@String.setInt.EQ.7 // 16446
D=A // 16447
@SP // 16448
AM=M+1 // 16449
A=A-1 // 16450
M=D // 16451
@String.setInt.LT.8 // 16452
D=A // 16453
@SP // 16454
AM=M+1 // 16455
A=A-1 // 16456
M=D // 16457
@ARG // 16458
A=M+1 // 16459
D=M // 16460
@DO_LT // 16461
0;JMP // 16462
(String.setInt.LT.8)
@SP // 16463
AM=M+1 // 16464
A=A-1 // 16465
M=D // 16466
@String.setInt.EQ.9 // 16467
D=A // 16468
@SP // 16469
AM=M+1 // 16470
A=A-1 // 16471
M=D // 16472
@ARG // 16473
A=M+1 // 16474
D=M // 16475
@32767 // 16476
D=D&A // 16477
@32767 // 16478
D=D-A // 16479
@DO_EQ // 16480
0;JMP // 16481
(String.setInt.EQ.9)
@SP // 16482
AM=M-1 // 16483
D=D&M // 16484
@DO_EQ // 16485
0;JMP // 16486
(String.setInt.EQ.7)
@String.setInt.IfElse3 // 16487
D;JNE // 16488

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16489
D=M // 16490
@SP // 16491
AM=M+1 // 16492
A=A-1 // 16493
M=D // 16494
@45 // 16495
D=A // 16496
@SP // 16497
AM=M+1 // 16498
A=A-1 // 16499
M=D // 16500
// call String.appendChar
@7 // 16501
D=A // 16502
@14 // 16503
M=D // 16504
@String.appendChar // 16505
D=A // 16506
@13 // 16507
M=D // 16508
@String.setInt.ret.1 // 16509
D=A // 16510
@CALL // 16511
0;JMP // 16512
(String.setInt.ret.1)
@SP // 16513
M=M-1 // 16514

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16515
D=M // 16516
@SP // 16517
AM=M+1 // 16518
A=A-1 // 16519
M=D // 16520
@51 // 16521
D=A // 16522
@SP // 16523
AM=M+1 // 16524
A=A-1 // 16525
M=D // 16526
// call String.appendChar
@7 // 16527
D=A // 16528
@14 // 16529
M=D // 16530
@String.appendChar // 16531
D=A // 16532
@13 // 16533
M=D // 16534
@String.setInt.ret.2 // 16535
D=A // 16536
@CALL // 16537
0;JMP // 16538
(String.setInt.ret.2)
@SP // 16539
M=M-1 // 16540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16541
D=M // 16542
@SP // 16543
AM=M+1 // 16544
A=A-1 // 16545
M=D // 16546
@50 // 16547
D=A // 16548
@SP // 16549
AM=M+1 // 16550
A=A-1 // 16551
M=D // 16552
// call String.appendChar
@7 // 16553
D=A // 16554
@14 // 16555
M=D // 16556
@String.appendChar // 16557
D=A // 16558
@13 // 16559
M=D // 16560
@String.setInt.ret.3 // 16561
D=A // 16562
@CALL // 16563
0;JMP // 16564
(String.setInt.ret.3)
@SP // 16565
M=M-1 // 16566

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16567
D=M // 16568
@SP // 16569
AM=M+1 // 16570
A=A-1 // 16571
M=D // 16572
@55 // 16573
D=A // 16574
@SP // 16575
AM=M+1 // 16576
A=A-1 // 16577
M=D // 16578
// call String.appendChar
@7 // 16579
D=A // 16580
@14 // 16581
M=D // 16582
@String.appendChar // 16583
D=A // 16584
@13 // 16585
M=D // 16586
@String.setInt.ret.4 // 16587
D=A // 16588
@CALL // 16589
0;JMP // 16590
(String.setInt.ret.4)
@SP // 16591
M=M-1 // 16592

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16593
D=M // 16594
@SP // 16595
AM=M+1 // 16596
A=A-1 // 16597
M=D // 16598
@54 // 16599
D=A // 16600
@SP // 16601
AM=M+1 // 16602
A=A-1 // 16603
M=D // 16604
// call String.appendChar
@7 // 16605
D=A // 16606
@14 // 16607
M=D // 16608
@String.appendChar // 16609
D=A // 16610
@13 // 16611
M=D // 16612
@String.setInt.ret.5 // 16613
D=A // 16614
@CALL // 16615
0;JMP // 16616
(String.setInt.ret.5)
@SP // 16617
M=M-1 // 16618

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16619
D=M // 16620
@SP // 16621
AM=M+1 // 16622
A=A-1 // 16623
M=D // 16624
@56 // 16625
D=A // 16626
@SP // 16627
AM=M+1 // 16628
A=A-1 // 16629
M=D // 16630
// call String.appendChar
@7 // 16631
D=A // 16632
@14 // 16633
M=D // 16634
@String.appendChar // 16635
D=A // 16636
@13 // 16637
M=D // 16638
@String.setInt.ret.6 // 16639
D=A // 16640
@CALL // 16641
0;JMP // 16642
(String.setInt.ret.6)
@SP // 16643
M=M-1 // 16644

////PushInstruction("constant 0")
@SP // 16645
AM=M+1 // 16646
A=A-1 // 16647
M=0 // 16648

////ReturnInstruction{}
@RETURN // 16649
0;JMP // 16650

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 16651
0;JMP // 16652

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

@ARG // 16653
A=M+1 // 16654
D=-M // 16655
@ARG // 16656
A=M+1 // 16657
M=D // 16658

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 16659
0;JMP // 16660

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

@ARG // 16661
A=M+1 // 16662
D=M // 16663
@LCL // 16664
A=M+1 // 16665
A=A+1 // 16666
M=D // 16667

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 16668
A=M+1 // 16669
A=A+1 // 16670
A=A+1 // 16671
M=0 // 16672

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
@String.setInt.GT.10 // 16673
D=A // 16674
@SP // 16675
AM=M+1 // 16676
A=A-1 // 16677
M=D // 16678
@LCL // 16679
A=M+1 // 16680
A=A+1 // 16681
D=M // 16682
@DO_GT // 16683
0;JMP // 16684
(String.setInt.GT.10)
D=!D // 16685
@WHILE_END_String.setInt1 // 16686
D;JNE // 16687

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 16688
A=M+1 // 16689
A=A+1 // 16690
D=M // 16691
@SP // 16692
AM=M+1 // 16693
A=A-1 // 16694
M=D // 16695
@10 // 16696
D=A // 16697
@SP // 16698
AM=M+1 // 16699
A=A-1 // 16700
M=D // 16701
// call Math.divide
@7 // 16702
D=A // 16703
@14 // 16704
M=D // 16705
@Math.divide // 16706
D=A // 16707
@13 // 16708
M=D // 16709
@String.setInt.ret.7 // 16710
D=A // 16711
@CALL // 16712
0;JMP // 16713
(String.setInt.ret.7)
@SP // 16714
AM=M-1 // 16715
D=M // 16716
@LCL // 16717
A=M+1 // 16718
A=A+1 // 16719
M=D // 16720

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

@LCL // 16721
A=M+1 // 16722
A=A+1 // 16723
A=A+1 // 16724
D=M // 16725
D=D+1 // 16726
@LCL // 16727
A=M+1 // 16728
A=A+1 // 16729
A=A+1 // 16730
M=D // 16731

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 16732
0;JMP // 16733

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 16734
A=M+1 // 16735
A=A+1 // 16736
A=A+1 // 16737
D=M // 16738
@SP // 16739
AM=M+1 // 16740
A=A-1 // 16741
M=D // 16742
// call Array.new
@6 // 16743
D=A // 16744
@14 // 16745
M=D // 16746
@Array.new // 16747
D=A // 16748
@13 // 16749
M=D // 16750
@String.setInt.ret.8 // 16751
D=A // 16752
@CALL // 16753
0;JMP // 16754
(String.setInt.ret.8)
@LCL // 16755
D=M // 16756
@5 // 16757
A=D+A // 16758
D=A // 16759
@R13 // 16760
M=D // 16761
@SP // 16762
AM=M-1 // 16763
D=M // 16764
@R13 // 16765
A=M // 16766
M=D // 16767

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 16768
A=M+1 // 16769
M=0 // 16770

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
@String.setInt.GT.11 // 16771
D=A // 16772
@SP // 16773
AM=M+1 // 16774
A=A-1 // 16775
M=D // 16776
@ARG // 16777
A=M+1 // 16778
D=M // 16779
@DO_GT // 16780
0;JMP // 16781
(String.setInt.GT.11)
D=!D // 16782
@WHILE_END_String.setInt2 // 16783
D;JNE // 16784

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

@ARG // 16785
A=M+1 // 16786
D=M // 16787
@SP // 16788
AM=M+1 // 16789
A=A-1 // 16790
M=D // 16791
@ARG // 16792
A=M+1 // 16793
D=M // 16794
@SP // 16795
AM=M+1 // 16796
A=A-1 // 16797
M=D // 16798
@10 // 16799
D=A // 16800
@SP // 16801
AM=M+1 // 16802
A=A-1 // 16803
M=D // 16804
// call Math.divide
@7 // 16805
D=A // 16806
@14 // 16807
M=D // 16808
@Math.divide // 16809
D=A // 16810
@13 // 16811
M=D // 16812
@String.setInt.ret.9 // 16813
D=A // 16814
@CALL // 16815
0;JMP // 16816
(String.setInt.ret.9)
@10 // 16817
D=A // 16818
@SP // 16819
AM=M+1 // 16820
A=A-1 // 16821
M=D // 16822
// call Math.multiply
@7 // 16823
D=A // 16824
@14 // 16825
M=D // 16826
@Math.multiply // 16827
D=A // 16828
@13 // 16829
M=D // 16830
@String.setInt.ret.10 // 16831
D=A // 16832
@CALL // 16833
0;JMP // 16834
(String.setInt.ret.10)
@SP // 16835
AM=M-1 // 16836
D=M // 16837
@SP // 16838
AM=M-1 // 16839
D=M-D // 16840
@LCL // 16841
A=M // 16842
M=D // 16843

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
@LCL // 16844
D=M // 16845
@5 // 16846
A=D+A // 16847
D=M // 16848
@SP // 16849
AM=M+1 // 16850
A=A-1 // 16851
M=D // 16852
@LCL // 16853
A=M+1 // 16854
D=M // 16855
@SP // 16856
AM=M-1 // 16857
D=D+M // 16858
@SP // 16859
AM=M+1 // 16860
A=A-1 // 16861
M=D // 16862
@LCL // 16863
A=M // 16864
D=M // 16865
@48 // 16866
D=D+A // 16867
@SP // 16868
AM=M-1 // 16869
A=M // 16870
M=D // 16871

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 16872
A=M+1 // 16873
D=M // 16874
@SP // 16875
AM=M+1 // 16876
A=A-1 // 16877
M=D // 16878
@10 // 16879
D=A // 16880
@SP // 16881
AM=M+1 // 16882
A=A-1 // 16883
M=D // 16884
// call Math.divide
@7 // 16885
D=A // 16886
@14 // 16887
M=D // 16888
@Math.divide // 16889
D=A // 16890
@13 // 16891
M=D // 16892
@String.setInt.ret.11 // 16893
D=A // 16894
@CALL // 16895
0;JMP // 16896
(String.setInt.ret.11)
@SP // 16897
AM=M-1 // 16898
D=M // 16899
@ARG // 16900
A=M+1 // 16901
M=D // 16902

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

@LCL // 16903
A=M+1 // 16904
D=M // 16905
D=D+1 // 16906
@LCL // 16907
A=M+1 // 16908
M=D // 16909

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 16910
0;JMP // 16911

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
@String.setInt.EQ.12 // 16912
D=A // 16913
@SP // 16914
AM=M+1 // 16915
A=A-1 // 16916
M=D // 16917
@LCL // 16918
D=M // 16919
@4 // 16920
A=D+A // 16921
D=M // 16922
D=D-1 // 16923
@DO_EQ // 16924
0;JMP // 16925
(String.setInt.EQ.12)
D=!D // 16926
@String.setInt.IfElse4 // 16927
D;JNE // 16928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16929
D=M // 16930
@SP // 16931
AM=M+1 // 16932
A=A-1 // 16933
M=D // 16934
@45 // 16935
D=A // 16936
@SP // 16937
AM=M+1 // 16938
A=A-1 // 16939
M=D // 16940
// call String.appendChar
@7 // 16941
D=A // 16942
@14 // 16943
M=D // 16944
@String.appendChar // 16945
D=A // 16946
@13 // 16947
M=D // 16948
@String.setInt.ret.12 // 16949
D=A // 16950
@CALL // 16951
0;JMP // 16952
(String.setInt.ret.12)
@SP // 16953
M=M-1 // 16954

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 16955
0;JMP // 16956

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
@String.setInt.GT.13 // 16957
D=A // 16958
@SP // 16959
AM=M+1 // 16960
A=A-1 // 16961
M=D // 16962
@LCL // 16963
A=M+1 // 16964
D=M // 16965
@DO_GT // 16966
0;JMP // 16967
(String.setInt.GT.13)
D=!D // 16968
@WHILE_END_String.setInt3 // 16969
D;JNE // 16970

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

@LCL // 16971
A=M+1 // 16972
D=M // 16973
D=D-1 // 16974
@LCL // 16975
A=M+1 // 16976
M=D // 16977

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

@3 // 16978
D=M // 16979
@SP // 16980
AM=M+1 // 16981
A=A-1 // 16982
M=D // 16983
@LCL // 16984
D=M // 16985
@5 // 16986
A=D+A // 16987
D=M // 16988
@SP // 16989
AM=M+1 // 16990
A=A-1 // 16991
M=D // 16992
@LCL // 16993
A=M+1 // 16994
D=M // 16995
@SP // 16996
AM=M-1 // 16997
A=D+M // 16998
D=M // 16999
@SP // 17000
AM=M+1 // 17001
A=A-1 // 17002
M=D // 17003
// call String.appendChar
@7 // 17004
D=A // 17005
@14 // 17006
M=D // 17007
@String.appendChar // 17008
D=A // 17009
@13 // 17010
M=D // 17011
@String.setInt.ret.13 // 17012
D=A // 17013
@CALL // 17014
0;JMP // 17015
(String.setInt.ret.13)
@SP // 17016
M=M-1 // 17017

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 17018
0;JMP // 17019

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17020
D=M // 17021
@5 // 17022
A=D+A // 17023
D=M // 17024
@SP // 17025
AM=M+1 // 17026
A=A-1 // 17027
M=D // 17028
// call Array.dispose
@6 // 17029
D=A // 17030
@14 // 17031
M=D // 17032
@Array.dispose // 17033
D=A // 17034
@13 // 17035
M=D // 17036
@String.setInt.ret.14 // 17037
D=A // 17038
@CALL // 17039
0;JMP // 17040
(String.setInt.ret.14)
@SP // 17041
M=M-1 // 17042

////PushInstruction("constant 0")
@SP // 17043
AM=M+1 // 17044
A=A-1 // 17045
M=0 // 17046

////ReturnInstruction{}
@RETURN // 17047
0;JMP // 17048

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 17049
D=A // 17050
@SP // 17051
AM=M+1 // 17052
A=A-1 // 17053
M=D // 17054

////ReturnInstruction{}
@RETURN // 17055
0;JMP // 17056

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 17057
D=A // 17058
@SP // 17059
AM=M+1 // 17060
A=A-1 // 17061
M=D // 17062

////ReturnInstruction{}
@RETURN // 17063
0;JMP // 17064

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 17065
D=A // 17066
@SP // 17067
AM=M+1 // 17068
A=A-1 // 17069
M=D // 17070

////ReturnInstruction{}
@RETURN // 17071
0;JMP // 17072

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 17073
D=A // 17074
@14 // 17075
M=D // 17076
@Memory.init // 17077
D=A // 17078
@13 // 17079
M=D // 17080
@Sys.init.ret.0 // 17081
D=A // 17082
@CALL // 17083
0;JMP // 17084
(Sys.init.ret.0)
@SP // 17085
M=M-1 // 17086

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 17087
D=A // 17088
@14 // 17089
M=D // 17090
@Math.init // 17091
D=A // 17092
@13 // 17093
M=D // 17094
@Sys.init.ret.1 // 17095
D=A // 17096
@CALL // 17097
0;JMP // 17098
(Sys.init.ret.1)
@SP // 17099
M=M-1 // 17100

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 17101
D=A // 17102
@14 // 17103
M=D // 17104
@Screen.init // 17105
D=A // 17106
@13 // 17107
M=D // 17108
@Sys.init.ret.2 // 17109
D=A // 17110
@CALL // 17111
0;JMP // 17112
(Sys.init.ret.2)
@SP // 17113
M=M-1 // 17114

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 17115
D=A // 17116
@14 // 17117
M=D // 17118
@Output.init // 17119
D=A // 17120
@13 // 17121
M=D // 17122
@Sys.init.ret.3 // 17123
D=A // 17124
@CALL // 17125
0;JMP // 17126
(Sys.init.ret.3)
@SP // 17127
M=M-1 // 17128

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 17129
D=A // 17130
@14 // 17131
M=D // 17132
@Keyboard.init // 17133
D=A // 17134
@13 // 17135
M=D // 17136
@Sys.init.ret.4 // 17137
D=A // 17138
@CALL // 17139
0;JMP // 17140
(Sys.init.ret.4)
@SP // 17141
M=M-1 // 17142

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 17143
D=A // 17144
@14 // 17145
M=D // 17146
@Main.main // 17147
D=A // 17148
@13 // 17149
M=D // 17150
@Sys.init.ret.5 // 17151
D=A // 17152
@CALL // 17153
0;JMP // 17154
(Sys.init.ret.5)
@SP // 17155
M=M-1 // 17156

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 17157
D=A // 17158
@14 // 17159
M=D // 17160
@Sys.halt // 17161
D=A // 17162
@13 // 17163
M=D // 17164
@Sys.init.ret.6 // 17165
D=A // 17166
@CALL // 17167
0;JMP // 17168
(Sys.init.ret.6)
@SP // 17169
M=M-1 // 17170

////PushInstruction("constant 0")
@SP // 17171
AM=M+1 // 17172
A=A-1 // 17173
M=0 // 17174

////ReturnInstruction{}
@RETURN // 17175
0;JMP // 17176

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
D=0 // 17177
@WHILE_END_Sys.halt1 // 17178
D;JNE // 17179

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 17180
0;JMP // 17181

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 17182
AM=M+1 // 17183
A=A-1 // 17184
M=0 // 17185

////ReturnInstruction{}
@RETURN // 17186
0;JMP // 17187

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 17188
AM=M+1 // 17189
A=A-1 // 17190
M=0 // 17191

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
@Sys.wait.GT.0 // 17192
D=A // 17193
@SP // 17194
AM=M+1 // 17195
A=A-1 // 17196
M=D // 17197
@ARG // 17198
A=M // 17199
D=M // 17200
@DO_GT // 17201
0;JMP // 17202
(Sys.wait.GT.0)
D=!D // 17203
@WHILE_END_Sys.wait1 // 17204
D;JNE // 17205

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

@ARG // 17206
A=M // 17207
D=M // 17208
D=D-1 // 17209
@ARG // 17210
A=M // 17211
M=D // 17212

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 17213
D=A // 17214
@LCL // 17215
A=M // 17216
M=D // 17217

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
@Sys.wait.GT.1 // 17218
D=A // 17219
@SP // 17220
AM=M+1 // 17221
A=A-1 // 17222
M=D // 17223
@LCL // 17224
A=M // 17225
D=M // 17226
@DO_GT // 17227
0;JMP // 17228
(Sys.wait.GT.1)
D=!D // 17229
@WHILE_END_Sys.wait2 // 17230
D;JNE // 17231

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

@LCL // 17232
A=M // 17233
D=M // 17234
D=D-1 // 17235
@LCL // 17236
A=M // 17237
M=D // 17238

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 17239
0;JMP // 17240

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 17241
0;JMP // 17242

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 17243
AM=M+1 // 17244
A=A-1 // 17245
M=0 // 17246

////ReturnInstruction{}
@RETURN // 17247
0;JMP // 17248

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 17249
A=M // 17250
D=M // 17251
@SP // 17252
AM=M+1 // 17253
A=A-1 // 17254
M=D // 17255
// call Output.printInt
@6 // 17256
D=A // 17257
@14 // 17258
M=D // 17259
@Output.printInt // 17260
D=A // 17261
@13 // 17262
M=D // 17263
@Sys.error.ret.0 // 17264
D=A // 17265
@CALL // 17266
0;JMP // 17267
(Sys.error.ret.0)
@SP // 17268
M=M-1 // 17269

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 17270
D=A // 17271
@14 // 17272
M=D // 17273
@Output.println // 17274
D=A // 17275
@13 // 17276
M=D // 17277
@Sys.error.ret.1 // 17278
D=A // 17279
@CALL // 17280
0;JMP // 17281
(Sys.error.ret.1)
@SP // 17282
M=M-1 // 17283

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 17284
D=A // 17285
@14 // 17286
M=D // 17287
@Sys.halt // 17288
D=A // 17289
@13 // 17290
M=D // 17291
@Sys.error.ret.2 // 17292
D=A // 17293
@CALL // 17294
0;JMP // 17295
(Sys.error.ret.2)
@SP // 17296
M=M-1 // 17297

////PushInstruction("constant 0")
@SP // 17298
AM=M+1 // 17299
A=A-1 // 17300
M=0 // 17301

////ReturnInstruction{}
@RETURN // 17302
0;JMP // 17303
