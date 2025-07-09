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
@Math.multiply.LT.7 // 1123
D=A // 1124
@SP // 1125
AM=M+1 // 1126
A=A-1 // 1127
M=D // 1128
@LCL // 1129
A=M+1 // 1130
D=M // 1131
@16 // 1132
D=D-A // 1133
@DO_LT // 1134
0;JMP // 1135
(Math.multiply.LT.7)
D=!D // 1136
@WHILE_END_Math.multiply1 // 1137
D;JNE // 1138

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.multiply.IfElse6}}
@ARG // 1139
A=M+1 // 1140
D=M // 1141
@SP // 1142
AM=M+1 // 1143
A=A-1 // 1144
M=D // 1145
@LCL // 1146
A=M+1 // 1147
A=A+1 // 1148
D=M // 1149
@SP // 1150
AM=M-1 // 1151
D=D&M // 1152
D=!D // 1153
@Math.multiply.IfElse6 // 1154
D;JNE // 1155

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

@ARG // 1156
A=M // 1157
D=M // 1158
@LCL // 1159
A=M // 1160
M=D+M // 1161

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 1162
0;JMP // 1163

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

@ARG // 1164
A=M // 1165
D=M // 1166
@ARG // 1167
A=M // 1168
M=D+M // 1169

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

@LCL // 1170
A=M+1 // 1171
M=M+1 // 1172

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

@LCL // 1173
A=M+1 // 1174
A=A+1 // 1175
D=M // 1176
@LCL // 1177
A=M+1 // 1178
A=A+1 // 1179
M=D+M // 1180

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1181
0;JMP // 1182

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1183
A=M // 1184
D=M // 1185
@SP // 1186
AM=M+1 // 1187
A=A-1 // 1188
M=D // 1189
@RETURN // 1190
0;JMP // 1191

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1192
D=A // 1193
@SP // 1194
AM=D+M // 1195
A=A-1 // 1196
M=0 // 1197
A=A-1 // 1198
M=0 // 1199
A=A-1 // 1200
M=0 // 1201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1202
A=M // 1203
D=M // 1204
@SP // 1205
AM=M+1 // 1206
A=A-1 // 1207
M=D // 1208
// call Math.abs
@6 // 1209
D=A // 1210
@14 // 1211
M=D // 1212
@Math.abs // 1213
D=A // 1214
@13 // 1215
M=D // 1216
@Math.divide.ret.0 // 1217
D=A // 1218
@CALL // 1219
0;JMP // 1220
(Math.divide.ret.0)
@SP // 1221
AM=M-1 // 1222
D=M // 1223
@LCL // 1224
A=M+1 // 1225
M=D // 1226

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1227
A=M+1 // 1228
D=M // 1229
@SP // 1230
AM=M+1 // 1231
A=A-1 // 1232
M=D // 1233
// call Math.abs
@6 // 1234
D=A // 1235
@14 // 1236
M=D // 1237
@Math.abs // 1238
D=A // 1239
@13 // 1240
M=D // 1241
@Math.divide.ret.1 // 1242
D=A // 1243
@CALL // 1244
0;JMP // 1245
(Math.divide.ret.1)
@SP // 1246
AM=M-1 // 1247
D=M // 1248
@LCL // 1249
A=M+1 // 1250
A=A+1 // 1251
M=D // 1252

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElse1}}
@Math.divide.GT.8 // 1253
D=A // 1254
@SP // 1255
AM=M+1 // 1256
A=A-1 // 1257
M=D // 1258
@LCL // 1259
A=M+1 // 1260
A=A+1 // 1261
D=M // 1262
A=A-1 // 1263
D=D-M // 1264
@DO_GT // 1265
0;JMP // 1266
(Math.divide.GT.8)
D=!D // 1267
@Math.divide.IfElse1 // 1268
D;JNE // 1269

////PushInstruction("constant 0")
@SP // 1270
AM=M+1 // 1271
A=A-1 // 1272
M=0 // 1273
@RETURN // 1274
0;JMP // 1275

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 1276
0;JMP // 1277

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

@LCL // 1278
A=M+1 // 1279
D=M // 1280
@SP // 1281
AM=M+1 // 1282
A=A-1 // 1283
M=D // 1284
@LCL // 1285
A=M+1 // 1286
A=A+1 // 1287
D=M // 1288
D=D+M // 1289
@SP // 1290
AM=M+1 // 1291
A=A-1 // 1292
M=D // 1293
// call Math.divide
@7 // 1294
D=A // 1295
@14 // 1296
M=D // 1297
@Math.divide // 1298
D=A // 1299
@13 // 1300
M=D // 1301
@Math.divide.ret.2 // 1302
D=A // 1303
@CALL // 1304
0;JMP // 1305
(Math.divide.ret.2)
@SP // 1306
AM=M-1 // 1307
D=M // 1308
@LCL // 1309
A=M // 1310
M=D // 1311

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
@Math.divide.LT.9 // 1312
D=A // 1313
@SP // 1314
AM=M+1 // 1315
A=A-1 // 1316
M=D // 1317
@LCL // 1318
A=M+1 // 1319
D=M // 1320
@SP // 1321
AM=M+1 // 1322
A=A-1 // 1323
M=D // 1324
@LCL // 1325
A=M // 1326
D=M // 1327
D=D+M // 1328
@SP // 1329
AM=M+1 // 1330
A=A-1 // 1331
M=D // 1332
@LCL // 1333
A=M+1 // 1334
A=A+1 // 1335
D=M // 1336
@SP // 1337
AM=M+1 // 1338
A=A-1 // 1339
M=D // 1340
// call Math.multiply
@7 // 1341
D=A // 1342
@14 // 1343
M=D // 1344
@Math.multiply // 1345
D=A // 1346
@13 // 1347
M=D // 1348
@Math.divide.ret.3 // 1349
D=A // 1350
@CALL // 1351
0;JMP // 1352
(Math.divide.ret.3)
@SP // 1353
AM=M-1 // 1354
D=M // 1355
@SP // 1356
AM=M-1 // 1357
D=M-D // 1358
@SP // 1359
AM=M+1 // 1360
A=A-1 // 1361
M=D // 1362
@LCL // 1363
A=M+1 // 1364
A=A+1 // 1365
D=M // 1366
@SP // 1367
AM=M-1 // 1368
D=M-D // 1369
@DO_LT // 1370
0;JMP // 1371
(Math.divide.LT.9)
D=!D // 1372
@Math.divide.IfElse2 // 1373
D;JNE // 1374

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
@Math.divide.GT.10 // 1375
D=A // 1376
@SP // 1377
AM=M+1 // 1378
A=A-1 // 1379
M=D // 1380
@Math.divide.LT.11 // 1381
D=A // 1382
@SP // 1383
AM=M+1 // 1384
A=A-1 // 1385
M=D // 1386
@ARG // 1387
A=M // 1388
D=M // 1389
@DO_LT // 1390
0;JMP // 1391
(Math.divide.LT.11)
@SP // 1392
AM=M+1 // 1393
A=A-1 // 1394
M=D // 1395
@ARG // 1396
A=M+1 // 1397
D=M // 1398
@SP // 1399
AM=M-1 // 1400
D=D&M // 1401
@DO_GT // 1402
0;JMP // 1403
(Math.divide.GT.10)
@SP // 1404
AM=M+1 // 1405
A=A-1 // 1406
M=D // 1407
@Math.divide.LT.12 // 1408
D=A // 1409
@SP // 1410
AM=M+1 // 1411
A=A-1 // 1412
M=D // 1413
@Math.divide.GT.13 // 1414
D=A // 1415
@SP // 1416
AM=M+1 // 1417
A=A-1 // 1418
M=D // 1419
@ARG // 1420
A=M // 1421
D=M // 1422
@DO_GT // 1423
0;JMP // 1424
(Math.divide.GT.13)
@SP // 1425
AM=M+1 // 1426
A=A-1 // 1427
M=D // 1428
@ARG // 1429
A=M+1 // 1430
D=M // 1431
@SP // 1432
AM=M-1 // 1433
D=D&M // 1434
@DO_LT // 1435
0;JMP // 1436
(Math.divide.LT.12)
@SP // 1437
AM=M-1 // 1438
D=D|M // 1439
D=!D // 1440
@Math.divide.IfElse3 // 1441
D;JNE // 1442

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1443
A=M // 1444
D=-M // 1445
@LCL // 1446
A=M // 1447
M=D // 1448

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 1449
0;JMP // 1450

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
@LCL // 1451
A=M // 1452
D=M // 1453
D=D+M // 1454
@SP // 1455
AM=M+1 // 1456
A=A-1 // 1457
M=D // 1458
@RETURN // 1459
0;JMP // 1460

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1461
0;JMP // 1462

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
@Math.divide.GT.14 // 1463
D=A // 1464
@SP // 1465
AM=M+1 // 1466
A=A-1 // 1467
M=D // 1468
@Math.divide.LT.15 // 1469
D=A // 1470
@SP // 1471
AM=M+1 // 1472
A=A-1 // 1473
M=D // 1474
@ARG // 1475
A=M // 1476
D=M // 1477
@DO_LT // 1478
0;JMP // 1479
(Math.divide.LT.15)
@SP // 1480
AM=M+1 // 1481
A=A-1 // 1482
M=D // 1483
@ARG // 1484
A=M+1 // 1485
D=M // 1486
@SP // 1487
AM=M-1 // 1488
D=D&M // 1489
@DO_GT // 1490
0;JMP // 1491
(Math.divide.GT.14)
@SP // 1492
AM=M+1 // 1493
A=A-1 // 1494
M=D // 1495
@Math.divide.LT.16 // 1496
D=A // 1497
@SP // 1498
AM=M+1 // 1499
A=A-1 // 1500
M=D // 1501
@Math.divide.GT.17 // 1502
D=A // 1503
@SP // 1504
AM=M+1 // 1505
A=A-1 // 1506
M=D // 1507
@ARG // 1508
A=M // 1509
D=M // 1510
@DO_GT // 1511
0;JMP // 1512
(Math.divide.GT.17)
@SP // 1513
AM=M+1 // 1514
A=A-1 // 1515
M=D // 1516
@ARG // 1517
A=M+1 // 1518
D=M // 1519
@SP // 1520
AM=M-1 // 1521
D=D&M // 1522
@DO_LT // 1523
0;JMP // 1524
(Math.divide.LT.16)
@SP // 1525
AM=M-1 // 1526
D=D|M // 1527
D=!D // 1528
@Math.divide.IfElse4 // 1529
D;JNE // 1530

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1531
A=M // 1532
D=-M // 1533
@LCL // 1534
A=M // 1535
M=D // 1536

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 1537
0;JMP // 1538

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
@LCL // 1539
A=M // 1540
D=M // 1541
D=D+M // 1542
D=D+1 // 1543
@SP // 1544
AM=M+1 // 1545
A=A-1 // 1546
M=D // 1547
@RETURN // 1548
0;JMP // 1549

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
@ARG // 1550
A=M // 1551
D=M // 1552
@SP // 1553
AM=M+1 // 1554
A=A-1 // 1555
M=D // 1556
@ARG // 1557
A=M // 1558
D=M // 1559
@SP // 1560
AM=M+1 // 1561
A=A-1 // 1562
M=D // 1563
@ARG // 1564
A=M+1 // 1565
D=M // 1566
@SP // 1567
AM=M+1 // 1568
A=A-1 // 1569
M=D // 1570
// call Math.divide
@7 // 1571
D=A // 1572
@14 // 1573
M=D // 1574
@Math.divide // 1575
D=A // 1576
@13 // 1577
M=D // 1578
@Math.mod.ret.0 // 1579
D=A // 1580
@CALL // 1581
0;JMP // 1582
(Math.mod.ret.0)
@ARG // 1583
A=M+1 // 1584
D=M // 1585
@SP // 1586
AM=M+1 // 1587
A=A-1 // 1588
M=D // 1589
// call Math.multiply
@7 // 1590
D=A // 1591
@14 // 1592
M=D // 1593
@Math.multiply // 1594
D=A // 1595
@13 // 1596
M=D // 1597
@Math.mod.ret.1 // 1598
D=A // 1599
@CALL // 1600
0;JMP // 1601
(Math.mod.ret.1)
@SP // 1602
AM=M-1 // 1603
D=M // 1604
@SP // 1605
AM=M-1 // 1606
D=M-D // 1607
@SP // 1608
AM=M+1 // 1609
A=A-1 // 1610
M=D // 1611
@RETURN // 1612
0;JMP // 1613

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
@Math.0 // 1614
D=M // 1615
@SP // 1616
AM=M+1 // 1617
A=A-1 // 1618
M=D // 1619
@ARG // 1620
A=M // 1621
D=M // 1622
@SP // 1623
AM=M-1 // 1624
A=D+M // 1625
D=M // 1626
@SP // 1627
AM=M+1 // 1628
A=A-1 // 1629
M=D // 1630
@RETURN // 1631
0;JMP // 1632

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1633
D=A // 1634
@SP // 1635
AM=D+M // 1636
A=A-1 // 1637
M=0 // 1638
A=A-1 // 1639
M=0 // 1640
A=A-1 // 1641
M=0 // 1642
A=A-1 // 1643
M=0 // 1644

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1645
A=M // 1646
M=0 // 1647

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1648
D=A // 1649
@LCL // 1650
A=M+1 // 1651
M=D // 1652

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
@Math.sqrt.LT.18 // 1653
D=A // 1654
@SP // 1655
AM=M+1 // 1656
A=A-1 // 1657
M=D // 1658
@LCL // 1659
A=M+1 // 1660
D=M // 1661
@DO_LT // 1662
0;JMP // 1663
(Math.sqrt.LT.18)
@WHILE_END_Math.sqrt1 // 1664
D;JNE // 1665

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

@LCL // 1666
A=M // 1667
D=M // 1668
@SP // 1669
AM=M+1 // 1670
A=A-1 // 1671
M=D // 1672
@Math.0 // 1673
D=M // 1674
@SP // 1675
AM=M+1 // 1676
A=A-1 // 1677
M=D // 1678
@LCL // 1679
A=M+1 // 1680
D=M // 1681
@SP // 1682
AM=M-1 // 1683
A=D+M // 1684
D=M // 1685
@SP // 1686
AM=M-1 // 1687
D=D+M // 1688
@LCL // 1689
A=M+1 // 1690
A=A+1 // 1691
M=D // 1692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1693
D=A // 1694
@SP // 1695
M=D+M // 1696
@LCL // 1697
A=M+1 // 1698
A=A+1 // 1699
D=M // 1700
@SP // 1701
A=M-1 // 1702
M=D // 1703
A=A-1 // 1704
M=D // 1705
// call Math.multiply
@7 // 1706
D=A // 1707
@14 // 1708
M=D // 1709
@Math.multiply // 1710
D=A // 1711
@13 // 1712
M=D // 1713
@Math.sqrt.ret.0 // 1714
D=A // 1715
@CALL // 1716
0;JMP // 1717
(Math.sqrt.ret.0)
@SP // 1718
AM=M-1 // 1719
D=M // 1720
@LCL // 1721
A=M+1 // 1722
A=A+1 // 1723
A=A+1 // 1724
M=D // 1725

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
@Math.sqrt.GT.19 // 1726
D=A // 1727
@SP // 1728
AM=M+1 // 1729
A=A-1 // 1730
M=D // 1731
@LCL // 1732
A=M+1 // 1733
A=A+1 // 1734
A=A+1 // 1735
D=M // 1736
@SP // 1737
AM=M+1 // 1738
A=A-1 // 1739
M=D // 1740
@ARG // 1741
A=M // 1742
D=M // 1743
@SP // 1744
AM=M-1 // 1745
D=M-D // 1746
@DO_GT // 1747
0;JMP // 1748
(Math.sqrt.GT.19)
@SP // 1749
AM=M+1 // 1750
A=A-1 // 1751
M=D // 1752
@SP // 1753
A=M-1 // 1754
M=!D // 1755
@Math.sqrt.GT.20 // 1756
D=A // 1757
@SP // 1758
AM=M+1 // 1759
A=A-1 // 1760
M=D // 1761
@LCL // 1762
A=M+1 // 1763
A=A+1 // 1764
A=A+1 // 1765
D=M // 1766
@DO_GT // 1767
0;JMP // 1768
(Math.sqrt.GT.20)
@SP // 1769
AM=M-1 // 1770
D=D&M // 1771
D=!D // 1772
@Math.sqrt.IfElse1 // 1773
D;JNE // 1774

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1775
A=M+1 // 1776
A=A+1 // 1777
D=M // 1778
@LCL // 1779
A=M // 1780
M=D // 1781

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 1782
0;JMP // 1783

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

@LCL // 1784
A=M+1 // 1785
M=M-1 // 1786

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1787
0;JMP // 1788

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1789
A=M // 1790
D=M // 1791
@SP // 1792
AM=M+1 // 1793
A=A-1 // 1794
M=D // 1795
@RETURN // 1796
0;JMP // 1797

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
@Math.max.GT.21 // 1798
D=A // 1799
@SP // 1800
AM=M+1 // 1801
A=A-1 // 1802
M=D // 1803
@ARG // 1804
A=M+1 // 1805
D=M // 1806
A=A-1 // 1807
D=M-D // 1808
@DO_GT // 1809
0;JMP // 1810
(Math.max.GT.21)
D=!D // 1811
@Math.max.IfElse1 // 1812
D;JNE // 1813

////PushInstruction("argument 0")
@ARG // 1814
A=M // 1815
D=M // 1816
@SP // 1817
AM=M+1 // 1818
A=A-1 // 1819
M=D // 1820
@RETURN // 1821
0;JMP // 1822

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 1823
0;JMP // 1824

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1825
A=M+1 // 1826
D=M // 1827
@SP // 1828
AM=M+1 // 1829
A=A-1 // 1830
M=D // 1831
@RETURN // 1832
0;JMP // 1833

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
@Math.min.LT.22 // 1834
D=A // 1835
@SP // 1836
AM=M+1 // 1837
A=A-1 // 1838
M=D // 1839
@ARG // 1840
A=M+1 // 1841
D=M // 1842
A=A-1 // 1843
D=M-D // 1844
@DO_LT // 1845
0;JMP // 1846
(Math.min.LT.22)
D=!D // 1847
@Math.min.IfElse1 // 1848
D;JNE // 1849

////PushInstruction("argument 0")
@ARG // 1850
A=M // 1851
D=M // 1852
@SP // 1853
AM=M+1 // 1854
A=A-1 // 1855
M=D // 1856
@RETURN // 1857
0;JMP // 1858

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 1859
0;JMP // 1860

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1861
A=M+1 // 1862
D=M // 1863
@SP // 1864
AM=M+1 // 1865
A=A-1 // 1866
M=D // 1867
@RETURN // 1868
0;JMP // 1869

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1870
A=M // 1871
D=M // 1872
@SP // 1873
AM=M+1 // 1874
A=A-1 // 1875
M=D // 1876
@ARG // 1877
A=M // 1878
D=M // 1879
@SP // 1880
AM=M+1 // 1881
A=A-1 // 1882
M=D // 1883
@SP // 1884
A=M-1 // 1885
M=-D // 1886
// call Math.max
@7 // 1887
D=A // 1888
@14 // 1889
M=D // 1890
@Math.max // 1891
D=A // 1892
@13 // 1893
M=D // 1894
@Math.abs.ret.0 // 1895
D=A // 1896
@CALL // 1897
0;JMP // 1898
(Math.abs.ret.0)
@RETURN // 1899
0;JMP // 1900

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1901
M=M+1 // 1902
AM=M+1 // 1903
A=A-1 // 1904
M=0 // 1905
A=A-1 // 1906
M=0 // 1907

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

@2055 // 1908
D=A // 1909
@LCL // 1910
A=M // 1911
M=D // 1912

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
@LCL // 1913
A=M // 1914
D=M // 1915
@SP // 1916
AM=M+1 // 1917
A=A-1 // 1918
M=D // 1919
@LCL // 1920
A=M // 1921
D=M // 1922
@16384 // 1923
D=A-D // 1924
@5 // 1925
D=D-A // 1926
@SP // 1927
AM=M-1 // 1928
A=M // 1929
M=D // 1930

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1931
A=M // 1932
D=M // 1933
@SP // 1934
AM=M+1 // 1935
A=A-1 // 1936
M=D+1 // 1937
D=1 // 1938
@SP // 1939
AM=M-1 // 1940
A=M // 1941
M=D // 1942

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1943
A=M // 1944
D=M // 1945
@2 // 1946
D=D+A // 1947
@SP // 1948
AM=M+1 // 1949
A=A-1 // 1950
M=D // 1951
D=0 // 1952
@SP // 1953
AM=M-1 // 1954
A=M // 1955
M=D // 1956

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1957
A=M // 1958
D=M // 1959
@3 // 1960
D=D+A // 1961
@SP // 1962
AM=M+1 // 1963
A=A-1 // 1964
M=D // 1965
D=0 // 1966
@SP // 1967
AM=M-1 // 1968
A=M // 1969
M=D // 1970

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1971
A=M // 1972
D=M // 1973
@SP // 1974
AM=M+1 // 1975
A=A-1 // 1976
M=D // 1977
// call Memory.create_foot
@6 // 1978
D=A // 1979
@14 // 1980
M=D // 1981
@Memory.create_foot // 1982
D=A // 1983
@13 // 1984
M=D // 1985
@Memory.init.ret.0 // 1986
D=A // 1987
@CALL // 1988
0;JMP // 1989
(Memory.init.ret.0)
@SP // 1990
M=M-1 // 1991

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

@2054 // 1992
D=A // 1993
@SP // 1994
AM=M+1 // 1995
A=A-1 // 1996
M=D // 1997
@2054 // 1998
D=A // 1999
@SP // 2000
AM=M+1 // 2001
A=A-1 // 2002
M=D // 2003
@LCL // 2004
A=M // 2005
D=M // 2006
@SP // 2007
AM=M+1 // 2008
A=A-1 // 2009
M=D // 2010
// call Memory.add_node
@7 // 2011
D=A // 2012
@14 // 2013
M=D // 2014
@Memory.add_node // 2015
D=A // 2016
@13 // 2017
M=D // 2018
@Memory.init.ret.1 // 2019
D=A // 2020
@CALL // 2021
0;JMP // 2022
(Memory.init.ret.1)
@SP // 2023
M=M-1 // 2024

////PushInstruction("constant 0")
@SP // 2025
AM=M+1 // 2026
A=A-1 // 2027
M=0 // 2028
@RETURN // 2029
0;JMP // 2030

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2031
D=A // 2032
@SP // 2033
AM=D+M // 2034
A=A-1 // 2035
M=0 // 2036
A=A-1 // 2037
M=0 // 2038
A=A-1 // 2039
M=0 // 2040
A=A-1 // 2041
M=0 // 2042
A=A-1 // 2043
M=0 // 2044

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2045
A=M // 2046
D=M // 2047
@SP // 2048
AM=M+1 // 2049
A=A-1 // 2050
M=D // 2051
// call Memory.getBinIndex
@6 // 2052
D=A // 2053
@14 // 2054
M=D // 2055
@Memory.getBinIndex // 2056
D=A // 2057
@13 // 2058
M=D // 2059
@Memory.alloc.ret.0 // 2060
D=A // 2061
@CALL // 2062
0;JMP // 2063
(Memory.alloc.ret.0)
@SP // 2064
AM=M-1 // 2065
D=M // 2066
@LCL // 2067
A=M // 2068
M=D // 2069

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

@LCL // 2070
A=M // 2071
D=M // 2072
@2048 // 2073
D=D+A // 2074
@LCL // 2075
A=M+1 // 2076
M=D // 2077

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2078
A=M+1 // 2079
D=M // 2080
@SP // 2081
AM=M+1 // 2082
A=A-1 // 2083
M=D // 2084
@ARG // 2085
A=M // 2086
D=M // 2087
@SP // 2088
AM=M+1 // 2089
A=A-1 // 2090
M=D // 2091
// call Memory.get_best_fit
@7 // 2092
D=A // 2093
@14 // 2094
M=D // 2095
@Memory.get_best_fit // 2096
D=A // 2097
@13 // 2098
M=D // 2099
@Memory.alloc.ret.1 // 2100
D=A // 2101
@CALL // 2102
0;JMP // 2103
(Memory.alloc.ret.1)
@SP // 2104
AM=M-1 // 2105
D=M // 2106
@LCL // 2107
A=M+1 // 2108
A=A+1 // 2109
M=D // 2110

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
@Memory.alloc.EQ.0 // 2111
D=A // 2112
@SP // 2113
AM=M+1 // 2114
A=A-1 // 2115
M=D // 2116
@LCL // 2117
A=M+1 // 2118
A=A+1 // 2119
D=M // 2120
@DO_EQ // 2121
0;JMP // 2122
(Memory.alloc.EQ.0)
D=!D // 2123
@WHILE_END_Memory.alloc1 // 2124
D;JNE // 2125

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
@Memory.alloc.LT.1 // 2126
D=A // 2127
@SP // 2128
AM=M+1 // 2129
A=A-1 // 2130
M=D // 2131
@LCL // 2132
A=M // 2133
D=M // 2134
D=D+1 // 2135
@7 // 2136
D=D-A // 2137
@DO_LT // 2138
0;JMP // 2139
(Memory.alloc.LT.1)
@Memory.alloc.IfElse1 // 2140
D;JNE // 2141

////PushInstruction("constant 0")
@SP // 2142
AM=M+1 // 2143
A=A-1 // 2144
M=0 // 2145
@RETURN // 2146
0;JMP // 2147

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 2148
0;JMP // 2149

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

@LCL // 2150
A=M // 2151
M=M+1 // 2152

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

@LCL // 2153
A=M // 2154
D=M // 2155
@2048 // 2156
D=D+A // 2157
@LCL // 2158
A=M+1 // 2159
M=D // 2160

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2161
A=M+1 // 2162
D=M // 2163
@SP // 2164
AM=M+1 // 2165
A=A-1 // 2166
M=D // 2167
@ARG // 2168
A=M // 2169
D=M // 2170
@SP // 2171
AM=M+1 // 2172
A=A-1 // 2173
M=D // 2174
// call Memory.get_best_fit
@7 // 2175
D=A // 2176
@14 // 2177
M=D // 2178
@Memory.get_best_fit // 2179
D=A // 2180
@13 // 2181
M=D // 2182
@Memory.alloc.ret.2 // 2183
D=A // 2184
@CALL // 2185
0;JMP // 2186
(Memory.alloc.ret.2)
@SP // 2187
AM=M-1 // 2188
D=M // 2189
@LCL // 2190
A=M+1 // 2191
A=A+1 // 2192
M=D // 2193

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2194
0;JMP // 2195

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

@LCL // 2196
A=M+1 // 2197
A=A+1 // 2198
D=M // 2199
@0 // 2200
A=D+A // 2201
D=M // 2202
@SP // 2203
AM=M+1 // 2204
A=A-1 // 2205
M=D // 2206
// call Memory.getBinIndex
@6 // 2207
D=A // 2208
@14 // 2209
M=D // 2210
@Memory.getBinIndex // 2211
D=A // 2212
@13 // 2213
M=D // 2214
@Memory.alloc.ret.3 // 2215
D=A // 2216
@CALL // 2217
0;JMP // 2218
(Memory.alloc.ret.3)
@SP // 2219
AM=M-1 // 2220
D=M // 2221
@2048 // 2222
D=D+A // 2223
@SP // 2224
AM=M+1 // 2225
A=A-1 // 2226
M=D // 2227
@LCL // 2228
A=M+1 // 2229
A=A+1 // 2230
D=M // 2231
@SP // 2232
AM=M+1 // 2233
A=A-1 // 2234
M=D // 2235
// call Memory.remove_node
@7 // 2236
D=A // 2237
@14 // 2238
M=D // 2239
@Memory.remove_node // 2240
D=A // 2241
@13 // 2242
M=D // 2243
@Memory.alloc.ret.4 // 2244
D=A // 2245
@CALL // 2246
0;JMP // 2247
(Memory.alloc.ret.4)
@SP // 2248
M=M-1 // 2249

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

@LCL // 2250
A=M+1 // 2251
A=A+1 // 2252
D=M // 2253
@0 // 2254
A=D+A // 2255
D=M // 2256
@SP // 2257
AM=M+1 // 2258
A=A-1 // 2259
M=D // 2260
@ARG // 2261
A=M // 2262
D=M // 2263
@SP // 2264
AM=M-1 // 2265
D=M-D // 2266
@LCL // 2267
A=M+1 // 2268
A=A+1 // 2269
A=A+1 // 2270
M=D // 2271

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 5"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
@Memory.alloc.GT.2 // 2272
D=A // 2273
@SP // 2274
AM=M+1 // 2275
A=A-1 // 2276
M=D // 2277
@LCL // 2278
A=M+1 // 2279
A=A+1 // 2280
A=A+1 // 2281
D=M // 2282
@5 // 2283
D=D-A // 2284
@DO_GT // 2285
0;JMP // 2286
(Memory.alloc.GT.2)
D=!D // 2287
@Memory.alloc.IfElse2 // 2288
D;JNE // 2289

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2290
A=M+1 // 2291
A=A+1 // 2292
D=M // 2293
@SP // 2294
AM=M+1 // 2295
A=A-1 // 2296
M=D // 2297
@ARG // 2298
A=M // 2299
D=M // 2300
@SP // 2301
AM=M-1 // 2302
A=M // 2303
M=D // 2304

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2305
A=M+1 // 2306
A=A+1 // 2307
D=M // 2308
@SP // 2309
AM=M+1 // 2310
A=A-1 // 2311
M=D+1 // 2312
D=0 // 2313
@SP // 2314
AM=M-1 // 2315
A=M // 2316
M=D // 2317

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2318
A=M+1 // 2319
A=A+1 // 2320
D=M // 2321
@SP // 2322
AM=M+1 // 2323
A=A-1 // 2324
M=D // 2325
// call Memory.create_foot
@6 // 2326
D=A // 2327
@14 // 2328
M=D // 2329
@Memory.create_foot // 2330
D=A // 2331
@13 // 2332
M=D // 2333
@Memory.alloc.ret.5 // 2334
D=A // 2335
@CALL // 2336
0;JMP // 2337
(Memory.alloc.ret.5)
@SP // 2338
M=M-1 // 2339

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

@LCL // 2340
A=M+1 // 2341
A=A+1 // 2342
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
D=D+M // 2353
@5 // 2354
D=D+A // 2355
@SP // 2356
AM=M+1 // 2357
A=A-1 // 2358
M=D // 2359
@LCL // 2360
D=M // 2361
@4 // 2362
A=D+A // 2363
D=A // 2364
@R13 // 2365
M=D // 2366
@SP // 2367
AM=M-1 // 2368
D=M // 2369
@R13 // 2370
A=M // 2371
M=D // 2372

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
@LCL // 2373
D=M // 2374
@4 // 2375
A=D+A // 2376
D=M // 2377
@SP // 2378
AM=M+1 // 2379
A=A-1 // 2380
M=D // 2381
@LCL // 2382
A=M+1 // 2383
A=A+1 // 2384
A=A+1 // 2385
D=M // 2386
@5 // 2387
D=D-A // 2388
@SP // 2389
AM=M-1 // 2390
A=M // 2391
M=D // 2392

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2393
D=M // 2394
@4 // 2395
A=D+A // 2396
D=M // 2397
@SP // 2398
AM=M+1 // 2399
A=A-1 // 2400
M=D+1 // 2401
D=1 // 2402
@SP // 2403
AM=M-1 // 2404
A=M // 2405
M=D // 2406

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2407
D=M // 2408
@4 // 2409
A=D+A // 2410
D=M // 2411
@SP // 2412
AM=M+1 // 2413
A=A-1 // 2414
M=D // 2415
// call Memory.create_foot
@6 // 2416
D=A // 2417
@14 // 2418
M=D // 2419
@Memory.create_foot // 2420
D=A // 2421
@13 // 2422
M=D // 2423
@Memory.alloc.ret.6 // 2424
D=A // 2425
@CALL // 2426
0;JMP // 2427
(Memory.alloc.ret.6)
@SP // 2428
M=M-1 // 2429

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

@LCL // 2430
A=M+1 // 2431
A=A+1 // 2432
A=A+1 // 2433
D=M // 2434
@SP // 2435
AM=M+1 // 2436
A=A-1 // 2437
M=D // 2438
// call Memory.getBinIndex
@6 // 2439
D=A // 2440
@14 // 2441
M=D // 2442
@Memory.getBinIndex // 2443
D=A // 2444
@13 // 2445
M=D // 2446
@Memory.alloc.ret.7 // 2447
D=A // 2448
@CALL // 2449
0;JMP // 2450
(Memory.alloc.ret.7)
@SP // 2451
AM=M-1 // 2452
D=M // 2453
@2048 // 2454
D=D+A // 2455
@SP // 2456
AM=M+1 // 2457
A=A-1 // 2458
M=D // 2459
@LCL // 2460
D=M // 2461
@4 // 2462
A=D+A // 2463
D=M // 2464
@SP // 2465
AM=M+1 // 2466
A=A-1 // 2467
M=D // 2468
// call Memory.add_node
@7 // 2469
D=A // 2470
@14 // 2471
M=D // 2472
@Memory.add_node // 2473
D=A // 2474
@13 // 2475
M=D // 2476
@Memory.alloc.ret.8 // 2477
D=A // 2478
@CALL // 2479
0;JMP // 2480
(Memory.alloc.ret.8)
@SP // 2481
M=M-1 // 2482

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2483
0;JMP // 2484

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
@LCL // 2485
A=M+1 // 2486
A=A+1 // 2487
D=M // 2488
@SP // 2489
AM=M+1 // 2490
A=A-1 // 2491
M=D+1 // 2492
D=0 // 2493
@SP // 2494
AM=M-1 // 2495
A=M // 2496
M=D // 2497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2498
A=M+1 // 2499
A=A+1 // 2500
D=M // 2501
@SP // 2502
AM=M+1 // 2503
A=A-1 // 2504
M=D // 2505
// call Memory.create_foot
@6 // 2506
D=A // 2507
@14 // 2508
M=D // 2509
@Memory.create_foot // 2510
D=A // 2511
@13 // 2512
M=D // 2513
@Memory.alloc.ret.9 // 2514
D=A // 2515
@CALL // 2516
0;JMP // 2517
(Memory.alloc.ret.9)
@SP // 2518
M=M-1 // 2519

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
@LCL // 2520
A=M+1 // 2521
A=A+1 // 2522
D=M // 2523
@4 // 2524
D=D+A // 2525
@SP // 2526
AM=M+1 // 2527
A=A-1 // 2528
M=D // 2529
@RETURN // 2530
0;JMP // 2531

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2532
AM=M+1 // 2533
A=A-1 // 2534
M=0 // 2535

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2536
A=M // 2537
D=M // 2538
@SP // 2539
AM=M+1 // 2540
A=A-1 // 2541
M=D // 2542
// call Memory.alloc
@6 // 2543
D=A // 2544
@14 // 2545
M=D // 2546
@Memory.alloc // 2547
D=A // 2548
@13 // 2549
M=D // 2550
@Memory.calloc.ret.0 // 2551
D=A // 2552
@CALL // 2553
0;JMP // 2554
(Memory.calloc.ret.0)
@SP // 2555
AM=M-1 // 2556
D=M // 2557
@LCL // 2558
A=M // 2559
M=D // 2560

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@LCL // 2561
A=M // 2562
D=M // 2563
@Memory.calloc.IfElse1 // 2564
D;JNE // 2565

////PushInstruction("constant 0")
@SP // 2566
AM=M+1 // 2567
A=A-1 // 2568
M=0 // 2569
@RETURN // 2570
0;JMP // 2571

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 2572
0;JMP // 2573

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
@Memory.calloc.GT.3 // 2574
D=A // 2575
@SP // 2576
AM=M+1 // 2577
A=A-1 // 2578
M=D // 2579
@ARG // 2580
A=M // 2581
D=M // 2582
@DO_GT // 2583
0;JMP // 2584
(Memory.calloc.GT.3)
D=!D // 2585
@WHILE_END_Memory.calloc1 // 2586
D;JNE // 2587

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

@ARG // 2588
A=M // 2589
M=M-1 // 2590

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2591
A=M // 2592
D=M // 2593
@SP // 2594
AM=M+1 // 2595
A=A-1 // 2596
M=D // 2597
@ARG // 2598
A=M // 2599
D=M // 2600
@SP // 2601
AM=M-1 // 2602
D=D+M // 2603
@SP // 2604
AM=M+1 // 2605
A=A-1 // 2606
M=D // 2607
D=0 // 2608
@SP // 2609
AM=M-1 // 2610
A=M // 2611
M=D // 2612

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2613
0;JMP // 2614

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2615
A=M // 2616
D=M // 2617
@SP // 2618
AM=M+1 // 2619
A=A-1 // 2620
M=D // 2621
@RETURN // 2622
0;JMP // 2623

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2624
D=A // 2625
@SP // 2626
AM=D+M // 2627
A=A-1 // 2628
M=0 // 2629
A=A-1 // 2630
M=0 // 2631
A=A-1 // 2632
M=0 // 2633

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

