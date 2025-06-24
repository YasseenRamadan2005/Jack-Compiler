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

////CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
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

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 151
A=M // 152
D=M // 153
@3 // 154
M=D // 155

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 156
D=M // 157
@SP // 158
AM=M+1 // 159
A=A-1 // 160
M=D // 161
// call Memory.deAlloc
@6 // 162
D=A // 163
@14 // 164
M=D // 165
@Memory.deAlloc // 166
D=A // 167
@13 // 168
M=D // 169
@Array.dispose.ret.0 // 170
D=A // 171
@CALL // 172
0;JMP // 173
(Array.dispose.ret.0)
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
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printChar}}
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

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 334
A=M // 335
D=M // 336
@SP // 337
AM=M+1 // 338
A=A-1 // 339
M=D // 340
// call Output.printString
@6 // 341
D=A // 342
@14 // 343
M=D // 344
@Output.printString // 345
D=A // 346
@13 // 347
M=D // 348
@Keyboard.readLine.ret.0 // 349
D=A // 350
@CALL // 351
0;JMP // 352
(Keyboard.readLine.ret.0)
@SP // 353
AM=M-1 // 354
D=M // 355
@5 // 356
M=D // 357

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@50 // 358
D=A // 359
@SP // 360
AM=M+1 // 361
A=A-1 // 362
M=D // 363
// call String.new
@6 // 364
D=A // 365
@14 // 366
M=D // 367
@String.new // 368
D=A // 369
@13 // 370
M=D // 371
@Keyboard.readLine.ret.1 // 372
D=A // 373
@CALL // 374
0;JMP // 375
(Keyboard.readLine.ret.1)
@SP // 376
AM=M-1 // 377
D=M // 378
@LCL // 379
A=M // 380
M=D // 381

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 382
D=A // 383
@14 // 384
M=D // 385
@Keyboard.readChar // 386
D=A // 387
@13 // 388
M=D // 389
@Keyboard.readLine.ret.2 // 390
D=A // 391
@CALL // 392
0;JMP // 393
(Keyboard.readLine.ret.2)
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
//CallGroup{pushes=[], call=CallInstruction{String.newLine}},
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
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.eraseLastChar}}
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
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{String.appendChar}}
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
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
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
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Keyboard.readLine}}
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

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.intValue}}
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

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 639
AM=M+1 // 640
A=A-1 // 641
M=0 // 642

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 7")], call=CallInstruction{String.new}}, PushInstruction("constant 49")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 52")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 53")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@7 // 643
D=A // 644
@SP // 645
AM=M+1 // 646
A=A-1 // 647
M=D // 648
// call String.new
@6 // 649
D=A // 650
@14 // 651
M=D // 652
@String.new // 653
D=A // 654
@13 // 655
M=D // 656
@Main.main.ret.0 // 657
D=A // 658
@CALL // 659
0;JMP // 660
(Main.main.ret.0)
@49 // 661
D=A // 662
@SP // 663
AM=M+1 // 664
A=A-1 // 665
M=D // 666
// call String.appendChar
@7 // 667
D=A // 668
@14 // 669
M=D // 670
@String.appendChar // 671
D=A // 672
@13 // 673
M=D // 674
@Main.main.ret.1 // 675
D=A // 676
@CALL // 677
0;JMP // 678
(Main.main.ret.1)
@50 // 679
D=A // 680
@SP // 681
AM=M+1 // 682
A=A-1 // 683
M=D // 684
// call String.appendChar
@7 // 685
D=A // 686
@14 // 687
M=D // 688
@String.appendChar // 689
D=A // 690
@13 // 691
M=D // 692
@Main.main.ret.2 // 693
D=A // 694
@CALL // 695
0;JMP // 696
(Main.main.ret.2)
@51 // 697
D=A // 698
@SP // 699
AM=M+1 // 700
A=A-1 // 701
M=D // 702
// call String.appendChar
@7 // 703
D=A // 704
@14 // 705
M=D // 706
@String.appendChar // 707
D=A // 708
@13 // 709
M=D // 710
@Main.main.ret.3 // 711
D=A // 712
@CALL // 713
0;JMP // 714
(Main.main.ret.3)
@52 // 715
D=A // 716
@SP // 717
AM=M+1 // 718
A=A-1 // 719
M=D // 720
// call String.appendChar
@7 // 721
D=A // 722
@14 // 723
M=D // 724
@String.appendChar // 725
D=A // 726
@13 // 727
M=D // 728
@Main.main.ret.4 // 729
D=A // 730
@CALL // 731
0;JMP // 732
(Main.main.ret.4)
@53 // 733
D=A // 734
@SP // 735
AM=M+1 // 736
A=A-1 // 737
M=D // 738
// call String.appendChar
@7 // 739
D=A // 740
@14 // 741
M=D // 742
@String.appendChar // 743
D=A // 744
@13 // 745
M=D // 746
@Main.main.ret.5 // 747
D=A // 748
@CALL // 749
0;JMP // 750
(Main.main.ret.5)
@54 // 751
D=A // 752
@SP // 753
AM=M+1 // 754
A=A-1 // 755
M=D // 756
// call String.appendChar
@7 // 757
D=A // 758
@14 // 759
M=D // 760
@String.appendChar // 761
D=A // 762
@13 // 763
M=D // 764
@Main.main.ret.6 // 765
D=A // 766
@CALL // 767
0;JMP // 768
(Main.main.ret.6)
@55 // 769
D=A // 770
@SP // 771
AM=M+1 // 772
A=A-1 // 773
M=D // 774
// call String.appendChar
@7 // 775
D=A // 776
@14 // 777
M=D // 778
@String.appendChar // 779
D=A // 780
@13 // 781
M=D // 782
@Main.main.ret.7 // 783
D=A // 784
@CALL // 785
0;JMP // 786
(Main.main.ret.7)
@SP // 787
AM=M-1 // 788
D=M // 789
@LCL // 790
A=M // 791
M=D // 792

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 793
A=M // 794
D=M // 795
@SP // 796
AM=M+1 // 797
A=A-1 // 798
M=D // 799
// call Output.printString
@6 // 800
D=A // 801
@14 // 802
M=D // 803
@Output.printString // 804
D=A // 805
@13 // 806
M=D // 807
@Main.main.ret.8 // 808
D=A // 809
@CALL // 810
0;JMP // 811
(Main.main.ret.8)
@SP // 812
AM=M-1 // 813
D=M // 814
@5 // 815
M=D // 816

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 817
D=A // 818
@14 // 819
M=D // 820
@Output.println // 821
D=A // 822
@13 // 823
M=D // 824
@Main.main.ret.9 // 825
D=A // 826
@CALL // 827
0;JMP // 828
(Main.main.ret.9)
@SP // 829
AM=M-1 // 830
D=M // 831
@5 // 832
M=D // 833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 834
A=M // 835
D=M // 836
@SP // 837
AM=M+1 // 838
A=A-1 // 839
M=D // 840
// call String.dispose
@6 // 841
D=A // 842
@14 // 843
M=D // 844
@String.dispose // 845
D=A // 846
@13 // 847
M=D // 848
@Main.main.ret.10 // 849
D=A // 850
@CALL // 851
0;JMP // 852
(Main.main.ret.10)
@SP // 853
AM=M-1 // 854
D=M // 855
@5 // 856
M=D // 857

////PushInstruction("constant 0")
@SP // 858
AM=M+1 // 859
A=A-1 // 860
M=0 // 861

////ReturnInstruction{}
@RETURN // 862
0;JMP // 863

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 864
AM=M+1 // 865
A=A-1 // 866
M=0 // 867
@SP // 868
AM=M+1 // 869
A=A-1 // 870
M=0 // 871

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

D=1 // 872
@LCL // 873
A=M // 874
M=D // 875

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

D=0 // 876
@LCL // 877
A=M+1 // 878
M=D // 879

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=Math.0}
//}

@16 // 880
D=A // 881
@SP // 882
AM=M+1 // 883
A=A-1 // 884
M=D // 885
// call Array.new
@6 // 886
D=A // 887
@14 // 888
M=D // 889
@Array.new // 890
D=A // 891
@13 // 892
M=D // 893
@Math.init.ret.0 // 894
D=A // 895
@CALL // 896
0;JMP // 897
(Math.init.ret.0)
@SP // 898
AM=M-1 // 899
D=M // 900
@Math.0 // 901
M=D // 902

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
@Math.init.EQ.1 // 903
D=A // 904
@SP // 905
AM=M+1 // 906
A=A-1 // 907
M=D // 908
@Math.init.LT.2 // 909
D=A // 910
@SP // 911
AM=M+1 // 912
A=A-1 // 913
M=D // 914
@LCL // 915
A=M+1 // 916
D=M // 917
@16 // 918
D=D-A // 919
@14 // 920
M=D // 921
@SP // 922
AM=M-1 // 923
D=M // 924
@13 // 925
M=D // 926
@14 // 927
D=M // 928
@DO_LT // 929
0;JMP // 930
(Math.init.LT.2)
@14 // 931
M=D // 932
@SP // 933
AM=M-1 // 934
D=M // 935
@13 // 936
M=D // 937
@14 // 938
D=M // 939
@DO_EQ // 940
0;JMP // 941
(Math.init.EQ.1)
@WHILE_END_Math.init1 // 942
D;JNE // 943

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 944
D=M // 945
@SP // 946
AM=M+1 // 947
A=A-1 // 948
M=D // 949
@LCL // 950
A=M+1 // 951
D=M // 952
@SP // 953
AM=M-1 // 954
D=D+M // 955
@SP // 956
AM=M+1 // 957
A=A-1 // 958
M=D // 959
@LCL // 960
A=M // 961
D=M // 962
@SP // 963
AM=M-1 // 964
A=M // 965
M=D // 966

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

@LCL // 967
A=M // 968
D=M // 969
D=D+M // 970
@LCL // 971
A=M // 972
M=D // 973

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

@LCL // 974
A=M+1 // 975
D=M+1 // 976
@LCL // 977
A=M+1 // 978
M=D // 979

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 980
0;JMP // 981

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 982
AM=M+1 // 983
A=A-1 // 984
M=0 // 985

////ReturnInstruction{}
@RETURN // 986
0;JMP // 987

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
@ARG // 988
A=M // 989
D=M // 990
@SP // 991
AM=M+1 // 992
A=A-1 // 993
M=D // 994
@Math.0 // 995
D=M // 996
@SP // 997
AM=M+1 // 998
A=A-1 // 999
M=D // 1000
@ARG // 1001
A=M+1 // 1002
D=M // 1003
@SP // 1004
AM=M-1 // 1005
A=D+M // 1006
D=M // 1007
@SP // 1008
AM=M-1 // 1009
D=D&M // 1010
@SP // 1011
AM=M+1 // 1012
A=A-1 // 1013
M=D // 1014

////ReturnInstruction{}
@RETURN // 1015
0;JMP // 1016

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 1017
AM=M+1 // 1018
A=A-1 // 1019
M=0 // 1020
@SP // 1021
AM=M+1 // 1022
A=A-1 // 1023
M=0 // 1024
@SP // 1025
AM=M+1 // 1026
A=A-1 // 1027
M=0 // 1028

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
@Math.multiply.EQ.5 // 1029
D=A // 1030
@SP // 1031
AM=M+1 // 1032
A=A-1 // 1033
M=D // 1034
@Math.multiply.EQ.6 // 1035
D=A // 1036
@SP // 1037
AM=M+1 // 1038
A=A-1 // 1039
M=D // 1040
@ARG // 1041
A=M // 1042
D=M // 1043
@14 // 1044
M=D // 1045
@SP // 1046
AM=M-1 // 1047
D=M // 1048
@13 // 1049
M=D // 1050
@14 // 1051
D=M // 1052
@DO_EQ // 1053
0;JMP // 1054
(Math.multiply.EQ.6)
@SP // 1055
AM=M+1 // 1056
A=A-1 // 1057
M=D // 1058
@Math.multiply.EQ.7 // 1059
D=A // 1060
@SP // 1061
AM=M+1 // 1062
A=A-1 // 1063
M=D // 1064
@ARG // 1065
A=M+1 // 1066
D=M // 1067
@14 // 1068
M=D // 1069
@SP // 1070
AM=M-1 // 1071
D=M // 1072
@13 // 1073
M=D // 1074
@14 // 1075
D=M // 1076
@DO_EQ // 1077
0;JMP // 1078
(Math.multiply.EQ.7)
@SP // 1079
AM=M-1 // 1080
D=D|M // 1081
@14 // 1082
M=D // 1083
@SP // 1084
AM=M-1 // 1085
D=M // 1086
@13 // 1087
M=D // 1088
@14 // 1089
D=M // 1090
@DO_EQ // 1091
0;JMP // 1092
(Math.multiply.EQ.5)
@Math.multiply.IfElse1 // 1093
D;JNE // 1094

////PushInstruction("constant 0")
@SP // 1095
AM=M+1 // 1096
A=A-1 // 1097
M=0 // 1098

////ReturnInstruction{}
@RETURN // 1099
0;JMP // 1100

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 1101
0;JMP // 1102

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
@Math.multiply.EQ.9 // 1103
D=A // 1104
@SP // 1105
AM=M+1 // 1106
A=A-1 // 1107
M=D // 1108
@Math.multiply.EQ.10 // 1109
D=A // 1110
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=D // 1114
@ARG // 1115
A=M // 1116
D=M-1 // 1117
@14 // 1118
M=D // 1119
@SP // 1120
AM=M-1 // 1121
D=M // 1122
@13 // 1123
M=D // 1124
@14 // 1125
D=M // 1126
@DO_EQ // 1127
0;JMP // 1128
(Math.multiply.EQ.10)
@14 // 1129
M=D // 1130
@SP // 1131
AM=M-1 // 1132
D=M // 1133
@13 // 1134
M=D // 1135
@14 // 1136
D=M // 1137
@DO_EQ // 1138
0;JMP // 1139
(Math.multiply.EQ.9)
@Math.multiply.IfElse2 // 1140
D;JNE // 1141

////PushInstruction("argument 1")
@ARG // 1142
A=M+1 // 1143
D=M // 1144
@SP // 1145
AM=M+1 // 1146
A=A-1 // 1147
M=D // 1148

////ReturnInstruction{}
@RETURN // 1149
0;JMP // 1150

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 1151
0;JMP // 1152

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
@Math.multiply.EQ.12 // 1153
D=A // 1154
@SP // 1155
AM=M+1 // 1156
A=A-1 // 1157
M=D // 1158
@Math.multiply.EQ.13 // 1159
D=A // 1160
@SP // 1161
AM=M+1 // 1162
A=A-1 // 1163
M=D // 1164
@ARG // 1165
A=M+1 // 1166
D=M-1 // 1167
@14 // 1168
M=D // 1169
@SP // 1170
AM=M-1 // 1171
D=M // 1172
@13 // 1173
M=D // 1174
@14 // 1175
D=M // 1176
@DO_EQ // 1177
0;JMP // 1178
(Math.multiply.EQ.13)
@14 // 1179
M=D // 1180
@SP // 1181
AM=M-1 // 1182
D=M // 1183
@13 // 1184
M=D // 1185
@14 // 1186
D=M // 1187
@DO_EQ // 1188
0;JMP // 1189
(Math.multiply.EQ.12)
@Math.multiply.IfElse3 // 1190
D;JNE // 1191

////PushInstruction("argument 0")
@ARG // 1192
A=M // 1193
D=M // 1194
@SP // 1195
AM=M+1 // 1196
A=A-1 // 1197
M=D // 1198

////ReturnInstruction{}
@RETURN // 1199
0;JMP // 1200

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 1201
0;JMP // 1202

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
@Math.multiply.EQ.15 // 1203
D=A // 1204
@SP // 1205
AM=M+1 // 1206
A=A-1 // 1207
M=D // 1208
@Math.multiply.EQ.16 // 1209
D=A // 1210
@SP // 1211
AM=M+1 // 1212
A=A-1 // 1213
M=D // 1214
@ARG // 1215
A=M // 1216
D=M // 1217
@2 // 1218
D=D-A // 1219
@14 // 1220
M=D // 1221
@SP // 1222
AM=M-1 // 1223
D=M // 1224
@13 // 1225
M=D // 1226
@14 // 1227
D=M // 1228
@DO_EQ // 1229
0;JMP // 1230
(Math.multiply.EQ.16)
@14 // 1231
M=D // 1232
@SP // 1233
AM=M-1 // 1234
D=M // 1235
@13 // 1236
M=D // 1237
@14 // 1238
D=M // 1239
@DO_EQ // 1240
0;JMP // 1241
(Math.multiply.EQ.15)
@Math.multiply.IfElse4 // 1242
D;JNE // 1243

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1244
A=M+1 // 1245
D=M // 1246
D=D+M // 1247
@SP // 1248
AM=M+1 // 1249
A=A-1 // 1250
M=D // 1251

////ReturnInstruction{}
@RETURN // 1252
0;JMP // 1253

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 1254
0;JMP // 1255

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
@Math.multiply.EQ.18 // 1256
D=A // 1257
@SP // 1258
AM=M+1 // 1259
A=A-1 // 1260
M=D // 1261
@Math.multiply.EQ.19 // 1262
D=A // 1263
@SP // 1264
AM=M+1 // 1265
A=A-1 // 1266
M=D // 1267
@ARG // 1268
A=M+1 // 1269
D=M // 1270
@2 // 1271
D=D-A // 1272
@14 // 1273
M=D // 1274
@SP // 1275
AM=M-1 // 1276
D=M // 1277
@13 // 1278
M=D // 1279
@14 // 1280
D=M // 1281
@DO_EQ // 1282
0;JMP // 1283
(Math.multiply.EQ.19)
@14 // 1284
M=D // 1285
@SP // 1286
AM=M-1 // 1287
D=M // 1288
@13 // 1289
M=D // 1290
@14 // 1291
D=M // 1292
@DO_EQ // 1293
0;JMP // 1294
(Math.multiply.EQ.18)
@Math.multiply.IfElse5 // 1295
D;JNE // 1296

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1297
A=M // 1298
D=M // 1299
D=D+M // 1300
@SP // 1301
AM=M+1 // 1302
A=A-1 // 1303
M=D // 1304

////ReturnInstruction{}
@RETURN // 1305
0;JMP // 1306

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 1307
0;JMP // 1308

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

D=1 // 1309
@LCL // 1310
A=M+1 // 1311
A=A+1 // 1312
M=D // 1313

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
@Math.multiply.EQ.21 // 1314
D=A // 1315
@SP // 1316
AM=M+1 // 1317
A=A-1 // 1318
M=D // 1319
@Math.multiply.LT.22 // 1320
D=A // 1321
@SP // 1322
AM=M+1 // 1323
A=A-1 // 1324
M=D // 1325
@LCL // 1326
A=M+1 // 1327
D=M // 1328
@16 // 1329
D=D-A // 1330
@14 // 1331
M=D // 1332
@SP // 1333
AM=M-1 // 1334
D=M // 1335
@13 // 1336
M=D // 1337
@14 // 1338
D=M // 1339
@DO_LT // 1340
0;JMP // 1341
(Math.multiply.LT.22)
@14 // 1342
M=D // 1343
@SP // 1344
AM=M-1 // 1345
D=M // 1346
@13 // 1347
M=D // 1348
@14 // 1349
D=M // 1350
@DO_EQ // 1351
0;JMP // 1352
(Math.multiply.EQ.21)
@WHILE_END_Math.multiply1 // 1353
D;JNE // 1354

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
@Math.multiply.EQ.23 // 1355
D=A // 1356
@SP // 1357
AM=M+1 // 1358
A=A-1 // 1359
M=D // 1360
@ARG // 1361
A=M+1 // 1362
D=M // 1363
@SP // 1364
AM=M+1 // 1365
A=A-1 // 1366
M=D // 1367
@LCL // 1368
A=M+1 // 1369
A=A+1 // 1370
D=M // 1371
@SP // 1372
AM=M-1 // 1373
D=D&M // 1374
@14 // 1375
M=D // 1376
@SP // 1377
AM=M-1 // 1378
D=M // 1379
@13 // 1380
M=D // 1381
@14 // 1382
D=M // 1383
@DO_EQ // 1384
0;JMP // 1385
(Math.multiply.EQ.23)
@Math.multiply.IfElse6 // 1386
D;JNE // 1387

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

@LCL // 1388
A=M // 1389
D=M // 1390
@SP // 1391
AM=M+1 // 1392
A=A-1 // 1393
M=D // 1394
@ARG // 1395
A=M // 1396
D=M // 1397
@SP // 1398
AM=M-1 // 1399
D=D+M // 1400
@LCL // 1401
A=M // 1402
M=D // 1403

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 1404
0;JMP // 1405

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

@ARG // 1406
A=M // 1407
D=M // 1408
D=D+M // 1409
@ARG // 1410
A=M // 1411
M=D // 1412

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

@LCL // 1413
A=M+1 // 1414
D=M+1 // 1415
@LCL // 1416
A=M+1 // 1417
M=D // 1418

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

@LCL // 1419
A=M+1 // 1420
A=A+1 // 1421
D=M // 1422
D=D+M // 1423
@LCL // 1424
A=M+1 // 1425
A=A+1 // 1426
M=D // 1427

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1428
0;JMP // 1429

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1430
A=M // 1431
D=M // 1432
@SP // 1433
AM=M+1 // 1434
A=A-1 // 1435
M=D // 1436

////ReturnInstruction{}
@RETURN // 1437
0;JMP // 1438

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 1439
AM=M+1 // 1440
A=A-1 // 1441
M=0 // 1442
@SP // 1443
AM=M+1 // 1444
A=A-1 // 1445
M=0 // 1446
@SP // 1447
AM=M+1 // 1448
A=A-1 // 1449
M=0 // 1450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1451
A=M // 1452
D=M // 1453
@SP // 1454
AM=M+1 // 1455
A=A-1 // 1456
M=D // 1457
// call Math.abs
@6 // 1458
D=A // 1459
@14 // 1460
M=D // 1461
@Math.abs // 1462
D=A // 1463
@13 // 1464
M=D // 1465
@Math.divide.ret.0 // 1466
D=A // 1467
@CALL // 1468
0;JMP // 1469
(Math.divide.ret.0)
@SP // 1470
AM=M-1 // 1471
D=M // 1472
@LCL // 1473
A=M+1 // 1474
A=A+1 // 1475
M=D // 1476

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1477
A=M+1 // 1478
D=M // 1479
@SP // 1480
AM=M+1 // 1481
A=A-1 // 1482
M=D // 1483
// call Math.abs
@6 // 1484
D=A // 1485
@14 // 1486
M=D // 1487
@Math.abs // 1488
D=A // 1489
@13 // 1490
M=D // 1491
@Math.divide.ret.1 // 1492
D=A // 1493
@CALL // 1494
0;JMP // 1495
(Math.divide.ret.1)
@SP // 1496
AM=M-1 // 1497
D=M // 1498
@LCL // 1499
A=M+1 // 1500
M=D // 1501

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
@Math.divide.EQ.26 // 1502
D=A // 1503
@SP // 1504
AM=M+1 // 1505
A=A-1 // 1506
M=D // 1507
@Math.divide.EQ.27 // 1508
D=A // 1509
@SP // 1510
AM=M+1 // 1511
A=A-1 // 1512
M=D // 1513
@ARG // 1514
A=M // 1515
D=M // 1516
@14 // 1517
M=D // 1518
@SP // 1519
AM=M-1 // 1520
D=M // 1521
@13 // 1522
M=D // 1523
@14 // 1524
D=M // 1525
@DO_EQ // 1526
0;JMP // 1527
(Math.divide.EQ.27)
@SP // 1528
AM=M+1 // 1529
A=A-1 // 1530
M=D // 1531
@Math.divide.GT.28 // 1532
D=A // 1533
@SP // 1534
AM=M+1 // 1535
A=A-1 // 1536
M=D // 1537
@LCL // 1538
A=M+1 // 1539
A=A+1 // 1540
D=M // 1541
A=A-1 // 1542
D=M-D // 1543
@14 // 1544
M=D // 1545
@SP // 1546
AM=M-1 // 1547
D=M // 1548
@13 // 1549
M=D // 1550
@14 // 1551
D=M // 1552
@DO_GT // 1553
0;JMP // 1554
(Math.divide.GT.28)
@SP // 1555
AM=M-1 // 1556
D=D|M // 1557
@14 // 1558
M=D // 1559
@SP // 1560
AM=M-1 // 1561
D=M // 1562
@13 // 1563
M=D // 1564
@14 // 1565
D=M // 1566
@DO_EQ // 1567
0;JMP // 1568
(Math.divide.EQ.26)
@Math.divide.IfElse1 // 1569
D;JNE // 1570

////PushInstruction("constant 0")
@SP // 1571
AM=M+1 // 1572
A=A-1 // 1573
M=0 // 1574

////ReturnInstruction{}
@RETURN // 1575
0;JMP // 1576

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 1577
0;JMP // 1578

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
@Math.divide.EQ.30 // 1579
D=A // 1580
@SP // 1581
AM=M+1 // 1582
A=A-1 // 1583
M=D // 1584
@Math.divide.EQ.31 // 1585
D=A // 1586
@SP // 1587
AM=M+1 // 1588
A=A-1 // 1589
M=D // 1590
@ARG // 1591
A=M+1 // 1592
D=M // 1593
A=A-1 // 1594
D=M-D // 1595
@14 // 1596
M=D // 1597
@SP // 1598
AM=M-1 // 1599
D=M // 1600
@13 // 1601
M=D // 1602
@14 // 1603
D=M // 1604
@DO_EQ // 1605
0;JMP // 1606
(Math.divide.EQ.31)
@14 // 1607
M=D // 1608
@SP // 1609
AM=M-1 // 1610
D=M // 1611
@13 // 1612
M=D // 1613
@14 // 1614
D=M // 1615
@DO_EQ // 1616
0;JMP // 1617
(Math.divide.EQ.30)
@Math.divide.IfElse2 // 1618
D;JNE // 1619

////PushInstruction("constant 1")
@SP // 1620
AM=M+1 // 1621
A=A-1 // 1622
M=1 // 1623

////ReturnInstruction{}
@RETURN // 1624
0;JMP // 1625

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1626
0;JMP // 1627

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
@Math.divide.EQ.34 // 1628
D=A // 1629
@SP // 1630
AM=M+1 // 1631
A=A-1 // 1632
M=D // 1633
@Math.divide.LT.35 // 1634
D=A // 1635
@SP // 1636
AM=M+1 // 1637
A=A-1 // 1638
M=D // 1639
@ARG // 1640
A=M // 1641
D=M // 1642
@14 // 1643
M=D // 1644
@SP // 1645
AM=M-1 // 1646
D=M // 1647
@13 // 1648
M=D // 1649
@14 // 1650
D=M // 1651
@DO_LT // 1652
0;JMP // 1653
(Math.divide.LT.35)
@SP // 1654
AM=M+1 // 1655
A=A-1 // 1656
M=D // 1657
@Math.divide.LT.36 // 1658
D=A // 1659
@SP // 1660
AM=M+1 // 1661
A=A-1 // 1662
M=D // 1663
@ARG // 1664
A=M+1 // 1665
D=M // 1666
@14 // 1667
M=D // 1668
@SP // 1669
AM=M-1 // 1670
D=M // 1671
@13 // 1672
M=D // 1673
@14 // 1674
D=M // 1675
@DO_LT // 1676
0;JMP // 1677
(Math.divide.LT.36)
@SP // 1678
AM=M-1 // 1679
D=D|M // 1680
@14 // 1681
M=D // 1682
@SP // 1683
AM=M-1 // 1684
D=M // 1685
@13 // 1686
M=D // 1687
@14 // 1688
D=M // 1689
@DO_EQ // 1690
0;JMP // 1691
(Math.divide.EQ.34)
@Math.divide.IfElse3 // 1692
D;JNE // 1693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 1")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1694
A=M+1 // 1695
A=A+1 // 1696
D=M // 1697
@SP // 1698
AM=M+1 // 1699
A=A-1 // 1700
M=D // 1701
@LCL // 1702
A=M+1 // 1703
D=M // 1704
@SP // 1705
AM=M+1 // 1706
A=A-1 // 1707
M=D // 1708
// call Math.divide
@7 // 1709
D=A // 1710
@14 // 1711
M=D // 1712
@Math.divide // 1713
D=A // 1714
@13 // 1715
M=D // 1716
@Math.divide.ret.2 // 1717
D=A // 1718
@CALL // 1719
0;JMP // 1720
(Math.divide.ret.2)
@SP // 1721
AM=M-1 // 1722
D=M // 1723
@LCL // 1724
A=M // 1725
M=D // 1726

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
@Math.divide.EQ.39 // 1727
D=A // 1728
@SP // 1729
AM=M+1 // 1730
A=A-1 // 1731
M=D // 1732
@Math.divide.LT.40 // 1733
D=A // 1734
@SP // 1735
AM=M+1 // 1736
A=A-1 // 1737
M=D // 1738
@ARG // 1739
A=M // 1740
D=M // 1741
@14 // 1742
M=D // 1743
@SP // 1744
AM=M-1 // 1745
D=M // 1746
@13 // 1747
M=D // 1748
@14 // 1749
D=M // 1750
@DO_LT // 1751
0;JMP // 1752
(Math.divide.LT.40)
@SP // 1753
AM=M+1 // 1754
A=A-1 // 1755
M=D // 1756
@Math.divide.LT.41 // 1757
D=A // 1758
@SP // 1759
AM=M+1 // 1760
A=A-1 // 1761
M=D // 1762
@ARG // 1763
A=M+1 // 1764
D=M // 1765
@14 // 1766
M=D // 1767
@SP // 1768
AM=M-1 // 1769
D=M // 1770
@13 // 1771
M=D // 1772
@14 // 1773
D=M // 1774
@DO_LT // 1775
0;JMP // 1776
(Math.divide.LT.41)
@SP // 1777
AM=M-1 // 1778
D=D&M // 1779
@14 // 1780
M=D // 1781
@SP // 1782
AM=M-1 // 1783
D=M // 1784
@13 // 1785
M=D // 1786
@14 // 1787
D=M // 1788
@DO_EQ // 1789
0;JMP // 1790
(Math.divide.EQ.39)
@Math.divide.IfElse4 // 1791
D;JNE // 1792

////PushInstruction("local 0")
@LCL // 1793
A=M // 1794
D=M // 1795
@SP // 1796
AM=M+1 // 1797
A=A-1 // 1798
M=D // 1799

////ReturnInstruction{}
@RETURN // 1800
0;JMP // 1801

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 1802
0;JMP // 1803

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
@LCL // 1804
A=M // 1805
D=M // 1806
@SP // 1807
AM=M+1 // 1808
A=A-1 // 1809
M=D // 1810
@SP // 1811
A=M-1 // 1812
M=-D // 1813

////ReturnInstruction{}
@RETURN // 1814
0;JMP // 1815

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 1816
0;JMP // 1817

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
//)], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1818
A=M // 1819
D=M // 1820
@SP // 1821
AM=M+1 // 1822
A=A-1 // 1823
M=D // 1824
@ARG // 1825
A=M+1 // 1826
D=M // 1827
D=D+M // 1828
@SP // 1829
AM=M+1 // 1830
A=A-1 // 1831
M=D // 1832
// call Math.divide
@7 // 1833
D=A // 1834
@14 // 1835
M=D // 1836
@Math.divide // 1837
D=A // 1838
@13 // 1839
M=D // 1840
@Math.divide.ret.3 // 1841
D=A // 1842
@CALL // 1843
0;JMP // 1844
(Math.divide.ret.3)
@SP // 1845
AM=M-1 // 1846
D=M // 1847
@LCL // 1848
A=M // 1849
M=D // 1850

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
//), PushInstruction("argument 1")], call=CallInstruction{Math.multiply}},
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
@Math.divide.EQ.43 // 1851
D=A // 1852
@SP // 1853
AM=M+1 // 1854
A=A-1 // 1855
M=D // 1856
@Math.divide.LT.44 // 1857
D=A // 1858
@SP // 1859
AM=M+1 // 1860
A=A-1 // 1861
M=D // 1862
@ARG // 1863
A=M // 1864
D=M // 1865
@SP // 1866
AM=M+1 // 1867
A=A-1 // 1868
M=D // 1869
@LCL // 1870
A=M // 1871
D=M // 1872
D=D+M // 1873
@SP // 1874
AM=M+1 // 1875
A=A-1 // 1876
M=D // 1877
@ARG // 1878
A=M+1 // 1879
D=M // 1880
@SP // 1881
AM=M+1 // 1882
A=A-1 // 1883
M=D // 1884
// call Math.multiply
@7 // 1885
D=A // 1886
@14 // 1887
M=D // 1888
@Math.multiply // 1889
D=A // 1890
@13 // 1891
M=D // 1892
@Math.divide.ret.5 // 1893
D=A // 1894
@CALL // 1895
0;JMP // 1896
(Math.divide.ret.5)
@SP // 1897
AM=M-1 // 1898
D=M // 1899
@SP // 1900
AM=M-1 // 1901
D=M-D // 1902
@SP // 1903
AM=M+1 // 1904
A=A-1 // 1905
M=D // 1906
@ARG // 1907
A=M+1 // 1908
D=M // 1909
@SP // 1910
AM=M-1 // 1911
D=M-D // 1912
@14 // 1913
M=D // 1914
@SP // 1915
AM=M-1 // 1916
D=M // 1917
@13 // 1918
M=D // 1919
@14 // 1920
D=M // 1921
@DO_LT // 1922
0;JMP // 1923
(Math.divide.LT.44)
@14 // 1924
M=D // 1925
@SP // 1926
AM=M-1 // 1927
D=M // 1928
@13 // 1929
M=D // 1930
@14 // 1931
D=M // 1932
@DO_EQ // 1933
0;JMP // 1934
(Math.divide.EQ.43)
@Math.divide.IfElse5 // 1935
D;JNE // 1936

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 1937
A=M // 1938
D=M // 1939
D=D+M // 1940
@SP // 1941
AM=M+1 // 1942
A=A-1 // 1943
M=D // 1944

////ReturnInstruction{}
@RETURN // 1945
0;JMP // 1946

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 1947
0;JMP // 1948

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
@LCL // 1949
A=M // 1950
D=M // 1951
D=D+M // 1952
D=M+1 // 1953
@SP // 1954
AM=M+1 // 1955
A=A-1 // 1956
M=D // 1957

////ReturnInstruction{}
@RETURN // 1958
0;JMP // 1959

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=6, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Math.divide}}, PushInstruction("argument 1")], call=CallInstruction{Math.multiply}},
//    binaryOp: "SUB"
//)
@ARG // 1960
A=M // 1961
D=M // 1962
@SP // 1963
AM=M+1 // 1964
A=A-1 // 1965
M=D // 1966
@ARG // 1967
A=M // 1968
D=M // 1969
@SP // 1970
AM=M+1 // 1971
A=A-1 // 1972
M=D // 1973
@ARG // 1974
A=M+1 // 1975
D=M // 1976
@SP // 1977
AM=M+1 // 1978
A=A-1 // 1979
M=D // 1980
// call Math.divide
@7 // 1981
D=A // 1982
@14 // 1983
M=D // 1984
@Math.divide // 1985
D=A // 1986
@13 // 1987
M=D // 1988
@Math.mod.ret.0 // 1989
D=A // 1990
@CALL // 1991
0;JMP // 1992
(Math.mod.ret.0)
@ARG // 1993
A=M+1 // 1994
D=M // 1995
@SP // 1996
AM=M+1 // 1997
A=A-1 // 1998
M=D // 1999
// call Math.multiply
@7 // 2000
D=A // 2001
@14 // 2002
M=D // 2003
@Math.multiply // 2004
D=A // 2005
@13 // 2006
M=D // 2007
@Math.mod.ret.1 // 2008
D=A // 2009
@CALL // 2010
0;JMP // 2011
(Math.mod.ret.1)
@SP // 2012
AM=M-1 // 2013
D=M // 2014
@SP // 2015
AM=M-1 // 2016
D=M-D // 2017
@SP // 2018
AM=M+1 // 2019
A=A-1 // 2020
M=D // 2021

////ReturnInstruction{}
@RETURN // 2022
0;JMP // 2023

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
@Math.0 // 2024
D=M // 2025
@SP // 2026
AM=M+1 // 2027
A=A-1 // 2028
M=D // 2029
@ARG // 2030
A=M // 2031
D=M // 2032
@SP // 2033
AM=M-1 // 2034
A=D+M // 2035
D=M // 2036
@SP // 2037
AM=M+1 // 2038
A=A-1 // 2039
M=D // 2040

////ReturnInstruction{}
@RETURN // 2041
0;JMP // 2042

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=6, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 2043
AM=M+1 // 2044
A=A-1 // 2045
M=0 // 2046
@SP // 2047
AM=M+1 // 2048
A=A-1 // 2049
M=0 // 2050
@SP // 2051
AM=M+1 // 2052
A=A-1 // 2053
M=0 // 2054
@SP // 2055
AM=M+1 // 2056
A=A-1 // 2057
M=0 // 2058

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 2059
@LCL // 2060
A=M // 2061
M=D // 2062

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 2063
D=A // 2064
@LCL // 2065
A=M+1 // 2066
M=D // 2067

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
@Math.sqrt.EQ.46 // 2068
D=A // 2069
@SP // 2070
AM=M+1 // 2071
A=A-1 // 2072
M=D // 2073
@Math.sqrt.LT.47 // 2074
D=A // 2075
@SP // 2076
AM=M+1 // 2077
A=A-1 // 2078
M=D // 2079
@LCL // 2080
A=M+1 // 2081
D=M // 2082
@14 // 2083
M=D // 2084
@SP // 2085
AM=M-1 // 2086
D=M // 2087
@13 // 2088
M=D // 2089
@14 // 2090
D=M // 2091
@DO_LT // 2092
0;JMP // 2093
(Math.sqrt.LT.47)
D=!D // 2094
@14 // 2095
M=D // 2096
@SP // 2097
AM=M-1 // 2098
D=M // 2099
@13 // 2100
M=D // 2101
@14 // 2102
D=M // 2103
@DO_EQ // 2104
0;JMP // 2105
(Math.sqrt.EQ.46)
@WHILE_END_Math.sqrt1 // 2106
D;JNE // 2107

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

@LCL // 2108
A=M // 2109
D=M // 2110
@SP // 2111
AM=M+1 // 2112
A=A-1 // 2113
M=D // 2114
@Math.0 // 2115
D=M // 2116
@SP // 2117
AM=M+1 // 2118
A=A-1 // 2119
M=D // 2120
@LCL // 2121
A=M+1 // 2122
D=M // 2123
@SP // 2124
AM=M-1 // 2125
A=D+M // 2126
D=M // 2127
@SP // 2128
AM=M-1 // 2129
D=D+M // 2130
@LCL // 2131
A=M+1 // 2132
A=A+1 // 2133
M=D // 2134

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 2135
A=M+1 // 2136
A=A+1 // 2137
D=M // 2138
@SP // 2139
AM=M+1 // 2140
A=A-1 // 2141
M=D // 2142
@LCL // 2143
A=M+1 // 2144
A=A+1 // 2145
D=M // 2146
@SP // 2147
AM=M+1 // 2148
A=A-1 // 2149
M=D // 2150
// call Math.multiply
@7 // 2151
D=A // 2152
@14 // 2153
M=D // 2154
@Math.multiply // 2155
D=A // 2156
@13 // 2157
M=D // 2158
@Math.sqrt.ret.0 // 2159
D=A // 2160
@CALL // 2161
0;JMP // 2162
(Math.sqrt.ret.0)
@SP // 2163
AM=M-1 // 2164
D=M // 2165
@LCL // 2166
A=M+1 // 2167
A=A+1 // 2168
A=A+1 // 2169
M=D // 2170

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
@Math.sqrt.EQ.50 // 2171
D=A // 2172
@SP // 2173
AM=M+1 // 2174
A=A-1 // 2175
M=D // 2176
@Math.sqrt.GT.51 // 2177
D=A // 2178
@SP // 2179
AM=M+1 // 2180
A=A-1 // 2181
M=D // 2182
@LCL // 2183
A=M+1 // 2184
A=A+1 // 2185
A=A+1 // 2186
D=M // 2187
@SP // 2188
AM=M+1 // 2189
A=A-1 // 2190
M=D // 2191
@ARG // 2192
A=M // 2193
D=M // 2194
@SP // 2195
AM=M-1 // 2196
D=M-D // 2197
@14 // 2198
M=D // 2199
@SP // 2200
AM=M-1 // 2201
D=M // 2202
@13 // 2203
M=D // 2204
@14 // 2205
D=M // 2206
@DO_GT // 2207
0;JMP // 2208
(Math.sqrt.GT.51)
@SP // 2209
AM=M+1 // 2210
A=A-1 // 2211
M=D // 2212
@SP // 2213
A=M-1 // 2214
M=!D // 2215
@Math.sqrt.GT.52 // 2216
D=A // 2217
@SP // 2218
AM=M+1 // 2219
A=A-1 // 2220
M=D // 2221
@LCL // 2222
A=M+1 // 2223
A=A+1 // 2224
A=A+1 // 2225
D=M // 2226
@14 // 2227
M=D // 2228
@SP // 2229
AM=M-1 // 2230
D=M // 2231
@13 // 2232
M=D // 2233
@14 // 2234
D=M // 2235
@DO_GT // 2236
0;JMP // 2237
(Math.sqrt.GT.52)
@SP // 2238
AM=M-1 // 2239
D=D&M // 2240
@14 // 2241
M=D // 2242
@SP // 2243
AM=M-1 // 2244
D=M // 2245
@13 // 2246
M=D // 2247
@14 // 2248
D=M // 2249
@DO_EQ // 2250
0;JMP // 2251
(Math.sqrt.EQ.50)
@Math.sqrt.IfElse1 // 2252
D;JNE // 2253

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2254
A=M+1 // 2255
A=A+1 // 2256
D=M // 2257
@LCL // 2258
A=M // 2259
M=D // 2260

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 2261
0;JMP // 2262

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

@LCL // 2263
A=M+1 // 2264
D=M-1 // 2265
@LCL // 2266
A=M+1 // 2267
M=D // 2268

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 2269
0;JMP // 2270

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 2271
A=M // 2272
D=M // 2273
@SP // 2274
AM=M+1 // 2275
A=A-1 // 2276
M=D // 2277

////ReturnInstruction{}
@RETURN // 2278
0;JMP // 2279

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
@Math.max.EQ.54 // 2280
D=A // 2281
@SP // 2282
AM=M+1 // 2283
A=A-1 // 2284
M=D // 2285
@Math.max.GT.55 // 2286
D=A // 2287
@SP // 2288
AM=M+1 // 2289
A=A-1 // 2290
M=D // 2291
@ARG // 2292
A=M+1 // 2293
D=M // 2294
A=A-1 // 2295
D=M-D // 2296
@14 // 2297
M=D // 2298
@SP // 2299
AM=M-1 // 2300
D=M // 2301
@13 // 2302
M=D // 2303
@14 // 2304
D=M // 2305
@DO_GT // 2306
0;JMP // 2307
(Math.max.GT.55)
@14 // 2308
M=D // 2309
@SP // 2310
AM=M-1 // 2311
D=M // 2312
@13 // 2313
M=D // 2314
@14 // 2315
D=M // 2316
@DO_EQ // 2317
0;JMP // 2318
(Math.max.EQ.54)
@Math.max.IfElse1 // 2319
D;JNE // 2320

////PushInstruction("argument 0")
@ARG // 2321
A=M // 2322
D=M // 2323
@SP // 2324
AM=M+1 // 2325
A=A-1 // 2326
M=D // 2327

////ReturnInstruction{}
@RETURN // 2328
0;JMP // 2329

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 2330
0;JMP // 2331

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2332
A=M+1 // 2333
D=M // 2334
@SP // 2335
AM=M+1 // 2336
A=A-1 // 2337
M=D // 2338

////ReturnInstruction{}
@RETURN // 2339
0;JMP // 2340

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
@Math.min.EQ.57 // 2341
D=A // 2342
@SP // 2343
AM=M+1 // 2344
A=A-1 // 2345
M=D // 2346
@Math.min.LT.58 // 2347
D=A // 2348
@SP // 2349
AM=M+1 // 2350
A=A-1 // 2351
M=D // 2352
@ARG // 2353
A=M+1 // 2354
D=M // 2355
A=A-1 // 2356
D=M-D // 2357
@14 // 2358
M=D // 2359
@SP // 2360
AM=M-1 // 2361
D=M // 2362
@13 // 2363
M=D // 2364
@14 // 2365
D=M // 2366
@DO_LT // 2367
0;JMP // 2368
(Math.min.LT.58)
@14 // 2369
M=D // 2370
@SP // 2371
AM=M-1 // 2372
D=M // 2373
@13 // 2374
M=D // 2375
@14 // 2376
D=M // 2377
@DO_EQ // 2378
0;JMP // 2379
(Math.min.EQ.57)
@Math.min.IfElse1 // 2380
D;JNE // 2381

////PushInstruction("argument 0")
@ARG // 2382
A=M // 2383
D=M // 2384
@SP // 2385
AM=M+1 // 2386
A=A-1 // 2387
M=D // 2388

////ReturnInstruction{}
@RETURN // 2389
0;JMP // 2390

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 2391
0;JMP // 2392

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2393
A=M+1 // 2394
D=M // 2395
@SP // 2396
AM=M+1 // 2397
A=A-1 // 2398
M=D // 2399

////ReturnInstruction{}
@RETURN // 2400
0;JMP // 2401

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=6, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2402
A=M // 2403
D=M // 2404
@SP // 2405
AM=M+1 // 2406
A=A-1 // 2407
M=D // 2408
@ARG // 2409
A=M // 2410
D=M // 2411
@SP // 2412
AM=M+1 // 2413
A=A-1 // 2414
M=D // 2415
@SP // 2416
A=M-1 // 2417
M=-D // 2418
// call Math.max
@7 // 2419
D=A // 2420
@14 // 2421
M=D // 2422
@Math.max // 2423
D=A // 2424
@13 // 2425
M=D // 2426
@Math.abs.ret.0 // 2427
D=A // 2428
@CALL // 2429
0;JMP // 2430
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 2431
0;JMP // 2432

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 2433
AM=M+1 // 2434
A=A-1 // 2435
M=0 // 2436
@SP // 2437
AM=M+1 // 2438
A=A-1 // 2439
M=0 // 2440

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

@2055 // 2441
D=A // 2442
@LCL // 2443
A=M // 2444
M=D // 2445

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
@LCL // 2446
A=M // 2447
D=M // 2448
@SP // 2449
AM=M+1 // 2450
A=A-1 // 2451
M=D // 2452
@LCL // 2453
A=M // 2454
D=M // 2455
@16384 // 2456
D=A-D // 2457
@5 // 2458
D=D-A // 2459
@SP // 2460
AM=M-1 // 2461
A=M // 2462
M=D // 2463

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2464
A=M // 2465
D=M // 2466
@SP // 2467
AM=M+1 // 2468
A=A-1 // 2469
M=D+1 // 2470
D=1 // 2471
@SP // 2472
AM=M-1 // 2473
A=M // 2474
M=D // 2475

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2476
A=M // 2477
D=M // 2478
@2 // 2479
D=D+A // 2480
@SP // 2481
AM=M+1 // 2482
A=A-1 // 2483
M=D // 2484
D=0 // 2485
@SP // 2486
AM=M-1 // 2487
A=M // 2488
M=D // 2489

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2490
A=M // 2491
D=M // 2492
@3 // 2493
D=D+A // 2494
@SP // 2495
AM=M+1 // 2496
A=A-1 // 2497
M=D // 2498
D=0 // 2499
@SP // 2500
AM=M-1 // 2501
A=M // 2502
M=D // 2503

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2504
A=M // 2505
D=M // 2506
@SP // 2507
AM=M+1 // 2508
A=A-1 // 2509
M=D // 2510
// call Memory.create_foot
@6 // 2511
D=A // 2512
@14 // 2513
M=D // 2514
@Memory.create_foot // 2515
D=A // 2516
@13 // 2517
M=D // 2518
@Memory.init.ret.0 // 2519
D=A // 2520
@CALL // 2521
0;JMP // 2522
(Memory.init.ret.0)
@SP // 2523
AM=M-1 // 2524
D=M // 2525
@5 // 2526
M=D // 2527

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

@2054 // 2528
D=A // 2529
@SP // 2530
AM=M+1 // 2531
A=A-1 // 2532
M=D // 2533
@2054 // 2534
D=A // 2535
@SP // 2536
AM=M+1 // 2537
A=A-1 // 2538
M=D // 2539
@LCL // 2540
A=M // 2541
D=M // 2542
@SP // 2543
AM=M+1 // 2544
A=A-1 // 2545
M=D // 2546
// call Memory.add_node
@7 // 2547
D=A // 2548
@14 // 2549
M=D // 2550
@Memory.add_node // 2551
D=A // 2552
@13 // 2553
M=D // 2554
@Memory.init.ret.1 // 2555
D=A // 2556
@CALL // 2557
0;JMP // 2558
(Memory.init.ret.1)
@SP // 2559
AM=M-1 // 2560
D=M // 2561
@5 // 2562
M=D // 2563

////PushInstruction("constant 0")
@SP // 2564
AM=M+1 // 2565
A=A-1 // 2566
M=0 // 2567

////ReturnInstruction{}
@RETURN // 2568
0;JMP // 2569

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 2570
AM=M+1 // 2571
A=A-1 // 2572
M=0 // 2573
@SP // 2574
AM=M+1 // 2575
A=A-1 // 2576
M=0 // 2577
@SP // 2578
AM=M+1 // 2579
A=A-1 // 2580
M=0 // 2581
@SP // 2582
AM=M+1 // 2583
A=A-1 // 2584
M=0 // 2585
@SP // 2586
AM=M+1 // 2587
A=A-1 // 2588
M=0 // 2589

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2590
A=M // 2591
D=M // 2592
@SP // 2593
AM=M+1 // 2594
A=A-1 // 2595
M=D // 2596
// call Memory.getBinIndex
@6 // 2597
D=A // 2598
@14 // 2599
M=D // 2600
@Memory.getBinIndex // 2601
D=A // 2602
@13 // 2603
M=D // 2604
@Memory.alloc.ret.0 // 2605
D=A // 2606
@CALL // 2607
0;JMP // 2608
(Memory.alloc.ret.0)
@SP // 2609
AM=M-1 // 2610
D=M // 2611
@LCL // 2612
A=M // 2613
M=D // 2614

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

@LCL // 2615
A=M // 2616
D=M // 2617
@2048 // 2618
D=D+A // 2619
@LCL // 2620
A=M+1 // 2621
M=D // 2622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2623
A=M+1 // 2624
D=M // 2625
@SP // 2626
AM=M+1 // 2627
A=A-1 // 2628
M=D // 2629
@ARG // 2630
A=M // 2631
D=M // 2632
@SP // 2633
AM=M+1 // 2634
A=A-1 // 2635
M=D // 2636
// call Memory.get_best_fit
@7 // 2637
D=A // 2638
@14 // 2639
M=D // 2640
@Memory.get_best_fit // 2641
D=A // 2642
@13 // 2643
M=D // 2644
@Memory.alloc.ret.1 // 2645
D=A // 2646
@CALL // 2647
0;JMP // 2648
(Memory.alloc.ret.1)
@SP // 2649
AM=M-1 // 2650
D=M // 2651
@LCL // 2652
A=M+1 // 2653
A=A+1 // 2654
M=D // 2655

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
@Memory.alloc.EQ.1 // 2656
D=A // 2657
@SP // 2658
AM=M+1 // 2659
A=A-1 // 2660
M=D // 2661
@Memory.alloc.EQ.2 // 2662
D=A // 2663
@SP // 2664
AM=M+1 // 2665
A=A-1 // 2666
M=D // 2667
@LCL // 2668
A=M+1 // 2669
A=A+1 // 2670
D=M // 2671
@14 // 2672
M=D // 2673
@SP // 2674
AM=M-1 // 2675
D=M // 2676
@13 // 2677
M=D // 2678
@14 // 2679
D=M // 2680
@DO_EQ // 2681
0;JMP // 2682
(Memory.alloc.EQ.2)
@14 // 2683
M=D // 2684
@SP // 2685
AM=M-1 // 2686
D=M // 2687
@13 // 2688
M=D // 2689
@14 // 2690
D=M // 2691
@DO_EQ // 2692
0;JMP // 2693
(Memory.alloc.EQ.1)
@WHILE_END_Memory.alloc1 // 2694
D;JNE // 2695

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
@Memory.alloc.EQ.4 // 2696
D=A // 2697
@SP // 2698
AM=M+1 // 2699
A=A-1 // 2700
M=D // 2701
@Memory.alloc.LT.5 // 2702
D=A // 2703
@SP // 2704
AM=M+1 // 2705
A=A-1 // 2706
M=D // 2707
@LCL // 2708
A=M // 2709
D=M+1 // 2710
@7 // 2711
D=D-A // 2712
@14 // 2713
M=D // 2714
@SP // 2715
AM=M-1 // 2716
D=M // 2717
@13 // 2718
M=D // 2719
@14 // 2720
D=M // 2721
@DO_LT // 2722
0;JMP // 2723
(Memory.alloc.LT.5)
D=!D // 2724
@14 // 2725
M=D // 2726
@SP // 2727
AM=M-1 // 2728
D=M // 2729
@13 // 2730
M=D // 2731
@14 // 2732
D=M // 2733
@DO_EQ // 2734
0;JMP // 2735
(Memory.alloc.EQ.4)
@Memory.alloc.IfElse1 // 2736
D;JNE // 2737

////PushInstruction("constant 0")
@SP // 2738
AM=M+1 // 2739
A=A-1 // 2740
M=0 // 2741

////ReturnInstruction{}
@RETURN // 2742
0;JMP // 2743

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 2744
0;JMP // 2745

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

@LCL // 2746
A=M // 2747
D=M+1 // 2748
@LCL // 2749
A=M // 2750
M=D // 2751

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

@LCL // 2752
A=M // 2753
D=M // 2754
@2048 // 2755
D=D+A // 2756
@LCL // 2757
A=M+1 // 2758
M=D // 2759

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2760
A=M+1 // 2761
D=M // 2762
@SP // 2763
AM=M+1 // 2764
A=A-1 // 2765
M=D // 2766
@ARG // 2767
A=M // 2768
D=M // 2769
@SP // 2770
AM=M+1 // 2771
A=A-1 // 2772
M=D // 2773
// call Memory.get_best_fit
@7 // 2774
D=A // 2775
@14 // 2776
M=D // 2777
@Memory.get_best_fit // 2778
D=A // 2779
@13 // 2780
M=D // 2781
@Memory.alloc.ret.2 // 2782
D=A // 2783
@CALL // 2784
0;JMP // 2785
(Memory.alloc.ret.2)
@SP // 2786
AM=M-1 // 2787
D=M // 2788
@LCL // 2789
A=M+1 // 2790
A=A+1 // 2791
M=D // 2792

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2793
0;JMP // 2794

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

@LCL // 2795
A=M+1 // 2796
A=A+1 // 2797
A=M // 2798
D=M // 2799
@SP // 2800
AM=M+1 // 2801
A=A-1 // 2802
M=D // 2803
// call Memory.getBinIndex
@6 // 2804
D=A // 2805
@14 // 2806
M=D // 2807
@Memory.getBinIndex // 2808
D=A // 2809
@13 // 2810
M=D // 2811
@Memory.alloc.ret.4 // 2812
D=A // 2813
@CALL // 2814
0;JMP // 2815
(Memory.alloc.ret.4)
@SP // 2816
AM=M-1 // 2817
D=M // 2818
@2048 // 2819
D=D+A // 2820
@SP // 2821
AM=M+1 // 2822
A=A-1 // 2823
M=D // 2824
@LCL // 2825
A=M+1 // 2826
A=A+1 // 2827
D=M // 2828
@SP // 2829
AM=M+1 // 2830
A=A-1 // 2831
M=D // 2832
// call Memory.remove_node
@7 // 2833
D=A // 2834
@14 // 2835
M=D // 2836
@Memory.remove_node // 2837
D=A // 2838
@13 // 2839
M=D // 2840
@Memory.alloc.ret.5 // 2841
D=A // 2842
@CALL // 2843
0;JMP // 2844
(Memory.alloc.ret.5)
@SP // 2845
AM=M-1 // 2846
D=M // 2847
@5 // 2848
M=D // 2849

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

@LCL // 2850
A=M+1 // 2851
A=A+1 // 2852
A=M // 2853
D=M // 2854
@SP // 2855
AM=M+1 // 2856
A=A-1 // 2857
M=D // 2858
@ARG // 2859
A=M // 2860
D=M // 2861
@SP // 2862
AM=M-1 // 2863
D=M-D // 2864
@LCL // 2865
A=M+1 // 2866
A=A+1 // 2867
A=A+1 // 2868
M=D // 2869

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
@Memory.alloc.EQ.7 // 2870
D=A // 2871
@SP // 2872
AM=M+1 // 2873
A=A-1 // 2874
M=D // 2875
@Memory.alloc.GT.8 // 2876
D=A // 2877
@SP // 2878
AM=M+1 // 2879
A=A-1 // 2880
M=D // 2881
@LCL // 2882
A=M+1 // 2883
A=A+1 // 2884
A=A+1 // 2885
D=M // 2886
@5 // 2887
D=D-A // 2888
@14 // 2889
M=D // 2890
@SP // 2891
AM=M-1 // 2892
D=M // 2893
@13 // 2894
M=D // 2895
@14 // 2896
D=M // 2897
@DO_GT // 2898
0;JMP // 2899
(Memory.alloc.GT.8)
@14 // 2900
M=D // 2901
@SP // 2902
AM=M-1 // 2903
D=M // 2904
@13 // 2905
M=D // 2906
@14 // 2907
D=M // 2908
@DO_EQ // 2909
0;JMP // 2910
(Memory.alloc.EQ.7)
@Memory.alloc.IfElse2 // 2911
D;JNE // 2912

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2913
A=M+1 // 2914
A=A+1 // 2915
D=M // 2916
@SP // 2917
AM=M+1 // 2918
A=A-1 // 2919
M=D // 2920
@ARG // 2921
A=M // 2922
D=M // 2923
@SP // 2924
AM=M-1 // 2925
A=M // 2926
M=D // 2927

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2928
A=M+1 // 2929
A=A+1 // 2930
D=M // 2931
@SP // 2932
AM=M+1 // 2933
A=A-1 // 2934
M=D+1 // 2935
D=0 // 2936
@SP // 2937
AM=M-1 // 2938
A=M // 2939
M=D // 2940

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2941
A=M+1 // 2942
A=A+1 // 2943
D=M // 2944
@SP // 2945
AM=M+1 // 2946
A=A-1 // 2947
M=D // 2948
// call Memory.create_foot
@6 // 2949
D=A // 2950
@14 // 2951
M=D // 2952
@Memory.create_foot // 2953
D=A // 2954
@13 // 2955
M=D // 2956
@Memory.alloc.ret.6 // 2957
D=A // 2958
@CALL // 2959
0;JMP // 2960
(Memory.alloc.ret.6)
@SP // 2961
AM=M-1 // 2962
D=M // 2963
@5 // 2964
M=D // 2965

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

@LCL // 2966
A=M+1 // 2967
A=A+1 // 2968
D=M // 2969
@SP // 2970
AM=M+1 // 2971
A=A-1 // 2972
M=D // 2973
@ARG // 2974
A=M // 2975
D=M // 2976
@SP // 2977
AM=M-1 // 2978
D=D+M // 2979
@5 // 2980
D=D+A // 2981
@SP // 2982
AM=M+1 // 2983
A=A-1 // 2984
M=D // 2985
@LCL // 2986
D=M // 2987
@4 // 2988
A=D+A // 2989
D=A // 2990
@R13 // 2991
M=D // 2992
@SP // 2993
AM=M-1 // 2994
D=M // 2995
@R13 // 2996
A=M // 2997
M=D // 2998

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
@LCL // 2999
D=M // 3000
@4 // 3001
A=D+A // 3002
D=M // 3003
@SP // 3004
AM=M+1 // 3005
A=A-1 // 3006
M=D // 3007
@LCL // 3008
A=M+1 // 3009
A=A+1 // 3010
A=A+1 // 3011
D=M // 3012
@5 // 3013
D=D-A // 3014
@SP // 3015
AM=M-1 // 3016
A=M // 3017
M=D // 3018

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3019
D=M // 3020
@4 // 3021
A=D+A // 3022
D=M // 3023
@SP // 3024
AM=M+1 // 3025
A=A-1 // 3026
M=D+1 // 3027
D=1 // 3028
@SP // 3029
AM=M-1 // 3030
A=M // 3031
M=D // 3032

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3033
D=M // 3034
@4 // 3035
A=D+A // 3036
D=M // 3037
@SP // 3038
AM=M+1 // 3039
A=A-1 // 3040
M=D // 3041
// call Memory.create_foot
@6 // 3042
D=A // 3043
@14 // 3044
M=D // 3045
@Memory.create_foot // 3046
D=A // 3047
@13 // 3048
M=D // 3049
@Memory.alloc.ret.7 // 3050
D=A // 3051
@CALL // 3052
0;JMP // 3053
(Memory.alloc.ret.7)
@SP // 3054
AM=M-1 // 3055
D=M // 3056
@5 // 3057
M=D // 3058

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

@LCL // 3059
A=M+1 // 3060
A=A+1 // 3061
A=A+1 // 3062
D=M // 3063
@SP // 3064
AM=M+1 // 3065
A=A-1 // 3066
M=D // 3067
// call Memory.getBinIndex
@6 // 3068
D=A // 3069
@14 // 3070
M=D // 3071
@Memory.getBinIndex // 3072
D=A // 3073
@13 // 3074
M=D // 3075
@Memory.alloc.ret.9 // 3076
D=A // 3077
@CALL // 3078
0;JMP // 3079
(Memory.alloc.ret.9)
@SP // 3080
AM=M-1 // 3081
D=M // 3082
@2048 // 3083
D=D+A // 3084
@SP // 3085
AM=M+1 // 3086
A=A-1 // 3087
M=D // 3088
@LCL // 3089
D=M // 3090
@4 // 3091
A=D+A // 3092
D=M // 3093
@SP // 3094
AM=M+1 // 3095
A=A-1 // 3096
M=D // 3097
// call Memory.add_node
@7 // 3098
D=A // 3099
@14 // 3100
M=D // 3101
@Memory.add_node // 3102
D=A // 3103
@13 // 3104
M=D // 3105
@Memory.alloc.ret.10 // 3106
D=A // 3107
@CALL // 3108
0;JMP // 3109
(Memory.alloc.ret.10)
@SP // 3110
AM=M-1 // 3111
D=M // 3112
@5 // 3113
M=D // 3114

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 3115
0;JMP // 3116

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
@LCL // 3117
A=M+1 // 3118
A=A+1 // 3119
D=M // 3120
@SP // 3121
AM=M+1 // 3122
A=A-1 // 3123
M=D+1 // 3124
D=0 // 3125
@SP // 3126
AM=M-1 // 3127
A=M // 3128
M=D // 3129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3130
A=M+1 // 3131
A=A+1 // 3132
D=M // 3133
@SP // 3134
AM=M+1 // 3135
A=A-1 // 3136
M=D // 3137
// call Memory.create_foot
@6 // 3138
D=A // 3139
@14 // 3140
M=D // 3141
@Memory.create_foot // 3142
D=A // 3143
@13 // 3144
M=D // 3145
@Memory.alloc.ret.11 // 3146
D=A // 3147
@CALL // 3148
0;JMP // 3149
(Memory.alloc.ret.11)
@SP // 3150
AM=M-1 // 3151
D=M // 3152
@5 // 3153
M=D // 3154

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
@LCL // 3155
A=M+1 // 3156
A=A+1 // 3157
D=M // 3158
@4 // 3159
D=D+A // 3160
@SP // 3161
AM=M+1 // 3162
A=A-1 // 3163
M=D // 3164

////ReturnInstruction{}
@RETURN // 3165
0;JMP // 3166

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=12, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 3167
AM=M+1 // 3168
A=A-1 // 3169
M=0 // 3170

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3171
A=M // 3172
D=M // 3173
@SP // 3174
AM=M+1 // 3175
A=A-1 // 3176
M=D // 3177
// call Memory.alloc
@6 // 3178
D=A // 3179
@14 // 3180
M=D // 3181
@Memory.alloc // 3182
D=A // 3183
@13 // 3184
M=D // 3185
@Memory.calloc.ret.0 // 3186
D=A // 3187
@CALL // 3188
0;JMP // 3189
(Memory.calloc.ret.0)
@SP // 3190
AM=M-1 // 3191
D=M // 3192
@LCL // 3193
A=M // 3194
M=D // 3195

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.9 // 3196
D=A // 3197
@SP // 3198
AM=M+1 // 3199
A=A-1 // 3200
M=D // 3201
@LCL // 3202
A=M // 3203
D=!M // 3204
@14 // 3205
M=D // 3206
@SP // 3207
AM=M-1 // 3208
D=M // 3209
@13 // 3210
M=D // 3211
@14 // 3212
D=M // 3213
@DO_EQ // 3214
0;JMP // 3215
(Memory.calloc.EQ.9)
@Memory.calloc.IfElse1 // 3216
D;JNE // 3217

////PushInstruction("constant 0")
@SP // 3218
AM=M+1 // 3219
A=A-1 // 3220
M=0 // 3221

////ReturnInstruction{}
@RETURN // 3222
0;JMP // 3223

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 3224
0;JMP // 3225

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
@Memory.calloc.EQ.11 // 3226
D=A // 3227
@SP // 3228
AM=M+1 // 3229
A=A-1 // 3230
M=D // 3231
@Memory.calloc.GT.12 // 3232
D=A // 3233
@SP // 3234
AM=M+1 // 3235
A=A-1 // 3236
M=D // 3237
@ARG // 3238
A=M // 3239
D=M // 3240
@14 // 3241
M=D // 3242
@SP // 3243
AM=M-1 // 3244
D=M // 3245
@13 // 3246
M=D // 3247
@14 // 3248
D=M // 3249
@DO_GT // 3250
0;JMP // 3251
(Memory.calloc.GT.12)
@14 // 3252
M=D // 3253
@SP // 3254
AM=M-1 // 3255
D=M // 3256
@13 // 3257
M=D // 3258
@14 // 3259
D=M // 3260
@DO_EQ // 3261
0;JMP // 3262
(Memory.calloc.EQ.11)
@WHILE_END_Memory.calloc1 // 3263
D;JNE // 3264

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

@ARG // 3265
A=M // 3266
D=M-1 // 3267
@ARG // 3268
A=M // 3269
M=D // 3270

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 3271
A=M // 3272
D=M // 3273
@SP // 3274
AM=M+1 // 3275
A=A-1 // 3276
M=D // 3277
@ARG // 3278
A=M // 3279
D=M // 3280
@SP // 3281
AM=M-1 // 3282
D=D+M // 3283
@SP // 3284
AM=M+1 // 3285
A=A-1 // 3286
M=D // 3287
D=0 // 3288
@SP // 3289
AM=M-1 // 3290
A=M // 3291
M=D // 3292

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 3293
0;JMP // 3294

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 3295
A=M // 3296
D=M // 3297
@SP // 3298
AM=M+1 // 3299
A=A-1 // 3300
M=D // 3301

////ReturnInstruction{}
@RETURN // 3302
0;JMP // 3303

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 3304
AM=M+1 // 3305
A=A-1 // 3306
M=0 // 3307
@SP // 3308
AM=M+1 // 3309
A=A-1 // 3310
M=0 // 3311
@SP // 3312
AM=M+1 // 3313
A=A-1 // 3314
M=0 // 3315

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

@ARG // 3316
A=M // 3317
D=M // 3318
@4 // 3319
D=D-A // 3320
@LCL // 3321
A=M // 3322
M=D // 3323

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3324
A=M // 3325
D=M // 3326
@SP // 3327
AM=M+1 // 3328
A=A-1 // 3329
M=D+1 // 3330
D=1 // 3331
@SP // 3332
AM=M-1 // 3333
A=M // 3334
M=D // 3335

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

@LCL // 3336
A=M // 3337
D=M // 3338
@2 // 3339
A=D+A // 3340
D=M // 3341
@LCL // 3342
A=M+1 // 3343
M=D // 3344

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

@LCL // 3345
A=M // 3346
D=M // 3347
@3 // 3348
A=D+A // 3349
D=M // 3350
@LCL // 3351
A=M+1 // 3352
A=A+1 // 3353
M=D // 3354

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
@Memory.deAlloc.EQ.14 // 3355
D=A // 3356
@SP // 3357
AM=M+1 // 3358
A=A-1 // 3359
M=D // 3360
@Memory.deAlloc.EQ.15 // 3361
D=A // 3362
@SP // 3363
AM=M+1 // 3364
A=A-1 // 3365
M=D // 3366
@LCL // 3367
A=M+1 // 3368
D=M // 3369
@14 // 3370
M=D // 3371
@SP // 3372
AM=M-1 // 3373
D=M // 3374
@13 // 3375
M=D // 3376
@14 // 3377
D=M // 3378
@DO_EQ // 3379
0;JMP // 3380
(Memory.deAlloc.EQ.15)
D=!D // 3381
@14 // 3382
M=D // 3383
@SP // 3384
AM=M-1 // 3385
D=M // 3386
@13 // 3387
M=D // 3388
@14 // 3389
D=M // 3390
@DO_EQ // 3391
0;JMP // 3392
(Memory.deAlloc.EQ.14)
@Memory.deAlloc.IfElse1 // 3393
D;JNE // 3394

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
@Memory.deAlloc.EQ.17 // 3395
D=A // 3396
@SP // 3397
AM=M+1 // 3398
A=A-1 // 3399
M=D // 3400
@Memory.deAlloc.EQ.18 // 3401
D=A // 3402
@SP // 3403
AM=M+1 // 3404
A=A-1 // 3405
M=D // 3406
@LCL // 3407
A=M+1 // 3408
A=M+1 // 3409
D=M // 3410
D=M-1 // 3411
@14 // 3412
M=D // 3413
@SP // 3414
AM=M-1 // 3415
D=M // 3416
@13 // 3417
M=D // 3418
@14 // 3419
D=M // 3420
@DO_EQ // 3421
0;JMP // 3422
(Memory.deAlloc.EQ.18)
@14 // 3423
M=D // 3424
@SP // 3425
AM=M-1 // 3426
D=M // 3427
@13 // 3428
M=D // 3429
@14 // 3430
D=M // 3431
@DO_EQ // 3432
0;JMP // 3433
(Memory.deAlloc.EQ.17)
@Memory.deAlloc.IfElse2 // 3434
D;JNE // 3435

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

@LCL // 3436
A=M+1 // 3437
A=M // 3438
D=M // 3439
@SP // 3440
AM=M+1 // 3441
A=A-1 // 3442
M=D // 3443
// call Memory.getBinIndex
@6 // 3444
D=A // 3445
@14 // 3446
M=D // 3447
@Memory.getBinIndex // 3448
D=A // 3449
@13 // 3450
M=D // 3451
@Memory.deAlloc.ret.1 // 3452
D=A // 3453
@CALL // 3454
0;JMP // 3455
(Memory.deAlloc.ret.1)
@SP // 3456
AM=M-1 // 3457
D=M // 3458
@2048 // 3459
D=D+A // 3460
@SP // 3461
AM=M+1 // 3462
A=A-1 // 3463
M=D // 3464
@LCL // 3465
A=M+1 // 3466
D=M // 3467
@SP // 3468
AM=M+1 // 3469
A=A-1 // 3470
M=D // 3471
// call Memory.remove_node
@7 // 3472
D=A // 3473
@14 // 3474
M=D // 3475
@Memory.remove_node // 3476
D=A // 3477
@13 // 3478
M=D // 3479
@Memory.deAlloc.ret.2 // 3480
D=A // 3481
@CALL // 3482
0;JMP // 3483
(Memory.deAlloc.ret.2)
@SP // 3484
AM=M-1 // 3485
D=M // 3486
@5 // 3487
M=D // 3488

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
@LCL // 3489
A=M+1 // 3490
D=M // 3491
@SP // 3492
AM=M+1 // 3493
A=A-1 // 3494
M=D // 3495
@LCL // 3496
A=M+1 // 3497
A=M // 3498
D=M // 3499
@SP // 3500
AM=M+1 // 3501
A=A-1 // 3502
M=D // 3503
@LCL // 3504
A=M // 3505
A=M // 3506
D=M // 3507
@SP // 3508
AM=M-1 // 3509
D=D+M // 3510
@5 // 3511
D=D+A // 3512
@SP // 3513
AM=M-1 // 3514
A=M // 3515
M=D // 3516

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3517
A=M+1 // 3518
D=M // 3519
@SP // 3520
AM=M+1 // 3521
A=A-1 // 3522
M=D // 3523
// call Memory.create_foot
@6 // 3524
D=A // 3525
@14 // 3526
M=D // 3527
@Memory.create_foot // 3528
D=A // 3529
@13 // 3530
M=D // 3531
@Memory.deAlloc.ret.3 // 3532
D=A // 3533
@CALL // 3534
0;JMP // 3535
(Memory.deAlloc.ret.3)
@SP // 3536
AM=M-1 // 3537
D=M // 3538
@5 // 3539
M=D // 3540

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3541
A=M+1 // 3542
D=M // 3543
@LCL // 3544
A=M // 3545
M=D // 3546

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 3547
0;JMP // 3548

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 3549
0;JMP // 3550

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
@Memory.deAlloc.EQ.20 // 3551
D=A // 3552
@SP // 3553
AM=M+1 // 3554
A=A-1 // 3555
M=D // 3556
@Memory.deAlloc.EQ.21 // 3557
D=A // 3558
@SP // 3559
AM=M+1 // 3560
A=A-1 // 3561
M=D // 3562
@LCL // 3563
A=M+1 // 3564
A=A+1 // 3565
D=M // 3566
@14 // 3567
M=D // 3568
@SP // 3569
AM=M-1 // 3570
D=M // 3571
@13 // 3572
M=D // 3573
@14 // 3574
D=M // 3575
@DO_EQ // 3576
0;JMP // 3577
(Memory.deAlloc.EQ.21)
D=!D // 3578
@14 // 3579
M=D // 3580
@SP // 3581
AM=M-1 // 3582
D=M // 3583
@13 // 3584
M=D // 3585
@14 // 3586
D=M // 3587
@DO_EQ // 3588
0;JMP // 3589
(Memory.deAlloc.EQ.20)
@Memory.deAlloc.IfElse3 // 3590
D;JNE // 3591

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
@Memory.deAlloc.EQ.23 // 3592
D=A // 3593
@SP // 3594
AM=M+1 // 3595
A=A-1 // 3596
M=D // 3597
@Memory.deAlloc.EQ.24 // 3598
D=A // 3599
@SP // 3600
AM=M+1 // 3601
A=A-1 // 3602
M=D // 3603
@LCL // 3604
A=M+1 // 3605
A=A+1 // 3606
A=M+1 // 3607
D=M // 3608
D=M-1 // 3609
@14 // 3610
M=D // 3611
@SP // 3612
AM=M-1 // 3613
D=M // 3614
@13 // 3615
M=D // 3616
@14 // 3617
D=M // 3618
@DO_EQ // 3619
0;JMP // 3620
(Memory.deAlloc.EQ.24)
@14 // 3621
M=D // 3622
@SP // 3623
AM=M-1 // 3624
D=M // 3625
@13 // 3626
M=D // 3627
@14 // 3628
D=M // 3629
@DO_EQ // 3630
0;JMP // 3631
(Memory.deAlloc.EQ.23)
@Memory.deAlloc.IfElse4 // 3632
D;JNE // 3633

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

@LCL // 3634
A=M+1 // 3635
A=A+1 // 3636
A=M // 3637
D=M // 3638
@SP // 3639
AM=M+1 // 3640
A=A-1 // 3641
M=D // 3642
// call Memory.getBinIndex
@6 // 3643
D=A // 3644
@14 // 3645
M=D // 3646
@Memory.getBinIndex // 3647
D=A // 3648
@13 // 3649
M=D // 3650
@Memory.deAlloc.ret.5 // 3651
D=A // 3652
@CALL // 3653
0;JMP // 3654
(Memory.deAlloc.ret.5)
@SP // 3655
AM=M-1 // 3656
D=M // 3657
@2048 // 3658
D=D+A // 3659
@SP // 3660
AM=M+1 // 3661
A=A-1 // 3662
M=D // 3663
@LCL // 3664
A=M+1 // 3665
A=A+1 // 3666
D=M // 3667
@SP // 3668
AM=M+1 // 3669
A=A-1 // 3670
M=D // 3671
// call Memory.remove_node
@7 // 3672
D=A // 3673
@14 // 3674
M=D // 3675
@Memory.remove_node // 3676
D=A // 3677
@13 // 3678
M=D // 3679
@Memory.deAlloc.ret.6 // 3680
D=A // 3681
@CALL // 3682
0;JMP // 3683
(Memory.deAlloc.ret.6)
@SP // 3684
AM=M-1 // 3685
D=M // 3686
@5 // 3687
M=D // 3688

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
@LCL // 3689
A=M // 3690
D=M // 3691
@SP // 3692
AM=M+1 // 3693
A=A-1 // 3694
M=D // 3695
@LCL // 3696
A=M // 3697
A=M // 3698
D=M // 3699
@SP // 3700
AM=M+1 // 3701
A=A-1 // 3702
M=D // 3703
@LCL // 3704
A=M+1 // 3705
A=A+1 // 3706
A=M // 3707
D=M // 3708
@SP // 3709
AM=M-1 // 3710
D=D+M // 3711
@5 // 3712
D=D+A // 3713
@SP // 3714
AM=M-1 // 3715
A=M // 3716
M=D // 3717

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3718
A=M // 3719
D=M // 3720
@SP // 3721
AM=M+1 // 3722
A=A-1 // 3723
M=D // 3724
// call Memory.create_foot
@6 // 3725
D=A // 3726
@14 // 3727
M=D // 3728
@Memory.create_foot // 3729
D=A // 3730
@13 // 3731
M=D // 3732
@Memory.deAlloc.ret.7 // 3733
D=A // 3734
@CALL // 3735
0;JMP // 3736
(Memory.deAlloc.ret.7)
@SP // 3737
AM=M-1 // 3738
D=M // 3739
@5 // 3740
M=D // 3741

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 3742
0;JMP // 3743

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 3744
0;JMP // 3745

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

@LCL // 3746
A=M // 3747
A=M // 3748
D=M // 3749
@SP // 3750
AM=M+1 // 3751
A=A-1 // 3752
M=D // 3753
// call Memory.getBinIndex
@6 // 3754
D=A // 3755
@14 // 3756
M=D // 3757
@Memory.getBinIndex // 3758
D=A // 3759
@13 // 3760
M=D // 3761
@Memory.deAlloc.ret.9 // 3762
D=A // 3763
@CALL // 3764
0;JMP // 3765
(Memory.deAlloc.ret.9)
@SP // 3766
AM=M-1 // 3767
D=M // 3768
@2048 // 3769
D=D+A // 3770
@SP // 3771
AM=M+1 // 3772
A=A-1 // 3773
M=D // 3774
@LCL // 3775
A=M // 3776
D=M // 3777
@SP // 3778
AM=M+1 // 3779
A=A-1 // 3780
M=D // 3781
// call Memory.add_node
@7 // 3782
D=A // 3783
@14 // 3784
M=D // 3785
@Memory.add_node // 3786
D=A // 3787
@13 // 3788
M=D // 3789
@Memory.deAlloc.ret.10 // 3790
D=A // 3791
@CALL // 3792
0;JMP // 3793
(Memory.deAlloc.ret.10)
@SP // 3794
AM=M-1 // 3795
D=M // 3796
@5 // 3797
M=D // 3798

////PushInstruction("constant 0")
@SP // 3799
AM=M+1 // 3800
A=A-1 // 3801
M=0 // 3802

////ReturnInstruction{}
@RETURN // 3803
0;JMP // 3804

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 3805
AM=M+1 // 3806
A=A-1 // 3807
M=0 // 3808
@SP // 3809
AM=M+1 // 3810
A=A-1 // 3811
M=0 // 3812
@SP // 3813
AM=M+1 // 3814
A=A-1 // 3815
M=0 // 3816
@SP // 3817
AM=M+1 // 3818
A=A-1 // 3819
M=0 // 3820

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
@Memory.realloc.EQ.26 // 3821
D=A // 3822
@SP // 3823
AM=M+1 // 3824
A=A-1 // 3825
M=D // 3826
@Memory.realloc.EQ.27 // 3827
D=A // 3828
@SP // 3829
AM=M+1 // 3830
A=A-1 // 3831
M=D // 3832
@ARG // 3833
A=M // 3834
D=M // 3835
@14 // 3836
M=D // 3837
@SP // 3838
AM=M-1 // 3839
D=M // 3840
@13 // 3841
M=D // 3842
@14 // 3843
D=M // 3844
@DO_EQ // 3845
0;JMP // 3846
(Memory.realloc.EQ.27)
@14 // 3847
M=D // 3848
@SP // 3849
AM=M-1 // 3850
D=M // 3851
@13 // 3852
M=D // 3853
@14 // 3854
D=M // 3855
@DO_EQ // 3856
0;JMP // 3857
(Memory.realloc.EQ.26)
@Memory.realloc.IfElse1 // 3858
D;JNE // 3859

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3860
A=M+1 // 3861
D=M // 3862
@SP // 3863
AM=M+1 // 3864
A=A-1 // 3865
M=D // 3866
// call Memory.alloc
@6 // 3867
D=A // 3868
@14 // 3869
M=D // 3870
@Memory.alloc // 3871
D=A // 3872
@13 // 3873
M=D // 3874
@Memory.realloc.ret.0 // 3875
D=A // 3876
@CALL // 3877
0;JMP // 3878
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 3879
0;JMP // 3880

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 3881
0;JMP // 3882

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

@ARG // 3883
A=M // 3884
D=M-1 // 3885
@LCL // 3886
A=M+1 // 3887
A=A+1 // 3888
A=A+1 // 3889
M=D // 3890

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

@LCL // 3891
A=M+1 // 3892
A=A+1 // 3893
A=A+1 // 3894
A=M // 3895
D=M // 3896
@LCL // 3897
A=M // 3898
M=D // 3899

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3900
A=M+1 // 3901
D=M // 3902
@SP // 3903
AM=M+1 // 3904
A=A-1 // 3905
M=D // 3906
// call Memory.alloc
@6 // 3907
D=A // 3908
@14 // 3909
M=D // 3910
@Memory.alloc // 3911
D=A // 3912
@13 // 3913
M=D // 3914
@Memory.realloc.ret.1 // 3915
D=A // 3916
@CALL // 3917
0;JMP // 3918
(Memory.realloc.ret.1)
@SP // 3919
AM=M-1 // 3920
D=M // 3921
@LCL // 3922
A=M+1 // 3923
M=D // 3924

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
@Memory.realloc.EQ.29 // 3925
D=A // 3926
@SP // 3927
AM=M+1 // 3928
A=A-1 // 3929
M=D // 3930
@Memory.realloc.EQ.30 // 3931
D=A // 3932
@SP // 3933
AM=M+1 // 3934
A=A-1 // 3935
M=D // 3936
@LCL // 3937
A=M+1 // 3938
D=M // 3939
@14 // 3940
M=D // 3941
@SP // 3942
AM=M-1 // 3943
D=M // 3944
@13 // 3945
M=D // 3946
@14 // 3947
D=M // 3948
@DO_EQ // 3949
0;JMP // 3950
(Memory.realloc.EQ.30)
@14 // 3951
M=D // 3952
@SP // 3953
AM=M-1 // 3954
D=M // 3955
@13 // 3956
M=D // 3957
@14 // 3958
D=M // 3959
@DO_EQ // 3960
0;JMP // 3961
(Memory.realloc.EQ.29)
@Memory.realloc.IfElse2 // 3962
D;JNE // 3963

////PushInstruction("constant 0")
@SP // 3964
AM=M+1 // 3965
A=A-1 // 3966
M=0 // 3967

////ReturnInstruction{}
@RETURN // 3968
0;JMP // 3969

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 3970
0;JMP // 3971

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
@Memory.realloc.EQ.32 // 3972
D=A // 3973
@SP // 3974
AM=M+1 // 3975
A=A-1 // 3976
M=D // 3977
@Memory.realloc.GT.33 // 3978
D=A // 3979
@SP // 3980
AM=M+1 // 3981
A=A-1 // 3982
M=D // 3983
@LCL // 3984
A=M // 3985
D=M // 3986
@SP // 3987
AM=M+1 // 3988
A=A-1 // 3989
M=D // 3990
@ARG // 3991
A=M+1 // 3992
D=M // 3993
@SP // 3994
AM=M-1 // 3995
D=M-D // 3996
@14 // 3997
M=D // 3998
@SP // 3999
AM=M-1 // 4000
D=M // 4001
@13 // 4002
M=D // 4003
@14 // 4004
D=M // 4005
@DO_GT // 4006
0;JMP // 4007
(Memory.realloc.GT.33)
D=!D // 4008
@14 // 4009
M=D // 4010
@SP // 4011
AM=M-1 // 4012
D=M // 4013
@13 // 4014
M=D // 4015
@14 // 4016
D=M // 4017
@DO_EQ // 4018
0;JMP // 4019
(Memory.realloc.EQ.32)
@Memory.realloc.IfElse3 // 4020
D;JNE // 4021

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4022
A=M // 4023
D=M // 4024
@LCL // 4025
A=M+1 // 4026
A=A+1 // 4027
M=D // 4028

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 4029
0;JMP // 4030

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 4031
A=M+1 // 4032
D=M // 4033
@LCL // 4034
A=M+1 // 4035
A=A+1 // 4036
M=D // 4037

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4038
A=M // 4039
D=M // 4040
@SP // 4041
AM=M+1 // 4042
A=A-1 // 4043
M=D // 4044
@LCL // 4045
A=M+1 // 4046
D=M // 4047
@SP // 4048
AM=M+1 // 4049
A=A-1 // 4050
M=D // 4051
@LCL // 4052
A=M+1 // 4053
A=A+1 // 4054
D=M // 4055
@SP // 4056
AM=M+1 // 4057
A=A-1 // 4058
M=D // 4059
// call Memory.copy
@8 // 4060
D=A // 4061
@14 // 4062
M=D // 4063
@Memory.copy // 4064
D=A // 4065
@13 // 4066
M=D // 4067
@Memory.realloc.ret.2 // 4068
D=A // 4069
@CALL // 4070
0;JMP // 4071
(Memory.realloc.ret.2)
@SP // 4072
AM=M-1 // 4073
D=M // 4074
@5 // 4075
M=D // 4076

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4077
A=M // 4078
D=M // 4079
@SP // 4080
AM=M+1 // 4081
A=A-1 // 4082
M=D // 4083
// call Memory.deAlloc
@6 // 4084
D=A // 4085
@14 // 4086
M=D // 4087
@Memory.deAlloc // 4088
D=A // 4089
@13 // 4090
M=D // 4091
@Memory.realloc.ret.3 // 4092
D=A // 4093
@CALL // 4094
0;JMP // 4095
(Memory.realloc.ret.3)
@SP // 4096
AM=M-1 // 4097
D=M // 4098
@5 // 4099
M=D // 4100

////PushInstruction("local 1")
@LCL // 4101
A=M+1 // 4102
D=M // 4103
@SP // 4104
AM=M+1 // 4105
A=A-1 // 4106
M=D // 4107

////ReturnInstruction{}
@RETURN // 4108
0;JMP // 4109

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 4110
AM=M+1 // 4111
A=A-1 // 4112
M=0 // 4113

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 4114
@LCL // 4115
A=M // 4116
M=D // 4117

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
@Memory.copy.EQ.35 // 4118
D=A // 4119
@SP // 4120
AM=M+1 // 4121
A=A-1 // 4122
M=D // 4123
@Memory.copy.LT.36 // 4124
D=A // 4125
@SP // 4126
AM=M+1 // 4127
A=A-1 // 4128
M=D // 4129
@LCL // 4130
A=M // 4131
D=M // 4132
@SP // 4133
AM=M+1 // 4134
A=A-1 // 4135
M=D // 4136
@ARG // 4137
A=M+1 // 4138
A=A+1 // 4139
D=M // 4140
@SP // 4141
AM=M-1 // 4142
D=M-D // 4143
@14 // 4144
M=D // 4145
@SP // 4146
AM=M-1 // 4147
D=M // 4148
@13 // 4149
M=D // 4150
@14 // 4151
D=M // 4152
@DO_LT // 4153
0;JMP // 4154
(Memory.copy.LT.36)
@14 // 4155
M=D // 4156
@SP // 4157
AM=M-1 // 4158
D=M // 4159
@13 // 4160
M=D // 4161
@14 // 4162
D=M // 4163
@DO_EQ // 4164
0;JMP // 4165
(Memory.copy.EQ.35)
@WHILE_END_Memory.copy1 // 4166
D;JNE // 4167

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
@ARG // 4168
A=M+1 // 4169
D=M // 4170
@SP // 4171
AM=M+1 // 4172
A=A-1 // 4173
M=D // 4174
@LCL // 4175
A=M // 4176
D=M // 4177
@SP // 4178
AM=M-1 // 4179
D=D+M // 4180
@SP // 4181
AM=M+1 // 4182
A=A-1 // 4183
M=D // 4184
@ARG // 4185
A=M // 4186
D=M // 4187
@SP // 4188
AM=M+1 // 4189
A=A-1 // 4190
M=D // 4191
@LCL // 4192
A=M // 4193
D=M // 4194
@SP // 4195
AM=M-1 // 4196
A=D+M // 4197
D=M // 4198
@SP // 4199
AM=M-1 // 4200
A=M // 4201
M=D // 4202

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

@LCL // 4203
A=M // 4204
D=M+1 // 4205
@LCL // 4206
A=M // 4207
M=D // 4208

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 4209
0;JMP // 4210

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 4211
AM=M+1 // 4212
A=A-1 // 4213
M=0 // 4214

////ReturnInstruction{}
@RETURN // 4215
0;JMP // 4216

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
@Memory.remove_node.EQ.38 // 4217
D=A // 4218
@SP // 4219
AM=M+1 // 4220
A=A-1 // 4221
M=D // 4222
@Memory.remove_node.EQ.39 // 4223
D=A // 4224
@SP // 4225
AM=M+1 // 4226
A=A-1 // 4227
M=D // 4228
@ARG // 4229
A=M+1 // 4230
D=M // 4231
@2 // 4232
A=D+A // 4233
D=M // 4234
@14 // 4235
M=D // 4236
@SP // 4237
AM=M-1 // 4238
D=M // 4239
@13 // 4240
M=D // 4241
@14 // 4242
D=M // 4243
@DO_EQ // 4244
0;JMP // 4245
(Memory.remove_node.EQ.39)
D=!D // 4246
@14 // 4247
M=D // 4248
@SP // 4249
AM=M-1 // 4250
D=M // 4251
@13 // 4252
M=D // 4253
@14 // 4254
D=M // 4255
@DO_EQ // 4256
0;JMP // 4257
(Memory.remove_node.EQ.38)
@Memory.remove_node.IfElse1 // 4258
D;JNE // 4259

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
@ARG // 4260
A=M+1 // 4261
D=M // 4262
@2 // 4263
D=D+A // 4264
@3 // 4265
D=D+A // 4266
@SP // 4267
AM=M+1 // 4268
A=A-1 // 4269
M=D // 4270
@ARG // 4271
A=M+1 // 4272
D=M // 4273
@3 // 4274
A=D+A // 4275
D=M // 4276
@SP // 4277
AM=M-1 // 4278
A=M // 4279
M=D // 4280

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 4281
0;JMP // 4282

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
@ARG // 4283
A=M // 4284
D=M // 4285
@SP // 4286
AM=M+1 // 4287
A=A-1 // 4288
M=D // 4289
@ARG // 4290
A=M+1 // 4291
D=M // 4292
@3 // 4293
A=D+A // 4294
D=M // 4295
@SP // 4296
AM=M-1 // 4297
A=M // 4298
M=D // 4299

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
@Memory.remove_node.EQ.41 // 4300
D=A // 4301
@SP // 4302
AM=M+1 // 4303
A=A-1 // 4304
M=D // 4305
@Memory.remove_node.EQ.42 // 4306
D=A // 4307
@SP // 4308
AM=M+1 // 4309
A=A-1 // 4310
M=D // 4311
@ARG // 4312
A=M+1 // 4313
D=M // 4314
@3 // 4315
A=D+A // 4316
D=M // 4317
@14 // 4318
M=D // 4319
@SP // 4320
AM=M-1 // 4321
D=M // 4322
@13 // 4323
M=D // 4324
@14 // 4325
D=M // 4326
@DO_EQ // 4327
0;JMP // 4328
(Memory.remove_node.EQ.42)
D=!D // 4329
@14 // 4330
M=D // 4331
@SP // 4332
AM=M-1 // 4333
D=M // 4334
@13 // 4335
M=D // 4336
@14 // 4337
D=M // 4338
@DO_EQ // 4339
0;JMP // 4340
(Memory.remove_node.EQ.41)
@Memory.remove_node.IfElse2 // 4341
D;JNE // 4342

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
@ARG // 4343
A=M+1 // 4344
D=M // 4345
@3 // 4346
D=D+A // 4347
@2 // 4348
D=D+A // 4349
@SP // 4350
AM=M+1 // 4351
A=A-1 // 4352
M=D // 4353
@ARG // 4354
A=M+1 // 4355
D=M // 4356
@2 // 4357
A=D+A // 4358
D=M // 4359
@SP // 4360
AM=M-1 // 4361
A=M // 4362
M=D // 4363

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 4364
0;JMP // 4365

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
@ARG // 4366
A=M+1 // 4367
D=M // 4368
@2 // 4369
D=D+A // 4370
@SP // 4371
AM=M+1 // 4372
A=A-1 // 4373
M=D // 4374
D=0 // 4375
@SP // 4376
AM=M-1 // 4377
A=M // 4378
M=D // 4379

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4380
A=M+1 // 4381
D=M // 4382
@3 // 4383
D=D+A // 4384
@SP // 4385
AM=M+1 // 4386
A=A-1 // 4387
M=D // 4388
D=0 // 4389
@SP // 4390
AM=M-1 // 4391
A=M // 4392
M=D // 4393

////PushInstruction("constant 0")
@SP // 4394
AM=M+1 // 4395
A=A-1 // 4396
M=0 // 4397

////ReturnInstruction{}
@RETURN // 4398
0;JMP // 4399

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 4400
AM=M+1 // 4401
A=A-1 // 4402
M=0 // 4403

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 4404
@LCL // 4405
A=M // 4406
M=D // 4407

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
@Memory.getBinIndex.EQ.45 // 4408
D=A // 4409
@SP // 4410
AM=M+1 // 4411
A=A-1 // 4412
M=D // 4413
@Memory.getBinIndex.LT.46 // 4414
D=A // 4415
@SP // 4416
AM=M+1 // 4417
A=A-1 // 4418
M=D // 4419
@LCL // 4420
A=M // 4421
D=M // 4422
@7 // 4423
D=D-A // 4424
@14 // 4425
M=D // 4426
@SP // 4427
AM=M-1 // 4428
D=M // 4429
@13 // 4430
M=D // 4431
@14 // 4432
D=M // 4433
@DO_LT // 4434
0;JMP // 4435
(Memory.getBinIndex.LT.46)
@SP // 4436
AM=M+1 // 4437
A=A-1 // 4438
M=D // 4439
@Memory.getBinIndex.EQ.47 // 4440
D=A // 4441
@SP // 4442
AM=M+1 // 4443
A=A-1 // 4444
M=D // 4445
@LCL // 4446
A=M // 4447
D=M // 4448
@2048 // 4449
A=D+A // 4450
D=M // 4451
@14 // 4452
M=D // 4453
@SP // 4454
AM=M-1 // 4455
D=M // 4456
@13 // 4457
M=D // 4458
@14 // 4459
D=M // 4460
@DO_EQ // 4461
0;JMP // 4462
(Memory.getBinIndex.EQ.47)
D=!D // 4463
@SP // 4464
AM=M-1 // 4465
D=D&M // 4466
@14 // 4467
M=D // 4468
@SP // 4469
AM=M-1 // 4470
D=M // 4471
@13 // 4472
M=D // 4473
@14 // 4474
D=M // 4475
@DO_EQ // 4476
0;JMP // 4477
(Memory.getBinIndex.EQ.45)
@WHILE_END_Memory.getBinIndex1 // 4478
D;JNE // 4479

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
@Memory.getBinIndex.EQ.49 // 4480
D=A // 4481
@SP // 4482
AM=M+1 // 4483
A=A-1 // 4484
M=D // 4485
@Memory.getBinIndex.GT.50 // 4486
D=A // 4487
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=D // 4491
@ARG // 4492
A=M // 4493
D=M // 4494
@SP // 4495
AM=M+1 // 4496
A=A-1 // 4497
M=D // 4498
@LCL // 4499
A=M // 4500
D=M // 4501
@SP // 4502
AM=M+1 // 4503
A=A-1 // 4504
M=D+1 // 4505
@16 // 4506
D=A // 4507
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=D // 4511
// call Math.multiply
@7 // 4512
D=A // 4513
@14 // 4514
M=D // 4515
@Math.multiply // 4516
D=A // 4517
@13 // 4518
M=D // 4519
@Memory.getBinIndex.ret.1 // 4520
D=A // 4521
@CALL // 4522
0;JMP // 4523
(Memory.getBinIndex.ret.1)
@SP // 4524
AM=M-1 // 4525
D=M // 4526
@SP // 4527
AM=M-1 // 4528
D=M-D // 4529
@14 // 4530
M=D // 4531
@SP // 4532
AM=M-1 // 4533
D=M // 4534
@13 // 4535
M=D // 4536
@14 // 4537
D=M // 4538
@DO_GT // 4539
0;JMP // 4540
(Memory.getBinIndex.GT.50)
D=!D // 4541
@14 // 4542
M=D // 4543
@SP // 4544
AM=M-1 // 4545
D=M // 4546
@13 // 4547
M=D // 4548
@14 // 4549
D=M // 4550
@DO_EQ // 4551
0;JMP // 4552
(Memory.getBinIndex.EQ.49)
@Memory.getBinIndex.IfElse1 // 4553
D;JNE // 4554

////PushInstruction("local 0")
@LCL // 4555
A=M // 4556
D=M // 4557
@SP // 4558
AM=M+1 // 4559
A=A-1 // 4560
M=D // 4561

////ReturnInstruction{}
@RETURN // 4562
0;JMP // 4563

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 4564
0;JMP // 4565

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

@LCL // 4566
A=M // 4567
D=M+1 // 4568
@LCL // 4569
A=M // 4570
M=D // 4571

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 4572
0;JMP // 4573

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
@6 // 4574
D=A // 4575
@SP // 4576
AM=M+1 // 4577
A=A-1 // 4578
M=D // 4579
@7 // 4580
D=A // 4581
@SP // 4582
AM=M+1 // 4583
A=A-1 // 4584
M=D-1 // 4585

////ReturnInstruction{}
@RETURN // 4586
0;JMP // 4587

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 4588
AM=M+1 // 4589
A=A-1 // 4590
M=0 // 4591

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

@ARG // 4592
A=M // 4593
A=M // 4594
D=M // 4595
@LCL // 4596
A=M // 4597
M=D // 4598

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
@Memory.get_best_fit.EQ.52 // 4599
D=A // 4600
@SP // 4601
AM=M+1 // 4602
A=A-1 // 4603
M=D // 4604
@Memory.get_best_fit.LT.53 // 4605
D=A // 4606
@SP // 4607
AM=M+1 // 4608
A=A-1 // 4609
M=D // 4610
@LCL // 4611
A=M // 4612
A=M // 4613
D=M // 4614
@SP // 4615
AM=M+1 // 4616
A=A-1 // 4617
M=D // 4618
@ARG // 4619
A=M+1 // 4620
D=M // 4621
@SP // 4622
AM=M-1 // 4623
D=M-D // 4624
@14 // 4625
M=D // 4626
@SP // 4627
AM=M-1 // 4628
D=M // 4629
@13 // 4630
M=D // 4631
@14 // 4632
D=M // 4633
@DO_LT // 4634
0;JMP // 4635
(Memory.get_best_fit.LT.53)
D=!D // 4636
@14 // 4637
M=D // 4638
@SP // 4639
AM=M-1 // 4640
D=M // 4641
@13 // 4642
M=D // 4643
@14 // 4644
D=M // 4645
@DO_EQ // 4646
0;JMP // 4647
(Memory.get_best_fit.EQ.52)
@Memory.get_best_fit.IfElse1 // 4648
D;JNE // 4649

////PushInstruction("local 0")
@LCL // 4650
A=M // 4651
D=M // 4652
@SP // 4653
AM=M+1 // 4654
A=A-1 // 4655
M=D // 4656

////ReturnInstruction{}
@RETURN // 4657
0;JMP // 4658

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 4659
0;JMP // 4660

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
@Memory.get_best_fit.EQ.55 // 4661
D=A // 4662
@SP // 4663
AM=M+1 // 4664
A=A-1 // 4665
M=D // 4666
@Memory.get_best_fit.EQ.56 // 4667
D=A // 4668
@SP // 4669
AM=M+1 // 4670
A=A-1 // 4671
M=D // 4672
@LCL // 4673
A=M // 4674
D=M // 4675
@3 // 4676
A=D+A // 4677
D=M // 4678
@14 // 4679
M=D // 4680
@SP // 4681
AM=M-1 // 4682
D=M // 4683
@13 // 4684
M=D // 4685
@14 // 4686
D=M // 4687
@DO_EQ // 4688
0;JMP // 4689
(Memory.get_best_fit.EQ.56)
D=!D // 4690
@14 // 4691
M=D // 4692
@SP // 4693
AM=M-1 // 4694
D=M // 4695
@13 // 4696
M=D // 4697
@14 // 4698
D=M // 4699
@DO_EQ // 4700
0;JMP // 4701
(Memory.get_best_fit.EQ.55)
@WHILE_END_Memory.get_best_fit1 // 4702
D;JNE // 4703

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

@LCL // 4704
A=M // 4705
D=M // 4706
@3 // 4707
A=D+A // 4708
D=M // 4709
@LCL // 4710
A=M // 4711
M=D // 4712

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
@Memory.get_best_fit.EQ.58 // 4713
D=A // 4714
@SP // 4715
AM=M+1 // 4716
A=A-1 // 4717
M=D // 4718
@Memory.get_best_fit.LT.59 // 4719
D=A // 4720
@SP // 4721
AM=M+1 // 4722
A=A-1 // 4723
M=D // 4724
@LCL // 4725
A=M // 4726
A=M // 4727
D=M // 4728
@SP // 4729
AM=M+1 // 4730
A=A-1 // 4731
M=D // 4732
@ARG // 4733
A=M+1 // 4734
D=M // 4735
@SP // 4736
AM=M-1 // 4737
D=M-D // 4738
@14 // 4739
M=D // 4740
@SP // 4741
AM=M-1 // 4742
D=M // 4743
@13 // 4744
M=D // 4745
@14 // 4746
D=M // 4747
@DO_LT // 4748
0;JMP // 4749
(Memory.get_best_fit.LT.59)
D=!D // 4750
@14 // 4751
M=D // 4752
@SP // 4753
AM=M-1 // 4754
D=M // 4755
@13 // 4756
M=D // 4757
@14 // 4758
D=M // 4759
@DO_EQ // 4760
0;JMP // 4761
(Memory.get_best_fit.EQ.58)
@Memory.get_best_fit.IfElse2 // 4762
D;JNE // 4763

////PushInstruction("local 0")
@LCL // 4764
A=M // 4765
D=M // 4766
@SP // 4767
AM=M+1 // 4768
A=A-1 // 4769
M=D // 4770

////ReturnInstruction{}
@RETURN // 4771
0;JMP // 4772

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 4773
0;JMP // 4774

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 4775
0;JMP // 4776

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 4777
AM=M+1 // 4778
A=A-1 // 4779
M=0 // 4780

////ReturnInstruction{}
@RETURN // 4781
0;JMP // 4782

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
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
@ARG // 4783
A=M // 4784
D=M // 4785
@SP // 4786
AM=M+1 // 4787
A=A-1 // 4788
M=D // 4789
@ARG // 4790
A=M // 4791
A=M // 4792
D=M // 4793
@4 // 4794
D=D+A // 4795
@SP // 4796
AM=M-1 // 4797
D=D+M // 4798
@SP // 4799
AM=M+1 // 4800
A=A-1 // 4801
M=D // 4802
@ARG // 4803
A=M // 4804
D=M // 4805
@SP // 4806
AM=M-1 // 4807
A=M // 4808
M=D // 4809

////PushInstruction("constant 0")
@SP // 4810
AM=M+1 // 4811
A=A-1 // 4812
M=0 // 4813

////ReturnInstruction{}
@RETURN // 4814
0;JMP // 4815

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 4816
AM=M+1 // 4817
A=A-1 // 4818
M=0 // 4819
@SP // 4820
AM=M+1 // 4821
A=A-1 // 4822
M=0 // 4823

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4824
A=M+1 // 4825
D=M // 4826
@2 // 4827
D=D+A // 4828
@SP // 4829
AM=M+1 // 4830
A=A-1 // 4831
M=D // 4832
D=0 // 4833
@SP // 4834
AM=M-1 // 4835
A=M // 4836
M=D // 4837

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4838
A=M+1 // 4839
D=M // 4840
@3 // 4841
D=D+A // 4842
@SP // 4843
AM=M+1 // 4844
A=A-1 // 4845
M=D // 4846
D=0 // 4847
@SP // 4848
AM=M-1 // 4849
A=M // 4850
M=D // 4851

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
@Memory.add_node.EQ.61 // 4852
D=A // 4853
@SP // 4854
AM=M+1 // 4855
A=A-1 // 4856
M=D // 4857
@Memory.add_node.EQ.62 // 4858
D=A // 4859
@SP // 4860
AM=M+1 // 4861
A=A-1 // 4862
M=D // 4863
@ARG // 4864
A=M // 4865
A=M // 4866
D=M // 4867
@14 // 4868
M=D // 4869
@SP // 4870
AM=M-1 // 4871
D=M // 4872
@13 // 4873
M=D // 4874
@14 // 4875
D=M // 4876
@DO_EQ // 4877
0;JMP // 4878
(Memory.add_node.EQ.62)
@14 // 4879
M=D // 4880
@SP // 4881
AM=M-1 // 4882
D=M // 4883
@13 // 4884
M=D // 4885
@14 // 4886
D=M // 4887
@DO_EQ // 4888
0;JMP // 4889
(Memory.add_node.EQ.61)
@Memory.add_node.IfElse1 // 4890
D;JNE // 4891

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4892
A=M // 4893
D=M // 4894
@SP // 4895
AM=M+1 // 4896
A=A-1 // 4897
M=D // 4898
@ARG // 4899
A=M+1 // 4900
D=M // 4901
@SP // 4902
AM=M-1 // 4903
A=M // 4904
M=D // 4905

////PushInstruction("constant 0")
@SP // 4906
AM=M+1 // 4907
A=A-1 // 4908
M=0 // 4909

////ReturnInstruction{}
@RETURN // 4910
0;JMP // 4911

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 4912
0;JMP // 4913

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

@ARG // 4914
A=M // 4915
A=M // 4916
D=M // 4917
@LCL // 4918
A=M // 4919
M=D // 4920

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

D=0 // 4921
@LCL // 4922
A=M+1 // 4923
M=D // 4924

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
@Memory.add_node.EQ.65 // 4925
D=A // 4926
@SP // 4927
AM=M+1 // 4928
A=A-1 // 4929
M=D // 4930
@Memory.add_node.EQ.66 // 4931
D=A // 4932
@SP // 4933
AM=M+1 // 4934
A=A-1 // 4935
M=D // 4936
@LCL // 4937
A=M // 4938
D=M // 4939
@14 // 4940
M=D // 4941
@SP // 4942
AM=M-1 // 4943
D=M // 4944
@13 // 4945
M=D // 4946
@14 // 4947
D=M // 4948
@DO_EQ // 4949
0;JMP // 4950
(Memory.add_node.EQ.66)
@SP // 4951
AM=M+1 // 4952
A=A-1 // 4953
M=D // 4954
@SP // 4955
A=M-1 // 4956
M=!D // 4957
@Memory.add_node.GT.67 // 4958
D=A // 4959
@SP // 4960
AM=M+1 // 4961
A=A-1 // 4962
M=D // 4963
@LCL // 4964
A=M // 4965
A=M // 4966
D=M // 4967
@SP // 4968
AM=M+1 // 4969
A=A-1 // 4970
M=D // 4971
@ARG // 4972
A=M+1 // 4973
A=M // 4974
D=M // 4975
@SP // 4976
AM=M-1 // 4977
D=M-D // 4978
@14 // 4979
M=D // 4980
@SP // 4981
AM=M-1 // 4982
D=M // 4983
@13 // 4984
M=D // 4985
@14 // 4986
D=M // 4987
@DO_GT // 4988
0;JMP // 4989
(Memory.add_node.GT.67)
D=!D // 4990
@SP // 4991
AM=M-1 // 4992
D=D&M // 4993
@14 // 4994
M=D // 4995
@SP // 4996
AM=M-1 // 4997
D=M // 4998
@13 // 4999
M=D // 5000
@14 // 5001
D=M // 5002
@DO_EQ // 5003
0;JMP // 5004
(Memory.add_node.EQ.65)
@WHILE_END_Memory.add_node1 // 5005
D;JNE // 5006

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 5007
A=M // 5008
D=M // 5009
@LCL // 5010
A=M+1 // 5011
M=D // 5012

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

@LCL // 5013
A=M // 5014
D=M // 5015
@3 // 5016
A=D+A // 5017
D=M // 5018
@LCL // 5019
A=M // 5020
M=D // 5021

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 5022
0;JMP // 5023

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
@Memory.add_node.EQ.68 // 5024
D=A // 5025
@SP // 5026
AM=M+1 // 5027
A=A-1 // 5028
M=D // 5029
@LCL // 5030
A=M+1 // 5031
D=!M // 5032
@14 // 5033
M=D // 5034
@SP // 5035
AM=M-1 // 5036
D=M // 5037
@13 // 5038
M=D // 5039
@14 // 5040
D=M // 5041
@DO_EQ // 5042
0;JMP // 5043
(Memory.add_node.EQ.68)
@Memory.add_node.IfElse2 // 5044
D;JNE // 5045

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
@ARG // 5046
A=M+1 // 5047
D=M // 5048
@3 // 5049
D=D+A // 5050
@SP // 5051
AM=M+1 // 5052
A=A-1 // 5053
M=D // 5054
@ARG // 5055
A=M // 5056
A=M // 5057
D=M // 5058
@SP // 5059
AM=M-1 // 5060
A=M // 5061
M=D // 5062

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
@ARG // 5063
A=M // 5064
D=M // 5065
@2 // 5066
D=D+A // 5067
@SP // 5068
AM=M+1 // 5069
A=A-1 // 5070
M=D // 5071
@ARG // 5072
A=M+1 // 5073
D=M // 5074
@SP // 5075
AM=M-1 // 5076
A=M // 5077
M=D // 5078

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 5079
A=M // 5080
D=M // 5081
@SP // 5082
AM=M+1 // 5083
A=A-1 // 5084
M=D // 5085
@ARG // 5086
A=M+1 // 5087
D=M // 5088
@SP // 5089
AM=M-1 // 5090
A=M // 5091
M=D // 5092

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 5093
0;JMP // 5094

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
@ARG // 5095
A=M+1 // 5096
D=M // 5097
@3 // 5098
D=D+A // 5099
@SP // 5100
AM=M+1 // 5101
A=A-1 // 5102
M=D // 5103
@LCL // 5104
A=M // 5105
D=M // 5106
@SP // 5107
AM=M-1 // 5108
A=M // 5109
M=D // 5110

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 5111
A=M+1 // 5112
D=M // 5113
@2 // 5114
D=D+A // 5115
@SP // 5116
AM=M+1 // 5117
A=A-1 // 5118
M=D // 5119
@LCL // 5120
A=M+1 // 5121
D=M // 5122
@SP // 5123
AM=M-1 // 5124
A=M // 5125
M=D // 5126

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.69 // 5127
D=A // 5128
@SP // 5129
AM=M+1 // 5130
A=A-1 // 5131
M=D // 5132
@LCL // 5133
A=M // 5134
D=M // 5135
@14 // 5136
M=D // 5137
@SP // 5138
AM=M-1 // 5139
D=M // 5140
@13 // 5141
M=D // 5142
@14 // 5143
D=M // 5144
@DO_EQ // 5145
0;JMP // 5146
(Memory.add_node.EQ.69)
@Memory.add_node.IfElse3 // 5147
D;JNE // 5148

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 5149
A=M // 5150
D=M // 5151
@2 // 5152
D=D+A // 5153
@SP // 5154
AM=M+1 // 5155
A=A-1 // 5156
M=D // 5157
@ARG // 5158
A=M+1 // 5159
D=M // 5160
@SP // 5161
AM=M-1 // 5162
A=M // 5163
M=D // 5164

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 5165
0;JMP // 5166

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
@LCL // 5167
A=M+1 // 5168
D=M // 5169
@3 // 5170
D=D+A // 5171
@SP // 5172
AM=M+1 // 5173
A=A-1 // 5174
M=D // 5175
@ARG // 5176
A=M+1 // 5177
D=M // 5178
@SP // 5179
AM=M-1 // 5180
A=M // 5181
M=D // 5182

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 5183
AM=M+1 // 5184
A=A-1 // 5185
M=0 // 5186

////ReturnInstruction{}
@RETURN // 5187
0;JMP // 5188

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=11, Memory.copy=0, Memory.alloc=12, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=2, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 5189
A=M // 5190
D=M // 5191
@SP // 5192
AM=M+1 // 5193
A=A-1 // 5194
M=D // 5195
@ARG // 5196
A=M+1 // 5197
D=M // 5198
@SP // 5199
AM=M-1 // 5200
A=M // 5201
M=D // 5202

////PushInstruction("constant 0")
@SP // 5203
AM=M+1 // 5204
A=A-1 // 5205
M=0 // 5206

////ReturnInstruction{}
@RETURN // 5207
0;JMP // 5208

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
@ARG // 5209
A=M // 5210
A=M // 5211
D=M // 5212
@SP // 5213
AM=M+1 // 5214
A=A-1 // 5215
M=D // 5216

////ReturnInstruction{}
@RETURN // 5217
0;JMP // 5218

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 5219
D=A // 5220
@14 // 5221
M=D // 5222
@Output.initMap // 5223
D=A // 5224
@13 // 5225
M=D // 5226
@Output.init.ret.0 // 5227
D=A // 5228
@CALL // 5229
0;JMP // 5230
(Output.init.ret.0)
@SP // 5231
AM=M-1 // 5232
D=M // 5233
@5 // 5234
M=D // 5235

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.1}
//}

D=0 // 5236
@Output.1 // 5237
M=D // 5238

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.2}
//}

D=0 // 5239
@Output.2 // 5240
M=D // 5241

////PushInstruction("constant 0")
@SP // 5242
AM=M+1 // 5243
A=A-1 // 5244
M=0 // 5245

////ReturnInstruction{}
@RETURN // 5246
0;JMP // 5247

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 5248
AM=M+1 // 5249
A=A-1 // 5250
M=0 // 5251

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=Output.0}
//}

@127 // 5252
D=A // 5253
@SP // 5254
AM=M+1 // 5255
A=A-1 // 5256
M=D // 5257
// call Array.new
@6 // 5258
D=A // 5259
@14 // 5260
M=D // 5261
@Array.new // 5262
D=A // 5263
@13 // 5264
M=D // 5265
@Output.initMap.ret.0 // 5266
D=A // 5267
@CALL // 5268
0;JMP // 5269
(Output.initMap.ret.0)
@SP // 5270
AM=M-1 // 5271
D=M // 5272
@Output.0 // 5273
M=D // 5274

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 5275
AM=M+1 // 5276
A=A-1 // 5277
M=0 // 5278
@63 // 5279
D=A // 5280
@SP // 5281
AM=M+1 // 5282
A=A-1 // 5283
M=D // 5284
@63 // 5285
D=A // 5286
@SP // 5287
AM=M+1 // 5288
A=A-1 // 5289
M=D // 5290
@63 // 5291
D=A // 5292
@SP // 5293
AM=M+1 // 5294
A=A-1 // 5295
M=D // 5296
@63 // 5297
D=A // 5298
@SP // 5299
AM=M+1 // 5300
A=A-1 // 5301
M=D // 5302
@63 // 5303
D=A // 5304
@SP // 5305
AM=M+1 // 5306
A=A-1 // 5307
M=D // 5308
@63 // 5309
D=A // 5310
@SP // 5311
AM=M+1 // 5312
A=A-1 // 5313
M=D // 5314
@63 // 5315
D=A // 5316
@SP // 5317
AM=M+1 // 5318
A=A-1 // 5319
M=D // 5320
@63 // 5321
D=A // 5322
@SP // 5323
AM=M+1 // 5324
A=A-1 // 5325
M=D // 5326
@63 // 5327
D=A // 5328
@SP // 5329
AM=M+1 // 5330
A=A-1 // 5331
M=D // 5332
@SP // 5333
AM=M+1 // 5334
A=A-1 // 5335
M=0 // 5336
@SP // 5337
AM=M+1 // 5338
A=A-1 // 5339
M=0 // 5340
// call Output.create
@17 // 5341
D=A // 5342
@14 // 5343
M=D // 5344
@Output.create // 5345
D=A // 5346
@13 // 5347
M=D // 5348
@Output.initMap.ret.1 // 5349
D=A // 5350
@CALL // 5351
0;JMP // 5352
(Output.initMap.ret.1)
@SP // 5353
AM=M-1 // 5354
D=M // 5355
@5 // 5356
M=D // 5357

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@32 // 5358
D=A // 5359
@SP // 5360
AM=M+1 // 5361
A=A-1 // 5362
M=D // 5363
@SP // 5364
AM=M+1 // 5365
A=A-1 // 5366
M=0 // 5367
@SP // 5368
AM=M+1 // 5369
A=A-1 // 5370
M=0 // 5371
@SP // 5372
AM=M+1 // 5373
A=A-1 // 5374
M=0 // 5375
@SP // 5376
AM=M+1 // 5377
A=A-1 // 5378
M=0 // 5379
@SP // 5380
AM=M+1 // 5381
A=A-1 // 5382
M=0 // 5383
@SP // 5384
AM=M+1 // 5385
A=A-1 // 5386
M=0 // 5387
@SP // 5388
AM=M+1 // 5389
A=A-1 // 5390
M=0 // 5391
@SP // 5392
AM=M+1 // 5393
A=A-1 // 5394
M=0 // 5395
@SP // 5396
AM=M+1 // 5397
A=A-1 // 5398
M=0 // 5399
@SP // 5400
AM=M+1 // 5401
A=A-1 // 5402
M=0 // 5403
@SP // 5404
AM=M+1 // 5405
A=A-1 // 5406
M=0 // 5407
// call Output.create
@17 // 5408
D=A // 5409
@14 // 5410
M=D // 5411
@Output.create // 5412
D=A // 5413
@13 // 5414
M=D // 5415
@Output.initMap.ret.2 // 5416
D=A // 5417
@CALL // 5418
0;JMP // 5419
(Output.initMap.ret.2)
@SP // 5420
AM=M-1 // 5421
D=M // 5422
@5 // 5423
M=D // 5424

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5425
D=A // 5426
@SP // 5427
AM=M+1 // 5428
A=A-1 // 5429
M=D // 5430
@12 // 5431
D=A // 5432
@SP // 5433
AM=M+1 // 5434
A=A-1 // 5435
M=D // 5436
@30 // 5437
D=A // 5438
@SP // 5439
AM=M+1 // 5440
A=A-1 // 5441
M=D // 5442
@30 // 5443
D=A // 5444
@SP // 5445
AM=M+1 // 5446
A=A-1 // 5447
M=D // 5448
@30 // 5449
D=A // 5450
@SP // 5451
AM=M+1 // 5452
A=A-1 // 5453
M=D // 5454
@12 // 5455
D=A // 5456
@SP // 5457
AM=M+1 // 5458
A=A-1 // 5459
M=D // 5460
@12 // 5461
D=A // 5462
@SP // 5463
AM=M+1 // 5464
A=A-1 // 5465
M=D // 5466
@SP // 5467
AM=M+1 // 5468
A=A-1 // 5469
M=0 // 5470
@12 // 5471
D=A // 5472
@SP // 5473
AM=M+1 // 5474
A=A-1 // 5475
M=D // 5476
@12 // 5477
D=A // 5478
@SP // 5479
AM=M+1 // 5480
A=A-1 // 5481
M=D // 5482
@SP // 5483
AM=M+1 // 5484
A=A-1 // 5485
M=0 // 5486
@SP // 5487
AM=M+1 // 5488
A=A-1 // 5489
M=0 // 5490
// call Output.create
@17 // 5491
D=A // 5492
@14 // 5493
M=D // 5494
@Output.create // 5495
D=A // 5496
@13 // 5497
M=D // 5498
@Output.initMap.ret.3 // 5499
D=A // 5500
@CALL // 5501
0;JMP // 5502
(Output.initMap.ret.3)
@SP // 5503
AM=M-1 // 5504
D=M // 5505
@5 // 5506
M=D // 5507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5508
D=A // 5509
@SP // 5510
AM=M+1 // 5511
A=A-1 // 5512
M=D // 5513
@54 // 5514
D=A // 5515
@SP // 5516
AM=M+1 // 5517
A=A-1 // 5518
M=D // 5519
@54 // 5520
D=A // 5521
@SP // 5522
AM=M+1 // 5523
A=A-1 // 5524
M=D // 5525
@20 // 5526
D=A // 5527
@SP // 5528
AM=M+1 // 5529
A=A-1 // 5530
M=D // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=0 // 5535
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
@SP // 5548
AM=M+1 // 5549
A=A-1 // 5550
M=0 // 5551
@SP // 5552
AM=M+1 // 5553
A=A-1 // 5554
M=0 // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=0 // 5559
@SP // 5560
AM=M+1 // 5561
A=A-1 // 5562
M=0 // 5563
// call Output.create
@17 // 5564
D=A // 5565
@14 // 5566
M=D // 5567
@Output.create // 5568
D=A // 5569
@13 // 5570
M=D // 5571
@Output.initMap.ret.4 // 5572
D=A // 5573
@CALL // 5574
0;JMP // 5575
(Output.initMap.ret.4)
@SP // 5576
AM=M-1 // 5577
D=M // 5578
@5 // 5579
M=D // 5580

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@35 // 5581
D=A // 5582
@SP // 5583
AM=M+1 // 5584
A=A-1 // 5585
M=D // 5586
@SP // 5587
AM=M+1 // 5588
A=A-1 // 5589
M=0 // 5590
@18 // 5591
D=A // 5592
@SP // 5593
AM=M+1 // 5594
A=A-1 // 5595
M=D // 5596
@18 // 5597
D=A // 5598
@SP // 5599
AM=M+1 // 5600
A=A-1 // 5601
M=D // 5602
@63 // 5603
D=A // 5604
@SP // 5605
AM=M+1 // 5606
A=A-1 // 5607
M=D // 5608
@18 // 5609
D=A // 5610
@SP // 5611
AM=M+1 // 5612
A=A-1 // 5613
M=D // 5614
@18 // 5615
D=A // 5616
@SP // 5617
AM=M+1 // 5618
A=A-1 // 5619
M=D // 5620
@63 // 5621
D=A // 5622
@SP // 5623
AM=M+1 // 5624
A=A-1 // 5625
M=D // 5626
@18 // 5627
D=A // 5628
@SP // 5629
AM=M+1 // 5630
A=A-1 // 5631
M=D // 5632
@18 // 5633
D=A // 5634
@SP // 5635
AM=M+1 // 5636
A=A-1 // 5637
M=D // 5638
@SP // 5639
AM=M+1 // 5640
A=A-1 // 5641
M=0 // 5642
@SP // 5643
AM=M+1 // 5644
A=A-1 // 5645
M=0 // 5646
// call Output.create
@17 // 5647
D=A // 5648
@14 // 5649
M=D // 5650
@Output.create // 5651
D=A // 5652
@13 // 5653
M=D // 5654
@Output.initMap.ret.5 // 5655
D=A // 5656
@CALL // 5657
0;JMP // 5658
(Output.initMap.ret.5)
@SP // 5659
AM=M-1 // 5660
D=M // 5661
@5 // 5662
M=D // 5663

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 5664
D=A // 5665
@SP // 5666
AM=M+1 // 5667
A=A-1 // 5668
M=D // 5669
@12 // 5670
D=A // 5671
@SP // 5672
AM=M+1 // 5673
A=A-1 // 5674
M=D // 5675
@30 // 5676
D=A // 5677
@SP // 5678
AM=M+1 // 5679
A=A-1 // 5680
M=D // 5681
@51 // 5682
D=A // 5683
@SP // 5684
AM=M+1 // 5685
A=A-1 // 5686
M=D // 5687
@3 // 5688
D=A // 5689
@SP // 5690
AM=M+1 // 5691
A=A-1 // 5692
M=D // 5693
@30 // 5694
D=A // 5695
@SP // 5696
AM=M+1 // 5697
A=A-1 // 5698
M=D // 5699
@48 // 5700
D=A // 5701
@SP // 5702
AM=M+1 // 5703
A=A-1 // 5704
M=D // 5705
@51 // 5706
D=A // 5707
@SP // 5708
AM=M+1 // 5709
A=A-1 // 5710
M=D // 5711
@30 // 5712
D=A // 5713
@SP // 5714
AM=M+1 // 5715
A=A-1 // 5716
M=D // 5717
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
@SP // 5730
AM=M+1 // 5731
A=A-1 // 5732
M=0 // 5733
// call Output.create
@17 // 5734
D=A // 5735
@14 // 5736
M=D // 5737
@Output.create // 5738
D=A // 5739
@13 // 5740
M=D // 5741
@Output.initMap.ret.6 // 5742
D=A // 5743
@CALL // 5744
0;JMP // 5745
(Output.initMap.ret.6)
@SP // 5746
AM=M-1 // 5747
D=M // 5748
@5 // 5749
M=D // 5750

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@37 // 5751
D=A // 5752
@SP // 5753
AM=M+1 // 5754
A=A-1 // 5755
M=D // 5756
@SP // 5757
AM=M+1 // 5758
A=A-1 // 5759
M=0 // 5760
@SP // 5761
AM=M+1 // 5762
A=A-1 // 5763
M=0 // 5764
@35 // 5765
D=A // 5766
@SP // 5767
AM=M+1 // 5768
A=A-1 // 5769
M=D // 5770
@51 // 5771
D=A // 5772
@SP // 5773
AM=M+1 // 5774
A=A-1 // 5775
M=D // 5776
@24 // 5777
D=A // 5778
@SP // 5779
AM=M+1 // 5780
A=A-1 // 5781
M=D // 5782
@12 // 5783
D=A // 5784
@SP // 5785
AM=M+1 // 5786
A=A-1 // 5787
M=D // 5788
@6 // 5789
D=A // 5790
@SP // 5791
AM=M+1 // 5792
A=A-1 // 5793
M=D // 5794
@51 // 5795
D=A // 5796
@SP // 5797
AM=M+1 // 5798
A=A-1 // 5799
M=D // 5800
@49 // 5801
D=A // 5802
@SP // 5803
AM=M+1 // 5804
A=A-1 // 5805
M=D // 5806
@SP // 5807
AM=M+1 // 5808
A=A-1 // 5809
M=0 // 5810
@SP // 5811
AM=M+1 // 5812
A=A-1 // 5813
M=0 // 5814
// call Output.create
@17 // 5815
D=A // 5816
@14 // 5817
M=D // 5818
@Output.create // 5819
D=A // 5820
@13 // 5821
M=D // 5822
@Output.initMap.ret.7 // 5823
D=A // 5824
@CALL // 5825
0;JMP // 5826
(Output.initMap.ret.7)
@SP // 5827
AM=M-1 // 5828
D=M // 5829
@5 // 5830
M=D // 5831

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 5832
D=A // 5833
@SP // 5834
AM=M+1 // 5835
A=A-1 // 5836
M=D // 5837
@12 // 5838
D=A // 5839
@SP // 5840
AM=M+1 // 5841
A=A-1 // 5842
M=D // 5843
@30 // 5844
D=A // 5845
@SP // 5846
AM=M+1 // 5847
A=A-1 // 5848
M=D // 5849
@30 // 5850
D=A // 5851
@SP // 5852
AM=M+1 // 5853
A=A-1 // 5854
M=D // 5855
@12 // 5856
D=A // 5857
@SP // 5858
AM=M+1 // 5859
A=A-1 // 5860
M=D // 5861
@54 // 5862
D=A // 5863
@SP // 5864
AM=M+1 // 5865
A=A-1 // 5866
M=D // 5867
@27 // 5868
D=A // 5869
@SP // 5870
AM=M+1 // 5871
A=A-1 // 5872
M=D // 5873
@27 // 5874
D=A // 5875
@SP // 5876
AM=M+1 // 5877
A=A-1 // 5878
M=D // 5879
@27 // 5880
D=A // 5881
@SP // 5882
AM=M+1 // 5883
A=A-1 // 5884
M=D // 5885
@54 // 5886
D=A // 5887
@SP // 5888
AM=M+1 // 5889
A=A-1 // 5890
M=D // 5891
@SP // 5892
AM=M+1 // 5893
A=A-1 // 5894
M=0 // 5895
@SP // 5896
AM=M+1 // 5897
A=A-1 // 5898
M=0 // 5899
// call Output.create
@17 // 5900
D=A // 5901
@14 // 5902
M=D // 5903
@Output.create // 5904
D=A // 5905
@13 // 5906
M=D // 5907
@Output.initMap.ret.8 // 5908
D=A // 5909
@CALL // 5910
0;JMP // 5911
(Output.initMap.ret.8)
@SP // 5912
AM=M-1 // 5913
D=M // 5914
@5 // 5915
M=D // 5916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 5917
D=A // 5918
@SP // 5919
AM=M+1 // 5920
A=A-1 // 5921
M=D // 5922
@12 // 5923
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
@SP // 5941
AM=M+1 // 5942
A=A-1 // 5943
M=0 // 5944
@SP // 5945
AM=M+1 // 5946
A=A-1 // 5947
M=0 // 5948
@SP // 5949
AM=M+1 // 5950
A=A-1 // 5951
M=0 // 5952
@SP // 5953
AM=M+1 // 5954
A=A-1 // 5955
M=0 // 5956
@SP // 5957
AM=M+1 // 5958
A=A-1 // 5959
M=0 // 5960
@SP // 5961
AM=M+1 // 5962
A=A-1 // 5963
M=0 // 5964
@SP // 5965
AM=M+1 // 5966
A=A-1 // 5967
M=0 // 5968
@SP // 5969
AM=M+1 // 5970
A=A-1 // 5971
M=0 // 5972
// call Output.create
@17 // 5973
D=A // 5974
@14 // 5975
M=D // 5976
@Output.create // 5977
D=A // 5978
@13 // 5979
M=D // 5980
@Output.initMap.ret.9 // 5981
D=A // 5982
@CALL // 5983
0;JMP // 5984
(Output.initMap.ret.9)
@SP // 5985
AM=M-1 // 5986
D=M // 5987
@5 // 5988
M=D // 5989

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5990
D=A // 5991
@SP // 5992
AM=M+1 // 5993
A=A-1 // 5994
M=D // 5995
@24 // 5996
D=A // 5997
@SP // 5998
AM=M+1 // 5999
A=A-1 // 6000
M=D // 6001
@12 // 6002
D=A // 6003
@SP // 6004
AM=M+1 // 6005
A=A-1 // 6006
M=D // 6007
@6 // 6008
D=A // 6009
@SP // 6010
AM=M+1 // 6011
A=A-1 // 6012
M=D // 6013
@6 // 6014
D=A // 6015
@SP // 6016
AM=M+1 // 6017
A=A-1 // 6018
M=D // 6019
@6 // 6020
D=A // 6021
@SP // 6022
AM=M+1 // 6023
A=A-1 // 6024
M=D // 6025
@6 // 6026
D=A // 6027
@SP // 6028
AM=M+1 // 6029
A=A-1 // 6030
M=D // 6031
@6 // 6032
D=A // 6033
@SP // 6034
AM=M+1 // 6035
A=A-1 // 6036
M=D // 6037
@12 // 6038
D=A // 6039
@SP // 6040
AM=M+1 // 6041
A=A-1 // 6042
M=D // 6043
@24 // 6044
D=A // 6045
@SP // 6046
AM=M+1 // 6047
A=A-1 // 6048
M=D // 6049
@SP // 6050
AM=M+1 // 6051
A=A-1 // 6052
M=0 // 6053
@SP // 6054
AM=M+1 // 6055
A=A-1 // 6056
M=0 // 6057
// call Output.create
@17 // 6058
D=A // 6059
@14 // 6060
M=D // 6061
@Output.create // 6062
D=A // 6063
@13 // 6064
M=D // 6065
@Output.initMap.ret.10 // 6066
D=A // 6067
@CALL // 6068
0;JMP // 6069
(Output.initMap.ret.10)
@SP // 6070
AM=M-1 // 6071
D=M // 6072
@5 // 6073
M=D // 6074

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6075
D=A // 6076
@SP // 6077
AM=M+1 // 6078
A=A-1 // 6079
M=D // 6080
@6 // 6081
D=A // 6082
@SP // 6083
AM=M+1 // 6084
A=A-1 // 6085
M=D // 6086
@12 // 6087
D=A // 6088
@SP // 6089
AM=M+1 // 6090
A=A-1 // 6091
M=D // 6092
@24 // 6093
D=A // 6094
@SP // 6095
AM=M+1 // 6096
A=A-1 // 6097
M=D // 6098
@24 // 6099
D=A // 6100
@SP // 6101
AM=M+1 // 6102
A=A-1 // 6103
M=D // 6104
@24 // 6105
D=A // 6106
@SP // 6107
AM=M+1 // 6108
A=A-1 // 6109
M=D // 6110
@24 // 6111
D=A // 6112
@SP // 6113
AM=M+1 // 6114
A=A-1 // 6115
M=D // 6116
@24 // 6117
D=A // 6118
@SP // 6119
AM=M+1 // 6120
A=A-1 // 6121
M=D // 6122
@12 // 6123
D=A // 6124
@SP // 6125
AM=M+1 // 6126
A=A-1 // 6127
M=D // 6128
@6 // 6129
D=A // 6130
@SP // 6131
AM=M+1 // 6132
A=A-1 // 6133
M=D // 6134
@SP // 6135
AM=M+1 // 6136
A=A-1 // 6137
M=0 // 6138
@SP // 6139
AM=M+1 // 6140
A=A-1 // 6141
M=0 // 6142
// call Output.create
@17 // 6143
D=A // 6144
@14 // 6145
M=D // 6146
@Output.create // 6147
D=A // 6148
@13 // 6149
M=D // 6150
@Output.initMap.ret.11 // 6151
D=A // 6152
@CALL // 6153
0;JMP // 6154
(Output.initMap.ret.11)
@SP // 6155
AM=M-1 // 6156
D=M // 6157
@5 // 6158
M=D // 6159

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@42 // 6160
D=A // 6161
@SP // 6162
AM=M+1 // 6163
A=A-1 // 6164
M=D // 6165
@SP // 6166
AM=M+1 // 6167
A=A-1 // 6168
M=0 // 6169
@SP // 6170
AM=M+1 // 6171
A=A-1 // 6172
M=0 // 6173
@SP // 6174
AM=M+1 // 6175
A=A-1 // 6176
M=0 // 6177
@51 // 6178
D=A // 6179
@SP // 6180
AM=M+1 // 6181
A=A-1 // 6182
M=D // 6183
@30 // 6184
D=A // 6185
@SP // 6186
AM=M+1 // 6187
A=A-1 // 6188
M=D // 6189
@63 // 6190
D=A // 6191
@SP // 6192
AM=M+1 // 6193
A=A-1 // 6194
M=D // 6195
@30 // 6196
D=A // 6197
@SP // 6198
AM=M+1 // 6199
A=A-1 // 6200
M=D // 6201
@51 // 6202
D=A // 6203
@SP // 6204
AM=M+1 // 6205
A=A-1 // 6206
M=D // 6207
@SP // 6208
AM=M+1 // 6209
A=A-1 // 6210
M=0 // 6211
@SP // 6212
AM=M+1 // 6213
A=A-1 // 6214
M=0 // 6215
@SP // 6216
AM=M+1 // 6217
A=A-1 // 6218
M=0 // 6219
// call Output.create
@17 // 6220
D=A // 6221
@14 // 6222
M=D // 6223
@Output.create // 6224
D=A // 6225
@13 // 6226
M=D // 6227
@Output.initMap.ret.12 // 6228
D=A // 6229
@CALL // 6230
0;JMP // 6231
(Output.initMap.ret.12)
@SP // 6232
AM=M-1 // 6233
D=M // 6234
@5 // 6235
M=D // 6236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@43 // 6237
D=A // 6238
@SP // 6239
AM=M+1 // 6240
A=A-1 // 6241
M=D // 6242
@SP // 6243
AM=M+1 // 6244
A=A-1 // 6245
M=0 // 6246
@SP // 6247
AM=M+1 // 6248
A=A-1 // 6249
M=0 // 6250
@SP // 6251
AM=M+1 // 6252
A=A-1 // 6253
M=0 // 6254
@12 // 6255
D=A // 6256
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=D // 6260
@12 // 6261
D=A // 6262
@SP // 6263
AM=M+1 // 6264
A=A-1 // 6265
M=D // 6266
@63 // 6267
D=A // 6268
@SP // 6269
AM=M+1 // 6270
A=A-1 // 6271
M=D // 6272
@12 // 6273
D=A // 6274
@SP // 6275
AM=M+1 // 6276
A=A-1 // 6277
M=D // 6278
@12 // 6279
D=A // 6280
@SP // 6281
AM=M+1 // 6282
A=A-1 // 6283
M=D // 6284
@SP // 6285
AM=M+1 // 6286
A=A-1 // 6287
M=0 // 6288
@SP // 6289
AM=M+1 // 6290
A=A-1 // 6291
M=0 // 6292
@SP // 6293
AM=M+1 // 6294
A=A-1 // 6295
M=0 // 6296
// call Output.create
@17 // 6297
D=A // 6298
@14 // 6299
M=D // 6300
@Output.create // 6301
D=A // 6302
@13 // 6303
M=D // 6304
@Output.initMap.ret.13 // 6305
D=A // 6306
@CALL // 6307
0;JMP // 6308
(Output.initMap.ret.13)
@SP // 6309
AM=M-1 // 6310
D=M // 6311
@5 // 6312
M=D // 6313

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@44 // 6314
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
@SP // 6328
AM=M+1 // 6329
A=A-1 // 6330
M=0 // 6331
@SP // 6332
AM=M+1 // 6333
A=A-1 // 6334
M=0 // 6335
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
@12 // 6348
D=A // 6349
@SP // 6350
AM=M+1 // 6351
A=A-1 // 6352
M=D // 6353
@12 // 6354
D=A // 6355
@SP // 6356
AM=M+1 // 6357
A=A-1 // 6358
M=D // 6359
@6 // 6360
D=A // 6361
@SP // 6362
AM=M+1 // 6363
A=A-1 // 6364
M=D // 6365
@SP // 6366
AM=M+1 // 6367
A=A-1 // 6368
M=0 // 6369
// call Output.create
@17 // 6370
D=A // 6371
@14 // 6372
M=D // 6373
@Output.create // 6374
D=A // 6375
@13 // 6376
M=D // 6377
@Output.initMap.ret.14 // 6378
D=A // 6379
@CALL // 6380
0;JMP // 6381
(Output.initMap.ret.14)
@SP // 6382
AM=M-1 // 6383
D=M // 6384
@5 // 6385
M=D // 6386

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@45 // 6387
D=A // 6388
@SP // 6389
AM=M+1 // 6390
A=A-1 // 6391
M=D // 6392
@SP // 6393
AM=M+1 // 6394
A=A-1 // 6395
M=0 // 6396
@SP // 6397
AM=M+1 // 6398
A=A-1 // 6399
M=0 // 6400
@SP // 6401
AM=M+1 // 6402
A=A-1 // 6403
M=0 // 6404
@SP // 6405
AM=M+1 // 6406
A=A-1 // 6407
M=0 // 6408
@SP // 6409
AM=M+1 // 6410
A=A-1 // 6411
M=0 // 6412
@63 // 6413
D=A // 6414
@SP // 6415
AM=M+1 // 6416
A=A-1 // 6417
M=D // 6418
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
@SP // 6435
AM=M+1 // 6436
A=A-1 // 6437
M=0 // 6438
// call Output.create
@17 // 6439
D=A // 6440
@14 // 6441
M=D // 6442
@Output.create // 6443
D=A // 6444
@13 // 6445
M=D // 6446
@Output.initMap.ret.15 // 6447
D=A // 6448
@CALL // 6449
0;JMP // 6450
(Output.initMap.ret.15)
@SP // 6451
AM=M-1 // 6452
D=M // 6453
@5 // 6454
M=D // 6455

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@46 // 6456
D=A // 6457
@SP // 6458
AM=M+1 // 6459
A=A-1 // 6460
M=D // 6461
@SP // 6462
AM=M+1 // 6463
A=A-1 // 6464
M=0 // 6465
@SP // 6466
AM=M+1 // 6467
A=A-1 // 6468
M=0 // 6469
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
@SP // 6482
AM=M+1 // 6483
A=A-1 // 6484
M=0 // 6485
@SP // 6486
AM=M+1 // 6487
A=A-1 // 6488
M=0 // 6489
@12 // 6490
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
@SP // 6502
AM=M+1 // 6503
A=A-1 // 6504
M=0 // 6505
@SP // 6506
AM=M+1 // 6507
A=A-1 // 6508
M=0 // 6509
// call Output.create
@17 // 6510
D=A // 6511
@14 // 6512
M=D // 6513
@Output.create // 6514
D=A // 6515
@13 // 6516
M=D // 6517
@Output.initMap.ret.16 // 6518
D=A // 6519
@CALL // 6520
0;JMP // 6521
(Output.initMap.ret.16)
@SP // 6522
AM=M-1 // 6523
D=M // 6524
@5 // 6525
M=D // 6526

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@47 // 6527
D=A // 6528
@SP // 6529
AM=M+1 // 6530
A=A-1 // 6531
M=D // 6532
@SP // 6533
AM=M+1 // 6534
A=A-1 // 6535
M=0 // 6536
@SP // 6537
AM=M+1 // 6538
A=A-1 // 6539
M=0 // 6540
@32 // 6541
D=A // 6542
@SP // 6543
AM=M+1 // 6544
A=A-1 // 6545
M=D // 6546
@48 // 6547
D=A // 6548
@SP // 6549
AM=M+1 // 6550
A=A-1 // 6551
M=D // 6552
@24 // 6553
D=A // 6554
@SP // 6555
AM=M+1 // 6556
A=A-1 // 6557
M=D // 6558
@12 // 6559
D=A // 6560
@SP // 6561
AM=M+1 // 6562
A=A-1 // 6563
M=D // 6564
@6 // 6565
D=A // 6566
@SP // 6567
AM=M+1 // 6568
A=A-1 // 6569
M=D // 6570
@3 // 6571
D=A // 6572
@SP // 6573
AM=M+1 // 6574
A=A-1 // 6575
M=D // 6576
@SP // 6577
AM=M+1 // 6578
A=A-1 // 6579
M=1 // 6580
@SP // 6581
AM=M+1 // 6582
A=A-1 // 6583
M=0 // 6584
@SP // 6585
AM=M+1 // 6586
A=A-1 // 6587
M=0 // 6588
// call Output.create
@17 // 6589
D=A // 6590
@14 // 6591
M=D // 6592
@Output.create // 6593
D=A // 6594
@13 // 6595
M=D // 6596
@Output.initMap.ret.17 // 6597
D=A // 6598
@CALL // 6599
0;JMP // 6600
(Output.initMap.ret.17)
@SP // 6601
AM=M-1 // 6602
D=M // 6603
@5 // 6604
M=D // 6605

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6606
D=A // 6607
@SP // 6608
AM=M+1 // 6609
A=A-1 // 6610
M=D // 6611
@12 // 6612
D=A // 6613
@SP // 6614
AM=M+1 // 6615
A=A-1 // 6616
M=D // 6617
@30 // 6618
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
@51 // 6642
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
@30 // 6654
D=A // 6655
@SP // 6656
AM=M+1 // 6657
A=A-1 // 6658
M=D // 6659
@12 // 6660
D=A // 6661
@SP // 6662
AM=M+1 // 6663
A=A-1 // 6664
M=D // 6665
@SP // 6666
AM=M+1 // 6667
A=A-1 // 6668
M=0 // 6669
@SP // 6670
AM=M+1 // 6671
A=A-1 // 6672
M=0 // 6673
// call Output.create
@17 // 6674
D=A // 6675
@14 // 6676
M=D // 6677
@Output.create // 6678
D=A // 6679
@13 // 6680
M=D // 6681
@Output.initMap.ret.18 // 6682
D=A // 6683
@CALL // 6684
0;JMP // 6685
(Output.initMap.ret.18)
@SP // 6686
AM=M-1 // 6687
D=M // 6688
@5 // 6689
M=D // 6690

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 6691
D=A // 6692
@SP // 6693
AM=M+1 // 6694
A=A-1 // 6695
M=D // 6696
@12 // 6697
D=A // 6698
@SP // 6699
AM=M+1 // 6700
A=A-1 // 6701
M=D // 6702
@14 // 6703
D=A // 6704
@SP // 6705
AM=M+1 // 6706
A=A-1 // 6707
M=D // 6708
@15 // 6709
D=A // 6710
@SP // 6711
AM=M+1 // 6712
A=A-1 // 6713
M=D // 6714
@12 // 6715
D=A // 6716
@SP // 6717
AM=M+1 // 6718
A=A-1 // 6719
M=D // 6720
@12 // 6721
D=A // 6722
@SP // 6723
AM=M+1 // 6724
A=A-1 // 6725
M=D // 6726
@12 // 6727
D=A // 6728
@SP // 6729
AM=M+1 // 6730
A=A-1 // 6731
M=D // 6732
@12 // 6733
D=A // 6734
@SP // 6735
AM=M+1 // 6736
A=A-1 // 6737
M=D // 6738
@12 // 6739
D=A // 6740
@SP // 6741
AM=M+1 // 6742
A=A-1 // 6743
M=D // 6744
@63 // 6745
D=A // 6746
@SP // 6747
AM=M+1 // 6748
A=A-1 // 6749
M=D // 6750
@SP // 6751
AM=M+1 // 6752
A=A-1 // 6753
M=0 // 6754
@SP // 6755
AM=M+1 // 6756
A=A-1 // 6757
M=0 // 6758
// call Output.create
@17 // 6759
D=A // 6760
@14 // 6761
M=D // 6762
@Output.create // 6763
D=A // 6764
@13 // 6765
M=D // 6766
@Output.initMap.ret.19 // 6767
D=A // 6768
@CALL // 6769
0;JMP // 6770
(Output.initMap.ret.19)
@SP // 6771
AM=M-1 // 6772
D=M // 6773
@5 // 6774
M=D // 6775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 6776
D=A // 6777
@SP // 6778
AM=M+1 // 6779
A=A-1 // 6780
M=D // 6781
@30 // 6782
D=A // 6783
@SP // 6784
AM=M+1 // 6785
A=A-1 // 6786
M=D // 6787
@51 // 6788
D=A // 6789
@SP // 6790
AM=M+1 // 6791
A=A-1 // 6792
M=D // 6793
@48 // 6794
D=A // 6795
@SP // 6796
AM=M+1 // 6797
A=A-1 // 6798
M=D // 6799
@24 // 6800
D=A // 6801
@SP // 6802
AM=M+1 // 6803
A=A-1 // 6804
M=D // 6805
@12 // 6806
D=A // 6807
@SP // 6808
AM=M+1 // 6809
A=A-1 // 6810
M=D // 6811
@6 // 6812
D=A // 6813
@SP // 6814
AM=M+1 // 6815
A=A-1 // 6816
M=D // 6817
@3 // 6818
D=A // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=D // 6823
@51 // 6824
D=A // 6825
@SP // 6826
AM=M+1 // 6827
A=A-1 // 6828
M=D // 6829
@63 // 6830
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
@Output.initMap.ret.20 // 6852
D=A // 6853
@CALL // 6854
0;JMP // 6855
(Output.initMap.ret.20)
@SP // 6856
AM=M-1 // 6857
D=M // 6858
@5 // 6859
M=D // 6860

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 6861
D=A // 6862
@SP // 6863
AM=M+1 // 6864
A=A-1 // 6865
M=D // 6866
@30 // 6867
D=A // 6868
@SP // 6869
AM=M+1 // 6870
A=A-1 // 6871
M=D // 6872
@51 // 6873
D=A // 6874
@SP // 6875
AM=M+1 // 6876
A=A-1 // 6877
M=D // 6878
@48 // 6879
D=A // 6880
@SP // 6881
AM=M+1 // 6882
A=A-1 // 6883
M=D // 6884
@48 // 6885
D=A // 6886
@SP // 6887
AM=M+1 // 6888
A=A-1 // 6889
M=D // 6890
@28 // 6891
D=A // 6892
@SP // 6893
AM=M+1 // 6894
A=A-1 // 6895
M=D // 6896
@48 // 6897
D=A // 6898
@SP // 6899
AM=M+1 // 6900
A=A-1 // 6901
M=D // 6902
@48 // 6903
D=A // 6904
@SP // 6905
AM=M+1 // 6906
A=A-1 // 6907
M=D // 6908
@51 // 6909
D=A // 6910
@SP // 6911
AM=M+1 // 6912
A=A-1 // 6913
M=D // 6914
@30 // 6915
D=A // 6916
@SP // 6917
AM=M+1 // 6918
A=A-1 // 6919
M=D // 6920
@SP // 6921
AM=M+1 // 6922
A=A-1 // 6923
M=0 // 6924
@SP // 6925
AM=M+1 // 6926
A=A-1 // 6927
M=0 // 6928
// call Output.create
@17 // 6929
D=A // 6930
@14 // 6931
M=D // 6932
@Output.create // 6933
D=A // 6934
@13 // 6935
M=D // 6936
@Output.initMap.ret.21 // 6937
D=A // 6938
@CALL // 6939
0;JMP // 6940
(Output.initMap.ret.21)
@SP // 6941
AM=M-1 // 6942
D=M // 6943
@5 // 6944
M=D // 6945

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 6946
D=A // 6947
@SP // 6948
AM=M+1 // 6949
A=A-1 // 6950
M=D // 6951
@16 // 6952
D=A // 6953
@SP // 6954
AM=M+1 // 6955
A=A-1 // 6956
M=D // 6957
@24 // 6958
D=A // 6959
@SP // 6960
AM=M+1 // 6961
A=A-1 // 6962
M=D // 6963
@28 // 6964
D=A // 6965
@SP // 6966
AM=M+1 // 6967
A=A-1 // 6968
M=D // 6969
@26 // 6970
D=A // 6971
@SP // 6972
AM=M+1 // 6973
A=A-1 // 6974
M=D // 6975
@25 // 6976
D=A // 6977
@SP // 6978
AM=M+1 // 6979
A=A-1 // 6980
M=D // 6981
@63 // 6982
D=A // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=D // 6987
@24 // 6988
D=A // 6989
@SP // 6990
AM=M+1 // 6991
A=A-1 // 6992
M=D // 6993
@24 // 6994
D=A // 6995
@SP // 6996
AM=M+1 // 6997
A=A-1 // 6998
M=D // 6999
@60 // 7000
D=A // 7001
@SP // 7002
AM=M+1 // 7003
A=A-1 // 7004
M=D // 7005
@SP // 7006
AM=M+1 // 7007
A=A-1 // 7008
M=0 // 7009
@SP // 7010
AM=M+1 // 7011
A=A-1 // 7012
M=0 // 7013
// call Output.create
@17 // 7014
D=A // 7015
@14 // 7016
M=D // 7017
@Output.create // 7018
D=A // 7019
@13 // 7020
M=D // 7021
@Output.initMap.ret.22 // 7022
D=A // 7023
@CALL // 7024
0;JMP // 7025
(Output.initMap.ret.22)
@SP // 7026
AM=M-1 // 7027
D=M // 7028
@5 // 7029
M=D // 7030

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7031
D=A // 7032
@SP // 7033
AM=M+1 // 7034
A=A-1 // 7035
M=D // 7036
@63 // 7037
D=A // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=D // 7042
@3 // 7043
D=A // 7044
@SP // 7045
AM=M+1 // 7046
A=A-1 // 7047
M=D // 7048
@3 // 7049
D=A // 7050
@SP // 7051
AM=M+1 // 7052
A=A-1 // 7053
M=D // 7054
@31 // 7055
D=A // 7056
@SP // 7057
AM=M+1 // 7058
A=A-1 // 7059
M=D // 7060
@48 // 7061
D=A // 7062
@SP // 7063
AM=M+1 // 7064
A=A-1 // 7065
M=D // 7066
@48 // 7067
D=A // 7068
@SP // 7069
AM=M+1 // 7070
A=A-1 // 7071
M=D // 7072
@48 // 7073
D=A // 7074
@SP // 7075
AM=M+1 // 7076
A=A-1 // 7077
M=D // 7078
@51 // 7079
D=A // 7080
@SP // 7081
AM=M+1 // 7082
A=A-1 // 7083
M=D // 7084
@30 // 7085
D=A // 7086
@SP // 7087
AM=M+1 // 7088
A=A-1 // 7089
M=D // 7090
@SP // 7091
AM=M+1 // 7092
A=A-1 // 7093
M=0 // 7094
@SP // 7095
AM=M+1 // 7096
A=A-1 // 7097
M=0 // 7098
// call Output.create
@17 // 7099
D=A // 7100
@14 // 7101
M=D // 7102
@Output.create // 7103
D=A // 7104
@13 // 7105
M=D // 7106
@Output.initMap.ret.23 // 7107
D=A // 7108
@CALL // 7109
0;JMP // 7110
(Output.initMap.ret.23)
@SP // 7111
AM=M-1 // 7112
D=M // 7113
@5 // 7114
M=D // 7115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7116
D=A // 7117
@SP // 7118
AM=M+1 // 7119
A=A-1 // 7120
M=D // 7121
@28 // 7122
D=A // 7123
@SP // 7124
AM=M+1 // 7125
A=A-1 // 7126
M=D // 7127
@6 // 7128
D=A // 7129
@SP // 7130
AM=M+1 // 7131
A=A-1 // 7132
M=D // 7133
@3 // 7134
D=A // 7135
@SP // 7136
AM=M+1 // 7137
A=A-1 // 7138
M=D // 7139
@3 // 7140
D=A // 7141
@SP // 7142
AM=M+1 // 7143
A=A-1 // 7144
M=D // 7145
@31 // 7146
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
@51 // 7164
D=A // 7165
@SP // 7166
AM=M+1 // 7167
A=A-1 // 7168
M=D // 7169
@30 // 7170
D=A // 7171
@SP // 7172
AM=M+1 // 7173
A=A-1 // 7174
M=D // 7175
@SP // 7176
AM=M+1 // 7177
A=A-1 // 7178
M=0 // 7179
@SP // 7180
AM=M+1 // 7181
A=A-1 // 7182
M=0 // 7183
// call Output.create
@17 // 7184
D=A // 7185
@14 // 7186
M=D // 7187
@Output.create // 7188
D=A // 7189
@13 // 7190
M=D // 7191
@Output.initMap.ret.24 // 7192
D=A // 7193
@CALL // 7194
0;JMP // 7195
(Output.initMap.ret.24)
@SP // 7196
AM=M-1 // 7197
D=M // 7198
@5 // 7199
M=D // 7200

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7201
D=A // 7202
@SP // 7203
AM=M+1 // 7204
A=A-1 // 7205
M=D // 7206
@63 // 7207
D=A // 7208
@SP // 7209
AM=M+1 // 7210
A=A-1 // 7211
M=D // 7212
@49 // 7213
D=A // 7214
@SP // 7215
AM=M+1 // 7216
A=A-1 // 7217
M=D // 7218
@48 // 7219
D=A // 7220
@SP // 7221
AM=M+1 // 7222
A=A-1 // 7223
M=D // 7224
@48 // 7225
D=A // 7226
@SP // 7227
AM=M+1 // 7228
A=A-1 // 7229
M=D // 7230
@24 // 7231
D=A // 7232
@SP // 7233
AM=M+1 // 7234
A=A-1 // 7235
M=D // 7236
@12 // 7237
D=A // 7238
@SP // 7239
AM=M+1 // 7240
A=A-1 // 7241
M=D // 7242
@12 // 7243
D=A // 7244
@SP // 7245
AM=M+1 // 7246
A=A-1 // 7247
M=D // 7248
@12 // 7249
D=A // 7250
@SP // 7251
AM=M+1 // 7252
A=A-1 // 7253
M=D // 7254
@12 // 7255
D=A // 7256
@SP // 7257
AM=M+1 // 7258
A=A-1 // 7259
M=D // 7260
@SP // 7261
AM=M+1 // 7262
A=A-1 // 7263
M=0 // 7264
@SP // 7265
AM=M+1 // 7266
A=A-1 // 7267
M=0 // 7268
// call Output.create
@17 // 7269
D=A // 7270
@14 // 7271
M=D // 7272
@Output.create // 7273
D=A // 7274
@13 // 7275
M=D // 7276
@Output.initMap.ret.25 // 7277
D=A // 7278
@CALL // 7279
0;JMP // 7280
(Output.initMap.ret.25)
@SP // 7281
AM=M-1 // 7282
D=M // 7283
@5 // 7284
M=D // 7285

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7286
D=A // 7287
@SP // 7288
AM=M+1 // 7289
A=A-1 // 7290
M=D // 7291
@30 // 7292
D=A // 7293
@SP // 7294
AM=M+1 // 7295
A=A-1 // 7296
M=D // 7297
@51 // 7298
D=A // 7299
@SP // 7300
AM=M+1 // 7301
A=A-1 // 7302
M=D // 7303
@51 // 7304
D=A // 7305
@SP // 7306
AM=M+1 // 7307
A=A-1 // 7308
M=D // 7309
@51 // 7310
D=A // 7311
@SP // 7312
AM=M+1 // 7313
A=A-1 // 7314
M=D // 7315
@30 // 7316
D=A // 7317
@SP // 7318
AM=M+1 // 7319
A=A-1 // 7320
M=D // 7321
@51 // 7322
D=A // 7323
@SP // 7324
AM=M+1 // 7325
A=A-1 // 7326
M=D // 7327
@51 // 7328
D=A // 7329
@SP // 7330
AM=M+1 // 7331
A=A-1 // 7332
M=D // 7333
@51 // 7334
D=A // 7335
@SP // 7336
AM=M+1 // 7337
A=A-1 // 7338
M=D // 7339
@30 // 7340
D=A // 7341
@SP // 7342
AM=M+1 // 7343
A=A-1 // 7344
M=D // 7345
@SP // 7346
AM=M+1 // 7347
A=A-1 // 7348
M=0 // 7349
@SP // 7350
AM=M+1 // 7351
A=A-1 // 7352
M=0 // 7353
// call Output.create
@17 // 7354
D=A // 7355
@14 // 7356
M=D // 7357
@Output.create // 7358
D=A // 7359
@13 // 7360
M=D // 7361
@Output.initMap.ret.26 // 7362
D=A // 7363
@CALL // 7364
0;JMP // 7365
(Output.initMap.ret.26)
@SP // 7366
AM=M-1 // 7367
D=M // 7368
@5 // 7369
M=D // 7370

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7371
D=A // 7372
@SP // 7373
AM=M+1 // 7374
A=A-1 // 7375
M=D // 7376
@30 // 7377
D=A // 7378
@SP // 7379
AM=M+1 // 7380
A=A-1 // 7381
M=D // 7382
@51 // 7383
D=A // 7384
@SP // 7385
AM=M+1 // 7386
A=A-1 // 7387
M=D // 7388
@51 // 7389
D=A // 7390
@SP // 7391
AM=M+1 // 7392
A=A-1 // 7393
M=D // 7394
@51 // 7395
D=A // 7396
@SP // 7397
AM=M+1 // 7398
A=A-1 // 7399
M=D // 7400
@62 // 7401
D=A // 7402
@SP // 7403
AM=M+1 // 7404
A=A-1 // 7405
M=D // 7406
@48 // 7407
D=A // 7408
@SP // 7409
AM=M+1 // 7410
A=A-1 // 7411
M=D // 7412
@48 // 7413
D=A // 7414
@SP // 7415
AM=M+1 // 7416
A=A-1 // 7417
M=D // 7418
@24 // 7419
D=A // 7420
@SP // 7421
AM=M+1 // 7422
A=A-1 // 7423
M=D // 7424
@14 // 7425
D=A // 7426
@SP // 7427
AM=M+1 // 7428
A=A-1 // 7429
M=D // 7430
@SP // 7431
AM=M+1 // 7432
A=A-1 // 7433
M=0 // 7434
@SP // 7435
AM=M+1 // 7436
A=A-1 // 7437
M=0 // 7438
// call Output.create
@17 // 7439
D=A // 7440
@14 // 7441
M=D // 7442
@Output.create // 7443
D=A // 7444
@13 // 7445
M=D // 7446
@Output.initMap.ret.27 // 7447
D=A // 7448
@CALL // 7449
0;JMP // 7450
(Output.initMap.ret.27)
@SP // 7451
AM=M-1 // 7452
D=M // 7453
@5 // 7454
M=D // 7455

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@58 // 7456
D=A // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=D // 7461
@SP // 7462
AM=M+1 // 7463
A=A-1 // 7464
M=0 // 7465
@SP // 7466
AM=M+1 // 7467
A=A-1 // 7468
M=0 // 7469
@12 // 7470
D=A // 7471
@SP // 7472
AM=M+1 // 7473
A=A-1 // 7474
M=D // 7475
@12 // 7476
D=A // 7477
@SP // 7478
AM=M+1 // 7479
A=A-1 // 7480
M=D // 7481
@SP // 7482
AM=M+1 // 7483
A=A-1 // 7484
M=0 // 7485
@SP // 7486
AM=M+1 // 7487
A=A-1 // 7488
M=0 // 7489
@12 // 7490
D=A // 7491
@SP // 7492
AM=M+1 // 7493
A=A-1 // 7494
M=D // 7495
@12 // 7496
D=A // 7497
@SP // 7498
AM=M+1 // 7499
A=A-1 // 7500
M=D // 7501
@SP // 7502
AM=M+1 // 7503
A=A-1 // 7504
M=0 // 7505
@SP // 7506
AM=M+1 // 7507
A=A-1 // 7508
M=0 // 7509
@SP // 7510
AM=M+1 // 7511
A=A-1 // 7512
M=0 // 7513
// call Output.create
@17 // 7514
D=A // 7515
@14 // 7516
M=D // 7517
@Output.create // 7518
D=A // 7519
@13 // 7520
M=D // 7521
@Output.initMap.ret.28 // 7522
D=A // 7523
@CALL // 7524
0;JMP // 7525
(Output.initMap.ret.28)
@SP // 7526
AM=M-1 // 7527
D=M // 7528
@5 // 7529
M=D // 7530

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@59 // 7531
D=A // 7532
@SP // 7533
AM=M+1 // 7534
A=A-1 // 7535
M=D // 7536
@SP // 7537
AM=M+1 // 7538
A=A-1 // 7539
M=0 // 7540
@SP // 7541
AM=M+1 // 7542
A=A-1 // 7543
M=0 // 7544
@12 // 7545
D=A // 7546
@SP // 7547
AM=M+1 // 7548
A=A-1 // 7549
M=D // 7550
@12 // 7551
D=A // 7552
@SP // 7553
AM=M+1 // 7554
A=A-1 // 7555
M=D // 7556
@SP // 7557
AM=M+1 // 7558
A=A-1 // 7559
M=0 // 7560
@SP // 7561
AM=M+1 // 7562
A=A-1 // 7563
M=0 // 7564
@12 // 7565
D=A // 7566
@SP // 7567
AM=M+1 // 7568
A=A-1 // 7569
M=D // 7570
@12 // 7571
D=A // 7572
@SP // 7573
AM=M+1 // 7574
A=A-1 // 7575
M=D // 7576
@6 // 7577
D=A // 7578
@SP // 7579
AM=M+1 // 7580
A=A-1 // 7581
M=D // 7582
@SP // 7583
AM=M+1 // 7584
A=A-1 // 7585
M=0 // 7586
@SP // 7587
AM=M+1 // 7588
A=A-1 // 7589
M=0 // 7590
// call Output.create
@17 // 7591
D=A // 7592
@14 // 7593
M=D // 7594
@Output.create // 7595
D=A // 7596
@13 // 7597
M=D // 7598
@Output.initMap.ret.29 // 7599
D=A // 7600
@CALL // 7601
0;JMP // 7602
(Output.initMap.ret.29)
@SP // 7603
AM=M-1 // 7604
D=M // 7605
@5 // 7606
M=D // 7607

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@60 // 7608
D=A // 7609
@SP // 7610
AM=M+1 // 7611
A=A-1 // 7612
M=D // 7613
@SP // 7614
AM=M+1 // 7615
A=A-1 // 7616
M=0 // 7617
@SP // 7618
AM=M+1 // 7619
A=A-1 // 7620
M=0 // 7621
@24 // 7622
D=A // 7623
@SP // 7624
AM=M+1 // 7625
A=A-1 // 7626
M=D // 7627
@12 // 7628
D=A // 7629
@SP // 7630
AM=M+1 // 7631
A=A-1 // 7632
M=D // 7633
@6 // 7634
D=A // 7635
@SP // 7636
AM=M+1 // 7637
A=A-1 // 7638
M=D // 7639
@3 // 7640
D=A // 7641
@SP // 7642
AM=M+1 // 7643
A=A-1 // 7644
M=D // 7645
@6 // 7646
D=A // 7647
@SP // 7648
AM=M+1 // 7649
A=A-1 // 7650
M=D // 7651
@12 // 7652
D=A // 7653
@SP // 7654
AM=M+1 // 7655
A=A-1 // 7656
M=D // 7657
@24 // 7658
D=A // 7659
@SP // 7660
AM=M+1 // 7661
A=A-1 // 7662
M=D // 7663
@SP // 7664
AM=M+1 // 7665
A=A-1 // 7666
M=0 // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=0 // 7671
// call Output.create
@17 // 7672
D=A // 7673
@14 // 7674
M=D // 7675
@Output.create // 7676
D=A // 7677
@13 // 7678
M=D // 7679
@Output.initMap.ret.30 // 7680
D=A // 7681
@CALL // 7682
0;JMP // 7683
(Output.initMap.ret.30)
@SP // 7684
AM=M-1 // 7685
D=M // 7686
@5 // 7687
M=D // 7688

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@61 // 7689
D=A // 7690
@SP // 7691
AM=M+1 // 7692
A=A-1 // 7693
M=D // 7694
@SP // 7695
AM=M+1 // 7696
A=A-1 // 7697
M=0 // 7698
@SP // 7699
AM=M+1 // 7700
A=A-1 // 7701
M=0 // 7702
@SP // 7703
AM=M+1 // 7704
A=A-1 // 7705
M=0 // 7706
@63 // 7707
D=A // 7708
@SP // 7709
AM=M+1 // 7710
A=A-1 // 7711
M=D // 7712
@SP // 7713
AM=M+1 // 7714
A=A-1 // 7715
M=0 // 7716
@SP // 7717
AM=M+1 // 7718
A=A-1 // 7719
M=0 // 7720
@63 // 7721
D=A // 7722
@SP // 7723
AM=M+1 // 7724
A=A-1 // 7725
M=D // 7726
@SP // 7727
AM=M+1 // 7728
A=A-1 // 7729
M=0 // 7730
@SP // 7731
AM=M+1 // 7732
A=A-1 // 7733
M=0 // 7734
@SP // 7735
AM=M+1 // 7736
A=A-1 // 7737
M=0 // 7738
@SP // 7739
AM=M+1 // 7740
A=A-1 // 7741
M=0 // 7742
// call Output.create
@17 // 7743
D=A // 7744
@14 // 7745
M=D // 7746
@Output.create // 7747
D=A // 7748
@13 // 7749
M=D // 7750
@Output.initMap.ret.31 // 7751
D=A // 7752
@CALL // 7753
0;JMP // 7754
(Output.initMap.ret.31)
@SP // 7755
AM=M-1 // 7756
D=M // 7757
@5 // 7758
M=D // 7759

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@62 // 7760
D=A // 7761
@SP // 7762
AM=M+1 // 7763
A=A-1 // 7764
M=D // 7765
@SP // 7766
AM=M+1 // 7767
A=A-1 // 7768
M=0 // 7769
@SP // 7770
AM=M+1 // 7771
A=A-1 // 7772
M=0 // 7773
@3 // 7774
D=A // 7775
@SP // 7776
AM=M+1 // 7777
A=A-1 // 7778
M=D // 7779
@6 // 7780
D=A // 7781
@SP // 7782
AM=M+1 // 7783
A=A-1 // 7784
M=D // 7785
@12 // 7786
D=A // 7787
@SP // 7788
AM=M+1 // 7789
A=A-1 // 7790
M=D // 7791
@24 // 7792
D=A // 7793
@SP // 7794
AM=M+1 // 7795
A=A-1 // 7796
M=D // 7797
@12 // 7798
D=A // 7799
@SP // 7800
AM=M+1 // 7801
A=A-1 // 7802
M=D // 7803
@6 // 7804
D=A // 7805
@SP // 7806
AM=M+1 // 7807
A=A-1 // 7808
M=D // 7809
@3 // 7810
D=A // 7811
@SP // 7812
AM=M+1 // 7813
A=A-1 // 7814
M=D // 7815
@SP // 7816
AM=M+1 // 7817
A=A-1 // 7818
M=0 // 7819
@SP // 7820
AM=M+1 // 7821
A=A-1 // 7822
M=0 // 7823
// call Output.create
@17 // 7824
D=A // 7825
@14 // 7826
M=D // 7827
@Output.create // 7828
D=A // 7829
@13 // 7830
M=D // 7831
@Output.initMap.ret.32 // 7832
D=A // 7833
@CALL // 7834
0;JMP // 7835
(Output.initMap.ret.32)
@SP // 7836
AM=M-1 // 7837
D=M // 7838
@5 // 7839
M=D // 7840

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 7841
D=A // 7842
@SP // 7843
AM=M+1 // 7844
A=A-1 // 7845
M=D // 7846
@30 // 7847
D=A // 7848
@SP // 7849
AM=M+1 // 7850
A=A-1 // 7851
M=D // 7852
@51 // 7853
D=A // 7854
@SP // 7855
AM=M+1 // 7856
A=A-1 // 7857
M=D // 7858
@51 // 7859
D=A // 7860
@SP // 7861
AM=M+1 // 7862
A=A-1 // 7863
M=D // 7864
@59 // 7865
D=A // 7866
@SP // 7867
AM=M+1 // 7868
A=A-1 // 7869
M=D // 7870
@59 // 7871
D=A // 7872
@SP // 7873
AM=M+1 // 7874
A=A-1 // 7875
M=D // 7876
@59 // 7877
D=A // 7878
@SP // 7879
AM=M+1 // 7880
A=A-1 // 7881
M=D // 7882
@27 // 7883
D=A // 7884
@SP // 7885
AM=M+1 // 7886
A=A-1 // 7887
M=D // 7888
@3 // 7889
D=A // 7890
@SP // 7891
AM=M+1 // 7892
A=A-1 // 7893
M=D // 7894
@30 // 7895
D=A // 7896
@SP // 7897
AM=M+1 // 7898
A=A-1 // 7899
M=D // 7900
@SP // 7901
AM=M+1 // 7902
A=A-1 // 7903
M=0 // 7904
@SP // 7905
AM=M+1 // 7906
A=A-1 // 7907
M=0 // 7908
// call Output.create
@17 // 7909
D=A // 7910
@14 // 7911
M=D // 7912
@Output.create // 7913
D=A // 7914
@13 // 7915
M=D // 7916
@Output.initMap.ret.33 // 7917
D=A // 7918
@CALL // 7919
0;JMP // 7920
(Output.initMap.ret.33)
@SP // 7921
AM=M-1 // 7922
D=M // 7923
@5 // 7924
M=D // 7925

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 7926
D=A // 7927
@SP // 7928
AM=M+1 // 7929
A=A-1 // 7930
M=D // 7931
@30 // 7932
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
@24 // 7950
D=A // 7951
@SP // 7952
AM=M+1 // 7953
A=A-1 // 7954
M=D // 7955
@12 // 7956
D=A // 7957
@SP // 7958
AM=M+1 // 7959
A=A-1 // 7960
M=D // 7961
@12 // 7962
D=A // 7963
@SP // 7964
AM=M+1 // 7965
A=A-1 // 7966
M=D // 7967
@SP // 7968
AM=M+1 // 7969
A=A-1 // 7970
M=0 // 7971
@12 // 7972
D=A // 7973
@SP // 7974
AM=M+1 // 7975
A=A-1 // 7976
M=D // 7977
@12 // 7978
D=A // 7979
@SP // 7980
AM=M+1 // 7981
A=A-1 // 7982
M=D // 7983
@SP // 7984
AM=M+1 // 7985
A=A-1 // 7986
M=0 // 7987
@SP // 7988
AM=M+1 // 7989
A=A-1 // 7990
M=0 // 7991
// call Output.create
@17 // 7992
D=A // 7993
@14 // 7994
M=D // 7995
@Output.create // 7996
D=A // 7997
@13 // 7998
M=D // 7999
@Output.initMap.ret.34 // 8000
D=A // 8001
@CALL // 8002
0;JMP // 8003
(Output.initMap.ret.34)
@SP // 8004
AM=M-1 // 8005
D=M // 8006
@5 // 8007
M=D // 8008

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8009
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
@30 // 8021
D=A // 8022
@SP // 8023
AM=M+1 // 8024
A=A-1 // 8025
M=D // 8026
@51 // 8027
D=A // 8028
@SP // 8029
AM=M+1 // 8030
A=A-1 // 8031
M=D // 8032
@51 // 8033
D=A // 8034
@SP // 8035
AM=M+1 // 8036
A=A-1 // 8037
M=D // 8038
@63 // 8039
D=A // 8040
@SP // 8041
AM=M+1 // 8042
A=A-1 // 8043
M=D // 8044
@51 // 8045
D=A // 8046
@SP // 8047
AM=M+1 // 8048
A=A-1 // 8049
M=D // 8050
@51 // 8051
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
@51 // 8063
D=A // 8064
@SP // 8065
AM=M+1 // 8066
A=A-1 // 8067
M=D // 8068
@SP // 8069
AM=M+1 // 8070
A=A-1 // 8071
M=0 // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=0 // 8076
// call Output.create
@17 // 8077
D=A // 8078
@14 // 8079
M=D // 8080
@Output.create // 8081
D=A // 8082
@13 // 8083
M=D // 8084
@Output.initMap.ret.35 // 8085
D=A // 8086
@CALL // 8087
0;JMP // 8088
(Output.initMap.ret.35)
@SP // 8089
AM=M-1 // 8090
D=M // 8091
@5 // 8092
M=D // 8093

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8094
D=A // 8095
@SP // 8096
AM=M+1 // 8097
A=A-1 // 8098
M=D // 8099
@31 // 8100
D=A // 8101
@SP // 8102
AM=M+1 // 8103
A=A-1 // 8104
M=D // 8105
@51 // 8106
D=A // 8107
@SP // 8108
AM=M+1 // 8109
A=A-1 // 8110
M=D // 8111
@51 // 8112
D=A // 8113
@SP // 8114
AM=M+1 // 8115
A=A-1 // 8116
M=D // 8117
@51 // 8118
D=A // 8119
@SP // 8120
AM=M+1 // 8121
A=A-1 // 8122
M=D // 8123
@31 // 8124
D=A // 8125
@SP // 8126
AM=M+1 // 8127
A=A-1 // 8128
M=D // 8129
@51 // 8130
D=A // 8131
@SP // 8132
AM=M+1 // 8133
A=A-1 // 8134
M=D // 8135
@51 // 8136
D=A // 8137
@SP // 8138
AM=M+1 // 8139
A=A-1 // 8140
M=D // 8141
@51 // 8142
D=A // 8143
@SP // 8144
AM=M+1 // 8145
A=A-1 // 8146
M=D // 8147
@31 // 8148
D=A // 8149
@SP // 8150
AM=M+1 // 8151
A=A-1 // 8152
M=D // 8153
@SP // 8154
AM=M+1 // 8155
A=A-1 // 8156
M=0 // 8157
@SP // 8158
AM=M+1 // 8159
A=A-1 // 8160
M=0 // 8161
// call Output.create
@17 // 8162
D=A // 8163
@14 // 8164
M=D // 8165
@Output.create // 8166
D=A // 8167
@13 // 8168
M=D // 8169
@Output.initMap.ret.36 // 8170
D=A // 8171
@CALL // 8172
0;JMP // 8173
(Output.initMap.ret.36)
@SP // 8174
AM=M-1 // 8175
D=M // 8176
@5 // 8177
M=D // 8178

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8179
D=A // 8180
@SP // 8181
AM=M+1 // 8182
A=A-1 // 8183
M=D // 8184
@28 // 8185
D=A // 8186
@SP // 8187
AM=M+1 // 8188
A=A-1 // 8189
M=D // 8190
@54 // 8191
D=A // 8192
@SP // 8193
AM=M+1 // 8194
A=A-1 // 8195
M=D // 8196
@35 // 8197
D=A // 8198
@SP // 8199
AM=M+1 // 8200
A=A-1 // 8201
M=D // 8202
@3 // 8203
D=A // 8204
@SP // 8205
AM=M+1 // 8206
A=A-1 // 8207
M=D // 8208
@3 // 8209
D=A // 8210
@SP // 8211
AM=M+1 // 8212
A=A-1 // 8213
M=D // 8214
@3 // 8215
D=A // 8216
@SP // 8217
AM=M+1 // 8218
A=A-1 // 8219
M=D // 8220
@35 // 8221
D=A // 8222
@SP // 8223
AM=M+1 // 8224
A=A-1 // 8225
M=D // 8226
@54 // 8227
D=A // 8228
@SP // 8229
AM=M+1 // 8230
A=A-1 // 8231
M=D // 8232
@28 // 8233
D=A // 8234
@SP // 8235
AM=M+1 // 8236
A=A-1 // 8237
M=D // 8238
@SP // 8239
AM=M+1 // 8240
A=A-1 // 8241
M=0 // 8242
@SP // 8243
AM=M+1 // 8244
A=A-1 // 8245
M=0 // 8246
// call Output.create
@17 // 8247
D=A // 8248
@14 // 8249
M=D // 8250
@Output.create // 8251
D=A // 8252
@13 // 8253
M=D // 8254
@Output.initMap.ret.37 // 8255
D=A // 8256
@CALL // 8257
0;JMP // 8258
(Output.initMap.ret.37)
@SP // 8259
AM=M-1 // 8260
D=M // 8261
@5 // 8262
M=D // 8263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8264
D=A // 8265
@SP // 8266
AM=M+1 // 8267
A=A-1 // 8268
M=D // 8269
@15 // 8270
D=A // 8271
@SP // 8272
AM=M+1 // 8273
A=A-1 // 8274
M=D // 8275
@27 // 8276
D=A // 8277
@SP // 8278
AM=M+1 // 8279
A=A-1 // 8280
M=D // 8281
@51 // 8282
D=A // 8283
@SP // 8284
AM=M+1 // 8285
A=A-1 // 8286
M=D // 8287
@51 // 8288
D=A // 8289
@SP // 8290
AM=M+1 // 8291
A=A-1 // 8292
M=D // 8293
@51 // 8294
D=A // 8295
@SP // 8296
AM=M+1 // 8297
A=A-1 // 8298
M=D // 8299
@51 // 8300
D=A // 8301
@SP // 8302
AM=M+1 // 8303
A=A-1 // 8304
M=D // 8305
@51 // 8306
D=A // 8307
@SP // 8308
AM=M+1 // 8309
A=A-1 // 8310
M=D // 8311
@27 // 8312
D=A // 8313
@SP // 8314
AM=M+1 // 8315
A=A-1 // 8316
M=D // 8317
@15 // 8318
D=A // 8319
@SP // 8320
AM=M+1 // 8321
A=A-1 // 8322
M=D // 8323
@SP // 8324
AM=M+1 // 8325
A=A-1 // 8326
M=0 // 8327
@SP // 8328
AM=M+1 // 8329
A=A-1 // 8330
M=0 // 8331
// call Output.create
@17 // 8332
D=A // 8333
@14 // 8334
M=D // 8335
@Output.create // 8336
D=A // 8337
@13 // 8338
M=D // 8339
@Output.initMap.ret.38 // 8340
D=A // 8341
@CALL // 8342
0;JMP // 8343
(Output.initMap.ret.38)
@SP // 8344
AM=M-1 // 8345
D=M // 8346
@5 // 8347
M=D // 8348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8349
D=A // 8350
@SP // 8351
AM=M+1 // 8352
A=A-1 // 8353
M=D // 8354
@63 // 8355
D=A // 8356
@SP // 8357
AM=M+1 // 8358
A=A-1 // 8359
M=D // 8360
@51 // 8361
D=A // 8362
@SP // 8363
AM=M+1 // 8364
A=A-1 // 8365
M=D // 8366
@35 // 8367
D=A // 8368
@SP // 8369
AM=M+1 // 8370
A=A-1 // 8371
M=D // 8372
@11 // 8373
D=A // 8374
@SP // 8375
AM=M+1 // 8376
A=A-1 // 8377
M=D // 8378
@15 // 8379
D=A // 8380
@SP // 8381
AM=M+1 // 8382
A=A-1 // 8383
M=D // 8384
@11 // 8385
D=A // 8386
@SP // 8387
AM=M+1 // 8388
A=A-1 // 8389
M=D // 8390
@35 // 8391
D=A // 8392
@SP // 8393
AM=M+1 // 8394
A=A-1 // 8395
M=D // 8396
@51 // 8397
D=A // 8398
@SP // 8399
AM=M+1 // 8400
A=A-1 // 8401
M=D // 8402
@63 // 8403
D=A // 8404
@SP // 8405
AM=M+1 // 8406
A=A-1 // 8407
M=D // 8408
@SP // 8409
AM=M+1 // 8410
A=A-1 // 8411
M=0 // 8412
@SP // 8413
AM=M+1 // 8414
A=A-1 // 8415
M=0 // 8416
// call Output.create
@17 // 8417
D=A // 8418
@14 // 8419
M=D // 8420
@Output.create // 8421
D=A // 8422
@13 // 8423
M=D // 8424
@Output.initMap.ret.39 // 8425
D=A // 8426
@CALL // 8427
0;JMP // 8428
(Output.initMap.ret.39)
@SP // 8429
AM=M-1 // 8430
D=M // 8431
@5 // 8432
M=D // 8433

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8434
D=A // 8435
@SP // 8436
AM=M+1 // 8437
A=A-1 // 8438
M=D // 8439
@63 // 8440
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
@35 // 8452
D=A // 8453
@SP // 8454
AM=M+1 // 8455
A=A-1 // 8456
M=D // 8457
@11 // 8458
D=A // 8459
@SP // 8460
AM=M+1 // 8461
A=A-1 // 8462
M=D // 8463
@15 // 8464
D=A // 8465
@SP // 8466
AM=M+1 // 8467
A=A-1 // 8468
M=D // 8469
@11 // 8470
D=A // 8471
@SP // 8472
AM=M+1 // 8473
A=A-1 // 8474
M=D // 8475
@3 // 8476
D=A // 8477
@SP // 8478
AM=M+1 // 8479
A=A-1 // 8480
M=D // 8481
@3 // 8482
D=A // 8483
@SP // 8484
AM=M+1 // 8485
A=A-1 // 8486
M=D // 8487
@3 // 8488
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
@Output.initMap.ret.40 // 8510
D=A // 8511
@CALL // 8512
0;JMP // 8513
(Output.initMap.ret.40)
@SP // 8514
AM=M-1 // 8515
D=M // 8516
@5 // 8517
M=D // 8518

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8519
D=A // 8520
@SP // 8521
AM=M+1 // 8522
A=A-1 // 8523
M=D // 8524
@28 // 8525
D=A // 8526
@SP // 8527
AM=M+1 // 8528
A=A-1 // 8529
M=D // 8530
@54 // 8531
D=A // 8532
@SP // 8533
AM=M+1 // 8534
A=A-1 // 8535
M=D // 8536
@35 // 8537
D=A // 8538
@SP // 8539
AM=M+1 // 8540
A=A-1 // 8541
M=D // 8542
@3 // 8543
D=A // 8544
@SP // 8545
AM=M+1 // 8546
A=A-1 // 8547
M=D // 8548
@59 // 8549
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
@54 // 8567
D=A // 8568
@SP // 8569
AM=M+1 // 8570
A=A-1 // 8571
M=D // 8572
@44 // 8573
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
@Output.initMap.ret.41 // 8595
D=A // 8596
@CALL // 8597
0;JMP // 8598
(Output.initMap.ret.41)
@SP // 8599
AM=M-1 // 8600
D=M // 8601
@5 // 8602
M=D // 8603

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8604
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
@63 // 8634
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
@51 // 8652
D=A // 8653
@SP // 8654
AM=M+1 // 8655
A=A-1 // 8656
M=D // 8657
@51 // 8658
D=A // 8659
@SP // 8660
AM=M+1 // 8661
A=A-1 // 8662
M=D // 8663
@SP // 8664
AM=M+1 // 8665
A=A-1 // 8666
M=0 // 8667
@SP // 8668
AM=M+1 // 8669
A=A-1 // 8670
M=0 // 8671
// call Output.create
@17 // 8672
D=A // 8673
@14 // 8674
M=D // 8675
@Output.create // 8676
D=A // 8677
@13 // 8678
M=D // 8679
@Output.initMap.ret.42 // 8680
D=A // 8681
@CALL // 8682
0;JMP // 8683
(Output.initMap.ret.42)
@SP // 8684
AM=M-1 // 8685
D=M // 8686
@5 // 8687
M=D // 8688

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8689
D=A // 8690
@SP // 8691
AM=M+1 // 8692
A=A-1 // 8693
M=D // 8694
@30 // 8695
D=A // 8696
@SP // 8697
AM=M+1 // 8698
A=A-1 // 8699
M=D // 8700
@12 // 8701
D=A // 8702
@SP // 8703
AM=M+1 // 8704
A=A-1 // 8705
M=D // 8706
@12 // 8707
D=A // 8708
@SP // 8709
AM=M+1 // 8710
A=A-1 // 8711
M=D // 8712
@12 // 8713
D=A // 8714
@SP // 8715
AM=M+1 // 8716
A=A-1 // 8717
M=D // 8718
@12 // 8719
D=A // 8720
@SP // 8721
AM=M+1 // 8722
A=A-1 // 8723
M=D // 8724
@12 // 8725
D=A // 8726
@SP // 8727
AM=M+1 // 8728
A=A-1 // 8729
M=D // 8730
@12 // 8731
D=A // 8732
@SP // 8733
AM=M+1 // 8734
A=A-1 // 8735
M=D // 8736
@12 // 8737
D=A // 8738
@SP // 8739
AM=M+1 // 8740
A=A-1 // 8741
M=D // 8742
@30 // 8743
D=A // 8744
@SP // 8745
AM=M+1 // 8746
A=A-1 // 8747
M=D // 8748
@SP // 8749
AM=M+1 // 8750
A=A-1 // 8751
M=0 // 8752
@SP // 8753
AM=M+1 // 8754
A=A-1 // 8755
M=0 // 8756
// call Output.create
@17 // 8757
D=A // 8758
@14 // 8759
M=D // 8760
@Output.create // 8761
D=A // 8762
@13 // 8763
M=D // 8764
@Output.initMap.ret.43 // 8765
D=A // 8766
@CALL // 8767
0;JMP // 8768
(Output.initMap.ret.43)
@SP // 8769
AM=M-1 // 8770
D=M // 8771
@5 // 8772
M=D // 8773

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8774
D=A // 8775
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=D // 8779
@60 // 8780
D=A // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=D // 8785
@24 // 8786
D=A // 8787
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=D // 8791
@24 // 8792
D=A // 8793
@SP // 8794
AM=M+1 // 8795
A=A-1 // 8796
M=D // 8797
@24 // 8798
D=A // 8799
@SP // 8800
AM=M+1 // 8801
A=A-1 // 8802
M=D // 8803
@24 // 8804
D=A // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=D // 8809
@24 // 8810
D=A // 8811
@SP // 8812
AM=M+1 // 8813
A=A-1 // 8814
M=D // 8815
@27 // 8816
D=A // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=D // 8821
@27 // 8822
D=A // 8823
@SP // 8824
AM=M+1 // 8825
A=A-1 // 8826
M=D // 8827
@14 // 8828
D=A // 8829
@SP // 8830
AM=M+1 // 8831
A=A-1 // 8832
M=D // 8833
@SP // 8834
AM=M+1 // 8835
A=A-1 // 8836
M=0 // 8837
@SP // 8838
AM=M+1 // 8839
A=A-1 // 8840
M=0 // 8841
// call Output.create
@17 // 8842
D=A // 8843
@14 // 8844
M=D // 8845
@Output.create // 8846
D=A // 8847
@13 // 8848
M=D // 8849
@Output.initMap.ret.44 // 8850
D=A // 8851
@CALL // 8852
0;JMP // 8853
(Output.initMap.ret.44)
@SP // 8854
AM=M-1 // 8855
D=M // 8856
@5 // 8857
M=D // 8858

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 8859
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
@27 // 8883
D=A // 8884
@SP // 8885
AM=M+1 // 8886
A=A-1 // 8887
M=D // 8888
@15 // 8889
D=A // 8890
@SP // 8891
AM=M+1 // 8892
A=A-1 // 8893
M=D // 8894
@27 // 8895
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
@SP // 8919
AM=M+1 // 8920
A=A-1 // 8921
M=0 // 8922
@SP // 8923
AM=M+1 // 8924
A=A-1 // 8925
M=0 // 8926
// call Output.create
@17 // 8927
D=A // 8928
@14 // 8929
M=D // 8930
@Output.create // 8931
D=A // 8932
@13 // 8933
M=D // 8934
@Output.initMap.ret.45 // 8935
D=A // 8936
@CALL // 8937
0;JMP // 8938
(Output.initMap.ret.45)
@SP // 8939
AM=M-1 // 8940
D=M // 8941
@5 // 8942
M=D // 8943

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 8944
D=A // 8945
@SP // 8946
AM=M+1 // 8947
A=A-1 // 8948
M=D // 8949
@3 // 8950
D=A // 8951
@SP // 8952
AM=M+1 // 8953
A=A-1 // 8954
M=D // 8955
@3 // 8956
D=A // 8957
@SP // 8958
AM=M+1 // 8959
A=A-1 // 8960
M=D // 8961
@3 // 8962
D=A // 8963
@SP // 8964
AM=M+1 // 8965
A=A-1 // 8966
M=D // 8967
@3 // 8968
D=A // 8969
@SP // 8970
AM=M+1 // 8971
A=A-1 // 8972
M=D // 8973
@3 // 8974
D=A // 8975
@SP // 8976
AM=M+1 // 8977
A=A-1 // 8978
M=D // 8979
@3 // 8980
D=A // 8981
@SP // 8982
AM=M+1 // 8983
A=A-1 // 8984
M=D // 8985
@35 // 8986
D=A // 8987
@SP // 8988
AM=M+1 // 8989
A=A-1 // 8990
M=D // 8991
@51 // 8992
D=A // 8993
@SP // 8994
AM=M+1 // 8995
A=A-1 // 8996
M=D // 8997
@63 // 8998
D=A // 8999
@SP // 9000
AM=M+1 // 9001
A=A-1 // 9002
M=D // 9003
@SP // 9004
AM=M+1 // 9005
A=A-1 // 9006
M=0 // 9007
@SP // 9008
AM=M+1 // 9009
A=A-1 // 9010
M=0 // 9011
// call Output.create
@17 // 9012
D=A // 9013
@14 // 9014
M=D // 9015
@Output.create // 9016
D=A // 9017
@13 // 9018
M=D // 9019
@Output.initMap.ret.46 // 9020
D=A // 9021
@CALL // 9022
0;JMP // 9023
(Output.initMap.ret.46)
@SP // 9024
AM=M-1 // 9025
D=M // 9026
@5 // 9027
M=D // 9028

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9029
D=A // 9030
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=D // 9034
@33 // 9035
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
@51 // 9071
D=A // 9072
@SP // 9073
AM=M+1 // 9074
A=A-1 // 9075
M=D // 9076
@51 // 9077
D=A // 9078
@SP // 9079
AM=M+1 // 9080
A=A-1 // 9081
M=D // 9082
@51 // 9083
D=A // 9084
@SP // 9085
AM=M+1 // 9086
A=A-1 // 9087
M=D // 9088
@SP // 9089
AM=M+1 // 9090
A=A-1 // 9091
M=0 // 9092
@SP // 9093
AM=M+1 // 9094
A=A-1 // 9095
M=0 // 9096
// call Output.create
@17 // 9097
D=A // 9098
@14 // 9099
M=D // 9100
@Output.create // 9101
D=A // 9102
@13 // 9103
M=D // 9104
@Output.initMap.ret.47 // 9105
D=A // 9106
@CALL // 9107
0;JMP // 9108
(Output.initMap.ret.47)
@SP // 9109
AM=M-1 // 9110
D=M // 9111
@5 // 9112
M=D // 9113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9114
D=A // 9115
@SP // 9116
AM=M+1 // 9117
A=A-1 // 9118
M=D // 9119
@51 // 9120
D=A // 9121
@SP // 9122
AM=M+1 // 9123
A=A-1 // 9124
M=D // 9125
@51 // 9126
D=A // 9127
@SP // 9128
AM=M+1 // 9129
A=A-1 // 9130
M=D // 9131
@55 // 9132
D=A // 9133
@SP // 9134
AM=M+1 // 9135
A=A-1 // 9136
M=D // 9137
@55 // 9138
D=A // 9139
@SP // 9140
AM=M+1 // 9141
A=A-1 // 9142
M=D // 9143
@63 // 9144
D=A // 9145
@SP // 9146
AM=M+1 // 9147
A=A-1 // 9148
M=D // 9149
@59 // 9150
D=A // 9151
@SP // 9152
AM=M+1 // 9153
A=A-1 // 9154
M=D // 9155
@59 // 9156
D=A // 9157
@SP // 9158
AM=M+1 // 9159
A=A-1 // 9160
M=D // 9161
@51 // 9162
D=A // 9163
@SP // 9164
AM=M+1 // 9165
A=A-1 // 9166
M=D // 9167
@51 // 9168
D=A // 9169
@SP // 9170
AM=M+1 // 9171
A=A-1 // 9172
M=D // 9173
@SP // 9174
AM=M+1 // 9175
A=A-1 // 9176
M=0 // 9177
@SP // 9178
AM=M+1 // 9179
A=A-1 // 9180
M=0 // 9181
// call Output.create
@17 // 9182
D=A // 9183
@14 // 9184
M=D // 9185
@Output.create // 9186
D=A // 9187
@13 // 9188
M=D // 9189
@Output.initMap.ret.48 // 9190
D=A // 9191
@CALL // 9192
0;JMP // 9193
(Output.initMap.ret.48)
@SP // 9194
AM=M-1 // 9195
D=M // 9196
@5 // 9197
M=D // 9198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9199
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
@51 // 9211
D=A // 9212
@SP // 9213
AM=M+1 // 9214
A=A-1 // 9215
M=D // 9216
@51 // 9217
D=A // 9218
@SP // 9219
AM=M+1 // 9220
A=A-1 // 9221
M=D // 9222
@51 // 9223
D=A // 9224
@SP // 9225
AM=M+1 // 9226
A=A-1 // 9227
M=D // 9228
@51 // 9229
D=A // 9230
@SP // 9231
AM=M+1 // 9232
A=A-1 // 9233
M=D // 9234
@51 // 9235
D=A // 9236
@SP // 9237
AM=M+1 // 9238
A=A-1 // 9239
M=D // 9240
@51 // 9241
D=A // 9242
@SP // 9243
AM=M+1 // 9244
A=A-1 // 9245
M=D // 9246
@51 // 9247
D=A // 9248
@SP // 9249
AM=M+1 // 9250
A=A-1 // 9251
M=D // 9252
@30 // 9253
D=A // 9254
@SP // 9255
AM=M+1 // 9256
A=A-1 // 9257
M=D // 9258
@SP // 9259
AM=M+1 // 9260
A=A-1 // 9261
M=0 // 9262
@SP // 9263
AM=M+1 // 9264
A=A-1 // 9265
M=0 // 9266
// call Output.create
@17 // 9267
D=A // 9268
@14 // 9269
M=D // 9270
@Output.create // 9271
D=A // 9272
@13 // 9273
M=D // 9274
@Output.initMap.ret.49 // 9275
D=A // 9276
@CALL // 9277
0;JMP // 9278
(Output.initMap.ret.49)
@SP // 9279
AM=M-1 // 9280
D=M // 9281
@5 // 9282
M=D // 9283

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9284
D=A // 9285
@SP // 9286
AM=M+1 // 9287
A=A-1 // 9288
M=D // 9289
@31 // 9290
D=A // 9291
@SP // 9292
AM=M+1 // 9293
A=A-1 // 9294
M=D // 9295
@51 // 9296
D=A // 9297
@SP // 9298
AM=M+1 // 9299
A=A-1 // 9300
M=D // 9301
@51 // 9302
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
@31 // 9314
D=A // 9315
@SP // 9316
AM=M+1 // 9317
A=A-1 // 9318
M=D // 9319
@3 // 9320
D=A // 9321
@SP // 9322
AM=M+1 // 9323
A=A-1 // 9324
M=D // 9325
@3 // 9326
D=A // 9327
@SP // 9328
AM=M+1 // 9329
A=A-1 // 9330
M=D // 9331
@3 // 9332
D=A // 9333
@SP // 9334
AM=M+1 // 9335
A=A-1 // 9336
M=D // 9337
@3 // 9338
D=A // 9339
@SP // 9340
AM=M+1 // 9341
A=A-1 // 9342
M=D // 9343
@SP // 9344
AM=M+1 // 9345
A=A-1 // 9346
M=0 // 9347
@SP // 9348
AM=M+1 // 9349
A=A-1 // 9350
M=0 // 9351
// call Output.create
@17 // 9352
D=A // 9353
@14 // 9354
M=D // 9355
@Output.create // 9356
D=A // 9357
@13 // 9358
M=D // 9359
@Output.initMap.ret.50 // 9360
D=A // 9361
@CALL // 9362
0;JMP // 9363
(Output.initMap.ret.50)
@SP // 9364
AM=M-1 // 9365
D=M // 9366
@5 // 9367
M=D // 9368

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9369
D=A // 9370
@SP // 9371
AM=M+1 // 9372
A=A-1 // 9373
M=D // 9374
@30 // 9375
D=A // 9376
@SP // 9377
AM=M+1 // 9378
A=A-1 // 9379
M=D // 9380
@51 // 9381
D=A // 9382
@SP // 9383
AM=M+1 // 9384
A=A-1 // 9385
M=D // 9386
@51 // 9387
D=A // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=D // 9392
@51 // 9393
D=A // 9394
@SP // 9395
AM=M+1 // 9396
A=A-1 // 9397
M=D // 9398
@51 // 9399
D=A // 9400
@SP // 9401
AM=M+1 // 9402
A=A-1 // 9403
M=D // 9404
@51 // 9405
D=A // 9406
@SP // 9407
AM=M+1 // 9408
A=A-1 // 9409
M=D // 9410
@63 // 9411
D=A // 9412
@SP // 9413
AM=M+1 // 9414
A=A-1 // 9415
M=D // 9416
@59 // 9417
D=A // 9418
@SP // 9419
AM=M+1 // 9420
A=A-1 // 9421
M=D // 9422
@30 // 9423
D=A // 9424
@SP // 9425
AM=M+1 // 9426
A=A-1 // 9427
M=D // 9428
@48 // 9429
D=A // 9430
@SP // 9431
AM=M+1 // 9432
A=A-1 // 9433
M=D // 9434
@SP // 9435
AM=M+1 // 9436
A=A-1 // 9437
M=0 // 9438
// call Output.create
@17 // 9439
D=A // 9440
@14 // 9441
M=D // 9442
@Output.create // 9443
D=A // 9444
@13 // 9445
M=D // 9446
@Output.initMap.ret.51 // 9447
D=A // 9448
@CALL // 9449
0;JMP // 9450
(Output.initMap.ret.51)
@SP // 9451
AM=M-1 // 9452
D=M // 9453
@5 // 9454
M=D // 9455

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9456
D=A // 9457
@SP // 9458
AM=M+1 // 9459
A=A-1 // 9460
M=D // 9461
@31 // 9462
D=A // 9463
@SP // 9464
AM=M+1 // 9465
A=A-1 // 9466
M=D // 9467
@51 // 9468
D=A // 9469
@SP // 9470
AM=M+1 // 9471
A=A-1 // 9472
M=D // 9473
@51 // 9474
D=A // 9475
@SP // 9476
AM=M+1 // 9477
A=A-1 // 9478
M=D // 9479
@51 // 9480
D=A // 9481
@SP // 9482
AM=M+1 // 9483
A=A-1 // 9484
M=D // 9485
@31 // 9486
D=A // 9487
@SP // 9488
AM=M+1 // 9489
A=A-1 // 9490
M=D // 9491
@27 // 9492
D=A // 9493
@SP // 9494
AM=M+1 // 9495
A=A-1 // 9496
M=D // 9497
@51 // 9498
D=A // 9499
@SP // 9500
AM=M+1 // 9501
A=A-1 // 9502
M=D // 9503
@51 // 9504
D=A // 9505
@SP // 9506
AM=M+1 // 9507
A=A-1 // 9508
M=D // 9509
@51 // 9510
D=A // 9511
@SP // 9512
AM=M+1 // 9513
A=A-1 // 9514
M=D // 9515
@SP // 9516
AM=M+1 // 9517
A=A-1 // 9518
M=0 // 9519
@SP // 9520
AM=M+1 // 9521
A=A-1 // 9522
M=0 // 9523
// call Output.create
@17 // 9524
D=A // 9525
@14 // 9526
M=D // 9527
@Output.create // 9528
D=A // 9529
@13 // 9530
M=D // 9531
@Output.initMap.ret.52 // 9532
D=A // 9533
@CALL // 9534
0;JMP // 9535
(Output.initMap.ret.52)
@SP // 9536
AM=M-1 // 9537
D=M // 9538
@5 // 9539
M=D // 9540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9541
D=A // 9542
@SP // 9543
AM=M+1 // 9544
A=A-1 // 9545
M=D // 9546
@30 // 9547
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
@51 // 9559
D=A // 9560
@SP // 9561
AM=M+1 // 9562
A=A-1 // 9563
M=D // 9564
@6 // 9565
D=A // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=D // 9570
@28 // 9571
D=A // 9572
@SP // 9573
AM=M+1 // 9574
A=A-1 // 9575
M=D // 9576
@48 // 9577
D=A // 9578
@SP // 9579
AM=M+1 // 9580
A=A-1 // 9581
M=D // 9582
@51 // 9583
D=A // 9584
@SP // 9585
AM=M+1 // 9586
A=A-1 // 9587
M=D // 9588
@51 // 9589
D=A // 9590
@SP // 9591
AM=M+1 // 9592
A=A-1 // 9593
M=D // 9594
@30 // 9595
D=A // 9596
@SP // 9597
AM=M+1 // 9598
A=A-1 // 9599
M=D // 9600
@SP // 9601
AM=M+1 // 9602
A=A-1 // 9603
M=0 // 9604
@SP // 9605
AM=M+1 // 9606
A=A-1 // 9607
M=0 // 9608
// call Output.create
@17 // 9609
D=A // 9610
@14 // 9611
M=D // 9612
@Output.create // 9613
D=A // 9614
@13 // 9615
M=D // 9616
@Output.initMap.ret.53 // 9617
D=A // 9618
@CALL // 9619
0;JMP // 9620
(Output.initMap.ret.53)
@SP // 9621
AM=M-1 // 9622
D=M // 9623
@5 // 9624
M=D // 9625

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9626
D=A // 9627
@SP // 9628
AM=M+1 // 9629
A=A-1 // 9630
M=D // 9631
@63 // 9632
D=A // 9633
@SP // 9634
AM=M+1 // 9635
A=A-1 // 9636
M=D // 9637
@63 // 9638
D=A // 9639
@SP // 9640
AM=M+1 // 9641
A=A-1 // 9642
M=D // 9643
@45 // 9644
D=A // 9645
@SP // 9646
AM=M+1 // 9647
A=A-1 // 9648
M=D // 9649
@12 // 9650
D=A // 9651
@SP // 9652
AM=M+1 // 9653
A=A-1 // 9654
M=D // 9655
@12 // 9656
D=A // 9657
@SP // 9658
AM=M+1 // 9659
A=A-1 // 9660
M=D // 9661
@12 // 9662
D=A // 9663
@SP // 9664
AM=M+1 // 9665
A=A-1 // 9666
M=D // 9667
@12 // 9668
D=A // 9669
@SP // 9670
AM=M+1 // 9671
A=A-1 // 9672
M=D // 9673
@12 // 9674
D=A // 9675
@SP // 9676
AM=M+1 // 9677
A=A-1 // 9678
M=D // 9679
@30 // 9680
D=A // 9681
@SP // 9682
AM=M+1 // 9683
A=A-1 // 9684
M=D // 9685
@SP // 9686
AM=M+1 // 9687
A=A-1 // 9688
M=0 // 9689
@SP // 9690
AM=M+1 // 9691
A=A-1 // 9692
M=0 // 9693
// call Output.create
@17 // 9694
D=A // 9695
@14 // 9696
M=D // 9697
@Output.create // 9698
D=A // 9699
@13 // 9700
M=D // 9701
@Output.initMap.ret.54 // 9702
D=A // 9703
@CALL // 9704
0;JMP // 9705
(Output.initMap.ret.54)
@SP // 9706
AM=M-1 // 9707
D=M // 9708
@5 // 9709
M=D // 9710

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9711
D=A // 9712
@SP // 9713
AM=M+1 // 9714
A=A-1 // 9715
M=D // 9716
@51 // 9717
D=A // 9718
@SP // 9719
AM=M+1 // 9720
A=A-1 // 9721
M=D // 9722
@51 // 9723
D=A // 9724
@SP // 9725
AM=M+1 // 9726
A=A-1 // 9727
M=D // 9728
@51 // 9729
D=A // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=D // 9734
@51 // 9735
D=A // 9736
@SP // 9737
AM=M+1 // 9738
A=A-1 // 9739
M=D // 9740
@51 // 9741
D=A // 9742
@SP // 9743
AM=M+1 // 9744
A=A-1 // 9745
M=D // 9746
@51 // 9747
D=A // 9748
@SP // 9749
AM=M+1 // 9750
A=A-1 // 9751
M=D // 9752
@51 // 9753
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
@30 // 9765
D=A // 9766
@SP // 9767
AM=M+1 // 9768
A=A-1 // 9769
M=D // 9770
@SP // 9771
AM=M+1 // 9772
A=A-1 // 9773
M=0 // 9774
@SP // 9775
AM=M+1 // 9776
A=A-1 // 9777
M=0 // 9778
// call Output.create
@17 // 9779
D=A // 9780
@14 // 9781
M=D // 9782
@Output.create // 9783
D=A // 9784
@13 // 9785
M=D // 9786
@Output.initMap.ret.55 // 9787
D=A // 9788
@CALL // 9789
0;JMP // 9790
(Output.initMap.ret.55)
@SP // 9791
AM=M-1 // 9792
D=M // 9793
@5 // 9794
M=D // 9795

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9796
D=A // 9797
@SP // 9798
AM=M+1 // 9799
A=A-1 // 9800
M=D // 9801
@51 // 9802
D=A // 9803
@SP // 9804
AM=M+1 // 9805
A=A-1 // 9806
M=D // 9807
@51 // 9808
D=A // 9809
@SP // 9810
AM=M+1 // 9811
A=A-1 // 9812
M=D // 9813
@51 // 9814
D=A // 9815
@SP // 9816
AM=M+1 // 9817
A=A-1 // 9818
M=D // 9819
@51 // 9820
D=A // 9821
@SP // 9822
AM=M+1 // 9823
A=A-1 // 9824
M=D // 9825
@51 // 9826
D=A // 9827
@SP // 9828
AM=M+1 // 9829
A=A-1 // 9830
M=D // 9831
@30 // 9832
D=A // 9833
@SP // 9834
AM=M+1 // 9835
A=A-1 // 9836
M=D // 9837
@30 // 9838
D=A // 9839
@SP // 9840
AM=M+1 // 9841
A=A-1 // 9842
M=D // 9843
@12 // 9844
D=A // 9845
@SP // 9846
AM=M+1 // 9847
A=A-1 // 9848
M=D // 9849
@12 // 9850
D=A // 9851
@SP // 9852
AM=M+1 // 9853
A=A-1 // 9854
M=D // 9855
@SP // 9856
AM=M+1 // 9857
A=A-1 // 9858
M=0 // 9859
@SP // 9860
AM=M+1 // 9861
A=A-1 // 9862
M=0 // 9863
// call Output.create
@17 // 9864
D=A // 9865
@14 // 9866
M=D // 9867
@Output.create // 9868
D=A // 9869
@13 // 9870
M=D // 9871
@Output.initMap.ret.56 // 9872
D=A // 9873
@CALL // 9874
0;JMP // 9875
(Output.initMap.ret.56)
@SP // 9876
AM=M-1 // 9877
D=M // 9878
@5 // 9879
M=D // 9880

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 9881
D=A // 9882
@SP // 9883
AM=M+1 // 9884
A=A-1 // 9885
M=D // 9886
@51 // 9887
D=A // 9888
@SP // 9889
AM=M+1 // 9890
A=A-1 // 9891
M=D // 9892
@51 // 9893
D=A // 9894
@SP // 9895
AM=M+1 // 9896
A=A-1 // 9897
M=D // 9898
@51 // 9899
D=A // 9900
@SP // 9901
AM=M+1 // 9902
A=A-1 // 9903
M=D // 9904
@51 // 9905
D=A // 9906
@SP // 9907
AM=M+1 // 9908
A=A-1 // 9909
M=D // 9910
@51 // 9911
D=A // 9912
@SP // 9913
AM=M+1 // 9914
A=A-1 // 9915
M=D // 9916
@63 // 9917
D=A // 9918
@SP // 9919
AM=M+1 // 9920
A=A-1 // 9921
M=D // 9922
@63 // 9923
D=A // 9924
@SP // 9925
AM=M+1 // 9926
A=A-1 // 9927
M=D // 9928
@63 // 9929
D=A // 9930
@SP // 9931
AM=M+1 // 9932
A=A-1 // 9933
M=D // 9934
@18 // 9935
D=A // 9936
@SP // 9937
AM=M+1 // 9938
A=A-1 // 9939
M=D // 9940
@SP // 9941
AM=M+1 // 9942
A=A-1 // 9943
M=0 // 9944
@SP // 9945
AM=M+1 // 9946
A=A-1 // 9947
M=0 // 9948
// call Output.create
@17 // 9949
D=A // 9950
@14 // 9951
M=D // 9952
@Output.create // 9953
D=A // 9954
@13 // 9955
M=D // 9956
@Output.initMap.ret.57 // 9957
D=A // 9958
@CALL // 9959
0;JMP // 9960
(Output.initMap.ret.57)
@SP // 9961
AM=M-1 // 9962
D=M // 9963
@5 // 9964
M=D // 9965

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 9966
D=A // 9967
@SP // 9968
AM=M+1 // 9969
A=A-1 // 9970
M=D // 9971
@51 // 9972
D=A // 9973
@SP // 9974
AM=M+1 // 9975
A=A-1 // 9976
M=D // 9977
@51 // 9978
D=A // 9979
@SP // 9980
AM=M+1 // 9981
A=A-1 // 9982
M=D // 9983
@30 // 9984
D=A // 9985
@SP // 9986
AM=M+1 // 9987
A=A-1 // 9988
M=D // 9989
@30 // 9990
D=A // 9991
@SP // 9992
AM=M+1 // 9993
A=A-1 // 9994
M=D // 9995
@12 // 9996
D=A // 9997
@SP // 9998
AM=M+1 // 9999
A=A-1 // 10000
M=D // 10001
@30 // 10002
D=A // 10003
@SP // 10004
AM=M+1 // 10005
A=A-1 // 10006
M=D // 10007
@30 // 10008
D=A // 10009
@SP // 10010
AM=M+1 // 10011
A=A-1 // 10012
M=D // 10013
@51 // 10014
D=A // 10015
@SP // 10016
AM=M+1 // 10017
A=A-1 // 10018
M=D // 10019
@51 // 10020
D=A // 10021
@SP // 10022
AM=M+1 // 10023
A=A-1 // 10024
M=D // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=0 // 10029
@SP // 10030
AM=M+1 // 10031
A=A-1 // 10032
M=0 // 10033
// call Output.create
@17 // 10034
D=A // 10035
@14 // 10036
M=D // 10037
@Output.create // 10038
D=A // 10039
@13 // 10040
M=D // 10041
@Output.initMap.ret.58 // 10042
D=A // 10043
@CALL // 10044
0;JMP // 10045
(Output.initMap.ret.58)
@SP // 10046
AM=M-1 // 10047
D=M // 10048
@5 // 10049
M=D // 10050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10051
D=A // 10052
@SP // 10053
AM=M+1 // 10054
A=A-1 // 10055
M=D // 10056
@51 // 10057
D=A // 10058
@SP // 10059
AM=M+1 // 10060
A=A-1 // 10061
M=D // 10062
@51 // 10063
D=A // 10064
@SP // 10065
AM=M+1 // 10066
A=A-1 // 10067
M=D // 10068
@51 // 10069
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
@30 // 10081
D=A // 10082
@SP // 10083
AM=M+1 // 10084
A=A-1 // 10085
M=D // 10086
@12 // 10087
D=A // 10088
@SP // 10089
AM=M+1 // 10090
A=A-1 // 10091
M=D // 10092
@12 // 10093
D=A // 10094
@SP // 10095
AM=M+1 // 10096
A=A-1 // 10097
M=D // 10098
@12 // 10099
D=A // 10100
@SP // 10101
AM=M+1 // 10102
A=A-1 // 10103
M=D // 10104
@30 // 10105
D=A // 10106
@SP // 10107
AM=M+1 // 10108
A=A-1 // 10109
M=D // 10110
@SP // 10111
AM=M+1 // 10112
A=A-1 // 10113
M=0 // 10114
@SP // 10115
AM=M+1 // 10116
A=A-1 // 10117
M=0 // 10118
// call Output.create
@17 // 10119
D=A // 10120
@14 // 10121
M=D // 10122
@Output.create // 10123
D=A // 10124
@13 // 10125
M=D // 10126
@Output.initMap.ret.59 // 10127
D=A // 10128
@CALL // 10129
0;JMP // 10130
(Output.initMap.ret.59)
@SP // 10131
AM=M-1 // 10132
D=M // 10133
@5 // 10134
M=D // 10135

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10136
D=A // 10137
@SP // 10138
AM=M+1 // 10139
A=A-1 // 10140
M=D // 10141
@63 // 10142
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
@49 // 10154
D=A // 10155
@SP // 10156
AM=M+1 // 10157
A=A-1 // 10158
M=D // 10159
@24 // 10160
D=A // 10161
@SP // 10162
AM=M+1 // 10163
A=A-1 // 10164
M=D // 10165
@12 // 10166
D=A // 10167
@SP // 10168
AM=M+1 // 10169
A=A-1 // 10170
M=D // 10171
@6 // 10172
D=A // 10173
@SP // 10174
AM=M+1 // 10175
A=A-1 // 10176
M=D // 10177
@35 // 10178
D=A // 10179
@SP // 10180
AM=M+1 // 10181
A=A-1 // 10182
M=D // 10183
@51 // 10184
D=A // 10185
@SP // 10186
AM=M+1 // 10187
A=A-1 // 10188
M=D // 10189
@63 // 10190
D=A // 10191
@SP // 10192
AM=M+1 // 10193
A=A-1 // 10194
M=D // 10195
@SP // 10196
AM=M+1 // 10197
A=A-1 // 10198
M=0 // 10199
@SP // 10200
AM=M+1 // 10201
A=A-1 // 10202
M=0 // 10203
// call Output.create
@17 // 10204
D=A // 10205
@14 // 10206
M=D // 10207
@Output.create // 10208
D=A // 10209
@13 // 10210
M=D // 10211
@Output.initMap.ret.60 // 10212
D=A // 10213
@CALL // 10214
0;JMP // 10215
(Output.initMap.ret.60)
@SP // 10216
AM=M-1 // 10217
D=M // 10218
@5 // 10219
M=D // 10220

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10221
D=A // 10222
@SP // 10223
AM=M+1 // 10224
A=A-1 // 10225
M=D // 10226
@30 // 10227
D=A // 10228
@SP // 10229
AM=M+1 // 10230
A=A-1 // 10231
M=D // 10232
@6 // 10233
D=A // 10234
@SP // 10235
AM=M+1 // 10236
A=A-1 // 10237
M=D // 10238
@6 // 10239
D=A // 10240
@SP // 10241
AM=M+1 // 10242
A=A-1 // 10243
M=D // 10244
@6 // 10245
D=A // 10246
@SP // 10247
AM=M+1 // 10248
A=A-1 // 10249
M=D // 10250
@6 // 10251
D=A // 10252
@SP // 10253
AM=M+1 // 10254
A=A-1 // 10255
M=D // 10256
@6 // 10257
D=A // 10258
@SP // 10259
AM=M+1 // 10260
A=A-1 // 10261
M=D // 10262
@6 // 10263
D=A // 10264
@SP // 10265
AM=M+1 // 10266
A=A-1 // 10267
M=D // 10268
@6 // 10269
D=A // 10270
@SP // 10271
AM=M+1 // 10272
A=A-1 // 10273
M=D // 10274
@30 // 10275
D=A // 10276
@SP // 10277
AM=M+1 // 10278
A=A-1 // 10279
M=D // 10280
@SP // 10281
AM=M+1 // 10282
A=A-1 // 10283
M=0 // 10284
@SP // 10285
AM=M+1 // 10286
A=A-1 // 10287
M=0 // 10288
// call Output.create
@17 // 10289
D=A // 10290
@14 // 10291
M=D // 10292
@Output.create // 10293
D=A // 10294
@13 // 10295
M=D // 10296
@Output.initMap.ret.61 // 10297
D=A // 10298
@CALL // 10299
0;JMP // 10300
(Output.initMap.ret.61)
@SP // 10301
AM=M-1 // 10302
D=M // 10303
@5 // 10304
M=D // 10305

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@92 // 10306
D=A // 10307
@SP // 10308
AM=M+1 // 10309
A=A-1 // 10310
M=D // 10311
@SP // 10312
AM=M+1 // 10313
A=A-1 // 10314
M=0 // 10315
@SP // 10316
AM=M+1 // 10317
A=A-1 // 10318
M=0 // 10319
@SP // 10320
AM=M+1 // 10321
A=A-1 // 10322
M=1 // 10323
@3 // 10324
D=A // 10325
@SP // 10326
AM=M+1 // 10327
A=A-1 // 10328
M=D // 10329
@6 // 10330
D=A // 10331
@SP // 10332
AM=M+1 // 10333
A=A-1 // 10334
M=D // 10335
@12 // 10336
D=A // 10337
@SP // 10338
AM=M+1 // 10339
A=A-1 // 10340
M=D // 10341
@24 // 10342
D=A // 10343
@SP // 10344
AM=M+1 // 10345
A=A-1 // 10346
M=D // 10347
@48 // 10348
D=A // 10349
@SP // 10350
AM=M+1 // 10351
A=A-1 // 10352
M=D // 10353
@32 // 10354
D=A // 10355
@SP // 10356
AM=M+1 // 10357
A=A-1 // 10358
M=D // 10359
@SP // 10360
AM=M+1 // 10361
A=A-1 // 10362
M=0 // 10363
@SP // 10364
AM=M+1 // 10365
A=A-1 // 10366
M=0 // 10367
// call Output.create
@17 // 10368
D=A // 10369
@14 // 10370
M=D // 10371
@Output.create // 10372
D=A // 10373
@13 // 10374
M=D // 10375
@Output.initMap.ret.62 // 10376
D=A // 10377
@CALL // 10378
0;JMP // 10379
(Output.initMap.ret.62)
@SP // 10380
AM=M-1 // 10381
D=M // 10382
@5 // 10383
M=D // 10384

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10385
D=A // 10386
@SP // 10387
AM=M+1 // 10388
A=A-1 // 10389
M=D // 10390
@30 // 10391
D=A // 10392
@SP // 10393
AM=M+1 // 10394
A=A-1 // 10395
M=D // 10396
@24 // 10397
D=A // 10398
@SP // 10399
AM=M+1 // 10400
A=A-1 // 10401
M=D // 10402
@24 // 10403
D=A // 10404
@SP // 10405
AM=M+1 // 10406
A=A-1 // 10407
M=D // 10408
@24 // 10409
D=A // 10410
@SP // 10411
AM=M+1 // 10412
A=A-1 // 10413
M=D // 10414
@24 // 10415
D=A // 10416
@SP // 10417
AM=M+1 // 10418
A=A-1 // 10419
M=D // 10420
@24 // 10421
D=A // 10422
@SP // 10423
AM=M+1 // 10424
A=A-1 // 10425
M=D // 10426
@24 // 10427
D=A // 10428
@SP // 10429
AM=M+1 // 10430
A=A-1 // 10431
M=D // 10432
@24 // 10433
D=A // 10434
@SP // 10435
AM=M+1 // 10436
A=A-1 // 10437
M=D // 10438
@30 // 10439
D=A // 10440
@SP // 10441
AM=M+1 // 10442
A=A-1 // 10443
M=D // 10444
@SP // 10445
AM=M+1 // 10446
A=A-1 // 10447
M=0 // 10448
@SP // 10449
AM=M+1 // 10450
A=A-1 // 10451
M=0 // 10452
// call Output.create
@17 // 10453
D=A // 10454
@14 // 10455
M=D // 10456
@Output.create // 10457
D=A // 10458
@13 // 10459
M=D // 10460
@Output.initMap.ret.63 // 10461
D=A // 10462
@CALL // 10463
0;JMP // 10464
(Output.initMap.ret.63)
@SP // 10465
AM=M-1 // 10466
D=M // 10467
@5 // 10468
M=D // 10469

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10470
D=A // 10471
@SP // 10472
AM=M+1 // 10473
A=A-1 // 10474
M=D // 10475
@8 // 10476
D=A // 10477
@SP // 10478
AM=M+1 // 10479
A=A-1 // 10480
M=D // 10481
@28 // 10482
D=A // 10483
@SP // 10484
AM=M+1 // 10485
A=A-1 // 10486
M=D // 10487
@54 // 10488
D=A // 10489
@SP // 10490
AM=M+1 // 10491
A=A-1 // 10492
M=D // 10493
@SP // 10494
AM=M+1 // 10495
A=A-1 // 10496
M=0 // 10497
@SP // 10498
AM=M+1 // 10499
A=A-1 // 10500
M=0 // 10501
@SP // 10502
AM=M+1 // 10503
A=A-1 // 10504
M=0 // 10505
@SP // 10506
AM=M+1 // 10507
A=A-1 // 10508
M=0 // 10509
@SP // 10510
AM=M+1 // 10511
A=A-1 // 10512
M=0 // 10513
@SP // 10514
AM=M+1 // 10515
A=A-1 // 10516
M=0 // 10517
@SP // 10518
AM=M+1 // 10519
A=A-1 // 10520
M=0 // 10521
@SP // 10522
AM=M+1 // 10523
A=A-1 // 10524
M=0 // 10525
// call Output.create
@17 // 10526
D=A // 10527
@14 // 10528
M=D // 10529
@Output.create // 10530
D=A // 10531
@13 // 10532
M=D // 10533
@Output.initMap.ret.64 // 10534
D=A // 10535
@CALL // 10536
0;JMP // 10537
(Output.initMap.ret.64)
@SP // 10538
AM=M-1 // 10539
D=M // 10540
@5 // 10541
M=D // 10542

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@95 // 10543
D=A // 10544
@SP // 10545
AM=M+1 // 10546
A=A-1 // 10547
M=D // 10548
@SP // 10549
AM=M+1 // 10550
A=A-1 // 10551
M=0 // 10552
@SP // 10553
AM=M+1 // 10554
A=A-1 // 10555
M=0 // 10556
@SP // 10557
AM=M+1 // 10558
A=A-1 // 10559
M=0 // 10560
@SP // 10561
AM=M+1 // 10562
A=A-1 // 10563
M=0 // 10564
@SP // 10565
AM=M+1 // 10566
A=A-1 // 10567
M=0 // 10568
@SP // 10569
AM=M+1 // 10570
A=A-1 // 10571
M=0 // 10572
@SP // 10573
AM=M+1 // 10574
A=A-1 // 10575
M=0 // 10576
@SP // 10577
AM=M+1 // 10578
A=A-1 // 10579
M=0 // 10580
@SP // 10581
AM=M+1 // 10582
A=A-1 // 10583
M=0 // 10584
@63 // 10585
D=A // 10586
@SP // 10587
AM=M+1 // 10588
A=A-1 // 10589
M=D // 10590
@SP // 10591
AM=M+1 // 10592
A=A-1 // 10593
M=0 // 10594
// call Output.create
@17 // 10595
D=A // 10596
@14 // 10597
M=D // 10598
@Output.create // 10599
D=A // 10600
@13 // 10601
M=D // 10602
@Output.initMap.ret.65 // 10603
D=A // 10604
@CALL // 10605
0;JMP // 10606
(Output.initMap.ret.65)
@SP // 10607
AM=M-1 // 10608
D=M // 10609
@5 // 10610
M=D // 10611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10612
D=A // 10613
@SP // 10614
AM=M+1 // 10615
A=A-1 // 10616
M=D // 10617
@6 // 10618
D=A // 10619
@SP // 10620
AM=M+1 // 10621
A=A-1 // 10622
M=D // 10623
@12 // 10624
D=A // 10625
@SP // 10626
AM=M+1 // 10627
A=A-1 // 10628
M=D // 10629
@24 // 10630
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
@SP // 10648
AM=M+1 // 10649
A=A-1 // 10650
M=0 // 10651
@SP // 10652
AM=M+1 // 10653
A=A-1 // 10654
M=0 // 10655
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
// call Output.create
@17 // 10668
D=A // 10669
@14 // 10670
M=D // 10671
@Output.create // 10672
D=A // 10673
@13 // 10674
M=D // 10675
@Output.initMap.ret.66 // 10676
D=A // 10677
@CALL // 10678
0;JMP // 10679
(Output.initMap.ret.66)
@SP // 10680
AM=M-1 // 10681
D=M // 10682
@5 // 10683
M=D // 10684

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@97 // 10685
D=A // 10686
@SP // 10687
AM=M+1 // 10688
A=A-1 // 10689
M=D // 10690
@SP // 10691
AM=M+1 // 10692
A=A-1 // 10693
M=0 // 10694
@SP // 10695
AM=M+1 // 10696
A=A-1 // 10697
M=0 // 10698
@SP // 10699
AM=M+1 // 10700
A=A-1 // 10701
M=0 // 10702
@14 // 10703
D=A // 10704
@SP // 10705
AM=M+1 // 10706
A=A-1 // 10707
M=D // 10708
@24 // 10709
D=A // 10710
@SP // 10711
AM=M+1 // 10712
A=A-1 // 10713
M=D // 10714
@30 // 10715
D=A // 10716
@SP // 10717
AM=M+1 // 10718
A=A-1 // 10719
M=D // 10720
@27 // 10721
D=A // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=D // 10726
@27 // 10727
D=A // 10728
@SP // 10729
AM=M+1 // 10730
A=A-1 // 10731
M=D // 10732
@54 // 10733
D=A // 10734
@SP // 10735
AM=M+1 // 10736
A=A-1 // 10737
M=D // 10738
@SP // 10739
AM=M+1 // 10740
A=A-1 // 10741
M=0 // 10742
@SP // 10743
AM=M+1 // 10744
A=A-1 // 10745
M=0 // 10746
// call Output.create
@17 // 10747
D=A // 10748
@14 // 10749
M=D // 10750
@Output.create // 10751
D=A // 10752
@13 // 10753
M=D // 10754
@Output.initMap.ret.67 // 10755
D=A // 10756
@CALL // 10757
0;JMP // 10758
(Output.initMap.ret.67)
@SP // 10759
AM=M-1 // 10760
D=M // 10761
@5 // 10762
M=D // 10763

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10764
D=A // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=D // 10769
@3 // 10770
D=A // 10771
@SP // 10772
AM=M+1 // 10773
A=A-1 // 10774
M=D // 10775
@3 // 10776
D=A // 10777
@SP // 10778
AM=M+1 // 10779
A=A-1 // 10780
M=D // 10781
@3 // 10782
D=A // 10783
@SP // 10784
AM=M+1 // 10785
A=A-1 // 10786
M=D // 10787
@15 // 10788
D=A // 10789
@SP // 10790
AM=M+1 // 10791
A=A-1 // 10792
M=D // 10793
@27 // 10794
D=A // 10795
@SP // 10796
AM=M+1 // 10797
A=A-1 // 10798
M=D // 10799
@51 // 10800
D=A // 10801
@SP // 10802
AM=M+1 // 10803
A=A-1 // 10804
M=D // 10805
@51 // 10806
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
@30 // 10818
D=A // 10819
@SP // 10820
AM=M+1 // 10821
A=A-1 // 10822
M=D // 10823
@SP // 10824
AM=M+1 // 10825
A=A-1 // 10826
M=0 // 10827
@SP // 10828
AM=M+1 // 10829
A=A-1 // 10830
M=0 // 10831
// call Output.create
@17 // 10832
D=A // 10833
@14 // 10834
M=D // 10835
@Output.create // 10836
D=A // 10837
@13 // 10838
M=D // 10839
@Output.initMap.ret.68 // 10840
D=A // 10841
@CALL // 10842
0;JMP // 10843
(Output.initMap.ret.68)
@SP // 10844
AM=M-1 // 10845
D=M // 10846
@5 // 10847
M=D // 10848

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@99 // 10849
D=A // 10850
@SP // 10851
AM=M+1 // 10852
A=A-1 // 10853
M=D // 10854
@SP // 10855
AM=M+1 // 10856
A=A-1 // 10857
M=0 // 10858
@SP // 10859
AM=M+1 // 10860
A=A-1 // 10861
M=0 // 10862
@SP // 10863
AM=M+1 // 10864
A=A-1 // 10865
M=0 // 10866
@30 // 10867
D=A // 10868
@SP // 10869
AM=M+1 // 10870
A=A-1 // 10871
M=D // 10872
@51 // 10873
D=A // 10874
@SP // 10875
AM=M+1 // 10876
A=A-1 // 10877
M=D // 10878
@3 // 10879
D=A // 10880
@SP // 10881
AM=M+1 // 10882
A=A-1 // 10883
M=D // 10884
@3 // 10885
D=A // 10886
@SP // 10887
AM=M+1 // 10888
A=A-1 // 10889
M=D // 10890
@51 // 10891
D=A // 10892
@SP // 10893
AM=M+1 // 10894
A=A-1 // 10895
M=D // 10896
@30 // 10897
D=A // 10898
@SP // 10899
AM=M+1 // 10900
A=A-1 // 10901
M=D // 10902
@SP // 10903
AM=M+1 // 10904
A=A-1 // 10905
M=0 // 10906
@SP // 10907
AM=M+1 // 10908
A=A-1 // 10909
M=0 // 10910
// call Output.create
@17 // 10911
D=A // 10912
@14 // 10913
M=D // 10914
@Output.create // 10915
D=A // 10916
@13 // 10917
M=D // 10918
@Output.initMap.ret.69 // 10919
D=A // 10920
@CALL // 10921
0;JMP // 10922
(Output.initMap.ret.69)
@SP // 10923
AM=M-1 // 10924
D=M // 10925
@5 // 10926
M=D // 10927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 10928
D=A // 10929
@SP // 10930
AM=M+1 // 10931
A=A-1 // 10932
M=D // 10933
@48 // 10934
D=A // 10935
@SP // 10936
AM=M+1 // 10937
A=A-1 // 10938
M=D // 10939
@48 // 10940
D=A // 10941
@SP // 10942
AM=M+1 // 10943
A=A-1 // 10944
M=D // 10945
@48 // 10946
D=A // 10947
@SP // 10948
AM=M+1 // 10949
A=A-1 // 10950
M=D // 10951
@60 // 10952
D=A // 10953
@SP // 10954
AM=M+1 // 10955
A=A-1 // 10956
M=D // 10957
@54 // 10958
D=A // 10959
@SP // 10960
AM=M+1 // 10961
A=A-1 // 10962
M=D // 10963
@51 // 10964
D=A // 10965
@SP // 10966
AM=M+1 // 10967
A=A-1 // 10968
M=D // 10969
@51 // 10970
D=A // 10971
@SP // 10972
AM=M+1 // 10973
A=A-1 // 10974
M=D // 10975
@51 // 10976
D=A // 10977
@SP // 10978
AM=M+1 // 10979
A=A-1 // 10980
M=D // 10981
@30 // 10982
D=A // 10983
@SP // 10984
AM=M+1 // 10985
A=A-1 // 10986
M=D // 10987
@SP // 10988
AM=M+1 // 10989
A=A-1 // 10990
M=0 // 10991
@SP // 10992
AM=M+1 // 10993
A=A-1 // 10994
M=0 // 10995
// call Output.create
@17 // 10996
D=A // 10997
@14 // 10998
M=D // 10999
@Output.create // 11000
D=A // 11001
@13 // 11002
M=D // 11003
@Output.initMap.ret.70 // 11004
D=A // 11005
@CALL // 11006
0;JMP // 11007
(Output.initMap.ret.70)
@SP // 11008
AM=M-1 // 11009
D=M // 11010
@5 // 11011
M=D // 11012

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@101 // 11013
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
@SP // 11027
AM=M+1 // 11028
A=A-1 // 11029
M=0 // 11030
@30 // 11031
D=A // 11032
@SP // 11033
AM=M+1 // 11034
A=A-1 // 11035
M=D // 11036
@51 // 11037
D=A // 11038
@SP // 11039
AM=M+1 // 11040
A=A-1 // 11041
M=D // 11042
@63 // 11043
D=A // 11044
@SP // 11045
AM=M+1 // 11046
A=A-1 // 11047
M=D // 11048
@3 // 11049
D=A // 11050
@SP // 11051
AM=M+1 // 11052
A=A-1 // 11053
M=D // 11054
@51 // 11055
D=A // 11056
@SP // 11057
AM=M+1 // 11058
A=A-1 // 11059
M=D // 11060
@30 // 11061
D=A // 11062
@SP // 11063
AM=M+1 // 11064
A=A-1 // 11065
M=D // 11066
@SP // 11067
AM=M+1 // 11068
A=A-1 // 11069
M=0 // 11070
@SP // 11071
AM=M+1 // 11072
A=A-1 // 11073
M=0 // 11074
// call Output.create
@17 // 11075
D=A // 11076
@14 // 11077
M=D // 11078
@Output.create // 11079
D=A // 11080
@13 // 11081
M=D // 11082
@Output.initMap.ret.71 // 11083
D=A // 11084
@CALL // 11085
0;JMP // 11086
(Output.initMap.ret.71)
@SP // 11087
AM=M-1 // 11088
D=M // 11089
@5 // 11090
M=D // 11091

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11092
D=A // 11093
@SP // 11094
AM=M+1 // 11095
A=A-1 // 11096
M=D // 11097
@28 // 11098
D=A // 11099
@SP // 11100
AM=M+1 // 11101
A=A-1 // 11102
M=D // 11103
@54 // 11104
D=A // 11105
@SP // 11106
AM=M+1 // 11107
A=A-1 // 11108
M=D // 11109
@38 // 11110
D=A // 11111
@SP // 11112
AM=M+1 // 11113
A=A-1 // 11114
M=D // 11115
@6 // 11116
D=A // 11117
@SP // 11118
AM=M+1 // 11119
A=A-1 // 11120
M=D // 11121
@15 // 11122
D=A // 11123
@SP // 11124
AM=M+1 // 11125
A=A-1 // 11126
M=D // 11127
@6 // 11128
D=A // 11129
@SP // 11130
AM=M+1 // 11131
A=A-1 // 11132
M=D // 11133
@6 // 11134
D=A // 11135
@SP // 11136
AM=M+1 // 11137
A=A-1 // 11138
M=D // 11139
@6 // 11140
D=A // 11141
@SP // 11142
AM=M+1 // 11143
A=A-1 // 11144
M=D // 11145
@15 // 11146
D=A // 11147
@SP // 11148
AM=M+1 // 11149
A=A-1 // 11150
M=D // 11151
@SP // 11152
AM=M+1 // 11153
A=A-1 // 11154
M=0 // 11155
@SP // 11156
AM=M+1 // 11157
A=A-1 // 11158
M=0 // 11159
// call Output.create
@17 // 11160
D=A // 11161
@14 // 11162
M=D // 11163
@Output.create // 11164
D=A // 11165
@13 // 11166
M=D // 11167
@Output.initMap.ret.72 // 11168
D=A // 11169
@CALL // 11170
0;JMP // 11171
(Output.initMap.ret.72)
@SP // 11172
AM=M-1 // 11173
D=M // 11174
@5 // 11175
M=D // 11176

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@103 // 11177
D=A // 11178
@SP // 11179
AM=M+1 // 11180
A=A-1 // 11181
M=D // 11182
@SP // 11183
AM=M+1 // 11184
A=A-1 // 11185
M=0 // 11186
@SP // 11187
AM=M+1 // 11188
A=A-1 // 11189
M=0 // 11190
@30 // 11191
D=A // 11192
@SP // 11193
AM=M+1 // 11194
A=A-1 // 11195
M=D // 11196
@51 // 11197
D=A // 11198
@SP // 11199
AM=M+1 // 11200
A=A-1 // 11201
M=D // 11202
@51 // 11203
D=A // 11204
@SP // 11205
AM=M+1 // 11206
A=A-1 // 11207
M=D // 11208
@51 // 11209
D=A // 11210
@SP // 11211
AM=M+1 // 11212
A=A-1 // 11213
M=D // 11214
@62 // 11215
D=A // 11216
@SP // 11217
AM=M+1 // 11218
A=A-1 // 11219
M=D // 11220
@48 // 11221
D=A // 11222
@SP // 11223
AM=M+1 // 11224
A=A-1 // 11225
M=D // 11226
@51 // 11227
D=A // 11228
@SP // 11229
AM=M+1 // 11230
A=A-1 // 11231
M=D // 11232
@30 // 11233
D=A // 11234
@SP // 11235
AM=M+1 // 11236
A=A-1 // 11237
M=D // 11238
@SP // 11239
AM=M+1 // 11240
A=A-1 // 11241
M=0 // 11242
// call Output.create
@17 // 11243
D=A // 11244
@14 // 11245
M=D // 11246
@Output.create // 11247
D=A // 11248
@13 // 11249
M=D // 11250
@Output.initMap.ret.73 // 11251
D=A // 11252
@CALL // 11253
0;JMP // 11254
(Output.initMap.ret.73)
@SP // 11255
AM=M-1 // 11256
D=M // 11257
@5 // 11258
M=D // 11259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11260
D=A // 11261
@SP // 11262
AM=M+1 // 11263
A=A-1 // 11264
M=D // 11265
@3 // 11266
D=A // 11267
@SP // 11268
AM=M+1 // 11269
A=A-1 // 11270
M=D // 11271
@3 // 11272
D=A // 11273
@SP // 11274
AM=M+1 // 11275
A=A-1 // 11276
M=D // 11277
@3 // 11278
D=A // 11279
@SP // 11280
AM=M+1 // 11281
A=A-1 // 11282
M=D // 11283
@27 // 11284
D=A // 11285
@SP // 11286
AM=M+1 // 11287
A=A-1 // 11288
M=D // 11289
@55 // 11290
D=A // 11291
@SP // 11292
AM=M+1 // 11293
A=A-1 // 11294
M=D // 11295
@51 // 11296
D=A // 11297
@SP // 11298
AM=M+1 // 11299
A=A-1 // 11300
M=D // 11301
@51 // 11302
D=A // 11303
@SP // 11304
AM=M+1 // 11305
A=A-1 // 11306
M=D // 11307
@51 // 11308
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
@SP // 11320
AM=M+1 // 11321
A=A-1 // 11322
M=0 // 11323
@SP // 11324
AM=M+1 // 11325
A=A-1 // 11326
M=0 // 11327
// call Output.create
@17 // 11328
D=A // 11329
@14 // 11330
M=D // 11331
@Output.create // 11332
D=A // 11333
@13 // 11334
M=D // 11335
@Output.initMap.ret.74 // 11336
D=A // 11337
@CALL // 11338
0;JMP // 11339
(Output.initMap.ret.74)
@SP // 11340
AM=M-1 // 11341
D=M // 11342
@5 // 11343
M=D // 11344

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11345
D=A // 11346
@SP // 11347
AM=M+1 // 11348
A=A-1 // 11349
M=D // 11350
@12 // 11351
D=A // 11352
@SP // 11353
AM=M+1 // 11354
A=A-1 // 11355
M=D // 11356
@12 // 11357
D=A // 11358
@SP // 11359
AM=M+1 // 11360
A=A-1 // 11361
M=D // 11362
@SP // 11363
AM=M+1 // 11364
A=A-1 // 11365
M=0 // 11366
@14 // 11367
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
@12 // 11379
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
@12 // 11391
D=A // 11392
@SP // 11393
AM=M+1 // 11394
A=A-1 // 11395
M=D // 11396
@30 // 11397
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
@Output.initMap.ret.75 // 11419
D=A // 11420
@CALL // 11421
0;JMP // 11422
(Output.initMap.ret.75)
@SP // 11423
AM=M-1 // 11424
D=M // 11425
@5 // 11426
M=D // 11427

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11428
D=A // 11429
@SP // 11430
AM=M+1 // 11431
A=A-1 // 11432
M=D // 11433
@48 // 11434
D=A // 11435
@SP // 11436
AM=M+1 // 11437
A=A-1 // 11438
M=D // 11439
@48 // 11440
D=A // 11441
@SP // 11442
AM=M+1 // 11443
A=A-1 // 11444
M=D // 11445
@SP // 11446
AM=M+1 // 11447
A=A-1 // 11448
M=0 // 11449
@56 // 11450
D=A // 11451
@SP // 11452
AM=M+1 // 11453
A=A-1 // 11454
M=D // 11455
@48 // 11456
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
@48 // 11468
D=A // 11469
@SP // 11470
AM=M+1 // 11471
A=A-1 // 11472
M=D // 11473
@48 // 11474
D=A // 11475
@SP // 11476
AM=M+1 // 11477
A=A-1 // 11478
M=D // 11479
@51 // 11480
D=A // 11481
@SP // 11482
AM=M+1 // 11483
A=A-1 // 11484
M=D // 11485
@30 // 11486
D=A // 11487
@SP // 11488
AM=M+1 // 11489
A=A-1 // 11490
M=D // 11491
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
@Output.initMap.ret.76 // 11504
D=A // 11505
@CALL // 11506
0;JMP // 11507
(Output.initMap.ret.76)
@SP // 11508
AM=M-1 // 11509
D=M // 11510
@5 // 11511
M=D // 11512

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11513
D=A // 11514
@SP // 11515
AM=M+1 // 11516
A=A-1 // 11517
M=D // 11518
@3 // 11519
D=A // 11520
@SP // 11521
AM=M+1 // 11522
A=A-1 // 11523
M=D // 11524
@3 // 11525
D=A // 11526
@SP // 11527
AM=M+1 // 11528
A=A-1 // 11529
M=D // 11530
@3 // 11531
D=A // 11532
@SP // 11533
AM=M+1 // 11534
A=A-1 // 11535
M=D // 11536
@51 // 11537
D=A // 11538
@SP // 11539
AM=M+1 // 11540
A=A-1 // 11541
M=D // 11542
@27 // 11543
D=A // 11544
@SP // 11545
AM=M+1 // 11546
A=A-1 // 11547
M=D // 11548
@15 // 11549
D=A // 11550
@SP // 11551
AM=M+1 // 11552
A=A-1 // 11553
M=D // 11554
@15 // 11555
D=A // 11556
@SP // 11557
AM=M+1 // 11558
A=A-1 // 11559
M=D // 11560
@27 // 11561
D=A // 11562
@SP // 11563
AM=M+1 // 11564
A=A-1 // 11565
M=D // 11566
@51 // 11567
D=A // 11568
@SP // 11569
AM=M+1 // 11570
A=A-1 // 11571
M=D // 11572
@SP // 11573
AM=M+1 // 11574
A=A-1 // 11575
M=0 // 11576
@SP // 11577
AM=M+1 // 11578
A=A-1 // 11579
M=0 // 11580
// call Output.create
@17 // 11581
D=A // 11582
@14 // 11583
M=D // 11584
@Output.create // 11585
D=A // 11586
@13 // 11587
M=D // 11588
@Output.initMap.ret.77 // 11589
D=A // 11590
@CALL // 11591
0;JMP // 11592
(Output.initMap.ret.77)
@SP // 11593
AM=M-1 // 11594
D=M // 11595
@5 // 11596
M=D // 11597

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11598
D=A // 11599
@SP // 11600
AM=M+1 // 11601
A=A-1 // 11602
M=D // 11603
@14 // 11604
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
@12 // 11628
D=A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633
@12 // 11634
D=A // 11635
@SP // 11636
AM=M+1 // 11637
A=A-1 // 11638
M=D // 11639
@12 // 11640
D=A // 11641
@SP // 11642
AM=M+1 // 11643
A=A-1 // 11644
M=D // 11645
@12 // 11646
D=A // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=D // 11651
@30 // 11652
D=A // 11653
@SP // 11654
AM=M+1 // 11655
A=A-1 // 11656
M=D // 11657
@SP // 11658
AM=M+1 // 11659
A=A-1 // 11660
M=0 // 11661
@SP // 11662
AM=M+1 // 11663
A=A-1 // 11664
M=0 // 11665
// call Output.create
@17 // 11666
D=A // 11667
@14 // 11668
M=D // 11669
@Output.create // 11670
D=A // 11671
@13 // 11672
M=D // 11673
@Output.initMap.ret.78 // 11674
D=A // 11675
@CALL // 11676
0;JMP // 11677
(Output.initMap.ret.78)
@SP // 11678
AM=M-1 // 11679
D=M // 11680
@5 // 11681
M=D // 11682

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@109 // 11683
D=A // 11684
@SP // 11685
AM=M+1 // 11686
A=A-1 // 11687
M=D // 11688
@SP // 11689
AM=M+1 // 11690
A=A-1 // 11691
M=0 // 11692
@SP // 11693
AM=M+1 // 11694
A=A-1 // 11695
M=0 // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=0 // 11700
@29 // 11701
D=A // 11702
@SP // 11703
AM=M+1 // 11704
A=A-1 // 11705
M=D // 11706
@63 // 11707
D=A // 11708
@SP // 11709
AM=M+1 // 11710
A=A-1 // 11711
M=D // 11712
@43 // 11713
D=A // 11714
@SP // 11715
AM=M+1 // 11716
A=A-1 // 11717
M=D // 11718
@43 // 11719
D=A // 11720
@SP // 11721
AM=M+1 // 11722
A=A-1 // 11723
M=D // 11724
@43 // 11725
D=A // 11726
@SP // 11727
AM=M+1 // 11728
A=A-1 // 11729
M=D // 11730
@43 // 11731
D=A // 11732
@SP // 11733
AM=M+1 // 11734
A=A-1 // 11735
M=D // 11736
@SP // 11737
AM=M+1 // 11738
A=A-1 // 11739
M=0 // 11740
@SP // 11741
AM=M+1 // 11742
A=A-1 // 11743
M=0 // 11744
// call Output.create
@17 // 11745
D=A // 11746
@14 // 11747
M=D // 11748
@Output.create // 11749
D=A // 11750
@13 // 11751
M=D // 11752
@Output.initMap.ret.79 // 11753
D=A // 11754
@CALL // 11755
0;JMP // 11756
(Output.initMap.ret.79)
@SP // 11757
AM=M-1 // 11758
D=M // 11759
@5 // 11760
M=D // 11761

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@110 // 11762
D=A // 11763
@SP // 11764
AM=M+1 // 11765
A=A-1 // 11766
M=D // 11767
@SP // 11768
AM=M+1 // 11769
A=A-1 // 11770
M=0 // 11771
@SP // 11772
AM=M+1 // 11773
A=A-1 // 11774
M=0 // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=0 // 11779
@29 // 11780
D=A // 11781
@SP // 11782
AM=M+1 // 11783
A=A-1 // 11784
M=D // 11785
@51 // 11786
D=A // 11787
@SP // 11788
AM=M+1 // 11789
A=A-1 // 11790
M=D // 11791
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
@SP // 11816
AM=M+1 // 11817
A=A-1 // 11818
M=0 // 11819
@SP // 11820
AM=M+1 // 11821
A=A-1 // 11822
M=0 // 11823
// call Output.create
@17 // 11824
D=A // 11825
@14 // 11826
M=D // 11827
@Output.create // 11828
D=A // 11829
@13 // 11830
M=D // 11831
@Output.initMap.ret.80 // 11832
D=A // 11833
@CALL // 11834
0;JMP // 11835
(Output.initMap.ret.80)
@SP // 11836
AM=M-1 // 11837
D=M // 11838
@5 // 11839
M=D // 11840

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@111 // 11841
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
@SP // 11855
AM=M+1 // 11856
A=A-1 // 11857
M=0 // 11858
@30 // 11859
D=A // 11860
@SP // 11861
AM=M+1 // 11862
A=A-1 // 11863
M=D // 11864
@51 // 11865
D=A // 11866
@SP // 11867
AM=M+1 // 11868
A=A-1 // 11869
M=D // 11870
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
@30 // 11889
D=A // 11890
@SP // 11891
AM=M+1 // 11892
A=A-1 // 11893
M=D // 11894
@SP // 11895
AM=M+1 // 11896
A=A-1 // 11897
M=0 // 11898
@SP // 11899
AM=M+1 // 11900
A=A-1 // 11901
M=0 // 11902
// call Output.create
@17 // 11903
D=A // 11904
@14 // 11905
M=D // 11906
@Output.create // 11907
D=A // 11908
@13 // 11909
M=D // 11910
@Output.initMap.ret.81 // 11911
D=A // 11912
@CALL // 11913
0;JMP // 11914
(Output.initMap.ret.81)
@SP // 11915
AM=M-1 // 11916
D=M // 11917
@5 // 11918
M=D // 11919

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@112 // 11920
D=A // 11921
@SP // 11922
AM=M+1 // 11923
A=A-1 // 11924
M=D // 11925
@SP // 11926
AM=M+1 // 11927
A=A-1 // 11928
M=0 // 11929
@SP // 11930
AM=M+1 // 11931
A=A-1 // 11932
M=0 // 11933
@SP // 11934
AM=M+1 // 11935
A=A-1 // 11936
M=0 // 11937
@30 // 11938
D=A // 11939
@SP // 11940
AM=M+1 // 11941
A=A-1 // 11942
M=D // 11943
@51 // 11944
D=A // 11945
@SP // 11946
AM=M+1 // 11947
A=A-1 // 11948
M=D // 11949
@51 // 11950
D=A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955
@51 // 11956
D=A // 11957
@SP // 11958
AM=M+1 // 11959
A=A-1 // 11960
M=D // 11961
@31 // 11962
D=A // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=D // 11967
@3 // 11968
D=A // 11969
@SP // 11970
AM=M+1 // 11971
A=A-1 // 11972
M=D // 11973
@3 // 11974
D=A // 11975
@SP // 11976
AM=M+1 // 11977
A=A-1 // 11978
M=D // 11979
@SP // 11980
AM=M+1 // 11981
A=A-1 // 11982
M=0 // 11983
// call Output.create
@17 // 11984
D=A // 11985
@14 // 11986
M=D // 11987
@Output.create // 11988
D=A // 11989
@13 // 11990
M=D // 11991
@Output.initMap.ret.82 // 11992
D=A // 11993
@CALL // 11994
0;JMP // 11995
(Output.initMap.ret.82)
@SP // 11996
AM=M-1 // 11997
D=M // 11998
@5 // 11999
M=D // 12000

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@113 // 12001
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
@SP // 12015
AM=M+1 // 12016
A=A-1 // 12017
M=0 // 12018
@30 // 12019
D=A // 12020
@SP // 12021
AM=M+1 // 12022
A=A-1 // 12023
M=D // 12024
@51 // 12025
D=A // 12026
@SP // 12027
AM=M+1 // 12028
A=A-1 // 12029
M=D // 12030
@51 // 12031
D=A // 12032
@SP // 12033
AM=M+1 // 12034
A=A-1 // 12035
M=D // 12036
@51 // 12037
D=A // 12038
@SP // 12039
AM=M+1 // 12040
A=A-1 // 12041
M=D // 12042
@62 // 12043
D=A // 12044
@SP // 12045
AM=M+1 // 12046
A=A-1 // 12047
M=D // 12048
@48 // 12049
D=A // 12050
@SP // 12051
AM=M+1 // 12052
A=A-1 // 12053
M=D // 12054
@48 // 12055
D=A // 12056
@SP // 12057
AM=M+1 // 12058
A=A-1 // 12059
M=D // 12060
@SP // 12061
AM=M+1 // 12062
A=A-1 // 12063
M=0 // 12064
// call Output.create
@17 // 12065
D=A // 12066
@14 // 12067
M=D // 12068
@Output.create // 12069
D=A // 12070
@13 // 12071
M=D // 12072
@Output.initMap.ret.83 // 12073
D=A // 12074
@CALL // 12075
0;JMP // 12076
(Output.initMap.ret.83)
@SP // 12077
AM=M-1 // 12078
D=M // 12079
@5 // 12080
M=D // 12081

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@114 // 12082
D=A // 12083
@SP // 12084
AM=M+1 // 12085
A=A-1 // 12086
M=D // 12087
@SP // 12088
AM=M+1 // 12089
A=A-1 // 12090
M=0 // 12091
@SP // 12092
AM=M+1 // 12093
A=A-1 // 12094
M=0 // 12095
@SP // 12096
AM=M+1 // 12097
A=A-1 // 12098
M=0 // 12099
@29 // 12100
D=A // 12101
@SP // 12102
AM=M+1 // 12103
A=A-1 // 12104
M=D // 12105
@55 // 12106
D=A // 12107
@SP // 12108
AM=M+1 // 12109
A=A-1 // 12110
M=D // 12111
@51 // 12112
D=A // 12113
@SP // 12114
AM=M+1 // 12115
A=A-1 // 12116
M=D // 12117
@3 // 12118
D=A // 12119
@SP // 12120
AM=M+1 // 12121
A=A-1 // 12122
M=D // 12123
@3 // 12124
D=A // 12125
@SP // 12126
AM=M+1 // 12127
A=A-1 // 12128
M=D // 12129
@7 // 12130
D=A // 12131
@SP // 12132
AM=M+1 // 12133
A=A-1 // 12134
M=D // 12135
@SP // 12136
AM=M+1 // 12137
A=A-1 // 12138
M=0 // 12139
@SP // 12140
AM=M+1 // 12141
A=A-1 // 12142
M=0 // 12143
// call Output.create
@17 // 12144
D=A // 12145
@14 // 12146
M=D // 12147
@Output.create // 12148
D=A // 12149
@13 // 12150
M=D // 12151
@Output.initMap.ret.84 // 12152
D=A // 12153
@CALL // 12154
0;JMP // 12155
(Output.initMap.ret.84)
@SP // 12156
AM=M-1 // 12157
D=M // 12158
@5 // 12159
M=D // 12160

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@115 // 12161
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
@SP // 12175
AM=M+1 // 12176
A=A-1 // 12177
M=0 // 12178
@30 // 12179
D=A // 12180
@SP // 12181
AM=M+1 // 12182
A=A-1 // 12183
M=D // 12184
@51 // 12185
D=A // 12186
@SP // 12187
AM=M+1 // 12188
A=A-1 // 12189
M=D // 12190
@6 // 12191
D=A // 12192
@SP // 12193
AM=M+1 // 12194
A=A-1 // 12195
M=D // 12196
@24 // 12197
D=A // 12198
@SP // 12199
AM=M+1 // 12200
A=A-1 // 12201
M=D // 12202
@51 // 12203
D=A // 12204
@SP // 12205
AM=M+1 // 12206
A=A-1 // 12207
M=D // 12208
@30 // 12209
D=A // 12210
@SP // 12211
AM=M+1 // 12212
A=A-1 // 12213
M=D // 12214
@SP // 12215
AM=M+1 // 12216
A=A-1 // 12217
M=0 // 12218
@SP // 12219
AM=M+1 // 12220
A=A-1 // 12221
M=0 // 12222
// call Output.create
@17 // 12223
D=A // 12224
@14 // 12225
M=D // 12226
@Output.create // 12227
D=A // 12228
@13 // 12229
M=D // 12230
@Output.initMap.ret.85 // 12231
D=A // 12232
@CALL // 12233
0;JMP // 12234
(Output.initMap.ret.85)
@SP // 12235
AM=M-1 // 12236
D=M // 12237
@5 // 12238
M=D // 12239

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12240
D=A // 12241
@SP // 12242
AM=M+1 // 12243
A=A-1 // 12244
M=D // 12245
@4 // 12246
D=A // 12247
@SP // 12248
AM=M+1 // 12249
A=A-1 // 12250
M=D // 12251
@6 // 12252
D=A // 12253
@SP // 12254
AM=M+1 // 12255
A=A-1 // 12256
M=D // 12257
@6 // 12258
D=A // 12259
@SP // 12260
AM=M+1 // 12261
A=A-1 // 12262
M=D // 12263
@15 // 12264
D=A // 12265
@SP // 12266
AM=M+1 // 12267
A=A-1 // 12268
M=D // 12269
@6 // 12270
D=A // 12271
@SP // 12272
AM=M+1 // 12273
A=A-1 // 12274
M=D // 12275
@6 // 12276
D=A // 12277
@SP // 12278
AM=M+1 // 12279
A=A-1 // 12280
M=D // 12281
@6 // 12282
D=A // 12283
@SP // 12284
AM=M+1 // 12285
A=A-1 // 12286
M=D // 12287
@54 // 12288
D=A // 12289
@SP // 12290
AM=M+1 // 12291
A=A-1 // 12292
M=D // 12293
@28 // 12294
D=A // 12295
@SP // 12296
AM=M+1 // 12297
A=A-1 // 12298
M=D // 12299
@SP // 12300
AM=M+1 // 12301
A=A-1 // 12302
M=0 // 12303
@SP // 12304
AM=M+1 // 12305
A=A-1 // 12306
M=0 // 12307
// call Output.create
@17 // 12308
D=A // 12309
@14 // 12310
M=D // 12311
@Output.create // 12312
D=A // 12313
@13 // 12314
M=D // 12315
@Output.initMap.ret.86 // 12316
D=A // 12317
@CALL // 12318
0;JMP // 12319
(Output.initMap.ret.86)
@SP // 12320
AM=M-1 // 12321
D=M // 12322
@5 // 12323
M=D // 12324

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 12325
D=A // 12326
@SP // 12327
AM=M+1 // 12328
A=A-1 // 12329
M=D // 12330
@SP // 12331
AM=M+1 // 12332
A=A-1 // 12333
M=0 // 12334
@SP // 12335
AM=M+1 // 12336
A=A-1 // 12337
M=0 // 12338
@SP // 12339
AM=M+1 // 12340
A=A-1 // 12341
M=0 // 12342
@27 // 12343
D=A // 12344
@SP // 12345
AM=M+1 // 12346
A=A-1 // 12347
M=D // 12348
@27 // 12349
D=A // 12350
@SP // 12351
AM=M+1 // 12352
A=A-1 // 12353
M=D // 12354
@27 // 12355
D=A // 12356
@SP // 12357
AM=M+1 // 12358
A=A-1 // 12359
M=D // 12360
@27 // 12361
D=A // 12362
@SP // 12363
AM=M+1 // 12364
A=A-1 // 12365
M=D // 12366
@27 // 12367
D=A // 12368
@SP // 12369
AM=M+1 // 12370
A=A-1 // 12371
M=D // 12372
@54 // 12373
D=A // 12374
@SP // 12375
AM=M+1 // 12376
A=A-1 // 12377
M=D // 12378
@SP // 12379
AM=M+1 // 12380
A=A-1 // 12381
M=0 // 12382
@SP // 12383
AM=M+1 // 12384
A=A-1 // 12385
M=0 // 12386
// call Output.create
@17 // 12387
D=A // 12388
@14 // 12389
M=D // 12390
@Output.create // 12391
D=A // 12392
@13 // 12393
M=D // 12394
@Output.initMap.ret.87 // 12395
D=A // 12396
@CALL // 12397
0;JMP // 12398
(Output.initMap.ret.87)
@SP // 12399
AM=M-1 // 12400
D=M // 12401
@5 // 12402
M=D // 12403

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@118 // 12404
D=A // 12405
@SP // 12406
AM=M+1 // 12407
A=A-1 // 12408
M=D // 12409
@SP // 12410
AM=M+1 // 12411
A=A-1 // 12412
M=0 // 12413
@SP // 12414
AM=M+1 // 12415
A=A-1 // 12416
M=0 // 12417
@SP // 12418
AM=M+1 // 12419
A=A-1 // 12420
M=0 // 12421
@51 // 12422
D=A // 12423
@SP // 12424
AM=M+1 // 12425
A=A-1 // 12426
M=D // 12427
@51 // 12428
D=A // 12429
@SP // 12430
AM=M+1 // 12431
A=A-1 // 12432
M=D // 12433
@51 // 12434
D=A // 12435
@SP // 12436
AM=M+1 // 12437
A=A-1 // 12438
M=D // 12439
@51 // 12440
D=A // 12441
@SP // 12442
AM=M+1 // 12443
A=A-1 // 12444
M=D // 12445
@30 // 12446
D=A // 12447
@SP // 12448
AM=M+1 // 12449
A=A-1 // 12450
M=D // 12451
@12 // 12452
D=A // 12453
@SP // 12454
AM=M+1 // 12455
A=A-1 // 12456
M=D // 12457
@SP // 12458
AM=M+1 // 12459
A=A-1 // 12460
M=0 // 12461
@SP // 12462
AM=M+1 // 12463
A=A-1 // 12464
M=0 // 12465
// call Output.create
@17 // 12466
D=A // 12467
@14 // 12468
M=D // 12469
@Output.create // 12470
D=A // 12471
@13 // 12472
M=D // 12473
@Output.initMap.ret.88 // 12474
D=A // 12475
@CALL // 12476
0;JMP // 12477
(Output.initMap.ret.88)
@SP // 12478
AM=M-1 // 12479
D=M // 12480
@5 // 12481
M=D // 12482

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@119 // 12483
D=A // 12484
@SP // 12485
AM=M+1 // 12486
A=A-1 // 12487
M=D // 12488
@SP // 12489
AM=M+1 // 12490
A=A-1 // 12491
M=0 // 12492
@SP // 12493
AM=M+1 // 12494
A=A-1 // 12495
M=0 // 12496
@SP // 12497
AM=M+1 // 12498
A=A-1 // 12499
M=0 // 12500
@51 // 12501
D=A // 12502
@SP // 12503
AM=M+1 // 12504
A=A-1 // 12505
M=D // 12506
@51 // 12507
D=A // 12508
@SP // 12509
AM=M+1 // 12510
A=A-1 // 12511
M=D // 12512
@51 // 12513
D=A // 12514
@SP // 12515
AM=M+1 // 12516
A=A-1 // 12517
M=D // 12518
@63 // 12519
D=A // 12520
@SP // 12521
AM=M+1 // 12522
A=A-1 // 12523
M=D // 12524
@63 // 12525
D=A // 12526
@SP // 12527
AM=M+1 // 12528
A=A-1 // 12529
M=D // 12530
@18 // 12531
D=A // 12532
@SP // 12533
AM=M+1 // 12534
A=A-1 // 12535
M=D // 12536
@SP // 12537
AM=M+1 // 12538
A=A-1 // 12539
M=0 // 12540
@SP // 12541
AM=M+1 // 12542
A=A-1 // 12543
M=0 // 12544
// call Output.create
@17 // 12545
D=A // 12546
@14 // 12547
M=D // 12548
@Output.create // 12549
D=A // 12550
@13 // 12551
M=D // 12552
@Output.initMap.ret.89 // 12553
D=A // 12554
@CALL // 12555
0;JMP // 12556
(Output.initMap.ret.89)
@SP // 12557
AM=M-1 // 12558
D=M // 12559
@5 // 12560
M=D // 12561

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@120 // 12562
D=A // 12563
@SP // 12564
AM=M+1 // 12565
A=A-1 // 12566
M=D // 12567
@SP // 12568
AM=M+1 // 12569
A=A-1 // 12570
M=0 // 12571
@SP // 12572
AM=M+1 // 12573
A=A-1 // 12574
M=0 // 12575
@SP // 12576
AM=M+1 // 12577
A=A-1 // 12578
M=0 // 12579
@51 // 12580
D=A // 12581
@SP // 12582
AM=M+1 // 12583
A=A-1 // 12584
M=D // 12585
@30 // 12586
D=A // 12587
@SP // 12588
AM=M+1 // 12589
A=A-1 // 12590
M=D // 12591
@12 // 12592
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
@30 // 12604
D=A // 12605
@SP // 12606
AM=M+1 // 12607
A=A-1 // 12608
M=D // 12609
@51 // 12610
D=A // 12611
@SP // 12612
AM=M+1 // 12613
A=A-1 // 12614
M=D // 12615
@SP // 12616
AM=M+1 // 12617
A=A-1 // 12618
M=0 // 12619
@SP // 12620
AM=M+1 // 12621
A=A-1 // 12622
M=0 // 12623
// call Output.create
@17 // 12624
D=A // 12625
@14 // 12626
M=D // 12627
@Output.create // 12628
D=A // 12629
@13 // 12630
M=D // 12631
@Output.initMap.ret.90 // 12632
D=A // 12633
@CALL // 12634
0;JMP // 12635
(Output.initMap.ret.90)
@SP // 12636
AM=M-1 // 12637
D=M // 12638
@5 // 12639
M=D // 12640

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@121 // 12641
D=A // 12642
@SP // 12643
AM=M+1 // 12644
A=A-1 // 12645
M=D // 12646
@SP // 12647
AM=M+1 // 12648
A=A-1 // 12649
M=0 // 12650
@SP // 12651
AM=M+1 // 12652
A=A-1 // 12653
M=0 // 12654
@SP // 12655
AM=M+1 // 12656
A=A-1 // 12657
M=0 // 12658
@51 // 12659
D=A // 12660
@SP // 12661
AM=M+1 // 12662
A=A-1 // 12663
M=D // 12664
@51 // 12665
D=A // 12666
@SP // 12667
AM=M+1 // 12668
A=A-1 // 12669
M=D // 12670
@51 // 12671
D=A // 12672
@SP // 12673
AM=M+1 // 12674
A=A-1 // 12675
M=D // 12676
@62 // 12677
D=A // 12678
@SP // 12679
AM=M+1 // 12680
A=A-1 // 12681
M=D // 12682
@48 // 12683
D=A // 12684
@SP // 12685
AM=M+1 // 12686
A=A-1 // 12687
M=D // 12688
@24 // 12689
D=A // 12690
@SP // 12691
AM=M+1 // 12692
A=A-1 // 12693
M=D // 12694
@15 // 12695
D=A // 12696
@SP // 12697
AM=M+1 // 12698
A=A-1 // 12699
M=D // 12700
@SP // 12701
AM=M+1 // 12702
A=A-1 // 12703
M=0 // 12704
// call Output.create
@17 // 12705
D=A // 12706
@14 // 12707
M=D // 12708
@Output.create // 12709
D=A // 12710
@13 // 12711
M=D // 12712
@Output.initMap.ret.91 // 12713
D=A // 12714
@CALL // 12715
0;JMP // 12716
(Output.initMap.ret.91)
@SP // 12717
AM=M-1 // 12718
D=M // 12719
@5 // 12720
M=D // 12721

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@122 // 12722
D=A // 12723
@SP // 12724
AM=M+1 // 12725
A=A-1 // 12726
M=D // 12727
@SP // 12728
AM=M+1 // 12729
A=A-1 // 12730
M=0 // 12731
@SP // 12732
AM=M+1 // 12733
A=A-1 // 12734
M=0 // 12735
@SP // 12736
AM=M+1 // 12737
A=A-1 // 12738
M=0 // 12739
@63 // 12740
D=A // 12741
@SP // 12742
AM=M+1 // 12743
A=A-1 // 12744
M=D // 12745
@27 // 12746
D=A // 12747
@SP // 12748
AM=M+1 // 12749
A=A-1 // 12750
M=D // 12751
@12 // 12752
D=A // 12753
@SP // 12754
AM=M+1 // 12755
A=A-1 // 12756
M=D // 12757
@6 // 12758
D=A // 12759
@SP // 12760
AM=M+1 // 12761
A=A-1 // 12762
M=D // 12763
@51 // 12764
D=A // 12765
@SP // 12766
AM=M+1 // 12767
A=A-1 // 12768
M=D // 12769
@63 // 12770
D=A // 12771
@SP // 12772
AM=M+1 // 12773
A=A-1 // 12774
M=D // 12775
@SP // 12776
AM=M+1 // 12777
A=A-1 // 12778
M=0 // 12779
@SP // 12780
AM=M+1 // 12781
A=A-1 // 12782
M=0 // 12783
// call Output.create
@17 // 12784
D=A // 12785
@14 // 12786
M=D // 12787
@Output.create // 12788
D=A // 12789
@13 // 12790
M=D // 12791
@Output.initMap.ret.92 // 12792
D=A // 12793
@CALL // 12794
0;JMP // 12795
(Output.initMap.ret.92)
@SP // 12796
AM=M-1 // 12797
D=M // 12798
@5 // 12799
M=D // 12800

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12801
D=A // 12802
@SP // 12803
AM=M+1 // 12804
A=A-1 // 12805
M=D // 12806
@56 // 12807
D=A // 12808
@SP // 12809
AM=M+1 // 12810
A=A-1 // 12811
M=D // 12812
@12 // 12813
D=A // 12814
@SP // 12815
AM=M+1 // 12816
A=A-1 // 12817
M=D // 12818
@12 // 12819
D=A // 12820
@SP // 12821
AM=M+1 // 12822
A=A-1 // 12823
M=D // 12824
@12 // 12825
D=A // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=D // 12830
@7 // 12831
D=A // 12832
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=D // 12836
@12 // 12837
D=A // 12838
@SP // 12839
AM=M+1 // 12840
A=A-1 // 12841
M=D // 12842
@12 // 12843
D=A // 12844
@SP // 12845
AM=M+1 // 12846
A=A-1 // 12847
M=D // 12848
@12 // 12849
D=A // 12850
@SP // 12851
AM=M+1 // 12852
A=A-1 // 12853
M=D // 12854
@56 // 12855
D=A // 12856
@SP // 12857
AM=M+1 // 12858
A=A-1 // 12859
M=D // 12860
@SP // 12861
AM=M+1 // 12862
A=A-1 // 12863
M=0 // 12864
@SP // 12865
AM=M+1 // 12866
A=A-1 // 12867
M=0 // 12868
// call Output.create
@17 // 12869
D=A // 12870
@14 // 12871
M=D // 12872
@Output.create // 12873
D=A // 12874
@13 // 12875
M=D // 12876
@Output.initMap.ret.93 // 12877
D=A // 12878
@CALL // 12879
0;JMP // 12880
(Output.initMap.ret.93)
@SP // 12881
AM=M-1 // 12882
D=M // 12883
@5 // 12884
M=D // 12885

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12886
D=A // 12887
@SP // 12888
AM=M+1 // 12889
A=A-1 // 12890
M=D // 12891
@12 // 12892
D=A // 12893
@SP // 12894
AM=M+1 // 12895
A=A-1 // 12896
M=D // 12897
@12 // 12898
D=A // 12899
@SP // 12900
AM=M+1 // 12901
A=A-1 // 12902
M=D // 12903
@12 // 12904
D=A // 12905
@SP // 12906
AM=M+1 // 12907
A=A-1 // 12908
M=D // 12909
@12 // 12910
D=A // 12911
@SP // 12912
AM=M+1 // 12913
A=A-1 // 12914
M=D // 12915
@12 // 12916
D=A // 12917
@SP // 12918
AM=M+1 // 12919
A=A-1 // 12920
M=D // 12921
@12 // 12922
D=A // 12923
@SP // 12924
AM=M+1 // 12925
A=A-1 // 12926
M=D // 12927
@12 // 12928
D=A // 12929
@SP // 12930
AM=M+1 // 12931
A=A-1 // 12932
M=D // 12933
@12 // 12934
D=A // 12935
@SP // 12936
AM=M+1 // 12937
A=A-1 // 12938
M=D // 12939
@12 // 12940
D=A // 12941
@SP // 12942
AM=M+1 // 12943
A=A-1 // 12944
M=D // 12945
@SP // 12946
AM=M+1 // 12947
A=A-1 // 12948
M=0 // 12949
@SP // 12950
AM=M+1 // 12951
A=A-1 // 12952
M=0 // 12953
// call Output.create
@17 // 12954
D=A // 12955
@14 // 12956
M=D // 12957
@Output.create // 12958
D=A // 12959
@13 // 12960
M=D // 12961
@Output.initMap.ret.94 // 12962
D=A // 12963
@CALL // 12964
0;JMP // 12965
(Output.initMap.ret.94)
@SP // 12966
AM=M-1 // 12967
D=M // 12968
@5 // 12969
M=D // 12970

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12971
D=A // 12972
@SP // 12973
AM=M+1 // 12974
A=A-1 // 12975
M=D // 12976
@7 // 12977
D=A // 12978
@SP // 12979
AM=M+1 // 12980
A=A-1 // 12981
M=D // 12982
@12 // 12983
D=A // 12984
@SP // 12985
AM=M+1 // 12986
A=A-1 // 12987
M=D // 12988
@12 // 12989
D=A // 12990
@SP // 12991
AM=M+1 // 12992
A=A-1 // 12993
M=D // 12994
@12 // 12995
D=A // 12996
@SP // 12997
AM=M+1 // 12998
A=A-1 // 12999
M=D // 13000
@56 // 13001
D=A // 13002
@SP // 13003
AM=M+1 // 13004
A=A-1 // 13005
M=D // 13006
@12 // 13007
D=A // 13008
@SP // 13009
AM=M+1 // 13010
A=A-1 // 13011
M=D // 13012
@12 // 13013
D=A // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018
@12 // 13019
D=A // 13020
@SP // 13021
AM=M+1 // 13022
A=A-1 // 13023
M=D // 13024
@7 // 13025
D=A // 13026
@SP // 13027
AM=M+1 // 13028
A=A-1 // 13029
M=D // 13030
@SP // 13031
AM=M+1 // 13032
A=A-1 // 13033
M=0 // 13034
@SP // 13035
AM=M+1 // 13036
A=A-1 // 13037
M=0 // 13038
// call Output.create
@17 // 13039
D=A // 13040
@14 // 13041
M=D // 13042
@Output.create // 13043
D=A // 13044
@13 // 13045
M=D // 13046
@Output.initMap.ret.95 // 13047
D=A // 13048
@CALL // 13049
0;JMP // 13050
(Output.initMap.ret.95)
@SP // 13051
AM=M-1 // 13052
D=M // 13053
@5 // 13054
M=D // 13055

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13056
D=A // 13057
@SP // 13058
AM=M+1 // 13059
A=A-1 // 13060
M=D // 13061
@38 // 13062
D=A // 13063
@SP // 13064
AM=M+1 // 13065
A=A-1 // 13066
M=D // 13067
@45 // 13068
D=A // 13069
@SP // 13070
AM=M+1 // 13071
A=A-1 // 13072
M=D // 13073
@25 // 13074
D=A // 13075
@SP // 13076
AM=M+1 // 13077
A=A-1 // 13078
M=D // 13079
@SP // 13080
AM=M+1 // 13081
A=A-1 // 13082
M=0 // 13083
@SP // 13084
AM=M+1 // 13085
A=A-1 // 13086
M=0 // 13087
@SP // 13088
AM=M+1 // 13089
A=A-1 // 13090
M=0 // 13091
@SP // 13092
AM=M+1 // 13093
A=A-1 // 13094
M=0 // 13095
@SP // 13096
AM=M+1 // 13097
A=A-1 // 13098
M=0 // 13099
@SP // 13100
AM=M+1 // 13101
A=A-1 // 13102
M=0 // 13103
@SP // 13104
AM=M+1 // 13105
A=A-1 // 13106
M=0 // 13107
@SP // 13108
AM=M+1 // 13109
A=A-1 // 13110
M=0 // 13111
// call Output.create
@17 // 13112
D=A // 13113
@14 // 13114
M=D // 13115
@Output.create // 13116
D=A // 13117
@13 // 13118
M=D // 13119
@Output.initMap.ret.96 // 13120
D=A // 13121
@CALL // 13122
0;JMP // 13123
(Output.initMap.ret.96)
@SP // 13124
AM=M-1 // 13125
D=M // 13126
@5 // 13127
M=D // 13128

////PushInstruction("constant 0")
@SP // 13129
AM=M+1 // 13130
A=A-1 // 13131
M=0 // 13132

////ReturnInstruction{}
@RETURN // 13133
0;JMP // 13134

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 13135
AM=M+1 // 13136
A=A-1 // 13137
M=0 // 13138

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 13139
D=A // 13140
@SP // 13141
AM=M+1 // 13142
A=A-1 // 13143
M=D // 13144
// call Array.new
@6 // 13145
D=A // 13146
@14 // 13147
M=D // 13148
@Array.new // 13149
D=A // 13150
@13 // 13151
M=D // 13152
@Output.create.ret.0 // 13153
D=A // 13154
@CALL // 13155
0;JMP // 13156
(Output.create.ret.0)
@SP // 13157
AM=M-1 // 13158
D=M // 13159
@LCL // 13160
A=M // 13161
M=D // 13162

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 13163
D=M // 13164
@SP // 13165
AM=M+1 // 13166
A=A-1 // 13167
M=D // 13168
@ARG // 13169
A=M // 13170
D=M // 13171
@SP // 13172
AM=M-1 // 13173
D=D+M // 13174
@SP // 13175
AM=M+1 // 13176
A=A-1 // 13177
M=D // 13178
@LCL // 13179
A=M // 13180
D=M // 13181
@SP // 13182
AM=M-1 // 13183
A=M // 13184
M=D // 13185

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 13186
A=M // 13187
D=M // 13188
@SP // 13189
AM=M+1 // 13190
A=A-1 // 13191
M=D // 13192
@ARG // 13193
A=M+1 // 13194
D=M // 13195
@SP // 13196
AM=M-1 // 13197
A=M // 13198
M=D // 13199

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 13200
A=M // 13201
D=M // 13202
@SP // 13203
AM=M+1 // 13204
A=A-1 // 13205
M=D+1 // 13206
@ARG // 13207
A=M+1 // 13208
A=A+1 // 13209
D=M // 13210
@SP // 13211
AM=M-1 // 13212
A=M // 13213
M=D // 13214

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 13215
A=M // 13216
D=M // 13217
@2 // 13218
D=D+A // 13219
@SP // 13220
AM=M+1 // 13221
A=A-1 // 13222
M=D // 13223
@ARG // 13224
A=M+1 // 13225
A=A+1 // 13226
A=A+1 // 13227
D=M // 13228
@SP // 13229
AM=M-1 // 13230
A=M // 13231
M=D // 13232

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 13233
A=M // 13234
D=M // 13235
@3 // 13236
D=D+A // 13237
@SP // 13238
AM=M+1 // 13239
A=A-1 // 13240
M=D // 13241
@ARG // 13242
D=M // 13243
@4 // 13244
A=D+A // 13245
D=M // 13246
@SP // 13247
AM=M-1 // 13248
A=M // 13249
M=D // 13250

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 13251
A=M // 13252
D=M // 13253
@4 // 13254
D=D+A // 13255
@SP // 13256
AM=M+1 // 13257
A=A-1 // 13258
M=D // 13259
@ARG // 13260
D=M // 13261
@5 // 13262
A=D+A // 13263
D=M // 13264
@SP // 13265
AM=M-1 // 13266
A=M // 13267
M=D // 13268

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 13269
A=M // 13270
D=M // 13271
@5 // 13272
D=D+A // 13273
@SP // 13274
AM=M+1 // 13275
A=A-1 // 13276
M=D // 13277
@ARG // 13278
D=M // 13279
@6 // 13280
A=D+A // 13281
D=M // 13282
@SP // 13283
AM=M-1 // 13284
A=M // 13285
M=D // 13286

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 13287
A=M // 13288
D=M // 13289
@6 // 13290
D=D+A // 13291
@SP // 13292
AM=M+1 // 13293
A=A-1 // 13294
M=D // 13295
@ARG // 13296
D=M // 13297
@7 // 13298
A=D+A // 13299
D=M // 13300
@SP // 13301
AM=M-1 // 13302
A=M // 13303
M=D // 13304

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 13305
A=M // 13306
D=M // 13307
@7 // 13308
D=D+A // 13309
@SP // 13310
AM=M+1 // 13311
A=A-1 // 13312
M=D // 13313
@ARG // 13314
D=M // 13315
@8 // 13316
A=D+A // 13317
D=M // 13318
@SP // 13319
AM=M-1 // 13320
A=M // 13321
M=D // 13322

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 13323
A=M // 13324
D=M // 13325
@8 // 13326
D=D+A // 13327
@SP // 13328
AM=M+1 // 13329
A=A-1 // 13330
M=D // 13331
@ARG // 13332
D=M // 13333
@9 // 13334
A=D+A // 13335
D=M // 13336
@SP // 13337
AM=M-1 // 13338
A=M // 13339
M=D // 13340

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 13341
A=M // 13342
D=M // 13343
@9 // 13344
D=D+A // 13345
@SP // 13346
AM=M+1 // 13347
A=A-1 // 13348
M=D // 13349
@ARG // 13350
D=M // 13351
@10 // 13352
A=D+A // 13353
D=M // 13354
@SP // 13355
AM=M-1 // 13356
A=M // 13357
M=D // 13358

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 13359
A=M // 13360
D=M // 13361
@10 // 13362
D=D+A // 13363
@SP // 13364
AM=M+1 // 13365
A=A-1 // 13366
M=D // 13367
@ARG // 13368
D=M // 13369
@11 // 13370
A=D+A // 13371
D=M // 13372
@SP // 13373
AM=M-1 // 13374
A=M // 13375
M=D // 13376

////PushInstruction("constant 0")
@SP // 13377
AM=M+1 // 13378
A=A-1 // 13379
M=0 // 13380

////ReturnInstruction{}
@RETURN // 13381
0;JMP // 13382

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
@Output.getMap.EQ.2 // 13383
D=A // 13384
@SP // 13385
AM=M+1 // 13386
A=A-1 // 13387
M=D // 13388
@Output.getMap.LT.3 // 13389
D=A // 13390
@SP // 13391
AM=M+1 // 13392
A=A-1 // 13393
M=D // 13394
@ARG // 13395
A=M // 13396
D=M // 13397
@32 // 13398
D=D-A // 13399
@14 // 13400
M=D // 13401
@SP // 13402
AM=M-1 // 13403
D=M // 13404
@13 // 13405
M=D // 13406
@14 // 13407
D=M // 13408
@DO_LT // 13409
0;JMP // 13410
(Output.getMap.LT.3)
@SP // 13411
AM=M+1 // 13412
A=A-1 // 13413
M=D // 13414
@Output.getMap.GT.4 // 13415
D=A // 13416
@SP // 13417
AM=M+1 // 13418
A=A-1 // 13419
M=D // 13420
@ARG // 13421
A=M // 13422
D=M // 13423
@126 // 13424
D=D-A // 13425
@14 // 13426
M=D // 13427
@SP // 13428
AM=M-1 // 13429
D=M // 13430
@13 // 13431
M=D // 13432
@14 // 13433
D=M // 13434
@DO_GT // 13435
0;JMP // 13436
(Output.getMap.GT.4)
@SP // 13437
AM=M-1 // 13438
D=D|M // 13439
@14 // 13440
M=D // 13441
@SP // 13442
AM=M-1 // 13443
D=M // 13444
@13 // 13445
M=D // 13446
@14 // 13447
D=M // 13448
@DO_EQ // 13449
0;JMP // 13450
(Output.getMap.EQ.2)
@Output.getMap.IfElse1 // 13451
D;JNE // 13452

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

D=0 // 13453
@ARG // 13454
A=M // 13455
M=D // 13456

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 13457
0;JMP // 13458

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
@Output.0 // 13459
D=M // 13460
@SP // 13461
AM=M+1 // 13462
A=A-1 // 13463
M=D // 13464
@ARG // 13465
A=M // 13466
D=M // 13467
@SP // 13468
AM=M-1 // 13469
A=D+M // 13470
D=M // 13471
@SP // 13472
AM=M+1 // 13473
A=A-1 // 13474
M=D // 13475

////ReturnInstruction{}
@RETURN // 13476
0;JMP // 13477

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=Output.1}
//}

@ARG // 13478
A=M+1 // 13479
D=M // 13480
@Output.1 // 13481
M=D // 13482

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=Output.2}
//}

@ARG // 13483
A=M // 13484
D=M // 13485
@Output.2 // 13486
M=D // 13487

////PushInstruction("constant 0")
@SP // 13488
AM=M+1 // 13489
A=A-1 // 13490
M=0 // 13491

////ReturnInstruction{}
@RETURN // 13492
0;JMP // 13493

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 13494
AM=M+1 // 13495
A=A-1 // 13496
M=0 // 13497
@SP // 13498
AM=M+1 // 13499
A=A-1 // 13500
M=0 // 13501
@SP // 13502
AM=M+1 // 13503
A=A-1 // 13504
M=0 // 13505
@SP // 13506
AM=M+1 // 13507
A=A-1 // 13508
M=0 // 13509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13510
A=M // 13511
D=M // 13512
@SP // 13513
AM=M+1 // 13514
A=A-1 // 13515
M=D // 13516
// call Output.getMap
@6 // 13517
D=A // 13518
@14 // 13519
M=D // 13520
@Output.getMap // 13521
D=A // 13522
@13 // 13523
M=D // 13524
@Output.printChar.ret.0 // 13525
D=A // 13526
@CALL // 13527
0;JMP // 13528
(Output.printChar.ret.0)
@SP // 13529
AM=M-1 // 13530
D=M // 13531
@LCL // 13532
A=M // 13533
M=D // 13534

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

D=0 // 13535
@LCL // 13536
A=M+1 // 13537
A=A+1 // 13538
A=A+1 // 13539
M=D // 13540

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
@Output.printChar.EQ.6 // 13541
D=A // 13542
@SP // 13543
AM=M+1 // 13544
A=A-1 // 13545
M=D // 13546
@Output.printChar.LT.7 // 13547
D=A // 13548
@SP // 13549
AM=M+1 // 13550
A=A-1 // 13551
M=D // 13552
@LCL // 13553
A=M+1 // 13554
A=A+1 // 13555
A=A+1 // 13556
D=M // 13557
@11 // 13558
D=D-A // 13559
@14 // 13560
M=D // 13561
@SP // 13562
AM=M-1 // 13563
D=M // 13564
@13 // 13565
M=D // 13566
@14 // 13567
D=M // 13568
@DO_LT // 13569
0;JMP // 13570
(Output.printChar.LT.7)
@14 // 13571
M=D // 13572
@SP // 13573
AM=M-1 // 13574
D=M // 13575
@13 // 13576
M=D // 13577
@14 // 13578
D=M // 13579
@DO_EQ // 13580
0;JMP // 13581
(Output.printChar.EQ.6)
@WHILE_END_Output.printChar1 // 13582
D;JNE // 13583

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

@Output.2 // 13584
D=M // 13585
@SP // 13586
AM=M+1 // 13587
A=A-1 // 13588
M=D // 13589
@11 // 13590
D=A // 13591
@SP // 13592
AM=M+1 // 13593
A=A-1 // 13594
M=D // 13595
// call Math.multiply
@7 // 13596
D=A // 13597
@14 // 13598
M=D // 13599
@Math.multiply // 13600
D=A // 13601
@13 // 13602
M=D // 13603
@Output.printChar.ret.3 // 13604
D=A // 13605
@CALL // 13606
0;JMP // 13607
(Output.printChar.ret.3)
@LCL // 13608
A=M+1 // 13609
A=A+1 // 13610
A=A+1 // 13611
D=M // 13612
@SP // 13613
AM=M-1 // 13614
D=D+M // 13615
@SP // 13616
AM=M+1 // 13617
A=A-1 // 13618
M=D // 13619
@32 // 13620
D=A // 13621
@SP // 13622
AM=M+1 // 13623
A=A-1 // 13624
M=D // 13625
// call Math.multiply
@7 // 13626
D=A // 13627
@14 // 13628
M=D // 13629
@Math.multiply // 13630
D=A // 13631
@13 // 13632
M=D // 13633
@Output.printChar.ret.4 // 13634
D=A // 13635
@CALL // 13636
0;JMP // 13637
(Output.printChar.ret.4)
@SP // 13638
AM=M-1 // 13639
D=M // 13640
@16384 // 13641
D=D+A // 13642
@SP // 13643
AM=M+1 // 13644
A=A-1 // 13645
M=D // 13646
@Output.1 // 13647
D=M // 13648
@SP // 13649
AM=M+1 // 13650
A=A-1 // 13651
M=D // 13652
@2 // 13653
D=A // 13654
@SP // 13655
AM=M+1 // 13656
A=A-1 // 13657
M=D // 13658
// call Math.divide
@7 // 13659
D=A // 13660
@14 // 13661
M=D // 13662
@Math.divide // 13663
D=A // 13664
@13 // 13665
M=D // 13666
@Output.printChar.ret.5 // 13667
D=A // 13668
@CALL // 13669
0;JMP // 13670
(Output.printChar.ret.5)
@SP // 13671
AM=M-1 // 13672
D=M // 13673
@SP // 13674
AM=M-1 // 13675
D=D+M // 13676
@LCL // 13677
A=M+1 // 13678
M=D // 13679

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
@Output.printChar.EQ.9 // 13680
D=A // 13681
@SP // 13682
AM=M+1 // 13683
A=A-1 // 13684
M=D // 13685
@Output.printChar.EQ.10 // 13686
D=A // 13687
@SP // 13688
AM=M+1 // 13689
A=A-1 // 13690
M=D // 13691
@Output.1 // 13692
D=M // 13693
@1 // 13694
D=D&A // 13695
@14 // 13696
M=D // 13697
@SP // 13698
AM=M-1 // 13699
D=M // 13700
@13 // 13701
M=D // 13702
@14 // 13703
D=M // 13704
@DO_EQ // 13705
0;JMP // 13706
(Output.printChar.EQ.10)
@14 // 13707
M=D // 13708
@SP // 13709
AM=M-1 // 13710
D=M // 13711
@13 // 13712
M=D // 13713
@14 // 13714
D=M // 13715
@DO_EQ // 13716
0;JMP // 13717
(Output.printChar.EQ.9)
@Output.printChar.IfElse1 // 13718
D;JNE // 13719

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

@LCL // 13720
A=M+1 // 13721
A=A+1 // 13722
A=A+1 // 13723
D=M // 13724
A=A-1 // 13725
A=A-1 // 13726
A=A-1 // 13727
A=D+M // 13728
D=M // 13729
@LCL // 13730
A=M+1 // 13731
A=A+1 // 13732
M=D // 13733

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 13734
0;JMP // 13735

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

@LCL // 13736
A=M+1 // 13737
A=A+1 // 13738
A=A+1 // 13739
D=M // 13740
A=A-1 // 13741
A=A-1 // 13742
A=A-1 // 13743
A=D+M // 13744
D=M // 13745
@SP // 13746
AM=M+1 // 13747
A=A-1 // 13748
M=D // 13749
@256 // 13750
D=A // 13751
@SP // 13752
AM=M+1 // 13753
A=A-1 // 13754
M=D // 13755
// call Math.multiply
@7 // 13756
D=A // 13757
@14 // 13758
M=D // 13759
@Math.multiply // 13760
D=A // 13761
@13 // 13762
M=D // 13763
@Output.printChar.ret.6 // 13764
D=A // 13765
@CALL // 13766
0;JMP // 13767
(Output.printChar.ret.6)
@SP // 13768
AM=M-1 // 13769
D=M // 13770
@LCL // 13771
A=M+1 // 13772
A=A+1 // 13773
M=D // 13774

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
@LCL // 13775
A=M+1 // 13776
D=M // 13777
@SP // 13778
AM=M+1 // 13779
A=A-1 // 13780
M=D // 13781
@LCL // 13782
A=M+1 // 13783
A=M // 13784
D=M // 13785
@SP // 13786
AM=M+1 // 13787
A=A-1 // 13788
M=D // 13789
@LCL // 13790
A=M+1 // 13791
A=A+1 // 13792
D=M // 13793
@SP // 13794
AM=M-1 // 13795
D=D|M // 13796
@SP // 13797
AM=M-1 // 13798
A=M // 13799
M=D // 13800

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

@LCL // 13801
A=M+1 // 13802
A=A+1 // 13803
A=A+1 // 13804
D=M+1 // 13805
@LCL // 13806
A=M+1 // 13807
A=A+1 // 13808
A=A+1 // 13809
M=D // 13810

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 13811
0;JMP // 13812

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
@Output.printChar.EQ.12 // 13813
D=A // 13814
@SP // 13815
AM=M+1 // 13816
A=A-1 // 13817
M=D // 13818
@Output.printChar.EQ.13 // 13819
D=A // 13820
@SP // 13821
AM=M+1 // 13822
A=A-1 // 13823
M=D // 13824
@Output.1 // 13825
D=M // 13826
@63 // 13827
D=D-A // 13828
@14 // 13829
M=D // 13830
@SP // 13831
AM=M-1 // 13832
D=M // 13833
@13 // 13834
M=D // 13835
@14 // 13836
D=M // 13837
@DO_EQ // 13838
0;JMP // 13839
(Output.printChar.EQ.13)
@14 // 13840
M=D // 13841
@SP // 13842
AM=M-1 // 13843
D=M // 13844
@13 // 13845
M=D // 13846
@14 // 13847
D=M // 13848
@DO_EQ // 13849
0;JMP // 13850
(Output.printChar.EQ.12)
@Output.printChar.IfElse2 // 13851
D;JNE // 13852

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 13853
D=A // 13854
@14 // 13855
M=D // 13856
@Output.println // 13857
D=A // 13858
@13 // 13859
M=D // 13860
@Output.printChar.ret.7 // 13861
D=A // 13862
@CALL // 13863
0;JMP // 13864
(Output.printChar.ret.7)
@SP // 13865
AM=M-1 // 13866
D=M // 13867
@5 // 13868
M=D // 13869

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 13870
0;JMP // 13871

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

@Output.1 // 13872
D=M+1 // 13873
@Output.1 // 13874
M=D // 13875

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 13876
AM=M+1 // 13877
A=A-1 // 13878
M=0 // 13879

////ReturnInstruction{}
@RETURN // 13880
0;JMP // 13881

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 13882
AM=M+1 // 13883
A=A-1 // 13884
M=0 // 13885
@SP // 13886
AM=M+1 // 13887
A=A-1 // 13888
M=0 // 13889

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 13890
@LCL // 13891
A=M // 13892
M=D // 13893

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13894
A=M // 13895
D=M // 13896
@SP // 13897
AM=M+1 // 13898
A=A-1 // 13899
M=D // 13900
// call String.length
@6 // 13901
D=A // 13902
@14 // 13903
M=D // 13904
@String.length // 13905
D=A // 13906
@13 // 13907
M=D // 13908
@Output.printString.ret.0 // 13909
D=A // 13910
@CALL // 13911
0;JMP // 13912
(Output.printString.ret.0)
@SP // 13913
AM=M-1 // 13914
D=M // 13915
@LCL // 13916
A=M+1 // 13917
M=D // 13918

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
@Output.printString.EQ.15 // 13919
D=A // 13920
@SP // 13921
AM=M+1 // 13922
A=A-1 // 13923
M=D // 13924
@Output.printString.LT.16 // 13925
D=A // 13926
@SP // 13927
AM=M+1 // 13928
A=A-1 // 13929
M=D // 13930
@LCL // 13931
A=M+1 // 13932
D=M // 13933
A=A-1 // 13934
D=M-D // 13935
@14 // 13936
M=D // 13937
@SP // 13938
AM=M-1 // 13939
D=M // 13940
@13 // 13941
M=D // 13942
@14 // 13943
D=M // 13944
@DO_LT // 13945
0;JMP // 13946
(Output.printString.LT.16)
@14 // 13947
M=D // 13948
@SP // 13949
AM=M-1 // 13950
D=M // 13951
@13 // 13952
M=D // 13953
@14 // 13954
D=M // 13955
@DO_EQ // 13956
0;JMP // 13957
(Output.printString.EQ.15)
@WHILE_END_Output.printString1 // 13958
D;JNE // 13959

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13960
A=M // 13961
D=M // 13962
@SP // 13963
AM=M+1 // 13964
A=A-1 // 13965
M=D // 13966
@LCL // 13967
A=M // 13968
D=M // 13969
@SP // 13970
AM=M+1 // 13971
A=A-1 // 13972
M=D // 13973
// call String.charAt
@7 // 13974
D=A // 13975
@14 // 13976
M=D // 13977
@String.charAt // 13978
D=A // 13979
@13 // 13980
M=D // 13981
@Output.printString.ret.1 // 13982
D=A // 13983
@CALL // 13984
0;JMP // 13985
(Output.printString.ret.1)
// call Output.printChar
@6 // 13986
D=A // 13987
@14 // 13988
M=D // 13989
@Output.printChar // 13990
D=A // 13991
@13 // 13992
M=D // 13993
@Output.printString.ret.2 // 13994
D=A // 13995
@CALL // 13996
0;JMP // 13997
(Output.printString.ret.2)
@SP // 13998
AM=M-1 // 13999
D=M // 14000
@5 // 14001
M=D // 14002

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

@LCL // 14003
A=M // 14004
D=M+1 // 14005
@LCL // 14006
A=M // 14007
M=D // 14008

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 14009
0;JMP // 14010

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 14011
AM=M+1 // 14012
A=A-1 // 14013
M=0 // 14014

////ReturnInstruction{}
@RETURN // 14015
0;JMP // 14016

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 14017
AM=M+1 // 14018
A=A-1 // 14019
M=0 // 14020

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 14021
D=A // 14022
@SP // 14023
AM=M+1 // 14024
A=A-1 // 14025
M=D // 14026
// call String.new
@6 // 14027
D=A // 14028
@14 // 14029
M=D // 14030
@String.new // 14031
D=A // 14032
@13 // 14033
M=D // 14034
@Output.printInt.ret.0 // 14035
D=A // 14036
@CALL // 14037
0;JMP // 14038
(Output.printInt.ret.0)
@SP // 14039
AM=M-1 // 14040
D=M // 14041
@LCL // 14042
A=M // 14043
M=D // 14044

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14045
A=M // 14046
D=M // 14047
@SP // 14048
AM=M+1 // 14049
A=A-1 // 14050
M=D // 14051
@ARG // 14052
A=M // 14053
D=M // 14054
@SP // 14055
AM=M+1 // 14056
A=A-1 // 14057
M=D // 14058
// call String.setInt
@7 // 14059
D=A // 14060
@14 // 14061
M=D // 14062
@String.setInt // 14063
D=A // 14064
@13 // 14065
M=D // 14066
@Output.printInt.ret.1 // 14067
D=A // 14068
@CALL // 14069
0;JMP // 14070
(Output.printInt.ret.1)
@SP // 14071
AM=M-1 // 14072
D=M // 14073
@5 // 14074
M=D // 14075

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14076
A=M // 14077
D=M // 14078
@SP // 14079
AM=M+1 // 14080
A=A-1 // 14081
M=D // 14082
// call Output.printString
@6 // 14083
D=A // 14084
@14 // 14085
M=D // 14086
@Output.printString // 14087
D=A // 14088
@13 // 14089
M=D // 14090
@Output.printInt.ret.2 // 14091
D=A // 14092
@CALL // 14093
0;JMP // 14094
(Output.printInt.ret.2)
@SP // 14095
AM=M-1 // 14096
D=M // 14097
@5 // 14098
M=D // 14099

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14100
A=M // 14101
D=M // 14102
@SP // 14103
AM=M+1 // 14104
A=A-1 // 14105
M=D // 14106
// call String.dispose
@6 // 14107
D=A // 14108
@14 // 14109
M=D // 14110
@String.dispose // 14111
D=A // 14112
@13 // 14113
M=D // 14114
@Output.printInt.ret.3 // 14115
D=A // 14116
@CALL // 14117
0;JMP // 14118
(Output.printInt.ret.3)
@SP // 14119
AM=M-1 // 14120
D=M // 14121
@5 // 14122
M=D // 14123

////PushInstruction("constant 0")
@SP // 14124
AM=M+1 // 14125
A=A-1 // 14126
M=0 // 14127

////ReturnInstruction{}
@RETURN // 14128
0;JMP // 14129

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.1}
//}

D=0 // 14130
@Output.1 // 14131
M=D // 14132

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
@Output.println.EQ.18 // 14133
D=A // 14134
@SP // 14135
AM=M+1 // 14136
A=A-1 // 14137
M=D // 14138
@Output.println.EQ.19 // 14139
D=A // 14140
@SP // 14141
AM=M+1 // 14142
A=A-1 // 14143
M=D // 14144
@Output.2 // 14145
D=M // 14146
@22 // 14147
D=D-A // 14148
@14 // 14149
M=D // 14150
@SP // 14151
AM=M-1 // 14152
D=M // 14153
@13 // 14154
M=D // 14155
@14 // 14156
D=M // 14157
@DO_EQ // 14158
0;JMP // 14159
(Output.println.EQ.19)
@14 // 14160
M=D // 14161
@SP // 14162
AM=M-1 // 14163
D=M // 14164
@13 // 14165
M=D // 14166
@14 // 14167
D=M // 14168
@DO_EQ // 14169
0;JMP // 14170
(Output.println.EQ.18)
@Output.println.IfElse1 // 14171
D;JNE // 14172

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=Output.2}
//}

D=0 // 14173
@Output.2 // 14174
M=D // 14175

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 14176
0;JMP // 14177

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

@Output.2 // 14178
D=M+1 // 14179
@Output.2 // 14180
M=D // 14181

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14182
AM=M+1 // 14183
A=A-1 // 14184
M=0 // 14185

////ReturnInstruction{}
@RETURN // 14186
0;JMP // 14187

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=8, Output.create=1}}
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
@Output.backSpace.EQ.21 // 14188
D=A // 14189
@SP // 14190
AM=M+1 // 14191
A=A-1 // 14192
M=D // 14193
@Output.backSpace.EQ.22 // 14194
D=A // 14195
@SP // 14196
AM=M+1 // 14197
A=A-1 // 14198
M=D // 14199
@Output.1 // 14200
D=M // 14201
@14 // 14202
M=D // 14203
@SP // 14204
AM=M-1 // 14205
D=M // 14206
@13 // 14207
M=D // 14208
@14 // 14209
D=M // 14210
@DO_EQ // 14211
0;JMP // 14212
(Output.backSpace.EQ.22)
@14 // 14213
M=D // 14214
@SP // 14215
AM=M-1 // 14216
D=M // 14217
@13 // 14218
M=D // 14219
@14 // 14220
D=M // 14221
@DO_EQ // 14222
0;JMP // 14223
(Output.backSpace.EQ.21)
@Output.backSpace.IfElse1 // 14224
D;JNE // 14225

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=Output.2}
//}

@Output.2 // 14226
D=M-1 // 14227
@Output.2 // 14228
M=D // 14229

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=Output.1}
//}

@63 // 14230
D=A // 14231
@Output.1 // 14232
M=D // 14233

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 14234
0;JMP // 14235

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

@Output.1 // 14236
D=M-1 // 14237
@Output.1 // 14238
M=D // 14239

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14240
AM=M+1 // 14241
A=A-1 // 14242
M=0 // 14243

////ReturnInstruction{}
@RETURN // 14244
0;JMP // 14245

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=Screen.0}
//}

D=-1 // 14246
@Screen.0 // 14247
M=D // 14248

////PushInstruction("constant 0")
@SP // 14249
AM=M+1 // 14250
A=A-1 // 14251
M=0 // 14252

////ReturnInstruction{}
@RETURN // 14253
0;JMP // 14254

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=Screen.0}
//}

@ARG // 14255
A=M // 14256
D=M // 14257
@Screen.0 // 14258
M=D // 14259

////PushInstruction("constant 0")
@SP // 14260
AM=M+1 // 14261
A=A-1 // 14262
M=0 // 14263

////ReturnInstruction{}
@RETURN // 14264
0;JMP // 14265

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 14266
AM=M+1 // 14267
A=A-1 // 14268
M=0 // 14269
@SP // 14270
AM=M+1 // 14271
A=A-1 // 14272
M=0 // 14273

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

@ARG // 14274
A=M+1 // 14275
D=M // 14276
@SP // 14277
AM=M+1 // 14278
A=A-1 // 14279
M=D // 14280
@32 // 14281
D=A // 14282
@SP // 14283
AM=M+1 // 14284
A=A-1 // 14285
M=D // 14286
// call Math.multiply
@7 // 14287
D=A // 14288
@14 // 14289
M=D // 14290
@Math.multiply // 14291
D=A // 14292
@13 // 14293
M=D // 14294
@Screen.drawPixel.ret.2 // 14295
D=A // 14296
@CALL // 14297
0;JMP // 14298
(Screen.drawPixel.ret.2)
@ARG // 14299
A=M // 14300
D=M // 14301
@SP // 14302
AM=M+1 // 14303
A=A-1 // 14304
M=D // 14305
@16 // 14306
D=A // 14307
@SP // 14308
AM=M+1 // 14309
A=A-1 // 14310
M=D // 14311
// call Math.divide
@7 // 14312
D=A // 14313
@14 // 14314
M=D // 14315
@Math.divide // 14316
D=A // 14317
@13 // 14318
M=D // 14319
@Screen.drawPixel.ret.3 // 14320
D=A // 14321
@CALL // 14322
0;JMP // 14323
(Screen.drawPixel.ret.3)
@SP // 14324
AM=M-1 // 14325
D=M // 14326
@SP // 14327
AM=M-1 // 14328
D=D+M // 14329
@16384 // 14330
D=D+A // 14331
@LCL // 14332
A=M // 14333
M=D // 14334

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

@ARG // 14335
A=M // 14336
D=M // 14337
@15 // 14338
D=D&A // 14339
@LCL // 14340
A=M+1 // 14341
M=D // 14342

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
@Screen.drawPixel.EQ.1 // 14343
D=A // 14344
@SP // 14345
AM=M+1 // 14346
A=A-1 // 14347
M=D // 14348
@Screen.drawPixel.EQ.2 // 14349
D=A // 14350
@SP // 14351
AM=M+1 // 14352
A=A-1 // 14353
M=D // 14354
@Screen.0 // 14355
D=M // 14356
@14 // 14357
M=D // 14358
@SP // 14359
AM=M-1 // 14360
D=M // 14361
@13 // 14362
M=D // 14363
@14 // 14364
D=M // 14365
@DO_EQ // 14366
0;JMP // 14367
(Screen.drawPixel.EQ.2)
D=!D // 14368
@14 // 14369
M=D // 14370
@SP // 14371
AM=M-1 // 14372
D=M // 14373
@13 // 14374
M=D // 14375
@14 // 14376
D=M // 14377
@DO_EQ // 14378
0;JMP // 14379
(Screen.drawPixel.EQ.1)
@Screen.drawPixel.IfElse1 // 14380
D;JNE // 14381

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
@LCL // 14382
A=M // 14383
D=M // 14384
@SP // 14385
AM=M+1 // 14386
A=A-1 // 14387
M=D // 14388
@LCL // 14389
A=M // 14390
A=M // 14391
D=M // 14392
@SP // 14393
AM=M+1 // 14394
A=A-1 // 14395
M=D // 14396
@LCL // 14397
A=M+1 // 14398
D=M // 14399
@SP // 14400
AM=M+1 // 14401
A=A-1 // 14402
M=D // 14403
// call Math.twoToThe
@6 // 14404
D=A // 14405
@14 // 14406
M=D // 14407
@Math.twoToThe // 14408
D=A // 14409
@13 // 14410
M=D // 14411
@Screen.drawPixel.ret.4 // 14412
D=A // 14413
@CALL // 14414
0;JMP // 14415
(Screen.drawPixel.ret.4)
@SP // 14416
AM=M-1 // 14417
D=M // 14418
@SP // 14419
AM=M-1 // 14420
D=D|M // 14421
@SP // 14422
AM=M-1 // 14423
A=M // 14424
M=D // 14425

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 14426
0;JMP // 14427

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
@LCL // 14428
A=M // 14429
D=M // 14430
@SP // 14431
AM=M+1 // 14432
A=A-1 // 14433
M=D // 14434
@LCL // 14435
A=M // 14436
A=M // 14437
D=M // 14438
@SP // 14439
AM=M+1 // 14440
A=A-1 // 14441
M=D // 14442
@LCL // 14443
A=M+1 // 14444
D=M // 14445
@SP // 14446
AM=M+1 // 14447
A=A-1 // 14448
M=D // 14449
// call Math.twoToThe
@6 // 14450
D=A // 14451
@14 // 14452
M=D // 14453
@Math.twoToThe // 14454
D=A // 14455
@13 // 14456
M=D // 14457
@Screen.drawPixel.ret.5 // 14458
D=A // 14459
@CALL // 14460
0;JMP // 14461
(Screen.drawPixel.ret.5)
@SP // 14462
AM=M-1 // 14463
D=M // 14464
D=!D // 14465
@SP // 14466
AM=M-1 // 14467
D=D&M // 14468
@SP // 14469
AM=M-1 // 14470
A=M // 14471
M=D // 14472

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14473
AM=M+1 // 14474
A=A-1 // 14475
M=0 // 14476

////ReturnInstruction{}
@RETURN // 14477
0;JMP // 14478

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 14479
AM=M+1 // 14480
A=A-1 // 14481
M=0 // 14482
@SP // 14483
AM=M+1 // 14484
A=A-1 // 14485
M=0 // 14486
@SP // 14487
AM=M+1 // 14488
A=A-1 // 14489
M=0 // 14490
@SP // 14491
AM=M+1 // 14492
A=A-1 // 14493
M=0 // 14494
@SP // 14495
AM=M+1 // 14496
A=A-1 // 14497
M=0 // 14498
@SP // 14499
AM=M+1 // 14500
A=A-1 // 14501
M=0 // 14502

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

@ARG // 14503
A=M+1 // 14504
A=A+1 // 14505
D=M // 14506
A=A-1 // 14507
A=A-1 // 14508
D=D-M // 14509
@SP // 14510
AM=M+1 // 14511
A=A-1 // 14512
M=D // 14513
// call Math.abs
@6 // 14514
D=A // 14515
@14 // 14516
M=D // 14517
@Math.abs // 14518
D=A // 14519
@13 // 14520
M=D // 14521
@Screen.drawLine.ret.0 // 14522
D=A // 14523
@CALL // 14524
0;JMP // 14525
(Screen.drawLine.ret.0)
@SP // 14526
AM=M-1 // 14527
D=M // 14528
@LCL // 14529
A=M // 14530
M=D // 14531

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

@ARG // 14532
A=M+1 // 14533
A=A+1 // 14534
A=A+1 // 14535
D=M // 14536
A=A-1 // 14537
A=A-1 // 14538
D=D-M // 14539
@SP // 14540
AM=M+1 // 14541
A=A-1 // 14542
M=D // 14543
// call Math.abs
@6 // 14544
D=A // 14545
@14 // 14546
M=D // 14547
@Math.abs // 14548
D=A // 14549
@13 // 14550
M=D // 14551
@Screen.drawLine.ret.1 // 14552
D=A // 14553
@CALL // 14554
0;JMP // 14555
(Screen.drawLine.ret.1)
@SP // 14556
AM=M-1 // 14557
D=M // 14558
@LCL // 14559
A=M+1 // 14560
M=D // 14561

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
@Screen.drawLine.EQ.4 // 14562
D=A // 14563
@SP // 14564
AM=M+1 // 14565
A=A-1 // 14566
M=D // 14567
@Screen.drawLine.LT.5 // 14568
D=A // 14569
@SP // 14570
AM=M+1 // 14571
A=A-1 // 14572
M=D // 14573
@ARG // 14574
A=M+1 // 14575
A=A+1 // 14576
D=M // 14577
A=A-1 // 14578
A=A-1 // 14579
D=M-D // 14580
@14 // 14581
M=D // 14582
@SP // 14583
AM=M-1 // 14584
D=M // 14585
@13 // 14586
M=D // 14587
@14 // 14588
D=M // 14589
@DO_LT // 14590
0;JMP // 14591
(Screen.drawLine.LT.5)
@14 // 14592
M=D // 14593
@SP // 14594
AM=M-1 // 14595
D=M // 14596
@13 // 14597
M=D // 14598
@14 // 14599
D=M // 14600
@DO_EQ // 14601
0;JMP // 14602
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse1 // 14603
D;JNE // 14604

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

D=1 // 14605
@LCL // 14606
A=M+1 // 14607
A=A+1 // 14608
M=D // 14609

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 14610
0;JMP // 14611

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

D=-1 // 14612
@LCL // 14613
A=M+1 // 14614
A=A+1 // 14615
M=D // 14616

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
@Screen.drawLine.EQ.7 // 14617
D=A // 14618
@SP // 14619
AM=M+1 // 14620
A=A-1 // 14621
M=D // 14622
@Screen.drawLine.LT.8 // 14623
D=A // 14624
@SP // 14625
AM=M+1 // 14626
A=A-1 // 14627
M=D // 14628
@ARG // 14629
A=M+1 // 14630
A=A+1 // 14631
A=A+1 // 14632
D=M // 14633
A=A-1 // 14634
A=A-1 // 14635
D=M-D // 14636
@14 // 14637
M=D // 14638
@SP // 14639
AM=M-1 // 14640
D=M // 14641
@13 // 14642
M=D // 14643
@14 // 14644
D=M // 14645
@DO_LT // 14646
0;JMP // 14647
(Screen.drawLine.LT.8)
@14 // 14648
M=D // 14649
@SP // 14650
AM=M-1 // 14651
D=M // 14652
@13 // 14653
M=D // 14654
@14 // 14655
D=M // 14656
@DO_EQ // 14657
0;JMP // 14658
(Screen.drawLine.EQ.7)
@Screen.drawLine.IfElse2 // 14659
D;JNE // 14660

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

D=1 // 14661
@LCL // 14662
A=M+1 // 14663
A=A+1 // 14664
A=A+1 // 14665
M=D // 14666

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 14667
0;JMP // 14668

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

D=-1 // 14669
@LCL // 14670
A=M+1 // 14671
A=A+1 // 14672
A=A+1 // 14673
M=D // 14674

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

@LCL // 14675
A=M+1 // 14676
D=M // 14677
A=A-1 // 14678
D=M-D // 14679
@SP // 14680
AM=M+1 // 14681
A=A-1 // 14682
M=D // 14683
@LCL // 14684
D=M // 14685
@4 // 14686
A=D+A // 14687
D=A // 14688
@R13 // 14689
M=D // 14690
@SP // 14691
AM=M-1 // 14692
D=M // 14693
@R13 // 14694
A=M // 14695
M=D // 14696

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
D=0 // 14697
@WHILE_END_Screen.drawLine1 // 14698
D;JNE // 14699

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 14700
A=M // 14701
D=M // 14702
@SP // 14703
AM=M+1 // 14704
A=A-1 // 14705
M=D // 14706
@ARG // 14707
A=M+1 // 14708
D=M // 14709
@SP // 14710
AM=M+1 // 14711
A=A-1 // 14712
M=D // 14713
// call Screen.drawPixel
@7 // 14714
D=A // 14715
@14 // 14716
M=D // 14717
@Screen.drawPixel // 14718
D=A // 14719
@13 // 14720
M=D // 14721
@Screen.drawLine.ret.2 // 14722
D=A // 14723
@CALL // 14724
0;JMP // 14725
(Screen.drawLine.ret.2)
@SP // 14726
AM=M-1 // 14727
D=M // 14728
@5 // 14729
M=D // 14730

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
@Screen.drawLine.EQ.11 // 14731
D=A // 14732
@SP // 14733
AM=M+1 // 14734
A=A-1 // 14735
M=D // 14736
@Screen.drawLine.EQ.12 // 14737
D=A // 14738
@SP // 14739
AM=M+1 // 14740
A=A-1 // 14741
M=D // 14742
@ARG // 14743
A=M+1 // 14744
A=A+1 // 14745
D=M // 14746
A=A-1 // 14747
A=A-1 // 14748
D=M-D // 14749
@14 // 14750
M=D // 14751
@SP // 14752
AM=M-1 // 14753
D=M // 14754
@13 // 14755
M=D // 14756
@14 // 14757
D=M // 14758
@DO_EQ // 14759
0;JMP // 14760
(Screen.drawLine.EQ.12)
@SP // 14761
AM=M+1 // 14762
A=A-1 // 14763
M=D // 14764
@Screen.drawLine.EQ.13 // 14765
D=A // 14766
@SP // 14767
AM=M+1 // 14768
A=A-1 // 14769
M=D // 14770
@ARG // 14771
A=M+1 // 14772
A=A+1 // 14773
A=A+1 // 14774
D=M // 14775
A=A-1 // 14776
A=A-1 // 14777
D=M-D // 14778
@14 // 14779
M=D // 14780
@SP // 14781
AM=M-1 // 14782
D=M // 14783
@13 // 14784
M=D // 14785
@14 // 14786
D=M // 14787
@DO_EQ // 14788
0;JMP // 14789
(Screen.drawLine.EQ.13)
@SP // 14790
AM=M-1 // 14791
D=D&M // 14792
@14 // 14793
M=D // 14794
@SP // 14795
AM=M-1 // 14796
D=M // 14797
@13 // 14798
M=D // 14799
@14 // 14800
D=M // 14801
@DO_EQ // 14802
0;JMP // 14803
(Screen.drawLine.EQ.11)
@Screen.drawLine.IfElse3 // 14804
D;JNE // 14805

////PushInstruction("constant 0")
@SP // 14806
AM=M+1 // 14807
A=A-1 // 14808
M=0 // 14809

////ReturnInstruction{}
@RETURN // 14810
0;JMP // 14811

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 14812
0;JMP // 14813

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

@LCL // 14814
D=M // 14815
@4 // 14816
A=D+A // 14817
D=M // 14818
D=D+M // 14819
@SP // 14820
AM=M+1 // 14821
A=A-1 // 14822
M=D // 14823
@LCL // 14824
D=M // 14825
@5 // 14826
A=D+A // 14827
D=A // 14828
@R13 // 14829
M=D // 14830
@SP // 14831
AM=M-1 // 14832
D=M // 14833
@R13 // 14834
A=M // 14835
M=D // 14836

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
@Screen.drawLine.EQ.15 // 14837
D=A // 14838
@SP // 14839
AM=M+1 // 14840
A=A-1 // 14841
M=D // 14842
@Screen.drawLine.GT.16 // 14843
D=A // 14844
@SP // 14845
AM=M+1 // 14846
A=A-1 // 14847
M=D // 14848
@LCL // 14849
D=M // 14850
@5 // 14851
A=D+A // 14852
D=M // 14853
@SP // 14854
AM=M+1 // 14855
A=A-1 // 14856
M=D // 14857
@LCL // 14858
A=M+1 // 14859
D=M // 14860
@SP // 14861
AM=M-1 // 14862
D=D+M // 14863
@14 // 14864
M=D // 14865
@SP // 14866
AM=M-1 // 14867
D=M // 14868
@13 // 14869
M=D // 14870
@14 // 14871
D=M // 14872
@DO_GT // 14873
0;JMP // 14874
(Screen.drawLine.GT.16)
@14 // 14875
M=D // 14876
@SP // 14877
AM=M-1 // 14878
D=M // 14879
@13 // 14880
M=D // 14881
@14 // 14882
D=M // 14883
@DO_EQ // 14884
0;JMP // 14885
(Screen.drawLine.EQ.15)
@Screen.drawLine.IfElse4 // 14886
D;JNE // 14887

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

@LCL // 14888
D=M // 14889
@4 // 14890
A=D+A // 14891
D=M // 14892
A=A-1 // 14893
A=A-1 // 14894
A=A-1 // 14895
D=D-M // 14896
@SP // 14897
AM=M+1 // 14898
A=A-1 // 14899
M=D // 14900
@LCL // 14901
D=M // 14902
@4 // 14903
A=D+A // 14904
D=A // 14905
@R13 // 14906
M=D // 14907
@SP // 14908
AM=M-1 // 14909
D=M // 14910
@R13 // 14911
A=M // 14912
M=D // 14913

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

@ARG // 14914
A=M // 14915
D=M // 14916
@SP // 14917
AM=M+1 // 14918
A=A-1 // 14919
M=D // 14920
@LCL // 14921
A=M+1 // 14922
A=A+1 // 14923
D=M // 14924
@SP // 14925
AM=M-1 // 14926
D=D+M // 14927
@ARG // 14928
A=M // 14929
M=D // 14930

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 14931
0;JMP // 14932

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
@Screen.drawLine.EQ.18 // 14933
D=A // 14934
@SP // 14935
AM=M+1 // 14936
A=A-1 // 14937
M=D // 14938
@Screen.drawLine.LT.19 // 14939
D=A // 14940
@SP // 14941
AM=M+1 // 14942
A=A-1 // 14943
M=D // 14944
@LCL // 14945
D=M // 14946
@5 // 14947
A=D+A // 14948
D=M // 14949
@SP // 14950
AM=M+1 // 14951
A=A-1 // 14952
M=D // 14953
@LCL // 14954
A=M // 14955
D=M // 14956
@SP // 14957
AM=M-1 // 14958
D=M-D // 14959
@14 // 14960
M=D // 14961
@SP // 14962
AM=M-1 // 14963
D=M // 14964
@13 // 14965
M=D // 14966
@14 // 14967
D=M // 14968
@DO_LT // 14969
0;JMP // 14970
(Screen.drawLine.LT.19)
@14 // 14971
M=D // 14972
@SP // 14973
AM=M-1 // 14974
D=M // 14975
@13 // 14976
M=D // 14977
@14 // 14978
D=M // 14979
@DO_EQ // 14980
0;JMP // 14981
(Screen.drawLine.EQ.18)
@Screen.drawLine.IfElse5 // 14982
D;JNE // 14983

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

@LCL // 14984
D=M // 14985
@4 // 14986
A=D+A // 14987
D=M // 14988
@SP // 14989
AM=M+1 // 14990
A=A-1 // 14991
M=D // 14992
@LCL // 14993
A=M // 14994
D=M // 14995
@SP // 14996
AM=M-1 // 14997
D=D+M // 14998
@SP // 14999
AM=M+1 // 15000
A=A-1 // 15001
M=D // 15002
@LCL // 15003
D=M // 15004
@4 // 15005
A=D+A // 15006
D=A // 15007
@R13 // 15008
M=D // 15009
@SP // 15010
AM=M-1 // 15011
D=M // 15012
@R13 // 15013
A=M // 15014
M=D // 15015

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

@ARG // 15016
A=M+1 // 15017
D=M // 15018
@SP // 15019
AM=M+1 // 15020
A=A-1 // 15021
M=D // 15022
@LCL // 15023
A=M+1 // 15024
A=A+1 // 15025
A=A+1 // 15026
D=M // 15027
@SP // 15028
AM=M-1 // 15029
D=D+M // 15030
@ARG // 15031
A=M+1 // 15032
M=D // 15033

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 15034
0;JMP // 15035

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 15036
0;JMP // 15037

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 15038
AM=M+1 // 15039
A=A-1 // 15040
M=0 // 15041

////ReturnInstruction{}
@RETURN // 15042
0;JMP // 15043

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 15044
AM=M+1 // 15045
A=A-1 // 15046
M=0 // 15047

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 15048
A=M // 15049
D=M // 15050
@LCL // 15051
A=M // 15052
M=D // 15053

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
@Screen.drawHorizontalLine.EQ.21 // 15054
D=A // 15055
@SP // 15056
AM=M+1 // 15057
A=A-1 // 15058
M=D // 15059
@Screen.drawHorizontalLine.GT.22 // 15060
D=A // 15061
@SP // 15062
AM=M+1 // 15063
A=A-1 // 15064
M=D // 15065
@LCL // 15066
A=M // 15067
D=M // 15068
@SP // 15069
AM=M+1 // 15070
A=A-1 // 15071
M=D // 15072
@ARG // 15073
A=M+1 // 15074
D=M // 15075
@SP // 15076
AM=M-1 // 15077
D=M-D // 15078
@14 // 15079
M=D // 15080
@SP // 15081
AM=M-1 // 15082
D=M // 15083
@13 // 15084
M=D // 15085
@14 // 15086
D=M // 15087
@DO_GT // 15088
0;JMP // 15089
(Screen.drawHorizontalLine.GT.22)
D=!D // 15090
@14 // 15091
M=D // 15092
@SP // 15093
AM=M-1 // 15094
D=M // 15095
@13 // 15096
M=D // 15097
@14 // 15098
D=M // 15099
@DO_EQ // 15100
0;JMP // 15101
(Screen.drawHorizontalLine.EQ.21)
@WHILE_END_Screen.drawHorizontalLine1 // 15102
D;JNE // 15103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15104
A=M // 15105
D=M // 15106
@SP // 15107
AM=M+1 // 15108
A=A-1 // 15109
M=D // 15110
@ARG // 15111
A=M+1 // 15112
A=A+1 // 15113
D=M // 15114
@SP // 15115
AM=M+1 // 15116
A=A-1 // 15117
M=D // 15118
// call Screen.drawPixel
@7 // 15119
D=A // 15120
@14 // 15121
M=D // 15122
@Screen.drawPixel // 15123
D=A // 15124
@13 // 15125
M=D // 15126
@Screen.drawHorizontalLine.ret.0 // 15127
D=A // 15128
@CALL // 15129
0;JMP // 15130
(Screen.drawHorizontalLine.ret.0)
@SP // 15131
AM=M-1 // 15132
D=M // 15133
@5 // 15134
M=D // 15135

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

@LCL // 15136
A=M // 15137
D=M+1 // 15138
@LCL // 15139
A=M // 15140
M=D // 15141

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 15142
0;JMP // 15143

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 15144
AM=M+1 // 15145
A=A-1 // 15146
M=0 // 15147

////ReturnInstruction{}
@RETURN // 15148
0;JMP // 15149

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 15150
AM=M+1 // 15151
A=A-1 // 15152
M=0 // 15153
@SP // 15154
AM=M+1 // 15155
A=A-1 // 15156
M=0 // 15157
@SP // 15158
AM=M+1 // 15159
A=A-1 // 15160
M=0 // 15161
@SP // 15162
AM=M+1 // 15163
A=A-1 // 15164
M=0 // 15165
@SP // 15166
AM=M+1 // 15167
A=A-1 // 15168
M=0 // 15169

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 15170
@LCL // 15171
A=M // 15172
M=D // 15173

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15174
A=M+1 // 15175
A=A+1 // 15176
D=M // 15177
@LCL // 15178
A=M+1 // 15179
M=D // 15180

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

@ARG // 15181
A=M+1 // 15182
A=A+1 // 15183
D=M-1 // 15184
D=-D // 15185
@LCL // 15186
A=M+1 // 15187
A=A+1 // 15188
M=D // 15189

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
@Screen.drawCircle.EQ.24 // 15190
D=A // 15191
@SP // 15192
AM=M+1 // 15193
A=A-1 // 15194
M=D // 15195
@Screen.drawCircle.GT.25 // 15196
D=A // 15197
@SP // 15198
AM=M+1 // 15199
A=A-1 // 15200
M=D // 15201
@LCL // 15202
A=M+1 // 15203
D=M // 15204
A=A-1 // 15205
D=M-D // 15206
@14 // 15207
M=D // 15208
@SP // 15209
AM=M-1 // 15210
D=M // 15211
@13 // 15212
M=D // 15213
@14 // 15214
D=M // 15215
@DO_GT // 15216
0;JMP // 15217
(Screen.drawCircle.GT.25)
D=!D // 15218
@14 // 15219
M=D // 15220
@SP // 15221
AM=M-1 // 15222
D=M // 15223
@13 // 15224
M=D // 15225
@14 // 15226
D=M // 15227
@DO_EQ // 15228
0;JMP // 15229
(Screen.drawCircle.EQ.24)
@WHILE_END_Screen.drawCircle1 // 15230
D;JNE // 15231

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

@ARG // 15232
A=M // 15233
D=M // 15234
@SP // 15235
AM=M+1 // 15236
A=A-1 // 15237
M=D // 15238
@LCL // 15239
A=M // 15240
D=M // 15241
@SP // 15242
AM=M-1 // 15243
D=M-D // 15244
@SP // 15245
AM=M+1 // 15246
A=A-1 // 15247
M=D // 15248
@ARG // 15249
A=M // 15250
D=M // 15251
@SP // 15252
AM=M+1 // 15253
A=A-1 // 15254
M=D // 15255
@LCL // 15256
A=M // 15257
D=M // 15258
@SP // 15259
AM=M-1 // 15260
D=D+M // 15261
@SP // 15262
AM=M+1 // 15263
A=A-1 // 15264
M=D // 15265
@ARG // 15266
A=M+1 // 15267
D=M // 15268
@SP // 15269
AM=M+1 // 15270
A=A-1 // 15271
M=D // 15272
@LCL // 15273
A=M+1 // 15274
D=M // 15275
@SP // 15276
AM=M-1 // 15277
D=D+M // 15278
@SP // 15279
AM=M+1 // 15280
A=A-1 // 15281
M=D // 15282
// call Screen.drawHorizontalLine
@8 // 15283
D=A // 15284
@14 // 15285
M=D // 15286
@Screen.drawHorizontalLine // 15287
D=A // 15288
@13 // 15289
M=D // 15290
@Screen.drawCircle.ret.0 // 15291
D=A // 15292
@CALL // 15293
0;JMP // 15294
(Screen.drawCircle.ret.0)
@SP // 15295
AM=M-1 // 15296
D=M // 15297
@5 // 15298
M=D // 15299

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

@ARG // 15300
A=M // 15301
D=M // 15302
@SP // 15303
AM=M+1 // 15304
A=A-1 // 15305
M=D // 15306
@LCL // 15307
A=M // 15308
D=M // 15309
@SP // 15310
AM=M-1 // 15311
D=M-D // 15312
@SP // 15313
AM=M+1 // 15314
A=A-1 // 15315
M=D // 15316
@ARG // 15317
A=M // 15318
D=M // 15319
@SP // 15320
AM=M+1 // 15321
A=A-1 // 15322
M=D // 15323
@LCL // 15324
A=M // 15325
D=M // 15326
@SP // 15327
AM=M-1 // 15328
D=D+M // 15329
@SP // 15330
AM=M+1 // 15331
A=A-1 // 15332
M=D // 15333
@ARG // 15334
A=M+1 // 15335
D=M // 15336
@SP // 15337
AM=M+1 // 15338
A=A-1 // 15339
M=D // 15340
@LCL // 15341
A=M+1 // 15342
D=M // 15343
@SP // 15344
AM=M-1 // 15345
D=M-D // 15346
@SP // 15347
AM=M+1 // 15348
A=A-1 // 15349
M=D // 15350
// call Screen.drawHorizontalLine
@8 // 15351
D=A // 15352
@14 // 15353
M=D // 15354
@Screen.drawHorizontalLine // 15355
D=A // 15356
@13 // 15357
M=D // 15358
@Screen.drawCircle.ret.1 // 15359
D=A // 15360
@CALL // 15361
0;JMP // 15362
(Screen.drawCircle.ret.1)
@SP // 15363
AM=M-1 // 15364
D=M // 15365
@5 // 15366
M=D // 15367

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

@ARG // 15368
A=M // 15369
D=M // 15370
@SP // 15371
AM=M+1 // 15372
A=A-1 // 15373
M=D // 15374
@LCL // 15375
A=M+1 // 15376
D=M // 15377
@SP // 15378
AM=M-1 // 15379
D=M-D // 15380
@SP // 15381
AM=M+1 // 15382
A=A-1 // 15383
M=D // 15384
@ARG // 15385
A=M // 15386
D=M // 15387
@SP // 15388
AM=M+1 // 15389
A=A-1 // 15390
M=D // 15391
@LCL // 15392
A=M+1 // 15393
D=M // 15394
@SP // 15395
AM=M-1 // 15396
D=D+M // 15397
@SP // 15398
AM=M+1 // 15399
A=A-1 // 15400
M=D // 15401
@ARG // 15402
A=M+1 // 15403
D=M // 15404
@SP // 15405
AM=M+1 // 15406
A=A-1 // 15407
M=D // 15408
@LCL // 15409
A=M // 15410
D=M // 15411
@SP // 15412
AM=M-1 // 15413
D=D+M // 15414
@SP // 15415
AM=M+1 // 15416
A=A-1 // 15417
M=D // 15418
// call Screen.drawHorizontalLine
@8 // 15419
D=A // 15420
@14 // 15421
M=D // 15422
@Screen.drawHorizontalLine // 15423
D=A // 15424
@13 // 15425
M=D // 15426
@Screen.drawCircle.ret.2 // 15427
D=A // 15428
@CALL // 15429
0;JMP // 15430
(Screen.drawCircle.ret.2)
@SP // 15431
AM=M-1 // 15432
D=M // 15433
@5 // 15434
M=D // 15435

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

@ARG // 15436
A=M // 15437
D=M // 15438
@SP // 15439
AM=M+1 // 15440
A=A-1 // 15441
M=D // 15442
@LCL // 15443
A=M+1 // 15444
D=M // 15445
@SP // 15446
AM=M-1 // 15447
D=M-D // 15448
@SP // 15449
AM=M+1 // 15450
A=A-1 // 15451
M=D // 15452
@ARG // 15453
A=M // 15454
D=M // 15455
@SP // 15456
AM=M+1 // 15457
A=A-1 // 15458
M=D // 15459
@LCL // 15460
A=M+1 // 15461
D=M // 15462
@SP // 15463
AM=M-1 // 15464
D=D+M // 15465
@SP // 15466
AM=M+1 // 15467
A=A-1 // 15468
M=D // 15469
@ARG // 15470
A=M+1 // 15471
D=M // 15472
@SP // 15473
AM=M+1 // 15474
A=A-1 // 15475
M=D // 15476
@LCL // 15477
A=M // 15478
D=M // 15479
@SP // 15480
AM=M-1 // 15481
D=M-D // 15482
@SP // 15483
AM=M+1 // 15484
A=A-1 // 15485
M=D // 15486
// call Screen.drawHorizontalLine
@8 // 15487
D=A // 15488
@14 // 15489
M=D // 15490
@Screen.drawHorizontalLine // 15491
D=A // 15492
@13 // 15493
M=D // 15494
@Screen.drawCircle.ret.3 // 15495
D=A // 15496
@CALL // 15497
0;JMP // 15498
(Screen.drawCircle.ret.3)
@SP // 15499
AM=M-1 // 15500
D=M // 15501
@5 // 15502
M=D // 15503

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
@Screen.drawCircle.EQ.27 // 15504
D=A // 15505
@SP // 15506
AM=M+1 // 15507
A=A-1 // 15508
M=D // 15509
@Screen.drawCircle.LT.28 // 15510
D=A // 15511
@SP // 15512
AM=M+1 // 15513
A=A-1 // 15514
M=D // 15515
@LCL // 15516
A=M+1 // 15517
A=A+1 // 15518
D=M // 15519
@14 // 15520
M=D // 15521
@SP // 15522
AM=M-1 // 15523
D=M // 15524
@13 // 15525
M=D // 15526
@14 // 15527
D=M // 15528
@DO_LT // 15529
0;JMP // 15530
(Screen.drawCircle.LT.28)
@14 // 15531
M=D // 15532
@SP // 15533
AM=M-1 // 15534
D=M // 15535
@13 // 15536
M=D // 15537
@14 // 15538
D=M // 15539
@DO_EQ // 15540
0;JMP // 15541
(Screen.drawCircle.EQ.27)
@Screen.drawCircle.IfElse1 // 15542
D;JNE // 15543

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

@LCL // 15544
A=M+1 // 15545
A=A+1 // 15546
D=M // 15547
@SP // 15548
AM=M+1 // 15549
A=A-1 // 15550
M=D // 15551
@LCL // 15552
A=M // 15553
D=M // 15554
D=D+M // 15555
@SP // 15556
AM=M-1 // 15557
D=D+M // 15558
@3 // 15559
D=D+A // 15560
@LCL // 15561
A=M+1 // 15562
A=A+1 // 15563
M=D // 15564

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 15565
0;JMP // 15566

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

@LCL // 15567
A=M+1 // 15568
A=A+1 // 15569
D=M // 15570
@SP // 15571
AM=M+1 // 15572
A=A-1 // 15573
M=D // 15574
@LCL // 15575
A=M+1 // 15576
D=M // 15577
A=A-1 // 15578
D=M-D // 15579
@R13 // 15580
M=D // 15581
D=D+M // 15582
@SP // 15583
AM=M-1 // 15584
D=D+M // 15585
@5 // 15586
D=D+A // 15587
@LCL // 15588
A=M+1 // 15589
A=A+1 // 15590
M=D // 15591

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

@LCL // 15592
A=M+1 // 15593
D=M-1 // 15594
@LCL // 15595
A=M+1 // 15596
M=D // 15597

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

@LCL // 15598
A=M // 15599
D=M+1 // 15600
@LCL // 15601
A=M // 15602
M=D // 15603

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 15604
0;JMP // 15605

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 15606
AM=M+1 // 15607
A=A-1 // 15608
M=0 // 15609

////ReturnInstruction{}
@RETURN // 15610
0;JMP // 15611

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 15612
AM=M+1 // 15613
A=A-1 // 15614
M=0 // 15615
@SP // 15616
AM=M+1 // 15617
A=A-1 // 15618
M=0 // 15619
@SP // 15620
AM=M+1 // 15621
A=A-1 // 15622
M=0 // 15623
@SP // 15624
AM=M+1 // 15625
A=A-1 // 15626
M=0 // 15627
@SP // 15628
AM=M+1 // 15629
A=A-1 // 15630
M=0 // 15631
@SP // 15632
AM=M+1 // 15633
A=A-1 // 15634
M=0 // 15635
@SP // 15636
AM=M+1 // 15637
A=A-1 // 15638
M=0 // 15639
@SP // 15640
AM=M+1 // 15641
A=A-1 // 15642
M=0 // 15643
@SP // 15644
AM=M+1 // 15645
A=A-1 // 15646
M=0 // 15647
@SP // 15648
AM=M+1 // 15649
A=A-1 // 15650
M=0 // 15651

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@SP // 15652
AM=M+1 // 15653
A=A-1 // 15654
M=-1 // 15655
@LCL // 15656
D=M // 15657
@9 // 15658
A=D+A // 15659
D=A // 15660
@R13 // 15661
M=D // 15662
@SP // 15663
AM=M-1 // 15664
D=M // 15665
@R13 // 15666
A=M // 15667
M=D // 15668

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.29 // 15669
D=A // 15670
@SP // 15671
AM=M+1 // 15672
A=A-1 // 15673
M=D // 15674
@Screen.0 // 15675
D=!M // 15676
@14 // 15677
M=D // 15678
@SP // 15679
AM=M-1 // 15680
D=M // 15681
@13 // 15682
M=D // 15683
@14 // 15684
D=M // 15685
@DO_EQ // 15686
0;JMP // 15687
(Screen.drawRectangle.EQ.29)
@Screen.drawRectangle.IfElse1 // 15688
D;JNE // 15689

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@SP // 15690
AM=M+1 // 15691
A=A-1 // 15692
M=0 // 15693
@LCL // 15694
D=M // 15695
@9 // 15696
A=D+A // 15697
D=A // 15698
@R13 // 15699
M=D // 15700
@SP // 15701
AM=M-1 // 15702
D=M // 15703
@R13 // 15704
A=M // 15705
M=D // 15706

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 15707
0;JMP // 15708

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

@ARG // 15709
A=M+1 // 15710
D=M // 15711
@LCL // 15712
A=M // 15713
M=D // 15714

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
@Screen.drawRectangle.EQ.31 // 15715
D=A // 15716
@SP // 15717
AM=M+1 // 15718
A=A-1 // 15719
M=D // 15720
@Screen.drawRectangle.GT.32 // 15721
D=A // 15722
@SP // 15723
AM=M+1 // 15724
A=A-1 // 15725
M=D // 15726
@LCL // 15727
A=M // 15728
D=M // 15729
@SP // 15730
AM=M+1 // 15731
A=A-1 // 15732
M=D // 15733
@ARG // 15734
A=M+1 // 15735
A=A+1 // 15736
A=A+1 // 15737
D=M // 15738
@SP // 15739
AM=M-1 // 15740
D=M-D // 15741
@14 // 15742
M=D // 15743
@SP // 15744
AM=M-1 // 15745
D=M // 15746
@13 // 15747
M=D // 15748
@14 // 15749
D=M // 15750
@DO_GT // 15751
0;JMP // 15752
(Screen.drawRectangle.GT.32)
D=!D // 15753
@14 // 15754
M=D // 15755
@SP // 15756
AM=M-1 // 15757
D=M // 15758
@13 // 15759
M=D // 15760
@14 // 15761
D=M // 15762
@DO_EQ // 15763
0;JMP // 15764
(Screen.drawRectangle.EQ.31)
@WHILE_END_Screen.drawRectangle1 // 15765
D;JNE // 15766

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15767
A=M // 15768
D=M // 15769
@SP // 15770
AM=M+1 // 15771
A=A-1 // 15772
M=D // 15773
@16 // 15774
D=A // 15775
@SP // 15776
AM=M+1 // 15777
A=A-1 // 15778
M=D // 15779
// call Math.divide
@7 // 15780
D=A // 15781
@14 // 15782
M=D // 15783
@Math.divide // 15784
D=A // 15785
@13 // 15786
M=D // 15787
@Screen.drawRectangle.ret.0 // 15788
D=A // 15789
@CALL // 15790
0;JMP // 15791
(Screen.drawRectangle.ret.0)
@SP // 15792
AM=M-1 // 15793
D=M // 15794
@LCL // 15795
A=M+1 // 15796
M=D // 15797

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15798
A=M+1 // 15799
A=A+1 // 15800
D=M // 15801
@SP // 15802
AM=M+1 // 15803
A=A-1 // 15804
M=D // 15805
@16 // 15806
D=A // 15807
@SP // 15808
AM=M+1 // 15809
A=A-1 // 15810
M=D // 15811
// call Math.divide
@7 // 15812
D=A // 15813
@14 // 15814
M=D // 15815
@Math.divide // 15816
D=A // 15817
@13 // 15818
M=D // 15819
@Screen.drawRectangle.ret.1 // 15820
D=A // 15821
@CALL // 15822
0;JMP // 15823
(Screen.drawRectangle.ret.1)
@SP // 15824
AM=M-1 // 15825
D=M // 15826
@LCL // 15827
A=M+1 // 15828
A=A+1 // 15829
M=D // 15830

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

@ARG // 15831
A=M // 15832
D=M // 15833
@15 // 15834
D=D&A // 15835
@LCL // 15836
A=M+1 // 15837
A=A+1 // 15838
A=A+1 // 15839
M=D // 15840

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

@ARG // 15841
A=M+1 // 15842
A=A+1 // 15843
D=M // 15844
@15 // 15845
D=D&A // 15846
@SP // 15847
AM=M+1 // 15848
A=A-1 // 15849
M=D // 15850
@LCL // 15851
D=M // 15852
@4 // 15853
A=D+A // 15854
D=A // 15855
@R13 // 15856
M=D // 15857
@SP // 15858
AM=M-1 // 15859
D=M // 15860
@R13 // 15861
A=M // 15862
M=D // 15863

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15864
A=M // 15865
D=M // 15866
@SP // 15867
AM=M+1 // 15868
A=A-1 // 15869
M=D // 15870
@32 // 15871
D=A // 15872
@SP // 15873
AM=M+1 // 15874
A=A-1 // 15875
M=D // 15876
// call Math.multiply
@7 // 15877
D=A // 15878
@14 // 15879
M=D // 15880
@Math.multiply // 15881
D=A // 15882
@13 // 15883
M=D // 15884
@Screen.drawRectangle.ret.2 // 15885
D=A // 15886
@CALL // 15887
0;JMP // 15888
(Screen.drawRectangle.ret.2)
@LCL // 15889
D=M // 15890
@5 // 15891
A=D+A // 15892
D=A // 15893
@R13 // 15894
M=D // 15895
@SP // 15896
AM=M-1 // 15897
D=M // 15898
@R13 // 15899
A=M // 15900
M=D // 15901

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
@Screen.drawRectangle.EQ.34 // 15902
D=A // 15903
@SP // 15904
AM=M+1 // 15905
A=A-1 // 15906
M=D // 15907
@Screen.drawRectangle.EQ.35 // 15908
D=A // 15909
@SP // 15910
AM=M+1 // 15911
A=A-1 // 15912
M=D // 15913
@LCL // 15914
A=M+1 // 15915
A=A+1 // 15916
D=M // 15917
A=A-1 // 15918
D=M-D // 15919
@14 // 15920
M=D // 15921
@SP // 15922
AM=M-1 // 15923
D=M // 15924
@13 // 15925
M=D // 15926
@14 // 15927
D=M // 15928
@DO_EQ // 15929
0;JMP // 15930
(Screen.drawRectangle.EQ.35)
@14 // 15931
M=D // 15932
@SP // 15933
AM=M-1 // 15934
D=M // 15935
@13 // 15936
M=D // 15937
@14 // 15938
D=M // 15939
@DO_EQ // 15940
0;JMP // 15941
(Screen.drawRectangle.EQ.34)
@Screen.drawRectangle.IfElse2 // 15942
D;JNE // 15943

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

@LCL // 15944
D=M // 15945
@4 // 15946
A=D+A // 15947
D=M // 15948
@SP // 15949
AM=M+1 // 15950
A=A-1 // 15951
M=D+1 // 15952
// call Math.twoToThe
@6 // 15953
D=A // 15954
@14 // 15955
M=D // 15956
@Math.twoToThe // 15957
D=A // 15958
@13 // 15959
M=D // 15960
@Screen.drawRectangle.ret.3 // 15961
D=A // 15962
@CALL // 15963
0;JMP // 15964
(Screen.drawRectangle.ret.3)
@SP // 15965
AM=M-1 // 15966
D=M // 15967
D=M-1 // 15968
@SP // 15969
AM=M+1 // 15970
A=A-1 // 15971
M=D // 15972
@LCL // 15973
A=M+1 // 15974
A=A+1 // 15975
A=A+1 // 15976
D=M // 15977
@SP // 15978
AM=M+1 // 15979
A=A-1 // 15980
M=D // 15981
// call Math.twoToThe
@6 // 15982
D=A // 15983
@14 // 15984
M=D // 15985
@Math.twoToThe // 15986
D=A // 15987
@13 // 15988
M=D // 15989
@Screen.drawRectangle.ret.4 // 15990
D=A // 15991
@CALL // 15992
0;JMP // 15993
(Screen.drawRectangle.ret.4)
@SP // 15994
AM=M-1 // 15995
D=M // 15996
D=M-1 // 15997
@SP // 15998
AM=M-1 // 15999
D=M-D // 16000
@SP // 16001
AM=M+1 // 16002
A=A-1 // 16003
M=D // 16004
@LCL // 16005
D=M // 16006
@6 // 16007
A=D+A // 16008
D=A // 16009
@R13 // 16010
M=D // 16011
@SP // 16012
AM=M-1 // 16013
D=M // 16014
@R13 // 16015
A=M // 16016
M=D // 16017

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

@LCL // 16018
D=M // 16019
@5 // 16020
A=D+A // 16021
D=M // 16022
@SP // 16023
AM=M+1 // 16024
A=A-1 // 16025
M=D // 16026
@LCL // 16027
A=M+1 // 16028
D=M // 16029
@SP // 16030
AM=M-1 // 16031
D=D+M // 16032
@SP // 16033
AM=M+1 // 16034
A=A-1 // 16035
M=D // 16036
@LCL // 16037
D=M // 16038
@7 // 16039
A=D+A // 16040
D=A // 16041
@R13 // 16042
M=D // 16043
@SP // 16044
AM=M-1 // 16045
D=M // 16046
@R13 // 16047
A=M // 16048
M=D // 16049

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.36 // 16050
D=A // 16051
@SP // 16052
AM=M+1 // 16053
A=A-1 // 16054
M=D // 16055
@Screen.0 // 16056
D=M // 16057
@14 // 16058
M=D // 16059
@SP // 16060
AM=M-1 // 16061
D=M // 16062
@13 // 16063
M=D // 16064
@14 // 16065
D=M // 16066
@DO_EQ // 16067
0;JMP // 16068
(Screen.drawRectangle.EQ.36)
@Screen.drawRectangle.IfElse3 // 16069
D;JNE // 16070

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
@LCL // 16071
D=M // 16072
@7 // 16073
A=D+A // 16074
D=M // 16075
@16384 // 16076
D=D+A // 16077
@SP // 16078
AM=M+1 // 16079
A=A-1 // 16080
M=D // 16081
@LCL // 16082
D=M // 16083
@7 // 16084
A=D+A // 16085
D=M // 16086
@16384 // 16087
A=D+A // 16088
D=M // 16089
@SP // 16090
AM=M+1 // 16091
A=A-1 // 16092
M=D // 16093
@LCL // 16094
D=M // 16095
@6 // 16096
A=D+A // 16097
D=M // 16098
@SP // 16099
AM=M-1 // 16100
D=D|M // 16101
@SP // 16102
AM=M-1 // 16103
A=M // 16104
M=D // 16105

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 16106
0;JMP // 16107

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
@LCL // 16108
D=M // 16109
@7 // 16110
A=D+A // 16111
D=M // 16112
@16384 // 16113
D=D+A // 16114
@SP // 16115
AM=M+1 // 16116
A=A-1 // 16117
M=D // 16118
@LCL // 16119
D=M // 16120
@7 // 16121
A=D+A // 16122
D=M // 16123
@16384 // 16124
A=D+A // 16125
D=M // 16126
@SP // 16127
AM=M+1 // 16128
A=A-1 // 16129
M=D // 16130
@LCL // 16131
D=M // 16132
@6 // 16133
A=D+A // 16134
D=!M // 16135
@SP // 16136
AM=M-1 // 16137
D=D&M // 16138
@SP // 16139
AM=M-1 // 16140
A=M // 16141
M=D // 16142

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 16143
0;JMP // 16144

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

@LCL // 16145
A=M+1 // 16146
A=A+1 // 16147
A=A+1 // 16148
D=M // 16149
@SP // 16150
AM=M+1 // 16151
A=A-1 // 16152
M=D // 16153
// call Math.twoToThe
@6 // 16154
D=A // 16155
@14 // 16156
M=D // 16157
@Math.twoToThe // 16158
D=A // 16159
@13 // 16160
M=D // 16161
@Screen.drawRectangle.ret.5 // 16162
D=A // 16163
@CALL // 16164
0;JMP // 16165
(Screen.drawRectangle.ret.5)
@SP // 16166
AM=M-1 // 16167
D=M // 16168
D=M-1 // 16169
@SP // 16170
AM=M+1 // 16171
A=A-1 // 16172
M=D // 16173
@SP // 16174
A=M-1 // 16175
M=!D // 16176
@LCL // 16177
D=M // 16178
@6 // 16179
A=D+A // 16180
D=A // 16181
@R13 // 16182
M=D // 16183
@SP // 16184
AM=M-1 // 16185
D=M // 16186
@R13 // 16187
A=M // 16188
M=D // 16189

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

@LCL // 16190
D=M // 16191
@5 // 16192
A=D+A // 16193
D=M // 16194
@SP // 16195
AM=M+1 // 16196
A=A-1 // 16197
M=D // 16198
@LCL // 16199
A=M+1 // 16200
D=M // 16201
@SP // 16202
AM=M-1 // 16203
D=D+M // 16204
@SP // 16205
AM=M+1 // 16206
A=A-1 // 16207
M=D // 16208
@LCL // 16209
D=M // 16210
@7 // 16211
A=D+A // 16212
D=A // 16213
@R13 // 16214
M=D // 16215
@SP // 16216
AM=M-1 // 16217
D=M // 16218
@R13 // 16219
A=M // 16220
M=D // 16221

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.37 // 16222
D=A // 16223
@SP // 16224
AM=M+1 // 16225
A=A-1 // 16226
M=D // 16227
@Screen.0 // 16228
D=M // 16229
@14 // 16230
M=D // 16231
@SP // 16232
AM=M-1 // 16233
D=M // 16234
@13 // 16235
M=D // 16236
@14 // 16237
D=M // 16238
@DO_EQ // 16239
0;JMP // 16240
(Screen.drawRectangle.EQ.37)
@Screen.drawRectangle.IfElse4 // 16241
D;JNE // 16242

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
@LCL // 16243
D=M // 16244
@7 // 16245
A=D+A // 16246
D=M // 16247
@16384 // 16248
D=D+A // 16249
@SP // 16250
AM=M+1 // 16251
A=A-1 // 16252
M=D // 16253
@LCL // 16254
D=M // 16255
@7 // 16256
A=D+A // 16257
D=M // 16258
@16384 // 16259
A=D+A // 16260
D=M // 16261
@SP // 16262
AM=M+1 // 16263
A=A-1 // 16264
M=D // 16265
@LCL // 16266
D=M // 16267
@6 // 16268
A=D+A // 16269
D=M // 16270
@SP // 16271
AM=M-1 // 16272
D=D|M // 16273
@SP // 16274
AM=M-1 // 16275
A=M // 16276
M=D // 16277

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 16278
0;JMP // 16279

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
@LCL // 16280
D=M // 16281
@7 // 16282
A=D+A // 16283
D=M // 16284
@16384 // 16285
D=D+A // 16286
@SP // 16287
AM=M+1 // 16288
A=A-1 // 16289
M=D // 16290
@LCL // 16291
D=M // 16292
@7 // 16293
A=D+A // 16294
D=M // 16295
@16384 // 16296
A=D+A // 16297
D=M // 16298
@SP // 16299
AM=M+1 // 16300
A=A-1 // 16301
M=D // 16302
@LCL // 16303
D=M // 16304
@6 // 16305
A=D+A // 16306
D=!M // 16307
@SP // 16308
AM=M-1 // 16309
D=D&M // 16310
@SP // 16311
AM=M-1 // 16312
A=M // 16313
M=D // 16314

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

@LCL // 16315
A=M+1 // 16316
D=M // 16317
@SP // 16318
AM=M+1 // 16319
A=A-1 // 16320
M=D+1 // 16321
@LCL // 16322
D=M // 16323
@8 // 16324
A=D+A // 16325
D=A // 16326
@R13 // 16327
M=D // 16328
@SP // 16329
AM=M-1 // 16330
D=M // 16331
@R13 // 16332
A=M // 16333
M=D // 16334

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
@Screen.drawRectangle.EQ.39 // 16335
D=A // 16336
@SP // 16337
AM=M+1 // 16338
A=A-1 // 16339
M=D // 16340
@Screen.drawRectangle.LT.40 // 16341
D=A // 16342
@SP // 16343
AM=M+1 // 16344
A=A-1 // 16345
M=D // 16346
@LCL // 16347
D=M // 16348
@8 // 16349
A=D+A // 16350
D=M // 16351
@SP // 16352
AM=M+1 // 16353
A=A-1 // 16354
M=D // 16355
@LCL // 16356
A=M+1 // 16357
A=A+1 // 16358
D=M // 16359
@SP // 16360
AM=M-1 // 16361
D=M-D // 16362
@14 // 16363
M=D // 16364
@SP // 16365
AM=M-1 // 16366
D=M // 16367
@13 // 16368
M=D // 16369
@14 // 16370
D=M // 16371
@DO_LT // 16372
0;JMP // 16373
(Screen.drawRectangle.LT.40)
@14 // 16374
M=D // 16375
@SP // 16376
AM=M-1 // 16377
D=M // 16378
@13 // 16379
M=D // 16380
@14 // 16381
D=M // 16382
@DO_EQ // 16383
0;JMP // 16384
(Screen.drawRectangle.EQ.39)
@WHILE_END_Screen.drawRectangle2 // 16385
D;JNE // 16386

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

@LCL // 16387
D=M // 16388
@8 // 16389
A=D+A // 16390
D=M // 16391
A=A-1 // 16392
A=A-1 // 16393
A=A-1 // 16394
D=D+M // 16395
@SP // 16396
AM=M+1 // 16397
A=A-1 // 16398
M=D // 16399
@LCL // 16400
D=M // 16401
@7 // 16402
A=D+A // 16403
D=A // 16404
@R13 // 16405
M=D // 16406
@SP // 16407
AM=M-1 // 16408
D=M // 16409
@R13 // 16410
A=M // 16411
M=D // 16412

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 16413
D=M // 16414
@7 // 16415
A=D+A // 16416
D=M // 16417
@16384 // 16418
D=D+A // 16419
@SP // 16420
AM=M+1 // 16421
A=A-1 // 16422
M=D // 16423
@LCL // 16424
D=M // 16425
@9 // 16426
A=D+A // 16427
D=M // 16428
@SP // 16429
AM=M-1 // 16430
A=M // 16431
M=D // 16432

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

@LCL // 16433
D=M // 16434
@8 // 16435
A=D+A // 16436
D=M // 16437
@SP // 16438
AM=M+1 // 16439
A=A-1 // 16440
M=D+1 // 16441
@LCL // 16442
D=M // 16443
@8 // 16444
A=D+A // 16445
D=A // 16446
@R13 // 16447
M=D // 16448
@SP // 16449
AM=M-1 // 16450
D=M // 16451
@R13 // 16452
A=M // 16453
M=D // 16454

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 16455
0;JMP // 16456

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

@LCL // 16457
D=M // 16458
@4 // 16459
A=D+A // 16460
D=M // 16461
@SP // 16462
AM=M+1 // 16463
A=A-1 // 16464
M=D+1 // 16465
// call Math.twoToThe
@6 // 16466
D=A // 16467
@14 // 16468
M=D // 16469
@Math.twoToThe // 16470
D=A // 16471
@13 // 16472
M=D // 16473
@Screen.drawRectangle.ret.6 // 16474
D=A // 16475
@CALL // 16476
0;JMP // 16477
(Screen.drawRectangle.ret.6)
@SP // 16478
AM=M-1 // 16479
D=M // 16480
D=M-1 // 16481
@SP // 16482
AM=M+1 // 16483
A=A-1 // 16484
M=D // 16485
@LCL // 16486
D=M // 16487
@6 // 16488
A=D+A // 16489
D=A // 16490
@R13 // 16491
M=D // 16492
@SP // 16493
AM=M-1 // 16494
D=M // 16495
@R13 // 16496
A=M // 16497
M=D // 16498

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

@LCL // 16499
D=M // 16500
@5 // 16501
A=D+A // 16502
D=M // 16503
A=A-1 // 16504
A=A-1 // 16505
A=A-1 // 16506
D=D+M // 16507
@SP // 16508
AM=M+1 // 16509
A=A-1 // 16510
M=D // 16511
@LCL // 16512
D=M // 16513
@7 // 16514
A=D+A // 16515
D=A // 16516
@R13 // 16517
M=D // 16518
@SP // 16519
AM=M-1 // 16520
D=M // 16521
@R13 // 16522
A=M // 16523
M=D // 16524

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.41 // 16525
D=A // 16526
@SP // 16527
AM=M+1 // 16528
A=A-1 // 16529
M=D // 16530
@Screen.0 // 16531
D=M // 16532
@14 // 16533
M=D // 16534
@SP // 16535
AM=M-1 // 16536
D=M // 16537
@13 // 16538
M=D // 16539
@14 // 16540
D=M // 16541
@DO_EQ // 16542
0;JMP // 16543
(Screen.drawRectangle.EQ.41)
@Screen.drawRectangle.IfElse5 // 16544
D;JNE // 16545

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
@LCL // 16546
D=M // 16547
@7 // 16548
A=D+A // 16549
D=M // 16550
@16384 // 16551
D=D+A // 16552
@SP // 16553
AM=M+1 // 16554
A=A-1 // 16555
M=D // 16556
@LCL // 16557
D=M // 16558
@7 // 16559
A=D+A // 16560
D=M // 16561
@16384 // 16562
A=D+A // 16563
D=M // 16564
@SP // 16565
AM=M+1 // 16566
A=A-1 // 16567
M=D // 16568
@LCL // 16569
D=M // 16570
@6 // 16571
A=D+A // 16572
D=M // 16573
@SP // 16574
AM=M-1 // 16575
D=D|M // 16576
@SP // 16577
AM=M-1 // 16578
A=M // 16579
M=D // 16580

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 16581
0;JMP // 16582

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
@LCL // 16583
D=M // 16584
@7 // 16585
A=D+A // 16586
D=M // 16587
@16384 // 16588
D=D+A // 16589
@SP // 16590
AM=M+1 // 16591
A=A-1 // 16592
M=D // 16593
@LCL // 16594
D=M // 16595
@7 // 16596
A=D+A // 16597
D=M // 16598
@16384 // 16599
A=D+A // 16600
D=M // 16601
@SP // 16602
AM=M+1 // 16603
A=A-1 // 16604
M=D // 16605
@LCL // 16606
D=M // 16607
@6 // 16608
A=D+A // 16609
D=!M // 16610
@SP // 16611
AM=M-1 // 16612
D=D&M // 16613
@SP // 16614
AM=M-1 // 16615
A=M // 16616
M=D // 16617

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

@LCL // 16618
A=M // 16619
D=M+1 // 16620
@LCL // 16621
A=M // 16622
M=D // 16623

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 16624
0;JMP // 16625

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 16626
AM=M+1 // 16627
A=A-1 // 16628
M=0 // 16629

////ReturnInstruction{}
@RETURN // 16630
0;JMP // 16631

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=6}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 16632
AM=M+1 // 16633
A=A-1 // 16634
M=0 // 16635

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 16636
@LCL // 16637
A=M // 16638
M=D // 16639

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
@Screen.clearScreen.EQ.43 // 16640
D=A // 16641
@SP // 16642
AM=M+1 // 16643
A=A-1 // 16644
M=D // 16645
@Screen.clearScreen.LT.44 // 16646
D=A // 16647
@SP // 16648
AM=M+1 // 16649
A=A-1 // 16650
M=D // 16651
@LCL // 16652
A=M // 16653
D=M // 16654
@8192 // 16655
D=D-A // 16656
@14 // 16657
M=D // 16658
@SP // 16659
AM=M-1 // 16660
D=M // 16661
@13 // 16662
M=D // 16663
@14 // 16664
D=M // 16665
@DO_LT // 16666
0;JMP // 16667
(Screen.clearScreen.LT.44)
@14 // 16668
M=D // 16669
@SP // 16670
AM=M-1 // 16671
D=M // 16672
@13 // 16673
M=D // 16674
@14 // 16675
D=M // 16676
@DO_EQ // 16677
0;JMP // 16678
(Screen.clearScreen.EQ.43)
@WHILE_END_Screen.clearScreen1 // 16679
D;JNE // 16680

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 16681
A=M // 16682
D=M // 16683
@16384 // 16684
D=D+A // 16685
@SP // 16686
AM=M+1 // 16687
A=A-1 // 16688
M=D // 16689
D=0 // 16690
@SP // 16691
AM=M-1 // 16692
A=M // 16693
M=D // 16694

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

@LCL // 16695
A=M // 16696
D=M+1 // 16697
@LCL // 16698
A=M // 16699
M=D // 16700

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 16701
0;JMP // 16702

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 16703
AM=M+1 // 16704
A=A-1 // 16705
M=0 // 16706

////ReturnInstruction{}
@RETURN // 16707
0;JMP // 16708

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 16709
D=A // 16710
@SP // 16711
AM=M+1 // 16712
A=A-1 // 16713
M=D // 16714
// call Memory.alloc
@6 // 16715
D=A // 16716
@14 // 16717
M=D // 16718
@Memory.alloc // 16719
D=A // 16720
@13 // 16721
M=D // 16722
@String.new.ret.0 // 16723
D=A // 16724
@CALL // 16725
0;JMP // 16726
(String.new.ret.0)
@SP // 16727
AM=M-1 // 16728
D=M // 16729
@3 // 16730
M=D // 16731

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
@String.new.EQ.1 // 16732
D=A // 16733
@SP // 16734
AM=M+1 // 16735
A=A-1 // 16736
M=D // 16737
@String.new.EQ.2 // 16738
D=A // 16739
@SP // 16740
AM=M+1 // 16741
A=A-1 // 16742
M=D // 16743
@ARG // 16744
A=M // 16745
D=M // 16746
@14 // 16747
M=D // 16748
@SP // 16749
AM=M-1 // 16750
D=M // 16751
@13 // 16752
M=D // 16753
@14 // 16754
D=M // 16755
@DO_EQ // 16756
0;JMP // 16757
(String.new.EQ.2)
@14 // 16758
M=D // 16759
@SP // 16760
AM=M-1 // 16761
D=M // 16762
@13 // 16763
M=D // 16764
@14 // 16765
D=M // 16766
@DO_EQ // 16767
0;JMP // 16768
(String.new.EQ.1)
@String.new.IfElse1 // 16769
D;JNE // 16770

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

D=0 // 16771
@THIS // 16772
A=M // 16773
M=D // 16774

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 16775
0;JMP // 16776

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 16777
A=M // 16778
D=M // 16779
@SP // 16780
AM=M+1 // 16781
A=A-1 // 16782
M=D // 16783
// call Array.new
@6 // 16784
D=A // 16785
@14 // 16786
M=D // 16787
@Array.new // 16788
D=A // 16789
@13 // 16790
M=D // 16791
@String.new.ret.1 // 16792
D=A // 16793
@CALL // 16794
0;JMP // 16795
(String.new.ret.1)
@SP // 16796
AM=M-1 // 16797
D=M // 16798
@THIS // 16799
A=M // 16800
M=D // 16801

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 16802
A=M // 16803
D=M // 16804
@THIS // 16805
A=M+1 // 16806
A=A+1 // 16807
M=D // 16808

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

D=0 // 16809
@THIS // 16810
A=M+1 // 16811
M=D // 16812

////PushInstruction("pointer 0")
@3 // 16813
D=M // 16814
@SP // 16815
AM=M+1 // 16816
A=A-1 // 16817
M=D // 16818

////ReturnInstruction{}
@RETURN // 16819
0;JMP // 16820

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16821
A=M // 16822
D=M // 16823
@3 // 16824
M=D // 16825

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
@String.dispose.EQ.4 // 16826
D=A // 16827
@SP // 16828
AM=M+1 // 16829
A=A-1 // 16830
M=D // 16831
@String.dispose.EQ.5 // 16832
D=A // 16833
@SP // 16834
AM=M+1 // 16835
A=A-1 // 16836
M=D // 16837
@THIS // 16838
A=M // 16839
D=M // 16840
@14 // 16841
M=D // 16842
@SP // 16843
AM=M-1 // 16844
D=M // 16845
@13 // 16846
M=D // 16847
@14 // 16848
D=M // 16849
@DO_EQ // 16850
0;JMP // 16851
(String.dispose.EQ.5)
D=!D // 16852
@14 // 16853
M=D // 16854
@SP // 16855
AM=M-1 // 16856
D=M // 16857
@13 // 16858
M=D // 16859
@14 // 16860
D=M // 16861
@DO_EQ // 16862
0;JMP // 16863
(String.dispose.EQ.4)
@String.dispose.IfElse1 // 16864
D;JNE // 16865

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 16866
A=M // 16867
D=M // 16868
@SP // 16869
AM=M+1 // 16870
A=A-1 // 16871
M=D // 16872
// call Array.dispose
@6 // 16873
D=A // 16874
@14 // 16875
M=D // 16876
@Array.dispose // 16877
D=A // 16878
@13 // 16879
M=D // 16880
@String.dispose.ret.0 // 16881
D=A // 16882
@CALL // 16883
0;JMP // 16884
(String.dispose.ret.0)
@SP // 16885
AM=M-1 // 16886
D=M // 16887
@5 // 16888
M=D // 16889

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 16890
0;JMP // 16891

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 16892
AM=M+1 // 16893
A=A-1 // 16894
M=0 // 16895

////ReturnInstruction{}
@RETURN // 16896
0;JMP // 16897

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16898
A=M // 16899
D=M // 16900
@3 // 16901
M=D // 16902

////PushInstruction("this 1")
@THIS // 16903
A=M+1 // 16904
D=M // 16905
@SP // 16906
AM=M+1 // 16907
A=A-1 // 16908
M=D // 16909

////ReturnInstruction{}
@RETURN // 16910
0;JMP // 16911

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16912
A=M // 16913
D=M // 16914
@3 // 16915
M=D // 16916

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
@THIS // 16917
A=M // 16918
D=M // 16919
@SP // 16920
AM=M+1 // 16921
A=A-1 // 16922
M=D // 16923
@ARG // 16924
A=M+1 // 16925
D=M // 16926
@SP // 16927
AM=M-1 // 16928
A=D+M // 16929
D=M // 16930
@SP // 16931
AM=M+1 // 16932
A=A-1 // 16933
M=D // 16934

////ReturnInstruction{}
@RETURN // 16935
0;JMP // 16936

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16937
A=M // 16938
D=M // 16939
@3 // 16940
M=D // 16941

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 16942
A=M // 16943
D=M // 16944
@SP // 16945
AM=M+1 // 16946
A=A-1 // 16947
M=D // 16948
@ARG // 16949
A=M+1 // 16950
D=M // 16951
@SP // 16952
AM=M-1 // 16953
D=D+M // 16954
@SP // 16955
AM=M+1 // 16956
A=A-1 // 16957
M=D // 16958
@ARG // 16959
A=M+1 // 16960
A=A+1 // 16961
D=M // 16962
@SP // 16963
AM=M-1 // 16964
A=M // 16965
M=D // 16966

////PushInstruction("constant 0")
@SP // 16967
AM=M+1 // 16968
A=A-1 // 16969
M=0 // 16970

////ReturnInstruction{}
@RETURN // 16971
0;JMP // 16972

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 16973
AM=M+1 // 16974
A=A-1 // 16975
M=0 // 16976

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 16977
A=M // 16978
D=M // 16979
@3 // 16980
M=D // 16981

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
@String.appendChar.EQ.7 // 16982
D=A // 16983
@SP // 16984
AM=M+1 // 16985
A=A-1 // 16986
M=D // 16987
@String.appendChar.EQ.8 // 16988
D=A // 16989
@SP // 16990
AM=M+1 // 16991
A=A-1 // 16992
M=D // 16993
@THIS // 16994
A=M+1 // 16995
A=A+1 // 16996
D=M // 16997
A=A-1 // 16998
D=M-D // 16999
@14 // 17000
M=D // 17001
@SP // 17002
AM=M-1 // 17003
D=M // 17004
@13 // 17005
M=D // 17006
@14 // 17007
D=M // 17008
@DO_EQ // 17009
0;JMP // 17010
(String.appendChar.EQ.8)
@14 // 17011
M=D // 17012
@SP // 17013
AM=M-1 // 17014
D=M // 17015
@13 // 17016
M=D // 17017
@14 // 17018
D=M // 17019
@DO_EQ // 17020
0;JMP // 17021
(String.appendChar.EQ.7)
@String.appendChar.IfElse1 // 17022
D;JNE // 17023

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

@THIS // 17024
A=M+1 // 17025
A=A+1 // 17026
D=M // 17027
D=D+M // 17028
@SP // 17029
AM=M+1 // 17030
A=A-1 // 17031
M=D // 17032
// call Array.new
@6 // 17033
D=A // 17034
@14 // 17035
M=D // 17036
@Array.new // 17037
D=A // 17038
@13 // 17039
M=D // 17040
@String.appendChar.ret.0 // 17041
D=A // 17042
@CALL // 17043
0;JMP // 17044
(String.appendChar.ret.0)
@SP // 17045
AM=M-1 // 17046
D=M // 17047
@LCL // 17048
A=M // 17049
M=D // 17050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 17051
A=M // 17052
D=M // 17053
@SP // 17054
AM=M+1 // 17055
A=A-1 // 17056
M=D // 17057
@LCL // 17058
A=M // 17059
D=M // 17060
@SP // 17061
AM=M+1 // 17062
A=A-1 // 17063
M=D // 17064
@THIS // 17065
A=M+1 // 17066
D=M // 17067
@SP // 17068
AM=M+1 // 17069
A=A-1 // 17070
M=D // 17071
// call Memory.copy
@8 // 17072
D=A // 17073
@14 // 17074
M=D // 17075
@Memory.copy // 17076
D=A // 17077
@13 // 17078
M=D // 17079
@String.appendChar.ret.1 // 17080
D=A // 17081
@CALL // 17082
0;JMP // 17083
(String.appendChar.ret.1)
@SP // 17084
AM=M-1 // 17085
D=M // 17086
@5 // 17087
M=D // 17088

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 17089
A=M // 17090
D=M // 17091
@SP // 17092
AM=M+1 // 17093
A=A-1 // 17094
M=D // 17095
// call Array.dispose
@6 // 17096
D=A // 17097
@14 // 17098
M=D // 17099
@Array.dispose // 17100
D=A // 17101
@13 // 17102
M=D // 17103
@String.appendChar.ret.2 // 17104
D=A // 17105
@CALL // 17106
0;JMP // 17107
(String.appendChar.ret.2)
@SP // 17108
AM=M-1 // 17109
D=M // 17110
@5 // 17111
M=D // 17112

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

@THIS // 17113
A=M+1 // 17114
A=A+1 // 17115
D=M // 17116
D=D+M // 17117
@THIS // 17118
A=M+1 // 17119
A=A+1 // 17120
M=D // 17121

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 17122
A=M // 17123
D=M // 17124
@THIS // 17125
A=M // 17126
M=D // 17127

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 17128
0;JMP // 17129

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
@THIS // 17130
A=M+1 // 17131
D=M // 17132
A=A-1 // 17133
D=D+M // 17134
@SP // 17135
AM=M+1 // 17136
A=A-1 // 17137
M=D // 17138
@ARG // 17139
A=M+1 // 17140
D=M // 17141
@SP // 17142
AM=M-1 // 17143
A=M // 17144
M=D // 17145

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

@THIS // 17146
A=M+1 // 17147
D=M+1 // 17148
@THIS // 17149
A=M+1 // 17150
M=D // 17151

////PushInstruction("pointer 0")
@3 // 17152
D=M // 17153
@SP // 17154
AM=M+1 // 17155
A=A-1 // 17156
M=D // 17157

////ReturnInstruction{}
@RETURN // 17158
0;JMP // 17159

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 17160
A=M // 17161
D=M // 17162
@3 // 17163
M=D // 17164

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

@THIS // 17165
A=M+1 // 17166
D=M-1 // 17167
@THIS // 17168
A=M+1 // 17169
M=D // 17170

////PushInstruction("constant 0")
@SP // 17171
AM=M+1 // 17172
A=A-1 // 17173
M=0 // 17174

////ReturnInstruction{}
@RETURN // 17175
0;JMP // 17176

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 17177
AM=M+1 // 17178
A=A-1 // 17179
M=0 // 17180
@SP // 17181
AM=M+1 // 17182
A=A-1 // 17183
M=0 // 17184

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 17185
A=M // 17186
D=M // 17187
@3 // 17188
M=D // 17189

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

D=1 // 17190
@LCL // 17191
A=M+1 // 17192
M=D // 17193

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

D=0 // 17194
@LCL // 17195
A=M // 17196
M=D // 17197

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
@String.intValue.EQ.10 // 17198
D=A // 17199
@SP // 17200
AM=M+1 // 17201
A=A-1 // 17202
M=D // 17203
@String.intValue.LT.11 // 17204
D=A // 17205
@SP // 17206
AM=M+1 // 17207
A=A-1 // 17208
M=D // 17209
@LCL // 17210
A=M+1 // 17211
D=M // 17212
@SP // 17213
AM=M+1 // 17214
A=A-1 // 17215
M=D // 17216
@THIS // 17217
A=M+1 // 17218
D=M // 17219
@SP // 17220
AM=M-1 // 17221
D=M-D // 17222
@14 // 17223
M=D // 17224
@SP // 17225
AM=M-1 // 17226
D=M // 17227
@13 // 17228
M=D // 17229
@14 // 17230
D=M // 17231
@DO_LT // 17232
0;JMP // 17233
(String.intValue.LT.11)
@14 // 17234
M=D // 17235
@SP // 17236
AM=M-1 // 17237
D=M // 17238
@13 // 17239
M=D // 17240
@14 // 17241
D=M // 17242
@DO_EQ // 17243
0;JMP // 17244
(String.intValue.EQ.10)
@WHILE_END_String.intValue1 // 17245
D;JNE // 17246

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

@LCL // 17247
A=M // 17248
D=M // 17249
@SP // 17250
AM=M+1 // 17251
A=A-1 // 17252
M=D // 17253
@10 // 17254
D=A // 17255
@SP // 17256
AM=M+1 // 17257
A=A-1 // 17258
M=D // 17259
// call Math.multiply
@7 // 17260
D=A // 17261
@14 // 17262
M=D // 17263
@Math.multiply // 17264
D=A // 17265
@13 // 17266
M=D // 17267
@String.intValue.ret.0 // 17268
D=A // 17269
@CALL // 17270
0;JMP // 17271
(String.intValue.ret.0)
@THIS // 17272
A=M // 17273
D=M // 17274
@SP // 17275
AM=M+1 // 17276
A=A-1 // 17277
M=D // 17278
@LCL // 17279
A=M+1 // 17280
D=M // 17281
@SP // 17282
AM=M-1 // 17283
A=D+M // 17284
D=M // 17285
@48 // 17286
D=D-A // 17287
@SP // 17288
AM=M-1 // 17289
D=D+M // 17290
@LCL // 17291
A=M // 17292
M=D // 17293

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

@LCL // 17294
A=M+1 // 17295
D=M+1 // 17296
@LCL // 17297
A=M+1 // 17298
M=D // 17299

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 17300
0;JMP // 17301

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 17302
A=M // 17303
D=M // 17304
@SP // 17305
AM=M+1 // 17306
A=A-1 // 17307
M=D // 17308

////ReturnInstruction{}
@RETURN // 17309
0;JMP // 17310

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 17311
AM=M+1 // 17312
A=A-1 // 17313
M=0 // 17314
@SP // 17315
AM=M+1 // 17316
A=A-1 // 17317
M=0 // 17318
@SP // 17319
AM=M+1 // 17320
A=A-1 // 17321
M=0 // 17322
@SP // 17323
AM=M+1 // 17324
A=A-1 // 17325
M=0 // 17326
@SP // 17327
AM=M+1 // 17328
A=A-1 // 17329
M=0 // 17330
@SP // 17331
AM=M+1 // 17332
A=A-1 // 17333
M=0 // 17334

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 17335
A=M // 17336
D=M // 17337
@3 // 17338
M=D // 17339

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

D=0 // 17340
@THIS // 17341
A=M+1 // 17342
M=D // 17343

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@SP // 17344
AM=M+1 // 17345
A=A-1 // 17346
M=0 // 17347
@LCL // 17348
D=M // 17349
@4 // 17350
A=D+A // 17351
D=A // 17352
@R13 // 17353
M=D // 17354
@SP // 17355
AM=M-1 // 17356
D=M // 17357
@R13 // 17358
A=M // 17359
M=D // 17360

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
@String.setInt.EQ.13 // 17361
D=A // 17362
@SP // 17363
AM=M+1 // 17364
A=A-1 // 17365
M=D // 17366
@String.setInt.EQ.14 // 17367
D=A // 17368
@SP // 17369
AM=M+1 // 17370
A=A-1 // 17371
M=D // 17372
@ARG // 17373
A=M+1 // 17374
D=M // 17375
@14 // 17376
M=D // 17377
@SP // 17378
AM=M-1 // 17379
D=M // 17380
@13 // 17381
M=D // 17382
@14 // 17383
D=M // 17384
@DO_EQ // 17385
0;JMP // 17386
(String.setInt.EQ.14)
@14 // 17387
M=D // 17388
@SP // 17389
AM=M-1 // 17390
D=M // 17391
@13 // 17392
M=D // 17393
@14 // 17394
D=M // 17395
@DO_EQ // 17396
0;JMP // 17397
(String.setInt.EQ.13)
@String.setInt.IfElse1 // 17398
D;JNE // 17399

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17400
D=M // 17401
@SP // 17402
AM=M+1 // 17403
A=A-1 // 17404
M=D // 17405
@48 // 17406
D=A // 17407
@SP // 17408
AM=M+1 // 17409
A=A-1 // 17410
M=D // 17411
// call String.appendChar
@7 // 17412
D=A // 17413
@14 // 17414
M=D // 17415
@String.appendChar // 17416
D=A // 17417
@13 // 17418
M=D // 17419
@String.setInt.ret.0 // 17420
D=A // 17421
@CALL // 17422
0;JMP // 17423
(String.setInt.ret.0)
@SP // 17424
AM=M-1 // 17425
D=M // 17426
@5 // 17427
M=D // 17428

////PushInstruction("constant 0")
@SP // 17429
AM=M+1 // 17430
A=A-1 // 17431
M=0 // 17432

////ReturnInstruction{}
@RETURN // 17433
0;JMP // 17434

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 17435
0;JMP // 17436

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
@String.setInt.EQ.16 // 17437
D=A // 17438
@SP // 17439
AM=M+1 // 17440
A=A-1 // 17441
M=D // 17442
@String.setInt.LT.17 // 17443
D=A // 17444
@SP // 17445
AM=M+1 // 17446
A=A-1 // 17447
M=D // 17448
@ARG // 17449
A=M+1 // 17450
D=M // 17451
@14 // 17452
M=D // 17453
@SP // 17454
AM=M-1 // 17455
D=M // 17456
@13 // 17457
M=D // 17458
@14 // 17459
D=M // 17460
@DO_LT // 17461
0;JMP // 17462
(String.setInt.LT.17)
@14 // 17463
M=D // 17464
@SP // 17465
AM=M-1 // 17466
D=M // 17467
@13 // 17468
M=D // 17469
@14 // 17470
D=M // 17471
@DO_EQ // 17472
0;JMP // 17473
(String.setInt.EQ.16)
@String.setInt.IfElse2 // 17474
D;JNE // 17475

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@SP // 17476
AM=M+1 // 17477
A=A-1 // 17478
M=1 // 17479
@LCL // 17480
D=M // 17481
@4 // 17482
A=D+A // 17483
D=A // 17484
@R13 // 17485
M=D // 17486
@SP // 17487
AM=M-1 // 17488
D=M // 17489
@R13 // 17490
A=M // 17491
M=D // 17492

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
@String.setInt.EQ.20 // 17493
D=A // 17494
@SP // 17495
AM=M+1 // 17496
A=A-1 // 17497
M=D // 17498
@String.setInt.LT.21 // 17499
D=A // 17500
@SP // 17501
AM=M+1 // 17502
A=A-1 // 17503
M=D // 17504
@ARG // 17505
A=M+1 // 17506
D=M // 17507
@14 // 17508
M=D // 17509
@SP // 17510
AM=M-1 // 17511
D=M // 17512
@13 // 17513
M=D // 17514
@14 // 17515
D=M // 17516
@DO_LT // 17517
0;JMP // 17518
(String.setInt.LT.21)
@SP // 17519
AM=M+1 // 17520
A=A-1 // 17521
M=D // 17522
@String.setInt.EQ.22 // 17523
D=A // 17524
@SP // 17525
AM=M+1 // 17526
A=A-1 // 17527
M=D // 17528
@ARG // 17529
A=M+1 // 17530
D=M // 17531
@32767 // 17532
D=D&A // 17533
@32767 // 17534
D=D-A // 17535
@14 // 17536
M=D // 17537
@SP // 17538
AM=M-1 // 17539
D=M // 17540
@13 // 17541
M=D // 17542
@14 // 17543
D=M // 17544
@DO_EQ // 17545
0;JMP // 17546
(String.setInt.EQ.22)
@SP // 17547
AM=M-1 // 17548
D=D&M // 17549
@14 // 17550
M=D // 17551
@SP // 17552
AM=M-1 // 17553
D=M // 17554
@13 // 17555
M=D // 17556
@14 // 17557
D=M // 17558
@DO_EQ // 17559
0;JMP // 17560
(String.setInt.EQ.20)
@String.setInt.IfElse3 // 17561
D;JNE // 17562

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17563
D=M // 17564
@SP // 17565
AM=M+1 // 17566
A=A-1 // 17567
M=D // 17568
@45 // 17569
D=A // 17570
@SP // 17571
AM=M+1 // 17572
A=A-1 // 17573
M=D // 17574
// call String.appendChar
@7 // 17575
D=A // 17576
@14 // 17577
M=D // 17578
@String.appendChar // 17579
D=A // 17580
@13 // 17581
M=D // 17582
@String.setInt.ret.1 // 17583
D=A // 17584
@CALL // 17585
0;JMP // 17586
(String.setInt.ret.1)
@SP // 17587
AM=M-1 // 17588
D=M // 17589
@5 // 17590
M=D // 17591

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17592
D=M // 17593
@SP // 17594
AM=M+1 // 17595
A=A-1 // 17596
M=D // 17597
@51 // 17598
D=A // 17599
@SP // 17600
AM=M+1 // 17601
A=A-1 // 17602
M=D // 17603
// call String.appendChar
@7 // 17604
D=A // 17605
@14 // 17606
M=D // 17607
@String.appendChar // 17608
D=A // 17609
@13 // 17610
M=D // 17611
@String.setInt.ret.2 // 17612
D=A // 17613
@CALL // 17614
0;JMP // 17615
(String.setInt.ret.2)
@SP // 17616
AM=M-1 // 17617
D=M // 17618
@5 // 17619
M=D // 17620

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17621
D=M // 17622
@SP // 17623
AM=M+1 // 17624
A=A-1 // 17625
M=D // 17626
@50 // 17627
D=A // 17628
@SP // 17629
AM=M+1 // 17630
A=A-1 // 17631
M=D // 17632
// call String.appendChar
@7 // 17633
D=A // 17634
@14 // 17635
M=D // 17636
@String.appendChar // 17637
D=A // 17638
@13 // 17639
M=D // 17640
@String.setInt.ret.3 // 17641
D=A // 17642
@CALL // 17643
0;JMP // 17644
(String.setInt.ret.3)
@SP // 17645
AM=M-1 // 17646
D=M // 17647
@5 // 17648
M=D // 17649

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17650
D=M // 17651
@SP // 17652
AM=M+1 // 17653
A=A-1 // 17654
M=D // 17655
@55 // 17656
D=A // 17657
@SP // 17658
AM=M+1 // 17659
A=A-1 // 17660
M=D // 17661
// call String.appendChar
@7 // 17662
D=A // 17663
@14 // 17664
M=D // 17665
@String.appendChar // 17666
D=A // 17667
@13 // 17668
M=D // 17669
@String.setInt.ret.4 // 17670
D=A // 17671
@CALL // 17672
0;JMP // 17673
(String.setInt.ret.4)
@SP // 17674
AM=M-1 // 17675
D=M // 17676
@5 // 17677
M=D // 17678

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17679
D=M // 17680
@SP // 17681
AM=M+1 // 17682
A=A-1 // 17683
M=D // 17684
@54 // 17685
D=A // 17686
@SP // 17687
AM=M+1 // 17688
A=A-1 // 17689
M=D // 17690
// call String.appendChar
@7 // 17691
D=A // 17692
@14 // 17693
M=D // 17694
@String.appendChar // 17695
D=A // 17696
@13 // 17697
M=D // 17698
@String.setInt.ret.5 // 17699
D=A // 17700
@CALL // 17701
0;JMP // 17702
(String.setInt.ret.5)
@SP // 17703
AM=M-1 // 17704
D=M // 17705
@5 // 17706
M=D // 17707

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 17708
D=M // 17709
@SP // 17710
AM=M+1 // 17711
A=A-1 // 17712
M=D // 17713
@56 // 17714
D=A // 17715
@SP // 17716
AM=M+1 // 17717
A=A-1 // 17718
M=D // 17719
// call String.appendChar
@7 // 17720
D=A // 17721
@14 // 17722
M=D // 17723
@String.appendChar // 17724
D=A // 17725
@13 // 17726
M=D // 17727
@String.setInt.ret.6 // 17728
D=A // 17729
@CALL // 17730
0;JMP // 17731
(String.setInt.ret.6)
@SP // 17732
AM=M-1 // 17733
D=M // 17734
@5 // 17735
M=D // 17736

////PushInstruction("constant 0")
@SP // 17737
AM=M+1 // 17738
A=A-1 // 17739
M=0 // 17740

////ReturnInstruction{}
@RETURN // 17741
0;JMP // 17742

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 17743
0;JMP // 17744

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

@ARG // 17745
A=M+1 // 17746
D=-M // 17747
@ARG // 17748
A=M+1 // 17749
M=D // 17750

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 17751
0;JMP // 17752

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

@ARG // 17753
A=M+1 // 17754
D=M // 17755
@LCL // 17756
A=M+1 // 17757
A=A+1 // 17758
M=D // 17759

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

D=0 // 17760
@LCL // 17761
A=M+1 // 17762
A=A+1 // 17763
A=A+1 // 17764
M=D // 17765

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
@String.setInt.EQ.24 // 17766
D=A // 17767
@SP // 17768
AM=M+1 // 17769
A=A-1 // 17770
M=D // 17771
@String.setInt.GT.25 // 17772
D=A // 17773
@SP // 17774
AM=M+1 // 17775
A=A-1 // 17776
M=D // 17777
@LCL // 17778
A=M+1 // 17779
A=A+1 // 17780
D=M // 17781
@14 // 17782
M=D // 17783
@SP // 17784
AM=M-1 // 17785
D=M // 17786
@13 // 17787
M=D // 17788
@14 // 17789
D=M // 17790
@DO_GT // 17791
0;JMP // 17792
(String.setInt.GT.25)
@14 // 17793
M=D // 17794
@SP // 17795
AM=M-1 // 17796
D=M // 17797
@13 // 17798
M=D // 17799
@14 // 17800
D=M // 17801
@DO_EQ // 17802
0;JMP // 17803
(String.setInt.EQ.24)
@WHILE_END_String.setInt1 // 17804
D;JNE // 17805

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 17806
A=M+1 // 17807
A=A+1 // 17808
D=M // 17809
@SP // 17810
AM=M+1 // 17811
A=A-1 // 17812
M=D // 17813
@10 // 17814
D=A // 17815
@SP // 17816
AM=M+1 // 17817
A=A-1 // 17818
M=D // 17819
// call Math.divide
@7 // 17820
D=A // 17821
@14 // 17822
M=D // 17823
@Math.divide // 17824
D=A // 17825
@13 // 17826
M=D // 17827
@String.setInt.ret.7 // 17828
D=A // 17829
@CALL // 17830
0;JMP // 17831
(String.setInt.ret.7)
@SP // 17832
AM=M-1 // 17833
D=M // 17834
@LCL // 17835
A=M+1 // 17836
A=A+1 // 17837
M=D // 17838

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

@LCL // 17839
A=M+1 // 17840
A=A+1 // 17841
A=A+1 // 17842
D=M+1 // 17843
@LCL // 17844
A=M+1 // 17845
A=A+1 // 17846
A=A+1 // 17847
M=D // 17848

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 17849
0;JMP // 17850

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 17851
A=M+1 // 17852
A=A+1 // 17853
A=A+1 // 17854
D=M // 17855
@SP // 17856
AM=M+1 // 17857
A=A-1 // 17858
M=D // 17859
// call Array.new
@6 // 17860
D=A // 17861
@14 // 17862
M=D // 17863
@Array.new // 17864
D=A // 17865
@13 // 17866
M=D // 17867
@String.setInt.ret.8 // 17868
D=A // 17869
@CALL // 17870
0;JMP // 17871
(String.setInt.ret.8)
@LCL // 17872
D=M // 17873
@5 // 17874
A=D+A // 17875
D=A // 17876
@R13 // 17877
M=D // 17878
@SP // 17879
AM=M-1 // 17880
D=M // 17881
@R13 // 17882
A=M // 17883
M=D // 17884

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

D=0 // 17885
@LCL // 17886
A=M+1 // 17887
M=D // 17888

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
@String.setInt.EQ.27 // 17889
D=A // 17890
@SP // 17891
AM=M+1 // 17892
A=A-1 // 17893
M=D // 17894
@String.setInt.GT.28 // 17895
D=A // 17896
@SP // 17897
AM=M+1 // 17898
A=A-1 // 17899
M=D // 17900
@ARG // 17901
A=M+1 // 17902
D=M // 17903
@14 // 17904
M=D // 17905
@SP // 17906
AM=M-1 // 17907
D=M // 17908
@13 // 17909
M=D // 17910
@14 // 17911
D=M // 17912
@DO_GT // 17913
0;JMP // 17914
(String.setInt.GT.28)
@14 // 17915
M=D // 17916
@SP // 17917
AM=M-1 // 17918
D=M // 17919
@13 // 17920
M=D // 17921
@14 // 17922
D=M // 17923
@DO_EQ // 17924
0;JMP // 17925
(String.setInt.EQ.27)
@WHILE_END_String.setInt2 // 17926
D;JNE // 17927

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

@ARG // 17928
A=M+1 // 17929
D=M // 17930
@SP // 17931
AM=M+1 // 17932
A=A-1 // 17933
M=D // 17934
@ARG // 17935
A=M+1 // 17936
D=M // 17937
@SP // 17938
AM=M+1 // 17939
A=A-1 // 17940
M=D // 17941
@10 // 17942
D=A // 17943
@SP // 17944
AM=M+1 // 17945
A=A-1 // 17946
M=D // 17947
// call Math.divide
@7 // 17948
D=A // 17949
@14 // 17950
M=D // 17951
@Math.divide // 17952
D=A // 17953
@13 // 17954
M=D // 17955
@String.setInt.ret.9 // 17956
D=A // 17957
@CALL // 17958
0;JMP // 17959
(String.setInt.ret.9)
@10 // 17960
D=A // 17961
@SP // 17962
AM=M+1 // 17963
A=A-1 // 17964
M=D // 17965
// call Math.multiply
@7 // 17966
D=A // 17967
@14 // 17968
M=D // 17969
@Math.multiply // 17970
D=A // 17971
@13 // 17972
M=D // 17973
@String.setInt.ret.10 // 17974
D=A // 17975
@CALL // 17976
0;JMP // 17977
(String.setInt.ret.10)
@SP // 17978
AM=M-1 // 17979
D=M // 17980
@SP // 17981
AM=M-1 // 17982
D=M-D // 17983
@LCL // 17984
A=M // 17985
M=D // 17986

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
@LCL // 17987
D=M // 17988
@5 // 17989
A=D+A // 17990
D=M // 17991
@SP // 17992
AM=M+1 // 17993
A=A-1 // 17994
M=D // 17995
@LCL // 17996
A=M+1 // 17997
D=M // 17998
@SP // 17999
AM=M-1 // 18000
D=D+M // 18001
@SP // 18002
AM=M+1 // 18003
A=A-1 // 18004
M=D // 18005
@LCL // 18006
A=M // 18007
D=M // 18008
@48 // 18009
D=D+A // 18010
@SP // 18011
AM=M-1 // 18012
A=M // 18013
M=D // 18014

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 18015
A=M+1 // 18016
D=M // 18017
@SP // 18018
AM=M+1 // 18019
A=A-1 // 18020
M=D // 18021
@10 // 18022
D=A // 18023
@SP // 18024
AM=M+1 // 18025
A=A-1 // 18026
M=D // 18027
// call Math.divide
@7 // 18028
D=A // 18029
@14 // 18030
M=D // 18031
@Math.divide // 18032
D=A // 18033
@13 // 18034
M=D // 18035
@String.setInt.ret.11 // 18036
D=A // 18037
@CALL // 18038
0;JMP // 18039
(String.setInt.ret.11)
@SP // 18040
AM=M-1 // 18041
D=M // 18042
@ARG // 18043
A=M+1 // 18044
M=D // 18045

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

@LCL // 18046
A=M+1 // 18047
D=M+1 // 18048
@LCL // 18049
A=M+1 // 18050
M=D // 18051

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 18052
0;JMP // 18053

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
@String.setInt.EQ.30 // 18054
D=A // 18055
@SP // 18056
AM=M+1 // 18057
A=A-1 // 18058
M=D // 18059
@String.setInt.EQ.31 // 18060
D=A // 18061
@SP // 18062
AM=M+1 // 18063
A=A-1 // 18064
M=D // 18065
@LCL // 18066
D=M // 18067
@4 // 18068
A=D+A // 18069
D=M-1 // 18070
@14 // 18071
M=D // 18072
@SP // 18073
AM=M-1 // 18074
D=M // 18075
@13 // 18076
M=D // 18077
@14 // 18078
D=M // 18079
@DO_EQ // 18080
0;JMP // 18081
(String.setInt.EQ.31)
@14 // 18082
M=D // 18083
@SP // 18084
AM=M-1 // 18085
D=M // 18086
@13 // 18087
M=D // 18088
@14 // 18089
D=M // 18090
@DO_EQ // 18091
0;JMP // 18092
(String.setInt.EQ.30)
@String.setInt.IfElse4 // 18093
D;JNE // 18094

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 18095
D=M // 18096
@SP // 18097
AM=M+1 // 18098
A=A-1 // 18099
M=D // 18100
@45 // 18101
D=A // 18102
@SP // 18103
AM=M+1 // 18104
A=A-1 // 18105
M=D // 18106
// call String.appendChar
@7 // 18107
D=A // 18108
@14 // 18109
M=D // 18110
@String.appendChar // 18111
D=A // 18112
@13 // 18113
M=D // 18114
@String.setInt.ret.12 // 18115
D=A // 18116
@CALL // 18117
0;JMP // 18118
(String.setInt.ret.12)
@SP // 18119
AM=M-1 // 18120
D=M // 18121
@5 // 18122
M=D // 18123

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 18124
0;JMP // 18125

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
@String.setInt.EQ.33 // 18126
D=A // 18127
@SP // 18128
AM=M+1 // 18129
A=A-1 // 18130
M=D // 18131
@String.setInt.GT.34 // 18132
D=A // 18133
@SP // 18134
AM=M+1 // 18135
A=A-1 // 18136
M=D // 18137
@LCL // 18138
A=M+1 // 18139
D=M // 18140
@14 // 18141
M=D // 18142
@SP // 18143
AM=M-1 // 18144
D=M // 18145
@13 // 18146
M=D // 18147
@14 // 18148
D=M // 18149
@DO_GT // 18150
0;JMP // 18151
(String.setInt.GT.34)
@14 // 18152
M=D // 18153
@SP // 18154
AM=M-1 // 18155
D=M // 18156
@13 // 18157
M=D // 18158
@14 // 18159
D=M // 18160
@DO_EQ // 18161
0;JMP // 18162
(String.setInt.EQ.33)
@WHILE_END_String.setInt3 // 18163
D;JNE // 18164

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

@LCL // 18165
A=M+1 // 18166
D=M-1 // 18167
@LCL // 18168
A=M+1 // 18169
M=D // 18170

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

@3 // 18171
D=M // 18172
@SP // 18173
AM=M+1 // 18174
A=A-1 // 18175
M=D // 18176
@LCL // 18177
D=M // 18178
@5 // 18179
A=D+A // 18180
D=M // 18181
@SP // 18182
AM=M+1 // 18183
A=A-1 // 18184
M=D // 18185
@LCL // 18186
A=M+1 // 18187
D=M // 18188
@SP // 18189
AM=M-1 // 18190
A=D+M // 18191
D=M // 18192
@SP // 18193
AM=M+1 // 18194
A=A-1 // 18195
M=D // 18196
// call String.appendChar
@7 // 18197
D=A // 18198
@14 // 18199
M=D // 18200
@String.appendChar // 18201
D=A // 18202
@13 // 18203
M=D // 18204
@String.setInt.ret.13 // 18205
D=A // 18206
@CALL // 18207
0;JMP // 18208
(String.setInt.ret.13)
@SP // 18209
AM=M-1 // 18210
D=M // 18211
@5 // 18212
M=D // 18213

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 18214
0;JMP // 18215

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18216
D=M // 18217
@5 // 18218
A=D+A // 18219
D=M // 18220
@SP // 18221
AM=M+1 // 18222
A=A-1 // 18223
M=D // 18224
// call Array.dispose
@6 // 18225
D=A // 18226
@14 // 18227
M=D // 18228
@Array.dispose // 18229
D=A // 18230
@13 // 18231
M=D // 18232
@String.setInt.ret.14 // 18233
D=A // 18234
@CALL // 18235
0;JMP // 18236
(String.setInt.ret.14)
@SP // 18237
AM=M-1 // 18238
D=M // 18239
@5 // 18240
M=D // 18241

////PushInstruction("constant 0")
@SP // 18242
AM=M+1 // 18243
A=A-1 // 18244
M=0 // 18245

////ReturnInstruction{}
@RETURN // 18246
0;JMP // 18247

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 18248
D=A // 18249
@SP // 18250
AM=M+1 // 18251
A=A-1 // 18252
M=D // 18253

////ReturnInstruction{}
@RETURN // 18254
0;JMP // 18255

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 18256
D=A // 18257
@SP // 18258
AM=M+1 // 18259
A=A-1 // 18260
M=D // 18261

////ReturnInstruction{}
@RETURN // 18262
0;JMP // 18263

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 18264
D=A // 18265
@SP // 18266
AM=M+1 // 18267
A=A-1 // 18268
M=D // 18269

////ReturnInstruction{}
@RETURN // 18270
0;JMP // 18271

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 18272
D=A // 18273
@14 // 18274
M=D // 18275
@Memory.init // 18276
D=A // 18277
@13 // 18278
M=D // 18279
@Sys.init.ret.0 // 18280
D=A // 18281
@CALL // 18282
0;JMP // 18283
(Sys.init.ret.0)
@SP // 18284
AM=M-1 // 18285
D=M // 18286
@5 // 18287
M=D // 18288

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 18289
D=A // 18290
@14 // 18291
M=D // 18292
@Math.init // 18293
D=A // 18294
@13 // 18295
M=D // 18296
@Sys.init.ret.1 // 18297
D=A // 18298
@CALL // 18299
0;JMP // 18300
(Sys.init.ret.1)
@SP // 18301
AM=M-1 // 18302
D=M // 18303
@5 // 18304
M=D // 18305

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 18306
D=A // 18307
@14 // 18308
M=D // 18309
@Screen.init // 18310
D=A // 18311
@13 // 18312
M=D // 18313
@Sys.init.ret.2 // 18314
D=A // 18315
@CALL // 18316
0;JMP // 18317
(Sys.init.ret.2)
@SP // 18318
AM=M-1 // 18319
D=M // 18320
@5 // 18321
M=D // 18322

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 18323
D=A // 18324
@14 // 18325
M=D // 18326
@Output.init // 18327
D=A // 18328
@13 // 18329
M=D // 18330
@Sys.init.ret.3 // 18331
D=A // 18332
@CALL // 18333
0;JMP // 18334
(Sys.init.ret.3)
@SP // 18335
AM=M-1 // 18336
D=M // 18337
@5 // 18338
M=D // 18339

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 18340
D=A // 18341
@14 // 18342
M=D // 18343
@Keyboard.init // 18344
D=A // 18345
@13 // 18346
M=D // 18347
@Sys.init.ret.4 // 18348
D=A // 18349
@CALL // 18350
0;JMP // 18351
(Sys.init.ret.4)
@SP // 18352
AM=M-1 // 18353
D=M // 18354
@5 // 18355
M=D // 18356

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 18357
D=A // 18358
@14 // 18359
M=D // 18360
@Main.main // 18361
D=A // 18362
@13 // 18363
M=D // 18364
@Sys.init.ret.5 // 18365
D=A // 18366
@CALL // 18367
0;JMP // 18368
(Sys.init.ret.5)
@SP // 18369
AM=M-1 // 18370
D=M // 18371
@5 // 18372
M=D // 18373

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 18374
D=A // 18375
@14 // 18376
M=D // 18377
@Sys.halt // 18378
D=A // 18379
@13 // 18380
M=D // 18381
@Sys.init.ret.6 // 18382
D=A // 18383
@CALL // 18384
0;JMP // 18385
(Sys.init.ret.6)
@SP // 18386
AM=M-1 // 18387
D=M // 18388
@5 // 18389
M=D // 18390

////PushInstruction("constant 0")
@SP // 18391
AM=M+1 // 18392
A=A-1 // 18393
M=0 // 18394

////ReturnInstruction{}
@RETURN // 18395
0;JMP // 18396

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
D=0 // 18397
@WHILE_END_Sys.halt1 // 18398
D;JNE // 18399

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 18400
0;JMP // 18401

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 18402
AM=M+1 // 18403
A=A-1 // 18404
M=0 // 18405

////ReturnInstruction{}
@RETURN // 18406
0;JMP // 18407

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 18408
AM=M+1 // 18409
A=A-1 // 18410
M=0 // 18411

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
@Sys.wait.EQ.1 // 18412
D=A // 18413
@SP // 18414
AM=M+1 // 18415
A=A-1 // 18416
M=D // 18417
@Sys.wait.GT.2 // 18418
D=A // 18419
@SP // 18420
AM=M+1 // 18421
A=A-1 // 18422
M=D // 18423
@ARG // 18424
A=M // 18425
D=M // 18426
@14 // 18427
M=D // 18428
@SP // 18429
AM=M-1 // 18430
D=M // 18431
@13 // 18432
M=D // 18433
@14 // 18434
D=M // 18435
@DO_GT // 18436
0;JMP // 18437
(Sys.wait.GT.2)
@14 // 18438
M=D // 18439
@SP // 18440
AM=M-1 // 18441
D=M // 18442
@13 // 18443
M=D // 18444
@14 // 18445
D=M // 18446
@DO_EQ // 18447
0;JMP // 18448
(Sys.wait.EQ.1)
@WHILE_END_Sys.wait1 // 18449
D;JNE // 18450

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

@ARG // 18451
A=M // 18452
D=M-1 // 18453
@ARG // 18454
A=M // 18455
M=D // 18456

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 18457
D=A // 18458
@LCL // 18459
A=M // 18460
M=D // 18461

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
@Sys.wait.EQ.4 // 18462
D=A // 18463
@SP // 18464
AM=M+1 // 18465
A=A-1 // 18466
M=D // 18467
@Sys.wait.GT.5 // 18468
D=A // 18469
@SP // 18470
AM=M+1 // 18471
A=A-1 // 18472
M=D // 18473
@LCL // 18474
A=M // 18475
D=M // 18476
@14 // 18477
M=D // 18478
@SP // 18479
AM=M-1 // 18480
D=M // 18481
@13 // 18482
M=D // 18483
@14 // 18484
D=M // 18485
@DO_GT // 18486
0;JMP // 18487
(Sys.wait.GT.5)
@14 // 18488
M=D // 18489
@SP // 18490
AM=M-1 // 18491
D=M // 18492
@13 // 18493
M=D // 18494
@14 // 18495
D=M // 18496
@DO_EQ // 18497
0;JMP // 18498
(Sys.wait.EQ.4)
@WHILE_END_Sys.wait2 // 18499
D;JNE // 18500

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

@LCL // 18501
A=M // 18502
D=M-1 // 18503
@LCL // 18504
A=M // 18505
M=D // 18506

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 18507
0;JMP // 18508

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 18509
0;JMP // 18510

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 18511
AM=M+1 // 18512
A=A-1 // 18513
M=0 // 18514

////ReturnInstruction{}
@RETURN // 18515
0;JMP // 18516

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 18517
A=M // 18518
D=M // 18519
@SP // 18520
AM=M+1 // 18521
A=A-1 // 18522
M=D // 18523
// call Output.printInt
@6 // 18524
D=A // 18525
@14 // 18526
M=D // 18527
@Output.printInt // 18528
D=A // 18529
@13 // 18530
M=D // 18531
@Sys.error.ret.0 // 18532
D=A // 18533
@CALL // 18534
0;JMP // 18535
(Sys.error.ret.0)
@SP // 18536
AM=M-1 // 18537
D=M // 18538
@5 // 18539
M=D // 18540

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 18541
D=A // 18542
@14 // 18543
M=D // 18544
@Output.println // 18545
D=A // 18546
@13 // 18547
M=D // 18548
@Sys.error.ret.1 // 18549
D=A // 18550
@CALL // 18551
0;JMP // 18552
(Sys.error.ret.1)
@SP // 18553
AM=M-1 // 18554
D=M // 18555
@5 // 18556
M=D // 18557

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 18558
D=A // 18559
@14 // 18560
M=D // 18561
@Sys.halt // 18562
D=A // 18563
@13 // 18564
M=D // 18565
@Sys.error.ret.2 // 18566
D=A // 18567
@CALL // 18568
0;JMP // 18569
(Sys.error.ret.2)
@SP // 18570
AM=M-1 // 18571
D=M // 18572
@5 // 18573
M=D // 18574

////PushInstruction("constant 0")
@SP // 18575
AM=M+1 // 18576
A=A-1 // 18577
M=0 // 18578

////ReturnInstruction{}
@RETURN // 18579
0;JMP // 18580

