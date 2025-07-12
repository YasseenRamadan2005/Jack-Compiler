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
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 501
D=A // 502
@SP // 503
AM=M+1 // 504
A=A-1 // 505
M=D // 506
// call String.new
@6 // 507
D=A // 508
@14 // 509
M=D // 510
@String.new // 511
D=A // 512
@13 // 513
M=D // 514
@Main.main.ret.0 // 515
D=A // 516
@CALL // 517
0;JMP // 518
(Main.main.ret.0)
@72 // 519
D=A // 520
@SP // 521
AM=M+1 // 522
A=A-1 // 523
M=D // 524
// call String.appendChar
@7 // 525
D=A // 526
@14 // 527
M=D // 528
@String.appendChar // 529
D=A // 530
@13 // 531
M=D // 532
@Main.main.ret.1 // 533
D=A // 534
@CALL // 535
0;JMP // 536
(Main.main.ret.1)
@101 // 537
D=A // 538
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
@Main.main.ret.2 // 551
D=A // 552
@CALL // 553
0;JMP // 554
(Main.main.ret.2)
@108 // 555
D=A // 556
@SP // 557
AM=M+1 // 558
A=A-1 // 559
M=D // 560
// call String.appendChar
@7 // 561
D=A // 562
@14 // 563
M=D // 564
@String.appendChar // 565
D=A // 566
@13 // 567
M=D // 568
@Main.main.ret.3 // 569
D=A // 570
@CALL // 571
0;JMP // 572
(Main.main.ret.3)
@108 // 573
D=A // 574
@SP // 575
AM=M+1 // 576
A=A-1 // 577
M=D // 578
// call String.appendChar
@7 // 579
D=A // 580
@14 // 581
M=D // 582
@String.appendChar // 583
D=A // 584
@13 // 585
M=D // 586
@Main.main.ret.4 // 587
D=A // 588
@CALL // 589
0;JMP // 590
(Main.main.ret.4)
@111 // 591
D=A // 592
@SP // 593
AM=M+1 // 594
A=A-1 // 595
M=D // 596
// call String.appendChar
@7 // 597
D=A // 598
@14 // 599
M=D // 600
@String.appendChar // 601
D=A // 602
@13 // 603
M=D // 604
@Main.main.ret.5 // 605
D=A // 606
@CALL // 607
0;JMP // 608
(Main.main.ret.5)
@44 // 609
D=A // 610
@SP // 611
AM=M+1 // 612
A=A-1 // 613
M=D // 614
// call String.appendChar
@7 // 615
D=A // 616
@14 // 617
M=D // 618
@String.appendChar // 619
D=A // 620
@13 // 621
M=D // 622
@Main.main.ret.6 // 623
D=A // 624
@CALL // 625
0;JMP // 626
(Main.main.ret.6)
@32 // 627
D=A // 628
@SP // 629
AM=M+1 // 630
A=A-1 // 631
M=D // 632
// call String.appendChar
@7 // 633
D=A // 634
@14 // 635
M=D // 636
@String.appendChar // 637
D=A // 638
@13 // 639
M=D // 640
@Main.main.ret.7 // 641
D=A // 642
@CALL // 643
0;JMP // 644
(Main.main.ret.7)
@119 // 645
D=A // 646
@SP // 647
AM=M+1 // 648
A=A-1 // 649
M=D // 650
// call String.appendChar
@7 // 651
D=A // 652
@14 // 653
M=D // 654
@String.appendChar // 655
D=A // 656
@13 // 657
M=D // 658
@Main.main.ret.8 // 659
D=A // 660
@CALL // 661
0;JMP // 662
(Main.main.ret.8)
@111 // 663
D=A // 664
@SP // 665
AM=M+1 // 666
A=A-1 // 667
M=D // 668
// call String.appendChar
@7 // 669
D=A // 670
@14 // 671
M=D // 672
@String.appendChar // 673
D=A // 674
@13 // 675
M=D // 676
@Main.main.ret.9 // 677
D=A // 678
@CALL // 679
0;JMP // 680
(Main.main.ret.9)
@114 // 681
D=A // 682
@SP // 683
AM=M+1 // 684
A=A-1 // 685
M=D // 686
// call String.appendChar
@7 // 687
D=A // 688
@14 // 689
M=D // 690
@String.appendChar // 691
D=A // 692
@13 // 693
M=D // 694
@Main.main.ret.10 // 695
D=A // 696
@CALL // 697
0;JMP // 698
(Main.main.ret.10)
@108 // 699
D=A // 700
@SP // 701
AM=M+1 // 702
A=A-1 // 703
M=D // 704
// call String.appendChar
@7 // 705
D=A // 706
@14 // 707
M=D // 708
@String.appendChar // 709
D=A // 710
@13 // 711
M=D // 712
@Main.main.ret.11 // 713
D=A // 714
@CALL // 715
0;JMP // 716
(Main.main.ret.11)
@100 // 717
D=A // 718
@SP // 719
AM=M+1 // 720
A=A-1 // 721
M=D // 722
// call String.appendChar
@7 // 723
D=A // 724
@14 // 725
M=D // 726
@String.appendChar // 727
D=A // 728
@13 // 729
M=D // 730
@Main.main.ret.12 // 731
D=A // 732
@CALL // 733
0;JMP // 734
(Main.main.ret.12)
@33 // 735
D=A // 736
@SP // 737
AM=M+1 // 738
A=A-1 // 739
M=D // 740
// call String.appendChar
@7 // 741
D=A // 742
@14 // 743
M=D // 744
@String.appendChar // 745
D=A // 746
@13 // 747
M=D // 748
@Main.main.ret.13 // 749
D=A // 750
@CALL // 751
0;JMP // 752
(Main.main.ret.13)
@SP // 753
AM=M-1 // 754
D=M // 755
@LCL // 756
A=M // 757
M=D // 758

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 759
A=M // 760
D=M // 761
@SP // 762
AM=M+1 // 763
A=A-1 // 764
M=D // 765
// call Output.printString
@6 // 766
D=A // 767
@14 // 768
M=D // 769
@Output.printString // 770
D=A // 771
@13 // 772
M=D // 773
@Main.main.ret.14 // 774
D=A // 775
@CALL // 776
0;JMP // 777
(Main.main.ret.14)
@SP // 778
M=M-1 // 779

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 780
D=A // 781
@14 // 782
M=D // 783
@Output.println // 784
D=A // 785
@13 // 786
M=D // 787
@Main.main.ret.15 // 788
D=A // 789
@CALL // 790
0;JMP // 791
(Main.main.ret.15)
@SP // 792
M=M-1 // 793

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 794
A=M // 795
D=M // 796
@SP // 797
AM=M+1 // 798
A=A-1 // 799
M=D // 800
// call String.dispose
@6 // 801
D=A // 802
@14 // 803
M=D // 804
@String.dispose // 805
D=A // 806
@13 // 807
M=D // 808
@Main.main.ret.16 // 809
D=A // 810
@CALL // 811
0;JMP // 812
(Main.main.ret.16)
@SP // 813
M=M-1 // 814

////PushInstruction("constant 0")
@SP // 815
AM=M+1 // 816
A=A-1 // 817
M=0 // 818
@RETURN // 819
0;JMP // 820

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 821
M=M+1 // 822
AM=M+1 // 823
A=A-1 // 824
M=0 // 825
A=A-1 // 826
M=0 // 827

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 828
A=M // 829
M=1 // 830

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 831
A=M+1 // 832
M=0 // 833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 834
D=A // 835
@SP // 836
AM=M+1 // 837
A=A-1 // 838
M=D // 839
// call Array.new
@6 // 840
D=A // 841
@14 // 842
M=D // 843
@Array.new // 844
D=A // 845
@13 // 846
M=D // 847
@Math.init.ret.0 // 848
D=A // 849
@CALL // 850
0;JMP // 851
(Math.init.ret.0)
@SP // 852
AM=M-1 // 853
D=M // 854
@Math.0 // 855
M=D // 856

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
@Math.init.LT.0 // 857
D=A // 858
@SP // 859
AM=M+1 // 860
A=A-1 // 861
M=D // 862
@LCL // 863
A=M+1 // 864
D=M // 865
@16 // 866
D=D-A // 867
@DO_LT // 868
0;JMP // 869
(Math.init.LT.0)
D=!D // 870
@Math.init_WHILE_END1 // 871
D;JNE // 872

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 873
D=M // 874
@SP // 875
AM=M+1 // 876
A=A-1 // 877
M=D // 878
@LCL // 879
A=M+1 // 880
D=M // 881
@SP // 882
AM=M-1 // 883
D=D+M // 884
@SP // 885
AM=M+1 // 886
A=A-1 // 887
M=D // 888
@LCL // 889
A=M // 890
D=M // 891
@SP // 892
AM=M-1 // 893
A=M // 894
M=D // 895

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

@LCL // 896
A=M // 897
D=M // 898
@LCL // 899
A=M // 900
M=D+M // 901

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

@LCL // 902
A=M+1 // 903
M=M+1 // 904

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 905
0;JMP // 906

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 907
AM=M+1 // 908
A=A-1 // 909
M=0 // 910
@RETURN // 911
0;JMP // 912

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
@ARG // 913
A=M // 914
D=M // 915
@SP // 916
AM=M+1 // 917
A=A-1 // 918
M=D // 919
@Math.0 // 920
D=M // 921
@SP // 922
AM=M+1 // 923
A=A-1 // 924
M=D // 925
@ARG // 926
A=M+1 // 927
D=M // 928
@SP // 929
AM=M-1 // 930
A=D+M // 931
D=M // 932
@SP // 933
AM=M-1 // 934
D=D&M // 935
@SP // 936
AM=M+1 // 937
A=A-1 // 938
M=D // 939
@RETURN // 940
0;JMP // 941

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 942
D=A // 943
@SP // 944
AM=D+M // 945
A=A-1 // 946
M=0 // 947
A=A-1 // 948
M=0 // 949
A=A-1 // 950
M=0 // 951

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
@Math.multiply.EQ.1 // 952
D=A // 953
@SP // 954
AM=M+1 // 955
A=A-1 // 956
M=D // 957
@ARG // 958
A=M // 959
D=M // 960
@DO_EQ // 961
0;JMP // 962
(Math.multiply.EQ.1)
@SP // 963
AM=M+1 // 964
A=A-1 // 965
M=D // 966
@Math.multiply.EQ.2 // 967
D=A // 968
@SP // 969
AM=M+1 // 970
A=A-1 // 971
M=D // 972
@ARG // 973
A=M+1 // 974
D=M // 975
@DO_EQ // 976
0;JMP // 977
(Math.multiply.EQ.2)
@SP // 978
AM=M-1 // 979
D=D|M // 980
@Math.multiply$IF_TRUE1 // 981
D;JNE // 982

////GotoInstruction{label='Math.multiply$IF_FALSE1}
// goto Math.multiply$IF_FALSE1
@Math.multiply$IF_FALSE1 // 983
0;JMP // 984

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 985
AM=M+1 // 986
A=A-1 // 987
M=0 // 988
@RETURN // 989
0;JMP // 990

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
@Math.multiply.EQ.3 // 991
D=A // 992
@SP // 993
AM=M+1 // 994
A=A-1 // 995
M=D // 996
@ARG // 997
A=M // 998
D=M // 999
D=D-1 // 1000
@DO_EQ // 1001
0;JMP // 1002
(Math.multiply.EQ.3)
@Math.multiply$IF_TRUE2 // 1003
D;JNE // 1004

////GotoInstruction{label='Math.multiply$IF_FALSE2}
// goto Math.multiply$IF_FALSE2
@Math.multiply$IF_FALSE2 // 1005
0;JMP // 1006

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 1007
A=M+1 // 1008
D=M // 1009
@SP // 1010
AM=M+1 // 1011
A=A-1 // 1012
M=D // 1013
@RETURN // 1014
0;JMP // 1015

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
@Math.multiply.EQ.4 // 1016
D=A // 1017
@SP // 1018
AM=M+1 // 1019
A=A-1 // 1020
M=D // 1021
@ARG // 1022
A=M+1 // 1023
D=M // 1024
D=D-1 // 1025
@DO_EQ // 1026
0;JMP // 1027
(Math.multiply.EQ.4)
@Math.multiply$IF_TRUE3 // 1028
D;JNE // 1029

////GotoInstruction{label='Math.multiply$IF_FALSE3}
// goto Math.multiply$IF_FALSE3
@Math.multiply$IF_FALSE3 // 1030
0;JMP // 1031

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 1032
A=M // 1033
D=M // 1034
@SP // 1035
AM=M+1 // 1036
A=A-1 // 1037
M=D // 1038
@RETURN // 1039
0;JMP // 1040

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
@Math.multiply.EQ.5 // 1041
D=A // 1042
@SP // 1043
AM=M+1 // 1044
A=A-1 // 1045
M=D // 1046
@ARG // 1047
A=M // 1048
D=M // 1049
@2 // 1050
D=D-A // 1051
@DO_EQ // 1052
0;JMP // 1053
(Math.multiply.EQ.5)
@Math.multiply$IF_TRUE4 // 1054
D;JNE // 1055

////GotoInstruction{label='Math.multiply$IF_FALSE4}
// goto Math.multiply$IF_FALSE4
@Math.multiply$IF_FALSE4 // 1056
0;JMP // 1057

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
@ARG // 1058
A=M+1 // 1059
D=M // 1060
D=D+M // 1061
@SP // 1062
AM=M+1 // 1063
A=A-1 // 1064
M=D // 1065
@RETURN // 1066
0;JMP // 1067

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
@Math.multiply.EQ.6 // 1068
D=A // 1069
@SP // 1070
AM=M+1 // 1071
A=A-1 // 1072
M=D // 1073
@ARG // 1074
A=M+1 // 1075
D=M // 1076
@2 // 1077
D=D-A // 1078
@DO_EQ // 1079
0;JMP // 1080
(Math.multiply.EQ.6)
@Math.multiply$IF_TRUE5 // 1081
D;JNE // 1082

////GotoInstruction{label='Math.multiply$IF_FALSE5}
// goto Math.multiply$IF_FALSE5
@Math.multiply$IF_FALSE5 // 1083
0;JMP // 1084

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
@ARG // 1085
A=M // 1086
D=M // 1087
D=D+M // 1088
@SP // 1089
AM=M+1 // 1090
A=A-1 // 1091
M=D // 1092
@RETURN // 1093
0;JMP // 1094

////LabelInstruction{label='Math.multiply$IF_FALSE5}
// label Math.multiply$IF_FALSE5
(Math.multiply$IF_FALSE5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1095
A=M+1 // 1096
A=A+1 // 1097
M=1 // 1098

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 1099
A=M+1 // 1100
M=0 // 1101

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1102
A=M // 1103
M=0 // 1104

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
@Math.multiply.LT.7 // 1105
D=A // 1106
@SP // 1107
AM=M+1 // 1108
A=A-1 // 1109
M=D // 1110
@LCL // 1111
A=M+1 // 1112
D=M // 1113
@16 // 1114
D=D-A // 1115
@DO_LT // 1116
0;JMP // 1117
(Math.multiply.LT.7)
D=!D // 1118
@Math.multiply_WHILE_END1 // 1119
D;JNE // 1120

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
@Math.multiply.EQ.8 // 1121
D=A // 1122
@SP // 1123
AM=M+1 // 1124
A=A-1 // 1125
M=D // 1126
@ARG // 1127
A=M+1 // 1128
D=M // 1129
@SP // 1130
AM=M+1 // 1131
A=A-1 // 1132
M=D // 1133
@LCL // 1134
A=M+1 // 1135
A=A+1 // 1136
D=M // 1137
@SP // 1138
AM=M-1 // 1139
D=D&M // 1140
@DO_EQ // 1141
0;JMP // 1142
(Math.multiply.EQ.8)
D=!D // 1143
@Math.multiply$IF_TRUE6 // 1144
D;JNE // 1145

////GotoInstruction{label='Math.multiply$IF_FALSE6}
// goto Math.multiply$IF_FALSE6
@Math.multiply$IF_FALSE6 // 1146
0;JMP // 1147

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

@ARG // 1148
A=M // 1149
D=M // 1150
@LCL // 1151
A=M // 1152
M=D+M // 1153

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

@ARG // 1154
A=M // 1155
D=M // 1156
@ARG // 1157
A=M // 1158
M=D+M // 1159

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

@LCL // 1160
A=M+1 // 1161
M=M+1 // 1162

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

@LCL // 1163
A=M+1 // 1164
A=A+1 // 1165
D=M // 1166
@LCL // 1167
A=M+1 // 1168
A=A+1 // 1169
M=D+M // 1170

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 1171
0;JMP // 1172

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 1173
A=M // 1174
D=M // 1175
@SP // 1176
AM=M+1 // 1177
A=A-1 // 1178
M=D // 1179
@RETURN // 1180
0;JMP // 1181

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1182
D=A // 1183
@SP // 1184
AM=D+M // 1185
A=A-1 // 1186
M=0 // 1187
A=A-1 // 1188
M=0 // 1189
A=A-1 // 1190
M=0 // 1191

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1192
A=M // 1193
D=M // 1194
@SP // 1195
AM=M+1 // 1196
A=A-1 // 1197
M=D // 1198
// call Math.abs
@6 // 1199
D=A // 1200
@14 // 1201
M=D // 1202
@Math.abs // 1203
D=A // 1204
@13 // 1205
M=D // 1206
@Math.divide.ret.0 // 1207
D=A // 1208
@CALL // 1209
0;JMP // 1210
(Math.divide.ret.0)
@SP // 1211
AM=M-1 // 1212
D=M // 1213
@LCL // 1214
A=M+1 // 1215
M=D // 1216

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1217
A=M+1 // 1218
D=M // 1219
@SP // 1220
AM=M+1 // 1221
A=A-1 // 1222
M=D // 1223
// call Math.abs
@6 // 1224
D=A // 1225
@14 // 1226
M=D // 1227
@Math.abs // 1228
D=A // 1229
@13 // 1230
M=D // 1231
@Math.divide.ret.1 // 1232
D=A // 1233
@CALL // 1234
0;JMP // 1235
(Math.divide.ret.1)
@SP // 1236
AM=M-1 // 1237
D=M // 1238
@LCL // 1239
A=M+1 // 1240
A=A+1 // 1241
M=D // 1242

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.9 // 1243
D=A // 1244
@SP // 1245
AM=M+1 // 1246
A=A-1 // 1247
M=D // 1248
@LCL // 1249
A=M+1 // 1250
A=A+1 // 1251
D=M // 1252
A=A-1 // 1253
D=D-M // 1254
@DO_GT // 1255
0;JMP // 1256
(Math.divide.GT.9)
@Math.divide$IF_TRUE1 // 1257
D;JNE // 1258

////GotoInstruction{label='Math.divide$IF_FALSE1}
// goto Math.divide$IF_FALSE1
@Math.divide$IF_FALSE1 // 1259
0;JMP // 1260

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1261
AM=M+1 // 1262
A=A-1 // 1263
M=0 // 1264
@RETURN // 1265
0;JMP // 1266

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

@LCL // 1267
A=M+1 // 1268
D=M // 1269
@SP // 1270
AM=M+1 // 1271
A=A-1 // 1272
M=D // 1273
@LCL // 1274
A=M+1 // 1275
A=A+1 // 1276
D=M // 1277
D=D+M // 1278
@SP // 1279
AM=M+1 // 1280
A=A-1 // 1281
M=D // 1282
// call Math.divide
@7 // 1283
D=A // 1284
@14 // 1285
M=D // 1286
@Math.divide // 1287
D=A // 1288
@13 // 1289
M=D // 1290
@Math.divide.ret.2 // 1291
D=A // 1292
@CALL // 1293
0;JMP // 1294
(Math.divide.ret.2)
@SP // 1295
AM=M-1 // 1296
D=M // 1297
@LCL // 1298
A=M // 1299
M=D // 1300

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
@Math.divide.LT.10 // 1301
D=A // 1302
@SP // 1303
AM=M+1 // 1304
A=A-1 // 1305
M=D // 1306
@LCL // 1307
A=M+1 // 1308
D=M // 1309
@SP // 1310
AM=M+1 // 1311
A=A-1 // 1312
M=D // 1313
@LCL // 1314
A=M // 1315
D=M // 1316
D=D+M // 1317
@SP // 1318
AM=M+1 // 1319
A=A-1 // 1320
M=D // 1321
@LCL // 1322
A=M+1 // 1323
A=A+1 // 1324
D=M // 1325
@SP // 1326
AM=M+1 // 1327
A=A-1 // 1328
M=D // 1329
// call Math.multiply
@7 // 1330
D=A // 1331
@14 // 1332
M=D // 1333
@Math.multiply // 1334
D=A // 1335
@13 // 1336
M=D // 1337
@Math.divide.ret.3 // 1338
D=A // 1339
@CALL // 1340
0;JMP // 1341
(Math.divide.ret.3)
@SP // 1342
AM=M-1 // 1343
D=M // 1344
@SP // 1345
AM=M-1 // 1346
D=M-D // 1347
@SP // 1348
AM=M+1 // 1349
A=A-1 // 1350
M=D // 1351
@LCL // 1352
A=M+1 // 1353
A=A+1 // 1354
D=M // 1355
@SP // 1356
AM=M-1 // 1357
D=M-D // 1358
@DO_LT // 1359
0;JMP // 1360
(Math.divide.LT.10)
@Math.divide$IF_TRUE2 // 1361
D;JNE // 1362

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 1363
0;JMP // 1364

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
@Math.divide.LT.11 // 1365
D=A // 1366
@SP // 1367
AM=M+1 // 1368
A=A-1 // 1369
M=D // 1370
@ARG // 1371
A=M // 1372
D=M // 1373
@DO_LT // 1374
0;JMP // 1375
(Math.divide.LT.11)
@SP // 1376
AM=M+1 // 1377
A=A-1 // 1378
M=D // 1379
@Math.divide.GT.12 // 1380
D=A // 1381
@SP // 1382
AM=M+1 // 1383
A=A-1 // 1384
M=D // 1385
@ARG // 1386
A=M+1 // 1387
D=M // 1388
@DO_GT // 1389
0;JMP // 1390
(Math.divide.GT.12)
@SP // 1391
AM=M-1 // 1392
D=D&M // 1393
@SP // 1394
AM=M+1 // 1395
A=A-1 // 1396
M=D // 1397
@Math.divide.GT.13 // 1398
D=A // 1399
@SP // 1400
AM=M+1 // 1401
A=A-1 // 1402
M=D // 1403
@ARG // 1404
A=M // 1405
D=M // 1406
@DO_GT // 1407
0;JMP // 1408
(Math.divide.GT.13)
@SP // 1409
AM=M+1 // 1410
A=A-1 // 1411
M=D // 1412
@Math.divide.LT.14 // 1413
D=A // 1414
@SP // 1415
AM=M+1 // 1416
A=A-1 // 1417
M=D // 1418
@ARG // 1419
A=M+1 // 1420
D=M // 1421
@DO_LT // 1422
0;JMP // 1423
(Math.divide.LT.14)
@SP // 1424
AM=M-1 // 1425
D=D&M // 1426
@SP // 1427
AM=M-1 // 1428
D=D|M // 1429
@Math.divide$IF_TRUE3 // 1430
D;JNE // 1431

////GotoInstruction{label='Math.divide$IF_FALSE3}
// goto Math.divide$IF_FALSE3
@Math.divide$IF_FALSE3 // 1432
0;JMP // 1433

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1434
A=M // 1435
D=-M // 1436
@LCL // 1437
A=M // 1438
M=D // 1439

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
@LCL // 1440
A=M // 1441
D=M // 1442
D=D+M // 1443
@SP // 1444
AM=M+1 // 1445
A=A-1 // 1446
M=D // 1447
@RETURN // 1448
0;JMP // 1449

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 1450
0;JMP // 1451

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
@Math.divide.LT.15 // 1452
D=A // 1453
@SP // 1454
AM=M+1 // 1455
A=A-1 // 1456
M=D // 1457
@ARG // 1458
A=M // 1459
D=M // 1460
@DO_LT // 1461
0;JMP // 1462
(Math.divide.LT.15)
@SP // 1463
AM=M+1 // 1464
A=A-1 // 1465
M=D // 1466
@Math.divide.GT.16 // 1467
D=A // 1468
@SP // 1469
AM=M+1 // 1470
A=A-1 // 1471
M=D // 1472
@ARG // 1473
A=M+1 // 1474
D=M // 1475
@DO_GT // 1476
0;JMP // 1477
(Math.divide.GT.16)
@SP // 1478
AM=M-1 // 1479
D=D&M // 1480
@SP // 1481
AM=M+1 // 1482
A=A-1 // 1483
M=D // 1484
@Math.divide.GT.17 // 1485
D=A // 1486
@SP // 1487
AM=M+1 // 1488
A=A-1 // 1489
M=D // 1490
@ARG // 1491
A=M // 1492
D=M // 1493
@DO_GT // 1494
0;JMP // 1495
(Math.divide.GT.17)
@SP // 1496
AM=M+1 // 1497
A=A-1 // 1498
M=D // 1499
@Math.divide.LT.18 // 1500
D=A // 1501
@SP // 1502
AM=M+1 // 1503
A=A-1 // 1504
M=D // 1505
@ARG // 1506
A=M+1 // 1507
D=M // 1508
@DO_LT // 1509
0;JMP // 1510
(Math.divide.LT.18)
@SP // 1511
AM=M-1 // 1512
D=D&M // 1513
@SP // 1514
AM=M-1 // 1515
D=D|M // 1516
@Math.divide$IF_TRUE4 // 1517
D;JNE // 1518

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 1519
0;JMP // 1520

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1521
A=M // 1522
D=-M // 1523
@LCL // 1524
A=M // 1525
M=D // 1526

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
@LCL // 1527
A=M // 1528
D=M // 1529
D=D+M // 1530
D=D+1 // 1531
@SP // 1532
AM=M+1 // 1533
A=A-1 // 1534
M=D // 1535
@RETURN // 1536
0;JMP // 1537

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
@ARG // 1538
A=M // 1539
D=M // 1540
@SP // 1541
AM=M+1 // 1542
A=A-1 // 1543
M=D // 1544
@ARG // 1545
A=M // 1546
D=M // 1547
@SP // 1548
AM=M+1 // 1549
A=A-1 // 1550
M=D // 1551
@ARG // 1552
A=M+1 // 1553
D=M // 1554
@SP // 1555
AM=M+1 // 1556
A=A-1 // 1557
M=D // 1558
// call Math.divide
@7 // 1559
D=A // 1560
@14 // 1561
M=D // 1562
@Math.divide // 1563
D=A // 1564
@13 // 1565
M=D // 1566
@Math.mod.ret.0 // 1567
D=A // 1568
@CALL // 1569
0;JMP // 1570
(Math.mod.ret.0)
@ARG // 1571
A=M+1 // 1572
D=M // 1573
@SP // 1574
AM=M+1 // 1575
A=A-1 // 1576
M=D // 1577
// call Math.multiply
@7 // 1578
D=A // 1579
@14 // 1580
M=D // 1581
@Math.multiply // 1582
D=A // 1583
@13 // 1584
M=D // 1585
@Math.mod.ret.1 // 1586
D=A // 1587
@CALL // 1588
0;JMP // 1589
(Math.mod.ret.1)
@SP // 1590
AM=M-1 // 1591
D=M // 1592
@SP // 1593
AM=M-1 // 1594
D=M-D // 1595
@SP // 1596
AM=M+1 // 1597
A=A-1 // 1598
M=D // 1599
@RETURN // 1600
0;JMP // 1601

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
@Math.0 // 1602
D=M // 1603
@SP // 1604
AM=M+1 // 1605
A=A-1 // 1606
M=D // 1607
@ARG // 1608
A=M // 1609
D=M // 1610
@SP // 1611
AM=M-1 // 1612
A=D+M // 1613
D=M // 1614
@SP // 1615
AM=M+1 // 1616
A=A-1 // 1617
M=D // 1618
@RETURN // 1619
0;JMP // 1620

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1621
D=A // 1622
@SP // 1623
AM=D+M // 1624
A=A-1 // 1625
M=0 // 1626
A=A-1 // 1627
M=0 // 1628
A=A-1 // 1629
M=0 // 1630
A=A-1 // 1631
M=0 // 1632

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1633
A=M // 1634
M=0 // 1635

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1636
D=A // 1637
@LCL // 1638
A=M+1 // 1639
M=D // 1640

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
@Math.sqrt.LT.19 // 1641
D=A // 1642
@SP // 1643
AM=M+1 // 1644
A=A-1 // 1645
M=D // 1646
@LCL // 1647
A=M+1 // 1648
D=M // 1649
@DO_LT // 1650
0;JMP // 1651
(Math.sqrt.LT.19)
@Math.sqrt_WHILE_END1 // 1652
D;JNE // 1653

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

@LCL // 1654
A=M // 1655
D=M // 1656
@SP // 1657
AM=M+1 // 1658
A=A-1 // 1659
M=D // 1660
@Math.0 // 1661
D=M // 1662
@SP // 1663
AM=M+1 // 1664
A=A-1 // 1665
M=D // 1666
@LCL // 1667
A=M+1 // 1668
D=M // 1669
@SP // 1670
AM=M-1 // 1671
A=D+M // 1672
D=M // 1673
@SP // 1674
AM=M-1 // 1675
D=D+M // 1676
@LCL // 1677
A=M+1 // 1678
A=A+1 // 1679
M=D // 1680

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1681
D=A // 1682
@SP // 1683
M=D+M // 1684
@LCL // 1685
A=M+1 // 1686
A=A+1 // 1687
D=M // 1688
@SP // 1689
A=M-1 // 1690
M=D // 1691
A=A-1 // 1692
M=D // 1693
// call Math.multiply
@7 // 1694
D=A // 1695
@14 // 1696
M=D // 1697
@Math.multiply // 1698
D=A // 1699
@13 // 1700
M=D // 1701
@Math.sqrt.ret.0 // 1702
D=A // 1703
@CALL // 1704
0;JMP // 1705
(Math.sqrt.ret.0)
@SP // 1706
AM=M-1 // 1707
D=M // 1708
@LCL // 1709
A=M+1 // 1710
A=A+1 // 1711
A=A+1 // 1712
M=D // 1713

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
@Math.sqrt.GT.20 // 1714
D=A // 1715
@SP // 1716
AM=M+1 // 1717
A=A-1 // 1718
M=D // 1719
@LCL // 1720
A=M+1 // 1721
A=A+1 // 1722
A=A+1 // 1723
D=M // 1724
@SP // 1725
AM=M+1 // 1726
A=A-1 // 1727
M=D // 1728
@ARG // 1729
A=M // 1730
D=M // 1731
@SP // 1732
AM=M-1 // 1733
D=M-D // 1734
@DO_GT // 1735
0;JMP // 1736
(Math.sqrt.GT.20)
@SP // 1737
AM=M+1 // 1738
A=A-1 // 1739
M=D // 1740
@SP // 1741
A=M-1 // 1742
M=!D // 1743
@Math.sqrt.GT.21 // 1744
D=A // 1745
@SP // 1746
AM=M+1 // 1747
A=A-1 // 1748
M=D // 1749
@LCL // 1750
A=M+1 // 1751
A=A+1 // 1752
A=A+1 // 1753
D=M // 1754
@DO_GT // 1755
0;JMP // 1756
(Math.sqrt.GT.21)
@SP // 1757
AM=M-1 // 1758
D=D&M // 1759
@Math.sqrt$IF_TRUE1 // 1760
D;JNE // 1761

////GotoInstruction{label='Math.sqrt$IF_FALSE1}
// goto Math.sqrt$IF_FALSE1
@Math.sqrt$IF_FALSE1 // 1762
0;JMP // 1763

////LabelInstruction{label='Math.sqrt$IF_TRUE1}
// label Math.sqrt$IF_TRUE1
(Math.sqrt$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1764
A=M+1 // 1765
A=A+1 // 1766
D=M // 1767
@LCL // 1768
A=M // 1769
M=D // 1770

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

@LCL // 1771
A=M+1 // 1772
M=M-1 // 1773

////GotoInstruction{label='Math.sqrt_WHILE_EXP1}
// goto Math.sqrt_WHILE_EXP1
@Math.sqrt_WHILE_EXP1 // 1774
0;JMP // 1775

////LabelInstruction{label='Math.sqrt_WHILE_END1}
// label Math.sqrt_WHILE_END1
(Math.sqrt_WHILE_END1)

////PushInstruction("local 0")
@LCL // 1776
A=M // 1777
D=M // 1778
@SP // 1779
AM=M+1 // 1780
A=A-1 // 1781
M=D // 1782
@RETURN // 1783
0;JMP // 1784

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
@Math.max.GT.22 // 1785
D=A // 1786
@SP // 1787
AM=M+1 // 1788
A=A-1 // 1789
M=D // 1790
@ARG // 1791
A=M+1 // 1792
D=M // 1793
A=A-1 // 1794
D=M-D // 1795
@DO_GT // 1796
0;JMP // 1797
(Math.max.GT.22)
@Math.max$IF_TRUE1 // 1798
D;JNE // 1799

////GotoInstruction{label='Math.max$IF_FALSE1}
// goto Math.max$IF_FALSE1
@Math.max$IF_FALSE1 // 1800
0;JMP // 1801

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 1802
A=M // 1803
D=M // 1804
@SP // 1805
AM=M+1 // 1806
A=A-1 // 1807
M=D // 1808
@RETURN // 1809
0;JMP // 1810

////LabelInstruction{label='Math.max$IF_FALSE1}
// label Math.max$IF_FALSE1
(Math.max$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 1811
A=M+1 // 1812
D=M // 1813
@SP // 1814
AM=M+1 // 1815
A=A-1 // 1816
M=D // 1817
@RETURN // 1818
0;JMP // 1819

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
@Math.min.LT.23 // 1820
D=A // 1821
@SP // 1822
AM=M+1 // 1823
A=A-1 // 1824
M=D // 1825
@ARG // 1826
A=M+1 // 1827
D=M // 1828
A=A-1 // 1829
D=M-D // 1830
@DO_LT // 1831
0;JMP // 1832
(Math.min.LT.23)
@Math.min$IF_TRUE1 // 1833
D;JNE // 1834

////GotoInstruction{label='Math.min$IF_FALSE1}
// goto Math.min$IF_FALSE1
@Math.min$IF_FALSE1 // 1835
0;JMP // 1836

////LabelInstruction{label='Math.min$IF_TRUE1}
// label Math.min$IF_TRUE1
(Math.min$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 1837
A=M // 1838
D=M // 1839
@SP // 1840
AM=M+1 // 1841
A=A-1 // 1842
M=D // 1843
@RETURN // 1844
0;JMP // 1845

////LabelInstruction{label='Math.min$IF_FALSE1}
// label Math.min$IF_FALSE1
(Math.min$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 1846
A=M+1 // 1847
D=M // 1848
@SP // 1849
AM=M+1 // 1850
A=A-1 // 1851
M=D // 1852
@RETURN // 1853
0;JMP // 1854

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1855
A=M // 1856
D=M // 1857
@SP // 1858
AM=M+1 // 1859
A=A-1 // 1860
M=D // 1861
@ARG // 1862
A=M // 1863
D=M // 1864
@SP // 1865
AM=M+1 // 1866
A=A-1 // 1867
M=D // 1868
@SP // 1869
A=M-1 // 1870
M=-D // 1871
// call Math.max
@7 // 1872
D=A // 1873
@14 // 1874
M=D // 1875
@Math.max // 1876
D=A // 1877
@13 // 1878
M=D // 1879
@Math.abs.ret.0 // 1880
D=A // 1881
@CALL // 1882
0;JMP // 1883
(Math.abs.ret.0)
@RETURN // 1884
0;JMP // 1885

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1886
M=M+1 // 1887
AM=M+1 // 1888
A=A-1 // 1889
M=0 // 1890
A=A-1 // 1891
M=0 // 1892

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

@2055 // 1893
D=A // 1894
@LCL // 1895
A=M // 1896
M=D // 1897

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
@LCL // 1898
A=M // 1899
D=M // 1900
@SP // 1901
AM=M+1 // 1902
A=A-1 // 1903
M=D // 1904
@LCL // 1905
A=M // 1906
D=M // 1907
@16384 // 1908
D=A-D // 1909
@5 // 1910
D=D-A // 1911
@SP // 1912
AM=M-1 // 1913
A=M // 1914
M=D // 1915

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1916
A=M // 1917
D=M // 1918
@SP // 1919
AM=M+1 // 1920
A=A-1 // 1921
M=D+1 // 1922
D=1 // 1923
@SP // 1924
AM=M-1 // 1925
A=M // 1926
M=D // 1927

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1928
A=M // 1929
D=M // 1930
@2 // 1931
D=D+A // 1932
@SP // 1933
AM=M+1 // 1934
A=A-1 // 1935
M=D // 1936
D=0 // 1937
@SP // 1938
AM=M-1 // 1939
A=M // 1940
M=D // 1941

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1942
A=M // 1943
D=M // 1944
@3 // 1945
D=D+A // 1946
@SP // 1947
AM=M+1 // 1948
A=A-1 // 1949
M=D // 1950
D=0 // 1951
@SP // 1952
AM=M-1 // 1953
A=M // 1954
M=D // 1955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1956
A=M // 1957
D=M // 1958
@SP // 1959
AM=M+1 // 1960
A=A-1 // 1961
M=D // 1962
// call Memory.create_foot
@6 // 1963
D=A // 1964
@14 // 1965
M=D // 1966
@Memory.create_foot // 1967
D=A // 1968
@13 // 1969
M=D // 1970
@Memory.init.ret.0 // 1971
D=A // 1972
@CALL // 1973
0;JMP // 1974
(Memory.init.ret.0)
@SP // 1975
M=M-1 // 1976

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

@2054 // 1977
D=A // 1978
@SP // 1979
AM=M+1 // 1980
A=A-1 // 1981
M=D // 1982
@2054 // 1983
D=A // 1984
@SP // 1985
AM=M+1 // 1986
A=A-1 // 1987
M=D // 1988
@LCL // 1989
A=M // 1990
D=M // 1991
@SP // 1992
AM=M+1 // 1993
A=A-1 // 1994
M=D // 1995
// call Memory.add_node
@7 // 1996
D=A // 1997
@14 // 1998
M=D // 1999
@Memory.add_node // 2000
D=A // 2001
@13 // 2002
M=D // 2003
@Memory.init.ret.1 // 2004
D=A // 2005
@CALL // 2006
0;JMP // 2007
(Memory.init.ret.1)
@SP // 2008
M=M-1 // 2009

////PushInstruction("constant 0")
@SP // 2010
AM=M+1 // 2011
A=A-1 // 2012
M=0 // 2013
@RETURN // 2014
0;JMP // 2015

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2016
D=A // 2017
@SP // 2018
AM=D+M // 2019
A=A-1 // 2020
M=0 // 2021
A=A-1 // 2022
M=0 // 2023
A=A-1 // 2024
M=0 // 2025
A=A-1 // 2026
M=0 // 2027
A=A-1 // 2028
M=0 // 2029

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2030
A=M // 2031
D=M // 2032
@SP // 2033
AM=M+1 // 2034
A=A-1 // 2035
M=D // 2036
// call Memory.getBinIndex
@6 // 2037
D=A // 2038
@14 // 2039
M=D // 2040
@Memory.getBinIndex // 2041
D=A // 2042
@13 // 2043
M=D // 2044
@Memory.alloc.ret.0 // 2045
D=A // 2046
@CALL // 2047
0;JMP // 2048
(Memory.alloc.ret.0)
@SP // 2049
AM=M-1 // 2050
D=M // 2051
@LCL // 2052
A=M // 2053
M=D // 2054

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

@LCL // 2055
A=M // 2056
D=M // 2057
@2048 // 2058
D=D+A // 2059
@LCL // 2060
A=M+1 // 2061
M=D // 2062

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2063
A=M+1 // 2064
D=M // 2065
@SP // 2066
AM=M+1 // 2067
A=A-1 // 2068
M=D // 2069
@ARG // 2070
A=M // 2071
D=M // 2072
@SP // 2073
AM=M+1 // 2074
A=A-1 // 2075
M=D // 2076
// call Memory.get_best_fit
@7 // 2077
D=A // 2078
@14 // 2079
M=D // 2080
@Memory.get_best_fit // 2081
D=A // 2082
@13 // 2083
M=D // 2084
@Memory.alloc.ret.1 // 2085
D=A // 2086
@CALL // 2087
0;JMP // 2088
(Memory.alloc.ret.1)
@SP // 2089
AM=M-1 // 2090
D=M // 2091
@LCL // 2092
A=M+1 // 2093
A=A+1 // 2094
M=D // 2095

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
@Memory.alloc.EQ.0 // 2096
D=A // 2097
@SP // 2098
AM=M+1 // 2099
A=A-1 // 2100
M=D // 2101
@LCL // 2102
A=M+1 // 2103
A=A+1 // 2104
D=M // 2105
@DO_EQ // 2106
0;JMP // 2107
(Memory.alloc.EQ.0)
D=!D // 2108
@Memory.alloc_WHILE_END1 // 2109
D;JNE // 2110

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
@Memory.alloc.LT.1 // 2111
D=A // 2112
@SP // 2113
AM=M+1 // 2114
A=A-1 // 2115
M=D // 2116
@LCL // 2117
A=M // 2118
D=M // 2119
D=D+1 // 2120
@7 // 2121
D=D-A // 2122
@DO_LT // 2123
0;JMP // 2124
(Memory.alloc.LT.1)
D=!D // 2125
@Memory.alloc$IF_TRUE1 // 2126
D;JNE // 2127

////GotoInstruction{label='Memory.alloc$IF_FALSE1}
// goto Memory.alloc$IF_FALSE1
@Memory.alloc$IF_FALSE1 // 2128
0;JMP // 2129

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2130
AM=M+1 // 2131
A=A-1 // 2132
M=0 // 2133
@RETURN // 2134
0;JMP // 2135

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

@LCL // 2136
A=M // 2137
M=M+1 // 2138

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

@LCL // 2139
A=M // 2140
D=M // 2141
@2048 // 2142
D=D+A // 2143
@LCL // 2144
A=M+1 // 2145
M=D // 2146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2147
A=M+1 // 2148
D=M // 2149
@SP // 2150
AM=M+1 // 2151
A=A-1 // 2152
M=D // 2153
@ARG // 2154
A=M // 2155
D=M // 2156
@SP // 2157
AM=M+1 // 2158
A=A-1 // 2159
M=D // 2160
// call Memory.get_best_fit
@7 // 2161
D=A // 2162
@14 // 2163
M=D // 2164
@Memory.get_best_fit // 2165
D=A // 2166
@13 // 2167
M=D // 2168
@Memory.alloc.ret.2 // 2169
D=A // 2170
@CALL // 2171
0;JMP // 2172
(Memory.alloc.ret.2)
@SP // 2173
AM=M-1 // 2174
D=M // 2175
@LCL // 2176
A=M+1 // 2177
A=A+1 // 2178
M=D // 2179

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 2180
0;JMP // 2181

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

@LCL // 2182
A=M+1 // 2183
A=A+1 // 2184
D=M // 2185
@0 // 2186
A=D+A // 2187
D=M // 2188
@SP // 2189
AM=M+1 // 2190
A=A-1 // 2191
M=D // 2192
// call Memory.getBinIndex
@6 // 2193
D=A // 2194
@14 // 2195
M=D // 2196
@Memory.getBinIndex // 2197
D=A // 2198
@13 // 2199
M=D // 2200
@Memory.alloc.ret.3 // 2201
D=A // 2202
@CALL // 2203
0;JMP // 2204
(Memory.alloc.ret.3)
@SP // 2205
AM=M-1 // 2206
D=M // 2207
@2048 // 2208
D=D+A // 2209
@SP // 2210
AM=M+1 // 2211
A=A-1 // 2212
M=D // 2213
@LCL // 2214
A=M+1 // 2215
A=A+1 // 2216
D=M // 2217
@SP // 2218
AM=M+1 // 2219
A=A-1 // 2220
M=D // 2221
// call Memory.remove_node
@7 // 2222
D=A // 2223
@14 // 2224
M=D // 2225
@Memory.remove_node // 2226
D=A // 2227
@13 // 2228
M=D // 2229
@Memory.alloc.ret.4 // 2230
D=A // 2231
@CALL // 2232
0;JMP // 2233
(Memory.alloc.ret.4)
@SP // 2234
M=M-1 // 2235

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

@LCL // 2236
A=M+1 // 2237
A=A+1 // 2238
D=M // 2239
@0 // 2240
A=D+A // 2241
D=M // 2242
@SP // 2243
AM=M+1 // 2244
A=A-1 // 2245
M=D // 2246
@ARG // 2247
A=M // 2248
D=M // 2249
@SP // 2250
AM=M-1 // 2251
D=M-D // 2252
@LCL // 2253
A=M+1 // 2254
A=A+1 // 2255
A=A+1 // 2256
M=D // 2257

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.2 // 2258
D=A // 2259
@SP // 2260
AM=M+1 // 2261
A=A-1 // 2262
M=D // 2263
@LCL // 2264
A=M+1 // 2265
A=A+1 // 2266
A=A+1 // 2267
D=M // 2268
@5 // 2269
D=D-A // 2270
@DO_GT // 2271
0;JMP // 2272
(Memory.alloc.GT.2)
@Memory.alloc$IF_TRUE2 // 2273
D;JNE // 2274

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 2275
0;JMP // 2276

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

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 2470
0;JMP // 2471

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

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 0"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.calloc$IF_TRUE1}}
@LCL // 2548
A=M // 2549
D=!M // 2550
@Memory.calloc$IF_TRUE1 // 2551
D;JNE // 2552

////GotoInstruction{label='Memory.calloc$IF_FALSE1}
// goto Memory.calloc$IF_FALSE1
@Memory.calloc$IF_FALSE1 // 2553
0;JMP // 2554

////LabelInstruction{label='Memory.calloc$IF_TRUE1}
// label Memory.calloc$IF_TRUE1
(Memory.calloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2555
AM=M+1 // 2556
A=A-1 // 2557
M=0 // 2558
@RETURN // 2559
0;JMP // 2560

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
@Memory.calloc.GT.3 // 2561
D=A // 2562
@SP // 2563
AM=M+1 // 2564
A=A-1 // 2565
M=D // 2566
@ARG // 2567
A=M // 2568
D=M // 2569
@DO_GT // 2570
0;JMP // 2571
(Memory.calloc.GT.3)
D=!D // 2572
@Memory.calloc_WHILE_END1 // 2573
D;JNE // 2574

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

@ARG // 2575
A=M // 2576
M=M-1 // 2577

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2578
A=M // 2579
D=M // 2580
@SP // 2581
AM=M+1 // 2582
A=A-1 // 2583
M=D // 2584
@ARG // 2585
A=M // 2586
D=M // 2587
@SP // 2588
AM=M-1 // 2589
D=D+M // 2590
@SP // 2591
AM=M+1 // 2592
A=A-1 // 2593
M=D // 2594
D=0 // 2595
@SP // 2596
AM=M-1 // 2597
A=M // 2598
M=D // 2599

////GotoInstruction{label='Memory.calloc_WHILE_EXP1}
// goto Memory.calloc_WHILE_EXP1
@Memory.calloc_WHILE_EXP1 // 2600
0;JMP // 2601

////LabelInstruction{label='Memory.calloc_WHILE_END1}
// label Memory.calloc_WHILE_END1
(Memory.calloc_WHILE_END1)

////PushInstruction("local 0")
@LCL // 2602
A=M // 2603
D=M // 2604
@SP // 2605
AM=M+1 // 2606
A=A-1 // 2607
M=D // 2608
@RETURN // 2609
0;JMP // 2610

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2611
D=A // 2612
@SP // 2613
AM=D+M // 2614
A=A-1 // 2615
M=0 // 2616
A=A-1 // 2617
M=0 // 2618
A=A-1 // 2619
M=0 // 2620

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

@ARG // 2621
A=M // 2622
D=M // 2623
@4 // 2624
D=D-A // 2625
@LCL // 2626
A=M // 2627
M=D // 2628

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2629
A=M // 2630
D=M // 2631
@SP // 2632
AM=M+1 // 2633
A=A-1 // 2634
M=D+1 // 2635
D=1 // 2636
@SP // 2637
AM=M-1 // 2638
A=M // 2639
M=D // 2640

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

@LCL // 2641
A=M // 2642
D=M // 2643
@2 // 2644
A=D+A // 2645
D=M // 2646
@LCL // 2647
A=M+1 // 2648
M=D // 2649

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

@LCL // 2650
A=M // 2651
D=M // 2652
@3 // 2653
A=D+A // 2654
D=M // 2655
@LCL // 2656
A=M+1 // 2657
A=A+1 // 2658
M=D // 2659

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.4 // 2660
D=A // 2661
@SP // 2662
AM=M+1 // 2663
A=A-1 // 2664
M=D // 2665
@LCL // 2666
A=M+1 // 2667
D=M // 2668
@DO_EQ // 2669
0;JMP // 2670
(Memory.deAlloc.EQ.4)
D=!D // 2671
@Memory.deAlloc$IF_TRUE1 // 2672
D;JNE // 2673

////GotoInstruction{label='Memory.deAlloc$IF_FALSE1}
// goto Memory.deAlloc$IF_FALSE1
@Memory.deAlloc$IF_FALSE1 // 2674
0;JMP // 2675

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
@Memory.deAlloc.EQ.5 // 2676
D=A // 2677
@SP // 2678
AM=M+1 // 2679
A=A-1 // 2680
M=D // 2681
@LCL // 2682
A=M+1 // 2683
D=M // 2684
A=D+1 // 2685
D=M // 2686
D=D-1 // 2687
@DO_EQ // 2688
0;JMP // 2689
(Memory.deAlloc.EQ.5)
@Memory.deAlloc$IF_TRUE2 // 2690
D;JNE // 2691

////GotoInstruction{label='Memory.deAlloc$IF_FALSE2}
// goto Memory.deAlloc$IF_FALSE2
@Memory.deAlloc$IF_FALSE2 // 2692
0;JMP // 2693

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

@LCL // 2694
A=M+1 // 2695
D=M // 2696
@0 // 2697
A=D+A // 2698
D=M // 2699
@SP // 2700
AM=M+1 // 2701
A=A-1 // 2702
M=D // 2703
// call Memory.getBinIndex
@6 // 2704
D=A // 2705
@14 // 2706
M=D // 2707
@Memory.getBinIndex // 2708
D=A // 2709
@13 // 2710
M=D // 2711
@Memory.deAlloc.ret.0 // 2712
D=A // 2713
@CALL // 2714
0;JMP // 2715
(Memory.deAlloc.ret.0)
@SP // 2716
AM=M-1 // 2717
D=M // 2718
@2048 // 2719
D=D+A // 2720
@SP // 2721
AM=M+1 // 2722
A=A-1 // 2723
M=D // 2724
@LCL // 2725
A=M+1 // 2726
D=M // 2727
@SP // 2728
AM=M+1 // 2729
A=A-1 // 2730
M=D // 2731
// call Memory.remove_node
@7 // 2732
D=A // 2733
@14 // 2734
M=D // 2735
@Memory.remove_node // 2736
D=A // 2737
@13 // 2738
M=D // 2739
@Memory.deAlloc.ret.1 // 2740
D=A // 2741
@CALL // 2742
0;JMP // 2743
(Memory.deAlloc.ret.1)
@SP // 2744
M=M-1 // 2745

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
@LCL // 2746
A=M+1 // 2747
D=M // 2748
@SP // 2749
AM=M+1 // 2750
A=A-1 // 2751
M=D // 2752
@LCL // 2753
A=M+1 // 2754
D=M // 2755
@0 // 2756
A=D+A // 2757
D=M // 2758
@SP // 2759
AM=M+1 // 2760
A=A-1 // 2761
M=D // 2762
@LCL // 2763
A=M // 2764
D=M // 2765
@0 // 2766
A=D+A // 2767
D=M // 2768
@SP // 2769
AM=M-1 // 2770
D=D+M // 2771
@5 // 2772
D=D+A // 2773
@SP // 2774
AM=M-1 // 2775
A=M // 2776
M=D // 2777

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2778
A=M+1 // 2779
D=M // 2780
@SP // 2781
AM=M+1 // 2782
A=A-1 // 2783
M=D // 2784
// call Memory.create_foot
@6 // 2785
D=A // 2786
@14 // 2787
M=D // 2788
@Memory.create_foot // 2789
D=A // 2790
@13 // 2791
M=D // 2792
@Memory.deAlloc.ret.2 // 2793
D=A // 2794
@CALL // 2795
0;JMP // 2796
(Memory.deAlloc.ret.2)
@SP // 2797
M=M-1 // 2798

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2799
A=M+1 // 2800
D=M // 2801
@LCL // 2802
A=M // 2803
M=D // 2804

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
@Memory.deAlloc.EQ.6 // 2805
D=A // 2806
@SP // 2807
AM=M+1 // 2808
A=A-1 // 2809
M=D // 2810
@LCL // 2811
A=M+1 // 2812
A=A+1 // 2813
D=M // 2814
@DO_EQ // 2815
0;JMP // 2816
(Memory.deAlloc.EQ.6)
D=!D // 2817
@Memory.deAlloc$IF_TRUE3 // 2818
D;JNE // 2819

////GotoInstruction{label='Memory.deAlloc$IF_FALSE3}
// goto Memory.deAlloc$IF_FALSE3
@Memory.deAlloc$IF_FALSE3 // 2820
0;JMP // 2821

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
@Memory.deAlloc.EQ.7 // 2822
D=A // 2823
@SP // 2824
AM=M+1 // 2825
A=A-1 // 2826
M=D // 2827
@LCL // 2828
A=M+1 // 2829
A=A+1 // 2830
D=M // 2831
A=D+1 // 2832
D=M // 2833
D=D-1 // 2834
@DO_EQ // 2835
0;JMP // 2836
(Memory.deAlloc.EQ.7)
@Memory.deAlloc$IF_TRUE4 // 2837
D;JNE // 2838

////GotoInstruction{label='Memory.deAlloc$IF_FALSE4}
// goto Memory.deAlloc$IF_FALSE4
@Memory.deAlloc$IF_FALSE4 // 2839
0;JMP // 2840

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

@LCL // 2841
A=M+1 // 2842
A=A+1 // 2843
D=M // 2844
@0 // 2845
A=D+A // 2846
D=M // 2847
@SP // 2848
AM=M+1 // 2849
A=A-1 // 2850
M=D // 2851
// call Memory.getBinIndex
@6 // 2852
D=A // 2853
@14 // 2854
M=D // 2855
@Memory.getBinIndex // 2856
D=A // 2857
@13 // 2858
M=D // 2859
@Memory.deAlloc.ret.3 // 2860
D=A // 2861
@CALL // 2862
0;JMP // 2863
(Memory.deAlloc.ret.3)
@SP // 2864
AM=M-1 // 2865
D=M // 2866
@2048 // 2867
D=D+A // 2868
@SP // 2869
AM=M+1 // 2870
A=A-1 // 2871
M=D // 2872
@LCL // 2873
A=M+1 // 2874
A=A+1 // 2875
D=M // 2876
@SP // 2877
AM=M+1 // 2878
A=A-1 // 2879
M=D // 2880
// call Memory.remove_node
@7 // 2881
D=A // 2882
@14 // 2883
M=D // 2884
@Memory.remove_node // 2885
D=A // 2886
@13 // 2887
M=D // 2888
@Memory.deAlloc.ret.4 // 2889
D=A // 2890
@CALL // 2891
0;JMP // 2892
(Memory.deAlloc.ret.4)
@SP // 2893
M=M-1 // 2894

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
@LCL // 2895
A=M // 2896
D=M // 2897
@SP // 2898
AM=M+1 // 2899
A=A-1 // 2900
M=D // 2901
@LCL // 2902
A=M // 2903
D=M // 2904
@0 // 2905
A=D+A // 2906
D=M // 2907
@SP // 2908
AM=M+1 // 2909
A=A-1 // 2910
M=D // 2911
@LCL // 2912
A=M+1 // 2913
A=A+1 // 2914
D=M // 2915
@0 // 2916
A=D+A // 2917
D=M // 2918
@SP // 2919
AM=M-1 // 2920
D=D+M // 2921
@5 // 2922
D=D+A // 2923
@SP // 2924
AM=M-1 // 2925
A=M // 2926
M=D // 2927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2928
A=M // 2929
D=M // 2930
@SP // 2931
AM=M+1 // 2932
A=A-1 // 2933
M=D // 2934
// call Memory.create_foot
@6 // 2935
D=A // 2936
@14 // 2937
M=D // 2938
@Memory.create_foot // 2939
D=A // 2940
@13 // 2941
M=D // 2942
@Memory.deAlloc.ret.5 // 2943
D=A // 2944
@CALL // 2945
0;JMP // 2946
(Memory.deAlloc.ret.5)
@SP // 2947
M=M-1 // 2948

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

@LCL // 2949
A=M // 2950
D=M // 2951
@0 // 2952
A=D+A // 2953
D=M // 2954
@SP // 2955
AM=M+1 // 2956
A=A-1 // 2957
M=D // 2958
// call Memory.getBinIndex
@6 // 2959
D=A // 2960
@14 // 2961
M=D // 2962
@Memory.getBinIndex // 2963
D=A // 2964
@13 // 2965
M=D // 2966
@Memory.deAlloc.ret.6 // 2967
D=A // 2968
@CALL // 2969
0;JMP // 2970
(Memory.deAlloc.ret.6)
@SP // 2971
AM=M-1 // 2972
D=M // 2973
@2048 // 2974
D=D+A // 2975
@SP // 2976
AM=M+1 // 2977
A=A-1 // 2978
M=D // 2979
@LCL // 2980
A=M // 2981
D=M // 2982
@SP // 2983
AM=M+1 // 2984
A=A-1 // 2985
M=D // 2986
// call Memory.add_node
@7 // 2987
D=A // 2988
@14 // 2989
M=D // 2990
@Memory.add_node // 2991
D=A // 2992
@13 // 2993
M=D // 2994
@Memory.deAlloc.ret.7 // 2995
D=A // 2996
@CALL // 2997
0;JMP // 2998
(Memory.deAlloc.ret.7)
@SP // 2999
M=M-1 // 3000

////PushInstruction("constant 0")
@SP // 3001
AM=M+1 // 3002
A=A-1 // 3003
M=0 // 3004
@RETURN // 3005
0;JMP // 3006

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 3007
D=A // 3008
@SP // 3009
AM=D+M // 3010
A=A-1 // 3011
M=0 // 3012
A=A-1 // 3013
M=0 // 3014
A=A-1 // 3015
M=0 // 3016
A=A-1 // 3017
M=0 // 3018

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc$IF_TRUE1}}
@Memory.realloc.EQ.8 // 3019
D=A // 3020
@SP // 3021
AM=M+1 // 3022
A=A-1 // 3023
M=D // 3024
@ARG // 3025
A=M // 3026
D=M // 3027
@DO_EQ // 3028
0;JMP // 3029
(Memory.realloc.EQ.8)
@Memory.realloc$IF_TRUE1 // 3030
D;JNE // 3031

////GotoInstruction{label='Memory.realloc$IF_FALSE1}
// goto Memory.realloc$IF_FALSE1
@Memory.realloc$IF_FALSE1 // 3032
0;JMP // 3033

////LabelInstruction{label='Memory.realloc$IF_TRUE1}
// label Memory.realloc$IF_TRUE1
(Memory.realloc$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3034
A=M+1 // 3035
D=M // 3036
@SP // 3037
AM=M+1 // 3038
A=A-1 // 3039
M=D // 3040
// call Memory.alloc
@6 // 3041
D=A // 3042
@14 // 3043
M=D // 3044
@Memory.alloc // 3045
D=A // 3046
@13 // 3047
M=D // 3048
@Memory.realloc.ret.0 // 3049
D=A // 3050
@CALL // 3051
0;JMP // 3052
(Memory.realloc.ret.0)
@RETURN // 3053
0;JMP // 3054

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

@ARG // 3055
A=M // 3056
D=M // 3057
D=D-1 // 3058
@LCL // 3059
A=M+1 // 3060
A=A+1 // 3061
A=A+1 // 3062
M=D // 3063

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

@LCL // 3064
A=M+1 // 3065
A=A+1 // 3066
A=A+1 // 3067
D=M // 3068
@0 // 3069
A=D+A // 3070
D=M // 3071
@LCL // 3072
A=M // 3073
M=D // 3074

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3075
A=M+1 // 3076
D=M // 3077
@SP // 3078
AM=M+1 // 3079
A=A-1 // 3080
M=D // 3081
// call Memory.alloc
@6 // 3082
D=A // 3083
@14 // 3084
M=D // 3085
@Memory.alloc // 3086
D=A // 3087
@13 // 3088
M=D // 3089
@Memory.realloc.ret.1 // 3090
D=A // 3091
@CALL // 3092
0;JMP // 3093
(Memory.realloc.ret.1)
@SP // 3094
AM=M-1 // 3095
D=M // 3096
@LCL // 3097
A=M+1 // 3098
M=D // 3099

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.realloc$IF_TRUE2}}
@Memory.realloc.EQ.9 // 3100
D=A // 3101
@SP // 3102
AM=M+1 // 3103
A=A-1 // 3104
M=D // 3105
@LCL // 3106
A=M+1 // 3107
D=M // 3108
@DO_EQ // 3109
0;JMP // 3110
(Memory.realloc.EQ.9)
@Memory.realloc$IF_TRUE2 // 3111
D;JNE // 3112

////GotoInstruction{label='Memory.realloc$IF_FALSE2}
// goto Memory.realloc$IF_FALSE2
@Memory.realloc$IF_FALSE2 // 3113
0;JMP // 3114

////LabelInstruction{label='Memory.realloc$IF_TRUE2}
// label Memory.realloc$IF_TRUE2
(Memory.realloc$IF_TRUE2)

////PushInstruction("constant 0")
@SP // 3115
AM=M+1 // 3116
A=A-1 // 3117
M=0 // 3118
@RETURN // 3119
0;JMP // 3120

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
@Memory.realloc.GT.10 // 3121
D=A // 3122
@SP // 3123
AM=M+1 // 3124
A=A-1 // 3125
M=D // 3126
@LCL // 3127
A=M // 3128
D=M // 3129
@SP // 3130
AM=M+1 // 3131
A=A-1 // 3132
M=D // 3133
@ARG // 3134
A=M+1 // 3135
D=M // 3136
@SP // 3137
AM=M-1 // 3138
D=M-D // 3139
@DO_GT // 3140
0;JMP // 3141
(Memory.realloc.GT.10)
D=!D // 3142
@Memory.realloc$IF_TRUE3 // 3143
D;JNE // 3144

////GotoInstruction{label='Memory.realloc$IF_FALSE3}
// goto Memory.realloc$IF_FALSE3
@Memory.realloc$IF_FALSE3 // 3145
0;JMP // 3146

////LabelInstruction{label='Memory.realloc$IF_TRUE3}
// label Memory.realloc$IF_TRUE3
(Memory.realloc$IF_TRUE3)

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3147
A=M // 3148
D=M // 3149
@LCL // 3150
A=M+1 // 3151
A=A+1 // 3152
M=D // 3153

////GotoInstruction{label='Memory.realloc$IF_END3}
// goto Memory.realloc$IF_END3
@Memory.realloc$IF_END3 // 3154
0;JMP // 3155

////LabelInstruction{label='Memory.realloc$IF_FALSE3}
// label Memory.realloc$IF_FALSE3
(Memory.realloc$IF_FALSE3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3156
A=M+1 // 3157
D=M // 3158
@LCL // 3159
A=M+1 // 3160
A=A+1 // 3161
M=D // 3162

////LabelInstruction{label='Memory.realloc$IF_END3}
// label Memory.realloc$IF_END3
(Memory.realloc$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3163
A=M // 3164
D=M // 3165
@SP // 3166
AM=M+1 // 3167
A=A-1 // 3168
M=D // 3169
@LCL // 3170
A=M+1 // 3171
D=M // 3172
@SP // 3173
AM=M+1 // 3174
A=A-1 // 3175
M=D // 3176
@LCL // 3177
A=M+1 // 3178
A=A+1 // 3179
D=M // 3180
@SP // 3181
AM=M+1 // 3182
A=A-1 // 3183
M=D // 3184
// call Memory.copy
@8 // 3185
D=A // 3186
@14 // 3187
M=D // 3188
@Memory.copy // 3189
D=A // 3190
@13 // 3191
M=D // 3192
@Memory.realloc.ret.2 // 3193
D=A // 3194
@CALL // 3195
0;JMP // 3196
(Memory.realloc.ret.2)
@SP // 3197
M=M-1 // 3198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3199
A=M // 3200
D=M // 3201
@SP // 3202
AM=M+1 // 3203
A=A-1 // 3204
M=D // 3205
// call Memory.deAlloc
@6 // 3206
D=A // 3207
@14 // 3208
M=D // 3209
@Memory.deAlloc // 3210
D=A // 3211
@13 // 3212
M=D // 3213
@Memory.realloc.ret.3 // 3214
D=A // 3215
@CALL // 3216
0;JMP // 3217
(Memory.realloc.ret.3)
@SP // 3218
M=M-1 // 3219

////PushInstruction("local 1")
@LCL // 3220
A=M+1 // 3221
D=M // 3222
@SP // 3223
AM=M+1 // 3224
A=A-1 // 3225
M=D // 3226
@RETURN // 3227
0;JMP // 3228

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3229
AM=M+1 // 3230
A=A-1 // 3231
M=0 // 3232

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3233
A=M // 3234
M=0 // 3235

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
@Memory.copy.LT.11 // 3236
D=A // 3237
@SP // 3238
AM=M+1 // 3239
A=A-1 // 3240
M=D // 3241
@LCL // 3242
A=M // 3243
D=M // 3244
@SP // 3245
AM=M+1 // 3246
A=A-1 // 3247
M=D // 3248
@ARG // 3249
A=M+1 // 3250
A=A+1 // 3251
D=M // 3252
@SP // 3253
AM=M-1 // 3254
D=M-D // 3255
@DO_LT // 3256
0;JMP // 3257
(Memory.copy.LT.11)
D=!D // 3258
@Memory.copy_WHILE_END1 // 3259
D;JNE // 3260

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
@ARG // 3261
A=M+1 // 3262
D=M // 3263
@SP // 3264
AM=M+1 // 3265
A=A-1 // 3266
M=D // 3267
@LCL // 3268
A=M // 3269
D=M // 3270
@SP // 3271
AM=M-1 // 3272
D=D+M // 3273
@SP // 3274
AM=M+1 // 3275
A=A-1 // 3276
M=D // 3277
@ARG // 3278
A=M // 3279
D=M // 3280
@SP // 3281
AM=M+1 // 3282
A=A-1 // 3283
M=D // 3284
@LCL // 3285
A=M // 3286
D=M // 3287
@SP // 3288
AM=M-1 // 3289
A=D+M // 3290
D=M // 3291
@SP // 3292
AM=M-1 // 3293
A=M // 3294
M=D // 3295

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

@LCL // 3296
A=M // 3297
M=M+1 // 3298

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3299
0;JMP // 3300

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3301
AM=M+1 // 3302
A=A-1 // 3303
M=0 // 3304
@RETURN // 3305
0;JMP // 3306

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
@Memory.remove_node.EQ.12 // 3307
D=A // 3308
@SP // 3309
AM=M+1 // 3310
A=A-1 // 3311
M=D // 3312
@ARG // 3313
A=M+1 // 3314
D=M // 3315
@2 // 3316
A=D+A // 3317
D=M // 3318
@DO_EQ // 3319
0;JMP // 3320
(Memory.remove_node.EQ.12)
D=!D // 3321
@Memory.remove_node$IF_TRUE1 // 3322
D;JNE // 3323

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 3324
0;JMP // 3325

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
@ARG // 3326
A=M+1 // 3327
D=M // 3328
@2 // 3329
D=D+A // 3330
@3 // 3331
D=D+A // 3332
@SP // 3333
AM=M+1 // 3334
A=A-1 // 3335
M=D // 3336
@ARG // 3337
A=M+1 // 3338
D=M // 3339
@3 // 3340
A=D+A // 3341
D=M // 3342
@SP // 3343
AM=M-1 // 3344
A=M // 3345
M=D // 3346

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 3347
0;JMP // 3348

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
@ARG // 3349
A=M // 3350
D=M // 3351
@SP // 3352
AM=M+1 // 3353
A=A-1 // 3354
M=D // 3355
@ARG // 3356
A=M+1 // 3357
D=M // 3358
@3 // 3359
A=D+A // 3360
D=M // 3361
@SP // 3362
AM=M-1 // 3363
A=M // 3364
M=D // 3365

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
@Memory.remove_node.EQ.13 // 3366
D=A // 3367
@SP // 3368
AM=M+1 // 3369
A=A-1 // 3370
M=D // 3371
@ARG // 3372
A=M+1 // 3373
D=M // 3374
@3 // 3375
A=D+A // 3376
D=M // 3377
@DO_EQ // 3378
0;JMP // 3379
(Memory.remove_node.EQ.13)
D=!D // 3380
@Memory.remove_node$IF_TRUE2 // 3381
D;JNE // 3382

////GotoInstruction{label='Memory.remove_node$IF_FALSE2}
// goto Memory.remove_node$IF_FALSE2
@Memory.remove_node$IF_FALSE2 // 3383
0;JMP // 3384

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
@ARG // 3385
A=M+1 // 3386
D=M // 3387
@3 // 3388
D=D+A // 3389
@2 // 3390
D=D+A // 3391
@SP // 3392
AM=M+1 // 3393
A=A-1 // 3394
M=D // 3395
@ARG // 3396
A=M+1 // 3397
D=M // 3398
@2 // 3399
A=D+A // 3400
D=M // 3401
@SP // 3402
AM=M-1 // 3403
A=M // 3404
M=D // 3405

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
@ARG // 3406
A=M+1 // 3407
D=M // 3408
@2 // 3409
D=D+A // 3410
@SP // 3411
AM=M+1 // 3412
A=A-1 // 3413
M=D // 3414
D=0 // 3415
@SP // 3416
AM=M-1 // 3417
A=M // 3418
M=D // 3419

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3420
A=M+1 // 3421
D=M // 3422
@3 // 3423
D=D+A // 3424
@SP // 3425
AM=M+1 // 3426
A=A-1 // 3427
M=D // 3428
D=0 // 3429
@SP // 3430
AM=M-1 // 3431
A=M // 3432
M=D // 3433

////PushInstruction("constant 0")
@SP // 3434
AM=M+1 // 3435
A=A-1 // 3436
M=0 // 3437
@RETURN // 3438
0;JMP // 3439

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3440
AM=M+1 // 3441
A=A-1 // 3442
M=0 // 3443

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3444
A=M // 3445
M=0 // 3446

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
@Memory.getBinIndex.LT.14 // 3447
D=A // 3448
@SP // 3449
AM=M+1 // 3450
A=A-1 // 3451
M=D // 3452
@LCL // 3453
A=M // 3454
D=M // 3455
@7 // 3456
D=D-A // 3457
@DO_LT // 3458
0;JMP // 3459
(Memory.getBinIndex.LT.14)
@SP // 3460
AM=M+1 // 3461
A=A-1 // 3462
M=D // 3463
@Memory.getBinIndex.EQ.15 // 3464
D=A // 3465
@SP // 3466
AM=M+1 // 3467
A=A-1 // 3468
M=D // 3469
@LCL // 3470
A=M // 3471
D=M // 3472
@2048 // 3473
A=D+A // 3474
D=M // 3475
@DO_EQ // 3476
0;JMP // 3477
(Memory.getBinIndex.EQ.15)
D=!D // 3478
@SP // 3479
AM=M-1 // 3480
D=D&M // 3481
D=!D // 3482
@Memory.getBinIndex_WHILE_END1 // 3483
D;JNE // 3484

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
@Memory.getBinIndex.GT.16 // 3485
D=A // 3486
@SP // 3487
AM=M+1 // 3488
A=A-1 // 3489
M=D // 3490
@ARG // 3491
A=M // 3492
D=M // 3493
@SP // 3494
AM=M+1 // 3495
A=A-1 // 3496
M=D // 3497
@LCL // 3498
A=M // 3499
D=M // 3500
@SP // 3501
AM=M+1 // 3502
A=A-1 // 3503
M=D+1 // 3504
@16 // 3505
D=A // 3506
@SP // 3507
AM=M+1 // 3508
A=A-1 // 3509
M=D // 3510
// call Math.multiply
@7 // 3511
D=A // 3512
@14 // 3513
M=D // 3514
@Math.multiply // 3515
D=A // 3516
@13 // 3517
M=D // 3518
@Memory.getBinIndex.ret.0 // 3519
D=A // 3520
@CALL // 3521
0;JMP // 3522
(Memory.getBinIndex.ret.0)
@SP // 3523
AM=M-1 // 3524
D=M // 3525
@SP // 3526
AM=M-1 // 3527
D=M-D // 3528
@DO_GT // 3529
0;JMP // 3530
(Memory.getBinIndex.GT.16)
D=!D // 3531
@Memory.getBinIndex$IF_TRUE1 // 3532
D;JNE // 3533

////GotoInstruction{label='Memory.getBinIndex$IF_FALSE1}
// goto Memory.getBinIndex$IF_FALSE1
@Memory.getBinIndex$IF_FALSE1 // 3534
0;JMP // 3535

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 3536
A=M // 3537
D=M // 3538
@SP // 3539
AM=M+1 // 3540
A=A-1 // 3541
M=D // 3542
@RETURN // 3543
0;JMP // 3544

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

@LCL // 3545
A=M // 3546
M=M+1 // 3547

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 3548
0;JMP // 3549

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
@6 // 3550
D=A // 3551
@SP // 3552
AM=M+1 // 3553
A=A-1 // 3554
M=D // 3555
@7 // 3556
D=A // 3557
@SP // 3558
AM=M+1 // 3559
A=A-1 // 3560
M=D-1 // 3561
@RETURN // 3562
0;JMP // 3563

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3564
AM=M+1 // 3565
A=A-1 // 3566
M=0 // 3567

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

@ARG // 3568
A=M // 3569
D=M // 3570
@0 // 3571
A=D+A // 3572
D=M // 3573
@LCL // 3574
A=M // 3575
M=D // 3576

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
@Memory.get_best_fit.LT.17 // 3577
D=A // 3578
@SP // 3579
AM=M+1 // 3580
A=A-1 // 3581
M=D // 3582
@LCL // 3583
A=M // 3584
D=M // 3585
@0 // 3586
A=D+A // 3587
D=M // 3588
@SP // 3589
AM=M+1 // 3590
A=A-1 // 3591
M=D // 3592
@ARG // 3593
A=M+1 // 3594
D=M // 3595
@SP // 3596
AM=M-1 // 3597
D=M-D // 3598
@DO_LT // 3599
0;JMP // 3600
(Memory.get_best_fit.LT.17)
D=!D // 3601
@Memory.get_best_fit$IF_TRUE1 // 3602
D;JNE // 3603

////GotoInstruction{label='Memory.get_best_fit$IF_FALSE1}
// goto Memory.get_best_fit$IF_FALSE1
@Memory.get_best_fit$IF_FALSE1 // 3604
0;JMP // 3605

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 3606
A=M // 3607
D=M // 3608
@SP // 3609
AM=M+1 // 3610
A=A-1 // 3611
M=D // 3612
@RETURN // 3613
0;JMP // 3614

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
@Memory.get_best_fit.EQ.18 // 3615
D=A // 3616
@SP // 3617
AM=M+1 // 3618
A=A-1 // 3619
M=D // 3620
@LCL // 3621
A=M // 3622
D=M // 3623
@3 // 3624
A=D+A // 3625
D=M // 3626
@DO_EQ // 3627
0;JMP // 3628
(Memory.get_best_fit.EQ.18)
@Memory.get_best_fit_WHILE_END1 // 3629
D;JNE // 3630

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

@LCL // 3631
A=M // 3632
D=M // 3633
@3 // 3634
A=D+A // 3635
D=M // 3636
@LCL // 3637
A=M // 3638
M=D // 3639

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
@Memory.get_best_fit.LT.19 // 3640
D=A // 3641
@SP // 3642
AM=M+1 // 3643
A=A-1 // 3644
M=D // 3645
@LCL // 3646
A=M // 3647
D=M // 3648
@0 // 3649
A=D+A // 3650
D=M // 3651
@SP // 3652
AM=M+1 // 3653
A=A-1 // 3654
M=D // 3655
@ARG // 3656
A=M+1 // 3657
D=M // 3658
@SP // 3659
AM=M-1 // 3660
D=M-D // 3661
@DO_LT // 3662
0;JMP // 3663
(Memory.get_best_fit.LT.19)
D=!D // 3664
@Memory.get_best_fit$IF_TRUE2 // 3665
D;JNE // 3666

////GotoInstruction{label='Memory.get_best_fit$IF_FALSE2}
// goto Memory.get_best_fit$IF_FALSE2
@Memory.get_best_fit$IF_FALSE2 // 3667
0;JMP // 3668

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 3669
A=M // 3670
D=M // 3671
@SP // 3672
AM=M+1 // 3673
A=A-1 // 3674
M=D // 3675
@RETURN // 3676
0;JMP // 3677

////LabelInstruction{label='Memory.get_best_fit$IF_FALSE2}
// label Memory.get_best_fit$IF_FALSE2
(Memory.get_best_fit$IF_FALSE2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 3678
0;JMP // 3679

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3680
AM=M+1 // 3681
A=A-1 // 3682
M=0 // 3683
@RETURN // 3684
0;JMP // 3685

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
@ARG // 3686
A=M // 3687
D=M // 3688
@SP // 3689
AM=M+1 // 3690
A=A-1 // 3691
M=D // 3692
@ARG // 3693
A=M // 3694
D=M // 3695
@0 // 3696
A=D+A // 3697
D=M // 3698
@4 // 3699
D=D+A // 3700
@SP // 3701
AM=M-1 // 3702
D=D+M // 3703
@SP // 3704
AM=M+1 // 3705
A=A-1 // 3706
M=D // 3707
@ARG // 3708
A=M // 3709
D=M // 3710
@SP // 3711
AM=M-1 // 3712
A=M // 3713
M=D // 3714

////PushInstruction("constant 0")
@SP // 3715
AM=M+1 // 3716
A=A-1 // 3717
M=0 // 3718
@RETURN // 3719
0;JMP // 3720

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3721
M=M+1 // 3722
AM=M+1 // 3723
A=A-1 // 3724
M=0 // 3725
A=A-1 // 3726
M=0 // 3727

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3728
A=M+1 // 3729
D=M // 3730
@2 // 3731
D=D+A // 3732
@SP // 3733
AM=M+1 // 3734
A=A-1 // 3735
M=D // 3736
D=0 // 3737
@SP // 3738
AM=M-1 // 3739
A=M // 3740
M=D // 3741

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3742
A=M+1 // 3743
D=M // 3744
@3 // 3745
D=D+A // 3746
@SP // 3747
AM=M+1 // 3748
A=A-1 // 3749
M=D // 3750
D=0 // 3751
@SP // 3752
AM=M-1 // 3753
A=M // 3754
M=D // 3755

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
@Memory.add_node.EQ.20 // 3756
D=A // 3757
@SP // 3758
AM=M+1 // 3759
A=A-1 // 3760
M=D // 3761
@ARG // 3762
A=M // 3763
D=M // 3764
@0 // 3765
A=D+A // 3766
D=M // 3767
@DO_EQ // 3768
0;JMP // 3769
(Memory.add_node.EQ.20)
@Memory.add_node$IF_TRUE1 // 3770
D;JNE // 3771

////GotoInstruction{label='Memory.add_node$IF_FALSE1}
// goto Memory.add_node$IF_FALSE1
@Memory.add_node$IF_FALSE1 // 3772
0;JMP // 3773

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
@ARG // 3774
A=M // 3775
D=M // 3776
@SP // 3777
AM=M+1 // 3778
A=A-1 // 3779
M=D // 3780
@ARG // 3781
A=M+1 // 3782
D=M // 3783
@SP // 3784
AM=M-1 // 3785
A=M // 3786
M=D // 3787

////PushInstruction("constant 0")
@SP // 3788
AM=M+1 // 3789
A=A-1 // 3790
M=0 // 3791
@RETURN // 3792
0;JMP // 3793

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

@ARG // 3794
A=M // 3795
D=M // 3796
@0 // 3797
A=D+A // 3798
D=M // 3799
@LCL // 3800
A=M // 3801
M=D // 3802

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3803
A=M+1 // 3804
M=0 // 3805

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
@Memory.add_node.EQ.21 // 3806
D=A // 3807
@SP // 3808
AM=M+1 // 3809
A=A-1 // 3810
M=D // 3811
@LCL // 3812
A=M // 3813
D=M // 3814
@DO_EQ // 3815
0;JMP // 3816
(Memory.add_node.EQ.21)
@SP // 3817
AM=M+1 // 3818
A=A-1 // 3819
M=D // 3820
@SP // 3821
A=M-1 // 3822
M=!D // 3823
@Memory.add_node.GT.22 // 3824
D=A // 3825
@SP // 3826
AM=M+1 // 3827
A=A-1 // 3828
M=D // 3829
@LCL // 3830
A=M // 3831
D=M // 3832
@0 // 3833
A=D+A // 3834
D=M // 3835
@SP // 3836
AM=M+1 // 3837
A=A-1 // 3838
M=D // 3839
@ARG // 3840
A=M+1 // 3841
D=M // 3842
@0 // 3843
A=D+A // 3844
D=M // 3845
@SP // 3846
AM=M-1 // 3847
D=M-D // 3848
@DO_GT // 3849
0;JMP // 3850
(Memory.add_node.GT.22)
D=!D // 3851
@SP // 3852
AM=M-1 // 3853
D=D&M // 3854
D=!D // 3855
@Memory.add_node_WHILE_END1 // 3856
D;JNE // 3857

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3858
A=M // 3859
D=M // 3860
@LCL // 3861
A=M+1 // 3862
M=D // 3863

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

@LCL // 3864
A=M // 3865
D=M // 3866
@3 // 3867
A=D+A // 3868
D=M // 3869
@LCL // 3870
A=M // 3871
M=D // 3872

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 3873
0;JMP // 3874

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 3875
A=M+1 // 3876
D=!M // 3877
@Memory.add_node$IF_TRUE2 // 3878
D;JNE // 3879

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 3880
0;JMP // 3881

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
@ARG // 3882
A=M+1 // 3883
D=M // 3884
@3 // 3885
D=D+A // 3886
@SP // 3887
AM=M+1 // 3888
A=A-1 // 3889
M=D // 3890
@ARG // 3891
A=M // 3892
D=M // 3893
@0 // 3894
A=D+A // 3895
D=M // 3896
@SP // 3897
AM=M-1 // 3898
A=M // 3899
M=D // 3900

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
@ARG // 3901
A=M // 3902
D=M // 3903
@0 // 3904
D=D+A // 3905
@2 // 3906
D=D+A // 3907
@SP // 3908
AM=M+1 // 3909
A=A-1 // 3910
M=D // 3911
@ARG // 3912
A=M+1 // 3913
D=M // 3914
@SP // 3915
AM=M-1 // 3916
A=M // 3917
M=D // 3918

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3919
A=M // 3920
D=M // 3921
@SP // 3922
AM=M+1 // 3923
A=A-1 // 3924
M=D // 3925
@ARG // 3926
A=M+1 // 3927
D=M // 3928
@SP // 3929
AM=M-1 // 3930
A=M // 3931
M=D // 3932

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 3933
0;JMP // 3934

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
@ARG // 3935
A=M+1 // 3936
D=M // 3937
@3 // 3938
D=D+A // 3939
@SP // 3940
AM=M+1 // 3941
A=A-1 // 3942
M=D // 3943
@LCL // 3944
A=M // 3945
D=M // 3946
@SP // 3947
AM=M-1 // 3948
A=M // 3949
M=D // 3950

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3951
A=M+1 // 3952
D=M // 3953
@2 // 3954
D=D+A // 3955
@SP // 3956
AM=M+1 // 3957
A=A-1 // 3958
M=D // 3959
@LCL // 3960
A=M+1 // 3961
D=M // 3962
@SP // 3963
AM=M-1 // 3964
A=M // 3965
M=D // 3966

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 3967
A=M // 3968
D=M // 3969
@Memory.add_node$IF_TRUE3 // 3970
D;JNE // 3971

////GotoInstruction{label='Memory.add_node$IF_FALSE3}
// goto Memory.add_node$IF_FALSE3
@Memory.add_node$IF_FALSE3 // 3972
0;JMP // 3973

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
@LCL // 3974
A=M // 3975
D=M // 3976
@2 // 3977
D=D+A // 3978
@SP // 3979
AM=M+1 // 3980
A=A-1 // 3981
M=D // 3982
@ARG // 3983
A=M+1 // 3984
D=M // 3985
@SP // 3986
AM=M-1 // 3987
A=M // 3988
M=D // 3989

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
@LCL // 3990
A=M+1 // 3991
D=M // 3992
@3 // 3993
D=D+A // 3994
@SP // 3995
AM=M+1 // 3996
A=A-1 // 3997
M=D // 3998
@ARG // 3999
A=M+1 // 4000
D=M // 4001
@SP // 4002
AM=M-1 // 4003
A=M // 4004
M=D // 4005

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 4006
AM=M+1 // 4007
A=A-1 // 4008
M=0 // 4009
@RETURN // 4010
0;JMP // 4011

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
@ARG // 4012
A=M // 4013
D=M // 4014
@SP // 4015
AM=M+1 // 4016
A=A-1 // 4017
M=D // 4018
@ARG // 4019
A=M+1 // 4020
D=M // 4021
@SP // 4022
AM=M-1 // 4023
A=M // 4024
M=D // 4025

////PushInstruction("constant 0")
@SP // 4026
AM=M+1 // 4027
A=A-1 // 4028
M=0 // 4029
@RETURN // 4030
0;JMP // 4031

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
@ARG // 4032
A=M // 4033
D=M // 4034
@0 // 4035
A=D+A // 4036
D=M // 4037
@SP // 4038
AM=M+1 // 4039
A=A-1 // 4040
M=D // 4041
@RETURN // 4042
0;JMP // 4043

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={}}
// function Output.init with 1
(Output.init)
@SP // 4044
AM=M+1 // 4045
A=A-1 // 4046
M=0 // 4047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4048
D=A // 4049
@SP // 4050
AM=M+1 // 4051
A=A-1 // 4052
M=D // 4053
// call Array.new
@6 // 4054
D=A // 4055
@14 // 4056
M=D // 4057
@Array.new // 4058
D=A // 4059
@13 // 4060
M=D // 4061
@Output.init.ret.0 // 4062
D=A // 4063
@CALL // 4064
0;JMP // 4065
(Output.init.ret.0)
@SP // 4066
AM=M-1 // 4067
D=M // 4068
@Output.0 // 4069
M=D // 4070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4071
D=A // 4072
@SP // 4073
M=D+M // 4074
@63 // 4075
D=A // 4076
@SP // 4077
A=M-1 // 4078
M=0 // 4079
A=A-1 // 4080
M=0 // 4081
A=A-1 // 4082
M=D // 4083
A=A-1 // 4084
M=D // 4085
A=A-1 // 4086
M=D // 4087
A=A-1 // 4088
M=D // 4089
A=A-1 // 4090
M=D // 4091
A=A-1 // 4092
M=D // 4093
A=A-1 // 4094
M=D // 4095
A=A-1 // 4096
M=D // 4097
A=A-1 // 4098
M=D // 4099
A=A-1 // 4100
M=0 // 4101
// call Output.create
@17 // 4102
D=A // 4103
@14 // 4104
M=D // 4105
@Output.create // 4106
D=A // 4107
@13 // 4108
M=D // 4109
@Output.init.ret.1 // 4110
D=A // 4111
@CALL // 4112
0;JMP // 4113
(Output.init.ret.1)
@SP // 4114
M=M-1 // 4115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4116
D=A // 4117
@SP // 4118
M=D+M // 4119
@32 // 4120
D=A // 4121
@SP // 4122
A=M-1 // 4123
M=0 // 4124
A=A-1 // 4125
M=0 // 4126
A=A-1 // 4127
M=0 // 4128
A=A-1 // 4129
M=0 // 4130
A=A-1 // 4131
M=0 // 4132
A=A-1 // 4133
M=0 // 4134
A=A-1 // 4135
M=0 // 4136
A=A-1 // 4137
M=0 // 4138
A=A-1 // 4139
M=0 // 4140
A=A-1 // 4141
M=0 // 4142
A=A-1 // 4143
M=0 // 4144
A=A-1 // 4145
M=D // 4146
A=A-1 // 4147
// call Output.create
@17 // 4148
D=A // 4149
@14 // 4150
M=D // 4151
@Output.create // 4152
D=A // 4153
@13 // 4154
M=D // 4155
@Output.init.ret.2 // 4156
D=A // 4157
@CALL // 4158
0;JMP // 4159
(Output.init.ret.2)
@SP // 4160
M=M-1 // 4161

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4162
D=A // 4163
@SP // 4164
AM=M+1 // 4165
A=A-1 // 4166
M=D // 4167
@12 // 4168
D=A // 4169
@SP // 4170
AM=M+1 // 4171
A=A-1 // 4172
M=D // 4173
@30 // 4174
D=A // 4175
@SP // 4176
AM=M+1 // 4177
A=A-1 // 4178
M=D // 4179
@30 // 4180
D=A // 4181
@SP // 4182
AM=M+1 // 4183
A=A-1 // 4184
M=D // 4185
@30 // 4186
D=A // 4187
@SP // 4188
AM=M+1 // 4189
A=A-1 // 4190
M=D // 4191
@12 // 4192
D=A // 4193
@SP // 4194
AM=M+1 // 4195
A=A-1 // 4196
M=D // 4197
@12 // 4198
D=A // 4199
@SP // 4200
AM=M+1 // 4201
A=A-1 // 4202
M=D // 4203
@SP // 4204
AM=M+1 // 4205
A=A-1 // 4206
M=0 // 4207
@4 // 4208
D=A // 4209
@SP // 4210
M=D+M // 4211
@12 // 4212
D=A // 4213
@SP // 4214
A=M-1 // 4215
M=0 // 4216
A=A-1 // 4217
M=0 // 4218
A=A-1 // 4219
M=D // 4220
A=A-1 // 4221
M=D // 4222
A=A-1 // 4223
// call Output.create
@17 // 4224
D=A // 4225
@14 // 4226
M=D // 4227
@Output.create // 4228
D=A // 4229
@13 // 4230
M=D // 4231
@Output.init.ret.3 // 4232
D=A // 4233
@CALL // 4234
0;JMP // 4235
(Output.init.ret.3)
@SP // 4236
M=M-1 // 4237

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4238
D=A // 4239
@SP // 4240
AM=M+1 // 4241
A=A-1 // 4242
M=D // 4243
@54 // 4244
D=A // 4245
@SP // 4246
AM=M+1 // 4247
A=A-1 // 4248
M=D // 4249
@54 // 4250
D=A // 4251
@SP // 4252
AM=M+1 // 4253
A=A-1 // 4254
M=D // 4255
@20 // 4256
D=A // 4257
@SP // 4258
AM=M+1 // 4259
A=A-1 // 4260
M=D // 4261
@SP // 4262
AM=M+1 // 4263
A=A-1 // 4264
M=0 // 4265
@SP // 4266
AM=M+1 // 4267
A=A-1 // 4268
M=0 // 4269
@SP // 4270
AM=M+1 // 4271
A=A-1 // 4272
M=0 // 4273
@SP // 4274
AM=M+1 // 4275
A=A-1 // 4276
M=0 // 4277
@SP // 4278
AM=M+1 // 4279
A=A-1 // 4280
M=0 // 4281
@SP // 4282
AM=M+1 // 4283
A=A-1 // 4284
M=0 // 4285
@SP // 4286
AM=M+1 // 4287
A=A-1 // 4288
M=0 // 4289
@SP // 4290
AM=M+1 // 4291
A=A-1 // 4292
M=0 // 4293
// call Output.create
@17 // 4294
D=A // 4295
@14 // 4296
M=D // 4297
@Output.create // 4298
D=A // 4299
@13 // 4300
M=D // 4301
@Output.init.ret.4 // 4302
D=A // 4303
@CALL // 4304
0;JMP // 4305
(Output.init.ret.4)
@SP // 4306
M=M-1 // 4307

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4308
D=A // 4309
@SP // 4310
M=D+M // 4311
@35 // 4312
D=A // 4313
@SP // 4314
A=M-1 // 4315
M=0 // 4316
A=A-1 // 4317
M=D // 4318
A=A-1 // 4319
@18 // 4320
D=A // 4321
@SP // 4322
AM=M+1 // 4323
A=A-1 // 4324
M=D // 4325
@18 // 4326
D=A // 4327
@SP // 4328
AM=M+1 // 4329
A=A-1 // 4330
M=D // 4331
@63 // 4332
D=A // 4333
@SP // 4334
AM=M+1 // 4335
A=A-1 // 4336
M=D // 4337
@18 // 4338
D=A // 4339
@SP // 4340
AM=M+1 // 4341
A=A-1 // 4342
M=D // 4343
@18 // 4344
D=A // 4345
@SP // 4346
AM=M+1 // 4347
A=A-1 // 4348
M=D // 4349
@63 // 4350
D=A // 4351
@SP // 4352
AM=M+1 // 4353
A=A-1 // 4354
M=D // 4355
@18 // 4356
D=A // 4357
@SP // 4358
AM=M+1 // 4359
A=A-1 // 4360
M=D // 4361
@18 // 4362
D=A // 4363
@SP // 4364
AM=M+1 // 4365
A=A-1 // 4366
M=D // 4367
@SP // 4368
AM=M+1 // 4369
A=A-1 // 4370
M=0 // 4371
@SP // 4372
AM=M+1 // 4373
A=A-1 // 4374
M=0 // 4375
// call Output.create
@17 // 4376
D=A // 4377
@14 // 4378
M=D // 4379
@Output.create // 4380
D=A // 4381
@13 // 4382
M=D // 4383
@Output.init.ret.5 // 4384
D=A // 4385
@CALL // 4386
0;JMP // 4387
(Output.init.ret.5)
@SP // 4388
M=M-1 // 4389

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4390
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
@30 // 4402
D=A // 4403
@SP // 4404
AM=M+1 // 4405
A=A-1 // 4406
M=D // 4407
@51 // 4408
D=A // 4409
@SP // 4410
AM=M+1 // 4411
A=A-1 // 4412
M=D // 4413
@3 // 4414
D=A // 4415
@SP // 4416
AM=M+1 // 4417
A=A-1 // 4418
M=D // 4419
@30 // 4420
D=A // 4421
@SP // 4422
AM=M+1 // 4423
A=A-1 // 4424
M=D // 4425
@48 // 4426
D=A // 4427
@SP // 4428
AM=M+1 // 4429
A=A-1 // 4430
M=D // 4431
@51 // 4432
D=A // 4433
@SP // 4434
AM=M+1 // 4435
A=A-1 // 4436
M=D // 4437
@30 // 4438
D=A // 4439
@SP // 4440
AM=M+1 // 4441
A=A-1 // 4442
M=D // 4443
@12 // 4444
D=A // 4445
@SP // 4446
AM=M+1 // 4447
A=A-1 // 4448
M=D // 4449
@12 // 4450
D=A // 4451
@SP // 4452
AM=M+1 // 4453
A=A-1 // 4454
M=D // 4455
@SP // 4456
AM=M+1 // 4457
A=A-1 // 4458
M=0 // 4459
// call Output.create
@17 // 4460
D=A // 4461
@14 // 4462
M=D // 4463
@Output.create // 4464
D=A // 4465
@13 // 4466
M=D // 4467
@Output.init.ret.6 // 4468
D=A // 4469
@CALL // 4470
0;JMP // 4471
(Output.init.ret.6)
@SP // 4472
M=M-1 // 4473

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4474
D=A // 4475
@SP // 4476
M=D+M // 4477
@37 // 4478
D=A // 4479
@SP // 4480
A=M-1 // 4481
M=0 // 4482
A=A-1 // 4483
M=0 // 4484
A=A-1 // 4485
M=D // 4486
A=A-1 // 4487
@35 // 4488
D=A // 4489
@SP // 4490
AM=M+1 // 4491
A=A-1 // 4492
M=D // 4493
@51 // 4494
D=A // 4495
@SP // 4496
AM=M+1 // 4497
A=A-1 // 4498
M=D // 4499
@24 // 4500
D=A // 4501
@SP // 4502
AM=M+1 // 4503
A=A-1 // 4504
M=D // 4505
@12 // 4506
D=A // 4507
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=D // 4511
@6 // 4512
D=A // 4513
@SP // 4514
AM=M+1 // 4515
A=A-1 // 4516
M=D // 4517
@51 // 4518
D=A // 4519
@SP // 4520
AM=M+1 // 4521
A=A-1 // 4522
M=D // 4523
@49 // 4524
D=A // 4525
@SP // 4526
AM=M+1 // 4527
A=A-1 // 4528
M=D // 4529
@SP // 4530
AM=M+1 // 4531
A=A-1 // 4532
M=0 // 4533
@SP // 4534
AM=M+1 // 4535
A=A-1 // 4536
M=0 // 4537
// call Output.create
@17 // 4538
D=A // 4539
@14 // 4540
M=D // 4541
@Output.create // 4542
D=A // 4543
@13 // 4544
M=D // 4545
@Output.init.ret.7 // 4546
D=A // 4547
@CALL // 4548
0;JMP // 4549
(Output.init.ret.7)
@SP // 4550
M=M-1 // 4551

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4552
D=A // 4553
@SP // 4554
AM=M+1 // 4555
A=A-1 // 4556
M=D // 4557
@12 // 4558
D=A // 4559
@SP // 4560
AM=M+1 // 4561
A=A-1 // 4562
M=D // 4563
@30 // 4564
D=A // 4565
@SP // 4566
AM=M+1 // 4567
A=A-1 // 4568
M=D // 4569
@30 // 4570
D=A // 4571
@SP // 4572
AM=M+1 // 4573
A=A-1 // 4574
M=D // 4575
@12 // 4576
D=A // 4577
@SP // 4578
AM=M+1 // 4579
A=A-1 // 4580
M=D // 4581
@54 // 4582
D=A // 4583
@SP // 4584
AM=M+1 // 4585
A=A-1 // 4586
M=D // 4587
@27 // 4588
D=A // 4589
@SP // 4590
AM=M+1 // 4591
A=A-1 // 4592
M=D // 4593
@27 // 4594
D=A // 4595
@SP // 4596
AM=M+1 // 4597
A=A-1 // 4598
M=D // 4599
@27 // 4600
D=A // 4601
@SP // 4602
AM=M+1 // 4603
A=A-1 // 4604
M=D // 4605
@54 // 4606
D=A // 4607
@SP // 4608
AM=M+1 // 4609
A=A-1 // 4610
M=D // 4611
@SP // 4612
AM=M+1 // 4613
A=A-1 // 4614
M=0 // 4615
@SP // 4616
AM=M+1 // 4617
A=A-1 // 4618
M=0 // 4619
// call Output.create
@17 // 4620
D=A // 4621
@14 // 4622
M=D // 4623
@Output.create // 4624
D=A // 4625
@13 // 4626
M=D // 4627
@Output.init.ret.8 // 4628
D=A // 4629
@CALL // 4630
0;JMP // 4631
(Output.init.ret.8)
@SP // 4632
M=M-1 // 4633

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4634
D=A // 4635
@SP // 4636
AM=M+1 // 4637
A=A-1 // 4638
M=D // 4639
@12 // 4640
D=A // 4641
@SP // 4642
AM=M+1 // 4643
A=A-1 // 4644
M=D // 4645
@12 // 4646
D=A // 4647
@SP // 4648
AM=M+1 // 4649
A=A-1 // 4650
M=D // 4651
@6 // 4652
D=A // 4653
@SP // 4654
AM=M+1 // 4655
A=A-1 // 4656
M=D // 4657
@SP // 4658
AM=M+1 // 4659
A=A-1 // 4660
M=0 // 4661
@SP // 4662
AM=M+1 // 4663
A=A-1 // 4664
M=0 // 4665
@SP // 4666
AM=M+1 // 4667
A=A-1 // 4668
M=0 // 4669
@SP // 4670
AM=M+1 // 4671
A=A-1 // 4672
M=0 // 4673
@SP // 4674
AM=M+1 // 4675
A=A-1 // 4676
M=0 // 4677
@SP // 4678
AM=M+1 // 4679
A=A-1 // 4680
M=0 // 4681
@SP // 4682
AM=M+1 // 4683
A=A-1 // 4684
M=0 // 4685
@SP // 4686
AM=M+1 // 4687
A=A-1 // 4688
M=0 // 4689
// call Output.create
@17 // 4690
D=A // 4691
@14 // 4692
M=D // 4693
@Output.create // 4694
D=A // 4695
@13 // 4696
M=D // 4697
@Output.init.ret.9 // 4698
D=A // 4699
@CALL // 4700
0;JMP // 4701
(Output.init.ret.9)
@SP // 4702
M=M-1 // 4703

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4704
D=A // 4705
@SP // 4706
AM=M+1 // 4707
A=A-1 // 4708
M=D // 4709
@24 // 4710
D=A // 4711
@SP // 4712
AM=M+1 // 4713
A=A-1 // 4714
M=D // 4715
@12 // 4716
D=A // 4717
@SP // 4718
AM=M+1 // 4719
A=A-1 // 4720
M=D // 4721
@6 // 4722
D=A // 4723
@SP // 4724
AM=M+1 // 4725
A=A-1 // 4726
M=D // 4727
@6 // 4728
D=A // 4729
@SP // 4730
AM=M+1 // 4731
A=A-1 // 4732
M=D // 4733
@6 // 4734
D=A // 4735
@SP // 4736
AM=M+1 // 4737
A=A-1 // 4738
M=D // 4739
@6 // 4740
D=A // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=D // 4745
@6 // 4746
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
@24 // 4758
D=A // 4759
@SP // 4760
AM=M+1 // 4761
A=A-1 // 4762
M=D // 4763
@SP // 4764
AM=M+1 // 4765
A=A-1 // 4766
M=0 // 4767
@SP // 4768
AM=M+1 // 4769
A=A-1 // 4770
M=0 // 4771
// call Output.create
@17 // 4772
D=A // 4773
@14 // 4774
M=D // 4775
@Output.create // 4776
D=A // 4777
@13 // 4778
M=D // 4779
@Output.init.ret.10 // 4780
D=A // 4781
@CALL // 4782
0;JMP // 4783
(Output.init.ret.10)
@SP // 4784
M=M-1 // 4785

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4786
D=A // 4787
@SP // 4788
AM=M+1 // 4789
A=A-1 // 4790
M=D // 4791
@6 // 4792
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
@24 // 4804
D=A // 4805
@SP // 4806
AM=M+1 // 4807
A=A-1 // 4808
M=D // 4809
@24 // 4810
D=A // 4811
@SP // 4812
AM=M+1 // 4813
A=A-1 // 4814
M=D // 4815
@24 // 4816
D=A // 4817
@SP // 4818
AM=M+1 // 4819
A=A-1 // 4820
M=D // 4821
@24 // 4822
D=A // 4823
@SP // 4824
AM=M+1 // 4825
A=A-1 // 4826
M=D // 4827
@24 // 4828
D=A // 4829
@SP // 4830
AM=M+1 // 4831
A=A-1 // 4832
M=D // 4833
@12 // 4834
D=A // 4835
@SP // 4836
AM=M+1 // 4837
A=A-1 // 4838
M=D // 4839
@6 // 4840
D=A // 4841
@SP // 4842
AM=M+1 // 4843
A=A-1 // 4844
M=D // 4845
@SP // 4846
AM=M+1 // 4847
A=A-1 // 4848
M=0 // 4849
@SP // 4850
AM=M+1 // 4851
A=A-1 // 4852
M=0 // 4853
// call Output.create
@17 // 4854
D=A // 4855
@14 // 4856
M=D // 4857
@Output.create // 4858
D=A // 4859
@13 // 4860
M=D // 4861
@Output.init.ret.11 // 4862
D=A // 4863
@CALL // 4864
0;JMP // 4865
(Output.init.ret.11)
@SP // 4866
M=M-1 // 4867

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4868
D=A // 4869
@SP // 4870
M=D+M // 4871
@42 // 4872
D=A // 4873
@SP // 4874
A=M-1 // 4875
M=0 // 4876
A=A-1 // 4877
M=0 // 4878
A=A-1 // 4879
M=0 // 4880
A=A-1 // 4881
M=D // 4882
A=A-1 // 4883
@51 // 4884
D=A // 4885
@SP // 4886
AM=M+1 // 4887
A=A-1 // 4888
M=D // 4889
@30 // 4890
D=A // 4891
@SP // 4892
AM=M+1 // 4893
A=A-1 // 4894
M=D // 4895
@63 // 4896
D=A // 4897
@SP // 4898
AM=M+1 // 4899
A=A-1 // 4900
M=D // 4901
@30 // 4902
D=A // 4903
@SP // 4904
AM=M+1 // 4905
A=A-1 // 4906
M=D // 4907
@51 // 4908
D=A // 4909
@SP // 4910
AM=M+1 // 4911
A=A-1 // 4912
M=D // 4913
@SP // 4914
AM=M+1 // 4915
A=A-1 // 4916
M=0 // 4917
@SP // 4918
AM=M+1 // 4919
A=A-1 // 4920
M=0 // 4921
@SP // 4922
AM=M+1 // 4923
A=A-1 // 4924
M=0 // 4925
// call Output.create
@17 // 4926
D=A // 4927
@14 // 4928
M=D // 4929
@Output.create // 4930
D=A // 4931
@13 // 4932
M=D // 4933
@Output.init.ret.12 // 4934
D=A // 4935
@CALL // 4936
0;JMP // 4937
(Output.init.ret.12)
@SP // 4938
M=M-1 // 4939

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 4940
D=A // 4941
@SP // 4942
M=D+M // 4943
@43 // 4944
D=A // 4945
@SP // 4946
A=M-1 // 4947
M=0 // 4948
A=A-1 // 4949
M=0 // 4950
A=A-1 // 4951
M=0 // 4952
A=A-1 // 4953
M=D // 4954
A=A-1 // 4955
@12 // 4956
D=A // 4957
@SP // 4958
AM=M+1 // 4959
A=A-1 // 4960
M=D // 4961
@12 // 4962
D=A // 4963
@SP // 4964
AM=M+1 // 4965
A=A-1 // 4966
M=D // 4967
@63 // 4968
D=A // 4969
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=D // 4973
@12 // 4974
D=A // 4975
@SP // 4976
AM=M+1 // 4977
A=A-1 // 4978
M=D // 4979
@12 // 4980
D=A // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=D // 4985
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
@Output.init.ret.13 // 5006
D=A // 5007
@CALL // 5008
0;JMP // 5009
(Output.init.ret.13)
@SP // 5010
M=M-1 // 5011

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5012
D=A // 5013
@SP // 5014
M=D+M // 5015
@44 // 5016
D=A // 5017
@SP // 5018
A=M-1 // 5019
M=0 // 5020
A=A-1 // 5021
M=0 // 5022
A=A-1 // 5023
M=0 // 5024
A=A-1 // 5025
M=0 // 5026
A=A-1 // 5027
M=0 // 5028
A=A-1 // 5029
M=0 // 5030
A=A-1 // 5031
M=0 // 5032
A=A-1 // 5033
M=D // 5034
A=A-1 // 5035
@12 // 5036
D=A // 5037
@SP // 5038
AM=M+1 // 5039
A=A-1 // 5040
M=D // 5041
@12 // 5042
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
@SP // 5054
AM=M+1 // 5055
A=A-1 // 5056
M=0 // 5057
// call Output.create
@17 // 5058
D=A // 5059
@14 // 5060
M=D // 5061
@Output.create // 5062
D=A // 5063
@13 // 5064
M=D // 5065
@Output.init.ret.14 // 5066
D=A // 5067
@CALL // 5068
0;JMP // 5069
(Output.init.ret.14)
@SP // 5070
M=M-1 // 5071

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5072
D=A // 5073
@SP // 5074
M=D+M // 5075
@45 // 5076
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
M=D // 5090
A=A-1 // 5091
@6 // 5092
D=A // 5093
@SP // 5094
M=D+M // 5095
@63 // 5096
D=A // 5097
@SP // 5098
A=M-1 // 5099
M=0 // 5100
A=A-1 // 5101
M=0 // 5102
A=A-1 // 5103
M=0 // 5104
A=A-1 // 5105
M=0 // 5106
A=A-1 // 5107
M=0 // 5108
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
@Output.init.ret.15 // 5120
D=A // 5121
@CALL // 5122
0;JMP // 5123
(Output.init.ret.15)
@SP // 5124
M=M-1 // 5125

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5126
D=A // 5127
@SP // 5128
M=D+M // 5129
@46 // 5130
D=A // 5131
@SP // 5132
A=M-1 // 5133
M=0 // 5134
A=A-1 // 5135
M=0 // 5136
A=A-1 // 5137
M=0 // 5138
A=A-1 // 5139
M=0 // 5140
A=A-1 // 5141
M=0 // 5142
A=A-1 // 5143
M=0 // 5144
A=A-1 // 5145
M=0 // 5146
A=A-1 // 5147
M=D // 5148
A=A-1 // 5149
@4 // 5150
D=A // 5151
@SP // 5152
M=D+M // 5153
@12 // 5154
D=A // 5155
@SP // 5156
A=M-1 // 5157
M=0 // 5158
A=A-1 // 5159
M=0 // 5160
A=A-1 // 5161
M=D // 5162
A=A-1 // 5163
M=D // 5164
A=A-1 // 5165
// call Output.create
@17 // 5166
D=A // 5167
@14 // 5168
M=D // 5169
@Output.create // 5170
D=A // 5171
@13 // 5172
M=D // 5173
@Output.init.ret.16 // 5174
D=A // 5175
@CALL // 5176
0;JMP // 5177
(Output.init.ret.16)
@SP // 5178
M=M-1 // 5179

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5180
D=A // 5181
@SP // 5182
M=D+M // 5183
@47 // 5184
D=A // 5185
@SP // 5186
A=M-1 // 5187
M=0 // 5188
A=A-1 // 5189
M=0 // 5190
A=A-1 // 5191
M=D // 5192
A=A-1 // 5193
@32 // 5194
D=A // 5195
@SP // 5196
AM=M+1 // 5197
A=A-1 // 5198
M=D // 5199
@48 // 5200
D=A // 5201
@SP // 5202
AM=M+1 // 5203
A=A-1 // 5204
M=D // 5205
@24 // 5206
D=A // 5207
@SP // 5208
AM=M+1 // 5209
A=A-1 // 5210
M=D // 5211
@12 // 5212
D=A // 5213
@SP // 5214
AM=M+1 // 5215
A=A-1 // 5216
M=D // 5217
@6 // 5218
D=A // 5219
@SP // 5220
AM=M+1 // 5221
A=A-1 // 5222
M=D // 5223
@3 // 5224
D=A // 5225
@SP // 5226
AM=M+1 // 5227
A=A-1 // 5228
M=D // 5229
@SP // 5230
AM=M+1 // 5231
A=A-1 // 5232
M=1 // 5233
@SP // 5234
AM=M+1 // 5235
A=A-1 // 5236
M=0 // 5237
@SP // 5238
AM=M+1 // 5239
A=A-1 // 5240
M=0 // 5241
// call Output.create
@17 // 5242
D=A // 5243
@14 // 5244
M=D // 5245
@Output.create // 5246
D=A // 5247
@13 // 5248
M=D // 5249
@Output.init.ret.17 // 5250
D=A // 5251
@CALL // 5252
0;JMP // 5253
(Output.init.ret.17)
@SP // 5254
M=M-1 // 5255

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5256
D=A // 5257
@SP // 5258
AM=M+1 // 5259
A=A-1 // 5260
M=D // 5261
@12 // 5262
D=A // 5263
@SP // 5264
AM=M+1 // 5265
A=A-1 // 5266
M=D // 5267
@30 // 5268
D=A // 5269
@SP // 5270
AM=M+1 // 5271
A=A-1 // 5272
M=D // 5273
@51 // 5274
D=A // 5275
@SP // 5276
AM=M+1 // 5277
A=A-1 // 5278
M=D // 5279
@51 // 5280
D=A // 5281
@SP // 5282
AM=M+1 // 5283
A=A-1 // 5284
M=D // 5285
@51 // 5286
D=A // 5287
@SP // 5288
AM=M+1 // 5289
A=A-1 // 5290
M=D // 5291
@51 // 5292
D=A // 5293
@SP // 5294
AM=M+1 // 5295
A=A-1 // 5296
M=D // 5297
@51 // 5298
D=A // 5299
@SP // 5300
AM=M+1 // 5301
A=A-1 // 5302
M=D // 5303
@30 // 5304
D=A // 5305
@SP // 5306
AM=M+1 // 5307
A=A-1 // 5308
M=D // 5309
@12 // 5310
D=A // 5311
@SP // 5312
AM=M+1 // 5313
A=A-1 // 5314
M=D // 5315
@SP // 5316
AM=M+1 // 5317
A=A-1 // 5318
M=0 // 5319
@SP // 5320
AM=M+1 // 5321
A=A-1 // 5322
M=0 // 5323
// call Output.create
@17 // 5324
D=A // 5325
@14 // 5326
M=D // 5327
@Output.create // 5328
D=A // 5329
@13 // 5330
M=D // 5331
@Output.init.ret.18 // 5332
D=A // 5333
@CALL // 5334
0;JMP // 5335
(Output.init.ret.18)
@SP // 5336
M=M-1 // 5337

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5338
D=A // 5339
@SP // 5340
AM=M+1 // 5341
A=A-1 // 5342
M=D // 5343
@12 // 5344
D=A // 5345
@SP // 5346
AM=M+1 // 5347
A=A-1 // 5348
M=D // 5349
@14 // 5350
D=A // 5351
@SP // 5352
AM=M+1 // 5353
A=A-1 // 5354
M=D // 5355
@15 // 5356
D=A // 5357
@SP // 5358
AM=M+1 // 5359
A=A-1 // 5360
M=D // 5361
@12 // 5362
D=A // 5363
@SP // 5364
AM=M+1 // 5365
A=A-1 // 5366
M=D // 5367
@12 // 5368
D=A // 5369
@SP // 5370
AM=M+1 // 5371
A=A-1 // 5372
M=D // 5373
@12 // 5374
D=A // 5375
@SP // 5376
AM=M+1 // 5377
A=A-1 // 5378
M=D // 5379
@12 // 5380
D=A // 5381
@SP // 5382
AM=M+1 // 5383
A=A-1 // 5384
M=D // 5385
@12 // 5386
D=A // 5387
@SP // 5388
AM=M+1 // 5389
A=A-1 // 5390
M=D // 5391
@63 // 5392
D=A // 5393
@SP // 5394
AM=M+1 // 5395
A=A-1 // 5396
M=D // 5397
@SP // 5398
AM=M+1 // 5399
A=A-1 // 5400
M=0 // 5401
@SP // 5402
AM=M+1 // 5403
A=A-1 // 5404
M=0 // 5405
// call Output.create
@17 // 5406
D=A // 5407
@14 // 5408
M=D // 5409
@Output.create // 5410
D=A // 5411
@13 // 5412
M=D // 5413
@Output.init.ret.19 // 5414
D=A // 5415
@CALL // 5416
0;JMP // 5417
(Output.init.ret.19)
@SP // 5418
M=M-1 // 5419

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5420
D=A // 5421
@SP // 5422
AM=M+1 // 5423
A=A-1 // 5424
M=D // 5425
@30 // 5426
D=A // 5427
@SP // 5428
AM=M+1 // 5429
A=A-1 // 5430
M=D // 5431
@51 // 5432
D=A // 5433
@SP // 5434
AM=M+1 // 5435
A=A-1 // 5436
M=D // 5437
@48 // 5438
D=A // 5439
@SP // 5440
AM=M+1 // 5441
A=A-1 // 5442
M=D // 5443
@24 // 5444
D=A // 5445
@SP // 5446
AM=M+1 // 5447
A=A-1 // 5448
M=D // 5449
@12 // 5450
D=A // 5451
@SP // 5452
AM=M+1 // 5453
A=A-1 // 5454
M=D // 5455
@6 // 5456
D=A // 5457
@SP // 5458
AM=M+1 // 5459
A=A-1 // 5460
M=D // 5461
@3 // 5462
D=A // 5463
@SP // 5464
AM=M+1 // 5465
A=A-1 // 5466
M=D // 5467
@51 // 5468
D=A // 5469
@SP // 5470
AM=M+1 // 5471
A=A-1 // 5472
M=D // 5473
@63 // 5474
D=A // 5475
@SP // 5476
AM=M+1 // 5477
A=A-1 // 5478
M=D // 5479
@SP // 5480
AM=M+1 // 5481
A=A-1 // 5482
M=0 // 5483
@SP // 5484
AM=M+1 // 5485
A=A-1 // 5486
M=0 // 5487
// call Output.create
@17 // 5488
D=A // 5489
@14 // 5490
M=D // 5491
@Output.create // 5492
D=A // 5493
@13 // 5494
M=D // 5495
@Output.init.ret.20 // 5496
D=A // 5497
@CALL // 5498
0;JMP // 5499
(Output.init.ret.20)
@SP // 5500
M=M-1 // 5501

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5502
D=A // 5503
@SP // 5504
AM=M+1 // 5505
A=A-1 // 5506
M=D // 5507
@30 // 5508
D=A // 5509
@SP // 5510
AM=M+1 // 5511
A=A-1 // 5512
M=D // 5513
@51 // 5514
D=A // 5515
@SP // 5516
AM=M+1 // 5517
A=A-1 // 5518
M=D // 5519
@48 // 5520
D=A // 5521
@SP // 5522
AM=M+1 // 5523
A=A-1 // 5524
M=D // 5525
@48 // 5526
D=A // 5527
@SP // 5528
AM=M+1 // 5529
A=A-1 // 5530
M=D // 5531
@28 // 5532
D=A // 5533
@SP // 5534
AM=M+1 // 5535
A=A-1 // 5536
M=D // 5537
@48 // 5538
D=A // 5539
@SP // 5540
AM=M+1 // 5541
A=A-1 // 5542
M=D // 5543
@48 // 5544
D=A // 5545
@SP // 5546
AM=M+1 // 5547
A=A-1 // 5548
M=D // 5549
@51 // 5550
D=A // 5551
@SP // 5552
AM=M+1 // 5553
A=A-1 // 5554
M=D // 5555
@30 // 5556
D=A // 5557
@SP // 5558
AM=M+1 // 5559
A=A-1 // 5560
M=D // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=0 // 5565
@SP // 5566
AM=M+1 // 5567
A=A-1 // 5568
M=0 // 5569
// call Output.create
@17 // 5570
D=A // 5571
@14 // 5572
M=D // 5573
@Output.create // 5574
D=A // 5575
@13 // 5576
M=D // 5577
@Output.init.ret.21 // 5578
D=A // 5579
@CALL // 5580
0;JMP // 5581
(Output.init.ret.21)
@SP // 5582
M=M-1 // 5583

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5584
D=A // 5585
@SP // 5586
AM=M+1 // 5587
A=A-1 // 5588
M=D // 5589
@16 // 5590
D=A // 5591
@SP // 5592
AM=M+1 // 5593
A=A-1 // 5594
M=D // 5595
@24 // 5596
D=A // 5597
@SP // 5598
AM=M+1 // 5599
A=A-1 // 5600
M=D // 5601
@28 // 5602
D=A // 5603
@SP // 5604
AM=M+1 // 5605
A=A-1 // 5606
M=D // 5607
@26 // 5608
D=A // 5609
@SP // 5610
AM=M+1 // 5611
A=A-1 // 5612
M=D // 5613
@25 // 5614
D=A // 5615
@SP // 5616
AM=M+1 // 5617
A=A-1 // 5618
M=D // 5619
@63 // 5620
D=A // 5621
@SP // 5622
AM=M+1 // 5623
A=A-1 // 5624
M=D // 5625
@24 // 5626
D=A // 5627
@SP // 5628
AM=M+1 // 5629
A=A-1 // 5630
M=D // 5631
@24 // 5632
D=A // 5633
@SP // 5634
AM=M+1 // 5635
A=A-1 // 5636
M=D // 5637
@60 // 5638
D=A // 5639
@SP // 5640
AM=M+1 // 5641
A=A-1 // 5642
M=D // 5643
@SP // 5644
AM=M+1 // 5645
A=A-1 // 5646
M=0 // 5647
@SP // 5648
AM=M+1 // 5649
A=A-1 // 5650
M=0 // 5651
// call Output.create
@17 // 5652
D=A // 5653
@14 // 5654
M=D // 5655
@Output.create // 5656
D=A // 5657
@13 // 5658
M=D // 5659
@Output.init.ret.22 // 5660
D=A // 5661
@CALL // 5662
0;JMP // 5663
(Output.init.ret.22)
@SP // 5664
M=M-1 // 5665

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5666
D=A // 5667
@SP // 5668
AM=M+1 // 5669
A=A-1 // 5670
M=D // 5671
@63 // 5672
D=A // 5673
@SP // 5674
AM=M+1 // 5675
A=A-1 // 5676
M=D // 5677
@3 // 5678
D=A // 5679
@SP // 5680
AM=M+1 // 5681
A=A-1 // 5682
M=D // 5683
@3 // 5684
D=A // 5685
@SP // 5686
AM=M+1 // 5687
A=A-1 // 5688
M=D // 5689
@31 // 5690
D=A // 5691
@SP // 5692
AM=M+1 // 5693
A=A-1 // 5694
M=D // 5695
@48 // 5696
D=A // 5697
@SP // 5698
AM=M+1 // 5699
A=A-1 // 5700
M=D // 5701
@48 // 5702
D=A // 5703
@SP // 5704
AM=M+1 // 5705
A=A-1 // 5706
M=D // 5707
@48 // 5708
D=A // 5709
@SP // 5710
AM=M+1 // 5711
A=A-1 // 5712
M=D // 5713
@51 // 5714
D=A // 5715
@SP // 5716
AM=M+1 // 5717
A=A-1 // 5718
M=D // 5719
@30 // 5720
D=A // 5721
@SP // 5722
AM=M+1 // 5723
A=A-1 // 5724
M=D // 5725
@SP // 5726
AM=M+1 // 5727
A=A-1 // 5728
M=0 // 5729
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
@Output.init.ret.23 // 5742
D=A // 5743
@CALL // 5744
0;JMP // 5745
(Output.init.ret.23)
@SP // 5746
M=M-1 // 5747

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5748
D=A // 5749
@SP // 5750
AM=M+1 // 5751
A=A-1 // 5752
M=D // 5753
@28 // 5754
D=A // 5755
@SP // 5756
AM=M+1 // 5757
A=A-1 // 5758
M=D // 5759
@6 // 5760
D=A // 5761
@SP // 5762
AM=M+1 // 5763
A=A-1 // 5764
M=D // 5765
@3 // 5766
D=A // 5767
@SP // 5768
AM=M+1 // 5769
A=A-1 // 5770
M=D // 5771
@3 // 5772
D=A // 5773
@SP // 5774
AM=M+1 // 5775
A=A-1 // 5776
M=D // 5777
@31 // 5778
D=A // 5779
@SP // 5780
AM=M+1 // 5781
A=A-1 // 5782
M=D // 5783
@51 // 5784
D=A // 5785
@SP // 5786
AM=M+1 // 5787
A=A-1 // 5788
M=D // 5789
@51 // 5790
D=A // 5791
@SP // 5792
AM=M+1 // 5793
A=A-1 // 5794
M=D // 5795
@51 // 5796
D=A // 5797
@SP // 5798
AM=M+1 // 5799
A=A-1 // 5800
M=D // 5801
@30 // 5802
D=A // 5803
@SP // 5804
AM=M+1 // 5805
A=A-1 // 5806
M=D // 5807
@SP // 5808
AM=M+1 // 5809
A=A-1 // 5810
M=0 // 5811
@SP // 5812
AM=M+1 // 5813
A=A-1 // 5814
M=0 // 5815
// call Output.create
@17 // 5816
D=A // 5817
@14 // 5818
M=D // 5819
@Output.create // 5820
D=A // 5821
@13 // 5822
M=D // 5823
@Output.init.ret.24 // 5824
D=A // 5825
@CALL // 5826
0;JMP // 5827
(Output.init.ret.24)
@SP // 5828
M=M-1 // 5829

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 5830
D=A // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=D // 5835
@63 // 5836
D=A // 5837
@SP // 5838
AM=M+1 // 5839
A=A-1 // 5840
M=D // 5841
@49 // 5842
D=A // 5843
@SP // 5844
AM=M+1 // 5845
A=A-1 // 5846
M=D // 5847
@48 // 5848
D=A // 5849
@SP // 5850
AM=M+1 // 5851
A=A-1 // 5852
M=D // 5853
@48 // 5854
D=A // 5855
@SP // 5856
AM=M+1 // 5857
A=A-1 // 5858
M=D // 5859
@24 // 5860
D=A // 5861
@SP // 5862
AM=M+1 // 5863
A=A-1 // 5864
M=D // 5865
@12 // 5866
D=A // 5867
@SP // 5868
AM=M+1 // 5869
A=A-1 // 5870
M=D // 5871
@12 // 5872
D=A // 5873
@SP // 5874
AM=M+1 // 5875
A=A-1 // 5876
M=D // 5877
@12 // 5878
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
@SP // 5890
AM=M+1 // 5891
A=A-1 // 5892
M=0 // 5893
@SP // 5894
AM=M+1 // 5895
A=A-1 // 5896
M=0 // 5897
// call Output.create
@17 // 5898
D=A // 5899
@14 // 5900
M=D // 5901
@Output.create // 5902
D=A // 5903
@13 // 5904
M=D // 5905
@Output.init.ret.25 // 5906
D=A // 5907
@CALL // 5908
0;JMP // 5909
(Output.init.ret.25)
@SP // 5910
M=M-1 // 5911

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 5912
D=A // 5913
@SP // 5914
AM=M+1 // 5915
A=A-1 // 5916
M=D // 5917
@30 // 5918
D=A // 5919
@SP // 5920
AM=M+1 // 5921
A=A-1 // 5922
M=D // 5923
@51 // 5924
D=A // 5925
@SP // 5926
AM=M+1 // 5927
A=A-1 // 5928
M=D // 5929
@51 // 5930
D=A // 5931
@SP // 5932
AM=M+1 // 5933
A=A-1 // 5934
M=D // 5935
@51 // 5936
D=A // 5937
@SP // 5938
AM=M+1 // 5939
A=A-1 // 5940
M=D // 5941
@30 // 5942
D=A // 5943
@SP // 5944
AM=M+1 // 5945
A=A-1 // 5946
M=D // 5947
@51 // 5948
D=A // 5949
@SP // 5950
AM=M+1 // 5951
A=A-1 // 5952
M=D // 5953
@51 // 5954
D=A // 5955
@SP // 5956
AM=M+1 // 5957
A=A-1 // 5958
M=D // 5959
@51 // 5960
D=A // 5961
@SP // 5962
AM=M+1 // 5963
A=A-1 // 5964
M=D // 5965
@30 // 5966
D=A // 5967
@SP // 5968
AM=M+1 // 5969
A=A-1 // 5970
M=D // 5971
@SP // 5972
AM=M+1 // 5973
A=A-1 // 5974
M=0 // 5975
@SP // 5976
AM=M+1 // 5977
A=A-1 // 5978
M=0 // 5979
// call Output.create
@17 // 5980
D=A // 5981
@14 // 5982
M=D // 5983
@Output.create // 5984
D=A // 5985
@13 // 5986
M=D // 5987
@Output.init.ret.26 // 5988
D=A // 5989
@CALL // 5990
0;JMP // 5991
(Output.init.ret.26)
@SP // 5992
M=M-1 // 5993

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 5994
D=A // 5995
@SP // 5996
AM=M+1 // 5997
A=A-1 // 5998
M=D // 5999
@30 // 6000
D=A // 6001
@SP // 6002
AM=M+1 // 6003
A=A-1 // 6004
M=D // 6005
@51 // 6006
D=A // 6007
@SP // 6008
AM=M+1 // 6009
A=A-1 // 6010
M=D // 6011
@51 // 6012
D=A // 6013
@SP // 6014
AM=M+1 // 6015
A=A-1 // 6016
M=D // 6017
@51 // 6018
D=A // 6019
@SP // 6020
AM=M+1 // 6021
A=A-1 // 6022
M=D // 6023
@62 // 6024
D=A // 6025
@SP // 6026
AM=M+1 // 6027
A=A-1 // 6028
M=D // 6029
@48 // 6030
D=A // 6031
@SP // 6032
AM=M+1 // 6033
A=A-1 // 6034
M=D // 6035
@48 // 6036
D=A // 6037
@SP // 6038
AM=M+1 // 6039
A=A-1 // 6040
M=D // 6041
@24 // 6042
D=A // 6043
@SP // 6044
AM=M+1 // 6045
A=A-1 // 6046
M=D // 6047
@14 // 6048
D=A // 6049
@SP // 6050
AM=M+1 // 6051
A=A-1 // 6052
M=D // 6053
@SP // 6054
AM=M+1 // 6055
A=A-1 // 6056
M=0 // 6057
@SP // 6058
AM=M+1 // 6059
A=A-1 // 6060
M=0 // 6061
// call Output.create
@17 // 6062
D=A // 6063
@14 // 6064
M=D // 6065
@Output.create // 6066
D=A // 6067
@13 // 6068
M=D // 6069
@Output.init.ret.27 // 6070
D=A // 6071
@CALL // 6072
0;JMP // 6073
(Output.init.ret.27)
@SP // 6074
M=M-1 // 6075

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6076
D=A // 6077
@SP // 6078
M=D+M // 6079
@58 // 6080
D=A // 6081
@SP // 6082
A=M-1 // 6083
M=0 // 6084
A=A-1 // 6085
M=0 // 6086
A=A-1 // 6087
M=D // 6088
A=A-1 // 6089
@4 // 6090
D=A // 6091
@SP // 6092
M=D+M // 6093
@12 // 6094
D=A // 6095
@SP // 6096
A=M-1 // 6097
M=0 // 6098
A=A-1 // 6099
M=0 // 6100
A=A-1 // 6101
M=D // 6102
A=A-1 // 6103
M=D // 6104
A=A-1 // 6105
@5 // 6106
D=A // 6107
@SP // 6108
M=D+M // 6109
@12 // 6110
D=A // 6111
@SP // 6112
A=M-1 // 6113
M=0 // 6114
A=A-1 // 6115
M=0 // 6116
A=A-1 // 6117
M=0 // 6118
A=A-1 // 6119
M=D // 6120
A=A-1 // 6121
M=D // 6122
A=A-1 // 6123
// call Output.create
@17 // 6124
D=A // 6125
@14 // 6126
M=D // 6127
@Output.create // 6128
D=A // 6129
@13 // 6130
M=D // 6131
@Output.init.ret.28 // 6132
D=A // 6133
@CALL // 6134
0;JMP // 6135
(Output.init.ret.28)
@SP // 6136
M=M-1 // 6137

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6138
D=A // 6139
@SP // 6140
M=D+M // 6141
@59 // 6142
D=A // 6143
@SP // 6144
A=M-1 // 6145
M=0 // 6146
A=A-1 // 6147
M=0 // 6148
A=A-1 // 6149
M=D // 6150
A=A-1 // 6151
@4 // 6152
D=A // 6153
@SP // 6154
M=D+M // 6155
@12 // 6156
D=A // 6157
@SP // 6158
A=M-1 // 6159
M=0 // 6160
A=A-1 // 6161
M=0 // 6162
A=A-1 // 6163
M=D // 6164
A=A-1 // 6165
M=D // 6166
A=A-1 // 6167
@12 // 6168
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
@SP // 6186
AM=M+1 // 6187
A=A-1 // 6188
M=0 // 6189
@SP // 6190
AM=M+1 // 6191
A=A-1 // 6192
M=0 // 6193
// call Output.create
@17 // 6194
D=A // 6195
@14 // 6196
M=D // 6197
@Output.create // 6198
D=A // 6199
@13 // 6200
M=D // 6201
@Output.init.ret.29 // 6202
D=A // 6203
@CALL // 6204
0;JMP // 6205
(Output.init.ret.29)
@SP // 6206
M=M-1 // 6207

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6208
D=A // 6209
@SP // 6210
M=D+M // 6211
@60 // 6212
D=A // 6213
@SP // 6214
A=M-1 // 6215
M=0 // 6216
A=A-1 // 6217
M=0 // 6218
A=A-1 // 6219
M=D // 6220
A=A-1 // 6221
@24 // 6222
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
@6 // 6234
D=A // 6235
@SP // 6236
AM=M+1 // 6237
A=A-1 // 6238
M=D // 6239
@3 // 6240
D=A // 6241
@SP // 6242
AM=M+1 // 6243
A=A-1 // 6244
M=D // 6245
@6 // 6246
D=A // 6247
@SP // 6248
AM=M+1 // 6249
A=A-1 // 6250
M=D // 6251
@12 // 6252
D=A // 6253
@SP // 6254
AM=M+1 // 6255
A=A-1 // 6256
M=D // 6257
@24 // 6258
D=A // 6259
@SP // 6260
AM=M+1 // 6261
A=A-1 // 6262
M=D // 6263
@SP // 6264
AM=M+1 // 6265
A=A-1 // 6266
M=0 // 6267
@SP // 6268
AM=M+1 // 6269
A=A-1 // 6270
M=0 // 6271
// call Output.create
@17 // 6272
D=A // 6273
@14 // 6274
M=D // 6275
@Output.create // 6276
D=A // 6277
@13 // 6278
M=D // 6279
@Output.init.ret.30 // 6280
D=A // 6281
@CALL // 6282
0;JMP // 6283
(Output.init.ret.30)
@SP // 6284
M=M-1 // 6285

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6286
D=A // 6287
@SP // 6288
M=D+M // 6289
@61 // 6290
D=A // 6291
@SP // 6292
A=M-1 // 6293
M=0 // 6294
A=A-1 // 6295
M=0 // 6296
A=A-1 // 6297
M=0 // 6298
A=A-1 // 6299
M=D // 6300
A=A-1 // 6301
@3 // 6302
D=A // 6303
@SP // 6304
M=D+M // 6305
@63 // 6306
D=A // 6307
@SP // 6308
A=M-1 // 6309
M=0 // 6310
A=A-1 // 6311
M=0 // 6312
A=A-1 // 6313
M=D // 6314
A=A-1 // 6315
@5 // 6316
D=A // 6317
@SP // 6318
M=D+M // 6319
@63 // 6320
D=A // 6321
@SP // 6322
A=M-1 // 6323
M=0 // 6324
A=A-1 // 6325
M=0 // 6326
A=A-1 // 6327
M=0 // 6328
A=A-1 // 6329
M=0 // 6330
A=A-1 // 6331
M=D // 6332
A=A-1 // 6333
// call Output.create
@17 // 6334
D=A // 6335
@14 // 6336
M=D // 6337
@Output.create // 6338
D=A // 6339
@13 // 6340
M=D // 6341
@Output.init.ret.31 // 6342
D=A // 6343
@CALL // 6344
0;JMP // 6345
(Output.init.ret.31)
@SP // 6346
M=M-1 // 6347

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6348
D=A // 6349
@SP // 6350
M=D+M // 6351
@62 // 6352
D=A // 6353
@SP // 6354
A=M-1 // 6355
M=0 // 6356
A=A-1 // 6357
M=0 // 6358
A=A-1 // 6359
M=D // 6360
A=A-1 // 6361
@3 // 6362
D=A // 6363
@SP // 6364
AM=M+1 // 6365
A=A-1 // 6366
M=D // 6367
@6 // 6368
D=A // 6369
@SP // 6370
AM=M+1 // 6371
A=A-1 // 6372
M=D // 6373
@12 // 6374
D=A // 6375
@SP // 6376
AM=M+1 // 6377
A=A-1 // 6378
M=D // 6379
@24 // 6380
D=A // 6381
@SP // 6382
AM=M+1 // 6383
A=A-1 // 6384
M=D // 6385
@12 // 6386
D=A // 6387
@SP // 6388
AM=M+1 // 6389
A=A-1 // 6390
M=D // 6391
@6 // 6392
D=A // 6393
@SP // 6394
AM=M+1 // 6395
A=A-1 // 6396
M=D // 6397
@3 // 6398
D=A // 6399
@SP // 6400
AM=M+1 // 6401
A=A-1 // 6402
M=D // 6403
@SP // 6404
AM=M+1 // 6405
A=A-1 // 6406
M=0 // 6407
@SP // 6408
AM=M+1 // 6409
A=A-1 // 6410
M=0 // 6411
// call Output.create
@17 // 6412
D=A // 6413
@14 // 6414
M=D // 6415
@Output.create // 6416
D=A // 6417
@13 // 6418
M=D // 6419
@Output.init.ret.32 // 6420
D=A // 6421
@CALL // 6422
0;JMP // 6423
(Output.init.ret.32)
@SP // 6424
M=M-1 // 6425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6426
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
@51 // 6438
D=A // 6439
@SP // 6440
AM=M+1 // 6441
A=A-1 // 6442
M=D // 6443
@51 // 6444
D=A // 6445
@SP // 6446
AM=M+1 // 6447
A=A-1 // 6448
M=D // 6449
@59 // 6450
D=A // 6451
@SP // 6452
AM=M+1 // 6453
A=A-1 // 6454
M=D // 6455
@59 // 6456
D=A // 6457
@SP // 6458
AM=M+1 // 6459
A=A-1 // 6460
M=D // 6461
@59 // 6462
D=A // 6463
@SP // 6464
AM=M+1 // 6465
A=A-1 // 6466
M=D // 6467
@27 // 6468
D=A // 6469
@SP // 6470
AM=M+1 // 6471
A=A-1 // 6472
M=D // 6473
@3 // 6474
D=A // 6475
@SP // 6476
AM=M+1 // 6477
A=A-1 // 6478
M=D // 6479
@30 // 6480
D=A // 6481
@SP // 6482
AM=M+1 // 6483
A=A-1 // 6484
M=D // 6485
@SP // 6486
AM=M+1 // 6487
A=A-1 // 6488
M=0 // 6489
@SP // 6490
AM=M+1 // 6491
A=A-1 // 6492
M=0 // 6493
// call Output.create
@17 // 6494
D=A // 6495
@14 // 6496
M=D // 6497
@Output.create // 6498
D=A // 6499
@13 // 6500
M=D // 6501
@Output.init.ret.33 // 6502
D=A // 6503
@CALL // 6504
0;JMP // 6505
(Output.init.ret.33)
@SP // 6506
M=M-1 // 6507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6508
D=A // 6509
@SP // 6510
AM=M+1 // 6511
A=A-1 // 6512
M=D // 6513
@30 // 6514
D=A // 6515
@SP // 6516
AM=M+1 // 6517
A=A-1 // 6518
M=D // 6519
@51 // 6520
D=A // 6521
@SP // 6522
AM=M+1 // 6523
A=A-1 // 6524
M=D // 6525
@51 // 6526
D=A // 6527
@SP // 6528
AM=M+1 // 6529
A=A-1 // 6530
M=D // 6531
@24 // 6532
D=A // 6533
@SP // 6534
AM=M+1 // 6535
A=A-1 // 6536
M=D // 6537
@12 // 6538
D=A // 6539
@SP // 6540
AM=M+1 // 6541
A=A-1 // 6542
M=D // 6543
@12 // 6544
D=A // 6545
@SP // 6546
AM=M+1 // 6547
A=A-1 // 6548
M=D // 6549
@SP // 6550
AM=M+1 // 6551
A=A-1 // 6552
M=0 // 6553
@4 // 6554
D=A // 6555
@SP // 6556
M=D+M // 6557
@12 // 6558
D=A // 6559
@SP // 6560
A=M-1 // 6561
M=0 // 6562
A=A-1 // 6563
M=0 // 6564
A=A-1 // 6565
M=D // 6566
A=A-1 // 6567
M=D // 6568
A=A-1 // 6569
// call Output.create
@17 // 6570
D=A // 6571
@14 // 6572
M=D // 6573
@Output.create // 6574
D=A // 6575
@13 // 6576
M=D // 6577
@Output.init.ret.34 // 6578
D=A // 6579
@CALL // 6580
0;JMP // 6581
(Output.init.ret.34)
@SP // 6582
M=M-1 // 6583

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6584
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
@30 // 6596
D=A // 6597
@SP // 6598
AM=M+1 // 6599
A=A-1 // 6600
M=D // 6601
@51 // 6602
D=A // 6603
@SP // 6604
AM=M+1 // 6605
A=A-1 // 6606
M=D // 6607
@51 // 6608
D=A // 6609
@SP // 6610
AM=M+1 // 6611
A=A-1 // 6612
M=D // 6613
@63 // 6614
D=A // 6615
@SP // 6616
AM=M+1 // 6617
A=A-1 // 6618
M=D // 6619
@51 // 6620
D=A // 6621
@SP // 6622
AM=M+1 // 6623
A=A-1 // 6624
M=D // 6625
@51 // 6626
D=A // 6627
@SP // 6628
AM=M+1 // 6629
A=A-1 // 6630
M=D // 6631
@51 // 6632
D=A // 6633
@SP // 6634
AM=M+1 // 6635
A=A-1 // 6636
M=D // 6637
@51 // 6638
D=A // 6639
@SP // 6640
AM=M+1 // 6641
A=A-1 // 6642
M=D // 6643
@SP // 6644
AM=M+1 // 6645
A=A-1 // 6646
M=0 // 6647
@SP // 6648
AM=M+1 // 6649
A=A-1 // 6650
M=0 // 6651
// call Output.create
@17 // 6652
D=A // 6653
@14 // 6654
M=D // 6655
@Output.create // 6656
D=A // 6657
@13 // 6658
M=D // 6659
@Output.init.ret.35 // 6660
D=A // 6661
@CALL // 6662
0;JMP // 6663
(Output.init.ret.35)
@SP // 6664
M=M-1 // 6665

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6666
D=A // 6667
@SP // 6668
AM=M+1 // 6669
A=A-1 // 6670
M=D // 6671
@31 // 6672
D=A // 6673
@SP // 6674
AM=M+1 // 6675
A=A-1 // 6676
M=D // 6677
@51 // 6678
D=A // 6679
@SP // 6680
AM=M+1 // 6681
A=A-1 // 6682
M=D // 6683
@51 // 6684
D=A // 6685
@SP // 6686
AM=M+1 // 6687
A=A-1 // 6688
M=D // 6689
@51 // 6690
D=A // 6691
@SP // 6692
AM=M+1 // 6693
A=A-1 // 6694
M=D // 6695
@31 // 6696
D=A // 6697
@SP // 6698
AM=M+1 // 6699
A=A-1 // 6700
M=D // 6701
@51 // 6702
D=A // 6703
@SP // 6704
AM=M+1 // 6705
A=A-1 // 6706
M=D // 6707
@51 // 6708
D=A // 6709
@SP // 6710
AM=M+1 // 6711
A=A-1 // 6712
M=D // 6713
@51 // 6714
D=A // 6715
@SP // 6716
AM=M+1 // 6717
A=A-1 // 6718
M=D // 6719
@31 // 6720
D=A // 6721
@SP // 6722
AM=M+1 // 6723
A=A-1 // 6724
M=D // 6725
@SP // 6726
AM=M+1 // 6727
A=A-1 // 6728
M=0 // 6729
@SP // 6730
AM=M+1 // 6731
A=A-1 // 6732
M=0 // 6733
// call Output.create
@17 // 6734
D=A // 6735
@14 // 6736
M=D // 6737
@Output.create // 6738
D=A // 6739
@13 // 6740
M=D // 6741
@Output.init.ret.36 // 6742
D=A // 6743
@CALL // 6744
0;JMP // 6745
(Output.init.ret.36)
@SP // 6746
M=M-1 // 6747

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6748
D=A // 6749
@SP // 6750
AM=M+1 // 6751
A=A-1 // 6752
M=D // 6753
@28 // 6754
D=A // 6755
@SP // 6756
AM=M+1 // 6757
A=A-1 // 6758
M=D // 6759
@54 // 6760
D=A // 6761
@SP // 6762
AM=M+1 // 6763
A=A-1 // 6764
M=D // 6765
@35 // 6766
D=A // 6767
@SP // 6768
AM=M+1 // 6769
A=A-1 // 6770
M=D // 6771
@3 // 6772
D=A // 6773
@SP // 6774
AM=M+1 // 6775
A=A-1 // 6776
M=D // 6777
@3 // 6778
D=A // 6779
@SP // 6780
AM=M+1 // 6781
A=A-1 // 6782
M=D // 6783
@3 // 6784
D=A // 6785
@SP // 6786
AM=M+1 // 6787
A=A-1 // 6788
M=D // 6789
@35 // 6790
D=A // 6791
@SP // 6792
AM=M+1 // 6793
A=A-1 // 6794
M=D // 6795
@54 // 6796
D=A // 6797
@SP // 6798
AM=M+1 // 6799
A=A-1 // 6800
M=D // 6801
@28 // 6802
D=A // 6803
@SP // 6804
AM=M+1 // 6805
A=A-1 // 6806
M=D // 6807
@SP // 6808
AM=M+1 // 6809
A=A-1 // 6810
M=0 // 6811
@SP // 6812
AM=M+1 // 6813
A=A-1 // 6814
M=0 // 6815
// call Output.create
@17 // 6816
D=A // 6817
@14 // 6818
M=D // 6819
@Output.create // 6820
D=A // 6821
@13 // 6822
M=D // 6823
@Output.init.ret.37 // 6824
D=A // 6825
@CALL // 6826
0;JMP // 6827
(Output.init.ret.37)
@SP // 6828
M=M-1 // 6829

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 6830
D=A // 6831
@SP // 6832
AM=M+1 // 6833
A=A-1 // 6834
M=D // 6835
@15 // 6836
D=A // 6837
@SP // 6838
AM=M+1 // 6839
A=A-1 // 6840
M=D // 6841
@27 // 6842
D=A // 6843
@SP // 6844
AM=M+1 // 6845
A=A-1 // 6846
M=D // 6847
@51 // 6848
D=A // 6849
@SP // 6850
AM=M+1 // 6851
A=A-1 // 6852
M=D // 6853
@51 // 6854
D=A // 6855
@SP // 6856
AM=M+1 // 6857
A=A-1 // 6858
M=D // 6859
@51 // 6860
D=A // 6861
@SP // 6862
AM=M+1 // 6863
A=A-1 // 6864
M=D // 6865
@51 // 6866
D=A // 6867
@SP // 6868
AM=M+1 // 6869
A=A-1 // 6870
M=D // 6871
@51 // 6872
D=A // 6873
@SP // 6874
AM=M+1 // 6875
A=A-1 // 6876
M=D // 6877
@27 // 6878
D=A // 6879
@SP // 6880
AM=M+1 // 6881
A=A-1 // 6882
M=D // 6883
@15 // 6884
D=A // 6885
@SP // 6886
AM=M+1 // 6887
A=A-1 // 6888
M=D // 6889
@SP // 6890
AM=M+1 // 6891
A=A-1 // 6892
M=0 // 6893
@SP // 6894
AM=M+1 // 6895
A=A-1 // 6896
M=0 // 6897
// call Output.create
@17 // 6898
D=A // 6899
@14 // 6900
M=D // 6901
@Output.create // 6902
D=A // 6903
@13 // 6904
M=D // 6905
@Output.init.ret.38 // 6906
D=A // 6907
@CALL // 6908
0;JMP // 6909
(Output.init.ret.38)
@SP // 6910
M=M-1 // 6911

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 6912
D=A // 6913
@SP // 6914
AM=M+1 // 6915
A=A-1 // 6916
M=D // 6917
@63 // 6918
D=A // 6919
@SP // 6920
AM=M+1 // 6921
A=A-1 // 6922
M=D // 6923
@51 // 6924
D=A // 6925
@SP // 6926
AM=M+1 // 6927
A=A-1 // 6928
M=D // 6929
@35 // 6930
D=A // 6931
@SP // 6932
AM=M+1 // 6933
A=A-1 // 6934
M=D // 6935
@11 // 6936
D=A // 6937
@SP // 6938
AM=M+1 // 6939
A=A-1 // 6940
M=D // 6941
@15 // 6942
D=A // 6943
@SP // 6944
AM=M+1 // 6945
A=A-1 // 6946
M=D // 6947
@11 // 6948
D=A // 6949
@SP // 6950
AM=M+1 // 6951
A=A-1 // 6952
M=D // 6953
@35 // 6954
D=A // 6955
@SP // 6956
AM=M+1 // 6957
A=A-1 // 6958
M=D // 6959
@51 // 6960
D=A // 6961
@SP // 6962
AM=M+1 // 6963
A=A-1 // 6964
M=D // 6965
@63 // 6966
D=A // 6967
@SP // 6968
AM=M+1 // 6969
A=A-1 // 6970
M=D // 6971
@SP // 6972
AM=M+1 // 6973
A=A-1 // 6974
M=0 // 6975
@SP // 6976
AM=M+1 // 6977
A=A-1 // 6978
M=0 // 6979
// call Output.create
@17 // 6980
D=A // 6981
@14 // 6982
M=D // 6983
@Output.create // 6984
D=A // 6985
@13 // 6986
M=D // 6987
@Output.init.ret.39 // 6988
D=A // 6989
@CALL // 6990
0;JMP // 6991
(Output.init.ret.39)
@SP // 6992
M=M-1 // 6993

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 6994
D=A // 6995
@SP // 6996
AM=M+1 // 6997
A=A-1 // 6998
M=D // 6999
@63 // 7000
D=A // 7001
@SP // 7002
AM=M+1 // 7003
A=A-1 // 7004
M=D // 7005
@51 // 7006
D=A // 7007
@SP // 7008
AM=M+1 // 7009
A=A-1 // 7010
M=D // 7011
@35 // 7012
D=A // 7013
@SP // 7014
AM=M+1 // 7015
A=A-1 // 7016
M=D // 7017
@11 // 7018
D=A // 7019
@SP // 7020
AM=M+1 // 7021
A=A-1 // 7022
M=D // 7023
@15 // 7024
D=A // 7025
@SP // 7026
AM=M+1 // 7027
A=A-1 // 7028
M=D // 7029
@11 // 7030
D=A // 7031
@SP // 7032
AM=M+1 // 7033
A=A-1 // 7034
M=D // 7035
@3 // 7036
D=A // 7037
@SP // 7038
AM=M+1 // 7039
A=A-1 // 7040
M=D // 7041
@3 // 7042
D=A // 7043
@SP // 7044
AM=M+1 // 7045
A=A-1 // 7046
M=D // 7047
@3 // 7048
D=A // 7049
@SP // 7050
AM=M+1 // 7051
A=A-1 // 7052
M=D // 7053
@SP // 7054
AM=M+1 // 7055
A=A-1 // 7056
M=0 // 7057
@SP // 7058
AM=M+1 // 7059
A=A-1 // 7060
M=0 // 7061
// call Output.create
@17 // 7062
D=A // 7063
@14 // 7064
M=D // 7065
@Output.create // 7066
D=A // 7067
@13 // 7068
M=D // 7069
@Output.init.ret.40 // 7070
D=A // 7071
@CALL // 7072
0;JMP // 7073
(Output.init.ret.40)
@SP // 7074
M=M-1 // 7075

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7076
D=A // 7077
@SP // 7078
AM=M+1 // 7079
A=A-1 // 7080
M=D // 7081
@28 // 7082
D=A // 7083
@SP // 7084
AM=M+1 // 7085
A=A-1 // 7086
M=D // 7087
@54 // 7088
D=A // 7089
@SP // 7090
AM=M+1 // 7091
A=A-1 // 7092
M=D // 7093
@35 // 7094
D=A // 7095
@SP // 7096
AM=M+1 // 7097
A=A-1 // 7098
M=D // 7099
@3 // 7100
D=A // 7101
@SP // 7102
AM=M+1 // 7103
A=A-1 // 7104
M=D // 7105
@59 // 7106
D=A // 7107
@SP // 7108
AM=M+1 // 7109
A=A-1 // 7110
M=D // 7111
@51 // 7112
D=A // 7113
@SP // 7114
AM=M+1 // 7115
A=A-1 // 7116
M=D // 7117
@51 // 7118
D=A // 7119
@SP // 7120
AM=M+1 // 7121
A=A-1 // 7122
M=D // 7123
@54 // 7124
D=A // 7125
@SP // 7126
AM=M+1 // 7127
A=A-1 // 7128
M=D // 7129
@44 // 7130
D=A // 7131
@SP // 7132
AM=M+1 // 7133
A=A-1 // 7134
M=D // 7135
@SP // 7136
AM=M+1 // 7137
A=A-1 // 7138
M=0 // 7139
@SP // 7140
AM=M+1 // 7141
A=A-1 // 7142
M=0 // 7143
// call Output.create
@17 // 7144
D=A // 7145
@14 // 7146
M=D // 7147
@Output.create // 7148
D=A // 7149
@13 // 7150
M=D // 7151
@Output.init.ret.41 // 7152
D=A // 7153
@CALL // 7154
0;JMP // 7155
(Output.init.ret.41)
@SP // 7156
M=M-1 // 7157

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7158
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
@51 // 7170
D=A // 7171
@SP // 7172
AM=M+1 // 7173
A=A-1 // 7174
M=D // 7175
@51 // 7176
D=A // 7177
@SP // 7178
AM=M+1 // 7179
A=A-1 // 7180
M=D // 7181
@51 // 7182
D=A // 7183
@SP // 7184
AM=M+1 // 7185
A=A-1 // 7186
M=D // 7187
@63 // 7188
D=A // 7189
@SP // 7190
AM=M+1 // 7191
A=A-1 // 7192
M=D // 7193
@51 // 7194
D=A // 7195
@SP // 7196
AM=M+1 // 7197
A=A-1 // 7198
M=D // 7199
@51 // 7200
D=A // 7201
@SP // 7202
AM=M+1 // 7203
A=A-1 // 7204
M=D // 7205
@51 // 7206
D=A // 7207
@SP // 7208
AM=M+1 // 7209
A=A-1 // 7210
M=D // 7211
@51 // 7212
D=A // 7213
@SP // 7214
AM=M+1 // 7215
A=A-1 // 7216
M=D // 7217
@SP // 7218
AM=M+1 // 7219
A=A-1 // 7220
M=0 // 7221
@SP // 7222
AM=M+1 // 7223
A=A-1 // 7224
M=0 // 7225
// call Output.create
@17 // 7226
D=A // 7227
@14 // 7228
M=D // 7229
@Output.create // 7230
D=A // 7231
@13 // 7232
M=D // 7233
@Output.init.ret.42 // 7234
D=A // 7235
@CALL // 7236
0;JMP // 7237
(Output.init.ret.42)
@SP // 7238
M=M-1 // 7239

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7240
D=A // 7241
@SP // 7242
AM=M+1 // 7243
A=A-1 // 7244
M=D // 7245
@30 // 7246
D=A // 7247
@SP // 7248
AM=M+1 // 7249
A=A-1 // 7250
M=D // 7251
@12 // 7252
D=A // 7253
@SP // 7254
AM=M+1 // 7255
A=A-1 // 7256
M=D // 7257
@12 // 7258
D=A // 7259
@SP // 7260
AM=M+1 // 7261
A=A-1 // 7262
M=D // 7263
@12 // 7264
D=A // 7265
@SP // 7266
AM=M+1 // 7267
A=A-1 // 7268
M=D // 7269
@12 // 7270
D=A // 7271
@SP // 7272
AM=M+1 // 7273
A=A-1 // 7274
M=D // 7275
@12 // 7276
D=A // 7277
@SP // 7278
AM=M+1 // 7279
A=A-1 // 7280
M=D // 7281
@12 // 7282
D=A // 7283
@SP // 7284
AM=M+1 // 7285
A=A-1 // 7286
M=D // 7287
@12 // 7288
D=A // 7289
@SP // 7290
AM=M+1 // 7291
A=A-1 // 7292
M=D // 7293
@30 // 7294
D=A // 7295
@SP // 7296
AM=M+1 // 7297
A=A-1 // 7298
M=D // 7299
@SP // 7300
AM=M+1 // 7301
A=A-1 // 7302
M=0 // 7303
@SP // 7304
AM=M+1 // 7305
A=A-1 // 7306
M=0 // 7307
// call Output.create
@17 // 7308
D=A // 7309
@14 // 7310
M=D // 7311
@Output.create // 7312
D=A // 7313
@13 // 7314
M=D // 7315
@Output.init.ret.43 // 7316
D=A // 7317
@CALL // 7318
0;JMP // 7319
(Output.init.ret.43)
@SP // 7320
M=M-1 // 7321

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7322
D=A // 7323
@SP // 7324
AM=M+1 // 7325
A=A-1 // 7326
M=D // 7327
@60 // 7328
D=A // 7329
@SP // 7330
AM=M+1 // 7331
A=A-1 // 7332
M=D // 7333
@24 // 7334
D=A // 7335
@SP // 7336
AM=M+1 // 7337
A=A-1 // 7338
M=D // 7339
@24 // 7340
D=A // 7341
@SP // 7342
AM=M+1 // 7343
A=A-1 // 7344
M=D // 7345
@24 // 7346
D=A // 7347
@SP // 7348
AM=M+1 // 7349
A=A-1 // 7350
M=D // 7351
@24 // 7352
D=A // 7353
@SP // 7354
AM=M+1 // 7355
A=A-1 // 7356
M=D // 7357
@24 // 7358
D=A // 7359
@SP // 7360
AM=M+1 // 7361
A=A-1 // 7362
M=D // 7363
@27 // 7364
D=A // 7365
@SP // 7366
AM=M+1 // 7367
A=A-1 // 7368
M=D // 7369
@27 // 7370
D=A // 7371
@SP // 7372
AM=M+1 // 7373
A=A-1 // 7374
M=D // 7375
@14 // 7376
D=A // 7377
@SP // 7378
AM=M+1 // 7379
A=A-1 // 7380
M=D // 7381
@SP // 7382
AM=M+1 // 7383
A=A-1 // 7384
M=0 // 7385
@SP // 7386
AM=M+1 // 7387
A=A-1 // 7388
M=0 // 7389
// call Output.create
@17 // 7390
D=A // 7391
@14 // 7392
M=D // 7393
@Output.create // 7394
D=A // 7395
@13 // 7396
M=D // 7397
@Output.init.ret.44 // 7398
D=A // 7399
@CALL // 7400
0;JMP // 7401
(Output.init.ret.44)
@SP // 7402
M=M-1 // 7403

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7404
D=A // 7405
@SP // 7406
AM=M+1 // 7407
A=A-1 // 7408
M=D // 7409
@51 // 7410
D=A // 7411
@SP // 7412
AM=M+1 // 7413
A=A-1 // 7414
M=D // 7415
@51 // 7416
D=A // 7417
@SP // 7418
AM=M+1 // 7419
A=A-1 // 7420
M=D // 7421
@51 // 7422
D=A // 7423
@SP // 7424
AM=M+1 // 7425
A=A-1 // 7426
M=D // 7427
@27 // 7428
D=A // 7429
@SP // 7430
AM=M+1 // 7431
A=A-1 // 7432
M=D // 7433
@15 // 7434
D=A // 7435
@SP // 7436
AM=M+1 // 7437
A=A-1 // 7438
M=D // 7439
@27 // 7440
D=A // 7441
@SP // 7442
AM=M+1 // 7443
A=A-1 // 7444
M=D // 7445
@51 // 7446
D=A // 7447
@SP // 7448
AM=M+1 // 7449
A=A-1 // 7450
M=D // 7451
@51 // 7452
D=A // 7453
@SP // 7454
AM=M+1 // 7455
A=A-1 // 7456
M=D // 7457
@51 // 7458
D=A // 7459
@SP // 7460
AM=M+1 // 7461
A=A-1 // 7462
M=D // 7463
@SP // 7464
AM=M+1 // 7465
A=A-1 // 7466
M=0 // 7467
@SP // 7468
AM=M+1 // 7469
A=A-1 // 7470
M=0 // 7471
// call Output.create
@17 // 7472
D=A // 7473
@14 // 7474
M=D // 7475
@Output.create // 7476
D=A // 7477
@13 // 7478
M=D // 7479
@Output.init.ret.45 // 7480
D=A // 7481
@CALL // 7482
0;JMP // 7483
(Output.init.ret.45)
@SP // 7484
M=M-1 // 7485

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7486
D=A // 7487
@SP // 7488
AM=M+1 // 7489
A=A-1 // 7490
M=D // 7491
@3 // 7492
D=A // 7493
@SP // 7494
AM=M+1 // 7495
A=A-1 // 7496
M=D // 7497
@3 // 7498
D=A // 7499
@SP // 7500
AM=M+1 // 7501
A=A-1 // 7502
M=D // 7503
@3 // 7504
D=A // 7505
@SP // 7506
AM=M+1 // 7507
A=A-1 // 7508
M=D // 7509
@3 // 7510
D=A // 7511
@SP // 7512
AM=M+1 // 7513
A=A-1 // 7514
M=D // 7515
@3 // 7516
D=A // 7517
@SP // 7518
AM=M+1 // 7519
A=A-1 // 7520
M=D // 7521
@3 // 7522
D=A // 7523
@SP // 7524
AM=M+1 // 7525
A=A-1 // 7526
M=D // 7527
@35 // 7528
D=A // 7529
@SP // 7530
AM=M+1 // 7531
A=A-1 // 7532
M=D // 7533
@51 // 7534
D=A // 7535
@SP // 7536
AM=M+1 // 7537
A=A-1 // 7538
M=D // 7539
@63 // 7540
D=A // 7541
@SP // 7542
AM=M+1 // 7543
A=A-1 // 7544
M=D // 7545
@SP // 7546
AM=M+1 // 7547
A=A-1 // 7548
M=0 // 7549
@SP // 7550
AM=M+1 // 7551
A=A-1 // 7552
M=0 // 7553
// call Output.create
@17 // 7554
D=A // 7555
@14 // 7556
M=D // 7557
@Output.create // 7558
D=A // 7559
@13 // 7560
M=D // 7561
@Output.init.ret.46 // 7562
D=A // 7563
@CALL // 7564
0;JMP // 7565
(Output.init.ret.46)
@SP // 7566
M=M-1 // 7567

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7568
D=A // 7569
@SP // 7570
AM=M+1 // 7571
A=A-1 // 7572
M=D // 7573
@33 // 7574
D=A // 7575
@SP // 7576
AM=M+1 // 7577
A=A-1 // 7578
M=D // 7579
@51 // 7580
D=A // 7581
@SP // 7582
AM=M+1 // 7583
A=A-1 // 7584
M=D // 7585
@63 // 7586
D=A // 7587
@SP // 7588
AM=M+1 // 7589
A=A-1 // 7590
M=D // 7591
@63 // 7592
D=A // 7593
@SP // 7594
AM=M+1 // 7595
A=A-1 // 7596
M=D // 7597
@51 // 7598
D=A // 7599
@SP // 7600
AM=M+1 // 7601
A=A-1 // 7602
M=D // 7603
@51 // 7604
D=A // 7605
@SP // 7606
AM=M+1 // 7607
A=A-1 // 7608
M=D // 7609
@51 // 7610
D=A // 7611
@SP // 7612
AM=M+1 // 7613
A=A-1 // 7614
M=D // 7615
@51 // 7616
D=A // 7617
@SP // 7618
AM=M+1 // 7619
A=A-1 // 7620
M=D // 7621
@51 // 7622
D=A // 7623
@SP // 7624
AM=M+1 // 7625
A=A-1 // 7626
M=D // 7627
@SP // 7628
AM=M+1 // 7629
A=A-1 // 7630
M=0 // 7631
@SP // 7632
AM=M+1 // 7633
A=A-1 // 7634
M=0 // 7635
// call Output.create
@17 // 7636
D=A // 7637
@14 // 7638
M=D // 7639
@Output.create // 7640
D=A // 7641
@13 // 7642
M=D // 7643
@Output.init.ret.47 // 7644
D=A // 7645
@CALL // 7646
0;JMP // 7647
(Output.init.ret.47)
@SP // 7648
M=M-1 // 7649

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7650
D=A // 7651
@SP // 7652
AM=M+1 // 7653
A=A-1 // 7654
M=D // 7655
@51 // 7656
D=A // 7657
@SP // 7658
AM=M+1 // 7659
A=A-1 // 7660
M=D // 7661
@51 // 7662
D=A // 7663
@SP // 7664
AM=M+1 // 7665
A=A-1 // 7666
M=D // 7667
@55 // 7668
D=A // 7669
@SP // 7670
AM=M+1 // 7671
A=A-1 // 7672
M=D // 7673
@55 // 7674
D=A // 7675
@SP // 7676
AM=M+1 // 7677
A=A-1 // 7678
M=D // 7679
@63 // 7680
D=A // 7681
@SP // 7682
AM=M+1 // 7683
A=A-1 // 7684
M=D // 7685
@59 // 7686
D=A // 7687
@SP // 7688
AM=M+1 // 7689
A=A-1 // 7690
M=D // 7691
@59 // 7692
D=A // 7693
@SP // 7694
AM=M+1 // 7695
A=A-1 // 7696
M=D // 7697
@51 // 7698
D=A // 7699
@SP // 7700
AM=M+1 // 7701
A=A-1 // 7702
M=D // 7703
@51 // 7704
D=A // 7705
@SP // 7706
AM=M+1 // 7707
A=A-1 // 7708
M=D // 7709
@SP // 7710
AM=M+1 // 7711
A=A-1 // 7712
M=0 // 7713
@SP // 7714
AM=M+1 // 7715
A=A-1 // 7716
M=0 // 7717
// call Output.create
@17 // 7718
D=A // 7719
@14 // 7720
M=D // 7721
@Output.create // 7722
D=A // 7723
@13 // 7724
M=D // 7725
@Output.init.ret.48 // 7726
D=A // 7727
@CALL // 7728
0;JMP // 7729
(Output.init.ret.48)
@SP // 7730
M=M-1 // 7731

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7732
D=A // 7733
@SP // 7734
AM=M+1 // 7735
A=A-1 // 7736
M=D // 7737
@30 // 7738
D=A // 7739
@SP // 7740
AM=M+1 // 7741
A=A-1 // 7742
M=D // 7743
@51 // 7744
D=A // 7745
@SP // 7746
AM=M+1 // 7747
A=A-1 // 7748
M=D // 7749
@51 // 7750
D=A // 7751
@SP // 7752
AM=M+1 // 7753
A=A-1 // 7754
M=D // 7755
@51 // 7756
D=A // 7757
@SP // 7758
AM=M+1 // 7759
A=A-1 // 7760
M=D // 7761
@51 // 7762
D=A // 7763
@SP // 7764
AM=M+1 // 7765
A=A-1 // 7766
M=D // 7767
@51 // 7768
D=A // 7769
@SP // 7770
AM=M+1 // 7771
A=A-1 // 7772
M=D // 7773
@51 // 7774
D=A // 7775
@SP // 7776
AM=M+1 // 7777
A=A-1 // 7778
M=D // 7779
@51 // 7780
D=A // 7781
@SP // 7782
AM=M+1 // 7783
A=A-1 // 7784
M=D // 7785
@30 // 7786
D=A // 7787
@SP // 7788
AM=M+1 // 7789
A=A-1 // 7790
M=D // 7791
@SP // 7792
AM=M+1 // 7793
A=A-1 // 7794
M=0 // 7795
@SP // 7796
AM=M+1 // 7797
A=A-1 // 7798
M=0 // 7799
// call Output.create
@17 // 7800
D=A // 7801
@14 // 7802
M=D // 7803
@Output.create // 7804
D=A // 7805
@13 // 7806
M=D // 7807
@Output.init.ret.49 // 7808
D=A // 7809
@CALL // 7810
0;JMP // 7811
(Output.init.ret.49)
@SP // 7812
M=M-1 // 7813

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 7814
D=A // 7815
@SP // 7816
AM=M+1 // 7817
A=A-1 // 7818
M=D // 7819
@31 // 7820
D=A // 7821
@SP // 7822
AM=M+1 // 7823
A=A-1 // 7824
M=D // 7825
@51 // 7826
D=A // 7827
@SP // 7828
AM=M+1 // 7829
A=A-1 // 7830
M=D // 7831
@51 // 7832
D=A // 7833
@SP // 7834
AM=M+1 // 7835
A=A-1 // 7836
M=D // 7837
@51 // 7838
D=A // 7839
@SP // 7840
AM=M+1 // 7841
A=A-1 // 7842
M=D // 7843
@31 // 7844
D=A // 7845
@SP // 7846
AM=M+1 // 7847
A=A-1 // 7848
M=D // 7849
@3 // 7850
D=A // 7851
@SP // 7852
AM=M+1 // 7853
A=A-1 // 7854
M=D // 7855
@3 // 7856
D=A // 7857
@SP // 7858
AM=M+1 // 7859
A=A-1 // 7860
M=D // 7861
@3 // 7862
D=A // 7863
@SP // 7864
AM=M+1 // 7865
A=A-1 // 7866
M=D // 7867
@3 // 7868
D=A // 7869
@SP // 7870
AM=M+1 // 7871
A=A-1 // 7872
M=D // 7873
@SP // 7874
AM=M+1 // 7875
A=A-1 // 7876
M=0 // 7877
@SP // 7878
AM=M+1 // 7879
A=A-1 // 7880
M=0 // 7881
// call Output.create
@17 // 7882
D=A // 7883
@14 // 7884
M=D // 7885
@Output.create // 7886
D=A // 7887
@13 // 7888
M=D // 7889
@Output.init.ret.50 // 7890
D=A // 7891
@CALL // 7892
0;JMP // 7893
(Output.init.ret.50)
@SP // 7894
M=M-1 // 7895

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 7896
D=A // 7897
@SP // 7898
AM=M+1 // 7899
A=A-1 // 7900
M=D // 7901
@30 // 7902
D=A // 7903
@SP // 7904
AM=M+1 // 7905
A=A-1 // 7906
M=D // 7907
@51 // 7908
D=A // 7909
@SP // 7910
AM=M+1 // 7911
A=A-1 // 7912
M=D // 7913
@51 // 7914
D=A // 7915
@SP // 7916
AM=M+1 // 7917
A=A-1 // 7918
M=D // 7919
@51 // 7920
D=A // 7921
@SP // 7922
AM=M+1 // 7923
A=A-1 // 7924
M=D // 7925
@51 // 7926
D=A // 7927
@SP // 7928
AM=M+1 // 7929
A=A-1 // 7930
M=D // 7931
@51 // 7932
D=A // 7933
@SP // 7934
AM=M+1 // 7935
A=A-1 // 7936
M=D // 7937
@63 // 7938
D=A // 7939
@SP // 7940
AM=M+1 // 7941
A=A-1 // 7942
M=D // 7943
@59 // 7944
D=A // 7945
@SP // 7946
AM=M+1 // 7947
A=A-1 // 7948
M=D // 7949
@30 // 7950
D=A // 7951
@SP // 7952
AM=M+1 // 7953
A=A-1 // 7954
M=D // 7955
@48 // 7956
D=A // 7957
@SP // 7958
AM=M+1 // 7959
A=A-1 // 7960
M=D // 7961
@SP // 7962
AM=M+1 // 7963
A=A-1 // 7964
M=0 // 7965
// call Output.create
@17 // 7966
D=A // 7967
@14 // 7968
M=D // 7969
@Output.create // 7970
D=A // 7971
@13 // 7972
M=D // 7973
@Output.init.ret.51 // 7974
D=A // 7975
@CALL // 7976
0;JMP // 7977
(Output.init.ret.51)
@SP // 7978
M=M-1 // 7979

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 7980
D=A // 7981
@SP // 7982
AM=M+1 // 7983
A=A-1 // 7984
M=D // 7985
@31 // 7986
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
@51 // 8004
D=A // 8005
@SP // 8006
AM=M+1 // 8007
A=A-1 // 8008
M=D // 8009
@31 // 8010
D=A // 8011
@SP // 8012
AM=M+1 // 8013
A=A-1 // 8014
M=D // 8015
@27 // 8016
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
@SP // 8040
AM=M+1 // 8041
A=A-1 // 8042
M=0 // 8043
@SP // 8044
AM=M+1 // 8045
A=A-1 // 8046
M=0 // 8047
// call Output.create
@17 // 8048
D=A // 8049
@14 // 8050
M=D // 8051
@Output.create // 8052
D=A // 8053
@13 // 8054
M=D // 8055
@Output.init.ret.52 // 8056
D=A // 8057
@CALL // 8058
0;JMP // 8059
(Output.init.ret.52)
@SP // 8060
M=M-1 // 8061

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8062
D=A // 8063
@SP // 8064
AM=M+1 // 8065
A=A-1 // 8066
M=D // 8067
@30 // 8068
D=A // 8069
@SP // 8070
AM=M+1 // 8071
A=A-1 // 8072
M=D // 8073
@51 // 8074
D=A // 8075
@SP // 8076
AM=M+1 // 8077
A=A-1 // 8078
M=D // 8079
@51 // 8080
D=A // 8081
@SP // 8082
AM=M+1 // 8083
A=A-1 // 8084
M=D // 8085
@6 // 8086
D=A // 8087
@SP // 8088
AM=M+1 // 8089
A=A-1 // 8090
M=D // 8091
@28 // 8092
D=A // 8093
@SP // 8094
AM=M+1 // 8095
A=A-1 // 8096
M=D // 8097
@48 // 8098
D=A // 8099
@SP // 8100
AM=M+1 // 8101
A=A-1 // 8102
M=D // 8103
@51 // 8104
D=A // 8105
@SP // 8106
AM=M+1 // 8107
A=A-1 // 8108
M=D // 8109
@51 // 8110
D=A // 8111
@SP // 8112
AM=M+1 // 8113
A=A-1 // 8114
M=D // 8115
@30 // 8116
D=A // 8117
@SP // 8118
AM=M+1 // 8119
A=A-1 // 8120
M=D // 8121
@SP // 8122
AM=M+1 // 8123
A=A-1 // 8124
M=0 // 8125
@SP // 8126
AM=M+1 // 8127
A=A-1 // 8128
M=0 // 8129
// call Output.create
@17 // 8130
D=A // 8131
@14 // 8132
M=D // 8133
@Output.create // 8134
D=A // 8135
@13 // 8136
M=D // 8137
@Output.init.ret.53 // 8138
D=A // 8139
@CALL // 8140
0;JMP // 8141
(Output.init.ret.53)
@SP // 8142
M=M-1 // 8143

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8144
D=A // 8145
@SP // 8146
AM=M+1 // 8147
A=A-1 // 8148
M=D // 8149
@63 // 8150
D=A // 8151
@SP // 8152
AM=M+1 // 8153
A=A-1 // 8154
M=D // 8155
@63 // 8156
D=A // 8157
@SP // 8158
AM=M+1 // 8159
A=A-1 // 8160
M=D // 8161
@45 // 8162
D=A // 8163
@SP // 8164
AM=M+1 // 8165
A=A-1 // 8166
M=D // 8167
@12 // 8168
D=A // 8169
@SP // 8170
AM=M+1 // 8171
A=A-1 // 8172
M=D // 8173
@12 // 8174
D=A // 8175
@SP // 8176
AM=M+1 // 8177
A=A-1 // 8178
M=D // 8179
@12 // 8180
D=A // 8181
@SP // 8182
AM=M+1 // 8183
A=A-1 // 8184
M=D // 8185
@12 // 8186
D=A // 8187
@SP // 8188
AM=M+1 // 8189
A=A-1 // 8190
M=D // 8191
@12 // 8192
D=A // 8193
@SP // 8194
AM=M+1 // 8195
A=A-1 // 8196
M=D // 8197
@30 // 8198
D=A // 8199
@SP // 8200
AM=M+1 // 8201
A=A-1 // 8202
M=D // 8203
@SP // 8204
AM=M+1 // 8205
A=A-1 // 8206
M=0 // 8207
@SP // 8208
AM=M+1 // 8209
A=A-1 // 8210
M=0 // 8211
// call Output.create
@17 // 8212
D=A // 8213
@14 // 8214
M=D // 8215
@Output.create // 8216
D=A // 8217
@13 // 8218
M=D // 8219
@Output.init.ret.54 // 8220
D=A // 8221
@CALL // 8222
0;JMP // 8223
(Output.init.ret.54)
@SP // 8224
M=M-1 // 8225

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8226
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
@51 // 8238
D=A // 8239
@SP // 8240
AM=M+1 // 8241
A=A-1 // 8242
M=D // 8243
@51 // 8244
D=A // 8245
@SP // 8246
AM=M+1 // 8247
A=A-1 // 8248
M=D // 8249
@51 // 8250
D=A // 8251
@SP // 8252
AM=M+1 // 8253
A=A-1 // 8254
M=D // 8255
@51 // 8256
D=A // 8257
@SP // 8258
AM=M+1 // 8259
A=A-1 // 8260
M=D // 8261
@51 // 8262
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
@51 // 8274
D=A // 8275
@SP // 8276
AM=M+1 // 8277
A=A-1 // 8278
M=D // 8279
@30 // 8280
D=A // 8281
@SP // 8282
AM=M+1 // 8283
A=A-1 // 8284
M=D // 8285
@SP // 8286
AM=M+1 // 8287
A=A-1 // 8288
M=0 // 8289
@SP // 8290
AM=M+1 // 8291
A=A-1 // 8292
M=0 // 8293
// call Output.create
@17 // 8294
D=A // 8295
@14 // 8296
M=D // 8297
@Output.create // 8298
D=A // 8299
@13 // 8300
M=D // 8301
@Output.init.ret.55 // 8302
D=A // 8303
@CALL // 8304
0;JMP // 8305
(Output.init.ret.55)
@SP // 8306
M=M-1 // 8307

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8308
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
@51 // 8320
D=A // 8321
@SP // 8322
AM=M+1 // 8323
A=A-1 // 8324
M=D // 8325
@51 // 8326
D=A // 8327
@SP // 8328
AM=M+1 // 8329
A=A-1 // 8330
M=D // 8331
@51 // 8332
D=A // 8333
@SP // 8334
AM=M+1 // 8335
A=A-1 // 8336
M=D // 8337
@51 // 8338
D=A // 8339
@SP // 8340
AM=M+1 // 8341
A=A-1 // 8342
M=D // 8343
@30 // 8344
D=A // 8345
@SP // 8346
AM=M+1 // 8347
A=A-1 // 8348
M=D // 8349
@30 // 8350
D=A // 8351
@SP // 8352
AM=M+1 // 8353
A=A-1 // 8354
M=D // 8355
@12 // 8356
D=A // 8357
@SP // 8358
AM=M+1 // 8359
A=A-1 // 8360
M=D // 8361
@12 // 8362
D=A // 8363
@SP // 8364
AM=M+1 // 8365
A=A-1 // 8366
M=D // 8367
@SP // 8368
AM=M+1 // 8369
A=A-1 // 8370
M=0 // 8371
@SP // 8372
AM=M+1 // 8373
A=A-1 // 8374
M=0 // 8375
// call Output.create
@17 // 8376
D=A // 8377
@14 // 8378
M=D // 8379
@Output.create // 8380
D=A // 8381
@13 // 8382
M=D // 8383
@Output.init.ret.56 // 8384
D=A // 8385
@CALL // 8386
0;JMP // 8387
(Output.init.ret.56)
@SP // 8388
M=M-1 // 8389

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8390
D=A // 8391
@SP // 8392
AM=M+1 // 8393
A=A-1 // 8394
M=D // 8395
@51 // 8396
D=A // 8397
@SP // 8398
AM=M+1 // 8399
A=A-1 // 8400
M=D // 8401
@51 // 8402
D=A // 8403
@SP // 8404
AM=M+1 // 8405
A=A-1 // 8406
M=D // 8407
@51 // 8408
D=A // 8409
@SP // 8410
AM=M+1 // 8411
A=A-1 // 8412
M=D // 8413
@51 // 8414
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
@63 // 8426
D=A // 8427
@SP // 8428
AM=M+1 // 8429
A=A-1 // 8430
M=D // 8431
@63 // 8432
D=A // 8433
@SP // 8434
AM=M+1 // 8435
A=A-1 // 8436
M=D // 8437
@63 // 8438
D=A // 8439
@SP // 8440
AM=M+1 // 8441
A=A-1 // 8442
M=D // 8443
@18 // 8444
D=A // 8445
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=D // 8449
@SP // 8450
AM=M+1 // 8451
A=A-1 // 8452
M=0 // 8453
@SP // 8454
AM=M+1 // 8455
A=A-1 // 8456
M=0 // 8457
// call Output.create
@17 // 8458
D=A // 8459
@14 // 8460
M=D // 8461
@Output.create // 8462
D=A // 8463
@13 // 8464
M=D // 8465
@Output.init.ret.57 // 8466
D=A // 8467
@CALL // 8468
0;JMP // 8469
(Output.init.ret.57)
@SP // 8470
M=M-1 // 8471

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8472
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
@30 // 8490
D=A // 8491
@SP // 8492
AM=M+1 // 8493
A=A-1 // 8494
M=D // 8495
@30 // 8496
D=A // 8497
@SP // 8498
AM=M+1 // 8499
A=A-1 // 8500
M=D // 8501
@12 // 8502
D=A // 8503
@SP // 8504
AM=M+1 // 8505
A=A-1 // 8506
M=D // 8507
@30 // 8508
D=A // 8509
@SP // 8510
AM=M+1 // 8511
A=A-1 // 8512
M=D // 8513
@30 // 8514
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
@51 // 8526
D=A // 8527
@SP // 8528
AM=M+1 // 8529
A=A-1 // 8530
M=D // 8531
@SP // 8532
AM=M+1 // 8533
A=A-1 // 8534
M=0 // 8535
@SP // 8536
AM=M+1 // 8537
A=A-1 // 8538
M=0 // 8539
// call Output.create
@17 // 8540
D=A // 8541
@14 // 8542
M=D // 8543
@Output.create // 8544
D=A // 8545
@13 // 8546
M=D // 8547
@Output.init.ret.58 // 8548
D=A // 8549
@CALL // 8550
0;JMP // 8551
(Output.init.ret.58)
@SP // 8552
M=M-1 // 8553

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8554
D=A // 8555
@SP // 8556
AM=M+1 // 8557
A=A-1 // 8558
M=D // 8559
@51 // 8560
D=A // 8561
@SP // 8562
AM=M+1 // 8563
A=A-1 // 8564
M=D // 8565
@51 // 8566
D=A // 8567
@SP // 8568
AM=M+1 // 8569
A=A-1 // 8570
M=D // 8571
@51 // 8572
D=A // 8573
@SP // 8574
AM=M+1 // 8575
A=A-1 // 8576
M=D // 8577
@51 // 8578
D=A // 8579
@SP // 8580
AM=M+1 // 8581
A=A-1 // 8582
M=D // 8583
@30 // 8584
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
@12 // 8602
D=A // 8603
@SP // 8604
AM=M+1 // 8605
A=A-1 // 8606
M=D // 8607
@30 // 8608
D=A // 8609
@SP // 8610
AM=M+1 // 8611
A=A-1 // 8612
M=D // 8613
@SP // 8614
AM=M+1 // 8615
A=A-1 // 8616
M=0 // 8617
@SP // 8618
AM=M+1 // 8619
A=A-1 // 8620
M=0 // 8621
// call Output.create
@17 // 8622
D=A // 8623
@14 // 8624
M=D // 8625
@Output.create // 8626
D=A // 8627
@13 // 8628
M=D // 8629
@Output.init.ret.59 // 8630
D=A // 8631
@CALL // 8632
0;JMP // 8633
(Output.init.ret.59)
@SP // 8634
M=M-1 // 8635

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8636
D=A // 8637
@SP // 8638
AM=M+1 // 8639
A=A-1 // 8640
M=D // 8641
@63 // 8642
D=A // 8643
@SP // 8644
AM=M+1 // 8645
A=A-1 // 8646
M=D // 8647
@51 // 8648
D=A // 8649
@SP // 8650
AM=M+1 // 8651
A=A-1 // 8652
M=D // 8653
@49 // 8654
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
@12 // 8666
D=A // 8667
@SP // 8668
AM=M+1 // 8669
A=A-1 // 8670
M=D // 8671
@6 // 8672
D=A // 8673
@SP // 8674
AM=M+1 // 8675
A=A-1 // 8676
M=D // 8677
@35 // 8678
D=A // 8679
@SP // 8680
AM=M+1 // 8681
A=A-1 // 8682
M=D // 8683
@51 // 8684
D=A // 8685
@SP // 8686
AM=M+1 // 8687
A=A-1 // 8688
M=D // 8689
@63 // 8690
D=A // 8691
@SP // 8692
AM=M+1 // 8693
A=A-1 // 8694
M=D // 8695
@SP // 8696
AM=M+1 // 8697
A=A-1 // 8698
M=0 // 8699
@SP // 8700
AM=M+1 // 8701
A=A-1 // 8702
M=0 // 8703
// call Output.create
@17 // 8704
D=A // 8705
@14 // 8706
M=D // 8707
@Output.create // 8708
D=A // 8709
@13 // 8710
M=D // 8711
@Output.init.ret.60 // 8712
D=A // 8713
@CALL // 8714
0;JMP // 8715
(Output.init.ret.60)
@SP // 8716
M=M-1 // 8717

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8718
D=A // 8719
@SP // 8720
AM=M+1 // 8721
A=A-1 // 8722
M=D // 8723
@30 // 8724
D=A // 8725
@SP // 8726
AM=M+1 // 8727
A=A-1 // 8728
M=D // 8729
@6 // 8730
D=A // 8731
@SP // 8732
AM=M+1 // 8733
A=A-1 // 8734
M=D // 8735
@6 // 8736
D=A // 8737
@SP // 8738
AM=M+1 // 8739
A=A-1 // 8740
M=D // 8741
@6 // 8742
D=A // 8743
@SP // 8744
AM=M+1 // 8745
A=A-1 // 8746
M=D // 8747
@6 // 8748
D=A // 8749
@SP // 8750
AM=M+1 // 8751
A=A-1 // 8752
M=D // 8753
@6 // 8754
D=A // 8755
@SP // 8756
AM=M+1 // 8757
A=A-1 // 8758
M=D // 8759
@6 // 8760
D=A // 8761
@SP // 8762
AM=M+1 // 8763
A=A-1 // 8764
M=D // 8765
@6 // 8766
D=A // 8767
@SP // 8768
AM=M+1 // 8769
A=A-1 // 8770
M=D // 8771
@30 // 8772
D=A // 8773
@SP // 8774
AM=M+1 // 8775
A=A-1 // 8776
M=D // 8777
@SP // 8778
AM=M+1 // 8779
A=A-1 // 8780
M=0 // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=0 // 8785
// call Output.create
@17 // 8786
D=A // 8787
@14 // 8788
M=D // 8789
@Output.create // 8790
D=A // 8791
@13 // 8792
M=D // 8793
@Output.init.ret.61 // 8794
D=A // 8795
@CALL // 8796
0;JMP // 8797
(Output.init.ret.61)
@SP // 8798
M=M-1 // 8799

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8800
D=A // 8801
@SP // 8802
M=D+M // 8803
@92 // 8804
D=A // 8805
@SP // 8806
A=M-1 // 8807
M=1 // 8808
A=A-1 // 8809
M=0 // 8810
A=A-1 // 8811
M=0 // 8812
A=A-1 // 8813
M=D // 8814
A=A-1 // 8815
@3 // 8816
D=A // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=D // 8821
@6 // 8822
D=A // 8823
@SP // 8824
AM=M+1 // 8825
A=A-1 // 8826
M=D // 8827
@12 // 8828
D=A // 8829
@SP // 8830
AM=M+1 // 8831
A=A-1 // 8832
M=D // 8833
@24 // 8834
D=A // 8835
@SP // 8836
AM=M+1 // 8837
A=A-1 // 8838
M=D // 8839
@48 // 8840
D=A // 8841
@SP // 8842
AM=M+1 // 8843
A=A-1 // 8844
M=D // 8845
@32 // 8846
D=A // 8847
@SP // 8848
AM=M+1 // 8849
A=A-1 // 8850
M=D // 8851
@SP // 8852
AM=M+1 // 8853
A=A-1 // 8854
M=0 // 8855
@SP // 8856
AM=M+1 // 8857
A=A-1 // 8858
M=0 // 8859
// call Output.create
@17 // 8860
D=A // 8861
@14 // 8862
M=D // 8863
@Output.create // 8864
D=A // 8865
@13 // 8866
M=D // 8867
@Output.init.ret.62 // 8868
D=A // 8869
@CALL // 8870
0;JMP // 8871
(Output.init.ret.62)
@SP // 8872
M=M-1 // 8873

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 8874
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
@24 // 8886
D=A // 8887
@SP // 8888
AM=M+1 // 8889
A=A-1 // 8890
M=D // 8891
@24 // 8892
D=A // 8893
@SP // 8894
AM=M+1 // 8895
A=A-1 // 8896
M=D // 8897
@24 // 8898
D=A // 8899
@SP // 8900
AM=M+1 // 8901
A=A-1 // 8902
M=D // 8903
@24 // 8904
D=A // 8905
@SP // 8906
AM=M+1 // 8907
A=A-1 // 8908
M=D // 8909
@24 // 8910
D=A // 8911
@SP // 8912
AM=M+1 // 8913
A=A-1 // 8914
M=D // 8915
@24 // 8916
D=A // 8917
@SP // 8918
AM=M+1 // 8919
A=A-1 // 8920
M=D // 8921
@24 // 8922
D=A // 8923
@SP // 8924
AM=M+1 // 8925
A=A-1 // 8926
M=D // 8927
@30 // 8928
D=A // 8929
@SP // 8930
AM=M+1 // 8931
A=A-1 // 8932
M=D // 8933
@SP // 8934
AM=M+1 // 8935
A=A-1 // 8936
M=0 // 8937
@SP // 8938
AM=M+1 // 8939
A=A-1 // 8940
M=0 // 8941
// call Output.create
@17 // 8942
D=A // 8943
@14 // 8944
M=D // 8945
@Output.create // 8946
D=A // 8947
@13 // 8948
M=D // 8949
@Output.init.ret.63 // 8950
D=A // 8951
@CALL // 8952
0;JMP // 8953
(Output.init.ret.63)
@SP // 8954
M=M-1 // 8955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 8956
D=A // 8957
@SP // 8958
AM=M+1 // 8959
A=A-1 // 8960
M=D // 8961
@8 // 8962
D=A // 8963
@SP // 8964
AM=M+1 // 8965
A=A-1 // 8966
M=D // 8967
@28 // 8968
D=A // 8969
@SP // 8970
AM=M+1 // 8971
A=A-1 // 8972
M=D // 8973
@54 // 8974
D=A // 8975
@SP // 8976
AM=M+1 // 8977
A=A-1 // 8978
M=D // 8979
@SP // 8980
AM=M+1 // 8981
A=A-1 // 8982
M=0 // 8983
@SP // 8984
AM=M+1 // 8985
A=A-1 // 8986
M=0 // 8987
@SP // 8988
AM=M+1 // 8989
A=A-1 // 8990
M=0 // 8991
@SP // 8992
AM=M+1 // 8993
A=A-1 // 8994
M=0 // 8995
@SP // 8996
AM=M+1 // 8997
A=A-1 // 8998
M=0 // 8999
@SP // 9000
AM=M+1 // 9001
A=A-1 // 9002
M=0 // 9003
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
@Output.init.ret.64 // 9020
D=A // 9021
@CALL // 9022
0;JMP // 9023
(Output.init.ret.64)
@SP // 9024
M=M-1 // 9025

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9026
D=A // 9027
@SP // 9028
M=D+M // 9029
@95 // 9030
D=A // 9031
@SP // 9032
A=M-1 // 9033
M=0 // 9034
A=A-1 // 9035
M=0 // 9036
A=A-1 // 9037
M=0 // 9038
A=A-1 // 9039
M=0 // 9040
A=A-1 // 9041
M=0 // 9042
A=A-1 // 9043
M=0 // 9044
A=A-1 // 9045
M=0 // 9046
A=A-1 // 9047
M=0 // 9048
A=A-1 // 9049
M=0 // 9050
A=A-1 // 9051
M=D // 9052
A=A-1 // 9053
@2 // 9054
D=A // 9055
@SP // 9056
M=D+M // 9057
@63 // 9058
D=A // 9059
@SP // 9060
A=M-1 // 9061
M=0 // 9062
A=A-1 // 9063
M=D // 9064
A=A-1 // 9065
// call Output.create
@17 // 9066
D=A // 9067
@14 // 9068
M=D // 9069
@Output.create // 9070
D=A // 9071
@13 // 9072
M=D // 9073
@Output.init.ret.65 // 9074
D=A // 9075
@CALL // 9076
0;JMP // 9077
(Output.init.ret.65)
@SP // 9078
M=M-1 // 9079

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9080
D=A // 9081
@SP // 9082
AM=M+1 // 9083
A=A-1 // 9084
M=D // 9085
@6 // 9086
D=A // 9087
@SP // 9088
AM=M+1 // 9089
A=A-1 // 9090
M=D // 9091
@12 // 9092
D=A // 9093
@SP // 9094
AM=M+1 // 9095
A=A-1 // 9096
M=D // 9097
@24 // 9098
D=A // 9099
@SP // 9100
AM=M+1 // 9101
A=A-1 // 9102
M=D // 9103
@SP // 9104
AM=M+1 // 9105
A=A-1 // 9106
M=0 // 9107
@SP // 9108
AM=M+1 // 9109
A=A-1 // 9110
M=0 // 9111
@SP // 9112
AM=M+1 // 9113
A=A-1 // 9114
M=0 // 9115
@SP // 9116
AM=M+1 // 9117
A=A-1 // 9118
M=0 // 9119
@SP // 9120
AM=M+1 // 9121
A=A-1 // 9122
M=0 // 9123
@SP // 9124
AM=M+1 // 9125
A=A-1 // 9126
M=0 // 9127
@SP // 9128
AM=M+1 // 9129
A=A-1 // 9130
M=0 // 9131
@SP // 9132
AM=M+1 // 9133
A=A-1 // 9134
M=0 // 9135
// call Output.create
@17 // 9136
D=A // 9137
@14 // 9138
M=D // 9139
@Output.create // 9140
D=A // 9141
@13 // 9142
M=D // 9143
@Output.init.ret.66 // 9144
D=A // 9145
@CALL // 9146
0;JMP // 9147
(Output.init.ret.66)
@SP // 9148
M=M-1 // 9149

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9150
D=A // 9151
@SP // 9152
M=D+M // 9153
@97 // 9154
D=A // 9155
@SP // 9156
A=M-1 // 9157
M=0 // 9158
A=A-1 // 9159
M=0 // 9160
A=A-1 // 9161
M=0 // 9162
A=A-1 // 9163
M=D // 9164
A=A-1 // 9165
@14 // 9166
D=A // 9167
@SP // 9168
AM=M+1 // 9169
A=A-1 // 9170
M=D // 9171
@24 // 9172
D=A // 9173
@SP // 9174
AM=M+1 // 9175
A=A-1 // 9176
M=D // 9177
@30 // 9178
D=A // 9179
@SP // 9180
AM=M+1 // 9181
A=A-1 // 9182
M=D // 9183
@27 // 9184
D=A // 9185
@SP // 9186
AM=M+1 // 9187
A=A-1 // 9188
M=D // 9189
@27 // 9190
D=A // 9191
@SP // 9192
AM=M+1 // 9193
A=A-1 // 9194
M=D // 9195
@54 // 9196
D=A // 9197
@SP // 9198
AM=M+1 // 9199
A=A-1 // 9200
M=D // 9201
@SP // 9202
AM=M+1 // 9203
A=A-1 // 9204
M=0 // 9205
@SP // 9206
AM=M+1 // 9207
A=A-1 // 9208
M=0 // 9209
// call Output.create
@17 // 9210
D=A // 9211
@14 // 9212
M=D // 9213
@Output.create // 9214
D=A // 9215
@13 // 9216
M=D // 9217
@Output.init.ret.67 // 9218
D=A // 9219
@CALL // 9220
0;JMP // 9221
(Output.init.ret.67)
@SP // 9222
M=M-1 // 9223

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9224
D=A // 9225
@SP // 9226
AM=M+1 // 9227
A=A-1 // 9228
M=D // 9229
@3 // 9230
D=A // 9231
@SP // 9232
AM=M+1 // 9233
A=A-1 // 9234
M=D // 9235
@3 // 9236
D=A // 9237
@SP // 9238
AM=M+1 // 9239
A=A-1 // 9240
M=D // 9241
@3 // 9242
D=A // 9243
@SP // 9244
AM=M+1 // 9245
A=A-1 // 9246
M=D // 9247
@15 // 9248
D=A // 9249
@SP // 9250
AM=M+1 // 9251
A=A-1 // 9252
M=D // 9253
@27 // 9254
D=A // 9255
@SP // 9256
AM=M+1 // 9257
A=A-1 // 9258
M=D // 9259
@51 // 9260
D=A // 9261
@SP // 9262
AM=M+1 // 9263
A=A-1 // 9264
M=D // 9265
@51 // 9266
D=A // 9267
@SP // 9268
AM=M+1 // 9269
A=A-1 // 9270
M=D // 9271
@51 // 9272
D=A // 9273
@SP // 9274
AM=M+1 // 9275
A=A-1 // 9276
M=D // 9277
@30 // 9278
D=A // 9279
@SP // 9280
AM=M+1 // 9281
A=A-1 // 9282
M=D // 9283
@SP // 9284
AM=M+1 // 9285
A=A-1 // 9286
M=0 // 9287
@SP // 9288
AM=M+1 // 9289
A=A-1 // 9290
M=0 // 9291
// call Output.create
@17 // 9292
D=A // 9293
@14 // 9294
M=D // 9295
@Output.create // 9296
D=A // 9297
@13 // 9298
M=D // 9299
@Output.init.ret.68 // 9300
D=A // 9301
@CALL // 9302
0;JMP // 9303
(Output.init.ret.68)
@SP // 9304
M=M-1 // 9305

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9306
D=A // 9307
@SP // 9308
M=D+M // 9309
@99 // 9310
D=A // 9311
@SP // 9312
A=M-1 // 9313
M=0 // 9314
A=A-1 // 9315
M=0 // 9316
A=A-1 // 9317
M=0 // 9318
A=A-1 // 9319
M=D // 9320
A=A-1 // 9321
@30 // 9322
D=A // 9323
@SP // 9324
AM=M+1 // 9325
A=A-1 // 9326
M=D // 9327
@51 // 9328
D=A // 9329
@SP // 9330
AM=M+1 // 9331
A=A-1 // 9332
M=D // 9333
@3 // 9334
D=A // 9335
@SP // 9336
AM=M+1 // 9337
A=A-1 // 9338
M=D // 9339
@3 // 9340
D=A // 9341
@SP // 9342
AM=M+1 // 9343
A=A-1 // 9344
M=D // 9345
@51 // 9346
D=A // 9347
@SP // 9348
AM=M+1 // 9349
A=A-1 // 9350
M=D // 9351
@30 // 9352
D=A // 9353
@SP // 9354
AM=M+1 // 9355
A=A-1 // 9356
M=D // 9357
@SP // 9358
AM=M+1 // 9359
A=A-1 // 9360
M=0 // 9361
@SP // 9362
AM=M+1 // 9363
A=A-1 // 9364
M=0 // 9365
// call Output.create
@17 // 9366
D=A // 9367
@14 // 9368
M=D // 9369
@Output.create // 9370
D=A // 9371
@13 // 9372
M=D // 9373
@Output.init.ret.69 // 9374
D=A // 9375
@CALL // 9376
0;JMP // 9377
(Output.init.ret.69)
@SP // 9378
M=M-1 // 9379

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9380
D=A // 9381
@SP // 9382
AM=M+1 // 9383
A=A-1 // 9384
M=D // 9385
@48 // 9386
D=A // 9387
@SP // 9388
AM=M+1 // 9389
A=A-1 // 9390
M=D // 9391
@48 // 9392
D=A // 9393
@SP // 9394
AM=M+1 // 9395
A=A-1 // 9396
M=D // 9397
@48 // 9398
D=A // 9399
@SP // 9400
AM=M+1 // 9401
A=A-1 // 9402
M=D // 9403
@60 // 9404
D=A // 9405
@SP // 9406
AM=M+1 // 9407
A=A-1 // 9408
M=D // 9409
@54 // 9410
D=A // 9411
@SP // 9412
AM=M+1 // 9413
A=A-1 // 9414
M=D // 9415
@51 // 9416
D=A // 9417
@SP // 9418
AM=M+1 // 9419
A=A-1 // 9420
M=D // 9421
@51 // 9422
D=A // 9423
@SP // 9424
AM=M+1 // 9425
A=A-1 // 9426
M=D // 9427
@51 // 9428
D=A // 9429
@SP // 9430
AM=M+1 // 9431
A=A-1 // 9432
M=D // 9433
@30 // 9434
D=A // 9435
@SP // 9436
AM=M+1 // 9437
A=A-1 // 9438
M=D // 9439
@SP // 9440
AM=M+1 // 9441
A=A-1 // 9442
M=0 // 9443
@SP // 9444
AM=M+1 // 9445
A=A-1 // 9446
M=0 // 9447
// call Output.create
@17 // 9448
D=A // 9449
@14 // 9450
M=D // 9451
@Output.create // 9452
D=A // 9453
@13 // 9454
M=D // 9455
@Output.init.ret.70 // 9456
D=A // 9457
@CALL // 9458
0;JMP // 9459
(Output.init.ret.70)
@SP // 9460
M=M-1 // 9461

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9462
D=A // 9463
@SP // 9464
M=D+M // 9465
@101 // 9466
D=A // 9467
@SP // 9468
A=M-1 // 9469
M=0 // 9470
A=A-1 // 9471
M=0 // 9472
A=A-1 // 9473
M=0 // 9474
A=A-1 // 9475
M=D // 9476
A=A-1 // 9477
@30 // 9478
D=A // 9479
@SP // 9480
AM=M+1 // 9481
A=A-1 // 9482
M=D // 9483
@51 // 9484
D=A // 9485
@SP // 9486
AM=M+1 // 9487
A=A-1 // 9488
M=D // 9489
@63 // 9490
D=A // 9491
@SP // 9492
AM=M+1 // 9493
A=A-1 // 9494
M=D // 9495
@3 // 9496
D=A // 9497
@SP // 9498
AM=M+1 // 9499
A=A-1 // 9500
M=D // 9501
@51 // 9502
D=A // 9503
@SP // 9504
AM=M+1 // 9505
A=A-1 // 9506
M=D // 9507
@30 // 9508
D=A // 9509
@SP // 9510
AM=M+1 // 9511
A=A-1 // 9512
M=D // 9513
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
@Output.init.ret.71 // 9530
D=A // 9531
@CALL // 9532
0;JMP // 9533
(Output.init.ret.71)
@SP // 9534
M=M-1 // 9535

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9536
D=A // 9537
@SP // 9538
AM=M+1 // 9539
A=A-1 // 9540
M=D // 9541
@28 // 9542
D=A // 9543
@SP // 9544
AM=M+1 // 9545
A=A-1 // 9546
M=D // 9547
@54 // 9548
D=A // 9549
@SP // 9550
AM=M+1 // 9551
A=A-1 // 9552
M=D // 9553
@38 // 9554
D=A // 9555
@SP // 9556
AM=M+1 // 9557
A=A-1 // 9558
M=D // 9559
@6 // 9560
D=A // 9561
@SP // 9562
AM=M+1 // 9563
A=A-1 // 9564
M=D // 9565
@15 // 9566
D=A // 9567
@SP // 9568
AM=M+1 // 9569
A=A-1 // 9570
M=D // 9571
@6 // 9572
D=A // 9573
@SP // 9574
AM=M+1 // 9575
A=A-1 // 9576
M=D // 9577
@6 // 9578
D=A // 9579
@SP // 9580
AM=M+1 // 9581
A=A-1 // 9582
M=D // 9583
@6 // 9584
D=A // 9585
@SP // 9586
AM=M+1 // 9587
A=A-1 // 9588
M=D // 9589
@15 // 9590
D=A // 9591
@SP // 9592
AM=M+1 // 9593
A=A-1 // 9594
M=D // 9595
@SP // 9596
AM=M+1 // 9597
A=A-1 // 9598
M=0 // 9599
@SP // 9600
AM=M+1 // 9601
A=A-1 // 9602
M=0 // 9603
// call Output.create
@17 // 9604
D=A // 9605
@14 // 9606
M=D // 9607
@Output.create // 9608
D=A // 9609
@13 // 9610
M=D // 9611
@Output.init.ret.72 // 9612
D=A // 9613
@CALL // 9614
0;JMP // 9615
(Output.init.ret.72)
@SP // 9616
M=M-1 // 9617

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9618
D=A // 9619
@SP // 9620
M=D+M // 9621
@103 // 9622
D=A // 9623
@SP // 9624
A=M-1 // 9625
M=0 // 9626
A=A-1 // 9627
M=0 // 9628
A=A-1 // 9629
M=D // 9630
A=A-1 // 9631
@30 // 9632
D=A // 9633
@SP // 9634
AM=M+1 // 9635
A=A-1 // 9636
M=D // 9637
@51 // 9638
D=A // 9639
@SP // 9640
AM=M+1 // 9641
A=A-1 // 9642
M=D // 9643
@51 // 9644
D=A // 9645
@SP // 9646
AM=M+1 // 9647
A=A-1 // 9648
M=D // 9649
@51 // 9650
D=A // 9651
@SP // 9652
AM=M+1 // 9653
A=A-1 // 9654
M=D // 9655
@62 // 9656
D=A // 9657
@SP // 9658
AM=M+1 // 9659
A=A-1 // 9660
M=D // 9661
@48 // 9662
D=A // 9663
@SP // 9664
AM=M+1 // 9665
A=A-1 // 9666
M=D // 9667
@51 // 9668
D=A // 9669
@SP // 9670
AM=M+1 // 9671
A=A-1 // 9672
M=D // 9673
@30 // 9674
D=A // 9675
@SP // 9676
AM=M+1 // 9677
A=A-1 // 9678
M=D // 9679
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
@Output.init.ret.73 // 9692
D=A // 9693
@CALL // 9694
0;JMP // 9695
(Output.init.ret.73)
@SP // 9696
M=M-1 // 9697

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9698
D=A // 9699
@SP // 9700
AM=M+1 // 9701
A=A-1 // 9702
M=D // 9703
@3 // 9704
D=A // 9705
@SP // 9706
AM=M+1 // 9707
A=A-1 // 9708
M=D // 9709
@3 // 9710
D=A // 9711
@SP // 9712
AM=M+1 // 9713
A=A-1 // 9714
M=D // 9715
@3 // 9716
D=A // 9717
@SP // 9718
AM=M+1 // 9719
A=A-1 // 9720
M=D // 9721
@27 // 9722
D=A // 9723
@SP // 9724
AM=M+1 // 9725
A=A-1 // 9726
M=D // 9727
@55 // 9728
D=A // 9729
@SP // 9730
AM=M+1 // 9731
A=A-1 // 9732
M=D // 9733
@51 // 9734
D=A // 9735
@SP // 9736
AM=M+1 // 9737
A=A-1 // 9738
M=D // 9739
@51 // 9740
D=A // 9741
@SP // 9742
AM=M+1 // 9743
A=A-1 // 9744
M=D // 9745
@51 // 9746
D=A // 9747
@SP // 9748
AM=M+1 // 9749
A=A-1 // 9750
M=D // 9751
@51 // 9752
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
@Output.init.ret.74 // 9774
D=A // 9775
@CALL // 9776
0;JMP // 9777
(Output.init.ret.74)
@SP // 9778
M=M-1 // 9779

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9780
D=A // 9781
@SP // 9782
AM=M+1 // 9783
A=A-1 // 9784
M=D // 9785
@12 // 9786
D=A // 9787
@SP // 9788
AM=M+1 // 9789
A=A-1 // 9790
M=D // 9791
@12 // 9792
D=A // 9793
@SP // 9794
AM=M+1 // 9795
A=A-1 // 9796
M=D // 9797
@SP // 9798
AM=M+1 // 9799
A=A-1 // 9800
M=0 // 9801
@14 // 9802
D=A // 9803
@SP // 9804
AM=M+1 // 9805
A=A-1 // 9806
M=D // 9807
@12 // 9808
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
@12 // 9826
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
@SP // 9838
AM=M+1 // 9839
A=A-1 // 9840
M=0 // 9841
@SP // 9842
AM=M+1 // 9843
A=A-1 // 9844
M=0 // 9845
// call Output.create
@17 // 9846
D=A // 9847
@14 // 9848
M=D // 9849
@Output.create // 9850
D=A // 9851
@13 // 9852
M=D // 9853
@Output.init.ret.75 // 9854
D=A // 9855
@CALL // 9856
0;JMP // 9857
(Output.init.ret.75)
@SP // 9858
M=M-1 // 9859

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 9860
D=A // 9861
@SP // 9862
AM=M+1 // 9863
A=A-1 // 9864
M=D // 9865
@48 // 9866
D=A // 9867
@SP // 9868
AM=M+1 // 9869
A=A-1 // 9870
M=D // 9871
@48 // 9872
D=A // 9873
@SP // 9874
AM=M+1 // 9875
A=A-1 // 9876
M=D // 9877
@SP // 9878
AM=M+1 // 9879
A=A-1 // 9880
M=0 // 9881
@56 // 9882
D=A // 9883
@SP // 9884
AM=M+1 // 9885
A=A-1 // 9886
M=D // 9887
@48 // 9888
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
@48 // 9906
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
@30 // 9918
D=A // 9919
@SP // 9920
AM=M+1 // 9921
A=A-1 // 9922
M=D // 9923
@SP // 9924
AM=M+1 // 9925
A=A-1 // 9926
M=0 // 9927
// call Output.create
@17 // 9928
D=A // 9929
@14 // 9930
M=D // 9931
@Output.create // 9932
D=A // 9933
@13 // 9934
M=D // 9935
@Output.init.ret.76 // 9936
D=A // 9937
@CALL // 9938
0;JMP // 9939
(Output.init.ret.76)
@SP // 9940
M=M-1 // 9941

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 9942
D=A // 9943
@SP // 9944
AM=M+1 // 9945
A=A-1 // 9946
M=D // 9947
@3 // 9948
D=A // 9949
@SP // 9950
AM=M+1 // 9951
A=A-1 // 9952
M=D // 9953
@3 // 9954
D=A // 9955
@SP // 9956
AM=M+1 // 9957
A=A-1 // 9958
M=D // 9959
@3 // 9960
D=A // 9961
@SP // 9962
AM=M+1 // 9963
A=A-1 // 9964
M=D // 9965
@51 // 9966
D=A // 9967
@SP // 9968
AM=M+1 // 9969
A=A-1 // 9970
M=D // 9971
@27 // 9972
D=A // 9973
@SP // 9974
AM=M+1 // 9975
A=A-1 // 9976
M=D // 9977
@15 // 9978
D=A // 9979
@SP // 9980
AM=M+1 // 9981
A=A-1 // 9982
M=D // 9983
@15 // 9984
D=A // 9985
@SP // 9986
AM=M+1 // 9987
A=A-1 // 9988
M=D // 9989
@27 // 9990
D=A // 9991
@SP // 9992
AM=M+1 // 9993
A=A-1 // 9994
M=D // 9995
@51 // 9996
D=A // 9997
@SP // 9998
AM=M+1 // 9999
A=A-1 // 10000
M=D // 10001
@SP // 10002
AM=M+1 // 10003
A=A-1 // 10004
M=0 // 10005
@SP // 10006
AM=M+1 // 10007
A=A-1 // 10008
M=0 // 10009
// call Output.create
@17 // 10010
D=A // 10011
@14 // 10012
M=D // 10013
@Output.create // 10014
D=A // 10015
@13 // 10016
M=D // 10017
@Output.init.ret.77 // 10018
D=A // 10019
@CALL // 10020
0;JMP // 10021
(Output.init.ret.77)
@SP // 10022
M=M-1 // 10023

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10024
D=A // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=D // 10029
@14 // 10030
D=A // 10031
@SP // 10032
AM=M+1 // 10033
A=A-1 // 10034
M=D // 10035
@12 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041
@12 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047
@12 // 10048
D=A // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=D // 10053
@12 // 10054
D=A // 10055
@SP // 10056
AM=M+1 // 10057
A=A-1 // 10058
M=D // 10059
@12 // 10060
D=A // 10061
@SP // 10062
AM=M+1 // 10063
A=A-1 // 10064
M=D // 10065
@12 // 10066
D=A // 10067
@SP // 10068
AM=M+1 // 10069
A=A-1 // 10070
M=D // 10071
@12 // 10072
D=A // 10073
@SP // 10074
AM=M+1 // 10075
A=A-1 // 10076
M=D // 10077
@30 // 10078
D=A // 10079
@SP // 10080
AM=M+1 // 10081
A=A-1 // 10082
M=D // 10083
@SP // 10084
AM=M+1 // 10085
A=A-1 // 10086
M=0 // 10087
@SP // 10088
AM=M+1 // 10089
A=A-1 // 10090
M=0 // 10091
// call Output.create
@17 // 10092
D=A // 10093
@14 // 10094
M=D // 10095
@Output.create // 10096
D=A // 10097
@13 // 10098
M=D // 10099
@Output.init.ret.78 // 10100
D=A // 10101
@CALL // 10102
0;JMP // 10103
(Output.init.ret.78)
@SP // 10104
M=M-1 // 10105

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10106
D=A // 10107
@SP // 10108
M=D+M // 10109
@109 // 10110
D=A // 10111
@SP // 10112
A=M-1 // 10113
M=0 // 10114
A=A-1 // 10115
M=0 // 10116
A=A-1 // 10117
M=0 // 10118
A=A-1 // 10119
M=D // 10120
A=A-1 // 10121
@29 // 10122
D=A // 10123
@SP // 10124
AM=M+1 // 10125
A=A-1 // 10126
M=D // 10127
@63 // 10128
D=A // 10129
@SP // 10130
AM=M+1 // 10131
A=A-1 // 10132
M=D // 10133
@43 // 10134
D=A // 10135
@SP // 10136
AM=M+1 // 10137
A=A-1 // 10138
M=D // 10139
@43 // 10140
D=A // 10141
@SP // 10142
AM=M+1 // 10143
A=A-1 // 10144
M=D // 10145
@43 // 10146
D=A // 10147
@SP // 10148
AM=M+1 // 10149
A=A-1 // 10150
M=D // 10151
@43 // 10152
D=A // 10153
@SP // 10154
AM=M+1 // 10155
A=A-1 // 10156
M=D // 10157
@SP // 10158
AM=M+1 // 10159
A=A-1 // 10160
M=0 // 10161
@SP // 10162
AM=M+1 // 10163
A=A-1 // 10164
M=0 // 10165
// call Output.create
@17 // 10166
D=A // 10167
@14 // 10168
M=D // 10169
@Output.create // 10170
D=A // 10171
@13 // 10172
M=D // 10173
@Output.init.ret.79 // 10174
D=A // 10175
@CALL // 10176
0;JMP // 10177
(Output.init.ret.79)
@SP // 10178
M=M-1 // 10179

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10180
D=A // 10181
@SP // 10182
M=D+M // 10183
@110 // 10184
D=A // 10185
@SP // 10186
A=M-1 // 10187
M=0 // 10188
A=A-1 // 10189
M=0 // 10190
A=A-1 // 10191
M=0 // 10192
A=A-1 // 10193
M=D // 10194
A=A-1 // 10195
@29 // 10196
D=A // 10197
@SP // 10198
AM=M+1 // 10199
A=A-1 // 10200
M=D // 10201
@51 // 10202
D=A // 10203
@SP // 10204
AM=M+1 // 10205
A=A-1 // 10206
M=D // 10207
@51 // 10208
D=A // 10209
@SP // 10210
AM=M+1 // 10211
A=A-1 // 10212
M=D // 10213
@51 // 10214
D=A // 10215
@SP // 10216
AM=M+1 // 10217
A=A-1 // 10218
M=D // 10219
@51 // 10220
D=A // 10221
@SP // 10222
AM=M+1 // 10223
A=A-1 // 10224
M=D // 10225
@51 // 10226
D=A // 10227
@SP // 10228
AM=M+1 // 10229
A=A-1 // 10230
M=D // 10231
@SP // 10232
AM=M+1 // 10233
A=A-1 // 10234
M=0 // 10235
@SP // 10236
AM=M+1 // 10237
A=A-1 // 10238
M=0 // 10239
// call Output.create
@17 // 10240
D=A // 10241
@14 // 10242
M=D // 10243
@Output.create // 10244
D=A // 10245
@13 // 10246
M=D // 10247
@Output.init.ret.80 // 10248
D=A // 10249
@CALL // 10250
0;JMP // 10251
(Output.init.ret.80)
@SP // 10252
M=M-1 // 10253

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10254
D=A // 10255
@SP // 10256
M=D+M // 10257
@111 // 10258
D=A // 10259
@SP // 10260
A=M-1 // 10261
M=0 // 10262
A=A-1 // 10263
M=0 // 10264
A=A-1 // 10265
M=0 // 10266
A=A-1 // 10267
M=D // 10268
A=A-1 // 10269
@30 // 10270
D=A // 10271
@SP // 10272
AM=M+1 // 10273
A=A-1 // 10274
M=D // 10275
@51 // 10276
D=A // 10277
@SP // 10278
AM=M+1 // 10279
A=A-1 // 10280
M=D // 10281
@51 // 10282
D=A // 10283
@SP // 10284
AM=M+1 // 10285
A=A-1 // 10286
M=D // 10287
@51 // 10288
D=A // 10289
@SP // 10290
AM=M+1 // 10291
A=A-1 // 10292
M=D // 10293
@51 // 10294
D=A // 10295
@SP // 10296
AM=M+1 // 10297
A=A-1 // 10298
M=D // 10299
@30 // 10300
D=A // 10301
@SP // 10302
AM=M+1 // 10303
A=A-1 // 10304
M=D // 10305
@SP // 10306
AM=M+1 // 10307
A=A-1 // 10308
M=0 // 10309
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
@Output.init.ret.81 // 10322
D=A // 10323
@CALL // 10324
0;JMP // 10325
(Output.init.ret.81)
@SP // 10326
M=M-1 // 10327

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10328
D=A // 10329
@SP // 10330
M=D+M // 10331
@112 // 10332
D=A // 10333
@SP // 10334
A=M-1 // 10335
M=0 // 10336
A=A-1 // 10337
M=0 // 10338
A=A-1 // 10339
M=0 // 10340
A=A-1 // 10341
M=D // 10342
A=A-1 // 10343
@30 // 10344
D=A // 10345
@SP // 10346
AM=M+1 // 10347
A=A-1 // 10348
M=D // 10349
@51 // 10350
D=A // 10351
@SP // 10352
AM=M+1 // 10353
A=A-1 // 10354
M=D // 10355
@51 // 10356
D=A // 10357
@SP // 10358
AM=M+1 // 10359
A=A-1 // 10360
M=D // 10361
@51 // 10362
D=A // 10363
@SP // 10364
AM=M+1 // 10365
A=A-1 // 10366
M=D // 10367
@31 // 10368
D=A // 10369
@SP // 10370
AM=M+1 // 10371
A=A-1 // 10372
M=D // 10373
@3 // 10374
D=A // 10375
@SP // 10376
AM=M+1 // 10377
A=A-1 // 10378
M=D // 10379
@3 // 10380
D=A // 10381
@SP // 10382
AM=M+1 // 10383
A=A-1 // 10384
M=D // 10385
@SP // 10386
AM=M+1 // 10387
A=A-1 // 10388
M=0 // 10389
// call Output.create
@17 // 10390
D=A // 10391
@14 // 10392
M=D // 10393
@Output.create // 10394
D=A // 10395
@13 // 10396
M=D // 10397
@Output.init.ret.82 // 10398
D=A // 10399
@CALL // 10400
0;JMP // 10401
(Output.init.ret.82)
@SP // 10402
M=M-1 // 10403

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10404
D=A // 10405
@SP // 10406
M=D+M // 10407
@113 // 10408
D=A // 10409
@SP // 10410
A=M-1 // 10411
M=0 // 10412
A=A-1 // 10413
M=0 // 10414
A=A-1 // 10415
M=0 // 10416
A=A-1 // 10417
M=D // 10418
A=A-1 // 10419
@30 // 10420
D=A // 10421
@SP // 10422
AM=M+1 // 10423
A=A-1 // 10424
M=D // 10425
@51 // 10426
D=A // 10427
@SP // 10428
AM=M+1 // 10429
A=A-1 // 10430
M=D // 10431
@51 // 10432
D=A // 10433
@SP // 10434
AM=M+1 // 10435
A=A-1 // 10436
M=D // 10437
@51 // 10438
D=A // 10439
@SP // 10440
AM=M+1 // 10441
A=A-1 // 10442
M=D // 10443
@62 // 10444
D=A // 10445
@SP // 10446
AM=M+1 // 10447
A=A-1 // 10448
M=D // 10449
@48 // 10450
D=A // 10451
@SP // 10452
AM=M+1 // 10453
A=A-1 // 10454
M=D // 10455
@48 // 10456
D=A // 10457
@SP // 10458
AM=M+1 // 10459
A=A-1 // 10460
M=D // 10461
@SP // 10462
AM=M+1 // 10463
A=A-1 // 10464
M=0 // 10465
// call Output.create
@17 // 10466
D=A // 10467
@14 // 10468
M=D // 10469
@Output.create // 10470
D=A // 10471
@13 // 10472
M=D // 10473
@Output.init.ret.83 // 10474
D=A // 10475
@CALL // 10476
0;JMP // 10477
(Output.init.ret.83)
@SP // 10478
M=M-1 // 10479

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10480
D=A // 10481
@SP // 10482
M=D+M // 10483
@114 // 10484
D=A // 10485
@SP // 10486
A=M-1 // 10487
M=0 // 10488
A=A-1 // 10489
M=0 // 10490
A=A-1 // 10491
M=0 // 10492
A=A-1 // 10493
M=D // 10494
A=A-1 // 10495
@29 // 10496
D=A // 10497
@SP // 10498
AM=M+1 // 10499
A=A-1 // 10500
M=D // 10501
@55 // 10502
D=A // 10503
@SP // 10504
AM=M+1 // 10505
A=A-1 // 10506
M=D // 10507
@51 // 10508
D=A // 10509
@SP // 10510
AM=M+1 // 10511
A=A-1 // 10512
M=D // 10513
@3 // 10514
D=A // 10515
@SP // 10516
AM=M+1 // 10517
A=A-1 // 10518
M=D // 10519
@3 // 10520
D=A // 10521
@SP // 10522
AM=M+1 // 10523
A=A-1 // 10524
M=D // 10525
@7 // 10526
D=A // 10527
@SP // 10528
AM=M+1 // 10529
A=A-1 // 10530
M=D // 10531
@SP // 10532
AM=M+1 // 10533
A=A-1 // 10534
M=0 // 10535
@SP // 10536
AM=M+1 // 10537
A=A-1 // 10538
M=0 // 10539
// call Output.create
@17 // 10540
D=A // 10541
@14 // 10542
M=D // 10543
@Output.create // 10544
D=A // 10545
@13 // 10546
M=D // 10547
@Output.init.ret.84 // 10548
D=A // 10549
@CALL // 10550
0;JMP // 10551
(Output.init.ret.84)
@SP // 10552
M=M-1 // 10553

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10554
D=A // 10555
@SP // 10556
M=D+M // 10557
@115 // 10558
D=A // 10559
@SP // 10560
A=M-1 // 10561
M=0 // 10562
A=A-1 // 10563
M=0 // 10564
A=A-1 // 10565
M=0 // 10566
A=A-1 // 10567
M=D // 10568
A=A-1 // 10569
@30 // 10570
D=A // 10571
@SP // 10572
AM=M+1 // 10573
A=A-1 // 10574
M=D // 10575
@51 // 10576
D=A // 10577
@SP // 10578
AM=M+1 // 10579
A=A-1 // 10580
M=D // 10581
@6 // 10582
D=A // 10583
@SP // 10584
AM=M+1 // 10585
A=A-1 // 10586
M=D // 10587
@24 // 10588
D=A // 10589
@SP // 10590
AM=M+1 // 10591
A=A-1 // 10592
M=D // 10593
@51 // 10594
D=A // 10595
@SP // 10596
AM=M+1 // 10597
A=A-1 // 10598
M=D // 10599
@30 // 10600
D=A // 10601
@SP // 10602
AM=M+1 // 10603
A=A-1 // 10604
M=D // 10605
@SP // 10606
AM=M+1 // 10607
A=A-1 // 10608
M=0 // 10609
@SP // 10610
AM=M+1 // 10611
A=A-1 // 10612
M=0 // 10613
// call Output.create
@17 // 10614
D=A // 10615
@14 // 10616
M=D // 10617
@Output.create // 10618
D=A // 10619
@13 // 10620
M=D // 10621
@Output.init.ret.85 // 10622
D=A // 10623
@CALL // 10624
0;JMP // 10625
(Output.init.ret.85)
@SP // 10626
M=M-1 // 10627

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10628
D=A // 10629
@SP // 10630
AM=M+1 // 10631
A=A-1 // 10632
M=D // 10633
@4 // 10634
D=A // 10635
@SP // 10636
AM=M+1 // 10637
A=A-1 // 10638
M=D // 10639
@6 // 10640
D=A // 10641
@SP // 10642
AM=M+1 // 10643
A=A-1 // 10644
M=D // 10645
@6 // 10646
D=A // 10647
@SP // 10648
AM=M+1 // 10649
A=A-1 // 10650
M=D // 10651
@15 // 10652
D=A // 10653
@SP // 10654
AM=M+1 // 10655
A=A-1 // 10656
M=D // 10657
@6 // 10658
D=A // 10659
@SP // 10660
AM=M+1 // 10661
A=A-1 // 10662
M=D // 10663
@6 // 10664
D=A // 10665
@SP // 10666
AM=M+1 // 10667
A=A-1 // 10668
M=D // 10669
@6 // 10670
D=A // 10671
@SP // 10672
AM=M+1 // 10673
A=A-1 // 10674
M=D // 10675
@54 // 10676
D=A // 10677
@SP // 10678
AM=M+1 // 10679
A=A-1 // 10680
M=D // 10681
@28 // 10682
D=A // 10683
@SP // 10684
AM=M+1 // 10685
A=A-1 // 10686
M=D // 10687
@SP // 10688
AM=M+1 // 10689
A=A-1 // 10690
M=0 // 10691
@SP // 10692
AM=M+1 // 10693
A=A-1 // 10694
M=0 // 10695
// call Output.create
@17 // 10696
D=A // 10697
@14 // 10698
M=D // 10699
@Output.create // 10700
D=A // 10701
@13 // 10702
M=D // 10703
@Output.init.ret.86 // 10704
D=A // 10705
@CALL // 10706
0;JMP // 10707
(Output.init.ret.86)
@SP // 10708
M=M-1 // 10709

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10710
D=A // 10711
@SP // 10712
M=D+M // 10713
@117 // 10714
D=A // 10715
@SP // 10716
A=M-1 // 10717
M=0 // 10718
A=A-1 // 10719
M=0 // 10720
A=A-1 // 10721
M=0 // 10722
A=A-1 // 10723
M=D // 10724
A=A-1 // 10725
@27 // 10726
D=A // 10727
@SP // 10728
AM=M+1 // 10729
A=A-1 // 10730
M=D // 10731
@27 // 10732
D=A // 10733
@SP // 10734
AM=M+1 // 10735
A=A-1 // 10736
M=D // 10737
@27 // 10738
D=A // 10739
@SP // 10740
AM=M+1 // 10741
A=A-1 // 10742
M=D // 10743
@27 // 10744
D=A // 10745
@SP // 10746
AM=M+1 // 10747
A=A-1 // 10748
M=D // 10749
@27 // 10750
D=A // 10751
@SP // 10752
AM=M+1 // 10753
A=A-1 // 10754
M=D // 10755
@54 // 10756
D=A // 10757
@SP // 10758
AM=M+1 // 10759
A=A-1 // 10760
M=D // 10761
@SP // 10762
AM=M+1 // 10763
A=A-1 // 10764
M=0 // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=0 // 10769
// call Output.create
@17 // 10770
D=A // 10771
@14 // 10772
M=D // 10773
@Output.create // 10774
D=A // 10775
@13 // 10776
M=D // 10777
@Output.init.ret.87 // 10778
D=A // 10779
@CALL // 10780
0;JMP // 10781
(Output.init.ret.87)
@SP // 10782
M=M-1 // 10783

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10784
D=A // 10785
@SP // 10786
M=D+M // 10787
@118 // 10788
D=A // 10789
@SP // 10790
A=M-1 // 10791
M=0 // 10792
A=A-1 // 10793
M=0 // 10794
A=A-1 // 10795
M=0 // 10796
A=A-1 // 10797
M=D // 10798
A=A-1 // 10799
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
@51 // 10818
D=A // 10819
@SP // 10820
AM=M+1 // 10821
A=A-1 // 10822
M=D // 10823
@30 // 10824
D=A // 10825
@SP // 10826
AM=M+1 // 10827
A=A-1 // 10828
M=D // 10829
@12 // 10830
D=A // 10831
@SP // 10832
AM=M+1 // 10833
A=A-1 // 10834
M=D // 10835
@SP // 10836
AM=M+1 // 10837
A=A-1 // 10838
M=0 // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=0 // 10843
// call Output.create
@17 // 10844
D=A // 10845
@14 // 10846
M=D // 10847
@Output.create // 10848
D=A // 10849
@13 // 10850
M=D // 10851
@Output.init.ret.88 // 10852
D=A // 10853
@CALL // 10854
0;JMP // 10855
(Output.init.ret.88)
@SP // 10856
M=M-1 // 10857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10858
D=A // 10859
@SP // 10860
M=D+M // 10861
@119 // 10862
D=A // 10863
@SP // 10864
A=M-1 // 10865
M=0 // 10866
A=A-1 // 10867
M=0 // 10868
A=A-1 // 10869
M=0 // 10870
A=A-1 // 10871
M=D // 10872
A=A-1 // 10873
@51 // 10874
D=A // 10875
@SP // 10876
AM=M+1 // 10877
A=A-1 // 10878
M=D // 10879
@51 // 10880
D=A // 10881
@SP // 10882
AM=M+1 // 10883
A=A-1 // 10884
M=D // 10885
@51 // 10886
D=A // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=D // 10891
@63 // 10892
D=A // 10893
@SP // 10894
AM=M+1 // 10895
A=A-1 // 10896
M=D // 10897
@63 // 10898
D=A // 10899
@SP // 10900
AM=M+1 // 10901
A=A-1 // 10902
M=D // 10903
@18 // 10904
D=A // 10905
@SP // 10906
AM=M+1 // 10907
A=A-1 // 10908
M=D // 10909
@SP // 10910
AM=M+1 // 10911
A=A-1 // 10912
M=0 // 10913
@SP // 10914
AM=M+1 // 10915
A=A-1 // 10916
M=0 // 10917
// call Output.create
@17 // 10918
D=A // 10919
@14 // 10920
M=D // 10921
@Output.create // 10922
D=A // 10923
@13 // 10924
M=D // 10925
@Output.init.ret.89 // 10926
D=A // 10927
@CALL // 10928
0;JMP // 10929
(Output.init.ret.89)
@SP // 10930
M=M-1 // 10931

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10932
D=A // 10933
@SP // 10934
M=D+M // 10935
@120 // 10936
D=A // 10937
@SP // 10938
A=M-1 // 10939
M=0 // 10940
A=A-1 // 10941
M=0 // 10942
A=A-1 // 10943
M=0 // 10944
A=A-1 // 10945
M=D // 10946
A=A-1 // 10947
@51 // 10948
D=A // 10949
@SP // 10950
AM=M+1 // 10951
A=A-1 // 10952
M=D // 10953
@30 // 10954
D=A // 10955
@SP // 10956
AM=M+1 // 10957
A=A-1 // 10958
M=D // 10959
@12 // 10960
D=A // 10961
@SP // 10962
AM=M+1 // 10963
A=A-1 // 10964
M=D // 10965
@12 // 10966
D=A // 10967
@SP // 10968
AM=M+1 // 10969
A=A-1 // 10970
M=D // 10971
@30 // 10972
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
@SP // 10984
AM=M+1 // 10985
A=A-1 // 10986
M=0 // 10987
@SP // 10988
AM=M+1 // 10989
A=A-1 // 10990
M=0 // 10991
// call Output.create
@17 // 10992
D=A // 10993
@14 // 10994
M=D // 10995
@Output.create // 10996
D=A // 10997
@13 // 10998
M=D // 10999
@Output.init.ret.90 // 11000
D=A // 11001
@CALL // 11002
0;JMP // 11003
(Output.init.ret.90)
@SP // 11004
M=M-1 // 11005

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11006
D=A // 11007
@SP // 11008
M=D+M // 11009
@121 // 11010
D=A // 11011
@SP // 11012
A=M-1 // 11013
M=0 // 11014
A=A-1 // 11015
M=0 // 11016
A=A-1 // 11017
M=0 // 11018
A=A-1 // 11019
M=D // 11020
A=A-1 // 11021
@51 // 11022
D=A // 11023
@SP // 11024
AM=M+1 // 11025
A=A-1 // 11026
M=D // 11027
@51 // 11028
D=A // 11029
@SP // 11030
AM=M+1 // 11031
A=A-1 // 11032
M=D // 11033
@51 // 11034
D=A // 11035
@SP // 11036
AM=M+1 // 11037
A=A-1 // 11038
M=D // 11039
@62 // 11040
D=A // 11041
@SP // 11042
AM=M+1 // 11043
A=A-1 // 11044
M=D // 11045
@48 // 11046
D=A // 11047
@SP // 11048
AM=M+1 // 11049
A=A-1 // 11050
M=D // 11051
@24 // 11052
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
@SP // 11064
AM=M+1 // 11065
A=A-1 // 11066
M=0 // 11067
// call Output.create
@17 // 11068
D=A // 11069
@14 // 11070
M=D // 11071
@Output.create // 11072
D=A // 11073
@13 // 11074
M=D // 11075
@Output.init.ret.91 // 11076
D=A // 11077
@CALL // 11078
0;JMP // 11079
(Output.init.ret.91)
@SP // 11080
M=M-1 // 11081

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11082
D=A // 11083
@SP // 11084
M=D+M // 11085
@122 // 11086
D=A // 11087
@SP // 11088
A=M-1 // 11089
M=0 // 11090
A=A-1 // 11091
M=0 // 11092
A=A-1 // 11093
M=0 // 11094
A=A-1 // 11095
M=D // 11096
A=A-1 // 11097
@63 // 11098
D=A // 11099
@SP // 11100
AM=M+1 // 11101
A=A-1 // 11102
M=D // 11103
@27 // 11104
D=A // 11105
@SP // 11106
AM=M+1 // 11107
A=A-1 // 11108
M=D // 11109
@12 // 11110
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
@51 // 11122
D=A // 11123
@SP // 11124
AM=M+1 // 11125
A=A-1 // 11126
M=D // 11127
@63 // 11128
D=A // 11129
@SP // 11130
AM=M+1 // 11131
A=A-1 // 11132
M=D // 11133
@SP // 11134
AM=M+1 // 11135
A=A-1 // 11136
M=0 // 11137
@SP // 11138
AM=M+1 // 11139
A=A-1 // 11140
M=0 // 11141
// call Output.create
@17 // 11142
D=A // 11143
@14 // 11144
M=D // 11145
@Output.create // 11146
D=A // 11147
@13 // 11148
M=D // 11149
@Output.init.ret.92 // 11150
D=A // 11151
@CALL // 11152
0;JMP // 11153
(Output.init.ret.92)
@SP // 11154
M=M-1 // 11155

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11156
D=A // 11157
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=D // 11161
@56 // 11162
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
@7 // 11186
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
@12 // 11204
D=A // 11205
@SP // 11206
AM=M+1 // 11207
A=A-1 // 11208
M=D // 11209
@56 // 11210
D=A // 11211
@SP // 11212
AM=M+1 // 11213
A=A-1 // 11214
M=D // 11215
@SP // 11216
AM=M+1 // 11217
A=A-1 // 11218
M=0 // 11219
@SP // 11220
AM=M+1 // 11221
A=A-1 // 11222
M=0 // 11223
// call Output.create
@17 // 11224
D=A // 11225
@14 // 11226
M=D // 11227
@Output.create // 11228
D=A // 11229
@13 // 11230
M=D // 11231
@Output.init.ret.93 // 11232
D=A // 11233
@CALL // 11234
0;JMP // 11235
(Output.init.ret.93)
@SP // 11236
M=M-1 // 11237

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11238
D=A // 11239
@SP // 11240
AM=M+1 // 11241
A=A-1 // 11242
M=D // 11243
@12 // 11244
D=A // 11245
@SP // 11246
AM=M+1 // 11247
A=A-1 // 11248
M=D // 11249
@12 // 11250
D=A // 11251
@SP // 11252
AM=M+1 // 11253
A=A-1 // 11254
M=D // 11255
@12 // 11256
D=A // 11257
@SP // 11258
AM=M+1 // 11259
A=A-1 // 11260
M=D // 11261
@12 // 11262
D=A // 11263
@SP // 11264
AM=M+1 // 11265
A=A-1 // 11266
M=D // 11267
@12 // 11268
D=A // 11269
@SP // 11270
AM=M+1 // 11271
A=A-1 // 11272
M=D // 11273
@12 // 11274
D=A // 11275
@SP // 11276
AM=M+1 // 11277
A=A-1 // 11278
M=D // 11279
@12 // 11280
D=A // 11281
@SP // 11282
AM=M+1 // 11283
A=A-1 // 11284
M=D // 11285
@12 // 11286
D=A // 11287
@SP // 11288
AM=M+1 // 11289
A=A-1 // 11290
M=D // 11291
@12 // 11292
D=A // 11293
@SP // 11294
AM=M+1 // 11295
A=A-1 // 11296
M=D // 11297
@SP // 11298
AM=M+1 // 11299
A=A-1 // 11300
M=0 // 11301
@SP // 11302
AM=M+1 // 11303
A=A-1 // 11304
M=0 // 11305
// call Output.create
@17 // 11306
D=A // 11307
@14 // 11308
M=D // 11309
@Output.create // 11310
D=A // 11311
@13 // 11312
M=D // 11313
@Output.init.ret.94 // 11314
D=A // 11315
@CALL // 11316
0;JMP // 11317
(Output.init.ret.94)
@SP // 11318
M=M-1 // 11319

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11320
D=A // 11321
@SP // 11322
AM=M+1 // 11323
A=A-1 // 11324
M=D // 11325
@7 // 11326
D=A // 11327
@SP // 11328
AM=M+1 // 11329
A=A-1 // 11330
M=D // 11331
@12 // 11332
D=A // 11333
@SP // 11334
AM=M+1 // 11335
A=A-1 // 11336
M=D // 11337
@12 // 11338
D=A // 11339
@SP // 11340
AM=M+1 // 11341
A=A-1 // 11342
M=D // 11343
@12 // 11344
D=A // 11345
@SP // 11346
AM=M+1 // 11347
A=A-1 // 11348
M=D // 11349
@56 // 11350
D=A // 11351
@SP // 11352
AM=M+1 // 11353
A=A-1 // 11354
M=D // 11355
@12 // 11356
D=A // 11357
@SP // 11358
AM=M+1 // 11359
A=A-1 // 11360
M=D // 11361
@12 // 11362
D=A // 11363
@SP // 11364
AM=M+1 // 11365
A=A-1 // 11366
M=D // 11367
@12 // 11368
D=A // 11369
@SP // 11370
AM=M+1 // 11371
A=A-1 // 11372
M=D // 11373
@7 // 11374
D=A // 11375
@SP // 11376
AM=M+1 // 11377
A=A-1 // 11378
M=D // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=0 // 11383
@SP // 11384
AM=M+1 // 11385
A=A-1 // 11386
M=0 // 11387
// call Output.create
@17 // 11388
D=A // 11389
@14 // 11390
M=D // 11391
@Output.create // 11392
D=A // 11393
@13 // 11394
M=D // 11395
@Output.init.ret.95 // 11396
D=A // 11397
@CALL // 11398
0;JMP // 11399
(Output.init.ret.95)
@SP // 11400
M=M-1 // 11401

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11402
D=A // 11403
@SP // 11404
AM=M+1 // 11405
A=A-1 // 11406
M=D // 11407
@38 // 11408
D=A // 11409
@SP // 11410
AM=M+1 // 11411
A=A-1 // 11412
M=D // 11413
@45 // 11414
D=A // 11415
@SP // 11416
AM=M+1 // 11417
A=A-1 // 11418
M=D // 11419
@25 // 11420
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
@SP // 11438
AM=M+1 // 11439
A=A-1 // 11440
M=0 // 11441
@SP // 11442
AM=M+1 // 11443
A=A-1 // 11444
M=0 // 11445
@SP // 11446
AM=M+1 // 11447
A=A-1 // 11448
M=0 // 11449
@SP // 11450
AM=M+1 // 11451
A=A-1 // 11452
M=0 // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=0 // 11457
// call Output.create
@17 // 11458
D=A // 11459
@14 // 11460
M=D // 11461
@Output.create // 11462
D=A // 11463
@13 // 11464
M=D // 11465
@Output.init.ret.96 // 11466
D=A // 11467
@CALL // 11468
0;JMP // 11469
(Output.init.ret.96)
@SP // 11470
M=M-1 // 11471

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 11472
M=0 // 11473

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 11474
M=0 // 11475

////PushInstruction("constant 0")
@SP // 11476
AM=M+1 // 11477
A=A-1 // 11478
M=0 // 11479
@RETURN // 11480
0;JMP // 11481

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=97}}
// function Output.create with 1
(Output.create)
@SP // 11482
AM=M+1 // 11483
A=A-1 // 11484
M=0 // 11485

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11486
D=A // 11487
@SP // 11488
AM=M+1 // 11489
A=A-1 // 11490
M=D // 11491
// call Array.new
@6 // 11492
D=A // 11493
@14 // 11494
M=D // 11495
@Array.new // 11496
D=A // 11497
@13 // 11498
M=D // 11499
@Output.create.ret.0 // 11500
D=A // 11501
@CALL // 11502
0;JMP // 11503
(Output.create.ret.0)
@SP // 11504
AM=M-1 // 11505
D=M // 11506
@LCL // 11507
A=M // 11508
M=D // 11509

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11510
D=M // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=D // 11515
@ARG // 11516
A=M // 11517
D=M // 11518
@SP // 11519
AM=M-1 // 11520
D=D+M // 11521
@SP // 11522
AM=M+1 // 11523
A=A-1 // 11524
M=D // 11525
@LCL // 11526
A=M // 11527
D=M // 11528
@SP // 11529
AM=M-1 // 11530
A=M // 11531
M=D // 11532

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11533
A=M // 11534
D=M // 11535
@SP // 11536
AM=M+1 // 11537
A=A-1 // 11538
M=D // 11539
@ARG // 11540
A=M+1 // 11541
D=M // 11542
@SP // 11543
AM=M-1 // 11544
A=M // 11545
M=D // 11546

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11547
A=M // 11548
D=M // 11549
@SP // 11550
AM=M+1 // 11551
A=A-1 // 11552
M=D+1 // 11553
@ARG // 11554
A=M+1 // 11555
A=A+1 // 11556
D=M // 11557
@SP // 11558
AM=M-1 // 11559
A=M // 11560
M=D // 11561

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11562
A=M // 11563
D=M // 11564
@2 // 11565
D=D+A // 11566
@SP // 11567
AM=M+1 // 11568
A=A-1 // 11569
M=D // 11570
@ARG // 11571
A=M+1 // 11572
A=A+1 // 11573
A=A+1 // 11574
D=M // 11575
@SP // 11576
AM=M-1 // 11577
A=M // 11578
M=D // 11579

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11580
A=M // 11581
D=M // 11582
@3 // 11583
D=D+A // 11584
@SP // 11585
AM=M+1 // 11586
A=A-1 // 11587
M=D // 11588
@ARG // 11589
D=M // 11590
@4 // 11591
A=D+A // 11592
D=M // 11593
@SP // 11594
AM=M-1 // 11595
A=M // 11596
M=D // 11597

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11598
A=M // 11599
D=M // 11600
@4 // 11601
D=D+A // 11602
@SP // 11603
AM=M+1 // 11604
A=A-1 // 11605
M=D // 11606
@ARG // 11607
D=M // 11608
@5 // 11609
A=D+A // 11610
D=M // 11611
@SP // 11612
AM=M-1 // 11613
A=M // 11614
M=D // 11615

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11616
A=M // 11617
D=M // 11618
@5 // 11619
D=D+A // 11620
@SP // 11621
AM=M+1 // 11622
A=A-1 // 11623
M=D // 11624
@ARG // 11625
D=M // 11626
@6 // 11627
A=D+A // 11628
D=M // 11629
@SP // 11630
AM=M-1 // 11631
A=M // 11632
M=D // 11633

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11634
A=M // 11635
D=M // 11636
@6 // 11637
D=D+A // 11638
@SP // 11639
AM=M+1 // 11640
A=A-1 // 11641
M=D // 11642
@ARG // 11643
D=M // 11644
@7 // 11645
A=D+A // 11646
D=M // 11647
@SP // 11648
AM=M-1 // 11649
A=M // 11650
M=D // 11651

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11652
A=M // 11653
D=M // 11654
@7 // 11655
D=D+A // 11656
@SP // 11657
AM=M+1 // 11658
A=A-1 // 11659
M=D // 11660
@ARG // 11661
D=M // 11662
@8 // 11663
A=D+A // 11664
D=M // 11665
@SP // 11666
AM=M-1 // 11667
A=M // 11668
M=D // 11669

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11670
A=M // 11671
D=M // 11672
@8 // 11673
D=D+A // 11674
@SP // 11675
AM=M+1 // 11676
A=A-1 // 11677
M=D // 11678
@ARG // 11679
D=M // 11680
@9 // 11681
A=D+A // 11682
D=M // 11683
@SP // 11684
AM=M-1 // 11685
A=M // 11686
M=D // 11687

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11688
A=M // 11689
D=M // 11690
@9 // 11691
D=D+A // 11692
@SP // 11693
AM=M+1 // 11694
A=A-1 // 11695
M=D // 11696
@ARG // 11697
D=M // 11698
@10 // 11699
A=D+A // 11700
D=M // 11701
@SP // 11702
AM=M-1 // 11703
A=M // 11704
M=D // 11705

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11706
A=M // 11707
D=M // 11708
@10 // 11709
D=D+A // 11710
@SP // 11711
AM=M+1 // 11712
A=A-1 // 11713
M=D // 11714
@ARG // 11715
D=M // 11716
@11 // 11717
A=D+A // 11718
D=M // 11719
@SP // 11720
AM=M-1 // 11721
A=M // 11722
M=D // 11723

////PushInstruction("constant 0")
@SP // 11724
AM=M+1 // 11725
A=A-1 // 11726
M=0 // 11727
@RETURN // 11728
0;JMP // 11729

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
@Output.getMap.LT.0 // 11730
D=A // 11731
@SP // 11732
AM=M+1 // 11733
A=A-1 // 11734
M=D // 11735
@ARG // 11736
A=M // 11737
D=M // 11738
@32 // 11739
D=D-A // 11740
@DO_LT // 11741
0;JMP // 11742
(Output.getMap.LT.0)
@SP // 11743
AM=M+1 // 11744
A=A-1 // 11745
M=D // 11746
@Output.getMap.GT.1 // 11747
D=A // 11748
@SP // 11749
AM=M+1 // 11750
A=A-1 // 11751
M=D // 11752
@ARG // 11753
A=M // 11754
D=M // 11755
@126 // 11756
D=D-A // 11757
@DO_GT // 11758
0;JMP // 11759
(Output.getMap.GT.1)
@SP // 11760
AM=M-1 // 11761
D=D|M // 11762
@Output.getMap$IF_TRUE1 // 11763
D;JNE // 11764

////GotoInstruction{label='Output.getMap$IF_FALSE1}
// goto Output.getMap$IF_FALSE1
@Output.getMap$IF_FALSE1 // 11765
0;JMP // 11766

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11767
A=M // 11768
M=0 // 11769

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
@Output.0 // 11770
D=M // 11771
@SP // 11772
AM=M+1 // 11773
A=A-1 // 11774
M=D // 11775
@ARG // 11776
A=M // 11777
D=M // 11778
@SP // 11779
AM=M-1 // 11780
A=D+M // 11781
D=M // 11782
@SP // 11783
AM=M+1 // 11784
A=A-1 // 11785
M=D // 11786
@RETURN // 11787
0;JMP // 11788

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 11789
A=M+1 // 11790
D=M // 11791
@Output.1 // 11792
M=D // 11793

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 11794
A=M // 11795
D=M // 11796
@Output.2 // 11797
M=D // 11798

////PushInstruction("constant 0")
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=0 // 11802
@RETURN // 11803
0;JMP // 11804

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 11805
D=A // 11806
@SP // 11807
AM=D+M // 11808
A=A-1 // 11809
M=0 // 11810
A=A-1 // 11811
M=0 // 11812
A=A-1 // 11813
M=0 // 11814
A=A-1 // 11815
M=0 // 11816

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 11817
A=M // 11818
D=M // 11819
@SP // 11820
AM=M+1 // 11821
A=A-1 // 11822
M=D // 11823
// call Output.getMap
@6 // 11824
D=A // 11825
@14 // 11826
M=D // 11827
@Output.getMap // 11828
D=A // 11829
@13 // 11830
M=D // 11831
@Output.printChar.ret.0 // 11832
D=A // 11833
@CALL // 11834
0;JMP // 11835
(Output.printChar.ret.0)
@SP // 11836
AM=M-1 // 11837
D=M // 11838
@LCL // 11839
A=M // 11840
M=D // 11841

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 11842
A=M+1 // 11843
A=A+1 // 11844
A=A+1 // 11845
M=0 // 11846

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
@Output.printChar.LT.2 // 11847
D=A // 11848
@SP // 11849
AM=M+1 // 11850
A=A-1 // 11851
M=D // 11852
@LCL // 11853
A=M+1 // 11854
A=A+1 // 11855
A=A+1 // 11856
D=M // 11857
@11 // 11858
D=D-A // 11859
@DO_LT // 11860
0;JMP // 11861
(Output.printChar.LT.2)
D=!D // 11862
@Output.printChar_WHILE_END1 // 11863
D;JNE // 11864

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

@Output.2 // 11865
D=M // 11866
@SP // 11867
AM=M+1 // 11868
A=A-1 // 11869
M=D // 11870
@11 // 11871
D=A // 11872
@SP // 11873
AM=M+1 // 11874
A=A-1 // 11875
M=D // 11876
// call Math.multiply
@7 // 11877
D=A // 11878
@14 // 11879
M=D // 11880
@Math.multiply // 11881
D=A // 11882
@13 // 11883
M=D // 11884
@Output.printChar.ret.1 // 11885
D=A // 11886
@CALL // 11887
0;JMP // 11888
(Output.printChar.ret.1)
@LCL // 11889
A=M+1 // 11890
A=A+1 // 11891
A=A+1 // 11892
D=M // 11893
@SP // 11894
AM=M-1 // 11895
D=D+M // 11896
@SP // 11897
AM=M+1 // 11898
A=A-1 // 11899
M=D // 11900
@32 // 11901
D=A // 11902
@SP // 11903
AM=M+1 // 11904
A=A-1 // 11905
M=D // 11906
// call Math.multiply
@7 // 11907
D=A // 11908
@14 // 11909
M=D // 11910
@Math.multiply // 11911
D=A // 11912
@13 // 11913
M=D // 11914
@Output.printChar.ret.2 // 11915
D=A // 11916
@CALL // 11917
0;JMP // 11918
(Output.printChar.ret.2)
@SP // 11919
AM=M-1 // 11920
D=M // 11921
@16384 // 11922
D=D+A // 11923
@SP // 11924
AM=M+1 // 11925
A=A-1 // 11926
M=D // 11927
@Output.1 // 11928
D=M // 11929
@SP // 11930
AM=M+1 // 11931
A=A-1 // 11932
M=D // 11933
@2 // 11934
D=A // 11935
@SP // 11936
AM=M+1 // 11937
A=A-1 // 11938
M=D // 11939
// call Math.divide
@7 // 11940
D=A // 11941
@14 // 11942
M=D // 11943
@Math.divide // 11944
D=A // 11945
@13 // 11946
M=D // 11947
@Output.printChar.ret.3 // 11948
D=A // 11949
@CALL // 11950
0;JMP // 11951
(Output.printChar.ret.3)
@SP // 11952
AM=M-1 // 11953
D=M // 11954
@SP // 11955
AM=M-1 // 11956
D=D+M // 11957
@LCL // 11958
A=M+1 // 11959
M=D // 11960

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
@Output.printChar.EQ.3 // 11961
D=A // 11962
@SP // 11963
AM=M+1 // 11964
A=A-1 // 11965
M=D // 11966
@Output.1 // 11967
D=M // 11968
@1 // 11969
D=D&A // 11970
@DO_EQ // 11971
0;JMP // 11972
(Output.printChar.EQ.3)
@Output.printChar$IF_TRUE1 // 11973
D;JNE // 11974

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 11975
0;JMP // 11976

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

@LCL // 11977
A=M+1 // 11978
A=A+1 // 11979
A=A+1 // 11980
D=M // 11981
A=A-1 // 11982
A=A-1 // 11983
A=A-1 // 11984
A=D+M // 11985
D=M // 11986
@LCL // 11987
A=M+1 // 11988
A=A+1 // 11989
M=D // 11990

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 11991
0;JMP // 11992

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

@LCL // 11993
A=M+1 // 11994
A=A+1 // 11995
A=A+1 // 11996
D=M // 11997
A=A-1 // 11998
A=A-1 // 11999
A=A-1 // 12000
A=D+M // 12001
D=M // 12002
@SP // 12003
AM=M+1 // 12004
A=A-1 // 12005
M=D // 12006
@256 // 12007
D=A // 12008
@SP // 12009
AM=M+1 // 12010
A=A-1 // 12011
M=D // 12012
// call Math.multiply
@7 // 12013
D=A // 12014
@14 // 12015
M=D // 12016
@Math.multiply // 12017
D=A // 12018
@13 // 12019
M=D // 12020
@Output.printChar.ret.4 // 12021
D=A // 12022
@CALL // 12023
0;JMP // 12024
(Output.printChar.ret.4)
@SP // 12025
AM=M-1 // 12026
D=M // 12027
@LCL // 12028
A=M+1 // 12029
A=A+1 // 12030
M=D // 12031

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
@LCL // 12032
A=M+1 // 12033
D=M // 12034
@SP // 12035
AM=M+1 // 12036
A=A-1 // 12037
M=D // 12038
@LCL // 12039
A=M+1 // 12040
D=M // 12041
@0 // 12042
A=D+A // 12043
D=M // 12044
@SP // 12045
AM=M+1 // 12046
A=A-1 // 12047
M=D // 12048
@LCL // 12049
A=M+1 // 12050
A=A+1 // 12051
D=M // 12052
@SP // 12053
AM=M-1 // 12054
D=D|M // 12055
@SP // 12056
AM=M-1 // 12057
A=M // 12058
M=D // 12059

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

@LCL // 12060
A=M+1 // 12061
A=A+1 // 12062
A=A+1 // 12063
M=M+1 // 12064

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 12065
0;JMP // 12066

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
@Output.printChar.EQ.4 // 12067
D=A // 12068
@SP // 12069
AM=M+1 // 12070
A=A-1 // 12071
M=D // 12072
@Output.1 // 12073
D=M // 12074
@63 // 12075
D=D-A // 12076
@DO_EQ // 12077
0;JMP // 12078
(Output.printChar.EQ.4)
@Output.printChar$IF_TRUE2 // 12079
D;JNE // 12080

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 12081
0;JMP // 12082

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12083
D=A // 12084
@14 // 12085
M=D // 12086
@Output.println // 12087
D=A // 12088
@13 // 12089
M=D // 12090
@Output.printChar.ret.5 // 12091
D=A // 12092
@CALL // 12093
0;JMP // 12094
(Output.printChar.ret.5)
@SP // 12095
M=M-1 // 12096

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 12097
0;JMP // 12098

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

@Output.1 // 12099
M=M+1 // 12100

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 12101
AM=M+1 // 12102
A=A-1 // 12103
M=0 // 12104
@RETURN // 12105
0;JMP // 12106

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12107
M=M+1 // 12108
AM=M+1 // 12109
A=A-1 // 12110
M=0 // 12111
A=A-1 // 12112
M=0 // 12113

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12114
A=M // 12115
M=0 // 12116

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12117
A=M // 12118
D=M // 12119
@SP // 12120
AM=M+1 // 12121
A=A-1 // 12122
M=D // 12123
// call String.length
@6 // 12124
D=A // 12125
@14 // 12126
M=D // 12127
@String.length // 12128
D=A // 12129
@13 // 12130
M=D // 12131
@Output.printString.ret.0 // 12132
D=A // 12133
@CALL // 12134
0;JMP // 12135
(Output.printString.ret.0)
@SP // 12136
AM=M-1 // 12137
D=M // 12138
@LCL // 12139
A=M+1 // 12140
M=D // 12141

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
@Output.printString.LT.5 // 12142
D=A // 12143
@SP // 12144
AM=M+1 // 12145
A=A-1 // 12146
M=D // 12147
@LCL // 12148
A=M+1 // 12149
D=M // 12150
A=A-1 // 12151
D=M-D // 12152
@DO_LT // 12153
0;JMP // 12154
(Output.printString.LT.5)
D=!D // 12155
@Output.printString_WHILE_END1 // 12156
D;JNE // 12157

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12158
A=M // 12159
D=M // 12160
@SP // 12161
AM=M+1 // 12162
A=A-1 // 12163
M=D // 12164
@LCL // 12165
A=M // 12166
D=M // 12167
@SP // 12168
AM=M+1 // 12169
A=A-1 // 12170
M=D // 12171
// call String.charAt
@7 // 12172
D=A // 12173
@14 // 12174
M=D // 12175
@String.charAt // 12176
D=A // 12177
@13 // 12178
M=D // 12179
@Output.printString.ret.1 // 12180
D=A // 12181
@CALL // 12182
0;JMP // 12183
(Output.printString.ret.1)
// call Output.printChar
@6 // 12184
D=A // 12185
@14 // 12186
M=D // 12187
@Output.printChar // 12188
D=A // 12189
@13 // 12190
M=D // 12191
@Output.printString.ret.2 // 12192
D=A // 12193
@CALL // 12194
0;JMP // 12195
(Output.printString.ret.2)
@SP // 12196
M=M-1 // 12197

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

@LCL // 12198
A=M // 12199
M=M+1 // 12200

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 12201
0;JMP // 12202

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12203
AM=M+1 // 12204
A=A-1 // 12205
M=0 // 12206
@RETURN // 12207
0;JMP // 12208

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12209
AM=M+1 // 12210
A=A-1 // 12211
M=0 // 12212

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12213
D=A // 12214
@SP // 12215
AM=M+1 // 12216
A=A-1 // 12217
M=D // 12218
// call String.new
@6 // 12219
D=A // 12220
@14 // 12221
M=D // 12222
@String.new // 12223
D=A // 12224
@13 // 12225
M=D // 12226
@Output.printInt.ret.0 // 12227
D=A // 12228
@CALL // 12229
0;JMP // 12230
(Output.printInt.ret.0)
@SP // 12231
AM=M-1 // 12232
D=M // 12233
@LCL // 12234
A=M // 12235
M=D // 12236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12237
A=M // 12238
D=M // 12239
@SP // 12240
AM=M+1 // 12241
A=A-1 // 12242
M=D // 12243
@ARG // 12244
A=M // 12245
D=M // 12246
@SP // 12247
AM=M+1 // 12248
A=A-1 // 12249
M=D // 12250
// call String.setInt
@7 // 12251
D=A // 12252
@14 // 12253
M=D // 12254
@String.setInt // 12255
D=A // 12256
@13 // 12257
M=D // 12258
@Output.printInt.ret.1 // 12259
D=A // 12260
@CALL // 12261
0;JMP // 12262
(Output.printInt.ret.1)
@SP // 12263
M=M-1 // 12264

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12265
A=M // 12266
D=M // 12267
@SP // 12268
AM=M+1 // 12269
A=A-1 // 12270
M=D // 12271
// call Output.printString
@6 // 12272
D=A // 12273
@14 // 12274
M=D // 12275
@Output.printString // 12276
D=A // 12277
@13 // 12278
M=D // 12279
@Output.printInt.ret.2 // 12280
D=A // 12281
@CALL // 12282
0;JMP // 12283
(Output.printInt.ret.2)
@SP // 12284
M=M-1 // 12285

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12286
A=M // 12287
D=M // 12288
@SP // 12289
AM=M+1 // 12290
A=A-1 // 12291
M=D // 12292
// call String.dispose
@6 // 12293
D=A // 12294
@14 // 12295
M=D // 12296
@String.dispose // 12297
D=A // 12298
@13 // 12299
M=D // 12300
@Output.printInt.ret.3 // 12301
D=A // 12302
@CALL // 12303
0;JMP // 12304
(Output.printInt.ret.3)
@SP // 12305
M=M-1 // 12306

////PushInstruction("constant 0")
@SP // 12307
AM=M+1 // 12308
A=A-1 // 12309
M=0 // 12310
@RETURN // 12311
0;JMP // 12312

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12313
M=0 // 12314

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 22"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println$IF_TRUE1}}
@Output.println.EQ.6 // 12315
D=A // 12316
@SP // 12317
AM=M+1 // 12318
A=A-1 // 12319
M=D // 12320
@Output.2 // 12321
D=M // 12322
@22 // 12323
D=D-A // 12324
@DO_EQ // 12325
0;JMP // 12326
(Output.println.EQ.6)
@Output.println$IF_TRUE1 // 12327
D;JNE // 12328

////GotoInstruction{label='Output.println$IF_FALSE1}
// goto Output.println$IF_FALSE1
@Output.println$IF_FALSE1 // 12329
0;JMP // 12330

////LabelInstruction{label='Output.println$IF_TRUE1}
// label Output.println$IF_TRUE1
(Output.println$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12331
M=0 // 12332

////GotoInstruction{label='Output.println$IF_END1}
// goto Output.println$IF_END1
@Output.println$IF_END1 // 12333
0;JMP // 12334

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

@Output.2 // 12335
M=M+1 // 12336

////LabelInstruction{label='Output.println$IF_END1}
// label Output.println$IF_END1
(Output.println$IF_END1)

////PushInstruction("constant 0")
@SP // 12337
AM=M+1 // 12338
A=A-1 // 12339
M=0 // 12340
@RETURN // 12341
0;JMP // 12342

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
@Output.backSpace.EQ.7 // 12343
D=A // 12344
@SP // 12345
AM=M+1 // 12346
A=A-1 // 12347
M=D // 12348
@Output.1 // 12349
D=M // 12350
@DO_EQ // 12351
0;JMP // 12352
(Output.backSpace.EQ.7)
@Output.backSpace$IF_TRUE1 // 12353
D;JNE // 12354

////GotoInstruction{label='Output.backSpace$IF_FALSE1}
// goto Output.backSpace$IF_FALSE1
@Output.backSpace$IF_FALSE1 // 12355
0;JMP // 12356

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

@Output.2 // 12357
M=M-1 // 12358

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12359
D=A // 12360
@Output.1 // 12361
M=D // 12362

////GotoInstruction{label='Output.backSpace$IF_END1}
// goto Output.backSpace$IF_END1
@Output.backSpace$IF_END1 // 12363
0;JMP // 12364

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

@Output.1 // 12365
M=M-1 // 12366

////LabelInstruction{label='Output.backSpace$IF_END1}
// label Output.backSpace$IF_END1
(Output.backSpace$IF_END1)

////PushInstruction("constant 0")
@SP // 12367
AM=M+1 // 12368
A=A-1 // 12369
M=0 // 12370
@RETURN // 12371
0;JMP // 12372

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12373
M=-1 // 12374

////PushInstruction("constant 0")
@SP // 12375
AM=M+1 // 12376
A=A-1 // 12377
M=0 // 12378
@RETURN // 12379
0;JMP // 12380

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12381
A=M // 12382
D=M // 12383
@Screen.0 // 12384
M=D // 12385

////PushInstruction("constant 0")
@SP // 12386
AM=M+1 // 12387
A=A-1 // 12388
M=0 // 12389
@RETURN // 12390
0;JMP // 12391

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12392
M=M+1 // 12393
AM=M+1 // 12394
A=A-1 // 12395
M=0 // 12396
A=A-1 // 12397
M=0 // 12398

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

@ARG // 12399
A=M+1 // 12400
D=M // 12401
@SP // 12402
AM=M+1 // 12403
A=A-1 // 12404
M=D // 12405
@32 // 12406
D=A // 12407
@SP // 12408
AM=M+1 // 12409
A=A-1 // 12410
M=D // 12411
// call Math.multiply
@7 // 12412
D=A // 12413
@14 // 12414
M=D // 12415
@Math.multiply // 12416
D=A // 12417
@13 // 12418
M=D // 12419
@Screen.drawPixel.ret.0 // 12420
D=A // 12421
@CALL // 12422
0;JMP // 12423
(Screen.drawPixel.ret.0)
@ARG // 12424
A=M // 12425
D=M // 12426
@SP // 12427
AM=M+1 // 12428
A=A-1 // 12429
M=D // 12430
@16 // 12431
D=A // 12432
@SP // 12433
AM=M+1 // 12434
A=A-1 // 12435
M=D // 12436
// call Math.divide
@7 // 12437
D=A // 12438
@14 // 12439
M=D // 12440
@Math.divide // 12441
D=A // 12442
@13 // 12443
M=D // 12444
@Screen.drawPixel.ret.1 // 12445
D=A // 12446
@CALL // 12447
0;JMP // 12448
(Screen.drawPixel.ret.1)
@SP // 12449
AM=M-1 // 12450
D=M // 12451
@SP // 12452
AM=M-1 // 12453
D=D+M // 12454
@16384 // 12455
D=D+A // 12456
@LCL // 12457
A=M // 12458
M=D // 12459

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

@ARG // 12460
A=M // 12461
D=M // 12462
@15 // 12463
D=D&A // 12464
@LCL // 12465
A=M+1 // 12466
M=D // 12467

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.drawPixel.EQ.0 // 12468
D=A // 12469
@SP // 12470
AM=M+1 // 12471
A=A-1 // 12472
M=D // 12473
@Screen.0 // 12474
D=M // 12475
@DO_EQ // 12476
0;JMP // 12477
(Screen.drawPixel.EQ.0)
D=!D // 12478
@Screen.drawPixel$IF_TRUE1 // 12479
D;JNE // 12480

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 12481
0;JMP // 12482

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
@LCL // 12483
A=M // 12484
D=M // 12485
@SP // 12486
AM=M+1 // 12487
A=A-1 // 12488
M=D // 12489
@LCL // 12490
A=M // 12491
D=M // 12492
@0 // 12493
A=D+A // 12494
D=M // 12495
@SP // 12496
AM=M+1 // 12497
A=A-1 // 12498
M=D // 12499
@LCL // 12500
A=M+1 // 12501
D=M // 12502
@SP // 12503
AM=M+1 // 12504
A=A-1 // 12505
M=D // 12506
// call Math.twoToThe
@6 // 12507
D=A // 12508
@14 // 12509
M=D // 12510
@Math.twoToThe // 12511
D=A // 12512
@13 // 12513
M=D // 12514
@Screen.drawPixel.ret.2 // 12515
D=A // 12516
@CALL // 12517
0;JMP // 12518
(Screen.drawPixel.ret.2)
@SP // 12519
AM=M-1 // 12520
D=M // 12521
@SP // 12522
AM=M-1 // 12523
D=D|M // 12524
@SP // 12525
AM=M-1 // 12526
A=M // 12527
M=D // 12528

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 12529
0;JMP // 12530

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
@LCL // 12531
A=M // 12532
D=M // 12533
@SP // 12534
AM=M+1 // 12535
A=A-1 // 12536
M=D // 12537
@LCL // 12538
A=M // 12539
D=M // 12540
@0 // 12541
A=D+A // 12542
D=M // 12543
@SP // 12544
AM=M+1 // 12545
A=A-1 // 12546
M=D // 12547
@LCL // 12548
A=M+1 // 12549
D=M // 12550
@SP // 12551
AM=M+1 // 12552
A=A-1 // 12553
M=D // 12554
// call Math.twoToThe
@6 // 12555
D=A // 12556
@14 // 12557
M=D // 12558
@Math.twoToThe // 12559
D=A // 12560
@13 // 12561
M=D // 12562
@Screen.drawPixel.ret.3 // 12563
D=A // 12564
@CALL // 12565
0;JMP // 12566
(Screen.drawPixel.ret.3)
@SP // 12567
AM=M-1 // 12568
D=M // 12569
D=!D // 12570
@SP // 12571
AM=M-1 // 12572
D=D&M // 12573
@SP // 12574
AM=M-1 // 12575
A=M // 12576
M=D // 12577

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 12578
AM=M+1 // 12579
A=A-1 // 12580
M=0 // 12581
@RETURN // 12582
0;JMP // 12583

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12584
D=A // 12585
@SP // 12586
AM=D+M // 12587
A=A-1 // 12588
M=0 // 12589
A=A-1 // 12590
M=0 // 12591
A=A-1 // 12592
M=0 // 12593
A=A-1 // 12594
M=0 // 12595
A=A-1 // 12596
M=0 // 12597
A=A-1 // 12598
M=0 // 12599

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

@ARG // 12600
A=M+1 // 12601
A=A+1 // 12602
D=M // 12603
A=A-1 // 12604
A=A-1 // 12605
D=D-M // 12606
@SP // 12607
AM=M+1 // 12608
A=A-1 // 12609
M=D // 12610
// call Math.abs
@6 // 12611
D=A // 12612
@14 // 12613
M=D // 12614
@Math.abs // 12615
D=A // 12616
@13 // 12617
M=D // 12618
@Screen.drawLine.ret.0 // 12619
D=A // 12620
@CALL // 12621
0;JMP // 12622
(Screen.drawLine.ret.0)
@SP // 12623
AM=M-1 // 12624
D=M // 12625
@LCL // 12626
A=M // 12627
M=D // 12628

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

@ARG // 12629
A=M+1 // 12630
A=A+1 // 12631
A=A+1 // 12632
D=M // 12633
A=A-1 // 12634
A=A-1 // 12635
D=D-M // 12636
@SP // 12637
AM=M+1 // 12638
A=A-1 // 12639
M=D // 12640
// call Math.abs
@6 // 12641
D=A // 12642
@14 // 12643
M=D // 12644
@Math.abs // 12645
D=A // 12646
@13 // 12647
M=D // 12648
@Screen.drawLine.ret.1 // 12649
D=A // 12650
@CALL // 12651
0;JMP // 12652
(Screen.drawLine.ret.1)
@SP // 12653
AM=M-1 // 12654
D=M // 12655
@LCL // 12656
A=M+1 // 12657
M=D // 12658

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.1 // 12659
D=A // 12660
@SP // 12661
AM=M+1 // 12662
A=A-1 // 12663
M=D // 12664
@ARG // 12665
A=M+1 // 12666
A=A+1 // 12667
D=M // 12668
A=A-1 // 12669
A=A-1 // 12670
D=M-D // 12671
@DO_LT // 12672
0;JMP // 12673
(Screen.drawLine.LT.1)
@Screen.drawLine$IF_TRUE1 // 12674
D;JNE // 12675

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 12676
0;JMP // 12677

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12678
A=M+1 // 12679
A=A+1 // 12680
M=1 // 12681

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 12682
0;JMP // 12683

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12684
A=M+1 // 12685
A=A+1 // 12686
M=-1 // 12687

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
@Screen.drawLine.LT.2 // 12688
D=A // 12689
@SP // 12690
AM=M+1 // 12691
A=A-1 // 12692
M=D // 12693
@ARG // 12694
A=M+1 // 12695
A=A+1 // 12696
A=A+1 // 12697
D=M // 12698
A=A-1 // 12699
A=A-1 // 12700
D=M-D // 12701
@DO_LT // 12702
0;JMP // 12703
(Screen.drawLine.LT.2)
@Screen.drawLine$IF_TRUE2 // 12704
D;JNE // 12705

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 12706
0;JMP // 12707

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12708
A=M+1 // 12709
A=A+1 // 12710
A=A+1 // 12711
M=1 // 12712

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 12713
0;JMP // 12714

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12715
A=M+1 // 12716
A=A+1 // 12717
A=A+1 // 12718
M=-1 // 12719

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

@LCL // 12720
A=M+1 // 12721
D=M // 12722
A=A-1 // 12723
D=M-D // 12724
@SP // 12725
AM=M+1 // 12726
A=A-1 // 12727
M=D // 12728
@LCL // 12729
D=M // 12730
@4 // 12731
A=D+A // 12732
D=A // 12733
@R13 // 12734
M=D // 12735
@SP // 12736
AM=M-1 // 12737
D=M // 12738
@R13 // 12739
A=M // 12740
M=D // 12741

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 12742
@Screen.drawLine_WHILE_END1 // 12743
D;JNE // 12744

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12745
A=M // 12746
D=M // 12747
@SP // 12748
AM=M+1 // 12749
A=A-1 // 12750
M=D // 12751
@ARG // 12752
A=M+1 // 12753
D=M // 12754
@SP // 12755
AM=M+1 // 12756
A=A-1 // 12757
M=D // 12758
// call Screen.drawPixel
@7 // 12759
D=A // 12760
@14 // 12761
M=D // 12762
@Screen.drawPixel // 12763
D=A // 12764
@13 // 12765
M=D // 12766
@Screen.drawLine.ret.2 // 12767
D=A // 12768
@CALL // 12769
0;JMP // 12770
(Screen.drawLine.ret.2)
@SP // 12771
M=M-1 // 12772

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
@Screen.drawLine.EQ.3 // 12773
D=A // 12774
@SP // 12775
AM=M+1 // 12776
A=A-1 // 12777
M=D // 12778
@ARG // 12779
A=M+1 // 12780
A=A+1 // 12781
D=M // 12782
A=A-1 // 12783
A=A-1 // 12784
D=M-D // 12785
@DO_EQ // 12786
0;JMP // 12787
(Screen.drawLine.EQ.3)
@SP // 12788
AM=M+1 // 12789
A=A-1 // 12790
M=D // 12791
@Screen.drawLine.EQ.4 // 12792
D=A // 12793
@SP // 12794
AM=M+1 // 12795
A=A-1 // 12796
M=D // 12797
@ARG // 12798
A=M+1 // 12799
A=A+1 // 12800
A=A+1 // 12801
D=M // 12802
A=A-1 // 12803
A=A-1 // 12804
D=M-D // 12805
@DO_EQ // 12806
0;JMP // 12807
(Screen.drawLine.EQ.4)
@SP // 12808
AM=M-1 // 12809
D=D&M // 12810
@Screen.drawLine$IF_TRUE3 // 12811
D;JNE // 12812

////GotoInstruction{label='Screen.drawLine$IF_FALSE3}
// goto Screen.drawLine$IF_FALSE3
@Screen.drawLine$IF_FALSE3 // 12813
0;JMP // 12814

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 12815
AM=M+1 // 12816
A=A-1 // 12817
M=0 // 12818
@RETURN // 12819
0;JMP // 12820

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

@LCL // 12821
D=M // 12822
@4 // 12823
A=D+A // 12824
D=M // 12825
D=D+M // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=D // 12830
@LCL // 12831
D=M // 12832
@5 // 12833
A=D+A // 12834
D=A // 12835
@R13 // 12836
M=D // 12837
@SP // 12838
AM=M-1 // 12839
D=M // 12840
@R13 // 12841
A=M // 12842
M=D // 12843

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
@Screen.drawLine.GT.5 // 12844
D=A // 12845
@SP // 12846
AM=M+1 // 12847
A=A-1 // 12848
M=D // 12849
@LCL // 12850
D=M // 12851
@5 // 12852
A=D+A // 12853
D=M // 12854
@SP // 12855
AM=M+1 // 12856
A=A-1 // 12857
M=D // 12858
@LCL // 12859
A=M+1 // 12860
D=M // 12861
@SP // 12862
AM=M-1 // 12863
D=D+M // 12864
@DO_GT // 12865
0;JMP // 12866
(Screen.drawLine.GT.5)
@Screen.drawLine$IF_TRUE4 // 12867
D;JNE // 12868

////GotoInstruction{label='Screen.drawLine$IF_FALSE4}
// goto Screen.drawLine$IF_FALSE4
@Screen.drawLine$IF_FALSE4 // 12869
0;JMP // 12870

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

@LCL // 12871
D=M // 12872
@4 // 12873
A=D+A // 12874
D=M // 12875
A=A-1 // 12876
A=A-1 // 12877
A=A-1 // 12878
D=D-M // 12879
@SP // 12880
AM=M+1 // 12881
A=A-1 // 12882
M=D // 12883
@LCL // 12884
D=M // 12885
@4 // 12886
A=D+A // 12887
D=A // 12888
@R13 // 12889
M=D // 12890
@SP // 12891
AM=M-1 // 12892
D=M // 12893
@R13 // 12894
A=M // 12895
M=D // 12896

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

@LCL // 12897
A=M+1 // 12898
A=A+1 // 12899
D=M // 12900
@ARG // 12901
A=M // 12902
M=D+M // 12903

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
@Screen.drawLine.LT.6 // 12904
D=A // 12905
@SP // 12906
AM=M+1 // 12907
A=A-1 // 12908
M=D // 12909
@LCL // 12910
D=M // 12911
@5 // 12912
A=D+A // 12913
D=M // 12914
@SP // 12915
AM=M+1 // 12916
A=A-1 // 12917
M=D // 12918
@LCL // 12919
A=M // 12920
D=M // 12921
@SP // 12922
AM=M-1 // 12923
D=M-D // 12924
@DO_LT // 12925
0;JMP // 12926
(Screen.drawLine.LT.6)
@Screen.drawLine$IF_TRUE5 // 12927
D;JNE // 12928

////GotoInstruction{label='Screen.drawLine$IF_FALSE5}
// goto Screen.drawLine$IF_FALSE5
@Screen.drawLine$IF_FALSE5 // 12929
0;JMP // 12930

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

@LCL // 12931
D=M // 12932
@4 // 12933
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
D=D+M // 12945
@SP // 12946
AM=M+1 // 12947
A=A-1 // 12948
M=D // 12949
@LCL // 12950
D=M // 12951
@4 // 12952
A=D+A // 12953
D=A // 12954
@R13 // 12955
M=D // 12956
@SP // 12957
AM=M-1 // 12958
D=M // 12959
@R13 // 12960
A=M // 12961
M=D // 12962

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

@LCL // 12963
A=M+1 // 12964
A=A+1 // 12965
A=A+1 // 12966
D=M // 12967
@ARG // 12968
A=M+1 // 12969
M=D+M // 12970

////LabelInstruction{label='Screen.drawLine$IF_FALSE5}
// label Screen.drawLine$IF_FALSE5
(Screen.drawLine$IF_FALSE5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 12971
0;JMP // 12972

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12973
AM=M+1 // 12974
A=A-1 // 12975
M=0 // 12976
@RETURN // 12977
0;JMP // 12978

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 12979
AM=M+1 // 12980
A=A-1 // 12981
M=0 // 12982

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12983
A=M // 12984
D=M // 12985
@LCL // 12986
A=M // 12987
M=D // 12988

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
@Screen.drawHorizontalLine.GT.7 // 12989
D=A // 12990
@SP // 12991
AM=M+1 // 12992
A=A-1 // 12993
M=D // 12994
@LCL // 12995
A=M // 12996
D=M // 12997
@SP // 12998
AM=M+1 // 12999
A=A-1 // 13000
M=D // 13001
@ARG // 13002
A=M+1 // 13003
D=M // 13004
@SP // 13005
AM=M-1 // 13006
D=M-D // 13007
@DO_GT // 13008
0;JMP // 13009
(Screen.drawHorizontalLine.GT.7)
@Screen.drawHorizontalLine_WHILE_END1 // 13010
D;JNE // 13011

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13012
A=M // 13013
D=M // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018
@ARG // 13019
A=M+1 // 13020
A=A+1 // 13021
D=M // 13022
@SP // 13023
AM=M+1 // 13024
A=A-1 // 13025
M=D // 13026
// call Screen.drawPixel
@7 // 13027
D=A // 13028
@14 // 13029
M=D // 13030
@Screen.drawPixel // 13031
D=A // 13032
@13 // 13033
M=D // 13034
@Screen.drawHorizontalLine.ret.0 // 13035
D=A // 13036
@CALL // 13037
0;JMP // 13038
(Screen.drawHorizontalLine.ret.0)
@SP // 13039
M=M-1 // 13040

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

@LCL // 13041
A=M // 13042
M=M+1 // 13043

////GotoInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// goto Screen.drawHorizontalLine_WHILE_EXP1
@Screen.drawHorizontalLine_WHILE_EXP1 // 13044
0;JMP // 13045

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_END1}
// label Screen.drawHorizontalLine_WHILE_END1
(Screen.drawHorizontalLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13046
AM=M+1 // 13047
A=A-1 // 13048
M=0 // 13049
@RETURN // 13050
0;JMP // 13051

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13052
D=A // 13053
@SP // 13054
AM=D+M // 13055
A=A-1 // 13056
M=0 // 13057
A=A-1 // 13058
M=0 // 13059
A=A-1 // 13060
M=0 // 13061
A=A-1 // 13062
M=0 // 13063
A=A-1 // 13064
M=0 // 13065

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13066
A=M // 13067
M=0 // 13068

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13069
A=M+1 // 13070
A=A+1 // 13071
D=M // 13072
@LCL // 13073
A=M+1 // 13074
M=D // 13075

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

@ARG // 13076
A=M+1 // 13077
A=A+1 // 13078
D=M // 13079
D=D-1 // 13080
D=-D // 13081
@LCL // 13082
A=M+1 // 13083
A=A+1 // 13084
M=D // 13085

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
@Screen.drawCircle.GT.8 // 13086
D=A // 13087
@SP // 13088
AM=M+1 // 13089
A=A-1 // 13090
M=D // 13091
@LCL // 13092
A=M+1 // 13093
D=M // 13094
A=A-1 // 13095
D=M-D // 13096
@DO_GT // 13097
0;JMP // 13098
(Screen.drawCircle.GT.8)
@Screen.drawCircle_WHILE_END1 // 13099
D;JNE // 13100

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

@ARG // 13101
A=M // 13102
D=M // 13103
@SP // 13104
AM=M+1 // 13105
A=A-1 // 13106
M=D // 13107
@LCL // 13108
A=M // 13109
D=M // 13110
@SP // 13111
AM=M-1 // 13112
D=M-D // 13113
@SP // 13114
AM=M+1 // 13115
A=A-1 // 13116
M=D // 13117
@ARG // 13118
A=M // 13119
D=M // 13120
@SP // 13121
AM=M+1 // 13122
A=A-1 // 13123
M=D // 13124
@LCL // 13125
A=M // 13126
D=M // 13127
@SP // 13128
AM=M-1 // 13129
D=D+M // 13130
@SP // 13131
AM=M+1 // 13132
A=A-1 // 13133
M=D // 13134
@ARG // 13135
A=M+1 // 13136
D=M // 13137
@SP // 13138
AM=M+1 // 13139
A=A-1 // 13140
M=D // 13141
@LCL // 13142
A=M+1 // 13143
D=M // 13144
@SP // 13145
AM=M-1 // 13146
D=D+M // 13147
@SP // 13148
AM=M+1 // 13149
A=A-1 // 13150
M=D // 13151
// call Screen.drawHorizontalLine
@8 // 13152
D=A // 13153
@14 // 13154
M=D // 13155
@Screen.drawHorizontalLine // 13156
D=A // 13157
@13 // 13158
M=D // 13159
@Screen.drawCircle.ret.0 // 13160
D=A // 13161
@CALL // 13162
0;JMP // 13163
(Screen.drawCircle.ret.0)
@SP // 13164
M=M-1 // 13165

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

@ARG // 13166
A=M // 13167
D=M // 13168
@SP // 13169
AM=M+1 // 13170
A=A-1 // 13171
M=D // 13172
@LCL // 13173
A=M // 13174
D=M // 13175
@SP // 13176
AM=M-1 // 13177
D=M-D // 13178
@SP // 13179
AM=M+1 // 13180
A=A-1 // 13181
M=D // 13182
@ARG // 13183
A=M // 13184
D=M // 13185
@SP // 13186
AM=M+1 // 13187
A=A-1 // 13188
M=D // 13189
@LCL // 13190
A=M // 13191
D=M // 13192
@SP // 13193
AM=M-1 // 13194
D=D+M // 13195
@SP // 13196
AM=M+1 // 13197
A=A-1 // 13198
M=D // 13199
@ARG // 13200
A=M+1 // 13201
D=M // 13202
@SP // 13203
AM=M+1 // 13204
A=A-1 // 13205
M=D // 13206
@LCL // 13207
A=M+1 // 13208
D=M // 13209
@SP // 13210
AM=M-1 // 13211
D=M-D // 13212
@SP // 13213
AM=M+1 // 13214
A=A-1 // 13215
M=D // 13216
// call Screen.drawHorizontalLine
@8 // 13217
D=A // 13218
@14 // 13219
M=D // 13220
@Screen.drawHorizontalLine // 13221
D=A // 13222
@13 // 13223
M=D // 13224
@Screen.drawCircle.ret.1 // 13225
D=A // 13226
@CALL // 13227
0;JMP // 13228
(Screen.drawCircle.ret.1)
@SP // 13229
M=M-1 // 13230

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

@ARG // 13231
A=M // 13232
D=M // 13233
@SP // 13234
AM=M+1 // 13235
A=A-1 // 13236
M=D // 13237
@LCL // 13238
A=M+1 // 13239
D=M // 13240
@SP // 13241
AM=M-1 // 13242
D=M-D // 13243
@SP // 13244
AM=M+1 // 13245
A=A-1 // 13246
M=D // 13247
@ARG // 13248
A=M // 13249
D=M // 13250
@SP // 13251
AM=M+1 // 13252
A=A-1 // 13253
M=D // 13254
@LCL // 13255
A=M+1 // 13256
D=M // 13257
@SP // 13258
AM=M-1 // 13259
D=D+M // 13260
@SP // 13261
AM=M+1 // 13262
A=A-1 // 13263
M=D // 13264
@ARG // 13265
A=M+1 // 13266
D=M // 13267
@SP // 13268
AM=M+1 // 13269
A=A-1 // 13270
M=D // 13271
@LCL // 13272
A=M // 13273
D=M // 13274
@SP // 13275
AM=M-1 // 13276
D=D+M // 13277
@SP // 13278
AM=M+1 // 13279
A=A-1 // 13280
M=D // 13281
// call Screen.drawHorizontalLine
@8 // 13282
D=A // 13283
@14 // 13284
M=D // 13285
@Screen.drawHorizontalLine // 13286
D=A // 13287
@13 // 13288
M=D // 13289
@Screen.drawCircle.ret.2 // 13290
D=A // 13291
@CALL // 13292
0;JMP // 13293
(Screen.drawCircle.ret.2)
@SP // 13294
M=M-1 // 13295

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

@ARG // 13296
A=M // 13297
D=M // 13298
@SP // 13299
AM=M+1 // 13300
A=A-1 // 13301
M=D // 13302
@LCL // 13303
A=M+1 // 13304
D=M // 13305
@SP // 13306
AM=M-1 // 13307
D=M-D // 13308
@SP // 13309
AM=M+1 // 13310
A=A-1 // 13311
M=D // 13312
@ARG // 13313
A=M // 13314
D=M // 13315
@SP // 13316
AM=M+1 // 13317
A=A-1 // 13318
M=D // 13319
@LCL // 13320
A=M+1 // 13321
D=M // 13322
@SP // 13323
AM=M-1 // 13324
D=D+M // 13325
@SP // 13326
AM=M+1 // 13327
A=A-1 // 13328
M=D // 13329
@ARG // 13330
A=M+1 // 13331
D=M // 13332
@SP // 13333
AM=M+1 // 13334
A=A-1 // 13335
M=D // 13336
@LCL // 13337
A=M // 13338
D=M // 13339
@SP // 13340
AM=M-1 // 13341
D=M-D // 13342
@SP // 13343
AM=M+1 // 13344
A=A-1 // 13345
M=D // 13346
// call Screen.drawHorizontalLine
@8 // 13347
D=A // 13348
@14 // 13349
M=D // 13350
@Screen.drawHorizontalLine // 13351
D=A // 13352
@13 // 13353
M=D // 13354
@Screen.drawCircle.ret.3 // 13355
D=A // 13356
@CALL // 13357
0;JMP // 13358
(Screen.drawCircle.ret.3)
@SP // 13359
M=M-1 // 13360

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.9 // 13361
D=A // 13362
@SP // 13363
AM=M+1 // 13364
A=A-1 // 13365
M=D // 13366
@LCL // 13367
A=M+1 // 13368
A=A+1 // 13369
D=M // 13370
@DO_LT // 13371
0;JMP // 13372
(Screen.drawCircle.LT.9)
@Screen.drawCircle$IF_TRUE1 // 13373
D;JNE // 13374

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13375
0;JMP // 13376

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

@LCL // 13377
A=M+1 // 13378
A=A+1 // 13379
D=M // 13380
@SP // 13381
AM=M+1 // 13382
A=A-1 // 13383
M=D // 13384
@LCL // 13385
A=M // 13386
D=M // 13387
D=D+M // 13388
@SP // 13389
AM=M-1 // 13390
D=D+M // 13391
@3 // 13392
D=D+A // 13393
@LCL // 13394
A=M+1 // 13395
A=A+1 // 13396
M=D // 13397

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13398
0;JMP // 13399

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

@LCL // 13400
A=M+1 // 13401
A=A+1 // 13402
D=M // 13403
@SP // 13404
AM=M+1 // 13405
A=A-1 // 13406
M=D // 13407
@LCL // 13408
A=M+1 // 13409
D=M // 13410
A=A-1 // 13411
D=M-D // 13412
@R13 // 13413
M=D // 13414
D=D+M // 13415
@SP // 13416
AM=M-1 // 13417
D=D+M // 13418
@5 // 13419
D=D+A // 13420
@LCL // 13421
A=M+1 // 13422
A=A+1 // 13423
M=D // 13424

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

@LCL // 13425
A=M+1 // 13426
M=M-1 // 13427

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

@LCL // 13428
A=M // 13429
M=M+1 // 13430

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13431
0;JMP // 13432

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13433
AM=M+1 // 13434
A=A-1 // 13435
M=0 // 13436
@RETURN // 13437
0;JMP // 13438

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13439
D=A // 13440
@SP // 13441
AM=D+M // 13442
A=A-1 // 13443
M=0 // 13444
A=A-1 // 13445
M=0 // 13446
A=A-1 // 13447
M=0 // 13448
A=A-1 // 13449
M=0 // 13450
A=A-1 // 13451
M=0 // 13452
A=A-1 // 13453
M=0 // 13454
A=A-1 // 13455
M=0 // 13456
A=A-1 // 13457
M=0 // 13458
A=A-1 // 13459
M=0 // 13460
A=A-1 // 13461
M=0 // 13462

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13463
D=M // 13464
@9 // 13465
A=D+A // 13466
M=-1 // 13467

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE1}}
@Screen.0 // 13468
D=!M // 13469
@Screen.drawRectangle$IF_TRUE1 // 13470
D;JNE // 13471

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE1}
// goto Screen.drawRectangle$IF_FALSE1
@Screen.drawRectangle$IF_FALSE1 // 13472
0;JMP // 13473

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE1}
// label Screen.drawRectangle$IF_TRUE1
(Screen.drawRectangle$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13474
D=M // 13475
@9 // 13476
A=D+A // 13477
M=0 // 13478

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE1}
// label Screen.drawRectangle$IF_FALSE1
(Screen.drawRectangle$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13479
A=M+1 // 13480
D=M // 13481
@LCL // 13482
A=M // 13483
M=D // 13484

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
@Screen.drawRectangle.GT.10 // 13485
D=A // 13486
@SP // 13487
AM=M+1 // 13488
A=A-1 // 13489
M=D // 13490
@LCL // 13491
A=M // 13492
D=M // 13493
@SP // 13494
AM=M+1 // 13495
A=A-1 // 13496
M=D // 13497
@ARG // 13498
A=M+1 // 13499
A=A+1 // 13500
A=A+1 // 13501
D=M // 13502
@SP // 13503
AM=M-1 // 13504
D=M-D // 13505
@DO_GT // 13506
0;JMP // 13507
(Screen.drawRectangle.GT.10)
@Screen.drawRectangle_WHILE_END1 // 13508
D;JNE // 13509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13510
A=M // 13511
D=M // 13512
@SP // 13513
AM=M+1 // 13514
A=A-1 // 13515
M=D // 13516
@16 // 13517
D=A // 13518
@SP // 13519
AM=M+1 // 13520
A=A-1 // 13521
M=D // 13522
// call Math.divide
@7 // 13523
D=A // 13524
@14 // 13525
M=D // 13526
@Math.divide // 13527
D=A // 13528
@13 // 13529
M=D // 13530
@Screen.drawRectangle.ret.0 // 13531
D=A // 13532
@CALL // 13533
0;JMP // 13534
(Screen.drawRectangle.ret.0)
@SP // 13535
AM=M-1 // 13536
D=M // 13537
@LCL // 13538
A=M+1 // 13539
M=D // 13540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13541
A=M+1 // 13542
A=A+1 // 13543
D=M // 13544
@SP // 13545
AM=M+1 // 13546
A=A-1 // 13547
M=D // 13548
@16 // 13549
D=A // 13550
@SP // 13551
AM=M+1 // 13552
A=A-1 // 13553
M=D // 13554
// call Math.divide
@7 // 13555
D=A // 13556
@14 // 13557
M=D // 13558
@Math.divide // 13559
D=A // 13560
@13 // 13561
M=D // 13562
@Screen.drawRectangle.ret.1 // 13563
D=A // 13564
@CALL // 13565
0;JMP // 13566
(Screen.drawRectangle.ret.1)
@SP // 13567
AM=M-1 // 13568
D=M // 13569
@LCL // 13570
A=M+1 // 13571
A=A+1 // 13572
M=D // 13573

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

@ARG // 13574
A=M // 13575
D=M // 13576
@15 // 13577
D=D&A // 13578
@LCL // 13579
A=M+1 // 13580
A=A+1 // 13581
A=A+1 // 13582
M=D // 13583

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

@ARG // 13584
A=M+1 // 13585
A=A+1 // 13586
D=M // 13587
@15 // 13588
D=D&A // 13589
@SP // 13590
AM=M+1 // 13591
A=A-1 // 13592
M=D // 13593
@LCL // 13594
D=M // 13595
@4 // 13596
A=D+A // 13597
D=A // 13598
@R13 // 13599
M=D // 13600
@SP // 13601
AM=M-1 // 13602
D=M // 13603
@R13 // 13604
A=M // 13605
M=D // 13606

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13607
A=M // 13608
D=M // 13609
@SP // 13610
AM=M+1 // 13611
A=A-1 // 13612
M=D // 13613
@32 // 13614
D=A // 13615
@SP // 13616
AM=M+1 // 13617
A=A-1 // 13618
M=D // 13619
// call Math.multiply
@7 // 13620
D=A // 13621
@14 // 13622
M=D // 13623
@Math.multiply // 13624
D=A // 13625
@13 // 13626
M=D // 13627
@Screen.drawRectangle.ret.2 // 13628
D=A // 13629
@CALL // 13630
0;JMP // 13631
(Screen.drawRectangle.ret.2)
@LCL // 13632
D=M // 13633
@5 // 13634
A=D+A // 13635
D=A // 13636
@R13 // 13637
M=D // 13638
@SP // 13639
AM=M-1 // 13640
D=M // 13641
@R13 // 13642
A=M // 13643
M=D // 13644

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE2}}
@Screen.drawRectangle.EQ.11 // 13645
D=A // 13646
@SP // 13647
AM=M+1 // 13648
A=A-1 // 13649
M=D // 13650
@LCL // 13651
A=M+1 // 13652
A=A+1 // 13653
D=M // 13654
A=A-1 // 13655
D=M-D // 13656
@DO_EQ // 13657
0;JMP // 13658
(Screen.drawRectangle.EQ.11)
@Screen.drawRectangle$IF_TRUE2 // 13659
D;JNE // 13660

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE2}
// goto Screen.drawRectangle$IF_FALSE2
@Screen.drawRectangle$IF_FALSE2 // 13661
0;JMP // 13662

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

@LCL // 13663
D=M // 13664
@4 // 13665
A=D+A // 13666
D=M // 13667
@SP // 13668
AM=M+1 // 13669
A=A-1 // 13670
M=D+1 // 13671
// call Math.twoToThe
@6 // 13672
D=A // 13673
@14 // 13674
M=D // 13675
@Math.twoToThe // 13676
D=A // 13677
@13 // 13678
M=D // 13679
@Screen.drawRectangle.ret.3 // 13680
D=A // 13681
@CALL // 13682
0;JMP // 13683
(Screen.drawRectangle.ret.3)
@SP // 13684
AM=M-1 // 13685
D=M // 13686
D=D-1 // 13687
@SP // 13688
AM=M+1 // 13689
A=A-1 // 13690
M=D // 13691
@LCL // 13692
A=M+1 // 13693
A=A+1 // 13694
A=A+1 // 13695
D=M // 13696
@SP // 13697
AM=M+1 // 13698
A=A-1 // 13699
M=D // 13700
// call Math.twoToThe
@6 // 13701
D=A // 13702
@14 // 13703
M=D // 13704
@Math.twoToThe // 13705
D=A // 13706
@13 // 13707
M=D // 13708
@Screen.drawRectangle.ret.4 // 13709
D=A // 13710
@CALL // 13711
0;JMP // 13712
(Screen.drawRectangle.ret.4)
@SP // 13713
AM=M-1 // 13714
D=M // 13715
D=D-1 // 13716
@SP // 13717
AM=M-1 // 13718
D=M-D // 13719
@SP // 13720
AM=M+1 // 13721
A=A-1 // 13722
M=D // 13723
@LCL // 13724
D=M // 13725
@6 // 13726
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

@LCL // 13737
D=M // 13738
@5 // 13739
A=D+A // 13740
D=M // 13741
@SP // 13742
AM=M+1 // 13743
A=A-1 // 13744
M=D // 13745
@LCL // 13746
A=M+1 // 13747
D=M // 13748
@SP // 13749
AM=M-1 // 13750
D=D+M // 13751
@SP // 13752
AM=M+1 // 13753
A=A-1 // 13754
M=D // 13755
@LCL // 13756
D=M // 13757
@7 // 13758
A=D+A // 13759
D=A // 13760
@R13 // 13761
M=D // 13762
@SP // 13763
AM=M-1 // 13764
D=M // 13765
@R13 // 13766
A=M // 13767
M=D // 13768

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE3}}
@Screen.0 // 13769
D=M // 13770
@Screen.drawRectangle$IF_TRUE3 // 13771
D;JNE // 13772

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE3}
// goto Screen.drawRectangle$IF_FALSE3
@Screen.drawRectangle$IF_FALSE3 // 13773
0;JMP // 13774

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
@LCL // 13775
D=M // 13776
@7 // 13777
A=D+A // 13778
D=M // 13779
@16384 // 13780
D=D+A // 13781
@SP // 13782
AM=M+1 // 13783
A=A-1 // 13784
M=D // 13785
@LCL // 13786
D=M // 13787
@7 // 13788
A=D+A // 13789
D=M // 13790
@16384 // 13791
A=D+A // 13792
D=M // 13793
@SP // 13794
AM=M+1 // 13795
A=A-1 // 13796
M=D // 13797
@LCL // 13798
D=M // 13799
@6 // 13800
A=D+A // 13801
D=M // 13802
@SP // 13803
AM=M-1 // 13804
D=D|M // 13805
@SP // 13806
AM=M-1 // 13807
A=M // 13808
M=D // 13809

////GotoInstruction{label='Screen.drawRectangle$IF_END3}
// goto Screen.drawRectangle$IF_END3
@Screen.drawRectangle$IF_END3 // 13810
0;JMP // 13811

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
@LCL // 13812
D=M // 13813
@7 // 13814
A=D+A // 13815
D=M // 13816
@16384 // 13817
D=D+A // 13818
@SP // 13819
AM=M+1 // 13820
A=A-1 // 13821
M=D // 13822
@LCL // 13823
D=M // 13824
@7 // 13825
A=D+A // 13826
D=M // 13827
@16384 // 13828
A=D+A // 13829
D=M // 13830
@SP // 13831
AM=M+1 // 13832
A=A-1 // 13833
M=D // 13834
@LCL // 13835
D=M // 13836
@6 // 13837
A=D+A // 13838
D=!M // 13839
@SP // 13840
AM=M-1 // 13841
D=D&M // 13842
@SP // 13843
AM=M-1 // 13844
A=M // 13845
M=D // 13846

////LabelInstruction{label='Screen.drawRectangle$IF_END3}
// label Screen.drawRectangle$IF_END3
(Screen.drawRectangle$IF_END3)

////GotoInstruction{label='Screen.drawRectangle$IF_END2}
// goto Screen.drawRectangle$IF_END2
@Screen.drawRectangle$IF_END2 // 13847
0;JMP // 13848

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

@LCL // 13849
A=M+1 // 13850
A=A+1 // 13851
A=A+1 // 13852
D=M // 13853
@SP // 13854
AM=M+1 // 13855
A=A-1 // 13856
M=D // 13857
// call Math.twoToThe
@6 // 13858
D=A // 13859
@14 // 13860
M=D // 13861
@Math.twoToThe // 13862
D=A // 13863
@13 // 13864
M=D // 13865
@Screen.drawRectangle.ret.5 // 13866
D=A // 13867
@CALL // 13868
0;JMP // 13869
(Screen.drawRectangle.ret.5)
@SP // 13870
AM=M-1 // 13871
D=M // 13872
D=D-1 // 13873
@SP // 13874
AM=M+1 // 13875
A=A-1 // 13876
M=D // 13877
@SP // 13878
A=M-1 // 13879
M=!D // 13880
@LCL // 13881
D=M // 13882
@6 // 13883
A=D+A // 13884
D=A // 13885
@R13 // 13886
M=D // 13887
@SP // 13888
AM=M-1 // 13889
D=M // 13890
@R13 // 13891
A=M // 13892
M=D // 13893

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

@LCL // 13894
D=M // 13895
@5 // 13896
A=D+A // 13897
D=M // 13898
@SP // 13899
AM=M+1 // 13900
A=A-1 // 13901
M=D // 13902
@LCL // 13903
A=M+1 // 13904
D=M // 13905
@SP // 13906
AM=M-1 // 13907
D=D+M // 13908
@SP // 13909
AM=M+1 // 13910
A=A-1 // 13911
M=D // 13912
@LCL // 13913
D=M // 13914
@7 // 13915
A=D+A // 13916
D=A // 13917
@R13 // 13918
M=D // 13919
@SP // 13920
AM=M-1 // 13921
D=M // 13922
@R13 // 13923
A=M // 13924
M=D // 13925

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE4}}
@Screen.0 // 13926
D=M // 13927
@Screen.drawRectangle$IF_TRUE4 // 13928
D;JNE // 13929

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE4}
// goto Screen.drawRectangle$IF_FALSE4
@Screen.drawRectangle$IF_FALSE4 // 13930
0;JMP // 13931

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
@LCL // 13932
D=M // 13933
@7 // 13934
A=D+A // 13935
D=M // 13936
@16384 // 13937
D=D+A // 13938
@SP // 13939
AM=M+1 // 13940
A=A-1 // 13941
M=D // 13942
@LCL // 13943
D=M // 13944
@7 // 13945
A=D+A // 13946
D=M // 13947
@16384 // 13948
A=D+A // 13949
D=M // 13950
@SP // 13951
AM=M+1 // 13952
A=A-1 // 13953
M=D // 13954
@LCL // 13955
D=M // 13956
@6 // 13957
A=D+A // 13958
D=M // 13959
@SP // 13960
AM=M-1 // 13961
D=D|M // 13962
@SP // 13963
AM=M-1 // 13964
A=M // 13965
M=D // 13966

////GotoInstruction{label='Screen.drawRectangle$IF_END4}
// goto Screen.drawRectangle$IF_END4
@Screen.drawRectangle$IF_END4 // 13967
0;JMP // 13968

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
@LCL // 13969
D=M // 13970
@7 // 13971
A=D+A // 13972
D=M // 13973
@16384 // 13974
D=D+A // 13975
@SP // 13976
AM=M+1 // 13977
A=A-1 // 13978
M=D // 13979
@LCL // 13980
D=M // 13981
@7 // 13982
A=D+A // 13983
D=M // 13984
@16384 // 13985
A=D+A // 13986
D=M // 13987
@SP // 13988
AM=M+1 // 13989
A=A-1 // 13990
M=D // 13991
@LCL // 13992
D=M // 13993
@6 // 13994
A=D+A // 13995
D=!M // 13996
@SP // 13997
AM=M-1 // 13998
D=D&M // 13999
@SP // 14000
AM=M-1 // 14001
A=M // 14002
M=D // 14003

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

@LCL // 14004
A=M+1 // 14005
D=M // 14006
@SP // 14007
AM=M+1 // 14008
A=A-1 // 14009
M=D+1 // 14010
@LCL // 14011
D=M // 14012
@8 // 14013
A=D+A // 14014
D=A // 14015
@R13 // 14016
M=D // 14017
@SP // 14018
AM=M-1 // 14019
D=M // 14020
@R13 // 14021
A=M // 14022
M=D // 14023

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
@Screen.drawRectangle.LT.12 // 14024
D=A // 14025
@SP // 14026
AM=M+1 // 14027
A=A-1 // 14028
M=D // 14029
@LCL // 14030
D=M // 14031
@8 // 14032
A=D+A // 14033
D=M // 14034
@SP // 14035
AM=M+1 // 14036
A=A-1 // 14037
M=D // 14038
@LCL // 14039
A=M+1 // 14040
A=A+1 // 14041
D=M // 14042
@SP // 14043
AM=M-1 // 14044
D=M-D // 14045
@DO_LT // 14046
0;JMP // 14047
(Screen.drawRectangle.LT.12)
D=!D // 14048
@Screen.drawRectangle_WHILE_END2 // 14049
D;JNE // 14050

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

@LCL // 14051
D=M // 14052
@8 // 14053
A=D+A // 14054
D=M // 14055
A=A-1 // 14056
A=A-1 // 14057
A=A-1 // 14058
D=D+M // 14059
@SP // 14060
AM=M+1 // 14061
A=A-1 // 14062
M=D // 14063
@LCL // 14064
D=M // 14065
@7 // 14066
A=D+A // 14067
D=A // 14068
@R13 // 14069
M=D // 14070
@SP // 14071
AM=M-1 // 14072
D=M // 14073
@R13 // 14074
A=M // 14075
M=D // 14076

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14077
D=M // 14078
@7 // 14079
A=D+A // 14080
D=M // 14081
@16384 // 14082
D=D+A // 14083
@SP // 14084
AM=M+1 // 14085
A=A-1 // 14086
M=D // 14087
@LCL // 14088
D=M // 14089
@9 // 14090
A=D+A // 14091
D=M // 14092
@SP // 14093
AM=M-1 // 14094
A=M // 14095
M=D // 14096

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

@LCL // 14097
D=M // 14098
@8 // 14099
A=D+A // 14100
M=M+1 // 14101

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// goto Screen.drawRectangle_WHILE_EXP2
@Screen.drawRectangle_WHILE_EXP2 // 14102
0;JMP // 14103

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

@LCL // 14104
D=M // 14105
@4 // 14106
A=D+A // 14107
D=M // 14108
@SP // 14109
AM=M+1 // 14110
A=A-1 // 14111
M=D+1 // 14112
// call Math.twoToThe
@6 // 14113
D=A // 14114
@14 // 14115
M=D // 14116
@Math.twoToThe // 14117
D=A // 14118
@13 // 14119
M=D // 14120
@Screen.drawRectangle.ret.6 // 14121
D=A // 14122
@CALL // 14123
0;JMP // 14124
(Screen.drawRectangle.ret.6)
@SP // 14125
AM=M-1 // 14126
D=M // 14127
D=D-1 // 14128
@SP // 14129
AM=M+1 // 14130
A=A-1 // 14131
M=D // 14132
@LCL // 14133
D=M // 14134
@6 // 14135
A=D+A // 14136
D=A // 14137
@R13 // 14138
M=D // 14139
@SP // 14140
AM=M-1 // 14141
D=M // 14142
@R13 // 14143
A=M // 14144
M=D // 14145

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

@LCL // 14146
D=M // 14147
@5 // 14148
A=D+A // 14149
D=M // 14150
A=A-1 // 14151
A=A-1 // 14152
A=A-1 // 14153
D=D+M // 14154
@SP // 14155
AM=M+1 // 14156
A=A-1 // 14157
M=D // 14158
@LCL // 14159
D=M // 14160
@7 // 14161
A=D+A // 14162
D=A // 14163
@R13 // 14164
M=D // 14165
@SP // 14166
AM=M-1 // 14167
D=M // 14168
@R13 // 14169
A=M // 14170
M=D // 14171

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE5}}
@Screen.0 // 14172
D=M // 14173
@Screen.drawRectangle$IF_TRUE5 // 14174
D;JNE // 14175

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE5}
// goto Screen.drawRectangle$IF_FALSE5
@Screen.drawRectangle$IF_FALSE5 // 14176
0;JMP // 14177

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
@LCL // 14178
D=M // 14179
@7 // 14180
A=D+A // 14181
D=M // 14182
@16384 // 14183
D=D+A // 14184
@SP // 14185
AM=M+1 // 14186
A=A-1 // 14187
M=D // 14188
@LCL // 14189
D=M // 14190
@7 // 14191
A=D+A // 14192
D=M // 14193
@16384 // 14194
A=D+A // 14195
D=M // 14196
@SP // 14197
AM=M+1 // 14198
A=A-1 // 14199
M=D // 14200
@LCL // 14201
D=M // 14202
@6 // 14203
A=D+A // 14204
D=M // 14205
@SP // 14206
AM=M-1 // 14207
D=D|M // 14208
@SP // 14209
AM=M-1 // 14210
A=M // 14211
M=D // 14212

////GotoInstruction{label='Screen.drawRectangle$IF_END5}
// goto Screen.drawRectangle$IF_END5
@Screen.drawRectangle$IF_END5 // 14213
0;JMP // 14214

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
@LCL // 14215
D=M // 14216
@7 // 14217
A=D+A // 14218
D=M // 14219
@16384 // 14220
D=D+A // 14221
@SP // 14222
AM=M+1 // 14223
A=A-1 // 14224
M=D // 14225
@LCL // 14226
D=M // 14227
@7 // 14228
A=D+A // 14229
D=M // 14230
@16384 // 14231
A=D+A // 14232
D=M // 14233
@SP // 14234
AM=M+1 // 14235
A=A-1 // 14236
M=D // 14237
@LCL // 14238
D=M // 14239
@6 // 14240
A=D+A // 14241
D=!M // 14242
@SP // 14243
AM=M-1 // 14244
D=D&M // 14245
@SP // 14246
AM=M-1 // 14247
A=M // 14248
M=D // 14249

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

@LCL // 14250
A=M // 14251
M=M+1 // 14252

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// goto Screen.drawRectangle_WHILE_EXP1
@Screen.drawRectangle_WHILE_EXP1 // 14253
0;JMP // 14254

////LabelInstruction{label='Screen.drawRectangle_WHILE_END1}
// label Screen.drawRectangle_WHILE_END1
(Screen.drawRectangle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14255
AM=M+1 // 14256
A=A-1 // 14257
M=0 // 14258
@RETURN // 14259
0;JMP // 14260

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14261
AM=M+1 // 14262
A=A-1 // 14263
M=0 // 14264

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14265
A=M // 14266
M=0 // 14267

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
@Screen.clearScreen.LT.13 // 14268
D=A // 14269
@SP // 14270
AM=M+1 // 14271
A=A-1 // 14272
M=D // 14273
@LCL // 14274
A=M // 14275
D=M // 14276
@8192 // 14277
D=D-A // 14278
@DO_LT // 14279
0;JMP // 14280
(Screen.clearScreen.LT.13)
D=!D // 14281
@Screen.clearScreen_WHILE_END1 // 14282
D;JNE // 14283

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14284
A=M // 14285
D=M // 14286
@16384 // 14287
D=D+A // 14288
@SP // 14289
AM=M+1 // 14290
A=A-1 // 14291
M=D // 14292
D=0 // 14293
@SP // 14294
AM=M-1 // 14295
A=M // 14296
M=D // 14297

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

@LCL // 14298
A=M // 14299
M=M+1 // 14300

////GotoInstruction{label='Screen.clearScreen_WHILE_EXP1}
// goto Screen.clearScreen_WHILE_EXP1
@Screen.clearScreen_WHILE_EXP1 // 14301
0;JMP // 14302

////LabelInstruction{label='Screen.clearScreen_WHILE_END1}
// label Screen.clearScreen_WHILE_END1
(Screen.clearScreen_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14303
AM=M+1 // 14304
A=A-1 // 14305
M=0 // 14306
@RETURN // 14307
0;JMP // 14308

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14309
D=A // 14310
@SP // 14311
AM=M+1 // 14312
A=A-1 // 14313
M=D // 14314
// call Memory.alloc
@6 // 14315
D=A // 14316
@14 // 14317
M=D // 14318
@Memory.alloc // 14319
D=A // 14320
@13 // 14321
M=D // 14322
@String.new.ret.0 // 14323
D=A // 14324
@CALL // 14325
0;JMP // 14326
(String.new.ret.0)
@SP // 14327
AM=M-1 // 14328
D=M // 14329
@3 // 14330
M=D // 14331

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.0 // 14332
D=A // 14333
@SP // 14334
AM=M+1 // 14335
A=A-1 // 14336
M=D // 14337
@ARG // 14338
A=M // 14339
D=M // 14340
@DO_EQ // 14341
0;JMP // 14342
(String.new.EQ.0)
@String.new$IF_TRUE1 // 14343
D;JNE // 14344

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 14345
0;JMP // 14346

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14347
A=M // 14348
M=0 // 14349

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 14350
0;JMP // 14351

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14352
A=M // 14353
D=M // 14354
@SP // 14355
AM=M+1 // 14356
A=A-1 // 14357
M=D // 14358
// call Array.new
@6 // 14359
D=A // 14360
@14 // 14361
M=D // 14362
@Array.new // 14363
D=A // 14364
@13 // 14365
M=D // 14366
@String.new.ret.1 // 14367
D=A // 14368
@CALL // 14369
0;JMP // 14370
(String.new.ret.1)
@SP // 14371
AM=M-1 // 14372
D=M // 14373
@THIS // 14374
A=M // 14375
M=D // 14376

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14377
A=M // 14378
D=M // 14379
@THIS // 14380
A=M+1 // 14381
A=A+1 // 14382
M=D // 14383

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14384
A=M+1 // 14385
M=0 // 14386

////PushInstruction("pointer 0")
@3 // 14387
D=M // 14388
@SP // 14389
AM=M+1 // 14390
A=A-1 // 14391
M=D // 14392
@RETURN // 14393
0;JMP // 14394

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14395
A=M // 14396
D=M // 14397
@3 // 14398
M=D // 14399

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.dispose$IF_TRUE1}}
@String.dispose.EQ.1 // 14400
D=A // 14401
@SP // 14402
AM=M+1 // 14403
A=A-1 // 14404
M=D // 14405
@THIS // 14406
A=M // 14407
D=M // 14408
@DO_EQ // 14409
0;JMP // 14410
(String.dispose.EQ.1)
D=!D // 14411
@String.dispose$IF_TRUE1 // 14412
D;JNE // 14413

////GotoInstruction{label='String.dispose$IF_FALSE1}
// goto String.dispose$IF_FALSE1
@String.dispose$IF_FALSE1 // 14414
0;JMP // 14415

////LabelInstruction{label='String.dispose$IF_TRUE1}
// label String.dispose$IF_TRUE1
(String.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14416
A=M // 14417
D=M // 14418
@SP // 14419
AM=M+1 // 14420
A=A-1 // 14421
M=D // 14422
// call Array.dispose
@6 // 14423
D=A // 14424
@14 // 14425
M=D // 14426
@Array.dispose // 14427
D=A // 14428
@13 // 14429
M=D // 14430
@String.dispose.ret.0 // 14431
D=A // 14432
@CALL // 14433
0;JMP // 14434
(String.dispose.ret.0)
@SP // 14435
M=M-1 // 14436

////LabelInstruction{label='String.dispose$IF_FALSE1}
// label String.dispose$IF_FALSE1
(String.dispose$IF_FALSE1)

////PushInstruction("constant 0")
@SP // 14437
AM=M+1 // 14438
A=A-1 // 14439
M=0 // 14440
@RETURN // 14441
0;JMP // 14442

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14443
A=M // 14444
D=M // 14445
@3 // 14446
M=D // 14447

////PushInstruction("this 1")
@THIS // 14448
A=M+1 // 14449
D=M // 14450
@SP // 14451
AM=M+1 // 14452
A=A-1 // 14453
M=D // 14454
@RETURN // 14455
0;JMP // 14456

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14457
A=M // 14458
D=M // 14459
@3 // 14460
M=D // 14461

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
@THIS // 14462
A=M // 14463
D=M // 14464
@SP // 14465
AM=M+1 // 14466
A=A-1 // 14467
M=D // 14468
@ARG // 14469
A=M+1 // 14470
D=M // 14471
@SP // 14472
AM=M-1 // 14473
A=D+M // 14474
D=M // 14475
@SP // 14476
AM=M+1 // 14477
A=A-1 // 14478
M=D // 14479
@RETURN // 14480
0;JMP // 14481

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14482
A=M // 14483
D=M // 14484
@3 // 14485
M=D // 14486

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14487
A=M // 14488
D=M // 14489
@SP // 14490
AM=M+1 // 14491
A=A-1 // 14492
M=D // 14493
@ARG // 14494
A=M+1 // 14495
D=M // 14496
@SP // 14497
AM=M-1 // 14498
D=D+M // 14499
@SP // 14500
AM=M+1 // 14501
A=A-1 // 14502
M=D // 14503
@ARG // 14504
A=M+1 // 14505
A=A+1 // 14506
D=M // 14507
@SP // 14508
AM=M-1 // 14509
A=M // 14510
M=D // 14511

////PushInstruction("constant 0")
@SP // 14512
AM=M+1 // 14513
A=A-1 // 14514
M=0 // 14515
@RETURN // 14516
0;JMP // 14517

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14518
AM=M+1 // 14519
A=A-1 // 14520
M=0 // 14521

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14522
A=M // 14523
D=M // 14524
@3 // 14525
M=D // 14526

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.2 // 14527
D=A // 14528
@SP // 14529
AM=M+1 // 14530
A=A-1 // 14531
M=D // 14532
@THIS // 14533
A=M+1 // 14534
A=A+1 // 14535
D=M // 14536
A=A-1 // 14537
D=M-D // 14538
@DO_EQ // 14539
0;JMP // 14540
(String.appendChar.EQ.2)
@String.appendChar$IF_TRUE1 // 14541
D;JNE // 14542

////GotoInstruction{label='String.appendChar$IF_FALSE1}
// goto String.appendChar$IF_FALSE1
@String.appendChar$IF_FALSE1 // 14543
0;JMP // 14544

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

@THIS // 14545
A=M+1 // 14546
A=A+1 // 14547
D=M // 14548
D=D+M // 14549
@SP // 14550
AM=M+1 // 14551
A=A-1 // 14552
M=D // 14553
// call Array.new
@6 // 14554
D=A // 14555
@14 // 14556
M=D // 14557
@Array.new // 14558
D=A // 14559
@13 // 14560
M=D // 14561
@String.appendChar.ret.0 // 14562
D=A // 14563
@CALL // 14564
0;JMP // 14565
(String.appendChar.ret.0)
@SP // 14566
AM=M-1 // 14567
D=M // 14568
@LCL // 14569
A=M // 14570
M=D // 14571

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14572
A=M // 14573
D=M // 14574
@SP // 14575
AM=M+1 // 14576
A=A-1 // 14577
M=D // 14578
@LCL // 14579
A=M // 14580
D=M // 14581
@SP // 14582
AM=M+1 // 14583
A=A-1 // 14584
M=D // 14585
@THIS // 14586
A=M+1 // 14587
D=M // 14588
@SP // 14589
AM=M+1 // 14590
A=A-1 // 14591
M=D // 14592
// call Memory.copy
@8 // 14593
D=A // 14594
@14 // 14595
M=D // 14596
@Memory.copy // 14597
D=A // 14598
@13 // 14599
M=D // 14600
@String.appendChar.ret.1 // 14601
D=A // 14602
@CALL // 14603
0;JMP // 14604
(String.appendChar.ret.1)
@SP // 14605
M=M-1 // 14606

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14607
A=M // 14608
D=M // 14609
@SP // 14610
AM=M+1 // 14611
A=A-1 // 14612
M=D // 14613
// call Array.dispose
@6 // 14614
D=A // 14615
@14 // 14616
M=D // 14617
@Array.dispose // 14618
D=A // 14619
@13 // 14620
M=D // 14621
@String.appendChar.ret.2 // 14622
D=A // 14623
@CALL // 14624
0;JMP // 14625
(String.appendChar.ret.2)
@SP // 14626
M=M-1 // 14627

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

@THIS // 14628
A=M+1 // 14629
A=A+1 // 14630
D=M // 14631
@THIS // 14632
A=M+1 // 14633
A=A+1 // 14634
M=D+M // 14635

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14636
A=M // 14637
D=M // 14638
@THIS // 14639
A=M // 14640
M=D // 14641

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
@THIS // 14642
A=M+1 // 14643
D=M // 14644
A=A-1 // 14645
D=D+M // 14646
@SP // 14647
AM=M+1 // 14648
A=A-1 // 14649
M=D // 14650
@ARG // 14651
A=M+1 // 14652
D=M // 14653
@SP // 14654
AM=M-1 // 14655
A=M // 14656
M=D // 14657

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

@THIS // 14658
A=M+1 // 14659
M=M+1 // 14660

////PushInstruction("pointer 0")
@3 // 14661
D=M // 14662
@SP // 14663
AM=M+1 // 14664
A=A-1 // 14665
M=D // 14666
@RETURN // 14667
0;JMP // 14668

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14669
A=M // 14670
D=M // 14671
@3 // 14672
M=D // 14673

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

@THIS // 14674
A=M+1 // 14675
M=M-1 // 14676

////PushInstruction("constant 0")
@SP // 14677
AM=M+1 // 14678
A=A-1 // 14679
M=0 // 14680
@RETURN // 14681
0;JMP // 14682

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14683
M=M+1 // 14684
AM=M+1 // 14685
A=A-1 // 14686
M=0 // 14687
A=A-1 // 14688
M=0 // 14689

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14690
A=M // 14691
D=M // 14692
@3 // 14693
M=D // 14694

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14695
A=M+1 // 14696
M=1 // 14697

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14698
A=M // 14699
M=0 // 14700

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
@String.intValue.LT.3 // 14701
D=A // 14702
@SP // 14703
AM=M+1 // 14704
A=A-1 // 14705
M=D // 14706
@LCL // 14707
A=M+1 // 14708
D=M // 14709
@SP // 14710
AM=M+1 // 14711
A=A-1 // 14712
M=D // 14713
@THIS // 14714
A=M+1 // 14715
D=M // 14716
@SP // 14717
AM=M-1 // 14718
D=M-D // 14719
@DO_LT // 14720
0;JMP // 14721
(String.intValue.LT.3)
D=!D // 14722
@String.intValue_WHILE_END1 // 14723
D;JNE // 14724

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

@LCL // 14725
A=M // 14726
D=M // 14727
@SP // 14728
AM=M+1 // 14729
A=A-1 // 14730
M=D // 14731
@10 // 14732
D=A // 14733
@SP // 14734
AM=M+1 // 14735
A=A-1 // 14736
M=D // 14737
// call Math.multiply
@7 // 14738
D=A // 14739
@14 // 14740
M=D // 14741
@Math.multiply // 14742
D=A // 14743
@13 // 14744
M=D // 14745
@String.intValue.ret.0 // 14746
D=A // 14747
@CALL // 14748
0;JMP // 14749
(String.intValue.ret.0)
@THIS // 14750
A=M // 14751
D=M // 14752
@SP // 14753
AM=M+1 // 14754
A=A-1 // 14755
M=D // 14756
@LCL // 14757
A=M+1 // 14758
D=M // 14759
@SP // 14760
AM=M-1 // 14761
A=D+M // 14762
D=M // 14763
@48 // 14764
D=D-A // 14765
@SP // 14766
AM=M-1 // 14767
D=D+M // 14768
@LCL // 14769
A=M // 14770
M=D // 14771

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

@LCL // 14772
A=M+1 // 14773
M=M+1 // 14774

////GotoInstruction{label='String.intValue_WHILE_EXP1}
// goto String.intValue_WHILE_EXP1
@String.intValue_WHILE_EXP1 // 14775
0;JMP // 14776

////LabelInstruction{label='String.intValue_WHILE_END1}
// label String.intValue_WHILE_END1
(String.intValue_WHILE_END1)

////PushInstruction("local 0")
@LCL // 14777
A=M // 14778
D=M // 14779
@SP // 14780
AM=M+1 // 14781
A=A-1 // 14782
M=D // 14783
@RETURN // 14784
0;JMP // 14785

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 14786
D=A // 14787
@SP // 14788
AM=D+M // 14789
A=A-1 // 14790
M=0 // 14791
A=A-1 // 14792
M=0 // 14793
A=A-1 // 14794
M=0 // 14795
A=A-1 // 14796
M=0 // 14797
A=A-1 // 14798
M=0 // 14799
A=A-1 // 14800
M=0 // 14801

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14802
A=M // 14803
D=M // 14804
@3 // 14805
M=D // 14806

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14807
A=M+1 // 14808
M=0 // 14809

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14810
D=M // 14811
@4 // 14812
A=D+A // 14813
M=0 // 14814

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE1}}
@String.setInt.EQ.4 // 14815
D=A // 14816
@SP // 14817
AM=M+1 // 14818
A=A-1 // 14819
M=D // 14820
@ARG // 14821
A=M+1 // 14822
D=M // 14823
@DO_EQ // 14824
0;JMP // 14825
(String.setInt.EQ.4)
@String.setInt$IF_TRUE1 // 14826
D;JNE // 14827

////GotoInstruction{label='String.setInt$IF_FALSE1}
// goto String.setInt$IF_FALSE1
@String.setInt$IF_FALSE1 // 14828
0;JMP // 14829

////LabelInstruction{label='String.setInt$IF_TRUE1}
// label String.setInt$IF_TRUE1
(String.setInt$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14830
D=M // 14831
@SP // 14832
AM=M+1 // 14833
A=A-1 // 14834
M=D // 14835
@48 // 14836
D=A // 14837
@SP // 14838
AM=M+1 // 14839
A=A-1 // 14840
M=D // 14841
// call String.appendChar
@7 // 14842
D=A // 14843
@14 // 14844
M=D // 14845
@String.appendChar // 14846
D=A // 14847
@13 // 14848
M=D // 14849
@String.setInt.ret.0 // 14850
D=A // 14851
@CALL // 14852
0;JMP // 14853
(String.setInt.ret.0)
@SP // 14854
M=M-1 // 14855

////PushInstruction("constant 0")
@SP // 14856
AM=M+1 // 14857
A=A-1 // 14858
M=0 // 14859
@RETURN // 14860
0;JMP // 14861

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
@String.setInt.LT.5 // 14862
D=A // 14863
@SP // 14864
AM=M+1 // 14865
A=A-1 // 14866
M=D // 14867
@ARG // 14868
A=M+1 // 14869
D=M // 14870
@DO_LT // 14871
0;JMP // 14872
(String.setInt.LT.5)
@String.setInt$IF_TRUE2 // 14873
D;JNE // 14874

////GotoInstruction{label='String.setInt$IF_FALSE2}
// goto String.setInt$IF_FALSE2
@String.setInt$IF_FALSE2 // 14875
0;JMP // 14876

////LabelInstruction{label='String.setInt$IF_TRUE2}
// label String.setInt$IF_TRUE2
(String.setInt$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14877
D=M // 14878
@4 // 14879
A=D+A // 14880
M=1 // 14881

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
@String.setInt.LT.6 // 14882
D=A // 14883
@SP // 14884
AM=M+1 // 14885
A=A-1 // 14886
M=D // 14887
@ARG // 14888
A=M+1 // 14889
D=M // 14890
@DO_LT // 14891
0;JMP // 14892
(String.setInt.LT.6)
@SP // 14893
AM=M+1 // 14894
A=A-1 // 14895
M=D // 14896
@String.setInt.EQ.7 // 14897
D=A // 14898
@SP // 14899
AM=M+1 // 14900
A=A-1 // 14901
M=D // 14902
@ARG // 14903
A=M+1 // 14904
D=M // 14905
@32767 // 14906
D=D&A // 14907
@32767 // 14908
D=D-A // 14909
@DO_EQ // 14910
0;JMP // 14911
(String.setInt.EQ.7)
@SP // 14912
AM=M-1 // 14913
D=D&M // 14914
@String.setInt$IF_TRUE3 // 14915
D;JNE // 14916

////GotoInstruction{label='String.setInt$IF_FALSE3}
// goto String.setInt$IF_FALSE3
@String.setInt$IF_FALSE3 // 14917
0;JMP // 14918

////LabelInstruction{label='String.setInt$IF_TRUE3}
// label String.setInt$IF_TRUE3
(String.setInt$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14919
D=M // 14920
@SP // 14921
AM=M+1 // 14922
A=A-1 // 14923
M=D // 14924
@45 // 14925
D=A // 14926
@SP // 14927
AM=M+1 // 14928
A=A-1 // 14929
M=D // 14930
// call String.appendChar
@7 // 14931
D=A // 14932
@14 // 14933
M=D // 14934
@String.appendChar // 14935
D=A // 14936
@13 // 14937
M=D // 14938
@String.setInt.ret.1 // 14939
D=A // 14940
@CALL // 14941
0;JMP // 14942
(String.setInt.ret.1)
@SP // 14943
M=M-1 // 14944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14945
D=M // 14946
@SP // 14947
AM=M+1 // 14948
A=A-1 // 14949
M=D // 14950
@51 // 14951
D=A // 14952
@SP // 14953
AM=M+1 // 14954
A=A-1 // 14955
M=D // 14956
// call String.appendChar
@7 // 14957
D=A // 14958
@14 // 14959
M=D // 14960
@String.appendChar // 14961
D=A // 14962
@13 // 14963
M=D // 14964
@String.setInt.ret.2 // 14965
D=A // 14966
@CALL // 14967
0;JMP // 14968
(String.setInt.ret.2)
@SP // 14969
M=M-1 // 14970

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14971
D=M // 14972
@SP // 14973
AM=M+1 // 14974
A=A-1 // 14975
M=D // 14976
@50 // 14977
D=A // 14978
@SP // 14979
AM=M+1 // 14980
A=A-1 // 14981
M=D // 14982
// call String.appendChar
@7 // 14983
D=A // 14984
@14 // 14985
M=D // 14986
@String.appendChar // 14987
D=A // 14988
@13 // 14989
M=D // 14990
@String.setInt.ret.3 // 14991
D=A // 14992
@CALL // 14993
0;JMP // 14994
(String.setInt.ret.3)
@SP // 14995
M=M-1 // 14996

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 14997
D=M // 14998
@SP // 14999
AM=M+1 // 15000
A=A-1 // 15001
M=D // 15002
@55 // 15003
D=A // 15004
@SP // 15005
AM=M+1 // 15006
A=A-1 // 15007
M=D // 15008
// call String.appendChar
@7 // 15009
D=A // 15010
@14 // 15011
M=D // 15012
@String.appendChar // 15013
D=A // 15014
@13 // 15015
M=D // 15016
@String.setInt.ret.4 // 15017
D=A // 15018
@CALL // 15019
0;JMP // 15020
(String.setInt.ret.4)
@SP // 15021
M=M-1 // 15022

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15023
D=M // 15024
@SP // 15025
AM=M+1 // 15026
A=A-1 // 15027
M=D // 15028
@54 // 15029
D=A // 15030
@SP // 15031
AM=M+1 // 15032
A=A-1 // 15033
M=D // 15034
// call String.appendChar
@7 // 15035
D=A // 15036
@14 // 15037
M=D // 15038
@String.appendChar // 15039
D=A // 15040
@13 // 15041
M=D // 15042
@String.setInt.ret.5 // 15043
D=A // 15044
@CALL // 15045
0;JMP // 15046
(String.setInt.ret.5)
@SP // 15047
M=M-1 // 15048

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15049
D=M // 15050
@SP // 15051
AM=M+1 // 15052
A=A-1 // 15053
M=D // 15054
@56 // 15055
D=A // 15056
@SP // 15057
AM=M+1 // 15058
A=A-1 // 15059
M=D // 15060
// call String.appendChar
@7 // 15061
D=A // 15062
@14 // 15063
M=D // 15064
@String.appendChar // 15065
D=A // 15066
@13 // 15067
M=D // 15068
@String.setInt.ret.6 // 15069
D=A // 15070
@CALL // 15071
0;JMP // 15072
(String.setInt.ret.6)
@SP // 15073
M=M-1 // 15074

////PushInstruction("constant 0")
@SP // 15075
AM=M+1 // 15076
A=A-1 // 15077
M=0 // 15078
@RETURN // 15079
0;JMP // 15080

////LabelInstruction{label='String.setInt$IF_FALSE3}
// label String.setInt$IF_FALSE3
(String.setInt$IF_FALSE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15081
A=M+1 // 15082
D=-M // 15083
@ARG // 15084
A=M+1 // 15085
M=D // 15086

////LabelInstruction{label='String.setInt$IF_FALSE2}
// label String.setInt$IF_FALSE2
(String.setInt$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 15087
A=M+1 // 15088
D=M // 15089
@LCL // 15090
A=M+1 // 15091
A=A+1 // 15092
M=D // 15093

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15094
A=M+1 // 15095
A=A+1 // 15096
A=A+1 // 15097
M=0 // 15098

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
@String.setInt.GT.8 // 15099
D=A // 15100
@SP // 15101
AM=M+1 // 15102
A=A-1 // 15103
M=D // 15104
@LCL // 15105
A=M+1 // 15106
A=A+1 // 15107
D=M // 15108
@DO_GT // 15109
0;JMP // 15110
(String.setInt.GT.8)
D=!D // 15111
@String.setInt_WHILE_END1 // 15112
D;JNE // 15113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15114
A=M+1 // 15115
A=A+1 // 15116
D=M // 15117
@SP // 15118
AM=M+1 // 15119
A=A-1 // 15120
M=D // 15121
@10 // 15122
D=A // 15123
@SP // 15124
AM=M+1 // 15125
A=A-1 // 15126
M=D // 15127
// call Math.divide
@7 // 15128
D=A // 15129
@14 // 15130
M=D // 15131
@Math.divide // 15132
D=A // 15133
@13 // 15134
M=D // 15135
@String.setInt.ret.7 // 15136
D=A // 15137
@CALL // 15138
0;JMP // 15139
(String.setInt.ret.7)
@SP // 15140
AM=M-1 // 15141
D=M // 15142
@LCL // 15143
A=M+1 // 15144
A=A+1 // 15145
M=D // 15146

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

@LCL // 15147
A=M+1 // 15148
A=A+1 // 15149
A=A+1 // 15150
M=M+1 // 15151

////GotoInstruction{label='String.setInt_WHILE_EXP1}
// goto String.setInt_WHILE_EXP1
@String.setInt_WHILE_EXP1 // 15152
0;JMP // 15153

////LabelInstruction{label='String.setInt_WHILE_END1}
// label String.setInt_WHILE_END1
(String.setInt_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15154
A=M+1 // 15155
A=A+1 // 15156
A=A+1 // 15157
D=M // 15158
@SP // 15159
AM=M+1 // 15160
A=A-1 // 15161
M=D // 15162
// call Array.new
@6 // 15163
D=A // 15164
@14 // 15165
M=D // 15166
@Array.new // 15167
D=A // 15168
@13 // 15169
M=D // 15170
@String.setInt.ret.8 // 15171
D=A // 15172
@CALL // 15173
0;JMP // 15174
(String.setInt.ret.8)
@LCL // 15175
D=M // 15176
@5 // 15177
A=D+A // 15178
D=A // 15179
@R13 // 15180
M=D // 15181
@SP // 15182
AM=M-1 // 15183
D=M // 15184
@R13 // 15185
A=M // 15186
M=D // 15187

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15188
A=M+1 // 15189
M=0 // 15190

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
@String.setInt.GT.9 // 15191
D=A // 15192
@SP // 15193
AM=M+1 // 15194
A=A-1 // 15195
M=D // 15196
@ARG // 15197
A=M+1 // 15198
D=M // 15199
@DO_GT // 15200
0;JMP // 15201
(String.setInt.GT.9)
D=!D // 15202
@String.setInt_WHILE_END2 // 15203
D;JNE // 15204

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

@ARG // 15205
A=M+1 // 15206
D=M // 15207
@SP // 15208
AM=M+1 // 15209
A=A-1 // 15210
M=D // 15211
@ARG // 15212
A=M+1 // 15213
D=M // 15214
@SP // 15215
AM=M+1 // 15216
A=A-1 // 15217
M=D // 15218
@10 // 15219
D=A // 15220
@SP // 15221
AM=M+1 // 15222
A=A-1 // 15223
M=D // 15224
// call Math.divide
@7 // 15225
D=A // 15226
@14 // 15227
M=D // 15228
@Math.divide // 15229
D=A // 15230
@13 // 15231
M=D // 15232
@String.setInt.ret.9 // 15233
D=A // 15234
@CALL // 15235
0;JMP // 15236
(String.setInt.ret.9)
@10 // 15237
D=A // 15238
@SP // 15239
AM=M+1 // 15240
A=A-1 // 15241
M=D // 15242
// call Math.multiply
@7 // 15243
D=A // 15244
@14 // 15245
M=D // 15246
@Math.multiply // 15247
D=A // 15248
@13 // 15249
M=D // 15250
@String.setInt.ret.10 // 15251
D=A // 15252
@CALL // 15253
0;JMP // 15254
(String.setInt.ret.10)
@SP // 15255
AM=M-1 // 15256
D=M // 15257
@SP // 15258
AM=M-1 // 15259
D=M-D // 15260
@LCL // 15261
A=M // 15262
M=D // 15263

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
@LCL // 15264
D=M // 15265
@5 // 15266
A=D+A // 15267
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
@LCL // 15283
A=M // 15284
D=M // 15285
@48 // 15286
D=D+A // 15287
@SP // 15288
AM=M-1 // 15289
A=M // 15290
M=D // 15291

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15292
A=M+1 // 15293
D=M // 15294
@SP // 15295
AM=M+1 // 15296
A=A-1 // 15297
M=D // 15298
@10 // 15299
D=A // 15300
@SP // 15301
AM=M+1 // 15302
A=A-1 // 15303
M=D // 15304
// call Math.divide
@7 // 15305
D=A // 15306
@14 // 15307
M=D // 15308
@Math.divide // 15309
D=A // 15310
@13 // 15311
M=D // 15312
@String.setInt.ret.11 // 15313
D=A // 15314
@CALL // 15315
0;JMP // 15316
(String.setInt.ret.11)
@SP // 15317
AM=M-1 // 15318
D=M // 15319
@ARG // 15320
A=M+1 // 15321
M=D // 15322

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

@LCL // 15323
A=M+1 // 15324
M=M+1 // 15325

////GotoInstruction{label='String.setInt_WHILE_EXP2}
// goto String.setInt_WHILE_EXP2
@String.setInt_WHILE_EXP2 // 15326
0;JMP // 15327

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
@String.setInt.EQ.10 // 15328
D=A // 15329
@SP // 15330
AM=M+1 // 15331
A=A-1 // 15332
M=D // 15333
@LCL // 15334
D=M // 15335
@4 // 15336
A=D+A // 15337
D=M // 15338
D=D-1 // 15339
@DO_EQ // 15340
0;JMP // 15341
(String.setInt.EQ.10)
@String.setInt$IF_TRUE4 // 15342
D;JNE // 15343

////GotoInstruction{label='String.setInt$IF_FALSE4}
// goto String.setInt$IF_FALSE4
@String.setInt$IF_FALSE4 // 15344
0;JMP // 15345

////LabelInstruction{label='String.setInt$IF_TRUE4}
// label String.setInt$IF_TRUE4
(String.setInt$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15346
D=M // 15347
@SP // 15348
AM=M+1 // 15349
A=A-1 // 15350
M=D // 15351
@45 // 15352
D=A // 15353
@SP // 15354
AM=M+1 // 15355
A=A-1 // 15356
M=D // 15357
// call String.appendChar
@7 // 15358
D=A // 15359
@14 // 15360
M=D // 15361
@String.appendChar // 15362
D=A // 15363
@13 // 15364
M=D // 15365
@String.setInt.ret.12 // 15366
D=A // 15367
@CALL // 15368
0;JMP // 15369
(String.setInt.ret.12)
@SP // 15370
M=M-1 // 15371

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
@String.setInt.GT.11 // 15372
D=A // 15373
@SP // 15374
AM=M+1 // 15375
A=A-1 // 15376
M=D // 15377
@LCL // 15378
A=M+1 // 15379
D=M // 15380
@DO_GT // 15381
0;JMP // 15382
(String.setInt.GT.11)
D=!D // 15383
@String.setInt_WHILE_END3 // 15384
D;JNE // 15385

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

@LCL // 15386
A=M+1 // 15387
M=M-1 // 15388

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

@3 // 15389
D=M // 15390
@SP // 15391
AM=M+1 // 15392
A=A-1 // 15393
M=D // 15394
@LCL // 15395
D=M // 15396
@5 // 15397
A=D+A // 15398
D=M // 15399
@SP // 15400
AM=M+1 // 15401
A=A-1 // 15402
M=D // 15403
@LCL // 15404
A=M+1 // 15405
D=M // 15406
@SP // 15407
AM=M-1 // 15408
A=D+M // 15409
D=M // 15410
@SP // 15411
AM=M+1 // 15412
A=A-1 // 15413
M=D // 15414
// call String.appendChar
@7 // 15415
D=A // 15416
@14 // 15417
M=D // 15418
@String.appendChar // 15419
D=A // 15420
@13 // 15421
M=D // 15422
@String.setInt.ret.13 // 15423
D=A // 15424
@CALL // 15425
0;JMP // 15426
(String.setInt.ret.13)
@SP // 15427
M=M-1 // 15428

////GotoInstruction{label='String.setInt_WHILE_EXP3}
// goto String.setInt_WHILE_EXP3
@String.setInt_WHILE_EXP3 // 15429
0;JMP // 15430

////LabelInstruction{label='String.setInt_WHILE_END3}
// label String.setInt_WHILE_END3
(String.setInt_WHILE_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15431
D=M // 15432
@5 // 15433
A=D+A // 15434
D=M // 15435
@SP // 15436
AM=M+1 // 15437
A=A-1 // 15438
M=D // 15439
// call Array.dispose
@6 // 15440
D=A // 15441
@14 // 15442
M=D // 15443
@Array.dispose // 15444
D=A // 15445
@13 // 15446
M=D // 15447
@String.setInt.ret.14 // 15448
D=A // 15449
@CALL // 15450
0;JMP // 15451
(String.setInt.ret.14)
@SP // 15452
M=M-1 // 15453

////PushInstruction("constant 0")
@SP // 15454
AM=M+1 // 15455
A=A-1 // 15456
M=0 // 15457
@RETURN // 15458
0;JMP // 15459

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15460
D=A // 15461
@SP // 15462
AM=M+1 // 15463
A=A-1 // 15464
M=D // 15465
@RETURN // 15466
0;JMP // 15467

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15468
D=A // 15469
@SP // 15470
AM=M+1 // 15471
A=A-1 // 15472
M=D // 15473
@RETURN // 15474
0;JMP // 15475

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15476
D=A // 15477
@SP // 15478
AM=M+1 // 15479
A=A-1 // 15480
M=D // 15481
@RETURN // 15482
0;JMP // 15483

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: PushInstruction("constant 5")
//  pop:  PopInstruction{address=static 0}
//}

@5 // 15484
D=A // 15485
@Sys.0 // 15486
M=D // 15487

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Sys.init$IF_TRUE1}}
@Sys.init.EQ.0 // 15488
D=A // 15489
@SP // 15490
AM=M+1 // 15491
A=A-1 // 15492
M=D // 15493
@Sys.0 // 15494
D=M // 15495
@5 // 15496
D=D-A // 15497
@DO_EQ // 15498
0;JMP // 15499
(Sys.init.EQ.0)
@Sys.init$IF_TRUE1 // 15500
D;JNE // 15501

////GotoInstruction{label='Sys.init$IF_FALSE1}
// goto Sys.init$IF_FALSE1
@Sys.init$IF_FALSE1 // 15502
0;JMP // 15503

////LabelInstruction{label='Sys.init$IF_TRUE1}
// label Sys.init$IF_TRUE1
(Sys.init$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=static 0}
//}

@7 // 15504
D=A // 15505
@Sys.0 // 15506
M=D // 15507

////LabelInstruction{label='Sys.init$IF_FALSE1}
// label Sys.init$IF_FALSE1
(Sys.init$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15508
D=A // 15509
@14 // 15510
M=D // 15511
@Memory.init // 15512
D=A // 15513
@13 // 15514
M=D // 15515
@Sys.init.ret.0 // 15516
D=A // 15517
@CALL // 15518
0;JMP // 15519
(Sys.init.ret.0)
@SP // 15520
M=M-1 // 15521

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15522
D=A // 15523
@14 // 15524
M=D // 15525
@Math.init // 15526
D=A // 15527
@13 // 15528
M=D // 15529
@Sys.init.ret.1 // 15530
D=A // 15531
@CALL // 15532
0;JMP // 15533
(Sys.init.ret.1)
@SP // 15534
M=M-1 // 15535

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15536
D=A // 15537
@14 // 15538
M=D // 15539
@Screen.init // 15540
D=A // 15541
@13 // 15542
M=D // 15543
@Sys.init.ret.2 // 15544
D=A // 15545
@CALL // 15546
0;JMP // 15547
(Sys.init.ret.2)
@SP // 15548
M=M-1 // 15549

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15550
D=A // 15551
@14 // 15552
M=D // 15553
@Output.init // 15554
D=A // 15555
@13 // 15556
M=D // 15557
@Sys.init.ret.3 // 15558
D=A // 15559
@CALL // 15560
0;JMP // 15561
(Sys.init.ret.3)
@SP // 15562
M=M-1 // 15563

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15564
D=A // 15565
@14 // 15566
M=D // 15567
@Keyboard.init // 15568
D=A // 15569
@13 // 15570
M=D // 15571
@Sys.init.ret.4 // 15572
D=A // 15573
@CALL // 15574
0;JMP // 15575
(Sys.init.ret.4)
@SP // 15576
M=M-1 // 15577

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15578
D=A // 15579
@14 // 15580
M=D // 15581
@Main.main // 15582
D=A // 15583
@13 // 15584
M=D // 15585
@Sys.init.ret.5 // 15586
D=A // 15587
@CALL // 15588
0;JMP // 15589
(Sys.init.ret.5)
@SP // 15590
M=M-1 // 15591

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15592
D=A // 15593
@14 // 15594
M=D // 15595
@Sys.halt // 15596
D=A // 15597
@13 // 15598
M=D // 15599
@Sys.init.ret.6 // 15600
D=A // 15601
@CALL // 15602
0;JMP // 15603
(Sys.init.ret.6)
@SP // 15604
M=M-1 // 15605

////PushInstruction("constant 0")
@SP // 15606
AM=M+1 // 15607
A=A-1 // 15608
M=0 // 15609
@RETURN // 15610
0;JMP // 15611

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 15612
@Sys.halt_WHILE_END1 // 15613
D;JNE // 15614

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 15615
0;JMP // 15616

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 15617
AM=M+1 // 15618
A=A-1 // 15619
M=0 // 15620
@RETURN // 15621
0;JMP // 15622

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15623
AM=M+1 // 15624
A=A-1 // 15625
M=0 // 15626

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
@Sys.wait.GT.1 // 15627
D=A // 15628
@SP // 15629
AM=M+1 // 15630
A=A-1 // 15631
M=D // 15632
@ARG // 15633
A=M // 15634
D=M // 15635
@DO_GT // 15636
0;JMP // 15637
(Sys.wait.GT.1)
D=!D // 15638
@Sys.wait_WHILE_END1 // 15639
D;JNE // 15640

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

@ARG // 15641
A=M // 15642
M=M-1 // 15643

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15644
D=A // 15645
@LCL // 15646
A=M // 15647
M=D // 15648

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
@Sys.wait.GT.2 // 15649
D=A // 15650
@SP // 15651
AM=M+1 // 15652
A=A-1 // 15653
M=D // 15654
@LCL // 15655
A=M // 15656
D=M // 15657
@DO_GT // 15658
0;JMP // 15659
(Sys.wait.GT.2)
D=!D // 15660
@Sys.wait_WHILE_END2 // 15661
D;JNE // 15662

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

@LCL // 15663
A=M // 15664
M=M-1 // 15665

////GotoInstruction{label='Sys.wait_WHILE_EXP2}
// goto Sys.wait_WHILE_EXP2
@Sys.wait_WHILE_EXP2 // 15666
0;JMP // 15667

////LabelInstruction{label='Sys.wait_WHILE_END2}
// label Sys.wait_WHILE_END2
(Sys.wait_WHILE_END2)

////GotoInstruction{label='Sys.wait_WHILE_EXP1}
// goto Sys.wait_WHILE_EXP1
@Sys.wait_WHILE_EXP1 // 15668
0;JMP // 15669

////LabelInstruction{label='Sys.wait_WHILE_END1}
// label Sys.wait_WHILE_END1
(Sys.wait_WHILE_END1)

////PushInstruction("constant 0")
@SP // 15670
AM=M+1 // 15671
A=A-1 // 15672
M=0 // 15673
@RETURN // 15674
0;JMP // 15675

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15676
A=M // 15677
D=M // 15678
@SP // 15679
AM=M+1 // 15680
A=A-1 // 15681
M=D // 15682
// call Output.printInt
@6 // 15683
D=A // 15684
@14 // 15685
M=D // 15686
@Output.printInt // 15687
D=A // 15688
@13 // 15689
M=D // 15690
@Sys.error.ret.0 // 15691
D=A // 15692
@CALL // 15693
0;JMP // 15694
(Sys.error.ret.0)
@SP // 15695
M=M-1 // 15696

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15697
D=A // 15698
@14 // 15699
M=D // 15700
@Output.println // 15701
D=A // 15702
@13 // 15703
M=D // 15704
@Sys.error.ret.1 // 15705
D=A // 15706
@CALL // 15707
0;JMP // 15708
(Sys.error.ret.1)
@SP // 15709
M=M-1 // 15710

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15711
D=A // 15712
@14 // 15713
M=D // 15714
@Sys.halt // 15715
D=A // 15716
@13 // 15717
M=D // 15718
@Sys.error.ret.2 // 15719
D=A // 15720
@CALL // 15721
0;JMP // 15722
(Sys.error.ret.2)
@SP // 15723
M=M-1 // 15724

////PushInstruction("constant 0")
@SP // 15725
AM=M+1 // 15726
A=A-1 // 15727
M=0 // 15728
@RETURN // 15729
0;JMP // 15730