@ARG // 2634
A=M // 2635
D=M // 2636
@4 // 2637
D=D-A // 2638
@LCL // 2639
A=M // 2640
M=D // 2641

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2642
A=M // 2643
D=M // 2644
@SP // 2645
AM=M+1 // 2646
A=A-1 // 2647
M=D+1 // 2648
D=1 // 2649
@SP // 2650
AM=M-1 // 2651
A=M // 2652
M=D // 2653

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

@LCL // 2654
A=M // 2655
D=M // 2656
@2 // 2657
A=D+A // 2658
D=M // 2659
@LCL // 2660
A=M+1 // 2661
M=D // 2662

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

@LCL // 2663
A=M // 2664
D=M // 2665
@3 // 2666
A=D+A // 2667
D=M // 2668
@LCL // 2669
A=M+1 // 2670
A=A+1 // 2671
M=D // 2672

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElse1}}
@Memory.deAlloc.EQ.4 // 2673
D=A // 2674
@SP // 2675
AM=M+1 // 2676
A=A-1 // 2677
M=D // 2678
@LCL // 2679
A=M+1 // 2680
D=M // 2681
@DO_EQ // 2682
0;JMP // 2683
(Memory.deAlloc.EQ.4)
@Memory.deAlloc.IfElse1 // 2684
D;JNE // 2685

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
@Memory.deAlloc.EQ.5 // 2686
D=A // 2687
@SP // 2688
AM=M+1 // 2689
A=A-1 // 2690
M=D // 2691
@LCL // 2692
A=M+1 // 2693
D=M // 2694
A=D+1 // 2695
D=M // 2696
D=D-1 // 2697
@DO_EQ // 2698
0;JMP // 2699
(Memory.deAlloc.EQ.5)
D=!D // 2700
@Memory.deAlloc.IfElse2 // 2701
D;JNE // 2702

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

@LCL // 2703
A=M+1 // 2704
D=M // 2705
@0 // 2706
A=D+A // 2707
D=M // 2708
@SP // 2709
AM=M+1 // 2710
A=A-1 // 2711
M=D // 2712
// call Memory.getBinIndex
@6 // 2713
D=A // 2714
@14 // 2715
M=D // 2716
@Memory.getBinIndex // 2717
D=A // 2718
@13 // 2719
M=D // 2720
@Memory.deAlloc.ret.0 // 2721
D=A // 2722
@CALL // 2723
0;JMP // 2724
(Memory.deAlloc.ret.0)
@SP // 2725
AM=M-1 // 2726
D=M // 2727
@2048 // 2728
D=D+A // 2729
@SP // 2730
AM=M+1 // 2731
A=A-1 // 2732
M=D // 2733
@LCL // 2734
A=M+1 // 2735
D=M // 2736
@SP // 2737
AM=M+1 // 2738
A=A-1 // 2739
M=D // 2740
// call Memory.remove_node
@7 // 2741
D=A // 2742
@14 // 2743
M=D // 2744
@Memory.remove_node // 2745
D=A // 2746
@13 // 2747
M=D // 2748
@Memory.deAlloc.ret.1 // 2749
D=A // 2750
@CALL // 2751
0;JMP // 2752
(Memory.deAlloc.ret.1)
@SP // 2753
M=M-1 // 2754

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
@LCL // 2755
A=M+1 // 2756
D=M // 2757
@SP // 2758
AM=M+1 // 2759
A=A-1 // 2760
M=D // 2761
@LCL // 2762
A=M+1 // 2763
D=M // 2764
@0 // 2765
A=D+A // 2766
D=M // 2767
@SP // 2768
AM=M+1 // 2769
A=A-1 // 2770
M=D // 2771
@LCL // 2772
A=M // 2773
D=M // 2774
@0 // 2775
A=D+A // 2776
D=M // 2777
@SP // 2778
AM=M-1 // 2779
D=D+M // 2780
@5 // 2781
D=D+A // 2782
@SP // 2783
AM=M-1 // 2784
A=M // 2785
M=D // 2786

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2787
A=M+1 // 2788
D=M // 2789
@SP // 2790
AM=M+1 // 2791
A=A-1 // 2792
M=D // 2793
// call Memory.create_foot
@6 // 2794
D=A // 2795
@14 // 2796
M=D // 2797
@Memory.create_foot // 2798
D=A // 2799
@13 // 2800
M=D // 2801
@Memory.deAlloc.ret.2 // 2802
D=A // 2803
@CALL // 2804
0;JMP // 2805
(Memory.deAlloc.ret.2)
@SP // 2806
M=M-1 // 2807

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2808
A=M+1 // 2809
D=M // 2810
@LCL // 2811
A=M // 2812
M=D // 2813

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 2814
0;JMP // 2815

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 2816
0;JMP // 2817

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
@Memory.deAlloc.EQ.6 // 2818
D=A // 2819
@SP // 2820
AM=M+1 // 2821
A=A-1 // 2822
M=D // 2823
@LCL // 2824
A=M+1 // 2825
A=A+1 // 2826
D=M // 2827
@DO_EQ // 2828
0;JMP // 2829
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse3 // 2830
D;JNE // 2831

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
@Memory.deAlloc.EQ.7 // 2832
D=A // 2833
@SP // 2834
AM=M+1 // 2835
A=A-1 // 2836
M=D // 2837
@LCL // 2838
A=M+1 // 2839
A=A+1 // 2840
D=M // 2841
A=D+1 // 2842
D=M // 2843
D=D-1 // 2844
@DO_EQ // 2845
0;JMP // 2846
(Memory.deAlloc.EQ.7)
D=!D // 2847
@Memory.deAlloc.IfElse4 // 2848
D;JNE // 2849

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

@LCL // 2850
A=M+1 // 2851
A=A+1 // 2852
D=M // 2853
@0 // 2854
A=D+A // 2855
D=M // 2856
@SP // 2857
AM=M+1 // 2858
A=A-1 // 2859
M=D // 2860
// call Memory.getBinIndex
@6 // 2861
D=A // 2862
@14 // 2863
M=D // 2864
@Memory.getBinIndex // 2865
D=A // 2866
@13 // 2867
M=D // 2868
@Memory.deAlloc.ret.3 // 2869
D=A // 2870
@CALL // 2871
0;JMP // 2872
(Memory.deAlloc.ret.3)
@SP // 2873
AM=M-1 // 2874
D=M // 2875
@2048 // 2876
D=D+A // 2877
@SP // 2878
AM=M+1 // 2879
A=A-1 // 2880
M=D // 2881
@LCL // 2882
A=M+1 // 2883
A=A+1 // 2884
D=M // 2885
@SP // 2886
AM=M+1 // 2887
A=A-1 // 2888
M=D // 2889
// call Memory.remove_node
@7 // 2890
D=A // 2891
@14 // 2892
M=D // 2893
@Memory.remove_node // 2894
D=A // 2895
@13 // 2896
M=D // 2897
@Memory.deAlloc.ret.4 // 2898
D=A // 2899
@CALL // 2900
0;JMP // 2901
(Memory.deAlloc.ret.4)
@SP // 2902
M=M-1 // 2903

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
@LCL // 2904
A=M // 2905
D=M // 2906
@SP // 2907
AM=M+1 // 2908
A=A-1 // 2909
M=D // 2910
@LCL // 2911
A=M // 2912
D=M // 2913
@0 // 2914
A=D+A // 2915
D=M // 2916
@SP // 2917
AM=M+1 // 2918
A=A-1 // 2919
M=D // 2920
@LCL // 2921
A=M+1 // 2922
A=A+1 // 2923
D=M // 2924
@0 // 2925
A=D+A // 2926
D=M // 2927
@SP // 2928
AM=M-1 // 2929
D=D+M // 2930
@5 // 2931
D=D+A // 2932
@SP // 2933
AM=M-1 // 2934
A=M // 2935
M=D // 2936

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2937
A=M // 2938
D=M // 2939
@SP // 2940
AM=M+1 // 2941
A=A-1 // 2942
M=D // 2943
// call Memory.create_foot
@6 // 2944
D=A // 2945
@14 // 2946
M=D // 2947
@Memory.create_foot // 2948
D=A // 2949
@13 // 2950
M=D // 2951
@Memory.deAlloc.ret.5 // 2952
D=A // 2953
@CALL // 2954
0;JMP // 2955
(Memory.deAlloc.ret.5)
@SP // 2956
M=M-1 // 2957

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 2958
0;JMP // 2959

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 2960
0;JMP // 2961

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

@LCL // 2962
A=M // 2963
D=M // 2964
@0 // 2965
A=D+A // 2966
D=M // 2967
@SP // 2968
AM=M+1 // 2969
A=A-1 // 2970
M=D // 2971
// call Memory.getBinIndex
@6 // 2972
D=A // 2973
@14 // 2974
M=D // 2975
@Memory.getBinIndex // 2976
D=A // 2977
@13 // 2978
M=D // 2979
@Memory.deAlloc.ret.6 // 2980
D=A // 2981
@CALL // 2982
0;JMP // 2983
(Memory.deAlloc.ret.6)
@SP // 2984
AM=M-1 // 2985
D=M // 2986
@2048 // 2987
D=D+A // 2988
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
@Memory.deAlloc.ret.7 // 3008
D=A // 3009
@CALL // 3010
0;JMP // 3011
(Memory.deAlloc.ret.7)
@SP // 3012
M=M-1 // 3013

////PushInstruction("constant 0")
@SP // 3014
AM=M+1 // 3015
A=A-1 // 3016
M=0 // 3017
@RETURN // 3018
0;JMP // 3019

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 3020
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

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse1}}
@Memory.realloc.EQ.8 // 3032
D=A // 3033
@SP // 3034
AM=M+1 // 3035
A=A-1 // 3036
M=D // 3037
@ARG // 3038
A=M // 3039
D=M // 3040
@DO_EQ // 3041
0;JMP // 3042
(Memory.realloc.EQ.8)
D=!D // 3043
@Memory.realloc.IfElse1 // 3044
D;JNE // 3045

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3046
A=M+1 // 3047
D=M // 3048
@SP // 3049
AM=M+1 // 3050
A=A-1 // 3051
M=D // 3052
// call Memory.alloc
@6 // 3053
D=A // 3054
@14 // 3055
M=D // 3056
@Memory.alloc // 3057
D=A // 3058
@13 // 3059
M=D // 3060
@Memory.realloc.ret.0 // 3061
D=A // 3062
@CALL // 3063
0;JMP // 3064
(Memory.realloc.ret.0)
@RETURN // 3065
0;JMP // 3066

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 3067
0;JMP // 3068

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

@ARG // 3069
A=M // 3070
D=M // 3071
D=D-1 // 3072
@LCL // 3073
A=M+1 // 3074
A=A+1 // 3075
A=A+1 // 3076
M=D // 3077

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

@LCL // 3078
A=M+1 // 3079
A=A+1 // 3080
A=A+1 // 3081
D=M // 3082
@0 // 3083
A=D+A // 3084
D=M // 3085
@LCL // 3086
A=M // 3087
M=D // 3088

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3089
A=M+1 // 3090
D=M // 3091
@SP // 3092
AM=M+1 // 3093
A=A-1 // 3094
M=D // 3095
// call Memory.alloc
@6 // 3096
D=A // 3097
@14 // 3098
M=D // 3099
@Memory.alloc // 3100
D=A // 3101
@13 // 3102
M=D // 3103
@Memory.realloc.ret.1 // 3104
D=A // 3105
@CALL // 3106
0;JMP // 3107
(Memory.realloc.ret.1)
@SP // 3108
AM=M-1 // 3109
D=M // 3110
@LCL // 3111
A=M+1 // 3112
M=D // 3113

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElse2}}
@Memory.realloc.EQ.9 // 3114
D=A // 3115
@SP // 3116
AM=M+1 // 3117
A=A-1 // 3118
M=D // 3119
@LCL // 3120
A=M+1 // 3121
D=M // 3122
@DO_EQ // 3123
0;JMP // 3124
(Memory.realloc.EQ.9)
D=!D // 3125
@Memory.realloc.IfElse2 // 3126
D;JNE // 3127

////PushInstruction("constant 0")
@SP // 3128
AM=M+1 // 3129
A=A-1 // 3130
M=0 // 3131
@RETURN // 3132
0;JMP // 3133

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 3134
0;JMP // 3135

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
@Memory.realloc.GT.10 // 3136
D=A // 3137
@SP // 3138
AM=M+1 // 3139
A=A-1 // 3140
M=D // 3141
@LCL // 3142
A=M // 3143
D=M // 3144
@SP // 3145
AM=M+1 // 3146
A=A-1 // 3147
M=D // 3148
@ARG // 3149
A=M+1 // 3150
D=M // 3151
@SP // 3152
AM=M-1 // 3153
D=M-D // 3154
@DO_GT // 3155
0;JMP // 3156
(Memory.realloc.GT.10)
@Memory.realloc.IfElse3 // 3157
D;JNE // 3158

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3159
A=M // 3160
D=M // 3161
@LCL // 3162
A=M+1 // 3163
A=A+1 // 3164
M=D // 3165

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3166
0;JMP // 3167

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3168
A=M+1 // 3169
D=M // 3170
@LCL // 3171
A=M+1 // 3172
A=A+1 // 3173
M=D // 3174

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3175
A=M // 3176
D=M // 3177
@SP // 3178
AM=M+1 // 3179
A=A-1 // 3180
M=D // 3181
@LCL // 3182
A=M+1 // 3183
D=M // 3184
@SP // 3185
AM=M+1 // 3186
A=A-1 // 3187
M=D // 3188
@LCL // 3189
A=M+1 // 3190
A=A+1 // 3191
D=M // 3192
@SP // 3193
AM=M+1 // 3194
A=A-1 // 3195
M=D // 3196
// call Memory.copy
@8 // 3197
D=A // 3198
@14 // 3199
M=D // 3200
@Memory.copy // 3201
D=A // 3202
@13 // 3203
M=D // 3204
@Memory.realloc.ret.2 // 3205
D=A // 3206
@CALL // 3207
0;JMP // 3208
(Memory.realloc.ret.2)
@SP // 3209
M=M-1 // 3210

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3211
A=M // 3212
D=M // 3213
@SP // 3214
AM=M+1 // 3215
A=A-1 // 3216
M=D // 3217
// call Memory.deAlloc
@6 // 3218
D=A // 3219
@14 // 3220
M=D // 3221
@Memory.deAlloc // 3222
D=A // 3223
@13 // 3224
M=D // 3225
@Memory.realloc.ret.3 // 3226
D=A // 3227
@CALL // 3228
0;JMP // 3229
(Memory.realloc.ret.3)
@SP // 3230
M=M-1 // 3231

////PushInstruction("local 1")
@LCL // 3232
A=M+1 // 3233
D=M // 3234
@SP // 3235
AM=M+1 // 3236
A=A-1 // 3237
M=D // 3238
@RETURN // 3239
0;JMP // 3240

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3241
AM=M+1 // 3242
A=A-1 // 3243
M=0 // 3244

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3245
A=M // 3246
M=0 // 3247

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
@Memory.copy.LT.11 // 3248
D=A // 3249
@SP // 3250
AM=M+1 // 3251
A=A-1 // 3252
M=D // 3253
@LCL // 3254
A=M // 3255
D=M // 3256
@SP // 3257
AM=M+1 // 3258
A=A-1 // 3259
M=D // 3260
@ARG // 3261
A=M+1 // 3262
A=A+1 // 3263
D=M // 3264
@SP // 3265
AM=M-1 // 3266
D=M-D // 3267
@DO_LT // 3268
0;JMP // 3269
(Memory.copy.LT.11)
D=!D // 3270
@WHILE_END_Memory.copy1 // 3271
D;JNE // 3272

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
@ARG // 3273
A=M+1 // 3274
D=M // 3275
@SP // 3276
AM=M+1 // 3277
A=A-1 // 3278
M=D // 3279
@LCL // 3280
A=M // 3281
D=M // 3282
@SP // 3283
AM=M-1 // 3284
D=D+M // 3285
@SP // 3286
AM=M+1 // 3287
A=A-1 // 3288
M=D // 3289
@ARG // 3290
A=M // 3291
D=M // 3292
@SP // 3293
AM=M+1 // 3294
A=A-1 // 3295
M=D // 3296
@LCL // 3297
A=M // 3298
D=M // 3299
@SP // 3300
AM=M-1 // 3301
A=D+M // 3302
D=M // 3303
@SP // 3304
AM=M-1 // 3305
A=M // 3306
M=D // 3307

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

@LCL // 3308
A=M // 3309
M=M+1 // 3310

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3311
0;JMP // 3312

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3313
AM=M+1 // 3314
A=A-1 // 3315
M=0 // 3316
@RETURN // 3317
0;JMP // 3318

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
@Memory.remove_node.EQ.12 // 3319
D=A // 3320
@SP // 3321
AM=M+1 // 3322
A=A-1 // 3323
M=D // 3324
@ARG // 3325
A=M+1 // 3326
D=M // 3327
@2 // 3328
A=D+A // 3329
D=M // 3330
@DO_EQ // 3331
0;JMP // 3332
(Memory.remove_node.EQ.12)
@Memory.remove_node.IfElse1 // 3333
D;JNE // 3334

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
@ARG // 3335
A=M+1 // 3336
D=M // 3337
@2 // 3338
D=D+A // 3339
@3 // 3340
D=D+A // 3341
@SP // 3342
AM=M+1 // 3343
A=A-1 // 3344
M=D // 3345
@ARG // 3346
A=M+1 // 3347
D=M // 3348
@3 // 3349
A=D+A // 3350
D=M // 3351
@SP // 3352
AM=M-1 // 3353
A=M // 3354
M=D // 3355

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3356
0;JMP // 3357

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
@ARG // 3358
A=M // 3359
D=M // 3360
@SP // 3361
AM=M+1 // 3362
A=A-1 // 3363
M=D // 3364
@ARG // 3365
A=M+1 // 3366
D=M // 3367
@3 // 3368
A=D+A // 3369
D=M // 3370
@SP // 3371
AM=M-1 // 3372
A=M // 3373
M=D // 3374

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
@Memory.remove_node.EQ.13 // 3375
D=A // 3376
@SP // 3377
AM=M+1 // 3378
A=A-1 // 3379
M=D // 3380
@ARG // 3381
A=M+1 // 3382
D=M // 3383
@3 // 3384
A=D+A // 3385
D=M // 3386
@DO_EQ // 3387
0;JMP // 3388
(Memory.remove_node.EQ.13)
@Memory.remove_node.IfElse2 // 3389
D;JNE // 3390

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
@ARG // 3391
A=M+1 // 3392
D=M // 3393
@3 // 3394
D=D+A // 3395
@2 // 3396
D=D+A // 3397
@SP // 3398
AM=M+1 // 3399
A=A-1 // 3400
M=D // 3401
@ARG // 3402
A=M+1 // 3403
D=M // 3404
@2 // 3405
A=D+A // 3406
D=M // 3407
@SP // 3408
AM=M-1 // 3409
A=M // 3410
M=D // 3411

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 3412
0;JMP // 3413

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
@ARG // 3414
A=M+1 // 3415
D=M // 3416
@2 // 3417
D=D+A // 3418
@SP // 3419
AM=M+1 // 3420
A=A-1 // 3421
M=D // 3422
D=0 // 3423
@SP // 3424
AM=M-1 // 3425
A=M // 3426
M=D // 3427

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3428
A=M+1 // 3429
D=M // 3430
@3 // 3431
D=D+A // 3432
@SP // 3433
AM=M+1 // 3434
A=A-1 // 3435
M=D // 3436
D=0 // 3437
@SP // 3438
AM=M-1 // 3439
A=M // 3440
M=D // 3441

////PushInstruction("constant 0")
@SP // 3442
AM=M+1 // 3443
A=A-1 // 3444
M=0 // 3445
@RETURN // 3446
0;JMP // 3447

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3448
AM=M+1 // 3449
A=A-1 // 3450
M=0 // 3451

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3452
A=M // 3453
M=0 // 3454

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
@Memory.getBinIndex.LT.14 // 3455
D=A // 3456
@SP // 3457
AM=M+1 // 3458
A=A-1 // 3459
M=D // 3460
@LCL // 3461
A=M // 3462
D=M // 3463
@7 // 3464
D=D-A // 3465
@DO_LT // 3466
0;JMP // 3467
(Memory.getBinIndex.LT.14)
@SP // 3468
AM=M+1 // 3469
A=A-1 // 3470
M=D // 3471
@Memory.getBinIndex.EQ.15 // 3472
D=A // 3473
@SP // 3474
AM=M+1 // 3475
A=A-1 // 3476
M=D // 3477
@LCL // 3478
A=M // 3479
D=M // 3480
@2048 // 3481
A=D+A // 3482
D=M // 3483
@DO_EQ // 3484
0;JMP // 3485
(Memory.getBinIndex.EQ.15)
D=!D // 3486
@SP // 3487
AM=M-1 // 3488
D=D&M // 3489
D=!D // 3490
@WHILE_END_Memory.getBinIndex1 // 3491
D;JNE // 3492

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
@Memory.getBinIndex.GT.16 // 3493
D=A // 3494
@SP // 3495
AM=M+1 // 3496
A=A-1 // 3497
M=D // 3498
@ARG // 3499
A=M // 3500
D=M // 3501
@SP // 3502
AM=M+1 // 3503
A=A-1 // 3504
M=D // 3505
@LCL // 3506
A=M // 3507
D=M // 3508
@SP // 3509
AM=M+1 // 3510
A=A-1 // 3511
M=D+1 // 3512
@16 // 3513
D=A // 3514
@SP // 3515
AM=M+1 // 3516
A=A-1 // 3517
M=D // 3518
// call Math.multiply
@7 // 3519
D=A // 3520
@14 // 3521
M=D // 3522
@Math.multiply // 3523
D=A // 3524
@13 // 3525
M=D // 3526
@Memory.getBinIndex.ret.0 // 3527
D=A // 3528
@CALL // 3529
0;JMP // 3530
(Memory.getBinIndex.ret.0)
@SP // 3531
AM=M-1 // 3532
D=M // 3533
@SP // 3534
AM=M-1 // 3535
D=M-D // 3536
@DO_GT // 3537
0;JMP // 3538
(Memory.getBinIndex.GT.16)
@Memory.getBinIndex.IfElse1 // 3539
D;JNE // 3540

////PushInstruction("local 0")
@LCL // 3541
A=M // 3542
D=M // 3543
@SP // 3544
AM=M+1 // 3545
A=A-1 // 3546
M=D // 3547
@RETURN // 3548
0;JMP // 3549

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 3550
0;JMP // 3551

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

@LCL // 3552
A=M // 3553
M=M+1 // 3554

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3555
0;JMP // 3556

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
@6 // 3557
D=A // 3558
@SP // 3559
AM=M+1 // 3560
A=A-1 // 3561
M=D // 3562
@7 // 3563
D=A // 3564
@SP // 3565
AM=M+1 // 3566
A=A-1 // 3567
M=D-1 // 3568
@RETURN // 3569
0;JMP // 3570

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3571
AM=M+1 // 3572
A=A-1 // 3573
M=0 // 3574

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

@ARG // 3575
A=M // 3576
D=M // 3577
@0 // 3578
A=D+A // 3579
D=M // 3580
@LCL // 3581
A=M // 3582
M=D // 3583

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
@Memory.get_best_fit.LT.17 // 3584
D=A // 3585
@SP // 3586
AM=M+1 // 3587
A=A-1 // 3588
M=D // 3589
@LCL // 3590
A=M // 3591
D=M // 3592
@0 // 3593
A=D+A // 3594
D=M // 3595
@SP // 3596
AM=M+1 // 3597
A=A-1 // 3598
M=D // 3599
@ARG // 3600
A=M+1 // 3601
D=M // 3602
@SP // 3603
AM=M-1 // 3604
D=M-D // 3605
@DO_LT // 3606
0;JMP // 3607
(Memory.get_best_fit.LT.17)
@Memory.get_best_fit.IfElse1 // 3608
D;JNE // 3609

////PushInstruction("local 0")
@LCL // 3610
A=M // 3611
D=M // 3612
@SP // 3613
AM=M+1 // 3614
A=A-1 // 3615
M=D // 3616
@RETURN // 3617
0;JMP // 3618

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 3619
0;JMP // 3620

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
@Memory.get_best_fit.EQ.18 // 3621
D=A // 3622
@SP // 3623
AM=M+1 // 3624
A=A-1 // 3625
M=D // 3626
@LCL // 3627
A=M // 3628
D=M // 3629
@3 // 3630
A=D+A // 3631
D=M // 3632
@DO_EQ // 3633
0;JMP // 3634
(Memory.get_best_fit.EQ.18)
@WHILE_END_Memory.get_best_fit1 // 3635
D;JNE // 3636

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

@LCL // 3637
A=M // 3638
D=M // 3639
@3 // 3640
A=D+A // 3641
D=M // 3642
@LCL // 3643
A=M // 3644
M=D // 3645

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
@Memory.get_best_fit.LT.19 // 3646
D=A // 3647
@SP // 3648
AM=M+1 // 3649
A=A-1 // 3650
M=D // 3651
@LCL // 3652
A=M // 3653
D=M // 3654
@0 // 3655
A=D+A // 3656
D=M // 3657
@SP // 3658
AM=M+1 // 3659
A=A-1 // 3660
M=D // 3661
@ARG // 3662
A=M+1 // 3663
D=M // 3664
@SP // 3665
AM=M-1 // 3666
D=M-D // 3667
@DO_LT // 3668
0;JMP // 3669
(Memory.get_best_fit.LT.19)
@Memory.get_best_fit.IfElse2 // 3670
D;JNE // 3671

////PushInstruction("local 0")
@LCL // 3672
A=M // 3673
D=M // 3674
@SP // 3675
AM=M+1 // 3676
A=A-1 // 3677
M=D // 3678
@RETURN // 3679
0;JMP // 3680

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 3681
0;JMP // 3682

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3683
0;JMP // 3684

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3685
AM=M+1 // 3686
A=A-1 // 3687
M=0 // 3688
@RETURN // 3689
0;JMP // 3690

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
@ARG // 3691
A=M // 3692
D=M // 3693
@SP // 3694
AM=M+1 // 3695
A=A-1 // 3696
M=D // 3697
@ARG // 3698
A=M // 3699
D=M // 3700
@0 // 3701
A=D+A // 3702
D=M // 3703
@4 // 3704
D=D+A // 3705
@SP // 3706
AM=M-1 // 3707
D=D+M // 3708
@SP // 3709
AM=M+1 // 3710
A=A-1 // 3711
M=D // 3712
@ARG // 3713
A=M // 3714
D=M // 3715
@SP // 3716
AM=M-1 // 3717
A=M // 3718
M=D // 3719

////PushInstruction("constant 0")
@SP // 3720
AM=M+1 // 3721
A=A-1 // 3722
M=0 // 3723
@RETURN // 3724
0;JMP // 3725

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3726
M=M+1 // 3727
AM=M+1 // 3728
A=A-1 // 3729
M=0 // 3730
A=A-1 // 3731
M=0 // 3732

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3733
A=M+1 // 3734
D=M // 3735
@2 // 3736
D=D+A // 3737
@SP // 3738
AM=M+1 // 3739
A=A-1 // 3740
M=D // 3741
D=0 // 3742
@SP // 3743
AM=M-1 // 3744
A=M // 3745
M=D // 3746

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3747
A=M+1 // 3748
D=M // 3749
@3 // 3750
D=D+A // 3751
@SP // 3752
AM=M+1 // 3753
A=A-1 // 3754
M=D // 3755
D=0 // 3756
@SP // 3757
AM=M-1 // 3758
A=M // 3759
M=D // 3760

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
@Memory.add_node.EQ.20 // 3761
D=A // 3762
@SP // 3763
AM=M+1 // 3764
A=A-1 // 3765
M=D // 3766
@ARG // 3767
A=M // 3768
D=M // 3769
@0 // 3770
A=D+A // 3771
D=M // 3772
@DO_EQ // 3773
0;JMP // 3774
(Memory.add_node.EQ.20)
D=!D // 3775
@Memory.add_node.IfElse1 // 3776
D;JNE // 3777

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3778
A=M // 3779
D=M // 3780
@SP // 3781
AM=M+1 // 3782
A=A-1 // 3783
M=D // 3784
@ARG // 3785
A=M+1 // 3786
D=M // 3787
@SP // 3788
AM=M-1 // 3789
A=M // 3790
M=D // 3791

////PushInstruction("constant 0")
@SP // 3792
AM=M+1 // 3793
A=A-1 // 3794
M=0 // 3795
@RETURN // 3796
0;JMP // 3797

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 3798
0;JMP // 3799

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

@ARG // 3800
A=M // 3801
D=M // 3802
@0 // 3803
A=D+A // 3804
D=M // 3805
@LCL // 3806
A=M // 3807
M=D // 3808

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3809
A=M+1 // 3810
M=0 // 3811

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
@Memory.add_node.EQ.21 // 3812
D=A // 3813
@SP // 3814
AM=M+1 // 3815
A=A-1 // 3816
M=D // 3817
@LCL // 3818
A=M // 3819
D=M // 3820
@DO_EQ // 3821
0;JMP // 3822
(Memory.add_node.EQ.21)
@SP // 3823
AM=M+1 // 3824
A=A-1 // 3825
M=D // 3826
@SP // 3827
A=M-1 // 3828
M=!D // 3829
@Memory.add_node.GT.22 // 3830
D=A // 3831
@SP // 3832
AM=M+1 // 3833
A=A-1 // 3834
M=D // 3835
@LCL // 3836
A=M // 3837
D=M // 3838
@0 // 3839
A=D+A // 3840
D=M // 3841
@SP // 3842
AM=M+1 // 3843
A=A-1 // 3844
M=D // 3845
@ARG // 3846
A=M+1 // 3847
D=M // 3848
@0 // 3849
A=D+A // 3850
D=M // 3851
@SP // 3852
AM=M-1 // 3853
D=M-D // 3854
@DO_GT // 3855
0;JMP // 3856
(Memory.add_node.GT.22)
D=!D // 3857
@SP // 3858
AM=M-1 // 3859
D=D&M // 3860
D=!D // 3861
@WHILE_END_Memory.add_node1 // 3862
D;JNE // 3863

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3864
A=M // 3865
D=M // 3866
@LCL // 3867
A=M+1 // 3868
M=D // 3869

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

@LCL // 3870
A=M // 3871
D=M // 3872
@3 // 3873
A=D+A // 3874
D=M // 3875
@LCL // 3876
A=M // 3877
M=D // 3878

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 3879
0;JMP // 3880

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL // 3881
A=M+1 // 3882
D=M // 3883
@Memory.add_node.IfElse2 // 3884
D;JNE // 3885

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
@ARG // 3886
A=M+1 // 3887
D=M // 3888
@3 // 3889
D=D+A // 3890
@SP // 3891
AM=M+1 // 3892
A=A-1 // 3893
M=D // 3894
@ARG // 3895
A=M // 3896
D=M // 3897
@0 // 3898
A=D+A // 3899
D=M // 3900
@SP // 3901
AM=M-1 // 3902
A=M // 3903
M=D // 3904

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
@ARG // 3905
A=M // 3906
D=M // 3907
@0 // 3908
D=D+A // 3909
@2 // 3910
D=D+A // 3911
@SP // 3912
AM=M+1 // 3913
A=A-1 // 3914
M=D // 3915
@ARG // 3916
A=M+1 // 3917
D=M // 3918
@SP // 3919
AM=M-1 // 3920
A=M // 3921
M=D // 3922

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3923
A=M // 3924
D=M // 3925
@SP // 3926
AM=M+1 // 3927
A=A-1 // 3928
M=D // 3929
@ARG // 3930
A=M+1 // 3931
D=M // 3932
@SP // 3933
AM=M-1 // 3934
A=M // 3935
M=D // 3936

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 3937
0;JMP // 3938

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
@ARG // 3939
A=M+1 // 3940
D=M // 3941
@3 // 3942
D=D+A // 3943
@SP // 3944
AM=M+1 // 3945
A=A-1 // 3946
M=D // 3947
@LCL // 3948
A=M // 3949
D=M // 3950
@SP // 3951
AM=M-1 // 3952
A=M // 3953
M=D // 3954

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3955
A=M+1 // 3956
D=M // 3957
@2 // 3958
D=D+A // 3959
@SP // 3960
AM=M+1 // 3961
A=A-1 // 3962
M=D // 3963
@LCL // 3964
A=M+1 // 3965
D=M // 3966
@SP // 3967
AM=M-1 // 3968
A=M // 3969
M=D // 3970

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 0"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@LCL // 3971
A=M // 3972
D=!M // 3973
@Memory.add_node.IfElse3 // 3974
D;JNE // 3975

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 3976
A=M // 3977
D=M // 3978
@2 // 3979
D=D+A // 3980
@SP // 3981
AM=M+1 // 3982
A=A-1 // 3983
M=D // 3984
@ARG // 3985
A=M+1 // 3986
D=M // 3987
@SP // 3988
AM=M-1 // 3989
A=M // 3990
M=D // 3991

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 3992
0;JMP // 3993

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
@LCL // 3994
A=M+1 // 3995
D=M // 3996
@3 // 3997
D=D+A // 3998
@SP // 3999
AM=M+1 // 4000
A=A-1 // 4001
M=D // 4002
@ARG // 4003
A=M+1 // 4004
D=M // 4005
@SP // 4006
AM=M-1 // 4007
A=M // 4008
M=D // 4009

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 4010
AM=M+1 // 4011
A=A-1 // 4012
M=0 // 4013
@RETURN // 4014
0;JMP // 4015

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
@ARG // 4016
A=M // 4017
D=M // 4018
@SP // 4019
AM=M+1 // 4020
A=A-1 // 4021
M=D // 4022
@ARG // 4023
A=M+1 // 4024
D=M // 4025
@SP // 4026
AM=M-1 // 4027
A=M // 4028
M=D // 4029

////PushInstruction("constant 0")
@SP // 4030
AM=M+1 // 4031
A=A-1 // 4032
M=0 // 4033
@RETURN // 4034
0;JMP // 4035

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
@ARG // 4036
A=M // 4037
D=M // 4038
@0 // 4039
A=D+A // 4040
D=M // 4041
@SP // 4042
AM=M+1 // 4043
A=A-1 // 4044
M=D // 4045
@RETURN // 4046
0;JMP // 4047

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 4048
D=A // 4049
@14 // 4050
M=D // 4051
@Output.initMap // 4052
D=A // 4053
@13 // 4054
M=D // 4055
@Output.init.ret.0 // 4056
D=A // 4057
@CALL // 4058
0;JMP // 4059
(Output.init.ret.0)
@SP // 4060
M=M-1 // 4061

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 4062
M=0 // 4063

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 4064
M=0 // 4065

