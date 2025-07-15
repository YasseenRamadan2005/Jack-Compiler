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
@RETURN // 195
0;JMP // 196

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 197
AM=M+1 // 198
A=A-1 // 199
M=0 // 200

////LabelInstruction{label='Keyboard.readChar_WHILE_EXP1}
// label Keyboard.readChar_WHILE_EXP1
(Keyboard.readChar_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("constant 24576"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Keyboard.readChar_WHILE_END1}}
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
@Keyboard.readChar_WHILE_END1 // 212
D;JNE // 213

////GotoInstruction{label='Keyboard.readChar_WHILE_EXP1}
// goto Keyboard.readChar_WHILE_EXP1
@Keyboard.readChar_WHILE_EXP1 // 214
0;JMP // 215

////LabelInstruction{label='Keyboard.readChar_WHILE_END1}
// label Keyboard.readChar_WHILE_END1
(Keyboard.readChar_WHILE_END1)

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

////LabelInstruction{label='Keyboard.readChar_WHILE_EXP2}
// label Keyboard.readChar_WHILE_EXP2
(Keyboard.readChar_WHILE_EXP2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("constant 24576"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Keyboard.readChar_WHILE_END2}}
@Keyboard.readChar.EQ.1 // 221
D=A // 222
@SP // 223
AM=M+1 // 224
A=A-1 // 225
M=D // 226
@24576 // 227
D=M // 228
@DO_EQ // 229
0;JMP // 230
(Keyboard.readChar.EQ.1)
@Keyboard.readChar_WHILE_END2 // 231
D;JNE // 232

////GotoInstruction{label='Keyboard.readChar_WHILE_EXP2}
// goto Keyboard.readChar_WHILE_EXP2
@Keyboard.readChar_WHILE_EXP2 // 233
0;JMP // 234

////LabelInstruction{label='Keyboard.readChar_WHILE_END2}
// label Keyboard.readChar_WHILE_END2
(Keyboard.readChar_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 235
A=M // 236
D=M // 237
@SP // 238
AM=M+1 // 239
A=A-1 // 240
M=D // 241
// call Output.printChar
@6 // 242
D=A // 243
@14 // 244
M=D // 245
@Output.printChar // 246
D=A // 247
@13 // 248
M=D // 249
@Keyboard.readChar.ret.0 // 250
D=A // 251
@CALL // 252
0;JMP // 253
(Keyboard.readChar.ret.0)
@SP // 254
M=M-1 // 255

////PushInstruction("local 0")
@LCL // 256
A=M // 257
D=M // 258
@SP // 259
AM=M+1 // 260
A=A-1 // 261
M=D // 262
@RETURN // 263
0;JMP // 264

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 265
M=M+1 // 266
AM=M+1 // 267
A=A-1 // 268
M=0 // 269
A=A-1 // 270
M=0 // 271

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 272
A=M // 273
D=M // 274
@SP // 275
AM=M+1 // 276
A=A-1 // 277
M=D // 278
// call Output.printString
@6 // 279
D=A // 280
@14 // 281
M=D // 282
@Output.printString // 283
D=A // 284
@13 // 285
M=D // 286
@Keyboard.readLine.ret.0 // 287
D=A // 288
@CALL // 289
0;JMP // 290
(Keyboard.readLine.ret.0)
@SP // 291
M=M-1 // 292

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@50 // 293
D=A // 294
@SP // 295
AM=M+1 // 296
A=A-1 // 297
M=D // 298
// call String.new
@6 // 299
D=A // 300
@14 // 301
M=D // 302
@String.new // 303
D=A // 304
@13 // 305
M=D // 306
@Keyboard.readLine.ret.1 // 307
D=A // 308
@CALL // 309
0;JMP // 310
(Keyboard.readLine.ret.1)
@SP // 311
AM=M-1 // 312
D=M // 313
@LCL // 314
A=M // 315
M=D // 316

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 317
D=A // 318
@14 // 319
M=D // 320
@Keyboard.readChar // 321
D=A // 322
@13 // 323
M=D // 324
@Keyboard.readLine.ret.2 // 325
D=A // 326
@CALL // 327
0;JMP // 328
(Keyboard.readLine.ret.2)
@SP // 329
AM=M-1 // 330
D=M // 331
@LCL // 332
A=M+1 // 333
M=D // 334

////LabelInstruction{label='Keyboard.readLine_WHILE_EXP1}
// label Keyboard.readLine_WHILE_EXP1
(Keyboard.readLine_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 128"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Keyboard.readLine_WHILE_END1}}
@Keyboard.readLine.EQ.2 // 335
D=A // 336
@SP // 337
AM=M+1 // 338
A=A-1 // 339
M=D // 340
@LCL // 341
A=M+1 // 342
D=M // 343
@128 // 344
D=D-A // 345
@DO_EQ // 346
0;JMP // 347
(Keyboard.readLine.EQ.2)
@Keyboard.readLine_WHILE_END1 // 348
D;JNE // 349

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 129"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Keyboard.readLine$IF_TRUE1}}
@Keyboard.readLine.EQ.3 // 350
D=A // 351
@SP // 352
AM=M+1 // 353
A=A-1 // 354
M=D // 355
@LCL // 356
A=M+1 // 357
D=M // 358
@129 // 359
D=D-A // 360
@DO_EQ // 361
0;JMP // 362
(Keyboard.readLine.EQ.3)
@Keyboard.readLine$IF_TRUE1 // 363
D;JNE // 364

////GotoInstruction{label='Keyboard.readLine$IF_FALSE1}
// goto Keyboard.readLine$IF_FALSE1
@Keyboard.readLine$IF_FALSE1 // 365
0;JMP // 366

////LabelInstruction{label='Keyboard.readLine$IF_TRUE1}
// label Keyboard.readLine$IF_TRUE1
(Keyboard.readLine$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.eraseLastChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 367
A=M // 368
D=M // 369
@SP // 370
AM=M+1 // 371
A=A-1 // 372
M=D // 373
// call String.eraseLastChar
@6 // 374
D=A // 375
@14 // 376
M=D // 377
@String.eraseLastChar // 378
D=A // 379
@13 // 380
M=D // 381
@Keyboard.readLine.ret.3 // 382
D=A // 383
@CALL // 384
0;JMP // 385
(Keyboard.readLine.ret.3)
@SP // 386
M=M-1 // 387

////GotoInstruction{label='Keyboard.readLine$IF_END1}
// goto Keyboard.readLine$IF_END1
@Keyboard.readLine$IF_END1 // 388
0;JMP // 389

////LabelInstruction{label='Keyboard.readLine$IF_FALSE1}
// label Keyboard.readLine$IF_FALSE1
(Keyboard.readLine$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 390
A=M // 391
D=M // 392
@SP // 393
AM=M+1 // 394
A=A-1 // 395
M=D // 396
@LCL // 397
A=M+1 // 398
D=M // 399
@SP // 400
AM=M+1 // 401
A=A-1 // 402
M=D // 403
// call String.appendChar
@7 // 404
D=A // 405
@14 // 406
M=D // 407
@String.appendChar // 408
D=A // 409
@13 // 410
M=D // 411
@Keyboard.readLine.ret.4 // 412
D=A // 413
@CALL // 414
0;JMP // 415
(Keyboard.readLine.ret.4)
@SP // 416
M=M-1 // 417

////LabelInstruction{label='Keyboard.readLine$IF_END1}
// label Keyboard.readLine$IF_END1
(Keyboard.readLine$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 418
D=A // 419
@14 // 420
M=D // 421
@Keyboard.readChar // 422
D=A // 423
@13 // 424
M=D // 425
@Keyboard.readLine.ret.5 // 426
D=A // 427
@CALL // 428
0;JMP // 429
(Keyboard.readLine.ret.5)
@SP // 430
AM=M-1 // 431
D=M // 432
@LCL // 433
A=M+1 // 434
M=D // 435

////GotoInstruction{label='Keyboard.readLine_WHILE_EXP1}
// goto Keyboard.readLine_WHILE_EXP1
@Keyboard.readLine_WHILE_EXP1 // 436
0;JMP // 437

////LabelInstruction{label='Keyboard.readLine_WHILE_END1}
// label Keyboard.readLine_WHILE_END1
(Keyboard.readLine_WHILE_END1)

////PushInstruction("local 0")
@LCL // 438
A=M // 439
D=M // 440
@SP // 441
AM=M+1 // 442
A=A-1 // 443
M=D // 444
@RETURN // 445
0;JMP // 446

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 447
AM=M+1 // 448
A=A-1 // 449
M=0 // 450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Keyboard.readLine}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 451
A=M // 452
D=M // 453
@SP // 454
AM=M+1 // 455
A=A-1 // 456
M=D // 457
// call Keyboard.readLine
@6 // 458
D=A // 459
@14 // 460
M=D // 461
@Keyboard.readLine // 462
D=A // 463
@13 // 464
M=D // 465
@Keyboard.readInt.ret.0 // 466
D=A // 467
@CALL // 468
0;JMP // 469
(Keyboard.readInt.ret.0)
@SP // 470
AM=M-1 // 471
D=M // 472
@LCL // 473
A=M // 474
M=D // 475

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.intValue}}
@LCL // 476
A=M // 477
D=M // 478
@SP // 479
AM=M+1 // 480
A=A-1 // 481
M=D // 482
// call String.intValue
@6 // 483
D=A // 484
@14 // 485
M=D // 486
@String.intValue // 487
D=A // 488
@13 // 489
M=D // 490
@Keyboard.readInt.ret.1 // 491
D=A // 492
@CALL // 493
0;JMP // 494
(Keyboard.readInt.ret.1)
@RETURN // 495
0;JMP // 496

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 497
AM=M+1 // 498
A=A-1 // 499
M=0 // 500

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 501
AM=M+1 // 502
A=A-1 // 503
M=0 // 504
@220 // 505
D=A // 506
@SP // 507
AM=M+1 // 508
A=A-1 // 509
M=D // 510
@511 // 511
D=A // 512
@SP // 513
AM=M+1 // 514
A=A-1 // 515
M=D // 516
@220 // 517
D=A // 518
@SP // 519
AM=M+1 // 520
A=A-1 // 521
M=D // 522
// call Screen.drawLine
@9 // 523
D=A // 524
@14 // 525
M=D // 526
@Screen.drawLine // 527
D=A // 528
@13 // 529
M=D // 530
@Main.main.ret.0 // 531
D=A // 532
@CALL // 533
0;JMP // 534
(Main.main.ret.0)
@SP // 535
M=M-1 // 536

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 537
D=A // 538
@SP // 539
AM=M+1 // 540
A=A-1 // 541
M=D // 542
@90 // 543
D=A // 544
@SP // 545
AM=M+1 // 546
A=A-1 // 547
M=D // 548
@410 // 549
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
// call Screen.drawRectangle
@9 // 561
D=A // 562
@14 // 563
M=D // 564
@Screen.drawRectangle // 565
D=A // 566
@13 // 567
M=D // 568
@Main.main.ret.1 // 569
D=A // 570
@CALL // 571
0;JMP // 572
(Main.main.ret.1)
@SP // 573
M=M-1 // 574

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 575
AM=M+1 // 576
A=A-1 // 577
M=0 // 578
// call Screen.setColor
@6 // 579
D=A // 580
@14 // 581
M=D // 582
@Screen.setColor // 583
D=A // 584
@13 // 585
M=D // 586
@Main.main.ret.2 // 587
D=A // 588
@CALL // 589
0;JMP // 590
(Main.main.ret.2)
@SP // 591
M=M-1 // 592

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 593
D=A // 594
@SP // 595
AM=M+1 // 596
A=A-1 // 597
M=D // 598
@120 // 599
D=A // 600
@SP // 601
AM=M+1 // 602
A=A-1 // 603
M=D // 604
@390 // 605
D=A // 606
@SP // 607
AM=M+1 // 608
A=A-1 // 609
M=D // 610
@219 // 611
D=A // 612
@SP // 613
AM=M+1 // 614
A=A-1 // 615
M=D // 616
// call Screen.drawRectangle
@9 // 617
D=A // 618
@14 // 619
M=D // 620
@Screen.drawRectangle // 621
D=A // 622
@13 // 623
M=D // 624
@Main.main.ret.3 // 625
D=A // 626
@CALL // 627
0;JMP // 628
(Main.main.ret.3)
@SP // 629
M=M-1 // 630

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 631
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
@332 // 643
D=A // 644
@SP // 645
AM=M+1 // 646
A=A-1 // 647
M=D // 648
@150 // 649
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
@Main.main.ret.4 // 663
D=A // 664
@CALL // 665
0;JMP // 666
(Main.main.ret.4)
@SP // 667
M=M-1 // 668

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 669
AM=M+1 // 670
A=A-1 // 671
M=-1 // 672
// call Screen.setColor
@6 // 673
D=A // 674
@14 // 675
M=D // 676
@Screen.setColor // 677
D=A // 678
@13 // 679
M=D // 680
@Main.main.ret.5 // 681
D=A // 682
@CALL // 683
0;JMP // 684
(Main.main.ret.5)
@SP // 685
M=M-1 // 686

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 687
D=A // 688
@SP // 689
AM=M+1 // 690
A=A-1 // 691
M=D // 692
@170 // 693
D=A // 694
@SP // 695
AM=M+1 // 696
A=A-1 // 697
M=D // 698
@3 // 699
D=A // 700
@SP // 701
AM=M+1 // 702
A=A-1 // 703
M=D // 704
// call Screen.drawCircle
@8 // 705
D=A // 706
@14 // 707
M=D // 708
@Screen.drawCircle // 709
D=A // 710
@13 // 711
M=D // 712
@Main.main.ret.6 // 713
D=A // 714
@CALL // 715
0;JMP // 716
(Main.main.ret.6)
@SP // 717
M=M-1 // 718

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 719
D=A // 720
@SP // 721
AM=M+1 // 722
A=A-1 // 723
M=D // 724
@90 // 725
D=A // 726
@SP // 727
AM=M+1 // 728
A=A-1 // 729
M=D // 730
@345 // 731
D=A // 732
@SP // 733
AM=M+1 // 734
A=A-1 // 735
M=D // 736
@35 // 737
D=A // 738
@SP // 739
AM=M+1 // 740
A=A-1 // 741
M=D // 742
// call Screen.drawLine
@9 // 743
D=A // 744
@14 // 745
M=D // 746
@Screen.drawLine // 747
D=A // 748
@13 // 749
M=D // 750
@Main.main.ret.7 // 751
D=A // 752
@CALL // 753
0;JMP // 754
(Main.main.ret.7)
@SP // 755
M=M-1 // 756

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 757
D=A // 758
@SP // 759
AM=M+1 // 760
A=A-1 // 761
M=D // 762
@35 // 763
D=A // 764
@SP // 765
AM=M+1 // 766
A=A-1 // 767
M=D // 768
@410 // 769
D=A // 770
@SP // 771
AM=M+1 // 772
A=A-1 // 773
M=D // 774
@90 // 775
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
@Main.main.ret.8 // 789
D=A // 790
@CALL // 791
0;JMP // 792
(Main.main.ret.8)
@SP // 793
M=M-1 // 794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 795
D=A // 796
@SP // 797
AM=M+1 // 798
A=A-1 // 799
M=D // 800
@60 // 801
D=A // 802
@SP // 803
AM=M+1 // 804
A=A-1 // 805
M=D // 806
@30 // 807
D=A // 808
@SP // 809
AM=M+1 // 810
A=A-1 // 811
M=D // 812
// call Screen.drawCircle
@8 // 813
D=A // 814
@14 // 815
M=D // 816
@Screen.drawCircle // 817
D=A // 818
@13 // 819
M=D // 820
@Main.main.ret.9 // 821
D=A // 822
@CALL // 823
0;JMP // 824
(Main.main.ret.9)
@SP // 825
M=M-1 // 826

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 827
D=A // 828
@SP // 829
AM=M+1 // 830
A=A-1 // 831
M=D // 832
@26 // 833
D=A // 834
@SP // 835
AM=M+1 // 836
A=A-1 // 837
M=D // 838
@140 // 839
D=A // 840
@SP // 841
AM=M+1 // 842
A=A-1 // 843
M=D // 844
@6 // 845
D=A // 846
@SP // 847
AM=M+1 // 848
A=A-1 // 849
M=D // 850
// call Screen.drawLine
@9 // 851
D=A // 852
@14 // 853
M=D // 854
@Screen.drawLine // 855
D=A // 856
@13 // 857
M=D // 858
@Main.main.ret.10 // 859
D=A // 860
@CALL // 861
0;JMP // 862
(Main.main.ret.10)
@SP // 863
M=M-1 // 864

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 865
D=A // 866
@SP // 867
AM=M+1 // 868
A=A-1 // 869
M=D // 870
@35 // 871
D=A // 872
@SP // 873
AM=M+1 // 874
A=A-1 // 875
M=D // 876
@178 // 877
D=A // 878
@SP // 879
AM=M+1 // 880
A=A-1 // 881
M=D // 882
@20 // 883
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
@Main.main.ret.11 // 897
D=A // 898
@CALL // 899
0;JMP // 900
(Main.main.ret.11)
@SP // 901
M=M-1 // 902

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 903
D=A // 904
@SP // 905
AM=M+1 // 906
A=A-1 // 907
M=D // 908
@60 // 909
D=A // 910
@SP // 911
AM=M+1 // 912
A=A-1 // 913
M=D // 914
@194 // 915
D=A // 916
@SP // 917
AM=M+1 // 918
A=A-1 // 919
M=D // 920
@60 // 921
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
@Main.main.ret.12 // 935
D=A // 936
@CALL // 937
0;JMP // 938
(Main.main.ret.12)
@SP // 939
M=M-1 // 940

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 941
D=A // 942
@SP // 943
AM=M+1 // 944
A=A-1 // 945
M=D // 946
@85 // 947
D=A // 948
@SP // 949
AM=M+1 // 950
A=A-1 // 951
M=D // 952
@178 // 953
D=A // 954
@SP // 955
AM=M+1 // 956
A=A-1 // 957
M=D // 958
@100 // 959
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
@Main.main.ret.13 // 973
D=A // 974
@CALL // 975
0;JMP // 976
(Main.main.ret.13)
@SP // 977
M=M-1 // 978

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 979
D=A // 980
@SP // 981
AM=M+1 // 982
A=A-1 // 983
M=D // 984
@94 // 985
D=A // 986
@SP // 987
AM=M+1 // 988
A=A-1 // 989
M=D // 990
@140 // 991
D=A // 992
@SP // 993
AM=M+1 // 994
A=A-1 // 995
M=D // 996
@114 // 997
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
@Main.main.ret.14 // 1011
D=A // 1012
@CALL // 1013
0;JMP // 1014
(Main.main.ret.14)
@SP // 1015
M=M-1 // 1016

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 1017
D=A // 1018
@SP // 1019
AM=M+1 // 1020
A=A-1 // 1021
M=D // 1022
@85 // 1023
D=A // 1024
@SP // 1025
AM=M+1 // 1026
A=A-1 // 1027
M=D // 1028
@102 // 1029
D=A // 1030
@SP // 1031
AM=M+1 // 1032
A=A-1 // 1033
M=D // 1034
@100 // 1035
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
@Main.main.ret.15 // 1049
D=A // 1050
@CALL // 1051
0;JMP // 1052
(Main.main.ret.15)
@SP // 1053
M=M-1 // 1054

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 1055
D=A // 1056
@SP // 1057
AM=M+1 // 1058
A=A-1 // 1059
M=D // 1060
@60 // 1061
D=A // 1062
@SP // 1063
AM=M+1 // 1064
A=A-1 // 1065
M=D // 1066
@86 // 1067
D=A // 1068
@SP // 1069
AM=M+1 // 1070
A=A-1 // 1071
M=D // 1072
@60 // 1073
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
@Main.main.ret.16 // 1087
D=A // 1088
@CALL // 1089
0;JMP // 1090
(Main.main.ret.16)
@SP // 1091
M=M-1 // 1092

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 1093
D=A // 1094
@SP // 1095
AM=M+1 // 1096
A=A-1 // 1097
M=D // 1098
@35 // 1099
D=A // 1100
@SP // 1101
AM=M+1 // 1102
A=A-1 // 1103
M=D // 1104
@102 // 1105
D=A // 1106
@SP // 1107
AM=M+1 // 1108
A=A-1 // 1109
M=D // 1110
@20 // 1111
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
@Main.main.ret.17 // 1125
D=A // 1126
@CALL // 1127
0;JMP // 1128
(Main.main.ret.17)
@SP // 1129
M=M-1 // 1130

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 1131
D=A // 1132
@SP // 1133
AM=M+1 // 1134
A=A-1 // 1135
M=D // 1136
// call String.new
@6 // 1137
D=A // 1138
@14 // 1139
M=D // 1140
@String.new // 1141
D=A // 1142
@13 // 1143
M=D // 1144
@Main.main.ret.18 // 1145
D=A // 1146
@CALL // 1147
0;JMP // 1148
(Main.main.ret.18)
@72 // 1149
D=A // 1150
@SP // 1151
AM=M+1 // 1152
A=A-1 // 1153
M=D // 1154
// call String.appendChar
@7 // 1155
D=A // 1156
@14 // 1157
M=D // 1158
@String.appendChar // 1159
D=A // 1160
@13 // 1161
M=D // 1162
@Main.main.ret.19 // 1163
D=A // 1164
@CALL // 1165
0;JMP // 1166
(Main.main.ret.19)
@101 // 1167
D=A // 1168
@SP // 1169
AM=M+1 // 1170
A=A-1 // 1171
M=D // 1172
// call String.appendChar
@7 // 1173
D=A // 1174
@14 // 1175
M=D // 1176
@String.appendChar // 1177
D=A // 1178
@13 // 1179
M=D // 1180
@Main.main.ret.20 // 1181
D=A // 1182
@CALL // 1183
0;JMP // 1184
(Main.main.ret.20)
@108 // 1185
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
@Main.main.ret.21 // 1199
D=A // 1200
@CALL // 1201
0;JMP // 1202
(Main.main.ret.21)
@108 // 1203
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
@Main.main.ret.22 // 1217
D=A // 1218
@CALL // 1219
0;JMP // 1220
(Main.main.ret.22)
@111 // 1221
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
@Main.main.ret.23 // 1235
D=A // 1236
@CALL // 1237
0;JMP // 1238
(Main.main.ret.23)
@44 // 1239
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
@Main.main.ret.24 // 1253
D=A // 1254
@CALL // 1255
0;JMP // 1256
(Main.main.ret.24)
@32 // 1257
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
@Main.main.ret.25 // 1271
D=A // 1272
@CALL // 1273
0;JMP // 1274
(Main.main.ret.25)
@119 // 1275
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
@Main.main.ret.26 // 1289
D=A // 1290
@CALL // 1291
0;JMP // 1292
(Main.main.ret.26)
@111 // 1293
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
@Main.main.ret.27 // 1307
D=A // 1308
@CALL // 1309
0;JMP // 1310
(Main.main.ret.27)
@114 // 1311
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
@Main.main.ret.28 // 1325
D=A // 1326
@CALL // 1327
0;JMP // 1328
(Main.main.ret.28)
@108 // 1329
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
@Main.main.ret.29 // 1343
D=A // 1344
@CALL // 1345
0;JMP // 1346
(Main.main.ret.29)
@100 // 1347
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
@Main.main.ret.30 // 1361
D=A // 1362
@CALL // 1363
0;JMP // 1364
(Main.main.ret.30)
@33 // 1365
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
@Main.main.ret.31 // 1379
D=A // 1380
@CALL // 1381
0;JMP // 1382
(Main.main.ret.31)
@SP // 1383
AM=M-1 // 1384
D=M // 1385
@LCL // 1386
A=M // 1387
M=D // 1388

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1389
A=M // 1390
D=M // 1391
@SP // 1392
AM=M+1 // 1393
A=A-1 // 1394
M=D // 1395
// call Output.printString
@6 // 1396
D=A // 1397
@14 // 1398
M=D // 1399
@Output.printString // 1400
D=A // 1401
@13 // 1402
M=D // 1403
@Main.main.ret.32 // 1404
D=A // 1405
@CALL // 1406
0;JMP // 1407
(Main.main.ret.32)
@SP // 1408
M=M-1 // 1409

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 1410
D=A // 1411
@14 // 1412
M=D // 1413
@Output.println // 1414
D=A // 1415
@13 // 1416
M=D // 1417
@Main.main.ret.33 // 1418
D=A // 1419
@CALL // 1420
0;JMP // 1421
(Main.main.ret.33)
@SP // 1422
M=M-1 // 1423

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1424
A=M // 1425
D=M // 1426
@SP // 1427
AM=M+1 // 1428
A=A-1 // 1429
M=D // 1430
// call String.dispose
@6 // 1431
D=A // 1432
@14 // 1433
M=D // 1434
@String.dispose // 1435
D=A // 1436
@13 // 1437
M=D // 1438
@Main.main.ret.34 // 1439
D=A // 1440
@CALL // 1441
0;JMP // 1442
(Main.main.ret.34)
@SP // 1443
M=M-1 // 1444

////PushInstruction("constant 0")
@SP // 1445
AM=M+1 // 1446
A=A-1 // 1447
M=0 // 1448
@RETURN // 1449
0;JMP // 1450

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 1451
M=M+1 // 1452
AM=M+1 // 1453
A=A-1 // 1454
M=0 // 1455
A=A-1 // 1456
M=0 // 1457

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1458
A=M // 1459
M=1 // 1460

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1461
A=M+1 // 1462
M=0 // 1463

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 1464
D=A // 1465
@SP // 1466
AM=M+1 // 1467
A=A-1 // 1468
M=D // 1469
// call Array.new
@6 // 1470
D=A // 1471
@14 // 1472
M=D // 1473
@Array.new // 1474
D=A // 1475
@13 // 1476
M=D // 1477
@Math.init.ret.0 // 1478
D=A // 1479
@CALL // 1480
0;JMP // 1481
(Math.init.ret.0)
@SP // 1482
AM=M-1 // 1483
D=M // 1484
@Math.0 // 1485
M=D // 1486

////LabelInstruction{label='Math.init_WHILE_EXP1}
// label Math.init_WHILE_EXP1
(Math.init_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 16"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.init_WHILE_END1}}
@Math.init.LT.0 // 1487
D=A // 1488
@SP // 1489
AM=M+1 // 1490
A=A-1 // 1491
M=D // 1492
@LCL // 1493
A=M+1 // 1494
D=M // 1495
@16 // 1496
D=D-A // 1497
@DO_LT // 1498
0;JMP // 1499
(Math.init.LT.0)
D=!D // 1500
@Math.init_WHILE_END1 // 1501
D;JNE // 1502

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 1503
D=M // 1504
@SP // 1505
AM=M+1 // 1506
A=A-1 // 1507
M=D // 1508
@LCL // 1509
A=M+1 // 1510
D=M // 1511
@SP // 1512
AM=M-1 // 1513
D=D+M // 1514
@SP // 1515
AM=M+1 // 1516
A=A-1 // 1517
M=D // 1518
@LCL // 1519
A=M // 1520
D=M // 1521
@SP // 1522
AM=M-1 // 1523
A=M // 1524
M=D // 1525

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

@LCL // 1526
A=M // 1527
D=M // 1528
@LCL // 1529
A=M // 1530
M=D+M // 1531

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

@LCL // 1532
A=M+1 // 1533
M=M+1 // 1534

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 1535
0;JMP // 1536

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 1537
AM=M+1 // 1538
A=A-1 // 1539
M=0 // 1540
@RETURN // 1541
0;JMP // 1542

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
@ARG // 1543
A=M // 1544
D=M // 1545
@SP // 1546
AM=M+1 // 1547
A=A-1 // 1548
M=D // 1549
@Math.0 // 1550
D=M // 1551
@SP // 1552
AM=M+1 // 1553
A=A-1 // 1554
M=D // 1555
@ARG // 1556
A=M+1 // 1557
D=M // 1558
@SP // 1559
AM=M-1 // 1560
A=D+M // 1561
D=M // 1562
@SP // 1563
AM=M-1 // 1564
D=D&M // 1565
@SP // 1566
AM=M+1 // 1567
A=A-1 // 1568
M=D // 1569
@RETURN // 1570
0;JMP // 1571

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 1572
D=A // 1573
@SP // 1574
AM=D+M // 1575
A=A-1 // 1576
M=0 // 1577
A=A-1 // 1578
M=0 // 1579
A=A-1 // 1580
M=0 // 1581

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
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE1}}
@Math.multiply.EQ.1 // 1582
D=A // 1583
@SP // 1584
AM=M+1 // 1585
A=A-1 // 1586
M=D // 1587
@ARG // 1588
A=M // 1589
D=M // 1590
@DO_EQ // 1591
0;JMP // 1592
(Math.multiply.EQ.1)
@SP // 1593
AM=M+1 // 1594
A=A-1 // 1595
M=D // 1596
@Math.multiply.EQ.2 // 1597
D=A // 1598
@SP // 1599
AM=M+1 // 1600
A=A-1 // 1601
M=D // 1602
@ARG // 1603
A=M+1 // 1604
D=M // 1605
@DO_EQ // 1606
0;JMP // 1607
(Math.multiply.EQ.2)
@SP // 1608
AM=M-1 // 1609
D=D|M // 1610
@Math.multiply$IF_TRUE1 // 1611
D;JNE // 1612

////GotoInstruction{label='Math.multiply$IF_FALSE1}
// goto Math.multiply$IF_FALSE1
@Math.multiply$IF_FALSE1 // 1613
0;JMP // 1614

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1615
AM=M+1 // 1616
A=A-1 // 1617
M=0 // 1618
@RETURN // 1619
0;JMP // 1620

////LabelInstruction{label='Math.multiply$IF_FALSE1}
// label Math.multiply$IF_FALSE1
(Math.multiply$IF_FALSE1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE2}}
@Math.multiply.EQ.3 // 1621
D=A // 1622
@SP // 1623
AM=M+1 // 1624
A=A-1 // 1625
M=D // 1626
@ARG // 1627
A=M // 1628
D=M // 1629
D=D-1 // 1630
@DO_EQ // 1631
0;JMP // 1632
(Math.multiply.EQ.3)
@Math.multiply$IF_TRUE2 // 1633
D;JNE // 1634

////GotoInstruction{label='Math.multiply$IF_FALSE2}
// goto Math.multiply$IF_FALSE2
@Math.multiply$IF_FALSE2 // 1635
0;JMP // 1636

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 1637
A=M+1 // 1638
D=M // 1639
@SP // 1640
AM=M+1 // 1641
A=A-1 // 1642
M=D // 1643
@RETURN // 1644
0;JMP // 1645

////LabelInstruction{label='Math.multiply$IF_FALSE2}
// label Math.multiply$IF_FALSE2
(Math.multiply$IF_FALSE2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE3}}
@Math.multiply.EQ.4 // 1646
D=A // 1647
@SP // 1648
AM=M+1 // 1649
A=A-1 // 1650
M=D // 1651
@ARG // 1652
A=M+1 // 1653
D=M // 1654
D=D-1 // 1655
@DO_EQ // 1656
0;JMP // 1657
(Math.multiply.EQ.4)
@Math.multiply$IF_TRUE3 // 1658
D;JNE // 1659

////GotoInstruction{label='Math.multiply$IF_FALSE3}
// goto Math.multiply$IF_FALSE3
@Math.multiply$IF_FALSE3 // 1660
0;JMP // 1661

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 1662
A=M // 1663
D=M // 1664
@SP // 1665
AM=M+1 // 1666
A=A-1 // 1667
M=D // 1668
@RETURN // 1669
0;JMP // 1670

////LabelInstruction{label='Math.multiply$IF_FALSE3}
// label Math.multiply$IF_FALSE3
(Math.multiply$IF_FALSE3)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE4}}
@Math.multiply.EQ.5 // 1671
D=A // 1672
@SP // 1673
AM=M+1 // 1674
A=A-1 // 1675
M=D // 1676
@ARG // 1677
A=M // 1678
D=M // 1679
@2 // 1680
D=D-A // 1681
@DO_EQ // 1682
0;JMP // 1683
(Math.multiply.EQ.5)
@Math.multiply$IF_TRUE4 // 1684
D;JNE // 1685

////GotoInstruction{label='Math.multiply$IF_FALSE4}
// goto Math.multiply$IF_FALSE4
@Math.multiply$IF_FALSE4 // 1686
0;JMP // 1687

////LabelInstruction{label='Math.multiply$IF_TRUE4}
// label Math.multiply$IF_TRUE4
(Math.multiply$IF_TRUE4)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1688
A=M+1 // 1689
D=M // 1690
D=D+M // 1691
@SP // 1692
AM=M+1 // 1693
A=A-1 // 1694
M=D // 1695
@RETURN // 1696
0;JMP // 1697

////LabelInstruction{label='Math.multiply$IF_FALSE4}
// label Math.multiply$IF_FALSE4
(Math.multiply$IF_FALSE4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE5}}
@Math.multiply.EQ.6 // 1698
D=A // 1699
@SP // 1700
AM=M+1 // 1701
A=A-1 // 1702
M=D // 1703
@ARG // 1704
A=M+1 // 1705
D=M // 1706
@2 // 1707
D=D-A // 1708
@DO_EQ // 1709
0;JMP // 1710
(Math.multiply.EQ.6)
@Math.multiply$IF_TRUE5 // 1711
D;JNE // 1712

////GotoInstruction{label='Math.multiply$IF_FALSE5}
// goto Math.multiply$IF_FALSE5
@Math.multiply$IF_FALSE5 // 1713
0;JMP // 1714

////LabelInstruction{label='Math.multiply$IF_TRUE5}
// label Math.multiply$IF_TRUE5
(Math.multiply$IF_TRUE5)

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1715
A=M // 1716
D=M // 1717
D=D+M // 1718
@SP // 1719
AM=M+1 // 1720
A=A-1 // 1721
M=D // 1722
@RETURN // 1723
0;JMP // 1724

////LabelInstruction{label='Math.multiply$IF_FALSE5}
// label Math.multiply$IF_FALSE5
(Math.multiply$IF_FALSE5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1725
A=M+1 // 1726
A=A+1 // 1727
M=1 // 1728

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1729
A=M+1 // 1730
M=0 // 1731

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1732
A=M // 1733
M=0 // 1734

////LabelInstruction{label='Math.multiply_WHILE_EXP1}
// label Math.multiply_WHILE_EXP1
(Math.multiply_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 16"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply_WHILE_END1}}
@Math.multiply.LT.7 // 1735
D=A // 1736
@SP // 1737
AM=M+1 // 1738
A=A-1 // 1739
M=D // 1740
@LCL // 1741
A=M+1 // 1742
D=M // 1743
@16 // 1744
D=D-A // 1745
@DO_LT // 1746
0;JMP // 1747
(Math.multiply.LT.7)
D=!D // 1748
@Math.multiply_WHILE_END1 // 1749
D;JNE // 1750

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 1"),
//                right:
//                    PushInstruction("local 2"),
//                binaryOp: "AND"
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE6}}
@Math.multiply.EQ.8 // 1751
D=A // 1752
@SP // 1753
AM=M+1 // 1754
A=A-1 // 1755
M=D // 1756
@ARG // 1757
A=M+1 // 1758
D=M // 1759
@SP // 1760
AM=M+1 // 1761
A=A-1 // 1762
M=D // 1763
@LCL // 1764
A=M+1 // 1765
A=A+1 // 1766
D=M // 1767
@SP // 1768
AM=M-1 // 1769
D=D&M // 1770
@DO_EQ // 1771
0;JMP // 1772
(Math.multiply.EQ.8)
D=!D // 1773
@Math.multiply$IF_TRUE6 // 1774
D;JNE // 1775

////GotoInstruction{label='Math.multiply$IF_FALSE6}
// goto Math.multiply$IF_FALSE6
@Math.multiply$IF_FALSE6 // 1776
0;JMP // 1777

////LabelInstruction{label='Math.multiply$IF_TRUE6}
// label Math.multiply$IF_TRUE6
(Math.multiply$IF_TRUE6)

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

@ARG // 1778
A=M // 1779
D=M // 1780
@LCL // 1781
A=M // 1782
M=D+M // 1783

////LabelInstruction{label='Math.multiply$IF_FALSE6}
// label Math.multiply$IF_FALSE6
(Math.multiply$IF_FALSE6)

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

@ARG // 1784
A=M // 1785
D=M // 1786
@ARG // 1787
A=M // 1788
M=D+M // 1789

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

@LCL // 1790
A=M+1 // 1791
M=M+1 // 1792

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

@LCL // 1793
A=M+1 // 1794
A=A+1 // 1795
D=M // 1796
@LCL // 1797
A=M+1 // 1798
A=A+1 // 1799
M=D+M // 1800

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 1801
0;JMP // 1802

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 1803
A=M // 1804
D=M // 1805
@SP // 1806
AM=M+1 // 1807
A=A-1 // 1808
M=D // 1809
@RETURN // 1810
0;JMP // 1811

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1812
D=A // 1813
@SP // 1814
AM=D+M // 1815
A=A-1 // 1816
M=0 // 1817
A=A-1 // 1818
M=0 // 1819
A=A-1 // 1820
M=0 // 1821

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1822
A=M // 1823
D=M // 1824
@SP // 1825
AM=M+1 // 1826
A=A-1 // 1827
M=D // 1828
// call Math.abs
@6 // 1829
D=A // 1830
@14 // 1831
M=D // 1832
@Math.abs // 1833
D=A // 1834
@13 // 1835
M=D // 1836
@Math.divide.ret.0 // 1837
D=A // 1838
@CALL // 1839
0;JMP // 1840
(Math.divide.ret.0)
@SP // 1841
AM=M-1 // 1842
D=M // 1843
@LCL // 1844
A=M+1 // 1845
M=D // 1846

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1847
A=M+1 // 1848
D=M // 1849
@SP // 1850
AM=M+1 // 1851
A=A-1 // 1852
M=D // 1853
// call Math.abs
@6 // 1854
D=A // 1855
@14 // 1856
M=D // 1857
@Math.abs // 1858
D=A // 1859
@13 // 1860
M=D // 1861
@Math.divide.ret.1 // 1862
D=A // 1863
@CALL // 1864
0;JMP // 1865
(Math.divide.ret.1)
@SP // 1866
AM=M-1 // 1867
D=M // 1868
@LCL // 1869
A=M+1 // 1870
A=A+1 // 1871
M=D // 1872

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.9 // 1873
D=A // 1874
@SP // 1875
AM=M+1 // 1876
A=A-1 // 1877
M=D // 1878
@LCL // 1879
A=M+1 // 1880
A=A+1 // 1881
D=M // 1882
A=A-1 // 1883
D=D-M // 1884
@DO_GT // 1885
0;JMP // 1886
(Math.divide.GT.9)
@Math.divide$IF_TRUE1 // 1887
D;JNE // 1888

////GotoInstruction{label='Math.divide$IF_FALSE1}
// goto Math.divide$IF_FALSE1
@Math.divide$IF_FALSE1 // 1889
0;JMP // 1890

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1891
AM=M+1 // 1892
A=A-1 // 1893
M=0 // 1894
@RETURN // 1895
0;JMP // 1896

////LabelInstruction{label='Math.divide$IF_FALSE1}
// label Math.divide$IF_FALSE1
(Math.divide$IF_FALSE1)

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

@LCL // 1897
A=M+1 // 1898
D=M // 1899
@SP // 1900
AM=M+1 // 1901
A=A-1 // 1902
M=D // 1903
@LCL // 1904
A=M+1 // 1905
A=A+1 // 1906
D=M // 1907
D=D+M // 1908
@SP // 1909
AM=M+1 // 1910
A=A-1 // 1911
M=D // 1912
// call Math.divide
@7 // 1913
D=A // 1914
@14 // 1915
M=D // 1916
@Math.divide // 1917
D=A // 1918
@13 // 1919
M=D // 1920
@Math.divide.ret.2 // 1921
D=A // 1922
@CALL // 1923
0;JMP // 1924
(Math.divide.ret.2)
@SP // 1925
AM=M-1 // 1926
D=M // 1927
@LCL // 1928
A=M // 1929
M=D // 1930

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{Math.multiply}},
//            binaryOp: "SUB"
//        ),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE2}}
@Math.divide.LT.10 // 1931
D=A // 1932
@SP // 1933
AM=M+1 // 1934
A=A-1 // 1935
M=D // 1936
@LCL // 1937
A=M+1 // 1938
D=M // 1939
@SP // 1940
AM=M+1 // 1941
A=A-1 // 1942
M=D // 1943
@LCL // 1944
A=M // 1945
D=M // 1946
D=D+M // 1947
@SP // 1948
AM=M+1 // 1949
A=A-1 // 1950
M=D // 1951
@LCL // 1952
A=M+1 // 1953
A=A+1 // 1954
D=M // 1955
@SP // 1956
AM=M+1 // 1957
A=A-1 // 1958
M=D // 1959
// call Math.multiply
@7 // 1960
D=A // 1961
@14 // 1962
M=D // 1963
@Math.multiply // 1964
D=A // 1965
@13 // 1966
M=D // 1967
@Math.divide.ret.3 // 1968
D=A // 1969
@CALL // 1970
0;JMP // 1971
(Math.divide.ret.3)
@SP // 1972
AM=M-1 // 1973
D=M // 1974
@SP // 1975
AM=M-1 // 1976
D=M-D // 1977
@SP // 1978
AM=M+1 // 1979
A=A-1 // 1980
M=D // 1981
@LCL // 1982
A=M+1 // 1983
A=A+1 // 1984
D=M // 1985
@SP // 1986
AM=M-1 // 1987
D=M-D // 1988
@DO_LT // 1989
0;JMP // 1990
(Math.divide.LT.10)
@Math.divide$IF_TRUE2 // 1991
D;JNE // 1992

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 1993
0;JMP // 1994

////LabelInstruction{label='Math.divide$IF_TRUE2}
// label Math.divide$IF_TRUE2
(Math.divide$IF_TRUE2)

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
//                    binaryOp: "GT"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "GT"
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
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE3}}
@Math.divide.LT.11 // 1995
D=A // 1996
@SP // 1997
AM=M+1 // 1998
A=A-1 // 1999
M=D // 2000
@ARG // 2001
A=M // 2002
D=M // 2003
@DO_LT // 2004
0;JMP // 2005
(Math.divide.LT.11)
@SP // 2006
AM=M+1 // 2007
A=A-1 // 2008
M=D // 2009
@Math.divide.GT.12 // 2010
D=A // 2011
@SP // 2012
AM=M+1 // 2013
A=A-1 // 2014
M=D // 2015
@ARG // 2016
A=M+1 // 2017
D=M // 2018
@DO_GT // 2019
0;JMP // 2020
(Math.divide.GT.12)
@SP // 2021
AM=M-1 // 2022
D=D&M // 2023
@SP // 2024
AM=M+1 // 2025
A=A-1 // 2026
M=D // 2027
@Math.divide.GT.13 // 2028
D=A // 2029
@SP // 2030
AM=M+1 // 2031
A=A-1 // 2032
M=D // 2033
@ARG // 2034
A=M // 2035
D=M // 2036
@DO_GT // 2037
0;JMP // 2038
(Math.divide.GT.13)
@SP // 2039
AM=M+1 // 2040
A=A-1 // 2041
M=D // 2042
@Math.divide.LT.14 // 2043
D=A // 2044
@SP // 2045
AM=M+1 // 2046
A=A-1 // 2047
M=D // 2048
@ARG // 2049
A=M+1 // 2050
D=M // 2051
@DO_LT // 2052
0;JMP // 2053
(Math.divide.LT.14)
@SP // 2054
AM=M-1 // 2055
D=D&M // 2056
@SP // 2057
AM=M-1 // 2058
D=D|M // 2059
@Math.divide$IF_TRUE3 // 2060
D;JNE // 2061

////GotoInstruction{label='Math.divide$IF_FALSE3}
// goto Math.divide$IF_FALSE3
@Math.divide$IF_FALSE3 // 2062
0;JMP // 2063

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2064
A=M // 2065
D=-M // 2066
@LCL // 2067
A=M // 2068
M=D // 2069

////LabelInstruction{label='Math.divide$IF_FALSE3}
// label Math.divide$IF_FALSE3
(Math.divide$IF_FALSE3)

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 2070
A=M // 2071
D=M // 2072
D=D+M // 2073
@SP // 2074
AM=M+1 // 2075
A=A-1 // 2076
M=D // 2077
@RETURN // 2078
0;JMP // 2079

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 2080
0;JMP // 2081

////LabelInstruction{label='Math.divide$IF_FALSE2}
// label Math.divide$IF_FALSE2
(Math.divide$IF_FALSE2)

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
//                    binaryOp: "GT"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "GT"
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
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE4}}
@Math.divide.LT.15 // 2082
D=A // 2083
@SP // 2084
AM=M+1 // 2085
A=A-1 // 2086
M=D // 2087
@ARG // 2088
A=M // 2089
D=M // 2090
@DO_LT // 2091
0;JMP // 2092
(Math.divide.LT.15)
@SP // 2093
AM=M+1 // 2094
A=A-1 // 2095
M=D // 2096
@Math.divide.GT.16 // 2097
D=A // 2098
@SP // 2099
AM=M+1 // 2100
A=A-1 // 2101
M=D // 2102
@ARG // 2103
A=M+1 // 2104
D=M // 2105
@DO_GT // 2106
0;JMP // 2107
(Math.divide.GT.16)
@SP // 2108
AM=M-1 // 2109
D=D&M // 2110
@SP // 2111
AM=M+1 // 2112
A=A-1 // 2113
M=D // 2114
@Math.divide.GT.17 // 2115
D=A // 2116
@SP // 2117
AM=M+1 // 2118
A=A-1 // 2119
M=D // 2120
@ARG // 2121
A=M // 2122
D=M // 2123
@DO_GT // 2124
0;JMP // 2125
(Math.divide.GT.17)
@SP // 2126
AM=M+1 // 2127
A=A-1 // 2128
M=D // 2129
@Math.divide.LT.18 // 2130
D=A // 2131
@SP // 2132
AM=M+1 // 2133
A=A-1 // 2134
M=D // 2135
@ARG // 2136
A=M+1 // 2137
D=M // 2138
@DO_LT // 2139
0;JMP // 2140
(Math.divide.LT.18)
@SP // 2141
AM=M-1 // 2142
D=D&M // 2143
@SP // 2144
AM=M-1 // 2145
D=D|M // 2146
@Math.divide$IF_TRUE4 // 2147
D;JNE // 2148

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 2149
0;JMP // 2150

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2151
A=M // 2152
D=-M // 2153
@LCL // 2154
A=M // 2155
M=D // 2156

////LabelInstruction{label='Math.divide$IF_FALSE4}
// label Math.divide$IF_FALSE4
(Math.divide$IF_FALSE4)

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
@LCL // 2157
A=M // 2158
D=M // 2159
D=D+M // 2160
D=D+1 // 2161
@SP // 2162
AM=M+1 // 2163
A=A-1 // 2164
M=D // 2165
@RETURN // 2166
0;JMP // 2167

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

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
@ARG // 2168
A=M // 2169
D=M // 2170
@SP // 2171
AM=M+1 // 2172
A=A-1 // 2173
M=D // 2174
@ARG // 2175
A=M // 2176
D=M // 2177
@SP // 2178
AM=M+1 // 2179
A=A-1 // 2180
M=D // 2181
@ARG // 2182
A=M+1 // 2183
D=M // 2184
@SP // 2185
AM=M+1 // 2186
A=A-1 // 2187
M=D // 2188
// call Math.divide
@7 // 2189
D=A // 2190
@14 // 2191
M=D // 2192
@Math.divide // 2193
D=A // 2194
@13 // 2195
M=D // 2196
@Math.mod.ret.0 // 2197
D=A // 2198
@CALL // 2199
0;JMP // 2200
(Math.mod.ret.0)
@ARG // 2201
A=M+1 // 2202
D=M // 2203
@SP // 2204
AM=M+1 // 2205
A=A-1 // 2206
M=D // 2207
// call Math.multiply
@7 // 2208
D=A // 2209
@14 // 2210
M=D // 2211
@Math.multiply // 2212
D=A // 2213
@13 // 2214
M=D // 2215
@Math.mod.ret.1 // 2216
D=A // 2217
@CALL // 2218
0;JMP // 2219
(Math.mod.ret.1)
@SP // 2220
AM=M-1 // 2221
D=M // 2222
@SP // 2223
AM=M-1 // 2224
D=M-D // 2225
@SP // 2226
AM=M+1 // 2227
A=A-1 // 2228
M=D // 2229
@RETURN // 2230
0;JMP // 2231

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
@Math.0 // 2232
D=M // 2233
@SP // 2234
AM=M+1 // 2235
A=A-1 // 2236
M=D // 2237
@ARG // 2238
A=M // 2239
D=M // 2240
@SP // 2241
AM=M-1 // 2242
A=D+M // 2243
D=M // 2244
@SP // 2245
AM=M+1 // 2246
A=A-1 // 2247
M=D // 2248
@RETURN // 2249
0;JMP // 2250

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 2251
D=A // 2252
@SP // 2253
AM=D+M // 2254
A=A-1 // 2255
M=0 // 2256
A=A-1 // 2257
M=0 // 2258
A=A-1 // 2259
M=0 // 2260
A=A-1 // 2261
M=0 // 2262

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2263
A=M // 2264
M=0 // 2265

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 2266
D=A // 2267
@LCL // 2268
A=M+1 // 2269
M=D // 2270

////LabelInstruction{label='Math.sqrt_WHILE_EXP1}
// label Math.sqrt_WHILE_EXP1
(Math.sqrt_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Math.sqrt_WHILE_END1}}
@Math.sqrt.LT.19 // 2271
D=A // 2272
@SP // 2273
AM=M+1 // 2274
A=A-1 // 2275
M=D // 2276
@LCL // 2277
A=M+1 // 2278
D=M // 2279
@DO_LT // 2280
0;JMP // 2281
(Math.sqrt.LT.19)
@Math.sqrt_WHILE_END1 // 2282
D;JNE // 2283

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

@LCL // 2284
A=M // 2285
D=M // 2286
@SP // 2287
AM=M+1 // 2288
A=A-1 // 2289
M=D // 2290
@Math.0 // 2291
D=M // 2292
@SP // 2293
AM=M+1 // 2294
A=A-1 // 2295
M=D // 2296
@LCL // 2297
A=M+1 // 2298
D=M // 2299
@SP // 2300
AM=M-1 // 2301
A=D+M // 2302
D=M // 2303
@SP // 2304
AM=M-1 // 2305
D=D+M // 2306
@LCL // 2307
A=M+1 // 2308
A=A+1 // 2309
M=D // 2310

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 2311
D=A // 2312
@SP // 2313
M=D+M // 2314
@LCL // 2315
A=M+1 // 2316
A=A+1 // 2317
D=M // 2318
@SP // 2319
A=M-1 // 2320
M=D // 2321
A=A-1 // 2322
M=D // 2323
// call Math.multiply
@7 // 2324
D=A // 2325
@14 // 2326
M=D // 2327
@Math.multiply // 2328
D=A // 2329
@13 // 2330
M=D // 2331
@Math.sqrt.ret.0 // 2332
D=A // 2333
@CALL // 2334
0;JMP // 2335
(Math.sqrt.ret.0)
@SP // 2336
AM=M-1 // 2337
D=M // 2338
@LCL // 2339
A=M+1 // 2340
A=A+1 // 2341
A=A+1 // 2342
M=D // 2343

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 3"),
//                right:
//                    PushInstruction("argument 0"),
//                binaryOp: "GT"
//            ),
//NOT),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 3"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "GT"
//        ),
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Math.sqrt$IF_TRUE1}}
@Math.sqrt.GT.20 // 2344
D=A // 2345
@SP // 2346
AM=M+1 // 2347
A=A-1 // 2348
M=D // 2349
@LCL // 2350
A=M+1 // 2351
A=A+1 // 2352
A=A+1 // 2353
D=M // 2354
@SP // 2355
AM=M+1 // 2356
A=A-1 // 2357
M=D // 2358
@ARG // 2359
A=M // 2360
D=M // 2361
@SP // 2362
AM=M-1 // 2363
D=M-D // 2364
@DO_GT // 2365
0;JMP // 2366
(Math.sqrt.GT.20)
@SP // 2367
AM=M+1 // 2368
A=A-1 // 2369
M=D // 2370
@SP // 2371
A=M-1 // 2372
M=!D // 2373
@Math.sqrt.GT.21 // 2374
D=A // 2375
@SP // 2376
AM=M+1 // 2377
A=A-1 // 2378
M=D // 2379
@LCL // 2380
A=M+1 // 2381
A=A+1 // 2382
A=A+1 // 2383
D=M // 2384
@DO_GT // 2385
0;JMP // 2386
(Math.sqrt.GT.21)
@SP // 2387
AM=M-1 // 2388
D=D&M // 2389
@Math.sqrt$IF_TRUE1 // 2390
D;JNE // 2391

////GotoInstruction{label='Math.sqrt$IF_FALSE1}
// goto Math.sqrt$IF_FALSE1
@Math.sqrt$IF_FALSE1 // 2392
0;JMP // 2393

////LabelInstruction{label='Math.sqrt$IF_TRUE1}
// label Math.sqrt$IF_TRUE1
(Math.sqrt$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2394
A=M+1 // 2395
A=A+1 // 2396
D=M // 2397
@LCL // 2398
A=M // 2399
M=D // 2400

////LabelInstruction{label='Math.sqrt$IF_FALSE1}
// label Math.sqrt$IF_FALSE1
(Math.sqrt$IF_FALSE1)

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

@LCL // 2401
A=M+1 // 2402
M=M-1 // 2403

////GotoInstruction{label='Math.sqrt_WHILE_EXP1}
// goto Math.sqrt_WHILE_EXP1
@Math.sqrt_WHILE_EXP1 // 2404
0;JMP // 2405

////LabelInstruction{label='Math.sqrt_WHILE_END1}
// label Math.sqrt_WHILE_END1
(Math.sqrt_WHILE_END1)

////PushInstruction("local 0")
@LCL // 2406
A=M // 2407
D=M // 2408
@SP // 2409
AM=M+1 // 2410
A=A-1 // 2411
M=D // 2412
@RETURN // 2413
0;JMP // 2414

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.max$IF_TRUE1}}
@Math.max.GT.22 // 2415
D=A // 2416
@SP // 2417
AM=M+1 // 2418
A=A-1 // 2419
M=D // 2420
@ARG // 2421
A=M+1 // 2422
D=M // 2423
A=A-1 // 2424
D=M-D // 2425
@DO_GT // 2426
0;JMP // 2427
(Math.max.GT.22)
@Math.max$IF_TRUE1 // 2428
D;JNE // 2429

////GotoInstruction{label='Math.max$IF_FALSE1}
// goto Math.max$IF_FALSE1
@Math.max$IF_FALSE1 // 2430
0;JMP // 2431

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 2432
A=M // 2433
D=M // 2434
@SP // 2435
AM=M+1 // 2436
A=A-1 // 2437
M=D // 2438
@RETURN // 2439
0;JMP // 2440

////LabelInstruction{label='Math.max$IF_FALSE1}
// label Math.max$IF_FALSE1
(Math.max$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 2441
A=M+1 // 2442
D=M // 2443
@SP // 2444
AM=M+1 // 2445
A=A-1 // 2446
M=D // 2447
@RETURN // 2448
0;JMP // 2449

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Math.min$IF_TRUE1}}
@Math.min.LT.23 // 2450
D=A // 2451
@SP // 2452
AM=M+1 // 2453
A=A-1 // 2454
M=D // 2455
@ARG // 2456
A=M+1 // 2457
D=M // 2458
A=A-1 // 2459
D=M-D // 2460
@DO_LT // 2461
0;JMP // 2462
(Math.min.LT.23)
@Math.min$IF_TRUE1 // 2463
D;JNE // 2464

////GotoInstruction{label='Math.min$IF_FALSE1}
// goto Math.min$IF_FALSE1
@Math.min$IF_FALSE1 // 2465
0;JMP // 2466

////LabelInstruction{label='Math.min$IF_TRUE1}
// label Math.min$IF_TRUE1
(Math.min$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 2467
A=M // 2468
D=M // 2469
@SP // 2470
AM=M+1 // 2471
A=A-1 // 2472
M=D // 2473
@RETURN // 2474
0;JMP // 2475

////LabelInstruction{label='Math.min$IF_FALSE1}
// label Math.min$IF_FALSE1
(Math.min$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 2476
A=M+1 // 2477
D=M // 2478
@SP // 2479
AM=M+1 // 2480
A=A-1 // 2481
M=D // 2482
@RETURN // 2483
0;JMP // 2484

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2485
A=M // 2486
D=M // 2487
@SP // 2488
AM=M+1 // 2489
A=A-1 // 2490
M=D // 2491
@ARG // 2492
A=M // 2493
D=M // 2494
@SP // 2495
AM=M+1 // 2496
A=A-1 // 2497
M=D // 2498
@SP // 2499
A=M-1 // 2500
M=-D // 2501
// call Math.max
@7 // 2502
D=A // 2503
@14 // 2504
M=D // 2505
@Math.max // 2506
D=A // 2507
@13 // 2508
M=D // 2509
@Math.abs.ret.0 // 2510
D=A // 2511
@CALL // 2512
0;JMP // 2513
(Math.abs.ret.0)
@RETURN // 2514
0;JMP // 2515

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 2516
M=M+1 // 2517
AM=M+1 // 2518
A=A-1 // 2519
M=0 // 2520
A=A-1 // 2521
M=0 // 2522

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

@2055 // 2523
D=A // 2524
@LCL // 2525
A=M // 2526
M=D // 2527

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
@LCL // 2528
A=M // 2529
D=M // 2530
@SP // 2531
AM=M+1 // 2532
A=A-1 // 2533
M=D // 2534
@LCL // 2535
A=M // 2536
D=M // 2537
@16384 // 2538
D=A-D // 2539
@5 // 2540
D=D-A // 2541
@SP // 2542
AM=M-1 // 2543
A=M // 2544
M=D // 2545

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2546
A=M // 2547
D=M // 2548
@SP // 2549
AM=M+1 // 2550
A=A-1 // 2551
M=D+1 // 2552
D=1 // 2553
@SP // 2554
AM=M-1 // 2555
A=M // 2556
M=D // 2557

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2558
A=M // 2559
D=M // 2560
@2 // 2561
D=D+A // 2562
@SP // 2563
AM=M+1 // 2564
A=A-1 // 2565
M=D // 2566
D=0 // 2567
@SP // 2568
AM=M-1 // 2569
A=M // 2570
M=D // 2571

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2572
A=M // 2573
D=M // 2574
@3 // 2575
D=D+A // 2576
@SP // 2577
AM=M+1 // 2578
A=A-1 // 2579
M=D // 2580
D=0 // 2581
@SP // 2582
AM=M-1 // 2583
A=M // 2584
M=D // 2585

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2586
A=M // 2587
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
@Memory.init.ret.0 // 2601
D=A // 2602
@CALL // 2603
0;JMP // 2604
(Memory.init.ret.0)
@SP // 2605
M=M-1 // 2606

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

@2054 // 2607
D=A // 2608
@SP // 2609
AM=M+1 // 2610
A=A-1 // 2611
M=D // 2612
@2054 // 2613
D=A // 2614
@SP // 2615
AM=M+1 // 2616
A=A-1 // 2617
M=D // 2618
@LCL // 2619
A=M // 2620
D=M // 2621
@SP // 2622
AM=M+1 // 2623
A=A-1 // 2624
M=D // 2625
// call Memory.add_node
@7 // 2626
D=A // 2627
@14 // 2628
M=D // 2629
@Memory.add_node // 2630
D=A // 2631
@13 // 2632
M=D // 2633
@Memory.init.ret.1 // 2634
D=A // 2635
@CALL // 2636
0;JMP // 2637
(Memory.init.ret.1)
@SP // 2638
M=M-1 // 2639

////PushInstruction("constant 0")
@SP // 2640
AM=M+1 // 2641
A=A-1 // 2642
M=0 // 2643
@RETURN // 2644
0;JMP // 2645

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2646
D=A // 2647
@SP // 2648
AM=D+M // 2649
A=A-1 // 2650
M=0 // 2651
A=A-1 // 2652
M=0 // 2653
A=A-1 // 2654
M=0 // 2655
A=A-1 // 2656
M=0 // 2657
A=A-1 // 2658
M=0 // 2659

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2660
A=M // 2661
D=M // 2662
@SP // 2663
AM=M+1 // 2664
A=A-1 // 2665
M=D // 2666
// call Memory.getBinIndex
@6 // 2667
D=A // 2668
@14 // 2669
M=D // 2670
@Memory.getBinIndex // 2671
D=A // 2672
@13 // 2673
M=D // 2674
@Memory.alloc.ret.0 // 2675
D=A // 2676
@CALL // 2677
0;JMP // 2678
(Memory.alloc.ret.0)
@SP // 2679
AM=M-1 // 2680
D=M // 2681
@LCL // 2682
A=M // 2683
M=D // 2684

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

@LCL // 2685
A=M // 2686
D=M // 2687
@2048 // 2688
D=D+A // 2689
@LCL // 2690
A=M+1 // 2691
M=D // 2692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2693
A=M+1 // 2694
D=M // 2695
@SP // 2696
AM=M+1 // 2697
A=A-1 // 2698
M=D // 2699
@ARG // 2700
A=M // 2701
D=M // 2702
@SP // 2703
AM=M+1 // 2704
A=A-1 // 2705
M=D // 2706
// call Memory.get_best_fit
@7 // 2707
D=A // 2708
@14 // 2709
M=D // 2710
@Memory.get_best_fit // 2711
D=A // 2712
@13 // 2713
M=D // 2714
@Memory.alloc.ret.1 // 2715
D=A // 2716
@CALL // 2717
0;JMP // 2718
(Memory.alloc.ret.1)
@SP // 2719
AM=M-1 // 2720
D=M // 2721
@LCL // 2722
A=M+1 // 2723
A=A+1 // 2724
M=D // 2725

////LabelInstruction{label='Memory.alloc_WHILE_EXP1}
// label Memory.alloc_WHILE_EXP1
(Memory.alloc_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.alloc_WHILE_END1}}
@Memory.alloc.EQ.0 // 2726
D=A // 2727
@SP // 2728
AM=M+1 // 2729
A=A-1 // 2730
M=D // 2731
@LCL // 2732
A=M+1 // 2733
A=A+1 // 2734
D=M // 2735
@DO_EQ // 2736
0;JMP // 2737
(Memory.alloc.EQ.0)
D=!D // 2738
@Memory.alloc_WHILE_END1 // 2739
D;JNE // 2740

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("constant 1"),
//                binaryOp: "ADD"
//            ),
//        right:
//            PushInstruction("constant 7"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE1}}
@Memory.alloc.LT.1 // 2741
D=A // 2742
@SP // 2743
AM=M+1 // 2744
A=A-1 // 2745
M=D // 2746
@LCL // 2747
A=M // 2748
D=M // 2749
D=D+1 // 2750
@7 // 2751
D=D-A // 2752
@DO_LT // 2753
0;JMP // 2754
(Memory.alloc.LT.1)
D=!D // 2755
@Memory.alloc$IF_TRUE1 // 2756
D;JNE // 2757

////GotoInstruction{label='Memory.alloc$IF_FALSE1}
// goto Memory.alloc$IF_FALSE1
@Memory.alloc$IF_FALSE1 // 2758
0;JMP // 2759

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2760
AM=M+1 // 2761
A=A-1 // 2762
M=0 // 2763
@RETURN // 2764
0;JMP // 2765

////LabelInstruction{label='Memory.alloc$IF_FALSE1}
// label Memory.alloc$IF_FALSE1
(Memory.alloc$IF_FALSE1)

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

@LCL // 2766
A=M // 2767
M=M+1 // 2768

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

@LCL // 2769
A=M // 2770
D=M // 2771
@2048 // 2772
D=D+A // 2773
@LCL // 2774
A=M+1 // 2775
M=D // 2776

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2777
A=M+1 // 2778
D=M // 2779
@SP // 2780
AM=M+1 // 2781
A=A-1 // 2782
M=D // 2783
@ARG // 2784
A=M // 2785
D=M // 2786
@SP // 2787
AM=M+1 // 2788
A=A-1 // 2789
M=D // 2790
// call Memory.get_best_fit
@7 // 2791
D=A // 2792
@14 // 2793
M=D // 2794
@Memory.get_best_fit // 2795
D=A // 2796
@13 // 2797
M=D // 2798
@Memory.alloc.ret.2 // 2799
D=A // 2800
@CALL // 2801
0;JMP // 2802
(Memory.alloc.ret.2)
@SP // 2803
AM=M-1 // 2804
D=M // 2805
@LCL // 2806
A=M+1 // 2807
A=A+1 // 2808
M=D // 2809

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 2810
0;JMP // 2811

////LabelInstruction{label='Memory.alloc_WHILE_END1}
// label Memory.alloc_WHILE_END1
(Memory.alloc_WHILE_END1)

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

@LCL // 2812
A=M+1 // 2813
A=A+1 // 2814
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
@Memory.alloc.ret.3 // 2831
D=A // 2832
@CALL // 2833
0;JMP // 2834
(Memory.alloc.ret.3)
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
A=A+1 // 2846
D=M // 2847
@SP // 2848
AM=M+1 // 2849
A=A-1 // 2850
M=D // 2851
// call Memory.remove_node
@7 // 2852
D=A // 2853
@14 // 2854
M=D // 2855
@Memory.remove_node // 2856
D=A // 2857
@13 // 2858
M=D // 2859
@Memory.alloc.ret.4 // 2860
D=A // 2861
@CALL // 2862
0;JMP // 2863
(Memory.alloc.ret.4)
@SP // 2864
M=M-1 // 2865

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

@LCL // 2866
A=M+1 // 2867
A=A+1 // 2868
D=M // 2869
@0 // 2870
A=D+A // 2871
D=M // 2872
@SP // 2873
AM=M+1 // 2874
A=A-1 // 2875
M=D // 2876
@ARG // 2877
A=M // 2878
D=M // 2879
@SP // 2880
AM=M-1 // 2881
D=M-D // 2882
@LCL // 2883
A=M+1 // 2884
A=A+1 // 2885
A=A+1 // 2886
M=D // 2887

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.2 // 2888
D=A // 2889
@SP // 2890
AM=M+1 // 2891
A=A-1 // 2892
M=D // 2893
@LCL // 2894
A=M+1 // 2895
A=A+1 // 2896
A=A+1 // 2897
D=M // 2898
@5 // 2899
D=D-A // 2900
@DO_GT // 2901
0;JMP // 2902
(Memory.alloc.GT.2)
@Memory.alloc$IF_TRUE2 // 2903
D;JNE // 2904

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 2905
0;JMP // 2906

////LabelInstruction{label='Memory.alloc$IF_TRUE2}
// label Memory.alloc$IF_TRUE2
(Memory.alloc$IF_TRUE2)

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2907
A=M+1 // 2908
A=A+1 // 2909
D=M // 2910
@SP // 2911
AM=M+1 // 2912
A=A-1 // 2913
M=D // 2914
@ARG // 2915
A=M // 2916
D=M // 2917
@SP // 2918
AM=M-1 // 2919
A=M // 2920
M=D // 2921

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2922
A=M+1 // 2923
A=A+1 // 2924
D=M // 2925
@SP // 2926
AM=M+1 // 2927
A=A-1 // 2928
M=D+1 // 2929
D=0 // 2930
@SP // 2931
AM=M-1 // 2932
A=M // 2933
M=D // 2934

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2935
A=M+1 // 2936
A=A+1 // 2937
D=M // 2938
@SP // 2939
AM=M+1 // 2940
A=A-1 // 2941
M=D // 2942
// call Memory.create_foot
@6 // 2943
D=A // 2944
@14 // 2945
M=D // 2946
@Memory.create_foot // 2947
D=A // 2948
@13 // 2949
M=D // 2950
@Memory.alloc.ret.5 // 2951
D=A // 2952
@CALL // 2953
0;JMP // 2954
(Memory.alloc.ret.5)
@SP // 2955
M=M-1 // 2956

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

@LCL // 2957
A=M+1 // 2958
A=A+1 // 2959
D=M // 2960
@SP // 2961
AM=M+1 // 2962
A=A-1 // 2963
M=D // 2964
@ARG // 2965
A=M // 2966
D=M // 2967
@SP // 2968
AM=M-1 // 2969
D=D+M // 2970
@5 // 2971
D=D+A // 2972
@SP // 2973
AM=M+1 // 2974
A=A-1 // 2975
M=D // 2976
@LCL // 2977
D=M // 2978
@4 // 2979
A=D+A // 2980
D=A // 2981
@R13 // 2982
M=D // 2983
@SP // 2984
AM=M-1 // 2985
D=M // 2986
@R13 // 2987
A=M // 2988
M=D // 2989

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
@LCL // 2990
D=M // 2991
@4 // 2992
A=D+A // 2993
D=M // 2994
@SP // 2995
AM=M+1 // 2996
A=A-1 // 2997
M=D // 2998
@LCL // 2999
A=M+1 // 3000
A=A+1 // 3001
A=A+1 // 3002
D=M // 3003
@5 // 3004
D=D-A // 3005
@SP // 3006
AM=M-1 // 3007
A=M // 3008
M=D // 3009

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3010
D=M // 3011
@4 // 3012
A=D+A // 3013
D=M // 3014
@SP // 3015
AM=M+1 // 3016
A=A-1 // 3017
M=D+1 // 3018
D=1 // 3019
@SP // 3020
AM=M-1 // 3021
A=M // 3022
M=D // 3023

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3024
D=M // 3025
@4 // 3026
A=D+A // 3027
D=M // 3028
@SP // 3029
AM=M+1 // 3030
A=A-1 // 3031
M=D // 3032
// call Memory.create_foot
@6 // 3033
D=A // 3034
@14 // 3035
M=D // 3036
@Memory.create_foot // 3037
D=A // 3038
@13 // 3039
M=D // 3040
@Memory.alloc.ret.6 // 3041
D=A // 3042
@CALL // 3043
0;JMP // 3044
(Memory.alloc.ret.6)
@SP // 3045
M=M-1 // 3046

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

@LCL // 3047
A=M+1 // 3048
A=A+1 // 3049
A=A+1 // 3050
D=M // 3051
@SP // 3052
AM=M+1 // 3053
A=A-1 // 3054
M=D // 3055
// call Memory.getBinIndex
@6 // 3056
D=A // 3057
@14 // 3058
M=D // 3059
@Memory.getBinIndex // 3060
D=A // 3061
@13 // 3062
M=D // 3063
@Memory.alloc.ret.7 // 3064
D=A // 3065
@CALL // 3066
0;JMP // 3067
(Memory.alloc.ret.7)
@SP // 3068
AM=M-1 // 3069
D=M // 3070
@2048 // 3071
D=D+A // 3072
@SP // 3073
AM=M+1 // 3074
A=A-1 // 3075
M=D // 3076
@LCL // 3077
D=M // 3078
@4 // 3079
A=D+A // 3080
D=M // 3081
@SP // 3082
AM=M+1 // 3083
A=A-1 // 3084
M=D // 3085
// call Memory.add_node
@7 // 3086
D=A // 3087
@14 // 3088
M=D // 3089
@Memory.add_node // 3090
D=A // 3091
@13 // 3092
M=D // 3093
@Memory.alloc.ret.8 // 3094
D=A // 3095
@CALL // 3096
0;JMP // 3097
(Memory.alloc.ret.8)
@SP // 3098
M=M-1 // 3099

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 3100
0;JMP // 3101

////LabelInstruction{label='Memory.alloc$IF_FALSE2}
// label Memory.alloc$IF_FALSE2
(Memory.alloc$IF_FALSE2)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3102
A=M+1 // 3103
A=A+1 // 3104
D=M // 3105
@SP // 3106
AM=M+1 // 3107
A=A-1 // 3108
M=D+1 // 3109
D=0 // 3110
@SP // 3111
AM=M-1 // 3112
A=M // 3113
M=D // 3114

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3115
A=M+1 // 3116
A=A+1 // 3117
D=M // 3118
@SP // 3119
AM=M+1 // 3120
A=A-1 // 3121
M=D // 3122
// call Memory.create_foot
@6 // 3123
D=A // 3124
@14 // 3125
M=D // 3126
@Memory.create_foot // 3127
D=A // 3128
@13 // 3129
M=D // 3130
@Memory.alloc.ret.9 // 3131
D=A // 3132
@CALL // 3133
0;JMP // 3134
(Memory.alloc.ret.9)
@SP // 3135
M=M-1 // 3136

////LabelInstruction{label='Memory.alloc$IF_END2}
// label Memory.alloc$IF_END2
(Memory.alloc$IF_END2)

////BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)
@LCL // 3137
A=M+1 // 3138
A=A+1 // 3139
D=M // 3140
@4 // 3141
D=D+A // 3142
@SP // 3143
AM=M+1 // 3144
A=A-1 // 3145
M=D // 3146
@RETURN // 3147
0;JMP // 3148

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 3149
AM=M+1 // 3150
A=A-1 // 3151
M=0 // 3152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 3153
A=M // 3154
D=M // 3155
@SP // 3156
AM=M+1 // 3157
A=A-1 // 3158
M=D // 3159
// call Memory.alloc
@6 // 3160
D=A // 3161
@14 // 3162
M=D // 3163
@Memory.alloc // 3164
D=A // 3165
@13 // 3166
M=D // 3167
@Memory.calloc.ret.0 // 3168
D=A // 3169
@CALL // 3170
0;JMP // 3171
(Memory.calloc.ret.0)
@SP // 3172
AM=M-1 // 3173
D=M // 3174
@LCL // 3175
A=M // 3176
M=D // 3177

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 0"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.calloc$IF_TRUE1}}
@LCL // 3178
A=M // 3179
D=!M // 3180
@Memory.calloc$IF_TRUE1 // 3181
D;JNE // 3182

////GotoInstruction{label='Memory.calloc$IF_FALSE1}
// goto Memory.calloc$IF_FALSE1
@Memory.calloc$IF_FALSE1 // 3183
0;JMP // 3184

////LabelInstruction{label='Memory.calloc$IF_TRUE1}
// label Memory.calloc$IF_TRUE1
(Memory.calloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3185
AM=M+1 // 3186
A=A-1 // 3187
M=0 // 3188
@RETURN // 3189
0;JMP // 3190

////LabelInstruction{label='Memory.calloc$IF_FALSE1}
// label Memory.calloc$IF_FALSE1
(Memory.calloc$IF_FALSE1)

////LabelInstruction{label='Memory.calloc_WHILE_EXP1}
// label Memory.calloc_WHILE_EXP1
(Memory.calloc_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.calloc_WHILE_END1}}
@Memory.calloc.GT.3 // 3191
D=A // 3192
@SP // 3193
AM=M+1 // 3194
A=A-1 // 3195
M=D // 3196
@ARG // 3197
A=M // 3198
D=M // 3199
@DO_GT // 3200
0;JMP // 3201
(Memory.calloc.GT.3)
D=!D // 3202
@Memory.calloc_WHILE_END1 // 3203
D;JNE // 3204

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

@ARG // 3205
A=M // 3206
M=M-1 // 3207

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 3208
A=M // 3209
D=M // 3210
@SP // 3211
AM=M+1 // 3212
A=A-1 // 3213
M=D // 3214
@ARG // 3215
A=M // 3216
D=M // 3217
@SP // 3218
AM=M-1 // 3219
D=D+M // 3220
@SP // 3221
AM=M+1 // 3222
A=A-1 // 3223
M=D // 3224
D=0 // 3225
@SP // 3226
AM=M-1 // 3227
A=M // 3228
M=D // 3229

////GotoInstruction{label='Memory.calloc_WHILE_EXP1}
// goto Memory.calloc_WHILE_EXP1
@Memory.calloc_WHILE_EXP1 // 3230
0;JMP // 3231

////LabelInstruction{label='Memory.calloc_WHILE_END1}
// label Memory.calloc_WHILE_END1
(Memory.calloc_WHILE_END1)

////PushInstruction("local 0")
@LCL // 3232
A=M // 3233
D=M // 3234
@SP // 3235
AM=M+1 // 3236
A=A-1 // 3237
M=D // 3238
@RETURN // 3239
0;JMP // 3240

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3241
D=A // 3242
@SP // 3243
AM=D+M // 3244
A=A-1 // 3245
M=0 // 3246
A=A-1 // 3247
M=0 // 3248
A=A-1 // 3249
M=0 // 3250

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

@ARG // 3251
A=M // 3252
D=M // 3253
@4 // 3254
D=D-A // 3255
@LCL // 3256
A=M // 3257
M=D // 3258

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3259
A=M // 3260
D=M // 3261
@SP // 3262
AM=M+1 // 3263
A=A-1 // 3264
M=D+1 // 3265
D=1 // 3266
@SP // 3267
AM=M-1 // 3268
A=M // 3269
M=D // 3270

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

@LCL // 3271
A=M // 3272
D=M // 3273
@2 // 3274
A=D+A // 3275
D=M // 3276
@LCL // 3277
A=M+1 // 3278
M=D // 3279

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

@LCL // 3280
A=M // 3281
D=M // 3282
@3 // 3283
A=D+A // 3284
D=M // 3285
@LCL // 3286
A=M+1 // 3287
A=A+1 // 3288
M=D // 3289

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.4 // 3290
D=A // 3291
@SP // 3292
AM=M+1 // 3293
A=A-1 // 3294
M=D // 3295
@LCL // 3296
A=M+1 // 3297
D=M // 3298
@DO_EQ // 3299
0;JMP // 3300
(Memory.deAlloc.EQ.4)
D=!D // 3301
@Memory.deAlloc$IF_TRUE1 // 3302
D;JNE // 3303

////GotoInstruction{label='Memory.deAlloc$IF_FALSE1}
// goto Memory.deAlloc$IF_FALSE1
@Memory.deAlloc$IF_FALSE1 // 3304
0;JMP // 3305

////LabelInstruction{label='Memory.deAlloc$IF_TRUE1}
// label Memory.deAlloc$IF_TRUE1
(Memory.deAlloc$IF_TRUE1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE2}}
@Memory.deAlloc.EQ.5 // 3306
D=A // 3307
@SP // 3308
AM=M+1 // 3309
A=A-1 // 3310
M=D // 3311
@LCL // 3312
A=M+1 // 3313
D=M // 3314
A=D+1 // 3315
D=M // 3316
D=D-1 // 3317
@DO_EQ // 3318
0;JMP // 3319
(Memory.deAlloc.EQ.5)
@Memory.deAlloc$IF_TRUE2 // 3320
D;JNE // 3321

////GotoInstruction{label='Memory.deAlloc$IF_FALSE2}
// goto Memory.deAlloc$IF_FALSE2
@Memory.deAlloc$IF_FALSE2 // 3322
0;JMP // 3323

////LabelInstruction{label='Memory.deAlloc$IF_TRUE2}
// label Memory.deAlloc$IF_TRUE2
(Memory.deAlloc$IF_TRUE2)

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

@LCL // 3324
A=M+1 // 3325
D=M // 3326
@0 // 3327
A=D+A // 3328
D=M // 3329
@SP // 3330
AM=M+1 // 3331
A=A-1 // 3332
M=D // 3333
// call Memory.getBinIndex
@6 // 3334
D=A // 3335
@14 // 3336
M=D // 3337
@Memory.getBinIndex // 3338
D=A // 3339
@13 // 3340
M=D // 3341
@Memory.deAlloc.ret.0 // 3342
D=A // 3343
@CALL // 3344
0;JMP // 3345
(Memory.deAlloc.ret.0)
@SP // 3346
AM=M-1 // 3347
D=M // 3348
@2048 // 3349
D=D+A // 3350
@SP // 3351
AM=M+1 // 3352
A=A-1 // 3353
M=D // 3354
@LCL // 3355
A=M+1 // 3356
D=M // 3357
@SP // 3358
AM=M+1 // 3359
A=A-1 // 3360
M=D // 3361
// call Memory.remove_node
@7 // 3362
D=A // 3363
@14 // 3364
M=D // 3365
@Memory.remove_node // 3366
D=A // 3367
@13 // 3368
M=D // 3369
@Memory.deAlloc.ret.1 // 3370
D=A // 3371
@CALL // 3372
0;JMP // 3373
(Memory.deAlloc.ret.1)
@SP // 3374
M=M-1 // 3375

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
@LCL // 3376
A=M+1 // 3377
D=M // 3378
@SP // 3379
AM=M+1 // 3380
A=A-1 // 3381
M=D // 3382
@LCL // 3383
A=M+1 // 3384
D=M // 3385
@0 // 3386
A=D+A // 3387
D=M // 3388
@SP // 3389
AM=M+1 // 3390
A=A-1 // 3391
M=D // 3392
@LCL // 3393
A=M // 3394
D=M // 3395
@0 // 3396
A=D+A // 3397
D=M // 3398
@SP // 3399
AM=M-1 // 3400
D=D+M // 3401
@5 // 3402
D=D+A // 3403
@SP // 3404
AM=M-1 // 3405
A=M // 3406
M=D // 3407

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3408
A=M+1 // 3409
D=M // 3410
@SP // 3411
AM=M+1 // 3412
A=A-1 // 3413
M=D // 3414
// call Memory.create_foot
@6 // 3415
D=A // 3416
@14 // 3417
M=D // 3418
@Memory.create_foot // 3419
D=A // 3420
@13 // 3421
M=D // 3422
@Memory.deAlloc.ret.2 // 3423
D=A // 3424
@CALL // 3425
0;JMP // 3426
(Memory.deAlloc.ret.2)
@SP // 3427
M=M-1 // 3428

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3429
A=M+1 // 3430
D=M // 3431
@LCL // 3432
A=M // 3433
M=D // 3434

////LabelInstruction{label='Memory.deAlloc$IF_FALSE2}
// label Memory.deAlloc$IF_FALSE2
(Memory.deAlloc$IF_FALSE2)

////LabelInstruction{label='Memory.deAlloc$IF_FALSE1}
// label Memory.deAlloc$IF_FALSE1
(Memory.deAlloc$IF_FALSE1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE3}}
@Memory.deAlloc.EQ.6 // 3435
D=A // 3436
@SP // 3437
AM=M+1 // 3438
A=A-1 // 3439
M=D // 3440
@LCL // 3441
A=M+1 // 3442
A=A+1 // 3443
D=M // 3444
@DO_EQ // 3445
0;JMP // 3446
(Memory.deAlloc.EQ.6)
D=!D // 3447
@Memory.deAlloc$IF_TRUE3 // 3448
D;JNE // 3449

////GotoInstruction{label='Memory.deAlloc$IF_FALSE3}
// goto Memory.deAlloc$IF_FALSE3
@Memory.deAlloc$IF_FALSE3 // 3450
0;JMP // 3451

////LabelInstruction{label='Memory.deAlloc$IF_TRUE3}
// label Memory.deAlloc$IF_TRUE3
(Memory.deAlloc$IF_TRUE3)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 2"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE4}}
@Memory.deAlloc.EQ.7 // 3452
D=A // 3453
@SP // 3454
AM=M+1 // 3455
A=A-1 // 3456
M=D // 3457
@LCL // 3458
A=M+1 // 3459
A=A+1 // 3460
D=M // 3461
A=D+1 // 3462
D=M // 3463
D=D-1 // 3464
@DO_EQ // 3465
0;JMP // 3466
(Memory.deAlloc.EQ.7)
@Memory.deAlloc$IF_TRUE4 // 3467
D;JNE // 3468

////GotoInstruction{label='Memory.deAlloc$IF_FALSE4}
// goto Memory.deAlloc$IF_FALSE4
@Memory.deAlloc$IF_FALSE4 // 3469
0;JMP // 3470

////LabelInstruction{label='Memory.deAlloc$IF_TRUE4}
// label Memory.deAlloc$IF_TRUE4
(Memory.deAlloc$IF_TRUE4)

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

@LCL // 3471
A=M+1 // 3472
A=A+1 // 3473
D=M // 3474
@0 // 3475
A=D+A // 3476
D=M // 3477
@SP // 3478
AM=M+1 // 3479
A=A-1 // 3480
M=D // 3481
// call Memory.getBinIndex
@6 // 3482
D=A // 3483
@14 // 3484
M=D // 3485
@Memory.getBinIndex // 3486
D=A // 3487
@13 // 3488
M=D // 3489
@Memory.deAlloc.ret.3 // 3490
D=A // 3491
@CALL // 3492
0;JMP // 3493
(Memory.deAlloc.ret.3)
@SP // 3494
AM=M-1 // 3495
D=M // 3496
@2048 // 3497
D=D+A // 3498
@SP // 3499
AM=M+1 // 3500
A=A-1 // 3501
M=D // 3502
@LCL // 3503
A=M+1 // 3504
A=A+1 // 3505
D=M // 3506
@SP // 3507
AM=M+1 // 3508
A=A-1 // 3509
M=D // 3510
// call Memory.remove_node
@7 // 3511
D=A // 3512
@14 // 3513
M=D // 3514
@Memory.remove_node // 3515
D=A // 3516
@13 // 3517
M=D // 3518
@Memory.deAlloc.ret.4 // 3519
D=A // 3520
@CALL // 3521
0;JMP // 3522
(Memory.deAlloc.ret.4)
@SP // 3523
M=M-1 // 3524

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
@LCL // 3525
A=M // 3526
D=M // 3527
@SP // 3528
AM=M+1 // 3529
A=A-1 // 3530
M=D // 3531
@LCL // 3532
A=M // 3533
D=M // 3534
@0 // 3535
A=D+A // 3536
D=M // 3537
@SP // 3538
AM=M+1 // 3539
A=A-1 // 3540
M=D // 3541
@LCL // 3542
A=M+1 // 3543
A=A+1 // 3544
D=M // 3545
@0 // 3546
A=D+A // 3547
D=M // 3548
@SP // 3549
AM=M-1 // 3550
D=D+M // 3551
@5 // 3552
D=D+A // 3553
@SP // 3554
AM=M-1 // 3555
A=M // 3556
M=D // 3557

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3558
A=M // 3559
D=M // 3560
@SP // 3561
AM=M+1 // 3562
A=A-1 // 3563
M=D // 3564
// call Memory.create_foot
@6 // 3565
D=A // 3566
@14 // 3567
M=D // 3568
@Memory.create_foot // 3569
D=A // 3570
@13 // 3571
M=D // 3572
@Memory.deAlloc.ret.5 // 3573
D=A // 3574
@CALL // 3575
0;JMP // 3576
(Memory.deAlloc.ret.5)
@SP // 3577
M=M-1 // 3578

////LabelInstruction{label='Memory.deAlloc$IF_FALSE4}
// label Memory.deAlloc$IF_FALSE4
(Memory.deAlloc$IF_FALSE4)

////LabelInstruction{label='Memory.deAlloc$IF_FALSE3}
// label Memory.deAlloc$IF_FALSE3
(Memory.deAlloc$IF_FALSE3)

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

@LCL // 3579
A=M // 3580
D=M // 3581
@0 // 3582
A=D+A // 3583
D=M // 3584
@SP // 3585
AM=M+1 // 3586
A=A-1 // 3587
M=D // 3588
// call Memory.getBinIndex
@6 // 3589
D=A // 3590
@14 // 3591
M=D // 3592
@Memory.getBinIndex // 3593
D=A // 3594
@13 // 3595
M=D // 3596
@Memory.deAlloc.ret.6 // 3597
D=A // 3598
@CALL // 3599
0;JMP // 3600
(Memory.deAlloc.ret.6)
@SP // 3601
AM=M-1 // 3602
D=M // 3603
@2048 // 3604
D=D+A // 3605
@SP // 3606
AM=M+1 // 3607
A=A-1 // 3608
M=D // 3609
@LCL // 3610
A=M // 3611
D=M // 3612
@SP // 3613
AM=M+1 // 3614
A=A-1 // 3615
M=D // 3616
// call Memory.add_node
@7 // 3617
D=A // 3618
@14 // 3619
M=D // 3620
@Memory.add_node // 3621
D=A // 3622
@13 // 3623
M=D // 3624
@Memory.deAlloc.ret.7 // 3625
D=A // 3626
@CALL // 3627
0;JMP // 3628
(Memory.deAlloc.ret.7)
@SP // 3629
M=M-1 // 3630

////PushInstruction("constant 0")
@SP // 3631
AM=M+1 // 3632
A=A-1 // 3633
M=0 // 3634
@RETURN // 3635
0;JMP // 3636

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 3637
D=A // 3638
@SP // 3639
AM=D+M // 3640
A=A-1 // 3641
M=0 // 3642
A=A-1 // 3643
M=0 // 3644
A=A-1 // 3645
M=0 // 3646
A=A-1 // 3647
M=0 // 3648

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc$IF_TRUE1}}
@Memory.realloc.EQ.8 // 3649
D=A // 3650
@SP // 3651
AM=M+1 // 3652
A=A-1 // 3653
M=D // 3654
@ARG // 3655
A=M // 3656
D=M // 3657
@DO_EQ // 3658
0;JMP // 3659
(Memory.realloc.EQ.8)
@Memory.realloc$IF_TRUE1 // 3660
D;JNE // 3661

////GotoInstruction{label='Memory.realloc$IF_FALSE1}
// goto Memory.realloc$IF_FALSE1
@Memory.realloc$IF_FALSE1 // 3662
0;JMP // 3663

////LabelInstruction{label='Memory.realloc$IF_TRUE1}
// label Memory.realloc$IF_TRUE1
(Memory.realloc$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3664
A=M+1 // 3665
D=M // 3666
@SP // 3667
AM=M+1 // 3668
A=A-1 // 3669
M=D // 3670
// call Memory.alloc
@6 // 3671
D=A // 3672
@14 // 3673
M=D // 3674
@Memory.alloc // 3675
D=A // 3676
@13 // 3677
M=D // 3678
@Memory.realloc.ret.0 // 3679
D=A // 3680
@CALL // 3681
0;JMP // 3682
(Memory.realloc.ret.0)
@RETURN // 3683
0;JMP // 3684

////LabelInstruction{label='Memory.realloc$IF_FALSE1}
// label Memory.realloc$IF_FALSE1
(Memory.realloc$IF_FALSE1)

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

@ARG // 3685
A=M // 3686
D=M // 3687
D=D-1 // 3688
@LCL // 3689
A=M+1 // 3690
A=A+1 // 3691
A=A+1 // 3692
M=D // 3693

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

@LCL // 3694
A=M+1 // 3695
A=A+1 // 3696
A=A+1 // 3697
D=M // 3698
@0 // 3699
A=D+A // 3700
D=M // 3701
@LCL // 3702
A=M // 3703
M=D // 3704

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3705
A=M+1 // 3706
D=M // 3707
@SP // 3708
AM=M+1 // 3709
A=A-1 // 3710
M=D // 3711
// call Memory.alloc
@6 // 3712
D=A // 3713
@14 // 3714
M=D // 3715
@Memory.alloc // 3716
D=A // 3717
@13 // 3718
M=D // 3719
@Memory.realloc.ret.1 // 3720
D=A // 3721
@CALL // 3722
0;JMP // 3723
(Memory.realloc.ret.1)
@SP // 3724
AM=M-1 // 3725
D=M // 3726
@LCL // 3727
A=M+1 // 3728
M=D // 3729

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc$IF_TRUE2}}
@Memory.realloc.EQ.9 // 3730
D=A // 3731
@SP // 3732
AM=M+1 // 3733
A=A-1 // 3734
M=D // 3735
@LCL // 3736
A=M+1 // 3737
D=M // 3738
@DO_EQ // 3739
0;JMP // 3740
(Memory.realloc.EQ.9)
@Memory.realloc$IF_TRUE2 // 3741
D;JNE // 3742

////GotoInstruction{label='Memory.realloc$IF_FALSE2}
// goto Memory.realloc$IF_FALSE2
@Memory.realloc$IF_FALSE2 // 3743
0;JMP // 3744

////LabelInstruction{label='Memory.realloc$IF_TRUE2}
// label Memory.realloc$IF_TRUE2
(Memory.realloc$IF_TRUE2)

////PushInstruction("constant 0")
@SP // 3745
AM=M+1 // 3746
A=A-1 // 3747
M=0 // 3748
@RETURN // 3749
0;JMP // 3750

////LabelInstruction{label='Memory.realloc$IF_FALSE2}
// label Memory.realloc$IF_FALSE2
(Memory.realloc$IF_FALSE2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc$IF_TRUE3}}
@Memory.realloc.GT.10 // 3751
D=A // 3752
@SP // 3753
AM=M+1 // 3754
A=A-1 // 3755
M=D // 3756
@LCL // 3757
A=M // 3758
D=M // 3759
@SP // 3760
AM=M+1 // 3761
A=A-1 // 3762
M=D // 3763
@ARG // 3764
A=M+1 // 3765
D=M // 3766
@SP // 3767
AM=M-1 // 3768
D=M-D // 3769
@DO_GT // 3770
0;JMP // 3771
(Memory.realloc.GT.10)
D=!D // 3772
@Memory.realloc$IF_TRUE3 // 3773
D;JNE // 3774

////GotoInstruction{label='Memory.realloc$IF_FALSE3}
// goto Memory.realloc$IF_FALSE3
@Memory.realloc$IF_FALSE3 // 3775
0;JMP // 3776

////LabelInstruction{label='Memory.realloc$IF_TRUE3}
// label Memory.realloc$IF_TRUE3
(Memory.realloc$IF_TRUE3)

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3777
A=M // 3778
D=M // 3779
@LCL // 3780
A=M+1 // 3781
A=A+1 // 3782
M=D // 3783

////GotoInstruction{label='Memory.realloc$IF_END3}
// goto Memory.realloc$IF_END3
@Memory.realloc$IF_END3 // 3784
0;JMP // 3785

////LabelInstruction{label='Memory.realloc$IF_FALSE3}
// label Memory.realloc$IF_FALSE3
(Memory.realloc$IF_FALSE3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3786
A=M+1 // 3787
D=M // 3788
@LCL // 3789
A=M+1 // 3790
A=A+1 // 3791
M=D // 3792

////LabelInstruction{label='Memory.realloc$IF_END3}
// label Memory.realloc$IF_END3
(Memory.realloc$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3793
A=M // 3794
D=M // 3795
@SP // 3796
AM=M+1 // 3797
A=A-1 // 3798
M=D // 3799
@LCL // 3800
A=M+1 // 3801
D=M // 3802
@SP // 3803
AM=M+1 // 3804
A=A-1 // 3805
M=D // 3806
@LCL // 3807
A=M+1 // 3808
A=A+1 // 3809
D=M // 3810
@SP // 3811
AM=M+1 // 3812
A=A-1 // 3813
M=D // 3814
// call Memory.copy
@8 // 3815
D=A // 3816
@14 // 3817
M=D // 3818
@Memory.copy // 3819
D=A // 3820
@13 // 3821
M=D // 3822
@Memory.realloc.ret.2 // 3823
D=A // 3824
@CALL // 3825
0;JMP // 3826
(Memory.realloc.ret.2)
@SP // 3827
M=M-1 // 3828

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3829
A=M // 3830
D=M // 3831
@SP // 3832
AM=M+1 // 3833
A=A-1 // 3834
M=D // 3835
// call Memory.deAlloc
@6 // 3836
D=A // 3837
@14 // 3838
M=D // 3839
@Memory.deAlloc // 3840
D=A // 3841
@13 // 3842
M=D // 3843
@Memory.realloc.ret.3 // 3844
D=A // 3845
@CALL // 3846
0;JMP // 3847
(Memory.realloc.ret.3)
@SP // 3848
M=M-1 // 3849

////PushInstruction("local 1")
@LCL // 3850
A=M+1 // 3851
D=M // 3852
@SP // 3853
AM=M+1 // 3854
A=A-1 // 3855
M=D // 3856
@RETURN // 3857
0;JMP // 3858

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3859
AM=M+1 // 3860
A=A-1 // 3861
M=0 // 3862

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3863
A=M // 3864
M=0 // 3865

////LabelInstruction{label='Memory.copy_WHILE_EXP1}
// label Memory.copy_WHILE_EXP1
(Memory.copy_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.copy_WHILE_END1}}
@Memory.copy.LT.11 // 3866
D=A // 3867
@SP // 3868
AM=M+1 // 3869
A=A-1 // 3870
M=D // 3871
@LCL // 3872
A=M // 3873
D=M // 3874
@SP // 3875
AM=M+1 // 3876
A=A-1 // 3877
M=D // 3878
@ARG // 3879
A=M+1 // 3880
A=A+1 // 3881
D=M // 3882
@SP // 3883
AM=M-1 // 3884
D=M-D // 3885
@DO_LT // 3886
0;JMP // 3887
(Memory.copy.LT.11)
D=!D // 3888
@Memory.copy_WHILE_END1 // 3889
D;JNE // 3890

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
@ARG // 3891
A=M+1 // 3892
D=M // 3893
@SP // 3894
AM=M+1 // 3895
A=A-1 // 3896
M=D // 3897
@LCL // 3898
A=M // 3899
D=M // 3900
@SP // 3901
AM=M-1 // 3902
D=D+M // 3903
@SP // 3904
AM=M+1 // 3905
A=A-1 // 3906
M=D // 3907
@ARG // 3908
A=M // 3909
D=M // 3910
@SP // 3911
AM=M+1 // 3912
A=A-1 // 3913
M=D // 3914
@LCL // 3915
A=M // 3916
D=M // 3917
@SP // 3918
AM=M-1 // 3919
A=D+M // 3920
D=M // 3921
@SP // 3922
AM=M-1 // 3923
A=M // 3924
M=D // 3925

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

@LCL // 3926
A=M // 3927
M=M+1 // 3928

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3929
0;JMP // 3930

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3931
AM=M+1 // 3932
A=A-1 // 3933
M=0 // 3934
@RETURN // 3935
0;JMP // 3936

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 2"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.remove_node$IF_TRUE1}}
@Memory.remove_node.EQ.12 // 3937
D=A // 3938
@SP // 3939
AM=M+1 // 3940
A=A-1 // 3941
M=D // 3942
@ARG // 3943
A=M+1 // 3944
D=M // 3945
@2 // 3946
A=D+A // 3947
D=M // 3948
@DO_EQ // 3949
0;JMP // 3950
(Memory.remove_node.EQ.12)
D=!D // 3951
@Memory.remove_node$IF_TRUE1 // 3952
D;JNE // 3953

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 3954
0;JMP // 3955

////LabelInstruction{label='Memory.remove_node$IF_TRUE1}
// label Memory.remove_node$IF_TRUE1
(Memory.remove_node$IF_TRUE1)

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
@ARG // 3956
A=M+1 // 3957
D=M // 3958
@2 // 3959
D=D+A // 3960
@3 // 3961
D=D+A // 3962
@SP // 3963
AM=M+1 // 3964
A=A-1 // 3965
M=D // 3966
@ARG // 3967
A=M+1 // 3968
D=M // 3969
@3 // 3970
A=D+A // 3971
D=M // 3972
@SP // 3973
AM=M-1 // 3974
A=M // 3975
M=D // 3976

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 3977
0;JMP // 3978

////LabelInstruction{label='Memory.remove_node$IF_FALSE1}
// label Memory.remove_node$IF_FALSE1
(Memory.remove_node$IF_FALSE1)

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
@ARG // 3979
A=M // 3980
D=M // 3981
@SP // 3982
AM=M+1 // 3983
A=A-1 // 3984
M=D // 3985
@ARG // 3986
A=M+1 // 3987
D=M // 3988
@3 // 3989
A=D+A // 3990
D=M // 3991
@SP // 3992
AM=M-1 // 3993
A=M // 3994
M=D // 3995

////LabelInstruction{label='Memory.remove_node$IF_END1}
// label Memory.remove_node$IF_END1
(Memory.remove_node$IF_END1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 3"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.remove_node$IF_TRUE2}}
@Memory.remove_node.EQ.13 // 3996
D=A // 3997
@SP // 3998
AM=M+1 // 3999
A=A-1 // 4000
M=D // 4001
@ARG // 4002
A=M+1 // 4003
D=M // 4004
@3 // 4005
A=D+A // 4006
D=M // 4007
@DO_EQ // 4008
0;JMP // 4009
(Memory.remove_node.EQ.13)
D=!D // 4010
@Memory.remove_node$IF_TRUE2 // 4011
D;JNE // 4012

////GotoInstruction{label='Memory.remove_node$IF_FALSE2}
// goto Memory.remove_node$IF_FALSE2
@Memory.remove_node$IF_FALSE2 // 4013
0;JMP // 4014

////LabelInstruction{label='Memory.remove_node$IF_TRUE2}
// label Memory.remove_node$IF_TRUE2
(Memory.remove_node$IF_TRUE2)

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
@ARG // 4015
A=M+1 // 4016
D=M // 4017
@3 // 4018
D=D+A // 4019
@2 // 4020
D=D+A // 4021
@SP // 4022
AM=M+1 // 4023
A=A-1 // 4024
M=D // 4025
@ARG // 4026
A=M+1 // 4027
D=M // 4028
@2 // 4029
A=D+A // 4030
D=M // 4031
@SP // 4032
AM=M-1 // 4033
A=M // 4034
M=D // 4035

////LabelInstruction{label='Memory.remove_node$IF_FALSE2}
// label Memory.remove_node$IF_FALSE2
(Memory.remove_node$IF_FALSE2)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4036
A=M+1 // 4037
D=M // 4038
@2 // 4039
D=D+A // 4040
@SP // 4041
AM=M+1 // 4042
A=A-1 // 4043
M=D // 4044
D=0 // 4045
@SP // 4046
AM=M-1 // 4047
A=M // 4048
M=D // 4049

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4050
A=M+1 // 4051
D=M // 4052
@3 // 4053
D=D+A // 4054
@SP // 4055
AM=M+1 // 4056
A=A-1 // 4057
M=D // 4058
D=0 // 4059
@SP // 4060
AM=M-1 // 4061
A=M // 4062
M=D // 4063

////PushInstruction("constant 0")
@SP // 4064
AM=M+1 // 4065
A=A-1 // 4066
M=0 // 4067
@RETURN // 4068
0;JMP // 4069

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 4070
AM=M+1 // 4071
A=A-1 // 4072
M=0 // 4073

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 4074
A=M // 4075
M=0 // 4076

////LabelInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// label Memory.getBinIndex_WHILE_EXP1
(Memory.getBinIndex_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("constant 7"),
//                binaryOp: "LT"
//            ),
//        right:
//            UnaryPushGroup(                BinaryPushGroup(
//                    left:
//                        Dereference(
//                            base:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("constant 2048"),
//                                    right:
//                                        PushInstruction("local 0"),
//                                    binaryOp: "ADD"
//                                )
//                        ),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//NOT),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.getBinIndex_WHILE_END1}}
@Memory.getBinIndex.LT.14 // 4077
D=A // 4078
@SP // 4079
AM=M+1 // 4080
A=A-1 // 4081
M=D // 4082
@LCL // 4083
A=M // 4084
D=M // 4085
@7 // 4086
D=D-A // 4087
@DO_LT // 4088
0;JMP // 4089
(Memory.getBinIndex.LT.14)
@SP // 4090
AM=M+1 // 4091
A=A-1 // 4092
M=D // 4093
@Memory.getBinIndex.EQ.15 // 4094
D=A // 4095
@SP // 4096
AM=M+1 // 4097
A=A-1 // 4098
M=D // 4099
@LCL // 4100
A=M // 4101
D=M // 4102
@2048 // 4103
A=D+A // 4104
D=M // 4105
@DO_EQ // 4106
0;JMP // 4107
(Memory.getBinIndex.EQ.15)
D=!D // 4108
@SP // 4109
AM=M-1 // 4110
D=D&M // 4111
D=!D // 4112
@Memory.getBinIndex_WHILE_END1 // 4113
D;JNE // 4114

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//), PushInstruction("constant 16")], call=CallInstruction{Math.multiply}},
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.getBinIndex$IF_TRUE1}}
@Memory.getBinIndex.GT.16 // 4115
D=A // 4116
@SP // 4117
AM=M+1 // 4118
A=A-1 // 4119
M=D // 4120
@ARG // 4121
A=M // 4122
D=M // 4123
@SP // 4124
AM=M+1 // 4125
A=A-1 // 4126
M=D // 4127
@LCL // 4128
A=M // 4129
D=M // 4130
@SP // 4131
AM=M+1 // 4132
A=A-1 // 4133
M=D+1 // 4134
@16 // 4135
D=A // 4136
@SP // 4137
AM=M+1 // 4138
A=A-1 // 4139
M=D // 4140
// call Math.multiply
@7 // 4141
D=A // 4142
@14 // 4143
M=D // 4144
@Math.multiply // 4145
D=A // 4146
@13 // 4147
M=D // 4148
@Memory.getBinIndex.ret.0 // 4149
D=A // 4150
@CALL // 4151
0;JMP // 4152
(Memory.getBinIndex.ret.0)
@SP // 4153
AM=M-1 // 4154
D=M // 4155
@SP // 4156
AM=M-1 // 4157
D=M-D // 4158
@DO_GT // 4159
0;JMP // 4160
(Memory.getBinIndex.GT.16)
D=!D // 4161
@Memory.getBinIndex$IF_TRUE1 // 4162
D;JNE // 4163

////GotoInstruction{label='Memory.getBinIndex$IF_FALSE1}
// goto Memory.getBinIndex$IF_FALSE1
@Memory.getBinIndex$IF_FALSE1 // 4164
0;JMP // 4165

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 4166
A=M // 4167
D=M // 4168
@SP // 4169
AM=M+1 // 4170
A=A-1 // 4171
M=D // 4172
@RETURN // 4173
0;JMP // 4174

////LabelInstruction{label='Memory.getBinIndex$IF_FALSE1}
// label Memory.getBinIndex$IF_FALSE1
(Memory.getBinIndex$IF_FALSE1)

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

@LCL // 4175
A=M // 4176
M=M+1 // 4177

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 4178
0;JMP // 4179

////LabelInstruction{label='Memory.getBinIndex_WHILE_END1}
// label Memory.getBinIndex_WHILE_END1
(Memory.getBinIndex_WHILE_END1)

////BinaryPushGroup(
//    left:
//        PushInstruction("constant 7"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
@6 // 4180
D=A // 4181
@SP // 4182
AM=M+1 // 4183
A=A-1 // 4184
M=D // 4185
@7 // 4186
D=A // 4187
@SP // 4188
AM=M+1 // 4189
A=A-1 // 4190
M=D-1 // 4191
@RETURN // 4192
0;JMP // 4193

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 4194
AM=M+1 // 4195
A=A-1 // 4196
M=0 // 4197

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

@ARG // 4198
A=M // 4199
D=M // 4200
@0 // 4201
A=D+A // 4202
D=M // 4203
@LCL // 4204
A=M // 4205
M=D // 4206

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.get_best_fit$IF_TRUE1}}
@Memory.get_best_fit.LT.17 // 4207
D=A // 4208
@SP // 4209
AM=M+1 // 4210
A=A-1 // 4211
M=D // 4212
@LCL // 4213
A=M // 4214
D=M // 4215
@0 // 4216
A=D+A // 4217
D=M // 4218
@SP // 4219
AM=M+1 // 4220
A=A-1 // 4221
M=D // 4222
@ARG // 4223
A=M+1 // 4224
D=M // 4225
@SP // 4226
AM=M-1 // 4227
D=M-D // 4228
@DO_LT // 4229
0;JMP // 4230
(Memory.get_best_fit.LT.17)
D=!D // 4231
@Memory.get_best_fit$IF_TRUE1 // 4232
D;JNE // 4233

////GotoInstruction{label='Memory.get_best_fit$IF_FALSE1}
// goto Memory.get_best_fit$IF_FALSE1
@Memory.get_best_fit$IF_FALSE1 // 4234
0;JMP // 4235

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 4236
A=M // 4237
D=M // 4238
@SP // 4239
AM=M+1 // 4240
A=A-1 // 4241
M=D // 4242
@RETURN // 4243
0;JMP // 4244

////LabelInstruction{label='Memory.get_best_fit$IF_FALSE1}
// label Memory.get_best_fit$IF_FALSE1
(Memory.get_best_fit$IF_FALSE1)

////LabelInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// label Memory.get_best_fit_WHILE_EXP1
(Memory.get_best_fit_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 3"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit_WHILE_END1}}
@Memory.get_best_fit.EQ.18 // 4245
D=A // 4246
@SP // 4247
AM=M+1 // 4248
A=A-1 // 4249
M=D // 4250
@LCL // 4251
A=M // 4252
D=M // 4253
@3 // 4254
A=D+A // 4255
D=M // 4256
@DO_EQ // 4257
0;JMP // 4258
(Memory.get_best_fit.EQ.18)
@Memory.get_best_fit_WHILE_END1 // 4259
D;JNE // 4260

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

@LCL // 4261
A=M // 4262
D=M // 4263
@3 // 4264
A=D+A // 4265
D=M // 4266
@LCL // 4267
A=M // 4268
M=D // 4269

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.get_best_fit$IF_TRUE2}}
@Memory.get_best_fit.LT.19 // 4270
D=A // 4271
@SP // 4272
AM=M+1 // 4273
A=A-1 // 4274
M=D // 4275
@LCL // 4276
A=M // 4277
D=M // 4278
@0 // 4279
A=D+A // 4280
D=M // 4281
@SP // 4282
AM=M+1 // 4283
A=A-1 // 4284
M=D // 4285
@ARG // 4286
A=M+1 // 4287
D=M // 4288
@SP // 4289
AM=M-1 // 4290
D=M-D // 4291
@DO_LT // 4292
0;JMP // 4293
(Memory.get_best_fit.LT.19)
D=!D // 4294
@Memory.get_best_fit$IF_TRUE2 // 4295
D;JNE // 4296

////GotoInstruction{label='Memory.get_best_fit$IF_FALSE2}
// goto Memory.get_best_fit$IF_FALSE2
@Memory.get_best_fit$IF_FALSE2 // 4297
0;JMP // 4298

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 4299
A=M // 4300
D=M // 4301
@SP // 4302
AM=M+1 // 4303
A=A-1 // 4304
M=D // 4305
@RETURN // 4306
0;JMP // 4307

////LabelInstruction{label='Memory.get_best_fit$IF_FALSE2}
// label Memory.get_best_fit$IF_FALSE2
(Memory.get_best_fit$IF_FALSE2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 4308
0;JMP // 4309

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4310
AM=M+1 // 4311
A=A-1 // 4312
M=0 // 4313
@RETURN // 4314
0;JMP // 4315

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
@ARG // 4316
A=M // 4317
D=M // 4318
@SP // 4319
AM=M+1 // 4320
A=A-1 // 4321
M=D // 4322
@ARG // 4323
A=M // 4324
D=M // 4325
@0 // 4326
A=D+A // 4327
D=M // 4328
@4 // 4329
D=D+A // 4330
@SP // 4331
AM=M-1 // 4332
D=D+M // 4333
@SP // 4334
AM=M+1 // 4335
A=A-1 // 4336
M=D // 4337
@ARG // 4338
A=M // 4339
D=M // 4340
@SP // 4341
AM=M-1 // 4342
A=M // 4343
M=D // 4344

////PushInstruction("constant 0")
@SP // 4345
AM=M+1 // 4346
A=A-1 // 4347
M=0 // 4348
@RETURN // 4349
0;JMP // 4350

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 4351
M=M+1 // 4352
AM=M+1 // 4353
A=A-1 // 4354
M=0 // 4355
A=A-1 // 4356
M=0 // 4357

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4358
A=M+1 // 4359
D=M // 4360
@2 // 4361
D=D+A // 4362
@SP // 4363
AM=M+1 // 4364
A=A-1 // 4365
M=D // 4366
D=0 // 4367
@SP // 4368
AM=M-1 // 4369
A=M // 4370
M=D // 4371

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4372
A=M+1 // 4373
D=M // 4374
@3 // 4375
D=D+A // 4376
@SP // 4377
AM=M+1 // 4378
A=A-1 // 4379
M=D // 4380
D=0 // 4381
@SP // 4382
AM=M-1 // 4383
A=M // 4384
M=D // 4385

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE1}}
@Memory.add_node.EQ.20 // 4386
D=A // 4387
@SP // 4388
AM=M+1 // 4389
A=A-1 // 4390
M=D // 4391
@ARG // 4392
A=M // 4393
D=M // 4394
@0 // 4395
A=D+A // 4396
D=M // 4397
@DO_EQ // 4398
0;JMP // 4399
(Memory.add_node.EQ.20)
@Memory.add_node$IF_TRUE1 // 4400
D;JNE // 4401

////GotoInstruction{label='Memory.add_node$IF_FALSE1}
// goto Memory.add_node$IF_FALSE1
@Memory.add_node$IF_FALSE1 // 4402
0;JMP // 4403

////LabelInstruction{label='Memory.add_node$IF_TRUE1}
// label Memory.add_node$IF_TRUE1
(Memory.add_node$IF_TRUE1)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4404
A=M // 4405
D=M // 4406
@SP // 4407
AM=M+1 // 4408
A=A-1 // 4409
M=D // 4410
@ARG // 4411
A=M+1 // 4412
D=M // 4413
@SP // 4414
AM=M-1 // 4415
A=M // 4416
M=D // 4417

////PushInstruction("constant 0")
@SP // 4418
AM=M+1 // 4419
A=A-1 // 4420
M=0 // 4421
@RETURN // 4422
0;JMP // 4423

////LabelInstruction{label='Memory.add_node$IF_FALSE1}
// label Memory.add_node$IF_FALSE1
(Memory.add_node$IF_FALSE1)

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

@ARG // 4424
A=M // 4425
D=M // 4426
@0 // 4427
A=D+A // 4428
D=M // 4429
@LCL // 4430
A=M // 4431
M=D // 4432

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4433
A=M+1 // 4434
M=0 // 4435

////LabelInstruction{label='Memory.add_node_WHILE_EXP1}
// label Memory.add_node_WHILE_EXP1
(Memory.add_node_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            UnaryPushGroup(                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//NOT),
//        right:
//            UnaryPushGroup(                BinaryPushGroup(
//                    left:
//                        Dereference(
//                            base:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 0"),
//                                    right:
//                                        PushInstruction("constant 0"),
//                                    binaryOp: "ADD"
//                                )
//                        ),
//                    right:
//                        Dereference(
//                            base:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("argument 1"),
//                                    right:
//                                        PushInstruction("constant 0"),
//                                    binaryOp: "ADD"
//                                )
//                        ),
//                    binaryOp: "GT"
//                ),
//NOT),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node_WHILE_END1}}
@Memory.add_node.EQ.21 // 4436
D=A // 4437
@SP // 4438
AM=M+1 // 4439
A=A-1 // 4440
M=D // 4441
@LCL // 4442
A=M // 4443
D=M // 4444
@DO_EQ // 4445
0;JMP // 4446
(Memory.add_node.EQ.21)
@SP // 4447
AM=M+1 // 4448
A=A-1 // 4449
M=D // 4450
@SP // 4451
A=M-1 // 4452
M=!D // 4453
@Memory.add_node.GT.22 // 4454
D=A // 4455
@SP // 4456
AM=M+1 // 4457
A=A-1 // 4458
M=D // 4459
@LCL // 4460
A=M // 4461
D=M // 4462
@0 // 4463
A=D+A // 4464
D=M // 4465
@SP // 4466
AM=M+1 // 4467
A=A-1 // 4468
M=D // 4469
@ARG // 4470
A=M+1 // 4471
D=M // 4472
@0 // 4473
A=D+A // 4474
D=M // 4475
@SP // 4476
AM=M-1 // 4477
D=M-D // 4478
@DO_GT // 4479
0;JMP // 4480
(Memory.add_node.GT.22)
D=!D // 4481
@SP // 4482
AM=M-1 // 4483
D=D&M // 4484
D=!D // 4485
@Memory.add_node_WHILE_END1 // 4486
D;JNE // 4487

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4488
A=M // 4489
D=M // 4490
@LCL // 4491
A=M+1 // 4492
M=D // 4493

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

@LCL // 4494
A=M // 4495
D=M // 4496
@3 // 4497
A=D+A // 4498
D=M // 4499
@LCL // 4500
A=M // 4501
M=D // 4502

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 4503
0;JMP // 4504

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 4505
A=M+1 // 4506
D=!M // 4507
@Memory.add_node$IF_TRUE2 // 4508
D;JNE // 4509

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 4510
0;JMP // 4511

////LabelInstruction{label='Memory.add_node$IF_TRUE2}
// label Memory.add_node$IF_TRUE2
(Memory.add_node$IF_TRUE2)

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
@ARG // 4512
A=M+1 // 4513
D=M // 4514
@3 // 4515
D=D+A // 4516
@SP // 4517
AM=M+1 // 4518
A=A-1 // 4519
M=D // 4520
@ARG // 4521
A=M // 4522
D=M // 4523
@0 // 4524
A=D+A // 4525
D=M // 4526
@SP // 4527
AM=M-1 // 4528
A=M // 4529
M=D // 4530

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
@ARG // 4531
A=M // 4532
D=M // 4533
@0 // 4534
D=D+A // 4535
@2 // 4536
D=D+A // 4537
@SP // 4538
AM=M+1 // 4539
A=A-1 // 4540
M=D // 4541
@ARG // 4542
A=M+1 // 4543
D=M // 4544
@SP // 4545
AM=M-1 // 4546
A=M // 4547
M=D // 4548

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4549
A=M // 4550
D=M // 4551
@SP // 4552
AM=M+1 // 4553
A=A-1 // 4554
M=D // 4555
@ARG // 4556
A=M+1 // 4557
D=M // 4558
@SP // 4559
AM=M-1 // 4560
A=M // 4561
M=D // 4562

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 4563
0;JMP // 4564

////LabelInstruction{label='Memory.add_node$IF_FALSE2}
// label Memory.add_node$IF_FALSE2
(Memory.add_node$IF_FALSE2)

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 4565
A=M+1 // 4566
D=M // 4567
@3 // 4568
D=D+A // 4569
@SP // 4570
AM=M+1 // 4571
A=A-1 // 4572
M=D // 4573
@LCL // 4574
A=M // 4575
D=M // 4576
@SP // 4577
AM=M-1 // 4578
A=M // 4579
M=D // 4580

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4581
A=M+1 // 4582
D=M // 4583
@2 // 4584
D=D+A // 4585
@SP // 4586
AM=M+1 // 4587
A=A-1 // 4588
M=D // 4589
@LCL // 4590
A=M+1 // 4591
D=M // 4592
@SP // 4593
AM=M-1 // 4594
A=M // 4595
M=D // 4596

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 4597
A=M // 4598
D=M // 4599
@Memory.add_node$IF_TRUE3 // 4600
D;JNE // 4601

////GotoInstruction{label='Memory.add_node$IF_FALSE3}
// goto Memory.add_node$IF_FALSE3
@Memory.add_node$IF_FALSE3 // 4602
0;JMP // 4603

////LabelInstruction{label='Memory.add_node$IF_TRUE3}
// label Memory.add_node$IF_TRUE3
(Memory.add_node$IF_TRUE3)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 4604
A=M // 4605
D=M // 4606
@2 // 4607
D=D+A // 4608
@SP // 4609
AM=M+1 // 4610
A=A-1 // 4611
M=D // 4612
@ARG // 4613
A=M+1 // 4614
D=M // 4615
@SP // 4616
AM=M-1 // 4617
A=M // 4618
M=D // 4619

////LabelInstruction{label='Memory.add_node$IF_FALSE3}
// label Memory.add_node$IF_FALSE3
(Memory.add_node$IF_FALSE3)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 4620
A=M+1 // 4621
D=M // 4622
@3 // 4623
D=D+A // 4624
@SP // 4625
AM=M+1 // 4626
A=A-1 // 4627
M=D // 4628
@ARG // 4629
A=M+1 // 4630
D=M // 4631
@SP // 4632
AM=M-1 // 4633
A=M // 4634
M=D // 4635

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 4636
AM=M+1 // 4637
A=A-1 // 4638
M=0 // 4639
@RETURN // 4640
0;JMP // 4641

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
@ARG // 4642
A=M // 4643
D=M // 4644
@SP // 4645
AM=M+1 // 4646
A=A-1 // 4647
M=D // 4648
@ARG // 4649
A=M+1 // 4650
D=M // 4651
@SP // 4652
AM=M-1 // 4653
A=M // 4654
M=D // 4655

////PushInstruction("constant 0")
@SP // 4656
AM=M+1 // 4657
A=A-1 // 4658
M=0 // 4659
@RETURN // 4660
0;JMP // 4661

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
@ARG // 4662
A=M // 4663
D=M // 4664
@0 // 4665
A=D+A // 4666
D=M // 4667
@SP // 4668
AM=M+1 // 4669
A=A-1 // 4670
M=D // 4671
@RETURN // 4672
0;JMP // 4673

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={}}
// function Output.init with 1
(Output.init)
@SP // 4674
AM=M+1 // 4675
A=A-1 // 4676
M=0 // 4677

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4678
D=A // 4679
@SP // 4680
AM=M+1 // 4681
A=A-1 // 4682
M=D // 4683
// call Array.new
@6 // 4684
D=A // 4685
@14 // 4686
M=D // 4687
@Array.new // 4688
D=A // 4689
@13 // 4690
M=D // 4691
@Output.init.ret.0 // 4692
D=A // 4693
@CALL // 4694
0;JMP // 4695
(Output.init.ret.0)
@SP // 4696
AM=M-1 // 4697
D=M // 4698
@Output.0 // 4699
M=D // 4700

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4701
D=A // 4702
@SP // 4703
M=D+M // 4704
@63 // 4705
D=A // 4706
@SP // 4707
A=M-1 // 4708
M=0 // 4709
A=A-1 // 4710
M=0 // 4711
A=A-1 // 4712
M=D // 4713
A=A-1 // 4714
M=D // 4715
A=A-1 // 4716
M=D // 4717
A=A-1 // 4718
M=D // 4719
A=A-1 // 4720
M=D // 4721
A=A-1 // 4722
M=D // 4723
A=A-1 // 4724
M=D // 4725
A=A-1 // 4726
M=D // 4727
A=A-1 // 4728
M=D // 4729
A=A-1 // 4730
M=0 // 4731
// call Output.create
@17 // 4732
D=A // 4733
@14 // 4734
M=D // 4735
@Output.create // 4736
D=A // 4737
@13 // 4738
M=D // 4739
@Output.init.ret.1 // 4740
D=A // 4741
@CALL // 4742
0;JMP // 4743
(Output.init.ret.1)
@SP // 4744
M=M-1 // 4745

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4746
D=A // 4747
@SP // 4748
M=D+M // 4749
@32 // 4750
D=A // 4751
@SP // 4752
A=M-1 // 4753
M=0 // 4754
A=A-1 // 4755
M=0 // 4756
A=A-1 // 4757
M=0 // 4758
A=A-1 // 4759
M=0 // 4760
A=A-1 // 4761
M=0 // 4762
A=A-1 // 4763
M=0 // 4764
A=A-1 // 4765
M=0 // 4766
A=A-1 // 4767
M=0 // 4768
A=A-1 // 4769
M=0 // 4770
A=A-1 // 4771
M=0 // 4772
A=A-1 // 4773
M=0 // 4774
A=A-1 // 4775
M=D // 4776
A=A-1 // 4777
// call Output.create
@17 // 4778
D=A // 4779
@14 // 4780
M=D // 4781
@Output.create // 4782
D=A // 4783
@13 // 4784
M=D // 4785
@Output.init.ret.2 // 4786
D=A // 4787
@CALL // 4788
0;JMP // 4789
(Output.init.ret.2)
@SP // 4790
M=M-1 // 4791

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4792
D=A // 4793
@SP // 4794
AM=M+1 // 4795
A=A-1 // 4796
M=D // 4797
@12 // 4798
D=A // 4799
@SP // 4800
AM=M+1 // 4801
A=A-1 // 4802
M=D // 4803
@30 // 4804
D=A // 4805
@SP // 4806
AM=M+1 // 4807
A=A-1 // 4808
M=D // 4809
@30 // 4810
D=A // 4811
@SP // 4812
AM=M+1 // 4813
A=A-1 // 4814
M=D // 4815
@30 // 4816
D=A // 4817
@SP // 4818
AM=M+1 // 4819
A=A-1 // 4820
M=D // 4821
@12 // 4822
D=A // 4823
@SP // 4824
AM=M+1 // 4825
A=A-1 // 4826
M=D // 4827
@12 // 4828
D=A // 4829
@SP // 4830
AM=M+1 // 4831
A=A-1 // 4832
M=D // 4833
@SP // 4834
AM=M+1 // 4835
A=A-1 // 4836
M=0 // 4837
@4 // 4838
D=A // 4839
@SP // 4840
M=D+M // 4841
@12 // 4842
D=A // 4843
@SP // 4844
A=M-1 // 4845
M=0 // 4846
A=A-1 // 4847
M=0 // 4848
A=A-1 // 4849
M=D // 4850
A=A-1 // 4851
M=D // 4852
A=A-1 // 4853
// call Output.create
@17 // 4854
D=A // 4855
@14 // 4856
M=D // 4857
@Output.create // 4858
D=A // 4859
@13 // 4860
M=D // 4861
@Output.init.ret.3 // 4862
D=A // 4863
@CALL // 4864
0;JMP // 4865
(Output.init.ret.3)
@SP // 4866
M=M-1 // 4867

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4868
D=A // 4869
@SP // 4870
AM=M+1 // 4871
A=A-1 // 4872
M=D // 4873
@54 // 4874
D=A // 4875
@SP // 4876
AM=M+1 // 4877
A=A-1 // 4878
M=D // 4879
@54 // 4880
D=A // 4881
@SP // 4882
AM=M+1 // 4883
A=A-1 // 4884
M=D // 4885
@20 // 4886
D=A // 4887
@SP // 4888
AM=M+1 // 4889
A=A-1 // 4890
M=D // 4891
@SP // 4892
AM=M+1 // 4893
A=A-1 // 4894
M=0 // 4895
@SP // 4896
AM=M+1 // 4897
A=A-1 // 4898
M=0 // 4899
@SP // 4900
AM=M+1 // 4901
A=A-1 // 4902
M=0 // 4903
@SP // 4904
AM=M+1 // 4905
A=A-1 // 4906
M=0 // 4907
@SP // 4908
AM=M+1 // 4909
A=A-1 // 4910
M=0 // 4911
@SP // 4912
AM=M+1 // 4913
A=A-1 // 4914
M=0 // 4915
@SP // 4916
AM=M+1 // 4917
A=A-1 // 4918
M=0 // 4919
@SP // 4920
AM=M+1 // 4921
A=A-1 // 4922
M=0 // 4923
// call Output.create
@17 // 4924
D=A // 4925
@14 // 4926
M=D // 4927
@Output.create // 4928
D=A // 4929
@13 // 4930
M=D // 4931
@Output.init.ret.4 // 4932
D=A // 4933
@CALL // 4934
0;JMP // 4935
(Output.init.ret.4)
@SP // 4936
M=M-1 // 4937

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4938
D=A // 4939
@SP // 4940
M=D+M // 4941
@35 // 4942
D=A // 4943
@SP // 4944
A=M-1 // 4945
M=0 // 4946
A=A-1 // 4947
M=D // 4948
A=A-1 // 4949
@18 // 4950
D=A // 4951
@SP // 4952
AM=M+1 // 4953
A=A-1 // 4954
M=D // 4955
@18 // 4956
D=A // 4957
@SP // 4958
AM=M+1 // 4959
A=A-1 // 4960
M=D // 4961
@63 // 4962
D=A // 4963
@SP // 4964
AM=M+1 // 4965
A=A-1 // 4966
M=D // 4967
@18 // 4968
D=A // 4969
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=D // 4973
@18 // 4974
D=A // 4975
@SP // 4976
AM=M+1 // 4977
A=A-1 // 4978
M=D // 4979
@63 // 4980
D=A // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=D // 4985
@18 // 4986
D=A // 4987
@SP // 4988
AM=M+1 // 4989
A=A-1 // 4990
M=D // 4991
@18 // 4992
D=A // 4993
@SP // 4994
AM=M+1 // 4995
A=A-1 // 4996
M=D // 4997
@SP // 4998
AM=M+1 // 4999
A=A-1 // 5000
M=0 // 5001
@SP // 5002
AM=M+1 // 5003
A=A-1 // 5004
M=0 // 5005
// call Output.create
@17 // 5006
D=A // 5007
@14 // 5008
M=D // 5009
@Output.create // 5010
D=A // 5011
@13 // 5012
M=D // 5013
@Output.init.ret.5 // 5014
D=A // 5015
@CALL // 5016
0;JMP // 5017
(Output.init.ret.5)
@SP // 5018
M=M-1 // 5019

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 5020
D=A // 5021
@SP // 5022
AM=M+1 // 5023
A=A-1 // 5024
M=D // 5025
@12 // 5026
D=A // 5027
@SP // 5028
AM=M+1 // 5029
A=A-1 // 5030
M=D // 5031
@30 // 5032
D=A // 5033
@SP // 5034
AM=M+1 // 5035
A=A-1 // 5036
M=D // 5037
@51 // 5038
D=A // 5039
@SP // 5040
AM=M+1 // 5041
A=A-1 // 5042
M=D // 5043
@3 // 5044
D=A // 5045
@SP // 5046
AM=M+1 // 5047
A=A-1 // 5048
M=D // 5049
@30 // 5050
D=A // 5051
@SP // 5052
AM=M+1 // 5053
A=A-1 // 5054
M=D // 5055
@48 // 5056
D=A // 5057
@SP // 5058
AM=M+1 // 5059
A=A-1 // 5060
M=D // 5061
@51 // 5062
D=A // 5063
@SP // 5064
AM=M+1 // 5065
A=A-1 // 5066
M=D // 5067
@30 // 5068
D=A // 5069
@SP // 5070
AM=M+1 // 5071
A=A-1 // 5072
M=D // 5073
@12 // 5074
D=A // 5075
@SP // 5076
AM=M+1 // 5077
A=A-1 // 5078
M=D // 5079
@12 // 5080
D=A // 5081
@SP // 5082
AM=M+1 // 5083
A=A-1 // 5084
M=D // 5085
@SP // 5086
AM=M+1 // 5087
A=A-1 // 5088
M=0 // 5089
// call Output.create
@17 // 5090
D=A // 5091
@14 // 5092
M=D // 5093
@Output.create // 5094
D=A // 5095
@13 // 5096
M=D // 5097
@Output.init.ret.6 // 5098
D=A // 5099
@CALL // 5100
0;JMP // 5101
(Output.init.ret.6)
@SP // 5102
M=M-1 // 5103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5104
D=A // 5105
@SP // 5106
M=D+M // 5107
@37 // 5108
D=A // 5109
@SP // 5110
A=M-1 // 5111
M=0 // 5112
A=A-1 // 5113
M=0 // 5114
A=A-1 // 5115
M=D // 5116
A=A-1 // 5117
@35 // 5118
D=A // 5119
@SP // 5120
AM=M+1 // 5121
A=A-1 // 5122
M=D // 5123
@51 // 5124
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
@12 // 5136
D=A // 5137
@SP // 5138
AM=M+1 // 5139
A=A-1 // 5140
M=D // 5141
@6 // 5142
D=A // 5143
@SP // 5144
AM=M+1 // 5145
A=A-1 // 5146
M=D // 5147
@51 // 5148
D=A // 5149
@SP // 5150
AM=M+1 // 5151
A=A-1 // 5152
M=D // 5153
@49 // 5154
D=A // 5155
@SP // 5156
AM=M+1 // 5157
A=A-1 // 5158
M=D // 5159
@SP // 5160
AM=M+1 // 5161
A=A-1 // 5162
M=0 // 5163
@SP // 5164
AM=M+1 // 5165
A=A-1 // 5166
M=0 // 5167
// call Output.create
@17 // 5168
D=A // 5169
@14 // 5170
M=D // 5171
@Output.create // 5172
D=A // 5173
@13 // 5174
M=D // 5175
@Output.init.ret.7 // 5176
D=A // 5177
@CALL // 5178
0;JMP // 5179
(Output.init.ret.7)
@SP // 5180
M=M-1 // 5181

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 5182
D=A // 5183
@SP // 5184
AM=M+1 // 5185
A=A-1 // 5186
M=D // 5187
@12 // 5188
D=A // 5189
@SP // 5190
AM=M+1 // 5191
A=A-1 // 5192
M=D // 5193
@30 // 5194
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
@12 // 5206
D=A // 5207
@SP // 5208
AM=M+1 // 5209
A=A-1 // 5210
M=D // 5211
@54 // 5212
D=A // 5213
@SP // 5214
AM=M+1 // 5215
A=A-1 // 5216
M=D // 5217
@27 // 5218
D=A // 5219
@SP // 5220
AM=M+1 // 5221
A=A-1 // 5222
M=D // 5223
@27 // 5224
D=A // 5225
@SP // 5226
AM=M+1 // 5227
A=A-1 // 5228
M=D // 5229
@27 // 5230
D=A // 5231
@SP // 5232
AM=M+1 // 5233
A=A-1 // 5234
M=D // 5235
@54 // 5236
D=A // 5237
@SP // 5238
AM=M+1 // 5239
A=A-1 // 5240
M=D // 5241
@SP // 5242
AM=M+1 // 5243
A=A-1 // 5244
M=0 // 5245
@SP // 5246
AM=M+1 // 5247
A=A-1 // 5248
M=0 // 5249
// call Output.create
@17 // 5250
D=A // 5251
@14 // 5252
M=D // 5253
@Output.create // 5254
D=A // 5255
@13 // 5256
M=D // 5257
@Output.init.ret.8 // 5258
D=A // 5259
@CALL // 5260
0;JMP // 5261
(Output.init.ret.8)
@SP // 5262
M=M-1 // 5263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 5264
D=A // 5265
@SP // 5266
AM=M+1 // 5267
A=A-1 // 5268
M=D // 5269
@12 // 5270
D=A // 5271
@SP // 5272
AM=M+1 // 5273
A=A-1 // 5274
M=D // 5275
@12 // 5276
D=A // 5277
@SP // 5278
AM=M+1 // 5279
A=A-1 // 5280
M=D // 5281
@6 // 5282
D=A // 5283
@SP // 5284
AM=M+1 // 5285
A=A-1 // 5286
M=D // 5287
@SP // 5288
AM=M+1 // 5289
A=A-1 // 5290
M=0 // 5291
@SP // 5292
AM=M+1 // 5293
A=A-1 // 5294
M=0 // 5295
@SP // 5296
AM=M+1 // 5297
A=A-1 // 5298
M=0 // 5299
@SP // 5300
AM=M+1 // 5301
A=A-1 // 5302
M=0 // 5303
@SP // 5304
AM=M+1 // 5305
A=A-1 // 5306
M=0 // 5307
@SP // 5308
AM=M+1 // 5309
A=A-1 // 5310
M=0 // 5311
@SP // 5312
AM=M+1 // 5313
A=A-1 // 5314
M=0 // 5315
@SP // 5316
AM=M+1 // 5317
A=A-1 // 5318
M=0 // 5319
// call Output.create
@17 // 5320
D=A // 5321
@14 // 5322
M=D // 5323
@Output.create // 5324
D=A // 5325
@13 // 5326
M=D // 5327
@Output.init.ret.9 // 5328
D=A // 5329
@CALL // 5330
0;JMP // 5331
(Output.init.ret.9)
@SP // 5332
M=M-1 // 5333

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5334
D=A // 5335
@SP // 5336
AM=M+1 // 5337
A=A-1 // 5338
M=D // 5339
@24 // 5340
D=A // 5341
@SP // 5342
AM=M+1 // 5343
A=A-1 // 5344
M=D // 5345
@12 // 5346
D=A // 5347
@SP // 5348
AM=M+1 // 5349
A=A-1 // 5350
M=D // 5351
@6 // 5352
D=A // 5353
@SP // 5354
AM=M+1 // 5355
A=A-1 // 5356
M=D // 5357
@6 // 5358
D=A // 5359
@SP // 5360
AM=M+1 // 5361
A=A-1 // 5362
M=D // 5363
@6 // 5364
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
@6 // 5376
D=A // 5377
@SP // 5378
AM=M+1 // 5379
A=A-1 // 5380
M=D // 5381
@12 // 5382
D=A // 5383
@SP // 5384
AM=M+1 // 5385
A=A-1 // 5386
M=D // 5387
@24 // 5388
D=A // 5389
@SP // 5390
AM=M+1 // 5391
A=A-1 // 5392
M=D // 5393
@SP // 5394
AM=M+1 // 5395
A=A-1 // 5396
M=0 // 5397
@SP // 5398
AM=M+1 // 5399
A=A-1 // 5400
M=0 // 5401
// call Output.create
@17 // 5402
D=A // 5403
@14 // 5404
M=D // 5405
@Output.create // 5406
D=A // 5407
@13 // 5408
M=D // 5409
@Output.init.ret.10 // 5410
D=A // 5411
@CALL // 5412
0;JMP // 5413
(Output.init.ret.10)
@SP // 5414
M=M-1 // 5415

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 5416
D=A // 5417
@SP // 5418
AM=M+1 // 5419
A=A-1 // 5420
M=D // 5421
@6 // 5422
D=A // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=D // 5427
@12 // 5428
D=A // 5429
@SP // 5430
AM=M+1 // 5431
A=A-1 // 5432
M=D // 5433
@24 // 5434
D=A // 5435
@SP // 5436
AM=M+1 // 5437
A=A-1 // 5438
M=D // 5439
@24 // 5440
D=A // 5441
@SP // 5442
AM=M+1 // 5443
A=A-1 // 5444
M=D // 5445
@24 // 5446
D=A // 5447
@SP // 5448
AM=M+1 // 5449
A=A-1 // 5450
M=D // 5451
@24 // 5452
D=A // 5453
@SP // 5454
AM=M+1 // 5455
A=A-1 // 5456
M=D // 5457
@24 // 5458
D=A // 5459
@SP // 5460
AM=M+1 // 5461
A=A-1 // 5462
M=D // 5463
@12 // 5464
D=A // 5465
@SP // 5466
AM=M+1 // 5467
A=A-1 // 5468
M=D // 5469
@6 // 5470
D=A // 5471
@SP // 5472
AM=M+1 // 5473
A=A-1 // 5474
M=D // 5475
@SP // 5476
AM=M+1 // 5477
A=A-1 // 5478
M=0 // 5479
@SP // 5480
AM=M+1 // 5481
A=A-1 // 5482
M=0 // 5483
// call Output.create
@17 // 5484
D=A // 5485
@14 // 5486
M=D // 5487
@Output.create // 5488
D=A // 5489
@13 // 5490
M=D // 5491
@Output.init.ret.11 // 5492
D=A // 5493
@CALL // 5494
0;JMP // 5495
(Output.init.ret.11)
@SP // 5496
M=M-1 // 5497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5498
D=A // 5499
@SP // 5500
M=D+M // 5501
@42 // 5502
D=A // 5503
@SP // 5504
A=M-1 // 5505
M=0 // 5506
A=A-1 // 5507
M=0 // 5508
A=A-1 // 5509
M=0 // 5510
A=A-1 // 5511
M=D // 5512
A=A-1 // 5513
@51 // 5514
D=A // 5515
@SP // 5516
AM=M+1 // 5517
A=A-1 // 5518
M=D // 5519
@30 // 5520
D=A // 5521
@SP // 5522
AM=M+1 // 5523
A=A-1 // 5524
M=D // 5525
@63 // 5526
D=A // 5527
@SP // 5528
AM=M+1 // 5529
A=A-1 // 5530
M=D // 5531
@30 // 5532
D=A // 5533
@SP // 5534
AM=M+1 // 5535
A=A-1 // 5536
M=D // 5537
@51 // 5538
D=A // 5539
@SP // 5540
AM=M+1 // 5541
A=A-1 // 5542
M=D // 5543
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
// call Output.create
@17 // 5556
D=A // 5557
@14 // 5558
M=D // 5559
@Output.create // 5560
D=A // 5561
@13 // 5562
M=D // 5563
@Output.init.ret.12 // 5564
D=A // 5565
@CALL // 5566
0;JMP // 5567
(Output.init.ret.12)
@SP // 5568
M=M-1 // 5569

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5570
D=A // 5571
@SP // 5572
M=D+M // 5573
@43 // 5574
D=A // 5575
@SP // 5576
A=M-1 // 5577
M=0 // 5578
A=A-1 // 5579
M=0 // 5580
A=A-1 // 5581
M=0 // 5582
A=A-1 // 5583
M=D // 5584
A=A-1 // 5585
@12 // 5586
D=A // 5587
@SP // 5588
AM=M+1 // 5589
A=A-1 // 5590
M=D // 5591
@12 // 5592
D=A // 5593
@SP // 5594
AM=M+1 // 5595
A=A-1 // 5596
M=D // 5597
@63 // 5598
D=A // 5599
@SP // 5600
AM=M+1 // 5601
A=A-1 // 5602
M=D // 5603
@12 // 5604
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
@SP // 5616
AM=M+1 // 5617
A=A-1 // 5618
M=0 // 5619
@SP // 5620
AM=M+1 // 5621
A=A-1 // 5622
M=0 // 5623
@SP // 5624
AM=M+1 // 5625
A=A-1 // 5626
M=0 // 5627
// call Output.create
@17 // 5628
D=A // 5629
@14 // 5630
M=D // 5631
@Output.create // 5632
D=A // 5633
@13 // 5634
M=D // 5635
@Output.init.ret.13 // 5636
D=A // 5637
@CALL // 5638
0;JMP // 5639
(Output.init.ret.13)
@SP // 5640
M=M-1 // 5641

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5642
D=A // 5643
@SP // 5644
M=D+M // 5645
@44 // 5646
D=A // 5647
@SP // 5648
A=M-1 // 5649
M=0 // 5650
A=A-1 // 5651
M=0 // 5652
A=A-1 // 5653
M=0 // 5654
A=A-1 // 5655
M=0 // 5656
A=A-1 // 5657
M=0 // 5658
A=A-1 // 5659
M=0 // 5660
A=A-1 // 5661
M=0 // 5662
A=A-1 // 5663
M=D // 5664
A=A-1 // 5665
@12 // 5666
D=A // 5667
@SP // 5668
AM=M+1 // 5669
A=A-1 // 5670
M=D // 5671
@12 // 5672
D=A // 5673
@SP // 5674
AM=M+1 // 5675
A=A-1 // 5676
M=D // 5677
@6 // 5678
D=A // 5679
@SP // 5680
AM=M+1 // 5681
A=A-1 // 5682
M=D // 5683
@SP // 5684
AM=M+1 // 5685
A=A-1 // 5686
M=0 // 5687
// call Output.create
@17 // 5688
D=A // 5689
@14 // 5690
M=D // 5691
@Output.create // 5692
D=A // 5693
@13 // 5694
M=D // 5695
@Output.init.ret.14 // 5696
D=A // 5697
@CALL // 5698
0;JMP // 5699
(Output.init.ret.14)
@SP // 5700
M=M-1 // 5701

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5702
D=A // 5703
@SP // 5704
M=D+M // 5705
@45 // 5706
D=A // 5707
@SP // 5708
A=M-1 // 5709
M=0 // 5710
A=A-1 // 5711
M=0 // 5712
A=A-1 // 5713
M=0 // 5714
A=A-1 // 5715
M=0 // 5716
A=A-1 // 5717
M=0 // 5718
A=A-1 // 5719
M=D // 5720
A=A-1 // 5721
@6 // 5722
D=A // 5723
@SP // 5724
M=D+M // 5725
@63 // 5726
D=A // 5727
@SP // 5728
A=M-1 // 5729
M=0 // 5730
A=A-1 // 5731
M=0 // 5732
A=A-1 // 5733
M=0 // 5734
A=A-1 // 5735
M=0 // 5736
A=A-1 // 5737
M=0 // 5738
A=A-1 // 5739
M=D // 5740
A=A-1 // 5741
// call Output.create
@17 // 5742
D=A // 5743
@14 // 5744
M=D // 5745
@Output.create // 5746
D=A // 5747
@13 // 5748
M=D // 5749
@Output.init.ret.15 // 5750
D=A // 5751
@CALL // 5752
0;JMP // 5753
(Output.init.ret.15)
@SP // 5754
M=M-1 // 5755

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5756
D=A // 5757
@SP // 5758
M=D+M // 5759
@46 // 5760
D=A // 5761
@SP // 5762
A=M-1 // 5763
M=0 // 5764
A=A-1 // 5765
M=0 // 5766
A=A-1 // 5767
M=0 // 5768
A=A-1 // 5769
M=0 // 5770
A=A-1 // 5771
M=0 // 5772
A=A-1 // 5773
M=0 // 5774
A=A-1 // 5775
M=0 // 5776
A=A-1 // 5777
M=D // 5778
A=A-1 // 5779
@4 // 5780
D=A // 5781
@SP // 5782
M=D+M // 5783
@12 // 5784
D=A // 5785
@SP // 5786
A=M-1 // 5787
M=0 // 5788
A=A-1 // 5789
M=0 // 5790
A=A-1 // 5791
M=D // 5792
A=A-1 // 5793
M=D // 5794
A=A-1 // 5795
// call Output.create
@17 // 5796
D=A // 5797
@14 // 5798
M=D // 5799
@Output.create // 5800
D=A // 5801
@13 // 5802
M=D // 5803
@Output.init.ret.16 // 5804
D=A // 5805
@CALL // 5806
0;JMP // 5807
(Output.init.ret.16)
@SP // 5808
M=M-1 // 5809

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5810
D=A // 5811
@SP // 5812
M=D+M // 5813
@47 // 5814
D=A // 5815
@SP // 5816
A=M-1 // 5817
M=0 // 5818
A=A-1 // 5819
M=0 // 5820
A=A-1 // 5821
M=D // 5822
A=A-1 // 5823
@32 // 5824
D=A // 5825
@SP // 5826
AM=M+1 // 5827
A=A-1 // 5828
M=D // 5829
@48 // 5830
D=A // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=D // 5835
@24 // 5836
D=A // 5837
@SP // 5838
AM=M+1 // 5839
A=A-1 // 5840
M=D // 5841
@12 // 5842
D=A // 5843
@SP // 5844
AM=M+1 // 5845
A=A-1 // 5846
M=D // 5847
@6 // 5848
D=A // 5849
@SP // 5850
AM=M+1 // 5851
A=A-1 // 5852
M=D // 5853
@3 // 5854
D=A // 5855
@SP // 5856
AM=M+1 // 5857
A=A-1 // 5858
M=D // 5859
@SP // 5860
AM=M+1 // 5861
A=A-1 // 5862
M=1 // 5863
@SP // 5864
AM=M+1 // 5865
A=A-1 // 5866
M=0 // 5867
@SP // 5868
AM=M+1 // 5869
A=A-1 // 5870
M=0 // 5871
// call Output.create
@17 // 5872
D=A // 5873
@14 // 5874
M=D // 5875
@Output.create // 5876
D=A // 5877
@13 // 5878
M=D // 5879
@Output.init.ret.17 // 5880
D=A // 5881
@CALL // 5882
0;JMP // 5883
(Output.init.ret.17)
@SP // 5884
M=M-1 // 5885

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5886
D=A // 5887
@SP // 5888
AM=M+1 // 5889
A=A-1 // 5890
M=D // 5891
@12 // 5892
D=A // 5893
@SP // 5894
AM=M+1 // 5895
A=A-1 // 5896
M=D // 5897
@30 // 5898
D=A // 5899
@SP // 5900
AM=M+1 // 5901
A=A-1 // 5902
M=D // 5903
@51 // 5904
D=A // 5905
@SP // 5906
AM=M+1 // 5907
A=A-1 // 5908
M=D // 5909
@51 // 5910
D=A // 5911
@SP // 5912
AM=M+1 // 5913
A=A-1 // 5914
M=D // 5915
@51 // 5916
D=A // 5917
@SP // 5918
AM=M+1 // 5919
A=A-1 // 5920
M=D // 5921
@51 // 5922
D=A // 5923
@SP // 5924
AM=M+1 // 5925
A=A-1 // 5926
M=D // 5927
@51 // 5928
D=A // 5929
@SP // 5930
AM=M+1 // 5931
A=A-1 // 5932
M=D // 5933
@30 // 5934
D=A // 5935
@SP // 5936
AM=M+1 // 5937
A=A-1 // 5938
M=D // 5939
@12 // 5940
D=A // 5941
@SP // 5942
AM=M+1 // 5943
A=A-1 // 5944
M=D // 5945
@SP // 5946
AM=M+1 // 5947
A=A-1 // 5948
M=0 // 5949
@SP // 5950
AM=M+1 // 5951
A=A-1 // 5952
M=0 // 5953
// call Output.create
@17 // 5954
D=A // 5955
@14 // 5956
M=D // 5957
@Output.create // 5958
D=A // 5959
@13 // 5960
M=D // 5961
@Output.init.ret.18 // 5962
D=A // 5963
@CALL // 5964
0;JMP // 5965
(Output.init.ret.18)
@SP // 5966
M=M-1 // 5967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5968
D=A // 5969
@SP // 5970
AM=M+1 // 5971
A=A-1 // 5972
M=D // 5973
@12 // 5974
D=A // 5975
@SP // 5976
AM=M+1 // 5977
A=A-1 // 5978
M=D // 5979
@14 // 5980
D=A // 5981
@SP // 5982
AM=M+1 // 5983
A=A-1 // 5984
M=D // 5985
@15 // 5986
D=A // 5987
@SP // 5988
AM=M+1 // 5989
A=A-1 // 5990
M=D // 5991
@12 // 5992
D=A // 5993
@SP // 5994
AM=M+1 // 5995
A=A-1 // 5996
M=D // 5997
@12 // 5998
D=A // 5999
@SP // 6000
AM=M+1 // 6001
A=A-1 // 6002
M=D // 6003
@12 // 6004
D=A // 6005
@SP // 6006
AM=M+1 // 6007
A=A-1 // 6008
M=D // 6009
@12 // 6010
D=A // 6011
@SP // 6012
AM=M+1 // 6013
A=A-1 // 6014
M=D // 6015
@12 // 6016
D=A // 6017
@SP // 6018
AM=M+1 // 6019
A=A-1 // 6020
M=D // 6021
@63 // 6022
D=A // 6023
@SP // 6024
AM=M+1 // 6025
A=A-1 // 6026
M=D // 6027
@SP // 6028
AM=M+1 // 6029
A=A-1 // 6030
M=0 // 6031
@SP // 6032
AM=M+1 // 6033
A=A-1 // 6034
M=0 // 6035
// call Output.create
@17 // 6036
D=A // 6037
@14 // 6038
M=D // 6039
@Output.create // 6040
D=A // 6041
@13 // 6042
M=D // 6043
@Output.init.ret.19 // 6044
D=A // 6045
@CALL // 6046
0;JMP // 6047
(Output.init.ret.19)
@SP // 6048
M=M-1 // 6049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 6050
D=A // 6051
@SP // 6052
AM=M+1 // 6053
A=A-1 // 6054
M=D // 6055
@30 // 6056
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
@48 // 6068
D=A // 6069
@SP // 6070
AM=M+1 // 6071
A=A-1 // 6072
M=D // 6073
@24 // 6074
D=A // 6075
@SP // 6076
AM=M+1 // 6077
A=A-1 // 6078
M=D // 6079
@12 // 6080
D=A // 6081
@SP // 6082
AM=M+1 // 6083
A=A-1 // 6084
M=D // 6085
@6 // 6086
D=A // 6087
@SP // 6088
AM=M+1 // 6089
A=A-1 // 6090
M=D // 6091
@3 // 6092
D=A // 6093
@SP // 6094
AM=M+1 // 6095
A=A-1 // 6096
M=D // 6097
@51 // 6098
D=A // 6099
@SP // 6100
AM=M+1 // 6101
A=A-1 // 6102
M=D // 6103
@63 // 6104
D=A // 6105
@SP // 6106
AM=M+1 // 6107
A=A-1 // 6108
M=D // 6109
@SP // 6110
AM=M+1 // 6111
A=A-1 // 6112
M=0 // 6113
@SP // 6114
AM=M+1 // 6115
A=A-1 // 6116
M=0 // 6117
// call Output.create
@17 // 6118
D=A // 6119
@14 // 6120
M=D // 6121
@Output.create // 6122
D=A // 6123
@13 // 6124
M=D // 6125
@Output.init.ret.20 // 6126
D=A // 6127
@CALL // 6128
0;JMP // 6129
(Output.init.ret.20)
@SP // 6130
M=M-1 // 6131

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 6132
D=A // 6133
@SP // 6134
AM=M+1 // 6135
A=A-1 // 6136
M=D // 6137
@30 // 6138
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
@48 // 6150
D=A // 6151
@SP // 6152
AM=M+1 // 6153
A=A-1 // 6154
M=D // 6155
@48 // 6156
D=A // 6157
@SP // 6158
AM=M+1 // 6159
A=A-1 // 6160
M=D // 6161
@28 // 6162
D=A // 6163
@SP // 6164
AM=M+1 // 6165
A=A-1 // 6166
M=D // 6167
@48 // 6168
D=A // 6169
@SP // 6170
AM=M+1 // 6171
A=A-1 // 6172
M=D // 6173
@48 // 6174
D=A // 6175
@SP // 6176
AM=M+1 // 6177
A=A-1 // 6178
M=D // 6179
@51 // 6180
D=A // 6181
@SP // 6182
AM=M+1 // 6183
A=A-1 // 6184
M=D // 6185
@30 // 6186
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
// call Output.create
@17 // 6200
D=A // 6201
@14 // 6202
M=D // 6203
@Output.create // 6204
D=A // 6205
@13 // 6206
M=D // 6207
@Output.init.ret.21 // 6208
D=A // 6209
@CALL // 6210
0;JMP // 6211
(Output.init.ret.21)
@SP // 6212
M=M-1 // 6213

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 6214
D=A // 6215
@SP // 6216
AM=M+1 // 6217
A=A-1 // 6218
M=D // 6219
@16 // 6220
D=A // 6221
@SP // 6222
AM=M+1 // 6223
A=A-1 // 6224
M=D // 6225
@24 // 6226
D=A // 6227
@SP // 6228
AM=M+1 // 6229
A=A-1 // 6230
M=D // 6231
@28 // 6232
D=A // 6233
@SP // 6234
AM=M+1 // 6235
A=A-1 // 6236
M=D // 6237
@26 // 6238
D=A // 6239
@SP // 6240
AM=M+1 // 6241
A=A-1 // 6242
M=D // 6243
@25 // 6244
D=A // 6245
@SP // 6246
AM=M+1 // 6247
A=A-1 // 6248
M=D // 6249
@63 // 6250
D=A // 6251
@SP // 6252
AM=M+1 // 6253
A=A-1 // 6254
M=D // 6255
@24 // 6256
D=A // 6257
@SP // 6258
AM=M+1 // 6259
A=A-1 // 6260
M=D // 6261
@24 // 6262
D=A // 6263
@SP // 6264
AM=M+1 // 6265
A=A-1 // 6266
M=D // 6267
@60 // 6268
D=A // 6269
@SP // 6270
AM=M+1 // 6271
A=A-1 // 6272
M=D // 6273
@SP // 6274
AM=M+1 // 6275
A=A-1 // 6276
M=0 // 6277
@SP // 6278
AM=M+1 // 6279
A=A-1 // 6280
M=0 // 6281
// call Output.create
@17 // 6282
D=A // 6283
@14 // 6284
M=D // 6285
@Output.create // 6286
D=A // 6287
@13 // 6288
M=D // 6289
@Output.init.ret.22 // 6290
D=A // 6291
@CALL // 6292
0;JMP // 6293
(Output.init.ret.22)
@SP // 6294
M=M-1 // 6295

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 6296
D=A // 6297
@SP // 6298
AM=M+1 // 6299
A=A-1 // 6300
M=D // 6301
@63 // 6302
D=A // 6303
@SP // 6304
AM=M+1 // 6305
A=A-1 // 6306
M=D // 6307
@3 // 6308
D=A // 6309
@SP // 6310
AM=M+1 // 6311
A=A-1 // 6312
M=D // 6313
@3 // 6314
D=A // 6315
@SP // 6316
AM=M+1 // 6317
A=A-1 // 6318
M=D // 6319
@31 // 6320
D=A // 6321
@SP // 6322
AM=M+1 // 6323
A=A-1 // 6324
M=D // 6325
@48 // 6326
D=A // 6327
@SP // 6328
AM=M+1 // 6329
A=A-1 // 6330
M=D // 6331
@48 // 6332
D=A // 6333
@SP // 6334
AM=M+1 // 6335
A=A-1 // 6336
M=D // 6337
@48 // 6338
D=A // 6339
@SP // 6340
AM=M+1 // 6341
A=A-1 // 6342
M=D // 6343
@51 // 6344
D=A // 6345
@SP // 6346
AM=M+1 // 6347
A=A-1 // 6348
M=D // 6349
@30 // 6350
D=A // 6351
@SP // 6352
AM=M+1 // 6353
A=A-1 // 6354
M=D // 6355
@SP // 6356
AM=M+1 // 6357
A=A-1 // 6358
M=0 // 6359
@SP // 6360
AM=M+1 // 6361
A=A-1 // 6362
M=0 // 6363
// call Output.create
@17 // 6364
D=A // 6365
@14 // 6366
M=D // 6367
@Output.create // 6368
D=A // 6369
@13 // 6370
M=D // 6371
@Output.init.ret.23 // 6372
D=A // 6373
@CALL // 6374
0;JMP // 6375
(Output.init.ret.23)
@SP // 6376
M=M-1 // 6377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 6378
D=A // 6379
@SP // 6380
AM=M+1 // 6381
A=A-1 // 6382
M=D // 6383
@28 // 6384
D=A // 6385
@SP // 6386
AM=M+1 // 6387
A=A-1 // 6388
M=D // 6389
@6 // 6390
D=A // 6391
@SP // 6392
AM=M+1 // 6393
A=A-1 // 6394
M=D // 6395
@3 // 6396
D=A // 6397
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=D // 6401
@3 // 6402
D=A // 6403
@SP // 6404
AM=M+1 // 6405
A=A-1 // 6406
M=D // 6407
@31 // 6408
D=A // 6409
@SP // 6410
AM=M+1 // 6411
A=A-1 // 6412
M=D // 6413
@51 // 6414
D=A // 6415
@SP // 6416
AM=M+1 // 6417
A=A-1 // 6418
M=D // 6419
@51 // 6420
D=A // 6421
@SP // 6422
AM=M+1 // 6423
A=A-1 // 6424
M=D // 6425
@51 // 6426
D=A // 6427
@SP // 6428
AM=M+1 // 6429
A=A-1 // 6430
M=D // 6431
@30 // 6432
D=A // 6433
@SP // 6434
AM=M+1 // 6435
A=A-1 // 6436
M=D // 6437
@SP // 6438
AM=M+1 // 6439
A=A-1 // 6440
M=0 // 6441
@SP // 6442
AM=M+1 // 6443
A=A-1 // 6444
M=0 // 6445
// call Output.create
@17 // 6446
D=A // 6447
@14 // 6448
M=D // 6449
@Output.create // 6450
D=A // 6451
@13 // 6452
M=D // 6453
@Output.init.ret.24 // 6454
D=A // 6455
@CALL // 6456
0;JMP // 6457
(Output.init.ret.24)
@SP // 6458
M=M-1 // 6459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 6460
D=A // 6461
@SP // 6462
AM=M+1 // 6463
A=A-1 // 6464
M=D // 6465
@63 // 6466
D=A // 6467
@SP // 6468
AM=M+1 // 6469
A=A-1 // 6470
M=D // 6471
@49 // 6472
D=A // 6473
@SP // 6474
AM=M+1 // 6475
A=A-1 // 6476
M=D // 6477
@48 // 6478
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
@12 // 6502
D=A // 6503
@SP // 6504
AM=M+1 // 6505
A=A-1 // 6506
M=D // 6507
@12 // 6508
D=A // 6509
@SP // 6510
AM=M+1 // 6511
A=A-1 // 6512
M=D // 6513
@12 // 6514
D=A // 6515
@SP // 6516
AM=M+1 // 6517
A=A-1 // 6518
M=D // 6519
@SP // 6520
AM=M+1 // 6521
A=A-1 // 6522
M=0 // 6523
@SP // 6524
AM=M+1 // 6525
A=A-1 // 6526
M=0 // 6527
// call Output.create
@17 // 6528
D=A // 6529
@14 // 6530
M=D // 6531
@Output.create // 6532
D=A // 6533
@13 // 6534
M=D // 6535
@Output.init.ret.25 // 6536
D=A // 6537
@CALL // 6538
0;JMP // 6539
(Output.init.ret.25)
@SP // 6540
M=M-1 // 6541

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 6542
D=A // 6543
@SP // 6544
AM=M+1 // 6545
A=A-1 // 6546
M=D // 6547
@30 // 6548
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
@51 // 6560
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
@30 // 6572
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
@51 // 6590
D=A // 6591
@SP // 6592
AM=M+1 // 6593
A=A-1 // 6594
M=D // 6595
@30 // 6596
D=A // 6597
@SP // 6598
AM=M+1 // 6599
A=A-1 // 6600
M=D // 6601
@SP // 6602
AM=M+1 // 6603
A=A-1 // 6604
M=0 // 6605
@SP // 6606
AM=M+1 // 6607
A=A-1 // 6608
M=0 // 6609
// call Output.create
@17 // 6610
D=A // 6611
@14 // 6612
M=D // 6613
@Output.create // 6614
D=A // 6615
@13 // 6616
M=D // 6617
@Output.init.ret.26 // 6618
D=A // 6619
@CALL // 6620
0;JMP // 6621
(Output.init.ret.26)
@SP // 6622
M=M-1 // 6623

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6624
D=A // 6625
@SP // 6626
AM=M+1 // 6627
A=A-1 // 6628
M=D // 6629
@30 // 6630
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
@62 // 6654
D=A // 6655
@SP // 6656
AM=M+1 // 6657
A=A-1 // 6658
M=D // 6659
@48 // 6660
D=A // 6661
@SP // 6662
AM=M+1 // 6663
A=A-1 // 6664
M=D // 6665
@48 // 6666
D=A // 6667
@SP // 6668
AM=M+1 // 6669
A=A-1 // 6670
M=D // 6671
@24 // 6672
D=A // 6673
@SP // 6674
AM=M+1 // 6675
A=A-1 // 6676
M=D // 6677
@14 // 6678
D=A // 6679
@SP // 6680
AM=M+1 // 6681
A=A-1 // 6682
M=D // 6683
@SP // 6684
AM=M+1 // 6685
A=A-1 // 6686
M=0 // 6687
@SP // 6688
AM=M+1 // 6689
A=A-1 // 6690
M=0 // 6691
// call Output.create
@17 // 6692
D=A // 6693
@14 // 6694
M=D // 6695
@Output.create // 6696
D=A // 6697
@13 // 6698
M=D // 6699
@Output.init.ret.27 // 6700
D=A // 6701
@CALL // 6702
0;JMP // 6703
(Output.init.ret.27)
@SP // 6704
M=M-1 // 6705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6706
D=A // 6707
@SP // 6708
M=D+M // 6709
@58 // 6710
D=A // 6711
@SP // 6712
A=M-1 // 6713
M=0 // 6714
A=A-1 // 6715
M=0 // 6716
A=A-1 // 6717
M=D // 6718
A=A-1 // 6719
@4 // 6720
D=A // 6721
@SP // 6722
M=D+M // 6723
@12 // 6724
D=A // 6725
@SP // 6726
A=M-1 // 6727
M=0 // 6728
A=A-1 // 6729
M=0 // 6730
A=A-1 // 6731
M=D // 6732
A=A-1 // 6733
M=D // 6734
A=A-1 // 6735
@5 // 6736
D=A // 6737
@SP // 6738
M=D+M // 6739
@12 // 6740
D=A // 6741
@SP // 6742
A=M-1 // 6743
M=0 // 6744
A=A-1 // 6745
M=0 // 6746
A=A-1 // 6747
M=0 // 6748
A=A-1 // 6749
M=D // 6750
A=A-1 // 6751
M=D // 6752
A=A-1 // 6753
// call Output.create
@17 // 6754
D=A // 6755
@14 // 6756
M=D // 6757
@Output.create // 6758
D=A // 6759
@13 // 6760
M=D // 6761
@Output.init.ret.28 // 6762
D=A // 6763
@CALL // 6764
0;JMP // 6765
(Output.init.ret.28)
@SP // 6766
M=M-1 // 6767

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6768
D=A // 6769
@SP // 6770
M=D+M // 6771
@59 // 6772
D=A // 6773
@SP // 6774
A=M-1 // 6775
M=0 // 6776
A=A-1 // 6777
M=0 // 6778
A=A-1 // 6779
M=D // 6780
A=A-1 // 6781
@4 // 6782
D=A // 6783
@SP // 6784
M=D+M // 6785
@12 // 6786
D=A // 6787
@SP // 6788
A=M-1 // 6789
M=0 // 6790
A=A-1 // 6791
M=0 // 6792
A=A-1 // 6793
M=D // 6794
A=A-1 // 6795
M=D // 6796
A=A-1 // 6797
@12 // 6798
D=A // 6799
@SP // 6800
AM=M+1 // 6801
A=A-1 // 6802
M=D // 6803
@12 // 6804
D=A // 6805
@SP // 6806
AM=M+1 // 6807
A=A-1 // 6808
M=D // 6809
@6 // 6810
D=A // 6811
@SP // 6812
AM=M+1 // 6813
A=A-1 // 6814
M=D // 6815
@SP // 6816
AM=M+1 // 6817
A=A-1 // 6818
M=0 // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=0 // 6823
// call Output.create
@17 // 6824
D=A // 6825
@14 // 6826
M=D // 6827
@Output.create // 6828
D=A // 6829
@13 // 6830
M=D // 6831
@Output.init.ret.29 // 6832
D=A // 6833
@CALL // 6834
0;JMP // 6835
(Output.init.ret.29)
@SP // 6836
M=M-1 // 6837

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6838
D=A // 6839
@SP // 6840
M=D+M // 6841
@60 // 6842
D=A // 6843
@SP // 6844
A=M-1 // 6845
M=0 // 6846
A=A-1 // 6847
M=0 // 6848
A=A-1 // 6849
M=D // 6850
A=A-1 // 6851
@24 // 6852
D=A // 6853
@SP // 6854
AM=M+1 // 6855
A=A-1 // 6856
M=D // 6857
@12 // 6858
D=A // 6859
@SP // 6860
AM=M+1 // 6861
A=A-1 // 6862
M=D // 6863
@6 // 6864
D=A // 6865
@SP // 6866
AM=M+1 // 6867
A=A-1 // 6868
M=D // 6869
@3 // 6870
D=A // 6871
@SP // 6872
AM=M+1 // 6873
A=A-1 // 6874
M=D // 6875
@6 // 6876
D=A // 6877
@SP // 6878
AM=M+1 // 6879
A=A-1 // 6880
M=D // 6881
@12 // 6882
D=A // 6883
@SP // 6884
AM=M+1 // 6885
A=A-1 // 6886
M=D // 6887
@24 // 6888
D=A // 6889
@SP // 6890
AM=M+1 // 6891
A=A-1 // 6892
M=D // 6893
@SP // 6894
AM=M+1 // 6895
A=A-1 // 6896
M=0 // 6897
@SP // 6898
AM=M+1 // 6899
A=A-1 // 6900
M=0 // 6901
// call Output.create
@17 // 6902
D=A // 6903
@14 // 6904
M=D // 6905
@Output.create // 6906
D=A // 6907
@13 // 6908
M=D // 6909
@Output.init.ret.30 // 6910
D=A // 6911
@CALL // 6912
0;JMP // 6913
(Output.init.ret.30)
@SP // 6914
M=M-1 // 6915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6916
D=A // 6917
@SP // 6918
M=D+M // 6919
@61 // 6920
D=A // 6921
@SP // 6922
A=M-1 // 6923
M=0 // 6924
A=A-1 // 6925
M=0 // 6926
A=A-1 // 6927
M=0 // 6928
A=A-1 // 6929
M=D // 6930
A=A-1 // 6931
@3 // 6932
D=A // 6933
@SP // 6934
M=D+M // 6935
@63 // 6936
D=A // 6937
@SP // 6938
A=M-1 // 6939
M=0 // 6940
A=A-1 // 6941
M=0 // 6942
A=A-1 // 6943
M=D // 6944
A=A-1 // 6945
@5 // 6946
D=A // 6947
@SP // 6948
M=D+M // 6949
@63 // 6950
D=A // 6951
@SP // 6952
A=M-1 // 6953
M=0 // 6954
A=A-1 // 6955
M=0 // 6956
A=A-1 // 6957
M=0 // 6958
A=A-1 // 6959
M=0 // 6960
A=A-1 // 6961
M=D // 6962
A=A-1 // 6963
// call Output.create
@17 // 6964
D=A // 6965
@14 // 6966
M=D // 6967
@Output.create // 6968
D=A // 6969
@13 // 6970
M=D // 6971
@Output.init.ret.31 // 6972
D=A // 6973
@CALL // 6974
0;JMP // 6975
(Output.init.ret.31)
@SP // 6976
M=M-1 // 6977

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6978
D=A // 6979
@SP // 6980
M=D+M // 6981
@62 // 6982
D=A // 6983
@SP // 6984
A=M-1 // 6985
M=0 // 6986
A=A-1 // 6987
M=0 // 6988
A=A-1 // 6989
M=D // 6990
A=A-1 // 6991
@3 // 6992
D=A // 6993
@SP // 6994
AM=M+1 // 6995
A=A-1 // 6996
M=D // 6997
@6 // 6998
D=A // 6999
@SP // 7000
AM=M+1 // 7001
A=A-1 // 7002
M=D // 7003
@12 // 7004
D=A // 7005
@SP // 7006
AM=M+1 // 7007
A=A-1 // 7008
M=D // 7009
@24 // 7010
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
@6 // 7022
D=A // 7023
@SP // 7024
AM=M+1 // 7025
A=A-1 // 7026
M=D // 7027
@3 // 7028
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
@Output.init.ret.32 // 7050
D=A // 7051
@CALL // 7052
0;JMP // 7053
(Output.init.ret.32)
@SP // 7054
M=M-1 // 7055

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 7056
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
@59 // 7080
D=A // 7081
@SP // 7082
AM=M+1 // 7083
A=A-1 // 7084
M=D // 7085
@59 // 7086
D=A // 7087
@SP // 7088
AM=M+1 // 7089
A=A-1 // 7090
M=D // 7091
@59 // 7092
D=A // 7093
@SP // 7094
AM=M+1 // 7095
A=A-1 // 7096
M=D // 7097
@27 // 7098
D=A // 7099
@SP // 7100
AM=M+1 // 7101
A=A-1 // 7102
M=D // 7103
@3 // 7104
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
@Output.init.ret.33 // 7132
D=A // 7133
@CALL // 7134
0;JMP // 7135
(Output.init.ret.33)
@SP // 7136
M=M-1 // 7137

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 7138
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
@12 // 7174
D=A // 7175
@SP // 7176
AM=M+1 // 7177
A=A-1 // 7178
M=D // 7179
@SP // 7180
AM=M+1 // 7181
A=A-1 // 7182
M=0 // 7183
@4 // 7184
D=A // 7185
@SP // 7186
M=D+M // 7187
@12 // 7188
D=A // 7189
@SP // 7190
A=M-1 // 7191
M=0 // 7192
A=A-1 // 7193
M=0 // 7194
A=A-1 // 7195
M=D // 7196
A=A-1 // 7197
M=D // 7198
A=A-1 // 7199
// call Output.create
@17 // 7200
D=A // 7201
@14 // 7202
M=D // 7203
@Output.create // 7204
D=A // 7205
@13 // 7206
M=D // 7207
@Output.init.ret.34 // 7208
D=A // 7209
@CALL // 7210
0;JMP // 7211
(Output.init.ret.34)
@SP // 7212
M=M-1 // 7213

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 7214
D=A // 7215
@SP // 7216
AM=M+1 // 7217
A=A-1 // 7218
M=D // 7219
@12 // 7220
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
@63 // 7244
D=A // 7245
@SP // 7246
AM=M+1 // 7247
A=A-1 // 7248
M=D // 7249
@51 // 7250
D=A // 7251
@SP // 7252
AM=M+1 // 7253
A=A-1 // 7254
M=D // 7255
@51 // 7256
D=A // 7257
@SP // 7258
AM=M+1 // 7259
A=A-1 // 7260
M=D // 7261
@51 // 7262
D=A // 7263
@SP // 7264
AM=M+1 // 7265
A=A-1 // 7266
M=D // 7267
@51 // 7268
D=A // 7269
@SP // 7270
AM=M+1 // 7271
A=A-1 // 7272
M=D // 7273
@SP // 7274
AM=M+1 // 7275
A=A-1 // 7276
M=0 // 7277
@SP // 7278
AM=M+1 // 7279
A=A-1 // 7280
M=0 // 7281
// call Output.create
@17 // 7282
D=A // 7283
@14 // 7284
M=D // 7285
@Output.create // 7286
D=A // 7287
@13 // 7288
M=D // 7289
@Output.init.ret.35 // 7290
D=A // 7291
@CALL // 7292
0;JMP // 7293
(Output.init.ret.35)
@SP // 7294
M=M-1 // 7295

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 7296
D=A // 7297
@SP // 7298
AM=M+1 // 7299
A=A-1 // 7300
M=D // 7301
@31 // 7302
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
@51 // 7320
D=A // 7321
@SP // 7322
AM=M+1 // 7323
A=A-1 // 7324
M=D // 7325
@31 // 7326
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
@51 // 7338
D=A // 7339
@SP // 7340
AM=M+1 // 7341
A=A-1 // 7342
M=D // 7343
@51 // 7344
D=A // 7345
@SP // 7346
AM=M+1 // 7347
A=A-1 // 7348
M=D // 7349
@31 // 7350
D=A // 7351
@SP // 7352
AM=M+1 // 7353
A=A-1 // 7354
M=D // 7355
@SP // 7356
AM=M+1 // 7357
A=A-1 // 7358
M=0 // 7359
@SP // 7360
AM=M+1 // 7361
A=A-1 // 7362
M=0 // 7363
// call Output.create
@17 // 7364
D=A // 7365
@14 // 7366
M=D // 7367
@Output.create // 7368
D=A // 7369
@13 // 7370
M=D // 7371
@Output.init.ret.36 // 7372
D=A // 7373
@CALL // 7374
0;JMP // 7375
(Output.init.ret.36)
@SP // 7376
M=M-1 // 7377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 7378
D=A // 7379
@SP // 7380
AM=M+1 // 7381
A=A-1 // 7382
M=D // 7383
@28 // 7384
D=A // 7385
@SP // 7386
AM=M+1 // 7387
A=A-1 // 7388
M=D // 7389
@54 // 7390
D=A // 7391
@SP // 7392
AM=M+1 // 7393
A=A-1 // 7394
M=D // 7395
@35 // 7396
D=A // 7397
@SP // 7398
AM=M+1 // 7399
A=A-1 // 7400
M=D // 7401
@3 // 7402
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
@35 // 7420
D=A // 7421
@SP // 7422
AM=M+1 // 7423
A=A-1 // 7424
M=D // 7425
@54 // 7426
D=A // 7427
@SP // 7428
AM=M+1 // 7429
A=A-1 // 7430
M=D // 7431
@28 // 7432
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
// call Output.create
@17 // 7446
D=A // 7447
@14 // 7448
M=D // 7449
@Output.create // 7450
D=A // 7451
@13 // 7452
M=D // 7453
@Output.init.ret.37 // 7454
D=A // 7455
@CALL // 7456
0;JMP // 7457
(Output.init.ret.37)
@SP // 7458
M=M-1 // 7459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 7460
D=A // 7461
@SP // 7462
AM=M+1 // 7463
A=A-1 // 7464
M=D // 7465
@15 // 7466
D=A // 7467
@SP // 7468
AM=M+1 // 7469
A=A-1 // 7470
M=D // 7471
@27 // 7472
D=A // 7473
@SP // 7474
AM=M+1 // 7475
A=A-1 // 7476
M=D // 7477
@51 // 7478
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
@51 // 7496
D=A // 7497
@SP // 7498
AM=M+1 // 7499
A=A-1 // 7500
M=D // 7501
@51 // 7502
D=A // 7503
@SP // 7504
AM=M+1 // 7505
A=A-1 // 7506
M=D // 7507
@27 // 7508
D=A // 7509
@SP // 7510
AM=M+1 // 7511
A=A-1 // 7512
M=D // 7513
@15 // 7514
D=A // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=D // 7519
@SP // 7520
AM=M+1 // 7521
A=A-1 // 7522
M=0 // 7523
@SP // 7524
AM=M+1 // 7525
A=A-1 // 7526
M=0 // 7527
// call Output.create
@17 // 7528
D=A // 7529
@14 // 7530
M=D // 7531
@Output.create // 7532
D=A // 7533
@13 // 7534
M=D // 7535
@Output.init.ret.38 // 7536
D=A // 7537
@CALL // 7538
0;JMP // 7539
(Output.init.ret.38)
@SP // 7540
M=M-1 // 7541

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 7542
D=A // 7543
@SP // 7544
AM=M+1 // 7545
A=A-1 // 7546
M=D // 7547
@63 // 7548
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
@35 // 7560
D=A // 7561
@SP // 7562
AM=M+1 // 7563
A=A-1 // 7564
M=D // 7565
@11 // 7566
D=A // 7567
@SP // 7568
AM=M+1 // 7569
A=A-1 // 7570
M=D // 7571
@15 // 7572
D=A // 7573
@SP // 7574
AM=M+1 // 7575
A=A-1 // 7576
M=D // 7577
@11 // 7578
D=A // 7579
@SP // 7580
AM=M+1 // 7581
A=A-1 // 7582
M=D // 7583
@35 // 7584
D=A // 7585
@SP // 7586
AM=M+1 // 7587
A=A-1 // 7588
M=D // 7589
@51 // 7590
D=A // 7591
@SP // 7592
AM=M+1 // 7593
A=A-1 // 7594
M=D // 7595
@63 // 7596
D=A // 7597
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=D // 7601
@SP // 7602
AM=M+1 // 7603
A=A-1 // 7604
M=0 // 7605
@SP // 7606
AM=M+1 // 7607
A=A-1 // 7608
M=0 // 7609
// call Output.create
@17 // 7610
D=A // 7611
@14 // 7612
M=D // 7613
@Output.create // 7614
D=A // 7615
@13 // 7616
M=D // 7617
@Output.init.ret.39 // 7618
D=A // 7619
@CALL // 7620
0;JMP // 7621
(Output.init.ret.39)
@SP // 7622
M=M-1 // 7623

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7624
D=A // 7625
@SP // 7626
AM=M+1 // 7627
A=A-1 // 7628
M=D // 7629
@63 // 7630
D=A // 7631
@SP // 7632
AM=M+1 // 7633
A=A-1 // 7634
M=D // 7635
@51 // 7636
D=A // 7637
@SP // 7638
AM=M+1 // 7639
A=A-1 // 7640
M=D // 7641
@35 // 7642
D=A // 7643
@SP // 7644
AM=M+1 // 7645
A=A-1 // 7646
M=D // 7647
@11 // 7648
D=A // 7649
@SP // 7650
AM=M+1 // 7651
A=A-1 // 7652
M=D // 7653
@15 // 7654
D=A // 7655
@SP // 7656
AM=M+1 // 7657
A=A-1 // 7658
M=D // 7659
@11 // 7660
D=A // 7661
@SP // 7662
AM=M+1 // 7663
A=A-1 // 7664
M=D // 7665
@3 // 7666
D=A // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=D // 7671
@3 // 7672
D=A // 7673
@SP // 7674
AM=M+1 // 7675
A=A-1 // 7676
M=D // 7677
@3 // 7678
D=A // 7679
@SP // 7680
AM=M+1 // 7681
A=A-1 // 7682
M=D // 7683
@SP // 7684
AM=M+1 // 7685
A=A-1 // 7686
M=0 // 7687
@SP // 7688
AM=M+1 // 7689
A=A-1 // 7690
M=0 // 7691
// call Output.create
@17 // 7692
D=A // 7693
@14 // 7694
M=D // 7695
@Output.create // 7696
D=A // 7697
@13 // 7698
M=D // 7699
@Output.init.ret.40 // 7700
D=A // 7701
@CALL // 7702
0;JMP // 7703
(Output.init.ret.40)
@SP // 7704
M=M-1 // 7705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7706
D=A // 7707
@SP // 7708
AM=M+1 // 7709
A=A-1 // 7710
M=D // 7711
@28 // 7712
D=A // 7713
@SP // 7714
AM=M+1 // 7715
A=A-1 // 7716
M=D // 7717
@54 // 7718
D=A // 7719
@SP // 7720
AM=M+1 // 7721
A=A-1 // 7722
M=D // 7723
@35 // 7724
D=A // 7725
@SP // 7726
AM=M+1 // 7727
A=A-1 // 7728
M=D // 7729
@3 // 7730
D=A // 7731
@SP // 7732
AM=M+1 // 7733
A=A-1 // 7734
M=D // 7735
@59 // 7736
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
@54 // 7754
D=A // 7755
@SP // 7756
AM=M+1 // 7757
A=A-1 // 7758
M=D // 7759
@44 // 7760
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
// call Output.create
@17 // 7774
D=A // 7775
@14 // 7776
M=D // 7777
@Output.create // 7778
D=A // 7779
@13 // 7780
M=D // 7781
@Output.init.ret.41 // 7782
D=A // 7783
@CALL // 7784
0;JMP // 7785
(Output.init.ret.41)
@SP // 7786
M=M-1 // 7787

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7788
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
@51 // 7800
D=A // 7801
@SP // 7802
AM=M+1 // 7803
A=A-1 // 7804
M=D // 7805
@51 // 7806
D=A // 7807
@SP // 7808
AM=M+1 // 7809
A=A-1 // 7810
M=D // 7811
@51 // 7812
D=A // 7813
@SP // 7814
AM=M+1 // 7815
A=A-1 // 7816
M=D // 7817
@63 // 7818
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
@51 // 7836
D=A // 7837
@SP // 7838
AM=M+1 // 7839
A=A-1 // 7840
M=D // 7841
@51 // 7842
D=A // 7843
@SP // 7844
AM=M+1 // 7845
A=A-1 // 7846
M=D // 7847
@SP // 7848
AM=M+1 // 7849
A=A-1 // 7850
M=0 // 7851
@SP // 7852
AM=M+1 // 7853
A=A-1 // 7854
M=0 // 7855
// call Output.create
@17 // 7856
D=A // 7857
@14 // 7858
M=D // 7859
@Output.create // 7860
D=A // 7861
@13 // 7862
M=D // 7863
@Output.init.ret.42 // 7864
D=A // 7865
@CALL // 7866
0;JMP // 7867
(Output.init.ret.42)
@SP // 7868
M=M-1 // 7869

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7870
D=A // 7871
@SP // 7872
AM=M+1 // 7873
A=A-1 // 7874
M=D // 7875
@30 // 7876
D=A // 7877
@SP // 7878
AM=M+1 // 7879
A=A-1 // 7880
M=D // 7881
@12 // 7882
D=A // 7883
@SP // 7884
AM=M+1 // 7885
A=A-1 // 7886
M=D // 7887
@12 // 7888
D=A // 7889
@SP // 7890
AM=M+1 // 7891
A=A-1 // 7892
M=D // 7893
@12 // 7894
D=A // 7895
@SP // 7896
AM=M+1 // 7897
A=A-1 // 7898
M=D // 7899
@12 // 7900
D=A // 7901
@SP // 7902
AM=M+1 // 7903
A=A-1 // 7904
M=D // 7905
@12 // 7906
D=A // 7907
@SP // 7908
AM=M+1 // 7909
A=A-1 // 7910
M=D // 7911
@12 // 7912
D=A // 7913
@SP // 7914
AM=M+1 // 7915
A=A-1 // 7916
M=D // 7917
@12 // 7918
D=A // 7919
@SP // 7920
AM=M+1 // 7921
A=A-1 // 7922
M=D // 7923
@30 // 7924
D=A // 7925
@SP // 7926
AM=M+1 // 7927
A=A-1 // 7928
M=D // 7929
@SP // 7930
AM=M+1 // 7931
A=A-1 // 7932
M=0 // 7933
@SP // 7934
AM=M+1 // 7935
A=A-1 // 7936
M=0 // 7937
// call Output.create
@17 // 7938
D=A // 7939
@14 // 7940
M=D // 7941
@Output.create // 7942
D=A // 7943
@13 // 7944
M=D // 7945
@Output.init.ret.43 // 7946
D=A // 7947
@CALL // 7948
0;JMP // 7949
(Output.init.ret.43)
@SP // 7950
M=M-1 // 7951

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7952
D=A // 7953
@SP // 7954
AM=M+1 // 7955
A=A-1 // 7956
M=D // 7957
@60 // 7958
D=A // 7959
@SP // 7960
AM=M+1 // 7961
A=A-1 // 7962
M=D // 7963
@24 // 7964
D=A // 7965
@SP // 7966
AM=M+1 // 7967
A=A-1 // 7968
M=D // 7969
@24 // 7970
D=A // 7971
@SP // 7972
AM=M+1 // 7973
A=A-1 // 7974
M=D // 7975
@24 // 7976
D=A // 7977
@SP // 7978
AM=M+1 // 7979
A=A-1 // 7980
M=D // 7981
@24 // 7982
D=A // 7983
@SP // 7984
AM=M+1 // 7985
A=A-1 // 7986
M=D // 7987
@24 // 7988
D=A // 7989
@SP // 7990
AM=M+1 // 7991
A=A-1 // 7992
M=D // 7993
@27 // 7994
D=A // 7995
@SP // 7996
AM=M+1 // 7997
A=A-1 // 7998
M=D // 7999
@27 // 8000
D=A // 8001
@SP // 8002
AM=M+1 // 8003
A=A-1 // 8004
M=D // 8005
@14 // 8006
D=A // 8007
@SP // 8008
AM=M+1 // 8009
A=A-1 // 8010
M=D // 8011
@SP // 8012
AM=M+1 // 8013
A=A-1 // 8014
M=0 // 8015
@SP // 8016
AM=M+1 // 8017
A=A-1 // 8018
M=0 // 8019
// call Output.create
@17 // 8020
D=A // 8021
@14 // 8022
M=D // 8023
@Output.create // 8024
D=A // 8025
@13 // 8026
M=D // 8027
@Output.init.ret.44 // 8028
D=A // 8029
@CALL // 8030
0;JMP // 8031
(Output.init.ret.44)
@SP // 8032
M=M-1 // 8033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 8034
D=A // 8035
@SP // 8036
AM=M+1 // 8037
A=A-1 // 8038
M=D // 8039
@51 // 8040
D=A // 8041
@SP // 8042
AM=M+1 // 8043
A=A-1 // 8044
M=D // 8045
@51 // 8046
D=A // 8047
@SP // 8048
AM=M+1 // 8049
A=A-1 // 8050
M=D // 8051
@51 // 8052
D=A // 8053
@SP // 8054
AM=M+1 // 8055
A=A-1 // 8056
M=D // 8057
@27 // 8058
D=A // 8059
@SP // 8060
AM=M+1 // 8061
A=A-1 // 8062
M=D // 8063
@15 // 8064
D=A // 8065
@SP // 8066
AM=M+1 // 8067
A=A-1 // 8068
M=D // 8069
@27 // 8070
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
@51 // 8082
D=A // 8083
@SP // 8084
AM=M+1 // 8085
A=A-1 // 8086
M=D // 8087
@51 // 8088
D=A // 8089
@SP // 8090
AM=M+1 // 8091
A=A-1 // 8092
M=D // 8093
@SP // 8094
AM=M+1 // 8095
A=A-1 // 8096
M=0 // 8097
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=0 // 8101
// call Output.create
@17 // 8102
D=A // 8103
@14 // 8104
M=D // 8105
@Output.create // 8106
D=A // 8107
@13 // 8108
M=D // 8109
@Output.init.ret.45 // 8110
D=A // 8111
@CALL // 8112
0;JMP // 8113
(Output.init.ret.45)
@SP // 8114
M=M-1 // 8115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 8116
D=A // 8117
@SP // 8118
AM=M+1 // 8119
A=A-1 // 8120
M=D // 8121
@3 // 8122
D=A // 8123
@SP // 8124
AM=M+1 // 8125
A=A-1 // 8126
M=D // 8127
@3 // 8128
D=A // 8129
@SP // 8130
AM=M+1 // 8131
A=A-1 // 8132
M=D // 8133
@3 // 8134
D=A // 8135
@SP // 8136
AM=M+1 // 8137
A=A-1 // 8138
M=D // 8139
@3 // 8140
D=A // 8141
@SP // 8142
AM=M+1 // 8143
A=A-1 // 8144
M=D // 8145
@3 // 8146
D=A // 8147
@SP // 8148
AM=M+1 // 8149
A=A-1 // 8150
M=D // 8151
@3 // 8152
D=A // 8153
@SP // 8154
AM=M+1 // 8155
A=A-1 // 8156
M=D // 8157
@35 // 8158
D=A // 8159
@SP // 8160
AM=M+1 // 8161
A=A-1 // 8162
M=D // 8163
@51 // 8164
D=A // 8165
@SP // 8166
AM=M+1 // 8167
A=A-1 // 8168
M=D // 8169
@63 // 8170
D=A // 8171
@SP // 8172
AM=M+1 // 8173
A=A-1 // 8174
M=D // 8175
@SP // 8176
AM=M+1 // 8177
A=A-1 // 8178
M=0 // 8179
@SP // 8180
AM=M+1 // 8181
A=A-1 // 8182
M=0 // 8183
// call Output.create
@17 // 8184
D=A // 8185
@14 // 8186
M=D // 8187
@Output.create // 8188
D=A // 8189
@13 // 8190
M=D // 8191
@Output.init.ret.46 // 8192
D=A // 8193
@CALL // 8194
0;JMP // 8195
(Output.init.ret.46)
@SP // 8196
M=M-1 // 8197

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 8198
D=A // 8199
@SP // 8200
AM=M+1 // 8201
A=A-1 // 8202
M=D // 8203
@33 // 8204
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
@63 // 8216
D=A // 8217
@SP // 8218
AM=M+1 // 8219
A=A-1 // 8220
M=D // 8221
@63 // 8222
D=A // 8223
@SP // 8224
AM=M+1 // 8225
A=A-1 // 8226
M=D // 8227
@51 // 8228
D=A // 8229
@SP // 8230
AM=M+1 // 8231
A=A-1 // 8232
M=D // 8233
@51 // 8234
D=A // 8235
@SP // 8236
AM=M+1 // 8237
A=A-1 // 8238
M=D // 8239
@51 // 8240
D=A // 8241
@SP // 8242
AM=M+1 // 8243
A=A-1 // 8244
M=D // 8245
@51 // 8246
D=A // 8247
@SP // 8248
AM=M+1 // 8249
A=A-1 // 8250
M=D // 8251
@51 // 8252
D=A // 8253
@SP // 8254
AM=M+1 // 8255
A=A-1 // 8256
M=D // 8257
@SP // 8258
AM=M+1 // 8259
A=A-1 // 8260
M=0 // 8261
@SP // 8262
AM=M+1 // 8263
A=A-1 // 8264
M=0 // 8265
// call Output.create
@17 // 8266
D=A // 8267
@14 // 8268
M=D // 8269
@Output.create // 8270
D=A // 8271
@13 // 8272
M=D // 8273
@Output.init.ret.47 // 8274
D=A // 8275
@CALL // 8276
0;JMP // 8277
(Output.init.ret.47)
@SP // 8278
M=M-1 // 8279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 8280
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
@55 // 8298
D=A // 8299
@SP // 8300
AM=M+1 // 8301
A=A-1 // 8302
M=D // 8303
@55 // 8304
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
@59 // 8322
D=A // 8323
@SP // 8324
AM=M+1 // 8325
A=A-1 // 8326
M=D // 8327
@51 // 8328
D=A // 8329
@SP // 8330
AM=M+1 // 8331
A=A-1 // 8332
M=D // 8333
@51 // 8334
D=A // 8335
@SP // 8336
AM=M+1 // 8337
A=A-1 // 8338
M=D // 8339
@SP // 8340
AM=M+1 // 8341
A=A-1 // 8342
M=0 // 8343
@SP // 8344
AM=M+1 // 8345
A=A-1 // 8346
M=0 // 8347
// call Output.create
@17 // 8348
D=A // 8349
@14 // 8350
M=D // 8351
@Output.create // 8352
D=A // 8353
@13 // 8354
M=D // 8355
@Output.init.ret.48 // 8356
D=A // 8357
@CALL // 8358
0;JMP // 8359
(Output.init.ret.48)
@SP // 8360
M=M-1 // 8361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 8362
D=A // 8363
@SP // 8364
AM=M+1 // 8365
A=A-1 // 8366
M=D // 8367
@30 // 8368
D=A // 8369
@SP // 8370
AM=M+1 // 8371
A=A-1 // 8372
M=D // 8373
@51 // 8374
D=A // 8375
@SP // 8376
AM=M+1 // 8377
A=A-1 // 8378
M=D // 8379
@51 // 8380
D=A // 8381
@SP // 8382
AM=M+1 // 8383
A=A-1 // 8384
M=D // 8385
@51 // 8386
D=A // 8387
@SP // 8388
AM=M+1 // 8389
A=A-1 // 8390
M=D // 8391
@51 // 8392
D=A // 8393
@SP // 8394
AM=M+1 // 8395
A=A-1 // 8396
M=D // 8397
@51 // 8398
D=A // 8399
@SP // 8400
AM=M+1 // 8401
A=A-1 // 8402
M=D // 8403
@51 // 8404
D=A // 8405
@SP // 8406
AM=M+1 // 8407
A=A-1 // 8408
M=D // 8409
@51 // 8410
D=A // 8411
@SP // 8412
AM=M+1 // 8413
A=A-1 // 8414
M=D // 8415
@30 // 8416
D=A // 8417
@SP // 8418
AM=M+1 // 8419
A=A-1 // 8420
M=D // 8421
@SP // 8422
AM=M+1 // 8423
A=A-1 // 8424
M=0 // 8425
@SP // 8426
AM=M+1 // 8427
A=A-1 // 8428
M=0 // 8429
// call Output.create
@17 // 8430
D=A // 8431
@14 // 8432
M=D // 8433
@Output.create // 8434
D=A // 8435
@13 // 8436
M=D // 8437
@Output.init.ret.49 // 8438
D=A // 8439
@CALL // 8440
0;JMP // 8441
(Output.init.ret.49)
@SP // 8442
M=M-1 // 8443

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 8444
D=A // 8445
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=D // 8449
@31 // 8450
D=A // 8451
@SP // 8452
AM=M+1 // 8453
A=A-1 // 8454
M=D // 8455
@51 // 8456
D=A // 8457
@SP // 8458
AM=M+1 // 8459
A=A-1 // 8460
M=D // 8461
@51 // 8462
D=A // 8463
@SP // 8464
AM=M+1 // 8465
A=A-1 // 8466
M=D // 8467
@51 // 8468
D=A // 8469
@SP // 8470
AM=M+1 // 8471
A=A-1 // 8472
M=D // 8473
@31 // 8474
D=A // 8475
@SP // 8476
AM=M+1 // 8477
A=A-1 // 8478
M=D // 8479
@3 // 8480
D=A // 8481
@SP // 8482
AM=M+1 // 8483
A=A-1 // 8484
M=D // 8485
@3 // 8486
D=A // 8487
@SP // 8488
AM=M+1 // 8489
A=A-1 // 8490
M=D // 8491
@3 // 8492
D=A // 8493
@SP // 8494
AM=M+1 // 8495
A=A-1 // 8496
M=D // 8497
@3 // 8498
D=A // 8499
@SP // 8500
AM=M+1 // 8501
A=A-1 // 8502
M=D // 8503
@SP // 8504
AM=M+1 // 8505
A=A-1 // 8506
M=0 // 8507
@SP // 8508
AM=M+1 // 8509
A=A-1 // 8510
M=0 // 8511
// call Output.create
@17 // 8512
D=A // 8513
@14 // 8514
M=D // 8515
@Output.create // 8516
D=A // 8517
@13 // 8518
M=D // 8519
@Output.init.ret.50 // 8520
D=A // 8521
@CALL // 8522
0;JMP // 8523
(Output.init.ret.50)
@SP // 8524
M=M-1 // 8525

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 8526
D=A // 8527
@SP // 8528
AM=M+1 // 8529
A=A-1 // 8530
M=D // 8531
@30 // 8532
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
@51 // 8544
D=A // 8545
@SP // 8546
AM=M+1 // 8547
A=A-1 // 8548
M=D // 8549
@51 // 8550
D=A // 8551
@SP // 8552
AM=M+1 // 8553
A=A-1 // 8554
M=D // 8555
@51 // 8556
D=A // 8557
@SP // 8558
AM=M+1 // 8559
A=A-1 // 8560
M=D // 8561
@51 // 8562
D=A // 8563
@SP // 8564
AM=M+1 // 8565
A=A-1 // 8566
M=D // 8567
@63 // 8568
D=A // 8569
@SP // 8570
AM=M+1 // 8571
A=A-1 // 8572
M=D // 8573
@59 // 8574
D=A // 8575
@SP // 8576
AM=M+1 // 8577
A=A-1 // 8578
M=D // 8579
@30 // 8580
D=A // 8581
@SP // 8582
AM=M+1 // 8583
A=A-1 // 8584
M=D // 8585
@48 // 8586
D=A // 8587
@SP // 8588
AM=M+1 // 8589
A=A-1 // 8590
M=D // 8591
@SP // 8592
AM=M+1 // 8593
A=A-1 // 8594
M=0 // 8595
// call Output.create
@17 // 8596
D=A // 8597
@14 // 8598
M=D // 8599
@Output.create // 8600
D=A // 8601
@13 // 8602
M=D // 8603
@Output.init.ret.51 // 8604
D=A // 8605
@CALL // 8606
0;JMP // 8607
(Output.init.ret.51)
@SP // 8608
M=M-1 // 8609

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8610
D=A // 8611
@SP // 8612
AM=M+1 // 8613
A=A-1 // 8614
M=D // 8615
@31 // 8616
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
@31 // 8640
D=A // 8641
@SP // 8642
AM=M+1 // 8643
A=A-1 // 8644
M=D // 8645
@27 // 8646
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
@51 // 8664
D=A // 8665
@SP // 8666
AM=M+1 // 8667
A=A-1 // 8668
M=D // 8669
@SP // 8670
AM=M+1 // 8671
A=A-1 // 8672
M=0 // 8673
@SP // 8674
AM=M+1 // 8675
A=A-1 // 8676
M=0 // 8677
// call Output.create
@17 // 8678
D=A // 8679
@14 // 8680
M=D // 8681
@Output.create // 8682
D=A // 8683
@13 // 8684
M=D // 8685
@Output.init.ret.52 // 8686
D=A // 8687
@CALL // 8688
0;JMP // 8689
(Output.init.ret.52)
@SP // 8690
M=M-1 // 8691

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8692
D=A // 8693
@SP // 8694
AM=M+1 // 8695
A=A-1 // 8696
M=D // 8697
@30 // 8698
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
@6 // 8716
D=A // 8717
@SP // 8718
AM=M+1 // 8719
A=A-1 // 8720
M=D // 8721
@28 // 8722
D=A // 8723
@SP // 8724
AM=M+1 // 8725
A=A-1 // 8726
M=D // 8727
@48 // 8728
D=A // 8729
@SP // 8730
AM=M+1 // 8731
A=A-1 // 8732
M=D // 8733
@51 // 8734
D=A // 8735
@SP // 8736
AM=M+1 // 8737
A=A-1 // 8738
M=D // 8739
@51 // 8740
D=A // 8741
@SP // 8742
AM=M+1 // 8743
A=A-1 // 8744
M=D // 8745
@30 // 8746
D=A // 8747
@SP // 8748
AM=M+1 // 8749
A=A-1 // 8750
M=D // 8751
@SP // 8752
AM=M+1 // 8753
A=A-1 // 8754
M=0 // 8755
@SP // 8756
AM=M+1 // 8757
A=A-1 // 8758
M=0 // 8759
// call Output.create
@17 // 8760
D=A // 8761
@14 // 8762
M=D // 8763
@Output.create // 8764
D=A // 8765
@13 // 8766
M=D // 8767
@Output.init.ret.53 // 8768
D=A // 8769
@CALL // 8770
0;JMP // 8771
(Output.init.ret.53)
@SP // 8772
M=M-1 // 8773

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8774
D=A // 8775
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=D // 8779
@63 // 8780
D=A // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=D // 8785
@63 // 8786
D=A // 8787
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=D // 8791
@45 // 8792
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
@12 // 8804
D=A // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=D // 8809
@12 // 8810
D=A // 8811
@SP // 8812
AM=M+1 // 8813
A=A-1 // 8814
M=D // 8815
@12 // 8816
D=A // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=D // 8821
@12 // 8822
D=A // 8823
@SP // 8824
AM=M+1 // 8825
A=A-1 // 8826
M=D // 8827
@30 // 8828
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
@Output.init.ret.54 // 8850
D=A // 8851
@CALL // 8852
0;JMP // 8853
(Output.init.ret.54)
@SP // 8854
M=M-1 // 8855

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8856
D=A // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=D // 8861
@51 // 8862
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
@51 // 8886
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
@51 // 8904
D=A // 8905
@SP // 8906
AM=M+1 // 8907
A=A-1 // 8908
M=D // 8909
@30 // 8910
D=A // 8911
@SP // 8912
AM=M+1 // 8913
A=A-1 // 8914
M=D // 8915
@SP // 8916
AM=M+1 // 8917
A=A-1 // 8918
M=0 // 8919
@SP // 8920
AM=M+1 // 8921
A=A-1 // 8922
M=0 // 8923
// call Output.create
@17 // 8924
D=A // 8925
@14 // 8926
M=D // 8927
@Output.create // 8928
D=A // 8929
@13 // 8930
M=D // 8931
@Output.init.ret.55 // 8932
D=A // 8933
@CALL // 8934
0;JMP // 8935
(Output.init.ret.55)
@SP // 8936
M=M-1 // 8937

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8938
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
@51 // 8956
D=A // 8957
@SP // 8958
AM=M+1 // 8959
A=A-1 // 8960
M=D // 8961
@51 // 8962
D=A // 8963
@SP // 8964
AM=M+1 // 8965
A=A-1 // 8966
M=D // 8967
@51 // 8968
D=A // 8969
@SP // 8970
AM=M+1 // 8971
A=A-1 // 8972
M=D // 8973
@30 // 8974
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
@12 // 8986
D=A // 8987
@SP // 8988
AM=M+1 // 8989
A=A-1 // 8990
M=D // 8991
@12 // 8992
D=A // 8993
@SP // 8994
AM=M+1 // 8995
A=A-1 // 8996
M=D // 8997
@SP // 8998
AM=M+1 // 8999
A=A-1 // 9000
M=0 // 9001
@SP // 9002
AM=M+1 // 9003
A=A-1 // 9004
M=0 // 9005
// call Output.create
@17 // 9006
D=A // 9007
@14 // 9008
M=D // 9009
@Output.create // 9010
D=A // 9011
@13 // 9012
M=D // 9013
@Output.init.ret.56 // 9014
D=A // 9015
@CALL // 9016
0;JMP // 9017
(Output.init.ret.56)
@SP // 9018
M=M-1 // 9019

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 9020
D=A // 9021
@SP // 9022
AM=M+1 // 9023
A=A-1 // 9024
M=D // 9025
@51 // 9026
D=A // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=D // 9031
@51 // 9032
D=A // 9033
@SP // 9034
AM=M+1 // 9035
A=A-1 // 9036
M=D // 9037
@51 // 9038
D=A // 9039
@SP // 9040
AM=M+1 // 9041
A=A-1 // 9042
M=D // 9043
@51 // 9044
D=A // 9045
@SP // 9046
AM=M+1 // 9047
A=A-1 // 9048
M=D // 9049
@51 // 9050
D=A // 9051
@SP // 9052
AM=M+1 // 9053
A=A-1 // 9054
M=D // 9055
@63 // 9056
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
@63 // 9068
D=A // 9069
@SP // 9070
AM=M+1 // 9071
A=A-1 // 9072
M=D // 9073
@18 // 9074
D=A // 9075
@SP // 9076
AM=M+1 // 9077
A=A-1 // 9078
M=D // 9079
@SP // 9080
AM=M+1 // 9081
A=A-1 // 9082
M=0 // 9083
@SP // 9084
AM=M+1 // 9085
A=A-1 // 9086
M=0 // 9087
// call Output.create
@17 // 9088
D=A // 9089
@14 // 9090
M=D // 9091
@Output.create // 9092
D=A // 9093
@13 // 9094
M=D // 9095
@Output.init.ret.57 // 9096
D=A // 9097
@CALL // 9098
0;JMP // 9099
(Output.init.ret.57)
@SP // 9100
M=M-1 // 9101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 9102
D=A // 9103
@SP // 9104
AM=M+1 // 9105
A=A-1 // 9106
M=D // 9107
@51 // 9108
D=A // 9109
@SP // 9110
AM=M+1 // 9111
A=A-1 // 9112
M=D // 9113
@51 // 9114
D=A // 9115
@SP // 9116
AM=M+1 // 9117
A=A-1 // 9118
M=D // 9119
@30 // 9120
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
@12 // 9132
D=A // 9133
@SP // 9134
AM=M+1 // 9135
A=A-1 // 9136
M=D // 9137
@30 // 9138
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
@51 // 9150
D=A // 9151
@SP // 9152
AM=M+1 // 9153
A=A-1 // 9154
M=D // 9155
@51 // 9156
D=A // 9157
@SP // 9158
AM=M+1 // 9159
A=A-1 // 9160
M=D // 9161
@SP // 9162
AM=M+1 // 9163
A=A-1 // 9164
M=0 // 9165
@SP // 9166
AM=M+1 // 9167
A=A-1 // 9168
M=0 // 9169
// call Output.create
@17 // 9170
D=A // 9171
@14 // 9172
M=D // 9173
@Output.create // 9174
D=A // 9175
@13 // 9176
M=D // 9177
@Output.init.ret.58 // 9178
D=A // 9179
@CALL // 9180
0;JMP // 9181
(Output.init.ret.58)
@SP // 9182
M=M-1 // 9183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 9184
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
@51 // 9202
D=A // 9203
@SP // 9204
AM=M+1 // 9205
A=A-1 // 9206
M=D // 9207
@51 // 9208
D=A // 9209
@SP // 9210
AM=M+1 // 9211
A=A-1 // 9212
M=D // 9213
@30 // 9214
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
@12 // 9226
D=A // 9227
@SP // 9228
AM=M+1 // 9229
A=A-1 // 9230
M=D // 9231
@12 // 9232
D=A // 9233
@SP // 9234
AM=M+1 // 9235
A=A-1 // 9236
M=D // 9237
@30 // 9238
D=A // 9239
@SP // 9240
AM=M+1 // 9241
A=A-1 // 9242
M=D // 9243
@SP // 9244
AM=M+1 // 9245
A=A-1 // 9246
M=0 // 9247
@SP // 9248
AM=M+1 // 9249
A=A-1 // 9250
M=0 // 9251
// call Output.create
@17 // 9252
D=A // 9253
@14 // 9254
M=D // 9255
@Output.create // 9256
D=A // 9257
@13 // 9258
M=D // 9259
@Output.init.ret.59 // 9260
D=A // 9261
@CALL // 9262
0;JMP // 9263
(Output.init.ret.59)
@SP // 9264
M=M-1 // 9265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 9266
D=A // 9267
@SP // 9268
AM=M+1 // 9269
A=A-1 // 9270
M=D // 9271
@63 // 9272
D=A // 9273
@SP // 9274
AM=M+1 // 9275
A=A-1 // 9276
M=D // 9277
@51 // 9278
D=A // 9279
@SP // 9280
AM=M+1 // 9281
A=A-1 // 9282
M=D // 9283
@49 // 9284
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
@12 // 9296
D=A // 9297
@SP // 9298
AM=M+1 // 9299
A=A-1 // 9300
M=D // 9301
@6 // 9302
D=A // 9303
@SP // 9304
AM=M+1 // 9305
A=A-1 // 9306
M=D // 9307
@35 // 9308
D=A // 9309
@SP // 9310
AM=M+1 // 9311
A=A-1 // 9312
M=D // 9313
@51 // 9314
D=A // 9315
@SP // 9316
AM=M+1 // 9317
A=A-1 // 9318
M=D // 9319
@63 // 9320
D=A // 9321
@SP // 9322
AM=M+1 // 9323
A=A-1 // 9324
M=D // 9325
@SP // 9326
AM=M+1 // 9327
A=A-1 // 9328
M=0 // 9329
@SP // 9330
AM=M+1 // 9331
A=A-1 // 9332
M=0 // 9333
// call Output.create
@17 // 9334
D=A // 9335
@14 // 9336
M=D // 9337
@Output.create // 9338
D=A // 9339
@13 // 9340
M=D // 9341
@Output.init.ret.60 // 9342
D=A // 9343
@CALL // 9344
0;JMP // 9345
(Output.init.ret.60)
@SP // 9346
M=M-1 // 9347

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 9348
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
@6 // 9360
D=A // 9361
@SP // 9362
AM=M+1 // 9363
A=A-1 // 9364
M=D // 9365
@6 // 9366
D=A // 9367
@SP // 9368
AM=M+1 // 9369
A=A-1 // 9370
M=D // 9371
@6 // 9372
D=A // 9373
@SP // 9374
AM=M+1 // 9375
A=A-1 // 9376
M=D // 9377
@6 // 9378
D=A // 9379
@SP // 9380
AM=M+1 // 9381
A=A-1 // 9382
M=D // 9383
@6 // 9384
D=A // 9385
@SP // 9386
AM=M+1 // 9387
A=A-1 // 9388
M=D // 9389
@6 // 9390
D=A // 9391
@SP // 9392
AM=M+1 // 9393
A=A-1 // 9394
M=D // 9395
@6 // 9396
D=A // 9397
@SP // 9398
AM=M+1 // 9399
A=A-1 // 9400
M=D // 9401
@30 // 9402
D=A // 9403
@SP // 9404
AM=M+1 // 9405
A=A-1 // 9406
M=D // 9407
@SP // 9408
AM=M+1 // 9409
A=A-1 // 9410
M=0 // 9411
@SP // 9412
AM=M+1 // 9413
A=A-1 // 9414
M=0 // 9415
// call Output.create
@17 // 9416
D=A // 9417
@14 // 9418
M=D // 9419
@Output.create // 9420
D=A // 9421
@13 // 9422
M=D // 9423
@Output.init.ret.61 // 9424
D=A // 9425
@CALL // 9426
0;JMP // 9427
(Output.init.ret.61)
@SP // 9428
M=M-1 // 9429

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9430
D=A // 9431
@SP // 9432
M=D+M // 9433
@92 // 9434
D=A // 9435
@SP // 9436
A=M-1 // 9437
M=1 // 9438
A=A-1 // 9439
M=0 // 9440
A=A-1 // 9441
M=0 // 9442
A=A-1 // 9443
M=D // 9444
A=A-1 // 9445
@3 // 9446
D=A // 9447
@SP // 9448
AM=M+1 // 9449
A=A-1 // 9450
M=D // 9451
@6 // 9452
D=A // 9453
@SP // 9454
AM=M+1 // 9455
A=A-1 // 9456
M=D // 9457
@12 // 9458
D=A // 9459
@SP // 9460
AM=M+1 // 9461
A=A-1 // 9462
M=D // 9463
@24 // 9464
D=A // 9465
@SP // 9466
AM=M+1 // 9467
A=A-1 // 9468
M=D // 9469
@48 // 9470
D=A // 9471
@SP // 9472
AM=M+1 // 9473
A=A-1 // 9474
M=D // 9475
@32 // 9476
D=A // 9477
@SP // 9478
AM=M+1 // 9479
A=A-1 // 9480
M=D // 9481
@SP // 9482
AM=M+1 // 9483
A=A-1 // 9484
M=0 // 9485
@SP // 9486
AM=M+1 // 9487
A=A-1 // 9488
M=0 // 9489
// call Output.create
@17 // 9490
D=A // 9491
@14 // 9492
M=D // 9493
@Output.create // 9494
D=A // 9495
@13 // 9496
M=D // 9497
@Output.init.ret.62 // 9498
D=A // 9499
@CALL // 9500
0;JMP // 9501
(Output.init.ret.62)
@SP // 9502
M=M-1 // 9503

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 9504
D=A // 9505
@SP // 9506
AM=M+1 // 9507
A=A-1 // 9508
M=D // 9509
@30 // 9510
D=A // 9511
@SP // 9512
AM=M+1 // 9513
A=A-1 // 9514
M=D // 9515
@24 // 9516
D=A // 9517
@SP // 9518
AM=M+1 // 9519
A=A-1 // 9520
M=D // 9521
@24 // 9522
D=A // 9523
@SP // 9524
AM=M+1 // 9525
A=A-1 // 9526
M=D // 9527
@24 // 9528
D=A // 9529
@SP // 9530
AM=M+1 // 9531
A=A-1 // 9532
M=D // 9533
@24 // 9534
D=A // 9535
@SP // 9536
AM=M+1 // 9537
A=A-1 // 9538
M=D // 9539
@24 // 9540
D=A // 9541
@SP // 9542
AM=M+1 // 9543
A=A-1 // 9544
M=D // 9545
@24 // 9546
D=A // 9547
@SP // 9548
AM=M+1 // 9549
A=A-1 // 9550
M=D // 9551
@24 // 9552
D=A // 9553
@SP // 9554
AM=M+1 // 9555
A=A-1 // 9556
M=D // 9557
@30 // 9558
D=A // 9559
@SP // 9560
AM=M+1 // 9561
A=A-1 // 9562
M=D // 9563
@SP // 9564
AM=M+1 // 9565
A=A-1 // 9566
M=0 // 9567
@SP // 9568
AM=M+1 // 9569
A=A-1 // 9570
M=0 // 9571
// call Output.create
@17 // 9572
D=A // 9573
@14 // 9574
M=D // 9575
@Output.create // 9576
D=A // 9577
@13 // 9578
M=D // 9579
@Output.init.ret.63 // 9580
D=A // 9581
@CALL // 9582
0;JMP // 9583
(Output.init.ret.63)
@SP // 9584
M=M-1 // 9585

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 9586
D=A // 9587
@SP // 9588
AM=M+1 // 9589
A=A-1 // 9590
M=D // 9591
@8 // 9592
D=A // 9593
@SP // 9594
AM=M+1 // 9595
A=A-1 // 9596
M=D // 9597
@28 // 9598
D=A // 9599
@SP // 9600
AM=M+1 // 9601
A=A-1 // 9602
M=D // 9603
@54 // 9604
D=A // 9605
@SP // 9606
AM=M+1 // 9607
A=A-1 // 9608
M=D // 9609
@SP // 9610
AM=M+1 // 9611
A=A-1 // 9612
M=0 // 9613
@SP // 9614
AM=M+1 // 9615
A=A-1 // 9616
M=0 // 9617
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
// call Output.create
@17 // 9642
D=A // 9643
@14 // 9644
M=D // 9645
@Output.create // 9646
D=A // 9647
@13 // 9648
M=D // 9649
@Output.init.ret.64 // 9650
D=A // 9651
@CALL // 9652
0;JMP // 9653
(Output.init.ret.64)
@SP // 9654
M=M-1 // 9655

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9656
D=A // 9657
@SP // 9658
M=D+M // 9659
@95 // 9660
D=A // 9661
@SP // 9662
A=M-1 // 9663
M=0 // 9664
A=A-1 // 9665
M=0 // 9666
A=A-1 // 9667
M=0 // 9668
A=A-1 // 9669
M=0 // 9670
A=A-1 // 9671
M=0 // 9672
A=A-1 // 9673
M=0 // 9674
A=A-1 // 9675
M=0 // 9676
A=A-1 // 9677
M=0 // 9678
A=A-1 // 9679
M=0 // 9680
A=A-1 // 9681
M=D // 9682
A=A-1 // 9683
@2 // 9684
D=A // 9685
@SP // 9686
M=D+M // 9687
@63 // 9688
D=A // 9689
@SP // 9690
A=M-1 // 9691
M=0 // 9692
A=A-1 // 9693
M=D // 9694
A=A-1 // 9695
// call Output.create
@17 // 9696
D=A // 9697
@14 // 9698
M=D // 9699
@Output.create // 9700
D=A // 9701
@13 // 9702
M=D // 9703
@Output.init.ret.65 // 9704
D=A // 9705
@CALL // 9706
0;JMP // 9707
(Output.init.ret.65)
@SP // 9708
M=M-1 // 9709

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9710
D=A // 9711
@SP // 9712
AM=M+1 // 9713
A=A-1 // 9714
M=D // 9715
@6 // 9716
D=A // 9717
@SP // 9718
AM=M+1 // 9719
A=A-1 // 9720
M=D // 9721
@12 // 9722
D=A // 9723
@SP // 9724
AM=M+1 // 9725
A=A-1 // 9726
M=D // 9727
@24 // 9728
D=A // 9729
@SP // 9730
AM=M+1 // 9731
A=A-1 // 9732
M=D // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=0 // 9737
@SP // 9738
AM=M+1 // 9739
A=A-1 // 9740
M=0 // 9741
@SP // 9742
AM=M+1 // 9743
A=A-1 // 9744
M=0 // 9745
@SP // 9746
AM=M+1 // 9747
A=A-1 // 9748
M=0 // 9749
@SP // 9750
AM=M+1 // 9751
A=A-1 // 9752
M=0 // 9753
@SP // 9754
AM=M+1 // 9755
A=A-1 // 9756
M=0 // 9757
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
@Output.init.ret.66 // 9774
D=A // 9775
@CALL // 9776
0;JMP // 9777
(Output.init.ret.66)
@SP // 9778
M=M-1 // 9779

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9780
D=A // 9781
@SP // 9782
M=D+M // 9783
@97 // 9784
D=A // 9785
@SP // 9786
A=M-1 // 9787
M=0 // 9788
A=A-1 // 9789
M=0 // 9790
A=A-1 // 9791
M=0 // 9792
A=A-1 // 9793
M=D // 9794
A=A-1 // 9795
@14 // 9796
D=A // 9797
@SP // 9798
AM=M+1 // 9799
A=A-1 // 9800
M=D // 9801
@24 // 9802
D=A // 9803
@SP // 9804
AM=M+1 // 9805
A=A-1 // 9806
M=D // 9807
@30 // 9808
D=A // 9809
@SP // 9810
AM=M+1 // 9811
A=A-1 // 9812
M=D // 9813
@27 // 9814
D=A // 9815
@SP // 9816
AM=M+1 // 9817
A=A-1 // 9818
M=D // 9819
@27 // 9820
D=A // 9821
@SP // 9822
AM=M+1 // 9823
A=A-1 // 9824
M=D // 9825
@54 // 9826
D=A // 9827
@SP // 9828
AM=M+1 // 9829
A=A-1 // 9830
M=D // 9831
@SP // 9832
AM=M+1 // 9833
A=A-1 // 9834
M=0 // 9835
@SP // 9836
AM=M+1 // 9837
A=A-1 // 9838
M=0 // 9839
// call Output.create
@17 // 9840
D=A // 9841
@14 // 9842
M=D // 9843
@Output.create // 9844
D=A // 9845
@13 // 9846
M=D // 9847
@Output.init.ret.67 // 9848
D=A // 9849
@CALL // 9850
0;JMP // 9851
(Output.init.ret.67)
@SP // 9852
M=M-1 // 9853

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9854
D=A // 9855
@SP // 9856
AM=M+1 // 9857
A=A-1 // 9858
M=D // 9859
@3 // 9860
D=A // 9861
@SP // 9862
AM=M+1 // 9863
A=A-1 // 9864
M=D // 9865
@3 // 9866
D=A // 9867
@SP // 9868
AM=M+1 // 9869
A=A-1 // 9870
M=D // 9871
@3 // 9872
D=A // 9873
@SP // 9874
AM=M+1 // 9875
A=A-1 // 9876
M=D // 9877
@15 // 9878
D=A // 9879
@SP // 9880
AM=M+1 // 9881
A=A-1 // 9882
M=D // 9883
@27 // 9884
D=A // 9885
@SP // 9886
AM=M+1 // 9887
A=A-1 // 9888
M=D // 9889
@51 // 9890
D=A // 9891
@SP // 9892
AM=M+1 // 9893
A=A-1 // 9894
M=D // 9895
@51 // 9896
D=A // 9897
@SP // 9898
AM=M+1 // 9899
A=A-1 // 9900
M=D // 9901
@51 // 9902
D=A // 9903
@SP // 9904
AM=M+1 // 9905
A=A-1 // 9906
M=D // 9907
@30 // 9908
D=A // 9909
@SP // 9910
AM=M+1 // 9911
A=A-1 // 9912
M=D // 9913
@SP // 9914
AM=M+1 // 9915
A=A-1 // 9916
M=0 // 9917
@SP // 9918
AM=M+1 // 9919
A=A-1 // 9920
M=0 // 9921
// call Output.create
@17 // 9922
D=A // 9923
@14 // 9924
M=D // 9925
@Output.create // 9926
D=A // 9927
@13 // 9928
M=D // 9929
@Output.init.ret.68 // 9930
D=A // 9931
@CALL // 9932
0;JMP // 9933
(Output.init.ret.68)
@SP // 9934
M=M-1 // 9935

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9936
D=A // 9937
@SP // 9938
M=D+M // 9939
@99 // 9940
D=A // 9941
@SP // 9942
A=M-1 // 9943
M=0 // 9944
A=A-1 // 9945
M=0 // 9946
A=A-1 // 9947
M=0 // 9948
A=A-1 // 9949
M=D // 9950
A=A-1 // 9951
@30 // 9952
D=A // 9953
@SP // 9954
AM=M+1 // 9955
A=A-1 // 9956
M=D // 9957
@51 // 9958
D=A // 9959
@SP // 9960
AM=M+1 // 9961
A=A-1 // 9962
M=D // 9963
@3 // 9964
D=A // 9965
@SP // 9966
AM=M+1 // 9967
A=A-1 // 9968
M=D // 9969
@3 // 9970
D=A // 9971
@SP // 9972
AM=M+1 // 9973
A=A-1 // 9974
M=D // 9975
@51 // 9976
D=A // 9977
@SP // 9978
AM=M+1 // 9979
A=A-1 // 9980
M=D // 9981
@30 // 9982
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
@Output.init.ret.69 // 10004
D=A // 10005
@CALL // 10006
0;JMP // 10007
(Output.init.ret.69)
@SP // 10008
M=M-1 // 10009

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 10010
D=A // 10011
@SP // 10012
AM=M+1 // 10013
A=A-1 // 10014
M=D // 10015
@48 // 10016
D=A // 10017
@SP // 10018
AM=M+1 // 10019
A=A-1 // 10020
M=D // 10021
@48 // 10022
D=A // 10023
@SP // 10024
AM=M+1 // 10025
A=A-1 // 10026
M=D // 10027
@48 // 10028
D=A // 10029
@SP // 10030
AM=M+1 // 10031
A=A-1 // 10032
M=D // 10033
@60 // 10034
D=A // 10035
@SP // 10036
AM=M+1 // 10037
A=A-1 // 10038
M=D // 10039
@54 // 10040
D=A // 10041
@SP // 10042
AM=M+1 // 10043
A=A-1 // 10044
M=D // 10045
@51 // 10046
D=A // 10047
@SP // 10048
AM=M+1 // 10049
A=A-1 // 10050
M=D // 10051
@51 // 10052
D=A // 10053
@SP // 10054
AM=M+1 // 10055
A=A-1 // 10056
M=D // 10057
@51 // 10058
D=A // 10059
@SP // 10060
AM=M+1 // 10061
A=A-1 // 10062
M=D // 10063
@30 // 10064
D=A // 10065
@SP // 10066
AM=M+1 // 10067
A=A-1 // 10068
M=D // 10069
@SP // 10070
AM=M+1 // 10071
A=A-1 // 10072
M=0 // 10073
@SP // 10074
AM=M+1 // 10075
A=A-1 // 10076
M=0 // 10077
// call Output.create
@17 // 10078
D=A // 10079
@14 // 10080
M=D // 10081
@Output.create // 10082
D=A // 10083
@13 // 10084
M=D // 10085
@Output.init.ret.70 // 10086
D=A // 10087
@CALL // 10088
0;JMP // 10089
(Output.init.ret.70)
@SP // 10090
M=M-1 // 10091

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10092
D=A // 10093
@SP // 10094
M=D+M // 10095
@101 // 10096
D=A // 10097
@SP // 10098
A=M-1 // 10099
M=0 // 10100
A=A-1 // 10101
M=0 // 10102
A=A-1 // 10103
M=0 // 10104
A=A-1 // 10105
M=D // 10106
A=A-1 // 10107
@30 // 10108
D=A // 10109
@SP // 10110
AM=M+1 // 10111
A=A-1 // 10112
M=D // 10113
@51 // 10114
D=A // 10115
@SP // 10116
AM=M+1 // 10117
A=A-1 // 10118
M=D // 10119
@63 // 10120
D=A // 10121
@SP // 10122
AM=M+1 // 10123
A=A-1 // 10124
M=D // 10125
@3 // 10126
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
@30 // 10138
D=A // 10139
@SP // 10140
AM=M+1 // 10141
A=A-1 // 10142
M=D // 10143
@SP // 10144
AM=M+1 // 10145
A=A-1 // 10146
M=0 // 10147
@SP // 10148
AM=M+1 // 10149
A=A-1 // 10150
M=0 // 10151
// call Output.create
@17 // 10152
D=A // 10153
@14 // 10154
M=D // 10155
@Output.create // 10156
D=A // 10157
@13 // 10158
M=D // 10159
@Output.init.ret.71 // 10160
D=A // 10161
@CALL // 10162
0;JMP // 10163
(Output.init.ret.71)
@SP // 10164
M=M-1 // 10165

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 10166
D=A // 10167
@SP // 10168
AM=M+1 // 10169
A=A-1 // 10170
M=D // 10171
@28 // 10172
D=A // 10173
@SP // 10174
AM=M+1 // 10175
A=A-1 // 10176
M=D // 10177
@54 // 10178
D=A // 10179
@SP // 10180
AM=M+1 // 10181
A=A-1 // 10182
M=D // 10183
@38 // 10184
D=A // 10185
@SP // 10186
AM=M+1 // 10187
A=A-1 // 10188
M=D // 10189
@6 // 10190
D=A // 10191
@SP // 10192
AM=M+1 // 10193
A=A-1 // 10194
M=D // 10195
@15 // 10196
D=A // 10197
@SP // 10198
AM=M+1 // 10199
A=A-1 // 10200
M=D // 10201
@6 // 10202
D=A // 10203
@SP // 10204
AM=M+1 // 10205
A=A-1 // 10206
M=D // 10207
@6 // 10208
D=A // 10209
@SP // 10210
AM=M+1 // 10211
A=A-1 // 10212
M=D // 10213
@6 // 10214
D=A // 10215
@SP // 10216
AM=M+1 // 10217
A=A-1 // 10218
M=D // 10219
@15 // 10220
D=A // 10221
@SP // 10222
AM=M+1 // 10223
A=A-1 // 10224
M=D // 10225
@SP // 10226
AM=M+1 // 10227
A=A-1 // 10228
M=0 // 10229
@SP // 10230
AM=M+1 // 10231
A=A-1 // 10232
M=0 // 10233
// call Output.create
@17 // 10234
D=A // 10235
@14 // 10236
M=D // 10237
@Output.create // 10238
D=A // 10239
@13 // 10240
M=D // 10241
@Output.init.ret.72 // 10242
D=A // 10243
@CALL // 10244
0;JMP // 10245
(Output.init.ret.72)
@SP // 10246
M=M-1 // 10247

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 10248
D=A // 10249
@SP // 10250
M=D+M // 10251
@103 // 10252
D=A // 10253
@SP // 10254
A=M-1 // 10255
M=0 // 10256
A=A-1 // 10257
M=0 // 10258
A=A-1 // 10259
M=D // 10260
A=A-1 // 10261
@30 // 10262
D=A // 10263
@SP // 10264
AM=M+1 // 10265
A=A-1 // 10266
M=D // 10267
@51 // 10268
D=A // 10269
@SP // 10270
AM=M+1 // 10271
A=A-1 // 10272
M=D // 10273
@51 // 10274
D=A // 10275
@SP // 10276
AM=M+1 // 10277
A=A-1 // 10278
M=D // 10279
@51 // 10280
D=A // 10281
@SP // 10282
AM=M+1 // 10283
A=A-1 // 10284
M=D // 10285
@62 // 10286
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
@51 // 10298
D=A // 10299
@SP // 10300
AM=M+1 // 10301
A=A-1 // 10302
M=D // 10303
@30 // 10304
D=A // 10305
@SP // 10306
AM=M+1 // 10307
A=A-1 // 10308
M=D // 10309
@SP // 10310
AM=M+1 // 10311
A=A-1 // 10312
M=0 // 10313
// call Output.create
@17 // 10314
D=A // 10315
@14 // 10316
M=D // 10317
@Output.create // 10318
D=A // 10319
@13 // 10320
M=D // 10321
@Output.init.ret.73 // 10322
D=A // 10323
@CALL // 10324
0;JMP // 10325
(Output.init.ret.73)
@SP // 10326
M=M-1 // 10327

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 10328
D=A // 10329
@SP // 10330
AM=M+1 // 10331
A=A-1 // 10332
M=D // 10333
@3 // 10334
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
@27 // 10352
D=A // 10353
@SP // 10354
AM=M+1 // 10355
A=A-1 // 10356
M=D // 10357
@55 // 10358
D=A // 10359
@SP // 10360
AM=M+1 // 10361
A=A-1 // 10362
M=D // 10363
@51 // 10364
D=A // 10365
@SP // 10366
AM=M+1 // 10367
A=A-1 // 10368
M=D // 10369
@51 // 10370
D=A // 10371
@SP // 10372
AM=M+1 // 10373
A=A-1 // 10374
M=D // 10375
@51 // 10376
D=A // 10377
@SP // 10378
AM=M+1 // 10379
A=A-1 // 10380
M=D // 10381
@51 // 10382
D=A // 10383
@SP // 10384
AM=M+1 // 10385
A=A-1 // 10386
M=D // 10387
@SP // 10388
AM=M+1 // 10389
A=A-1 // 10390
M=0 // 10391
@SP // 10392
AM=M+1 // 10393
A=A-1 // 10394
M=0 // 10395
// call Output.create
@17 // 10396
D=A // 10397
@14 // 10398
M=D // 10399
@Output.create // 10400
D=A // 10401
@13 // 10402
M=D // 10403
@Output.init.ret.74 // 10404
D=A // 10405
@CALL // 10406
0;JMP // 10407
(Output.init.ret.74)
@SP // 10408
M=M-1 // 10409

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 10410
D=A // 10411
@SP // 10412
AM=M+1 // 10413
A=A-1 // 10414
M=D // 10415
@12 // 10416
D=A // 10417
@SP // 10418
AM=M+1 // 10419
A=A-1 // 10420
M=D // 10421
@12 // 10422
D=A // 10423
@SP // 10424
AM=M+1 // 10425
A=A-1 // 10426
M=D // 10427
@SP // 10428
AM=M+1 // 10429
A=A-1 // 10430
M=0 // 10431
@14 // 10432
D=A // 10433
@SP // 10434
AM=M+1 // 10435
A=A-1 // 10436
M=D // 10437
@12 // 10438
D=A // 10439
@SP // 10440
AM=M+1 // 10441
A=A-1 // 10442
M=D // 10443
@12 // 10444
D=A // 10445
@SP // 10446
AM=M+1 // 10447
A=A-1 // 10448
M=D // 10449
@12 // 10450
D=A // 10451
@SP // 10452
AM=M+1 // 10453
A=A-1 // 10454
M=D // 10455
@12 // 10456
D=A // 10457
@SP // 10458
AM=M+1 // 10459
A=A-1 // 10460
M=D // 10461
@30 // 10462
D=A // 10463
@SP // 10464
AM=M+1 // 10465
A=A-1 // 10466
M=D // 10467
@SP // 10468
AM=M+1 // 10469
A=A-1 // 10470
M=0 // 10471
@SP // 10472
AM=M+1 // 10473
A=A-1 // 10474
M=0 // 10475
// call Output.create
@17 // 10476
D=A // 10477
@14 // 10478
M=D // 10479
@Output.create // 10480
D=A // 10481
@13 // 10482
M=D // 10483
@Output.init.ret.75 // 10484
D=A // 10485
@CALL // 10486
0;JMP // 10487
(Output.init.ret.75)
@SP // 10488
M=M-1 // 10489

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 10490
D=A // 10491
@SP // 10492
AM=M+1 // 10493
A=A-1 // 10494
M=D // 10495
@48 // 10496
D=A // 10497
@SP // 10498
AM=M+1 // 10499
A=A-1 // 10500
M=D // 10501
@48 // 10502
D=A // 10503
@SP // 10504
AM=M+1 // 10505
A=A-1 // 10506
M=D // 10507
@SP // 10508
AM=M+1 // 10509
A=A-1 // 10510
M=0 // 10511
@56 // 10512
D=A // 10513
@SP // 10514
AM=M+1 // 10515
A=A-1 // 10516
M=D // 10517
@48 // 10518
D=A // 10519
@SP // 10520
AM=M+1 // 10521
A=A-1 // 10522
M=D // 10523
@48 // 10524
D=A // 10525
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=D // 10529
@48 // 10530
D=A // 10531
@SP // 10532
AM=M+1 // 10533
A=A-1 // 10534
M=D // 10535
@48 // 10536
D=A // 10537
@SP // 10538
AM=M+1 // 10539
A=A-1 // 10540
M=D // 10541
@51 // 10542
D=A // 10543
@SP // 10544
AM=M+1 // 10545
A=A-1 // 10546
M=D // 10547
@30 // 10548
D=A // 10549
@SP // 10550
AM=M+1 // 10551
A=A-1 // 10552
M=D // 10553
@SP // 10554
AM=M+1 // 10555
A=A-1 // 10556
M=0 // 10557
// call Output.create
@17 // 10558
D=A // 10559
@14 // 10560
M=D // 10561
@Output.create // 10562
D=A // 10563
@13 // 10564
M=D // 10565
@Output.init.ret.76 // 10566
D=A // 10567
@CALL // 10568
0;JMP // 10569
(Output.init.ret.76)
@SP // 10570
M=M-1 // 10571

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 10572
D=A // 10573
@SP // 10574
AM=M+1 // 10575
A=A-1 // 10576
M=D // 10577
@3 // 10578
D=A // 10579
@SP // 10580
AM=M+1 // 10581
A=A-1 // 10582
M=D // 10583
@3 // 10584
D=A // 10585
@SP // 10586
AM=M+1 // 10587
A=A-1 // 10588
M=D // 10589
@3 // 10590
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
@27 // 10602
D=A // 10603
@SP // 10604
AM=M+1 // 10605
A=A-1 // 10606
M=D // 10607
@15 // 10608
D=A // 10609
@SP // 10610
AM=M+1 // 10611
A=A-1 // 10612
M=D // 10613
@15 // 10614
D=A // 10615
@SP // 10616
AM=M+1 // 10617
A=A-1 // 10618
M=D // 10619
@27 // 10620
D=A // 10621
@SP // 10622
AM=M+1 // 10623
A=A-1 // 10624
M=D // 10625
@51 // 10626
D=A // 10627
@SP // 10628
AM=M+1 // 10629
A=A-1 // 10630
M=D // 10631
@SP // 10632
AM=M+1 // 10633
A=A-1 // 10634
M=0 // 10635
@SP // 10636
AM=M+1 // 10637
A=A-1 // 10638
M=0 // 10639
// call Output.create
@17 // 10640
D=A // 10641
@14 // 10642
M=D // 10643
@Output.create // 10644
D=A // 10645
@13 // 10646
M=D // 10647
@Output.init.ret.77 // 10648
D=A // 10649
@CALL // 10650
0;JMP // 10651
(Output.init.ret.77)
@SP // 10652
M=M-1 // 10653

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10654
D=A // 10655
@SP // 10656
AM=M+1 // 10657
A=A-1 // 10658
M=D // 10659
@14 // 10660
D=A // 10661
@SP // 10662
AM=M+1 // 10663
A=A-1 // 10664
M=D // 10665
@12 // 10666
D=A // 10667
@SP // 10668
AM=M+1 // 10669
A=A-1 // 10670
M=D // 10671
@12 // 10672
D=A // 10673
@SP // 10674
AM=M+1 // 10675
A=A-1 // 10676
M=D // 10677
@12 // 10678
D=A // 10679
@SP // 10680
AM=M+1 // 10681
A=A-1 // 10682
M=D // 10683
@12 // 10684
D=A // 10685
@SP // 10686
AM=M+1 // 10687
A=A-1 // 10688
M=D // 10689
@12 // 10690
D=A // 10691
@SP // 10692
AM=M+1 // 10693
A=A-1 // 10694
M=D // 10695
@12 // 10696
D=A // 10697
@SP // 10698
AM=M+1 // 10699
A=A-1 // 10700
M=D // 10701
@12 // 10702
D=A // 10703
@SP // 10704
AM=M+1 // 10705
A=A-1 // 10706
M=D // 10707
@30 // 10708
D=A // 10709
@SP // 10710
AM=M+1 // 10711
A=A-1 // 10712
M=D // 10713
@SP // 10714
AM=M+1 // 10715
A=A-1 // 10716
M=0 // 10717
@SP // 10718
AM=M+1 // 10719
A=A-1 // 10720
M=0 // 10721
// call Output.create
@17 // 10722
D=A // 10723
@14 // 10724
M=D // 10725
@Output.create // 10726
D=A // 10727
@13 // 10728
M=D // 10729
@Output.init.ret.78 // 10730
D=A // 10731
@CALL // 10732
0;JMP // 10733
(Output.init.ret.78)
@SP // 10734
M=M-1 // 10735

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10736
D=A // 10737
@SP // 10738
M=D+M // 10739
@109 // 10740
D=A // 10741
@SP // 10742
A=M-1 // 10743
M=0 // 10744
A=A-1 // 10745
M=0 // 10746
A=A-1 // 10747
M=0 // 10748
A=A-1 // 10749
M=D // 10750
A=A-1 // 10751
@29 // 10752
D=A // 10753
@SP // 10754
AM=M+1 // 10755
A=A-1 // 10756
M=D // 10757
@63 // 10758
D=A // 10759
@SP // 10760
AM=M+1 // 10761
A=A-1 // 10762
M=D // 10763
@43 // 10764
D=A // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=D // 10769
@43 // 10770
D=A // 10771
@SP // 10772
AM=M+1 // 10773
A=A-1 // 10774
M=D // 10775
@43 // 10776
D=A // 10777
@SP // 10778
AM=M+1 // 10779
A=A-1 // 10780
M=D // 10781
@43 // 10782
D=A // 10783
@SP // 10784
AM=M+1 // 10785
A=A-1 // 10786
M=D // 10787
@SP // 10788
AM=M+1 // 10789
A=A-1 // 10790
M=0 // 10791
@SP // 10792
AM=M+1 // 10793
A=A-1 // 10794
M=0 // 10795
// call Output.create
@17 // 10796
D=A // 10797
@14 // 10798
M=D // 10799
@Output.create // 10800
D=A // 10801
@13 // 10802
M=D // 10803
@Output.init.ret.79 // 10804
D=A // 10805
@CALL // 10806
0;JMP // 10807
(Output.init.ret.79)
@SP // 10808
M=M-1 // 10809

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10810
D=A // 10811
@SP // 10812
M=D+M // 10813
@110 // 10814
D=A // 10815
@SP // 10816
A=M-1 // 10817
M=0 // 10818
A=A-1 // 10819
M=0 // 10820
A=A-1 // 10821
M=0 // 10822
A=A-1 // 10823
M=D // 10824
A=A-1 // 10825
@29 // 10826
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
@51 // 10838
D=A // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=D // 10843
@51 // 10844
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
@51 // 10856
D=A // 10857
@SP // 10858
AM=M+1 // 10859
A=A-1 // 10860
M=D // 10861
@SP // 10862
AM=M+1 // 10863
A=A-1 // 10864
M=0 // 10865
@SP // 10866
AM=M+1 // 10867
A=A-1 // 10868
M=0 // 10869
// call Output.create
@17 // 10870
D=A // 10871
@14 // 10872
M=D // 10873
@Output.create // 10874
D=A // 10875
@13 // 10876
M=D // 10877
@Output.init.ret.80 // 10878
D=A // 10879
@CALL // 10880
0;JMP // 10881
(Output.init.ret.80)
@SP // 10882
M=M-1 // 10883

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10884
D=A // 10885
@SP // 10886
M=D+M // 10887
@111 // 10888
D=A // 10889
@SP // 10890
A=M-1 // 10891
M=0 // 10892
A=A-1 // 10893
M=0 // 10894
A=A-1 // 10895
M=0 // 10896
A=A-1 // 10897
M=D // 10898
A=A-1 // 10899
@30 // 10900
D=A // 10901
@SP // 10902
AM=M+1 // 10903
A=A-1 // 10904
M=D // 10905
@51 // 10906
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
@51 // 10918
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
@30 // 10930
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
@Output.init.ret.81 // 10952
D=A // 10953
@CALL // 10954
0;JMP // 10955
(Output.init.ret.81)
@SP // 10956
M=M-1 // 10957

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10958
D=A // 10959
@SP // 10960
M=D+M // 10961
@112 // 10962
D=A // 10963
@SP // 10964
A=M-1 // 10965
M=0 // 10966
A=A-1 // 10967
M=0 // 10968
A=A-1 // 10969
M=0 // 10970
A=A-1 // 10971
M=D // 10972
A=A-1 // 10973
@30 // 10974
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
@51 // 10986
D=A // 10987
@SP // 10988
AM=M+1 // 10989
A=A-1 // 10990
M=D // 10991
@51 // 10992
D=A // 10993
@SP // 10994
AM=M+1 // 10995
A=A-1 // 10996
M=D // 10997
@31 // 10998
D=A // 10999
@SP // 11000
AM=M+1 // 11001
A=A-1 // 11002
M=D // 11003
@3 // 11004
D=A // 11005
@SP // 11006
AM=M+1 // 11007
A=A-1 // 11008
M=D // 11009
@3 // 11010
D=A // 11011
@SP // 11012
AM=M+1 // 11013
A=A-1 // 11014
M=D // 11015
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
@Output.init.ret.82 // 11028
D=A // 11029
@CALL // 11030
0;JMP // 11031
(Output.init.ret.82)
@SP // 11032
M=M-1 // 11033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11034
D=A // 11035
@SP // 11036
M=D+M // 11037
@113 // 11038
D=A // 11039
@SP // 11040
A=M-1 // 11041
M=0 // 11042
A=A-1 // 11043
M=0 // 11044
A=A-1 // 11045
M=0 // 11046
A=A-1 // 11047
M=D // 11048
A=A-1 // 11049
@30 // 11050
D=A // 11051
@SP // 11052
AM=M+1 // 11053
A=A-1 // 11054
M=D // 11055
@51 // 11056
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
@62 // 11074
D=A // 11075
@SP // 11076
AM=M+1 // 11077
A=A-1 // 11078
M=D // 11079
@48 // 11080
D=A // 11081
@SP // 11082
AM=M+1 // 11083
A=A-1 // 11084
M=D // 11085
@48 // 11086
D=A // 11087
@SP // 11088
AM=M+1 // 11089
A=A-1 // 11090
M=D // 11091
@SP // 11092
AM=M+1 // 11093
A=A-1 // 11094
M=0 // 11095
// call Output.create
@17 // 11096
D=A // 11097
@14 // 11098
M=D // 11099
@Output.create // 11100
D=A // 11101
@13 // 11102
M=D // 11103
@Output.init.ret.83 // 11104
D=A // 11105
@CALL // 11106
0;JMP // 11107
(Output.init.ret.83)
@SP // 11108
M=M-1 // 11109

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11110
D=A // 11111
@SP // 11112
M=D+M // 11113
@114 // 11114
D=A // 11115
@SP // 11116
A=M-1 // 11117
M=0 // 11118
A=A-1 // 11119
M=0 // 11120
A=A-1 // 11121
M=0 // 11122
A=A-1 // 11123
M=D // 11124
A=A-1 // 11125
@29 // 11126
D=A // 11127
@SP // 11128
AM=M+1 // 11129
A=A-1 // 11130
M=D // 11131
@55 // 11132
D=A // 11133
@SP // 11134
AM=M+1 // 11135
A=A-1 // 11136
M=D // 11137
@51 // 11138
D=A // 11139
@SP // 11140
AM=M+1 // 11141
A=A-1 // 11142
M=D // 11143
@3 // 11144
D=A // 11145
@SP // 11146
AM=M+1 // 11147
A=A-1 // 11148
M=D // 11149
@3 // 11150
D=A // 11151
@SP // 11152
AM=M+1 // 11153
A=A-1 // 11154
M=D // 11155
@7 // 11156
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
@Output.init.ret.84 // 11178
D=A // 11179
@CALL // 11180
0;JMP // 11181
(Output.init.ret.84)
@SP // 11182
M=M-1 // 11183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11184
D=A // 11185
@SP // 11186
M=D+M // 11187
@115 // 11188
D=A // 11189
@SP // 11190
A=M-1 // 11191
M=0 // 11192
A=A-1 // 11193
M=0 // 11194
A=A-1 // 11195
M=0 // 11196
A=A-1 // 11197
M=D // 11198
A=A-1 // 11199
@30 // 11200
D=A // 11201
@SP // 11202
AM=M+1 // 11203
A=A-1 // 11204
M=D // 11205
@51 // 11206
D=A // 11207
@SP // 11208
AM=M+1 // 11209
A=A-1 // 11210
M=D // 11211
@6 // 11212
D=A // 11213
@SP // 11214
AM=M+1 // 11215
A=A-1 // 11216
M=D // 11217
@24 // 11218
D=A // 11219
@SP // 11220
AM=M+1 // 11221
A=A-1 // 11222
M=D // 11223
@51 // 11224
D=A // 11225
@SP // 11226
AM=M+1 // 11227
A=A-1 // 11228
M=D // 11229
@30 // 11230
D=A // 11231
@SP // 11232
AM=M+1 // 11233
A=A-1 // 11234
M=D // 11235
@SP // 11236
AM=M+1 // 11237
A=A-1 // 11238
M=0 // 11239
@SP // 11240
AM=M+1 // 11241
A=A-1 // 11242
M=0 // 11243
// call Output.create
@17 // 11244
D=A // 11245
@14 // 11246
M=D // 11247
@Output.create // 11248
D=A // 11249
@13 // 11250
M=D // 11251
@Output.init.ret.85 // 11252
D=A // 11253
@CALL // 11254
0;JMP // 11255
(Output.init.ret.85)
@SP // 11256
M=M-1 // 11257

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 11258
D=A // 11259
@SP // 11260
AM=M+1 // 11261
A=A-1 // 11262
M=D // 11263
@4 // 11264
D=A // 11265
@SP // 11266
AM=M+1 // 11267
A=A-1 // 11268
M=D // 11269
@6 // 11270
D=A // 11271
@SP // 11272
AM=M+1 // 11273
A=A-1 // 11274
M=D // 11275
@6 // 11276
D=A // 11277
@SP // 11278
AM=M+1 // 11279
A=A-1 // 11280
M=D // 11281
@15 // 11282
D=A // 11283
@SP // 11284
AM=M+1 // 11285
A=A-1 // 11286
M=D // 11287
@6 // 11288
D=A // 11289
@SP // 11290
AM=M+1 // 11291
A=A-1 // 11292
M=D // 11293
@6 // 11294
D=A // 11295
@SP // 11296
AM=M+1 // 11297
A=A-1 // 11298
M=D // 11299
@6 // 11300
D=A // 11301
@SP // 11302
AM=M+1 // 11303
A=A-1 // 11304
M=D // 11305
@54 // 11306
D=A // 11307
@SP // 11308
AM=M+1 // 11309
A=A-1 // 11310
M=D // 11311
@28 // 11312
D=A // 11313
@SP // 11314
AM=M+1 // 11315
A=A-1 // 11316
M=D // 11317
@SP // 11318
AM=M+1 // 11319
A=A-1 // 11320
M=0 // 11321
@SP // 11322
AM=M+1 // 11323
A=A-1 // 11324
M=0 // 11325
// call Output.create
@17 // 11326
D=A // 11327
@14 // 11328
M=D // 11329
@Output.create // 11330
D=A // 11331
@13 // 11332
M=D // 11333
@Output.init.ret.86 // 11334
D=A // 11335
@CALL // 11336
0;JMP // 11337
(Output.init.ret.86)
@SP // 11338
M=M-1 // 11339

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11340
D=A // 11341
@SP // 11342
M=D+M // 11343
@117 // 11344
D=A // 11345
@SP // 11346
A=M-1 // 11347
M=0 // 11348
A=A-1 // 11349
M=0 // 11350
A=A-1 // 11351
M=0 // 11352
A=A-1 // 11353
M=D // 11354
A=A-1 // 11355
@27 // 11356
D=A // 11357
@SP // 11358
AM=M+1 // 11359
A=A-1 // 11360
M=D // 11361
@27 // 11362
D=A // 11363
@SP // 11364
AM=M+1 // 11365
A=A-1 // 11366
M=D // 11367
@27 // 11368
D=A // 11369
@SP // 11370
AM=M+1 // 11371
A=A-1 // 11372
M=D // 11373
@27 // 11374
D=A // 11375
@SP // 11376
AM=M+1 // 11377
A=A-1 // 11378
M=D // 11379
@27 // 11380
D=A // 11381
@SP // 11382
AM=M+1 // 11383
A=A-1 // 11384
M=D // 11385
@54 // 11386
D=A // 11387
@SP // 11388
AM=M+1 // 11389
A=A-1 // 11390
M=D // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=0 // 11395
@SP // 11396
AM=M+1 // 11397
A=A-1 // 11398
M=0 // 11399
// call Output.create
@17 // 11400
D=A // 11401
@14 // 11402
M=D // 11403
@Output.create // 11404
D=A // 11405
@13 // 11406
M=D // 11407
@Output.init.ret.87 // 11408
D=A // 11409
@CALL // 11410
0;JMP // 11411
(Output.init.ret.87)
@SP // 11412
M=M-1 // 11413

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11414
D=A // 11415
@SP // 11416
M=D+M // 11417
@118 // 11418
D=A // 11419
@SP // 11420
A=M-1 // 11421
M=0 // 11422
A=A-1 // 11423
M=0 // 11424
A=A-1 // 11425
M=0 // 11426
A=A-1 // 11427
M=D // 11428
A=A-1 // 11429
@51 // 11430
D=A // 11431
@SP // 11432
AM=M+1 // 11433
A=A-1 // 11434
M=D // 11435
@51 // 11436
D=A // 11437
@SP // 11438
AM=M+1 // 11439
A=A-1 // 11440
M=D // 11441
@51 // 11442
D=A // 11443
@SP // 11444
AM=M+1 // 11445
A=A-1 // 11446
M=D // 11447
@51 // 11448
D=A // 11449
@SP // 11450
AM=M+1 // 11451
A=A-1 // 11452
M=D // 11453
@30 // 11454
D=A // 11455
@SP // 11456
AM=M+1 // 11457
A=A-1 // 11458
M=D // 11459
@12 // 11460
D=A // 11461
@SP // 11462
AM=M+1 // 11463
A=A-1 // 11464
M=D // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=0 // 11469
@SP // 11470
AM=M+1 // 11471
A=A-1 // 11472
M=0 // 11473
// call Output.create
@17 // 11474
D=A // 11475
@14 // 11476
M=D // 11477
@Output.create // 11478
D=A // 11479
@13 // 11480
M=D // 11481
@Output.init.ret.88 // 11482
D=A // 11483
@CALL // 11484
0;JMP // 11485
(Output.init.ret.88)
@SP // 11486
M=M-1 // 11487

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11488
D=A // 11489
@SP // 11490
M=D+M // 11491
@119 // 11492
D=A // 11493
@SP // 11494
A=M-1 // 11495
M=0 // 11496
A=A-1 // 11497
M=0 // 11498
A=A-1 // 11499
M=0 // 11500
A=A-1 // 11501
M=D // 11502
A=A-1 // 11503
@51 // 11504
D=A // 11505
@SP // 11506
AM=M+1 // 11507
A=A-1 // 11508
M=D // 11509
@51 // 11510
D=A // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=D // 11515
@51 // 11516
D=A // 11517
@SP // 11518
AM=M+1 // 11519
A=A-1 // 11520
M=D // 11521
@63 // 11522
D=A // 11523
@SP // 11524
AM=M+1 // 11525
A=A-1 // 11526
M=D // 11527
@63 // 11528
D=A // 11529
@SP // 11530
AM=M+1 // 11531
A=A-1 // 11532
M=D // 11533
@18 // 11534
D=A // 11535
@SP // 11536
AM=M+1 // 11537
A=A-1 // 11538
M=D // 11539
@SP // 11540
AM=M+1 // 11541
A=A-1 // 11542
M=0 // 11543
@SP // 11544
AM=M+1 // 11545
A=A-1 // 11546
M=0 // 11547
// call Output.create
@17 // 11548
D=A // 11549
@14 // 11550
M=D // 11551
@Output.create // 11552
D=A // 11553
@13 // 11554
M=D // 11555
@Output.init.ret.89 // 11556
D=A // 11557
@CALL // 11558
0;JMP // 11559
(Output.init.ret.89)
@SP // 11560
M=M-1 // 11561

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11562
D=A // 11563
@SP // 11564
M=D+M // 11565
@120 // 11566
D=A // 11567
@SP // 11568
A=M-1 // 11569
M=0 // 11570
A=A-1 // 11571
M=0 // 11572
A=A-1 // 11573
M=0 // 11574
A=A-1 // 11575
M=D // 11576
A=A-1 // 11577
@51 // 11578
D=A // 11579
@SP // 11580
AM=M+1 // 11581
A=A-1 // 11582
M=D // 11583
@30 // 11584
D=A // 11585
@SP // 11586
AM=M+1 // 11587
A=A-1 // 11588
M=D // 11589
@12 // 11590
D=A // 11591
@SP // 11592
AM=M+1 // 11593
A=A-1 // 11594
M=D // 11595
@12 // 11596
D=A // 11597
@SP // 11598
AM=M+1 // 11599
A=A-1 // 11600
M=D // 11601
@30 // 11602
D=A // 11603
@SP // 11604
AM=M+1 // 11605
A=A-1 // 11606
M=D // 11607
@51 // 11608
D=A // 11609
@SP // 11610
AM=M+1 // 11611
A=A-1 // 11612
M=D // 11613
@SP // 11614
AM=M+1 // 11615
A=A-1 // 11616
M=0 // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=0 // 11621
// call Output.create
@17 // 11622
D=A // 11623
@14 // 11624
M=D // 11625
@Output.create // 11626
D=A // 11627
@13 // 11628
M=D // 11629
@Output.init.ret.90 // 11630
D=A // 11631
@CALL // 11632
0;JMP // 11633
(Output.init.ret.90)
@SP // 11634
M=M-1 // 11635

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11636
D=A // 11637
@SP // 11638
M=D+M // 11639
@121 // 11640
D=A // 11641
@SP // 11642
A=M-1 // 11643
M=0 // 11644
A=A-1 // 11645
M=0 // 11646
A=A-1 // 11647
M=0 // 11648
A=A-1 // 11649
M=D // 11650
A=A-1 // 11651
@51 // 11652
D=A // 11653
@SP // 11654
AM=M+1 // 11655
A=A-1 // 11656
M=D // 11657
@51 // 11658
D=A // 11659
@SP // 11660
AM=M+1 // 11661
A=A-1 // 11662
M=D // 11663
@51 // 11664
D=A // 11665
@SP // 11666
AM=M+1 // 11667
A=A-1 // 11668
M=D // 11669
@62 // 11670
D=A // 11671
@SP // 11672
AM=M+1 // 11673
A=A-1 // 11674
M=D // 11675
@48 // 11676
D=A // 11677
@SP // 11678
AM=M+1 // 11679
A=A-1 // 11680
M=D // 11681
@24 // 11682
D=A // 11683
@SP // 11684
AM=M+1 // 11685
A=A-1 // 11686
M=D // 11687
@15 // 11688
D=A // 11689
@SP // 11690
AM=M+1 // 11691
A=A-1 // 11692
M=D // 11693
@SP // 11694
AM=M+1 // 11695
A=A-1 // 11696
M=0 // 11697
// call Output.create
@17 // 11698
D=A // 11699
@14 // 11700
M=D // 11701
@Output.create // 11702
D=A // 11703
@13 // 11704
M=D // 11705
@Output.init.ret.91 // 11706
D=A // 11707
@CALL // 11708
0;JMP // 11709
(Output.init.ret.91)
@SP // 11710
M=M-1 // 11711

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11712
D=A // 11713
@SP // 11714
M=D+M // 11715
@122 // 11716
D=A // 11717
@SP // 11718
A=M-1 // 11719
M=0 // 11720
A=A-1 // 11721
M=0 // 11722
A=A-1 // 11723
M=0 // 11724
A=A-1 // 11725
M=D // 11726
A=A-1 // 11727
@63 // 11728
D=A // 11729
@SP // 11730
AM=M+1 // 11731
A=A-1 // 11732
M=D // 11733
@27 // 11734
D=A // 11735
@SP // 11736
AM=M+1 // 11737
A=A-1 // 11738
M=D // 11739
@12 // 11740
D=A // 11741
@SP // 11742
AM=M+1 // 11743
A=A-1 // 11744
M=D // 11745
@6 // 11746
D=A // 11747
@SP // 11748
AM=M+1 // 11749
A=A-1 // 11750
M=D // 11751
@51 // 11752
D=A // 11753
@SP // 11754
AM=M+1 // 11755
A=A-1 // 11756
M=D // 11757
@63 // 11758
D=A // 11759
@SP // 11760
AM=M+1 // 11761
A=A-1 // 11762
M=D // 11763
@SP // 11764
AM=M+1 // 11765
A=A-1 // 11766
M=0 // 11767
@SP // 11768
AM=M+1 // 11769
A=A-1 // 11770
M=0 // 11771
// call Output.create
@17 // 11772
D=A // 11773
@14 // 11774
M=D // 11775
@Output.create // 11776
D=A // 11777
@13 // 11778
M=D // 11779
@Output.init.ret.92 // 11780
D=A // 11781
@CALL // 11782
0;JMP // 11783
(Output.init.ret.92)
@SP // 11784
M=M-1 // 11785

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11786
D=A // 11787
@SP // 11788
AM=M+1 // 11789
A=A-1 // 11790
M=D // 11791
@56 // 11792
D=A // 11793
@SP // 11794
AM=M+1 // 11795
A=A-1 // 11796
M=D // 11797
@12 // 11798
D=A // 11799
@SP // 11800
AM=M+1 // 11801
A=A-1 // 11802
M=D // 11803
@12 // 11804
D=A // 11805
@SP // 11806
AM=M+1 // 11807
A=A-1 // 11808
M=D // 11809
@12 // 11810
D=A // 11811
@SP // 11812
AM=M+1 // 11813
A=A-1 // 11814
M=D // 11815
@7 // 11816
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
@12 // 11828
D=A // 11829
@SP // 11830
AM=M+1 // 11831
A=A-1 // 11832
M=D // 11833
@12 // 11834
D=A // 11835
@SP // 11836
AM=M+1 // 11837
A=A-1 // 11838
M=D // 11839
@56 // 11840
D=A // 11841
@SP // 11842
AM=M+1 // 11843
A=A-1 // 11844
M=D // 11845
@SP // 11846
AM=M+1 // 11847
A=A-1 // 11848
M=0 // 11849
@SP // 11850
AM=M+1 // 11851
A=A-1 // 11852
M=0 // 11853
// call Output.create
@17 // 11854
D=A // 11855
@14 // 11856
M=D // 11857
@Output.create // 11858
D=A // 11859
@13 // 11860
M=D // 11861
@Output.init.ret.93 // 11862
D=A // 11863
@CALL // 11864
0;JMP // 11865
(Output.init.ret.93)
@SP // 11866
M=M-1 // 11867

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11868
D=A // 11869
@SP // 11870
AM=M+1 // 11871
A=A-1 // 11872
M=D // 11873
@12 // 11874
D=A // 11875
@SP // 11876
AM=M+1 // 11877
A=A-1 // 11878
M=D // 11879
@12 // 11880
D=A // 11881
@SP // 11882
AM=M+1 // 11883
A=A-1 // 11884
M=D // 11885
@12 // 11886
D=A // 11887
@SP // 11888
AM=M+1 // 11889
A=A-1 // 11890
M=D // 11891
@12 // 11892
D=A // 11893
@SP // 11894
AM=M+1 // 11895
A=A-1 // 11896
M=D // 11897
@12 // 11898
D=A // 11899
@SP // 11900
AM=M+1 // 11901
A=A-1 // 11902
M=D // 11903
@12 // 11904
D=A // 11905
@SP // 11906
AM=M+1 // 11907
A=A-1 // 11908
M=D // 11909
@12 // 11910
D=A // 11911
@SP // 11912
AM=M+1 // 11913
A=A-1 // 11914
M=D // 11915
@12 // 11916
D=A // 11917
@SP // 11918
AM=M+1 // 11919
A=A-1 // 11920
M=D // 11921
@12 // 11922
D=A // 11923
@SP // 11924
AM=M+1 // 11925
A=A-1 // 11926
M=D // 11927
@SP // 11928
AM=M+1 // 11929
A=A-1 // 11930
M=0 // 11931
@SP // 11932
AM=M+1 // 11933
A=A-1 // 11934
M=0 // 11935
// call Output.create
@17 // 11936
D=A // 11937
@14 // 11938
M=D // 11939
@Output.create // 11940
D=A // 11941
@13 // 11942
M=D // 11943
@Output.init.ret.94 // 11944
D=A // 11945
@CALL // 11946
0;JMP // 11947
(Output.init.ret.94)
@SP // 11948
M=M-1 // 11949

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11950
D=A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955
@7 // 11956
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
@12 // 11974
D=A // 11975
@SP // 11976
AM=M+1 // 11977
A=A-1 // 11978
M=D // 11979
@56 // 11980
D=A // 11981
@SP // 11982
AM=M+1 // 11983
A=A-1 // 11984
M=D // 11985
@12 // 11986
D=A // 11987
@SP // 11988
AM=M+1 // 11989
A=A-1 // 11990
M=D // 11991
@12 // 11992
D=A // 11993
@SP // 11994
AM=M+1 // 11995
A=A-1 // 11996
M=D // 11997
@12 // 11998
D=A // 11999
@SP // 12000
AM=M+1 // 12001
A=A-1 // 12002
M=D // 12003
@7 // 12004
D=A // 12005
@SP // 12006
AM=M+1 // 12007
A=A-1 // 12008
M=D // 12009
@SP // 12010
AM=M+1 // 12011
A=A-1 // 12012
M=0 // 12013
@SP // 12014
AM=M+1 // 12015
A=A-1 // 12016
M=0 // 12017
// call Output.create
@17 // 12018
D=A // 12019
@14 // 12020
M=D // 12021
@Output.create // 12022
D=A // 12023
@13 // 12024
M=D // 12025
@Output.init.ret.95 // 12026
D=A // 12027
@CALL // 12028
0;JMP // 12029
(Output.init.ret.95)
@SP // 12030
M=M-1 // 12031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 12032
D=A // 12033
@SP // 12034
AM=M+1 // 12035
A=A-1 // 12036
M=D // 12037
@38 // 12038
D=A // 12039
@SP // 12040
AM=M+1 // 12041
A=A-1 // 12042
M=D // 12043
@45 // 12044
D=A // 12045
@SP // 12046
AM=M+1 // 12047
A=A-1 // 12048
M=D // 12049
@25 // 12050
D=A // 12051
@SP // 12052
AM=M+1 // 12053
A=A-1 // 12054
M=D // 12055
@SP // 12056
AM=M+1 // 12057
A=A-1 // 12058
M=0 // 12059
@SP // 12060
AM=M+1 // 12061
A=A-1 // 12062
M=0 // 12063
@SP // 12064
AM=M+1 // 12065
A=A-1 // 12066
M=0 // 12067
@SP // 12068
AM=M+1 // 12069
A=A-1 // 12070
M=0 // 12071
@SP // 12072
AM=M+1 // 12073
A=A-1 // 12074
M=0 // 12075
@SP // 12076
AM=M+1 // 12077
A=A-1 // 12078
M=0 // 12079
@SP // 12080
AM=M+1 // 12081
A=A-1 // 12082
M=0 // 12083
@SP // 12084
AM=M+1 // 12085
A=A-1 // 12086
M=0 // 12087
// call Output.create
@17 // 12088
D=A // 12089
@14 // 12090
M=D // 12091
@Output.create // 12092
D=A // 12093
@13 // 12094
M=D // 12095
@Output.init.ret.96 // 12096
D=A // 12097
@CALL // 12098
0;JMP // 12099
(Output.init.ret.96)
@SP // 12100
M=M-1 // 12101

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12102
M=0 // 12103

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12104
M=0 // 12105

////PushInstruction("constant 0")
@SP // 12106
AM=M+1 // 12107
A=A-1 // 12108
M=0 // 12109
@RETURN // 12110
0;JMP // 12111

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=97}}
// function Output.create with 1
(Output.create)
@SP // 12112
AM=M+1 // 12113
A=A-1 // 12114
M=0 // 12115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 12116
D=A // 12117
@SP // 12118
AM=M+1 // 12119
A=A-1 // 12120
M=D // 12121
// call Array.new
@6 // 12122
D=A // 12123
@14 // 12124
M=D // 12125
@Array.new // 12126
D=A // 12127
@13 // 12128
M=D // 12129
@Output.create.ret.0 // 12130
D=A // 12131
@CALL // 12132
0;JMP // 12133
(Output.create.ret.0)
@SP // 12134
AM=M-1 // 12135
D=M // 12136
@LCL // 12137
A=M // 12138
M=D // 12139

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 12140
D=M // 12141
@SP // 12142
AM=M+1 // 12143
A=A-1 // 12144
M=D // 12145
@ARG // 12146
A=M // 12147
D=M // 12148
@SP // 12149
AM=M-1 // 12150
D=D+M // 12151
@SP // 12152
AM=M+1 // 12153
A=A-1 // 12154
M=D // 12155
@LCL // 12156
A=M // 12157
D=M // 12158
@SP // 12159
AM=M-1 // 12160
A=M // 12161
M=D // 12162

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 12163
A=M // 12164
D=M // 12165
@SP // 12166
AM=M+1 // 12167
A=A-1 // 12168
M=D // 12169
@ARG // 12170
A=M+1 // 12171
D=M // 12172
@SP // 12173
AM=M-1 // 12174
A=M // 12175
M=D // 12176

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 12177
A=M // 12178
D=M // 12179
@SP // 12180
AM=M+1 // 12181
A=A-1 // 12182
M=D+1 // 12183
@ARG // 12184
A=M+1 // 12185
A=A+1 // 12186
D=M // 12187
@SP // 12188
AM=M-1 // 12189
A=M // 12190
M=D // 12191

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 12192
A=M // 12193
D=M // 12194
@2 // 12195
D=D+A // 12196
@SP // 12197
AM=M+1 // 12198
A=A-1 // 12199
M=D // 12200
@ARG // 12201
A=M+1 // 12202
A=A+1 // 12203
A=A+1 // 12204
D=M // 12205
@SP // 12206
AM=M-1 // 12207
A=M // 12208
M=D // 12209

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 12210
A=M // 12211
D=M // 12212
@3 // 12213
D=D+A // 12214
@SP // 12215
AM=M+1 // 12216
A=A-1 // 12217
M=D // 12218
@ARG // 12219
D=M // 12220
@4 // 12221
A=D+A // 12222
D=M // 12223
@SP // 12224
AM=M-1 // 12225
A=M // 12226
M=D // 12227

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 12228
A=M // 12229
D=M // 12230
@4 // 12231
D=D+A // 12232
@SP // 12233
AM=M+1 // 12234
A=A-1 // 12235
M=D // 12236
@ARG // 12237
D=M // 12238
@5 // 12239
A=D+A // 12240
D=M // 12241
@SP // 12242
AM=M-1 // 12243
A=M // 12244
M=D // 12245

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 12246
A=M // 12247
D=M // 12248
@5 // 12249
D=D+A // 12250
@SP // 12251
AM=M+1 // 12252
A=A-1 // 12253
M=D // 12254
@ARG // 12255
D=M // 12256
@6 // 12257
A=D+A // 12258
D=M // 12259
@SP // 12260
AM=M-1 // 12261
A=M // 12262
M=D // 12263

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 12264
A=M // 12265
D=M // 12266
@6 // 12267
D=D+A // 12268
@SP // 12269
AM=M+1 // 12270
A=A-1 // 12271
M=D // 12272
@ARG // 12273
D=M // 12274
@7 // 12275
A=D+A // 12276
D=M // 12277
@SP // 12278
AM=M-1 // 12279
A=M // 12280
M=D // 12281

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 12282
A=M // 12283
D=M // 12284
@7 // 12285
D=D+A // 12286
@SP // 12287
AM=M+1 // 12288
A=A-1 // 12289
M=D // 12290
@ARG // 12291
D=M // 12292
@8 // 12293
A=D+A // 12294
D=M // 12295
@SP // 12296
AM=M-1 // 12297
A=M // 12298
M=D // 12299

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 12300
A=M // 12301
D=M // 12302
@8 // 12303
D=D+A // 12304
@SP // 12305
AM=M+1 // 12306
A=A-1 // 12307
M=D // 12308
@ARG // 12309
D=M // 12310
@9 // 12311
A=D+A // 12312
D=M // 12313
@SP // 12314
AM=M-1 // 12315
A=M // 12316
M=D // 12317

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 12318
A=M // 12319
D=M // 12320
@9 // 12321
D=D+A // 12322
@SP // 12323
AM=M+1 // 12324
A=A-1 // 12325
M=D // 12326
@ARG // 12327
D=M // 12328
@10 // 12329
A=D+A // 12330
D=M // 12331
@SP // 12332
AM=M-1 // 12333
A=M // 12334
M=D // 12335

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 12336
A=M // 12337
D=M // 12338
@10 // 12339
D=D+A // 12340
@SP // 12341
AM=M+1 // 12342
A=A-1 // 12343
M=D // 12344
@ARG // 12345
D=M // 12346
@11 // 12347
A=D+A // 12348
D=M // 12349
@SP // 12350
AM=M-1 // 12351
A=M // 12352
M=D // 12353

////PushInstruction("constant 0")
@SP // 12354
AM=M+1 // 12355
A=A-1 // 12356
M=0 // 12357
@RETURN // 12358
0;JMP // 12359

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 32"),
//            binaryOp: "LT"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 126"),
//            binaryOp: "GT"
//        ),
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Output.getMap$IF_TRUE1}}
@Output.getMap.LT.0 // 12360
D=A // 12361
@SP // 12362
AM=M+1 // 12363
A=A-1 // 12364
M=D // 12365
@ARG // 12366
A=M // 12367
D=M // 12368
@32 // 12369
D=D-A // 12370
@DO_LT // 12371
0;JMP // 12372
(Output.getMap.LT.0)
@SP // 12373
AM=M+1 // 12374
A=A-1 // 12375
M=D // 12376
@Output.getMap.GT.1 // 12377
D=A // 12378
@SP // 12379
AM=M+1 // 12380
A=A-1 // 12381
M=D // 12382
@ARG // 12383
A=M // 12384
D=M // 12385
@126 // 12386
D=D-A // 12387
@DO_GT // 12388
0;JMP // 12389
(Output.getMap.GT.1)
@SP // 12390
AM=M-1 // 12391
D=D|M // 12392
@Output.getMap$IF_TRUE1 // 12393
D;JNE // 12394

////GotoInstruction{label='Output.getMap$IF_FALSE1}
// goto Output.getMap$IF_FALSE1
@Output.getMap$IF_FALSE1 // 12395
0;JMP // 12396

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 12397
A=M // 12398
M=0 // 12399

////LabelInstruction{label='Output.getMap$IF_FALSE1}
// label Output.getMap$IF_FALSE1
(Output.getMap$IF_FALSE1)

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
@Output.0 // 12400
D=M // 12401
@SP // 12402
AM=M+1 // 12403
A=A-1 // 12404
M=D // 12405
@ARG // 12406
A=M // 12407
D=M // 12408
@SP // 12409
AM=M-1 // 12410
A=D+M // 12411
D=M // 12412
@SP // 12413
AM=M+1 // 12414
A=A-1 // 12415
M=D // 12416
@RETURN // 12417
0;JMP // 12418

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 12419
A=M+1 // 12420
D=M // 12421
@Output.1 // 12422
M=D // 12423

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 12424
A=M // 12425
D=M // 12426
@Output.2 // 12427
M=D // 12428

////PushInstruction("constant 0")
@SP // 12429
AM=M+1 // 12430
A=A-1 // 12431
M=0 // 12432
@RETURN // 12433
0;JMP // 12434

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 12435
D=A // 12436
@SP // 12437
AM=D+M // 12438
A=A-1 // 12439
M=0 // 12440
A=A-1 // 12441
M=0 // 12442
A=A-1 // 12443
M=0 // 12444
A=A-1 // 12445
M=0 // 12446

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12447
A=M // 12448
D=M // 12449
@SP // 12450
AM=M+1 // 12451
A=A-1 // 12452
M=D // 12453
// call Output.getMap
@6 // 12454
D=A // 12455
@14 // 12456
M=D // 12457
@Output.getMap // 12458
D=A // 12459
@13 // 12460
M=D // 12461
@Output.printChar.ret.0 // 12462
D=A // 12463
@CALL // 12464
0;JMP // 12465
(Output.printChar.ret.0)
@SP // 12466
AM=M-1 // 12467
D=M // 12468
@LCL // 12469
A=M // 12470
M=D // 12471

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12472
A=M+1 // 12473
A=A+1 // 12474
A=A+1 // 12475
M=0 // 12476

////LabelInstruction{label='Output.printChar_WHILE_EXP1}
// label Output.printChar_WHILE_EXP1
(Output.printChar_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 11"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.printChar_WHILE_END1}}
@Output.printChar.LT.2 // 12477
D=A // 12478
@SP // 12479
AM=M+1 // 12480
A=A-1 // 12481
M=D // 12482
@LCL // 12483
A=M+1 // 12484
A=A+1 // 12485
A=A+1 // 12486
D=M // 12487
@11 // 12488
D=D-A // 12489
@DO_LT // 12490
0;JMP // 12491
(Output.printChar.LT.2)
D=!D // 12492
@Output.printChar_WHILE_END1 // 12493
D;JNE // 12494

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

@Output.2 // 12495
D=M // 12496
@SP // 12497
AM=M+1 // 12498
A=A-1 // 12499
M=D // 12500
@11 // 12501
D=A // 12502
@SP // 12503
AM=M+1 // 12504
A=A-1 // 12505
M=D // 12506
// call Math.multiply
@7 // 12507
D=A // 12508
@14 // 12509
M=D // 12510
@Math.multiply // 12511
D=A // 12512
@13 // 12513
M=D // 12514
@Output.printChar.ret.1 // 12515
D=A // 12516
@CALL // 12517
0;JMP // 12518
(Output.printChar.ret.1)
@LCL // 12519
A=M+1 // 12520
A=A+1 // 12521
A=A+1 // 12522
D=M // 12523
@SP // 12524
AM=M-1 // 12525
D=D+M // 12526
@SP // 12527
AM=M+1 // 12528
A=A-1 // 12529
M=D // 12530
@32 // 12531
D=A // 12532
@SP // 12533
AM=M+1 // 12534
A=A-1 // 12535
M=D // 12536
// call Math.multiply
@7 // 12537
D=A // 12538
@14 // 12539
M=D // 12540
@Math.multiply // 12541
D=A // 12542
@13 // 12543
M=D // 12544
@Output.printChar.ret.2 // 12545
D=A // 12546
@CALL // 12547
0;JMP // 12548
(Output.printChar.ret.2)
@SP // 12549
AM=M-1 // 12550
D=M // 12551
@16384 // 12552
D=D+A // 12553
@SP // 12554
AM=M+1 // 12555
A=A-1 // 12556
M=D // 12557
@Output.1 // 12558
D=M // 12559
@SP // 12560
AM=M+1 // 12561
A=A-1 // 12562
M=D // 12563
@2 // 12564
D=A // 12565
@SP // 12566
AM=M+1 // 12567
A=A-1 // 12568
M=D // 12569
// call Math.divide
@7 // 12570
D=A // 12571
@14 // 12572
M=D // 12573
@Math.divide // 12574
D=A // 12575
@13 // 12576
M=D // 12577
@Output.printChar.ret.3 // 12578
D=A // 12579
@CALL // 12580
0;JMP // 12581
(Output.printChar.ret.3)
@SP // 12582
AM=M-1 // 12583
D=M // 12584
@SP // 12585
AM=M-1 // 12586
D=D+M // 12587
@LCL // 12588
A=M+1 // 12589
M=D // 12590

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 1"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.printChar$IF_TRUE1}}
@Output.printChar.EQ.3 // 12591
D=A // 12592
@SP // 12593
AM=M+1 // 12594
A=A-1 // 12595
M=D // 12596
@Output.1 // 12597
D=M // 12598
@1 // 12599
D=D&A // 12600
@DO_EQ // 12601
0;JMP // 12602
(Output.printChar.EQ.3)
@Output.printChar$IF_TRUE1 // 12603
D;JNE // 12604

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 12605
0;JMP // 12606

////LabelInstruction{label='Output.printChar$IF_TRUE1}
// label Output.printChar$IF_TRUE1
(Output.printChar$IF_TRUE1)

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

@LCL // 12607
A=M+1 // 12608
A=A+1 // 12609
A=A+1 // 12610
D=M // 12611
A=A-1 // 12612
A=A-1 // 12613
A=A-1 // 12614
A=D+M // 12615
D=M // 12616
@LCL // 12617
A=M+1 // 12618
A=A+1 // 12619
M=D // 12620

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 12621
0;JMP // 12622

////LabelInstruction{label='Output.printChar$IF_FALSE1}
// label Output.printChar$IF_FALSE1
(Output.printChar$IF_FALSE1)

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

@LCL // 12623
A=M+1 // 12624
A=A+1 // 12625
A=A+1 // 12626
D=M // 12627
A=A-1 // 12628
A=A-1 // 12629
A=A-1 // 12630
A=D+M // 12631
D=M // 12632
@SP // 12633
AM=M+1 // 12634
A=A-1 // 12635
M=D // 12636
@256 // 12637
D=A // 12638
@SP // 12639
AM=M+1 // 12640
A=A-1 // 12641
M=D // 12642
// call Math.multiply
@7 // 12643
D=A // 12644
@14 // 12645
M=D // 12646
@Math.multiply // 12647
D=A // 12648
@13 // 12649
M=D // 12650
@Output.printChar.ret.4 // 12651
D=A // 12652
@CALL // 12653
0;JMP // 12654
(Output.printChar.ret.4)
@SP // 12655
AM=M-1 // 12656
D=M // 12657
@LCL // 12658
A=M+1 // 12659
A=A+1 // 12660
M=D // 12661

////LabelInstruction{label='Output.printChar$IF_END1}
// label Output.printChar$IF_END1
(Output.printChar$IF_END1)

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
@LCL // 12662
A=M+1 // 12663
D=M // 12664
@SP // 12665
AM=M+1 // 12666
A=A-1 // 12667
M=D // 12668
@LCL // 12669
A=M+1 // 12670
D=M // 12671
@0 // 12672
A=D+A // 12673
D=M // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=D // 12678
@LCL // 12679
A=M+1 // 12680
A=A+1 // 12681
D=M // 12682
@SP // 12683
AM=M-1 // 12684
D=D|M // 12685
@SP // 12686
AM=M-1 // 12687
A=M // 12688
M=D // 12689

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

@LCL // 12690
A=M+1 // 12691
A=A+1 // 12692
A=A+1 // 12693
M=M+1 // 12694

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 12695
0;JMP // 12696

////LabelInstruction{label='Output.printChar_WHILE_END1}
// label Output.printChar_WHILE_END1
(Output.printChar_WHILE_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("constant 63"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.printChar$IF_TRUE2}}
@Output.printChar.EQ.4 // 12697
D=A // 12698
@SP // 12699
AM=M+1 // 12700
A=A-1 // 12701
M=D // 12702
@Output.1 // 12703
D=M // 12704
@63 // 12705
D=D-A // 12706
@DO_EQ // 12707
0;JMP // 12708
(Output.printChar.EQ.4)
@Output.printChar$IF_TRUE2 // 12709
D;JNE // 12710

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 12711
0;JMP // 12712

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12713
D=A // 12714
@14 // 12715
M=D // 12716
@Output.println // 12717
D=A // 12718
@13 // 12719
M=D // 12720
@Output.printChar.ret.5 // 12721
D=A // 12722
@CALL // 12723
0;JMP // 12724
(Output.printChar.ret.5)
@SP // 12725
M=M-1 // 12726

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 12727
0;JMP // 12728

////LabelInstruction{label='Output.printChar$IF_FALSE2}
// label Output.printChar$IF_FALSE2
(Output.printChar$IF_FALSE2)

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

@Output.1 // 12729
M=M+1 // 12730

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 12731
AM=M+1 // 12732
A=A-1 // 12733
M=0 // 12734
@RETURN // 12735
0;JMP // 12736

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12737
M=M+1 // 12738
AM=M+1 // 12739
A=A-1 // 12740
M=0 // 12741
A=A-1 // 12742
M=0 // 12743

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12744
A=M // 12745
M=0 // 12746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12747
A=M // 12748
D=M // 12749
@SP // 12750
AM=M+1 // 12751
A=A-1 // 12752
M=D // 12753
// call String.length
@6 // 12754
D=A // 12755
@14 // 12756
M=D // 12757
@String.length // 12758
D=A // 12759
@13 // 12760
M=D // 12761
@Output.printString.ret.0 // 12762
D=A // 12763
@CALL // 12764
0;JMP // 12765
(Output.printString.ret.0)
@SP // 12766
AM=M-1 // 12767
D=M // 12768
@LCL // 12769
A=M+1 // 12770
M=D // 12771

////LabelInstruction{label='Output.printString_WHILE_EXP1}
// label Output.printString_WHILE_EXP1
(Output.printString_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.printString_WHILE_END1}}
@Output.printString.LT.5 // 12772
D=A // 12773
@SP // 12774
AM=M+1 // 12775
A=A-1 // 12776
M=D // 12777
@LCL // 12778
A=M+1 // 12779
D=M // 12780
A=A-1 // 12781
D=M-D // 12782
@DO_LT // 12783
0;JMP // 12784
(Output.printString.LT.5)
D=!D // 12785
@Output.printString_WHILE_END1 // 12786
D;JNE // 12787

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12788
A=M // 12789
D=M // 12790
@SP // 12791
AM=M+1 // 12792
A=A-1 // 12793
M=D // 12794
@LCL // 12795
A=M // 12796
D=M // 12797
@SP // 12798
AM=M+1 // 12799
A=A-1 // 12800
M=D // 12801
// call String.charAt
@7 // 12802
D=A // 12803
@14 // 12804
M=D // 12805
@String.charAt // 12806
D=A // 12807
@13 // 12808
M=D // 12809
@Output.printString.ret.1 // 12810
D=A // 12811
@CALL // 12812
0;JMP // 12813
(Output.printString.ret.1)
// call Output.printChar
@6 // 12814
D=A // 12815
@14 // 12816
M=D // 12817
@Output.printChar // 12818
D=A // 12819
@13 // 12820
M=D // 12821
@Output.printString.ret.2 // 12822
D=A // 12823
@CALL // 12824
0;JMP // 12825
(Output.printString.ret.2)
@SP // 12826
M=M-1 // 12827

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

@LCL // 12828
A=M // 12829
M=M+1 // 12830

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 12831
0;JMP // 12832

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=0 // 12836
@RETURN // 12837
0;JMP // 12838

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12839
AM=M+1 // 12840
A=A-1 // 12841
M=0 // 12842

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12843
D=A // 12844
@SP // 12845
AM=M+1 // 12846
A=A-1 // 12847
M=D // 12848
// call String.new
@6 // 12849
D=A // 12850
@14 // 12851
M=D // 12852
@String.new // 12853
D=A // 12854
@13 // 12855
M=D // 12856
@Output.printInt.ret.0 // 12857
D=A // 12858
@CALL // 12859
0;JMP // 12860
(Output.printInt.ret.0)
@SP // 12861
AM=M-1 // 12862
D=M // 12863
@LCL // 12864
A=M // 12865
M=D // 12866

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12867
A=M // 12868
D=M // 12869
@SP // 12870
AM=M+1 // 12871
A=A-1 // 12872
M=D // 12873
@ARG // 12874
A=M // 12875
D=M // 12876
@SP // 12877
AM=M+1 // 12878
A=A-1 // 12879
M=D // 12880
// call String.setInt
@7 // 12881
D=A // 12882
@14 // 12883
M=D // 12884
@String.setInt // 12885
D=A // 12886
@13 // 12887
M=D // 12888
@Output.printInt.ret.1 // 12889
D=A // 12890
@CALL // 12891
0;JMP // 12892
(Output.printInt.ret.1)
@SP // 12893
M=M-1 // 12894

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12895
A=M // 12896
D=M // 12897
@SP // 12898
AM=M+1 // 12899
A=A-1 // 12900
M=D // 12901
// call Output.printString
@6 // 12902
D=A // 12903
@14 // 12904
M=D // 12905
@Output.printString // 12906
D=A // 12907
@13 // 12908
M=D // 12909
@Output.printInt.ret.2 // 12910
D=A // 12911
@CALL // 12912
0;JMP // 12913
(Output.printInt.ret.2)
@SP // 12914
M=M-1 // 12915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12916
A=M // 12917
D=M // 12918
@SP // 12919
AM=M+1 // 12920
A=A-1 // 12921
M=D // 12922
// call String.dispose
@6 // 12923
D=A // 12924
@14 // 12925
M=D // 12926
@String.dispose // 12927
D=A // 12928
@13 // 12929
M=D // 12930
@Output.printInt.ret.3 // 12931
D=A // 12932
@CALL // 12933
0;JMP // 12934
(Output.printInt.ret.3)
@SP // 12935
M=M-1 // 12936

////PushInstruction("constant 0")
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=0 // 12940
@RETURN // 12941
0;JMP // 12942

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12943
M=0 // 12944

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 22"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println$IF_TRUE1}}
@Output.println.EQ.6 // 12945
D=A // 12946
@SP // 12947
AM=M+1 // 12948
A=A-1 // 12949
M=D // 12950
@Output.2 // 12951
D=M // 12952
@22 // 12953
D=D-A // 12954
@DO_EQ // 12955
0;JMP // 12956
(Output.println.EQ.6)
@Output.println$IF_TRUE1 // 12957
D;JNE // 12958

////GotoInstruction{label='Output.println$IF_FALSE1}
// goto Output.println$IF_FALSE1
@Output.println$IF_FALSE1 // 12959
0;JMP // 12960

////LabelInstruction{label='Output.println$IF_TRUE1}
// label Output.println$IF_TRUE1
(Output.println$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12961
M=0 // 12962

////GotoInstruction{label='Output.println$IF_END1}
// goto Output.println$IF_END1
@Output.println$IF_END1 // 12963
0;JMP // 12964

////LabelInstruction{label='Output.println$IF_FALSE1}
// label Output.println$IF_FALSE1
(Output.println$IF_FALSE1)

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

@Output.2 // 12965
M=M+1 // 12966

////LabelInstruction{label='Output.println$IF_END1}
// label Output.println$IF_END1
(Output.println$IF_END1)

////PushInstruction("constant 0")
@SP // 12967
AM=M+1 // 12968
A=A-1 // 12969
M=0 // 12970
@RETURN // 12971
0;JMP // 12972

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.backSpace$IF_TRUE1}}
@Output.backSpace.EQ.7 // 12973
D=A // 12974
@SP // 12975
AM=M+1 // 12976
A=A-1 // 12977
M=D // 12978
@Output.1 // 12979
D=M // 12980
@DO_EQ // 12981
0;JMP // 12982
(Output.backSpace.EQ.7)
@Output.backSpace$IF_TRUE1 // 12983
D;JNE // 12984

////GotoInstruction{label='Output.backSpace$IF_FALSE1}
// goto Output.backSpace$IF_FALSE1
@Output.backSpace$IF_FALSE1 // 12985
0;JMP // 12986

////LabelInstruction{label='Output.backSpace$IF_TRUE1}
// label Output.backSpace$IF_TRUE1
(Output.backSpace$IF_TRUE1)

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

@Output.2 // 12987
M=M-1 // 12988

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12989
D=A // 12990
@Output.1 // 12991
M=D // 12992

////GotoInstruction{label='Output.backSpace$IF_END1}
// goto Output.backSpace$IF_END1
@Output.backSpace$IF_END1 // 12993
0;JMP // 12994

////LabelInstruction{label='Output.backSpace$IF_FALSE1}
// label Output.backSpace$IF_FALSE1
(Output.backSpace$IF_FALSE1)

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

@Output.1 // 12995
M=M-1 // 12996

////LabelInstruction{label='Output.backSpace$IF_END1}
// label Output.backSpace$IF_END1
(Output.backSpace$IF_END1)

////PushInstruction("constant 0")
@SP // 12997
AM=M+1 // 12998
A=A-1 // 12999
M=0 // 13000
@RETURN // 13001
0;JMP // 13002

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 13003
M=-1 // 13004

////PushInstruction("constant 0")
@SP // 13005
AM=M+1 // 13006
A=A-1 // 13007
M=0 // 13008
@RETURN // 13009
0;JMP // 13010

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13011
A=M // 13012
D=M // 13013
@Screen.0 // 13014
M=D // 13015

////PushInstruction("constant 0")
@SP // 13016
AM=M+1 // 13017
A=A-1 // 13018
M=0 // 13019
@RETURN // 13020
0;JMP // 13021

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 13022
M=M+1 // 13023
AM=M+1 // 13024
A=A-1 // 13025
M=0 // 13026
A=A-1 // 13027
M=0 // 13028

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

@ARG // 13029
A=M+1 // 13030
D=M // 13031
@SP // 13032
AM=M+1 // 13033
A=A-1 // 13034
M=D // 13035
@32 // 13036
D=A // 13037
@SP // 13038
AM=M+1 // 13039
A=A-1 // 13040
M=D // 13041
// call Math.multiply
@7 // 13042
D=A // 13043
@14 // 13044
M=D // 13045
@Math.multiply // 13046
D=A // 13047
@13 // 13048
M=D // 13049
@Screen.drawPixel.ret.0 // 13050
D=A // 13051
@CALL // 13052
0;JMP // 13053
(Screen.drawPixel.ret.0)
@ARG // 13054
A=M // 13055
D=M // 13056
@SP // 13057
AM=M+1 // 13058
A=A-1 // 13059
M=D // 13060
@16 // 13061
D=A // 13062
@SP // 13063
AM=M+1 // 13064
A=A-1 // 13065
M=D // 13066
// call Math.divide
@7 // 13067
D=A // 13068
@14 // 13069
M=D // 13070
@Math.divide // 13071
D=A // 13072
@13 // 13073
M=D // 13074
@Screen.drawPixel.ret.1 // 13075
D=A // 13076
@CALL // 13077
0;JMP // 13078
(Screen.drawPixel.ret.1)
@SP // 13079
AM=M-1 // 13080
D=M // 13081
@SP // 13082
AM=M-1 // 13083
D=D+M // 13084
@16384 // 13085
D=D+A // 13086
@LCL // 13087
A=M // 13088
M=D // 13089

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

@ARG // 13090
A=M // 13091
D=M // 13092
@15 // 13093
D=D&A // 13094
@LCL // 13095
A=M+1 // 13096
M=D // 13097

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.drawPixel.EQ.0 // 13098
D=A // 13099
@SP // 13100
AM=M+1 // 13101
A=A-1 // 13102
M=D // 13103
@Screen.0 // 13104
D=M // 13105
@DO_EQ // 13106
0;JMP // 13107
(Screen.drawPixel.EQ.0)
D=!D // 13108
@Screen.drawPixel$IF_TRUE1 // 13109
D;JNE // 13110

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 13111
0;JMP // 13112

////LabelInstruction{label='Screen.drawPixel$IF_TRUE1}
// label Screen.drawPixel$IF_TRUE1
(Screen.drawPixel$IF_TRUE1)

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
@LCL // 13113
A=M // 13114
D=M // 13115
@SP // 13116
AM=M+1 // 13117
A=A-1 // 13118
M=D // 13119
@LCL // 13120
A=M // 13121
D=M // 13122
@0 // 13123
A=D+A // 13124
D=M // 13125
@SP // 13126
AM=M+1 // 13127
A=A-1 // 13128
M=D // 13129
@LCL // 13130
A=M+1 // 13131
D=M // 13132
@SP // 13133
AM=M+1 // 13134
A=A-1 // 13135
M=D // 13136
// call Math.twoToThe
@6 // 13137
D=A // 13138
@14 // 13139
M=D // 13140
@Math.twoToThe // 13141
D=A // 13142
@13 // 13143
M=D // 13144
@Screen.drawPixel.ret.2 // 13145
D=A // 13146
@CALL // 13147
0;JMP // 13148
(Screen.drawPixel.ret.2)
@SP // 13149
AM=M-1 // 13150
D=M // 13151
@SP // 13152
AM=M-1 // 13153
D=D|M // 13154
@SP // 13155
AM=M-1 // 13156
A=M // 13157
M=D // 13158

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 13159
0;JMP // 13160

////LabelInstruction{label='Screen.drawPixel$IF_FALSE1}
// label Screen.drawPixel$IF_FALSE1
(Screen.drawPixel$IF_FALSE1)

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
@LCL // 13161
A=M // 13162
D=M // 13163
@SP // 13164
AM=M+1 // 13165
A=A-1 // 13166
M=D // 13167
@LCL // 13168
A=M // 13169
D=M // 13170
@0 // 13171
A=D+A // 13172
D=M // 13173
@SP // 13174
AM=M+1 // 13175
A=A-1 // 13176
M=D // 13177
@LCL // 13178
A=M+1 // 13179
D=M // 13180
@SP // 13181
AM=M+1 // 13182
A=A-1 // 13183
M=D // 13184
// call Math.twoToThe
@6 // 13185
D=A // 13186
@14 // 13187
M=D // 13188
@Math.twoToThe // 13189
D=A // 13190
@13 // 13191
M=D // 13192
@Screen.drawPixel.ret.3 // 13193
D=A // 13194
@CALL // 13195
0;JMP // 13196
(Screen.drawPixel.ret.3)
@SP // 13197
AM=M-1 // 13198
D=M // 13199
D=!D // 13200
@SP // 13201
AM=M-1 // 13202
D=D&M // 13203
@SP // 13204
AM=M-1 // 13205
A=M // 13206
M=D // 13207

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 13208
AM=M+1 // 13209
A=A-1 // 13210
M=0 // 13211
@RETURN // 13212
0;JMP // 13213

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 13214
D=A // 13215
@SP // 13216
AM=D+M // 13217
A=A-1 // 13218
M=0 // 13219
A=A-1 // 13220
M=0 // 13221
A=A-1 // 13222
M=0 // 13223
A=A-1 // 13224
M=0 // 13225
A=A-1 // 13226
M=0 // 13227
A=A-1 // 13228
M=0 // 13229

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

@ARG // 13230
A=M+1 // 13231
A=A+1 // 13232
D=M // 13233
A=A-1 // 13234
A=A-1 // 13235
D=D-M // 13236
@SP // 13237
AM=M+1 // 13238
A=A-1 // 13239
M=D // 13240
// call Math.abs
@6 // 13241
D=A // 13242
@14 // 13243
M=D // 13244
@Math.abs // 13245
D=A // 13246
@13 // 13247
M=D // 13248
@Screen.drawLine.ret.0 // 13249
D=A // 13250
@CALL // 13251
0;JMP // 13252
(Screen.drawLine.ret.0)
@SP // 13253
AM=M-1 // 13254
D=M // 13255
@LCL // 13256
A=M // 13257
M=D // 13258

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

@ARG // 13259
A=M+1 // 13260
A=A+1 // 13261
A=A+1 // 13262
D=M // 13263
A=A-1 // 13264
A=A-1 // 13265
D=D-M // 13266
@SP // 13267
AM=M+1 // 13268
A=A-1 // 13269
M=D // 13270
// call Math.abs
@6 // 13271
D=A // 13272
@14 // 13273
M=D // 13274
@Math.abs // 13275
D=A // 13276
@13 // 13277
M=D // 13278
@Screen.drawLine.ret.1 // 13279
D=A // 13280
@CALL // 13281
0;JMP // 13282
(Screen.drawLine.ret.1)
@SP // 13283
AM=M-1 // 13284
D=M // 13285
@LCL // 13286
A=M+1 // 13287
M=D // 13288

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.1 // 13289
D=A // 13290
@SP // 13291
AM=M+1 // 13292
A=A-1 // 13293
M=D // 13294
@ARG // 13295
A=M+1 // 13296
A=A+1 // 13297
D=M // 13298
A=A-1 // 13299
A=A-1 // 13300
D=M-D // 13301
@DO_LT // 13302
0;JMP // 13303
(Screen.drawLine.LT.1)
@Screen.drawLine$IF_TRUE1 // 13304
D;JNE // 13305

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 13306
0;JMP // 13307

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13308
A=M+1 // 13309
A=A+1 // 13310
M=1 // 13311

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 13312
0;JMP // 13313

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13314
A=M+1 // 13315
A=A+1 // 13316
M=-1 // 13317

////LabelInstruction{label='Screen.drawLine$IF_END1}
// label Screen.drawLine$IF_END1
(Screen.drawLine$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 3"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE2}}
@Screen.drawLine.LT.2 // 13318
D=A // 13319
@SP // 13320
AM=M+1 // 13321
A=A-1 // 13322
M=D // 13323
@ARG // 13324
A=M+1 // 13325
A=A+1 // 13326
A=A+1 // 13327
D=M // 13328
A=A-1 // 13329
A=A-1 // 13330
D=M-D // 13331
@DO_LT // 13332
0;JMP // 13333
(Screen.drawLine.LT.2)
@Screen.drawLine$IF_TRUE2 // 13334
D;JNE // 13335

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 13336
0;JMP // 13337

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13338
A=M+1 // 13339
A=A+1 // 13340
A=A+1 // 13341
M=1 // 13342

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 13343
0;JMP // 13344

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13345
A=M+1 // 13346
A=A+1 // 13347
A=A+1 // 13348
M=-1 // 13349

////LabelInstruction{label='Screen.drawLine$IF_END2}
// label Screen.drawLine$IF_END2
(Screen.drawLine$IF_END2)

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

@LCL // 13350
A=M+1 // 13351
D=M // 13352
A=A-1 // 13353
D=M-D // 13354
@SP // 13355
AM=M+1 // 13356
A=A-1 // 13357
M=D // 13358
@LCL // 13359
D=M // 13360
@4 // 13361
A=D+A // 13362
D=A // 13363
@R13 // 13364
M=D // 13365
@SP // 13366
AM=M-1 // 13367
D=M // 13368
@R13 // 13369
A=M // 13370
M=D // 13371

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 13372
@Screen.drawLine_WHILE_END1 // 13373
D;JNE // 13374

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 13375
A=M // 13376
D=M // 13377
@SP // 13378
AM=M+1 // 13379
A=A-1 // 13380
M=D // 13381
@ARG // 13382
A=M+1 // 13383
D=M // 13384
@SP // 13385
AM=M+1 // 13386
A=A-1 // 13387
M=D // 13388
// call Screen.drawPixel
@7 // 13389
D=A // 13390
@14 // 13391
M=D // 13392
@Screen.drawPixel // 13393
D=A // 13394
@13 // 13395
M=D // 13396
@Screen.drawLine.ret.2 // 13397
D=A // 13398
@CALL // 13399
0;JMP // 13400
(Screen.drawLine.ret.2)
@SP // 13401
M=M-1 // 13402

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("argument 2"),
//            binaryOp: "EQ"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("argument 3"),
//            binaryOp: "EQ"
//        ),
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE3}}
@Screen.drawLine.EQ.3 // 13403
D=A // 13404
@SP // 13405
AM=M+1 // 13406
A=A-1 // 13407
M=D // 13408
@ARG // 13409
A=M+1 // 13410
A=A+1 // 13411
D=M // 13412
A=A-1 // 13413
A=A-1 // 13414
D=M-D // 13415
@DO_EQ // 13416
0;JMP // 13417
(Screen.drawLine.EQ.3)
@SP // 13418
AM=M+1 // 13419
A=A-1 // 13420
M=D // 13421
@Screen.drawLine.EQ.4 // 13422
D=A // 13423
@SP // 13424
AM=M+1 // 13425
A=A-1 // 13426
M=D // 13427
@ARG // 13428
A=M+1 // 13429
A=A+1 // 13430
A=A+1 // 13431
D=M // 13432
A=A-1 // 13433
A=A-1 // 13434
D=M-D // 13435
@DO_EQ // 13436
0;JMP // 13437
(Screen.drawLine.EQ.4)
@SP // 13438
AM=M-1 // 13439
D=D&M // 13440
@Screen.drawLine$IF_TRUE3 // 13441
D;JNE // 13442

////GotoInstruction{label='Screen.drawLine$IF_FALSE3}
// goto Screen.drawLine$IF_FALSE3
@Screen.drawLine$IF_FALSE3 // 13443
0;JMP // 13444

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 13445
AM=M+1 // 13446
A=A-1 // 13447
M=0 // 13448
@RETURN // 13449
0;JMP // 13450

////LabelInstruction{label='Screen.drawLine$IF_FALSE3}
// label Screen.drawLine$IF_FALSE3
(Screen.drawLine$IF_FALSE3)

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

@LCL // 13451
D=M // 13452
@4 // 13453
A=D+A // 13454
D=M // 13455
D=D+M // 13456
@SP // 13457
AM=M+1 // 13458
A=A-1 // 13459
M=D // 13460
@LCL // 13461
D=M // 13462
@5 // 13463
A=D+A // 13464
D=A // 13465
@R13 // 13466
M=D // 13467
@SP // 13468
AM=M-1 // 13469
D=M // 13470
@R13 // 13471
A=M // 13472
M=D // 13473

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 5"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE4}}
@Screen.drawLine.GT.5 // 13474
D=A // 13475
@SP // 13476
AM=M+1 // 13477
A=A-1 // 13478
M=D // 13479
@LCL // 13480
D=M // 13481
@5 // 13482
A=D+A // 13483
D=M // 13484
@SP // 13485
AM=M+1 // 13486
A=A-1 // 13487
M=D // 13488
@LCL // 13489
A=M+1 // 13490
D=M // 13491
@SP // 13492
AM=M-1 // 13493
D=D+M // 13494
@DO_GT // 13495
0;JMP // 13496
(Screen.drawLine.GT.5)
@Screen.drawLine$IF_TRUE4 // 13497
D;JNE // 13498

////GotoInstruction{label='Screen.drawLine$IF_FALSE4}
// goto Screen.drawLine$IF_FALSE4
@Screen.drawLine$IF_FALSE4 // 13499
0;JMP // 13500

////LabelInstruction{label='Screen.drawLine$IF_TRUE4}
// label Screen.drawLine$IF_TRUE4
(Screen.drawLine$IF_TRUE4)

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

@LCL // 13501
D=M // 13502
@4 // 13503
A=D+A // 13504
D=M // 13505
A=A-1 // 13506
A=A-1 // 13507
A=A-1 // 13508
D=D-M // 13509
@SP // 13510
AM=M+1 // 13511
A=A-1 // 13512
M=D // 13513
@LCL // 13514
D=M // 13515
@4 // 13516
A=D+A // 13517
D=A // 13518
@R13 // 13519
M=D // 13520
@SP // 13521
AM=M-1 // 13522
D=M // 13523
@R13 // 13524
A=M // 13525
M=D // 13526

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

@LCL // 13527
A=M+1 // 13528
A=A+1 // 13529
D=M // 13530
@ARG // 13531
A=M // 13532
M=D+M // 13533

////LabelInstruction{label='Screen.drawLine$IF_FALSE4}
// label Screen.drawLine$IF_FALSE4
(Screen.drawLine$IF_FALSE4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE5}}
@Screen.drawLine.LT.6 // 13534
D=A // 13535
@SP // 13536
AM=M+1 // 13537
A=A-1 // 13538
M=D // 13539
@LCL // 13540
D=M // 13541
@5 // 13542
A=D+A // 13543
D=M // 13544
@SP // 13545
AM=M+1 // 13546
A=A-1 // 13547
M=D // 13548
@LCL // 13549
A=M // 13550
D=M // 13551
@SP // 13552
AM=M-1 // 13553
D=M-D // 13554
@DO_LT // 13555
0;JMP // 13556
(Screen.drawLine.LT.6)
@Screen.drawLine$IF_TRUE5 // 13557
D;JNE // 13558

////GotoInstruction{label='Screen.drawLine$IF_FALSE5}
// goto Screen.drawLine$IF_FALSE5
@Screen.drawLine$IF_FALSE5 // 13559
0;JMP // 13560

////LabelInstruction{label='Screen.drawLine$IF_TRUE5}
// label Screen.drawLine$IF_TRUE5
(Screen.drawLine$IF_TRUE5)

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

@LCL // 13561
D=M // 13562
@4 // 13563
A=D+A // 13564
D=M // 13565
@SP // 13566
AM=M+1 // 13567
A=A-1 // 13568
M=D // 13569
@LCL // 13570
A=M // 13571
D=M // 13572
@SP // 13573
AM=M-1 // 13574
D=D+M // 13575
@SP // 13576
AM=M+1 // 13577
A=A-1 // 13578
M=D // 13579
@LCL // 13580
D=M // 13581
@4 // 13582
A=D+A // 13583
D=A // 13584
@R13 // 13585
M=D // 13586
@SP // 13587
AM=M-1 // 13588
D=M // 13589
@R13 // 13590
A=M // 13591
M=D // 13592

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

@LCL // 13593
A=M+1 // 13594
A=A+1 // 13595
A=A+1 // 13596
D=M // 13597
@ARG // 13598
A=M+1 // 13599
M=D+M // 13600

////LabelInstruction{label='Screen.drawLine$IF_FALSE5}
// label Screen.drawLine$IF_FALSE5
(Screen.drawLine$IF_FALSE5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 13601
0;JMP // 13602

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13603
AM=M+1 // 13604
A=A-1 // 13605
M=0 // 13606
@RETURN // 13607
0;JMP // 13608

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 13609
AM=M+1 // 13610
A=A-1 // 13611
M=0 // 13612

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13613
A=M // 13614
D=M // 13615
@LCL // 13616
A=M // 13617
M=D // 13618

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// label Screen.drawHorizontalLine_WHILE_EXP1
(Screen.drawHorizontalLine_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Screen.drawHorizontalLine_WHILE_END1}}
@Screen.drawHorizontalLine.GT.7 // 13619
D=A // 13620
@SP // 13621
AM=M+1 // 13622
A=A-1 // 13623
M=D // 13624
@LCL // 13625
A=M // 13626
D=M // 13627
@SP // 13628
AM=M+1 // 13629
A=A-1 // 13630
M=D // 13631
@ARG // 13632
A=M+1 // 13633
D=M // 13634
@SP // 13635
AM=M-1 // 13636
D=M-D // 13637
@DO_GT // 13638
0;JMP // 13639
(Screen.drawHorizontalLine.GT.7)
@Screen.drawHorizontalLine_WHILE_END1 // 13640
D;JNE // 13641

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13642
A=M // 13643
D=M // 13644
@SP // 13645
AM=M+1 // 13646
A=A-1 // 13647
M=D // 13648
@ARG // 13649
A=M+1 // 13650
A=A+1 // 13651
D=M // 13652
@SP // 13653
AM=M+1 // 13654
A=A-1 // 13655
M=D // 13656
// call Screen.drawPixel
@7 // 13657
D=A // 13658
@14 // 13659
M=D // 13660
@Screen.drawPixel // 13661
D=A // 13662
@13 // 13663
M=D // 13664
@Screen.drawHorizontalLine.ret.0 // 13665
D=A // 13666
@CALL // 13667
0;JMP // 13668
(Screen.drawHorizontalLine.ret.0)
@SP // 13669
M=M-1 // 13670

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

@LCL // 13671
A=M // 13672
M=M+1 // 13673

////GotoInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// goto Screen.drawHorizontalLine_WHILE_EXP1
@Screen.drawHorizontalLine_WHILE_EXP1 // 13674
0;JMP // 13675

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_END1}
// label Screen.drawHorizontalLine_WHILE_END1
(Screen.drawHorizontalLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13676
AM=M+1 // 13677
A=A-1 // 13678
M=0 // 13679
@RETURN // 13680
0;JMP // 13681

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13682
D=A // 13683
@SP // 13684
AM=D+M // 13685
A=A-1 // 13686
M=0 // 13687
A=A-1 // 13688
M=0 // 13689
A=A-1 // 13690
M=0 // 13691
A=A-1 // 13692
M=0 // 13693
A=A-1 // 13694
M=0 // 13695

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13696
A=M // 13697
M=0 // 13698

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13699
A=M+1 // 13700
A=A+1 // 13701
D=M // 13702
@LCL // 13703
A=M+1 // 13704
M=D // 13705

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

@ARG // 13706
A=M+1 // 13707
A=A+1 // 13708
D=M // 13709
D=D-1 // 13710
D=-D // 13711
@LCL // 13712
A=M+1 // 13713
A=A+1 // 13714
M=D // 13715

////LabelInstruction{label='Screen.drawCircle_WHILE_EXP1}
// label Screen.drawCircle_WHILE_EXP1
(Screen.drawCircle_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle_WHILE_END1}}
@Screen.drawCircle.GT.8 // 13716
D=A // 13717
@SP // 13718
AM=M+1 // 13719
A=A-1 // 13720
M=D // 13721
@LCL // 13722
A=M+1 // 13723
D=M // 13724
A=A-1 // 13725
D=M-D // 13726
@DO_GT // 13727
0;JMP // 13728
(Screen.drawCircle.GT.8)
@Screen.drawCircle_WHILE_END1 // 13729
D;JNE // 13730

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

@ARG // 13731
A=M // 13732
D=M // 13733
@SP // 13734
AM=M+1 // 13735
A=A-1 // 13736
M=D // 13737
@LCL // 13738
A=M // 13739
D=M // 13740
@SP // 13741
AM=M-1 // 13742
D=M-D // 13743
@SP // 13744
AM=M+1 // 13745
A=A-1 // 13746
M=D // 13747
@ARG // 13748
A=M // 13749
D=M // 13750
@SP // 13751
AM=M+1 // 13752
A=A-1 // 13753
M=D // 13754
@LCL // 13755
A=M // 13756
D=M // 13757
@SP // 13758
AM=M-1 // 13759
D=D+M // 13760
@SP // 13761
AM=M+1 // 13762
A=A-1 // 13763
M=D // 13764
@ARG // 13765
A=M+1 // 13766
D=M // 13767
@SP // 13768
AM=M+1 // 13769
A=A-1 // 13770
M=D // 13771
@LCL // 13772
A=M+1 // 13773
D=M // 13774
@SP // 13775
AM=M-1 // 13776
D=D+M // 13777
@SP // 13778
AM=M+1 // 13779
A=A-1 // 13780
M=D // 13781
// call Screen.drawHorizontalLine
@8 // 13782
D=A // 13783
@14 // 13784
M=D // 13785
@Screen.drawHorizontalLine // 13786
D=A // 13787
@13 // 13788
M=D // 13789
@Screen.drawCircle.ret.0 // 13790
D=A // 13791
@CALL // 13792
0;JMP // 13793
(Screen.drawCircle.ret.0)
@SP // 13794
M=M-1 // 13795

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

@ARG // 13796
A=M // 13797
D=M // 13798
@SP // 13799
AM=M+1 // 13800
A=A-1 // 13801
M=D // 13802
@LCL // 13803
A=M // 13804
D=M // 13805
@SP // 13806
AM=M-1 // 13807
D=M-D // 13808
@SP // 13809
AM=M+1 // 13810
A=A-1 // 13811
M=D // 13812
@ARG // 13813
A=M // 13814
D=M // 13815
@SP // 13816
AM=M+1 // 13817
A=A-1 // 13818
M=D // 13819
@LCL // 13820
A=M // 13821
D=M // 13822
@SP // 13823
AM=M-1 // 13824
D=D+M // 13825
@SP // 13826
AM=M+1 // 13827
A=A-1 // 13828
M=D // 13829
@ARG // 13830
A=M+1 // 13831
D=M // 13832
@SP // 13833
AM=M+1 // 13834
A=A-1 // 13835
M=D // 13836
@LCL // 13837
A=M+1 // 13838
D=M // 13839
@SP // 13840
AM=M-1 // 13841
D=M-D // 13842
@SP // 13843
AM=M+1 // 13844
A=A-1 // 13845
M=D // 13846
// call Screen.drawHorizontalLine
@8 // 13847
D=A // 13848
@14 // 13849
M=D // 13850
@Screen.drawHorizontalLine // 13851
D=A // 13852
@13 // 13853
M=D // 13854
@Screen.drawCircle.ret.1 // 13855
D=A // 13856
@CALL // 13857
0;JMP // 13858
(Screen.drawCircle.ret.1)
@SP // 13859
M=M-1 // 13860

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

@ARG // 13861
A=M // 13862
D=M // 13863
@SP // 13864
AM=M+1 // 13865
A=A-1 // 13866
M=D // 13867
@LCL // 13868
A=M+1 // 13869
D=M // 13870
@SP // 13871
AM=M-1 // 13872
D=M-D // 13873
@SP // 13874
AM=M+1 // 13875
A=A-1 // 13876
M=D // 13877
@ARG // 13878
A=M // 13879
D=M // 13880
@SP // 13881
AM=M+1 // 13882
A=A-1 // 13883
M=D // 13884
@LCL // 13885
A=M+1 // 13886
D=M // 13887
@SP // 13888
AM=M-1 // 13889
D=D+M // 13890
@SP // 13891
AM=M+1 // 13892
A=A-1 // 13893
M=D // 13894
@ARG // 13895
A=M+1 // 13896
D=M // 13897
@SP // 13898
AM=M+1 // 13899
A=A-1 // 13900
M=D // 13901
@LCL // 13902
A=M // 13903
D=M // 13904
@SP // 13905
AM=M-1 // 13906
D=D+M // 13907
@SP // 13908
AM=M+1 // 13909
A=A-1 // 13910
M=D // 13911
// call Screen.drawHorizontalLine
@8 // 13912
D=A // 13913
@14 // 13914
M=D // 13915
@Screen.drawHorizontalLine // 13916
D=A // 13917
@13 // 13918
M=D // 13919
@Screen.drawCircle.ret.2 // 13920
D=A // 13921
@CALL // 13922
0;JMP // 13923
(Screen.drawCircle.ret.2)
@SP // 13924
M=M-1 // 13925

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

@ARG // 13926
A=M // 13927
D=M // 13928
@SP // 13929
AM=M+1 // 13930
A=A-1 // 13931
M=D // 13932
@LCL // 13933
A=M+1 // 13934
D=M // 13935
@SP // 13936
AM=M-1 // 13937
D=M-D // 13938
@SP // 13939
AM=M+1 // 13940
A=A-1 // 13941
M=D // 13942
@ARG // 13943
A=M // 13944
D=M // 13945
@SP // 13946
AM=M+1 // 13947
A=A-1 // 13948
M=D // 13949
@LCL // 13950
A=M+1 // 13951
D=M // 13952
@SP // 13953
AM=M-1 // 13954
D=D+M // 13955
@SP // 13956
AM=M+1 // 13957
A=A-1 // 13958
M=D // 13959
@ARG // 13960
A=M+1 // 13961
D=M // 13962
@SP // 13963
AM=M+1 // 13964
A=A-1 // 13965
M=D // 13966
@LCL // 13967
A=M // 13968
D=M // 13969
@SP // 13970
AM=M-1 // 13971
D=M-D // 13972
@SP // 13973
AM=M+1 // 13974
A=A-1 // 13975
M=D // 13976
// call Screen.drawHorizontalLine
@8 // 13977
D=A // 13978
@14 // 13979
M=D // 13980
@Screen.drawHorizontalLine // 13981
D=A // 13982
@13 // 13983
M=D // 13984
@Screen.drawCircle.ret.3 // 13985
D=A // 13986
@CALL // 13987
0;JMP // 13988
(Screen.drawCircle.ret.3)
@SP // 13989
M=M-1 // 13990

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.9 // 13991
D=A // 13992
@SP // 13993
AM=M+1 // 13994
A=A-1 // 13995
M=D // 13996
@LCL // 13997
A=M+1 // 13998
A=A+1 // 13999
D=M // 14000
@DO_LT // 14001
0;JMP // 14002
(Screen.drawCircle.LT.9)
@Screen.drawCircle$IF_TRUE1 // 14003
D;JNE // 14004

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 14005
0;JMP // 14006

////LabelInstruction{label='Screen.drawCircle$IF_TRUE1}
// label Screen.drawCircle$IF_TRUE1
(Screen.drawCircle$IF_TRUE1)

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

@LCL // 14007
A=M+1 // 14008
A=A+1 // 14009
D=M // 14010
@SP // 14011
AM=M+1 // 14012
A=A-1 // 14013
M=D // 14014
@LCL // 14015
A=M // 14016
D=M // 14017
D=D+M // 14018
@SP // 14019
AM=M-1 // 14020
D=D+M // 14021
@3 // 14022
D=D+A // 14023
@LCL // 14024
A=M+1 // 14025
A=A+1 // 14026
M=D // 14027

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 14028
0;JMP // 14029

////LabelInstruction{label='Screen.drawCircle$IF_FALSE1}
// label Screen.drawCircle$IF_FALSE1
(Screen.drawCircle$IF_FALSE1)

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

@LCL // 14030
A=M+1 // 14031
A=A+1 // 14032
D=M // 14033
@SP // 14034
AM=M+1 // 14035
A=A-1 // 14036
M=D // 14037
@LCL // 14038
A=M+1 // 14039
D=M // 14040
A=A-1 // 14041
D=M-D // 14042
@R13 // 14043
M=D // 14044
D=D+M // 14045
@SP // 14046
AM=M-1 // 14047
D=D+M // 14048
@5 // 14049
D=D+A // 14050
@LCL // 14051
A=M+1 // 14052
A=A+1 // 14053
M=D // 14054

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

@LCL // 14055
A=M+1 // 14056
M=M-1 // 14057

////LabelInstruction{label='Screen.drawCircle$IF_END1}
// label Screen.drawCircle$IF_END1
(Screen.drawCircle$IF_END1)

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

@LCL // 14058
A=M // 14059
M=M+1 // 14060

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 14061
0;JMP // 14062

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14063
AM=M+1 // 14064
A=A-1 // 14065
M=0 // 14066
@RETURN // 14067
0;JMP // 14068

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 14069
D=A // 14070
@SP // 14071
AM=D+M // 14072
A=A-1 // 14073
M=0 // 14074
A=A-1 // 14075
M=0 // 14076
A=A-1 // 14077
M=0 // 14078
A=A-1 // 14079
M=0 // 14080
A=A-1 // 14081
M=0 // 14082
A=A-1 // 14083
M=0 // 14084
A=A-1 // 14085
M=0 // 14086
A=A-1 // 14087
M=0 // 14088
A=A-1 // 14089
M=0 // 14090
A=A-1 // 14091
M=0 // 14092

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14093
D=M // 14094
@9 // 14095
A=D+A // 14096
M=-1 // 14097

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE1}}
@Screen.0 // 14098
D=!M // 14099
@Screen.drawRectangle$IF_TRUE1 // 14100
D;JNE // 14101

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE1}
// goto Screen.drawRectangle$IF_FALSE1
@Screen.drawRectangle$IF_FALSE1 // 14102
0;JMP // 14103

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE1}
// label Screen.drawRectangle$IF_TRUE1
(Screen.drawRectangle$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14104
D=M // 14105
@9 // 14106
A=D+A // 14107
M=0 // 14108

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE1}
// label Screen.drawRectangle$IF_FALSE1
(Screen.drawRectangle$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 14109
A=M+1 // 14110
D=M // 14111
@LCL // 14112
A=M // 14113
M=D // 14114

////LabelInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// label Screen.drawRectangle_WHILE_EXP1
(Screen.drawRectangle_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 3"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle_WHILE_END1}}
@Screen.drawRectangle.GT.10 // 14115
D=A // 14116
@SP // 14117
AM=M+1 // 14118
A=A-1 // 14119
M=D // 14120
@LCL // 14121
A=M // 14122
D=M // 14123
@SP // 14124
AM=M+1 // 14125
A=A-1 // 14126
M=D // 14127
@ARG // 14128
A=M+1 // 14129
A=A+1 // 14130
A=A+1 // 14131
D=M // 14132
@SP // 14133
AM=M-1 // 14134
D=M-D // 14135
@DO_GT // 14136
0;JMP // 14137
(Screen.drawRectangle.GT.10)
@Screen.drawRectangle_WHILE_END1 // 14138
D;JNE // 14139

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 14140
A=M // 14141
D=M // 14142
@SP // 14143
AM=M+1 // 14144
A=A-1 // 14145
M=D // 14146
@16 // 14147
D=A // 14148
@SP // 14149
AM=M+1 // 14150
A=A-1 // 14151
M=D // 14152
// call Math.divide
@7 // 14153
D=A // 14154
@14 // 14155
M=D // 14156
@Math.divide // 14157
D=A // 14158
@13 // 14159
M=D // 14160
@Screen.drawRectangle.ret.0 // 14161
D=A // 14162
@CALL // 14163
0;JMP // 14164
(Screen.drawRectangle.ret.0)
@SP // 14165
AM=M-1 // 14166
D=M // 14167
@LCL // 14168
A=M+1 // 14169
M=D // 14170

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 14171
A=M+1 // 14172
A=A+1 // 14173
D=M // 14174
@SP // 14175
AM=M+1 // 14176
A=A-1 // 14177
M=D // 14178
@16 // 14179
D=A // 14180
@SP // 14181
AM=M+1 // 14182
A=A-1 // 14183
M=D // 14184
// call Math.divide
@7 // 14185
D=A // 14186
@14 // 14187
M=D // 14188
@Math.divide // 14189
D=A // 14190
@13 // 14191
M=D // 14192
@Screen.drawRectangle.ret.1 // 14193
D=A // 14194
@CALL // 14195
0;JMP // 14196
(Screen.drawRectangle.ret.1)
@SP // 14197
AM=M-1 // 14198
D=M // 14199
@LCL // 14200
A=M+1 // 14201
A=A+1 // 14202
M=D // 14203

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

@ARG // 14204
A=M // 14205
D=M // 14206
@15 // 14207
D=D&A // 14208
@LCL // 14209
A=M+1 // 14210
A=A+1 // 14211
A=A+1 // 14212
M=D // 14213

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

@ARG // 14214
A=M+1 // 14215
A=A+1 // 14216
D=M // 14217
@15 // 14218
D=D&A // 14219
@SP // 14220
AM=M+1 // 14221
A=A-1 // 14222
M=D // 14223
@LCL // 14224
D=M // 14225
@4 // 14226
A=D+A // 14227
D=A // 14228
@R13 // 14229
M=D // 14230
@SP // 14231
AM=M-1 // 14232
D=M // 14233
@R13 // 14234
A=M // 14235
M=D // 14236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 14237
A=M // 14238
D=M // 14239
@SP // 14240
AM=M+1 // 14241
A=A-1 // 14242
M=D // 14243
@32 // 14244
D=A // 14245
@SP // 14246
AM=M+1 // 14247
A=A-1 // 14248
M=D // 14249
// call Math.multiply
@7 // 14250
D=A // 14251
@14 // 14252
M=D // 14253
@Math.multiply // 14254
D=A // 14255
@13 // 14256
M=D // 14257
@Screen.drawRectangle.ret.2 // 14258
D=A // 14259
@CALL // 14260
0;JMP // 14261
(Screen.drawRectangle.ret.2)
@LCL // 14262
D=M // 14263
@5 // 14264
A=D+A // 14265
D=A // 14266
@R13 // 14267
M=D // 14268
@SP // 14269
AM=M-1 // 14270
D=M // 14271
@R13 // 14272
A=M // 14273
M=D // 14274

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE2}}
@Screen.drawRectangle.EQ.11 // 14275
D=A // 14276
@SP // 14277
AM=M+1 // 14278
A=A-1 // 14279
M=D // 14280
@LCL // 14281
A=M+1 // 14282
A=A+1 // 14283
D=M // 14284
A=A-1 // 14285
D=M-D // 14286
@DO_EQ // 14287
0;JMP // 14288
(Screen.drawRectangle.EQ.11)
@Screen.drawRectangle$IF_TRUE2 // 14289
D;JNE // 14290

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE2}
// goto Screen.drawRectangle$IF_FALSE2
@Screen.drawRectangle$IF_FALSE2 // 14291
0;JMP // 14292

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE2}
// label Screen.drawRectangle$IF_TRUE2
(Screen.drawRectangle$IF_TRUE2)

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

@LCL // 14293
D=M // 14294
@4 // 14295
A=D+A // 14296
D=M // 14297
@SP // 14298
AM=M+1 // 14299
A=A-1 // 14300
M=D+1 // 14301
// call Math.twoToThe
@6 // 14302
D=A // 14303
@14 // 14304
M=D // 14305
@Math.twoToThe // 14306
D=A // 14307
@13 // 14308
M=D // 14309
@Screen.drawRectangle.ret.3 // 14310
D=A // 14311
@CALL // 14312
0;JMP // 14313
(Screen.drawRectangle.ret.3)
@SP // 14314
AM=M-1 // 14315
D=M // 14316
D=D-1 // 14317
@SP // 14318
AM=M+1 // 14319
A=A-1 // 14320
M=D // 14321
@LCL // 14322
A=M+1 // 14323
A=A+1 // 14324
A=A+1 // 14325
D=M // 14326
@SP // 14327
AM=M+1 // 14328
A=A-1 // 14329
M=D // 14330
// call Math.twoToThe
@6 // 14331
D=A // 14332
@14 // 14333
M=D // 14334
@Math.twoToThe // 14335
D=A // 14336
@13 // 14337
M=D // 14338
@Screen.drawRectangle.ret.4 // 14339
D=A // 14340
@CALL // 14341
0;JMP // 14342
(Screen.drawRectangle.ret.4)
@SP // 14343
AM=M-1 // 14344
D=M // 14345
D=D-1 // 14346
@SP // 14347
AM=M-1 // 14348
D=M-D // 14349
@SP // 14350
AM=M+1 // 14351
A=A-1 // 14352
M=D // 14353
@LCL // 14354
D=M // 14355
@6 // 14356
A=D+A // 14357
D=A // 14358
@R13 // 14359
M=D // 14360
@SP // 14361
AM=M-1 // 14362
D=M // 14363
@R13 // 14364
A=M // 14365
M=D // 14366

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

@LCL // 14367
D=M // 14368
@5 // 14369
A=D+A // 14370
D=M // 14371
@SP // 14372
AM=M+1 // 14373
A=A-1 // 14374
M=D // 14375
@LCL // 14376
A=M+1 // 14377
D=M // 14378
@SP // 14379
AM=M-1 // 14380
D=D+M // 14381
@SP // 14382
AM=M+1 // 14383
A=A-1 // 14384
M=D // 14385
@LCL // 14386
D=M // 14387
@7 // 14388
A=D+A // 14389
D=A // 14390
@R13 // 14391
M=D // 14392
@SP // 14393
AM=M-1 // 14394
D=M // 14395
@R13 // 14396
A=M // 14397
M=D // 14398

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE3}}
@Screen.0 // 14399
D=M // 14400
@Screen.drawRectangle$IF_TRUE3 // 14401
D;JNE // 14402

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE3}
// goto Screen.drawRectangle$IF_FALSE3
@Screen.drawRectangle$IF_FALSE3 // 14403
0;JMP // 14404

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE3}
// label Screen.drawRectangle$IF_TRUE3
(Screen.drawRectangle$IF_TRUE3)

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
@LCL // 14405
D=M // 14406
@7 // 14407
A=D+A // 14408
D=M // 14409
@16384 // 14410
D=D+A // 14411
@SP // 14412
AM=M+1 // 14413
A=A-1 // 14414
M=D // 14415
@LCL // 14416
D=M // 14417
@7 // 14418
A=D+A // 14419
D=M // 14420
@16384 // 14421
A=D+A // 14422
D=M // 14423
@SP // 14424
AM=M+1 // 14425
A=A-1 // 14426
M=D // 14427
@LCL // 14428
D=M // 14429
@6 // 14430
A=D+A // 14431
D=M // 14432
@SP // 14433
AM=M-1 // 14434
D=D|M // 14435
@SP // 14436
AM=M-1 // 14437
A=M // 14438
M=D // 14439

////GotoInstruction{label='Screen.drawRectangle$IF_END3}
// goto Screen.drawRectangle$IF_END3
@Screen.drawRectangle$IF_END3 // 14440
0;JMP // 14441

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE3}
// label Screen.drawRectangle$IF_FALSE3
(Screen.drawRectangle$IF_FALSE3)

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
@LCL // 14442
D=M // 14443
@7 // 14444
A=D+A // 14445
D=M // 14446
@16384 // 14447
D=D+A // 14448
@SP // 14449
AM=M+1 // 14450
A=A-1 // 14451
M=D // 14452
@LCL // 14453
D=M // 14454
@7 // 14455
A=D+A // 14456
D=M // 14457
@16384 // 14458
A=D+A // 14459
D=M // 14460
@SP // 14461
AM=M+1 // 14462
A=A-1 // 14463
M=D // 14464
@LCL // 14465
D=M // 14466
@6 // 14467
A=D+A // 14468
D=!M // 14469
@SP // 14470
AM=M-1 // 14471
D=D&M // 14472
@SP // 14473
AM=M-1 // 14474
A=M // 14475
M=D // 14476

////LabelInstruction{label='Screen.drawRectangle$IF_END3}
// label Screen.drawRectangle$IF_END3
(Screen.drawRectangle$IF_END3)

////GotoInstruction{label='Screen.drawRectangle$IF_END2}
// goto Screen.drawRectangle$IF_END2
@Screen.drawRectangle$IF_END2 // 14477
0;JMP // 14478

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE2}
// label Screen.drawRectangle$IF_FALSE2
(Screen.drawRectangle$IF_FALSE2)

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

@LCL // 14479
A=M+1 // 14480
A=A+1 // 14481
A=A+1 // 14482
D=M // 14483
@SP // 14484
AM=M+1 // 14485
A=A-1 // 14486
M=D // 14487
// call Math.twoToThe
@6 // 14488
D=A // 14489
@14 // 14490
M=D // 14491
@Math.twoToThe // 14492
D=A // 14493
@13 // 14494
M=D // 14495
@Screen.drawRectangle.ret.5 // 14496
D=A // 14497
@CALL // 14498
0;JMP // 14499
(Screen.drawRectangle.ret.5)
@SP // 14500
AM=M-1 // 14501
D=M // 14502
D=D-1 // 14503
@SP // 14504
AM=M+1 // 14505
A=A-1 // 14506
M=D // 14507
@SP // 14508
A=M-1 // 14509
M=!D // 14510
@LCL // 14511
D=M // 14512
@6 // 14513
A=D+A // 14514
D=A // 14515
@R13 // 14516
M=D // 14517
@SP // 14518
AM=M-1 // 14519
D=M // 14520
@R13 // 14521
A=M // 14522
M=D // 14523

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

@LCL // 14524
D=M // 14525
@5 // 14526
A=D+A // 14527
D=M // 14528
@SP // 14529
AM=M+1 // 14530
A=A-1 // 14531
M=D // 14532
@LCL // 14533
A=M+1 // 14534
D=M // 14535
@SP // 14536
AM=M-1 // 14537
D=D+M // 14538
@SP // 14539
AM=M+1 // 14540
A=A-1 // 14541
M=D // 14542
@LCL // 14543
D=M // 14544
@7 // 14545
A=D+A // 14546
D=A // 14547
@R13 // 14548
M=D // 14549
@SP // 14550
AM=M-1 // 14551
D=M // 14552
@R13 // 14553
A=M // 14554
M=D // 14555

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE4}}
@Screen.0 // 14556
D=M // 14557
@Screen.drawRectangle$IF_TRUE4 // 14558
D;JNE // 14559

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE4}
// goto Screen.drawRectangle$IF_FALSE4
@Screen.drawRectangle$IF_FALSE4 // 14560
0;JMP // 14561

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE4}
// label Screen.drawRectangle$IF_TRUE4
(Screen.drawRectangle$IF_TRUE4)

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
@LCL // 14562
D=M // 14563
@7 // 14564
A=D+A // 14565
D=M // 14566
@16384 // 14567
D=D+A // 14568
@SP // 14569
AM=M+1 // 14570
A=A-1 // 14571
M=D // 14572
@LCL // 14573
D=M // 14574
@7 // 14575
A=D+A // 14576
D=M // 14577
@16384 // 14578
A=D+A // 14579
D=M // 14580
@SP // 14581
AM=M+1 // 14582
A=A-1 // 14583
M=D // 14584
@LCL // 14585
D=M // 14586
@6 // 14587
A=D+A // 14588
D=M // 14589
@SP // 14590
AM=M-1 // 14591
D=D|M // 14592
@SP // 14593
AM=M-1 // 14594
A=M // 14595
M=D // 14596

////GotoInstruction{label='Screen.drawRectangle$IF_END4}
// goto Screen.drawRectangle$IF_END4
@Screen.drawRectangle$IF_END4 // 14597
0;JMP // 14598

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE4}
// label Screen.drawRectangle$IF_FALSE4
(Screen.drawRectangle$IF_FALSE4)

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
@LCL // 14599
D=M // 14600
@7 // 14601
A=D+A // 14602
D=M // 14603
@16384 // 14604
D=D+A // 14605
@SP // 14606
AM=M+1 // 14607
A=A-1 // 14608
M=D // 14609
@LCL // 14610
D=M // 14611
@7 // 14612
A=D+A // 14613
D=M // 14614
@16384 // 14615
A=D+A // 14616
D=M // 14617
@SP // 14618
AM=M+1 // 14619
A=A-1 // 14620
M=D // 14621
@LCL // 14622
D=M // 14623
@6 // 14624
A=D+A // 14625
D=!M // 14626
@SP // 14627
AM=M-1 // 14628
D=D&M // 14629
@SP // 14630
AM=M-1 // 14631
A=M // 14632
M=D // 14633

////LabelInstruction{label='Screen.drawRectangle$IF_END4}
// label Screen.drawRectangle$IF_END4
(Screen.drawRectangle$IF_END4)

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

@LCL // 14634
A=M+1 // 14635
D=M // 14636
@SP // 14637
AM=M+1 // 14638
A=A-1 // 14639
M=D+1 // 14640
@LCL // 14641
D=M // 14642
@8 // 14643
A=D+A // 14644
D=A // 14645
@R13 // 14646
M=D // 14647
@SP // 14648
AM=M-1 // 14649
D=M // 14650
@R13 // 14651
A=M // 14652
M=D // 14653

////LabelInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// label Screen.drawRectangle_WHILE_EXP2
(Screen.drawRectangle_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 8"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle_WHILE_END2}}
@Screen.drawRectangle.LT.12 // 14654
D=A // 14655
@SP // 14656
AM=M+1 // 14657
A=A-1 // 14658
M=D // 14659
@LCL // 14660
D=M // 14661
@8 // 14662
A=D+A // 14663
D=M // 14664
@SP // 14665
AM=M+1 // 14666
A=A-1 // 14667
M=D // 14668
@LCL // 14669
A=M+1 // 14670
A=A+1 // 14671
D=M // 14672
@SP // 14673
AM=M-1 // 14674
D=M-D // 14675
@DO_LT // 14676
0;JMP // 14677
(Screen.drawRectangle.LT.12)
D=!D // 14678
@Screen.drawRectangle_WHILE_END2 // 14679
D;JNE // 14680

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

@LCL // 14681
D=M // 14682
@8 // 14683
A=D+A // 14684
D=M // 14685
A=A-1 // 14686
A=A-1 // 14687
A=A-1 // 14688
D=D+M // 14689
@SP // 14690
AM=M+1 // 14691
A=A-1 // 14692
M=D // 14693
@LCL // 14694
D=M // 14695
@7 // 14696
A=D+A // 14697
D=A // 14698
@R13 // 14699
M=D // 14700
@SP // 14701
AM=M-1 // 14702
D=M // 14703
@R13 // 14704
A=M // 14705
M=D // 14706

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14707
D=M // 14708
@7 // 14709
A=D+A // 14710
D=M // 14711
@16384 // 14712
D=D+A // 14713
@SP // 14714
AM=M+1 // 14715
A=A-1 // 14716
M=D // 14717
@LCL // 14718
D=M // 14719
@9 // 14720
A=D+A // 14721
D=M // 14722
@SP // 14723
AM=M-1 // 14724
A=M // 14725
M=D // 14726

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

@LCL // 14727
D=M // 14728
@8 // 14729
A=D+A // 14730
M=M+1 // 14731

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// goto Screen.drawRectangle_WHILE_EXP2
@Screen.drawRectangle_WHILE_EXP2 // 14732
0;JMP // 14733

////LabelInstruction{label='Screen.drawRectangle_WHILE_END2}
// label Screen.drawRectangle_WHILE_END2
(Screen.drawRectangle_WHILE_END2)

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

@LCL // 14734
D=M // 14735
@4 // 14736
A=D+A // 14737
D=M // 14738
@SP // 14739
AM=M+1 // 14740
A=A-1 // 14741
M=D+1 // 14742
// call Math.twoToThe
@6 // 14743
D=A // 14744
@14 // 14745
M=D // 14746
@Math.twoToThe // 14747
D=A // 14748
@13 // 14749
M=D // 14750
@Screen.drawRectangle.ret.6 // 14751
D=A // 14752
@CALL // 14753
0;JMP // 14754
(Screen.drawRectangle.ret.6)
@SP // 14755
AM=M-1 // 14756
D=M // 14757
D=D-1 // 14758
@SP // 14759
AM=M+1 // 14760
A=A-1 // 14761
M=D // 14762
@LCL // 14763
D=M // 14764
@6 // 14765
A=D+A // 14766
D=A // 14767
@R13 // 14768
M=D // 14769
@SP // 14770
AM=M-1 // 14771
D=M // 14772
@R13 // 14773
A=M // 14774
M=D // 14775

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

@LCL // 14776
D=M // 14777
@5 // 14778
A=D+A // 14779
D=M // 14780
A=A-1 // 14781
A=A-1 // 14782
A=A-1 // 14783
D=D+M // 14784
@SP // 14785
AM=M+1 // 14786
A=A-1 // 14787
M=D // 14788
@LCL // 14789
D=M // 14790
@7 // 14791
A=D+A // 14792
D=A // 14793
@R13 // 14794
M=D // 14795
@SP // 14796
AM=M-1 // 14797
D=M // 14798
@R13 // 14799
A=M // 14800
M=D // 14801

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE5}}
@Screen.0 // 14802
D=M // 14803
@Screen.drawRectangle$IF_TRUE5 // 14804
D;JNE // 14805

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE5}
// goto Screen.drawRectangle$IF_FALSE5
@Screen.drawRectangle$IF_FALSE5 // 14806
0;JMP // 14807

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE5}
// label Screen.drawRectangle$IF_TRUE5
(Screen.drawRectangle$IF_TRUE5)

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
@LCL // 14808
D=M // 14809
@7 // 14810
A=D+A // 14811
D=M // 14812
@16384 // 14813
D=D+A // 14814
@SP // 14815
AM=M+1 // 14816
A=A-1 // 14817
M=D // 14818
@LCL // 14819
D=M // 14820
@7 // 14821
A=D+A // 14822
D=M // 14823
@16384 // 14824
A=D+A // 14825
D=M // 14826
@SP // 14827
AM=M+1 // 14828
A=A-1 // 14829
M=D // 14830
@LCL // 14831
D=M // 14832
@6 // 14833
A=D+A // 14834
D=M // 14835
@SP // 14836
AM=M-1 // 14837
D=D|M // 14838
@SP // 14839
AM=M-1 // 14840
A=M // 14841
M=D // 14842

////GotoInstruction{label='Screen.drawRectangle$IF_END5}
// goto Screen.drawRectangle$IF_END5
@Screen.drawRectangle$IF_END5 // 14843
0;JMP // 14844

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE5}
// label Screen.drawRectangle$IF_FALSE5
(Screen.drawRectangle$IF_FALSE5)

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
@LCL // 14845
D=M // 14846
@7 // 14847
A=D+A // 14848
D=M // 14849
@16384 // 14850
D=D+A // 14851
@SP // 14852
AM=M+1 // 14853
A=A-1 // 14854
M=D // 14855
@LCL // 14856
D=M // 14857
@7 // 14858
A=D+A // 14859
D=M // 14860
@16384 // 14861
A=D+A // 14862
D=M // 14863
@SP // 14864
AM=M+1 // 14865
A=A-1 // 14866
M=D // 14867
@LCL // 14868
D=M // 14869
@6 // 14870
A=D+A // 14871
D=!M // 14872
@SP // 14873
AM=M-1 // 14874
D=D&M // 14875
@SP // 14876
AM=M-1 // 14877
A=M // 14878
M=D // 14879

////LabelInstruction{label='Screen.drawRectangle$IF_END5}
// label Screen.drawRectangle$IF_END5
(Screen.drawRectangle$IF_END5)

////LabelInstruction{label='Screen.drawRectangle$IF_END2}
// label Screen.drawRectangle$IF_END2
(Screen.drawRectangle$IF_END2)

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

@LCL // 14880
A=M // 14881
M=M+1 // 14882

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// goto Screen.drawRectangle_WHILE_EXP1
@Screen.drawRectangle_WHILE_EXP1 // 14883
0;JMP // 14884

////LabelInstruction{label='Screen.drawRectangle_WHILE_END1}
// label Screen.drawRectangle_WHILE_END1
(Screen.drawRectangle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14885
AM=M+1 // 14886
A=A-1 // 14887
M=0 // 14888
@RETURN // 14889
0;JMP // 14890

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14891
AM=M+1 // 14892
A=A-1 // 14893
M=0 // 14894

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14895
A=M // 14896
M=0 // 14897

////LabelInstruction{label='Screen.clearScreen_WHILE_EXP1}
// label Screen.clearScreen_WHILE_EXP1
(Screen.clearScreen_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 8192"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.clearScreen_WHILE_END1}}
@Screen.clearScreen.LT.13 // 14898
D=A // 14899
@SP // 14900
AM=M+1 // 14901
A=A-1 // 14902
M=D // 14903
@LCL // 14904
A=M // 14905
D=M // 14906
@8192 // 14907
D=D-A // 14908
@DO_LT // 14909
0;JMP // 14910
(Screen.clearScreen.LT.13)
D=!D // 14911
@Screen.clearScreen_WHILE_END1 // 14912
D;JNE // 14913

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14914
A=M // 14915
D=M // 14916
@16384 // 14917
D=D+A // 14918
@SP // 14919
AM=M+1 // 14920
A=A-1 // 14921
M=D // 14922
D=0 // 14923
@SP // 14924
AM=M-1 // 14925
A=M // 14926
M=D // 14927

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

@LCL // 14928
A=M // 14929
M=M+1 // 14930

////GotoInstruction{label='Screen.clearScreen_WHILE_EXP1}
// goto Screen.clearScreen_WHILE_EXP1
@Screen.clearScreen_WHILE_EXP1 // 14931
0;JMP // 14932

////LabelInstruction{label='Screen.clearScreen_WHILE_END1}
// label Screen.clearScreen_WHILE_END1
(Screen.clearScreen_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14933
AM=M+1 // 14934
A=A-1 // 14935
M=0 // 14936
@RETURN // 14937
0;JMP // 14938

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14939
D=A // 14940
@SP // 14941
AM=M+1 // 14942
A=A-1 // 14943
M=D // 14944
// call Memory.alloc
@6 // 14945
D=A // 14946
@14 // 14947
M=D // 14948
@Memory.alloc // 14949
D=A // 14950
@13 // 14951
M=D // 14952
@String.new.ret.0 // 14953
D=A // 14954
@CALL // 14955
0;JMP // 14956
(String.new.ret.0)
@SP // 14957
AM=M-1 // 14958
D=M // 14959
@3 // 14960
M=D // 14961

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.0 // 14962
D=A // 14963
@SP // 14964
AM=M+1 // 14965
A=A-1 // 14966
M=D // 14967
@ARG // 14968
A=M // 14969
D=M // 14970
@DO_EQ // 14971
0;JMP // 14972
(String.new.EQ.0)
@String.new$IF_TRUE1 // 14973
D;JNE // 14974

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 14975
0;JMP // 14976

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14977
A=M // 14978
M=0 // 14979

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 14980
0;JMP // 14981

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14982
A=M // 14983
D=M // 14984
@SP // 14985
AM=M+1 // 14986
A=A-1 // 14987
M=D // 14988
// call Array.new
@6 // 14989
D=A // 14990
@14 // 14991
M=D // 14992
@Array.new // 14993
D=A // 14994
@13 // 14995
M=D // 14996
@String.new.ret.1 // 14997
D=A // 14998
@CALL // 14999
0;JMP // 15000
(String.new.ret.1)
@SP // 15001
AM=M-1 // 15002
D=M // 15003
@THIS // 15004
A=M // 15005
M=D // 15006

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 15007
A=M // 15008
D=M // 15009
@THIS // 15010
A=M+1 // 15011
A=A+1 // 15012
M=D // 15013

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 15014
A=M+1 // 15015
M=0 // 15016

////PushInstruction("pointer 0")
@3 // 15017
D=M // 15018
@SP // 15019
AM=M+1 // 15020
A=A-1 // 15021
M=D // 15022
@RETURN // 15023
0;JMP // 15024

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15025
A=M // 15026
D=M // 15027
@3 // 15028
M=D // 15029

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.dispose$IF_TRUE1}}
@String.dispose.EQ.1 // 15030
D=A // 15031
@SP // 15032
AM=M+1 // 15033
A=A-1 // 15034
M=D // 15035
@THIS // 15036
A=M // 15037
D=M // 15038
@DO_EQ // 15039
0;JMP // 15040
(String.dispose.EQ.1)
D=!D // 15041
@String.dispose$IF_TRUE1 // 15042
D;JNE // 15043

////GotoInstruction{label='String.dispose$IF_FALSE1}
// goto String.dispose$IF_FALSE1
@String.dispose$IF_FALSE1 // 15044
0;JMP // 15045

////LabelInstruction{label='String.dispose$IF_TRUE1}
// label String.dispose$IF_TRUE1
(String.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15046
A=M // 15047
D=M // 15048
@SP // 15049
AM=M+1 // 15050
A=A-1 // 15051
M=D // 15052
// call Array.dispose
@6 // 15053
D=A // 15054
@14 // 15055
M=D // 15056
@Array.dispose // 15057
D=A // 15058
@13 // 15059
M=D // 15060
@String.dispose.ret.0 // 15061
D=A // 15062
@CALL // 15063
0;JMP // 15064
(String.dispose.ret.0)
@SP // 15065
M=M-1 // 15066

////LabelInstruction{label='String.dispose$IF_FALSE1}
// label String.dispose$IF_FALSE1
(String.dispose$IF_FALSE1)

////PushInstruction("constant 0")
@SP // 15067
AM=M+1 // 15068
A=A-1 // 15069
M=0 // 15070
@RETURN // 15071
0;JMP // 15072

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15073
A=M // 15074
D=M // 15075
@3 // 15076
M=D // 15077

////PushInstruction("this 1")
@THIS // 15078
A=M+1 // 15079
D=M // 15080
@SP // 15081
AM=M+1 // 15082
A=A-1 // 15083
M=D // 15084
@RETURN // 15085
0;JMP // 15086

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15087
A=M // 15088
D=M // 15089
@3 // 15090
M=D // 15091

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
@THIS // 15092
A=M // 15093
D=M // 15094
@SP // 15095
AM=M+1 // 15096
A=A-1 // 15097
M=D // 15098
@ARG // 15099
A=M+1 // 15100
D=M // 15101
@SP // 15102
AM=M-1 // 15103
A=D+M // 15104
D=M // 15105
@SP // 15106
AM=M+1 // 15107
A=A-1 // 15108
M=D // 15109
@RETURN // 15110
0;JMP // 15111

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15112
A=M // 15113
D=M // 15114
@3 // 15115
M=D // 15116

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 15117
A=M // 15118
D=M // 15119
@SP // 15120
AM=M+1 // 15121
A=A-1 // 15122
M=D // 15123
@ARG // 15124
A=M+1 // 15125
D=M // 15126
@SP // 15127
AM=M-1 // 15128
D=D+M // 15129
@SP // 15130
AM=M+1 // 15131
A=A-1 // 15132
M=D // 15133
@ARG // 15134
A=M+1 // 15135
A=A+1 // 15136
D=M // 15137
@SP // 15138
AM=M-1 // 15139
A=M // 15140
M=D // 15141

////PushInstruction("constant 0")
@SP // 15142
AM=M+1 // 15143
A=A-1 // 15144
M=0 // 15145
@RETURN // 15146
0;JMP // 15147

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 15148
AM=M+1 // 15149
A=A-1 // 15150
M=0 // 15151

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15152
A=M // 15153
D=M // 15154
@3 // 15155
M=D // 15156

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.2 // 15157
D=A // 15158
@SP // 15159
AM=M+1 // 15160
A=A-1 // 15161
M=D // 15162
@THIS // 15163
A=M+1 // 15164
A=A+1 // 15165
D=M // 15166
A=A-1 // 15167
D=M-D // 15168
@DO_EQ // 15169
0;JMP // 15170
(String.appendChar.EQ.2)
@String.appendChar$IF_TRUE1 // 15171
D;JNE // 15172

////GotoInstruction{label='String.appendChar$IF_FALSE1}
// goto String.appendChar$IF_FALSE1
@String.appendChar$IF_FALSE1 // 15173
0;JMP // 15174

////LabelInstruction{label='String.appendChar$IF_TRUE1}
// label String.appendChar$IF_TRUE1
(String.appendChar$IF_TRUE1)

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

@THIS // 15175
A=M+1 // 15176
A=A+1 // 15177
D=M // 15178
D=D+M // 15179
@SP // 15180
AM=M+1 // 15181
A=A-1 // 15182
M=D // 15183
// call Array.new
@6 // 15184
D=A // 15185
@14 // 15186
M=D // 15187
@Array.new // 15188
D=A // 15189
@13 // 15190
M=D // 15191
@String.appendChar.ret.0 // 15192
D=A // 15193
@CALL // 15194
0;JMP // 15195
(String.appendChar.ret.0)
@SP // 15196
AM=M-1 // 15197
D=M // 15198
@LCL // 15199
A=M // 15200
M=D // 15201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15202
A=M // 15203
D=M // 15204
@SP // 15205
AM=M+1 // 15206
A=A-1 // 15207
M=D // 15208
@LCL // 15209
A=M // 15210
D=M // 15211
@SP // 15212
AM=M+1 // 15213
A=A-1 // 15214
M=D // 15215
@THIS // 15216
A=M+1 // 15217
D=M // 15218
@SP // 15219
AM=M+1 // 15220
A=A-1 // 15221
M=D // 15222
// call Memory.copy
@8 // 15223
D=A // 15224
@14 // 15225
M=D // 15226
@Memory.copy // 15227
D=A // 15228
@13 // 15229
M=D // 15230
@String.appendChar.ret.1 // 15231
D=A // 15232
@CALL // 15233
0;JMP // 15234
(String.appendChar.ret.1)
@SP // 15235
M=M-1 // 15236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15237
A=M // 15238
D=M // 15239
@SP // 15240
AM=M+1 // 15241
A=A-1 // 15242
M=D // 15243
// call Array.dispose
@6 // 15244
D=A // 15245
@14 // 15246
M=D // 15247
@Array.dispose // 15248
D=A // 15249
@13 // 15250
M=D // 15251
@String.appendChar.ret.2 // 15252
D=A // 15253
@CALL // 15254
0;JMP // 15255
(String.appendChar.ret.2)
@SP // 15256
M=M-1 // 15257

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

@THIS // 15258
A=M+1 // 15259
A=A+1 // 15260
D=M // 15261
@THIS // 15262
A=M+1 // 15263
A=A+1 // 15264
M=D+M // 15265

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 15266
A=M // 15267
D=M // 15268
@THIS // 15269
A=M // 15270
M=D // 15271

////LabelInstruction{label='String.appendChar$IF_FALSE1}
// label String.appendChar$IF_FALSE1
(String.appendChar$IF_FALSE1)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("this 1"),
//    binaryOp: "ADD"
//)}
@THIS // 15272
A=M+1 // 15273
D=M // 15274
A=A-1 // 15275
D=D+M // 15276
@SP // 15277
AM=M+1 // 15278
A=A-1 // 15279
M=D // 15280
@ARG // 15281
A=M+1 // 15282
D=M // 15283
@SP // 15284
AM=M-1 // 15285
A=M // 15286
M=D // 15287

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

@THIS // 15288
A=M+1 // 15289
M=M+1 // 15290

////PushInstruction("pointer 0")
@3 // 15291
D=M // 15292
@SP // 15293
AM=M+1 // 15294
A=A-1 // 15295
M=D // 15296
@RETURN // 15297
0;JMP // 15298

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15299
A=M // 15300
D=M // 15301
@3 // 15302
M=D // 15303

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

@THIS // 15304
A=M+1 // 15305
M=M-1 // 15306

////PushInstruction("constant 0")
@SP // 15307
AM=M+1 // 15308
A=A-1 // 15309
M=0 // 15310
@RETURN // 15311
0;JMP // 15312

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 15313
M=M+1 // 15314
AM=M+1 // 15315
A=A-1 // 15316
M=0 // 15317
A=A-1 // 15318
M=0 // 15319

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15320
A=M // 15321
D=M // 15322
@3 // 15323
M=D // 15324

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15325
A=M+1 // 15326
M=1 // 15327

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 15328
A=M // 15329
M=0 // 15330

////LabelInstruction{label='String.intValue_WHILE_EXP1}
// label String.intValue_WHILE_EXP1
(String.intValue_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("this 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.intValue_WHILE_END1}}
@String.intValue.LT.3 // 15331
D=A // 15332
@SP // 15333
AM=M+1 // 15334
A=A-1 // 15335
M=D // 15336
@LCL // 15337
A=M+1 // 15338
D=M // 15339
@SP // 15340
AM=M+1 // 15341
A=A-1 // 15342
M=D // 15343
@THIS // 15344
A=M+1 // 15345
D=M // 15346
@SP // 15347
AM=M-1 // 15348
D=M-D // 15349
@DO_LT // 15350
0;JMP // 15351
(String.intValue.LT.3)
D=!D // 15352
@String.intValue_WHILE_END1 // 15353
D;JNE // 15354

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

@LCL // 15355
A=M // 15356
D=M // 15357
@SP // 15358
AM=M+1 // 15359
A=A-1 // 15360
M=D // 15361
@10 // 15362
D=A // 15363
@SP // 15364
AM=M+1 // 15365
A=A-1 // 15366
M=D // 15367
// call Math.multiply
@7 // 15368
D=A // 15369
@14 // 15370
M=D // 15371
@Math.multiply // 15372
D=A // 15373
@13 // 15374
M=D // 15375
@String.intValue.ret.0 // 15376
D=A // 15377
@CALL // 15378
0;JMP // 15379
(String.intValue.ret.0)
@THIS // 15380
A=M // 15381
D=M // 15382
@SP // 15383
AM=M+1 // 15384
A=A-1 // 15385
M=D // 15386
@LCL // 15387
A=M+1 // 15388
D=M // 15389
@SP // 15390
AM=M-1 // 15391
A=D+M // 15392
D=M // 15393
@48 // 15394
D=D-A // 15395
@SP // 15396
AM=M-1 // 15397
D=D+M // 15398
@LCL // 15399
A=M // 15400
M=D // 15401

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

@LCL // 15402
A=M+1 // 15403
M=M+1 // 15404

////GotoInstruction{label='String.intValue_WHILE_EXP1}
// goto String.intValue_WHILE_EXP1
@String.intValue_WHILE_EXP1 // 15405
0;JMP // 15406

////LabelInstruction{label='String.intValue_WHILE_END1}
// label String.intValue_WHILE_END1
(String.intValue_WHILE_END1)

////PushInstruction("local 0")
@LCL // 15407
A=M // 15408
D=M // 15409
@SP // 15410
AM=M+1 // 15411
A=A-1 // 15412
M=D // 15413
@RETURN // 15414
0;JMP // 15415

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 15416
D=A // 15417
@SP // 15418
AM=D+M // 15419
A=A-1 // 15420
M=0 // 15421
A=A-1 // 15422
M=0 // 15423
A=A-1 // 15424
M=0 // 15425
A=A-1 // 15426
M=0 // 15427
A=A-1 // 15428
M=0 // 15429
A=A-1 // 15430
M=0 // 15431

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15432
A=M // 15433
D=M // 15434
@3 // 15435
M=D // 15436

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 15437
A=M+1 // 15438
M=0 // 15439

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 15440
D=M // 15441
@4 // 15442
A=D+A // 15443
M=0 // 15444

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE1}}
@String.setInt.EQ.4 // 15445
D=A // 15446
@SP // 15447
AM=M+1 // 15448
A=A-1 // 15449
M=D // 15450
@ARG // 15451
A=M+1 // 15452
D=M // 15453
@DO_EQ // 15454
0;JMP // 15455
(String.setInt.EQ.4)
@String.setInt$IF_TRUE1 // 15456
D;JNE // 15457

////GotoInstruction{label='String.setInt$IF_FALSE1}
// goto String.setInt$IF_FALSE1
@String.setInt$IF_FALSE1 // 15458
0;JMP // 15459

////LabelInstruction{label='String.setInt$IF_TRUE1}
// label String.setInt$IF_TRUE1
(String.setInt$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15460
D=M // 15461
@SP // 15462
AM=M+1 // 15463
A=A-1 // 15464
M=D // 15465
@48 // 15466
D=A // 15467
@SP // 15468
AM=M+1 // 15469
A=A-1 // 15470
M=D // 15471
// call String.appendChar
@7 // 15472
D=A // 15473
@14 // 15474
M=D // 15475
@String.appendChar // 15476
D=A // 15477
@13 // 15478
M=D // 15479
@String.setInt.ret.0 // 15480
D=A // 15481
@CALL // 15482
0;JMP // 15483
(String.setInt.ret.0)
@SP // 15484
M=M-1 // 15485

////PushInstruction("constant 0")
@SP // 15486
AM=M+1 // 15487
A=A-1 // 15488
M=0 // 15489
@RETURN // 15490
0;JMP // 15491

////LabelInstruction{label='String.setInt$IF_FALSE1}
// label String.setInt$IF_FALSE1
(String.setInt$IF_FALSE1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE2}}
@String.setInt.LT.5 // 15492
D=A // 15493
@SP // 15494
AM=M+1 // 15495
A=A-1 // 15496
M=D // 15497
@ARG // 15498
A=M+1 // 15499
D=M // 15500
@DO_LT // 15501
0;JMP // 15502
(String.setInt.LT.5)
@String.setInt$IF_TRUE2 // 15503
D;JNE // 15504

////GotoInstruction{label='String.setInt$IF_FALSE2}
// goto String.setInt$IF_FALSE2
@String.setInt$IF_FALSE2 // 15505
0;JMP // 15506

////LabelInstruction{label='String.setInt$IF_TRUE2}
// label String.setInt$IF_TRUE2
(String.setInt$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 15507
D=M // 15508
@4 // 15509
A=D+A // 15510
M=1 // 15511

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
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 32767"),
//                    binaryOp: "AND"
//                ),
//            right:
//                PushInstruction("constant 32767"),
//            binaryOp: "EQ"
//        ),
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE3}}
@String.setInt.LT.6 // 15512
D=A // 15513
@SP // 15514
AM=M+1 // 15515
A=A-1 // 15516
M=D // 15517
@ARG // 15518
A=M+1 // 15519
D=M // 15520
@DO_LT // 15521
0;JMP // 15522
(String.setInt.LT.6)
@SP // 15523
AM=M+1 // 15524
A=A-1 // 15525
M=D // 15526
@String.setInt.EQ.7 // 15527
D=A // 15528
@SP // 15529
AM=M+1 // 15530
A=A-1 // 15531
M=D // 15532
@ARG // 15533
A=M+1 // 15534
D=M // 15535
@32767 // 15536
D=D&A // 15537
@32767 // 15538
D=D-A // 15539
@DO_EQ // 15540
0;JMP // 15541
(String.setInt.EQ.7)
@SP // 15542
AM=M-1 // 15543
D=D&M // 15544
@String.setInt$IF_TRUE3 // 15545
D;JNE // 15546

////GotoInstruction{label='String.setInt$IF_FALSE3}
// goto String.setInt$IF_FALSE3
@String.setInt$IF_FALSE3 // 15547
0;JMP // 15548

////LabelInstruction{label='String.setInt$IF_TRUE3}
// label String.setInt$IF_TRUE3
(String.setInt$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15549
D=M // 15550
@SP // 15551
AM=M+1 // 15552
A=A-1 // 15553
M=D // 15554
@45 // 15555
D=A // 15556
@SP // 15557
AM=M+1 // 15558
A=A-1 // 15559
M=D // 15560
// call String.appendChar
@7 // 15561
D=A // 15562
@14 // 15563
M=D // 15564
@String.appendChar // 15565
D=A // 15566
@13 // 15567
M=D // 15568
@String.setInt.ret.1 // 15569
D=A // 15570
@CALL // 15571
0;JMP // 15572
(String.setInt.ret.1)
@SP // 15573
M=M-1 // 15574

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15575
D=M // 15576
@SP // 15577
AM=M+1 // 15578
A=A-1 // 15579
M=D // 15580
@51 // 15581
D=A // 15582
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
@String.setInt.ret.2 // 15595
D=A // 15596
@CALL // 15597
0;JMP // 15598
(String.setInt.ret.2)
@SP // 15599
M=M-1 // 15600

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15601
D=M // 15602
@SP // 15603
AM=M+1 // 15604
A=A-1 // 15605
M=D // 15606
@50 // 15607
D=A // 15608
@SP // 15609
AM=M+1 // 15610
A=A-1 // 15611
M=D // 15612
// call String.appendChar
@7 // 15613
D=A // 15614
@14 // 15615
M=D // 15616
@String.appendChar // 15617
D=A // 15618
@13 // 15619
M=D // 15620
@String.setInt.ret.3 // 15621
D=A // 15622
@CALL // 15623
0;JMP // 15624
(String.setInt.ret.3)
@SP // 15625
M=M-1 // 15626

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15627
D=M // 15628
@SP // 15629
AM=M+1 // 15630
A=A-1 // 15631
M=D // 15632
@55 // 15633
D=A // 15634
@SP // 15635
AM=M+1 // 15636
A=A-1 // 15637
M=D // 15638
// call String.appendChar
@7 // 15639
D=A // 15640
@14 // 15641
M=D // 15642
@String.appendChar // 15643
D=A // 15644
@13 // 15645
M=D // 15646
@String.setInt.ret.4 // 15647
D=A // 15648
@CALL // 15649
0;JMP // 15650
(String.setInt.ret.4)
@SP // 15651
M=M-1 // 15652

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15653
D=M // 15654
@SP // 15655
AM=M+1 // 15656
A=A-1 // 15657
M=D // 15658
@54 // 15659
D=A // 15660
@SP // 15661
AM=M+1 // 15662
A=A-1 // 15663
M=D // 15664
// call String.appendChar
@7 // 15665
D=A // 15666
@14 // 15667
M=D // 15668
@String.appendChar // 15669
D=A // 15670
@13 // 15671
M=D // 15672
@String.setInt.ret.5 // 15673
D=A // 15674
@CALL // 15675
0;JMP // 15676
(String.setInt.ret.5)
@SP // 15677
M=M-1 // 15678

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15679
D=M // 15680
@SP // 15681
AM=M+1 // 15682
A=A-1 // 15683
M=D // 15684
@56 // 15685
D=A // 15686
@SP // 15687
AM=M+1 // 15688
A=A-1 // 15689
M=D // 15690
// call String.appendChar
@7 // 15691
D=A // 15692
@14 // 15693
M=D // 15694
@String.appendChar // 15695
D=A // 15696
@13 // 15697
M=D // 15698
@String.setInt.ret.6 // 15699
D=A // 15700
@CALL // 15701
0;JMP // 15702
(String.setInt.ret.6)
@SP // 15703
M=M-1 // 15704

////PushInstruction("constant 0")
@SP // 15705
AM=M+1 // 15706
A=A-1 // 15707
M=0 // 15708
@RETURN // 15709
0;JMP // 15710

////LabelInstruction{label='String.setInt$IF_FALSE3}
// label String.setInt$IF_FALSE3
(String.setInt$IF_FALSE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15711
A=M+1 // 15712
D=-M // 15713
@ARG // 15714
A=M+1 // 15715
M=D // 15716

////LabelInstruction{label='String.setInt$IF_FALSE2}
// label String.setInt$IF_FALSE2
(String.setInt$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15717
A=M+1 // 15718
D=M // 15719
@LCL // 15720
A=M+1 // 15721
A=A+1 // 15722
M=D // 15723

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15724
A=M+1 // 15725
A=A+1 // 15726
A=A+1 // 15727
M=0 // 15728

////LabelInstruction{label='String.setInt_WHILE_EXP1}
// label String.setInt_WHILE_EXP1
(String.setInt_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt_WHILE_END1}}
@String.setInt.GT.8 // 15729
D=A // 15730
@SP // 15731
AM=M+1 // 15732
A=A-1 // 15733
M=D // 15734
@LCL // 15735
A=M+1 // 15736
A=A+1 // 15737
D=M // 15738
@DO_GT // 15739
0;JMP // 15740
(String.setInt.GT.8)
D=!D // 15741
@String.setInt_WHILE_END1 // 15742
D;JNE // 15743

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15744
A=M+1 // 15745
A=A+1 // 15746
D=M // 15747
@SP // 15748
AM=M+1 // 15749
A=A-1 // 15750
M=D // 15751
@10 // 15752
D=A // 15753
@SP // 15754
AM=M+1 // 15755
A=A-1 // 15756
M=D // 15757
// call Math.divide
@7 // 15758
D=A // 15759
@14 // 15760
M=D // 15761
@Math.divide // 15762
D=A // 15763
@13 // 15764
M=D // 15765
@String.setInt.ret.7 // 15766
D=A // 15767
@CALL // 15768
0;JMP // 15769
(String.setInt.ret.7)
@SP // 15770
AM=M-1 // 15771
D=M // 15772
@LCL // 15773
A=M+1 // 15774
A=A+1 // 15775
M=D // 15776

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

@LCL // 15777
A=M+1 // 15778
A=A+1 // 15779
A=A+1 // 15780
M=M+1 // 15781

////GotoInstruction{label='String.setInt_WHILE_EXP1}
// goto String.setInt_WHILE_EXP1
@String.setInt_WHILE_EXP1 // 15782
0;JMP // 15783

////LabelInstruction{label='String.setInt_WHILE_END1}
// label String.setInt_WHILE_END1
(String.setInt_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15784
A=M+1 // 15785
A=A+1 // 15786
A=A+1 // 15787
D=M // 15788
@SP // 15789
AM=M+1 // 15790
A=A-1 // 15791
M=D // 15792
// call Array.new
@6 // 15793
D=A // 15794
@14 // 15795
M=D // 15796
@Array.new // 15797
D=A // 15798
@13 // 15799
M=D // 15800
@String.setInt.ret.8 // 15801
D=A // 15802
@CALL // 15803
0;JMP // 15804
(String.setInt.ret.8)
@LCL // 15805
D=M // 15806
@5 // 15807
A=D+A // 15808
D=A // 15809
@R13 // 15810
M=D // 15811
@SP // 15812
AM=M-1 // 15813
D=M // 15814
@R13 // 15815
A=M // 15816
M=D // 15817

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15818
A=M+1 // 15819
M=0 // 15820

////LabelInstruction{label='String.setInt_WHILE_EXP2}
// label String.setInt_WHILE_EXP2
(String.setInt_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt_WHILE_END2}}
@String.setInt.GT.9 // 15821
D=A // 15822
@SP // 15823
AM=M+1 // 15824
A=A-1 // 15825
M=D // 15826
@ARG // 15827
A=M+1 // 15828
D=M // 15829
@DO_GT // 15830
0;JMP // 15831
(String.setInt.GT.9)
D=!D // 15832
@String.setInt_WHILE_END2 // 15833
D;JNE // 15834

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

@ARG // 15835
A=M+1 // 15836
D=M // 15837
@SP // 15838
AM=M+1 // 15839
A=A-1 // 15840
M=D // 15841
@ARG // 15842
A=M+1 // 15843
D=M // 15844
@SP // 15845
AM=M+1 // 15846
A=A-1 // 15847
M=D // 15848
@10 // 15849
D=A // 15850
@SP // 15851
AM=M+1 // 15852
A=A-1 // 15853
M=D // 15854
// call Math.divide
@7 // 15855
D=A // 15856
@14 // 15857
M=D // 15858
@Math.divide // 15859
D=A // 15860
@13 // 15861
M=D // 15862
@String.setInt.ret.9 // 15863
D=A // 15864
@CALL // 15865
0;JMP // 15866
(String.setInt.ret.9)
@10 // 15867
D=A // 15868
@SP // 15869
AM=M+1 // 15870
A=A-1 // 15871
M=D // 15872
// call Math.multiply
@7 // 15873
D=A // 15874
@14 // 15875
M=D // 15876
@Math.multiply // 15877
D=A // 15878
@13 // 15879
M=D // 15880
@String.setInt.ret.10 // 15881
D=A // 15882
@CALL // 15883
0;JMP // 15884
(String.setInt.ret.10)
@SP // 15885
AM=M-1 // 15886
D=M // 15887
@SP // 15888
AM=M-1 // 15889
D=M-D // 15890
@LCL // 15891
A=M // 15892
M=D // 15893

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
@LCL // 15894
D=M // 15895
@5 // 15896
A=D+A // 15897
D=M // 15898
@SP // 15899
AM=M+1 // 15900
A=A-1 // 15901
M=D // 15902
@LCL // 15903
A=M+1 // 15904
D=M // 15905
@SP // 15906
AM=M-1 // 15907
D=D+M // 15908
@SP // 15909
AM=M+1 // 15910
A=A-1 // 15911
M=D // 15912
@LCL // 15913
A=M // 15914
D=M // 15915
@48 // 15916
D=D+A // 15917
@SP // 15918
AM=M-1 // 15919
A=M // 15920
M=D // 15921

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15922
A=M+1 // 15923
D=M // 15924
@SP // 15925
AM=M+1 // 15926
A=A-1 // 15927
M=D // 15928
@10 // 15929
D=A // 15930
@SP // 15931
AM=M+1 // 15932
A=A-1 // 15933
M=D // 15934
// call Math.divide
@7 // 15935
D=A // 15936
@14 // 15937
M=D // 15938
@Math.divide // 15939
D=A // 15940
@13 // 15941
M=D // 15942
@String.setInt.ret.11 // 15943
D=A // 15944
@CALL // 15945
0;JMP // 15946
(String.setInt.ret.11)
@SP // 15947
AM=M-1 // 15948
D=M // 15949
@ARG // 15950
A=M+1 // 15951
M=D // 15952

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

@LCL // 15953
A=M+1 // 15954
M=M+1 // 15955

////GotoInstruction{label='String.setInt_WHILE_EXP2}
// goto String.setInt_WHILE_EXP2
@String.setInt_WHILE_EXP2 // 15956
0;JMP // 15957

////LabelInstruction{label='String.setInt_WHILE_END2}
// label String.setInt_WHILE_END2
(String.setInt_WHILE_END2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE4}}
@String.setInt.EQ.10 // 15958
D=A // 15959
@SP // 15960
AM=M+1 // 15961
A=A-1 // 15962
M=D // 15963
@LCL // 15964
D=M // 15965
@4 // 15966
A=D+A // 15967
D=M // 15968
D=D-1 // 15969
@DO_EQ // 15970
0;JMP // 15971
(String.setInt.EQ.10)
@String.setInt$IF_TRUE4 // 15972
D;JNE // 15973

////GotoInstruction{label='String.setInt$IF_FALSE4}
// goto String.setInt$IF_FALSE4
@String.setInt$IF_FALSE4 // 15974
0;JMP // 15975

////LabelInstruction{label='String.setInt$IF_TRUE4}
// label String.setInt$IF_TRUE4
(String.setInt$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15976
D=M // 15977
@SP // 15978
AM=M+1 // 15979
A=A-1 // 15980
M=D // 15981
@45 // 15982
D=A // 15983
@SP // 15984
AM=M+1 // 15985
A=A-1 // 15986
M=D // 15987
// call String.appendChar
@7 // 15988
D=A // 15989
@14 // 15990
M=D // 15991
@String.appendChar // 15992
D=A // 15993
@13 // 15994
M=D // 15995
@String.setInt.ret.12 // 15996
D=A // 15997
@CALL // 15998
0;JMP // 15999
(String.setInt.ret.12)
@SP // 16000
M=M-1 // 16001

////LabelInstruction{label='String.setInt$IF_FALSE4}
// label String.setInt$IF_FALSE4
(String.setInt$IF_FALSE4)

////LabelInstruction{label='String.setInt_WHILE_EXP3}
// label String.setInt_WHILE_EXP3
(String.setInt_WHILE_EXP3)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt_WHILE_END3}}
@String.setInt.GT.11 // 16002
D=A // 16003
@SP // 16004
AM=M+1 // 16005
A=A-1 // 16006
M=D // 16007
@LCL // 16008
A=M+1 // 16009
D=M // 16010
@DO_GT // 16011
0;JMP // 16012
(String.setInt.GT.11)
D=!D // 16013
@String.setInt_WHILE_END3 // 16014
D;JNE // 16015

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

@LCL // 16016
A=M+1 // 16017
M=M-1 // 16018

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

@3 // 16019
D=M // 16020
@SP // 16021
AM=M+1 // 16022
A=A-1 // 16023
M=D // 16024
@LCL // 16025
D=M // 16026
@5 // 16027
A=D+A // 16028
D=M // 16029
@SP // 16030
AM=M+1 // 16031
A=A-1 // 16032
M=D // 16033
@LCL // 16034
A=M+1 // 16035
D=M // 16036
@SP // 16037
AM=M-1 // 16038
A=D+M // 16039
D=M // 16040
@SP // 16041
AM=M+1 // 16042
A=A-1 // 16043
M=D // 16044
// call String.appendChar
@7 // 16045
D=A // 16046
@14 // 16047
M=D // 16048
@String.appendChar // 16049
D=A // 16050
@13 // 16051
M=D // 16052
@String.setInt.ret.13 // 16053
D=A // 16054
@CALL // 16055
0;JMP // 16056
(String.setInt.ret.13)
@SP // 16057
M=M-1 // 16058

////GotoInstruction{label='String.setInt_WHILE_EXP3}
// goto String.setInt_WHILE_EXP3
@String.setInt_WHILE_EXP3 // 16059
0;JMP // 16060

////LabelInstruction{label='String.setInt_WHILE_END3}
// label String.setInt_WHILE_END3
(String.setInt_WHILE_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16061
D=M // 16062
@5 // 16063
A=D+A // 16064
D=M // 16065
@SP // 16066
AM=M+1 // 16067
A=A-1 // 16068
M=D // 16069
// call Array.dispose
@6 // 16070
D=A // 16071
@14 // 16072
M=D // 16073
@Array.dispose // 16074
D=A // 16075
@13 // 16076
M=D // 16077
@String.setInt.ret.14 // 16078
D=A // 16079
@CALL // 16080
0;JMP // 16081
(String.setInt.ret.14)
@SP // 16082
M=M-1 // 16083

////PushInstruction("constant 0")
@SP // 16084
AM=M+1 // 16085
A=A-1 // 16086
M=0 // 16087
@RETURN // 16088
0;JMP // 16089

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 16090
D=A // 16091
@SP // 16092
AM=M+1 // 16093
A=A-1 // 16094
M=D // 16095
@RETURN // 16096
0;JMP // 16097

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 16098
D=A // 16099
@SP // 16100
AM=M+1 // 16101
A=A-1 // 16102
M=D // 16103
@RETURN // 16104
0;JMP // 16105

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 16106
D=A // 16107
@SP // 16108
AM=M+1 // 16109
A=A-1 // 16110
M=D // 16111
@RETURN // 16112
0;JMP // 16113

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 16114
D=A // 16115
@14 // 16116
M=D // 16117
@Memory.init // 16118
D=A // 16119
@13 // 16120
M=D // 16121
@Sys.init.ret.0 // 16122
D=A // 16123
@CALL // 16124
0;JMP // 16125
(Sys.init.ret.0)
@SP // 16126
M=M-1 // 16127

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 16128
D=A // 16129
@14 // 16130
M=D // 16131
@Math.init // 16132
D=A // 16133
@13 // 16134
M=D // 16135
@Sys.init.ret.1 // 16136
D=A // 16137
@CALL // 16138
0;JMP // 16139
(Sys.init.ret.1)
@SP // 16140
M=M-1 // 16141

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 16142
D=A // 16143
@14 // 16144
M=D // 16145
@Screen.init // 16146
D=A // 16147
@13 // 16148
M=D // 16149
@Sys.init.ret.2 // 16150
D=A // 16151
@CALL // 16152
0;JMP // 16153
(Sys.init.ret.2)
@SP // 16154
M=M-1 // 16155

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 16156
D=A // 16157
@14 // 16158
M=D // 16159
@Output.init // 16160
D=A // 16161
@13 // 16162
M=D // 16163
@Sys.init.ret.3 // 16164
D=A // 16165
@CALL // 16166
0;JMP // 16167
(Sys.init.ret.3)
@SP // 16168
M=M-1 // 16169

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 16170
D=A // 16171
@14 // 16172
M=D // 16173
@Keyboard.init // 16174
D=A // 16175
@13 // 16176
M=D // 16177
@Sys.init.ret.4 // 16178
D=A // 16179
@CALL // 16180
0;JMP // 16181
(Sys.init.ret.4)
@SP // 16182
M=M-1 // 16183

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 16184
D=A // 16185
@14 // 16186
M=D // 16187
@Main.main // 16188
D=A // 16189
@13 // 16190
M=D // 16191
@Sys.init.ret.5 // 16192
D=A // 16193
@CALL // 16194
0;JMP // 16195
(Sys.init.ret.5)
@SP // 16196
M=M-1 // 16197

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 16198
D=A // 16199
@14 // 16200
M=D // 16201
@Sys.halt // 16202
D=A // 16203
@13 // 16204
M=D // 16205
@Sys.init.ret.6 // 16206
D=A // 16207
@CALL // 16208
0;JMP // 16209
(Sys.init.ret.6)
@SP // 16210
M=M-1 // 16211

////PushInstruction("constant 0")
@SP // 16212
AM=M+1 // 16213
A=A-1 // 16214
M=0 // 16215
@RETURN // 16216
0;JMP // 16217

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 16218
@Sys.halt_WHILE_END1 // 16219
D;JNE // 16220

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 16221
0;JMP // 16222

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 16223
AM=M+1 // 16224
A=A-1 // 16225
M=0 // 16226
@RETURN // 16227
0;JMP // 16228

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 16229
AM=M+1 // 16230
A=A-1 // 16231
M=0 // 16232

////LabelInstruction{label='Sys.wait_WHILE_EXP1}
// label Sys.wait_WHILE_EXP1
(Sys.wait_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Sys.wait_WHILE_END1}}
@Sys.wait.GT.0 // 16233
D=A // 16234
@SP // 16235
AM=M+1 // 16236
A=A-1 // 16237
M=D // 16238
@ARG // 16239
A=M // 16240
D=M // 16241
@DO_GT // 16242
0;JMP // 16243
(Sys.wait.GT.0)
D=!D // 16244
@Sys.wait_WHILE_END1 // 16245
D;JNE // 16246

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

@ARG // 16247
A=M // 16248
M=M-1 // 16249

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 16250
D=A // 16251
@LCL // 16252
A=M // 16253
M=D // 16254

////LabelInstruction{label='Sys.wait_WHILE_EXP2}
// label Sys.wait_WHILE_EXP2
(Sys.wait_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Sys.wait_WHILE_END2}}
@Sys.wait.GT.1 // 16255
D=A // 16256
@SP // 16257
AM=M+1 // 16258
A=A-1 // 16259
M=D // 16260
@LCL // 16261
A=M // 16262
D=M // 16263
@DO_GT // 16264
0;JMP // 16265
(Sys.wait.GT.1)
D=!D // 16266
@Sys.wait_WHILE_END2 // 16267
D;JNE // 16268

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

@LCL // 16269
A=M // 16270
M=M-1 // 16271

////GotoInstruction{label='Sys.wait_WHILE_EXP2}
// goto Sys.wait_WHILE_EXP2
@Sys.wait_WHILE_EXP2 // 16272
0;JMP // 16273

////LabelInstruction{label='Sys.wait_WHILE_END2}
// label Sys.wait_WHILE_END2
(Sys.wait_WHILE_END2)

////GotoInstruction{label='Sys.wait_WHILE_EXP1}
// goto Sys.wait_WHILE_EXP1
@Sys.wait_WHILE_EXP1 // 16274
0;JMP // 16275

////LabelInstruction{label='Sys.wait_WHILE_END1}
// label Sys.wait_WHILE_END1
(Sys.wait_WHILE_END1)

////PushInstruction("constant 0")
@SP // 16276
AM=M+1 // 16277
A=A-1 // 16278
M=0 // 16279
@RETURN // 16280
0;JMP // 16281

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 16282
A=M // 16283
D=M // 16284
@SP // 16285
AM=M+1 // 16286
A=A-1 // 16287
M=D // 16288
// call Output.printInt
@6 // 16289
D=A // 16290
@14 // 16291
M=D // 16292
@Output.printInt // 16293
D=A // 16294
@13 // 16295
M=D // 16296
@Sys.error.ret.0 // 16297
D=A // 16298
@CALL // 16299
0;JMP // 16300
(Sys.error.ret.0)
@SP // 16301
M=M-1 // 16302

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 16303
D=A // 16304
@14 // 16305
M=D // 16306
@Output.println // 16307
D=A // 16308
@13 // 16309
M=D // 16310
@Sys.error.ret.1 // 16311
D=A // 16312
@CALL // 16313
0;JMP // 16314
(Sys.error.ret.1)
@SP // 16315
M=M-1 // 16316

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 16317
D=A // 16318
@14 // 16319
M=D // 16320
@Sys.halt // 16321
D=A // 16322
@13 // 16323
M=D // 16324
@Sys.error.ret.2 // 16325
D=A // 16326
@CALL // 16327
0;JMP // 16328
(Sys.error.ret.2)
@SP // 16329
M=M-1 // 16330

////PushInstruction("constant 0")
@SP // 16331
AM=M+1 // 16332
A=A-1 // 16333
M=0 // 16334
@RETURN // 16335
0;JMP // 16336

