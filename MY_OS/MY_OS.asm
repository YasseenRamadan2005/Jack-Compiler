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

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

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
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}}
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
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}}
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
@WHILE_END_Keyboard.readChar2 // 231
D;JNE // 232

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 233
0;JMP // 234

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

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

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//CallGroup{pushes=[], call=CallInstruction{String.newLine}},
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}}
@Keyboard.readLine.EQ.2 // 335
D=A // 336
@SP // 337
AM=M+1 // 338
A=A-1 // 339
M=D // 340
@LCL // 341
A=M+1 // 342
D=M // 343
@SP // 344
AM=M+1 // 345
A=A-1 // 346
M=D // 347
// call String.newLine
@5 // 348
D=A // 349
@14 // 350
M=D // 351
@String.newLine // 352
D=A // 353
@13 // 354
M=D // 355
@Keyboard.readLine.ret.3 // 356
D=A // 357
@CALL // 358
0;JMP // 359
(Keyboard.readLine.ret.3)
@SP // 360
AM=M-1 // 361
D=M // 362
@SP // 363
AM=M-1 // 364
D=M-D // 365
@DO_EQ // 366
0;JMP // 367
(Keyboard.readLine.EQ.2)
@WHILE_END_Keyboard.readLine1 // 368
D;JNE // 369

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 129"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Keyboard.readLine.IfElse1}}
@Keyboard.readLine.EQ.3 // 370
D=A // 371
@SP // 372
AM=M+1 // 373
A=A-1 // 374
M=D // 375
@LCL // 376
A=M+1 // 377
D=M // 378
@129 // 379
D=D-A // 380
@DO_EQ // 381
0;JMP // 382
(Keyboard.readLine.EQ.3)
D=!D // 383
@Keyboard.readLine.IfElse1 // 384
D;JNE // 385

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.eraseLastChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 386
A=M // 387
D=M // 388
@SP // 389
AM=M+1 // 390
A=A-1 // 391
M=D // 392
// call String.eraseLastChar
@6 // 393
D=A // 394
@14 // 395
M=D // 396
@String.eraseLastChar // 397
D=A // 398
@13 // 399
M=D // 400
@Keyboard.readLine.ret.4 // 401
D=A // 402
@CALL // 403
0;JMP // 404
(Keyboard.readLine.ret.4)
@SP // 405
M=M-1 // 406

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 407
0;JMP // 408

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 409
A=M // 410
D=M // 411
@SP // 412
AM=M+1 // 413
A=A-1 // 414
M=D // 415
@LCL // 416
A=M+1 // 417
D=M // 418
@SP // 419
AM=M+1 // 420
A=A-1 // 421
M=D // 422
// call String.appendChar
@7 // 423
D=A // 424
@14 // 425
M=D // 426
@String.appendChar // 427
D=A // 428
@13 // 429
M=D // 430
@Keyboard.readLine.ret.5 // 431
D=A // 432
@CALL // 433
0;JMP // 434
(Keyboard.readLine.ret.5)
@SP // 435
M=M-1 // 436

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 437
D=A // 438
@14 // 439
M=D // 440
@Keyboard.readChar // 441
D=A // 442
@13 // 443
M=D // 444
@Keyboard.readLine.ret.6 // 445
D=A // 446
@CALL // 447
0;JMP // 448
(Keyboard.readLine.ret.6)
@SP // 449
AM=M-1 // 450
D=M // 451
@LCL // 452
A=M+1 // 453
M=D // 454

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 455
0;JMP // 456

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 457
A=M // 458
D=M // 459
@SP // 460
AM=M+1 // 461
A=A-1 // 462
M=D // 463
@RETURN // 464
0;JMP // 465

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 466
AM=M+1 // 467
A=A-1 // 468
M=0 // 469

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Keyboard.readLine}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 470
A=M // 471
D=M // 472
@SP // 473
AM=M+1 // 474
A=A-1 // 475
M=D // 476
// call Keyboard.readLine
@6 // 477
D=A // 478
@14 // 479
M=D // 480
@Keyboard.readLine // 481
D=A // 482
@13 // 483
M=D // 484
@Keyboard.readInt.ret.0 // 485
D=A // 486
@CALL // 487
0;JMP // 488
(Keyboard.readInt.ret.0)
@SP // 489
AM=M-1 // 490
D=M // 491
@LCL // 492
A=M // 493
M=D // 494

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.intValue}}
@LCL // 495
A=M // 496
D=M // 497
@SP // 498
AM=M+1 // 499
A=A-1 // 500
M=D // 501
// call String.intValue
@6 // 502
D=A // 503
@14 // 504
M=D // 505
@String.intValue // 506
D=A // 507
@13 // 508
M=D // 509
@Keyboard.readInt.ret.1 // 510
D=A // 511
@CALL // 512
0;JMP // 513
(Keyboard.readInt.ret.1)
@RETURN // 514
0;JMP // 515

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 516
AM=M+1 // 517
A=A-1 // 518
M=0 // 519

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 520
D=A // 521
@SP // 522
AM=M+1 // 523
A=A-1 // 524
M=D // 525
// call String.new
@6 // 526
D=A // 527
@14 // 528
M=D // 529
@String.new // 530
D=A // 531
@13 // 532
M=D // 533
@Main.main.ret.0 // 534
D=A // 535
@CALL // 536
0;JMP // 537
(Main.main.ret.0)
@72 // 538
D=A // 539
@SP // 540
AM=M+1 // 541
A=A-1 // 542
M=D // 543
// call String.appendChar
@7 // 544
D=A // 545
@14 // 546
M=D // 547
@String.appendChar // 548
D=A // 549
@13 // 550
M=D // 551
@Main.main.ret.1 // 552
D=A // 553
@CALL // 554
0;JMP // 555
(Main.main.ret.1)
@101 // 556
D=A // 557
@SP // 558
AM=M+1 // 559
A=A-1 // 560
M=D // 561
// call String.appendChar
@7 // 562
D=A // 563
@14 // 564
M=D // 565
@String.appendChar // 566
D=A // 567
@13 // 568
M=D // 569
@Main.main.ret.2 // 570
D=A // 571
@CALL // 572
0;JMP // 573
(Main.main.ret.2)
@108 // 574
D=A // 575
@SP // 576
AM=M+1 // 577
A=A-1 // 578
M=D // 579
// call String.appendChar
@7 // 580
D=A // 581
@14 // 582
M=D // 583
@String.appendChar // 584
D=A // 585
@13 // 586
M=D // 587
@Main.main.ret.3 // 588
D=A // 589
@CALL // 590
0;JMP // 591
(Main.main.ret.3)
@108 // 592
D=A // 593
@SP // 594
AM=M+1 // 595
A=A-1 // 596
M=D // 597
// call String.appendChar
@7 // 598
D=A // 599
@14 // 600
M=D // 601
@String.appendChar // 602
D=A // 603
@13 // 604
M=D // 605
@Main.main.ret.4 // 606
D=A // 607
@CALL // 608
0;JMP // 609
(Main.main.ret.4)
@111 // 610
D=A // 611
@SP // 612
AM=M+1 // 613
A=A-1 // 614
M=D // 615
// call String.appendChar
@7 // 616
D=A // 617
@14 // 618
M=D // 619
@String.appendChar // 620
D=A // 621
@13 // 622
M=D // 623
@Main.main.ret.5 // 624
D=A // 625
@CALL // 626
0;JMP // 627
(Main.main.ret.5)
@44 // 628
D=A // 629
@SP // 630
AM=M+1 // 631
A=A-1 // 632
M=D // 633
// call String.appendChar
@7 // 634
D=A // 635
@14 // 636
M=D // 637
@String.appendChar // 638
D=A // 639
@13 // 640
M=D // 641
@Main.main.ret.6 // 642
D=A // 643
@CALL // 644
0;JMP // 645
(Main.main.ret.6)
@32 // 646
D=A // 647
@SP // 648
AM=M+1 // 649
A=A-1 // 650
M=D // 651
// call String.appendChar
@7 // 652
D=A // 653
@14 // 654
M=D // 655
@String.appendChar // 656
D=A // 657
@13 // 658
M=D // 659
@Main.main.ret.7 // 660
D=A // 661
@CALL // 662
0;JMP // 663
(Main.main.ret.7)
@119 // 664
D=A // 665
@SP // 666
AM=M+1 // 667
A=A-1 // 668
M=D // 669
// call String.appendChar
@7 // 670
D=A // 671
@14 // 672
M=D // 673
@String.appendChar // 674
D=A // 675
@13 // 676
M=D // 677
@Main.main.ret.8 // 678
D=A // 679
@CALL // 680
0;JMP // 681
(Main.main.ret.8)
@111 // 682
D=A // 683
@SP // 684
AM=M+1 // 685
A=A-1 // 686
M=D // 687
// call String.appendChar
@7 // 688
D=A // 689
@14 // 690
M=D // 691
@String.appendChar // 692
D=A // 693
@13 // 694
M=D // 695
@Main.main.ret.9 // 696
D=A // 697
@CALL // 698
0;JMP // 699
(Main.main.ret.9)
@114 // 700
D=A // 701
@SP // 702
AM=M+1 // 703
A=A-1 // 704
M=D // 705
// call String.appendChar
@7 // 706
D=A // 707
@14 // 708
M=D // 709
@String.appendChar // 710
D=A // 711
@13 // 712
M=D // 713
@Main.main.ret.10 // 714
D=A // 715
@CALL // 716
0;JMP // 717
(Main.main.ret.10)
@108 // 718
D=A // 719
@SP // 720
AM=M+1 // 721
A=A-1 // 722
M=D // 723
// call String.appendChar
@7 // 724
D=A // 725
@14 // 726
M=D // 727
@String.appendChar // 728
D=A // 729
@13 // 730
M=D // 731
@Main.main.ret.11 // 732
D=A // 733
@CALL // 734
0;JMP // 735
(Main.main.ret.11)
@100 // 736
D=A // 737
@SP // 738
AM=M+1 // 739
A=A-1 // 740
M=D // 741
// call String.appendChar
@7 // 742
D=A // 743
@14 // 744
M=D // 745
@String.appendChar // 746
D=A // 747
@13 // 748
M=D // 749
@Main.main.ret.12 // 750
D=A // 751
@CALL // 752
0;JMP // 753
(Main.main.ret.12)
@33 // 754
D=A // 755
@SP // 756
AM=M+1 // 757
A=A-1 // 758
M=D // 759
// call String.appendChar
@7 // 760
D=A // 761
@14 // 762
M=D // 763
@String.appendChar // 764
D=A // 765
@13 // 766
M=D // 767
@Main.main.ret.13 // 768
D=A // 769
@CALL // 770
0;JMP // 771
(Main.main.ret.13)
@SP // 772
AM=M-1 // 773
D=M // 774
@LCL // 775
A=M // 776
M=D // 777

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 778
A=M // 779
D=M // 780
@SP // 781
AM=M+1 // 782
A=A-1 // 783
M=D // 784
// call Output.printString
@6 // 785
D=A // 786
@14 // 787
M=D // 788
@Output.printString // 789
D=A // 790
@13 // 791
M=D // 792
@Main.main.ret.14 // 793
D=A // 794
@CALL // 795
0;JMP // 796
(Main.main.ret.14)
@SP // 797
M=M-1 // 798

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 799
D=A // 800
@14 // 801
M=D // 802
@Output.println // 803
D=A // 804
@13 // 805
M=D // 806
@Main.main.ret.15 // 807
D=A // 808
@CALL // 809
0;JMP // 810
(Main.main.ret.15)
@SP // 811
M=M-1 // 812

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 813
A=M // 814
D=M // 815
@SP // 816
AM=M+1 // 817
A=A-1 // 818
M=D // 819
// call String.dispose
@6 // 820
D=A // 821
@14 // 822
M=D // 823
@String.dispose // 824
D=A // 825
@13 // 826
M=D // 827
@Main.main.ret.16 // 828
D=A // 829
@CALL // 830
0;JMP // 831
(Main.main.ret.16)
@SP // 832
M=M-1 // 833

////PushInstruction("constant 0")
@SP // 834
AM=M+1 // 835
A=A-1 // 836
M=0 // 837
@RETURN // 838
0;JMP // 839

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 840
M=M+1 // 841
AM=M+1 // 842
A=A-1 // 843
M=0 // 844
A=A-1 // 845
M=0 // 846

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 847
A=M // 848
M=1 // 849

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 850
A=M+1 // 851
M=0 // 852

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 853
D=A // 854
@SP // 855
AM=M+1 // 856
A=A-1 // 857
M=D // 858
// call Array.new
@6 // 859
D=A // 860
@14 // 861
M=D // 862
@Array.new // 863
D=A // 864
@13 // 865
M=D // 866
@Math.init.ret.0 // 867
D=A // 868
@CALL // 869
0;JMP // 870
(Math.init.ret.0)
@SP // 871
AM=M-1 // 872
D=M // 873
@Math.0 // 874
M=D // 875

////LabelInstruction{label='WHILE_START_Math.init1}
// label WHILE_START_Math.init1
(WHILE_START_Math.init1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 16"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Math.init1}}
@Math.init.LT.0 // 876
D=A // 877
@SP // 878
AM=M+1 // 879
A=A-1 // 880
M=D // 881
@LCL // 882
A=M+1 // 883
D=M // 884
@16 // 885
D=D-A // 886
@DO_LT // 887
0;JMP // 888
(Math.init.LT.0)
D=!D // 889
@WHILE_END_Math.init1 // 890
D;JNE // 891

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 892
D=M // 893
@SP // 894
AM=M+1 // 895
A=A-1 // 896
M=D // 897
@LCL // 898
A=M+1 // 899
D=M // 900
@SP // 901
AM=M-1 // 902
D=D+M // 903
@SP // 904
AM=M+1 // 905
A=A-1 // 906
M=D // 907
@LCL // 908
A=M // 909
D=M // 910
@SP // 911
AM=M-1 // 912
A=M // 913
M=D // 914

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

@LCL // 915
A=M // 916
D=M // 917
@LCL // 918
A=M // 919
M=D+M // 920

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

@LCL // 921
A=M+1 // 922
M=M+1 // 923

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 924
0;JMP // 925

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 926
AM=M+1 // 927
A=A-1 // 928
M=0 // 929
@RETURN // 930
0;JMP // 931

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
@ARG // 932
A=M // 933
D=M // 934
@SP // 935
AM=M+1 // 936
A=A-1 // 937
M=D // 938
@Math.0 // 939
D=M // 940
@SP // 941
AM=M+1 // 942
A=A-1 // 943
M=D // 944
@ARG // 945
A=M+1 // 946
D=M // 947
@SP // 948
AM=M-1 // 949
A=D+M // 950
D=M // 951
@SP // 952
AM=M-1 // 953
D=D&M // 954
@SP // 955
AM=M+1 // 956
A=A-1 // 957
M=D // 958
@RETURN // 959
0;JMP // 960

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 961
D=A // 962
@SP // 963
AM=D+M // 964
A=A-1 // 965
M=0 // 966
A=A-1 // 967
M=0 // 968
A=A-1 // 969
M=0 // 970

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 0"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 1"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "EQ"
//            ),
//        binaryOp: "OR"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElseEND1}}
@Math.multiply.EQ.1 // 971
D=A // 972
@SP // 973
AM=M+1 // 974
A=A-1 // 975
M=D // 976
@ARG // 977
A=M // 978
D=M // 979
@DO_EQ // 980
0;JMP // 981
(Math.multiply.EQ.1)
@SP // 982
AM=M+1 // 983
A=A-1 // 984
M=D // 985
@Math.multiply.EQ.2 // 986
D=A // 987
@SP // 988
AM=M+1 // 989
A=A-1 // 990
M=D // 991
@ARG // 992
A=M+1 // 993
D=M // 994
@DO_EQ // 995
0;JMP // 996
(Math.multiply.EQ.2)
@SP // 997
AM=M-1 // 998
D=D|M // 999
D=!D // 1000
@Math.multiply.IfElseEND1 // 1001
D;JNE // 1002

////PushInstruction("constant 0")
@SP // 1003
AM=M+1 // 1004
A=A-1 // 1005
M=0 // 1006
@RETURN // 1007
0;JMP // 1008

////LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElseEND2}}
@Math.multiply.EQ.3 // 1009
D=A // 1010
@SP // 1011
AM=M+1 // 1012
A=A-1 // 1013
M=D // 1014
@ARG // 1015
A=M // 1016
D=M // 1017
D=D-1 // 1018
@DO_EQ // 1019
0;JMP // 1020
(Math.multiply.EQ.3)
D=!D // 1021
@Math.multiply.IfElseEND2 // 1022
D;JNE // 1023

////PushInstruction("argument 1")
@ARG // 1024
A=M+1 // 1025
D=M // 1026
@SP // 1027
AM=M+1 // 1028
A=A-1 // 1029
M=D // 1030
@RETURN // 1031
0;JMP // 1032

////LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElseEND3}}
@Math.multiply.EQ.4 // 1033
D=A // 1034
@SP // 1035
AM=M+1 // 1036
A=A-1 // 1037
M=D // 1038
@ARG // 1039
A=M+1 // 1040
D=M // 1041
D=D-1 // 1042
@DO_EQ // 1043
0;JMP // 1044
(Math.multiply.EQ.4)
D=!D // 1045
@Math.multiply.IfElseEND3 // 1046
D;JNE // 1047

////PushInstruction("argument 0")
@ARG // 1048
A=M // 1049
D=M // 1050
@SP // 1051
AM=M+1 // 1052
A=A-1 // 1053
M=D // 1054
@RETURN // 1055
0;JMP // 1056

////LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElseEND4}}
@Math.multiply.EQ.5 // 1057
D=A // 1058
@SP // 1059
AM=M+1 // 1060
A=A-1 // 1061
M=D // 1062
@ARG // 1063
A=M // 1064
D=M // 1065
@2 // 1066
D=D-A // 1067
@DO_EQ // 1068
0;JMP // 1069
(Math.multiply.EQ.5)
D=!D // 1070
@Math.multiply.IfElseEND4 // 1071
D;JNE // 1072

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1073
A=M+1 // 1074
D=M // 1075
D=D+M // 1076
@SP // 1077
AM=M+1 // 1078
A=A-1 // 1079
M=D // 1080
@RETURN // 1081
0;JMP // 1082

////LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElseEND5}}
@Math.multiply.EQ.6 // 1083
D=A // 1084
@SP // 1085
AM=M+1 // 1086
A=A-1 // 1087
M=D // 1088
@ARG // 1089
A=M+1 // 1090
D=M // 1091
@2 // 1092
D=D-A // 1093
@DO_EQ // 1094
0;JMP // 1095
(Math.multiply.EQ.6)
D=!D // 1096
@Math.multiply.IfElseEND5 // 1097
D;JNE // 1098

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1099
A=M // 1100
D=M // 1101
D=D+M // 1102
@SP // 1103
AM=M+1 // 1104
A=A-1 // 1105
M=D // 1106
@RETURN // 1107
0;JMP // 1108

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1109
A=M+1 // 1110
A=A+1 // 1111
M=1 // 1112

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1113
A=M+1 // 1114
M=0 // 1115

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1116
A=M // 1117
M=0 // 1118

////LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 16"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Math.multiply1}}
@Math.multiply.LT.7 // 1119
D=A // 1120
@SP // 1121
AM=M+1 // 1122
A=A-1 // 1123
M=D // 1124
@LCL // 1125
A=M+1 // 1126
D=M // 1127
@16 // 1128
D=D-A // 1129
@DO_LT // 1130
0;JMP // 1131
(Math.multiply.LT.7)
D=!D // 1132
@WHILE_END_Math.multiply1 // 1133
D;JNE // 1134

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
//), ifGoto=IfGotoInstruction{label='Math.multiply.IfElseEND6}}
@Math.multiply.EQ.8 // 1135
D=A // 1136
@SP // 1137
AM=M+1 // 1138
A=A-1 // 1139
M=D // 1140
@ARG // 1141
A=M+1 // 1142
D=M // 1143
@SP // 1144
AM=M+1 // 1145
A=A-1 // 1146
M=D // 1147
@LCL // 1148
A=M+1 // 1149
A=A+1 // 1150
D=M // 1151
@SP // 1152
AM=M-1 // 1153
D=D&M // 1154
@DO_EQ // 1155
0;JMP // 1156
(Math.multiply.EQ.8)
@Math.multiply.IfElseEND6 // 1157
D;JNE // 1158

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

@ARG // 1159
A=M // 1160
D=M // 1161
@LCL // 1162
A=M // 1163
M=D+M // 1164

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

@ARG // 1165
A=M // 1166
D=M // 1167
@ARG // 1168
A=M // 1169
M=D+M // 1170

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

@LCL // 1171
A=M+1 // 1172
M=M+1 // 1173

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

@LCL // 1174
A=M+1 // 1175
A=A+1 // 1176
D=M // 1177
@LCL // 1178
A=M+1 // 1179
A=A+1 // 1180
M=D+M // 1181

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1182
0;JMP // 1183

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1184
A=M // 1185
D=M // 1186
@SP // 1187
AM=M+1 // 1188
A=A-1 // 1189
M=D // 1190
@RETURN // 1191
0;JMP // 1192

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1193
D=A // 1194
@SP // 1195
AM=D+M // 1196
A=A-1 // 1197
M=0 // 1198
A=A-1 // 1199
M=0 // 1200
A=A-1 // 1201
M=0 // 1202

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1203
A=M // 1204
D=M // 1205
@SP // 1206
AM=M+1 // 1207
A=A-1 // 1208
M=D // 1209
// call Math.abs
@6 // 1210
D=A // 1211
@14 // 1212
M=D // 1213
@Math.abs // 1214
D=A // 1215
@13 // 1216
M=D // 1217
@Math.divide.ret.0 // 1218
D=A // 1219
@CALL // 1220
0;JMP // 1221
(Math.divide.ret.0)
@SP // 1222
AM=M-1 // 1223
D=M // 1224
@LCL // 1225
A=M+1 // 1226
M=D // 1227

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1228
A=M+1 // 1229
D=M // 1230
@SP // 1231
AM=M+1 // 1232
A=A-1 // 1233
M=D // 1234
// call Math.abs
@6 // 1235
D=A // 1236
@14 // 1237
M=D // 1238
@Math.abs // 1239
D=A // 1240
@13 // 1241
M=D // 1242
@Math.divide.ret.1 // 1243
D=A // 1244
@CALL // 1245
0;JMP // 1246
(Math.divide.ret.1)
@SP // 1247
AM=M-1 // 1248
D=M // 1249
@LCL // 1250
A=M+1 // 1251
A=A+1 // 1252
M=D // 1253

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND1}}
@Math.divide.GT.9 // 1254
D=A // 1255
@SP // 1256
AM=M+1 // 1257
A=A-1 // 1258
M=D // 1259
@LCL // 1260
A=M+1 // 1261
A=A+1 // 1262
D=M // 1263
A=A-1 // 1264
D=D-M // 1265
@DO_GT // 1266
0;JMP // 1267
(Math.divide.GT.9)
D=!D // 1268
@Math.divide.IfElseEND1 // 1269
D;JNE // 1270

////PushInstruction("constant 0")
@SP // 1271
AM=M+1 // 1272
A=A-1 // 1273
M=0 // 1274
@RETURN // 1275
0;JMP // 1276

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

@LCL // 1277
A=M+1 // 1278
D=M // 1279
@SP // 1280
AM=M+1 // 1281
A=A-1 // 1282
M=D // 1283
@LCL // 1284
A=M+1 // 1285
A=A+1 // 1286
D=M // 1287
D=D+M // 1288
@SP // 1289
AM=M+1 // 1290
A=A-1 // 1291
M=D // 1292
// call Math.divide
@7 // 1293
D=A // 1294
@14 // 1295
M=D // 1296
@Math.divide // 1297
D=A // 1298
@13 // 1299
M=D // 1300
@Math.divide.ret.2 // 1301
D=A // 1302
@CALL // 1303
0;JMP // 1304
(Math.divide.ret.2)
@SP // 1305
AM=M-1 // 1306
D=M // 1307
@LCL // 1308
A=M // 1309
M=D // 1310

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 1"),
//                right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{Math.multiply}},
//                binaryOp: "SUB"
//            ),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElse2}}
@Math.divide.LT.10 // 1311
D=A // 1312
@SP // 1313
AM=M+1 // 1314
A=A-1 // 1315
M=D // 1316
@LCL // 1317
A=M+1 // 1318
D=M // 1319
@SP // 1320
AM=M+1 // 1321
A=A-1 // 1322
M=D // 1323
@LCL // 1324
A=M // 1325
D=M // 1326
D=D+M // 1327
@SP // 1328
AM=M+1 // 1329
A=A-1 // 1330
M=D // 1331
@LCL // 1332
A=M+1 // 1333
A=A+1 // 1334
D=M // 1335
@SP // 1336
AM=M+1 // 1337
A=A-1 // 1338
M=D // 1339
// call Math.multiply
@7 // 1340
D=A // 1341
@14 // 1342
M=D // 1343
@Math.multiply // 1344
D=A // 1345
@13 // 1346
M=D // 1347
@Math.divide.ret.3 // 1348
D=A // 1349
@CALL // 1350
0;JMP // 1351
(Math.divide.ret.3)
@SP // 1352
AM=M-1 // 1353
D=M // 1354
@SP // 1355
AM=M-1 // 1356
D=M-D // 1357
@SP // 1358
AM=M+1 // 1359
A=A-1 // 1360
M=D // 1361
@LCL // 1362
A=M+1 // 1363
A=A+1 // 1364
D=M // 1365
@SP // 1366
AM=M-1 // 1367
D=M-D // 1368
@DO_LT // 1369
0;JMP // 1370
(Math.divide.LT.10)
D=!D // 1371
@Math.divide.IfElse2 // 1372
D;JNE // 1373

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("argument 0"),
//                                right:
//                                    PushInstruction("constant 0"),
//                                binaryOp: "LT"
//                            ),
//                        right:
//                            PushInstruction("argument 1"),
//                        binaryOp: "AND"
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "GT"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("argument 0"),
//                                right:
//                                    PushInstruction("constant 0"),
//                                binaryOp: "GT"
//                            ),
//                        right:
//                            PushInstruction("argument 1"),
//                        binaryOp: "AND"
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "LT"
//            ),
//        binaryOp: "OR"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND3}}
@Math.divide.GT.11 // 1374
D=A // 1375
@SP // 1376
AM=M+1 // 1377
A=A-1 // 1378
M=D // 1379
@Math.divide.LT.12 // 1380
D=A // 1381
@SP // 1382
AM=M+1 // 1383
A=A-1 // 1384
M=D // 1385
@ARG // 1386
A=M // 1387
D=M // 1388
@DO_LT // 1389
0;JMP // 1390
(Math.divide.LT.12)
@SP // 1391
AM=M+1 // 1392
A=A-1 // 1393
M=D // 1394
@ARG // 1395
A=M+1 // 1396
D=M // 1397
@SP // 1398
AM=M-1 // 1399
D=D&M // 1400
@DO_GT // 1401
0;JMP // 1402
(Math.divide.GT.11)
@SP // 1403
AM=M+1 // 1404
A=A-1 // 1405
M=D // 1406
@Math.divide.LT.13 // 1407
D=A // 1408
@SP // 1409
AM=M+1 // 1410
A=A-1 // 1411
M=D // 1412
@Math.divide.GT.14 // 1413
D=A // 1414
@SP // 1415
AM=M+1 // 1416
A=A-1 // 1417
M=D // 1418
@ARG // 1419
A=M // 1420
D=M // 1421
@DO_GT // 1422
0;JMP // 1423
(Math.divide.GT.14)
@SP // 1424
AM=M+1 // 1425
A=A-1 // 1426
M=D // 1427
@ARG // 1428
A=M+1 // 1429
D=M // 1430
@SP // 1431
AM=M-1 // 1432
D=D&M // 1433
@DO_LT // 1434
0;JMP // 1435
(Math.divide.LT.13)
@SP // 1436
AM=M-1 // 1437
D=D|M // 1438
D=!D // 1439
@Math.divide.IfElseEND3 // 1440
D;JNE // 1441

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1442
A=M // 1443
D=-M // 1444
@LCL // 1445
A=M // 1446
M=D // 1447

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
@LCL // 1448
A=M // 1449
D=M // 1450
D=D+M // 1451
@SP // 1452
AM=M+1 // 1453
A=A-1 // 1454
M=D // 1455
@RETURN // 1456
0;JMP // 1457

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1458
0;JMP // 1459

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("argument 0"),
//                                right:
//                                    PushInstruction("constant 0"),
//                                binaryOp: "LT"
//                            ),
//                        right:
//                            PushInstruction("argument 1"),
//                        binaryOp: "AND"
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "GT"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("argument 0"),
//                                right:
//                                    PushInstruction("constant 0"),
//                                binaryOp: "GT"
//                            ),
//                        right:
//                            PushInstruction("argument 1"),
//                        binaryOp: "AND"
//                    ),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "LT"
//            ),
//        binaryOp: "OR"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND4}}
@Math.divide.GT.15 // 1460
D=A // 1461
@SP // 1462
AM=M+1 // 1463
A=A-1 // 1464
M=D // 1465
@Math.divide.LT.16 // 1466
D=A // 1467
@SP // 1468
AM=M+1 // 1469
A=A-1 // 1470
M=D // 1471
@ARG // 1472
A=M // 1473
D=M // 1474
@DO_LT // 1475
0;JMP // 1476
(Math.divide.LT.16)
@SP // 1477
AM=M+1 // 1478
A=A-1 // 1479
M=D // 1480
@ARG // 1481
A=M+1 // 1482
D=M // 1483
@SP // 1484
AM=M-1 // 1485
D=D&M // 1486
@DO_GT // 1487
0;JMP // 1488
(Math.divide.GT.15)
@SP // 1489
AM=M+1 // 1490
A=A-1 // 1491
M=D // 1492
@Math.divide.LT.17 // 1493
D=A // 1494
@SP // 1495
AM=M+1 // 1496
A=A-1 // 1497
M=D // 1498
@Math.divide.GT.18 // 1499
D=A // 1500
@SP // 1501
AM=M+1 // 1502
A=A-1 // 1503
M=D // 1504
@ARG // 1505
A=M // 1506
D=M // 1507
@DO_GT // 1508
0;JMP // 1509
(Math.divide.GT.18)
@SP // 1510
AM=M+1 // 1511
A=A-1 // 1512
M=D // 1513
@ARG // 1514
A=M+1 // 1515
D=M // 1516
@SP // 1517
AM=M-1 // 1518
D=D&M // 1519
@DO_LT // 1520
0;JMP // 1521
(Math.divide.LT.17)
@SP // 1522
AM=M-1 // 1523
D=D|M // 1524
D=!D // 1525
@Math.divide.IfElseEND4 // 1526
D;JNE // 1527

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1528
A=M // 1529
D=-M // 1530
@LCL // 1531
A=M // 1532
M=D // 1533

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
@LCL // 1534
A=M // 1535
D=M // 1536
D=D+M // 1537
D=D+1 // 1538
@SP // 1539
AM=M+1 // 1540
A=A-1 // 1541
M=D // 1542
@RETURN // 1543
0;JMP // 1544

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
@ARG // 1545
A=M // 1546
D=M // 1547
@SP // 1548
AM=M+1 // 1549
A=A-1 // 1550
M=D // 1551
@ARG // 1552
A=M // 1553
D=M // 1554
@SP // 1555
AM=M+1 // 1556
A=A-1 // 1557
M=D // 1558
@ARG // 1559
A=M+1 // 1560
D=M // 1561
@SP // 1562
AM=M+1 // 1563
A=A-1 // 1564
M=D // 1565
// call Math.divide
@7 // 1566
D=A // 1567
@14 // 1568
M=D // 1569
@Math.divide // 1570
D=A // 1571
@13 // 1572
M=D // 1573
@Math.mod.ret.0 // 1574
D=A // 1575
@CALL // 1576
0;JMP // 1577
(Math.mod.ret.0)
@ARG // 1578
A=M+1 // 1579
D=M // 1580
@SP // 1581
AM=M+1 // 1582
A=A-1 // 1583
M=D // 1584
// call Math.multiply
@7 // 1585
D=A // 1586
@14 // 1587
M=D // 1588
@Math.multiply // 1589
D=A // 1590
@13 // 1591
M=D // 1592
@Math.mod.ret.1 // 1593
D=A // 1594
@CALL // 1595
0;JMP // 1596
(Math.mod.ret.1)
@SP // 1597
AM=M-1 // 1598
D=M // 1599
@SP // 1600
AM=M-1 // 1601
D=M-D // 1602
@SP // 1603
AM=M+1 // 1604
A=A-1 // 1605
M=D // 1606
@RETURN // 1607
0;JMP // 1608

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
@Math.0 // 1609
D=M // 1610
@SP // 1611
AM=M+1 // 1612
A=A-1 // 1613
M=D // 1614
@ARG // 1615
A=M // 1616
D=M // 1617
@SP // 1618
AM=M-1 // 1619
A=D+M // 1620
D=M // 1621
@SP // 1622
AM=M+1 // 1623
A=A-1 // 1624
M=D // 1625
@RETURN // 1626
0;JMP // 1627

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1628
D=A // 1629
@SP // 1630
AM=D+M // 1631
A=A-1 // 1632
M=0 // 1633
A=A-1 // 1634
M=0 // 1635
A=A-1 // 1636
M=0 // 1637
A=A-1 // 1638
M=0 // 1639

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1640
A=M // 1641
M=0 // 1642

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1643
D=A // 1644
@LCL // 1645
A=M+1 // 1646
M=D // 1647

////LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Math.sqrt1}}
@Math.sqrt.LT.19 // 1648
D=A // 1649
@SP // 1650
AM=M+1 // 1651
A=A-1 // 1652
M=D // 1653
@LCL // 1654
A=M+1 // 1655
D=M // 1656
@DO_LT // 1657
0;JMP // 1658
(Math.sqrt.LT.19)
@WHILE_END_Math.sqrt1 // 1659
D;JNE // 1660

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

@LCL // 1661
A=M // 1662
D=M // 1663
@SP // 1664
AM=M+1 // 1665
A=A-1 // 1666
M=D // 1667
@Math.0 // 1668
D=M // 1669
@SP // 1670
AM=M+1 // 1671
A=A-1 // 1672
M=D // 1673
@LCL // 1674
A=M+1 // 1675
D=M // 1676
@SP // 1677
AM=M-1 // 1678
A=D+M // 1679
D=M // 1680
@SP // 1681
AM=M-1 // 1682
D=D+M // 1683
@LCL // 1684
A=M+1 // 1685
A=A+1 // 1686
M=D // 1687

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1688
D=A // 1689
@SP // 1690
M=D+M // 1691
@LCL // 1692
A=M+1 // 1693
A=A+1 // 1694
D=M // 1695
@SP // 1696
A=M-1 // 1697
M=D // 1698
A=A-1 // 1699
M=D // 1700
// call Math.multiply
@7 // 1701
D=A // 1702
@14 // 1703
M=D // 1704
@Math.multiply // 1705
D=A // 1706
@13 // 1707
M=D // 1708
@Math.sqrt.ret.0 // 1709
D=A // 1710
@CALL // 1711
0;JMP // 1712
(Math.sqrt.ret.0)
@SP // 1713
AM=M-1 // 1714
D=M // 1715
@LCL // 1716
A=M+1 // 1717
A=A+1 // 1718
A=A+1 // 1719
M=D // 1720

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            UnaryPushGroup(                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 3"),
//                    right:
//                        PushInstruction("argument 0"),
//                    binaryOp: "GT"
//                ),
//NOT),
//        right:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 3"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "GT"
//            ),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.sqrt.IfElseEND1}}
@Math.sqrt.GT.20 // 1721
D=A // 1722
@SP // 1723
AM=M+1 // 1724
A=A-1 // 1725
M=D // 1726
@LCL // 1727
A=M+1 // 1728
A=A+1 // 1729
A=A+1 // 1730
D=M // 1731
@SP // 1732
AM=M+1 // 1733
A=A-1 // 1734
M=D // 1735
@ARG // 1736
A=M // 1737
D=M // 1738
@SP // 1739
AM=M-1 // 1740
D=M-D // 1741
@DO_GT // 1742
0;JMP // 1743
(Math.sqrt.GT.20)
@SP // 1744
AM=M+1 // 1745
A=A-1 // 1746
M=D // 1747
@SP // 1748
A=M-1 // 1749
M=!D // 1750
@Math.sqrt.GT.21 // 1751
D=A // 1752
@SP // 1753
AM=M+1 // 1754
A=A-1 // 1755
M=D // 1756
@LCL // 1757
A=M+1 // 1758
A=A+1 // 1759
A=A+1 // 1760
D=M // 1761
@DO_GT // 1762
0;JMP // 1763
(Math.sqrt.GT.21)
@SP // 1764
AM=M-1 // 1765
D=D&M // 1766
D=!D // 1767
@Math.sqrt.IfElseEND1 // 1768
D;JNE // 1769

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1770
A=M+1 // 1771
A=A+1 // 1772
D=M // 1773
@LCL // 1774
A=M // 1775
M=D // 1776

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

@LCL // 1777
A=M+1 // 1778
M=M-1 // 1779

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1780
0;JMP // 1781

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1782
A=M // 1783
D=M // 1784
@SP // 1785
AM=M+1 // 1786
A=A-1 // 1787
M=D // 1788
@RETURN // 1789
0;JMP // 1790

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.max.IfElseEND1}}
@Math.max.GT.22 // 1791
D=A // 1792
@SP // 1793
AM=M+1 // 1794
A=A-1 // 1795
M=D // 1796
@ARG // 1797
A=M+1 // 1798
D=M // 1799
A=A-1 // 1800
D=M-D // 1801
@DO_GT // 1802
0;JMP // 1803
(Math.max.GT.22)
D=!D // 1804
@Math.max.IfElseEND1 // 1805
D;JNE // 1806

////PushInstruction("argument 0")
@ARG // 1807
A=M // 1808
D=M // 1809
@SP // 1810
AM=M+1 // 1811
A=A-1 // 1812
M=D // 1813
@RETURN // 1814
0;JMP // 1815

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1816
A=M+1 // 1817
D=M // 1818
@SP // 1819
AM=M+1 // 1820
A=A-1 // 1821
M=D // 1822
@RETURN // 1823
0;JMP // 1824

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.min.IfElseEND1}}
@Math.min.LT.23 // 1825
D=A // 1826
@SP // 1827
AM=M+1 // 1828
A=A-1 // 1829
M=D // 1830
@ARG // 1831
A=M+1 // 1832
D=M // 1833
A=A-1 // 1834
D=M-D // 1835
@DO_LT // 1836
0;JMP // 1837
(Math.min.LT.23)
D=!D // 1838
@Math.min.IfElseEND1 // 1839
D;JNE // 1840

////PushInstruction("argument 0")
@ARG // 1841
A=M // 1842
D=M // 1843
@SP // 1844
AM=M+1 // 1845
A=A-1 // 1846
M=D // 1847
@RETURN // 1848
0;JMP // 1849

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1850
A=M+1 // 1851
D=M // 1852
@SP // 1853
AM=M+1 // 1854
A=A-1 // 1855
M=D // 1856
@RETURN // 1857
0;JMP // 1858

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1859
A=M // 1860
D=M // 1861
@SP // 1862
AM=M+1 // 1863
A=A-1 // 1864
M=D // 1865
@ARG // 1866
A=M // 1867
D=M // 1868
@SP // 1869
AM=M+1 // 1870
A=A-1 // 1871
M=D // 1872
@SP // 1873
A=M-1 // 1874
M=-D // 1875
// call Math.max
@7 // 1876
D=A // 1877
@14 // 1878
M=D // 1879
@Math.max // 1880
D=A // 1881
@13 // 1882
M=D // 1883
@Math.abs.ret.0 // 1884
D=A // 1885
@CALL // 1886
0;JMP // 1887
(Math.abs.ret.0)
@RETURN // 1888
0;JMP // 1889

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1890
M=M+1 // 1891
AM=M+1 // 1892
A=A-1 // 1893
M=0 // 1894
A=A-1 // 1895
M=0 // 1896

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

@2055 // 1897
D=A // 1898
@LCL // 1899
A=M // 1900
M=D // 1901

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
@LCL // 1902
A=M // 1903
D=M // 1904
@SP // 1905
AM=M+1 // 1906
A=A-1 // 1907
M=D // 1908
@LCL // 1909
A=M // 1910
D=M // 1911
@16384 // 1912
D=A-D // 1913
@5 // 1914
D=D-A // 1915
@SP // 1916
AM=M-1 // 1917
A=M // 1918
M=D // 1919

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1920
A=M // 1921
D=M // 1922
@SP // 1923
AM=M+1 // 1924
A=A-1 // 1925
M=D+1 // 1926
D=1 // 1927
@SP // 1928
AM=M-1 // 1929
A=M // 1930
M=D // 1931

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1932
A=M // 1933
D=M // 1934
@2 // 1935
D=D+A // 1936
@SP // 1937
AM=M+1 // 1938
A=A-1 // 1939
M=D // 1940
D=0 // 1941
@SP // 1942
AM=M-1 // 1943
A=M // 1944
M=D // 1945

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1946
A=M // 1947
D=M // 1948
@3 // 1949
D=D+A // 1950
@SP // 1951
AM=M+1 // 1952
A=A-1 // 1953
M=D // 1954
D=0 // 1955
@SP // 1956
AM=M-1 // 1957
A=M // 1958
M=D // 1959

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1960
A=M // 1961
D=M // 1962
@SP // 1963
AM=M+1 // 1964
A=A-1 // 1965
M=D // 1966
// call Memory.create_foot
@6 // 1967
D=A // 1968
@14 // 1969
M=D // 1970
@Memory.create_foot // 1971
D=A // 1972
@13 // 1973
M=D // 1974
@Memory.init.ret.0 // 1975
D=A // 1976
@CALL // 1977
0;JMP // 1978
(Memory.init.ret.0)
@SP // 1979
M=M-1 // 1980

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

@2054 // 1981
D=A // 1982
@SP // 1983
AM=M+1 // 1984
A=A-1 // 1985
M=D // 1986
@2054 // 1987
D=A // 1988
@SP // 1989
AM=M+1 // 1990
A=A-1 // 1991
M=D // 1992
@LCL // 1993
A=M // 1994
D=M // 1995
@SP // 1996
AM=M+1 // 1997
A=A-1 // 1998
M=D // 1999
// call Memory.add_node
@7 // 2000
D=A // 2001
@14 // 2002
M=D // 2003
@Memory.add_node // 2004
D=A // 2005
@13 // 2006
M=D // 2007
@Memory.init.ret.1 // 2008
D=A // 2009
@CALL // 2010
0;JMP // 2011
(Memory.init.ret.1)
@SP // 2012
M=M-1 // 2013

////PushInstruction("constant 0")
@SP // 2014
AM=M+1 // 2015
A=A-1 // 2016
M=0 // 2017
@RETURN // 2018
0;JMP // 2019

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2020
D=A // 2021
@SP // 2022
AM=D+M // 2023
A=A-1 // 2024
M=0 // 2025
A=A-1 // 2026
M=0 // 2027
A=A-1 // 2028
M=0 // 2029
A=A-1 // 2030
M=0 // 2031
A=A-1 // 2032
M=0 // 2033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2034
A=M // 2035
D=M // 2036
@SP // 2037
AM=M+1 // 2038
A=A-1 // 2039
M=D // 2040
// call Memory.getBinIndex
@6 // 2041
D=A // 2042
@14 // 2043
M=D // 2044
@Memory.getBinIndex // 2045
D=A // 2046
@13 // 2047
M=D // 2048
@Memory.alloc.ret.0 // 2049
D=A // 2050
@CALL // 2051
0;JMP // 2052
(Memory.alloc.ret.0)
@SP // 2053
AM=M-1 // 2054
D=M // 2055
@LCL // 2056
A=M // 2057
M=D // 2058

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

@LCL // 2059
A=M // 2060
D=M // 2061
@2048 // 2062
D=D+A // 2063
@LCL // 2064
A=M+1 // 2065
M=D // 2066

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2067
A=M+1 // 2068
D=M // 2069
@SP // 2070
AM=M+1 // 2071
A=A-1 // 2072
M=D // 2073
@ARG // 2074
A=M // 2075
D=M // 2076
@SP // 2077
AM=M+1 // 2078
A=A-1 // 2079
M=D // 2080
// call Memory.get_best_fit
@7 // 2081
D=A // 2082
@14 // 2083
M=D // 2084
@Memory.get_best_fit // 2085
D=A // 2086
@13 // 2087
M=D // 2088
@Memory.alloc.ret.1 // 2089
D=A // 2090
@CALL // 2091
0;JMP // 2092
(Memory.alloc.ret.1)
@SP // 2093
AM=M-1 // 2094
D=M // 2095
@LCL // 2096
A=M+1 // 2097
A=A+1 // 2098
M=D // 2099

////LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.alloc1}}
@Memory.alloc.EQ.0 // 2100
D=A // 2101
@SP // 2102
AM=M+1 // 2103
A=A-1 // 2104
M=D // 2105
@LCL // 2106
A=M+1 // 2107
A=A+1 // 2108
D=M // 2109
@DO_EQ // 2110
0;JMP // 2111
(Memory.alloc.EQ.0)
D=!D // 2112
@WHILE_END_Memory.alloc1 // 2113
D;JNE // 2114

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElseEND1}}
@Memory.alloc.LT.1 // 2115
D=A // 2116
@SP // 2117
AM=M+1 // 2118
A=A-1 // 2119
M=D // 2120
@LCL // 2121
A=M // 2122
D=M // 2123
D=D+1 // 2124
@7 // 2125
D=D-A // 2126
@DO_LT // 2127
0;JMP // 2128
(Memory.alloc.LT.1)
@Memory.alloc.IfElseEND1 // 2129
D;JNE // 2130

////PushInstruction("constant 0")
@SP // 2131
AM=M+1 // 2132
A=A-1 // 2133
M=0 // 2134
@RETURN // 2135
0;JMP // 2136

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

@LCL // 2137
A=M // 2138
M=M+1 // 2139

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

@LCL // 2140
A=M // 2141
D=M // 2142
@2048 // 2143
D=D+A // 2144
@LCL // 2145
A=M+1 // 2146
M=D // 2147

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2148
A=M+1 // 2149
D=M // 2150
@SP // 2151
AM=M+1 // 2152
A=A-1 // 2153
M=D // 2154
@ARG // 2155
A=M // 2156
D=M // 2157
@SP // 2158
AM=M+1 // 2159
A=A-1 // 2160
M=D // 2161
// call Memory.get_best_fit
@7 // 2162
D=A // 2163
@14 // 2164
M=D // 2165
@Memory.get_best_fit // 2166
D=A // 2167
@13 // 2168
M=D // 2169
@Memory.alloc.ret.2 // 2170
D=A // 2171
@CALL // 2172
0;JMP // 2173
(Memory.alloc.ret.2)
@SP // 2174
AM=M-1 // 2175
D=M // 2176
@LCL // 2177
A=M+1 // 2178
A=A+1 // 2179
M=D // 2180

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2181
0;JMP // 2182

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

@LCL // 2183
A=M+1 // 2184
A=A+1 // 2185
D=M // 2186
@0 // 2187
A=D+A // 2188
D=M // 2189
@SP // 2190
AM=M+1 // 2191
A=A-1 // 2192
M=D // 2193
// call Memory.getBinIndex
@6 // 2194
D=A // 2195
@14 // 2196
M=D // 2197
@Memory.getBinIndex // 2198
D=A // 2199
@13 // 2200
M=D // 2201
@Memory.alloc.ret.3 // 2202
D=A // 2203
@CALL // 2204
0;JMP // 2205
(Memory.alloc.ret.3)
@SP // 2206
AM=M-1 // 2207
D=M // 2208
@2048 // 2209
D=D+A // 2210
@SP // 2211
AM=M+1 // 2212
A=A-1 // 2213
M=D // 2214
@LCL // 2215
A=M+1 // 2216
A=A+1 // 2217
D=M // 2218
@SP // 2219
AM=M+1 // 2220
A=A-1 // 2221
M=D // 2222
// call Memory.remove_node
@7 // 2223
D=A // 2224
@14 // 2225
M=D // 2226
@Memory.remove_node // 2227
D=A // 2228
@13 // 2229
M=D // 2230
@Memory.alloc.ret.4 // 2231
D=A // 2232
@CALL // 2233
0;JMP // 2234
(Memory.alloc.ret.4)
@SP // 2235
M=M-1 // 2236

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

@LCL // 2237
A=M+1 // 2238
A=A+1 // 2239
D=M // 2240
@0 // 2241
A=D+A // 2242
D=M // 2243
@SP // 2244
AM=M+1 // 2245
A=A-1 // 2246
M=D // 2247
@ARG // 2248
A=M // 2249
D=M // 2250
@SP // 2251
AM=M-1 // 2252
D=M-D // 2253
@LCL // 2254
A=M+1 // 2255
A=A+1 // 2256
A=A+1 // 2257
M=D // 2258

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 5"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
@Memory.alloc.GT.2 // 2259
D=A // 2260
@SP // 2261
AM=M+1 // 2262
A=A-1 // 2263
M=D // 2264
@LCL // 2265
A=M+1 // 2266
A=A+1 // 2267
A=A+1 // 2268
D=M // 2269
@5 // 2270
D=D-A // 2271
@DO_GT // 2272
0;JMP // 2273
(Memory.alloc.GT.2)
D=!D // 2274
@Memory.alloc.IfElse2 // 2275
D;JNE // 2276

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2277
A=M+1 // 2278
A=A+1 // 2279
D=M // 2280
@SP // 2281
AM=M+1 // 2282
A=A-1 // 2283
M=D // 2284
@ARG // 2285
A=M // 2286
D=M // 2287
@SP // 2288
AM=M-1 // 2289
A=M // 2290
M=D // 2291

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2292
A=M+1 // 2293
A=A+1 // 2294
D=M // 2295
@SP // 2296
AM=M+1 // 2297
A=A-1 // 2298
M=D+1 // 2299
D=0 // 2300
@SP // 2301
AM=M-1 // 2302
A=M // 2303
M=D // 2304

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2305
A=M+1 // 2306
A=A+1 // 2307
D=M // 2308
@SP // 2309
AM=M+1 // 2310
A=A-1 // 2311
M=D // 2312
// call Memory.create_foot
@6 // 2313
D=A // 2314
@14 // 2315
M=D // 2316
@Memory.create_foot // 2317
D=A // 2318
@13 // 2319
M=D // 2320
@Memory.alloc.ret.5 // 2321
D=A // 2322
@CALL // 2323
0;JMP // 2324
(Memory.alloc.ret.5)
@SP // 2325
M=M-1 // 2326

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

@LCL // 2327
A=M+1 // 2328
A=A+1 // 2329
D=M // 2330
@SP // 2331
AM=M+1 // 2332
A=A-1 // 2333
M=D // 2334
@ARG // 2335
A=M // 2336
D=M // 2337
@SP // 2338
AM=M-1 // 2339
D=D+M // 2340
@5 // 2341
D=D+A // 2342
@SP // 2343
AM=M+1 // 2344
A=A-1 // 2345
M=D // 2346
@LCL // 2347
D=M // 2348
@4 // 2349
A=D+A // 2350
D=A // 2351
@R13 // 2352
M=D // 2353
@SP // 2354
AM=M-1 // 2355
D=M // 2356
@R13 // 2357
A=M // 2358
M=D // 2359

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
@LCL // 2360
D=M // 2361
@4 // 2362
A=D+A // 2363
D=M // 2364
@SP // 2365
AM=M+1 // 2366
A=A-1 // 2367
M=D // 2368
@LCL // 2369
A=M+1 // 2370
A=A+1 // 2371
A=A+1 // 2372
D=M // 2373
@5 // 2374
D=D-A // 2375
@SP // 2376
AM=M-1 // 2377
A=M // 2378
M=D // 2379

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2380
D=M // 2381
@4 // 2382
A=D+A // 2383
D=M // 2384
@SP // 2385
AM=M+1 // 2386
A=A-1 // 2387
M=D+1 // 2388
D=1 // 2389
@SP // 2390
AM=M-1 // 2391
A=M // 2392
M=D // 2393

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2394
D=M // 2395
@4 // 2396
A=D+A // 2397
D=M // 2398
@SP // 2399
AM=M+1 // 2400
A=A-1 // 2401
M=D // 2402
// call Memory.create_foot
@6 // 2403
D=A // 2404
@14 // 2405
M=D // 2406
@Memory.create_foot // 2407
D=A // 2408
@13 // 2409
M=D // 2410
@Memory.alloc.ret.6 // 2411
D=A // 2412
@CALL // 2413
0;JMP // 2414
(Memory.alloc.ret.6)
@SP // 2415
M=M-1 // 2416

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

@LCL // 2417
A=M+1 // 2418
A=A+1 // 2419
A=A+1 // 2420
D=M // 2421
@SP // 2422
AM=M+1 // 2423
A=A-1 // 2424
M=D // 2425
// call Memory.getBinIndex
@6 // 2426
D=A // 2427
@14 // 2428
M=D // 2429
@Memory.getBinIndex // 2430
D=A // 2431
@13 // 2432
M=D // 2433
@Memory.alloc.ret.7 // 2434
D=A // 2435
@CALL // 2436
0;JMP // 2437
(Memory.alloc.ret.7)
@SP // 2438
AM=M-1 // 2439
D=M // 2440
@2048 // 2441
D=D+A // 2442
@SP // 2443
AM=M+1 // 2444
A=A-1 // 2445
M=D // 2446
@LCL // 2447
D=M // 2448
@4 // 2449
A=D+A // 2450
D=M // 2451
@SP // 2452
AM=M+1 // 2453
A=A-1 // 2454
M=D // 2455
// call Memory.add_node
@7 // 2456
D=A // 2457
@14 // 2458
M=D // 2459
@Memory.add_node // 2460
D=A // 2461
@13 // 2462
M=D // 2463
@Memory.alloc.ret.8 // 2464
D=A // 2465
@CALL // 2466
0;JMP // 2467
(Memory.alloc.ret.8)
@SP // 2468
M=M-1 // 2469

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2470
0;JMP // 2471

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
@LCL // 2472
A=M+1 // 2473
A=A+1 // 2474
D=M // 2475
@SP // 2476
AM=M+1 // 2477
A=A-1 // 2478
M=D+1 // 2479
D=0 // 2480
@SP // 2481
AM=M-1 // 2482
A=M // 2483
M=D // 2484

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2485
A=M+1 // 2486
A=A+1 // 2487
D=M // 2488
@SP // 2489
AM=M+1 // 2490
A=A-1 // 2491
M=D // 2492
// call Memory.create_foot
@6 // 2493
D=A // 2494
@14 // 2495
M=D // 2496
@Memory.create_foot // 2497
D=A // 2498
@13 // 2499
M=D // 2500
@Memory.alloc.ret.9 // 2501
D=A // 2502
@CALL // 2503
0;JMP // 2504
(Memory.alloc.ret.9)
@SP // 2505
M=M-1 // 2506

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
@LCL // 2507
A=M+1 // 2508
A=A+1 // 2509
D=M // 2510
@4 // 2511
D=D+A // 2512
@SP // 2513
AM=M+1 // 2514
A=A-1 // 2515
M=D // 2516
@RETURN // 2517
0;JMP // 2518

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2519
AM=M+1 // 2520
A=A-1 // 2521
M=0 // 2522

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2523
A=M // 2524
D=M // 2525
@SP // 2526
AM=M+1 // 2527
A=A-1 // 2528
M=D // 2529
// call Memory.alloc
@6 // 2530
D=A // 2531
@14 // 2532
M=D // 2533
@Memory.alloc // 2534
D=A // 2535
@13 // 2536
M=D // 2537
@Memory.calloc.ret.0 // 2538
D=A // 2539
@CALL // 2540
0;JMP // 2541
(Memory.calloc.ret.0)
@SP // 2542
AM=M-1 // 2543
D=M // 2544
@LCL // 2545
A=M // 2546
M=D // 2547

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElseEND1}}
@LCL // 2548
A=M // 2549
D=M // 2550
@Memory.calloc.IfElseEND1 // 2551
D;JNE // 2552

////PushInstruction("constant 0")
@SP // 2553
AM=M+1 // 2554
A=A-1 // 2555
M=0 // 2556
@RETURN // 2557
0;JMP // 2558

////LabelInstruction{label='Memory.calloc.IfElseEND1}
// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.calloc1}
// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.calloc1}}
@Memory.calloc.GT.3 // 2559
D=A // 2560
@SP // 2561
AM=M+1 // 2562
A=A-1 // 2563
M=D // 2564
@ARG // 2565
A=M // 2566
D=M // 2567
@DO_GT // 2568
0;JMP // 2569
(Memory.calloc.GT.3)
D=!D // 2570
@WHILE_END_Memory.calloc1 // 2571
D;JNE // 2572

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

@ARG // 2573
A=M // 2574
M=M-1 // 2575

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2576
A=M // 2577
D=M // 2578
@SP // 2579
AM=M+1 // 2580
A=A-1 // 2581
M=D // 2582
@ARG // 2583
A=M // 2584
D=M // 2585
@SP // 2586
AM=M-1 // 2587
D=D+M // 2588
@SP // 2589
AM=M+1 // 2590
A=A-1 // 2591
M=D // 2592
D=0 // 2593
@SP // 2594
AM=M-1 // 2595
A=M // 2596
M=D // 2597

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2598
0;JMP // 2599

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2600
A=M // 2601
D=M // 2602
@SP // 2603
AM=M+1 // 2604
A=A-1 // 2605
M=D // 2606
@RETURN // 2607
0;JMP // 2608

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2609
D=A // 2610
@SP // 2611
AM=D+M // 2612
A=A-1 // 2613
M=0 // 2614
A=A-1 // 2615
M=0 // 2616
A=A-1 // 2617
M=0 // 2618

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

@ARG // 2619
A=M // 2620
D=M // 2621
@4 // 2622
D=D-A // 2623
@LCL // 2624
A=M // 2625
M=D // 2626

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2627
A=M // 2628
D=M // 2629
@SP // 2630
AM=M+1 // 2631
A=A-1 // 2632
M=D+1 // 2633
D=1 // 2634
@SP // 2635
AM=M-1 // 2636
A=M // 2637
M=D // 2638

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

@LCL // 2639
A=M // 2640
D=M // 2641
@2 // 2642
A=D+A // 2643
D=M // 2644
@LCL // 2645
A=M+1 // 2646
M=D // 2647

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

@LCL // 2648
A=M // 2649
D=M // 2650
@3 // 2651
A=D+A // 2652
D=M // 2653
@LCL // 2654
A=M+1 // 2655
A=A+1 // 2656
M=D // 2657

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElseEND1}}
@Memory.deAlloc.EQ.4 // 2658
D=A // 2659
@SP // 2660
AM=M+1 // 2661
A=A-1 // 2662
M=D // 2663
@LCL // 2664
A=M+1 // 2665
D=M // 2666
@DO_EQ // 2667
0;JMP // 2668
(Memory.deAlloc.EQ.4)
@Memory.deAlloc.IfElseEND1 // 2669
D;JNE // 2670

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 1"),
//                        right:
//                            PushInstruction("constant 1"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElseEND2}}
@Memory.deAlloc.EQ.5 // 2671
D=A // 2672
@SP // 2673
AM=M+1 // 2674
A=A-1 // 2675
M=D // 2676
@LCL // 2677
A=M+1 // 2678
D=M // 2679
A=D+1 // 2680
D=M // 2681
D=D-1 // 2682
@DO_EQ // 2683
0;JMP // 2684
(Memory.deAlloc.EQ.5)
D=!D // 2685
@Memory.deAlloc.IfElseEND2 // 2686
D;JNE // 2687

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

@LCL // 2688
A=M+1 // 2689
D=M // 2690
@0 // 2691
A=D+A // 2692
D=M // 2693
@SP // 2694
AM=M+1 // 2695
A=A-1 // 2696
M=D // 2697
// call Memory.getBinIndex
@6 // 2698
D=A // 2699
@14 // 2700
M=D // 2701
@Memory.getBinIndex // 2702
D=A // 2703
@13 // 2704
M=D // 2705
@Memory.deAlloc.ret.0 // 2706
D=A // 2707
@CALL // 2708
0;JMP // 2709
(Memory.deAlloc.ret.0)
@SP // 2710
AM=M-1 // 2711
D=M // 2712
@2048 // 2713
D=D+A // 2714
@SP // 2715
AM=M+1 // 2716
A=A-1 // 2717
M=D // 2718
@LCL // 2719
A=M+1 // 2720
D=M // 2721
@SP // 2722
AM=M+1 // 2723
A=A-1 // 2724
M=D // 2725
// call Memory.remove_node
@7 // 2726
D=A // 2727
@14 // 2728
M=D // 2729
@Memory.remove_node // 2730
D=A // 2731
@13 // 2732
M=D // 2733
@Memory.deAlloc.ret.1 // 2734
D=A // 2735
@CALL // 2736
0;JMP // 2737
(Memory.deAlloc.ret.1)
@SP // 2738
M=M-1 // 2739

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
@LCL // 2740
A=M+1 // 2741
D=M // 2742
@SP // 2743
AM=M+1 // 2744
A=A-1 // 2745
M=D // 2746
@LCL // 2747
A=M+1 // 2748
D=M // 2749
@0 // 2750
A=D+A // 2751
D=M // 2752
@SP // 2753
AM=M+1 // 2754
A=A-1 // 2755
M=D // 2756
@LCL // 2757
A=M // 2758
D=M // 2759
@0 // 2760
A=D+A // 2761
D=M // 2762
@SP // 2763
AM=M-1 // 2764
D=D+M // 2765
@5 // 2766
D=D+A // 2767
@SP // 2768
AM=M-1 // 2769
A=M // 2770
M=D // 2771

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2772
A=M+1 // 2773
D=M // 2774
@SP // 2775
AM=M+1 // 2776
A=A-1 // 2777
M=D // 2778
// call Memory.create_foot
@6 // 2779
D=A // 2780
@14 // 2781
M=D // 2782
@Memory.create_foot // 2783
D=A // 2784
@13 // 2785
M=D // 2786
@Memory.deAlloc.ret.2 // 2787
D=A // 2788
@CALL // 2789
0;JMP // 2790
(Memory.deAlloc.ret.2)
@SP // 2791
M=M-1 // 2792

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2793
A=M+1 // 2794
D=M // 2795
@LCL // 2796
A=M // 2797
M=D // 2798

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElseEND3}}
@Memory.deAlloc.EQ.6 // 2799
D=A // 2800
@SP // 2801
AM=M+1 // 2802
A=A-1 // 2803
M=D // 2804
@LCL // 2805
A=M+1 // 2806
A=A+1 // 2807
D=M // 2808
@DO_EQ // 2809
0;JMP // 2810
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElseEND3 // 2811
D;JNE // 2812

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 2"),
//                        right:
//                            PushInstruction("constant 1"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElseEND4}}
@Memory.deAlloc.EQ.7 // 2813
D=A // 2814
@SP // 2815
AM=M+1 // 2816
A=A-1 // 2817
M=D // 2818
@LCL // 2819
A=M+1 // 2820
A=A+1 // 2821
D=M // 2822
A=D+1 // 2823
D=M // 2824
D=D-1 // 2825
@DO_EQ // 2826
0;JMP // 2827
(Memory.deAlloc.EQ.7)
D=!D // 2828
@Memory.deAlloc.IfElseEND4 // 2829
D;JNE // 2830

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

@LCL // 2831
A=M+1 // 2832
A=A+1 // 2833
D=M // 2834
@0 // 2835
A=D+A // 2836
D=M // 2837
@SP // 2838
AM=M+1 // 2839
A=A-1 // 2840
M=D // 2841
// call Memory.getBinIndex
@6 // 2842
D=A // 2843
@14 // 2844
M=D // 2845
@Memory.getBinIndex // 2846
D=A // 2847
@13 // 2848
M=D // 2849
@Memory.deAlloc.ret.3 // 2850
D=A // 2851
@CALL // 2852
0;JMP // 2853
(Memory.deAlloc.ret.3)
@SP // 2854
AM=M-1 // 2855
D=M // 2856
@2048 // 2857
D=D+A // 2858
@SP // 2859
AM=M+1 // 2860
A=A-1 // 2861
M=D // 2862
@LCL // 2863
A=M+1 // 2864
A=A+1 // 2865
D=M // 2866
@SP // 2867
AM=M+1 // 2868
A=A-1 // 2869
M=D // 2870
// call Memory.remove_node
@7 // 2871
D=A // 2872
@14 // 2873
M=D // 2874
@Memory.remove_node // 2875
D=A // 2876
@13 // 2877
M=D // 2878
@Memory.deAlloc.ret.4 // 2879
D=A // 2880
@CALL // 2881
0;JMP // 2882
(Memory.deAlloc.ret.4)
@SP // 2883
M=M-1 // 2884

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
@LCL // 2885
A=M // 2886
D=M // 2887
@SP // 2888
AM=M+1 // 2889
A=A-1 // 2890
M=D // 2891
@LCL // 2892
A=M // 2893
D=M // 2894
@0 // 2895
A=D+A // 2896
D=M // 2897
@SP // 2898
AM=M+1 // 2899
A=A-1 // 2900
M=D // 2901
@LCL // 2902
A=M+1 // 2903
A=A+1 // 2904
D=M // 2905
@0 // 2906
A=D+A // 2907
D=M // 2908
@SP // 2909
AM=M-1 // 2910
D=D+M // 2911
@5 // 2912
D=D+A // 2913
@SP // 2914
AM=M-1 // 2915
A=M // 2916
M=D // 2917

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2918
A=M // 2919
D=M // 2920
@SP // 2921
AM=M+1 // 2922
A=A-1 // 2923
M=D // 2924
// call Memory.create_foot
@6 // 2925
D=A // 2926
@14 // 2927
M=D // 2928
@Memory.create_foot // 2929
D=A // 2930
@13 // 2931
M=D // 2932
@Memory.deAlloc.ret.5 // 2933
D=A // 2934
@CALL // 2935
0;JMP // 2936
(Memory.deAlloc.ret.5)
@SP // 2937
M=M-1 // 2938

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

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

@LCL // 2939
A=M // 2940
D=M // 2941
@0 // 2942
A=D+A // 2943
D=M // 2944
@SP // 2945
AM=M+1 // 2946
A=A-1 // 2947
M=D // 2948
// call Memory.getBinIndex
@6 // 2949
D=A // 2950
@14 // 2951
M=D // 2952
@Memory.getBinIndex // 2953
D=A // 2954
@13 // 2955
M=D // 2956
@Memory.deAlloc.ret.6 // 2957
D=A // 2958
@CALL // 2959
0;JMP // 2960
(Memory.deAlloc.ret.6)
@SP // 2961
AM=M-1 // 2962
D=M // 2963
@2048 // 2964
D=D+A // 2965
@SP // 2966
AM=M+1 // 2967
A=A-1 // 2968
M=D // 2969
@LCL // 2970
A=M // 2971
D=M // 2972
@SP // 2973
AM=M+1 // 2974
A=A-1 // 2975
M=D // 2976
// call Memory.add_node
@7 // 2977
D=A // 2978
@14 // 2979
M=D // 2980
@Memory.add_node // 2981
D=A // 2982
@13 // 2983
M=D // 2984
@Memory.deAlloc.ret.7 // 2985
D=A // 2986
@CALL // 2987
0;JMP // 2988
(Memory.deAlloc.ret.7)
@SP // 2989
M=M-1 // 2990

////PushInstruction("constant 0")
@SP // 2991
AM=M+1 // 2992
A=A-1 // 2993
M=0 // 2994
@RETURN // 2995
0;JMP // 2996

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 2997
D=A // 2998
@SP // 2999
AM=D+M // 3000
A=A-1 // 3001
M=0 // 3002
A=A-1 // 3003
M=0 // 3004
A=A-1 // 3005
M=0 // 3006
A=A-1 // 3007
M=0 // 3008

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElseEND1}}
@Memory.realloc.EQ.8 // 3009
D=A // 3010
@SP // 3011
AM=M+1 // 3012
A=A-1 // 3013
M=D // 3014
@ARG // 3015
A=M // 3016
D=M // 3017
@DO_EQ // 3018
0;JMP // 3019
(Memory.realloc.EQ.8)
D=!D // 3020
@Memory.realloc.IfElseEND1 // 3021
D;JNE // 3022

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3023
A=M+1 // 3024
D=M // 3025
@SP // 3026
AM=M+1 // 3027
A=A-1 // 3028
M=D // 3029
// call Memory.alloc
@6 // 3030
D=A // 3031
@14 // 3032
M=D // 3033
@Memory.alloc // 3034
D=A // 3035
@13 // 3036
M=D // 3037
@Memory.realloc.ret.0 // 3038
D=A // 3039
@CALL // 3040
0;JMP // 3041
(Memory.realloc.ret.0)
@RETURN // 3042
0;JMP // 3043

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

@ARG // 3044
A=M // 3045
D=M // 3046
D=D-1 // 3047
@LCL // 3048
A=M+1 // 3049
A=A+1 // 3050
A=A+1 // 3051
M=D // 3052

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

@LCL // 3053
A=M+1 // 3054
A=A+1 // 3055
A=A+1 // 3056
D=M // 3057
@0 // 3058
A=D+A // 3059
D=M // 3060
@LCL // 3061
A=M // 3062
M=D // 3063

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3064
A=M+1 // 3065
D=M // 3066
@SP // 3067
AM=M+1 // 3068
A=A-1 // 3069
M=D // 3070
// call Memory.alloc
@6 // 3071
D=A // 3072
@14 // 3073
M=D // 3074
@Memory.alloc // 3075
D=A // 3076
@13 // 3077
M=D // 3078
@Memory.realloc.ret.1 // 3079
D=A // 3080
@CALL // 3081
0;JMP // 3082
(Memory.realloc.ret.1)
@SP // 3083
AM=M-1 // 3084
D=M // 3085
@LCL // 3086
A=M+1 // 3087
M=D // 3088

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElseEND2}}
@Memory.realloc.EQ.9 // 3089
D=A // 3090
@SP // 3091
AM=M+1 // 3092
A=A-1 // 3093
M=D // 3094
@LCL // 3095
A=M+1 // 3096
D=M // 3097
@DO_EQ // 3098
0;JMP // 3099
(Memory.realloc.EQ.9)
D=!D // 3100
@Memory.realloc.IfElseEND2 // 3101
D;JNE // 3102

////PushInstruction("constant 0")
@SP // 3103
AM=M+1 // 3104
A=A-1 // 3105
M=0 // 3106
@RETURN // 3107
0;JMP // 3108

////LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse3}}
@Memory.realloc.GT.10 // 3109
D=A // 3110
@SP // 3111
AM=M+1 // 3112
A=A-1 // 3113
M=D // 3114
@LCL // 3115
A=M // 3116
D=M // 3117
@SP // 3118
AM=M+1 // 3119
A=A-1 // 3120
M=D // 3121
@ARG // 3122
A=M+1 // 3123
D=M // 3124
@SP // 3125
AM=M-1 // 3126
D=M-D // 3127
@DO_GT // 3128
0;JMP // 3129
(Memory.realloc.GT.10)
@Memory.realloc.IfElse3 // 3130
D;JNE // 3131

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3132
A=M // 3133
D=M // 3134
@LCL // 3135
A=M+1 // 3136
A=A+1 // 3137
M=D // 3138

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3139
0;JMP // 3140

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3141
A=M+1 // 3142
D=M // 3143
@LCL // 3144
A=M+1 // 3145
A=A+1 // 3146
M=D // 3147

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3148
A=M // 3149
D=M // 3150
@SP // 3151
AM=M+1 // 3152
A=A-1 // 3153
M=D // 3154
@LCL // 3155
A=M+1 // 3156
D=M // 3157
@SP // 3158
AM=M+1 // 3159
A=A-1 // 3160
M=D // 3161
@LCL // 3162
A=M+1 // 3163
A=A+1 // 3164
D=M // 3165
@SP // 3166
AM=M+1 // 3167
A=A-1 // 3168
M=D // 3169
// call Memory.copy
@8 // 3170
D=A // 3171
@14 // 3172
M=D // 3173
@Memory.copy // 3174
D=A // 3175
@13 // 3176
M=D // 3177
@Memory.realloc.ret.2 // 3178
D=A // 3179
@CALL // 3180
0;JMP // 3181
(Memory.realloc.ret.2)
@SP // 3182
M=M-1 // 3183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3184
A=M // 3185
D=M // 3186
@SP // 3187
AM=M+1 // 3188
A=A-1 // 3189
M=D // 3190
// call Memory.deAlloc
@6 // 3191
D=A // 3192
@14 // 3193
M=D // 3194
@Memory.deAlloc // 3195
D=A // 3196
@13 // 3197
M=D // 3198
@Memory.realloc.ret.3 // 3199
D=A // 3200
@CALL // 3201
0;JMP // 3202
(Memory.realloc.ret.3)
@SP // 3203
M=M-1 // 3204

////PushInstruction("local 1")
@LCL // 3205
A=M+1 // 3206
D=M // 3207
@SP // 3208
AM=M+1 // 3209
A=A-1 // 3210
M=D // 3211
@RETURN // 3212
0;JMP // 3213

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3214
AM=M+1 // 3215
A=A-1 // 3216
M=0 // 3217

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3218
A=M // 3219
M=0 // 3220

////LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.copy1}}
@Memory.copy.LT.11 // 3221
D=A // 3222
@SP // 3223
AM=M+1 // 3224
A=A-1 // 3225
M=D // 3226
@LCL // 3227
A=M // 3228
D=M // 3229
@SP // 3230
AM=M+1 // 3231
A=A-1 // 3232
M=D // 3233
@ARG // 3234
A=M+1 // 3235
A=A+1 // 3236
D=M // 3237
@SP // 3238
AM=M-1 // 3239
D=M-D // 3240
@DO_LT // 3241
0;JMP // 3242
(Memory.copy.LT.11)
D=!D // 3243
@WHILE_END_Memory.copy1 // 3244
D;JNE // 3245

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
@ARG // 3246
A=M+1 // 3247
D=M // 3248
@SP // 3249
AM=M+1 // 3250
A=A-1 // 3251
M=D // 3252
@LCL // 3253
A=M // 3254
D=M // 3255
@SP // 3256
AM=M-1 // 3257
D=D+M // 3258
@SP // 3259
AM=M+1 // 3260
A=A-1 // 3261
M=D // 3262
@ARG // 3263
A=M // 3264
D=M // 3265
@SP // 3266
AM=M+1 // 3267
A=A-1 // 3268
M=D // 3269
@LCL // 3270
A=M // 3271
D=M // 3272
@SP // 3273
AM=M-1 // 3274
A=D+M // 3275
D=M // 3276
@SP // 3277
AM=M-1 // 3278
A=M // 3279
M=D // 3280

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

@LCL // 3281
A=M // 3282
M=M+1 // 3283

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3284
0;JMP // 3285

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3286
AM=M+1 // 3287
A=A-1 // 3288
M=0 // 3289
@RETURN // 3290
0;JMP // 3291

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 2"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse1}}
@Memory.remove_node.EQ.12 // 3292
D=A // 3293
@SP // 3294
AM=M+1 // 3295
A=A-1 // 3296
M=D // 3297
@ARG // 3298
A=M+1 // 3299
D=M // 3300
@2 // 3301
A=D+A // 3302
D=M // 3303
@DO_EQ // 3304
0;JMP // 3305
(Memory.remove_node.EQ.12)
@Memory.remove_node.IfElse1 // 3306
D;JNE // 3307

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
@ARG // 3308
A=M+1 // 3309
D=M // 3310
@2 // 3311
D=D+A // 3312
@3 // 3313
D=D+A // 3314
@SP // 3315
AM=M+1 // 3316
A=A-1 // 3317
M=D // 3318
@ARG // 3319
A=M+1 // 3320
D=M // 3321
@3 // 3322
A=D+A // 3323
D=M // 3324
@SP // 3325
AM=M-1 // 3326
A=M // 3327
M=D // 3328

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3329
0;JMP // 3330

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
@ARG // 3331
A=M // 3332
D=M // 3333
@SP // 3334
AM=M+1 // 3335
A=A-1 // 3336
M=D // 3337
@ARG // 3338
A=M+1 // 3339
D=M // 3340
@3 // 3341
A=D+A // 3342
D=M // 3343
@SP // 3344
AM=M-1 // 3345
A=M // 3346
M=D // 3347

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 1"),
//                    right:
//                        PushInstruction("constant 3"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElseEND2}}
@Memory.remove_node.EQ.13 // 3348
D=A // 3349
@SP // 3350
AM=M+1 // 3351
A=A-1 // 3352
M=D // 3353
@ARG // 3354
A=M+1 // 3355
D=M // 3356
@3 // 3357
A=D+A // 3358
D=M // 3359
@DO_EQ // 3360
0;JMP // 3361
(Memory.remove_node.EQ.13)
@Memory.remove_node.IfElseEND2 // 3362
D;JNE // 3363

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
@ARG // 3364
A=M+1 // 3365
D=M // 3366
@3 // 3367
D=D+A // 3368
@2 // 3369
D=D+A // 3370
@SP // 3371
AM=M+1 // 3372
A=A-1 // 3373
M=D // 3374
@ARG // 3375
A=M+1 // 3376
D=M // 3377
@2 // 3378
A=D+A // 3379
D=M // 3380
@SP // 3381
AM=M-1 // 3382
A=M // 3383
M=D // 3384

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
@ARG // 3385
A=M+1 // 3386
D=M // 3387
@2 // 3388
D=D+A // 3389
@SP // 3390
AM=M+1 // 3391
A=A-1 // 3392
M=D // 3393
D=0 // 3394
@SP // 3395
AM=M-1 // 3396
A=M // 3397
M=D // 3398

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3399
A=M+1 // 3400
D=M // 3401
@3 // 3402
D=D+A // 3403
@SP // 3404
AM=M+1 // 3405
A=A-1 // 3406
M=D // 3407
D=0 // 3408
@SP // 3409
AM=M-1 // 3410
A=M // 3411
M=D // 3412

////PushInstruction("constant 0")
@SP // 3413
AM=M+1 // 3414
A=A-1 // 3415
M=0 // 3416
@RETURN // 3417
0;JMP // 3418

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3419
AM=M+1 // 3420
A=A-1 // 3421
M=0 // 3422

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3423
A=M // 3424
M=0 // 3425

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

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
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}}
@Memory.getBinIndex.LT.14 // 3426
D=A // 3427
@SP // 3428
AM=M+1 // 3429
A=A-1 // 3430
M=D // 3431
@LCL // 3432
A=M // 3433
D=M // 3434
@7 // 3435
D=D-A // 3436
@DO_LT // 3437
0;JMP // 3438
(Memory.getBinIndex.LT.14)
@SP // 3439
AM=M+1 // 3440
A=A-1 // 3441
M=D // 3442
@Memory.getBinIndex.EQ.15 // 3443
D=A // 3444
@SP // 3445
AM=M+1 // 3446
A=A-1 // 3447
M=D // 3448
@LCL // 3449
A=M // 3450
D=M // 3451
@2048 // 3452
A=D+A // 3453
D=M // 3454
@DO_EQ // 3455
0;JMP // 3456
(Memory.getBinIndex.EQ.15)
D=!D // 3457
@SP // 3458
AM=M-1 // 3459
D=D&M // 3460
D=!D // 3461
@WHILE_END_Memory.getBinIndex1 // 3462
D;JNE // 3463

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//), PushInstruction("constant 16")], call=CallInstruction{Math.multiply}},
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.getBinIndex.IfElseEND1}}
@Memory.getBinIndex.GT.16 // 3464
D=A // 3465
@SP // 3466
AM=M+1 // 3467
A=A-1 // 3468
M=D // 3469
@ARG // 3470
A=M // 3471
D=M // 3472
@SP // 3473
AM=M+1 // 3474
A=A-1 // 3475
M=D // 3476
@LCL // 3477
A=M // 3478
D=M // 3479
@SP // 3480
AM=M+1 // 3481
A=A-1 // 3482
M=D+1 // 3483
@16 // 3484
D=A // 3485
@SP // 3486
AM=M+1 // 3487
A=A-1 // 3488
M=D // 3489
// call Math.multiply
@7 // 3490
D=A // 3491
@14 // 3492
M=D // 3493
@Math.multiply // 3494
D=A // 3495
@13 // 3496
M=D // 3497
@Memory.getBinIndex.ret.0 // 3498
D=A // 3499
@CALL // 3500
0;JMP // 3501
(Memory.getBinIndex.ret.0)
@SP // 3502
AM=M-1 // 3503
D=M // 3504
@SP // 3505
AM=M-1 // 3506
D=M-D // 3507
@DO_GT // 3508
0;JMP // 3509
(Memory.getBinIndex.GT.16)
@Memory.getBinIndex.IfElseEND1 // 3510
D;JNE // 3511

////PushInstruction("local 0")
@LCL // 3512
A=M // 3513
D=M // 3514
@SP // 3515
AM=M+1 // 3516
A=A-1 // 3517
M=D // 3518
@RETURN // 3519
0;JMP // 3520

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

@LCL // 3521
A=M // 3522
M=M+1 // 3523

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3524
0;JMP // 3525

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
@6 // 3526
D=A // 3527
@SP // 3528
AM=M+1 // 3529
A=A-1 // 3530
M=D // 3531
@7 // 3532
D=A // 3533
@SP // 3534
AM=M+1 // 3535
A=A-1 // 3536
M=D-1 // 3537
@RETURN // 3538
0;JMP // 3539

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3540
AM=M+1 // 3541
A=A-1 // 3542
M=0 // 3543

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

@ARG // 3544
A=M // 3545
D=M // 3546
@0 // 3547
A=D+A // 3548
D=M // 3549
@LCL // 3550
A=M // 3551
M=D // 3552

////ConditionalGroup{push=BinaryPushGroup(
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
//        PushInstruction("argument 1"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElseEND1}}
@Memory.get_best_fit.LT.17 // 3553
D=A // 3554
@SP // 3555
AM=M+1 // 3556
A=A-1 // 3557
M=D // 3558
@LCL // 3559
A=M // 3560
D=M // 3561
@0 // 3562
A=D+A // 3563
D=M // 3564
@SP // 3565
AM=M+1 // 3566
A=A-1 // 3567
M=D // 3568
@ARG // 3569
A=M+1 // 3570
D=M // 3571
@SP // 3572
AM=M-1 // 3573
D=M-D // 3574
@DO_LT // 3575
0;JMP // 3576
(Memory.get_best_fit.LT.17)
@Memory.get_best_fit.IfElseEND1 // 3577
D;JNE // 3578

////PushInstruction("local 0")
@LCL // 3579
A=M // 3580
D=M // 3581
@SP // 3582
AM=M+1 // 3583
A=A-1 // 3584
M=D // 3585
@RETURN // 3586
0;JMP // 3587

////LabelInstruction{label='Memory.get_best_fit.IfElseEND1}
// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.get_best_fit1}
// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)

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
//), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}}
@Memory.get_best_fit.EQ.18 // 3588
D=A // 3589
@SP // 3590
AM=M+1 // 3591
A=A-1 // 3592
M=D // 3593
@LCL // 3594
A=M // 3595
D=M // 3596
@3 // 3597
A=D+A // 3598
D=M // 3599
@DO_EQ // 3600
0;JMP // 3601
(Memory.get_best_fit.EQ.18)
@WHILE_END_Memory.get_best_fit1 // 3602
D;JNE // 3603

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

@LCL // 3604
A=M // 3605
D=M // 3606
@3 // 3607
A=D+A // 3608
D=M // 3609
@LCL // 3610
A=M // 3611
M=D // 3612

////ConditionalGroup{push=BinaryPushGroup(
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
//        PushInstruction("argument 1"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElseEND2}}
@Memory.get_best_fit.LT.19 // 3613
D=A // 3614
@SP // 3615
AM=M+1 // 3616
A=A-1 // 3617
M=D // 3618
@LCL // 3619
A=M // 3620
D=M // 3621
@0 // 3622
A=D+A // 3623
D=M // 3624
@SP // 3625
AM=M+1 // 3626
A=A-1 // 3627
M=D // 3628
@ARG // 3629
A=M+1 // 3630
D=M // 3631
@SP // 3632
AM=M-1 // 3633
D=M-D // 3634
@DO_LT // 3635
0;JMP // 3636
(Memory.get_best_fit.LT.19)
@Memory.get_best_fit.IfElseEND2 // 3637
D;JNE // 3638

////PushInstruction("local 0")
@LCL // 3639
A=M // 3640
D=M // 3641
@SP // 3642
AM=M+1 // 3643
A=A-1 // 3644
M=D // 3645
@RETURN // 3646
0;JMP // 3647

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3648
0;JMP // 3649

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3650
AM=M+1 // 3651
A=A-1 // 3652
M=0 // 3653
@RETURN // 3654
0;JMP // 3655

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
@ARG // 3656
A=M // 3657
D=M // 3658
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
@4 // 3669
D=D+A // 3670
@SP // 3671
AM=M-1 // 3672
D=D+M // 3673
@SP // 3674
AM=M+1 // 3675
A=A-1 // 3676
M=D // 3677
@ARG // 3678
A=M // 3679
D=M // 3680
@SP // 3681
AM=M-1 // 3682
A=M // 3683
M=D // 3684

////PushInstruction("constant 0")
@SP // 3685
AM=M+1 // 3686
A=A-1 // 3687
M=0 // 3688
@RETURN // 3689
0;JMP // 3690

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3691
M=M+1 // 3692
AM=M+1 // 3693
A=A-1 // 3694
M=0 // 3695
A=A-1 // 3696
M=0 // 3697

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3698
A=M+1 // 3699
D=M // 3700
@2 // 3701
D=D+A // 3702
@SP // 3703
AM=M+1 // 3704
A=A-1 // 3705
M=D // 3706
D=0 // 3707
@SP // 3708
AM=M-1 // 3709
A=M // 3710
M=D // 3711

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3712
A=M+1 // 3713
D=M // 3714
@3 // 3715
D=D+A // 3716
@SP // 3717
AM=M+1 // 3718
A=A-1 // 3719
M=D // 3720
D=0 // 3721
@SP // 3722
AM=M-1 // 3723
A=M // 3724
M=D // 3725

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElseEND1}}
@Memory.add_node.EQ.20 // 3726
D=A // 3727
@SP // 3728
AM=M+1 // 3729
A=A-1 // 3730
M=D // 3731
@ARG // 3732
A=M // 3733
D=M // 3734
@0 // 3735
A=D+A // 3736
D=M // 3737
@DO_EQ // 3738
0;JMP // 3739
(Memory.add_node.EQ.20)
D=!D // 3740
@Memory.add_node.IfElseEND1 // 3741
D;JNE // 3742

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3743
A=M // 3744
D=M // 3745
@SP // 3746
AM=M+1 // 3747
A=A-1 // 3748
M=D // 3749
@ARG // 3750
A=M+1 // 3751
D=M // 3752
@SP // 3753
AM=M-1 // 3754
A=M // 3755
M=D // 3756

////PushInstruction("constant 0")
@SP // 3757
AM=M+1 // 3758
A=A-1 // 3759
M=0 // 3760
@RETURN // 3761
0;JMP // 3762

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

@ARG // 3763
A=M // 3764
D=M // 3765
@0 // 3766
A=D+A // 3767
D=M // 3768
@LCL // 3769
A=M // 3770
M=D // 3771

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3772
A=M+1 // 3773
M=0 // 3774

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

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
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Memory.add_node1}}
@Memory.add_node.EQ.21 // 3775
D=A // 3776
@SP // 3777
AM=M+1 // 3778
A=A-1 // 3779
M=D // 3780
@LCL // 3781
A=M // 3782
D=M // 3783
@DO_EQ // 3784
0;JMP // 3785
(Memory.add_node.EQ.21)
@SP // 3786
AM=M+1 // 3787
A=A-1 // 3788
M=D // 3789
@SP // 3790
A=M-1 // 3791
M=!D // 3792
@Memory.add_node.GT.22 // 3793
D=A // 3794
@SP // 3795
AM=M+1 // 3796
A=A-1 // 3797
M=D // 3798
@LCL // 3799
A=M // 3800
D=M // 3801
@0 // 3802
A=D+A // 3803
D=M // 3804
@SP // 3805
AM=M+1 // 3806
A=A-1 // 3807
M=D // 3808
@ARG // 3809
A=M+1 // 3810
D=M // 3811
@0 // 3812
A=D+A // 3813
D=M // 3814
@SP // 3815
AM=M-1 // 3816
D=M-D // 3817
@DO_GT // 3818
0;JMP // 3819
(Memory.add_node.GT.22)
D=!D // 3820
@SP // 3821
AM=M-1 // 3822
D=D&M // 3823
D=!D // 3824
@WHILE_END_Memory.add_node1 // 3825
D;JNE // 3826

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3827
A=M // 3828
D=M // 3829
@LCL // 3830
A=M+1 // 3831
M=D // 3832

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

@LCL // 3833
A=M // 3834
D=M // 3835
@3 // 3836
A=D+A // 3837
D=M // 3838
@LCL // 3839
A=M // 3840
M=D // 3841

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 3842
0;JMP // 3843

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL // 3844
A=M+1 // 3845
D=M // 3846
@Memory.add_node.IfElse2 // 3847
D;JNE // 3848

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
@ARG // 3849
A=M+1 // 3850
D=M // 3851
@3 // 3852
D=D+A // 3853
@SP // 3854
AM=M+1 // 3855
A=A-1 // 3856
M=D // 3857
@ARG // 3858
A=M // 3859
D=M // 3860
@0 // 3861
A=D+A // 3862
D=M // 3863
@SP // 3864
AM=M-1 // 3865
A=M // 3866
M=D // 3867

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
@ARG // 3868
A=M // 3869
D=M // 3870
@0 // 3871
D=D+A // 3872
@2 // 3873
D=D+A // 3874
@SP // 3875
AM=M+1 // 3876
A=A-1 // 3877
M=D // 3878
@ARG // 3879
A=M+1 // 3880
D=M // 3881
@SP // 3882
AM=M-1 // 3883
A=M // 3884
M=D // 3885

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3886
A=M // 3887
D=M // 3888
@SP // 3889
AM=M+1 // 3890
A=A-1 // 3891
M=D // 3892
@ARG // 3893
A=M+1 // 3894
D=M // 3895
@SP // 3896
AM=M-1 // 3897
A=M // 3898
M=D // 3899

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 3900
0;JMP // 3901

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
@ARG // 3902
A=M+1 // 3903
D=M // 3904
@3 // 3905
D=D+A // 3906
@SP // 3907
AM=M+1 // 3908
A=A-1 // 3909
M=D // 3910
@LCL // 3911
A=M // 3912
D=M // 3913
@SP // 3914
AM=M-1 // 3915
A=M // 3916
M=D // 3917

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3918
A=M+1 // 3919
D=M // 3920
@2 // 3921
D=D+A // 3922
@SP // 3923
AM=M+1 // 3924
A=A-1 // 3925
M=D // 3926
@LCL // 3927
A=M+1 // 3928
D=M // 3929
@SP // 3930
AM=M-1 // 3931
A=M // 3932
M=D // 3933

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 0"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElseEND3}}
@LCL // 3934
A=M // 3935
D=!M // 3936
@Memory.add_node.IfElseEND3 // 3937
D;JNE // 3938

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 3939
A=M // 3940
D=M // 3941
@2 // 3942
D=D+A // 3943
@SP // 3944
AM=M+1 // 3945
A=A-1 // 3946
M=D // 3947
@ARG // 3948
A=M+1 // 3949
D=M // 3950
@SP // 3951
AM=M-1 // 3952
A=M // 3953
M=D // 3954

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
@LCL // 3955
A=M+1 // 3956
D=M // 3957
@3 // 3958
D=D+A // 3959
@SP // 3960
AM=M+1 // 3961
A=A-1 // 3962
M=D // 3963
@ARG // 3964
A=M+1 // 3965
D=M // 3966
@SP // 3967
AM=M-1 // 3968
A=M // 3969
M=D // 3970

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 3971
AM=M+1 // 3972
A=A-1 // 3973
M=0 // 3974
@RETURN // 3975
0;JMP // 3976

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
@ARG // 3977
A=M // 3978
D=M // 3979
@SP // 3980
AM=M+1 // 3981
A=A-1 // 3982
M=D // 3983
@ARG // 3984
A=M+1 // 3985
D=M // 3986
@SP // 3987
AM=M-1 // 3988
A=M // 3989
M=D // 3990

////PushInstruction("constant 0")
@SP // 3991
AM=M+1 // 3992
A=A-1 // 3993
M=0 // 3994
@RETURN // 3995
0;JMP // 3996

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
@ARG // 3997
A=M // 3998
D=M // 3999
@0 // 4000
A=D+A // 4001
D=M // 4002
@SP // 4003
AM=M+1 // 4004
A=A-1 // 4005
M=D // 4006
@RETURN // 4007
0;JMP // 4008

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 4009
D=A // 4010
@14 // 4011
M=D // 4012
@Output.initMap // 4013
D=A // 4014
@13 // 4015
M=D // 4016
@Output.init.ret.0 // 4017
D=A // 4018
@CALL // 4019
0;JMP // 4020
(Output.init.ret.0)
@SP // 4021
M=M-1 // 4022

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 4023
M=0 // 4024

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 4025
M=0 // 4026

////PushInstruction("constant 0")
@SP // 4027
AM=M+1 // 4028
A=A-1 // 4029
M=0 // 4030
@RETURN // 4031
0;JMP // 4032

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4033
AM=M+1 // 4034
A=A-1 // 4035
M=0 // 4036

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4037
D=A // 4038
@SP // 4039
AM=M+1 // 4040
A=A-1 // 4041
M=D // 4042
// call Array.new
@6 // 4043
D=A // 4044
@14 // 4045
M=D // 4046
@Array.new // 4047
D=A // 4048
@13 // 4049
M=D // 4050
@Output.initMap.ret.0 // 4051
D=A // 4052
@CALL // 4053
0;JMP // 4054
(Output.initMap.ret.0)
@SP // 4055
AM=M-1 // 4056
D=M // 4057
@Output.0 // 4058
M=D // 4059

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4060
D=A // 4061
@SP // 4062
M=D+M // 4063
@63 // 4064
D=A // 4065
@SP // 4066
A=M-1 // 4067
M=0 // 4068
A=A-1 // 4069
M=0 // 4070
A=A-1 // 4071
M=D // 4072
A=A-1 // 4073
M=D // 4074
A=A-1 // 4075
M=D // 4076
A=A-1 // 4077
M=D // 4078
A=A-1 // 4079
M=D // 4080
A=A-1 // 4081
M=D // 4082
A=A-1 // 4083
M=D // 4084
A=A-1 // 4085
M=D // 4086
A=A-1 // 4087
M=D // 4088
A=A-1 // 4089
M=0 // 4090
// call Output.create
@17 // 4091
D=A // 4092
@14 // 4093
M=D // 4094
@Output.create // 4095
D=A // 4096
@13 // 4097
M=D // 4098
@Output.initMap.ret.1 // 4099
D=A // 4100
@CALL // 4101
0;JMP // 4102
(Output.initMap.ret.1)
@SP // 4103
M=M-1 // 4104

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4105
D=A // 4106
@SP // 4107
M=D+M // 4108
@32 // 4109
D=A // 4110
@SP // 4111
A=M-1 // 4112
M=0 // 4113
A=A-1 // 4114
M=0 // 4115
A=A-1 // 4116
M=0 // 4117
A=A-1 // 4118
M=0 // 4119
A=A-1 // 4120
M=0 // 4121
A=A-1 // 4122
M=0 // 4123
A=A-1 // 4124
M=0 // 4125
A=A-1 // 4126
M=0 // 4127
A=A-1 // 4128
M=0 // 4129
A=A-1 // 4130
M=0 // 4131
A=A-1 // 4132
M=0 // 4133
A=A-1 // 4134
M=D // 4135
A=A-1 // 4136
// call Output.create
@17 // 4137
D=A // 4138
@14 // 4139
M=D // 4140
@Output.create // 4141
D=A // 4142
@13 // 4143
M=D // 4144
@Output.initMap.ret.2 // 4145
D=A // 4146
@CALL // 4147
0;JMP // 4148
(Output.initMap.ret.2)
@SP // 4149
M=M-1 // 4150

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4151
D=A // 4152
@SP // 4153
AM=M+1 // 4154
A=A-1 // 4155
M=D // 4156
@12 // 4157
D=A // 4158
@SP // 4159
AM=M+1 // 4160
A=A-1 // 4161
M=D // 4162
@30 // 4163
D=A // 4164
@SP // 4165
AM=M+1 // 4166
A=A-1 // 4167
M=D // 4168
@30 // 4169
D=A // 4170
@SP // 4171
AM=M+1 // 4172
A=A-1 // 4173
M=D // 4174
@30 // 4175
D=A // 4176
@SP // 4177
AM=M+1 // 4178
A=A-1 // 4179
M=D // 4180
@12 // 4181
D=A // 4182
@SP // 4183
AM=M+1 // 4184
A=A-1 // 4185
M=D // 4186
@12 // 4187
D=A // 4188
@SP // 4189
AM=M+1 // 4190
A=A-1 // 4191
M=D // 4192
@SP // 4193
AM=M+1 // 4194
A=A-1 // 4195
M=0 // 4196
@4 // 4197
D=A // 4198
@SP // 4199
M=D+M // 4200
@12 // 4201
D=A // 4202
@SP // 4203
A=M-1 // 4204
M=0 // 4205
A=A-1 // 4206
M=0 // 4207
A=A-1 // 4208
M=D // 4209
A=A-1 // 4210
M=D // 4211
A=A-1 // 4212
// call Output.create
@17 // 4213
D=A // 4214
@14 // 4215
M=D // 4216
@Output.create // 4217
D=A // 4218
@13 // 4219
M=D // 4220
@Output.initMap.ret.3 // 4221
D=A // 4222
@CALL // 4223
0;JMP // 4224
(Output.initMap.ret.3)
@SP // 4225
M=M-1 // 4226

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4227
D=A // 4228
@SP // 4229
AM=M+1 // 4230
A=A-1 // 4231
M=D // 4232
@54 // 4233
D=A // 4234
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=D // 4238
@54 // 4239
D=A // 4240
@SP // 4241
AM=M+1 // 4242
A=A-1 // 4243
M=D // 4244
@20 // 4245
D=A // 4246
@SP // 4247
AM=M+1 // 4248
A=A-1 // 4249
M=D // 4250
@SP // 4251
AM=M+1 // 4252
A=A-1 // 4253
M=0 // 4254
@SP // 4255
AM=M+1 // 4256
A=A-1 // 4257
M=0 // 4258
@SP // 4259
AM=M+1 // 4260
A=A-1 // 4261
M=0 // 4262
@SP // 4263
AM=M+1 // 4264
A=A-1 // 4265
M=0 // 4266
@SP // 4267
AM=M+1 // 4268
A=A-1 // 4269
M=0 // 4270
@SP // 4271
AM=M+1 // 4272
A=A-1 // 4273
M=0 // 4274
@SP // 4275
AM=M+1 // 4276
A=A-1 // 4277
M=0 // 4278
@SP // 4279
AM=M+1 // 4280
A=A-1 // 4281
M=0 // 4282
// call Output.create
@17 // 4283
D=A // 4284
@14 // 4285
M=D // 4286
@Output.create // 4287
D=A // 4288
@13 // 4289
M=D // 4290
@Output.initMap.ret.4 // 4291
D=A // 4292
@CALL // 4293
0;JMP // 4294
(Output.initMap.ret.4)
@SP // 4295
M=M-1 // 4296

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4297
D=A // 4298
@SP // 4299
M=D+M // 4300
@35 // 4301
D=A // 4302
@SP // 4303
A=M-1 // 4304
M=0 // 4305
A=A-1 // 4306
M=D // 4307
A=A-1 // 4308
@18 // 4309
D=A // 4310
@SP // 4311
AM=M+1 // 4312
A=A-1 // 4313
M=D // 4314
@18 // 4315
D=A // 4316
@SP // 4317
AM=M+1 // 4318
A=A-1 // 4319
M=D // 4320
@63 // 4321
D=A // 4322
@SP // 4323
AM=M+1 // 4324
A=A-1 // 4325
M=D // 4326
@18 // 4327
D=A // 4328
@SP // 4329
AM=M+1 // 4330
A=A-1 // 4331
M=D // 4332
@18 // 4333
D=A // 4334
@SP // 4335
AM=M+1 // 4336
A=A-1 // 4337
M=D // 4338
@63 // 4339
D=A // 4340
@SP // 4341
AM=M+1 // 4342
A=A-1 // 4343
M=D // 4344
@18 // 4345
D=A // 4346
@SP // 4347
AM=M+1 // 4348
A=A-1 // 4349
M=D // 4350
@18 // 4351
D=A // 4352
@SP // 4353
AM=M+1 // 4354
A=A-1 // 4355
M=D // 4356
@SP // 4357
AM=M+1 // 4358
A=A-1 // 4359
M=0 // 4360
@SP // 4361
AM=M+1 // 4362
A=A-1 // 4363
M=0 // 4364
// call Output.create
@17 // 4365
D=A // 4366
@14 // 4367
M=D // 4368
@Output.create // 4369
D=A // 4370
@13 // 4371
M=D // 4372
@Output.initMap.ret.5 // 4373
D=A // 4374
@CALL // 4375
0;JMP // 4376
(Output.initMap.ret.5)
@SP // 4377
M=M-1 // 4378

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4379
D=A // 4380
@SP // 4381
AM=M+1 // 4382
A=A-1 // 4383
M=D // 4384
@12 // 4385
D=A // 4386
@SP // 4387
AM=M+1 // 4388
A=A-1 // 4389
M=D // 4390
@30 // 4391
D=A // 4392
@SP // 4393
AM=M+1 // 4394
A=A-1 // 4395
M=D // 4396
@51 // 4397
D=A // 4398
@SP // 4399
AM=M+1 // 4400
A=A-1 // 4401
M=D // 4402
@3 // 4403
D=A // 4404
@SP // 4405
AM=M+1 // 4406
A=A-1 // 4407
M=D // 4408
@30 // 4409
D=A // 4410
@SP // 4411
AM=M+1 // 4412
A=A-1 // 4413
M=D // 4414
@48 // 4415
D=A // 4416
@SP // 4417
AM=M+1 // 4418
A=A-1 // 4419
M=D // 4420
@51 // 4421
D=A // 4422
@SP // 4423
AM=M+1 // 4424
A=A-1 // 4425
M=D // 4426
@30 // 4427
D=A // 4428
@SP // 4429
AM=M+1 // 4430
A=A-1 // 4431
M=D // 4432
@12 // 4433
D=A // 4434
@SP // 4435
AM=M+1 // 4436
A=A-1 // 4437
M=D // 4438
@12 // 4439
D=A // 4440
@SP // 4441
AM=M+1 // 4442
A=A-1 // 4443
M=D // 4444
@SP // 4445
AM=M+1 // 4446
A=A-1 // 4447
M=0 // 4448
// call Output.create
@17 // 4449
D=A // 4450
@14 // 4451
M=D // 4452
@Output.create // 4453
D=A // 4454
@13 // 4455
M=D // 4456
@Output.initMap.ret.6 // 4457
D=A // 4458
@CALL // 4459
0;JMP // 4460
(Output.initMap.ret.6)
@SP // 4461
M=M-1 // 4462

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4463
D=A // 4464
@SP // 4465
M=D+M // 4466
@37 // 4467
D=A // 4468
@SP // 4469
A=M-1 // 4470
M=0 // 4471
A=A-1 // 4472
M=0 // 4473
A=A-1 // 4474
M=D // 4475
A=A-1 // 4476
@35 // 4477
D=A // 4478
@SP // 4479
AM=M+1 // 4480
A=A-1 // 4481
M=D // 4482
@51 // 4483
D=A // 4484
@SP // 4485
AM=M+1 // 4486
A=A-1 // 4487
M=D // 4488
@24 // 4489
D=A // 4490
@SP // 4491
AM=M+1 // 4492
A=A-1 // 4493
M=D // 4494
@12 // 4495
D=A // 4496
@SP // 4497
AM=M+1 // 4498
A=A-1 // 4499
M=D // 4500
@6 // 4501
D=A // 4502
@SP // 4503
AM=M+1 // 4504
A=A-1 // 4505
M=D // 4506
@51 // 4507
D=A // 4508
@SP // 4509
AM=M+1 // 4510
A=A-1 // 4511
M=D // 4512
@49 // 4513
D=A // 4514
@SP // 4515
AM=M+1 // 4516
A=A-1 // 4517
M=D // 4518
@SP // 4519
AM=M+1 // 4520
A=A-1 // 4521
M=0 // 4522
@SP // 4523
AM=M+1 // 4524
A=A-1 // 4525
M=0 // 4526
// call Output.create
@17 // 4527
D=A // 4528
@14 // 4529
M=D // 4530
@Output.create // 4531
D=A // 4532
@13 // 4533
M=D // 4534
@Output.initMap.ret.7 // 4535
D=A // 4536
@CALL // 4537
0;JMP // 4538
(Output.initMap.ret.7)
@SP // 4539
M=M-1 // 4540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4541
D=A // 4542
@SP // 4543
AM=M+1 // 4544
A=A-1 // 4545
M=D // 4546
@12 // 4547
D=A // 4548
@SP // 4549
AM=M+1 // 4550
A=A-1 // 4551
M=D // 4552
@30 // 4553
D=A // 4554
@SP // 4555
AM=M+1 // 4556
A=A-1 // 4557
M=D // 4558
@30 // 4559
D=A // 4560
@SP // 4561
AM=M+1 // 4562
A=A-1 // 4563
M=D // 4564
@12 // 4565
D=A // 4566
@SP // 4567
AM=M+1 // 4568
A=A-1 // 4569
M=D // 4570
@54 // 4571
D=A // 4572
@SP // 4573
AM=M+1 // 4574
A=A-1 // 4575
M=D // 4576
@27 // 4577
D=A // 4578
@SP // 4579
AM=M+1 // 4580
A=A-1 // 4581
M=D // 4582
@27 // 4583
D=A // 4584
@SP // 4585
AM=M+1 // 4586
A=A-1 // 4587
M=D // 4588
@27 // 4589
D=A // 4590
@SP // 4591
AM=M+1 // 4592
A=A-1 // 4593
M=D // 4594
@54 // 4595
D=A // 4596
@SP // 4597
AM=M+1 // 4598
A=A-1 // 4599
M=D // 4600
@SP // 4601
AM=M+1 // 4602
A=A-1 // 4603
M=0 // 4604
@SP // 4605
AM=M+1 // 4606
A=A-1 // 4607
M=0 // 4608
// call Output.create
@17 // 4609
D=A // 4610
@14 // 4611
M=D // 4612
@Output.create // 4613
D=A // 4614
@13 // 4615
M=D // 4616
@Output.initMap.ret.8 // 4617
D=A // 4618
@CALL // 4619
0;JMP // 4620
(Output.initMap.ret.8)
@SP // 4621
M=M-1 // 4622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4623
D=A // 4624
@SP // 4625
AM=M+1 // 4626
A=A-1 // 4627
M=D // 4628
@12 // 4629
D=A // 4630
@SP // 4631
AM=M+1 // 4632
A=A-1 // 4633
M=D // 4634
@12 // 4635
D=A // 4636
@SP // 4637
AM=M+1 // 4638
A=A-1 // 4639
M=D // 4640
@6 // 4641
D=A // 4642
@SP // 4643
AM=M+1 // 4644
A=A-1 // 4645
M=D // 4646
@SP // 4647
AM=M+1 // 4648
A=A-1 // 4649
M=0 // 4650
@SP // 4651
AM=M+1 // 4652
A=A-1 // 4653
M=0 // 4654
@SP // 4655
AM=M+1 // 4656
A=A-1 // 4657
M=0 // 4658
@SP // 4659
AM=M+1 // 4660
A=A-1 // 4661
M=0 // 4662
@SP // 4663
AM=M+1 // 4664
A=A-1 // 4665
M=0 // 4666
@SP // 4667
AM=M+1 // 4668
A=A-1 // 4669
M=0 // 4670
@SP // 4671
AM=M+1 // 4672
A=A-1 // 4673
M=0 // 4674
@SP // 4675
AM=M+1 // 4676
A=A-1 // 4677
M=0 // 4678
// call Output.create
@17 // 4679
D=A // 4680
@14 // 4681
M=D // 4682
@Output.create // 4683
D=A // 4684
@13 // 4685
M=D // 4686
@Output.initMap.ret.9 // 4687
D=A // 4688
@CALL // 4689
0;JMP // 4690
(Output.initMap.ret.9)
@SP // 4691
M=M-1 // 4692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4693
D=A // 4694
@SP // 4695
AM=M+1 // 4696
A=A-1 // 4697
M=D // 4698
@24 // 4699
D=A // 4700
@SP // 4701
AM=M+1 // 4702
A=A-1 // 4703
M=D // 4704
@12 // 4705
D=A // 4706
@SP // 4707
AM=M+1 // 4708
A=A-1 // 4709
M=D // 4710
@6 // 4711
D=A // 4712
@SP // 4713
AM=M+1 // 4714
A=A-1 // 4715
M=D // 4716
@6 // 4717
D=A // 4718
@SP // 4719
AM=M+1 // 4720
A=A-1 // 4721
M=D // 4722
@6 // 4723
D=A // 4724
@SP // 4725
AM=M+1 // 4726
A=A-1 // 4727
M=D // 4728
@6 // 4729
D=A // 4730
@SP // 4731
AM=M+1 // 4732
A=A-1 // 4733
M=D // 4734
@6 // 4735
D=A // 4736
@SP // 4737
AM=M+1 // 4738
A=A-1 // 4739
M=D // 4740
@12 // 4741
D=A // 4742
@SP // 4743
AM=M+1 // 4744
A=A-1 // 4745
M=D // 4746
@24 // 4747
D=A // 4748
@SP // 4749
AM=M+1 // 4750
A=A-1 // 4751
M=D // 4752
@SP // 4753
AM=M+1 // 4754
A=A-1 // 4755
M=0 // 4756
@SP // 4757
AM=M+1 // 4758
A=A-1 // 4759
M=0 // 4760
// call Output.create
@17 // 4761
D=A // 4762
@14 // 4763
M=D // 4764
@Output.create // 4765
D=A // 4766
@13 // 4767
M=D // 4768
@Output.initMap.ret.10 // 4769
D=A // 4770
@CALL // 4771
0;JMP // 4772
(Output.initMap.ret.10)
@SP // 4773
M=M-1 // 4774

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4775
D=A // 4776
@SP // 4777
AM=M+1 // 4778
A=A-1 // 4779
M=D // 4780
@6 // 4781
D=A // 4782
@SP // 4783
AM=M+1 // 4784
A=A-1 // 4785
M=D // 4786
@12 // 4787
D=A // 4788
@SP // 4789
AM=M+1 // 4790
A=A-1 // 4791
M=D // 4792
@24 // 4793
D=A // 4794
@SP // 4795
AM=M+1 // 4796
A=A-1 // 4797
M=D // 4798
@24 // 4799
D=A // 4800
@SP // 4801
AM=M+1 // 4802
A=A-1 // 4803
M=D // 4804
@24 // 4805
D=A // 4806
@SP // 4807
AM=M+1 // 4808
A=A-1 // 4809
M=D // 4810
@24 // 4811
D=A // 4812
@SP // 4813
AM=M+1 // 4814
A=A-1 // 4815
M=D // 4816
@24 // 4817
D=A // 4818
@SP // 4819
AM=M+1 // 4820
A=A-1 // 4821
M=D // 4822
@12 // 4823
D=A // 4824
@SP // 4825
AM=M+1 // 4826
A=A-1 // 4827
M=D // 4828
@6 // 4829
D=A // 4830
@SP // 4831
AM=M+1 // 4832
A=A-1 // 4833
M=D // 4834
@SP // 4835
AM=M+1 // 4836
A=A-1 // 4837
M=0 // 4838
@SP // 4839
AM=M+1 // 4840
A=A-1 // 4841
M=0 // 4842
// call Output.create
@17 // 4843
D=A // 4844
@14 // 4845
M=D // 4846
@Output.create // 4847
D=A // 4848
@13 // 4849
M=D // 4850
@Output.initMap.ret.11 // 4851
D=A // 4852
@CALL // 4853
0;JMP // 4854
(Output.initMap.ret.11)
@SP // 4855
M=M-1 // 4856

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4857
D=A // 4858
@SP // 4859
M=D+M // 4860
@42 // 4861
D=A // 4862
@SP // 4863
A=M-1 // 4864
M=0 // 4865
A=A-1 // 4866
M=0 // 4867
A=A-1 // 4868
M=0 // 4869
A=A-1 // 4870
M=D // 4871
A=A-1 // 4872
@51 // 4873
D=A // 4874
@SP // 4875
AM=M+1 // 4876
A=A-1 // 4877
M=D // 4878
@30 // 4879
D=A // 4880
@SP // 4881
AM=M+1 // 4882
A=A-1 // 4883
M=D // 4884
@63 // 4885
D=A // 4886
@SP // 4887
AM=M+1 // 4888
A=A-1 // 4889
M=D // 4890
@30 // 4891
D=A // 4892
@SP // 4893
AM=M+1 // 4894
A=A-1 // 4895
M=D // 4896
@51 // 4897
D=A // 4898
@SP // 4899
AM=M+1 // 4900
A=A-1 // 4901
M=D // 4902
@SP // 4903
AM=M+1 // 4904
A=A-1 // 4905
M=0 // 4906
@SP // 4907
AM=M+1 // 4908
A=A-1 // 4909
M=0 // 4910
@SP // 4911
AM=M+1 // 4912
A=A-1 // 4913
M=0 // 4914
// call Output.create
@17 // 4915
D=A // 4916
@14 // 4917
M=D // 4918
@Output.create // 4919
D=A // 4920
@13 // 4921
M=D // 4922
@Output.initMap.ret.12 // 4923
D=A // 4924
@CALL // 4925
0;JMP // 4926
(Output.initMap.ret.12)
@SP // 4927
M=M-1 // 4928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4929
D=A // 4930
@SP // 4931
M=D+M // 4932
@43 // 4933
D=A // 4934
@SP // 4935
A=M-1 // 4936
M=0 // 4937
A=A-1 // 4938
M=0 // 4939
A=A-1 // 4940
M=0 // 4941
A=A-1 // 4942
M=D // 4943
A=A-1 // 4944
@12 // 4945
D=A // 4946
@SP // 4947
AM=M+1 // 4948
A=A-1 // 4949
M=D // 4950
@12 // 4951
D=A // 4952
@SP // 4953
AM=M+1 // 4954
A=A-1 // 4955
M=D // 4956
@63 // 4957
D=A // 4958
@SP // 4959
AM=M+1 // 4960
A=A-1 // 4961
M=D // 4962
@12 // 4963
D=A // 4964
@SP // 4965
AM=M+1 // 4966
A=A-1 // 4967
M=D // 4968
@12 // 4969
D=A // 4970
@SP // 4971
AM=M+1 // 4972
A=A-1 // 4973
M=D // 4974
@SP // 4975
AM=M+1 // 4976
A=A-1 // 4977
M=0 // 4978
@SP // 4979
AM=M+1 // 4980
A=A-1 // 4981
M=0 // 4982
@SP // 4983
AM=M+1 // 4984
A=A-1 // 4985
M=0 // 4986
// call Output.create
@17 // 4987
D=A // 4988
@14 // 4989
M=D // 4990
@Output.create // 4991
D=A // 4992
@13 // 4993
M=D // 4994
@Output.initMap.ret.13 // 4995
D=A // 4996
@CALL // 4997
0;JMP // 4998
(Output.initMap.ret.13)
@SP // 4999
M=M-1 // 5000

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5001
D=A // 5002
@SP // 5003
M=D+M // 5004
@44 // 5005
D=A // 5006
@SP // 5007
A=M-1 // 5008
M=0 // 5009
A=A-1 // 5010
M=0 // 5011
A=A-1 // 5012
M=0 // 5013
A=A-1 // 5014
M=0 // 5015
A=A-1 // 5016
M=0 // 5017
A=A-1 // 5018
M=0 // 5019
A=A-1 // 5020
M=0 // 5021
A=A-1 // 5022
M=D // 5023
A=A-1 // 5024
@12 // 5025
D=A // 5026
@SP // 5027
AM=M+1 // 5028
A=A-1 // 5029
M=D // 5030
@12 // 5031
D=A // 5032
@SP // 5033
AM=M+1 // 5034
A=A-1 // 5035
M=D // 5036
@6 // 5037
D=A // 5038
@SP // 5039
AM=M+1 // 5040
A=A-1 // 5041
M=D // 5042
@SP // 5043
AM=M+1 // 5044
A=A-1 // 5045
M=0 // 5046
// call Output.create
@17 // 5047
D=A // 5048
@14 // 5049
M=D // 5050
@Output.create // 5051
D=A // 5052
@13 // 5053
M=D // 5054
@Output.initMap.ret.14 // 5055
D=A // 5056
@CALL // 5057
0;JMP // 5058
(Output.initMap.ret.14)
@SP // 5059
M=M-1 // 5060

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5061
D=A // 5062
@SP // 5063
M=D+M // 5064
@45 // 5065
D=A // 5066
@SP // 5067
A=M-1 // 5068
M=0 // 5069
A=A-1 // 5070
M=0 // 5071
A=A-1 // 5072
M=0 // 5073
A=A-1 // 5074
M=0 // 5075
A=A-1 // 5076
M=0 // 5077
A=A-1 // 5078
M=D // 5079
A=A-1 // 5080
@6 // 5081
D=A // 5082
@SP // 5083
M=D+M // 5084
@63 // 5085
D=A // 5086
@SP // 5087
A=M-1 // 5088
M=0 // 5089
A=A-1 // 5090
M=0 // 5091
A=A-1 // 5092
M=0 // 5093
A=A-1 // 5094
M=0 // 5095
A=A-1 // 5096
M=0 // 5097
A=A-1 // 5098
M=D // 5099
A=A-1 // 5100
// call Output.create
@17 // 5101
D=A // 5102
@14 // 5103
M=D // 5104
@Output.create // 5105
D=A // 5106
@13 // 5107
M=D // 5108
@Output.initMap.ret.15 // 5109
D=A // 5110
@CALL // 5111
0;JMP // 5112
(Output.initMap.ret.15)
@SP // 5113
M=M-1 // 5114

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5115
D=A // 5116
@SP // 5117
M=D+M // 5118
@46 // 5119
D=A // 5120
@SP // 5121
A=M-1 // 5122
M=0 // 5123
A=A-1 // 5124
M=0 // 5125
A=A-1 // 5126
M=0 // 5127
A=A-1 // 5128
M=0 // 5129
A=A-1 // 5130
M=0 // 5131
A=A-1 // 5132
M=0 // 5133
A=A-1 // 5134
M=0 // 5135
A=A-1 // 5136
M=D // 5137
A=A-1 // 5138
@4 // 5139
D=A // 5140
@SP // 5141
M=D+M // 5142
@12 // 5143
D=A // 5144
@SP // 5145
A=M-1 // 5146
M=0 // 5147
A=A-1 // 5148
M=0 // 5149
A=A-1 // 5150
M=D // 5151
A=A-1 // 5152
M=D // 5153
A=A-1 // 5154
// call Output.create
@17 // 5155
D=A // 5156
@14 // 5157
M=D // 5158
@Output.create // 5159
D=A // 5160
@13 // 5161
M=D // 5162
@Output.initMap.ret.16 // 5163
D=A // 5164
@CALL // 5165
0;JMP // 5166
(Output.initMap.ret.16)
@SP // 5167
M=M-1 // 5168

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5169
D=A // 5170
@SP // 5171
M=D+M // 5172
@47 // 5173
D=A // 5174
@SP // 5175
A=M-1 // 5176
M=0 // 5177
A=A-1 // 5178
M=0 // 5179
A=A-1 // 5180
M=D // 5181
A=A-1 // 5182
@32 // 5183
D=A // 5184
@SP // 5185
AM=M+1 // 5186
A=A-1 // 5187
M=D // 5188
@48 // 5189
D=A // 5190
@SP // 5191
AM=M+1 // 5192
A=A-1 // 5193
M=D // 5194
@24 // 5195
D=A // 5196
@SP // 5197
AM=M+1 // 5198
A=A-1 // 5199
M=D // 5200
@12 // 5201
D=A // 5202
@SP // 5203
AM=M+1 // 5204
A=A-1 // 5205
M=D // 5206
@6 // 5207
D=A // 5208
@SP // 5209
AM=M+1 // 5210
A=A-1 // 5211
M=D // 5212
@3 // 5213
D=A // 5214
@SP // 5215
AM=M+1 // 5216
A=A-1 // 5217
M=D // 5218
@SP // 5219
AM=M+1 // 5220
A=A-1 // 5221
M=1 // 5222
@SP // 5223
AM=M+1 // 5224
A=A-1 // 5225
M=0 // 5226
@SP // 5227
AM=M+1 // 5228
A=A-1 // 5229
M=0 // 5230
// call Output.create
@17 // 5231
D=A // 5232
@14 // 5233
M=D // 5234
@Output.create // 5235
D=A // 5236
@13 // 5237
M=D // 5238
@Output.initMap.ret.17 // 5239
D=A // 5240
@CALL // 5241
0;JMP // 5242
(Output.initMap.ret.17)
@SP // 5243
M=M-1 // 5244

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5245
D=A // 5246
@SP // 5247
AM=M+1 // 5248
A=A-1 // 5249
M=D // 5250
@12 // 5251
D=A // 5252
@SP // 5253
AM=M+1 // 5254
A=A-1 // 5255
M=D // 5256
@30 // 5257
D=A // 5258
@SP // 5259
AM=M+1 // 5260
A=A-1 // 5261
M=D // 5262
@51 // 5263
D=A // 5264
@SP // 5265
AM=M+1 // 5266
A=A-1 // 5267
M=D // 5268
@51 // 5269
D=A // 5270
@SP // 5271
AM=M+1 // 5272
A=A-1 // 5273
M=D // 5274
@51 // 5275
D=A // 5276
@SP // 5277
AM=M+1 // 5278
A=A-1 // 5279
M=D // 5280
@51 // 5281
D=A // 5282
@SP // 5283
AM=M+1 // 5284
A=A-1 // 5285
M=D // 5286
@51 // 5287
D=A // 5288
@SP // 5289
AM=M+1 // 5290
A=A-1 // 5291
M=D // 5292
@30 // 5293
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
@SP // 5305
AM=M+1 // 5306
A=A-1 // 5307
M=0 // 5308
@SP // 5309
AM=M+1 // 5310
A=A-1 // 5311
M=0 // 5312
// call Output.create
@17 // 5313
D=A // 5314
@14 // 5315
M=D // 5316
@Output.create // 5317
D=A // 5318
@13 // 5319
M=D // 5320
@Output.initMap.ret.18 // 5321
D=A // 5322
@CALL // 5323
0;JMP // 5324
(Output.initMap.ret.18)
@SP // 5325
M=M-1 // 5326

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5327
D=A // 5328
@SP // 5329
AM=M+1 // 5330
A=A-1 // 5331
M=D // 5332
@12 // 5333
D=A // 5334
@SP // 5335
AM=M+1 // 5336
A=A-1 // 5337
M=D // 5338
@14 // 5339
D=A // 5340
@SP // 5341
AM=M+1 // 5342
A=A-1 // 5343
M=D // 5344
@15 // 5345
D=A // 5346
@SP // 5347
AM=M+1 // 5348
A=A-1 // 5349
M=D // 5350
@12 // 5351
D=A // 5352
@SP // 5353
AM=M+1 // 5354
A=A-1 // 5355
M=D // 5356
@12 // 5357
D=A // 5358
@SP // 5359
AM=M+1 // 5360
A=A-1 // 5361
M=D // 5362
@12 // 5363
D=A // 5364
@SP // 5365
AM=M+1 // 5366
A=A-1 // 5367
M=D // 5368
@12 // 5369
D=A // 5370
@SP // 5371
AM=M+1 // 5372
A=A-1 // 5373
M=D // 5374
@12 // 5375
D=A // 5376
@SP // 5377
AM=M+1 // 5378
A=A-1 // 5379
M=D // 5380
@63 // 5381
D=A // 5382
@SP // 5383
AM=M+1 // 5384
A=A-1 // 5385
M=D // 5386
@SP // 5387
AM=M+1 // 5388
A=A-1 // 5389
M=0 // 5390
@SP // 5391
AM=M+1 // 5392
A=A-1 // 5393
M=0 // 5394
// call Output.create
@17 // 5395
D=A // 5396
@14 // 5397
M=D // 5398
@Output.create // 5399
D=A // 5400
@13 // 5401
M=D // 5402
@Output.initMap.ret.19 // 5403
D=A // 5404
@CALL // 5405
0;JMP // 5406
(Output.initMap.ret.19)
@SP // 5407
M=M-1 // 5408

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5409
D=A // 5410
@SP // 5411
AM=M+1 // 5412
A=A-1 // 5413
M=D // 5414
@30 // 5415
D=A // 5416
@SP // 5417
AM=M+1 // 5418
A=A-1 // 5419
M=D // 5420
@51 // 5421
D=A // 5422
@SP // 5423
AM=M+1 // 5424
A=A-1 // 5425
M=D // 5426
@48 // 5427
D=A // 5428
@SP // 5429
AM=M+1 // 5430
A=A-1 // 5431
M=D // 5432
@24 // 5433
D=A // 5434
@SP // 5435
AM=M+1 // 5436
A=A-1 // 5437
M=D // 5438
@12 // 5439
D=A // 5440
@SP // 5441
AM=M+1 // 5442
A=A-1 // 5443
M=D // 5444
@6 // 5445
D=A // 5446
@SP // 5447
AM=M+1 // 5448
A=A-1 // 5449
M=D // 5450
@3 // 5451
D=A // 5452
@SP // 5453
AM=M+1 // 5454
A=A-1 // 5455
M=D // 5456
@51 // 5457
D=A // 5458
@SP // 5459
AM=M+1 // 5460
A=A-1 // 5461
M=D // 5462
@63 // 5463
D=A // 5464
@SP // 5465
AM=M+1 // 5466
A=A-1 // 5467
M=D // 5468
@SP // 5469
AM=M+1 // 5470
A=A-1 // 5471
M=0 // 5472
@SP // 5473
AM=M+1 // 5474
A=A-1 // 5475
M=0 // 5476
// call Output.create
@17 // 5477
D=A // 5478
@14 // 5479
M=D // 5480
@Output.create // 5481
D=A // 5482
@13 // 5483
M=D // 5484
@Output.initMap.ret.20 // 5485
D=A // 5486
@CALL // 5487
0;JMP // 5488
(Output.initMap.ret.20)
@SP // 5489
M=M-1 // 5490

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5491
D=A // 5492
@SP // 5493
AM=M+1 // 5494
A=A-1 // 5495
M=D // 5496
@30 // 5497
D=A // 5498
@SP // 5499
AM=M+1 // 5500
A=A-1 // 5501
M=D // 5502
@51 // 5503
D=A // 5504
@SP // 5505
AM=M+1 // 5506
A=A-1 // 5507
M=D // 5508
@48 // 5509
D=A // 5510
@SP // 5511
AM=M+1 // 5512
A=A-1 // 5513
M=D // 5514
@48 // 5515
D=A // 5516
@SP // 5517
AM=M+1 // 5518
A=A-1 // 5519
M=D // 5520
@28 // 5521
D=A // 5522
@SP // 5523
AM=M+1 // 5524
A=A-1 // 5525
M=D // 5526
@48 // 5527
D=A // 5528
@SP // 5529
AM=M+1 // 5530
A=A-1 // 5531
M=D // 5532
@48 // 5533
D=A // 5534
@SP // 5535
AM=M+1 // 5536
A=A-1 // 5537
M=D // 5538
@51 // 5539
D=A // 5540
@SP // 5541
AM=M+1 // 5542
A=A-1 // 5543
M=D // 5544
@30 // 5545
D=A // 5546
@SP // 5547
AM=M+1 // 5548
A=A-1 // 5549
M=D // 5550
@SP // 5551
AM=M+1 // 5552
A=A-1 // 5553
M=0 // 5554
@SP // 5555
AM=M+1 // 5556
A=A-1 // 5557
M=0 // 5558
// call Output.create
@17 // 5559
D=A // 5560
@14 // 5561
M=D // 5562
@Output.create // 5563
D=A // 5564
@13 // 5565
M=D // 5566
@Output.initMap.ret.21 // 5567
D=A // 5568
@CALL // 5569
0;JMP // 5570
(Output.initMap.ret.21)
@SP // 5571
M=M-1 // 5572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5573
D=A // 5574
@SP // 5575
AM=M+1 // 5576
A=A-1 // 5577
M=D // 5578
@16 // 5579
D=A // 5580
@SP // 5581
AM=M+1 // 5582
A=A-1 // 5583
M=D // 5584
@24 // 5585
D=A // 5586
@SP // 5587
AM=M+1 // 5588
A=A-1 // 5589
M=D // 5590
@28 // 5591
D=A // 5592
@SP // 5593
AM=M+1 // 5594
A=A-1 // 5595
M=D // 5596
@26 // 5597
D=A // 5598
@SP // 5599
AM=M+1 // 5600
A=A-1 // 5601
M=D // 5602
@25 // 5603
D=A // 5604
@SP // 5605
AM=M+1 // 5606
A=A-1 // 5607
M=D // 5608
@63 // 5609
D=A // 5610
@SP // 5611
AM=M+1 // 5612
A=A-1 // 5613
M=D // 5614
@24 // 5615
D=A // 5616
@SP // 5617
AM=M+1 // 5618
A=A-1 // 5619
M=D // 5620
@24 // 5621
D=A // 5622
@SP // 5623
AM=M+1 // 5624
A=A-1 // 5625
M=D // 5626
@60 // 5627
D=A // 5628
@SP // 5629
AM=M+1 // 5630
A=A-1 // 5631
M=D // 5632
@SP // 5633
AM=M+1 // 5634
A=A-1 // 5635
M=0 // 5636
@SP // 5637
AM=M+1 // 5638
A=A-1 // 5639
M=0 // 5640
// call Output.create
@17 // 5641
D=A // 5642
@14 // 5643
M=D // 5644
@Output.create // 5645
D=A // 5646
@13 // 5647
M=D // 5648
@Output.initMap.ret.22 // 5649
D=A // 5650
@CALL // 5651
0;JMP // 5652
(Output.initMap.ret.22)
@SP // 5653
M=M-1 // 5654

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5655
D=A // 5656
@SP // 5657
AM=M+1 // 5658
A=A-1 // 5659
M=D // 5660
@63 // 5661
D=A // 5662
@SP // 5663
AM=M+1 // 5664
A=A-1 // 5665
M=D // 5666
@3 // 5667
D=A // 5668
@SP // 5669
AM=M+1 // 5670
A=A-1 // 5671
M=D // 5672
@3 // 5673
D=A // 5674
@SP // 5675
AM=M+1 // 5676
A=A-1 // 5677
M=D // 5678
@31 // 5679
D=A // 5680
@SP // 5681
AM=M+1 // 5682
A=A-1 // 5683
M=D // 5684
@48 // 5685
D=A // 5686
@SP // 5687
AM=M+1 // 5688
A=A-1 // 5689
M=D // 5690
@48 // 5691
D=A // 5692
@SP // 5693
AM=M+1 // 5694
A=A-1 // 5695
M=D // 5696
@48 // 5697
D=A // 5698
@SP // 5699
AM=M+1 // 5700
A=A-1 // 5701
M=D // 5702
@51 // 5703
D=A // 5704
@SP // 5705
AM=M+1 // 5706
A=A-1 // 5707
M=D // 5708
@30 // 5709
D=A // 5710
@SP // 5711
AM=M+1 // 5712
A=A-1 // 5713
M=D // 5714
@SP // 5715
AM=M+1 // 5716
A=A-1 // 5717
M=0 // 5718
@SP // 5719
AM=M+1 // 5720
A=A-1 // 5721
M=0 // 5722
// call Output.create
@17 // 5723
D=A // 5724
@14 // 5725
M=D // 5726
@Output.create // 5727
D=A // 5728
@13 // 5729
M=D // 5730
@Output.initMap.ret.23 // 5731
D=A // 5732
@CALL // 5733
0;JMP // 5734
(Output.initMap.ret.23)
@SP // 5735
M=M-1 // 5736

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5737
D=A // 5738
@SP // 5739
AM=M+1 // 5740
A=A-1 // 5741
M=D // 5742
@28 // 5743
D=A // 5744
@SP // 5745
AM=M+1 // 5746
A=A-1 // 5747
M=D // 5748
@6 // 5749
D=A // 5750
@SP // 5751
AM=M+1 // 5752
A=A-1 // 5753
M=D // 5754
@3 // 5755
D=A // 5756
@SP // 5757
AM=M+1 // 5758
A=A-1 // 5759
M=D // 5760
@3 // 5761
D=A // 5762
@SP // 5763
AM=M+1 // 5764
A=A-1 // 5765
M=D // 5766
@31 // 5767
D=A // 5768
@SP // 5769
AM=M+1 // 5770
A=A-1 // 5771
M=D // 5772
@51 // 5773
D=A // 5774
@SP // 5775
AM=M+1 // 5776
A=A-1 // 5777
M=D // 5778
@51 // 5779
D=A // 5780
@SP // 5781
AM=M+1 // 5782
A=A-1 // 5783
M=D // 5784
@51 // 5785
D=A // 5786
@SP // 5787
AM=M+1 // 5788
A=A-1 // 5789
M=D // 5790
@30 // 5791
D=A // 5792
@SP // 5793
AM=M+1 // 5794
A=A-1 // 5795
M=D // 5796
@SP // 5797
AM=M+1 // 5798
A=A-1 // 5799
M=0 // 5800
@SP // 5801
AM=M+1 // 5802
A=A-1 // 5803
M=0 // 5804
// call Output.create
@17 // 5805
D=A // 5806
@14 // 5807
M=D // 5808
@Output.create // 5809
D=A // 5810
@13 // 5811
M=D // 5812
@Output.initMap.ret.24 // 5813
D=A // 5814
@CALL // 5815
0;JMP // 5816
(Output.initMap.ret.24)
@SP // 5817
M=M-1 // 5818

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 5819
D=A // 5820
@SP // 5821
AM=M+1 // 5822
A=A-1 // 5823
M=D // 5824
@63 // 5825
D=A // 5826
@SP // 5827
AM=M+1 // 5828
A=A-1 // 5829
M=D // 5830
@49 // 5831
D=A // 5832
@SP // 5833
AM=M+1 // 5834
A=A-1 // 5835
M=D // 5836
@48 // 5837
D=A // 5838
@SP // 5839
AM=M+1 // 5840
A=A-1 // 5841
M=D // 5842
@48 // 5843
D=A // 5844
@SP // 5845
AM=M+1 // 5846
A=A-1 // 5847
M=D // 5848
@24 // 5849
D=A // 5850
@SP // 5851
AM=M+1 // 5852
A=A-1 // 5853
M=D // 5854
@12 // 5855
D=A // 5856
@SP // 5857
AM=M+1 // 5858
A=A-1 // 5859
M=D // 5860
@12 // 5861
D=A // 5862
@SP // 5863
AM=M+1 // 5864
A=A-1 // 5865
M=D // 5866
@12 // 5867
D=A // 5868
@SP // 5869
AM=M+1 // 5870
A=A-1 // 5871
M=D // 5872
@12 // 5873
D=A // 5874
@SP // 5875
AM=M+1 // 5876
A=A-1 // 5877
M=D // 5878
@SP // 5879
AM=M+1 // 5880
A=A-1 // 5881
M=0 // 5882
@SP // 5883
AM=M+1 // 5884
A=A-1 // 5885
M=0 // 5886
// call Output.create
@17 // 5887
D=A // 5888
@14 // 5889
M=D // 5890
@Output.create // 5891
D=A // 5892
@13 // 5893
M=D // 5894
@Output.initMap.ret.25 // 5895
D=A // 5896
@CALL // 5897
0;JMP // 5898
(Output.initMap.ret.25)
@SP // 5899
M=M-1 // 5900

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 5901
D=A // 5902
@SP // 5903
AM=M+1 // 5904
A=A-1 // 5905
M=D // 5906
@30 // 5907
D=A // 5908
@SP // 5909
AM=M+1 // 5910
A=A-1 // 5911
M=D // 5912
@51 // 5913
D=A // 5914
@SP // 5915
AM=M+1 // 5916
A=A-1 // 5917
M=D // 5918
@51 // 5919
D=A // 5920
@SP // 5921
AM=M+1 // 5922
A=A-1 // 5923
M=D // 5924
@51 // 5925
D=A // 5926
@SP // 5927
AM=M+1 // 5928
A=A-1 // 5929
M=D // 5930
@30 // 5931
D=A // 5932
@SP // 5933
AM=M+1 // 5934
A=A-1 // 5935
M=D // 5936
@51 // 5937
D=A // 5938
@SP // 5939
AM=M+1 // 5940
A=A-1 // 5941
M=D // 5942
@51 // 5943
D=A // 5944
@SP // 5945
AM=M+1 // 5946
A=A-1 // 5947
M=D // 5948
@51 // 5949
D=A // 5950
@SP // 5951
AM=M+1 // 5952
A=A-1 // 5953
M=D // 5954
@30 // 5955
D=A // 5956
@SP // 5957
AM=M+1 // 5958
A=A-1 // 5959
M=D // 5960
@SP // 5961
AM=M+1 // 5962
A=A-1 // 5963
M=0 // 5964
@SP // 5965
AM=M+1 // 5966
A=A-1 // 5967
M=0 // 5968
// call Output.create
@17 // 5969
D=A // 5970
@14 // 5971
M=D // 5972
@Output.create // 5973
D=A // 5974
@13 // 5975
M=D // 5976
@Output.initMap.ret.26 // 5977
D=A // 5978
@CALL // 5979
0;JMP // 5980
(Output.initMap.ret.26)
@SP // 5981
M=M-1 // 5982

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 5983
D=A // 5984
@SP // 5985
AM=M+1 // 5986
A=A-1 // 5987
M=D // 5988
@30 // 5989
D=A // 5990
@SP // 5991
AM=M+1 // 5992
A=A-1 // 5993
M=D // 5994
@51 // 5995
D=A // 5996
@SP // 5997
AM=M+1 // 5998
A=A-1 // 5999
M=D // 6000
@51 // 6001
D=A // 6002
@SP // 6003
AM=M+1 // 6004
A=A-1 // 6005
M=D // 6006
@51 // 6007
D=A // 6008
@SP // 6009
AM=M+1 // 6010
A=A-1 // 6011
M=D // 6012
@62 // 6013
D=A // 6014
@SP // 6015
AM=M+1 // 6016
A=A-1 // 6017
M=D // 6018
@48 // 6019
D=A // 6020
@SP // 6021
AM=M+1 // 6022
A=A-1 // 6023
M=D // 6024
@48 // 6025
D=A // 6026
@SP // 6027
AM=M+1 // 6028
A=A-1 // 6029
M=D // 6030
@24 // 6031
D=A // 6032
@SP // 6033
AM=M+1 // 6034
A=A-1 // 6035
M=D // 6036
@14 // 6037
D=A // 6038
@SP // 6039
AM=M+1 // 6040
A=A-1 // 6041
M=D // 6042
@SP // 6043
AM=M+1 // 6044
A=A-1 // 6045
M=0 // 6046
@SP // 6047
AM=M+1 // 6048
A=A-1 // 6049
M=0 // 6050
// call Output.create
@17 // 6051
D=A // 6052
@14 // 6053
M=D // 6054
@Output.create // 6055
D=A // 6056
@13 // 6057
M=D // 6058
@Output.initMap.ret.27 // 6059
D=A // 6060
@CALL // 6061
0;JMP // 6062
(Output.initMap.ret.27)
@SP // 6063
M=M-1 // 6064

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6065
D=A // 6066
@SP // 6067
M=D+M // 6068
@58 // 6069
D=A // 6070
@SP // 6071
A=M-1 // 6072
M=0 // 6073
A=A-1 // 6074
M=0 // 6075
A=A-1 // 6076
M=D // 6077
A=A-1 // 6078
@4 // 6079
D=A // 6080
@SP // 6081
M=D+M // 6082
@12 // 6083
D=A // 6084
@SP // 6085
A=M-1 // 6086
M=0 // 6087
A=A-1 // 6088
M=0 // 6089
A=A-1 // 6090
M=D // 6091
A=A-1 // 6092
M=D // 6093
A=A-1 // 6094
@5 // 6095
D=A // 6096
@SP // 6097
M=D+M // 6098
@12 // 6099
D=A // 6100
@SP // 6101
A=M-1 // 6102
M=0 // 6103
A=A-1 // 6104
M=0 // 6105
A=A-1 // 6106
M=0 // 6107
A=A-1 // 6108
M=D // 6109
A=A-1 // 6110
M=D // 6111
A=A-1 // 6112
// call Output.create
@17 // 6113
D=A // 6114
@14 // 6115
M=D // 6116
@Output.create // 6117
D=A // 6118
@13 // 6119
M=D // 6120
@Output.initMap.ret.28 // 6121
D=A // 6122
@CALL // 6123
0;JMP // 6124
(Output.initMap.ret.28)
@SP // 6125
M=M-1 // 6126

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6127
D=A // 6128
@SP // 6129
M=D+M // 6130
@59 // 6131
D=A // 6132
@SP // 6133
A=M-1 // 6134
M=0 // 6135
A=A-1 // 6136
M=0 // 6137
A=A-1 // 6138
M=D // 6139
A=A-1 // 6140
@4 // 6141
D=A // 6142
@SP // 6143
M=D+M // 6144
@12 // 6145
D=A // 6146
@SP // 6147
A=M-1 // 6148
M=0 // 6149
A=A-1 // 6150
M=0 // 6151
A=A-1 // 6152
M=D // 6153
A=A-1 // 6154
M=D // 6155
A=A-1 // 6156
@12 // 6157
D=A // 6158
@SP // 6159
AM=M+1 // 6160
A=A-1 // 6161
M=D // 6162
@12 // 6163
D=A // 6164
@SP // 6165
AM=M+1 // 6166
A=A-1 // 6167
M=D // 6168
@6 // 6169
D=A // 6170
@SP // 6171
AM=M+1 // 6172
A=A-1 // 6173
M=D // 6174
@SP // 6175
AM=M+1 // 6176
A=A-1 // 6177
M=0 // 6178
@SP // 6179
AM=M+1 // 6180
A=A-1 // 6181
M=0 // 6182
// call Output.create
@17 // 6183
D=A // 6184
@14 // 6185
M=D // 6186
@Output.create // 6187
D=A // 6188
@13 // 6189
M=D // 6190
@Output.initMap.ret.29 // 6191
D=A // 6192
@CALL // 6193
0;JMP // 6194
(Output.initMap.ret.29)
@SP // 6195
M=M-1 // 6196

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6197
D=A // 6198
@SP // 6199
M=D+M // 6200
@60 // 6201
D=A // 6202
@SP // 6203
A=M-1 // 6204
M=0 // 6205
A=A-1 // 6206
M=0 // 6207
A=A-1 // 6208
M=D // 6209
A=A-1 // 6210
@24 // 6211
D=A // 6212
@SP // 6213
AM=M+1 // 6214
A=A-1 // 6215
M=D // 6216
@12 // 6217
D=A // 6218
@SP // 6219
AM=M+1 // 6220
A=A-1 // 6221
M=D // 6222
@6 // 6223
D=A // 6224
@SP // 6225
AM=M+1 // 6226
A=A-1 // 6227
M=D // 6228
@3 // 6229
D=A // 6230
@SP // 6231
AM=M+1 // 6232
A=A-1 // 6233
M=D // 6234
@6 // 6235
D=A // 6236
@SP // 6237
AM=M+1 // 6238
A=A-1 // 6239
M=D // 6240
@12 // 6241
D=A // 6242
@SP // 6243
AM=M+1 // 6244
A=A-1 // 6245
M=D // 6246
@24 // 6247
D=A // 6248
@SP // 6249
AM=M+1 // 6250
A=A-1 // 6251
M=D // 6252
@SP // 6253
AM=M+1 // 6254
A=A-1 // 6255
M=0 // 6256
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=0 // 6260
// call Output.create
@17 // 6261
D=A // 6262
@14 // 6263
M=D // 6264
@Output.create // 6265
D=A // 6266
@13 // 6267
M=D // 6268
@Output.initMap.ret.30 // 6269
D=A // 6270
@CALL // 6271
0;JMP // 6272
(Output.initMap.ret.30)
@SP // 6273
M=M-1 // 6274

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6275
D=A // 6276
@SP // 6277
M=D+M // 6278
@61 // 6279
D=A // 6280
@SP // 6281
A=M-1 // 6282
M=0 // 6283
A=A-1 // 6284
M=0 // 6285
A=A-1 // 6286
M=0 // 6287
A=A-1 // 6288
M=D // 6289
A=A-1 // 6290
@3 // 6291
D=A // 6292
@SP // 6293
M=D+M // 6294
@63 // 6295
D=A // 6296
@SP // 6297
A=M-1 // 6298
M=0 // 6299
A=A-1 // 6300
M=0 // 6301
A=A-1 // 6302
M=D // 6303
A=A-1 // 6304
@5 // 6305
D=A // 6306
@SP // 6307
M=D+M // 6308
@63 // 6309
D=A // 6310
@SP // 6311
A=M-1 // 6312
M=0 // 6313
A=A-1 // 6314
M=0 // 6315
A=A-1 // 6316
M=0 // 6317
A=A-1 // 6318
M=0 // 6319
A=A-1 // 6320
M=D // 6321
A=A-1 // 6322
// call Output.create
@17 // 6323
D=A // 6324
@14 // 6325
M=D // 6326
@Output.create // 6327
D=A // 6328
@13 // 6329
M=D // 6330
@Output.initMap.ret.31 // 6331
D=A // 6332
@CALL // 6333
0;JMP // 6334
(Output.initMap.ret.31)
@SP // 6335
M=M-1 // 6336

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6337
D=A // 6338
@SP // 6339
M=D+M // 6340
@62 // 6341
D=A // 6342
@SP // 6343
A=M-1 // 6344
M=0 // 6345
A=A-1 // 6346
M=0 // 6347
A=A-1 // 6348
M=D // 6349
A=A-1 // 6350
@3 // 6351
D=A // 6352
@SP // 6353
AM=M+1 // 6354
A=A-1 // 6355
M=D // 6356
@6 // 6357
D=A // 6358
@SP // 6359
AM=M+1 // 6360
A=A-1 // 6361
M=D // 6362
@12 // 6363
D=A // 6364
@SP // 6365
AM=M+1 // 6366
A=A-1 // 6367
M=D // 6368
@24 // 6369
D=A // 6370
@SP // 6371
AM=M+1 // 6372
A=A-1 // 6373
M=D // 6374
@12 // 6375
D=A // 6376
@SP // 6377
AM=M+1 // 6378
A=A-1 // 6379
M=D // 6380
@6 // 6381
D=A // 6382
@SP // 6383
AM=M+1 // 6384
A=A-1 // 6385
M=D // 6386
@3 // 6387
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
// call Output.create
@17 // 6401
D=A // 6402
@14 // 6403
M=D // 6404
@Output.create // 6405
D=A // 6406
@13 // 6407
M=D // 6408
@Output.initMap.ret.32 // 6409
D=A // 6410
@CALL // 6411
0;JMP // 6412
(Output.initMap.ret.32)
@SP // 6413
M=M-1 // 6414

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6415
D=A // 6416
@SP // 6417
AM=M+1 // 6418
A=A-1 // 6419
M=D // 6420
@30 // 6421
D=A // 6422
@SP // 6423
AM=M+1 // 6424
A=A-1 // 6425
M=D // 6426
@51 // 6427
D=A // 6428
@SP // 6429
AM=M+1 // 6430
A=A-1 // 6431
M=D // 6432
@51 // 6433
D=A // 6434
@SP // 6435
AM=M+1 // 6436
A=A-1 // 6437
M=D // 6438
@59 // 6439
D=A // 6440
@SP // 6441
AM=M+1 // 6442
A=A-1 // 6443
M=D // 6444
@59 // 6445
D=A // 6446
@SP // 6447
AM=M+1 // 6448
A=A-1 // 6449
M=D // 6450
@59 // 6451
D=A // 6452
@SP // 6453
AM=M+1 // 6454
A=A-1 // 6455
M=D // 6456
@27 // 6457
D=A // 6458
@SP // 6459
AM=M+1 // 6460
A=A-1 // 6461
M=D // 6462
@3 // 6463
D=A // 6464
@SP // 6465
AM=M+1 // 6466
A=A-1 // 6467
M=D // 6468
@30 // 6469
D=A // 6470
@SP // 6471
AM=M+1 // 6472
A=A-1 // 6473
M=D // 6474
@SP // 6475
AM=M+1 // 6476
A=A-1 // 6477
M=0 // 6478
@SP // 6479
AM=M+1 // 6480
A=A-1 // 6481
M=0 // 6482
// call Output.create
@17 // 6483
D=A // 6484
@14 // 6485
M=D // 6486
@Output.create // 6487
D=A // 6488
@13 // 6489
M=D // 6490
@Output.initMap.ret.33 // 6491
D=A // 6492
@CALL // 6493
0;JMP // 6494
(Output.initMap.ret.33)
@SP // 6495
M=M-1 // 6496

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6497
D=A // 6498
@SP // 6499
AM=M+1 // 6500
A=A-1 // 6501
M=D // 6502
@30 // 6503
D=A // 6504
@SP // 6505
AM=M+1 // 6506
A=A-1 // 6507
M=D // 6508
@51 // 6509
D=A // 6510
@SP // 6511
AM=M+1 // 6512
A=A-1 // 6513
M=D // 6514
@51 // 6515
D=A // 6516
@SP // 6517
AM=M+1 // 6518
A=A-1 // 6519
M=D // 6520
@24 // 6521
D=A // 6522
@SP // 6523
AM=M+1 // 6524
A=A-1 // 6525
M=D // 6526
@12 // 6527
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
@SP // 6539
AM=M+1 // 6540
A=A-1 // 6541
M=0 // 6542
@4 // 6543
D=A // 6544
@SP // 6545
M=D+M // 6546
@12 // 6547
D=A // 6548
@SP // 6549
A=M-1 // 6550
M=0 // 6551
A=A-1 // 6552
M=0 // 6553
A=A-1 // 6554
M=D // 6555
A=A-1 // 6556
M=D // 6557
A=A-1 // 6558
// call Output.create
@17 // 6559
D=A // 6560
@14 // 6561
M=D // 6562
@Output.create // 6563
D=A // 6564
@13 // 6565
M=D // 6566
@Output.initMap.ret.34 // 6567
D=A // 6568
@CALL // 6569
0;JMP // 6570
(Output.initMap.ret.34)
@SP // 6571
M=M-1 // 6572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6573
D=A // 6574
@SP // 6575
AM=M+1 // 6576
A=A-1 // 6577
M=D // 6578
@12 // 6579
D=A // 6580
@SP // 6581
AM=M+1 // 6582
A=A-1 // 6583
M=D // 6584
@30 // 6585
D=A // 6586
@SP // 6587
AM=M+1 // 6588
A=A-1 // 6589
M=D // 6590
@51 // 6591
D=A // 6592
@SP // 6593
AM=M+1 // 6594
A=A-1 // 6595
M=D // 6596
@51 // 6597
D=A // 6598
@SP // 6599
AM=M+1 // 6600
A=A-1 // 6601
M=D // 6602
@63 // 6603
D=A // 6604
@SP // 6605
AM=M+1 // 6606
A=A-1 // 6607
M=D // 6608
@51 // 6609
D=A // 6610
@SP // 6611
AM=M+1 // 6612
A=A-1 // 6613
M=D // 6614
@51 // 6615
D=A // 6616
@SP // 6617
AM=M+1 // 6618
A=A-1 // 6619
M=D // 6620
@51 // 6621
D=A // 6622
@SP // 6623
AM=M+1 // 6624
A=A-1 // 6625
M=D // 6626
@51 // 6627
D=A // 6628
@SP // 6629
AM=M+1 // 6630
A=A-1 // 6631
M=D // 6632
@SP // 6633
AM=M+1 // 6634
A=A-1 // 6635
M=0 // 6636
@SP // 6637
AM=M+1 // 6638
A=A-1 // 6639
M=0 // 6640
// call Output.create
@17 // 6641
D=A // 6642
@14 // 6643
M=D // 6644
@Output.create // 6645
D=A // 6646
@13 // 6647
M=D // 6648
@Output.initMap.ret.35 // 6649
D=A // 6650
@CALL // 6651
0;JMP // 6652
(Output.initMap.ret.35)
@SP // 6653
M=M-1 // 6654

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6655
D=A // 6656
@SP // 6657
AM=M+1 // 6658
A=A-1 // 6659
M=D // 6660
@31 // 6661
D=A // 6662
@SP // 6663
AM=M+1 // 6664
A=A-1 // 6665
M=D // 6666
@51 // 6667
D=A // 6668
@SP // 6669
AM=M+1 // 6670
A=A-1 // 6671
M=D // 6672
@51 // 6673
D=A // 6674
@SP // 6675
AM=M+1 // 6676
A=A-1 // 6677
M=D // 6678
@51 // 6679
D=A // 6680
@SP // 6681
AM=M+1 // 6682
A=A-1 // 6683
M=D // 6684
@31 // 6685
D=A // 6686
@SP // 6687
AM=M+1 // 6688
A=A-1 // 6689
M=D // 6690
@51 // 6691
D=A // 6692
@SP // 6693
AM=M+1 // 6694
A=A-1 // 6695
M=D // 6696
@51 // 6697
D=A // 6698
@SP // 6699
AM=M+1 // 6700
A=A-1 // 6701
M=D // 6702
@51 // 6703
D=A // 6704
@SP // 6705
AM=M+1 // 6706
A=A-1 // 6707
M=D // 6708
@31 // 6709
D=A // 6710
@SP // 6711
AM=M+1 // 6712
A=A-1 // 6713
M=D // 6714
@SP // 6715
AM=M+1 // 6716
A=A-1 // 6717
M=0 // 6718
@SP // 6719
AM=M+1 // 6720
A=A-1 // 6721
M=0 // 6722
// call Output.create
@17 // 6723
D=A // 6724
@14 // 6725
M=D // 6726
@Output.create // 6727
D=A // 6728
@13 // 6729
M=D // 6730
@Output.initMap.ret.36 // 6731
D=A // 6732
@CALL // 6733
0;JMP // 6734
(Output.initMap.ret.36)
@SP // 6735
M=M-1 // 6736

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6737
D=A // 6738
@SP // 6739
AM=M+1 // 6740
A=A-1 // 6741
M=D // 6742
@28 // 6743
D=A // 6744
@SP // 6745
AM=M+1 // 6746
A=A-1 // 6747
M=D // 6748
@54 // 6749
D=A // 6750
@SP // 6751
AM=M+1 // 6752
A=A-1 // 6753
M=D // 6754
@35 // 6755
D=A // 6756
@SP // 6757
AM=M+1 // 6758
A=A-1 // 6759
M=D // 6760
@3 // 6761
D=A // 6762
@SP // 6763
AM=M+1 // 6764
A=A-1 // 6765
M=D // 6766
@3 // 6767
D=A // 6768
@SP // 6769
AM=M+1 // 6770
A=A-1 // 6771
M=D // 6772
@3 // 6773
D=A // 6774
@SP // 6775
AM=M+1 // 6776
A=A-1 // 6777
M=D // 6778
@35 // 6779
D=A // 6780
@SP // 6781
AM=M+1 // 6782
A=A-1 // 6783
M=D // 6784
@54 // 6785
D=A // 6786
@SP // 6787
AM=M+1 // 6788
A=A-1 // 6789
M=D // 6790
@28 // 6791
D=A // 6792
@SP // 6793
AM=M+1 // 6794
A=A-1 // 6795
M=D // 6796
@SP // 6797
AM=M+1 // 6798
A=A-1 // 6799
M=0 // 6800
@SP // 6801
AM=M+1 // 6802
A=A-1 // 6803
M=0 // 6804
// call Output.create
@17 // 6805
D=A // 6806
@14 // 6807
M=D // 6808
@Output.create // 6809
D=A // 6810
@13 // 6811
M=D // 6812
@Output.initMap.ret.37 // 6813
D=A // 6814
@CALL // 6815
0;JMP // 6816
(Output.initMap.ret.37)
@SP // 6817
M=M-1 // 6818

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 6819
D=A // 6820
@SP // 6821
AM=M+1 // 6822
A=A-1 // 6823
M=D // 6824
@15 // 6825
D=A // 6826
@SP // 6827
AM=M+1 // 6828
A=A-1 // 6829
M=D // 6830
@27 // 6831
D=A // 6832
@SP // 6833
AM=M+1 // 6834
A=A-1 // 6835
M=D // 6836
@51 // 6837
D=A // 6838
@SP // 6839
AM=M+1 // 6840
A=A-1 // 6841
M=D // 6842
@51 // 6843
D=A // 6844
@SP // 6845
AM=M+1 // 6846
A=A-1 // 6847
M=D // 6848
@51 // 6849
D=A // 6850
@SP // 6851
AM=M+1 // 6852
A=A-1 // 6853
M=D // 6854
@51 // 6855
D=A // 6856
@SP // 6857
AM=M+1 // 6858
A=A-1 // 6859
M=D // 6860
@51 // 6861
D=A // 6862
@SP // 6863
AM=M+1 // 6864
A=A-1 // 6865
M=D // 6866
@27 // 6867
D=A // 6868
@SP // 6869
AM=M+1 // 6870
A=A-1 // 6871
M=D // 6872
@15 // 6873
D=A // 6874
@SP // 6875
AM=M+1 // 6876
A=A-1 // 6877
M=D // 6878
@SP // 6879
AM=M+1 // 6880
A=A-1 // 6881
M=0 // 6882
@SP // 6883
AM=M+1 // 6884
A=A-1 // 6885
M=0 // 6886
// call Output.create
@17 // 6887
D=A // 6888
@14 // 6889
M=D // 6890
@Output.create // 6891
D=A // 6892
@13 // 6893
M=D // 6894
@Output.initMap.ret.38 // 6895
D=A // 6896
@CALL // 6897
0;JMP // 6898
(Output.initMap.ret.38)
@SP // 6899
M=M-1 // 6900

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 6901
D=A // 6902
@SP // 6903
AM=M+1 // 6904
A=A-1 // 6905
M=D // 6906
@63 // 6907
D=A // 6908
@SP // 6909
AM=M+1 // 6910
A=A-1 // 6911
M=D // 6912
@51 // 6913
D=A // 6914
@SP // 6915
AM=M+1 // 6916
A=A-1 // 6917
M=D // 6918
@35 // 6919
D=A // 6920
@SP // 6921
AM=M+1 // 6922
A=A-1 // 6923
M=D // 6924
@11 // 6925
D=A // 6926
@SP // 6927
AM=M+1 // 6928
A=A-1 // 6929
M=D // 6930
@15 // 6931
D=A // 6932
@SP // 6933
AM=M+1 // 6934
A=A-1 // 6935
M=D // 6936
@11 // 6937
D=A // 6938
@SP // 6939
AM=M+1 // 6940
A=A-1 // 6941
M=D // 6942
@35 // 6943
D=A // 6944
@SP // 6945
AM=M+1 // 6946
A=A-1 // 6947
M=D // 6948
@51 // 6949
D=A // 6950
@SP // 6951
AM=M+1 // 6952
A=A-1 // 6953
M=D // 6954
@63 // 6955
D=A // 6956
@SP // 6957
AM=M+1 // 6958
A=A-1 // 6959
M=D // 6960
@SP // 6961
AM=M+1 // 6962
A=A-1 // 6963
M=0 // 6964
@SP // 6965
AM=M+1 // 6966
A=A-1 // 6967
M=0 // 6968
// call Output.create
@17 // 6969
D=A // 6970
@14 // 6971
M=D // 6972
@Output.create // 6973
D=A // 6974
@13 // 6975
M=D // 6976
@Output.initMap.ret.39 // 6977
D=A // 6978
@CALL // 6979
0;JMP // 6980
(Output.initMap.ret.39)
@SP // 6981
M=M-1 // 6982

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 6983
D=A // 6984
@SP // 6985
AM=M+1 // 6986
A=A-1 // 6987
M=D // 6988
@63 // 6989
D=A // 6990
@SP // 6991
AM=M+1 // 6992
A=A-1 // 6993
M=D // 6994
@51 // 6995
D=A // 6996
@SP // 6997
AM=M+1 // 6998
A=A-1 // 6999
M=D // 7000
@35 // 7001
D=A // 7002
@SP // 7003
AM=M+1 // 7004
A=A-1 // 7005
M=D // 7006
@11 // 7007
D=A // 7008
@SP // 7009
AM=M+1 // 7010
A=A-1 // 7011
M=D // 7012
@15 // 7013
D=A // 7014
@SP // 7015
AM=M+1 // 7016
A=A-1 // 7017
M=D // 7018
@11 // 7019
D=A // 7020
@SP // 7021
AM=M+1 // 7022
A=A-1 // 7023
M=D // 7024
@3 // 7025
D=A // 7026
@SP // 7027
AM=M+1 // 7028
A=A-1 // 7029
M=D // 7030
@3 // 7031
D=A // 7032
@SP // 7033
AM=M+1 // 7034
A=A-1 // 7035
M=D // 7036
@3 // 7037
D=A // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=D // 7042
@SP // 7043
AM=M+1 // 7044
A=A-1 // 7045
M=0 // 7046
@SP // 7047
AM=M+1 // 7048
A=A-1 // 7049
M=0 // 7050
// call Output.create
@17 // 7051
D=A // 7052
@14 // 7053
M=D // 7054
@Output.create // 7055
D=A // 7056
@13 // 7057
M=D // 7058
@Output.initMap.ret.40 // 7059
D=A // 7060
@CALL // 7061
0;JMP // 7062
(Output.initMap.ret.40)
@SP // 7063
M=M-1 // 7064

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7065
D=A // 7066
@SP // 7067
AM=M+1 // 7068
A=A-1 // 7069
M=D // 7070
@28 // 7071
D=A // 7072
@SP // 7073
AM=M+1 // 7074
A=A-1 // 7075
M=D // 7076
@54 // 7077
D=A // 7078
@SP // 7079
AM=M+1 // 7080
A=A-1 // 7081
M=D // 7082
@35 // 7083
D=A // 7084
@SP // 7085
AM=M+1 // 7086
A=A-1 // 7087
M=D // 7088
@3 // 7089
D=A // 7090
@SP // 7091
AM=M+1 // 7092
A=A-1 // 7093
M=D // 7094
@59 // 7095
D=A // 7096
@SP // 7097
AM=M+1 // 7098
A=A-1 // 7099
M=D // 7100
@51 // 7101
D=A // 7102
@SP // 7103
AM=M+1 // 7104
A=A-1 // 7105
M=D // 7106
@51 // 7107
D=A // 7108
@SP // 7109
AM=M+1 // 7110
A=A-1 // 7111
M=D // 7112
@54 // 7113
D=A // 7114
@SP // 7115
AM=M+1 // 7116
A=A-1 // 7117
M=D // 7118
@44 // 7119
D=A // 7120
@SP // 7121
AM=M+1 // 7122
A=A-1 // 7123
M=D // 7124
@SP // 7125
AM=M+1 // 7126
A=A-1 // 7127
M=0 // 7128
@SP // 7129
AM=M+1 // 7130
A=A-1 // 7131
M=0 // 7132
// call Output.create
@17 // 7133
D=A // 7134
@14 // 7135
M=D // 7136
@Output.create // 7137
D=A // 7138
@13 // 7139
M=D // 7140
@Output.initMap.ret.41 // 7141
D=A // 7142
@CALL // 7143
0;JMP // 7144
(Output.initMap.ret.41)
@SP // 7145
M=M-1 // 7146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7147
D=A // 7148
@SP // 7149
AM=M+1 // 7150
A=A-1 // 7151
M=D // 7152
@51 // 7153
D=A // 7154
@SP // 7155
AM=M+1 // 7156
A=A-1 // 7157
M=D // 7158
@51 // 7159
D=A // 7160
@SP // 7161
AM=M+1 // 7162
A=A-1 // 7163
M=D // 7164
@51 // 7165
D=A // 7166
@SP // 7167
AM=M+1 // 7168
A=A-1 // 7169
M=D // 7170
@51 // 7171
D=A // 7172
@SP // 7173
AM=M+1 // 7174
A=A-1 // 7175
M=D // 7176
@63 // 7177
D=A // 7178
@SP // 7179
AM=M+1 // 7180
A=A-1 // 7181
M=D // 7182
@51 // 7183
D=A // 7184
@SP // 7185
AM=M+1 // 7186
A=A-1 // 7187
M=D // 7188
@51 // 7189
D=A // 7190
@SP // 7191
AM=M+1 // 7192
A=A-1 // 7193
M=D // 7194
@51 // 7195
D=A // 7196
@SP // 7197
AM=M+1 // 7198
A=A-1 // 7199
M=D // 7200
@51 // 7201
D=A // 7202
@SP // 7203
AM=M+1 // 7204
A=A-1 // 7205
M=D // 7206
@SP // 7207
AM=M+1 // 7208
A=A-1 // 7209
M=0 // 7210
@SP // 7211
AM=M+1 // 7212
A=A-1 // 7213
M=0 // 7214
// call Output.create
@17 // 7215
D=A // 7216
@14 // 7217
M=D // 7218
@Output.create // 7219
D=A // 7220
@13 // 7221
M=D // 7222
@Output.initMap.ret.42 // 7223
D=A // 7224
@CALL // 7225
0;JMP // 7226
(Output.initMap.ret.42)
@SP // 7227
M=M-1 // 7228

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7229
D=A // 7230
@SP // 7231
AM=M+1 // 7232
A=A-1 // 7233
M=D // 7234
@30 // 7235
D=A // 7236
@SP // 7237
AM=M+1 // 7238
A=A-1 // 7239
M=D // 7240
@12 // 7241
D=A // 7242
@SP // 7243
AM=M+1 // 7244
A=A-1 // 7245
M=D // 7246
@12 // 7247
D=A // 7248
@SP // 7249
AM=M+1 // 7250
A=A-1 // 7251
M=D // 7252
@12 // 7253
D=A // 7254
@SP // 7255
AM=M+1 // 7256
A=A-1 // 7257
M=D // 7258
@12 // 7259
D=A // 7260
@SP // 7261
AM=M+1 // 7262
A=A-1 // 7263
M=D // 7264
@12 // 7265
D=A // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=D // 7270
@12 // 7271
D=A // 7272
@SP // 7273
AM=M+1 // 7274
A=A-1 // 7275
M=D // 7276
@12 // 7277
D=A // 7278
@SP // 7279
AM=M+1 // 7280
A=A-1 // 7281
M=D // 7282
@30 // 7283
D=A // 7284
@SP // 7285
AM=M+1 // 7286
A=A-1 // 7287
M=D // 7288
@SP // 7289
AM=M+1 // 7290
A=A-1 // 7291
M=0 // 7292
@SP // 7293
AM=M+1 // 7294
A=A-1 // 7295
M=0 // 7296
// call Output.create
@17 // 7297
D=A // 7298
@14 // 7299
M=D // 7300
@Output.create // 7301
D=A // 7302
@13 // 7303
M=D // 7304
@Output.initMap.ret.43 // 7305
D=A // 7306
@CALL // 7307
0;JMP // 7308
(Output.initMap.ret.43)
@SP // 7309
M=M-1 // 7310

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7311
D=A // 7312
@SP // 7313
AM=M+1 // 7314
A=A-1 // 7315
M=D // 7316
@60 // 7317
D=A // 7318
@SP // 7319
AM=M+1 // 7320
A=A-1 // 7321
M=D // 7322
@24 // 7323
D=A // 7324
@SP // 7325
AM=M+1 // 7326
A=A-1 // 7327
M=D // 7328
@24 // 7329
D=A // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=D // 7334
@24 // 7335
D=A // 7336
@SP // 7337
AM=M+1 // 7338
A=A-1 // 7339
M=D // 7340
@24 // 7341
D=A // 7342
@SP // 7343
AM=M+1 // 7344
A=A-1 // 7345
M=D // 7346
@24 // 7347
D=A // 7348
@SP // 7349
AM=M+1 // 7350
A=A-1 // 7351
M=D // 7352
@27 // 7353
D=A // 7354
@SP // 7355
AM=M+1 // 7356
A=A-1 // 7357
M=D // 7358
@27 // 7359
D=A // 7360
@SP // 7361
AM=M+1 // 7362
A=A-1 // 7363
M=D // 7364
@14 // 7365
D=A // 7366
@SP // 7367
AM=M+1 // 7368
A=A-1 // 7369
M=D // 7370
@SP // 7371
AM=M+1 // 7372
A=A-1 // 7373
M=0 // 7374
@SP // 7375
AM=M+1 // 7376
A=A-1 // 7377
M=0 // 7378
// call Output.create
@17 // 7379
D=A // 7380
@14 // 7381
M=D // 7382
@Output.create // 7383
D=A // 7384
@13 // 7385
M=D // 7386
@Output.initMap.ret.44 // 7387
D=A // 7388
@CALL // 7389
0;JMP // 7390
(Output.initMap.ret.44)
@SP // 7391
M=M-1 // 7392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7393
D=A // 7394
@SP // 7395
AM=M+1 // 7396
A=A-1 // 7397
M=D // 7398
@51 // 7399
D=A // 7400
@SP // 7401
AM=M+1 // 7402
A=A-1 // 7403
M=D // 7404
@51 // 7405
D=A // 7406
@SP // 7407
AM=M+1 // 7408
A=A-1 // 7409
M=D // 7410
@51 // 7411
D=A // 7412
@SP // 7413
AM=M+1 // 7414
A=A-1 // 7415
M=D // 7416
@27 // 7417
D=A // 7418
@SP // 7419
AM=M+1 // 7420
A=A-1 // 7421
M=D // 7422
@15 // 7423
D=A // 7424
@SP // 7425
AM=M+1 // 7426
A=A-1 // 7427
M=D // 7428
@27 // 7429
D=A // 7430
@SP // 7431
AM=M+1 // 7432
A=A-1 // 7433
M=D // 7434
@51 // 7435
D=A // 7436
@SP // 7437
AM=M+1 // 7438
A=A-1 // 7439
M=D // 7440
@51 // 7441
D=A // 7442
@SP // 7443
AM=M+1 // 7444
A=A-1 // 7445
M=D // 7446
@51 // 7447
D=A // 7448
@SP // 7449
AM=M+1 // 7450
A=A-1 // 7451
M=D // 7452
@SP // 7453
AM=M+1 // 7454
A=A-1 // 7455
M=0 // 7456
@SP // 7457
AM=M+1 // 7458
A=A-1 // 7459
M=0 // 7460
// call Output.create
@17 // 7461
D=A // 7462
@14 // 7463
M=D // 7464
@Output.create // 7465
D=A // 7466
@13 // 7467
M=D // 7468
@Output.initMap.ret.45 // 7469
D=A // 7470
@CALL // 7471
0;JMP // 7472
(Output.initMap.ret.45)
@SP // 7473
M=M-1 // 7474

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7475
D=A // 7476
@SP // 7477
AM=M+1 // 7478
A=A-1 // 7479
M=D // 7480
@3 // 7481
D=A // 7482
@SP // 7483
AM=M+1 // 7484
A=A-1 // 7485
M=D // 7486
@3 // 7487
D=A // 7488
@SP // 7489
AM=M+1 // 7490
A=A-1 // 7491
M=D // 7492
@3 // 7493
D=A // 7494
@SP // 7495
AM=M+1 // 7496
A=A-1 // 7497
M=D // 7498
@3 // 7499
D=A // 7500
@SP // 7501
AM=M+1 // 7502
A=A-1 // 7503
M=D // 7504
@3 // 7505
D=A // 7506
@SP // 7507
AM=M+1 // 7508
A=A-1 // 7509
M=D // 7510
@3 // 7511
D=A // 7512
@SP // 7513
AM=M+1 // 7514
A=A-1 // 7515
M=D // 7516
@35 // 7517
D=A // 7518
@SP // 7519
AM=M+1 // 7520
A=A-1 // 7521
M=D // 7522
@51 // 7523
D=A // 7524
@SP // 7525
AM=M+1 // 7526
A=A-1 // 7527
M=D // 7528
@63 // 7529
D=A // 7530
@SP // 7531
AM=M+1 // 7532
A=A-1 // 7533
M=D // 7534
@SP // 7535
AM=M+1 // 7536
A=A-1 // 7537
M=0 // 7538
@SP // 7539
AM=M+1 // 7540
A=A-1 // 7541
M=0 // 7542
// call Output.create
@17 // 7543
D=A // 7544
@14 // 7545
M=D // 7546
@Output.create // 7547
D=A // 7548
@13 // 7549
M=D // 7550
@Output.initMap.ret.46 // 7551
D=A // 7552
@CALL // 7553
0;JMP // 7554
(Output.initMap.ret.46)
@SP // 7555
M=M-1 // 7556

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7557
D=A // 7558
@SP // 7559
AM=M+1 // 7560
A=A-1 // 7561
M=D // 7562
@33 // 7563
D=A // 7564
@SP // 7565
AM=M+1 // 7566
A=A-1 // 7567
M=D // 7568
@51 // 7569
D=A // 7570
@SP // 7571
AM=M+1 // 7572
A=A-1 // 7573
M=D // 7574
@63 // 7575
D=A // 7576
@SP // 7577
AM=M+1 // 7578
A=A-1 // 7579
M=D // 7580
@63 // 7581
D=A // 7582
@SP // 7583
AM=M+1 // 7584
A=A-1 // 7585
M=D // 7586
@51 // 7587
D=A // 7588
@SP // 7589
AM=M+1 // 7590
A=A-1 // 7591
M=D // 7592
@51 // 7593
D=A // 7594
@SP // 7595
AM=M+1 // 7596
A=A-1 // 7597
M=D // 7598
@51 // 7599
D=A // 7600
@SP // 7601
AM=M+1 // 7602
A=A-1 // 7603
M=D // 7604
@51 // 7605
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
@SP // 7617
AM=M+1 // 7618
A=A-1 // 7619
M=0 // 7620
@SP // 7621
AM=M+1 // 7622
A=A-1 // 7623
M=0 // 7624
// call Output.create
@17 // 7625
D=A // 7626
@14 // 7627
M=D // 7628
@Output.create // 7629
D=A // 7630
@13 // 7631
M=D // 7632
@Output.initMap.ret.47 // 7633
D=A // 7634
@CALL // 7635
0;JMP // 7636
(Output.initMap.ret.47)
@SP // 7637
M=M-1 // 7638

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7639
D=A // 7640
@SP // 7641
AM=M+1 // 7642
A=A-1 // 7643
M=D // 7644
@51 // 7645
D=A // 7646
@SP // 7647
AM=M+1 // 7648
A=A-1 // 7649
M=D // 7650
@51 // 7651
D=A // 7652
@SP // 7653
AM=M+1 // 7654
A=A-1 // 7655
M=D // 7656
@55 // 7657
D=A // 7658
@SP // 7659
AM=M+1 // 7660
A=A-1 // 7661
M=D // 7662
@55 // 7663
D=A // 7664
@SP // 7665
AM=M+1 // 7666
A=A-1 // 7667
M=D // 7668
@63 // 7669
D=A // 7670
@SP // 7671
AM=M+1 // 7672
A=A-1 // 7673
M=D // 7674
@59 // 7675
D=A // 7676
@SP // 7677
AM=M+1 // 7678
A=A-1 // 7679
M=D // 7680
@59 // 7681
D=A // 7682
@SP // 7683
AM=M+1 // 7684
A=A-1 // 7685
M=D // 7686
@51 // 7687
D=A // 7688
@SP // 7689
AM=M+1 // 7690
A=A-1 // 7691
M=D // 7692
@51 // 7693
D=A // 7694
@SP // 7695
AM=M+1 // 7696
A=A-1 // 7697
M=D // 7698
@SP // 7699
AM=M+1 // 7700
A=A-1 // 7701
M=0 // 7702
@SP // 7703
AM=M+1 // 7704
A=A-1 // 7705
M=0 // 7706
// call Output.create
@17 // 7707
D=A // 7708
@14 // 7709
M=D // 7710
@Output.create // 7711
D=A // 7712
@13 // 7713
M=D // 7714
@Output.initMap.ret.48 // 7715
D=A // 7716
@CALL // 7717
0;JMP // 7718
(Output.initMap.ret.48)
@SP // 7719
M=M-1 // 7720

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7721
D=A // 7722
@SP // 7723
AM=M+1 // 7724
A=A-1 // 7725
M=D // 7726
@30 // 7727
D=A // 7728
@SP // 7729
AM=M+1 // 7730
A=A-1 // 7731
M=D // 7732
@51 // 7733
D=A // 7734
@SP // 7735
AM=M+1 // 7736
A=A-1 // 7737
M=D // 7738
@51 // 7739
D=A // 7740
@SP // 7741
AM=M+1 // 7742
A=A-1 // 7743
M=D // 7744
@51 // 7745
D=A // 7746
@SP // 7747
AM=M+1 // 7748
A=A-1 // 7749
M=D // 7750
@51 // 7751
D=A // 7752
@SP // 7753
AM=M+1 // 7754
A=A-1 // 7755
M=D // 7756
@51 // 7757
D=A // 7758
@SP // 7759
AM=M+1 // 7760
A=A-1 // 7761
M=D // 7762
@51 // 7763
D=A // 7764
@SP // 7765
AM=M+1 // 7766
A=A-1 // 7767
M=D // 7768
@51 // 7769
D=A // 7770
@SP // 7771
AM=M+1 // 7772
A=A-1 // 7773
M=D // 7774
@30 // 7775
D=A // 7776
@SP // 7777
AM=M+1 // 7778
A=A-1 // 7779
M=D // 7780
@SP // 7781
AM=M+1 // 7782
A=A-1 // 7783
M=0 // 7784
@SP // 7785
AM=M+1 // 7786
A=A-1 // 7787
M=0 // 7788
// call Output.create
@17 // 7789
D=A // 7790
@14 // 7791
M=D // 7792
@Output.create // 7793
D=A // 7794
@13 // 7795
M=D // 7796
@Output.initMap.ret.49 // 7797
D=A // 7798
@CALL // 7799
0;JMP // 7800
(Output.initMap.ret.49)
@SP // 7801
M=M-1 // 7802

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 7803
D=A // 7804
@SP // 7805
AM=M+1 // 7806
A=A-1 // 7807
M=D // 7808
@31 // 7809
D=A // 7810
@SP // 7811
AM=M+1 // 7812
A=A-1 // 7813
M=D // 7814
@51 // 7815
D=A // 7816
@SP // 7817
AM=M+1 // 7818
A=A-1 // 7819
M=D // 7820
@51 // 7821
D=A // 7822
@SP // 7823
AM=M+1 // 7824
A=A-1 // 7825
M=D // 7826
@51 // 7827
D=A // 7828
@SP // 7829
AM=M+1 // 7830
A=A-1 // 7831
M=D // 7832
@31 // 7833
D=A // 7834
@SP // 7835
AM=M+1 // 7836
A=A-1 // 7837
M=D // 7838
@3 // 7839
D=A // 7840
@SP // 7841
AM=M+1 // 7842
A=A-1 // 7843
M=D // 7844
@3 // 7845
D=A // 7846
@SP // 7847
AM=M+1 // 7848
A=A-1 // 7849
M=D // 7850
@3 // 7851
D=A // 7852
@SP // 7853
AM=M+1 // 7854
A=A-1 // 7855
M=D // 7856
@3 // 7857
D=A // 7858
@SP // 7859
AM=M+1 // 7860
A=A-1 // 7861
M=D // 7862
@SP // 7863
AM=M+1 // 7864
A=A-1 // 7865
M=0 // 7866
@SP // 7867
AM=M+1 // 7868
A=A-1 // 7869
M=0 // 7870
// call Output.create
@17 // 7871
D=A // 7872
@14 // 7873
M=D // 7874
@Output.create // 7875
D=A // 7876
@13 // 7877
M=D // 7878
@Output.initMap.ret.50 // 7879
D=A // 7880
@CALL // 7881
0;JMP // 7882
(Output.initMap.ret.50)
@SP // 7883
M=M-1 // 7884

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 7885
D=A // 7886
@SP // 7887
AM=M+1 // 7888
A=A-1 // 7889
M=D // 7890
@30 // 7891
D=A // 7892
@SP // 7893
AM=M+1 // 7894
A=A-1 // 7895
M=D // 7896
@51 // 7897
D=A // 7898
@SP // 7899
AM=M+1 // 7900
A=A-1 // 7901
M=D // 7902
@51 // 7903
D=A // 7904
@SP // 7905
AM=M+1 // 7906
A=A-1 // 7907
M=D // 7908
@51 // 7909
D=A // 7910
@SP // 7911
AM=M+1 // 7912
A=A-1 // 7913
M=D // 7914
@51 // 7915
D=A // 7916
@SP // 7917
AM=M+1 // 7918
A=A-1 // 7919
M=D // 7920
@51 // 7921
D=A // 7922
@SP // 7923
AM=M+1 // 7924
A=A-1 // 7925
M=D // 7926
@63 // 7927
D=A // 7928
@SP // 7929
AM=M+1 // 7930
A=A-1 // 7931
M=D // 7932
@59 // 7933
D=A // 7934
@SP // 7935
AM=M+1 // 7936
A=A-1 // 7937
M=D // 7938
@30 // 7939
D=A // 7940
@SP // 7941
AM=M+1 // 7942
A=A-1 // 7943
M=D // 7944
@48 // 7945
D=A // 7946
@SP // 7947
AM=M+1 // 7948
A=A-1 // 7949
M=D // 7950
@SP // 7951
AM=M+1 // 7952
A=A-1 // 7953
M=0 // 7954
// call Output.create
@17 // 7955
D=A // 7956
@14 // 7957
M=D // 7958
@Output.create // 7959
D=A // 7960
@13 // 7961
M=D // 7962
@Output.initMap.ret.51 // 7963
D=A // 7964
@CALL // 7965
0;JMP // 7966
(Output.initMap.ret.51)
@SP // 7967
M=M-1 // 7968

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 7969
D=A // 7970
@SP // 7971
AM=M+1 // 7972
A=A-1 // 7973
M=D // 7974
@31 // 7975
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
@31 // 7999
D=A // 8000
@SP // 8001
AM=M+1 // 8002
A=A-1 // 8003
M=D // 8004
@27 // 8005
D=A // 8006
@SP // 8007
AM=M+1 // 8008
A=A-1 // 8009
M=D // 8010
@51 // 8011
D=A // 8012
@SP // 8013
AM=M+1 // 8014
A=A-1 // 8015
M=D // 8016
@51 // 8017
D=A // 8018
@SP // 8019
AM=M+1 // 8020
A=A-1 // 8021
M=D // 8022
@51 // 8023
D=A // 8024
@SP // 8025
AM=M+1 // 8026
A=A-1 // 8027
M=D // 8028
@SP // 8029
AM=M+1 // 8030
A=A-1 // 8031
M=0 // 8032
@SP // 8033
AM=M+1 // 8034
A=A-1 // 8035
M=0 // 8036
// call Output.create
@17 // 8037
D=A // 8038
@14 // 8039
M=D // 8040
@Output.create // 8041
D=A // 8042
@13 // 8043
M=D // 8044
@Output.initMap.ret.52 // 8045
D=A // 8046
@CALL // 8047
0;JMP // 8048
(Output.initMap.ret.52)
@SP // 8049
M=M-1 // 8050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8051
D=A // 8052
@SP // 8053
AM=M+1 // 8054
A=A-1 // 8055
M=D // 8056
@30 // 8057
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
@51 // 8069
D=A // 8070
@SP // 8071
AM=M+1 // 8072
A=A-1 // 8073
M=D // 8074
@6 // 8075
D=A // 8076
@SP // 8077
AM=M+1 // 8078
A=A-1 // 8079
M=D // 8080
@28 // 8081
D=A // 8082
@SP // 8083
AM=M+1 // 8084
A=A-1 // 8085
M=D // 8086
@48 // 8087
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
@51 // 8099
D=A // 8100
@SP // 8101
AM=M+1 // 8102
A=A-1 // 8103
M=D // 8104
@30 // 8105
D=A // 8106
@SP // 8107
AM=M+1 // 8108
A=A-1 // 8109
M=D // 8110
@SP // 8111
AM=M+1 // 8112
A=A-1 // 8113
M=0 // 8114
@SP // 8115
AM=M+1 // 8116
A=A-1 // 8117
M=0 // 8118
// call Output.create
@17 // 8119
D=A // 8120
@14 // 8121
M=D // 8122
@Output.create // 8123
D=A // 8124
@13 // 8125
M=D // 8126
@Output.initMap.ret.53 // 8127
D=A // 8128
@CALL // 8129
0;JMP // 8130
(Output.initMap.ret.53)
@SP // 8131
M=M-1 // 8132

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8133
D=A // 8134
@SP // 8135
AM=M+1 // 8136
A=A-1 // 8137
M=D // 8138
@63 // 8139
D=A // 8140
@SP // 8141
AM=M+1 // 8142
A=A-1 // 8143
M=D // 8144
@63 // 8145
D=A // 8146
@SP // 8147
AM=M+1 // 8148
A=A-1 // 8149
M=D // 8150
@45 // 8151
D=A // 8152
@SP // 8153
AM=M+1 // 8154
A=A-1 // 8155
M=D // 8156
@12 // 8157
D=A // 8158
@SP // 8159
AM=M+1 // 8160
A=A-1 // 8161
M=D // 8162
@12 // 8163
D=A // 8164
@SP // 8165
AM=M+1 // 8166
A=A-1 // 8167
M=D // 8168
@12 // 8169
D=A // 8170
@SP // 8171
AM=M+1 // 8172
A=A-1 // 8173
M=D // 8174
@12 // 8175
D=A // 8176
@SP // 8177
AM=M+1 // 8178
A=A-1 // 8179
M=D // 8180
@12 // 8181
D=A // 8182
@SP // 8183
AM=M+1 // 8184
A=A-1 // 8185
M=D // 8186
@30 // 8187
D=A // 8188
@SP // 8189
AM=M+1 // 8190
A=A-1 // 8191
M=D // 8192
@SP // 8193
AM=M+1 // 8194
A=A-1 // 8195
M=0 // 8196
@SP // 8197
AM=M+1 // 8198
A=A-1 // 8199
M=0 // 8200
// call Output.create
@17 // 8201
D=A // 8202
@14 // 8203
M=D // 8204
@Output.create // 8205
D=A // 8206
@13 // 8207
M=D // 8208
@Output.initMap.ret.54 // 8209
D=A // 8210
@CALL // 8211
0;JMP // 8212
(Output.initMap.ret.54)
@SP // 8213
M=M-1 // 8214

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8215
D=A // 8216
@SP // 8217
AM=M+1 // 8218
A=A-1 // 8219
M=D // 8220
@51 // 8221
D=A // 8222
@SP // 8223
AM=M+1 // 8224
A=A-1 // 8225
M=D // 8226
@51 // 8227
D=A // 8228
@SP // 8229
AM=M+1 // 8230
A=A-1 // 8231
M=D // 8232
@51 // 8233
D=A // 8234
@SP // 8235
AM=M+1 // 8236
A=A-1 // 8237
M=D // 8238
@51 // 8239
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
@51 // 8257
D=A // 8258
@SP // 8259
AM=M+1 // 8260
A=A-1 // 8261
M=D // 8262
@51 // 8263
D=A // 8264
@SP // 8265
AM=M+1 // 8266
A=A-1 // 8267
M=D // 8268
@30 // 8269
D=A // 8270
@SP // 8271
AM=M+1 // 8272
A=A-1 // 8273
M=D // 8274
@SP // 8275
AM=M+1 // 8276
A=A-1 // 8277
M=0 // 8278
@SP // 8279
AM=M+1 // 8280
A=A-1 // 8281
M=0 // 8282
// call Output.create
@17 // 8283
D=A // 8284
@14 // 8285
M=D // 8286
@Output.create // 8287
D=A // 8288
@13 // 8289
M=D // 8290
@Output.initMap.ret.55 // 8291
D=A // 8292
@CALL // 8293
0;JMP // 8294
(Output.initMap.ret.55)
@SP // 8295
M=M-1 // 8296

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8297
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
@51 // 8321
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
@30 // 8333
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
@12 // 8345
D=A // 8346
@SP // 8347
AM=M+1 // 8348
A=A-1 // 8349
M=D // 8350
@12 // 8351
D=A // 8352
@SP // 8353
AM=M+1 // 8354
A=A-1 // 8355
M=D // 8356
@SP // 8357
AM=M+1 // 8358
A=A-1 // 8359
M=0 // 8360
@SP // 8361
AM=M+1 // 8362
A=A-1 // 8363
M=0 // 8364
// call Output.create
@17 // 8365
D=A // 8366
@14 // 8367
M=D // 8368
@Output.create // 8369
D=A // 8370
@13 // 8371
M=D // 8372
@Output.initMap.ret.56 // 8373
D=A // 8374
@CALL // 8375
0;JMP // 8376
(Output.initMap.ret.56)
@SP // 8377
M=M-1 // 8378

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8379
D=A // 8380
@SP // 8381
AM=M+1 // 8382
A=A-1 // 8383
M=D // 8384
@51 // 8385
D=A // 8386
@SP // 8387
AM=M+1 // 8388
A=A-1 // 8389
M=D // 8390
@51 // 8391
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
@51 // 8403
D=A // 8404
@SP // 8405
AM=M+1 // 8406
A=A-1 // 8407
M=D // 8408
@51 // 8409
D=A // 8410
@SP // 8411
AM=M+1 // 8412
A=A-1 // 8413
M=D // 8414
@63 // 8415
D=A // 8416
@SP // 8417
AM=M+1 // 8418
A=A-1 // 8419
M=D // 8420
@63 // 8421
D=A // 8422
@SP // 8423
AM=M+1 // 8424
A=A-1 // 8425
M=D // 8426
@63 // 8427
D=A // 8428
@SP // 8429
AM=M+1 // 8430
A=A-1 // 8431
M=D // 8432
@18 // 8433
D=A // 8434
@SP // 8435
AM=M+1 // 8436
A=A-1 // 8437
M=D // 8438
@SP // 8439
AM=M+1 // 8440
A=A-1 // 8441
M=0 // 8442
@SP // 8443
AM=M+1 // 8444
A=A-1 // 8445
M=0 // 8446
// call Output.create
@17 // 8447
D=A // 8448
@14 // 8449
M=D // 8450
@Output.create // 8451
D=A // 8452
@13 // 8453
M=D // 8454
@Output.initMap.ret.57 // 8455
D=A // 8456
@CALL // 8457
0;JMP // 8458
(Output.initMap.ret.57)
@SP // 8459
M=M-1 // 8460

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8461
D=A // 8462
@SP // 8463
AM=M+1 // 8464
A=A-1 // 8465
M=D // 8466
@51 // 8467
D=A // 8468
@SP // 8469
AM=M+1 // 8470
A=A-1 // 8471
M=D // 8472
@51 // 8473
D=A // 8474
@SP // 8475
AM=M+1 // 8476
A=A-1 // 8477
M=D // 8478
@30 // 8479
D=A // 8480
@SP // 8481
AM=M+1 // 8482
A=A-1 // 8483
M=D // 8484
@30 // 8485
D=A // 8486
@SP // 8487
AM=M+1 // 8488
A=A-1 // 8489
M=D // 8490
@12 // 8491
D=A // 8492
@SP // 8493
AM=M+1 // 8494
A=A-1 // 8495
M=D // 8496
@30 // 8497
D=A // 8498
@SP // 8499
AM=M+1 // 8500
A=A-1 // 8501
M=D // 8502
@30 // 8503
D=A // 8504
@SP // 8505
AM=M+1 // 8506
A=A-1 // 8507
M=D // 8508
@51 // 8509
D=A // 8510
@SP // 8511
AM=M+1 // 8512
A=A-1 // 8513
M=D // 8514
@51 // 8515
D=A // 8516
@SP // 8517
AM=M+1 // 8518
A=A-1 // 8519
M=D // 8520
@SP // 8521
AM=M+1 // 8522
A=A-1 // 8523
M=0 // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=0 // 8528
// call Output.create
@17 // 8529
D=A // 8530
@14 // 8531
M=D // 8532
@Output.create // 8533
D=A // 8534
@13 // 8535
M=D // 8536
@Output.initMap.ret.58 // 8537
D=A // 8538
@CALL // 8539
0;JMP // 8540
(Output.initMap.ret.58)
@SP // 8541
M=M-1 // 8542

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8543
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
@12 // 8579
D=A // 8580
@SP // 8581
AM=M+1 // 8582
A=A-1 // 8583
M=D // 8584
@12 // 8585
D=A // 8586
@SP // 8587
AM=M+1 // 8588
A=A-1 // 8589
M=D // 8590
@12 // 8591
D=A // 8592
@SP // 8593
AM=M+1 // 8594
A=A-1 // 8595
M=D // 8596
@30 // 8597
D=A // 8598
@SP // 8599
AM=M+1 // 8600
A=A-1 // 8601
M=D // 8602
@SP // 8603
AM=M+1 // 8604
A=A-1 // 8605
M=0 // 8606
@SP // 8607
AM=M+1 // 8608
A=A-1 // 8609
M=0 // 8610
// call Output.create
@17 // 8611
D=A // 8612
@14 // 8613
M=D // 8614
@Output.create // 8615
D=A // 8616
@13 // 8617
M=D // 8618
@Output.initMap.ret.59 // 8619
D=A // 8620
@CALL // 8621
0;JMP // 8622
(Output.initMap.ret.59)
@SP // 8623
M=M-1 // 8624

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8625
D=A // 8626
@SP // 8627
AM=M+1 // 8628
A=A-1 // 8629
M=D // 8630
@63 // 8631
D=A // 8632
@SP // 8633
AM=M+1 // 8634
A=A-1 // 8635
M=D // 8636
@51 // 8637
D=A // 8638
@SP // 8639
AM=M+1 // 8640
A=A-1 // 8641
M=D // 8642
@49 // 8643
D=A // 8644
@SP // 8645
AM=M+1 // 8646
A=A-1 // 8647
M=D // 8648
@24 // 8649
D=A // 8650
@SP // 8651
AM=M+1 // 8652
A=A-1 // 8653
M=D // 8654
@12 // 8655
D=A // 8656
@SP // 8657
AM=M+1 // 8658
A=A-1 // 8659
M=D // 8660
@6 // 8661
D=A // 8662
@SP // 8663
AM=M+1 // 8664
A=A-1 // 8665
M=D // 8666
@35 // 8667
D=A // 8668
@SP // 8669
AM=M+1 // 8670
A=A-1 // 8671
M=D // 8672
@51 // 8673
D=A // 8674
@SP // 8675
AM=M+1 // 8676
A=A-1 // 8677
M=D // 8678
@63 // 8679
D=A // 8680
@SP // 8681
AM=M+1 // 8682
A=A-1 // 8683
M=D // 8684
@SP // 8685
AM=M+1 // 8686
A=A-1 // 8687
M=0 // 8688
@SP // 8689
AM=M+1 // 8690
A=A-1 // 8691
M=0 // 8692
// call Output.create
@17 // 8693
D=A // 8694
@14 // 8695
M=D // 8696
@Output.create // 8697
D=A // 8698
@13 // 8699
M=D // 8700
@Output.initMap.ret.60 // 8701
D=A // 8702
@CALL // 8703
0;JMP // 8704
(Output.initMap.ret.60)
@SP // 8705
M=M-1 // 8706

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8707
D=A // 8708
@SP // 8709
AM=M+1 // 8710
A=A-1 // 8711
M=D // 8712
@30 // 8713
D=A // 8714
@SP // 8715
AM=M+1 // 8716
A=A-1 // 8717
M=D // 8718
@6 // 8719
D=A // 8720
@SP // 8721
AM=M+1 // 8722
A=A-1 // 8723
M=D // 8724
@6 // 8725
D=A // 8726
@SP // 8727
AM=M+1 // 8728
A=A-1 // 8729
M=D // 8730
@6 // 8731
D=A // 8732
@SP // 8733
AM=M+1 // 8734
A=A-1 // 8735
M=D // 8736
@6 // 8737
D=A // 8738
@SP // 8739
AM=M+1 // 8740
A=A-1 // 8741
M=D // 8742
@6 // 8743
D=A // 8744
@SP // 8745
AM=M+1 // 8746
A=A-1 // 8747
M=D // 8748
@6 // 8749
D=A // 8750
@SP // 8751
AM=M+1 // 8752
A=A-1 // 8753
M=D // 8754
@6 // 8755
D=A // 8756
@SP // 8757
AM=M+1 // 8758
A=A-1 // 8759
M=D // 8760
@30 // 8761
D=A // 8762
@SP // 8763
AM=M+1 // 8764
A=A-1 // 8765
M=D // 8766
@SP // 8767
AM=M+1 // 8768
A=A-1 // 8769
M=0 // 8770
@SP // 8771
AM=M+1 // 8772
A=A-1 // 8773
M=0 // 8774
// call Output.create
@17 // 8775
D=A // 8776
@14 // 8777
M=D // 8778
@Output.create // 8779
D=A // 8780
@13 // 8781
M=D // 8782
@Output.initMap.ret.61 // 8783
D=A // 8784
@CALL // 8785
0;JMP // 8786
(Output.initMap.ret.61)
@SP // 8787
M=M-1 // 8788

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8789
D=A // 8790
@SP // 8791
M=D+M // 8792
@92 // 8793
D=A // 8794
@SP // 8795
A=M-1 // 8796
M=1 // 8797
A=A-1 // 8798
M=0 // 8799
A=A-1 // 8800
M=0 // 8801
A=A-1 // 8802
M=D // 8803
A=A-1 // 8804
@3 // 8805
D=A // 8806
@SP // 8807
AM=M+1 // 8808
A=A-1 // 8809
M=D // 8810
@6 // 8811
D=A // 8812
@SP // 8813
AM=M+1 // 8814
A=A-1 // 8815
M=D // 8816
@12 // 8817
D=A // 8818
@SP // 8819
AM=M+1 // 8820
A=A-1 // 8821
M=D // 8822
@24 // 8823
D=A // 8824
@SP // 8825
AM=M+1 // 8826
A=A-1 // 8827
M=D // 8828
@48 // 8829
D=A // 8830
@SP // 8831
AM=M+1 // 8832
A=A-1 // 8833
M=D // 8834
@32 // 8835
D=A // 8836
@SP // 8837
AM=M+1 // 8838
A=A-1 // 8839
M=D // 8840
@SP // 8841
AM=M+1 // 8842
A=A-1 // 8843
M=0 // 8844
@SP // 8845
AM=M+1 // 8846
A=A-1 // 8847
M=0 // 8848
// call Output.create
@17 // 8849
D=A // 8850
@14 // 8851
M=D // 8852
@Output.create // 8853
D=A // 8854
@13 // 8855
M=D // 8856
@Output.initMap.ret.62 // 8857
D=A // 8858
@CALL // 8859
0;JMP // 8860
(Output.initMap.ret.62)
@SP // 8861
M=M-1 // 8862

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 8863
D=A // 8864
@SP // 8865
AM=M+1 // 8866
A=A-1 // 8867
M=D // 8868
@30 // 8869
D=A // 8870
@SP // 8871
AM=M+1 // 8872
A=A-1 // 8873
M=D // 8874
@24 // 8875
D=A // 8876
@SP // 8877
AM=M+1 // 8878
A=A-1 // 8879
M=D // 8880
@24 // 8881
D=A // 8882
@SP // 8883
AM=M+1 // 8884
A=A-1 // 8885
M=D // 8886
@24 // 8887
D=A // 8888
@SP // 8889
AM=M+1 // 8890
A=A-1 // 8891
M=D // 8892
@24 // 8893
D=A // 8894
@SP // 8895
AM=M+1 // 8896
A=A-1 // 8897
M=D // 8898
@24 // 8899
D=A // 8900
@SP // 8901
AM=M+1 // 8902
A=A-1 // 8903
M=D // 8904
@24 // 8905
D=A // 8906
@SP // 8907
AM=M+1 // 8908
A=A-1 // 8909
M=D // 8910
@24 // 8911
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
@SP // 8923
AM=M+1 // 8924
A=A-1 // 8925
M=0 // 8926
@SP // 8927
AM=M+1 // 8928
A=A-1 // 8929
M=0 // 8930
// call Output.create
@17 // 8931
D=A // 8932
@14 // 8933
M=D // 8934
@Output.create // 8935
D=A // 8936
@13 // 8937
M=D // 8938
@Output.initMap.ret.63 // 8939
D=A // 8940
@CALL // 8941
0;JMP // 8942
(Output.initMap.ret.63)
@SP // 8943
M=M-1 // 8944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 8945
D=A // 8946
@SP // 8947
AM=M+1 // 8948
A=A-1 // 8949
M=D // 8950
@8 // 8951
D=A // 8952
@SP // 8953
AM=M+1 // 8954
A=A-1 // 8955
M=D // 8956
@28 // 8957
D=A // 8958
@SP // 8959
AM=M+1 // 8960
A=A-1 // 8961
M=D // 8962
@54 // 8963
D=A // 8964
@SP // 8965
AM=M+1 // 8966
A=A-1 // 8967
M=D // 8968
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=0 // 8972
@SP // 8973
AM=M+1 // 8974
A=A-1 // 8975
M=0 // 8976
@SP // 8977
AM=M+1 // 8978
A=A-1 // 8979
M=0 // 8980
@SP // 8981
AM=M+1 // 8982
A=A-1 // 8983
M=0 // 8984
@SP // 8985
AM=M+1 // 8986
A=A-1 // 8987
M=0 // 8988
@SP // 8989
AM=M+1 // 8990
A=A-1 // 8991
M=0 // 8992
@SP // 8993
AM=M+1 // 8994
A=A-1 // 8995
M=0 // 8996
@SP // 8997
AM=M+1 // 8998
A=A-1 // 8999
M=0 // 9000
// call Output.create
@17 // 9001
D=A // 9002
@14 // 9003
M=D // 9004
@Output.create // 9005
D=A // 9006
@13 // 9007
M=D // 9008
@Output.initMap.ret.64 // 9009
D=A // 9010
@CALL // 9011
0;JMP // 9012
(Output.initMap.ret.64)
@SP // 9013
M=M-1 // 9014

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9015
D=A // 9016
@SP // 9017
M=D+M // 9018
@95 // 9019
D=A // 9020
@SP // 9021
A=M-1 // 9022
M=0 // 9023
A=A-1 // 9024
M=0 // 9025
A=A-1 // 9026
M=0 // 9027
A=A-1 // 9028
M=0 // 9029
A=A-1 // 9030
M=0 // 9031
A=A-1 // 9032
M=0 // 9033
A=A-1 // 9034
M=0 // 9035
A=A-1 // 9036
M=0 // 9037
A=A-1 // 9038
M=0 // 9039
A=A-1 // 9040
M=D // 9041
A=A-1 // 9042
@2 // 9043
D=A // 9044
@SP // 9045
M=D+M // 9046
@63 // 9047
D=A // 9048
@SP // 9049
A=M-1 // 9050
M=0 // 9051
A=A-1 // 9052
M=D // 9053
A=A-1 // 9054
// call Output.create
@17 // 9055
D=A // 9056
@14 // 9057
M=D // 9058
@Output.create // 9059
D=A // 9060
@13 // 9061
M=D // 9062
@Output.initMap.ret.65 // 9063
D=A // 9064
@CALL // 9065
0;JMP // 9066
(Output.initMap.ret.65)
@SP // 9067
M=M-1 // 9068

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9069
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
@12 // 9081
D=A // 9082
@SP // 9083
AM=M+1 // 9084
A=A-1 // 9085
M=D // 9086
@24 // 9087
D=A // 9088
@SP // 9089
AM=M+1 // 9090
A=A-1 // 9091
M=D // 9092
@SP // 9093
AM=M+1 // 9094
A=A-1 // 9095
M=0 // 9096
@SP // 9097
AM=M+1 // 9098
A=A-1 // 9099
M=0 // 9100
@SP // 9101
AM=M+1 // 9102
A=A-1 // 9103
M=0 // 9104
@SP // 9105
AM=M+1 // 9106
A=A-1 // 9107
M=0 // 9108
@SP // 9109
AM=M+1 // 9110
A=A-1 // 9111
M=0 // 9112
@SP // 9113
AM=M+1 // 9114
A=A-1 // 9115
M=0 // 9116
@SP // 9117
AM=M+1 // 9118
A=A-1 // 9119
M=0 // 9120
@SP // 9121
AM=M+1 // 9122
A=A-1 // 9123
M=0 // 9124
// call Output.create
@17 // 9125
D=A // 9126
@14 // 9127
M=D // 9128
@Output.create // 9129
D=A // 9130
@13 // 9131
M=D // 9132
@Output.initMap.ret.66 // 9133
D=A // 9134
@CALL // 9135
0;JMP // 9136
(Output.initMap.ret.66)
@SP // 9137
M=M-1 // 9138

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9139
D=A // 9140
@SP // 9141
M=D+M // 9142
@97 // 9143
D=A // 9144
@SP // 9145
A=M-1 // 9146
M=0 // 9147
A=A-1 // 9148
M=0 // 9149
A=A-1 // 9150
M=0 // 9151
A=A-1 // 9152
M=D // 9153
A=A-1 // 9154
@14 // 9155
D=A // 9156
@SP // 9157
AM=M+1 // 9158
A=A-1 // 9159
M=D // 9160
@24 // 9161
D=A // 9162
@SP // 9163
AM=M+1 // 9164
A=A-1 // 9165
M=D // 9166
@30 // 9167
D=A // 9168
@SP // 9169
AM=M+1 // 9170
A=A-1 // 9171
M=D // 9172
@27 // 9173
D=A // 9174
@SP // 9175
AM=M+1 // 9176
A=A-1 // 9177
M=D // 9178
@27 // 9179
D=A // 9180
@SP // 9181
AM=M+1 // 9182
A=A-1 // 9183
M=D // 9184
@54 // 9185
D=A // 9186
@SP // 9187
AM=M+1 // 9188
A=A-1 // 9189
M=D // 9190
@SP // 9191
AM=M+1 // 9192
A=A-1 // 9193
M=0 // 9194
@SP // 9195
AM=M+1 // 9196
A=A-1 // 9197
M=0 // 9198
// call Output.create
@17 // 9199
D=A // 9200
@14 // 9201
M=D // 9202
@Output.create // 9203
D=A // 9204
@13 // 9205
M=D // 9206
@Output.initMap.ret.67 // 9207
D=A // 9208
@CALL // 9209
0;JMP // 9210
(Output.initMap.ret.67)
@SP // 9211
M=M-1 // 9212

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9213
D=A // 9214
@SP // 9215
AM=M+1 // 9216
A=A-1 // 9217
M=D // 9218
@3 // 9219
D=A // 9220
@SP // 9221
AM=M+1 // 9222
A=A-1 // 9223
M=D // 9224
@3 // 9225
D=A // 9226
@SP // 9227
AM=M+1 // 9228
A=A-1 // 9229
M=D // 9230
@3 // 9231
D=A // 9232
@SP // 9233
AM=M+1 // 9234
A=A-1 // 9235
M=D // 9236
@15 // 9237
D=A // 9238
@SP // 9239
AM=M+1 // 9240
A=A-1 // 9241
M=D // 9242
@27 // 9243
D=A // 9244
@SP // 9245
AM=M+1 // 9246
A=A-1 // 9247
M=D // 9248
@51 // 9249
D=A // 9250
@SP // 9251
AM=M+1 // 9252
A=A-1 // 9253
M=D // 9254
@51 // 9255
D=A // 9256
@SP // 9257
AM=M+1 // 9258
A=A-1 // 9259
M=D // 9260
@51 // 9261
D=A // 9262
@SP // 9263
AM=M+1 // 9264
A=A-1 // 9265
M=D // 9266
@30 // 9267
D=A // 9268
@SP // 9269
AM=M+1 // 9270
A=A-1 // 9271
M=D // 9272
@SP // 9273
AM=M+1 // 9274
A=A-1 // 9275
M=0 // 9276
@SP // 9277
AM=M+1 // 9278
A=A-1 // 9279
M=0 // 9280
// call Output.create
@17 // 9281
D=A // 9282
@14 // 9283
M=D // 9284
@Output.create // 9285
D=A // 9286
@13 // 9287
M=D // 9288
@Output.initMap.ret.68 // 9289
D=A // 9290
@CALL // 9291
0;JMP // 9292
(Output.initMap.ret.68)
@SP // 9293
M=M-1 // 9294

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9295
D=A // 9296
@SP // 9297
M=D+M // 9298
@99 // 9299
D=A // 9300
@SP // 9301
A=M-1 // 9302
M=0 // 9303
A=A-1 // 9304
M=0 // 9305
A=A-1 // 9306
M=0 // 9307
A=A-1 // 9308
M=D // 9309
A=A-1 // 9310
@30 // 9311
D=A // 9312
@SP // 9313
AM=M+1 // 9314
A=A-1 // 9315
M=D // 9316
@51 // 9317
D=A // 9318
@SP // 9319
AM=M+1 // 9320
A=A-1 // 9321
M=D // 9322
@3 // 9323
D=A // 9324
@SP // 9325
AM=M+1 // 9326
A=A-1 // 9327
M=D // 9328
@3 // 9329
D=A // 9330
@SP // 9331
AM=M+1 // 9332
A=A-1 // 9333
M=D // 9334
@51 // 9335
D=A // 9336
@SP // 9337
AM=M+1 // 9338
A=A-1 // 9339
M=D // 9340
@30 // 9341
D=A // 9342
@SP // 9343
AM=M+1 // 9344
A=A-1 // 9345
M=D // 9346
@SP // 9347
AM=M+1 // 9348
A=A-1 // 9349
M=0 // 9350
@SP // 9351
AM=M+1 // 9352
A=A-1 // 9353
M=0 // 9354
// call Output.create
@17 // 9355
D=A // 9356
@14 // 9357
M=D // 9358
@Output.create // 9359
D=A // 9360
@13 // 9361
M=D // 9362
@Output.initMap.ret.69 // 9363
D=A // 9364
@CALL // 9365
0;JMP // 9366
(Output.initMap.ret.69)
@SP // 9367
M=M-1 // 9368

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9369
D=A // 9370
@SP // 9371
AM=M+1 // 9372
A=A-1 // 9373
M=D // 9374
@48 // 9375
D=A // 9376
@SP // 9377
AM=M+1 // 9378
A=A-1 // 9379
M=D // 9380
@48 // 9381
D=A // 9382
@SP // 9383
AM=M+1 // 9384
A=A-1 // 9385
M=D // 9386
@48 // 9387
D=A // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=D // 9392
@60 // 9393
D=A // 9394
@SP // 9395
AM=M+1 // 9396
A=A-1 // 9397
M=D // 9398
@54 // 9399
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
@51 // 9411
D=A // 9412
@SP // 9413
AM=M+1 // 9414
A=A-1 // 9415
M=D // 9416
@51 // 9417
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
@SP // 9429
AM=M+1 // 9430
A=A-1 // 9431
M=0 // 9432
@SP // 9433
AM=M+1 // 9434
A=A-1 // 9435
M=0 // 9436
// call Output.create
@17 // 9437
D=A // 9438
@14 // 9439
M=D // 9440
@Output.create // 9441
D=A // 9442
@13 // 9443
M=D // 9444
@Output.initMap.ret.70 // 9445
D=A // 9446
@CALL // 9447
0;JMP // 9448
(Output.initMap.ret.70)
@SP // 9449
M=M-1 // 9450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9451
D=A // 9452
@SP // 9453
M=D+M // 9454
@101 // 9455
D=A // 9456
@SP // 9457
A=M-1 // 9458
M=0 // 9459
A=A-1 // 9460
M=0 // 9461
A=A-1 // 9462
M=0 // 9463
A=A-1 // 9464
M=D // 9465
A=A-1 // 9466
@30 // 9467
D=A // 9468
@SP // 9469
AM=M+1 // 9470
A=A-1 // 9471
M=D // 9472
@51 // 9473
D=A // 9474
@SP // 9475
AM=M+1 // 9476
A=A-1 // 9477
M=D // 9478
@63 // 9479
D=A // 9480
@SP // 9481
AM=M+1 // 9482
A=A-1 // 9483
M=D // 9484
@3 // 9485
D=A // 9486
@SP // 9487
AM=M+1 // 9488
A=A-1 // 9489
M=D // 9490
@51 // 9491
D=A // 9492
@SP // 9493
AM=M+1 // 9494
A=A-1 // 9495
M=D // 9496
@30 // 9497
D=A // 9498
@SP // 9499
AM=M+1 // 9500
A=A-1 // 9501
M=D // 9502
@SP // 9503
AM=M+1 // 9504
A=A-1 // 9505
M=0 // 9506
@SP // 9507
AM=M+1 // 9508
A=A-1 // 9509
M=0 // 9510
// call Output.create
@17 // 9511
D=A // 9512
@14 // 9513
M=D // 9514
@Output.create // 9515
D=A // 9516
@13 // 9517
M=D // 9518
@Output.initMap.ret.71 // 9519
D=A // 9520
@CALL // 9521
0;JMP // 9522
(Output.initMap.ret.71)
@SP // 9523
M=M-1 // 9524

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9525
D=A // 9526
@SP // 9527
AM=M+1 // 9528
A=A-1 // 9529
M=D // 9530
@28 // 9531
D=A // 9532
@SP // 9533
AM=M+1 // 9534
A=A-1 // 9535
M=D // 9536
@54 // 9537
D=A // 9538
@SP // 9539
AM=M+1 // 9540
A=A-1 // 9541
M=D // 9542
@38 // 9543
D=A // 9544
@SP // 9545
AM=M+1 // 9546
A=A-1 // 9547
M=D // 9548
@6 // 9549
D=A // 9550
@SP // 9551
AM=M+1 // 9552
A=A-1 // 9553
M=D // 9554
@15 // 9555
D=A // 9556
@SP // 9557
AM=M+1 // 9558
A=A-1 // 9559
M=D // 9560
@6 // 9561
D=A // 9562
@SP // 9563
AM=M+1 // 9564
A=A-1 // 9565
M=D // 9566
@6 // 9567
D=A // 9568
@SP // 9569
AM=M+1 // 9570
A=A-1 // 9571
M=D // 9572
@6 // 9573
D=A // 9574
@SP // 9575
AM=M+1 // 9576
A=A-1 // 9577
M=D // 9578
@15 // 9579
D=A // 9580
@SP // 9581
AM=M+1 // 9582
A=A-1 // 9583
M=D // 9584
@SP // 9585
AM=M+1 // 9586
A=A-1 // 9587
M=0 // 9588
@SP // 9589
AM=M+1 // 9590
A=A-1 // 9591
M=0 // 9592
// call Output.create
@17 // 9593
D=A // 9594
@14 // 9595
M=D // 9596
@Output.create // 9597
D=A // 9598
@13 // 9599
M=D // 9600
@Output.initMap.ret.72 // 9601
D=A // 9602
@CALL // 9603
0;JMP // 9604
(Output.initMap.ret.72)
@SP // 9605
M=M-1 // 9606

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9607
D=A // 9608
@SP // 9609
M=D+M // 9610
@103 // 9611
D=A // 9612
@SP // 9613
A=M-1 // 9614
M=0 // 9615
A=A-1 // 9616
M=0 // 9617
A=A-1 // 9618
M=D // 9619
A=A-1 // 9620
@30 // 9621
D=A // 9622
@SP // 9623
AM=M+1 // 9624
A=A-1 // 9625
M=D // 9626
@51 // 9627
D=A // 9628
@SP // 9629
AM=M+1 // 9630
A=A-1 // 9631
M=D // 9632
@51 // 9633
D=A // 9634
@SP // 9635
AM=M+1 // 9636
A=A-1 // 9637
M=D // 9638
@51 // 9639
D=A // 9640
@SP // 9641
AM=M+1 // 9642
A=A-1 // 9643
M=D // 9644
@62 // 9645
D=A // 9646
@SP // 9647
AM=M+1 // 9648
A=A-1 // 9649
M=D // 9650
@48 // 9651
D=A // 9652
@SP // 9653
AM=M+1 // 9654
A=A-1 // 9655
M=D // 9656
@51 // 9657
D=A // 9658
@SP // 9659
AM=M+1 // 9660
A=A-1 // 9661
M=D // 9662
@30 // 9663
D=A // 9664
@SP // 9665
AM=M+1 // 9666
A=A-1 // 9667
M=D // 9668
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
@Output.initMap.ret.73 // 9681
D=A // 9682
@CALL // 9683
0;JMP // 9684
(Output.initMap.ret.73)
@SP // 9685
M=M-1 // 9686

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9687
D=A // 9688
@SP // 9689
AM=M+1 // 9690
A=A-1 // 9691
M=D // 9692
@3 // 9693
D=A // 9694
@SP // 9695
AM=M+1 // 9696
A=A-1 // 9697
M=D // 9698
@3 // 9699
D=A // 9700
@SP // 9701
AM=M+1 // 9702
A=A-1 // 9703
M=D // 9704
@3 // 9705
D=A // 9706
@SP // 9707
AM=M+1 // 9708
A=A-1 // 9709
M=D // 9710
@27 // 9711
D=A // 9712
@SP // 9713
AM=M+1 // 9714
A=A-1 // 9715
M=D // 9716
@55 // 9717
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
@Output.initMap.ret.74 // 9763
D=A // 9764
@CALL // 9765
0;JMP // 9766
(Output.initMap.ret.74)
@SP // 9767
M=M-1 // 9768

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9769
D=A // 9770
@SP // 9771
AM=M+1 // 9772
A=A-1 // 9773
M=D // 9774
@12 // 9775
D=A // 9776
@SP // 9777
AM=M+1 // 9778
A=A-1 // 9779
M=D // 9780
@12 // 9781
D=A // 9782
@SP // 9783
AM=M+1 // 9784
A=A-1 // 9785
M=D // 9786
@SP // 9787
AM=M+1 // 9788
A=A-1 // 9789
M=0 // 9790
@14 // 9791
D=A // 9792
@SP // 9793
AM=M+1 // 9794
A=A-1 // 9795
M=D // 9796
@12 // 9797
D=A // 9798
@SP // 9799
AM=M+1 // 9800
A=A-1 // 9801
M=D // 9802
@12 // 9803
D=A // 9804
@SP // 9805
AM=M+1 // 9806
A=A-1 // 9807
M=D // 9808
@12 // 9809
D=A // 9810
@SP // 9811
AM=M+1 // 9812
A=A-1 // 9813
M=D // 9814
@12 // 9815
D=A // 9816
@SP // 9817
AM=M+1 // 9818
A=A-1 // 9819
M=D // 9820
@30 // 9821
D=A // 9822
@SP // 9823
AM=M+1 // 9824
A=A-1 // 9825
M=D // 9826
@SP // 9827
AM=M+1 // 9828
A=A-1 // 9829
M=0 // 9830
@SP // 9831
AM=M+1 // 9832
A=A-1 // 9833
M=0 // 9834
// call Output.create
@17 // 9835
D=A // 9836
@14 // 9837
M=D // 9838
@Output.create // 9839
D=A // 9840
@13 // 9841
M=D // 9842
@Output.initMap.ret.75 // 9843
D=A // 9844
@CALL // 9845
0;JMP // 9846
(Output.initMap.ret.75)
@SP // 9847
M=M-1 // 9848

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 9849
D=A // 9850
@SP // 9851
AM=M+1 // 9852
A=A-1 // 9853
M=D // 9854
@48 // 9855
D=A // 9856
@SP // 9857
AM=M+1 // 9858
A=A-1 // 9859
M=D // 9860
@48 // 9861
D=A // 9862
@SP // 9863
AM=M+1 // 9864
A=A-1 // 9865
M=D // 9866
@SP // 9867
AM=M+1 // 9868
A=A-1 // 9869
M=0 // 9870
@56 // 9871
D=A // 9872
@SP // 9873
AM=M+1 // 9874
A=A-1 // 9875
M=D // 9876
@48 // 9877
D=A // 9878
@SP // 9879
AM=M+1 // 9880
A=A-1 // 9881
M=D // 9882
@48 // 9883
D=A // 9884
@SP // 9885
AM=M+1 // 9886
A=A-1 // 9887
M=D // 9888
@48 // 9889
D=A // 9890
@SP // 9891
AM=M+1 // 9892
A=A-1 // 9893
M=D // 9894
@48 // 9895
D=A // 9896
@SP // 9897
AM=M+1 // 9898
A=A-1 // 9899
M=D // 9900
@51 // 9901
D=A // 9902
@SP // 9903
AM=M+1 // 9904
A=A-1 // 9905
M=D // 9906
@30 // 9907
D=A // 9908
@SP // 9909
AM=M+1 // 9910
A=A-1 // 9911
M=D // 9912
@SP // 9913
AM=M+1 // 9914
A=A-1 // 9915
M=0 // 9916
// call Output.create
@17 // 9917
D=A // 9918
@14 // 9919
M=D // 9920
@Output.create // 9921
D=A // 9922
@13 // 9923
M=D // 9924
@Output.initMap.ret.76 // 9925
D=A // 9926
@CALL // 9927
0;JMP // 9928
(Output.initMap.ret.76)
@SP // 9929
M=M-1 // 9930

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 9931
D=A // 9932
@SP // 9933
AM=M+1 // 9934
A=A-1 // 9935
M=D // 9936
@3 // 9937
D=A // 9938
@SP // 9939
AM=M+1 // 9940
A=A-1 // 9941
M=D // 9942
@3 // 9943
D=A // 9944
@SP // 9945
AM=M+1 // 9946
A=A-1 // 9947
M=D // 9948
@3 // 9949
D=A // 9950
@SP // 9951
AM=M+1 // 9952
A=A-1 // 9953
M=D // 9954
@51 // 9955
D=A // 9956
@SP // 9957
AM=M+1 // 9958
A=A-1 // 9959
M=D // 9960
@27 // 9961
D=A // 9962
@SP // 9963
AM=M+1 // 9964
A=A-1 // 9965
M=D // 9966
@15 // 9967
D=A // 9968
@SP // 9969
AM=M+1 // 9970
A=A-1 // 9971
M=D // 9972
@15 // 9973
D=A // 9974
@SP // 9975
AM=M+1 // 9976
A=A-1 // 9977
M=D // 9978
@27 // 9979
D=A // 9980
@SP // 9981
AM=M+1 // 9982
A=A-1 // 9983
M=D // 9984
@51 // 9985
D=A // 9986
@SP // 9987
AM=M+1 // 9988
A=A-1 // 9989
M=D // 9990
@SP // 9991
AM=M+1 // 9992
A=A-1 // 9993
M=0 // 9994
@SP // 9995
AM=M+1 // 9996
A=A-1 // 9997
M=0 // 9998
// call Output.create
@17 // 9999
D=A // 10000
@14 // 10001
M=D // 10002
@Output.create // 10003
D=A // 10004
@13 // 10005
M=D // 10006
@Output.initMap.ret.77 // 10007
D=A // 10008
@CALL // 10009
0;JMP // 10010
(Output.initMap.ret.77)
@SP // 10011
M=M-1 // 10012

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10013
D=A // 10014
@SP // 10015
AM=M+1 // 10016
A=A-1 // 10017
M=D // 10018
@14 // 10019
D=A // 10020
@SP // 10021
AM=M+1 // 10022
A=A-1 // 10023
M=D // 10024
@12 // 10025
D=A // 10026
@SP // 10027
AM=M+1 // 10028
A=A-1 // 10029
M=D // 10030
@12 // 10031
D=A // 10032
@SP // 10033
AM=M+1 // 10034
A=A-1 // 10035
M=D // 10036
@12 // 10037
D=A // 10038
@SP // 10039
AM=M+1 // 10040
A=A-1 // 10041
M=D // 10042
@12 // 10043
D=A // 10044
@SP // 10045
AM=M+1 // 10046
A=A-1 // 10047
M=D // 10048
@12 // 10049
D=A // 10050
@SP // 10051
AM=M+1 // 10052
A=A-1 // 10053
M=D // 10054
@12 // 10055
D=A // 10056
@SP // 10057
AM=M+1 // 10058
A=A-1 // 10059
M=D // 10060
@12 // 10061
D=A // 10062
@SP // 10063
AM=M+1 // 10064
A=A-1 // 10065
M=D // 10066
@30 // 10067
D=A // 10068
@SP // 10069
AM=M+1 // 10070
A=A-1 // 10071
M=D // 10072
@SP // 10073
AM=M+1 // 10074
A=A-1 // 10075
M=0 // 10076
@SP // 10077
AM=M+1 // 10078
A=A-1 // 10079
M=0 // 10080
// call Output.create
@17 // 10081
D=A // 10082
@14 // 10083
M=D // 10084
@Output.create // 10085
D=A // 10086
@13 // 10087
M=D // 10088
@Output.initMap.ret.78 // 10089
D=A // 10090
@CALL // 10091
0;JMP // 10092
(Output.initMap.ret.78)
@SP // 10093
M=M-1 // 10094

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10095
D=A // 10096
@SP // 10097
M=D+M // 10098
@109 // 10099
D=A // 10100
@SP // 10101
A=M-1 // 10102
M=0 // 10103
A=A-1 // 10104
M=0 // 10105
A=A-1 // 10106
M=0 // 10107
A=A-1 // 10108
M=D // 10109
A=A-1 // 10110
@29 // 10111
D=A // 10112
@SP // 10113
AM=M+1 // 10114
A=A-1 // 10115
M=D // 10116
@63 // 10117
D=A // 10118
@SP // 10119
AM=M+1 // 10120
A=A-1 // 10121
M=D // 10122
@43 // 10123
D=A // 10124
@SP // 10125
AM=M+1 // 10126
A=A-1 // 10127
M=D // 10128
@43 // 10129
D=A // 10130
@SP // 10131
AM=M+1 // 10132
A=A-1 // 10133
M=D // 10134
@43 // 10135
D=A // 10136
@SP // 10137
AM=M+1 // 10138
A=A-1 // 10139
M=D // 10140
@43 // 10141
D=A // 10142
@SP // 10143
AM=M+1 // 10144
A=A-1 // 10145
M=D // 10146
@SP // 10147
AM=M+1 // 10148
A=A-1 // 10149
M=0 // 10150
@SP // 10151
AM=M+1 // 10152
A=A-1 // 10153
M=0 // 10154
// call Output.create
@17 // 10155
D=A // 10156
@14 // 10157
M=D // 10158
@Output.create // 10159
D=A // 10160
@13 // 10161
M=D // 10162
@Output.initMap.ret.79 // 10163
D=A // 10164
@CALL // 10165
0;JMP // 10166
(Output.initMap.ret.79)
@SP // 10167
M=M-1 // 10168

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10169
D=A // 10170
@SP // 10171
M=D+M // 10172
@110 // 10173
D=A // 10174
@SP // 10175
A=M-1 // 10176
M=0 // 10177
A=A-1 // 10178
M=0 // 10179
A=A-1 // 10180
M=0 // 10181
A=A-1 // 10182
M=D // 10183
A=A-1 // 10184
@29 // 10185
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
@51 // 10209
D=A // 10210
@SP // 10211
AM=M+1 // 10212
A=A-1 // 10213
M=D // 10214
@51 // 10215
D=A // 10216
@SP // 10217
AM=M+1 // 10218
A=A-1 // 10219
M=D // 10220
@SP // 10221
AM=M+1 // 10222
A=A-1 // 10223
M=0 // 10224
@SP // 10225
AM=M+1 // 10226
A=A-1 // 10227
M=0 // 10228
// call Output.create
@17 // 10229
D=A // 10230
@14 // 10231
M=D // 10232
@Output.create // 10233
D=A // 10234
@13 // 10235
M=D // 10236
@Output.initMap.ret.80 // 10237
D=A // 10238
@CALL // 10239
0;JMP // 10240
(Output.initMap.ret.80)
@SP // 10241
M=M-1 // 10242

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10243
D=A // 10244
@SP // 10245
M=D+M // 10246
@111 // 10247
D=A // 10248
@SP // 10249
A=M-1 // 10250
M=0 // 10251
A=A-1 // 10252
M=0 // 10253
A=A-1 // 10254
M=0 // 10255
A=A-1 // 10256
M=D // 10257
A=A-1 // 10258
@30 // 10259
D=A // 10260
@SP // 10261
AM=M+1 // 10262
A=A-1 // 10263
M=D // 10264
@51 // 10265
D=A // 10266
@SP // 10267
AM=M+1 // 10268
A=A-1 // 10269
M=D // 10270
@51 // 10271
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
@51 // 10283
D=A // 10284
@SP // 10285
AM=M+1 // 10286
A=A-1 // 10287
M=D // 10288
@30 // 10289
D=A // 10290
@SP // 10291
AM=M+1 // 10292
A=A-1 // 10293
M=D // 10294
@SP // 10295
AM=M+1 // 10296
A=A-1 // 10297
M=0 // 10298
@SP // 10299
AM=M+1 // 10300
A=A-1 // 10301
M=0 // 10302
// call Output.create
@17 // 10303
D=A // 10304
@14 // 10305
M=D // 10306
@Output.create // 10307
D=A // 10308
@13 // 10309
M=D // 10310
@Output.initMap.ret.81 // 10311
D=A // 10312
@CALL // 10313
0;JMP // 10314
(Output.initMap.ret.81)
@SP // 10315
M=M-1 // 10316

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10317
D=A // 10318
@SP // 10319
M=D+M // 10320
@112 // 10321
D=A // 10322
@SP // 10323
A=M-1 // 10324
M=0 // 10325
A=A-1 // 10326
M=0 // 10327
A=A-1 // 10328
M=0 // 10329
A=A-1 // 10330
M=D // 10331
A=A-1 // 10332
@30 // 10333
D=A // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=D // 10338
@51 // 10339
D=A // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=D // 10344
@51 // 10345
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
@31 // 10357
D=A // 10358
@SP // 10359
AM=M+1 // 10360
A=A-1 // 10361
M=D // 10362
@3 // 10363
D=A // 10364
@SP // 10365
AM=M+1 // 10366
A=A-1 // 10367
M=D // 10368
@3 // 10369
D=A // 10370
@SP // 10371
AM=M+1 // 10372
A=A-1 // 10373
M=D // 10374
@SP // 10375
AM=M+1 // 10376
A=A-1 // 10377
M=0 // 10378
// call Output.create
@17 // 10379
D=A // 10380
@14 // 10381
M=D // 10382
@Output.create // 10383
D=A // 10384
@13 // 10385
M=D // 10386
@Output.initMap.ret.82 // 10387
D=A // 10388
@CALL // 10389
0;JMP // 10390
(Output.initMap.ret.82)
@SP // 10391
M=M-1 // 10392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10393
D=A // 10394
@SP // 10395
M=D+M // 10396
@113 // 10397
D=A // 10398
@SP // 10399
A=M-1 // 10400
M=0 // 10401
A=A-1 // 10402
M=0 // 10403
A=A-1 // 10404
M=0 // 10405
A=A-1 // 10406
M=D // 10407
A=A-1 // 10408
@30 // 10409
D=A // 10410
@SP // 10411
AM=M+1 // 10412
A=A-1 // 10413
M=D // 10414
@51 // 10415
D=A // 10416
@SP // 10417
AM=M+1 // 10418
A=A-1 // 10419
M=D // 10420
@51 // 10421
D=A // 10422
@SP // 10423
AM=M+1 // 10424
A=A-1 // 10425
M=D // 10426
@51 // 10427
D=A // 10428
@SP // 10429
AM=M+1 // 10430
A=A-1 // 10431
M=D // 10432
@62 // 10433
D=A // 10434
@SP // 10435
AM=M+1 // 10436
A=A-1 // 10437
M=D // 10438
@48 // 10439
D=A // 10440
@SP // 10441
AM=M+1 // 10442
A=A-1 // 10443
M=D // 10444
@48 // 10445
D=A // 10446
@SP // 10447
AM=M+1 // 10448
A=A-1 // 10449
M=D // 10450
@SP // 10451
AM=M+1 // 10452
A=A-1 // 10453
M=0 // 10454
// call Output.create
@17 // 10455
D=A // 10456
@14 // 10457
M=D // 10458
@Output.create // 10459
D=A // 10460
@13 // 10461
M=D // 10462
@Output.initMap.ret.83 // 10463
D=A // 10464
@CALL // 10465
0;JMP // 10466
(Output.initMap.ret.83)
@SP // 10467
M=M-1 // 10468

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10469
D=A // 10470
@SP // 10471
M=D+M // 10472
@114 // 10473
D=A // 10474
@SP // 10475
A=M-1 // 10476
M=0 // 10477
A=A-1 // 10478
M=0 // 10479
A=A-1 // 10480
M=0 // 10481
A=A-1 // 10482
M=D // 10483
A=A-1 // 10484
@29 // 10485
D=A // 10486
@SP // 10487
AM=M+1 // 10488
A=A-1 // 10489
M=D // 10490
@55 // 10491
D=A // 10492
@SP // 10493
AM=M+1 // 10494
A=A-1 // 10495
M=D // 10496
@51 // 10497
D=A // 10498
@SP // 10499
AM=M+1 // 10500
A=A-1 // 10501
M=D // 10502
@3 // 10503
D=A // 10504
@SP // 10505
AM=M+1 // 10506
A=A-1 // 10507
M=D // 10508
@3 // 10509
D=A // 10510
@SP // 10511
AM=M+1 // 10512
A=A-1 // 10513
M=D // 10514
@7 // 10515
D=A // 10516
@SP // 10517
AM=M+1 // 10518
A=A-1 // 10519
M=D // 10520
@SP // 10521
AM=M+1 // 10522
A=A-1 // 10523
M=0 // 10524
@SP // 10525
AM=M+1 // 10526
A=A-1 // 10527
M=0 // 10528
// call Output.create
@17 // 10529
D=A // 10530
@14 // 10531
M=D // 10532
@Output.create // 10533
D=A // 10534
@13 // 10535
M=D // 10536
@Output.initMap.ret.84 // 10537
D=A // 10538
@CALL // 10539
0;JMP // 10540
(Output.initMap.ret.84)
@SP // 10541
M=M-1 // 10542

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10543
D=A // 10544
@SP // 10545
M=D+M // 10546
@115 // 10547
D=A // 10548
@SP // 10549
A=M-1 // 10550
M=0 // 10551
A=A-1 // 10552
M=0 // 10553
A=A-1 // 10554
M=0 // 10555
A=A-1 // 10556
M=D // 10557
A=A-1 // 10558
@30 // 10559
D=A // 10560
@SP // 10561
AM=M+1 // 10562
A=A-1 // 10563
M=D // 10564
@51 // 10565
D=A // 10566
@SP // 10567
AM=M+1 // 10568
A=A-1 // 10569
M=D // 10570
@6 // 10571
D=A // 10572
@SP // 10573
AM=M+1 // 10574
A=A-1 // 10575
M=D // 10576
@24 // 10577
D=A // 10578
@SP // 10579
AM=M+1 // 10580
A=A-1 // 10581
M=D // 10582
@51 // 10583
D=A // 10584
@SP // 10585
AM=M+1 // 10586
A=A-1 // 10587
M=D // 10588
@30 // 10589
D=A // 10590
@SP // 10591
AM=M+1 // 10592
A=A-1 // 10593
M=D // 10594
@SP // 10595
AM=M+1 // 10596
A=A-1 // 10597
M=0 // 10598
@SP // 10599
AM=M+1 // 10600
A=A-1 // 10601
M=0 // 10602
// call Output.create
@17 // 10603
D=A // 10604
@14 // 10605
M=D // 10606
@Output.create // 10607
D=A // 10608
@13 // 10609
M=D // 10610
@Output.initMap.ret.85 // 10611
D=A // 10612
@CALL // 10613
0;JMP // 10614
(Output.initMap.ret.85)
@SP // 10615
M=M-1 // 10616

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10617
D=A // 10618
@SP // 10619
AM=M+1 // 10620
A=A-1 // 10621
M=D // 10622
@4 // 10623
D=A // 10624
@SP // 10625
AM=M+1 // 10626
A=A-1 // 10627
M=D // 10628
@6 // 10629
D=A // 10630
@SP // 10631
AM=M+1 // 10632
A=A-1 // 10633
M=D // 10634
@6 // 10635
D=A // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=D // 10640
@15 // 10641
D=A // 10642
@SP // 10643
AM=M+1 // 10644
A=A-1 // 10645
M=D // 10646
@6 // 10647
D=A // 10648
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=D // 10652
@6 // 10653
D=A // 10654
@SP // 10655
AM=M+1 // 10656
A=A-1 // 10657
M=D // 10658
@6 // 10659
D=A // 10660
@SP // 10661
AM=M+1 // 10662
A=A-1 // 10663
M=D // 10664
@54 // 10665
D=A // 10666
@SP // 10667
AM=M+1 // 10668
A=A-1 // 10669
M=D // 10670
@28 // 10671
D=A // 10672
@SP // 10673
AM=M+1 // 10674
A=A-1 // 10675
M=D // 10676
@SP // 10677
AM=M+1 // 10678
A=A-1 // 10679
M=0 // 10680
@SP // 10681
AM=M+1 // 10682
A=A-1 // 10683
M=0 // 10684
// call Output.create
@17 // 10685
D=A // 10686
@14 // 10687
M=D // 10688
@Output.create // 10689
D=A // 10690
@13 // 10691
M=D // 10692
@Output.initMap.ret.86 // 10693
D=A // 10694
@CALL // 10695
0;JMP // 10696
(Output.initMap.ret.86)
@SP // 10697
M=M-1 // 10698

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10699
D=A // 10700
@SP // 10701
M=D+M // 10702
@117 // 10703
D=A // 10704
@SP // 10705
A=M-1 // 10706
M=0 // 10707
A=A-1 // 10708
M=0 // 10709
A=A-1 // 10710
M=0 // 10711
A=A-1 // 10712
M=D // 10713
A=A-1 // 10714
@27 // 10715
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
@27 // 10733
D=A // 10734
@SP // 10735
AM=M+1 // 10736
A=A-1 // 10737
M=D // 10738
@27 // 10739
D=A // 10740
@SP // 10741
AM=M+1 // 10742
A=A-1 // 10743
M=D // 10744
@54 // 10745
D=A // 10746
@SP // 10747
AM=M+1 // 10748
A=A-1 // 10749
M=D // 10750
@SP // 10751
AM=M+1 // 10752
A=A-1 // 10753
M=0 // 10754
@SP // 10755
AM=M+1 // 10756
A=A-1 // 10757
M=0 // 10758
// call Output.create
@17 // 10759
D=A // 10760
@14 // 10761
M=D // 10762
@Output.create // 10763
D=A // 10764
@13 // 10765
M=D // 10766
@Output.initMap.ret.87 // 10767
D=A // 10768
@CALL // 10769
0;JMP // 10770
(Output.initMap.ret.87)
@SP // 10771
M=M-1 // 10772

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10773
D=A // 10774
@SP // 10775
M=D+M // 10776
@118 // 10777
D=A // 10778
@SP // 10779
A=M-1 // 10780
M=0 // 10781
A=A-1 // 10782
M=0 // 10783
A=A-1 // 10784
M=0 // 10785
A=A-1 // 10786
M=D // 10787
A=A-1 // 10788
@51 // 10789
D=A // 10790
@SP // 10791
AM=M+1 // 10792
A=A-1 // 10793
M=D // 10794
@51 // 10795
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
@51 // 10807
D=A // 10808
@SP // 10809
AM=M+1 // 10810
A=A-1 // 10811
M=D // 10812
@30 // 10813
D=A // 10814
@SP // 10815
AM=M+1 // 10816
A=A-1 // 10817
M=D // 10818
@12 // 10819
D=A // 10820
@SP // 10821
AM=M+1 // 10822
A=A-1 // 10823
M=D // 10824
@SP // 10825
AM=M+1 // 10826
A=A-1 // 10827
M=0 // 10828
@SP // 10829
AM=M+1 // 10830
A=A-1 // 10831
M=0 // 10832
// call Output.create
@17 // 10833
D=A // 10834
@14 // 10835
M=D // 10836
@Output.create // 10837
D=A // 10838
@13 // 10839
M=D // 10840
@Output.initMap.ret.88 // 10841
D=A // 10842
@CALL // 10843
0;JMP // 10844
(Output.initMap.ret.88)
@SP // 10845
M=M-1 // 10846

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10847
D=A // 10848
@SP // 10849
M=D+M // 10850
@119 // 10851
D=A // 10852
@SP // 10853
A=M-1 // 10854
M=0 // 10855
A=A-1 // 10856
M=0 // 10857
A=A-1 // 10858
M=0 // 10859
A=A-1 // 10860
M=D // 10861
A=A-1 // 10862
@51 // 10863
D=A // 10864
@SP // 10865
AM=M+1 // 10866
A=A-1 // 10867
M=D // 10868
@51 // 10869
D=A // 10870
@SP // 10871
AM=M+1 // 10872
A=A-1 // 10873
M=D // 10874
@51 // 10875
D=A // 10876
@SP // 10877
AM=M+1 // 10878
A=A-1 // 10879
M=D // 10880
@63 // 10881
D=A // 10882
@SP // 10883
AM=M+1 // 10884
A=A-1 // 10885
M=D // 10886
@63 // 10887
D=A // 10888
@SP // 10889
AM=M+1 // 10890
A=A-1 // 10891
M=D // 10892
@18 // 10893
D=A // 10894
@SP // 10895
AM=M+1 // 10896
A=A-1 // 10897
M=D // 10898
@SP // 10899
AM=M+1 // 10900
A=A-1 // 10901
M=0 // 10902
@SP // 10903
AM=M+1 // 10904
A=A-1 // 10905
M=0 // 10906
// call Output.create
@17 // 10907
D=A // 10908
@14 // 10909
M=D // 10910
@Output.create // 10911
D=A // 10912
@13 // 10913
M=D // 10914
@Output.initMap.ret.89 // 10915
D=A // 10916
@CALL // 10917
0;JMP // 10918
(Output.initMap.ret.89)
@SP // 10919
M=M-1 // 10920

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10921
D=A // 10922
@SP // 10923
M=D+M // 10924
@120 // 10925
D=A // 10926
@SP // 10927
A=M-1 // 10928
M=0 // 10929
A=A-1 // 10930
M=0 // 10931
A=A-1 // 10932
M=0 // 10933
A=A-1 // 10934
M=D // 10935
A=A-1 // 10936
@51 // 10937
D=A // 10938
@SP // 10939
AM=M+1 // 10940
A=A-1 // 10941
M=D // 10942
@30 // 10943
D=A // 10944
@SP // 10945
AM=M+1 // 10946
A=A-1 // 10947
M=D // 10948
@12 // 10949
D=A // 10950
@SP // 10951
AM=M+1 // 10952
A=A-1 // 10953
M=D // 10954
@12 // 10955
D=A // 10956
@SP // 10957
AM=M+1 // 10958
A=A-1 // 10959
M=D // 10960
@30 // 10961
D=A // 10962
@SP // 10963
AM=M+1 // 10964
A=A-1 // 10965
M=D // 10966
@51 // 10967
D=A // 10968
@SP // 10969
AM=M+1 // 10970
A=A-1 // 10971
M=D // 10972
@SP // 10973
AM=M+1 // 10974
A=A-1 // 10975
M=0 // 10976
@SP // 10977
AM=M+1 // 10978
A=A-1 // 10979
M=0 // 10980
// call Output.create
@17 // 10981
D=A // 10982
@14 // 10983
M=D // 10984
@Output.create // 10985
D=A // 10986
@13 // 10987
M=D // 10988
@Output.initMap.ret.90 // 10989
D=A // 10990
@CALL // 10991
0;JMP // 10992
(Output.initMap.ret.90)
@SP // 10993
M=M-1 // 10994

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10995
D=A // 10996
@SP // 10997
M=D+M // 10998
@121 // 10999
D=A // 11000
@SP // 11001
A=M-1 // 11002
M=0 // 11003
A=A-1 // 11004
M=0 // 11005
A=A-1 // 11006
M=0 // 11007
A=A-1 // 11008
M=D // 11009
A=A-1 // 11010
@51 // 11011
D=A // 11012
@SP // 11013
AM=M+1 // 11014
A=A-1 // 11015
M=D // 11016
@51 // 11017
D=A // 11018
@SP // 11019
AM=M+1 // 11020
A=A-1 // 11021
M=D // 11022
@51 // 11023
D=A // 11024
@SP // 11025
AM=M+1 // 11026
A=A-1 // 11027
M=D // 11028
@62 // 11029
D=A // 11030
@SP // 11031
AM=M+1 // 11032
A=A-1 // 11033
M=D // 11034
@48 // 11035
D=A // 11036
@SP // 11037
AM=M+1 // 11038
A=A-1 // 11039
M=D // 11040
@24 // 11041
D=A // 11042
@SP // 11043
AM=M+1 // 11044
A=A-1 // 11045
M=D // 11046
@15 // 11047
D=A // 11048
@SP // 11049
AM=M+1 // 11050
A=A-1 // 11051
M=D // 11052
@SP // 11053
AM=M+1 // 11054
A=A-1 // 11055
M=0 // 11056
// call Output.create
@17 // 11057
D=A // 11058
@14 // 11059
M=D // 11060
@Output.create // 11061
D=A // 11062
@13 // 11063
M=D // 11064
@Output.initMap.ret.91 // 11065
D=A // 11066
@CALL // 11067
0;JMP // 11068
(Output.initMap.ret.91)
@SP // 11069
M=M-1 // 11070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11071
D=A // 11072
@SP // 11073
M=D+M // 11074
@122 // 11075
D=A // 11076
@SP // 11077
A=M-1 // 11078
M=0 // 11079
A=A-1 // 11080
M=0 // 11081
A=A-1 // 11082
M=0 // 11083
A=A-1 // 11084
M=D // 11085
A=A-1 // 11086
@63 // 11087
D=A // 11088
@SP // 11089
AM=M+1 // 11090
A=A-1 // 11091
M=D // 11092
@27 // 11093
D=A // 11094
@SP // 11095
AM=M+1 // 11096
A=A-1 // 11097
M=D // 11098
@12 // 11099
D=A // 11100
@SP // 11101
AM=M+1 // 11102
A=A-1 // 11103
M=D // 11104
@6 // 11105
D=A // 11106
@SP // 11107
AM=M+1 // 11108
A=A-1 // 11109
M=D // 11110
@51 // 11111
D=A // 11112
@SP // 11113
AM=M+1 // 11114
A=A-1 // 11115
M=D // 11116
@63 // 11117
D=A // 11118
@SP // 11119
AM=M+1 // 11120
A=A-1 // 11121
M=D // 11122
@SP // 11123
AM=M+1 // 11124
A=A-1 // 11125
M=0 // 11126
@SP // 11127
AM=M+1 // 11128
A=A-1 // 11129
M=0 // 11130
// call Output.create
@17 // 11131
D=A // 11132
@14 // 11133
M=D // 11134
@Output.create // 11135
D=A // 11136
@13 // 11137
M=D // 11138
@Output.initMap.ret.92 // 11139
D=A // 11140
@CALL // 11141
0;JMP // 11142
(Output.initMap.ret.92)
@SP // 11143
M=M-1 // 11144

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11145
D=A // 11146
@SP // 11147
AM=M+1 // 11148
A=A-1 // 11149
M=D // 11150
@56 // 11151
D=A // 11152
@SP // 11153
AM=M+1 // 11154
A=A-1 // 11155
M=D // 11156
@12 // 11157
D=A // 11158
@SP // 11159
AM=M+1 // 11160
A=A-1 // 11161
M=D // 11162
@12 // 11163
D=A // 11164
@SP // 11165
AM=M+1 // 11166
A=A-1 // 11167
M=D // 11168
@12 // 11169
D=A // 11170
@SP // 11171
AM=M+1 // 11172
A=A-1 // 11173
M=D // 11174
@7 // 11175
D=A // 11176
@SP // 11177
AM=M+1 // 11178
A=A-1 // 11179
M=D // 11180
@12 // 11181
D=A // 11182
@SP // 11183
AM=M+1 // 11184
A=A-1 // 11185
M=D // 11186
@12 // 11187
D=A // 11188
@SP // 11189
AM=M+1 // 11190
A=A-1 // 11191
M=D // 11192
@12 // 11193
D=A // 11194
@SP // 11195
AM=M+1 // 11196
A=A-1 // 11197
M=D // 11198
@56 // 11199
D=A // 11200
@SP // 11201
AM=M+1 // 11202
A=A-1 // 11203
M=D // 11204
@SP // 11205
AM=M+1 // 11206
A=A-1 // 11207
M=0 // 11208
@SP // 11209
AM=M+1 // 11210
A=A-1 // 11211
M=0 // 11212
// call Output.create
@17 // 11213
D=A // 11214
@14 // 11215
M=D // 11216
@Output.create // 11217
D=A // 11218
@13 // 11219
M=D // 11220
@Output.initMap.ret.93 // 11221
D=A // 11222
@CALL // 11223
0;JMP // 11224
(Output.initMap.ret.93)
@SP // 11225
M=M-1 // 11226

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11227
D=A // 11228
@SP // 11229
AM=M+1 // 11230
A=A-1 // 11231
M=D // 11232
@12 // 11233
D=A // 11234
@SP // 11235
AM=M+1 // 11236
A=A-1 // 11237
M=D // 11238
@12 // 11239
D=A // 11240
@SP // 11241
AM=M+1 // 11242
A=A-1 // 11243
M=D // 11244
@12 // 11245
D=A // 11246
@SP // 11247
AM=M+1 // 11248
A=A-1 // 11249
M=D // 11250
@12 // 11251
D=A // 11252
@SP // 11253
AM=M+1 // 11254
A=A-1 // 11255
M=D // 11256
@12 // 11257
D=A // 11258
@SP // 11259
AM=M+1 // 11260
A=A-1 // 11261
M=D // 11262
@12 // 11263
D=A // 11264
@SP // 11265
AM=M+1 // 11266
A=A-1 // 11267
M=D // 11268
@12 // 11269
D=A // 11270
@SP // 11271
AM=M+1 // 11272
A=A-1 // 11273
M=D // 11274
@12 // 11275
D=A // 11276
@SP // 11277
AM=M+1 // 11278
A=A-1 // 11279
M=D // 11280
@12 // 11281
D=A // 11282
@SP // 11283
AM=M+1 // 11284
A=A-1 // 11285
M=D // 11286
@SP // 11287
AM=M+1 // 11288
A=A-1 // 11289
M=0 // 11290
@SP // 11291
AM=M+1 // 11292
A=A-1 // 11293
M=0 // 11294
// call Output.create
@17 // 11295
D=A // 11296
@14 // 11297
M=D // 11298
@Output.create // 11299
D=A // 11300
@13 // 11301
M=D // 11302
@Output.initMap.ret.94 // 11303
D=A // 11304
@CALL // 11305
0;JMP // 11306
(Output.initMap.ret.94)
@SP // 11307
M=M-1 // 11308

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11309
D=A // 11310
@SP // 11311
AM=M+1 // 11312
A=A-1 // 11313
M=D // 11314
@7 // 11315
D=A // 11316
@SP // 11317
AM=M+1 // 11318
A=A-1 // 11319
M=D // 11320
@12 // 11321
D=A // 11322
@SP // 11323
AM=M+1 // 11324
A=A-1 // 11325
M=D // 11326
@12 // 11327
D=A // 11328
@SP // 11329
AM=M+1 // 11330
A=A-1 // 11331
M=D // 11332
@12 // 11333
D=A // 11334
@SP // 11335
AM=M+1 // 11336
A=A-1 // 11337
M=D // 11338
@56 // 11339
D=A // 11340
@SP // 11341
AM=M+1 // 11342
A=A-1 // 11343
M=D // 11344
@12 // 11345
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
@7 // 11363
D=A // 11364
@SP // 11365
AM=M+1 // 11366
A=A-1 // 11367
M=D // 11368
@SP // 11369
AM=M+1 // 11370
A=A-1 // 11371
M=0 // 11372
@SP // 11373
AM=M+1 // 11374
A=A-1 // 11375
M=0 // 11376
// call Output.create
@17 // 11377
D=A // 11378
@14 // 11379
M=D // 11380
@Output.create // 11381
D=A // 11382
@13 // 11383
M=D // 11384
@Output.initMap.ret.95 // 11385
D=A // 11386
@CALL // 11387
0;JMP // 11388
(Output.initMap.ret.95)
@SP // 11389
M=M-1 // 11390

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11391
D=A // 11392
@SP // 11393
AM=M+1 // 11394
A=A-1 // 11395
M=D // 11396
@38 // 11397
D=A // 11398
@SP // 11399
AM=M+1 // 11400
A=A-1 // 11401
M=D // 11402
@45 // 11403
D=A // 11404
@SP // 11405
AM=M+1 // 11406
A=A-1 // 11407
M=D // 11408
@25 // 11409
D=A // 11410
@SP // 11411
AM=M+1 // 11412
A=A-1 // 11413
M=D // 11414
@SP // 11415
AM=M+1 // 11416
A=A-1 // 11417
M=0 // 11418
@SP // 11419
AM=M+1 // 11420
A=A-1 // 11421
M=0 // 11422
@SP // 11423
AM=M+1 // 11424
A=A-1 // 11425
M=0 // 11426
@SP // 11427
AM=M+1 // 11428
A=A-1 // 11429
M=0 // 11430
@SP // 11431
AM=M+1 // 11432
A=A-1 // 11433
M=0 // 11434
@SP // 11435
AM=M+1 // 11436
A=A-1 // 11437
M=0 // 11438
@SP // 11439
AM=M+1 // 11440
A=A-1 // 11441
M=0 // 11442
@SP // 11443
AM=M+1 // 11444
A=A-1 // 11445
M=0 // 11446
// call Output.create
@17 // 11447
D=A // 11448
@14 // 11449
M=D // 11450
@Output.create // 11451
D=A // 11452
@13 // 11453
M=D // 11454
@Output.initMap.ret.96 // 11455
D=A // 11456
@CALL // 11457
0;JMP // 11458
(Output.initMap.ret.96)
@SP // 11459
M=M-1 // 11460

////PushInstruction("constant 0")
@SP // 11461
AM=M+1 // 11462
A=A-1 // 11463
M=0 // 11464
@RETURN // 11465
0;JMP // 11466

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 11467
AM=M+1 // 11468
A=A-1 // 11469
M=0 // 11470

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11471
D=A // 11472
@SP // 11473
AM=M+1 // 11474
A=A-1 // 11475
M=D // 11476
// call Array.new
@6 // 11477
D=A // 11478
@14 // 11479
M=D // 11480
@Array.new // 11481
D=A // 11482
@13 // 11483
M=D // 11484
@Output.create.ret.0 // 11485
D=A // 11486
@CALL // 11487
0;JMP // 11488
(Output.create.ret.0)
@SP // 11489
AM=M-1 // 11490
D=M // 11491
@LCL // 11492
A=M // 11493
M=D // 11494

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11495
D=M // 11496
@SP // 11497
AM=M+1 // 11498
A=A-1 // 11499
M=D // 11500
@ARG // 11501
A=M // 11502
D=M // 11503
@SP // 11504
AM=M-1 // 11505
D=D+M // 11506
@SP // 11507
AM=M+1 // 11508
A=A-1 // 11509
M=D // 11510
@LCL // 11511
A=M // 11512
D=M // 11513
@SP // 11514
AM=M-1 // 11515
A=M // 11516
M=D // 11517

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11518
A=M // 11519
D=M // 11520
@SP // 11521
AM=M+1 // 11522
A=A-1 // 11523
M=D // 11524
@ARG // 11525
A=M+1 // 11526
D=M // 11527
@SP // 11528
AM=M-1 // 11529
A=M // 11530
M=D // 11531

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11532
A=M // 11533
D=M // 11534
@SP // 11535
AM=M+1 // 11536
A=A-1 // 11537
M=D+1 // 11538
@ARG // 11539
A=M+1 // 11540
A=A+1 // 11541
D=M // 11542
@SP // 11543
AM=M-1 // 11544
A=M // 11545
M=D // 11546

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11547
A=M // 11548
D=M // 11549
@2 // 11550
D=D+A // 11551
@SP // 11552
AM=M+1 // 11553
A=A-1 // 11554
M=D // 11555
@ARG // 11556
A=M+1 // 11557
A=A+1 // 11558
A=A+1 // 11559
D=M // 11560
@SP // 11561
AM=M-1 // 11562
A=M // 11563
M=D // 11564

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11565
A=M // 11566
D=M // 11567
@3 // 11568
D=D+A // 11569
@SP // 11570
AM=M+1 // 11571
A=A-1 // 11572
M=D // 11573
@ARG // 11574
D=M // 11575
@4 // 11576
A=D+A // 11577
D=M // 11578
@SP // 11579
AM=M-1 // 11580
A=M // 11581
M=D // 11582

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11583
A=M // 11584
D=M // 11585
@4 // 11586
D=D+A // 11587
@SP // 11588
AM=M+1 // 11589
A=A-1 // 11590
M=D // 11591
@ARG // 11592
D=M // 11593
@5 // 11594
A=D+A // 11595
D=M // 11596
@SP // 11597
AM=M-1 // 11598
A=M // 11599
M=D // 11600

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11601
A=M // 11602
D=M // 11603
@5 // 11604
D=D+A // 11605
@SP // 11606
AM=M+1 // 11607
A=A-1 // 11608
M=D // 11609
@ARG // 11610
D=M // 11611
@6 // 11612
A=D+A // 11613
D=M // 11614
@SP // 11615
AM=M-1 // 11616
A=M // 11617
M=D // 11618

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11619
A=M // 11620
D=M // 11621
@6 // 11622
D=D+A // 11623
@SP // 11624
AM=M+1 // 11625
A=A-1 // 11626
M=D // 11627
@ARG // 11628
D=M // 11629
@7 // 11630
A=D+A // 11631
D=M // 11632
@SP // 11633
AM=M-1 // 11634
A=M // 11635
M=D // 11636

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11637
A=M // 11638
D=M // 11639
@7 // 11640
D=D+A // 11641
@SP // 11642
AM=M+1 // 11643
A=A-1 // 11644
M=D // 11645
@ARG // 11646
D=M // 11647
@8 // 11648
A=D+A // 11649
D=M // 11650
@SP // 11651
AM=M-1 // 11652
A=M // 11653
M=D // 11654

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11655
A=M // 11656
D=M // 11657
@8 // 11658
D=D+A // 11659
@SP // 11660
AM=M+1 // 11661
A=A-1 // 11662
M=D // 11663
@ARG // 11664
D=M // 11665
@9 // 11666
A=D+A // 11667
D=M // 11668
@SP // 11669
AM=M-1 // 11670
A=M // 11671
M=D // 11672

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11673
A=M // 11674
D=M // 11675
@9 // 11676
D=D+A // 11677
@SP // 11678
AM=M+1 // 11679
A=A-1 // 11680
M=D // 11681
@ARG // 11682
D=M // 11683
@10 // 11684
A=D+A // 11685
D=M // 11686
@SP // 11687
AM=M-1 // 11688
A=M // 11689
M=D // 11690

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11691
A=M // 11692
D=M // 11693
@10 // 11694
D=D+A // 11695
@SP // 11696
AM=M+1 // 11697
A=A-1 // 11698
M=D // 11699
@ARG // 11700
D=M // 11701
@11 // 11702
A=D+A // 11703
D=M // 11704
@SP // 11705
AM=M-1 // 11706
A=M // 11707
M=D // 11708

////PushInstruction("constant 0")
@SP // 11709
AM=M+1 // 11710
A=A-1 // 11711
M=0 // 11712
@RETURN // 11713
0;JMP // 11714

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 0"),
//                right:
//                    PushInstruction("constant 32"),
//                binaryOp: "LT"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 0"),
//                right:
//                    PushInstruction("constant 126"),
//                binaryOp: "GT"
//            ),
//        binaryOp: "OR"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.getMap.IfElseEND1}}
@Output.getMap.LT.0 // 11715
D=A // 11716
@SP // 11717
AM=M+1 // 11718
A=A-1 // 11719
M=D // 11720
@ARG // 11721
A=M // 11722
D=M // 11723
@32 // 11724
D=D-A // 11725
@DO_LT // 11726
0;JMP // 11727
(Output.getMap.LT.0)
@SP // 11728
AM=M+1 // 11729
A=A-1 // 11730
M=D // 11731
@Output.getMap.GT.1 // 11732
D=A // 11733
@SP // 11734
AM=M+1 // 11735
A=A-1 // 11736
M=D // 11737
@ARG // 11738
A=M // 11739
D=M // 11740
@126 // 11741
D=D-A // 11742
@DO_GT // 11743
0;JMP // 11744
(Output.getMap.GT.1)
@SP // 11745
AM=M-1 // 11746
D=D|M // 11747
D=!D // 11748
@Output.getMap.IfElseEND1 // 11749
D;JNE // 11750

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11751
A=M // 11752
M=0 // 11753

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
@Output.0 // 11754
D=M // 11755
@SP // 11756
AM=M+1 // 11757
A=A-1 // 11758
M=D // 11759
@ARG // 11760
A=M // 11761
D=M // 11762
@SP // 11763
AM=M-1 // 11764
A=D+M // 11765
D=M // 11766
@SP // 11767
AM=M+1 // 11768
A=A-1 // 11769
M=D // 11770
@RETURN // 11771
0;JMP // 11772

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 11773
A=M+1 // 11774
D=M // 11775
@Output.1 // 11776
M=D // 11777

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 11778
A=M // 11779
D=M // 11780
@Output.2 // 11781
M=D // 11782

////PushInstruction("constant 0")
@SP // 11783
AM=M+1 // 11784
A=A-1 // 11785
M=0 // 11786
@RETURN // 11787
0;JMP // 11788

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 11789
D=A // 11790
@SP // 11791
AM=D+M // 11792
A=A-1 // 11793
M=0 // 11794
A=A-1 // 11795
M=0 // 11796
A=A-1 // 11797
M=0 // 11798
A=A-1 // 11799
M=0 // 11800

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 11801
A=M // 11802
D=M // 11803
@SP // 11804
AM=M+1 // 11805
A=A-1 // 11806
M=D // 11807
// call Output.getMap
@6 // 11808
D=A // 11809
@14 // 11810
M=D // 11811
@Output.getMap // 11812
D=A // 11813
@13 // 11814
M=D // 11815
@Output.printChar.ret.0 // 11816
D=A // 11817
@CALL // 11818
0;JMP // 11819
(Output.printChar.ret.0)
@SP // 11820
AM=M-1 // 11821
D=M // 11822
@LCL // 11823
A=M // 11824
M=D // 11825

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 11826
A=M+1 // 11827
A=A+1 // 11828
A=A+1 // 11829
M=0 // 11830

////LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 11"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Output.printChar1}}
@Output.printChar.LT.2 // 11831
D=A // 11832
@SP // 11833
AM=M+1 // 11834
A=A-1 // 11835
M=D // 11836
@LCL // 11837
A=M+1 // 11838
A=A+1 // 11839
A=A+1 // 11840
D=M // 11841
@11 // 11842
D=D-A // 11843
@DO_LT // 11844
0;JMP // 11845
(Output.printChar.LT.2)
D=!D // 11846
@WHILE_END_Output.printChar1 // 11847
D;JNE // 11848

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

@Output.2 // 11849
D=M // 11850
@SP // 11851
AM=M+1 // 11852
A=A-1 // 11853
M=D // 11854
@11 // 11855
D=A // 11856
@SP // 11857
AM=M+1 // 11858
A=A-1 // 11859
M=D // 11860
// call Math.multiply
@7 // 11861
D=A // 11862
@14 // 11863
M=D // 11864
@Math.multiply // 11865
D=A // 11866
@13 // 11867
M=D // 11868
@Output.printChar.ret.1 // 11869
D=A // 11870
@CALL // 11871
0;JMP // 11872
(Output.printChar.ret.1)
@LCL // 11873
A=M+1 // 11874
A=A+1 // 11875
A=A+1 // 11876
D=M // 11877
@SP // 11878
AM=M-1 // 11879
D=D+M // 11880
@SP // 11881
AM=M+1 // 11882
A=A-1 // 11883
M=D // 11884
@32 // 11885
D=A // 11886
@SP // 11887
AM=M+1 // 11888
A=A-1 // 11889
M=D // 11890
// call Math.multiply
@7 // 11891
D=A // 11892
@14 // 11893
M=D // 11894
@Math.multiply // 11895
D=A // 11896
@13 // 11897
M=D // 11898
@Output.printChar.ret.2 // 11899
D=A // 11900
@CALL // 11901
0;JMP // 11902
(Output.printChar.ret.2)
@SP // 11903
AM=M-1 // 11904
D=M // 11905
@16384 // 11906
D=D+A // 11907
@SP // 11908
AM=M+1 // 11909
A=A-1 // 11910
M=D // 11911
@Output.1 // 11912
D=M // 11913
@SP // 11914
AM=M+1 // 11915
A=A-1 // 11916
M=D // 11917
@2 // 11918
D=A // 11919
@SP // 11920
AM=M+1 // 11921
A=A-1 // 11922
M=D // 11923
// call Math.divide
@7 // 11924
D=A // 11925
@14 // 11926
M=D // 11927
@Math.divide // 11928
D=A // 11929
@13 // 11930
M=D // 11931
@Output.printChar.ret.3 // 11932
D=A // 11933
@CALL // 11934
0;JMP // 11935
(Output.printChar.ret.3)
@SP // 11936
AM=M-1 // 11937
D=M // 11938
@SP // 11939
AM=M-1 // 11940
D=D+M // 11941
@LCL // 11942
A=M+1 // 11943
M=D // 11944

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("static 1"),
//                right:
//                    PushInstruction("constant 1"),
//                binaryOp: "AND"
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.printChar.IfElse1}}
@Output.printChar.EQ.3 // 11945
D=A // 11946
@SP // 11947
AM=M+1 // 11948
A=A-1 // 11949
M=D // 11950
@Output.1 // 11951
D=M // 11952
@1 // 11953
D=D&A // 11954
@DO_EQ // 11955
0;JMP // 11956
(Output.printChar.EQ.3)
D=!D // 11957
@Output.printChar.IfElse1 // 11958
D;JNE // 11959

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

@LCL // 11960
A=M+1 // 11961
A=A+1 // 11962
A=A+1 // 11963
D=M // 11964
A=A-1 // 11965
A=A-1 // 11966
A=A-1 // 11967
A=D+M // 11968
D=M // 11969
@LCL // 11970
A=M+1 // 11971
A=A+1 // 11972
M=D // 11973

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 11974
0;JMP // 11975

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

@LCL // 11976
A=M+1 // 11977
A=A+1 // 11978
A=A+1 // 11979
D=M // 11980
A=A-1 // 11981
A=A-1 // 11982
A=A-1 // 11983
A=D+M // 11984
D=M // 11985
@SP // 11986
AM=M+1 // 11987
A=A-1 // 11988
M=D // 11989
@256 // 11990
D=A // 11991
@SP // 11992
AM=M+1 // 11993
A=A-1 // 11994
M=D // 11995
// call Math.multiply
@7 // 11996
D=A // 11997
@14 // 11998
M=D // 11999
@Math.multiply // 12000
D=A // 12001
@13 // 12002
M=D // 12003
@Output.printChar.ret.4 // 12004
D=A // 12005
@CALL // 12006
0;JMP // 12007
(Output.printChar.ret.4)
@SP // 12008
AM=M-1 // 12009
D=M // 12010
@LCL // 12011
A=M+1 // 12012
A=A+1 // 12013
M=D // 12014

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
@LCL // 12015
A=M+1 // 12016
D=M // 12017
@SP // 12018
AM=M+1 // 12019
A=A-1 // 12020
M=D // 12021
@LCL // 12022
A=M+1 // 12023
D=M // 12024
@0 // 12025
A=D+A // 12026
D=M // 12027
@SP // 12028
AM=M+1 // 12029
A=A-1 // 12030
M=D // 12031
@LCL // 12032
A=M+1 // 12033
A=A+1 // 12034
D=M // 12035
@SP // 12036
AM=M-1 // 12037
D=D|M // 12038
@SP // 12039
AM=M-1 // 12040
A=M // 12041
M=D // 12042

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

@LCL // 12043
A=M+1 // 12044
A=A+1 // 12045
A=A+1 // 12046
M=M+1 // 12047

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12048
0;JMP // 12049

////LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 1"),
//        right:
//            PushInstruction("constant 63"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.printChar.IfElse2}}
@Output.printChar.EQ.4 // 12050
D=A // 12051
@SP // 12052
AM=M+1 // 12053
A=A-1 // 12054
M=D // 12055
@Output.1 // 12056
D=M // 12057
@63 // 12058
D=D-A // 12059
@DO_EQ // 12060
0;JMP // 12061
(Output.printChar.EQ.4)
D=!D // 12062
@Output.printChar.IfElse2 // 12063
D;JNE // 12064

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12065
D=A // 12066
@14 // 12067
M=D // 12068
@Output.println // 12069
D=A // 12070
@13 // 12071
M=D // 12072
@Output.printChar.ret.5 // 12073
D=A // 12074
@CALL // 12075
0;JMP // 12076
(Output.printChar.ret.5)
@SP // 12077
M=M-1 // 12078

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12079
0;JMP // 12080

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

@Output.1 // 12081
M=M+1 // 12082

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12083
AM=M+1 // 12084
A=A-1 // 12085
M=0 // 12086
@RETURN // 12087
0;JMP // 12088

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12089
M=M+1 // 12090
AM=M+1 // 12091
A=A-1 // 12092
M=0 // 12093
A=A-1 // 12094
M=0 // 12095

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12096
A=M // 12097
M=0 // 12098

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12099
A=M // 12100
D=M // 12101
@SP // 12102
AM=M+1 // 12103
A=A-1 // 12104
M=D // 12105
// call String.length
@6 // 12106
D=A // 12107
@14 // 12108
M=D // 12109
@String.length // 12110
D=A // 12111
@13 // 12112
M=D // 12113
@Output.printString.ret.0 // 12114
D=A // 12115
@CALL // 12116
0;JMP // 12117
(Output.printString.ret.0)
@SP // 12118
AM=M-1 // 12119
D=M // 12120
@LCL // 12121
A=M+1 // 12122
M=D // 12123

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Output.printString1}}
@Output.printString.LT.5 // 12124
D=A // 12125
@SP // 12126
AM=M+1 // 12127
A=A-1 // 12128
M=D // 12129
@LCL // 12130
A=M+1 // 12131
D=M // 12132
A=A-1 // 12133
D=M-D // 12134
@DO_LT // 12135
0;JMP // 12136
(Output.printString.LT.5)
D=!D // 12137
@WHILE_END_Output.printString1 // 12138
D;JNE // 12139

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12140
A=M // 12141
D=M // 12142
@SP // 12143
AM=M+1 // 12144
A=A-1 // 12145
M=D // 12146
@LCL // 12147
A=M // 12148
D=M // 12149
@SP // 12150
AM=M+1 // 12151
A=A-1 // 12152
M=D // 12153
// call String.charAt
@7 // 12154
D=A // 12155
@14 // 12156
M=D // 12157
@String.charAt // 12158
D=A // 12159
@13 // 12160
M=D // 12161
@Output.printString.ret.1 // 12162
D=A // 12163
@CALL // 12164
0;JMP // 12165
(Output.printString.ret.1)
// call Output.printChar
@6 // 12166
D=A // 12167
@14 // 12168
M=D // 12169
@Output.printChar // 12170
D=A // 12171
@13 // 12172
M=D // 12173
@Output.printString.ret.2 // 12174
D=A // 12175
@CALL // 12176
0;JMP // 12177
(Output.printString.ret.2)
@SP // 12178
M=M-1 // 12179

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

@LCL // 12180
A=M // 12181
M=M+1 // 12182

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12183
0;JMP // 12184

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12185
AM=M+1 // 12186
A=A-1 // 12187
M=0 // 12188
@RETURN // 12189
0;JMP // 12190

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12191
AM=M+1 // 12192
A=A-1 // 12193
M=0 // 12194

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12195
D=A // 12196
@SP // 12197
AM=M+1 // 12198
A=A-1 // 12199
M=D // 12200
// call String.new
@6 // 12201
D=A // 12202
@14 // 12203
M=D // 12204
@String.new // 12205
D=A // 12206
@13 // 12207
M=D // 12208
@Output.printInt.ret.0 // 12209
D=A // 12210
@CALL // 12211
0;JMP // 12212
(Output.printInt.ret.0)
@SP // 12213
AM=M-1 // 12214
D=M // 12215
@LCL // 12216
A=M // 12217
M=D // 12218

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12219
A=M // 12220
D=M // 12221
@SP // 12222
AM=M+1 // 12223
A=A-1 // 12224
M=D // 12225
@ARG // 12226
A=M // 12227
D=M // 12228
@SP // 12229
AM=M+1 // 12230
A=A-1 // 12231
M=D // 12232
// call String.setInt
@7 // 12233
D=A // 12234
@14 // 12235
M=D // 12236
@String.setInt // 12237
D=A // 12238
@13 // 12239
M=D // 12240
@Output.printInt.ret.1 // 12241
D=A // 12242
@CALL // 12243
0;JMP // 12244
(Output.printInt.ret.1)
@SP // 12245
M=M-1 // 12246

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12247
A=M // 12248
D=M // 12249
@SP // 12250
AM=M+1 // 12251
A=A-1 // 12252
M=D // 12253
// call Output.printString
@6 // 12254
D=A // 12255
@14 // 12256
M=D // 12257
@Output.printString // 12258
D=A // 12259
@13 // 12260
M=D // 12261
@Output.printInt.ret.2 // 12262
D=A // 12263
@CALL // 12264
0;JMP // 12265
(Output.printInt.ret.2)
@SP // 12266
M=M-1 // 12267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12268
A=M // 12269
D=M // 12270
@SP // 12271
AM=M+1 // 12272
A=A-1 // 12273
M=D // 12274
// call String.dispose
@6 // 12275
D=A // 12276
@14 // 12277
M=D // 12278
@String.dispose // 12279
D=A // 12280
@13 // 12281
M=D // 12282
@Output.printInt.ret.3 // 12283
D=A // 12284
@CALL // 12285
0;JMP // 12286
(Output.printInt.ret.3)
@SP // 12287
M=M-1 // 12288

////PushInstruction("constant 0")
@SP // 12289
AM=M+1 // 12290
A=A-1 // 12291
M=0 // 12292
@RETURN // 12293
0;JMP // 12294

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12295
M=0 // 12296

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 2"),
//        right:
//            PushInstruction("constant 22"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.println.IfElse1}}
@Output.println.EQ.6 // 12297
D=A // 12298
@SP // 12299
AM=M+1 // 12300
A=A-1 // 12301
M=D // 12302
@Output.2 // 12303
D=M // 12304
@22 // 12305
D=D-A // 12306
@DO_EQ // 12307
0;JMP // 12308
(Output.println.EQ.6)
D=!D // 12309
@Output.println.IfElse1 // 12310
D;JNE // 12311

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12312
M=0 // 12313

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12314
0;JMP // 12315

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

@Output.2 // 12316
M=M+1 // 12317

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12318
AM=M+1 // 12319
A=A-1 // 12320
M=0 // 12321
@RETURN // 12322
0;JMP // 12323

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.backSpace.IfElse1}}
@Output.backSpace.EQ.7 // 12324
D=A // 12325
@SP // 12326
AM=M+1 // 12327
A=A-1 // 12328
M=D // 12329
@Output.1 // 12330
D=M // 12331
@DO_EQ // 12332
0;JMP // 12333
(Output.backSpace.EQ.7)
D=!D // 12334
@Output.backSpace.IfElse1 // 12335
D;JNE // 12336

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

@Output.2 // 12337
M=M-1 // 12338

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12339
D=A // 12340
@Output.1 // 12341
M=D // 12342

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12343
0;JMP // 12344

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

@Output.1 // 12345
M=M-1 // 12346

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12347
AM=M+1 // 12348
A=A-1 // 12349
M=0 // 12350
@RETURN // 12351
0;JMP // 12352

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12353
M=-1 // 12354

////PushInstruction("constant 0")
@SP // 12355
AM=M+1 // 12356
A=A-1 // 12357
M=0 // 12358
@RETURN // 12359
0;JMP // 12360

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12361
A=M // 12362
D=M // 12363
@Screen.0 // 12364
M=D // 12365

////PushInstruction("constant 0")
@SP // 12366
AM=M+1 // 12367
A=A-1 // 12368
M=0 // 12369
@RETURN // 12370
0;JMP // 12371

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12372
M=M+1 // 12373
AM=M+1 // 12374
A=A-1 // 12375
M=0 // 12376
A=A-1 // 12377
M=0 // 12378

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

@ARG // 12379
A=M+1 // 12380
D=M // 12381
@SP // 12382
AM=M+1 // 12383
A=A-1 // 12384
M=D // 12385
@32 // 12386
D=A // 12387
@SP // 12388
AM=M+1 // 12389
A=A-1 // 12390
M=D // 12391
// call Math.multiply
@7 // 12392
D=A // 12393
@14 // 12394
M=D // 12395
@Math.multiply // 12396
D=A // 12397
@13 // 12398
M=D // 12399
@Screen.drawPixel.ret.0 // 12400
D=A // 12401
@CALL // 12402
0;JMP // 12403
(Screen.drawPixel.ret.0)
@ARG // 12404
A=M // 12405
D=M // 12406
@SP // 12407
AM=M+1 // 12408
A=A-1 // 12409
M=D // 12410
@16 // 12411
D=A // 12412
@SP // 12413
AM=M+1 // 12414
A=A-1 // 12415
M=D // 12416
// call Math.divide
@7 // 12417
D=A // 12418
@14 // 12419
M=D // 12420
@Math.divide // 12421
D=A // 12422
@13 // 12423
M=D // 12424
@Screen.drawPixel.ret.1 // 12425
D=A // 12426
@CALL // 12427
0;JMP // 12428
(Screen.drawPixel.ret.1)
@SP // 12429
AM=M-1 // 12430
D=M // 12431
@SP // 12432
AM=M-1 // 12433
D=D+M // 12434
@16384 // 12435
D=D+A // 12436
@LCL // 12437
A=M // 12438
M=D // 12439

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

@ARG // 12440
A=M // 12441
D=M // 12442
@15 // 12443
D=D&A // 12444
@LCL // 12445
A=M+1 // 12446
M=D // 12447

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawPixel.IfElse1}}
@Screen.drawPixel.EQ.0 // 12448
D=A // 12449
@SP // 12450
AM=M+1 // 12451
A=A-1 // 12452
M=D // 12453
@Screen.0 // 12454
D=M // 12455
@DO_EQ // 12456
0;JMP // 12457
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12458
D;JNE // 12459

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
@LCL // 12460
A=M // 12461
D=M // 12462
@SP // 12463
AM=M+1 // 12464
A=A-1 // 12465
M=D // 12466
@LCL // 12467
A=M // 12468
D=M // 12469
@0 // 12470
A=D+A // 12471
D=M // 12472
@SP // 12473
AM=M+1 // 12474
A=A-1 // 12475
M=D // 12476
@LCL // 12477
A=M+1 // 12478
D=M // 12479
@SP // 12480
AM=M+1 // 12481
A=A-1 // 12482
M=D // 12483
// call Math.twoToThe
@6 // 12484
D=A // 12485
@14 // 12486
M=D // 12487
@Math.twoToThe // 12488
D=A // 12489
@13 // 12490
M=D // 12491
@Screen.drawPixel.ret.2 // 12492
D=A // 12493
@CALL // 12494
0;JMP // 12495
(Screen.drawPixel.ret.2)
@SP // 12496
AM=M-1 // 12497
D=M // 12498
@SP // 12499
AM=M-1 // 12500
D=D|M // 12501
@SP // 12502
AM=M-1 // 12503
A=M // 12504
M=D // 12505

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12506
0;JMP // 12507

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
@LCL // 12508
A=M // 12509
D=M // 12510
@SP // 12511
AM=M+1 // 12512
A=A-1 // 12513
M=D // 12514
@LCL // 12515
A=M // 12516
D=M // 12517
@0 // 12518
A=D+A // 12519
D=M // 12520
@SP // 12521
AM=M+1 // 12522
A=A-1 // 12523
M=D // 12524
@LCL // 12525
A=M+1 // 12526
D=M // 12527
@SP // 12528
AM=M+1 // 12529
A=A-1 // 12530
M=D // 12531
// call Math.twoToThe
@6 // 12532
D=A // 12533
@14 // 12534
M=D // 12535
@Math.twoToThe // 12536
D=A // 12537
@13 // 12538
M=D // 12539
@Screen.drawPixel.ret.3 // 12540
D=A // 12541
@CALL // 12542
0;JMP // 12543
(Screen.drawPixel.ret.3)
@SP // 12544
AM=M-1 // 12545
D=M // 12546
D=!D // 12547
@SP // 12548
AM=M-1 // 12549
D=D&M // 12550
@SP // 12551
AM=M-1 // 12552
A=M // 12553
M=D // 12554

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12555
AM=M+1 // 12556
A=A-1 // 12557
M=0 // 12558
@RETURN // 12559
0;JMP // 12560

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12561
D=A // 12562
@SP // 12563
AM=D+M // 12564
A=A-1 // 12565
M=0 // 12566
A=A-1 // 12567
M=0 // 12568
A=A-1 // 12569
M=0 // 12570
A=A-1 // 12571
M=0 // 12572
A=A-1 // 12573
M=0 // 12574
A=A-1 // 12575
M=0 // 12576

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

@ARG // 12577
A=M+1 // 12578
A=A+1 // 12579
D=M // 12580
A=A-1 // 12581
A=A-1 // 12582
D=D-M // 12583
@SP // 12584
AM=M+1 // 12585
A=A-1 // 12586
M=D // 12587
// call Math.abs
@6 // 12588
D=A // 12589
@14 // 12590
M=D // 12591
@Math.abs // 12592
D=A // 12593
@13 // 12594
M=D // 12595
@Screen.drawLine.ret.0 // 12596
D=A // 12597
@CALL // 12598
0;JMP // 12599
(Screen.drawLine.ret.0)
@SP // 12600
AM=M-1 // 12601
D=M // 12602
@LCL // 12603
A=M // 12604
M=D // 12605

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

@ARG // 12606
A=M+1 // 12607
A=A+1 // 12608
A=A+1 // 12609
D=M // 12610
A=A-1 // 12611
A=A-1 // 12612
D=D-M // 12613
@SP // 12614
AM=M+1 // 12615
A=A-1 // 12616
M=D // 12617
// call Math.abs
@6 // 12618
D=A // 12619
@14 // 12620
M=D // 12621
@Math.abs // 12622
D=A // 12623
@13 // 12624
M=D // 12625
@Screen.drawLine.ret.1 // 12626
D=A // 12627
@CALL // 12628
0;JMP // 12629
(Screen.drawLine.ret.1)
@SP // 12630
AM=M-1 // 12631
D=M // 12632
@LCL // 12633
A=M+1 // 12634
M=D // 12635

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse1}}
@Screen.drawLine.LT.1 // 12636
D=A // 12637
@SP // 12638
AM=M+1 // 12639
A=A-1 // 12640
M=D // 12641
@ARG // 12642
A=M+1 // 12643
A=A+1 // 12644
D=M // 12645
A=A-1 // 12646
A=A-1 // 12647
D=M-D // 12648
@DO_LT // 12649
0;JMP // 12650
(Screen.drawLine.LT.1)
D=!D // 12651
@Screen.drawLine.IfElse1 // 12652
D;JNE // 12653

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12654
A=M+1 // 12655
A=A+1 // 12656
M=1 // 12657

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 12658
0;JMP // 12659

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12660
A=M+1 // 12661
A=A+1 // 12662
M=-1 // 12663

////LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("argument 3"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse2}}
@Screen.drawLine.LT.2 // 12664
D=A // 12665
@SP // 12666
AM=M+1 // 12667
A=A-1 // 12668
M=D // 12669
@ARG // 12670
A=M+1 // 12671
A=A+1 // 12672
A=A+1 // 12673
D=M // 12674
A=A-1 // 12675
A=A-1 // 12676
D=M-D // 12677
@DO_LT // 12678
0;JMP // 12679
(Screen.drawLine.LT.2)
D=!D // 12680
@Screen.drawLine.IfElse2 // 12681
D;JNE // 12682

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12683
A=M+1 // 12684
A=A+1 // 12685
A=A+1 // 12686
M=1 // 12687

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 12688
0;JMP // 12689

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12690
A=M+1 // 12691
A=A+1 // 12692
A=A+1 // 12693
M=-1 // 12694

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

@LCL // 12695
A=M+1 // 12696
D=M // 12697
A=A-1 // 12698
D=M-D // 12699
@SP // 12700
AM=M+1 // 12701
A=A-1 // 12702
M=D // 12703
@LCL // 12704
D=M // 12705
@4 // 12706
A=D+A // 12707
D=A // 12708
@R13 // 12709
M=D // 12710
@SP // 12711
AM=M-1 // 12712
D=M // 12713
@R13 // 12714
A=M // 12715
M=D // 12716

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0 // 12717
@WHILE_END_Screen.drawLine1 // 12718
D;JNE // 12719

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12720
A=M // 12721
D=M // 12722
@SP // 12723
AM=M+1 // 12724
A=A-1 // 12725
M=D // 12726
@ARG // 12727
A=M+1 // 12728
D=M // 12729
@SP // 12730
AM=M+1 // 12731
A=A-1 // 12732
M=D // 12733
// call Screen.drawPixel
@7 // 12734
D=A // 12735
@14 // 12736
M=D // 12737
@Screen.drawPixel // 12738
D=A // 12739
@13 // 12740
M=D // 12741
@Screen.drawLine.ret.2 // 12742
D=A // 12743
@CALL // 12744
0;JMP // 12745
(Screen.drawLine.ret.2)
@SP // 12746
M=M-1 // 12747

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 0"),
//                right:
//                    PushInstruction("argument 2"),
//                binaryOp: "EQ"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 1"),
//                right:
//                    PushInstruction("argument 3"),
//                binaryOp: "EQ"
//            ),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElseEND3}}
@Screen.drawLine.EQ.3 // 12748
D=A // 12749
@SP // 12750
AM=M+1 // 12751
A=A-1 // 12752
M=D // 12753
@ARG // 12754
A=M+1 // 12755
A=A+1 // 12756
D=M // 12757
A=A-1 // 12758
A=A-1 // 12759
D=M-D // 12760
@DO_EQ // 12761
0;JMP // 12762
(Screen.drawLine.EQ.3)
@SP // 12763
AM=M+1 // 12764
A=A-1 // 12765
M=D // 12766
@Screen.drawLine.EQ.4 // 12767
D=A // 12768
@SP // 12769
AM=M+1 // 12770
A=A-1 // 12771
M=D // 12772
@ARG // 12773
A=M+1 // 12774
A=A+1 // 12775
A=A+1 // 12776
D=M // 12777
A=A-1 // 12778
A=A-1 // 12779
D=M-D // 12780
@DO_EQ // 12781
0;JMP // 12782
(Screen.drawLine.EQ.4)
@SP // 12783
AM=M-1 // 12784
D=D&M // 12785
D=!D // 12786
@Screen.drawLine.IfElseEND3 // 12787
D;JNE // 12788

////PushInstruction("constant 0")
@SP // 12789
AM=M+1 // 12790
A=A-1 // 12791
M=0 // 12792
@RETURN // 12793
0;JMP // 12794

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

@LCL // 12795
D=M // 12796
@4 // 12797
A=D+A // 12798
D=M // 12799
D=D+M // 12800
@SP // 12801
AM=M+1 // 12802
A=A-1 // 12803
M=D // 12804
@LCL // 12805
D=M // 12806
@5 // 12807
A=D+A // 12808
D=A // 12809
@R13 // 12810
M=D // 12811
@SP // 12812
AM=M-1 // 12813
D=M // 12814
@R13 // 12815
A=M // 12816
M=D // 12817

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 5"),
//                right:
//                    PushInstruction("local 1"),
//                binaryOp: "ADD"
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElseEND4}}
@Screen.drawLine.GT.5 // 12818
D=A // 12819
@SP // 12820
AM=M+1 // 12821
A=A-1 // 12822
M=D // 12823
@LCL // 12824
D=M // 12825
@5 // 12826
A=D+A // 12827
D=M // 12828
@SP // 12829
AM=M+1 // 12830
A=A-1 // 12831
M=D // 12832
@LCL // 12833
A=M+1 // 12834
D=M // 12835
@SP // 12836
AM=M-1 // 12837
D=D+M // 12838
@DO_GT // 12839
0;JMP // 12840
(Screen.drawLine.GT.5)
D=!D // 12841
@Screen.drawLine.IfElseEND4 // 12842
D;JNE // 12843

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

@LCL // 12844
D=M // 12845
@4 // 12846
A=D+A // 12847
D=M // 12848
A=A-1 // 12849
A=A-1 // 12850
A=A-1 // 12851
D=D-M // 12852
@SP // 12853
AM=M+1 // 12854
A=A-1 // 12855
M=D // 12856
@LCL // 12857
D=M // 12858
@4 // 12859
A=D+A // 12860
D=A // 12861
@R13 // 12862
M=D // 12863
@SP // 12864
AM=M-1 // 12865
D=M // 12866
@R13 // 12867
A=M // 12868
M=D // 12869

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

@LCL // 12870
A=M+1 // 12871
A=A+1 // 12872
D=M // 12873
@ARG // 12874
A=M // 12875
M=D+M // 12876

////LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 5"),
//        right:
//            PushInstruction("local 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElseEND5}}
@Screen.drawLine.LT.6 // 12877
D=A // 12878
@SP // 12879
AM=M+1 // 12880
A=A-1 // 12881
M=D // 12882
@LCL // 12883
D=M // 12884
@5 // 12885
A=D+A // 12886
D=M // 12887
@SP // 12888
AM=M+1 // 12889
A=A-1 // 12890
M=D // 12891
@LCL // 12892
A=M // 12893
D=M // 12894
@SP // 12895
AM=M-1 // 12896
D=M-D // 12897
@DO_LT // 12898
0;JMP // 12899
(Screen.drawLine.LT.6)
D=!D // 12900
@Screen.drawLine.IfElseEND5 // 12901
D;JNE // 12902

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

@LCL // 12903
D=M // 12904
@4 // 12905
A=D+A // 12906
D=M // 12907
@SP // 12908
AM=M+1 // 12909
A=A-1 // 12910
M=D // 12911
@LCL // 12912
A=M // 12913
D=M // 12914
@SP // 12915
AM=M-1 // 12916
D=D+M // 12917
@SP // 12918
AM=M+1 // 12919
A=A-1 // 12920
M=D // 12921
@LCL // 12922
D=M // 12923
@4 // 12924
A=D+A // 12925
D=A // 12926
@R13 // 12927
M=D // 12928
@SP // 12929
AM=M-1 // 12930
D=M // 12931
@R13 // 12932
A=M // 12933
M=D // 12934

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

@LCL // 12935
A=M+1 // 12936
A=A+1 // 12937
A=A+1 // 12938
D=M // 12939
@ARG // 12940
A=M+1 // 12941
M=D+M // 12942

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 12943
0;JMP // 12944

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 12945
AM=M+1 // 12946
A=A-1 // 12947
M=0 // 12948
@RETURN // 12949
0;JMP // 12950

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 12951
AM=M+1 // 12952
A=A-1 // 12953
M=0 // 12954

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12955
A=M // 12956
D=M // 12957
@LCL // 12958
A=M // 12959
M=D // 12960

////LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawHorizontalLine1}}
@Screen.drawHorizontalLine.GT.7 // 12961
D=A // 12962
@SP // 12963
AM=M+1 // 12964
A=A-1 // 12965
M=D // 12966
@LCL // 12967
A=M // 12968
D=M // 12969
@SP // 12970
AM=M+1 // 12971
A=A-1 // 12972
M=D // 12973
@ARG // 12974
A=M+1 // 12975
D=M // 12976
@SP // 12977
AM=M-1 // 12978
D=M-D // 12979
@DO_GT // 12980
0;JMP // 12981
(Screen.drawHorizontalLine.GT.7)
@WHILE_END_Screen.drawHorizontalLine1 // 12982
D;JNE // 12983

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12984
A=M // 12985
D=M // 12986
@SP // 12987
AM=M+1 // 12988
A=A-1 // 12989
M=D // 12990
@ARG // 12991
A=M+1 // 12992
A=A+1 // 12993
D=M // 12994
@SP // 12995
AM=M+1 // 12996
A=A-1 // 12997
M=D // 12998
// call Screen.drawPixel
@7 // 12999
D=A // 13000
@14 // 13001
M=D // 13002
@Screen.drawPixel // 13003
D=A // 13004
@13 // 13005
M=D // 13006
@Screen.drawHorizontalLine.ret.0 // 13007
D=A // 13008
@CALL // 13009
0;JMP // 13010
(Screen.drawHorizontalLine.ret.0)
@SP // 13011
M=M-1 // 13012

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

@LCL // 13013
A=M // 13014
M=M+1 // 13015

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 13016
0;JMP // 13017

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 13018
AM=M+1 // 13019
A=A-1 // 13020
M=0 // 13021
@RETURN // 13022
0;JMP // 13023

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13024
D=A // 13025
@SP // 13026
AM=D+M // 13027
A=A-1 // 13028
M=0 // 13029
A=A-1 // 13030
M=0 // 13031
A=A-1 // 13032
M=0 // 13033
A=A-1 // 13034
M=0 // 13035
A=A-1 // 13036
M=0 // 13037

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13038
A=M // 13039
M=0 // 13040

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13041
A=M+1 // 13042
A=A+1 // 13043
D=M // 13044
@LCL // 13045
A=M+1 // 13046
M=D // 13047

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

@ARG // 13048
A=M+1 // 13049
A=A+1 // 13050
D=M // 13051
D=D-1 // 13052
D=-D // 13053
@LCL // 13054
A=M+1 // 13055
A=A+1 // 13056
M=D // 13057

////LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawCircle1}}
@Screen.drawCircle.GT.8 // 13058
D=A // 13059
@SP // 13060
AM=M+1 // 13061
A=A-1 // 13062
M=D // 13063
@LCL // 13064
A=M+1 // 13065
D=M // 13066
A=A-1 // 13067
D=M-D // 13068
@DO_GT // 13069
0;JMP // 13070
(Screen.drawCircle.GT.8)
@WHILE_END_Screen.drawCircle1 // 13071
D;JNE // 13072

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

@ARG // 13073
A=M // 13074
D=M // 13075
@SP // 13076
AM=M+1 // 13077
A=A-1 // 13078
M=D // 13079
@LCL // 13080
A=M // 13081
D=M // 13082
@SP // 13083
AM=M-1 // 13084
D=M-D // 13085
@SP // 13086
AM=M+1 // 13087
A=A-1 // 13088
M=D // 13089
@ARG // 13090
A=M // 13091
D=M // 13092
@SP // 13093
AM=M+1 // 13094
A=A-1 // 13095
M=D // 13096
@LCL // 13097
A=M // 13098
D=M // 13099
@SP // 13100
AM=M-1 // 13101
D=D+M // 13102
@SP // 13103
AM=M+1 // 13104
A=A-1 // 13105
M=D // 13106
@ARG // 13107
A=M+1 // 13108
D=M // 13109
@SP // 13110
AM=M+1 // 13111
A=A-1 // 13112
M=D // 13113
@LCL // 13114
A=M+1 // 13115
D=M // 13116
@SP // 13117
AM=M-1 // 13118
D=D+M // 13119
@SP // 13120
AM=M+1 // 13121
A=A-1 // 13122
M=D // 13123
// call Screen.drawHorizontalLine
@8 // 13124
D=A // 13125
@14 // 13126
M=D // 13127
@Screen.drawHorizontalLine // 13128
D=A // 13129
@13 // 13130
M=D // 13131
@Screen.drawCircle.ret.0 // 13132
D=A // 13133
@CALL // 13134
0;JMP // 13135
(Screen.drawCircle.ret.0)
@SP // 13136
M=M-1 // 13137

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

@ARG // 13138
A=M // 13139
D=M // 13140
@SP // 13141
AM=M+1 // 13142
A=A-1 // 13143
M=D // 13144
@LCL // 13145
A=M // 13146
D=M // 13147
@SP // 13148
AM=M-1 // 13149
D=M-D // 13150
@SP // 13151
AM=M+1 // 13152
A=A-1 // 13153
M=D // 13154
@ARG // 13155
A=M // 13156
D=M // 13157
@SP // 13158
AM=M+1 // 13159
A=A-1 // 13160
M=D // 13161
@LCL // 13162
A=M // 13163
D=M // 13164
@SP // 13165
AM=M-1 // 13166
D=D+M // 13167
@SP // 13168
AM=M+1 // 13169
A=A-1 // 13170
M=D // 13171
@ARG // 13172
A=M+1 // 13173
D=M // 13174
@SP // 13175
AM=M+1 // 13176
A=A-1 // 13177
M=D // 13178
@LCL // 13179
A=M+1 // 13180
D=M // 13181
@SP // 13182
AM=M-1 // 13183
D=M-D // 13184
@SP // 13185
AM=M+1 // 13186
A=A-1 // 13187
M=D // 13188
// call Screen.drawHorizontalLine
@8 // 13189
D=A // 13190
@14 // 13191
M=D // 13192
@Screen.drawHorizontalLine // 13193
D=A // 13194
@13 // 13195
M=D // 13196
@Screen.drawCircle.ret.1 // 13197
D=A // 13198
@CALL // 13199
0;JMP // 13200
(Screen.drawCircle.ret.1)
@SP // 13201
M=M-1 // 13202

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

@ARG // 13203
A=M // 13204
D=M // 13205
@SP // 13206
AM=M+1 // 13207
A=A-1 // 13208
M=D // 13209
@LCL // 13210
A=M+1 // 13211
D=M // 13212
@SP // 13213
AM=M-1 // 13214
D=M-D // 13215
@SP // 13216
AM=M+1 // 13217
A=A-1 // 13218
M=D // 13219
@ARG // 13220
A=M // 13221
D=M // 13222
@SP // 13223
AM=M+1 // 13224
A=A-1 // 13225
M=D // 13226
@LCL // 13227
A=M+1 // 13228
D=M // 13229
@SP // 13230
AM=M-1 // 13231
D=D+M // 13232
@SP // 13233
AM=M+1 // 13234
A=A-1 // 13235
M=D // 13236
@ARG // 13237
A=M+1 // 13238
D=M // 13239
@SP // 13240
AM=M+1 // 13241
A=A-1 // 13242
M=D // 13243
@LCL // 13244
A=M // 13245
D=M // 13246
@SP // 13247
AM=M-1 // 13248
D=D+M // 13249
@SP // 13250
AM=M+1 // 13251
A=A-1 // 13252
M=D // 13253
// call Screen.drawHorizontalLine
@8 // 13254
D=A // 13255
@14 // 13256
M=D // 13257
@Screen.drawHorizontalLine // 13258
D=A // 13259
@13 // 13260
M=D // 13261
@Screen.drawCircle.ret.2 // 13262
D=A // 13263
@CALL // 13264
0;JMP // 13265
(Screen.drawCircle.ret.2)
@SP // 13266
M=M-1 // 13267

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

@ARG // 13268
A=M // 13269
D=M // 13270
@SP // 13271
AM=M+1 // 13272
A=A-1 // 13273
M=D // 13274
@LCL // 13275
A=M+1 // 13276
D=M // 13277
@SP // 13278
AM=M-1 // 13279
D=M-D // 13280
@SP // 13281
AM=M+1 // 13282
A=A-1 // 13283
M=D // 13284
@ARG // 13285
A=M // 13286
D=M // 13287
@SP // 13288
AM=M+1 // 13289
A=A-1 // 13290
M=D // 13291
@LCL // 13292
A=M+1 // 13293
D=M // 13294
@SP // 13295
AM=M-1 // 13296
D=D+M // 13297
@SP // 13298
AM=M+1 // 13299
A=A-1 // 13300
M=D // 13301
@ARG // 13302
A=M+1 // 13303
D=M // 13304
@SP // 13305
AM=M+1 // 13306
A=A-1 // 13307
M=D // 13308
@LCL // 13309
A=M // 13310
D=M // 13311
@SP // 13312
AM=M-1 // 13313
D=M-D // 13314
@SP // 13315
AM=M+1 // 13316
A=A-1 // 13317
M=D // 13318
// call Screen.drawHorizontalLine
@8 // 13319
D=A // 13320
@14 // 13321
M=D // 13322
@Screen.drawHorizontalLine // 13323
D=A // 13324
@13 // 13325
M=D // 13326
@Screen.drawCircle.ret.3 // 13327
D=A // 13328
@CALL // 13329
0;JMP // 13330
(Screen.drawCircle.ret.3)
@SP // 13331
M=M-1 // 13332

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawCircle.IfElse1}}
@Screen.drawCircle.LT.9 // 13333
D=A // 13334
@SP // 13335
AM=M+1 // 13336
A=A-1 // 13337
M=D // 13338
@LCL // 13339
A=M+1 // 13340
A=A+1 // 13341
D=M // 13342
@DO_LT // 13343
0;JMP // 13344
(Screen.drawCircle.LT.9)
D=!D // 13345
@Screen.drawCircle.IfElse1 // 13346
D;JNE // 13347

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

@LCL // 13348
A=M+1 // 13349
A=A+1 // 13350
D=M // 13351
@SP // 13352
AM=M+1 // 13353
A=A-1 // 13354
M=D // 13355
@LCL // 13356
A=M // 13357
D=M // 13358
D=D+M // 13359
@SP // 13360
AM=M-1 // 13361
D=D+M // 13362
@3 // 13363
D=D+A // 13364
@LCL // 13365
A=M+1 // 13366
A=A+1 // 13367
M=D // 13368

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13369
0;JMP // 13370

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

@LCL // 13371
A=M+1 // 13372
A=A+1 // 13373
D=M // 13374
@SP // 13375
AM=M+1 // 13376
A=A-1 // 13377
M=D // 13378
@LCL // 13379
A=M+1 // 13380
D=M // 13381
A=A-1 // 13382
D=M-D // 13383
@R13 // 13384
M=D // 13385
D=D+M // 13386
@SP // 13387
AM=M-1 // 13388
D=D+M // 13389
@5 // 13390
D=D+A // 13391
@LCL // 13392
A=M+1 // 13393
A=A+1 // 13394
M=D // 13395

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

@LCL // 13396
A=M+1 // 13397
M=M-1 // 13398

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

@LCL // 13399
A=M // 13400
M=M+1 // 13401

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13402
0;JMP // 13403

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13404
AM=M+1 // 13405
A=A-1 // 13406
M=0 // 13407
@RETURN // 13408
0;JMP // 13409

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13410
D=A // 13411
@SP // 13412
AM=D+M // 13413
A=A-1 // 13414
M=0 // 13415
A=A-1 // 13416
M=0 // 13417
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

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13434
D=M // 13435
@9 // 13436
A=D+A // 13437
M=-1 // 13438

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElseEND1}}
@Screen.0 // 13439
D=M // 13440
@Screen.drawRectangle.IfElseEND1 // 13441
D;JNE // 13442

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13443
D=M // 13444
@9 // 13445
A=D+A // 13446
M=0 // 13447

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13448
A=M+1 // 13449
D=M // 13450
@LCL // 13451
A=M // 13452
M=D // 13453

////LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 3"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawRectangle1}}
@Screen.drawRectangle.GT.10 // 13454
D=A // 13455
@SP // 13456
AM=M+1 // 13457
A=A-1 // 13458
M=D // 13459
@LCL // 13460
A=M // 13461
D=M // 13462
@SP // 13463
AM=M+1 // 13464
A=A-1 // 13465
M=D // 13466
@ARG // 13467
A=M+1 // 13468
A=A+1 // 13469
A=A+1 // 13470
D=M // 13471
@SP // 13472
AM=M-1 // 13473
D=M-D // 13474
@DO_GT // 13475
0;JMP // 13476
(Screen.drawRectangle.GT.10)
@WHILE_END_Screen.drawRectangle1 // 13477
D;JNE // 13478

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13479
A=M // 13480
D=M // 13481
@SP // 13482
AM=M+1 // 13483
A=A-1 // 13484
M=D // 13485
@16 // 13486
D=A // 13487
@SP // 13488
AM=M+1 // 13489
A=A-1 // 13490
M=D // 13491
// call Math.divide
@7 // 13492
D=A // 13493
@14 // 13494
M=D // 13495
@Math.divide // 13496
D=A // 13497
@13 // 13498
M=D // 13499
@Screen.drawRectangle.ret.0 // 13500
D=A // 13501
@CALL // 13502
0;JMP // 13503
(Screen.drawRectangle.ret.0)
@SP // 13504
AM=M-1 // 13505
D=M // 13506
@LCL // 13507
A=M+1 // 13508
M=D // 13509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13510
A=M+1 // 13511
A=A+1 // 13512
D=M // 13513
@SP // 13514
AM=M+1 // 13515
A=A-1 // 13516
M=D // 13517
@16 // 13518
D=A // 13519
@SP // 13520
AM=M+1 // 13521
A=A-1 // 13522
M=D // 13523
// call Math.divide
@7 // 13524
D=A // 13525
@14 // 13526
M=D // 13527
@Math.divide // 13528
D=A // 13529
@13 // 13530
M=D // 13531
@Screen.drawRectangle.ret.1 // 13532
D=A // 13533
@CALL // 13534
0;JMP // 13535
(Screen.drawRectangle.ret.1)
@SP // 13536
AM=M-1 // 13537
D=M // 13538
@LCL // 13539
A=M+1 // 13540
A=A+1 // 13541
M=D // 13542

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

@ARG // 13543
A=M // 13544
D=M // 13545
@15 // 13546
D=D&A // 13547
@LCL // 13548
A=M+1 // 13549
A=A+1 // 13550
A=A+1 // 13551
M=D // 13552

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

@ARG // 13553
A=M+1 // 13554
A=A+1 // 13555
D=M // 13556
@15 // 13557
D=D&A // 13558
@SP // 13559
AM=M+1 // 13560
A=A-1 // 13561
M=D // 13562
@LCL // 13563
D=M // 13564
@4 // 13565
A=D+A // 13566
D=A // 13567
@R13 // 13568
M=D // 13569
@SP // 13570
AM=M-1 // 13571
D=M // 13572
@R13 // 13573
A=M // 13574
M=D // 13575

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13576
A=M // 13577
D=M // 13578
@SP // 13579
AM=M+1 // 13580
A=A-1 // 13581
M=D // 13582
@32 // 13583
D=A // 13584
@SP // 13585
AM=M+1 // 13586
A=A-1 // 13587
M=D // 13588
// call Math.multiply
@7 // 13589
D=A // 13590
@14 // 13591
M=D // 13592
@Math.multiply // 13593
D=A // 13594
@13 // 13595
M=D // 13596
@Screen.drawRectangle.ret.2 // 13597
D=A // 13598
@CALL // 13599
0;JMP // 13600
(Screen.drawRectangle.ret.2)
@LCL // 13601
D=M // 13602
@5 // 13603
A=D+A // 13604
D=A // 13605
@R13 // 13606
M=D // 13607
@SP // 13608
AM=M-1 // 13609
D=M // 13610
@R13 // 13611
A=M // 13612
M=D // 13613

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse2}}
@Screen.drawRectangle.EQ.11 // 13614
D=A // 13615
@SP // 13616
AM=M+1 // 13617
A=A-1 // 13618
M=D // 13619
@LCL // 13620
A=M+1 // 13621
A=A+1 // 13622
D=M // 13623
A=A-1 // 13624
D=M-D // 13625
@DO_EQ // 13626
0;JMP // 13627
(Screen.drawRectangle.EQ.11)
D=!D // 13628
@Screen.drawRectangle.IfElse2 // 13629
D;JNE // 13630

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

@LCL // 13631
D=M // 13632
@4 // 13633
A=D+A // 13634
D=M // 13635
@SP // 13636
AM=M+1 // 13637
A=A-1 // 13638
M=D+1 // 13639
// call Math.twoToThe
@6 // 13640
D=A // 13641
@14 // 13642
M=D // 13643
@Math.twoToThe // 13644
D=A // 13645
@13 // 13646
M=D // 13647
@Screen.drawRectangle.ret.3 // 13648
D=A // 13649
@CALL // 13650
0;JMP // 13651
(Screen.drawRectangle.ret.3)
@SP // 13652
AM=M-1 // 13653
D=M // 13654
D=D-1 // 13655
@SP // 13656
AM=M+1 // 13657
A=A-1 // 13658
M=D // 13659
@LCL // 13660
A=M+1 // 13661
A=A+1 // 13662
A=A+1 // 13663
D=M // 13664
@SP // 13665
AM=M+1 // 13666
A=A-1 // 13667
M=D // 13668
// call Math.twoToThe
@6 // 13669
D=A // 13670
@14 // 13671
M=D // 13672
@Math.twoToThe // 13673
D=A // 13674
@13 // 13675
M=D // 13676
@Screen.drawRectangle.ret.4 // 13677
D=A // 13678
@CALL // 13679
0;JMP // 13680
(Screen.drawRectangle.ret.4)
@SP // 13681
AM=M-1 // 13682
D=M // 13683
D=D-1 // 13684
@SP // 13685
AM=M-1 // 13686
D=M-D // 13687
@SP // 13688
AM=M+1 // 13689
A=A-1 // 13690
M=D // 13691
@LCL // 13692
D=M // 13693
@6 // 13694
A=D+A // 13695
D=A // 13696
@R13 // 13697
M=D // 13698
@SP // 13699
AM=M-1 // 13700
D=M // 13701
@R13 // 13702
A=M // 13703
M=D // 13704

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

@LCL // 13705
D=M // 13706
@5 // 13707
A=D+A // 13708
D=M // 13709
@SP // 13710
AM=M+1 // 13711
A=A-1 // 13712
M=D // 13713
@LCL // 13714
A=M+1 // 13715
D=M // 13716
@SP // 13717
AM=M-1 // 13718
D=D+M // 13719
@SP // 13720
AM=M+1 // 13721
A=A-1 // 13722
M=D // 13723
@LCL // 13724
D=M // 13725
@7 // 13726
A=D+A // 13727
D=A // 13728
@R13 // 13729
M=D // 13730
@SP // 13731
AM=M-1 // 13732
D=M // 13733
@R13 // 13734
A=M // 13735
M=D // 13736

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0 // 13737
D=!M // 13738
@Screen.drawRectangle.IfElse3 // 13739
D;JNE // 13740

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
@LCL // 13741
D=M // 13742
@7 // 13743
A=D+A // 13744
D=M // 13745
@16384 // 13746
D=D+A // 13747
@SP // 13748
AM=M+1 // 13749
A=A-1 // 13750
M=D // 13751
@LCL // 13752
D=M // 13753
@7 // 13754
A=D+A // 13755
D=M // 13756
@16384 // 13757
A=D+A // 13758
D=M // 13759
@SP // 13760
AM=M+1 // 13761
A=A-1 // 13762
M=D // 13763
@LCL // 13764
D=M // 13765
@6 // 13766
A=D+A // 13767
D=M // 13768
@SP // 13769
AM=M-1 // 13770
D=D|M // 13771
@SP // 13772
AM=M-1 // 13773
A=M // 13774
M=D // 13775

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 13776
0;JMP // 13777

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
@LCL // 13778
D=M // 13779
@7 // 13780
A=D+A // 13781
D=M // 13782
@16384 // 13783
D=D+A // 13784
@SP // 13785
AM=M+1 // 13786
A=A-1 // 13787
M=D // 13788
@LCL // 13789
D=M // 13790
@7 // 13791
A=D+A // 13792
D=M // 13793
@16384 // 13794
A=D+A // 13795
D=M // 13796
@SP // 13797
AM=M+1 // 13798
A=A-1 // 13799
M=D // 13800
@LCL // 13801
D=M // 13802
@6 // 13803
A=D+A // 13804
D=!M // 13805
@SP // 13806
AM=M-1 // 13807
D=D&M // 13808
@SP // 13809
AM=M-1 // 13810
A=M // 13811
M=D // 13812

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 13813
0;JMP // 13814

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

@LCL // 13815
A=M+1 // 13816
A=A+1 // 13817
A=A+1 // 13818
D=M // 13819
@SP // 13820
AM=M+1 // 13821
A=A-1 // 13822
M=D // 13823
// call Math.twoToThe
@6 // 13824
D=A // 13825
@14 // 13826
M=D // 13827
@Math.twoToThe // 13828
D=A // 13829
@13 // 13830
M=D // 13831
@Screen.drawRectangle.ret.5 // 13832
D=A // 13833
@CALL // 13834
0;JMP // 13835
(Screen.drawRectangle.ret.5)
@SP // 13836
AM=M-1 // 13837
D=M // 13838
D=D-1 // 13839
@SP // 13840
AM=M+1 // 13841
A=A-1 // 13842
M=D // 13843
@SP // 13844
A=M-1 // 13845
M=!D // 13846
@LCL // 13847
D=M // 13848
@6 // 13849
A=D+A // 13850
D=A // 13851
@R13 // 13852
M=D // 13853
@SP // 13854
AM=M-1 // 13855
D=M // 13856
@R13 // 13857
A=M // 13858
M=D // 13859

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

@LCL // 13860
D=M // 13861
@5 // 13862
A=D+A // 13863
D=M // 13864
@SP // 13865
AM=M+1 // 13866
A=A-1 // 13867
M=D // 13868
@LCL // 13869
A=M+1 // 13870
D=M // 13871
@SP // 13872
AM=M-1 // 13873
D=D+M // 13874
@SP // 13875
AM=M+1 // 13876
A=A-1 // 13877
M=D // 13878
@LCL // 13879
D=M // 13880
@7 // 13881
A=D+A // 13882
D=A // 13883
@R13 // 13884
M=D // 13885
@SP // 13886
AM=M-1 // 13887
D=M // 13888
@R13 // 13889
A=M // 13890
M=D // 13891

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0 // 13892
D=!M // 13893
@Screen.drawRectangle.IfElse4 // 13894
D;JNE // 13895

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
@LCL // 13896
D=M // 13897
@7 // 13898
A=D+A // 13899
D=M // 13900
@16384 // 13901
D=D+A // 13902
@SP // 13903
AM=M+1 // 13904
A=A-1 // 13905
M=D // 13906
@LCL // 13907
D=M // 13908
@7 // 13909
A=D+A // 13910
D=M // 13911
@16384 // 13912
A=D+A // 13913
D=M // 13914
@SP // 13915
AM=M+1 // 13916
A=A-1 // 13917
M=D // 13918
@LCL // 13919
D=M // 13920
@6 // 13921
A=D+A // 13922
D=M // 13923
@SP // 13924
AM=M-1 // 13925
D=D|M // 13926
@SP // 13927
AM=M-1 // 13928
A=M // 13929
M=D // 13930

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 13931
0;JMP // 13932

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
@LCL // 13933
D=M // 13934
@7 // 13935
A=D+A // 13936
D=M // 13937
@16384 // 13938
D=D+A // 13939
@SP // 13940
AM=M+1 // 13941
A=A-1 // 13942
M=D // 13943
@LCL // 13944
D=M // 13945
@7 // 13946
A=D+A // 13947
D=M // 13948
@16384 // 13949
A=D+A // 13950
D=M // 13951
@SP // 13952
AM=M+1 // 13953
A=A-1 // 13954
M=D // 13955
@LCL // 13956
D=M // 13957
@6 // 13958
A=D+A // 13959
D=!M // 13960
@SP // 13961
AM=M-1 // 13962
D=D&M // 13963
@SP // 13964
AM=M-1 // 13965
A=M // 13966
M=D // 13967

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

@LCL // 13968
A=M+1 // 13969
D=M // 13970
@SP // 13971
AM=M+1 // 13972
A=A-1 // 13973
M=D+1 // 13974
@LCL // 13975
D=M // 13976
@8 // 13977
A=D+A // 13978
D=A // 13979
@R13 // 13980
M=D // 13981
@SP // 13982
AM=M-1 // 13983
D=M // 13984
@R13 // 13985
A=M // 13986
M=D // 13987

////LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 8"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawRectangle2}}
@Screen.drawRectangle.LT.12 // 13988
D=A // 13989
@SP // 13990
AM=M+1 // 13991
A=A-1 // 13992
M=D // 13993
@LCL // 13994
D=M // 13995
@8 // 13996
A=D+A // 13997
D=M // 13998
@SP // 13999
AM=M+1 // 14000
A=A-1 // 14001
M=D // 14002
@LCL // 14003
A=M+1 // 14004
A=A+1 // 14005
D=M // 14006
@SP // 14007
AM=M-1 // 14008
D=M-D // 14009
@DO_LT // 14010
0;JMP // 14011
(Screen.drawRectangle.LT.12)
D=!D // 14012
@WHILE_END_Screen.drawRectangle2 // 14013
D;JNE // 14014

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

@LCL // 14015
D=M // 14016
@8 // 14017
A=D+A // 14018
D=M // 14019
A=A-1 // 14020
A=A-1 // 14021
A=A-1 // 14022
D=D+M // 14023
@SP // 14024
AM=M+1 // 14025
A=A-1 // 14026
M=D // 14027
@LCL // 14028
D=M // 14029
@7 // 14030
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

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14041
D=M // 14042
@7 // 14043
A=D+A // 14044
D=M // 14045
@16384 // 14046
D=D+A // 14047
@SP // 14048
AM=M+1 // 14049
A=A-1 // 14050
M=D // 14051
@LCL // 14052
D=M // 14053
@9 // 14054
A=D+A // 14055
D=M // 14056
@SP // 14057
AM=M-1 // 14058
A=M // 14059
M=D // 14060

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

@LCL // 14061
D=M // 14062
@8 // 14063
A=D+A // 14064
M=M+1 // 14065

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14066
0;JMP // 14067

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

@LCL // 14068
D=M // 14069
@4 // 14070
A=D+A // 14071
D=M // 14072
@SP // 14073
AM=M+1 // 14074
A=A-1 // 14075
M=D+1 // 14076
// call Math.twoToThe
@6 // 14077
D=A // 14078
@14 // 14079
M=D // 14080
@Math.twoToThe // 14081
D=A // 14082
@13 // 14083
M=D // 14084
@Screen.drawRectangle.ret.6 // 14085
D=A // 14086
@CALL // 14087
0;JMP // 14088
(Screen.drawRectangle.ret.6)
@SP // 14089
AM=M-1 // 14090
D=M // 14091
D=D-1 // 14092
@SP // 14093
AM=M+1 // 14094
A=A-1 // 14095
M=D // 14096
@LCL // 14097
D=M // 14098
@6 // 14099
A=D+A // 14100
D=A // 14101
@R13 // 14102
M=D // 14103
@SP // 14104
AM=M-1 // 14105
D=M // 14106
@R13 // 14107
A=M // 14108
M=D // 14109

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

@LCL // 14110
D=M // 14111
@5 // 14112
A=D+A // 14113
D=M // 14114
A=A-1 // 14115
A=A-1 // 14116
A=A-1 // 14117
D=D+M // 14118
@SP // 14119
AM=M+1 // 14120
A=A-1 // 14121
M=D // 14122
@LCL // 14123
D=M // 14124
@7 // 14125
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

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0 // 14136
D=!M // 14137
@Screen.drawRectangle.IfElse5 // 14138
D;JNE // 14139

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
@LCL // 14140
D=M // 14141
@7 // 14142
A=D+A // 14143
D=M // 14144
@16384 // 14145
D=D+A // 14146
@SP // 14147
AM=M+1 // 14148
A=A-1 // 14149
M=D // 14150
@LCL // 14151
D=M // 14152
@7 // 14153
A=D+A // 14154
D=M // 14155
@16384 // 14156
A=D+A // 14157
D=M // 14158
@SP // 14159
AM=M+1 // 14160
A=A-1 // 14161
M=D // 14162
@LCL // 14163
D=M // 14164
@6 // 14165
A=D+A // 14166
D=M // 14167
@SP // 14168
AM=M-1 // 14169
D=D|M // 14170
@SP // 14171
AM=M-1 // 14172
A=M // 14173
M=D // 14174

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14175
0;JMP // 14176

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
@LCL // 14177
D=M // 14178
@7 // 14179
A=D+A // 14180
D=M // 14181
@16384 // 14182
D=D+A // 14183
@SP // 14184
AM=M+1 // 14185
A=A-1 // 14186
M=D // 14187
@LCL // 14188
D=M // 14189
@7 // 14190
A=D+A // 14191
D=M // 14192
@16384 // 14193
A=D+A // 14194
D=M // 14195
@SP // 14196
AM=M+1 // 14197
A=A-1 // 14198
M=D // 14199
@LCL // 14200
D=M // 14201
@6 // 14202
A=D+A // 14203
D=!M // 14204
@SP // 14205
AM=M-1 // 14206
D=D&M // 14207
@SP // 14208
AM=M-1 // 14209
A=M // 14210
M=D // 14211

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

@LCL // 14212
A=M // 14213
M=M+1 // 14214

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14215
0;JMP // 14216

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14217
AM=M+1 // 14218
A=A-1 // 14219
M=0 // 14220
@RETURN // 14221
0;JMP // 14222

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14223
AM=M+1 // 14224
A=A-1 // 14225
M=0 // 14226

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14227
A=M // 14228
M=0 // 14229

////LabelInstruction{label='WHILE_START_Screen.clearScreen1}
// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 8192"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.clearScreen1}}
@Screen.clearScreen.LT.13 // 14230
D=A // 14231
@SP // 14232
AM=M+1 // 14233
A=A-1 // 14234
M=D // 14235
@LCL // 14236
A=M // 14237
D=M // 14238
@8192 // 14239
D=D-A // 14240
@DO_LT // 14241
0;JMP // 14242
(Screen.clearScreen.LT.13)
D=!D // 14243
@WHILE_END_Screen.clearScreen1 // 14244
D;JNE // 14245

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14246
A=M // 14247
D=M // 14248
@16384 // 14249
D=D+A // 14250
@SP // 14251
AM=M+1 // 14252
A=A-1 // 14253
M=D // 14254
D=0 // 14255
@SP // 14256
AM=M-1 // 14257
A=M // 14258
M=D // 14259

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

@LCL // 14260
A=M // 14261
M=M+1 // 14262

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14263
0;JMP // 14264

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14265
AM=M+1 // 14266
A=A-1 // 14267
M=0 // 14268
@RETURN // 14269
0;JMP // 14270

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14271
D=A // 14272
@SP // 14273
AM=M+1 // 14274
A=A-1 // 14275
M=D // 14276
// call Memory.alloc
@6 // 14277
D=A // 14278
@14 // 14279
M=D // 14280
@Memory.alloc // 14281
D=A // 14282
@13 // 14283
M=D // 14284
@String.new.ret.0 // 14285
D=A // 14286
@CALL // 14287
0;JMP // 14288
(String.new.ret.0)
@SP // 14289
AM=M-1 // 14290
D=M // 14291
@3 // 14292
M=D // 14293

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.new.IfElse1}}
@String.new.EQ.0 // 14294
D=A // 14295
@SP // 14296
AM=M+1 // 14297
A=A-1 // 14298
M=D // 14299
@ARG // 14300
A=M // 14301
D=M // 14302
@DO_EQ // 14303
0;JMP // 14304
(String.new.EQ.0)
D=!D // 14305
@String.new.IfElse1 // 14306
D;JNE // 14307

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14308
A=M // 14309
M=0 // 14310

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14311
0;JMP // 14312

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14313
A=M // 14314
D=M // 14315
@SP // 14316
AM=M+1 // 14317
A=A-1 // 14318
M=D // 14319
// call Array.new
@6 // 14320
D=A // 14321
@14 // 14322
M=D // 14323
@Array.new // 14324
D=A // 14325
@13 // 14326
M=D // 14327
@String.new.ret.1 // 14328
D=A // 14329
@CALL // 14330
0;JMP // 14331
(String.new.ret.1)
@SP // 14332
AM=M-1 // 14333
D=M // 14334
@THIS // 14335
A=M // 14336
M=D // 14337

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14338
A=M // 14339
D=M // 14340
@THIS // 14341
A=M+1 // 14342
A=A+1 // 14343
M=D // 14344

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14345
A=M+1 // 14346
M=0 // 14347

////PushInstruction("pointer 0")
@3 // 14348
D=M // 14349
@SP // 14350
AM=M+1 // 14351
A=A-1 // 14352
M=D // 14353
@RETURN // 14354
0;JMP // 14355

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14356
A=M // 14357
D=M // 14358
@3 // 14359
M=D // 14360

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.dispose.IfElseEND1}}
@String.dispose.EQ.1 // 14361
D=A // 14362
@SP // 14363
AM=M+1 // 14364
A=A-1 // 14365
M=D // 14366
@THIS // 14367
A=M // 14368
D=M // 14369
@DO_EQ // 14370
0;JMP // 14371
(String.dispose.EQ.1)
@String.dispose.IfElseEND1 // 14372
D;JNE // 14373

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14374
A=M // 14375
D=M // 14376
@SP // 14377
AM=M+1 // 14378
A=A-1 // 14379
M=D // 14380
// call Array.dispose
@6 // 14381
D=A // 14382
@14 // 14383
M=D // 14384
@Array.dispose // 14385
D=A // 14386
@13 // 14387
M=D // 14388
@String.dispose.ret.0 // 14389
D=A // 14390
@CALL // 14391
0;JMP // 14392
(String.dispose.ret.0)
@SP // 14393
M=M-1 // 14394

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14395
AM=M+1 // 14396
A=A-1 // 14397
M=0 // 14398
@RETURN // 14399
0;JMP // 14400

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14401
A=M // 14402
D=M // 14403
@3 // 14404
M=D // 14405

////PushInstruction("this 1")
@THIS // 14406
A=M+1 // 14407
D=M // 14408
@SP // 14409
AM=M+1 // 14410
A=A-1 // 14411
M=D // 14412
@RETURN // 14413
0;JMP // 14414

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14415
A=M // 14416
D=M // 14417
@3 // 14418
M=D // 14419

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
@THIS // 14420
A=M // 14421
D=M // 14422
@SP // 14423
AM=M+1 // 14424
A=A-1 // 14425
M=D // 14426
@ARG // 14427
A=M+1 // 14428
D=M // 14429
@SP // 14430
AM=M-1 // 14431
A=D+M // 14432
D=M // 14433
@SP // 14434
AM=M+1 // 14435
A=A-1 // 14436
M=D // 14437
@RETURN // 14438
0;JMP // 14439

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14440
A=M // 14441
D=M // 14442
@3 // 14443
M=D // 14444

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14445
A=M // 14446
D=M // 14447
@SP // 14448
AM=M+1 // 14449
A=A-1 // 14450
M=D // 14451
@ARG // 14452
A=M+1 // 14453
D=M // 14454
@SP // 14455
AM=M-1 // 14456
D=D+M // 14457
@SP // 14458
AM=M+1 // 14459
A=A-1 // 14460
M=D // 14461
@ARG // 14462
A=M+1 // 14463
A=A+1 // 14464
D=M // 14465
@SP // 14466
AM=M-1 // 14467
A=M // 14468
M=D // 14469

////PushInstruction("constant 0")
@SP // 14470
AM=M+1 // 14471
A=A-1 // 14472
M=0 // 14473
@RETURN // 14474
0;JMP // 14475

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14476
AM=M+1 // 14477
A=A-1 // 14478
M=0 // 14479

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14480
A=M // 14481
D=M // 14482
@3 // 14483
M=D // 14484

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 1"),
//        right:
//            PushInstruction("this 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.appendChar.IfElseEND1}}
@String.appendChar.EQ.2 // 14485
D=A // 14486
@SP // 14487
AM=M+1 // 14488
A=A-1 // 14489
M=D // 14490
@THIS // 14491
A=M+1 // 14492
A=A+1 // 14493
D=M // 14494
A=A-1 // 14495
D=M-D // 14496
@DO_EQ // 14497
0;JMP // 14498
(String.appendChar.EQ.2)
D=!D // 14499
@String.appendChar.IfElseEND1 // 14500
D;JNE // 14501

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

@THIS // 14502
A=M+1 // 14503
A=A+1 // 14504
D=M // 14505
D=D+M // 14506
@SP // 14507
AM=M+1 // 14508
A=A-1 // 14509
M=D // 14510
// call Array.new
@6 // 14511
D=A // 14512
@14 // 14513
M=D // 14514
@Array.new // 14515
D=A // 14516
@13 // 14517
M=D // 14518
@String.appendChar.ret.0 // 14519
D=A // 14520
@CALL // 14521
0;JMP // 14522
(String.appendChar.ret.0)
@SP // 14523
AM=M-1 // 14524
D=M // 14525
@LCL // 14526
A=M // 14527
M=D // 14528

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14529
A=M // 14530
D=M // 14531
@SP // 14532
AM=M+1 // 14533
A=A-1 // 14534
M=D // 14535
@LCL // 14536
A=M // 14537
D=M // 14538
@SP // 14539
AM=M+1 // 14540
A=A-1 // 14541
M=D // 14542
@THIS // 14543
A=M+1 // 14544
D=M // 14545
@SP // 14546
AM=M+1 // 14547
A=A-1 // 14548
M=D // 14549
// call Memory.copy
@8 // 14550
D=A // 14551
@14 // 14552
M=D // 14553
@Memory.copy // 14554
D=A // 14555
@13 // 14556
M=D // 14557
@String.appendChar.ret.1 // 14558
D=A // 14559
@CALL // 14560
0;JMP // 14561
(String.appendChar.ret.1)
@SP // 14562
M=M-1 // 14563

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14564
A=M // 14565
D=M // 14566
@SP // 14567
AM=M+1 // 14568
A=A-1 // 14569
M=D // 14570
// call Array.dispose
@6 // 14571
D=A // 14572
@14 // 14573
M=D // 14574
@Array.dispose // 14575
D=A // 14576
@13 // 14577
M=D // 14578
@String.appendChar.ret.2 // 14579
D=A // 14580
@CALL // 14581
0;JMP // 14582
(String.appendChar.ret.2)
@SP // 14583
M=M-1 // 14584

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

@THIS // 14585
A=M+1 // 14586
A=A+1 // 14587
D=M // 14588
@THIS // 14589
A=M+1 // 14590
A=A+1 // 14591
M=D+M // 14592

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14593
A=M // 14594
D=M // 14595
@THIS // 14596
A=M // 14597
M=D // 14598

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
@THIS // 14599
A=M+1 // 14600
D=M // 14601
A=A-1 // 14602
D=D+M // 14603
@SP // 14604
AM=M+1 // 14605
A=A-1 // 14606
M=D // 14607
@ARG // 14608
A=M+1 // 14609
D=M // 14610
@SP // 14611
AM=M-1 // 14612
A=M // 14613
M=D // 14614

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

@THIS // 14615
A=M+1 // 14616
M=M+1 // 14617

////PushInstruction("pointer 0")
@3 // 14618
D=M // 14619
@SP // 14620
AM=M+1 // 14621
A=A-1 // 14622
M=D // 14623
@RETURN // 14624
0;JMP // 14625

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14626
A=M // 14627
D=M // 14628
@3 // 14629
M=D // 14630

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

@THIS // 14631
A=M+1 // 14632
M=M-1 // 14633

////PushInstruction("constant 0")
@SP // 14634
AM=M+1 // 14635
A=A-1 // 14636
M=0 // 14637
@RETURN // 14638
0;JMP // 14639

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14640
M=M+1 // 14641
AM=M+1 // 14642
A=A-1 // 14643
M=0 // 14644
A=A-1 // 14645
M=0 // 14646

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14647
A=M // 14648
D=M // 14649
@3 // 14650
M=D // 14651

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14652
A=M+1 // 14653
M=1 // 14654

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14655
A=M // 14656
M=0 // 14657

////LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("this 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_String.intValue1}}
@String.intValue.LT.3 // 14658
D=A // 14659
@SP // 14660
AM=M+1 // 14661
A=A-1 // 14662
M=D // 14663
@LCL // 14664
A=M+1 // 14665
D=M // 14666
@SP // 14667
AM=M+1 // 14668
A=A-1 // 14669
M=D // 14670
@THIS // 14671
A=M+1 // 14672
D=M // 14673
@SP // 14674
AM=M-1 // 14675
D=M-D // 14676
@DO_LT // 14677
0;JMP // 14678
(String.intValue.LT.3)
D=!D // 14679
@WHILE_END_String.intValue1 // 14680
D;JNE // 14681

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

@LCL // 14682
A=M // 14683
D=M // 14684
@SP // 14685
AM=M+1 // 14686
A=A-1 // 14687
M=D // 14688
@10 // 14689
D=A // 14690
@SP // 14691
AM=M+1 // 14692
A=A-1 // 14693
M=D // 14694
// call Math.multiply
@7 // 14695
D=A // 14696
@14 // 14697
M=D // 14698
@Math.multiply // 14699
D=A // 14700
@13 // 14701
M=D // 14702
@String.intValue.ret.0 // 14703
D=A // 14704
@CALL // 14705
0;JMP // 14706
(String.intValue.ret.0)
@THIS // 14707
A=M // 14708
D=M // 14709
@SP // 14710
AM=M+1 // 14711
A=A-1 // 14712
M=D // 14713
@LCL // 14714
A=M+1 // 14715
D=M // 14716
@SP // 14717
AM=M-1 // 14718
A=D+M // 14719
D=M // 14720
@48 // 14721
D=D-A // 14722
@SP // 14723
AM=M-1 // 14724
D=D+M // 14725
@LCL // 14726
A=M // 14727
M=D // 14728

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

@LCL // 14729
A=M+1 // 14730
M=M+1 // 14731

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 14732
0;JMP // 14733

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 14734
A=M // 14735
D=M // 14736
@SP // 14737
AM=M+1 // 14738
A=A-1 // 14739
M=D // 14740
@RETURN // 14741
0;JMP // 14742

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 14743
D=A // 14744
@SP // 14745
AM=D+M // 14746
A=A-1 // 14747
M=0 // 14748
A=A-1 // 14749
M=0 // 14750
A=A-1 // 14751
M=0 // 14752
A=A-1 // 14753
M=0 // 14754
A=A-1 // 14755
M=0 // 14756
A=A-1 // 14757
M=0 // 14758

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14759
A=M // 14760
D=M // 14761
@3 // 14762
M=D // 14763

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14764
A=M+1 // 14765
M=0 // 14766

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14767
D=M // 14768
@4 // 14769
A=D+A // 14770
M=0 // 14771

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElseEND1}}
@String.setInt.EQ.4 // 14772
D=A // 14773
@SP // 14774
AM=M+1 // 14775
A=A-1 // 14776
M=D // 14777
@ARG // 14778
A=M+1 // 14779
D=M // 14780
@DO_EQ // 14781
0;JMP // 14782
(String.setInt.EQ.4)
D=!D // 14783
@String.setInt.IfElseEND1 // 14784
D;JNE // 14785

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14786
D=M // 14787
@SP // 14788
AM=M+1 // 14789
A=A-1 // 14790
M=D // 14791
@48 // 14792
D=A // 14793
@SP // 14794
AM=M+1 // 14795
A=A-1 // 14796
M=D // 14797
// call String.appendChar
@7 // 14798
D=A // 14799
@14 // 14800
M=D // 14801
@String.appendChar // 14802
D=A // 14803
@13 // 14804
M=D // 14805
@String.setInt.ret.0 // 14806
D=A // 14807
@CALL // 14808
0;JMP // 14809
(String.setInt.ret.0)
@SP // 14810
M=M-1 // 14811

////PushInstruction("constant 0")
@SP // 14812
AM=M+1 // 14813
A=A-1 // 14814
M=0 // 14815
@RETURN // 14816
0;JMP // 14817

////LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElseEND2}}
@String.setInt.LT.5 // 14818
D=A // 14819
@SP // 14820
AM=M+1 // 14821
A=A-1 // 14822
M=D // 14823
@ARG // 14824
A=M+1 // 14825
D=M // 14826
@DO_LT // 14827
0;JMP // 14828
(String.setInt.LT.5)
D=!D // 14829
@String.setInt.IfElseEND2 // 14830
D;JNE // 14831

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14832
D=M // 14833
@4 // 14834
A=D+A // 14835
M=1 // 14836

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 1"),
//                right:
//                    PushInstruction("constant 0"),
//                binaryOp: "LT"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 32767"),
//                        binaryOp: "AND"
//                    ),
//                right:
//                    PushInstruction("constant 32767"),
//                binaryOp: "EQ"
//            ),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElseEND3}}
@String.setInt.LT.6 // 14837
D=A // 14838
@SP // 14839
AM=M+1 // 14840
A=A-1 // 14841
M=D // 14842
@ARG // 14843
A=M+1 // 14844
D=M // 14845
@DO_LT // 14846
0;JMP // 14847
(String.setInt.LT.6)
@SP // 14848
AM=M+1 // 14849
A=A-1 // 14850
M=D // 14851
@String.setInt.EQ.7 // 14852
D=A // 14853
@SP // 14854
AM=M+1 // 14855
A=A-1 // 14856
M=D // 14857
@ARG // 14858
A=M+1 // 14859
D=M // 14860
@32767 // 14861
D=D&A // 14862
@32767 // 14863
D=D-A // 14864
@DO_EQ // 14865
0;JMP // 14866
(String.setInt.EQ.7)
@SP // 14867
AM=M-1 // 14868
D=D&M // 14869
D=!D // 14870
@String.setInt.IfElseEND3 // 14871
D;JNE // 14872

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14873
D=M // 14874
@SP // 14875
AM=M+1 // 14876
A=A-1 // 14877
M=D // 14878
@45 // 14879
D=A // 14880
@SP // 14881
AM=M+1 // 14882
A=A-1 // 14883
M=D // 14884
// call String.appendChar
@7 // 14885
D=A // 14886
@14 // 14887
M=D // 14888
@String.appendChar // 14889
D=A // 14890
@13 // 14891
M=D // 14892
@String.setInt.ret.1 // 14893
D=A // 14894
@CALL // 14895
0;JMP // 14896
(String.setInt.ret.1)
@SP // 14897
M=M-1 // 14898

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14899
D=M // 14900
@SP // 14901
AM=M+1 // 14902
A=A-1 // 14903
M=D // 14904
@51 // 14905
D=A // 14906
@SP // 14907
AM=M+1 // 14908
A=A-1 // 14909
M=D // 14910
// call String.appendChar
@7 // 14911
D=A // 14912
@14 // 14913
M=D // 14914
@String.appendChar // 14915
D=A // 14916
@13 // 14917
M=D // 14918
@String.setInt.ret.2 // 14919
D=A // 14920
@CALL // 14921
0;JMP // 14922
(String.setInt.ret.2)
@SP // 14923
M=M-1 // 14924

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14925
D=M // 14926
@SP // 14927
AM=M+1 // 14928
A=A-1 // 14929
M=D // 14930
@50 // 14931
D=A // 14932
@SP // 14933
AM=M+1 // 14934
A=A-1 // 14935
M=D // 14936
// call String.appendChar
@7 // 14937
D=A // 14938
@14 // 14939
M=D // 14940
@String.appendChar // 14941
D=A // 14942
@13 // 14943
M=D // 14944
@String.setInt.ret.3 // 14945
D=A // 14946
@CALL // 14947
0;JMP // 14948
(String.setInt.ret.3)
@SP // 14949
M=M-1 // 14950

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14951
D=M // 14952
@SP // 14953
AM=M+1 // 14954
A=A-1 // 14955
M=D // 14956
@55 // 14957
D=A // 14958
@SP // 14959
AM=M+1 // 14960
A=A-1 // 14961
M=D // 14962
// call String.appendChar
@7 // 14963
D=A // 14964
@14 // 14965
M=D // 14966
@String.appendChar // 14967
D=A // 14968
@13 // 14969
M=D // 14970
@String.setInt.ret.4 // 14971
D=A // 14972
@CALL // 14973
0;JMP // 14974
(String.setInt.ret.4)
@SP // 14975
M=M-1 // 14976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14977
D=M // 14978
@SP // 14979
AM=M+1 // 14980
A=A-1 // 14981
M=D // 14982
@54 // 14983
D=A // 14984
@SP // 14985
AM=M+1 // 14986
A=A-1 // 14987
M=D // 14988
// call String.appendChar
@7 // 14989
D=A // 14990
@14 // 14991
M=D // 14992
@String.appendChar // 14993
D=A // 14994
@13 // 14995
M=D // 14996
@String.setInt.ret.5 // 14997
D=A // 14998
@CALL // 14999
0;JMP // 15000
(String.setInt.ret.5)
@SP // 15001
M=M-1 // 15002

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15003
D=M // 15004
@SP // 15005
AM=M+1 // 15006
A=A-1 // 15007
M=D // 15008
@56 // 15009
D=A // 15010
@SP // 15011
AM=M+1 // 15012
A=A-1 // 15013
M=D // 15014
// call String.appendChar
@7 // 15015
D=A // 15016
@14 // 15017
M=D // 15018
@String.appendChar // 15019
D=A // 15020
@13 // 15021
M=D // 15022
@String.setInt.ret.6 // 15023
D=A // 15024
@CALL // 15025
0;JMP // 15026
(String.setInt.ret.6)
@SP // 15027
M=M-1 // 15028

////PushInstruction("constant 0")
@SP // 15029
AM=M+1 // 15030
A=A-1 // 15031
M=0 // 15032
@RETURN // 15033
0;JMP // 15034

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15035
A=M+1 // 15036
D=-M // 15037
@ARG // 15038
A=M+1 // 15039
M=D // 15040

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15041
A=M+1 // 15042
D=M // 15043
@LCL // 15044
A=M+1 // 15045
A=A+1 // 15046
M=D // 15047

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15048
A=M+1 // 15049
A=A+1 // 15050
A=A+1 // 15051
M=0 // 15052

////LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt1}}
@String.setInt.GT.8 // 15053
D=A // 15054
@SP // 15055
AM=M+1 // 15056
A=A-1 // 15057
M=D // 15058
@LCL // 15059
A=M+1 // 15060
A=A+1 // 15061
D=M // 15062
@DO_GT // 15063
0;JMP // 15064
(String.setInt.GT.8)
D=!D // 15065
@WHILE_END_String.setInt1 // 15066
D;JNE // 15067

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15068
A=M+1 // 15069
A=A+1 // 15070
D=M // 15071
@SP // 15072
AM=M+1 // 15073
A=A-1 // 15074
M=D // 15075
@10 // 15076
D=A // 15077
@SP // 15078
AM=M+1 // 15079
A=A-1 // 15080
M=D // 15081
// call Math.divide
@7 // 15082
D=A // 15083
@14 // 15084
M=D // 15085
@Math.divide // 15086
D=A // 15087
@13 // 15088
M=D // 15089
@String.setInt.ret.7 // 15090
D=A // 15091
@CALL // 15092
0;JMP // 15093
(String.setInt.ret.7)
@SP // 15094
AM=M-1 // 15095
D=M // 15096
@LCL // 15097
A=M+1 // 15098
A=A+1 // 15099
M=D // 15100

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

@LCL // 15101
A=M+1 // 15102
A=A+1 // 15103
A=A+1 // 15104
M=M+1 // 15105

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15106
0;JMP // 15107

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15108
A=M+1 // 15109
A=A+1 // 15110
A=A+1 // 15111
D=M // 15112
@SP // 15113
AM=M+1 // 15114
A=A-1 // 15115
M=D // 15116
// call Array.new
@6 // 15117
D=A // 15118
@14 // 15119
M=D // 15120
@Array.new // 15121
D=A // 15122
@13 // 15123
M=D // 15124
@String.setInt.ret.8 // 15125
D=A // 15126
@CALL // 15127
0;JMP // 15128
(String.setInt.ret.8)
@LCL // 15129
D=M // 15130
@5 // 15131
A=D+A // 15132
D=A // 15133
@R13 // 15134
M=D // 15135
@SP // 15136
AM=M-1 // 15137
D=M // 15138
@R13 // 15139
A=M // 15140
M=D // 15141

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15142
A=M+1 // 15143
M=0 // 15144

////LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt2}}
@String.setInt.GT.9 // 15145
D=A // 15146
@SP // 15147
AM=M+1 // 15148
A=A-1 // 15149
M=D // 15150
@ARG // 15151
A=M+1 // 15152
D=M // 15153
@DO_GT // 15154
0;JMP // 15155
(String.setInt.GT.9)
D=!D // 15156
@WHILE_END_String.setInt2 // 15157
D;JNE // 15158

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

@ARG // 15159
A=M+1 // 15160
D=M // 15161
@SP // 15162
AM=M+1 // 15163
A=A-1 // 15164
M=D // 15165
@ARG // 15166
A=M+1 // 15167
D=M // 15168
@SP // 15169
AM=M+1 // 15170
A=A-1 // 15171
M=D // 15172
@10 // 15173
D=A // 15174
@SP // 15175
AM=M+1 // 15176
A=A-1 // 15177
M=D // 15178
// call Math.divide
@7 // 15179
D=A // 15180
@14 // 15181
M=D // 15182
@Math.divide // 15183
D=A // 15184
@13 // 15185
M=D // 15186
@String.setInt.ret.9 // 15187
D=A // 15188
@CALL // 15189
0;JMP // 15190
(String.setInt.ret.9)
@10 // 15191
D=A // 15192
@SP // 15193
AM=M+1 // 15194
A=A-1 // 15195
M=D // 15196
// call Math.multiply
@7 // 15197
D=A // 15198
@14 // 15199
M=D // 15200
@Math.multiply // 15201
D=A // 15202
@13 // 15203
M=D // 15204
@String.setInt.ret.10 // 15205
D=A // 15206
@CALL // 15207
0;JMP // 15208
(String.setInt.ret.10)
@SP // 15209
AM=M-1 // 15210
D=M // 15211
@SP // 15212
AM=M-1 // 15213
D=M-D // 15214
@LCL // 15215
A=M // 15216
M=D // 15217

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
@LCL // 15218
D=M // 15219
@5 // 15220
A=D+A // 15221
D=M // 15222
@SP // 15223
AM=M+1 // 15224
A=A-1 // 15225
M=D // 15226
@LCL // 15227
A=M+1 // 15228
D=M // 15229
@SP // 15230
AM=M-1 // 15231
D=D+M // 15232
@SP // 15233
AM=M+1 // 15234
A=A-1 // 15235
M=D // 15236
@LCL // 15237
A=M // 15238
D=M // 15239
@48 // 15240
D=D+A // 15241
@SP // 15242
AM=M-1 // 15243
A=M // 15244
M=D // 15245

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15246
A=M+1 // 15247
D=M // 15248
@SP // 15249
AM=M+1 // 15250
A=A-1 // 15251
M=D // 15252
@10 // 15253
D=A // 15254
@SP // 15255
AM=M+1 // 15256
A=A-1 // 15257
M=D // 15258
// call Math.divide
@7 // 15259
D=A // 15260
@14 // 15261
M=D // 15262
@Math.divide // 15263
D=A // 15264
@13 // 15265
M=D // 15266
@String.setInt.ret.11 // 15267
D=A // 15268
@CALL // 15269
0;JMP // 15270
(String.setInt.ret.11)
@SP // 15271
AM=M-1 // 15272
D=M // 15273
@ARG // 15274
A=M+1 // 15275
M=D // 15276

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

@LCL // 15277
A=M+1 // 15278
M=M+1 // 15279

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15280
0;JMP // 15281

////LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 4"),
//        right:
//            PushInstruction("constant 1"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElseEND4}}
@String.setInt.EQ.10 // 15282
D=A // 15283
@SP // 15284
AM=M+1 // 15285
A=A-1 // 15286
M=D // 15287
@LCL // 15288
D=M // 15289
@4 // 15290
A=D+A // 15291
D=M // 15292
D=D-1 // 15293
@DO_EQ // 15294
0;JMP // 15295
(String.setInt.EQ.10)
D=!D // 15296
@String.setInt.IfElseEND4 // 15297
D;JNE // 15298

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15299
D=M // 15300
@SP // 15301
AM=M+1 // 15302
A=A-1 // 15303
M=D // 15304
@45 // 15305
D=A // 15306
@SP // 15307
AM=M+1 // 15308
A=A-1 // 15309
M=D // 15310
// call String.appendChar
@7 // 15311
D=A // 15312
@14 // 15313
M=D // 15314
@String.appendChar // 15315
D=A // 15316
@13 // 15317
M=D // 15318
@String.setInt.ret.12 // 15319
D=A // 15320
@CALL // 15321
0;JMP // 15322
(String.setInt.ret.12)
@SP // 15323
M=M-1 // 15324

////LabelInstruction{label='String.setInt.IfElseEND4}
// label String.setInt.IfElseEND4
(String.setInt.IfElseEND4)

////LabelInstruction{label='WHILE_START_String.setInt3}
// label WHILE_START_String.setInt3
(WHILE_START_String.setInt3)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_String.setInt3}}
@String.setInt.GT.11 // 15325
D=A // 15326
@SP // 15327
AM=M+1 // 15328
A=A-1 // 15329
M=D // 15330
@LCL // 15331
A=M+1 // 15332
D=M // 15333
@DO_GT // 15334
0;JMP // 15335
(String.setInt.GT.11)
D=!D // 15336
@WHILE_END_String.setInt3 // 15337
D;JNE // 15338

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

@LCL // 15339
A=M+1 // 15340
M=M-1 // 15341

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

@3 // 15342
D=M // 15343
@SP // 15344
AM=M+1 // 15345
A=A-1 // 15346
M=D // 15347
@LCL // 15348
D=M // 15349
@5 // 15350
A=D+A // 15351
D=M // 15352
@SP // 15353
AM=M+1 // 15354
A=A-1 // 15355
M=D // 15356
@LCL // 15357
A=M+1 // 15358
D=M // 15359
@SP // 15360
AM=M-1 // 15361
A=D+M // 15362
D=M // 15363
@SP // 15364
AM=M+1 // 15365
A=A-1 // 15366
M=D // 15367
// call String.appendChar
@7 // 15368
D=A // 15369
@14 // 15370
M=D // 15371
@String.appendChar // 15372
D=A // 15373
@13 // 15374
M=D // 15375
@String.setInt.ret.13 // 15376
D=A // 15377
@CALL // 15378
0;JMP // 15379
(String.setInt.ret.13)
@SP // 15380
M=M-1 // 15381

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 15382
0;JMP // 15383

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15384
D=M // 15385
@5 // 15386
A=D+A // 15387
D=M // 15388
@SP // 15389
AM=M+1 // 15390
A=A-1 // 15391
M=D // 15392
// call Array.dispose
@6 // 15393
D=A // 15394
@14 // 15395
M=D // 15396
@Array.dispose // 15397
D=A // 15398
@13 // 15399
M=D // 15400
@String.setInt.ret.14 // 15401
D=A // 15402
@CALL // 15403
0;JMP // 15404
(String.setInt.ret.14)
@SP // 15405
M=M-1 // 15406

////PushInstruction("constant 0")
@SP // 15407
AM=M+1 // 15408
A=A-1 // 15409
M=0 // 15410
@RETURN // 15411
0;JMP // 15412

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15413
D=A // 15414
@SP // 15415
AM=M+1 // 15416
A=A-1 // 15417
M=D // 15418
@RETURN // 15419
0;JMP // 15420

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15421
D=A // 15422
@SP // 15423
AM=M+1 // 15424
A=A-1 // 15425
M=D // 15426
@RETURN // 15427
0;JMP // 15428

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15429
D=A // 15430
@SP // 15431
AM=M+1 // 15432
A=A-1 // 15433
M=D // 15434
@RETURN // 15435
0;JMP // 15436

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15437
D=A // 15438
@14 // 15439
M=D // 15440
@Memory.init // 15441
D=A // 15442
@13 // 15443
M=D // 15444
@Sys.init.ret.0 // 15445
D=A // 15446
@CALL // 15447
0;JMP // 15448
(Sys.init.ret.0)
@SP // 15449
M=M-1 // 15450

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15451
D=A // 15452
@14 // 15453
M=D // 15454
@Math.init // 15455
D=A // 15456
@13 // 15457
M=D // 15458
@Sys.init.ret.1 // 15459
D=A // 15460
@CALL // 15461
0;JMP // 15462
(Sys.init.ret.1)
@SP // 15463
M=M-1 // 15464

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15465
D=A // 15466
@14 // 15467
M=D // 15468
@Screen.init // 15469
D=A // 15470
@13 // 15471
M=D // 15472
@Sys.init.ret.2 // 15473
D=A // 15474
@CALL // 15475
0;JMP // 15476
(Sys.init.ret.2)
@SP // 15477
M=M-1 // 15478

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15479
D=A // 15480
@14 // 15481
M=D // 15482
@Output.init // 15483
D=A // 15484
@13 // 15485
M=D // 15486
@Sys.init.ret.3 // 15487
D=A // 15488
@CALL // 15489
0;JMP // 15490
(Sys.init.ret.3)
@SP // 15491
M=M-1 // 15492

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15493
D=A // 15494
@14 // 15495
M=D // 15496
@Keyboard.init // 15497
D=A // 15498
@13 // 15499
M=D // 15500
@Sys.init.ret.4 // 15501
D=A // 15502
@CALL // 15503
0;JMP // 15504
(Sys.init.ret.4)
@SP // 15505
M=M-1 // 15506

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15507
D=A // 15508
@14 // 15509
M=D // 15510
@Main.main // 15511
D=A // 15512
@13 // 15513
M=D // 15514
@Sys.init.ret.5 // 15515
D=A // 15516
@CALL // 15517
0;JMP // 15518
(Sys.init.ret.5)
@SP // 15519
M=M-1 // 15520

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15521
D=A // 15522
@14 // 15523
M=D // 15524
@Sys.halt // 15525
D=A // 15526
@13 // 15527
M=D // 15528
@Sys.init.ret.6 // 15529
D=A // 15530
@CALL // 15531
0;JMP // 15532
(Sys.init.ret.6)
@SP // 15533
M=M-1 // 15534

////PushInstruction("constant 0")
@SP // 15535
AM=M+1 // 15536
A=A-1 // 15537
M=0 // 15538
@RETURN // 15539
0;JMP // 15540

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0 // 15541
@WHILE_END_Sys.halt1 // 15542
D;JNE // 15543

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15544
0;JMP // 15545

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15546
AM=M+1 // 15547
A=A-1 // 15548
M=0 // 15549
@RETURN // 15550
0;JMP // 15551

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15552
AM=M+1 // 15553
A=A-1 // 15554
M=0 // 15555

////LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.wait1}}
@Sys.wait.GT.0 // 15556
D=A // 15557
@SP // 15558
AM=M+1 // 15559
A=A-1 // 15560
M=D // 15561
@ARG // 15562
A=M // 15563
D=M // 15564
@DO_GT // 15565
0;JMP // 15566
(Sys.wait.GT.0)
D=!D // 15567
@WHILE_END_Sys.wait1 // 15568
D;JNE // 15569

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

@ARG // 15570
A=M // 15571
M=M-1 // 15572

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15573
D=A // 15574
@LCL // 15575
A=M // 15576
M=D // 15577

////LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.wait2}}
@Sys.wait.GT.1 // 15578
D=A // 15579
@SP // 15580
AM=M+1 // 15581
A=A-1 // 15582
M=D // 15583
@LCL // 15584
A=M // 15585
D=M // 15586
@DO_GT // 15587
0;JMP // 15588
(Sys.wait.GT.1)
D=!D // 15589
@WHILE_END_Sys.wait2 // 15590
D;JNE // 15591

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

@LCL // 15592
A=M // 15593
M=M-1 // 15594

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15595
0;JMP // 15596

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15597
0;JMP // 15598

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15599
AM=M+1 // 15600
A=A-1 // 15601
M=0 // 15602
@RETURN // 15603
0;JMP // 15604

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15605
A=M // 15606
D=M // 15607
@SP // 15608
AM=M+1 // 15609
A=A-1 // 15610
M=D // 15611
// call Output.printInt
@6 // 15612
D=A // 15613
@14 // 15614
M=D // 15615
@Output.printInt // 15616
D=A // 15617
@13 // 15618
M=D // 15619
@Sys.error.ret.0 // 15620
D=A // 15621
@CALL // 15622
0;JMP // 15623
(Sys.error.ret.0)
@SP // 15624
M=M-1 // 15625

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15626
D=A // 15627
@14 // 15628
M=D // 15629
@Output.println // 15630
D=A // 15631
@13 // 15632
M=D // 15633
@Sys.error.ret.1 // 15634
D=A // 15635
@CALL // 15636
0;JMP // 15637
(Sys.error.ret.1)
@SP // 15638
M=M-1 // 15639

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15640
D=A // 15641
@14 // 15642
M=D // 15643
@Sys.halt // 15644
D=A // 15645
@13 // 15646
M=D // 15647
@Sys.error.ret.2 // 15648
D=A // 15649
@CALL // 15650
0;JMP // 15651
(Sys.error.ret.2)
@SP // 15652
M=M-1 // 15653

////PushInstruction("constant 0")
@SP // 15654
AM=M+1 // 15655
A=A-1 // 15656
M=0 // 15657
@RETURN // 15658
0;JMP // 15659