////PushInstruction("constant 0")
@SP // 4066
AM=M+1 // 4067
A=A-1 // 4068
M=0 // 4069
@RETURN // 4070
0;JMP // 4071

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4072
AM=M+1 // 4073
A=A-1 // 4074
M=0 // 4075

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4076
D=A // 4077
@SP // 4078
AM=M+1 // 4079
A=A-1 // 4080
M=D // 4081
// call Array.new
@6 // 4082
D=A // 4083
@14 // 4084
M=D // 4085
@Array.new // 4086
D=A // 4087
@13 // 4088
M=D // 4089
@Output.initMap.ret.0 // 4090
D=A // 4091
@CALL // 4092
0;JMP // 4093
(Output.initMap.ret.0)
@SP // 4094
AM=M-1 // 4095
D=M // 4096
@Output.0 // 4097
M=D // 4098

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4099
D=A // 4100
@SP // 4101
M=D+M // 4102
@63 // 4103
D=A // 4104
@SP // 4105
A=M-1 // 4106
M=0 // 4107
A=A-1 // 4108
M=0 // 4109
A=A-1 // 4110
M=D // 4111
A=A-1 // 4112
M=D // 4113
A=A-1 // 4114
M=D // 4115
A=A-1 // 4116
M=D // 4117
A=A-1 // 4118
M=D // 4119
A=A-1 // 4120
M=D // 4121
A=A-1 // 4122
M=D // 4123
A=A-1 // 4124
M=D // 4125
A=A-1 // 4126
M=D // 4127
A=A-1 // 4128
M=0 // 4129
// call Output.create
@17 // 4130
D=A // 4131
@14 // 4132
M=D // 4133
@Output.create // 4134
D=A // 4135
@13 // 4136
M=D // 4137
@Output.initMap.ret.1 // 4138
D=A // 4139
@CALL // 4140
0;JMP // 4141
(Output.initMap.ret.1)
@SP // 4142
M=M-1 // 4143

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4144
D=A // 4145
@SP // 4146
M=D+M // 4147
@32 // 4148
D=A // 4149
@SP // 4150
A=M-1 // 4151
M=0 // 4152
A=A-1 // 4153
M=0 // 4154
A=A-1 // 4155
M=0 // 4156
A=A-1 // 4157
M=0 // 4158
A=A-1 // 4159
M=0 // 4160
A=A-1 // 4161
M=0 // 4162
A=A-1 // 4163
M=0 // 4164
A=A-1 // 4165
M=0 // 4166
A=A-1 // 4167
M=0 // 4168
A=A-1 // 4169
M=0 // 4170
A=A-1 // 4171
M=0 // 4172
A=A-1 // 4173
M=D // 4174
A=A-1 // 4175
// call Output.create
@17 // 4176
D=A // 4177
@14 // 4178
M=D // 4179
@Output.create // 4180
D=A // 4181
@13 // 4182
M=D // 4183
@Output.initMap.ret.2 // 4184
D=A // 4185
@CALL // 4186
0;JMP // 4187
(Output.initMap.ret.2)
@SP // 4188
M=M-1 // 4189

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4190
D=A // 4191
@SP // 4192
AM=M+1 // 4193
A=A-1 // 4194
M=D // 4195
@12 // 4196
D=A // 4197
@SP // 4198
AM=M+1 // 4199
A=A-1 // 4200
M=D // 4201
@30 // 4202
D=A // 4203
@SP // 4204
AM=M+1 // 4205
A=A-1 // 4206
M=D // 4207
@30 // 4208
D=A // 4209
@SP // 4210
AM=M+1 // 4211
A=A-1 // 4212
M=D // 4213
@30 // 4214
D=A // 4215
@SP // 4216
AM=M+1 // 4217
A=A-1 // 4218
M=D // 4219
@12 // 4220
D=A // 4221
@SP // 4222
AM=M+1 // 4223
A=A-1 // 4224
M=D // 4225
@12 // 4226
D=A // 4227
@SP // 4228
AM=M+1 // 4229
A=A-1 // 4230
M=D // 4231
@SP // 4232
AM=M+1 // 4233
A=A-1 // 4234
M=0 // 4235
@4 // 4236
D=A // 4237
@SP // 4238
M=D+M // 4239
@12 // 4240
D=A // 4241
@SP // 4242
A=M-1 // 4243
M=0 // 4244
A=A-1 // 4245
M=0 // 4246
A=A-1 // 4247
M=D // 4248
A=A-1 // 4249
M=D // 4250
A=A-1 // 4251
// call Output.create
@17 // 4252
D=A // 4253
@14 // 4254
M=D // 4255
@Output.create // 4256
D=A // 4257
@13 // 4258
M=D // 4259
@Output.initMap.ret.3 // 4260
D=A // 4261
@CALL // 4262
0;JMP // 4263
(Output.initMap.ret.3)
@SP // 4264
M=M-1 // 4265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4266
D=A // 4267
@SP // 4268
AM=M+1 // 4269
A=A-1 // 4270
M=D // 4271
@54 // 4272
D=A // 4273
@SP // 4274
AM=M+1 // 4275
A=A-1 // 4276
M=D // 4277
@54 // 4278
D=A // 4279
@SP // 4280
AM=M+1 // 4281
A=A-1 // 4282
M=D // 4283
@20 // 4284
D=A // 4285
@SP // 4286
AM=M+1 // 4287
A=A-1 // 4288
M=D // 4289
@SP // 4290
AM=M+1 // 4291
A=A-1 // 4292
M=0 // 4293
@SP // 4294
AM=M+1 // 4295
A=A-1 // 4296
M=0 // 4297
@SP // 4298
AM=M+1 // 4299
A=A-1 // 4300
M=0 // 4301
@SP // 4302
AM=M+1 // 4303
A=A-1 // 4304
M=0 // 4305
@SP // 4306
AM=M+1 // 4307
A=A-1 // 4308
M=0 // 4309
@SP // 4310
AM=M+1 // 4311
A=A-1 // 4312
M=0 // 4313
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
@Output.initMap.ret.4 // 4330
D=A // 4331
@CALL // 4332
0;JMP // 4333
(Output.initMap.ret.4)
@SP // 4334
M=M-1 // 4335

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4336
D=A // 4337
@SP // 4338
M=D+M // 4339
@35 // 4340
D=A // 4341
@SP // 4342
A=M-1 // 4343
M=0 // 4344
A=A-1 // 4345
M=D // 4346
A=A-1 // 4347
@18 // 4348
D=A // 4349
@SP // 4350
AM=M+1 // 4351
A=A-1 // 4352
M=D // 4353
@18 // 4354
D=A // 4355
@SP // 4356
AM=M+1 // 4357
A=A-1 // 4358
M=D // 4359
@63 // 4360
D=A // 4361
@SP // 4362
AM=M+1 // 4363
A=A-1 // 4364
M=D // 4365
@18 // 4366
D=A // 4367
@SP // 4368
AM=M+1 // 4369
A=A-1 // 4370
M=D // 4371
@18 // 4372
D=A // 4373
@SP // 4374
AM=M+1 // 4375
A=A-1 // 4376
M=D // 4377
@63 // 4378
D=A // 4379
@SP // 4380
AM=M+1 // 4381
A=A-1 // 4382
M=D // 4383
@18 // 4384
D=A // 4385
@SP // 4386
AM=M+1 // 4387
A=A-1 // 4388
M=D // 4389
@18 // 4390
D=A // 4391
@SP // 4392
AM=M+1 // 4393
A=A-1 // 4394
M=D // 4395
@SP // 4396
AM=M+1 // 4397
A=A-1 // 4398
M=0 // 4399
@SP // 4400
AM=M+1 // 4401
A=A-1 // 4402
M=0 // 4403
// call Output.create
@17 // 4404
D=A // 4405
@14 // 4406
M=D // 4407
@Output.create // 4408
D=A // 4409
@13 // 4410
M=D // 4411
@Output.initMap.ret.5 // 4412
D=A // 4413
@CALL // 4414
0;JMP // 4415
(Output.initMap.ret.5)
@SP // 4416
M=M-1 // 4417

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4418
D=A // 4419
@SP // 4420
AM=M+1 // 4421
A=A-1 // 4422
M=D // 4423
@12 // 4424
D=A // 4425
@SP // 4426
AM=M+1 // 4427
A=A-1 // 4428
M=D // 4429
@30 // 4430
D=A // 4431
@SP // 4432
AM=M+1 // 4433
A=A-1 // 4434
M=D // 4435
@51 // 4436
D=A // 4437
@SP // 4438
AM=M+1 // 4439
A=A-1 // 4440
M=D // 4441
@3 // 4442
D=A // 4443
@SP // 4444
AM=M+1 // 4445
A=A-1 // 4446
M=D // 4447
@30 // 4448
D=A // 4449
@SP // 4450
AM=M+1 // 4451
A=A-1 // 4452
M=D // 4453
@48 // 4454
D=A // 4455
@SP // 4456
AM=M+1 // 4457
A=A-1 // 4458
M=D // 4459
@51 // 4460
D=A // 4461
@SP // 4462
AM=M+1 // 4463
A=A-1 // 4464
M=D // 4465
@30 // 4466
D=A // 4467
@SP // 4468
AM=M+1 // 4469
A=A-1 // 4470
M=D // 4471
@12 // 4472
D=A // 4473
@SP // 4474
AM=M+1 // 4475
A=A-1 // 4476
M=D // 4477
@12 // 4478
D=A // 4479
@SP // 4480
AM=M+1 // 4481
A=A-1 // 4482
M=D // 4483
@SP // 4484
AM=M+1 // 4485
A=A-1 // 4486
M=0 // 4487
// call Output.create
@17 // 4488
D=A // 4489
@14 // 4490
M=D // 4491
@Output.create // 4492
D=A // 4493
@13 // 4494
M=D // 4495
@Output.initMap.ret.6 // 4496
D=A // 4497
@CALL // 4498
0;JMP // 4499
(Output.initMap.ret.6)
@SP // 4500
M=M-1 // 4501

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4502
D=A // 4503
@SP // 4504
M=D+M // 4505
@37 // 4506
D=A // 4507
@SP // 4508
A=M-1 // 4509
M=0 // 4510
A=A-1 // 4511
M=0 // 4512
A=A-1 // 4513
M=D // 4514
A=A-1 // 4515
@35 // 4516
D=A // 4517
@SP // 4518
AM=M+1 // 4519
A=A-1 // 4520
M=D // 4521
@51 // 4522
D=A // 4523
@SP // 4524
AM=M+1 // 4525
A=A-1 // 4526
M=D // 4527
@24 // 4528
D=A // 4529
@SP // 4530
AM=M+1 // 4531
A=A-1 // 4532
M=D // 4533
@12 // 4534
D=A // 4535
@SP // 4536
AM=M+1 // 4537
A=A-1 // 4538
M=D // 4539
@6 // 4540
D=A // 4541
@SP // 4542
AM=M+1 // 4543
A=A-1 // 4544
M=D // 4545
@51 // 4546
D=A // 4547
@SP // 4548
AM=M+1 // 4549
A=A-1 // 4550
M=D // 4551
@49 // 4552
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
@Output.initMap.ret.7 // 4574
D=A // 4575
@CALL // 4576
0;JMP // 4577
(Output.initMap.ret.7)
@SP // 4578
M=M-1 // 4579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4580
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
@30 // 4592
D=A // 4593
@SP // 4594
AM=M+1 // 4595
A=A-1 // 4596
M=D // 4597
@30 // 4598
D=A // 4599
@SP // 4600
AM=M+1 // 4601
A=A-1 // 4602
M=D // 4603
@12 // 4604
D=A // 4605
@SP // 4606
AM=M+1 // 4607
A=A-1 // 4608
M=D // 4609
@54 // 4610
D=A // 4611
@SP // 4612
AM=M+1 // 4613
A=A-1 // 4614
M=D // 4615
@27 // 4616
D=A // 4617
@SP // 4618
AM=M+1 // 4619
A=A-1 // 4620
M=D // 4621
@27 // 4622
D=A // 4623
@SP // 4624
AM=M+1 // 4625
A=A-1 // 4626
M=D // 4627
@27 // 4628
D=A // 4629
@SP // 4630
AM=M+1 // 4631
A=A-1 // 4632
M=D // 4633
@54 // 4634
D=A // 4635
@SP // 4636
AM=M+1 // 4637
A=A-1 // 4638
M=D // 4639
@SP // 4640
AM=M+1 // 4641
A=A-1 // 4642
M=0 // 4643
@SP // 4644
AM=M+1 // 4645
A=A-1 // 4646
M=0 // 4647
// call Output.create
@17 // 4648
D=A // 4649
@14 // 4650
M=D // 4651
@Output.create // 4652
D=A // 4653
@13 // 4654
M=D // 4655
@Output.initMap.ret.8 // 4656
D=A // 4657
@CALL // 4658
0;JMP // 4659
(Output.initMap.ret.8)
@SP // 4660
M=M-1 // 4661

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4662
D=A // 4663
@SP // 4664
AM=M+1 // 4665
A=A-1 // 4666
M=D // 4667
@12 // 4668
D=A // 4669
@SP // 4670
AM=M+1 // 4671
A=A-1 // 4672
M=D // 4673
@12 // 4674
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
@SP // 4686
AM=M+1 // 4687
A=A-1 // 4688
M=0 // 4689
@SP // 4690
AM=M+1 // 4691
A=A-1 // 4692
M=0 // 4693
@SP // 4694
AM=M+1 // 4695
A=A-1 // 4696
M=0 // 4697
@SP // 4698
AM=M+1 // 4699
A=A-1 // 4700
M=0 // 4701
@SP // 4702
AM=M+1 // 4703
A=A-1 // 4704
M=0 // 4705
@SP // 4706
AM=M+1 // 4707
A=A-1 // 4708
M=0 // 4709
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
@Output.initMap.ret.9 // 4726
D=A // 4727
@CALL // 4728
0;JMP // 4729
(Output.initMap.ret.9)
@SP // 4730
M=M-1 // 4731

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4732
D=A // 4733
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=D // 4737
@24 // 4738
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
@6 // 4750
D=A // 4751
@SP // 4752
AM=M+1 // 4753
A=A-1 // 4754
M=D // 4755
@6 // 4756
D=A // 4757
@SP // 4758
AM=M+1 // 4759
A=A-1 // 4760
M=D // 4761
@6 // 4762
D=A // 4763
@SP // 4764
AM=M+1 // 4765
A=A-1 // 4766
M=D // 4767
@6 // 4768
D=A // 4769
@SP // 4770
AM=M+1 // 4771
A=A-1 // 4772
M=D // 4773
@6 // 4774
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
@24 // 4786
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
@Output.initMap.ret.10 // 4808
D=A // 4809
@CALL // 4810
0;JMP // 4811
(Output.initMap.ret.10)
@SP // 4812
M=M-1 // 4813

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4814
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
@12 // 4826
D=A // 4827
@SP // 4828
AM=M+1 // 4829
A=A-1 // 4830
M=D // 4831
@24 // 4832
D=A // 4833
@SP // 4834
AM=M+1 // 4835
A=A-1 // 4836
M=D // 4837
@24 // 4838
D=A // 4839
@SP // 4840
AM=M+1 // 4841
A=A-1 // 4842
M=D // 4843
@24 // 4844
D=A // 4845
@SP // 4846
AM=M+1 // 4847
A=A-1 // 4848
M=D // 4849
@24 // 4850
D=A // 4851
@SP // 4852
AM=M+1 // 4853
A=A-1 // 4854
M=D // 4855
@24 // 4856
D=A // 4857
@SP // 4858
AM=M+1 // 4859
A=A-1 // 4860
M=D // 4861
@12 // 4862
D=A // 4863
@SP // 4864
AM=M+1 // 4865
A=A-1 // 4866
M=D // 4867
@6 // 4868
D=A // 4869
@SP // 4870
AM=M+1 // 4871
A=A-1 // 4872
M=D // 4873
@SP // 4874
AM=M+1 // 4875
A=A-1 // 4876
M=0 // 4877
@SP // 4878
AM=M+1 // 4879
A=A-1 // 4880
M=0 // 4881
// call Output.create
@17 // 4882
D=A // 4883
@14 // 4884
M=D // 4885
@Output.create // 4886
D=A // 4887
@13 // 4888
M=D // 4889
@Output.initMap.ret.11 // 4890
D=A // 4891
@CALL // 4892
0;JMP // 4893
(Output.initMap.ret.11)
@SP // 4894
M=M-1 // 4895

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4896
D=A // 4897
@SP // 4898
M=D+M // 4899
@42 // 4900
D=A // 4901
@SP // 4902
A=M-1 // 4903
M=0 // 4904
A=A-1 // 4905
M=0 // 4906
A=A-1 // 4907
M=0 // 4908
A=A-1 // 4909
M=D // 4910
A=A-1 // 4911
@51 // 4912
D=A // 4913
@SP // 4914
AM=M+1 // 4915
A=A-1 // 4916
M=D // 4917
@30 // 4918
D=A // 4919
@SP // 4920
AM=M+1 // 4921
A=A-1 // 4922
M=D // 4923
@63 // 4924
D=A // 4925
@SP // 4926
AM=M+1 // 4927
A=A-1 // 4928
M=D // 4929
@30 // 4930
D=A // 4931
@SP // 4932
AM=M+1 // 4933
A=A-1 // 4934
M=D // 4935
@51 // 4936
D=A // 4937
@SP // 4938
AM=M+1 // 4939
A=A-1 // 4940
M=D // 4941
@SP // 4942
AM=M+1 // 4943
A=A-1 // 4944
M=0 // 4945
@SP // 4946
AM=M+1 // 4947
A=A-1 // 4948
M=0 // 4949
@SP // 4950
AM=M+1 // 4951
A=A-1 // 4952
M=0 // 4953
// call Output.create
@17 // 4954
D=A // 4955
@14 // 4956
M=D // 4957
@Output.create // 4958
D=A // 4959
@13 // 4960
M=D // 4961
@Output.initMap.ret.12 // 4962
D=A // 4963
@CALL // 4964
0;JMP // 4965
(Output.initMap.ret.12)
@SP // 4966
M=M-1 // 4967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4968
D=A // 4969
@SP // 4970
M=D+M // 4971
@43 // 4972
D=A // 4973
@SP // 4974
A=M-1 // 4975
M=0 // 4976
A=A-1 // 4977
M=0 // 4978
A=A-1 // 4979
M=0 // 4980
A=A-1 // 4981
M=D // 4982
A=A-1 // 4983
@12 // 4984
D=A // 4985
@SP // 4986
AM=M+1 // 4987
A=A-1 // 4988
M=D // 4989
@12 // 4990
D=A // 4991
@SP // 4992
AM=M+1 // 4993
A=A-1 // 4994
M=D // 4995
@63 // 4996
D=A // 4997
@SP // 4998
AM=M+1 // 4999
A=A-1 // 5000
M=D // 5001
@12 // 5002
D=A // 5003
@SP // 5004
AM=M+1 // 5005
A=A-1 // 5006
M=D // 5007
@12 // 5008
D=A // 5009
@SP // 5010
AM=M+1 // 5011
A=A-1 // 5012
M=D // 5013
@SP // 5014
AM=M+1 // 5015
A=A-1 // 5016
M=0 // 5017
@SP // 5018
AM=M+1 // 5019
A=A-1 // 5020
M=0 // 5021
@SP // 5022
AM=M+1 // 5023
A=A-1 // 5024
M=0 // 5025
// call Output.create
@17 // 5026
D=A // 5027
@14 // 5028
M=D // 5029
@Output.create // 5030
D=A // 5031
@13 // 5032
M=D // 5033
@Output.initMap.ret.13 // 5034
D=A // 5035
@CALL // 5036
0;JMP // 5037
(Output.initMap.ret.13)
@SP // 5038
M=M-1 // 5039

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5040
D=A // 5041
@SP // 5042
M=D+M // 5043
@44 // 5044
D=A // 5045
@SP // 5046
A=M-1 // 5047
M=0 // 5048
A=A-1 // 5049
M=0 // 5050
A=A-1 // 5051
M=0 // 5052
A=A-1 // 5053
M=0 // 5054
A=A-1 // 5055
M=0 // 5056
A=A-1 // 5057
M=0 // 5058
A=A-1 // 5059
M=0 // 5060
A=A-1 // 5061
M=D // 5062
A=A-1 // 5063
@12 // 5064
D=A // 5065
@SP // 5066
AM=M+1 // 5067
A=A-1 // 5068
M=D // 5069
@12 // 5070
D=A // 5071
@SP // 5072
AM=M+1 // 5073
A=A-1 // 5074
M=D // 5075
@6 // 5076
D=A // 5077
@SP // 5078
AM=M+1 // 5079
A=A-1 // 5080
M=D // 5081
@SP // 5082
AM=M+1 // 5083
A=A-1 // 5084
M=0 // 5085
// call Output.create
@17 // 5086
D=A // 5087
@14 // 5088
M=D // 5089
@Output.create // 5090
D=A // 5091
@13 // 5092
M=D // 5093
@Output.initMap.ret.14 // 5094
D=A // 5095
@CALL // 5096
0;JMP // 5097
(Output.initMap.ret.14)
@SP // 5098
M=M-1 // 5099

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5100
D=A // 5101
@SP // 5102
M=D+M // 5103
@45 // 5104
D=A // 5105
@SP // 5106
A=M-1 // 5107
M=0 // 5108
A=A-1 // 5109
M=0 // 5110
A=A-1 // 5111
M=0 // 5112
A=A-1 // 5113
M=0 // 5114
A=A-1 // 5115
M=0 // 5116
A=A-1 // 5117
M=D // 5118
A=A-1 // 5119
@6 // 5120
D=A // 5121
@SP // 5122
M=D+M // 5123
@63 // 5124
D=A // 5125
@SP // 5126
A=M-1 // 5127
M=0 // 5128
A=A-1 // 5129
M=0 // 5130
A=A-1 // 5131
M=0 // 5132
A=A-1 // 5133
M=0 // 5134
A=A-1 // 5135
M=0 // 5136
A=A-1 // 5137
M=D // 5138
A=A-1 // 5139
// call Output.create
@17 // 5140
D=A // 5141
@14 // 5142
M=D // 5143
@Output.create // 5144
D=A // 5145
@13 // 5146
M=D // 5147
@Output.initMap.ret.15 // 5148
D=A // 5149
@CALL // 5150
0;JMP // 5151
(Output.initMap.ret.15)
@SP // 5152
M=M-1 // 5153

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5154
D=A // 5155
@SP // 5156
M=D+M // 5157
@46 // 5158
D=A // 5159
@SP // 5160
A=M-1 // 5161
M=0 // 5162
A=A-1 // 5163
M=0 // 5164
A=A-1 // 5165
M=0 // 5166
A=A-1 // 5167
M=0 // 5168
A=A-1 // 5169
M=0 // 5170
A=A-1 // 5171
M=0 // 5172
A=A-1 // 5173
M=0 // 5174
A=A-1 // 5175
M=D // 5176
A=A-1 // 5177
@4 // 5178
D=A // 5179
@SP // 5180
M=D+M // 5181
@12 // 5182
D=A // 5183
@SP // 5184
A=M-1 // 5185
M=0 // 5186
A=A-1 // 5187
M=0 // 5188
A=A-1 // 5189
M=D // 5190
A=A-1 // 5191
M=D // 5192
A=A-1 // 5193
// call Output.create
@17 // 5194
D=A // 5195
@14 // 5196
M=D // 5197
@Output.create // 5198
D=A // 5199
@13 // 5200
M=D // 5201
@Output.initMap.ret.16 // 5202
D=A // 5203
@CALL // 5204
0;JMP // 5205
(Output.initMap.ret.16)
@SP // 5206
M=M-1 // 5207

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5208
D=A // 5209
@SP // 5210
M=D+M // 5211
@47 // 5212
D=A // 5213
@SP // 5214
A=M-1 // 5215
M=0 // 5216
A=A-1 // 5217
M=0 // 5218
A=A-1 // 5219
M=D // 5220
A=A-1 // 5221
@32 // 5222
D=A // 5223
@SP // 5224
AM=M+1 // 5225
A=A-1 // 5226
M=D // 5227
@48 // 5228
D=A // 5229
@SP // 5230
AM=M+1 // 5231
A=A-1 // 5232
M=D // 5233
@24 // 5234
D=A // 5235
@SP // 5236
AM=M+1 // 5237
A=A-1 // 5238
M=D // 5239
@12 // 5240
D=A // 5241
@SP // 5242
AM=M+1 // 5243
A=A-1 // 5244
M=D // 5245
@6 // 5246
D=A // 5247
@SP // 5248
AM=M+1 // 5249
A=A-1 // 5250
M=D // 5251
@3 // 5252
D=A // 5253
@SP // 5254
AM=M+1 // 5255
A=A-1 // 5256
M=D // 5257
@SP // 5258
AM=M+1 // 5259
A=A-1 // 5260
M=1 // 5261
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
@Output.initMap.ret.17 // 5278
D=A // 5279
@CALL // 5280
0;JMP // 5281
(Output.initMap.ret.17)
@SP // 5282
M=M-1 // 5283

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5284
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
@30 // 5296
D=A // 5297
@SP // 5298
AM=M+1 // 5299
A=A-1 // 5300
M=D // 5301
@51 // 5302
D=A // 5303
@SP // 5304
AM=M+1 // 5305
A=A-1 // 5306
M=D // 5307
@51 // 5308
D=A // 5309
@SP // 5310
AM=M+1 // 5311
A=A-1 // 5312
M=D // 5313
@51 // 5314
D=A // 5315
@SP // 5316
AM=M+1 // 5317
A=A-1 // 5318
M=D // 5319
@51 // 5320
D=A // 5321
@SP // 5322
AM=M+1 // 5323
A=A-1 // 5324
M=D // 5325
@51 // 5326
D=A // 5327
@SP // 5328
AM=M+1 // 5329
A=A-1 // 5330
M=D // 5331
@30 // 5332
D=A // 5333
@SP // 5334
AM=M+1 // 5335
A=A-1 // 5336
M=D // 5337
@12 // 5338
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
@Output.initMap.ret.18 // 5360
D=A // 5361
@CALL // 5362
0;JMP // 5363
(Output.initMap.ret.18)
@SP // 5364
M=M-1 // 5365

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5366
D=A // 5367
@SP // 5368
AM=M+1 // 5369
A=A-1 // 5370
M=D // 5371
@12 // 5372
D=A // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377
@14 // 5378
D=A // 5379
@SP // 5380
AM=M+1 // 5381
A=A-1 // 5382
M=D // 5383
@15 // 5384
D=A // 5385
@SP // 5386
AM=M+1 // 5387
A=A-1 // 5388
M=D // 5389
@12 // 5390
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
@12 // 5402
D=A // 5403
@SP // 5404
AM=M+1 // 5405
A=A-1 // 5406
M=D // 5407
@12 // 5408
D=A // 5409
@SP // 5410
AM=M+1 // 5411
A=A-1 // 5412
M=D // 5413
@12 // 5414
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
@Output.initMap.ret.19 // 5442
D=A // 5443
@CALL // 5444
0;JMP // 5445
(Output.initMap.ret.19)
@SP // 5446
M=M-1 // 5447

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5448
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
@24 // 5472
D=A // 5473
@SP // 5474
AM=M+1 // 5475
A=A-1 // 5476
M=D // 5477
@12 // 5478
D=A // 5479
@SP // 5480
AM=M+1 // 5481
A=A-1 // 5482
M=D // 5483
@6 // 5484
D=A // 5485
@SP // 5486
AM=M+1 // 5487
A=A-1 // 5488
M=D // 5489
@3 // 5490
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
@63 // 5502
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
@Output.initMap.ret.20 // 5524
D=A // 5525
@CALL // 5526
0;JMP // 5527
(Output.initMap.ret.20)
@SP // 5528
M=M-1 // 5529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5530
D=A // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=D // 5535
@30 // 5536
D=A // 5537
@SP // 5538
AM=M+1 // 5539
A=A-1 // 5540
M=D // 5541
@51 // 5542
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
@48 // 5554
D=A // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=D // 5559
@28 // 5560
D=A // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=D // 5565
@48 // 5566
D=A // 5567
@SP // 5568
AM=M+1 // 5569
A=A-1 // 5570
M=D // 5571
@48 // 5572
D=A // 5573
@SP // 5574
AM=M+1 // 5575
A=A-1 // 5576
M=D // 5577
@51 // 5578
D=A // 5579
@SP // 5580
AM=M+1 // 5581
A=A-1 // 5582
M=D // 5583
@30 // 5584
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
@Output.initMap.ret.21 // 5606
D=A // 5607
@CALL // 5608
0;JMP // 5609
(Output.initMap.ret.21)
@SP // 5610
M=M-1 // 5611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5612
D=A // 5613
@SP // 5614
AM=M+1 // 5615
A=A-1 // 5616
M=D // 5617
@16 // 5618
D=A // 5619
@SP // 5620
AM=M+1 // 5621
A=A-1 // 5622
M=D // 5623
@24 // 5624
D=A // 5625
@SP // 5626
AM=M+1 // 5627
A=A-1 // 5628
M=D // 5629
@28 // 5630
D=A // 5631
@SP // 5632
AM=M+1 // 5633
A=A-1 // 5634
M=D // 5635
@26 // 5636
D=A // 5637
@SP // 5638
AM=M+1 // 5639
A=A-1 // 5640
M=D // 5641
@25 // 5642
D=A // 5643
@SP // 5644
AM=M+1 // 5645
A=A-1 // 5646
M=D // 5647
@63 // 5648
D=A // 5649
@SP // 5650
AM=M+1 // 5651
A=A-1 // 5652
M=D // 5653
@24 // 5654
D=A // 5655
@SP // 5656
AM=M+1 // 5657
A=A-1 // 5658
M=D // 5659
@24 // 5660
D=A // 5661
@SP // 5662
AM=M+1 // 5663
A=A-1 // 5664
M=D // 5665
@60 // 5666
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
@Output.initMap.ret.22 // 5688
D=A // 5689
@CALL // 5690
0;JMP // 5691
(Output.initMap.ret.22)
@SP // 5692
M=M-1 // 5693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5694
D=A // 5695
@SP // 5696
AM=M+1 // 5697
A=A-1 // 5698
M=D // 5699
@63 // 5700
D=A // 5701
@SP // 5702
AM=M+1 // 5703
A=A-1 // 5704
M=D // 5705
@3 // 5706
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
@31 // 5718
D=A // 5719
@SP // 5720
AM=M+1 // 5721
A=A-1 // 5722
M=D // 5723
@48 // 5724
D=A // 5725
@SP // 5726
AM=M+1 // 5727
A=A-1 // 5728
M=D // 5729
@48 // 5730
D=A // 5731
@SP // 5732
AM=M+1 // 5733
A=A-1 // 5734
M=D // 5735
@48 // 5736
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
@Output.initMap.ret.23 // 5770
D=A // 5771
@CALL // 5772
0;JMP // 5773
(Output.initMap.ret.23)
@SP // 5774
M=M-1 // 5775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5776
D=A // 5777
@SP // 5778
AM=M+1 // 5779
A=A-1 // 5780
M=D // 5781
@28 // 5782
D=A // 5783
@SP // 5784
AM=M+1 // 5785
A=A-1 // 5786
M=D // 5787
@6 // 5788
D=A // 5789
@SP // 5790
AM=M+1 // 5791
A=A-1 // 5792
M=D // 5793
@3 // 5794
D=A // 5795
@SP // 5796
AM=M+1 // 5797
A=A-1 // 5798
M=D // 5799
@3 // 5800
D=A // 5801
@SP // 5802
AM=M+1 // 5803
A=A-1 // 5804
M=D // 5805
@31 // 5806
D=A // 5807
@SP // 5808
AM=M+1 // 5809
A=A-1 // 5810
M=D // 5811
@51 // 5812
D=A // 5813
@SP // 5814
AM=M+1 // 5815
A=A-1 // 5816
M=D // 5817
@51 // 5818
D=A // 5819
@SP // 5820
AM=M+1 // 5821
A=A-1 // 5822
M=D // 5823
@51 // 5824
D=A // 5825
@SP // 5826
AM=M+1 // 5827
A=A-1 // 5828
M=D // 5829
@30 // 5830
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
@Output.initMap.ret.24 // 5852
D=A // 5853
@CALL // 5854
0;JMP // 5855
(Output.initMap.ret.24)
@SP // 5856
M=M-1 // 5857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 5858
D=A // 5859
@SP // 5860
AM=M+1 // 5861
A=A-1 // 5862
M=D // 5863
@63 // 5864
D=A // 5865
@SP // 5866
AM=M+1 // 5867
A=A-1 // 5868
M=D // 5869
@49 // 5870
D=A // 5871
@SP // 5872
AM=M+1 // 5873
A=A-1 // 5874
M=D // 5875
@48 // 5876
D=A // 5877
@SP // 5878
AM=M+1 // 5879
A=A-1 // 5880
M=D // 5881
@48 // 5882
D=A // 5883
@SP // 5884
AM=M+1 // 5885
A=A-1 // 5886
M=D // 5887
@24 // 5888
D=A // 5889
@SP // 5890
AM=M+1 // 5891
A=A-1 // 5892
M=D // 5893
@12 // 5894
D=A // 5895
@SP // 5896
AM=M+1 // 5897
A=A-1 // 5898
M=D // 5899
@12 // 5900
D=A // 5901
@SP // 5902
AM=M+1 // 5903
A=A-1 // 5904
M=D // 5905
@12 // 5906
D=A // 5907
@SP // 5908
AM=M+1 // 5909
A=A-1 // 5910
M=D // 5911
@12 // 5912
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
@Output.initMap.ret.25 // 5934
D=A // 5935
@CALL // 5936
0;JMP // 5937
(Output.initMap.ret.25)
@SP // 5938
M=M-1 // 5939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 5940
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
@30 // 5970
D=A // 5971
@SP // 5972
AM=M+1 // 5973
A=A-1 // 5974
M=D // 5975
@51 // 5976
D=A // 5977
@SP // 5978
AM=M+1 // 5979
A=A-1 // 5980
M=D // 5981
@51 // 5982
D=A // 5983
@SP // 5984
AM=M+1 // 5985
A=A-1 // 5986
M=D // 5987
@51 // 5988
D=A // 5989
@SP // 5990
AM=M+1 // 5991
A=A-1 // 5992
M=D // 5993
@30 // 5994
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
@Output.initMap.ret.26 // 6016
D=A // 6017
@CALL // 6018
0;JMP // 6019
(Output.initMap.ret.26)
@SP // 6020
M=M-1 // 6021

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6022
D=A // 6023
@SP // 6024
AM=M+1 // 6025
A=A-1 // 6026
M=D // 6027
@30 // 6028
D=A // 6029
@SP // 6030
AM=M+1 // 6031
A=A-1 // 6032
M=D // 6033
@51 // 6034
D=A // 6035
@SP // 6036
AM=M+1 // 6037
A=A-1 // 6038
M=D // 6039
@51 // 6040
D=A // 6041
@SP // 6042
AM=M+1 // 6043
A=A-1 // 6044
M=D // 6045
@51 // 6046
D=A // 6047
@SP // 6048
AM=M+1 // 6049
A=A-1 // 6050
M=D // 6051
@62 // 6052
D=A // 6053
@SP // 6054
AM=M+1 // 6055
A=A-1 // 6056
M=D // 6057
@48 // 6058
D=A // 6059
@SP // 6060
AM=M+1 // 6061
A=A-1 // 6062
M=D // 6063
@48 // 6064
D=A // 6065
@SP // 6066
AM=M+1 // 6067
A=A-1 // 6068
M=D // 6069
@24 // 6070
D=A // 6071
@SP // 6072
AM=M+1 // 6073
A=A-1 // 6074
M=D // 6075
@14 // 6076
D=A // 6077
@SP // 6078
AM=M+1 // 6079
A=A-1 // 6080
M=D // 6081
@SP // 6082
AM=M+1 // 6083
A=A-1 // 6084
M=0 // 6085
@SP // 6086
AM=M+1 // 6087
A=A-1 // 6088
M=0 // 6089
// call Output.create
@17 // 6090
D=A // 6091
@14 // 6092
M=D // 6093
@Output.create // 6094
D=A // 6095
@13 // 6096
M=D // 6097
@Output.initMap.ret.27 // 6098
D=A // 6099
@CALL // 6100
0;JMP // 6101
(Output.initMap.ret.27)
@SP // 6102
M=M-1 // 6103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6104
D=A // 6105
@SP // 6106
M=D+M // 6107
@58 // 6108
D=A // 6109
@SP // 6110
A=M-1 // 6111
M=0 // 6112
A=A-1 // 6113
M=0 // 6114
A=A-1 // 6115
M=D // 6116
A=A-1 // 6117
@4 // 6118
D=A // 6119
@SP // 6120
M=D+M // 6121
@12 // 6122
D=A // 6123
@SP // 6124
A=M-1 // 6125
M=0 // 6126
A=A-1 // 6127
M=0 // 6128
A=A-1 // 6129
M=D // 6130
A=A-1 // 6131
M=D // 6132
A=A-1 // 6133
@5 // 6134
D=A // 6135
@SP // 6136
M=D+M // 6137
@12 // 6138
D=A // 6139
@SP // 6140
A=M-1 // 6141
M=0 // 6142
A=A-1 // 6143
M=0 // 6144
A=A-1 // 6145
M=0 // 6146
A=A-1 // 6147
M=D // 6148
A=A-1 // 6149
M=D // 6150
A=A-1 // 6151
// call Output.create
@17 // 6152
D=A // 6153
@14 // 6154
M=D // 6155
@Output.create // 6156
D=A // 6157
@13 // 6158
M=D // 6159
@Output.initMap.ret.28 // 6160
D=A // 6161
@CALL // 6162
0;JMP // 6163
(Output.initMap.ret.28)
@SP // 6164
M=M-1 // 6165

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6166
D=A // 6167
@SP // 6168
M=D+M // 6169
@59 // 6170
D=A // 6171
@SP // 6172
A=M-1 // 6173
M=0 // 6174
A=A-1 // 6175
M=0 // 6176
A=A-1 // 6177
M=D // 6178
A=A-1 // 6179
@4 // 6180
D=A // 6181
@SP // 6182
M=D+M // 6183
@12 // 6184
D=A // 6185
@SP // 6186
A=M-1 // 6187
M=0 // 6188
A=A-1 // 6189
M=0 // 6190
A=A-1 // 6191
M=D // 6192
A=A-1 // 6193
M=D // 6194
A=A-1 // 6195
@12 // 6196
D=A // 6197
@SP // 6198
AM=M+1 // 6199
A=A-1 // 6200
M=D // 6201
@12 // 6202
D=A // 6203
@SP // 6204
AM=M+1 // 6205
A=A-1 // 6206
M=D // 6207
@6 // 6208
D=A // 6209
@SP // 6210
AM=M+1 // 6211
A=A-1 // 6212
M=D // 6213
@SP // 6214
AM=M+1 // 6215
A=A-1 // 6216
M=0 // 6217
@SP // 6218
AM=M+1 // 6219
A=A-1 // 6220
M=0 // 6221
// call Output.create
@17 // 6222
D=A // 6223
@14 // 6224
M=D // 6225
@Output.create // 6226
D=A // 6227
@13 // 6228
M=D // 6229
@Output.initMap.ret.29 // 6230
D=A // 6231
@CALL // 6232
0;JMP // 6233
(Output.initMap.ret.29)
@SP // 6234
M=M-1 // 6235

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6236
D=A // 6237
@SP // 6238
M=D+M // 6239
@60 // 6240
D=A // 6241
@SP // 6242
A=M-1 // 6243
M=0 // 6244
A=A-1 // 6245
M=0 // 6246
A=A-1 // 6247
M=D // 6248
A=A-1 // 6249
@24 // 6250
D=A // 6251
@SP // 6252
AM=M+1 // 6253
A=A-1 // 6254
M=D // 6255
@12 // 6256
D=A // 6257
@SP // 6258
AM=M+1 // 6259
A=A-1 // 6260
M=D // 6261
@6 // 6262
D=A // 6263
@SP // 6264
AM=M+1 // 6265
A=A-1 // 6266
M=D // 6267
@3 // 6268
D=A // 6269
@SP // 6270
AM=M+1 // 6271
A=A-1 // 6272
M=D // 6273
@6 // 6274
D=A // 6275
@SP // 6276
AM=M+1 // 6277
A=A-1 // 6278
M=D // 6279
@12 // 6280
D=A // 6281
@SP // 6282
AM=M+1 // 6283
A=A-1 // 6284
M=D // 6285
@24 // 6286
D=A // 6287
@SP // 6288
AM=M+1 // 6289
A=A-1 // 6290
M=D // 6291
@SP // 6292
AM=M+1 // 6293
A=A-1 // 6294
M=0 // 6295
@SP // 6296
AM=M+1 // 6297
A=A-1 // 6298
M=0 // 6299
// call Output.create
@17 // 6300
D=A // 6301
@14 // 6302
M=D // 6303
@Output.create // 6304
D=A // 6305
@13 // 6306
M=D // 6307
@Output.initMap.ret.30 // 6308
D=A // 6309
@CALL // 6310
0;JMP // 6311
(Output.initMap.ret.30)
@SP // 6312
M=M-1 // 6313

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6314
D=A // 6315
@SP // 6316
M=D+M // 6317
@61 // 6318
D=A // 6319
@SP // 6320
A=M-1 // 6321
M=0 // 6322
A=A-1 // 6323
M=0 // 6324
A=A-1 // 6325
M=0 // 6326
A=A-1 // 6327
M=D // 6328
A=A-1 // 6329
@3 // 6330
D=A // 6331
@SP // 6332
M=D+M // 6333
@63 // 6334
D=A // 6335
@SP // 6336
A=M-1 // 6337
M=0 // 6338
A=A-1 // 6339
M=0 // 6340
A=A-1 // 6341
M=D // 6342
A=A-1 // 6343
@5 // 6344
D=A // 6345
@SP // 6346
M=D+M // 6347
@63 // 6348
D=A // 6349
@SP // 6350
A=M-1 // 6351
M=0 // 6352
A=A-1 // 6353
M=0 // 6354
A=A-1 // 6355
M=0 // 6356
A=A-1 // 6357
M=0 // 6358
A=A-1 // 6359
M=D // 6360
A=A-1 // 6361
// call Output.create
@17 // 6362
D=A // 6363
@14 // 6364
M=D // 6365
@Output.create // 6366
D=A // 6367
@13 // 6368
M=D // 6369
@Output.initMap.ret.31 // 6370
D=A // 6371
@CALL // 6372
0;JMP // 6373
(Output.initMap.ret.31)
@SP // 6374
M=M-1 // 6375

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6376
D=A // 6377
@SP // 6378
M=D+M // 6379
@62 // 6380
D=A // 6381
@SP // 6382
A=M-1 // 6383
M=0 // 6384
A=A-1 // 6385
M=0 // 6386
A=A-1 // 6387
M=D // 6388
A=A-1 // 6389
@3 // 6390
D=A // 6391
@SP // 6392
AM=M+1 // 6393
A=A-1 // 6394
M=D // 6395
@6 // 6396
D=A // 6397
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=D // 6401
@12 // 6402
D=A // 6403
@SP // 6404
AM=M+1 // 6405
A=A-1 // 6406
M=D // 6407
@24 // 6408
D=A // 6409
@SP // 6410
AM=M+1 // 6411
A=A-1 // 6412
M=D // 6413
@12 // 6414
D=A // 6415
@SP // 6416
AM=M+1 // 6417
A=A-1 // 6418
M=D // 6419
@6 // 6420
D=A // 6421
@SP // 6422
AM=M+1 // 6423
A=A-1 // 6424
M=D // 6425
@3 // 6426
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
@Output.initMap.ret.32 // 6448
D=A // 6449
@CALL // 6450
0;JMP // 6451
(Output.initMap.ret.32)
@SP // 6452
M=M-1 // 6453

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6454
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
@59 // 6478
D=A // 6479
@SP // 6480
AM=M+1 // 6481
A=A-1 // 6482
M=D // 6483
@59 // 6484
D=A // 6485
@SP // 6486
AM=M+1 // 6487
A=A-1 // 6488
M=D // 6489
@59 // 6490
D=A // 6491
@SP // 6492
AM=M+1 // 6493
A=A-1 // 6494
M=D // 6495
@27 // 6496
D=A // 6497
@SP // 6498
AM=M+1 // 6499
A=A-1 // 6500
M=D // 6501
@3 // 6502
D=A // 6503
@SP // 6504
AM=M+1 // 6505
A=A-1 // 6506
M=D // 6507
@30 // 6508
D=A // 6509
@SP // 6510
AM=M+1 // 6511
A=A-1 // 6512
M=D // 6513
@SP // 6514
AM=M+1 // 6515
A=A-1 // 6516
M=0 // 6517
@SP // 6518
AM=M+1 // 6519
A=A-1 // 6520
M=0 // 6521
// call Output.create
@17 // 6522
D=A // 6523
@14 // 6524
M=D // 6525
@Output.create // 6526
D=A // 6527
@13 // 6528
M=D // 6529
@Output.initMap.ret.33 // 6530
D=A // 6531
@CALL // 6532
0;JMP // 6533
(Output.initMap.ret.33)
@SP // 6534
M=M-1 // 6535

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6536
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
@24 // 6560
D=A // 6561
@SP // 6562
AM=M+1 // 6563
A=A-1 // 6564
M=D // 6565
@12 // 6566
D=A // 6567
@SP // 6568
AM=M+1 // 6569
A=A-1 // 6570
M=D // 6571
@12 // 6572
D=A // 6573
@SP // 6574
AM=M+1 // 6575
A=A-1 // 6576
M=D // 6577
@SP // 6578
AM=M+1 // 6579
A=A-1 // 6580
M=0 // 6581
@4 // 6582
D=A // 6583
@SP // 6584
M=D+M // 6585
@12 // 6586
D=A // 6587
@SP // 6588
A=M-1 // 6589
M=0 // 6590
A=A-1 // 6591
M=0 // 6592
A=A-1 // 6593
M=D // 6594
A=A-1 // 6595
M=D // 6596
A=A-1 // 6597
// call Output.create
@17 // 6598
D=A // 6599
@14 // 6600
M=D // 6601
@Output.create // 6602
D=A // 6603
@13 // 6604
M=D // 6605
@Output.initMap.ret.34 // 6606
D=A // 6607
@CALL // 6608
0;JMP // 6609
(Output.initMap.ret.34)
@SP // 6610
M=M-1 // 6611

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6612
D=A // 6613
@SP // 6614
AM=M+1 // 6615
A=A-1 // 6616
M=D // 6617
@12 // 6618
D=A // 6619
@SP // 6620
AM=M+1 // 6621
A=A-1 // 6622
M=D // 6623
@30 // 6624
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
@63 // 6642
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
@51 // 6666
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
@Output.initMap.ret.35 // 6688
D=A // 6689
@CALL // 6690
0;JMP // 6691
(Output.initMap.ret.35)
@SP // 6692
M=M-1 // 6693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6694
D=A // 6695
@SP // 6696
AM=M+1 // 6697
A=A-1 // 6698
M=D // 6699
@31 // 6700
D=A // 6701
@SP // 6702
AM=M+1 // 6703
A=A-1 // 6704
M=D // 6705
@51 // 6706
D=A // 6707
@SP // 6708
AM=M+1 // 6709
A=A-1 // 6710
M=D // 6711
@51 // 6712
D=A // 6713
@SP // 6714
AM=M+1 // 6715
A=A-1 // 6716
M=D // 6717
@51 // 6718
D=A // 6719
@SP // 6720
AM=M+1 // 6721
A=A-1 // 6722
M=D // 6723
@31 // 6724
D=A // 6725
@SP // 6726
AM=M+1 // 6727
A=A-1 // 6728
M=D // 6729
@51 // 6730
D=A // 6731
@SP // 6732
AM=M+1 // 6733
A=A-1 // 6734
M=D // 6735
@51 // 6736
D=A // 6737
@SP // 6738
AM=M+1 // 6739
A=A-1 // 6740
M=D // 6741
@51 // 6742
D=A // 6743
@SP // 6744
AM=M+1 // 6745
A=A-1 // 6746
M=D // 6747
@31 // 6748
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
@Output.initMap.ret.36 // 6770
D=A // 6771
@CALL // 6772
0;JMP // 6773
(Output.initMap.ret.36)
@SP // 6774
M=M-1 // 6775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6776
D=A // 6777
@SP // 6778
AM=M+1 // 6779
A=A-1 // 6780
M=D // 6781
@28 // 6782
D=A // 6783
@SP // 6784
AM=M+1 // 6785
A=A-1 // 6786
M=D // 6787
@54 // 6788
D=A // 6789
@SP // 6790
AM=M+1 // 6791
A=A-1 // 6792
M=D // 6793
@35 // 6794
D=A // 6795
@SP // 6796
AM=M+1 // 6797
A=A-1 // 6798
M=D // 6799
@3 // 6800
D=A // 6801
@SP // 6802
AM=M+1 // 6803
A=A-1 // 6804
M=D // 6805
@3 // 6806
D=A // 6807
@SP // 6808
AM=M+1 // 6809
A=A-1 // 6810
M=D // 6811
@3 // 6812
D=A // 6813
@SP // 6814
AM=M+1 // 6815
A=A-1 // 6816
M=D // 6817
@35 // 6818
D=A // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=D // 6823
@54 // 6824
D=A // 6825
@SP // 6826
AM=M+1 // 6827
A=A-1 // 6828
M=D // 6829
@28 // 6830
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
@Output.initMap.ret.37 // 6852
D=A // 6853
@CALL // 6854
0;JMP // 6855
(Output.initMap.ret.37)
@SP // 6856
M=M-1 // 6857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 6858
D=A // 6859
@SP // 6860
AM=M+1 // 6861
A=A-1 // 6862
M=D // 6863
@15 // 6864
D=A // 6865
@SP // 6866
AM=M+1 // 6867
A=A-1 // 6868
M=D // 6869
@27 // 6870
D=A // 6871
@SP // 6872
AM=M+1 // 6873
A=A-1 // 6874
M=D // 6875
@51 // 6876
D=A // 6877
@SP // 6878
AM=M+1 // 6879
A=A-1 // 6880
M=D // 6881
@51 // 6882
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
@51 // 6900
D=A // 6901
@SP // 6902
AM=M+1 // 6903
A=A-1 // 6904
M=D // 6905
@27 // 6906
D=A // 6907
@SP // 6908
AM=M+1 // 6909
A=A-1 // 6910
M=D // 6911
@15 // 6912
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
@Output.initMap.ret.38 // 6934
D=A // 6935
@CALL // 6936
0;JMP // 6937
(Output.initMap.ret.38)
@SP // 6938
M=M-1 // 6939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 6940
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
@35 // 6982
D=A // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=D // 6987
@51 // 6988
D=A // 6989
@SP // 6990
AM=M+1 // 6991
A=A-1 // 6992
M=D // 6993
@63 // 6994
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
@Output.initMap.ret.39 // 7016
D=A // 7017
@CALL // 7018
0;JMP // 7019
(Output.initMap.ret.39)
@SP // 7020
M=M-1 // 7021

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7022
D=A // 7023
@SP // 7024
AM=M+1 // 7025
A=A-1 // 7026
M=D // 7027
@63 // 7028
D=A // 7029
@SP // 7030
AM=M+1 // 7031
A=A-1 // 7032
M=D // 7033
@51 // 7034
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
@11 // 7046
D=A // 7047
@SP // 7048
AM=M+1 // 7049
A=A-1 // 7050
M=D // 7051
@15 // 7052
D=A // 7053
@SP // 7054
AM=M+1 // 7055
A=A-1 // 7056
M=D // 7057
@11 // 7058
D=A // 7059
@SP // 7060
AM=M+1 // 7061
A=A-1 // 7062
M=D // 7063
@3 // 7064
D=A // 7065
@SP // 7066
AM=M+1 // 7067
A=A-1 // 7068
M=D // 7069
@3 // 7070
D=A // 7071
@SP // 7072
AM=M+1 // 7073
A=A-1 // 7074
M=D // 7075
@3 // 7076
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
@Output.initMap.ret.40 // 7098
D=A // 7099
@CALL // 7100
0;JMP // 7101
(Output.initMap.ret.40)
@SP // 7102
M=M-1 // 7103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7104
D=A // 7105
@SP // 7106
AM=M+1 // 7107
A=A-1 // 7108
M=D // 7109
@28 // 7110
D=A // 7111
@SP // 7112
AM=M+1 // 7113
A=A-1 // 7114
M=D // 7115
@54 // 7116
D=A // 7117
@SP // 7118
AM=M+1 // 7119
A=A-1 // 7120
M=D // 7121
@35 // 7122
D=A // 7123
@SP // 7124
AM=M+1 // 7125
A=A-1 // 7126
M=D // 7127
@3 // 7128
D=A // 7129
@SP // 7130
AM=M+1 // 7131
A=A-1 // 7132
M=D // 7133
@59 // 7134
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
@54 // 7152
D=A // 7153
@SP // 7154
AM=M+1 // 7155
A=A-1 // 7156
M=D // 7157
@44 // 7158
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
@Output.initMap.ret.41 // 7180
D=A // 7181
@CALL // 7182
0;JMP // 7183
(Output.initMap.ret.41)
@SP // 7184
M=M-1 // 7185

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7186
D=A // 7187
@SP // 7188
AM=M+1 // 7189
A=A-1 // 7190
M=D // 7191
@51 // 7192
D=A // 7193
@SP // 7194
AM=M+1 // 7195
A=A-1 // 7196
M=D // 7197
@51 // 7198
D=A // 7199
@SP // 7200
AM=M+1 // 7201
A=A-1 // 7202
M=D // 7203
@51 // 7204
D=A // 7205
@SP // 7206
AM=M+1 // 7207
A=A-1 // 7208
M=D // 7209
@51 // 7210
D=A // 7211
@SP // 7212
AM=M+1 // 7213
A=A-1 // 7214
M=D // 7215
@63 // 7216
D=A // 7217
@SP // 7218
AM=M+1 // 7219
A=A-1 // 7220
M=D // 7221
@51 // 7222
D=A // 7223
@SP // 7224
AM=M+1 // 7225
A=A-1 // 7226
M=D // 7227
@51 // 7228
D=A // 7229
@SP // 7230
AM=M+1 // 7231
A=A-1 // 7232
M=D // 7233
@51 // 7234
D=A // 7235
@SP // 7236
AM=M+1 // 7237
A=A-1 // 7238
M=D // 7239
@51 // 7240
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
@Output.initMap.ret.42 // 7262
D=A // 7263
@CALL // 7264
0;JMP // 7265
(Output.initMap.ret.42)
@SP // 7266
M=M-1 // 7267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7268
D=A // 7269
@SP // 7270
AM=M+1 // 7271
A=A-1 // 7272
M=D // 7273
@30 // 7274
D=A // 7275
@SP // 7276
AM=M+1 // 7277
A=A-1 // 7278
M=D // 7279
@12 // 7280
D=A // 7281
@SP // 7282
AM=M+1 // 7283
A=A-1 // 7284
M=D // 7285
@12 // 7286
D=A // 7287
@SP // 7288
AM=M+1 // 7289
A=A-1 // 7290
M=D // 7291
@12 // 7292
D=A // 7293
@SP // 7294
AM=M+1 // 7295
A=A-1 // 7296
M=D // 7297
@12 // 7298
D=A // 7299
@SP // 7300
AM=M+1 // 7301
A=A-1 // 7302
M=D // 7303
@12 // 7304
D=A // 7305
@SP // 7306
AM=M+1 // 7307
A=A-1 // 7308
M=D // 7309
@12 // 7310
D=A // 7311
@SP // 7312
AM=M+1 // 7313
A=A-1 // 7314
M=D // 7315
@12 // 7316
D=A // 7317
@SP // 7318
AM=M+1 // 7319
A=A-1 // 7320
M=D // 7321
@30 // 7322
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
@Output.initMap.ret.43 // 7344
D=A // 7345
@CALL // 7346
0;JMP // 7347
(Output.initMap.ret.43)
@SP // 7348
M=M-1 // 7349

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7350
D=A // 7351
@SP // 7352
AM=M+1 // 7353
A=A-1 // 7354
M=D // 7355
@60 // 7356
D=A // 7357
@SP // 7358
AM=M+1 // 7359
A=A-1 // 7360
M=D // 7361
@24 // 7362
D=A // 7363
@SP // 7364
AM=M+1 // 7365
A=A-1 // 7366
M=D // 7367
@24 // 7368
D=A // 7369
@SP // 7370
AM=M+1 // 7371
A=A-1 // 7372
M=D // 7373
@24 // 7374
D=A // 7375
@SP // 7376
AM=M+1 // 7377
A=A-1 // 7378
M=D // 7379
@24 // 7380
D=A // 7381
@SP // 7382
AM=M+1 // 7383
A=A-1 // 7384
M=D // 7385
@24 // 7386
D=A // 7387
@SP // 7388
AM=M+1 // 7389
A=A-1 // 7390
M=D // 7391
@27 // 7392
D=A // 7393
@SP // 7394
AM=M+1 // 7395
A=A-1 // 7396
M=D // 7397
@27 // 7398
D=A // 7399
@SP // 7400
AM=M+1 // 7401
A=A-1 // 7402
M=D // 7403
@14 // 7404
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
@Output.initMap.ret.44 // 7426
D=A // 7427
@CALL // 7428
0;JMP // 7429
(Output.initMap.ret.44)
@SP // 7430
M=M-1 // 7431

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7432
D=A // 7433
@SP // 7434
AM=M+1 // 7435
A=A-1 // 7436
M=D // 7437
@51 // 7438
D=A // 7439
@SP // 7440
AM=M+1 // 7441
A=A-1 // 7442
M=D // 7443
@51 // 7444
D=A // 7445
@SP // 7446
AM=M+1 // 7447
A=A-1 // 7448
M=D // 7449
@51 // 7450
D=A // 7451
@SP // 7452
AM=M+1 // 7453
A=A-1 // 7454
M=D // 7455
@27 // 7456
D=A // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=D // 7461
@15 // 7462
D=A // 7463
@SP // 7464
AM=M+1 // 7465
A=A-1 // 7466
M=D // 7467
@27 // 7468
D=A // 7469
@SP // 7470
AM=M+1 // 7471
A=A-1 // 7472
M=D // 7473
@51 // 7474
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
@51 // 7486
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
@Output.initMap.ret.45 // 7508
D=A // 7509
@CALL // 7510
0;JMP // 7511
(Output.initMap.ret.45)
@SP // 7512
M=M-1 // 7513

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7514
D=A // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=D // 7519
@3 // 7520
D=A // 7521
@SP // 7522
AM=M+1 // 7523
A=A-1 // 7524
M=D // 7525
@3 // 7526
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
@3 // 7538
D=A // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=D // 7543
@3 // 7544
D=A // 7545
@SP // 7546
AM=M+1 // 7547
A=A-1 // 7548
M=D // 7549
@3 // 7550
D=A // 7551
@SP // 7552
AM=M+1 // 7553
A=A-1 // 7554
M=D // 7555
@35 // 7556
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
@63 // 7568
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
@Output.initMap.ret.46 // 7590
D=A // 7591
@CALL // 7592
0;JMP // 7593
(Output.initMap.ret.46)
@SP // 7594
M=M-1 // 7595

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7596
D=A // 7597
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=D // 7601
@33 // 7602
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
@63 // 7614
D=A // 7615
@SP // 7616
AM=M+1 // 7617
A=A-1 // 7618
M=D // 7619
@63 // 7620
D=A // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=D // 7625
@51 // 7626
D=A // 7627
@SP // 7628
AM=M+1 // 7629
A=A-1 // 7630
M=D // 7631
@51 // 7632
D=A // 7633
@SP // 7634
AM=M+1 // 7635
A=A-1 // 7636
M=D // 7637
@51 // 7638
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
@Output.initMap.ret.47 // 7672
D=A // 7673
@CALL // 7674
0;JMP // 7675
(Output.initMap.ret.47)
@SP // 7676
M=M-1 // 7677

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7678
D=A // 7679
@SP // 7680
AM=M+1 // 7681
A=A-1 // 7682
M=D // 7683
@51 // 7684
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
@55 // 7696
D=A // 7697
@SP // 7698
AM=M+1 // 7699
A=A-1 // 7700
M=D // 7701
@55 // 7702
D=A // 7703
@SP // 7704
AM=M+1 // 7705
A=A-1 // 7706
M=D // 7707
@63 // 7708
D=A // 7709
@SP // 7710
AM=M+1 // 7711
A=A-1 // 7712
M=D // 7713
@59 // 7714
D=A // 7715
@SP // 7716
AM=M+1 // 7717
A=A-1 // 7718
M=D // 7719
@59 // 7720
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
@51 // 7732
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
@Output.initMap.ret.48 // 7754
D=A // 7755
@CALL // 7756
0;JMP // 7757
(Output.initMap.ret.48)
@SP // 7758
M=M-1 // 7759

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7760
D=A // 7761
@SP // 7762
AM=M+1 // 7763
A=A-1 // 7764
M=D // 7765
@30 // 7766
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
@51 // 7790
D=A // 7791
@SP // 7792
AM=M+1 // 7793
A=A-1 // 7794
M=D // 7795
@51 // 7796
D=A // 7797
@SP // 7798
AM=M+1 // 7799
A=A-1 // 7800
M=D // 7801
@51 // 7802
D=A // 7803
@SP // 7804
AM=M+1 // 7805
A=A-1 // 7806
M=D // 7807
@51 // 7808
D=A // 7809
@SP // 7810
AM=M+1 // 7811
A=A-1 // 7812
M=D // 7813
@30 // 7814
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
@Output.initMap.ret.49 // 7836
D=A // 7837
@CALL // 7838
0;JMP // 7839
(Output.initMap.ret.49)
@SP // 7840
M=M-1 // 7841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 7842
D=A // 7843
@SP // 7844
AM=M+1 // 7845
A=A-1 // 7846
M=D // 7847
@31 // 7848
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
@31 // 7872
D=A // 7873
@SP // 7874
AM=M+1 // 7875
A=A-1 // 7876
M=D // 7877
@3 // 7878
D=A // 7879
@SP // 7880
AM=M+1 // 7881
A=A-1 // 7882
M=D // 7883
@3 // 7884
D=A // 7885
@SP // 7886
AM=M+1 // 7887
A=A-1 // 7888
M=D // 7889
@3 // 7890
D=A // 7891
@SP // 7892
AM=M+1 // 7893
A=A-1 // 7894
M=D // 7895
@3 // 7896
D=A // 7897
@SP // 7898
AM=M+1 // 7899
A=A-1 // 7900
M=D // 7901
@SP // 7902
AM=M+1 // 7903
A=A-1 // 7904
M=0 // 7905
@SP // 7906
AM=M+1 // 7907
A=A-1 // 7908
M=0 // 7909
// call Output.create
@17 // 7910
D=A // 7911
@14 // 7912
M=D // 7913
@Output.create // 7914
D=A // 7915
@13 // 7916
M=D // 7917
@Output.initMap.ret.50 // 7918
D=A // 7919
@CALL // 7920
0;JMP // 7921
(Output.initMap.ret.50)
@SP // 7922
M=M-1 // 7923

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 7924
D=A // 7925
@SP // 7926
AM=M+1 // 7927
A=A-1 // 7928
M=D // 7929
@30 // 7930
D=A // 7931
@SP // 7932
AM=M+1 // 7933
A=A-1 // 7934
M=D // 7935
@51 // 7936
D=A // 7937
@SP // 7938
AM=M+1 // 7939
A=A-1 // 7940
M=D // 7941
@51 // 7942
D=A // 7943
@SP // 7944
AM=M+1 // 7945
A=A-1 // 7946
M=D // 7947
@51 // 7948
D=A // 7949
@SP // 7950
AM=M+1 // 7951
A=A-1 // 7952
M=D // 7953
@51 // 7954
D=A // 7955
@SP // 7956
AM=M+1 // 7957
A=A-1 // 7958
M=D // 7959
@51 // 7960
D=A // 7961
@SP // 7962
AM=M+1 // 7963
A=A-1 // 7964
M=D // 7965
@63 // 7966
D=A // 7967
@SP // 7968
AM=M+1 // 7969
A=A-1 // 7970
M=D // 7971
@59 // 7972
D=A // 7973
@SP // 7974
AM=M+1 // 7975
A=A-1 // 7976
M=D // 7977
@30 // 7978
D=A // 7979
@SP // 7980
AM=M+1 // 7981
A=A-1 // 7982
M=D // 7983
@48 // 7984
D=A // 7985
@SP // 7986
AM=M+1 // 7987
A=A-1 // 7988
M=D // 7989
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
@Output.initMap.ret.51 // 8002
D=A // 8003
@CALL // 8004
0;JMP // 8005
(Output.initMap.ret.51)
@SP // 8006
M=M-1 // 8007

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8008
D=A // 8009
@SP // 8010
AM=M+1 // 8011
A=A-1 // 8012
M=D // 8013
@31 // 8014
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
@51 // 8032
D=A // 8033
@SP // 8034
AM=M+1 // 8035
A=A-1 // 8036
M=D // 8037
@31 // 8038
D=A // 8039
@SP // 8040
AM=M+1 // 8041
A=A-1 // 8042
M=D // 8043
@27 // 8044
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
@51 // 8062
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
@Output.initMap.ret.52 // 8084
D=A // 8085
@CALL // 8086
0;JMP // 8087
(Output.initMap.ret.52)
@SP // 8088
M=M-1 // 8089

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8090
D=A // 8091
@SP // 8092
AM=M+1 // 8093
A=A-1 // 8094
M=D // 8095
@30 // 8096
D=A // 8097
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=D // 8101
@51 // 8102
D=A // 8103
@SP // 8104
AM=M+1 // 8105
A=A-1 // 8106
M=D // 8107
@51 // 8108
D=A // 8109
@SP // 8110
AM=M+1 // 8111
A=A-1 // 8112
M=D // 8113
@6 // 8114
D=A // 8115
@SP // 8116
AM=M+1 // 8117
A=A-1 // 8118
M=D // 8119
@28 // 8120
D=A // 8121
@SP // 8122
AM=M+1 // 8123
A=A-1 // 8124
M=D // 8125
@48 // 8126
D=A // 8127
@SP // 8128
AM=M+1 // 8129
A=A-1 // 8130
M=D // 8131
@51 // 8132
D=A // 8133
@SP // 8134
AM=M+1 // 8135
A=A-1 // 8136
M=D // 8137
@51 // 8138
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
@Output.initMap.ret.53 // 8166
D=A // 8167
@CALL // 8168
0;JMP // 8169
(Output.initMap.ret.53)
@SP // 8170
M=M-1 // 8171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8172
D=A // 8173
@SP // 8174
AM=M+1 // 8175
A=A-1 // 8176
M=D // 8177
@63 // 8178
D=A // 8179
@SP // 8180
AM=M+1 // 8181
A=A-1 // 8182
M=D // 8183
@63 // 8184
D=A // 8185
@SP // 8186
AM=M+1 // 8187
A=A-1 // 8188
M=D // 8189
@45 // 8190
D=A // 8191
@SP // 8192
AM=M+1 // 8193
A=A-1 // 8194
M=D // 8195
@12 // 8196
D=A // 8197
@SP // 8198
AM=M+1 // 8199
A=A-1 // 8200
M=D // 8201
@12 // 8202
D=A // 8203
@SP // 8204
AM=M+1 // 8205
A=A-1 // 8206
M=D // 8207
@12 // 8208
D=A // 8209
@SP // 8210
AM=M+1 // 8211
A=A-1 // 8212
M=D // 8213
@12 // 8214
D=A // 8215
@SP // 8216
AM=M+1 // 8217
A=A-1 // 8218
M=D // 8219
@12 // 8220
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
@Output.initMap.ret.54 // 8248
D=A // 8249
@CALL // 8250
0;JMP // 8251
(Output.initMap.ret.54)
@SP // 8252
M=M-1 // 8253

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8254
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
@51 // 8290
D=A // 8291
@SP // 8292
AM=M+1 // 8293
A=A-1 // 8294
M=D // 8295
@51 // 8296
D=A // 8297
@SP // 8298
AM=M+1 // 8299
A=A-1 // 8300
M=D // 8301
@51 // 8302
D=A // 8303
@SP // 8304
AM=M+1 // 8305
A=A-1 // 8306
M=D // 8307
@30 // 8308
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
@Output.initMap.ret.55 // 8330
D=A // 8331
@CALL // 8332
0;JMP // 8333
(Output.initMap.ret.55)
@SP // 8334
M=M-1 // 8335

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8336
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
@30 // 8372
D=A // 8373
@SP // 8374
AM=M+1 // 8375
A=A-1 // 8376
M=D // 8377
@30 // 8378
D=A // 8379
@SP // 8380
AM=M+1 // 8381
A=A-1 // 8382
M=D // 8383
@12 // 8384
D=A // 8385
@SP // 8386
AM=M+1 // 8387
A=A-1 // 8388
M=D // 8389
@12 // 8390
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
@Output.initMap.ret.56 // 8412
D=A // 8413
@CALL // 8414
0;JMP // 8415
(Output.initMap.ret.56)
@SP // 8416
M=M-1 // 8417

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8418
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
@51 // 8436
D=A // 8437
@SP // 8438
AM=M+1 // 8439
A=A-1 // 8440
M=D // 8441
@51 // 8442
D=A // 8443
@SP // 8444
AM=M+1 // 8445
A=A-1 // 8446
M=D // 8447
@51 // 8448
D=A // 8449
@SP // 8450
AM=M+1 // 8451
A=A-1 // 8452
M=D // 8453
@63 // 8454
D=A // 8455
@SP // 8456
AM=M+1 // 8457
A=A-1 // 8458
M=D // 8459
@63 // 8460
D=A // 8461
@SP // 8462
AM=M+1 // 8463
A=A-1 // 8464
M=D // 8465
@63 // 8466
D=A // 8467
@SP // 8468
AM=M+1 // 8469
A=A-1 // 8470
M=D // 8471
@18 // 8472
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
@Output.initMap.ret.57 // 8494
D=A // 8495
@CALL // 8496
0;JMP // 8497
(Output.initMap.ret.57)
@SP // 8498
M=M-1 // 8499

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8500
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
@30 // 8518
D=A // 8519
@SP // 8520
AM=M+1 // 8521
A=A-1 // 8522
M=D // 8523
@30 // 8524
D=A // 8525
@SP // 8526
AM=M+1 // 8527
A=A-1 // 8528
M=D // 8529
@12 // 8530
D=A // 8531
@SP // 8532
AM=M+1 // 8533
A=A-1 // 8534
M=D // 8535
@30 // 8536
D=A // 8537
@SP // 8538
AM=M+1 // 8539
A=A-1 // 8540
M=D // 8541
@30 // 8542
D=A // 8543
@SP // 8544
AM=M+1 // 8545
A=A-1 // 8546
M=D // 8547
@51 // 8548
D=A // 8549
@SP // 8550
AM=M+1 // 8551
A=A-1 // 8552
M=D // 8553
@51 // 8554
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
@Output.initMap.ret.58 // 8576
D=A // 8577
@CALL // 8578
0;JMP // 8579
(Output.initMap.ret.58)
@SP // 8580
M=M-1 // 8581

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8582
D=A // 8583
@SP // 8584
AM=M+1 // 8585
A=A-1 // 8586
M=D // 8587
@51 // 8588
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
@51 // 8600
D=A // 8601
@SP // 8602
AM=M+1 // 8603
A=A-1 // 8604
M=D // 8605
@51 // 8606
D=A // 8607
@SP // 8608
AM=M+1 // 8609
A=A-1 // 8610
M=D // 8611
@30 // 8612
D=A // 8613
@SP // 8614
AM=M+1 // 8615
A=A-1 // 8616
M=D // 8617
@12 // 8618
D=A // 8619
@SP // 8620
AM=M+1 // 8621
A=A-1 // 8622
M=D // 8623
@12 // 8624
D=A // 8625
@SP // 8626
AM=M+1 // 8627
A=A-1 // 8628
M=D // 8629
@12 // 8630
D=A // 8631
@SP // 8632
AM=M+1 // 8633
A=A-1 // 8634
M=D // 8635
@30 // 8636
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
@Output.initMap.ret.59 // 8658
D=A // 8659
@CALL // 8660
0;JMP // 8661
(Output.initMap.ret.59)
@SP // 8662
M=M-1 // 8663

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8664
D=A // 8665
@SP // 8666
AM=M+1 // 8667
A=A-1 // 8668
M=D // 8669
@63 // 8670
D=A // 8671
@SP // 8672
AM=M+1 // 8673
A=A-1 // 8674
M=D // 8675
@51 // 8676
D=A // 8677
@SP // 8678
AM=M+1 // 8679
A=A-1 // 8680
M=D // 8681
@49 // 8682
D=A // 8683
@SP // 8684
AM=M+1 // 8685
A=A-1 // 8686
M=D // 8687
@24 // 8688
D=A // 8689
@SP // 8690
AM=M+1 // 8691
A=A-1 // 8692
M=D // 8693
@12 // 8694
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
@35 // 8706
D=A // 8707
@SP // 8708
AM=M+1 // 8709
A=A-1 // 8710
M=D // 8711
@51 // 8712
D=A // 8713
@SP // 8714
AM=M+1 // 8715
A=A-1 // 8716
M=D // 8717
@63 // 8718
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
@Output.initMap.ret.60 // 8740
D=A // 8741
@CALL // 8742
0;JMP // 8743
(Output.initMap.ret.60)
@SP // 8744
M=M-1 // 8745

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8746
D=A // 8747
@SP // 8748
AM=M+1 // 8749
A=A-1 // 8750
M=D // 8751
@30 // 8752
D=A // 8753
@SP // 8754
AM=M+1 // 8755
A=A-1 // 8756
M=D // 8757
@6 // 8758
D=A // 8759
@SP // 8760
AM=M+1 // 8761
A=A-1 // 8762
M=D // 8763
@6 // 8764
D=A // 8765
@SP // 8766
AM=M+1 // 8767
A=A-1 // 8768
M=D // 8769
@6 // 8770
D=A // 8771
@SP // 8772
AM=M+1 // 8773
A=A-1 // 8774
M=D // 8775
@6 // 8776
D=A // 8777
@SP // 8778
AM=M+1 // 8779
A=A-1 // 8780
M=D // 8781
@6 // 8782
D=A // 8783
@SP // 8784
AM=M+1 // 8785
A=A-1 // 8786
M=D // 8787
@6 // 8788
D=A // 8789
@SP // 8790
AM=M+1 // 8791
A=A-1 // 8792
M=D // 8793
@6 // 8794
D=A // 8795
@SP // 8796
AM=M+1 // 8797
A=A-1 // 8798
M=D // 8799
@30 // 8800
D=A // 8801
@SP // 8802
AM=M+1 // 8803
A=A-1 // 8804
M=D // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=0 // 8809
@SP // 8810
AM=M+1 // 8811
A=A-1 // 8812
M=0 // 8813
// call Output.create
@17 // 8814
D=A // 8815
@14 // 8816
M=D // 8817
@Output.create // 8818
D=A // 8819
@13 // 8820
M=D // 8821
@Output.initMap.ret.61 // 8822
D=A // 8823
@CALL // 8824
0;JMP // 8825
(Output.initMap.ret.61)
@SP // 8826
M=M-1 // 8827

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8828
D=A // 8829
@SP // 8830
M=D+M // 8831
@92 // 8832
D=A // 8833
@SP // 8834
A=M-1 // 8835
M=1 // 8836
A=A-1 // 8837
M=0 // 8838
A=A-1 // 8839
M=0 // 8840
A=A-1 // 8841
M=D // 8842
A=A-1 // 8843
@3 // 8844
D=A // 8845
@SP // 8846
AM=M+1 // 8847
A=A-1 // 8848
M=D // 8849
@6 // 8850
D=A // 8851
@SP // 8852
AM=M+1 // 8853
A=A-1 // 8854
M=D // 8855
@12 // 8856
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
@48 // 8868
D=A // 8869
@SP // 8870
AM=M+1 // 8871
A=A-1 // 8872
M=D // 8873
@32 // 8874
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
@Output.initMap.ret.62 // 8896
D=A // 8897
@CALL // 8898
0;JMP // 8899
(Output.initMap.ret.62)
@SP // 8900
M=M-1 // 8901

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 8902
D=A // 8903
@SP // 8904
AM=M+1 // 8905
A=A-1 // 8906
M=D // 8907
@30 // 8908
D=A // 8909
@SP // 8910
AM=M+1 // 8911
A=A-1 // 8912
M=D // 8913
@24 // 8914
D=A // 8915
@SP // 8916
AM=M+1 // 8917
A=A-1 // 8918
M=D // 8919
@24 // 8920
D=A // 8921
@SP // 8922
AM=M+1 // 8923
A=A-1 // 8924
M=D // 8925
@24 // 8926
D=A // 8927
@SP // 8928
AM=M+1 // 8929
A=A-1 // 8930
M=D // 8931
@24 // 8932
D=A // 8933
@SP // 8934
AM=M+1 // 8935
A=A-1 // 8936
M=D // 8937
@24 // 8938
D=A // 8939
@SP // 8940
AM=M+1 // 8941
A=A-1 // 8942
M=D // 8943
@24 // 8944
D=A // 8945
@SP // 8946
AM=M+1 // 8947
A=A-1 // 8948
M=D // 8949
@24 // 8950
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
@SP // 8962
AM=M+1 // 8963
A=A-1 // 8964
M=0 // 8965
@SP // 8966
AM=M+1 // 8967
A=A-1 // 8968
M=0 // 8969
// call Output.create
@17 // 8970
D=A // 8971
@14 // 8972
M=D // 8973
@Output.create // 8974
D=A // 8975
@13 // 8976
M=D // 8977
@Output.initMap.ret.63 // 8978
D=A // 8979
@CALL // 8980
0;JMP // 8981
(Output.initMap.ret.63)
@SP // 8982
M=M-1 // 8983

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 8984
D=A // 8985
@SP // 8986
AM=M+1 // 8987
A=A-1 // 8988
M=D // 8989
@8 // 8990
D=A // 8991
@SP // 8992
AM=M+1 // 8993
A=A-1 // 8994
M=D // 8995
@28 // 8996
D=A // 8997
@SP // 8998
AM=M+1 // 8999
A=A-1 // 9000
M=D // 9001
@54 // 9002
D=A // 9003
@SP // 9004
AM=M+1 // 9005
A=A-1 // 9006
M=D // 9007
@SP // 9008
AM=M+1 // 9009
A=A-1 // 9010
M=0 // 9011
@SP // 9012
AM=M+1 // 9013
A=A-1 // 9014
M=0 // 9015
@SP // 9016
AM=M+1 // 9017
A=A-1 // 9018
M=0 // 9019
@SP // 9020
AM=M+1 // 9021
A=A-1 // 9022
M=0 // 9023
@SP // 9024
AM=M+1 // 9025
A=A-1 // 9026
M=0 // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=0 // 9031
@SP // 9032
AM=M+1 // 9033
A=A-1 // 9034
M=0 // 9035
@SP // 9036
AM=M+1 // 9037
A=A-1 // 9038
M=0 // 9039
// call Output.create
@17 // 9040
D=A // 9041
@14 // 9042
M=D // 9043
@Output.create // 9044
D=A // 9045
@13 // 9046
M=D // 9047
@Output.initMap.ret.64 // 9048
D=A // 9049
@CALL // 9050
0;JMP // 9051
(Output.initMap.ret.64)
@SP // 9052
M=M-1 // 9053

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9054
D=A // 9055
@SP // 9056
M=D+M // 9057
@95 // 9058
D=A // 9059
@SP // 9060
A=M-1 // 9061
M=0 // 9062
A=A-1 // 9063
M=0 // 9064
A=A-1 // 9065
M=0 // 9066
A=A-1 // 9067
M=0 // 9068
A=A-1 // 9069
M=0 // 9070
A=A-1 // 9071
M=0 // 9072
A=A-1 // 9073
M=0 // 9074
A=A-1 // 9075
M=0 // 9076
A=A-1 // 9077
M=0 // 9078
A=A-1 // 9079
M=D // 9080
A=A-1 // 9081
@2 // 9082
D=A // 9083
@SP // 9084
M=D+M // 9085
@63 // 9086
D=A // 9087
@SP // 9088
A=M-1 // 9089
M=0 // 9090
A=A-1 // 9091
M=D // 9092
A=A-1 // 9093
// call Output.create
@17 // 9094
D=A // 9095
@14 // 9096
M=D // 9097
@Output.create // 9098
D=A // 9099
@13 // 9100
M=D // 9101
@Output.initMap.ret.65 // 9102
D=A // 9103
@CALL // 9104
0;JMP // 9105
(Output.initMap.ret.65)
@SP // 9106
M=M-1 // 9107

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9108
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
@12 // 9120
D=A // 9121
@SP // 9122
AM=M+1 // 9123
A=A-1 // 9124
M=D // 9125
@24 // 9126
D=A // 9127
@SP // 9128
AM=M+1 // 9129
A=A-1 // 9130
M=D // 9131
@SP // 9132
AM=M+1 // 9133
A=A-1 // 9134
M=0 // 9135
@SP // 9136
AM=M+1 // 9137
A=A-1 // 9138
M=0 // 9139
@SP // 9140
AM=M+1 // 9141
A=A-1 // 9142
M=0 // 9143
@SP // 9144
AM=M+1 // 9145
A=A-1 // 9146
M=0 // 9147
@SP // 9148
AM=M+1 // 9149
A=A-1 // 9150
M=0 // 9151
@SP // 9152
AM=M+1 // 9153
A=A-1 // 9154
M=0 // 9155
@SP // 9156
AM=M+1 // 9157
A=A-1 // 9158
M=0 // 9159
@SP // 9160
AM=M+1 // 9161
A=A-1 // 9162
M=0 // 9163
// call Output.create
@17 // 9164
D=A // 9165
@14 // 9166
M=D // 9167
@Output.create // 9168
D=A // 9169
@13 // 9170
M=D // 9171
@Output.initMap.ret.66 // 9172
D=A // 9173
@CALL // 9174
0;JMP // 9175
(Output.initMap.ret.66)
@SP // 9176
M=M-1 // 9177

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9178
D=A // 9179
@SP // 9180
M=D+M // 9181
@97 // 9182
D=A // 9183
@SP // 9184
A=M-1 // 9185
M=0 // 9186
A=A-1 // 9187
M=0 // 9188
A=A-1 // 9189
M=0 // 9190
A=A-1 // 9191
M=D // 9192
A=A-1 // 9193
@14 // 9194
D=A // 9195
@SP // 9196
AM=M+1 // 9197
A=A-1 // 9198
M=D // 9199
@24 // 9200
D=A // 9201
@SP // 9202
AM=M+1 // 9203
A=A-1 // 9204
M=D // 9205
@30 // 9206
D=A // 9207
@SP // 9208
AM=M+1 // 9209
A=A-1 // 9210
M=D // 9211
@27 // 9212
D=A // 9213
@SP // 9214
AM=M+1 // 9215
A=A-1 // 9216
M=D // 9217
@27 // 9218
D=A // 9219
@SP // 9220
AM=M+1 // 9221
A=A-1 // 9222
M=D // 9223
@54 // 9224
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
@Output.initMap.ret.67 // 9246
D=A // 9247
@CALL // 9248
0;JMP // 9249
(Output.initMap.ret.67)
@SP // 9250
M=M-1 // 9251

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9252
D=A // 9253
@SP // 9254
AM=M+1 // 9255
A=A-1 // 9256
M=D // 9257
@3 // 9258
D=A // 9259
@SP // 9260
AM=M+1 // 9261
A=A-1 // 9262
M=D // 9263
@3 // 9264
D=A // 9265
@SP // 9266
AM=M+1 // 9267
A=A-1 // 9268
M=D // 9269
@3 // 9270
D=A // 9271
@SP // 9272
AM=M+1 // 9273
A=A-1 // 9274
M=D // 9275
@15 // 9276
D=A // 9277
@SP // 9278
AM=M+1 // 9279
A=A-1 // 9280
M=D // 9281
@27 // 9282
D=A // 9283
@SP // 9284
AM=M+1 // 9285
A=A-1 // 9286
M=D // 9287
@51 // 9288
D=A // 9289
@SP // 9290
AM=M+1 // 9291
A=A-1 // 9292
M=D // 9293
@51 // 9294
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
@30 // 9306
D=A // 9307
@SP // 9308
AM=M+1 // 9309
A=A-1 // 9310
M=D // 9311
@SP // 9312
AM=M+1 // 9313
A=A-1 // 9314
M=0 // 9315
@SP // 9316
AM=M+1 // 9317
A=A-1 // 9318
M=0 // 9319
// call Output.create
@17 // 9320
D=A // 9321
@14 // 9322
M=D // 9323
@Output.create // 9324
D=A // 9325
@13 // 9326
M=D // 9327
@Output.initMap.ret.68 // 9328
D=A // 9329
@CALL // 9330
0;JMP // 9331
(Output.initMap.ret.68)
@SP // 9332
M=M-1 // 9333

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9334
D=A // 9335
@SP // 9336
M=D+M // 9337
@99 // 9338
D=A // 9339
@SP // 9340
A=M-1 // 9341
M=0 // 9342
A=A-1 // 9343
M=0 // 9344
A=A-1 // 9345
M=0 // 9346
A=A-1 // 9347
M=D // 9348
A=A-1 // 9349
@30 // 9350
D=A // 9351
@SP // 9352
AM=M+1 // 9353
A=A-1 // 9354
M=D // 9355
@51 // 9356
D=A // 9357
@SP // 9358
AM=M+1 // 9359
A=A-1 // 9360
M=D // 9361
@3 // 9362
D=A // 9363
@SP // 9364
AM=M+1 // 9365
A=A-1 // 9366
M=D // 9367
@3 // 9368
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
@Output.initMap.ret.69 // 9402
D=A // 9403
@CALL // 9404
0;JMP // 9405
(Output.initMap.ret.69)
@SP // 9406
M=M-1 // 9407

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9408
D=A // 9409
@SP // 9410
AM=M+1 // 9411
A=A-1 // 9412
M=D // 9413
@48 // 9414
D=A // 9415
@SP // 9416
AM=M+1 // 9417
A=A-1 // 9418
M=D // 9419
@48 // 9420
D=A // 9421
@SP // 9422
AM=M+1 // 9423
A=A-1 // 9424
M=D // 9425
@48 // 9426
D=A // 9427
@SP // 9428
AM=M+1 // 9429
A=A-1 // 9430
M=D // 9431
@60 // 9432
D=A // 9433
@SP // 9434
AM=M+1 // 9435
A=A-1 // 9436
M=D // 9437
@54 // 9438
D=A // 9439
@SP // 9440
AM=M+1 // 9441
A=A-1 // 9442
M=D // 9443
@51 // 9444
D=A // 9445
@SP // 9446
AM=M+1 // 9447
A=A-1 // 9448
M=D // 9449
@51 // 9450
D=A // 9451
@SP // 9452
AM=M+1 // 9453
A=A-1 // 9454
M=D // 9455
@51 // 9456
D=A // 9457
@SP // 9458
AM=M+1 // 9459
A=A-1 // 9460
M=D // 9461
@30 // 9462
D=A // 9463
@SP // 9464
AM=M+1 // 9465
A=A-1 // 9466
M=D // 9467
@SP // 9468
AM=M+1 // 9469
A=A-1 // 9470
M=0 // 9471
@SP // 9472
AM=M+1 // 9473
A=A-1 // 9474
M=0 // 9475
// call Output.create
@17 // 9476
D=A // 9477
@14 // 9478
M=D // 9479
@Output.create // 9480
D=A // 9481
@13 // 9482
M=D // 9483
@Output.initMap.ret.70 // 9484
D=A // 9485
@CALL // 9486
0;JMP // 9487
(Output.initMap.ret.70)
@SP // 9488
M=M-1 // 9489

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9490
D=A // 9491
@SP // 9492
M=D+M // 9493
@101 // 9494
D=A // 9495
@SP // 9496
A=M-1 // 9497
M=0 // 9498
A=A-1 // 9499
M=0 // 9500
A=A-1 // 9501
M=0 // 9502
A=A-1 // 9503
M=D // 9504
A=A-1 // 9505
@30 // 9506
D=A // 9507
@SP // 9508
AM=M+1 // 9509
A=A-1 // 9510
M=D // 9511
@51 // 9512
D=A // 9513
@SP // 9514
AM=M+1 // 9515
A=A-1 // 9516
M=D // 9517
@63 // 9518
D=A // 9519
@SP // 9520
AM=M+1 // 9521
A=A-1 // 9522
M=D // 9523
@3 // 9524
D=A // 9525
@SP // 9526
AM=M+1 // 9527
A=A-1 // 9528
M=D // 9529
@51 // 9530
D=A // 9531
@SP // 9532
AM=M+1 // 9533
A=A-1 // 9534
M=D // 9535
@30 // 9536
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
@Output.initMap.ret.71 // 9558
D=A // 9559
@CALL // 9560
0;JMP // 9561
(Output.initMap.ret.71)
@SP // 9562
M=M-1 // 9563

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9564
D=A // 9565
@SP // 9566
AM=M+1 // 9567
A=A-1 // 9568
M=D // 9569
@28 // 9570
D=A // 9571
@SP // 9572
AM=M+1 // 9573
A=A-1 // 9574
M=D // 9575
@54 // 9576
D=A // 9577
@SP // 9578
AM=M+1 // 9579
A=A-1 // 9580
M=D // 9581
@38 // 9582
D=A // 9583
@SP // 9584
AM=M+1 // 9585
A=A-1 // 9586
M=D // 9587
@6 // 9588
D=A // 9589
@SP // 9590
AM=M+1 // 9591
A=A-1 // 9592
M=D // 9593
@15 // 9594
D=A // 9595
@SP // 9596
AM=M+1 // 9597
A=A-1 // 9598
M=D // 9599
@6 // 9600
D=A // 9601
@SP // 9602
AM=M+1 // 9603
A=A-1 // 9604
M=D // 9605
@6 // 9606
D=A // 9607
@SP // 9608
AM=M+1 // 9609
A=A-1 // 9610
M=D // 9611
@6 // 9612
D=A // 9613
@SP // 9614
AM=M+1 // 9615
A=A-1 // 9616
M=D // 9617
@15 // 9618
D=A // 9619
@SP // 9620
AM=M+1 // 9621
A=A-1 // 9622
M=D // 9623
@SP // 9624
AM=M+1 // 9625
A=A-1 // 9626
M=0 // 9627
@SP // 9628
AM=M+1 // 9629
A=A-1 // 9630
M=0 // 9631
// call Output.create
@17 // 9632
D=A // 9633
@14 // 9634
M=D // 9635
@Output.create // 9636
D=A // 9637
@13 // 9638
M=D // 9639
@Output.initMap.ret.72 // 9640
D=A // 9641
@CALL // 9642
0;JMP // 9643
(Output.initMap.ret.72)
@SP // 9644
M=M-1 // 9645

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9646
D=A // 9647
@SP // 9648
M=D+M // 9649
@103 // 9650
D=A // 9651
@SP // 9652
A=M-1 // 9653
M=0 // 9654
A=A-1 // 9655
M=0 // 9656
A=A-1 // 9657
M=D // 9658
A=A-1 // 9659
@30 // 9660
D=A // 9661
@SP // 9662
AM=M+1 // 9663
A=A-1 // 9664
M=D // 9665
@51 // 9666
D=A // 9667
@SP // 9668
AM=M+1 // 9669
A=A-1 // 9670
M=D // 9671
@51 // 9672
D=A // 9673
@SP // 9674
AM=M+1 // 9675
A=A-1 // 9676
M=D // 9677
@51 // 9678
D=A // 9679
@SP // 9680
AM=M+1 // 9681
A=A-1 // 9682
M=D // 9683
@62 // 9684
D=A // 9685
@SP // 9686
AM=M+1 // 9687
A=A-1 // 9688
M=D // 9689
@48 // 9690
D=A // 9691
@SP // 9692
AM=M+1 // 9693
A=A-1 // 9694
M=D // 9695
@51 // 9696
D=A // 9697
@SP // 9698
AM=M+1 // 9699
A=A-1 // 9700
M=D // 9701
@30 // 9702
D=A // 9703
@SP // 9704
AM=M+1 // 9705
A=A-1 // 9706
M=D // 9707
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
@Output.initMap.ret.73 // 9720
D=A // 9721
@CALL // 9722
0;JMP // 9723
(Output.initMap.ret.73)
@SP // 9724
M=M-1 // 9725

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9726
D=A // 9727
@SP // 9728
AM=M+1 // 9729
A=A-1 // 9730
M=D // 9731
@3 // 9732
D=A // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=D // 9737
@3 // 9738
D=A // 9739
@SP // 9740
AM=M+1 // 9741
A=A-1 // 9742
M=D // 9743
@3 // 9744
D=A // 9745
@SP // 9746
AM=M+1 // 9747
A=A-1 // 9748
M=D // 9749
@27 // 9750
D=A // 9751
@SP // 9752
AM=M+1 // 9753
A=A-1 // 9754
M=D // 9755
@55 // 9756
D=A // 9757
@SP // 9758
AM=M+1 // 9759
A=A-1 // 9760
M=D // 9761
@51 // 9762
D=A // 9763
@SP // 9764
AM=M+1 // 9765
A=A-1 // 9766
M=D // 9767
@51 // 9768
D=A // 9769
@SP // 9770
AM=M+1 // 9771
A=A-1 // 9772
M=D // 9773
@51 // 9774
D=A // 9775
@SP // 9776
AM=M+1 // 9777
A=A-1 // 9778
M=D // 9779
@51 // 9780
D=A // 9781
@SP // 9782
AM=M+1 // 9783
A=A-1 // 9784
M=D // 9785
@SP // 9786
AM=M+1 // 9787
A=A-1 // 9788
M=0 // 9789
@SP // 9790
AM=M+1 // 9791
A=A-1 // 9792
M=0 // 9793
// call Output.create
@17 // 9794
D=A // 9795
@14 // 9796
M=D // 9797
@Output.create // 9798
D=A // 9799
@13 // 9800
M=D // 9801
@Output.initMap.ret.74 // 9802
D=A // 9803
@CALL // 9804
0;JMP // 9805
(Output.initMap.ret.74)
@SP // 9806
M=M-1 // 9807

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9808
D=A // 9809
@SP // 9810
AM=M+1 // 9811
A=A-1 // 9812
M=D // 9813
@12 // 9814
D=A // 9815
@SP // 9816
AM=M+1 // 9817
A=A-1 // 9818
M=D // 9819
@12 // 9820
D=A // 9821
@SP // 9822
AM=M+1 // 9823
A=A-1 // 9824
M=D // 9825
@SP // 9826
AM=M+1 // 9827
A=A-1 // 9828
M=0 // 9829
@14 // 9830
D=A // 9831
@SP // 9832
AM=M+1 // 9833
A=A-1 // 9834
M=D // 9835
@12 // 9836
D=A // 9837
@SP // 9838
AM=M+1 // 9839
A=A-1 // 9840
M=D // 9841
@12 // 9842
D=A // 9843
@SP // 9844
AM=M+1 // 9845
A=A-1 // 9846
M=D // 9847
@12 // 9848
D=A // 9849
@SP // 9850
AM=M+1 // 9851
A=A-1 // 9852
M=D // 9853
@12 // 9854
D=A // 9855
@SP // 9856
AM=M+1 // 9857
A=A-1 // 9858
M=D // 9859
@30 // 9860
D=A // 9861
@SP // 9862
AM=M+1 // 9863
A=A-1 // 9864
M=D // 9865
@SP // 9866
AM=M+1 // 9867
A=A-1 // 9868
M=0 // 9869
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
@Output.initMap.ret.75 // 9882
D=A // 9883
@CALL // 9884
0;JMP // 9885
(Output.initMap.ret.75)
@SP // 9886
M=M-1 // 9887

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 9888
D=A // 9889
@SP // 9890
AM=M+1 // 9891
A=A-1 // 9892
M=D // 9893
@48 // 9894
D=A // 9895
@SP // 9896
AM=M+1 // 9897
A=A-1 // 9898
M=D // 9899
@48 // 9900
D=A // 9901
@SP // 9902
AM=M+1 // 9903
A=A-1 // 9904
M=D // 9905
@SP // 9906
AM=M+1 // 9907
A=A-1 // 9908
M=0 // 9909
@56 // 9910
D=A // 9911
@SP // 9912
AM=M+1 // 9913
A=A-1 // 9914
M=D // 9915
@48 // 9916
D=A // 9917
@SP // 9918
AM=M+1 // 9919
A=A-1 // 9920
M=D // 9921
@48 // 9922
D=A // 9923
@SP // 9924
AM=M+1 // 9925
A=A-1 // 9926
M=D // 9927
@48 // 9928
D=A // 9929
@SP // 9930
AM=M+1 // 9931
A=A-1 // 9932
M=D // 9933
@48 // 9934
D=A // 9935
@SP // 9936
AM=M+1 // 9937
A=A-1 // 9938
M=D // 9939
@51 // 9940
D=A // 9941
@SP // 9942
AM=M+1 // 9943
A=A-1 // 9944
M=D // 9945
@30 // 9946
D=A // 9947
@SP // 9948
AM=M+1 // 9949
A=A-1 // 9950
M=D // 9951
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
@Output.initMap.ret.76 // 9964
D=A // 9965
@CALL // 9966
0;JMP // 9967
(Output.initMap.ret.76)
@SP // 9968
M=M-1 // 9969

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 9970
D=A // 9971
@SP // 9972
AM=M+1 // 9973
A=A-1 // 9974
M=D // 9975
@3 // 9976
D=A // 9977
@SP // 9978
AM=M+1 // 9979
A=A-1 // 9980
M=D // 9981
@3 // 9982
D=A // 9983
@SP // 9984
AM=M+1 // 9985
A=A-1 // 9986
M=D // 9987
@3 // 9988
D=A // 9989
@SP // 9990
AM=M+1 // 9991
A=A-1 // 9992
M=D // 9993
@51 // 9994
D=A // 9995
@SP // 9996
AM=M+1 // 9997
A=A-1 // 9998
M=D // 9999
@27 // 10000
D=A // 10001
@SP // 10002
AM=M+1 // 10003
A=A-1 // 10004
M=D // 10005
@15 // 10006
D=A // 10007
@SP // 10008
AM=M+1 // 10009
A=A-1 // 10010
M=D // 10011
@15 // 10012
D=A // 10013
@SP // 10014
AM=M+1 // 10015
A=A-1 // 10016
M=D // 10017
@27 // 10018
D=A // 10019
@SP // 10020
AM=M+1 // 10021
A=A-1 // 10022
M=D // 10023
@51 // 10024
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
@Output.initMap.ret.77 // 10046
D=A // 10047
@CALL // 10048
0;JMP // 10049
(Output.initMap.ret.77)
@SP // 10050
M=M-1 // 10051

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10052
D=A // 10053
@SP // 10054
AM=M+1 // 10055
A=A-1 // 10056
M=D // 10057
@14 // 10058
D=A // 10059
@SP // 10060
AM=M+1 // 10061
A=A-1 // 10062
M=D // 10063
@12 // 10064
D=A // 10065
@SP // 10066
AM=M+1 // 10067
A=A-1 // 10068
M=D // 10069
@12 // 10070
D=A // 10071
@SP // 10072
AM=M+1 // 10073
A=A-1 // 10074
M=D // 10075
@12 // 10076
D=A // 10077
@SP // 10078
AM=M+1 // 10079
A=A-1 // 10080
M=D // 10081
@12 // 10082
D=A // 10083
@SP // 10084
AM=M+1 // 10085
A=A-1 // 10086
M=D // 10087
@12 // 10088
D=A // 10089
@SP // 10090
AM=M+1 // 10091
A=A-1 // 10092
M=D // 10093
@12 // 10094
D=A // 10095
@SP // 10096
AM=M+1 // 10097
A=A-1 // 10098
M=D // 10099
@12 // 10100
D=A // 10101
@SP // 10102
AM=M+1 // 10103
A=A-1 // 10104
M=D // 10105
@30 // 10106
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
// call Output.create
@17 // 10120
D=A // 10121
@14 // 10122
M=D // 10123
@Output.create // 10124
D=A // 10125
@13 // 10126
M=D // 10127
@Output.initMap.ret.78 // 10128
D=A // 10129
@CALL // 10130
0;JMP // 10131
(Output.initMap.ret.78)
@SP // 10132
M=M-1 // 10133

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10134
D=A // 10135
@SP // 10136
M=D+M // 10137
@109 // 10138
D=A // 10139
@SP // 10140
A=M-1 // 10141
M=0 // 10142
A=A-1 // 10143
M=0 // 10144
A=A-1 // 10145
M=0 // 10146
A=A-1 // 10147
M=D // 10148
A=A-1 // 10149
@29 // 10150
D=A // 10151
@SP // 10152
AM=M+1 // 10153
A=A-1 // 10154
M=D // 10155
@63 // 10156
D=A // 10157
@SP // 10158
AM=M+1 // 10159
A=A-1 // 10160
M=D // 10161
@43 // 10162
D=A // 10163
@SP // 10164
AM=M+1 // 10165
A=A-1 // 10166
M=D // 10167
@43 // 10168
D=A // 10169
@SP // 10170
AM=M+1 // 10171
A=A-1 // 10172
M=D // 10173
@43 // 10174
D=A // 10175
@SP // 10176
AM=M+1 // 10177
A=A-1 // 10178
M=D // 10179
@43 // 10180
D=A // 10181
@SP // 10182
AM=M+1 // 10183
A=A-1 // 10184
M=D // 10185
@SP // 10186
AM=M+1 // 10187
A=A-1 // 10188
M=0 // 10189
@SP // 10190
AM=M+1 // 10191
A=A-1 // 10192
M=0 // 10193
// call Output.create
@17 // 10194
D=A // 10195
@14 // 10196
M=D // 10197
@Output.create // 10198
D=A // 10199
@13 // 10200
M=D // 10201
@Output.initMap.ret.79 // 10202
D=A // 10203
@CALL // 10204
0;JMP // 10205
(Output.initMap.ret.79)
@SP // 10206
M=M-1 // 10207

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10208
D=A // 10209
@SP // 10210
M=D+M // 10211
@110 // 10212
D=A // 10213
@SP // 10214
A=M-1 // 10215
M=0 // 10216
A=A-1 // 10217
M=0 // 10218
A=A-1 // 10219
M=0 // 10220
A=A-1 // 10221
M=D // 10222
A=A-1 // 10223
@29 // 10224
D=A // 10225
@SP // 10226
AM=M+1 // 10227
A=A-1 // 10228
M=D // 10229
@51 // 10230
D=A // 10231
@SP // 10232
AM=M+1 // 10233
A=A-1 // 10234
M=D // 10235
@51 // 10236
D=A // 10237
@SP // 10238
AM=M+1 // 10239
A=A-1 // 10240
M=D // 10241
@51 // 10242
D=A // 10243
@SP // 10244
AM=M+1 // 10245
A=A-1 // 10246
M=D // 10247
@51 // 10248
D=A // 10249
@SP // 10250
AM=M+1 // 10251
A=A-1 // 10252
M=D // 10253
@51 // 10254
D=A // 10255
@SP // 10256
AM=M+1 // 10257
A=A-1 // 10258
M=D // 10259
@SP // 10260
AM=M+1 // 10261
A=A-1 // 10262
M=0 // 10263
@SP // 10264
AM=M+1 // 10265
A=A-1 // 10266
M=0 // 10267
// call Output.create
@17 // 10268
D=A // 10269
@14 // 10270
M=D // 10271
@Output.create // 10272
D=A // 10273
@13 // 10274
M=D // 10275
@Output.initMap.ret.80 // 10276
D=A // 10277
@CALL // 10278
0;JMP // 10279
(Output.initMap.ret.80)
@SP // 10280
M=M-1 // 10281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10282
D=A // 10283
@SP // 10284
M=D+M // 10285
@111 // 10286
D=A // 10287
@SP // 10288
A=M-1 // 10289
M=0 // 10290
A=A-1 // 10291
M=0 // 10292
A=A-1 // 10293
M=0 // 10294
A=A-1 // 10295
M=D // 10296
A=A-1 // 10297
@30 // 10298
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
@51 // 10310
D=A // 10311
@SP // 10312
AM=M+1 // 10313
A=A-1 // 10314
M=D // 10315
@51 // 10316
D=A // 10317
@SP // 10318
AM=M+1 // 10319
A=A-1 // 10320
M=D // 10321
@51 // 10322
D=A // 10323
@SP // 10324
AM=M+1 // 10325
A=A-1 // 10326
M=D // 10327
@30 // 10328
D=A // 10329
@SP // 10330
AM=M+1 // 10331
A=A-1 // 10332
M=D // 10333
@SP // 10334
AM=M+1 // 10335
A=A-1 // 10336
M=0 // 10337
@SP // 10338
AM=M+1 // 10339
A=A-1 // 10340
M=0 // 10341
// call Output.create
@17 // 10342
D=A // 10343
@14 // 10344
M=D // 10345
@Output.create // 10346
D=A // 10347
@13 // 10348
M=D // 10349
@Output.initMap.ret.81 // 10350
D=A // 10351
@CALL // 10352
0;JMP // 10353
(Output.initMap.ret.81)
@SP // 10354
M=M-1 // 10355

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10356
D=A // 10357
@SP // 10358
M=D+M // 10359
@112 // 10360
D=A // 10361
@SP // 10362
A=M-1 // 10363
M=0 // 10364
A=A-1 // 10365
M=0 // 10366
A=A-1 // 10367
M=0 // 10368
A=A-1 // 10369
M=D // 10370
A=A-1 // 10371
@30 // 10372
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
@51 // 10390
D=A // 10391
@SP // 10392
AM=M+1 // 10393
A=A-1 // 10394
M=D // 10395
@31 // 10396
D=A // 10397
@SP // 10398
AM=M+1 // 10399
A=A-1 // 10400
M=D // 10401
@3 // 10402
D=A // 10403
@SP // 10404
AM=M+1 // 10405
A=A-1 // 10406
M=D // 10407
@3 // 10408
D=A // 10409
@SP // 10410
AM=M+1 // 10411
A=A-1 // 10412
M=D // 10413
@SP // 10414
AM=M+1 // 10415
A=A-1 // 10416
M=0 // 10417
// call Output.create
@17 // 10418
D=A // 10419
@14 // 10420
M=D // 10421
@Output.create // 10422
D=A // 10423
@13 // 10424
M=D // 10425
@Output.initMap.ret.82 // 10426
D=A // 10427
@CALL // 10428
0;JMP // 10429
(Output.initMap.ret.82)
@SP // 10430
M=M-1 // 10431

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10432
D=A // 10433
@SP // 10434
M=D+M // 10435
@113 // 10436
D=A // 10437
@SP // 10438
A=M-1 // 10439
M=0 // 10440
A=A-1 // 10441
M=0 // 10442
A=A-1 // 10443
M=0 // 10444
A=A-1 // 10445
M=D // 10446
A=A-1 // 10447
@30 // 10448
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
@51 // 10460
D=A // 10461
@SP // 10462
AM=M+1 // 10463
A=A-1 // 10464
M=D // 10465
@51 // 10466
D=A // 10467
@SP // 10468
AM=M+1 // 10469
A=A-1 // 10470
M=D // 10471
@62 // 10472
D=A // 10473
@SP // 10474
AM=M+1 // 10475
A=A-1 // 10476
M=D // 10477
@48 // 10478
D=A // 10479
@SP // 10480
AM=M+1 // 10481
A=A-1 // 10482
M=D // 10483
@48 // 10484
D=A // 10485
@SP // 10486
AM=M+1 // 10487
A=A-1 // 10488
M=D // 10489
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
@Output.initMap.ret.83 // 10502
D=A // 10503
@CALL // 10504
0;JMP // 10505
(Output.initMap.ret.83)
@SP // 10506
M=M-1 // 10507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10508
D=A // 10509
@SP // 10510
M=D+M // 10511
@114 // 10512
D=A // 10513
@SP // 10514
A=M-1 // 10515
M=0 // 10516
A=A-1 // 10517
M=0 // 10518
A=A-1 // 10519
M=0 // 10520
A=A-1 // 10521
M=D // 10522
A=A-1 // 10523
@29 // 10524
D=A // 10525
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=D // 10529
@55 // 10530
D=A // 10531
@SP // 10532
AM=M+1 // 10533
A=A-1 // 10534
M=D // 10535
@51 // 10536
D=A // 10537
@SP // 10538
AM=M+1 // 10539
A=A-1 // 10540
M=D // 10541
@3 // 10542
D=A // 10543
@SP // 10544
AM=M+1 // 10545
A=A-1 // 10546
M=D // 10547
@3 // 10548
D=A // 10549
@SP // 10550
AM=M+1 // 10551
A=A-1 // 10552
M=D // 10553
@7 // 10554
D=A // 10555
@SP // 10556
AM=M+1 // 10557
A=A-1 // 10558
M=D // 10559
@SP // 10560
AM=M+1 // 10561
A=A-1 // 10562
M=0 // 10563
@SP // 10564
AM=M+1 // 10565
A=A-1 // 10566
M=0 // 10567
// call Output.create
@17 // 10568
D=A // 10569
@14 // 10570
M=D // 10571
@Output.create // 10572
D=A // 10573
@13 // 10574
M=D // 10575
@Output.initMap.ret.84 // 10576
D=A // 10577
@CALL // 10578
0;JMP // 10579
(Output.initMap.ret.84)
@SP // 10580
M=M-1 // 10581

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10582
D=A // 10583
@SP // 10584
M=D+M // 10585
@115 // 10586
D=A // 10587
@SP // 10588
A=M-1 // 10589
M=0 // 10590
A=A-1 // 10591
M=0 // 10592
A=A-1 // 10593
M=0 // 10594
A=A-1 // 10595
M=D // 10596
A=A-1 // 10597
@30 // 10598
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
@6 // 10610
D=A // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=D // 10615
@24 // 10616
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
@30 // 10628
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
@Output.initMap.ret.85 // 10650
D=A // 10651
@CALL // 10652
0;JMP // 10653
(Output.initMap.ret.85)
@SP // 10654
M=M-1 // 10655

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10656
D=A // 10657
@SP // 10658
AM=M+1 // 10659
A=A-1 // 10660
M=D // 10661
@4 // 10662
D=A // 10663
@SP // 10664
AM=M+1 // 10665
A=A-1 // 10666
M=D // 10667
@6 // 10668
D=A // 10669
@SP // 10670
AM=M+1 // 10671
A=A-1 // 10672
M=D // 10673
@6 // 10674
D=A // 10675
@SP // 10676
AM=M+1 // 10677
A=A-1 // 10678
M=D // 10679
@15 // 10680
D=A // 10681
@SP // 10682
AM=M+1 // 10683
A=A-1 // 10684
M=D // 10685
@6 // 10686
D=A // 10687
@SP // 10688
AM=M+1 // 10689
A=A-1 // 10690
M=D // 10691
@6 // 10692
D=A // 10693
@SP // 10694
AM=M+1 // 10695
A=A-1 // 10696
M=D // 10697
@6 // 10698
D=A // 10699
@SP // 10700
AM=M+1 // 10701
A=A-1 // 10702
M=D // 10703
@54 // 10704
D=A // 10705
@SP // 10706
AM=M+1 // 10707
A=A-1 // 10708
M=D // 10709
@28 // 10710
D=A // 10711
@SP // 10712
AM=M+1 // 10713
A=A-1 // 10714
M=D // 10715
@SP // 10716
AM=M+1 // 10717
A=A-1 // 10718
M=0 // 10719
@SP // 10720
AM=M+1 // 10721
A=A-1 // 10722
M=0 // 10723
// call Output.create
@17 // 10724
D=A // 10725
@14 // 10726
M=D // 10727
@Output.create // 10728
D=A // 10729
@13 // 10730
M=D // 10731
@Output.initMap.ret.86 // 10732
D=A // 10733
@CALL // 10734
0;JMP // 10735
(Output.initMap.ret.86)
@SP // 10736
M=M-1 // 10737

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10738
D=A // 10739
@SP // 10740
M=D+M // 10741
@117 // 10742
D=A // 10743
@SP // 10744
A=M-1 // 10745
M=0 // 10746
A=A-1 // 10747
M=0 // 10748
A=A-1 // 10749
M=0 // 10750
A=A-1 // 10751
M=D // 10752
A=A-1 // 10753
@27 // 10754
D=A // 10755
@SP // 10756
AM=M+1 // 10757
A=A-1 // 10758
M=D // 10759
@27 // 10760
D=A // 10761
@SP // 10762
AM=M+1 // 10763
A=A-1 // 10764
M=D // 10765
@27 // 10766
D=A // 10767
@SP // 10768
AM=M+1 // 10769
A=A-1 // 10770
M=D // 10771
@27 // 10772
D=A // 10773
@SP // 10774
AM=M+1 // 10775
A=A-1 // 10776
M=D // 10777
@27 // 10778
D=A // 10779
@SP // 10780
AM=M+1 // 10781
A=A-1 // 10782
M=D // 10783
@54 // 10784
D=A // 10785
@SP // 10786
AM=M+1 // 10787
A=A-1 // 10788
M=D // 10789
@SP // 10790
AM=M+1 // 10791
A=A-1 // 10792
M=0 // 10793
@SP // 10794
AM=M+1 // 10795
A=A-1 // 10796
M=0 // 10797
// call Output.create
@17 // 10798
D=A // 10799
@14 // 10800
M=D // 10801
@Output.create // 10802
D=A // 10803
@13 // 10804
M=D // 10805
@Output.initMap.ret.87 // 10806
D=A // 10807
@CALL // 10808
0;JMP // 10809
(Output.initMap.ret.87)
@SP // 10810
M=M-1 // 10811

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10812
D=A // 10813
@SP // 10814
M=D+M // 10815
@118 // 10816
D=A // 10817
@SP // 10818
A=M-1 // 10819
M=0 // 10820
A=A-1 // 10821
M=0 // 10822
A=A-1 // 10823
M=0 // 10824
A=A-1 // 10825
M=D // 10826
A=A-1 // 10827
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
@51 // 10846
D=A // 10847
@SP // 10848
AM=M+1 // 10849
A=A-1 // 10850
M=D // 10851
@30 // 10852
D=A // 10853
@SP // 10854
AM=M+1 // 10855
A=A-1 // 10856
M=D // 10857
@12 // 10858
D=A // 10859
@SP // 10860
AM=M+1 // 10861
A=A-1 // 10862
M=D // 10863
@SP // 10864
AM=M+1 // 10865
A=A-1 // 10866
M=0 // 10867
@SP // 10868
AM=M+1 // 10869
A=A-1 // 10870
M=0 // 10871
// call Output.create
@17 // 10872
D=A // 10873
@14 // 10874
M=D // 10875
@Output.create // 10876
D=A // 10877
@13 // 10878
M=D // 10879
@Output.initMap.ret.88 // 10880
D=A // 10881
@CALL // 10882
0;JMP // 10883
(Output.initMap.ret.88)
@SP // 10884
M=M-1 // 10885

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10886
D=A // 10887
@SP // 10888
M=D+M // 10889
@119 // 10890
D=A // 10891
@SP // 10892
A=M-1 // 10893
M=0 // 10894
A=A-1 // 10895
M=0 // 10896
A=A-1 // 10897
M=0 // 10898
A=A-1 // 10899
M=D // 10900
A=A-1 // 10901
@51 // 10902
D=A // 10903
@SP // 10904
AM=M+1 // 10905
A=A-1 // 10906
M=D // 10907
@51 // 10908
D=A // 10909
@SP // 10910
AM=M+1 // 10911
A=A-1 // 10912
M=D // 10913
@51 // 10914
D=A // 10915
@SP // 10916
AM=M+1 // 10917
A=A-1 // 10918
M=D // 10919
@63 // 10920
D=A // 10921
@SP // 10922
AM=M+1 // 10923
A=A-1 // 10924
M=D // 10925
@63 // 10926
D=A // 10927
@SP // 10928
AM=M+1 // 10929
A=A-1 // 10930
M=D // 10931
@18 // 10932
D=A // 10933
@SP // 10934
AM=M+1 // 10935
A=A-1 // 10936
M=D // 10937
@SP // 10938
AM=M+1 // 10939
A=A-1 // 10940
M=0 // 10941
@SP // 10942
AM=M+1 // 10943
A=A-1 // 10944
M=0 // 10945
// call Output.create
@17 // 10946
D=A // 10947
@14 // 10948
M=D // 10949
@Output.create // 10950
D=A // 10951
@13 // 10952
M=D // 10953
@Output.initMap.ret.89 // 10954
D=A // 10955
@CALL // 10956
0;JMP // 10957
(Output.initMap.ret.89)
@SP // 10958
M=M-1 // 10959

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10960
D=A // 10961
@SP // 10962
M=D+M // 10963
@120 // 10964
D=A // 10965
@SP // 10966
A=M-1 // 10967
M=0 // 10968
A=A-1 // 10969
M=0 // 10970
A=A-1 // 10971
M=0 // 10972
A=A-1 // 10973
M=D // 10974
A=A-1 // 10975
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
@12 // 10988
D=A // 10989
@SP // 10990
AM=M+1 // 10991
A=A-1 // 10992
M=D // 10993
@12 // 10994
D=A // 10995
@SP // 10996
AM=M+1 // 10997
A=A-1 // 10998
M=D // 10999
@30 // 11000
D=A // 11001
@SP // 11002
AM=M+1 // 11003
A=A-1 // 11004
M=D // 11005
@51 // 11006
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
@Output.initMap.ret.90 // 11028
D=A // 11029
@CALL // 11030
0;JMP // 11031
(Output.initMap.ret.90)
@SP // 11032
M=M-1 // 11033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11034
D=A // 11035
@SP // 11036
M=D+M // 11037
@121 // 11038
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
@51 // 11050
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
@62 // 11068
D=A // 11069
@SP // 11070
AM=M+1 // 11071
A=A-1 // 11072
M=D // 11073
@48 // 11074
D=A // 11075
@SP // 11076
AM=M+1 // 11077
A=A-1 // 11078
M=D // 11079
@24 // 11080
D=A // 11081
@SP // 11082
AM=M+1 // 11083
A=A-1 // 11084
M=D // 11085
@15 // 11086
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
@Output.initMap.ret.91 // 11104
D=A // 11105
@CALL // 11106
0;JMP // 11107
(Output.initMap.ret.91)
@SP // 11108
M=M-1 // 11109

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11110
D=A // 11111
@SP // 11112
M=D+M // 11113
@122 // 11114
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
@63 // 11126
D=A // 11127
@SP // 11128
AM=M+1 // 11129
A=A-1 // 11130
M=D // 11131
@27 // 11132
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
@6 // 11144
D=A // 11145
@SP // 11146
AM=M+1 // 11147
A=A-1 // 11148
M=D // 11149
@51 // 11150
D=A // 11151
@SP // 11152
AM=M+1 // 11153
A=A-1 // 11154
M=D // 11155
@63 // 11156
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
@Output.initMap.ret.92 // 11178
D=A // 11179
@CALL // 11180
0;JMP // 11181
(Output.initMap.ret.92)
@SP // 11182
M=M-1 // 11183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11184
D=A // 11185
@SP // 11186
AM=M+1 // 11187
A=A-1 // 11188
M=D // 11189
@56 // 11190
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
@7 // 11214
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
@56 // 11238
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
@Output.initMap.ret.93 // 11260
D=A // 11261
@CALL // 11262
0;JMP // 11263
(Output.initMap.ret.93)
@SP // 11264
M=M-1 // 11265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11266
D=A // 11267
@SP // 11268
AM=M+1 // 11269
A=A-1 // 11270
M=D // 11271
@12 // 11272
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
@12 // 11296
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
@12 // 11320
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
@Output.initMap.ret.94 // 11342
D=A // 11343
@CALL // 11344
0;JMP // 11345
(Output.initMap.ret.94)
@SP // 11346
M=M-1 // 11347

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11348
D=A // 11349
@SP // 11350
AM=M+1 // 11351
A=A-1 // 11352
M=D // 11353
@7 // 11354
D=A // 11355
@SP // 11356
AM=M+1 // 11357
A=A-1 // 11358
M=D // 11359
@12 // 11360
D=A // 11361
@SP // 11362
AM=M+1 // 11363
A=A-1 // 11364
M=D // 11365
@12 // 11366
D=A // 11367
@SP // 11368
AM=M+1 // 11369
A=A-1 // 11370
M=D // 11371
@12 // 11372
D=A // 11373
@SP // 11374
AM=M+1 // 11375
A=A-1 // 11376
M=D // 11377
@56 // 11378
D=A // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=D // 11383
@12 // 11384
D=A // 11385
@SP // 11386
AM=M+1 // 11387
A=A-1 // 11388
M=D // 11389
@12 // 11390
D=A // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=D // 11395
@12 // 11396
D=A // 11397
@SP // 11398
AM=M+1 // 11399
A=A-1 // 11400
M=D // 11401
@7 // 11402
D=A // 11403
@SP // 11404
AM=M+1 // 11405
A=A-1 // 11406
M=D // 11407
@SP // 11408
AM=M+1 // 11409
A=A-1 // 11410
M=0 // 11411
@SP // 11412
AM=M+1 // 11413
A=A-1 // 11414
M=0 // 11415
// call Output.create
@17 // 11416
D=A // 11417
@14 // 11418
M=D // 11419
@Output.create // 11420
D=A // 11421
@13 // 11422
M=D // 11423
@Output.initMap.ret.95 // 11424
D=A // 11425
@CALL // 11426
0;JMP // 11427
(Output.initMap.ret.95)
@SP // 11428
M=M-1 // 11429

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11430
D=A // 11431
@SP // 11432
AM=M+1 // 11433
A=A-1 // 11434
M=D // 11435
@38 // 11436
D=A // 11437
@SP // 11438
AM=M+1 // 11439
A=A-1 // 11440
M=D // 11441
@45 // 11442
D=A // 11443
@SP // 11444
AM=M+1 // 11445
A=A-1 // 11446
M=D // 11447
@25 // 11448
D=A // 11449
@SP // 11450
AM=M+1 // 11451
A=A-1 // 11452
M=D // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=0 // 11457
@SP // 11458
AM=M+1 // 11459
A=A-1 // 11460
M=0 // 11461
@SP // 11462
AM=M+1 // 11463
A=A-1 // 11464
M=0 // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=0 // 11469
@SP // 11470
AM=M+1 // 11471
A=A-1 // 11472
M=0 // 11473
@SP // 11474
AM=M+1 // 11475
A=A-1 // 11476
M=0 // 11477
@SP // 11478
AM=M+1 // 11479
A=A-1 // 11480
M=0 // 11481
@SP // 11482
AM=M+1 // 11483
A=A-1 // 11484
M=0 // 11485
// call Output.create
@17 // 11486
D=A // 11487
@14 // 11488
M=D // 11489
@Output.create // 11490
D=A // 11491
@13 // 11492
M=D // 11493
@Output.initMap.ret.96 // 11494
D=A // 11495
@CALL // 11496
0;JMP // 11497
(Output.initMap.ret.96)
@SP // 11498
M=M-1 // 11499

