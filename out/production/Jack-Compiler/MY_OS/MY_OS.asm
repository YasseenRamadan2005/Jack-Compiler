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
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 537
AM=M+1 // 538
A=A-1 // 539
M=0 // 540
@220 // 541
D=A // 542
@SP // 543
AM=M+1 // 544
A=A-1 // 545
M=D // 546
@511 // 547
D=A // 548
@SP // 549
AM=M+1 // 550
A=A-1 // 551
M=D // 552
@220 // 553
D=A // 554
@SP // 555
AM=M+1 // 556
A=A-1 // 557
M=D // 558
// call Screen.drawLine
@9 // 559
D=A // 560
@14 // 561
M=D // 562
@Screen.drawLine // 563
D=A // 564
@13 // 565
M=D // 566
@Main.main.ret.0 // 567
D=A // 568
@CALL // 569
0;JMP // 570
(Main.main.ret.0)
@SP // 571
M=M-1 // 572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 573
D=A // 574
@SP // 575
AM=M+1 // 576
A=A-1 // 577
M=D // 578
@90 // 579
D=A // 580
@SP // 581
AM=M+1 // 582
A=A-1 // 583
M=D // 584
@410 // 585
D=A // 586
@SP // 587
AM=M+1 // 588
A=A-1 // 589
M=D // 590
@220 // 591
D=A // 592
@SP // 593
AM=M+1 // 594
A=A-1 // 595
M=D // 596
// call Screen.drawRectangle
@9 // 597
D=A // 598
@14 // 599
M=D // 600
@Screen.drawRectangle // 601
D=A // 602
@13 // 603
M=D // 604
@Main.main.ret.1 // 605
D=A // 606
@CALL // 607
0;JMP // 608
(Main.main.ret.1)
@SP // 609
M=M-1 // 610

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 611
AM=M+1 // 612
A=A-1 // 613
M=0 // 614
// call Screen.setColor
@6 // 615
D=A // 616
@14 // 617
M=D // 618
@Screen.setColor // 619
D=A // 620
@13 // 621
M=D // 622
@Main.main.ret.2 // 623
D=A // 624
@CALL // 625
0;JMP // 626
(Main.main.ret.2)
@SP // 627
M=M-1 // 628

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 629
D=A // 630
@SP // 631
AM=M+1 // 632
A=A-1 // 633
M=D // 634
@120 // 635
D=A // 636
@SP // 637
AM=M+1 // 638
A=A-1 // 639
M=D // 640
@390 // 641
D=A // 642
@SP // 643
AM=M+1 // 644
A=A-1 // 645
M=D // 646
@219 // 647
D=A // 648
@SP // 649
AM=M+1 // 650
A=A-1 // 651
M=D // 652
// call Screen.drawRectangle
@9 // 653
D=A // 654
@14 // 655
M=D // 656
@Screen.drawRectangle // 657
D=A // 658
@13 // 659
M=D // 660
@Main.main.ret.3 // 661
D=A // 662
@CALL // 663
0;JMP // 664
(Main.main.ret.3)
@SP // 665
M=M-1 // 666

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 667
D=A // 668
@SP // 669
AM=M+1 // 670
A=A-1 // 671
M=D // 672
@120 // 673
D=A // 674
@SP // 675
AM=M+1 // 676
A=A-1 // 677
M=D // 678
@332 // 679
D=A // 680
@SP // 681
AM=M+1 // 682
A=A-1 // 683
M=D // 684
@150 // 685
D=A // 686
@SP // 687
AM=M+1 // 688
A=A-1 // 689
M=D // 690
// call Screen.drawRectangle
@9 // 691
D=A // 692
@14 // 693
M=D // 694
@Screen.drawRectangle // 695
D=A // 696
@13 // 697
M=D // 698
@Main.main.ret.4 // 699
D=A // 700
@CALL // 701
0;JMP // 702
(Main.main.ret.4)
@SP // 703
M=M-1 // 704

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 705
AM=M+1 // 706
A=A-1 // 707
M=-1 // 708
// call Screen.setColor
@6 // 709
D=A // 710
@14 // 711
M=D // 712
@Screen.setColor // 713
D=A // 714
@13 // 715
M=D // 716
@Main.main.ret.5 // 717
D=A // 718
@CALL // 719
0;JMP // 720
(Main.main.ret.5)
@SP // 721
M=M-1 // 722

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 723
D=A // 724
@SP // 725
AM=M+1 // 726
A=A-1 // 727
M=D // 728
@170 // 729
D=A // 730
@SP // 731
AM=M+1 // 732
A=A-1 // 733
M=D // 734
@3 // 735
D=A // 736
@SP // 737
AM=M+1 // 738
A=A-1 // 739
M=D // 740
// call Screen.drawCircle
@8 // 741
D=A // 742
@14 // 743
M=D // 744
@Screen.drawCircle // 745
D=A // 746
@13 // 747
M=D // 748
@Main.main.ret.6 // 749
D=A // 750
@CALL // 751
0;JMP // 752
(Main.main.ret.6)
@SP // 753
M=M-1 // 754

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 755
D=A // 756
@SP // 757
AM=M+1 // 758
A=A-1 // 759
M=D // 760
@90 // 761
D=A // 762
@SP // 763
AM=M+1 // 764
A=A-1 // 765
M=D // 766
@345 // 767
D=A // 768
@SP // 769
AM=M+1 // 770
A=A-1 // 771
M=D // 772
@35 // 773
D=A // 774
@SP // 775
AM=M+1 // 776
A=A-1 // 777
M=D // 778
// call Screen.drawLine
@9 // 779
D=A // 780
@14 // 781
M=D // 782
@Screen.drawLine // 783
D=A // 784
@13 // 785
M=D // 786
@Main.main.ret.7 // 787
D=A // 788
@CALL // 789
0;JMP // 790
(Main.main.ret.7)
@SP // 791
M=M-1 // 792

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 793
D=A // 794
@SP // 795
AM=M+1 // 796
A=A-1 // 797
M=D // 798
@35 // 799
D=A // 800
@SP // 801
AM=M+1 // 802
A=A-1 // 803
M=D // 804
@410 // 805
D=A // 806
@SP // 807
AM=M+1 // 808
A=A-1 // 809
M=D // 810
@90 // 811
D=A // 812
@SP // 813
AM=M+1 // 814
A=A-1 // 815
M=D // 816
// call Screen.drawLine
@9 // 817
D=A // 818
@14 // 819
M=D // 820
@Screen.drawLine // 821
D=A // 822
@13 // 823
M=D // 824
@Main.main.ret.8 // 825
D=A // 826
@CALL // 827
0;JMP // 828
(Main.main.ret.8)
@SP // 829
M=M-1 // 830

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 831
D=A // 832
@SP // 833
AM=M+1 // 834
A=A-1 // 835
M=D // 836
@60 // 837
D=A // 838
@SP // 839
AM=M+1 // 840
A=A-1 // 841
M=D // 842
@30 // 843
D=A // 844
@SP // 845
AM=M+1 // 846
A=A-1 // 847
M=D // 848
// call Screen.drawCircle
@8 // 849
D=A // 850
@14 // 851
M=D // 852
@Screen.drawCircle // 853
D=A // 854
@13 // 855
M=D // 856
@Main.main.ret.9 // 857
D=A // 858
@CALL // 859
0;JMP // 860
(Main.main.ret.9)
@SP // 861
M=M-1 // 862

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 863
D=A // 864
@SP // 865
AM=M+1 // 866
A=A-1 // 867
M=D // 868
@26 // 869
D=A // 870
@SP // 871
AM=M+1 // 872
A=A-1 // 873
M=D // 874
@140 // 875
D=A // 876
@SP // 877
AM=M+1 // 878
A=A-1 // 879
M=D // 880
@6 // 881
D=A // 882
@SP // 883
AM=M+1 // 884
A=A-1 // 885
M=D // 886
// call Screen.drawLine
@9 // 887
D=A // 888
@14 // 889
M=D // 890
@Screen.drawLine // 891
D=A // 892
@13 // 893
M=D // 894
@Main.main.ret.10 // 895
D=A // 896
@CALL // 897
0;JMP // 898
(Main.main.ret.10)
@SP // 899
M=M-1 // 900

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 901
D=A // 902
@SP // 903
AM=M+1 // 904
A=A-1 // 905
M=D // 906
@35 // 907
D=A // 908
@SP // 909
AM=M+1 // 910
A=A-1 // 911
M=D // 912
@178 // 913
D=A // 914
@SP // 915
AM=M+1 // 916
A=A-1 // 917
M=D // 918
@20 // 919
D=A // 920
@SP // 921
AM=M+1 // 922
A=A-1 // 923
M=D // 924
// call Screen.drawLine
@9 // 925
D=A // 926
@14 // 927
M=D // 928
@Screen.drawLine // 929
D=A // 930
@13 // 931
M=D // 932
@Main.main.ret.11 // 933
D=A // 934
@CALL // 935
0;JMP // 936
(Main.main.ret.11)
@SP // 937
M=M-1 // 938

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 939
D=A // 940
@SP // 941
AM=M+1 // 942
A=A-1 // 943
M=D // 944
@60 // 945
D=A // 946
@SP // 947
AM=M+1 // 948
A=A-1 // 949
M=D // 950
@194 // 951
D=A // 952
@SP // 953
AM=M+1 // 954
A=A-1 // 955
M=D // 956
@60 // 957
D=A // 958
@SP // 959
AM=M+1 // 960
A=A-1 // 961
M=D // 962
// call Screen.drawLine
@9 // 963
D=A // 964
@14 // 965
M=D // 966
@Screen.drawLine // 967
D=A // 968
@13 // 969
M=D // 970
@Main.main.ret.12 // 971
D=A // 972
@CALL // 973
0;JMP // 974
(Main.main.ret.12)
@SP // 975
M=M-1 // 976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 977
D=A // 978
@SP // 979
AM=M+1 // 980
A=A-1 // 981
M=D // 982
@85 // 983
D=A // 984
@SP // 985
AM=M+1 // 986
A=A-1 // 987
M=D // 988
@178 // 989
D=A // 990
@SP // 991
AM=M+1 // 992
A=A-1 // 993
M=D // 994
@100 // 995
D=A // 996
@SP // 997
AM=M+1 // 998
A=A-1 // 999
M=D // 1000
// call Screen.drawLine
@9 // 1001
D=A // 1002
@14 // 1003
M=D // 1004
@Screen.drawLine // 1005
D=A // 1006
@13 // 1007
M=D // 1008
@Main.main.ret.13 // 1009
D=A // 1010
@CALL // 1011
0;JMP // 1012
(Main.main.ret.13)
@SP // 1013
M=M-1 // 1014

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 1015
D=A // 1016
@SP // 1017
AM=M+1 // 1018
A=A-1 // 1019
M=D // 1020
@94 // 1021
D=A // 1022
@SP // 1023
AM=M+1 // 1024
A=A-1 // 1025
M=D // 1026
@140 // 1027
D=A // 1028
@SP // 1029
AM=M+1 // 1030
A=A-1 // 1031
M=D // 1032
@114 // 1033
D=A // 1034
@SP // 1035
AM=M+1 // 1036
A=A-1 // 1037
M=D // 1038
// call Screen.drawLine
@9 // 1039
D=A // 1040
@14 // 1041
M=D // 1042
@Screen.drawLine // 1043
D=A // 1044
@13 // 1045
M=D // 1046
@Main.main.ret.14 // 1047
D=A // 1048
@CALL // 1049
0;JMP // 1050
(Main.main.ret.14)
@SP // 1051
M=M-1 // 1052

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 1053
D=A // 1054
@SP // 1055
AM=M+1 // 1056
A=A-1 // 1057
M=D // 1058
@85 // 1059
D=A // 1060
@SP // 1061
AM=M+1 // 1062
A=A-1 // 1063
M=D // 1064
@102 // 1065
D=A // 1066
@SP // 1067
AM=M+1 // 1068
A=A-1 // 1069
M=D // 1070
@100 // 1071
D=A // 1072
@SP // 1073
AM=M+1 // 1074
A=A-1 // 1075
M=D // 1076
// call Screen.drawLine
@9 // 1077
D=A // 1078
@14 // 1079
M=D // 1080
@Screen.drawLine // 1081
D=A // 1082
@13 // 1083
M=D // 1084
@Main.main.ret.15 // 1085
D=A // 1086
@CALL // 1087
0;JMP // 1088
(Main.main.ret.15)
@SP // 1089
M=M-1 // 1090

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 1091
D=A // 1092
@SP // 1093
AM=M+1 // 1094
A=A-1 // 1095
M=D // 1096
@60 // 1097
D=A // 1098
@SP // 1099
AM=M+1 // 1100
A=A-1 // 1101
M=D // 1102
@86 // 1103
D=A // 1104
@SP // 1105
AM=M+1 // 1106
A=A-1 // 1107
M=D // 1108
@60 // 1109
D=A // 1110
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=D // 1114
// call Screen.drawLine
@9 // 1115
D=A // 1116
@14 // 1117
M=D // 1118
@Screen.drawLine // 1119
D=A // 1120
@13 // 1121
M=D // 1122
@Main.main.ret.16 // 1123
D=A // 1124
@CALL // 1125
0;JMP // 1126
(Main.main.ret.16)
@SP // 1127
M=M-1 // 1128

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 1129
D=A // 1130
@SP // 1131
AM=M+1 // 1132
A=A-1 // 1133
M=D // 1134
@35 // 1135
D=A // 1136
@SP // 1137
AM=M+1 // 1138
A=A-1 // 1139
M=D // 1140
@102 // 1141
D=A // 1142
@SP // 1143
AM=M+1 // 1144
A=A-1 // 1145
M=D // 1146
@20 // 1147
D=A // 1148
@SP // 1149
AM=M+1 // 1150
A=A-1 // 1151
M=D // 1152
// call Screen.drawLine
@9 // 1153
D=A // 1154
@14 // 1155
M=D // 1156
@Screen.drawLine // 1157
D=A // 1158
@13 // 1159
M=D // 1160
@Main.main.ret.17 // 1161
D=A // 1162
@CALL // 1163
0;JMP // 1164
(Main.main.ret.17)
@SP // 1165
M=M-1 // 1166

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 24")], call=CallInstruction{String.new}}, PushInstruction("constant 49")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 52")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 53")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 57")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 46")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@24 // 1167
D=A // 1168
@SP // 1169
AM=M+1 // 1170
A=A-1 // 1171
M=D // 1172
// call String.new
@6 // 1173
D=A // 1174
@14 // 1175
M=D // 1176
@String.new // 1177
D=A // 1178
@13 // 1179
M=D // 1180
@Main.main.ret.18 // 1181
D=A // 1182
@CALL // 1183
0;JMP // 1184
(Main.main.ret.18)
@49 // 1185
D=A // 1186
@SP // 1187
AM=M+1 // 1188
A=A-1 // 1189
M=D // 1190
// call String.appendChar
@7 // 1191
D=A // 1192
@14 // 1193
M=D // 1194
@String.appendChar // 1195
D=A // 1196
@13 // 1197
M=D // 1198
@Main.main.ret.19 // 1199
D=A // 1200
@CALL // 1201
0;JMP // 1202
(Main.main.ret.19)
@50 // 1203
D=A // 1204
@SP // 1205
AM=M+1 // 1206
A=A-1 // 1207
M=D // 1208
// call String.appendChar
@7 // 1209
D=A // 1210
@14 // 1211
M=D // 1212
@String.appendChar // 1213
D=A // 1214
@13 // 1215
M=D // 1216
@Main.main.ret.20 // 1217
D=A // 1218
@CALL // 1219
0;JMP // 1220
(Main.main.ret.20)
@51 // 1221
D=A // 1222
@SP // 1223
AM=M+1 // 1224
A=A-1 // 1225
M=D // 1226
// call String.appendChar
@7 // 1227
D=A // 1228
@14 // 1229
M=D // 1230
@String.appendChar // 1231
D=A // 1232
@13 // 1233
M=D // 1234
@Main.main.ret.21 // 1235
D=A // 1236
@CALL // 1237
0;JMP // 1238
(Main.main.ret.21)
@52 // 1239
D=A // 1240
@SP // 1241
AM=M+1 // 1242
A=A-1 // 1243
M=D // 1244
// call String.appendChar
@7 // 1245
D=A // 1246
@14 // 1247
M=D // 1248
@String.appendChar // 1249
D=A // 1250
@13 // 1251
M=D // 1252
@Main.main.ret.22 // 1253
D=A // 1254
@CALL // 1255
0;JMP // 1256
(Main.main.ret.22)
@53 // 1257
D=A // 1258
@SP // 1259
AM=M+1 // 1260
A=A-1 // 1261
M=D // 1262
// call String.appendChar
@7 // 1263
D=A // 1264
@14 // 1265
M=D // 1266
@String.appendChar // 1267
D=A // 1268
@13 // 1269
M=D // 1270
@Main.main.ret.23 // 1271
D=A // 1272
@CALL // 1273
0;JMP // 1274
(Main.main.ret.23)
@54 // 1275
D=A // 1276
@SP // 1277
AM=M+1 // 1278
A=A-1 // 1279
M=D // 1280
// call String.appendChar
@7 // 1281
D=A // 1282
@14 // 1283
M=D // 1284
@String.appendChar // 1285
D=A // 1286
@13 // 1287
M=D // 1288
@Main.main.ret.24 // 1289
D=A // 1290
@CALL // 1291
0;JMP // 1292
(Main.main.ret.24)
@55 // 1293
D=A // 1294
@SP // 1295
AM=M+1 // 1296
A=A-1 // 1297
M=D // 1298
// call String.appendChar
@7 // 1299
D=A // 1300
@14 // 1301
M=D // 1302
@String.appendChar // 1303
D=A // 1304
@13 // 1305
M=D // 1306
@Main.main.ret.25 // 1307
D=A // 1308
@CALL // 1309
0;JMP // 1310
(Main.main.ret.25)
@56 // 1311
D=A // 1312
@SP // 1313
AM=M+1 // 1314
A=A-1 // 1315
M=D // 1316
// call String.appendChar
@7 // 1317
D=A // 1318
@14 // 1319
M=D // 1320
@String.appendChar // 1321
D=A // 1322
@13 // 1323
M=D // 1324
@Main.main.ret.26 // 1325
D=A // 1326
@CALL // 1327
0;JMP // 1328
(Main.main.ret.26)
@57 // 1329
D=A // 1330
@SP // 1331
AM=M+1 // 1332
A=A-1 // 1333
M=D // 1334
// call String.appendChar
@7 // 1335
D=A // 1336
@14 // 1337
M=D // 1338
@String.appendChar // 1339
D=A // 1340
@13 // 1341
M=D // 1342
@Main.main.ret.27 // 1343
D=A // 1344
@CALL // 1345
0;JMP // 1346
(Main.main.ret.27)
@46 // 1347
D=A // 1348
@SP // 1349
AM=M+1 // 1350
A=A-1 // 1351
M=D // 1352
// call String.appendChar
@7 // 1353
D=A // 1354
@14 // 1355
M=D // 1356
@String.appendChar // 1357
D=A // 1358
@13 // 1359
M=D // 1360
@Main.main.ret.28 // 1361
D=A // 1362
@CALL // 1363
0;JMP // 1364
(Main.main.ret.28)
@32 // 1365
D=A // 1366
@SP // 1367
AM=M+1 // 1368
A=A-1 // 1369
M=D // 1370
// call String.appendChar
@7 // 1371
D=A // 1372
@14 // 1373
M=D // 1374
@String.appendChar // 1375
D=A // 1376
@13 // 1377
M=D // 1378
@Main.main.ret.29 // 1379
D=A // 1380
@CALL // 1381
0;JMP // 1382
(Main.main.ret.29)
@72 // 1383
D=A // 1384
@SP // 1385
AM=M+1 // 1386
A=A-1 // 1387
M=D // 1388
// call String.appendChar
@7 // 1389
D=A // 1390
@14 // 1391
M=D // 1392
@String.appendChar // 1393
D=A // 1394
@13 // 1395
M=D // 1396
@Main.main.ret.30 // 1397
D=A // 1398
@CALL // 1399
0;JMP // 1400
(Main.main.ret.30)
@101 // 1401
D=A // 1402
@SP // 1403
AM=M+1 // 1404
A=A-1 // 1405
M=D // 1406
// call String.appendChar
@7 // 1407
D=A // 1408
@14 // 1409
M=D // 1410
@String.appendChar // 1411
D=A // 1412
@13 // 1413
M=D // 1414
@Main.main.ret.31 // 1415
D=A // 1416
@CALL // 1417
0;JMP // 1418
(Main.main.ret.31)
@108 // 1419
D=A // 1420
@SP // 1421
AM=M+1 // 1422
A=A-1 // 1423
M=D // 1424
// call String.appendChar
@7 // 1425
D=A // 1426
@14 // 1427
M=D // 1428
@String.appendChar // 1429
D=A // 1430
@13 // 1431
M=D // 1432
@Main.main.ret.32 // 1433
D=A // 1434
@CALL // 1435
0;JMP // 1436
(Main.main.ret.32)
@108 // 1437
D=A // 1438
@SP // 1439
AM=M+1 // 1440
A=A-1 // 1441
M=D // 1442
// call String.appendChar
@7 // 1443
D=A // 1444
@14 // 1445
M=D // 1446
@String.appendChar // 1447
D=A // 1448
@13 // 1449
M=D // 1450
@Main.main.ret.33 // 1451
D=A // 1452
@CALL // 1453
0;JMP // 1454
(Main.main.ret.33)
@111 // 1455
D=A // 1456
@SP // 1457
AM=M+1 // 1458
A=A-1 // 1459
M=D // 1460
// call String.appendChar
@7 // 1461
D=A // 1462
@14 // 1463
M=D // 1464
@String.appendChar // 1465
D=A // 1466
@13 // 1467
M=D // 1468
@Main.main.ret.34 // 1469
D=A // 1470
@CALL // 1471
0;JMP // 1472
(Main.main.ret.34)
@44 // 1473
D=A // 1474
@SP // 1475
AM=M+1 // 1476
A=A-1 // 1477
M=D // 1478
// call String.appendChar
@7 // 1479
D=A // 1480
@14 // 1481
M=D // 1482
@String.appendChar // 1483
D=A // 1484
@13 // 1485
M=D // 1486
@Main.main.ret.35 // 1487
D=A // 1488
@CALL // 1489
0;JMP // 1490
(Main.main.ret.35)
@32 // 1491
D=A // 1492
@SP // 1493
AM=M+1 // 1494
A=A-1 // 1495
M=D // 1496
// call String.appendChar
@7 // 1497
D=A // 1498
@14 // 1499
M=D // 1500
@String.appendChar // 1501
D=A // 1502
@13 // 1503
M=D // 1504
@Main.main.ret.36 // 1505
D=A // 1506
@CALL // 1507
0;JMP // 1508
(Main.main.ret.36)
@119 // 1509
D=A // 1510
@SP // 1511
AM=M+1 // 1512
A=A-1 // 1513
M=D // 1514
// call String.appendChar
@7 // 1515
D=A // 1516
@14 // 1517
M=D // 1518
@String.appendChar // 1519
D=A // 1520
@13 // 1521
M=D // 1522
@Main.main.ret.37 // 1523
D=A // 1524
@CALL // 1525
0;JMP // 1526
(Main.main.ret.37)
@111 // 1527
D=A // 1528
@SP // 1529
AM=M+1 // 1530
A=A-1 // 1531
M=D // 1532
// call String.appendChar
@7 // 1533
D=A // 1534
@14 // 1535
M=D // 1536
@String.appendChar // 1537
D=A // 1538
@13 // 1539
M=D // 1540
@Main.main.ret.38 // 1541
D=A // 1542
@CALL // 1543
0;JMP // 1544
(Main.main.ret.38)
@114 // 1545
D=A // 1546
@SP // 1547
AM=M+1 // 1548
A=A-1 // 1549
M=D // 1550
// call String.appendChar
@7 // 1551
D=A // 1552
@14 // 1553
M=D // 1554
@String.appendChar // 1555
D=A // 1556
@13 // 1557
M=D // 1558
@Main.main.ret.39 // 1559
D=A // 1560
@CALL // 1561
0;JMP // 1562
(Main.main.ret.39)
@108 // 1563
D=A // 1564
@SP // 1565
AM=M+1 // 1566
A=A-1 // 1567
M=D // 1568
// call String.appendChar
@7 // 1569
D=A // 1570
@14 // 1571
M=D // 1572
@String.appendChar // 1573
D=A // 1574
@13 // 1575
M=D // 1576
@Main.main.ret.40 // 1577
D=A // 1578
@CALL // 1579
0;JMP // 1580
(Main.main.ret.40)
@100 // 1581
D=A // 1582
@SP // 1583
AM=M+1 // 1584
A=A-1 // 1585
M=D // 1586
// call String.appendChar
@7 // 1587
D=A // 1588
@14 // 1589
M=D // 1590
@String.appendChar // 1591
D=A // 1592
@13 // 1593
M=D // 1594
@Main.main.ret.41 // 1595
D=A // 1596
@CALL // 1597
0;JMP // 1598
(Main.main.ret.41)
@33 // 1599
D=A // 1600
@SP // 1601
AM=M+1 // 1602
A=A-1 // 1603
M=D // 1604
// call String.appendChar
@7 // 1605
D=A // 1606
@14 // 1607
M=D // 1608
@String.appendChar // 1609
D=A // 1610
@13 // 1611
M=D // 1612
@Main.main.ret.42 // 1613
D=A // 1614
@CALL // 1615
0;JMP // 1616
(Main.main.ret.42)
@SP // 1617
AM=M-1 // 1618
D=M // 1619
@LCL // 1620
A=M // 1621
M=D // 1622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1623
A=M // 1624
D=M // 1625
@SP // 1626
AM=M+1 // 1627
A=A-1 // 1628
M=D // 1629
// call Output.printString
@6 // 1630
D=A // 1631
@14 // 1632
M=D // 1633
@Output.printString // 1634
D=A // 1635
@13 // 1636
M=D // 1637
@Main.main.ret.43 // 1638
D=A // 1639
@CALL // 1640
0;JMP // 1641
(Main.main.ret.43)
@SP // 1642
M=M-1 // 1643

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 1644
D=A // 1645
@14 // 1646
M=D // 1647
@Output.println // 1648
D=A // 1649
@13 // 1650
M=D // 1651
@Main.main.ret.44 // 1652
D=A // 1653
@CALL // 1654
0;JMP // 1655
(Main.main.ret.44)
@SP // 1656
M=M-1 // 1657

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1658
A=M // 1659
D=M // 1660
@SP // 1661
AM=M+1 // 1662
A=A-1 // 1663
M=D // 1664
// call String.dispose
@6 // 1665
D=A // 1666
@14 // 1667
M=D // 1668
@String.dispose // 1669
D=A // 1670
@13 // 1671
M=D // 1672
@Main.main.ret.45 // 1673
D=A // 1674
@CALL // 1675
0;JMP // 1676
(Main.main.ret.45)
@SP // 1677
M=M-1 // 1678

////PushInstruction("constant 0")
@SP // 1679
AM=M+1 // 1680
A=A-1 // 1681
M=0 // 1682

////ReturnInstruction{}
@RETURN // 1683
0;JMP // 1684

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 1685
M=M+1 // 1686
AM=M+1 // 1687
A=A-1 // 1688
M=0 // 1689
A=A-1 // 1690
M=0 // 1691

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1692
A=M // 1693
M=1 // 1694

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1695
A=M+1 // 1696
M=0 // 1697

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 1698
D=A // 1699
@SP // 1700
AM=M+1 // 1701
A=A-1 // 1702
M=D // 1703
// call Array.new
@6 // 1704
D=A // 1705
@14 // 1706
M=D // 1707
@Array.new // 1708
D=A // 1709
@13 // 1710
M=D // 1711
@Math.init.ret.0 // 1712
D=A // 1713
@CALL // 1714
0;JMP // 1715
(Math.init.ret.0)
@SP // 1716
AM=M-1 // 1717
D=M // 1718
@Math.0 // 1719
M=D // 1720

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
@Math.init.LT.0 // 1721
D=A // 1722
@SP // 1723
AM=M+1 // 1724
A=A-1 // 1725
M=D // 1726
@LCL // 1727
A=M+1 // 1728
D=M // 1729
@16 // 1730
D=D-A // 1731
@DO_LT // 1732
0;JMP // 1733
(Math.init.LT.0)
D=!D // 1734
@WHILE_END_Math.init1 // 1735
D;JNE // 1736

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 1737
D=M // 1738
@SP // 1739
AM=M+1 // 1740
A=A-1 // 1741
M=D // 1742
@LCL // 1743
A=M+1 // 1744
D=M // 1745
@SP // 1746
AM=M-1 // 1747
D=D+M // 1748
@SP // 1749
AM=M+1 // 1750
A=A-1 // 1751
M=D // 1752
@LCL // 1753
A=M // 1754
D=M // 1755
@SP // 1756
AM=M-1 // 1757
A=M // 1758
M=D // 1759

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

@LCL // 1760
A=M // 1761
D=M // 1762
D=D+M // 1763
@LCL // 1764
A=M // 1765
M=D // 1766

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

@LCL // 1767
A=M+1 // 1768
D=M // 1769
D=D+1 // 1770
@LCL // 1771
A=M+1 // 1772
M=D // 1773

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 1774
0;JMP // 1775

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 1776
AM=M+1 // 1777
A=A-1 // 1778
M=0 // 1779

////ReturnInstruction{}
@RETURN // 1780
0;JMP // 1781

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
@ARG // 1782
A=M // 1783
D=M // 1784
@SP // 1785
AM=M+1 // 1786
A=A-1 // 1787
M=D // 1788
@Math.0 // 1789
D=M // 1790
@SP // 1791
AM=M+1 // 1792
A=A-1 // 1793
M=D // 1794
@ARG // 1795
A=M+1 // 1796
D=M // 1797
@SP // 1798
AM=M-1 // 1799
A=D+M // 1800
D=M // 1801
@SP // 1802
AM=M-1 // 1803
D=D&M // 1804
@SP // 1805
AM=M+1 // 1806
A=A-1 // 1807
M=D // 1808

////ReturnInstruction{}
@RETURN // 1809
0;JMP // 1810

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 1811
D=A // 1812
@SP // 1813
AM=D+M // 1814
A=A-1 // 1815
M=0 // 1816
A=A-1 // 1817
M=0 // 1818
A=A-1 // 1819
M=0 // 1820

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
@Math.multiply.EQ.1 // 1821
D=A // 1822
@SP // 1823
AM=M+1 // 1824
A=A-1 // 1825
M=D // 1826
@Math.multiply.EQ.2 // 1827
D=A // 1828
@SP // 1829
AM=M+1 // 1830
A=A-1 // 1831
M=D // 1832
@ARG // 1833
A=M // 1834
D=M // 1835
@DO_EQ // 1836
0;JMP // 1837
(Math.multiply.EQ.2)
@SP // 1838
AM=M+1 // 1839
A=A-1 // 1840
M=D // 1841
@Math.multiply.EQ.3 // 1842
D=A // 1843
@SP // 1844
AM=M+1 // 1845
A=A-1 // 1846
M=D // 1847
@ARG // 1848
A=M+1 // 1849
D=M // 1850
@DO_EQ // 1851
0;JMP // 1852
(Math.multiply.EQ.3)
@SP // 1853
AM=M-1 // 1854
D=D|M // 1855
@DO_EQ // 1856
0;JMP // 1857
(Math.multiply.EQ.1)
@Math.multiply.IfElse1 // 1858
D;JNE // 1859

////PushInstruction("constant 0")
@SP // 1860
AM=M+1 // 1861
A=A-1 // 1862
M=0 // 1863

////ReturnInstruction{}
@RETURN // 1864
0;JMP // 1865

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 1866
0;JMP // 1867

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
@Math.multiply.EQ.4 // 1868
D=A // 1869
@SP // 1870
AM=M+1 // 1871
A=A-1 // 1872
M=D // 1873
@ARG // 1874
A=M // 1875
D=M // 1876
D=D-1 // 1877
@DO_EQ // 1878
0;JMP // 1879
(Math.multiply.EQ.4)
D=!D // 1880
@Math.multiply.IfElse2 // 1881
D;JNE // 1882

////PushInstruction("argument 1")
@ARG // 1883
A=M+1 // 1884
D=M // 1885
@SP // 1886
AM=M+1 // 1887
A=A-1 // 1888
M=D // 1889

////ReturnInstruction{}
@RETURN // 1890
0;JMP // 1891

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 1892
0;JMP // 1893

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
@Math.multiply.EQ.5 // 1894
D=A // 1895
@SP // 1896
AM=M+1 // 1897
A=A-1 // 1898
M=D // 1899
@ARG // 1900
A=M+1 // 1901
D=M // 1902
D=D-1 // 1903
@DO_EQ // 1904
0;JMP // 1905
(Math.multiply.EQ.5)
D=!D // 1906
@Math.multiply.IfElse3 // 1907
D;JNE // 1908

////PushInstruction("argument 0")
@ARG // 1909
A=M // 1910
D=M // 1911
@SP // 1912
AM=M+1 // 1913
A=A-1 // 1914
M=D // 1915

////ReturnInstruction{}
@RETURN // 1916
0;JMP // 1917

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 1918
0;JMP // 1919

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
@Math.multiply.EQ.6 // 1920
D=A // 1921
@SP // 1922
AM=M+1 // 1923
A=A-1 // 1924
M=D // 1925
@ARG // 1926
A=M // 1927
D=M // 1928
@2 // 1929
D=D-A // 1930
@DO_EQ // 1931
0;JMP // 1932
(Math.multiply.EQ.6)
D=!D // 1933
@Math.multiply.IfElse4 // 1934
D;JNE // 1935

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1936
A=M+1 // 1937
D=M // 1938
D=D+M // 1939
@SP // 1940
AM=M+1 // 1941
A=A-1 // 1942
M=D // 1943

////ReturnInstruction{}
@RETURN // 1944
0;JMP // 1945

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 1946
0;JMP // 1947

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
@Math.multiply.EQ.7 // 1948
D=A // 1949
@SP // 1950
AM=M+1 // 1951
A=A-1 // 1952
M=D // 1953
@ARG // 1954
A=M+1 // 1955
D=M // 1956
@2 // 1957
D=D-A // 1958
@DO_EQ // 1959
0;JMP // 1960
(Math.multiply.EQ.7)
D=!D // 1961
@Math.multiply.IfElse5 // 1962
D;JNE // 1963

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1964
A=M // 1965
D=M // 1966
D=D+M // 1967
@SP // 1968
AM=M+1 // 1969
A=A-1 // 1970
M=D // 1971

////ReturnInstruction{}
@RETURN // 1972
0;JMP // 1973

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 1974
0;JMP // 1975

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

@LCL // 1976
A=M+1 // 1977
A=A+1 // 1978
M=1 // 1979

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
@Math.multiply.LT.8 // 1980
D=A // 1981
@SP // 1982
AM=M+1 // 1983
A=A-1 // 1984
M=D // 1985
@LCL // 1986
A=M+1 // 1987
D=M // 1988
@16 // 1989
D=D-A // 1990
@DO_LT // 1991
0;JMP // 1992
(Math.multiply.LT.8)
D=!D // 1993
@WHILE_END_Math.multiply1 // 1994
D;JNE // 1995

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
@Math.multiply.EQ.9 // 1996
D=A // 1997
@SP // 1998
AM=M+1 // 1999
A=A-1 // 2000
M=D // 2001
@ARG // 2002
A=M+1 // 2003
D=M // 2004
@SP // 2005
AM=M+1 // 2006
A=A-1 // 2007
M=D // 2008
@LCL // 2009
A=M+1 // 2010
A=A+1 // 2011
D=M // 2012
@SP // 2013
AM=M-1 // 2014
D=D&M // 2015
@DO_EQ // 2016
0;JMP // 2017
(Math.multiply.EQ.9)
@Math.multiply.IfElse6 // 2018
D;JNE // 2019

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

@LCL // 2020
A=M // 2021
D=M // 2022
@SP // 2023
AM=M+1 // 2024
A=A-1 // 2025
M=D // 2026
@ARG // 2027
A=M // 2028
D=M // 2029
@SP // 2030
AM=M-1 // 2031
D=D+M // 2032
@LCL // 2033
A=M // 2034
M=D // 2035

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 2036
0;JMP // 2037

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

@ARG // 2038
A=M // 2039
D=M // 2040
D=D+M // 2041
@ARG // 2042
A=M // 2043
M=D // 2044

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

@LCL // 2045
A=M+1 // 2046
D=M // 2047
D=D+1 // 2048
@LCL // 2049
A=M+1 // 2050
M=D // 2051

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

@LCL // 2052
A=M+1 // 2053
A=A+1 // 2054
D=M // 2055
D=D+M // 2056
@LCL // 2057
A=M+1 // 2058
A=A+1 // 2059
M=D // 2060

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 2061
0;JMP // 2062

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 2063
A=M // 2064
D=M // 2065
@SP // 2066
AM=M+1 // 2067
A=A-1 // 2068
M=D // 2069

////ReturnInstruction{}
@RETURN // 2070
0;JMP // 2071

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 2072
D=A // 2073
@SP // 2074
AM=D+M // 2075
A=A-1 // 2076
M=0 // 2077
A=A-1 // 2078
M=0 // 2079
A=A-1 // 2080
M=0 // 2081

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2082
A=M // 2083
D=M // 2084
@SP // 2085
AM=M+1 // 2086
A=A-1 // 2087
M=D // 2088
// call Math.abs
@6 // 2089
D=A // 2090
@14 // 2091
M=D // 2092
@Math.abs // 2093
D=A // 2094
@13 // 2095
M=D // 2096
@Math.divide.ret.0 // 2097
D=A // 2098
@CALL // 2099
0;JMP // 2100
(Math.divide.ret.0)
@SP // 2101
AM=M-1 // 2102
D=M // 2103
@LCL // 2104
A=M+1 // 2105
M=D // 2106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 2107
A=M+1 // 2108
D=M // 2109
@SP // 2110
AM=M+1 // 2111
A=A-1 // 2112
M=D // 2113
// call Math.abs
@6 // 2114
D=A // 2115
@14 // 2116
M=D // 2117
@Math.abs // 2118
D=A // 2119
@13 // 2120
M=D // 2121
@Math.divide.ret.1 // 2122
D=A // 2123
@CALL // 2124
0;JMP // 2125
(Math.divide.ret.1)
@SP // 2126
AM=M-1 // 2127
D=M // 2128
@LCL // 2129
A=M+1 // 2130
A=A+1 // 2131
M=D // 2132

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
@Math.divide.GT.10 // 2133
D=A // 2134
@SP // 2135
AM=M+1 // 2136
A=A-1 // 2137
M=D // 2138
@LCL // 2139
A=M+1 // 2140
A=A+1 // 2141
D=M // 2142
A=A-1 // 2143
D=D-M // 2144
@DO_GT // 2145
0;JMP // 2146
(Math.divide.GT.10)
D=!D // 2147
@Math.divide.IfElse1 // 2148
D;JNE // 2149

////PushInstruction("constant 0")
@SP // 2150
AM=M+1 // 2151
A=A-1 // 2152
M=0 // 2153

////ReturnInstruction{}
@RETURN // 2154
0;JMP // 2155

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 2156
0;JMP // 2157

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

@LCL // 2158
A=M+1 // 2159
D=M // 2160
@SP // 2161
AM=M+1 // 2162
A=A-1 // 2163
M=D // 2164
@2 // 2165
D=A // 2166
@SP // 2167
AM=M+1 // 2168
A=A-1 // 2169
M=D // 2170
@LCL // 2171
A=M+1 // 2172
A=A+1 // 2173
D=M // 2174
@SP // 2175
AM=M+1 // 2176
A=A-1 // 2177
M=D // 2178
// call Math.multiply
@7 // 2179
D=A // 2180
@14 // 2181
M=D // 2182
@Math.multiply // 2183
D=A // 2184
@13 // 2185
M=D // 2186
@Math.divide.ret.2 // 2187
D=A // 2188
@CALL // 2189
0;JMP // 2190
(Math.divide.ret.2)
// call Math.divide
@7 // 2191
D=A // 2192
@14 // 2193
M=D // 2194
@Math.divide // 2195
D=A // 2196
@13 // 2197
M=D // 2198
@Math.divide.ret.3 // 2199
D=A // 2200
@CALL // 2201
0;JMP // 2202
(Math.divide.ret.3)
@SP // 2203
AM=M-1 // 2204
D=M // 2205
@LCL // 2206
A=M // 2207
M=D // 2208

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
@Math.divide.LT.11 // 2209
D=A // 2210
@SP // 2211
AM=M+1 // 2212
A=A-1 // 2213
M=D // 2214
@LCL // 2215
A=M+1 // 2216
D=M // 2217
@SP // 2218
AM=M+1 // 2219
A=A-1 // 2220
M=D // 2221
@2 // 2222
D=A // 2223
@SP // 2224
AM=M+1 // 2225
A=A-1 // 2226
M=D // 2227
@LCL // 2228
A=M // 2229
D=M // 2230
@SP // 2231
AM=M+1 // 2232
A=A-1 // 2233
M=D // 2234
// call Math.multiply
@7 // 2235
D=A // 2236
@14 // 2237
M=D // 2238
@Math.multiply // 2239
D=A // 2240
@13 // 2241
M=D // 2242
@Math.divide.ret.4 // 2243
D=A // 2244
@CALL // 2245
0;JMP // 2246
(Math.divide.ret.4)
@LCL // 2247
A=M+1 // 2248
A=A+1 // 2249
D=M // 2250
@SP // 2251
AM=M+1 // 2252
A=A-1 // 2253
M=D // 2254
// call Math.multiply
@7 // 2255
D=A // 2256
@14 // 2257
M=D // 2258
@Math.multiply // 2259
D=A // 2260
@13 // 2261
M=D // 2262
@Math.divide.ret.5 // 2263
D=A // 2264
@CALL // 2265
0;JMP // 2266
(Math.divide.ret.5)
@SP // 2267
AM=M-1 // 2268
D=M // 2269
@SP // 2270
AM=M-1 // 2271
D=M-D // 2272
@SP // 2273
AM=M+1 // 2274
A=A-1 // 2275
M=D // 2276
@LCL // 2277
A=M+1 // 2278
A=A+1 // 2279
D=M // 2280
@SP // 2281
AM=M-1 // 2282
D=M-D // 2283
@DO_LT // 2284
0;JMP // 2285
(Math.divide.LT.11)
D=!D // 2286
@Math.divide.IfElse2 // 2287
D;JNE // 2288

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
@Math.divide.EQ.12 // 2289
D=A // 2290
@SP // 2291
AM=M+1 // 2292
A=A-1 // 2293
M=D // 2294
@Math.divide.GT.13 // 2295
D=A // 2296
@SP // 2297
AM=M+1 // 2298
A=A-1 // 2299
M=D // 2300
@Math.divide.LT.14 // 2301
D=A // 2302
@SP // 2303
AM=M+1 // 2304
A=A-1 // 2305
M=D // 2306
@ARG // 2307
A=M // 2308
D=M // 2309
@DO_LT // 2310
0;JMP // 2311
(Math.divide.LT.14)
@SP // 2312
AM=M+1 // 2313
A=A-1 // 2314
M=D // 2315
@ARG // 2316
A=M+1 // 2317
D=M // 2318
@SP // 2319
AM=M-1 // 2320
D=D&M // 2321
@DO_GT // 2322
0;JMP // 2323
(Math.divide.GT.13)
@SP // 2324
AM=M+1 // 2325
A=A-1 // 2326
M=D // 2327
@Math.divide.LT.15 // 2328
D=A // 2329
@SP // 2330
AM=M+1 // 2331
A=A-1 // 2332
M=D // 2333
@Math.divide.GT.16 // 2334
D=A // 2335
@SP // 2336
AM=M+1 // 2337
A=A-1 // 2338
M=D // 2339
@ARG // 2340
A=M // 2341
D=M // 2342
@DO_GT // 2343
0;JMP // 2344
(Math.divide.GT.16)
@SP // 2345
AM=M+1 // 2346
A=A-1 // 2347
M=D // 2348
@ARG // 2349
A=M+1 // 2350
D=M // 2351
@SP // 2352
AM=M-1 // 2353
D=D&M // 2354
@DO_LT // 2355
0;JMP // 2356
(Math.divide.LT.15)
@SP // 2357
AM=M-1 // 2358
D=D|M // 2359
@DO_EQ // 2360
0;JMP // 2361
(Math.divide.EQ.12)
@Math.divide.IfElse3 // 2362
D;JNE // 2363

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2364
A=M // 2365
D=-M // 2366
@LCL // 2367
A=M // 2368
M=D // 2369

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 2370
0;JMP // 2371

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("local 0")], call=CallInstruction{Math.multiply}}
@2 // 2372
D=A // 2373
@SP // 2374
AM=M+1 // 2375
A=A-1 // 2376
M=D // 2377
@LCL // 2378
A=M // 2379
D=M // 2380
@SP // 2381
AM=M+1 // 2382
A=A-1 // 2383
M=D // 2384
// call Math.multiply
@7 // 2385
D=A // 2386
@14 // 2387
M=D // 2388
@Math.multiply // 2389
D=A // 2390
@13 // 2391
M=D // 2392
@Math.divide.ret.6 // 2393
D=A // 2394
@CALL // 2395
0;JMP // 2396
(Math.divide.ret.6)

////ReturnInstruction{}
@RETURN // 2397
0;JMP // 2398

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 2399
0;JMP // 2400

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
@Math.divide.EQ.17 // 2401
D=A // 2402
@SP // 2403
AM=M+1 // 2404
A=A-1 // 2405
M=D // 2406
@Math.divide.GT.18 // 2407
D=A // 2408
@SP // 2409
AM=M+1 // 2410
A=A-1 // 2411
M=D // 2412
@Math.divide.LT.19 // 2413
D=A // 2414
@SP // 2415
AM=M+1 // 2416
A=A-1 // 2417
M=D // 2418
@ARG // 2419
A=M // 2420
D=M // 2421
@DO_LT // 2422
0;JMP // 2423
(Math.divide.LT.19)
@SP // 2424
AM=M+1 // 2425
A=A-1 // 2426
M=D // 2427
@ARG // 2428
A=M+1 // 2429
D=M // 2430
@SP // 2431
AM=M-1 // 2432
D=D&M // 2433
@DO_GT // 2434
0;JMP // 2435
(Math.divide.GT.18)
@SP // 2436
AM=M+1 // 2437
A=A-1 // 2438
M=D // 2439
@Math.divide.LT.20 // 2440
D=A // 2441
@SP // 2442
AM=M+1 // 2443
A=A-1 // 2444
M=D // 2445
@Math.divide.GT.21 // 2446
D=A // 2447
@SP // 2448
AM=M+1 // 2449
A=A-1 // 2450
M=D // 2451
@ARG // 2452
A=M // 2453
D=M // 2454
@DO_GT // 2455
0;JMP // 2456
(Math.divide.GT.21)
@SP // 2457
AM=M+1 // 2458
A=A-1 // 2459
M=D // 2460
@ARG // 2461
A=M+1 // 2462
D=M // 2463
@SP // 2464
AM=M-1 // 2465
D=D&M // 2466
@DO_LT // 2467
0;JMP // 2468
(Math.divide.LT.20)
@SP // 2469
AM=M-1 // 2470
D=D|M // 2471
@DO_EQ // 2472
0;JMP // 2473
(Math.divide.EQ.17)
@Math.divide.IfElse4 // 2474
D;JNE // 2475

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2476
A=M // 2477
D=-M // 2478
@LCL // 2479
A=M // 2480
M=D // 2481

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 2482
0;JMP // 2483

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
@2 // 2484
D=A // 2485
@SP // 2486
AM=M+1 // 2487
A=A-1 // 2488
M=D // 2489
@LCL // 2490
A=M // 2491
D=M // 2492
@SP // 2493
AM=M+1 // 2494
A=A-1 // 2495
M=D // 2496
// call Math.multiply
@7 // 2497
D=A // 2498
@14 // 2499
M=D // 2500
@Math.multiply // 2501
D=A // 2502
@13 // 2503
M=D // 2504
@Math.divide.ret.7 // 2505
D=A // 2506
@CALL // 2507
0;JMP // 2508
(Math.divide.ret.7)
@SP // 2509
AM=M-1 // 2510
D=M // 2511
D=D+1 // 2512
@SP // 2513
AM=M+1 // 2514
A=A-1 // 2515
M=D // 2516

////ReturnInstruction{}
@RETURN // 2517
0;JMP // 2518

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
@ARG // 2519
A=M // 2520
D=M // 2521
@SP // 2522
AM=M+1 // 2523
A=A-1 // 2524
M=D // 2525
@ARG // 2526
A=M // 2527
D=M // 2528
@SP // 2529
AM=M+1 // 2530
A=A-1 // 2531
M=D // 2532
@ARG // 2533
A=M+1 // 2534
D=M // 2535
@SP // 2536
AM=M+1 // 2537
A=A-1 // 2538
M=D // 2539
// call Math.divide
@7 // 2540
D=A // 2541
@14 // 2542
M=D // 2543
@Math.divide // 2544
D=A // 2545
@13 // 2546
M=D // 2547
@Math.mod.ret.0 // 2548
D=A // 2549
@CALL // 2550
0;JMP // 2551
(Math.mod.ret.0)
@ARG // 2552
A=M+1 // 2553
D=M // 2554
@SP // 2555
AM=M+1 // 2556
A=A-1 // 2557
M=D // 2558
// call Math.multiply
@7 // 2559
D=A // 2560
@14 // 2561
M=D // 2562
@Math.multiply // 2563
D=A // 2564
@13 // 2565
M=D // 2566
@Math.mod.ret.1 // 2567
D=A // 2568
@CALL // 2569
0;JMP // 2570
(Math.mod.ret.1)
@SP // 2571
AM=M-1 // 2572
D=M // 2573
@SP // 2574
AM=M-1 // 2575
D=M-D // 2576
@SP // 2577
AM=M+1 // 2578
A=A-1 // 2579
M=D // 2580

////ReturnInstruction{}
@RETURN // 2581
0;JMP // 2582

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
@Math.0 // 2583
D=M // 2584
@SP // 2585
AM=M+1 // 2586
A=A-1 // 2587
M=D // 2588
@ARG // 2589
A=M // 2590
D=M // 2591
@SP // 2592
AM=M-1 // 2593
A=D+M // 2594
D=M // 2595
@SP // 2596
AM=M+1 // 2597
A=A-1 // 2598
M=D // 2599

////ReturnInstruction{}
@RETURN // 2600
0;JMP // 2601

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=8, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 2602
D=A // 2603
@SP // 2604
AM=D+M // 2605
A=A-1 // 2606
M=0 // 2607
A=A-1 // 2608
M=0 // 2609
A=A-1 // 2610
M=0 // 2611
A=A-1 // 2612
M=0 // 2613

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2614
A=M // 2615
M=0 // 2616

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 2617
D=A // 2618
@LCL // 2619
A=M+1 // 2620
M=D // 2621

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
@Math.sqrt.EQ.22 // 2622
D=A // 2623
@SP // 2624
AM=M+1 // 2625
A=A-1 // 2626
M=D // 2627
@Math.sqrt.LT.23 // 2628
D=A // 2629
@SP // 2630
AM=M+1 // 2631
A=A-1 // 2632
M=D // 2633
@LCL // 2634
A=M+1 // 2635
D=M // 2636
@DO_LT // 2637
0;JMP // 2638
(Math.sqrt.LT.23)
D=!D // 2639
@DO_EQ // 2640
0;JMP // 2641
(Math.sqrt.EQ.22)
@WHILE_END_Math.sqrt1 // 2642
D;JNE // 2643

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

@LCL // 2644
A=M // 2645
D=M // 2646
@SP // 2647
AM=M+1 // 2648
A=A-1 // 2649
M=D // 2650
@Math.0 // 2651
D=M // 2652
@SP // 2653
AM=M+1 // 2654
A=A-1 // 2655
M=D // 2656
@LCL // 2657
A=M+1 // 2658
D=M // 2659
@SP // 2660
AM=M-1 // 2661
A=D+M // 2662
D=M // 2663
@SP // 2664
AM=M-1 // 2665
D=D+M // 2666
@LCL // 2667
A=M+1 // 2668
A=A+1 // 2669
M=D // 2670

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 2671
D=A // 2672
@SP // 2673
M=D+M // 2674
@LCL // 2675
A=M+1 // 2676
A=A+1 // 2677
D=M // 2678
@SP // 2679
A=M-1 // 2680
M=D // 2681
A=A-1 // 2682
M=D // 2683
// call Math.multiply
@7 // 2684
D=A // 2685
@14 // 2686
M=D // 2687
@Math.multiply // 2688
D=A // 2689
@13 // 2690
M=D // 2691
@Math.sqrt.ret.0 // 2692
D=A // 2693
@CALL // 2694
0;JMP // 2695
(Math.sqrt.ret.0)
@SP // 2696
AM=M-1 // 2697
D=M // 2698
@LCL // 2699
A=M+1 // 2700
A=A+1 // 2701
A=A+1 // 2702
M=D // 2703

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
@Math.sqrt.EQ.24 // 2704
D=A // 2705
@SP // 2706
AM=M+1 // 2707
A=A-1 // 2708
M=D // 2709
@Math.sqrt.GT.25 // 2710
D=A // 2711
@SP // 2712
AM=M+1 // 2713
A=A-1 // 2714
M=D // 2715
@LCL // 2716
A=M+1 // 2717
A=A+1 // 2718
A=A+1 // 2719
D=M // 2720
@SP // 2721
AM=M+1 // 2722
A=A-1 // 2723
M=D // 2724
@ARG // 2725
A=M // 2726
D=M // 2727
@SP // 2728
AM=M-1 // 2729
D=M-D // 2730
@DO_GT // 2731
0;JMP // 2732
(Math.sqrt.GT.25)
@SP // 2733
AM=M+1 // 2734
A=A-1 // 2735
M=D // 2736
@SP // 2737
A=M-1 // 2738
M=!D // 2739
@Math.sqrt.GT.26 // 2740
D=A // 2741
@SP // 2742
AM=M+1 // 2743
A=A-1 // 2744
M=D // 2745
@LCL // 2746
A=M+1 // 2747
A=A+1 // 2748
A=A+1 // 2749
D=M // 2750
@DO_GT // 2751
0;JMP // 2752
(Math.sqrt.GT.26)
@SP // 2753
AM=M-1 // 2754
D=D&M // 2755
@DO_EQ // 2756
0;JMP // 2757
(Math.sqrt.EQ.24)
@Math.sqrt.IfElse1 // 2758
D;JNE // 2759

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2760
A=M+1 // 2761
A=A+1 // 2762
D=M // 2763
@LCL // 2764
A=M // 2765
M=D // 2766

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 2767
0;JMP // 2768

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

@LCL // 2769
A=M+1 // 2770
D=M // 2771
D=D-1 // 2772
@LCL // 2773
A=M+1 // 2774
M=D // 2775

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 2776
0;JMP // 2777

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 2778
A=M // 2779
D=M // 2780
@SP // 2781
AM=M+1 // 2782
A=A-1 // 2783
M=D // 2784

////ReturnInstruction{}
@RETURN // 2785
0;JMP // 2786

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
@Math.max.GT.27 // 2787
D=A // 2788
@SP // 2789
AM=M+1 // 2790
A=A-1 // 2791
M=D // 2792
@ARG // 2793
A=M+1 // 2794
D=M // 2795
A=A-1 // 2796
D=M-D // 2797
@DO_GT // 2798
0;JMP // 2799
(Math.max.GT.27)
D=!D // 2800
@Math.max.IfElse1 // 2801
D;JNE // 2802

////PushInstruction("argument 0")
@ARG // 2803
A=M // 2804
D=M // 2805
@SP // 2806
AM=M+1 // 2807
A=A-1 // 2808
M=D // 2809

////ReturnInstruction{}
@RETURN // 2810
0;JMP // 2811

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 2812
0;JMP // 2813

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2814
A=M+1 // 2815
D=M // 2816
@SP // 2817
AM=M+1 // 2818
A=A-1 // 2819
M=D // 2820

////ReturnInstruction{}
@RETURN // 2821
0;JMP // 2822

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
@Math.min.LT.28 // 2823
D=A // 2824
@SP // 2825
AM=M+1 // 2826
A=A-1 // 2827
M=D // 2828
@ARG // 2829
A=M+1 // 2830
D=M // 2831
A=A-1 // 2832
D=M-D // 2833
@DO_LT // 2834
0;JMP // 2835
(Math.min.LT.28)
D=!D // 2836
@Math.min.IfElse1 // 2837
D;JNE // 2838

////PushInstruction("argument 0")
@ARG // 2839
A=M // 2840
D=M // 2841
@SP // 2842
AM=M+1 // 2843
A=A-1 // 2844
M=D // 2845

////ReturnInstruction{}
@RETURN // 2846
0;JMP // 2847

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 2848
0;JMP // 2849

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2850
A=M+1 // 2851
D=M // 2852
@SP // 2853
AM=M+1 // 2854
A=A-1 // 2855
M=D // 2856

////ReturnInstruction{}
@RETURN // 2857
0;JMP // 2858

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=8, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2859
A=M // 2860
D=M // 2861
@SP // 2862
AM=M+1 // 2863
A=A-1 // 2864
M=D // 2865
@ARG // 2866
A=M // 2867
D=M // 2868
@SP // 2869
AM=M+1 // 2870
A=A-1 // 2871
M=D // 2872
@SP // 2873
A=M-1 // 2874
M=-D // 2875
// call Math.max
@7 // 2876
D=A // 2877
@14 // 2878
M=D // 2879
@Math.max // 2880
D=A // 2881
@13 // 2882
M=D // 2883
@Math.abs.ret.0 // 2884
D=A // 2885
@CALL // 2886
0;JMP // 2887
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 2888
0;JMP // 2889

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 2890
M=M+1 // 2891
AM=M+1 // 2892
A=A-1 // 2893
M=0 // 2894
A=A-1 // 2895
M=0 // 2896

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

@2055 // 2897
D=A // 2898
@LCL // 2899
A=M // 2900
M=D // 2901

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
@LCL // 2902
A=M // 2903
D=M // 2904
@SP // 2905
AM=M+1 // 2906
A=A-1 // 2907
M=D // 2908
@LCL // 2909
A=M // 2910
D=M // 2911
@16384 // 2912
D=A-D // 2913
@5 // 2914
D=D-A // 2915
@SP // 2916
AM=M-1 // 2917
A=M // 2918
M=D // 2919

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2920
A=M // 2921
D=M // 2922
@SP // 2923
AM=M+1 // 2924
A=A-1 // 2925
M=D+1 // 2926
D=1 // 2927
@SP // 2928
AM=M-1 // 2929
A=M // 2930
M=D // 2931

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2932
A=M // 2933
D=M // 2934
@2 // 2935
D=D+A // 2936
@SP // 2937
AM=M+1 // 2938
A=A-1 // 2939
M=D // 2940
D=0 // 2941
@SP // 2942
AM=M-1 // 2943
A=M // 2944
M=D // 2945

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2946
A=M // 2947
D=M // 2948
@3 // 2949
D=D+A // 2950
@SP // 2951
AM=M+1 // 2952
A=A-1 // 2953
M=D // 2954
D=0 // 2955
@SP // 2956
AM=M-1 // 2957
A=M // 2958
M=D // 2959

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2960
A=M // 2961
D=M // 2962
@SP // 2963
AM=M+1 // 2964
A=A-1 // 2965
M=D // 2966
// call Memory.create_foot
@6 // 2967
D=A // 2968
@14 // 2969
M=D // 2970
@Memory.create_foot // 2971
D=A // 2972
@13 // 2973
M=D // 2974
@Memory.init.ret.0 // 2975
D=A // 2976
@CALL // 2977
0;JMP // 2978
(Memory.init.ret.0)
@SP // 2979
M=M-1 // 2980

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

@2054 // 2981
D=A // 2982
@SP // 2983
AM=M+1 // 2984
A=A-1 // 2985
M=D // 2986
@2054 // 2987
D=A // 2988
@SP // 2989
AM=M+1 // 2990
A=A-1 // 2991
M=D // 2992
@LCL // 2993
A=M // 2994
D=M // 2995
@SP // 2996
AM=M+1 // 2997
A=A-1 // 2998
M=D // 2999
// call Memory.add_node
@7 // 3000
D=A // 3001
@14 // 3002
M=D // 3003
@Memory.add_node // 3004
D=A // 3005
@13 // 3006
M=D // 3007
@Memory.init.ret.1 // 3008
D=A // 3009
@CALL // 3010
0;JMP // 3011
(Memory.init.ret.1)
@SP // 3012
M=M-1 // 3013

////PushInstruction("constant 0")
@SP // 3014
AM=M+1 // 3015
A=A-1 // 3016
M=0 // 3017

////ReturnInstruction{}
@RETURN // 3018
0;JMP // 3019

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 3020
D=A // 3021
@SP // 3022
AM=D+M // 3023
A=A-1 // 3024
M=0 // 3025
A=A-1 // 3026
M=0 // 3027
A=A-1 // 3028
M=0 // 3029
A=A-1 // 3030
M=0 // 3031
A=A-1 // 3032
M=0 // 3033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3034
A=M // 3035
D=M // 3036
@SP // 3037
AM=M+1 // 3038
A=A-1 // 3039
M=D // 3040
// call Memory.getBinIndex
@6 // 3041
D=A // 3042
@14 // 3043
M=D // 3044
@Memory.getBinIndex // 3045
D=A // 3046
@13 // 3047
M=D // 3048
@Memory.alloc.ret.0 // 3049
D=A // 3050
@CALL // 3051
0;JMP // 3052
(Memory.alloc.ret.0)
@SP // 3053
AM=M-1 // 3054
D=M // 3055
@LCL // 3056
A=M // 3057
M=D // 3058

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

@LCL // 3059
A=M // 3060
D=M // 3061
@2048 // 3062
D=D+A // 3063
@LCL // 3064
A=M+1 // 3065
M=D // 3066

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3067
A=M+1 // 3068
D=M // 3069
@SP // 3070
AM=M+1 // 3071
A=A-1 // 3072
M=D // 3073
@ARG // 3074
A=M // 3075
D=M // 3076
@SP // 3077
AM=M+1 // 3078
A=A-1 // 3079
M=D // 3080
// call Memory.get_best_fit
@7 // 3081
D=A // 3082
@14 // 3083
M=D // 3084
@Memory.get_best_fit // 3085
D=A // 3086
@13 // 3087
M=D // 3088
@Memory.alloc.ret.1 // 3089
D=A // 3090
@CALL // 3091
0;JMP // 3092
(Memory.alloc.ret.1)
@SP // 3093
AM=M-1 // 3094
D=M // 3095
@LCL // 3096
A=M+1 // 3097
A=A+1 // 3098
M=D // 3099

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
@Memory.alloc.EQ.0 // 3100
D=A // 3101
@SP // 3102
AM=M+1 // 3103
A=A-1 // 3104
M=D // 3105
@LCL // 3106
A=M+1 // 3107
A=A+1 // 3108
D=M // 3109
@DO_EQ // 3110
0;JMP // 3111
(Memory.alloc.EQ.0)
@WHILE_END_Memory.alloc1 // 3112
D;JEQ // 3113

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
@Memory.alloc.EQ.1 // 3114
D=A // 3115
@SP // 3116
AM=M+1 // 3117
A=A-1 // 3118
M=D // 3119
@Memory.alloc.LT.2 // 3120
D=A // 3121
@SP // 3122
AM=M+1 // 3123
A=A-1 // 3124
M=D // 3125
@LCL // 3126
A=M // 3127
D=M // 3128
D=D+1 // 3129
@7 // 3130
D=D-A // 3131
@DO_LT // 3132
0;JMP // 3133
(Memory.alloc.LT.2)
D=!D // 3134
@DO_EQ // 3135
0;JMP // 3136
(Memory.alloc.EQ.1)
@Memory.alloc.IfElse1 // 3137
D;JNE // 3138

////PushInstruction("constant 0")
@SP // 3139
AM=M+1 // 3140
A=A-1 // 3141
M=0 // 3142

////ReturnInstruction{}
@RETURN // 3143
0;JMP // 3144

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 3145
0;JMP // 3146

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

@LCL // 3147
A=M // 3148
D=M // 3149
D=D+1 // 3150
@LCL // 3151
A=M // 3152
M=D // 3153

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

@LCL // 3154
A=M // 3155
D=M // 3156
@2048 // 3157
D=D+A // 3158
@LCL // 3159
A=M+1 // 3160
M=D // 3161

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3162
A=M+1 // 3163
D=M // 3164
@SP // 3165
AM=M+1 // 3166
A=A-1 // 3167
M=D // 3168
@ARG // 3169
A=M // 3170
D=M // 3171
@SP // 3172
AM=M+1 // 3173
A=A-1 // 3174
M=D // 3175
// call Memory.get_best_fit
@7 // 3176
D=A // 3177
@14 // 3178
M=D // 3179
@Memory.get_best_fit // 3180
D=A // 3181
@13 // 3182
M=D // 3183
@Memory.alloc.ret.2 // 3184
D=A // 3185
@CALL // 3186
0;JMP // 3187
(Memory.alloc.ret.2)
@SP // 3188
AM=M-1 // 3189
D=M // 3190
@LCL // 3191
A=M+1 // 3192
A=A+1 // 3193
M=D // 3194

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 3195
0;JMP // 3196

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

@LCL // 3197
A=M+1 // 3198
A=A+1 // 3199
D=M // 3200
@0 // 3201
A=D+A // 3202
D=M // 3203
@SP // 3204
AM=M+1 // 3205
A=A-1 // 3206
M=D // 3207
// call Memory.getBinIndex
@6 // 3208
D=A // 3209
@14 // 3210
M=D // 3211
@Memory.getBinIndex // 3212
D=A // 3213
@13 // 3214
M=D // 3215
@Memory.alloc.ret.3 // 3216
D=A // 3217
@CALL // 3218
0;JMP // 3219
(Memory.alloc.ret.3)
@SP // 3220
AM=M-1 // 3221
D=M // 3222
@2048 // 3223
D=D+A // 3224
@SP // 3225
AM=M+1 // 3226
A=A-1 // 3227
M=D // 3228
@LCL // 3229
A=M+1 // 3230
A=A+1 // 3231
D=M // 3232
@SP // 3233
AM=M+1 // 3234
A=A-1 // 3235
M=D // 3236
// call Memory.remove_node
@7 // 3237
D=A // 3238
@14 // 3239
M=D // 3240
@Memory.remove_node // 3241
D=A // 3242
@13 // 3243
M=D // 3244
@Memory.alloc.ret.4 // 3245
D=A // 3246
@CALL // 3247
0;JMP // 3248
(Memory.alloc.ret.4)
@SP // 3249
M=M-1 // 3250

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

@LCL // 3251
A=M+1 // 3252
A=A+1 // 3253
D=M // 3254
@0 // 3255
A=D+A // 3256
D=M // 3257
@SP // 3258
AM=M+1 // 3259
A=A-1 // 3260
M=D // 3261
@ARG // 3262
A=M // 3263
D=M // 3264
@SP // 3265
AM=M-1 // 3266
D=M-D // 3267
@LCL // 3268
A=M+1 // 3269
A=A+1 // 3270
A=A+1 // 3271
M=D // 3272

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
@Memory.alloc.GT.3 // 3273
D=A // 3274
@SP // 3275
AM=M+1 // 3276
A=A-1 // 3277
M=D // 3278
@LCL // 3279
A=M+1 // 3280
A=A+1 // 3281
A=A+1 // 3282
D=M // 3283
@5 // 3284
D=D-A // 3285
@DO_GT // 3286
0;JMP // 3287
(Memory.alloc.GT.3)
D=!D // 3288
@Memory.alloc.IfElse2 // 3289
D;JNE // 3290

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 3291
A=M+1 // 3292
A=A+1 // 3293
D=M // 3294
@SP // 3295
AM=M+1 // 3296
A=A-1 // 3297
M=D // 3298
@ARG // 3299
A=M // 3300
D=M // 3301
@SP // 3302
AM=M-1 // 3303
A=M // 3304
M=D // 3305

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3306
A=M+1 // 3307
A=A+1 // 3308
D=M // 3309
@SP // 3310
AM=M+1 // 3311
A=A-1 // 3312
M=D+1 // 3313
D=0 // 3314
@SP // 3315
AM=M-1 // 3316
A=M // 3317
M=D // 3318

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3319
A=M+1 // 3320
A=A+1 // 3321
D=M // 3322
@SP // 3323
AM=M+1 // 3324
A=A-1 // 3325
M=D // 3326
// call Memory.create_foot
@6 // 3327
D=A // 3328
@14 // 3329
M=D // 3330
@Memory.create_foot // 3331
D=A // 3332
@13 // 3333
M=D // 3334
@Memory.alloc.ret.5 // 3335
D=A // 3336
@CALL // 3337
0;JMP // 3338
(Memory.alloc.ret.5)
@SP // 3339
M=M-1 // 3340

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

@LCL // 3341
A=M+1 // 3342
A=A+1 // 3343
D=M // 3344
@SP // 3345
AM=M+1 // 3346
A=A-1 // 3347
M=D // 3348
@ARG // 3349
A=M // 3350
D=M // 3351
@SP // 3352
AM=M-1 // 3353
D=D+M // 3354
@5 // 3355
D=D+A // 3356
@SP // 3357
AM=M+1 // 3358
A=A-1 // 3359
M=D // 3360
@LCL // 3361
D=M // 3362
@4 // 3363
A=D+A // 3364
D=A // 3365
@R13 // 3366
M=D // 3367
@SP // 3368
AM=M-1 // 3369
D=M // 3370
@R13 // 3371
A=M // 3372
M=D // 3373

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
@LCL // 3374
D=M // 3375
@4 // 3376
A=D+A // 3377
D=M // 3378
@SP // 3379
AM=M+1 // 3380
A=A-1 // 3381
M=D // 3382
@LCL // 3383
A=M+1 // 3384
A=A+1 // 3385
A=A+1 // 3386
D=M // 3387
@5 // 3388
D=D-A // 3389
@SP // 3390
AM=M-1 // 3391
A=M // 3392
M=D // 3393

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3394
D=M // 3395
@4 // 3396
A=D+A // 3397
D=M // 3398
@SP // 3399
AM=M+1 // 3400
A=A-1 // 3401
M=D+1 // 3402
D=1 // 3403
@SP // 3404
AM=M-1 // 3405
A=M // 3406
M=D // 3407

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3408
D=M // 3409
@4 // 3410
A=D+A // 3411
D=M // 3412
@SP // 3413
AM=M+1 // 3414
A=A-1 // 3415
M=D // 3416
// call Memory.create_foot
@6 // 3417
D=A // 3418
@14 // 3419
M=D // 3420
@Memory.create_foot // 3421
D=A // 3422
@13 // 3423
M=D // 3424
@Memory.alloc.ret.6 // 3425
D=A // 3426
@CALL // 3427
0;JMP // 3428
(Memory.alloc.ret.6)
@SP // 3429
M=M-1 // 3430

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

@LCL // 3431
A=M+1 // 3432
A=A+1 // 3433
A=A+1 // 3434
D=M // 3435
@SP // 3436
AM=M+1 // 3437
A=A-1 // 3438
M=D // 3439
// call Memory.getBinIndex
@6 // 3440
D=A // 3441
@14 // 3442
M=D // 3443
@Memory.getBinIndex // 3444
D=A // 3445
@13 // 3446
M=D // 3447
@Memory.alloc.ret.7 // 3448
D=A // 3449
@CALL // 3450
0;JMP // 3451
(Memory.alloc.ret.7)
@SP // 3452
AM=M-1 // 3453
D=M // 3454
@2048 // 3455
D=D+A // 3456
@SP // 3457
AM=M+1 // 3458
A=A-1 // 3459
M=D // 3460
@LCL // 3461
D=M // 3462
@4 // 3463
A=D+A // 3464
D=M // 3465
@SP // 3466
AM=M+1 // 3467
A=A-1 // 3468
M=D // 3469
// call Memory.add_node
@7 // 3470
D=A // 3471
@14 // 3472
M=D // 3473
@Memory.add_node // 3474
D=A // 3475
@13 // 3476
M=D // 3477
@Memory.alloc.ret.8 // 3478
D=A // 3479
@CALL // 3480
0;JMP // 3481
(Memory.alloc.ret.8)
@SP // 3482
M=M-1 // 3483

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 3484
0;JMP // 3485

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
@LCL // 3486
A=M+1 // 3487
A=A+1 // 3488
D=M // 3489
@SP // 3490
AM=M+1 // 3491
A=A-1 // 3492
M=D+1 // 3493
D=0 // 3494
@SP // 3495
AM=M-1 // 3496
A=M // 3497
M=D // 3498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3499
A=M+1 // 3500
A=A+1 // 3501
D=M // 3502
@SP // 3503
AM=M+1 // 3504
A=A-1 // 3505
M=D // 3506
// call Memory.create_foot
@6 // 3507
D=A // 3508
@14 // 3509
M=D // 3510
@Memory.create_foot // 3511
D=A // 3512
@13 // 3513
M=D // 3514
@Memory.alloc.ret.9 // 3515
D=A // 3516
@CALL // 3517
0;JMP // 3518
(Memory.alloc.ret.9)
@SP // 3519
M=M-1 // 3520

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
@LCL // 3521
A=M+1 // 3522
A=A+1 // 3523
D=M // 3524
@4 // 3525
D=D+A // 3526
@SP // 3527
AM=M+1 // 3528
A=A-1 // 3529
M=D // 3530

////ReturnInstruction{}
@RETURN // 3531
0;JMP // 3532

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 3533
AM=M+1 // 3534
A=A-1 // 3535
M=0 // 3536

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3537
A=M // 3538
D=M // 3539
@SP // 3540
AM=M+1 // 3541
A=A-1 // 3542
M=D // 3543
// call Memory.alloc
@6 // 3544
D=A // 3545
@14 // 3546
M=D // 3547
@Memory.alloc // 3548
D=A // 3549
@13 // 3550
M=D // 3551
@Memory.calloc.ret.0 // 3552
D=A // 3553
@CALL // 3554
0;JMP // 3555
(Memory.calloc.ret.0)
@SP // 3556
AM=M-1 // 3557
D=M // 3558
@LCL // 3559
A=M // 3560
M=D // 3561

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.4 // 3562
D=A // 3563
@SP // 3564
AM=M+1 // 3565
A=A-1 // 3566
M=D // 3567
@LCL // 3568
A=M // 3569
D=!M // 3570
@DO_EQ // 3571
0;JMP // 3572
(Memory.calloc.EQ.4)
@Memory.calloc.IfElse1 // 3573
D;JNE // 3574

////PushInstruction("constant 0")
@SP // 3575
AM=M+1 // 3576
A=A-1 // 3577
M=0 // 3578

////ReturnInstruction{}
@RETURN // 3579
0;JMP // 3580

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 3581
0;JMP // 3582

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
@Memory.calloc.GT.5 // 3583
D=A // 3584
@SP // 3585
AM=M+1 // 3586
A=A-1 // 3587
M=D // 3588
@ARG // 3589
A=M // 3590
D=M // 3591
@DO_GT // 3592
0;JMP // 3593
(Memory.calloc.GT.5)
D=!D // 3594
@WHILE_END_Memory.calloc1 // 3595
D;JNE // 3596

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

@ARG // 3597
A=M // 3598
D=M // 3599
D=D-1 // 3600
@ARG // 3601
A=M // 3602
M=D // 3603

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 3604
A=M // 3605
D=M // 3606
@SP // 3607
AM=M+1 // 3608
A=A-1 // 3609
M=D // 3610
@ARG // 3611
A=M // 3612
D=M // 3613
@SP // 3614
AM=M-1 // 3615
D=D+M // 3616
@SP // 3617
AM=M+1 // 3618
A=A-1 // 3619
M=D // 3620
D=0 // 3621
@SP // 3622
AM=M-1 // 3623
A=M // 3624
M=D // 3625

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 3626
0;JMP // 3627

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 3628
A=M // 3629
D=M // 3630
@SP // 3631
AM=M+1 // 3632
A=A-1 // 3633
M=D // 3634

////ReturnInstruction{}
@RETURN // 3635
0;JMP // 3636

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3637
D=A // 3638
@SP // 3639
AM=D+M // 3640
A=A-1 // 3641
M=0 // 3642
A=A-1 // 3643
M=0 // 3644
A=A-1 // 3645
M=0 // 3646

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

@ARG // 3647
A=M // 3648
D=M // 3649
@4 // 3650
D=D-A // 3651
@LCL // 3652
A=M // 3653
M=D // 3654

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3655
A=M // 3656
D=M // 3657
@SP // 3658
AM=M+1 // 3659
A=A-1 // 3660
M=D+1 // 3661
D=1 // 3662
@SP // 3663
AM=M-1 // 3664
A=M // 3665
M=D // 3666

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

@LCL // 3667
A=M // 3668
D=M // 3669
@2 // 3670
A=D+A // 3671
D=M // 3672
@LCL // 3673
A=M+1 // 3674
M=D // 3675

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

@LCL // 3676
A=M // 3677
D=M // 3678
@3 // 3679
A=D+A // 3680
D=M // 3681
@LCL // 3682
A=M+1 // 3683
A=A+1 // 3684
M=D // 3685

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
@Memory.deAlloc.EQ.6 // 3686
D=A // 3687
@SP // 3688
AM=M+1 // 3689
A=A-1 // 3690
M=D // 3691
@Memory.deAlloc.EQ.7 // 3692
D=A // 3693
@SP // 3694
AM=M+1 // 3695
A=A-1 // 3696
M=D // 3697
@LCL // 3698
A=M+1 // 3699
D=M // 3700
@DO_EQ // 3701
0;JMP // 3702
(Memory.deAlloc.EQ.7)
D=!D // 3703
@DO_EQ // 3704
0;JMP // 3705
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse1 // 3706
D;JNE // 3707

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
@Memory.deAlloc.EQ.8 // 3708
D=A // 3709
@SP // 3710
AM=M+1 // 3711
A=A-1 // 3712
M=D // 3713
@LCL // 3714
A=M+1 // 3715
D=M // 3716
A=D+1 // 3717
D=M // 3718
D=D-1 // 3719
@DO_EQ // 3720
0;JMP // 3721
(Memory.deAlloc.EQ.8)
D=!D // 3722
@Memory.deAlloc.IfElse2 // 3723
D;JNE // 3724

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

@LCL // 3725
A=M+1 // 3726
D=M // 3727
@0 // 3728
A=D+A // 3729
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
@Memory.deAlloc.ret.0 // 3743
D=A // 3744
@CALL // 3745
0;JMP // 3746
(Memory.deAlloc.ret.0)
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
D=M // 3758
@SP // 3759
AM=M+1 // 3760
A=A-1 // 3761
M=D // 3762
// call Memory.remove_node
@7 // 3763
D=A // 3764
@14 // 3765
M=D // 3766
@Memory.remove_node // 3767
D=A // 3768
@13 // 3769
M=D // 3770
@Memory.deAlloc.ret.1 // 3771
D=A // 3772
@CALL // 3773
0;JMP // 3774
(Memory.deAlloc.ret.1)
@SP // 3775
M=M-1 // 3776

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
@LCL // 3777
A=M+1 // 3778
D=M // 3779
@SP // 3780
AM=M+1 // 3781
A=A-1 // 3782
M=D // 3783
@LCL // 3784
A=M+1 // 3785
D=M // 3786
@0 // 3787
A=D+A // 3788
D=M // 3789
@SP // 3790
AM=M+1 // 3791
A=A-1 // 3792
M=D // 3793
@LCL // 3794
A=M // 3795
D=M // 3796
@0 // 3797
A=D+A // 3798
D=M // 3799
@SP // 3800
AM=M-1 // 3801
D=D+M // 3802
@5 // 3803
D=D+A // 3804
@SP // 3805
AM=M-1 // 3806
A=M // 3807
M=D // 3808

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3809
A=M+1 // 3810
D=M // 3811
@SP // 3812
AM=M+1 // 3813
A=A-1 // 3814
M=D // 3815
// call Memory.create_foot
@6 // 3816
D=A // 3817
@14 // 3818
M=D // 3819
@Memory.create_foot // 3820
D=A // 3821
@13 // 3822
M=D // 3823
@Memory.deAlloc.ret.2 // 3824
D=A // 3825
@CALL // 3826
0;JMP // 3827
(Memory.deAlloc.ret.2)
@SP // 3828
M=M-1 // 3829

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3830
A=M+1 // 3831
D=M // 3832
@LCL // 3833
A=M // 3834
M=D // 3835

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 3836
0;JMP // 3837

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 3838
0;JMP // 3839

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
@Memory.deAlloc.EQ.9 // 3840
D=A // 3841
@SP // 3842
AM=M+1 // 3843
A=A-1 // 3844
M=D // 3845
@Memory.deAlloc.EQ.10 // 3846
D=A // 3847
@SP // 3848
AM=M+1 // 3849
A=A-1 // 3850
M=D // 3851
@LCL // 3852
A=M+1 // 3853
A=A+1 // 3854
D=M // 3855
@DO_EQ // 3856
0;JMP // 3857
(Memory.deAlloc.EQ.10)
D=!D // 3858
@DO_EQ // 3859
0;JMP // 3860
(Memory.deAlloc.EQ.9)
@Memory.deAlloc.IfElse3 // 3861
D;JNE // 3862

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
@Memory.deAlloc.EQ.11 // 3863
D=A // 3864
@SP // 3865
AM=M+1 // 3866
A=A-1 // 3867
M=D // 3868
@LCL // 3869
A=M+1 // 3870
A=A+1 // 3871
D=M // 3872
A=D+1 // 3873
D=M // 3874
D=D-1 // 3875
@DO_EQ // 3876
0;JMP // 3877
(Memory.deAlloc.EQ.11)
D=!D // 3878
@Memory.deAlloc.IfElse4 // 3879
D;JNE // 3880

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

@LCL // 3881
A=M+1 // 3882
A=A+1 // 3883
D=M // 3884
@0 // 3885
A=D+A // 3886
D=M // 3887
@SP // 3888
AM=M+1 // 3889
A=A-1 // 3890
M=D // 3891
// call Memory.getBinIndex
@6 // 3892
D=A // 3893
@14 // 3894
M=D // 3895
@Memory.getBinIndex // 3896
D=A // 3897
@13 // 3898
M=D // 3899
@Memory.deAlloc.ret.3 // 3900
D=A // 3901
@CALL // 3902
0;JMP // 3903
(Memory.deAlloc.ret.3)
@SP // 3904
AM=M-1 // 3905
D=M // 3906
@2048 // 3907
D=D+A // 3908
@SP // 3909
AM=M+1 // 3910
A=A-1 // 3911
M=D // 3912
@LCL // 3913
A=M+1 // 3914
A=A+1 // 3915
D=M // 3916
@SP // 3917
AM=M+1 // 3918
A=A-1 // 3919
M=D // 3920
// call Memory.remove_node
@7 // 3921
D=A // 3922
@14 // 3923
M=D // 3924
@Memory.remove_node // 3925
D=A // 3926
@13 // 3927
M=D // 3928
@Memory.deAlloc.ret.4 // 3929
D=A // 3930
@CALL // 3931
0;JMP // 3932
(Memory.deAlloc.ret.4)
@SP // 3933
M=M-1 // 3934

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
@LCL // 3935
A=M // 3936
D=M // 3937
@SP // 3938
AM=M+1 // 3939
A=A-1 // 3940
M=D // 3941
@LCL // 3942
A=M // 3943
D=M // 3944
@0 // 3945
A=D+A // 3946
D=M // 3947
@SP // 3948
AM=M+1 // 3949
A=A-1 // 3950
M=D // 3951
@LCL // 3952
A=M+1 // 3953
A=A+1 // 3954
D=M // 3955
@0 // 3956
A=D+A // 3957
D=M // 3958
@SP // 3959
AM=M-1 // 3960
D=D+M // 3961
@5 // 3962
D=D+A // 3963
@SP // 3964
AM=M-1 // 3965
A=M // 3966
M=D // 3967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3968
A=M // 3969
D=M // 3970
@SP // 3971
AM=M+1 // 3972
A=A-1 // 3973
M=D // 3974
// call Memory.create_foot
@6 // 3975
D=A // 3976
@14 // 3977
M=D // 3978
@Memory.create_foot // 3979
D=A // 3980
@13 // 3981
M=D // 3982
@Memory.deAlloc.ret.5 // 3983
D=A // 3984
@CALL // 3985
0;JMP // 3986
(Memory.deAlloc.ret.5)
@SP // 3987
M=M-1 // 3988

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 3989
0;JMP // 3990

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 3991
0;JMP // 3992

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

@LCL // 3993
A=M // 3994
D=M // 3995
@0 // 3996
A=D+A // 3997
D=M // 3998
@SP // 3999
AM=M+1 // 4000
A=A-1 // 4001
M=D // 4002
// call Memory.getBinIndex
@6 // 4003
D=A // 4004
@14 // 4005
M=D // 4006
@Memory.getBinIndex // 4007
D=A // 4008
@13 // 4009
M=D // 4010
@Memory.deAlloc.ret.6 // 4011
D=A // 4012
@CALL // 4013
0;JMP // 4014
(Memory.deAlloc.ret.6)
@SP // 4015
AM=M-1 // 4016
D=M // 4017
@2048 // 4018
D=D+A // 4019
@SP // 4020
AM=M+1 // 4021
A=A-1 // 4022
M=D // 4023
@LCL // 4024
A=M // 4025
D=M // 4026
@SP // 4027
AM=M+1 // 4028
A=A-1 // 4029
M=D // 4030
// call Memory.add_node
@7 // 4031
D=A // 4032
@14 // 4033
M=D // 4034
@Memory.add_node // 4035
D=A // 4036
@13 // 4037
M=D // 4038
@Memory.deAlloc.ret.7 // 4039
D=A // 4040
@CALL // 4041
0;JMP // 4042
(Memory.deAlloc.ret.7)
@SP // 4043
M=M-1 // 4044

////PushInstruction("constant 0")
@SP // 4045
AM=M+1 // 4046
A=A-1 // 4047
M=0 // 4048

////ReturnInstruction{}
@RETURN // 4049
0;JMP // 4050

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 4051
D=A // 4052
@SP // 4053
AM=D+M // 4054
A=A-1 // 4055
M=0 // 4056
A=A-1 // 4057
M=0 // 4058
A=A-1 // 4059
M=0 // 4060
A=A-1 // 4061
M=0 // 4062

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
@Memory.realloc.EQ.12 // 4063
D=A // 4064
@SP // 4065
AM=M+1 // 4066
A=A-1 // 4067
M=D // 4068
@ARG // 4069
A=M // 4070
D=M // 4071
@DO_EQ // 4072
0;JMP // 4073
(Memory.realloc.EQ.12)
@Memory.realloc.IfElse1 // 4074
D;JEQ // 4075

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 4076
A=M+1 // 4077
D=M // 4078
@SP // 4079
AM=M+1 // 4080
A=A-1 // 4081
M=D // 4082
// call Memory.alloc
@6 // 4083
D=A // 4084
@14 // 4085
M=D // 4086
@Memory.alloc // 4087
D=A // 4088
@13 // 4089
M=D // 4090
@Memory.realloc.ret.0 // 4091
D=A // 4092
@CALL // 4093
0;JMP // 4094
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 4095
0;JMP // 4096

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 4097
0;JMP // 4098

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

@ARG // 4099
A=M // 4100
D=M // 4101
D=D-1 // 4102
@LCL // 4103
A=M+1 // 4104
A=A+1 // 4105
A=A+1 // 4106
M=D // 4107

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

@LCL // 4108
A=M+1 // 4109
A=A+1 // 4110
A=A+1 // 4111
D=M // 4112
@0 // 4113
A=D+A // 4114
D=M // 4115
@LCL // 4116
A=M // 4117
M=D // 4118

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 4119
A=M+1 // 4120
D=M // 4121
@SP // 4122
AM=M+1 // 4123
A=A-1 // 4124
M=D // 4125
// call Memory.alloc
@6 // 4126
D=A // 4127
@14 // 4128
M=D // 4129
@Memory.alloc // 4130
D=A // 4131
@13 // 4132
M=D // 4133
@Memory.realloc.ret.1 // 4134
D=A // 4135
@CALL // 4136
0;JMP // 4137
(Memory.realloc.ret.1)
@SP // 4138
AM=M-1 // 4139
D=M // 4140
@LCL // 4141
A=M+1 // 4142
M=D // 4143

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
@Memory.realloc.EQ.13 // 4144
D=A // 4145
@SP // 4146
AM=M+1 // 4147
A=A-1 // 4148
M=D // 4149
@LCL // 4150
A=M+1 // 4151
D=M // 4152
@DO_EQ // 4153
0;JMP // 4154
(Memory.realloc.EQ.13)
@Memory.realloc.IfElse2 // 4155
D;JEQ // 4156

////PushInstruction("constant 0")
@SP // 4157
AM=M+1 // 4158
A=A-1 // 4159
M=0 // 4160

////ReturnInstruction{}
@RETURN // 4161
0;JMP // 4162

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 4163
0;JMP // 4164

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
@Memory.realloc.EQ.14 // 4165
D=A // 4166
@SP // 4167
AM=M+1 // 4168
A=A-1 // 4169
M=D // 4170
@Memory.realloc.GT.15 // 4171
D=A // 4172
@SP // 4173
AM=M+1 // 4174
A=A-1 // 4175
M=D // 4176
@LCL // 4177
A=M // 4178
D=M // 4179
@SP // 4180
AM=M+1 // 4181
A=A-1 // 4182
M=D // 4183
@ARG // 4184
A=M+1 // 4185
D=M // 4186
@SP // 4187
AM=M-1 // 4188
D=M-D // 4189
@DO_GT // 4190
0;JMP // 4191
(Memory.realloc.GT.15)
D=!D // 4192
@DO_EQ // 4193
0;JMP // 4194
(Memory.realloc.EQ.14)
@Memory.realloc.IfElse3 // 4195
D;JNE // 4196

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4197
A=M // 4198
D=M // 4199
@LCL // 4200
A=M+1 // 4201
A=A+1 // 4202
M=D // 4203

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 4204
0;JMP // 4205

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 4206
A=M+1 // 4207
D=M // 4208
@LCL // 4209
A=M+1 // 4210
A=A+1 // 4211
M=D // 4212

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4213
A=M // 4214
D=M // 4215
@SP // 4216
AM=M+1 // 4217
A=A-1 // 4218
M=D // 4219
@LCL // 4220
A=M+1 // 4221
D=M // 4222
@SP // 4223
AM=M+1 // 4224
A=A-1 // 4225
M=D // 4226
@LCL // 4227
A=M+1 // 4228
A=A+1 // 4229
D=M // 4230
@SP // 4231
AM=M+1 // 4232
A=A-1 // 4233
M=D // 4234
// call Memory.copy
@8 // 4235
D=A // 4236
@14 // 4237
M=D // 4238
@Memory.copy // 4239
D=A // 4240
@13 // 4241
M=D // 4242
@Memory.realloc.ret.2 // 4243
D=A // 4244
@CALL // 4245
0;JMP // 4246
(Memory.realloc.ret.2)
@SP // 4247
M=M-1 // 4248

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4249
A=M // 4250
D=M // 4251
@SP // 4252
AM=M+1 // 4253
A=A-1 // 4254
M=D // 4255
// call Memory.deAlloc
@6 // 4256
D=A // 4257
@14 // 4258
M=D // 4259
@Memory.deAlloc // 4260
D=A // 4261
@13 // 4262
M=D // 4263
@Memory.realloc.ret.3 // 4264
D=A // 4265
@CALL // 4266
0;JMP // 4267
(Memory.realloc.ret.3)
@SP // 4268
M=M-1 // 4269

////PushInstruction("local 1")
@LCL // 4270
A=M+1 // 4271
D=M // 4272
@SP // 4273
AM=M+1 // 4274
A=A-1 // 4275
M=D // 4276

////ReturnInstruction{}
@RETURN // 4277
0;JMP // 4278

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 4279
AM=M+1 // 4280
A=A-1 // 4281
M=0 // 4282

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4283
A=M // 4284
M=0 // 4285

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
@Memory.copy.LT.16 // 4286
D=A // 4287
@SP // 4288
AM=M+1 // 4289
A=A-1 // 4290
M=D // 4291
@LCL // 4292
A=M // 4293
D=M // 4294
@SP // 4295
AM=M+1 // 4296
A=A-1 // 4297
M=D // 4298
@ARG // 4299
A=M+1 // 4300
A=A+1 // 4301
D=M // 4302
@SP // 4303
AM=M-1 // 4304
D=M-D // 4305
@DO_LT // 4306
0;JMP // 4307
(Memory.copy.LT.16)
D=!D // 4308
@WHILE_END_Memory.copy1 // 4309
D;JNE // 4310

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
@ARG // 4311
A=M+1 // 4312
D=M // 4313
@SP // 4314
AM=M+1 // 4315
A=A-1 // 4316
M=D // 4317
@LCL // 4318
A=M // 4319
D=M // 4320
@SP // 4321
AM=M-1 // 4322
D=D+M // 4323
@SP // 4324
AM=M+1 // 4325
A=A-1 // 4326
M=D // 4327
@ARG // 4328
A=M // 4329
D=M // 4330
@SP // 4331
AM=M+1 // 4332
A=A-1 // 4333
M=D // 4334
@LCL // 4335
A=M // 4336
D=M // 4337
@SP // 4338
AM=M-1 // 4339
A=D+M // 4340
D=M // 4341
@SP // 4342
AM=M-1 // 4343
A=M // 4344
M=D // 4345

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

@LCL // 4346
A=M // 4347
D=M // 4348
D=D+1 // 4349
@LCL // 4350
A=M // 4351
M=D // 4352

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 4353
0;JMP // 4354

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 4355
AM=M+1 // 4356
A=A-1 // 4357
M=0 // 4358

////ReturnInstruction{}
@RETURN // 4359
0;JMP // 4360

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
@Memory.remove_node.EQ.17 // 4361
D=A // 4362
@SP // 4363
AM=M+1 // 4364
A=A-1 // 4365
M=D // 4366
@Memory.remove_node.EQ.18 // 4367
D=A // 4368
@SP // 4369
AM=M+1 // 4370
A=A-1 // 4371
M=D // 4372
@ARG // 4373
A=M+1 // 4374
D=M // 4375
@2 // 4376
A=D+A // 4377
D=M // 4378
@DO_EQ // 4379
0;JMP // 4380
(Memory.remove_node.EQ.18)
D=!D // 4381
@DO_EQ // 4382
0;JMP // 4383
(Memory.remove_node.EQ.17)
@Memory.remove_node.IfElse1 // 4384
D;JNE // 4385

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
@ARG // 4386
A=M+1 // 4387
D=M // 4388
@2 // 4389
D=D+A // 4390
@3 // 4391
D=D+A // 4392
@SP // 4393
AM=M+1 // 4394
A=A-1 // 4395
M=D // 4396
@ARG // 4397
A=M+1 // 4398
D=M // 4399
@3 // 4400
A=D+A // 4401
D=M // 4402
@SP // 4403
AM=M-1 // 4404
A=M // 4405
M=D // 4406

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 4407
0;JMP // 4408

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
@ARG // 4409
A=M // 4410
D=M // 4411
@SP // 4412
AM=M+1 // 4413
A=A-1 // 4414
M=D // 4415
@ARG // 4416
A=M+1 // 4417
D=M // 4418
@3 // 4419
A=D+A // 4420
D=M // 4421
@SP // 4422
AM=M-1 // 4423
A=M // 4424
M=D // 4425

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
@Memory.remove_node.EQ.19 // 4426
D=A // 4427
@SP // 4428
AM=M+1 // 4429
A=A-1 // 4430
M=D // 4431
@Memory.remove_node.EQ.20 // 4432
D=A // 4433
@SP // 4434
AM=M+1 // 4435
A=A-1 // 4436
M=D // 4437
@ARG // 4438
A=M+1 // 4439
D=M // 4440
@3 // 4441
A=D+A // 4442
D=M // 4443
@DO_EQ // 4444
0;JMP // 4445
(Memory.remove_node.EQ.20)
D=!D // 4446
@DO_EQ // 4447
0;JMP // 4448
(Memory.remove_node.EQ.19)
@Memory.remove_node.IfElse2 // 4449
D;JNE // 4450

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
@ARG // 4451
A=M+1 // 4452
D=M // 4453
@3 // 4454
D=D+A // 4455
@2 // 4456
D=D+A // 4457
@SP // 4458
AM=M+1 // 4459
A=A-1 // 4460
M=D // 4461
@ARG // 4462
A=M+1 // 4463
D=M // 4464
@2 // 4465
A=D+A // 4466
D=M // 4467
@SP // 4468
AM=M-1 // 4469
A=M // 4470
M=D // 4471

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 4472
0;JMP // 4473

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
@ARG // 4474
A=M+1 // 4475
D=M // 4476
@2 // 4477
D=D+A // 4478
@SP // 4479
AM=M+1 // 4480
A=A-1 // 4481
M=D // 4482
D=0 // 4483
@SP // 4484
AM=M-1 // 4485
A=M // 4486
M=D // 4487

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4488
A=M+1 // 4489
D=M // 4490
@3 // 4491
D=D+A // 4492
@SP // 4493
AM=M+1 // 4494
A=A-1 // 4495
M=D // 4496
D=0 // 4497
@SP // 4498
AM=M-1 // 4499
A=M // 4500
M=D // 4501

////PushInstruction("constant 0")
@SP // 4502
AM=M+1 // 4503
A=A-1 // 4504
M=0 // 4505

////ReturnInstruction{}
@RETURN // 4506
0;JMP // 4507

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=0 // 4511

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4512
A=M // 4513
M=0 // 4514

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
@Memory.getBinIndex.EQ.21 // 4515
D=A // 4516
@SP // 4517
AM=M+1 // 4518
A=A-1 // 4519
M=D // 4520
@Memory.getBinIndex.LT.22 // 4521
D=A // 4522
@SP // 4523
AM=M+1 // 4524
A=A-1 // 4525
M=D // 4526
@LCL // 4527
A=M // 4528
D=M // 4529
@7 // 4530
D=D-A // 4531
@DO_LT // 4532
0;JMP // 4533
(Memory.getBinIndex.LT.22)
@SP // 4534
AM=M+1 // 4535
A=A-1 // 4536
M=D // 4537
@Memory.getBinIndex.EQ.23 // 4538
D=A // 4539
@SP // 4540
AM=M+1 // 4541
A=A-1 // 4542
M=D // 4543
@LCL // 4544
A=M // 4545
D=M // 4546
@2048 // 4547
A=D+A // 4548
D=M // 4549
@DO_EQ // 4550
0;JMP // 4551
(Memory.getBinIndex.EQ.23)
D=!D // 4552
@SP // 4553
AM=M-1 // 4554
D=D&M // 4555
@DO_EQ // 4556
0;JMP // 4557
(Memory.getBinIndex.EQ.21)
@WHILE_END_Memory.getBinIndex1 // 4558
D;JNE // 4559

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
@Memory.getBinIndex.EQ.24 // 4560
D=A // 4561
@SP // 4562
AM=M+1 // 4563
A=A-1 // 4564
M=D // 4565
@Memory.getBinIndex.GT.25 // 4566
D=A // 4567
@SP // 4568
AM=M+1 // 4569
A=A-1 // 4570
M=D // 4571
@ARG // 4572
A=M // 4573
D=M // 4574
@SP // 4575
AM=M+1 // 4576
A=A-1 // 4577
M=D // 4578
@LCL // 4579
A=M // 4580
D=M // 4581
@SP // 4582
AM=M+1 // 4583
A=A-1 // 4584
M=D+1 // 4585
@16 // 4586
D=A // 4587
@SP // 4588
AM=M+1 // 4589
A=A-1 // 4590
M=D // 4591
// call Math.multiply
@7 // 4592
D=A // 4593
@14 // 4594
M=D // 4595
@Math.multiply // 4596
D=A // 4597
@13 // 4598
M=D // 4599
@Memory.getBinIndex.ret.0 // 4600
D=A // 4601
@CALL // 4602
0;JMP // 4603
(Memory.getBinIndex.ret.0)
@SP // 4604
AM=M-1 // 4605
D=M // 4606
@SP // 4607
AM=M-1 // 4608
D=M-D // 4609
@DO_GT // 4610
0;JMP // 4611
(Memory.getBinIndex.GT.25)
D=!D // 4612
@DO_EQ // 4613
0;JMP // 4614
(Memory.getBinIndex.EQ.24)
@Memory.getBinIndex.IfElse1 // 4615
D;JNE // 4616

////PushInstruction("local 0")
@LCL // 4617
A=M // 4618
D=M // 4619
@SP // 4620
AM=M+1 // 4621
A=A-1 // 4622
M=D // 4623

////ReturnInstruction{}
@RETURN // 4624
0;JMP // 4625

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 4626
0;JMP // 4627

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

@LCL // 4628
A=M // 4629
D=M // 4630
D=D+1 // 4631
@LCL // 4632
A=M // 4633
M=D // 4634

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 4635
0;JMP // 4636

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
@6 // 4637
D=A // 4638
@SP // 4639
AM=M+1 // 4640
A=A-1 // 4641
M=D // 4642
@7 // 4643
D=A // 4644
@SP // 4645
AM=M+1 // 4646
A=A-1 // 4647
M=D-1 // 4648

////ReturnInstruction{}
@RETURN // 4649
0;JMP // 4650

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 4651
AM=M+1 // 4652
A=A-1 // 4653
M=0 // 4654

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

@ARG // 4655
A=M // 4656
D=M // 4657
@0 // 4658
A=D+A // 4659
D=M // 4660
@LCL // 4661
A=M // 4662
M=D // 4663

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
@Memory.get_best_fit.EQ.26 // 4664
D=A // 4665
@SP // 4666
AM=M+1 // 4667
A=A-1 // 4668
M=D // 4669
@Memory.get_best_fit.LT.27 // 4670
D=A // 4671
@SP // 4672
AM=M+1 // 4673
A=A-1 // 4674
M=D // 4675
@LCL // 4676
A=M // 4677
D=M // 4678
@0 // 4679
A=D+A // 4680
D=M // 4681
@SP // 4682
AM=M+1 // 4683
A=A-1 // 4684
M=D // 4685
@ARG // 4686
A=M+1 // 4687
D=M // 4688
@SP // 4689
AM=M-1 // 4690
D=M-D // 4691
@DO_LT // 4692
0;JMP // 4693
(Memory.get_best_fit.LT.27)
D=!D // 4694
@DO_EQ // 4695
0;JMP // 4696
(Memory.get_best_fit.EQ.26)
@Memory.get_best_fit.IfElse1 // 4697
D;JNE // 4698

////PushInstruction("local 0")
@LCL // 4699
A=M // 4700
D=M // 4701
@SP // 4702
AM=M+1 // 4703
A=A-1 // 4704
M=D // 4705

////ReturnInstruction{}
@RETURN // 4706
0;JMP // 4707

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 4708
0;JMP // 4709

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
@Memory.get_best_fit.EQ.28 // 4710
D=A // 4711
@SP // 4712
AM=M+1 // 4713
A=A-1 // 4714
M=D // 4715
@Memory.get_best_fit.EQ.29 // 4716
D=A // 4717
@SP // 4718
AM=M+1 // 4719
A=A-1 // 4720
M=D // 4721
@LCL // 4722
A=M // 4723
D=M // 4724
@3 // 4725
A=D+A // 4726
D=M // 4727
@DO_EQ // 4728
0;JMP // 4729
(Memory.get_best_fit.EQ.29)
D=!D // 4730
@DO_EQ // 4731
0;JMP // 4732
(Memory.get_best_fit.EQ.28)
@WHILE_END_Memory.get_best_fit1 // 4733
D;JNE // 4734

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

@LCL // 4735
A=M // 4736
D=M // 4737
@3 // 4738
A=D+A // 4739
D=M // 4740
@LCL // 4741
A=M // 4742
M=D // 4743

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
@Memory.get_best_fit.EQ.30 // 4744
D=A // 4745
@SP // 4746
AM=M+1 // 4747
A=A-1 // 4748
M=D // 4749
@Memory.get_best_fit.LT.31 // 4750
D=A // 4751
@SP // 4752
AM=M+1 // 4753
A=A-1 // 4754
M=D // 4755
@LCL // 4756
A=M // 4757
D=M // 4758
@0 // 4759
A=D+A // 4760
D=M // 4761
@SP // 4762
AM=M+1 // 4763
A=A-1 // 4764
M=D // 4765
@ARG // 4766
A=M+1 // 4767
D=M // 4768
@SP // 4769
AM=M-1 // 4770
D=M-D // 4771
@DO_LT // 4772
0;JMP // 4773
(Memory.get_best_fit.LT.31)
D=!D // 4774
@DO_EQ // 4775
0;JMP // 4776
(Memory.get_best_fit.EQ.30)
@Memory.get_best_fit.IfElse2 // 4777
D;JNE // 4778

////PushInstruction("local 0")
@LCL // 4779
A=M // 4780
D=M // 4781
@SP // 4782
AM=M+1 // 4783
A=A-1 // 4784
M=D // 4785

////ReturnInstruction{}
@RETURN // 4786
0;JMP // 4787

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 4788
0;JMP // 4789

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 4790
0;JMP // 4791

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=0 // 4795

////ReturnInstruction{}
@RETURN // 4796
0;JMP // 4797

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
@ARG // 4798
A=M // 4799
D=M // 4800
@SP // 4801
AM=M+1 // 4802
A=A-1 // 4803
M=D // 4804
@ARG // 4805
A=M // 4806
D=M // 4807
@0 // 4808
A=D+A // 4809
D=M // 4810
@4 // 4811
D=D+A // 4812
@SP // 4813
AM=M-1 // 4814
D=D+M // 4815
@SP // 4816
AM=M+1 // 4817
A=A-1 // 4818
M=D // 4819
@ARG // 4820
A=M // 4821
D=M // 4822
@SP // 4823
AM=M-1 // 4824
A=M // 4825
M=D // 4826

////PushInstruction("constant 0")
@SP // 4827
AM=M+1 // 4828
A=A-1 // 4829
M=0 // 4830

////ReturnInstruction{}
@RETURN // 4831
0;JMP // 4832

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 4833
M=M+1 // 4834
AM=M+1 // 4835
A=A-1 // 4836
M=0 // 4837
A=A-1 // 4838
M=0 // 4839

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4840
A=M+1 // 4841
D=M // 4842
@2 // 4843
D=D+A // 4844
@SP // 4845
AM=M+1 // 4846
A=A-1 // 4847
M=D // 4848
D=0 // 4849
@SP // 4850
AM=M-1 // 4851
A=M // 4852
M=D // 4853

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4854
A=M+1 // 4855
D=M // 4856
@3 // 4857
D=D+A // 4858
@SP // 4859
AM=M+1 // 4860
A=A-1 // 4861
M=D // 4862
D=0 // 4863
@SP // 4864
AM=M-1 // 4865
A=M // 4866
M=D // 4867

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
@Memory.add_node.EQ.32 // 4868
D=A // 4869
@SP // 4870
AM=M+1 // 4871
A=A-1 // 4872
M=D // 4873
@ARG // 4874
A=M // 4875
D=M // 4876
@0 // 4877
A=D+A // 4878
D=M // 4879
@DO_EQ // 4880
0;JMP // 4881
(Memory.add_node.EQ.32)
@Memory.add_node.IfElse1 // 4882
D;JEQ // 4883

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4884
A=M // 4885
D=M // 4886
@SP // 4887
AM=M+1 // 4888
A=A-1 // 4889
M=D // 4890
@ARG // 4891
A=M+1 // 4892
D=M // 4893
@SP // 4894
AM=M-1 // 4895
A=M // 4896
M=D // 4897

////PushInstruction("constant 0")
@SP // 4898
AM=M+1 // 4899
A=A-1 // 4900
M=0 // 4901

////ReturnInstruction{}
@RETURN // 4902
0;JMP // 4903

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 4904
0;JMP // 4905

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

@ARG // 4906
A=M // 4907
D=M // 4908
@0 // 4909
A=D+A // 4910
D=M // 4911
@LCL // 4912
A=M // 4913
M=D // 4914

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4915
A=M+1 // 4916
M=0 // 4917

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
@Memory.add_node.EQ.33 // 4918
D=A // 4919
@SP // 4920
AM=M+1 // 4921
A=A-1 // 4922
M=D // 4923
@Memory.add_node.EQ.34 // 4924
D=A // 4925
@SP // 4926
AM=M+1 // 4927
A=A-1 // 4928
M=D // 4929
@LCL // 4930
A=M // 4931
D=M // 4932
@DO_EQ // 4933
0;JMP // 4934
(Memory.add_node.EQ.34)
@SP // 4935
AM=M+1 // 4936
A=A-1 // 4937
M=D // 4938
@SP // 4939
A=M-1 // 4940
M=!D // 4941
@Memory.add_node.GT.35 // 4942
D=A // 4943
@SP // 4944
AM=M+1 // 4945
A=A-1 // 4946
M=D // 4947
@LCL // 4948
A=M // 4949
D=M // 4950
@0 // 4951
A=D+A // 4952
D=M // 4953
@SP // 4954
AM=M+1 // 4955
A=A-1 // 4956
M=D // 4957
@ARG // 4958
A=M+1 // 4959
D=M // 4960
@0 // 4961
A=D+A // 4962
D=M // 4963
@SP // 4964
AM=M-1 // 4965
D=M-D // 4966
@DO_GT // 4967
0;JMP // 4968
(Memory.add_node.GT.35)
D=!D // 4969
@SP // 4970
AM=M-1 // 4971
D=D&M // 4972
@DO_EQ // 4973
0;JMP // 4974
(Memory.add_node.EQ.33)
@WHILE_END_Memory.add_node1 // 4975
D;JNE // 4976

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4977
A=M // 4978
D=M // 4979
@LCL // 4980
A=M+1 // 4981
M=D // 4982

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

@LCL // 4983
A=M // 4984
D=M // 4985
@3 // 4986
A=D+A // 4987
D=M // 4988
@LCL // 4989
A=M // 4990
M=D // 4991

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 4992
0;JMP // 4993

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
@Memory.add_node.EQ.36 // 4994
D=A // 4995
@SP // 4996
AM=M+1 // 4997
A=A-1 // 4998
M=D // 4999
@LCL // 5000
A=M+1 // 5001
D=!M // 5002
@DO_EQ // 5003
0;JMP // 5004
(Memory.add_node.EQ.36)
@Memory.add_node.IfElse2 // 5005
D;JNE // 5006

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
@ARG // 5007
A=M+1 // 5008
D=M // 5009
@3 // 5010
D=D+A // 5011
@SP // 5012
AM=M+1 // 5013
A=A-1 // 5014
M=D // 5015
@ARG // 5016
A=M // 5017
D=M // 5018
@0 // 5019
A=D+A // 5020
D=M // 5021
@SP // 5022
AM=M-1 // 5023
A=M // 5024
M=D // 5025

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
@ARG // 5026
A=M // 5027
D=M // 5028
@0 // 5029
D=D+A // 5030
@2 // 5031
D=D+A // 5032
@SP // 5033
AM=M+1 // 5034
A=A-1 // 5035
M=D // 5036
@ARG // 5037
A=M+1 // 5038
D=M // 5039
@SP // 5040
AM=M-1 // 5041
A=M // 5042
M=D // 5043

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 5044
A=M // 5045
D=M // 5046
@SP // 5047
AM=M+1 // 5048
A=A-1 // 5049
M=D // 5050
@ARG // 5051
A=M+1 // 5052
D=M // 5053
@SP // 5054
AM=M-1 // 5055
A=M // 5056
M=D // 5057

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 5058
0;JMP // 5059

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
@ARG // 5060
A=M+1 // 5061
D=M // 5062
@3 // 5063
D=D+A // 5064
@SP // 5065
AM=M+1 // 5066
A=A-1 // 5067
M=D // 5068
@LCL // 5069
A=M // 5070
D=M // 5071
@SP // 5072
AM=M-1 // 5073
A=M // 5074
M=D // 5075

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 5076
A=M+1 // 5077
D=M // 5078
@2 // 5079
D=D+A // 5080
@SP // 5081
AM=M+1 // 5082
A=A-1 // 5083
M=D // 5084
@LCL // 5085
A=M+1 // 5086
D=M // 5087
@SP // 5088
AM=M-1 // 5089
A=M // 5090
M=D // 5091

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.37 // 5092
D=A // 5093
@SP // 5094
AM=M+1 // 5095
A=A-1 // 5096
M=D // 5097
@LCL // 5098
A=M // 5099
D=M // 5100
@DO_EQ // 5101
0;JMP // 5102
(Memory.add_node.EQ.37)
@Memory.add_node.IfElse3 // 5103
D;JNE // 5104

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 5105
A=M // 5106
D=M // 5107
@2 // 5108
D=D+A // 5109
@SP // 5110
AM=M+1 // 5111
A=A-1 // 5112
M=D // 5113
@ARG // 5114
A=M+1 // 5115
D=M // 5116
@SP // 5117
AM=M-1 // 5118
A=M // 5119
M=D // 5120

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 5121
0;JMP // 5122

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
@LCL // 5123
A=M+1 // 5124
D=M // 5125
@3 // 5126
D=D+A // 5127
@SP // 5128
AM=M+1 // 5129
A=A-1 // 5130
M=D // 5131
@ARG // 5132
A=M+1 // 5133
D=M // 5134
@SP // 5135
AM=M-1 // 5136
A=M // 5137
M=D // 5138

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 5139
AM=M+1 // 5140
A=A-1 // 5141
M=0 // 5142

////ReturnInstruction{}
@RETURN // 5143
0;JMP // 5144

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
@ARG // 5145
A=M // 5146
D=M // 5147
@SP // 5148
AM=M+1 // 5149
A=A-1 // 5150
M=D // 5151
@ARG // 5152
A=M+1 // 5153
D=M // 5154
@SP // 5155
AM=M-1 // 5156
A=M // 5157
M=D // 5158

////PushInstruction("constant 0")
@SP // 5159
AM=M+1 // 5160
A=A-1 // 5161
M=0 // 5162

////ReturnInstruction{}
@RETURN // 5163
0;JMP // 5164

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
@ARG // 5165
A=M // 5166
D=M // 5167
@0 // 5168
A=D+A // 5169
D=M // 5170
@SP // 5171
AM=M+1 // 5172
A=A-1 // 5173
M=D // 5174

////ReturnInstruction{}
@RETURN // 5175
0;JMP // 5176

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 5177
D=A // 5178
@14 // 5179
M=D // 5180
@Output.initMap // 5181
D=A // 5182
@13 // 5183
M=D // 5184
@Output.init.ret.0 // 5185
D=A // 5186
@CALL // 5187
0;JMP // 5188
(Output.init.ret.0)
@SP // 5189
M=M-1 // 5190

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 5191
M=0 // 5192

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 5193
M=0 // 5194

////PushInstruction("constant 0")
@SP // 5195
AM=M+1 // 5196
A=A-1 // 5197
M=0 // 5198

////ReturnInstruction{}
@RETURN // 5199
0;JMP // 5200

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 5201
AM=M+1 // 5202
A=A-1 // 5203
M=0 // 5204

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5205
D=A // 5206
@SP // 5207
AM=M+1 // 5208
A=A-1 // 5209
M=D // 5210
// call Array.new
@6 // 5211
D=A // 5212
@14 // 5213
M=D // 5214
@Array.new // 5215
D=A // 5216
@13 // 5217
M=D // 5218
@Output.initMap.ret.0 // 5219
D=A // 5220
@CALL // 5221
0;JMP // 5222
(Output.initMap.ret.0)
@SP // 5223
AM=M-1 // 5224
D=M // 5225
@Output.0 // 5226
M=D // 5227

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5228
D=A // 5229
@SP // 5230
M=D+M // 5231
@63 // 5232
D=A // 5233
@SP // 5234
A=M-1 // 5235
M=0 // 5236
A=A-1 // 5237
M=0 // 5238
A=A-1 // 5239
M=D // 5240
A=A-1 // 5241
M=D // 5242
A=A-1 // 5243
M=D // 5244
A=A-1 // 5245
M=D // 5246
A=A-1 // 5247
M=D // 5248
A=A-1 // 5249
M=D // 5250
A=A-1 // 5251
M=D // 5252
A=A-1 // 5253
M=D // 5254
A=A-1 // 5255
M=D // 5256
M=0 // 5257
// call Output.create
@17 // 5258
D=A // 5259
@14 // 5260
M=D // 5261
@Output.create // 5262
D=A // 5263
@13 // 5264
M=D // 5265
@Output.initMap.ret.1 // 5266
D=A // 5267
@CALL // 5268
0;JMP // 5269
(Output.initMap.ret.1)
@SP // 5270
M=M-1 // 5271

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5272
D=A // 5273
@SP // 5274
M=D+M // 5275
@32 // 5276
D=A // 5277
@SP // 5278
A=M-1 // 5279
M=0 // 5280
A=A-1 // 5281
M=0 // 5282
A=A-1 // 5283
M=0 // 5284
A=A-1 // 5285
M=0 // 5286
A=A-1 // 5287
M=0 // 5288
A=A-1 // 5289
M=0 // 5290
A=A-1 // 5291
M=0 // 5292
A=A-1 // 5293
M=0 // 5294
A=A-1 // 5295
M=0 // 5296
A=A-1 // 5297
M=0 // 5298
A=A-1 // 5299
M=0 // 5300
A=A-1 // 5301
M=D // 5302
// call Output.create
@17 // 5303
D=A // 5304
@14 // 5305
M=D // 5306
@Output.create // 5307
D=A // 5308
@13 // 5309
M=D // 5310
@Output.initMap.ret.2 // 5311
D=A // 5312
@CALL // 5313
0;JMP // 5314
(Output.initMap.ret.2)
@SP // 5315
M=M-1 // 5316

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5317
D=A // 5318
@SP // 5319
AM=M+1 // 5320
A=A-1 // 5321
M=D // 5322
@12 // 5323
D=A // 5324
@SP // 5325
AM=M+1 // 5326
A=A-1 // 5327
M=D // 5328
@30 // 5329
D=A // 5330
@SP // 5331
AM=M+1 // 5332
A=A-1 // 5333
M=D // 5334
@30 // 5335
D=A // 5336
@SP // 5337
AM=M+1 // 5338
A=A-1 // 5339
M=D // 5340
@30 // 5341
D=A // 5342
@SP // 5343
AM=M+1 // 5344
A=A-1 // 5345
M=D // 5346
@12 // 5347
D=A // 5348
@SP // 5349
AM=M+1 // 5350
A=A-1 // 5351
M=D // 5352
@12 // 5353
D=A // 5354
@SP // 5355
AM=M+1 // 5356
A=A-1 // 5357
M=D // 5358
@SP // 5359
AM=M+1 // 5360
A=A-1 // 5361
M=0 // 5362
@4 // 5363
D=A // 5364
@SP // 5365
M=D+M // 5366
@12 // 5367
D=A // 5368
@SP // 5369
A=M-1 // 5370
M=0 // 5371
A=A-1 // 5372
M=0 // 5373
A=A-1 // 5374
M=D // 5375
A=A-1 // 5376
M=D // 5377
// call Output.create
@17 // 5378
D=A // 5379
@14 // 5380
M=D // 5381
@Output.create // 5382
D=A // 5383
@13 // 5384
M=D // 5385
@Output.initMap.ret.3 // 5386
D=A // 5387
@CALL // 5388
0;JMP // 5389
(Output.initMap.ret.3)
@SP // 5390
M=M-1 // 5391

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5392
D=A // 5393
@SP // 5394
AM=M+1 // 5395
A=A-1 // 5396
M=D // 5397
@54 // 5398
D=A // 5399
@SP // 5400
AM=M+1 // 5401
A=A-1 // 5402
M=D // 5403
@54 // 5404
D=A // 5405
@SP // 5406
AM=M+1 // 5407
A=A-1 // 5408
M=D // 5409
@20 // 5410
D=A // 5411
@SP // 5412
AM=M+1 // 5413
A=A-1 // 5414
M=D // 5415
@SP // 5416
AM=M+1 // 5417
A=A-1 // 5418
M=0 // 5419
@SP // 5420
AM=M+1 // 5421
A=A-1 // 5422
M=0 // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=0 // 5427
@SP // 5428
AM=M+1 // 5429
A=A-1 // 5430
M=0 // 5431
@SP // 5432
AM=M+1 // 5433
A=A-1 // 5434
M=0 // 5435
@SP // 5436
AM=M+1 // 5437
A=A-1 // 5438
M=0 // 5439
@SP // 5440
AM=M+1 // 5441
A=A-1 // 5442
M=0 // 5443
@SP // 5444
AM=M+1 // 5445
A=A-1 // 5446
M=0 // 5447
// call Output.create
@17 // 5448
D=A // 5449
@14 // 5450
M=D // 5451
@Output.create // 5452
D=A // 5453
@13 // 5454
M=D // 5455
@Output.initMap.ret.4 // 5456
D=A // 5457
@CALL // 5458
0;JMP // 5459
(Output.initMap.ret.4)
@SP // 5460
M=M-1 // 5461

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5462
D=A // 5463
@SP // 5464
M=D+M // 5465
@35 // 5466
D=A // 5467
@SP // 5468
A=M-1 // 5469
M=0 // 5470
A=A-1 // 5471
M=D // 5472
@18 // 5473
D=A // 5474
@SP // 5475
AM=M+1 // 5476
A=A-1 // 5477
M=D // 5478
@18 // 5479
D=A // 5480
@SP // 5481
AM=M+1 // 5482
A=A-1 // 5483
M=D // 5484
@63 // 5485
D=A // 5486
@SP // 5487
AM=M+1 // 5488
A=A-1 // 5489
M=D // 5490
@18 // 5491
D=A // 5492
@SP // 5493
AM=M+1 // 5494
A=A-1 // 5495
M=D // 5496
@18 // 5497
D=A // 5498
@SP // 5499
AM=M+1 // 5500
A=A-1 // 5501
M=D // 5502
@63 // 5503
D=A // 5504
@SP // 5505
AM=M+1 // 5506
A=A-1 // 5507
M=D // 5508
@18 // 5509
D=A // 5510
@SP // 5511
AM=M+1 // 5512
A=A-1 // 5513
M=D // 5514
@18 // 5515
D=A // 5516
@SP // 5517
AM=M+1 // 5518
A=A-1 // 5519
M=D // 5520
@SP // 5521
AM=M+1 // 5522
A=A-1 // 5523
M=0 // 5524
@SP // 5525
AM=M+1 // 5526
A=A-1 // 5527
M=0 // 5528
// call Output.create
@17 // 5529
D=A // 5530
@14 // 5531
M=D // 5532
@Output.create // 5533
D=A // 5534
@13 // 5535
M=D // 5536
@Output.initMap.ret.5 // 5537
D=A // 5538
@CALL // 5539
0;JMP // 5540
(Output.initMap.ret.5)
@SP // 5541
M=M-1 // 5542

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 5543
D=A // 5544
@SP // 5545
AM=M+1 // 5546
A=A-1 // 5547
M=D // 5548
@12 // 5549
D=A // 5550
@SP // 5551
AM=M+1 // 5552
A=A-1 // 5553
M=D // 5554
@30 // 5555
D=A // 5556
@SP // 5557
AM=M+1 // 5558
A=A-1 // 5559
M=D // 5560
@51 // 5561
D=A // 5562
@SP // 5563
AM=M+1 // 5564
A=A-1 // 5565
M=D // 5566
@3 // 5567
D=A // 5568
@SP // 5569
AM=M+1 // 5570
A=A-1 // 5571
M=D // 5572
@30 // 5573
D=A // 5574
@SP // 5575
AM=M+1 // 5576
A=A-1 // 5577
M=D // 5578
@48 // 5579
D=A // 5580
@SP // 5581
AM=M+1 // 5582
A=A-1 // 5583
M=D // 5584
@51 // 5585
D=A // 5586
@SP // 5587
AM=M+1 // 5588
A=A-1 // 5589
M=D // 5590
@30 // 5591
D=A // 5592
@SP // 5593
AM=M+1 // 5594
A=A-1 // 5595
M=D // 5596
@12 // 5597
D=A // 5598
@SP // 5599
AM=M+1 // 5600
A=A-1 // 5601
M=D // 5602
@12 // 5603
D=A // 5604
@SP // 5605
AM=M+1 // 5606
A=A-1 // 5607
M=D // 5608
@SP // 5609
AM=M+1 // 5610
A=A-1 // 5611
M=0 // 5612
// call Output.create
@17 // 5613
D=A // 5614
@14 // 5615
M=D // 5616
@Output.create // 5617
D=A // 5618
@13 // 5619
M=D // 5620
@Output.initMap.ret.6 // 5621
D=A // 5622
@CALL // 5623
0;JMP // 5624
(Output.initMap.ret.6)
@SP // 5625
M=M-1 // 5626

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5627
D=A // 5628
@SP // 5629
M=D+M // 5630
@37 // 5631
D=A // 5632
@SP // 5633
A=M-1 // 5634
M=0 // 5635
A=A-1 // 5636
M=0 // 5637
A=A-1 // 5638
M=D // 5639
@35 // 5640
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
@24 // 5652
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
@6 // 5664
D=A // 5665
@SP // 5666
AM=M+1 // 5667
A=A-1 // 5668
M=D // 5669
@51 // 5670
D=A // 5671
@SP // 5672
AM=M+1 // 5673
A=A-1 // 5674
M=D // 5675
@49 // 5676
D=A // 5677
@SP // 5678
AM=M+1 // 5679
A=A-1 // 5680
M=D // 5681
@SP // 5682
AM=M+1 // 5683
A=A-1 // 5684
M=0 // 5685
@SP // 5686
AM=M+1 // 5687
A=A-1 // 5688
M=0 // 5689
// call Output.create
@17 // 5690
D=A // 5691
@14 // 5692
M=D // 5693
@Output.create // 5694
D=A // 5695
@13 // 5696
M=D // 5697
@Output.initMap.ret.7 // 5698
D=A // 5699
@CALL // 5700
0;JMP // 5701
(Output.initMap.ret.7)
@SP // 5702
M=M-1 // 5703

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 5704
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
@30 // 5716
D=A // 5717
@SP // 5718
AM=M+1 // 5719
A=A-1 // 5720
M=D // 5721
@30 // 5722
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
@54 // 5734
D=A // 5735
@SP // 5736
AM=M+1 // 5737
A=A-1 // 5738
M=D // 5739
@27 // 5740
D=A // 5741
@SP // 5742
AM=M+1 // 5743
A=A-1 // 5744
M=D // 5745
@27 // 5746
D=A // 5747
@SP // 5748
AM=M+1 // 5749
A=A-1 // 5750
M=D // 5751
@27 // 5752
D=A // 5753
@SP // 5754
AM=M+1 // 5755
A=A-1 // 5756
M=D // 5757
@54 // 5758
D=A // 5759
@SP // 5760
AM=M+1 // 5761
A=A-1 // 5762
M=D // 5763
@SP // 5764
AM=M+1 // 5765
A=A-1 // 5766
M=0 // 5767
@SP // 5768
AM=M+1 // 5769
A=A-1 // 5770
M=0 // 5771
// call Output.create
@17 // 5772
D=A // 5773
@14 // 5774
M=D // 5775
@Output.create // 5776
D=A // 5777
@13 // 5778
M=D // 5779
@Output.initMap.ret.8 // 5780
D=A // 5781
@CALL // 5782
0;JMP // 5783
(Output.initMap.ret.8)
@SP // 5784
M=M-1 // 5785

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 5786
D=A // 5787
@SP // 5788
AM=M+1 // 5789
A=A-1 // 5790
M=D // 5791
@12 // 5792
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
@SP // 5810
AM=M+1 // 5811
A=A-1 // 5812
M=0 // 5813
@SP // 5814
AM=M+1 // 5815
A=A-1 // 5816
M=0 // 5817
@SP // 5818
AM=M+1 // 5819
A=A-1 // 5820
M=0 // 5821
@SP // 5822
AM=M+1 // 5823
A=A-1 // 5824
M=0 // 5825
@SP // 5826
AM=M+1 // 5827
A=A-1 // 5828
M=0 // 5829
@SP // 5830
AM=M+1 // 5831
A=A-1 // 5832
M=0 // 5833
@SP // 5834
AM=M+1 // 5835
A=A-1 // 5836
M=0 // 5837
@SP // 5838
AM=M+1 // 5839
A=A-1 // 5840
M=0 // 5841
// call Output.create
@17 // 5842
D=A // 5843
@14 // 5844
M=D // 5845
@Output.create // 5846
D=A // 5847
@13 // 5848
M=D // 5849
@Output.initMap.ret.9 // 5850
D=A // 5851
@CALL // 5852
0;JMP // 5853
(Output.initMap.ret.9)
@SP // 5854
M=M-1 // 5855

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5856
D=A // 5857
@SP // 5858
AM=M+1 // 5859
A=A-1 // 5860
M=D // 5861
@24 // 5862
D=A // 5863
@SP // 5864
AM=M+1 // 5865
A=A-1 // 5866
M=D // 5867
@12 // 5868
D=A // 5869
@SP // 5870
AM=M+1 // 5871
A=A-1 // 5872
M=D // 5873
@6 // 5874
D=A // 5875
@SP // 5876
AM=M+1 // 5877
A=A-1 // 5878
M=D // 5879
@6 // 5880
D=A // 5881
@SP // 5882
AM=M+1 // 5883
A=A-1 // 5884
M=D // 5885
@6 // 5886
D=A // 5887
@SP // 5888
AM=M+1 // 5889
A=A-1 // 5890
M=D // 5891
@6 // 5892
D=A // 5893
@SP // 5894
AM=M+1 // 5895
A=A-1 // 5896
M=D // 5897
@6 // 5898
D=A // 5899
@SP // 5900
AM=M+1 // 5901
A=A-1 // 5902
M=D // 5903
@12 // 5904
D=A // 5905
@SP // 5906
AM=M+1 // 5907
A=A-1 // 5908
M=D // 5909
@24 // 5910
D=A // 5911
@SP // 5912
AM=M+1 // 5913
A=A-1 // 5914
M=D // 5915
@SP // 5916
AM=M+1 // 5917
A=A-1 // 5918
M=0 // 5919
@SP // 5920
AM=M+1 // 5921
A=A-1 // 5922
M=0 // 5923
// call Output.create
@17 // 5924
D=A // 5925
@14 // 5926
M=D // 5927
@Output.create // 5928
D=A // 5929
@13 // 5930
M=D // 5931
@Output.initMap.ret.10 // 5932
D=A // 5933
@CALL // 5934
0;JMP // 5935
(Output.initMap.ret.10)
@SP // 5936
M=M-1 // 5937

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 5938
D=A // 5939
@SP // 5940
AM=M+1 // 5941
A=A-1 // 5942
M=D // 5943
@6 // 5944
D=A // 5945
@SP // 5946
AM=M+1 // 5947
A=A-1 // 5948
M=D // 5949
@12 // 5950
D=A // 5951
@SP // 5952
AM=M+1 // 5953
A=A-1 // 5954
M=D // 5955
@24 // 5956
D=A // 5957
@SP // 5958
AM=M+1 // 5959
A=A-1 // 5960
M=D // 5961
@24 // 5962
D=A // 5963
@SP // 5964
AM=M+1 // 5965
A=A-1 // 5966
M=D // 5967
@24 // 5968
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
@12 // 5986
D=A // 5987
@SP // 5988
AM=M+1 // 5989
A=A-1 // 5990
M=D // 5991
@6 // 5992
D=A // 5993
@SP // 5994
AM=M+1 // 5995
A=A-1 // 5996
M=D // 5997
@SP // 5998
AM=M+1 // 5999
A=A-1 // 6000
M=0 // 6001
@SP // 6002
AM=M+1 // 6003
A=A-1 // 6004
M=0 // 6005
// call Output.create
@17 // 6006
D=A // 6007
@14 // 6008
M=D // 6009
@Output.create // 6010
D=A // 6011
@13 // 6012
M=D // 6013
@Output.initMap.ret.11 // 6014
D=A // 6015
@CALL // 6016
0;JMP // 6017
(Output.initMap.ret.11)
@SP // 6018
M=M-1 // 6019

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6020
D=A // 6021
@SP // 6022
M=D+M // 6023
@42 // 6024
D=A // 6025
@SP // 6026
A=M-1 // 6027
M=0 // 6028
A=A-1 // 6029
M=0 // 6030
A=A-1 // 6031
M=0 // 6032
A=A-1 // 6033
M=D // 6034
@51 // 6035
D=A // 6036
@SP // 6037
AM=M+1 // 6038
A=A-1 // 6039
M=D // 6040
@30 // 6041
D=A // 6042
@SP // 6043
AM=M+1 // 6044
A=A-1 // 6045
M=D // 6046
@63 // 6047
D=A // 6048
@SP // 6049
AM=M+1 // 6050
A=A-1 // 6051
M=D // 6052
@30 // 6053
D=A // 6054
@SP // 6055
AM=M+1 // 6056
A=A-1 // 6057
M=D // 6058
@51 // 6059
D=A // 6060
@SP // 6061
AM=M+1 // 6062
A=A-1 // 6063
M=D // 6064
@SP // 6065
AM=M+1 // 6066
A=A-1 // 6067
M=0 // 6068
@SP // 6069
AM=M+1 // 6070
A=A-1 // 6071
M=0 // 6072
@SP // 6073
AM=M+1 // 6074
A=A-1 // 6075
M=0 // 6076
// call Output.create
@17 // 6077
D=A // 6078
@14 // 6079
M=D // 6080
@Output.create // 6081
D=A // 6082
@13 // 6083
M=D // 6084
@Output.initMap.ret.12 // 6085
D=A // 6086
@CALL // 6087
0;JMP // 6088
(Output.initMap.ret.12)
@SP // 6089
M=M-1 // 6090

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6091
D=A // 6092
@SP // 6093
M=D+M // 6094
@43 // 6095
D=A // 6096
@SP // 6097
A=M-1 // 6098
M=0 // 6099
A=A-1 // 6100
M=0 // 6101
A=A-1 // 6102
M=0 // 6103
A=A-1 // 6104
M=D // 6105
@12 // 6106
D=A // 6107
@SP // 6108
AM=M+1 // 6109
A=A-1 // 6110
M=D // 6111
@12 // 6112
D=A // 6113
@SP // 6114
AM=M+1 // 6115
A=A-1 // 6116
M=D // 6117
@63 // 6118
D=A // 6119
@SP // 6120
AM=M+1 // 6121
A=A-1 // 6122
M=D // 6123
@12 // 6124
D=A // 6125
@SP // 6126
AM=M+1 // 6127
A=A-1 // 6128
M=D // 6129
@12 // 6130
D=A // 6131
@SP // 6132
AM=M+1 // 6133
A=A-1 // 6134
M=D // 6135
@SP // 6136
AM=M+1 // 6137
A=A-1 // 6138
M=0 // 6139
@SP // 6140
AM=M+1 // 6141
A=A-1 // 6142
M=0 // 6143
@SP // 6144
AM=M+1 // 6145
A=A-1 // 6146
M=0 // 6147
// call Output.create
@17 // 6148
D=A // 6149
@14 // 6150
M=D // 6151
@Output.create // 6152
D=A // 6153
@13 // 6154
M=D // 6155
@Output.initMap.ret.13 // 6156
D=A // 6157
@CALL // 6158
0;JMP // 6159
(Output.initMap.ret.13)
@SP // 6160
M=M-1 // 6161

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6162
D=A // 6163
@SP // 6164
M=D+M // 6165
@44 // 6166
D=A // 6167
@SP // 6168
A=M-1 // 6169
M=0 // 6170
A=A-1 // 6171
M=0 // 6172
A=A-1 // 6173
M=0 // 6174
A=A-1 // 6175
M=0 // 6176
A=A-1 // 6177
M=0 // 6178
A=A-1 // 6179
M=0 // 6180
A=A-1 // 6181
M=0 // 6182
A=A-1 // 6183
M=D // 6184
@12 // 6185
D=A // 6186
@SP // 6187
AM=M+1 // 6188
A=A-1 // 6189
M=D // 6190
@12 // 6191
D=A // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=D // 6196
@6 // 6197
D=A // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=D // 6202
@SP // 6203
AM=M+1 // 6204
A=A-1 // 6205
M=0 // 6206
// call Output.create
@17 // 6207
D=A // 6208
@14 // 6209
M=D // 6210
@Output.create // 6211
D=A // 6212
@13 // 6213
M=D // 6214
@Output.initMap.ret.14 // 6215
D=A // 6216
@CALL // 6217
0;JMP // 6218
(Output.initMap.ret.14)
@SP // 6219
M=M-1 // 6220

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6221
D=A // 6222
@SP // 6223
M=D+M // 6224
@45 // 6225
D=A // 6226
@SP // 6227
A=M-1 // 6228
M=0 // 6229
A=A-1 // 6230
M=0 // 6231
A=A-1 // 6232
M=0 // 6233
A=A-1 // 6234
M=0 // 6235
A=A-1 // 6236
M=0 // 6237
A=A-1 // 6238
M=D // 6239
@6 // 6240
D=A // 6241
@SP // 6242
M=D+M // 6243
@63 // 6244
D=A // 6245
@SP // 6246
A=M-1 // 6247
M=0 // 6248
A=A-1 // 6249
M=0 // 6250
A=A-1 // 6251
M=0 // 6252
A=A-1 // 6253
M=0 // 6254
A=A-1 // 6255
M=0 // 6256
A=A-1 // 6257
M=D // 6258
// call Output.create
@17 // 6259
D=A // 6260
@14 // 6261
M=D // 6262
@Output.create // 6263
D=A // 6264
@13 // 6265
M=D // 6266
@Output.initMap.ret.15 // 6267
D=A // 6268
@CALL // 6269
0;JMP // 6270
(Output.initMap.ret.15)
@SP // 6271
M=M-1 // 6272

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6273
D=A // 6274
@SP // 6275
M=D+M // 6276
@46 // 6277
D=A // 6278
@SP // 6279
A=M-1 // 6280
M=0 // 6281
A=A-1 // 6282
M=0 // 6283
A=A-1 // 6284
M=0 // 6285
A=A-1 // 6286
M=0 // 6287
A=A-1 // 6288
M=0 // 6289
A=A-1 // 6290
M=0 // 6291
A=A-1 // 6292
M=0 // 6293
A=A-1 // 6294
M=D // 6295
@4 // 6296
D=A // 6297
@SP // 6298
M=D+M // 6299
@12 // 6300
D=A // 6301
@SP // 6302
A=M-1 // 6303
M=0 // 6304
A=A-1 // 6305
M=0 // 6306
A=A-1 // 6307
M=D // 6308
A=A-1 // 6309
M=D // 6310
// call Output.create
@17 // 6311
D=A // 6312
@14 // 6313
M=D // 6314
@Output.create // 6315
D=A // 6316
@13 // 6317
M=D // 6318
@Output.initMap.ret.16 // 6319
D=A // 6320
@CALL // 6321
0;JMP // 6322
(Output.initMap.ret.16)
@SP // 6323
M=M-1 // 6324

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6325
D=A // 6326
@SP // 6327
M=D+M // 6328
@47 // 6329
D=A // 6330
@SP // 6331
A=M-1 // 6332
M=0 // 6333
A=A-1 // 6334
M=0 // 6335
A=A-1 // 6336
M=D // 6337
@32 // 6338
D=A // 6339
@SP // 6340
AM=M+1 // 6341
A=A-1 // 6342
M=D // 6343
@48 // 6344
D=A // 6345
@SP // 6346
AM=M+1 // 6347
A=A-1 // 6348
M=D // 6349
@24 // 6350
D=A // 6351
@SP // 6352
AM=M+1 // 6353
A=A-1 // 6354
M=D // 6355
@12 // 6356
D=A // 6357
@SP // 6358
AM=M+1 // 6359
A=A-1 // 6360
M=D // 6361
@6 // 6362
D=A // 6363
@SP // 6364
AM=M+1 // 6365
A=A-1 // 6366
M=D // 6367
@3 // 6368
D=A // 6369
@SP // 6370
AM=M+1 // 6371
A=A-1 // 6372
M=D // 6373
@SP // 6374
AM=M+1 // 6375
A=A-1 // 6376
M=1 // 6377
@SP // 6378
AM=M+1 // 6379
A=A-1 // 6380
M=0 // 6381
@SP // 6382
AM=M+1 // 6383
A=A-1 // 6384
M=0 // 6385
// call Output.create
@17 // 6386
D=A // 6387
@14 // 6388
M=D // 6389
@Output.create // 6390
D=A // 6391
@13 // 6392
M=D // 6393
@Output.initMap.ret.17 // 6394
D=A // 6395
@CALL // 6396
0;JMP // 6397
(Output.initMap.ret.17)
@SP // 6398
M=M-1 // 6399

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6400
D=A // 6401
@SP // 6402
AM=M+1 // 6403
A=A-1 // 6404
M=D // 6405
@12 // 6406
D=A // 6407
@SP // 6408
AM=M+1 // 6409
A=A-1 // 6410
M=D // 6411
@30 // 6412
D=A // 6413
@SP // 6414
AM=M+1 // 6415
A=A-1 // 6416
M=D // 6417
@51 // 6418
D=A // 6419
@SP // 6420
AM=M+1 // 6421
A=A-1 // 6422
M=D // 6423
@51 // 6424
D=A // 6425
@SP // 6426
AM=M+1 // 6427
A=A-1 // 6428
M=D // 6429
@51 // 6430
D=A // 6431
@SP // 6432
AM=M+1 // 6433
A=A-1 // 6434
M=D // 6435
@51 // 6436
D=A // 6437
@SP // 6438
AM=M+1 // 6439
A=A-1 // 6440
M=D // 6441
@51 // 6442
D=A // 6443
@SP // 6444
AM=M+1 // 6445
A=A-1 // 6446
M=D // 6447
@30 // 6448
D=A // 6449
@SP // 6450
AM=M+1 // 6451
A=A-1 // 6452
M=D // 6453
@12 // 6454
D=A // 6455
@SP // 6456
AM=M+1 // 6457
A=A-1 // 6458
M=D // 6459
@SP // 6460
AM=M+1 // 6461
A=A-1 // 6462
M=0 // 6463
@SP // 6464
AM=M+1 // 6465
A=A-1 // 6466
M=0 // 6467
// call Output.create
@17 // 6468
D=A // 6469
@14 // 6470
M=D // 6471
@Output.create // 6472
D=A // 6473
@13 // 6474
M=D // 6475
@Output.initMap.ret.18 // 6476
D=A // 6477
@CALL // 6478
0;JMP // 6479
(Output.initMap.ret.18)
@SP // 6480
M=M-1 // 6481

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 6482
D=A // 6483
@SP // 6484
AM=M+1 // 6485
A=A-1 // 6486
M=D // 6487
@12 // 6488
D=A // 6489
@SP // 6490
AM=M+1 // 6491
A=A-1 // 6492
M=D // 6493
@14 // 6494
D=A // 6495
@SP // 6496
AM=M+1 // 6497
A=A-1 // 6498
M=D // 6499
@15 // 6500
D=A // 6501
@SP // 6502
AM=M+1 // 6503
A=A-1 // 6504
M=D // 6505
@12 // 6506
D=A // 6507
@SP // 6508
AM=M+1 // 6509
A=A-1 // 6510
M=D // 6511
@12 // 6512
D=A // 6513
@SP // 6514
AM=M+1 // 6515
A=A-1 // 6516
M=D // 6517
@12 // 6518
D=A // 6519
@SP // 6520
AM=M+1 // 6521
A=A-1 // 6522
M=D // 6523
@12 // 6524
D=A // 6525
@SP // 6526
AM=M+1 // 6527
A=A-1 // 6528
M=D // 6529
@12 // 6530
D=A // 6531
@SP // 6532
AM=M+1 // 6533
A=A-1 // 6534
M=D // 6535
@63 // 6536
D=A // 6537
@SP // 6538
AM=M+1 // 6539
A=A-1 // 6540
M=D // 6541
@SP // 6542
AM=M+1 // 6543
A=A-1 // 6544
M=0 // 6545
@SP // 6546
AM=M+1 // 6547
A=A-1 // 6548
M=0 // 6549
// call Output.create
@17 // 6550
D=A // 6551
@14 // 6552
M=D // 6553
@Output.create // 6554
D=A // 6555
@13 // 6556
M=D // 6557
@Output.initMap.ret.19 // 6558
D=A // 6559
@CALL // 6560
0;JMP // 6561
(Output.initMap.ret.19)
@SP // 6562
M=M-1 // 6563

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 6564
D=A // 6565
@SP // 6566
AM=M+1 // 6567
A=A-1 // 6568
M=D // 6569
@30 // 6570
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
@48 // 6582
D=A // 6583
@SP // 6584
AM=M+1 // 6585
A=A-1 // 6586
M=D // 6587
@24 // 6588
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
@6 // 6600
D=A // 6601
@SP // 6602
AM=M+1 // 6603
A=A-1 // 6604
M=D // 6605
@3 // 6606
D=A // 6607
@SP // 6608
AM=M+1 // 6609
A=A-1 // 6610
M=D // 6611
@51 // 6612
D=A // 6613
@SP // 6614
AM=M+1 // 6615
A=A-1 // 6616
M=D // 6617
@63 // 6618
D=A // 6619
@SP // 6620
AM=M+1 // 6621
A=A-1 // 6622
M=D // 6623
@SP // 6624
AM=M+1 // 6625
A=A-1 // 6626
M=0 // 6627
@SP // 6628
AM=M+1 // 6629
A=A-1 // 6630
M=0 // 6631
// call Output.create
@17 // 6632
D=A // 6633
@14 // 6634
M=D // 6635
@Output.create // 6636
D=A // 6637
@13 // 6638
M=D // 6639
@Output.initMap.ret.20 // 6640
D=A // 6641
@CALL // 6642
0;JMP // 6643
(Output.initMap.ret.20)
@SP // 6644
M=M-1 // 6645

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 6646
D=A // 6647
@SP // 6648
AM=M+1 // 6649
A=A-1 // 6650
M=D // 6651
@30 // 6652
D=A // 6653
@SP // 6654
AM=M+1 // 6655
A=A-1 // 6656
M=D // 6657
@51 // 6658
D=A // 6659
@SP // 6660
AM=M+1 // 6661
A=A-1 // 6662
M=D // 6663
@48 // 6664
D=A // 6665
@SP // 6666
AM=M+1 // 6667
A=A-1 // 6668
M=D // 6669
@48 // 6670
D=A // 6671
@SP // 6672
AM=M+1 // 6673
A=A-1 // 6674
M=D // 6675
@28 // 6676
D=A // 6677
@SP // 6678
AM=M+1 // 6679
A=A-1 // 6680
M=D // 6681
@48 // 6682
D=A // 6683
@SP // 6684
AM=M+1 // 6685
A=A-1 // 6686
M=D // 6687
@48 // 6688
D=A // 6689
@SP // 6690
AM=M+1 // 6691
A=A-1 // 6692
M=D // 6693
@51 // 6694
D=A // 6695
@SP // 6696
AM=M+1 // 6697
A=A-1 // 6698
M=D // 6699
@30 // 6700
D=A // 6701
@SP // 6702
AM=M+1 // 6703
A=A-1 // 6704
M=D // 6705
@SP // 6706
AM=M+1 // 6707
A=A-1 // 6708
M=0 // 6709
@SP // 6710
AM=M+1 // 6711
A=A-1 // 6712
M=0 // 6713
// call Output.create
@17 // 6714
D=A // 6715
@14 // 6716
M=D // 6717
@Output.create // 6718
D=A // 6719
@13 // 6720
M=D // 6721
@Output.initMap.ret.21 // 6722
D=A // 6723
@CALL // 6724
0;JMP // 6725
(Output.initMap.ret.21)
@SP // 6726
M=M-1 // 6727

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 6728
D=A // 6729
@SP // 6730
AM=M+1 // 6731
A=A-1 // 6732
M=D // 6733
@16 // 6734
D=A // 6735
@SP // 6736
AM=M+1 // 6737
A=A-1 // 6738
M=D // 6739
@24 // 6740
D=A // 6741
@SP // 6742
AM=M+1 // 6743
A=A-1 // 6744
M=D // 6745
@28 // 6746
D=A // 6747
@SP // 6748
AM=M+1 // 6749
A=A-1 // 6750
M=D // 6751
@26 // 6752
D=A // 6753
@SP // 6754
AM=M+1 // 6755
A=A-1 // 6756
M=D // 6757
@25 // 6758
D=A // 6759
@SP // 6760
AM=M+1 // 6761
A=A-1 // 6762
M=D // 6763
@63 // 6764
D=A // 6765
@SP // 6766
AM=M+1 // 6767
A=A-1 // 6768
M=D // 6769
@24 // 6770
D=A // 6771
@SP // 6772
AM=M+1 // 6773
A=A-1 // 6774
M=D // 6775
@24 // 6776
D=A // 6777
@SP // 6778
AM=M+1 // 6779
A=A-1 // 6780
M=D // 6781
@60 // 6782
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
@Output.initMap.ret.22 // 6804
D=A // 6805
@CALL // 6806
0;JMP // 6807
(Output.initMap.ret.22)
@SP // 6808
M=M-1 // 6809

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 6810
D=A // 6811
@SP // 6812
AM=M+1 // 6813
A=A-1 // 6814
M=D // 6815
@63 // 6816
D=A // 6817
@SP // 6818
AM=M+1 // 6819
A=A-1 // 6820
M=D // 6821
@3 // 6822
D=A // 6823
@SP // 6824
AM=M+1 // 6825
A=A-1 // 6826
M=D // 6827
@3 // 6828
D=A // 6829
@SP // 6830
AM=M+1 // 6831
A=A-1 // 6832
M=D // 6833
@31 // 6834
D=A // 6835
@SP // 6836
AM=M+1 // 6837
A=A-1 // 6838
M=D // 6839
@48 // 6840
D=A // 6841
@SP // 6842
AM=M+1 // 6843
A=A-1 // 6844
M=D // 6845
@48 // 6846
D=A // 6847
@SP // 6848
AM=M+1 // 6849
A=A-1 // 6850
M=D // 6851
@48 // 6852
D=A // 6853
@SP // 6854
AM=M+1 // 6855
A=A-1 // 6856
M=D // 6857
@51 // 6858
D=A // 6859
@SP // 6860
AM=M+1 // 6861
A=A-1 // 6862
M=D // 6863
@30 // 6864
D=A // 6865
@SP // 6866
AM=M+1 // 6867
A=A-1 // 6868
M=D // 6869
@SP // 6870
AM=M+1 // 6871
A=A-1 // 6872
M=0 // 6873
@SP // 6874
AM=M+1 // 6875
A=A-1 // 6876
M=0 // 6877
// call Output.create
@17 // 6878
D=A // 6879
@14 // 6880
M=D // 6881
@Output.create // 6882
D=A // 6883
@13 // 6884
M=D // 6885
@Output.initMap.ret.23 // 6886
D=A // 6887
@CALL // 6888
0;JMP // 6889
(Output.initMap.ret.23)
@SP // 6890
M=M-1 // 6891

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 6892
D=A // 6893
@SP // 6894
AM=M+1 // 6895
A=A-1 // 6896
M=D // 6897
@28 // 6898
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
@3 // 6910
D=A // 6911
@SP // 6912
AM=M+1 // 6913
A=A-1 // 6914
M=D // 6915
@3 // 6916
D=A // 6917
@SP // 6918
AM=M+1 // 6919
A=A-1 // 6920
M=D // 6921
@31 // 6922
D=A // 6923
@SP // 6924
AM=M+1 // 6925
A=A-1 // 6926
M=D // 6927
@51 // 6928
D=A // 6929
@SP // 6930
AM=M+1 // 6931
A=A-1 // 6932
M=D // 6933
@51 // 6934
D=A // 6935
@SP // 6936
AM=M+1 // 6937
A=A-1 // 6938
M=D // 6939
@51 // 6940
D=A // 6941
@SP // 6942
AM=M+1 // 6943
A=A-1 // 6944
M=D // 6945
@30 // 6946
D=A // 6947
@SP // 6948
AM=M+1 // 6949
A=A-1 // 6950
M=D // 6951
@SP // 6952
AM=M+1 // 6953
A=A-1 // 6954
M=0 // 6955
@SP // 6956
AM=M+1 // 6957
A=A-1 // 6958
M=0 // 6959
// call Output.create
@17 // 6960
D=A // 6961
@14 // 6962
M=D // 6963
@Output.create // 6964
D=A // 6965
@13 // 6966
M=D // 6967
@Output.initMap.ret.24 // 6968
D=A // 6969
@CALL // 6970
0;JMP // 6971
(Output.initMap.ret.24)
@SP // 6972
M=M-1 // 6973

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 6974
D=A // 6975
@SP // 6976
AM=M+1 // 6977
A=A-1 // 6978
M=D // 6979
@63 // 6980
D=A // 6981
@SP // 6982
AM=M+1 // 6983
A=A-1 // 6984
M=D // 6985
@49 // 6986
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
@48 // 6998
D=A // 6999
@SP // 7000
AM=M+1 // 7001
A=A-1 // 7002
M=D // 7003
@24 // 7004
D=A // 7005
@SP // 7006
AM=M+1 // 7007
A=A-1 // 7008
M=D // 7009
@12 // 7010
D=A // 7011
@SP // 7012
AM=M+1 // 7013
A=A-1 // 7014
M=D // 7015
@12 // 7016
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
@12 // 7028
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
@Output.initMap.ret.25 // 7050
D=A // 7051
@CALL // 7052
0;JMP // 7053
(Output.initMap.ret.25)
@SP // 7054
M=M-1 // 7055

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7056
D=A // 7057
@SP // 7058
AM=M+1 // 7059
A=A-1 // 7060
M=D // 7061
@30 // 7062
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
@51 // 7092
D=A // 7093
@SP // 7094
AM=M+1 // 7095
A=A-1 // 7096
M=D // 7097
@51 // 7098
D=A // 7099
@SP // 7100
AM=M+1 // 7101
A=A-1 // 7102
M=D // 7103
@51 // 7104
D=A // 7105
@SP // 7106
AM=M+1 // 7107
A=A-1 // 7108
M=D // 7109
@30 // 7110
D=A // 7111
@SP // 7112
AM=M+1 // 7113
A=A-1 // 7114
M=D // 7115
@SP // 7116
AM=M+1 // 7117
A=A-1 // 7118
M=0 // 7119
@SP // 7120
AM=M+1 // 7121
A=A-1 // 7122
M=0 // 7123
// call Output.create
@17 // 7124
D=A // 7125
@14 // 7126
M=D // 7127
@Output.create // 7128
D=A // 7129
@13 // 7130
M=D // 7131
@Output.initMap.ret.26 // 7132
D=A // 7133
@CALL // 7134
0;JMP // 7135
(Output.initMap.ret.26)
@SP // 7136
M=M-1 // 7137

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7138
D=A // 7139
@SP // 7140
AM=M+1 // 7141
A=A-1 // 7142
M=D // 7143
@30 // 7144
D=A // 7145
@SP // 7146
AM=M+1 // 7147
A=A-1 // 7148
M=D // 7149
@51 // 7150
D=A // 7151
@SP // 7152
AM=M+1 // 7153
A=A-1 // 7154
M=D // 7155
@51 // 7156
D=A // 7157
@SP // 7158
AM=M+1 // 7159
A=A-1 // 7160
M=D // 7161
@51 // 7162
D=A // 7163
@SP // 7164
AM=M+1 // 7165
A=A-1 // 7166
M=D // 7167
@62 // 7168
D=A // 7169
@SP // 7170
AM=M+1 // 7171
A=A-1 // 7172
M=D // 7173
@48 // 7174
D=A // 7175
@SP // 7176
AM=M+1 // 7177
A=A-1 // 7178
M=D // 7179
@48 // 7180
D=A // 7181
@SP // 7182
AM=M+1 // 7183
A=A-1 // 7184
M=D // 7185
@24 // 7186
D=A // 7187
@SP // 7188
AM=M+1 // 7189
A=A-1 // 7190
M=D // 7191
@14 // 7192
D=A // 7193
@SP // 7194
AM=M+1 // 7195
A=A-1 // 7196
M=D // 7197
@SP // 7198
AM=M+1 // 7199
A=A-1 // 7200
M=0 // 7201
@SP // 7202
AM=M+1 // 7203
A=A-1 // 7204
M=0 // 7205
// call Output.create
@17 // 7206
D=A // 7207
@14 // 7208
M=D // 7209
@Output.create // 7210
D=A // 7211
@13 // 7212
M=D // 7213
@Output.initMap.ret.27 // 7214
D=A // 7215
@CALL // 7216
0;JMP // 7217
(Output.initMap.ret.27)
@SP // 7218
M=M-1 // 7219

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7220
D=A // 7221
@SP // 7222
M=D+M // 7223
@58 // 7224
D=A // 7225
@SP // 7226
A=M-1 // 7227
M=0 // 7228
A=A-1 // 7229
M=0 // 7230
A=A-1 // 7231
M=D // 7232
@4 // 7233
D=A // 7234
@SP // 7235
M=D+M // 7236
@12 // 7237
D=A // 7238
@SP // 7239
A=M-1 // 7240
M=0 // 7241
A=A-1 // 7242
M=0 // 7243
A=A-1 // 7244
M=D // 7245
A=A-1 // 7246
M=D // 7247
@5 // 7248
D=A // 7249
@SP // 7250
M=D+M // 7251
@12 // 7252
D=A // 7253
@SP // 7254
A=M-1 // 7255
M=0 // 7256
A=A-1 // 7257
M=0 // 7258
A=A-1 // 7259
M=0 // 7260
A=A-1 // 7261
M=D // 7262
A=A-1 // 7263
M=D // 7264
// call Output.create
@17 // 7265
D=A // 7266
@14 // 7267
M=D // 7268
@Output.create // 7269
D=A // 7270
@13 // 7271
M=D // 7272
@Output.initMap.ret.28 // 7273
D=A // 7274
@CALL // 7275
0;JMP // 7276
(Output.initMap.ret.28)
@SP // 7277
M=M-1 // 7278

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7279
D=A // 7280
@SP // 7281
M=D+M // 7282
@59 // 7283
D=A // 7284
@SP // 7285
A=M-1 // 7286
M=0 // 7287
A=A-1 // 7288
M=0 // 7289
A=A-1 // 7290
M=D // 7291
@4 // 7292
D=A // 7293
@SP // 7294
M=D+M // 7295
@12 // 7296
D=A // 7297
@SP // 7298
A=M-1 // 7299
M=0 // 7300
A=A-1 // 7301
M=0 // 7302
A=A-1 // 7303
M=D // 7304
A=A-1 // 7305
M=D // 7306
@12 // 7307
D=A // 7308
@SP // 7309
AM=M+1 // 7310
A=A-1 // 7311
M=D // 7312
@12 // 7313
D=A // 7314
@SP // 7315
AM=M+1 // 7316
A=A-1 // 7317
M=D // 7318
@6 // 7319
D=A // 7320
@SP // 7321
AM=M+1 // 7322
A=A-1 // 7323
M=D // 7324
@SP // 7325
AM=M+1 // 7326
A=A-1 // 7327
M=0 // 7328
@SP // 7329
AM=M+1 // 7330
A=A-1 // 7331
M=0 // 7332
// call Output.create
@17 // 7333
D=A // 7334
@14 // 7335
M=D // 7336
@Output.create // 7337
D=A // 7338
@13 // 7339
M=D // 7340
@Output.initMap.ret.29 // 7341
D=A // 7342
@CALL // 7343
0;JMP // 7344
(Output.initMap.ret.29)
@SP // 7345
M=M-1 // 7346

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7347
D=A // 7348
@SP // 7349
M=D+M // 7350
@60 // 7351
D=A // 7352
@SP // 7353
A=M-1 // 7354
M=0 // 7355
A=A-1 // 7356
M=0 // 7357
A=A-1 // 7358
M=D // 7359
@24 // 7360
D=A // 7361
@SP // 7362
AM=M+1 // 7363
A=A-1 // 7364
M=D // 7365
@12 // 7366
D=A // 7367
@SP // 7368
AM=M+1 // 7369
A=A-1 // 7370
M=D // 7371
@6 // 7372
D=A // 7373
@SP // 7374
AM=M+1 // 7375
A=A-1 // 7376
M=D // 7377
@3 // 7378
D=A // 7379
@SP // 7380
AM=M+1 // 7381
A=A-1 // 7382
M=D // 7383
@6 // 7384
D=A // 7385
@SP // 7386
AM=M+1 // 7387
A=A-1 // 7388
M=D // 7389
@12 // 7390
D=A // 7391
@SP // 7392
AM=M+1 // 7393
A=A-1 // 7394
M=D // 7395
@24 // 7396
D=A // 7397
@SP // 7398
AM=M+1 // 7399
A=A-1 // 7400
M=D // 7401
@SP // 7402
AM=M+1 // 7403
A=A-1 // 7404
M=0 // 7405
@SP // 7406
AM=M+1 // 7407
A=A-1 // 7408
M=0 // 7409
// call Output.create
@17 // 7410
D=A // 7411
@14 // 7412
M=D // 7413
@Output.create // 7414
D=A // 7415
@13 // 7416
M=D // 7417
@Output.initMap.ret.30 // 7418
D=A // 7419
@CALL // 7420
0;JMP // 7421
(Output.initMap.ret.30)
@SP // 7422
M=M-1 // 7423

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7424
D=A // 7425
@SP // 7426
M=D+M // 7427
@61 // 7428
D=A // 7429
@SP // 7430
A=M-1 // 7431
M=0 // 7432
A=A-1 // 7433
M=0 // 7434
A=A-1 // 7435
M=0 // 7436
A=A-1 // 7437
M=D // 7438
@3 // 7439
D=A // 7440
@SP // 7441
M=D+M // 7442
@63 // 7443
D=A // 7444
@SP // 7445
A=M-1 // 7446
M=0 // 7447
A=A-1 // 7448
M=0 // 7449
A=A-1 // 7450
M=D // 7451
@5 // 7452
D=A // 7453
@SP // 7454
M=D+M // 7455
@63 // 7456
D=A // 7457
@SP // 7458
A=M-1 // 7459
M=0 // 7460
A=A-1 // 7461
M=0 // 7462
A=A-1 // 7463
M=0 // 7464
A=A-1 // 7465
M=0 // 7466
A=A-1 // 7467
M=D // 7468
// call Output.create
@17 // 7469
D=A // 7470
@14 // 7471
M=D // 7472
@Output.create // 7473
D=A // 7474
@13 // 7475
M=D // 7476
@Output.initMap.ret.31 // 7477
D=A // 7478
@CALL // 7479
0;JMP // 7480
(Output.initMap.ret.31)
@SP // 7481
M=M-1 // 7482

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7483
D=A // 7484
@SP // 7485
M=D+M // 7486
@62 // 7487
D=A // 7488
@SP // 7489
A=M-1 // 7490
M=0 // 7491
A=A-1 // 7492
M=0 // 7493
A=A-1 // 7494
M=D // 7495
@3 // 7496
D=A // 7497
@SP // 7498
AM=M+1 // 7499
A=A-1 // 7500
M=D // 7501
@6 // 7502
D=A // 7503
@SP // 7504
AM=M+1 // 7505
A=A-1 // 7506
M=D // 7507
@12 // 7508
D=A // 7509
@SP // 7510
AM=M+1 // 7511
A=A-1 // 7512
M=D // 7513
@24 // 7514
D=A // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=D // 7519
@12 // 7520
D=A // 7521
@SP // 7522
AM=M+1 // 7523
A=A-1 // 7524
M=D // 7525
@6 // 7526
D=A // 7527
@SP // 7528
AM=M+1 // 7529
A=A-1 // 7530
M=D // 7531
@3 // 7532
D=A // 7533
@SP // 7534
AM=M+1 // 7535
A=A-1 // 7536
M=D // 7537
@SP // 7538
AM=M+1 // 7539
A=A-1 // 7540
M=0 // 7541
@SP // 7542
AM=M+1 // 7543
A=A-1 // 7544
M=0 // 7545
// call Output.create
@17 // 7546
D=A // 7547
@14 // 7548
M=D // 7549
@Output.create // 7550
D=A // 7551
@13 // 7552
M=D // 7553
@Output.initMap.ret.32 // 7554
D=A // 7555
@CALL // 7556
0;JMP // 7557
(Output.initMap.ret.32)
@SP // 7558
M=M-1 // 7559

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 7560
D=A // 7561
@SP // 7562
AM=M+1 // 7563
A=A-1 // 7564
M=D // 7565
@30 // 7566
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
@59 // 7584
D=A // 7585
@SP // 7586
AM=M+1 // 7587
A=A-1 // 7588
M=D // 7589
@59 // 7590
D=A // 7591
@SP // 7592
AM=M+1 // 7593
A=A-1 // 7594
M=D // 7595
@59 // 7596
D=A // 7597
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=D // 7601
@27 // 7602
D=A // 7603
@SP // 7604
AM=M+1 // 7605
A=A-1 // 7606
M=D // 7607
@3 // 7608
D=A // 7609
@SP // 7610
AM=M+1 // 7611
A=A-1 // 7612
M=D // 7613
@30 // 7614
D=A // 7615
@SP // 7616
AM=M+1 // 7617
A=A-1 // 7618
M=D // 7619
@SP // 7620
AM=M+1 // 7621
A=A-1 // 7622
M=0 // 7623
@SP // 7624
AM=M+1 // 7625
A=A-1 // 7626
M=0 // 7627
// call Output.create
@17 // 7628
D=A // 7629
@14 // 7630
M=D // 7631
@Output.create // 7632
D=A // 7633
@13 // 7634
M=D // 7635
@Output.initMap.ret.33 // 7636
D=A // 7637
@CALL // 7638
0;JMP // 7639
(Output.initMap.ret.33)
@SP // 7640
M=M-1 // 7641

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 7642
D=A // 7643
@SP // 7644
AM=M+1 // 7645
A=A-1 // 7646
M=D // 7647
@30 // 7648
D=A // 7649
@SP // 7650
AM=M+1 // 7651
A=A-1 // 7652
M=D // 7653
@51 // 7654
D=A // 7655
@SP // 7656
AM=M+1 // 7657
A=A-1 // 7658
M=D // 7659
@51 // 7660
D=A // 7661
@SP // 7662
AM=M+1 // 7663
A=A-1 // 7664
M=D // 7665
@24 // 7666
D=A // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=D // 7671
@12 // 7672
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
@SP // 7684
AM=M+1 // 7685
A=A-1 // 7686
M=0 // 7687
@4 // 7688
D=A // 7689
@SP // 7690
M=D+M // 7691
@12 // 7692
D=A // 7693
@SP // 7694
A=M-1 // 7695
M=0 // 7696
A=A-1 // 7697
M=0 // 7698
A=A-1 // 7699
M=D // 7700
A=A-1 // 7701
M=D // 7702
// call Output.create
@17 // 7703
D=A // 7704
@14 // 7705
M=D // 7706
@Output.create // 7707
D=A // 7708
@13 // 7709
M=D // 7710
@Output.initMap.ret.34 // 7711
D=A // 7712
@CALL // 7713
0;JMP // 7714
(Output.initMap.ret.34)
@SP // 7715
M=M-1 // 7716

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 7717
D=A // 7718
@SP // 7719
AM=M+1 // 7720
A=A-1 // 7721
M=D // 7722
@12 // 7723
D=A // 7724
@SP // 7725
AM=M+1 // 7726
A=A-1 // 7727
M=D // 7728
@30 // 7729
D=A // 7730
@SP // 7731
AM=M+1 // 7732
A=A-1 // 7733
M=D // 7734
@51 // 7735
D=A // 7736
@SP // 7737
AM=M+1 // 7738
A=A-1 // 7739
M=D // 7740
@51 // 7741
D=A // 7742
@SP // 7743
AM=M+1 // 7744
A=A-1 // 7745
M=D // 7746
@63 // 7747
D=A // 7748
@SP // 7749
AM=M+1 // 7750
A=A-1 // 7751
M=D // 7752
@51 // 7753
D=A // 7754
@SP // 7755
AM=M+1 // 7756
A=A-1 // 7757
M=D // 7758
@51 // 7759
D=A // 7760
@SP // 7761
AM=M+1 // 7762
A=A-1 // 7763
M=D // 7764
@51 // 7765
D=A // 7766
@SP // 7767
AM=M+1 // 7768
A=A-1 // 7769
M=D // 7770
@51 // 7771
D=A // 7772
@SP // 7773
AM=M+1 // 7774
A=A-1 // 7775
M=D // 7776
@SP // 7777
AM=M+1 // 7778
A=A-1 // 7779
M=0 // 7780
@SP // 7781
AM=M+1 // 7782
A=A-1 // 7783
M=0 // 7784
// call Output.create
@17 // 7785
D=A // 7786
@14 // 7787
M=D // 7788
@Output.create // 7789
D=A // 7790
@13 // 7791
M=D // 7792
@Output.initMap.ret.35 // 7793
D=A // 7794
@CALL // 7795
0;JMP // 7796
(Output.initMap.ret.35)
@SP // 7797
M=M-1 // 7798

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 7799
D=A // 7800
@SP // 7801
AM=M+1 // 7802
A=A-1 // 7803
M=D // 7804
@31 // 7805
D=A // 7806
@SP // 7807
AM=M+1 // 7808
A=A-1 // 7809
M=D // 7810
@51 // 7811
D=A // 7812
@SP // 7813
AM=M+1 // 7814
A=A-1 // 7815
M=D // 7816
@51 // 7817
D=A // 7818
@SP // 7819
AM=M+1 // 7820
A=A-1 // 7821
M=D // 7822
@51 // 7823
D=A // 7824
@SP // 7825
AM=M+1 // 7826
A=A-1 // 7827
M=D // 7828
@31 // 7829
D=A // 7830
@SP // 7831
AM=M+1 // 7832
A=A-1 // 7833
M=D // 7834
@51 // 7835
D=A // 7836
@SP // 7837
AM=M+1 // 7838
A=A-1 // 7839
M=D // 7840
@51 // 7841
D=A // 7842
@SP // 7843
AM=M+1 // 7844
A=A-1 // 7845
M=D // 7846
@51 // 7847
D=A // 7848
@SP // 7849
AM=M+1 // 7850
A=A-1 // 7851
M=D // 7852
@31 // 7853
D=A // 7854
@SP // 7855
AM=M+1 // 7856
A=A-1 // 7857
M=D // 7858
@SP // 7859
AM=M+1 // 7860
A=A-1 // 7861
M=0 // 7862
@SP // 7863
AM=M+1 // 7864
A=A-1 // 7865
M=0 // 7866
// call Output.create
@17 // 7867
D=A // 7868
@14 // 7869
M=D // 7870
@Output.create // 7871
D=A // 7872
@13 // 7873
M=D // 7874
@Output.initMap.ret.36 // 7875
D=A // 7876
@CALL // 7877
0;JMP // 7878
(Output.initMap.ret.36)
@SP // 7879
M=M-1 // 7880

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 7881
D=A // 7882
@SP // 7883
AM=M+1 // 7884
A=A-1 // 7885
M=D // 7886
@28 // 7887
D=A // 7888
@SP // 7889
AM=M+1 // 7890
A=A-1 // 7891
M=D // 7892
@54 // 7893
D=A // 7894
@SP // 7895
AM=M+1 // 7896
A=A-1 // 7897
M=D // 7898
@35 // 7899
D=A // 7900
@SP // 7901
AM=M+1 // 7902
A=A-1 // 7903
M=D // 7904
@3 // 7905
D=A // 7906
@SP // 7907
AM=M+1 // 7908
A=A-1 // 7909
M=D // 7910
@3 // 7911
D=A // 7912
@SP // 7913
AM=M+1 // 7914
A=A-1 // 7915
M=D // 7916
@3 // 7917
D=A // 7918
@SP // 7919
AM=M+1 // 7920
A=A-1 // 7921
M=D // 7922
@35 // 7923
D=A // 7924
@SP // 7925
AM=M+1 // 7926
A=A-1 // 7927
M=D // 7928
@54 // 7929
D=A // 7930
@SP // 7931
AM=M+1 // 7932
A=A-1 // 7933
M=D // 7934
@28 // 7935
D=A // 7936
@SP // 7937
AM=M+1 // 7938
A=A-1 // 7939
M=D // 7940
@SP // 7941
AM=M+1 // 7942
A=A-1 // 7943
M=0 // 7944
@SP // 7945
AM=M+1 // 7946
A=A-1 // 7947
M=0 // 7948
// call Output.create
@17 // 7949
D=A // 7950
@14 // 7951
M=D // 7952
@Output.create // 7953
D=A // 7954
@13 // 7955
M=D // 7956
@Output.initMap.ret.37 // 7957
D=A // 7958
@CALL // 7959
0;JMP // 7960
(Output.initMap.ret.37)
@SP // 7961
M=M-1 // 7962

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 7963
D=A // 7964
@SP // 7965
AM=M+1 // 7966
A=A-1 // 7967
M=D // 7968
@15 // 7969
D=A // 7970
@SP // 7971
AM=M+1 // 7972
A=A-1 // 7973
M=D // 7974
@27 // 7975
D=A // 7976
@SP // 7977
AM=M+1 // 7978
A=A-1 // 7979
M=D // 7980
@51 // 7981
D=A // 7982
@SP // 7983
AM=M+1 // 7984
A=A-1 // 7985
M=D // 7986
@51 // 7987
D=A // 7988
@SP // 7989
AM=M+1 // 7990
A=A-1 // 7991
M=D // 7992
@51 // 7993
D=A // 7994
@SP // 7995
AM=M+1 // 7996
A=A-1 // 7997
M=D // 7998
@51 // 7999
D=A // 8000
@SP // 8001
AM=M+1 // 8002
A=A-1 // 8003
M=D // 8004
@51 // 8005
D=A // 8006
@SP // 8007
AM=M+1 // 8008
A=A-1 // 8009
M=D // 8010
@27 // 8011
D=A // 8012
@SP // 8013
AM=M+1 // 8014
A=A-1 // 8015
M=D // 8016
@15 // 8017
D=A // 8018
@SP // 8019
AM=M+1 // 8020
A=A-1 // 8021
M=D // 8022
@SP // 8023
AM=M+1 // 8024
A=A-1 // 8025
M=0 // 8026
@SP // 8027
AM=M+1 // 8028
A=A-1 // 8029
M=0 // 8030
// call Output.create
@17 // 8031
D=A // 8032
@14 // 8033
M=D // 8034
@Output.create // 8035
D=A // 8036
@13 // 8037
M=D // 8038
@Output.initMap.ret.38 // 8039
D=A // 8040
@CALL // 8041
0;JMP // 8042
(Output.initMap.ret.38)
@SP // 8043
M=M-1 // 8044

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8045
D=A // 8046
@SP // 8047
AM=M+1 // 8048
A=A-1 // 8049
M=D // 8050
@63 // 8051
D=A // 8052
@SP // 8053
AM=M+1 // 8054
A=A-1 // 8055
M=D // 8056
@51 // 8057
D=A // 8058
@SP // 8059
AM=M+1 // 8060
A=A-1 // 8061
M=D // 8062
@35 // 8063
D=A // 8064
@SP // 8065
AM=M+1 // 8066
A=A-1 // 8067
M=D // 8068
@11 // 8069
D=A // 8070
@SP // 8071
AM=M+1 // 8072
A=A-1 // 8073
M=D // 8074
@15 // 8075
D=A // 8076
@SP // 8077
AM=M+1 // 8078
A=A-1 // 8079
M=D // 8080
@11 // 8081
D=A // 8082
@SP // 8083
AM=M+1 // 8084
A=A-1 // 8085
M=D // 8086
@35 // 8087
D=A // 8088
@SP // 8089
AM=M+1 // 8090
A=A-1 // 8091
M=D // 8092
@51 // 8093
D=A // 8094
@SP // 8095
AM=M+1 // 8096
A=A-1 // 8097
M=D // 8098
@63 // 8099
D=A // 8100
@SP // 8101
AM=M+1 // 8102
A=A-1 // 8103
M=D // 8104
@SP // 8105
AM=M+1 // 8106
A=A-1 // 8107
M=0 // 8108
@SP // 8109
AM=M+1 // 8110
A=A-1 // 8111
M=0 // 8112
// call Output.create
@17 // 8113
D=A // 8114
@14 // 8115
M=D // 8116
@Output.create // 8117
D=A // 8118
@13 // 8119
M=D // 8120
@Output.initMap.ret.39 // 8121
D=A // 8122
@CALL // 8123
0;JMP // 8124
(Output.initMap.ret.39)
@SP // 8125
M=M-1 // 8126

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8127
D=A // 8128
@SP // 8129
AM=M+1 // 8130
A=A-1 // 8131
M=D // 8132
@63 // 8133
D=A // 8134
@SP // 8135
AM=M+1 // 8136
A=A-1 // 8137
M=D // 8138
@51 // 8139
D=A // 8140
@SP // 8141
AM=M+1 // 8142
A=A-1 // 8143
M=D // 8144
@35 // 8145
D=A // 8146
@SP // 8147
AM=M+1 // 8148
A=A-1 // 8149
M=D // 8150
@11 // 8151
D=A // 8152
@SP // 8153
AM=M+1 // 8154
A=A-1 // 8155
M=D // 8156
@15 // 8157
D=A // 8158
@SP // 8159
AM=M+1 // 8160
A=A-1 // 8161
M=D // 8162
@11 // 8163
D=A // 8164
@SP // 8165
AM=M+1 // 8166
A=A-1 // 8167
M=D // 8168
@3 // 8169
D=A // 8170
@SP // 8171
AM=M+1 // 8172
A=A-1 // 8173
M=D // 8174
@3 // 8175
D=A // 8176
@SP // 8177
AM=M+1 // 8178
A=A-1 // 8179
M=D // 8180
@3 // 8181
D=A // 8182
@SP // 8183
AM=M+1 // 8184
A=A-1 // 8185
M=D // 8186
@SP // 8187
AM=M+1 // 8188
A=A-1 // 8189
M=0 // 8190
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=0 // 8194
// call Output.create
@17 // 8195
D=A // 8196
@14 // 8197
M=D // 8198
@Output.create // 8199
D=A // 8200
@13 // 8201
M=D // 8202
@Output.initMap.ret.40 // 8203
D=A // 8204
@CALL // 8205
0;JMP // 8206
(Output.initMap.ret.40)
@SP // 8207
M=M-1 // 8208

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8209
D=A // 8210
@SP // 8211
AM=M+1 // 8212
A=A-1 // 8213
M=D // 8214
@28 // 8215
D=A // 8216
@SP // 8217
AM=M+1 // 8218
A=A-1 // 8219
M=D // 8220
@54 // 8221
D=A // 8222
@SP // 8223
AM=M+1 // 8224
A=A-1 // 8225
M=D // 8226
@35 // 8227
D=A // 8228
@SP // 8229
AM=M+1 // 8230
A=A-1 // 8231
M=D // 8232
@3 // 8233
D=A // 8234
@SP // 8235
AM=M+1 // 8236
A=A-1 // 8237
M=D // 8238
@59 // 8239
D=A // 8240
@SP // 8241
AM=M+1 // 8242
A=A-1 // 8243
M=D // 8244
@51 // 8245
D=A // 8246
@SP // 8247
AM=M+1 // 8248
A=A-1 // 8249
M=D // 8250
@51 // 8251
D=A // 8252
@SP // 8253
AM=M+1 // 8254
A=A-1 // 8255
M=D // 8256
@54 // 8257
D=A // 8258
@SP // 8259
AM=M+1 // 8260
A=A-1 // 8261
M=D // 8262
@44 // 8263
D=A // 8264
@SP // 8265
AM=M+1 // 8266
A=A-1 // 8267
M=D // 8268
@SP // 8269
AM=M+1 // 8270
A=A-1 // 8271
M=0 // 8272
@SP // 8273
AM=M+1 // 8274
A=A-1 // 8275
M=0 // 8276
// call Output.create
@17 // 8277
D=A // 8278
@14 // 8279
M=D // 8280
@Output.create // 8281
D=A // 8282
@13 // 8283
M=D // 8284
@Output.initMap.ret.41 // 8285
D=A // 8286
@CALL // 8287
0;JMP // 8288
(Output.initMap.ret.41)
@SP // 8289
M=M-1 // 8290

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8291
D=A // 8292
@SP // 8293
AM=M+1 // 8294
A=A-1 // 8295
M=D // 8296
@51 // 8297
D=A // 8298
@SP // 8299
AM=M+1 // 8300
A=A-1 // 8301
M=D // 8302
@51 // 8303
D=A // 8304
@SP // 8305
AM=M+1 // 8306
A=A-1 // 8307
M=D // 8308
@51 // 8309
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
@51 // 8327
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
@51 // 8339
D=A // 8340
@SP // 8341
AM=M+1 // 8342
A=A-1 // 8343
M=D // 8344
@51 // 8345
D=A // 8346
@SP // 8347
AM=M+1 // 8348
A=A-1 // 8349
M=D // 8350
@SP // 8351
AM=M+1 // 8352
A=A-1 // 8353
M=0 // 8354
@SP // 8355
AM=M+1 // 8356
A=A-1 // 8357
M=0 // 8358
// call Output.create
@17 // 8359
D=A // 8360
@14 // 8361
M=D // 8362
@Output.create // 8363
D=A // 8364
@13 // 8365
M=D // 8366
@Output.initMap.ret.42 // 8367
D=A // 8368
@CALL // 8369
0;JMP // 8370
(Output.initMap.ret.42)
@SP // 8371
M=M-1 // 8372

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8373
D=A // 8374
@SP // 8375
AM=M+1 // 8376
A=A-1 // 8377
M=D // 8378
@30 // 8379
D=A // 8380
@SP // 8381
AM=M+1 // 8382
A=A-1 // 8383
M=D // 8384
@12 // 8385
D=A // 8386
@SP // 8387
AM=M+1 // 8388
A=A-1 // 8389
M=D // 8390
@12 // 8391
D=A // 8392
@SP // 8393
AM=M+1 // 8394
A=A-1 // 8395
M=D // 8396
@12 // 8397
D=A // 8398
@SP // 8399
AM=M+1 // 8400
A=A-1 // 8401
M=D // 8402
@12 // 8403
D=A // 8404
@SP // 8405
AM=M+1 // 8406
A=A-1 // 8407
M=D // 8408
@12 // 8409
D=A // 8410
@SP // 8411
AM=M+1 // 8412
A=A-1 // 8413
M=D // 8414
@12 // 8415
D=A // 8416
@SP // 8417
AM=M+1 // 8418
A=A-1 // 8419
M=D // 8420
@12 // 8421
D=A // 8422
@SP // 8423
AM=M+1 // 8424
A=A-1 // 8425
M=D // 8426
@30 // 8427
D=A // 8428
@SP // 8429
AM=M+1 // 8430
A=A-1 // 8431
M=D // 8432
@SP // 8433
AM=M+1 // 8434
A=A-1 // 8435
M=0 // 8436
@SP // 8437
AM=M+1 // 8438
A=A-1 // 8439
M=0 // 8440
// call Output.create
@17 // 8441
D=A // 8442
@14 // 8443
M=D // 8444
@Output.create // 8445
D=A // 8446
@13 // 8447
M=D // 8448
@Output.initMap.ret.43 // 8449
D=A // 8450
@CALL // 8451
0;JMP // 8452
(Output.initMap.ret.43)
@SP // 8453
M=M-1 // 8454

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8455
D=A // 8456
@SP // 8457
AM=M+1 // 8458
A=A-1 // 8459
M=D // 8460
@60 // 8461
D=A // 8462
@SP // 8463
AM=M+1 // 8464
A=A-1 // 8465
M=D // 8466
@24 // 8467
D=A // 8468
@SP // 8469
AM=M+1 // 8470
A=A-1 // 8471
M=D // 8472
@24 // 8473
D=A // 8474
@SP // 8475
AM=M+1 // 8476
A=A-1 // 8477
M=D // 8478
@24 // 8479
D=A // 8480
@SP // 8481
AM=M+1 // 8482
A=A-1 // 8483
M=D // 8484
@24 // 8485
D=A // 8486
@SP // 8487
AM=M+1 // 8488
A=A-1 // 8489
M=D // 8490
@24 // 8491
D=A // 8492
@SP // 8493
AM=M+1 // 8494
A=A-1 // 8495
M=D // 8496
@27 // 8497
D=A // 8498
@SP // 8499
AM=M+1 // 8500
A=A-1 // 8501
M=D // 8502
@27 // 8503
D=A // 8504
@SP // 8505
AM=M+1 // 8506
A=A-1 // 8507
M=D // 8508
@14 // 8509
D=A // 8510
@SP // 8511
AM=M+1 // 8512
A=A-1 // 8513
M=D // 8514
@SP // 8515
AM=M+1 // 8516
A=A-1 // 8517
M=0 // 8518
@SP // 8519
AM=M+1 // 8520
A=A-1 // 8521
M=0 // 8522
// call Output.create
@17 // 8523
D=A // 8524
@14 // 8525
M=D // 8526
@Output.create // 8527
D=A // 8528
@13 // 8529
M=D // 8530
@Output.initMap.ret.44 // 8531
D=A // 8532
@CALL // 8533
0;JMP // 8534
(Output.initMap.ret.44)
@SP // 8535
M=M-1 // 8536

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 8537
D=A // 8538
@SP // 8539
AM=M+1 // 8540
A=A-1 // 8541
M=D // 8542
@51 // 8543
D=A // 8544
@SP // 8545
AM=M+1 // 8546
A=A-1 // 8547
M=D // 8548
@51 // 8549
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
@27 // 8561
D=A // 8562
@SP // 8563
AM=M+1 // 8564
A=A-1 // 8565
M=D // 8566
@15 // 8567
D=A // 8568
@SP // 8569
AM=M+1 // 8570
A=A-1 // 8571
M=D // 8572
@27 // 8573
D=A // 8574
@SP // 8575
AM=M+1 // 8576
A=A-1 // 8577
M=D // 8578
@51 // 8579
D=A // 8580
@SP // 8581
AM=M+1 // 8582
A=A-1 // 8583
M=D // 8584
@51 // 8585
D=A // 8586
@SP // 8587
AM=M+1 // 8588
A=A-1 // 8589
M=D // 8590
@51 // 8591
D=A // 8592
@SP // 8593
AM=M+1 // 8594
A=A-1 // 8595
M=D // 8596
@SP // 8597
AM=M+1 // 8598
A=A-1 // 8599
M=0 // 8600
@SP // 8601
AM=M+1 // 8602
A=A-1 // 8603
M=0 // 8604
// call Output.create
@17 // 8605
D=A // 8606
@14 // 8607
M=D // 8608
@Output.create // 8609
D=A // 8610
@13 // 8611
M=D // 8612
@Output.initMap.ret.45 // 8613
D=A // 8614
@CALL // 8615
0;JMP // 8616
(Output.initMap.ret.45)
@SP // 8617
M=M-1 // 8618

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 8619
D=A // 8620
@SP // 8621
AM=M+1 // 8622
A=A-1 // 8623
M=D // 8624
@3 // 8625
D=A // 8626
@SP // 8627
AM=M+1 // 8628
A=A-1 // 8629
M=D // 8630
@3 // 8631
D=A // 8632
@SP // 8633
AM=M+1 // 8634
A=A-1 // 8635
M=D // 8636
@3 // 8637
D=A // 8638
@SP // 8639
AM=M+1 // 8640
A=A-1 // 8641
M=D // 8642
@3 // 8643
D=A // 8644
@SP // 8645
AM=M+1 // 8646
A=A-1 // 8647
M=D // 8648
@3 // 8649
D=A // 8650
@SP // 8651
AM=M+1 // 8652
A=A-1 // 8653
M=D // 8654
@3 // 8655
D=A // 8656
@SP // 8657
AM=M+1 // 8658
A=A-1 // 8659
M=D // 8660
@35 // 8661
D=A // 8662
@SP // 8663
AM=M+1 // 8664
A=A-1 // 8665
M=D // 8666
@51 // 8667
D=A // 8668
@SP // 8669
AM=M+1 // 8670
A=A-1 // 8671
M=D // 8672
@63 // 8673
D=A // 8674
@SP // 8675
AM=M+1 // 8676
A=A-1 // 8677
M=D // 8678
@SP // 8679
AM=M+1 // 8680
A=A-1 // 8681
M=0 // 8682
@SP // 8683
AM=M+1 // 8684
A=A-1 // 8685
M=0 // 8686
// call Output.create
@17 // 8687
D=A // 8688
@14 // 8689
M=D // 8690
@Output.create // 8691
D=A // 8692
@13 // 8693
M=D // 8694
@Output.initMap.ret.46 // 8695
D=A // 8696
@CALL // 8697
0;JMP // 8698
(Output.initMap.ret.46)
@SP // 8699
M=M-1 // 8700

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 8701
D=A // 8702
@SP // 8703
AM=M+1 // 8704
A=A-1 // 8705
M=D // 8706
@33 // 8707
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
@63 // 8719
D=A // 8720
@SP // 8721
AM=M+1 // 8722
A=A-1 // 8723
M=D // 8724
@63 // 8725
D=A // 8726
@SP // 8727
AM=M+1 // 8728
A=A-1 // 8729
M=D // 8730
@51 // 8731
D=A // 8732
@SP // 8733
AM=M+1 // 8734
A=A-1 // 8735
M=D // 8736
@51 // 8737
D=A // 8738
@SP // 8739
AM=M+1 // 8740
A=A-1 // 8741
M=D // 8742
@51 // 8743
D=A // 8744
@SP // 8745
AM=M+1 // 8746
A=A-1 // 8747
M=D // 8748
@51 // 8749
D=A // 8750
@SP // 8751
AM=M+1 // 8752
A=A-1 // 8753
M=D // 8754
@51 // 8755
D=A // 8756
@SP // 8757
AM=M+1 // 8758
A=A-1 // 8759
M=D // 8760
@SP // 8761
AM=M+1 // 8762
A=A-1 // 8763
M=0 // 8764
@SP // 8765
AM=M+1 // 8766
A=A-1 // 8767
M=0 // 8768
// call Output.create
@17 // 8769
D=A // 8770
@14 // 8771
M=D // 8772
@Output.create // 8773
D=A // 8774
@13 // 8775
M=D // 8776
@Output.initMap.ret.47 // 8777
D=A // 8778
@CALL // 8779
0;JMP // 8780
(Output.initMap.ret.47)
@SP // 8781
M=M-1 // 8782

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 8783
D=A // 8784
@SP // 8785
AM=M+1 // 8786
A=A-1 // 8787
M=D // 8788
@51 // 8789
D=A // 8790
@SP // 8791
AM=M+1 // 8792
A=A-1 // 8793
M=D // 8794
@51 // 8795
D=A // 8796
@SP // 8797
AM=M+1 // 8798
A=A-1 // 8799
M=D // 8800
@55 // 8801
D=A // 8802
@SP // 8803
AM=M+1 // 8804
A=A-1 // 8805
M=D // 8806
@55 // 8807
D=A // 8808
@SP // 8809
AM=M+1 // 8810
A=A-1 // 8811
M=D // 8812
@63 // 8813
D=A // 8814
@SP // 8815
AM=M+1 // 8816
A=A-1 // 8817
M=D // 8818
@59 // 8819
D=A // 8820
@SP // 8821
AM=M+1 // 8822
A=A-1 // 8823
M=D // 8824
@59 // 8825
D=A // 8826
@SP // 8827
AM=M+1 // 8828
A=A-1 // 8829
M=D // 8830
@51 // 8831
D=A // 8832
@SP // 8833
AM=M+1 // 8834
A=A-1 // 8835
M=D // 8836
@51 // 8837
D=A // 8838
@SP // 8839
AM=M+1 // 8840
A=A-1 // 8841
M=D // 8842
@SP // 8843
AM=M+1 // 8844
A=A-1 // 8845
M=0 // 8846
@SP // 8847
AM=M+1 // 8848
A=A-1 // 8849
M=0 // 8850
// call Output.create
@17 // 8851
D=A // 8852
@14 // 8853
M=D // 8854
@Output.create // 8855
D=A // 8856
@13 // 8857
M=D // 8858
@Output.initMap.ret.48 // 8859
D=A // 8860
@CALL // 8861
0;JMP // 8862
(Output.initMap.ret.48)
@SP // 8863
M=M-1 // 8864

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 8865
D=A // 8866
@SP // 8867
AM=M+1 // 8868
A=A-1 // 8869
M=D // 8870
@30 // 8871
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
@51 // 8889
D=A // 8890
@SP // 8891
AM=M+1 // 8892
A=A-1 // 8893
M=D // 8894
@51 // 8895
D=A // 8896
@SP // 8897
AM=M+1 // 8898
A=A-1 // 8899
M=D // 8900
@51 // 8901
D=A // 8902
@SP // 8903
AM=M+1 // 8904
A=A-1 // 8905
M=D // 8906
@51 // 8907
D=A // 8908
@SP // 8909
AM=M+1 // 8910
A=A-1 // 8911
M=D // 8912
@51 // 8913
D=A // 8914
@SP // 8915
AM=M+1 // 8916
A=A-1 // 8917
M=D // 8918
@30 // 8919
D=A // 8920
@SP // 8921
AM=M+1 // 8922
A=A-1 // 8923
M=D // 8924
@SP // 8925
AM=M+1 // 8926
A=A-1 // 8927
M=0 // 8928
@SP // 8929
AM=M+1 // 8930
A=A-1 // 8931
M=0 // 8932
// call Output.create
@17 // 8933
D=A // 8934
@14 // 8935
M=D // 8936
@Output.create // 8937
D=A // 8938
@13 // 8939
M=D // 8940
@Output.initMap.ret.49 // 8941
D=A // 8942
@CALL // 8943
0;JMP // 8944
(Output.initMap.ret.49)
@SP // 8945
M=M-1 // 8946

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 8947
D=A // 8948
@SP // 8949
AM=M+1 // 8950
A=A-1 // 8951
M=D // 8952
@31 // 8953
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
@51 // 8965
D=A // 8966
@SP // 8967
AM=M+1 // 8968
A=A-1 // 8969
M=D // 8970
@51 // 8971
D=A // 8972
@SP // 8973
AM=M+1 // 8974
A=A-1 // 8975
M=D // 8976
@31 // 8977
D=A // 8978
@SP // 8979
AM=M+1 // 8980
A=A-1 // 8981
M=D // 8982
@3 // 8983
D=A // 8984
@SP // 8985
AM=M+1 // 8986
A=A-1 // 8987
M=D // 8988
@3 // 8989
D=A // 8990
@SP // 8991
AM=M+1 // 8992
A=A-1 // 8993
M=D // 8994
@3 // 8995
D=A // 8996
@SP // 8997
AM=M+1 // 8998
A=A-1 // 8999
M=D // 9000
@3 // 9001
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
@Output.initMap.ret.50 // 9023
D=A // 9024
@CALL // 9025
0;JMP // 9026
(Output.initMap.ret.50)
@SP // 9027
M=M-1 // 9028

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9029
D=A // 9030
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=D // 9034
@30 // 9035
D=A // 9036
@SP // 9037
AM=M+1 // 9038
A=A-1 // 9039
M=D // 9040
@51 // 9041
D=A // 9042
@SP // 9043
AM=M+1 // 9044
A=A-1 // 9045
M=D // 9046
@51 // 9047
D=A // 9048
@SP // 9049
AM=M+1 // 9050
A=A-1 // 9051
M=D // 9052
@51 // 9053
D=A // 9054
@SP // 9055
AM=M+1 // 9056
A=A-1 // 9057
M=D // 9058
@51 // 9059
D=A // 9060
@SP // 9061
AM=M+1 // 9062
A=A-1 // 9063
M=D // 9064
@51 // 9065
D=A // 9066
@SP // 9067
AM=M+1 // 9068
A=A-1 // 9069
M=D // 9070
@63 // 9071
D=A // 9072
@SP // 9073
AM=M+1 // 9074
A=A-1 // 9075
M=D // 9076
@59 // 9077
D=A // 9078
@SP // 9079
AM=M+1 // 9080
A=A-1 // 9081
M=D // 9082
@30 // 9083
D=A // 9084
@SP // 9085
AM=M+1 // 9086
A=A-1 // 9087
M=D // 9088
@48 // 9089
D=A // 9090
@SP // 9091
AM=M+1 // 9092
A=A-1 // 9093
M=D // 9094
@SP // 9095
AM=M+1 // 9096
A=A-1 // 9097
M=0 // 9098
// call Output.create
@17 // 9099
D=A // 9100
@14 // 9101
M=D // 9102
@Output.create // 9103
D=A // 9104
@13 // 9105
M=D // 9106
@Output.initMap.ret.51 // 9107
D=A // 9108
@CALL // 9109
0;JMP // 9110
(Output.initMap.ret.51)
@SP // 9111
M=M-1 // 9112

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9113
D=A // 9114
@SP // 9115
AM=M+1 // 9116
A=A-1 // 9117
M=D // 9118
@31 // 9119
D=A // 9120
@SP // 9121
AM=M+1 // 9122
A=A-1 // 9123
M=D // 9124
@51 // 9125
D=A // 9126
@SP // 9127
AM=M+1 // 9128
A=A-1 // 9129
M=D // 9130
@51 // 9131
D=A // 9132
@SP // 9133
AM=M+1 // 9134
A=A-1 // 9135
M=D // 9136
@51 // 9137
D=A // 9138
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=D // 9142
@31 // 9143
D=A // 9144
@SP // 9145
AM=M+1 // 9146
A=A-1 // 9147
M=D // 9148
@27 // 9149
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
@51 // 9161
D=A // 9162
@SP // 9163
AM=M+1 // 9164
A=A-1 // 9165
M=D // 9166
@51 // 9167
D=A // 9168
@SP // 9169
AM=M+1 // 9170
A=A-1 // 9171
M=D // 9172
@SP // 9173
AM=M+1 // 9174
A=A-1 // 9175
M=0 // 9176
@SP // 9177
AM=M+1 // 9178
A=A-1 // 9179
M=0 // 9180
// call Output.create
@17 // 9181
D=A // 9182
@14 // 9183
M=D // 9184
@Output.create // 9185
D=A // 9186
@13 // 9187
M=D // 9188
@Output.initMap.ret.52 // 9189
D=A // 9190
@CALL // 9191
0;JMP // 9192
(Output.initMap.ret.52)
@SP // 9193
M=M-1 // 9194

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9195
D=A // 9196
@SP // 9197
AM=M+1 // 9198
A=A-1 // 9199
M=D // 9200
@30 // 9201
D=A // 9202
@SP // 9203
AM=M+1 // 9204
A=A-1 // 9205
M=D // 9206
@51 // 9207
D=A // 9208
@SP // 9209
AM=M+1 // 9210
A=A-1 // 9211
M=D // 9212
@51 // 9213
D=A // 9214
@SP // 9215
AM=M+1 // 9216
A=A-1 // 9217
M=D // 9218
@6 // 9219
D=A // 9220
@SP // 9221
AM=M+1 // 9222
A=A-1 // 9223
M=D // 9224
@28 // 9225
D=A // 9226
@SP // 9227
AM=M+1 // 9228
A=A-1 // 9229
M=D // 9230
@48 // 9231
D=A // 9232
@SP // 9233
AM=M+1 // 9234
A=A-1 // 9235
M=D // 9236
@51 // 9237
D=A // 9238
@SP // 9239
AM=M+1 // 9240
A=A-1 // 9241
M=D // 9242
@51 // 9243
D=A // 9244
@SP // 9245
AM=M+1 // 9246
A=A-1 // 9247
M=D // 9248
@30 // 9249
D=A // 9250
@SP // 9251
AM=M+1 // 9252
A=A-1 // 9253
M=D // 9254
@SP // 9255
AM=M+1 // 9256
A=A-1 // 9257
M=0 // 9258
@SP // 9259
AM=M+1 // 9260
A=A-1 // 9261
M=0 // 9262
// call Output.create
@17 // 9263
D=A // 9264
@14 // 9265
M=D // 9266
@Output.create // 9267
D=A // 9268
@13 // 9269
M=D // 9270
@Output.initMap.ret.53 // 9271
D=A // 9272
@CALL // 9273
0;JMP // 9274
(Output.initMap.ret.53)
@SP // 9275
M=M-1 // 9276

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9277
D=A // 9278
@SP // 9279
AM=M+1 // 9280
A=A-1 // 9281
M=D // 9282
@63 // 9283
D=A // 9284
@SP // 9285
AM=M+1 // 9286
A=A-1 // 9287
M=D // 9288
@63 // 9289
D=A // 9290
@SP // 9291
AM=M+1 // 9292
A=A-1 // 9293
M=D // 9294
@45 // 9295
D=A // 9296
@SP // 9297
AM=M+1 // 9298
A=A-1 // 9299
M=D // 9300
@12 // 9301
D=A // 9302
@SP // 9303
AM=M+1 // 9304
A=A-1 // 9305
M=D // 9306
@12 // 9307
D=A // 9308
@SP // 9309
AM=M+1 // 9310
A=A-1 // 9311
M=D // 9312
@12 // 9313
D=A // 9314
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=D // 9318
@12 // 9319
D=A // 9320
@SP // 9321
AM=M+1 // 9322
A=A-1 // 9323
M=D // 9324
@12 // 9325
D=A // 9326
@SP // 9327
AM=M+1 // 9328
A=A-1 // 9329
M=D // 9330
@30 // 9331
D=A // 9332
@SP // 9333
AM=M+1 // 9334
A=A-1 // 9335
M=D // 9336
@SP // 9337
AM=M+1 // 9338
A=A-1 // 9339
M=0 // 9340
@SP // 9341
AM=M+1 // 9342
A=A-1 // 9343
M=0 // 9344
// call Output.create
@17 // 9345
D=A // 9346
@14 // 9347
M=D // 9348
@Output.create // 9349
D=A // 9350
@13 // 9351
M=D // 9352
@Output.initMap.ret.54 // 9353
D=A // 9354
@CALL // 9355
0;JMP // 9356
(Output.initMap.ret.54)
@SP // 9357
M=M-1 // 9358

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9359
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
@51 // 9383
D=A // 9384
@SP // 9385
AM=M+1 // 9386
A=A-1 // 9387
M=D // 9388
@51 // 9389
D=A // 9390
@SP // 9391
AM=M+1 // 9392
A=A-1 // 9393
M=D // 9394
@51 // 9395
D=A // 9396
@SP // 9397
AM=M+1 // 9398
A=A-1 // 9399
M=D // 9400
@51 // 9401
D=A // 9402
@SP // 9403
AM=M+1 // 9404
A=A-1 // 9405
M=D // 9406
@51 // 9407
D=A // 9408
@SP // 9409
AM=M+1 // 9410
A=A-1 // 9411
M=D // 9412
@30 // 9413
D=A // 9414
@SP // 9415
AM=M+1 // 9416
A=A-1 // 9417
M=D // 9418
@SP // 9419
AM=M+1 // 9420
A=A-1 // 9421
M=0 // 9422
@SP // 9423
AM=M+1 // 9424
A=A-1 // 9425
M=0 // 9426
// call Output.create
@17 // 9427
D=A // 9428
@14 // 9429
M=D // 9430
@Output.create // 9431
D=A // 9432
@13 // 9433
M=D // 9434
@Output.initMap.ret.55 // 9435
D=A // 9436
@CALL // 9437
0;JMP // 9438
(Output.initMap.ret.55)
@SP // 9439
M=M-1 // 9440

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9441
D=A // 9442
@SP // 9443
AM=M+1 // 9444
A=A-1 // 9445
M=D // 9446
@51 // 9447
D=A // 9448
@SP // 9449
AM=M+1 // 9450
A=A-1 // 9451
M=D // 9452
@51 // 9453
D=A // 9454
@SP // 9455
AM=M+1 // 9456
A=A-1 // 9457
M=D // 9458
@51 // 9459
D=A // 9460
@SP // 9461
AM=M+1 // 9462
A=A-1 // 9463
M=D // 9464
@51 // 9465
D=A // 9466
@SP // 9467
AM=M+1 // 9468
A=A-1 // 9469
M=D // 9470
@51 // 9471
D=A // 9472
@SP // 9473
AM=M+1 // 9474
A=A-1 // 9475
M=D // 9476
@30 // 9477
D=A // 9478
@SP // 9479
AM=M+1 // 9480
A=A-1 // 9481
M=D // 9482
@30 // 9483
D=A // 9484
@SP // 9485
AM=M+1 // 9486
A=A-1 // 9487
M=D // 9488
@12 // 9489
D=A // 9490
@SP // 9491
AM=M+1 // 9492
A=A-1 // 9493
M=D // 9494
@12 // 9495
D=A // 9496
@SP // 9497
AM=M+1 // 9498
A=A-1 // 9499
M=D // 9500
@SP // 9501
AM=M+1 // 9502
A=A-1 // 9503
M=0 // 9504
@SP // 9505
AM=M+1 // 9506
A=A-1 // 9507
M=0 // 9508
// call Output.create
@17 // 9509
D=A // 9510
@14 // 9511
M=D // 9512
@Output.create // 9513
D=A // 9514
@13 // 9515
M=D // 9516
@Output.initMap.ret.56 // 9517
D=A // 9518
@CALL // 9519
0;JMP // 9520
(Output.initMap.ret.56)
@SP // 9521
M=M-1 // 9522

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 9523
D=A // 9524
@SP // 9525
AM=M+1 // 9526
A=A-1 // 9527
M=D // 9528
@51 // 9529
D=A // 9530
@SP // 9531
AM=M+1 // 9532
A=A-1 // 9533
M=D // 9534
@51 // 9535
D=A // 9536
@SP // 9537
AM=M+1 // 9538
A=A-1 // 9539
M=D // 9540
@51 // 9541
D=A // 9542
@SP // 9543
AM=M+1 // 9544
A=A-1 // 9545
M=D // 9546
@51 // 9547
D=A // 9548
@SP // 9549
AM=M+1 // 9550
A=A-1 // 9551
M=D // 9552
@51 // 9553
D=A // 9554
@SP // 9555
AM=M+1 // 9556
A=A-1 // 9557
M=D // 9558
@63 // 9559
D=A // 9560
@SP // 9561
AM=M+1 // 9562
A=A-1 // 9563
M=D // 9564
@63 // 9565
D=A // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=D // 9570
@63 // 9571
D=A // 9572
@SP // 9573
AM=M+1 // 9574
A=A-1 // 9575
M=D // 9576
@18 // 9577
D=A // 9578
@SP // 9579
AM=M+1 // 9580
A=A-1 // 9581
M=D // 9582
@SP // 9583
AM=M+1 // 9584
A=A-1 // 9585
M=0 // 9586
@SP // 9587
AM=M+1 // 9588
A=A-1 // 9589
M=0 // 9590
// call Output.create
@17 // 9591
D=A // 9592
@14 // 9593
M=D // 9594
@Output.create // 9595
D=A // 9596
@13 // 9597
M=D // 9598
@Output.initMap.ret.57 // 9599
D=A // 9600
@CALL // 9601
0;JMP // 9602
(Output.initMap.ret.57)
@SP // 9603
M=M-1 // 9604

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610
@51 // 9611
D=A // 9612
@SP // 9613
AM=M+1 // 9614
A=A-1 // 9615
M=D // 9616
@51 // 9617
D=A // 9618
@SP // 9619
AM=M+1 // 9620
A=A-1 // 9621
M=D // 9622
@30 // 9623
D=A // 9624
@SP // 9625
AM=M+1 // 9626
A=A-1 // 9627
M=D // 9628
@30 // 9629
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
@30 // 9647
D=A // 9648
@SP // 9649
AM=M+1 // 9650
A=A-1 // 9651
M=D // 9652
@51 // 9653
D=A // 9654
@SP // 9655
AM=M+1 // 9656
A=A-1 // 9657
M=D // 9658
@51 // 9659
D=A // 9660
@SP // 9661
AM=M+1 // 9662
A=A-1 // 9663
M=D // 9664
@SP // 9665
AM=M+1 // 9666
A=A-1 // 9667
M=0 // 9668
@SP // 9669
AM=M+1 // 9670
A=A-1 // 9671
M=0 // 9672
// call Output.create
@17 // 9673
D=A // 9674
@14 // 9675
M=D // 9676
@Output.create // 9677
D=A // 9678
@13 // 9679
M=D // 9680
@Output.initMap.ret.58 // 9681
D=A // 9682
@CALL // 9683
0;JMP // 9684
(Output.initMap.ret.58)
@SP // 9685
M=M-1 // 9686

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 9687
D=A // 9688
@SP // 9689
AM=M+1 // 9690
A=A-1 // 9691
M=D // 9692
@51 // 9693
D=A // 9694
@SP // 9695
AM=M+1 // 9696
A=A-1 // 9697
M=D // 9698
@51 // 9699
D=A // 9700
@SP // 9701
AM=M+1 // 9702
A=A-1 // 9703
M=D // 9704
@51 // 9705
D=A // 9706
@SP // 9707
AM=M+1 // 9708
A=A-1 // 9709
M=D // 9710
@51 // 9711
D=A // 9712
@SP // 9713
AM=M+1 // 9714
A=A-1 // 9715
M=D // 9716
@30 // 9717
D=A // 9718
@SP // 9719
AM=M+1 // 9720
A=A-1 // 9721
M=D // 9722
@12 // 9723
D=A // 9724
@SP // 9725
AM=M+1 // 9726
A=A-1 // 9727
M=D // 9728
@12 // 9729
D=A // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=D // 9734
@12 // 9735
D=A // 9736
@SP // 9737
AM=M+1 // 9738
A=A-1 // 9739
M=D // 9740
@30 // 9741
D=A // 9742
@SP // 9743
AM=M+1 // 9744
A=A-1 // 9745
M=D // 9746
@SP // 9747
AM=M+1 // 9748
A=A-1 // 9749
M=0 // 9750
@SP // 9751
AM=M+1 // 9752
A=A-1 // 9753
M=0 // 9754
// call Output.create
@17 // 9755
D=A // 9756
@14 // 9757
M=D // 9758
@Output.create // 9759
D=A // 9760
@13 // 9761
M=D // 9762
@Output.initMap.ret.59 // 9763
D=A // 9764
@CALL // 9765
0;JMP // 9766
(Output.initMap.ret.59)
@SP // 9767
M=M-1 // 9768

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 9769
D=A // 9770
@SP // 9771
AM=M+1 // 9772
A=A-1 // 9773
M=D // 9774
@63 // 9775
D=A // 9776
@SP // 9777
AM=M+1 // 9778
A=A-1 // 9779
M=D // 9780
@51 // 9781
D=A // 9782
@SP // 9783
AM=M+1 // 9784
A=A-1 // 9785
M=D // 9786
@49 // 9787
D=A // 9788
@SP // 9789
AM=M+1 // 9790
A=A-1 // 9791
M=D // 9792
@24 // 9793
D=A // 9794
@SP // 9795
AM=M+1 // 9796
A=A-1 // 9797
M=D // 9798
@12 // 9799
D=A // 9800
@SP // 9801
AM=M+1 // 9802
A=A-1 // 9803
M=D // 9804
@6 // 9805
D=A // 9806
@SP // 9807
AM=M+1 // 9808
A=A-1 // 9809
M=D // 9810
@35 // 9811
D=A // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=D // 9816
@51 // 9817
D=A // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=D // 9822
@63 // 9823
D=A // 9824
@SP // 9825
AM=M+1 // 9826
A=A-1 // 9827
M=D // 9828
@SP // 9829
AM=M+1 // 9830
A=A-1 // 9831
M=0 // 9832
@SP // 9833
AM=M+1 // 9834
A=A-1 // 9835
M=0 // 9836
// call Output.create
@17 // 9837
D=A // 9838
@14 // 9839
M=D // 9840
@Output.create // 9841
D=A // 9842
@13 // 9843
M=D // 9844
@Output.initMap.ret.60 // 9845
D=A // 9846
@CALL // 9847
0;JMP // 9848
(Output.initMap.ret.60)
@SP // 9849
M=M-1 // 9850

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 9851
D=A // 9852
@SP // 9853
AM=M+1 // 9854
A=A-1 // 9855
M=D // 9856
@30 // 9857
D=A // 9858
@SP // 9859
AM=M+1 // 9860
A=A-1 // 9861
M=D // 9862
@6 // 9863
D=A // 9864
@SP // 9865
AM=M+1 // 9866
A=A-1 // 9867
M=D // 9868
@6 // 9869
D=A // 9870
@SP // 9871
AM=M+1 // 9872
A=A-1 // 9873
M=D // 9874
@6 // 9875
D=A // 9876
@SP // 9877
AM=M+1 // 9878
A=A-1 // 9879
M=D // 9880
@6 // 9881
D=A // 9882
@SP // 9883
AM=M+1 // 9884
A=A-1 // 9885
M=D // 9886
@6 // 9887
D=A // 9888
@SP // 9889
AM=M+1 // 9890
A=A-1 // 9891
M=D // 9892
@6 // 9893
D=A // 9894
@SP // 9895
AM=M+1 // 9896
A=A-1 // 9897
M=D // 9898
@6 // 9899
D=A // 9900
@SP // 9901
AM=M+1 // 9902
A=A-1 // 9903
M=D // 9904
@30 // 9905
D=A // 9906
@SP // 9907
AM=M+1 // 9908
A=A-1 // 9909
M=D // 9910
@SP // 9911
AM=M+1 // 9912
A=A-1 // 9913
M=0 // 9914
@SP // 9915
AM=M+1 // 9916
A=A-1 // 9917
M=0 // 9918
// call Output.create
@17 // 9919
D=A // 9920
@14 // 9921
M=D // 9922
@Output.create // 9923
D=A // 9924
@13 // 9925
M=D // 9926
@Output.initMap.ret.61 // 9927
D=A // 9928
@CALL // 9929
0;JMP // 9930
(Output.initMap.ret.61)
@SP // 9931
M=M-1 // 9932

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9933
D=A // 9934
@SP // 9935
M=D+M // 9936
@92 // 9937
D=A // 9938
@SP // 9939
A=M-1 // 9940
M=1 // 9941
A=A-1 // 9942
M=0 // 9943
A=A-1 // 9944
M=0 // 9945
A=A-1 // 9946
M=D // 9947
@3 // 9948
D=A // 9949
@SP // 9950
AM=M+1 // 9951
A=A-1 // 9952
M=D // 9953
@6 // 9954
D=A // 9955
@SP // 9956
AM=M+1 // 9957
A=A-1 // 9958
M=D // 9959
@12 // 9960
D=A // 9961
@SP // 9962
AM=M+1 // 9963
A=A-1 // 9964
M=D // 9965
@24 // 9966
D=A // 9967
@SP // 9968
AM=M+1 // 9969
A=A-1 // 9970
M=D // 9971
@48 // 9972
D=A // 9973
@SP // 9974
AM=M+1 // 9975
A=A-1 // 9976
M=D // 9977
@32 // 9978
D=A // 9979
@SP // 9980
AM=M+1 // 9981
A=A-1 // 9982
M=D // 9983
@SP // 9984
AM=M+1 // 9985
A=A-1 // 9986
M=0 // 9987
@SP // 9988
AM=M+1 // 9989
A=A-1 // 9990
M=0 // 9991
// call Output.create
@17 // 9992
D=A // 9993
@14 // 9994
M=D // 9995
@Output.create // 9996
D=A // 9997
@13 // 9998
M=D // 9999
@Output.initMap.ret.62 // 10000
D=A // 10001
@CALL // 10002
0;JMP // 10003
(Output.initMap.ret.62)
@SP // 10004
M=M-1 // 10005

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10006
D=A // 10007
@SP // 10008
AM=M+1 // 10009
A=A-1 // 10010
M=D // 10011
@30 // 10012
D=A // 10013
@SP // 10014
AM=M+1 // 10015
A=A-1 // 10016
M=D // 10017
@24 // 10018
D=A // 10019
@SP // 10020
AM=M+1 // 10021
A=A-1 // 10022
M=D // 10023
@24 // 10024
D=A // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=D // 10029
@24 // 10030
D=A // 10031
@SP // 10032
AM=M+1 // 10033
A=A-1 // 10034
M=D // 10035
@24 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041
@24 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047
@24 // 10048
D=A // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=D // 10053
@24 // 10054
D=A // 10055
@SP // 10056
AM=M+1 // 10057
A=A-1 // 10058
M=D // 10059
@30 // 10060
D=A // 10061
@SP // 10062
AM=M+1 // 10063
A=A-1 // 10064
M=D // 10065
@SP // 10066
AM=M+1 // 10067
A=A-1 // 10068
M=0 // 10069
@SP // 10070
AM=M+1 // 10071
A=A-1 // 10072
M=0 // 10073
// call Output.create
@17 // 10074
D=A // 10075
@14 // 10076
M=D // 10077
@Output.create // 10078
D=A // 10079
@13 // 10080
M=D // 10081
@Output.initMap.ret.63 // 10082
D=A // 10083
@CALL // 10084
0;JMP // 10085
(Output.initMap.ret.63)
@SP // 10086
M=M-1 // 10087

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10088
D=A // 10089
@SP // 10090
AM=M+1 // 10091
A=A-1 // 10092
M=D // 10093
@8 // 10094
D=A // 10095
@SP // 10096
AM=M+1 // 10097
A=A-1 // 10098
M=D // 10099
@28 // 10100
D=A // 10101
@SP // 10102
AM=M+1 // 10103
A=A-1 // 10104
M=D // 10105
@54 // 10106
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
@SP // 10120
AM=M+1 // 10121
A=A-1 // 10122
M=0 // 10123
@SP // 10124
AM=M+1 // 10125
A=A-1 // 10126
M=0 // 10127
@SP // 10128
AM=M+1 // 10129
A=A-1 // 10130
M=0 // 10131
@SP // 10132
AM=M+1 // 10133
A=A-1 // 10134
M=0 // 10135
@SP // 10136
AM=M+1 // 10137
A=A-1 // 10138
M=0 // 10139
@SP // 10140
AM=M+1 // 10141
A=A-1 // 10142
M=0 // 10143
// call Output.create
@17 // 10144
D=A // 10145
@14 // 10146
M=D // 10147
@Output.create // 10148
D=A // 10149
@13 // 10150
M=D // 10151
@Output.initMap.ret.64 // 10152
D=A // 10153
@CALL // 10154
0;JMP // 10155
(Output.initMap.ret.64)
@SP // 10156
M=M-1 // 10157

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10158
D=A // 10159
@SP // 10160
M=D+M // 10161
@95 // 10162
D=A // 10163
@SP // 10164
A=M-1 // 10165
M=0 // 10166
A=A-1 // 10167
M=0 // 10168
A=A-1 // 10169
M=0 // 10170
A=A-1 // 10171
M=0 // 10172
A=A-1 // 10173
M=0 // 10174
A=A-1 // 10175
M=0 // 10176
A=A-1 // 10177
M=0 // 10178
A=A-1 // 10179
M=0 // 10180
A=A-1 // 10181
M=0 // 10182
A=A-1 // 10183
M=D // 10184
@2 // 10185
D=A // 10186
@SP // 10187
M=D+M // 10188
@63 // 10189
D=A // 10190
@SP // 10191
A=M-1 // 10192
M=0 // 10193
A=A-1 // 10194
M=D // 10195
// call Output.create
@17 // 10196
D=A // 10197
@14 // 10198
M=D // 10199
@Output.create // 10200
D=A // 10201
@13 // 10202
M=D // 10203
@Output.initMap.ret.65 // 10204
D=A // 10205
@CALL // 10206
0;JMP // 10207
(Output.initMap.ret.65)
@SP // 10208
M=M-1 // 10209

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10210
D=A // 10211
@SP // 10212
AM=M+1 // 10213
A=A-1 // 10214
M=D // 10215
@6 // 10216
D=A // 10217
@SP // 10218
AM=M+1 // 10219
A=A-1 // 10220
M=D // 10221
@12 // 10222
D=A // 10223
@SP // 10224
AM=M+1 // 10225
A=A-1 // 10226
M=D // 10227
@24 // 10228
D=A // 10229
@SP // 10230
AM=M+1 // 10231
A=A-1 // 10232
M=D // 10233
@SP // 10234
AM=M+1 // 10235
A=A-1 // 10236
M=0 // 10237
@SP // 10238
AM=M+1 // 10239
A=A-1 // 10240
M=0 // 10241
@SP // 10242
AM=M+1 // 10243
A=A-1 // 10244
M=0 // 10245
@SP // 10246
AM=M+1 // 10247
A=A-1 // 10248
M=0 // 10249
@SP // 10250
AM=M+1 // 10251
A=A-1 // 10252
M=0 // 10253
@SP // 10254
AM=M+1 // 10255
A=A-1 // 10256
M=0 // 10257
@SP // 10258
AM=M+1 // 10259
A=A-1 // 10260
M=0 // 10261
@SP // 10262
AM=M+1 // 10263
A=A-1 // 10264
M=0 // 10265
// call Output.create
@17 // 10266
D=A // 10267
@14 // 10268
M=D // 10269
@Output.create // 10270
D=A // 10271
@13 // 10272
M=D // 10273
@Output.initMap.ret.66 // 10274
D=A // 10275
@CALL // 10276
0;JMP // 10277
(Output.initMap.ret.66)
@SP // 10278
M=M-1 // 10279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10280
D=A // 10281
@SP // 10282
M=D+M // 10283
@97 // 10284
D=A // 10285
@SP // 10286
A=M-1 // 10287
M=0 // 10288
A=A-1 // 10289
M=0 // 10290
A=A-1 // 10291
M=0 // 10292
A=A-1 // 10293
M=D // 10294
@14 // 10295
D=A // 10296
@SP // 10297
AM=M+1 // 10298
A=A-1 // 10299
M=D // 10300
@24 // 10301
D=A // 10302
@SP // 10303
AM=M+1 // 10304
A=A-1 // 10305
M=D // 10306
@30 // 10307
D=A // 10308
@SP // 10309
AM=M+1 // 10310
A=A-1 // 10311
M=D // 10312
@27 // 10313
D=A // 10314
@SP // 10315
AM=M+1 // 10316
A=A-1 // 10317
M=D // 10318
@27 // 10319
D=A // 10320
@SP // 10321
AM=M+1 // 10322
A=A-1 // 10323
M=D // 10324
@54 // 10325
D=A // 10326
@SP // 10327
AM=M+1 // 10328
A=A-1 // 10329
M=D // 10330
@SP // 10331
AM=M+1 // 10332
A=A-1 // 10333
M=0 // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=0 // 10338
// call Output.create
@17 // 10339
D=A // 10340
@14 // 10341
M=D // 10342
@Output.create // 10343
D=A // 10344
@13 // 10345
M=D // 10346
@Output.initMap.ret.67 // 10347
D=A // 10348
@CALL // 10349
0;JMP // 10350
(Output.initMap.ret.67)
@SP // 10351
M=M-1 // 10352

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10353
D=A // 10354
@SP // 10355
AM=M+1 // 10356
A=A-1 // 10357
M=D // 10358
@3 // 10359
D=A // 10360
@SP // 10361
AM=M+1 // 10362
A=A-1 // 10363
M=D // 10364
@3 // 10365
D=A // 10366
@SP // 10367
AM=M+1 // 10368
A=A-1 // 10369
M=D // 10370
@3 // 10371
D=A // 10372
@SP // 10373
AM=M+1 // 10374
A=A-1 // 10375
M=D // 10376
@15 // 10377
D=A // 10378
@SP // 10379
AM=M+1 // 10380
A=A-1 // 10381
M=D // 10382
@27 // 10383
D=A // 10384
@SP // 10385
AM=M+1 // 10386
A=A-1 // 10387
M=D // 10388
@51 // 10389
D=A // 10390
@SP // 10391
AM=M+1 // 10392
A=A-1 // 10393
M=D // 10394
@51 // 10395
D=A // 10396
@SP // 10397
AM=M+1 // 10398
A=A-1 // 10399
M=D // 10400
@51 // 10401
D=A // 10402
@SP // 10403
AM=M+1 // 10404
A=A-1 // 10405
M=D // 10406
@30 // 10407
D=A // 10408
@SP // 10409
AM=M+1 // 10410
A=A-1 // 10411
M=D // 10412
@SP // 10413
AM=M+1 // 10414
A=A-1 // 10415
M=0 // 10416
@SP // 10417
AM=M+1 // 10418
A=A-1 // 10419
M=0 // 10420
// call Output.create
@17 // 10421
D=A // 10422
@14 // 10423
M=D // 10424
@Output.create // 10425
D=A // 10426
@13 // 10427
M=D // 10428
@Output.initMap.ret.68 // 10429
D=A // 10430
@CALL // 10431
0;JMP // 10432
(Output.initMap.ret.68)
@SP // 10433
M=M-1 // 10434

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10435
D=A // 10436
@SP // 10437
M=D+M // 10438
@99 // 10439
D=A // 10440
@SP // 10441
A=M-1 // 10442
M=0 // 10443
A=A-1 // 10444
M=0 // 10445
A=A-1 // 10446
M=0 // 10447
A=A-1 // 10448
M=D // 10449
@30 // 10450
D=A // 10451
@SP // 10452
AM=M+1 // 10453
A=A-1 // 10454
M=D // 10455
@51 // 10456
D=A // 10457
@SP // 10458
AM=M+1 // 10459
A=A-1 // 10460
M=D // 10461
@3 // 10462
D=A // 10463
@SP // 10464
AM=M+1 // 10465
A=A-1 // 10466
M=D // 10467
@3 // 10468
D=A // 10469
@SP // 10470
AM=M+1 // 10471
A=A-1 // 10472
M=D // 10473
@51 // 10474
D=A // 10475
@SP // 10476
AM=M+1 // 10477
A=A-1 // 10478
M=D // 10479
@30 // 10480
D=A // 10481
@SP // 10482
AM=M+1 // 10483
A=A-1 // 10484
M=D // 10485
@SP // 10486
AM=M+1 // 10487
A=A-1 // 10488
M=0 // 10489
@SP // 10490
AM=M+1 // 10491
A=A-1 // 10492
M=0 // 10493
// call Output.create
@17 // 10494
D=A // 10495
@14 // 10496
M=D // 10497
@Output.create // 10498
D=A // 10499
@13 // 10500
M=D // 10501
@Output.initMap.ret.69 // 10502
D=A // 10503
@CALL // 10504
0;JMP // 10505
(Output.initMap.ret.69)
@SP // 10506
M=M-1 // 10507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 10508
D=A // 10509
@SP // 10510
AM=M+1 // 10511
A=A-1 // 10512
M=D // 10513
@48 // 10514
D=A // 10515
@SP // 10516
AM=M+1 // 10517
A=A-1 // 10518
M=D // 10519
@48 // 10520
D=A // 10521
@SP // 10522
AM=M+1 // 10523
A=A-1 // 10524
M=D // 10525
@48 // 10526
D=A // 10527
@SP // 10528
AM=M+1 // 10529
A=A-1 // 10530
M=D // 10531
@60 // 10532
D=A // 10533
@SP // 10534
AM=M+1 // 10535
A=A-1 // 10536
M=D // 10537
@54 // 10538
D=A // 10539
@SP // 10540
AM=M+1 // 10541
A=A-1 // 10542
M=D // 10543
@51 // 10544
D=A // 10545
@SP // 10546
AM=M+1 // 10547
A=A-1 // 10548
M=D // 10549
@51 // 10550
D=A // 10551
@SP // 10552
AM=M+1 // 10553
A=A-1 // 10554
M=D // 10555
@51 // 10556
D=A // 10557
@SP // 10558
AM=M+1 // 10559
A=A-1 // 10560
M=D // 10561
@30 // 10562
D=A // 10563
@SP // 10564
AM=M+1 // 10565
A=A-1 // 10566
M=D // 10567
@SP // 10568
AM=M+1 // 10569
A=A-1 // 10570
M=0 // 10571
@SP // 10572
AM=M+1 // 10573
A=A-1 // 10574
M=0 // 10575
// call Output.create
@17 // 10576
D=A // 10577
@14 // 10578
M=D // 10579
@Output.create // 10580
D=A // 10581
@13 // 10582
M=D // 10583
@Output.initMap.ret.70 // 10584
D=A // 10585
@CALL // 10586
0;JMP // 10587
(Output.initMap.ret.70)
@SP // 10588
M=M-1 // 10589

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10590
D=A // 10591
@SP // 10592
M=D+M // 10593
@101 // 10594
D=A // 10595
@SP // 10596
A=M-1 // 10597
M=0 // 10598
A=A-1 // 10599
M=0 // 10600
A=A-1 // 10601
M=0 // 10602
A=A-1 // 10603
M=D // 10604
@30 // 10605
D=A // 10606
@SP // 10607
AM=M+1 // 10608
A=A-1 // 10609
M=D // 10610
@51 // 10611
D=A // 10612
@SP // 10613
AM=M+1 // 10614
A=A-1 // 10615
M=D // 10616
@63 // 10617
D=A // 10618
@SP // 10619
AM=M+1 // 10620
A=A-1 // 10621
M=D // 10622
@3 // 10623
D=A // 10624
@SP // 10625
AM=M+1 // 10626
A=A-1 // 10627
M=D // 10628
@51 // 10629
D=A // 10630
@SP // 10631
AM=M+1 // 10632
A=A-1 // 10633
M=D // 10634
@30 // 10635
D=A // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=D // 10640
@SP // 10641
AM=M+1 // 10642
A=A-1 // 10643
M=0 // 10644
@SP // 10645
AM=M+1 // 10646
A=A-1 // 10647
M=0 // 10648
// call Output.create
@17 // 10649
D=A // 10650
@14 // 10651
M=D // 10652
@Output.create // 10653
D=A // 10654
@13 // 10655
M=D // 10656
@Output.initMap.ret.71 // 10657
D=A // 10658
@CALL // 10659
0;JMP // 10660
(Output.initMap.ret.71)
@SP // 10661
M=M-1 // 10662

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 10663
D=A // 10664
@SP // 10665
AM=M+1 // 10666
A=A-1 // 10667
M=D // 10668
@28 // 10669
D=A // 10670
@SP // 10671
AM=M+1 // 10672
A=A-1 // 10673
M=D // 10674
@54 // 10675
D=A // 10676
@SP // 10677
AM=M+1 // 10678
A=A-1 // 10679
M=D // 10680
@38 // 10681
D=A // 10682
@SP // 10683
AM=M+1 // 10684
A=A-1 // 10685
M=D // 10686
@6 // 10687
D=A // 10688
@SP // 10689
AM=M+1 // 10690
A=A-1 // 10691
M=D // 10692
@15 // 10693
D=A // 10694
@SP // 10695
AM=M+1 // 10696
A=A-1 // 10697
M=D // 10698
@6 // 10699
D=A // 10700
@SP // 10701
AM=M+1 // 10702
A=A-1 // 10703
M=D // 10704
@6 // 10705
D=A // 10706
@SP // 10707
AM=M+1 // 10708
A=A-1 // 10709
M=D // 10710
@6 // 10711
D=A // 10712
@SP // 10713
AM=M+1 // 10714
A=A-1 // 10715
M=D // 10716
@15 // 10717
D=A // 10718
@SP // 10719
AM=M+1 // 10720
A=A-1 // 10721
M=D // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=0 // 10726
@SP // 10727
AM=M+1 // 10728
A=A-1 // 10729
M=0 // 10730
// call Output.create
@17 // 10731
D=A // 10732
@14 // 10733
M=D // 10734
@Output.create // 10735
D=A // 10736
@13 // 10737
M=D // 10738
@Output.initMap.ret.72 // 10739
D=A // 10740
@CALL // 10741
0;JMP // 10742
(Output.initMap.ret.72)
@SP // 10743
M=M-1 // 10744

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 10745
D=A // 10746
@SP // 10747
M=D+M // 10748
@103 // 10749
D=A // 10750
@SP // 10751
A=M-1 // 10752
M=0 // 10753
A=A-1 // 10754
M=0 // 10755
A=A-1 // 10756
M=D // 10757
@30 // 10758
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
@51 // 10770
D=A // 10771
@SP // 10772
AM=M+1 // 10773
A=A-1 // 10774
M=D // 10775
@51 // 10776
D=A // 10777
@SP // 10778
AM=M+1 // 10779
A=A-1 // 10780
M=D // 10781
@62 // 10782
D=A // 10783
@SP // 10784
AM=M+1 // 10785
A=A-1 // 10786
M=D // 10787
@48 // 10788
D=A // 10789
@SP // 10790
AM=M+1 // 10791
A=A-1 // 10792
M=D // 10793
@51 // 10794
D=A // 10795
@SP // 10796
AM=M+1 // 10797
A=A-1 // 10798
M=D // 10799
@30 // 10800
D=A // 10801
@SP // 10802
AM=M+1 // 10803
A=A-1 // 10804
M=D // 10805
@SP // 10806
AM=M+1 // 10807
A=A-1 // 10808
M=0 // 10809
// call Output.create
@17 // 10810
D=A // 10811
@14 // 10812
M=D // 10813
@Output.create // 10814
D=A // 10815
@13 // 10816
M=D // 10817
@Output.initMap.ret.73 // 10818
D=A // 10819
@CALL // 10820
0;JMP // 10821
(Output.initMap.ret.73)
@SP // 10822
M=M-1 // 10823

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 10824
D=A // 10825
@SP // 10826
AM=M+1 // 10827
A=A-1 // 10828
M=D // 10829
@3 // 10830
D=A // 10831
@SP // 10832
AM=M+1 // 10833
A=A-1 // 10834
M=D // 10835
@3 // 10836
D=A // 10837
@SP // 10838
AM=M+1 // 10839
A=A-1 // 10840
M=D // 10841
@3 // 10842
D=A // 10843
@SP // 10844
AM=M+1 // 10845
A=A-1 // 10846
M=D // 10847
@27 // 10848
D=A // 10849
@SP // 10850
AM=M+1 // 10851
A=A-1 // 10852
M=D // 10853
@55 // 10854
D=A // 10855
@SP // 10856
AM=M+1 // 10857
A=A-1 // 10858
M=D // 10859
@51 // 10860
D=A // 10861
@SP // 10862
AM=M+1 // 10863
A=A-1 // 10864
M=D // 10865
@51 // 10866
D=A // 10867
@SP // 10868
AM=M+1 // 10869
A=A-1 // 10870
M=D // 10871
@51 // 10872
D=A // 10873
@SP // 10874
AM=M+1 // 10875
A=A-1 // 10876
M=D // 10877
@51 // 10878
D=A // 10879
@SP // 10880
AM=M+1 // 10881
A=A-1 // 10882
M=D // 10883
@SP // 10884
AM=M+1 // 10885
A=A-1 // 10886
M=0 // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=0 // 10891
// call Output.create
@17 // 10892
D=A // 10893
@14 // 10894
M=D // 10895
@Output.create // 10896
D=A // 10897
@13 // 10898
M=D // 10899
@Output.initMap.ret.74 // 10900
D=A // 10901
@CALL // 10902
0;JMP // 10903
(Output.initMap.ret.74)
@SP // 10904
M=M-1 // 10905

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 10906
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
@12 // 10918
D=A // 10919
@SP // 10920
AM=M+1 // 10921
A=A-1 // 10922
M=D // 10923
@SP // 10924
AM=M+1 // 10925
A=A-1 // 10926
M=0 // 10927
@14 // 10928
D=A // 10929
@SP // 10930
AM=M+1 // 10931
A=A-1 // 10932
M=D // 10933
@12 // 10934
D=A // 10935
@SP // 10936
AM=M+1 // 10937
A=A-1 // 10938
M=D // 10939
@12 // 10940
D=A // 10941
@SP // 10942
AM=M+1 // 10943
A=A-1 // 10944
M=D // 10945
@12 // 10946
D=A // 10947
@SP // 10948
AM=M+1 // 10949
A=A-1 // 10950
M=D // 10951
@12 // 10952
D=A // 10953
@SP // 10954
AM=M+1 // 10955
A=A-1 // 10956
M=D // 10957
@30 // 10958
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
// call Output.create
@17 // 10972
D=A // 10973
@14 // 10974
M=D // 10975
@Output.create // 10976
D=A // 10977
@13 // 10978
M=D // 10979
@Output.initMap.ret.75 // 10980
D=A // 10981
@CALL // 10982
0;JMP // 10983
(Output.initMap.ret.75)
@SP // 10984
M=M-1 // 10985

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 10986
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
@48 // 10998
D=A // 10999
@SP // 11000
AM=M+1 // 11001
A=A-1 // 11002
M=D // 11003
@SP // 11004
AM=M+1 // 11005
A=A-1 // 11006
M=0 // 11007
@56 // 11008
D=A // 11009
@SP // 11010
AM=M+1 // 11011
A=A-1 // 11012
M=D // 11013
@48 // 11014
D=A // 11015
@SP // 11016
AM=M+1 // 11017
A=A-1 // 11018
M=D // 11019
@48 // 11020
D=A // 11021
@SP // 11022
AM=M+1 // 11023
A=A-1 // 11024
M=D // 11025
@48 // 11026
D=A // 11027
@SP // 11028
AM=M+1 // 11029
A=A-1 // 11030
M=D // 11031
@48 // 11032
D=A // 11033
@SP // 11034
AM=M+1 // 11035
A=A-1 // 11036
M=D // 11037
@51 // 11038
D=A // 11039
@SP // 11040
AM=M+1 // 11041
A=A-1 // 11042
M=D // 11043
@30 // 11044
D=A // 11045
@SP // 11046
AM=M+1 // 11047
A=A-1 // 11048
M=D // 11049
@SP // 11050
AM=M+1 // 11051
A=A-1 // 11052
M=0 // 11053
// call Output.create
@17 // 11054
D=A // 11055
@14 // 11056
M=D // 11057
@Output.create // 11058
D=A // 11059
@13 // 11060
M=D // 11061
@Output.initMap.ret.76 // 11062
D=A // 11063
@CALL // 11064
0;JMP // 11065
(Output.initMap.ret.76)
@SP // 11066
M=M-1 // 11067

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11068
D=A // 11069
@SP // 11070
AM=M+1 // 11071
A=A-1 // 11072
M=D // 11073
@3 // 11074
D=A // 11075
@SP // 11076
AM=M+1 // 11077
A=A-1 // 11078
M=D // 11079
@3 // 11080
D=A // 11081
@SP // 11082
AM=M+1 // 11083
A=A-1 // 11084
M=D // 11085
@3 // 11086
D=A // 11087
@SP // 11088
AM=M+1 // 11089
A=A-1 // 11090
M=D // 11091
@51 // 11092
D=A // 11093
@SP // 11094
AM=M+1 // 11095
A=A-1 // 11096
M=D // 11097
@27 // 11098
D=A // 11099
@SP // 11100
AM=M+1 // 11101
A=A-1 // 11102
M=D // 11103
@15 // 11104
D=A // 11105
@SP // 11106
AM=M+1 // 11107
A=A-1 // 11108
M=D // 11109
@15 // 11110
D=A // 11111
@SP // 11112
AM=M+1 // 11113
A=A-1 // 11114
M=D // 11115
@27 // 11116
D=A // 11117
@SP // 11118
AM=M+1 // 11119
A=A-1 // 11120
M=D // 11121
@51 // 11122
D=A // 11123
@SP // 11124
AM=M+1 // 11125
A=A-1 // 11126
M=D // 11127
@SP // 11128
AM=M+1 // 11129
A=A-1 // 11130
M=0 // 11131
@SP // 11132
AM=M+1 // 11133
A=A-1 // 11134
M=0 // 11135
// call Output.create
@17 // 11136
D=A // 11137
@14 // 11138
M=D // 11139
@Output.create // 11140
D=A // 11141
@13 // 11142
M=D // 11143
@Output.initMap.ret.77 // 11144
D=A // 11145
@CALL // 11146
0;JMP // 11147
(Output.initMap.ret.77)
@SP // 11148
M=M-1 // 11149

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11150
D=A // 11151
@SP // 11152
AM=M+1 // 11153
A=A-1 // 11154
M=D // 11155
@14 // 11156
D=A // 11157
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=D // 11161
@12 // 11162
D=A // 11163
@SP // 11164
AM=M+1 // 11165
A=A-1 // 11166
M=D // 11167
@12 // 11168
D=A // 11169
@SP // 11170
AM=M+1 // 11171
A=A-1 // 11172
M=D // 11173
@12 // 11174
D=A // 11175
@SP // 11176
AM=M+1 // 11177
A=A-1 // 11178
M=D // 11179
@12 // 11180
D=A // 11181
@SP // 11182
AM=M+1 // 11183
A=A-1 // 11184
M=D // 11185
@12 // 11186
D=A // 11187
@SP // 11188
AM=M+1 // 11189
A=A-1 // 11190
M=D // 11191
@12 // 11192
D=A // 11193
@SP // 11194
AM=M+1 // 11195
A=A-1 // 11196
M=D // 11197
@12 // 11198
D=A // 11199
@SP // 11200
AM=M+1 // 11201
A=A-1 // 11202
M=D // 11203
@30 // 11204
D=A // 11205
@SP // 11206
AM=M+1 // 11207
A=A-1 // 11208
M=D // 11209
@SP // 11210
AM=M+1 // 11211
A=A-1 // 11212
M=0 // 11213
@SP // 11214
AM=M+1 // 11215
A=A-1 // 11216
M=0 // 11217
// call Output.create
@17 // 11218
D=A // 11219
@14 // 11220
M=D // 11221
@Output.create // 11222
D=A // 11223
@13 // 11224
M=D // 11225
@Output.initMap.ret.78 // 11226
D=A // 11227
@CALL // 11228
0;JMP // 11229
(Output.initMap.ret.78)
@SP // 11230
M=M-1 // 11231

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11232
D=A // 11233
@SP // 11234
M=D+M // 11235
@109 // 11236
D=A // 11237
@SP // 11238
A=M-1 // 11239
M=0 // 11240
A=A-1 // 11241
M=0 // 11242
A=A-1 // 11243
M=0 // 11244
A=A-1 // 11245
M=D // 11246
@29 // 11247
D=A // 11248
@SP // 11249
AM=M+1 // 11250
A=A-1 // 11251
M=D // 11252
@63 // 11253
D=A // 11254
@SP // 11255
AM=M+1 // 11256
A=A-1 // 11257
M=D // 11258
@43 // 11259
D=A // 11260
@SP // 11261
AM=M+1 // 11262
A=A-1 // 11263
M=D // 11264
@43 // 11265
D=A // 11266
@SP // 11267
AM=M+1 // 11268
A=A-1 // 11269
M=D // 11270
@43 // 11271
D=A // 11272
@SP // 11273
AM=M+1 // 11274
A=A-1 // 11275
M=D // 11276
@43 // 11277
D=A // 11278
@SP // 11279
AM=M+1 // 11280
A=A-1 // 11281
M=D // 11282
@SP // 11283
AM=M+1 // 11284
A=A-1 // 11285
M=0 // 11286
@SP // 11287
AM=M+1 // 11288
A=A-1 // 11289
M=0 // 11290
// call Output.create
@17 // 11291
D=A // 11292
@14 // 11293
M=D // 11294
@Output.create // 11295
D=A // 11296
@13 // 11297
M=D // 11298
@Output.initMap.ret.79 // 11299
D=A // 11300
@CALL // 11301
0;JMP // 11302
(Output.initMap.ret.79)
@SP // 11303
M=M-1 // 11304

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11305
D=A // 11306
@SP // 11307
M=D+M // 11308
@110 // 11309
D=A // 11310
@SP // 11311
A=M-1 // 11312
M=0 // 11313
A=A-1 // 11314
M=0 // 11315
A=A-1 // 11316
M=0 // 11317
A=A-1 // 11318
M=D // 11319
@29 // 11320
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
@51 // 11332
D=A // 11333
@SP // 11334
AM=M+1 // 11335
A=A-1 // 11336
M=D // 11337
@51 // 11338
D=A // 11339
@SP // 11340
AM=M+1 // 11341
A=A-1 // 11342
M=D // 11343
@51 // 11344
D=A // 11345
@SP // 11346
AM=M+1 // 11347
A=A-1 // 11348
M=D // 11349
@51 // 11350
D=A // 11351
@SP // 11352
AM=M+1 // 11353
A=A-1 // 11354
M=D // 11355
@SP // 11356
AM=M+1 // 11357
A=A-1 // 11358
M=0 // 11359
@SP // 11360
AM=M+1 // 11361
A=A-1 // 11362
M=0 // 11363
// call Output.create
@17 // 11364
D=A // 11365
@14 // 11366
M=D // 11367
@Output.create // 11368
D=A // 11369
@13 // 11370
M=D // 11371
@Output.initMap.ret.80 // 11372
D=A // 11373
@CALL // 11374
0;JMP // 11375
(Output.initMap.ret.80)
@SP // 11376
M=M-1 // 11377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11378
D=A // 11379
@SP // 11380
M=D+M // 11381
@111 // 11382
D=A // 11383
@SP // 11384
A=M-1 // 11385
M=0 // 11386
A=A-1 // 11387
M=0 // 11388
A=A-1 // 11389
M=0 // 11390
A=A-1 // 11391
M=D // 11392
@30 // 11393
D=A // 11394
@SP // 11395
AM=M+1 // 11396
A=A-1 // 11397
M=D // 11398
@51 // 11399
D=A // 11400
@SP // 11401
AM=M+1 // 11402
A=A-1 // 11403
M=D // 11404
@51 // 11405
D=A // 11406
@SP // 11407
AM=M+1 // 11408
A=A-1 // 11409
M=D // 11410
@51 // 11411
D=A // 11412
@SP // 11413
AM=M+1 // 11414
A=A-1 // 11415
M=D // 11416
@51 // 11417
D=A // 11418
@SP // 11419
AM=M+1 // 11420
A=A-1 // 11421
M=D // 11422
@30 // 11423
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
// call Output.create
@17 // 11437
D=A // 11438
@14 // 11439
M=D // 11440
@Output.create // 11441
D=A // 11442
@13 // 11443
M=D // 11444
@Output.initMap.ret.81 // 11445
D=A // 11446
@CALL // 11447
0;JMP // 11448
(Output.initMap.ret.81)
@SP // 11449
M=M-1 // 11450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11451
D=A // 11452
@SP // 11453
M=D+M // 11454
@112 // 11455
D=A // 11456
@SP // 11457
A=M-1 // 11458
M=0 // 11459
A=A-1 // 11460
M=0 // 11461
A=A-1 // 11462
M=0 // 11463
A=A-1 // 11464
M=D // 11465
@30 // 11466
D=A // 11467
@SP // 11468
AM=M+1 // 11469
A=A-1 // 11470
M=D // 11471
@51 // 11472
D=A // 11473
@SP // 11474
AM=M+1 // 11475
A=A-1 // 11476
M=D // 11477
@51 // 11478
D=A // 11479
@SP // 11480
AM=M+1 // 11481
A=A-1 // 11482
M=D // 11483
@51 // 11484
D=A // 11485
@SP // 11486
AM=M+1 // 11487
A=A-1 // 11488
M=D // 11489
@31 // 11490
D=A // 11491
@SP // 11492
AM=M+1 // 11493
A=A-1 // 11494
M=D // 11495
@3 // 11496
D=A // 11497
@SP // 11498
AM=M+1 // 11499
A=A-1 // 11500
M=D // 11501
@3 // 11502
D=A // 11503
@SP // 11504
AM=M+1 // 11505
A=A-1 // 11506
M=D // 11507
@SP // 11508
AM=M+1 // 11509
A=A-1 // 11510
M=0 // 11511
// call Output.create
@17 // 11512
D=A // 11513
@14 // 11514
M=D // 11515
@Output.create // 11516
D=A // 11517
@13 // 11518
M=D // 11519
@Output.initMap.ret.82 // 11520
D=A // 11521
@CALL // 11522
0;JMP // 11523
(Output.initMap.ret.82)
@SP // 11524
M=M-1 // 11525

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11526
D=A // 11527
@SP // 11528
M=D+M // 11529
@113 // 11530
D=A // 11531
@SP // 11532
A=M-1 // 11533
M=0 // 11534
A=A-1 // 11535
M=0 // 11536
A=A-1 // 11537
M=0 // 11538
A=A-1 // 11539
M=D // 11540
@30 // 11541
D=A // 11542
@SP // 11543
AM=M+1 // 11544
A=A-1 // 11545
M=D // 11546
@51 // 11547
D=A // 11548
@SP // 11549
AM=M+1 // 11550
A=A-1 // 11551
M=D // 11552
@51 // 11553
D=A // 11554
@SP // 11555
AM=M+1 // 11556
A=A-1 // 11557
M=D // 11558
@51 // 11559
D=A // 11560
@SP // 11561
AM=M+1 // 11562
A=A-1 // 11563
M=D // 11564
@62 // 11565
D=A // 11566
@SP // 11567
AM=M+1 // 11568
A=A-1 // 11569
M=D // 11570
@48 // 11571
D=A // 11572
@SP // 11573
AM=M+1 // 11574
A=A-1 // 11575
M=D // 11576
@48 // 11577
D=A // 11578
@SP // 11579
AM=M+1 // 11580
A=A-1 // 11581
M=D // 11582
@SP // 11583
AM=M+1 // 11584
A=A-1 // 11585
M=0 // 11586
// call Output.create
@17 // 11587
D=A // 11588
@14 // 11589
M=D // 11590
@Output.create // 11591
D=A // 11592
@13 // 11593
M=D // 11594
@Output.initMap.ret.83 // 11595
D=A // 11596
@CALL // 11597
0;JMP // 11598
(Output.initMap.ret.83)
@SP // 11599
M=M-1 // 11600

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11601
D=A // 11602
@SP // 11603
M=D+M // 11604
@114 // 11605
D=A // 11606
@SP // 11607
A=M-1 // 11608
M=0 // 11609
A=A-1 // 11610
M=0 // 11611
A=A-1 // 11612
M=0 // 11613
A=A-1 // 11614
M=D // 11615
@29 // 11616
D=A // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=D // 11621
@55 // 11622
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
@3 // 11634
D=A // 11635
@SP // 11636
AM=M+1 // 11637
A=A-1 // 11638
M=D // 11639
@3 // 11640
D=A // 11641
@SP // 11642
AM=M+1 // 11643
A=A-1 // 11644
M=D // 11645
@7 // 11646
D=A // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=D // 11651
@SP // 11652
AM=M+1 // 11653
A=A-1 // 11654
M=0 // 11655
@SP // 11656
AM=M+1 // 11657
A=A-1 // 11658
M=0 // 11659
// call Output.create
@17 // 11660
D=A // 11661
@14 // 11662
M=D // 11663
@Output.create // 11664
D=A // 11665
@13 // 11666
M=D // 11667
@Output.initMap.ret.84 // 11668
D=A // 11669
@CALL // 11670
0;JMP // 11671
(Output.initMap.ret.84)
@SP // 11672
M=M-1 // 11673

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11674
D=A // 11675
@SP // 11676
M=D+M // 11677
@115 // 11678
D=A // 11679
@SP // 11680
A=M-1 // 11681
M=0 // 11682
A=A-1 // 11683
M=0 // 11684
A=A-1 // 11685
M=0 // 11686
A=A-1 // 11687
M=D // 11688
@30 // 11689
D=A // 11690
@SP // 11691
AM=M+1 // 11692
A=A-1 // 11693
M=D // 11694
@51 // 11695
D=A // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=D // 11700
@6 // 11701
D=A // 11702
@SP // 11703
AM=M+1 // 11704
A=A-1 // 11705
M=D // 11706
@24 // 11707
D=A // 11708
@SP // 11709
AM=M+1 // 11710
A=A-1 // 11711
M=D // 11712
@51 // 11713
D=A // 11714
@SP // 11715
AM=M+1 // 11716
A=A-1 // 11717
M=D // 11718
@30 // 11719
D=A // 11720
@SP // 11721
AM=M+1 // 11722
A=A-1 // 11723
M=D // 11724
@SP // 11725
AM=M+1 // 11726
A=A-1 // 11727
M=0 // 11728
@SP // 11729
AM=M+1 // 11730
A=A-1 // 11731
M=0 // 11732
// call Output.create
@17 // 11733
D=A // 11734
@14 // 11735
M=D // 11736
@Output.create // 11737
D=A // 11738
@13 // 11739
M=D // 11740
@Output.initMap.ret.85 // 11741
D=A // 11742
@CALL // 11743
0;JMP // 11744
(Output.initMap.ret.85)
@SP // 11745
M=M-1 // 11746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 11747
D=A // 11748
@SP // 11749
AM=M+1 // 11750
A=A-1 // 11751
M=D // 11752
@4 // 11753
D=A // 11754
@SP // 11755
AM=M+1 // 11756
A=A-1 // 11757
M=D // 11758
@6 // 11759
D=A // 11760
@SP // 11761
AM=M+1 // 11762
A=A-1 // 11763
M=D // 11764
@6 // 11765
D=A // 11766
@SP // 11767
AM=M+1 // 11768
A=A-1 // 11769
M=D // 11770
@15 // 11771
D=A // 11772
@SP // 11773
AM=M+1 // 11774
A=A-1 // 11775
M=D // 11776
@6 // 11777
D=A // 11778
@SP // 11779
AM=M+1 // 11780
A=A-1 // 11781
M=D // 11782
@6 // 11783
D=A // 11784
@SP // 11785
AM=M+1 // 11786
A=A-1 // 11787
M=D // 11788
@6 // 11789
D=A // 11790
@SP // 11791
AM=M+1 // 11792
A=A-1 // 11793
M=D // 11794
@54 // 11795
D=A // 11796
@SP // 11797
AM=M+1 // 11798
A=A-1 // 11799
M=D // 11800
@28 // 11801
D=A // 11802
@SP // 11803
AM=M+1 // 11804
A=A-1 // 11805
M=D // 11806
@SP // 11807
AM=M+1 // 11808
A=A-1 // 11809
M=0 // 11810
@SP // 11811
AM=M+1 // 11812
A=A-1 // 11813
M=0 // 11814
// call Output.create
@17 // 11815
D=A // 11816
@14 // 11817
M=D // 11818
@Output.create // 11819
D=A // 11820
@13 // 11821
M=D // 11822
@Output.initMap.ret.86 // 11823
D=A // 11824
@CALL // 11825
0;JMP // 11826
(Output.initMap.ret.86)
@SP // 11827
M=M-1 // 11828

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11829
D=A // 11830
@SP // 11831
M=D+M // 11832
@117 // 11833
D=A // 11834
@SP // 11835
A=M-1 // 11836
M=0 // 11837
A=A-1 // 11838
M=0 // 11839
A=A-1 // 11840
M=0 // 11841
A=A-1 // 11842
M=D // 11843
@27 // 11844
D=A // 11845
@SP // 11846
AM=M+1 // 11847
A=A-1 // 11848
M=D // 11849
@27 // 11850
D=A // 11851
@SP // 11852
AM=M+1 // 11853
A=A-1 // 11854
M=D // 11855
@27 // 11856
D=A // 11857
@SP // 11858
AM=M+1 // 11859
A=A-1 // 11860
M=D // 11861
@27 // 11862
D=A // 11863
@SP // 11864
AM=M+1 // 11865
A=A-1 // 11866
M=D // 11867
@27 // 11868
D=A // 11869
@SP // 11870
AM=M+1 // 11871
A=A-1 // 11872
M=D // 11873
@54 // 11874
D=A // 11875
@SP // 11876
AM=M+1 // 11877
A=A-1 // 11878
M=D // 11879
@SP // 11880
AM=M+1 // 11881
A=A-1 // 11882
M=0 // 11883
@SP // 11884
AM=M+1 // 11885
A=A-1 // 11886
M=0 // 11887
// call Output.create
@17 // 11888
D=A // 11889
@14 // 11890
M=D // 11891
@Output.create // 11892
D=A // 11893
@13 // 11894
M=D // 11895
@Output.initMap.ret.87 // 11896
D=A // 11897
@CALL // 11898
0;JMP // 11899
(Output.initMap.ret.87)
@SP // 11900
M=M-1 // 11901

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11902
D=A // 11903
@SP // 11904
M=D+M // 11905
@118 // 11906
D=A // 11907
@SP // 11908
A=M-1 // 11909
M=0 // 11910
A=A-1 // 11911
M=0 // 11912
A=A-1 // 11913
M=0 // 11914
A=A-1 // 11915
M=D // 11916
@51 // 11917
D=A // 11918
@SP // 11919
AM=M+1 // 11920
A=A-1 // 11921
M=D // 11922
@51 // 11923
D=A // 11924
@SP // 11925
AM=M+1 // 11926
A=A-1 // 11927
M=D // 11928
@51 // 11929
D=A // 11930
@SP // 11931
AM=M+1 // 11932
A=A-1 // 11933
M=D // 11934
@51 // 11935
D=A // 11936
@SP // 11937
AM=M+1 // 11938
A=A-1 // 11939
M=D // 11940
@30 // 11941
D=A // 11942
@SP // 11943
AM=M+1 // 11944
A=A-1 // 11945
M=D // 11946
@12 // 11947
D=A // 11948
@SP // 11949
AM=M+1 // 11950
A=A-1 // 11951
M=D // 11952
@SP // 11953
AM=M+1 // 11954
A=A-1 // 11955
M=0 // 11956
@SP // 11957
AM=M+1 // 11958
A=A-1 // 11959
M=0 // 11960
// call Output.create
@17 // 11961
D=A // 11962
@14 // 11963
M=D // 11964
@Output.create // 11965
D=A // 11966
@13 // 11967
M=D // 11968
@Output.initMap.ret.88 // 11969
D=A // 11970
@CALL // 11971
0;JMP // 11972
(Output.initMap.ret.88)
@SP // 11973
M=M-1 // 11974

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11975
D=A // 11976
@SP // 11977
M=D+M // 11978
@119 // 11979
D=A // 11980
@SP // 11981
A=M-1 // 11982
M=0 // 11983
A=A-1 // 11984
M=0 // 11985
A=A-1 // 11986
M=0 // 11987
A=A-1 // 11988
M=D // 11989
@51 // 11990
D=A // 11991
@SP // 11992
AM=M+1 // 11993
A=A-1 // 11994
M=D // 11995
@51 // 11996
D=A // 11997
@SP // 11998
AM=M+1 // 11999
A=A-1 // 12000
M=D // 12001
@51 // 12002
D=A // 12003
@SP // 12004
AM=M+1 // 12005
A=A-1 // 12006
M=D // 12007
@63 // 12008
D=A // 12009
@SP // 12010
AM=M+1 // 12011
A=A-1 // 12012
M=D // 12013
@63 // 12014
D=A // 12015
@SP // 12016
AM=M+1 // 12017
A=A-1 // 12018
M=D // 12019
@18 // 12020
D=A // 12021
@SP // 12022
AM=M+1 // 12023
A=A-1 // 12024
M=D // 12025
@SP // 12026
AM=M+1 // 12027
A=A-1 // 12028
M=0 // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=0 // 12033
// call Output.create
@17 // 12034
D=A // 12035
@14 // 12036
M=D // 12037
@Output.create // 12038
D=A // 12039
@13 // 12040
M=D // 12041
@Output.initMap.ret.89 // 12042
D=A // 12043
@CALL // 12044
0;JMP // 12045
(Output.initMap.ret.89)
@SP // 12046
M=M-1 // 12047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12048
D=A // 12049
@SP // 12050
M=D+M // 12051
@120 // 12052
D=A // 12053
@SP // 12054
A=M-1 // 12055
M=0 // 12056
A=A-1 // 12057
M=0 // 12058
A=A-1 // 12059
M=0 // 12060
A=A-1 // 12061
M=D // 12062
@51 // 12063
D=A // 12064
@SP // 12065
AM=M+1 // 12066
A=A-1 // 12067
M=D // 12068
@30 // 12069
D=A // 12070
@SP // 12071
AM=M+1 // 12072
A=A-1 // 12073
M=D // 12074
@12 // 12075
D=A // 12076
@SP // 12077
AM=M+1 // 12078
A=A-1 // 12079
M=D // 12080
@12 // 12081
D=A // 12082
@SP // 12083
AM=M+1 // 12084
A=A-1 // 12085
M=D // 12086
@30 // 12087
D=A // 12088
@SP // 12089
AM=M+1 // 12090
A=A-1 // 12091
M=D // 12092
@51 // 12093
D=A // 12094
@SP // 12095
AM=M+1 // 12096
A=A-1 // 12097
M=D // 12098
@SP // 12099
AM=M+1 // 12100
A=A-1 // 12101
M=0 // 12102
@SP // 12103
AM=M+1 // 12104
A=A-1 // 12105
M=0 // 12106
// call Output.create
@17 // 12107
D=A // 12108
@14 // 12109
M=D // 12110
@Output.create // 12111
D=A // 12112
@13 // 12113
M=D // 12114
@Output.initMap.ret.90 // 12115
D=A // 12116
@CALL // 12117
0;JMP // 12118
(Output.initMap.ret.90)
@SP // 12119
M=M-1 // 12120

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12121
D=A // 12122
@SP // 12123
M=D+M // 12124
@121 // 12125
D=A // 12126
@SP // 12127
A=M-1 // 12128
M=0 // 12129
A=A-1 // 12130
M=0 // 12131
A=A-1 // 12132
M=0 // 12133
A=A-1 // 12134
M=D // 12135
@51 // 12136
D=A // 12137
@SP // 12138
AM=M+1 // 12139
A=A-1 // 12140
M=D // 12141
@51 // 12142
D=A // 12143
@SP // 12144
AM=M+1 // 12145
A=A-1 // 12146
M=D // 12147
@51 // 12148
D=A // 12149
@SP // 12150
AM=M+1 // 12151
A=A-1 // 12152
M=D // 12153
@62 // 12154
D=A // 12155
@SP // 12156
AM=M+1 // 12157
A=A-1 // 12158
M=D // 12159
@48 // 12160
D=A // 12161
@SP // 12162
AM=M+1 // 12163
A=A-1 // 12164
M=D // 12165
@24 // 12166
D=A // 12167
@SP // 12168
AM=M+1 // 12169
A=A-1 // 12170
M=D // 12171
@15 // 12172
D=A // 12173
@SP // 12174
AM=M+1 // 12175
A=A-1 // 12176
M=D // 12177
@SP // 12178
AM=M+1 // 12179
A=A-1 // 12180
M=0 // 12181
// call Output.create
@17 // 12182
D=A // 12183
@14 // 12184
M=D // 12185
@Output.create // 12186
D=A // 12187
@13 // 12188
M=D // 12189
@Output.initMap.ret.91 // 12190
D=A // 12191
@CALL // 12192
0;JMP // 12193
(Output.initMap.ret.91)
@SP // 12194
M=M-1 // 12195

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12196
D=A // 12197
@SP // 12198
M=D+M // 12199
@122 // 12200
D=A // 12201
@SP // 12202
A=M-1 // 12203
M=0 // 12204
A=A-1 // 12205
M=0 // 12206
A=A-1 // 12207
M=0 // 12208
A=A-1 // 12209
M=D // 12210
@63 // 12211
D=A // 12212
@SP // 12213
AM=M+1 // 12214
A=A-1 // 12215
M=D // 12216
@27 // 12217
D=A // 12218
@SP // 12219
AM=M+1 // 12220
A=A-1 // 12221
M=D // 12222
@12 // 12223
D=A // 12224
@SP // 12225
AM=M+1 // 12226
A=A-1 // 12227
M=D // 12228
@6 // 12229
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
@63 // 12241
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
@Output.initMap.ret.92 // 12263
D=A // 12264
@CALL // 12265
0;JMP // 12266
(Output.initMap.ret.92)
@SP // 12267
M=M-1 // 12268

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12269
D=A // 12270
@SP // 12271
AM=M+1 // 12272
A=A-1 // 12273
M=D // 12274
@56 // 12275
D=A // 12276
@SP // 12277
AM=M+1 // 12278
A=A-1 // 12279
M=D // 12280
@12 // 12281
D=A // 12282
@SP // 12283
AM=M+1 // 12284
A=A-1 // 12285
M=D // 12286
@12 // 12287
D=A // 12288
@SP // 12289
AM=M+1 // 12290
A=A-1 // 12291
M=D // 12292
@12 // 12293
D=A // 12294
@SP // 12295
AM=M+1 // 12296
A=A-1 // 12297
M=D // 12298
@7 // 12299
D=A // 12300
@SP // 12301
AM=M+1 // 12302
A=A-1 // 12303
M=D // 12304
@12 // 12305
D=A // 12306
@SP // 12307
AM=M+1 // 12308
A=A-1 // 12309
M=D // 12310
@12 // 12311
D=A // 12312
@SP // 12313
AM=M+1 // 12314
A=A-1 // 12315
M=D // 12316
@12 // 12317
D=A // 12318
@SP // 12319
AM=M+1 // 12320
A=A-1 // 12321
M=D // 12322
@56 // 12323
D=A // 12324
@SP // 12325
AM=M+1 // 12326
A=A-1 // 12327
M=D // 12328
@SP // 12329
AM=M+1 // 12330
A=A-1 // 12331
M=0 // 12332
@SP // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=0 // 12336
// call Output.create
@17 // 12337
D=A // 12338
@14 // 12339
M=D // 12340
@Output.create // 12341
D=A // 12342
@13 // 12343
M=D // 12344
@Output.initMap.ret.93 // 12345
D=A // 12346
@CALL // 12347
0;JMP // 12348
(Output.initMap.ret.93)
@SP // 12349
M=M-1 // 12350

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12351
D=A // 12352
@SP // 12353
AM=M+1 // 12354
A=A-1 // 12355
M=D // 12356
@12 // 12357
D=A // 12358
@SP // 12359
AM=M+1 // 12360
A=A-1 // 12361
M=D // 12362
@12 // 12363
D=A // 12364
@SP // 12365
AM=M+1 // 12366
A=A-1 // 12367
M=D // 12368
@12 // 12369
D=A // 12370
@SP // 12371
AM=M+1 // 12372
A=A-1 // 12373
M=D // 12374
@12 // 12375
D=A // 12376
@SP // 12377
AM=M+1 // 12378
A=A-1 // 12379
M=D // 12380
@12 // 12381
D=A // 12382
@SP // 12383
AM=M+1 // 12384
A=A-1 // 12385
M=D // 12386
@12 // 12387
D=A // 12388
@SP // 12389
AM=M+1 // 12390
A=A-1 // 12391
M=D // 12392
@12 // 12393
D=A // 12394
@SP // 12395
AM=M+1 // 12396
A=A-1 // 12397
M=D // 12398
@12 // 12399
D=A // 12400
@SP // 12401
AM=M+1 // 12402
A=A-1 // 12403
M=D // 12404
@12 // 12405
D=A // 12406
@SP // 12407
AM=M+1 // 12408
A=A-1 // 12409
M=D // 12410
@SP // 12411
AM=M+1 // 12412
A=A-1 // 12413
M=0 // 12414
@SP // 12415
AM=M+1 // 12416
A=A-1 // 12417
M=0 // 12418
// call Output.create
@17 // 12419
D=A // 12420
@14 // 12421
M=D // 12422
@Output.create // 12423
D=A // 12424
@13 // 12425
M=D // 12426
@Output.initMap.ret.94 // 12427
D=A // 12428
@CALL // 12429
0;JMP // 12430
(Output.initMap.ret.94)
@SP // 12431
M=M-1 // 12432

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12433
D=A // 12434
@SP // 12435
AM=M+1 // 12436
A=A-1 // 12437
M=D // 12438
@7 // 12439
D=A // 12440
@SP // 12441
AM=M+1 // 12442
A=A-1 // 12443
M=D // 12444
@12 // 12445
D=A // 12446
@SP // 12447
AM=M+1 // 12448
A=A-1 // 12449
M=D // 12450
@12 // 12451
D=A // 12452
@SP // 12453
AM=M+1 // 12454
A=A-1 // 12455
M=D // 12456
@12 // 12457
D=A // 12458
@SP // 12459
AM=M+1 // 12460
A=A-1 // 12461
M=D // 12462
@56 // 12463
D=A // 12464
@SP // 12465
AM=M+1 // 12466
A=A-1 // 12467
M=D // 12468
@12 // 12469
D=A // 12470
@SP // 12471
AM=M+1 // 12472
A=A-1 // 12473
M=D // 12474
@12 // 12475
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
@7 // 12487
D=A // 12488
@SP // 12489
AM=M+1 // 12490
A=A-1 // 12491
M=D // 12492
@SP // 12493
AM=M+1 // 12494
A=A-1 // 12495
M=0 // 12496
@SP // 12497
AM=M+1 // 12498
A=A-1 // 12499
M=0 // 12500
// call Output.create
@17 // 12501
D=A // 12502
@14 // 12503
M=D // 12504
@Output.create // 12505
D=A // 12506
@13 // 12507
M=D // 12508
@Output.initMap.ret.95 // 12509
D=A // 12510
@CALL // 12511
0;JMP // 12512
(Output.initMap.ret.95)
@SP // 12513
M=M-1 // 12514

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 12515
D=A // 12516
@SP // 12517
AM=M+1 // 12518
A=A-1 // 12519
M=D // 12520
@38 // 12521
D=A // 12522
@SP // 12523
AM=M+1 // 12524
A=A-1 // 12525
M=D // 12526
@45 // 12527
D=A // 12528
@SP // 12529
AM=M+1 // 12530
A=A-1 // 12531
M=D // 12532
@25 // 12533
D=A // 12534
@SP // 12535
AM=M+1 // 12536
A=A-1 // 12537
M=D // 12538
@SP // 12539
AM=M+1 // 12540
A=A-1 // 12541
M=0 // 12542
@SP // 12543
AM=M+1 // 12544
A=A-1 // 12545
M=0 // 12546
@SP // 12547
AM=M+1 // 12548
A=A-1 // 12549
M=0 // 12550
@SP // 12551
AM=M+1 // 12552
A=A-1 // 12553
M=0 // 12554
@SP // 12555
AM=M+1 // 12556
A=A-1 // 12557
M=0 // 12558
@SP // 12559
AM=M+1 // 12560
A=A-1 // 12561
M=0 // 12562
@SP // 12563
AM=M+1 // 12564
A=A-1 // 12565
M=0 // 12566
@SP // 12567
AM=M+1 // 12568
A=A-1 // 12569
M=0 // 12570
// call Output.create
@17 // 12571
D=A // 12572
@14 // 12573
M=D // 12574
@Output.create // 12575
D=A // 12576
@13 // 12577
M=D // 12578
@Output.initMap.ret.96 // 12579
D=A // 12580
@CALL // 12581
0;JMP // 12582
(Output.initMap.ret.96)
@SP // 12583
M=M-1 // 12584

////PushInstruction("constant 0")
@SP // 12585
AM=M+1 // 12586
A=A-1 // 12587
M=0 // 12588

////ReturnInstruction{}
@RETURN // 12589
0;JMP // 12590

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 12591
AM=M+1 // 12592
A=A-1 // 12593
M=0 // 12594

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 12595
D=A // 12596
@SP // 12597
AM=M+1 // 12598
A=A-1 // 12599
M=D // 12600
// call Array.new
@6 // 12601
D=A // 12602
@14 // 12603
M=D // 12604
@Array.new // 12605
D=A // 12606
@13 // 12607
M=D // 12608
@Output.create.ret.0 // 12609
D=A // 12610
@CALL // 12611
0;JMP // 12612
(Output.create.ret.0)
@SP // 12613
AM=M-1 // 12614
D=M // 12615
@LCL // 12616
A=M // 12617
M=D // 12618

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 12619
D=M // 12620
@SP // 12621
AM=M+1 // 12622
A=A-1 // 12623
M=D // 12624
@ARG // 12625
A=M // 12626
D=M // 12627
@SP // 12628
AM=M-1 // 12629
D=D+M // 12630
@SP // 12631
AM=M+1 // 12632
A=A-1 // 12633
M=D // 12634
@LCL // 12635
A=M // 12636
D=M // 12637
@SP // 12638
AM=M-1 // 12639
A=M // 12640
M=D // 12641

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 12642
A=M // 12643
D=M // 12644
@SP // 12645
AM=M+1 // 12646
A=A-1 // 12647
M=D // 12648
@ARG // 12649
A=M+1 // 12650
D=M // 12651
@SP // 12652
AM=M-1 // 12653
A=M // 12654
M=D // 12655

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 12656
A=M // 12657
D=M // 12658
@SP // 12659
AM=M+1 // 12660
A=A-1 // 12661
M=D+1 // 12662
@ARG // 12663
A=M+1 // 12664
A=A+1 // 12665
D=M // 12666
@SP // 12667
AM=M-1 // 12668
A=M // 12669
M=D // 12670

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 12671
A=M // 12672
D=M // 12673
@2 // 12674
D=D+A // 12675
@SP // 12676
AM=M+1 // 12677
A=A-1 // 12678
M=D // 12679
@ARG // 12680
A=M+1 // 12681
A=A+1 // 12682
A=A+1 // 12683
D=M // 12684
@SP // 12685
AM=M-1 // 12686
A=M // 12687
M=D // 12688

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 12689
A=M // 12690
D=M // 12691
@3 // 12692
D=D+A // 12693
@SP // 12694
AM=M+1 // 12695
A=A-1 // 12696
M=D // 12697
@ARG // 12698
D=M // 12699
@4 // 12700
A=D+A // 12701
D=M // 12702
@SP // 12703
AM=M-1 // 12704
A=M // 12705
M=D // 12706

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 12707
A=M // 12708
D=M // 12709
@4 // 12710
D=D+A // 12711
@SP // 12712
AM=M+1 // 12713
A=A-1 // 12714
M=D // 12715
@ARG // 12716
D=M // 12717
@5 // 12718
A=D+A // 12719
D=M // 12720
@SP // 12721
AM=M-1 // 12722
A=M // 12723
M=D // 12724

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 12725
A=M // 12726
D=M // 12727
@5 // 12728
D=D+A // 12729
@SP // 12730
AM=M+1 // 12731
A=A-1 // 12732
M=D // 12733
@ARG // 12734
D=M // 12735
@6 // 12736
A=D+A // 12737
D=M // 12738
@SP // 12739
AM=M-1 // 12740
A=M // 12741
M=D // 12742

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 12743
A=M // 12744
D=M // 12745
@6 // 12746
D=D+A // 12747
@SP // 12748
AM=M+1 // 12749
A=A-1 // 12750
M=D // 12751
@ARG // 12752
D=M // 12753
@7 // 12754
A=D+A // 12755
D=M // 12756
@SP // 12757
AM=M-1 // 12758
A=M // 12759
M=D // 12760

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 12761
A=M // 12762
D=M // 12763
@7 // 12764
D=D+A // 12765
@SP // 12766
AM=M+1 // 12767
A=A-1 // 12768
M=D // 12769
@ARG // 12770
D=M // 12771
@8 // 12772
A=D+A // 12773
D=M // 12774
@SP // 12775
AM=M-1 // 12776
A=M // 12777
M=D // 12778

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 12779
A=M // 12780
D=M // 12781
@8 // 12782
D=D+A // 12783
@SP // 12784
AM=M+1 // 12785
A=A-1 // 12786
M=D // 12787
@ARG // 12788
D=M // 12789
@9 // 12790
A=D+A // 12791
D=M // 12792
@SP // 12793
AM=M-1 // 12794
A=M // 12795
M=D // 12796

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 12797
A=M // 12798
D=M // 12799
@9 // 12800
D=D+A // 12801
@SP // 12802
AM=M+1 // 12803
A=A-1 // 12804
M=D // 12805
@ARG // 12806
D=M // 12807
@10 // 12808
A=D+A // 12809
D=M // 12810
@SP // 12811
AM=M-1 // 12812
A=M // 12813
M=D // 12814

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 12815
A=M // 12816
D=M // 12817
@10 // 12818
D=D+A // 12819
@SP // 12820
AM=M+1 // 12821
A=A-1 // 12822
M=D // 12823
@ARG // 12824
D=M // 12825
@11 // 12826
A=D+A // 12827
D=M // 12828
@SP // 12829
AM=M-1 // 12830
A=M // 12831
M=D // 12832

////PushInstruction("constant 0")
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=0 // 12836

////ReturnInstruction{}
@RETURN // 12837
0;JMP // 12838

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
@Output.getMap.EQ.0 // 12839
D=A // 12840
@SP // 12841
AM=M+1 // 12842
A=A-1 // 12843
M=D // 12844
@Output.getMap.LT.1 // 12845
D=A // 12846
@SP // 12847
AM=M+1 // 12848
A=A-1 // 12849
M=D // 12850
@ARG // 12851
A=M // 12852
D=M // 12853
@32 // 12854
D=D-A // 12855
@DO_LT // 12856
0;JMP // 12857
(Output.getMap.LT.1)
@SP // 12858
AM=M+1 // 12859
A=A-1 // 12860
M=D // 12861
@Output.getMap.GT.2 // 12862
D=A // 12863
@SP // 12864
AM=M+1 // 12865
A=A-1 // 12866
M=D // 12867
@ARG // 12868
A=M // 12869
D=M // 12870
@126 // 12871
D=D-A // 12872
@DO_GT // 12873
0;JMP // 12874
(Output.getMap.GT.2)
@SP // 12875
AM=M-1 // 12876
D=D|M // 12877
@DO_EQ // 12878
0;JMP // 12879
(Output.getMap.EQ.0)
@Output.getMap.IfElse1 // 12880
D;JNE // 12881

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 12882
A=M // 12883
M=0 // 12884

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 12885
0;JMP // 12886

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
@Output.0 // 12887
D=M // 12888
@SP // 12889
AM=M+1 // 12890
A=A-1 // 12891
M=D // 12892
@ARG // 12893
A=M // 12894
D=M // 12895
@SP // 12896
AM=M-1 // 12897
A=D+M // 12898
D=M // 12899
@SP // 12900
AM=M+1 // 12901
A=A-1 // 12902
M=D // 12903

////ReturnInstruction{}
@RETURN // 12904
0;JMP // 12905

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 12906
A=M+1 // 12907
D=M // 12908
@Output.1 // 12909
M=D // 12910

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 12911
A=M // 12912
D=M // 12913
@Output.2 // 12914
M=D // 12915

////PushInstruction("constant 0")
@SP // 12916
AM=M+1 // 12917
A=A-1 // 12918
M=0 // 12919

////ReturnInstruction{}
@RETURN // 12920
0;JMP // 12921

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 12922
D=A // 12923
@SP // 12924
AM=D+M // 12925
A=A-1 // 12926
M=0 // 12927
A=A-1 // 12928
M=0 // 12929
A=A-1 // 12930
M=0 // 12931
A=A-1 // 12932
M=0 // 12933

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12934
A=M // 12935
D=M // 12936
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=D // 12940
// call Output.getMap
@6 // 12941
D=A // 12942
@14 // 12943
M=D // 12944
@Output.getMap // 12945
D=A // 12946
@13 // 12947
M=D // 12948
@Output.printChar.ret.0 // 12949
D=A // 12950
@CALL // 12951
0;JMP // 12952
(Output.printChar.ret.0)
@SP // 12953
AM=M-1 // 12954
D=M // 12955
@LCL // 12956
A=M // 12957
M=D // 12958

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12959
A=M+1 // 12960
A=A+1 // 12961
A=A+1 // 12962
M=0 // 12963

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
@Output.printChar.LT.3 // 12964
D=A // 12965
@SP // 12966
AM=M+1 // 12967
A=A-1 // 12968
M=D // 12969
@LCL // 12970
A=M+1 // 12971
A=A+1 // 12972
A=A+1 // 12973
D=M // 12974
@11 // 12975
D=D-A // 12976
@DO_LT // 12977
0;JMP // 12978
(Output.printChar.LT.3)
D=!D // 12979
@WHILE_END_Output.printChar1 // 12980
D;JNE // 12981

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

@Output.2 // 12982
D=M // 12983
@SP // 12984
AM=M+1 // 12985
A=A-1 // 12986
M=D // 12987
@11 // 12988
D=A // 12989
@SP // 12990
AM=M+1 // 12991
A=A-1 // 12992
M=D // 12993
// call Math.multiply
@7 // 12994
D=A // 12995
@14 // 12996
M=D // 12997
@Math.multiply // 12998
D=A // 12999
@13 // 13000
M=D // 13001
@Output.printChar.ret.1 // 13002
D=A // 13003
@CALL // 13004
0;JMP // 13005
(Output.printChar.ret.1)
@LCL // 13006
A=M+1 // 13007
A=A+1 // 13008
A=A+1 // 13009
D=M // 13010
@SP // 13011
AM=M-1 // 13012
D=D+M // 13013
@SP // 13014
AM=M+1 // 13015
A=A-1 // 13016
M=D // 13017
@32 // 13018
D=A // 13019
@SP // 13020
AM=M+1 // 13021
A=A-1 // 13022
M=D // 13023
// call Math.multiply
@7 // 13024
D=A // 13025
@14 // 13026
M=D // 13027
@Math.multiply // 13028
D=A // 13029
@13 // 13030
M=D // 13031
@Output.printChar.ret.2 // 13032
D=A // 13033
@CALL // 13034
0;JMP // 13035
(Output.printChar.ret.2)
@SP // 13036
AM=M-1 // 13037
D=M // 13038
@16384 // 13039
D=D+A // 13040
@SP // 13041
AM=M+1 // 13042
A=A-1 // 13043
M=D // 13044
@Output.1 // 13045
D=M // 13046
@SP // 13047
AM=M+1 // 13048
A=A-1 // 13049
M=D // 13050
@2 // 13051
D=A // 13052
@SP // 13053
AM=M+1 // 13054
A=A-1 // 13055
M=D // 13056
// call Math.divide
@7 // 13057
D=A // 13058
@14 // 13059
M=D // 13060
@Math.divide // 13061
D=A // 13062
@13 // 13063
M=D // 13064
@Output.printChar.ret.3 // 13065
D=A // 13066
@CALL // 13067
0;JMP // 13068
(Output.printChar.ret.3)
@SP // 13069
AM=M-1 // 13070
D=M // 13071
@SP // 13072
AM=M-1 // 13073
D=D+M // 13074
@LCL // 13075
A=M+1 // 13076
M=D // 13077

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
@Output.printChar.EQ.4 // 13078
D=A // 13079
@SP // 13080
AM=M+1 // 13081
A=A-1 // 13082
M=D // 13083
@Output.1 // 13084
D=M // 13085
@1 // 13086
D=D&A // 13087
@DO_EQ // 13088
0;JMP // 13089
(Output.printChar.EQ.4)
@Output.printChar.IfElse1 // 13090
D;JEQ // 13091

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

@LCL // 13092
A=M+1 // 13093
A=A+1 // 13094
A=A+1 // 13095
D=M // 13096
A=A-1 // 13097
A=A-1 // 13098
A=A-1 // 13099
A=D+M // 13100
D=M // 13101
@LCL // 13102
A=M+1 // 13103
A=A+1 // 13104
M=D // 13105

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 13106
0;JMP // 13107

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

@LCL // 13108
A=M+1 // 13109
A=A+1 // 13110
A=A+1 // 13111
D=M // 13112
A=A-1 // 13113
A=A-1 // 13114
A=A-1 // 13115
A=D+M // 13116
D=M // 13117
@SP // 13118
AM=M+1 // 13119
A=A-1 // 13120
M=D // 13121
@256 // 13122
D=A // 13123
@SP // 13124
AM=M+1 // 13125
A=A-1 // 13126
M=D // 13127
// call Math.multiply
@7 // 13128
D=A // 13129
@14 // 13130
M=D // 13131
@Math.multiply // 13132
D=A // 13133
@13 // 13134
M=D // 13135
@Output.printChar.ret.4 // 13136
D=A // 13137
@CALL // 13138
0;JMP // 13139
(Output.printChar.ret.4)
@SP // 13140
AM=M-1 // 13141
D=M // 13142
@LCL // 13143
A=M+1 // 13144
A=A+1 // 13145
M=D // 13146

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
@LCL // 13147
A=M+1 // 13148
D=M // 13149
@SP // 13150
AM=M+1 // 13151
A=A-1 // 13152
M=D // 13153
@LCL // 13154
A=M+1 // 13155
D=M // 13156
@0 // 13157
A=D+A // 13158
D=M // 13159
@SP // 13160
AM=M+1 // 13161
A=A-1 // 13162
M=D // 13163
@LCL // 13164
A=M+1 // 13165
A=A+1 // 13166
D=M // 13167
@SP // 13168
AM=M-1 // 13169
D=D|M // 13170
@SP // 13171
AM=M-1 // 13172
A=M // 13173
M=D // 13174

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

@LCL // 13175
A=M+1 // 13176
A=A+1 // 13177
A=A+1 // 13178
D=M // 13179
D=D+1 // 13180
@LCL // 13181
A=M+1 // 13182
A=A+1 // 13183
A=A+1 // 13184
M=D // 13185

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 13186
0;JMP // 13187

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
@Output.printChar.EQ.5 // 13188
D=A // 13189
@SP // 13190
AM=M+1 // 13191
A=A-1 // 13192
M=D // 13193
@Output.1 // 13194
D=M // 13195
@63 // 13196
D=D-A // 13197
@DO_EQ // 13198
0;JMP // 13199
(Output.printChar.EQ.5)
D=!D // 13200
@Output.printChar.IfElse2 // 13201
D;JNE // 13202

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 13203
D=A // 13204
@14 // 13205
M=D // 13206
@Output.println // 13207
D=A // 13208
@13 // 13209
M=D // 13210
@Output.printChar.ret.5 // 13211
D=A // 13212
@CALL // 13213
0;JMP // 13214
(Output.printChar.ret.5)
@SP // 13215
M=M-1 // 13216

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 13217
0;JMP // 13218

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

@Output.1 // 13219
D=M // 13220
D=D+1 // 13221
@Output.1 // 13222
M=D // 13223

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 13224
AM=M+1 // 13225
A=A-1 // 13226
M=0 // 13227

////ReturnInstruction{}
@RETURN // 13228
0;JMP // 13229

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 13230
M=M+1 // 13231
AM=M+1 // 13232
A=A-1 // 13233
M=0 // 13234
A=A-1 // 13235
M=0 // 13236

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13237
A=M // 13238
M=0 // 13239

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13240
A=M // 13241
D=M // 13242
@SP // 13243
AM=M+1 // 13244
A=A-1 // 13245
M=D // 13246
// call String.length
@6 // 13247
D=A // 13248
@14 // 13249
M=D // 13250
@String.length // 13251
D=A // 13252
@13 // 13253
M=D // 13254
@Output.printString.ret.0 // 13255
D=A // 13256
@CALL // 13257
0;JMP // 13258
(Output.printString.ret.0)
@SP // 13259
AM=M-1 // 13260
D=M // 13261
@LCL // 13262
A=M+1 // 13263
M=D // 13264

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
@Output.printString.LT.6 // 13265
D=A // 13266
@SP // 13267
AM=M+1 // 13268
A=A-1 // 13269
M=D // 13270
@LCL // 13271
A=M+1 // 13272
D=M // 13273
A=A-1 // 13274
D=M-D // 13275
@DO_LT // 13276
0;JMP // 13277
(Output.printString.LT.6)
D=!D // 13278
@WHILE_END_Output.printString1 // 13279
D;JNE // 13280

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13281
A=M // 13282
D=M // 13283
@SP // 13284
AM=M+1 // 13285
A=A-1 // 13286
M=D // 13287
@LCL // 13288
A=M // 13289
D=M // 13290
@SP // 13291
AM=M+1 // 13292
A=A-1 // 13293
M=D // 13294
// call String.charAt
@7 // 13295
D=A // 13296
@14 // 13297
M=D // 13298
@String.charAt // 13299
D=A // 13300
@13 // 13301
M=D // 13302
@Output.printString.ret.1 // 13303
D=A // 13304
@CALL // 13305
0;JMP // 13306
(Output.printString.ret.1)
// call Output.printChar
@6 // 13307
D=A // 13308
@14 // 13309
M=D // 13310
@Output.printChar // 13311
D=A // 13312
@13 // 13313
M=D // 13314
@Output.printString.ret.2 // 13315
D=A // 13316
@CALL // 13317
0;JMP // 13318
(Output.printString.ret.2)
@SP // 13319
M=M-1 // 13320

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

@LCL // 13321
A=M // 13322
D=M // 13323
D=D+1 // 13324
@LCL // 13325
A=M // 13326
M=D // 13327

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 13328
0;JMP // 13329

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 13330
AM=M+1 // 13331
A=A-1 // 13332
M=0 // 13333

////ReturnInstruction{}
@RETURN // 13334
0;JMP // 13335

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 13336
AM=M+1 // 13337
A=A-1 // 13338
M=0 // 13339

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 13340
D=A // 13341
@SP // 13342
AM=M+1 // 13343
A=A-1 // 13344
M=D // 13345
// call String.new
@6 // 13346
D=A // 13347
@14 // 13348
M=D // 13349
@String.new // 13350
D=A // 13351
@13 // 13352
M=D // 13353
@Output.printInt.ret.0 // 13354
D=A // 13355
@CALL // 13356
0;JMP // 13357
(Output.printInt.ret.0)
@SP // 13358
AM=M-1 // 13359
D=M // 13360
@LCL // 13361
A=M // 13362
M=D // 13363

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13364
A=M // 13365
D=M // 13366
@SP // 13367
AM=M+1 // 13368
A=A-1 // 13369
M=D // 13370
@ARG // 13371
A=M // 13372
D=M // 13373
@SP // 13374
AM=M+1 // 13375
A=A-1 // 13376
M=D // 13377
// call String.setInt
@7 // 13378
D=A // 13379
@14 // 13380
M=D // 13381
@String.setInt // 13382
D=A // 13383
@13 // 13384
M=D // 13385
@Output.printInt.ret.1 // 13386
D=A // 13387
@CALL // 13388
0;JMP // 13389
(Output.printInt.ret.1)
@SP // 13390
M=M-1 // 13391

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13392
A=M // 13393
D=M // 13394
@SP // 13395
AM=M+1 // 13396
A=A-1 // 13397
M=D // 13398
// call Output.printString
@6 // 13399
D=A // 13400
@14 // 13401
M=D // 13402
@Output.printString // 13403
D=A // 13404
@13 // 13405
M=D // 13406
@Output.printInt.ret.2 // 13407
D=A // 13408
@CALL // 13409
0;JMP // 13410
(Output.printInt.ret.2)
@SP // 13411
M=M-1 // 13412

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13413
A=M // 13414
D=M // 13415
@SP // 13416
AM=M+1 // 13417
A=A-1 // 13418
M=D // 13419
// call String.dispose
@6 // 13420
D=A // 13421
@14 // 13422
M=D // 13423
@String.dispose // 13424
D=A // 13425
@13 // 13426
M=D // 13427
@Output.printInt.ret.3 // 13428
D=A // 13429
@CALL // 13430
0;JMP // 13431
(Output.printInt.ret.3)
@SP // 13432
M=M-1 // 13433

////PushInstruction("constant 0")
@SP // 13434
AM=M+1 // 13435
A=A-1 // 13436
M=0 // 13437

////ReturnInstruction{}
@RETURN // 13438
0;JMP // 13439

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13440
M=0 // 13441

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
@Output.println.EQ.7 // 13442
D=A // 13443
@SP // 13444
AM=M+1 // 13445
A=A-1 // 13446
M=D // 13447
@Output.2 // 13448
D=M // 13449
@22 // 13450
D=D-A // 13451
@DO_EQ // 13452
0;JMP // 13453
(Output.println.EQ.7)
D=!D // 13454
@Output.println.IfElse1 // 13455
D;JNE // 13456

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13457
M=0 // 13458

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 13459
0;JMP // 13460

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

@Output.2 // 13461
D=M // 13462
D=D+1 // 13463
@Output.2 // 13464
M=D // 13465

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13466
AM=M+1 // 13467
A=A-1 // 13468
M=0 // 13469

////ReturnInstruction{}
@RETURN // 13470
0;JMP // 13471

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
@Output.backSpace.EQ.8 // 13472
D=A // 13473
@SP // 13474
AM=M+1 // 13475
A=A-1 // 13476
M=D // 13477
@Output.1 // 13478
D=M // 13479
@DO_EQ // 13480
0;JMP // 13481
(Output.backSpace.EQ.8)
@Output.backSpace.IfElse1 // 13482
D;JEQ // 13483

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

@Output.2 // 13484
D=M // 13485
D=D-1 // 13486
@Output.2 // 13487
M=D // 13488

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 13489
D=A // 13490
@Output.1 // 13491
M=D // 13492

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 13493
0;JMP // 13494

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

@Output.1 // 13495
D=M // 13496
D=D-1 // 13497
@Output.1 // 13498
M=D // 13499

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13500
AM=M+1 // 13501
A=A-1 // 13502
M=0 // 13503

////ReturnInstruction{}
@RETURN // 13504
0;JMP // 13505

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 13506
M=-1 // 13507

////PushInstruction("constant 0")
@SP // 13508
AM=M+1 // 13509
A=A-1 // 13510
M=0 // 13511

////ReturnInstruction{}
@RETURN // 13512
0;JMP // 13513

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13514
A=M // 13515
D=M // 13516
@Screen.0 // 13517
M=D // 13518

////PushInstruction("constant 0")
@SP // 13519
AM=M+1 // 13520
A=A-1 // 13521
M=0 // 13522

////ReturnInstruction{}
@RETURN // 13523
0;JMP // 13524

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 13525
M=M+1 // 13526
AM=M+1 // 13527
A=A-1 // 13528
M=0 // 13529
A=A-1 // 13530
M=0 // 13531

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

@ARG // 13532
A=M+1 // 13533
D=M // 13534
@SP // 13535
AM=M+1 // 13536
A=A-1 // 13537
M=D // 13538
@32 // 13539
D=A // 13540
@SP // 13541
AM=M+1 // 13542
A=A-1 // 13543
M=D // 13544
// call Math.multiply
@7 // 13545
D=A // 13546
@14 // 13547
M=D // 13548
@Math.multiply // 13549
D=A // 13550
@13 // 13551
M=D // 13552
@Screen.drawPixel.ret.0 // 13553
D=A // 13554
@CALL // 13555
0;JMP // 13556
(Screen.drawPixel.ret.0)
@ARG // 13557
A=M // 13558
D=M // 13559
@SP // 13560
AM=M+1 // 13561
A=A-1 // 13562
M=D // 13563
@16 // 13564
D=A // 13565
@SP // 13566
AM=M+1 // 13567
A=A-1 // 13568
M=D // 13569
// call Math.divide
@7 // 13570
D=A // 13571
@14 // 13572
M=D // 13573
@Math.divide // 13574
D=A // 13575
@13 // 13576
M=D // 13577
@Screen.drawPixel.ret.1 // 13578
D=A // 13579
@CALL // 13580
0;JMP // 13581
(Screen.drawPixel.ret.1)
@SP // 13582
AM=M-1 // 13583
D=M // 13584
@SP // 13585
AM=M-1 // 13586
D=D+M // 13587
@16384 // 13588
D=D+A // 13589
@LCL // 13590
A=M // 13591
M=D // 13592

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

@ARG // 13593
A=M // 13594
D=M // 13595
@15 // 13596
D=D&A // 13597
@LCL // 13598
A=M+1 // 13599
M=D // 13600

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
@Screen.drawPixel.EQ.0 // 13601
D=A // 13602
@SP // 13603
AM=M+1 // 13604
A=A-1 // 13605
M=D // 13606
@Screen.drawPixel.EQ.1 // 13607
D=A // 13608
@SP // 13609
AM=M+1 // 13610
A=A-1 // 13611
M=D // 13612
@Screen.0 // 13613
D=M // 13614
@DO_EQ // 13615
0;JMP // 13616
(Screen.drawPixel.EQ.1)
D=!D // 13617
@DO_EQ // 13618
0;JMP // 13619
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 13620
D;JNE // 13621

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
@LCL // 13622
A=M // 13623
D=M // 13624
@SP // 13625
AM=M+1 // 13626
A=A-1 // 13627
M=D // 13628
@LCL // 13629
A=M // 13630
D=M // 13631
@0 // 13632
A=D+A // 13633
D=M // 13634
@SP // 13635
AM=M+1 // 13636
A=A-1 // 13637
M=D // 13638
@LCL // 13639
A=M+1 // 13640
D=M // 13641
@SP // 13642
AM=M+1 // 13643
A=A-1 // 13644
M=D // 13645
// call Math.twoToThe
@6 // 13646
D=A // 13647
@14 // 13648
M=D // 13649
@Math.twoToThe // 13650
D=A // 13651
@13 // 13652
M=D // 13653
@Screen.drawPixel.ret.2 // 13654
D=A // 13655
@CALL // 13656
0;JMP // 13657
(Screen.drawPixel.ret.2)
@SP // 13658
AM=M-1 // 13659
D=M // 13660
@SP // 13661
AM=M-1 // 13662
D=D|M // 13663
@SP // 13664
AM=M-1 // 13665
A=M // 13666
M=D // 13667

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 13668
0;JMP // 13669

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
@LCL // 13670
A=M // 13671
D=M // 13672
@SP // 13673
AM=M+1 // 13674
A=A-1 // 13675
M=D // 13676
@LCL // 13677
A=M // 13678
D=M // 13679
@0 // 13680
A=D+A // 13681
D=M // 13682
@SP // 13683
AM=M+1 // 13684
A=A-1 // 13685
M=D // 13686
@LCL // 13687
A=M+1 // 13688
D=M // 13689
@SP // 13690
AM=M+1 // 13691
A=A-1 // 13692
M=D // 13693
// call Math.twoToThe
@6 // 13694
D=A // 13695
@14 // 13696
M=D // 13697
@Math.twoToThe // 13698
D=A // 13699
@13 // 13700
M=D // 13701
@Screen.drawPixel.ret.3 // 13702
D=A // 13703
@CALL // 13704
0;JMP // 13705
(Screen.drawPixel.ret.3)
@SP // 13706
AM=M-1 // 13707
D=M // 13708
D=!D // 13709
@SP // 13710
AM=M-1 // 13711
D=D&M // 13712
@SP // 13713
AM=M-1 // 13714
A=M // 13715
M=D // 13716

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 13717
AM=M+1 // 13718
A=A-1 // 13719
M=0 // 13720

////ReturnInstruction{}
@RETURN // 13721
0;JMP // 13722

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 13723
D=A // 13724
@SP // 13725
AM=D+M // 13726
A=A-1 // 13727
M=0 // 13728
A=A-1 // 13729
M=0 // 13730
A=A-1 // 13731
M=0 // 13732
A=A-1 // 13733
M=0 // 13734
A=A-1 // 13735
M=0 // 13736
A=A-1 // 13737
M=0 // 13738

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

@ARG // 13739
A=M+1 // 13740
A=A+1 // 13741
D=M // 13742
A=A-1 // 13743
A=A-1 // 13744
D=D-M // 13745
@SP // 13746
AM=M+1 // 13747
A=A-1 // 13748
M=D // 13749
// call Math.abs
@6 // 13750
D=A // 13751
@14 // 13752
M=D // 13753
@Math.abs // 13754
D=A // 13755
@13 // 13756
M=D // 13757
@Screen.drawLine.ret.0 // 13758
D=A // 13759
@CALL // 13760
0;JMP // 13761
(Screen.drawLine.ret.0)
@SP // 13762
AM=M-1 // 13763
D=M // 13764
@LCL // 13765
A=M // 13766
M=D // 13767

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

@ARG // 13768
A=M+1 // 13769
A=A+1 // 13770
A=A+1 // 13771
D=M // 13772
A=A-1 // 13773
A=A-1 // 13774
D=D-M // 13775
@SP // 13776
AM=M+1 // 13777
A=A-1 // 13778
M=D // 13779
// call Math.abs
@6 // 13780
D=A // 13781
@14 // 13782
M=D // 13783
@Math.abs // 13784
D=A // 13785
@13 // 13786
M=D // 13787
@Screen.drawLine.ret.1 // 13788
D=A // 13789
@CALL // 13790
0;JMP // 13791
(Screen.drawLine.ret.1)
@SP // 13792
AM=M-1 // 13793
D=M // 13794
@LCL // 13795
A=M+1 // 13796
M=D // 13797

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
@Screen.drawLine.LT.2 // 13798
D=A // 13799
@SP // 13800
AM=M+1 // 13801
A=A-1 // 13802
M=D // 13803
@ARG // 13804
A=M+1 // 13805
A=A+1 // 13806
D=M // 13807
A=A-1 // 13808
A=A-1 // 13809
D=M-D // 13810
@DO_LT // 13811
0;JMP // 13812
(Screen.drawLine.LT.2)
D=!D // 13813
@Screen.drawLine.IfElse1 // 13814
D;JNE // 13815

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13816
A=M+1 // 13817
A=A+1 // 13818
M=1 // 13819

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 13820
0;JMP // 13821

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13822
A=M+1 // 13823
A=A+1 // 13824
M=-1 // 13825

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
@Screen.drawLine.LT.3 // 13826
D=A // 13827
@SP // 13828
AM=M+1 // 13829
A=A-1 // 13830
M=D // 13831
@ARG // 13832
A=M+1 // 13833
A=A+1 // 13834
A=A+1 // 13835
D=M // 13836
A=A-1 // 13837
A=A-1 // 13838
D=M-D // 13839
@DO_LT // 13840
0;JMP // 13841
(Screen.drawLine.LT.3)
D=!D // 13842
@Screen.drawLine.IfElse2 // 13843
D;JNE // 13844

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13845
A=M+1 // 13846
A=A+1 // 13847
A=A+1 // 13848
M=1 // 13849

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 13850
0;JMP // 13851

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13852
A=M+1 // 13853
A=A+1 // 13854
A=A+1 // 13855
M=-1 // 13856

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

@LCL // 13857
A=M+1 // 13858
D=M // 13859
A=A-1 // 13860
D=M-D // 13861
@SP // 13862
AM=M+1 // 13863
A=A-1 // 13864
M=D // 13865
@LCL // 13866
D=M // 13867
@4 // 13868
A=D+A // 13869
D=A // 13870
@R13 // 13871
M=D // 13872
@SP // 13873
AM=M-1 // 13874
D=M // 13875
@R13 // 13876
A=M // 13877
M=D // 13878

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
D=0 // 13879
@WHILE_END_Screen.drawLine1 // 13880
D;JNE // 13881

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13882
A=M // 13883
D=M // 13884
@SP // 13885
AM=M+1 // 13886
A=A-1 // 13887
M=D // 13888
@ARG // 13889
A=M+1 // 13890
D=M // 13891
@SP // 13892
AM=M+1 // 13893
A=A-1 // 13894
M=D // 13895
// call Screen.drawPixel
@7 // 13896
D=A // 13897
@14 // 13898
M=D // 13899
@Screen.drawPixel // 13900
D=A // 13901
@13 // 13902
M=D // 13903
@Screen.drawLine.ret.2 // 13904
D=A // 13905
@CALL // 13906
0;JMP // 13907
(Screen.drawLine.ret.2)
@SP // 13908
M=M-1 // 13909

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
@Screen.drawLine.EQ.4 // 13910
D=A // 13911
@SP // 13912
AM=M+1 // 13913
A=A-1 // 13914
M=D // 13915
@Screen.drawLine.EQ.5 // 13916
D=A // 13917
@SP // 13918
AM=M+1 // 13919
A=A-1 // 13920
M=D // 13921
@ARG // 13922
A=M+1 // 13923
A=A+1 // 13924
D=M // 13925
A=A-1 // 13926
A=A-1 // 13927
D=M-D // 13928
@DO_EQ // 13929
0;JMP // 13930
(Screen.drawLine.EQ.5)
@SP // 13931
AM=M+1 // 13932
A=A-1 // 13933
M=D // 13934
@Screen.drawLine.EQ.6 // 13935
D=A // 13936
@SP // 13937
AM=M+1 // 13938
A=A-1 // 13939
M=D // 13940
@ARG // 13941
A=M+1 // 13942
A=A+1 // 13943
A=A+1 // 13944
D=M // 13945
A=A-1 // 13946
A=A-1 // 13947
D=M-D // 13948
@DO_EQ // 13949
0;JMP // 13950
(Screen.drawLine.EQ.6)
@SP // 13951
AM=M-1 // 13952
D=D&M // 13953
@DO_EQ // 13954
0;JMP // 13955
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse3 // 13956
D;JNE // 13957

////PushInstruction("constant 0")
@SP // 13958
AM=M+1 // 13959
A=A-1 // 13960
M=0 // 13961

////ReturnInstruction{}
@RETURN // 13962
0;JMP // 13963

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 13964
0;JMP // 13965

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

@LCL // 13966
D=M // 13967
@4 // 13968
A=D+A // 13969
D=M // 13970
D=D+M // 13971
@SP // 13972
AM=M+1 // 13973
A=A-1 // 13974
M=D // 13975
@LCL // 13976
D=M // 13977
@5 // 13978
A=D+A // 13979
D=A // 13980
@R13 // 13981
M=D // 13982
@SP // 13983
AM=M-1 // 13984
D=M // 13985
@R13 // 13986
A=M // 13987
M=D // 13988

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
@Screen.drawLine.GT.7 // 13989
D=A // 13990
@SP // 13991
AM=M+1 // 13992
A=A-1 // 13993
M=D // 13994
@LCL // 13995
D=M // 13996
@5 // 13997
A=D+A // 13998
D=M // 13999
@SP // 14000
AM=M+1 // 14001
A=A-1 // 14002
M=D // 14003
@LCL // 14004
A=M+1 // 14005
D=M // 14006
@SP // 14007
AM=M-1 // 14008
D=D+M // 14009
@DO_GT // 14010
0;JMP // 14011
(Screen.drawLine.GT.7)
D=!D // 14012
@Screen.drawLine.IfElse4 // 14013
D;JNE // 14014

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

@LCL // 14015
D=M // 14016
@4 // 14017
A=D+A // 14018
D=M // 14019
A=A-1 // 14020
A=A-1 // 14021
A=A-1 // 14022
D=D-M // 14023
@SP // 14024
AM=M+1 // 14025
A=A-1 // 14026
M=D // 14027
@LCL // 14028
D=M // 14029
@4 // 14030
A=D+A // 14031
D=A // 14032
@R13 // 14033
M=D // 14034
@SP // 14035
AM=M-1 // 14036
D=M // 14037
@R13 // 14038
A=M // 14039
M=D // 14040

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

@ARG // 14041
A=M // 14042
D=M // 14043
@SP // 14044
AM=M+1 // 14045
A=A-1 // 14046
M=D // 14047
@LCL // 14048
A=M+1 // 14049
A=A+1 // 14050
D=M // 14051
@SP // 14052
AM=M-1 // 14053
D=D+M // 14054
@ARG // 14055
A=M // 14056
M=D // 14057

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 14058
0;JMP // 14059

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
@Screen.drawLine.LT.8 // 14060
D=A // 14061
@SP // 14062
AM=M+1 // 14063
A=A-1 // 14064
M=D // 14065
@LCL // 14066
D=M // 14067
@5 // 14068
A=D+A // 14069
D=M // 14070
@SP // 14071
AM=M+1 // 14072
A=A-1 // 14073
M=D // 14074
@LCL // 14075
A=M // 14076
D=M // 14077
@SP // 14078
AM=M-1 // 14079
D=M-D // 14080
@DO_LT // 14081
0;JMP // 14082
(Screen.drawLine.LT.8)
D=!D // 14083
@Screen.drawLine.IfElse5 // 14084
D;JNE // 14085

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

@LCL // 14086
D=M // 14087
@4 // 14088
A=D+A // 14089
D=M // 14090
@SP // 14091
AM=M+1 // 14092
A=A-1 // 14093
M=D // 14094
@LCL // 14095
A=M // 14096
D=M // 14097
@SP // 14098
AM=M-1 // 14099
D=D+M // 14100
@SP // 14101
AM=M+1 // 14102
A=A-1 // 14103
M=D // 14104
@LCL // 14105
D=M // 14106
@4 // 14107
A=D+A // 14108
D=A // 14109
@R13 // 14110
M=D // 14111
@SP // 14112
AM=M-1 // 14113
D=M // 14114
@R13 // 14115
A=M // 14116
M=D // 14117

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

@ARG // 14118
A=M+1 // 14119
D=M // 14120
@SP // 14121
AM=M+1 // 14122
A=A-1 // 14123
M=D // 14124
@LCL // 14125
A=M+1 // 14126
A=A+1 // 14127
A=A+1 // 14128
D=M // 14129
@SP // 14130
AM=M-1 // 14131
D=D+M // 14132
@ARG // 14133
A=M+1 // 14134
M=D // 14135

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 14136
0;JMP // 14137

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 14138
0;JMP // 14139

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 14140
AM=M+1 // 14141
A=A-1 // 14142
M=0 // 14143

////ReturnInstruction{}
@RETURN // 14144
0;JMP // 14145

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 14146
AM=M+1 // 14147
A=A-1 // 14148
M=0 // 14149

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 14150
A=M // 14151
D=M // 14152
@LCL // 14153
A=M // 14154
M=D // 14155

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
@Screen.drawHorizontalLine.EQ.9 // 14156
D=A // 14157
@SP // 14158
AM=M+1 // 14159
A=A-1 // 14160
M=D // 14161
@Screen.drawHorizontalLine.GT.10 // 14162
D=A // 14163
@SP // 14164
AM=M+1 // 14165
A=A-1 // 14166
M=D // 14167
@LCL // 14168
A=M // 14169
D=M // 14170
@SP // 14171
AM=M+1 // 14172
A=A-1 // 14173
M=D // 14174
@ARG // 14175
A=M+1 // 14176
D=M // 14177
@SP // 14178
AM=M-1 // 14179
D=M-D // 14180
@DO_GT // 14181
0;JMP // 14182
(Screen.drawHorizontalLine.GT.10)
D=!D // 14183
@DO_EQ // 14184
0;JMP // 14185
(Screen.drawHorizontalLine.EQ.9)
@WHILE_END_Screen.drawHorizontalLine1 // 14186
D;JNE // 14187

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14188
A=M // 14189
D=M // 14190
@SP // 14191
AM=M+1 // 14192
A=A-1 // 14193
M=D // 14194
@ARG // 14195
A=M+1 // 14196
A=A+1 // 14197
D=M // 14198
@SP // 14199
AM=M+1 // 14200
A=A-1 // 14201
M=D // 14202
// call Screen.drawPixel
@7 // 14203
D=A // 14204
@14 // 14205
M=D // 14206
@Screen.drawPixel // 14207
D=A // 14208
@13 // 14209
M=D // 14210
@Screen.drawHorizontalLine.ret.0 // 14211
D=A // 14212
@CALL // 14213
0;JMP // 14214
(Screen.drawHorizontalLine.ret.0)
@SP // 14215
M=M-1 // 14216

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

@LCL // 14217
A=M // 14218
D=M // 14219
D=D+1 // 14220
@LCL // 14221
A=M // 14222
M=D // 14223

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 14224
0;JMP // 14225

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 14226
AM=M+1 // 14227
A=A-1 // 14228
M=0 // 14229

////ReturnInstruction{}
@RETURN // 14230
0;JMP // 14231

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 14232
D=A // 14233
@SP // 14234
AM=D+M // 14235
A=A-1 // 14236
M=0 // 14237
A=A-1 // 14238
M=0 // 14239
A=A-1 // 14240
M=0 // 14241
A=A-1 // 14242
M=0 // 14243
A=A-1 // 14244
M=0 // 14245

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14246
A=M // 14247
M=0 // 14248

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 14249
A=M+1 // 14250
A=A+1 // 14251
D=M // 14252
@LCL // 14253
A=M+1 // 14254
M=D // 14255

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

@ARG // 14256
A=M+1 // 14257
A=A+1 // 14258
D=M // 14259
D=D-1 // 14260
D=-D // 14261
@LCL // 14262
A=M+1 // 14263
A=A+1 // 14264
M=D // 14265

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
@Screen.drawCircle.EQ.11 // 14266
D=A // 14267
@SP // 14268
AM=M+1 // 14269
A=A-1 // 14270
M=D // 14271
@Screen.drawCircle.GT.12 // 14272
D=A // 14273
@SP // 14274
AM=M+1 // 14275
A=A-1 // 14276
M=D // 14277
@LCL // 14278
A=M+1 // 14279
D=M // 14280
A=A-1 // 14281
D=M-D // 14282
@DO_GT // 14283
0;JMP // 14284
(Screen.drawCircle.GT.12)
D=!D // 14285
@DO_EQ // 14286
0;JMP // 14287
(Screen.drawCircle.EQ.11)
@WHILE_END_Screen.drawCircle1 // 14288
D;JNE // 14289

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

@ARG // 14290
A=M // 14291
D=M // 14292
@SP // 14293
AM=M+1 // 14294
A=A-1 // 14295
M=D // 14296
@LCL // 14297
A=M // 14298
D=M // 14299
@SP // 14300
AM=M-1 // 14301
D=M-D // 14302
@SP // 14303
AM=M+1 // 14304
A=A-1 // 14305
M=D // 14306
@ARG // 14307
A=M // 14308
D=M // 14309
@SP // 14310
AM=M+1 // 14311
A=A-1 // 14312
M=D // 14313
@LCL // 14314
A=M // 14315
D=M // 14316
@SP // 14317
AM=M-1 // 14318
D=D+M // 14319
@SP // 14320
AM=M+1 // 14321
A=A-1 // 14322
M=D // 14323
@ARG // 14324
A=M+1 // 14325
D=M // 14326
@SP // 14327
AM=M+1 // 14328
A=A-1 // 14329
M=D // 14330
@LCL // 14331
A=M+1 // 14332
D=M // 14333
@SP // 14334
AM=M-1 // 14335
D=D+M // 14336
@SP // 14337
AM=M+1 // 14338
A=A-1 // 14339
M=D // 14340
// call Screen.drawHorizontalLine
@8 // 14341
D=A // 14342
@14 // 14343
M=D // 14344
@Screen.drawHorizontalLine // 14345
D=A // 14346
@13 // 14347
M=D // 14348
@Screen.drawCircle.ret.0 // 14349
D=A // 14350
@CALL // 14351
0;JMP // 14352
(Screen.drawCircle.ret.0)
@SP // 14353
M=M-1 // 14354

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

@ARG // 14355
A=M // 14356
D=M // 14357
@SP // 14358
AM=M+1 // 14359
A=A-1 // 14360
M=D // 14361
@LCL // 14362
A=M // 14363
D=M // 14364
@SP // 14365
AM=M-1 // 14366
D=M-D // 14367
@SP // 14368
AM=M+1 // 14369
A=A-1 // 14370
M=D // 14371
@ARG // 14372
A=M // 14373
D=M // 14374
@SP // 14375
AM=M+1 // 14376
A=A-1 // 14377
M=D // 14378
@LCL // 14379
A=M // 14380
D=M // 14381
@SP // 14382
AM=M-1 // 14383
D=D+M // 14384
@SP // 14385
AM=M+1 // 14386
A=A-1 // 14387
M=D // 14388
@ARG // 14389
A=M+1 // 14390
D=M // 14391
@SP // 14392
AM=M+1 // 14393
A=A-1 // 14394
M=D // 14395
@LCL // 14396
A=M+1 // 14397
D=M // 14398
@SP // 14399
AM=M-1 // 14400
D=M-D // 14401
@SP // 14402
AM=M+1 // 14403
A=A-1 // 14404
M=D // 14405
// call Screen.drawHorizontalLine
@8 // 14406
D=A // 14407
@14 // 14408
M=D // 14409
@Screen.drawHorizontalLine // 14410
D=A // 14411
@13 // 14412
M=D // 14413
@Screen.drawCircle.ret.1 // 14414
D=A // 14415
@CALL // 14416
0;JMP // 14417
(Screen.drawCircle.ret.1)
@SP // 14418
M=M-1 // 14419

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

@ARG // 14420
A=M // 14421
D=M // 14422
@SP // 14423
AM=M+1 // 14424
A=A-1 // 14425
M=D // 14426
@LCL // 14427
A=M+1 // 14428
D=M // 14429
@SP // 14430
AM=M-1 // 14431
D=M-D // 14432
@SP // 14433
AM=M+1 // 14434
A=A-1 // 14435
M=D // 14436
@ARG // 14437
A=M // 14438
D=M // 14439
@SP // 14440
AM=M+1 // 14441
A=A-1 // 14442
M=D // 14443
@LCL // 14444
A=M+1 // 14445
D=M // 14446
@SP // 14447
AM=M-1 // 14448
D=D+M // 14449
@SP // 14450
AM=M+1 // 14451
A=A-1 // 14452
M=D // 14453
@ARG // 14454
A=M+1 // 14455
D=M // 14456
@SP // 14457
AM=M+1 // 14458
A=A-1 // 14459
M=D // 14460
@LCL // 14461
A=M // 14462
D=M // 14463
@SP // 14464
AM=M-1 // 14465
D=D+M // 14466
@SP // 14467
AM=M+1 // 14468
A=A-1 // 14469
M=D // 14470
// call Screen.drawHorizontalLine
@8 // 14471
D=A // 14472
@14 // 14473
M=D // 14474
@Screen.drawHorizontalLine // 14475
D=A // 14476
@13 // 14477
M=D // 14478
@Screen.drawCircle.ret.2 // 14479
D=A // 14480
@CALL // 14481
0;JMP // 14482
(Screen.drawCircle.ret.2)
@SP // 14483
M=M-1 // 14484

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

@ARG // 14485
A=M // 14486
D=M // 14487
@SP // 14488
AM=M+1 // 14489
A=A-1 // 14490
M=D // 14491
@LCL // 14492
A=M+1 // 14493
D=M // 14494
@SP // 14495
AM=M-1 // 14496
D=M-D // 14497
@SP // 14498
AM=M+1 // 14499
A=A-1 // 14500
M=D // 14501
@ARG // 14502
A=M // 14503
D=M // 14504
@SP // 14505
AM=M+1 // 14506
A=A-1 // 14507
M=D // 14508
@LCL // 14509
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
D=M // 14521
@SP // 14522
AM=M+1 // 14523
A=A-1 // 14524
M=D // 14525
@LCL // 14526
A=M // 14527
D=M // 14528
@SP // 14529
AM=M-1 // 14530
D=M-D // 14531
@SP // 14532
AM=M+1 // 14533
A=A-1 // 14534
M=D // 14535
// call Screen.drawHorizontalLine
@8 // 14536
D=A // 14537
@14 // 14538
M=D // 14539
@Screen.drawHorizontalLine // 14540
D=A // 14541
@13 // 14542
M=D // 14543
@Screen.drawCircle.ret.3 // 14544
D=A // 14545
@CALL // 14546
0;JMP // 14547
(Screen.drawCircle.ret.3)
@SP // 14548
M=M-1 // 14549

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
@Screen.drawCircle.LT.13 // 14550
D=A // 14551
@SP // 14552
AM=M+1 // 14553
A=A-1 // 14554
M=D // 14555
@LCL // 14556
A=M+1 // 14557
A=A+1 // 14558
D=M // 14559
@DO_LT // 14560
0;JMP // 14561
(Screen.drawCircle.LT.13)
D=!D // 14562
@Screen.drawCircle.IfElse1 // 14563
D;JNE // 14564

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

@LCL // 14565
A=M+1 // 14566
A=A+1 // 14567
D=M // 14568
@SP // 14569
AM=M+1 // 14570
A=A-1 // 14571
M=D // 14572
@LCL // 14573
A=M // 14574
D=M // 14575
D=D+M // 14576
@SP // 14577
AM=M-1 // 14578
D=D+M // 14579
@3 // 14580
D=D+A // 14581
@LCL // 14582
A=M+1 // 14583
A=A+1 // 14584
M=D // 14585

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 14586
0;JMP // 14587

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

@LCL // 14588
A=M+1 // 14589
A=A+1 // 14590
D=M // 14591
@SP // 14592
AM=M+1 // 14593
A=A-1 // 14594
M=D // 14595
@LCL // 14596
A=M+1 // 14597
D=M // 14598
A=A-1 // 14599
D=M-D // 14600
@R13 // 14601
M=D // 14602
D=D+M // 14603
@SP // 14604
AM=M-1 // 14605
D=D+M // 14606
@5 // 14607
D=D+A // 14608
@LCL // 14609
A=M+1 // 14610
A=A+1 // 14611
M=D // 14612

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

@LCL // 14613
A=M+1 // 14614
D=M // 14615
D=D-1 // 14616
@LCL // 14617
A=M+1 // 14618
M=D // 14619

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

@LCL // 14620
A=M // 14621
D=M // 14622
D=D+1 // 14623
@LCL // 14624
A=M // 14625
M=D // 14626

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 14627
0;JMP // 14628

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 14629
AM=M+1 // 14630
A=A-1 // 14631
M=0 // 14632

////ReturnInstruction{}
@RETURN // 14633
0;JMP // 14634

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 14635
D=A // 14636
@SP // 14637
AM=D+M // 14638
A=A-1 // 14639
M=0 // 14640
A=A-1 // 14641
M=0 // 14642
A=A-1 // 14643
M=0 // 14644
A=A-1 // 14645
M=0 // 14646
A=A-1 // 14647
M=0 // 14648
A=A-1 // 14649
M=0 // 14650
A=A-1 // 14651
M=0 // 14652
A=A-1 // 14653
M=0 // 14654
A=A-1 // 14655
M=0 // 14656
A=A-1 // 14657
M=0 // 14658

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14659
D=M // 14660
@9 // 14661
A=D+A // 14662
M=-1 // 14663

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.14 // 14664
D=A // 14665
@SP // 14666
AM=M+1 // 14667
A=A-1 // 14668
M=D // 14669
@Screen.0 // 14670
D=!M // 14671
@DO_EQ // 14672
0;JMP // 14673
(Screen.drawRectangle.EQ.14)
@Screen.drawRectangle.IfElse1 // 14674
D;JNE // 14675

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14676
D=M // 14677
@9 // 14678
A=D+A // 14679
M=0 // 14680

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 14681
0;JMP // 14682

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

@ARG // 14683
A=M+1 // 14684
D=M // 14685
@LCL // 14686
A=M // 14687
M=D // 14688

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
@Screen.drawRectangle.EQ.15 // 14689
D=A // 14690
@SP // 14691
AM=M+1 // 14692
A=A-1 // 14693
M=D // 14694
@Screen.drawRectangle.GT.16 // 14695
D=A // 14696
@SP // 14697
AM=M+1 // 14698
A=A-1 // 14699
M=D // 14700
@LCL // 14701
A=M // 14702
D=M // 14703
@SP // 14704
AM=M+1 // 14705
A=A-1 // 14706
M=D // 14707
@ARG // 14708
A=M+1 // 14709
A=A+1 // 14710
A=A+1 // 14711
D=M // 14712
@SP // 14713
AM=M-1 // 14714
D=M-D // 14715
@DO_GT // 14716
0;JMP // 14717
(Screen.drawRectangle.GT.16)
D=!D // 14718
@DO_EQ // 14719
0;JMP // 14720
(Screen.drawRectangle.EQ.15)
@WHILE_END_Screen.drawRectangle1 // 14721
D;JNE // 14722

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 14723
A=M // 14724
D=M // 14725
@SP // 14726
AM=M+1 // 14727
A=A-1 // 14728
M=D // 14729
@16 // 14730
D=A // 14731
@SP // 14732
AM=M+1 // 14733
A=A-1 // 14734
M=D // 14735
// call Math.divide
@7 // 14736
D=A // 14737
@14 // 14738
M=D // 14739
@Math.divide // 14740
D=A // 14741
@13 // 14742
M=D // 14743
@Screen.drawRectangle.ret.0 // 14744
D=A // 14745
@CALL // 14746
0;JMP // 14747
(Screen.drawRectangle.ret.0)
@SP // 14748
AM=M-1 // 14749
D=M // 14750
@LCL // 14751
A=M+1 // 14752
M=D // 14753

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 14754
A=M+1 // 14755
A=A+1 // 14756
D=M // 14757
@SP // 14758
AM=M+1 // 14759
A=A-1 // 14760
M=D // 14761
@16 // 14762
D=A // 14763
@SP // 14764
AM=M+1 // 14765
A=A-1 // 14766
M=D // 14767
// call Math.divide
@7 // 14768
D=A // 14769
@14 // 14770
M=D // 14771
@Math.divide // 14772
D=A // 14773
@13 // 14774
M=D // 14775
@Screen.drawRectangle.ret.1 // 14776
D=A // 14777
@CALL // 14778
0;JMP // 14779
(Screen.drawRectangle.ret.1)
@SP // 14780
AM=M-1 // 14781
D=M // 14782
@LCL // 14783
A=M+1 // 14784
A=A+1 // 14785
M=D // 14786

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

@ARG // 14787
A=M // 14788
D=M // 14789
@15 // 14790
D=D&A // 14791
@LCL // 14792
A=M+1 // 14793
A=A+1 // 14794
A=A+1 // 14795
M=D // 14796

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

@ARG // 14797
A=M+1 // 14798
A=A+1 // 14799
D=M // 14800
@15 // 14801
D=D&A // 14802
@SP // 14803
AM=M+1 // 14804
A=A-1 // 14805
M=D // 14806
@LCL // 14807
D=M // 14808
@4 // 14809
A=D+A // 14810
D=A // 14811
@R13 // 14812
M=D // 14813
@SP // 14814
AM=M-1 // 14815
D=M // 14816
@R13 // 14817
A=M // 14818
M=D // 14819

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 14820
A=M // 14821
D=M // 14822
@SP // 14823
AM=M+1 // 14824
A=A-1 // 14825
M=D // 14826
@32 // 14827
D=A // 14828
@SP // 14829
AM=M+1 // 14830
A=A-1 // 14831
M=D // 14832
// call Math.multiply
@7 // 14833
D=A // 14834
@14 // 14835
M=D // 14836
@Math.multiply // 14837
D=A // 14838
@13 // 14839
M=D // 14840
@Screen.drawRectangle.ret.2 // 14841
D=A // 14842
@CALL // 14843
0;JMP // 14844
(Screen.drawRectangle.ret.2)
@LCL // 14845
D=M // 14846
@5 // 14847
A=D+A // 14848
D=A // 14849
@R13 // 14850
M=D // 14851
@SP // 14852
AM=M-1 // 14853
D=M // 14854
@R13 // 14855
A=M // 14856
M=D // 14857

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
@Screen.drawRectangle.EQ.17 // 14858
D=A // 14859
@SP // 14860
AM=M+1 // 14861
A=A-1 // 14862
M=D // 14863
@LCL // 14864
A=M+1 // 14865
A=A+1 // 14866
D=M // 14867
A=A-1 // 14868
D=M-D // 14869
@DO_EQ // 14870
0;JMP // 14871
(Screen.drawRectangle.EQ.17)
D=!D // 14872
@Screen.drawRectangle.IfElse2 // 14873
D;JNE // 14874

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

@LCL // 14875
D=M // 14876
@4 // 14877
A=D+A // 14878
D=M // 14879
@SP // 14880
AM=M+1 // 14881
A=A-1 // 14882
M=D+1 // 14883
// call Math.twoToThe
@6 // 14884
D=A // 14885
@14 // 14886
M=D // 14887
@Math.twoToThe // 14888
D=A // 14889
@13 // 14890
M=D // 14891
@Screen.drawRectangle.ret.3 // 14892
D=A // 14893
@CALL // 14894
0;JMP // 14895
(Screen.drawRectangle.ret.3)
@SP // 14896
AM=M-1 // 14897
D=M // 14898
D=D-1 // 14899
@SP // 14900
AM=M+1 // 14901
A=A-1 // 14902
M=D // 14903
@LCL // 14904
A=M+1 // 14905
A=A+1 // 14906
A=A+1 // 14907
D=M // 14908
@SP // 14909
AM=M+1 // 14910
A=A-1 // 14911
M=D // 14912
// call Math.twoToThe
@6 // 14913
D=A // 14914
@14 // 14915
M=D // 14916
@Math.twoToThe // 14917
D=A // 14918
@13 // 14919
M=D // 14920
@Screen.drawRectangle.ret.4 // 14921
D=A // 14922
@CALL // 14923
0;JMP // 14924
(Screen.drawRectangle.ret.4)
@SP // 14925
AM=M-1 // 14926
D=M // 14927
D=D-1 // 14928
@SP // 14929
AM=M-1 // 14930
D=M-D // 14931
@SP // 14932
AM=M+1 // 14933
A=A-1 // 14934
M=D // 14935
@LCL // 14936
D=M // 14937
@6 // 14938
A=D+A // 14939
D=A // 14940
@R13 // 14941
M=D // 14942
@SP // 14943
AM=M-1 // 14944
D=M // 14945
@R13 // 14946
A=M // 14947
M=D // 14948

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

@LCL // 14949
D=M // 14950
@5 // 14951
A=D+A // 14952
D=M // 14953
@SP // 14954
AM=M+1 // 14955
A=A-1 // 14956
M=D // 14957
@LCL // 14958
A=M+1 // 14959
D=M // 14960
@SP // 14961
AM=M-1 // 14962
D=D+M // 14963
@SP // 14964
AM=M+1 // 14965
A=A-1 // 14966
M=D // 14967
@LCL // 14968
D=M // 14969
@7 // 14970
A=D+A // 14971
D=A // 14972
@R13 // 14973
M=D // 14974
@SP // 14975
AM=M-1 // 14976
D=M // 14977
@R13 // 14978
A=M // 14979
M=D // 14980

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.18 // 14981
D=A // 14982
@SP // 14983
AM=M+1 // 14984
A=A-1 // 14985
M=D // 14986
@Screen.0 // 14987
D=M // 14988
@DO_EQ // 14989
0;JMP // 14990
(Screen.drawRectangle.EQ.18)
@Screen.drawRectangle.IfElse3 // 14991
D;JNE // 14992

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
@LCL // 14993
D=M // 14994
@7 // 14995
A=D+A // 14996
D=M // 14997
@16384 // 14998
D=D+A // 14999
@SP // 15000
AM=M+1 // 15001
A=A-1 // 15002
M=D // 15003
@LCL // 15004
D=M // 15005
@7 // 15006
A=D+A // 15007
D=M // 15008
@16384 // 15009
A=D+A // 15010
D=M // 15011
@SP // 15012
AM=M+1 // 15013
A=A-1 // 15014
M=D // 15015
@LCL // 15016
D=M // 15017
@6 // 15018
A=D+A // 15019
D=M // 15020
@SP // 15021
AM=M-1 // 15022
D=D|M // 15023
@SP // 15024
AM=M-1 // 15025
A=M // 15026
M=D // 15027

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 15028
0;JMP // 15029

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
@LCL // 15030
D=M // 15031
@7 // 15032
A=D+A // 15033
D=M // 15034
@16384 // 15035
D=D+A // 15036
@SP // 15037
AM=M+1 // 15038
A=A-1 // 15039
M=D // 15040
@LCL // 15041
D=M // 15042
@7 // 15043
A=D+A // 15044
D=M // 15045
@16384 // 15046
A=D+A // 15047
D=M // 15048
@SP // 15049
AM=M+1 // 15050
A=A-1 // 15051
M=D // 15052
@LCL // 15053
D=M // 15054
@6 // 15055
A=D+A // 15056
D=!M // 15057
@SP // 15058
AM=M-1 // 15059
D=D&M // 15060
@SP // 15061
AM=M-1 // 15062
A=M // 15063
M=D // 15064

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 15065
0;JMP // 15066

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

@LCL // 15067
A=M+1 // 15068
A=A+1 // 15069
A=A+1 // 15070
D=M // 15071
@SP // 15072
AM=M+1 // 15073
A=A-1 // 15074
M=D // 15075
// call Math.twoToThe
@6 // 15076
D=A // 15077
@14 // 15078
M=D // 15079
@Math.twoToThe // 15080
D=A // 15081
@13 // 15082
M=D // 15083
@Screen.drawRectangle.ret.5 // 15084
D=A // 15085
@CALL // 15086
0;JMP // 15087
(Screen.drawRectangle.ret.5)
@SP // 15088
AM=M-1 // 15089
D=M // 15090
D=D-1 // 15091
@SP // 15092
AM=M+1 // 15093
A=A-1 // 15094
M=D // 15095
@SP // 15096
A=M-1 // 15097
M=!D // 15098
@LCL // 15099
D=M // 15100
@6 // 15101
A=D+A // 15102
D=A // 15103
@R13 // 15104
M=D // 15105
@SP // 15106
AM=M-1 // 15107
D=M // 15108
@R13 // 15109
A=M // 15110
M=D // 15111

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

@LCL // 15112
D=M // 15113
@5 // 15114
A=D+A // 15115
D=M // 15116
@SP // 15117
AM=M+1 // 15118
A=A-1 // 15119
M=D // 15120
@LCL // 15121
A=M+1 // 15122
D=M // 15123
@SP // 15124
AM=M-1 // 15125
D=D+M // 15126
@SP // 15127
AM=M+1 // 15128
A=A-1 // 15129
M=D // 15130
@LCL // 15131
D=M // 15132
@7 // 15133
A=D+A // 15134
D=A // 15135
@R13 // 15136
M=D // 15137
@SP // 15138
AM=M-1 // 15139
D=M // 15140
@R13 // 15141
A=M // 15142
M=D // 15143

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.19 // 15144
D=A // 15145
@SP // 15146
AM=M+1 // 15147
A=A-1 // 15148
M=D // 15149
@Screen.0 // 15150
D=M // 15151
@DO_EQ // 15152
0;JMP // 15153
(Screen.drawRectangle.EQ.19)
@Screen.drawRectangle.IfElse4 // 15154
D;JNE // 15155

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
@LCL // 15156
D=M // 15157
@7 // 15158
A=D+A // 15159
D=M // 15160
@16384 // 15161
D=D+A // 15162
@SP // 15163
AM=M+1 // 15164
A=A-1 // 15165
M=D // 15166
@LCL // 15167
D=M // 15168
@7 // 15169
A=D+A // 15170
D=M // 15171
@16384 // 15172
A=D+A // 15173
D=M // 15174
@SP // 15175
AM=M+1 // 15176
A=A-1 // 15177
M=D // 15178
@LCL // 15179
D=M // 15180
@6 // 15181
A=D+A // 15182
D=M // 15183
@SP // 15184
AM=M-1 // 15185
D=D|M // 15186
@SP // 15187
AM=M-1 // 15188
A=M // 15189
M=D // 15190

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 15191
0;JMP // 15192

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
@LCL // 15193
D=M // 15194
@7 // 15195
A=D+A // 15196
D=M // 15197
@16384 // 15198
D=D+A // 15199
@SP // 15200
AM=M+1 // 15201
A=A-1 // 15202
M=D // 15203
@LCL // 15204
D=M // 15205
@7 // 15206
A=D+A // 15207
D=M // 15208
@16384 // 15209
A=D+A // 15210
D=M // 15211
@SP // 15212
AM=M+1 // 15213
A=A-1 // 15214
M=D // 15215
@LCL // 15216
D=M // 15217
@6 // 15218
A=D+A // 15219
D=!M // 15220
@SP // 15221
AM=M-1 // 15222
D=D&M // 15223
@SP // 15224
AM=M-1 // 15225
A=M // 15226
M=D // 15227

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

@LCL // 15228
A=M+1 // 15229
D=M // 15230
@SP // 15231
AM=M+1 // 15232
A=A-1 // 15233
M=D+1 // 15234
@LCL // 15235
D=M // 15236
@8 // 15237
A=D+A // 15238
D=A // 15239
@R13 // 15240
M=D // 15241
@SP // 15242
AM=M-1 // 15243
D=M // 15244
@R13 // 15245
A=M // 15246
M=D // 15247

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
@Screen.drawRectangle.LT.20 // 15248
D=A // 15249
@SP // 15250
AM=M+1 // 15251
A=A-1 // 15252
M=D // 15253
@LCL // 15254
D=M // 15255
@8 // 15256
A=D+A // 15257
D=M // 15258
@SP // 15259
AM=M+1 // 15260
A=A-1 // 15261
M=D // 15262
@LCL // 15263
A=M+1 // 15264
A=A+1 // 15265
D=M // 15266
@SP // 15267
AM=M-1 // 15268
D=M-D // 15269
@DO_LT // 15270
0;JMP // 15271
(Screen.drawRectangle.LT.20)
D=!D // 15272
@WHILE_END_Screen.drawRectangle2 // 15273
D;JNE // 15274

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

@LCL // 15275
D=M // 15276
@8 // 15277
A=D+A // 15278
D=M // 15279
A=A-1 // 15280
A=A-1 // 15281
A=A-1 // 15282
D=D+M // 15283
@SP // 15284
AM=M+1 // 15285
A=A-1 // 15286
M=D // 15287
@LCL // 15288
D=M // 15289
@7 // 15290
A=D+A // 15291
D=A // 15292
@R13 // 15293
M=D // 15294
@SP // 15295
AM=M-1 // 15296
D=M // 15297
@R13 // 15298
A=M // 15299
M=D // 15300

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 15301
D=M // 15302
@7 // 15303
A=D+A // 15304
D=M // 15305
@16384 // 15306
D=D+A // 15307
@SP // 15308
AM=M+1 // 15309
A=A-1 // 15310
M=D // 15311
@LCL // 15312
D=M // 15313
@9 // 15314
A=D+A // 15315
D=M // 15316
@SP // 15317
AM=M-1 // 15318
A=M // 15319
M=D // 15320

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

@LCL // 15321
D=M // 15322
@8 // 15323
A=D+A // 15324
D=M // 15325
@SP // 15326
AM=M+1 // 15327
A=A-1 // 15328
M=D+1 // 15329
@LCL // 15330
D=M // 15331
@8 // 15332
A=D+A // 15333
D=A // 15334
@R13 // 15335
M=D // 15336
@SP // 15337
AM=M-1 // 15338
D=M // 15339
@R13 // 15340
A=M // 15341
M=D // 15342

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 15343
0;JMP // 15344

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

@LCL // 15345
D=M // 15346
@4 // 15347
A=D+A // 15348
D=M // 15349
@SP // 15350
AM=M+1 // 15351
A=A-1 // 15352
M=D+1 // 15353
// call Math.twoToThe
@6 // 15354
D=A // 15355
@14 // 15356
M=D // 15357
@Math.twoToThe // 15358
D=A // 15359
@13 // 15360
M=D // 15361
@Screen.drawRectangle.ret.6 // 15362
D=A // 15363
@CALL // 15364
0;JMP // 15365
(Screen.drawRectangle.ret.6)
@SP // 15366
AM=M-1 // 15367
D=M // 15368
D=D-1 // 15369
@SP // 15370
AM=M+1 // 15371
A=A-1 // 15372
M=D // 15373
@LCL // 15374
D=M // 15375
@6 // 15376
A=D+A // 15377
D=A // 15378
@R13 // 15379
M=D // 15380
@SP // 15381
AM=M-1 // 15382
D=M // 15383
@R13 // 15384
A=M // 15385
M=D // 15386

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

@LCL // 15387
D=M // 15388
@5 // 15389
A=D+A // 15390
D=M // 15391
A=A-1 // 15392
A=A-1 // 15393
A=A-1 // 15394
D=D+M // 15395
@SP // 15396
AM=M+1 // 15397
A=A-1 // 15398
M=D // 15399
@LCL // 15400
D=M // 15401
@7 // 15402
A=D+A // 15403
D=A // 15404
@R13 // 15405
M=D // 15406
@SP // 15407
AM=M-1 // 15408
D=M // 15409
@R13 // 15410
A=M // 15411
M=D // 15412

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.21 // 15413
D=A // 15414
@SP // 15415
AM=M+1 // 15416
A=A-1 // 15417
M=D // 15418
@Screen.0 // 15419
D=M // 15420
@DO_EQ // 15421
0;JMP // 15422
(Screen.drawRectangle.EQ.21)
@Screen.drawRectangle.IfElse5 // 15423
D;JNE // 15424

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
@LCL // 15425
D=M // 15426
@7 // 15427
A=D+A // 15428
D=M // 15429
@16384 // 15430
D=D+A // 15431
@SP // 15432
AM=M+1 // 15433
A=A-1 // 15434
M=D // 15435
@LCL // 15436
D=M // 15437
@7 // 15438
A=D+A // 15439
D=M // 15440
@16384 // 15441
A=D+A // 15442
D=M // 15443
@SP // 15444
AM=M+1 // 15445
A=A-1 // 15446
M=D // 15447
@LCL // 15448
D=M // 15449
@6 // 15450
A=D+A // 15451
D=M // 15452
@SP // 15453
AM=M-1 // 15454
D=D|M // 15455
@SP // 15456
AM=M-1 // 15457
A=M // 15458
M=D // 15459

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 15460
0;JMP // 15461

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
@LCL // 15462
D=M // 15463
@7 // 15464
A=D+A // 15465
D=M // 15466
@16384 // 15467
D=D+A // 15468
@SP // 15469
AM=M+1 // 15470
A=A-1 // 15471
M=D // 15472
@LCL // 15473
D=M // 15474
@7 // 15475
A=D+A // 15476
D=M // 15477
@16384 // 15478
A=D+A // 15479
D=M // 15480
@SP // 15481
AM=M+1 // 15482
A=A-1 // 15483
M=D // 15484
@LCL // 15485
D=M // 15486
@6 // 15487
A=D+A // 15488
D=!M // 15489
@SP // 15490
AM=M-1 // 15491
D=D&M // 15492
@SP // 15493
AM=M-1 // 15494
A=M // 15495
M=D // 15496

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

@LCL // 15497
A=M // 15498
D=M // 15499
D=D+1 // 15500
@LCL // 15501
A=M // 15502
M=D // 15503

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 15504
0;JMP // 15505

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 15506
AM=M+1 // 15507
A=A-1 // 15508
M=0 // 15509

////ReturnInstruction{}
@RETURN // 15510
0;JMP // 15511

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 15512
AM=M+1 // 15513
A=A-1 // 15514
M=0 // 15515

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15516
A=M // 15517
M=0 // 15518

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
@Screen.clearScreen.LT.22 // 15519
D=A // 15520
@SP // 15521
AM=M+1 // 15522
A=A-1 // 15523
M=D // 15524
@LCL // 15525
A=M // 15526
D=M // 15527
@8192 // 15528
D=D-A // 15529
@DO_LT // 15530
0;JMP // 15531
(Screen.clearScreen.LT.22)
D=!D // 15532
@WHILE_END_Screen.clearScreen1 // 15533
D;JNE // 15534

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 15535
A=M // 15536
D=M // 15537
@16384 // 15538
D=D+A // 15539
@SP // 15540
AM=M+1 // 15541
A=A-1 // 15542
M=D // 15543
D=0 // 15544
@SP // 15545
AM=M-1 // 15546
A=M // 15547
M=D // 15548

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

@LCL // 15549
A=M // 15550
D=M // 15551
D=D+1 // 15552
@LCL // 15553
A=M // 15554
M=D // 15555

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 15556
0;JMP // 15557

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 15558
AM=M+1 // 15559
A=A-1 // 15560
M=0 // 15561

////ReturnInstruction{}
@RETURN // 15562
0;JMP // 15563

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 15564
D=A // 15565
@SP // 15566
AM=M+1 // 15567
A=A-1 // 15568
M=D // 15569
// call Memory.alloc
@6 // 15570
D=A // 15571
@14 // 15572
M=D // 15573
@Memory.alloc // 15574
D=A // 15575
@13 // 15576
M=D // 15577
@String.new.ret.0 // 15578
D=A // 15579
@CALL // 15580
0;JMP // 15581
(String.new.ret.0)
@SP // 15582
AM=M-1 // 15583
D=M // 15584
@3 // 15585
M=D // 15586

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
@String.new.EQ.0 // 15587
D=A // 15588
@SP // 15589
AM=M+1 // 15590
A=A-1 // 15591
M=D // 15592
@ARG // 15593
A=M // 15594
D=M // 15595
@DO_EQ // 15596
0;JMP // 15597
(String.new.EQ.0)
@String.new.IfElse1 // 15598
D;JEQ // 15599

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 15600
A=M // 15601
M=0 // 15602

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 15603
0;JMP // 15604

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 15605
A=M // 15606
D=M // 15607
@SP // 15608
AM=M+1 // 15609
A=A-1 // 15610
M=D // 15611
// call Array.new
@6 // 15612
D=A // 15613
@14 // 15614
M=D // 15615
@Array.new // 15616
D=A // 15617
@13 // 15618
M=D // 15619
@String.new.ret.1 // 15620
D=A // 15621
@CALL // 15622
0;JMP // 15623
(String.new.ret.1)
@SP // 15624
AM=M-1 // 15625
D=M // 15626
@THIS // 15627
A=M // 15628
M=D // 15629

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 15630
A=M // 15631
D=M // 15632
@THIS // 15633
A=M+1 // 15634
A=A+1 // 15635
M=D // 15636

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 15637
A=M+1 // 15638
M=0 // 15639

////PushInstruction("pointer 0")
@3 // 15640
D=M // 15641
@SP // 15642
AM=M+1 // 15643
A=A-1 // 15644
M=D // 15645

////ReturnInstruction{}
@RETURN // 15646
0;JMP // 15647

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15648
A=M // 15649
D=M // 15650
@3 // 15651
M=D // 15652

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
@String.dispose.EQ.1 // 15653
D=A // 15654
@SP // 15655
AM=M+1 // 15656
A=A-1 // 15657
M=D // 15658
@String.dispose.EQ.2 // 15659
D=A // 15660
@SP // 15661
AM=M+1 // 15662
A=A-1 // 15663
M=D // 15664
@THIS // 15665
A=M // 15666
D=M // 15667
@DO_EQ // 15668
0;JMP // 15669
(String.dispose.EQ.2)
D=!D // 15670
@DO_EQ // 15671
0;JMP // 15672
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 15673
D;JNE // 15674

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15675
A=M // 15676
D=M // 15677
@SP // 15678
AM=M+1 // 15679
A=A-1 // 15680
M=D // 15681
// call Array.dispose
@6 // 15682
D=A // 15683
@14 // 15684
M=D // 15685
@Array.dispose // 15686
D=A // 15687
@13 // 15688
M=D // 15689
@String.dispose.ret.0 // 15690
D=A // 15691
@CALL // 15692
0;JMP // 15693
(String.dispose.ret.0)
@SP // 15694
M=M-1 // 15695

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 15696
0;JMP // 15697

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 15698
AM=M+1 // 15699
A=A-1 // 15700
M=0 // 15701

////ReturnInstruction{}
@RETURN // 15702
0;JMP // 15703

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15704
A=M // 15705
D=M // 15706
@3 // 15707
M=D // 15708

////PushInstruction("this 1")
@THIS // 15709
A=M+1 // 15710
D=M // 15711
@SP // 15712
AM=M+1 // 15713
A=A-1 // 15714
M=D // 15715

////ReturnInstruction{}
@RETURN // 15716
0;JMP // 15717

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15718
A=M // 15719
D=M // 15720
@3 // 15721
M=D // 15722

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
@THIS // 15723
A=M // 15724
D=M // 15725
@SP // 15726
AM=M+1 // 15727
A=A-1 // 15728
M=D // 15729
@ARG // 15730
A=M+1 // 15731
D=M // 15732
@SP // 15733
AM=M-1 // 15734
A=D+M // 15735
D=M // 15736
@SP // 15737
AM=M+1 // 15738
A=A-1 // 15739
M=D // 15740

////ReturnInstruction{}
@RETURN // 15741
0;JMP // 15742

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15743
A=M // 15744
D=M // 15745
@3 // 15746
M=D // 15747

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 15748
A=M // 15749
D=M // 15750
@SP // 15751
AM=M+1 // 15752
A=A-1 // 15753
M=D // 15754
@ARG // 15755
A=M+1 // 15756
D=M // 15757
@SP // 15758
AM=M-1 // 15759
D=D+M // 15760
@SP // 15761
AM=M+1 // 15762
A=A-1 // 15763
M=D // 15764
@ARG // 15765
A=M+1 // 15766
A=A+1 // 15767
D=M // 15768
@SP // 15769
AM=M-1 // 15770
A=M // 15771
M=D // 15772

////PushInstruction("constant 0")
@SP // 15773
AM=M+1 // 15774
A=A-1 // 15775
M=0 // 15776

////ReturnInstruction{}
@RETURN // 15777
0;JMP // 15778

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 15779
AM=M+1 // 15780
A=A-1 // 15781
M=0 // 15782

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15783
A=M // 15784
D=M // 15785
@3 // 15786
M=D // 15787

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
@String.appendChar.EQ.3 // 15788
D=A // 15789
@SP // 15790
AM=M+1 // 15791
A=A-1 // 15792
M=D // 15793
@THIS // 15794
A=M+1 // 15795
A=A+1 // 15796
D=M // 15797
A=A-1 // 15798
D=M-D // 15799
@DO_EQ // 15800
0;JMP // 15801
(String.appendChar.EQ.3)
D=!D // 15802
@String.appendChar.IfElse1 // 15803
D;JNE // 15804

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

@THIS // 15805
A=M+1 // 15806
A=A+1 // 15807
D=M // 15808
D=D+M // 15809
@SP // 15810
AM=M+1 // 15811
A=A-1 // 15812
M=D // 15813
// call Array.new
@6 // 15814
D=A // 15815
@14 // 15816
M=D // 15817
@Array.new // 15818
D=A // 15819
@13 // 15820
M=D // 15821
@String.appendChar.ret.0 // 15822
D=A // 15823
@CALL // 15824
0;JMP // 15825
(String.appendChar.ret.0)
@SP // 15826
AM=M-1 // 15827
D=M // 15828
@LCL // 15829
A=M // 15830
M=D // 15831

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15832
A=M // 15833
D=M // 15834
@SP // 15835
AM=M+1 // 15836
A=A-1 // 15837
M=D // 15838
@LCL // 15839
A=M // 15840
D=M // 15841
@SP // 15842
AM=M+1 // 15843
A=A-1 // 15844
M=D // 15845
@THIS // 15846
A=M+1 // 15847
D=M // 15848
@SP // 15849
AM=M+1 // 15850
A=A-1 // 15851
M=D // 15852
// call Memory.copy
@8 // 15853
D=A // 15854
@14 // 15855
M=D // 15856
@Memory.copy // 15857
D=A // 15858
@13 // 15859
M=D // 15860
@String.appendChar.ret.1 // 15861
D=A // 15862
@CALL // 15863
0;JMP // 15864
(String.appendChar.ret.1)
@SP // 15865
M=M-1 // 15866

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15867
A=M // 15868
D=M // 15869
@SP // 15870
AM=M+1 // 15871
A=A-1 // 15872
M=D // 15873
// call Array.dispose
@6 // 15874
D=A // 15875
@14 // 15876
M=D // 15877
@Array.dispose // 15878
D=A // 15879
@13 // 15880
M=D // 15881
@String.appendChar.ret.2 // 15882
D=A // 15883
@CALL // 15884
0;JMP // 15885
(String.appendChar.ret.2)
@SP // 15886
M=M-1 // 15887

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

@THIS // 15888
A=M+1 // 15889
A=A+1 // 15890
D=M // 15891
D=D+M // 15892
@THIS // 15893
A=M+1 // 15894
A=A+1 // 15895
M=D // 15896

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 15897
A=M // 15898
D=M // 15899
@THIS // 15900
A=M // 15901
M=D // 15902

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 15903
0;JMP // 15904

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
@THIS // 15905
A=M+1 // 15906
D=M // 15907
A=A-1 // 15908
D=D+M // 15909
@SP // 15910
AM=M+1 // 15911
A=A-1 // 15912
M=D // 15913
@ARG // 15914
A=M+1 // 15915
D=M // 15916
@SP // 15917
AM=M-1 // 15918
A=M // 15919
M=D // 15920

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

@THIS // 15921
A=M+1 // 15922
D=M // 15923
D=D+1 // 15924
@THIS // 15925
A=M+1 // 15926
M=D // 15927

////PushInstruction("pointer 0")
@3 // 15928
D=M // 15929
@SP // 15930
AM=M+1 // 15931
A=A-1 // 15932
M=D // 15933

////ReturnInstruction{}
@RETURN // 15934
0;JMP // 15935

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15936
A=M // 15937
D=M // 15938
@3 // 15939
M=D // 15940

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

@THIS // 15941
A=M+1 // 15942
D=M // 15943
D=D-1 // 15944
@THIS // 15945
A=M+1 // 15946
M=D // 15947

////PushInstruction("constant 0")
@SP // 15948
AM=M+1 // 15949
A=A-1 // 15950
M=0 // 15951

////ReturnInstruction{}
@RETURN // 15952
0;JMP // 15953

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 15954
M=M+1 // 15955
AM=M+1 // 15956
A=A-1 // 15957
M=0 // 15958
A=A-1 // 15959
M=0 // 15960

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15961
A=M // 15962
D=M // 15963
@3 // 15964
M=D // 15965

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15966
A=M+1 // 15967
M=1 // 15968

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15969
A=M // 15970
M=0 // 15971

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
@String.intValue.LT.4 // 15972
D=A // 15973
@SP // 15974
AM=M+1 // 15975
A=A-1 // 15976
M=D // 15977
@LCL // 15978
A=M+1 // 15979
D=M // 15980
@SP // 15981
AM=M+1 // 15982
A=A-1 // 15983
M=D // 15984
@THIS // 15985
A=M+1 // 15986
D=M // 15987
@SP // 15988
AM=M-1 // 15989
D=M-D // 15990
@DO_LT // 15991
0;JMP // 15992
(String.intValue.LT.4)
D=!D // 15993
@WHILE_END_String.intValue1 // 15994
D;JNE // 15995

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

@LCL // 15996
A=M // 15997
D=M // 15998
@SP // 15999
AM=M+1 // 16000
A=A-1 // 16001
M=D // 16002
@10 // 16003
D=A // 16004
@SP // 16005
AM=M+1 // 16006
A=A-1 // 16007
M=D // 16008
// call Math.multiply
@7 // 16009
D=A // 16010
@14 // 16011
M=D // 16012
@Math.multiply // 16013
D=A // 16014
@13 // 16015
M=D // 16016
@String.intValue.ret.0 // 16017
D=A // 16018
@CALL // 16019
0;JMP // 16020
(String.intValue.ret.0)
@THIS // 16021
A=M // 16022
D=M // 16023
@SP // 16024
AM=M+1 // 16025
A=A-1 // 16026
M=D // 16027
@LCL // 16028
A=M+1 // 16029
D=M // 16030
@SP // 16031
AM=M-1 // 16032
A=D+M // 16033
D=M // 16034
@48 // 16035
D=D-A // 16036
@SP // 16037
AM=M-1 // 16038
D=D+M // 16039
@LCL // 16040
A=M // 16041
M=D // 16042

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

@LCL // 16043
A=M+1 // 16044
D=M // 16045
D=D+1 // 16046
@LCL // 16047
A=M+1 // 16048
M=D // 16049

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 16050
0;JMP // 16051

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 16052
A=M // 16053
D=M // 16054
@SP // 16055
AM=M+1 // 16056
A=A-1 // 16057
M=D // 16058

////ReturnInstruction{}
@RETURN // 16059
0;JMP // 16060

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 16061
D=A // 16062
@SP // 16063
AM=D+M // 16064
A=A-1 // 16065
M=0 // 16066
A=A-1 // 16067
M=0 // 16068
A=A-1 // 16069
M=0 // 16070
A=A-1 // 16071
M=0 // 16072
A=A-1 // 16073
M=0 // 16074
A=A-1 // 16075
M=0 // 16076

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16077
A=M // 16078
D=M // 16079
@3 // 16080
M=D // 16081

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 16082
A=M+1 // 16083
M=0 // 16084

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 16085
D=M // 16086
@4 // 16087
A=D+A // 16088
M=0 // 16089

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
@String.setInt.EQ.5 // 16090
D=A // 16091
@SP // 16092
AM=M+1 // 16093
A=A-1 // 16094
M=D // 16095
@ARG // 16096
A=M+1 // 16097
D=M // 16098
@DO_EQ // 16099
0;JMP // 16100
(String.setInt.EQ.5)
@String.setInt.IfElse1 // 16101
D;JEQ // 16102

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16103
D=M // 16104
@SP // 16105
AM=M+1 // 16106
A=A-1 // 16107
M=D // 16108
@48 // 16109
D=A // 16110
@SP // 16111
AM=M+1 // 16112
A=A-1 // 16113
M=D // 16114
// call String.appendChar
@7 // 16115
D=A // 16116
@14 // 16117
M=D // 16118
@String.appendChar // 16119
D=A // 16120
@13 // 16121
M=D // 16122
@String.setInt.ret.0 // 16123
D=A // 16124
@CALL // 16125
0;JMP // 16126
(String.setInt.ret.0)
@SP // 16127
M=M-1 // 16128

////PushInstruction("constant 0")
@SP // 16129
AM=M+1 // 16130
A=A-1 // 16131
M=0 // 16132

////ReturnInstruction{}
@RETURN // 16133
0;JMP // 16134

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 16135
0;JMP // 16136

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
@String.setInt.LT.6 // 16137
D=A // 16138
@SP // 16139
AM=M+1 // 16140
A=A-1 // 16141
M=D // 16142
@ARG // 16143
A=M+1 // 16144
D=M // 16145
@DO_LT // 16146
0;JMP // 16147
(String.setInt.LT.6)
D=!D // 16148
@String.setInt.IfElse2 // 16149
D;JNE // 16150

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 16151
D=M // 16152
@4 // 16153
A=D+A // 16154
M=1 // 16155

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
@String.setInt.EQ.7 // 16156
D=A // 16157
@SP // 16158
AM=M+1 // 16159
A=A-1 // 16160
M=D // 16161
@String.setInt.LT.8 // 16162
D=A // 16163
@SP // 16164
AM=M+1 // 16165
A=A-1 // 16166
M=D // 16167
@ARG // 16168
A=M+1 // 16169
D=M // 16170
@DO_LT // 16171
0;JMP // 16172
(String.setInt.LT.8)
@SP // 16173
AM=M+1 // 16174
A=A-1 // 16175
M=D // 16176
@String.setInt.EQ.9 // 16177
D=A // 16178
@SP // 16179
AM=M+1 // 16180
A=A-1 // 16181
M=D // 16182
@ARG // 16183
A=M+1 // 16184
D=M // 16185
@32767 // 16186
D=D&A // 16187
@32767 // 16188
D=D-A // 16189
@DO_EQ // 16190
0;JMP // 16191
(String.setInt.EQ.9)
@SP // 16192
AM=M-1 // 16193
D=D&M // 16194
@DO_EQ // 16195
0;JMP // 16196
(String.setInt.EQ.7)
@String.setInt.IfElse3 // 16197
D;JNE // 16198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16199
D=M // 16200
@SP // 16201
AM=M+1 // 16202
A=A-1 // 16203
M=D // 16204
@45 // 16205
D=A // 16206
@SP // 16207
AM=M+1 // 16208
A=A-1 // 16209
M=D // 16210
// call String.appendChar
@7 // 16211
D=A // 16212
@14 // 16213
M=D // 16214
@String.appendChar // 16215
D=A // 16216
@13 // 16217
M=D // 16218
@String.setInt.ret.1 // 16219
D=A // 16220
@CALL // 16221
0;JMP // 16222
(String.setInt.ret.1)
@SP // 16223
M=M-1 // 16224

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16225
D=M // 16226
@SP // 16227
AM=M+1 // 16228
A=A-1 // 16229
M=D // 16230
@51 // 16231
D=A // 16232
@SP // 16233
AM=M+1 // 16234
A=A-1 // 16235
M=D // 16236
// call String.appendChar
@7 // 16237
D=A // 16238
@14 // 16239
M=D // 16240
@String.appendChar // 16241
D=A // 16242
@13 // 16243
M=D // 16244
@String.setInt.ret.2 // 16245
D=A // 16246
@CALL // 16247
0;JMP // 16248
(String.setInt.ret.2)
@SP // 16249
M=M-1 // 16250

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16251
D=M // 16252
@SP // 16253
AM=M+1 // 16254
A=A-1 // 16255
M=D // 16256
@50 // 16257
D=A // 16258
@SP // 16259
AM=M+1 // 16260
A=A-1 // 16261
M=D // 16262
// call String.appendChar
@7 // 16263
D=A // 16264
@14 // 16265
M=D // 16266
@String.appendChar // 16267
D=A // 16268
@13 // 16269
M=D // 16270
@String.setInt.ret.3 // 16271
D=A // 16272
@CALL // 16273
0;JMP // 16274
(String.setInt.ret.3)
@SP // 16275
M=M-1 // 16276

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16277
D=M // 16278
@SP // 16279
AM=M+1 // 16280
A=A-1 // 16281
M=D // 16282
@55 // 16283
D=A // 16284
@SP // 16285
AM=M+1 // 16286
A=A-1 // 16287
M=D // 16288
// call String.appendChar
@7 // 16289
D=A // 16290
@14 // 16291
M=D // 16292
@String.appendChar // 16293
D=A // 16294
@13 // 16295
M=D // 16296
@String.setInt.ret.4 // 16297
D=A // 16298
@CALL // 16299
0;JMP // 16300
(String.setInt.ret.4)
@SP // 16301
M=M-1 // 16302

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16303
D=M // 16304
@SP // 16305
AM=M+1 // 16306
A=A-1 // 16307
M=D // 16308
@54 // 16309
D=A // 16310
@SP // 16311
AM=M+1 // 16312
A=A-1 // 16313
M=D // 16314
// call String.appendChar
@7 // 16315
D=A // 16316
@14 // 16317
M=D // 16318
@String.appendChar // 16319
D=A // 16320
@13 // 16321
M=D // 16322
@String.setInt.ret.5 // 16323
D=A // 16324
@CALL // 16325
0;JMP // 16326
(String.setInt.ret.5)
@SP // 16327
M=M-1 // 16328

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16329
D=M // 16330
@SP // 16331
AM=M+1 // 16332
A=A-1 // 16333
M=D // 16334
@56 // 16335
D=A // 16336
@SP // 16337
AM=M+1 // 16338
A=A-1 // 16339
M=D // 16340
// call String.appendChar
@7 // 16341
D=A // 16342
@14 // 16343
M=D // 16344
@String.appendChar // 16345
D=A // 16346
@13 // 16347
M=D // 16348
@String.setInt.ret.6 // 16349
D=A // 16350
@CALL // 16351
0;JMP // 16352
(String.setInt.ret.6)
@SP // 16353
M=M-1 // 16354

////PushInstruction("constant 0")
@SP // 16355
AM=M+1 // 16356
A=A-1 // 16357
M=0 // 16358

////ReturnInstruction{}
@RETURN // 16359
0;JMP // 16360

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 16361
0;JMP // 16362

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

@ARG // 16363
A=M+1 // 16364
D=-M // 16365
@ARG // 16366
A=M+1 // 16367
M=D // 16368

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 16369
0;JMP // 16370

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

@ARG // 16371
A=M+1 // 16372
D=M // 16373
@LCL // 16374
A=M+1 // 16375
A=A+1 // 16376
M=D // 16377

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 16378
A=M+1 // 16379
A=A+1 // 16380
A=A+1 // 16381
M=0 // 16382

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
@String.setInt.GT.10 // 16383
D=A // 16384
@SP // 16385
AM=M+1 // 16386
A=A-1 // 16387
M=D // 16388
@LCL // 16389
A=M+1 // 16390
A=A+1 // 16391
D=M // 16392
@DO_GT // 16393
0;JMP // 16394
(String.setInt.GT.10)
D=!D // 16395
@WHILE_END_String.setInt1 // 16396
D;JNE // 16397

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 16398
A=M+1 // 16399
A=A+1 // 16400
D=M // 16401
@SP // 16402
AM=M+1 // 16403
A=A-1 // 16404
M=D // 16405
@10 // 16406
D=A // 16407
@SP // 16408
AM=M+1 // 16409
A=A-1 // 16410
M=D // 16411
// call Math.divide
@7 // 16412
D=A // 16413
@14 // 16414
M=D // 16415
@Math.divide // 16416
D=A // 16417
@13 // 16418
M=D // 16419
@String.setInt.ret.7 // 16420
D=A // 16421
@CALL // 16422
0;JMP // 16423
(String.setInt.ret.7)
@SP // 16424
AM=M-1 // 16425
D=M // 16426
@LCL // 16427
A=M+1 // 16428
A=A+1 // 16429
M=D // 16430

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

@LCL // 16431
A=M+1 // 16432
A=A+1 // 16433
A=A+1 // 16434
D=M // 16435
D=D+1 // 16436
@LCL // 16437
A=M+1 // 16438
A=A+1 // 16439
A=A+1 // 16440
M=D // 16441

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 16442
0;JMP // 16443

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 16444
A=M+1 // 16445
A=A+1 // 16446
A=A+1 // 16447
D=M // 16448
@SP // 16449
AM=M+1 // 16450
A=A-1 // 16451
M=D // 16452
// call Array.new
@6 // 16453
D=A // 16454
@14 // 16455
M=D // 16456
@Array.new // 16457
D=A // 16458
@13 // 16459
M=D // 16460
@String.setInt.ret.8 // 16461
D=A // 16462
@CALL // 16463
0;JMP // 16464
(String.setInt.ret.8)
@LCL // 16465
D=M // 16466
@5 // 16467
A=D+A // 16468
D=A // 16469
@R13 // 16470
M=D // 16471
@SP // 16472
AM=M-1 // 16473
D=M // 16474
@R13 // 16475
A=M // 16476
M=D // 16477

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 16478
A=M+1 // 16479
M=0 // 16480

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
@String.setInt.GT.11 // 16481
D=A // 16482
@SP // 16483
AM=M+1 // 16484
A=A-1 // 16485
M=D // 16486
@ARG // 16487
A=M+1 // 16488
D=M // 16489
@DO_GT // 16490
0;JMP // 16491
(String.setInt.GT.11)
D=!D // 16492
@WHILE_END_String.setInt2 // 16493
D;JNE // 16494

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

@ARG // 16495
A=M+1 // 16496
D=M // 16497
@SP // 16498
AM=M+1 // 16499
A=A-1 // 16500
M=D // 16501
@ARG // 16502
A=M+1 // 16503
D=M // 16504
@SP // 16505
AM=M+1 // 16506
A=A-1 // 16507
M=D // 16508
@10 // 16509
D=A // 16510
@SP // 16511
AM=M+1 // 16512
A=A-1 // 16513
M=D // 16514
// call Math.divide
@7 // 16515
D=A // 16516
@14 // 16517
M=D // 16518
@Math.divide // 16519
D=A // 16520
@13 // 16521
M=D // 16522
@String.setInt.ret.9 // 16523
D=A // 16524
@CALL // 16525
0;JMP // 16526
(String.setInt.ret.9)
@10 // 16527
D=A // 16528
@SP // 16529
AM=M+1 // 16530
A=A-1 // 16531
M=D // 16532
// call Math.multiply
@7 // 16533
D=A // 16534
@14 // 16535
M=D // 16536
@Math.multiply // 16537
D=A // 16538
@13 // 16539
M=D // 16540
@String.setInt.ret.10 // 16541
D=A // 16542
@CALL // 16543
0;JMP // 16544
(String.setInt.ret.10)
@SP // 16545
AM=M-1 // 16546
D=M // 16547
@SP // 16548
AM=M-1 // 16549
D=M-D // 16550
@LCL // 16551
A=M // 16552
M=D // 16553

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
@LCL // 16554
D=M // 16555
@5 // 16556
A=D+A // 16557
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
D=D+M // 16568
@SP // 16569
AM=M+1 // 16570
A=A-1 // 16571
M=D // 16572
@LCL // 16573
A=M // 16574
D=M // 16575
@48 // 16576
D=D+A // 16577
@SP // 16578
AM=M-1 // 16579
A=M // 16580
M=D // 16581

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 16582
A=M+1 // 16583
D=M // 16584
@SP // 16585
AM=M+1 // 16586
A=A-1 // 16587
M=D // 16588
@10 // 16589
D=A // 16590
@SP // 16591
AM=M+1 // 16592
A=A-1 // 16593
M=D // 16594
// call Math.divide
@7 // 16595
D=A // 16596
@14 // 16597
M=D // 16598
@Math.divide // 16599
D=A // 16600
@13 // 16601
M=D // 16602
@String.setInt.ret.11 // 16603
D=A // 16604
@CALL // 16605
0;JMP // 16606
(String.setInt.ret.11)
@SP // 16607
AM=M-1 // 16608
D=M // 16609
@ARG // 16610
A=M+1 // 16611
M=D // 16612

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

@LCL // 16613
A=M+1 // 16614
D=M // 16615
D=D+1 // 16616
@LCL // 16617
A=M+1 // 16618
M=D // 16619

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 16620
0;JMP // 16621

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
@String.setInt.EQ.12 // 16622
D=A // 16623
@SP // 16624
AM=M+1 // 16625
A=A-1 // 16626
M=D // 16627
@LCL // 16628
D=M // 16629
@4 // 16630
A=D+A // 16631
D=M // 16632
D=D-1 // 16633
@DO_EQ // 16634
0;JMP // 16635
(String.setInt.EQ.12)
D=!D // 16636
@String.setInt.IfElse4 // 16637
D;JNE // 16638

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 16639
D=M // 16640
@SP // 16641
AM=M+1 // 16642
A=A-1 // 16643
M=D // 16644
@45 // 16645
D=A // 16646
@SP // 16647
AM=M+1 // 16648
A=A-1 // 16649
M=D // 16650
// call String.appendChar
@7 // 16651
D=A // 16652
@14 // 16653
M=D // 16654
@String.appendChar // 16655
D=A // 16656
@13 // 16657
M=D // 16658
@String.setInt.ret.12 // 16659
D=A // 16660
@CALL // 16661
0;JMP // 16662
(String.setInt.ret.12)
@SP // 16663
M=M-1 // 16664

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 16665
0;JMP // 16666

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
@String.setInt.GT.13 // 16667
D=A // 16668
@SP // 16669
AM=M+1 // 16670
A=A-1 // 16671
M=D // 16672
@LCL // 16673
A=M+1 // 16674
D=M // 16675
@DO_GT // 16676
0;JMP // 16677
(String.setInt.GT.13)
D=!D // 16678
@WHILE_END_String.setInt3 // 16679
D;JNE // 16680

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

@LCL // 16681
A=M+1 // 16682
D=M // 16683
D=D-1 // 16684
@LCL // 16685
A=M+1 // 16686
M=D // 16687

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

@3 // 16688
D=M // 16689
@SP // 16690
AM=M+1 // 16691
A=A-1 // 16692
M=D // 16693
@LCL // 16694
D=M // 16695
@5 // 16696
A=D+A // 16697
D=M // 16698
@SP // 16699
AM=M+1 // 16700
A=A-1 // 16701
M=D // 16702
@LCL // 16703
A=M+1 // 16704
D=M // 16705
@SP // 16706
AM=M-1 // 16707
A=D+M // 16708
D=M // 16709
@SP // 16710
AM=M+1 // 16711
A=A-1 // 16712
M=D // 16713
// call String.appendChar
@7 // 16714
D=A // 16715
@14 // 16716
M=D // 16717
@String.appendChar // 16718
D=A // 16719
@13 // 16720
M=D // 16721
@String.setInt.ret.13 // 16722
D=A // 16723
@CALL // 16724
0;JMP // 16725
(String.setInt.ret.13)
@SP // 16726
M=M-1 // 16727

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 16728
0;JMP // 16729

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16730
D=M // 16731
@5 // 16732
A=D+A // 16733
D=M // 16734
@SP // 16735
AM=M+1 // 16736
A=A-1 // 16737
M=D // 16738
// call Array.dispose
@6 // 16739
D=A // 16740
@14 // 16741
M=D // 16742
@Array.dispose // 16743
D=A // 16744
@13 // 16745
M=D // 16746
@String.setInt.ret.14 // 16747
D=A // 16748
@CALL // 16749
0;JMP // 16750
(String.setInt.ret.14)
@SP // 16751
M=M-1 // 16752

////PushInstruction("constant 0")
@SP // 16753
AM=M+1 // 16754
A=A-1 // 16755
M=0 // 16756

////ReturnInstruction{}
@RETURN // 16757
0;JMP // 16758

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 16759
D=A // 16760
@SP // 16761
AM=M+1 // 16762
A=A-1 // 16763
M=D // 16764

////ReturnInstruction{}
@RETURN // 16765
0;JMP // 16766

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 16767
D=A // 16768
@SP // 16769
AM=M+1 // 16770
A=A-1 // 16771
M=D // 16772

////ReturnInstruction{}
@RETURN // 16773
0;JMP // 16774

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 16775
D=A // 16776
@SP // 16777
AM=M+1 // 16778
A=A-1 // 16779
M=D // 16780

////ReturnInstruction{}
@RETURN // 16781
0;JMP // 16782

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 16783
D=A // 16784
@14 // 16785
M=D // 16786
@Memory.init // 16787
D=A // 16788
@13 // 16789
M=D // 16790
@Sys.init.ret.0 // 16791
D=A // 16792
@CALL // 16793
0;JMP // 16794
(Sys.init.ret.0)
@SP // 16795
M=M-1 // 16796

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 16797
D=A // 16798
@14 // 16799
M=D // 16800
@Math.init // 16801
D=A // 16802
@13 // 16803
M=D // 16804
@Sys.init.ret.1 // 16805
D=A // 16806
@CALL // 16807
0;JMP // 16808
(Sys.init.ret.1)
@SP // 16809
M=M-1 // 16810

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 16811
D=A // 16812
@14 // 16813
M=D // 16814
@Screen.init // 16815
D=A // 16816
@13 // 16817
M=D // 16818
@Sys.init.ret.2 // 16819
D=A // 16820
@CALL // 16821
0;JMP // 16822
(Sys.init.ret.2)
@SP // 16823
M=M-1 // 16824

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 16825
D=A // 16826
@14 // 16827
M=D // 16828
@Output.init // 16829
D=A // 16830
@13 // 16831
M=D // 16832
@Sys.init.ret.3 // 16833
D=A // 16834
@CALL // 16835
0;JMP // 16836
(Sys.init.ret.3)
@SP // 16837
M=M-1 // 16838

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 16839
D=A // 16840
@14 // 16841
M=D // 16842
@Keyboard.init // 16843
D=A // 16844
@13 // 16845
M=D // 16846
@Sys.init.ret.4 // 16847
D=A // 16848
@CALL // 16849
0;JMP // 16850
(Sys.init.ret.4)
@SP // 16851
M=M-1 // 16852

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 16853
D=A // 16854
@14 // 16855
M=D // 16856
@Main.main // 16857
D=A // 16858
@13 // 16859
M=D // 16860
@Sys.init.ret.5 // 16861
D=A // 16862
@CALL // 16863
0;JMP // 16864
(Sys.init.ret.5)
@SP // 16865
M=M-1 // 16866

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 16867
D=A // 16868
@14 // 16869
M=D // 16870
@Sys.halt // 16871
D=A // 16872
@13 // 16873
M=D // 16874
@Sys.init.ret.6 // 16875
D=A // 16876
@CALL // 16877
0;JMP // 16878
(Sys.init.ret.6)
@SP // 16879
M=M-1 // 16880

////PushInstruction("constant 0")
@SP // 16881
AM=M+1 // 16882
A=A-1 // 16883
M=0 // 16884

////ReturnInstruction{}
@RETURN // 16885
0;JMP // 16886

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
D=0 // 16887
@WHILE_END_Sys.halt1 // 16888
D;JNE // 16889

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 16890
0;JMP // 16891

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 16892
AM=M+1 // 16893
A=A-1 // 16894
M=0 // 16895

////ReturnInstruction{}
@RETURN // 16896
0;JMP // 16897

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 16898
AM=M+1 // 16899
A=A-1 // 16900
M=0 // 16901

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
@Sys.wait.GT.0 // 16902
D=A // 16903
@SP // 16904
AM=M+1 // 16905
A=A-1 // 16906
M=D // 16907
@ARG // 16908
A=M // 16909
D=M // 16910
@DO_GT // 16911
0;JMP // 16912
(Sys.wait.GT.0)
D=!D // 16913
@WHILE_END_Sys.wait1 // 16914
D;JNE // 16915

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

@ARG // 16916
A=M // 16917
D=M // 16918
D=D-1 // 16919
@ARG // 16920
A=M // 16921
M=D // 16922

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 16923
D=A // 16924
@LCL // 16925
A=M // 16926
M=D // 16927

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
@Sys.wait.GT.1 // 16928
D=A // 16929
@SP // 16930
AM=M+1 // 16931
A=A-1 // 16932
M=D // 16933
@LCL // 16934
A=M // 16935
D=M // 16936
@DO_GT // 16937
0;JMP // 16938
(Sys.wait.GT.1)
D=!D // 16939
@WHILE_END_Sys.wait2 // 16940
D;JNE // 16941

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

@LCL // 16942
A=M // 16943
D=M // 16944
D=D-1 // 16945
@LCL // 16946
A=M // 16947
M=D // 16948

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 16949
0;JMP // 16950

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 16951
0;JMP // 16952

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 16953
AM=M+1 // 16954
A=A-1 // 16955
M=0 // 16956

////ReturnInstruction{}
@RETURN // 16957
0;JMP // 16958

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 16959
A=M // 16960
D=M // 16961
@SP // 16962
AM=M+1 // 16963
A=A-1 // 16964
M=D // 16965
// call Output.printInt
@6 // 16966
D=A // 16967
@14 // 16968
M=D // 16969
@Output.printInt // 16970
D=A // 16971
@13 // 16972
M=D // 16973
@Sys.error.ret.0 // 16974
D=A // 16975
@CALL // 16976
0;JMP // 16977
(Sys.error.ret.0)
@SP // 16978
M=M-1 // 16979

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 16980
D=A // 16981
@14 // 16982
M=D // 16983
@Output.println // 16984
D=A // 16985
@13 // 16986
M=D // 16987
@Sys.error.ret.1 // 16988
D=A // 16989
@CALL // 16990
0;JMP // 16991
(Sys.error.ret.1)
@SP // 16992
M=M-1 // 16993

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 16994
D=A // 16995
@14 // 16996
M=D // 16997
@Sys.halt // 16998
D=A // 16999
@13 // 17000
M=D // 17001
@Sys.error.ret.2 // 17002
D=A // 17003
@CALL // 17004
0;JMP // 17005
(Sys.error.ret.2)
@SP // 17006
M=M-1 // 17007

////PushInstruction("constant 0")
@SP // 17008
AM=M+1 // 17009
A=A-1 // 17010
M=0 // 17011

////ReturnInstruction{}
@RETURN // 17012
0;JMP // 17013

