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
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse1}}
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
@Math.multiply.IfElse1 // 1001
D;JNE // 1002

////PushInstruction("constant 0")
@SP // 1003
AM=M+1 // 1004
A=A-1 // 1005
M=0 // 1006
@RETURN // 1007
0;JMP // 1008

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 1009
0;JMP // 1010

////LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)

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
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse2}}
@Math.multiply.EQ.3 // 1011
D=A // 1012
@SP // 1013
AM=M+1 // 1014
A=A-1 // 1015
M=D // 1016
@ARG // 1017
A=M // 1018
D=M // 1019
D=D-1 // 1020
@DO_EQ // 1021
0;JMP // 1022
(Math.multiply.EQ.3)
D=!D // 1023
@Math.multiply.IfElse2 // 1024
D;JNE // 1025

////PushInstruction("argument 1")
@ARG // 1026
A=M+1 // 1027
D=M // 1028
@SP // 1029
AM=M+1 // 1030
A=A-1 // 1031
M=D // 1032
@RETURN // 1033
0;JMP // 1034

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 1035
0;JMP // 1036

////LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)

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
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse3}}
@Math.multiply.EQ.4 // 1037
D=A // 1038
@SP // 1039
AM=M+1 // 1040
A=A-1 // 1041
M=D // 1042
@ARG // 1043
A=M+1 // 1044
D=M // 1045
D=D-1 // 1046
@DO_EQ // 1047
0;JMP // 1048
(Math.multiply.EQ.4)
D=!D // 1049
@Math.multiply.IfElse3 // 1050
D;JNE // 1051

////PushInstruction("argument 0")
@ARG // 1052
A=M // 1053
D=M // 1054
@SP // 1055
AM=M+1 // 1056
A=A-1 // 1057
M=D // 1058
@RETURN // 1059
0;JMP // 1060

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 1061
0;JMP // 1062

////LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)

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
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse4}}
@Math.multiply.EQ.5 // 1063
D=A // 1064
@SP // 1065
AM=M+1 // 1066
A=A-1 // 1067
M=D // 1068
@ARG // 1069
A=M // 1070
D=M // 1071
@2 // 1072
D=D-A // 1073
@DO_EQ // 1074
0;JMP // 1075
(Math.multiply.EQ.5)
D=!D // 1076
@Math.multiply.IfElse4 // 1077
D;JNE // 1078

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1079
A=M+1 // 1080
D=M // 1081
D=D+M // 1082
@SP // 1083
AM=M+1 // 1084
A=A-1 // 1085
M=D // 1086
@RETURN // 1087
0;JMP // 1088

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 1089
0;JMP // 1090

////LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)

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
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse5}}
@Math.multiply.EQ.6 // 1091
D=A // 1092
@SP // 1093
AM=M+1 // 1094
A=A-1 // 1095
M=D // 1096
@ARG // 1097
A=M+1 // 1098
D=M // 1099
@2 // 1100
D=D-A // 1101
@DO_EQ // 1102
0;JMP // 1103
(Math.multiply.EQ.6)
D=!D // 1104
@Math.multiply.IfElse5 // 1105
D;JNE // 1106

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1107
A=M // 1108
D=M // 1109
D=D+M // 1110
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=D // 1114
@RETURN // 1115
0;JMP // 1116

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 1117
0;JMP // 1118

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

@LCL // 1119
A=M+1 // 1120
A=A+1 // 1121
M=1 // 1122

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1123
A=M+1 // 1124
M=0 // 1125

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
@Math.multiply.LT.7 // 1126
D=A // 1127
@SP // 1128
AM=M+1 // 1129
A=A-1 // 1130
M=D // 1131
@LCL // 1132
A=M+1 // 1133
D=M // 1134
@16 // 1135
D=D-A // 1136
@DO_LT // 1137
0;JMP // 1138
(Math.multiply.LT.7)
D=!D // 1139
@WHILE_END_Math.multiply1 // 1140
D;JNE // 1141

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse6}}
@ARG // 1142
A=M+1 // 1143
D=M // 1144
@SP // 1145
AM=M+1 // 1146
A=A-1 // 1147
M=D // 1148
@LCL // 1149
A=M+1 // 1150
A=A+1 // 1151
D=M // 1152
@SP // 1153
AM=M-1 // 1154
D=D&M // 1155
D=!D // 1156
@Math.multiply.IfElse6 // 1157
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

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 1165
0;JMP // 1166

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

@ARG // 1167
A=M // 1168
D=M // 1169
@ARG // 1170
A=M // 1171
M=D+M // 1172

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

@LCL // 1173
A=M+1 // 1174
M=M+1 // 1175

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

@LCL // 1176
A=M+1 // 1177
A=A+1 // 1178
D=M // 1179
@LCL // 1180
A=M+1 // 1181
A=A+1 // 1182
M=D+M // 1183

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1184
0;JMP // 1185

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1186
A=M // 1187
D=M // 1188
@SP // 1189
AM=M+1 // 1190
A=A-1 // 1191
M=D // 1192
@RETURN // 1193
0;JMP // 1194

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1195
D=A // 1196
@SP // 1197
AM=D+M // 1198
A=A-1 // 1199
M=0 // 1200
A=A-1 // 1201
M=0 // 1202
A=A-1 // 1203
M=0 // 1204

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1205
A=M // 1206
D=M // 1207
@SP // 1208
AM=M+1 // 1209
A=A-1 // 1210
M=D // 1211
// call Math.abs
@6 // 1212
D=A // 1213
@14 // 1214
M=D // 1215
@Math.abs // 1216
D=A // 1217
@13 // 1218
M=D // 1219
@Math.divide.ret.0 // 1220
D=A // 1221
@CALL // 1222
0;JMP // 1223
(Math.divide.ret.0)
@SP // 1224
AM=M-1 // 1225
D=M // 1226
@LCL // 1227
A=M+1 // 1228
M=D // 1229

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1230
A=M+1 // 1231
D=M // 1232
@SP // 1233
AM=M+1 // 1234
A=A-1 // 1235
M=D // 1236
// call Math.abs
@6 // 1237
D=A // 1238
@14 // 1239
M=D // 1240
@Math.abs // 1241
D=A // 1242
@13 // 1243
M=D // 1244
@Math.divide.ret.1 // 1245
D=A // 1246
@CALL // 1247
0;JMP // 1248
(Math.divide.ret.1)
@SP // 1249
AM=M-1 // 1250
D=M // 1251
@LCL // 1252
A=M+1 // 1253
A=A+1 // 1254
M=D // 1255

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElse1}}
@Math.divide.GT.8 // 1256
D=A // 1257
@SP // 1258
AM=M+1 // 1259
A=A-1 // 1260
M=D // 1261
@LCL // 1262
A=M+1 // 1263
A=A+1 // 1264
D=M // 1265
A=A-1 // 1266
D=D-M // 1267
@DO_GT // 1268
0;JMP // 1269
(Math.divide.GT.8)
D=!D // 1270
@Math.divide.IfElse1 // 1271
D;JNE // 1272

////PushInstruction("constant 0")
@SP // 1273
AM=M+1 // 1274
A=A-1 // 1275
M=0 // 1276
@RETURN // 1277
0;JMP // 1278

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 1279
0;JMP // 1280

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

@LCL // 1281
A=M+1 // 1282
D=M // 1283
@SP // 1284
AM=M+1 // 1285
A=A-1 // 1286
M=D // 1287
@LCL // 1288
A=M+1 // 1289
A=A+1 // 1290
D=M // 1291
D=D+M // 1292
@SP // 1293
AM=M+1 // 1294
A=A-1 // 1295
M=D // 1296
// call Math.divide
@7 // 1297
D=A // 1298
@14 // 1299
M=D // 1300
@Math.divide // 1301
D=A // 1302
@13 // 1303
M=D // 1304
@Math.divide.ret.2 // 1305
D=A // 1306
@CALL // 1307
0;JMP // 1308
(Math.divide.ret.2)
@SP // 1309
AM=M-1 // 1310
D=M // 1311
@LCL // 1312
A=M // 1313
M=D // 1314

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
@Math.divide.LT.9 // 1315
D=A // 1316
@SP // 1317
AM=M+1 // 1318
A=A-1 // 1319
M=D // 1320
@LCL // 1321
A=M+1 // 1322
D=M // 1323
@SP // 1324
AM=M+1 // 1325
A=A-1 // 1326
M=D // 1327
@LCL // 1328
A=M // 1329
D=M // 1330
D=D+M // 1331
@SP // 1332
AM=M+1 // 1333
A=A-1 // 1334
M=D // 1335
@LCL // 1336
A=M+1 // 1337
A=A+1 // 1338
D=M // 1339
@SP // 1340
AM=M+1 // 1341
A=A-1 // 1342
M=D // 1343
// call Math.multiply
@7 // 1344
D=A // 1345
@14 // 1346
M=D // 1347
@Math.multiply // 1348
D=A // 1349
@13 // 1350
M=D // 1351
@Math.divide.ret.3 // 1352
D=A // 1353
@CALL // 1354
0;JMP // 1355
(Math.divide.ret.3)
@SP // 1356
AM=M-1 // 1357
D=M // 1358
@SP // 1359
AM=M-1 // 1360
D=M-D // 1361
@SP // 1362
AM=M+1 // 1363
A=A-1 // 1364
M=D // 1365
@LCL // 1366
A=M+1 // 1367
A=A+1 // 1368
D=M // 1369
@SP // 1370
AM=M-1 // 1371
D=M-D // 1372
@DO_LT // 1373
0;JMP // 1374
(Math.divide.LT.9)
D=!D // 1375
@Math.divide.IfElse2 // 1376
D;JNE // 1377

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
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElse3}}
@Math.divide.GT.10 // 1378
D=A // 1379
@SP // 1380
AM=M+1 // 1381
A=A-1 // 1382
M=D // 1383
@Math.divide.LT.11 // 1384
D=A // 1385
@SP // 1386
AM=M+1 // 1387
A=A-1 // 1388
M=D // 1389
@ARG // 1390
A=M // 1391
D=M // 1392
@DO_LT // 1393
0;JMP // 1394
(Math.divide.LT.11)
@SP // 1395
AM=M+1 // 1396
A=A-1 // 1397
M=D // 1398
@ARG // 1399
A=M+1 // 1400
D=M // 1401
@SP // 1402
AM=M-1 // 1403
D=D&M // 1404
@DO_GT // 1405
0;JMP // 1406
(Math.divide.GT.10)
@SP // 1407
AM=M+1 // 1408
A=A-1 // 1409
M=D // 1410
@Math.divide.LT.12 // 1411
D=A // 1412
@SP // 1413
AM=M+1 // 1414
A=A-1 // 1415
M=D // 1416
@Math.divide.GT.13 // 1417
D=A // 1418
@SP // 1419
AM=M+1 // 1420
A=A-1 // 1421
M=D // 1422
@ARG // 1423
A=M // 1424
D=M // 1425
@DO_GT // 1426
0;JMP // 1427
(Math.divide.GT.13)
@SP // 1428
AM=M+1 // 1429
A=A-1 // 1430
M=D // 1431
@ARG // 1432
A=M+1 // 1433
D=M // 1434
@SP // 1435
AM=M-1 // 1436
D=D&M // 1437
@DO_LT // 1438
0;JMP // 1439
(Math.divide.LT.12)
@SP // 1440
AM=M-1 // 1441
D=D|M // 1442
D=!D // 1443
@Math.divide.IfElse3 // 1444
D;JNE // 1445

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1446
A=M // 1447
D=-M // 1448
@LCL // 1449
A=M // 1450
M=D // 1451

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 1452
0;JMP // 1453

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
@LCL // 1454
A=M // 1455
D=M // 1456
D=D+M // 1457
@SP // 1458
AM=M+1 // 1459
A=A-1 // 1460
M=D // 1461
@RETURN // 1462
0;JMP // 1463

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1464
0;JMP // 1465

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
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElse4}}
@Math.divide.GT.14 // 1466
D=A // 1467
@SP // 1468
AM=M+1 // 1469
A=A-1 // 1470
M=D // 1471
@Math.divide.LT.15 // 1472
D=A // 1473
@SP // 1474
AM=M+1 // 1475
A=A-1 // 1476
M=D // 1477
@ARG // 1478
A=M // 1479
D=M // 1480
@DO_LT // 1481
0;JMP // 1482
(Math.divide.LT.15)
@SP // 1483
AM=M+1 // 1484
A=A-1 // 1485
M=D // 1486
@ARG // 1487
A=M+1 // 1488
D=M // 1489
@SP // 1490
AM=M-1 // 1491
D=D&M // 1492
@DO_GT // 1493
0;JMP // 1494
(Math.divide.GT.14)
@SP // 1495
AM=M+1 // 1496
A=A-1 // 1497
M=D // 1498
@Math.divide.LT.16 // 1499
D=A // 1500
@SP // 1501
AM=M+1 // 1502
A=A-1 // 1503
M=D // 1504
@Math.divide.GT.17 // 1505
D=A // 1506
@SP // 1507
AM=M+1 // 1508
A=A-1 // 1509
M=D // 1510
@ARG // 1511
A=M // 1512
D=M // 1513
@DO_GT // 1514
0;JMP // 1515
(Math.divide.GT.17)
@SP // 1516
AM=M+1 // 1517
A=A-1 // 1518
M=D // 1519
@ARG // 1520
A=M+1 // 1521
D=M // 1522
@SP // 1523
AM=M-1 // 1524
D=D&M // 1525
@DO_LT // 1526
0;JMP // 1527
(Math.divide.LT.16)
@SP // 1528
AM=M-1 // 1529
D=D|M // 1530
D=!D // 1531
@Math.divide.IfElse4 // 1532
D;JNE // 1533

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1534
A=M // 1535
D=-M // 1536
@LCL // 1537
A=M // 1538
M=D // 1539

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 1540
0;JMP // 1541

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
@LCL // 1542
A=M // 1543
D=M // 1544
D=D+M // 1545
D=D+1 // 1546
@SP // 1547
AM=M+1 // 1548
A=A-1 // 1549
M=D // 1550
@RETURN // 1551
0;JMP // 1552

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
@ARG // 1553
A=M // 1554
D=M // 1555
@SP // 1556
AM=M+1 // 1557
A=A-1 // 1558
M=D // 1559
@ARG // 1560
A=M // 1561
D=M // 1562
@SP // 1563
AM=M+1 // 1564
A=A-1 // 1565
M=D // 1566
@ARG // 1567
A=M+1 // 1568
D=M // 1569
@SP // 1570
AM=M+1 // 1571
A=A-1 // 1572
M=D // 1573
// call Math.divide
@7 // 1574
D=A // 1575
@14 // 1576
M=D // 1577
@Math.divide // 1578
D=A // 1579
@13 // 1580
M=D // 1581
@Math.mod.ret.0 // 1582
D=A // 1583
@CALL // 1584
0;JMP // 1585
(Math.mod.ret.0)
@ARG // 1586
A=M+1 // 1587
D=M // 1588
@SP // 1589
AM=M+1 // 1590
A=A-1 // 1591
M=D // 1592
// call Math.multiply
@7 // 1593
D=A // 1594
@14 // 1595
M=D // 1596
@Math.multiply // 1597
D=A // 1598
@13 // 1599
M=D // 1600
@Math.mod.ret.1 // 1601
D=A // 1602
@CALL // 1603
0;JMP // 1604
(Math.mod.ret.1)
@SP // 1605
AM=M-1 // 1606
D=M // 1607
@SP // 1608
AM=M-1 // 1609
D=M-D // 1610
@SP // 1611
AM=M+1 // 1612
A=A-1 // 1613
M=D // 1614
@RETURN // 1615
0;JMP // 1616

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
@Math.0 // 1617
D=M // 1618
@SP // 1619
AM=M+1 // 1620
A=A-1 // 1621
M=D // 1622
@ARG // 1623
A=M // 1624
D=M // 1625
@SP // 1626
AM=M-1 // 1627
A=D+M // 1628
D=M // 1629
@SP // 1630
AM=M+1 // 1631
A=A-1 // 1632
M=D // 1633
@RETURN // 1634
0;JMP // 1635

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1636
D=A // 1637
@SP // 1638
AM=D+M // 1639
A=A-1 // 1640
M=0 // 1641
A=A-1 // 1642
M=0 // 1643
A=A-1 // 1644
M=0 // 1645
A=A-1 // 1646
M=0 // 1647

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1648
A=M // 1649
M=0 // 1650

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1651
D=A // 1652
@LCL // 1653
A=M+1 // 1654
M=D // 1655

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
@Math.sqrt.LT.18 // 1656
D=A // 1657
@SP // 1658
AM=M+1 // 1659
A=A-1 // 1660
M=D // 1661
@LCL // 1662
A=M+1 // 1663
D=M // 1664
@DO_LT // 1665
0;JMP // 1666
(Math.sqrt.LT.18)
@WHILE_END_Math.sqrt1 // 1667
D;JNE // 1668

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

@LCL // 1669
A=M // 1670
D=M // 1671
@SP // 1672
AM=M+1 // 1673
A=A-1 // 1674
M=D // 1675
@Math.0 // 1676
D=M // 1677
@SP // 1678
AM=M+1 // 1679
A=A-1 // 1680
M=D // 1681
@LCL // 1682
A=M+1 // 1683
D=M // 1684
@SP // 1685
AM=M-1 // 1686
A=D+M // 1687
D=M // 1688
@SP // 1689
AM=M-1 // 1690
D=D+M // 1691
@LCL // 1692
A=M+1 // 1693
A=A+1 // 1694
M=D // 1695

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1696
D=A // 1697
@SP // 1698
M=D+M // 1699
@LCL // 1700
A=M+1 // 1701
A=A+1 // 1702
D=M // 1703
@SP // 1704
A=M-1 // 1705
M=D // 1706
A=A-1 // 1707
M=D // 1708
// call Math.multiply
@7 // 1709
D=A // 1710
@14 // 1711
M=D // 1712
@Math.multiply // 1713
D=A // 1714
@13 // 1715
M=D // 1716
@Math.sqrt.ret.0 // 1717
D=A // 1718
@CALL // 1719
0;JMP // 1720
(Math.sqrt.ret.0)
@SP // 1721
AM=M-1 // 1722
D=M // 1723
@LCL // 1724
A=M+1 // 1725
A=A+1 // 1726
A=A+1 // 1727
M=D // 1728

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
//NOT), ifGoto=IfGotoInstruction{label='Math.sqrt.IfElse1}}
@Math.sqrt.GT.19 // 1729
D=A // 1730
@SP // 1731
AM=M+1 // 1732
A=A-1 // 1733
M=D // 1734
@LCL // 1735
A=M+1 // 1736
A=A+1 // 1737
A=A+1 // 1738
D=M // 1739
@SP // 1740
AM=M+1 // 1741
A=A-1 // 1742
M=D // 1743
@ARG // 1744
A=M // 1745
D=M // 1746
@SP // 1747
AM=M-1 // 1748
D=M-D // 1749
@DO_GT // 1750
0;JMP // 1751
(Math.sqrt.GT.19)
@SP // 1752
AM=M+1 // 1753
A=A-1 // 1754
M=D // 1755
@SP // 1756
A=M-1 // 1757
M=!D // 1758
@Math.sqrt.GT.20 // 1759
D=A // 1760
@SP // 1761
AM=M+1 // 1762
A=A-1 // 1763
M=D // 1764
@LCL // 1765
A=M+1 // 1766
A=A+1 // 1767
A=A+1 // 1768
D=M // 1769
@DO_GT // 1770
0;JMP // 1771
(Math.sqrt.GT.20)
@SP // 1772
AM=M-1 // 1773
D=D&M // 1774
D=!D // 1775
@Math.sqrt.IfElse1 // 1776
D;JNE // 1777

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1778
A=M+1 // 1779
A=A+1 // 1780
D=M // 1781
@LCL // 1782
A=M // 1783
M=D // 1784

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 1785
0;JMP // 1786

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

@LCL // 1787
A=M+1 // 1788
M=M-1 // 1789

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1790
0;JMP // 1791

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1792
A=M // 1793
D=M // 1794
@SP // 1795
AM=M+1 // 1796
A=A-1 // 1797
M=D // 1798
@RETURN // 1799
0;JMP // 1800

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
//NOT), ifGoto=IfGotoInstruction{label='Math.max.IfElse1}}
@Math.max.GT.21 // 1801
D=A // 1802
@SP // 1803
AM=M+1 // 1804
A=A-1 // 1805
M=D // 1806
@ARG // 1807
A=M+1 // 1808
D=M // 1809
A=A-1 // 1810
D=M-D // 1811
@DO_GT // 1812
0;JMP // 1813
(Math.max.GT.21)
D=!D // 1814
@Math.max.IfElse1 // 1815
D;JNE // 1816

////PushInstruction("argument 0")
@ARG // 1817
A=M // 1818
D=M // 1819
@SP // 1820
AM=M+1 // 1821
A=A-1 // 1822
M=D // 1823
@RETURN // 1824
0;JMP // 1825

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 1826
0;JMP // 1827

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1828
A=M+1 // 1829
D=M // 1830
@SP // 1831
AM=M+1 // 1832
A=A-1 // 1833
M=D // 1834
@RETURN // 1835
0;JMP // 1836

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
//NOT), ifGoto=IfGotoInstruction{label='Math.min.IfElse1}}
@Math.min.LT.22 // 1837
D=A // 1838
@SP // 1839
AM=M+1 // 1840
A=A-1 // 1841
M=D // 1842
@ARG // 1843
A=M+1 // 1844
D=M // 1845
A=A-1 // 1846
D=M-D // 1847
@DO_LT // 1848
0;JMP // 1849
(Math.min.LT.22)
D=!D // 1850
@Math.min.IfElse1 // 1851
D;JNE // 1852

////PushInstruction("argument 0")
@ARG // 1853
A=M // 1854
D=M // 1855
@SP // 1856
AM=M+1 // 1857
A=A-1 // 1858
M=D // 1859
@RETURN // 1860
0;JMP // 1861

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 1862
0;JMP // 1863

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1864
A=M+1 // 1865
D=M // 1866
@SP // 1867
AM=M+1 // 1868
A=A-1 // 1869
M=D // 1870
@RETURN // 1871
0;JMP // 1872

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1873
A=M // 1874
D=M // 1875
@SP // 1876
AM=M+1 // 1877
A=A-1 // 1878
M=D // 1879
@ARG // 1880
A=M // 1881
D=M // 1882
@SP // 1883
AM=M+1 // 1884
A=A-1 // 1885
M=D // 1886
@SP // 1887
A=M-1 // 1888
M=-D // 1889
// call Math.max
@7 // 1890
D=A // 1891
@14 // 1892
M=D // 1893
@Math.max // 1894
D=A // 1895
@13 // 1896
M=D // 1897
@Math.abs.ret.0 // 1898
D=A // 1899
@CALL // 1900
0;JMP // 1901
(Math.abs.ret.0)
@RETURN // 1902
0;JMP // 1903

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1904
M=M+1 // 1905
AM=M+1 // 1906
A=A-1 // 1907
M=0 // 1908
A=A-1 // 1909
M=0 // 1910

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

@2055 // 1911
D=A // 1912
@LCL // 1913
A=M // 1914
M=D // 1915

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
@LCL // 1916
A=M // 1917
D=M // 1918
@SP // 1919
AM=M+1 // 1920
A=A-1 // 1921
M=D // 1922
@LCL // 1923
A=M // 1924
D=M // 1925
@16384 // 1926
D=A-D // 1927
@5 // 1928
D=D-A // 1929
@SP // 1930
AM=M-1 // 1931
A=M // 1932
M=D // 1933

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1934
A=M // 1935
D=M // 1936
@SP // 1937
AM=M+1 // 1938
A=A-1 // 1939
M=D+1 // 1940
D=1 // 1941
@SP // 1942
AM=M-1 // 1943
A=M // 1944
M=D // 1945

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1946
A=M // 1947
D=M // 1948
@2 // 1949
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

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1960
A=M // 1961
D=M // 1962
@3 // 1963
D=D+A // 1964
@SP // 1965
AM=M+1 // 1966
A=A-1 // 1967
M=D // 1968
D=0 // 1969
@SP // 1970
AM=M-1 // 1971
A=M // 1972
M=D // 1973

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1974
A=M // 1975
D=M // 1976
@SP // 1977
AM=M+1 // 1978
A=A-1 // 1979
M=D // 1980
// call Memory.create_foot
@6 // 1981
D=A // 1982
@14 // 1983
M=D // 1984
@Memory.create_foot // 1985
D=A // 1986
@13 // 1987
M=D // 1988
@Memory.init.ret.0 // 1989
D=A // 1990
@CALL // 1991
0;JMP // 1992
(Memory.init.ret.0)
@SP // 1993
M=M-1 // 1994

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

@2054 // 1995
D=A // 1996
@SP // 1997
AM=M+1 // 1998
A=A-1 // 1999
M=D // 2000
@2054 // 2001
D=A // 2002
@SP // 2003
AM=M+1 // 2004
A=A-1 // 2005
M=D // 2006
@LCL // 2007
A=M // 2008
D=M // 2009
@SP // 2010
AM=M+1 // 2011
A=A-1 // 2012
M=D // 2013
// call Memory.add_node
@7 // 2014
D=A // 2015
@14 // 2016
M=D // 2017
@Memory.add_node // 2018
D=A // 2019
@13 // 2020
M=D // 2021
@Memory.init.ret.1 // 2022
D=A // 2023
@CALL // 2024
0;JMP // 2025
(Memory.init.ret.1)
@SP // 2026
M=M-1 // 2027

////PushInstruction("constant 0")
@SP // 2028
AM=M+1 // 2029
A=A-1 // 2030
M=0 // 2031
@RETURN // 2032
0;JMP // 2033

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2034
D=A // 2035
@SP // 2036
AM=D+M // 2037
A=A-1 // 2038
M=0 // 2039
A=A-1 // 2040
M=0 // 2041
A=A-1 // 2042
M=0 // 2043
A=A-1 // 2044
M=0 // 2045
A=A-1 // 2046
M=0 // 2047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2048
A=M // 2049
D=M // 2050
@SP // 2051
AM=M+1 // 2052
A=A-1 // 2053
M=D // 2054
// call Memory.getBinIndex
@6 // 2055
D=A // 2056
@14 // 2057
M=D // 2058
@Memory.getBinIndex // 2059
D=A // 2060
@13 // 2061
M=D // 2062
@Memory.alloc.ret.0 // 2063
D=A // 2064
@CALL // 2065
0;JMP // 2066
(Memory.alloc.ret.0)
@SP // 2067
AM=M-1 // 2068
D=M // 2069
@LCL // 2070
A=M // 2071
M=D // 2072

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

@LCL // 2073
A=M // 2074
D=M // 2075
@2048 // 2076
D=D+A // 2077
@LCL // 2078
A=M+1 // 2079
M=D // 2080

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2081
A=M+1 // 2082
D=M // 2083
@SP // 2084
AM=M+1 // 2085
A=A-1 // 2086
M=D // 2087
@ARG // 2088
A=M // 2089
D=M // 2090
@SP // 2091
AM=M+1 // 2092
A=A-1 // 2093
M=D // 2094
// call Memory.get_best_fit
@7 // 2095
D=A // 2096
@14 // 2097
M=D // 2098
@Memory.get_best_fit // 2099
D=A // 2100
@13 // 2101
M=D // 2102
@Memory.alloc.ret.1 // 2103
D=A // 2104
@CALL // 2105
0;JMP // 2106
(Memory.alloc.ret.1)
@SP // 2107
AM=M-1 // 2108
D=M // 2109
@LCL // 2110
A=M+1 // 2111
A=A+1 // 2112
M=D // 2113

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
@Memory.alloc.EQ.0 // 2114
D=A // 2115
@SP // 2116
AM=M+1 // 2117
A=A-1 // 2118
M=D // 2119
@LCL // 2120
A=M+1 // 2121
A=A+1 // 2122
D=M // 2123
@DO_EQ // 2124
0;JMP // 2125
(Memory.alloc.EQ.0)
D=!D // 2126
@WHILE_END_Memory.alloc1 // 2127
D;JNE // 2128

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
//), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse1}}
@Memory.alloc.LT.1 // 2129
D=A // 2130
@SP // 2131
AM=M+1 // 2132
A=A-1 // 2133
M=D // 2134
@LCL // 2135
A=M // 2136
D=M // 2137
D=D+1 // 2138
@7 // 2139
D=D-A // 2140
@DO_LT // 2141
0;JMP // 2142
(Memory.alloc.LT.1)
@Memory.alloc.IfElse1 // 2143
D;JNE // 2144

////PushInstruction("constant 0")
@SP // 2145
AM=M+1 // 2146
A=A-1 // 2147
M=0 // 2148
@RETURN // 2149
0;JMP // 2150

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 2151
0;JMP // 2152

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

@LCL // 2153
A=M // 2154
M=M+1 // 2155

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

@LCL // 2156
A=M // 2157
D=M // 2158
@2048 // 2159
D=D+A // 2160
@LCL // 2161
A=M+1 // 2162
M=D // 2163

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2164
A=M+1 // 2165
D=M // 2166
@SP // 2167
AM=M+1 // 2168
A=A-1 // 2169
M=D // 2170
@ARG // 2171
A=M // 2172
D=M // 2173
@SP // 2174
AM=M+1 // 2175
A=A-1 // 2176
M=D // 2177
// call Memory.get_best_fit
@7 // 2178
D=A // 2179
@14 // 2180
M=D // 2181
@Memory.get_best_fit // 2182
D=A // 2183
@13 // 2184
M=D // 2185
@Memory.alloc.ret.2 // 2186
D=A // 2187
@CALL // 2188
0;JMP // 2189
(Memory.alloc.ret.2)
@SP // 2190
AM=M-1 // 2191
D=M // 2192
@LCL // 2193
A=M+1 // 2194
A=A+1 // 2195
M=D // 2196

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2197
0;JMP // 2198

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

@LCL // 2199
A=M+1 // 2200
A=A+1 // 2201
D=M // 2202
@0 // 2203
A=D+A // 2204
D=M // 2205
@SP // 2206
AM=M+1 // 2207
A=A-1 // 2208
M=D // 2209
// call Memory.getBinIndex
@6 // 2210
D=A // 2211
@14 // 2212
M=D // 2213
@Memory.getBinIndex // 2214
D=A // 2215
@13 // 2216
M=D // 2217
@Memory.alloc.ret.3 // 2218
D=A // 2219
@CALL // 2220
0;JMP // 2221
(Memory.alloc.ret.3)
@SP // 2222
AM=M-1 // 2223
D=M // 2224
@2048 // 2225
D=D+A // 2226
@SP // 2227
AM=M+1 // 2228
A=A-1 // 2229
M=D // 2230
@LCL // 2231
A=M+1 // 2232
A=A+1 // 2233
D=M // 2234
@SP // 2235
AM=M+1 // 2236
A=A-1 // 2237
M=D // 2238
// call Memory.remove_node
@7 // 2239
D=A // 2240
@14 // 2241
M=D // 2242
@Memory.remove_node // 2243
D=A // 2244
@13 // 2245
M=D // 2246
@Memory.alloc.ret.4 // 2247
D=A // 2248
@CALL // 2249
0;JMP // 2250
(Memory.alloc.ret.4)
@SP // 2251
M=M-1 // 2252

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

@LCL // 2253
A=M+1 // 2254
A=A+1 // 2255
D=M // 2256
@0 // 2257
A=D+A // 2258
D=M // 2259
@SP // 2260
AM=M+1 // 2261
A=A-1 // 2262
M=D // 2263
@ARG // 2264
A=M // 2265
D=M // 2266
@SP // 2267
AM=M-1 // 2268
D=M-D // 2269
@LCL // 2270
A=M+1 // 2271
A=A+1 // 2272
A=A+1 // 2273
M=D // 2274

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 5"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
@Memory.alloc.GT.2 // 2275
D=A // 2276
@SP // 2277
AM=M+1 // 2278
A=A-1 // 2279
M=D // 2280
@LCL // 2281
A=M+1 // 2282
A=A+1 // 2283
A=A+1 // 2284
D=M // 2285
@5 // 2286
D=D-A // 2287
@DO_GT // 2288
0;JMP // 2289
(Memory.alloc.GT.2)
D=!D // 2290
@Memory.alloc.IfElse2 // 2291
D;JNE // 2292

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2293
A=M+1 // 2294
A=A+1 // 2295
D=M // 2296
@SP // 2297
AM=M+1 // 2298
A=A-1 // 2299
M=D // 2300
@ARG // 2301
A=M // 2302
D=M // 2303
@SP // 2304
AM=M-1 // 2305
A=M // 2306
M=D // 2307

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2308
A=M+1 // 2309
A=A+1 // 2310
D=M // 2311
@SP // 2312
AM=M+1 // 2313
A=A-1 // 2314
M=D+1 // 2315
D=0 // 2316
@SP // 2317
AM=M-1 // 2318
A=M // 2319
M=D // 2320

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2321
A=M+1 // 2322
A=A+1 // 2323
D=M // 2324
@SP // 2325
AM=M+1 // 2326
A=A-1 // 2327
M=D // 2328
// call Memory.create_foot
@6 // 2329
D=A // 2330
@14 // 2331
M=D // 2332
@Memory.create_foot // 2333
D=A // 2334
@13 // 2335
M=D // 2336
@Memory.alloc.ret.5 // 2337
D=A // 2338
@CALL // 2339
0;JMP // 2340
(Memory.alloc.ret.5)
@SP // 2341
M=M-1 // 2342

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

@LCL // 2343
A=M+1 // 2344
A=A+1 // 2345
D=M // 2346
@SP // 2347
AM=M+1 // 2348
A=A-1 // 2349
M=D // 2350
@ARG // 2351
A=M // 2352
D=M // 2353
@SP // 2354
AM=M-1 // 2355
D=D+M // 2356
@5 // 2357
D=D+A // 2358
@SP // 2359
AM=M+1 // 2360
A=A-1 // 2361
M=D // 2362
@LCL // 2363
D=M // 2364
@4 // 2365
A=D+A // 2366
D=A // 2367
@R13 // 2368
M=D // 2369
@SP // 2370
AM=M-1 // 2371
D=M // 2372
@R13 // 2373
A=M // 2374
M=D // 2375

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
@LCL // 2376
D=M // 2377
@4 // 2378
A=D+A // 2379
D=M // 2380
@SP // 2381
AM=M+1 // 2382
A=A-1 // 2383
M=D // 2384
@LCL // 2385
A=M+1 // 2386
A=A+1 // 2387
A=A+1 // 2388
D=M // 2389
@5 // 2390
D=D-A // 2391
@SP // 2392
AM=M-1 // 2393
A=M // 2394
M=D // 2395

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2396
D=M // 2397
@4 // 2398
A=D+A // 2399
D=M // 2400
@SP // 2401
AM=M+1 // 2402
A=A-1 // 2403
M=D+1 // 2404
D=1 // 2405
@SP // 2406
AM=M-1 // 2407
A=M // 2408
M=D // 2409

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2410
D=M // 2411
@4 // 2412
A=D+A // 2413
D=M // 2414
@SP // 2415
AM=M+1 // 2416
A=A-1 // 2417
M=D // 2418
// call Memory.create_foot
@6 // 2419
D=A // 2420
@14 // 2421
M=D // 2422
@Memory.create_foot // 2423
D=A // 2424
@13 // 2425
M=D // 2426
@Memory.alloc.ret.6 // 2427
D=A // 2428
@CALL // 2429
0;JMP // 2430
(Memory.alloc.ret.6)
@SP // 2431
M=M-1 // 2432

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

@LCL // 2433
A=M+1 // 2434
A=A+1 // 2435
A=A+1 // 2436
D=M // 2437
@SP // 2438
AM=M+1 // 2439
A=A-1 // 2440
M=D // 2441
// call Memory.getBinIndex
@6 // 2442
D=A // 2443
@14 // 2444
M=D // 2445
@Memory.getBinIndex // 2446
D=A // 2447
@13 // 2448
M=D // 2449
@Memory.alloc.ret.7 // 2450
D=A // 2451
@CALL // 2452
0;JMP // 2453
(Memory.alloc.ret.7)
@SP // 2454
AM=M-1 // 2455
D=M // 2456
@2048 // 2457
D=D+A // 2458
@SP // 2459
AM=M+1 // 2460
A=A-1 // 2461
M=D // 2462
@LCL // 2463
D=M // 2464
@4 // 2465
A=D+A // 2466
D=M // 2467
@SP // 2468
AM=M+1 // 2469
A=A-1 // 2470
M=D // 2471
// call Memory.add_node
@7 // 2472
D=A // 2473
@14 // 2474
M=D // 2475
@Memory.add_node // 2476
D=A // 2477
@13 // 2478
M=D // 2479
@Memory.alloc.ret.8 // 2480
D=A // 2481
@CALL // 2482
0;JMP // 2483
(Memory.alloc.ret.8)
@SP // 2484
M=M-1 // 2485

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2486
0;JMP // 2487

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
@LCL // 2488
A=M+1 // 2489
A=A+1 // 2490
D=M // 2491
@SP // 2492
AM=M+1 // 2493
A=A-1 // 2494
M=D+1 // 2495
D=0 // 2496
@SP // 2497
AM=M-1 // 2498
A=M // 2499
M=D // 2500

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2501
A=M+1 // 2502
A=A+1 // 2503
D=M // 2504
@SP // 2505
AM=M+1 // 2506
A=A-1 // 2507
M=D // 2508
// call Memory.create_foot
@6 // 2509
D=A // 2510
@14 // 2511
M=D // 2512
@Memory.create_foot // 2513
D=A // 2514
@13 // 2515
M=D // 2516
@Memory.alloc.ret.9 // 2517
D=A // 2518
@CALL // 2519
0;JMP // 2520
(Memory.alloc.ret.9)
@SP // 2521
M=M-1 // 2522

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
@LCL // 2523
A=M+1 // 2524
A=A+1 // 2525
D=M // 2526
@4 // 2527
D=D+A // 2528
@SP // 2529
AM=M+1 // 2530
A=A-1 // 2531
M=D // 2532
@RETURN // 2533
0;JMP // 2534

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2535
AM=M+1 // 2536
A=A-1 // 2537
M=0 // 2538

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2539
A=M // 2540
D=M // 2541
@SP // 2542
AM=M+1 // 2543
A=A-1 // 2544
M=D // 2545
// call Memory.alloc
@6 // 2546
D=A // 2547
@14 // 2548
M=D // 2549
@Memory.alloc // 2550
D=A // 2551
@13 // 2552
M=D // 2553
@Memory.calloc.ret.0 // 2554
D=A // 2555
@CALL // 2556
0;JMP // 2557
(Memory.calloc.ret.0)
@SP // 2558
AM=M-1 // 2559
D=M // 2560
@LCL // 2561
A=M // 2562
M=D // 2563

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@LCL // 2564
A=M // 2565
D=M // 2566
@Memory.calloc.IfElse1 // 2567
D;JNE // 2568

////PushInstruction("constant 0")
@SP // 2569
AM=M+1 // 2570
A=A-1 // 2571
M=0 // 2572
@RETURN // 2573
0;JMP // 2574

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 2575
0;JMP // 2576

////LabelInstruction{label='Memory.calloc.IfElse1}
// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)

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
@Memory.calloc.GT.3 // 2577
D=A // 2578
@SP // 2579
AM=M+1 // 2580
A=A-1 // 2581
M=D // 2582
@ARG // 2583
A=M // 2584
D=M // 2585
@DO_GT // 2586
0;JMP // 2587
(Memory.calloc.GT.3)
D=!D // 2588
@WHILE_END_Memory.calloc1 // 2589
D;JNE // 2590

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

@ARG // 2591
A=M // 2592
M=M-1 // 2593

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2594
A=M // 2595
D=M // 2596
@SP // 2597
AM=M+1 // 2598
A=A-1 // 2599
M=D // 2600
@ARG // 2601
A=M // 2602
D=M // 2603
@SP // 2604
AM=M-1 // 2605
D=D+M // 2606
@SP // 2607
AM=M+1 // 2608
A=A-1 // 2609
M=D // 2610
D=0 // 2611
@SP // 2612
AM=M-1 // 2613
A=M // 2614
M=D // 2615

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2616
0;JMP // 2617

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2618
A=M // 2619
D=M // 2620
@SP // 2621
AM=M+1 // 2622
A=A-1 // 2623
M=D // 2624
@RETURN // 2625
0;JMP // 2626

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2627
D=A // 2628
@SP // 2629
AM=D+M // 2630
A=A-1 // 2631
M=0 // 2632
A=A-1 // 2633
M=0 // 2634
A=A-1 // 2635
M=0 // 2636

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

@ARG // 2637
A=M // 2638
D=M // 2639
@4 // 2640
D=D-A // 2641
@LCL // 2642
A=M // 2643
M=D // 2644

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2645
A=M // 2646
D=M // 2647
@SP // 2648
AM=M+1 // 2649
A=A-1 // 2650
M=D+1 // 2651
D=1 // 2652
@SP // 2653
AM=M-1 // 2654
A=M // 2655
M=D // 2656

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

@LCL // 2657
A=M // 2658
D=M // 2659
@2 // 2660
A=D+A // 2661
D=M // 2662
@LCL // 2663
A=M+1 // 2664
M=D // 2665

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

@LCL // 2666
A=M // 2667
D=M // 2668
@3 // 2669
A=D+A // 2670
D=M // 2671
@LCL // 2672
A=M+1 // 2673
A=A+1 // 2674
M=D // 2675

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse1}}
@Memory.deAlloc.EQ.4 // 2676
D=A // 2677
@SP // 2678
AM=M+1 // 2679
A=A-1 // 2680
M=D // 2681
@LCL // 2682
A=M+1 // 2683
D=M // 2684
@DO_EQ // 2685
0;JMP // 2686
(Memory.deAlloc.EQ.4)
@Memory.deAlloc.IfElse1 // 2687
D;JNE // 2688

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
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse2}}
@Memory.deAlloc.EQ.5 // 2689
D=A // 2690
@SP // 2691
AM=M+1 // 2692
A=A-1 // 2693
M=D // 2694
@LCL // 2695
A=M+1 // 2696
D=M // 2697
A=D+1 // 2698
D=M // 2699
D=D-1 // 2700
@DO_EQ // 2701
0;JMP // 2702
(Memory.deAlloc.EQ.5)
D=!D // 2703
@Memory.deAlloc.IfElse2 // 2704
D;JNE // 2705

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

@LCL // 2706
A=M+1 // 2707
D=M // 2708
@0 // 2709
A=D+A // 2710
D=M // 2711
@SP // 2712
AM=M+1 // 2713
A=A-1 // 2714
M=D // 2715
// call Memory.getBinIndex
@6 // 2716
D=A // 2717
@14 // 2718
M=D // 2719
@Memory.getBinIndex // 2720
D=A // 2721
@13 // 2722
M=D // 2723
@Memory.deAlloc.ret.0 // 2724
D=A // 2725
@CALL // 2726
0;JMP // 2727
(Memory.deAlloc.ret.0)
@SP // 2728
AM=M-1 // 2729
D=M // 2730
@2048 // 2731
D=D+A // 2732
@SP // 2733
AM=M+1 // 2734
A=A-1 // 2735
M=D // 2736
@LCL // 2737
A=M+1 // 2738
D=M // 2739
@SP // 2740
AM=M+1 // 2741
A=A-1 // 2742
M=D // 2743
// call Memory.remove_node
@7 // 2744
D=A // 2745
@14 // 2746
M=D // 2747
@Memory.remove_node // 2748
D=A // 2749
@13 // 2750
M=D // 2751
@Memory.deAlloc.ret.1 // 2752
D=A // 2753
@CALL // 2754
0;JMP // 2755
(Memory.deAlloc.ret.1)
@SP // 2756
M=M-1 // 2757

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
@LCL // 2758
A=M+1 // 2759
D=M // 2760
@SP // 2761
AM=M+1 // 2762
A=A-1 // 2763
M=D // 2764
@LCL // 2765
A=M+1 // 2766
D=M // 2767
@0 // 2768
A=D+A // 2769
D=M // 2770
@SP // 2771
AM=M+1 // 2772
A=A-1 // 2773
M=D // 2774
@LCL // 2775
A=M // 2776
D=M // 2777
@0 // 2778
A=D+A // 2779
D=M // 2780
@SP // 2781
AM=M-1 // 2782
D=D+M // 2783
@5 // 2784
D=D+A // 2785
@SP // 2786
AM=M-1 // 2787
A=M // 2788
M=D // 2789

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2790
A=M+1 // 2791
D=M // 2792
@SP // 2793
AM=M+1 // 2794
A=A-1 // 2795
M=D // 2796
// call Memory.create_foot
@6 // 2797
D=A // 2798
@14 // 2799
M=D // 2800
@Memory.create_foot // 2801
D=A // 2802
@13 // 2803
M=D // 2804
@Memory.deAlloc.ret.2 // 2805
D=A // 2806
@CALL // 2807
0;JMP // 2808
(Memory.deAlloc.ret.2)
@SP // 2809
M=M-1 // 2810

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2811
A=M+1 // 2812
D=M // 2813
@LCL // 2814
A=M // 2815
M=D // 2816

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 2817
0;JMP // 2818

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 2819
0;JMP // 2820

////LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse3}}
@Memory.deAlloc.EQ.6 // 2821
D=A // 2822
@SP // 2823
AM=M+1 // 2824
A=A-1 // 2825
M=D // 2826
@LCL // 2827
A=M+1 // 2828
A=A+1 // 2829
D=M // 2830
@DO_EQ // 2831
0;JMP // 2832
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse3 // 2833
D;JNE // 2834

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
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse4}}
@Memory.deAlloc.EQ.7 // 2835
D=A // 2836
@SP // 2837
AM=M+1 // 2838
A=A-1 // 2839
M=D // 2840
@LCL // 2841
A=M+1 // 2842
A=A+1 // 2843
D=M // 2844
A=D+1 // 2845
D=M // 2846
D=D-1 // 2847
@DO_EQ // 2848
0;JMP // 2849
(Memory.deAlloc.EQ.7)
D=!D // 2850
@Memory.deAlloc.IfElse4 // 2851
D;JNE // 2852

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

@LCL // 2853
A=M+1 // 2854
A=A+1 // 2855
D=M // 2856
@0 // 2857
A=D+A // 2858
D=M // 2859
@SP // 2860
AM=M+1 // 2861
A=A-1 // 2862
M=D // 2863
// call Memory.getBinIndex
@6 // 2864
D=A // 2865
@14 // 2866
M=D // 2867
@Memory.getBinIndex // 2868
D=A // 2869
@13 // 2870
M=D // 2871
@Memory.deAlloc.ret.3 // 2872
D=A // 2873
@CALL // 2874
0;JMP // 2875
(Memory.deAlloc.ret.3)
@SP // 2876
AM=M-1 // 2877
D=M // 2878
@2048 // 2879
D=D+A // 2880
@SP // 2881
AM=M+1 // 2882
A=A-1 // 2883
M=D // 2884
@LCL // 2885
A=M+1 // 2886
A=A+1 // 2887
D=M // 2888
@SP // 2889
AM=M+1 // 2890
A=A-1 // 2891
M=D // 2892
// call Memory.remove_node
@7 // 2893
D=A // 2894
@14 // 2895
M=D // 2896
@Memory.remove_node // 2897
D=A // 2898
@13 // 2899
M=D // 2900
@Memory.deAlloc.ret.4 // 2901
D=A // 2902
@CALL // 2903
0;JMP // 2904
(Memory.deAlloc.ret.4)
@SP // 2905
M=M-1 // 2906

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
@LCL // 2907
A=M // 2908
D=M // 2909
@SP // 2910
AM=M+1 // 2911
A=A-1 // 2912
M=D // 2913
@LCL // 2914
A=M // 2915
D=M // 2916
@0 // 2917
A=D+A // 2918
D=M // 2919
@SP // 2920
AM=M+1 // 2921
A=A-1 // 2922
M=D // 2923
@LCL // 2924
A=M+1 // 2925
A=A+1 // 2926
D=M // 2927
@0 // 2928
A=D+A // 2929
D=M // 2930
@SP // 2931
AM=M-1 // 2932
D=D+M // 2933
@5 // 2934
D=D+A // 2935
@SP // 2936
AM=M-1 // 2937
A=M // 2938
M=D // 2939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2940
A=M // 2941
D=M // 2942
@SP // 2943
AM=M+1 // 2944
A=A-1 // 2945
M=D // 2946
// call Memory.create_foot
@6 // 2947
D=A // 2948
@14 // 2949
M=D // 2950
@Memory.create_foot // 2951
D=A // 2952
@13 // 2953
M=D // 2954
@Memory.deAlloc.ret.5 // 2955
D=A // 2956
@CALL // 2957
0;JMP // 2958
(Memory.deAlloc.ret.5)
@SP // 2959
M=M-1 // 2960

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 2961
0;JMP // 2962

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 2963
0;JMP // 2964

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

@LCL // 2965
A=M // 2966
D=M // 2967
@0 // 2968
A=D+A // 2969
D=M // 2970
@SP // 2971
AM=M+1 // 2972
A=A-1 // 2973
M=D // 2974
// call Memory.getBinIndex
@6 // 2975
D=A // 2976
@14 // 2977
M=D // 2978
@Memory.getBinIndex // 2979
D=A // 2980
@13 // 2981
M=D // 2982
@Memory.deAlloc.ret.6 // 2983
D=A // 2984
@CALL // 2985
0;JMP // 2986
(Memory.deAlloc.ret.6)
@SP // 2987
AM=M-1 // 2988
D=M // 2989
@2048 // 2990
D=D+A // 2991
@SP // 2992
AM=M+1 // 2993
A=A-1 // 2994
M=D // 2995
@LCL // 2996
A=M // 2997
D=M // 2998
@SP // 2999
AM=M+1 // 3000
A=A-1 // 3001
M=D // 3002
// call Memory.add_node
@7 // 3003
D=A // 3004
@14 // 3005
M=D // 3006
@Memory.add_node // 3007
D=A // 3008
@13 // 3009
M=D // 3010
@Memory.deAlloc.ret.7 // 3011
D=A // 3012
@CALL // 3013
0;JMP // 3014
(Memory.deAlloc.ret.7)
@SP // 3015
M=M-1 // 3016

////PushInstruction("constant 0")
@SP // 3017
AM=M+1 // 3018
A=A-1 // 3019
M=0 // 3020
@RETURN // 3021
0;JMP // 3022

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 3023
D=A // 3024
@SP // 3025
AM=D+M // 3026
A=A-1 // 3027
M=0 // 3028
A=A-1 // 3029
M=0 // 3030
A=A-1 // 3031
M=0 // 3032
A=A-1 // 3033
M=0 // 3034

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse1}}
@Memory.realloc.EQ.8 // 3035
D=A // 3036
@SP // 3037
AM=M+1 // 3038
A=A-1 // 3039
M=D // 3040
@ARG // 3041
A=M // 3042
D=M // 3043
@DO_EQ // 3044
0;JMP // 3045
(Memory.realloc.EQ.8)
D=!D // 3046
@Memory.realloc.IfElse1 // 3047
D;JNE // 3048

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3049
A=M+1 // 3050
D=M // 3051
@SP // 3052
AM=M+1 // 3053
A=A-1 // 3054
M=D // 3055
// call Memory.alloc
@6 // 3056
D=A // 3057
@14 // 3058
M=D // 3059
@Memory.alloc // 3060
D=A // 3061
@13 // 3062
M=D // 3063
@Memory.realloc.ret.0 // 3064
D=A // 3065
@CALL // 3066
0;JMP // 3067
(Memory.realloc.ret.0)
@RETURN // 3068
0;JMP // 3069

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 3070
0;JMP // 3071

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

@ARG // 3072
A=M // 3073
D=M // 3074
D=D-1 // 3075
@LCL // 3076
A=M+1 // 3077
A=A+1 // 3078
A=A+1 // 3079
M=D // 3080

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

@LCL // 3081
A=M+1 // 3082
A=A+1 // 3083
A=A+1 // 3084
D=M // 3085
@0 // 3086
A=D+A // 3087
D=M // 3088
@LCL // 3089
A=M // 3090
M=D // 3091

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3092
A=M+1 // 3093
D=M // 3094
@SP // 3095
AM=M+1 // 3096
A=A-1 // 3097
M=D // 3098
// call Memory.alloc
@6 // 3099
D=A // 3100
@14 // 3101
M=D // 3102
@Memory.alloc // 3103
D=A // 3104
@13 // 3105
M=D // 3106
@Memory.realloc.ret.1 // 3107
D=A // 3108
@CALL // 3109
0;JMP // 3110
(Memory.realloc.ret.1)
@SP // 3111
AM=M-1 // 3112
D=M // 3113
@LCL // 3114
A=M+1 // 3115
M=D // 3116

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse2}}
@Memory.realloc.EQ.9 // 3117
D=A // 3118
@SP // 3119
AM=M+1 // 3120
A=A-1 // 3121
M=D // 3122
@LCL // 3123
A=M+1 // 3124
D=M // 3125
@DO_EQ // 3126
0;JMP // 3127
(Memory.realloc.EQ.9)
D=!D // 3128
@Memory.realloc.IfElse2 // 3129
D;JNE // 3130

////PushInstruction("constant 0")
@SP // 3131
AM=M+1 // 3132
A=A-1 // 3133
M=0 // 3134
@RETURN // 3135
0;JMP // 3136

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 3137
0;JMP // 3138

////LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)

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
@Memory.realloc.GT.10 // 3139
D=A // 3140
@SP // 3141
AM=M+1 // 3142
A=A-1 // 3143
M=D // 3144
@LCL // 3145
A=M // 3146
D=M // 3147
@SP // 3148
AM=M+1 // 3149
A=A-1 // 3150
M=D // 3151
@ARG // 3152
A=M+1 // 3153
D=M // 3154
@SP // 3155
AM=M-1 // 3156
D=M-D // 3157
@DO_GT // 3158
0;JMP // 3159
(Memory.realloc.GT.10)
@Memory.realloc.IfElse3 // 3160
D;JNE // 3161

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3162
A=M // 3163
D=M // 3164
@LCL // 3165
A=M+1 // 3166
A=A+1 // 3167
M=D // 3168

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3169
0;JMP // 3170

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3171
A=M+1 // 3172
D=M // 3173
@LCL // 3174
A=M+1 // 3175
A=A+1 // 3176
M=D // 3177

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3178
A=M // 3179
D=M // 3180
@SP // 3181
AM=M+1 // 3182
A=A-1 // 3183
M=D // 3184
@LCL // 3185
A=M+1 // 3186
D=M // 3187
@SP // 3188
AM=M+1 // 3189
A=A-1 // 3190
M=D // 3191
@LCL // 3192
A=M+1 // 3193
A=A+1 // 3194
D=M // 3195
@SP // 3196
AM=M+1 // 3197
A=A-1 // 3198
M=D // 3199
// call Memory.copy
@8 // 3200
D=A // 3201
@14 // 3202
M=D // 3203
@Memory.copy // 3204
D=A // 3205
@13 // 3206
M=D // 3207
@Memory.realloc.ret.2 // 3208
D=A // 3209
@CALL // 3210
0;JMP // 3211
(Memory.realloc.ret.2)
@SP // 3212
M=M-1 // 3213

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3214
A=M // 3215
D=M // 3216
@SP // 3217
AM=M+1 // 3218
A=A-1 // 3219
M=D // 3220
// call Memory.deAlloc
@6 // 3221
D=A // 3222
@14 // 3223
M=D // 3224
@Memory.deAlloc // 3225
D=A // 3226
@13 // 3227
M=D // 3228
@Memory.realloc.ret.3 // 3229
D=A // 3230
@CALL // 3231
0;JMP // 3232
(Memory.realloc.ret.3)
@SP // 3233
M=M-1 // 3234

////PushInstruction("local 1")
@LCL // 3235
A=M+1 // 3236
D=M // 3237
@SP // 3238
AM=M+1 // 3239
A=A-1 // 3240
M=D // 3241
@RETURN // 3242
0;JMP // 3243

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3244
AM=M+1 // 3245
A=A-1 // 3246
M=0 // 3247

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3248
A=M // 3249
M=0 // 3250

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
@Memory.copy.LT.11 // 3251
D=A // 3252
@SP // 3253
AM=M+1 // 3254
A=A-1 // 3255
M=D // 3256
@LCL // 3257
A=M // 3258
D=M // 3259
@SP // 3260
AM=M+1 // 3261
A=A-1 // 3262
M=D // 3263
@ARG // 3264
A=M+1 // 3265
A=A+1 // 3266
D=M // 3267
@SP // 3268
AM=M-1 // 3269
D=M-D // 3270
@DO_LT // 3271
0;JMP // 3272
(Memory.copy.LT.11)
D=!D // 3273
@WHILE_END_Memory.copy1 // 3274
D;JNE // 3275

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
@ARG // 3276
A=M+1 // 3277
D=M // 3278
@SP // 3279
AM=M+1 // 3280
A=A-1 // 3281
M=D // 3282
@LCL // 3283
A=M // 3284
D=M // 3285
@SP // 3286
AM=M-1 // 3287
D=D+M // 3288
@SP // 3289
AM=M+1 // 3290
A=A-1 // 3291
M=D // 3292
@ARG // 3293
A=M // 3294
D=M // 3295
@SP // 3296
AM=M+1 // 3297
A=A-1 // 3298
M=D // 3299
@LCL // 3300
A=M // 3301
D=M // 3302
@SP // 3303
AM=M-1 // 3304
A=D+M // 3305
D=M // 3306
@SP // 3307
AM=M-1 // 3308
A=M // 3309
M=D // 3310

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

@LCL // 3311
A=M // 3312
M=M+1 // 3313

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3314
0;JMP // 3315

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3316
AM=M+1 // 3317
A=A-1 // 3318
M=0 // 3319
@RETURN // 3320
0;JMP // 3321

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
@Memory.remove_node.EQ.12 // 3322
D=A // 3323
@SP // 3324
AM=M+1 // 3325
A=A-1 // 3326
M=D // 3327
@ARG // 3328
A=M+1 // 3329
D=M // 3330
@2 // 3331
A=D+A // 3332
D=M // 3333
@DO_EQ // 3334
0;JMP // 3335
(Memory.remove_node.EQ.12)
@Memory.remove_node.IfElse1 // 3336
D;JNE // 3337

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
@ARG // 3338
A=M+1 // 3339
D=M // 3340
@2 // 3341
D=D+A // 3342
@3 // 3343
D=D+A // 3344
@SP // 3345
AM=M+1 // 3346
A=A-1 // 3347
M=D // 3348
@ARG // 3349
A=M+1 // 3350
D=M // 3351
@3 // 3352
A=D+A // 3353
D=M // 3354
@SP // 3355
AM=M-1 // 3356
A=M // 3357
M=D // 3358

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3359
0;JMP // 3360

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
@ARG // 3361
A=M // 3362
D=M // 3363
@SP // 3364
AM=M+1 // 3365
A=A-1 // 3366
M=D // 3367
@ARG // 3368
A=M+1 // 3369
D=M // 3370
@3 // 3371
A=D+A // 3372
D=M // 3373
@SP // 3374
AM=M-1 // 3375
A=M // 3376
M=D // 3377

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
//), ifGoto=IfGotoInstruction{label='Memory.remove_node.IfElse2}}
@Memory.remove_node.EQ.13 // 3378
D=A // 3379
@SP // 3380
AM=M+1 // 3381
A=A-1 // 3382
M=D // 3383
@ARG // 3384
A=M+1 // 3385
D=M // 3386
@3 // 3387
A=D+A // 3388
D=M // 3389
@DO_EQ // 3390
0;JMP // 3391
(Memory.remove_node.EQ.13)
@Memory.remove_node.IfElse2 // 3392
D;JNE // 3393

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
@ARG // 3394
A=M+1 // 3395
D=M // 3396
@3 // 3397
D=D+A // 3398
@2 // 3399
D=D+A // 3400
@SP // 3401
AM=M+1 // 3402
A=A-1 // 3403
M=D // 3404
@ARG // 3405
A=M+1 // 3406
D=M // 3407
@2 // 3408
A=D+A // 3409
D=M // 3410
@SP // 3411
AM=M-1 // 3412
A=M // 3413
M=D // 3414

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 3415
0;JMP // 3416

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
@ARG // 3417
A=M+1 // 3418
D=M // 3419
@2 // 3420
D=D+A // 3421
@SP // 3422
AM=M+1 // 3423
A=A-1 // 3424
M=D // 3425
D=0 // 3426
@SP // 3427
AM=M-1 // 3428
A=M // 3429
M=D // 3430

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3431
A=M+1 // 3432
D=M // 3433
@3 // 3434
D=D+A // 3435
@SP // 3436
AM=M+1 // 3437
A=A-1 // 3438
M=D // 3439
D=0 // 3440
@SP // 3441
AM=M-1 // 3442
A=M // 3443
M=D // 3444

////PushInstruction("constant 0")
@SP // 3445
AM=M+1 // 3446
A=A-1 // 3447
M=0 // 3448
@RETURN // 3449
0;JMP // 3450

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3451
AM=M+1 // 3452
A=A-1 // 3453
M=0 // 3454

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3455
A=M // 3456
M=0 // 3457

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
@Memory.getBinIndex.LT.14 // 3458
D=A // 3459
@SP // 3460
AM=M+1 // 3461
A=A-1 // 3462
M=D // 3463
@LCL // 3464
A=M // 3465
D=M // 3466
@7 // 3467
D=D-A // 3468
@DO_LT // 3469
0;JMP // 3470
(Memory.getBinIndex.LT.14)
@SP // 3471
AM=M+1 // 3472
A=A-1 // 3473
M=D // 3474
@Memory.getBinIndex.EQ.15 // 3475
D=A // 3476
@SP // 3477
AM=M+1 // 3478
A=A-1 // 3479
M=D // 3480
@LCL // 3481
A=M // 3482
D=M // 3483
@2048 // 3484
A=D+A // 3485
D=M // 3486
@DO_EQ // 3487
0;JMP // 3488
(Memory.getBinIndex.EQ.15)
D=!D // 3489
@SP // 3490
AM=M-1 // 3491
D=D&M // 3492
D=!D // 3493
@WHILE_END_Memory.getBinIndex1 // 3494
D;JNE // 3495

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
//), ifGoto=IfGotoInstruction{label='Memory.getBinIndex.IfElse1}}
@Memory.getBinIndex.GT.16 // 3496
D=A // 3497
@SP // 3498
AM=M+1 // 3499
A=A-1 // 3500
M=D // 3501
@ARG // 3502
A=M // 3503
D=M // 3504
@SP // 3505
AM=M+1 // 3506
A=A-1 // 3507
M=D // 3508
@LCL // 3509
A=M // 3510
D=M // 3511
@SP // 3512
AM=M+1 // 3513
A=A-1 // 3514
M=D+1 // 3515
@16 // 3516
D=A // 3517
@SP // 3518
AM=M+1 // 3519
A=A-1 // 3520
M=D // 3521
// call Math.multiply
@7 // 3522
D=A // 3523
@14 // 3524
M=D // 3525
@Math.multiply // 3526
D=A // 3527
@13 // 3528
M=D // 3529
@Memory.getBinIndex.ret.0 // 3530
D=A // 3531
@CALL // 3532
0;JMP // 3533
(Memory.getBinIndex.ret.0)
@SP // 3534
AM=M-1 // 3535
D=M // 3536
@SP // 3537
AM=M-1 // 3538
D=M-D // 3539
@DO_GT // 3540
0;JMP // 3541
(Memory.getBinIndex.GT.16)
@Memory.getBinIndex.IfElse1 // 3542
D;JNE // 3543

////PushInstruction("local 0")
@LCL // 3544
A=M // 3545
D=M // 3546
@SP // 3547
AM=M+1 // 3548
A=A-1 // 3549
M=D // 3550
@RETURN // 3551
0;JMP // 3552

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 3553
0;JMP // 3554

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

@LCL // 3555
A=M // 3556
M=M+1 // 3557

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3558
0;JMP // 3559

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
@6 // 3560
D=A // 3561
@SP // 3562
AM=M+1 // 3563
A=A-1 // 3564
M=D // 3565
@7 // 3566
D=A // 3567
@SP // 3568
AM=M+1 // 3569
A=A-1 // 3570
M=D-1 // 3571
@RETURN // 3572
0;JMP // 3573

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3574
AM=M+1 // 3575
A=A-1 // 3576
M=0 // 3577

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

@ARG // 3578
A=M // 3579
D=M // 3580
@0 // 3581
A=D+A // 3582
D=M // 3583
@LCL // 3584
A=M // 3585
M=D // 3586

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
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse1}}
@Memory.get_best_fit.LT.17 // 3587
D=A // 3588
@SP // 3589
AM=M+1 // 3590
A=A-1 // 3591
M=D // 3592
@LCL // 3593
A=M // 3594
D=M // 3595
@0 // 3596
A=D+A // 3597
D=M // 3598
@SP // 3599
AM=M+1 // 3600
A=A-1 // 3601
M=D // 3602
@ARG // 3603
A=M+1 // 3604
D=M // 3605
@SP // 3606
AM=M-1 // 3607
D=M-D // 3608
@DO_LT // 3609
0;JMP // 3610
(Memory.get_best_fit.LT.17)
@Memory.get_best_fit.IfElse1 // 3611
D;JNE // 3612

////PushInstruction("local 0")
@LCL // 3613
A=M // 3614
D=M // 3615
@SP // 3616
AM=M+1 // 3617
A=A-1 // 3618
M=D // 3619
@RETURN // 3620
0;JMP // 3621

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 3622
0;JMP // 3623

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
@Memory.get_best_fit.EQ.18 // 3624
D=A // 3625
@SP // 3626
AM=M+1 // 3627
A=A-1 // 3628
M=D // 3629
@LCL // 3630
A=M // 3631
D=M // 3632
@3 // 3633
A=D+A // 3634
D=M // 3635
@DO_EQ // 3636
0;JMP // 3637
(Memory.get_best_fit.EQ.18)
@WHILE_END_Memory.get_best_fit1 // 3638
D;JNE // 3639

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

@LCL // 3640
A=M // 3641
D=M // 3642
@3 // 3643
A=D+A // 3644
D=M // 3645
@LCL // 3646
A=M // 3647
M=D // 3648

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
//), ifGoto=IfGotoInstruction{label='Memory.get_best_fit.IfElse2}}
@Memory.get_best_fit.LT.19 // 3649
D=A // 3650
@SP // 3651
AM=M+1 // 3652
A=A-1 // 3653
M=D // 3654
@LCL // 3655
A=M // 3656
D=M // 3657
@0 // 3658
A=D+A // 3659
D=M // 3660
@SP // 3661
AM=M+1 // 3662
A=A-1 // 3663
M=D // 3664
@ARG // 3665
A=M+1 // 3666
D=M // 3667
@SP // 3668
AM=M-1 // 3669
D=M-D // 3670
@DO_LT // 3671
0;JMP // 3672
(Memory.get_best_fit.LT.19)
@Memory.get_best_fit.IfElse2 // 3673
D;JNE // 3674

////PushInstruction("local 0")
@LCL // 3675
A=M // 3676
D=M // 3677
@SP // 3678
AM=M+1 // 3679
A=A-1 // 3680
M=D // 3681
@RETURN // 3682
0;JMP // 3683

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 3684
0;JMP // 3685

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3686
0;JMP // 3687

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3688
AM=M+1 // 3689
A=A-1 // 3690
M=0 // 3691
@RETURN // 3692
0;JMP // 3693

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
@ARG // 3694
A=M // 3695
D=M // 3696
@SP // 3697
AM=M+1 // 3698
A=A-1 // 3699
M=D // 3700
@ARG // 3701
A=M // 3702
D=M // 3703
@0 // 3704
A=D+A // 3705
D=M // 3706
@4 // 3707
D=D+A // 3708
@SP // 3709
AM=M-1 // 3710
D=D+M // 3711
@SP // 3712
AM=M+1 // 3713
A=A-1 // 3714
M=D // 3715
@ARG // 3716
A=M // 3717
D=M // 3718
@SP // 3719
AM=M-1 // 3720
A=M // 3721
M=D // 3722

////PushInstruction("constant 0")
@SP // 3723
AM=M+1 // 3724
A=A-1 // 3725
M=0 // 3726
@RETURN // 3727
0;JMP // 3728

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3729
M=M+1 // 3730
AM=M+1 // 3731
A=A-1 // 3732
M=0 // 3733
A=A-1 // 3734
M=0 // 3735

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3736
A=M+1 // 3737
D=M // 3738
@2 // 3739
D=D+A // 3740
@SP // 3741
AM=M+1 // 3742
A=A-1 // 3743
M=D // 3744
D=0 // 3745
@SP // 3746
AM=M-1 // 3747
A=M // 3748
M=D // 3749

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3750
A=M+1 // 3751
D=M // 3752
@3 // 3753
D=D+A // 3754
@SP // 3755
AM=M+1 // 3756
A=A-1 // 3757
M=D // 3758
D=0 // 3759
@SP // 3760
AM=M-1 // 3761
A=M // 3762
M=D // 3763

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
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse1}}
@Memory.add_node.EQ.20 // 3764
D=A // 3765
@SP // 3766
AM=M+1 // 3767
A=A-1 // 3768
M=D // 3769
@ARG // 3770
A=M // 3771
D=M // 3772
@0 // 3773
A=D+A // 3774
D=M // 3775
@DO_EQ // 3776
0;JMP // 3777
(Memory.add_node.EQ.20)
D=!D // 3778
@Memory.add_node.IfElse1 // 3779
D;JNE // 3780

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3781
A=M // 3782
D=M // 3783
@SP // 3784
AM=M+1 // 3785
A=A-1 // 3786
M=D // 3787
@ARG // 3788
A=M+1 // 3789
D=M // 3790
@SP // 3791
AM=M-1 // 3792
A=M // 3793
M=D // 3794

////PushInstruction("constant 0")
@SP // 3795
AM=M+1 // 3796
A=A-1 // 3797
M=0 // 3798
@RETURN // 3799
0;JMP // 3800

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 3801
0;JMP // 3802

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

@ARG // 3803
A=M // 3804
D=M // 3805
@0 // 3806
A=D+A // 3807
D=M // 3808
@LCL // 3809
A=M // 3810
M=D // 3811

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3812
A=M+1 // 3813
M=0 // 3814

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
@Memory.add_node.EQ.21 // 3815
D=A // 3816
@SP // 3817
AM=M+1 // 3818
A=A-1 // 3819
M=D // 3820
@LCL // 3821
A=M // 3822
D=M // 3823
@DO_EQ // 3824
0;JMP // 3825
(Memory.add_node.EQ.21)
@SP // 3826
AM=M+1 // 3827
A=A-1 // 3828
M=D // 3829
@SP // 3830
A=M-1 // 3831
M=!D // 3832
@Memory.add_node.GT.22 // 3833
D=A // 3834
@SP // 3835
AM=M+1 // 3836
A=A-1 // 3837
M=D // 3838
@LCL // 3839
A=M // 3840
D=M // 3841
@0 // 3842
A=D+A // 3843
D=M // 3844
@SP // 3845
AM=M+1 // 3846
A=A-1 // 3847
M=D // 3848
@ARG // 3849
A=M+1 // 3850
D=M // 3851
@0 // 3852
A=D+A // 3853
D=M // 3854
@SP // 3855
AM=M-1 // 3856
D=M-D // 3857
@DO_GT // 3858
0;JMP // 3859
(Memory.add_node.GT.22)
D=!D // 3860
@SP // 3861
AM=M-1 // 3862
D=D&M // 3863
D=!D // 3864
@WHILE_END_Memory.add_node1 // 3865
D;JNE // 3866

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3867
A=M // 3868
D=M // 3869
@LCL // 3870
A=M+1 // 3871
M=D // 3872

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

@LCL // 3873
A=M // 3874
D=M // 3875
@3 // 3876
A=D+A // 3877
D=M // 3878
@LCL // 3879
A=M // 3880
M=D // 3881

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 3882
0;JMP // 3883

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL // 3884
A=M+1 // 3885
D=M // 3886
@Memory.add_node.IfElse2 // 3887
D;JNE // 3888

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
@ARG // 3889
A=M+1 // 3890
D=M // 3891
@3 // 3892
D=D+A // 3893
@SP // 3894
AM=M+1 // 3895
A=A-1 // 3896
M=D // 3897
@ARG // 3898
A=M // 3899
D=M // 3900
@0 // 3901
A=D+A // 3902
D=M // 3903
@SP // 3904
AM=M-1 // 3905
A=M // 3906
M=D // 3907

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
@ARG // 3908
A=M // 3909
D=M // 3910
@0 // 3911
D=D+A // 3912
@2 // 3913
D=D+A // 3914
@SP // 3915
AM=M+1 // 3916
A=A-1 // 3917
M=D // 3918
@ARG // 3919
A=M+1 // 3920
D=M // 3921
@SP // 3922
AM=M-1 // 3923
A=M // 3924
M=D // 3925

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3926
A=M // 3927
D=M // 3928
@SP // 3929
AM=M+1 // 3930
A=A-1 // 3931
M=D // 3932
@ARG // 3933
A=M+1 // 3934
D=M // 3935
@SP // 3936
AM=M-1 // 3937
A=M // 3938
M=D // 3939

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 3940
0;JMP // 3941

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
@ARG // 3942
A=M+1 // 3943
D=M // 3944
@3 // 3945
D=D+A // 3946
@SP // 3947
AM=M+1 // 3948
A=A-1 // 3949
M=D // 3950
@LCL // 3951
A=M // 3952
D=M // 3953
@SP // 3954
AM=M-1 // 3955
A=M // 3956
M=D // 3957

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3958
A=M+1 // 3959
D=M // 3960
@2 // 3961
D=D+A // 3962
@SP // 3963
AM=M+1 // 3964
A=A-1 // 3965
M=D // 3966
@LCL // 3967
A=M+1 // 3968
D=M // 3969
@SP // 3970
AM=M-1 // 3971
A=M // 3972
M=D // 3973

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 0"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@LCL // 3974
A=M // 3975
D=!M // 3976
@Memory.add_node.IfElse3 // 3977
D;JNE // 3978

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 3979
A=M // 3980
D=M // 3981
@2 // 3982
D=D+A // 3983
@SP // 3984
AM=M+1 // 3985
A=A-1 // 3986
M=D // 3987
@ARG // 3988
A=M+1 // 3989
D=M // 3990
@SP // 3991
AM=M-1 // 3992
A=M // 3993
M=D // 3994

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 3995
0;JMP // 3996

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
@LCL // 3997
A=M+1 // 3998
D=M // 3999
@3 // 4000
D=D+A // 4001
@SP // 4002
AM=M+1 // 4003
A=A-1 // 4004
M=D // 4005
@ARG // 4006
A=M+1 // 4007
D=M // 4008
@SP // 4009
AM=M-1 // 4010
A=M // 4011
M=D // 4012

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 4013
AM=M+1 // 4014
A=A-1 // 4015
M=0 // 4016
@RETURN // 4017
0;JMP // 4018

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
@ARG // 4019
A=M // 4020
D=M // 4021
@SP // 4022
AM=M+1 // 4023
A=A-1 // 4024
M=D // 4025
@ARG // 4026
A=M+1 // 4027
D=M // 4028
@SP // 4029
AM=M-1 // 4030
A=M // 4031
M=D // 4032

////PushInstruction("constant 0")
@SP // 4033
AM=M+1 // 4034
A=A-1 // 4035
M=0 // 4036
@RETURN // 4037
0;JMP // 4038

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
@ARG // 4039
A=M // 4040
D=M // 4041
@0 // 4042
A=D+A // 4043
D=M // 4044
@SP // 4045
AM=M+1 // 4046
A=A-1 // 4047
M=D // 4048
@RETURN // 4049
0;JMP // 4050

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 4051
D=A // 4052
@14 // 4053
M=D // 4054
@Output.initMap // 4055
D=A // 4056
@13 // 4057
M=D // 4058
@Output.init.ret.0 // 4059
D=A // 4060
@CALL // 4061
0;JMP // 4062
(Output.init.ret.0)
@SP // 4063
M=M-1 // 4064

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 4065
M=0 // 4066

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 4067
M=0 // 4068

////PushInstruction("constant 0")
@SP // 4069
AM=M+1 // 4070
A=A-1 // 4071
M=0 // 4072
@RETURN // 4073
0;JMP // 4074

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4075
AM=M+1 // 4076
A=A-1 // 4077
M=0 // 4078

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4079
D=A // 4080
@SP // 4081
AM=M+1 // 4082
A=A-1 // 4083
M=D // 4084
// call Array.new
@6 // 4085
D=A // 4086
@14 // 4087
M=D // 4088
@Array.new // 4089
D=A // 4090
@13 // 4091
M=D // 4092
@Output.initMap.ret.0 // 4093
D=A // 4094
@CALL // 4095
0;JMP // 4096
(Output.initMap.ret.0)
@SP // 4097
AM=M-1 // 4098
D=M // 4099
@Output.0 // 4100
M=D // 4101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4102
D=A // 4103
@SP // 4104
M=D+M // 4105
@63 // 4106
D=A // 4107
@SP // 4108
A=M-1 // 4109
M=0 // 4110
A=A-1 // 4111
M=0 // 4112
A=A-1 // 4113
M=D // 4114
A=A-1 // 4115
M=D // 4116
A=A-1 // 4117
M=D // 4118
A=A-1 // 4119
M=D // 4120
A=A-1 // 4121
M=D // 4122
A=A-1 // 4123
M=D // 4124
A=A-1 // 4125
M=D // 4126
A=A-1 // 4127
M=D // 4128
A=A-1 // 4129
M=D // 4130
A=A-1 // 4131
M=0 // 4132
// call Output.create
@17 // 4133
D=A // 4134
@14 // 4135
M=D // 4136
@Output.create // 4137
D=A // 4138
@13 // 4139
M=D // 4140
@Output.initMap.ret.1 // 4141
D=A // 4142
@CALL // 4143
0;JMP // 4144
(Output.initMap.ret.1)
@SP // 4145
M=M-1 // 4146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4147
D=A // 4148
@SP // 4149
M=D+M // 4150
@32 // 4151
D=A // 4152
@SP // 4153
A=M-1 // 4154
M=0 // 4155
A=A-1 // 4156
M=0 // 4157
A=A-1 // 4158
M=0 // 4159
A=A-1 // 4160
M=0 // 4161
A=A-1 // 4162
M=0 // 4163
A=A-1 // 4164
M=0 // 4165
A=A-1 // 4166
M=0 // 4167
A=A-1 // 4168
M=0 // 4169
A=A-1 // 4170
M=0 // 4171
A=A-1 // 4172
M=0 // 4173
A=A-1 // 4174
M=0 // 4175
A=A-1 // 4176
M=D // 4177
A=A-1 // 4178
// call Output.create
@17 // 4179
D=A // 4180
@14 // 4181
M=D // 4182
@Output.create // 4183
D=A // 4184
@13 // 4185
M=D // 4186
@Output.initMap.ret.2 // 4187
D=A // 4188
@CALL // 4189
0;JMP // 4190
(Output.initMap.ret.2)
@SP // 4191
M=M-1 // 4192

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4193
D=A // 4194
@SP // 4195
AM=M+1 // 4196
A=A-1 // 4197
M=D // 4198
@12 // 4199
D=A // 4200
@SP // 4201
AM=M+1 // 4202
A=A-1 // 4203
M=D // 4204
@30 // 4205
D=A // 4206
@SP // 4207
AM=M+1 // 4208
A=A-1 // 4209
M=D // 4210
@30 // 4211
D=A // 4212
@SP // 4213
AM=M+1 // 4214
A=A-1 // 4215
M=D // 4216
@30 // 4217
D=A // 4218
@SP // 4219
AM=M+1 // 4220
A=A-1 // 4221
M=D // 4222
@12 // 4223
D=A // 4224
@SP // 4225
AM=M+1 // 4226
A=A-1 // 4227
M=D // 4228
@12 // 4229
D=A // 4230
@SP // 4231
AM=M+1 // 4232
A=A-1 // 4233
M=D // 4234
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=0 // 4238
@4 // 4239
D=A // 4240
@SP // 4241
M=D+M // 4242
@12 // 4243
D=A // 4244
@SP // 4245
A=M-1 // 4246
M=0 // 4247
A=A-1 // 4248
M=0 // 4249
A=A-1 // 4250
M=D // 4251
A=A-1 // 4252
M=D // 4253
A=A-1 // 4254
// call Output.create
@17 // 4255
D=A // 4256
@14 // 4257
M=D // 4258
@Output.create // 4259
D=A // 4260
@13 // 4261
M=D // 4262
@Output.initMap.ret.3 // 4263
D=A // 4264
@CALL // 4265
0;JMP // 4266
(Output.initMap.ret.3)
@SP // 4267
M=M-1 // 4268

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4269
D=A // 4270
@SP // 4271
AM=M+1 // 4272
A=A-1 // 4273
M=D // 4274
@54 // 4275
D=A // 4276
@SP // 4277
AM=M+1 // 4278
A=A-1 // 4279
M=D // 4280
@54 // 4281
D=A // 4282
@SP // 4283
AM=M+1 // 4284
A=A-1 // 4285
M=D // 4286
@20 // 4287
D=A // 4288
@SP // 4289
AM=M+1 // 4290
A=A-1 // 4291
M=D // 4292
@SP // 4293
AM=M+1 // 4294
A=A-1 // 4295
M=0 // 4296
@SP // 4297
AM=M+1 // 4298
A=A-1 // 4299
M=0 // 4300
@SP // 4301
AM=M+1 // 4302
A=A-1 // 4303
M=0 // 4304
@SP // 4305
AM=M+1 // 4306
A=A-1 // 4307
M=0 // 4308
@SP // 4309
AM=M+1 // 4310
A=A-1 // 4311
M=0 // 4312
@SP // 4313
AM=M+1 // 4314
A=A-1 // 4315
M=0 // 4316
@SP // 4317
AM=M+1 // 4318
A=A-1 // 4319
M=0 // 4320
@SP // 4321
AM=M+1 // 4322
A=A-1 // 4323
M=0 // 4324
// call Output.create
@17 // 4325
D=A // 4326
@14 // 4327
M=D // 4328
@Output.create // 4329
D=A // 4330
@13 // 4331
M=D // 4332
@Output.initMap.ret.4 // 4333
D=A // 4334
@CALL // 4335
0;JMP // 4336
(Output.initMap.ret.4)
@SP // 4337
M=M-1 // 4338

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4339
D=A // 4340
@SP // 4341
M=D+M // 4342
@35 // 4343
D=A // 4344
@SP // 4345
A=M-1 // 4346
M=0 // 4347
A=A-1 // 4348
M=D // 4349
A=A-1 // 4350
@18 // 4351
D=A // 4352
@SP // 4353
AM=M+1 // 4354
A=A-1 // 4355
M=D // 4356
@18 // 4357
D=A // 4358
@SP // 4359
AM=M+1 // 4360
A=A-1 // 4361
M=D // 4362
@63 // 4363
D=A // 4364
@SP // 4365
AM=M+1 // 4366
A=A-1 // 4367
M=D // 4368
@18 // 4369
D=A // 4370
@SP // 4371
AM=M+1 // 4372
A=A-1 // 4373
M=D // 4374
@18 // 4375
D=A // 4376
@SP // 4377
AM=M+1 // 4378
A=A-1 // 4379
M=D // 4380
@63 // 4381
D=A // 4382
@SP // 4383
AM=M+1 // 4384
A=A-1 // 4385
M=D // 4386
@18 // 4387
D=A // 4388
@SP // 4389
AM=M+1 // 4390
A=A-1 // 4391
M=D // 4392
@18 // 4393
D=A // 4394
@SP // 4395
AM=M+1 // 4396
A=A-1 // 4397
M=D // 4398
@SP // 4399
AM=M+1 // 4400
A=A-1 // 4401
M=0 // 4402
@SP // 4403
AM=M+1 // 4404
A=A-1 // 4405
M=0 // 4406
// call Output.create
@17 // 4407
D=A // 4408
@14 // 4409
M=D // 4410
@Output.create // 4411
D=A // 4412
@13 // 4413
M=D // 4414
@Output.initMap.ret.5 // 4415
D=A // 4416
@CALL // 4417
0;JMP // 4418
(Output.initMap.ret.5)
@SP // 4419
M=M-1 // 4420

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4421
D=A // 4422
@SP // 4423
AM=M+1 // 4424
A=A-1 // 4425
M=D // 4426
@12 // 4427
D=A // 4428
@SP // 4429
AM=M+1 // 4430
A=A-1 // 4431
M=D // 4432
@30 // 4433
D=A // 4434
@SP // 4435
AM=M+1 // 4436
A=A-1 // 4437
M=D // 4438
@51 // 4439
D=A // 4440
@SP // 4441
AM=M+1 // 4442
A=A-1 // 4443
M=D // 4444
@3 // 4445
D=A // 4446
@SP // 4447
AM=M+1 // 4448
A=A-1 // 4449
M=D // 4450
@30 // 4451
D=A // 4452
@SP // 4453
AM=M+1 // 4454
A=A-1 // 4455
M=D // 4456
@48 // 4457
D=A // 4458
@SP // 4459
AM=M+1 // 4460
A=A-1 // 4461
M=D // 4462
@51 // 4463
D=A // 4464
@SP // 4465
AM=M+1 // 4466
A=A-1 // 4467
M=D // 4468
@30 // 4469
D=A // 4470
@SP // 4471
AM=M+1 // 4472
A=A-1 // 4473
M=D // 4474
@12 // 4475
D=A // 4476
@SP // 4477
AM=M+1 // 4478
A=A-1 // 4479
M=D // 4480
@12 // 4481
D=A // 4482
@SP // 4483
AM=M+1 // 4484
A=A-1 // 4485
M=D // 4486
@SP // 4487
AM=M+1 // 4488
A=A-1 // 4489
M=0 // 4490
// call Output.create
@17 // 4491
D=A // 4492
@14 // 4493
M=D // 4494
@Output.create // 4495
D=A // 4496
@13 // 4497
M=D // 4498
@Output.initMap.ret.6 // 4499
D=A // 4500
@CALL // 4501
0;JMP // 4502
(Output.initMap.ret.6)
@SP // 4503
M=M-1 // 4504

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4505
D=A // 4506
@SP // 4507
M=D+M // 4508
@37 // 4509
D=A // 4510
@SP // 4511
A=M-1 // 4512
M=0 // 4513
A=A-1 // 4514
M=0 // 4515
A=A-1 // 4516
M=D // 4517
A=A-1 // 4518
@35 // 4519
D=A // 4520
@SP // 4521
AM=M+1 // 4522
A=A-1 // 4523
M=D // 4524
@51 // 4525
D=A // 4526
@SP // 4527
AM=M+1 // 4528
A=A-1 // 4529
M=D // 4530
@24 // 4531
D=A // 4532
@SP // 4533
AM=M+1 // 4534
A=A-1 // 4535
M=D // 4536
@12 // 4537
D=A // 4538
@SP // 4539
AM=M+1 // 4540
A=A-1 // 4541
M=D // 4542
@6 // 4543
D=A // 4544
@SP // 4545
AM=M+1 // 4546
A=A-1 // 4547
M=D // 4548
@51 // 4549
D=A // 4550
@SP // 4551
AM=M+1 // 4552
A=A-1 // 4553
M=D // 4554
@49 // 4555
D=A // 4556
@SP // 4557
AM=M+1 // 4558
A=A-1 // 4559
M=D // 4560
@SP // 4561
AM=M+1 // 4562
A=A-1 // 4563
M=0 // 4564
@SP // 4565
AM=M+1 // 4566
A=A-1 // 4567
M=0 // 4568
// call Output.create
@17 // 4569
D=A // 4570
@14 // 4571
M=D // 4572
@Output.create // 4573
D=A // 4574
@13 // 4575
M=D // 4576
@Output.initMap.ret.7 // 4577
D=A // 4578
@CALL // 4579
0;JMP // 4580
(Output.initMap.ret.7)
@SP // 4581
M=M-1 // 4582

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4583
D=A // 4584
@SP // 4585
AM=M+1 // 4586
A=A-1 // 4587
M=D // 4588
@12 // 4589
D=A // 4590
@SP // 4591
AM=M+1 // 4592
A=A-1 // 4593
M=D // 4594
@30 // 4595
D=A // 4596
@SP // 4597
AM=M+1 // 4598
A=A-1 // 4599
M=D // 4600
@30 // 4601
D=A // 4602
@SP // 4603
AM=M+1 // 4604
A=A-1 // 4605
M=D // 4606
@12 // 4607
D=A // 4608
@SP // 4609
AM=M+1 // 4610
A=A-1 // 4611
M=D // 4612
@54 // 4613
D=A // 4614
@SP // 4615
AM=M+1 // 4616
A=A-1 // 4617
M=D // 4618
@27 // 4619
D=A // 4620
@SP // 4621
AM=M+1 // 4622
A=A-1 // 4623
M=D // 4624
@27 // 4625
D=A // 4626
@SP // 4627
AM=M+1 // 4628
A=A-1 // 4629
M=D // 4630
@27 // 4631
D=A // 4632
@SP // 4633
AM=M+1 // 4634
A=A-1 // 4635
M=D // 4636
@54 // 4637
D=A // 4638
@SP // 4639
AM=M+1 // 4640
A=A-1 // 4641
M=D // 4642
@SP // 4643
AM=M+1 // 4644
A=A-1 // 4645
M=0 // 4646
@SP // 4647
AM=M+1 // 4648
A=A-1 // 4649
M=0 // 4650
// call Output.create
@17 // 4651
D=A // 4652
@14 // 4653
M=D // 4654
@Output.create // 4655
D=A // 4656
@13 // 4657
M=D // 4658
@Output.initMap.ret.8 // 4659
D=A // 4660
@CALL // 4661
0;JMP // 4662
(Output.initMap.ret.8)
@SP // 4663
M=M-1 // 4664

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4665
D=A // 4666
@SP // 4667
AM=M+1 // 4668
A=A-1 // 4669
M=D // 4670
@12 // 4671
D=A // 4672
@SP // 4673
AM=M+1 // 4674
A=A-1 // 4675
M=D // 4676
@12 // 4677
D=A // 4678
@SP // 4679
AM=M+1 // 4680
A=A-1 // 4681
M=D // 4682
@6 // 4683
D=A // 4684
@SP // 4685
AM=M+1 // 4686
A=A-1 // 4687
M=D // 4688
@SP // 4689
AM=M+1 // 4690
A=A-1 // 4691
M=0 // 4692
@SP // 4693
AM=M+1 // 4694
A=A-1 // 4695
M=0 // 4696
@SP // 4697
AM=M+1 // 4698
A=A-1 // 4699
M=0 // 4700
@SP // 4701
AM=M+1 // 4702
A=A-1 // 4703
M=0 // 4704
@SP // 4705
AM=M+1 // 4706
A=A-1 // 4707
M=0 // 4708
@SP // 4709
AM=M+1 // 4710
A=A-1 // 4711
M=0 // 4712
@SP // 4713
AM=M+1 // 4714
A=A-1 // 4715
M=0 // 4716
@SP // 4717
AM=M+1 // 4718
A=A-1 // 4719
M=0 // 4720
// call Output.create
@17 // 4721
D=A // 4722
@14 // 4723
M=D // 4724
@Output.create // 4725
D=A // 4726
@13 // 4727
M=D // 4728
@Output.initMap.ret.9 // 4729
D=A // 4730
@CALL // 4731
0;JMP // 4732
(Output.initMap.ret.9)
@SP // 4733
M=M-1 // 4734

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4735
D=A // 4736
@SP // 4737
AM=M+1 // 4738
A=A-1 // 4739
M=D // 4740
@24 // 4741
D=A // 4742
@SP // 4743
AM=M+1 // 4744
A=A-1 // 4745
M=D // 4746
@12 // 4747
D=A // 4748
@SP // 4749
AM=M+1 // 4750
A=A-1 // 4751
M=D // 4752
@6 // 4753
D=A // 4754
@SP // 4755
AM=M+1 // 4756
A=A-1 // 4757
M=D // 4758
@6 // 4759
D=A // 4760
@SP // 4761
AM=M+1 // 4762
A=A-1 // 4763
M=D // 4764
@6 // 4765
D=A // 4766
@SP // 4767
AM=M+1 // 4768
A=A-1 // 4769
M=D // 4770
@6 // 4771
D=A // 4772
@SP // 4773
AM=M+1 // 4774
A=A-1 // 4775
M=D // 4776
@6 // 4777
D=A // 4778
@SP // 4779
AM=M+1 // 4780
A=A-1 // 4781
M=D // 4782
@12 // 4783
D=A // 4784
@SP // 4785
AM=M+1 // 4786
A=A-1 // 4787
M=D // 4788
@24 // 4789
D=A // 4790
@SP // 4791
AM=M+1 // 4792
A=A-1 // 4793
M=D // 4794
@SP // 4795
AM=M+1 // 4796
A=A-1 // 4797
M=0 // 4798
@SP // 4799
AM=M+1 // 4800
A=A-1 // 4801
M=0 // 4802
// call Output.create
@17 // 4803
D=A // 4804
@14 // 4805
M=D // 4806
@Output.create // 4807
D=A // 4808
@13 // 4809
M=D // 4810
@Output.initMap.ret.10 // 4811
D=A // 4812
@CALL // 4813
0;JMP // 4814
(Output.initMap.ret.10)
@SP // 4815
M=M-1 // 4816

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4817
D=A // 4818
@SP // 4819
AM=M+1 // 4820
A=A-1 // 4821
M=D // 4822
@6 // 4823
D=A // 4824
@SP // 4825
AM=M+1 // 4826
A=A-1 // 4827
M=D // 4828
@12 // 4829
D=A // 4830
@SP // 4831
AM=M+1 // 4832
A=A-1 // 4833
M=D // 4834
@24 // 4835
D=A // 4836
@SP // 4837
AM=M+1 // 4838
A=A-1 // 4839
M=D // 4840
@24 // 4841
D=A // 4842
@SP // 4843
AM=M+1 // 4844
A=A-1 // 4845
M=D // 4846
@24 // 4847
D=A // 4848
@SP // 4849
AM=M+1 // 4850
A=A-1 // 4851
M=D // 4852
@24 // 4853
D=A // 4854
@SP // 4855
AM=M+1 // 4856
A=A-1 // 4857
M=D // 4858
@24 // 4859
D=A // 4860
@SP // 4861
AM=M+1 // 4862
A=A-1 // 4863
M=D // 4864
@12 // 4865
D=A // 4866
@SP // 4867
AM=M+1 // 4868
A=A-1 // 4869
M=D // 4870
@6 // 4871
D=A // 4872
@SP // 4873
AM=M+1 // 4874
A=A-1 // 4875
M=D // 4876
@SP // 4877
AM=M+1 // 4878
A=A-1 // 4879
M=0 // 4880
@SP // 4881
AM=M+1 // 4882
A=A-1 // 4883
M=0 // 4884
// call Output.create
@17 // 4885
D=A // 4886
@14 // 4887
M=D // 4888
@Output.create // 4889
D=A // 4890
@13 // 4891
M=D // 4892
@Output.initMap.ret.11 // 4893
D=A // 4894
@CALL // 4895
0;JMP // 4896
(Output.initMap.ret.11)
@SP // 4897
M=M-1 // 4898

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4899
D=A // 4900
@SP // 4901
M=D+M // 4902
@42 // 4903
D=A // 4904
@SP // 4905
A=M-1 // 4906
M=0 // 4907
A=A-1 // 4908
M=0 // 4909
A=A-1 // 4910
M=0 // 4911
A=A-1 // 4912
M=D // 4913
A=A-1 // 4914
@51 // 4915
D=A // 4916
@SP // 4917
AM=M+1 // 4918
A=A-1 // 4919
M=D // 4920
@30 // 4921
D=A // 4922
@SP // 4923
AM=M+1 // 4924
A=A-1 // 4925
M=D // 4926
@63 // 4927
D=A // 4928
@SP // 4929
AM=M+1 // 4930
A=A-1 // 4931
M=D // 4932
@30 // 4933
D=A // 4934
@SP // 4935
AM=M+1 // 4936
A=A-1 // 4937
M=D // 4938
@51 // 4939
D=A // 4940
@SP // 4941
AM=M+1 // 4942
A=A-1 // 4943
M=D // 4944
@SP // 4945
AM=M+1 // 4946
A=A-1 // 4947
M=0 // 4948
@SP // 4949
AM=M+1 // 4950
A=A-1 // 4951
M=0 // 4952
@SP // 4953
AM=M+1 // 4954
A=A-1 // 4955
M=0 // 4956
// call Output.create
@17 // 4957
D=A // 4958
@14 // 4959
M=D // 4960
@Output.create // 4961
D=A // 4962
@13 // 4963
M=D // 4964
@Output.initMap.ret.12 // 4965
D=A // 4966
@CALL // 4967
0;JMP // 4968
(Output.initMap.ret.12)
@SP // 4969
M=M-1 // 4970

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4971
D=A // 4972
@SP // 4973
M=D+M // 4974
@43 // 4975
D=A // 4976
@SP // 4977
A=M-1 // 4978
M=0 // 4979
A=A-1 // 4980
M=0 // 4981
A=A-1 // 4982
M=0 // 4983
A=A-1 // 4984
M=D // 4985
A=A-1 // 4986
@12 // 4987
D=A // 4988
@SP // 4989
AM=M+1 // 4990
A=A-1 // 4991
M=D // 4992
@12 // 4993
D=A // 4994
@SP // 4995
AM=M+1 // 4996
A=A-1 // 4997
M=D // 4998
@63 // 4999
D=A // 5000
@SP // 5001
AM=M+1 // 5002
A=A-1 // 5003
M=D // 5004
@12 // 5005
D=A // 5006
@SP // 5007
AM=M+1 // 5008
A=A-1 // 5009
M=D // 5010
@12 // 5011
D=A // 5012
@SP // 5013
AM=M+1 // 5014
A=A-1 // 5015
M=D // 5016
@SP // 5017
AM=M+1 // 5018
A=A-1 // 5019
M=0 // 5020
@SP // 5021
AM=M+1 // 5022
A=A-1 // 5023
M=0 // 5024
@SP // 5025
AM=M+1 // 5026
A=A-1 // 5027
M=0 // 5028
// call Output.create
@17 // 5029
D=A // 5030
@14 // 5031
M=D // 5032
@Output.create // 5033
D=A // 5034
@13 // 5035
M=D // 5036
@Output.initMap.ret.13 // 5037
D=A // 5038
@CALL // 5039
0;JMP // 5040
(Output.initMap.ret.13)
@SP // 5041
M=M-1 // 5042

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5043
D=A // 5044
@SP // 5045
M=D+M // 5046
@44 // 5047
D=A // 5048
@SP // 5049
A=M-1 // 5050
M=0 // 5051
A=A-1 // 5052
M=0 // 5053
A=A-1 // 5054
M=0 // 5055
A=A-1 // 5056
M=0 // 5057
A=A-1 // 5058
M=0 // 5059
A=A-1 // 5060
M=0 // 5061
A=A-1 // 5062
M=0 // 5063
A=A-1 // 5064
M=D // 5065
A=A-1 // 5066
@12 // 5067
D=A // 5068
@SP // 5069
AM=M+1 // 5070
A=A-1 // 5071
M=D // 5072
@12 // 5073
D=A // 5074
@SP // 5075
AM=M+1 // 5076
A=A-1 // 5077
M=D // 5078
@6 // 5079
D=A // 5080
@SP // 5081
AM=M+1 // 5082
A=A-1 // 5083
M=D // 5084
@SP // 5085
AM=M+1 // 5086
A=A-1 // 5087
M=0 // 5088
// call Output.create
@17 // 5089
D=A // 5090
@14 // 5091
M=D // 5092
@Output.create // 5093
D=A // 5094
@13 // 5095
M=D // 5096
@Output.initMap.ret.14 // 5097
D=A // 5098
@CALL // 5099
0;JMP // 5100
(Output.initMap.ret.14)
@SP // 5101
M=M-1 // 5102

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5103
D=A // 5104
@SP // 5105
M=D+M // 5106
@45 // 5107
D=A // 5108
@SP // 5109
A=M-1 // 5110
M=0 // 5111
A=A-1 // 5112
M=0 // 5113
A=A-1 // 5114
M=0 // 5115
A=A-1 // 5116
M=0 // 5117
A=A-1 // 5118
M=0 // 5119
A=A-1 // 5120
M=D // 5121
A=A-1 // 5122
@6 // 5123
D=A // 5124
@SP // 5125
M=D+M // 5126
@63 // 5127
D=A // 5128
@SP // 5129
A=M-1 // 5130
M=0 // 5131
A=A-1 // 5132
M=0 // 5133
A=A-1 // 5134
M=0 // 5135
A=A-1 // 5136
M=0 // 5137
A=A-1 // 5138
M=0 // 5139
A=A-1 // 5140
M=D // 5141
A=A-1 // 5142
// call Output.create
@17 // 5143
D=A // 5144
@14 // 5145
M=D // 5146
@Output.create // 5147
D=A // 5148
@13 // 5149
M=D // 5150
@Output.initMap.ret.15 // 5151
D=A // 5152
@CALL // 5153
0;JMP // 5154
(Output.initMap.ret.15)
@SP // 5155
M=M-1 // 5156

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5157
D=A // 5158
@SP // 5159
M=D+M // 5160
@46 // 5161
D=A // 5162
@SP // 5163
A=M-1 // 5164
M=0 // 5165
A=A-1 // 5166
M=0 // 5167
A=A-1 // 5168
M=0 // 5169
A=A-1 // 5170
M=0 // 5171
A=A-1 // 5172
M=0 // 5173
A=A-1 // 5174
M=0 // 5175
A=A-1 // 5176
M=0 // 5177
A=A-1 // 5178
M=D // 5179
A=A-1 // 5180
@4 // 5181
D=A // 5182
@SP // 5183
M=D+M // 5184
@12 // 5185
D=A // 5186
@SP // 5187
A=M-1 // 5188
M=0 // 5189
A=A-1 // 5190
M=0 // 5191
A=A-1 // 5192
M=D // 5193
A=A-1 // 5194
M=D // 5195
A=A-1 // 5196
// call Output.create
@17 // 5197
D=A // 5198
@14 // 5199
M=D // 5200
@Output.create // 5201
D=A // 5202
@13 // 5203
M=D // 5204
@Output.initMap.ret.16 // 5205
D=A // 5206
@CALL // 5207
0;JMP // 5208
(Output.initMap.ret.16)
@SP // 5209
M=M-1 // 5210

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5211
D=A // 5212
@SP // 5213
M=D+M // 5214
@47 // 5215
D=A // 5216
@SP // 5217
A=M-1 // 5218
M=0 // 5219
A=A-1 // 5220
M=0 // 5221
A=A-1 // 5222
M=D // 5223
A=A-1 // 5224
@32 // 5225
D=A // 5226
@SP // 5227
AM=M+1 // 5228
A=A-1 // 5229
M=D // 5230
@48 // 5231
D=A // 5232
@SP // 5233
AM=M+1 // 5234
A=A-1 // 5235
M=D // 5236
@24 // 5237
D=A // 5238
@SP // 5239
AM=M+1 // 5240
A=A-1 // 5241
M=D // 5242
@12 // 5243
D=A // 5244
@SP // 5245
AM=M+1 // 5246
A=A-1 // 5247
M=D // 5248
@6 // 5249
D=A // 5250
@SP // 5251
AM=M+1 // 5252
A=A-1 // 5253
M=D // 5254
@3 // 5255
D=A // 5256
@SP // 5257
AM=M+1 // 5258
A=A-1 // 5259
M=D // 5260
@SP // 5261
AM=M+1 // 5262
A=A-1 // 5263
M=1 // 5264
@SP // 5265
AM=M+1 // 5266
A=A-1 // 5267
M=0 // 5268
@SP // 5269
AM=M+1 // 5270
A=A-1 // 5271
M=0 // 5272
// call Output.create
@17 // 5273
D=A // 5274
@14 // 5275
M=D // 5276
@Output.create // 5277
D=A // 5278
@13 // 5279
M=D // 5280
@Output.initMap.ret.17 // 5281
D=A // 5282
@CALL // 5283
0;JMP // 5284
(Output.initMap.ret.17)
@SP // 5285
M=M-1 // 5286

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5287
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
@30 // 5299
D=A // 5300
@SP // 5301
AM=M+1 // 5302
A=A-1 // 5303
M=D // 5304
@51 // 5305
D=A // 5306
@SP // 5307
AM=M+1 // 5308
A=A-1 // 5309
M=D // 5310
@51 // 5311
D=A // 5312
@SP // 5313
AM=M+1 // 5314
A=A-1 // 5315
M=D // 5316
@51 // 5317
D=A // 5318
@SP // 5319
AM=M+1 // 5320
A=A-1 // 5321
M=D // 5322
@51 // 5323
D=A // 5324
@SP // 5325
AM=M+1 // 5326
A=A-1 // 5327
M=D // 5328
@51 // 5329
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
@12 // 5341
D=A // 5342
@SP // 5343
AM=M+1 // 5344
A=A-1 // 5345
M=D // 5346
@SP // 5347
AM=M+1 // 5348
A=A-1 // 5349
M=0 // 5350
@SP // 5351
AM=M+1 // 5352
A=A-1 // 5353
M=0 // 5354
// call Output.create
@17 // 5355
D=A // 5356
@14 // 5357
M=D // 5358
@Output.create // 5359
D=A // 5360
@13 // 5361
M=D // 5362
@Output.initMap.ret.18 // 5363
D=A // 5364
@CALL // 5365
0;JMP // 5366
(Output.initMap.ret.18)
@SP // 5367
M=M-1 // 5368

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5369
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
@14 // 5381
D=A // 5382
@SP // 5383
AM=M+1 // 5384
A=A-1 // 5385
M=D // 5386
@15 // 5387
D=A // 5388
@SP // 5389
AM=M+1 // 5390
A=A-1 // 5391
M=D // 5392
@12 // 5393
D=A // 5394
@SP // 5395
AM=M+1 // 5396
A=A-1 // 5397
M=D // 5398
@12 // 5399
D=A // 5400
@SP // 5401
AM=M+1 // 5402
A=A-1 // 5403
M=D // 5404
@12 // 5405
D=A // 5406
@SP // 5407
AM=M+1 // 5408
A=A-1 // 5409
M=D // 5410
@12 // 5411
D=A // 5412
@SP // 5413
AM=M+1 // 5414
A=A-1 // 5415
M=D // 5416
@12 // 5417
D=A // 5418
@SP // 5419
AM=M+1 // 5420
A=A-1 // 5421
M=D // 5422
@63 // 5423
D=A // 5424
@SP // 5425
AM=M+1 // 5426
A=A-1 // 5427
M=D // 5428
@SP // 5429
AM=M+1 // 5430
A=A-1 // 5431
M=0 // 5432
@SP // 5433
AM=M+1 // 5434
A=A-1 // 5435
M=0 // 5436
// call Output.create
@17 // 5437
D=A // 5438
@14 // 5439
M=D // 5440
@Output.create // 5441
D=A // 5442
@13 // 5443
M=D // 5444
@Output.initMap.ret.19 // 5445
D=A // 5446
@CALL // 5447
0;JMP // 5448
(Output.initMap.ret.19)
@SP // 5449
M=M-1 // 5450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5451
D=A // 5452
@SP // 5453
AM=M+1 // 5454
A=A-1 // 5455
M=D // 5456
@30 // 5457
D=A // 5458
@SP // 5459
AM=M+1 // 5460
A=A-1 // 5461
M=D // 5462
@51 // 5463
D=A // 5464
@SP // 5465
AM=M+1 // 5466
A=A-1 // 5467
M=D // 5468
@48 // 5469
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
@12 // 5481
D=A // 5482
@SP // 5483
AM=M+1 // 5484
A=A-1 // 5485
M=D // 5486
@6 // 5487
D=A // 5488
@SP // 5489
AM=M+1 // 5490
A=A-1 // 5491
M=D // 5492
@3 // 5493
D=A // 5494
@SP // 5495
AM=M+1 // 5496
A=A-1 // 5497
M=D // 5498
@51 // 5499
D=A // 5500
@SP // 5501
AM=M+1 // 5502
A=A-1 // 5503
M=D // 5504
@63 // 5505
D=A // 5506
@SP // 5507
AM=M+1 // 5508
A=A-1 // 5509
M=D // 5510
@SP // 5511
AM=M+1 // 5512
A=A-1 // 5513
M=0 // 5514
@SP // 5515
AM=M+1 // 5516
A=A-1 // 5517
M=0 // 5518
// call Output.create
@17 // 5519
D=A // 5520
@14 // 5521
M=D // 5522
@Output.create // 5523
D=A // 5524
@13 // 5525
M=D // 5526
@Output.initMap.ret.20 // 5527
D=A // 5528
@CALL // 5529
0;JMP // 5530
(Output.initMap.ret.20)
@SP // 5531
M=M-1 // 5532

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5533
D=A // 5534
@SP // 5535
AM=M+1 // 5536
A=A-1 // 5537
M=D // 5538
@30 // 5539
D=A // 5540
@SP // 5541
AM=M+1 // 5542
A=A-1 // 5543
M=D // 5544
@51 // 5545
D=A // 5546
@SP // 5547
AM=M+1 // 5548
A=A-1 // 5549
M=D // 5550
@48 // 5551
D=A // 5552
@SP // 5553
AM=M+1 // 5554
A=A-1 // 5555
M=D // 5556
@48 // 5557
D=A // 5558
@SP // 5559
AM=M+1 // 5560
A=A-1 // 5561
M=D // 5562
@28 // 5563
D=A // 5564
@SP // 5565
AM=M+1 // 5566
A=A-1 // 5567
M=D // 5568
@48 // 5569
D=A // 5570
@SP // 5571
AM=M+1 // 5572
A=A-1 // 5573
M=D // 5574
@48 // 5575
D=A // 5576
@SP // 5577
AM=M+1 // 5578
A=A-1 // 5579
M=D // 5580
@51 // 5581
D=A // 5582
@SP // 5583
AM=M+1 // 5584
A=A-1 // 5585
M=D // 5586
@30 // 5587
D=A // 5588
@SP // 5589
AM=M+1 // 5590
A=A-1 // 5591
M=D // 5592
@SP // 5593
AM=M+1 // 5594
A=A-1 // 5595
M=0 // 5596
@SP // 5597
AM=M+1 // 5598
A=A-1 // 5599
M=0 // 5600
// call Output.create
@17 // 5601
D=A // 5602
@14 // 5603
M=D // 5604
@Output.create // 5605
D=A // 5606
@13 // 5607
M=D // 5608
@Output.initMap.ret.21 // 5609
D=A // 5610
@CALL // 5611
0;JMP // 5612
(Output.initMap.ret.21)
@SP // 5613
M=M-1 // 5614

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5615
D=A // 5616
@SP // 5617
AM=M+1 // 5618
A=A-1 // 5619
M=D // 5620
@16 // 5621
D=A // 5622
@SP // 5623
AM=M+1 // 5624
A=A-1 // 5625
M=D // 5626
@24 // 5627
D=A // 5628
@SP // 5629
AM=M+1 // 5630
A=A-1 // 5631
M=D // 5632
@28 // 5633
D=A // 5634
@SP // 5635
AM=M+1 // 5636
A=A-1 // 5637
M=D // 5638
@26 // 5639
D=A // 5640
@SP // 5641
AM=M+1 // 5642
A=A-1 // 5643
M=D // 5644
@25 // 5645
D=A // 5646
@SP // 5647
AM=M+1 // 5648
A=A-1 // 5649
M=D // 5650
@63 // 5651
D=A // 5652
@SP // 5653
AM=M+1 // 5654
A=A-1 // 5655
M=D // 5656
@24 // 5657
D=A // 5658
@SP // 5659
AM=M+1 // 5660
A=A-1 // 5661
M=D // 5662
@24 // 5663
D=A // 5664
@SP // 5665
AM=M+1 // 5666
A=A-1 // 5667
M=D // 5668
@60 // 5669
D=A // 5670
@SP // 5671
AM=M+1 // 5672
A=A-1 // 5673
M=D // 5674
@SP // 5675
AM=M+1 // 5676
A=A-1 // 5677
M=0 // 5678
@SP // 5679
AM=M+1 // 5680
A=A-1 // 5681
M=0 // 5682
// call Output.create
@17 // 5683
D=A // 5684
@14 // 5685
M=D // 5686
@Output.create // 5687
D=A // 5688
@13 // 5689
M=D // 5690
@Output.initMap.ret.22 // 5691
D=A // 5692
@CALL // 5693
0;JMP // 5694
(Output.initMap.ret.22)
@SP // 5695
M=M-1 // 5696

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5697
D=A // 5698
@SP // 5699
AM=M+1 // 5700
A=A-1 // 5701
M=D // 5702
@63 // 5703
D=A // 5704
@SP // 5705
AM=M+1 // 5706
A=A-1 // 5707
M=D // 5708
@3 // 5709
D=A // 5710
@SP // 5711
AM=M+1 // 5712
A=A-1 // 5713
M=D // 5714
@3 // 5715
D=A // 5716
@SP // 5717
AM=M+1 // 5718
A=A-1 // 5719
M=D // 5720
@31 // 5721
D=A // 5722
@SP // 5723
AM=M+1 // 5724
A=A-1 // 5725
M=D // 5726
@48 // 5727
D=A // 5728
@SP // 5729
AM=M+1 // 5730
A=A-1 // 5731
M=D // 5732
@48 // 5733
D=A // 5734
@SP // 5735
AM=M+1 // 5736
A=A-1 // 5737
M=D // 5738
@48 // 5739
D=A // 5740
@SP // 5741
AM=M+1 // 5742
A=A-1 // 5743
M=D // 5744
@51 // 5745
D=A // 5746
@SP // 5747
AM=M+1 // 5748
A=A-1 // 5749
M=D // 5750
@30 // 5751
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
// call Output.create
@17 // 5765
D=A // 5766
@14 // 5767
M=D // 5768
@Output.create // 5769
D=A // 5770
@13 // 5771
M=D // 5772
@Output.initMap.ret.23 // 5773
D=A // 5774
@CALL // 5775
0;JMP // 5776
(Output.initMap.ret.23)
@SP // 5777
M=M-1 // 5778

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5779
D=A // 5780
@SP // 5781
AM=M+1 // 5782
A=A-1 // 5783
M=D // 5784
@28 // 5785
D=A // 5786
@SP // 5787
AM=M+1 // 5788
A=A-1 // 5789
M=D // 5790
@6 // 5791
D=A // 5792
@SP // 5793
AM=M+1 // 5794
A=A-1 // 5795
M=D // 5796
@3 // 5797
D=A // 5798
@SP // 5799
AM=M+1 // 5800
A=A-1 // 5801
M=D // 5802
@3 // 5803
D=A // 5804
@SP // 5805
AM=M+1 // 5806
A=A-1 // 5807
M=D // 5808
@31 // 5809
D=A // 5810
@SP // 5811
AM=M+1 // 5812
A=A-1 // 5813
M=D // 5814
@51 // 5815
D=A // 5816
@SP // 5817
AM=M+1 // 5818
A=A-1 // 5819
M=D // 5820
@51 // 5821
D=A // 5822
@SP // 5823
AM=M+1 // 5824
A=A-1 // 5825
M=D // 5826
@51 // 5827
D=A // 5828
@SP // 5829
AM=M+1 // 5830
A=A-1 // 5831
M=D // 5832
@30 // 5833
D=A // 5834
@SP // 5835
AM=M+1 // 5836
A=A-1 // 5837
M=D // 5838
@SP // 5839
AM=M+1 // 5840
A=A-1 // 5841
M=0 // 5842
@SP // 5843
AM=M+1 // 5844
A=A-1 // 5845
M=0 // 5846
// call Output.create
@17 // 5847
D=A // 5848
@14 // 5849
M=D // 5850
@Output.create // 5851
D=A // 5852
@13 // 5853
M=D // 5854
@Output.initMap.ret.24 // 5855
D=A // 5856
@CALL // 5857
0;JMP // 5858
(Output.initMap.ret.24)
@SP // 5859
M=M-1 // 5860

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 5861
D=A // 5862
@SP // 5863
AM=M+1 // 5864
A=A-1 // 5865
M=D // 5866
@63 // 5867
D=A // 5868
@SP // 5869
AM=M+1 // 5870
A=A-1 // 5871
M=D // 5872
@49 // 5873
D=A // 5874
@SP // 5875
AM=M+1 // 5876
A=A-1 // 5877
M=D // 5878
@48 // 5879
D=A // 5880
@SP // 5881
AM=M+1 // 5882
A=A-1 // 5883
M=D // 5884
@48 // 5885
D=A // 5886
@SP // 5887
AM=M+1 // 5888
A=A-1 // 5889
M=D // 5890
@24 // 5891
D=A // 5892
@SP // 5893
AM=M+1 // 5894
A=A-1 // 5895
M=D // 5896
@12 // 5897
D=A // 5898
@SP // 5899
AM=M+1 // 5900
A=A-1 // 5901
M=D // 5902
@12 // 5903
D=A // 5904
@SP // 5905
AM=M+1 // 5906
A=A-1 // 5907
M=D // 5908
@12 // 5909
D=A // 5910
@SP // 5911
AM=M+1 // 5912
A=A-1 // 5913
M=D // 5914
@12 // 5915
D=A // 5916
@SP // 5917
AM=M+1 // 5918
A=A-1 // 5919
M=D // 5920
@SP // 5921
AM=M+1 // 5922
A=A-1 // 5923
M=0 // 5924
@SP // 5925
AM=M+1 // 5926
A=A-1 // 5927
M=0 // 5928
// call Output.create
@17 // 5929
D=A // 5930
@14 // 5931
M=D // 5932
@Output.create // 5933
D=A // 5934
@13 // 5935
M=D // 5936
@Output.initMap.ret.25 // 5937
D=A // 5938
@CALL // 5939
0;JMP // 5940
(Output.initMap.ret.25)
@SP // 5941
M=M-1 // 5942

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 5943
D=A // 5944
@SP // 5945
AM=M+1 // 5946
A=A-1 // 5947
M=D // 5948
@30 // 5949
D=A // 5950
@SP // 5951
AM=M+1 // 5952
A=A-1 // 5953
M=D // 5954
@51 // 5955
D=A // 5956
@SP // 5957
AM=M+1 // 5958
A=A-1 // 5959
M=D // 5960
@51 // 5961
D=A // 5962
@SP // 5963
AM=M+1 // 5964
A=A-1 // 5965
M=D // 5966
@51 // 5967
D=A // 5968
@SP // 5969
AM=M+1 // 5970
A=A-1 // 5971
M=D // 5972
@30 // 5973
D=A // 5974
@SP // 5975
AM=M+1 // 5976
A=A-1 // 5977
M=D // 5978
@51 // 5979
D=A // 5980
@SP // 5981
AM=M+1 // 5982
A=A-1 // 5983
M=D // 5984
@51 // 5985
D=A // 5986
@SP // 5987
AM=M+1 // 5988
A=A-1 // 5989
M=D // 5990
@51 // 5991
D=A // 5992
@SP // 5993
AM=M+1 // 5994
A=A-1 // 5995
M=D // 5996
@30 // 5997
D=A // 5998
@SP // 5999
AM=M+1 // 6000
A=A-1 // 6001
M=D // 6002
@SP // 6003
AM=M+1 // 6004
A=A-1 // 6005
M=0 // 6006
@SP // 6007
AM=M+1 // 6008
A=A-1 // 6009
M=0 // 6010
// call Output.create
@17 // 6011
D=A // 6012
@14 // 6013
M=D // 6014
@Output.create // 6015
D=A // 6016
@13 // 6017
M=D // 6018
@Output.initMap.ret.26 // 6019
D=A // 6020
@CALL // 6021
0;JMP // 6022
(Output.initMap.ret.26)
@SP // 6023
M=M-1 // 6024

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6025
D=A // 6026
@SP // 6027
AM=M+1 // 6028
A=A-1 // 6029
M=D // 6030
@30 // 6031
D=A // 6032
@SP // 6033
AM=M+1 // 6034
A=A-1 // 6035
M=D // 6036
@51 // 6037
D=A // 6038
@SP // 6039
AM=M+1 // 6040
A=A-1 // 6041
M=D // 6042
@51 // 6043
D=A // 6044
@SP // 6045
AM=M+1 // 6046
A=A-1 // 6047
M=D // 6048
@51 // 6049
D=A // 6050
@SP // 6051
AM=M+1 // 6052
A=A-1 // 6053
M=D // 6054
@62 // 6055
D=A // 6056
@SP // 6057
AM=M+1 // 6058
A=A-1 // 6059
M=D // 6060
@48 // 6061
D=A // 6062
@SP // 6063
AM=M+1 // 6064
A=A-1 // 6065
M=D // 6066
@48 // 6067
D=A // 6068
@SP // 6069
AM=M+1 // 6070
A=A-1 // 6071
M=D // 6072
@24 // 6073
D=A // 6074
@SP // 6075
AM=M+1 // 6076
A=A-1 // 6077
M=D // 6078
@14 // 6079
D=A // 6080
@SP // 6081
AM=M+1 // 6082
A=A-1 // 6083
M=D // 6084
@SP // 6085
AM=M+1 // 6086
A=A-1 // 6087
M=0 // 6088
@SP // 6089
AM=M+1 // 6090
A=A-1 // 6091
M=0 // 6092
// call Output.create
@17 // 6093
D=A // 6094
@14 // 6095
M=D // 6096
@Output.create // 6097
D=A // 6098
@13 // 6099
M=D // 6100
@Output.initMap.ret.27 // 6101
D=A // 6102
@CALL // 6103
0;JMP // 6104
(Output.initMap.ret.27)
@SP // 6105
M=M-1 // 6106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6107
D=A // 6108
@SP // 6109
M=D+M // 6110
@58 // 6111
D=A // 6112
@SP // 6113
A=M-1 // 6114
M=0 // 6115
A=A-1 // 6116
M=0 // 6117
A=A-1 // 6118
M=D // 6119
A=A-1 // 6120
@4 // 6121
D=A // 6122
@SP // 6123
M=D+M // 6124
@12 // 6125
D=A // 6126
@SP // 6127
A=M-1 // 6128
M=0 // 6129
A=A-1 // 6130
M=0 // 6131
A=A-1 // 6132
M=D // 6133
A=A-1 // 6134
M=D // 6135
A=A-1 // 6136
@5 // 6137
D=A // 6138
@SP // 6139
M=D+M // 6140
@12 // 6141
D=A // 6142
@SP // 6143
A=M-1 // 6144
M=0 // 6145
A=A-1 // 6146
M=0 // 6147
A=A-1 // 6148
M=0 // 6149
A=A-1 // 6150
M=D // 6151
A=A-1 // 6152
M=D // 6153
A=A-1 // 6154
// call Output.create
@17 // 6155
D=A // 6156
@14 // 6157
M=D // 6158
@Output.create // 6159
D=A // 6160
@13 // 6161
M=D // 6162
@Output.initMap.ret.28 // 6163
D=A // 6164
@CALL // 6165
0;JMP // 6166
(Output.initMap.ret.28)
@SP // 6167
M=M-1 // 6168

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6169
D=A // 6170
@SP // 6171
M=D+M // 6172
@59 // 6173
D=A // 6174
@SP // 6175
A=M-1 // 6176
M=0 // 6177
A=A-1 // 6178
M=0 // 6179
A=A-1 // 6180
M=D // 6181
A=A-1 // 6182
@4 // 6183
D=A // 6184
@SP // 6185
M=D+M // 6186
@12 // 6187
D=A // 6188
@SP // 6189
A=M-1 // 6190
M=0 // 6191
A=A-1 // 6192
M=0 // 6193
A=A-1 // 6194
M=D // 6195
A=A-1 // 6196
M=D // 6197
A=A-1 // 6198
@12 // 6199
D=A // 6200
@SP // 6201
AM=M+1 // 6202
A=A-1 // 6203
M=D // 6204
@12 // 6205
D=A // 6206
@SP // 6207
AM=M+1 // 6208
A=A-1 // 6209
M=D // 6210
@6 // 6211
D=A // 6212
@SP // 6213
AM=M+1 // 6214
A=A-1 // 6215
M=D // 6216
@SP // 6217
AM=M+1 // 6218
A=A-1 // 6219
M=0 // 6220
@SP // 6221
AM=M+1 // 6222
A=A-1 // 6223
M=0 // 6224
// call Output.create
@17 // 6225
D=A // 6226
@14 // 6227
M=D // 6228
@Output.create // 6229
D=A // 6230
@13 // 6231
M=D // 6232
@Output.initMap.ret.29 // 6233
D=A // 6234
@CALL // 6235
0;JMP // 6236
(Output.initMap.ret.29)
@SP // 6237
M=M-1 // 6238

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6239
D=A // 6240
@SP // 6241
M=D+M // 6242
@60 // 6243
D=A // 6244
@SP // 6245
A=M-1 // 6246
M=0 // 6247
A=A-1 // 6248
M=0 // 6249
A=A-1 // 6250
M=D // 6251
A=A-1 // 6252
@24 // 6253
D=A // 6254
@SP // 6255
AM=M+1 // 6256
A=A-1 // 6257
M=D // 6258
@12 // 6259
D=A // 6260
@SP // 6261
AM=M+1 // 6262
A=A-1 // 6263
M=D // 6264
@6 // 6265
D=A // 6266
@SP // 6267
AM=M+1 // 6268
A=A-1 // 6269
M=D // 6270
@3 // 6271
D=A // 6272
@SP // 6273
AM=M+1 // 6274
A=A-1 // 6275
M=D // 6276
@6 // 6277
D=A // 6278
@SP // 6279
AM=M+1 // 6280
A=A-1 // 6281
M=D // 6282
@12 // 6283
D=A // 6284
@SP // 6285
AM=M+1 // 6286
A=A-1 // 6287
M=D // 6288
@24 // 6289
D=A // 6290
@SP // 6291
AM=M+1 // 6292
A=A-1 // 6293
M=D // 6294
@SP // 6295
AM=M+1 // 6296
A=A-1 // 6297
M=0 // 6298
@SP // 6299
AM=M+1 // 6300
A=A-1 // 6301
M=0 // 6302
// call Output.create
@17 // 6303
D=A // 6304
@14 // 6305
M=D // 6306
@Output.create // 6307
D=A // 6308
@13 // 6309
M=D // 6310
@Output.initMap.ret.30 // 6311
D=A // 6312
@CALL // 6313
0;JMP // 6314
(Output.initMap.ret.30)
@SP // 6315
M=M-1 // 6316

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6317
D=A // 6318
@SP // 6319
M=D+M // 6320
@61 // 6321
D=A // 6322
@SP // 6323
A=M-1 // 6324
M=0 // 6325
A=A-1 // 6326
M=0 // 6327
A=A-1 // 6328
M=0 // 6329
A=A-1 // 6330
M=D // 6331
A=A-1 // 6332
@3 // 6333
D=A // 6334
@SP // 6335
M=D+M // 6336
@63 // 6337
D=A // 6338
@SP // 6339
A=M-1 // 6340
M=0 // 6341
A=A-1 // 6342
M=0 // 6343
A=A-1 // 6344
M=D // 6345
A=A-1 // 6346
@5 // 6347
D=A // 6348
@SP // 6349
M=D+M // 6350
@63 // 6351
D=A // 6352
@SP // 6353
A=M-1 // 6354
M=0 // 6355
A=A-1 // 6356
M=0 // 6357
A=A-1 // 6358
M=0 // 6359
A=A-1 // 6360
M=0 // 6361
A=A-1 // 6362
M=D // 6363
A=A-1 // 6364
// call Output.create
@17 // 6365
D=A // 6366
@14 // 6367
M=D // 6368
@Output.create // 6369
D=A // 6370
@13 // 6371
M=D // 6372
@Output.initMap.ret.31 // 6373
D=A // 6374
@CALL // 6375
0;JMP // 6376
(Output.initMap.ret.31)
@SP // 6377
M=M-1 // 6378

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6379
D=A // 6380
@SP // 6381
M=D+M // 6382
@62 // 6383
D=A // 6384
@SP // 6385
A=M-1 // 6386
M=0 // 6387
A=A-1 // 6388
M=0 // 6389
A=A-1 // 6390
M=D // 6391
A=A-1 // 6392
@3 // 6393
D=A // 6394
@SP // 6395
AM=M+1 // 6396
A=A-1 // 6397
M=D // 6398
@6 // 6399
D=A // 6400
@SP // 6401
AM=M+1 // 6402
A=A-1 // 6403
M=D // 6404
@12 // 6405
D=A // 6406
@SP // 6407
AM=M+1 // 6408
A=A-1 // 6409
M=D // 6410
@24 // 6411
D=A // 6412
@SP // 6413
AM=M+1 // 6414
A=A-1 // 6415
M=D // 6416
@12 // 6417
D=A // 6418
@SP // 6419
AM=M+1 // 6420
A=A-1 // 6421
M=D // 6422
@6 // 6423
D=A // 6424
@SP // 6425
AM=M+1 // 6426
A=A-1 // 6427
M=D // 6428
@3 // 6429
D=A // 6430
@SP // 6431
AM=M+1 // 6432
A=A-1 // 6433
M=D // 6434
@SP // 6435
AM=M+1 // 6436
A=A-1 // 6437
M=0 // 6438
@SP // 6439
AM=M+1 // 6440
A=A-1 // 6441
M=0 // 6442
// call Output.create
@17 // 6443
D=A // 6444
@14 // 6445
M=D // 6446
@Output.create // 6447
D=A // 6448
@13 // 6449
M=D // 6450
@Output.initMap.ret.32 // 6451
D=A // 6452
@CALL // 6453
0;JMP // 6454
(Output.initMap.ret.32)
@SP // 6455
M=M-1 // 6456

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6457
D=A // 6458
@SP // 6459
AM=M+1 // 6460
A=A-1 // 6461
M=D // 6462
@30 // 6463
D=A // 6464
@SP // 6465
AM=M+1 // 6466
A=A-1 // 6467
M=D // 6468
@51 // 6469
D=A // 6470
@SP // 6471
AM=M+1 // 6472
A=A-1 // 6473
M=D // 6474
@51 // 6475
D=A // 6476
@SP // 6477
AM=M+1 // 6478
A=A-1 // 6479
M=D // 6480
@59 // 6481
D=A // 6482
@SP // 6483
AM=M+1 // 6484
A=A-1 // 6485
M=D // 6486
@59 // 6487
D=A // 6488
@SP // 6489
AM=M+1 // 6490
A=A-1 // 6491
M=D // 6492
@59 // 6493
D=A // 6494
@SP // 6495
AM=M+1 // 6496
A=A-1 // 6497
M=D // 6498
@27 // 6499
D=A // 6500
@SP // 6501
AM=M+1 // 6502
A=A-1 // 6503
M=D // 6504
@3 // 6505
D=A // 6506
@SP // 6507
AM=M+1 // 6508
A=A-1 // 6509
M=D // 6510
@30 // 6511
D=A // 6512
@SP // 6513
AM=M+1 // 6514
A=A-1 // 6515
M=D // 6516
@SP // 6517
AM=M+1 // 6518
A=A-1 // 6519
M=0 // 6520
@SP // 6521
AM=M+1 // 6522
A=A-1 // 6523
M=0 // 6524
// call Output.create
@17 // 6525
D=A // 6526
@14 // 6527
M=D // 6528
@Output.create // 6529
D=A // 6530
@13 // 6531
M=D // 6532
@Output.initMap.ret.33 // 6533
D=A // 6534
@CALL // 6535
0;JMP // 6536
(Output.initMap.ret.33)
@SP // 6537
M=M-1 // 6538

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6539
D=A // 6540
@SP // 6541
AM=M+1 // 6542
A=A-1 // 6543
M=D // 6544
@30 // 6545
D=A // 6546
@SP // 6547
AM=M+1 // 6548
A=A-1 // 6549
M=D // 6550
@51 // 6551
D=A // 6552
@SP // 6553
AM=M+1 // 6554
A=A-1 // 6555
M=D // 6556
@51 // 6557
D=A // 6558
@SP // 6559
AM=M+1 // 6560
A=A-1 // 6561
M=D // 6562
@24 // 6563
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
@SP // 6581
AM=M+1 // 6582
A=A-1 // 6583
M=0 // 6584
@4 // 6585
D=A // 6586
@SP // 6587
M=D+M // 6588
@12 // 6589
D=A // 6590
@SP // 6591
A=M-1 // 6592
M=0 // 6593
A=A-1 // 6594
M=0 // 6595
A=A-1 // 6596
M=D // 6597
A=A-1 // 6598
M=D // 6599
A=A-1 // 6600
// call Output.create
@17 // 6601
D=A // 6602
@14 // 6603
M=D // 6604
@Output.create // 6605
D=A // 6606
@13 // 6607
M=D // 6608
@Output.initMap.ret.34 // 6609
D=A // 6610
@CALL // 6611
0;JMP // 6612
(Output.initMap.ret.34)
@SP // 6613
M=M-1 // 6614

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6615
D=A // 6616
@SP // 6617
AM=M+1 // 6618
A=A-1 // 6619
M=D // 6620
@12 // 6621
D=A // 6622
@SP // 6623
AM=M+1 // 6624
A=A-1 // 6625
M=D // 6626
@30 // 6627
D=A // 6628
@SP // 6629
AM=M+1 // 6630
A=A-1 // 6631
M=D // 6632
@51 // 6633
D=A // 6634
@SP // 6635
AM=M+1 // 6636
A=A-1 // 6637
M=D // 6638
@51 // 6639
D=A // 6640
@SP // 6641
AM=M+1 // 6642
A=A-1 // 6643
M=D // 6644
@63 // 6645
D=A // 6646
@SP // 6647
AM=M+1 // 6648
A=A-1 // 6649
M=D // 6650
@51 // 6651
D=A // 6652
@SP // 6653
AM=M+1 // 6654
A=A-1 // 6655
M=D // 6656
@51 // 6657
D=A // 6658
@SP // 6659
AM=M+1 // 6660
A=A-1 // 6661
M=D // 6662
@51 // 6663
D=A // 6664
@SP // 6665
AM=M+1 // 6666
A=A-1 // 6667
M=D // 6668
@51 // 6669
D=A // 6670
@SP // 6671
AM=M+1 // 6672
A=A-1 // 6673
M=D // 6674
@SP // 6675
AM=M+1 // 6676
A=A-1 // 6677
M=0 // 6678
@SP // 6679
AM=M+1 // 6680
A=A-1 // 6681
M=0 // 6682
// call Output.create
@17 // 6683
D=A // 6684
@14 // 6685
M=D // 6686
@Output.create // 6687
D=A // 6688
@13 // 6689
M=D // 6690
@Output.initMap.ret.35 // 6691
D=A // 6692
@CALL // 6693
0;JMP // 6694
(Output.initMap.ret.35)
@SP // 6695
M=M-1 // 6696

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6697
D=A // 6698
@SP // 6699
AM=M+1 // 6700
A=A-1 // 6701
M=D // 6702
@31 // 6703
D=A // 6704
@SP // 6705
AM=M+1 // 6706
A=A-1 // 6707
M=D // 6708
@51 // 6709
D=A // 6710
@SP // 6711
AM=M+1 // 6712
A=A-1 // 6713
M=D // 6714
@51 // 6715
D=A // 6716
@SP // 6717
AM=M+1 // 6718
A=A-1 // 6719
M=D // 6720
@51 // 6721
D=A // 6722
@SP // 6723
AM=M+1 // 6724
A=A-1 // 6725
M=D // 6726
@31 // 6727
D=A // 6728
@SP // 6729
AM=M+1 // 6730
A=A-1 // 6731
M=D // 6732
@51 // 6733
D=A // 6734
@SP // 6735
AM=M+1 // 6736
A=A-1 // 6737
M=D // 6738
@51 // 6739
D=A // 6740
@SP // 6741
AM=M+1 // 6742
A=A-1 // 6743
M=D // 6744
@51 // 6745
D=A // 6746
@SP // 6747
AM=M+1 // 6748
A=A-1 // 6749
M=D // 6750
@31 // 6751
D=A // 6752
@SP // 6753
AM=M+1 // 6754
A=A-1 // 6755
M=D // 6756
@SP // 6757
AM=M+1 // 6758
A=A-1 // 6759
M=0 // 6760
@SP // 6761
AM=M+1 // 6762
A=A-1 // 6763
M=0 // 6764
// call Output.create
@17 // 6765
D=A // 6766
@14 // 6767
M=D // 6768
@Output.create // 6769
D=A // 6770
@13 // 6771
M=D // 6772
@Output.initMap.ret.36 // 6773
D=A // 6774
@CALL // 6775
0;JMP // 6776
(Output.initMap.ret.36)
@SP // 6777
M=M-1 // 6778

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6779
D=A // 6780
@SP // 6781
AM=M+1 // 6782
A=A-1 // 6783
M=D // 6784
@28 // 6785
D=A // 6786
@SP // 6787
AM=M+1 // 6788
A=A-1 // 6789
M=D // 6790
@54 // 6791
D=A // 6792
@SP // 6793
AM=M+1 // 6794
A=A-1 // 6795
M=D // 6796
@35 // 6797
D=A // 6798
@SP // 6799
AM=M+1 // 6800
A=A-1 // 6801
M=D // 6802
@3 // 6803
D=A // 6804
@SP // 6805
AM=M+1 // 6806
A=A-1 // 6807
M=D // 6808
@3 // 6809
D=A // 6810
@SP // 6811
AM=M+1 // 6812
A=A-1 // 6813
M=D // 6814
@3 // 6815
D=A // 6816
@SP // 6817
AM=M+1 // 6818
A=A-1 // 6819
M=D // 6820
@35 // 6821
D=A // 6822
@SP // 6823
AM=M+1 // 6824
A=A-1 // 6825
M=D // 6826
@54 // 6827
D=A // 6828
@SP // 6829
AM=M+1 // 6830
A=A-1 // 6831
M=D // 6832
@28 // 6833
D=A // 6834
@SP // 6835
AM=M+1 // 6836
A=A-1 // 6837
M=D // 6838
@SP // 6839
AM=M+1 // 6840
A=A-1 // 6841
M=0 // 6842
@SP // 6843
AM=M+1 // 6844
A=A-1 // 6845
M=0 // 6846
// call Output.create
@17 // 6847
D=A // 6848
@14 // 6849
M=D // 6850
@Output.create // 6851
D=A // 6852
@13 // 6853
M=D // 6854
@Output.initMap.ret.37 // 6855
D=A // 6856
@CALL // 6857
0;JMP // 6858
(Output.initMap.ret.37)
@SP // 6859
M=M-1 // 6860

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 6861
D=A // 6862
@SP // 6863
AM=M+1 // 6864
A=A-1 // 6865
M=D // 6866
@15 // 6867
D=A // 6868
@SP // 6869
AM=M+1 // 6870
A=A-1 // 6871
M=D // 6872
@27 // 6873
D=A // 6874
@SP // 6875
AM=M+1 // 6876
A=A-1 // 6877
M=D // 6878
@51 // 6879
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
@51 // 6891
D=A // 6892
@SP // 6893
AM=M+1 // 6894
A=A-1 // 6895
M=D // 6896
@51 // 6897
D=A // 6898
@SP // 6899
AM=M+1 // 6900
A=A-1 // 6901
M=D // 6902
@51 // 6903
D=A // 6904
@SP // 6905
AM=M+1 // 6906
A=A-1 // 6907
M=D // 6908
@27 // 6909
D=A // 6910
@SP // 6911
AM=M+1 // 6912
A=A-1 // 6913
M=D // 6914
@15 // 6915
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
@Output.initMap.ret.38 // 6937
D=A // 6938
@CALL // 6939
0;JMP // 6940
(Output.initMap.ret.38)
@SP // 6941
M=M-1 // 6942

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 6943
D=A // 6944
@SP // 6945
AM=M+1 // 6946
A=A-1 // 6947
M=D // 6948
@63 // 6949
D=A // 6950
@SP // 6951
AM=M+1 // 6952
A=A-1 // 6953
M=D // 6954
@51 // 6955
D=A // 6956
@SP // 6957
AM=M+1 // 6958
A=A-1 // 6959
M=D // 6960
@35 // 6961
D=A // 6962
@SP // 6963
AM=M+1 // 6964
A=A-1 // 6965
M=D // 6966
@11 // 6967
D=A // 6968
@SP // 6969
AM=M+1 // 6970
A=A-1 // 6971
M=D // 6972
@15 // 6973
D=A // 6974
@SP // 6975
AM=M+1 // 6976
A=A-1 // 6977
M=D // 6978
@11 // 6979
D=A // 6980
@SP // 6981
AM=M+1 // 6982
A=A-1 // 6983
M=D // 6984
@35 // 6985
D=A // 6986
@SP // 6987
AM=M+1 // 6988
A=A-1 // 6989
M=D // 6990
@51 // 6991
D=A // 6992
@SP // 6993
AM=M+1 // 6994
A=A-1 // 6995
M=D // 6996
@63 // 6997
D=A // 6998
@SP // 6999
AM=M+1 // 7000
A=A-1 // 7001
M=D // 7002
@SP // 7003
AM=M+1 // 7004
A=A-1 // 7005
M=0 // 7006
@SP // 7007
AM=M+1 // 7008
A=A-1 // 7009
M=0 // 7010
// call Output.create
@17 // 7011
D=A // 7012
@14 // 7013
M=D // 7014
@Output.create // 7015
D=A // 7016
@13 // 7017
M=D // 7018
@Output.initMap.ret.39 // 7019
D=A // 7020
@CALL // 7021
0;JMP // 7022
(Output.initMap.ret.39)
@SP // 7023
M=M-1 // 7024

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7025
D=A // 7026
@SP // 7027
AM=M+1 // 7028
A=A-1 // 7029
M=D // 7030
@63 // 7031
D=A // 7032
@SP // 7033
AM=M+1 // 7034
A=A-1 // 7035
M=D // 7036
@51 // 7037
D=A // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=D // 7042
@35 // 7043
D=A // 7044
@SP // 7045
AM=M+1 // 7046
A=A-1 // 7047
M=D // 7048
@11 // 7049
D=A // 7050
@SP // 7051
AM=M+1 // 7052
A=A-1 // 7053
M=D // 7054
@15 // 7055
D=A // 7056
@SP // 7057
AM=M+1 // 7058
A=A-1 // 7059
M=D // 7060
@11 // 7061
D=A // 7062
@SP // 7063
AM=M+1 // 7064
A=A-1 // 7065
M=D // 7066
@3 // 7067
D=A // 7068
@SP // 7069
AM=M+1 // 7070
A=A-1 // 7071
M=D // 7072
@3 // 7073
D=A // 7074
@SP // 7075
AM=M+1 // 7076
A=A-1 // 7077
M=D // 7078
@3 // 7079
D=A // 7080
@SP // 7081
AM=M+1 // 7082
A=A-1 // 7083
M=D // 7084
@SP // 7085
AM=M+1 // 7086
A=A-1 // 7087
M=0 // 7088
@SP // 7089
AM=M+1 // 7090
A=A-1 // 7091
M=0 // 7092
// call Output.create
@17 // 7093
D=A // 7094
@14 // 7095
M=D // 7096
@Output.create // 7097
D=A // 7098
@13 // 7099
M=D // 7100
@Output.initMap.ret.40 // 7101
D=A // 7102
@CALL // 7103
0;JMP // 7104
(Output.initMap.ret.40)
@SP // 7105
M=M-1 // 7106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7107
D=A // 7108
@SP // 7109
AM=M+1 // 7110
A=A-1 // 7111
M=D // 7112
@28 // 7113
D=A // 7114
@SP // 7115
AM=M+1 // 7116
A=A-1 // 7117
M=D // 7118
@54 // 7119
D=A // 7120
@SP // 7121
AM=M+1 // 7122
A=A-1 // 7123
M=D // 7124
@35 // 7125
D=A // 7126
@SP // 7127
AM=M+1 // 7128
A=A-1 // 7129
M=D // 7130
@3 // 7131
D=A // 7132
@SP // 7133
AM=M+1 // 7134
A=A-1 // 7135
M=D // 7136
@59 // 7137
D=A // 7138
@SP // 7139
AM=M+1 // 7140
A=A-1 // 7141
M=D // 7142
@51 // 7143
D=A // 7144
@SP // 7145
AM=M+1 // 7146
A=A-1 // 7147
M=D // 7148
@51 // 7149
D=A // 7150
@SP // 7151
AM=M+1 // 7152
A=A-1 // 7153
M=D // 7154
@54 // 7155
D=A // 7156
@SP // 7157
AM=M+1 // 7158
A=A-1 // 7159
M=D // 7160
@44 // 7161
D=A // 7162
@SP // 7163
AM=M+1 // 7164
A=A-1 // 7165
M=D // 7166
@SP // 7167
AM=M+1 // 7168
A=A-1 // 7169
M=0 // 7170
@SP // 7171
AM=M+1 // 7172
A=A-1 // 7173
M=0 // 7174
// call Output.create
@17 // 7175
D=A // 7176
@14 // 7177
M=D // 7178
@Output.create // 7179
D=A // 7180
@13 // 7181
M=D // 7182
@Output.initMap.ret.41 // 7183
D=A // 7184
@CALL // 7185
0;JMP // 7186
(Output.initMap.ret.41)
@SP // 7187
M=M-1 // 7188

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7189
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
@51 // 7207
D=A // 7208
@SP // 7209
AM=M+1 // 7210
A=A-1 // 7211
M=D // 7212
@51 // 7213
D=A // 7214
@SP // 7215
AM=M+1 // 7216
A=A-1 // 7217
M=D // 7218
@63 // 7219
D=A // 7220
@SP // 7221
AM=M+1 // 7222
A=A-1 // 7223
M=D // 7224
@51 // 7225
D=A // 7226
@SP // 7227
AM=M+1 // 7228
A=A-1 // 7229
M=D // 7230
@51 // 7231
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
@51 // 7243
D=A // 7244
@SP // 7245
AM=M+1 // 7246
A=A-1 // 7247
M=D // 7248
@SP // 7249
AM=M+1 // 7250
A=A-1 // 7251
M=0 // 7252
@SP // 7253
AM=M+1 // 7254
A=A-1 // 7255
M=0 // 7256
// call Output.create
@17 // 7257
D=A // 7258
@14 // 7259
M=D // 7260
@Output.create // 7261
D=A // 7262
@13 // 7263
M=D // 7264
@Output.initMap.ret.42 // 7265
D=A // 7266
@CALL // 7267
0;JMP // 7268
(Output.initMap.ret.42)
@SP // 7269
M=M-1 // 7270

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7271
D=A // 7272
@SP // 7273
AM=M+1 // 7274
A=A-1 // 7275
M=D // 7276
@30 // 7277
D=A // 7278
@SP // 7279
AM=M+1 // 7280
A=A-1 // 7281
M=D // 7282
@12 // 7283
D=A // 7284
@SP // 7285
AM=M+1 // 7286
A=A-1 // 7287
M=D // 7288
@12 // 7289
D=A // 7290
@SP // 7291
AM=M+1 // 7292
A=A-1 // 7293
M=D // 7294
@12 // 7295
D=A // 7296
@SP // 7297
AM=M+1 // 7298
A=A-1 // 7299
M=D // 7300
@12 // 7301
D=A // 7302
@SP // 7303
AM=M+1 // 7304
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
@12 // 7319
D=A // 7320
@SP // 7321
AM=M+1 // 7322
A=A-1 // 7323
M=D // 7324
@30 // 7325
D=A // 7326
@SP // 7327
AM=M+1 // 7328
A=A-1 // 7329
M=D // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=0 // 7334
@SP // 7335
AM=M+1 // 7336
A=A-1 // 7337
M=0 // 7338
// call Output.create
@17 // 7339
D=A // 7340
@14 // 7341
M=D // 7342
@Output.create // 7343
D=A // 7344
@13 // 7345
M=D // 7346
@Output.initMap.ret.43 // 7347
D=A // 7348
@CALL // 7349
0;JMP // 7350
(Output.initMap.ret.43)
@SP // 7351
M=M-1 // 7352

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7353
D=A // 7354
@SP // 7355
AM=M+1 // 7356
A=A-1 // 7357
M=D // 7358
@60 // 7359
D=A // 7360
@SP // 7361
AM=M+1 // 7362
A=A-1 // 7363
M=D // 7364
@24 // 7365
D=A // 7366
@SP // 7367
AM=M+1 // 7368
A=A-1 // 7369
M=D // 7370
@24 // 7371
D=A // 7372
@SP // 7373
AM=M+1 // 7374
A=A-1 // 7375
M=D // 7376
@24 // 7377
D=A // 7378
@SP // 7379
AM=M+1 // 7380
A=A-1 // 7381
M=D // 7382
@24 // 7383
D=A // 7384
@SP // 7385
AM=M+1 // 7386
A=A-1 // 7387
M=D // 7388
@24 // 7389
D=A // 7390
@SP // 7391
AM=M+1 // 7392
A=A-1 // 7393
M=D // 7394
@27 // 7395
D=A // 7396
@SP // 7397
AM=M+1 // 7398
A=A-1 // 7399
M=D // 7400
@27 // 7401
D=A // 7402
@SP // 7403
AM=M+1 // 7404
A=A-1 // 7405
M=D // 7406
@14 // 7407
D=A // 7408
@SP // 7409
AM=M+1 // 7410
A=A-1 // 7411
M=D // 7412
@SP // 7413
AM=M+1 // 7414
A=A-1 // 7415
M=0 // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=0 // 7420
// call Output.create
@17 // 7421
D=A // 7422
@14 // 7423
M=D // 7424
@Output.create // 7425
D=A // 7426
@13 // 7427
M=D // 7428
@Output.initMap.ret.44 // 7429
D=A // 7430
@CALL // 7431
0;JMP // 7432
(Output.initMap.ret.44)
@SP // 7433
M=M-1 // 7434

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7435
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
@51 // 7453
D=A // 7454
@SP // 7455
AM=M+1 // 7456
A=A-1 // 7457
M=D // 7458
@27 // 7459
D=A // 7460
@SP // 7461
AM=M+1 // 7462
A=A-1 // 7463
M=D // 7464
@15 // 7465
D=A // 7466
@SP // 7467
AM=M+1 // 7468
A=A-1 // 7469
M=D // 7470
@27 // 7471
D=A // 7472
@SP // 7473
AM=M+1 // 7474
A=A-1 // 7475
M=D // 7476
@51 // 7477
D=A // 7478
@SP // 7479
AM=M+1 // 7480
A=A-1 // 7481
M=D // 7482
@51 // 7483
D=A // 7484
@SP // 7485
AM=M+1 // 7486
A=A-1 // 7487
M=D // 7488
@51 // 7489
D=A // 7490
@SP // 7491
AM=M+1 // 7492
A=A-1 // 7493
M=D // 7494
@SP // 7495
AM=M+1 // 7496
A=A-1 // 7497
M=0 // 7498
@SP // 7499
AM=M+1 // 7500
A=A-1 // 7501
M=0 // 7502
// call Output.create
@17 // 7503
D=A // 7504
@14 // 7505
M=D // 7506
@Output.create // 7507
D=A // 7508
@13 // 7509
M=D // 7510
@Output.initMap.ret.45 // 7511
D=A // 7512
@CALL // 7513
0;JMP // 7514
(Output.initMap.ret.45)
@SP // 7515
M=M-1 // 7516

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7517
D=A // 7518
@SP // 7519
AM=M+1 // 7520
A=A-1 // 7521
M=D // 7522
@3 // 7523
D=A // 7524
@SP // 7525
AM=M+1 // 7526
A=A-1 // 7527
M=D // 7528
@3 // 7529
D=A // 7530
@SP // 7531
AM=M+1 // 7532
A=A-1 // 7533
M=D // 7534
@3 // 7535
D=A // 7536
@SP // 7537
AM=M+1 // 7538
A=A-1 // 7539
M=D // 7540
@3 // 7541
D=A // 7542
@SP // 7543
AM=M+1 // 7544
A=A-1 // 7545
M=D // 7546
@3 // 7547
D=A // 7548
@SP // 7549
AM=M+1 // 7550
A=A-1 // 7551
M=D // 7552
@3 // 7553
D=A // 7554
@SP // 7555
AM=M+1 // 7556
A=A-1 // 7557
M=D // 7558
@35 // 7559
D=A // 7560
@SP // 7561
AM=M+1 // 7562
A=A-1 // 7563
M=D // 7564
@51 // 7565
D=A // 7566
@SP // 7567
AM=M+1 // 7568
A=A-1 // 7569
M=D // 7570
@63 // 7571
D=A // 7572
@SP // 7573
AM=M+1 // 7574
A=A-1 // 7575
M=D // 7576
@SP // 7577
AM=M+1 // 7578
A=A-1 // 7579
M=0 // 7580
@SP // 7581
AM=M+1 // 7582
A=A-1 // 7583
M=0 // 7584
// call Output.create
@17 // 7585
D=A // 7586
@14 // 7587
M=D // 7588
@Output.create // 7589
D=A // 7590
@13 // 7591
M=D // 7592
@Output.initMap.ret.46 // 7593
D=A // 7594
@CALL // 7595
0;JMP // 7596
(Output.initMap.ret.46)
@SP // 7597
M=M-1 // 7598

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7599
D=A // 7600
@SP // 7601
AM=M+1 // 7602
A=A-1 // 7603
M=D // 7604
@33 // 7605
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
@63 // 7617
D=A // 7618
@SP // 7619
AM=M+1 // 7620
A=A-1 // 7621
M=D // 7622
@63 // 7623
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
@51 // 7641
D=A // 7642
@SP // 7643
AM=M+1 // 7644
A=A-1 // 7645
M=D // 7646
@51 // 7647
D=A // 7648
@SP // 7649
AM=M+1 // 7650
A=A-1 // 7651
M=D // 7652
@51 // 7653
D=A // 7654
@SP // 7655
AM=M+1 // 7656
A=A-1 // 7657
M=D // 7658
@SP // 7659
AM=M+1 // 7660
A=A-1 // 7661
M=0 // 7662
@SP // 7663
AM=M+1 // 7664
A=A-1 // 7665
M=0 // 7666
// call Output.create
@17 // 7667
D=A // 7668
@14 // 7669
M=D // 7670
@Output.create // 7671
D=A // 7672
@13 // 7673
M=D // 7674
@Output.initMap.ret.47 // 7675
D=A // 7676
@CALL // 7677
0;JMP // 7678
(Output.initMap.ret.47)
@SP // 7679
M=M-1 // 7680

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7681
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
@55 // 7699
D=A // 7700
@SP // 7701
AM=M+1 // 7702
A=A-1 // 7703
M=D // 7704
@55 // 7705
D=A // 7706
@SP // 7707
AM=M+1 // 7708
A=A-1 // 7709
M=D // 7710
@63 // 7711
D=A // 7712
@SP // 7713
AM=M+1 // 7714
A=A-1 // 7715
M=D // 7716
@59 // 7717
D=A // 7718
@SP // 7719
AM=M+1 // 7720
A=A-1 // 7721
M=D // 7722
@59 // 7723
D=A // 7724
@SP // 7725
AM=M+1 // 7726
A=A-1 // 7727
M=D // 7728
@51 // 7729
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
@SP // 7741
AM=M+1 // 7742
A=A-1 // 7743
M=0 // 7744
@SP // 7745
AM=M+1 // 7746
A=A-1 // 7747
M=0 // 7748
// call Output.create
@17 // 7749
D=A // 7750
@14 // 7751
M=D // 7752
@Output.create // 7753
D=A // 7754
@13 // 7755
M=D // 7756
@Output.initMap.ret.48 // 7757
D=A // 7758
@CALL // 7759
0;JMP // 7760
(Output.initMap.ret.48)
@SP // 7761
M=M-1 // 7762

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7763
D=A // 7764
@SP // 7765
AM=M+1 // 7766
A=A-1 // 7767
M=D // 7768
@30 // 7769
D=A // 7770
@SP // 7771
AM=M+1 // 7772
A=A-1 // 7773
M=D // 7774
@51 // 7775
D=A // 7776
@SP // 7777
AM=M+1 // 7778
A=A-1 // 7779
M=D // 7780
@51 // 7781
D=A // 7782
@SP // 7783
AM=M+1 // 7784
A=A-1 // 7785
M=D // 7786
@51 // 7787
D=A // 7788
@SP // 7789
AM=M+1 // 7790
A=A-1 // 7791
M=D // 7792
@51 // 7793
D=A // 7794
@SP // 7795
AM=M+1 // 7796
A=A-1 // 7797
M=D // 7798
@51 // 7799
D=A // 7800
@SP // 7801
AM=M+1 // 7802
A=A-1 // 7803
M=D // 7804
@51 // 7805
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
@30 // 7817
D=A // 7818
@SP // 7819
AM=M+1 // 7820
A=A-1 // 7821
M=D // 7822
@SP // 7823
AM=M+1 // 7824
A=A-1 // 7825
M=0 // 7826
@SP // 7827
AM=M+1 // 7828
A=A-1 // 7829
M=0 // 7830
// call Output.create
@17 // 7831
D=A // 7832
@14 // 7833
M=D // 7834
@Output.create // 7835
D=A // 7836
@13 // 7837
M=D // 7838
@Output.initMap.ret.49 // 7839
D=A // 7840
@CALL // 7841
0;JMP // 7842
(Output.initMap.ret.49)
@SP // 7843
M=M-1 // 7844

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 7845
D=A // 7846
@SP // 7847
AM=M+1 // 7848
A=A-1 // 7849
M=D // 7850
@31 // 7851
D=A // 7852
@SP // 7853
AM=M+1 // 7854
A=A-1 // 7855
M=D // 7856
@51 // 7857
D=A // 7858
@SP // 7859
AM=M+1 // 7860
A=A-1 // 7861
M=D // 7862
@51 // 7863
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
@31 // 7875
D=A // 7876
@SP // 7877
AM=M+1 // 7878
A=A-1 // 7879
M=D // 7880
@3 // 7881
D=A // 7882
@SP // 7883
AM=M+1 // 7884
A=A-1 // 7885
M=D // 7886
@3 // 7887
D=A // 7888
@SP // 7889
AM=M+1 // 7890
A=A-1 // 7891
M=D // 7892
@3 // 7893
D=A // 7894
@SP // 7895
AM=M+1 // 7896
A=A-1 // 7897
M=D // 7898
@3 // 7899
D=A // 7900
@SP // 7901
AM=M+1 // 7902
A=A-1 // 7903
M=D // 7904
@SP // 7905
AM=M+1 // 7906
A=A-1 // 7907
M=0 // 7908
@SP // 7909
AM=M+1 // 7910
A=A-1 // 7911
M=0 // 7912
// call Output.create
@17 // 7913
D=A // 7914
@14 // 7915
M=D // 7916
@Output.create // 7917
D=A // 7918
@13 // 7919
M=D // 7920
@Output.initMap.ret.50 // 7921
D=A // 7922
@CALL // 7923
0;JMP // 7924
(Output.initMap.ret.50)
@SP // 7925
M=M-1 // 7926

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 7927
D=A // 7928
@SP // 7929
AM=M+1 // 7930
A=A-1 // 7931
M=D // 7932
@30 // 7933
D=A // 7934
@SP // 7935
AM=M+1 // 7936
A=A-1 // 7937
M=D // 7938
@51 // 7939
D=A // 7940
@SP // 7941
AM=M+1 // 7942
A=A-1 // 7943
M=D // 7944
@51 // 7945
D=A // 7946
@SP // 7947
AM=M+1 // 7948
A=A-1 // 7949
M=D // 7950
@51 // 7951
D=A // 7952
@SP // 7953
AM=M+1 // 7954
A=A-1 // 7955
M=D // 7956
@51 // 7957
D=A // 7958
@SP // 7959
AM=M+1 // 7960
A=A-1 // 7961
M=D // 7962
@51 // 7963
D=A // 7964
@SP // 7965
AM=M+1 // 7966
A=A-1 // 7967
M=D // 7968
@63 // 7969
D=A // 7970
@SP // 7971
AM=M+1 // 7972
A=A-1 // 7973
M=D // 7974
@59 // 7975
D=A // 7976
@SP // 7977
AM=M+1 // 7978
A=A-1 // 7979
M=D // 7980
@30 // 7981
D=A // 7982
@SP // 7983
AM=M+1 // 7984
A=A-1 // 7985
M=D // 7986
@48 // 7987
D=A // 7988
@SP // 7989
AM=M+1 // 7990
A=A-1 // 7991
M=D // 7992
@SP // 7993
AM=M+1 // 7994
A=A-1 // 7995
M=0 // 7996
// call Output.create
@17 // 7997
D=A // 7998
@14 // 7999
M=D // 8000
@Output.create // 8001
D=A // 8002
@13 // 8003
M=D // 8004
@Output.initMap.ret.51 // 8005
D=A // 8006
@CALL // 8007
0;JMP // 8008
(Output.initMap.ret.51)
@SP // 8009
M=M-1 // 8010

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8011
D=A // 8012
@SP // 8013
AM=M+1 // 8014
A=A-1 // 8015
M=D // 8016
@31 // 8017
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
@51 // 8029
D=A // 8030
@SP // 8031
AM=M+1 // 8032
A=A-1 // 8033
M=D // 8034
@51 // 8035
D=A // 8036
@SP // 8037
AM=M+1 // 8038
A=A-1 // 8039
M=D // 8040
@31 // 8041
D=A // 8042
@SP // 8043
AM=M+1 // 8044
A=A-1 // 8045
M=D // 8046
@27 // 8047
D=A // 8048
@SP // 8049
AM=M+1 // 8050
A=A-1 // 8051
M=D // 8052
@51 // 8053
D=A // 8054
@SP // 8055
AM=M+1 // 8056
A=A-1 // 8057
M=D // 8058
@51 // 8059
D=A // 8060
@SP // 8061
AM=M+1 // 8062
A=A-1 // 8063
M=D // 8064
@51 // 8065
D=A // 8066
@SP // 8067
AM=M+1 // 8068
A=A-1 // 8069
M=D // 8070
@SP // 8071
AM=M+1 // 8072
A=A-1 // 8073
M=0 // 8074
@SP // 8075
AM=M+1 // 8076
A=A-1 // 8077
M=0 // 8078
// call Output.create
@17 // 8079
D=A // 8080
@14 // 8081
M=D // 8082
@Output.create // 8083
D=A // 8084
@13 // 8085
M=D // 8086
@Output.initMap.ret.52 // 8087
D=A // 8088
@CALL // 8089
0;JMP // 8090
(Output.initMap.ret.52)
@SP // 8091
M=M-1 // 8092

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8093
D=A // 8094
@SP // 8095
AM=M+1 // 8096
A=A-1 // 8097
M=D // 8098
@30 // 8099
D=A // 8100
@SP // 8101
AM=M+1 // 8102
A=A-1 // 8103
M=D // 8104
@51 // 8105
D=A // 8106
@SP // 8107
AM=M+1 // 8108
A=A-1 // 8109
M=D // 8110
@51 // 8111
D=A // 8112
@SP // 8113
AM=M+1 // 8114
A=A-1 // 8115
M=D // 8116
@6 // 8117
D=A // 8118
@SP // 8119
AM=M+1 // 8120
A=A-1 // 8121
M=D // 8122
@28 // 8123
D=A // 8124
@SP // 8125
AM=M+1 // 8126
A=A-1 // 8127
M=D // 8128
@48 // 8129
D=A // 8130
@SP // 8131
AM=M+1 // 8132
A=A-1 // 8133
M=D // 8134
@51 // 8135
D=A // 8136
@SP // 8137
AM=M+1 // 8138
A=A-1 // 8139
M=D // 8140
@51 // 8141
D=A // 8142
@SP // 8143
AM=M+1 // 8144
A=A-1 // 8145
M=D // 8146
@30 // 8147
D=A // 8148
@SP // 8149
AM=M+1 // 8150
A=A-1 // 8151
M=D // 8152
@SP // 8153
AM=M+1 // 8154
A=A-1 // 8155
M=0 // 8156
@SP // 8157
AM=M+1 // 8158
A=A-1 // 8159
M=0 // 8160
// call Output.create
@17 // 8161
D=A // 8162
@14 // 8163
M=D // 8164
@Output.create // 8165
D=A // 8166
@13 // 8167
M=D // 8168
@Output.initMap.ret.53 // 8169
D=A // 8170
@CALL // 8171
0;JMP // 8172
(Output.initMap.ret.53)
@SP // 8173
M=M-1 // 8174

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8175
D=A // 8176
@SP // 8177
AM=M+1 // 8178
A=A-1 // 8179
M=D // 8180
@63 // 8181
D=A // 8182
@SP // 8183
AM=M+1 // 8184
A=A-1 // 8185
M=D // 8186
@63 // 8187
D=A // 8188
@SP // 8189
AM=M+1 // 8190
A=A-1 // 8191
M=D // 8192
@45 // 8193
D=A // 8194
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=D // 8198
@12 // 8199
D=A // 8200
@SP // 8201
AM=M+1 // 8202
A=A-1 // 8203
M=D // 8204
@12 // 8205
D=A // 8206
@SP // 8207
AM=M+1 // 8208
A=A-1 // 8209
M=D // 8210
@12 // 8211
D=A // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=D // 8216
@12 // 8217
D=A // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=D // 8222
@12 // 8223
D=A // 8224
@SP // 8225
AM=M+1 // 8226
A=A-1 // 8227
M=D // 8228
@30 // 8229
D=A // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=D // 8234
@SP // 8235
AM=M+1 // 8236
A=A-1 // 8237
M=0 // 8238
@SP // 8239
AM=M+1 // 8240
A=A-1 // 8241
M=0 // 8242
// call Output.create
@17 // 8243
D=A // 8244
@14 // 8245
M=D // 8246
@Output.create // 8247
D=A // 8248
@13 // 8249
M=D // 8250
@Output.initMap.ret.54 // 8251
D=A // 8252
@CALL // 8253
0;JMP // 8254
(Output.initMap.ret.54)
@SP // 8255
M=M-1 // 8256

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8257
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
@51 // 8269
D=A // 8270
@SP // 8271
AM=M+1 // 8272
A=A-1 // 8273
M=D // 8274
@51 // 8275
D=A // 8276
@SP // 8277
AM=M+1 // 8278
A=A-1 // 8279
M=D // 8280
@51 // 8281
D=A // 8282
@SP // 8283
AM=M+1 // 8284
A=A-1 // 8285
M=D // 8286
@51 // 8287
D=A // 8288
@SP // 8289
AM=M+1 // 8290
A=A-1 // 8291
M=D // 8292
@51 // 8293
D=A // 8294
@SP // 8295
AM=M+1 // 8296
A=A-1 // 8297
M=D // 8298
@51 // 8299
D=A // 8300
@SP // 8301
AM=M+1 // 8302
A=A-1 // 8303
M=D // 8304
@51 // 8305
D=A // 8306
@SP // 8307
AM=M+1 // 8308
A=A-1 // 8309
M=D // 8310
@30 // 8311
D=A // 8312
@SP // 8313
AM=M+1 // 8314
A=A-1 // 8315
M=D // 8316
@SP // 8317
AM=M+1 // 8318
A=A-1 // 8319
M=0 // 8320
@SP // 8321
AM=M+1 // 8322
A=A-1 // 8323
M=0 // 8324
// call Output.create
@17 // 8325
D=A // 8326
@14 // 8327
M=D // 8328
@Output.create // 8329
D=A // 8330
@13 // 8331
M=D // 8332
@Output.initMap.ret.55 // 8333
D=A // 8334
@CALL // 8335
0;JMP // 8336
(Output.initMap.ret.55)
@SP // 8337
M=M-1 // 8338

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8339
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
@51 // 8351
D=A // 8352
@SP // 8353
AM=M+1 // 8354
A=A-1 // 8355
M=D // 8356
@51 // 8357
D=A // 8358
@SP // 8359
AM=M+1 // 8360
A=A-1 // 8361
M=D // 8362
@51 // 8363
D=A // 8364
@SP // 8365
AM=M+1 // 8366
A=A-1 // 8367
M=D // 8368
@51 // 8369
D=A // 8370
@SP // 8371
AM=M+1 // 8372
A=A-1 // 8373
M=D // 8374
@30 // 8375
D=A // 8376
@SP // 8377
AM=M+1 // 8378
A=A-1 // 8379
M=D // 8380
@30 // 8381
D=A // 8382
@SP // 8383
AM=M+1 // 8384
A=A-1 // 8385
M=D // 8386
@12 // 8387
D=A // 8388
@SP // 8389
AM=M+1 // 8390
A=A-1 // 8391
M=D // 8392
@12 // 8393
D=A // 8394
@SP // 8395
AM=M+1 // 8396
A=A-1 // 8397
M=D // 8398
@SP // 8399
AM=M+1 // 8400
A=A-1 // 8401
M=0 // 8402
@SP // 8403
AM=M+1 // 8404
A=A-1 // 8405
M=0 // 8406
// call Output.create
@17 // 8407
D=A // 8408
@14 // 8409
M=D // 8410
@Output.create // 8411
D=A // 8412
@13 // 8413
M=D // 8414
@Output.initMap.ret.56 // 8415
D=A // 8416
@CALL // 8417
0;JMP // 8418
(Output.initMap.ret.56)
@SP // 8419
M=M-1 // 8420

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8421
D=A // 8422
@SP // 8423
AM=M+1 // 8424
A=A-1 // 8425
M=D // 8426
@51 // 8427
D=A // 8428
@SP // 8429
AM=M+1 // 8430
A=A-1 // 8431
M=D // 8432
@51 // 8433
D=A // 8434
@SP // 8435
AM=M+1 // 8436
A=A-1 // 8437
M=D // 8438
@51 // 8439
D=A // 8440
@SP // 8441
AM=M+1 // 8442
A=A-1 // 8443
M=D // 8444
@51 // 8445
D=A // 8446
@SP // 8447
AM=M+1 // 8448
A=A-1 // 8449
M=D // 8450
@51 // 8451
D=A // 8452
@SP // 8453
AM=M+1 // 8454
A=A-1 // 8455
M=D // 8456
@63 // 8457
D=A // 8458
@SP // 8459
AM=M+1 // 8460
A=A-1 // 8461
M=D // 8462
@63 // 8463
D=A // 8464
@SP // 8465
AM=M+1 // 8466
A=A-1 // 8467
M=D // 8468
@63 // 8469
D=A // 8470
@SP // 8471
AM=M+1 // 8472
A=A-1 // 8473
M=D // 8474
@18 // 8475
D=A // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=D // 8480
@SP // 8481
AM=M+1 // 8482
A=A-1 // 8483
M=0 // 8484
@SP // 8485
AM=M+1 // 8486
A=A-1 // 8487
M=0 // 8488
// call Output.create
@17 // 8489
D=A // 8490
@14 // 8491
M=D // 8492
@Output.create // 8493
D=A // 8494
@13 // 8495
M=D // 8496
@Output.initMap.ret.57 // 8497
D=A // 8498
@CALL // 8499
0;JMP // 8500
(Output.initMap.ret.57)
@SP // 8501
M=M-1 // 8502

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8503
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
@30 // 8521
D=A // 8522
@SP // 8523
AM=M+1 // 8524
A=A-1 // 8525
M=D // 8526
@30 // 8527
D=A // 8528
@SP // 8529
AM=M+1 // 8530
A=A-1 // 8531
M=D // 8532
@12 // 8533
D=A // 8534
@SP // 8535
AM=M+1 // 8536
A=A-1 // 8537
M=D // 8538
@30 // 8539
D=A // 8540
@SP // 8541
AM=M+1 // 8542
A=A-1 // 8543
M=D // 8544
@30 // 8545
D=A // 8546
@SP // 8547
AM=M+1 // 8548
A=A-1 // 8549
M=D // 8550
@51 // 8551
D=A // 8552
@SP // 8553
AM=M+1 // 8554
A=A-1 // 8555
M=D // 8556
@51 // 8557
D=A // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=D // 8562
@SP // 8563
AM=M+1 // 8564
A=A-1 // 8565
M=0 // 8566
@SP // 8567
AM=M+1 // 8568
A=A-1 // 8569
M=0 // 8570
// call Output.create
@17 // 8571
D=A // 8572
@14 // 8573
M=D // 8574
@Output.create // 8575
D=A // 8576
@13 // 8577
M=D // 8578
@Output.initMap.ret.58 // 8579
D=A // 8580
@CALL // 8581
0;JMP // 8582
(Output.initMap.ret.58)
@SP // 8583
M=M-1 // 8584

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8585
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
@51 // 8597
D=A // 8598
@SP // 8599
AM=M+1 // 8600
A=A-1 // 8601
M=D // 8602
@51 // 8603
D=A // 8604
@SP // 8605
AM=M+1 // 8606
A=A-1 // 8607
M=D // 8608
@51 // 8609
D=A // 8610
@SP // 8611
AM=M+1 // 8612
A=A-1 // 8613
M=D // 8614
@30 // 8615
D=A // 8616
@SP // 8617
AM=M+1 // 8618
A=A-1 // 8619
M=D // 8620
@12 // 8621
D=A // 8622
@SP // 8623
AM=M+1 // 8624
A=A-1 // 8625
M=D // 8626
@12 // 8627
D=A // 8628
@SP // 8629
AM=M+1 // 8630
A=A-1 // 8631
M=D // 8632
@12 // 8633
D=A // 8634
@SP // 8635
AM=M+1 // 8636
A=A-1 // 8637
M=D // 8638
@30 // 8639
D=A // 8640
@SP // 8641
AM=M+1 // 8642
A=A-1 // 8643
M=D // 8644
@SP // 8645
AM=M+1 // 8646
A=A-1 // 8647
M=0 // 8648
@SP // 8649
AM=M+1 // 8650
A=A-1 // 8651
M=0 // 8652
// call Output.create
@17 // 8653
D=A // 8654
@14 // 8655
M=D // 8656
@Output.create // 8657
D=A // 8658
@13 // 8659
M=D // 8660
@Output.initMap.ret.59 // 8661
D=A // 8662
@CALL // 8663
0;JMP // 8664
(Output.initMap.ret.59)
@SP // 8665
M=M-1 // 8666

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8667
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
@51 // 8679
D=A // 8680
@SP // 8681
AM=M+1 // 8682
A=A-1 // 8683
M=D // 8684
@49 // 8685
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
@12 // 8697
D=A // 8698
@SP // 8699
AM=M+1 // 8700
A=A-1 // 8701
M=D // 8702
@6 // 8703
D=A // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=D // 8708
@35 // 8709
D=A // 8710
@SP // 8711
AM=M+1 // 8712
A=A-1 // 8713
M=D // 8714
@51 // 8715
D=A // 8716
@SP // 8717
AM=M+1 // 8718
A=A-1 // 8719
M=D // 8720
@63 // 8721
D=A // 8722
@SP // 8723
AM=M+1 // 8724
A=A-1 // 8725
M=D // 8726
@SP // 8727
AM=M+1 // 8728
A=A-1 // 8729
M=0 // 8730
@SP // 8731
AM=M+1 // 8732
A=A-1 // 8733
M=0 // 8734
// call Output.create
@17 // 8735
D=A // 8736
@14 // 8737
M=D // 8738
@Output.create // 8739
D=A // 8740
@13 // 8741
M=D // 8742
@Output.initMap.ret.60 // 8743
D=A // 8744
@CALL // 8745
0;JMP // 8746
(Output.initMap.ret.60)
@SP // 8747
M=M-1 // 8748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8749
D=A // 8750
@SP // 8751
AM=M+1 // 8752
A=A-1 // 8753
M=D // 8754
@30 // 8755
D=A // 8756
@SP // 8757
AM=M+1 // 8758
A=A-1 // 8759
M=D // 8760
@6 // 8761
D=A // 8762
@SP // 8763
AM=M+1 // 8764
A=A-1 // 8765
M=D // 8766
@6 // 8767
D=A // 8768
@SP // 8769
AM=M+1 // 8770
A=A-1 // 8771
M=D // 8772
@6 // 8773
D=A // 8774
@SP // 8775
AM=M+1 // 8776
A=A-1 // 8777
M=D // 8778
@6 // 8779
D=A // 8780
@SP // 8781
AM=M+1 // 8782
A=A-1 // 8783
M=D // 8784
@6 // 8785
D=A // 8786
@SP // 8787
AM=M+1 // 8788
A=A-1 // 8789
M=D // 8790
@6 // 8791
D=A // 8792
@SP // 8793
AM=M+1 // 8794
A=A-1 // 8795
M=D // 8796
@6 // 8797
D=A // 8798
@SP // 8799
AM=M+1 // 8800
A=A-1 // 8801
M=D // 8802
@30 // 8803
D=A // 8804
@SP // 8805
AM=M+1 // 8806
A=A-1 // 8807
M=D // 8808
@SP // 8809
AM=M+1 // 8810
A=A-1 // 8811
M=0 // 8812
@SP // 8813
AM=M+1 // 8814
A=A-1 // 8815
M=0 // 8816
// call Output.create
@17 // 8817
D=A // 8818
@14 // 8819
M=D // 8820
@Output.create // 8821
D=A // 8822
@13 // 8823
M=D // 8824
@Output.initMap.ret.61 // 8825
D=A // 8826
@CALL // 8827
0;JMP // 8828
(Output.initMap.ret.61)
@SP // 8829
M=M-1 // 8830

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8831
D=A // 8832
@SP // 8833
M=D+M // 8834
@92 // 8835
D=A // 8836
@SP // 8837
A=M-1 // 8838
M=1 // 8839
A=A-1 // 8840
M=0 // 8841
A=A-1 // 8842
M=0 // 8843
A=A-1 // 8844
M=D // 8845
A=A-1 // 8846
@3 // 8847
D=A // 8848
@SP // 8849
AM=M+1 // 8850
A=A-1 // 8851
M=D // 8852
@6 // 8853
D=A // 8854
@SP // 8855
AM=M+1 // 8856
A=A-1 // 8857
M=D // 8858
@12 // 8859
D=A // 8860
@SP // 8861
AM=M+1 // 8862
A=A-1 // 8863
M=D // 8864
@24 // 8865
D=A // 8866
@SP // 8867
AM=M+1 // 8868
A=A-1 // 8869
M=D // 8870
@48 // 8871
D=A // 8872
@SP // 8873
AM=M+1 // 8874
A=A-1 // 8875
M=D // 8876
@32 // 8877
D=A // 8878
@SP // 8879
AM=M+1 // 8880
A=A-1 // 8881
M=D // 8882
@SP // 8883
AM=M+1 // 8884
A=A-1 // 8885
M=0 // 8886
@SP // 8887
AM=M+1 // 8888
A=A-1 // 8889
M=0 // 8890
// call Output.create
@17 // 8891
D=A // 8892
@14 // 8893
M=D // 8894
@Output.create // 8895
D=A // 8896
@13 // 8897
M=D // 8898
@Output.initMap.ret.62 // 8899
D=A // 8900
@CALL // 8901
0;JMP // 8902
(Output.initMap.ret.62)
@SP // 8903
M=M-1 // 8904

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 8905
D=A // 8906
@SP // 8907
AM=M+1 // 8908
A=A-1 // 8909
M=D // 8910
@30 // 8911
D=A // 8912
@SP // 8913
AM=M+1 // 8914
A=A-1 // 8915
M=D // 8916
@24 // 8917
D=A // 8918
@SP // 8919
AM=M+1 // 8920
A=A-1 // 8921
M=D // 8922
@24 // 8923
D=A // 8924
@SP // 8925
AM=M+1 // 8926
A=A-1 // 8927
M=D // 8928
@24 // 8929
D=A // 8930
@SP // 8931
AM=M+1 // 8932
A=A-1 // 8933
M=D // 8934
@24 // 8935
D=A // 8936
@SP // 8937
AM=M+1 // 8938
A=A-1 // 8939
M=D // 8940
@24 // 8941
D=A // 8942
@SP // 8943
AM=M+1 // 8944
A=A-1 // 8945
M=D // 8946
@24 // 8947
D=A // 8948
@SP // 8949
AM=M+1 // 8950
A=A-1 // 8951
M=D // 8952
@24 // 8953
D=A // 8954
@SP // 8955
AM=M+1 // 8956
A=A-1 // 8957
M=D // 8958
@30 // 8959
D=A // 8960
@SP // 8961
AM=M+1 // 8962
A=A-1 // 8963
M=D // 8964
@SP // 8965
AM=M+1 // 8966
A=A-1 // 8967
M=0 // 8968
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=0 // 8972
// call Output.create
@17 // 8973
D=A // 8974
@14 // 8975
M=D // 8976
@Output.create // 8977
D=A // 8978
@13 // 8979
M=D // 8980
@Output.initMap.ret.63 // 8981
D=A // 8982
@CALL // 8983
0;JMP // 8984
(Output.initMap.ret.63)
@SP // 8985
M=M-1 // 8986

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 8987
D=A // 8988
@SP // 8989
AM=M+1 // 8990
A=A-1 // 8991
M=D // 8992
@8 // 8993
D=A // 8994
@SP // 8995
AM=M+1 // 8996
A=A-1 // 8997
M=D // 8998
@28 // 8999
D=A // 9000
@SP // 9001
AM=M+1 // 9002
A=A-1 // 9003
M=D // 9004
@54 // 9005
D=A // 9006
@SP // 9007
AM=M+1 // 9008
A=A-1 // 9009
M=D // 9010
@SP // 9011
AM=M+1 // 9012
A=A-1 // 9013
M=0 // 9014
@SP // 9015
AM=M+1 // 9016
A=A-1 // 9017
M=0 // 9018
@SP // 9019
AM=M+1 // 9020
A=A-1 // 9021
M=0 // 9022
@SP // 9023
AM=M+1 // 9024
A=A-1 // 9025
M=0 // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=0 // 9030
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=0 // 9034
@SP // 9035
AM=M+1 // 9036
A=A-1 // 9037
M=0 // 9038
@SP // 9039
AM=M+1 // 9040
A=A-1 // 9041
M=0 // 9042
// call Output.create
@17 // 9043
D=A // 9044
@14 // 9045
M=D // 9046
@Output.create // 9047
D=A // 9048
@13 // 9049
M=D // 9050
@Output.initMap.ret.64 // 9051
D=A // 9052
@CALL // 9053
0;JMP // 9054
(Output.initMap.ret.64)
@SP // 9055
M=M-1 // 9056

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9057
D=A // 9058
@SP // 9059
M=D+M // 9060
@95 // 9061
D=A // 9062
@SP // 9063
A=M-1 // 9064
M=0 // 9065
A=A-1 // 9066
M=0 // 9067
A=A-1 // 9068
M=0 // 9069
A=A-1 // 9070
M=0 // 9071
A=A-1 // 9072
M=0 // 9073
A=A-1 // 9074
M=0 // 9075
A=A-1 // 9076
M=0 // 9077
A=A-1 // 9078
M=0 // 9079
A=A-1 // 9080
M=0 // 9081
A=A-1 // 9082
M=D // 9083
A=A-1 // 9084
@2 // 9085
D=A // 9086
@SP // 9087
M=D+M // 9088
@63 // 9089
D=A // 9090
@SP // 9091
A=M-1 // 9092
M=0 // 9093
A=A-1 // 9094
M=D // 9095
A=A-1 // 9096
// call Output.create
@17 // 9097
D=A // 9098
@14 // 9099
M=D // 9100
@Output.create // 9101
D=A // 9102
@13 // 9103
M=D // 9104
@Output.initMap.ret.65 // 9105
D=A // 9106
@CALL // 9107
0;JMP // 9108
(Output.initMap.ret.65)
@SP // 9109
M=M-1 // 9110

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9111
D=A // 9112
@SP // 9113
AM=M+1 // 9114
A=A-1 // 9115
M=D // 9116
@6 // 9117
D=A // 9118
@SP // 9119
AM=M+1 // 9120
A=A-1 // 9121
M=D // 9122
@12 // 9123
D=A // 9124
@SP // 9125
AM=M+1 // 9126
A=A-1 // 9127
M=D // 9128
@24 // 9129
D=A // 9130
@SP // 9131
AM=M+1 // 9132
A=A-1 // 9133
M=D // 9134
@SP // 9135
AM=M+1 // 9136
A=A-1 // 9137
M=0 // 9138
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=0 // 9142
@SP // 9143
AM=M+1 // 9144
A=A-1 // 9145
M=0 // 9146
@SP // 9147
AM=M+1 // 9148
A=A-1 // 9149
M=0 // 9150
@SP // 9151
AM=M+1 // 9152
A=A-1 // 9153
M=0 // 9154
@SP // 9155
AM=M+1 // 9156
A=A-1 // 9157
M=0 // 9158
@SP // 9159
AM=M+1 // 9160
A=A-1 // 9161
M=0 // 9162
@SP // 9163
AM=M+1 // 9164
A=A-1 // 9165
M=0 // 9166
// call Output.create
@17 // 9167
D=A // 9168
@14 // 9169
M=D // 9170
@Output.create // 9171
D=A // 9172
@13 // 9173
M=D // 9174
@Output.initMap.ret.66 // 9175
D=A // 9176
@CALL // 9177
0;JMP // 9178
(Output.initMap.ret.66)
@SP // 9179
M=M-1 // 9180

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9181
D=A // 9182
@SP // 9183
M=D+M // 9184
@97 // 9185
D=A // 9186
@SP // 9187
A=M-1 // 9188
M=0 // 9189
A=A-1 // 9190
M=0 // 9191
A=A-1 // 9192
M=0 // 9193
A=A-1 // 9194
M=D // 9195
A=A-1 // 9196
@14 // 9197
D=A // 9198
@SP // 9199
AM=M+1 // 9200
A=A-1 // 9201
M=D // 9202
@24 // 9203
D=A // 9204
@SP // 9205
AM=M+1 // 9206
A=A-1 // 9207
M=D // 9208
@30 // 9209
D=A // 9210
@SP // 9211
AM=M+1 // 9212
A=A-1 // 9213
M=D // 9214
@27 // 9215
D=A // 9216
@SP // 9217
AM=M+1 // 9218
A=A-1 // 9219
M=D // 9220
@27 // 9221
D=A // 9222
@SP // 9223
AM=M+1 // 9224
A=A-1 // 9225
M=D // 9226
@54 // 9227
D=A // 9228
@SP // 9229
AM=M+1 // 9230
A=A-1 // 9231
M=D // 9232
@SP // 9233
AM=M+1 // 9234
A=A-1 // 9235
M=0 // 9236
@SP // 9237
AM=M+1 // 9238
A=A-1 // 9239
M=0 // 9240
// call Output.create
@17 // 9241
D=A // 9242
@14 // 9243
M=D // 9244
@Output.create // 9245
D=A // 9246
@13 // 9247
M=D // 9248
@Output.initMap.ret.67 // 9249
D=A // 9250
@CALL // 9251
0;JMP // 9252
(Output.initMap.ret.67)
@SP // 9253
M=M-1 // 9254

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9255
D=A // 9256
@SP // 9257
AM=M+1 // 9258
A=A-1 // 9259
M=D // 9260
@3 // 9261
D=A // 9262
@SP // 9263
AM=M+1 // 9264
A=A-1 // 9265
M=D // 9266
@3 // 9267
D=A // 9268
@SP // 9269
AM=M+1 // 9270
A=A-1 // 9271
M=D // 9272
@3 // 9273
D=A // 9274
@SP // 9275
AM=M+1 // 9276
A=A-1 // 9277
M=D // 9278
@15 // 9279
D=A // 9280
@SP // 9281
AM=M+1 // 9282
A=A-1 // 9283
M=D // 9284
@27 // 9285
D=A // 9286
@SP // 9287
AM=M+1 // 9288
A=A-1 // 9289
M=D // 9290
@51 // 9291
D=A // 9292
@SP // 9293
AM=M+1 // 9294
A=A-1 // 9295
M=D // 9296
@51 // 9297
D=A // 9298
@SP // 9299
AM=M+1 // 9300
A=A-1 // 9301
M=D // 9302
@51 // 9303
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
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=0 // 9318
@SP // 9319
AM=M+1 // 9320
A=A-1 // 9321
M=0 // 9322
// call Output.create
@17 // 9323
D=A // 9324
@14 // 9325
M=D // 9326
@Output.create // 9327
D=A // 9328
@13 // 9329
M=D // 9330
@Output.initMap.ret.68 // 9331
D=A // 9332
@CALL // 9333
0;JMP // 9334
(Output.initMap.ret.68)
@SP // 9335
M=M-1 // 9336

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9337
D=A // 9338
@SP // 9339
M=D+M // 9340
@99 // 9341
D=A // 9342
@SP // 9343
A=M-1 // 9344
M=0 // 9345
A=A-1 // 9346
M=0 // 9347
A=A-1 // 9348
M=0 // 9349
A=A-1 // 9350
M=D // 9351
A=A-1 // 9352
@30 // 9353
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
@3 // 9365
D=A // 9366
@SP // 9367
AM=M+1 // 9368
A=A-1 // 9369
M=D // 9370
@3 // 9371
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
@30 // 9383
D=A // 9384
@SP // 9385
AM=M+1 // 9386
A=A-1 // 9387
M=D // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=0 // 9392
@SP // 9393
AM=M+1 // 9394
A=A-1 // 9395
M=0 // 9396
// call Output.create
@17 // 9397
D=A // 9398
@14 // 9399
M=D // 9400
@Output.create // 9401
D=A // 9402
@13 // 9403
M=D // 9404
@Output.initMap.ret.69 // 9405
D=A // 9406
@CALL // 9407
0;JMP // 9408
(Output.initMap.ret.69)
@SP // 9409
M=M-1 // 9410

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9411
D=A // 9412
@SP // 9413
AM=M+1 // 9414
A=A-1 // 9415
M=D // 9416
@48 // 9417
D=A // 9418
@SP // 9419
AM=M+1 // 9420
A=A-1 // 9421
M=D // 9422
@48 // 9423
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
@60 // 9435
D=A // 9436
@SP // 9437
AM=M+1 // 9438
A=A-1 // 9439
M=D // 9440
@54 // 9441
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
@30 // 9465
D=A // 9466
@SP // 9467
AM=M+1 // 9468
A=A-1 // 9469
M=D // 9470
@SP // 9471
AM=M+1 // 9472
A=A-1 // 9473
M=0 // 9474
@SP // 9475
AM=M+1 // 9476
A=A-1 // 9477
M=0 // 9478
// call Output.create
@17 // 9479
D=A // 9480
@14 // 9481
M=D // 9482
@Output.create // 9483
D=A // 9484
@13 // 9485
M=D // 9486
@Output.initMap.ret.70 // 9487
D=A // 9488
@CALL // 9489
0;JMP // 9490
(Output.initMap.ret.70)
@SP // 9491
M=M-1 // 9492

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9493
D=A // 9494
@SP // 9495
M=D+M // 9496
@101 // 9497
D=A // 9498
@SP // 9499
A=M-1 // 9500
M=0 // 9501
A=A-1 // 9502
M=0 // 9503
A=A-1 // 9504
M=0 // 9505
A=A-1 // 9506
M=D // 9507
A=A-1 // 9508
@30 // 9509
D=A // 9510
@SP // 9511
AM=M+1 // 9512
A=A-1 // 9513
M=D // 9514
@51 // 9515
D=A // 9516
@SP // 9517
AM=M+1 // 9518
A=A-1 // 9519
M=D // 9520
@63 // 9521
D=A // 9522
@SP // 9523
AM=M+1 // 9524
A=A-1 // 9525
M=D // 9526
@3 // 9527
D=A // 9528
@SP // 9529
AM=M+1 // 9530
A=A-1 // 9531
M=D // 9532
@51 // 9533
D=A // 9534
@SP // 9535
AM=M+1 // 9536
A=A-1 // 9537
M=D // 9538
@30 // 9539
D=A // 9540
@SP // 9541
AM=M+1 // 9542
A=A-1 // 9543
M=D // 9544
@SP // 9545
AM=M+1 // 9546
A=A-1 // 9547
M=0 // 9548
@SP // 9549
AM=M+1 // 9550
A=A-1 // 9551
M=0 // 9552
// call Output.create
@17 // 9553
D=A // 9554
@14 // 9555
M=D // 9556
@Output.create // 9557
D=A // 9558
@13 // 9559
M=D // 9560
@Output.initMap.ret.71 // 9561
D=A // 9562
@CALL // 9563
0;JMP // 9564
(Output.initMap.ret.71)
@SP // 9565
M=M-1 // 9566

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9567
D=A // 9568
@SP // 9569
AM=M+1 // 9570
A=A-1 // 9571
M=D // 9572
@28 // 9573
D=A // 9574
@SP // 9575
AM=M+1 // 9576
A=A-1 // 9577
M=D // 9578
@54 // 9579
D=A // 9580
@SP // 9581
AM=M+1 // 9582
A=A-1 // 9583
M=D // 9584
@38 // 9585
D=A // 9586
@SP // 9587
AM=M+1 // 9588
A=A-1 // 9589
M=D // 9590
@6 // 9591
D=A // 9592
@SP // 9593
AM=M+1 // 9594
A=A-1 // 9595
M=D // 9596
@15 // 9597
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
@15 // 9621
D=A // 9622
@SP // 9623
AM=M+1 // 9624
A=A-1 // 9625
M=D // 9626
@SP // 9627
AM=M+1 // 9628
A=A-1 // 9629
M=0 // 9630
@SP // 9631
AM=M+1 // 9632
A=A-1 // 9633
M=0 // 9634
// call Output.create
@17 // 9635
D=A // 9636
@14 // 9637
M=D // 9638
@Output.create // 9639
D=A // 9640
@13 // 9641
M=D // 9642
@Output.initMap.ret.72 // 9643
D=A // 9644
@CALL // 9645
0;JMP // 9646
(Output.initMap.ret.72)
@SP // 9647
M=M-1 // 9648

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9649
D=A // 9650
@SP // 9651
M=D+M // 9652
@103 // 9653
D=A // 9654
@SP // 9655
A=M-1 // 9656
M=0 // 9657
A=A-1 // 9658
M=0 // 9659
A=A-1 // 9660
M=D // 9661
A=A-1 // 9662
@30 // 9663
D=A // 9664
@SP // 9665
AM=M+1 // 9666
A=A-1 // 9667
M=D // 9668
@51 // 9669
D=A // 9670
@SP // 9671
AM=M+1 // 9672
A=A-1 // 9673
M=D // 9674
@51 // 9675
D=A // 9676
@SP // 9677
AM=M+1 // 9678
A=A-1 // 9679
M=D // 9680
@51 // 9681
D=A // 9682
@SP // 9683
AM=M+1 // 9684
A=A-1 // 9685
M=D // 9686
@62 // 9687
D=A // 9688
@SP // 9689
AM=M+1 // 9690
A=A-1 // 9691
M=D // 9692
@48 // 9693
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
@30 // 9705
D=A // 9706
@SP // 9707
AM=M+1 // 9708
A=A-1 // 9709
M=D // 9710
@SP // 9711
AM=M+1 // 9712
A=A-1 // 9713
M=0 // 9714
// call Output.create
@17 // 9715
D=A // 9716
@14 // 9717
M=D // 9718
@Output.create // 9719
D=A // 9720
@13 // 9721
M=D // 9722
@Output.initMap.ret.73 // 9723
D=A // 9724
@CALL // 9725
0;JMP // 9726
(Output.initMap.ret.73)
@SP // 9727
M=M-1 // 9728

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9729
D=A // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=D // 9734
@3 // 9735
D=A // 9736
@SP // 9737
AM=M+1 // 9738
A=A-1 // 9739
M=D // 9740
@3 // 9741
D=A // 9742
@SP // 9743
AM=M+1 // 9744
A=A-1 // 9745
M=D // 9746
@3 // 9747
D=A // 9748
@SP // 9749
AM=M+1 // 9750
A=A-1 // 9751
M=D // 9752
@27 // 9753
D=A // 9754
@SP // 9755
AM=M+1 // 9756
A=A-1 // 9757
M=D // 9758
@55 // 9759
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
@51 // 9777
D=A // 9778
@SP // 9779
AM=M+1 // 9780
A=A-1 // 9781
M=D // 9782
@51 // 9783
D=A // 9784
@SP // 9785
AM=M+1 // 9786
A=A-1 // 9787
M=D // 9788
@SP // 9789
AM=M+1 // 9790
A=A-1 // 9791
M=0 // 9792
@SP // 9793
AM=M+1 // 9794
A=A-1 // 9795
M=0 // 9796
// call Output.create
@17 // 9797
D=A // 9798
@14 // 9799
M=D // 9800
@Output.create // 9801
D=A // 9802
@13 // 9803
M=D // 9804
@Output.initMap.ret.74 // 9805
D=A // 9806
@CALL // 9807
0;JMP // 9808
(Output.initMap.ret.74)
@SP // 9809
M=M-1 // 9810

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9811
D=A // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=D // 9816
@12 // 9817
D=A // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=D // 9822
@12 // 9823
D=A // 9824
@SP // 9825
AM=M+1 // 9826
A=A-1 // 9827
M=D // 9828
@SP // 9829
AM=M+1 // 9830
A=A-1 // 9831
M=0 // 9832
@14 // 9833
D=A // 9834
@SP // 9835
AM=M+1 // 9836
A=A-1 // 9837
M=D // 9838
@12 // 9839
D=A // 9840
@SP // 9841
AM=M+1 // 9842
A=A-1 // 9843
M=D // 9844
@12 // 9845
D=A // 9846
@SP // 9847
AM=M+1 // 9848
A=A-1 // 9849
M=D // 9850
@12 // 9851
D=A // 9852
@SP // 9853
AM=M+1 // 9854
A=A-1 // 9855
M=D // 9856
@12 // 9857
D=A // 9858
@SP // 9859
AM=M+1 // 9860
A=A-1 // 9861
M=D // 9862
@30 // 9863
D=A // 9864
@SP // 9865
AM=M+1 // 9866
A=A-1 // 9867
M=D // 9868
@SP // 9869
AM=M+1 // 9870
A=A-1 // 9871
M=0 // 9872
@SP // 9873
AM=M+1 // 9874
A=A-1 // 9875
M=0 // 9876
// call Output.create
@17 // 9877
D=A // 9878
@14 // 9879
M=D // 9880
@Output.create // 9881
D=A // 9882
@13 // 9883
M=D // 9884
@Output.initMap.ret.75 // 9885
D=A // 9886
@CALL // 9887
0;JMP // 9888
(Output.initMap.ret.75)
@SP // 9889
M=M-1 // 9890

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 9891
D=A // 9892
@SP // 9893
AM=M+1 // 9894
A=A-1 // 9895
M=D // 9896
@48 // 9897
D=A // 9898
@SP // 9899
AM=M+1 // 9900
A=A-1 // 9901
M=D // 9902
@48 // 9903
D=A // 9904
@SP // 9905
AM=M+1 // 9906
A=A-1 // 9907
M=D // 9908
@SP // 9909
AM=M+1 // 9910
A=A-1 // 9911
M=0 // 9912
@56 // 9913
D=A // 9914
@SP // 9915
AM=M+1 // 9916
A=A-1 // 9917
M=D // 9918
@48 // 9919
D=A // 9920
@SP // 9921
AM=M+1 // 9922
A=A-1 // 9923
M=D // 9924
@48 // 9925
D=A // 9926
@SP // 9927
AM=M+1 // 9928
A=A-1 // 9929
M=D // 9930
@48 // 9931
D=A // 9932
@SP // 9933
AM=M+1 // 9934
A=A-1 // 9935
M=D // 9936
@48 // 9937
D=A // 9938
@SP // 9939
AM=M+1 // 9940
A=A-1 // 9941
M=D // 9942
@51 // 9943
D=A // 9944
@SP // 9945
AM=M+1 // 9946
A=A-1 // 9947
M=D // 9948
@30 // 9949
D=A // 9950
@SP // 9951
AM=M+1 // 9952
A=A-1 // 9953
M=D // 9954
@SP // 9955
AM=M+1 // 9956
A=A-1 // 9957
M=0 // 9958
// call Output.create
@17 // 9959
D=A // 9960
@14 // 9961
M=D // 9962
@Output.create // 9963
D=A // 9964
@13 // 9965
M=D // 9966
@Output.initMap.ret.76 // 9967
D=A // 9968
@CALL // 9969
0;JMP // 9970
(Output.initMap.ret.76)
@SP // 9971
M=M-1 // 9972

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 9973
D=A // 9974
@SP // 9975
AM=M+1 // 9976
A=A-1 // 9977
M=D // 9978
@3 // 9979
D=A // 9980
@SP // 9981
AM=M+1 // 9982
A=A-1 // 9983
M=D // 9984
@3 // 9985
D=A // 9986
@SP // 9987
AM=M+1 // 9988
A=A-1 // 9989
M=D // 9990
@3 // 9991
D=A // 9992
@SP // 9993
AM=M+1 // 9994
A=A-1 // 9995
M=D // 9996
@51 // 9997
D=A // 9998
@SP // 9999
AM=M+1 // 10000
A=A-1 // 10001
M=D // 10002
@27 // 10003
D=A // 10004
@SP // 10005
AM=M+1 // 10006
A=A-1 // 10007
M=D // 10008
@15 // 10009
D=A // 10010
@SP // 10011
AM=M+1 // 10012
A=A-1 // 10013
M=D // 10014
@15 // 10015
D=A // 10016
@SP // 10017
AM=M+1 // 10018
A=A-1 // 10019
M=D // 10020
@27 // 10021
D=A // 10022
@SP // 10023
AM=M+1 // 10024
A=A-1 // 10025
M=D // 10026
@51 // 10027
D=A // 10028
@SP // 10029
AM=M+1 // 10030
A=A-1 // 10031
M=D // 10032
@SP // 10033
AM=M+1 // 10034
A=A-1 // 10035
M=0 // 10036
@SP // 10037
AM=M+1 // 10038
A=A-1 // 10039
M=0 // 10040
// call Output.create
@17 // 10041
D=A // 10042
@14 // 10043
M=D // 10044
@Output.create // 10045
D=A // 10046
@13 // 10047
M=D // 10048
@Output.initMap.ret.77 // 10049
D=A // 10050
@CALL // 10051
0;JMP // 10052
(Output.initMap.ret.77)
@SP // 10053
M=M-1 // 10054

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10055
D=A // 10056
@SP // 10057
AM=M+1 // 10058
A=A-1 // 10059
M=D // 10060
@14 // 10061
D=A // 10062
@SP // 10063
AM=M+1 // 10064
A=A-1 // 10065
M=D // 10066
@12 // 10067
D=A // 10068
@SP // 10069
AM=M+1 // 10070
A=A-1 // 10071
M=D // 10072
@12 // 10073
D=A // 10074
@SP // 10075
AM=M+1 // 10076
A=A-1 // 10077
M=D // 10078
@12 // 10079
D=A // 10080
@SP // 10081
AM=M+1 // 10082
A=A-1 // 10083
M=D // 10084
@12 // 10085
D=A // 10086
@SP // 10087
AM=M+1 // 10088
A=A-1 // 10089
M=D // 10090
@12 // 10091
D=A // 10092
@SP // 10093
AM=M+1 // 10094
A=A-1 // 10095
M=D // 10096
@12 // 10097
D=A // 10098
@SP // 10099
AM=M+1 // 10100
A=A-1 // 10101
M=D // 10102
@12 // 10103
D=A // 10104
@SP // 10105
AM=M+1 // 10106
A=A-1 // 10107
M=D // 10108
@30 // 10109
D=A // 10110
@SP // 10111
AM=M+1 // 10112
A=A-1 // 10113
M=D // 10114
@SP // 10115
AM=M+1 // 10116
A=A-1 // 10117
M=0 // 10118
@SP // 10119
AM=M+1 // 10120
A=A-1 // 10121
M=0 // 10122
// call Output.create
@17 // 10123
D=A // 10124
@14 // 10125
M=D // 10126
@Output.create // 10127
D=A // 10128
@13 // 10129
M=D // 10130
@Output.initMap.ret.78 // 10131
D=A // 10132
@CALL // 10133
0;JMP // 10134
(Output.initMap.ret.78)
@SP // 10135
M=M-1 // 10136

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10137
D=A // 10138
@SP // 10139
M=D+M // 10140
@109 // 10141
D=A // 10142
@SP // 10143
A=M-1 // 10144
M=0 // 10145
A=A-1 // 10146
M=0 // 10147
A=A-1 // 10148
M=0 // 10149
A=A-1 // 10150
M=D // 10151
A=A-1 // 10152
@29 // 10153
D=A // 10154
@SP // 10155
AM=M+1 // 10156
A=A-1 // 10157
M=D // 10158
@63 // 10159
D=A // 10160
@SP // 10161
AM=M+1 // 10162
A=A-1 // 10163
M=D // 10164
@43 // 10165
D=A // 10166
@SP // 10167
AM=M+1 // 10168
A=A-1 // 10169
M=D // 10170
@43 // 10171
D=A // 10172
@SP // 10173
AM=M+1 // 10174
A=A-1 // 10175
M=D // 10176
@43 // 10177
D=A // 10178
@SP // 10179
AM=M+1 // 10180
A=A-1 // 10181
M=D // 10182
@43 // 10183
D=A // 10184
@SP // 10185
AM=M+1 // 10186
A=A-1 // 10187
M=D // 10188
@SP // 10189
AM=M+1 // 10190
A=A-1 // 10191
M=0 // 10192
@SP // 10193
AM=M+1 // 10194
A=A-1 // 10195
M=0 // 10196
// call Output.create
@17 // 10197
D=A // 10198
@14 // 10199
M=D // 10200
@Output.create // 10201
D=A // 10202
@13 // 10203
M=D // 10204
@Output.initMap.ret.79 // 10205
D=A // 10206
@CALL // 10207
0;JMP // 10208
(Output.initMap.ret.79)
@SP // 10209
M=M-1 // 10210

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10211
D=A // 10212
@SP // 10213
M=D+M // 10214
@110 // 10215
D=A // 10216
@SP // 10217
A=M-1 // 10218
M=0 // 10219
A=A-1 // 10220
M=0 // 10221
A=A-1 // 10222
M=0 // 10223
A=A-1 // 10224
M=D // 10225
A=A-1 // 10226
@29 // 10227
D=A // 10228
@SP // 10229
AM=M+1 // 10230
A=A-1 // 10231
M=D // 10232
@51 // 10233
D=A // 10234
@SP // 10235
AM=M+1 // 10236
A=A-1 // 10237
M=D // 10238
@51 // 10239
D=A // 10240
@SP // 10241
AM=M+1 // 10242
A=A-1 // 10243
M=D // 10244
@51 // 10245
D=A // 10246
@SP // 10247
AM=M+1 // 10248
A=A-1 // 10249
M=D // 10250
@51 // 10251
D=A // 10252
@SP // 10253
AM=M+1 // 10254
A=A-1 // 10255
M=D // 10256
@51 // 10257
D=A // 10258
@SP // 10259
AM=M+1 // 10260
A=A-1 // 10261
M=D // 10262
@SP // 10263
AM=M+1 // 10264
A=A-1 // 10265
M=0 // 10266
@SP // 10267
AM=M+1 // 10268
A=A-1 // 10269
M=0 // 10270
// call Output.create
@17 // 10271
D=A // 10272
@14 // 10273
M=D // 10274
@Output.create // 10275
D=A // 10276
@13 // 10277
M=D // 10278
@Output.initMap.ret.80 // 10279
D=A // 10280
@CALL // 10281
0;JMP // 10282
(Output.initMap.ret.80)
@SP // 10283
M=M-1 // 10284

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10285
D=A // 10286
@SP // 10287
M=D+M // 10288
@111 // 10289
D=A // 10290
@SP // 10291
A=M-1 // 10292
M=0 // 10293
A=A-1 // 10294
M=0 // 10295
A=A-1 // 10296
M=0 // 10297
A=A-1 // 10298
M=D // 10299
A=A-1 // 10300
@30 // 10301
D=A // 10302
@SP // 10303
AM=M+1 // 10304
A=A-1 // 10305
M=D // 10306
@51 // 10307
D=A // 10308
@SP // 10309
AM=M+1 // 10310
A=A-1 // 10311
M=D // 10312
@51 // 10313
D=A // 10314
@SP // 10315
AM=M+1 // 10316
A=A-1 // 10317
M=D // 10318
@51 // 10319
D=A // 10320
@SP // 10321
AM=M+1 // 10322
A=A-1 // 10323
M=D // 10324
@51 // 10325
D=A // 10326
@SP // 10327
AM=M+1 // 10328
A=A-1 // 10329
M=D // 10330
@30 // 10331
D=A // 10332
@SP // 10333
AM=M+1 // 10334
A=A-1 // 10335
M=D // 10336
@SP // 10337
AM=M+1 // 10338
A=A-1 // 10339
M=0 // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=0 // 10344
// call Output.create
@17 // 10345
D=A // 10346
@14 // 10347
M=D // 10348
@Output.create // 10349
D=A // 10350
@13 // 10351
M=D // 10352
@Output.initMap.ret.81 // 10353
D=A // 10354
@CALL // 10355
0;JMP // 10356
(Output.initMap.ret.81)
@SP // 10357
M=M-1 // 10358

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10359
D=A // 10360
@SP // 10361
M=D+M // 10362
@112 // 10363
D=A // 10364
@SP // 10365
A=M-1 // 10366
M=0 // 10367
A=A-1 // 10368
M=0 // 10369
A=A-1 // 10370
M=0 // 10371
A=A-1 // 10372
M=D // 10373
A=A-1 // 10374
@30 // 10375
D=A // 10376
@SP // 10377
AM=M+1 // 10378
A=A-1 // 10379
M=D // 10380
@51 // 10381
D=A // 10382
@SP // 10383
AM=M+1 // 10384
A=A-1 // 10385
M=D // 10386
@51 // 10387
D=A // 10388
@SP // 10389
AM=M+1 // 10390
A=A-1 // 10391
M=D // 10392
@51 // 10393
D=A // 10394
@SP // 10395
AM=M+1 // 10396
A=A-1 // 10397
M=D // 10398
@31 // 10399
D=A // 10400
@SP // 10401
AM=M+1 // 10402
A=A-1 // 10403
M=D // 10404
@3 // 10405
D=A // 10406
@SP // 10407
AM=M+1 // 10408
A=A-1 // 10409
M=D // 10410
@3 // 10411
D=A // 10412
@SP // 10413
AM=M+1 // 10414
A=A-1 // 10415
M=D // 10416
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
@Output.initMap.ret.82 // 10429
D=A // 10430
@CALL // 10431
0;JMP // 10432
(Output.initMap.ret.82)
@SP // 10433
M=M-1 // 10434

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10435
D=A // 10436
@SP // 10437
M=D+M // 10438
@113 // 10439
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
A=A-1 // 10450
@30 // 10451
D=A // 10452
@SP // 10453
AM=M+1 // 10454
A=A-1 // 10455
M=D // 10456
@51 // 10457
D=A // 10458
@SP // 10459
AM=M+1 // 10460
A=A-1 // 10461
M=D // 10462
@51 // 10463
D=A // 10464
@SP // 10465
AM=M+1 // 10466
A=A-1 // 10467
M=D // 10468
@51 // 10469
D=A // 10470
@SP // 10471
AM=M+1 // 10472
A=A-1 // 10473
M=D // 10474
@62 // 10475
D=A // 10476
@SP // 10477
AM=M+1 // 10478
A=A-1 // 10479
M=D // 10480
@48 // 10481
D=A // 10482
@SP // 10483
AM=M+1 // 10484
A=A-1 // 10485
M=D // 10486
@48 // 10487
D=A // 10488
@SP // 10489
AM=M+1 // 10490
A=A-1 // 10491
M=D // 10492
@SP // 10493
AM=M+1 // 10494
A=A-1 // 10495
M=0 // 10496
// call Output.create
@17 // 10497
D=A // 10498
@14 // 10499
M=D // 10500
@Output.create // 10501
D=A // 10502
@13 // 10503
M=D // 10504
@Output.initMap.ret.83 // 10505
D=A // 10506
@CALL // 10507
0;JMP // 10508
(Output.initMap.ret.83)
@SP // 10509
M=M-1 // 10510

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10511
D=A // 10512
@SP // 10513
M=D+M // 10514
@114 // 10515
D=A // 10516
@SP // 10517
A=M-1 // 10518
M=0 // 10519
A=A-1 // 10520
M=0 // 10521
A=A-1 // 10522
M=0 // 10523
A=A-1 // 10524
M=D // 10525
A=A-1 // 10526
@29 // 10527
D=A // 10528
@SP // 10529
AM=M+1 // 10530
A=A-1 // 10531
M=D // 10532
@55 // 10533
D=A // 10534
@SP // 10535
AM=M+1 // 10536
A=A-1 // 10537
M=D // 10538
@51 // 10539
D=A // 10540
@SP // 10541
AM=M+1 // 10542
A=A-1 // 10543
M=D // 10544
@3 // 10545
D=A // 10546
@SP // 10547
AM=M+1 // 10548
A=A-1 // 10549
M=D // 10550
@3 // 10551
D=A // 10552
@SP // 10553
AM=M+1 // 10554
A=A-1 // 10555
M=D // 10556
@7 // 10557
D=A // 10558
@SP // 10559
AM=M+1 // 10560
A=A-1 // 10561
M=D // 10562
@SP // 10563
AM=M+1 // 10564
A=A-1 // 10565
M=0 // 10566
@SP // 10567
AM=M+1 // 10568
A=A-1 // 10569
M=0 // 10570
// call Output.create
@17 // 10571
D=A // 10572
@14 // 10573
M=D // 10574
@Output.create // 10575
D=A // 10576
@13 // 10577
M=D // 10578
@Output.initMap.ret.84 // 10579
D=A // 10580
@CALL // 10581
0;JMP // 10582
(Output.initMap.ret.84)
@SP // 10583
M=M-1 // 10584

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10585
D=A // 10586
@SP // 10587
M=D+M // 10588
@115 // 10589
D=A // 10590
@SP // 10591
A=M-1 // 10592
M=0 // 10593
A=A-1 // 10594
M=0 // 10595
A=A-1 // 10596
M=0 // 10597
A=A-1 // 10598
M=D // 10599
A=A-1 // 10600
@30 // 10601
D=A // 10602
@SP // 10603
AM=M+1 // 10604
A=A-1 // 10605
M=D // 10606
@51 // 10607
D=A // 10608
@SP // 10609
AM=M+1 // 10610
A=A-1 // 10611
M=D // 10612
@6 // 10613
D=A // 10614
@SP // 10615
AM=M+1 // 10616
A=A-1 // 10617
M=D // 10618
@24 // 10619
D=A // 10620
@SP // 10621
AM=M+1 // 10622
A=A-1 // 10623
M=D // 10624
@51 // 10625
D=A // 10626
@SP // 10627
AM=M+1 // 10628
A=A-1 // 10629
M=D // 10630
@30 // 10631
D=A // 10632
@SP // 10633
AM=M+1 // 10634
A=A-1 // 10635
M=D // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=0 // 10640
@SP // 10641
AM=M+1 // 10642
A=A-1 // 10643
M=0 // 10644
// call Output.create
@17 // 10645
D=A // 10646
@14 // 10647
M=D // 10648
@Output.create // 10649
D=A // 10650
@13 // 10651
M=D // 10652
@Output.initMap.ret.85 // 10653
D=A // 10654
@CALL // 10655
0;JMP // 10656
(Output.initMap.ret.85)
@SP // 10657
M=M-1 // 10658

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10659
D=A // 10660
@SP // 10661
AM=M+1 // 10662
A=A-1 // 10663
M=D // 10664
@4 // 10665
D=A // 10666
@SP // 10667
AM=M+1 // 10668
A=A-1 // 10669
M=D // 10670
@6 // 10671
D=A // 10672
@SP // 10673
AM=M+1 // 10674
A=A-1 // 10675
M=D // 10676
@6 // 10677
D=A // 10678
@SP // 10679
AM=M+1 // 10680
A=A-1 // 10681
M=D // 10682
@15 // 10683
D=A // 10684
@SP // 10685
AM=M+1 // 10686
A=A-1 // 10687
M=D // 10688
@6 // 10689
D=A // 10690
@SP // 10691
AM=M+1 // 10692
A=A-1 // 10693
M=D // 10694
@6 // 10695
D=A // 10696
@SP // 10697
AM=M+1 // 10698
A=A-1 // 10699
M=D // 10700
@6 // 10701
D=A // 10702
@SP // 10703
AM=M+1 // 10704
A=A-1 // 10705
M=D // 10706
@54 // 10707
D=A // 10708
@SP // 10709
AM=M+1 // 10710
A=A-1 // 10711
M=D // 10712
@28 // 10713
D=A // 10714
@SP // 10715
AM=M+1 // 10716
A=A-1 // 10717
M=D // 10718
@SP // 10719
AM=M+1 // 10720
A=A-1 // 10721
M=0 // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=0 // 10726
// call Output.create
@17 // 10727
D=A // 10728
@14 // 10729
M=D // 10730
@Output.create // 10731
D=A // 10732
@13 // 10733
M=D // 10734
@Output.initMap.ret.86 // 10735
D=A // 10736
@CALL // 10737
0;JMP // 10738
(Output.initMap.ret.86)
@SP // 10739
M=M-1 // 10740

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10741
D=A // 10742
@SP // 10743
M=D+M // 10744
@117 // 10745
D=A // 10746
@SP // 10747
A=M-1 // 10748
M=0 // 10749
A=A-1 // 10750
M=0 // 10751
A=A-1 // 10752
M=0 // 10753
A=A-1 // 10754
M=D // 10755
A=A-1 // 10756
@27 // 10757
D=A // 10758
@SP // 10759
AM=M+1 // 10760
A=A-1 // 10761
M=D // 10762
@27 // 10763
D=A // 10764
@SP // 10765
AM=M+1 // 10766
A=A-1 // 10767
M=D // 10768
@27 // 10769
D=A // 10770
@SP // 10771
AM=M+1 // 10772
A=A-1 // 10773
M=D // 10774
@27 // 10775
D=A // 10776
@SP // 10777
AM=M+1 // 10778
A=A-1 // 10779
M=D // 10780
@27 // 10781
D=A // 10782
@SP // 10783
AM=M+1 // 10784
A=A-1 // 10785
M=D // 10786
@54 // 10787
D=A // 10788
@SP // 10789
AM=M+1 // 10790
A=A-1 // 10791
M=D // 10792
@SP // 10793
AM=M+1 // 10794
A=A-1 // 10795
M=0 // 10796
@SP // 10797
AM=M+1 // 10798
A=A-1 // 10799
M=0 // 10800
// call Output.create
@17 // 10801
D=A // 10802
@14 // 10803
M=D // 10804
@Output.create // 10805
D=A // 10806
@13 // 10807
M=D // 10808
@Output.initMap.ret.87 // 10809
D=A // 10810
@CALL // 10811
0;JMP // 10812
(Output.initMap.ret.87)
@SP // 10813
M=M-1 // 10814

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10815
D=A // 10816
@SP // 10817
M=D+M // 10818
@118 // 10819
D=A // 10820
@SP // 10821
A=M-1 // 10822
M=0 // 10823
A=A-1 // 10824
M=0 // 10825
A=A-1 // 10826
M=0 // 10827
A=A-1 // 10828
M=D // 10829
A=A-1 // 10830
@51 // 10831
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
@51 // 10843
D=A // 10844
@SP // 10845
AM=M+1 // 10846
A=A-1 // 10847
M=D // 10848
@51 // 10849
D=A // 10850
@SP // 10851
AM=M+1 // 10852
A=A-1 // 10853
M=D // 10854
@30 // 10855
D=A // 10856
@SP // 10857
AM=M+1 // 10858
A=A-1 // 10859
M=D // 10860
@12 // 10861
D=A // 10862
@SP // 10863
AM=M+1 // 10864
A=A-1 // 10865
M=D // 10866
@SP // 10867
AM=M+1 // 10868
A=A-1 // 10869
M=0 // 10870
@SP // 10871
AM=M+1 // 10872
A=A-1 // 10873
M=0 // 10874
// call Output.create
@17 // 10875
D=A // 10876
@14 // 10877
M=D // 10878
@Output.create // 10879
D=A // 10880
@13 // 10881
M=D // 10882
@Output.initMap.ret.88 // 10883
D=A // 10884
@CALL // 10885
0;JMP // 10886
(Output.initMap.ret.88)
@SP // 10887
M=M-1 // 10888

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10889
D=A // 10890
@SP // 10891
M=D+M // 10892
@119 // 10893
D=A // 10894
@SP // 10895
A=M-1 // 10896
M=0 // 10897
A=A-1 // 10898
M=0 // 10899
A=A-1 // 10900
M=0 // 10901
A=A-1 // 10902
M=D // 10903
A=A-1 // 10904
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
@51 // 10917
D=A // 10918
@SP // 10919
AM=M+1 // 10920
A=A-1 // 10921
M=D // 10922
@63 // 10923
D=A // 10924
@SP // 10925
AM=M+1 // 10926
A=A-1 // 10927
M=D // 10928
@63 // 10929
D=A // 10930
@SP // 10931
AM=M+1 // 10932
A=A-1 // 10933
M=D // 10934
@18 // 10935
D=A // 10936
@SP // 10937
AM=M+1 // 10938
A=A-1 // 10939
M=D // 10940
@SP // 10941
AM=M+1 // 10942
A=A-1 // 10943
M=0 // 10944
@SP // 10945
AM=M+1 // 10946
A=A-1 // 10947
M=0 // 10948
// call Output.create
@17 // 10949
D=A // 10950
@14 // 10951
M=D // 10952
@Output.create // 10953
D=A // 10954
@13 // 10955
M=D // 10956
@Output.initMap.ret.89 // 10957
D=A // 10958
@CALL // 10959
0;JMP // 10960
(Output.initMap.ret.89)
@SP // 10961
M=M-1 // 10962

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10963
D=A // 10964
@SP // 10965
M=D+M // 10966
@120 // 10967
D=A // 10968
@SP // 10969
A=M-1 // 10970
M=0 // 10971
A=A-1 // 10972
M=0 // 10973
A=A-1 // 10974
M=0 // 10975
A=A-1 // 10976
M=D // 10977
A=A-1 // 10978
@51 // 10979
D=A // 10980
@SP // 10981
AM=M+1 // 10982
A=A-1 // 10983
M=D // 10984
@30 // 10985
D=A // 10986
@SP // 10987
AM=M+1 // 10988
A=A-1 // 10989
M=D // 10990
@12 // 10991
D=A // 10992
@SP // 10993
AM=M+1 // 10994
A=A-1 // 10995
M=D // 10996
@12 // 10997
D=A // 10998
@SP // 10999
AM=M+1 // 11000
A=A-1 // 11001
M=D // 11002
@30 // 11003
D=A // 11004
@SP // 11005
AM=M+1 // 11006
A=A-1 // 11007
M=D // 11008
@51 // 11009
D=A // 11010
@SP // 11011
AM=M+1 // 11012
A=A-1 // 11013
M=D // 11014
@SP // 11015
AM=M+1 // 11016
A=A-1 // 11017
M=0 // 11018
@SP // 11019
AM=M+1 // 11020
A=A-1 // 11021
M=0 // 11022
// call Output.create
@17 // 11023
D=A // 11024
@14 // 11025
M=D // 11026
@Output.create // 11027
D=A // 11028
@13 // 11029
M=D // 11030
@Output.initMap.ret.90 // 11031
D=A // 11032
@CALL // 11033
0;JMP // 11034
(Output.initMap.ret.90)
@SP // 11035
M=M-1 // 11036

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11037
D=A // 11038
@SP // 11039
M=D+M // 11040
@121 // 11041
D=A // 11042
@SP // 11043
A=M-1 // 11044
M=0 // 11045
A=A-1 // 11046
M=0 // 11047
A=A-1 // 11048
M=0 // 11049
A=A-1 // 11050
M=D // 11051
A=A-1 // 11052
@51 // 11053
D=A // 11054
@SP // 11055
AM=M+1 // 11056
A=A-1 // 11057
M=D // 11058
@51 // 11059
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
@62 // 11071
D=A // 11072
@SP // 11073
AM=M+1 // 11074
A=A-1 // 11075
M=D // 11076
@48 // 11077
D=A // 11078
@SP // 11079
AM=M+1 // 11080
A=A-1 // 11081
M=D // 11082
@24 // 11083
D=A // 11084
@SP // 11085
AM=M+1 // 11086
A=A-1 // 11087
M=D // 11088
@15 // 11089
D=A // 11090
@SP // 11091
AM=M+1 // 11092
A=A-1 // 11093
M=D // 11094
@SP // 11095
AM=M+1 // 11096
A=A-1 // 11097
M=0 // 11098
// call Output.create
@17 // 11099
D=A // 11100
@14 // 11101
M=D // 11102
@Output.create // 11103
D=A // 11104
@13 // 11105
M=D // 11106
@Output.initMap.ret.91 // 11107
D=A // 11108
@CALL // 11109
0;JMP // 11110
(Output.initMap.ret.91)
@SP // 11111
M=M-1 // 11112

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11113
D=A // 11114
@SP // 11115
M=D+M // 11116
@122 // 11117
D=A // 11118
@SP // 11119
A=M-1 // 11120
M=0 // 11121
A=A-1 // 11122
M=0 // 11123
A=A-1 // 11124
M=0 // 11125
A=A-1 // 11126
M=D // 11127
A=A-1 // 11128
@63 // 11129
D=A // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=D // 11134
@27 // 11135
D=A // 11136
@SP // 11137
AM=M+1 // 11138
A=A-1 // 11139
M=D // 11140
@12 // 11141
D=A // 11142
@SP // 11143
AM=M+1 // 11144
A=A-1 // 11145
M=D // 11146
@6 // 11147
D=A // 11148
@SP // 11149
AM=M+1 // 11150
A=A-1 // 11151
M=D // 11152
@51 // 11153
D=A // 11154
@SP // 11155
AM=M+1 // 11156
A=A-1 // 11157
M=D // 11158
@63 // 11159
D=A // 11160
@SP // 11161
AM=M+1 // 11162
A=A-1 // 11163
M=D // 11164
@SP // 11165
AM=M+1 // 11166
A=A-1 // 11167
M=0 // 11168
@SP // 11169
AM=M+1 // 11170
A=A-1 // 11171
M=0 // 11172
// call Output.create
@17 // 11173
D=A // 11174
@14 // 11175
M=D // 11176
@Output.create // 11177
D=A // 11178
@13 // 11179
M=D // 11180
@Output.initMap.ret.92 // 11181
D=A // 11182
@CALL // 11183
0;JMP // 11184
(Output.initMap.ret.92)
@SP // 11185
M=M-1 // 11186

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11187
D=A // 11188
@SP // 11189
AM=M+1 // 11190
A=A-1 // 11191
M=D // 11192
@56 // 11193
D=A // 11194
@SP // 11195
AM=M+1 // 11196
A=A-1 // 11197
M=D // 11198
@12 // 11199
D=A // 11200
@SP // 11201
AM=M+1 // 11202
A=A-1 // 11203
M=D // 11204
@12 // 11205
D=A // 11206
@SP // 11207
AM=M+1 // 11208
A=A-1 // 11209
M=D // 11210
@12 // 11211
D=A // 11212
@SP // 11213
AM=M+1 // 11214
A=A-1 // 11215
M=D // 11216
@7 // 11217
D=A // 11218
@SP // 11219
AM=M+1 // 11220
A=A-1 // 11221
M=D // 11222
@12 // 11223
D=A // 11224
@SP // 11225
AM=M+1 // 11226
A=A-1 // 11227
M=D // 11228
@12 // 11229
D=A // 11230
@SP // 11231
AM=M+1 // 11232
A=A-1 // 11233
M=D // 11234
@12 // 11235
D=A // 11236
@SP // 11237
AM=M+1 // 11238
A=A-1 // 11239
M=D // 11240
@56 // 11241
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
@Output.initMap.ret.93 // 11263
D=A // 11264
@CALL // 11265
0;JMP // 11266
(Output.initMap.ret.93)
@SP // 11267
M=M-1 // 11268

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11269
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
@12 // 11287
D=A // 11288
@SP // 11289
AM=M+1 // 11290
A=A-1 // 11291
M=D // 11292
@12 // 11293
D=A // 11294
@SP // 11295
AM=M+1 // 11296
A=A-1 // 11297
M=D // 11298
@12 // 11299
D=A // 11300
@SP // 11301
AM=M+1 // 11302
A=A-1 // 11303
M=D // 11304
@12 // 11305
D=A // 11306
@SP // 11307
AM=M+1 // 11308
A=A-1 // 11309
M=D // 11310
@12 // 11311
D=A // 11312
@SP // 11313
AM=M+1 // 11314
A=A-1 // 11315
M=D // 11316
@12 // 11317
D=A // 11318
@SP // 11319
AM=M+1 // 11320
A=A-1 // 11321
M=D // 11322
@12 // 11323
D=A // 11324
@SP // 11325
AM=M+1 // 11326
A=A-1 // 11327
M=D // 11328
@SP // 11329
AM=M+1 // 11330
A=A-1 // 11331
M=0 // 11332
@SP // 11333
AM=M+1 // 11334
A=A-1 // 11335
M=0 // 11336
// call Output.create
@17 // 11337
D=A // 11338
@14 // 11339
M=D // 11340
@Output.create // 11341
D=A // 11342
@13 // 11343
M=D // 11344
@Output.initMap.ret.94 // 11345
D=A // 11346
@CALL // 11347
0;JMP // 11348
(Output.initMap.ret.94)
@SP // 11349
M=M-1 // 11350

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11351
D=A // 11352
@SP // 11353
AM=M+1 // 11354
A=A-1 // 11355
M=D // 11356
@7 // 11357
D=A // 11358
@SP // 11359
AM=M+1 // 11360
A=A-1 // 11361
M=D // 11362
@12 // 11363
D=A // 11364
@SP // 11365
AM=M+1 // 11366
A=A-1 // 11367
M=D // 11368
@12 // 11369
D=A // 11370
@SP // 11371
AM=M+1 // 11372
A=A-1 // 11373
M=D // 11374
@12 // 11375
D=A // 11376
@SP // 11377
AM=M+1 // 11378
A=A-1 // 11379
M=D // 11380
@56 // 11381
D=A // 11382
@SP // 11383
AM=M+1 // 11384
A=A-1 // 11385
M=D // 11386
@12 // 11387
D=A // 11388
@SP // 11389
AM=M+1 // 11390
A=A-1 // 11391
M=D // 11392
@12 // 11393
D=A // 11394
@SP // 11395
AM=M+1 // 11396
A=A-1 // 11397
M=D // 11398
@12 // 11399
D=A // 11400
@SP // 11401
AM=M+1 // 11402
A=A-1 // 11403
M=D // 11404
@7 // 11405
D=A // 11406
@SP // 11407
AM=M+1 // 11408
A=A-1 // 11409
M=D // 11410
@SP // 11411
AM=M+1 // 11412
A=A-1 // 11413
M=0 // 11414
@SP // 11415
AM=M+1 // 11416
A=A-1 // 11417
M=0 // 11418
// call Output.create
@17 // 11419
D=A // 11420
@14 // 11421
M=D // 11422
@Output.create // 11423
D=A // 11424
@13 // 11425
M=D // 11426
@Output.initMap.ret.95 // 11427
D=A // 11428
@CALL // 11429
0;JMP // 11430
(Output.initMap.ret.95)
@SP // 11431
M=M-1 // 11432

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11433
D=A // 11434
@SP // 11435
AM=M+1 // 11436
A=A-1 // 11437
M=D // 11438
@38 // 11439
D=A // 11440
@SP // 11441
AM=M+1 // 11442
A=A-1 // 11443
M=D // 11444
@45 // 11445
D=A // 11446
@SP // 11447
AM=M+1 // 11448
A=A-1 // 11449
M=D // 11450
@25 // 11451
D=A // 11452
@SP // 11453
AM=M+1 // 11454
A=A-1 // 11455
M=D // 11456
@SP // 11457
AM=M+1 // 11458
A=A-1 // 11459
M=0 // 11460
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
@SP // 11477
AM=M+1 // 11478
A=A-1 // 11479
M=0 // 11480
@SP // 11481
AM=M+1 // 11482
A=A-1 // 11483
M=0 // 11484
@SP // 11485
AM=M+1 // 11486
A=A-1 // 11487
M=0 // 11488
// call Output.create
@17 // 11489
D=A // 11490
@14 // 11491
M=D // 11492
@Output.create // 11493
D=A // 11494
@13 // 11495
M=D // 11496
@Output.initMap.ret.96 // 11497
D=A // 11498
@CALL // 11499
0;JMP // 11500
(Output.initMap.ret.96)
@SP // 11501
M=M-1 // 11502

////PushInstruction("constant 0")
@SP // 11503
AM=M+1 // 11504
A=A-1 // 11505
M=0 // 11506
@RETURN // 11507
0;JMP // 11508

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 11509
AM=M+1 // 11510
A=A-1 // 11511
M=0 // 11512

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11513
D=A // 11514
@SP // 11515
AM=M+1 // 11516
A=A-1 // 11517
M=D // 11518
// call Array.new
@6 // 11519
D=A // 11520
@14 // 11521
M=D // 11522
@Array.new // 11523
D=A // 11524
@13 // 11525
M=D // 11526
@Output.create.ret.0 // 11527
D=A // 11528
@CALL // 11529
0;JMP // 11530
(Output.create.ret.0)
@SP // 11531
AM=M-1 // 11532
D=M // 11533
@LCL // 11534
A=M // 11535
M=D // 11536

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11537
D=M // 11538
@SP // 11539
AM=M+1 // 11540
A=A-1 // 11541
M=D // 11542
@ARG // 11543
A=M // 11544
D=M // 11545
@SP // 11546
AM=M-1 // 11547
D=D+M // 11548
@SP // 11549
AM=M+1 // 11550
A=A-1 // 11551
M=D // 11552
@LCL // 11553
A=M // 11554
D=M // 11555
@SP // 11556
AM=M-1 // 11557
A=M // 11558
M=D // 11559

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11560
A=M // 11561
D=M // 11562
@SP // 11563
AM=M+1 // 11564
A=A-1 // 11565
M=D // 11566
@ARG // 11567
A=M+1 // 11568
D=M // 11569
@SP // 11570
AM=M-1 // 11571
A=M // 11572
M=D // 11573

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11574
A=M // 11575
D=M // 11576
@SP // 11577
AM=M+1 // 11578
A=A-1 // 11579
M=D+1 // 11580
@ARG // 11581
A=M+1 // 11582
A=A+1 // 11583
D=M // 11584
@SP // 11585
AM=M-1 // 11586
A=M // 11587
M=D // 11588

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11589
A=M // 11590
D=M // 11591
@2 // 11592
D=D+A // 11593
@SP // 11594
AM=M+1 // 11595
A=A-1 // 11596
M=D // 11597
@ARG // 11598
A=M+1 // 11599
A=A+1 // 11600
A=A+1 // 11601
D=M // 11602
@SP // 11603
AM=M-1 // 11604
A=M // 11605
M=D // 11606

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11607
A=M // 11608
D=M // 11609
@3 // 11610
D=D+A // 11611
@SP // 11612
AM=M+1 // 11613
A=A-1 // 11614
M=D // 11615
@ARG // 11616
D=M // 11617
@4 // 11618
A=D+A // 11619
D=M // 11620
@SP // 11621
AM=M-1 // 11622
A=M // 11623
M=D // 11624

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11625
A=M // 11626
D=M // 11627
@4 // 11628
D=D+A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633
@ARG // 11634
D=M // 11635
@5 // 11636
A=D+A // 11637
D=M // 11638
@SP // 11639
AM=M-1 // 11640
A=M // 11641
M=D // 11642

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11643
A=M // 11644
D=M // 11645
@5 // 11646
D=D+A // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=D // 11651
@ARG // 11652
D=M // 11653
@6 // 11654
A=D+A // 11655
D=M // 11656
@SP // 11657
AM=M-1 // 11658
A=M // 11659
M=D // 11660

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11661
A=M // 11662
D=M // 11663
@6 // 11664
D=D+A // 11665
@SP // 11666
AM=M+1 // 11667
A=A-1 // 11668
M=D // 11669
@ARG // 11670
D=M // 11671
@7 // 11672
A=D+A // 11673
D=M // 11674
@SP // 11675
AM=M-1 // 11676
A=M // 11677
M=D // 11678

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11679
A=M // 11680
D=M // 11681
@7 // 11682
D=D+A // 11683
@SP // 11684
AM=M+1 // 11685
A=A-1 // 11686
M=D // 11687
@ARG // 11688
D=M // 11689
@8 // 11690
A=D+A // 11691
D=M // 11692
@SP // 11693
AM=M-1 // 11694
A=M // 11695
M=D // 11696

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11697
A=M // 11698
D=M // 11699
@8 // 11700
D=D+A // 11701
@SP // 11702
AM=M+1 // 11703
A=A-1 // 11704
M=D // 11705
@ARG // 11706
D=M // 11707
@9 // 11708
A=D+A // 11709
D=M // 11710
@SP // 11711
AM=M-1 // 11712
A=M // 11713
M=D // 11714

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11715
A=M // 11716
D=M // 11717
@9 // 11718
D=D+A // 11719
@SP // 11720
AM=M+1 // 11721
A=A-1 // 11722
M=D // 11723
@ARG // 11724
D=M // 11725
@10 // 11726
A=D+A // 11727
D=M // 11728
@SP // 11729
AM=M-1 // 11730
A=M // 11731
M=D // 11732

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11733
A=M // 11734
D=M // 11735
@10 // 11736
D=D+A // 11737
@SP // 11738
AM=M+1 // 11739
A=A-1 // 11740
M=D // 11741
@ARG // 11742
D=M // 11743
@11 // 11744
A=D+A // 11745
D=M // 11746
@SP // 11747
AM=M-1 // 11748
A=M // 11749
M=D // 11750

////PushInstruction("constant 0")
@SP // 11751
AM=M+1 // 11752
A=A-1 // 11753
M=0 // 11754
@RETURN // 11755
0;JMP // 11756

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
//NOT), ifGoto=IfGotoInstruction{label='Output.getMap.IfElse1}}
@Output.getMap.LT.0 // 11757
D=A // 11758
@SP // 11759
AM=M+1 // 11760
A=A-1 // 11761
M=D // 11762
@ARG // 11763
A=M // 11764
D=M // 11765
@32 // 11766
D=D-A // 11767
@DO_LT // 11768
0;JMP // 11769
(Output.getMap.LT.0)
@SP // 11770
AM=M+1 // 11771
A=A-1 // 11772
M=D // 11773
@Output.getMap.GT.1 // 11774
D=A // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=D // 11779
@ARG // 11780
A=M // 11781
D=M // 11782
@126 // 11783
D=D-A // 11784
@DO_GT // 11785
0;JMP // 11786
(Output.getMap.GT.1)
@SP // 11787
AM=M-1 // 11788
D=D|M // 11789
D=!D // 11790
@Output.getMap.IfElse1 // 11791
D;JNE // 11792

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11793
A=M // 11794
M=0 // 11795

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 11796
0;JMP // 11797

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
@Output.0 // 11798
D=M // 11799
@SP // 11800
AM=M+1 // 11801
A=A-1 // 11802
M=D // 11803
@ARG // 11804
A=M // 11805
D=M // 11806
@SP // 11807
AM=M-1 // 11808
A=D+M // 11809
D=M // 11810
@SP // 11811
AM=M+1 // 11812
A=A-1 // 11813
M=D // 11814
@RETURN // 11815
0;JMP // 11816

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 11817
A=M+1 // 11818
D=M // 11819
@Output.1 // 11820
M=D // 11821

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 11822
A=M // 11823
D=M // 11824
@Output.2 // 11825
M=D // 11826

////PushInstruction("constant 0")
@SP // 11827
AM=M+1 // 11828
A=A-1 // 11829
M=0 // 11830
@RETURN // 11831
0;JMP // 11832

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 11833
D=A // 11834
@SP // 11835
AM=D+M // 11836
A=A-1 // 11837
M=0 // 11838
A=A-1 // 11839
M=0 // 11840
A=A-1 // 11841
M=0 // 11842
A=A-1 // 11843
M=0 // 11844

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 11845
A=M // 11846
D=M // 11847
@SP // 11848
AM=M+1 // 11849
A=A-1 // 11850
M=D // 11851
// call Output.getMap
@6 // 11852
D=A // 11853
@14 // 11854
M=D // 11855
@Output.getMap // 11856
D=A // 11857
@13 // 11858
M=D // 11859
@Output.printChar.ret.0 // 11860
D=A // 11861
@CALL // 11862
0;JMP // 11863
(Output.printChar.ret.0)
@SP // 11864
AM=M-1 // 11865
D=M // 11866
@LCL // 11867
A=M // 11868
M=D // 11869

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 11870
A=M+1 // 11871
A=A+1 // 11872
A=A+1 // 11873
M=0 // 11874

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
@Output.printChar.LT.2 // 11875
D=A // 11876
@SP // 11877
AM=M+1 // 11878
A=A-1 // 11879
M=D // 11880
@LCL // 11881
A=M+1 // 11882
A=A+1 // 11883
A=A+1 // 11884
D=M // 11885
@11 // 11886
D=D-A // 11887
@DO_LT // 11888
0;JMP // 11889
(Output.printChar.LT.2)
D=!D // 11890
@WHILE_END_Output.printChar1 // 11891
D;JNE // 11892

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

@Output.2 // 11893
D=M // 11894
@SP // 11895
AM=M+1 // 11896
A=A-1 // 11897
M=D // 11898
@11 // 11899
D=A // 11900
@SP // 11901
AM=M+1 // 11902
A=A-1 // 11903
M=D // 11904
// call Math.multiply
@7 // 11905
D=A // 11906
@14 // 11907
M=D // 11908
@Math.multiply // 11909
D=A // 11910
@13 // 11911
M=D // 11912
@Output.printChar.ret.1 // 11913
D=A // 11914
@CALL // 11915
0;JMP // 11916
(Output.printChar.ret.1)
@LCL // 11917
A=M+1 // 11918
A=A+1 // 11919
A=A+1 // 11920
D=M // 11921
@SP // 11922
AM=M-1 // 11923
D=D+M // 11924
@SP // 11925
AM=M+1 // 11926
A=A-1 // 11927
M=D // 11928
@32 // 11929
D=A // 11930
@SP // 11931
AM=M+1 // 11932
A=A-1 // 11933
M=D // 11934
// call Math.multiply
@7 // 11935
D=A // 11936
@14 // 11937
M=D // 11938
@Math.multiply // 11939
D=A // 11940
@13 // 11941
M=D // 11942
@Output.printChar.ret.2 // 11943
D=A // 11944
@CALL // 11945
0;JMP // 11946
(Output.printChar.ret.2)
@SP // 11947
AM=M-1 // 11948
D=M // 11949
@16384 // 11950
D=D+A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955
@Output.1 // 11956
D=M // 11957
@SP // 11958
AM=M+1 // 11959
A=A-1 // 11960
M=D // 11961
@2 // 11962
D=A // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=D // 11967
// call Math.divide
@7 // 11968
D=A // 11969
@14 // 11970
M=D // 11971
@Math.divide // 11972
D=A // 11973
@13 // 11974
M=D // 11975
@Output.printChar.ret.3 // 11976
D=A // 11977
@CALL // 11978
0;JMP // 11979
(Output.printChar.ret.3)
@SP // 11980
AM=M-1 // 11981
D=M // 11982
@SP // 11983
AM=M-1 // 11984
D=D+M // 11985
@LCL // 11986
A=M+1 // 11987
M=D // 11988

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
@Output.printChar.EQ.3 // 11989
D=A // 11990
@SP // 11991
AM=M+1 // 11992
A=A-1 // 11993
M=D // 11994
@Output.1 // 11995
D=M // 11996
@1 // 11997
D=D&A // 11998
@DO_EQ // 11999
0;JMP // 12000
(Output.printChar.EQ.3)
D=!D // 12001
@Output.printChar.IfElse1 // 12002
D;JNE // 12003

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

@LCL // 12004
A=M+1 // 12005
A=A+1 // 12006
A=A+1 // 12007
D=M // 12008
A=A-1 // 12009
A=A-1 // 12010
A=A-1 // 12011
A=D+M // 12012
D=M // 12013
@LCL // 12014
A=M+1 // 12015
A=A+1 // 12016
M=D // 12017

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 12018
0;JMP // 12019

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

@LCL // 12020
A=M+1 // 12021
A=A+1 // 12022
A=A+1 // 12023
D=M // 12024
A=A-1 // 12025
A=A-1 // 12026
A=A-1 // 12027
A=D+M // 12028
D=M // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=D // 12033
@256 // 12034
D=A // 12035
@SP // 12036
AM=M+1 // 12037
A=A-1 // 12038
M=D // 12039
// call Math.multiply
@7 // 12040
D=A // 12041
@14 // 12042
M=D // 12043
@Math.multiply // 12044
D=A // 12045
@13 // 12046
M=D // 12047
@Output.printChar.ret.4 // 12048
D=A // 12049
@CALL // 12050
0;JMP // 12051
(Output.printChar.ret.4)
@SP // 12052
AM=M-1 // 12053
D=M // 12054
@LCL // 12055
A=M+1 // 12056
A=A+1 // 12057
M=D // 12058

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
@LCL // 12059
A=M+1 // 12060
D=M // 12061
@SP // 12062
AM=M+1 // 12063
A=A-1 // 12064
M=D // 12065
@LCL // 12066
A=M+1 // 12067
D=M // 12068
@0 // 12069
A=D+A // 12070
D=M // 12071
@SP // 12072
AM=M+1 // 12073
A=A-1 // 12074
M=D // 12075
@LCL // 12076
A=M+1 // 12077
A=A+1 // 12078
D=M // 12079
@SP // 12080
AM=M-1 // 12081
D=D|M // 12082
@SP // 12083
AM=M-1 // 12084
A=M // 12085
M=D // 12086

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

@LCL // 12087
A=M+1 // 12088
A=A+1 // 12089
A=A+1 // 12090
M=M+1 // 12091

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12092
0;JMP // 12093

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
@Output.printChar.EQ.4 // 12094
D=A // 12095
@SP // 12096
AM=M+1 // 12097
A=A-1 // 12098
M=D // 12099
@Output.1 // 12100
D=M // 12101
@63 // 12102
D=D-A // 12103
@DO_EQ // 12104
0;JMP // 12105
(Output.printChar.EQ.4)
D=!D // 12106
@Output.printChar.IfElse2 // 12107
D;JNE // 12108

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12109
D=A // 12110
@14 // 12111
M=D // 12112
@Output.println // 12113
D=A // 12114
@13 // 12115
M=D // 12116
@Output.printChar.ret.5 // 12117
D=A // 12118
@CALL // 12119
0;JMP // 12120
(Output.printChar.ret.5)
@SP // 12121
M=M-1 // 12122

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12123
0;JMP // 12124

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

@Output.1 // 12125
M=M+1 // 12126

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12127
AM=M+1 // 12128
A=A-1 // 12129
M=0 // 12130
@RETURN // 12131
0;JMP // 12132

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12133
M=M+1 // 12134
AM=M+1 // 12135
A=A-1 // 12136
M=0 // 12137
A=A-1 // 12138
M=0 // 12139

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12140
A=M // 12141
M=0 // 12142

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12143
A=M // 12144
D=M // 12145
@SP // 12146
AM=M+1 // 12147
A=A-1 // 12148
M=D // 12149
// call String.length
@6 // 12150
D=A // 12151
@14 // 12152
M=D // 12153
@String.length // 12154
D=A // 12155
@13 // 12156
M=D // 12157
@Output.printString.ret.0 // 12158
D=A // 12159
@CALL // 12160
0;JMP // 12161
(Output.printString.ret.0)
@SP // 12162
AM=M-1 // 12163
D=M // 12164
@LCL // 12165
A=M+1 // 12166
M=D // 12167

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
@Output.printString.LT.5 // 12168
D=A // 12169
@SP // 12170
AM=M+1 // 12171
A=A-1 // 12172
M=D // 12173
@LCL // 12174
A=M+1 // 12175
D=M // 12176
A=A-1 // 12177
D=M-D // 12178
@DO_LT // 12179
0;JMP // 12180
(Output.printString.LT.5)
D=!D // 12181
@WHILE_END_Output.printString1 // 12182
D;JNE // 12183

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12184
A=M // 12185
D=M // 12186
@SP // 12187
AM=M+1 // 12188
A=A-1 // 12189
M=D // 12190
@LCL // 12191
A=M // 12192
D=M // 12193
@SP // 12194
AM=M+1 // 12195
A=A-1 // 12196
M=D // 12197
// call String.charAt
@7 // 12198
D=A // 12199
@14 // 12200
M=D // 12201
@String.charAt // 12202
D=A // 12203
@13 // 12204
M=D // 12205
@Output.printString.ret.1 // 12206
D=A // 12207
@CALL // 12208
0;JMP // 12209
(Output.printString.ret.1)
// call Output.printChar
@6 // 12210
D=A // 12211
@14 // 12212
M=D // 12213
@Output.printChar // 12214
D=A // 12215
@13 // 12216
M=D // 12217
@Output.printString.ret.2 // 12218
D=A // 12219
@CALL // 12220
0;JMP // 12221
(Output.printString.ret.2)
@SP // 12222
M=M-1 // 12223

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

@LCL // 12224
A=M // 12225
M=M+1 // 12226

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12227
0;JMP // 12228

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12229
AM=M+1 // 12230
A=A-1 // 12231
M=0 // 12232
@RETURN // 12233
0;JMP // 12234

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12235
AM=M+1 // 12236
A=A-1 // 12237
M=0 // 12238

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12239
D=A // 12240
@SP // 12241
AM=M+1 // 12242
A=A-1 // 12243
M=D // 12244
// call String.new
@6 // 12245
D=A // 12246
@14 // 12247
M=D // 12248
@String.new // 12249
D=A // 12250
@13 // 12251
M=D // 12252
@Output.printInt.ret.0 // 12253
D=A // 12254
@CALL // 12255
0;JMP // 12256
(Output.printInt.ret.0)
@SP // 12257
AM=M-1 // 12258
D=M // 12259
@LCL // 12260
A=M // 12261
M=D // 12262

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12263
A=M // 12264
D=M // 12265
@SP // 12266
AM=M+1 // 12267
A=A-1 // 12268
M=D // 12269
@ARG // 12270
A=M // 12271
D=M // 12272
@SP // 12273
AM=M+1 // 12274
A=A-1 // 12275
M=D // 12276
// call String.setInt
@7 // 12277
D=A // 12278
@14 // 12279
M=D // 12280
@String.setInt // 12281
D=A // 12282
@13 // 12283
M=D // 12284
@Output.printInt.ret.1 // 12285
D=A // 12286
@CALL // 12287
0;JMP // 12288
(Output.printInt.ret.1)
@SP // 12289
M=M-1 // 12290

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12291
A=M // 12292
D=M // 12293
@SP // 12294
AM=M+1 // 12295
A=A-1 // 12296
M=D // 12297
// call Output.printString
@6 // 12298
D=A // 12299
@14 // 12300
M=D // 12301
@Output.printString // 12302
D=A // 12303
@13 // 12304
M=D // 12305
@Output.printInt.ret.2 // 12306
D=A // 12307
@CALL // 12308
0;JMP // 12309
(Output.printInt.ret.2)
@SP // 12310
M=M-1 // 12311

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12312
A=M // 12313
D=M // 12314
@SP // 12315
AM=M+1 // 12316
A=A-1 // 12317
M=D // 12318
// call String.dispose
@6 // 12319
D=A // 12320
@14 // 12321
M=D // 12322
@String.dispose // 12323
D=A // 12324
@13 // 12325
M=D // 12326
@Output.printInt.ret.3 // 12327
D=A // 12328
@CALL // 12329
0;JMP // 12330
(Output.printInt.ret.3)
@SP // 12331
M=M-1 // 12332

////PushInstruction("constant 0")
@SP // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=0 // 12336
@RETURN // 12337
0;JMP // 12338

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12339
M=0 // 12340

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 2"),
//        right:
//            PushInstruction("constant 22"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.println.IfElse1}}
@Output.println.EQ.6 // 12341
D=A // 12342
@SP // 12343
AM=M+1 // 12344
A=A-1 // 12345
M=D // 12346
@Output.2 // 12347
D=M // 12348
@22 // 12349
D=D-A // 12350
@DO_EQ // 12351
0;JMP // 12352
(Output.println.EQ.6)
D=!D // 12353
@Output.println.IfElse1 // 12354
D;JNE // 12355

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12356
M=0 // 12357

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12358
0;JMP // 12359

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

@Output.2 // 12360
M=M+1 // 12361

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12362
AM=M+1 // 12363
A=A-1 // 12364
M=0 // 12365
@RETURN // 12366
0;JMP // 12367

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
@Output.backSpace.EQ.7 // 12368
D=A // 12369
@SP // 12370
AM=M+1 // 12371
A=A-1 // 12372
M=D // 12373
@Output.1 // 12374
D=M // 12375
@DO_EQ // 12376
0;JMP // 12377
(Output.backSpace.EQ.7)
D=!D // 12378
@Output.backSpace.IfElse1 // 12379
D;JNE // 12380

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

@Output.2 // 12381
M=M-1 // 12382

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12383
D=A // 12384
@Output.1 // 12385
M=D // 12386

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12387
0;JMP // 12388

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

@Output.1 // 12389
M=M-1 // 12390

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12391
AM=M+1 // 12392
A=A-1 // 12393
M=0 // 12394
@RETURN // 12395
0;JMP // 12396

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12397
M=-1 // 12398

////PushInstruction("constant 0")
@SP // 12399
AM=M+1 // 12400
A=A-1 // 12401
M=0 // 12402
@RETURN // 12403
0;JMP // 12404

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12405
A=M // 12406
D=M // 12407
@Screen.0 // 12408
M=D // 12409

////PushInstruction("constant 0")
@SP // 12410
AM=M+1 // 12411
A=A-1 // 12412
M=0 // 12413
@RETURN // 12414
0;JMP // 12415

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12416
M=M+1 // 12417
AM=M+1 // 12418
A=A-1 // 12419
M=0 // 12420
A=A-1 // 12421
M=0 // 12422

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

@ARG // 12423
A=M+1 // 12424
D=M // 12425
@SP // 12426
AM=M+1 // 12427
A=A-1 // 12428
M=D // 12429
@32 // 12430
D=A // 12431
@SP // 12432
AM=M+1 // 12433
A=A-1 // 12434
M=D // 12435
// call Math.multiply
@7 // 12436
D=A // 12437
@14 // 12438
M=D // 12439
@Math.multiply // 12440
D=A // 12441
@13 // 12442
M=D // 12443
@Screen.drawPixel.ret.0 // 12444
D=A // 12445
@CALL // 12446
0;JMP // 12447
(Screen.drawPixel.ret.0)
@ARG // 12448
A=M // 12449
D=M // 12450
@SP // 12451
AM=M+1 // 12452
A=A-1 // 12453
M=D // 12454
@16 // 12455
D=A // 12456
@SP // 12457
AM=M+1 // 12458
A=A-1 // 12459
M=D // 12460
// call Math.divide
@7 // 12461
D=A // 12462
@14 // 12463
M=D // 12464
@Math.divide // 12465
D=A // 12466
@13 // 12467
M=D // 12468
@Screen.drawPixel.ret.1 // 12469
D=A // 12470
@CALL // 12471
0;JMP // 12472
(Screen.drawPixel.ret.1)
@SP // 12473
AM=M-1 // 12474
D=M // 12475
@SP // 12476
AM=M-1 // 12477
D=D+M // 12478
@16384 // 12479
D=D+A // 12480
@LCL // 12481
A=M // 12482
M=D // 12483

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

@ARG // 12484
A=M // 12485
D=M // 12486
@15 // 12487
D=D&A // 12488
@LCL // 12489
A=M+1 // 12490
M=D // 12491

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawPixel.IfElse1}}
@Screen.drawPixel.EQ.0 // 12492
D=A // 12493
@SP // 12494
AM=M+1 // 12495
A=A-1 // 12496
M=D // 12497
@Screen.0 // 12498
D=M // 12499
@DO_EQ // 12500
0;JMP // 12501
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12502
D;JNE // 12503

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
@LCL // 12504
A=M // 12505
D=M // 12506
@SP // 12507
AM=M+1 // 12508
A=A-1 // 12509
M=D // 12510
@LCL // 12511
A=M // 12512
D=M // 12513
@0 // 12514
A=D+A // 12515
D=M // 12516
@SP // 12517
AM=M+1 // 12518
A=A-1 // 12519
M=D // 12520
@LCL // 12521
A=M+1 // 12522
D=M // 12523
@SP // 12524
AM=M+1 // 12525
A=A-1 // 12526
M=D // 12527
// call Math.twoToThe
@6 // 12528
D=A // 12529
@14 // 12530
M=D // 12531
@Math.twoToThe // 12532
D=A // 12533
@13 // 12534
M=D // 12535
@Screen.drawPixel.ret.2 // 12536
D=A // 12537
@CALL // 12538
0;JMP // 12539
(Screen.drawPixel.ret.2)
@SP // 12540
AM=M-1 // 12541
D=M // 12542
@SP // 12543
AM=M-1 // 12544
D=D|M // 12545
@SP // 12546
AM=M-1 // 12547
A=M // 12548
M=D // 12549

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12550
0;JMP // 12551

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
@LCL // 12552
A=M // 12553
D=M // 12554
@SP // 12555
AM=M+1 // 12556
A=A-1 // 12557
M=D // 12558
@LCL // 12559
A=M // 12560
D=M // 12561
@0 // 12562
A=D+A // 12563
D=M // 12564
@SP // 12565
AM=M+1 // 12566
A=A-1 // 12567
M=D // 12568
@LCL // 12569
A=M+1 // 12570
D=M // 12571
@SP // 12572
AM=M+1 // 12573
A=A-1 // 12574
M=D // 12575
// call Math.twoToThe
@6 // 12576
D=A // 12577
@14 // 12578
M=D // 12579
@Math.twoToThe // 12580
D=A // 12581
@13 // 12582
M=D // 12583
@Screen.drawPixel.ret.3 // 12584
D=A // 12585
@CALL // 12586
0;JMP // 12587
(Screen.drawPixel.ret.3)
@SP // 12588
AM=M-1 // 12589
D=M // 12590
D=!D // 12591
@SP // 12592
AM=M-1 // 12593
D=D&M // 12594
@SP // 12595
AM=M-1 // 12596
A=M // 12597
M=D // 12598

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12599
AM=M+1 // 12600
A=A-1 // 12601
M=0 // 12602
@RETURN // 12603
0;JMP // 12604

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12605
D=A // 12606
@SP // 12607
AM=D+M // 12608
A=A-1 // 12609
M=0 // 12610
A=A-1 // 12611
M=0 // 12612
A=A-1 // 12613
M=0 // 12614
A=A-1 // 12615
M=0 // 12616
A=A-1 // 12617
M=0 // 12618
A=A-1 // 12619
M=0 // 12620

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

@ARG // 12621
A=M+1 // 12622
A=A+1 // 12623
D=M // 12624
A=A-1 // 12625
A=A-1 // 12626
D=D-M // 12627
@SP // 12628
AM=M+1 // 12629
A=A-1 // 12630
M=D // 12631
// call Math.abs
@6 // 12632
D=A // 12633
@14 // 12634
M=D // 12635
@Math.abs // 12636
D=A // 12637
@13 // 12638
M=D // 12639
@Screen.drawLine.ret.0 // 12640
D=A // 12641
@CALL // 12642
0;JMP // 12643
(Screen.drawLine.ret.0)
@SP // 12644
AM=M-1 // 12645
D=M // 12646
@LCL // 12647
A=M // 12648
M=D // 12649

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

@ARG // 12650
A=M+1 // 12651
A=A+1 // 12652
A=A+1 // 12653
D=M // 12654
A=A-1 // 12655
A=A-1 // 12656
D=D-M // 12657
@SP // 12658
AM=M+1 // 12659
A=A-1 // 12660
M=D // 12661
// call Math.abs
@6 // 12662
D=A // 12663
@14 // 12664
M=D // 12665
@Math.abs // 12666
D=A // 12667
@13 // 12668
M=D // 12669
@Screen.drawLine.ret.1 // 12670
D=A // 12671
@CALL // 12672
0;JMP // 12673
(Screen.drawLine.ret.1)
@SP // 12674
AM=M-1 // 12675
D=M // 12676
@LCL // 12677
A=M+1 // 12678
M=D // 12679

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse1}}
@Screen.drawLine.LT.1 // 12680
D=A // 12681
@SP // 12682
AM=M+1 // 12683
A=A-1 // 12684
M=D // 12685
@ARG // 12686
A=M+1 // 12687
A=A+1 // 12688
D=M // 12689
A=A-1 // 12690
A=A-1 // 12691
D=M-D // 12692
@DO_LT // 12693
0;JMP // 12694
(Screen.drawLine.LT.1)
D=!D // 12695
@Screen.drawLine.IfElse1 // 12696
D;JNE // 12697

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12698
A=M+1 // 12699
A=A+1 // 12700
M=1 // 12701

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 12702
0;JMP // 12703

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12704
A=M+1 // 12705
A=A+1 // 12706
M=-1 // 12707

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
@Screen.drawLine.LT.2 // 12708
D=A // 12709
@SP // 12710
AM=M+1 // 12711
A=A-1 // 12712
M=D // 12713
@ARG // 12714
A=M+1 // 12715
A=A+1 // 12716
A=A+1 // 12717
D=M // 12718
A=A-1 // 12719
A=A-1 // 12720
D=M-D // 12721
@DO_LT // 12722
0;JMP // 12723
(Screen.drawLine.LT.2)
D=!D // 12724
@Screen.drawLine.IfElse2 // 12725
D;JNE // 12726

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12727
A=M+1 // 12728
A=A+1 // 12729
A=A+1 // 12730
M=1 // 12731

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 12732
0;JMP // 12733

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12734
A=M+1 // 12735
A=A+1 // 12736
A=A+1 // 12737
M=-1 // 12738

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

@LCL // 12739
A=M+1 // 12740
D=M // 12741
A=A-1 // 12742
D=M-D // 12743
@SP // 12744
AM=M+1 // 12745
A=A-1 // 12746
M=D // 12747
@LCL // 12748
D=M // 12749
@4 // 12750
A=D+A // 12751
D=A // 12752
@R13 // 12753
M=D // 12754
@SP // 12755
AM=M-1 // 12756
D=M // 12757
@R13 // 12758
A=M // 12759
M=D // 12760

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0 // 12761
@WHILE_END_Screen.drawLine1 // 12762
D;JNE // 12763

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12764
A=M // 12765
D=M // 12766
@SP // 12767
AM=M+1 // 12768
A=A-1 // 12769
M=D // 12770
@ARG // 12771
A=M+1 // 12772
D=M // 12773
@SP // 12774
AM=M+1 // 12775
A=A-1 // 12776
M=D // 12777
// call Screen.drawPixel
@7 // 12778
D=A // 12779
@14 // 12780
M=D // 12781
@Screen.drawPixel // 12782
D=A // 12783
@13 // 12784
M=D // 12785
@Screen.drawLine.ret.2 // 12786
D=A // 12787
@CALL // 12788
0;JMP // 12789
(Screen.drawLine.ret.2)
@SP // 12790
M=M-1 // 12791

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
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse3}}
@Screen.drawLine.EQ.3 // 12792
D=A // 12793
@SP // 12794
AM=M+1 // 12795
A=A-1 // 12796
M=D // 12797
@ARG // 12798
A=M+1 // 12799
A=A+1 // 12800
D=M // 12801
A=A-1 // 12802
A=A-1 // 12803
D=M-D // 12804
@DO_EQ // 12805
0;JMP // 12806
(Screen.drawLine.EQ.3)
@SP // 12807
AM=M+1 // 12808
A=A-1 // 12809
M=D // 12810
@Screen.drawLine.EQ.4 // 12811
D=A // 12812
@SP // 12813
AM=M+1 // 12814
A=A-1 // 12815
M=D // 12816
@ARG // 12817
A=M+1 // 12818
A=A+1 // 12819
A=A+1 // 12820
D=M // 12821
A=A-1 // 12822
A=A-1 // 12823
D=M-D // 12824
@DO_EQ // 12825
0;JMP // 12826
(Screen.drawLine.EQ.4)
@SP // 12827
AM=M-1 // 12828
D=D&M // 12829
D=!D // 12830
@Screen.drawLine.IfElse3 // 12831
D;JNE // 12832

////PushInstruction("constant 0")
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=0 // 12836
@RETURN // 12837
0;JMP // 12838

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 12839
0;JMP // 12840

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

@LCL // 12841
D=M // 12842
@4 // 12843
A=D+A // 12844
D=M // 12845
D=D+M // 12846
@SP // 12847
AM=M+1 // 12848
A=A-1 // 12849
M=D // 12850
@LCL // 12851
D=M // 12852
@5 // 12853
A=D+A // 12854
D=A // 12855
@R13 // 12856
M=D // 12857
@SP // 12858
AM=M-1 // 12859
D=M // 12860
@R13 // 12861
A=M // 12862
M=D // 12863

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
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse4}}
@Screen.drawLine.GT.5 // 12864
D=A // 12865
@SP // 12866
AM=M+1 // 12867
A=A-1 // 12868
M=D // 12869
@LCL // 12870
D=M // 12871
@5 // 12872
A=D+A // 12873
D=M // 12874
@SP // 12875
AM=M+1 // 12876
A=A-1 // 12877
M=D // 12878
@LCL // 12879
A=M+1 // 12880
D=M // 12881
@SP // 12882
AM=M-1 // 12883
D=D+M // 12884
@DO_GT // 12885
0;JMP // 12886
(Screen.drawLine.GT.5)
D=!D // 12887
@Screen.drawLine.IfElse4 // 12888
D;JNE // 12889

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

@LCL // 12890
D=M // 12891
@4 // 12892
A=D+A // 12893
D=M // 12894
A=A-1 // 12895
A=A-1 // 12896
A=A-1 // 12897
D=D-M // 12898
@SP // 12899
AM=M+1 // 12900
A=A-1 // 12901
M=D // 12902
@LCL // 12903
D=M // 12904
@4 // 12905
A=D+A // 12906
D=A // 12907
@R13 // 12908
M=D // 12909
@SP // 12910
AM=M-1 // 12911
D=M // 12912
@R13 // 12913
A=M // 12914
M=D // 12915

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

@LCL // 12916
A=M+1 // 12917
A=A+1 // 12918
D=M // 12919
@ARG // 12920
A=M // 12921
M=D+M // 12922

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 12923
0;JMP // 12924

////LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)

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
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse5}}
@Screen.drawLine.LT.6 // 12925
D=A // 12926
@SP // 12927
AM=M+1 // 12928
A=A-1 // 12929
M=D // 12930
@LCL // 12931
D=M // 12932
@5 // 12933
A=D+A // 12934
D=M // 12935
@SP // 12936
AM=M+1 // 12937
A=A-1 // 12938
M=D // 12939
@LCL // 12940
A=M // 12941
D=M // 12942
@SP // 12943
AM=M-1 // 12944
D=M-D // 12945
@DO_LT // 12946
0;JMP // 12947
(Screen.drawLine.LT.6)
D=!D // 12948
@Screen.drawLine.IfElse5 // 12949
D;JNE // 12950

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

@LCL // 12951
D=M // 12952
@4 // 12953
A=D+A // 12954
D=M // 12955
@SP // 12956
AM=M+1 // 12957
A=A-1 // 12958
M=D // 12959
@LCL // 12960
A=M // 12961
D=M // 12962
@SP // 12963
AM=M-1 // 12964
D=D+M // 12965
@SP // 12966
AM=M+1 // 12967
A=A-1 // 12968
M=D // 12969
@LCL // 12970
D=M // 12971
@4 // 12972
A=D+A // 12973
D=A // 12974
@R13 // 12975
M=D // 12976
@SP // 12977
AM=M-1 // 12978
D=M // 12979
@R13 // 12980
A=M // 12981
M=D // 12982

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

@LCL // 12983
A=M+1 // 12984
A=A+1 // 12985
A=A+1 // 12986
D=M // 12987
@ARG // 12988
A=M+1 // 12989
M=D+M // 12990

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 12991
0;JMP // 12992

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 12993
0;JMP // 12994

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 12995
AM=M+1 // 12996
A=A-1 // 12997
M=0 // 12998
@RETURN // 12999
0;JMP // 13000

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 13001
AM=M+1 // 13002
A=A-1 // 13003
M=0 // 13004

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13005
A=M // 13006
D=M // 13007
@LCL // 13008
A=M // 13009
M=D // 13010

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
@Screen.drawHorizontalLine.GT.7 // 13011
D=A // 13012
@SP // 13013
AM=M+1 // 13014
A=A-1 // 13015
M=D // 13016
@LCL // 13017
A=M // 13018
D=M // 13019
@SP // 13020
AM=M+1 // 13021
A=A-1 // 13022
M=D // 13023
@ARG // 13024
A=M+1 // 13025
D=M // 13026
@SP // 13027
AM=M-1 // 13028
D=M-D // 13029
@DO_GT // 13030
0;JMP // 13031
(Screen.drawHorizontalLine.GT.7)
@WHILE_END_Screen.drawHorizontalLine1 // 13032
D;JNE // 13033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13034
A=M // 13035
D=M // 13036
@SP // 13037
AM=M+1 // 13038
A=A-1 // 13039
M=D // 13040
@ARG // 13041
A=M+1 // 13042
A=A+1 // 13043
D=M // 13044
@SP // 13045
AM=M+1 // 13046
A=A-1 // 13047
M=D // 13048
// call Screen.drawPixel
@7 // 13049
D=A // 13050
@14 // 13051
M=D // 13052
@Screen.drawPixel // 13053
D=A // 13054
@13 // 13055
M=D // 13056
@Screen.drawHorizontalLine.ret.0 // 13057
D=A // 13058
@CALL // 13059
0;JMP // 13060
(Screen.drawHorizontalLine.ret.0)
@SP // 13061
M=M-1 // 13062

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

@LCL // 13063
A=M // 13064
M=M+1 // 13065

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 13066
0;JMP // 13067

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 13068
AM=M+1 // 13069
A=A-1 // 13070
M=0 // 13071
@RETURN // 13072
0;JMP // 13073

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13074
D=A // 13075
@SP // 13076
AM=D+M // 13077
A=A-1 // 13078
M=0 // 13079
A=A-1 // 13080
M=0 // 13081
A=A-1 // 13082
M=0 // 13083
A=A-1 // 13084
M=0 // 13085
A=A-1 // 13086
M=0 // 13087

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13088
A=M // 13089
M=0 // 13090

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13091
A=M+1 // 13092
A=A+1 // 13093
D=M // 13094
@LCL // 13095
A=M+1 // 13096
M=D // 13097

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

@ARG // 13098
A=M+1 // 13099
A=A+1 // 13100
D=M // 13101
D=D-1 // 13102
D=-D // 13103
@LCL // 13104
A=M+1 // 13105
A=A+1 // 13106
M=D // 13107

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
@Screen.drawCircle.GT.8 // 13108
D=A // 13109
@SP // 13110
AM=M+1 // 13111
A=A-1 // 13112
M=D // 13113
@LCL // 13114
A=M+1 // 13115
D=M // 13116
A=A-1 // 13117
D=M-D // 13118
@DO_GT // 13119
0;JMP // 13120
(Screen.drawCircle.GT.8)
@WHILE_END_Screen.drawCircle1 // 13121
D;JNE // 13122

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

@ARG // 13123
A=M // 13124
D=M // 13125
@SP // 13126
AM=M+1 // 13127
A=A-1 // 13128
M=D // 13129
@LCL // 13130
A=M // 13131
D=M // 13132
@SP // 13133
AM=M-1 // 13134
D=M-D // 13135
@SP // 13136
AM=M+1 // 13137
A=A-1 // 13138
M=D // 13139
@ARG // 13140
A=M // 13141
D=M // 13142
@SP // 13143
AM=M+1 // 13144
A=A-1 // 13145
M=D // 13146
@LCL // 13147
A=M // 13148
D=M // 13149
@SP // 13150
AM=M-1 // 13151
D=D+M // 13152
@SP // 13153
AM=M+1 // 13154
A=A-1 // 13155
M=D // 13156
@ARG // 13157
A=M+1 // 13158
D=M // 13159
@SP // 13160
AM=M+1 // 13161
A=A-1 // 13162
M=D // 13163
@LCL // 13164
A=M+1 // 13165
D=M // 13166
@SP // 13167
AM=M-1 // 13168
D=D+M // 13169
@SP // 13170
AM=M+1 // 13171
A=A-1 // 13172
M=D // 13173
// call Screen.drawHorizontalLine
@8 // 13174
D=A // 13175
@14 // 13176
M=D // 13177
@Screen.drawHorizontalLine // 13178
D=A // 13179
@13 // 13180
M=D // 13181
@Screen.drawCircle.ret.0 // 13182
D=A // 13183
@CALL // 13184
0;JMP // 13185
(Screen.drawCircle.ret.0)
@SP // 13186
M=M-1 // 13187

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

@ARG // 13188
A=M // 13189
D=M // 13190
@SP // 13191
AM=M+1 // 13192
A=A-1 // 13193
M=D // 13194
@LCL // 13195
A=M // 13196
D=M // 13197
@SP // 13198
AM=M-1 // 13199
D=M-D // 13200
@SP // 13201
AM=M+1 // 13202
A=A-1 // 13203
M=D // 13204
@ARG // 13205
A=M // 13206
D=M // 13207
@SP // 13208
AM=M+1 // 13209
A=A-1 // 13210
M=D // 13211
@LCL // 13212
A=M // 13213
D=M // 13214
@SP // 13215
AM=M-1 // 13216
D=D+M // 13217
@SP // 13218
AM=M+1 // 13219
A=A-1 // 13220
M=D // 13221
@ARG // 13222
A=M+1 // 13223
D=M // 13224
@SP // 13225
AM=M+1 // 13226
A=A-1 // 13227
M=D // 13228
@LCL // 13229
A=M+1 // 13230
D=M // 13231
@SP // 13232
AM=M-1 // 13233
D=M-D // 13234
@SP // 13235
AM=M+1 // 13236
A=A-1 // 13237
M=D // 13238
// call Screen.drawHorizontalLine
@8 // 13239
D=A // 13240
@14 // 13241
M=D // 13242
@Screen.drawHorizontalLine // 13243
D=A // 13244
@13 // 13245
M=D // 13246
@Screen.drawCircle.ret.1 // 13247
D=A // 13248
@CALL // 13249
0;JMP // 13250
(Screen.drawCircle.ret.1)
@SP // 13251
M=M-1 // 13252

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

@ARG // 13253
A=M // 13254
D=M // 13255
@SP // 13256
AM=M+1 // 13257
A=A-1 // 13258
M=D // 13259
@LCL // 13260
A=M+1 // 13261
D=M // 13262
@SP // 13263
AM=M-1 // 13264
D=M-D // 13265
@SP // 13266
AM=M+1 // 13267
A=A-1 // 13268
M=D // 13269
@ARG // 13270
A=M // 13271
D=M // 13272
@SP // 13273
AM=M+1 // 13274
A=A-1 // 13275
M=D // 13276
@LCL // 13277
A=M+1 // 13278
D=M // 13279
@SP // 13280
AM=M-1 // 13281
D=D+M // 13282
@SP // 13283
AM=M+1 // 13284
A=A-1 // 13285
M=D // 13286
@ARG // 13287
A=M+1 // 13288
D=M // 13289
@SP // 13290
AM=M+1 // 13291
A=A-1 // 13292
M=D // 13293
@LCL // 13294
A=M // 13295
D=M // 13296
@SP // 13297
AM=M-1 // 13298
D=D+M // 13299
@SP // 13300
AM=M+1 // 13301
A=A-1 // 13302
M=D // 13303
// call Screen.drawHorizontalLine
@8 // 13304
D=A // 13305
@14 // 13306
M=D // 13307
@Screen.drawHorizontalLine // 13308
D=A // 13309
@13 // 13310
M=D // 13311
@Screen.drawCircle.ret.2 // 13312
D=A // 13313
@CALL // 13314
0;JMP // 13315
(Screen.drawCircle.ret.2)
@SP // 13316
M=M-1 // 13317

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

@ARG // 13318
A=M // 13319
D=M // 13320
@SP // 13321
AM=M+1 // 13322
A=A-1 // 13323
M=D // 13324
@LCL // 13325
A=M+1 // 13326
D=M // 13327
@SP // 13328
AM=M-1 // 13329
D=M-D // 13330
@SP // 13331
AM=M+1 // 13332
A=A-1 // 13333
M=D // 13334
@ARG // 13335
A=M // 13336
D=M // 13337
@SP // 13338
AM=M+1 // 13339
A=A-1 // 13340
M=D // 13341
@LCL // 13342
A=M+1 // 13343
D=M // 13344
@SP // 13345
AM=M-1 // 13346
D=D+M // 13347
@SP // 13348
AM=M+1 // 13349
A=A-1 // 13350
M=D // 13351
@ARG // 13352
A=M+1 // 13353
D=M // 13354
@SP // 13355
AM=M+1 // 13356
A=A-1 // 13357
M=D // 13358
@LCL // 13359
A=M // 13360
D=M // 13361
@SP // 13362
AM=M-1 // 13363
D=M-D // 13364
@SP // 13365
AM=M+1 // 13366
A=A-1 // 13367
M=D // 13368
// call Screen.drawHorizontalLine
@8 // 13369
D=A // 13370
@14 // 13371
M=D // 13372
@Screen.drawHorizontalLine // 13373
D=A // 13374
@13 // 13375
M=D // 13376
@Screen.drawCircle.ret.3 // 13377
D=A // 13378
@CALL // 13379
0;JMP // 13380
(Screen.drawCircle.ret.3)
@SP // 13381
M=M-1 // 13382

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawCircle.IfElse1}}
@Screen.drawCircle.LT.9 // 13383
D=A // 13384
@SP // 13385
AM=M+1 // 13386
A=A-1 // 13387
M=D // 13388
@LCL // 13389
A=M+1 // 13390
A=A+1 // 13391
D=M // 13392
@DO_LT // 13393
0;JMP // 13394
(Screen.drawCircle.LT.9)
D=!D // 13395
@Screen.drawCircle.IfElse1 // 13396
D;JNE // 13397

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

@LCL // 13398
A=M+1 // 13399
A=A+1 // 13400
D=M // 13401
@SP // 13402
AM=M+1 // 13403
A=A-1 // 13404
M=D // 13405
@LCL // 13406
A=M // 13407
D=M // 13408
D=D+M // 13409
@SP // 13410
AM=M-1 // 13411
D=D+M // 13412
@3 // 13413
D=D+A // 13414
@LCL // 13415
A=M+1 // 13416
A=A+1 // 13417
M=D // 13418

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13419
0;JMP // 13420

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

@LCL // 13421
A=M+1 // 13422
A=A+1 // 13423
D=M // 13424
@SP // 13425
AM=M+1 // 13426
A=A-1 // 13427
M=D // 13428
@LCL // 13429
A=M+1 // 13430
D=M // 13431
A=A-1 // 13432
D=M-D // 13433
@R13 // 13434
M=D // 13435
D=D+M // 13436
@SP // 13437
AM=M-1 // 13438
D=D+M // 13439
@5 // 13440
D=D+A // 13441
@LCL // 13442
A=M+1 // 13443
A=A+1 // 13444
M=D // 13445

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

@LCL // 13446
A=M+1 // 13447
M=M-1 // 13448

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

@LCL // 13449
A=M // 13450
M=M+1 // 13451

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13452
0;JMP // 13453

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13454
AM=M+1 // 13455
A=A-1 // 13456
M=0 // 13457
@RETURN // 13458
0;JMP // 13459

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13460
D=A // 13461
@SP // 13462
AM=D+M // 13463
A=A-1 // 13464
M=0 // 13465
A=A-1 // 13466
M=0 // 13467
A=A-1 // 13468
M=0 // 13469
A=A-1 // 13470
M=0 // 13471
A=A-1 // 13472
M=0 // 13473
A=A-1 // 13474
M=0 // 13475
A=A-1 // 13476
M=0 // 13477
A=A-1 // 13478
M=0 // 13479
A=A-1 // 13480
M=0 // 13481
A=A-1 // 13482
M=0 // 13483

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13484
D=M // 13485
@9 // 13486
A=D+A // 13487
M=-1 // 13488

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.0 // 13489
D=M // 13490
@Screen.drawRectangle.IfElse1 // 13491
D;JNE // 13492

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13493
D=M // 13494
@9 // 13495
A=D+A // 13496
M=0 // 13497

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 13498
0;JMP // 13499

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

@ARG // 13500
A=M+1 // 13501
D=M // 13502
@LCL // 13503
A=M // 13504
M=D // 13505

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
@Screen.drawRectangle.GT.10 // 13506
D=A // 13507
@SP // 13508
AM=M+1 // 13509
A=A-1 // 13510
M=D // 13511
@LCL // 13512
A=M // 13513
D=M // 13514
@SP // 13515
AM=M+1 // 13516
A=A-1 // 13517
M=D // 13518
@ARG // 13519
A=M+1 // 13520
A=A+1 // 13521
A=A+1 // 13522
D=M // 13523
@SP // 13524
AM=M-1 // 13525
D=M-D // 13526
@DO_GT // 13527
0;JMP // 13528
(Screen.drawRectangle.GT.10)
@WHILE_END_Screen.drawRectangle1 // 13529
D;JNE // 13530

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13531
A=M // 13532
D=M // 13533
@SP // 13534
AM=M+1 // 13535
A=A-1 // 13536
M=D // 13537
@16 // 13538
D=A // 13539
@SP // 13540
AM=M+1 // 13541
A=A-1 // 13542
M=D // 13543
// call Math.divide
@7 // 13544
D=A // 13545
@14 // 13546
M=D // 13547
@Math.divide // 13548
D=A // 13549
@13 // 13550
M=D // 13551
@Screen.drawRectangle.ret.0 // 13552
D=A // 13553
@CALL // 13554
0;JMP // 13555
(Screen.drawRectangle.ret.0)
@SP // 13556
AM=M-1 // 13557
D=M // 13558
@LCL // 13559
A=M+1 // 13560
M=D // 13561

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13562
A=M+1 // 13563
A=A+1 // 13564
D=M // 13565
@SP // 13566
AM=M+1 // 13567
A=A-1 // 13568
M=D // 13569
@16 // 13570
D=A // 13571
@SP // 13572
AM=M+1 // 13573
A=A-1 // 13574
M=D // 13575
// call Math.divide
@7 // 13576
D=A // 13577
@14 // 13578
M=D // 13579
@Math.divide // 13580
D=A // 13581
@13 // 13582
M=D // 13583
@Screen.drawRectangle.ret.1 // 13584
D=A // 13585
@CALL // 13586
0;JMP // 13587
(Screen.drawRectangle.ret.1)
@SP // 13588
AM=M-1 // 13589
D=M // 13590
@LCL // 13591
A=M+1 // 13592
A=A+1 // 13593
M=D // 13594

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

@ARG // 13595
A=M // 13596
D=M // 13597
@15 // 13598
D=D&A // 13599
@LCL // 13600
A=M+1 // 13601
A=A+1 // 13602
A=A+1 // 13603
M=D // 13604

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

@ARG // 13605
A=M+1 // 13606
A=A+1 // 13607
D=M // 13608
@15 // 13609
D=D&A // 13610
@SP // 13611
AM=M+1 // 13612
A=A-1 // 13613
M=D // 13614
@LCL // 13615
D=M // 13616
@4 // 13617
A=D+A // 13618
D=A // 13619
@R13 // 13620
M=D // 13621
@SP // 13622
AM=M-1 // 13623
D=M // 13624
@R13 // 13625
A=M // 13626
M=D // 13627

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13628
A=M // 13629
D=M // 13630
@SP // 13631
AM=M+1 // 13632
A=A-1 // 13633
M=D // 13634
@32 // 13635
D=A // 13636
@SP // 13637
AM=M+1 // 13638
A=A-1 // 13639
M=D // 13640
// call Math.multiply
@7 // 13641
D=A // 13642
@14 // 13643
M=D // 13644
@Math.multiply // 13645
D=A // 13646
@13 // 13647
M=D // 13648
@Screen.drawRectangle.ret.2 // 13649
D=A // 13650
@CALL // 13651
0;JMP // 13652
(Screen.drawRectangle.ret.2)
@LCL // 13653
D=M // 13654
@5 // 13655
A=D+A // 13656
D=A // 13657
@R13 // 13658
M=D // 13659
@SP // 13660
AM=M-1 // 13661
D=M // 13662
@R13 // 13663
A=M // 13664
M=D // 13665

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse2}}
@Screen.drawRectangle.EQ.11 // 13666
D=A // 13667
@SP // 13668
AM=M+1 // 13669
A=A-1 // 13670
M=D // 13671
@LCL // 13672
A=M+1 // 13673
A=A+1 // 13674
D=M // 13675
A=A-1 // 13676
D=M-D // 13677
@DO_EQ // 13678
0;JMP // 13679
(Screen.drawRectangle.EQ.11)
D=!D // 13680
@Screen.drawRectangle.IfElse2 // 13681
D;JNE // 13682

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

@LCL // 13683
D=M // 13684
@4 // 13685
A=D+A // 13686
D=M // 13687
@SP // 13688
AM=M+1 // 13689
A=A-1 // 13690
M=D+1 // 13691
// call Math.twoToThe
@6 // 13692
D=A // 13693
@14 // 13694
M=D // 13695
@Math.twoToThe // 13696
D=A // 13697
@13 // 13698
M=D // 13699
@Screen.drawRectangle.ret.3 // 13700
D=A // 13701
@CALL // 13702
0;JMP // 13703
(Screen.drawRectangle.ret.3)
@SP // 13704
AM=M-1 // 13705
D=M // 13706
D=D-1 // 13707
@SP // 13708
AM=M+1 // 13709
A=A-1 // 13710
M=D // 13711
@LCL // 13712
A=M+1 // 13713
A=A+1 // 13714
A=A+1 // 13715
D=M // 13716
@SP // 13717
AM=M+1 // 13718
A=A-1 // 13719
M=D // 13720
// call Math.twoToThe
@6 // 13721
D=A // 13722
@14 // 13723
M=D // 13724
@Math.twoToThe // 13725
D=A // 13726
@13 // 13727
M=D // 13728
@Screen.drawRectangle.ret.4 // 13729
D=A // 13730
@CALL // 13731
0;JMP // 13732
(Screen.drawRectangle.ret.4)
@SP // 13733
AM=M-1 // 13734
D=M // 13735
D=D-1 // 13736
@SP // 13737
AM=M-1 // 13738
D=M-D // 13739
@SP // 13740
AM=M+1 // 13741
A=A-1 // 13742
M=D // 13743
@LCL // 13744
D=M // 13745
@6 // 13746
A=D+A // 13747
D=A // 13748
@R13 // 13749
M=D // 13750
@SP // 13751
AM=M-1 // 13752
D=M // 13753
@R13 // 13754
A=M // 13755
M=D // 13756

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

@LCL // 13757
D=M // 13758
@5 // 13759
A=D+A // 13760
D=M // 13761
@SP // 13762
AM=M+1 // 13763
A=A-1 // 13764
M=D // 13765
@LCL // 13766
A=M+1 // 13767
D=M // 13768
@SP // 13769
AM=M-1 // 13770
D=D+M // 13771
@SP // 13772
AM=M+1 // 13773
A=A-1 // 13774
M=D // 13775
@LCL // 13776
D=M // 13777
@7 // 13778
A=D+A // 13779
D=A // 13780
@R13 // 13781
M=D // 13782
@SP // 13783
AM=M-1 // 13784
D=M // 13785
@R13 // 13786
A=M // 13787
M=D // 13788

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0 // 13789
D=!M // 13790
@Screen.drawRectangle.IfElse3 // 13791
D;JNE // 13792

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
@LCL // 13793
D=M // 13794
@7 // 13795
A=D+A // 13796
D=M // 13797
@16384 // 13798
D=D+A // 13799
@SP // 13800
AM=M+1 // 13801
A=A-1 // 13802
M=D // 13803
@LCL // 13804
D=M // 13805
@7 // 13806
A=D+A // 13807
D=M // 13808
@16384 // 13809
A=D+A // 13810
D=M // 13811
@SP // 13812
AM=M+1 // 13813
A=A-1 // 13814
M=D // 13815
@LCL // 13816
D=M // 13817
@6 // 13818
A=D+A // 13819
D=M // 13820
@SP // 13821
AM=M-1 // 13822
D=D|M // 13823
@SP // 13824
AM=M-1 // 13825
A=M // 13826
M=D // 13827

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 13828
0;JMP // 13829

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
@LCL // 13830
D=M // 13831
@7 // 13832
A=D+A // 13833
D=M // 13834
@16384 // 13835
D=D+A // 13836
@SP // 13837
AM=M+1 // 13838
A=A-1 // 13839
M=D // 13840
@LCL // 13841
D=M // 13842
@7 // 13843
A=D+A // 13844
D=M // 13845
@16384 // 13846
A=D+A // 13847
D=M // 13848
@SP // 13849
AM=M+1 // 13850
A=A-1 // 13851
M=D // 13852
@LCL // 13853
D=M // 13854
@6 // 13855
A=D+A // 13856
D=!M // 13857
@SP // 13858
AM=M-1 // 13859
D=D&M // 13860
@SP // 13861
AM=M-1 // 13862
A=M // 13863
M=D // 13864

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 13865
0;JMP // 13866

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

@LCL // 13867
A=M+1 // 13868
A=A+1 // 13869
A=A+1 // 13870
D=M // 13871
@SP // 13872
AM=M+1 // 13873
A=A-1 // 13874
M=D // 13875
// call Math.twoToThe
@6 // 13876
D=A // 13877
@14 // 13878
M=D // 13879
@Math.twoToThe // 13880
D=A // 13881
@13 // 13882
M=D // 13883
@Screen.drawRectangle.ret.5 // 13884
D=A // 13885
@CALL // 13886
0;JMP // 13887
(Screen.drawRectangle.ret.5)
@SP // 13888
AM=M-1 // 13889
D=M // 13890
D=D-1 // 13891
@SP // 13892
AM=M+1 // 13893
A=A-1 // 13894
M=D // 13895
@SP // 13896
A=M-1 // 13897
M=!D // 13898
@LCL // 13899
D=M // 13900
@6 // 13901
A=D+A // 13902
D=A // 13903
@R13 // 13904
M=D // 13905
@SP // 13906
AM=M-1 // 13907
D=M // 13908
@R13 // 13909
A=M // 13910
M=D // 13911

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

@LCL // 13912
D=M // 13913
@5 // 13914
A=D+A // 13915
D=M // 13916
@SP // 13917
AM=M+1 // 13918
A=A-1 // 13919
M=D // 13920
@LCL // 13921
A=M+1 // 13922
D=M // 13923
@SP // 13924
AM=M-1 // 13925
D=D+M // 13926
@SP // 13927
AM=M+1 // 13928
A=A-1 // 13929
M=D // 13930
@LCL // 13931
D=M // 13932
@7 // 13933
A=D+A // 13934
D=A // 13935
@R13 // 13936
M=D // 13937
@SP // 13938
AM=M-1 // 13939
D=M // 13940
@R13 // 13941
A=M // 13942
M=D // 13943

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0 // 13944
D=!M // 13945
@Screen.drawRectangle.IfElse4 // 13946
D;JNE // 13947

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
@LCL // 13948
D=M // 13949
@7 // 13950
A=D+A // 13951
D=M // 13952
@16384 // 13953
D=D+A // 13954
@SP // 13955
AM=M+1 // 13956
A=A-1 // 13957
M=D // 13958
@LCL // 13959
D=M // 13960
@7 // 13961
A=D+A // 13962
D=M // 13963
@16384 // 13964
A=D+A // 13965
D=M // 13966
@SP // 13967
AM=M+1 // 13968
A=A-1 // 13969
M=D // 13970
@LCL // 13971
D=M // 13972
@6 // 13973
A=D+A // 13974
D=M // 13975
@SP // 13976
AM=M-1 // 13977
D=D|M // 13978
@SP // 13979
AM=M-1 // 13980
A=M // 13981
M=D // 13982

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 13983
0;JMP // 13984

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
@LCL // 13985
D=M // 13986
@7 // 13987
A=D+A // 13988
D=M // 13989
@16384 // 13990
D=D+A // 13991
@SP // 13992
AM=M+1 // 13993
A=A-1 // 13994
M=D // 13995
@LCL // 13996
D=M // 13997
@7 // 13998
A=D+A // 13999
D=M // 14000
@16384 // 14001
A=D+A // 14002
D=M // 14003
@SP // 14004
AM=M+1 // 14005
A=A-1 // 14006
M=D // 14007
@LCL // 14008
D=M // 14009
@6 // 14010
A=D+A // 14011
D=!M // 14012
@SP // 14013
AM=M-1 // 14014
D=D&M // 14015
@SP // 14016
AM=M-1 // 14017
A=M // 14018
M=D // 14019

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

@LCL // 14020
A=M+1 // 14021
D=M // 14022
@SP // 14023
AM=M+1 // 14024
A=A-1 // 14025
M=D+1 // 14026
@LCL // 14027
D=M // 14028
@8 // 14029
A=D+A // 14030
D=A // 14031
@R13 // 14032
M=D // 14033
@SP // 14034
AM=M-1 // 14035
D=M // 14036
@R13 // 14037
A=M // 14038
M=D // 14039

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
@Screen.drawRectangle.LT.12 // 14040
D=A // 14041
@SP // 14042
AM=M+1 // 14043
A=A-1 // 14044
M=D // 14045
@LCL // 14046
D=M // 14047
@8 // 14048
A=D+A // 14049
D=M // 14050
@SP // 14051
AM=M+1 // 14052
A=A-1 // 14053
M=D // 14054
@LCL // 14055
A=M+1 // 14056
A=A+1 // 14057
D=M // 14058
@SP // 14059
AM=M-1 // 14060
D=M-D // 14061
@DO_LT // 14062
0;JMP // 14063
(Screen.drawRectangle.LT.12)
D=!D // 14064
@WHILE_END_Screen.drawRectangle2 // 14065
D;JNE // 14066

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

@LCL // 14067
D=M // 14068
@8 // 14069
A=D+A // 14070
D=M // 14071
A=A-1 // 14072
A=A-1 // 14073
A=A-1 // 14074
D=D+M // 14075
@SP // 14076
AM=M+1 // 14077
A=A-1 // 14078
M=D // 14079
@LCL // 14080
D=M // 14081
@7 // 14082
A=D+A // 14083
D=A // 14084
@R13 // 14085
M=D // 14086
@SP // 14087
AM=M-1 // 14088
D=M // 14089
@R13 // 14090
A=M // 14091
M=D // 14092

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14093
D=M // 14094
@7 // 14095
A=D+A // 14096
D=M // 14097
@16384 // 14098
D=D+A // 14099
@SP // 14100
AM=M+1 // 14101
A=A-1 // 14102
M=D // 14103
@LCL // 14104
D=M // 14105
@9 // 14106
A=D+A // 14107
D=M // 14108
@SP // 14109
AM=M-1 // 14110
A=M // 14111
M=D // 14112

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

@LCL // 14113
D=M // 14114
@8 // 14115
A=D+A // 14116
M=M+1 // 14117

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14118
0;JMP // 14119

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

@LCL // 14120
D=M // 14121
@4 // 14122
A=D+A // 14123
D=M // 14124
@SP // 14125
AM=M+1 // 14126
A=A-1 // 14127
M=D+1 // 14128
// call Math.twoToThe
@6 // 14129
D=A // 14130
@14 // 14131
M=D // 14132
@Math.twoToThe // 14133
D=A // 14134
@13 // 14135
M=D // 14136
@Screen.drawRectangle.ret.6 // 14137
D=A // 14138
@CALL // 14139
0;JMP // 14140
(Screen.drawRectangle.ret.6)
@SP // 14141
AM=M-1 // 14142
D=M // 14143
D=D-1 // 14144
@SP // 14145
AM=M+1 // 14146
A=A-1 // 14147
M=D // 14148
@LCL // 14149
D=M // 14150
@6 // 14151
A=D+A // 14152
D=A // 14153
@R13 // 14154
M=D // 14155
@SP // 14156
AM=M-1 // 14157
D=M // 14158
@R13 // 14159
A=M // 14160
M=D // 14161

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

@LCL // 14162
D=M // 14163
@5 // 14164
A=D+A // 14165
D=M // 14166
A=A-1 // 14167
A=A-1 // 14168
A=A-1 // 14169
D=D+M // 14170
@SP // 14171
AM=M+1 // 14172
A=A-1 // 14173
M=D // 14174
@LCL // 14175
D=M // 14176
@7 // 14177
A=D+A // 14178
D=A // 14179
@R13 // 14180
M=D // 14181
@SP // 14182
AM=M-1 // 14183
D=M // 14184
@R13 // 14185
A=M // 14186
M=D // 14187

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0 // 14188
D=!M // 14189
@Screen.drawRectangle.IfElse5 // 14190
D;JNE // 14191

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
@LCL // 14192
D=M // 14193
@7 // 14194
A=D+A // 14195
D=M // 14196
@16384 // 14197
D=D+A // 14198
@SP // 14199
AM=M+1 // 14200
A=A-1 // 14201
M=D // 14202
@LCL // 14203
D=M // 14204
@7 // 14205
A=D+A // 14206
D=M // 14207
@16384 // 14208
A=D+A // 14209
D=M // 14210
@SP // 14211
AM=M+1 // 14212
A=A-1 // 14213
M=D // 14214
@LCL // 14215
D=M // 14216
@6 // 14217
A=D+A // 14218
D=M // 14219
@SP // 14220
AM=M-1 // 14221
D=D|M // 14222
@SP // 14223
AM=M-1 // 14224
A=M // 14225
M=D // 14226

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14227
0;JMP // 14228

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
@LCL // 14229
D=M // 14230
@7 // 14231
A=D+A // 14232
D=M // 14233
@16384 // 14234
D=D+A // 14235
@SP // 14236
AM=M+1 // 14237
A=A-1 // 14238
M=D // 14239
@LCL // 14240
D=M // 14241
@7 // 14242
A=D+A // 14243
D=M // 14244
@16384 // 14245
A=D+A // 14246
D=M // 14247
@SP // 14248
AM=M+1 // 14249
A=A-1 // 14250
M=D // 14251
@LCL // 14252
D=M // 14253
@6 // 14254
A=D+A // 14255
D=!M // 14256
@SP // 14257
AM=M-1 // 14258
D=D&M // 14259
@SP // 14260
AM=M-1 // 14261
A=M // 14262
M=D // 14263

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

@LCL // 14264
A=M // 14265
M=M+1 // 14266

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14267
0;JMP // 14268

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14269
AM=M+1 // 14270
A=A-1 // 14271
M=0 // 14272
@RETURN // 14273
0;JMP // 14274

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14275
AM=M+1 // 14276
A=A-1 // 14277
M=0 // 14278

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14279
A=M // 14280
M=0 // 14281

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
@Screen.clearScreen.LT.13 // 14282
D=A // 14283
@SP // 14284
AM=M+1 // 14285
A=A-1 // 14286
M=D // 14287
@LCL // 14288
A=M // 14289
D=M // 14290
@8192 // 14291
D=D-A // 14292
@DO_LT // 14293
0;JMP // 14294
(Screen.clearScreen.LT.13)
D=!D // 14295
@WHILE_END_Screen.clearScreen1 // 14296
D;JNE // 14297

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14298
A=M // 14299
D=M // 14300
@16384 // 14301
D=D+A // 14302
@SP // 14303
AM=M+1 // 14304
A=A-1 // 14305
M=D // 14306
D=0 // 14307
@SP // 14308
AM=M-1 // 14309
A=M // 14310
M=D // 14311

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

@LCL // 14312
A=M // 14313
M=M+1 // 14314

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14315
0;JMP // 14316

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14317
AM=M+1 // 14318
A=A-1 // 14319
M=0 // 14320
@RETURN // 14321
0;JMP // 14322

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14323
D=A // 14324
@SP // 14325
AM=M+1 // 14326
A=A-1 // 14327
M=D // 14328
// call Memory.alloc
@6 // 14329
D=A // 14330
@14 // 14331
M=D // 14332
@Memory.alloc // 14333
D=A // 14334
@13 // 14335
M=D // 14336
@String.new.ret.0 // 14337
D=A // 14338
@CALL // 14339
0;JMP // 14340
(String.new.ret.0)
@SP // 14341
AM=M-1 // 14342
D=M // 14343
@3 // 14344
M=D // 14345

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.new.IfElse1}}
@String.new.EQ.0 // 14346
D=A // 14347
@SP // 14348
AM=M+1 // 14349
A=A-1 // 14350
M=D // 14351
@ARG // 14352
A=M // 14353
D=M // 14354
@DO_EQ // 14355
0;JMP // 14356
(String.new.EQ.0)
D=!D // 14357
@String.new.IfElse1 // 14358
D;JNE // 14359

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14360
A=M // 14361
M=0 // 14362

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14363
0;JMP // 14364

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14365
A=M // 14366
D=M // 14367
@SP // 14368
AM=M+1 // 14369
A=A-1 // 14370
M=D // 14371
// call Array.new
@6 // 14372
D=A // 14373
@14 // 14374
M=D // 14375
@Array.new // 14376
D=A // 14377
@13 // 14378
M=D // 14379
@String.new.ret.1 // 14380
D=A // 14381
@CALL // 14382
0;JMP // 14383
(String.new.ret.1)
@SP // 14384
AM=M-1 // 14385
D=M // 14386
@THIS // 14387
A=M // 14388
M=D // 14389

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14390
A=M // 14391
D=M // 14392
@THIS // 14393
A=M+1 // 14394
A=A+1 // 14395
M=D // 14396

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14397
A=M+1 // 14398
M=0 // 14399

////PushInstruction("pointer 0")
@3 // 14400
D=M // 14401
@SP // 14402
AM=M+1 // 14403
A=A-1 // 14404
M=D // 14405
@RETURN // 14406
0;JMP // 14407

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14408
A=M // 14409
D=M // 14410
@3 // 14411
M=D // 14412

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.dispose.IfElse1}}
@String.dispose.EQ.1 // 14413
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
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 14424
D;JNE // 14425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14426
A=M // 14427
D=M // 14428
@SP // 14429
AM=M+1 // 14430
A=A-1 // 14431
M=D // 14432
// call Array.dispose
@6 // 14433
D=A // 14434
@14 // 14435
M=D // 14436
@Array.dispose // 14437
D=A // 14438
@13 // 14439
M=D // 14440
@String.dispose.ret.0 // 14441
D=A // 14442
@CALL // 14443
0;JMP // 14444
(String.dispose.ret.0)
@SP // 14445
M=M-1 // 14446

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 14447
0;JMP // 14448

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14449
AM=M+1 // 14450
A=A-1 // 14451
M=0 // 14452
@RETURN // 14453
0;JMP // 14454

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14455
A=M // 14456
D=M // 14457
@3 // 14458
M=D // 14459

////PushInstruction("this 1")
@THIS // 14460
A=M+1 // 14461
D=M // 14462
@SP // 14463
AM=M+1 // 14464
A=A-1 // 14465
M=D // 14466
@RETURN // 14467
0;JMP // 14468

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14469
A=M // 14470
D=M // 14471
@3 // 14472
M=D // 14473

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
@THIS // 14474
A=M // 14475
D=M // 14476
@SP // 14477
AM=M+1 // 14478
A=A-1 // 14479
M=D // 14480
@ARG // 14481
A=M+1 // 14482
D=M // 14483
@SP // 14484
AM=M-1 // 14485
A=D+M // 14486
D=M // 14487
@SP // 14488
AM=M+1 // 14489
A=A-1 // 14490
M=D // 14491
@RETURN // 14492
0;JMP // 14493

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14494
A=M // 14495
D=M // 14496
@3 // 14497
M=D // 14498

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14499
A=M // 14500
D=M // 14501
@SP // 14502
AM=M+1 // 14503
A=A-1 // 14504
M=D // 14505
@ARG // 14506
A=M+1 // 14507
D=M // 14508
@SP // 14509
AM=M-1 // 14510
D=D+M // 14511
@SP // 14512
AM=M+1 // 14513
A=A-1 // 14514
M=D // 14515
@ARG // 14516
A=M+1 // 14517
A=A+1 // 14518
D=M // 14519
@SP // 14520
AM=M-1 // 14521
A=M // 14522
M=D // 14523

////PushInstruction("constant 0")
@SP // 14524
AM=M+1 // 14525
A=A-1 // 14526
M=0 // 14527
@RETURN // 14528
0;JMP // 14529

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14530
AM=M+1 // 14531
A=A-1 // 14532
M=0 // 14533

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14534
A=M // 14535
D=M // 14536
@3 // 14537
M=D // 14538

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 1"),
//        right:
//            PushInstruction("this 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.appendChar.IfElse1}}
@String.appendChar.EQ.2 // 14539
D=A // 14540
@SP // 14541
AM=M+1 // 14542
A=A-1 // 14543
M=D // 14544
@THIS // 14545
A=M+1 // 14546
A=A+1 // 14547
D=M // 14548
A=A-1 // 14549
D=M-D // 14550
@DO_EQ // 14551
0;JMP // 14552
(String.appendChar.EQ.2)
D=!D // 14553
@String.appendChar.IfElse1 // 14554
D;JNE // 14555

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

@THIS // 14556
A=M+1 // 14557
A=A+1 // 14558
D=M // 14559
D=D+M // 14560
@SP // 14561
AM=M+1 // 14562
A=A-1 // 14563
M=D // 14564
// call Array.new
@6 // 14565
D=A // 14566
@14 // 14567
M=D // 14568
@Array.new // 14569
D=A // 14570
@13 // 14571
M=D // 14572
@String.appendChar.ret.0 // 14573
D=A // 14574
@CALL // 14575
0;JMP // 14576
(String.appendChar.ret.0)
@SP // 14577
AM=M-1 // 14578
D=M // 14579
@LCL // 14580
A=M // 14581
M=D // 14582

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14583
A=M // 14584
D=M // 14585
@SP // 14586
AM=M+1 // 14587
A=A-1 // 14588
M=D // 14589
@LCL // 14590
A=M // 14591
D=M // 14592
@SP // 14593
AM=M+1 // 14594
A=A-1 // 14595
M=D // 14596
@THIS // 14597
A=M+1 // 14598
D=M // 14599
@SP // 14600
AM=M+1 // 14601
A=A-1 // 14602
M=D // 14603
// call Memory.copy
@8 // 14604
D=A // 14605
@14 // 14606
M=D // 14607
@Memory.copy // 14608
D=A // 14609
@13 // 14610
M=D // 14611
@String.appendChar.ret.1 // 14612
D=A // 14613
@CALL // 14614
0;JMP // 14615
(String.appendChar.ret.1)
@SP // 14616
M=M-1 // 14617

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14618
A=M // 14619
D=M // 14620
@SP // 14621
AM=M+1 // 14622
A=A-1 // 14623
M=D // 14624
// call Array.dispose
@6 // 14625
D=A // 14626
@14 // 14627
M=D // 14628
@Array.dispose // 14629
D=A // 14630
@13 // 14631
M=D // 14632
@String.appendChar.ret.2 // 14633
D=A // 14634
@CALL // 14635
0;JMP // 14636
(String.appendChar.ret.2)
@SP // 14637
M=M-1 // 14638

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

@THIS // 14639
A=M+1 // 14640
A=A+1 // 14641
D=M // 14642
@THIS // 14643
A=M+1 // 14644
A=A+1 // 14645
M=D+M // 14646

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14647
A=M // 14648
D=M // 14649
@THIS // 14650
A=M // 14651
M=D // 14652

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 14653
0;JMP // 14654

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
@THIS // 14655
A=M+1 // 14656
D=M // 14657
A=A-1 // 14658
D=D+M // 14659
@SP // 14660
AM=M+1 // 14661
A=A-1 // 14662
M=D // 14663
@ARG // 14664
A=M+1 // 14665
D=M // 14666
@SP // 14667
AM=M-1 // 14668
A=M // 14669
M=D // 14670

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

@THIS // 14671
A=M+1 // 14672
M=M+1 // 14673

////PushInstruction("pointer 0")
@3 // 14674
D=M // 14675
@SP // 14676
AM=M+1 // 14677
A=A-1 // 14678
M=D // 14679
@RETURN // 14680
0;JMP // 14681

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14682
A=M // 14683
D=M // 14684
@3 // 14685
M=D // 14686

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

@THIS // 14687
A=M+1 // 14688
M=M-1 // 14689

////PushInstruction("constant 0")
@SP // 14690
AM=M+1 // 14691
A=A-1 // 14692
M=0 // 14693
@RETURN // 14694
0;JMP // 14695

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14696
M=M+1 // 14697
AM=M+1 // 14698
A=A-1 // 14699
M=0 // 14700
A=A-1 // 14701
M=0 // 14702

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14703
A=M // 14704
D=M // 14705
@3 // 14706
M=D // 14707

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14708
A=M+1 // 14709
M=1 // 14710

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14711
A=M // 14712
M=0 // 14713

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
@String.intValue.LT.3 // 14714
D=A // 14715
@SP // 14716
AM=M+1 // 14717
A=A-1 // 14718
M=D // 14719
@LCL // 14720
A=M+1 // 14721
D=M // 14722
@SP // 14723
AM=M+1 // 14724
A=A-1 // 14725
M=D // 14726
@THIS // 14727
A=M+1 // 14728
D=M // 14729
@SP // 14730
AM=M-1 // 14731
D=M-D // 14732
@DO_LT // 14733
0;JMP // 14734
(String.intValue.LT.3)
D=!D // 14735
@WHILE_END_String.intValue1 // 14736
D;JNE // 14737

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

@LCL // 14738
A=M // 14739
D=M // 14740
@SP // 14741
AM=M+1 // 14742
A=A-1 // 14743
M=D // 14744
@10 // 14745
D=A // 14746
@SP // 14747
AM=M+1 // 14748
A=A-1 // 14749
M=D // 14750
// call Math.multiply
@7 // 14751
D=A // 14752
@14 // 14753
M=D // 14754
@Math.multiply // 14755
D=A // 14756
@13 // 14757
M=D // 14758
@String.intValue.ret.0 // 14759
D=A // 14760
@CALL // 14761
0;JMP // 14762
(String.intValue.ret.0)
@THIS // 14763
A=M // 14764
D=M // 14765
@SP // 14766
AM=M+1 // 14767
A=A-1 // 14768
M=D // 14769
@LCL // 14770
A=M+1 // 14771
D=M // 14772
@SP // 14773
AM=M-1 // 14774
A=D+M // 14775
D=M // 14776
@48 // 14777
D=D-A // 14778
@SP // 14779
AM=M-1 // 14780
D=D+M // 14781
@LCL // 14782
A=M // 14783
M=D // 14784

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

@LCL // 14785
A=M+1 // 14786
M=M+1 // 14787

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 14788
0;JMP // 14789

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 14790
A=M // 14791
D=M // 14792
@SP // 14793
AM=M+1 // 14794
A=A-1 // 14795
M=D // 14796
@RETURN // 14797
0;JMP // 14798

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 14799
D=A // 14800
@SP // 14801
AM=D+M // 14802
A=A-1 // 14803
M=0 // 14804
A=A-1 // 14805
M=0 // 14806
A=A-1 // 14807
M=0 // 14808
A=A-1 // 14809
M=0 // 14810
A=A-1 // 14811
M=0 // 14812
A=A-1 // 14813
M=0 // 14814

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14815
A=M // 14816
D=M // 14817
@3 // 14818
M=D // 14819

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14820
A=M+1 // 14821
M=0 // 14822

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14823
D=M // 14824
@4 // 14825
A=D+A // 14826
M=0 // 14827

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElse1}}
@String.setInt.EQ.4 // 14828
D=A // 14829
@SP // 14830
AM=M+1 // 14831
A=A-1 // 14832
M=D // 14833
@ARG // 14834
A=M+1 // 14835
D=M // 14836
@DO_EQ // 14837
0;JMP // 14838
(String.setInt.EQ.4)
D=!D // 14839
@String.setInt.IfElse1 // 14840
D;JNE // 14841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14842
D=M // 14843
@SP // 14844
AM=M+1 // 14845
A=A-1 // 14846
M=D // 14847
@48 // 14848
D=A // 14849
@SP // 14850
AM=M+1 // 14851
A=A-1 // 14852
M=D // 14853
// call String.appendChar
@7 // 14854
D=A // 14855
@14 // 14856
M=D // 14857
@String.appendChar // 14858
D=A // 14859
@13 // 14860
M=D // 14861
@String.setInt.ret.0 // 14862
D=A // 14863
@CALL // 14864
0;JMP // 14865
(String.setInt.ret.0)
@SP // 14866
M=M-1 // 14867

////PushInstruction("constant 0")
@SP // 14868
AM=M+1 // 14869
A=A-1 // 14870
M=0 // 14871
@RETURN // 14872
0;JMP // 14873

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 14874
0;JMP // 14875

////LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)

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
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElse2}}
@String.setInt.LT.5 // 14876
D=A // 14877
@SP // 14878
AM=M+1 // 14879
A=A-1 // 14880
M=D // 14881
@ARG // 14882
A=M+1 // 14883
D=M // 14884
@DO_LT // 14885
0;JMP // 14886
(String.setInt.LT.5)
D=!D // 14887
@String.setInt.IfElse2 // 14888
D;JNE // 14889

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14890
D=M // 14891
@4 // 14892
A=D+A // 14893
M=1 // 14894

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
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElse3}}
@String.setInt.LT.6 // 14895
D=A // 14896
@SP // 14897
AM=M+1 // 14898
A=A-1 // 14899
M=D // 14900
@ARG // 14901
A=M+1 // 14902
D=M // 14903
@DO_LT // 14904
0;JMP // 14905
(String.setInt.LT.6)
@SP // 14906
AM=M+1 // 14907
A=A-1 // 14908
M=D // 14909
@String.setInt.EQ.7 // 14910
D=A // 14911
@SP // 14912
AM=M+1 // 14913
A=A-1 // 14914
M=D // 14915
@ARG // 14916
A=M+1 // 14917
D=M // 14918
@32767 // 14919
D=D&A // 14920
@32767 // 14921
D=D-A // 14922
@DO_EQ // 14923
0;JMP // 14924
(String.setInt.EQ.7)
@SP // 14925
AM=M-1 // 14926
D=D&M // 14927
D=!D // 14928
@String.setInt.IfElse3 // 14929
D;JNE // 14930

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14931
D=M // 14932
@SP // 14933
AM=M+1 // 14934
A=A-1 // 14935
M=D // 14936
@45 // 14937
D=A // 14938
@SP // 14939
AM=M+1 // 14940
A=A-1 // 14941
M=D // 14942
// call String.appendChar
@7 // 14943
D=A // 14944
@14 // 14945
M=D // 14946
@String.appendChar // 14947
D=A // 14948
@13 // 14949
M=D // 14950
@String.setInt.ret.1 // 14951
D=A // 14952
@CALL // 14953
0;JMP // 14954
(String.setInt.ret.1)
@SP // 14955
M=M-1 // 14956

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14957
D=M // 14958
@SP // 14959
AM=M+1 // 14960
A=A-1 // 14961
M=D // 14962
@51 // 14963
D=A // 14964
@SP // 14965
AM=M+1 // 14966
A=A-1 // 14967
M=D // 14968
// call String.appendChar
@7 // 14969
D=A // 14970
@14 // 14971
M=D // 14972
@String.appendChar // 14973
D=A // 14974
@13 // 14975
M=D // 14976
@String.setInt.ret.2 // 14977
D=A // 14978
@CALL // 14979
0;JMP // 14980
(String.setInt.ret.2)
@SP // 14981
M=M-1 // 14982

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14983
D=M // 14984
@SP // 14985
AM=M+1 // 14986
A=A-1 // 14987
M=D // 14988
@50 // 14989
D=A // 14990
@SP // 14991
AM=M+1 // 14992
A=A-1 // 14993
M=D // 14994
// call String.appendChar
@7 // 14995
D=A // 14996
@14 // 14997
M=D // 14998
@String.appendChar // 14999
D=A // 15000
@13 // 15001
M=D // 15002
@String.setInt.ret.3 // 15003
D=A // 15004
@CALL // 15005
0;JMP // 15006
(String.setInt.ret.3)
@SP // 15007
M=M-1 // 15008

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15009
D=M // 15010
@SP // 15011
AM=M+1 // 15012
A=A-1 // 15013
M=D // 15014
@55 // 15015
D=A // 15016
@SP // 15017
AM=M+1 // 15018
A=A-1 // 15019
M=D // 15020
// call String.appendChar
@7 // 15021
D=A // 15022
@14 // 15023
M=D // 15024
@String.appendChar // 15025
D=A // 15026
@13 // 15027
M=D // 15028
@String.setInt.ret.4 // 15029
D=A // 15030
@CALL // 15031
0;JMP // 15032
(String.setInt.ret.4)
@SP // 15033
M=M-1 // 15034

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15035
D=M // 15036
@SP // 15037
AM=M+1 // 15038
A=A-1 // 15039
M=D // 15040
@54 // 15041
D=A // 15042
@SP // 15043
AM=M+1 // 15044
A=A-1 // 15045
M=D // 15046
// call String.appendChar
@7 // 15047
D=A // 15048
@14 // 15049
M=D // 15050
@String.appendChar // 15051
D=A // 15052
@13 // 15053
M=D // 15054
@String.setInt.ret.5 // 15055
D=A // 15056
@CALL // 15057
0;JMP // 15058
(String.setInt.ret.5)
@SP // 15059
M=M-1 // 15060

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15061
D=M // 15062
@SP // 15063
AM=M+1 // 15064
A=A-1 // 15065
M=D // 15066
@56 // 15067
D=A // 15068
@SP // 15069
AM=M+1 // 15070
A=A-1 // 15071
M=D // 15072
// call String.appendChar
@7 // 15073
D=A // 15074
@14 // 15075
M=D // 15076
@String.appendChar // 15077
D=A // 15078
@13 // 15079
M=D // 15080
@String.setInt.ret.6 // 15081
D=A // 15082
@CALL // 15083
0;JMP // 15084
(String.setInt.ret.6)
@SP // 15085
M=M-1 // 15086

////PushInstruction("constant 0")
@SP // 15087
AM=M+1 // 15088
A=A-1 // 15089
M=0 // 15090
@RETURN // 15091
0;JMP // 15092

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 15093
0;JMP // 15094

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

@ARG // 15095
A=M+1 // 15096
D=-M // 15097
@ARG // 15098
A=M+1 // 15099
M=D // 15100

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 15101
0;JMP // 15102

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

@ARG // 15103
A=M+1 // 15104
D=M // 15105
@LCL // 15106
A=M+1 // 15107
A=A+1 // 15108
M=D // 15109

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15110
A=M+1 // 15111
A=A+1 // 15112
A=A+1 // 15113
M=0 // 15114

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
@String.setInt.GT.8 // 15115
D=A // 15116
@SP // 15117
AM=M+1 // 15118
A=A-1 // 15119
M=D // 15120
@LCL // 15121
A=M+1 // 15122
A=A+1 // 15123
D=M // 15124
@DO_GT // 15125
0;JMP // 15126
(String.setInt.GT.8)
D=!D // 15127
@WHILE_END_String.setInt1 // 15128
D;JNE // 15129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15130
A=M+1 // 15131
A=A+1 // 15132
D=M // 15133
@SP // 15134
AM=M+1 // 15135
A=A-1 // 15136
M=D // 15137
@10 // 15138
D=A // 15139
@SP // 15140
AM=M+1 // 15141
A=A-1 // 15142
M=D // 15143
// call Math.divide
@7 // 15144
D=A // 15145
@14 // 15146
M=D // 15147
@Math.divide // 15148
D=A // 15149
@13 // 15150
M=D // 15151
@String.setInt.ret.7 // 15152
D=A // 15153
@CALL // 15154
0;JMP // 15155
(String.setInt.ret.7)
@SP // 15156
AM=M-1 // 15157
D=M // 15158
@LCL // 15159
A=M+1 // 15160
A=A+1 // 15161
M=D // 15162

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

@LCL // 15163
A=M+1 // 15164
A=A+1 // 15165
A=A+1 // 15166
M=M+1 // 15167

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15168
0;JMP // 15169

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15170
A=M+1 // 15171
A=A+1 // 15172
A=A+1 // 15173
D=M // 15174
@SP // 15175
AM=M+1 // 15176
A=A-1 // 15177
M=D // 15178
// call Array.new
@6 // 15179
D=A // 15180
@14 // 15181
M=D // 15182
@Array.new // 15183
D=A // 15184
@13 // 15185
M=D // 15186
@String.setInt.ret.8 // 15187
D=A // 15188
@CALL // 15189
0;JMP // 15190
(String.setInt.ret.8)
@LCL // 15191
D=M // 15192
@5 // 15193
A=D+A // 15194
D=A // 15195
@R13 // 15196
M=D // 15197
@SP // 15198
AM=M-1 // 15199
D=M // 15200
@R13 // 15201
A=M // 15202
M=D // 15203

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15204
A=M+1 // 15205
M=0 // 15206

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
@String.setInt.GT.9 // 15207
D=A // 15208
@SP // 15209
AM=M+1 // 15210
A=A-1 // 15211
M=D // 15212
@ARG // 15213
A=M+1 // 15214
D=M // 15215
@DO_GT // 15216
0;JMP // 15217
(String.setInt.GT.9)
D=!D // 15218
@WHILE_END_String.setInt2 // 15219
D;JNE // 15220

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

@ARG // 15221
A=M+1 // 15222
D=M // 15223
@SP // 15224
AM=M+1 // 15225
A=A-1 // 15226
M=D // 15227
@ARG // 15228
A=M+1 // 15229
D=M // 15230
@SP // 15231
AM=M+1 // 15232
A=A-1 // 15233
M=D // 15234
@10 // 15235
D=A // 15236
@SP // 15237
AM=M+1 // 15238
A=A-1 // 15239
M=D // 15240
// call Math.divide
@7 // 15241
D=A // 15242
@14 // 15243
M=D // 15244
@Math.divide // 15245
D=A // 15246
@13 // 15247
M=D // 15248
@String.setInt.ret.9 // 15249
D=A // 15250
@CALL // 15251
0;JMP // 15252
(String.setInt.ret.9)
@10 // 15253
D=A // 15254
@SP // 15255
AM=M+1 // 15256
A=A-1 // 15257
M=D // 15258
// call Math.multiply
@7 // 15259
D=A // 15260
@14 // 15261
M=D // 15262
@Math.multiply // 15263
D=A // 15264
@13 // 15265
M=D // 15266
@String.setInt.ret.10 // 15267
D=A // 15268
@CALL // 15269
0;JMP // 15270
(String.setInt.ret.10)
@SP // 15271
AM=M-1 // 15272
D=M // 15273
@SP // 15274
AM=M-1 // 15275
D=M-D // 15276
@LCL // 15277
A=M // 15278
M=D // 15279

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
@LCL // 15280
D=M // 15281
@5 // 15282
A=D+A // 15283
D=M // 15284
@SP // 15285
AM=M+1 // 15286
A=A-1 // 15287
M=D // 15288
@LCL // 15289
A=M+1 // 15290
D=M // 15291
@SP // 15292
AM=M-1 // 15293
D=D+M // 15294
@SP // 15295
AM=M+1 // 15296
A=A-1 // 15297
M=D // 15298
@LCL // 15299
A=M // 15300
D=M // 15301
@48 // 15302
D=D+A // 15303
@SP // 15304
AM=M-1 // 15305
A=M // 15306
M=D // 15307

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15308
A=M+1 // 15309
D=M // 15310
@SP // 15311
AM=M+1 // 15312
A=A-1 // 15313
M=D // 15314
@10 // 15315
D=A // 15316
@SP // 15317
AM=M+1 // 15318
A=A-1 // 15319
M=D // 15320
// call Math.divide
@7 // 15321
D=A // 15322
@14 // 15323
M=D // 15324
@Math.divide // 15325
D=A // 15326
@13 // 15327
M=D // 15328
@String.setInt.ret.11 // 15329
D=A // 15330
@CALL // 15331
0;JMP // 15332
(String.setInt.ret.11)
@SP // 15333
AM=M-1 // 15334
D=M // 15335
@ARG // 15336
A=M+1 // 15337
M=D // 15338

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

@LCL // 15339
A=M+1 // 15340
M=M+1 // 15341

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15342
0;JMP // 15343

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
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElse4}}
@String.setInt.EQ.10 // 15344
D=A // 15345
@SP // 15346
AM=M+1 // 15347
A=A-1 // 15348
M=D // 15349
@LCL // 15350
D=M // 15351
@4 // 15352
A=D+A // 15353
D=M // 15354
D=D-1 // 15355
@DO_EQ // 15356
0;JMP // 15357
(String.setInt.EQ.10)
D=!D // 15358
@String.setInt.IfElse4 // 15359
D;JNE // 15360

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15361
D=M // 15362
@SP // 15363
AM=M+1 // 15364
A=A-1 // 15365
M=D // 15366
@45 // 15367
D=A // 15368
@SP // 15369
AM=M+1 // 15370
A=A-1 // 15371
M=D // 15372
// call String.appendChar
@7 // 15373
D=A // 15374
@14 // 15375
M=D // 15376
@String.appendChar // 15377
D=A // 15378
@13 // 15379
M=D // 15380
@String.setInt.ret.12 // 15381
D=A // 15382
@CALL // 15383
0;JMP // 15384
(String.setInt.ret.12)
@SP // 15385
M=M-1 // 15386

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 15387
0;JMP // 15388

////LabelInstruction{label='String.setInt.IfElse4}
// label String.setInt.IfElse4
(String.setInt.IfElse4)

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
@String.setInt.GT.11 // 15389
D=A // 15390
@SP // 15391
AM=M+1 // 15392
A=A-1 // 15393
M=D // 15394
@LCL // 15395
A=M+1 // 15396
D=M // 15397
@DO_GT // 15398
0;JMP // 15399
(String.setInt.GT.11)
D=!D // 15400
@WHILE_END_String.setInt3 // 15401
D;JNE // 15402

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

@LCL // 15403
A=M+1 // 15404
M=M-1 // 15405

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

@3 // 15406
D=M // 15407
@SP // 15408
AM=M+1 // 15409
A=A-1 // 15410
M=D // 15411
@LCL // 15412
D=M // 15413
@5 // 15414
A=D+A // 15415
D=M // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420
@LCL // 15421
A=M+1 // 15422
D=M // 15423
@SP // 15424
AM=M-1 // 15425
A=D+M // 15426
D=M // 15427
@SP // 15428
AM=M+1 // 15429
A=A-1 // 15430
M=D // 15431
// call String.appendChar
@7 // 15432
D=A // 15433
@14 // 15434
M=D // 15435
@String.appendChar // 15436
D=A // 15437
@13 // 15438
M=D // 15439
@String.setInt.ret.13 // 15440
D=A // 15441
@CALL // 15442
0;JMP // 15443
(String.setInt.ret.13)
@SP // 15444
M=M-1 // 15445

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 15446
0;JMP // 15447

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15448
D=M // 15449
@5 // 15450
A=D+A // 15451
D=M // 15452
@SP // 15453
AM=M+1 // 15454
A=A-1 // 15455
M=D // 15456
// call Array.dispose
@6 // 15457
D=A // 15458
@14 // 15459
M=D // 15460
@Array.dispose // 15461
D=A // 15462
@13 // 15463
M=D // 15464
@String.setInt.ret.14 // 15465
D=A // 15466
@CALL // 15467
0;JMP // 15468
(String.setInt.ret.14)
@SP // 15469
M=M-1 // 15470

////PushInstruction("constant 0")
@SP // 15471
AM=M+1 // 15472
A=A-1 // 15473
M=0 // 15474
@RETURN // 15475
0;JMP // 15476

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15477
D=A // 15478
@SP // 15479
AM=M+1 // 15480
A=A-1 // 15481
M=D // 15482
@RETURN // 15483
0;JMP // 15484

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15485
D=A // 15486
@SP // 15487
AM=M+1 // 15488
A=A-1 // 15489
M=D // 15490
@RETURN // 15491
0;JMP // 15492

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15493
D=A // 15494
@SP // 15495
AM=M+1 // 15496
A=A-1 // 15497
M=D // 15498
@RETURN // 15499
0;JMP // 15500

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15501
D=A // 15502
@14 // 15503
M=D // 15504
@Memory.init // 15505
D=A // 15506
@13 // 15507
M=D // 15508
@Sys.init.ret.0 // 15509
D=A // 15510
@CALL // 15511
0;JMP // 15512
(Sys.init.ret.0)
@SP // 15513
M=M-1 // 15514

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15515
D=A // 15516
@14 // 15517
M=D // 15518
@Math.init // 15519
D=A // 15520
@13 // 15521
M=D // 15522
@Sys.init.ret.1 // 15523
D=A // 15524
@CALL // 15525
0;JMP // 15526
(Sys.init.ret.1)
@SP // 15527
M=M-1 // 15528

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15529
D=A // 15530
@14 // 15531
M=D // 15532
@Screen.init // 15533
D=A // 15534
@13 // 15535
M=D // 15536
@Sys.init.ret.2 // 15537
D=A // 15538
@CALL // 15539
0;JMP // 15540
(Sys.init.ret.2)
@SP // 15541
M=M-1 // 15542

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15543
D=A // 15544
@14 // 15545
M=D // 15546
@Output.init // 15547
D=A // 15548
@13 // 15549
M=D // 15550
@Sys.init.ret.3 // 15551
D=A // 15552
@CALL // 15553
0;JMP // 15554
(Sys.init.ret.3)
@SP // 15555
M=M-1 // 15556

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15557
D=A // 15558
@14 // 15559
M=D // 15560
@Keyboard.init // 15561
D=A // 15562
@13 // 15563
M=D // 15564
@Sys.init.ret.4 // 15565
D=A // 15566
@CALL // 15567
0;JMP // 15568
(Sys.init.ret.4)
@SP // 15569
M=M-1 // 15570

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15571
D=A // 15572
@14 // 15573
M=D // 15574
@Main.main // 15575
D=A // 15576
@13 // 15577
M=D // 15578
@Sys.init.ret.5 // 15579
D=A // 15580
@CALL // 15581
0;JMP // 15582
(Sys.init.ret.5)
@SP // 15583
M=M-1 // 15584

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15585
D=A // 15586
@14 // 15587
M=D // 15588
@Sys.halt // 15589
D=A // 15590
@13 // 15591
M=D // 15592
@Sys.init.ret.6 // 15593
D=A // 15594
@CALL // 15595
0;JMP // 15596
(Sys.init.ret.6)
@SP // 15597
M=M-1 // 15598

////PushInstruction("constant 0")
@SP // 15599
AM=M+1 // 15600
A=A-1 // 15601
M=0 // 15602
@RETURN // 15603
0;JMP // 15604

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0 // 15605
@WHILE_END_Sys.halt1 // 15606
D;JNE // 15607

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15608
0;JMP // 15609

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15610
AM=M+1 // 15611
A=A-1 // 15612
M=0 // 15613
@RETURN // 15614
0;JMP // 15615

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15616
AM=M+1 // 15617
A=A-1 // 15618
M=0 // 15619

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
@Sys.wait.GT.0 // 15620
D=A // 15621
@SP // 15622
AM=M+1 // 15623
A=A-1 // 15624
M=D // 15625
@ARG // 15626
A=M // 15627
D=M // 15628
@DO_GT // 15629
0;JMP // 15630
(Sys.wait.GT.0)
D=!D // 15631
@WHILE_END_Sys.wait1 // 15632
D;JNE // 15633

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

@ARG // 15634
A=M // 15635
M=M-1 // 15636

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15637
D=A // 15638
@LCL // 15639
A=M // 15640
M=D // 15641

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
@Sys.wait.GT.1 // 15642
D=A // 15643
@SP // 15644
AM=M+1 // 15645
A=A-1 // 15646
M=D // 15647
@LCL // 15648
A=M // 15649
D=M // 15650
@DO_GT // 15651
0;JMP // 15652
(Sys.wait.GT.1)
D=!D // 15653
@WHILE_END_Sys.wait2 // 15654
D;JNE // 15655

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

@LCL // 15656
A=M // 15657
M=M-1 // 15658

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15659
0;JMP // 15660

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15661
0;JMP // 15662

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15663
AM=M+1 // 15664
A=A-1 // 15665
M=0 // 15666
@RETURN // 15667
0;JMP // 15668

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15669
A=M // 15670
D=M // 15671
@SP // 15672
AM=M+1 // 15673
A=A-1 // 15674
M=D // 15675
// call Output.printInt
@6 // 15676
D=A // 15677
@14 // 15678
M=D // 15679
@Output.printInt // 15680
D=A // 15681
@13 // 15682
M=D // 15683
@Sys.error.ret.0 // 15684
D=A // 15685
@CALL // 15686
0;JMP // 15687
(Sys.error.ret.0)
@SP // 15688
M=M-1 // 15689

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15690
D=A // 15691
@14 // 15692
M=D // 15693
@Output.println // 15694
D=A // 15695
@13 // 15696
M=D // 15697
@Sys.error.ret.1 // 15698
D=A // 15699
@CALL // 15700
0;JMP // 15701
(Sys.error.ret.1)
@SP // 15702
M=M-1 // 15703

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15704
D=A // 15705
@14 // 15706
M=D // 15707
@Sys.halt // 15708
D=A // 15709
@13 // 15710
M=D // 15711
@Sys.error.ret.2 // 15712
D=A // 15713
@CALL // 15714
0;JMP // 15715
(Sys.error.ret.2)
@SP // 15716
M=M-1 // 15717

////PushInstruction("constant 0")
@SP // 15718
AM=M+1 // 15719
A=A-1 // 15720
M=0 // 15721
@RETURN // 15722
0;JMP // 15723