////PushInstruction("constant 0")
@SP // 11500
AM=M+1 // 11501
A=A-1 // 11502
M=0 // 11503
@RETURN // 11504
0;JMP // 11505

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 11506
AM=M+1 // 11507
A=A-1 // 11508
M=0 // 11509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11510
D=A // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=D // 11515
// call Array.new
@6 // 11516
D=A // 11517
@14 // 11518
M=D // 11519
@Array.new // 11520
D=A // 11521
@13 // 11522
M=D // 11523
@Output.create.ret.0 // 11524
D=A // 11525
@CALL // 11526
0;JMP // 11527
(Output.create.ret.0)
@SP // 11528
AM=M-1 // 11529
D=M // 11530
@LCL // 11531
A=M // 11532
M=D // 11533

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11534
D=M // 11535
@SP // 11536
AM=M+1 // 11537
A=A-1 // 11538
M=D // 11539
@ARG // 11540
A=M // 11541
D=M // 11542
@SP // 11543
AM=M-1 // 11544
D=D+M // 11545
@SP // 11546
AM=M+1 // 11547
A=A-1 // 11548
M=D // 11549
@LCL // 11550
A=M // 11551
D=M // 11552
@SP // 11553
AM=M-1 // 11554
A=M // 11555
M=D // 11556

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11557
A=M // 11558
D=M // 11559
@SP // 11560
AM=M+1 // 11561
A=A-1 // 11562
M=D // 11563
@ARG // 11564
A=M+1 // 11565
D=M // 11566
@SP // 11567
AM=M-1 // 11568
A=M // 11569
M=D // 11570

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11571
A=M // 11572
D=M // 11573
@SP // 11574
AM=M+1 // 11575
A=A-1 // 11576
M=D+1 // 11577
@ARG // 11578
A=M+1 // 11579
A=A+1 // 11580
D=M // 11581
@SP // 11582
AM=M-1 // 11583
A=M // 11584
M=D // 11585

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11586
A=M // 11587
D=M // 11588
@2 // 11589
D=D+A // 11590
@SP // 11591
AM=M+1 // 11592
A=A-1 // 11593
M=D // 11594
@ARG // 11595
A=M+1 // 11596
A=A+1 // 11597
A=A+1 // 11598
D=M // 11599
@SP // 11600
AM=M-1 // 11601
A=M // 11602
M=D // 11603

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11604
A=M // 11605
D=M // 11606
@3 // 11607
D=D+A // 11608
@SP // 11609
AM=M+1 // 11610
A=A-1 // 11611
M=D // 11612
@ARG // 11613
D=M // 11614
@4 // 11615
A=D+A // 11616
D=M // 11617
@SP // 11618
AM=M-1 // 11619
A=M // 11620
M=D // 11621

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11622
A=M // 11623
D=M // 11624
@4 // 11625
D=D+A // 11626
@SP // 11627
AM=M+1 // 11628
A=A-1 // 11629
M=D // 11630
@ARG // 11631
D=M // 11632
@5 // 11633
A=D+A // 11634
D=M // 11635
@SP // 11636
AM=M-1 // 11637
A=M // 11638
M=D // 11639

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11640
A=M // 11641
D=M // 11642
@5 // 11643
D=D+A // 11644
@SP // 11645
AM=M+1 // 11646
A=A-1 // 11647
M=D // 11648
@ARG // 11649
D=M // 11650
@6 // 11651
A=D+A // 11652
D=M // 11653
@SP // 11654
AM=M-1 // 11655
A=M // 11656
M=D // 11657

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11658
A=M // 11659
D=M // 11660
@6 // 11661
D=D+A // 11662
@SP // 11663
AM=M+1 // 11664
A=A-1 // 11665
M=D // 11666
@ARG // 11667
D=M // 11668
@7 // 11669
A=D+A // 11670
D=M // 11671
@SP // 11672
AM=M-1 // 11673
A=M // 11674
M=D // 11675

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11676
A=M // 11677
D=M // 11678
@7 // 11679
D=D+A // 11680
@SP // 11681
AM=M+1 // 11682
A=A-1 // 11683
M=D // 11684
@ARG // 11685
D=M // 11686
@8 // 11687
A=D+A // 11688
D=M // 11689
@SP // 11690
AM=M-1 // 11691
A=M // 11692
M=D // 11693

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11694
A=M // 11695
D=M // 11696
@8 // 11697
D=D+A // 11698
@SP // 11699
AM=M+1 // 11700
A=A-1 // 11701
M=D // 11702
@ARG // 11703
D=M // 11704
@9 // 11705
A=D+A // 11706
D=M // 11707
@SP // 11708
AM=M-1 // 11709
A=M // 11710
M=D // 11711

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11712
A=M // 11713
D=M // 11714
@9 // 11715
D=D+A // 11716
@SP // 11717
AM=M+1 // 11718
A=A-1 // 11719
M=D // 11720
@ARG // 11721
D=M // 11722
@10 // 11723
A=D+A // 11724
D=M // 11725
@SP // 11726
AM=M-1 // 11727
A=M // 11728
M=D // 11729

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11730
A=M // 11731
D=M // 11732
@10 // 11733
D=D+A // 11734
@SP // 11735
AM=M+1 // 11736
A=A-1 // 11737
M=D // 11738
@ARG // 11739
D=M // 11740
@11 // 11741
A=D+A // 11742
D=M // 11743
@SP // 11744
AM=M-1 // 11745
A=M // 11746
M=D // 11747

