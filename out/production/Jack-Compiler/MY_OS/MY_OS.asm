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
//        PushInstruction("constant 128"),
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
@128 // 344
D=D-A // 345
@DO_EQ // 346
0;JMP // 347
(Keyboard.readLine.EQ.2)
@WHILE_END_Keyboard.readLine1 // 348
D;JNE // 349

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 129"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Keyboard.readLine.IfElse1}}
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
D=!D // 363
@Keyboard.readLine.IfElse1 // 364
D;JNE // 365

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.eraseLastChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 366
A=M // 367
D=M // 368
@SP // 369
AM=M+1 // 370
A=A-1 // 371
M=D // 372
// call String.eraseLastChar
@6 // 373
D=A // 374
@14 // 375
M=D // 376
@String.eraseLastChar // 377
D=A // 378
@13 // 379
M=D // 380
@Keyboard.readLine.ret.3 // 381
D=A // 382
@CALL // 383
0;JMP // 384
(Keyboard.readLine.ret.3)
@SP // 385
M=M-1 // 386

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 387
0;JMP // 388

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 389
A=M // 390
D=M // 391
@SP // 392
AM=M+1 // 393
A=A-1 // 394
M=D // 395
@LCL // 396
A=M+1 // 397
D=M // 398
@SP // 399
AM=M+1 // 400
A=A-1 // 401
M=D // 402
// call String.appendChar
@7 // 403
D=A // 404
@14 // 405
M=D // 406
@String.appendChar // 407
D=A // 408
@13 // 409
M=D // 410
@Keyboard.readLine.ret.4 // 411
D=A // 412
@CALL // 413
0;JMP // 414
(Keyboard.readLine.ret.4)
@SP // 415
M=M-1 // 416

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.readChar}}
//  pop:  PopInstruction{address=local 1}
//}

// call Keyboard.readChar
@5 // 417
D=A // 418
@14 // 419
M=D // 420
@Keyboard.readChar // 421
D=A // 422
@13 // 423
M=D // 424
@Keyboard.readLine.ret.5 // 425
D=A // 426
@CALL // 427
0;JMP // 428
(Keyboard.readLine.ret.5)
@SP // 429
AM=M-1 // 430
D=M // 431
@LCL // 432
A=M+1 // 433
M=D // 434

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 435
0;JMP // 436

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 437
A=M // 438
D=M // 439
@SP // 440
AM=M+1 // 441
A=A-1 // 442
M=D // 443
@RETURN // 444
0;JMP // 445

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 446
AM=M+1 // 447
A=A-1 // 448
M=0 // 449

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Keyboard.readLine}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 450
A=M // 451
D=M // 452
@SP // 453
AM=M+1 // 454
A=A-1 // 455
M=D // 456
// call Keyboard.readLine
@6 // 457
D=A // 458
@14 // 459
M=D // 460
@Keyboard.readLine // 461
D=A // 462
@13 // 463
M=D // 464
@Keyboard.readInt.ret.0 // 465
D=A // 466
@CALL // 467
0;JMP // 468
(Keyboard.readInt.ret.0)
@SP // 469
AM=M-1 // 470
D=M // 471
@LCL // 472
A=M // 473
M=D // 474

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.intValue}}
@LCL // 475
A=M // 476
D=M // 477
@SP // 478
AM=M+1 // 479
A=A-1 // 480
M=D // 481
// call String.intValue
@6 // 482
D=A // 483
@14 // 484
M=D // 485
@String.intValue // 486
D=A // 487
@13 // 488
M=D // 489
@Keyboard.readInt.ret.1 // 490
D=A // 491
@CALL // 492
0;JMP // 493
(Keyboard.readInt.ret.1)
@RETURN // 494
0;JMP // 495

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 496
AM=M+1 // 497
A=A-1 // 498
M=0 // 499

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 500
D=A // 501
@SP // 502
AM=M+1 // 503
A=A-1 // 504
M=D // 505
// call String.new
@6 // 506
D=A // 507
@14 // 508
M=D // 509
@String.new // 510
D=A // 511
@13 // 512
M=D // 513
@Main.main.ret.0 // 514
D=A // 515
@CALL // 516
0;JMP // 517
(Main.main.ret.0)
@72 // 518
D=A // 519
@SP // 520
AM=M+1 // 521
A=A-1 // 522
M=D // 523
// call String.appendChar
@7 // 524
D=A // 525
@14 // 526
M=D // 527
@String.appendChar // 528
D=A // 529
@13 // 530
M=D // 531
@Main.main.ret.1 // 532
D=A // 533
@CALL // 534
0;JMP // 535
(Main.main.ret.1)
@101 // 536
D=A // 537
@SP // 538
AM=M+1 // 539
A=A-1 // 540
M=D // 541
// call String.appendChar
@7 // 542
D=A // 543
@14 // 544
M=D // 545
@String.appendChar // 546
D=A // 547
@13 // 548
M=D // 549
@Main.main.ret.2 // 550
D=A // 551
@CALL // 552
0;JMP // 553
(Main.main.ret.2)
@108 // 554
D=A // 555
@SP // 556
AM=M+1 // 557
A=A-1 // 558
M=D // 559
// call String.appendChar
@7 // 560
D=A // 561
@14 // 562
M=D // 563
@String.appendChar // 564
D=A // 565
@13 // 566
M=D // 567
@Main.main.ret.3 // 568
D=A // 569
@CALL // 570
0;JMP // 571
(Main.main.ret.3)
@108 // 572
D=A // 573
@SP // 574
AM=M+1 // 575
A=A-1 // 576
M=D // 577
// call String.appendChar
@7 // 578
D=A // 579
@14 // 580
M=D // 581
@String.appendChar // 582
D=A // 583
@13 // 584
M=D // 585
@Main.main.ret.4 // 586
D=A // 587
@CALL // 588
0;JMP // 589
(Main.main.ret.4)
@111 // 590
D=A // 591
@SP // 592
AM=M+1 // 593
A=A-1 // 594
M=D // 595
// call String.appendChar
@7 // 596
D=A // 597
@14 // 598
M=D // 599
@String.appendChar // 600
D=A // 601
@13 // 602
M=D // 603
@Main.main.ret.5 // 604
D=A // 605
@CALL // 606
0;JMP // 607
(Main.main.ret.5)
@44 // 608
D=A // 609
@SP // 610
AM=M+1 // 611
A=A-1 // 612
M=D // 613
// call String.appendChar
@7 // 614
D=A // 615
@14 // 616
M=D // 617
@String.appendChar // 618
D=A // 619
@13 // 620
M=D // 621
@Main.main.ret.6 // 622
D=A // 623
@CALL // 624
0;JMP // 625
(Main.main.ret.6)
@32 // 626
D=A // 627
@SP // 628
AM=M+1 // 629
A=A-1 // 630
M=D // 631
// call String.appendChar
@7 // 632
D=A // 633
@14 // 634
M=D // 635
@String.appendChar // 636
D=A // 637
@13 // 638
M=D // 639
@Main.main.ret.7 // 640
D=A // 641
@CALL // 642
0;JMP // 643
(Main.main.ret.7)
@119 // 644
D=A // 645
@SP // 646
AM=M+1 // 647
A=A-1 // 648
M=D // 649
// call String.appendChar
@7 // 650
D=A // 651
@14 // 652
M=D // 653
@String.appendChar // 654
D=A // 655
@13 // 656
M=D // 657
@Main.main.ret.8 // 658
D=A // 659
@CALL // 660
0;JMP // 661
(Main.main.ret.8)
@111 // 662
D=A // 663
@SP // 664
AM=M+1 // 665
A=A-1 // 666
M=D // 667
// call String.appendChar
@7 // 668
D=A // 669
@14 // 670
M=D // 671
@String.appendChar // 672
D=A // 673
@13 // 674
M=D // 675
@Main.main.ret.9 // 676
D=A // 677
@CALL // 678
0;JMP // 679
(Main.main.ret.9)
@114 // 680
D=A // 681
@SP // 682
AM=M+1 // 683
A=A-1 // 684
M=D // 685
// call String.appendChar
@7 // 686
D=A // 687
@14 // 688
M=D // 689
@String.appendChar // 690
D=A // 691
@13 // 692
M=D // 693
@Main.main.ret.10 // 694
D=A // 695
@CALL // 696
0;JMP // 697
(Main.main.ret.10)
@108 // 698
D=A // 699
@SP // 700
AM=M+1 // 701
A=A-1 // 702
M=D // 703
// call String.appendChar
@7 // 704
D=A // 705
@14 // 706
M=D // 707
@String.appendChar // 708
D=A // 709
@13 // 710
M=D // 711
@Main.main.ret.11 // 712
D=A // 713
@CALL // 714
0;JMP // 715
(Main.main.ret.11)
@100 // 716
D=A // 717
@SP // 718
AM=M+1 // 719
A=A-1 // 720
M=D // 721
// call String.appendChar
@7 // 722
D=A // 723
@14 // 724
M=D // 725
@String.appendChar // 726
D=A // 727
@13 // 728
M=D // 729
@Main.main.ret.12 // 730
D=A // 731
@CALL // 732
0;JMP // 733
(Main.main.ret.12)
@33 // 734
D=A // 735
@SP // 736
AM=M+1 // 737
A=A-1 // 738
M=D // 739
// call String.appendChar
@7 // 740
D=A // 741
@14 // 742
M=D // 743
@String.appendChar // 744
D=A // 745
@13 // 746
M=D // 747
@Main.main.ret.13 // 748
D=A // 749
@CALL // 750
0;JMP // 751
(Main.main.ret.13)
@SP // 752
AM=M-1 // 753
D=M // 754
@LCL // 755
A=M // 756
M=D // 757

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 758
A=M // 759
D=M // 760
@SP // 761
AM=M+1 // 762
A=A-1 // 763
M=D // 764
// call Output.printString
@6 // 765
D=A // 766
@14 // 767
M=D // 768
@Output.printString // 769
D=A // 770
@13 // 771
M=D // 772
@Main.main.ret.14 // 773
D=A // 774
@CALL // 775
0;JMP // 776
(Main.main.ret.14)
@SP // 777
M=M-1 // 778

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 779
D=A // 780
@14 // 781
M=D // 782
@Output.println // 783
D=A // 784
@13 // 785
M=D // 786
@Main.main.ret.15 // 787
D=A // 788
@CALL // 789
0;JMP // 790
(Main.main.ret.15)
@SP // 791
M=M-1 // 792

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 793
A=M // 794
D=M // 795
@SP // 796
AM=M+1 // 797
A=A-1 // 798
M=D // 799
// call String.dispose
@6 // 800
D=A // 801
@14 // 802
M=D // 803
@String.dispose // 804
D=A // 805
@13 // 806
M=D // 807
@Main.main.ret.16 // 808
D=A // 809
@CALL // 810
0;JMP // 811
(Main.main.ret.16)
@SP // 812
M=M-1 // 813

////PushInstruction("constant 0")
@SP // 814
AM=M+1 // 815
A=A-1 // 816
M=0 // 817
@RETURN // 818
0;JMP // 819

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 820
M=M+1 // 821
AM=M+1 // 822
A=A-1 // 823
M=0 // 824
A=A-1 // 825
M=0 // 826

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 827
A=M // 828
M=1 // 829

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 830
A=M+1 // 831
M=0 // 832

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 833
D=A // 834
@SP // 835
AM=M+1 // 836
A=A-1 // 837
M=D // 838
// call Array.new
@6 // 839
D=A // 840
@14 // 841
M=D // 842
@Array.new // 843
D=A // 844
@13 // 845
M=D // 846
@Math.init.ret.0 // 847
D=A // 848
@CALL // 849
0;JMP // 850
(Math.init.ret.0)
@SP // 851
AM=M-1 // 852
D=M // 853
@Math.0 // 854
M=D // 855

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
@Math.init.LT.0 // 856
D=A // 857
@SP // 858
AM=M+1 // 859
A=A-1 // 860
M=D // 861
@LCL // 862
A=M+1 // 863
D=M // 864
@16 // 865
D=D-A // 866
@DO_LT // 867
0;JMP // 868
(Math.init.LT.0)
D=!D // 869
@WHILE_END_Math.init1 // 870
D;JNE // 871

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 872
D=M // 873
@SP // 874
AM=M+1 // 875
A=A-1 // 876
M=D // 877
@LCL // 878
A=M+1 // 879
D=M // 880
@SP // 881
AM=M-1 // 882
D=D+M // 883
@SP // 884
AM=M+1 // 885
A=A-1 // 886
M=D // 887
@LCL // 888
A=M // 889
D=M // 890
@SP // 891
AM=M-1 // 892
A=M // 893
M=D // 894

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

@LCL // 895
A=M // 896
D=M // 897
@LCL // 898
A=M // 899
M=D+M // 900

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

@LCL // 901
A=M+1 // 902
M=M+1 // 903

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 904
0;JMP // 905

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 906
AM=M+1 // 907
A=A-1 // 908
M=0 // 909
@RETURN // 910
0;JMP // 911

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
@ARG // 912
A=M // 913
D=M // 914
@SP // 915
AM=M+1 // 916
A=A-1 // 917
M=D // 918
@Math.0 // 919
D=M // 920
@SP // 921
AM=M+1 // 922
A=A-1 // 923
M=D // 924
@ARG // 925
A=M+1 // 926
D=M // 927
@SP // 928
AM=M-1 // 929
A=D+M // 930
D=M // 931
@SP // 932
AM=M-1 // 933
D=D&M // 934
@SP // 935
AM=M+1 // 936
A=A-1 // 937
M=D // 938
@RETURN // 939
0;JMP // 940

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 941
D=A // 942
@SP // 943
AM=D+M // 944
A=A-1 // 945
M=0 // 946
A=A-1 // 947
M=0 // 948
A=A-1 // 949
M=0 // 950

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
@Math.multiply.EQ.1 // 951
D=A // 952
@SP // 953
AM=M+1 // 954
A=A-1 // 955
M=D // 956
@ARG // 957
A=M // 958
D=M // 959
@DO_EQ // 960
0;JMP // 961
(Math.multiply.EQ.1)
@SP // 962
AM=M+1 // 963
A=A-1 // 964
M=D // 965
@Math.multiply.EQ.2 // 966
D=A // 967
@SP // 968
AM=M+1 // 969
A=A-1 // 970
M=D // 971
@ARG // 972
A=M+1 // 973
D=M // 974
@DO_EQ // 975
0;JMP // 976
(Math.multiply.EQ.2)
@SP // 977
AM=M-1 // 978
D=D|M // 979
D=!D // 980
@Math.multiply.IfElseEND1 // 981
D;JNE // 982

////PushInstruction("constant 0")
@SP // 983
AM=M+1 // 984
A=A-1 // 985
M=0 // 986
@RETURN // 987
0;JMP // 988

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
@Math.multiply.EQ.3 // 989
D=A // 990
@SP // 991
AM=M+1 // 992
A=A-1 // 993
M=D // 994
@ARG // 995
A=M // 996
D=M // 997
D=D-1 // 998
@DO_EQ // 999
0;JMP // 1000
(Math.multiply.EQ.3)
D=!D // 1001
@Math.multiply.IfElseEND2 // 1002
D;JNE // 1003

////PushInstruction("argument 1")
@ARG // 1004
A=M+1 // 1005
D=M // 1006
@SP // 1007
AM=M+1 // 1008
A=A-1 // 1009
M=D // 1010
@RETURN // 1011
0;JMP // 1012

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
@Math.multiply.EQ.4 // 1013
D=A // 1014
@SP // 1015
AM=M+1 // 1016
A=A-1 // 1017
M=D // 1018
@ARG // 1019
A=M+1 // 1020
D=M // 1021
D=D-1 // 1022
@DO_EQ // 1023
0;JMP // 1024
(Math.multiply.EQ.4)
D=!D // 1025
@Math.multiply.IfElseEND3 // 1026
D;JNE // 1027

////PushInstruction("argument 0")
@ARG // 1028
A=M // 1029
D=M // 1030
@SP // 1031
AM=M+1 // 1032
A=A-1 // 1033
M=D // 1034
@RETURN // 1035
0;JMP // 1036

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
@Math.multiply.EQ.5 // 1037
D=A // 1038
@SP // 1039
AM=M+1 // 1040
A=A-1 // 1041
M=D // 1042
@ARG // 1043
A=M // 1044
D=M // 1045
@2 // 1046
D=D-A // 1047
@DO_EQ // 1048
0;JMP // 1049
(Math.multiply.EQ.5)
D=!D // 1050
@Math.multiply.IfElseEND4 // 1051
D;JNE // 1052

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1053
A=M+1 // 1054
D=M // 1055
D=D+M // 1056
@SP // 1057
AM=M+1 // 1058
A=A-1 // 1059
M=D // 1060
@RETURN // 1061
0;JMP // 1062

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
@Math.multiply.EQ.6 // 1063
D=A // 1064
@SP // 1065
AM=M+1 // 1066
A=A-1 // 1067
M=D // 1068
@ARG // 1069
A=M+1 // 1070
D=M // 1071
@2 // 1072
D=D-A // 1073
@DO_EQ // 1074
0;JMP // 1075
(Math.multiply.EQ.6)
D=!D // 1076
@Math.multiply.IfElseEND5 // 1077
D;JNE // 1078

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1079
A=M // 1080
D=M // 1081
D=D+M // 1082
@SP // 1083
AM=M+1 // 1084
A=A-1 // 1085
M=D // 1086
@RETURN // 1087
0;JMP // 1088

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1089
A=M+1 // 1090
A=A+1 // 1091
M=1 // 1092

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1093
A=M+1 // 1094
M=0 // 1095

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1096
A=M // 1097
M=0 // 1098

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
@Math.multiply.LT.7 // 1099
D=A // 1100
@SP // 1101
AM=M+1 // 1102
A=A-1 // 1103
M=D // 1104
@LCL // 1105
A=M+1 // 1106
D=M // 1107
@16 // 1108
D=D-A // 1109
@DO_LT // 1110
0;JMP // 1111
(Math.multiply.LT.7)
D=!D // 1112
@WHILE_END_Math.multiply1 // 1113
D;JNE // 1114

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
@Math.multiply.EQ.8 // 1115
D=A // 1116
@SP // 1117
AM=M+1 // 1118
A=A-1 // 1119
M=D // 1120
@ARG // 1121
A=M+1 // 1122
D=M // 1123
@SP // 1124
AM=M+1 // 1125
A=A-1 // 1126
M=D // 1127
@LCL // 1128
A=M+1 // 1129
A=A+1 // 1130
D=M // 1131
@SP // 1132
AM=M-1 // 1133
D=D&M // 1134
@DO_EQ // 1135
0;JMP // 1136
(Math.multiply.EQ.8)
@Math.multiply.IfElseEND6 // 1137
D;JNE // 1138

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

@ARG // 1139
A=M // 1140
D=M // 1141
@LCL // 1142
A=M // 1143
M=D+M // 1144

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

@ARG // 1145
A=M // 1146
D=M // 1147
@ARG // 1148
A=M // 1149
M=D+M // 1150

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

@LCL // 1151
A=M+1 // 1152
M=M+1 // 1153

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

@LCL // 1154
A=M+1 // 1155
A=A+1 // 1156
D=M // 1157
@LCL // 1158
A=M+1 // 1159
A=A+1 // 1160
M=D+M // 1161

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1162
0;JMP // 1163

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1164
A=M // 1165
D=M // 1166
@SP // 1167
AM=M+1 // 1168
A=A-1 // 1169
M=D // 1170
@RETURN // 1171
0;JMP // 1172

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1173
D=A // 1174
@SP // 1175
AM=D+M // 1176
A=A-1 // 1177
M=0 // 1178
A=A-1 // 1179
M=0 // 1180
A=A-1 // 1181
M=0 // 1182

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1183
A=M // 1184
D=M // 1185
@SP // 1186
AM=M+1 // 1187
A=A-1 // 1188
M=D // 1189
// call Math.abs
@6 // 1190
D=A // 1191
@14 // 1192
M=D // 1193
@Math.abs // 1194
D=A // 1195
@13 // 1196
M=D // 1197
@Math.divide.ret.0 // 1198
D=A // 1199
@CALL // 1200
0;JMP // 1201
(Math.divide.ret.0)
@SP // 1202
AM=M-1 // 1203
D=M // 1204
@LCL // 1205
A=M+1 // 1206
M=D // 1207

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1208
A=M+1 // 1209
D=M // 1210
@SP // 1211
AM=M+1 // 1212
A=A-1 // 1213
M=D // 1214
// call Math.abs
@6 // 1215
D=A // 1216
@14 // 1217
M=D // 1218
@Math.abs // 1219
D=A // 1220
@13 // 1221
M=D // 1222
@Math.divide.ret.1 // 1223
D=A // 1224
@CALL // 1225
0;JMP // 1226
(Math.divide.ret.1)
@SP // 1227
AM=M-1 // 1228
D=M // 1229
@LCL // 1230
A=M+1 // 1231
A=A+1 // 1232
M=D // 1233

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND1}}
@Math.divide.GT.9 // 1234
D=A // 1235
@SP // 1236
AM=M+1 // 1237
A=A-1 // 1238
M=D // 1239
@LCL // 1240
A=M+1 // 1241
A=A+1 // 1242
D=M // 1243
A=A-1 // 1244
D=D-M // 1245
@DO_GT // 1246
0;JMP // 1247
(Math.divide.GT.9)
D=!D // 1248
@Math.divide.IfElseEND1 // 1249
D;JNE // 1250

////PushInstruction("constant 0")
@SP // 1251
AM=M+1 // 1252
A=A-1 // 1253
M=0 // 1254
@RETURN // 1255
0;JMP // 1256

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

@LCL // 1257
A=M+1 // 1258
D=M // 1259
@SP // 1260
AM=M+1 // 1261
A=A-1 // 1262
M=D // 1263
@LCL // 1264
A=M+1 // 1265
A=A+1 // 1266
D=M // 1267
D=D+M // 1268
@SP // 1269
AM=M+1 // 1270
A=A-1 // 1271
M=D // 1272
// call Math.divide
@7 // 1273
D=A // 1274
@14 // 1275
M=D // 1276
@Math.divide // 1277
D=A // 1278
@13 // 1279
M=D // 1280
@Math.divide.ret.2 // 1281
D=A // 1282
@CALL // 1283
0;JMP // 1284
(Math.divide.ret.2)
@SP // 1285
AM=M-1 // 1286
D=M // 1287
@LCL // 1288
A=M // 1289
M=D // 1290

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
@Math.divide.LT.10 // 1291
D=A // 1292
@SP // 1293
AM=M+1 // 1294
A=A-1 // 1295
M=D // 1296
@LCL // 1297
A=M+1 // 1298
D=M // 1299
@SP // 1300
AM=M+1 // 1301
A=A-1 // 1302
M=D // 1303
@LCL // 1304
A=M // 1305
D=M // 1306
D=D+M // 1307
@SP // 1308
AM=M+1 // 1309
A=A-1 // 1310
M=D // 1311
@LCL // 1312
A=M+1 // 1313
A=A+1 // 1314
D=M // 1315
@SP // 1316
AM=M+1 // 1317
A=A-1 // 1318
M=D // 1319
// call Math.multiply
@7 // 1320
D=A // 1321
@14 // 1322
M=D // 1323
@Math.multiply // 1324
D=A // 1325
@13 // 1326
M=D // 1327
@Math.divide.ret.3 // 1328
D=A // 1329
@CALL // 1330
0;JMP // 1331
(Math.divide.ret.3)
@SP // 1332
AM=M-1 // 1333
D=M // 1334
@SP // 1335
AM=M-1 // 1336
D=M-D // 1337
@SP // 1338
AM=M+1 // 1339
A=A-1 // 1340
M=D // 1341
@LCL // 1342
A=M+1 // 1343
A=A+1 // 1344
D=M // 1345
@SP // 1346
AM=M-1 // 1347
D=M-D // 1348
@DO_LT // 1349
0;JMP // 1350
(Math.divide.LT.10)
D=!D // 1351
@Math.divide.IfElse2 // 1352
D;JNE // 1353

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "LT"
//                    ),
//                right:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "GT"
//                    ),
//                binaryOp: "AND"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "GT"
//                    ),
//                right:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "LT"
//                    ),
//                binaryOp: "AND"
//            ),
//        binaryOp: "OR"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND3}}
@Math.divide.LT.11 // 1354
D=A // 1355
@SP // 1356
AM=M+1 // 1357
A=A-1 // 1358
M=D // 1359
@ARG // 1360
A=M // 1361
D=M // 1362
@DO_LT // 1363
0;JMP // 1364
(Math.divide.LT.11)
@SP // 1365
AM=M+1 // 1366
A=A-1 // 1367
M=D // 1368
@Math.divide.GT.12 // 1369
D=A // 1370
@SP // 1371
AM=M+1 // 1372
A=A-1 // 1373
M=D // 1374
@ARG // 1375
A=M+1 // 1376
D=M // 1377
@DO_GT // 1378
0;JMP // 1379
(Math.divide.GT.12)
@SP // 1380
AM=M-1 // 1381
D=D&M // 1382
@SP // 1383
AM=M+1 // 1384
A=A-1 // 1385
M=D // 1386
@Math.divide.GT.13 // 1387
D=A // 1388
@SP // 1389
AM=M+1 // 1390
A=A-1 // 1391
M=D // 1392
@ARG // 1393
A=M // 1394
D=M // 1395
@DO_GT // 1396
0;JMP // 1397
(Math.divide.GT.13)
@SP // 1398
AM=M+1 // 1399
A=A-1 // 1400
M=D // 1401
@Math.divide.LT.14 // 1402
D=A // 1403
@SP // 1404
AM=M+1 // 1405
A=A-1 // 1406
M=D // 1407
@ARG // 1408
A=M+1 // 1409
D=M // 1410
@DO_LT // 1411
0;JMP // 1412
(Math.divide.LT.14)
@SP // 1413
AM=M-1 // 1414
D=D&M // 1415
@SP // 1416
AM=M-1 // 1417
D=D|M // 1418
D=!D // 1419
@Math.divide.IfElseEND3 // 1420
D;JNE // 1421

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1422
A=M // 1423
D=-M // 1424
@LCL // 1425
A=M // 1426
M=D // 1427

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
@LCL // 1428
A=M // 1429
D=M // 1430
D=D+M // 1431
@SP // 1432
AM=M+1 // 1433
A=A-1 // 1434
M=D // 1435
@RETURN // 1436
0;JMP // 1437

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1438
0;JMP // 1439

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "LT"
//                    ),
//                right:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "GT"
//                    ),
//                binaryOp: "AND"
//            ),
//        right:
//            BinaryPushGroup(
//                left:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "GT"
//                    ),
//                right:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("argument 1"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "LT"
//                    ),
//                binaryOp: "AND"
//            ),
//        binaryOp: "OR"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND4}}
@Math.divide.LT.15 // 1440
D=A // 1441
@SP // 1442
AM=M+1 // 1443
A=A-1 // 1444
M=D // 1445
@ARG // 1446
A=M // 1447
D=M // 1448
@DO_LT // 1449
0;JMP // 1450
(Math.divide.LT.15)
@SP // 1451
AM=M+1 // 1452
A=A-1 // 1453
M=D // 1454
@Math.divide.GT.16 // 1455
D=A // 1456
@SP // 1457
AM=M+1 // 1458
A=A-1 // 1459
M=D // 1460
@ARG // 1461
A=M+1 // 1462
D=M // 1463
@DO_GT // 1464
0;JMP // 1465
(Math.divide.GT.16)
@SP // 1466
AM=M-1 // 1467
D=D&M // 1468
@SP // 1469
AM=M+1 // 1470
A=A-1 // 1471
M=D // 1472
@Math.divide.GT.17 // 1473
D=A // 1474
@SP // 1475
AM=M+1 // 1476
A=A-1 // 1477
M=D // 1478
@ARG // 1479
A=M // 1480
D=M // 1481
@DO_GT // 1482
0;JMP // 1483
(Math.divide.GT.17)
@SP // 1484
AM=M+1 // 1485
A=A-1 // 1486
M=D // 1487
@Math.divide.LT.18 // 1488
D=A // 1489
@SP // 1490
AM=M+1 // 1491
A=A-1 // 1492
M=D // 1493
@ARG // 1494
A=M+1 // 1495
D=M // 1496
@DO_LT // 1497
0;JMP // 1498
(Math.divide.LT.18)
@SP // 1499
AM=M-1 // 1500
D=D&M // 1501
@SP // 1502
AM=M-1 // 1503
D=D|M // 1504
D=!D // 1505
@Math.divide.IfElseEND4 // 1506
D;JNE // 1507

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1508
A=M // 1509
D=-M // 1510
@LCL // 1511
A=M // 1512
M=D // 1513

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
@LCL // 1514
A=M // 1515
D=M // 1516
D=D+M // 1517
D=D+1 // 1518
@SP // 1519
AM=M+1 // 1520
A=A-1 // 1521
M=D // 1522
@RETURN // 1523
0;JMP // 1524

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
@ARG // 1525
A=M // 1526
D=M // 1527
@SP // 1528
AM=M+1 // 1529
A=A-1 // 1530
M=D // 1531
@ARG // 1532
A=M // 1533
D=M // 1534
@SP // 1535
AM=M+1 // 1536
A=A-1 // 1537
M=D // 1538
@ARG // 1539
A=M+1 // 1540
D=M // 1541
@SP // 1542
AM=M+1 // 1543
A=A-1 // 1544
M=D // 1545
// call Math.divide
@7 // 1546
D=A // 1547
@14 // 1548
M=D // 1549
@Math.divide // 1550
D=A // 1551
@13 // 1552
M=D // 1553
@Math.mod.ret.0 // 1554
D=A // 1555
@CALL // 1556
0;JMP // 1557
(Math.mod.ret.0)
@ARG // 1558
A=M+1 // 1559
D=M // 1560
@SP // 1561
AM=M+1 // 1562
A=A-1 // 1563
M=D // 1564
// call Math.multiply
@7 // 1565
D=A // 1566
@14 // 1567
M=D // 1568
@Math.multiply // 1569
D=A // 1570
@13 // 1571
M=D // 1572
@Math.mod.ret.1 // 1573
D=A // 1574
@CALL // 1575
0;JMP // 1576
(Math.mod.ret.1)
@SP // 1577
AM=M-1 // 1578
D=M // 1579
@SP // 1580
AM=M-1 // 1581
D=M-D // 1582
@SP // 1583
AM=M+1 // 1584
A=A-1 // 1585
M=D // 1586
@RETURN // 1587
0;JMP // 1588

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
@Math.0 // 1589
D=M // 1590
@SP // 1591
AM=M+1 // 1592
A=A-1 // 1593
M=D // 1594
@ARG // 1595
A=M // 1596
D=M // 1597
@SP // 1598
AM=M-1 // 1599
A=D+M // 1600
D=M // 1601
@SP // 1602
AM=M+1 // 1603
A=A-1 // 1604
M=D // 1605
@RETURN // 1606
0;JMP // 1607

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1608
D=A // 1609
@SP // 1610
AM=D+M // 1611
A=A-1 // 1612
M=0 // 1613
A=A-1 // 1614
M=0 // 1615
A=A-1 // 1616
M=0 // 1617
A=A-1 // 1618
M=0 // 1619

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1620
A=M // 1621
M=0 // 1622

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1623
D=A // 1624
@LCL // 1625
A=M+1 // 1626
M=D // 1627

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
@Math.sqrt.LT.19 // 1628
D=A // 1629
@SP // 1630
AM=M+1 // 1631
A=A-1 // 1632
M=D // 1633
@LCL // 1634
A=M+1 // 1635
D=M // 1636
@DO_LT // 1637
0;JMP // 1638
(Math.sqrt.LT.19)
@WHILE_END_Math.sqrt1 // 1639
D;JNE // 1640

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

@LCL // 1641
A=M // 1642
D=M // 1643
@SP // 1644
AM=M+1 // 1645
A=A-1 // 1646
M=D // 1647
@Math.0 // 1648
D=M // 1649
@SP // 1650
AM=M+1 // 1651
A=A-1 // 1652
M=D // 1653
@LCL // 1654
A=M+1 // 1655
D=M // 1656
@SP // 1657
AM=M-1 // 1658
A=D+M // 1659
D=M // 1660
@SP // 1661
AM=M-1 // 1662
D=D+M // 1663
@LCL // 1664
A=M+1 // 1665
A=A+1 // 1666
M=D // 1667

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1668
D=A // 1669
@SP // 1670
M=D+M // 1671
@LCL // 1672
A=M+1 // 1673
A=A+1 // 1674
D=M // 1675
@SP // 1676
A=M-1 // 1677
M=D // 1678
A=A-1 // 1679
M=D // 1680
// call Math.multiply
@7 // 1681
D=A // 1682
@14 // 1683
M=D // 1684
@Math.multiply // 1685
D=A // 1686
@13 // 1687
M=D // 1688
@Math.sqrt.ret.0 // 1689
D=A // 1690
@CALL // 1691
0;JMP // 1692
(Math.sqrt.ret.0)
@SP // 1693
AM=M-1 // 1694
D=M // 1695
@LCL // 1696
A=M+1 // 1697
A=A+1 // 1698
A=A+1 // 1699
M=D // 1700

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
@Math.sqrt.GT.20 // 1701
D=A // 1702
@SP // 1703
AM=M+1 // 1704
A=A-1 // 1705
M=D // 1706
@LCL // 1707
A=M+1 // 1708
A=A+1 // 1709
A=A+1 // 1710
D=M // 1711
@SP // 1712
AM=M+1 // 1713
A=A-1 // 1714
M=D // 1715
@ARG // 1716
A=M // 1717
D=M // 1718
@SP // 1719
AM=M-1 // 1720
D=M-D // 1721
@DO_GT // 1722
0;JMP // 1723
(Math.sqrt.GT.20)
@SP // 1724
AM=M+1 // 1725
A=A-1 // 1726
M=D // 1727
@SP // 1728
A=M-1 // 1729
M=!D // 1730
@Math.sqrt.GT.21 // 1731
D=A // 1732
@SP // 1733
AM=M+1 // 1734
A=A-1 // 1735
M=D // 1736
@LCL // 1737
A=M+1 // 1738
A=A+1 // 1739
A=A+1 // 1740
D=M // 1741
@DO_GT // 1742
0;JMP // 1743
(Math.sqrt.GT.21)
@SP // 1744
AM=M-1 // 1745
D=D&M // 1746
D=!D // 1747
@Math.sqrt.IfElseEND1 // 1748
D;JNE // 1749

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1750
A=M+1 // 1751
A=A+1 // 1752
D=M // 1753
@LCL // 1754
A=M // 1755
M=D // 1756

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

@LCL // 1757
A=M+1 // 1758
M=M-1 // 1759

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1760
0;JMP // 1761

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1762
A=M // 1763
D=M // 1764
@SP // 1765
AM=M+1 // 1766
A=A-1 // 1767
M=D // 1768
@RETURN // 1769
0;JMP // 1770

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
@Math.max.GT.22 // 1771
D=A // 1772
@SP // 1773
AM=M+1 // 1774
A=A-1 // 1775
M=D // 1776
@ARG // 1777
A=M+1 // 1778
D=M // 1779
A=A-1 // 1780
D=M-D // 1781
@DO_GT // 1782
0;JMP // 1783
(Math.max.GT.22)
D=!D // 1784
@Math.max.IfElseEND1 // 1785
D;JNE // 1786

////PushInstruction("argument 0")
@ARG // 1787
A=M // 1788
D=M // 1789
@SP // 1790
AM=M+1 // 1791
A=A-1 // 1792
M=D // 1793
@RETURN // 1794
0;JMP // 1795

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1796
A=M+1 // 1797
D=M // 1798
@SP // 1799
AM=M+1 // 1800
A=A-1 // 1801
M=D // 1802
@RETURN // 1803
0;JMP // 1804

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
@Math.min.LT.23 // 1805
D=A // 1806
@SP // 1807
AM=M+1 // 1808
A=A-1 // 1809
M=D // 1810
@ARG // 1811
A=M+1 // 1812
D=M // 1813
A=A-1 // 1814
D=M-D // 1815
@DO_LT // 1816
0;JMP // 1817
(Math.min.LT.23)
D=!D // 1818
@Math.min.IfElseEND1 // 1819
D;JNE // 1820

////PushInstruction("argument 0")
@ARG // 1821
A=M // 1822
D=M // 1823
@SP // 1824
AM=M+1 // 1825
A=A-1 // 1826
M=D // 1827
@RETURN // 1828
0;JMP // 1829

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1830
A=M+1 // 1831
D=M // 1832
@SP // 1833
AM=M+1 // 1834
A=A-1 // 1835
M=D // 1836
@RETURN // 1837
0;JMP // 1838

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1839
A=M // 1840
D=M // 1841
@SP // 1842
AM=M+1 // 1843
A=A-1 // 1844
M=D // 1845
@ARG // 1846
A=M // 1847
D=M // 1848
@SP // 1849
AM=M+1 // 1850
A=A-1 // 1851
M=D // 1852
@SP // 1853
A=M-1 // 1854
M=-D // 1855
// call Math.max
@7 // 1856
D=A // 1857
@14 // 1858
M=D // 1859
@Math.max // 1860
D=A // 1861
@13 // 1862
M=D // 1863
@Math.abs.ret.0 // 1864
D=A // 1865
@CALL // 1866
0;JMP // 1867
(Math.abs.ret.0)
@RETURN // 1868
0;JMP // 1869

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1870
M=M+1 // 1871
AM=M+1 // 1872
A=A-1 // 1873
M=0 // 1874
A=A-1 // 1875
M=0 // 1876

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

@2055 // 1877
D=A // 1878
@LCL // 1879
A=M // 1880
M=D // 1881

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
@LCL // 1882
A=M // 1883
D=M // 1884
@SP // 1885
AM=M+1 // 1886
A=A-1 // 1887
M=D // 1888
@LCL // 1889
A=M // 1890
D=M // 1891
@16384 // 1892
D=A-D // 1893
@5 // 1894
D=D-A // 1895
@SP // 1896
AM=M-1 // 1897
A=M // 1898
M=D // 1899

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1900
A=M // 1901
D=M // 1902
@SP // 1903
AM=M+1 // 1904
A=A-1 // 1905
M=D+1 // 1906
D=1 // 1907
@SP // 1908
AM=M-1 // 1909
A=M // 1910
M=D // 1911

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1912
A=M // 1913
D=M // 1914
@2 // 1915
D=D+A // 1916
@SP // 1917
AM=M+1 // 1918
A=A-1 // 1919
M=D // 1920
D=0 // 1921
@SP // 1922
AM=M-1 // 1923
A=M // 1924
M=D // 1925

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1926
A=M // 1927
D=M // 1928
@3 // 1929
D=D+A // 1930
@SP // 1931
AM=M+1 // 1932
A=A-1 // 1933
M=D // 1934
D=0 // 1935
@SP // 1936
AM=M-1 // 1937
A=M // 1938
M=D // 1939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1940
A=M // 1941
D=M // 1942
@SP // 1943
AM=M+1 // 1944
A=A-1 // 1945
M=D // 1946
// call Memory.create_foot
@6 // 1947
D=A // 1948
@14 // 1949
M=D // 1950
@Memory.create_foot // 1951
D=A // 1952
@13 // 1953
M=D // 1954
@Memory.init.ret.0 // 1955
D=A // 1956
@CALL // 1957
0;JMP // 1958
(Memory.init.ret.0)
@SP // 1959
M=M-1 // 1960

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

@2054 // 1961
D=A // 1962
@SP // 1963
AM=M+1 // 1964
A=A-1 // 1965
M=D // 1966
@2054 // 1967
D=A // 1968
@SP // 1969
AM=M+1 // 1970
A=A-1 // 1971
M=D // 1972
@LCL // 1973
A=M // 1974
D=M // 1975
@SP // 1976
AM=M+1 // 1977
A=A-1 // 1978
M=D // 1979
// call Memory.add_node
@7 // 1980
D=A // 1981
@14 // 1982
M=D // 1983
@Memory.add_node // 1984
D=A // 1985
@13 // 1986
M=D // 1987
@Memory.init.ret.1 // 1988
D=A // 1989
@CALL // 1990
0;JMP // 1991
(Memory.init.ret.1)
@SP // 1992
M=M-1 // 1993

////PushInstruction("constant 0")
@SP // 1994
AM=M+1 // 1995
A=A-1 // 1996
M=0 // 1997
@RETURN // 1998
0;JMP // 1999

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2000
D=A // 2001
@SP // 2002
AM=D+M // 2003
A=A-1 // 2004
M=0 // 2005
A=A-1 // 2006
M=0 // 2007
A=A-1 // 2008
M=0 // 2009
A=A-1 // 2010
M=0 // 2011
A=A-1 // 2012
M=0 // 2013

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2014
A=M // 2015
D=M // 2016
@SP // 2017
AM=M+1 // 2018
A=A-1 // 2019
M=D // 2020
// call Memory.getBinIndex
@6 // 2021
D=A // 2022
@14 // 2023
M=D // 2024
@Memory.getBinIndex // 2025
D=A // 2026
@13 // 2027
M=D // 2028
@Memory.alloc.ret.0 // 2029
D=A // 2030
@CALL // 2031
0;JMP // 2032
(Memory.alloc.ret.0)
@SP // 2033
AM=M-1 // 2034
D=M // 2035
@LCL // 2036
A=M // 2037
M=D // 2038

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

@LCL // 2039
A=M // 2040
D=M // 2041
@2048 // 2042
D=D+A // 2043
@LCL // 2044
A=M+1 // 2045
M=D // 2046

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2047
A=M+1 // 2048
D=M // 2049
@SP // 2050
AM=M+1 // 2051
A=A-1 // 2052
M=D // 2053
@ARG // 2054
A=M // 2055
D=M // 2056
@SP // 2057
AM=M+1 // 2058
A=A-1 // 2059
M=D // 2060
// call Memory.get_best_fit
@7 // 2061
D=A // 2062
@14 // 2063
M=D // 2064
@Memory.get_best_fit // 2065
D=A // 2066
@13 // 2067
M=D // 2068
@Memory.alloc.ret.1 // 2069
D=A // 2070
@CALL // 2071
0;JMP // 2072
(Memory.alloc.ret.1)
@SP // 2073
AM=M-1 // 2074
D=M // 2075
@LCL // 2076
A=M+1 // 2077
A=A+1 // 2078
M=D // 2079

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
@Memory.alloc.EQ.0 // 2080
D=A // 2081
@SP // 2082
AM=M+1 // 2083
A=A-1 // 2084
M=D // 2085
@LCL // 2086
A=M+1 // 2087
A=A+1 // 2088
D=M // 2089
@DO_EQ // 2090
0;JMP // 2091
(Memory.alloc.EQ.0)
D=!D // 2092
@WHILE_END_Memory.alloc1 // 2093
D;JNE // 2094

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
@Memory.alloc.LT.1 // 2095
D=A // 2096
@SP // 2097
AM=M+1 // 2098
A=A-1 // 2099
M=D // 2100
@LCL // 2101
A=M // 2102
D=M // 2103
D=D+1 // 2104
@7 // 2105
D=D-A // 2106
@DO_LT // 2107
0;JMP // 2108
(Memory.alloc.LT.1)
@Memory.alloc.IfElseEND1 // 2109
D;JNE // 2110

////PushInstruction("constant 0")
@SP // 2111
AM=M+1 // 2112
A=A-1 // 2113
M=0 // 2114
@RETURN // 2115
0;JMP // 2116

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

@LCL // 2117
A=M // 2118
M=M+1 // 2119

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

@LCL // 2120
A=M // 2121
D=M // 2122
@2048 // 2123
D=D+A // 2124
@LCL // 2125
A=M+1 // 2126
M=D // 2127

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2128
A=M+1 // 2129
D=M // 2130
@SP // 2131
AM=M+1 // 2132
A=A-1 // 2133
M=D // 2134
@ARG // 2135
A=M // 2136
D=M // 2137
@SP // 2138
AM=M+1 // 2139
A=A-1 // 2140
M=D // 2141
// call Memory.get_best_fit
@7 // 2142
D=A // 2143
@14 // 2144
M=D // 2145
@Memory.get_best_fit // 2146
D=A // 2147
@13 // 2148
M=D // 2149
@Memory.alloc.ret.2 // 2150
D=A // 2151
@CALL // 2152
0;JMP // 2153
(Memory.alloc.ret.2)
@SP // 2154
AM=M-1 // 2155
D=M // 2156
@LCL // 2157
A=M+1 // 2158
A=A+1 // 2159
M=D // 2160

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2161
0;JMP // 2162

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

@LCL // 2163
A=M+1 // 2164
A=A+1 // 2165
D=M // 2166
@0 // 2167
A=D+A // 2168
D=M // 2169
@SP // 2170
AM=M+1 // 2171
A=A-1 // 2172
M=D // 2173
// call Memory.getBinIndex
@6 // 2174
D=A // 2175
@14 // 2176
M=D // 2177
@Memory.getBinIndex // 2178
D=A // 2179
@13 // 2180
M=D // 2181
@Memory.alloc.ret.3 // 2182
D=A // 2183
@CALL // 2184
0;JMP // 2185
(Memory.alloc.ret.3)
@SP // 2186
AM=M-1 // 2187
D=M // 2188
@2048 // 2189
D=D+A // 2190
@SP // 2191
AM=M+1 // 2192
A=A-1 // 2193
M=D // 2194
@LCL // 2195
A=M+1 // 2196
A=A+1 // 2197
D=M // 2198
@SP // 2199
AM=M+1 // 2200
A=A-1 // 2201
M=D // 2202
// call Memory.remove_node
@7 // 2203
D=A // 2204
@14 // 2205
M=D // 2206
@Memory.remove_node // 2207
D=A // 2208
@13 // 2209
M=D // 2210
@Memory.alloc.ret.4 // 2211
D=A // 2212
@CALL // 2213
0;JMP // 2214
(Memory.alloc.ret.4)
@SP // 2215
M=M-1 // 2216

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

@LCL // 2217
A=M+1 // 2218
A=A+1 // 2219
D=M // 2220
@0 // 2221
A=D+A // 2222
D=M // 2223
@SP // 2224
AM=M+1 // 2225
A=A-1 // 2226
M=D // 2227
@ARG // 2228
A=M // 2229
D=M // 2230
@SP // 2231
AM=M-1 // 2232
D=M-D // 2233
@LCL // 2234
A=M+1 // 2235
A=A+1 // 2236
A=A+1 // 2237
M=D // 2238

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 5"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.alloc.IfElse2}}
@Memory.alloc.GT.2 // 2239
D=A // 2240
@SP // 2241
AM=M+1 // 2242
A=A-1 // 2243
M=D // 2244
@LCL // 2245
A=M+1 // 2246
A=A+1 // 2247
A=A+1 // 2248
D=M // 2249
@5 // 2250
D=D-A // 2251
@DO_GT // 2252
0;JMP // 2253
(Memory.alloc.GT.2)
D=!D // 2254
@Memory.alloc.IfElse2 // 2255
D;JNE // 2256

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2257
A=M+1 // 2258
A=A+1 // 2259
D=M // 2260
@SP // 2261
AM=M+1 // 2262
A=A-1 // 2263
M=D // 2264
@ARG // 2265
A=M // 2266
D=M // 2267
@SP // 2268
AM=M-1 // 2269
A=M // 2270
M=D // 2271

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2272
A=M+1 // 2273
A=A+1 // 2274
D=M // 2275
@SP // 2276
AM=M+1 // 2277
A=A-1 // 2278
M=D+1 // 2279
D=0 // 2280
@SP // 2281
AM=M-1 // 2282
A=M // 2283
M=D // 2284

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2285
A=M+1 // 2286
A=A+1 // 2287
D=M // 2288
@SP // 2289
AM=M+1 // 2290
A=A-1 // 2291
M=D // 2292
// call Memory.create_foot
@6 // 2293
D=A // 2294
@14 // 2295
M=D // 2296
@Memory.create_foot // 2297
D=A // 2298
@13 // 2299
M=D // 2300
@Memory.alloc.ret.5 // 2301
D=A // 2302
@CALL // 2303
0;JMP // 2304
(Memory.alloc.ret.5)
@SP // 2305
M=M-1 // 2306

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

@LCL // 2307
A=M+1 // 2308
A=A+1 // 2309
D=M // 2310
@SP // 2311
AM=M+1 // 2312
A=A-1 // 2313
M=D // 2314
@ARG // 2315
A=M // 2316
D=M // 2317
@SP // 2318
AM=M-1 // 2319
D=D+M // 2320
@5 // 2321
D=D+A // 2322
@SP // 2323
AM=M+1 // 2324
A=A-1 // 2325
M=D // 2326
@LCL // 2327
D=M // 2328
@4 // 2329
A=D+A // 2330
D=A // 2331
@R13 // 2332
M=D // 2333
@SP // 2334
AM=M-1 // 2335
D=M // 2336
@R13 // 2337
A=M // 2338
M=D // 2339

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
@LCL // 2340
D=M // 2341
@4 // 2342
A=D+A // 2343
D=M // 2344
@SP // 2345
AM=M+1 // 2346
A=A-1 // 2347
M=D // 2348
@LCL // 2349
A=M+1 // 2350
A=A+1 // 2351
A=A+1 // 2352
D=M // 2353
@5 // 2354
D=D-A // 2355
@SP // 2356
AM=M-1 // 2357
A=M // 2358
M=D // 2359

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
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
M=D+1 // 2368
D=1 // 2369
@SP // 2370
AM=M-1 // 2371
A=M // 2372
M=D // 2373

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2374
D=M // 2375
@4 // 2376
A=D+A // 2377
D=M // 2378
@SP // 2379
AM=M+1 // 2380
A=A-1 // 2381
M=D // 2382
// call Memory.create_foot
@6 // 2383
D=A // 2384
@14 // 2385
M=D // 2386
@Memory.create_foot // 2387
D=A // 2388
@13 // 2389
M=D // 2390
@Memory.alloc.ret.6 // 2391
D=A // 2392
@CALL // 2393
0;JMP // 2394
(Memory.alloc.ret.6)
@SP // 2395
M=M-1 // 2396

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

@LCL // 2397
A=M+1 // 2398
A=A+1 // 2399
A=A+1 // 2400
D=M // 2401
@SP // 2402
AM=M+1 // 2403
A=A-1 // 2404
M=D // 2405
// call Memory.getBinIndex
@6 // 2406
D=A // 2407
@14 // 2408
M=D // 2409
@Memory.getBinIndex // 2410
D=A // 2411
@13 // 2412
M=D // 2413
@Memory.alloc.ret.7 // 2414
D=A // 2415
@CALL // 2416
0;JMP // 2417
(Memory.alloc.ret.7)
@SP // 2418
AM=M-1 // 2419
D=M // 2420
@2048 // 2421
D=D+A // 2422
@SP // 2423
AM=M+1 // 2424
A=A-1 // 2425
M=D // 2426
@LCL // 2427
D=M // 2428
@4 // 2429
A=D+A // 2430
D=M // 2431
@SP // 2432
AM=M+1 // 2433
A=A-1 // 2434
M=D // 2435
// call Memory.add_node
@7 // 2436
D=A // 2437
@14 // 2438
M=D // 2439
@Memory.add_node // 2440
D=A // 2441
@13 // 2442
M=D // 2443
@Memory.alloc.ret.8 // 2444
D=A // 2445
@CALL // 2446
0;JMP // 2447
(Memory.alloc.ret.8)
@SP // 2448
M=M-1 // 2449

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2450
0;JMP // 2451

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
@LCL // 2452
A=M+1 // 2453
A=A+1 // 2454
D=M // 2455
@SP // 2456
AM=M+1 // 2457
A=A-1 // 2458
M=D+1 // 2459
D=0 // 2460
@SP // 2461
AM=M-1 // 2462
A=M // 2463
M=D // 2464

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2465
A=M+1 // 2466
A=A+1 // 2467
D=M // 2468
@SP // 2469
AM=M+1 // 2470
A=A-1 // 2471
M=D // 2472
// call Memory.create_foot
@6 // 2473
D=A // 2474
@14 // 2475
M=D // 2476
@Memory.create_foot // 2477
D=A // 2478
@13 // 2479
M=D // 2480
@Memory.alloc.ret.9 // 2481
D=A // 2482
@CALL // 2483
0;JMP // 2484
(Memory.alloc.ret.9)
@SP // 2485
M=M-1 // 2486

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
@LCL // 2487
A=M+1 // 2488
A=A+1 // 2489
D=M // 2490
@4 // 2491
D=D+A // 2492
@SP // 2493
AM=M+1 // 2494
A=A-1 // 2495
M=D // 2496
@RETURN // 2497
0;JMP // 2498

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2499
AM=M+1 // 2500
A=A-1 // 2501
M=0 // 2502

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2503
A=M // 2504
D=M // 2505
@SP // 2506
AM=M+1 // 2507
A=A-1 // 2508
M=D // 2509
// call Memory.alloc
@6 // 2510
D=A // 2511
@14 // 2512
M=D // 2513
@Memory.alloc // 2514
D=A // 2515
@13 // 2516
M=D // 2517
@Memory.calloc.ret.0 // 2518
D=A // 2519
@CALL // 2520
0;JMP // 2521
(Memory.calloc.ret.0)
@SP // 2522
AM=M-1 // 2523
D=M // 2524
@LCL // 2525
A=M // 2526
M=D // 2527

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElseEND1}}
@LCL // 2528
A=M // 2529
D=M // 2530
@Memory.calloc.IfElseEND1 // 2531
D;JNE // 2532

////PushInstruction("constant 0")
@SP // 2533
AM=M+1 // 2534
A=A-1 // 2535
M=0 // 2536
@RETURN // 2537
0;JMP // 2538

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
@Memory.calloc.GT.3 // 2539
D=A // 2540
@SP // 2541
AM=M+1 // 2542
A=A-1 // 2543
M=D // 2544
@ARG // 2545
A=M // 2546
D=M // 2547
@DO_GT // 2548
0;JMP // 2549
(Memory.calloc.GT.3)
D=!D // 2550
@WHILE_END_Memory.calloc1 // 2551
D;JNE // 2552

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

@ARG // 2553
A=M // 2554
M=M-1 // 2555

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2556
A=M // 2557
D=M // 2558
@SP // 2559
AM=M+1 // 2560
A=A-1 // 2561
M=D // 2562
@ARG // 2563
A=M // 2564
D=M // 2565
@SP // 2566
AM=M-1 // 2567
D=D+M // 2568
@SP // 2569
AM=M+1 // 2570
A=A-1 // 2571
M=D // 2572
D=0 // 2573
@SP // 2574
AM=M-1 // 2575
A=M // 2576
M=D // 2577

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2578
0;JMP // 2579

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2580
A=M // 2581
D=M // 2582
@SP // 2583
AM=M+1 // 2584
A=A-1 // 2585
M=D // 2586
@RETURN // 2587
0;JMP // 2588

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2589
D=A // 2590
@SP // 2591
AM=D+M // 2592
A=A-1 // 2593
M=0 // 2594
A=A-1 // 2595
M=0 // 2596
A=A-1 // 2597
M=0 // 2598

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

@ARG // 2599
A=M // 2600
D=M // 2601
@4 // 2602
D=D-A // 2603
@LCL // 2604
A=M // 2605
M=D // 2606

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2607
A=M // 2608
D=M // 2609
@SP // 2610
AM=M+1 // 2611
A=A-1 // 2612
M=D+1 // 2613
D=1 // 2614
@SP // 2615
AM=M-1 // 2616
A=M // 2617
M=D // 2618

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

@LCL // 2619
A=M // 2620
D=M // 2621
@2 // 2622
A=D+A // 2623
D=M // 2624
@LCL // 2625
A=M+1 // 2626
M=D // 2627

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

@LCL // 2628
A=M // 2629
D=M // 2630
@3 // 2631
A=D+A // 2632
D=M // 2633
@LCL // 2634
A=M+1 // 2635
A=A+1 // 2636
M=D // 2637

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc.IfElseEND1}}
@Memory.deAlloc.EQ.4 // 2638
D=A // 2639
@SP // 2640
AM=M+1 // 2641
A=A-1 // 2642
M=D // 2643
@LCL // 2644
A=M+1 // 2645
D=M // 2646
@DO_EQ // 2647
0;JMP // 2648
(Memory.deAlloc.EQ.4)
@Memory.deAlloc.IfElseEND1 // 2649
D;JNE // 2650

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
@Memory.deAlloc.EQ.5 // 2651
D=A // 2652
@SP // 2653
AM=M+1 // 2654
A=A-1 // 2655
M=D // 2656
@LCL // 2657
A=M+1 // 2658
D=M // 2659
A=D+1 // 2660
D=M // 2661
D=D-1 // 2662
@DO_EQ // 2663
0;JMP // 2664
(Memory.deAlloc.EQ.5)
D=!D // 2665
@Memory.deAlloc.IfElseEND2 // 2666
D;JNE // 2667

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

@LCL // 2668
A=M+1 // 2669
D=M // 2670
@0 // 2671
A=D+A // 2672
D=M // 2673
@SP // 2674
AM=M+1 // 2675
A=A-1 // 2676
M=D // 2677
// call Memory.getBinIndex
@6 // 2678
D=A // 2679
@14 // 2680
M=D // 2681
@Memory.getBinIndex // 2682
D=A // 2683
@13 // 2684
M=D // 2685
@Memory.deAlloc.ret.0 // 2686
D=A // 2687
@CALL // 2688
0;JMP // 2689
(Memory.deAlloc.ret.0)
@SP // 2690
AM=M-1 // 2691
D=M // 2692
@2048 // 2693
D=D+A // 2694
@SP // 2695
AM=M+1 // 2696
A=A-1 // 2697
M=D // 2698
@LCL // 2699
A=M+1 // 2700
D=M // 2701
@SP // 2702
AM=M+1 // 2703
A=A-1 // 2704
M=D // 2705
// call Memory.remove_node
@7 // 2706
D=A // 2707
@14 // 2708
M=D // 2709
@Memory.remove_node // 2710
D=A // 2711
@13 // 2712
M=D // 2713
@Memory.deAlloc.ret.1 // 2714
D=A // 2715
@CALL // 2716
0;JMP // 2717
(Memory.deAlloc.ret.1)
@SP // 2718
M=M-1 // 2719

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
@LCL // 2720
A=M+1 // 2721
D=M // 2722
@SP // 2723
AM=M+1 // 2724
A=A-1 // 2725
M=D // 2726
@LCL // 2727
A=M+1 // 2728
D=M // 2729
@0 // 2730
A=D+A // 2731
D=M // 2732
@SP // 2733
AM=M+1 // 2734
A=A-1 // 2735
M=D // 2736
@LCL // 2737
A=M // 2738
D=M // 2739
@0 // 2740
A=D+A // 2741
D=M // 2742
@SP // 2743
AM=M-1 // 2744
D=D+M // 2745
@5 // 2746
D=D+A // 2747
@SP // 2748
AM=M-1 // 2749
A=M // 2750
M=D // 2751

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2752
A=M+1 // 2753
D=M // 2754
@SP // 2755
AM=M+1 // 2756
A=A-1 // 2757
M=D // 2758
// call Memory.create_foot
@6 // 2759
D=A // 2760
@14 // 2761
M=D // 2762
@Memory.create_foot // 2763
D=A // 2764
@13 // 2765
M=D // 2766
@Memory.deAlloc.ret.2 // 2767
D=A // 2768
@CALL // 2769
0;JMP // 2770
(Memory.deAlloc.ret.2)
@SP // 2771
M=M-1 // 2772

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2773
A=M+1 // 2774
D=M // 2775
@LCL // 2776
A=M // 2777
M=D // 2778

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
@Memory.deAlloc.EQ.6 // 2779
D=A // 2780
@SP // 2781
AM=M+1 // 2782
A=A-1 // 2783
M=D // 2784
@LCL // 2785
A=M+1 // 2786
A=A+1 // 2787
D=M // 2788
@DO_EQ // 2789
0;JMP // 2790
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElseEND3 // 2791
D;JNE // 2792

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
@Memory.deAlloc.EQ.7 // 2793
D=A // 2794
@SP // 2795
AM=M+1 // 2796
A=A-1 // 2797
M=D // 2798
@LCL // 2799
A=M+1 // 2800
A=A+1 // 2801
D=M // 2802
A=D+1 // 2803
D=M // 2804
D=D-1 // 2805
@DO_EQ // 2806
0;JMP // 2807
(Memory.deAlloc.EQ.7)
D=!D // 2808
@Memory.deAlloc.IfElseEND4 // 2809
D;JNE // 2810

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

@LCL // 2811
A=M+1 // 2812
A=A+1 // 2813
D=M // 2814
@0 // 2815
A=D+A // 2816
D=M // 2817
@SP // 2818
AM=M+1 // 2819
A=A-1 // 2820
M=D // 2821
// call Memory.getBinIndex
@6 // 2822
D=A // 2823
@14 // 2824
M=D // 2825
@Memory.getBinIndex // 2826
D=A // 2827
@13 // 2828
M=D // 2829
@Memory.deAlloc.ret.3 // 2830
D=A // 2831
@CALL // 2832
0;JMP // 2833
(Memory.deAlloc.ret.3)
@SP // 2834
AM=M-1 // 2835
D=M // 2836
@2048 // 2837
D=D+A // 2838
@SP // 2839
AM=M+1 // 2840
A=A-1 // 2841
M=D // 2842
@LCL // 2843
A=M+1 // 2844
A=A+1 // 2845
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
@Memory.deAlloc.ret.4 // 2859
D=A // 2860
@CALL // 2861
0;JMP // 2862
(Memory.deAlloc.ret.4)
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
@LCL // 2865
A=M // 2866
D=M // 2867
@SP // 2868
AM=M+1 // 2869
A=A-1 // 2870
M=D // 2871
@LCL // 2872
A=M // 2873
D=M // 2874
@0 // 2875
A=D+A // 2876
D=M // 2877
@SP // 2878
AM=M+1 // 2879
A=A-1 // 2880
M=D // 2881
@LCL // 2882
A=M+1 // 2883
A=A+1 // 2884
D=M // 2885
@0 // 2886
A=D+A // 2887
D=M // 2888
@SP // 2889
AM=M-1 // 2890
D=D+M // 2891
@5 // 2892
D=D+A // 2893
@SP // 2894
AM=M-1 // 2895
A=M // 2896
M=D // 2897

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2898
A=M // 2899
D=M // 2900
@SP // 2901
AM=M+1 // 2902
A=A-1 // 2903
M=D // 2904
// call Memory.create_foot
@6 // 2905
D=A // 2906
@14 // 2907
M=D // 2908
@Memory.create_foot // 2909
D=A // 2910
@13 // 2911
M=D // 2912
@Memory.deAlloc.ret.5 // 2913
D=A // 2914
@CALL // 2915
0;JMP // 2916
(Memory.deAlloc.ret.5)
@SP // 2917
M=M-1 // 2918

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

@LCL // 2919
A=M // 2920
D=M // 2921
@0 // 2922
A=D+A // 2923
D=M // 2924
@SP // 2925
AM=M+1 // 2926
A=A-1 // 2927
M=D // 2928
// call Memory.getBinIndex
@6 // 2929
D=A // 2930
@14 // 2931
M=D // 2932
@Memory.getBinIndex // 2933
D=A // 2934
@13 // 2935
M=D // 2936
@Memory.deAlloc.ret.6 // 2937
D=A // 2938
@CALL // 2939
0;JMP // 2940
(Memory.deAlloc.ret.6)
@SP // 2941
AM=M-1 // 2942
D=M // 2943
@2048 // 2944
D=D+A // 2945
@SP // 2946
AM=M+1 // 2947
A=A-1 // 2948
M=D // 2949
@LCL // 2950
A=M // 2951
D=M // 2952
@SP // 2953
AM=M+1 // 2954
A=A-1 // 2955
M=D // 2956
// call Memory.add_node
@7 // 2957
D=A // 2958
@14 // 2959
M=D // 2960
@Memory.add_node // 2961
D=A // 2962
@13 // 2963
M=D // 2964
@Memory.deAlloc.ret.7 // 2965
D=A // 2966
@CALL // 2967
0;JMP // 2968
(Memory.deAlloc.ret.7)
@SP // 2969
M=M-1 // 2970

////PushInstruction("constant 0")
@SP // 2971
AM=M+1 // 2972
A=A-1 // 2973
M=0 // 2974
@RETURN // 2975
0;JMP // 2976

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 2977
D=A // 2978
@SP // 2979
AM=D+M // 2980
A=A-1 // 2981
M=0 // 2982
A=A-1 // 2983
M=0 // 2984
A=A-1 // 2985
M=0 // 2986
A=A-1 // 2987
M=0 // 2988

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElseEND1}}
@Memory.realloc.EQ.8 // 2989
D=A // 2990
@SP // 2991
AM=M+1 // 2992
A=A-1 // 2993
M=D // 2994
@ARG // 2995
A=M // 2996
D=M // 2997
@DO_EQ // 2998
0;JMP // 2999
(Memory.realloc.EQ.8)
D=!D // 3000
@Memory.realloc.IfElseEND1 // 3001
D;JNE // 3002

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3003
A=M+1 // 3004
D=M // 3005
@SP // 3006
AM=M+1 // 3007
A=A-1 // 3008
M=D // 3009
// call Memory.alloc
@6 // 3010
D=A // 3011
@14 // 3012
M=D // 3013
@Memory.alloc // 3014
D=A // 3015
@13 // 3016
M=D // 3017
@Memory.realloc.ret.0 // 3018
D=A // 3019
@CALL // 3020
0;JMP // 3021
(Memory.realloc.ret.0)
@RETURN // 3022
0;JMP // 3023

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

@ARG // 3024
A=M // 3025
D=M // 3026
D=D-1 // 3027
@LCL // 3028
A=M+1 // 3029
A=A+1 // 3030
A=A+1 // 3031
M=D // 3032

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

@LCL // 3033
A=M+1 // 3034
A=A+1 // 3035
A=A+1 // 3036
D=M // 3037
@0 // 3038
A=D+A // 3039
D=M // 3040
@LCL // 3041
A=M // 3042
M=D // 3043

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3044
A=M+1 // 3045
D=M // 3046
@SP // 3047
AM=M+1 // 3048
A=A-1 // 3049
M=D // 3050
// call Memory.alloc
@6 // 3051
D=A // 3052
@14 // 3053
M=D // 3054
@Memory.alloc // 3055
D=A // 3056
@13 // 3057
M=D // 3058
@Memory.realloc.ret.1 // 3059
D=A // 3060
@CALL // 3061
0;JMP // 3062
(Memory.realloc.ret.1)
@SP // 3063
AM=M-1 // 3064
D=M // 3065
@LCL // 3066
A=M+1 // 3067
M=D // 3068

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.realloc.IfElseEND2}}
@Memory.realloc.EQ.9 // 3069
D=A // 3070
@SP // 3071
AM=M+1 // 3072
A=A-1 // 3073
M=D // 3074
@LCL // 3075
A=M+1 // 3076
D=M // 3077
@DO_EQ // 3078
0;JMP // 3079
(Memory.realloc.EQ.9)
D=!D // 3080
@Memory.realloc.IfElseEND2 // 3081
D;JNE // 3082

////PushInstruction("constant 0")
@SP // 3083
AM=M+1 // 3084
A=A-1 // 3085
M=0 // 3086
@RETURN // 3087
0;JMP // 3088

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
@Memory.realloc.GT.10 // 3089
D=A // 3090
@SP // 3091
AM=M+1 // 3092
A=A-1 // 3093
M=D // 3094
@LCL // 3095
A=M // 3096
D=M // 3097
@SP // 3098
AM=M+1 // 3099
A=A-1 // 3100
M=D // 3101
@ARG // 3102
A=M+1 // 3103
D=M // 3104
@SP // 3105
AM=M-1 // 3106
D=M-D // 3107
@DO_GT // 3108
0;JMP // 3109
(Memory.realloc.GT.10)
@Memory.realloc.IfElse3 // 3110
D;JNE // 3111

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3112
A=M // 3113
D=M // 3114
@LCL // 3115
A=M+1 // 3116
A=A+1 // 3117
M=D // 3118

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3119
0;JMP // 3120

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3121
A=M+1 // 3122
D=M // 3123
@LCL // 3124
A=M+1 // 3125
A=A+1 // 3126
M=D // 3127

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3128
A=M // 3129
D=M // 3130
@SP // 3131
AM=M+1 // 3132
A=A-1 // 3133
M=D // 3134
@LCL // 3135
A=M+1 // 3136
D=M // 3137
@SP // 3138
AM=M+1 // 3139
A=A-1 // 3140
M=D // 3141
@LCL // 3142
A=M+1 // 3143
A=A+1 // 3144
D=M // 3145
@SP // 3146
AM=M+1 // 3147
A=A-1 // 3148
M=D // 3149
// call Memory.copy
@8 // 3150
D=A // 3151
@14 // 3152
M=D // 3153
@Memory.copy // 3154
D=A // 3155
@13 // 3156
M=D // 3157
@Memory.realloc.ret.2 // 3158
D=A // 3159
@CALL // 3160
0;JMP // 3161
(Memory.realloc.ret.2)
@SP // 3162
M=M-1 // 3163

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3164
A=M // 3165
D=M // 3166
@SP // 3167
AM=M+1 // 3168
A=A-1 // 3169
M=D // 3170
// call Memory.deAlloc
@6 // 3171
D=A // 3172
@14 // 3173
M=D // 3174
@Memory.deAlloc // 3175
D=A // 3176
@13 // 3177
M=D // 3178
@Memory.realloc.ret.3 // 3179
D=A // 3180
@CALL // 3181
0;JMP // 3182
(Memory.realloc.ret.3)
@SP // 3183
M=M-1 // 3184

////PushInstruction("local 1")
@LCL // 3185
A=M+1 // 3186
D=M // 3187
@SP // 3188
AM=M+1 // 3189
A=A-1 // 3190
M=D // 3191
@RETURN // 3192
0;JMP // 3193

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3194
AM=M+1 // 3195
A=A-1 // 3196
M=0 // 3197

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3198
A=M // 3199
M=0 // 3200

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
@Memory.copy.LT.11 // 3201
D=A // 3202
@SP // 3203
AM=M+1 // 3204
A=A-1 // 3205
M=D // 3206
@LCL // 3207
A=M // 3208
D=M // 3209
@SP // 3210
AM=M+1 // 3211
A=A-1 // 3212
M=D // 3213
@ARG // 3214
A=M+1 // 3215
A=A+1 // 3216
D=M // 3217
@SP // 3218
AM=M-1 // 3219
D=M-D // 3220
@DO_LT // 3221
0;JMP // 3222
(Memory.copy.LT.11)
D=!D // 3223
@WHILE_END_Memory.copy1 // 3224
D;JNE // 3225

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
@ARG // 3226
A=M+1 // 3227
D=M // 3228
@SP // 3229
AM=M+1 // 3230
A=A-1 // 3231
M=D // 3232
@LCL // 3233
A=M // 3234
D=M // 3235
@SP // 3236
AM=M-1 // 3237
D=D+M // 3238
@SP // 3239
AM=M+1 // 3240
A=A-1 // 3241
M=D // 3242
@ARG // 3243
A=M // 3244
D=M // 3245
@SP // 3246
AM=M+1 // 3247
A=A-1 // 3248
M=D // 3249
@LCL // 3250
A=M // 3251
D=M // 3252
@SP // 3253
AM=M-1 // 3254
A=D+M // 3255
D=M // 3256
@SP // 3257
AM=M-1 // 3258
A=M // 3259
M=D // 3260

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

@LCL // 3261
A=M // 3262
M=M+1 // 3263

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3264
0;JMP // 3265

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3266
AM=M+1 // 3267
A=A-1 // 3268
M=0 // 3269
@RETURN // 3270
0;JMP // 3271

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
@Memory.remove_node.EQ.12 // 3272
D=A // 3273
@SP // 3274
AM=M+1 // 3275
A=A-1 // 3276
M=D // 3277
@ARG // 3278
A=M+1 // 3279
D=M // 3280
@2 // 3281
A=D+A // 3282
D=M // 3283
@DO_EQ // 3284
0;JMP // 3285
(Memory.remove_node.EQ.12)
@Memory.remove_node.IfElse1 // 3286
D;JNE // 3287

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
@ARG // 3288
A=M+1 // 3289
D=M // 3290
@2 // 3291
D=D+A // 3292
@3 // 3293
D=D+A // 3294
@SP // 3295
AM=M+1 // 3296
A=A-1 // 3297
M=D // 3298
@ARG // 3299
A=M+1 // 3300
D=M // 3301
@3 // 3302
A=D+A // 3303
D=M // 3304
@SP // 3305
AM=M-1 // 3306
A=M // 3307
M=D // 3308

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3309
0;JMP // 3310

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
@ARG // 3311
A=M // 3312
D=M // 3313
@SP // 3314
AM=M+1 // 3315
A=A-1 // 3316
M=D // 3317
@ARG // 3318
A=M+1 // 3319
D=M // 3320
@3 // 3321
A=D+A // 3322
D=M // 3323
@SP // 3324
AM=M-1 // 3325
A=M // 3326
M=D // 3327

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
@Memory.remove_node.EQ.13 // 3328
D=A // 3329
@SP // 3330
AM=M+1 // 3331
A=A-1 // 3332
M=D // 3333
@ARG // 3334
A=M+1 // 3335
D=M // 3336
@3 // 3337
A=D+A // 3338
D=M // 3339
@DO_EQ // 3340
0;JMP // 3341
(Memory.remove_node.EQ.13)
@Memory.remove_node.IfElseEND2 // 3342
D;JNE // 3343

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
@ARG // 3344
A=M+1 // 3345
D=M // 3346
@3 // 3347
D=D+A // 3348
@2 // 3349
D=D+A // 3350
@SP // 3351
AM=M+1 // 3352
A=A-1 // 3353
M=D // 3354
@ARG // 3355
A=M+1 // 3356
D=M // 3357
@2 // 3358
A=D+A // 3359
D=M // 3360
@SP // 3361
AM=M-1 // 3362
A=M // 3363
M=D // 3364

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
@ARG // 3365
A=M+1 // 3366
D=M // 3367
@2 // 3368
D=D+A // 3369
@SP // 3370
AM=M+1 // 3371
A=A-1 // 3372
M=D // 3373
D=0 // 3374
@SP // 3375
AM=M-1 // 3376
A=M // 3377
M=D // 3378

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3379
A=M+1 // 3380
D=M // 3381
@3 // 3382
D=D+A // 3383
@SP // 3384
AM=M+1 // 3385
A=A-1 // 3386
M=D // 3387
D=0 // 3388
@SP // 3389
AM=M-1 // 3390
A=M // 3391
M=D // 3392

////PushInstruction("constant 0")
@SP // 3393
AM=M+1 // 3394
A=A-1 // 3395
M=0 // 3396
@RETURN // 3397
0;JMP // 3398

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3399
AM=M+1 // 3400
A=A-1 // 3401
M=0 // 3402

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3403
A=M // 3404
M=0 // 3405

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
@Memory.getBinIndex.LT.14 // 3406
D=A // 3407
@SP // 3408
AM=M+1 // 3409
A=A-1 // 3410
M=D // 3411
@LCL // 3412
A=M // 3413
D=M // 3414
@7 // 3415
D=D-A // 3416
@DO_LT // 3417
0;JMP // 3418
(Memory.getBinIndex.LT.14)
@SP // 3419
AM=M+1 // 3420
A=A-1 // 3421
M=D // 3422
@Memory.getBinIndex.EQ.15 // 3423
D=A // 3424
@SP // 3425
AM=M+1 // 3426
A=A-1 // 3427
M=D // 3428
@LCL // 3429
A=M // 3430
D=M // 3431
@2048 // 3432
A=D+A // 3433
D=M // 3434
@DO_EQ // 3435
0;JMP // 3436
(Memory.getBinIndex.EQ.15)
D=!D // 3437
@SP // 3438
AM=M-1 // 3439
D=D&M // 3440
D=!D // 3441
@WHILE_END_Memory.getBinIndex1 // 3442
D;JNE // 3443

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
@Memory.getBinIndex.GT.16 // 3444
D=A // 3445
@SP // 3446
AM=M+1 // 3447
A=A-1 // 3448
M=D // 3449
@ARG // 3450
A=M // 3451
D=M // 3452
@SP // 3453
AM=M+1 // 3454
A=A-1 // 3455
M=D // 3456
@LCL // 3457
A=M // 3458
D=M // 3459
@SP // 3460
AM=M+1 // 3461
A=A-1 // 3462
M=D+1 // 3463
@16 // 3464
D=A // 3465
@SP // 3466
AM=M+1 // 3467
A=A-1 // 3468
M=D // 3469
// call Math.multiply
@7 // 3470
D=A // 3471
@14 // 3472
M=D // 3473
@Math.multiply // 3474
D=A // 3475
@13 // 3476
M=D // 3477
@Memory.getBinIndex.ret.0 // 3478
D=A // 3479
@CALL // 3480
0;JMP // 3481
(Memory.getBinIndex.ret.0)
@SP // 3482
AM=M-1 // 3483
D=M // 3484
@SP // 3485
AM=M-1 // 3486
D=M-D // 3487
@DO_GT // 3488
0;JMP // 3489
(Memory.getBinIndex.GT.16)
@Memory.getBinIndex.IfElseEND1 // 3490
D;JNE // 3491

////PushInstruction("local 0")
@LCL // 3492
A=M // 3493
D=M // 3494
@SP // 3495
AM=M+1 // 3496
A=A-1 // 3497
M=D // 3498
@RETURN // 3499
0;JMP // 3500

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

@LCL // 3501
A=M // 3502
M=M+1 // 3503

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3504
0;JMP // 3505

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
@6 // 3506
D=A // 3507
@SP // 3508
AM=M+1 // 3509
A=A-1 // 3510
M=D // 3511
@7 // 3512
D=A // 3513
@SP // 3514
AM=M+1 // 3515
A=A-1 // 3516
M=D-1 // 3517
@RETURN // 3518
0;JMP // 3519

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3520
AM=M+1 // 3521
A=A-1 // 3522
M=0 // 3523

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

@ARG // 3524
A=M // 3525
D=M // 3526
@0 // 3527
A=D+A // 3528
D=M // 3529
@LCL // 3530
A=M // 3531
M=D // 3532

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
@Memory.get_best_fit.LT.17 // 3533
D=A // 3534
@SP // 3535
AM=M+1 // 3536
A=A-1 // 3537
M=D // 3538
@LCL // 3539
A=M // 3540
D=M // 3541
@0 // 3542
A=D+A // 3543
D=M // 3544
@SP // 3545
AM=M+1 // 3546
A=A-1 // 3547
M=D // 3548
@ARG // 3549
A=M+1 // 3550
D=M // 3551
@SP // 3552
AM=M-1 // 3553
D=M-D // 3554
@DO_LT // 3555
0;JMP // 3556
(Memory.get_best_fit.LT.17)
@Memory.get_best_fit.IfElseEND1 // 3557
D;JNE // 3558

////PushInstruction("local 0")
@LCL // 3559
A=M // 3560
D=M // 3561
@SP // 3562
AM=M+1 // 3563
A=A-1 // 3564
M=D // 3565
@RETURN // 3566
0;JMP // 3567

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
@Memory.get_best_fit.EQ.18 // 3568
D=A // 3569
@SP // 3570
AM=M+1 // 3571
A=A-1 // 3572
M=D // 3573
@LCL // 3574
A=M // 3575
D=M // 3576
@3 // 3577
A=D+A // 3578
D=M // 3579
@DO_EQ // 3580
0;JMP // 3581
(Memory.get_best_fit.EQ.18)
@WHILE_END_Memory.get_best_fit1 // 3582
D;JNE // 3583

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

@LCL // 3584
A=M // 3585
D=M // 3586
@3 // 3587
A=D+A // 3588
D=M // 3589
@LCL // 3590
A=M // 3591
M=D // 3592

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
@Memory.get_best_fit.LT.19 // 3593
D=A // 3594
@SP // 3595
AM=M+1 // 3596
A=A-1 // 3597
M=D // 3598
@LCL // 3599
A=M // 3600
D=M // 3601
@0 // 3602
A=D+A // 3603
D=M // 3604
@SP // 3605
AM=M+1 // 3606
A=A-1 // 3607
M=D // 3608
@ARG // 3609
A=M+1 // 3610
D=M // 3611
@SP // 3612
AM=M-1 // 3613
D=M-D // 3614
@DO_LT // 3615
0;JMP // 3616
(Memory.get_best_fit.LT.19)
@Memory.get_best_fit.IfElseEND2 // 3617
D;JNE // 3618

////PushInstruction("local 0")
@LCL // 3619
A=M // 3620
D=M // 3621
@SP // 3622
AM=M+1 // 3623
A=A-1 // 3624
M=D // 3625
@RETURN // 3626
0;JMP // 3627

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3628
0;JMP // 3629

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3630
AM=M+1 // 3631
A=A-1 // 3632
M=0 // 3633
@RETURN // 3634
0;JMP // 3635

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
@ARG // 3636
A=M // 3637
D=M // 3638
@SP // 3639
AM=M+1 // 3640
A=A-1 // 3641
M=D // 3642
@ARG // 3643
A=M // 3644
D=M // 3645
@0 // 3646
A=D+A // 3647
D=M // 3648
@4 // 3649
D=D+A // 3650
@SP // 3651
AM=M-1 // 3652
D=D+M // 3653
@SP // 3654
AM=M+1 // 3655
A=A-1 // 3656
M=D // 3657
@ARG // 3658
A=M // 3659
D=M // 3660
@SP // 3661
AM=M-1 // 3662
A=M // 3663
M=D // 3664

////PushInstruction("constant 0")
@SP // 3665
AM=M+1 // 3666
A=A-1 // 3667
M=0 // 3668
@RETURN // 3669
0;JMP // 3670

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3671
M=M+1 // 3672
AM=M+1 // 3673
A=A-1 // 3674
M=0 // 3675
A=A-1 // 3676
M=0 // 3677

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3678
A=M+1 // 3679
D=M // 3680
@2 // 3681
D=D+A // 3682
@SP // 3683
AM=M+1 // 3684
A=A-1 // 3685
M=D // 3686
D=0 // 3687
@SP // 3688
AM=M-1 // 3689
A=M // 3690
M=D // 3691

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3692
A=M+1 // 3693
D=M // 3694
@3 // 3695
D=D+A // 3696
@SP // 3697
AM=M+1 // 3698
A=A-1 // 3699
M=D // 3700
D=0 // 3701
@SP // 3702
AM=M-1 // 3703
A=M // 3704
M=D // 3705

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
@Memory.add_node.EQ.20 // 3706
D=A // 3707
@SP // 3708
AM=M+1 // 3709
A=A-1 // 3710
M=D // 3711
@ARG // 3712
A=M // 3713
D=M // 3714
@0 // 3715
A=D+A // 3716
D=M // 3717
@DO_EQ // 3718
0;JMP // 3719
(Memory.add_node.EQ.20)
D=!D // 3720
@Memory.add_node.IfElseEND1 // 3721
D;JNE // 3722

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3723
A=M // 3724
D=M // 3725
@SP // 3726
AM=M+1 // 3727
A=A-1 // 3728
M=D // 3729
@ARG // 3730
A=M+1 // 3731
D=M // 3732
@SP // 3733
AM=M-1 // 3734
A=M // 3735
M=D // 3736

////PushInstruction("constant 0")
@SP // 3737
AM=M+1 // 3738
A=A-1 // 3739
M=0 // 3740
@RETURN // 3741
0;JMP // 3742

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

@ARG // 3743
A=M // 3744
D=M // 3745
@0 // 3746
A=D+A // 3747
D=M // 3748
@LCL // 3749
A=M // 3750
M=D // 3751

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3752
A=M+1 // 3753
M=0 // 3754

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
@Memory.add_node.EQ.21 // 3755
D=A // 3756
@SP // 3757
AM=M+1 // 3758
A=A-1 // 3759
M=D // 3760
@LCL // 3761
A=M // 3762
D=M // 3763
@DO_EQ // 3764
0;JMP // 3765
(Memory.add_node.EQ.21)
@SP // 3766
AM=M+1 // 3767
A=A-1 // 3768
M=D // 3769
@SP // 3770
A=M-1 // 3771
M=!D // 3772
@Memory.add_node.GT.22 // 3773
D=A // 3774
@SP // 3775
AM=M+1 // 3776
A=A-1 // 3777
M=D // 3778
@LCL // 3779
A=M // 3780
D=M // 3781
@0 // 3782
A=D+A // 3783
D=M // 3784
@SP // 3785
AM=M+1 // 3786
A=A-1 // 3787
M=D // 3788
@ARG // 3789
A=M+1 // 3790
D=M // 3791
@0 // 3792
A=D+A // 3793
D=M // 3794
@SP // 3795
AM=M-1 // 3796
D=M-D // 3797
@DO_GT // 3798
0;JMP // 3799
(Memory.add_node.GT.22)
D=!D // 3800
@SP // 3801
AM=M-1 // 3802
D=D&M // 3803
D=!D // 3804
@WHILE_END_Memory.add_node1 // 3805
D;JNE // 3806

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3807
A=M // 3808
D=M // 3809
@LCL // 3810
A=M+1 // 3811
M=D // 3812

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

@LCL // 3813
A=M // 3814
D=M // 3815
@3 // 3816
A=D+A // 3817
D=M // 3818
@LCL // 3819
A=M // 3820
M=D // 3821

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 3822
0;JMP // 3823

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse2}}
@LCL // 3824
A=M+1 // 3825
D=M // 3826
@Memory.add_node.IfElse2 // 3827
D;JNE // 3828

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
@ARG // 3829
A=M+1 // 3830
D=M // 3831
@3 // 3832
D=D+A // 3833
@SP // 3834
AM=M+1 // 3835
A=A-1 // 3836
M=D // 3837
@ARG // 3838
A=M // 3839
D=M // 3840
@0 // 3841
A=D+A // 3842
D=M // 3843
@SP // 3844
AM=M-1 // 3845
A=M // 3846
M=D // 3847

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
@ARG // 3848
A=M // 3849
D=M // 3850
@0 // 3851
D=D+A // 3852
@2 // 3853
D=D+A // 3854
@SP // 3855
AM=M+1 // 3856
A=A-1 // 3857
M=D // 3858
@ARG // 3859
A=M+1 // 3860
D=M // 3861
@SP // 3862
AM=M-1 // 3863
A=M // 3864
M=D // 3865

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3866
A=M // 3867
D=M // 3868
@SP // 3869
AM=M+1 // 3870
A=A-1 // 3871
M=D // 3872
@ARG // 3873
A=M+1 // 3874
D=M // 3875
@SP // 3876
AM=M-1 // 3877
A=M // 3878
M=D // 3879

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 3880
0;JMP // 3881

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
@ARG // 3882
A=M+1 // 3883
D=M // 3884
@3 // 3885
D=D+A // 3886
@SP // 3887
AM=M+1 // 3888
A=A-1 // 3889
M=D // 3890
@LCL // 3891
A=M // 3892
D=M // 3893
@SP // 3894
AM=M-1 // 3895
A=M // 3896
M=D // 3897

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3898
A=M+1 // 3899
D=M // 3900
@2 // 3901
D=D+A // 3902
@SP // 3903
AM=M+1 // 3904
A=A-1 // 3905
M=D // 3906
@LCL // 3907
A=M+1 // 3908
D=M // 3909
@SP // 3910
AM=M-1 // 3911
A=M // 3912
M=D // 3913

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 0"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElseEND3}}
@LCL // 3914
A=M // 3915
D=!M // 3916
@Memory.add_node.IfElseEND3 // 3917
D;JNE // 3918

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 3919
A=M // 3920
D=M // 3921
@2 // 3922
D=D+A // 3923
@SP // 3924
AM=M+1 // 3925
A=A-1 // 3926
M=D // 3927
@ARG // 3928
A=M+1 // 3929
D=M // 3930
@SP // 3931
AM=M-1 // 3932
A=M // 3933
M=D // 3934

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
@LCL // 3935
A=M+1 // 3936
D=M // 3937
@3 // 3938
D=D+A // 3939
@SP // 3940
AM=M+1 // 3941
A=A-1 // 3942
M=D // 3943
@ARG // 3944
A=M+1 // 3945
D=M // 3946
@SP // 3947
AM=M-1 // 3948
A=M // 3949
M=D // 3950

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 3951
AM=M+1 // 3952
A=A-1 // 3953
M=0 // 3954
@RETURN // 3955
0;JMP // 3956

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
@ARG // 3957
A=M // 3958
D=M // 3959
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

////PushInstruction("constant 0")
@SP // 3971
AM=M+1 // 3972
A=A-1 // 3973
M=0 // 3974
@RETURN // 3975
0;JMP // 3976

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
@ARG // 3977
A=M // 3978
D=M // 3979
@0 // 3980
A=D+A // 3981
D=M // 3982
@SP // 3983
AM=M+1 // 3984
A=A-1 // 3985
M=D // 3986
@RETURN // 3987
0;JMP // 3988

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={}}
// function Output.init with 1
(Output.init)
@SP // 3989
AM=M+1 // 3990
A=A-1 // 3991
M=0 // 3992

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 3993
D=A // 3994
@SP // 3995
AM=M+1 // 3996
A=A-1 // 3997
M=D // 3998
// call Array.new
@6 // 3999
D=A // 4000
@14 // 4001
M=D // 4002
@Array.new // 4003
D=A // 4004
@13 // 4005
M=D // 4006
@Output.init.ret.0 // 4007
D=A // 4008
@CALL // 4009
0;JMP // 4010
(Output.init.ret.0)
@SP // 4011
AM=M-1 // 4012
D=M // 4013
@Output.0 // 4014
M=D // 4015

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4016
D=A // 4017
@SP // 4018
M=D+M // 4019
@63 // 4020
D=A // 4021
@SP // 4022
A=M-1 // 4023
M=0 // 4024
A=A-1 // 4025
M=0 // 4026
A=A-1 // 4027
M=D // 4028
A=A-1 // 4029
M=D // 4030
A=A-1 // 4031
M=D // 4032
A=A-1 // 4033
M=D // 4034
A=A-1 // 4035
M=D // 4036
A=A-1 // 4037
M=D // 4038
A=A-1 // 4039
M=D // 4040
A=A-1 // 4041
M=D // 4042
A=A-1 // 4043
M=D // 4044
A=A-1 // 4045
M=0 // 4046
// call Output.create
@17 // 4047
D=A // 4048
@14 // 4049
M=D // 4050
@Output.create // 4051
D=A // 4052
@13 // 4053
M=D // 4054
@Output.init.ret.1 // 4055
D=A // 4056
@CALL // 4057
0;JMP // 4058
(Output.init.ret.1)
@SP // 4059
M=M-1 // 4060

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4061
D=A // 4062
@SP // 4063
M=D+M // 4064
@32 // 4065
D=A // 4066
@SP // 4067
A=M-1 // 4068
M=0 // 4069
A=A-1 // 4070
M=0 // 4071
A=A-1 // 4072
M=0 // 4073
A=A-1 // 4074
M=0 // 4075
A=A-1 // 4076
M=0 // 4077
A=A-1 // 4078
M=0 // 4079
A=A-1 // 4080
M=0 // 4081
A=A-1 // 4082
M=0 // 4083
A=A-1 // 4084
M=0 // 4085
A=A-1 // 4086
M=0 // 4087
A=A-1 // 4088
M=0 // 4089
A=A-1 // 4090
M=D // 4091
A=A-1 // 4092
// call Output.create
@17 // 4093
D=A // 4094
@14 // 4095
M=D // 4096
@Output.create // 4097
D=A // 4098
@13 // 4099
M=D // 4100
@Output.init.ret.2 // 4101
D=A // 4102
@CALL // 4103
0;JMP // 4104
(Output.init.ret.2)
@SP // 4105
M=M-1 // 4106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4107
D=A // 4108
@SP // 4109
AM=M+1 // 4110
A=A-1 // 4111
M=D // 4112
@12 // 4113
D=A // 4114
@SP // 4115
AM=M+1 // 4116
A=A-1 // 4117
M=D // 4118
@30 // 4119
D=A // 4120
@SP // 4121
AM=M+1 // 4122
A=A-1 // 4123
M=D // 4124
@30 // 4125
D=A // 4126
@SP // 4127
AM=M+1 // 4128
A=A-1 // 4129
M=D // 4130
@30 // 4131
D=A // 4132
@SP // 4133
AM=M+1 // 4134
A=A-1 // 4135
M=D // 4136
@12 // 4137
D=A // 4138
@SP // 4139
AM=M+1 // 4140
A=A-1 // 4141
M=D // 4142
@12 // 4143
D=A // 4144
@SP // 4145
AM=M+1 // 4146
A=A-1 // 4147
M=D // 4148
@SP // 4149
AM=M+1 // 4150
A=A-1 // 4151
M=0 // 4152
@4 // 4153
D=A // 4154
@SP // 4155
M=D+M // 4156
@12 // 4157
D=A // 4158
@SP // 4159
A=M-1 // 4160
M=0 // 4161
A=A-1 // 4162
M=0 // 4163
A=A-1 // 4164
M=D // 4165
A=A-1 // 4166
M=D // 4167
A=A-1 // 4168
// call Output.create
@17 // 4169
D=A // 4170
@14 // 4171
M=D // 4172
@Output.create // 4173
D=A // 4174
@13 // 4175
M=D // 4176
@Output.init.ret.3 // 4177
D=A // 4178
@CALL // 4179
0;JMP // 4180
(Output.init.ret.3)
@SP // 4181
M=M-1 // 4182

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4183
D=A // 4184
@SP // 4185
AM=M+1 // 4186
A=A-1 // 4187
M=D // 4188
@54 // 4189
D=A // 4190
@SP // 4191
AM=M+1 // 4192
A=A-1 // 4193
M=D // 4194
@54 // 4195
D=A // 4196
@SP // 4197
AM=M+1 // 4198
A=A-1 // 4199
M=D // 4200
@20 // 4201
D=A // 4202
@SP // 4203
AM=M+1 // 4204
A=A-1 // 4205
M=D // 4206
@SP // 4207
AM=M+1 // 4208
A=A-1 // 4209
M=0 // 4210
@SP // 4211
AM=M+1 // 4212
A=A-1 // 4213
M=0 // 4214
@SP // 4215
AM=M+1 // 4216
A=A-1 // 4217
M=0 // 4218
@SP // 4219
AM=M+1 // 4220
A=A-1 // 4221
M=0 // 4222
@SP // 4223
AM=M+1 // 4224
A=A-1 // 4225
M=0 // 4226
@SP // 4227
AM=M+1 // 4228
A=A-1 // 4229
M=0 // 4230
@SP // 4231
AM=M+1 // 4232
A=A-1 // 4233
M=0 // 4234
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=0 // 4238
// call Output.create
@17 // 4239
D=A // 4240
@14 // 4241
M=D // 4242
@Output.create // 4243
D=A // 4244
@13 // 4245
M=D // 4246
@Output.init.ret.4 // 4247
D=A // 4248
@CALL // 4249
0;JMP // 4250
(Output.init.ret.4)
@SP // 4251
M=M-1 // 4252

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4253
D=A // 4254
@SP // 4255
M=D+M // 4256
@35 // 4257
D=A // 4258
@SP // 4259
A=M-1 // 4260
M=0 // 4261
A=A-1 // 4262
M=D // 4263
A=A-1 // 4264
@18 // 4265
D=A // 4266
@SP // 4267
AM=M+1 // 4268
A=A-1 // 4269
M=D // 4270
@18 // 4271
D=A // 4272
@SP // 4273
AM=M+1 // 4274
A=A-1 // 4275
M=D // 4276
@63 // 4277
D=A // 4278
@SP // 4279
AM=M+1 // 4280
A=A-1 // 4281
M=D // 4282
@18 // 4283
D=A // 4284
@SP // 4285
AM=M+1 // 4286
A=A-1 // 4287
M=D // 4288
@18 // 4289
D=A // 4290
@SP // 4291
AM=M+1 // 4292
A=A-1 // 4293
M=D // 4294
@63 // 4295
D=A // 4296
@SP // 4297
AM=M+1 // 4298
A=A-1 // 4299
M=D // 4300
@18 // 4301
D=A // 4302
@SP // 4303
AM=M+1 // 4304
A=A-1 // 4305
M=D // 4306
@18 // 4307
D=A // 4308
@SP // 4309
AM=M+1 // 4310
A=A-1 // 4311
M=D // 4312
@SP // 4313
AM=M+1 // 4314
A=A-1 // 4315
M=0 // 4316
@SP // 4317
AM=M+1 // 4318
A=A-1 // 4319
M=0 // 4320
// call Output.create
@17 // 4321
D=A // 4322
@14 // 4323
M=D // 4324
@Output.create // 4325
D=A // 4326
@13 // 4327
M=D // 4328
@Output.init.ret.5 // 4329
D=A // 4330
@CALL // 4331
0;JMP // 4332
(Output.init.ret.5)
@SP // 4333
M=M-1 // 4334

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4335
D=A // 4336
@SP // 4337
AM=M+1 // 4338
A=A-1 // 4339
M=D // 4340
@12 // 4341
D=A // 4342
@SP // 4343
AM=M+1 // 4344
A=A-1 // 4345
M=D // 4346
@30 // 4347
D=A // 4348
@SP // 4349
AM=M+1 // 4350
A=A-1 // 4351
M=D // 4352
@51 // 4353
D=A // 4354
@SP // 4355
AM=M+1 // 4356
A=A-1 // 4357
M=D // 4358
@3 // 4359
D=A // 4360
@SP // 4361
AM=M+1 // 4362
A=A-1 // 4363
M=D // 4364
@30 // 4365
D=A // 4366
@SP // 4367
AM=M+1 // 4368
A=A-1 // 4369
M=D // 4370
@48 // 4371
D=A // 4372
@SP // 4373
AM=M+1 // 4374
A=A-1 // 4375
M=D // 4376
@51 // 4377
D=A // 4378
@SP // 4379
AM=M+1 // 4380
A=A-1 // 4381
M=D // 4382
@30 // 4383
D=A // 4384
@SP // 4385
AM=M+1 // 4386
A=A-1 // 4387
M=D // 4388
@12 // 4389
D=A // 4390
@SP // 4391
AM=M+1 // 4392
A=A-1 // 4393
M=D // 4394
@12 // 4395
D=A // 4396
@SP // 4397
AM=M+1 // 4398
A=A-1 // 4399
M=D // 4400
@SP // 4401
AM=M+1 // 4402
A=A-1 // 4403
M=0 // 4404
// call Output.create
@17 // 4405
D=A // 4406
@14 // 4407
M=D // 4408
@Output.create // 4409
D=A // 4410
@13 // 4411
M=D // 4412
@Output.init.ret.6 // 4413
D=A // 4414
@CALL // 4415
0;JMP // 4416
(Output.init.ret.6)
@SP // 4417
M=M-1 // 4418

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4419
D=A // 4420
@SP // 4421
M=D+M // 4422
@37 // 4423
D=A // 4424
@SP // 4425
A=M-1 // 4426
M=0 // 4427
A=A-1 // 4428
M=0 // 4429
A=A-1 // 4430
M=D // 4431
A=A-1 // 4432
@35 // 4433
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
@24 // 4445
D=A // 4446
@SP // 4447
AM=M+1 // 4448
A=A-1 // 4449
M=D // 4450
@12 // 4451
D=A // 4452
@SP // 4453
AM=M+1 // 4454
A=A-1 // 4455
M=D // 4456
@6 // 4457
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
@49 // 4469
D=A // 4470
@SP // 4471
AM=M+1 // 4472
A=A-1 // 4473
M=D // 4474
@SP // 4475
AM=M+1 // 4476
A=A-1 // 4477
M=0 // 4478
@SP // 4479
AM=M+1 // 4480
A=A-1 // 4481
M=0 // 4482
// call Output.create
@17 // 4483
D=A // 4484
@14 // 4485
M=D // 4486
@Output.create // 4487
D=A // 4488
@13 // 4489
M=D // 4490
@Output.init.ret.7 // 4491
D=A // 4492
@CALL // 4493
0;JMP // 4494
(Output.init.ret.7)
@SP // 4495
M=M-1 // 4496

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4497
D=A // 4498
@SP // 4499
AM=M+1 // 4500
A=A-1 // 4501
M=D // 4502
@12 // 4503
D=A // 4504
@SP // 4505
AM=M+1 // 4506
A=A-1 // 4507
M=D // 4508
@30 // 4509
D=A // 4510
@SP // 4511
AM=M+1 // 4512
A=A-1 // 4513
M=D // 4514
@30 // 4515
D=A // 4516
@SP // 4517
AM=M+1 // 4518
A=A-1 // 4519
M=D // 4520
@12 // 4521
D=A // 4522
@SP // 4523
AM=M+1 // 4524
A=A-1 // 4525
M=D // 4526
@54 // 4527
D=A // 4528
@SP // 4529
AM=M+1 // 4530
A=A-1 // 4531
M=D // 4532
@27 // 4533
D=A // 4534
@SP // 4535
AM=M+1 // 4536
A=A-1 // 4537
M=D // 4538
@27 // 4539
D=A // 4540
@SP // 4541
AM=M+1 // 4542
A=A-1 // 4543
M=D // 4544
@27 // 4545
D=A // 4546
@SP // 4547
AM=M+1 // 4548
A=A-1 // 4549
M=D // 4550
@54 // 4551
D=A // 4552
@SP // 4553
AM=M+1 // 4554
A=A-1 // 4555
M=D // 4556
@SP // 4557
AM=M+1 // 4558
A=A-1 // 4559
M=0 // 4560
@SP // 4561
AM=M+1 // 4562
A=A-1 // 4563
M=0 // 4564
// call Output.create
@17 // 4565
D=A // 4566
@14 // 4567
M=D // 4568
@Output.create // 4569
D=A // 4570
@13 // 4571
M=D // 4572
@Output.init.ret.8 // 4573
D=A // 4574
@CALL // 4575
0;JMP // 4576
(Output.init.ret.8)
@SP // 4577
M=M-1 // 4578

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4579
D=A // 4580
@SP // 4581
AM=M+1 // 4582
A=A-1 // 4583
M=D // 4584
@12 // 4585
D=A // 4586
@SP // 4587
AM=M+1 // 4588
A=A-1 // 4589
M=D // 4590
@12 // 4591
D=A // 4592
@SP // 4593
AM=M+1 // 4594
A=A-1 // 4595
M=D // 4596
@6 // 4597
D=A // 4598
@SP // 4599
AM=M+1 // 4600
A=A-1 // 4601
M=D // 4602
@SP // 4603
AM=M+1 // 4604
A=A-1 // 4605
M=0 // 4606
@SP // 4607
AM=M+1 // 4608
A=A-1 // 4609
M=0 // 4610
@SP // 4611
AM=M+1 // 4612
A=A-1 // 4613
M=0 // 4614
@SP // 4615
AM=M+1 // 4616
A=A-1 // 4617
M=0 // 4618
@SP // 4619
AM=M+1 // 4620
A=A-1 // 4621
M=0 // 4622
@SP // 4623
AM=M+1 // 4624
A=A-1 // 4625
M=0 // 4626
@SP // 4627
AM=M+1 // 4628
A=A-1 // 4629
M=0 // 4630
@SP // 4631
AM=M+1 // 4632
A=A-1 // 4633
M=0 // 4634
// call Output.create
@17 // 4635
D=A // 4636
@14 // 4637
M=D // 4638
@Output.create // 4639
D=A // 4640
@13 // 4641
M=D // 4642
@Output.init.ret.9 // 4643
D=A // 4644
@CALL // 4645
0;JMP // 4646
(Output.init.ret.9)
@SP // 4647
M=M-1 // 4648

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4649
D=A // 4650
@SP // 4651
AM=M+1 // 4652
A=A-1 // 4653
M=D // 4654
@24 // 4655
D=A // 4656
@SP // 4657
AM=M+1 // 4658
A=A-1 // 4659
M=D // 4660
@12 // 4661
D=A // 4662
@SP // 4663
AM=M+1 // 4664
A=A-1 // 4665
M=D // 4666
@6 // 4667
D=A // 4668
@SP // 4669
AM=M+1 // 4670
A=A-1 // 4671
M=D // 4672
@6 // 4673
D=A // 4674
@SP // 4675
AM=M+1 // 4676
A=A-1 // 4677
M=D // 4678
@6 // 4679
D=A // 4680
@SP // 4681
AM=M+1 // 4682
A=A-1 // 4683
M=D // 4684
@6 // 4685
D=A // 4686
@SP // 4687
AM=M+1 // 4688
A=A-1 // 4689
M=D // 4690
@6 // 4691
D=A // 4692
@SP // 4693
AM=M+1 // 4694
A=A-1 // 4695
M=D // 4696
@12 // 4697
D=A // 4698
@SP // 4699
AM=M+1 // 4700
A=A-1 // 4701
M=D // 4702
@24 // 4703
D=A // 4704
@SP // 4705
AM=M+1 // 4706
A=A-1 // 4707
M=D // 4708
@SP // 4709
AM=M+1 // 4710
A=A-1 // 4711
M=0 // 4712
@SP // 4713
AM=M+1 // 4714
A=A-1 // 4715
M=0 // 4716
// call Output.create
@17 // 4717
D=A // 4718
@14 // 4719
M=D // 4720
@Output.create // 4721
D=A // 4722
@13 // 4723
M=D // 4724
@Output.init.ret.10 // 4725
D=A // 4726
@CALL // 4727
0;JMP // 4728
(Output.init.ret.10)
@SP // 4729
M=M-1 // 4730

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4731
D=A // 4732
@SP // 4733
AM=M+1 // 4734
A=A-1 // 4735
M=D // 4736
@6 // 4737
D=A // 4738
@SP // 4739
AM=M+1 // 4740
A=A-1 // 4741
M=D // 4742
@12 // 4743
D=A // 4744
@SP // 4745
AM=M+1 // 4746
A=A-1 // 4747
M=D // 4748
@24 // 4749
D=A // 4750
@SP // 4751
AM=M+1 // 4752
A=A-1 // 4753
M=D // 4754
@24 // 4755
D=A // 4756
@SP // 4757
AM=M+1 // 4758
A=A-1 // 4759
M=D // 4760
@24 // 4761
D=A // 4762
@SP // 4763
AM=M+1 // 4764
A=A-1 // 4765
M=D // 4766
@24 // 4767
D=A // 4768
@SP // 4769
AM=M+1 // 4770
A=A-1 // 4771
M=D // 4772
@24 // 4773
D=A // 4774
@SP // 4775
AM=M+1 // 4776
A=A-1 // 4777
M=D // 4778
@12 // 4779
D=A // 4780
@SP // 4781
AM=M+1 // 4782
A=A-1 // 4783
M=D // 4784
@6 // 4785
D=A // 4786
@SP // 4787
AM=M+1 // 4788
A=A-1 // 4789
M=D // 4790
@SP // 4791
AM=M+1 // 4792
A=A-1 // 4793
M=0 // 4794
@SP // 4795
AM=M+1 // 4796
A=A-1 // 4797
M=0 // 4798
// call Output.create
@17 // 4799
D=A // 4800
@14 // 4801
M=D // 4802
@Output.create // 4803
D=A // 4804
@13 // 4805
M=D // 4806
@Output.init.ret.11 // 4807
D=A // 4808
@CALL // 4809
0;JMP // 4810
(Output.init.ret.11)
@SP // 4811
M=M-1 // 4812

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4813
D=A // 4814
@SP // 4815
M=D+M // 4816
@42 // 4817
D=A // 4818
@SP // 4819
A=M-1 // 4820
M=0 // 4821
A=A-1 // 4822
M=0 // 4823
A=A-1 // 4824
M=0 // 4825
A=A-1 // 4826
M=D // 4827
A=A-1 // 4828
@51 // 4829
D=A // 4830
@SP // 4831
AM=M+1 // 4832
A=A-1 // 4833
M=D // 4834
@30 // 4835
D=A // 4836
@SP // 4837
AM=M+1 // 4838
A=A-1 // 4839
M=D // 4840
@63 // 4841
D=A // 4842
@SP // 4843
AM=M+1 // 4844
A=A-1 // 4845
M=D // 4846
@30 // 4847
D=A // 4848
@SP // 4849
AM=M+1 // 4850
A=A-1 // 4851
M=D // 4852
@51 // 4853
D=A // 4854
@SP // 4855
AM=M+1 // 4856
A=A-1 // 4857
M=D // 4858
@SP // 4859
AM=M+1 // 4860
A=A-1 // 4861
M=0 // 4862
@SP // 4863
AM=M+1 // 4864
A=A-1 // 4865
M=0 // 4866
@SP // 4867
AM=M+1 // 4868
A=A-1 // 4869
M=0 // 4870
// call Output.create
@17 // 4871
D=A // 4872
@14 // 4873
M=D // 4874
@Output.create // 4875
D=A // 4876
@13 // 4877
M=D // 4878
@Output.init.ret.12 // 4879
D=A // 4880
@CALL // 4881
0;JMP // 4882
(Output.init.ret.12)
@SP // 4883
M=M-1 // 4884

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4885
D=A // 4886
@SP // 4887
M=D+M // 4888
@43 // 4889
D=A // 4890
@SP // 4891
A=M-1 // 4892
M=0 // 4893
A=A-1 // 4894
M=0 // 4895
A=A-1 // 4896
M=0 // 4897
A=A-1 // 4898
M=D // 4899
A=A-1 // 4900
@12 // 4901
D=A // 4902
@SP // 4903
AM=M+1 // 4904
A=A-1 // 4905
M=D // 4906
@12 // 4907
D=A // 4908
@SP // 4909
AM=M+1 // 4910
A=A-1 // 4911
M=D // 4912
@63 // 4913
D=A // 4914
@SP // 4915
AM=M+1 // 4916
A=A-1 // 4917
M=D // 4918
@12 // 4919
D=A // 4920
@SP // 4921
AM=M+1 // 4922
A=A-1 // 4923
M=D // 4924
@12 // 4925
D=A // 4926
@SP // 4927
AM=M+1 // 4928
A=A-1 // 4929
M=D // 4930
@SP // 4931
AM=M+1 // 4932
A=A-1 // 4933
M=0 // 4934
@SP // 4935
AM=M+1 // 4936
A=A-1 // 4937
M=0 // 4938
@SP // 4939
AM=M+1 // 4940
A=A-1 // 4941
M=0 // 4942
// call Output.create
@17 // 4943
D=A // 4944
@14 // 4945
M=D // 4946
@Output.create // 4947
D=A // 4948
@13 // 4949
M=D // 4950
@Output.init.ret.13 // 4951
D=A // 4952
@CALL // 4953
0;JMP // 4954
(Output.init.ret.13)
@SP // 4955
M=M-1 // 4956

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 4957
D=A // 4958
@SP // 4959
M=D+M // 4960
@44 // 4961
D=A // 4962
@SP // 4963
A=M-1 // 4964
M=0 // 4965
A=A-1 // 4966
M=0 // 4967
A=A-1 // 4968
M=0 // 4969
A=A-1 // 4970
M=0 // 4971
A=A-1 // 4972
M=0 // 4973
A=A-1 // 4974
M=0 // 4975
A=A-1 // 4976
M=0 // 4977
A=A-1 // 4978
M=D // 4979
A=A-1 // 4980
@12 // 4981
D=A // 4982
@SP // 4983
AM=M+1 // 4984
A=A-1 // 4985
M=D // 4986
@12 // 4987
D=A // 4988
@SP // 4989
AM=M+1 // 4990
A=A-1 // 4991
M=D // 4992
@6 // 4993
D=A // 4994
@SP // 4995
AM=M+1 // 4996
A=A-1 // 4997
M=D // 4998
@SP // 4999
AM=M+1 // 5000
A=A-1 // 5001
M=0 // 5002
// call Output.create
@17 // 5003
D=A // 5004
@14 // 5005
M=D // 5006
@Output.create // 5007
D=A // 5008
@13 // 5009
M=D // 5010
@Output.init.ret.14 // 5011
D=A // 5012
@CALL // 5013
0;JMP // 5014
(Output.init.ret.14)
@SP // 5015
M=M-1 // 5016

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5017
D=A // 5018
@SP // 5019
M=D+M // 5020
@45 // 5021
D=A // 5022
@SP // 5023
A=M-1 // 5024
M=0 // 5025
A=A-1 // 5026
M=0 // 5027
A=A-1 // 5028
M=0 // 5029
A=A-1 // 5030
M=0 // 5031
A=A-1 // 5032
M=0 // 5033
A=A-1 // 5034
M=D // 5035
A=A-1 // 5036
@6 // 5037
D=A // 5038
@SP // 5039
M=D+M // 5040
@63 // 5041
D=A // 5042
@SP // 5043
A=M-1 // 5044
M=0 // 5045
A=A-1 // 5046
M=0 // 5047
A=A-1 // 5048
M=0 // 5049
A=A-1 // 5050
M=0 // 5051
A=A-1 // 5052
M=0 // 5053
A=A-1 // 5054
M=D // 5055
A=A-1 // 5056
// call Output.create
@17 // 5057
D=A // 5058
@14 // 5059
M=D // 5060
@Output.create // 5061
D=A // 5062
@13 // 5063
M=D // 5064
@Output.init.ret.15 // 5065
D=A // 5066
@CALL // 5067
0;JMP // 5068
(Output.init.ret.15)
@SP // 5069
M=M-1 // 5070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5071
D=A // 5072
@SP // 5073
M=D+M // 5074
@46 // 5075
D=A // 5076
@SP // 5077
A=M-1 // 5078
M=0 // 5079
A=A-1 // 5080
M=0 // 5081
A=A-1 // 5082
M=0 // 5083
A=A-1 // 5084
M=0 // 5085
A=A-1 // 5086
M=0 // 5087
A=A-1 // 5088
M=0 // 5089
A=A-1 // 5090
M=0 // 5091
A=A-1 // 5092
M=D // 5093
A=A-1 // 5094
@4 // 5095
D=A // 5096
@SP // 5097
M=D+M // 5098
@12 // 5099
D=A // 5100
@SP // 5101
A=M-1 // 5102
M=0 // 5103
A=A-1 // 5104
M=0 // 5105
A=A-1 // 5106
M=D // 5107
A=A-1 // 5108
M=D // 5109
A=A-1 // 5110
// call Output.create
@17 // 5111
D=A // 5112
@14 // 5113
M=D // 5114
@Output.create // 5115
D=A // 5116
@13 // 5117
M=D // 5118
@Output.init.ret.16 // 5119
D=A // 5120
@CALL // 5121
0;JMP // 5122
(Output.init.ret.16)
@SP // 5123
M=M-1 // 5124

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5125
D=A // 5126
@SP // 5127
M=D+M // 5128
@47 // 5129
D=A // 5130
@SP // 5131
A=M-1 // 5132
M=0 // 5133
A=A-1 // 5134
M=0 // 5135
A=A-1 // 5136
M=D // 5137
A=A-1 // 5138
@32 // 5139
D=A // 5140
@SP // 5141
AM=M+1 // 5142
A=A-1 // 5143
M=D // 5144
@48 // 5145
D=A // 5146
@SP // 5147
AM=M+1 // 5148
A=A-1 // 5149
M=D // 5150
@24 // 5151
D=A // 5152
@SP // 5153
AM=M+1 // 5154
A=A-1 // 5155
M=D // 5156
@12 // 5157
D=A // 5158
@SP // 5159
AM=M+1 // 5160
A=A-1 // 5161
M=D // 5162
@6 // 5163
D=A // 5164
@SP // 5165
AM=M+1 // 5166
A=A-1 // 5167
M=D // 5168
@3 // 5169
D=A // 5170
@SP // 5171
AM=M+1 // 5172
A=A-1 // 5173
M=D // 5174
@SP // 5175
AM=M+1 // 5176
A=A-1 // 5177
M=1 // 5178
@SP // 5179
AM=M+1 // 5180
A=A-1 // 5181
M=0 // 5182
@SP // 5183
AM=M+1 // 5184
A=A-1 // 5185
M=0 // 5186
// call Output.create
@17 // 5187
D=A // 5188
@14 // 5189
M=D // 5190
@Output.create // 5191
D=A // 5192
@13 // 5193
M=D // 5194
@Output.init.ret.17 // 5195
D=A // 5196
@CALL // 5197
0;JMP // 5198
(Output.init.ret.17)
@SP // 5199
M=M-1 // 5200

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5201
D=A // 5202
@SP // 5203
AM=M+1 // 5204
A=A-1 // 5205
M=D // 5206
@12 // 5207
D=A // 5208
@SP // 5209
AM=M+1 // 5210
A=A-1 // 5211
M=D // 5212
@30 // 5213
D=A // 5214
@SP // 5215
AM=M+1 // 5216
A=A-1 // 5217
M=D // 5218
@51 // 5219
D=A // 5220
@SP // 5221
AM=M+1 // 5222
A=A-1 // 5223
M=D // 5224
@51 // 5225
D=A // 5226
@SP // 5227
AM=M+1 // 5228
A=A-1 // 5229
M=D // 5230
@51 // 5231
D=A // 5232
@SP // 5233
AM=M+1 // 5234
A=A-1 // 5235
M=D // 5236
@51 // 5237
D=A // 5238
@SP // 5239
AM=M+1 // 5240
A=A-1 // 5241
M=D // 5242
@51 // 5243
D=A // 5244
@SP // 5245
AM=M+1 // 5246
A=A-1 // 5247
M=D // 5248
@30 // 5249
D=A // 5250
@SP // 5251
AM=M+1 // 5252
A=A-1 // 5253
M=D // 5254
@12 // 5255
D=A // 5256
@SP // 5257
AM=M+1 // 5258
A=A-1 // 5259
M=D // 5260
@SP // 5261
AM=M+1 // 5262
A=A-1 // 5263
M=0 // 5264
@SP // 5265
AM=M+1 // 5266
A=A-1 // 5267
M=0 // 5268
// call Output.create
@17 // 5269
D=A // 5270
@14 // 5271
M=D // 5272
@Output.create // 5273
D=A // 5274
@13 // 5275
M=D // 5276
@Output.init.ret.18 // 5277
D=A // 5278
@CALL // 5279
0;JMP // 5280
(Output.init.ret.18)
@SP // 5281
M=M-1 // 5282

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5283
D=A // 5284
@SP // 5285
AM=M+1 // 5286
A=A-1 // 5287
M=D // 5288
@12 // 5289
D=A // 5290
@SP // 5291
AM=M+1 // 5292
A=A-1 // 5293
M=D // 5294
@14 // 5295
D=A // 5296
@SP // 5297
AM=M+1 // 5298
A=A-1 // 5299
M=D // 5300
@15 // 5301
D=A // 5302
@SP // 5303
AM=M+1 // 5304
A=A-1 // 5305
M=D // 5306
@12 // 5307
D=A // 5308
@SP // 5309
AM=M+1 // 5310
A=A-1 // 5311
M=D // 5312
@12 // 5313
D=A // 5314
@SP // 5315
AM=M+1 // 5316
A=A-1 // 5317
M=D // 5318
@12 // 5319
D=A // 5320
@SP // 5321
AM=M+1 // 5322
A=A-1 // 5323
M=D // 5324
@12 // 5325
D=A // 5326
@SP // 5327
AM=M+1 // 5328
A=A-1 // 5329
M=D // 5330
@12 // 5331
D=A // 5332
@SP // 5333
AM=M+1 // 5334
A=A-1 // 5335
M=D // 5336
@63 // 5337
D=A // 5338
@SP // 5339
AM=M+1 // 5340
A=A-1 // 5341
M=D // 5342
@SP // 5343
AM=M+1 // 5344
A=A-1 // 5345
M=0 // 5346
@SP // 5347
AM=M+1 // 5348
A=A-1 // 5349
M=0 // 5350
// call Output.create
@17 // 5351
D=A // 5352
@14 // 5353
M=D // 5354
@Output.create // 5355
D=A // 5356
@13 // 5357
M=D // 5358
@Output.init.ret.19 // 5359
D=A // 5360
@CALL // 5361
0;JMP // 5362
(Output.init.ret.19)
@SP // 5363
M=M-1 // 5364

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5365
D=A // 5366
@SP // 5367
AM=M+1 // 5368
A=A-1 // 5369
M=D // 5370
@30 // 5371
D=A // 5372
@SP // 5373
AM=M+1 // 5374
A=A-1 // 5375
M=D // 5376
@51 // 5377
D=A // 5378
@SP // 5379
AM=M+1 // 5380
A=A-1 // 5381
M=D // 5382
@48 // 5383
D=A // 5384
@SP // 5385
AM=M+1 // 5386
A=A-1 // 5387
M=D // 5388
@24 // 5389
D=A // 5390
@SP // 5391
AM=M+1 // 5392
A=A-1 // 5393
M=D // 5394
@12 // 5395
D=A // 5396
@SP // 5397
AM=M+1 // 5398
A=A-1 // 5399
M=D // 5400
@6 // 5401
D=A // 5402
@SP // 5403
AM=M+1 // 5404
A=A-1 // 5405
M=D // 5406
@3 // 5407
D=A // 5408
@SP // 5409
AM=M+1 // 5410
A=A-1 // 5411
M=D // 5412
@51 // 5413
D=A // 5414
@SP // 5415
AM=M+1 // 5416
A=A-1 // 5417
M=D // 5418
@63 // 5419
D=A // 5420
@SP // 5421
AM=M+1 // 5422
A=A-1 // 5423
M=D // 5424
@SP // 5425
AM=M+1 // 5426
A=A-1 // 5427
M=0 // 5428
@SP // 5429
AM=M+1 // 5430
A=A-1 // 5431
M=0 // 5432
// call Output.create
@17 // 5433
D=A // 5434
@14 // 5435
M=D // 5436
@Output.create // 5437
D=A // 5438
@13 // 5439
M=D // 5440
@Output.init.ret.20 // 5441
D=A // 5442
@CALL // 5443
0;JMP // 5444
(Output.init.ret.20)
@SP // 5445
M=M-1 // 5446

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5447
D=A // 5448
@SP // 5449
AM=M+1 // 5450
A=A-1 // 5451
M=D // 5452
@30 // 5453
D=A // 5454
@SP // 5455
AM=M+1 // 5456
A=A-1 // 5457
M=D // 5458
@51 // 5459
D=A // 5460
@SP // 5461
AM=M+1 // 5462
A=A-1 // 5463
M=D // 5464
@48 // 5465
D=A // 5466
@SP // 5467
AM=M+1 // 5468
A=A-1 // 5469
M=D // 5470
@48 // 5471
D=A // 5472
@SP // 5473
AM=M+1 // 5474
A=A-1 // 5475
M=D // 5476
@28 // 5477
D=A // 5478
@SP // 5479
AM=M+1 // 5480
A=A-1 // 5481
M=D // 5482
@48 // 5483
D=A // 5484
@SP // 5485
AM=M+1 // 5486
A=A-1 // 5487
M=D // 5488
@48 // 5489
D=A // 5490
@SP // 5491
AM=M+1 // 5492
A=A-1 // 5493
M=D // 5494
@51 // 5495
D=A // 5496
@SP // 5497
AM=M+1 // 5498
A=A-1 // 5499
M=D // 5500
@30 // 5501
D=A // 5502
@SP // 5503
AM=M+1 // 5504
A=A-1 // 5505
M=D // 5506
@SP // 5507
AM=M+1 // 5508
A=A-1 // 5509
M=0 // 5510
@SP // 5511
AM=M+1 // 5512
A=A-1 // 5513
M=0 // 5514
// call Output.create
@17 // 5515
D=A // 5516
@14 // 5517
M=D // 5518
@Output.create // 5519
D=A // 5520
@13 // 5521
M=D // 5522
@Output.init.ret.21 // 5523
D=A // 5524
@CALL // 5525
0;JMP // 5526
(Output.init.ret.21)
@SP // 5527
M=M-1 // 5528

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5529
D=A // 5530
@SP // 5531
AM=M+1 // 5532
A=A-1 // 5533
M=D // 5534
@16 // 5535
D=A // 5536
@SP // 5537
AM=M+1 // 5538
A=A-1 // 5539
M=D // 5540
@24 // 5541
D=A // 5542
@SP // 5543
AM=M+1 // 5544
A=A-1 // 5545
M=D // 5546
@28 // 5547
D=A // 5548
@SP // 5549
AM=M+1 // 5550
A=A-1 // 5551
M=D // 5552
@26 // 5553
D=A // 5554
@SP // 5555
AM=M+1 // 5556
A=A-1 // 5557
M=D // 5558
@25 // 5559
D=A // 5560
@SP // 5561
AM=M+1 // 5562
A=A-1 // 5563
M=D // 5564
@63 // 5565
D=A // 5566
@SP // 5567
AM=M+1 // 5568
A=A-1 // 5569
M=D // 5570
@24 // 5571
D=A // 5572
@SP // 5573
AM=M+1 // 5574
A=A-1 // 5575
M=D // 5576
@24 // 5577
D=A // 5578
@SP // 5579
AM=M+1 // 5580
A=A-1 // 5581
M=D // 5582
@60 // 5583
D=A // 5584
@SP // 5585
AM=M+1 // 5586
A=A-1 // 5587
M=D // 5588
@SP // 5589
AM=M+1 // 5590
A=A-1 // 5591
M=0 // 5592
@SP // 5593
AM=M+1 // 5594
A=A-1 // 5595
M=0 // 5596
// call Output.create
@17 // 5597
D=A // 5598
@14 // 5599
M=D // 5600
@Output.create // 5601
D=A // 5602
@13 // 5603
M=D // 5604
@Output.init.ret.22 // 5605
D=A // 5606
@CALL // 5607
0;JMP // 5608
(Output.init.ret.22)
@SP // 5609
M=M-1 // 5610

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5611
D=A // 5612
@SP // 5613
AM=M+1 // 5614
A=A-1 // 5615
M=D // 5616
@63 // 5617
D=A // 5618
@SP // 5619
AM=M+1 // 5620
A=A-1 // 5621
M=D // 5622
@3 // 5623
D=A // 5624
@SP // 5625
AM=M+1 // 5626
A=A-1 // 5627
M=D // 5628
@3 // 5629
D=A // 5630
@SP // 5631
AM=M+1 // 5632
A=A-1 // 5633
M=D // 5634
@31 // 5635
D=A // 5636
@SP // 5637
AM=M+1 // 5638
A=A-1 // 5639
M=D // 5640
@48 // 5641
D=A // 5642
@SP // 5643
AM=M+1 // 5644
A=A-1 // 5645
M=D // 5646
@48 // 5647
D=A // 5648
@SP // 5649
AM=M+1 // 5650
A=A-1 // 5651
M=D // 5652
@48 // 5653
D=A // 5654
@SP // 5655
AM=M+1 // 5656
A=A-1 // 5657
M=D // 5658
@51 // 5659
D=A // 5660
@SP // 5661
AM=M+1 // 5662
A=A-1 // 5663
M=D // 5664
@30 // 5665
D=A // 5666
@SP // 5667
AM=M+1 // 5668
A=A-1 // 5669
M=D // 5670
@SP // 5671
AM=M+1 // 5672
A=A-1 // 5673
M=0 // 5674
@SP // 5675
AM=M+1 // 5676
A=A-1 // 5677
M=0 // 5678
// call Output.create
@17 // 5679
D=A // 5680
@14 // 5681
M=D // 5682
@Output.create // 5683
D=A // 5684
@13 // 5685
M=D // 5686
@Output.init.ret.23 // 5687
D=A // 5688
@CALL // 5689
0;JMP // 5690
(Output.init.ret.23)
@SP // 5691
M=M-1 // 5692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5693
D=A // 5694
@SP // 5695
AM=M+1 // 5696
A=A-1 // 5697
M=D // 5698
@28 // 5699
D=A // 5700
@SP // 5701
AM=M+1 // 5702
A=A-1 // 5703
M=D // 5704
@6 // 5705
D=A // 5706
@SP // 5707
AM=M+1 // 5708
A=A-1 // 5709
M=D // 5710
@3 // 5711
D=A // 5712
@SP // 5713
AM=M+1 // 5714
A=A-1 // 5715
M=D // 5716
@3 // 5717
D=A // 5718
@SP // 5719
AM=M+1 // 5720
A=A-1 // 5721
M=D // 5722
@31 // 5723
D=A // 5724
@SP // 5725
AM=M+1 // 5726
A=A-1 // 5727
M=D // 5728
@51 // 5729
D=A // 5730
@SP // 5731
AM=M+1 // 5732
A=A-1 // 5733
M=D // 5734
@51 // 5735
D=A // 5736
@SP // 5737
AM=M+1 // 5738
A=A-1 // 5739
M=D // 5740
@51 // 5741
D=A // 5742
@SP // 5743
AM=M+1 // 5744
A=A-1 // 5745
M=D // 5746
@30 // 5747
D=A // 5748
@SP // 5749
AM=M+1 // 5750
A=A-1 // 5751
M=D // 5752
@SP // 5753
AM=M+1 // 5754
A=A-1 // 5755
M=0 // 5756
@SP // 5757
AM=M+1 // 5758
A=A-1 // 5759
M=0 // 5760
// call Output.create
@17 // 5761
D=A // 5762
@14 // 5763
M=D // 5764
@Output.create // 5765
D=A // 5766
@13 // 5767
M=D // 5768
@Output.init.ret.24 // 5769
D=A // 5770
@CALL // 5771
0;JMP // 5772
(Output.init.ret.24)
@SP // 5773
M=M-1 // 5774

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 5775
D=A // 5776
@SP // 5777
AM=M+1 // 5778
A=A-1 // 5779
M=D // 5780
@63 // 5781
D=A // 5782
@SP // 5783
AM=M+1 // 5784
A=A-1 // 5785
M=D // 5786
@49 // 5787
D=A // 5788
@SP // 5789
AM=M+1 // 5790
A=A-1 // 5791
M=D // 5792
@48 // 5793
D=A // 5794
@SP // 5795
AM=M+1 // 5796
A=A-1 // 5797
M=D // 5798
@48 // 5799
D=A // 5800
@SP // 5801
AM=M+1 // 5802
A=A-1 // 5803
M=D // 5804
@24 // 5805
D=A // 5806
@SP // 5807
AM=M+1 // 5808
A=A-1 // 5809
M=D // 5810
@12 // 5811
D=A // 5812
@SP // 5813
AM=M+1 // 5814
A=A-1 // 5815
M=D // 5816
@12 // 5817
D=A // 5818
@SP // 5819
AM=M+1 // 5820
A=A-1 // 5821
M=D // 5822
@12 // 5823
D=A // 5824
@SP // 5825
AM=M+1 // 5826
A=A-1 // 5827
M=D // 5828
@12 // 5829
D=A // 5830
@SP // 5831
AM=M+1 // 5832
A=A-1 // 5833
M=D // 5834
@SP // 5835
AM=M+1 // 5836
A=A-1 // 5837
M=0 // 5838
@SP // 5839
AM=M+1 // 5840
A=A-1 // 5841
M=0 // 5842
// call Output.create
@17 // 5843
D=A // 5844
@14 // 5845
M=D // 5846
@Output.create // 5847
D=A // 5848
@13 // 5849
M=D // 5850
@Output.init.ret.25 // 5851
D=A // 5852
@CALL // 5853
0;JMP // 5854
(Output.init.ret.25)
@SP // 5855
M=M-1 // 5856

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 5857
D=A // 5858
@SP // 5859
AM=M+1 // 5860
A=A-1 // 5861
M=D // 5862
@30 // 5863
D=A // 5864
@SP // 5865
AM=M+1 // 5866
A=A-1 // 5867
M=D // 5868
@51 // 5869
D=A // 5870
@SP // 5871
AM=M+1 // 5872
A=A-1 // 5873
M=D // 5874
@51 // 5875
D=A // 5876
@SP // 5877
AM=M+1 // 5878
A=A-1 // 5879
M=D // 5880
@51 // 5881
D=A // 5882
@SP // 5883
AM=M+1 // 5884
A=A-1 // 5885
M=D // 5886
@30 // 5887
D=A // 5888
@SP // 5889
AM=M+1 // 5890
A=A-1 // 5891
M=D // 5892
@51 // 5893
D=A // 5894
@SP // 5895
AM=M+1 // 5896
A=A-1 // 5897
M=D // 5898
@51 // 5899
D=A // 5900
@SP // 5901
AM=M+1 // 5902
A=A-1 // 5903
M=D // 5904
@51 // 5905
D=A // 5906
@SP // 5907
AM=M+1 // 5908
A=A-1 // 5909
M=D // 5910
@30 // 5911
D=A // 5912
@SP // 5913
AM=M+1 // 5914
A=A-1 // 5915
M=D // 5916
@SP // 5917
AM=M+1 // 5918
A=A-1 // 5919
M=0 // 5920
@SP // 5921
AM=M+1 // 5922
A=A-1 // 5923
M=0 // 5924
// call Output.create
@17 // 5925
D=A // 5926
@14 // 5927
M=D // 5928
@Output.create // 5929
D=A // 5930
@13 // 5931
M=D // 5932
@Output.init.ret.26 // 5933
D=A // 5934
@CALL // 5935
0;JMP // 5936
(Output.init.ret.26)
@SP // 5937
M=M-1 // 5938

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 5939
D=A // 5940
@SP // 5941
AM=M+1 // 5942
A=A-1 // 5943
M=D // 5944
@30 // 5945
D=A // 5946
@SP // 5947
AM=M+1 // 5948
A=A-1 // 5949
M=D // 5950
@51 // 5951
D=A // 5952
@SP // 5953
AM=M+1 // 5954
A=A-1 // 5955
M=D // 5956
@51 // 5957
D=A // 5958
@SP // 5959
AM=M+1 // 5960
A=A-1 // 5961
M=D // 5962
@51 // 5963
D=A // 5964
@SP // 5965
AM=M+1 // 5966
A=A-1 // 5967
M=D // 5968
@62 // 5969
D=A // 5970
@SP // 5971
AM=M+1 // 5972
A=A-1 // 5973
M=D // 5974
@48 // 5975
D=A // 5976
@SP // 5977
AM=M+1 // 5978
A=A-1 // 5979
M=D // 5980
@48 // 5981
D=A // 5982
@SP // 5983
AM=M+1 // 5984
A=A-1 // 5985
M=D // 5986
@24 // 5987
D=A // 5988
@SP // 5989
AM=M+1 // 5990
A=A-1 // 5991
M=D // 5992
@14 // 5993
D=A // 5994
@SP // 5995
AM=M+1 // 5996
A=A-1 // 5997
M=D // 5998
@SP // 5999
AM=M+1 // 6000
A=A-1 // 6001
M=0 // 6002
@SP // 6003
AM=M+1 // 6004
A=A-1 // 6005
M=0 // 6006
// call Output.create
@17 // 6007
D=A // 6008
@14 // 6009
M=D // 6010
@Output.create // 6011
D=A // 6012
@13 // 6013
M=D // 6014
@Output.init.ret.27 // 6015
D=A // 6016
@CALL // 6017
0;JMP // 6018
(Output.init.ret.27)
@SP // 6019
M=M-1 // 6020

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6021
D=A // 6022
@SP // 6023
M=D+M // 6024
@58 // 6025
D=A // 6026
@SP // 6027
A=M-1 // 6028
M=0 // 6029
A=A-1 // 6030
M=0 // 6031
A=A-1 // 6032
M=D // 6033
A=A-1 // 6034
@4 // 6035
D=A // 6036
@SP // 6037
M=D+M // 6038
@12 // 6039
D=A // 6040
@SP // 6041
A=M-1 // 6042
M=0 // 6043
A=A-1 // 6044
M=0 // 6045
A=A-1 // 6046
M=D // 6047
A=A-1 // 6048
M=D // 6049
A=A-1 // 6050
@5 // 6051
D=A // 6052
@SP // 6053
M=D+M // 6054
@12 // 6055
D=A // 6056
@SP // 6057
A=M-1 // 6058
M=0 // 6059
A=A-1 // 6060
M=0 // 6061
A=A-1 // 6062
M=0 // 6063
A=A-1 // 6064
M=D // 6065
A=A-1 // 6066
M=D // 6067
A=A-1 // 6068
// call Output.create
@17 // 6069
D=A // 6070
@14 // 6071
M=D // 6072
@Output.create // 6073
D=A // 6074
@13 // 6075
M=D // 6076
@Output.init.ret.28 // 6077
D=A // 6078
@CALL // 6079
0;JMP // 6080
(Output.init.ret.28)
@SP // 6081
M=M-1 // 6082

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6083
D=A // 6084
@SP // 6085
M=D+M // 6086
@59 // 6087
D=A // 6088
@SP // 6089
A=M-1 // 6090
M=0 // 6091
A=A-1 // 6092
M=0 // 6093
A=A-1 // 6094
M=D // 6095
A=A-1 // 6096
@4 // 6097
D=A // 6098
@SP // 6099
M=D+M // 6100
@12 // 6101
D=A // 6102
@SP // 6103
A=M-1 // 6104
M=0 // 6105
A=A-1 // 6106
M=0 // 6107
A=A-1 // 6108
M=D // 6109
A=A-1 // 6110
M=D // 6111
A=A-1 // 6112
@12 // 6113
D=A // 6114
@SP // 6115
AM=M+1 // 6116
A=A-1 // 6117
M=D // 6118
@12 // 6119
D=A // 6120
@SP // 6121
AM=M+1 // 6122
A=A-1 // 6123
M=D // 6124
@6 // 6125
D=A // 6126
@SP // 6127
AM=M+1 // 6128
A=A-1 // 6129
M=D // 6130
@SP // 6131
AM=M+1 // 6132
A=A-1 // 6133
M=0 // 6134
@SP // 6135
AM=M+1 // 6136
A=A-1 // 6137
M=0 // 6138
// call Output.create
@17 // 6139
D=A // 6140
@14 // 6141
M=D // 6142
@Output.create // 6143
D=A // 6144
@13 // 6145
M=D // 6146
@Output.init.ret.29 // 6147
D=A // 6148
@CALL // 6149
0;JMP // 6150
(Output.init.ret.29)
@SP // 6151
M=M-1 // 6152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6153
D=A // 6154
@SP // 6155
M=D+M // 6156
@60 // 6157
D=A // 6158
@SP // 6159
A=M-1 // 6160
M=0 // 6161
A=A-1 // 6162
M=0 // 6163
A=A-1 // 6164
M=D // 6165
A=A-1 // 6166
@24 // 6167
D=A // 6168
@SP // 6169
AM=M+1 // 6170
A=A-1 // 6171
M=D // 6172
@12 // 6173
D=A // 6174
@SP // 6175
AM=M+1 // 6176
A=A-1 // 6177
M=D // 6178
@6 // 6179
D=A // 6180
@SP // 6181
AM=M+1 // 6182
A=A-1 // 6183
M=D // 6184
@3 // 6185
D=A // 6186
@SP // 6187
AM=M+1 // 6188
A=A-1 // 6189
M=D // 6190
@6 // 6191
D=A // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=D // 6196
@12 // 6197
D=A // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=D // 6202
@24 // 6203
D=A // 6204
@SP // 6205
AM=M+1 // 6206
A=A-1 // 6207
M=D // 6208
@SP // 6209
AM=M+1 // 6210
A=A-1 // 6211
M=0 // 6212
@SP // 6213
AM=M+1 // 6214
A=A-1 // 6215
M=0 // 6216
// call Output.create
@17 // 6217
D=A // 6218
@14 // 6219
M=D // 6220
@Output.create // 6221
D=A // 6222
@13 // 6223
M=D // 6224
@Output.init.ret.30 // 6225
D=A // 6226
@CALL // 6227
0;JMP // 6228
(Output.init.ret.30)
@SP // 6229
M=M-1 // 6230

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6231
D=A // 6232
@SP // 6233
M=D+M // 6234
@61 // 6235
D=A // 6236
@SP // 6237
A=M-1 // 6238
M=0 // 6239
A=A-1 // 6240
M=0 // 6241
A=A-1 // 6242
M=0 // 6243
A=A-1 // 6244
M=D // 6245
A=A-1 // 6246
@3 // 6247
D=A // 6248
@SP // 6249
M=D+M // 6250
@63 // 6251
D=A // 6252
@SP // 6253
A=M-1 // 6254
M=0 // 6255
A=A-1 // 6256
M=0 // 6257
A=A-1 // 6258
M=D // 6259
A=A-1 // 6260
@5 // 6261
D=A // 6262
@SP // 6263
M=D+M // 6264
@63 // 6265
D=A // 6266
@SP // 6267
A=M-1 // 6268
M=0 // 6269
A=A-1 // 6270
M=0 // 6271
A=A-1 // 6272
M=0 // 6273
A=A-1 // 6274
M=0 // 6275
A=A-1 // 6276
M=D // 6277
A=A-1 // 6278
// call Output.create
@17 // 6279
D=A // 6280
@14 // 6281
M=D // 6282
@Output.create // 6283
D=A // 6284
@13 // 6285
M=D // 6286
@Output.init.ret.31 // 6287
D=A // 6288
@CALL // 6289
0;JMP // 6290
(Output.init.ret.31)
@SP // 6291
M=M-1 // 6292

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6293
D=A // 6294
@SP // 6295
M=D+M // 6296
@62 // 6297
D=A // 6298
@SP // 6299
A=M-1 // 6300
M=0 // 6301
A=A-1 // 6302
M=0 // 6303
A=A-1 // 6304
M=D // 6305
A=A-1 // 6306
@3 // 6307
D=A // 6308
@SP // 6309
AM=M+1 // 6310
A=A-1 // 6311
M=D // 6312
@6 // 6313
D=A // 6314
@SP // 6315
AM=M+1 // 6316
A=A-1 // 6317
M=D // 6318
@12 // 6319
D=A // 6320
@SP // 6321
AM=M+1 // 6322
A=A-1 // 6323
M=D // 6324
@24 // 6325
D=A // 6326
@SP // 6327
AM=M+1 // 6328
A=A-1 // 6329
M=D // 6330
@12 // 6331
D=A // 6332
@SP // 6333
AM=M+1 // 6334
A=A-1 // 6335
M=D // 6336
@6 // 6337
D=A // 6338
@SP // 6339
AM=M+1 // 6340
A=A-1 // 6341
M=D // 6342
@3 // 6343
D=A // 6344
@SP // 6345
AM=M+1 // 6346
A=A-1 // 6347
M=D // 6348
@SP // 6349
AM=M+1 // 6350
A=A-1 // 6351
M=0 // 6352
@SP // 6353
AM=M+1 // 6354
A=A-1 // 6355
M=0 // 6356
// call Output.create
@17 // 6357
D=A // 6358
@14 // 6359
M=D // 6360
@Output.create // 6361
D=A // 6362
@13 // 6363
M=D // 6364
@Output.init.ret.32 // 6365
D=A // 6366
@CALL // 6367
0;JMP // 6368
(Output.init.ret.32)
@SP // 6369
M=M-1 // 6370

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6371
D=A // 6372
@SP // 6373
AM=M+1 // 6374
A=A-1 // 6375
M=D // 6376
@30 // 6377
D=A // 6378
@SP // 6379
AM=M+1 // 6380
A=A-1 // 6381
M=D // 6382
@51 // 6383
D=A // 6384
@SP // 6385
AM=M+1 // 6386
A=A-1 // 6387
M=D // 6388
@51 // 6389
D=A // 6390
@SP // 6391
AM=M+1 // 6392
A=A-1 // 6393
M=D // 6394
@59 // 6395
D=A // 6396
@SP // 6397
AM=M+1 // 6398
A=A-1 // 6399
M=D // 6400
@59 // 6401
D=A // 6402
@SP // 6403
AM=M+1 // 6404
A=A-1 // 6405
M=D // 6406
@59 // 6407
D=A // 6408
@SP // 6409
AM=M+1 // 6410
A=A-1 // 6411
M=D // 6412
@27 // 6413
D=A // 6414
@SP // 6415
AM=M+1 // 6416
A=A-1 // 6417
M=D // 6418
@3 // 6419
D=A // 6420
@SP // 6421
AM=M+1 // 6422
A=A-1 // 6423
M=D // 6424
@30 // 6425
D=A // 6426
@SP // 6427
AM=M+1 // 6428
A=A-1 // 6429
M=D // 6430
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
@Output.init.ret.33 // 6447
D=A // 6448
@CALL // 6449
0;JMP // 6450
(Output.init.ret.33)
@SP // 6451
M=M-1 // 6452

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6453
D=A // 6454
@SP // 6455
AM=M+1 // 6456
A=A-1 // 6457
M=D // 6458
@30 // 6459
D=A // 6460
@SP // 6461
AM=M+1 // 6462
A=A-1 // 6463
M=D // 6464
@51 // 6465
D=A // 6466
@SP // 6467
AM=M+1 // 6468
A=A-1 // 6469
M=D // 6470
@51 // 6471
D=A // 6472
@SP // 6473
AM=M+1 // 6474
A=A-1 // 6475
M=D // 6476
@24 // 6477
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
@SP // 6495
AM=M+1 // 6496
A=A-1 // 6497
M=0 // 6498
@4 // 6499
D=A // 6500
@SP // 6501
M=D+M // 6502
@12 // 6503
D=A // 6504
@SP // 6505
A=M-1 // 6506
M=0 // 6507
A=A-1 // 6508
M=0 // 6509
A=A-1 // 6510
M=D // 6511
A=A-1 // 6512
M=D // 6513
A=A-1 // 6514
// call Output.create
@17 // 6515
D=A // 6516
@14 // 6517
M=D // 6518
@Output.create // 6519
D=A // 6520
@13 // 6521
M=D // 6522
@Output.init.ret.34 // 6523
D=A // 6524
@CALL // 6525
0;JMP // 6526
(Output.init.ret.34)
@SP // 6527
M=M-1 // 6528

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6529
D=A // 6530
@SP // 6531
AM=M+1 // 6532
A=A-1 // 6533
M=D // 6534
@12 // 6535
D=A // 6536
@SP // 6537
AM=M+1 // 6538
A=A-1 // 6539
M=D // 6540
@30 // 6541
D=A // 6542
@SP // 6543
AM=M+1 // 6544
A=A-1 // 6545
M=D // 6546
@51 // 6547
D=A // 6548
@SP // 6549
AM=M+1 // 6550
A=A-1 // 6551
M=D // 6552
@51 // 6553
D=A // 6554
@SP // 6555
AM=M+1 // 6556
A=A-1 // 6557
M=D // 6558
@63 // 6559
D=A // 6560
@SP // 6561
AM=M+1 // 6562
A=A-1 // 6563
M=D // 6564
@51 // 6565
D=A // 6566
@SP // 6567
AM=M+1 // 6568
A=A-1 // 6569
M=D // 6570
@51 // 6571
D=A // 6572
@SP // 6573
AM=M+1 // 6574
A=A-1 // 6575
M=D // 6576
@51 // 6577
D=A // 6578
@SP // 6579
AM=M+1 // 6580
A=A-1 // 6581
M=D // 6582
@51 // 6583
D=A // 6584
@SP // 6585
AM=M+1 // 6586
A=A-1 // 6587
M=D // 6588
@SP // 6589
AM=M+1 // 6590
A=A-1 // 6591
M=0 // 6592
@SP // 6593
AM=M+1 // 6594
A=A-1 // 6595
M=0 // 6596
// call Output.create
@17 // 6597
D=A // 6598
@14 // 6599
M=D // 6600
@Output.create // 6601
D=A // 6602
@13 // 6603
M=D // 6604
@Output.init.ret.35 // 6605
D=A // 6606
@CALL // 6607
0;JMP // 6608
(Output.init.ret.35)
@SP // 6609
M=M-1 // 6610

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6611
D=A // 6612
@SP // 6613
AM=M+1 // 6614
A=A-1 // 6615
M=D // 6616
@31 // 6617
D=A // 6618
@SP // 6619
AM=M+1 // 6620
A=A-1 // 6621
M=D // 6622
@51 // 6623
D=A // 6624
@SP // 6625
AM=M+1 // 6626
A=A-1 // 6627
M=D // 6628
@51 // 6629
D=A // 6630
@SP // 6631
AM=M+1 // 6632
A=A-1 // 6633
M=D // 6634
@51 // 6635
D=A // 6636
@SP // 6637
AM=M+1 // 6638
A=A-1 // 6639
M=D // 6640
@31 // 6641
D=A // 6642
@SP // 6643
AM=M+1 // 6644
A=A-1 // 6645
M=D // 6646
@51 // 6647
D=A // 6648
@SP // 6649
AM=M+1 // 6650
A=A-1 // 6651
M=D // 6652
@51 // 6653
D=A // 6654
@SP // 6655
AM=M+1 // 6656
A=A-1 // 6657
M=D // 6658
@51 // 6659
D=A // 6660
@SP // 6661
AM=M+1 // 6662
A=A-1 // 6663
M=D // 6664
@31 // 6665
D=A // 6666
@SP // 6667
AM=M+1 // 6668
A=A-1 // 6669
M=D // 6670
@SP // 6671
AM=M+1 // 6672
A=A-1 // 6673
M=0 // 6674
@SP // 6675
AM=M+1 // 6676
A=A-1 // 6677
M=0 // 6678
// call Output.create
@17 // 6679
D=A // 6680
@14 // 6681
M=D // 6682
@Output.create // 6683
D=A // 6684
@13 // 6685
M=D // 6686
@Output.init.ret.36 // 6687
D=A // 6688
@CALL // 6689
0;JMP // 6690
(Output.init.ret.36)
@SP // 6691
M=M-1 // 6692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6693
D=A // 6694
@SP // 6695
AM=M+1 // 6696
A=A-1 // 6697
M=D // 6698
@28 // 6699
D=A // 6700
@SP // 6701
AM=M+1 // 6702
A=A-1 // 6703
M=D // 6704
@54 // 6705
D=A // 6706
@SP // 6707
AM=M+1 // 6708
A=A-1 // 6709
M=D // 6710
@35 // 6711
D=A // 6712
@SP // 6713
AM=M+1 // 6714
A=A-1 // 6715
M=D // 6716
@3 // 6717
D=A // 6718
@SP // 6719
AM=M+1 // 6720
A=A-1 // 6721
M=D // 6722
@3 // 6723
D=A // 6724
@SP // 6725
AM=M+1 // 6726
A=A-1 // 6727
M=D // 6728
@3 // 6729
D=A // 6730
@SP // 6731
AM=M+1 // 6732
A=A-1 // 6733
M=D // 6734
@35 // 6735
D=A // 6736
@SP // 6737
AM=M+1 // 6738
A=A-1 // 6739
M=D // 6740
@54 // 6741
D=A // 6742
@SP // 6743
AM=M+1 // 6744
A=A-1 // 6745
M=D // 6746
@28 // 6747
D=A // 6748
@SP // 6749
AM=M+1 // 6750
A=A-1 // 6751
M=D // 6752
@SP // 6753
AM=M+1 // 6754
A=A-1 // 6755
M=0 // 6756
@SP // 6757
AM=M+1 // 6758
A=A-1 // 6759
M=0 // 6760
// call Output.create
@17 // 6761
D=A // 6762
@14 // 6763
M=D // 6764
@Output.create // 6765
D=A // 6766
@13 // 6767
M=D // 6768
@Output.init.ret.37 // 6769
D=A // 6770
@CALL // 6771
0;JMP // 6772
(Output.init.ret.37)
@SP // 6773
M=M-1 // 6774

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 6775
D=A // 6776
@SP // 6777
AM=M+1 // 6778
A=A-1 // 6779
M=D // 6780
@15 // 6781
D=A // 6782
@SP // 6783
AM=M+1 // 6784
A=A-1 // 6785
M=D // 6786
@27 // 6787
D=A // 6788
@SP // 6789
AM=M+1 // 6790
A=A-1 // 6791
M=D // 6792
@51 // 6793
D=A // 6794
@SP // 6795
AM=M+1 // 6796
A=A-1 // 6797
M=D // 6798
@51 // 6799
D=A // 6800
@SP // 6801
AM=M+1 // 6802
A=A-1 // 6803
M=D // 6804
@51 // 6805
D=A // 6806
@SP // 6807
AM=M+1 // 6808
A=A-1 // 6809
M=D // 6810
@51 // 6811
D=A // 6812
@SP // 6813
AM=M+1 // 6814
A=A-1 // 6815
M=D // 6816
@51 // 6817
D=A // 6818
@SP // 6819
AM=M+1 // 6820
A=A-1 // 6821
M=D // 6822
@27 // 6823
D=A // 6824
@SP // 6825
AM=M+1 // 6826
A=A-1 // 6827
M=D // 6828
@15 // 6829
D=A // 6830
@SP // 6831
AM=M+1 // 6832
A=A-1 // 6833
M=D // 6834
@SP // 6835
AM=M+1 // 6836
A=A-1 // 6837
M=0 // 6838
@SP // 6839
AM=M+1 // 6840
A=A-1 // 6841
M=0 // 6842
// call Output.create
@17 // 6843
D=A // 6844
@14 // 6845
M=D // 6846
@Output.create // 6847
D=A // 6848
@13 // 6849
M=D // 6850
@Output.init.ret.38 // 6851
D=A // 6852
@CALL // 6853
0;JMP // 6854
(Output.init.ret.38)
@SP // 6855
M=M-1 // 6856

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 6857
D=A // 6858
@SP // 6859
AM=M+1 // 6860
A=A-1 // 6861
M=D // 6862
@63 // 6863
D=A // 6864
@SP // 6865
AM=M+1 // 6866
A=A-1 // 6867
M=D // 6868
@51 // 6869
D=A // 6870
@SP // 6871
AM=M+1 // 6872
A=A-1 // 6873
M=D // 6874
@35 // 6875
D=A // 6876
@SP // 6877
AM=M+1 // 6878
A=A-1 // 6879
M=D // 6880
@11 // 6881
D=A // 6882
@SP // 6883
AM=M+1 // 6884
A=A-1 // 6885
M=D // 6886
@15 // 6887
D=A // 6888
@SP // 6889
AM=M+1 // 6890
A=A-1 // 6891
M=D // 6892
@11 // 6893
D=A // 6894
@SP // 6895
AM=M+1 // 6896
A=A-1 // 6897
M=D // 6898
@35 // 6899
D=A // 6900
@SP // 6901
AM=M+1 // 6902
A=A-1 // 6903
M=D // 6904
@51 // 6905
D=A // 6906
@SP // 6907
AM=M+1 // 6908
A=A-1 // 6909
M=D // 6910
@63 // 6911
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
// call Output.create
@17 // 6925
D=A // 6926
@14 // 6927
M=D // 6928
@Output.create // 6929
D=A // 6930
@13 // 6931
M=D // 6932
@Output.init.ret.39 // 6933
D=A // 6934
@CALL // 6935
0;JMP // 6936
(Output.init.ret.39)
@SP // 6937
M=M-1 // 6938

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 6939
D=A // 6940
@SP // 6941
AM=M+1 // 6942
A=A-1 // 6943
M=D // 6944
@63 // 6945
D=A // 6946
@SP // 6947
AM=M+1 // 6948
A=A-1 // 6949
M=D // 6950
@51 // 6951
D=A // 6952
@SP // 6953
AM=M+1 // 6954
A=A-1 // 6955
M=D // 6956
@35 // 6957
D=A // 6958
@SP // 6959
AM=M+1 // 6960
A=A-1 // 6961
M=D // 6962
@11 // 6963
D=A // 6964
@SP // 6965
AM=M+1 // 6966
A=A-1 // 6967
M=D // 6968
@15 // 6969
D=A // 6970
@SP // 6971
AM=M+1 // 6972
A=A-1 // 6973
M=D // 6974
@11 // 6975
D=A // 6976
@SP // 6977
AM=M+1 // 6978
A=A-1 // 6979
M=D // 6980
@3 // 6981
D=A // 6982
@SP // 6983
AM=M+1 // 6984
A=A-1 // 6985
M=D // 6986
@3 // 6987
D=A // 6988
@SP // 6989
AM=M+1 // 6990
A=A-1 // 6991
M=D // 6992
@3 // 6993
D=A // 6994
@SP // 6995
AM=M+1 // 6996
A=A-1 // 6997
M=D // 6998
@SP // 6999
AM=M+1 // 7000
A=A-1 // 7001
M=0 // 7002
@SP // 7003
AM=M+1 // 7004
A=A-1 // 7005
M=0 // 7006
// call Output.create
@17 // 7007
D=A // 7008
@14 // 7009
M=D // 7010
@Output.create // 7011
D=A // 7012
@13 // 7013
M=D // 7014
@Output.init.ret.40 // 7015
D=A // 7016
@CALL // 7017
0;JMP // 7018
(Output.init.ret.40)
@SP // 7019
M=M-1 // 7020

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7021
D=A // 7022
@SP // 7023
AM=M+1 // 7024
A=A-1 // 7025
M=D // 7026
@28 // 7027
D=A // 7028
@SP // 7029
AM=M+1 // 7030
A=A-1 // 7031
M=D // 7032
@54 // 7033
D=A // 7034
@SP // 7035
AM=M+1 // 7036
A=A-1 // 7037
M=D // 7038
@35 // 7039
D=A // 7040
@SP // 7041
AM=M+1 // 7042
A=A-1 // 7043
M=D // 7044
@3 // 7045
D=A // 7046
@SP // 7047
AM=M+1 // 7048
A=A-1 // 7049
M=D // 7050
@59 // 7051
D=A // 7052
@SP // 7053
AM=M+1 // 7054
A=A-1 // 7055
M=D // 7056
@51 // 7057
D=A // 7058
@SP // 7059
AM=M+1 // 7060
A=A-1 // 7061
M=D // 7062
@51 // 7063
D=A // 7064
@SP // 7065
AM=M+1 // 7066
A=A-1 // 7067
M=D // 7068
@54 // 7069
D=A // 7070
@SP // 7071
AM=M+1 // 7072
A=A-1 // 7073
M=D // 7074
@44 // 7075
D=A // 7076
@SP // 7077
AM=M+1 // 7078
A=A-1 // 7079
M=D // 7080
@SP // 7081
AM=M+1 // 7082
A=A-1 // 7083
M=0 // 7084
@SP // 7085
AM=M+1 // 7086
A=A-1 // 7087
M=0 // 7088
// call Output.create
@17 // 7089
D=A // 7090
@14 // 7091
M=D // 7092
@Output.create // 7093
D=A // 7094
@13 // 7095
M=D // 7096
@Output.init.ret.41 // 7097
D=A // 7098
@CALL // 7099
0;JMP // 7100
(Output.init.ret.41)
@SP // 7101
M=M-1 // 7102

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7103
D=A // 7104
@SP // 7105
AM=M+1 // 7106
A=A-1 // 7107
M=D // 7108
@51 // 7109
D=A // 7110
@SP // 7111
AM=M+1 // 7112
A=A-1 // 7113
M=D // 7114
@51 // 7115
D=A // 7116
@SP // 7117
AM=M+1 // 7118
A=A-1 // 7119
M=D // 7120
@51 // 7121
D=A // 7122
@SP // 7123
AM=M+1 // 7124
A=A-1 // 7125
M=D // 7126
@51 // 7127
D=A // 7128
@SP // 7129
AM=M+1 // 7130
A=A-1 // 7131
M=D // 7132
@63 // 7133
D=A // 7134
@SP // 7135
AM=M+1 // 7136
A=A-1 // 7137
M=D // 7138
@51 // 7139
D=A // 7140
@SP // 7141
AM=M+1 // 7142
A=A-1 // 7143
M=D // 7144
@51 // 7145
D=A // 7146
@SP // 7147
AM=M+1 // 7148
A=A-1 // 7149
M=D // 7150
@51 // 7151
D=A // 7152
@SP // 7153
AM=M+1 // 7154
A=A-1 // 7155
M=D // 7156
@51 // 7157
D=A // 7158
@SP // 7159
AM=M+1 // 7160
A=A-1 // 7161
M=D // 7162
@SP // 7163
AM=M+1 // 7164
A=A-1 // 7165
M=0 // 7166
@SP // 7167
AM=M+1 // 7168
A=A-1 // 7169
M=0 // 7170
// call Output.create
@17 // 7171
D=A // 7172
@14 // 7173
M=D // 7174
@Output.create // 7175
D=A // 7176
@13 // 7177
M=D // 7178
@Output.init.ret.42 // 7179
D=A // 7180
@CALL // 7181
0;JMP // 7182
(Output.init.ret.42)
@SP // 7183
M=M-1 // 7184

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7185
D=A // 7186
@SP // 7187
AM=M+1 // 7188
A=A-1 // 7189
M=D // 7190
@30 // 7191
D=A // 7192
@SP // 7193
AM=M+1 // 7194
A=A-1 // 7195
M=D // 7196
@12 // 7197
D=A // 7198
@SP // 7199
AM=M+1 // 7200
A=A-1 // 7201
M=D // 7202
@12 // 7203
D=A // 7204
@SP // 7205
AM=M+1 // 7206
A=A-1 // 7207
M=D // 7208
@12 // 7209
D=A // 7210
@SP // 7211
AM=M+1 // 7212
A=A-1 // 7213
M=D // 7214
@12 // 7215
D=A // 7216
@SP // 7217
AM=M+1 // 7218
A=A-1 // 7219
M=D // 7220
@12 // 7221
D=A // 7222
@SP // 7223
AM=M+1 // 7224
A=A-1 // 7225
M=D // 7226
@12 // 7227
D=A // 7228
@SP // 7229
AM=M+1 // 7230
A=A-1 // 7231
M=D // 7232
@12 // 7233
D=A // 7234
@SP // 7235
AM=M+1 // 7236
A=A-1 // 7237
M=D // 7238
@30 // 7239
D=A // 7240
@SP // 7241
AM=M+1 // 7242
A=A-1 // 7243
M=D // 7244
@SP // 7245
AM=M+1 // 7246
A=A-1 // 7247
M=0 // 7248
@SP // 7249
AM=M+1 // 7250
A=A-1 // 7251
M=0 // 7252
// call Output.create
@17 // 7253
D=A // 7254
@14 // 7255
M=D // 7256
@Output.create // 7257
D=A // 7258
@13 // 7259
M=D // 7260
@Output.init.ret.43 // 7261
D=A // 7262
@CALL // 7263
0;JMP // 7264
(Output.init.ret.43)
@SP // 7265
M=M-1 // 7266

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7267
D=A // 7268
@SP // 7269
AM=M+1 // 7270
A=A-1 // 7271
M=D // 7272
@60 // 7273
D=A // 7274
@SP // 7275
AM=M+1 // 7276
A=A-1 // 7277
M=D // 7278
@24 // 7279
D=A // 7280
@SP // 7281
AM=M+1 // 7282
A=A-1 // 7283
M=D // 7284
@24 // 7285
D=A // 7286
@SP // 7287
AM=M+1 // 7288
A=A-1 // 7289
M=D // 7290
@24 // 7291
D=A // 7292
@SP // 7293
AM=M+1 // 7294
A=A-1 // 7295
M=D // 7296
@24 // 7297
D=A // 7298
@SP // 7299
AM=M+1 // 7300
A=A-1 // 7301
M=D // 7302
@24 // 7303
D=A // 7304
@SP // 7305
AM=M+1 // 7306
A=A-1 // 7307
M=D // 7308
@27 // 7309
D=A // 7310
@SP // 7311
AM=M+1 // 7312
A=A-1 // 7313
M=D // 7314
@27 // 7315
D=A // 7316
@SP // 7317
AM=M+1 // 7318
A=A-1 // 7319
M=D // 7320
@14 // 7321
D=A // 7322
@SP // 7323
AM=M+1 // 7324
A=A-1 // 7325
M=D // 7326
@SP // 7327
AM=M+1 // 7328
A=A-1 // 7329
M=0 // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=0 // 7334
// call Output.create
@17 // 7335
D=A // 7336
@14 // 7337
M=D // 7338
@Output.create // 7339
D=A // 7340
@13 // 7341
M=D // 7342
@Output.init.ret.44 // 7343
D=A // 7344
@CALL // 7345
0;JMP // 7346
(Output.init.ret.44)
@SP // 7347
M=M-1 // 7348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7349
D=A // 7350
@SP // 7351
AM=M+1 // 7352
A=A-1 // 7353
M=D // 7354
@51 // 7355
D=A // 7356
@SP // 7357
AM=M+1 // 7358
A=A-1 // 7359
M=D // 7360
@51 // 7361
D=A // 7362
@SP // 7363
AM=M+1 // 7364
A=A-1 // 7365
M=D // 7366
@51 // 7367
D=A // 7368
@SP // 7369
AM=M+1 // 7370
A=A-1 // 7371
M=D // 7372
@27 // 7373
D=A // 7374
@SP // 7375
AM=M+1 // 7376
A=A-1 // 7377
M=D // 7378
@15 // 7379
D=A // 7380
@SP // 7381
AM=M+1 // 7382
A=A-1 // 7383
M=D // 7384
@27 // 7385
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
@51 // 7403
D=A // 7404
@SP // 7405
AM=M+1 // 7406
A=A-1 // 7407
M=D // 7408
@SP // 7409
AM=M+1 // 7410
A=A-1 // 7411
M=0 // 7412
@SP // 7413
AM=M+1 // 7414
A=A-1 // 7415
M=0 // 7416
// call Output.create
@17 // 7417
D=A // 7418
@14 // 7419
M=D // 7420
@Output.create // 7421
D=A // 7422
@13 // 7423
M=D // 7424
@Output.init.ret.45 // 7425
D=A // 7426
@CALL // 7427
0;JMP // 7428
(Output.init.ret.45)
@SP // 7429
M=M-1 // 7430

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7431
D=A // 7432
@SP // 7433
AM=M+1 // 7434
A=A-1 // 7435
M=D // 7436
@3 // 7437
D=A // 7438
@SP // 7439
AM=M+1 // 7440
A=A-1 // 7441
M=D // 7442
@3 // 7443
D=A // 7444
@SP // 7445
AM=M+1 // 7446
A=A-1 // 7447
M=D // 7448
@3 // 7449
D=A // 7450
@SP // 7451
AM=M+1 // 7452
A=A-1 // 7453
M=D // 7454
@3 // 7455
D=A // 7456
@SP // 7457
AM=M+1 // 7458
A=A-1 // 7459
M=D // 7460
@3 // 7461
D=A // 7462
@SP // 7463
AM=M+1 // 7464
A=A-1 // 7465
M=D // 7466
@3 // 7467
D=A // 7468
@SP // 7469
AM=M+1 // 7470
A=A-1 // 7471
M=D // 7472
@35 // 7473
D=A // 7474
@SP // 7475
AM=M+1 // 7476
A=A-1 // 7477
M=D // 7478
@51 // 7479
D=A // 7480
@SP // 7481
AM=M+1 // 7482
A=A-1 // 7483
M=D // 7484
@63 // 7485
D=A // 7486
@SP // 7487
AM=M+1 // 7488
A=A-1 // 7489
M=D // 7490
@SP // 7491
AM=M+1 // 7492
A=A-1 // 7493
M=0 // 7494
@SP // 7495
AM=M+1 // 7496
A=A-1 // 7497
M=0 // 7498
// call Output.create
@17 // 7499
D=A // 7500
@14 // 7501
M=D // 7502
@Output.create // 7503
D=A // 7504
@13 // 7505
M=D // 7506
@Output.init.ret.46 // 7507
D=A // 7508
@CALL // 7509
0;JMP // 7510
(Output.init.ret.46)
@SP // 7511
M=M-1 // 7512

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7513
D=A // 7514
@SP // 7515
AM=M+1 // 7516
A=A-1 // 7517
M=D // 7518
@33 // 7519
D=A // 7520
@SP // 7521
AM=M+1 // 7522
A=A-1 // 7523
M=D // 7524
@51 // 7525
D=A // 7526
@SP // 7527
AM=M+1 // 7528
A=A-1 // 7529
M=D // 7530
@63 // 7531
D=A // 7532
@SP // 7533
AM=M+1 // 7534
A=A-1 // 7535
M=D // 7536
@63 // 7537
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
@51 // 7561
D=A // 7562
@SP // 7563
AM=M+1 // 7564
A=A-1 // 7565
M=D // 7566
@51 // 7567
D=A // 7568
@SP // 7569
AM=M+1 // 7570
A=A-1 // 7571
M=D // 7572
@SP // 7573
AM=M+1 // 7574
A=A-1 // 7575
M=0 // 7576
@SP // 7577
AM=M+1 // 7578
A=A-1 // 7579
M=0 // 7580
// call Output.create
@17 // 7581
D=A // 7582
@14 // 7583
M=D // 7584
@Output.create // 7585
D=A // 7586
@13 // 7587
M=D // 7588
@Output.init.ret.47 // 7589
D=A // 7590
@CALL // 7591
0;JMP // 7592
(Output.init.ret.47)
@SP // 7593
M=M-1 // 7594

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7595
D=A // 7596
@SP // 7597
AM=M+1 // 7598
A=A-1 // 7599
M=D // 7600
@51 // 7601
D=A // 7602
@SP // 7603
AM=M+1 // 7604
A=A-1 // 7605
M=D // 7606
@51 // 7607
D=A // 7608
@SP // 7609
AM=M+1 // 7610
A=A-1 // 7611
M=D // 7612
@55 // 7613
D=A // 7614
@SP // 7615
AM=M+1 // 7616
A=A-1 // 7617
M=D // 7618
@55 // 7619
D=A // 7620
@SP // 7621
AM=M+1 // 7622
A=A-1 // 7623
M=D // 7624
@63 // 7625
D=A // 7626
@SP // 7627
AM=M+1 // 7628
A=A-1 // 7629
M=D // 7630
@59 // 7631
D=A // 7632
@SP // 7633
AM=M+1 // 7634
A=A-1 // 7635
M=D // 7636
@59 // 7637
D=A // 7638
@SP // 7639
AM=M+1 // 7640
A=A-1 // 7641
M=D // 7642
@51 // 7643
D=A // 7644
@SP // 7645
AM=M+1 // 7646
A=A-1 // 7647
M=D // 7648
@51 // 7649
D=A // 7650
@SP // 7651
AM=M+1 // 7652
A=A-1 // 7653
M=D // 7654
@SP // 7655
AM=M+1 // 7656
A=A-1 // 7657
M=0 // 7658
@SP // 7659
AM=M+1 // 7660
A=A-1 // 7661
M=0 // 7662
// call Output.create
@17 // 7663
D=A // 7664
@14 // 7665
M=D // 7666
@Output.create // 7667
D=A // 7668
@13 // 7669
M=D // 7670
@Output.init.ret.48 // 7671
D=A // 7672
@CALL // 7673
0;JMP // 7674
(Output.init.ret.48)
@SP // 7675
M=M-1 // 7676

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7677
D=A // 7678
@SP // 7679
AM=M+1 // 7680
A=A-1 // 7681
M=D // 7682
@30 // 7683
D=A // 7684
@SP // 7685
AM=M+1 // 7686
A=A-1 // 7687
M=D // 7688
@51 // 7689
D=A // 7690
@SP // 7691
AM=M+1 // 7692
A=A-1 // 7693
M=D // 7694
@51 // 7695
D=A // 7696
@SP // 7697
AM=M+1 // 7698
A=A-1 // 7699
M=D // 7700
@51 // 7701
D=A // 7702
@SP // 7703
AM=M+1 // 7704
A=A-1 // 7705
M=D // 7706
@51 // 7707
D=A // 7708
@SP // 7709
AM=M+1 // 7710
A=A-1 // 7711
M=D // 7712
@51 // 7713
D=A // 7714
@SP // 7715
AM=M+1 // 7716
A=A-1 // 7717
M=D // 7718
@51 // 7719
D=A // 7720
@SP // 7721
AM=M+1 // 7722
A=A-1 // 7723
M=D // 7724
@51 // 7725
D=A // 7726
@SP // 7727
AM=M+1 // 7728
A=A-1 // 7729
M=D // 7730
@30 // 7731
D=A // 7732
@SP // 7733
AM=M+1 // 7734
A=A-1 // 7735
M=D // 7736
@SP // 7737
AM=M+1 // 7738
A=A-1 // 7739
M=0 // 7740
@SP // 7741
AM=M+1 // 7742
A=A-1 // 7743
M=0 // 7744
// call Output.create
@17 // 7745
D=A // 7746
@14 // 7747
M=D // 7748
@Output.create // 7749
D=A // 7750
@13 // 7751
M=D // 7752
@Output.init.ret.49 // 7753
D=A // 7754
@CALL // 7755
0;JMP // 7756
(Output.init.ret.49)
@SP // 7757
M=M-1 // 7758

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 7759
D=A // 7760
@SP // 7761
AM=M+1 // 7762
A=A-1 // 7763
M=D // 7764
@31 // 7765
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
@51 // 7777
D=A // 7778
@SP // 7779
AM=M+1 // 7780
A=A-1 // 7781
M=D // 7782
@51 // 7783
D=A // 7784
@SP // 7785
AM=M+1 // 7786
A=A-1 // 7787
M=D // 7788
@31 // 7789
D=A // 7790
@SP // 7791
AM=M+1 // 7792
A=A-1 // 7793
M=D // 7794
@3 // 7795
D=A // 7796
@SP // 7797
AM=M+1 // 7798
A=A-1 // 7799
M=D // 7800
@3 // 7801
D=A // 7802
@SP // 7803
AM=M+1 // 7804
A=A-1 // 7805
M=D // 7806
@3 // 7807
D=A // 7808
@SP // 7809
AM=M+1 // 7810
A=A-1 // 7811
M=D // 7812
@3 // 7813
D=A // 7814
@SP // 7815
AM=M+1 // 7816
A=A-1 // 7817
M=D // 7818
@SP // 7819
AM=M+1 // 7820
A=A-1 // 7821
M=0 // 7822
@SP // 7823
AM=M+1 // 7824
A=A-1 // 7825
M=0 // 7826
// call Output.create
@17 // 7827
D=A // 7828
@14 // 7829
M=D // 7830
@Output.create // 7831
D=A // 7832
@13 // 7833
M=D // 7834
@Output.init.ret.50 // 7835
D=A // 7836
@CALL // 7837
0;JMP // 7838
(Output.init.ret.50)
@SP // 7839
M=M-1 // 7840

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 7841
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
@51 // 7865
D=A // 7866
@SP // 7867
AM=M+1 // 7868
A=A-1 // 7869
M=D // 7870
@51 // 7871
D=A // 7872
@SP // 7873
AM=M+1 // 7874
A=A-1 // 7875
M=D // 7876
@51 // 7877
D=A // 7878
@SP // 7879
AM=M+1 // 7880
A=A-1 // 7881
M=D // 7882
@63 // 7883
D=A // 7884
@SP // 7885
AM=M+1 // 7886
A=A-1 // 7887
M=D // 7888
@59 // 7889
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
@48 // 7901
D=A // 7902
@SP // 7903
AM=M+1 // 7904
A=A-1 // 7905
M=D // 7906
@SP // 7907
AM=M+1 // 7908
A=A-1 // 7909
M=0 // 7910
// call Output.create
@17 // 7911
D=A // 7912
@14 // 7913
M=D // 7914
@Output.create // 7915
D=A // 7916
@13 // 7917
M=D // 7918
@Output.init.ret.51 // 7919
D=A // 7920
@CALL // 7921
0;JMP // 7922
(Output.init.ret.51)
@SP // 7923
M=M-1 // 7924

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 7925
D=A // 7926
@SP // 7927
AM=M+1 // 7928
A=A-1 // 7929
M=D // 7930
@31 // 7931
D=A // 7932
@SP // 7933
AM=M+1 // 7934
A=A-1 // 7935
M=D // 7936
@51 // 7937
D=A // 7938
@SP // 7939
AM=M+1 // 7940
A=A-1 // 7941
M=D // 7942
@51 // 7943
D=A // 7944
@SP // 7945
AM=M+1 // 7946
A=A-1 // 7947
M=D // 7948
@51 // 7949
D=A // 7950
@SP // 7951
AM=M+1 // 7952
A=A-1 // 7953
M=D // 7954
@31 // 7955
D=A // 7956
@SP // 7957
AM=M+1 // 7958
A=A-1 // 7959
M=D // 7960
@27 // 7961
D=A // 7962
@SP // 7963
AM=M+1 // 7964
A=A-1 // 7965
M=D // 7966
@51 // 7967
D=A // 7968
@SP // 7969
AM=M+1 // 7970
A=A-1 // 7971
M=D // 7972
@51 // 7973
D=A // 7974
@SP // 7975
AM=M+1 // 7976
A=A-1 // 7977
M=D // 7978
@51 // 7979
D=A // 7980
@SP // 7981
AM=M+1 // 7982
A=A-1 // 7983
M=D // 7984
@SP // 7985
AM=M+1 // 7986
A=A-1 // 7987
M=0 // 7988
@SP // 7989
AM=M+1 // 7990
A=A-1 // 7991
M=0 // 7992
// call Output.create
@17 // 7993
D=A // 7994
@14 // 7995
M=D // 7996
@Output.create // 7997
D=A // 7998
@13 // 7999
M=D // 8000
@Output.init.ret.52 // 8001
D=A // 8002
@CALL // 8003
0;JMP // 8004
(Output.init.ret.52)
@SP // 8005
M=M-1 // 8006

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8007
D=A // 8008
@SP // 8009
AM=M+1 // 8010
A=A-1 // 8011
M=D // 8012
@30 // 8013
D=A // 8014
@SP // 8015
AM=M+1 // 8016
A=A-1 // 8017
M=D // 8018
@51 // 8019
D=A // 8020
@SP // 8021
AM=M+1 // 8022
A=A-1 // 8023
M=D // 8024
@51 // 8025
D=A // 8026
@SP // 8027
AM=M+1 // 8028
A=A-1 // 8029
M=D // 8030
@6 // 8031
D=A // 8032
@SP // 8033
AM=M+1 // 8034
A=A-1 // 8035
M=D // 8036
@28 // 8037
D=A // 8038
@SP // 8039
AM=M+1 // 8040
A=A-1 // 8041
M=D // 8042
@48 // 8043
D=A // 8044
@SP // 8045
AM=M+1 // 8046
A=A-1 // 8047
M=D // 8048
@51 // 8049
D=A // 8050
@SP // 8051
AM=M+1 // 8052
A=A-1 // 8053
M=D // 8054
@51 // 8055
D=A // 8056
@SP // 8057
AM=M+1 // 8058
A=A-1 // 8059
M=D // 8060
@30 // 8061
D=A // 8062
@SP // 8063
AM=M+1 // 8064
A=A-1 // 8065
M=D // 8066
@SP // 8067
AM=M+1 // 8068
A=A-1 // 8069
M=0 // 8070
@SP // 8071
AM=M+1 // 8072
A=A-1 // 8073
M=0 // 8074
// call Output.create
@17 // 8075
D=A // 8076
@14 // 8077
M=D // 8078
@Output.create // 8079
D=A // 8080
@13 // 8081
M=D // 8082
@Output.init.ret.53 // 8083
D=A // 8084
@CALL // 8085
0;JMP // 8086
(Output.init.ret.53)
@SP // 8087
M=M-1 // 8088

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8089
D=A // 8090
@SP // 8091
AM=M+1 // 8092
A=A-1 // 8093
M=D // 8094
@63 // 8095
D=A // 8096
@SP // 8097
AM=M+1 // 8098
A=A-1 // 8099
M=D // 8100
@63 // 8101
D=A // 8102
@SP // 8103
AM=M+1 // 8104
A=A-1 // 8105
M=D // 8106
@45 // 8107
D=A // 8108
@SP // 8109
AM=M+1 // 8110
A=A-1 // 8111
M=D // 8112
@12 // 8113
D=A // 8114
@SP // 8115
AM=M+1 // 8116
A=A-1 // 8117
M=D // 8118
@12 // 8119
D=A // 8120
@SP // 8121
AM=M+1 // 8122
A=A-1 // 8123
M=D // 8124
@12 // 8125
D=A // 8126
@SP // 8127
AM=M+1 // 8128
A=A-1 // 8129
M=D // 8130
@12 // 8131
D=A // 8132
@SP // 8133
AM=M+1 // 8134
A=A-1 // 8135
M=D // 8136
@12 // 8137
D=A // 8138
@SP // 8139
AM=M+1 // 8140
A=A-1 // 8141
M=D // 8142
@30 // 8143
D=A // 8144
@SP // 8145
AM=M+1 // 8146
A=A-1 // 8147
M=D // 8148
@SP // 8149
AM=M+1 // 8150
A=A-1 // 8151
M=0 // 8152
@SP // 8153
AM=M+1 // 8154
A=A-1 // 8155
M=0 // 8156
// call Output.create
@17 // 8157
D=A // 8158
@14 // 8159
M=D // 8160
@Output.create // 8161
D=A // 8162
@13 // 8163
M=D // 8164
@Output.init.ret.54 // 8165
D=A // 8166
@CALL // 8167
0;JMP // 8168
(Output.init.ret.54)
@SP // 8169
M=M-1 // 8170

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8171
D=A // 8172
@SP // 8173
AM=M+1 // 8174
A=A-1 // 8175
M=D // 8176
@51 // 8177
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
@51 // 8189
D=A // 8190
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=D // 8194
@51 // 8195
D=A // 8196
@SP // 8197
AM=M+1 // 8198
A=A-1 // 8199
M=D // 8200
@51 // 8201
D=A // 8202
@SP // 8203
AM=M+1 // 8204
A=A-1 // 8205
M=D // 8206
@51 // 8207
D=A // 8208
@SP // 8209
AM=M+1 // 8210
A=A-1 // 8211
M=D // 8212
@51 // 8213
D=A // 8214
@SP // 8215
AM=M+1 // 8216
A=A-1 // 8217
M=D // 8218
@51 // 8219
D=A // 8220
@SP // 8221
AM=M+1 // 8222
A=A-1 // 8223
M=D // 8224
@30 // 8225
D=A // 8226
@SP // 8227
AM=M+1 // 8228
A=A-1 // 8229
M=D // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=0 // 8234
@SP // 8235
AM=M+1 // 8236
A=A-1 // 8237
M=0 // 8238
// call Output.create
@17 // 8239
D=A // 8240
@14 // 8241
M=D // 8242
@Output.create // 8243
D=A // 8244
@13 // 8245
M=D // 8246
@Output.init.ret.55 // 8247
D=A // 8248
@CALL // 8249
0;JMP // 8250
(Output.init.ret.55)
@SP // 8251
M=M-1 // 8252

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8253
D=A // 8254
@SP // 8255
AM=M+1 // 8256
A=A-1 // 8257
M=D // 8258
@51 // 8259
D=A // 8260
@SP // 8261
AM=M+1 // 8262
A=A-1 // 8263
M=D // 8264
@51 // 8265
D=A // 8266
@SP // 8267
AM=M+1 // 8268
A=A-1 // 8269
M=D // 8270
@51 // 8271
D=A // 8272
@SP // 8273
AM=M+1 // 8274
A=A-1 // 8275
M=D // 8276
@51 // 8277
D=A // 8278
@SP // 8279
AM=M+1 // 8280
A=A-1 // 8281
M=D // 8282
@51 // 8283
D=A // 8284
@SP // 8285
AM=M+1 // 8286
A=A-1 // 8287
M=D // 8288
@30 // 8289
D=A // 8290
@SP // 8291
AM=M+1 // 8292
A=A-1 // 8293
M=D // 8294
@30 // 8295
D=A // 8296
@SP // 8297
AM=M+1 // 8298
A=A-1 // 8299
M=D // 8300
@12 // 8301
D=A // 8302
@SP // 8303
AM=M+1 // 8304
A=A-1 // 8305
M=D // 8306
@12 // 8307
D=A // 8308
@SP // 8309
AM=M+1 // 8310
A=A-1 // 8311
M=D // 8312
@SP // 8313
AM=M+1 // 8314
A=A-1 // 8315
M=0 // 8316
@SP // 8317
AM=M+1 // 8318
A=A-1 // 8319
M=0 // 8320
// call Output.create
@17 // 8321
D=A // 8322
@14 // 8323
M=D // 8324
@Output.create // 8325
D=A // 8326
@13 // 8327
M=D // 8328
@Output.init.ret.56 // 8329
D=A // 8330
@CALL // 8331
0;JMP // 8332
(Output.init.ret.56)
@SP // 8333
M=M-1 // 8334

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8335
D=A // 8336
@SP // 8337
AM=M+1 // 8338
A=A-1 // 8339
M=D // 8340
@51 // 8341
D=A // 8342
@SP // 8343
AM=M+1 // 8344
A=A-1 // 8345
M=D // 8346
@51 // 8347
D=A // 8348
@SP // 8349
AM=M+1 // 8350
A=A-1 // 8351
M=D // 8352
@51 // 8353
D=A // 8354
@SP // 8355
AM=M+1 // 8356
A=A-1 // 8357
M=D // 8358
@51 // 8359
D=A // 8360
@SP // 8361
AM=M+1 // 8362
A=A-1 // 8363
M=D // 8364
@51 // 8365
D=A // 8366
@SP // 8367
AM=M+1 // 8368
A=A-1 // 8369
M=D // 8370
@63 // 8371
D=A // 8372
@SP // 8373
AM=M+1 // 8374
A=A-1 // 8375
M=D // 8376
@63 // 8377
D=A // 8378
@SP // 8379
AM=M+1 // 8380
A=A-1 // 8381
M=D // 8382
@63 // 8383
D=A // 8384
@SP // 8385
AM=M+1 // 8386
A=A-1 // 8387
M=D // 8388
@18 // 8389
D=A // 8390
@SP // 8391
AM=M+1 // 8392
A=A-1 // 8393
M=D // 8394
@SP // 8395
AM=M+1 // 8396
A=A-1 // 8397
M=0 // 8398
@SP // 8399
AM=M+1 // 8400
A=A-1 // 8401
M=0 // 8402
// call Output.create
@17 // 8403
D=A // 8404
@14 // 8405
M=D // 8406
@Output.create // 8407
D=A // 8408
@13 // 8409
M=D // 8410
@Output.init.ret.57 // 8411
D=A // 8412
@CALL // 8413
0;JMP // 8414
(Output.init.ret.57)
@SP // 8415
M=M-1 // 8416

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8417
D=A // 8418
@SP // 8419
AM=M+1 // 8420
A=A-1 // 8421
M=D // 8422
@51 // 8423
D=A // 8424
@SP // 8425
AM=M+1 // 8426
A=A-1 // 8427
M=D // 8428
@51 // 8429
D=A // 8430
@SP // 8431
AM=M+1 // 8432
A=A-1 // 8433
M=D // 8434
@30 // 8435
D=A // 8436
@SP // 8437
AM=M+1 // 8438
A=A-1 // 8439
M=D // 8440
@30 // 8441
D=A // 8442
@SP // 8443
AM=M+1 // 8444
A=A-1 // 8445
M=D // 8446
@12 // 8447
D=A // 8448
@SP // 8449
AM=M+1 // 8450
A=A-1 // 8451
M=D // 8452
@30 // 8453
D=A // 8454
@SP // 8455
AM=M+1 // 8456
A=A-1 // 8457
M=D // 8458
@30 // 8459
D=A // 8460
@SP // 8461
AM=M+1 // 8462
A=A-1 // 8463
M=D // 8464
@51 // 8465
D=A // 8466
@SP // 8467
AM=M+1 // 8468
A=A-1 // 8469
M=D // 8470
@51 // 8471
D=A // 8472
@SP // 8473
AM=M+1 // 8474
A=A-1 // 8475
M=D // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=0 // 8480
@SP // 8481
AM=M+1 // 8482
A=A-1 // 8483
M=0 // 8484
// call Output.create
@17 // 8485
D=A // 8486
@14 // 8487
M=D // 8488
@Output.create // 8489
D=A // 8490
@13 // 8491
M=D // 8492
@Output.init.ret.58 // 8493
D=A // 8494
@CALL // 8495
0;JMP // 8496
(Output.init.ret.58)
@SP // 8497
M=M-1 // 8498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8499
D=A // 8500
@SP // 8501
AM=M+1 // 8502
A=A-1 // 8503
M=D // 8504
@51 // 8505
D=A // 8506
@SP // 8507
AM=M+1 // 8508
A=A-1 // 8509
M=D // 8510
@51 // 8511
D=A // 8512
@SP // 8513
AM=M+1 // 8514
A=A-1 // 8515
M=D // 8516
@51 // 8517
D=A // 8518
@SP // 8519
AM=M+1 // 8520
A=A-1 // 8521
M=D // 8522
@51 // 8523
D=A // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=D // 8528
@30 // 8529
D=A // 8530
@SP // 8531
AM=M+1 // 8532
A=A-1 // 8533
M=D // 8534
@12 // 8535
D=A // 8536
@SP // 8537
AM=M+1 // 8538
A=A-1 // 8539
M=D // 8540
@12 // 8541
D=A // 8542
@SP // 8543
AM=M+1 // 8544
A=A-1 // 8545
M=D // 8546
@12 // 8547
D=A // 8548
@SP // 8549
AM=M+1 // 8550
A=A-1 // 8551
M=D // 8552
@30 // 8553
D=A // 8554
@SP // 8555
AM=M+1 // 8556
A=A-1 // 8557
M=D // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=0 // 8562
@SP // 8563
AM=M+1 // 8564
A=A-1 // 8565
M=0 // 8566
// call Output.create
@17 // 8567
D=A // 8568
@14 // 8569
M=D // 8570
@Output.create // 8571
D=A // 8572
@13 // 8573
M=D // 8574
@Output.init.ret.59 // 8575
D=A // 8576
@CALL // 8577
0;JMP // 8578
(Output.init.ret.59)
@SP // 8579
M=M-1 // 8580

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8581
D=A // 8582
@SP // 8583
AM=M+1 // 8584
A=A-1 // 8585
M=D // 8586
@63 // 8587
D=A // 8588
@SP // 8589
AM=M+1 // 8590
A=A-1 // 8591
M=D // 8592
@51 // 8593
D=A // 8594
@SP // 8595
AM=M+1 // 8596
A=A-1 // 8597
M=D // 8598
@49 // 8599
D=A // 8600
@SP // 8601
AM=M+1 // 8602
A=A-1 // 8603
M=D // 8604
@24 // 8605
D=A // 8606
@SP // 8607
AM=M+1 // 8608
A=A-1 // 8609
M=D // 8610
@12 // 8611
D=A // 8612
@SP // 8613
AM=M+1 // 8614
A=A-1 // 8615
M=D // 8616
@6 // 8617
D=A // 8618
@SP // 8619
AM=M+1 // 8620
A=A-1 // 8621
M=D // 8622
@35 // 8623
D=A // 8624
@SP // 8625
AM=M+1 // 8626
A=A-1 // 8627
M=D // 8628
@51 // 8629
D=A // 8630
@SP // 8631
AM=M+1 // 8632
A=A-1 // 8633
M=D // 8634
@63 // 8635
D=A // 8636
@SP // 8637
AM=M+1 // 8638
A=A-1 // 8639
M=D // 8640
@SP // 8641
AM=M+1 // 8642
A=A-1 // 8643
M=0 // 8644
@SP // 8645
AM=M+1 // 8646
A=A-1 // 8647
M=0 // 8648
// call Output.create
@17 // 8649
D=A // 8650
@14 // 8651
M=D // 8652
@Output.create // 8653
D=A // 8654
@13 // 8655
M=D // 8656
@Output.init.ret.60 // 8657
D=A // 8658
@CALL // 8659
0;JMP // 8660
(Output.init.ret.60)
@SP // 8661
M=M-1 // 8662

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8663
D=A // 8664
@SP // 8665
AM=M+1 // 8666
A=A-1 // 8667
M=D // 8668
@30 // 8669
D=A // 8670
@SP // 8671
AM=M+1 // 8672
A=A-1 // 8673
M=D // 8674
@6 // 8675
D=A // 8676
@SP // 8677
AM=M+1 // 8678
A=A-1 // 8679
M=D // 8680
@6 // 8681
D=A // 8682
@SP // 8683
AM=M+1 // 8684
A=A-1 // 8685
M=D // 8686
@6 // 8687
D=A // 8688
@SP // 8689
AM=M+1 // 8690
A=A-1 // 8691
M=D // 8692
@6 // 8693
D=A // 8694
@SP // 8695
AM=M+1 // 8696
A=A-1 // 8697
M=D // 8698
@6 // 8699
D=A // 8700
@SP // 8701
AM=M+1 // 8702
A=A-1 // 8703
M=D // 8704
@6 // 8705
D=A // 8706
@SP // 8707
AM=M+1 // 8708
A=A-1 // 8709
M=D // 8710
@6 // 8711
D=A // 8712
@SP // 8713
AM=M+1 // 8714
A=A-1 // 8715
M=D // 8716
@30 // 8717
D=A // 8718
@SP // 8719
AM=M+1 // 8720
A=A-1 // 8721
M=D // 8722
@SP // 8723
AM=M+1 // 8724
A=A-1 // 8725
M=0 // 8726
@SP // 8727
AM=M+1 // 8728
A=A-1 // 8729
M=0 // 8730
// call Output.create
@17 // 8731
D=A // 8732
@14 // 8733
M=D // 8734
@Output.create // 8735
D=A // 8736
@13 // 8737
M=D // 8738
@Output.init.ret.61 // 8739
D=A // 8740
@CALL // 8741
0;JMP // 8742
(Output.init.ret.61)
@SP // 8743
M=M-1 // 8744

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8745
D=A // 8746
@SP // 8747
M=D+M // 8748
@92 // 8749
D=A // 8750
@SP // 8751
A=M-1 // 8752
M=1 // 8753
A=A-1 // 8754
M=0 // 8755
A=A-1 // 8756
M=0 // 8757
A=A-1 // 8758
M=D // 8759
A=A-1 // 8760
@3 // 8761
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
@12 // 8773
D=A // 8774
@SP // 8775
AM=M+1 // 8776
A=A-1 // 8777
M=D // 8778
@24 // 8779
D=A // 8780
@SP // 8781
AM=M+1 // 8782
A=A-1 // 8783
M=D // 8784
@48 // 8785
D=A // 8786
@SP // 8787
AM=M+1 // 8788
A=A-1 // 8789
M=D // 8790
@32 // 8791
D=A // 8792
@SP // 8793
AM=M+1 // 8794
A=A-1 // 8795
M=D // 8796
@SP // 8797
AM=M+1 // 8798
A=A-1 // 8799
M=0 // 8800
@SP // 8801
AM=M+1 // 8802
A=A-1 // 8803
M=0 // 8804
// call Output.create
@17 // 8805
D=A // 8806
@14 // 8807
M=D // 8808
@Output.create // 8809
D=A // 8810
@13 // 8811
M=D // 8812
@Output.init.ret.62 // 8813
D=A // 8814
@CALL // 8815
0;JMP // 8816
(Output.init.ret.62)
@SP // 8817
M=M-1 // 8818

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 8819
D=A // 8820
@SP // 8821
AM=M+1 // 8822
A=A-1 // 8823
M=D // 8824
@30 // 8825
D=A // 8826
@SP // 8827
AM=M+1 // 8828
A=A-1 // 8829
M=D // 8830
@24 // 8831
D=A // 8832
@SP // 8833
AM=M+1 // 8834
A=A-1 // 8835
M=D // 8836
@24 // 8837
D=A // 8838
@SP // 8839
AM=M+1 // 8840
A=A-1 // 8841
M=D // 8842
@24 // 8843
D=A // 8844
@SP // 8845
AM=M+1 // 8846
A=A-1 // 8847
M=D // 8848
@24 // 8849
D=A // 8850
@SP // 8851
AM=M+1 // 8852
A=A-1 // 8853
M=D // 8854
@24 // 8855
D=A // 8856
@SP // 8857
AM=M+1 // 8858
A=A-1 // 8859
M=D // 8860
@24 // 8861
D=A // 8862
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=D // 8866
@24 // 8867
D=A // 8868
@SP // 8869
AM=M+1 // 8870
A=A-1 // 8871
M=D // 8872
@30 // 8873
D=A // 8874
@SP // 8875
AM=M+1 // 8876
A=A-1 // 8877
M=D // 8878
@SP // 8879
AM=M+1 // 8880
A=A-1 // 8881
M=0 // 8882
@SP // 8883
AM=M+1 // 8884
A=A-1 // 8885
M=0 // 8886
// call Output.create
@17 // 8887
D=A // 8888
@14 // 8889
M=D // 8890
@Output.create // 8891
D=A // 8892
@13 // 8893
M=D // 8894
@Output.init.ret.63 // 8895
D=A // 8896
@CALL // 8897
0;JMP // 8898
(Output.init.ret.63)
@SP // 8899
M=M-1 // 8900

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 8901
D=A // 8902
@SP // 8903
AM=M+1 // 8904
A=A-1 // 8905
M=D // 8906
@8 // 8907
D=A // 8908
@SP // 8909
AM=M+1 // 8910
A=A-1 // 8911
M=D // 8912
@28 // 8913
D=A // 8914
@SP // 8915
AM=M+1 // 8916
A=A-1 // 8917
M=D // 8918
@54 // 8919
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
@SP // 8933
AM=M+1 // 8934
A=A-1 // 8935
M=0 // 8936
@SP // 8937
AM=M+1 // 8938
A=A-1 // 8939
M=0 // 8940
@SP // 8941
AM=M+1 // 8942
A=A-1 // 8943
M=0 // 8944
@SP // 8945
AM=M+1 // 8946
A=A-1 // 8947
M=0 // 8948
@SP // 8949
AM=M+1 // 8950
A=A-1 // 8951
M=0 // 8952
@SP // 8953
AM=M+1 // 8954
A=A-1 // 8955
M=0 // 8956
// call Output.create
@17 // 8957
D=A // 8958
@14 // 8959
M=D // 8960
@Output.create // 8961
D=A // 8962
@13 // 8963
M=D // 8964
@Output.init.ret.64 // 8965
D=A // 8966
@CALL // 8967
0;JMP // 8968
(Output.init.ret.64)
@SP // 8969
M=M-1 // 8970

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 8971
D=A // 8972
@SP // 8973
M=D+M // 8974
@95 // 8975
D=A // 8976
@SP // 8977
A=M-1 // 8978
M=0 // 8979
A=A-1 // 8980
M=0 // 8981
A=A-1 // 8982
M=0 // 8983
A=A-1 // 8984
M=0 // 8985
A=A-1 // 8986
M=0 // 8987
A=A-1 // 8988
M=0 // 8989
A=A-1 // 8990
M=0 // 8991
A=A-1 // 8992
M=0 // 8993
A=A-1 // 8994
M=0 // 8995
A=A-1 // 8996
M=D // 8997
A=A-1 // 8998
@2 // 8999
D=A // 9000
@SP // 9001
M=D+M // 9002
@63 // 9003
D=A // 9004
@SP // 9005
A=M-1 // 9006
M=0 // 9007
A=A-1 // 9008
M=D // 9009
A=A-1 // 9010
// call Output.create
@17 // 9011
D=A // 9012
@14 // 9013
M=D // 9014
@Output.create // 9015
D=A // 9016
@13 // 9017
M=D // 9018
@Output.init.ret.65 // 9019
D=A // 9020
@CALL // 9021
0;JMP // 9022
(Output.init.ret.65)
@SP // 9023
M=M-1 // 9024

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9025
D=A // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=D // 9030
@6 // 9031
D=A // 9032
@SP // 9033
AM=M+1 // 9034
A=A-1 // 9035
M=D // 9036
@12 // 9037
D=A // 9038
@SP // 9039
AM=M+1 // 9040
A=A-1 // 9041
M=D // 9042
@24 // 9043
D=A // 9044
@SP // 9045
AM=M+1 // 9046
A=A-1 // 9047
M=D // 9048
@SP // 9049
AM=M+1 // 9050
A=A-1 // 9051
M=0 // 9052
@SP // 9053
AM=M+1 // 9054
A=A-1 // 9055
M=0 // 9056
@SP // 9057
AM=M+1 // 9058
A=A-1 // 9059
M=0 // 9060
@SP // 9061
AM=M+1 // 9062
A=A-1 // 9063
M=0 // 9064
@SP // 9065
AM=M+1 // 9066
A=A-1 // 9067
M=0 // 9068
@SP // 9069
AM=M+1 // 9070
A=A-1 // 9071
M=0 // 9072
@SP // 9073
AM=M+1 // 9074
A=A-1 // 9075
M=0 // 9076
@SP // 9077
AM=M+1 // 9078
A=A-1 // 9079
M=0 // 9080
// call Output.create
@17 // 9081
D=A // 9082
@14 // 9083
M=D // 9084
@Output.create // 9085
D=A // 9086
@13 // 9087
M=D // 9088
@Output.init.ret.66 // 9089
D=A // 9090
@CALL // 9091
0;JMP // 9092
(Output.init.ret.66)
@SP // 9093
M=M-1 // 9094

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9095
D=A // 9096
@SP // 9097
M=D+M // 9098
@97 // 9099
D=A // 9100
@SP // 9101
A=M-1 // 9102
M=0 // 9103
A=A-1 // 9104
M=0 // 9105
A=A-1 // 9106
M=0 // 9107
A=A-1 // 9108
M=D // 9109
A=A-1 // 9110
@14 // 9111
D=A // 9112
@SP // 9113
AM=M+1 // 9114
A=A-1 // 9115
M=D // 9116
@24 // 9117
D=A // 9118
@SP // 9119
AM=M+1 // 9120
A=A-1 // 9121
M=D // 9122
@30 // 9123
D=A // 9124
@SP // 9125
AM=M+1 // 9126
A=A-1 // 9127
M=D // 9128
@27 // 9129
D=A // 9130
@SP // 9131
AM=M+1 // 9132
A=A-1 // 9133
M=D // 9134
@27 // 9135
D=A // 9136
@SP // 9137
AM=M+1 // 9138
A=A-1 // 9139
M=D // 9140
@54 // 9141
D=A // 9142
@SP // 9143
AM=M+1 // 9144
A=A-1 // 9145
M=D // 9146
@SP // 9147
AM=M+1 // 9148
A=A-1 // 9149
M=0 // 9150
@SP // 9151
AM=M+1 // 9152
A=A-1 // 9153
M=0 // 9154
// call Output.create
@17 // 9155
D=A // 9156
@14 // 9157
M=D // 9158
@Output.create // 9159
D=A // 9160
@13 // 9161
M=D // 9162
@Output.init.ret.67 // 9163
D=A // 9164
@CALL // 9165
0;JMP // 9166
(Output.init.ret.67)
@SP // 9167
M=M-1 // 9168

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9169
D=A // 9170
@SP // 9171
AM=M+1 // 9172
A=A-1 // 9173
M=D // 9174
@3 // 9175
D=A // 9176
@SP // 9177
AM=M+1 // 9178
A=A-1 // 9179
M=D // 9180
@3 // 9181
D=A // 9182
@SP // 9183
AM=M+1 // 9184
A=A-1 // 9185
M=D // 9186
@3 // 9187
D=A // 9188
@SP // 9189
AM=M+1 // 9190
A=A-1 // 9191
M=D // 9192
@15 // 9193
D=A // 9194
@SP // 9195
AM=M+1 // 9196
A=A-1 // 9197
M=D // 9198
@27 // 9199
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
@51 // 9217
D=A // 9218
@SP // 9219
AM=M+1 // 9220
A=A-1 // 9221
M=D // 9222
@30 // 9223
D=A // 9224
@SP // 9225
AM=M+1 // 9226
A=A-1 // 9227
M=D // 9228
@SP // 9229
AM=M+1 // 9230
A=A-1 // 9231
M=0 // 9232
@SP // 9233
AM=M+1 // 9234
A=A-1 // 9235
M=0 // 9236
// call Output.create
@17 // 9237
D=A // 9238
@14 // 9239
M=D // 9240
@Output.create // 9241
D=A // 9242
@13 // 9243
M=D // 9244
@Output.init.ret.68 // 9245
D=A // 9246
@CALL // 9247
0;JMP // 9248
(Output.init.ret.68)
@SP // 9249
M=M-1 // 9250

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9251
D=A // 9252
@SP // 9253
M=D+M // 9254
@99 // 9255
D=A // 9256
@SP // 9257
A=M-1 // 9258
M=0 // 9259
A=A-1 // 9260
M=0 // 9261
A=A-1 // 9262
M=0 // 9263
A=A-1 // 9264
M=D // 9265
A=A-1 // 9266
@30 // 9267
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
@3 // 9279
D=A // 9280
@SP // 9281
AM=M+1 // 9282
A=A-1 // 9283
M=D // 9284
@3 // 9285
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
@30 // 9297
D=A // 9298
@SP // 9299
AM=M+1 // 9300
A=A-1 // 9301
M=D // 9302
@SP // 9303
AM=M+1 // 9304
A=A-1 // 9305
M=0 // 9306
@SP // 9307
AM=M+1 // 9308
A=A-1 // 9309
M=0 // 9310
// call Output.create
@17 // 9311
D=A // 9312
@14 // 9313
M=D // 9314
@Output.create // 9315
D=A // 9316
@13 // 9317
M=D // 9318
@Output.init.ret.69 // 9319
D=A // 9320
@CALL // 9321
0;JMP // 9322
(Output.init.ret.69)
@SP // 9323
M=M-1 // 9324

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9325
D=A // 9326
@SP // 9327
AM=M+1 // 9328
A=A-1 // 9329
M=D // 9330
@48 // 9331
D=A // 9332
@SP // 9333
AM=M+1 // 9334
A=A-1 // 9335
M=D // 9336
@48 // 9337
D=A // 9338
@SP // 9339
AM=M+1 // 9340
A=A-1 // 9341
M=D // 9342
@48 // 9343
D=A // 9344
@SP // 9345
AM=M+1 // 9346
A=A-1 // 9347
M=D // 9348
@60 // 9349
D=A // 9350
@SP // 9351
AM=M+1 // 9352
A=A-1 // 9353
M=D // 9354
@54 // 9355
D=A // 9356
@SP // 9357
AM=M+1 // 9358
A=A-1 // 9359
M=D // 9360
@51 // 9361
D=A // 9362
@SP // 9363
AM=M+1 // 9364
A=A-1 // 9365
M=D // 9366
@51 // 9367
D=A // 9368
@SP // 9369
AM=M+1 // 9370
A=A-1 // 9371
M=D // 9372
@51 // 9373
D=A // 9374
@SP // 9375
AM=M+1 // 9376
A=A-1 // 9377
M=D // 9378
@30 // 9379
D=A // 9380
@SP // 9381
AM=M+1 // 9382
A=A-1 // 9383
M=D // 9384
@SP // 9385
AM=M+1 // 9386
A=A-1 // 9387
M=0 // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=0 // 9392
// call Output.create
@17 // 9393
D=A // 9394
@14 // 9395
M=D // 9396
@Output.create // 9397
D=A // 9398
@13 // 9399
M=D // 9400
@Output.init.ret.70 // 9401
D=A // 9402
@CALL // 9403
0;JMP // 9404
(Output.init.ret.70)
@SP // 9405
M=M-1 // 9406

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9407
D=A // 9408
@SP // 9409
M=D+M // 9410
@101 // 9411
D=A // 9412
@SP // 9413
A=M-1 // 9414
M=0 // 9415
A=A-1 // 9416
M=0 // 9417
A=A-1 // 9418
M=0 // 9419
A=A-1 // 9420
M=D // 9421
A=A-1 // 9422
@30 // 9423
D=A // 9424
@SP // 9425
AM=M+1 // 9426
A=A-1 // 9427
M=D // 9428
@51 // 9429
D=A // 9430
@SP // 9431
AM=M+1 // 9432
A=A-1 // 9433
M=D // 9434
@63 // 9435
D=A // 9436
@SP // 9437
AM=M+1 // 9438
A=A-1 // 9439
M=D // 9440
@3 // 9441
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
@30 // 9453
D=A // 9454
@SP // 9455
AM=M+1 // 9456
A=A-1 // 9457
M=D // 9458
@SP // 9459
AM=M+1 // 9460
A=A-1 // 9461
M=0 // 9462
@SP // 9463
AM=M+1 // 9464
A=A-1 // 9465
M=0 // 9466
// call Output.create
@17 // 9467
D=A // 9468
@14 // 9469
M=D // 9470
@Output.create // 9471
D=A // 9472
@13 // 9473
M=D // 9474
@Output.init.ret.71 // 9475
D=A // 9476
@CALL // 9477
0;JMP // 9478
(Output.init.ret.71)
@SP // 9479
M=M-1 // 9480

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9481
D=A // 9482
@SP // 9483
AM=M+1 // 9484
A=A-1 // 9485
M=D // 9486
@28 // 9487
D=A // 9488
@SP // 9489
AM=M+1 // 9490
A=A-1 // 9491
M=D // 9492
@54 // 9493
D=A // 9494
@SP // 9495
AM=M+1 // 9496
A=A-1 // 9497
M=D // 9498
@38 // 9499
D=A // 9500
@SP // 9501
AM=M+1 // 9502
A=A-1 // 9503
M=D // 9504
@6 // 9505
D=A // 9506
@SP // 9507
AM=M+1 // 9508
A=A-1 // 9509
M=D // 9510
@15 // 9511
D=A // 9512
@SP // 9513
AM=M+1 // 9514
A=A-1 // 9515
M=D // 9516
@6 // 9517
D=A // 9518
@SP // 9519
AM=M+1 // 9520
A=A-1 // 9521
M=D // 9522
@6 // 9523
D=A // 9524
@SP // 9525
AM=M+1 // 9526
A=A-1 // 9527
M=D // 9528
@6 // 9529
D=A // 9530
@SP // 9531
AM=M+1 // 9532
A=A-1 // 9533
M=D // 9534
@15 // 9535
D=A // 9536
@SP // 9537
AM=M+1 // 9538
A=A-1 // 9539
M=D // 9540
@SP // 9541
AM=M+1 // 9542
A=A-1 // 9543
M=0 // 9544
@SP // 9545
AM=M+1 // 9546
A=A-1 // 9547
M=0 // 9548
// call Output.create
@17 // 9549
D=A // 9550
@14 // 9551
M=D // 9552
@Output.create // 9553
D=A // 9554
@13 // 9555
M=D // 9556
@Output.init.ret.72 // 9557
D=A // 9558
@CALL // 9559
0;JMP // 9560
(Output.init.ret.72)
@SP // 9561
M=M-1 // 9562

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9563
D=A // 9564
@SP // 9565
M=D+M // 9566
@103 // 9567
D=A // 9568
@SP // 9569
A=M-1 // 9570
M=0 // 9571
A=A-1 // 9572
M=0 // 9573
A=A-1 // 9574
M=D // 9575
A=A-1 // 9576
@30 // 9577
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
@51 // 9595
D=A // 9596
@SP // 9597
AM=M+1 // 9598
A=A-1 // 9599
M=D // 9600
@62 // 9601
D=A // 9602
@SP // 9603
AM=M+1 // 9604
A=A-1 // 9605
M=D // 9606
@48 // 9607
D=A // 9608
@SP // 9609
AM=M+1 // 9610
A=A-1 // 9611
M=D // 9612
@51 // 9613
D=A // 9614
@SP // 9615
AM=M+1 // 9616
A=A-1 // 9617
M=D // 9618
@30 // 9619
D=A // 9620
@SP // 9621
AM=M+1 // 9622
A=A-1 // 9623
M=D // 9624
@SP // 9625
AM=M+1 // 9626
A=A-1 // 9627
M=0 // 9628
// call Output.create
@17 // 9629
D=A // 9630
@14 // 9631
M=D // 9632
@Output.create // 9633
D=A // 9634
@13 // 9635
M=D // 9636
@Output.init.ret.73 // 9637
D=A // 9638
@CALL // 9639
0;JMP // 9640
(Output.init.ret.73)
@SP // 9641
M=M-1 // 9642

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9643
D=A // 9644
@SP // 9645
AM=M+1 // 9646
A=A-1 // 9647
M=D // 9648
@3 // 9649
D=A // 9650
@SP // 9651
AM=M+1 // 9652
A=A-1 // 9653
M=D // 9654
@3 // 9655
D=A // 9656
@SP // 9657
AM=M+1 // 9658
A=A-1 // 9659
M=D // 9660
@3 // 9661
D=A // 9662
@SP // 9663
AM=M+1 // 9664
A=A-1 // 9665
M=D // 9666
@27 // 9667
D=A // 9668
@SP // 9669
AM=M+1 // 9670
A=A-1 // 9671
M=D // 9672
@55 // 9673
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
@51 // 9691
D=A // 9692
@SP // 9693
AM=M+1 // 9694
A=A-1 // 9695
M=D // 9696
@51 // 9697
D=A // 9698
@SP // 9699
AM=M+1 // 9700
A=A-1 // 9701
M=D // 9702
@SP // 9703
AM=M+1 // 9704
A=A-1 // 9705
M=0 // 9706
@SP // 9707
AM=M+1 // 9708
A=A-1 // 9709
M=0 // 9710
// call Output.create
@17 // 9711
D=A // 9712
@14 // 9713
M=D // 9714
@Output.create // 9715
D=A // 9716
@13 // 9717
M=D // 9718
@Output.init.ret.74 // 9719
D=A // 9720
@CALL // 9721
0;JMP // 9722
(Output.init.ret.74)
@SP // 9723
M=M-1 // 9724

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9725
D=A // 9726
@SP // 9727
AM=M+1 // 9728
A=A-1 // 9729
M=D // 9730
@12 // 9731
D=A // 9732
@SP // 9733
AM=M+1 // 9734
A=A-1 // 9735
M=D // 9736
@12 // 9737
D=A // 9738
@SP // 9739
AM=M+1 // 9740
A=A-1 // 9741
M=D // 9742
@SP // 9743
AM=M+1 // 9744
A=A-1 // 9745
M=0 // 9746
@14 // 9747
D=A // 9748
@SP // 9749
AM=M+1 // 9750
A=A-1 // 9751
M=D // 9752
@12 // 9753
D=A // 9754
@SP // 9755
AM=M+1 // 9756
A=A-1 // 9757
M=D // 9758
@12 // 9759
D=A // 9760
@SP // 9761
AM=M+1 // 9762
A=A-1 // 9763
M=D // 9764
@12 // 9765
D=A // 9766
@SP // 9767
AM=M+1 // 9768
A=A-1 // 9769
M=D // 9770
@12 // 9771
D=A // 9772
@SP // 9773
AM=M+1 // 9774
A=A-1 // 9775
M=D // 9776
@30 // 9777
D=A // 9778
@SP // 9779
AM=M+1 // 9780
A=A-1 // 9781
M=D // 9782
@SP // 9783
AM=M+1 // 9784
A=A-1 // 9785
M=0 // 9786
@SP // 9787
AM=M+1 // 9788
A=A-1 // 9789
M=0 // 9790
// call Output.create
@17 // 9791
D=A // 9792
@14 // 9793
M=D // 9794
@Output.create // 9795
D=A // 9796
@13 // 9797
M=D // 9798
@Output.init.ret.75 // 9799
D=A // 9800
@CALL // 9801
0;JMP // 9802
(Output.init.ret.75)
@SP // 9803
M=M-1 // 9804

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 9805
D=A // 9806
@SP // 9807
AM=M+1 // 9808
A=A-1 // 9809
M=D // 9810
@48 // 9811
D=A // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=D // 9816
@48 // 9817
D=A // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=D // 9822
@SP // 9823
AM=M+1 // 9824
A=A-1 // 9825
M=0 // 9826
@56 // 9827
D=A // 9828
@SP // 9829
AM=M+1 // 9830
A=A-1 // 9831
M=D // 9832
@48 // 9833
D=A // 9834
@SP // 9835
AM=M+1 // 9836
A=A-1 // 9837
M=D // 9838
@48 // 9839
D=A // 9840
@SP // 9841
AM=M+1 // 9842
A=A-1 // 9843
M=D // 9844
@48 // 9845
D=A // 9846
@SP // 9847
AM=M+1 // 9848
A=A-1 // 9849
M=D // 9850
@48 // 9851
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
// call Output.create
@17 // 9873
D=A // 9874
@14 // 9875
M=D // 9876
@Output.create // 9877
D=A // 9878
@13 // 9879
M=D // 9880
@Output.init.ret.76 // 9881
D=A // 9882
@CALL // 9883
0;JMP // 9884
(Output.init.ret.76)
@SP // 9885
M=M-1 // 9886

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 9887
D=A // 9888
@SP // 9889
AM=M+1 // 9890
A=A-1 // 9891
M=D // 9892
@3 // 9893
D=A // 9894
@SP // 9895
AM=M+1 // 9896
A=A-1 // 9897
M=D // 9898
@3 // 9899
D=A // 9900
@SP // 9901
AM=M+1 // 9902
A=A-1 // 9903
M=D // 9904
@3 // 9905
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
@27 // 9917
D=A // 9918
@SP // 9919
AM=M+1 // 9920
A=A-1 // 9921
M=D // 9922
@15 // 9923
D=A // 9924
@SP // 9925
AM=M+1 // 9926
A=A-1 // 9927
M=D // 9928
@15 // 9929
D=A // 9930
@SP // 9931
AM=M+1 // 9932
A=A-1 // 9933
M=D // 9934
@27 // 9935
D=A // 9936
@SP // 9937
AM=M+1 // 9938
A=A-1 // 9939
M=D // 9940
@51 // 9941
D=A // 9942
@SP // 9943
AM=M+1 // 9944
A=A-1 // 9945
M=D // 9946
@SP // 9947
AM=M+1 // 9948
A=A-1 // 9949
M=0 // 9950
@SP // 9951
AM=M+1 // 9952
A=A-1 // 9953
M=0 // 9954
// call Output.create
@17 // 9955
D=A // 9956
@14 // 9957
M=D // 9958
@Output.create // 9959
D=A // 9960
@13 // 9961
M=D // 9962
@Output.init.ret.77 // 9963
D=A // 9964
@CALL // 9965
0;JMP // 9966
(Output.init.ret.77)
@SP // 9967
M=M-1 // 9968

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 9969
D=A // 9970
@SP // 9971
AM=M+1 // 9972
A=A-1 // 9973
M=D // 9974
@14 // 9975
D=A // 9976
@SP // 9977
AM=M+1 // 9978
A=A-1 // 9979
M=D // 9980
@12 // 9981
D=A // 9982
@SP // 9983
AM=M+1 // 9984
A=A-1 // 9985
M=D // 9986
@12 // 9987
D=A // 9988
@SP // 9989
AM=M+1 // 9990
A=A-1 // 9991
M=D // 9992
@12 // 9993
D=A // 9994
@SP // 9995
AM=M+1 // 9996
A=A-1 // 9997
M=D // 9998
@12 // 9999
D=A // 10000
@SP // 10001
AM=M+1 // 10002
A=A-1 // 10003
M=D // 10004
@12 // 10005
D=A // 10006
@SP // 10007
AM=M+1 // 10008
A=A-1 // 10009
M=D // 10010
@12 // 10011
D=A // 10012
@SP // 10013
AM=M+1 // 10014
A=A-1 // 10015
M=D // 10016
@12 // 10017
D=A // 10018
@SP // 10019
AM=M+1 // 10020
A=A-1 // 10021
M=D // 10022
@30 // 10023
D=A // 10024
@SP // 10025
AM=M+1 // 10026
A=A-1 // 10027
M=D // 10028
@SP // 10029
AM=M+1 // 10030
A=A-1 // 10031
M=0 // 10032
@SP // 10033
AM=M+1 // 10034
A=A-1 // 10035
M=0 // 10036
// call Output.create
@17 // 10037
D=A // 10038
@14 // 10039
M=D // 10040
@Output.create // 10041
D=A // 10042
@13 // 10043
M=D // 10044
@Output.init.ret.78 // 10045
D=A // 10046
@CALL // 10047
0;JMP // 10048
(Output.init.ret.78)
@SP // 10049
M=M-1 // 10050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10051
D=A // 10052
@SP // 10053
M=D+M // 10054
@109 // 10055
D=A // 10056
@SP // 10057
A=M-1 // 10058
M=0 // 10059
A=A-1 // 10060
M=0 // 10061
A=A-1 // 10062
M=0 // 10063
A=A-1 // 10064
M=D // 10065
A=A-1 // 10066
@29 // 10067
D=A // 10068
@SP // 10069
AM=M+1 // 10070
A=A-1 // 10071
M=D // 10072
@63 // 10073
D=A // 10074
@SP // 10075
AM=M+1 // 10076
A=A-1 // 10077
M=D // 10078
@43 // 10079
D=A // 10080
@SP // 10081
AM=M+1 // 10082
A=A-1 // 10083
M=D // 10084
@43 // 10085
D=A // 10086
@SP // 10087
AM=M+1 // 10088
A=A-1 // 10089
M=D // 10090
@43 // 10091
D=A // 10092
@SP // 10093
AM=M+1 // 10094
A=A-1 // 10095
M=D // 10096
@43 // 10097
D=A // 10098
@SP // 10099
AM=M+1 // 10100
A=A-1 // 10101
M=D // 10102
@SP // 10103
AM=M+1 // 10104
A=A-1 // 10105
M=0 // 10106
@SP // 10107
AM=M+1 // 10108
A=A-1 // 10109
M=0 // 10110
// call Output.create
@17 // 10111
D=A // 10112
@14 // 10113
M=D // 10114
@Output.create // 10115
D=A // 10116
@13 // 10117
M=D // 10118
@Output.init.ret.79 // 10119
D=A // 10120
@CALL // 10121
0;JMP // 10122
(Output.init.ret.79)
@SP // 10123
M=M-1 // 10124

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10125
D=A // 10126
@SP // 10127
M=D+M // 10128
@110 // 10129
D=A // 10130
@SP // 10131
A=M-1 // 10132
M=0 // 10133
A=A-1 // 10134
M=0 // 10135
A=A-1 // 10136
M=0 // 10137
A=A-1 // 10138
M=D // 10139
A=A-1 // 10140
@29 // 10141
D=A // 10142
@SP // 10143
AM=M+1 // 10144
A=A-1 // 10145
M=D // 10146
@51 // 10147
D=A // 10148
@SP // 10149
AM=M+1 // 10150
A=A-1 // 10151
M=D // 10152
@51 // 10153
D=A // 10154
@SP // 10155
AM=M+1 // 10156
A=A-1 // 10157
M=D // 10158
@51 // 10159
D=A // 10160
@SP // 10161
AM=M+1 // 10162
A=A-1 // 10163
M=D // 10164
@51 // 10165
D=A // 10166
@SP // 10167
AM=M+1 // 10168
A=A-1 // 10169
M=D // 10170
@51 // 10171
D=A // 10172
@SP // 10173
AM=M+1 // 10174
A=A-1 // 10175
M=D // 10176
@SP // 10177
AM=M+1 // 10178
A=A-1 // 10179
M=0 // 10180
@SP // 10181
AM=M+1 // 10182
A=A-1 // 10183
M=0 // 10184
// call Output.create
@17 // 10185
D=A // 10186
@14 // 10187
M=D // 10188
@Output.create // 10189
D=A // 10190
@13 // 10191
M=D // 10192
@Output.init.ret.80 // 10193
D=A // 10194
@CALL // 10195
0;JMP // 10196
(Output.init.ret.80)
@SP // 10197
M=M-1 // 10198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10199
D=A // 10200
@SP // 10201
M=D+M // 10202
@111 // 10203
D=A // 10204
@SP // 10205
A=M-1 // 10206
M=0 // 10207
A=A-1 // 10208
M=0 // 10209
A=A-1 // 10210
M=0 // 10211
A=A-1 // 10212
M=D // 10213
A=A-1 // 10214
@30 // 10215
D=A // 10216
@SP // 10217
AM=M+1 // 10218
A=A-1 // 10219
M=D // 10220
@51 // 10221
D=A // 10222
@SP // 10223
AM=M+1 // 10224
A=A-1 // 10225
M=D // 10226
@51 // 10227
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
@30 // 10245
D=A // 10246
@SP // 10247
AM=M+1 // 10248
A=A-1 // 10249
M=D // 10250
@SP // 10251
AM=M+1 // 10252
A=A-1 // 10253
M=0 // 10254
@SP // 10255
AM=M+1 // 10256
A=A-1 // 10257
M=0 // 10258
// call Output.create
@17 // 10259
D=A // 10260
@14 // 10261
M=D // 10262
@Output.create // 10263
D=A // 10264
@13 // 10265
M=D // 10266
@Output.init.ret.81 // 10267
D=A // 10268
@CALL // 10269
0;JMP // 10270
(Output.init.ret.81)
@SP // 10271
M=M-1 // 10272

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10273
D=A // 10274
@SP // 10275
M=D+M // 10276
@112 // 10277
D=A // 10278
@SP // 10279
A=M-1 // 10280
M=0 // 10281
A=A-1 // 10282
M=0 // 10283
A=A-1 // 10284
M=0 // 10285
A=A-1 // 10286
M=D // 10287
A=A-1 // 10288
@30 // 10289
D=A // 10290
@SP // 10291
AM=M+1 // 10292
A=A-1 // 10293
M=D // 10294
@51 // 10295
D=A // 10296
@SP // 10297
AM=M+1 // 10298
A=A-1 // 10299
M=D // 10300
@51 // 10301
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
@31 // 10313
D=A // 10314
@SP // 10315
AM=M+1 // 10316
A=A-1 // 10317
M=D // 10318
@3 // 10319
D=A // 10320
@SP // 10321
AM=M+1 // 10322
A=A-1 // 10323
M=D // 10324
@3 // 10325
D=A // 10326
@SP // 10327
AM=M+1 // 10328
A=A-1 // 10329
M=D // 10330
@SP // 10331
AM=M+1 // 10332
A=A-1 // 10333
M=0 // 10334
// call Output.create
@17 // 10335
D=A // 10336
@14 // 10337
M=D // 10338
@Output.create // 10339
D=A // 10340
@13 // 10341
M=D // 10342
@Output.init.ret.82 // 10343
D=A // 10344
@CALL // 10345
0;JMP // 10346
(Output.init.ret.82)
@SP // 10347
M=M-1 // 10348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10349
D=A // 10350
@SP // 10351
M=D+M // 10352
@113 // 10353
D=A // 10354
@SP // 10355
A=M-1 // 10356
M=0 // 10357
A=A-1 // 10358
M=0 // 10359
A=A-1 // 10360
M=0 // 10361
A=A-1 // 10362
M=D // 10363
A=A-1 // 10364
@30 // 10365
D=A // 10366
@SP // 10367
AM=M+1 // 10368
A=A-1 // 10369
M=D // 10370
@51 // 10371
D=A // 10372
@SP // 10373
AM=M+1 // 10374
A=A-1 // 10375
M=D // 10376
@51 // 10377
D=A // 10378
@SP // 10379
AM=M+1 // 10380
A=A-1 // 10381
M=D // 10382
@51 // 10383
D=A // 10384
@SP // 10385
AM=M+1 // 10386
A=A-1 // 10387
M=D // 10388
@62 // 10389
D=A // 10390
@SP // 10391
AM=M+1 // 10392
A=A-1 // 10393
M=D // 10394
@48 // 10395
D=A // 10396
@SP // 10397
AM=M+1 // 10398
A=A-1 // 10399
M=D // 10400
@48 // 10401
D=A // 10402
@SP // 10403
AM=M+1 // 10404
A=A-1 // 10405
M=D // 10406
@SP // 10407
AM=M+1 // 10408
A=A-1 // 10409
M=0 // 10410
// call Output.create
@17 // 10411
D=A // 10412
@14 // 10413
M=D // 10414
@Output.create // 10415
D=A // 10416
@13 // 10417
M=D // 10418
@Output.init.ret.83 // 10419
D=A // 10420
@CALL // 10421
0;JMP // 10422
(Output.init.ret.83)
@SP // 10423
M=M-1 // 10424

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10425
D=A // 10426
@SP // 10427
M=D+M // 10428
@114 // 10429
D=A // 10430
@SP // 10431
A=M-1 // 10432
M=0 // 10433
A=A-1 // 10434
M=0 // 10435
A=A-1 // 10436
M=0 // 10437
A=A-1 // 10438
M=D // 10439
A=A-1 // 10440
@29 // 10441
D=A // 10442
@SP // 10443
AM=M+1 // 10444
A=A-1 // 10445
M=D // 10446
@55 // 10447
D=A // 10448
@SP // 10449
AM=M+1 // 10450
A=A-1 // 10451
M=D // 10452
@51 // 10453
D=A // 10454
@SP // 10455
AM=M+1 // 10456
A=A-1 // 10457
M=D // 10458
@3 // 10459
D=A // 10460
@SP // 10461
AM=M+1 // 10462
A=A-1 // 10463
M=D // 10464
@3 // 10465
D=A // 10466
@SP // 10467
AM=M+1 // 10468
A=A-1 // 10469
M=D // 10470
@7 // 10471
D=A // 10472
@SP // 10473
AM=M+1 // 10474
A=A-1 // 10475
M=D // 10476
@SP // 10477
AM=M+1 // 10478
A=A-1 // 10479
M=0 // 10480
@SP // 10481
AM=M+1 // 10482
A=A-1 // 10483
M=0 // 10484
// call Output.create
@17 // 10485
D=A // 10486
@14 // 10487
M=D // 10488
@Output.create // 10489
D=A // 10490
@13 // 10491
M=D // 10492
@Output.init.ret.84 // 10493
D=A // 10494
@CALL // 10495
0;JMP // 10496
(Output.init.ret.84)
@SP // 10497
M=M-1 // 10498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10499
D=A // 10500
@SP // 10501
M=D+M // 10502
@115 // 10503
D=A // 10504
@SP // 10505
A=M-1 // 10506
M=0 // 10507
A=A-1 // 10508
M=0 // 10509
A=A-1 // 10510
M=0 // 10511
A=A-1 // 10512
M=D // 10513
A=A-1 // 10514
@30 // 10515
D=A // 10516
@SP // 10517
AM=M+1 // 10518
A=A-1 // 10519
M=D // 10520
@51 // 10521
D=A // 10522
@SP // 10523
AM=M+1 // 10524
A=A-1 // 10525
M=D // 10526
@6 // 10527
D=A // 10528
@SP // 10529
AM=M+1 // 10530
A=A-1 // 10531
M=D // 10532
@24 // 10533
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
@30 // 10545
D=A // 10546
@SP // 10547
AM=M+1 // 10548
A=A-1 // 10549
M=D // 10550
@SP // 10551
AM=M+1 // 10552
A=A-1 // 10553
M=0 // 10554
@SP // 10555
AM=M+1 // 10556
A=A-1 // 10557
M=0 // 10558
// call Output.create
@17 // 10559
D=A // 10560
@14 // 10561
M=D // 10562
@Output.create // 10563
D=A // 10564
@13 // 10565
M=D // 10566
@Output.init.ret.85 // 10567
D=A // 10568
@CALL // 10569
0;JMP // 10570
(Output.init.ret.85)
@SP // 10571
M=M-1 // 10572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10573
D=A // 10574
@SP // 10575
AM=M+1 // 10576
A=A-1 // 10577
M=D // 10578
@4 // 10579
D=A // 10580
@SP // 10581
AM=M+1 // 10582
A=A-1 // 10583
M=D // 10584
@6 // 10585
D=A // 10586
@SP // 10587
AM=M+1 // 10588
A=A-1 // 10589
M=D // 10590
@6 // 10591
D=A // 10592
@SP // 10593
AM=M+1 // 10594
A=A-1 // 10595
M=D // 10596
@15 // 10597
D=A // 10598
@SP // 10599
AM=M+1 // 10600
A=A-1 // 10601
M=D // 10602
@6 // 10603
D=A // 10604
@SP // 10605
AM=M+1 // 10606
A=A-1 // 10607
M=D // 10608
@6 // 10609
D=A // 10610
@SP // 10611
AM=M+1 // 10612
A=A-1 // 10613
M=D // 10614
@6 // 10615
D=A // 10616
@SP // 10617
AM=M+1 // 10618
A=A-1 // 10619
M=D // 10620
@54 // 10621
D=A // 10622
@SP // 10623
AM=M+1 // 10624
A=A-1 // 10625
M=D // 10626
@28 // 10627
D=A // 10628
@SP // 10629
AM=M+1 // 10630
A=A-1 // 10631
M=D // 10632
@SP // 10633
AM=M+1 // 10634
A=A-1 // 10635
M=0 // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=0 // 10640
// call Output.create
@17 // 10641
D=A // 10642
@14 // 10643
M=D // 10644
@Output.create // 10645
D=A // 10646
@13 // 10647
M=D // 10648
@Output.init.ret.86 // 10649
D=A // 10650
@CALL // 10651
0;JMP // 10652
(Output.init.ret.86)
@SP // 10653
M=M-1 // 10654

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10655
D=A // 10656
@SP // 10657
M=D+M // 10658
@117 // 10659
D=A // 10660
@SP // 10661
A=M-1 // 10662
M=0 // 10663
A=A-1 // 10664
M=0 // 10665
A=A-1 // 10666
M=0 // 10667
A=A-1 // 10668
M=D // 10669
A=A-1 // 10670
@27 // 10671
D=A // 10672
@SP // 10673
AM=M+1 // 10674
A=A-1 // 10675
M=D // 10676
@27 // 10677
D=A // 10678
@SP // 10679
AM=M+1 // 10680
A=A-1 // 10681
M=D // 10682
@27 // 10683
D=A // 10684
@SP // 10685
AM=M+1 // 10686
A=A-1 // 10687
M=D // 10688
@27 // 10689
D=A // 10690
@SP // 10691
AM=M+1 // 10692
A=A-1 // 10693
M=D // 10694
@27 // 10695
D=A // 10696
@SP // 10697
AM=M+1 // 10698
A=A-1 // 10699
M=D // 10700
@54 // 10701
D=A // 10702
@SP // 10703
AM=M+1 // 10704
A=A-1 // 10705
M=D // 10706
@SP // 10707
AM=M+1 // 10708
A=A-1 // 10709
M=0 // 10710
@SP // 10711
AM=M+1 // 10712
A=A-1 // 10713
M=0 // 10714
// call Output.create
@17 // 10715
D=A // 10716
@14 // 10717
M=D // 10718
@Output.create // 10719
D=A // 10720
@13 // 10721
M=D // 10722
@Output.init.ret.87 // 10723
D=A // 10724
@CALL // 10725
0;JMP // 10726
(Output.init.ret.87)
@SP // 10727
M=M-1 // 10728

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10729
D=A // 10730
@SP // 10731
M=D+M // 10732
@118 // 10733
D=A // 10734
@SP // 10735
A=M-1 // 10736
M=0 // 10737
A=A-1 // 10738
M=0 // 10739
A=A-1 // 10740
M=0 // 10741
A=A-1 // 10742
M=D // 10743
A=A-1 // 10744
@51 // 10745
D=A // 10746
@SP // 10747
AM=M+1 // 10748
A=A-1 // 10749
M=D // 10750
@51 // 10751
D=A // 10752
@SP // 10753
AM=M+1 // 10754
A=A-1 // 10755
M=D // 10756
@51 // 10757
D=A // 10758
@SP // 10759
AM=M+1 // 10760
A=A-1 // 10761
M=D // 10762
@51 // 10763
D=A // 10764
@SP // 10765
AM=M+1 // 10766
A=A-1 // 10767
M=D // 10768
@30 // 10769
D=A // 10770
@SP // 10771
AM=M+1 // 10772
A=A-1 // 10773
M=D // 10774
@12 // 10775
D=A // 10776
@SP // 10777
AM=M+1 // 10778
A=A-1 // 10779
M=D // 10780
@SP // 10781
AM=M+1 // 10782
A=A-1 // 10783
M=0 // 10784
@SP // 10785
AM=M+1 // 10786
A=A-1 // 10787
M=0 // 10788
// call Output.create
@17 // 10789
D=A // 10790
@14 // 10791
M=D // 10792
@Output.create // 10793
D=A // 10794
@13 // 10795
M=D // 10796
@Output.init.ret.88 // 10797
D=A // 10798
@CALL // 10799
0;JMP // 10800
(Output.init.ret.88)
@SP // 10801
M=M-1 // 10802

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10803
D=A // 10804
@SP // 10805
M=D+M // 10806
@119 // 10807
D=A // 10808
@SP // 10809
A=M-1 // 10810
M=0 // 10811
A=A-1 // 10812
M=0 // 10813
A=A-1 // 10814
M=0 // 10815
A=A-1 // 10816
M=D // 10817
A=A-1 // 10818
@51 // 10819
D=A // 10820
@SP // 10821
AM=M+1 // 10822
A=A-1 // 10823
M=D // 10824
@51 // 10825
D=A // 10826
@SP // 10827
AM=M+1 // 10828
A=A-1 // 10829
M=D // 10830
@51 // 10831
D=A // 10832
@SP // 10833
AM=M+1 // 10834
A=A-1 // 10835
M=D // 10836
@63 // 10837
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
@18 // 10849
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
// call Output.create
@17 // 10863
D=A // 10864
@14 // 10865
M=D // 10866
@Output.create // 10867
D=A // 10868
@13 // 10869
M=D // 10870
@Output.init.ret.89 // 10871
D=A // 10872
@CALL // 10873
0;JMP // 10874
(Output.init.ret.89)
@SP // 10875
M=M-1 // 10876

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10877
D=A // 10878
@SP // 10879
M=D+M // 10880
@120 // 10881
D=A // 10882
@SP // 10883
A=M-1 // 10884
M=0 // 10885
A=A-1 // 10886
M=0 // 10887
A=A-1 // 10888
M=0 // 10889
A=A-1 // 10890
M=D // 10891
A=A-1 // 10892
@51 // 10893
D=A // 10894
@SP // 10895
AM=M+1 // 10896
A=A-1 // 10897
M=D // 10898
@30 // 10899
D=A // 10900
@SP // 10901
AM=M+1 // 10902
A=A-1 // 10903
M=D // 10904
@12 // 10905
D=A // 10906
@SP // 10907
AM=M+1 // 10908
A=A-1 // 10909
M=D // 10910
@12 // 10911
D=A // 10912
@SP // 10913
AM=M+1 // 10914
A=A-1 // 10915
M=D // 10916
@30 // 10917
D=A // 10918
@SP // 10919
AM=M+1 // 10920
A=A-1 // 10921
M=D // 10922
@51 // 10923
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
@Output.init.ret.90 // 10945
D=A // 10946
@CALL // 10947
0;JMP // 10948
(Output.init.ret.90)
@SP // 10949
M=M-1 // 10950

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10951
D=A // 10952
@SP // 10953
M=D+M // 10954
@121 // 10955
D=A // 10956
@SP // 10957
A=M-1 // 10958
M=0 // 10959
A=A-1 // 10960
M=0 // 10961
A=A-1 // 10962
M=0 // 10963
A=A-1 // 10964
M=D // 10965
A=A-1 // 10966
@51 // 10967
D=A // 10968
@SP // 10969
AM=M+1 // 10970
A=A-1 // 10971
M=D // 10972
@51 // 10973
D=A // 10974
@SP // 10975
AM=M+1 // 10976
A=A-1 // 10977
M=D // 10978
@51 // 10979
D=A // 10980
@SP // 10981
AM=M+1 // 10982
A=A-1 // 10983
M=D // 10984
@62 // 10985
D=A // 10986
@SP // 10987
AM=M+1 // 10988
A=A-1 // 10989
M=D // 10990
@48 // 10991
D=A // 10992
@SP // 10993
AM=M+1 // 10994
A=A-1 // 10995
M=D // 10996
@24 // 10997
D=A // 10998
@SP // 10999
AM=M+1 // 11000
A=A-1 // 11001
M=D // 11002
@15 // 11003
D=A // 11004
@SP // 11005
AM=M+1 // 11006
A=A-1 // 11007
M=D // 11008
@SP // 11009
AM=M+1 // 11010
A=A-1 // 11011
M=0 // 11012
// call Output.create
@17 // 11013
D=A // 11014
@14 // 11015
M=D // 11016
@Output.create // 11017
D=A // 11018
@13 // 11019
M=D // 11020
@Output.init.ret.91 // 11021
D=A // 11022
@CALL // 11023
0;JMP // 11024
(Output.init.ret.91)
@SP // 11025
M=M-1 // 11026

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11027
D=A // 11028
@SP // 11029
M=D+M // 11030
@122 // 11031
D=A // 11032
@SP // 11033
A=M-1 // 11034
M=0 // 11035
A=A-1 // 11036
M=0 // 11037
A=A-1 // 11038
M=0 // 11039
A=A-1 // 11040
M=D // 11041
A=A-1 // 11042
@63 // 11043
D=A // 11044
@SP // 11045
AM=M+1 // 11046
A=A-1 // 11047
M=D // 11048
@27 // 11049
D=A // 11050
@SP // 11051
AM=M+1 // 11052
A=A-1 // 11053
M=D // 11054
@12 // 11055
D=A // 11056
@SP // 11057
AM=M+1 // 11058
A=A-1 // 11059
M=D // 11060
@6 // 11061
D=A // 11062
@SP // 11063
AM=M+1 // 11064
A=A-1 // 11065
M=D // 11066
@51 // 11067
D=A // 11068
@SP // 11069
AM=M+1 // 11070
A=A-1 // 11071
M=D // 11072
@63 // 11073
D=A // 11074
@SP // 11075
AM=M+1 // 11076
A=A-1 // 11077
M=D // 11078
@SP // 11079
AM=M+1 // 11080
A=A-1 // 11081
M=0 // 11082
@SP // 11083
AM=M+1 // 11084
A=A-1 // 11085
M=0 // 11086
// call Output.create
@17 // 11087
D=A // 11088
@14 // 11089
M=D // 11090
@Output.create // 11091
D=A // 11092
@13 // 11093
M=D // 11094
@Output.init.ret.92 // 11095
D=A // 11096
@CALL // 11097
0;JMP // 11098
(Output.init.ret.92)
@SP // 11099
M=M-1 // 11100

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11101
D=A // 11102
@SP // 11103
AM=M+1 // 11104
A=A-1 // 11105
M=D // 11106
@56 // 11107
D=A // 11108
@SP // 11109
AM=M+1 // 11110
A=A-1 // 11111
M=D // 11112
@12 // 11113
D=A // 11114
@SP // 11115
AM=M+1 // 11116
A=A-1 // 11117
M=D // 11118
@12 // 11119
D=A // 11120
@SP // 11121
AM=M+1 // 11122
A=A-1 // 11123
M=D // 11124
@12 // 11125
D=A // 11126
@SP // 11127
AM=M+1 // 11128
A=A-1 // 11129
M=D // 11130
@7 // 11131
D=A // 11132
@SP // 11133
AM=M+1 // 11134
A=A-1 // 11135
M=D // 11136
@12 // 11137
D=A // 11138
@SP // 11139
AM=M+1 // 11140
A=A-1 // 11141
M=D // 11142
@12 // 11143
D=A // 11144
@SP // 11145
AM=M+1 // 11146
A=A-1 // 11147
M=D // 11148
@12 // 11149
D=A // 11150
@SP // 11151
AM=M+1 // 11152
A=A-1 // 11153
M=D // 11154
@56 // 11155
D=A // 11156
@SP // 11157
AM=M+1 // 11158
A=A-1 // 11159
M=D // 11160
@SP // 11161
AM=M+1 // 11162
A=A-1 // 11163
M=0 // 11164
@SP // 11165
AM=M+1 // 11166
A=A-1 // 11167
M=0 // 11168
// call Output.create
@17 // 11169
D=A // 11170
@14 // 11171
M=D // 11172
@Output.create // 11173
D=A // 11174
@13 // 11175
M=D // 11176
@Output.init.ret.93 // 11177
D=A // 11178
@CALL // 11179
0;JMP // 11180
(Output.init.ret.93)
@SP // 11181
M=M-1 // 11182

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11183
D=A // 11184
@SP // 11185
AM=M+1 // 11186
A=A-1 // 11187
M=D // 11188
@12 // 11189
D=A // 11190
@SP // 11191
AM=M+1 // 11192
A=A-1 // 11193
M=D // 11194
@12 // 11195
D=A // 11196
@SP // 11197
AM=M+1 // 11198
A=A-1 // 11199
M=D // 11200
@12 // 11201
D=A // 11202
@SP // 11203
AM=M+1 // 11204
A=A-1 // 11205
M=D // 11206
@12 // 11207
D=A // 11208
@SP // 11209
AM=M+1 // 11210
A=A-1 // 11211
M=D // 11212
@12 // 11213
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
@12 // 11231
D=A // 11232
@SP // 11233
AM=M+1 // 11234
A=A-1 // 11235
M=D // 11236
@12 // 11237
D=A // 11238
@SP // 11239
AM=M+1 // 11240
A=A-1 // 11241
M=D // 11242
@SP // 11243
AM=M+1 // 11244
A=A-1 // 11245
M=0 // 11246
@SP // 11247
AM=M+1 // 11248
A=A-1 // 11249
M=0 // 11250
// call Output.create
@17 // 11251
D=A // 11252
@14 // 11253
M=D // 11254
@Output.create // 11255
D=A // 11256
@13 // 11257
M=D // 11258
@Output.init.ret.94 // 11259
D=A // 11260
@CALL // 11261
0;JMP // 11262
(Output.init.ret.94)
@SP // 11263
M=M-1 // 11264

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11265
D=A // 11266
@SP // 11267
AM=M+1 // 11268
A=A-1 // 11269
M=D // 11270
@7 // 11271
D=A // 11272
@SP // 11273
AM=M+1 // 11274
A=A-1 // 11275
M=D // 11276
@12 // 11277
D=A // 11278
@SP // 11279
AM=M+1 // 11280
A=A-1 // 11281
M=D // 11282
@12 // 11283
D=A // 11284
@SP // 11285
AM=M+1 // 11286
A=A-1 // 11287
M=D // 11288
@12 // 11289
D=A // 11290
@SP // 11291
AM=M+1 // 11292
A=A-1 // 11293
M=D // 11294
@56 // 11295
D=A // 11296
@SP // 11297
AM=M+1 // 11298
A=A-1 // 11299
M=D // 11300
@12 // 11301
D=A // 11302
@SP // 11303
AM=M+1 // 11304
A=A-1 // 11305
M=D // 11306
@12 // 11307
D=A // 11308
@SP // 11309
AM=M+1 // 11310
A=A-1 // 11311
M=D // 11312
@12 // 11313
D=A // 11314
@SP // 11315
AM=M+1 // 11316
A=A-1 // 11317
M=D // 11318
@7 // 11319
D=A // 11320
@SP // 11321
AM=M+1 // 11322
A=A-1 // 11323
M=D // 11324
@SP // 11325
AM=M+1 // 11326
A=A-1 // 11327
M=0 // 11328
@SP // 11329
AM=M+1 // 11330
A=A-1 // 11331
M=0 // 11332
// call Output.create
@17 // 11333
D=A // 11334
@14 // 11335
M=D // 11336
@Output.create // 11337
D=A // 11338
@13 // 11339
M=D // 11340
@Output.init.ret.95 // 11341
D=A // 11342
@CALL // 11343
0;JMP // 11344
(Output.init.ret.95)
@SP // 11345
M=M-1 // 11346

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11347
D=A // 11348
@SP // 11349
AM=M+1 // 11350
A=A-1 // 11351
M=D // 11352
@38 // 11353
D=A // 11354
@SP // 11355
AM=M+1 // 11356
A=A-1 // 11357
M=D // 11358
@45 // 11359
D=A // 11360
@SP // 11361
AM=M+1 // 11362
A=A-1 // 11363
M=D // 11364
@25 // 11365
D=A // 11366
@SP // 11367
AM=M+1 // 11368
A=A-1 // 11369
M=D // 11370
@SP // 11371
AM=M+1 // 11372
A=A-1 // 11373
M=0 // 11374
@SP // 11375
AM=M+1 // 11376
A=A-1 // 11377
M=0 // 11378
@SP // 11379
AM=M+1 // 11380
A=A-1 // 11381
M=0 // 11382
@SP // 11383
AM=M+1 // 11384
A=A-1 // 11385
M=0 // 11386
@SP // 11387
AM=M+1 // 11388
A=A-1 // 11389
M=0 // 11390
@SP // 11391
AM=M+1 // 11392
A=A-1 // 11393
M=0 // 11394
@SP // 11395
AM=M+1 // 11396
A=A-1 // 11397
M=0 // 11398
@SP // 11399
AM=M+1 // 11400
A=A-1 // 11401
M=0 // 11402
// call Output.create
@17 // 11403
D=A // 11404
@14 // 11405
M=D // 11406
@Output.create // 11407
D=A // 11408
@13 // 11409
M=D // 11410
@Output.init.ret.96 // 11411
D=A // 11412
@CALL // 11413
0;JMP // 11414
(Output.init.ret.96)
@SP // 11415
M=M-1 // 11416

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 11417
M=0 // 11418

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 11419
M=0 // 11420

////PushInstruction("constant 0")
@SP // 11421
AM=M+1 // 11422
A=A-1 // 11423
M=0 // 11424
@RETURN // 11425
0;JMP // 11426

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=97}}
// function Output.create with 1
(Output.create)
@SP // 11427
AM=M+1 // 11428
A=A-1 // 11429
M=0 // 11430

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11431
D=A // 11432
@SP // 11433
AM=M+1 // 11434
A=A-1 // 11435
M=D // 11436
// call Array.new
@6 // 11437
D=A // 11438
@14 // 11439
M=D // 11440
@Array.new // 11441
D=A // 11442
@13 // 11443
M=D // 11444
@Output.create.ret.0 // 11445
D=A // 11446
@CALL // 11447
0;JMP // 11448
(Output.create.ret.0)
@SP // 11449
AM=M-1 // 11450
D=M // 11451
@LCL // 11452
A=M // 11453
M=D // 11454

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11455
D=M // 11456
@SP // 11457
AM=M+1 // 11458
A=A-1 // 11459
M=D // 11460
@ARG // 11461
A=M // 11462
D=M // 11463
@SP // 11464
AM=M-1 // 11465
D=D+M // 11466
@SP // 11467
AM=M+1 // 11468
A=A-1 // 11469
M=D // 11470
@LCL // 11471
A=M // 11472
D=M // 11473
@SP // 11474
AM=M-1 // 11475
A=M // 11476
M=D // 11477

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11478
A=M // 11479
D=M // 11480
@SP // 11481
AM=M+1 // 11482
A=A-1 // 11483
M=D // 11484
@ARG // 11485
A=M+1 // 11486
D=M // 11487
@SP // 11488
AM=M-1 // 11489
A=M // 11490
M=D // 11491

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11492
A=M // 11493
D=M // 11494
@SP // 11495
AM=M+1 // 11496
A=A-1 // 11497
M=D+1 // 11498
@ARG // 11499
A=M+1 // 11500
A=A+1 // 11501
D=M // 11502
@SP // 11503
AM=M-1 // 11504
A=M // 11505
M=D // 11506

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11507
A=M // 11508
D=M // 11509
@2 // 11510
D=D+A // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=D // 11515
@ARG // 11516
A=M+1 // 11517
A=A+1 // 11518
A=A+1 // 11519
D=M // 11520
@SP // 11521
AM=M-1 // 11522
A=M // 11523
M=D // 11524

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11525
A=M // 11526
D=M // 11527
@3 // 11528
D=D+A // 11529
@SP // 11530
AM=M+1 // 11531
A=A-1 // 11532
M=D // 11533
@ARG // 11534
D=M // 11535
@4 // 11536
A=D+A // 11537
D=M // 11538
@SP // 11539
AM=M-1 // 11540
A=M // 11541
M=D // 11542

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11543
A=M // 11544
D=M // 11545
@4 // 11546
D=D+A // 11547
@SP // 11548
AM=M+1 // 11549
A=A-1 // 11550
M=D // 11551
@ARG // 11552
D=M // 11553
@5 // 11554
A=D+A // 11555
D=M // 11556
@SP // 11557
AM=M-1 // 11558
A=M // 11559
M=D // 11560

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11561
A=M // 11562
D=M // 11563
@5 // 11564
D=D+A // 11565
@SP // 11566
AM=M+1 // 11567
A=A-1 // 11568
M=D // 11569
@ARG // 11570
D=M // 11571
@6 // 11572
A=D+A // 11573
D=M // 11574
@SP // 11575
AM=M-1 // 11576
A=M // 11577
M=D // 11578

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11579
A=M // 11580
D=M // 11581
@6 // 11582
D=D+A // 11583
@SP // 11584
AM=M+1 // 11585
A=A-1 // 11586
M=D // 11587
@ARG // 11588
D=M // 11589
@7 // 11590
A=D+A // 11591
D=M // 11592
@SP // 11593
AM=M-1 // 11594
A=M // 11595
M=D // 11596

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11597
A=M // 11598
D=M // 11599
@7 // 11600
D=D+A // 11601
@SP // 11602
AM=M+1 // 11603
A=A-1 // 11604
M=D // 11605
@ARG // 11606
D=M // 11607
@8 // 11608
A=D+A // 11609
D=M // 11610
@SP // 11611
AM=M-1 // 11612
A=M // 11613
M=D // 11614

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11615
A=M // 11616
D=M // 11617
@8 // 11618
D=D+A // 11619
@SP // 11620
AM=M+1 // 11621
A=A-1 // 11622
M=D // 11623
@ARG // 11624
D=M // 11625
@9 // 11626
A=D+A // 11627
D=M // 11628
@SP // 11629
AM=M-1 // 11630
A=M // 11631
M=D // 11632

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11633
A=M // 11634
D=M // 11635
@9 // 11636
D=D+A // 11637
@SP // 11638
AM=M+1 // 11639
A=A-1 // 11640
M=D // 11641
@ARG // 11642
D=M // 11643
@10 // 11644
A=D+A // 11645
D=M // 11646
@SP // 11647
AM=M-1 // 11648
A=M // 11649
M=D // 11650

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11651
A=M // 11652
D=M // 11653
@10 // 11654
D=D+A // 11655
@SP // 11656
AM=M+1 // 11657
A=A-1 // 11658
M=D // 11659
@ARG // 11660
D=M // 11661
@11 // 11662
A=D+A // 11663
D=M // 11664
@SP // 11665
AM=M-1 // 11666
A=M // 11667
M=D // 11668

////PushInstruction("constant 0")
@SP // 11669
AM=M+1 // 11670
A=A-1 // 11671
M=0 // 11672
@RETURN // 11673
0;JMP // 11674

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=97, Output.create=1}}
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
@Output.getMap.LT.0 // 11675
D=A // 11676
@SP // 11677
AM=M+1 // 11678
A=A-1 // 11679
M=D // 11680
@ARG // 11681
A=M // 11682
D=M // 11683
@32 // 11684
D=D-A // 11685
@DO_LT // 11686
0;JMP // 11687
(Output.getMap.LT.0)
@SP // 11688
AM=M+1 // 11689
A=A-1 // 11690
M=D // 11691
@Output.getMap.GT.1 // 11692
D=A // 11693
@SP // 11694
AM=M+1 // 11695
A=A-1 // 11696
M=D // 11697
@ARG // 11698
A=M // 11699
D=M // 11700
@126 // 11701
D=D-A // 11702
@DO_GT // 11703
0;JMP // 11704
(Output.getMap.GT.1)
@SP // 11705
AM=M-1 // 11706
D=D|M // 11707
D=!D // 11708
@Output.getMap.IfElseEND1 // 11709
D;JNE // 11710

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11711
A=M // 11712
M=0 // 11713

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
@Output.0 // 11714
D=M // 11715
@SP // 11716
AM=M+1 // 11717
A=A-1 // 11718
M=D // 11719
@ARG // 11720
A=M // 11721
D=M // 11722
@SP // 11723
AM=M-1 // 11724
A=D+M // 11725
D=M // 11726
@SP // 11727
AM=M+1 // 11728
A=A-1 // 11729
M=D // 11730
@RETURN // 11731
0;JMP // 11732

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 11733
A=M+1 // 11734
D=M // 11735
@Output.1 // 11736
M=D // 11737

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 11738
A=M // 11739
D=M // 11740
@Output.2 // 11741
M=D // 11742

////PushInstruction("constant 0")
@SP // 11743
AM=M+1 // 11744
A=A-1 // 11745
M=0 // 11746
@RETURN // 11747
0;JMP // 11748

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 11749
D=A // 11750
@SP // 11751
AM=D+M // 11752
A=A-1 // 11753
M=0 // 11754
A=A-1 // 11755
M=0 // 11756
A=A-1 // 11757
M=0 // 11758
A=A-1 // 11759
M=0 // 11760

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 11761
A=M // 11762
D=M // 11763
@SP // 11764
AM=M+1 // 11765
A=A-1 // 11766
M=D // 11767
// call Output.getMap
@6 // 11768
D=A // 11769
@14 // 11770
M=D // 11771
@Output.getMap // 11772
D=A // 11773
@13 // 11774
M=D // 11775
@Output.printChar.ret.0 // 11776
D=A // 11777
@CALL // 11778
0;JMP // 11779
(Output.printChar.ret.0)
@SP // 11780
AM=M-1 // 11781
D=M // 11782
@LCL // 11783
A=M // 11784
M=D // 11785

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 11786
A=M+1 // 11787
A=A+1 // 11788
A=A+1 // 11789
M=0 // 11790

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
@Output.printChar.LT.2 // 11791
D=A // 11792
@SP // 11793
AM=M+1 // 11794
A=A-1 // 11795
M=D // 11796
@LCL // 11797
A=M+1 // 11798
A=A+1 // 11799
A=A+1 // 11800
D=M // 11801
@11 // 11802
D=D-A // 11803
@DO_LT // 11804
0;JMP // 11805
(Output.printChar.LT.2)
D=!D // 11806
@WHILE_END_Output.printChar1 // 11807
D;JNE // 11808

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

@Output.2 // 11809
D=M // 11810
@SP // 11811
AM=M+1 // 11812
A=A-1 // 11813
M=D // 11814
@11 // 11815
D=A // 11816
@SP // 11817
AM=M+1 // 11818
A=A-1 // 11819
M=D // 11820
// call Math.multiply
@7 // 11821
D=A // 11822
@14 // 11823
M=D // 11824
@Math.multiply // 11825
D=A // 11826
@13 // 11827
M=D // 11828
@Output.printChar.ret.1 // 11829
D=A // 11830
@CALL // 11831
0;JMP // 11832
(Output.printChar.ret.1)
@LCL // 11833
A=M+1 // 11834
A=A+1 // 11835
A=A+1 // 11836
D=M // 11837
@SP // 11838
AM=M-1 // 11839
D=D+M // 11840
@SP // 11841
AM=M+1 // 11842
A=A-1 // 11843
M=D // 11844
@32 // 11845
D=A // 11846
@SP // 11847
AM=M+1 // 11848
A=A-1 // 11849
M=D // 11850
// call Math.multiply
@7 // 11851
D=A // 11852
@14 // 11853
M=D // 11854
@Math.multiply // 11855
D=A // 11856
@13 // 11857
M=D // 11858
@Output.printChar.ret.2 // 11859
D=A // 11860
@CALL // 11861
0;JMP // 11862
(Output.printChar.ret.2)
@SP // 11863
AM=M-1 // 11864
D=M // 11865
@16384 // 11866
D=D+A // 11867
@SP // 11868
AM=M+1 // 11869
A=A-1 // 11870
M=D // 11871
@Output.1 // 11872
D=M // 11873
@SP // 11874
AM=M+1 // 11875
A=A-1 // 11876
M=D // 11877
@2 // 11878
D=A // 11879
@SP // 11880
AM=M+1 // 11881
A=A-1 // 11882
M=D // 11883
// call Math.divide
@7 // 11884
D=A // 11885
@14 // 11886
M=D // 11887
@Math.divide // 11888
D=A // 11889
@13 // 11890
M=D // 11891
@Output.printChar.ret.3 // 11892
D=A // 11893
@CALL // 11894
0;JMP // 11895
(Output.printChar.ret.3)
@SP // 11896
AM=M-1 // 11897
D=M // 11898
@SP // 11899
AM=M-1 // 11900
D=D+M // 11901
@LCL // 11902
A=M+1 // 11903
M=D // 11904

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
@Output.printChar.EQ.3 // 11905
D=A // 11906
@SP // 11907
AM=M+1 // 11908
A=A-1 // 11909
M=D // 11910
@Output.1 // 11911
D=M // 11912
@1 // 11913
D=D&A // 11914
@DO_EQ // 11915
0;JMP // 11916
(Output.printChar.EQ.3)
D=!D // 11917
@Output.printChar.IfElse1 // 11918
D;JNE // 11919

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

@LCL // 11920
A=M+1 // 11921
A=A+1 // 11922
A=A+1 // 11923
D=M // 11924
A=A-1 // 11925
A=A-1 // 11926
A=A-1 // 11927
A=D+M // 11928
D=M // 11929
@LCL // 11930
A=M+1 // 11931
A=A+1 // 11932
M=D // 11933

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 11934
0;JMP // 11935

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

@LCL // 11936
A=M+1 // 11937
A=A+1 // 11938
A=A+1 // 11939
D=M // 11940
A=A-1 // 11941
A=A-1 // 11942
A=A-1 // 11943
A=D+M // 11944
D=M // 11945
@SP // 11946
AM=M+1 // 11947
A=A-1 // 11948
M=D // 11949
@256 // 11950
D=A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955
// call Math.multiply
@7 // 11956
D=A // 11957
@14 // 11958
M=D // 11959
@Math.multiply // 11960
D=A // 11961
@13 // 11962
M=D // 11963
@Output.printChar.ret.4 // 11964
D=A // 11965
@CALL // 11966
0;JMP // 11967
(Output.printChar.ret.4)
@SP // 11968
AM=M-1 // 11969
D=M // 11970
@LCL // 11971
A=M+1 // 11972
A=A+1 // 11973
M=D // 11974

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
@LCL // 11975
A=M+1 // 11976
D=M // 11977
@SP // 11978
AM=M+1 // 11979
A=A-1 // 11980
M=D // 11981
@LCL // 11982
A=M+1 // 11983
D=M // 11984
@0 // 11985
A=D+A // 11986
D=M // 11987
@SP // 11988
AM=M+1 // 11989
A=A-1 // 11990
M=D // 11991
@LCL // 11992
A=M+1 // 11993
A=A+1 // 11994
D=M // 11995
@SP // 11996
AM=M-1 // 11997
D=D|M // 11998
@SP // 11999
AM=M-1 // 12000
A=M // 12001
M=D // 12002

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

@LCL // 12003
A=M+1 // 12004
A=A+1 // 12005
A=A+1 // 12006
M=M+1 // 12007

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12008
0;JMP // 12009

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
@Output.printChar.EQ.4 // 12010
D=A // 12011
@SP // 12012
AM=M+1 // 12013
A=A-1 // 12014
M=D // 12015
@Output.1 // 12016
D=M // 12017
@63 // 12018
D=D-A // 12019
@DO_EQ // 12020
0;JMP // 12021
(Output.printChar.EQ.4)
D=!D // 12022
@Output.printChar.IfElse2 // 12023
D;JNE // 12024

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12025
D=A // 12026
@14 // 12027
M=D // 12028
@Output.println // 12029
D=A // 12030
@13 // 12031
M=D // 12032
@Output.printChar.ret.5 // 12033
D=A // 12034
@CALL // 12035
0;JMP // 12036
(Output.printChar.ret.5)
@SP // 12037
M=M-1 // 12038

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12039
0;JMP // 12040

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

@Output.1 // 12041
M=M+1 // 12042

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12043
AM=M+1 // 12044
A=A-1 // 12045
M=0 // 12046
@RETURN // 12047
0;JMP // 12048

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12049
M=M+1 // 12050
AM=M+1 // 12051
A=A-1 // 12052
M=0 // 12053
A=A-1 // 12054
M=0 // 12055

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12056
A=M // 12057
M=0 // 12058

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12059
A=M // 12060
D=M // 12061
@SP // 12062
AM=M+1 // 12063
A=A-1 // 12064
M=D // 12065
// call String.length
@6 // 12066
D=A // 12067
@14 // 12068
M=D // 12069
@String.length // 12070
D=A // 12071
@13 // 12072
M=D // 12073
@Output.printString.ret.0 // 12074
D=A // 12075
@CALL // 12076
0;JMP // 12077
(Output.printString.ret.0)
@SP // 12078
AM=M-1 // 12079
D=M // 12080
@LCL // 12081
A=M+1 // 12082
M=D // 12083

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
@Output.printString.LT.5 // 12084
D=A // 12085
@SP // 12086
AM=M+1 // 12087
A=A-1 // 12088
M=D // 12089
@LCL // 12090
A=M+1 // 12091
D=M // 12092
A=A-1 // 12093
D=M-D // 12094
@DO_LT // 12095
0;JMP // 12096
(Output.printString.LT.5)
D=!D // 12097
@WHILE_END_Output.printString1 // 12098
D;JNE // 12099

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12100
A=M // 12101
D=M // 12102
@SP // 12103
AM=M+1 // 12104
A=A-1 // 12105
M=D // 12106
@LCL // 12107
A=M // 12108
D=M // 12109
@SP // 12110
AM=M+1 // 12111
A=A-1 // 12112
M=D // 12113
// call String.charAt
@7 // 12114
D=A // 12115
@14 // 12116
M=D // 12117
@String.charAt // 12118
D=A // 12119
@13 // 12120
M=D // 12121
@Output.printString.ret.1 // 12122
D=A // 12123
@CALL // 12124
0;JMP // 12125
(Output.printString.ret.1)
// call Output.printChar
@6 // 12126
D=A // 12127
@14 // 12128
M=D // 12129
@Output.printChar // 12130
D=A // 12131
@13 // 12132
M=D // 12133
@Output.printString.ret.2 // 12134
D=A // 12135
@CALL // 12136
0;JMP // 12137
(Output.printString.ret.2)
@SP // 12138
M=M-1 // 12139

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

@LCL // 12140
A=M // 12141
M=M+1 // 12142

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12143
0;JMP // 12144

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12145
AM=M+1 // 12146
A=A-1 // 12147
M=0 // 12148
@RETURN // 12149
0;JMP // 12150

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12151
AM=M+1 // 12152
A=A-1 // 12153
M=0 // 12154

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12155
D=A // 12156
@SP // 12157
AM=M+1 // 12158
A=A-1 // 12159
M=D // 12160
// call String.new
@6 // 12161
D=A // 12162
@14 // 12163
M=D // 12164
@String.new // 12165
D=A // 12166
@13 // 12167
M=D // 12168
@Output.printInt.ret.0 // 12169
D=A // 12170
@CALL // 12171
0;JMP // 12172
(Output.printInt.ret.0)
@SP // 12173
AM=M-1 // 12174
D=M // 12175
@LCL // 12176
A=M // 12177
M=D // 12178

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12179
A=M // 12180
D=M // 12181
@SP // 12182
AM=M+1 // 12183
A=A-1 // 12184
M=D // 12185
@ARG // 12186
A=M // 12187
D=M // 12188
@SP // 12189
AM=M+1 // 12190
A=A-1 // 12191
M=D // 12192
// call String.setInt
@7 // 12193
D=A // 12194
@14 // 12195
M=D // 12196
@String.setInt // 12197
D=A // 12198
@13 // 12199
M=D // 12200
@Output.printInt.ret.1 // 12201
D=A // 12202
@CALL // 12203
0;JMP // 12204
(Output.printInt.ret.1)
@SP // 12205
M=M-1 // 12206

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12207
A=M // 12208
D=M // 12209
@SP // 12210
AM=M+1 // 12211
A=A-1 // 12212
M=D // 12213
// call Output.printString
@6 // 12214
D=A // 12215
@14 // 12216
M=D // 12217
@Output.printString // 12218
D=A // 12219
@13 // 12220
M=D // 12221
@Output.printInt.ret.2 // 12222
D=A // 12223
@CALL // 12224
0;JMP // 12225
(Output.printInt.ret.2)
@SP // 12226
M=M-1 // 12227

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12228
A=M // 12229
D=M // 12230
@SP // 12231
AM=M+1 // 12232
A=A-1 // 12233
M=D // 12234
// call String.dispose
@6 // 12235
D=A // 12236
@14 // 12237
M=D // 12238
@String.dispose // 12239
D=A // 12240
@13 // 12241
M=D // 12242
@Output.printInt.ret.3 // 12243
D=A // 12244
@CALL // 12245
0;JMP // 12246
(Output.printInt.ret.3)
@SP // 12247
M=M-1 // 12248

////PushInstruction("constant 0")
@SP // 12249
AM=M+1 // 12250
A=A-1 // 12251
M=0 // 12252
@RETURN // 12253
0;JMP // 12254

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12255
M=0 // 12256

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 2"),
//        right:
//            PushInstruction("constant 22"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Output.println.IfElse1}}
@Output.println.EQ.6 // 12257
D=A // 12258
@SP // 12259
AM=M+1 // 12260
A=A-1 // 12261
M=D // 12262
@Output.2 // 12263
D=M // 12264
@22 // 12265
D=D-A // 12266
@DO_EQ // 12267
0;JMP // 12268
(Output.println.EQ.6)
D=!D // 12269
@Output.println.IfElse1 // 12270
D;JNE // 12271

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12272
M=0 // 12273

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12274
0;JMP // 12275

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

@Output.2 // 12276
M=M+1 // 12277

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12278
AM=M+1 // 12279
A=A-1 // 12280
M=0 // 12281
@RETURN // 12282
0;JMP // 12283

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
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
@Output.backSpace.EQ.7 // 12284
D=A // 12285
@SP // 12286
AM=M+1 // 12287
A=A-1 // 12288
M=D // 12289
@Output.1 // 12290
D=M // 12291
@DO_EQ // 12292
0;JMP // 12293
(Output.backSpace.EQ.7)
D=!D // 12294
@Output.backSpace.IfElse1 // 12295
D;JNE // 12296

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

@Output.2 // 12297
M=M-1 // 12298

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12299
D=A // 12300
@Output.1 // 12301
M=D // 12302

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12303
0;JMP // 12304

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

@Output.1 // 12305
M=M-1 // 12306

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12307
AM=M+1 // 12308
A=A-1 // 12309
M=0 // 12310
@RETURN // 12311
0;JMP // 12312

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12313
M=-1 // 12314

////PushInstruction("constant 0")
@SP // 12315
AM=M+1 // 12316
A=A-1 // 12317
M=0 // 12318
@RETURN // 12319
0;JMP // 12320

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12321
A=M // 12322
D=M // 12323
@Screen.0 // 12324
M=D // 12325

////PushInstruction("constant 0")
@SP // 12326
AM=M+1 // 12327
A=A-1 // 12328
M=0 // 12329
@RETURN // 12330
0;JMP // 12331

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12332
M=M+1 // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=0 // 12336
A=A-1 // 12337
M=0 // 12338

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

@ARG // 12339
A=M+1 // 12340
D=M // 12341
@SP // 12342
AM=M+1 // 12343
A=A-1 // 12344
M=D // 12345
@32 // 12346
D=A // 12347
@SP // 12348
AM=M+1 // 12349
A=A-1 // 12350
M=D // 12351
// call Math.multiply
@7 // 12352
D=A // 12353
@14 // 12354
M=D // 12355
@Math.multiply // 12356
D=A // 12357
@13 // 12358
M=D // 12359
@Screen.drawPixel.ret.0 // 12360
D=A // 12361
@CALL // 12362
0;JMP // 12363
(Screen.drawPixel.ret.0)
@ARG // 12364
A=M // 12365
D=M // 12366
@SP // 12367
AM=M+1 // 12368
A=A-1 // 12369
M=D // 12370
@16 // 12371
D=A // 12372
@SP // 12373
AM=M+1 // 12374
A=A-1 // 12375
M=D // 12376
// call Math.divide
@7 // 12377
D=A // 12378
@14 // 12379
M=D // 12380
@Math.divide // 12381
D=A // 12382
@13 // 12383
M=D // 12384
@Screen.drawPixel.ret.1 // 12385
D=A // 12386
@CALL // 12387
0;JMP // 12388
(Screen.drawPixel.ret.1)
@SP // 12389
AM=M-1 // 12390
D=M // 12391
@SP // 12392
AM=M-1 // 12393
D=D+M // 12394
@16384 // 12395
D=D+A // 12396
@LCL // 12397
A=M // 12398
M=D // 12399

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

@ARG // 12400
A=M // 12401
D=M // 12402
@15 // 12403
D=D&A // 12404
@LCL // 12405
A=M+1 // 12406
M=D // 12407

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawPixel.IfElse1}}
@Screen.drawPixel.EQ.0 // 12408
D=A // 12409
@SP // 12410
AM=M+1 // 12411
A=A-1 // 12412
M=D // 12413
@Screen.0 // 12414
D=M // 12415
@DO_EQ // 12416
0;JMP // 12417
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12418
D;JNE // 12419

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
@LCL // 12420
A=M // 12421
D=M // 12422
@SP // 12423
AM=M+1 // 12424
A=A-1 // 12425
M=D // 12426
@LCL // 12427
A=M // 12428
D=M // 12429
@0 // 12430
A=D+A // 12431
D=M // 12432
@SP // 12433
AM=M+1 // 12434
A=A-1 // 12435
M=D // 12436
@LCL // 12437
A=M+1 // 12438
D=M // 12439
@SP // 12440
AM=M+1 // 12441
A=A-1 // 12442
M=D // 12443
// call Math.twoToThe
@6 // 12444
D=A // 12445
@14 // 12446
M=D // 12447
@Math.twoToThe // 12448
D=A // 12449
@13 // 12450
M=D // 12451
@Screen.drawPixel.ret.2 // 12452
D=A // 12453
@CALL // 12454
0;JMP // 12455
(Screen.drawPixel.ret.2)
@SP // 12456
AM=M-1 // 12457
D=M // 12458
@SP // 12459
AM=M-1 // 12460
D=D|M // 12461
@SP // 12462
AM=M-1 // 12463
A=M // 12464
M=D // 12465

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12466
0;JMP // 12467

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
@LCL // 12468
A=M // 12469
D=M // 12470
@SP // 12471
AM=M+1 // 12472
A=A-1 // 12473
M=D // 12474
@LCL // 12475
A=M // 12476
D=M // 12477
@0 // 12478
A=D+A // 12479
D=M // 12480
@SP // 12481
AM=M+1 // 12482
A=A-1 // 12483
M=D // 12484
@LCL // 12485
A=M+1 // 12486
D=M // 12487
@SP // 12488
AM=M+1 // 12489
A=A-1 // 12490
M=D // 12491
// call Math.twoToThe
@6 // 12492
D=A // 12493
@14 // 12494
M=D // 12495
@Math.twoToThe // 12496
D=A // 12497
@13 // 12498
M=D // 12499
@Screen.drawPixel.ret.3 // 12500
D=A // 12501
@CALL // 12502
0;JMP // 12503
(Screen.drawPixel.ret.3)
@SP // 12504
AM=M-1 // 12505
D=M // 12506
D=!D // 12507
@SP // 12508
AM=M-1 // 12509
D=D&M // 12510
@SP // 12511
AM=M-1 // 12512
A=M // 12513
M=D // 12514

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12515
AM=M+1 // 12516
A=A-1 // 12517
M=0 // 12518
@RETURN // 12519
0;JMP // 12520

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12521
D=A // 12522
@SP // 12523
AM=D+M // 12524
A=A-1 // 12525
M=0 // 12526
A=A-1 // 12527
M=0 // 12528
A=A-1 // 12529
M=0 // 12530
A=A-1 // 12531
M=0 // 12532
A=A-1 // 12533
M=0 // 12534
A=A-1 // 12535
M=0 // 12536

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

@ARG // 12537
A=M+1 // 12538
A=A+1 // 12539
D=M // 12540
A=A-1 // 12541
A=A-1 // 12542
D=D-M // 12543
@SP // 12544
AM=M+1 // 12545
A=A-1 // 12546
M=D // 12547
// call Math.abs
@6 // 12548
D=A // 12549
@14 // 12550
M=D // 12551
@Math.abs // 12552
D=A // 12553
@13 // 12554
M=D // 12555
@Screen.drawLine.ret.0 // 12556
D=A // 12557
@CALL // 12558
0;JMP // 12559
(Screen.drawLine.ret.0)
@SP // 12560
AM=M-1 // 12561
D=M // 12562
@LCL // 12563
A=M // 12564
M=D // 12565

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

@ARG // 12566
A=M+1 // 12567
A=A+1 // 12568
A=A+1 // 12569
D=M // 12570
A=A-1 // 12571
A=A-1 // 12572
D=D-M // 12573
@SP // 12574
AM=M+1 // 12575
A=A-1 // 12576
M=D // 12577
// call Math.abs
@6 // 12578
D=A // 12579
@14 // 12580
M=D // 12581
@Math.abs // 12582
D=A // 12583
@13 // 12584
M=D // 12585
@Screen.drawLine.ret.1 // 12586
D=A // 12587
@CALL // 12588
0;JMP // 12589
(Screen.drawLine.ret.1)
@SP // 12590
AM=M-1 // 12591
D=M // 12592
@LCL // 12593
A=M+1 // 12594
M=D // 12595

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawLine.IfElse1}}
@Screen.drawLine.LT.1 // 12596
D=A // 12597
@SP // 12598
AM=M+1 // 12599
A=A-1 // 12600
M=D // 12601
@ARG // 12602
A=M+1 // 12603
A=A+1 // 12604
D=M // 12605
A=A-1 // 12606
A=A-1 // 12607
D=M-D // 12608
@DO_LT // 12609
0;JMP // 12610
(Screen.drawLine.LT.1)
D=!D // 12611
@Screen.drawLine.IfElse1 // 12612
D;JNE // 12613

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12614
A=M+1 // 12615
A=A+1 // 12616
M=1 // 12617

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 12618
0;JMP // 12619

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12620
A=M+1 // 12621
A=A+1 // 12622
M=-1 // 12623

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
@Screen.drawLine.LT.2 // 12624
D=A // 12625
@SP // 12626
AM=M+1 // 12627
A=A-1 // 12628
M=D // 12629
@ARG // 12630
A=M+1 // 12631
A=A+1 // 12632
A=A+1 // 12633
D=M // 12634
A=A-1 // 12635
A=A-1 // 12636
D=M-D // 12637
@DO_LT // 12638
0;JMP // 12639
(Screen.drawLine.LT.2)
D=!D // 12640
@Screen.drawLine.IfElse2 // 12641
D;JNE // 12642

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12643
A=M+1 // 12644
A=A+1 // 12645
A=A+1 // 12646
M=1 // 12647

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 12648
0;JMP // 12649

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12650
A=M+1 // 12651
A=A+1 // 12652
A=A+1 // 12653
M=-1 // 12654

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

@LCL // 12655
A=M+1 // 12656
D=M // 12657
A=A-1 // 12658
D=M-D // 12659
@SP // 12660
AM=M+1 // 12661
A=A-1 // 12662
M=D // 12663
@LCL // 12664
D=M // 12665
@4 // 12666
A=D+A // 12667
D=A // 12668
@R13 // 12669
M=D // 12670
@SP // 12671
AM=M-1 // 12672
D=M // 12673
@R13 // 12674
A=M // 12675
M=D // 12676

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Screen.drawLine1}}
D=0 // 12677
@WHILE_END_Screen.drawLine1 // 12678
D;JNE // 12679

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12680
A=M // 12681
D=M // 12682
@SP // 12683
AM=M+1 // 12684
A=A-1 // 12685
M=D // 12686
@ARG // 12687
A=M+1 // 12688
D=M // 12689
@SP // 12690
AM=M+1 // 12691
A=A-1 // 12692
M=D // 12693
// call Screen.drawPixel
@7 // 12694
D=A // 12695
@14 // 12696
M=D // 12697
@Screen.drawPixel // 12698
D=A // 12699
@13 // 12700
M=D // 12701
@Screen.drawLine.ret.2 // 12702
D=A // 12703
@CALL // 12704
0;JMP // 12705
(Screen.drawLine.ret.2)
@SP // 12706
M=M-1 // 12707

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
@Screen.drawLine.EQ.3 // 12708
D=A // 12709
@SP // 12710
AM=M+1 // 12711
A=A-1 // 12712
M=D // 12713
@ARG // 12714
A=M+1 // 12715
A=A+1 // 12716
D=M // 12717
A=A-1 // 12718
A=A-1 // 12719
D=M-D // 12720
@DO_EQ // 12721
0;JMP // 12722
(Screen.drawLine.EQ.3)
@SP // 12723
AM=M+1 // 12724
A=A-1 // 12725
M=D // 12726
@Screen.drawLine.EQ.4 // 12727
D=A // 12728
@SP // 12729
AM=M+1 // 12730
A=A-1 // 12731
M=D // 12732
@ARG // 12733
A=M+1 // 12734
A=A+1 // 12735
A=A+1 // 12736
D=M // 12737
A=A-1 // 12738
A=A-1 // 12739
D=M-D // 12740
@DO_EQ // 12741
0;JMP // 12742
(Screen.drawLine.EQ.4)
@SP // 12743
AM=M-1 // 12744
D=D&M // 12745
D=!D // 12746
@Screen.drawLine.IfElseEND3 // 12747
D;JNE // 12748

////PushInstruction("constant 0")
@SP // 12749
AM=M+1 // 12750
A=A-1 // 12751
M=0 // 12752
@RETURN // 12753
0;JMP // 12754

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

@LCL // 12755
D=M // 12756
@4 // 12757
A=D+A // 12758
D=M // 12759
D=D+M // 12760
@SP // 12761
AM=M+1 // 12762
A=A-1 // 12763
M=D // 12764
@LCL // 12765
D=M // 12766
@5 // 12767
A=D+A // 12768
D=A // 12769
@R13 // 12770
M=D // 12771
@SP // 12772
AM=M-1 // 12773
D=M // 12774
@R13 // 12775
A=M // 12776
M=D // 12777

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
@Screen.drawLine.GT.5 // 12778
D=A // 12779
@SP // 12780
AM=M+1 // 12781
A=A-1 // 12782
M=D // 12783
@LCL // 12784
D=M // 12785
@5 // 12786
A=D+A // 12787
D=M // 12788
@SP // 12789
AM=M+1 // 12790
A=A-1 // 12791
M=D // 12792
@LCL // 12793
A=M+1 // 12794
D=M // 12795
@SP // 12796
AM=M-1 // 12797
D=D+M // 12798
@DO_GT // 12799
0;JMP // 12800
(Screen.drawLine.GT.5)
D=!D // 12801
@Screen.drawLine.IfElseEND4 // 12802
D;JNE // 12803

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

@LCL // 12804
D=M // 12805
@4 // 12806
A=D+A // 12807
D=M // 12808
A=A-1 // 12809
A=A-1 // 12810
A=A-1 // 12811
D=D-M // 12812
@SP // 12813
AM=M+1 // 12814
A=A-1 // 12815
M=D // 12816
@LCL // 12817
D=M // 12818
@4 // 12819
A=D+A // 12820
D=A // 12821
@R13 // 12822
M=D // 12823
@SP // 12824
AM=M-1 // 12825
D=M // 12826
@R13 // 12827
A=M // 12828
M=D // 12829

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

@LCL // 12830
A=M+1 // 12831
A=A+1 // 12832
D=M // 12833
@ARG // 12834
A=M // 12835
M=D+M // 12836

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
@Screen.drawLine.LT.6 // 12837
D=A // 12838
@SP // 12839
AM=M+1 // 12840
A=A-1 // 12841
M=D // 12842
@LCL // 12843
D=M // 12844
@5 // 12845
A=D+A // 12846
D=M // 12847
@SP // 12848
AM=M+1 // 12849
A=A-1 // 12850
M=D // 12851
@LCL // 12852
A=M // 12853
D=M // 12854
@SP // 12855
AM=M-1 // 12856
D=M-D // 12857
@DO_LT // 12858
0;JMP // 12859
(Screen.drawLine.LT.6)
D=!D // 12860
@Screen.drawLine.IfElseEND5 // 12861
D;JNE // 12862

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

@LCL // 12863
D=M // 12864
@4 // 12865
A=D+A // 12866
D=M // 12867
@SP // 12868
AM=M+1 // 12869
A=A-1 // 12870
M=D // 12871
@LCL // 12872
A=M // 12873
D=M // 12874
@SP // 12875
AM=M-1 // 12876
D=D+M // 12877
@SP // 12878
AM=M+1 // 12879
A=A-1 // 12880
M=D // 12881
@LCL // 12882
D=M // 12883
@4 // 12884
A=D+A // 12885
D=A // 12886
@R13 // 12887
M=D // 12888
@SP // 12889
AM=M-1 // 12890
D=M // 12891
@R13 // 12892
A=M // 12893
M=D // 12894

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

@LCL // 12895
A=M+1 // 12896
A=A+1 // 12897
A=A+1 // 12898
D=M // 12899
@ARG // 12900
A=M+1 // 12901
M=D+M // 12902

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 12903
0;JMP // 12904

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 12905
AM=M+1 // 12906
A=A-1 // 12907
M=0 // 12908
@RETURN // 12909
0;JMP // 12910

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 12911
AM=M+1 // 12912
A=A-1 // 12913
M=0 // 12914

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12915
A=M // 12916
D=M // 12917
@LCL // 12918
A=M // 12919
M=D // 12920

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
@Screen.drawHorizontalLine.GT.7 // 12921
D=A // 12922
@SP // 12923
AM=M+1 // 12924
A=A-1 // 12925
M=D // 12926
@LCL // 12927
A=M // 12928
D=M // 12929
@SP // 12930
AM=M+1 // 12931
A=A-1 // 12932
M=D // 12933
@ARG // 12934
A=M+1 // 12935
D=M // 12936
@SP // 12937
AM=M-1 // 12938
D=M-D // 12939
@DO_GT // 12940
0;JMP // 12941
(Screen.drawHorizontalLine.GT.7)
@WHILE_END_Screen.drawHorizontalLine1 // 12942
D;JNE // 12943

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12944
A=M // 12945
D=M // 12946
@SP // 12947
AM=M+1 // 12948
A=A-1 // 12949
M=D // 12950
@ARG // 12951
A=M+1 // 12952
A=A+1 // 12953
D=M // 12954
@SP // 12955
AM=M+1 // 12956
A=A-1 // 12957
M=D // 12958
// call Screen.drawPixel
@7 // 12959
D=A // 12960
@14 // 12961
M=D // 12962
@Screen.drawPixel // 12963
D=A // 12964
@13 // 12965
M=D // 12966
@Screen.drawHorizontalLine.ret.0 // 12967
D=A // 12968
@CALL // 12969
0;JMP // 12970
(Screen.drawHorizontalLine.ret.0)
@SP // 12971
M=M-1 // 12972

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

@LCL // 12973
A=M // 12974
M=M+1 // 12975

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 12976
0;JMP // 12977

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 12978
AM=M+1 // 12979
A=A-1 // 12980
M=0 // 12981
@RETURN // 12982
0;JMP // 12983

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 12984
D=A // 12985
@SP // 12986
AM=D+M // 12987
A=A-1 // 12988
M=0 // 12989
A=A-1 // 12990
M=0 // 12991
A=A-1 // 12992
M=0 // 12993
A=A-1 // 12994
M=0 // 12995
A=A-1 // 12996
M=0 // 12997

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12998
A=M // 12999
M=0 // 13000

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13001
A=M+1 // 13002
A=A+1 // 13003
D=M // 13004
@LCL // 13005
A=M+1 // 13006
M=D // 13007

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

@ARG // 13008
A=M+1 // 13009
A=A+1 // 13010
D=M // 13011
D=D-1 // 13012
D=-D // 13013
@LCL // 13014
A=M+1 // 13015
A=A+1 // 13016
M=D // 13017

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
@Screen.drawCircle.GT.8 // 13018
D=A // 13019
@SP // 13020
AM=M+1 // 13021
A=A-1 // 13022
M=D // 13023
@LCL // 13024
A=M+1 // 13025
D=M // 13026
A=A-1 // 13027
D=M-D // 13028
@DO_GT // 13029
0;JMP // 13030
(Screen.drawCircle.GT.8)
@WHILE_END_Screen.drawCircle1 // 13031
D;JNE // 13032

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

@ARG // 13033
A=M // 13034
D=M // 13035
@SP // 13036
AM=M+1 // 13037
A=A-1 // 13038
M=D // 13039
@LCL // 13040
A=M // 13041
D=M // 13042
@SP // 13043
AM=M-1 // 13044
D=M-D // 13045
@SP // 13046
AM=M+1 // 13047
A=A-1 // 13048
M=D // 13049
@ARG // 13050
A=M // 13051
D=M // 13052
@SP // 13053
AM=M+1 // 13054
A=A-1 // 13055
M=D // 13056
@LCL // 13057
A=M // 13058
D=M // 13059
@SP // 13060
AM=M-1 // 13061
D=D+M // 13062
@SP // 13063
AM=M+1 // 13064
A=A-1 // 13065
M=D // 13066
@ARG // 13067
A=M+1 // 13068
D=M // 13069
@SP // 13070
AM=M+1 // 13071
A=A-1 // 13072
M=D // 13073
@LCL // 13074
A=M+1 // 13075
D=M // 13076
@SP // 13077
AM=M-1 // 13078
D=D+M // 13079
@SP // 13080
AM=M+1 // 13081
A=A-1 // 13082
M=D // 13083
// call Screen.drawHorizontalLine
@8 // 13084
D=A // 13085
@14 // 13086
M=D // 13087
@Screen.drawHorizontalLine // 13088
D=A // 13089
@13 // 13090
M=D // 13091
@Screen.drawCircle.ret.0 // 13092
D=A // 13093
@CALL // 13094
0;JMP // 13095
(Screen.drawCircle.ret.0)
@SP // 13096
M=M-1 // 13097

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

@ARG // 13098
A=M // 13099
D=M // 13100
@SP // 13101
AM=M+1 // 13102
A=A-1 // 13103
M=D // 13104
@LCL // 13105
A=M // 13106
D=M // 13107
@SP // 13108
AM=M-1 // 13109
D=M-D // 13110
@SP // 13111
AM=M+1 // 13112
A=A-1 // 13113
M=D // 13114
@ARG // 13115
A=M // 13116
D=M // 13117
@SP // 13118
AM=M+1 // 13119
A=A-1 // 13120
M=D // 13121
@LCL // 13122
A=M // 13123
D=M // 13124
@SP // 13125
AM=M-1 // 13126
D=D+M // 13127
@SP // 13128
AM=M+1 // 13129
A=A-1 // 13130
M=D // 13131
@ARG // 13132
A=M+1 // 13133
D=M // 13134
@SP // 13135
AM=M+1 // 13136
A=A-1 // 13137
M=D // 13138
@LCL // 13139
A=M+1 // 13140
D=M // 13141
@SP // 13142
AM=M-1 // 13143
D=M-D // 13144
@SP // 13145
AM=M+1 // 13146
A=A-1 // 13147
M=D // 13148
// call Screen.drawHorizontalLine
@8 // 13149
D=A // 13150
@14 // 13151
M=D // 13152
@Screen.drawHorizontalLine // 13153
D=A // 13154
@13 // 13155
M=D // 13156
@Screen.drawCircle.ret.1 // 13157
D=A // 13158
@CALL // 13159
0;JMP // 13160
(Screen.drawCircle.ret.1)
@SP // 13161
M=M-1 // 13162

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

@ARG // 13163
A=M // 13164
D=M // 13165
@SP // 13166
AM=M+1 // 13167
A=A-1 // 13168
M=D // 13169
@LCL // 13170
A=M+1 // 13171
D=M // 13172
@SP // 13173
AM=M-1 // 13174
D=M-D // 13175
@SP // 13176
AM=M+1 // 13177
A=A-1 // 13178
M=D // 13179
@ARG // 13180
A=M // 13181
D=M // 13182
@SP // 13183
AM=M+1 // 13184
A=A-1 // 13185
M=D // 13186
@LCL // 13187
A=M+1 // 13188
D=M // 13189
@SP // 13190
AM=M-1 // 13191
D=D+M // 13192
@SP // 13193
AM=M+1 // 13194
A=A-1 // 13195
M=D // 13196
@ARG // 13197
A=M+1 // 13198
D=M // 13199
@SP // 13200
AM=M+1 // 13201
A=A-1 // 13202
M=D // 13203
@LCL // 13204
A=M // 13205
D=M // 13206
@SP // 13207
AM=M-1 // 13208
D=D+M // 13209
@SP // 13210
AM=M+1 // 13211
A=A-1 // 13212
M=D // 13213
// call Screen.drawHorizontalLine
@8 // 13214
D=A // 13215
@14 // 13216
M=D // 13217
@Screen.drawHorizontalLine // 13218
D=A // 13219
@13 // 13220
M=D // 13221
@Screen.drawCircle.ret.2 // 13222
D=A // 13223
@CALL // 13224
0;JMP // 13225
(Screen.drawCircle.ret.2)
@SP // 13226
M=M-1 // 13227

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

@ARG // 13228
A=M // 13229
D=M // 13230
@SP // 13231
AM=M+1 // 13232
A=A-1 // 13233
M=D // 13234
@LCL // 13235
A=M+1 // 13236
D=M // 13237
@SP // 13238
AM=M-1 // 13239
D=M-D // 13240
@SP // 13241
AM=M+1 // 13242
A=A-1 // 13243
M=D // 13244
@ARG // 13245
A=M // 13246
D=M // 13247
@SP // 13248
AM=M+1 // 13249
A=A-1 // 13250
M=D // 13251
@LCL // 13252
A=M+1 // 13253
D=M // 13254
@SP // 13255
AM=M-1 // 13256
D=D+M // 13257
@SP // 13258
AM=M+1 // 13259
A=A-1 // 13260
M=D // 13261
@ARG // 13262
A=M+1 // 13263
D=M // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268
@LCL // 13269
A=M // 13270
D=M // 13271
@SP // 13272
AM=M-1 // 13273
D=M-D // 13274
@SP // 13275
AM=M+1 // 13276
A=A-1 // 13277
M=D // 13278
// call Screen.drawHorizontalLine
@8 // 13279
D=A // 13280
@14 // 13281
M=D // 13282
@Screen.drawHorizontalLine // 13283
D=A // 13284
@13 // 13285
M=D // 13286
@Screen.drawCircle.ret.3 // 13287
D=A // 13288
@CALL // 13289
0;JMP // 13290
(Screen.drawCircle.ret.3)
@SP // 13291
M=M-1 // 13292

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawCircle.IfElse1}}
@Screen.drawCircle.LT.9 // 13293
D=A // 13294
@SP // 13295
AM=M+1 // 13296
A=A-1 // 13297
M=D // 13298
@LCL // 13299
A=M+1 // 13300
A=A+1 // 13301
D=M // 13302
@DO_LT // 13303
0;JMP // 13304
(Screen.drawCircle.LT.9)
D=!D // 13305
@Screen.drawCircle.IfElse1 // 13306
D;JNE // 13307

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

@LCL // 13308
A=M+1 // 13309
A=A+1 // 13310
D=M // 13311
@SP // 13312
AM=M+1 // 13313
A=A-1 // 13314
M=D // 13315
@LCL // 13316
A=M // 13317
D=M // 13318
D=D+M // 13319
@SP // 13320
AM=M-1 // 13321
D=D+M // 13322
@3 // 13323
D=D+A // 13324
@LCL // 13325
A=M+1 // 13326
A=A+1 // 13327
M=D // 13328

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13329
0;JMP // 13330

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

@LCL // 13331
A=M+1 // 13332
A=A+1 // 13333
D=M // 13334
@SP // 13335
AM=M+1 // 13336
A=A-1 // 13337
M=D // 13338
@LCL // 13339
A=M+1 // 13340
D=M // 13341
A=A-1 // 13342
D=M-D // 13343
@R13 // 13344
M=D // 13345
D=D+M // 13346
@SP // 13347
AM=M-1 // 13348
D=D+M // 13349
@5 // 13350
D=D+A // 13351
@LCL // 13352
A=M+1 // 13353
A=A+1 // 13354
M=D // 13355

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

@LCL // 13356
A=M+1 // 13357
M=M-1 // 13358

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

@LCL // 13359
A=M // 13360
M=M+1 // 13361

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13362
0;JMP // 13363

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13364
AM=M+1 // 13365
A=A-1 // 13366
M=0 // 13367
@RETURN // 13368
0;JMP // 13369

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13370
D=A // 13371
@SP // 13372
AM=D+M // 13373
A=A-1 // 13374
M=0 // 13375
A=A-1 // 13376
M=0 // 13377
A=A-1 // 13378
M=0 // 13379
A=A-1 // 13380
M=0 // 13381
A=A-1 // 13382
M=0 // 13383
A=A-1 // 13384
M=0 // 13385
A=A-1 // 13386
M=0 // 13387
A=A-1 // 13388
M=0 // 13389
A=A-1 // 13390
M=0 // 13391
A=A-1 // 13392
M=0 // 13393

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13394
D=M // 13395
@9 // 13396
A=D+A // 13397
M=-1 // 13398

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElseEND1}}
@Screen.0 // 13399
D=M // 13400
@Screen.drawRectangle.IfElseEND1 // 13401
D;JNE // 13402

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13403
D=M // 13404
@9 // 13405
A=D+A // 13406
M=0 // 13407

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13408
A=M+1 // 13409
D=M // 13410
@LCL // 13411
A=M // 13412
M=D // 13413

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
@Screen.drawRectangle.GT.10 // 13414
D=A // 13415
@SP // 13416
AM=M+1 // 13417
A=A-1 // 13418
M=D // 13419
@LCL // 13420
A=M // 13421
D=M // 13422
@SP // 13423
AM=M+1 // 13424
A=A-1 // 13425
M=D // 13426
@ARG // 13427
A=M+1 // 13428
A=A+1 // 13429
A=A+1 // 13430
D=M // 13431
@SP // 13432
AM=M-1 // 13433
D=M-D // 13434
@DO_GT // 13435
0;JMP // 13436
(Screen.drawRectangle.GT.10)
@WHILE_END_Screen.drawRectangle1 // 13437
D;JNE // 13438

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13439
A=M // 13440
D=M // 13441
@SP // 13442
AM=M+1 // 13443
A=A-1 // 13444
M=D // 13445
@16 // 13446
D=A // 13447
@SP // 13448
AM=M+1 // 13449
A=A-1 // 13450
M=D // 13451
// call Math.divide
@7 // 13452
D=A // 13453
@14 // 13454
M=D // 13455
@Math.divide // 13456
D=A // 13457
@13 // 13458
M=D // 13459
@Screen.drawRectangle.ret.0 // 13460
D=A // 13461
@CALL // 13462
0;JMP // 13463
(Screen.drawRectangle.ret.0)
@SP // 13464
AM=M-1 // 13465
D=M // 13466
@LCL // 13467
A=M+1 // 13468
M=D // 13469

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13470
A=M+1 // 13471
A=A+1 // 13472
D=M // 13473
@SP // 13474
AM=M+1 // 13475
A=A-1 // 13476
M=D // 13477
@16 // 13478
D=A // 13479
@SP // 13480
AM=M+1 // 13481
A=A-1 // 13482
M=D // 13483
// call Math.divide
@7 // 13484
D=A // 13485
@14 // 13486
M=D // 13487
@Math.divide // 13488
D=A // 13489
@13 // 13490
M=D // 13491
@Screen.drawRectangle.ret.1 // 13492
D=A // 13493
@CALL // 13494
0;JMP // 13495
(Screen.drawRectangle.ret.1)
@SP // 13496
AM=M-1 // 13497
D=M // 13498
@LCL // 13499
A=M+1 // 13500
A=A+1 // 13501
M=D // 13502

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

@ARG // 13503
A=M // 13504
D=M // 13505
@15 // 13506
D=D&A // 13507
@LCL // 13508
A=M+1 // 13509
A=A+1 // 13510
A=A+1 // 13511
M=D // 13512

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

@ARG // 13513
A=M+1 // 13514
A=A+1 // 13515
D=M // 13516
@15 // 13517
D=D&A // 13518
@SP // 13519
AM=M+1 // 13520
A=A-1 // 13521
M=D // 13522
@LCL // 13523
D=M // 13524
@4 // 13525
A=D+A // 13526
D=A // 13527
@R13 // 13528
M=D // 13529
@SP // 13530
AM=M-1 // 13531
D=M // 13532
@R13 // 13533
A=M // 13534
M=D // 13535

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13536
A=M // 13537
D=M // 13538
@SP // 13539
AM=M+1 // 13540
A=A-1 // 13541
M=D // 13542
@32 // 13543
D=A // 13544
@SP // 13545
AM=M+1 // 13546
A=A-1 // 13547
M=D // 13548
// call Math.multiply
@7 // 13549
D=A // 13550
@14 // 13551
M=D // 13552
@Math.multiply // 13553
D=A // 13554
@13 // 13555
M=D // 13556
@Screen.drawRectangle.ret.2 // 13557
D=A // 13558
@CALL // 13559
0;JMP // 13560
(Screen.drawRectangle.ret.2)
@LCL // 13561
D=M // 13562
@5 // 13563
A=D+A // 13564
D=A // 13565
@R13 // 13566
M=D // 13567
@SP // 13568
AM=M-1 // 13569
D=M // 13570
@R13 // 13571
A=M // 13572
M=D // 13573

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("local 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse2}}
@Screen.drawRectangle.EQ.11 // 13574
D=A // 13575
@SP // 13576
AM=M+1 // 13577
A=A-1 // 13578
M=D // 13579
@LCL // 13580
A=M+1 // 13581
A=A+1 // 13582
D=M // 13583
A=A-1 // 13584
D=M-D // 13585
@DO_EQ // 13586
0;JMP // 13587
(Screen.drawRectangle.EQ.11)
D=!D // 13588
@Screen.drawRectangle.IfElse2 // 13589
D;JNE // 13590

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

@LCL // 13591
D=M // 13592
@4 // 13593
A=D+A // 13594
D=M // 13595
@SP // 13596
AM=M+1 // 13597
A=A-1 // 13598
M=D+1 // 13599
// call Math.twoToThe
@6 // 13600
D=A // 13601
@14 // 13602
M=D // 13603
@Math.twoToThe // 13604
D=A // 13605
@13 // 13606
M=D // 13607
@Screen.drawRectangle.ret.3 // 13608
D=A // 13609
@CALL // 13610
0;JMP // 13611
(Screen.drawRectangle.ret.3)
@SP // 13612
AM=M-1 // 13613
D=M // 13614
D=D-1 // 13615
@SP // 13616
AM=M+1 // 13617
A=A-1 // 13618
M=D // 13619
@LCL // 13620
A=M+1 // 13621
A=A+1 // 13622
A=A+1 // 13623
D=M // 13624
@SP // 13625
AM=M+1 // 13626
A=A-1 // 13627
M=D // 13628
// call Math.twoToThe
@6 // 13629
D=A // 13630
@14 // 13631
M=D // 13632
@Math.twoToThe // 13633
D=A // 13634
@13 // 13635
M=D // 13636
@Screen.drawRectangle.ret.4 // 13637
D=A // 13638
@CALL // 13639
0;JMP // 13640
(Screen.drawRectangle.ret.4)
@SP // 13641
AM=M-1 // 13642
D=M // 13643
D=D-1 // 13644
@SP // 13645
AM=M-1 // 13646
D=M-D // 13647
@SP // 13648
AM=M+1 // 13649
A=A-1 // 13650
M=D // 13651
@LCL // 13652
D=M // 13653
@6 // 13654
A=D+A // 13655
D=A // 13656
@R13 // 13657
M=D // 13658
@SP // 13659
AM=M-1 // 13660
D=M // 13661
@R13 // 13662
A=M // 13663
M=D // 13664

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

@LCL // 13665
D=M // 13666
@5 // 13667
A=D+A // 13668
D=M // 13669
@SP // 13670
AM=M+1 // 13671
A=A-1 // 13672
M=D // 13673
@LCL // 13674
A=M+1 // 13675
D=M // 13676
@SP // 13677
AM=M-1 // 13678
D=D+M // 13679
@SP // 13680
AM=M+1 // 13681
A=A-1 // 13682
M=D // 13683
@LCL // 13684
D=M // 13685
@7 // 13686
A=D+A // 13687
D=A // 13688
@R13 // 13689
M=D // 13690
@SP // 13691
AM=M-1 // 13692
D=M // 13693
@R13 // 13694
A=M // 13695
M=D // 13696

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.0 // 13697
D=!M // 13698
@Screen.drawRectangle.IfElse3 // 13699
D;JNE // 13700

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
@LCL // 13701
D=M // 13702
@7 // 13703
A=D+A // 13704
D=M // 13705
@16384 // 13706
D=D+A // 13707
@SP // 13708
AM=M+1 // 13709
A=A-1 // 13710
M=D // 13711
@LCL // 13712
D=M // 13713
@7 // 13714
A=D+A // 13715
D=M // 13716
@16384 // 13717
A=D+A // 13718
D=M // 13719
@SP // 13720
AM=M+1 // 13721
A=A-1 // 13722
M=D // 13723
@LCL // 13724
D=M // 13725
@6 // 13726
A=D+A // 13727
D=M // 13728
@SP // 13729
AM=M-1 // 13730
D=D|M // 13731
@SP // 13732
AM=M-1 // 13733
A=M // 13734
M=D // 13735

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 13736
0;JMP // 13737

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
@LCL // 13738
D=M // 13739
@7 // 13740
A=D+A // 13741
D=M // 13742
@16384 // 13743
D=D+A // 13744
@SP // 13745
AM=M+1 // 13746
A=A-1 // 13747
M=D // 13748
@LCL // 13749
D=M // 13750
@7 // 13751
A=D+A // 13752
D=M // 13753
@16384 // 13754
A=D+A // 13755
D=M // 13756
@SP // 13757
AM=M+1 // 13758
A=A-1 // 13759
M=D // 13760
@LCL // 13761
D=M // 13762
@6 // 13763
A=D+A // 13764
D=!M // 13765
@SP // 13766
AM=M-1 // 13767
D=D&M // 13768
@SP // 13769
AM=M-1 // 13770
A=M // 13771
M=D // 13772

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 13773
0;JMP // 13774

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

@LCL // 13775
A=M+1 // 13776
A=A+1 // 13777
A=A+1 // 13778
D=M // 13779
@SP // 13780
AM=M+1 // 13781
A=A-1 // 13782
M=D // 13783
// call Math.twoToThe
@6 // 13784
D=A // 13785
@14 // 13786
M=D // 13787
@Math.twoToThe // 13788
D=A // 13789
@13 // 13790
M=D // 13791
@Screen.drawRectangle.ret.5 // 13792
D=A // 13793
@CALL // 13794
0;JMP // 13795
(Screen.drawRectangle.ret.5)
@SP // 13796
AM=M-1 // 13797
D=M // 13798
D=D-1 // 13799
@SP // 13800
AM=M+1 // 13801
A=A-1 // 13802
M=D // 13803
@SP // 13804
A=M-1 // 13805
M=!D // 13806
@LCL // 13807
D=M // 13808
@6 // 13809
A=D+A // 13810
D=A // 13811
@R13 // 13812
M=D // 13813
@SP // 13814
AM=M-1 // 13815
D=M // 13816
@R13 // 13817
A=M // 13818
M=D // 13819

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

@LCL // 13820
D=M // 13821
@5 // 13822
A=D+A // 13823
D=M // 13824
@SP // 13825
AM=M+1 // 13826
A=A-1 // 13827
M=D // 13828
@LCL // 13829
A=M+1 // 13830
D=M // 13831
@SP // 13832
AM=M-1 // 13833
D=D+M // 13834
@SP // 13835
AM=M+1 // 13836
A=A-1 // 13837
M=D // 13838
@LCL // 13839
D=M // 13840
@7 // 13841
A=D+A // 13842
D=A // 13843
@R13 // 13844
M=D // 13845
@SP // 13846
AM=M-1 // 13847
D=M // 13848
@R13 // 13849
A=M // 13850
M=D // 13851

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.0 // 13852
D=!M // 13853
@Screen.drawRectangle.IfElse4 // 13854
D;JNE // 13855

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
@LCL // 13856
D=M // 13857
@7 // 13858
A=D+A // 13859
D=M // 13860
@16384 // 13861
D=D+A // 13862
@SP // 13863
AM=M+1 // 13864
A=A-1 // 13865
M=D // 13866
@LCL // 13867
D=M // 13868
@7 // 13869
A=D+A // 13870
D=M // 13871
@16384 // 13872
A=D+A // 13873
D=M // 13874
@SP // 13875
AM=M+1 // 13876
A=A-1 // 13877
M=D // 13878
@LCL // 13879
D=M // 13880
@6 // 13881
A=D+A // 13882
D=M // 13883
@SP // 13884
AM=M-1 // 13885
D=D|M // 13886
@SP // 13887
AM=M-1 // 13888
A=M // 13889
M=D // 13890

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 13891
0;JMP // 13892

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
@LCL // 13893
D=M // 13894
@7 // 13895
A=D+A // 13896
D=M // 13897
@16384 // 13898
D=D+A // 13899
@SP // 13900
AM=M+1 // 13901
A=A-1 // 13902
M=D // 13903
@LCL // 13904
D=M // 13905
@7 // 13906
A=D+A // 13907
D=M // 13908
@16384 // 13909
A=D+A // 13910
D=M // 13911
@SP // 13912
AM=M+1 // 13913
A=A-1 // 13914
M=D // 13915
@LCL // 13916
D=M // 13917
@6 // 13918
A=D+A // 13919
D=!M // 13920
@SP // 13921
AM=M-1 // 13922
D=D&M // 13923
@SP // 13924
AM=M-1 // 13925
A=M // 13926
M=D // 13927

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

@LCL // 13928
A=M+1 // 13929
D=M // 13930
@SP // 13931
AM=M+1 // 13932
A=A-1 // 13933
M=D+1 // 13934
@LCL // 13935
D=M // 13936
@8 // 13937
A=D+A // 13938
D=A // 13939
@R13 // 13940
M=D // 13941
@SP // 13942
AM=M-1 // 13943
D=M // 13944
@R13 // 13945
A=M // 13946
M=D // 13947

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
@Screen.drawRectangle.LT.12 // 13948
D=A // 13949
@SP // 13950
AM=M+1 // 13951
A=A-1 // 13952
M=D // 13953
@LCL // 13954
D=M // 13955
@8 // 13956
A=D+A // 13957
D=M // 13958
@SP // 13959
AM=M+1 // 13960
A=A-1 // 13961
M=D // 13962
@LCL // 13963
A=M+1 // 13964
A=A+1 // 13965
D=M // 13966
@SP // 13967
AM=M-1 // 13968
D=M-D // 13969
@DO_LT // 13970
0;JMP // 13971
(Screen.drawRectangle.LT.12)
D=!D // 13972
@WHILE_END_Screen.drawRectangle2 // 13973
D;JNE // 13974

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

@LCL // 13975
D=M // 13976
@8 // 13977
A=D+A // 13978
D=M // 13979
A=A-1 // 13980
A=A-1 // 13981
A=A-1 // 13982
D=D+M // 13983
@SP // 13984
AM=M+1 // 13985
A=A-1 // 13986
M=D // 13987
@LCL // 13988
D=M // 13989
@7 // 13990
A=D+A // 13991
D=A // 13992
@R13 // 13993
M=D // 13994
@SP // 13995
AM=M-1 // 13996
D=M // 13997
@R13 // 13998
A=M // 13999
M=D // 14000

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14001
D=M // 14002
@7 // 14003
A=D+A // 14004
D=M // 14005
@16384 // 14006
D=D+A // 14007
@SP // 14008
AM=M+1 // 14009
A=A-1 // 14010
M=D // 14011
@LCL // 14012
D=M // 14013
@9 // 14014
A=D+A // 14015
D=M // 14016
@SP // 14017
AM=M-1 // 14018
A=M // 14019
M=D // 14020

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

@LCL // 14021
D=M // 14022
@8 // 14023
A=D+A // 14024
M=M+1 // 14025

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14026
0;JMP // 14027

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

@LCL // 14028
D=M // 14029
@4 // 14030
A=D+A // 14031
D=M // 14032
@SP // 14033
AM=M+1 // 14034
A=A-1 // 14035
M=D+1 // 14036
// call Math.twoToThe
@6 // 14037
D=A // 14038
@14 // 14039
M=D // 14040
@Math.twoToThe // 14041
D=A // 14042
@13 // 14043
M=D // 14044
@Screen.drawRectangle.ret.6 // 14045
D=A // 14046
@CALL // 14047
0;JMP // 14048
(Screen.drawRectangle.ret.6)
@SP // 14049
AM=M-1 // 14050
D=M // 14051
D=D-1 // 14052
@SP // 14053
AM=M+1 // 14054
A=A-1 // 14055
M=D // 14056
@LCL // 14057
D=M // 14058
@6 // 14059
A=D+A // 14060
D=A // 14061
@R13 // 14062
M=D // 14063
@SP // 14064
AM=M-1 // 14065
D=M // 14066
@R13 // 14067
A=M // 14068
M=D // 14069

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

@LCL // 14070
D=M // 14071
@5 // 14072
A=D+A // 14073
D=M // 14074
A=A-1 // 14075
A=A-1 // 14076
A=A-1 // 14077
D=D+M // 14078
@SP // 14079
AM=M+1 // 14080
A=A-1 // 14081
M=D // 14082
@LCL // 14083
D=M // 14084
@7 // 14085
A=D+A // 14086
D=A // 14087
@R13 // 14088
M=D // 14089
@SP // 14090
AM=M-1 // 14091
D=M // 14092
@R13 // 14093
A=M // 14094
M=D // 14095

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.0 // 14096
D=!M // 14097
@Screen.drawRectangle.IfElse5 // 14098
D;JNE // 14099

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
@LCL // 14100
D=M // 14101
@7 // 14102
A=D+A // 14103
D=M // 14104
@16384 // 14105
D=D+A // 14106
@SP // 14107
AM=M+1 // 14108
A=A-1 // 14109
M=D // 14110
@LCL // 14111
D=M // 14112
@7 // 14113
A=D+A // 14114
D=M // 14115
@16384 // 14116
A=D+A // 14117
D=M // 14118
@SP // 14119
AM=M+1 // 14120
A=A-1 // 14121
M=D // 14122
@LCL // 14123
D=M // 14124
@6 // 14125
A=D+A // 14126
D=M // 14127
@SP // 14128
AM=M-1 // 14129
D=D|M // 14130
@SP // 14131
AM=M-1 // 14132
A=M // 14133
M=D // 14134

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14135
0;JMP // 14136

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
@LCL // 14137
D=M // 14138
@7 // 14139
A=D+A // 14140
D=M // 14141
@16384 // 14142
D=D+A // 14143
@SP // 14144
AM=M+1 // 14145
A=A-1 // 14146
M=D // 14147
@LCL // 14148
D=M // 14149
@7 // 14150
A=D+A // 14151
D=M // 14152
@16384 // 14153
A=D+A // 14154
D=M // 14155
@SP // 14156
AM=M+1 // 14157
A=A-1 // 14158
M=D // 14159
@LCL // 14160
D=M // 14161
@6 // 14162
A=D+A // 14163
D=!M // 14164
@SP // 14165
AM=M-1 // 14166
D=D&M // 14167
@SP // 14168
AM=M-1 // 14169
A=M // 14170
M=D // 14171

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

@LCL // 14172
A=M // 14173
M=M+1 // 14174

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14175
0;JMP // 14176

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14177
AM=M+1 // 14178
A=A-1 // 14179
M=0 // 14180
@RETURN // 14181
0;JMP // 14182

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14183
AM=M+1 // 14184
A=A-1 // 14185
M=0 // 14186

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14187
A=M // 14188
M=0 // 14189

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
@Screen.clearScreen.LT.13 // 14190
D=A // 14191
@SP // 14192
AM=M+1 // 14193
A=A-1 // 14194
M=D // 14195
@LCL // 14196
A=M // 14197
D=M // 14198
@8192 // 14199
D=D-A // 14200
@DO_LT // 14201
0;JMP // 14202
(Screen.clearScreen.LT.13)
D=!D // 14203
@WHILE_END_Screen.clearScreen1 // 14204
D;JNE // 14205

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14206
A=M // 14207
D=M // 14208
@16384 // 14209
D=D+A // 14210
@SP // 14211
AM=M+1 // 14212
A=A-1 // 14213
M=D // 14214
D=0 // 14215
@SP // 14216
AM=M-1 // 14217
A=M // 14218
M=D // 14219

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

@LCL // 14220
A=M // 14221
M=M+1 // 14222

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14223
0;JMP // 14224

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14225
AM=M+1 // 14226
A=A-1 // 14227
M=0 // 14228
@RETURN // 14229
0;JMP // 14230

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14231
D=A // 14232
@SP // 14233
AM=M+1 // 14234
A=A-1 // 14235
M=D // 14236
// call Memory.alloc
@6 // 14237
D=A // 14238
@14 // 14239
M=D // 14240
@Memory.alloc // 14241
D=A // 14242
@13 // 14243
M=D // 14244
@String.new.ret.0 // 14245
D=A // 14246
@CALL // 14247
0;JMP // 14248
(String.new.ret.0)
@SP // 14249
AM=M-1 // 14250
D=M // 14251
@3 // 14252
M=D // 14253

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.new.IfElse1}}
@String.new.EQ.0 // 14254
D=A // 14255
@SP // 14256
AM=M+1 // 14257
A=A-1 // 14258
M=D // 14259
@ARG // 14260
A=M // 14261
D=M // 14262
@DO_EQ // 14263
0;JMP // 14264
(String.new.EQ.0)
D=!D // 14265
@String.new.IfElse1 // 14266
D;JNE // 14267

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14268
A=M // 14269
M=0 // 14270

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14271
0;JMP // 14272

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14273
A=M // 14274
D=M // 14275
@SP // 14276
AM=M+1 // 14277
A=A-1 // 14278
M=D // 14279
// call Array.new
@6 // 14280
D=A // 14281
@14 // 14282
M=D // 14283
@Array.new // 14284
D=A // 14285
@13 // 14286
M=D // 14287
@String.new.ret.1 // 14288
D=A // 14289
@CALL // 14290
0;JMP // 14291
(String.new.ret.1)
@SP // 14292
AM=M-1 // 14293
D=M // 14294
@THIS // 14295
A=M // 14296
M=D // 14297

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14298
A=M // 14299
D=M // 14300
@THIS // 14301
A=M+1 // 14302
A=A+1 // 14303
M=D // 14304

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14305
A=M+1 // 14306
M=0 // 14307

////PushInstruction("pointer 0")
@3 // 14308
D=M // 14309
@SP // 14310
AM=M+1 // 14311
A=A-1 // 14312
M=D // 14313
@RETURN // 14314
0;JMP // 14315

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14316
A=M // 14317
D=M // 14318
@3 // 14319
M=D // 14320

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.dispose.IfElseEND1}}
@String.dispose.EQ.1 // 14321
D=A // 14322
@SP // 14323
AM=M+1 // 14324
A=A-1 // 14325
M=D // 14326
@THIS // 14327
A=M // 14328
D=M // 14329
@DO_EQ // 14330
0;JMP // 14331
(String.dispose.EQ.1)
@String.dispose.IfElseEND1 // 14332
D;JNE // 14333

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14334
A=M // 14335
D=M // 14336
@SP // 14337
AM=M+1 // 14338
A=A-1 // 14339
M=D // 14340
// call Array.dispose
@6 // 14341
D=A // 14342
@14 // 14343
M=D // 14344
@Array.dispose // 14345
D=A // 14346
@13 // 14347
M=D // 14348
@String.dispose.ret.0 // 14349
D=A // 14350
@CALL // 14351
0;JMP // 14352
(String.dispose.ret.0)
@SP // 14353
M=M-1 // 14354

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14355
AM=M+1 // 14356
A=A-1 // 14357
M=0 // 14358
@RETURN // 14359
0;JMP // 14360

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14361
A=M // 14362
D=M // 14363
@3 // 14364
M=D // 14365

////PushInstruction("this 1")
@THIS // 14366
A=M+1 // 14367
D=M // 14368
@SP // 14369
AM=M+1 // 14370
A=A-1 // 14371
M=D // 14372
@RETURN // 14373
0;JMP // 14374

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14375
A=M // 14376
D=M // 14377
@3 // 14378
M=D // 14379

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
@THIS // 14380
A=M // 14381
D=M // 14382
@SP // 14383
AM=M+1 // 14384
A=A-1 // 14385
M=D // 14386
@ARG // 14387
A=M+1 // 14388
D=M // 14389
@SP // 14390
AM=M-1 // 14391
A=D+M // 14392
D=M // 14393
@SP // 14394
AM=M+1 // 14395
A=A-1 // 14396
M=D // 14397
@RETURN // 14398
0;JMP // 14399

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14400
A=M // 14401
D=M // 14402
@3 // 14403
M=D // 14404

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14405
A=M // 14406
D=M // 14407
@SP // 14408
AM=M+1 // 14409
A=A-1 // 14410
M=D // 14411
@ARG // 14412
A=M+1 // 14413
D=M // 14414
@SP // 14415
AM=M-1 // 14416
D=D+M // 14417
@SP // 14418
AM=M+1 // 14419
A=A-1 // 14420
M=D // 14421
@ARG // 14422
A=M+1 // 14423
A=A+1 // 14424
D=M // 14425
@SP // 14426
AM=M-1 // 14427
A=M // 14428
M=D // 14429

////PushInstruction("constant 0")
@SP // 14430
AM=M+1 // 14431
A=A-1 // 14432
M=0 // 14433
@RETURN // 14434
0;JMP // 14435

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14436
AM=M+1 // 14437
A=A-1 // 14438
M=0 // 14439

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14440
A=M // 14441
D=M // 14442
@3 // 14443
M=D // 14444

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 1"),
//        right:
//            PushInstruction("this 2"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.appendChar.IfElseEND1}}
@String.appendChar.EQ.2 // 14445
D=A // 14446
@SP // 14447
AM=M+1 // 14448
A=A-1 // 14449
M=D // 14450
@THIS // 14451
A=M+1 // 14452
A=A+1 // 14453
D=M // 14454
A=A-1 // 14455
D=M-D // 14456
@DO_EQ // 14457
0;JMP // 14458
(String.appendChar.EQ.2)
D=!D // 14459
@String.appendChar.IfElseEND1 // 14460
D;JNE // 14461

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

@THIS // 14462
A=M+1 // 14463
A=A+1 // 14464
D=M // 14465
D=D+M // 14466
@SP // 14467
AM=M+1 // 14468
A=A-1 // 14469
M=D // 14470
// call Array.new
@6 // 14471
D=A // 14472
@14 // 14473
M=D // 14474
@Array.new // 14475
D=A // 14476
@13 // 14477
M=D // 14478
@String.appendChar.ret.0 // 14479
D=A // 14480
@CALL // 14481
0;JMP // 14482
(String.appendChar.ret.0)
@SP // 14483
AM=M-1 // 14484
D=M // 14485
@LCL // 14486
A=M // 14487
M=D // 14488

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14489
A=M // 14490
D=M // 14491
@SP // 14492
AM=M+1 // 14493
A=A-1 // 14494
M=D // 14495
@LCL // 14496
A=M // 14497
D=M // 14498
@SP // 14499
AM=M+1 // 14500
A=A-1 // 14501
M=D // 14502
@THIS // 14503
A=M+1 // 14504
D=M // 14505
@SP // 14506
AM=M+1 // 14507
A=A-1 // 14508
M=D // 14509
// call Memory.copy
@8 // 14510
D=A // 14511
@14 // 14512
M=D // 14513
@Memory.copy // 14514
D=A // 14515
@13 // 14516
M=D // 14517
@String.appendChar.ret.1 // 14518
D=A // 14519
@CALL // 14520
0;JMP // 14521
(String.appendChar.ret.1)
@SP // 14522
M=M-1 // 14523

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14524
A=M // 14525
D=M // 14526
@SP // 14527
AM=M+1 // 14528
A=A-1 // 14529
M=D // 14530
// call Array.dispose
@6 // 14531
D=A // 14532
@14 // 14533
M=D // 14534
@Array.dispose // 14535
D=A // 14536
@13 // 14537
M=D // 14538
@String.appendChar.ret.2 // 14539
D=A // 14540
@CALL // 14541
0;JMP // 14542
(String.appendChar.ret.2)
@SP // 14543
M=M-1 // 14544

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

@THIS // 14545
A=M+1 // 14546
A=A+1 // 14547
D=M // 14548
@THIS // 14549
A=M+1 // 14550
A=A+1 // 14551
M=D+M // 14552

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14553
A=M // 14554
D=M // 14555
@THIS // 14556
A=M // 14557
M=D // 14558

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
@THIS // 14559
A=M+1 // 14560
D=M // 14561
A=A-1 // 14562
D=D+M // 14563
@SP // 14564
AM=M+1 // 14565
A=A-1 // 14566
M=D // 14567
@ARG // 14568
A=M+1 // 14569
D=M // 14570
@SP // 14571
AM=M-1 // 14572
A=M // 14573
M=D // 14574

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

@THIS // 14575
A=M+1 // 14576
M=M+1 // 14577

////PushInstruction("pointer 0")
@3 // 14578
D=M // 14579
@SP // 14580
AM=M+1 // 14581
A=A-1 // 14582
M=D // 14583
@RETURN // 14584
0;JMP // 14585

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14586
A=M // 14587
D=M // 14588
@3 // 14589
M=D // 14590

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

@THIS // 14591
A=M+1 // 14592
M=M-1 // 14593

////PushInstruction("constant 0")
@SP // 14594
AM=M+1 // 14595
A=A-1 // 14596
M=0 // 14597
@RETURN // 14598
0;JMP // 14599

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14600
M=M+1 // 14601
AM=M+1 // 14602
A=A-1 // 14603
M=0 // 14604
A=A-1 // 14605
M=0 // 14606

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14607
A=M // 14608
D=M // 14609
@3 // 14610
M=D // 14611

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14612
A=M+1 // 14613
M=1 // 14614

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14615
A=M // 14616
M=0 // 14617

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
@String.intValue.LT.3 // 14618
D=A // 14619
@SP // 14620
AM=M+1 // 14621
A=A-1 // 14622
M=D // 14623
@LCL // 14624
A=M+1 // 14625
D=M // 14626
@SP // 14627
AM=M+1 // 14628
A=A-1 // 14629
M=D // 14630
@THIS // 14631
A=M+1 // 14632
D=M // 14633
@SP // 14634
AM=M-1 // 14635
D=M-D // 14636
@DO_LT // 14637
0;JMP // 14638
(String.intValue.LT.3)
D=!D // 14639
@WHILE_END_String.intValue1 // 14640
D;JNE // 14641

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

@LCL // 14642
A=M // 14643
D=M // 14644
@SP // 14645
AM=M+1 // 14646
A=A-1 // 14647
M=D // 14648
@10 // 14649
D=A // 14650
@SP // 14651
AM=M+1 // 14652
A=A-1 // 14653
M=D // 14654
// call Math.multiply
@7 // 14655
D=A // 14656
@14 // 14657
M=D // 14658
@Math.multiply // 14659
D=A // 14660
@13 // 14661
M=D // 14662
@String.intValue.ret.0 // 14663
D=A // 14664
@CALL // 14665
0;JMP // 14666
(String.intValue.ret.0)
@THIS // 14667
A=M // 14668
D=M // 14669
@SP // 14670
AM=M+1 // 14671
A=A-1 // 14672
M=D // 14673
@LCL // 14674
A=M+1 // 14675
D=M // 14676
@SP // 14677
AM=M-1 // 14678
A=D+M // 14679
D=M // 14680
@48 // 14681
D=D-A // 14682
@SP // 14683
AM=M-1 // 14684
D=D+M // 14685
@LCL // 14686
A=M // 14687
M=D // 14688

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

@LCL // 14689
A=M+1 // 14690
M=M+1 // 14691

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 14692
0;JMP // 14693

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 14694
A=M // 14695
D=M // 14696
@SP // 14697
AM=M+1 // 14698
A=A-1 // 14699
M=D // 14700
@RETURN // 14701
0;JMP // 14702

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 14703
D=A // 14704
@SP // 14705
AM=D+M // 14706
A=A-1 // 14707
M=0 // 14708
A=A-1 // 14709
M=0 // 14710
A=A-1 // 14711
M=0 // 14712
A=A-1 // 14713
M=0 // 14714
A=A-1 // 14715
M=0 // 14716
A=A-1 // 14717
M=0 // 14718

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14719
A=M // 14720
D=M // 14721
@3 // 14722
M=D // 14723

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14724
A=M+1 // 14725
M=0 // 14726

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14727
D=M // 14728
@4 // 14729
A=D+A // 14730
M=0 // 14731

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.setInt.IfElseEND1}}
@String.setInt.EQ.4 // 14732
D=A // 14733
@SP // 14734
AM=M+1 // 14735
A=A-1 // 14736
M=D // 14737
@ARG // 14738
A=M+1 // 14739
D=M // 14740
@DO_EQ // 14741
0;JMP // 14742
(String.setInt.EQ.4)
D=!D // 14743
@String.setInt.IfElseEND1 // 14744
D;JNE // 14745

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14746
D=M // 14747
@SP // 14748
AM=M+1 // 14749
A=A-1 // 14750
M=D // 14751
@48 // 14752
D=A // 14753
@SP // 14754
AM=M+1 // 14755
A=A-1 // 14756
M=D // 14757
// call String.appendChar
@7 // 14758
D=A // 14759
@14 // 14760
M=D // 14761
@String.appendChar // 14762
D=A // 14763
@13 // 14764
M=D // 14765
@String.setInt.ret.0 // 14766
D=A // 14767
@CALL // 14768
0;JMP // 14769
(String.setInt.ret.0)
@SP // 14770
M=M-1 // 14771

////PushInstruction("constant 0")
@SP // 14772
AM=M+1 // 14773
A=A-1 // 14774
M=0 // 14775
@RETURN // 14776
0;JMP // 14777

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
@String.setInt.LT.5 // 14778
D=A // 14779
@SP // 14780
AM=M+1 // 14781
A=A-1 // 14782
M=D // 14783
@ARG // 14784
A=M+1 // 14785
D=M // 14786
@DO_LT // 14787
0;JMP // 14788
(String.setInt.LT.5)
D=!D // 14789
@String.setInt.IfElseEND2 // 14790
D;JNE // 14791

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14792
D=M // 14793
@4 // 14794
A=D+A // 14795
M=1 // 14796

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
@String.setInt.LT.6 // 14797
D=A // 14798
@SP // 14799
AM=M+1 // 14800
A=A-1 // 14801
M=D // 14802
@ARG // 14803
A=M+1 // 14804
D=M // 14805
@DO_LT // 14806
0;JMP // 14807
(String.setInt.LT.6)
@SP // 14808
AM=M+1 // 14809
A=A-1 // 14810
M=D // 14811
@String.setInt.EQ.7 // 14812
D=A // 14813
@SP // 14814
AM=M+1 // 14815
A=A-1 // 14816
M=D // 14817
@ARG // 14818
A=M+1 // 14819
D=M // 14820
@32767 // 14821
D=D&A // 14822
@32767 // 14823
D=D-A // 14824
@DO_EQ // 14825
0;JMP // 14826
(String.setInt.EQ.7)
@SP // 14827
AM=M-1 // 14828
D=D&M // 14829
D=!D // 14830
@String.setInt.IfElseEND3 // 14831
D;JNE // 14832

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14833
D=M // 14834
@SP // 14835
AM=M+1 // 14836
A=A-1 // 14837
M=D // 14838
@45 // 14839
D=A // 14840
@SP // 14841
AM=M+1 // 14842
A=A-1 // 14843
M=D // 14844
// call String.appendChar
@7 // 14845
D=A // 14846
@14 // 14847
M=D // 14848
@String.appendChar // 14849
D=A // 14850
@13 // 14851
M=D // 14852
@String.setInt.ret.1 // 14853
D=A // 14854
@CALL // 14855
0;JMP // 14856
(String.setInt.ret.1)
@SP // 14857
M=M-1 // 14858

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14859
D=M // 14860
@SP // 14861
AM=M+1 // 14862
A=A-1 // 14863
M=D // 14864
@51 // 14865
D=A // 14866
@SP // 14867
AM=M+1 // 14868
A=A-1 // 14869
M=D // 14870
// call String.appendChar
@7 // 14871
D=A // 14872
@14 // 14873
M=D // 14874
@String.appendChar // 14875
D=A // 14876
@13 // 14877
M=D // 14878
@String.setInt.ret.2 // 14879
D=A // 14880
@CALL // 14881
0;JMP // 14882
(String.setInt.ret.2)
@SP // 14883
M=M-1 // 14884

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14885
D=M // 14886
@SP // 14887
AM=M+1 // 14888
A=A-1 // 14889
M=D // 14890
@50 // 14891
D=A // 14892
@SP // 14893
AM=M+1 // 14894
A=A-1 // 14895
M=D // 14896
// call String.appendChar
@7 // 14897
D=A // 14898
@14 // 14899
M=D // 14900
@String.appendChar // 14901
D=A // 14902
@13 // 14903
M=D // 14904
@String.setInt.ret.3 // 14905
D=A // 14906
@CALL // 14907
0;JMP // 14908
(String.setInt.ret.3)
@SP // 14909
M=M-1 // 14910

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14911
D=M // 14912
@SP // 14913
AM=M+1 // 14914
A=A-1 // 14915
M=D // 14916
@55 // 14917
D=A // 14918
@SP // 14919
AM=M+1 // 14920
A=A-1 // 14921
M=D // 14922
// call String.appendChar
@7 // 14923
D=A // 14924
@14 // 14925
M=D // 14926
@String.appendChar // 14927
D=A // 14928
@13 // 14929
M=D // 14930
@String.setInt.ret.4 // 14931
D=A // 14932
@CALL // 14933
0;JMP // 14934
(String.setInt.ret.4)
@SP // 14935
M=M-1 // 14936

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14937
D=M // 14938
@SP // 14939
AM=M+1 // 14940
A=A-1 // 14941
M=D // 14942
@54 // 14943
D=A // 14944
@SP // 14945
AM=M+1 // 14946
A=A-1 // 14947
M=D // 14948
// call String.appendChar
@7 // 14949
D=A // 14950
@14 // 14951
M=D // 14952
@String.appendChar // 14953
D=A // 14954
@13 // 14955
M=D // 14956
@String.setInt.ret.5 // 14957
D=A // 14958
@CALL // 14959
0;JMP // 14960
(String.setInt.ret.5)
@SP // 14961
M=M-1 // 14962

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14963
D=M // 14964
@SP // 14965
AM=M+1 // 14966
A=A-1 // 14967
M=D // 14968
@56 // 14969
D=A // 14970
@SP // 14971
AM=M+1 // 14972
A=A-1 // 14973
M=D // 14974
// call String.appendChar
@7 // 14975
D=A // 14976
@14 // 14977
M=D // 14978
@String.appendChar // 14979
D=A // 14980
@13 // 14981
M=D // 14982
@String.setInt.ret.6 // 14983
D=A // 14984
@CALL // 14985
0;JMP // 14986
(String.setInt.ret.6)
@SP // 14987
M=M-1 // 14988

////PushInstruction("constant 0")
@SP // 14989
AM=M+1 // 14990
A=A-1 // 14991
M=0 // 14992
@RETURN // 14993
0;JMP // 14994

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 14995
A=M+1 // 14996
D=-M // 14997
@ARG // 14998
A=M+1 // 14999
M=D // 15000

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15001
A=M+1 // 15002
D=M // 15003
@LCL // 15004
A=M+1 // 15005
A=A+1 // 15006
M=D // 15007

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15008
A=M+1 // 15009
A=A+1 // 15010
A=A+1 // 15011
M=0 // 15012

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
@String.setInt.GT.8 // 15013
D=A // 15014
@SP // 15015
AM=M+1 // 15016
A=A-1 // 15017
M=D // 15018
@LCL // 15019
A=M+1 // 15020
A=A+1 // 15021
D=M // 15022
@DO_GT // 15023
0;JMP // 15024
(String.setInt.GT.8)
D=!D // 15025
@WHILE_END_String.setInt1 // 15026
D;JNE // 15027

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15028
A=M+1 // 15029
A=A+1 // 15030
D=M // 15031
@SP // 15032
AM=M+1 // 15033
A=A-1 // 15034
M=D // 15035
@10 // 15036
D=A // 15037
@SP // 15038
AM=M+1 // 15039
A=A-1 // 15040
M=D // 15041
// call Math.divide
@7 // 15042
D=A // 15043
@14 // 15044
M=D // 15045
@Math.divide // 15046
D=A // 15047
@13 // 15048
M=D // 15049
@String.setInt.ret.7 // 15050
D=A // 15051
@CALL // 15052
0;JMP // 15053
(String.setInt.ret.7)
@SP // 15054
AM=M-1 // 15055
D=M // 15056
@LCL // 15057
A=M+1 // 15058
A=A+1 // 15059
M=D // 15060

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

@LCL // 15061
A=M+1 // 15062
A=A+1 // 15063
A=A+1 // 15064
M=M+1 // 15065

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15066
0;JMP // 15067

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15068
A=M+1 // 15069
A=A+1 // 15070
A=A+1 // 15071
D=M // 15072
@SP // 15073
AM=M+1 // 15074
A=A-1 // 15075
M=D // 15076
// call Array.new
@6 // 15077
D=A // 15078
@14 // 15079
M=D // 15080
@Array.new // 15081
D=A // 15082
@13 // 15083
M=D // 15084
@String.setInt.ret.8 // 15085
D=A // 15086
@CALL // 15087
0;JMP // 15088
(String.setInt.ret.8)
@LCL // 15089
D=M // 15090
@5 // 15091
A=D+A // 15092
D=A // 15093
@R13 // 15094
M=D // 15095
@SP // 15096
AM=M-1 // 15097
D=M // 15098
@R13 // 15099
A=M // 15100
M=D // 15101

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15102
A=M+1 // 15103
M=0 // 15104

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
@String.setInt.GT.9 // 15105
D=A // 15106
@SP // 15107
AM=M+1 // 15108
A=A-1 // 15109
M=D // 15110
@ARG // 15111
A=M+1 // 15112
D=M // 15113
@DO_GT // 15114
0;JMP // 15115
(String.setInt.GT.9)
D=!D // 15116
@WHILE_END_String.setInt2 // 15117
D;JNE // 15118

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

@ARG // 15119
A=M+1 // 15120
D=M // 15121
@SP // 15122
AM=M+1 // 15123
A=A-1 // 15124
M=D // 15125
@ARG // 15126
A=M+1 // 15127
D=M // 15128
@SP // 15129
AM=M+1 // 15130
A=A-1 // 15131
M=D // 15132
@10 // 15133
D=A // 15134
@SP // 15135
AM=M+1 // 15136
A=A-1 // 15137
M=D // 15138
// call Math.divide
@7 // 15139
D=A // 15140
@14 // 15141
M=D // 15142
@Math.divide // 15143
D=A // 15144
@13 // 15145
M=D // 15146
@String.setInt.ret.9 // 15147
D=A // 15148
@CALL // 15149
0;JMP // 15150
(String.setInt.ret.9)
@10 // 15151
D=A // 15152
@SP // 15153
AM=M+1 // 15154
A=A-1 // 15155
M=D // 15156
// call Math.multiply
@7 // 15157
D=A // 15158
@14 // 15159
M=D // 15160
@Math.multiply // 15161
D=A // 15162
@13 // 15163
M=D // 15164
@String.setInt.ret.10 // 15165
D=A // 15166
@CALL // 15167
0;JMP // 15168
(String.setInt.ret.10)
@SP // 15169
AM=M-1 // 15170
D=M // 15171
@SP // 15172
AM=M-1 // 15173
D=M-D // 15174
@LCL // 15175
A=M // 15176
M=D // 15177

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
@LCL // 15178
D=M // 15179
@5 // 15180
A=D+A // 15181
D=M // 15182
@SP // 15183
AM=M+1 // 15184
A=A-1 // 15185
M=D // 15186
@LCL // 15187
A=M+1 // 15188
D=M // 15189
@SP // 15190
AM=M-1 // 15191
D=D+M // 15192
@SP // 15193
AM=M+1 // 15194
A=A-1 // 15195
M=D // 15196
@LCL // 15197
A=M // 15198
D=M // 15199
@48 // 15200
D=D+A // 15201
@SP // 15202
AM=M-1 // 15203
A=M // 15204
M=D // 15205

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15206
A=M+1 // 15207
D=M // 15208
@SP // 15209
AM=M+1 // 15210
A=A-1 // 15211
M=D // 15212
@10 // 15213
D=A // 15214
@SP // 15215
AM=M+1 // 15216
A=A-1 // 15217
M=D // 15218
// call Math.divide
@7 // 15219
D=A // 15220
@14 // 15221
M=D // 15222
@Math.divide // 15223
D=A // 15224
@13 // 15225
M=D // 15226
@String.setInt.ret.11 // 15227
D=A // 15228
@CALL // 15229
0;JMP // 15230
(String.setInt.ret.11)
@SP // 15231
AM=M-1 // 15232
D=M // 15233
@ARG // 15234
A=M+1 // 15235
M=D // 15236

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

@LCL // 15237
A=M+1 // 15238
M=M+1 // 15239

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15240
0;JMP // 15241

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
@String.setInt.EQ.10 // 15242
D=A // 15243
@SP // 15244
AM=M+1 // 15245
A=A-1 // 15246
M=D // 15247
@LCL // 15248
D=M // 15249
@4 // 15250
A=D+A // 15251
D=M // 15252
D=D-1 // 15253
@DO_EQ // 15254
0;JMP // 15255
(String.setInt.EQ.10)
D=!D // 15256
@String.setInt.IfElseEND4 // 15257
D;JNE // 15258

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15259
D=M // 15260
@SP // 15261
AM=M+1 // 15262
A=A-1 // 15263
M=D // 15264
@45 // 15265
D=A // 15266
@SP // 15267
AM=M+1 // 15268
A=A-1 // 15269
M=D // 15270
// call String.appendChar
@7 // 15271
D=A // 15272
@14 // 15273
M=D // 15274
@String.appendChar // 15275
D=A // 15276
@13 // 15277
M=D // 15278
@String.setInt.ret.12 // 15279
D=A // 15280
@CALL // 15281
0;JMP // 15282
(String.setInt.ret.12)
@SP // 15283
M=M-1 // 15284

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
@String.setInt.GT.11 // 15285
D=A // 15286
@SP // 15287
AM=M+1 // 15288
A=A-1 // 15289
M=D // 15290
@LCL // 15291
A=M+1 // 15292
D=M // 15293
@DO_GT // 15294
0;JMP // 15295
(String.setInt.GT.11)
D=!D // 15296
@WHILE_END_String.setInt3 // 15297
D;JNE // 15298

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

@LCL // 15299
A=M+1 // 15300
M=M-1 // 15301

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

@3 // 15302
D=M // 15303
@SP // 15304
AM=M+1 // 15305
A=A-1 // 15306
M=D // 15307
@LCL // 15308
D=M // 15309
@5 // 15310
A=D+A // 15311
D=M // 15312
@SP // 15313
AM=M+1 // 15314
A=A-1 // 15315
M=D // 15316
@LCL // 15317
A=M+1 // 15318
D=M // 15319
@SP // 15320
AM=M-1 // 15321
A=D+M // 15322
D=M // 15323
@SP // 15324
AM=M+1 // 15325
A=A-1 // 15326
M=D // 15327
// call String.appendChar
@7 // 15328
D=A // 15329
@14 // 15330
M=D // 15331
@String.appendChar // 15332
D=A // 15333
@13 // 15334
M=D // 15335
@String.setInt.ret.13 // 15336
D=A // 15337
@CALL // 15338
0;JMP // 15339
(String.setInt.ret.13)
@SP // 15340
M=M-1 // 15341

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 15342
0;JMP // 15343

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15344
D=M // 15345
@5 // 15346
A=D+A // 15347
D=M // 15348
@SP // 15349
AM=M+1 // 15350
A=A-1 // 15351
M=D // 15352
// call Array.dispose
@6 // 15353
D=A // 15354
@14 // 15355
M=D // 15356
@Array.dispose // 15357
D=A // 15358
@13 // 15359
M=D // 15360
@String.setInt.ret.14 // 15361
D=A // 15362
@CALL // 15363
0;JMP // 15364
(String.setInt.ret.14)
@SP // 15365
M=M-1 // 15366

////PushInstruction("constant 0")
@SP // 15367
AM=M+1 // 15368
A=A-1 // 15369
M=0 // 15370
@RETURN // 15371
0;JMP // 15372

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15373
D=A // 15374
@SP // 15375
AM=M+1 // 15376
A=A-1 // 15377
M=D // 15378
@RETURN // 15379
0;JMP // 15380

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15381
D=A // 15382
@SP // 15383
AM=M+1 // 15384
A=A-1 // 15385
M=D // 15386
@RETURN // 15387
0;JMP // 15388

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15389
D=A // 15390
@SP // 15391
AM=M+1 // 15392
A=A-1 // 15393
M=D // 15394
@RETURN // 15395
0;JMP // 15396

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15397
D=A // 15398
@14 // 15399
M=D // 15400
@Memory.init // 15401
D=A // 15402
@13 // 15403
M=D // 15404
@Sys.init.ret.0 // 15405
D=A // 15406
@CALL // 15407
0;JMP // 15408
(Sys.init.ret.0)
@SP // 15409
M=M-1 // 15410

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15411
D=A // 15412
@14 // 15413
M=D // 15414
@Math.init // 15415
D=A // 15416
@13 // 15417
M=D // 15418
@Sys.init.ret.1 // 15419
D=A // 15420
@CALL // 15421
0;JMP // 15422
(Sys.init.ret.1)
@SP // 15423
M=M-1 // 15424

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15425
D=A // 15426
@14 // 15427
M=D // 15428
@Screen.init // 15429
D=A // 15430
@13 // 15431
M=D // 15432
@Sys.init.ret.2 // 15433
D=A // 15434
@CALL // 15435
0;JMP // 15436
(Sys.init.ret.2)
@SP // 15437
M=M-1 // 15438

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15439
D=A // 15440
@14 // 15441
M=D // 15442
@Output.init // 15443
D=A // 15444
@13 // 15445
M=D // 15446
@Sys.init.ret.3 // 15447
D=A // 15448
@CALL // 15449
0;JMP // 15450
(Sys.init.ret.3)
@SP // 15451
M=M-1 // 15452

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15453
D=A // 15454
@14 // 15455
M=D // 15456
@Keyboard.init // 15457
D=A // 15458
@13 // 15459
M=D // 15460
@Sys.init.ret.4 // 15461
D=A // 15462
@CALL // 15463
0;JMP // 15464
(Sys.init.ret.4)
@SP // 15465
M=M-1 // 15466

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15467
D=A // 15468
@14 // 15469
M=D // 15470
@Main.main // 15471
D=A // 15472
@13 // 15473
M=D // 15474
@Sys.init.ret.5 // 15475
D=A // 15476
@CALL // 15477
0;JMP // 15478
(Sys.init.ret.5)
@SP // 15479
M=M-1 // 15480

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15481
D=A // 15482
@14 // 15483
M=D // 15484
@Sys.halt // 15485
D=A // 15486
@13 // 15487
M=D // 15488
@Sys.init.ret.6 // 15489
D=A // 15490
@CALL // 15491
0;JMP // 15492
(Sys.init.ret.6)
@SP // 15493
M=M-1 // 15494

////PushInstruction("constant 0")
@SP // 15495
AM=M+1 // 15496
A=A-1 // 15497
M=0 // 15498
@RETURN // 15499
0;JMP // 15500

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='WHILE_END_Sys.halt1}}
D=0 // 15501
@WHILE_END_Sys.halt1 // 15502
D;JNE // 15503

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15504
0;JMP // 15505

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15506
AM=M+1 // 15507
A=A-1 // 15508
M=0 // 15509
@RETURN // 15510
0;JMP // 15511

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15512
AM=M+1 // 15513
A=A-1 // 15514
M=0 // 15515

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
@Sys.wait.GT.0 // 15516
D=A // 15517
@SP // 15518
AM=M+1 // 15519
A=A-1 // 15520
M=D // 15521
@ARG // 15522
A=M // 15523
D=M // 15524
@DO_GT // 15525
0;JMP // 15526
(Sys.wait.GT.0)
D=!D // 15527
@WHILE_END_Sys.wait1 // 15528
D;JNE // 15529

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

@ARG // 15530
A=M // 15531
M=M-1 // 15532

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15533
D=A // 15534
@LCL // 15535
A=M // 15536
M=D // 15537

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
@Sys.wait.GT.1 // 15538
D=A // 15539
@SP // 15540
AM=M+1 // 15541
A=A-1 // 15542
M=D // 15543
@LCL // 15544
A=M // 15545
D=M // 15546
@DO_GT // 15547
0;JMP // 15548
(Sys.wait.GT.1)
D=!D // 15549
@WHILE_END_Sys.wait2 // 15550
D;JNE // 15551

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

@LCL // 15552
A=M // 15553
M=M-1 // 15554

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15555
0;JMP // 15556

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15557
0;JMP // 15558

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15559
AM=M+1 // 15560
A=A-1 // 15561
M=0 // 15562
@RETURN // 15563
0;JMP // 15564

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15565
A=M // 15566
D=M // 15567
@SP // 15568
AM=M+1 // 15569
A=A-1 // 15570
M=D // 15571
// call Output.printInt
@6 // 15572
D=A // 15573
@14 // 15574
M=D // 15575
@Output.printInt // 15576
D=A // 15577
@13 // 15578
M=D // 15579
@Sys.error.ret.0 // 15580
D=A // 15581
@CALL // 15582
0;JMP // 15583
(Sys.error.ret.0)
@SP // 15584
M=M-1 // 15585

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15586
D=A // 15587
@14 // 15588
M=D // 15589
@Output.println // 15590
D=A // 15591
@13 // 15592
M=D // 15593
@Sys.error.ret.1 // 15594
D=A // 15595
@CALL // 15596
0;JMP // 15597
(Sys.error.ret.1)
@SP // 15598
M=M-1 // 15599

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15600
D=A // 15601
@14 // 15602
M=D // 15603
@Sys.halt // 15604
D=A // 15605
@13 // 15606
M=D // 15607
@Sys.error.ret.2 // 15608
D=A // 15609
@CALL // 15610
0;JMP // 15611
(Sys.error.ret.2)
@SP // 15612
M=M-1 // 15613

////PushInstruction("constant 0")
@SP // 15614
AM=M+1 // 15615
A=A-1 // 15616
M=0 // 15617
@RETURN // 15618
0;JMP // 15619