////PushInstruction("constant 0")
@SP // 11748
AM=M+1 // 11749
A=A-1 // 11750
M=0 // 11751
@RETURN // 11752
0;JMP // 11753

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
@Output.getMap.LT.0 // 11754
D=A // 11755
@SP // 11756
AM=M+1 // 11757
A=A-1 // 11758
M=D // 11759
@ARG // 11760
A=M // 11761
D=M // 11762
@32 // 11763
D=D-A // 11764
@DO_LT // 11765
0;JMP // 11766
(Output.getMap.LT.0)
@SP // 11767
AM=M+1 // 11768
A=A-1 // 11769
M=D // 11770
@Output.getMap.GT.1 // 11771
D=A // 11772
@SP // 11773
AM=M+1 // 11774
A=A-1 // 11775
M=D // 11776
@ARG // 11777
A=M // 11778
D=M // 11779
@126 // 11780
D=D-A // 11781
@DO_GT // 11782
0;JMP // 11783
(Output.getMap.GT.1)
@SP // 11784
AM=M-1 // 11785
D=D|M // 11786
D=!D // 11787
@Output.getMap.IfElse1 // 11788
D;JNE // 11789

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11790
A=M // 11791
M=0 // 11792

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 11793
0;JMP // 11794

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
@Output.0 // 11795
D=M // 11796
@SP // 11797
AM=M+1 // 11798
A=A-1 // 11799
M=D // 11800
@ARG // 11801
A=M // 11802
D=M // 11803
@SP // 11804
AM=M-1 // 11805
A=D+M // 11806
D=M // 11807
@SP // 11808
AM=M+1 // 11809
A=A-1 // 11810
M=D // 11811
@RETURN // 11812
0;JMP // 11813

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 11814
A=M+1 // 11815
D=M // 11816
@Output.1 // 11817
M=D // 11818

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 11819
A=M // 11820
D=M // 11821
@Output.2 // 11822
M=D // 11823

////PushInstruction("constant 0")
@SP // 11824
AM=M+1 // 11825
A=A-1 // 11826
M=0 // 11827
@RETURN // 11828
0;JMP // 11829

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 11830
D=A // 11831
@SP // 11832
AM=D+M // 11833
A=A-1 // 11834
M=0 // 11835
A=A-1 // 11836
M=0 // 11837
A=A-1 // 11838
M=0 // 11839
A=A-1 // 11840
M=0 // 11841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 11842
A=M // 11843
D=M // 11844
@SP // 11845
AM=M+1 // 11846
A=A-1 // 11847
M=D // 11848
// call Output.getMap
@6 // 11849
D=A // 11850
@14 // 11851
M=D // 11852
@Output.getMap // 11853
D=A // 11854
@13 // 11855
M=D // 11856
@Output.printChar.ret.0 // 11857
D=A // 11858
@CALL // 11859
0;JMP // 11860
(Output.printChar.ret.0)
@SP // 11861
AM=M-1 // 11862
D=M // 11863
@LCL // 11864
A=M // 11865
M=D // 11866

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 11867
A=M+1 // 11868
A=A+1 // 11869
A=A+1 // 11870
M=0 // 11871

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
@Output.printChar.LT.2 // 11872
D=A // 11873
@SP // 11874
AM=M+1 // 11875
A=A-1 // 11876
M=D // 11877
@LCL // 11878
A=M+1 // 11879
A=A+1 // 11880
A=A+1 // 11881
D=M // 11882
@11 // 11883
D=D-A // 11884
@DO_LT // 11885
0;JMP // 11886
(Output.printChar.LT.2)
D=!D // 11887
@WHILE_END_Output.printChar1 // 11888
D;JNE // 11889

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

@Output.2 // 11890
D=M // 11891
@SP // 11892
AM=M+1 // 11893
A=A-1 // 11894
M=D // 11895
@11 // 11896
D=A // 11897
@SP // 11898
AM=M+1 // 11899
A=A-1 // 11900
M=D // 11901
// call Math.multiply
@7 // 11902
D=A // 11903
@14 // 11904
M=D // 11905
@Math.multiply // 11906
D=A // 11907
@13 // 11908
M=D // 11909
@Output.printChar.ret.1 // 11910
D=A // 11911
@CALL // 11912
0;JMP // 11913
(Output.printChar.ret.1)
@LCL // 11914
A=M+1 // 11915
A=A+1 // 11916
A=A+1 // 11917
D=M // 11918
@SP // 11919
AM=M-1 // 11920
D=D+M // 11921
@SP // 11922
AM=M+1 // 11923
A=A-1 // 11924
M=D // 11925
@32 // 11926
D=A // 11927
@SP // 11928
AM=M+1 // 11929
A=A-1 // 11930
M=D // 11931
// call Math.multiply
@7 // 11932
D=A // 11933
@14 // 11934
M=D // 11935
@Math.multiply // 11936
D=A // 11937
@13 // 11938
M=D // 11939
@Output.printChar.ret.2 // 11940
D=A // 11941
@CALL // 11942
0;JMP // 11943
(Output.printChar.ret.2)
@SP // 11944
AM=M-1 // 11945
D=M // 11946
@16384 // 11947
D=D+A // 11948
@SP // 11949
AM=M+1 // 11950
A=A-1 // 11951
M=D // 11952
@Output.1 // 11953
D=M // 11954
@SP // 11955
AM=M+1 // 11956
A=A-1 // 11957
M=D // 11958
@2 // 11959
D=A // 11960
@SP // 11961
AM=M+1 // 11962
A=A-1 // 11963
M=D // 11964
// call Math.divide
@7 // 11965
D=A // 11966
@14 // 11967
M=D // 11968
@Math.divide // 11969
D=A // 11970
@13 // 11971
M=D // 11972
@Output.printChar.ret.3 // 11973
D=A // 11974
@CALL // 11975
0;JMP // 11976
(Output.printChar.ret.3)
@SP // 11977
AM=M-1 // 11978
D=M // 11979
@SP // 11980
AM=M-1 // 11981
D=D+M // 11982
@LCL // 11983
A=M+1 // 11984
M=D // 11985

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
@Output.printChar.EQ.3 // 11986
D=A // 11987
@SP // 11988
AM=M+1 // 11989
A=A-1 // 11990
M=D // 11991
@Output.1 // 11992
D=M // 11993
@1 // 11994
D=D&A // 11995
@DO_EQ // 11996
0;JMP // 11997
(Output.printChar.EQ.3)
D=!D // 11998
@Output.printChar.IfElse1 // 11999
D;JNE // 12000

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

@LCL // 12001
A=M+1 // 12002
A=A+1 // 12003
A=A+1 // 12004
D=M // 12005
A=A-1 // 12006
A=A-1 // 12007
A=A-1 // 12008
A=D+M // 12009
D=M // 12010
@LCL // 12011
A=M+1 // 12012
A=A+1 // 12013
M=D // 12014

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 12015
0;JMP // 12016

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

@LCL // 12017
A=M+1 // 12018
A=A+1 // 12019
A=A+1 // 12020
D=M // 12021
A=A-1 // 12022
A=A-1 // 12023
A=A-1 // 12024
A=D+M // 12025
D=M // 12026
@SP // 12027
AM=M+1 // 12028
A=A-1 // 12029
M=D // 12030
@256 // 12031
D=A // 12032
@SP // 12033
AM=M+1 // 12034
A=A-1 // 12035
M=D // 12036
// call Math.multiply
@7 // 12037
D=A // 12038
@14 // 12039
M=D // 12040
@Math.multiply // 12041
D=A // 12042
@13 // 12043
M=D // 12044
@Output.printChar.ret.4 // 12045
D=A // 12046
@CALL // 12047
0;JMP // 12048
(Output.printChar.ret.4)
@SP // 12049
AM=M-1 // 12050
D=M // 12051
@LCL // 12052
A=M+1 // 12053
A=A+1 // 12054
M=D // 12055

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
@LCL // 12056
A=M+1 // 12057
D=M // 12058
@SP // 12059
AM=M+1 // 12060
A=A-1 // 12061
M=D // 12062
@LCL // 12063
A=M+1 // 12064
D=M // 12065
@0 // 12066
A=D+A // 12067
D=M // 12068
@SP // 12069
AM=M+1 // 12070
A=A-1 // 12071
M=D // 12072
@LCL // 12073
A=M+1 // 12074
A=A+1 // 12075
D=M // 12076
@SP // 12077
AM=M-1 // 12078
D=D|M // 12079
@SP // 12080
AM=M-1 // 12081
A=M // 12082
M=D // 12083

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

@LCL // 12084
A=M+1 // 12085
A=A+1 // 12086
A=A+1 // 12087
M=M+1 // 12088

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12089
0;JMP // 12090

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
@Output.printChar.EQ.4 // 12091
D=A // 12092
@SP // 12093
AM=M+1 // 12094
A=A-1 // 12095
M=D // 12096
@Output.1 // 12097
D=M // 12098
@63 // 12099
D=D-A // 12100
@DO_EQ // 12101
0;JMP // 12102
(Output.printChar.EQ.4)
D=!D // 12103
@Output.printChar.IfElse2 // 12104
D;JNE // 12105

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12106
D=A // 12107
@14 // 12108
M=D // 12109
@Output.println // 12110
D=A // 12111
@13 // 12112
M=D // 12113
@Output.printChar.ret.5 // 12114
D=A // 12115
@CALL // 12116
0;JMP // 12117
(Output.printChar.ret.5)
@SP // 12118
M=M-1 // 12119

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12120
0;JMP // 12121

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

@Output.1 // 12122
M=M+1 // 12123

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12124
AM=M+1 // 12125
A=A-1 // 12126
M=0 // 12127
@RETURN // 12128
0;JMP // 12129

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12130
M=M+1 // 12131
AM=M+1 // 12132
A=A-1 // 12133
M=0 // 12134
A=A-1 // 12135
M=0 // 12136

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12137
A=M // 12138
M=0 // 12139

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12140
A=M // 12141
D=M // 12142
@SP // 12143
AM=M+1 // 12144
A=A-1 // 12145
M=D // 12146
// call String.length
@6 // 12147
D=A // 12148
@14 // 12149
M=D // 12150
@String.length // 12151
D=A // 12152
@13 // 12153
M=D // 12154
@Output.printString.ret.0 // 12155
D=A // 12156
@CALL // 12157
0;JMP // 12158
(Output.printString.ret.0)
@SP // 12159
AM=M-1 // 12160
D=M // 12161
@LCL // 12162
A=M+1 // 12163
M=D // 12164

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
@Output.printString.LT.5 // 12165
D=A // 12166
@SP // 12167
AM=M+1 // 12168
A=A-1 // 12169
M=D // 12170
@LCL // 12171
A=M+1 // 12172
D=M // 12173
A=A-1 // 12174
D=M-D // 12175
@DO_LT // 12176
0;JMP // 12177
(Output.printString.LT.5)
D=!D // 12178
@WHILE_END_Output.printString1 // 12179
D;JNE // 12180

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12181
A=M // 12182
D=M // 12183
@SP // 12184
AM=M+1 // 12185
A=A-1 // 12186
M=D // 12187
@LCL // 12188
A=M // 12189
D=M // 12190
@SP // 12191
AM=M+1 // 12192
A=A-1 // 12193
M=D // 12194
// call String.charAt
@7 // 12195
D=A // 12196
@14 // 12197
M=D // 12198
@String.charAt // 12199
D=A // 12200
@13 // 12201
M=D // 12202
@Output.printString.ret.1 // 12203
D=A // 12204
@CALL // 12205
0;JMP // 12206
(Output.printString.ret.1)
// call Output.printChar
@6 // 12207
D=A // 12208
@14 // 12209
M=D // 12210
@Output.printChar // 12211
D=A // 12212
@13 // 12213
M=D // 12214
@Output.printString.ret.2 // 12215
D=A // 12216
@CALL // 12217
0;JMP // 12218
(Output.printString.ret.2)
@SP // 12219
M=M-1 // 12220

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

@LCL // 12221
A=M // 12222
M=M+1 // 12223

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12224
0;JMP // 12225

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12226
AM=M+1 // 12227
A=A-1 // 12228
M=0 // 12229
@RETURN // 12230
0;JMP // 12231

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12232
AM=M+1 // 12233
A=A-1 // 12234
M=0 // 12235

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12236
D=A // 12237
@SP // 12238
AM=M+1 // 12239
A=A-1 // 12240
M=D // 12241
// call String.new
@6 // 12242
D=A // 12243
@14 // 12244
M=D // 12245
@String.new // 12246
D=A // 12247
@13 // 12248
M=D // 12249
@Output.printInt.ret.0 // 12250
D=A // 12251
@CALL // 12252
0;JMP // 12253
(Output.printInt.ret.0)
@SP // 12254
AM=M-1 // 12255
D=M // 12256
@LCL // 12257
A=M // 12258
M=D // 12259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12260
A=M // 12261
D=M // 12262
@SP // 12263
AM=M+1 // 12264
A=A-1 // 12265
M=D // 12266
@ARG // 12267
A=M // 12268
D=M // 12269
@SP // 12270
AM=M+1 // 12271
A=A-1 // 12272
M=D // 12273
// call String.setInt
@7 // 12274
D=A // 12275
@14 // 12276
M=D // 12277
@String.setInt // 12278
D=A // 12279
@13 // 12280
M=D // 12281
@Output.printInt.ret.1 // 12282
D=A // 12283
@CALL // 12284
0;JMP // 12285
(Output.printInt.ret.1)
@SP // 12286
M=M-1 // 12287

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12288
A=M // 12289
D=M // 12290
@SP // 12291
AM=M+1 // 12292
A=A-1 // 12293
M=D // 12294
// call Output.printString
@6 // 12295
D=A // 12296
@14 // 12297
M=D // 12298
@Output.printString // 12299
D=A // 12300
@13 // 12301
M=D // 12302
@Output.printInt.ret.2 // 12303
D=A // 12304
@CALL // 12305
0;JMP // 12306
(Output.printInt.ret.2)
@SP // 12307
M=M-1 // 12308

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12309
A=M // 12310
D=M // 12311
@SP // 12312
AM=M+1 // 12313
A=A-1 // 12314
M=D // 12315
// call String.dispose
@6 // 12316
D=A // 12317
@14 // 12318
M=D // 12319
@String.dispose // 12320
D=A // 12321
@13 // 12322
M=D // 12323
@Output.printInt.ret.3 // 12324
D=A // 12325
@CALL // 12326
0;JMP // 12327
(Output.printInt.ret.3)
@SP // 12328
M=M-1 // 12329

////PushInstruction("constant 0")
@SP // 12330
AM=M+1 // 12331
A=A-1 // 12332
M=0 // 12333
@RETURN // 12334
0;JMP // 12335

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12336
M=0 // 12337

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 2"),
//        right:
//            PushInstruction("constant 22"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.println.IfElse1}}
@Output.println.EQ.6 // 12338
D=A // 12339
@SP // 12340
AM=M+1 // 12341
A=A-1 // 12342
M=D // 12343
@Output.2 // 12344
D=M // 12345
@22 // 12346
D=D-A // 12347
@DO_EQ // 12348
0;JMP // 12349
(Output.println.EQ.6)
D=!D // 12350
@Output.println.IfElse1 // 12351
D;JNE // 12352

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12353
M=0 // 12354

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12355
0;JMP // 12356

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

@Output.2 // 12357
M=M+1 // 12358

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12359
AM=M+1 // 12360
A=A-1 // 12361
M=0 // 12362
@RETURN // 12363
0;JMP // 12364

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
@Output.backSpace.EQ.7 // 12365
D=A // 12366
@SP // 12367
AM=M+1 // 12368
A=A-1 // 12369
M=D // 12370
@Output.1 // 12371
D=M // 12372
@DO_EQ // 12373
0;JMP // 12374
(Output.backSpace.EQ.7)
D=!D // 12375
@Output.backSpace.IfElse1 // 12376
D;JNE // 12377

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

@Output.2 // 12378
M=M-1 // 12379

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12380
D=A // 12381
@Output.1 // 12382
M=D // 12383

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12384
0;JMP // 12385

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

@Output.1 // 12386
M=M-1 // 12387

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12388
AM=M+1 // 12389
A=A-1 // 12390
M=0 // 12391
@RETURN // 12392
0;JMP // 12393

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12394
M=-1 // 12395

////PushInstruction("constant 0")
@SP // 12396
AM=M+1 // 12397
A=A-1 // 12398
M=0 // 12399
@RETURN // 12400
0;JMP // 12401

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12402
A=M // 12403
D=M // 12404
@Screen.0 // 12405
M=D // 12406

////PushInstruction("constant 0")
@SP // 12407
AM=M+1 // 12408
A=A-1 // 12409
M=0 // 12410
@RETURN // 12411
0;JMP // 12412

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12413
M=M+1 // 12414
AM=M+1 // 12415
A=A-1 // 12416
M=0 // 12417
A=A-1 // 12418
M=0 // 12419

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

@ARG // 12420
A=M+1 // 12421
D=M // 12422
@SP // 12423
AM=M+1 // 12424
A=A-1 // 12425
M=D // 12426
@32 // 12427
D=A // 12428
@SP // 12429
AM=M+1 // 12430
A=A-1 // 12431
M=D // 12432
// call Math.multiply
@7 // 12433
D=A // 12434
@14 // 12435
M=D // 12436
@Math.multiply // 12437
D=A // 12438
@13 // 12439
M=D // 12440
@Screen.drawPixel.ret.0 // 12441
D=A // 12442
@CALL // 12443
0;JMP // 12444
(Screen.drawPixel.ret.0)
@ARG // 12445
A=M // 12446
D=M // 12447
@SP // 12448
AM=M+1 // 12449
A=A-1 // 12450
M=D // 12451
@16 // 12452
D=A // 12453
@SP // 12454
AM=M+1 // 12455
A=A-1 // 12456
M=D // 12457
// call Math.divide
@7 // 12458
D=A // 12459
@14 // 12460
M=D // 12461
@Math.divide // 12462
D=A // 12463
@13 // 12464
M=D // 12465
@Screen.drawPixel.ret.1 // 12466
D=A // 12467
@CALL // 12468
0;JMP // 12469
(Screen.drawPixel.ret.1)
@SP // 12470
AM=M-1 // 12471
D=M // 12472
@SP // 12473
AM=M-1 // 12474
D=D+M // 12475
@16384 // 12476
D=D+A // 12477
@LCL // 12478
A=M // 12479
M=D // 12480

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

@ARG // 12481
A=M // 12482
D=M // 12483
@15 // 12484
D=D&A // 12485
@LCL // 12486
A=M+1 // 12487
M=D // 12488

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawPixel.IfElse1}}
@Screen.drawPixel.EQ.0 // 12489
D=A // 12490
@SP // 12491
AM=M+1 // 12492
A=A-1 // 12493
M=D // 12494
@Screen.0 // 12495
D=M // 12496
@DO_EQ // 12497
0;JMP // 12498
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12499
D;JNE // 12500

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
@LCL // 12501
A=M // 12502
D=M // 12503
@SP // 12504
AM=M+1 // 12505
A=A-1 // 12506
M=D // 12507
@LCL // 12508
A=M // 12509
D=M // 12510
@0 // 12511
A=D+A // 12512
D=M // 12513
@SP // 12514
AM=M+1 // 12515
A=A-1 // 12516
M=D // 12517
@LCL // 12518
A=M+1 // 12519
D=M // 12520
@SP // 12521
AM=M+1 // 12522
A=A-1 // 12523
M=D // 12524
// call Math.twoToThe
@6 // 12525
D=A // 12526
@14 // 12527
M=D // 12528
@Math.twoToThe // 12529
D=A // 12530
@13 // 12531
M=D // 12532
@Screen.drawPixel.ret.2 // 12533
D=A // 12534
@CALL // 12535
0;JMP // 12536
(Screen.drawPixel.ret.2)
@SP // 12537
AM=M-1 // 12538
D=M // 12539
@SP // 12540
AM=M-1 // 12541
D=D|M // 12542
@SP // 12543
AM=M-1 // 12544
A=M // 12545
M=D // 12546

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12547
0;JMP // 12548

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
@LCL // 12549
A=M // 12550
D=M // 12551
@SP // 12552
AM=M+1 // 12553
A=A-1 // 12554
M=D // 12555
@LCL // 12556
A=M // 12557
D=M // 12558
@0 // 12559
A=D+A // 12560
D=M // 12561
@SP // 12562
AM=M+1 // 12563
A=A-1 // 12564
M=D // 12565
@LCL // 12566
A=M+1 // 12567
D=M // 12568
@SP // 12569
AM=M+1 // 12570
A=A-1 // 12571
M=D // 12572
// call Math.twoToThe
@6 // 12573
D=A // 12574
@14 // 12575
M=D // 12576
@Math.twoToThe // 12577
D=A // 12578
@13 // 12579
M=D // 12580
@Screen.drawPixel.ret.3 // 12581
D=A // 12582
@CALL // 12583
0;JMP // 12584
(Screen.drawPixel.ret.3)
@SP // 12585
AM=M-1 // 12586
D=M // 12587
D=!D // 12588
@SP // 12589
AM=M-1 // 12590
D=D&M // 12591
@SP // 12592
AM=M-1 // 12593
A=M // 12594
M=D // 12595

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12596
AM=M+1 // 12597
A=A-1 // 12598
M=0 // 12599
@RETURN // 12600
0;JMP // 12601

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12602
D=A // 12603
@SP // 12604
AM=D+M // 12605
A=A-1 // 12606
M=0 // 12607
A=A-1 // 12608
M=0 // 12609
A=A-1 // 12610
M=0 // 12611
A=A-1 // 12612
M=0 // 12613
A=A-1 // 12614
M=0 // 12615
A=A-1 // 12616
M=0 // 12617

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

@ARG // 12618
A=M+1 // 12619
A=A+1 // 12620
D=M // 12621
A=A-1 // 12622
A=A-1 // 12623
D=D-M // 12624
@SP // 12625
AM=M+1 // 12626
A=A-1 // 12627
M=D // 12628
// call Math.abs
@6 // 12629
D=A // 12630
@14 // 12631
M=D // 12632
@Math.abs // 12633
D=A // 12634
@13 // 12635
M=D // 12636
@Screen.drawLine.ret.0 // 12637
D=A // 12638
@CALL // 12639
0;JMP // 12640
(Screen.drawLine.ret.0)
@SP // 12641
AM=M-1 // 12642
D=M // 12643
@LCL // 12644
A=M // 12645
M=D // 12646

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

@ARG // 12647
A=M+1 // 12648
A=A+1 // 12649
A=A+1 // 12650
D=M // 12651
A=A-1 // 12652
A=A-1 // 12653
D=D-M // 12654
@SP // 12655
AM=M+1 // 12656
A=A-1 // 12657
M=D // 12658
// call Math.abs
@6 // 12659
D=A // 12660
@14 // 12661
M=D // 12662
@Math.abs // 12663
D=A // 12664
@13 // 12665
M=D // 12666
@Screen.drawLine.ret.1 // 12667
D=A // 12668
@CALL // 12669
0;JMP // 12670
(Screen.drawLine.ret.1)
@SP // 12671
AM=M-1 // 12672
D=M // 12673
@LCL // 12674
A=M+1 // 12675
M=D // 12676

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse1}}
@Screen.drawLine.LT.1 // 12677
D=A // 12678
@SP // 12679
AM=M+1 // 12680
A=A-1 // 12681
M=D // 12682
@ARG // 12683
A=M+1 // 12684
A=A+1 // 12685
D=M // 12686
A=A-1 // 12687
A=A-1 // 12688
D=M-D // 12689
@DO_LT // 12690
0;JMP // 12691
(Screen.drawLine.LT.1)
D=!D // 12692
@Screen.drawLine.IfElse1 // 12693
D;JNE // 12694

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12695
A=M+1 // 12696
A=A+1 // 12697
M=1 // 12698

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 12699
0;JMP // 12700

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12701
A=M+1 // 12702
A=A+1 // 12703
M=-1 // 12704

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
@Screen.drawLine.LT.2 // 12705
D=A // 12706
@SP // 12707
AM=M+1 // 12708
A=A-1 // 12709
M=D // 12710
@ARG // 12711
A=M+1 // 12712
A=A+1 // 12713
A=A+1 // 12714
D=M // 12715
A=A-1 // 12716
A=A-1 // 12717
D=M-D // 12718
@DO_LT // 12719
0;JMP // 12720
(Screen.drawLine.LT.2)
D=!D // 12721
@Screen.drawLine.IfElse2 // 12722
D;JNE // 12723

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12724
A=M+1 // 12725
A=A+1 // 12726
A=A+1 // 12727
M=1 // 12728

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 12729
0;JMP // 12730

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12731
A=M+1 // 12732
A=A+1 // 12733
A=A+1 // 12734
M=-1 // 12735

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

@LCL // 12736
A=M+1 // 12737
D=M // 12738
A=A-1 // 12739
D=M-D // 12740
@SP // 12741
AM=M+1 // 12742
A=A-1 // 12743
M=D // 12744
@LCL // 12745
D=M // 12746
@4 // 12747
A=D+A // 12748
D=A // 12749
@R13 // 12750
M=D // 12751
@SP // 12752
AM=M-1 // 12753
D=M // 12754
@R13 // 12755
A=M // 12756
M=D // 12757

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0 // 12758
@WHILE_END_Screen.drawLine1 // 12759
D;JNE // 12760

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12761
A=M // 12762
D=M // 12763
@SP // 12764
AM=M+1 // 12765
A=A-1 // 12766
M=D // 12767
@ARG // 12768
A=M+1 // 12769
D=M // 12770
@SP // 12771
AM=M+1 // 12772
A=A-1 // 12773
M=D // 12774
// call Screen.drawPixel
@7 // 12775
D=A // 12776
@14 // 12777
M=D // 12778
@Screen.drawPixel // 12779
D=A // 12780
@13 // 12781
M=D // 12782
@Screen.drawLine.ret.2 // 12783
D=A // 12784
@CALL // 12785
0;JMP // 12786
(Screen.drawLine.ret.2)
@SP // 12787
M=M-1 // 12788

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
@Screen.drawLine.EQ.3 // 12789
D=A // 12790
@SP // 12791
AM=M+1 // 12792
A=A-1 // 12793
M=D // 12794
@ARG // 12795
A=M+1 // 12796
A=A+1 // 12797
D=M // 12798
A=A-1 // 12799
A=A-1 // 12800
D=M-D // 12801
@DO_EQ // 12802
0;JMP // 12803
(Screen.drawLine.EQ.3)
@SP // 12804
AM=M+1 // 12805
A=A-1 // 12806
M=D // 12807
@Screen.drawLine.EQ.4 // 12808
D=A // 12809
@SP // 12810
AM=M+1 // 12811
A=A-1 // 12812
M=D // 12813
@ARG // 12814
A=M+1 // 12815
A=A+1 // 12816
A=A+1 // 12817
D=M // 12818
A=A-1 // 12819
A=A-1 // 12820
D=M-D // 12821
@DO_EQ // 12822
0;JMP // 12823
(Screen.drawLine.EQ.4)
@SP // 12824
AM=M-1 // 12825
D=D&M // 12826
D=!D // 12827
@Screen.drawLine.IfElse3 // 12828
D;JNE // 12829

////PushInstruction("constant 0")
@SP // 12830
AM=M+1 // 12831
A=A-1 // 12832
M=0 // 12833
@RETURN // 12834
0;JMP // 12835

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 12836
0;JMP // 12837

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

@LCL // 12838
D=M // 12839
@4 // 12840
A=D+A // 12841
D=M // 12842
D=D+M // 12843
@SP // 12844
AM=M+1 // 12845
A=A-1 // 12846
M=D // 12847
@LCL // 12848
D=M // 12849
@5 // 12850
A=D+A // 12851
D=A // 12852
@R13 // 12853
M=D // 12854
@SP // 12855
AM=M-1 // 12856
D=M // 12857
@R13 // 12858
A=M // 12859
M=D // 12860

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
@Screen.drawLine.GT.5 // 12861
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
A=M+1 // 12877
D=M // 12878
@SP // 12879
AM=M-1 // 12880
D=D+M // 12881
@DO_GT // 12882
0;JMP // 12883
(Screen.drawLine.GT.5)
D=!D // 12884
@Screen.drawLine.IfElse4 // 12885
D;JNE // 12886

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

@LCL // 12887
D=M // 12888
@4 // 12889
A=D+A // 12890
D=M // 12891
A=A-1 // 12892
A=A-1 // 12893
A=A-1 // 12894
D=D-M // 12895
@SP // 12896
AM=M+1 // 12897
A=A-1 // 12898
M=D // 12899
@LCL // 12900
D=M // 12901
@4 // 12902
A=D+A // 12903
D=A // 12904
@R13 // 12905
M=D // 12906
@SP // 12907
AM=M-1 // 12908
D=M // 12909
@R13 // 12910
A=M // 12911
M=D // 12912

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

@LCL // 12913
A=M+1 // 12914
A=A+1 // 12915
D=M // 12916
@ARG // 12917
A=M // 12918
M=D+M // 12919

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 12920
0;JMP // 12921

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
@Screen.drawLine.LT.6 // 12922
D=A // 12923
@SP // 12924
AM=M+1 // 12925
A=A-1 // 12926
M=D // 12927
@LCL // 12928
D=M // 12929
@5 // 12930
A=D+A // 12931
D=M // 12932
@SP // 12933
AM=M+1 // 12934
A=A-1 // 12935
M=D // 12936
@LCL // 12937
A=M // 12938
D=M // 12939
@SP // 12940
AM=M-1 // 12941
D=M-D // 12942
@DO_LT // 12943
0;JMP // 12944
(Screen.drawLine.LT.6)
D=!D // 12945
@Screen.drawLine.IfElse5 // 12946
D;JNE // 12947

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

@LCL // 12948
D=M // 12949
@4 // 12950
A=D+A // 12951
D=M // 12952
@SP // 12953
AM=M+1 // 12954
A=A-1 // 12955
M=D // 12956
@LCL // 12957
A=M // 12958
D=M // 12959
@SP // 12960
AM=M-1 // 12961
D=D+M // 12962
@SP // 12963
AM=M+1 // 12964
A=A-1 // 12965
M=D // 12966
@LCL // 12967
D=M // 12968
@4 // 12969
A=D+A // 12970
D=A // 12971
@R13 // 12972
M=D // 12973
@SP // 12974
AM=M-1 // 12975
D=M // 12976
@R13 // 12977
A=M // 12978
M=D // 12979

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

@LCL // 12980
A=M+1 // 12981
A=A+1 // 12982
A=A+1 // 12983
D=M // 12984
@ARG // 12985
A=M+1 // 12986
M=D+M // 12987

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 12988
0;JMP // 12989

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 12990
0;JMP // 12991

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 12992
AM=M+1 // 12993
A=A-1 // 12994
M=0 // 12995
@RETURN // 12996
0;JMP // 12997

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 12998
AM=M+1 // 12999
A=A-1 // 13000
M=0 // 13001

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13002
A=M // 13003
D=M // 13004
@LCL // 13005
A=M // 13006
M=D // 13007

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
@Screen.drawHorizontalLine.GT.7 // 13008
D=A // 13009
@SP // 13010
AM=M+1 // 13011
A=A-1 // 13012
M=D // 13013
@LCL // 13014
A=M // 13015
D=M // 13016
@SP // 13017
AM=M+1 // 13018
A=A-1 // 13019
M=D // 13020
@ARG // 13021
A=M+1 // 13022
D=M // 13023
@SP // 13024
AM=M-1 // 13025
D=M-D // 13026
@DO_GT // 13027
0;JMP // 13028
(Screen.drawHorizontalLine.GT.7)
@WHILE_END_Screen.drawHorizontalLine1 // 13029
D;JNE // 13030

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13031
A=M // 13032
D=M // 13033
@SP // 13034
AM=M+1 // 13035
A=A-1 // 13036
M=D // 13037
@ARG // 13038
A=M+1 // 13039
A=A+1 // 13040
D=M // 13041
@SP // 13042
AM=M+1 // 13043
A=A-1 // 13044
M=D // 13045
// call Screen.drawPixel
@7 // 13046
D=A // 13047
@14 // 13048
M=D // 13049
@Screen.drawPixel // 13050
D=A // 13051
@13 // 13052
M=D // 13053
@Screen.drawHorizontalLine.ret.0 // 13054
D=A // 13055
@CALL // 13056
0;JMP // 13057
(Screen.drawHorizontalLine.ret.0)
@SP // 13058
M=M-1 // 13059

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

@LCL // 13060
A=M // 13061
M=M+1 // 13062

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 13063
0;JMP // 13064

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 13065
AM=M+1 // 13066
A=A-1 // 13067
M=0 // 13068
@RETURN // 13069
0;JMP // 13070

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13071
D=A // 13072
@SP // 13073
AM=D+M // 13074
A=A-1 // 13075
M=0 // 13076
A=A-1 // 13077
M=0 // 13078
A=A-1 // 13079
M=0 // 13080
A=A-1 // 13081
M=0 // 13082
A=A-1 // 13083
M=0 // 13084

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13085
A=M // 13086
M=0 // 13087

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13088
A=M+1 // 13089
A=A+1 // 13090
D=M // 13091
@LCL // 13092
A=M+1 // 13093
M=D // 13094

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

@ARG // 13095
A=M+1 // 13096
A=A+1 // 13097
D=M // 13098
D=D-1 // 13099
D=-D // 13100
@LCL // 13101
A=M+1 // 13102
A=A+1 // 13103
M=D // 13104

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
@Screen.drawCircle.GT.8 // 13105
D=A // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=D // 13110
@LCL // 13111
A=M+1 // 13112
D=M // 13113
A=A-1 // 13114
D=M-D // 13115
@DO_GT // 13116
0;JMP // 13117
(Screen.drawCircle.GT.8)
@WHILE_END_Screen.drawCircle1 // 13118
D;JNE // 13119

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

@ARG // 13120
A=M // 13121
D=M // 13122
@SP // 13123
AM=M+1 // 13124
A=A-1 // 13125
M=D // 13126
@LCL // 13127
A=M // 13128
D=M // 13129
@SP // 13130
AM=M-1 // 13131
D=M-D // 13132
@SP // 13133
AM=M+1 // 13134
A=A-1 // 13135
M=D // 13136
@ARG // 13137
A=M // 13138
D=M // 13139
@SP // 13140
AM=M+1 // 13141
A=A-1 // 13142
M=D // 13143
@LCL // 13144
A=M // 13145
D=M // 13146
@SP // 13147
AM=M-1 // 13148
D=D+M // 13149
@SP // 13150
AM=M+1 // 13151
A=A-1 // 13152
M=D // 13153
@ARG // 13154
A=M+1 // 13155
D=M // 13156
@SP // 13157
AM=M+1 // 13158
A=A-1 // 13159
M=D // 13160
@LCL // 13161
A=M+1 // 13162
D=M // 13163
@SP // 13164
AM=M-1 // 13165
D=D+M // 13166
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=D // 13170
// call Screen.drawHorizontalLine
@8 // 13171
D=A // 13172
@14 // 13173
M=D // 13174
@Screen.drawHorizontalLine // 13175
D=A // 13176
@13 // 13177
M=D // 13178
@Screen.drawCircle.ret.0 // 13179
D=A // 13180
@CALL // 13181
0;JMP // 13182
(Screen.drawCircle.ret.0)
@SP // 13183
M=M-1 // 13184

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

@ARG // 13185
A=M // 13186
D=M // 13187
@SP // 13188
AM=M+1 // 13189
A=A-1 // 13190
M=D // 13191
@LCL // 13192
A=M // 13193
D=M // 13194
@SP // 13195
AM=M-1 // 13196
D=M-D // 13197
@SP // 13198
AM=M+1 // 13199
A=A-1 // 13200
M=D // 13201
@ARG // 13202
A=M // 13203
D=M // 13204
@SP // 13205
AM=M+1 // 13206
A=A-1 // 13207
M=D // 13208
@LCL // 13209
A=M // 13210
D=M // 13211
@SP // 13212
AM=M-1 // 13213
D=D+M // 13214
@SP // 13215
AM=M+1 // 13216
A=A-1 // 13217
M=D // 13218
@ARG // 13219
A=M+1 // 13220
D=M // 13221
@SP // 13222
AM=M+1 // 13223
A=A-1 // 13224
M=D // 13225
@LCL // 13226
A=M+1 // 13227
D=M // 13228
@SP // 13229
AM=M-1 // 13230
D=M-D // 13231
@SP // 13232
AM=M+1 // 13233
A=A-1 // 13234
M=D // 13235
// call Screen.drawHorizontalLine
@8 // 13236
D=A // 13237
@14 // 13238
M=D // 13239
@Screen.drawHorizontalLine // 13240
D=A // 13241
@13 // 13242
M=D // 13243
@Screen.drawCircle.ret.1 // 13244
D=A // 13245
@CALL // 13246
0;JMP // 13247
(Screen.drawCircle.ret.1)
@SP // 13248
M=M-1 // 13249

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

@ARG // 13250
A=M // 13251
D=M // 13252
@SP // 13253
AM=M+1 // 13254
A=A-1 // 13255
M=D // 13256
@LCL // 13257
A=M+1 // 13258
D=M // 13259
@SP // 13260
AM=M-1 // 13261
D=M-D // 13262
@SP // 13263
AM=M+1 // 13264
A=A-1 // 13265
M=D // 13266
@ARG // 13267
A=M // 13268
D=M // 13269
@SP // 13270
AM=M+1 // 13271
A=A-1 // 13272
M=D // 13273
@LCL // 13274
A=M+1 // 13275
D=M // 13276
@SP // 13277
AM=M-1 // 13278
D=D+M // 13279
@SP // 13280
AM=M+1 // 13281
A=A-1 // 13282
M=D // 13283
@ARG // 13284
A=M+1 // 13285
D=M // 13286
@SP // 13287
AM=M+1 // 13288
A=A-1 // 13289
M=D // 13290
@LCL // 13291
A=M // 13292
D=M // 13293
@SP // 13294
AM=M-1 // 13295
D=D+M // 13296
@SP // 13297
AM=M+1 // 13298
A=A-1 // 13299
M=D // 13300
// call Screen.drawHorizontalLine
@8 // 13301
D=A // 13302
@14 // 13303
M=D // 13304
@Screen.drawHorizontalLine // 13305
D=A // 13306
@13 // 13307
M=D // 13308
@Screen.drawCircle.ret.2 // 13309
D=A // 13310
@CALL // 13311
0;JMP // 13312
(Screen.drawCircle.ret.2)
@SP // 13313
M=M-1 // 13314

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

@ARG // 13315
A=M // 13316
D=M // 13317
@SP // 13318
AM=M+1 // 13319
A=A-1 // 13320
M=D // 13321
@LCL // 13322
A=M+1 // 13323
D=M // 13324
@SP // 13325
AM=M-1 // 13326
D=M-D // 13327
@SP // 13328
AM=M+1 // 13329
A=A-1 // 13330
M=D // 13331
@ARG // 13332
A=M // 13333
D=M // 13334
@SP // 13335
AM=M+1 // 13336
A=A-1 // 13337
M=D // 13338
@LCL // 13339
A=M+1 // 13340
D=M // 13341
@SP // 13342
AM=M-1 // 13343
D=D+M // 13344
@SP // 13345
AM=M+1 // 13346
A=A-1 // 13347
M=D // 13348
@ARG // 13349
A=M+1 // 13350
D=M // 13351
@SP // 13352
AM=M+1 // 13353
A=A-1 // 13354
M=D // 13355
@LCL // 13356
A=M // 13357
D=M // 13358
@SP // 13359
AM=M-1 // 13360
D=M-D // 13361
@SP // 13362
AM=M+1 // 13363
A=A-1 // 13364
M=D // 13365
// call Screen.drawHorizontalLine
@8 // 13366
D=A // 13367
@14 // 13368
M=D // 13369
@Screen.drawHorizontalLine // 13370
D=A // 13371
@13 // 13372
M=D // 13373
@Screen.drawCircle.ret.3 // 13374
D=A // 13375
@CALL // 13376
0;JMP // 13377
(Screen.drawCircle.ret.3)
@SP // 13378
M=M-1 // 13379

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawCircle.IfElse1}}
@Screen.drawCircle.LT.9 // 13380
D=A // 13381
@SP // 13382
AM=M+1 // 13383
A=A-1 // 13384
M=D // 13385
@LCL // 13386
A=M+1 // 13387
A=A+1 // 13388
D=M // 13389
@DO_LT // 13390
0;JMP // 13391
(Screen.drawCircle.LT.9)
D=!D // 13392
@Screen.drawCircle.IfElse1 // 13393
D;JNE // 13394

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

@LCL // 13395
A=M+1 // 13396
A=A+1 // 13397
D=M // 13398
@SP // 13399
AM=M+1 // 13400
A=A-1 // 13401
M=D // 13402
@LCL // 13403
A=M // 13404
D=M // 13405
D=D+M // 13406
@SP // 13407
AM=M-1 // 13408
D=D+M // 13409
@3 // 13410
D=D+A // 13411
@LCL // 13412
A=M+1 // 13413
A=A+1 // 13414
M=D // 13415

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13416
0;JMP // 13417

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

@LCL // 13418
A=M+1 // 13419
A=A+1 // 13420
D=M // 13421
@SP // 13422
AM=M+1 // 13423
A=A-1 // 13424
M=D // 13425
@LCL // 13426
A=M+1 // 13427
D=M // 13428
A=A-1 // 13429
D=M-D // 13430
@R13 // 13431
M=D // 13432
D=D+M // 13433
@SP // 13434
AM=M-1 // 13435
D=D+M // 13436
@5 // 13437
D=D+A // 13438
@LCL // 13439
A=M+1 // 13440
A=A+1 // 13441
M=D // 13442

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

@LCL // 13443
A=M+1 // 13444
M=M-1 // 13445

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

@LCL // 13446
A=M // 13447
M=M+1 // 13448

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13449
0;JMP // 13450

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13451
AM=M+1 // 13452
A=A-1 // 13453
M=0 // 13454
@RETURN // 13455
0;JMP // 13456

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13457
D=A // 13458
@SP // 13459
AM=D+M // 13460
A=A-1 // 13461
M=0 // 13462
A=A-1 // 13463
M=0 // 13464
A=A-1 // 13465
M=0 // 13466
A=A-1 // 13467
M=0 // 13468
A=A-1 // 13469
M=0 // 13470
A=A-1 // 13471
M=0 // 13472
A=A-1 // 13473
M=0 // 13474
A=A-1 // 13475
M=0 // 13476
A=A-1 // 13477
M=0 // 13478
A=A-1 // 13479
M=0 // 13480

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13481
D=M // 13482
@9 // 13483
A=D+A // 13484
M=-1 // 13485

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.0 // 13486
D=M // 13487
@Screen.drawRectangle.IfElse1 // 13488
D;JNE // 13489

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13490
D=M // 13491
@9 // 13492
A=D+A // 13493
M=0 // 13494

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 13495
0;JMP // 13496

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

@ARG // 13497
A=M+1 // 13498
D=M // 13499
@LCL // 13500
A=M // 13501
M=D // 13502

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
@Screen.drawRectangle.GT.10 // 13503
D=A // 13504
@SP // 13505
AM=M+1 // 13506
A=A-1 // 13507
M=D // 13508
@LCL // 13509
A=M // 13510
D=M // 13511
@SP // 13512
AM=M+1 // 13513
A=A-1 // 13514
M=D // 13515
@ARG // 13516
A=M+1 // 13517
A=A+1 // 13518
A=A+1 // 13519
D=M // 13520
@SP // 13521
AM=M-1 // 13522
D=M-D // 13523
@DO_GT // 13524
0;JMP // 13525
(Screen.drawRectangle.GT.10)
@WHILE_END_Screen.drawRectangle1 // 13526
D;JNE // 13527

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13528
A=M // 13529
D=M // 13530
@SP // 13531
AM=M+1 // 13532
A=A-1 // 13533
M=D // 13534
@16 // 13535
D=A // 13536
@SP // 13537
AM=M+1 // 13538
A=A-1 // 13539
M=D // 13540
// call Math.divide
@7 // 13541
D=A // 13542
@14 // 13543
M=D // 13544
@Math.divide // 13545
D=A // 13546
@13 // 13547
M=D // 13548
@Screen.drawRectangle.ret.0 // 13549
D=A // 13550
@CALL // 13551
0;JMP // 13552
(Screen.drawRectangle.ret.0)
@SP // 13553
AM=M-1 // 13554
D=M // 13555
@LCL // 13556
A=M+1 // 13557
M=D // 13558

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13559
A=M+1 // 13560
A=A+1 // 13561
D=M // 13562
@SP // 13563
AM=M+1 // 13564
A=A-1 // 13565
M=D // 13566
@16 // 13567
D=A // 13568
@SP // 13569
AM=M+1 // 13570
A=A-1 // 13571
M=D // 13572
// call Math.divide
@7 // 13573
D=A // 13574
@14 // 13575
M=D // 13576
@Math.divide // 13577
D=A // 13578
@13 // 13579
M=D // 13580
@Screen.drawRectangle.ret.1 // 13581
D=A // 13582
@CALL // 13583
0;JMP // 13584
(Screen.drawRectangle.ret.1)
@SP // 13585
AM=M-1 // 13586
D=M // 13587
@LCL // 13588
A=M+1 // 13589
A=A+1 // 13590
M=D // 13591

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

@ARG // 13592
A=M // 13593
D=M // 13594
@15 // 13595
D=D&A // 13596
@LCL // 13597
A=M+1 // 13598
A=A+1 // 13599
A=A+1 // 13600
M=D // 13601

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

@ARG // 13602
A=M+1 // 13603
A=A+1 // 13604
D=M // 13605
@15 // 13606
D=D&A // 13607
@SP // 13608
AM=M+1 // 13609
A=A-1 // 13610
M=D // 13611
@LCL // 13612
D=M // 13613
@4 // 13614
A=D+A // 13615
D=A // 13616
@R13 // 13617
M=D // 13618
@SP // 13619
AM=M-1 // 13620
D=M // 13621
@R13 // 13622
A=M // 13623
M=D // 13624

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13625
A=M // 13626
D=M // 13627
@SP // 13628
AM=M+1 // 13629
A=A-1 // 13630
M=D // 13631
@32 // 13632
D=A // 13633
@SP // 13634
AM=M+1 // 13635
A=A-1 // 13636
M=D // 13637
// call Math.multiply
@7 // 13638
D=A // 13639
@14 // 13640
M=D // 13641
@Math.multiply // 13642
D=A // 13643
@13 // 13644
M=D // 13645
@Screen.drawRectangle.ret.2 // 13646
D=A // 13647
@CALL // 13648
0;JMP // 13649
(Screen.drawRectangle.ret.2)
@LCL // 13650
D=M // 13651
@5 // 13652
A=D+A // 13653
D=A // 13654
@R13 // 13655
M=D // 13656
@SP // 13657
AM=M-1 // 13658
D=M // 13659
@R13 // 13660
A=M // 13661
M=D // 13662

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse2}}
@Screen.drawRectangle.EQ.11 // 13663
D=A // 13664
@SP // 13665
AM=M+1 // 13666
A=A-1 // 13667
M=D // 13668
@LCL // 13669
A=M+1 // 13670
A=A+1 // 13671
D=M // 13672
A=A-1 // 13673
D=M-D // 13674
@DO_EQ // 13675
0;JMP // 13676
(Screen.drawRectangle.EQ.11)
D=!D // 13677
@Screen.drawRectangle.IfElse2 // 13678
D;JNE // 13679

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

@LCL // 13680
D=M // 13681
@4 // 13682
A=D+A // 13683
D=M // 13684
@SP // 13685
AM=M+1 // 13686
A=A-1 // 13687
M=D+1 // 13688
// call Math.twoToThe
@6 // 13689
D=A // 13690
@14 // 13691
M=D // 13692
@Math.twoToThe // 13693
D=A // 13694
@13 // 13695
M=D // 13696
@Screen.drawRectangle.ret.3 // 13697
D=A // 13698
@CALL // 13699
0;JMP // 13700
(Screen.drawRectangle.ret.3)
@SP // 13701
AM=M-1 // 13702
D=M // 13703
D=D-1 // 13704
@SP // 13705
AM=M+1 // 13706
A=A-1 // 13707
M=D // 13708
@LCL // 13709
A=M+1 // 13710
A=A+1 // 13711
A=A+1 // 13712
D=M // 13713
@SP // 13714
AM=M+1 // 13715
A=A-1 // 13716
M=D // 13717
// call Math.twoToThe
@6 // 13718
D=A // 13719
@14 // 13720
M=D // 13721
@Math.twoToThe // 13722
D=A // 13723
@13 // 13724
M=D // 13725
@Screen.drawRectangle.ret.4 // 13726
D=A // 13727
@CALL // 13728
0;JMP // 13729
(Screen.drawRectangle.ret.4)
@SP // 13730
AM=M-1 // 13731
D=M // 13732
D=D-1 // 13733
@SP // 13734
AM=M-1 // 13735
D=M-D // 13736
@SP // 13737
AM=M+1 // 13738
A=A-1 // 13739
M=D // 13740
@LCL // 13741
D=M // 13742
@6 // 13743
A=D+A // 13744
D=A // 13745
@R13 // 13746
M=D // 13747
@SP // 13748
AM=M-1 // 13749
D=M // 13750
@R13 // 13751
A=M // 13752
M=D // 13753

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

@LCL // 13754
D=M // 13755
@5 // 13756
A=D+A // 13757
D=M // 13758
@SP // 13759
AM=M+1 // 13760
A=A-1 // 13761
M=D // 13762
@LCL // 13763
A=M+1 // 13764
D=M // 13765
@SP // 13766
AM=M-1 // 13767
D=D+M // 13768
@SP // 13769
AM=M+1 // 13770
A=A-1 // 13771
M=D // 13772
@LCL // 13773
D=M // 13774
@7 // 13775
A=D+A // 13776
D=A // 13777
@R13 // 13778
M=D // 13779
@SP // 13780
AM=M-1 // 13781
D=M // 13782
@R13 // 13783
A=M // 13784
M=D // 13785

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0 // 13786
D=!M // 13787
@Screen.drawRectangle.IfElse3 // 13788
D;JNE // 13789

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
@LCL // 13790
D=M // 13791
@7 // 13792
A=D+A // 13793
D=M // 13794
@16384 // 13795
D=D+A // 13796
@SP // 13797
AM=M+1 // 13798
A=A-1 // 13799
M=D // 13800
@LCL // 13801
D=M // 13802
@7 // 13803
A=D+A // 13804
D=M // 13805
@16384 // 13806
A=D+A // 13807
D=M // 13808
@SP // 13809
AM=M+1 // 13810
A=A-1 // 13811
M=D // 13812
@LCL // 13813
D=M // 13814
@6 // 13815
A=D+A // 13816
D=M // 13817
@SP // 13818
AM=M-1 // 13819
D=D|M // 13820
@SP // 13821
AM=M-1 // 13822
A=M // 13823
M=D // 13824

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 13825
0;JMP // 13826

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
@LCL // 13827
D=M // 13828
@7 // 13829
A=D+A // 13830
D=M // 13831
@16384 // 13832
D=D+A // 13833
@SP // 13834
AM=M+1 // 13835
A=A-1 // 13836
M=D // 13837
@LCL // 13838
D=M // 13839
@7 // 13840
A=D+A // 13841
D=M // 13842
@16384 // 13843
A=D+A // 13844
D=M // 13845
@SP // 13846
AM=M+1 // 13847
A=A-1 // 13848
M=D // 13849
@LCL // 13850
D=M // 13851
@6 // 13852
A=D+A // 13853
D=!M // 13854
@SP // 13855
AM=M-1 // 13856
D=D&M // 13857
@SP // 13858
AM=M-1 // 13859
A=M // 13860
M=D // 13861

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 13862
0;JMP // 13863

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

@LCL // 13864
A=M+1 // 13865
A=A+1 // 13866
A=A+1 // 13867
D=M // 13868
@SP // 13869
AM=M+1 // 13870
A=A-1 // 13871
M=D // 13872
// call Math.twoToThe
@6 // 13873
D=A // 13874
@14 // 13875
M=D // 13876
@Math.twoToThe // 13877
D=A // 13878
@13 // 13879
M=D // 13880
@Screen.drawRectangle.ret.5 // 13881
D=A // 13882
@CALL // 13883
0;JMP // 13884
(Screen.drawRectangle.ret.5)
@SP // 13885
AM=M-1 // 13886
D=M // 13887
D=D-1 // 13888
@SP // 13889
AM=M+1 // 13890
A=A-1 // 13891
M=D // 13892
@SP // 13893
A=M-1 // 13894
M=!D // 13895
@LCL // 13896
D=M // 13897
@6 // 13898
A=D+A // 13899
D=A // 13900
@R13 // 13901
M=D // 13902
@SP // 13903
AM=M-1 // 13904
D=M // 13905
@R13 // 13906
A=M // 13907
M=D // 13908

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

@LCL // 13909
D=M // 13910
@5 // 13911
A=D+A // 13912
D=M // 13913
@SP // 13914
AM=M+1 // 13915
A=A-1 // 13916
M=D // 13917
@LCL // 13918
A=M+1 // 13919
D=M // 13920
@SP // 13921
AM=M-1 // 13922
D=D+M // 13923
@SP // 13924
AM=M+1 // 13925
A=A-1 // 13926
M=D // 13927
@LCL // 13928
D=M // 13929
@7 // 13930
A=D+A // 13931
D=A // 13932
@R13 // 13933
M=D // 13934
@SP // 13935
AM=M-1 // 13936
D=M // 13937
@R13 // 13938
A=M // 13939
M=D // 13940

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0 // 13941
D=!M // 13942
@Screen.drawRectangle.IfElse4 // 13943
D;JNE // 13944

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
@LCL // 13945
D=M // 13946
@7 // 13947
A=D+A // 13948
D=M // 13949
@16384 // 13950
D=D+A // 13951
@SP // 13952
AM=M+1 // 13953
A=A-1 // 13954
M=D // 13955
@LCL // 13956
D=M // 13957
@7 // 13958
A=D+A // 13959
D=M // 13960
@16384 // 13961
A=D+A // 13962
D=M // 13963
@SP // 13964
AM=M+1 // 13965
A=A-1 // 13966
M=D // 13967
@LCL // 13968
D=M // 13969
@6 // 13970
A=D+A // 13971
D=M // 13972
@SP // 13973
AM=M-1 // 13974
D=D|M // 13975
@SP // 13976
AM=M-1 // 13977
A=M // 13978
M=D // 13979

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 13980
0;JMP // 13981

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
@LCL // 13982
D=M // 13983
@7 // 13984
A=D+A // 13985
D=M // 13986
@16384 // 13987
D=D+A // 13988
@SP // 13989
AM=M+1 // 13990
A=A-1 // 13991
M=D // 13992
@LCL // 13993
D=M // 13994
@7 // 13995
A=D+A // 13996
D=M // 13997
@16384 // 13998
A=D+A // 13999
D=M // 14000
@SP // 14001
AM=M+1 // 14002
A=A-1 // 14003
M=D // 14004
@LCL // 14005
D=M // 14006
@6 // 14007
A=D+A // 14008
D=!M // 14009
@SP // 14010
AM=M-1 // 14011
D=D&M // 14012
@SP // 14013
AM=M-1 // 14014
A=M // 14015
M=D // 14016

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

@LCL // 14017
A=M+1 // 14018
D=M // 14019
@SP // 14020
AM=M+1 // 14021
A=A-1 // 14022
M=D+1 // 14023
@LCL // 14024
D=M // 14025
@8 // 14026
A=D+A // 14027
D=A // 14028
@R13 // 14029
M=D // 14030
@SP // 14031
AM=M-1 // 14032
D=M // 14033
@R13 // 14034
A=M // 14035
M=D // 14036

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
@Screen.drawRectangle.LT.12 // 14037
D=A // 14038
@SP // 14039
AM=M+1 // 14040
A=A-1 // 14041
M=D // 14042
@LCL // 14043
D=M // 14044
@8 // 14045
A=D+A // 14046
D=M // 14047
@SP // 14048
AM=M+1 // 14049
A=A-1 // 14050
M=D // 14051
@LCL // 14052
A=M+1 // 14053
A=A+1 // 14054
D=M // 14055
@SP // 14056
AM=M-1 // 14057
D=M-D // 14058
@DO_LT // 14059
0;JMP // 14060
(Screen.drawRectangle.LT.12)
D=!D // 14061
@WHILE_END_Screen.drawRectangle2 // 14062
D;JNE // 14063

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

@LCL // 14064
D=M // 14065
@8 // 14066
A=D+A // 14067
D=M // 14068
A=A-1 // 14069
A=A-1 // 14070
A=A-1 // 14071
D=D+M // 14072
@SP // 14073
AM=M+1 // 14074
A=A-1 // 14075
M=D // 14076
@LCL // 14077
D=M // 14078
@7 // 14079
A=D+A // 14080
D=A // 14081
@R13 // 14082
M=D // 14083
@SP // 14084
AM=M-1 // 14085
D=M // 14086
@R13 // 14087
A=M // 14088
M=D // 14089

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14090
D=M // 14091
@7 // 14092
A=D+A // 14093
D=M // 14094
@16384 // 14095
D=D+A // 14096
@SP // 14097
AM=M+1 // 14098
A=A-1 // 14099
M=D // 14100
@LCL // 14101
D=M // 14102
@9 // 14103
A=D+A // 14104
D=M // 14105
@SP // 14106
AM=M-1 // 14107
A=M // 14108
M=D // 14109

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

@LCL // 14110
D=M // 14111
@8 // 14112
A=D+A // 14113
M=M+1 // 14114

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14115
0;JMP // 14116

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

@LCL // 14117
D=M // 14118
@4 // 14119
A=D+A // 14120
D=M // 14121
@SP // 14122
AM=M+1 // 14123
A=A-1 // 14124
M=D+1 // 14125
// call Math.twoToThe
@6 // 14126
D=A // 14127
@14 // 14128
M=D // 14129
@Math.twoToThe // 14130
D=A // 14131
@13 // 14132
M=D // 14133
@Screen.drawRectangle.ret.6 // 14134
D=A // 14135
@CALL // 14136
0;JMP // 14137
(Screen.drawRectangle.ret.6)
@SP // 14138
AM=M-1 // 14139
D=M // 14140
D=D-1 // 14141
@SP // 14142
AM=M+1 // 14143
A=A-1 // 14144
M=D // 14145
@LCL // 14146
D=M // 14147
@6 // 14148
A=D+A // 14149
D=A // 14150
@R13 // 14151
M=D // 14152
@SP // 14153
AM=M-1 // 14154
D=M // 14155
@R13 // 14156
A=M // 14157
M=D // 14158

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

@LCL // 14159
D=M // 14160
@5 // 14161
A=D+A // 14162
D=M // 14163
A=A-1 // 14164
A=A-1 // 14165
A=A-1 // 14166
D=D+M // 14167
@SP // 14168
AM=M+1 // 14169
A=A-1 // 14170
M=D // 14171
@LCL // 14172
D=M // 14173
@7 // 14174
A=D+A // 14175
D=A // 14176
@R13 // 14177
M=D // 14178
@SP // 14179
AM=M-1 // 14180
D=M // 14181
@R13 // 14182
A=M // 14183
M=D // 14184

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0 // 14185
D=!M // 14186
@Screen.drawRectangle.IfElse5 // 14187
D;JNE // 14188

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
@LCL // 14189
D=M // 14190
@7 // 14191
A=D+A // 14192
D=M // 14193
@16384 // 14194
D=D+A // 14195
@SP // 14196
AM=M+1 // 14197
A=A-1 // 14198
M=D // 14199
@LCL // 14200
D=M // 14201
@7 // 14202
A=D+A // 14203
D=M // 14204
@16384 // 14205
A=D+A // 14206
D=M // 14207
@SP // 14208
AM=M+1 // 14209
A=A-1 // 14210
M=D // 14211
@LCL // 14212
D=M // 14213
@6 // 14214
A=D+A // 14215
D=M // 14216
@SP // 14217
AM=M-1 // 14218
D=D|M // 14219
@SP // 14220
AM=M-1 // 14221
A=M // 14222
M=D // 14223

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14224
0;JMP // 14225

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
@LCL // 14226
D=M // 14227
@7 // 14228
A=D+A // 14229
D=M // 14230
@16384 // 14231
D=D+A // 14232
@SP // 14233
AM=M+1 // 14234
A=A-1 // 14235
M=D // 14236
@LCL // 14237
D=M // 14238
@7 // 14239
A=D+A // 14240
D=M // 14241
@16384 // 14242
A=D+A // 14243
D=M // 14244
@SP // 14245
AM=M+1 // 14246
A=A-1 // 14247
M=D // 14248
@LCL // 14249
D=M // 14250
@6 // 14251
A=D+A // 14252
D=!M // 14253
@SP // 14254
AM=M-1 // 14255
D=D&M // 14256
@SP // 14257
AM=M-1 // 14258
A=M // 14259
M=D // 14260

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

@LCL // 14261
A=M // 14262
M=M+1 // 14263

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14264
0;JMP // 14265

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14266
AM=M+1 // 14267
A=A-1 // 14268
M=0 // 14269
@RETURN // 14270
0;JMP // 14271

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14272
AM=M+1 // 14273
A=A-1 // 14274
M=0 // 14275

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14276
A=M // 14277
M=0 // 14278

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
@Screen.clearScreen.LT.13 // 14279
D=A // 14280
@SP // 14281
AM=M+1 // 14282
A=A-1 // 14283
M=D // 14284
@LCL // 14285
A=M // 14286
D=M // 14287
@8192 // 14288
D=D-A // 14289
@DO_LT // 14290
0;JMP // 14291
(Screen.clearScreen.LT.13)
D=!D // 14292
@WHILE_END_Screen.clearScreen1 // 14293
D;JNE // 14294

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14295
A=M // 14296
D=M // 14297
@16384 // 14298
D=D+A // 14299
@SP // 14300
AM=M+1 // 14301
A=A-1 // 14302
M=D // 14303
D=0 // 14304
@SP // 14305
AM=M-1 // 14306
A=M // 14307
M=D // 14308

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

@LCL // 14309
A=M // 14310
M=M+1 // 14311

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14312
0;JMP // 14313

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14314
AM=M+1 // 14315
A=A-1 // 14316
M=0 // 14317
@RETURN // 14318
0;JMP // 14319

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14320
D=A // 14321
@SP // 14322
AM=M+1 // 14323
A=A-1 // 14324
M=D // 14325
// call Memory.alloc
@6 // 14326
D=A // 14327
@14 // 14328
M=D // 14329
@Memory.alloc // 14330
D=A // 14331
@13 // 14332
M=D // 14333
@String.new.ret.0 // 14334
D=A // 14335
@CALL // 14336
0;JMP // 14337
(String.new.ret.0)
@SP // 14338
AM=M-1 // 14339
D=M // 14340
@3 // 14341
M=D // 14342

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.new.IfElse1}}
@String.new.EQ.0 // 14343
D=A // 14344
@SP // 14345
AM=M+1 // 14346
A=A-1 // 14347
M=D // 14348
@ARG // 14349
A=M // 14350
D=M // 14351
@DO_EQ // 14352
0;JMP // 14353
(String.new.EQ.0)
D=!D // 14354
@String.new.IfElse1 // 14355
D;JNE // 14356

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14357
A=M // 14358
M=0 // 14359

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14360
0;JMP // 14361

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14362
A=M // 14363
D=M // 14364
@SP // 14365
AM=M+1 // 14366
A=A-1 // 14367
M=D // 14368
// call Array.new
@6 // 14369
D=A // 14370
@14 // 14371
M=D // 14372
@Array.new // 14373
D=A // 14374
@13 // 14375
M=D // 14376
@String.new.ret.1 // 14377
D=A // 14378
@CALL // 14379
0;JMP // 14380
(String.new.ret.1)
@SP // 14381
AM=M-1 // 14382
D=M // 14383
@THIS // 14384
A=M // 14385
M=D // 14386

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14387
A=M // 14388
D=M // 14389
@THIS // 14390
A=M+1 // 14391
A=A+1 // 14392
M=D // 14393

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14394
A=M+1 // 14395
M=0 // 14396

////PushInstruction("pointer 0")
@3 // 14397
D=M // 14398
@SP // 14399
AM=M+1 // 14400
A=A-1 // 14401
M=D // 14402
@RETURN // 14403
0;JMP // 14404

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14405
A=M // 14406
D=M // 14407
@3 // 14408
M=D // 14409

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.dispose.IfElse1}}
@String.dispose.EQ.1 // 14410
D=A // 14411
@SP // 14412
AM=M+1 // 14413
A=A-1 // 14414
M=D // 14415
@THIS // 14416
A=M // 14417
D=M // 14418
@DO_EQ // 14419
0;JMP // 14420
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 14421
D;JNE // 14422

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14423
A=M // 14424
D=M // 14425
@SP // 14426
AM=M+1 // 14427
A=A-1 // 14428
M=D // 14429
// call Array.dispose
@6 // 14430
D=A // 14431
@14 // 14432
M=D // 14433
@Array.dispose // 14434
D=A // 14435
@13 // 14436
M=D // 14437
@String.dispose.ret.0 // 14438
D=A // 14439
@CALL // 14440
0;JMP // 14441
(String.dispose.ret.0)
@SP // 14442
M=M-1 // 14443

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 14444
0;JMP // 14445

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14446
AM=M+1 // 14447
A=A-1 // 14448
M=0 // 14449
@RETURN // 14450
0;JMP // 14451

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14452
A=M // 14453
D=M // 14454
@3 // 14455
M=D // 14456

////PushInstruction("this 1")
@THIS // 14457
A=M+1 // 14458
D=M // 14459
@SP // 14460
AM=M+1 // 14461
A=A-1 // 14462
M=D // 14463
@RETURN // 14464
0;JMP // 14465

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14466
A=M // 14467
D=M // 14468
@3 // 14469
M=D // 14470

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
@THIS // 14471
A=M // 14472
D=M // 14473
@SP // 14474
AM=M+1 // 14475
A=A-1 // 14476
M=D // 14477
@ARG // 14478
A=M+1 // 14479
D=M // 14480
@SP // 14481
AM=M-1 // 14482
A=D+M // 14483
D=M // 14484
@SP // 14485
AM=M+1 // 14486
A=A-1 // 14487
M=D // 14488
@RETURN // 14489
0;JMP // 14490

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14491
A=M // 14492
D=M // 14493
@3 // 14494
M=D // 14495

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14496
A=M // 14497
D=M // 14498
@SP // 14499
AM=M+1 // 14500
A=A-1 // 14501
M=D // 14502
@ARG // 14503
A=M+1 // 14504
D=M // 14505
@SP // 14506
AM=M-1 // 14507
D=D+M // 14508
@SP // 14509
AM=M+1 // 14510
A=A-1 // 14511
M=D // 14512
@ARG // 14513
A=M+1 // 14514
A=A+1 // 14515
D=M // 14516
@SP // 14517
AM=M-1 // 14518
A=M // 14519
M=D // 14520

////PushInstruction("constant 0")
@SP // 14521
AM=M+1 // 14522
A=A-1 // 14523
M=0 // 14524
@RETURN // 14525
0;JMP // 14526

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14527
AM=M+1 // 14528
A=A-1 // 14529
M=0 // 14530

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14531
A=M // 14532
D=M // 14533
@3 // 14534
M=D // 14535

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 1"),
//        right:
//            PushInstruction("this 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.appendChar.IfElse1}}
@String.appendChar.EQ.2 // 14536
D=A // 14537
@SP // 14538
AM=M+1 // 14539
A=A-1 // 14540
M=D // 14541
@THIS // 14542
A=M+1 // 14543
A=A+1 // 14544
D=M // 14545
A=A-1 // 14546
D=M-D // 14547
@DO_EQ // 14548
0;JMP // 14549
(String.appendChar.EQ.2)
D=!D // 14550
@String.appendChar.IfElse1 // 14551
D;JNE // 14552

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

@THIS // 14553
A=M+1 // 14554
A=A+1 // 14555
D=M // 14556
D=D+M // 14557
@SP // 14558
AM=M+1 // 14559
A=A-1 // 14560
M=D // 14561
// call Array.new
@6 // 14562
D=A // 14563
@14 // 14564
M=D // 14565
@Array.new // 14566
D=A // 14567
@13 // 14568
M=D // 14569
@String.appendChar.ret.0 // 14570
D=A // 14571
@CALL // 14572
0;JMP // 14573
(String.appendChar.ret.0)
@SP // 14574
AM=M-1 // 14575
D=M // 14576
@LCL // 14577
A=M // 14578
M=D // 14579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14580
A=M // 14581
D=M // 14582
@SP // 14583
AM=M+1 // 14584
A=A-1 // 14585
M=D // 14586
@LCL // 14587
A=M // 14588
D=M // 14589
@SP // 14590
AM=M+1 // 14591
A=A-1 // 14592
M=D // 14593
@THIS // 14594
A=M+1 // 14595
D=M // 14596
@SP // 14597
AM=M+1 // 14598
A=A-1 // 14599
M=D // 14600
// call Memory.copy
@8 // 14601
D=A // 14602
@14 // 14603
M=D // 14604
@Memory.copy // 14605
D=A // 14606
@13 // 14607
M=D // 14608
@String.appendChar.ret.1 // 14609
D=A // 14610
@CALL // 14611
0;JMP // 14612
(String.appendChar.ret.1)
@SP // 14613
M=M-1 // 14614

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14615
A=M // 14616
D=M // 14617
@SP // 14618
AM=M+1 // 14619
A=A-1 // 14620
M=D // 14621
// call Array.dispose
@6 // 14622
D=A // 14623
@14 // 14624
M=D // 14625
@Array.dispose // 14626
D=A // 14627
@13 // 14628
M=D // 14629
@String.appendChar.ret.2 // 14630
D=A // 14631
@CALL // 14632
0;JMP // 14633
(String.appendChar.ret.2)
@SP // 14634
M=M-1 // 14635

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

@THIS // 14636
A=M+1 // 14637
A=A+1 // 14638
D=M // 14639
@THIS // 14640
A=M+1 // 14641
A=A+1 // 14642
M=D+M // 14643

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14644
A=M // 14645
D=M // 14646
@THIS // 14647
A=M // 14648
M=D // 14649

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 14650
0;JMP // 14651

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
@THIS // 14652
A=M+1 // 14653
D=M // 14654
A=A-1 // 14655
D=D+M // 14656
@SP // 14657
AM=M+1 // 14658
A=A-1 // 14659
M=D // 14660
@ARG // 14661
A=M+1 // 14662
D=M // 14663
@SP // 14664
AM=M-1 // 14665
A=M // 14666
M=D // 14667

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

@THIS // 14668
A=M+1 // 14669
M=M+1 // 14670

////PushInstruction("pointer 0")
@3 // 14671
D=M // 14672
@SP // 14673
AM=M+1 // 14674
A=A-1 // 14675
M=D // 14676
@RETURN // 14677
0;JMP // 14678

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14679
A=M // 14680
D=M // 14681
@3 // 14682
M=D // 14683

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

@THIS // 14684
A=M+1 // 14685
M=M-1 // 14686

////PushInstruction("constant 0")
@SP // 14687
AM=M+1 // 14688
A=A-1 // 14689
M=0 // 14690
@RETURN // 14691
0;JMP // 14692

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14693
M=M+1 // 14694
AM=M+1 // 14695
A=A-1 // 14696
M=0 // 14697
A=A-1 // 14698
M=0 // 14699

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14700
A=M // 14701
D=M // 14702
@3 // 14703
M=D // 14704

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14705
A=M+1 // 14706
M=1 // 14707

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14708
A=M // 14709
M=0 // 14710

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
@String.intValue.LT.3 // 14711
D=A // 14712
@SP // 14713
AM=M+1 // 14714
A=A-1 // 14715
M=D // 14716
@LCL // 14717
A=M+1 // 14718
D=M // 14719
@SP // 14720
AM=M+1 // 14721
A=A-1 // 14722
M=D // 14723
@THIS // 14724
A=M+1 // 14725
D=M // 14726
@SP // 14727
AM=M-1 // 14728
D=M-D // 14729
@DO_LT // 14730
0;JMP // 14731
(String.intValue.LT.3)
D=!D // 14732
@WHILE_END_String.intValue1 // 14733
D;JNE // 14734

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

@LCL // 14735
A=M // 14736
D=M // 14737
@SP // 14738
AM=M+1 // 14739
A=A-1 // 14740
M=D // 14741
@10 // 14742
D=A // 14743
@SP // 14744
AM=M+1 // 14745
A=A-1 // 14746
M=D // 14747
// call Math.multiply
@7 // 14748
D=A // 14749
@14 // 14750
M=D // 14751
@Math.multiply // 14752
D=A // 14753
@13 // 14754
M=D // 14755
@String.intValue.ret.0 // 14756
D=A // 14757
@CALL // 14758
0;JMP // 14759
(String.intValue.ret.0)
@THIS // 14760
A=M // 14761
D=M // 14762
@SP // 14763
AM=M+1 // 14764
A=A-1 // 14765
M=D // 14766
@LCL // 14767
A=M+1 // 14768
D=M // 14769
@SP // 14770
AM=M-1 // 14771
A=D+M // 14772
D=M // 14773
@48 // 14774
D=D-A // 14775
@SP // 14776
AM=M-1 // 14777
D=D+M // 14778
@LCL // 14779
A=M // 14780
M=D // 14781

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

@LCL // 14782
A=M+1 // 14783
M=M+1 // 14784

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 14785
0;JMP // 14786

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 14787
A=M // 14788
D=M // 14789
@SP // 14790
AM=M+1 // 14791
A=A-1 // 14792
M=D // 14793
@RETURN // 14794
0;JMP // 14795

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 14796
D=A // 14797
@SP // 14798
AM=D+M // 14799
A=A-1 // 14800
M=0 // 14801
A=A-1 // 14802
M=0 // 14803
A=A-1 // 14804
M=0 // 14805
A=A-1 // 14806
M=0 // 14807
A=A-1 // 14808
M=0 // 14809
A=A-1 // 14810
M=0 // 14811

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14812
A=M // 14813
D=M // 14814
@3 // 14815
M=D // 14816

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14817
A=M+1 // 14818
M=0 // 14819

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14820
D=M // 14821
@4 // 14822
A=D+A // 14823
M=0 // 14824

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElse1}}
@String.setInt.EQ.4 // 14825
D=A // 14826
@SP // 14827
AM=M+1 // 14828
A=A-1 // 14829
M=D // 14830
@ARG // 14831
A=M+1 // 14832
D=M // 14833
@DO_EQ // 14834
0;JMP // 14835
(String.setInt.EQ.4)
D=!D // 14836
@String.setInt.IfElse1 // 14837
D;JNE // 14838

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14839
D=M // 14840
@SP // 14841
AM=M+1 // 14842
A=A-1 // 14843
M=D // 14844
@48 // 14845
D=A // 14846
@SP // 14847
AM=M+1 // 14848
A=A-1 // 14849
M=D // 14850
// call String.appendChar
@7 // 14851
D=A // 14852
@14 // 14853
M=D // 14854
@String.appendChar // 14855
D=A // 14856
@13 // 14857
M=D // 14858
@String.setInt.ret.0 // 14859
D=A // 14860
@CALL // 14861
0;JMP // 14862
(String.setInt.ret.0)
@SP // 14863
M=M-1 // 14864

////PushInstruction("constant 0")
@SP // 14865
AM=M+1 // 14866
A=A-1 // 14867
M=0 // 14868
@RETURN // 14869
0;JMP // 14870

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 14871
0;JMP // 14872

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
@String.setInt.LT.5 // 14873
D=A // 14874
@SP // 14875
AM=M+1 // 14876
A=A-1 // 14877
M=D // 14878
@ARG // 14879
A=M+1 // 14880
D=M // 14881
@DO_LT // 14882
0;JMP // 14883
(String.setInt.LT.5)
D=!D // 14884
@String.setInt.IfElse2 // 14885
D;JNE // 14886

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14887
D=M // 14888
@4 // 14889
A=D+A // 14890
M=1 // 14891

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
@String.setInt.LT.6 // 14892
D=A // 14893
@SP // 14894
AM=M+1 // 14895
A=A-1 // 14896
M=D // 14897
@ARG // 14898
A=M+1 // 14899
D=M // 14900
@DO_LT // 14901
0;JMP // 14902
(String.setInt.LT.6)
@SP // 14903
AM=M+1 // 14904
A=A-1 // 14905
M=D // 14906
@String.setInt.EQ.7 // 14907
D=A // 14908
@SP // 14909
AM=M+1 // 14910
A=A-1 // 14911
M=D // 14912
@ARG // 14913
A=M+1 // 14914
D=M // 14915
@32767 // 14916
D=D&A // 14917
@32767 // 14918
D=D-A // 14919
@DO_EQ // 14920
0;JMP // 14921
(String.setInt.EQ.7)
@SP // 14922
AM=M-1 // 14923
D=D&M // 14924
D=!D // 14925
@String.setInt.IfElse3 // 14926
D;JNE // 14927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14928
D=M // 14929
@SP // 14930
AM=M+1 // 14931
A=A-1 // 14932
M=D // 14933
@45 // 14934
D=A // 14935
@SP // 14936
AM=M+1 // 14937
A=A-1 // 14938
M=D // 14939
// call String.appendChar
@7 // 14940
D=A // 14941
@14 // 14942
M=D // 14943
@String.appendChar // 14944
D=A // 14945
@13 // 14946
M=D // 14947
@String.setInt.ret.1 // 14948
D=A // 14949
@CALL // 14950
0;JMP // 14951
(String.setInt.ret.1)
@SP // 14952
M=M-1 // 14953

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14954
D=M // 14955
@SP // 14956
AM=M+1 // 14957
A=A-1 // 14958
M=D // 14959
@51 // 14960
D=A // 14961
@SP // 14962
AM=M+1 // 14963
A=A-1 // 14964
M=D // 14965
// call String.appendChar
@7 // 14966
D=A // 14967
@14 // 14968
M=D // 14969
@String.appendChar // 14970
D=A // 14971
@13 // 14972
M=D // 14973
@String.setInt.ret.2 // 14974
D=A // 14975
@CALL // 14976
0;JMP // 14977
(String.setInt.ret.2)
@SP // 14978
M=M-1 // 14979

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14980
D=M // 14981
@SP // 14982
AM=M+1 // 14983
A=A-1 // 14984
M=D // 14985
@50 // 14986
D=A // 14987
@SP // 14988
AM=M+1 // 14989
A=A-1 // 14990
M=D // 14991
// call String.appendChar
@7 // 14992
D=A // 14993
@14 // 14994
M=D // 14995
@String.appendChar // 14996
D=A // 14997
@13 // 14998
M=D // 14999
@String.setInt.ret.3 // 15000
D=A // 15001
@CALL // 15002
0;JMP // 15003
(String.setInt.ret.3)
@SP // 15004
M=M-1 // 15005

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15006
D=M // 15007
@SP // 15008
AM=M+1 // 15009
A=A-1 // 15010
M=D // 15011
@55 // 15012
D=A // 15013
@SP // 15014
AM=M+1 // 15015
A=A-1 // 15016
M=D // 15017
// call String.appendChar
@7 // 15018
D=A // 15019
@14 // 15020
M=D // 15021
@String.appendChar // 15022
D=A // 15023
@13 // 15024
M=D // 15025
@String.setInt.ret.4 // 15026
D=A // 15027
@CALL // 15028
0;JMP // 15029
(String.setInt.ret.4)
@SP // 15030
M=M-1 // 15031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15032
D=M // 15033
@SP // 15034
AM=M+1 // 15035
A=A-1 // 15036
M=D // 15037
@54 // 15038
D=A // 15039
@SP // 15040
AM=M+1 // 15041
A=A-1 // 15042
M=D // 15043
// call String.appendChar
@7 // 15044
D=A // 15045
@14 // 15046
M=D // 15047
@String.appendChar // 15048
D=A // 15049
@13 // 15050
M=D // 15051
@String.setInt.ret.5 // 15052
D=A // 15053
@CALL // 15054
0;JMP // 15055
(String.setInt.ret.5)
@SP // 15056
M=M-1 // 15057

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15058
D=M // 15059
@SP // 15060
AM=M+1 // 15061
A=A-1 // 15062
M=D // 15063
@56 // 15064
D=A // 15065
@SP // 15066
AM=M+1 // 15067
A=A-1 // 15068
M=D // 15069
// call String.appendChar
@7 // 15070
D=A // 15071
@14 // 15072
M=D // 15073
@String.appendChar // 15074
D=A // 15075
@13 // 15076
M=D // 15077
@String.setInt.ret.6 // 15078
D=A // 15079
@CALL // 15080
0;JMP // 15081
(String.setInt.ret.6)
@SP // 15082
M=M-1 // 15083

////PushInstruction("constant 0")
@SP // 15084
AM=M+1 // 15085
A=A-1 // 15086
M=0 // 15087
@RETURN // 15088
0;JMP // 15089

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 15090
0;JMP // 15091

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

@ARG // 15092
A=M+1 // 15093
D=-M // 15094
@ARG // 15095
A=M+1 // 15096
M=D // 15097

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 15098
0;JMP // 15099

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

@ARG // 15100
A=M+1 // 15101
D=M // 15102
@LCL // 15103
A=M+1 // 15104
A=A+1 // 15105
M=D // 15106

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15107
A=M+1 // 15108
A=A+1 // 15109
A=A+1 // 15110
M=0 // 15111

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
@String.setInt.GT.8 // 15112
D=A // 15113
@SP // 15114
AM=M+1 // 15115
A=A-1 // 15116
M=D // 15117
@LCL // 15118
A=M+1 // 15119
A=A+1 // 15120
D=M // 15121
@DO_GT // 15122
0;JMP // 15123
(String.setInt.GT.8)
D=!D // 15124
@WHILE_END_String.setInt1 // 15125
D;JNE // 15126

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15127
A=M+1 // 15128
A=A+1 // 15129
D=M // 15130
@SP // 15131
AM=M+1 // 15132
A=A-1 // 15133
M=D // 15134
@10 // 15135
D=A // 15136
@SP // 15137
AM=M+1 // 15138
A=A-1 // 15139
M=D // 15140
// call Math.divide
@7 // 15141
D=A // 15142
@14 // 15143
M=D // 15144
@Math.divide // 15145
D=A // 15146
@13 // 15147
M=D // 15148
@String.setInt.ret.7 // 15149
D=A // 15150
@CALL // 15151
0;JMP // 15152
(String.setInt.ret.7)
@SP // 15153
AM=M-1 // 15154
D=M // 15155
@LCL // 15156
A=M+1 // 15157
A=A+1 // 15158
M=D // 15159

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

@LCL // 15160
A=M+1 // 15161
A=A+1 // 15162
A=A+1 // 15163
M=M+1 // 15164

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15165
0;JMP // 15166

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15167
A=M+1 // 15168
A=A+1 // 15169
A=A+1 // 15170
D=M // 15171
@SP // 15172
AM=M+1 // 15173
A=A-1 // 15174
M=D // 15175
// call Array.new
@6 // 15176
D=A // 15177
@14 // 15178
M=D // 15179
@Array.new // 15180
D=A // 15181
@13 // 15182
M=D // 15183
@String.setInt.ret.8 // 15184
D=A // 15185
@CALL // 15186
0;JMP // 15187
(String.setInt.ret.8)
@LCL // 15188
D=M // 15189
@5 // 15190
A=D+A // 15191
D=A // 15192
@R13 // 15193
M=D // 15194
@SP // 15195
AM=M-1 // 15196
D=M // 15197
@R13 // 15198
A=M // 15199
M=D // 15200

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15201
A=M+1 // 15202
M=0 // 15203

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
@String.setInt.GT.9 // 15204
D=A // 15205
@SP // 15206
AM=M+1 // 15207
A=A-1 // 15208
M=D // 15209
@ARG // 15210
A=M+1 // 15211
D=M // 15212
@DO_GT // 15213
0;JMP // 15214
(String.setInt.GT.9)
D=!D // 15215
@WHILE_END_String.setInt2 // 15216
D;JNE // 15217

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

@ARG // 15218
A=M+1 // 15219
D=M // 15220
@SP // 15221
AM=M+1 // 15222
A=A-1 // 15223
M=D // 15224
@ARG // 15225
A=M+1 // 15226
D=M // 15227
@SP // 15228
AM=M+1 // 15229
A=A-1 // 15230
M=D // 15231
@10 // 15232
D=A // 15233
@SP // 15234
AM=M+1 // 15235
A=A-1 // 15236
M=D // 15237
// call Math.divide
@7 // 15238
D=A // 15239
@14 // 15240
M=D // 15241
@Math.divide // 15242
D=A // 15243
@13 // 15244
M=D // 15245
@String.setInt.ret.9 // 15246
D=A // 15247
@CALL // 15248
0;JMP // 15249
(String.setInt.ret.9)
@10 // 15250
D=A // 15251
@SP // 15252
AM=M+1 // 15253
A=A-1 // 15254
M=D // 15255
// call Math.multiply
@7 // 15256
D=A // 15257
@14 // 15258
M=D // 15259
@Math.multiply // 15260
D=A // 15261
@13 // 15262
M=D // 15263
@String.setInt.ret.10 // 15264
D=A // 15265
@CALL // 15266
0;JMP // 15267
(String.setInt.ret.10)
@SP // 15268
AM=M-1 // 15269
D=M // 15270
@SP // 15271
AM=M-1 // 15272
D=M-D // 15273
@LCL // 15274
A=M // 15275
M=D // 15276

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
@LCL // 15277
D=M // 15278
@5 // 15279
A=D+A // 15280
D=M // 15281
@SP // 15282
AM=M+1 // 15283
A=A-1 // 15284
M=D // 15285
@LCL // 15286
A=M+1 // 15287
D=M // 15288
@SP // 15289
AM=M-1 // 15290
D=D+M // 15291
@SP // 15292
AM=M+1 // 15293
A=A-1 // 15294
M=D // 15295
@LCL // 15296
A=M // 15297
D=M // 15298
@48 // 15299
D=D+A // 15300
@SP // 15301
AM=M-1 // 15302
A=M // 15303
M=D // 15304

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15305
A=M+1 // 15306
D=M // 15307
@SP // 15308
AM=M+1 // 15309
A=A-1 // 15310
M=D // 15311
@10 // 15312
D=A // 15313
@SP // 15314
AM=M+1 // 15315
A=A-1 // 15316
M=D // 15317
// call Math.divide
@7 // 15318
D=A // 15319
@14 // 15320
M=D // 15321
@Math.divide // 15322
D=A // 15323
@13 // 15324
M=D // 15325
@String.setInt.ret.11 // 15326
D=A // 15327
@CALL // 15328
0;JMP // 15329
(String.setInt.ret.11)
@SP // 15330
AM=M-1 // 15331
D=M // 15332
@ARG // 15333
A=M+1 // 15334
M=D // 15335

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

@LCL // 15336
A=M+1 // 15337
M=M+1 // 15338

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15339
0;JMP // 15340

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
@String.setInt.EQ.10 // 15341
D=A // 15342
@SP // 15343
AM=M+1 // 15344
A=A-1 // 15345
M=D // 15346
@LCL // 15347
D=M // 15348
@4 // 15349
A=D+A // 15350
D=M // 15351
D=D-1 // 15352
@DO_EQ // 15353
0;JMP // 15354
(String.setInt.EQ.10)
D=!D // 15355
@String.setInt.IfElse4 // 15356
D;JNE // 15357

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15358
D=M // 15359
@SP // 15360
AM=M+1 // 15361
A=A-1 // 15362
M=D // 15363
@45 // 15364
D=A // 15365
@SP // 15366
AM=M+1 // 15367
A=A-1 // 15368
M=D // 15369
// call String.appendChar
@7 // 15370
D=A // 15371
@14 // 15372
M=D // 15373
@String.appendChar // 15374
D=A // 15375
@13 // 15376
M=D // 15377
@String.setInt.ret.12 // 15378
D=A // 15379
@CALL // 15380
0;JMP // 15381
(String.setInt.ret.12)
@SP // 15382
M=M-1 // 15383

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 15384
0;JMP // 15385

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
@String.setInt.GT.11 // 15386
D=A // 15387
@SP // 15388
AM=M+1 // 15389
A=A-1 // 15390
M=D // 15391
@LCL // 15392
A=M+1 // 15393
D=M // 15394
@DO_GT // 15395
0;JMP // 15396
(String.setInt.GT.11)
D=!D // 15397
@WHILE_END_String.setInt3 // 15398
D;JNE // 15399

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

@LCL // 15400
A=M+1 // 15401
M=M-1 // 15402

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

@3 // 15403
D=M // 15404
@SP // 15405
AM=M+1 // 15406
A=A-1 // 15407
M=D // 15408
@LCL // 15409
D=M // 15410
@5 // 15411
A=D+A // 15412
D=M // 15413
@SP // 15414
AM=M+1 // 15415
A=A-1 // 15416
M=D // 15417
@LCL // 15418
A=M+1 // 15419
D=M // 15420
@SP // 15421
AM=M-1 // 15422
A=D+M // 15423
D=M // 15424
@SP // 15425
AM=M+1 // 15426
A=A-1 // 15427
M=D // 15428
// call String.appendChar
@7 // 15429
D=A // 15430
@14 // 15431
M=D // 15432
@String.appendChar // 15433
D=A // 15434
@13 // 15435
M=D // 15436
@String.setInt.ret.13 // 15437
D=A // 15438
@CALL // 15439
0;JMP // 15440
(String.setInt.ret.13)
@SP // 15441
M=M-1 // 15442

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 15443
0;JMP // 15444

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15445
D=M // 15446
@5 // 15447
A=D+A // 15448
D=M // 15449
@SP // 15450
AM=M+1 // 15451
A=A-1 // 15452
M=D // 15453
// call Array.dispose
@6 // 15454
D=A // 15455
@14 // 15456
M=D // 15457
@Array.dispose // 15458
D=A // 15459
@13 // 15460
M=D // 15461
@String.setInt.ret.14 // 15462
D=A // 15463
@CALL // 15464
0;JMP // 15465
(String.setInt.ret.14)
@SP // 15466
M=M-1 // 15467

////PushInstruction("constant 0")
@SP // 15468
AM=M+1 // 15469
A=A-1 // 15470
M=0 // 15471
@RETURN // 15472
0;JMP // 15473

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15474
D=A // 15475
@SP // 15476
AM=M+1 // 15477
A=A-1 // 15478
M=D // 15479
@RETURN // 15480
0;JMP // 15481

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15482
D=A // 15483
@SP // 15484
AM=M+1 // 15485
A=A-1 // 15486
M=D // 15487
@RETURN // 15488
0;JMP // 15489

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15490
D=A // 15491
@SP // 15492
AM=M+1 // 15493
A=A-1 // 15494
M=D // 15495
@RETURN // 15496
0;JMP // 15497

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15498
D=A // 15499
@14 // 15500
M=D // 15501
@Memory.init // 15502
D=A // 15503
@13 // 15504
M=D // 15505
@Sys.init.ret.0 // 15506
D=A // 15507
@CALL // 15508
0;JMP // 15509
(Sys.init.ret.0)
@SP // 15510
M=M-1 // 15511

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15512
D=A // 15513
@14 // 15514
M=D // 15515
@Math.init // 15516
D=A // 15517
@13 // 15518
M=D // 15519
@Sys.init.ret.1 // 15520
D=A // 15521
@CALL // 15522
0;JMP // 15523
(Sys.init.ret.1)
@SP // 15524
M=M-1 // 15525

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15526
D=A // 15527
@14 // 15528
M=D // 15529
@Screen.init // 15530
D=A // 15531
@13 // 15532
M=D // 15533
@Sys.init.ret.2 // 15534
D=A // 15535
@CALL // 15536
0;JMP // 15537
(Sys.init.ret.2)
@SP // 15538
M=M-1 // 15539

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15540
D=A // 15541
@14 // 15542
M=D // 15543
@Output.init // 15544
D=A // 15545
@13 // 15546
M=D // 15547
@Sys.init.ret.3 // 15548
D=A // 15549
@CALL // 15550
0;JMP // 15551
(Sys.init.ret.3)
@SP // 15552
M=M-1 // 15553

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15554
D=A // 15555
@14 // 15556
M=D // 15557
@Keyboard.init // 15558
D=A // 15559
@13 // 15560
M=D // 15561
@Sys.init.ret.4 // 15562
D=A // 15563
@CALL // 15564
0;JMP // 15565
(Sys.init.ret.4)
@SP // 15566
M=M-1 // 15567

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15568
D=A // 15569
@14 // 15570
M=D // 15571
@Main.main // 15572
D=A // 15573
@13 // 15574
M=D // 15575
@Sys.init.ret.5 // 15576
D=A // 15577
@CALL // 15578
0;JMP // 15579
(Sys.init.ret.5)
@SP // 15580
M=M-1 // 15581

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15582
D=A // 15583
@14 // 15584
M=D // 15585
@Sys.halt // 15586
D=A // 15587
@13 // 15588
M=D // 15589
@Sys.init.ret.6 // 15590
D=A // 15591
@CALL // 15592
0;JMP // 15593
(Sys.init.ret.6)
@SP // 15594
M=M-1 // 15595

////PushInstruction("constant 0")
@SP // 15596
AM=M+1 // 15597
A=A-1 // 15598
M=0 // 15599
@RETURN // 15600
0;JMP // 15601

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0 // 15602
@WHILE_END_Sys.halt1 // 15603
D;JNE // 15604

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15605
0;JMP // 15606

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15607
AM=M+1 // 15608
A=A-1 // 15609
M=0 // 15610
@RETURN // 15611
0;JMP // 15612

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15613
AM=M+1 // 15614
A=A-1 // 15615
M=0 // 15616

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
@Sys.wait.GT.0 // 15617
D=A // 15618
@SP // 15619
AM=M+1 // 15620
A=A-1 // 15621
M=D // 15622
@ARG // 15623
A=M // 15624
D=M // 15625
@DO_GT // 15626
0;JMP // 15627
(Sys.wait.GT.0)
D=!D // 15628
@WHILE_END_Sys.wait1 // 15629
D;JNE // 15630

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

@ARG // 15631
A=M // 15632
M=M-1 // 15633

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15634
D=A // 15635
@LCL // 15636
A=M // 15637
M=D // 15638

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
@Sys.wait.GT.1 // 15639
D=A // 15640
@SP // 15641
AM=M+1 // 15642
A=A-1 // 15643
M=D // 15644
@LCL // 15645
A=M // 15646
D=M // 15647
@DO_GT // 15648
0;JMP // 15649
(Sys.wait.GT.1)
D=!D // 15650
@WHILE_END_Sys.wait2 // 15651
D;JNE // 15652

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

@LCL // 15653
A=M // 15654
M=M-1 // 15655

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15656
0;JMP // 15657

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15658
0;JMP // 15659

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15660
AM=M+1 // 15661
A=A-1 // 15662
M=0 // 15663
@RETURN // 15664
0;JMP // 15665

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15666
A=M // 15667
D=M // 15668
@SP // 15669
AM=M+1 // 15670
A=A-1 // 15671
M=D // 15672
// call Output.printInt
@6 // 15673
D=A // 15674
@14 // 15675
M=D // 15676
@Output.printInt // 15677
D=A // 15678
@13 // 15679
M=D // 15680
@Sys.error.ret.0 // 15681
D=A // 15682
@CALL // 15683
0;JMP // 15684
(Sys.error.ret.0)
@SP // 15685
M=M-1 // 15686

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15687
D=A // 15688
@14 // 15689
M=D // 15690
@Output.println // 15691
D=A // 15692
@13 // 15693
M=D // 15694
@Sys.error.ret.1 // 15695
D=A // 15696
@CALL // 15697
0;JMP // 15698
(Sys.error.ret.1)
@SP // 15699
M=M-1 // 15700

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15701
D=A // 15702
@14 // 15703
M=D // 15704
@Sys.halt // 15705
D=A // 15706
@13 // 15707
M=D // 15708
@Sys.error.ret.2 // 15709
D=A // 15710
@CALL // 15711
0;JMP // 15712
(Sys.error.ret.2)
@SP // 15713
M=M-1 // 15714

////PushInstruction("constant 0")
@SP // 15715
AM=M+1 // 15716
A=A-1 // 15717
M=0 // 15718
@RETURN // 15719
0;JMP // 15720

